const express = require('express');
const { Sequelize, DataTypes } = require('sequelize');

const app = express();
app.use(express.json());

const sequelize = new Sequelize({
    dialect: 'sqlite',
    storage: 'database.db', 
  });

const Reader = sequelize.define('Reader', {
    firstName: {
        type: DataTypes.STRING,
        allowNull: false,
    },
    lastName: {
        type: DataTypes.STRING,
        allowNull: false,
    },
    email: {
        type: DataTypes.STRING,
        allowNull: false,
        unique: true,
        validate: {
            isEmail: true,
        },
    },
});

const Book = sequelize.define('Book', {
    title: {
        type: DataTypes.STRING,
        allowNull: false,
    },
    author: {
        type: DataTypes.STRING,
        allowNull: false,
    },
    publicationYear: {
        type: DataTypes.INTEGER,
    },
});

//relation  //helper middleware function
const Assignment = sequelize.define('Assignment', {
    status: {
        type: DataTypes.STRING,
        allowNull: false,
        defaultValue: 'borrowed', // Default status is 'borrowed'
    },
});

// Define the many-to-many relationship
Reader.belongsToMany(Book, { through: Assignment });
Book.belongsToMany(Reader, { through: Assignment });


// Method to create a new reader
app.post('/readers', async (req, res) => {
    try {
        const { firstName, lastName, email } = req.query;
        const newReader = await Reader.create({
            firstName,
            lastName,
            email,
        });
        res.status(201).json(newReader);
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Internal Server Error' });
    }
});




// Method to create a new book
app.post('/books', async (req, res) => {
    try {
        const { title, author, publicationYear } = req.query;
        const newBook = await Book.create({
            title,
            author,
            publicationYear,
        });
        res.status(201).json(newBook);
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Internal Server Error' });
    }
});

// Method to assign a book to a reader with status 'borrowed'
app.post('/assignBook', async (req, res) => {
    try {
        const { readerId, bookId } = req.query;

        // Find the reader by ID
        const reader = await Reader.findByPk(readerId);

        if (!reader) {
            return res.status(404).json({ error: 'Reader not found.' });
        }

        // Find the book by ID
        const book = await Book.findByPk(bookId);

        if (!book) {
            return res.status(404).json({ error: 'Book not found.' });
        }

        // Create an assignment with the default status 'borrowed'
        await reader.addBook(book, { through: { status: 'borrowed' } });

        res.status(200).json({ success: true, message: 'Book successfully assigned.' });
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Internal Server Error' });
    }
});



// Method to update the status of a book to "returned" using PUT
app.put('/return-book', async (req, res) => {
    try {
        const { readerId, bookId } = req.query;
        const reader = await Reader.findByPk(readerId);

        if (!reader) {
            return res.status(404).json({ error: 'Reader not found' });
        }

        const book = await Book.findByPk(bookId);

        if (!book) {
            return res.status(404).json({ error: 'Book not found' });
        }

        const association = await reader.getBooks({
            where: { id: bookId },
        });

        if (association.length === 0) {
            return res.status(404).json({ error: 'Book not found in the reader\'s list' });
        }

        // Find the specific association record to update the status
        const associationRecord = association[0].Assignment;

        // Update the status to 'returned'
        await associationRecord.update({ status: 'returned' });

        res.status(200).json({ message: 'Book status updated to returned successfully' });
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Internal Server Error' });
    }
});


// Method to get all data of a user with assigned books
app.get('/user/:userId', async (req, res) => {
    try {
        const userId = req.params.userId;
        const user = await Reader.findByPk(userId, {
            include: [{
                model: Book,
                attributes: ['id', 'title', 'author', 'publicationYear'],
                through: { attributes: ['status'] },
            }],
        });

        if (!user) {
            return res.status(404).json({ error: 'User not found' });
        }

        res.status(200).json(user);
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Internal Server Error' });
    }
});

// Method to get a single book using userId and bookId
app.get('/user/:userId/book/:bookId', async (req, res) => {
    try {
        const { userId, bookId } = req.params;
        const user = await Reader.findByPk(userId);

        if (!user) {
            return res.status(404).json({ error: 'User not found' });
        }

        const book = await Book.findByPk(bookId, {
            attributes: ['id', 'title', 'author', 'publicationYear'],
            include: [{
                model: Reader,
                where: { id: userId },
                through: { attributes: ['status'] },
            }],
        });

        if (!book) {
            return res.status(404).json({ error: 'Book not found for the user' });
        }

        res.status(200).json(book);
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Internal Server Error' });
    }
});

// Sync the models with the database and start the server
sequelize.sync().then(() => {
    app.listen(3000, () => {
        console.log('Server is running on port 3000');
    });
});
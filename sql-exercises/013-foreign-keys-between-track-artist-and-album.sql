-- Author: Forkan Hossain <forkan.hossain@tuni.fi>
-- Date: 2023-11-07
-- File: 013-foreign-keys-between-track-singer-and-album.sql

CREATE TABLE users
(
    user_id          INTEGER         NOT NULL UNIQUE
    , username       VARCHAR(30)

    , CONSTRAINT users_id_pk
    PRIMARY KEY (user_id)
);

CREATE TABLE posts
(
    post_id          INTEGER         NOT NULL UNIQUE
    , title          VARCHAR(30)
    , user_id        INTEGER         NOT NULL

    , CONSTRAINT posts_id_pk
    PRIMARY KEY (post_id)

    , CONSTRAINT posts_user_fk
    FOREIGN KEY (user_id)
    REFERENCES users (user_id)
);

CREATE TABLE categories
(
    category_id      INTEGER          NOT NULL UNIQUE
    , name           VARCHAR(30)

    , CONSTRAINT categories_id_pk
    PRIMARY KEY (category_id)
);

CREATE TABLE Post_Category
(
    post_id          INTEGER         NOT NULL
    , category_id    INTEGER         NOT NULL

    , CONSTRAINT Post_Category_pk
    PRIMARY KEY (post_id, category_id)

    , CONSTRAINT Post_Category_post_fk
    FOREIGN KEY (post_id)
    REFERENCES posts (post_id)

    , CONSTRAINT Post_Category_category_fk
    FOREIGN KEY (category_id)
    REFERENCES categories (category_id)
);

-- Inserting data with correct references
INSERT INTO users (user_id, username) VALUES (1, 'Alice');
INSERT INTO posts (post_id, title, user_id) VALUES (1, 'Introduction', 1);
INSERT INTO categories (category_id, name) VALUES (1, 'Technology');
INSERT INTO Post_Category (post_id, category_id) VALUES (1, 1);


-- End of file

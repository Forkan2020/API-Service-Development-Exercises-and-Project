-- Author: Forkan Hossain <forkan.hossain@tuni.fi>
-- Date: 2023-11-07
-- File: 022-domain-constraints-in-product-table.sql

-- Create a product table
CREATE TABLE products
(
    product_id          INTEGER         NOT NULL UNIQUE
    , product_name      VARCHAR(50)     CHECK(LENGTH(product_name) > 4)             NOT NULL
    , product_description VARCHAR(50)   CHECK(LENGTH(product_description) > 4)      NOT NULL
    , product_weight    REAL            CHECK(product_weight > 0)                   NOT NULL
    , product_selling_price REAL        CHECK(product_selling_price > 0)            NOT NULL
    , product_net_price REAL           CHECK(product_net_price < product_selling_price) NOT NULL

    , CONSTRAINT products_pk
    PRIMARY KEY (product_id)
);

INSERT INTO products
    (product_name, product_description, product_weight, product_selling_price, product_net_price)
VALUES
    ('PuzzleMaster', 'Interactive puzzle', 0.5, 15, 2)
;

INSERT INTO products
    (product_name, product_description, product_weight, product_selling_price, product_net_price)
VALUES
    ('Puz', 'Interactive puzzle', 0.5, 15, 2)
;

INSERT INTO products
    (product_name, product_description, product_weight, product_selling_price, product_net_price)
VALUES
    ('PuzzleMaster', 'Puz', 0.5, 15, 2)
;

INSERT INTO products
    (product_name, product_description, product_weight, product_selling_price, product_net_price)
VALUES
    ('PuzzleMaster', 'Interactive puzzle', -5, 15, 2)
;

INSERT INTO products
    (product_name, product_description, product_weight, product_selling_price, product_net_price)
VALUES
    ('PuzzleMaster', 'Interactive puzzle', 0.5, -15, 2)
;

INSERT INTO products
    (product_name, product_description, product_weight, product_selling_price, product_net_price)
VALUES
    ('PuzzleMaster', 'Interactive puzzle', 0.5, 15, 20)
;

-- End of file

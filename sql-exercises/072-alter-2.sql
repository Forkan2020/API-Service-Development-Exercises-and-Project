-- Author: Forkan Hossain <forkan.hossain@tuni.fi>
-- Date: 2023-11-20
-- File: 072-alter-2.sql

ALTER TABLE products
RENAME TO products_old;

CREATE TABLE products (
    product_id          SERIAL          NOT NULL UNIQUE,
    product_name        VARCHAR(100)    NOT NULL,
    unit_price          INTEGER         NOT NULL,
    description         VARCHAR(100),

    CONSTRAINT products_id_pk
    PRIMARY KEY (product_id)
);

INSERT INTO products (product_name, unit_price, description)
SELECT product_name, unit_price, description FROM products_old;


DROP TABLE products_old;


-- End of file

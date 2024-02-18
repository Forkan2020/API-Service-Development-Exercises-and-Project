-- Author: Forkan Hossain <forkan.hossain@tuni.fi>
-- Date: 2023-11-19
-- File: 071-alter-1.sql

-- Create and insert data for TABLE inventory

-- Create the initial 'stock' table


CREATE TABLE stock_data
(
    stock_id            SERIAL          PRIMARY KEY,
    product_name        VARCHAR(30),
    unit_price          INTEGER         NOT NULL,
    description         VARCHAR(500)

);

INSERT INTO stock_data
    (product_name, unit_price, description)
VALUES
    ('keyboard', 50, 'Mechanical gaming keyboard'),
    ('monitor', 300, '27-inch HD display'),
    ('mouse', 20, 'Wireless optical mouse');

ALTER TABLE stock_data
RENAME TO stock_old;

CREATE TABLE stock_data (
    stock_id            SERIAL          PRIMARY KEY,
    product_name        VARCHAR(100),
    unit_price          INTEGER         NOT NULL,
    description         VARCHAR(200)

);
INSERT INTO stock_data (product_name, unit_price, description)
SELECT product_name, unit_price, description FROM stock_old;

DROP TABLE stock_old;


-- End of file

-- Author: Forkan Hossain <forkan.hossain@tuni.fi>
-- Date: 2023-11-11
-- File: 033-index-phone.sql

CREATE TABLE customer_data
(
    customer_id     INTEGER         NOT NULL UNIQUE,
    phone_number    NUMERIC(30,0)   NOT NULL,
    customer_comment VARCHAR(50),
    
    CONSTRAINT customer_id_pk PRIMARY KEY (customer_id)
);

INSERT INTO customer_data (customer_id, phone_number, customer_comment)
SELECT id, phone, comment
FROM customer;

ALTER TABLE customer RENAME TO customer_old;

ALTER TABLE customer_data RENAME TO customer;

CREATE INDEX customer_phone_index ON customer (phone_number);


-- End of file

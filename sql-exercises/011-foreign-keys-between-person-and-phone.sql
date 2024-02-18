-- Author: Forkan Hossain <forkan.hossain@tuni.fi>
-- Date: 2023-11-07
-- File: 011-foreign-keys-between-person-and-phone.sql


CREATE TABLE contact
(
    contact_id          INTEGER         NOT NULL UNIQUE
    , first_name        VARCHAR(20)
    , last_name         VARCHAR(20)
    , phone_number      INTEGER         NOT NULL  

    , CONSTRAINT contact_id_pk
    PRIMARY KEY (contact_id)

    , CONSTRAINT contact_phone_fk
    FOREIGN KEY (phone_number)
    REFERENCES phone_directory (directory_id)
);

CREATE TABLE phone_directory
(
    directory_id        INTEGER NOT NULL UNIQUE
    , phone_number     VARCHAR(50)
    , description      VARCHAR(50)

    , CONSTRAINT directory_id_pk
    PRIMARY KEY (directory_id)
);

INSERT INTO phone_directory (directory_id, phone_number, description)
VALUES (1, '+1 555 123', 'home');

INSERT INTO contact (contact_id, first_name, last_name, phone_number)
VALUES (1, 'John', 'Doe', 1);

-- End of file

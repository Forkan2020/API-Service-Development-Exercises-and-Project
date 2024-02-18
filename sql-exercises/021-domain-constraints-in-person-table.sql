-- Author: Forkan Hossain <forkan.hossain@tuni.fi>
-- Date: 2023-11-07
-- File: 021-domain-constraints-in-person-table.sql

CREATE TABLE person_info
(
    person_id       INTEGER         NOT NULL UNIQUE,
    full_name       VARCHAR(50),
    contact_number  NUMERIC(30,0)   NOT NULL CHECK(LENGTH(CAST(contact_number AS VARCHAR)) > 5),
    date_of_birth   DATE            CHECK(date_of_birth > '1930-01-01'),

    CONSTRAINT person_info_pk PRIMARY KEY (person_id),
    CONSTRAINT contact_number_fk FOREIGN KEY (contact_number) REFERENCES phone_book(id)
);

INSERT INTO person_info (person_id, full_name, contact_number, date_of_birth) VALUES
    (1, 'John Doe', 123456789, '1980-08-15'); 

-- End of file

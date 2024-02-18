-- Author: Forkan Hossain <forkan.hossain@tuni.fi>
-- Date: 2023-11-10
-- File: 031-index-person-1.sql

-- Create a new table named 'people'


CREATE TABLE people
(
    person_id   INTEGER     NOT NULL UNIQUE,
    first_name  VARCHAR(20) NOT NULL,
    last_name   VARCHAR(20) NOT NULL,
    phone_number NUMERIC(30,0) NOT NULL,

    CONSTRAINT people_id_pk PRIMARY KEY (person_id),
    CONSTRAINT people_phone_fk FOREIGN KEY (phone_number) REFERENCES phones (id)
);
INSERT INTO people (person_id, first_name, last_name, phone_number)
SELECT id, first, last, phone
FROM persons;

ALTER TABLE persons RENAME TO old_persons;

ALTER TABLE people RENAME TO persons;

CREATE INDEX people_first_name_index ON persons (first_name);


-- End of file

-- Author: Forkan Hossain <forkan.hossain@tuni.fi>
-- Date: 2023-11-21
-- File: 073-alter-3.sql
-- Step 1: Rename the existing table to '_old'

ALTER TABLE kawkaw
RENAME TO kawkaw_old;

CREATE TABLE kawkaw (
    id                  INTEGER         NOT NULL UNIQUE,
    item              VARCHAR(100),    
    worth             INTEGER         NOT NULL,
    comment           VARCHAR(100),

    CONSTRAINT kawkaw_id_pk
    PRIMARY KEY (id)
);

INSERT INTO kawkaw (item, worth, comment)
SELECT item, worth, comment FROM kawkaw_old;

DROP TABLE kawkaw_old;


-- End of file

-- Author: Forkan Hossain <forkan.hossain@tuni.fi>
-- Date: 2023-11-09
-- File: 024-domain-constraints-in-course-table.sql



CREATE TABLE training_program
(
    program_id          INTEGER         NOT NULL UNIQUE,
    credit_hours        INTEGER         NOT NULL CHECK(credit_hours BETWEEN 1 AND 30),
    start_date          DATE,
    duration_in_weeks   INTEGER         NOT NULL CHECK(duration_in_weeks > 0),
    program_details     VARCHAR(50)     NOT NULL,

    CONSTRAINT training_program_pk PRIMARY KEY (program_id)
);

INSERT INTO training_program
    (credit_hours, duration_in_weeks, program_details)
VALUES
    (8, 10, 'Introduction to Programming');

INSERT INTO training_program
    (credit_hours, duration_in_weeks, program_details)
VALUES
    (35, 10, 'Introduction to Programming');

INSERT INTO training_program
    (credit_hours, duration_in_weeks, program_details)
VALUES
    (8, -5, 'Introduction to Programming');

-- End of file

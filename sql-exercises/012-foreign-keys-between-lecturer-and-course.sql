-- Author: Forkan Hossain <forkan.hossain@tuni.fi>
-- Date: 2023-11-07
-- File: 012-foreign-keys-between-lecturer-and-course.sql


CREATE TABLE employee
(
    emp_id              INTEGER         NOT NULL UNIQUE,
    emp_name            VARCHAR(30),
    emp_department      INTEGER         NOT NULL,

    CONSTRAINT emp_id_pk PRIMARY KEY (emp_id),
    CONSTRAINT emp_department_fk FOREIGN KEY (emp_department) REFERENCES department (dep_id)
);

CREATE TABLE department
(
    dep_id              INTEGER         NOT NULL UNIQUE,
    dep_name            VARCHAR(30),
    dep_location        VARCHAR(50),

    CONSTRAINT department_id_pk PRIMARY KEY (dep_id)
);

INSERT INTO employee (emp_id, emp_name, emp_department)
VALUES (1, 'John Doe', 1);

INSERT INTO department (dep_id, dep_name, dep_location)
VALUES (1, 'R&D', 'Tampere');

INSERT INTO employee (emp_id, emp_name, emp_department)
VALUES (2, 'Jane Smith', 1);

-- End of file

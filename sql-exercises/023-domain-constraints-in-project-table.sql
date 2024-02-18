-- Author: Forkan Hossain <forkan.hossain@tuni.fi>
-- Date: 2023-11-08
-- File: 023-domain-constraints-in-project-table.sql


CREATE TABLE project
(
    project_id          INTEGER         NOT NULL UNIQUE,
    project_name        VARCHAR(30)     NOT NULL CHECK(CHAR_LENGTH(project_name) > 5),
    manager_name        VARCHAR(30)     NOT NULL CHECK(CHAR_LENGTH(manager_name) > 5),
    manager_phone       NUMERIC(30, 0),
    manager_job_title   VARCHAR(50)     NOT NULL CHECK(
        manager_job_title IN ('sales boss', 'office boss', 'facilities boss', 'business boss')
    ),

    CONSTRAINT project_id_pk PRIMARY KEY (project_id)
);

INSERT INTO project
    (project_id, project_name, manager_name, manager_job_title)
VALUES
    (1, 'Forkan', 'Lara Croft', 'office boss');

INSERT INTO project
    (project_id, project_name, manager_name, manager_job_title)
VALUES
    (2, 'Toy', 'Lara Croft', 'office boss');

INSERT INTO project
    (project_id, project_name, manager_name, manager_job_title)
VALUES
    (3, 'Forkan', 'Smith', 'office boss');

INSERT INTO project
    (project_id, project_name, manager_name, manager_job_title)
VALUES
    (4, 'Forkan', 'Lara Croft', 'research boss');

-- End of file

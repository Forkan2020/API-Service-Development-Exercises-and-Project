-- Author: Forkan Hossain <forkan.hossain@tuni.fi>
-- Date: 2023-11-12
-- File: 041-index-team-1.sql

CREATE TABLE team (
    id              INTEGER         NOT NULL UNIQUE,
    coach_last      VARCHAR(20),
    coach_first     VARCHAR(20),
    team_name       VARCHAR(20)     NOT NULL,
    owner           VARCHAR(20)     NOT NULL,
    CONSTRAINT team_id_pk PRIMARY KEY (id)
);

INSERT INTO team (coach_last, coach_first, team_name, owner)
VALUES
    ('Forkan', 'Kawkaw', 'Mohamedan', 'owner1'),
    ('Forkan', 'Lalu', 'Dhaka', 'owner2'),
    ('Vomor', 'Hossain', 'Barishal', 'owner3');

CREATE INDEX team__name_index ON team (team_name);


-- End of file

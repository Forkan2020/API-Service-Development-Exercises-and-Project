-- Author: Forkan Hossain <forkan.hossain@tuni.fi>
-- Date: 2023-11-14
-- File: 051-index-weather-1.sql
CREATE TABLE climate_data
(
    data_id             SERIAL          PRIMARY KEY,
    timestamp_reading  TIMESTAMP       NOT NULL,
    temperature_high   INTEGER         NOT NULL,
    temperature_low    INTEGER         NOT NULL,
    data_collector     VARCHAR(20),
    observation        VARCHAR(1000)
);

INSERT INTO climate_data
    (timestamp_reading, temperature_high, temperature_low, data_collector, observation)
VALUES
    ('2000-12-11 11:00:00', 5, 2, 'Alice', 'Snow-rain for a while'),
    ('2000-12-12 11:00:00', 4, 3, 'Bob', 'Strong wind'),
    ('2000-12-15 11:00:00', 2, 0, 'Charlie', 'Night was cold and misty'),
    ('2000-12-14 10:00:00', 7, 12, 'David', 'Rainy day');

CREATE INDEX climate_data_timestamp_index
ON climate_data (timestamp_reading);


-- End of file

-- Author: Forkan Hossain <forkan.hossain@tuni.fi>
-- Date: 2023-11-15
-- File: 043-index-team-remove.sql



DROP INDEX IF EXISTS climate_data__low_index;

DROP INDEX IF EXISTS climate_data__high_index;

DROP INDEX IF EXISTS climate_data__timestamp_index;



-- End of file

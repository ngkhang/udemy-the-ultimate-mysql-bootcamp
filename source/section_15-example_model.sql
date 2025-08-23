-- View Models
SELECT
  @ @GLOBAL.sql_mode;

SELECT
  @ @SESSION.sql_mode;

-- Set models
SET
  GLOBAL sql_model = 'models';

SET
  SESSIOn sql_mode = 'models';
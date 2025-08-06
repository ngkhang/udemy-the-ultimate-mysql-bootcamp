-- Section 03 - Practice 01
-- Create a pastries table
-- It should include 2 columns: name and quantity.  Name is 50 characters max.
-- Inspect your table/columns in the CLI
-- Delete your table!
CREATE TABLE pastries(
  name VARCHAR(50),
  quantity INT
);

SHOW TABLES;
DESC pastries;
DROP TABLE pastries;

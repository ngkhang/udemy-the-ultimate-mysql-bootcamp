-- Show all tables
SHOW TABLES;

-- Show table structure
SHOW COLUMNS FROM cats;
DESC cats; -- Or DESCRIBE cats;

-- Create a new table
CREATE TABLE cats(
  name VARCHAR(50),
  age INT
);

CREATE TABLE dogs(
  name VARCHAR(50),
  breed VARCHAR(50),
  age INT
);

-- Delete table
DROP TABLE dogs;

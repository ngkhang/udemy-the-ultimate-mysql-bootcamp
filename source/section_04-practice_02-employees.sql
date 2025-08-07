-- Define an Employees table, with the following fields:
--    id - number(automatically increments) and primary key
--    last_name - text, mandatory
--    first_name - text, mandatory
--    middle_name - text, not mandatory
--    age - number mandatory
--    current_status - text, mandatory, defaults to 'employed'

CREATE TABLE employees (
  id INT AUTO_INCREMENT,
  last_name VARCHAR(100) NOT NULL,
  first_name VARCHAR(100) NOT NULL,
  middle_name VARCHAR(100),
  age INT NOT NULL,
  current_status VARCHAR(100) NOT NULL DEFAULT 'employed',

  PRIMARY KEY (id)
);

INSERT INTO employees (firs_name, last_name, age)
VALUES ('Smith', 'John', 58);

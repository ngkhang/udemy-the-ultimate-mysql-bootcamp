-- Create a people table
--    first_name - 20 char limit
--    last_name - 20 char limit
--    age
-- Insert Your 1st Person: 'Tina'	'Belcher'	13
-- Insert Your 1st Person: 'Bob'	'Belcher'	42
-- Multiple Insert:
--    'Linda'	'Belcher'	45
--    'Phillip'	'Frond'	38
--    'Calvin'	'Fischoeder'	70

CREATE TABLE people (
      first_name VARCHAR(20),
      last_name VARCHAR(20),
      age INT
  );

INSERT INTO people (first_name, last_name, age)
VALUES ('Tina', 'Belcher', 13);

INSERT INTO people (first_name, last_name, age)
VALUES ('Bob', 'Belcher',	42);


INSERT INTO people (first_name, last_name, age)
VALUES ('Linda', 'Belcher', 45),
       ('Phillip', 'Frond', 38),
       ('Calvin', 'Fischoeder', 70);

DROP TABLE people;

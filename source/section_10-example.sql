-- Example: String and Number data types
CREATE TABLE user_profiles (
  username VARCHAR(100),
  age INT,
  salary DECIMAL(10, 2),
  city_code CHAR(2)
);

-- Example: Date and Time data types
CREATE TABLE people (
  name VARCHAR(150),
  birthday DATE,
  birthday_time TIME,
  birthday_dt DATETIME
);

-- Insert manual
-- INSERT INTO people (name, birthdate, birthday_time, birthday_dt)
-- VALUES ('Elton', '2000-12-25', '11:00:00', '2000-12-25 11:00:00');
-- INSERT INTO people (name, birthdate, birthday_time, birthday_dt)
-- VALUES ('Lulu', '1985-04-11', '9:45:10', '1985-04-11 9:45:10');
-- INSERT INTO people (name, birthdate, birthday_time, birthday_dt)
-- VALUES ('Juan', '2020-08-15', '23:59:00', '2020-08-15 23:59:00');
--
-- Example: Insert date and time using date and time functions
INSERT INTO
  people (name, birthdate, birthday_time, birthday_dt)
VALUES
  ('Khang Nguyen', CURDATE(), CURTIME(), NOW());

-- Example: Date functions
SELECT
  birthdate,
  DAY(birthdate),
  DAYOFWEEK(birthdate),
  MONTHNAME(birthdate),
  YER(birthdate)
FROM
  people;

-- Example: Time functions
SELECT
  birthday_time,
  HOUR(birthday_time),
  MINUTE(birthday_time),
  SECOND(birthday_time)
FROM
  people;

-- Example: Format date
SELECT
  birthday,
  DATE_FORMAT(birthday, '%a %b %D')
FROM
  people;

SELECT
  birth_dt,
  DATE_FORMAT(birth_dt, '%H:%i')
FROM
  people;

-- Example: Date math
SELECT
  DATEDIFF(NOW(), birthdate),
  TIMEDIFF(NOW(), birthday_time),
  TIMESTAMPDIFF(MONTH, birthdate, NOW())
FROM
  people;

SELECT
  ADDDATE(CURDATE(), 30),
  SUBDATE(CURDATE(), 365);

SELECT
  DATE_ADD(CURDATE(), INTERVAL 1 MONTH),
  DATE_SUB(CURDATE(), INTERVAL 1 YEAR);

SELECT
  TIMESTAMPADD(HOUR, 1, CURTIME()),
  TIMESTAMPSUB(YEAR, 1, NOW());

-- Example: Default and on update timestamp
CREATE TABLE captions (
  text VARCHAR(150),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
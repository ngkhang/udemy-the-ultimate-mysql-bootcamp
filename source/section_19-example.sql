-- Initial
DROP DATABASE db_triggers IF EXISTS;

CREATE DATABASE db_triggers;

USE db_triggers;

CREATE TABLE
  users (username VARCHAR(100), age INT);

INSERT INTO
  users (username, age)
VALUES
  ("Bobby", 23);

DELIMITER $$
CREATE TRIGGER must_be_adult
     BEFORE INSERT ON users FOR EACH ROW
     BEGIN
          IF NEW.age < 18
          THEN
              SIGNAL SQLSTATE '45000'
                    SET MESSAGE_TEXT = 'Must be an adult!';
          END IF;
     END;
$$
DELIMITER;

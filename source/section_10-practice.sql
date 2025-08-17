-- Q1: What's a good use case for CHAR?
-- Answer: Used for text that we know has a fixed length
--    e.g. State abbreviations, abbreviated company names, etc.
-- Q2: Fill in the blank:
-- CREATE TABLE inventory (
--   item_name ____,
--   price ____,
--   quantity ____
-- );
CREATE TABLE inventory (
  item_name VARCHAR(100),
  price DECIMAL(8, 2),
  quantity INT
);

-- Q3: What's the difference between DATETIME and TIMESTAMP?
-- Answer: They both store datetime information, but there's a difference in the range
--    TIMESTAMP has a smaller range. TIMESTAMP also takes up less space.
--    TIMESTAMP is used for things like meta-data about when something is created or updated
-- Q4: Print out the current time
SELECT
  CURTIME();

-- Q5: Print out the current date (but not time)
SELECT
  CURDATE();

-- Q6: Print out the current day of the week (the number)
SELECT
  DAYOFWEEK(CURDATE());

SELECT
  DAYOFWEEK(NOW());

SELECT
  DATE_FORMAT(NOW(), '%w') + 1;

-- Q7: Print out the current day of the week (the name)
SELECT
  DAYNAME(NOW());

SELECT
  DATE_FORMAT(NOW(), '%W');

-- Q8: Print out the current day and time using this format: mm/dd/yyyy
SELECT
  DATE_FORMAT(NOW(), '%mm/%dd/%yyyy');

-- Q9: Print out the current day and time using this format: January 2nd at 3:15
SELECT
  DATE_FORMAT(NOW(), '%M %D at %H:%i');

-- Q10: Create a tweets table that stories: the tweet content, a username, time it was created
CREATE TABLE tweets (
  content VARCHAR(180),
  username VARCHAR(20),
  created_at TIMESTAMP DEFAULT NOW()
)
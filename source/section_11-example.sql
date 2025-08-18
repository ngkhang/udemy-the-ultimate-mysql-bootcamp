-- Not equal
SELECT
  *
FROM
  books
WHERE
  released_year != 2017;

SELECT
  *
FROM
  books
WHERE
  released_year <> 1975;

-- LIKE and NOT LIKE
SELECT
  *
FROM
  books
WHERE
  title LIKE '%';

SELECT
  *
FROM
  books
WHERE
  title LIKE 'da%';

SELECT
  *
FROM
  books
WHERE
  title NOT LIKE '%the%';

-- Greater/Less
SELECT
  *
FROM
  books
WHERE
  pages > 500;

SELECT
  *
FROM
  books
WHERE
  released_year < 2000;

SELECT
  *
FROM
  books
WHERE
  released_year <= 1975;

SELECT
  *
FROM
  books
WHERE
  pages >= 300;

-- Logical: AND
SELECT
  title,
  CONCAT(author_fname, ' ', author_lname) AS author
FROM
  books
WHERE
  released_year > 2010
  AND author = 'Dave Eggers';

SELECT
  title,
  pages
FROM
  books
WHERE
  CHAR_LENGTH(title) >= 15
  AND pages > 500;

-- Logical: OR
SELECT
  title,
  released_year
FROM
  books
WHERE
  author_lname = 'Eggers'
  OR title LIKE '%novel%';

-- Logical: BETWEEN ... AND ...
SELECT
  *
FROM
  books
WHERE
  released_year BETWEEN 1975
  AND 2000;

SELECT
  *
FROM
  books
WHERE
  pages NOT BETWEEN 150
  AND 250;

-- Compare Date time
SELECT
  *
FROM
  people
WHERE
  birthday_time BETWEEN CAST('9:00:00' AS TIME)
  AND CAST('11:00:00' AS TIME);

SELECT
  *
FROM
  people
WHERE
  HOUR(birthday_time) = 8;

-- IN, NOT IN and Modulo
SELECT
  *
FROM
  books
WHERE
  author_lname IN('Carver', 'Lahiri', 'Smith');

SELECT
  *
FROM
  books
WHERE
  released_year NOT IN(2000, 1975);

SELECT
  *
FROM
  books
WHERE
  released_year <= 1975
  AND released_year % 2 = 0;

-- CASE ... END
SELECT
  title,
  CASE
    WHEN released_year <= 1975 THEN 'Pre-75'
    ELSE 'Post-75'
  END AS
FROM
  books;

-- IS NULL and IS NOT NULL
SELECT
  *
FROM
  books
WHERE
  author_lname IS NOT NULL;

SELECT
  *
FROM
  books
WHERE
  pages IS NULL;
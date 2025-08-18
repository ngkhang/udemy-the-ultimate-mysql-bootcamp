-- Q1: Evaluate the following
-- 0
SELECT
  10 != 10;

-- 1
SELECT
  15 > 14
  AND 99 - 5 <= 94;

--1
SELECT
  1 IN (5, 3)
  OR 9 BETWEEN 8
  AND 10;

-- Q2: Select all books written before 1980 (non inclusive)
SELECT
  *
FROM
  books
WHERE
  released_year < 1980;

-- Q3: Select all books written by Eggers or Chabon
SELECT
  *
FROM
  books
WHERE
  author_lname IN ('Eggers', 'Chabon');

-- Q4: Select all books written by Lahiri, published after 2000
SELECT
  *
FROM
  books
WHERE
  author_lname = 'Lahiri'
  AND released_year > 2000;

-- Q5: Select all books with page counts between 100 and 200
SELECT
  *
FROM
  books
WHERE
  pages BETWEEN 100
  AND 200;

-- Q6: Select all books where author_lname starts with a 'C' or an 'S'
SELECT
  *
FROM
  books
WHERE
  author_lname LIKE 'C%'
  OR author_lname LIKE 'S%';

SELECT
  *
FROM
  books
WHERE
  SUBSTR(author_lname, 1, 1) IN('C', 'S');

-- Q7: Print out title, author_lname, and TYPE with
--  + If title contains 'stories' -> Short Stories
--  + Just Kids and A Heartbreaking Work -> Memoir
--  + Everything Else -> Novel
SELECT
  title,
  author_lname,
  CASE
    WHEN title LIKE '%stories%' THEN 'Short Stories'
    WHEN title = 'Just Kids'
    OR title LIKE 'A Heartbreaking Work%' THEN 'Memoir'
    ELSE 'Novel'
  END as TYPE
FROM
  books;

-- Q8: Print out author_fname, author_lname and COUNT is a books each author with format as '2 books'
SELECT
  author_fname,
  author_lname,
  CASE
    WHEN COUNT(*) = 1 THEN '1 book'
    ELSE CONCAT(COUNT(*), ' books')
  END AS COUNT
FROM
  books
WHERE
  author_lname IS NOT NULL
GROUP BY
  author_fname,
  author_lname;
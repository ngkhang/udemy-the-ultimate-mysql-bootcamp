-- DISTINCT
SELECT
  DISTINCT author_lname
FROM
  books;

SELECT
  DISTINCT released_year
FROM
  books;

-- SELECT DISTINCT author_fname, author_lname FROM books;
SELECT
  DISTINCT CONCAT(author_fname, ' ', author_lname)
FROM
  books;

-- ORDER BY
SELECT
  *
FROM
  books
ORDER BY
  author_lname;

SELECT
  author_fname,
  author_lname
FROM
  books
ORDER BY
  author_lname,
  author_fname;

-- LIMIT
SELECT
  book_id,
  title,
  released_year
FROM
  books
ORDER BY
  released_year
LIMIT
  10;

SELECT
  title
FROM
  books
LIMIT
  3, 10;

-- LIKE
SELECT
  *
FROM
  books
WHERE
  author_fname LIKE '%da%';

SELECT
  *
FROM
  books
WHERE
  author_fname LIKE '____';

SELECT
  *
FROM
  books
WHERE
  author_fname LIKE '_a_';

SELECT
  *
FROM
  books
WHERE
  author_fname LIKE '%n';

SELECT
  *
FROM
  books
WHERE
  title LIKE '%\%%';

SELECT
  *
FROM
  books
WHERE
  title LIKE '%\_%';
-- COUNT
SELECT
  COUNT(*)
FROM
  books;

SELECT
  COUNT(DISTINCT author_fname)
FROM
  books;

SELECT
  COUNT(*)
FROM
  books
WHERE
  title LIKE '%the%';

-- GROUP BY
SELECT
  COUNT(*)
FROM
  books
GROUP BY
  author_lname;

SELECT
  author_fname,
  COUNT(*) AS books_written
FROM
  books
GROUP BY
  author_fname
ORDER BY
  books_written DESC;

SELECT
  author_fname,
  author_lname,
  COUNT(*)
FROM
  books
GROUP BY
  author_lname,
  author_fname;

SELECT
  CONCAT(author_fname, ' ', author_lname) AS author,
  COUNT(*)
FROM
  books
GROUP BY
  author;

-- MIN and MAX
SELECT
  MIN(released_year)
FROM
  books;

SELECT
  MAX(pages)
FROM
  books;

-- Subqueries
SELECT
  title,
  pages
FROM
  books
WHERE
  pages =(
    SELECT
      MIN(pages)
    FROM
      books
  );

SELECT
  title,
  released_year
FROM
  books
WHERE
  released_year = (
    SELECT
      MIN(released_year)
    FROM
      books
  );

-- Group by with MIN/MAX
SELECT
  author_fname,
  author_lname,
  COUNT(*) AS books_written,
  MIN(released_year) AS earliest_year,
  MAX(released_year) AS latest_year
FROM
  books
GROUP BY
  author_lname,
  author_fname;

SELECT
  author_fname,
  author_lname,
  MAX(pages)
FROM
  books
GROUP BY
  author_fname,
  author_lname;

-- SUM
SELECT
  SUM(pages)
FROM
  books;

SELECT
  author_fname,
  author_lname,
  SUM(pages)
FROM
  books
GROUP BY
  author_lname,
  author_fname;

-- AVG
SELECT
  AVG(released_year)
FROM
  books;

SELECT
  released_year,
  AVG(stock_quantity),
  COUNT(*)
FROM
  books
GROUP BY
  released_year;
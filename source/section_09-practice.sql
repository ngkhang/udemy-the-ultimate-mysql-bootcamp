-- Q1: Print the number of books in the database
SELECT
  COUNT(*) AS 'Number of Books'
FROM
  books;

-- Q2: Print out how many books were released in each year
SELECT
  released_year,
  COUNT(*) AS 'Number of Books'
FROM
  books
GROUP BY
  released_year
ORDER BY
  released_year;

-- Q3: Print out the total number of books in stock
SELECT
  SUM(stock_quantity) AS 'Number of Books in stock'
FROM
  books;

-- Q4: Find the average released_year for each author
SELECT
  CONCAT(author_fname, ' ', author_lname) AS author,
  AVG(released_year)
FROM
  books
GROUP BY
  author_fname,
  author_lname;

-- Q5: Find the full name of the author who wrote the longest book
SELECT
  CONCAT(author_fname, '', author_lname) AS author,
  title
FROM
  books
WHERE
  pages = (
    SELECT
      MAX(pages)
    FROM
      books
  );

-- Q6: Print out format:
--  | year | # books | avg pages |
SELECT
  released_year AS year,
  COUNT(*) AS '# books',
  AVG(pages) AS 'avg pages'
FROM
  books
GROUP BY
  year
ORDER BY
  year;
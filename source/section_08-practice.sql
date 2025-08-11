-- Q1: Print title of story collection that contain 'stories'
SELECT
  title
FROM
  books
WHERE
  title LIKE '%stories%';

-- Q2: Print title and pages of the longest book
SELECT
  title,
  pages
FROM
  books
ORDER BY
  pages DESC
LIMIT
  1;

-- Q3: Print a summary (format: title + "-" + year)  containing the title and year with the 3 most recent books
SELECT
  CONCAT(title, ' - ', released_year) AS summary
FROM
  books
ORDER BY
  released_year DESC
LIMIT
  3;

-- Q4: Print title and author_lname of books with an author_lname that contains a space(" ")
SELECT
  title,
  author_lname
FROM
  books
WHERE
  author_lname LIKE '% %';

-- Q5: Print title, year, and stock_quantity of the 3 books with the lowest stock
SELECT
  title,
  released_year,
  stock_quantity
FROM
  books
ORDER BY
  stock_quantity
LIMIT
  3;

-- Q6: Print title and author_lname of book sorted first by author_lname and then by title
SELECT
  title,
  author_lname
FROM
  books
ORDER BY
  author_lname,
  title;

-- Q7: Print column name "yell" (format: "MY FAVORITE AUTHOR IS " + author_fname + author_lname + '!') sorted Alphabetically by last name
SELECT
  CONCAT(
    'MY FAVORITE AUTHOR IS ',
    UPPER(CONCAT(author_fname, ' ', author_lname)),
    '!'
  ) AS yell
FROM
  books
ORDER BY
  author_lname
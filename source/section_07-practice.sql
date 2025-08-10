-- Q1: Reverse and Uppercase the following sentence:
--    "Why does my cat look at me with such hatred?"
SELECT
  UPPER(
    REVERSE('Why does my cat look at me with such hatred?')
  );

-- Q2: What Does This Print Out?
--    SELECT REPLACE (CONCAT('I', ' ', 'like', ' ', 'cats'), ' ', '-');
-- Result: I-like-cats
-- Q3: Replace spaces in titles with '->'
SELECT
  REPLACE(books.title, ' ', '->') AS 'title'
FROM
  books;

-- Q4: Print fields: forward (normal last name) and reverse (reverse last name)
SELECT
  books.author_lname AS forwards,
  REVERSE(books.author_lname) AS backwards
FROM
  books;

-- Q5: Print 'full name in caps' field with first name and last name has uppercase
SELECT
  UPPER(
    CONCAT_WS(' ', books.author_fname, books.author_lname)
  ) AS 'full name in caps'
FROM
  books;

-- Q6: Print "blurb" field has format: Book title + "was released in" + released_year
SELECT
  CONCAT(
    books.title,
    "was released in",
    books.released_year
  ) AS "blurb"
FROM
  books;

-- Q7: Print book titles and the length of each title
SELECT
  title,
  CHAR_LENGTH(books.title) AS 'character count'
FROM
  books;

-- Q8: Print 3 columns with:
--  - The "short title": first 10 characters
--  - The "author" has format: "lname" + "," + "fname"
--  - The "quantity" has format: "quality" + " in stock"
SELECT
  SUBSTRING(books.title, 10) AS short title,
  CONCAT(books.author_fname, ',', books.author_lname) AS author,
  CONCAT(books.stock_quantity, ' in stock') AS quantity
FROM
  books;
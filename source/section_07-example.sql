-- CONCAT
SELECT
  CONCAT(
    books.author_fname,
    ' ',
    books.author_lname
  ) AS author_name
FROM
  books;

-- CONCAT_WS
SELECT
  CONCAT_WS(
    ' ',
    books.author_fname,
    books.author_lname
  ) AS author_name
FROM
  books;

-- SUBSTRING
SELECT
  SUBSTRING(books.author_lname, 1, 1) AS initial,
  books.author_lname
FROM
  books;

SELECT
  SUBSTRING(books.title, 1, 15)
FROM
  books;

-- Combine string: CONCAT + SUBSTRING
SELECT
  CONCAT(SUBSTRING(books.title, 1, 15), '...') asshort_title
FROM
  books;

SELECT
  CONCAT(
    SUBSTRING(books.author_fname, 1, 1),
    '.',
    SUBSTRING(books.author_lname, 1, 1)
  ) AS author_initital
FROM
  books;

-- REPLACE
SELECT
  REPLACE(books.title, ' ', '-')
FROM
  books;

-- REVERSE
SELECT
  REVERSE(books.title)
FROM
  books;

-- CHAR_LENGTH
SELECT
  CHAR_LENGTH(books.title)
FROM
  books;

-- UPPER and LOWER
SELECT
  UPPER(books.title)
FROM
  books;

SELECT
  LOWER(books.title)
FROM
  books;

-- LEFT and RIGHT
SELECT
  LEFT(books.author_fname, 1)
FROM
  books;

SELECT
  RIGHT(books.released_year, 2)
FROM
  books;

-- REPEAT
SELECT
  REPEAT('ha', 4);

-- TRIM
SELECT
  TRIM('   Hello   ');

SELECT
  TRIM(
    LEADING '.'
    FROM
      '....Hello....'
  );

SELECT
  TRIM(
    TRAILING '.'
    FROM
      '....Hello....'
  );

SELECT
  TRIM(
    BOTH '.'
    FROM
      '....Hello....'
  );
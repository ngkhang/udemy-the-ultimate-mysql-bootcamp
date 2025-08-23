-- Create a new View
CREATE VIEW [Full Reviews] AS
SELECT
  title,
  released_year,
  genre,
  rating,
  first_name,
  last_name
FROM
  reviews
  INNER JOIN series ON series.id = reviews.series_id
  INNER JOIN reviewers ON reviewers.id = reviews.reviewer_id;

-- Update View with `CREATE OR REPLACE VIEW`
CREATE
OR REPLACE VIEW [Ordered Series] AS
SELECT
  *
FROM
  series
ORDER BY
  released_year DESC;

-- Update View with `ALTER VIEW`: The View table must exist
ALTER VIEW [Ordered Series] AS
SELECT
  *
FROM
  series
ORDER BY
  released_year;

-- Delete View
DROP VIEW Full Reviews;
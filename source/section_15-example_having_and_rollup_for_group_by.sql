-- HAVING clause
SELECT
  title,
  AVG(rating) AS avg_rating
FROM
  series
  JOIN reviews ON Series.id = reviews.series_id
  JOIN reviewers ON reviews.reviewer_id = reviewers.id
GROUP BY
  title
HAVING
  avg_rating > 4;

-- GROUP BY ... WITH ROLLUP
SELECT
  title,
  AVG(rating)
FROM
  series
  JOIN reviews ON series.id = reviews.series_id
  JOIN reviewers ON reviews.reviewer_id = reviewers.id
GROUP BY
  title WITH ROLLUP;

SELECT
  title,
  first_name,
  released_year AVG(rating)
FROM
  series
  JOIN reviews ON series.id = reviews.series_id
  JOIN reviewers ON reviews.reviewer_id = reviewers.id
GROUP BY
  title WITH ROLLUP;
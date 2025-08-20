-- Q1: Print out
-- +----------------------+--------+
-- | title                | rating |
-- +----------------------+--------+
-- | Archer               |    8.0 |
-- | Archer               |    7.5 |
-- | Archer               |    8.5 |
-- | Archer               |    7.7 |
-- | Archer               |    8.9 |
-- | Arrested Development |    8.1 |
-- |           ...more             |
-- +----------------------+--------+
SELECT
  title,
  rating
FROM
  series
  lEFT JOIN reviews ON series.id = reviews.series_id;

-- Q2: Print out
-- +----------------------+------------+
-- | title                | avg_rating |
-- +----------------------+------------+
-- | General Hospital     |    5.38000 |
-- | Bob's Burgers        |    7.52000 |
-- | Seinfeld             |    7.60000 |
-- | Bojack Horseman      |    7.94000 |
-- | Arrested Development |    8.08000 |
-- | Curb Your Enthusiasm |    8.12000 |
-- | Archer               |    8.12000 |
-- | Freaks and Geeks     |    8.60000 |
-- | Stranger Things      |    8.76667 |
-- | Breaking Bad         |    9.36000 |
-- | Fargo                |    9.40000 |
-- | Halt and Catch Fire  |    9.90000 |
-- +----------------------+------------+
SELECT
  title,
  AVG(rating) AS avg_rating
FROM
  series
  RIGHT JOIN reviews ON series.id = reviews.series_id
GROUP BY
  title
ORDER BY
  avg_rating;

-- Q3: Print out
-- +------------+-----------+--------+
-- | first_name | last_name | rating |
-- +------------+-----------+--------+
-- | Thomas     | Stoneman  |    8.0 |
-- | Thomas     | Stoneman  |    8.1 |
-- | Thomas     | Stoneman  |    7.0 |
-- | Thomas     | Stoneman  |    7.5 |
-- | Thomas     | Stoneman  |    9.5 |
-- | Wyatt      | Skaggs    |    7.5 |
-- |            ...more              |
-- +------------+-----------+--------+
SELECT
  first_name,
  last_name,
  rating
FROM
  reviewers
  LEFT JOIN reviews ON reviewers.id = reviews.reviewer_id;

-- Q4: Print out
-- +-----------------------+
-- | unreviewed_series     |
-- +-----------------------+
-- | Malcolm In The Middle |
-- | Pushing Daisies       |
-- +-----------------------+
SELECT
  title AS "unreviewed_series"
FROM
  series
  LEFT JOIN reviews ON series.id = reviews.series_id
WHERE
  ISNULL(reviews.rating);

-- Q5: Print out
-- +-----------+------------+
-- | genre     | avg_rating |
-- +-----------+------------+
-- | Animation |    7.86000 |
-- | Comedy    |    8.16250 |
-- | Drama     |    8.04375 |
-- +-----------+------------+
SELECT
  genre,
  AVG(rating) AS avg_rating
FROM
  series
  JOIN reviews ON series.id = reviews.series_id
GROUP BY
  genre;

-- Q6: Print out
-- +------------+-----------+-------+-----+-----+---------+----------+
-- | first_name | last_name | COUNT | MIN | MAX | AVG     | STATUS   |
-- +------------+-----------+-------+-----+-----+---------+----------+
-- | Thomas     | Stoneman  |     5 | 7.0 | 9.5 | 8.02000 | ACTIVE   |
-- | Wyatt      | Skaggs    |     9 | 5.5 | 9.3 | 7.80000 | ACTIVE   |
-- | Kimbra     | Masters   |     9 | 6.8 | 9.0 | 7.98889 | ACTIVE   |
-- | Domingo    | Cortes    |    10 | 5.8 | 9.1 | 7.83000 | ACTIVE   |
-- | Colt       | Steele    |    10 | 4.5 | 9.9 | 8.77000 | ACTIVE   |
-- | Pinkie     | Petit     |     4 | 4.3 | 8.8 | 7.25000 | ACTIVE   |
-- | Marlon     | Crafford  |     0 | 0.0 | 0.0 | 0.00000 | INACTIVE |
-- +------------+-----------+-------+-----+-----+---------+----------+
SELECT
  first_name,
  last_name,
  COUNT(rating) AS COUNT,
  IFNULL(MIN(rating), 0) AS MIN,
  IFNULL(MAX(rating), 0) AS MAX,
  IFNULL(AVG(rating), 0) AS AVG,
  -- Using CASE
  CASE
    WHEN COUNT(rating) = 0 THEN "INACTIVE"
    ELSE "ACTIVE"
  END AS STATUS -- Using IF: IF(COUNT(rating) = 0, "INACTIVE", "ACTIVE") AS STATUS
FROM
  reviewers
  LEFT JOIN reviews ON reviewers.id = reviews.reviewer_id
GROUP BY
  first_name,
  last_name;

-- Q7: Print out
-- +----------------------+--------+-----------------+
-- | title                | rating | reviewer        |
-- +----------------------+--------+-----------------+
-- | Archer               |    8.0 | Thomas Stoneman |
-- | Archer               |    7.7 | Domingo Cortes  |
-- | Archer               |    8.5 | Kimbra Masters  |
-- | Archer               |    7.5 | Wyatt Skaggs    |
-- | Archer               |    8.9 | Colt Steele     |
-- | Arrested Development |    8.4 | Pinkie Petit    |
-- | Arrested Development |    9.9 | Colt Steele     |
-- | Arrested Development |    8.1 | Thomas Stoneman |
-- | Arrested Development |    6.0 | Domingo Cortes  |
-- | Arrested Development |    8.0 | Kimbra Masters  |
-- | Bob's Burgers        |    7.0 | Thomas Stoneman |
-- | Bob's Burgers        |    8.0 | Domingo Cortes  |
-- | Bob's Burgers        |    7.1 | Kimbra Masters  |
-- | Bob's Burgers        |    7.5 | Pinkie Petit    |
-- |                  ...more                        |
-- +----------------------+--------+-----------------+
SELECT
  title,
  rating,
  CONCAT(first_name, " ", last_name) AS reviewer
FROM
  series
  LEFT JOIN reviews ON series.id = reviews.series_id
  LEFT JOIN reviewers ON reviews.reviewer_id = reviewers.id;
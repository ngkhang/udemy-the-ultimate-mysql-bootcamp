-- Question 1: "We want to reward our users who have been around the longest. ". Find the 5 oldest users
SELECT
  *
FROM
  users
ORDER BY
  created_at ASC
LIMIT
  5;

-- Question 2: "We need to figure out when to schedule an ad campaign". What day of the week do most users register on?
SELECT
  DATE_FORMAT (created_at, "%W") AS `Day`,
  COUNT(*) AS `Total`
FROM
  users
GROUP BY
  `Day`
ORDER BY
  `Total` DESC
LIMIT
  2;

-- Question 3: "We want to target our inactive users with an email campaign". Find the users who have never posted a photo
SELECT
  users.username
FROM
  users
  LEFT JOIN photos ON photos.user_id = users.id
WHERE
  photos.id IS NULL;

-- Question 4: "We are running a new contest to see who can get the most likes on a single photo". Who won?"
SELECT
  users.username,
  photos.image_url,
  COUNT(likes.photo_id) AS total_likes
FROM
  photos
  JOIN users ON photos.user_id = users.id
  JOIN likes ON photos.id = likes.photo_id
GROUP BY
  photos.id
ORDER BY
  total_likes DESC
LIMIT
  1;

-- Question 5: "Our Investors want to know... How many times does the average user post?"
SELECT
  (
    (
      SELECT
        COUNT(*)
      FROM
        photos
    ) / (
      SELECT
        COUNT(*)
      FROM
        users
    )
  ) AS avg;

-- Question 6: "A brand wants to know which hashtags to use in a post". What are the top 5 most commonly used hashtags?"
SELECT
  hashtags.name AS Hashtag,
  COUNT(photo_hashtags.hashtag_id) AS total
FROM
  hashtags
  JOIN photo_hashtags ON hashtags.id = photo_hashtags.hashtag_id
GROUP BY
  hashtags.id
ORDER BY
  total DESC
LIMIT
  5;

-- Question 7: "We have a small problem with bots on our site". Find users who have liked every single photo on the site
SELECT
  users.id,
  users.username
FROM
  users
  LEFT JOIN likes ON users.id = likes.user_id
GROUP BY
  users.id
HAVING
  COUNT(*) = (
    SELECT
      COUNT(*)
    FROM
      photos
  );

-- Question 8: "We also have a problem with celebrities". Find users who have never commented on a photo
SELECT
  users.id,
  users.username,
  comments.photo_id
FROM
  users
  LEFT JOIN comments ON users.id = comments.user_id
WHERE
  comments.user_id IS NULL;

-- Question 9: "Are we overrun with bots and celebrity accounts?". Find the percentage of our users who have either never commented on a photo or have commented on every photo
SELECT
  (
    (
      (
        (
          -- Users who never commented
          SELECT
            COUNT(*)
          FROM
            users
            LEFT JOIN comments ON users.id = comments.user_id
          WHERE
            comments.user_id IS NULL
        ) + (
          -- Users who commented on every photo
          SELECT
            COUNT(*)
          FROM
            (
              SELECT
                users.id
              FROM
                users
                LEFT JOIN comments ON users.id = comments.user_id
              GROUP BY
                users.id
              HAVING
                COUNT(DISTINCT comments.photo_id) = (
                  SELECT
                    COUNT(*)
                  FROM
                    photos
                )
            ) AS tb
        )
      ) * 100.00
    ) / (
      SELECT
        COUNT(*)
      FROM
        users
    )
  ) as percentage;
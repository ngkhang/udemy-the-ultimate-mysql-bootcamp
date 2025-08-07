CREATE DATABASE shirts_db;
USE shirts_db;

CREATE TABLE shirts (
    shirt_id INT NOT NULL AUTO_INCREMENT,
    article VARCHAR(100),
    color VARCHAR(100),
    shirt_size VARCHAR(100),
    last_worn INT,
    PRIMARY KEY (shirt_id)
);

INSERT INTO shirts (article, color, shirt_size, last_worn)
VALUES
    ('t-shirt', 'white', 'S', 10),
    ('t-shirt', 'green', 'S', 200),
    ('polo shirt', 'black', 'M', 10),
    ('tank top', 'blue', 'S', 50),
    ('t-shirt', 'pink', 'S', 0),
    ('polo shirt', 'red', 'M', 5),
    ('tank top', 'white', 'S', 200),
    ('tank top', 'blue', 'M', 15);

-- Get All That Data In There With a single line
SELECT
    *
FROM
    shirts;

-- Add A New Shirt Purple polo shirt, size M last worn 50 days ago
INSERT INTO shirts (article, color, shirt_size, last_worn)
VALUES ('polo shirt', 'purple', 'M', 50);

-- SELECT all shirts, But Only Print Out Article and Color
SELECT
    article, color
FROM
    shirts;

-- SELECT all medium shirts Print Out Everything But shirt_id
SELECT
    article, color, shirt_size, last_worn
FROM
    shirts
WHERE
    shirt_size = 'M';

-- Update all polo shirts, Change their size to L
UPDATE shirts
SET
    shirt_size = 'L'
WHERE
    article = 'polo shirt';

-- Update the shirt last worn 15 days ago, Change last_worn to 0
UPDATE shirts
SET
    last_worn = 0
WHERE
    last_worn = 15;

-- Update all white shirts, Change size to 'XS' and color to 'off white'
UPDATE shirts
SET
    shirt_size = 'XS',
    color = 'off white'
WHERE
    color = 'white';

-- Delete all old shirts, Last worn 200 days ago
DELETE FROM shirts
WHERE
    last_worn = 200;

-- Delete all tank tops
DELETE FROM shirts
WHERE
    article = 'tank top';

-- Delete all shirts
DELETE FROM shirts;
DESC shirts;

-- Drop the entire shirts table
DROP TABLE shirts;
SHOW TABLES;
DESC shirts;

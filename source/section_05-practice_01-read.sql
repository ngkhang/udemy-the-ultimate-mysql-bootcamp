-- Initial database
-- CREATE DATABASE section_5;
-- USE section_5;

-- DROP TABLE cats;
-- CREATE TABLE cats (
--     cat_id INT AUTO_INCREMENT,
--     name VARCHAR(100),
--     breed VARCHAR(100),
--     age INT,
--     PRIMARY KEY (cat_id)
-- );

-- INSERT INTO cats (name, breed, age)
-- VALUES ('Ringo', 'Tabby', 4),
--     ('Cindy', 'Maine Coon', 10),
--     ('Dumbledore', 'Maine Coon', 11),
--     ('Egg', 'Persian', 4),
--     ('Misty', 'Tabby', 13),
--     ('George Michael', 'Ragdoll', 9),
--     ('Jackson', 'Sphynx', 7);

-- Get cat_id column
SELECT
    cat_id
FROM
    cats;

-- Get name and breed columns
SELECT
    name, breed
FROM
    cats;

-- Get name and age columns with breed is 'Tabby'
SELECT
    name, age
FROM
    cats
WHERE
    breed = 'Tabby';

-- Get cat_id and age columns with cat_id = age
SELECT
    cat_id, age
FROM
    cats
WHERE
    cat_id = age;

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

-- DELETE all 4 year old cats
DELETE FROM cats
WHERE
    age = 4;

-- DELETE cats whose age is the same as their cat_id
DELETE FROM cats
WHERE
    cat_id = age;

-- DELETE all cats
DELETE FROM cats;

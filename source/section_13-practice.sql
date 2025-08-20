-- Initial data for exercise
CREATE TABLE students (
  id INT AUTO_INCREMENT,
  first_name VARCHAR(100),
  PRIMARY KEY (id)
);

CREATE TABLE papers (
  id INT AUTO_INCREMENT,
  title VARCHAR(50),
  grade INT,
  student_id INT,
  PRIMARY KEY (id),
  FOREIGN KEY (student_id) REFERENCES students(id)
);

INSERT INTO
  students (first_name)
VALUES
  ('Caleb'),
  ('Samantha'),
  ('Raj'),
  ('Carlos'),
  ('Lisa');

INSERT INTO
  papers (student_id, title, grade)
VALUES
  (1, 'My First Book Report', 60),
  (1, 'My Second Book Report', 75),
  (2, 'Russian Lit Through The Ages', 94),
  (2, 'De Montaigne and The Art of The Essay', 98),
  (4, 'Borges and Magical Realism', 89);

-- Q1: Print out: |first_name | title | grade|
--  - Get students has paper
--  - Sort by average: highest to lowest
SELECT
  first_name,
  title,
  grade
FROM
  students
  JOIN papers ON students.id = papers.student_id
ORDER BY
  grade DESC;

-- Q2: Print out |first_name | title | grade|
--  - Get all students
SELECT
  first_name,
  title,
  grade
FROM
  students
  LEFT JOIN papers ON students.id = papers.student_id;

-- Q3: Print out: |first_name | title | grade|
--  - If title is NULL, it is a "MISSING"
--  - If grade is NULL, it is a zero
SELECT
  first_name,
  IFNULL(title, 'MISSING') as title,
  IFNULL(grade, 0) as grade
FROM
  students
  LEFT JOIN papers ON students.id = papers.student_id;

-- Q4: Print out |first_name | average|
--  - If average is NULL, it is a zero
--  - Sort by average: highest to lowest
SELECT
  first_name,
  AVG(IFNULL(grade, 0)) as average
FROM
  students
  LEFT JOIN papers ON students.id = papers.student_id
GROUP BY
  first_name
ORDER BY
  average DESC;

-- Q5: Print out |first_name | average | passing_status|
--  - If average >= 75, passing_status is "PASSING". Otherwise it is a "FAILING"
--  - Sort by average: highest to lowest
SELECT
  first_name,
  AVG(IFNULL(grade, 0)) as average,
  CASE
    WHEN AVG(IFNULL(grade, 0)) >= 75 THEN "PASSING"
    ELSE "FAILING"
  END AS passing_status
FROM
  students
  LEFT JOIN papers ON students.id = papers.student_id
GROUP BY
  first_name
ORDER BY
  average DESC;
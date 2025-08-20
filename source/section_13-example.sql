CREATE DATABASE shop;

USE shop;

CREATE TABLE customers (
  id INT PRIMARY KEY AUTO_INCREMENT,
  first_name VARCHAR(100),
  last_name VARCHAR(100),
  email VARCHAR(100)
);

CREATE TABLE orders (
  id INT PRIMARY KEY AUTO_INCREMENT,
  order_date DATE,
  amount DECIMAL(9, 2),
  customer_id INT,
  FOREIGN KEY (customer_id) REFERENCES customers(id)
);

INSERT INTO
  customers (first_name, last_name, email)
VALUES
  ('Boy', 'George', 'george@gmail.com'),
  ('George', 'Michael', 'gm@gmail.com'),
  ('David', 'Bowie', 'david@gmail.com'),
  ('Blue', 'Steele', 'blue@gmail.com'),
  ('Bette', 'Davis', 'bette@aol.com');

INSERT INTO
  orders (order_date, amount, customer_id)
VALUES
  ('2016-02-10', 99.99, 1),
  ('2017-11-11', 35.50, 1),
  ('2014-12-12', 800.67, 2),
  ('2015-01-03', 12.50, 2),
  ('1999-04-11', 450.25, 5);

-- JOIN - INNER JOIN
SELECT
  customers.id,
  first_name,
  last_name,
  orders.id AS order_id,
  order_date,
  amount
FROM
  customers
  JOIN orders ON customers.id = orders.customer_id;

SELECT
  orders.id AS `Order ID`,
  order_date AS `Order Date`,
  amount AS `Price`,
  CONCAT(customers.first_name, ' ', customers.last_name) AS `Customer`,
  email AS `Email`
FROM
  orders
  INNER JOIN customers ON orders.customer_id = customers.id;

-- With GROUP BY, ORDER BY
SELECT
  first_name,
  last_name,
  SUM(amount) AS total
FROM
  customers
  JOIN orders ON customers.id = orders.customer_id
GROUP BY
  first_name,
  last_name
ORDER BY
  total;

-- Left Join
SELECT
  first_name,
  last_name,
  IFNULL(SUM(amount), 0) AS total
FROM
  customers
  LEFT JOIN orders ON customers.id = orders.customer_id
GROUP BY
  first_name,
  last_name;

-- Right Join
SELECT
  order_date,
  first_name,
  last_name,
  amount
FROM
  customers
  RIGHT JOIN orders ON customers.id = orders.customer_id;

-- Delete CASCADE
CREATE TABLE orders (
  id INT PRIMARY KEY AUTO_INCREMENT,
  order_date DATE,
  amount DECIMAL(9, 2),
  customer_id INT,
  FOREIGN KEY (customer_id) REFERENCES customers(id) ON DELETE CASCADE
);
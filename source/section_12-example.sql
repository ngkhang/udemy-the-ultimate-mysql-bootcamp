-- UNIQUE constraint
CREATE TABLE contacts (
  name VARCHAR(125) NOT NULL,
  phone VARCHAR(15) NO NULL UNIQUE
);

-- CHECK constraint
CREATE TABLE users (
  username VARCHAR(100) NOT NULL UNIQUE,
  age INT CHECK(age > 18),
  CONSTRAINT age_over_18 CHECK(age > 18)
);

-- Define the name for constraint
CREATE TABLE companies (
  name VARCHAR(125) NOT NULL,
  address VARCHAR(255) NOT NULL,
  CONSTRAINT name_address UNIQUE (name, address)
);

-- Multi-column constraint
CREATE TABLE houses (
  purchase_price INT NOT NULL,
  sale_price INT NOT NULL,
  CONSTRAINT sale_price_gt_purchase_price CHECK(sale_price >= purchase_price)
);

-- Add and remove column
ALTER TABLE
  companies
ADD
  COLUMN city VARCHAR(20),
ADD
  COLUMN employee_count INT NOT NUll DEFAULT 1;

ALTER TABLE
  companies DROP COLUMN employee_count;

-- Renaming Table
RENAME TABLE companies TO suppliers;

ALTER TABLE
  suppliers RENAME TO companies;

-- Rename column
ALTER TABLE
  companies RENAME COLUMN name to company_name;

-- Modify column with MODIFY
ALTER TABLE
  companies
MODIFY
  COLUMN company_name VARCHAR(100) DEFAULT 'unname';

-- Modify and rename column with CHANGE
ALTER TABLE
  companies CHANGE COLUMN employee_count employees;

-- ADD constraint
ALTER TABLE
  houses
ADD
  CONSTRAINT positive_purchase_price CHECK(purchase_price >= 0);

-- DROP constraint
ALTER TABLE
  houses DROP CONSTRAINT positive_purchase_price;
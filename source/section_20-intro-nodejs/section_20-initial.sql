DROP DATABASE IF EXISTS section20_join_us;

CREATE DATABASE section20_join_us;

USE section20_join_us;

CREATE TABLE
  users (
    email VARCHAR(125) PRIMARY KEY,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
  );

INSERT INTO
  users (email)
VALUES
  ('ngkhang@gmail.com');
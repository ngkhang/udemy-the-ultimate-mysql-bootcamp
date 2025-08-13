# The Ultimate Mysql Bootcamp Go From Sql Beginner To Expert course

Table of Contents

- [The Ultimate Mysql Bootcamp Go From Sql Beginner To Expert course](#the-ultimate-mysql-bootcamp-go-from-sql-beginner-to-expert-course)
  - [Section](#section)
    - [Section 1-2: Introduction](#section-1-2-introduction)
      - [What is a Database?](#what-is-a-database)
      - [FAQ](#faq)
    - [Section 3: Create databases and tables](#section-3-create-databases-and-tables)
      - [Databases Overview](#databases-overview)
      - [Tables Overview](#tables-overview)
    - [Section 4-5: CRUD Basics](#section-4-5-crud-basics)
      - [Keyword common](#keyword-common)
      - [CRUD Overview](#crud-overview)
    - [Section 6: CRUD Challenge](#section-6-crud-challenge)
    - [Section 7: String Functions](#section-7-string-functions)
    - [Section 8: Refining Selections](#section-8-refining-selections)
    - [Section 9: Aggregate Functions](#section-9-aggregate-functions)
  - [References](#references)

## Section

### Section 1-2: Introduction

- Slide:
  - [01 - Introduction](./resources/slides/01-slide-first-5-minutes-of-sql.pdf)
  - [02 - Started and Install](./resources/slides/02-slide-getting-started-and-installation.pdf)

#### What is a Database?

- The database

  > ✏️ A structured set of **computerized** data with an accessible **interface** for storage, retrieval, and manipulation.

  - Key characteristics:
    - Organized collection of related data
    - Provides methods for accessing, querying, and manipulating data
    - Ensures data integrity and consistency
    - Supports concurrent access by multiple users

- The Relational Database

  > ✏️ A database that organizes data into tables (relations) with rows and columns, where relationships between tables are established through keys.

#### FAQ

- ❓ SQL and MySQL

  | SQL                                                               | MySQL                                                                               |
  | ----------------------------------------------------------------- | ----------------------------------------------------------------------------------- |
  | Structured Query Language                                         | Database Management System                                                          |
  | Standardized language for communicating with relational databases | Software that implements and manages databases using SQL                            |
  | Defines syntax for queries, updates, schema creation              | Provides storage engine, user management, performance optimization, backup/recovery |
  | Examples: SELECT, INSERT, CREATE TABLE                            | Examples: MySQL, PostgreSQL, SQLite, Oracle, SQL Server                             |

### Section 3: Create databases and tables

- [Slide 03](./resources/slides/03-slide-creating-databases-and-tables.pdf)
- Practices:
  - [Practice 01 - Pastries](./source/section-03-practice-01.sql)

#### Databases Overview

> ✏️ Before you can store data, you need a container for it. This container is the database itself.

- [Example: Database Operations](./source/section-03-example-01-database.sql)

#### Tables Overview

> ✏️ A Collection of related data held in a structured format within a database

- Basic terminology:
  - Columns (Fields - The Headers): Define data structure and types
  - Rows (Records): Contain actual data values
- Data types common: Numeric types | String types | Date types | etc.
- [Example: Database Operations](./source/section-03-example-02-table.sql)

### Section 4-5: CRUD Basics

- Database used for practice: [Source](./source/section_05-initial.sql)
- Slide:
  - [Slide 04: Inserting Data](./resources/slides/04-slide-inserting-data.pdf)
  - [Slide 05: CRUD Basics](./resources/slides/05-slide-crud-basics.pdf)

#### Keyword common

- `NULL`: the value is unknown, no information, no value, does not mean zero. `NOT NULL`: can be empty
- `DEFAULT`: to set the default value if it wasn't provided
- `PRIMARY KEY`: is a unique identifier, which can't `NULL`
- `AUTO_INCREMENT`: automatically increments for each new data inserted into the table

```sql
-- Option 1
CREATE TABLE cats4 (
    cat_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    age INT NOT NULL DEFAULT 1
);

-- Option 2
CREATE TABLE cats4 (
    cat_id INT AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    age INT NOT NULL DEFAULT 1,

    PRIMARY KEY (name)
)
```

#### CRUD Overview

- Create - `INSERT`
  - Example:

  ```sql
  -- With a single data
  INSERT INTO cats(name, age)
  VALUES ('Jenkins', 7);

  -- With multi data
  INSERT INTO cats(name, age)
  VALUES ('Charlie', 17),
      ('Connie', 10);
  ```

  - Practice:
    - [Practice: People](./source/section_04-practice_01-people.sql)
    - [Practice: Employees](./source/section_04-practice_02-employees.sql)

- Read - `SELECT`
  - Example:

    ```sql
    -- Retrieve all columns with *
    SELECT
        *
    FROM
        cats;

    -- Select specific column(s) from table
    SELECT
        name, age
    FROM
        cats;

    -- Filter with WHERE clause
    SELECT
        *
    FROM
        cats
    WHERE
        age > 5;

    -- Aliases with AS
    SELECT
        cat_id AS catId
    FROM
        cats;
    ```

  - Practice: [Practice: Read](./source/section_05-practice_01-read.sql)

- Update: `UPDATE`
  - Note:
    - 💡 A good rule: try SELECTing before you UPDATE
    - ⚠️ If you don't have a `WHERE` clause, all rows in the table will be set to a new value
  - Example:

    ```sql
    UPDATE cats
    SET
        breed = 'Shorthair'
    WHERE
        breed = 'Tabby';
    ```

  - Practice: [Practice: Update](./source/section_05-practice_02-update.sql)

- Delete: `DELETE`
  - Note:
    - ❗ Deleting data is not reversible
    - ❗ A `WHERE` clause
      - Without: all rows in the table will be deleted.
      - With: the rows that are in correct condition will be deleted.
  - Example:

    ```sql
    -- Delete all rows
    -- DELETE FROM cats;

    -- Delete specific row
    DELETE FROM cats
    WHERE
        name = 'Egg';
    ```

  - Practice: [Practice: Delete](./source/section_05-practice_03-delete.sql)

### Section 6: CRUD Challenge

- [Slide 06](./resources/slides/06-slide-crud-challenge.pdf)
- [Solution](./source/section_06-challenge.sql)

### Section 7: String Functions

- [MySQL: String functions](https://dev.mysql.com/doc/refman/8.0/en/string-functions.html)
- [Slide 07](./resources/slides/07-slide-string-functions.pdf)
- Database for practice: [Books Data](./source/section_07-initial_books.sql)
- Common functions:
  - `CONCAT()` and `CONCAT_WS()`
  - `SUBSTRING()`
  - `REPLACE()`
  - `REVERSE()`
  - `CHAR_LENGTH()` vs `LENGTH()`
  - `UPPER()` and `LOWER()`
  - `lEFT()` and `RIGHT()`
  - `TRIM()`, `LTRIM()`, and `RTRIM()`
  - `REPEAT()`
- [Example String Functions](./source/section_07-example.sql)
- [Practice: String Functions](./source/section_07-practice.sql)

### Section 8: Refining Selections

- [Slide 08: Refining Selections](./resources/slides/08-slide-refining-selections.pdf)
- Database for practice: [Books Data: Update](./source/section_08-books-update.sql)
- Claude commons:
  - `DISTINCT`
  - `ORDER BY`
  - `LIMIT`
  - `LIKE`
- [Example Refining Selections](./source/section_08-example.sql)
- [Practice: Refining Selections](./source/section_08-practice.sql)

### Section 9: Aggregate Functions

- [MySQL: Aggregate Function](https://dev.mysql.com/doc/refman/8.0/en/aggregate-functions.html)
- [Slide 09: Aggregate Functions](./resources/slides/09-slide-aggregate-functions.pdf)

| Function            | Description                                                           |
| ------------------- | --------------------------------------------------------------------- |
| `COUNT()`           | Return a count of the number of rows returned                         |
| `MIN()` and `MAX()` | Return the minimum and maximum value                                  |
| `AVG()`             | Return the average value of the argument                              |
| `SUM()`             | Return the sum                                                        |
| `GROUP BY`          | The statement groups rows that have the same values into summary rows |

- [Example Aggregate Functions](./source/section_09-example.sql)
- [Practice: Aggregate Functions](./source/section_09-practice.sql)

---

## References

- [Udemy course](https://www.udemy.com/course/the-ultimate-mysql-bootcamp-go-from-sql-beginner-to-expert/)
- [MySQL 8.4 Reference Manual](https://dev.mysql.com/doc/refman/8.4/en/)
  - [PDF: MySQL 8.4 Reference Manual](./resources//mysql-refman-8.4.pdf)

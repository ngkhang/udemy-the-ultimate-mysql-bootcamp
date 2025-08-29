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
    - [Section 10: Data types](#section-10-data-types)
    - [Section 11: Comparison and Logical Operations](#section-11-comparison-and-logical-operations)
    - [Section 12: Constraints and `ALTER TABLE` statement](#section-12-constraints-and-alter-table-statement)
    - [Section 13 and 14: Relationship](#section-13-and-14-relationship)
    - [Section 15: Views](#section-15-views)
    - [Section 16 Window Functions](#section-16-window-functions)
    - [Section 17-18: Instagram Database Clone](#section-17-18-instagram-database-clone)
    - [Section 19: Database Triggers](#section-19-database-triggers)
    - [Section 20: Introduction NodeJS](#section-20-introduction-nodejs)
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

  - Note: - ❗ Deleting data is not reversible - ❗ A `WHERE` clause - Without: all rows in the table will be deleted.
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

### Section 10: Data types

- References:
  - [MySQL: Data types](https://dev.mysql.com/doc/refman/8.0/en/data-types.html)
  - [Slide 10: Data types](./resources/slides/10-slide-revisiting-data-types.pdf)
- Example and Practices:
  - [Example](./source/section_10-example.sql)
  - [Practices](./source/section_10-practice.sql)
- Summary
  - String Data types: `CHAR` and `VARCHAR`
  - Numeric Data types:
    - The exact numeric data types:
      - `INT` (is a synonym for `INTEGER`), `TINYINT`, `SMALLINT`, `MEDIUMINT`, `BIGINT`, etc.
      - `DECIMAL` and `NUMERIC`
    - The approximate numeric data types: `FLOAT` and `DOUBLE`
  - Date and Time Data Types: `DATE`, `TIME`, `DATETIME`, `TIMESTAMP`
  - Date and Time Functions:
    - `DATE_FORMAT(date,format)`
    - Time:
      - `TIMEDIFF(expr1,expr2)`
      - `SUBTIME(expr1,expr2)` and `ADDTIME(expr1,expr2)`
    - Date:
      - `DATEDIFF(expr1,expr2)`
      - `DATE_ADD(date,INTERVAL expr unit)` and `DATE_SUB(date,INTERVAL expr unit)`
    - Timestamp:
      - `TIMESTAMPDIFF()`
      - `TIMESTAMPADD()` and `TIMESTAMPDIFF()`

### Section 11: Comparison and Logical Operations

- References:
  - [Slide 11: Comparison and Logical Operators](./resources/slides/11-slide-comparison-and-logical-operators.pdf)
- Summary:
  - Comparison Operators:
    - Equal: `=`
    - Not equal: `<>` or `!=`
    - Greater than `>` and Greater than or equal: `>=`
    - Less than `<` and Less than or equal: `<=`
  - Logical Operators:
    - `LIKE`
    - `NOT`
    - `AND`,
    - `OR`
    - `BETWEEN`
    - `IN`
  - Arithmetic Operators: Modulo: `%`
  - `IS NULL` and `IS NOT NULL` operators
  - CASE Statement: `CASE`
  - Compare Date time with `CAST()` function
- Example and Practices:
  - [Example](./source/section_11-example.sql)
  - [Practices](./source/section_11-practice.sql)

### Section 12: Constraints and `ALTER TABLE` statement

- References:
  - [Slide 12: Constraints and Alter table](./resources/slides/12-slide-constraints-and-alter-table.pdf)
  - [MySQL: Alter table statement](https://dev.mysql.com/doc/refman/8.0/en/alter-table.html)
- Summary:
  - Constraints:
    - `UNIQUE`: all values in a column are different
    - `CHECK`: values in a column satisfies a specific condition
    - `CONSTRAINT`: provide a name for the constraint; combine multi-column checks
  - `ALTER TABLE` statement:
    - To add, delete, or modify columns in an existing table.
      - `{ADD | DROP | RENAME | MODIFY} COLUMN`: add, delete, rename, and modify column
      - `CHANGE COLUMN`: to rename a column and change its data type
    - To add, delete, or modify constraints in an existing table
      - `{ADD | DROP} CONSTRAINT`: add and delete constraints
      - `ALTER TABLE` and `MODIFY`: modify constraints
  - Rename table:
    - `RENAME TABLE`
    - `ALTER TABLE <old_name> RENAME TO <new_name>`

- [Example](./source/section_12-example.sql)

### Section 13 and 14: Relationship

- References:
  - [Slide 13: One-to-Many and Joins](./resources/slides/13-slide-one-to-many-and-joins.pdf)
  - [Slide 14: Many-to-Many](./resources/slides/14-slide-many-to-many.pdf)
  - The `tv_Series` database for section 14: [TV_SERIES data](./source/section_14-initial_tv_series.sql)
- Summary:
  - Functions:
    - `IFNUll(expression, alt_value)`: Return `alt_value` if the expression is NULL, otherwise return the `expression`.
    - `ROUND(number, decimals)`: Rounds a `number` to a specific `decimals` of decimal places.
    - `IF(condition, value_if_true, value_if_false)`: Returns `value_if_true` if a condition is TRUE, or `value_if_false` if a condition is FALSE.
  - Constraints:
    - `FOREIGN KEY`:
      - Used to prevent actions that would destroy links between tables
      - The `FK` is a filed (or collection of field) in one table (called the child table), that refers to the `PK` in another table (called the the referenced or parent table)
      - It can prevents invalid data from being inserted into the foreign key column, because it has to be one of the values contained in the parent table.
    - `ON DELETE CASCADE`: to delete the rows from the child table automatically, when the rows from the parent table are deleted
  - Relationship Basics:
    - One-to-One: `1:1`
    - One-to-Many: `1:n`
    - Many-to-Many: `n-m`
  - Joins: A - B
    - Cross Join:
      - Select all records from A, and all records from B
    - Inner Join: `JOIN ... ON` or `INNER JOIN ... ON`
      - Select all records from A and B where the join condition is met
    - Left Join: `LEFT JOIN ... ON`
      - Select all records from A, along with any matching records in B.
    - Right Join: `RIGHT JOIN`
      - Select all records from B, along with any matching records in A.
- Example and Practices:
  - [Example: Section 13](./source/section_13-example.sql)
  - [Practices: Section 13](./source/section_13-practice.sql)
  - [Practices: Section 14](./source/section_14-practice.sql)

### Section 15: Views

- References:
  - [MySQL: Views](https://dev.mysql.com/doc/refman/8.0/en/views.html)
  - [Serve SQL Modes](https://dev.mysql.com/doc/refman/8.0/en/sql-mode.html)
- Summary:
  - MySQL Views:
    - Stored queries that when invoked produce a result set.
    - A view acts as a virtual table: contains rows and columns, just like a real table
    - MySQL supports views, including update table views.
    - View syntax:
      - Create: `CREATE VIEW`

        ```sql
        CREATE VIEW view_name AS
            SELECT column1, column2, ...
            FROM table_name
            WHERE condition;
        ```

      - Update view:
        - `CREATE OR REPLACE VIEW`: can be create (if view is not exist) or update view
        - `ALTER VIEW`: only can update view

        ```sql
        -- Usage: CREATE OR REPLACE VIEW
        CREATE OR REPLACE VIEW view_name AS
        SELECT column1, column2, ...
        FROM table_name
        WHERE condition;

        -- Usage: ALTER VIEW
        ALTER VIEW view_name AS
        SELECT column1, column2, ...
        FROM table_name
        WHERE condition;

        ```

      - Delete: `DROP VIEW`

        ```sql
        DROP VIEW view_name;
        ```

    - Notes:
      - A view table can be used to specify tables to be updated in data change statement (e.g. `UPDATE`, `DELETE`, and `INSERT` to update the contents of the underlying table). But a view is not updatable if it contains any of the following: [Updatable and Insertable Views](https://dev.mysql.com/doc/refman/8.0/en/view-updatability.html)
        - Aggregate functions or window functions
        - `DISTINCT`
        - `GROUP BY`
        - `UNION`
        - etc
  - The `HAVING` clause: like the `WHERE` clause, specifies selection conditions.

    | `WHERE` clause                                                                              | `HAVING` clause                                                         |
    | ------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------- |
    | Specifies conditions on columns in the select list, but cannot refer to aggregate functions | Specifies conditions on groups, typically formed by the GROUP BY clause |

  - The `GROUP BY` clause permits a `WITH ROLLUP` modifier that causes summary output to include extra rows that represent higher-level (that is, super-aggregate)
    - If the `GROUP BY` has multiple columns, the `ROLLUP` has more complex effect. In this case, each time there is a change in value in any but the last grouping column, the query produces an extra super-aggregate summary row.
  - Server SQL Modes:

    |                  | Global                            | Session                            |
    | ---------------- | --------------------------------- | ---------------------------------- |
    | Scope            | Global                            | Session                            |
    | Setting SQL Mode | `SET GLOBAL sql_model = '<mode>'` | `SET SESSION sql_model = '<mode>'` |
    | View Modes       | `SELECT @@GLOBAL.sql_mode`        | `SELECT @@SESSION.sql_mode`        |

    - The most important SQL mode common:
      - `STRICT_TRANS_TABLES`
      - `ONLY_FULL_GROUP_BY`
      - `NO_ZERO_IN_DATE`
      - ...etc

- Examples:
  - [Views](/source/section_15-example_view.sql)
  - [`HAVING` and `ROLLUP` for `GROUP BY`](/source/section_15-example_having_and_rollup_for_group_by.sql)
  - [Model](/source//section_15-example_model.sql)

### Section 16 Window Functions

- References:
  - [Slide: 16 Window Functions](./resources/slides/16-slide-window-functions.pdf)
  - [MySQL: Window Functions](https://dev.mysql.com/doc/refman/8.0/en/window-functions.html)
  - Database for practice: [Initial Employees](./source/section_16-initial_employees.sql)
- Summary:
  - What is a Window Functions?
    - MySQL supports window functions that, for each row from a query, perform a calculation using rows related to that row.
    - It does without collapsing rows like `GROUP BY` does.
  - The `OVER()` clause specifies how to partition query rows into groups for processing by the window function:
    - With Empty: treats the entire set of query rows as a single partition
    - With Clauses:
      - `PARTITION BY`: Divides rows into partitions
      - `ORDER BY`: Defines ordering within partitions
      - etc
    - Standard aggregates can use `OVER()` clause: `AVG()`, `COUNT()`, `MAX()`, `MIN()`, `SUM()`, etc.
  - Window Functions:
    - `ROW_NUMBER()`: Number of current row within its partition
    - `RANK()`: Rank of current row within its partition, with gaps (e.g.: 1,2,3,3,5)
    - `DENSE_RANK()`: Rank of current row within its partition, without gaps (e.g: 1,2,3,3,4)
    - `NTILE()`: Bucket number of current row within its partition (divides into n groups)
    - `FIRST_VALUE(expr)`: Value of argument from first row of window frame
    - `LAST_VALUE(expr)`: Value of argument from last row of window frame
    - `NTH_VALUE(expr)`: Value of argument from nth row of window frame
    - `LEAD(expr, offset, default)`: Value of argument from row leading current row within partition
    - `LAG(expr, offset, default)`: Value of argument from row lagging current row within partition
- [Example](./source/section_16-example.sql)

### Section 17-18: Instagram Database Clone

- References:
  - [Slide: 17-18 Instagram Database Clone](./resources/slides/17-18-slide-instagram-database-clone.pdf)
  - [Dataset for Instagram](./source/section_18-dataset-ig.sql)
- Practices:
  - [Create Instagram Database](./source/section_17-practice_instagram.sql)
  - [Instagram Challenge](./source/section_18-practice_instagram_challenge.sql)

### Section 19: Database Triggers

- References:
  - [Slide: 19 Database triggers](./resources/slides/19-slide-database-triggers.pdf)
  - [MySQL Error](https://dev.mysql.com/doc/mysql-errors/8.4/en/server-error-reference.html)
  - [Initial Instagram Database](./source/section_19-initial-ig.sql)
- Summary
  - MySQL Trigger:
    - MySQL Trigger: SQL statements that are AUTOMATICALLY EXECUTED when a specific database event occurs on a table
    - Working with Trigger
      - Get all triggers: `SHOW TRIGGERS`
      - Get triggers for specific table: `SHOW TRIGGERS FROM database_name WHERE Table = 'table_name'`
      - Delete a trigger: `DROP TRIGGER [IF EXISTS] trigger_name`
      - Creating a trigger:
        - `trigger_name`: Common format is `[trigger_time]_[table_name]_[event]`
        - `trigger_time`:  `BEFORE` or `AFTER`
        - `trigger_event`: `INSERT`, `UPDATE`, or `DELETE`

        ```sql
        DELIMITER $$
        CREATE TRIGGER trigger_name
          trigger_time trigger_event ON table_name FOR EACH ROW
        BEGIN
          -- trigger logic here
        END$$
        DELIMITER ;
        ```

    - Notes:
      - Each trigger tracks only one event on one table
      - Use `NEW.column_name` and `OLD.column_name` to reference new and old values
      - `NEW` not available for `DELETE`, `OLD` not available for `INSERT`
  - MySQL Error Handling:
    - Error components:
      - Numeric error code (e.g., 1146) - MySQL-specific
      - Five-character `SQLSTATE value` (e.g., '42S02') - standardized across databases
      - Message string - textual description
    - Custom Error Signaling
      - Common SQLSTATE codes:
        - `'45000'` - General user-defined error
        - `'23000'` - Integrity constraint violation

      ```sql
      SIGNAL SQLSTATE 'sqlstate_code'
        SET MESSAGE_TEXT = '<your_error_message>';
      ```

  - `DELIMITER`: Used to change statement delimiter when creating triggers with semicolons

    ```sql
    DELIMITER <character>

    <character>
    DELIMITER;
    ```

  - Best Practices:
    - Always use `DELIMITER` when creating triggers with multiple statements
    - Include `IF EXISTS` when dropping triggers to avoid errors

- [Example](./source/section_19-example.sql)
- [Practice](./source/section_19-practice.sql)

### Section 20: Introduction NodeJS

- References:
  - [Slide: 20 Introduction NodeJS](./resources/slides/20-slide-introducing-node.pdf)
  - [Initial database](./source/section_20-intro-nodejs/section_20-initial.sql)
  - [Source: NodeJS](./resources/section_20-intro-nodejs-and-mysql.zip)
- [Example](./source/section_20-intro-nodejs/app.js)
- [Practice: Query](./source/section_20-intro-nodejs/section_20-practice.sql)

---

## References

- [Udemy course](https://www.udemy.com/course/the-ultimate-mysql-bootcamp-go-from-sql-beginner-to-expert/)
- [MySQL 8.4 Reference Manual](https://dev.mysql.com/doc/refman/8.4/en/)
  - [PDF: MySQL 8.4 Reference Manual](./resources//mysql-refman-8.4.pdf)

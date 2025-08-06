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

---

## References

- [Udemy course](https://www.udemy.com/course/the-ultimate-mysql-bootcamp-go-from-sql-beginner-to-expert/)
- [MySQL 8.4 Reference Manual](https://dev.mysql.com/doc/refman/8.4/en/)
  - [PDF: MySQL 8.4 Reference Manual](./resources//mysql-refman-8.4.pdf)

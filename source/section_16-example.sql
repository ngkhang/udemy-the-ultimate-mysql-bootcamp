-- OVER()
SELECT
  department,
  SUM(salary) OVER () as total_payroll
FROM
  employees;

-- OVER() with PARTITION BY
SELECT
  department,
  SUM(salary) OVER () as total_payroll,
  SUM(salary) OVER (
    PARTITION BY
      department
  ) as depart_payroll
FROM
  employees;

-- OVER() with ORDER BY
SELECT
  *,
  SUM(salary) OVER (
    PARTITION BY
      department
    ORDER BY
      salary
  ) as total_depart_payroll,
  MIN(salary) OVER (
    PARTITION BY
      department
    ORDER BY
      salary DESC
  ) as min_depart
FROM
  employees;

-- RANK()
SELECT
  *,
  RANK() OVER (
    PARTITION BY
      department
    ORDER BY
      salary DESC
  ) AS dept_salary_rank,
  RANK() OVER (
    ORDER BY
      salary DESC
  ) as overall_rank_salary
FROM
  employees
ORDER BY
  department;

-- DENSE_RANK() and `ROW_NUMBER()`
SELECT
  *,
  RANK() OVER (
    ORDER BY
      salary DESC
  ) as overall_rank_salary,
  DENSE_RANK() OVER (
    ORDER BY
      salary DESC
  ) as overall_dense_rank,
  ROW_NUMBER() OVER (
    ORDER BY
      salary DESC
  ) as dept_row_number
FROM
  employees;

-- NTILE()
SELECT
  *,
  NTILE (4) OVER (
    PARTITION BY
      department
    ORDER BY
      salary DESC
  ) AS depart_salary_quartitle,
  NTILE (4) OVER (
    ORDER BY
      salary DESC
  ) AS salary_quartilte
FROM
  employees;

-- FIRST_VALUE()
SELECT
  *,
  FIRST_VALUE (emp_no) OVER (
    PARTITION BY
      department
    ORDER BY
      salary DESC
  ) AS highest_depart_emp_salary,
  FIRST_VALUE (emp_no) OVER (
    ORDER BY
      salary DESC
  ) AS highest_emp_salary
FROM
  employees;

-- LAST_VALUE() and NTH_VALUE()
SELECT
  *,
  FIRST_VALUE (emp_no) OVER (
    ORDER BY
      salary DESC
  ) as highest_paid_emp,
  LAST_VALUE (emp_no) OVER (
    ORDER BY
      salary DESC ROWS BETWEEN UNBOUNDED PRECEDING
      AND UNBOUNDED FOLLOWING
  ) as lowest_emp_salary,
  NTH_VALUE (emp_no, 4) OVER (
    ORDER BY
      salary DESC
  ) as '4th_highest_paid_emp'
FROM
  employees
ORDER BY
  salary;

-- LEAD() and LAG()
SELECT
  *,
  salary - LAG (salary) OVER (
    ORDER BY
      salary DESC
  ) AS salary_diff_previous,
  salary - LEAD (salary) OVER (
    ORDER BY
      salary DESC
  ) AS salary_diff_next
FROM
  employees;
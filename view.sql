
SELECT * FROM employees;

CREATE View dept_avg_salary
AS 
SELECT department_name, avg(salary) FROM employees GROUP BY department_name;

CREATE View test_view
AS 
SELECT empployee_name, salary, department_name FROM employees
WHERE department_name in 
(SELECT department_name FROM employees WHERE department_name LIKE '%R%')

SELECT * FROM dept_avg_salary;
SELECT * FROM test_view;

-- can return a single value 
--  Can return multiple rows
--  Can return a single column





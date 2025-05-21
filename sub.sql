CREATE TABLE employees(
    employee_id SERIAL PRIMARY KEY,
    empployee_name VARCHAR(50) NOT NULL,
    department_name VARCHAR(50),
    salary DECIMAL(10, 2),
    hire_date DATE
);


INSERT INTO employees (empployee_name, department_name, salary, hire_date) VALUES
('John Doe','HR', 60000.00, '2022-01-10'),
('Jane Smith', 'Marketing', 75000.00, '2021-05-22'),
('Michael Johnson', 'Finance', 82000.00, '2020-03-15'),
('Emily Davis', 'IT', 58000.00, '2023-07-01'),
('David Brown', 'Sales', 67000.00, '2021-11-10'),
('Sarah Wilson', 'Engineering', 91000.00, '2019-09-25'),
('Chris Miller', 'Customer Support', 72000.00, '2020-12-03'),
('Amanda Moore', 'Administration', 63000.00, '2022-04-18'),
('Daniel Taylor', 'Research', 70000.00, '2023-01-05'),
('Laura Anderson', 'Quality Assurance', 95000.00, '2020-06-30'),
('James Thomas', 'Sales', 81000.00, '2018-10-12'),
('Jessica Martin', 'Marketing', 69000.00, '2022-08-20'),
('Brian Lee', 'HR', 62000.00, '2021-03-11'),
('Rebecca White', 'Administration', 84000.00, '2023-05-08'),
('Matthew Harris', 'Quality Assurance', 97000.00, '2019-01-19'),
('Olivia Clark', 'Sales', 61000.00, '2023-02-14'),
('Kevin Lewis', 'Sales', 68000.00, '2020-07-27'),
('Megan Walker', 'Customer Support', 76000.00, '2021-09-05'),
('Andrew Hall', 'Quality Assurance', 93000.00, '2018-04-23'),
('Natalie Young', 'Engineering', 59000.00, '2022-10-09');


SELECT * FROM employees;
-- Retrieve all employees whose salary is greater than the highest salary of the HT department 
-- 62000
-- //! SELECT * from employees WHERE salary > 62000;
SELECT * from employees WHERE department_name = 'HR';
SELECT max(salary) from employees WHERE department_name = 'HR';

-- nested query // 
SELECT * from employees WHERE salary > (SELECT max(salary) from employees WHERE department_name = 'HR');



-- ************************************    **********************************
-- can return a single value 
--  Can return multiple rows
--  Can return a single column
SELECT *, (SELECT sum(salary)FROM employees) from employees;


SELECT department_name, sum(salary) from employees GROUP BY department_name;

--  for single data
SELECT * from  -- outer query/main query
(SELECT department_name, sum(salary) from employees GROUP BY department_name); -- sub query
SELECT department_name from (SELECT department_name, sum(salary) from employees GROUP BY department_name);

--  for multiple data
SELECT empployee_name, salary, department_name FROM employees
WHERE department_name in 
(SELECT department_name FROM employees WHERE department_name LIKE '%R%');








DROP TABLE employees;
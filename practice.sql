CREATE TABLE employees(
    employee_id SERIAL PRIMARY KEY,
    empployee_name VARCHAR(50),
    department_id INT REFERENCES departments(department_id),
    salary DECIMAL(10, 2),
    hire_date DATE
);

CREATE TABLE departments (
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(50)
);

INSERT INTO departments (department_name) VALUES
('HR'),
('Marketing'),
('Finance'),
('IT'),
('Sales'),
('Engineering'),
('Customer Support'),
('Administration'),
('Research'),
('Quality Assurance');

INSERT INTO employees (empployee_name, department_id, salary, hire_date) VALUES
('John Doe', 1, 60000.00, '2022-01-10'),
('Jane Smith', 2, 75000.00, '2021-05-22'),
('Michael Johnson', 3, 82000.00, '2020-03-15'),
('Emily Davis', 1, 58000.00, '2023-07-01'),
('David Brown', 2, 67000.00, '2021-11-10'),
('Sarah Wilson', 4, 91000.00, '2019-09-25'),
('Chris Miller', 3, 72000.00, '2020-12-03'),
('Amanda Moore', 1, 63000.00, '2022-04-18'),
('Daniel Taylor', 2, 70000.00, '2023-01-05'),
('Laura Anderson', 4, 95000.00, '2020-06-30'),
('James Thomas', 3, 81000.00, '2018-10-12'),
('Jessica Martin', 2, 69000.00, '2022-08-20'),
('Brian Lee', 1, 62000.00, '2021-03-11'),
('Rebecca White', 3, 84000.00, '2023-05-08'),
('Matthew Harris', 4, 97000.00, '2019-01-19'),
('Olivia Clark', 1, 61000.00, '2023-02-14'),
('Kevin Lewis', 2, 68000.00, '2020-07-27'),
('Megan Walker', 3, 76000.00, '2021-09-05'),
('Andrew Hall', 4, 93000.00, '2018-04-23'),
('Natalie Young', 1, 59000.00, '2022-10-09');


SELECT * FROM employees
JOIN departments ON employees.department_id = departments.department_id;

SELECT * FROM employees
JOIN departments USING(department_id);

SELECT empployee_name, round(avg(salary)) as avg_salary FROM employees
JOIN departments USING(department_id)
GROUP BY empployee_name;
SELECT empployee_name, count(*) FROM employees
JOIN departments USING(department_id)
GROUP BY empployee_name;

SELECT department_name, round(avg(salary)) as avg_salary FROM employees
JOIN departments USING(department_id)
GROUP BY department_name 
ORDER BY avg_salary DESC
LIMIT 1;

SELECT extract(YEAR from hire_date) as hire_year, count(*) from employees
GROUP BY hire_year;

SELECT * FROM departments;
SELECT * FROM employees


--  find customers who have placed more than 2 orders and calculate the total amount spent by each of these customers.
CREATE TABLE orders(
    order_id SERIAL PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2)
    
);

INSERT INTO orders (customer_id, order_date, total_amount) VALUES
(1, '2022-01-05', 100.50),
(2, '2022-02-07', 200.75),
(1, '2022-02-08', 150.25),
(3, '2022-01-10', 500.00),
(2, '2022-03-15', 180.50),
(3, '2022-02-20', 220.25),
(1, '2022-01-25', 90.00),
(2, '2022-01-28', 120.75),
(3, '2022-04-01', 250.50),
(4, '2022-02-09', 290.00),
(5, '2022-01-21', 160.50),
(3, '2023-03-26', 130.50),
(2, '2025-01-12', 210.00),
(1, '2022-04-05', 180.25);


SELECT * FROM orders;
SELECT customer_id, count(order_id), sum(total_amount) as total_spent FROM orders GROUP BY customer_id HAVING count(order_id) > 2;

--  find the total amount of orders placed each month is the year 2022.
SELECT extract(month from order_date) as month, sum(total_amount) FROM orders WHERE extract(year from order_date) = 2022 GROUP BY month;

DROP TABLE orders;







DROP TABLE employees;
DROP TABLE departments
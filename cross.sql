CREATE TABLE employees(
    emp_id INT,
    emp_name VARCHAR(50),
    dept_id INT
);

CREATE TABLE departments (
    dept_id INT,
    dept_name VARCHAR(50)
);

INSERT INTO employees VALUES(1, 'John Done', 101);

INSERT INTO employees VALUES(2, 'Jane Smaith', 102);


INSERT INTO departments VALUES(101, 'Human Resources');

INSERT INTO departments VALUES(102, 'Marketing');

SELECT * FROM employees;
SELECT * FROM departments;



-- Cross Join
SELECT * FROM employees
CROSS JOIN departments;

-- NATURAL Join
SELECT * FROM employees
NATURAL JOIN departments;



DROP TABLE departments
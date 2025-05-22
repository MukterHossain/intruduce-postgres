



SELECT * FROM employees;

EXPLAIN ANALYSE
SELECT * FROM employees WHERE empployee_name = 'Olivia Clark';

EXPLAIN ANALYSE
SELECT * from employees WHERE emp_no = '10004';

CREATE INDEX idx_employees_last_name
on employees (last_name);

SHOW data_directory;

SELECT * FROM jobeyer;
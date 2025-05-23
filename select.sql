CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    age INT,
    grade CHAR(2),
    course VARCHAR(50),
    email VARCHAR(100),
    dob DATE,
    blood_group VARCHAR(5),
    country VARCHAR(50)
);
--  insert data into the table
-- INSERT INTO students (
    first_name, last_name, age, grade, course, email, dob, blood_group, country
) VALUES
('John', 'Doe', 20, 'A', 'Math', 'john.doe@example.com', '2004-01-15', 'O+', 'USA'),
('Jane', 'Smith', 21, 'B', 'History', 'jane.smith@example.com', '2003-05-20', 'A-', 'Canada'),
('Alice', 'Johnson', 22, 'C', 'Physics', 'alice.johnson@example.com', '2002-07-18', 'B+', 'UK'),
('Bob', 'Williams', 23, 'A', 'Chemistry', 'bob.williams@example.com', '2001-03-07', 'AB', 'Australia'),
('Charlie', 'Brown', 22, 'B', 'English', NULL, '2004-03-30', 'O-', 'New Zealand'),
('Emma', 'Jones', 23, 'C', 'Biology', 'emma.jones@example.com', '2000-02-12', 'B+', 'USA'),
('Michael', 'Johnson', 21, 'A', 'Physics', 'michael.johnson@example.com', '2003-11-01', 'A-', 'Canada'),
('Olivia', 'Davis', 20, 'B', 'Math', 'olivia.davis@example.com', '2003-12-18', 'O+', 'UK'),
('William', 'Brown', 20, 'C', 'Biology', NULL, '2001-08-30', 'AB-', 'USA'),
('Sophia', 'Moore', 22, 'A', 'English', 'sophia.brown@example.com', '2002-01-20', 'B+', 'New Zealand'),
('Liam', 'Miller', 21, 'B', 'History', 'liam.miller@example.com', '2001-06-11', 'O+', 'USA'),
('Ava', 'Anderson', 23, 'C', 'Biology', 'ava.anderson@example.com', '2000-07-08', 'B-', 'Canada'),
('Noah', 'Martinez', 22, 'B', 'Physics', NULL, '2001-01-28', 'O-', 'UK'),
('Isabella', 'Clark', 21, 'A', 'Chemistry', 'isabella.clark@example.com', '2003-12-05', 'AB+', 'Australia'),
('Ethan', 'Garcia', 23, 'A', 'Math', 'ethan.garcia@example.com', '2002-07-22', 'B+', 'New Zealand'),
('Sophie', 'Moore', 20, 'B', 'English', 'sophie.moore@example.com', '2004-02-11', 'A-', 'USA'),
('Mia', 'Hernandez', 22, 'C', 'History', 'mia.hernandez@example.com', '2001-05-18', 'B+', 'Canada'),
('James', 'Young', 20, 'A', 'Biology', 'james.young@example.com', '2003-02-08', 'O+', 'USA'),
('Gonzalez', '', 21, 'B', 'Physics', NULL, '1999-09-30', 'O-', 'Australia');

--  show all the tables in the database
SELECT * FROM students;

--  show the structure of the table
SELECT FROM students;
--  show the specific data field of the table
SELECT email, age, blood_group FROM students;

--  show the specific data field of the table with condition with alias
SELECT email as "Student Email", age FROM students;

-- show data with sorting
SELECT * FROM students ORDER BY first_name ASC;

SELECT * FROM students ORDER BY dob ASC;
SELECT * FROM students ORDER BY dob DESC;

SELECT * FROM students ORDER BY age DESC;

-- show data with sorting and condition
SELECT country from students ORDER BY country ASC;

-- **************************** Filter  **************************************
-- show data with filtering specific data 
SELECT DISTINCT country from students ;

-- data filter 
-- select students from the USA
-- select students with 'A' grade in Physics
-- select students with a specific blood group('A+')
-- select students from the USA or from Australia
-- select students from the USA or from Australia with age is 20
-- select students with a grade of 'A' or 'B' Math or Physics
-- select students older than 20


SELECT DISTINCT blood_group from students ;

SELECT * from students WHERE country = 'USA';
SELECT * from students WHERE grade = 'A' AND course = 'Physics';
SELECT * from students WHERE blood_group = 'B+';
SELECT * from students WHERE country = 'USA' OR country = 'Australia';
SELECT * from students WHERE (country = 'USA' OR country = 'Australia') AND age = 20;
SELECT * from students WHERE (grade = 'A' OR grade = 'B') AND (course = 'Math' OR course = 'Physics');
SELECT * FROM students WHERE age > 20;
SELECT * FROM students WHERE age > 20 AND course='History';
SELECT * FROM students WHERE age < 20 ;
SELECT * FROM students WHERE age <= 20 ;
SELECT * FROM students WHERE age != 20 ;   -- not equal (!= or <>)





-- **************************** Uppercase  **************************************

-- show data with uppercase only first name
SELECT upper(first_name) from students;
-- show data with uppercase with all data
SELECT upper(first_name), * from students;
SELECT upper(first_name) as first_name_in_upper_case, * from students;

-- data with concat 
SELECT concat(first_name, ' ' , last_name) from students;


-- **************************** Scalar function  **************************************
/* 
UPPER() Converts a string to uppercase.
LOWER() Converts a string to lowercase.
CONCAT() Concatenates two or more strings.
LENGTH() Returns the length of a string.
*/
SELECT length(first_name) from students;


-- **************************** Aggregate function  **************************************
/*
AVG() Calculate the average of a set of values.
MAX() Returns the maximum value in a set.
MIN() Returns the minimum value in a set.
SUM() Returns the total sum of a set of values.
COUNT() Counts the number of rows in a set.
*/
SELECT avg(age) from students;
SELECT MAX(age) from students;
SELECT MIN(age) from students;
SELECT SUM(age) from students;
SELECT COUNT(*) from students;

SELECT MAX(length(first_name)) from students;






-- **************************** NOT, Null  **************************************

SELECT * from students WHERE NOT country = 'Australia';
SELECT * from students WHERE country <> 'USA';

SELECT * from students
WHERE email = 'bob.williams@example.com';
-- SELECT * from students
-- WHERE email = NULL;  --Invalid NULL comparison: use IS NULL or IS NOT NULL operators

-- data with NUll
SELECT * from students
WHERE email IS NULL;
--  data with out NUll
SELECT * from students
WHERE email IS NOT NULL;


-- **************************** COALESCE  **************************************
SELECT COALESCE(email, 'No Email') from students;
SELECT COALESCE(email, 'No Email') as "Email", blood_group, first_name from students;







-- ****************** IN, Between, LIKE (Case Sensetive) ILIKE (Case Insensetive) *******************
SELECT * from students WHERE country = 'USA' OR country = 'Canada';
SELECT * from students WHERE country IN ('USA', 'Canada', 'Australia');
SELECT * from students WHERE country NOT IN ('USA', 'Canada', 'Australia');

SELECT * from students 
WHERE age BETWEEN 20 AND 25;

SELECT * from students 
WHERE dob BETWEEN '2000-01-01' AND '2005-01-01';

SELECT * from students 
WHERE dob BETWEEN '2000-01-01' AND '2005-01-01' ORDER BY dob;


SELECT * from students 
WHERE first_name LIKE '%am';
SELECT * from students 
WHERE first_name LIKE '%a';
SELECT * from students 
WHERE first_name LIKE 'a%';
SELECT * from students 
WHERE first_name LIKE 'A%'; -- LIKE (Case Insensetive)
SELECT * from students 
WHERE first_name ILIKE 'a%'; -- ILIKE (Case Insensetive)

-- first two letter any third (a) then any letter
SELECT * from students
WHERE first_name LIKE '_a%'

SELECT * from students
WHERE first_name LIKE '__a%'

SELECT * from students
WHERE first_name LIKE '__a_'




-- **************************** LIMIT, OFFSET  **************************************
SELECT * from students LIMIT 5;

SELECT * from students WHERE country IN ('USA', 'Canada', 'Australia') LIMIT 5;

SELECT * from students LIMIT 5 OFFSET 2; 
SELECT * from students LIMIT 5 OFFSET 5;

-- pagination
SELECT * from students LIMIT 5 OFFSET 5 *0;
SELECT * from students LIMIT 5 OFFSET 5 *1;
SELECT * from students LIMIT 5 OFFSET 5 *2;
SELECT * from students LIMIT 5 OFFSET 5 *3;


-- **************************** Delete **************************************
SELECT * FROM students

DELETE FROM students 
WHERE grade = 'B';
DELETE FROM students 
WHERE grade = 'C' AND country = 'USA';


-- **************************** Update **************************************

SELECT * FROM students

UPDATE  students
set email = 'default@gmail.com' 
WHERE student_id = 15;

UPDATE  students
set email = 'default@gmail.com', age = 60 
WHERE student_id = 15;


SELECT * FROM learners;





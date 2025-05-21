SHOW timezone;

SELECT now();

SELECT * from timeZ

CREATE table timeZ (ts TIMESTAMP without time zone, tsz TIMESTAMP with time zone)

INSERT INTO timeZ VALUES('2024-01-12 10:45:00', '2024-01-12 10:45:00')

SELECT CURRENT_DATE;

SELECT now()::date;
SELECT now()::time;

SELECT to_char(now(), 'yyyy/mm/dd')

SELECT to_char(now(), 'dd/mm/yyyy')

SELECT to_char(now(), 'mm/dd/yyyy')

SELECT to_char(now(), 'mm/yyyy/dd')

SELECT to_char(now(), 'Month')

SELECT to_char(now(), 'mm')

SELECT CURRENT_DATE - INTERVAL '1 year';
SELECT CURRENT_DATE - INTERVAL '1 month';

--  age
SELECT age(CURRENT_DATE, '1996-01-25');

SELECT * from students


-- date cast with extract
SELECT *, age(CURRENT_DATE, dob) from students;
SELECT extract(year from '2025-05-20'::date);
SELECT extract(month from '2025-05-20'::date);
SELECT extract(day from '2025-05-20'::date);

SELECT 0::BOOLEAN;
SELECT 'y'::BOOLEAN;
SELECT 1::BOOLEAN;




-- ****************************** GROUP BY ********************************* 

SELECT country from students 
GROUP BY country;

SELECT country, count(*), avg(age) from students 
GROUP BY country;

--  Filter Groups Using HAVING to Show Only countries Age above 22
SELECT country, avg(age) from students 
GROUP BY country
HAVING avg(age) > 22;

-- Count students Born in each year
SELECT extract(year from dob) as birth_year, count(*) from students 
GROUP BY birth_year;




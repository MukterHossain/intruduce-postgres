-- Active: 1747702325445@@127.0.0.1@5432@ph
SELECT * FROM person2


-- Add a new column to the table
ALTER TABLE person2     
     ADD COLUMN email VARCHAR(50) DEFAULT 'default@mail.com' NOT NULL;




INSERT INTO person2 VALUES(6, 'Naksha', 23, 'naksha@gmail.com')


-- delete the column
ALTER TABLE person2     
     DROP COLUMN email 



-- rename the column
ALTER table person2
 rename COLUMN age to user_age;


--  change the specific column data type
ALTER Table person2
alter COLUMN user_name type VARCHAR(60);


-- set constraint on the column
ALTER Table person2
alter COLUMN user_age set not null;


-- remove constraint on the column
ALTER Table person2
alter COLUMN email DROP not null;




-- set unique constraint on the column
ALTER Table person2
ADD constraint unique_person2_age UNIQUE(user_age);


-- Delete unique constraint on the column
ALTER Table person2
DROP constraint unique_person2_age ;

-- Delete table
DROP Table person4
 
-- Delete only data from the table without structural changes
TRUNCATE Table person3
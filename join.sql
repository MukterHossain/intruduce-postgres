CREATE table "user"(
    id SERIAL PRIMARY KEY,
    username VARCHAR(25) NOT NULL
);
CREATE table post(
    id SERIAL PRIMARY KEY,
    title text NOT NULL,
    user_id INTEGER REFERENCES "user"(id)
);

ALTER table post 
alter COLUMN user_id set NOT NULL;

INSERT INTO "user" (username) VALUES
('akash'),
('batash'),
('sagor'),
('nodi');

INSERT INTO post (title, user_id) VALUES
('Enjoying a sunny day with Akash!', 2),
('Batash just shared an amazing recipe!', 1),
('Exploring advetures with Sagor', 4),
('Nodi wisdom always leaves me inspired', 4);

SELECT * from "user";
SELECT * from post;



SELECT * from post 
JOIN "user" on post.user_id = "user".id;

SELECT title, username from post 
JOIN "user" on post.user_id = "user".id;

SELECT post.id from post 
JOIN "user" on post.user_id = "user".id;

--  INNER JOIN
SELECT "user".id from post 
JOIN "user" on post.user_id = "user".id;
SELECT "user".id from post 
INNER JOIN "user" on post.user_id = "user".id;

-- alias
SELECT * from post as p
JOIN "user" u on p.user_id = u.id;
SELECT * from post p
JOIN "user" as u on p.user_id = u.id;

--  Change Order
SELECT * from "user" 
JOIN post on post.user_id = "user".id;


INSERT INTO post (id, title, user_id) VALUES
(5,'This is a test post title', NULL);

SELECT * from post as p
LEFT JOIN "user" u on p.user_id = u.id;

SELECT * from post as p
RIGHT JOIN "user" u on p.user_id = u.id;

SELECT * from post as p
FULL OUTER JOIN "user" u on p.user_id = u.id;




DROP TABLE "user";
DROP TABLE post;
CREATE table "user"(
    id SERIAL PRIMARY KEY,
    username VARCHAR(25) NOT NULL
);


-- CREATE table post(
--     id SERIAL PRIMARY KEY,
--     title text NOT NULL,
--     user_id INTEGER REFERENCES "user"(id)
-- );
-- CREATE table post(
--     id SERIAL PRIMARY KEY,
--     title text NOT NULL,
--     user_id INTEGER REFERENCES "user"(id) ON DELETE CASCADE
-- );
-- CREATE table post(
--     id SERIAL PRIMARY KEY,
--     title text NOT NULL,
--     user_id INTEGER REFERENCES "user"(id) ON DELETE set null
-- );
CREATE table post(
    id SERIAL PRIMARY KEY,
    title text NOT NULL,
    user_id INTEGER REFERENCES "user"(id)  ON DELETE set DEFAULT DEFAULT 2
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

/*
******  Insertion constraint on INSERT post ******
1. Attepting to insert a post with a user ID that does not exist
2. Inserting a post with a valid user ID
3. Atterpting to insert a post without specifying a user ID
*/

-- INSERT INTO post (title, user_id) VALUES('test', 8)
INSERT INTO post (title, user_id) VALUES('test', 2)

INSERT INTO post (title, user_id) VALUES('test', null)



/*
1. Deletion constraint on DELETE user
2. Cascading Deletion ==> ON DELETE CASCADE
3. Setting NULL ==> ON DELETE SET NULL
4. Restrict Deletion ==> ON DELETE RESTRICT / ON DELETE NO ACTION (default)
5. Set Default value ==> ON DELETE SET DEFAULT
*/

DELETE FROM "user"
WHERE id = 4


DROP TABLE "user";
DROP TABLE post;

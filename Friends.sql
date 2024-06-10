CREATE DATABASE friends ;

/* Create a table named friends */
CREATE TABLE friends (
    id INTEGER PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    birthday DATE NOT NULL
) ;

INSERT INTO friends (
    id, name, birthday
) VALUES (1, 'Ororo Munroe', '1940-05-30');

SELECT * FROM friends ;  /* Make sure that Ororo has been added to the database*/

INSERT INTO friends (
    id, name, birthday
) VALUES (2, 'Sarah Berkley', '2000-01-01') ;

INSERT INTO friends (
    id, name, birthday
) VALUES (3, 'Lisa Butte', '1990-03-12') ;


SELECT * FROM friends ; 


/* Ororo wants to change her name to Storm */
UPDATE friends SET name = 'Storm' WHERE id = 1;

/* Add a new column named email */
ALTER TABLE friends ADD COLUMN email VARCHAR(255) ;

UPDATE friends SET email = 'storm@mail.com' WHERE id = 1;
UPDATE friends SET email = 'sara@mail.com' WHERE id = 2;
UPDATE friends SET email = 'lisa@mail.com' WHERE id = 3;

/* Remove Storm from friends */
DELETE FROM friends WHERE id = 1 ;


SELECT * FROM friends ;

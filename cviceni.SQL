# CVICENI 1
SET PASSWORD for 'root'@'localhost' = password('root');
SET PASSWORD for 'root'@'127.0.0.1' = password('root');
SET PASSWORD for 'root'@'::1' = password('root');
SELECT * FROM users;
SELECT COUNT(*) FROM users;
SET name;

# CVICENI 2

CREATE DATABASE name;
CREATE TABLE table_name ();
INSERT INTO students (
 firstname,
 lastname,
 description,
 address,
 city,
 birthdate,
)
VALUES (
 'Mat�j'
 'Dalekorej'
 'Lenoch kterej chce jen hr�t hry'
 'Kluk U Sadu 227'
 'Pod�brady'
 '2002-03-18'
);


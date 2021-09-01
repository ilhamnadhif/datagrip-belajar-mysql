CREATE TABLE guestbooks
(
    id      INT NOT NULL AUTO_INCREMENT,
    email   VARCHAR(100),
    title   VARCHAR(100),
    content TEXT,
    PRIMARY KEY (id)
) ENGINE = InnoDB;

SHOW TABLES;
SELECT *
FROM customers;

INSERT INTO guestbooks(email, title, content)
VALUES ('guest1@gmail.com', 'Hello', 'Hello'),
       ('guest2@gmail.com', 'Hello', 'Hello'),
       ('guest3@gmail.com', 'Hello', 'Hello'),
       ('ilham@gmail.com', 'Hello', 'Hello'),
       ('ilham@gmail.com', 'Hello', 'Hello'),
       ('ilham@gmail.com', 'Hello', 'Hello');

SELECT *
FROM guestbooks;

SELECT DISTINCT email
FROM belajar_mysql.customers
UNION
SELECT DISTINCT email
FROM guestbooks;

SELECT DISTINCT email
FROM belajar_mysql.customers
UNION ALL
SELECT DISTINCT email
FROM guestbooks;

SELECT DISTINCT email
FROM belajar_mysql.customers
UNION ALL
SELECT DISTINCT email
FROM guestbooks;

SELECT emails.email, COUNT(emails.email)
FROM (SELECT email FROM customers UNION ALL SELECT email FROM guestbooks) AS emails
GROUP BY emails.email;

SELECT DISTINCT email
FROM guestbooks
WHERE email IN (SELECT DISTINCT email FROM belajar_mysql.customers);

SELECT DISTINCT customers.email
FROM guestbooks
         JOIN belajar_mysql.customers ON (guestbooks.email = belajar_mysql.customers.email);

SELECT DISTINCT customers.email, guestbooks.email
FROM belajar_mysql.customers
         LEFT JOIN
     guestbooks ON (customers.email = guestbooks.email)
WHERE guestbooks.email IS NULL;

START TRANSACTION;

INSERT INTO guestbooks(email, title, content)
VALUES
       ('contoh1@gmail.com', 'contoh', 'contoh'),
       ('contoh2@gmail.com', 'contoh', 'contoh'),
       ('contoh3@gmail.com', 'contoh', 'contoh');

SELECT * FROM guestbooks;

COMMIT ;

START TRANSACTION ;
DELETE FROM guestbooks;
ROLLBACK ;

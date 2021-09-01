USE belajar_mysql;

CREATE TABLE admin
(
    id         INT          NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(100) NOT NULL,
    last_name  VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
) ENGINE = InnoDB;

DESC admin;

INSERT INTO admin (first_name, last_name)
VALUES ('Ilham', 'Nadhif'),
       ('Ivana', 'Felia'),
       ('Afif', 'Arifin'),
       ('Misbakhuz', 'Zuhail'),
       ('Yanuar', 'Nauval');

SELECT *
FROM admin
ORDER BY id ASC;

DELETE
FROM admin
WHERE id = 5;

INSERT INTO admin (first_name, last_name)
VALUES ('Umi', 'Inayah');

SELECT LAST_INSERT_ID();

SELECT *
FROM products;

INSERT INTO products(id, name, category, price, quantity)
VALUES ('P0016', 'Permen', 'Lain-lain', 500, 1000);

ALTER TABLE products
    ADD CONSTRAINT price_check CHECK ( price >= 1000 AND price <= 1000000);

SELECT *
FROM products
WHERE price <= 1000;

UPDATE products
SET price = 1000
WHERE id = 'P0016';

DESC products;

SHOW CREATE table products;

INSERT INTO products(id, name, category, price, quantity)
VALUES ('P0017', 'Permen', 'Lain-lain', 500, 1000);

UPDATE products
SET price = 500
WHERE id = 'P0016';

ALTER TABLE products
    ADD FULLTEXT product_fulltext (name, description);

SHOW CREATE TABLE products;

SELECT *
FROM products
WHERE name LIKE '%ayam%'
   OR description LIKE '%ayam%';

SELECT *
FROM products
WHERE MATCH(name, description) AGAINST('ayam' IN NATURAL LANGUAGE MODE);

SELECT * FROM products WHERE MATCH(name, description) AGAINST ('+es -teh' IN BOOLEAN MODE );
SELECT * FROM products WHERE MATCH(name, description) AGAINST ('+es -teh' WITH QUERY EXPANSION );








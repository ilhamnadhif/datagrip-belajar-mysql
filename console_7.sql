CREATE TABLE wallet
(
    id          INT NOT NULL AUTO_INCREMENT,
    id_customer INT NOT NULL,
    balance     INT NOT NULL DEFAULT 0,
    PRIMARY KEY (id),
    UNIQUE KEY id_customer_unique (id_customer),
    CONSTRAINT fk_customer_wallet FOREIGN KEY (id_customer) REFERENCES customers (id)
) ENGINE = InnoDB;

DESC wallet;
SELECT *
FROM customers;
USE belajar_mysql;
SHOW TABLES;



INSERT INTO wallet(id_customer, balance)
VALUES (1, 200000);
INSERT INTO wallet(id_customer, balance)
VALUES (3, 1000000000);

SELECT *
FROM wallet;

SELECT customers.email, wallet.balance
FROM customers
         JOIN wallet ON (wallet.id_customer = customers.id);

SELECT *
FROM products;

ALTER TABLE products
    DROP CONSTRAINT fk_product_category;
DROP
COLUMN id_category;

DESC products;

ALTER TABLE products
    ADD CONSTRAINT fk_product_category FOREIGN KEY (id_category) REFERENCES categories (id);

CREATE TABLE categories
(
    id   VARCHAR(100) NOT NULL,
    name VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
) ENGINE = InnoDB;

INSERT INTO categories(id, name)
VALUES ('C0001', 'Makanan'),
       ('C0002', 'Minuman'),
       ('C0003', 'Lain-lain');

UPDATE products
SET products.id_category = 'C0001'
WHERE id IN ('P0001', 'P0002', 'P0003', 'P0004', 'P0008', 'P0009', 'P0010', 'P0016');

UPDATE products
SET products.id_category = 'C0002'
WHERE id IN ('P0005', 'P0006', 'P0007', 'P0013', 'P0014');

UPDATE products
SET products.id_category = 'C0003'
WHERE id IN ('P0011', 'P0012', 'P0016');

SELECT *
FROM products;
SELECT *
FROM categories;

SELECT products.name, categories.name
FROM categories
         JOIN products ON (products.id_category = categories.id);

DESC products;
CREATE TABLE orders
(
    id         INT NOT NULL AUTO_INCREMENT,
    total      INT NOT NULL,
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    primary key (id)
) ENGINE = InnoDB;


CREATE TABLE orders_detail
(
    id_product VARCHAR(100) NOT NULL,
    id_order   INT          NOT NULL,
    price      INT          NOT NULL,
    quantity   INT          NOT NULL,
    PRIMARY KEY (id_product, id_order)
) ENGINE = InnoDB;

DESC orders;
DESC orders_detail;

INSERT INTO orders(total)
VALUES (50000);


INSERT INTO orders_detail(id_product, id_order, price, quantity)
VALUES ('P0001', 1, 25000, 10),
       ('P0002', 1, 25000, 10),
       ('P0003', 2, 25000, 10),
       ('P0004', 2, 25000, 10),
       ('P0005', 3, 25000, 10),
       ('P0006', 3, 25000, 10);

SELECT *
FROM orders;

SELECT *
FROM orders_detail;

SELECT orders.id, orders_detail.price, products.name
FROM orders
         JOIN orders_detail ON (orders_detail.id_order = orders.id)
         JOIN products ON (products.id = orders_detail.id_product);

INSERT INTO products (id, name, price, quantity)
VALUES ('X0001', 'X Satu', 70000, 10),
       ('X0002', 'X Dua', 70000, 10),
       ('X0003', 'X Tiga', 70000, 10);

INSERT INTO categories (id, name)
VALUES ('C0004', 'Oleh-oleh'),
       ('C0005', 'Gadget');

SELECT *
FROM products;
SELECT *
FROM categories;

SELECT *
FROM categories
         INNER JOIN products ON (products.id_category = categories.id);

SELECT *
FROM categories
         LEFT JOIN products ON (products.id_category = categories.id);

SELECT *
FROM categories
         RIGHT JOIN products ON (products.id_category = categories.id);

SELECT *
FROM categories
         CROSS JOIN products;


CREATE TABLE numbers
(
    id INT NOT NULL,
    PRIMARY KEY (id)
) ENGINE = InnoDB;

INSERT INTO numbers(id)
VALUES (1),
       (2),
       (3),
       (4),
       (5),
       (6),
       (7),
       (8),
       (9),
       (10);

SELECT number1.id, number2.id, (number1.id * number2.id)
FROM numbers AS number1
         CROSS JOIN numbers AS number2
ORDER BY number1.id, number2.id;

SELECT *
FROM products
WHERE price > (SELECT AVG(price) FROM products);

SELECT *
FROM products;

SELECT MAX(price)
FROM products;

UPDATE products
SET price = 1000000
WHERE id = 'X0003';

SELECT price
FROM products
         JOIN categories ON (products.id_category = categories.id);

SELECT MAX(cp.price)
FROM (
         SELECT price
         FROM products
                  JOIN categories ON (products.id_category = categories.id)
     ) AS cp;

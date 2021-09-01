USE belajar_mysql;

CREATE TABLE products
(
    id          VARCHAR(100) NOT NULL,
    name        VARCHAR(100) NOT NULL,
    description TEXT,
    price       INT UNSIGNED NOT NULL,
    quantity    INT UNSIGNED NOT NULL DEFAULT 0,
    created_at  TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE = InnoDB;

SHOW TABLES;

DESCRIBE products;

INSERT INTO products(id, name, price, quantity)
VALUES ('P0001', 'Mie Ayam', 15000, 100);

INSERT INTO products(id, name, description, price, quantity)
VALUES ('P0002', 'Bakso', 'Bakso enak sekali', 15000, 100);

INSERT INTO products(id, name, price, quantity)
VALUES ('P0003', 'Ayam 3', 20000, 60),
       ('P0004', 'Ayam 4', 20000, 50),
       ('P0005', 'Ayam 5', 20000, 60);

SELECT *
FROM products;

ALTER TABLE products
    CHANGE id id VARCHAR(100) NOT NULL;

UPDATE products
SET id = 'P0005'
WHERE name = 'Ayam 5';

SELECT id, name, price
from products;

ALTER TABLE products
    ADD PRIMARY KEY (id);

DESC products;

SELECT *
FROM products;

SELECT id, name, price, quantity
FROM products
WHERE quantity = 100;

DESC products;

ALTER TABLE products
    ADD COLUMN category ENUM ('Makanan', 'Minuman', 'Lain-lain');

SELECT *
FROM products;

UPDATE products
SET category = 'Makanan'
WHERE id = 'P0001';

UPDATE products
SET price = price + 5000
WHERE id = 'P0004';

DELETE
FROM products
WHERE id = 'P0005';

SELECT *
FROM products;

SELECT id       AS 'Kode',
       name     AS 'Name',
       category AS 'Kategori',
       price    AS 'Harga',
       quantity AS 'Stok'
FROM products;

SELECT products.id       AS 'Kode',
       products.name     AS 'Name',
       products.category AS 'Kategori',
       products.price    AS 'Harga',
       products.quantity AS 'Stok'
FROM products;

SELECT p.id       AS 'Kode',
       p.name     AS 'Name',
       p.category AS 'Kategori',
       p.price    AS 'Harga',
       p.quantity AS 'Stok'
FROM products AS p;

INSERT INTO products(id, name, description, price, quantity, category)
VALUES ('P0005', 'Es Teh', 'Es teh segar', 3000, 30, 'Minuman'),
       ('P0006', 'Es Tebu', 'Es Tebu segar', 3000, 30, 'Minuman'),
       ('P0007', 'Es Cincau', 'Es cincau segar', 3000, 30, 'Minuman'),
       ('P0008', 'Gudeg', 'Ini deskripsi gudeg', 15000, 30, 'Makanan'),
       ('P0009', 'Soto ayam', 'Ini deskripsi soto ayam', 8000, 30, 'Makanan'),
       ('P0010', 'Jenang', 'Ini deskripsi Jenang', 12000, 30, 'Makanan'),
       ('P0011', 'Kursi', 'Ini deskripsi Kursi', 200000, 10, 'Lain-lain'),
       ('P0012', 'Buku', 'Ini deskripsi Buku', 3000, 30, 'Lain-lain'),
       ('P0013', 'Es Dawet', 'Ini deskripsi Es teh segar', 7000, 30, 'Minuman'),
       ('P0014', 'Es Marimas', 'Ini deskripsi es Marimas', 3000, 30, 'Minuman'),
       ('P0015', 'Tas', 'Ini deskripsi tas', 100000, 20, 'Lain-lain')

SELECT *
FROM products;

SELECT *
FROM products
WHERE quantity > 90;

SELECT *
FROM products
WHERE price > 15000
  AND price <= 25000;

SELECT *
FROM products
WHERE quantity > 80
   OR quantity < 55;

SELECT *
FROM products
WHERE (products.category = 'Makanan' OR quantity > 80)
  AND price < 22000;

SELECT *
FROM products;

SELECT *
FROM products
WHERE name LIKE '%ayam%';

SELECT *
FROM products
WHERE name NOT LIKE '%ayam%';

SELECT *
FROM products
WHERE description IS NULL;

SELECT *
FROM products
WHERE description IS NOT NULL;

SELECT *
FROM products
WHERE quantity BETWEEN 60 AND 100;

SELECT *
FROM products
WHERE quantity NOT BETWEEN 60 AND 100;

SELECT *
FROM products
WHERE category IN ('makanan');

UPDATE products
SET category = 'Lain-lain'
WHERE id = 'P0004';

SELECT *
FROM products
WHERE category NOT IN ('makanan');

SELECT id, name, price, category
FROM products
ORDER BY category DESC, price DESC;

SELECT *
FROM products
LIMIT 5;

SELECT *
FROM products
LIMIT 5,5;

SELECT *
FROM products
LIMIT 10,5;

SELECT *
FROM products
LIMIT 15,5;

SELECT DISTINCT category
FROM products;

SELECT 10, 10, 10 * 10 AS 'hasil';

SELECT id, name, price DIV 1000 AS 'Price in K'
FROM products;

SELECT PI();

SELECT id, COS(price), SIN(price), TAN(price)
FROM products;

SELECT id, name, price
FROM products WHERE price DIV 1000 < 15;


SELECT id, LOWER(name) AS 'Name Lower', UPPER(name) AS 'Name Upper', LENGTH(name) AS 'Name Length'
FROM products;

SELECT id, created_at, EXTRACT(YEAR FROM created_at) AS 'Year', EXTRACT(MONTH FROM created_at) AS 'Month'
FROM products;

SELECT id, created_at, YEAR(created_at) AS 'Year', MONTH(created_at) AS 'Month'
FROM products;

SELECT id,
       name,
       CASE category
           WHEN 'Makanan' THEN 'Enak'
           WHEN 'Minuman' THEN 'Segar'
           ELSE 'Apa itu?'
           END AS 'Rasanya'
FROM products
ORDER BY category ASC;

SELECT id,
       name,
       price,
       IF(price <= 15000, 'Murah', IF(price <= 20000, 'Mahal', 'Mahal Banget')) AS 'Mahal?'
FROM products;

SELECT id, name, IFNULL(description, 'Kosong') AS 'Deskripsi'
FROM products;

SELECT COUNT(id) AS 'Total Produk'
FROM products;

SELECT MAX(price) AS 'Produk Termahal'
FROM products;

SELECT MIN(price) AS 'Produk Termurah'
FROM products;

SELECT AVG(price) AS 'Rata-rata Harga'
FROM products;

SELECT SUM(quantity) AS 'Total Stock'
FROM products;

# By Group

SELECT category, COUNT(id) AS 'Total Produk'
FROM products
GROUP BY category;

SELECT category, MAX(price) AS 'Produk Termahal'
FROM products
GROUP BY category;

SELECT category, MIN(price) AS 'Produk Termurah'
FROM products
GROUP BY category;

SELECT category, AVG(price) AS 'Rata-rata Harga'
FROM products
GROUP BY category;

SELECT category, SUM(quantity) AS 'Total Stock'
FROM products
GROUP BY category;

SELECT category, COUNT(id) AS Total
FROM products
GROUP BY category
HAVING Total > 3;

INSERT INTO products(id, name, description, price, quantity, category) VALUES
('PXXXX', 'COntoh', 'deskripsi', 1000, 1000, 'Lain-lain');

SELECT * FROM products;
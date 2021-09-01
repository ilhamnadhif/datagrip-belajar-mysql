START TRANSACTION;

SELECT *
FROM guestbooks;


UPDATE guestbooks
SET title = 'dibuah user 2'
WHERE id = 12;

COMMIT;

START TRANSACTION;

SELECT *
FROM products
WHERE id = 'P0001' FOR
UPDATE;

UPDATE products
SET quantity = quantity - 10
WHERE id = 'P0001';

COMMIT;

SELECT *
FROM products
WHERE id = 'P0001';

# Deadlock !

START TRANSACTION;

SELECT *
FROM products
WHERE id = 'P0002' FOR
UPDATE;

SELECT *
FROM products
WHERE id = 'P0001' FOR
UPDATE;

COMMIT;

# LOCK TABLE READ

SELECT *
FROM products;

UPDATE products
SET quantity = 1000
WHERE id = 'P0001';

# LOCK TABLE WRITE

SELECT * FROM products;

# LOCK INSTANCE

ALTER TABLE products ADD COLUMN sample VARCHAR(100);

SELECT * FROM products;

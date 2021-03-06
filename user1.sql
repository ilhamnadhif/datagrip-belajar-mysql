START TRANSACTION;

SELECT *
FROM guestbooks;

UPDATE guestbooks
SET title = 'dibuah user 1'
WHERE id = 12;

COMMIT;
ROLLBACK;

START TRANSACTION;

SELECT *
FROM products
WHERE id = 'P0001' FOR
UPDATE;

UPDATE products
SET quantity = quantity - 10
WHERE id = 'P0001';

COMMIT;

# Deadlock !

START TRANSACTION;

SELECT *
FROM products
WHERE id = 'P0001' FOR
UPDATE;

SELECT *
FROM products
WHERE id = 'P0002' FOR
UPDATE;

COMMIT ;

# LOCK TABLE READ

LOCK TABLES products READ ;

SELECT * FROM products;

UPDATE products SET quantity = 100 WHERE id = 'P0001';

UNLOCK TABLES ;

# LOCK TABLE WRITE

LOCK TABLES products WRITE ;

UPDATE products SET quantity = 200 WHERE id = 'P0001';

SELECT * FROM products;

UNLOCK TABLES ;

# LOCK INSTANCE

LOCK INSTANCE FOR BACKUP;

UNLOCK INSTANCE;


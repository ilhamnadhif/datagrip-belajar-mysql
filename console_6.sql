USE belajar_mysql;

SHOW tables;

DESC products;

CREATE TABLE wishlist
(
    id         INT          NOT NULL AUTO_INCREMENT,
    id_product VARCHAR(100) NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_wishlist_product FOREIGN KEY (id_product) REFERENCES products (id)
) ENGINE = InnoDB;

ALTER TABLE wishlist
    MODIFY COLUMN description TEXT AFTER id_product;

DESC wishlist;

SHOW CREATE TABLE wishlist;

ALTER TABLE wishlist
    DROP CONSTRAINT fk_wishlist_product;

ALTER TABLE wishlist
    ADD CONSTRAINT fk_wishlist_product FOREIGN KEY (id_product) REFERENCES products (id);

INSERT INTO wishlist (id_product, description)
VALUES ('P0001', 'Barang Kesukaan');

INSERT INTO wishlist (id_product, description)
VALUES ('SALAH', 'Barang Kesukaan');

SELECT *
FROM wishlist;

DELETE
FROM products
WHERE id = 'P0001';

ALTER TABLE wishlist
    ADD CONSTRAINT fk_wishlist_product FOREIGN KEY (id_product) REFERENCES products (id)
        ON DELETE CASCADE ON UPDATE CASCADE;

INSERT INTO wishlist(id_product, description)
VALUES ('PXXXX', 'Deslripsi');

DELETE
FROM wishlist
WHERE id = 7;
DELETE
FROM products
WHERE id = 'PXXXX';

SELECT *
FROM wishlist
         JOIN products ON (wishlist.id_product = products.id);

SELECT w.id AS       'id',
       p.id AS       'id_product',
       p.name        'name',
       w.description 'deskripsi_wishlist'
FROM wishlist AS w
         JOIN products AS p ON (w.id_product = p.id);

SELECT wishlist.id AS       'id',
       products.id AS       'id_product',
       products.name        'name',
       wishlist.description 'deskripsi_wishlist'
FROM products
         JOIN wishlist ON (wishlist.id_product = products.id);

ALTER TABLE wishlist
    ADD COLUMN id_customer INT,
    ADD CONSTRAINT fk_wishlist_customer FOREIGN KEY (id_customer) REFERENCES customers(id);

SELECT * FROM customers;
SELECT * FROM wishlist;

UPDATE wishlist SET id_customer = 1 WHERE id = 1;

SELECT customers.email, products.id, products.name, wishlist.description
FROM wishlist JOIN products ON (wishlist.id_product = products.id)
JOIN customers ON (wishlist.id_customer = customers.id);


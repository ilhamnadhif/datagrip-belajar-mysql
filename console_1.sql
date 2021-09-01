SHOW DATABASES;

CREATE DATABASE belajar_mysql;

USE belajar_mysql;

DROP DATABASE belajar_mysql;

SHOW ENGINES;

SHOW TABLES;

CREATE TABLE barang
(
    kode   INT,
    nama   VARCHAR(100),
    harga  INT,
    jumlha INT
) ENGINE = InnoDB;

DESC barang;

SHOW CREATE TABLE barang;

ALTER TABLE barang
    CHANGE jumlha jumlah INT;

ALTER TABLE barang
    ADD COLUMN deskripsi TEXT;

ALTER TABLE barang
    ADD COLUMN salah TEXT;

ALTER TABLE barang
    DROP COLUMN salah;

ALTER TABLE barang
    MODIFY nama VARCHAR(200) AFTER deskripsi;

ALTER TABLE barang
    MODIFY nama VARCHAR(200) FIRST;

DESCRIBE barang;

ALTER TABLE barang
    MODIFY kode INT NOT NULL ;

ALTER TABLE barang
MODIFY nama VARCHAR(200) NOT NULL ;

ALTER TABLE barang
    MODIFY jumlah INT NOT NULL DEFAULT 0;

DESCRIBE barang;

ALTER TABLE barang
ADD COLUMN waktu_dibuat TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP;

INSERT INTO barang (kode, nama) VALUES (1, 'Apel');

SELECT  * FROM barang;

TRUNCATE barang;

SHOW TABLES ;

DROP TABLE barang;





























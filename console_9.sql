
CREATE USER 'ilham'@'localhost';
CREATE USER 'nadhif'@'%';

DROP USER 'ilham'@'localhost';
DROP USER 'nadhif'@'%';

GRANT SELECT ON belajar_mysql.* TO 'ilham'@'localhost';

GRANT SELECT ON belajar_mysql.* TO 'nadhif'@'%';
GRANT INSERT, UPDATE, DELETE ON belajar_mysql.* TO 'nadhif'@'%';

SHOW GRANTS FOR 'ilham'@'localhost';
SHOW GRANTS FOR 'nadhif'@'%';

SET PASSWORD FOR 'ilham'@'localhost' = 'rahasia';
SET PASSWORD FOR 'nadhif'@'%' = 'rahasia';

INSERT INTO guestbooks(email, title, content)
VALUES ('contoh@gmail.com', 'Hello', 'Hello');

CREATE TABLE contoh
(
    id INT NOT NULL,
    PRIMARY KEY (id)
) ENGINE = InnoDB;
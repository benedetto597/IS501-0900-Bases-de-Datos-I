/*

 @author edgar.benedetto@unah.hn
 @date 22-10-2020
 @version 0.1

*/
-- DDS -- 
-- Creacion de la base de datos -- 
DROP DATABASE IF EXISTS DispenserDB;

CREATE DATABASE DispenserDB CHARACTER SET utf8;

-- Se selecciona la base de datos para su uso --
USE DispenserDB;

-- Creación de tablas --
CREATE TABLE IF NOT EXISTS Dispenser(
    id INT AUTO_INCREMENT PRIMARY KEY,
    num_storageCapacity SMALLINT UNSIGNED NOT NULL DEFAULT 1,
    num_storedProducts SMALLINT UNSIGNED NOT NULL DEFAULT 0
)CHARACTER SET utf8;

CREATE TABLE IF NOT EXISTS Product(
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_dispenser INT NOT NULL, 
    tex_name VARCHAR(30) NOT NULL, 
    tex_brand VARCHAR(20) NOT NULL,
    num_price SMALLINT UNSIGNED NOT NULL DEFAULT 1,
    tim_expiration DATE DEFAULT NULL
)CHARACTER SET utf8; 

CREATE TABLE IF NOT EXISTS Sail(
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_product INT NOT NULL, 
    id_voucher INT NOT NULL, 
    num_quantity SMALLINT UNSIGNED NOT NULL DEFAULT 1
)CHARACTER SET utf8; 

CREATE TABLE IF NOT EXISTS Voucher(
    id INT AUTO_INCREMENT PRIMARY KEY,
    tim_hour TIME DEFAULT NOW(), 
    tim_date DATE DEFAULT NOW(), 
    num_currencyType SMALLINT UNSIGNED NOT NULL DEFAULT 1
)CHARACTER SET utf8; 


-- DMS -- 
-- Limpieza de las tablas en caso de que las tablas existieran -- 
TRUNCATE  Dispenser; 
TRUNCATE  Product;
TRUNCATE  Sail;
TRUNCATE  Voucher;

-- Se agregan datos a las tablas --
INSERT INTO Dispenser(num_storageCapacity, num_storedProducts) VALUES
    (300, 5);

INSERT INTO Product(id_dispenser, tex_name, tex_brand, num_price) VALUES
    (1,"Coca-Cola", "Gamesa", 40),
    (1,"Sprite", "Gamesa", 22),
    (1,"Fresca", "Gamesa", 18),
    (1,"Tropical Banana", "Gamesa", 35),
    (1,"Tropical Uva", "Gamesa", 45),
    (1,"Dorito con queso", "Gamesa", 25),
    (1,"Cheetos con queso", "Gamesa", 20),
    (1,"Caribas", "Gamesa", 22),
    (1,"Chocolate M&M", "Gamesa", 35),
    (1,"Gomitas de fresa", "Gamesa", 55),
    (1,"Chocolate Snicker", "Gamesa", 40),
    (1,"Dulces Skittle", "Gamesa", 20),
    (1,"Chocolate Milkaway", "Gamesa", 15
);

INSERT INTO Sail(id_product, id_voucher, num_quantity) VALUES
    (1, 1, 3),
    (4, 5, 2),
    (4, 2, 5),
    (4, 3, 5),
    (7, 4, 4),
    (8, 5, 12),
    (9, 9, 2),
    (5, 7, 9),
    (6, 8, 10
);

INSERT INTO Voucher(tim_hour, num_currencyType) VALUES
    ('09:22:50', 50),
    ('09:12:10', 50),
    ('09:32:15', 50),
    ('11:25:18', 50),
    ('11:49:41', 20),
    ('11:48:36', 100),
    ('15:55:29', 100),
    ('15:11:47', 50),
    ('15:45:32', 500
);

-- Query's para conseguir los datos solicitados --
-- Recibos generados por producto por hora del día.
SELECT * FROM Voucher;

SELECT SUBSTRING(tim_hour,1,2) AS Hora, COUNT(*) AS "Recibos generados" FROM Voucher GROUP BY Hora;

SELECT * FROM Product;

SELECT * FROM Voucher JOIN Sail ON Voucher.id = Sail.id_voucher ORDER BY id_product;

SELECT tex_name AS Producto, SUBSTRING(tim_hour,1,2) AS Hora, COUNT(*) AS "Recibos generados" FROM Voucher JOIN Sail ON Voucher.id = Sail.id_voucher JOIN Product ON Sail.id_product = Product.id GROUP BY Producto, Hora ORDER BY Hora; 

-- Billete  más usado por los consumidores.
SELECT num_currencyType AS Billete, COUNT(*) AS "Pagos realizado" FROM Voucher GROUP BY Billete ORDER BY `Pagos realizado` DESC LIMIT 1;

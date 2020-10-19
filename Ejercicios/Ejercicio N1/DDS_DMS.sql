/*

 @author edgar.benedetto@unah.hn
 @date 19-10-2020
 @version 0.1

*/
-- DDS -- 
-- Creacion de la base de datos -- 
DROP DATABASE IF EXISTS ClosetDB;

CREATE DATABASE ClosetDB CHARACTER SET utf8;

-- Se selecciona la base de datos para su uso --
USE ClosetDB;

-- Creación de tablas --
CREATE TABLE IF NOT EXISTS Closet(
    id INT AUTO_INCREMENT PRIMARY KEY,
    cod_material ENUM('Madera', 'Metal') DEFAULT 'Madera',
    num_drawers SMALLINT UNSIGNED NOT NULL DEFAULT 1,
    num_racks SMALLINT UNSIGNED NOT NULL DEFAULT 1
) CHARACTER SET utf8;

CREATE TABLE IF NOT EXISTS Drawer(
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_closet INT NOT NULL,
    num_width TINYINT UNSIGNED NOT NULL DEFAULT 1,
	num_depth TINYINT UNSIGNED NOT NULL DEFAULT 1
) CHARACTER SET utf8;

CREATE TABLE IF NOT EXISTS Rack(
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_closet INT NOT NULL,
    num_width TINYINT UNSIGNED NOT NULL DEFAULT 1,
	num_height TINYINT UNSIGNED NOT NULL DEFAULT 1
) CHARACTER SET utf8;

CREATE TABLE IF NOT EXISTS Cloth(
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_drawer INT DEFAULT NULL,
    id_rack INT DEFAULT NULL,
    tex_type VARCHAR(20) NOT NULL,
    tex_brand VARCHAR(20) NOT NULL,
	num_size SMALLINT UNSIGNED NOT NULL DEFAULT 1
) CHARACTER SET utf8;

-- DMS -- 
-- Limpieza de las tablas en caso de que las tablas existieran -- 
TRUNCATE  Closet; 
TRUNCATE  Drawer;
TRUNCATE  Rack;
TRUNCATE  Cloth;

-- Se agregan datos a las tablas --
INSERT INTO Closet(num_drawers, num_racks) VALUES(
    6, 4
);

INSERT INTO Drawer(id_closet, num_width) VALUES
    (1, 6),
    (1, 6),
    (1, 5),
    (1, 5),
    (1, 4),
    (1, 4)
;

INSERT INTO Rack(id_closet, num_width) VALUES
    (1, 4),
    (1, 4),
    (1, 6),
    (1, 6)
;

INSERT INTO Cloth(id_drawer, tex_type, tex_brand, num_size) VALUES
    (1, "Boxer", "Calvin Klein", 12),
    (2, "Calcetines", "Nike", 8),
    (3, "Camisa Deportiva", "Nike", 22),
    (4, "Pantalón", "Pepe", 34),
    (5, "Jeans", "Levis", 32),
    (6, "Calsoneta", "Ralph Lauren", 34),
    (1, "Boxer", "Hugo", 10),
    (2, "Calcetines", "Adidas", 9),
    (3, "Camisa Formal", "Ralph Lauren", 25),
    (4, "Pantalón", "Calvin Klein", 36),
    (5, "Jeans", "Pepe", 34),
    (6, "Calsoneta", "Nike", 32),
    (1, "Boxer", "Fiabelo", 14),
    (2, "Camisa Deportiva", "Adidas", 25),
    (2, "Camisa Deportiva", "Umbro", 22),
    (3, "Camisa Formal", "Channel", 26),
    (3, "Camisa Formal", "Pepe", 26),
    (4, "Pantalón", "Calvin Klein", 36),
    (1, "Boxer", "Calvin Klein", 12),
    (2, "Calcetines", "Nike", 8),
    (3, "Camisa Deportiva", "Nike", 22),
    (4, "Pantalón", "Pepe", 34),
    (5, "Jeans", "Levis", 32),
    (6, "Calsoneta", "Ralph Lauren", 34)
;

INSERT INTO Cloth(id_rack, tex_type, tex_brand, num_size) VALUES
    (1, "Boxer", "Calvin Klein", 12),
    (2, "Calcetines", "Nike", 8),
    (3, "Camisa Deportiva", "Nike", 22),
    (4, "Pantalón", "Pepe", 34),
    (2, "Jeans", "Levis", 32),
    (4, "Calsoneta", "Ralph Lauren", 34),
    (1, "Boxer", "Hugo", 10),
    (2, "Calcetines", "Adidas", 9),
    (3, "Camisa Formal", "Ralph Lauren", 25),
    (4, "Pantalón", "Calvin Klein", 36),
    (2, "Jeans", "Pepe", 34),
    (4, "Calsoneta", "Nike", 32),
    (1, "Boxer", "Fiabelo", 14),
    (2, "Camisa Deportiva", "Adidas", 25),
    (2, "Camisa Deportiva", "Umbro", 22),
    (3, "Camisa Formal", "Channel", 26),
    (3, "Camisa Formal", "Pepe", 26),
    (4, "Pantalón", "Calvin Klein", 36),
    (1, "Boxer", "Calvin Klein", 12),
    (2, "Calcetines", "Nike", 8),
    (3, "Camisa Deportiva", "Nike", 22),
    (4, "Pantalón", "Pepe", 34),
    (2, "Jeans", "Levis", 32),
    (4, "Calsoneta", "Ralph Lauren", 34)
;

-- Query's para conseguir los datos solicitados --
-- Total de tipos de prendas almacenados -- 
SELECT COUNT(DISTINCT tex_type) AS "Cantidad de tipos de prendas" FROM Cloth;

-- Listado de la cantidad de elementos por cada tipo de prenda guardado -- 
SELECT DISTINCT tex_type AS "Tipo de prenda", COUNT(*) AS "Cantidad de prendas" FROM Cloth GROUP BY tex_type;

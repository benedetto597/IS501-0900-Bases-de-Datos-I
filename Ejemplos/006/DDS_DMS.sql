
DROP DATABASE IF EXISTS InformationTechnologies;

CREATE DATABASE InformationTechnologies CHARACTER SET utf8;

USE InformationTechnologies;

CREATE TABLE PCInventory (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tex_name TEXT NOT NULL,
    cod_type ENUM('Laptop', 'Desktop', 'Tablet') NOT NULL DEFAULT 'Laptop',
    sma_ram SMALLINT UNSIGNED NOT NULL DEFAULT 0,
    sma_ssd SMALLINT UNSIGNED NOT NULL DEFAULT 0
);

INSERT INTO PCInventory(tex_name, sma_ram, sma_ssd) VALUES
    ("HP P1020",4,32),
    ("HP P1021",8,32),
    ("HP P1022",16,64),
    ("HP P1023",32,512),
    ("DELL XPS 12",32,512),
    ("DELL XPS 17 1",16,2048),
    ("DELL XPS 17 2",64,2048),
    ("DELL XPS 17 3",16,128),
    ("DELL XPS 17 4",128,256)
;

-- Listar todos los computadores del inventario
SELECT tex_name AS "Marca", sma_ram AS "RAM", sma_ssd AS "SSD" FROM PCInventory;

-- Listar todos los computadores que tiene 16 o 64 de RAM
SELECT tex_name AS "Marca", sma_ram AS "RAM", sma_ssd AS "SSD" FROM PCInventory WHERE sma_ram IN (16,64);

-- Listar todos los computadores que son de tipo XPS dentro del nombre de "marca".
SELECT tex_name AS "Marca", sma_ram AS "RAM", sma_ssd AS "SSD" FROM PCInventory WHERE tex_name LIKE "%XPS%";

-- Cuántos computadores hay pop cantidad de RAM
SELECT sma_ram AS "RAM", COUNT(*) AS "Cantidad" FROM PCInventory GROUP BY sma_ram;

-- Cuántos computadores hay por cantidad de RAM, mostrando solo los grupos donde hay dos o más dispositivos.
SELECT sma_ram AS "RAM", COUNT(*) AS "Cantidad" FROM PCInventory GROUP BY sma_ram HAVING COUNT(*) >=2;

-- Cuántos computadores hay por cantidad de RAM, mostrando solo 3 registros de los grupos donde hay dos o más dispositivos
SELECT sma_ram AS "RAM", COUNT(*) AS "Cantidad" FROM PCInventory GROUP BY sma_ram HAVING COUNT(*) >=2 LIMIT 3;

-- Cuantos computadores hay por cantidad de RAM, mostrando solo 3 registros de los grupos donde hay dos o más dispositivos, ordenados de mayor a menor.
SELECT sma_ram AS "RAM", COUNT(*) AS "Cantidad" FROM PCInventory GROUP BY sma_ram HAVING COUNT(*) >=2 LIMIT 3 ORDER BY "Cantidad" DESC;
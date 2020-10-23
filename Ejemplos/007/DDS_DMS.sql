
DROP DATABASE IF EXISTS InformationTechnologies007;

CREATE DATABASE InformationTechnologies007 CHARACTER SET utf8;

USE InformationTechnologies007;

CREATE TABLE PCInventory (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tex_name TEXT NOT NULL,
    cod_type ENUM('Laptop', 'Desktop', 'Tablet') NOT NULL DEFAULT 'Laptop',
    sma_ram SMALLINT UNSIGNED NOT NULL DEFAULT 0,
    sma_ssd SMALLINT UNSIGNED NOT NULL DEFAULT 0
);

INSERT INTO PCInventory(tex_name, sma_ram, sma_ssd) VALUES
    ("Asus P1020",4,32),
    ("Acer P1021",8,32),
    ("HP P1022",16,64),
    ("HP P1023",32,512),
    ("DELL XPS 12",32,512),
    ("DELL XPS 17 1",16,2048),
    ("DELL XPS 17 2",64,2048),
    ("DELL XPS 17 3",16,128),
    ("DELL XPS 17 4",128,256)
;

-- De las computadoras anteriores que pertenecen a los 3 grupos mayores de RAM, de forma anticipada, usted como empleado de la empresa sabe que la marca de la computadora siempre es “la primer palabra” en el nombre del inventario – 
-- SUBSTRING_INDEX(tex_name, ' ', 1) --> Permite conocer la cadena que esta antes de un condicional de texto; INSTRUCCIÓN ANTERIOR  Implica que se obtendrá el texto que haya antes del primer espacio –
SELECT DISTINCT SUBSTRING_INDEX(tex_name, ' ', 1) FROM (SELECT tex_name FROM PCInventory JOIN  (SELECT sma_ram AS "RAM", COUNT(*) AS "Cantidad"  FROM PCInventory GROUP BY sma_ram HAVING COUNT(*)>=2 ORDER BY sma_ram DESC LIMIT 3) AS PCGroup ON PCInventory.sma_ram = PCGroup. `RAM`) AS PCGroupBigRAM;

-- Todas las computadoras que no pertenecen a los grupos más grandes de RAM –
/* CORREGIR
SELECT DISTINCT SUBSTRING_INDEX(tex_name, ' ', 1) AS "Marca respuesta 1" FROM PCInventory WHERE SUBSTRING_INDEX(tex_name, ' ', 1)  NOT IN (SELECT DISTINCT SUBSTRING_INDEX(tex_name, ' ', 1) AS "Marca" FROM (SELECT tex_name FROM PCInventory JOIN (SELECT sma_ram AS "RAM", COUNT(*) AS "Cantidad" FROM PCInventory GROUP BY sma_ram HAVING COUNT(*)>=2 ORDER BY sma_ram DESC LIMIT 3) AS PCGroup ON PCInventory.sma_ram = PCGroup. `RAM`) AS PCGroupBigRAM;
*/

-- Todas las computadoras que no pertenecen a los grupos más grandes de RAM No usar el operador IN en su lugar aplique JOIN para verificar la existencia en las listas –
SELECT Inventario.`Marca` AS "Marca Respuesta 2" FROM (SELECT DISTINCT SUBSTRING_INDEX(tex_name, ' ', 1) AS "Marca" FROM PCInventory) AS Inventario LEFT JOIN (SELECT DISTINCT SUBSTRING_INDEX(tex_name, ' ', 1) AS "Marca" FROM (SELECT tex_name FROM PCInventory JOIN  (SELECT sma_ram AS "RAM", COUNT(*) AS "Cantidad"  FROM PCInventory GROUP BY sma_ram HAVING COUNT(*)>=2 ORDER BY sma_ram DESC LIMIT 3) PCGroup ON PCInventory.sma_ram = PCGroup. `RAM`) AS PCGroupBigRAM) AS PCGroupBigRAM ON Inventario.`Marca` = PCGroupBigRAM.`Marca` WHERE PCGroupBigRAM.`Marca` IS NULL;
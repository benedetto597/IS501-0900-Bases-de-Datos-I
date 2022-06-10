/* 
Nomenclatura de componentes SQL (prefijos)
    - Tables --> Sin prefijo
    - Views --> vw_ 
    - Store Procedure --> sp_
    - Cursor --> cu
    - Trigger --> tg_
*/

DROP DATABASE IF EXISTS TriggerProcessing;
CREATE DATABASE TriggerProcessing CHARACTER SET utf8;
USE TriggerProcessing;

-- Nombres escritos en plural por ser palabra reservada
DROP TABLE IF EXISTS Numbers;
DROP TABLE IF EXISTS NumbersSquared;
DROP TABLE IF EXISTS NumbersSquared_insert;
DROP VIEW IF EXISTS vw_NumbersSquared;

/* 
Nomenclatura para tipos de datos SQL (prefijos)
    - bit --> boolean valued
    - num --> number valued
    - str --> string valued
    - dat --> date valued
    - tim --> time valued
*/

CREATE TABLE Numbers(
    id INT AUTO_INCREMENT PRIMARY KEY COMMENT "A secuencial series of numbers"
)COMMENT="List of Numbers";

-- Tabla llenada con un Trigger
CREATE TABLE NumbersSquared(
    num_id_fk INT COMMENT "A secuencial series of numbers",
    num_squared DOUBLE COMMENT "The square root of the number",
    FOREING KEY (num_id_fk) REFERENCES Numbers(id)
)COMMENT="Filled by a trigger";

-- Tabla llenada con SELECT e INSERT
CREATE TABLE NumbersSquared_insert(
    num_id_fk INT COMMENT "A secuencial series of numbers",
    num_squared DOUBLE COMMENT "The square root of the number",
    FOREING KEY (num_id_fk) REFERENCES Numbers(id)
)COMMENT="Filled by a select and insert instruction";

CREATE VIEW vw_NumbersSquared AS 
    SELECT 
        id,
        SQRT(id)
    FROM 
        Numbers
;



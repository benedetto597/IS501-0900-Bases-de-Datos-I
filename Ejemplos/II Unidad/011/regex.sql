/*
 @author edgar.benedetto@unah.hn
 @date 28-10-2020
 @version 0.1
*/

------------------ Expresiones regulares ------------------ 

DROP DATABASE IF EXISTS AdvancedSQLProcedures; 

-- Crear base de datos --
CREATE DATABASE AdvancedSQLProcedures;

USE AdvancedSQLProcedures;

SET @record = '{"name" : "María García", "age" : 20, "uid" : "0801199926544"}';

--Patron usando expresiones regulares --
-- Para buscar exactitud al inicio y al final de la expresión regular se usa "^$" --
-- El "+" implica que se tendran 1 o más digitos -- 
-- Al escribir la expresión regular como cadena se tiene que escapar la pleca --
SET @pattern = "^08\\d+$";

-- RLIKE Es un Like pero con expresiones regulares --
-- Una de las implementaciones del CASE es transformar algo a boolean --
SELECT 
    JSON_UNQUOTE(JSON_EXTRACT(@record, "$.uid")) AS "UID", 
    CASE 
        WHEN (JSON_UNQUOTE(JSON_EXTRACT(@record, "$.uid")) RLIKE @pattern) = 0 THEN "FALSE"
        ELSE "TRUE"
    END AS "Cumple con el patrón"
;

-- Contexto: Estudiantes de excelencia academica (EA) -- 
DROP TABLE IF EXISTS Student; 
CREATE TABLE Student(
    id INT AUTO_INCREMENT PRIMARY KEY,
    jso_record JSON NOT NULL COMMENT "Documento con name, age y uid"
) COMMENT "Tabla de estudiantes EA";

INSERT INTO Student(jso_record) VALUES 
    ('{"name" : "María García", "age" : 20, "uid" : "1801199926544"}'),
    ('{"name" : "Juan García", "age" : 20, "uid" : "0301199825644"}'),
    ('{"name" : "Laura Sanchez", "age" : 20, "uid" : "0507199901188"}'),
    ('{"name" : "María Martinez", "age" : 20, "uid" : "0801199920044"}'),
    ('{"name" : "Pedro Lopez", "age" : 20, "uid" : "0709199923262"}'),
    ('{"name" : "Fredy Pereira", "age" : 20, "uid" : "0101199236659"}'),
    ('{"name" : "Marlon García", "age" : 20, "uid" : "0708199952555"}');

/* 
Ejercicio: Se desea hacer un recorrido por ciertos departamentos del país para convencer a estudiantes
que hagan estudios sobre STEM (Science, technology, engineering, and math). Para ello se requieren estudiantes de dichos departamentos

Se desea hacer una tabla que muestre claramente los estudiantes que estan involucrados en los siguientes recorridos.
--> Recorrido 1 : Atlantida(01), El paraiso(07), Francisco Morazan(08) y Yoro(18)
--> Recorrido 1 : La Paz(12), Comayagua(03), Cortez(05)

Para reconocer todas las identidades se puede usar esta expresión regular --> \d{13}

El peor uso de expresiones regulares es buscar literales especificos --> (1801199926544)|(0301199825644)|(0507199901188)...
Para reconocer lo que se pide en el ejercicio --> ((01)|(07)|(08)|(18)\d{11})
Optimizando la expresión anterior --> ((0[178])|(18)\d{11})
*/

-- Respuesta del ejercicio --
-- Se usa un CASE para mostrar a que recorrido pertenece -- 
SELECT
    (JSON_UNQUOTE(JSON_EXTRACT(jso_record, "$.name"))) AS "Nombre del estudiante", 
    CASE
        WHEN (JSON_UNQUOTE(JSON_EXTRACT(jso_record, "$.name"))) RLIKE "^((0[178])|(18))\\d{11}$" THEN "Recorrido 1" 
        WHEN (JSON_UNQUOTE(JSON_EXTRACT(jso_record, "$.name"))) RLIKE "^((0[35])|(12))\\d{11}$" THEN "Recorrido 2" 
    END AS "Recorrido"
FROM 
    Student
WHERE
    (JSON_UNQUOTE(JSON_EXTRACT(jso_record, "$.name"))) RLIKE "^((0[13578])|(1[28]))\\d{11}$"
ORDER BY 
    ASC 
;



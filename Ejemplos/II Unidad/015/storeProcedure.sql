
/*

SUMARIZAR es resumir 
    Agrupando datos y se resumen con un count contando cuantos son
    Sumandolos
    Obteniendo el Average 

EL LOOP es parecido a un JUMP de lenguaje ensamblador

*/ 

DROP DATABASE IF EXISTS CursorProcesing;
CREATE DATABASE CursorProcesing CHARACTER SET utf8;
USE CursorProcesing;

DROP TABLE IF EXISTS Measure;
DROP TABLE IF EXISTS MeasureReviewed;
DROP TABLE IF EXISTS MeasureSumarized;

CREATE TABLE Measure(
    id INT AUTO_INCREMENT PRIMARY KEY COMMENT "Autoincremental",
    num_device INT NOT NULL COMMENT "identificador del dispositivo",
    num_temperature DECIMAL (10,4) DEFAULT NULL COMMENT "Temperatura en celcius",
    dat_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT "Fecha de la captura"
) COMMENT = "Historico de mediciones";

CREATE TABLE MeasureReviewed(
    id INT AUTO_INCREMENT PRIMARY KEY COMMENT "Autoincremental",
    num_measure_fk INT NOT NULL COMMENT "identificador de la medición",
    dat_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT "Fecha de la captura",
    FOREIGN KEY (num_measure_fk) REFERENCES Measure(id) ON DELETE CASCADE ON UPDATE CASCADE 

) COMMENT = "Historico de revisiones automaticas";

INSERT INTO Measure(num_device, num_temperature, dat_date) VALUES (1,36.43, '2020-12-01 20:45:11'),
(1,36.43, '2020-12-01 20:45:11'),
(1,36.43, '2020-12-01 20:45:11'),
(1,36.43, '2020-12-01 20:45:11'),
(1,36.43, '2020-12-01 20:45:11'),
(1,36.43, '2020-12-01 20:45:11');

-- Objetivo Actualizar el único registro de la tabla
-- Procedimiento para dejar actualizados los valores en la tabla
CREATE TABLE MeasureSumarized(
    num_lower INT NOT NULL DEFAULT 0 COMMENT "Cantidad de valores menor de temperatura",
    num_higher INT NOT NULL DEFAULT 0 COMMENT "Cantidad de valores mayor de temperatura"
) COMMENT = "Historico de revisiones automaticas";

INSERT INTO MeasureSumarized() VALUES ()
-- Para insertar se usa INSERT INTO MeasureSumarized() VALUES ()
-- No requiere ni valores ni campos porque tienen valores por defecto

DROP PROCEDURE IF EXISTS sp_sumarizeData;

/*

Cursor 
    - Apuntan un registro a la vez.
    - No se pueden saltar registros.
    - Recorren todos los registros que hayan.

Variables del cursor
    - FINISHED --> Bandera entre 0 y 1
    - THEID --> Identificador del registro que se recorre
    - THETEMP --> Temperatura registrada
    - LOWERCOUNTER --> Contador a insertar en lower
    - LOWERCOUNTER --> Contador a insertar en higher

Pasos para la creación y uso del cursor
1. Declaración del cursor
    1. DECLARE --> Declarar el cursor
    2. DECLARE nombreCursor CURSOR --> Nombre luego tipo 
    3. DECLARE nombreCursor CURSOR FOR SELECT... --> Se usa FOR Para usar el cursor en una instrucción especifica 

2. Definición del manejador para detener el cursor
    1. DECLARE --> Declarar el manejador
    2. DECLARE CONTINUE HANDLER FOR NOT FOUND --> Nombre del manejador para cuando no se encuentren mas registros
    3. DECLARE CONTINUE HANDLER FOR NOT FOUND SET FINISHED = 1 --> Establecer la varible FINISHED = 1
    
3. Apertura del cursor
    1. OPEN nombreCursor --> Apertura del cursor 

4. Cración del ciclo para recorrer con el cursor
    1. nombreLoop: LOOP --> Repetir hasta que la bandera de FINISHED se levante
    2. FETCH nombreCursor --> Obtener valores del cursor (una tupla a la vez)
    3. FETCH nombreCursor INTO var1, var2 --> Insertar los valores del cursor en variables
    4. LEAVE nombreLOOP --> Instrucción para salir del LOOP
    
5. Cierre del cursor   
    1. CLOSE cursorCounter --> Cierre del cursor


EXTRAS 
    Para no recorrer los que ya esten revisados 
    Agregado pero no probado 
        - JOIN MeasureReviewed;
        - INSERT INTO MeasureReviewed(num_measure_fk) VALUES (theId); 

 
*/  
-- Declaracion de variable conformada: nombre, tipo de dato y valor por defecto
DELIMITER $$
CREATE PROCEDURE sp_sumarizeData(
    IN minValue INT 
)
BEGIN
    DECLARE finished INT DEFAULT 0;
    DECLARE theId INT DEFAULT 0;
    DECLARE theTemp INT DEFAULT 0.0 ;
    DECLARE lowerCounter INT DEFAULT 0;
    DECLARE higherCounter INT DEFAULT 0;

    -- 1  
    DECLARE cursorCounter 
        CURSOR FOR 
            SELECT id, num_temperature FROM Measure JOIN MeasureReviewed; 

    -- 2
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET FINISHED = 1;

    -- 3
    OPEN cursorCounter;

        -- 4
        getCounter: LOOP
            
            FETCH cursorCounter INTO theId, theTemp;

            IF finished = 1 THEN 
                LEAVE getCounter;
            END IF;


            IF theTemp <= minValue THEN 
                SET lowerCounter = lowerCounter + 1;
                INSERT INTO MeasureReviewed(num_measure_fk) VALUES (theId); 
            ELSE 
                SET higherCounter = higherCounter + 1;
                INSERT INTO MeasureReviewed(num_measure_fk) VALUES (theId); 
            END IF;

        END LOOP getCounter; 

    -- 5
    CLOSE cursorCounter;

    UPDATE MeasureSumarized SET num_lower = lowerCounter, num_higher = higherCounter;

END$$
DELIMITER ;


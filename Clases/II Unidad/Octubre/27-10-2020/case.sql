/*
 @author edgar.benedetto@unah.hn
 @date 27-10-2020
 @version 0.1
*/

-------------- Evaluaciones y comparaciones en SQL -------------- 

DROP DATABASE IF EXISTS AdvancedSQLProcedures; 

-- Crear base de datos --
CREATE DATABASE AdvancedSQLProcedures;

USE AdvancedSQLProcedures;

-- Se define una variable con el contenido de un caso de uso  -- 
-- Creación de variable --
SET @sampleCategory = "folder";

-- Se aplica un caso de selección / uso --
-- Case --> útil para mostrar diferentes tipos de información
SELECT 
    CASE 
        -- Se compara la variable con la igualdad y el condicional generará una respuesta en el Case
        WHEN @sampleCategory = "folder" THEN "01f02"
        WHEN @sampleCategory = "file" THEN "01f03"
        ELSE "UNK000"
    END AS "Type of item as a Code"
; 

-- Tabla de cola de peticiones --
DROP TABLE IF EXISTS RequestQueue; 
CREATE TABLE RequestQueue(
    id INT AUTO_INCREMENT PRIMARY KEY, 
    jso_request JSON NOT NULL COMMENT "Petición API en forma de JSON",
    bit_read BIT NOT NULL COMMENT "Estado de la petición: atendida o no atendida"
) COMMENT "Tabla de peticiones de usuario en forma de cola";

INSERT INTO RequestQueue(jso_request, bit_read) VALUES
    ('{"service": "00f21x2", "user": "bdi", "command": "INBOX"}', 1 ),
    ('{"service": "00f21x3" , "user": "bdi", "command": "TRASH"}', 0),
;

-- Seleccione ultimo registro de peticion no atendido almacenando en un espacio de memoria temporal --
SET @lastRequest = (SELECT jso_request FROM RequestQueue WHERE bit_read = 0 ORDER BY id ASC LIMIT 1);

-- Obtener del último registro no atendido el comando requerido --
-- de la tupla lastRequest se extrae el campo llamado command usando la nomenclatura $. --
SET @lastCommand = JSON_VALUE(@lastRequest, "$.command");
SET @lastCommand = REPLACE(@lastCommand, '\"', "");

-- Se demuestra que las variables contienen la info deseada -- 
SELECT @lastRequest AS "La última petición en Queue", @lastCommand AS "Último comando";

-- Se realiza un caso dependiendo del dato obtenido --
SELECT
    @lastCommand AS "Último comando",
    CASE 
        WHEN @lastCommand = "INBOX" THEN "Solicitud de Inbox SMTP de la bandeja del correo"
        WHEN @lastCommand = "TRASH" THEN "Solicitud de Trash SMTP de la bandeja del correo"
        ELSE "Instrucción desconocida"
    END AS "Acción solicitada (=)",
    CASE 
        WHEN @lastCommand LIKE "INBOX" THEN "Solicitud de Inbox SMTP de la bandeja del correo"
        WHEN @lastCommand LIKE "TRASH" THEN "Solicitud de Trash SMTP de la bandeja del correo"
        ELSE "Instrucción desconocida"
    END AS "Acción solicitada (LIKE)",
    CASE 
        WHEN STRCMP(@lastCommand LIKE "INBOX") THEN "Solicitud de Inbox SMTP de la bandeja del correo"
        WHEN STRCMP(@lastCommand LIKE "TRASH") THEN "Solicitud de Trash SMTP de la bandeja del correo"
        ELSE "Instrucción desconocida"
    END AS "Acción solicitada (STRCMP)"
;

-- Se realiza un caso dependiendo del dato obtenido, limpiando la cadena con un TRIM --
SELECT
    @lastCommand AS "Último comando",
    CASE 
        WHEN TRIM(@lastCommand) = "INBOX" THEN "Solicitud de Inbox SMTP de la bandeja del correo"
        WHEN TRIM(@lastCommand) = "TRASH" THEN "Solicitud de Trash SMTP de la bandeja del correo"
        ELSE "Instrucción desconocida"
    END AS "Acción solicitada (=)",
    CASE 
        WHEN TRIM(@lastCommand) LIKE "INBOX" THEN "Solicitud de Inbox SMTP de la bandeja del correo"
        WHEN TRIM(@lastCommand) LIKE "TRASH" THEN "Solicitud de Trash SMTP de la bandeja del correo"
        ELSE "Instrucción desconocida"
    END AS "Acción solicitada (LIKE)",
    CASE 
        WHEN STRCMP(TRIM(@lastCommand) LIKE "INBOX") THEN "Solicitud de Inbox SMTP de la bandeja del correo"
        WHEN STRCMP(TRIM(@lastCommand) LIKE "TRASH") THEN "Solicitud de Trash SMTP de la bandeja del correo"
        ELSE "Instrucción desconocida"
    END AS "Acción solicitada (STRCMP)"
;

-- Tarea --
/*
--> Encapsular en un procedimiento almacenado los componentes nucleos de este ejercicio, es decir, encapsular el componente donde se pregunta el ultimo registro con su ultimo comando
--> Aplicar la correcta implementación del método STRCMP
*/
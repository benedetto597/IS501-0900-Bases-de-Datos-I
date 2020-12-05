/*

 @author edgar.benedetto@unah.hn
 @date 19-10-2020
 @version 0.1

Herramientas opcionales --> Mysql Workbench y NoteBooks Jupiter 

Procedimiento --> Encargado de ejecutar tareas donde normalmente no se necesita retornar un resultado.
Función --> Tareas especificas y cortas que se encargan de retornar un resultado.

Instrucción para ver los procedimientos o funciones almacenados en la base de datos --> 
SHOW PROCEDURE STATUS WHERE Db = 'AdvanceSQLProcedures'; 
--------- Ejemplo Factorial ---------  
*/

-- Procedimientos --
DROP DATABASE IF EXISTS AdvancedSQLProcedures; 

-- Crear base de datos --
CREATE DATABASE AdvancedSQLProcedures;

USE AdvancedSQLProcedures;

-- Cambio de delimitador para iniciar procedimiento -- 
DELIMITER $$

-- Factorial Recursivo -- 
/* Por defecto existe un máximo de recursividad en MySQL y se debe modificar 
la variable max_sp_recursion_depht que se encuentra en la variable SESSION 
que al ser una varible especial se usa @@ */
    SET @@SESSION.max_sp_recursion_depht = 50$$

    -- Borrar el procedimiento previamente --
    DROP PROCEDURE IF EXISTS sp_factorial$$

    -- Valor de entrada IN y valor de salida OUT
    CREATE PROCEDURE sp_factorial(IN N INT, OUT FACT INT)

    -- Inicio de procedimiento --
    BEGIN 
        IF N = 1 THEN 
            SELECT 1 INTO FACT;
        ELSE
            CALL sp_factorial(N-1, @TEMP);
            SELECT N * @TEMP INTO FACT;
        END IF; 

    -- Fin del procedimiento -- 
    END$$
DELIMITER ; 

-- Crear variable --
-- Para guardar valores en una variable se puede usar el INTO o el " = " --
SET @fact = 0;

-- Llamado procedimiento --
-- Prefijo de los procedimientos (store procedures) -- 
CALL sp_factorial(5,@fact); 

-- Mostrar el resultado en pantalla --
SELECT @fact AS "Factorial de 5";

-- Ejemplo de ELSE IF en MySQL -- 
/* 
IF condition THEN
   statements;
ELSEIF elseif-condition THEN
   elseif-statements;
...
ELSE
   else-statements;
END IF;
*/
USE TriggerProcessing;
SET @count = 12;
-- Usando el trigger --> Se usa cuando ya se sabe que se debe calcular
CALL sp_createNumbers(@count);

SELECT * FROM Numbers;
SELECT * FROM NumbersSquared;

-- Usando SELECT en vez de INSERT --> Post a la insersión de datos se necesita realizar el calculo
INSERT INTO NumbersSquared_insert(num_id_fk, num_squared) 
    SELECT 
        id,
        SQRT(id)
    FROM  
        Numbers
; 

-- Usando la vista --> Post a la insersión de datos se necesitan tener los datos actualizados
SELECT * FROM vw_NumbersSquared;
SELECT * FROM NumbersSquared_insert;


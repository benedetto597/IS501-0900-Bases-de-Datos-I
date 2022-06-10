USE TriggerProcessing;

DROP TRIGGER IF EXISTS tg_calculateSquareRoot;
-- lo insertado en la tabla principal viene en el objeto "new"
DELIMITER $$

CREATE TRIGGER tg_calculateSquareRoot
    AFTER INSERT 
    ON Numbers FRO EACH ROW
BEGIN
    INSERT INTO NumbersSquare(num_id_fk, num_squared)
    VALUES (new.id,SQRT(new.id));
END$$

DELIMITER ;
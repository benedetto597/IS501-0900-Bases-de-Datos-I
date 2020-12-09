USE CursorProcesing;

SELECT COUNT(*) AS "Count" FROM Measure;

SET @minValue = 37; 

CALL sp_sumarizedData(@minValue);

SELECT * FROM MeasureSumarized;
USE CursorProcesing;

SELECT COUNT(*) AS "Count" FROM Measure;

SET @minValue = 36; 

CALL sp_sumarizeData(@minValue);

SELECT * FROM MeasureSumarized;
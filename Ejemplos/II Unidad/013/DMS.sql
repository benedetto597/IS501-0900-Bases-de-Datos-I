
/*    
    @author edgar.benedetto@unah.hn
    @date 04-12-2020
    @version 0.1

    Tablas virtuales utilizando vistas
    - Usar instrucciones SQL que permitan crear una tabla virtual donde se muestran conjuntos de datos
        basados en una consulta, quedando almacenadas como tablas dentro del sistema de gestión de bases
        de datos.

    Vistas
    Proposito
    * Pueda existir una referencia de un conjunto de datos que no tengan un espacio fisico propio 
        sino que son un extracto de otro espacio de memoria y se almacenan como una referencia de vista
        solo muestra una porción de los datos.
    
    Definición
    - Es una tabla derivada de otras tablas 
    - Dichas tablas pueden ser definidas en vistas previas
    - La vista no necesariamente debe ocupar espacio fisico de la base de datos
    - Se concidera una tabla virtual

*/

USE Example;

DROP VIEW IF EXISTS FirstDeviceMeasureRecent;

CREATE VIEW FirstDeviceMeasureRecent AS
    SELECT 
        *
    FROM 
        Measure
    WHERE 
        device = 1
    ORDER BY 
        id ASC 
    LIMIT 10
;

SELECT "First Device Measure Recent" * AS "View", COUNT(*) AS "Count" FROM FirstDeviceMeasureRecent;

/*
    1) Cree una vista que muestre la cantidad de registros por cada mes, para el año 2020, llamada "CountMonth2020"
*/

DROP VIEW IF EXISTS CountMonth2020;

CREATE VIEW CountMonth2020 AS
    SELECT 
        MONTH(Measure.date) AS "Month",
        COUNT(*) AS "Count"
    FROM 
        Measure
    WHERE 
        YEAR(Measure.date) = 2020
    GROUP BY 
        MONTH(Measure.date)
    ORDER BY 
        MONTH(Measure.data) ASC
;

SELECT * FROM CountMonth2020;

/*
    2) En el departamento  de TI de una institución financiera, se desea registrar de forma permanente la consulta 
        que genera el informe de la cantidad de elementos de medición por hora del día, para el mes de Noviembre 
        de 2020. Esta consulta se debera guardar como "CountByDayOnNovember2020"
*/

DROP VIEW IF EXISTS CountByDayOnNovember2020;

CREATE VIEW CountByDayOnNovember2020 AS
    SELECT 
        HOUR(Measure.date) AS "Hour",
        COUNT(*) AS "Count"
    FROM
        Measure
    WHERE 
        MONTH(Measure.date) = 11 AND
        YEAR(Measure.date) = 2020 
    GROUP BY 
        HOUR(Measure.date)
    ORDER BY 
        HOUR(Measure.date) ASC
;

SELECT * FROM CountByDayOnNovember2020;

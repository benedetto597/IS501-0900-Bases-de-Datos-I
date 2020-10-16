
@author jose.inestroza@unah.edu.hn
@date 2020/09/21

Funcionalidades Generales Usando SQL
=====

Ejemplos de uso de SQL Select
-----

Veamos algunas funcionalidades interesantes que se pueden ejecutar en SQL.

        -- Generación de flotantes aleatorios
        SELECT rand();

        -- Generación de un entero basado en un flotante aleatorio.
        SELECT CAST(rand()*(101-1)+1 AS INT);

        -- Generación de fechas
        SELECT NOW();

        -- Extracción de datos de fecha
        SELECT 
            YEAR(NOW()) AS "Año";
            MONTH(NOW()) AS "Mes";
            DAY(NOW()) AS "Día";
            HOUR(NOW()) AS "Hora";
            MINUTE(NOW()) AS "Minute";
            SECOND(NOW()) AS "Segundo"
        ;

        -- Concatenar 
        SELECT CONCAT("Hola", " ", "Mundo") AS "Cadena de Hola Mundo";

        -- Generaración de SQL mediante SQL
        SELECT CONCAT("SELECT ","Campo1,","Campo2,","Campo3 ", "FROME DATABASE.TABLENAME") as "Query de SQL";

Ejercicio
-----

Dentro de una oficina se desea registrar una lista de TODO's la cual puede ser utilizada por múltiples usuarios a la vez. Un usuario puede poseer una o muliples listas. Una vez que el sistema esté en marcha, la alta gerencia desea saber el porcentaje de tareas pendientes y completadas sobre el total de tareas de cada departamento, empleado y de la gerencia en total. Haga uso de ER para crear su modelado usando MySQL 5.7/MariaDB 10.3 como SGBD.

Herramienta ER
-----

- Draw.io

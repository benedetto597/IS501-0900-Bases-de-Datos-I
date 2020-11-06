
@author jose.inestroza@unah.edu.hn
@date 2020/10/08

Operadores
=====

Los operadores =, <>, <=, <, >, =>, <<, >>, <=>, AND, OR o LIKE se pueden usar en expresiones en la lista de columnas de salida (a la izquierda de FROM) en instrucciones SELECT. También pueden aplicarse en los condicionales WHERE. Por ejemplo:

        SELECT col1 = 1 AND col2 =2 FROM my_table;

Like
-----

EL operador LIKE se usa en la cláusula WHERE para buscar un patrón específico sobre un atributo.

Hay dos comodines que se usan comúnmente junto con el operador LIKE. Los comodines diguientes pueden validar según SGBD.

- % El signo de porcentaje representa cero, uno o varios caracteres (.*).
- _ El guión bajo representa un solo caracter.

Algunos de los ejemplos tradicionales para el uso de Like se muestran a continuación:

- atributo LIKE 'z_%': Buscar cualquier valor que comience por "z" que tenga al menos 3 caracteres de longitud.
- atributo LIKE '_z%': Buscar cualquier valor que tenga "z" en la segunda posición.
- atributo LIKE '%z': Buscar cualquier valor que termine con una "z".
- atributo LIKE '%hn%': Buscar cualquier valor que tenga "hn" en cualquier posición del campo.

In
-----

El operador IN es una abreviatura de múltiples condiciones OR. El operador IN permite especificar varios valores en una cláusula WHERE.

        WHERE atrubuto IN (value1, value2, ...);
        WHERE atrubuto IN (SELECT STATEMENT);

Group by, max, min, avg, sum
-----

La función COUNT() devuelve el número de filas que coincide con un criterio específico y es la que hemos usado antes para verificar la "existencia de cantidad" de "tareas para un usuario, gerencia, etc".

- La función MIN() devuelve el valor más pequeño de la columna seleccionada.
- La función MAX() devuelve el valor más grande de la columna seleccionada.
- La función AVG() devuelve el valor promedio de una columna numérica.
- La función SUM() devuelve el valor de la suma total de una columna numérica.

Order by
-----

La palabra clave ORDER BY se utiliza para ordenar el conjunto de resultados en orden ascendente (ASC) o descendente (DESC).

Having
-----

La clausula HAVING se usa en SQL para cuando existen condicionales que no pueden aplicarse en el WHERE.

        GROUP BY atrivuto(s) HAVING condicional

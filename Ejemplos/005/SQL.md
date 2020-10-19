@author jose.inestroza@unah.edu.hn
@date 2020/10/05

# Definición Clase Lunes 05 de Octubre de 2020

La explicación de la clase del día de hpy será:

- Se definirá mediante teoría, usando un archivo Markdown, distintos conceptos de instrucciones de SQL.
- Se definirá código SQL pra aplicar la teoría anterior.
- Se ejecutará el cógigo SQL para demostrar la teoría.

# Otras sentencias de Manipulación de Datos

## Aliasing en Tablas

Se aplica mediante la palabra reservada **AS** en atributos o en relaciones para generar un alias temporal para mostrar un dato con un nombre distinto o para aplicar nomenclatura específicada.

## Límite

Se aplica mediante la palabra **LIMIT**. Si solo se necesita un número específico de más de un conjunto de resultados, utilice una cláusula LIMIT en la consulta, en lugar de recuperar todo el conjunto de resultados.

Mediante **LIMIT** es posible generar la visualización de resultados mediante "páginas de datos", limitando la cantidad de filas y las filas que se muestran en pantalla.

# Otras sentencias de SQL para Administración de Datos

Algunas de estas sentencias anteriores son:

- SHOW DATABASES.
- SHOW TABLES.
- DESCRIBE.

## SHOW CREATE DATABASE

Se utiliza mendiante **SHOW CREATE DATABASE dataBaseName;** y permite visualizar el código DDS para la creación de la base de datos.

## SHOW CREATE TABLE

Se utiliza mediante **SHOW CREATE TABLE tableName;** y permite visualizar el código DDS para la creación dde la tabla de la base de datos.

## DROP DATABASE IF EXISTS

Permite eliminar una base de datos únicamente si esta existe, y se utiliza antes de la creación de la tabla de datos para su aplicación.

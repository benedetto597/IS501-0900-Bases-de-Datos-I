
-- La limpieza de las tablas, en caso que las tablas ya existieran.
TRUNCATE Gerencia;
TRUNCATE Departamento;
TRUNCATE Usuario;
TRUNCATE Lista;
TRUNCATE Tarea;

-- Se agregan datos de prueba a las tablas.
INSERT INTO Gerencia(nombre) VALUES
    ("Tecnologías de Información"),
    ("Mercadeo")
;

INSERT INTO Departamento(id_gerencia, nombre) VALUES
    (1, "Desarrollo Web"),
    (1, "Desarrollo Móvil"),
    (2, "Canales Digitales")
;

INSERT INTO Usuario(id_departamento, nombre) VALUES
    (1, "Alan Vigil"),
    (2, "Alejandra Ramos"),
    (3, "Yelmi Elvir")
;

INSERT INTO Lista(id_usuario, nombre) VALUES
    (1, "Bases de Datos 1"),
    (1, "Videojuegos para los feriados"),
    (3, "Películas pendientes")
;

INSERT INTO Tarea(id_lista, descripcion) VALUES
    (1, "Aprender sobre el modelo ER."),
    (1, "Aprender sobre el modelo relacional."),
    (1, "Listar todas las sentencias de SQL para incrementar, modificar y seleccionar registros."),
    (2, "Metal Gear Solid Collection"),
    (3, "El silencio de los Inocentes")
;

-- Actualización
-- UPDATE TABLA SET CAMPO = VALOR WHERE CONDITIONAL
UPDATE Tarea SET estado = "Completada" WHERE id=1;

-- Consultas
SELECT Lista.id_usuario AS "Identificador de Usuario", Tarea.estado AS "Estado de la tarea", COUNT(*) AS "Cantidad de Tareas" FROM Tarea JOIN Lista ON Tarea.id_lista = Lista.id GROUP BY Lista.id_usuario, Tarea.estado;

-- SubConsultas
SELECT Lista.id_usuario AS "Identificador de Usuario", Tarea.estado AS "Estado de la tarea", COUNT(*) AS "Cantidad de Tareas", (SELECT COUNT(*) FROM Tarea JOIN Lista ON Tarea.id_lista = Lista.id WHERE Lista.id_usuario = Usuario.id) AS "Total de Registros del usuario", CONCAT(COUNT(*)/(SELECT COUNT(*) FROM Tarea JOIN Lista ON Tarea.id_lista = Lista.id WHERE Lista.id_usuario = Usuario.id)*100, " &") AS "Porcentaje" FROM Tarea JOIN Lista ON Tarea.id_lista = Lista.id JOIN Usuario ON Lista.id_usuario = Usuario.id GROUP BY Lista.id_usuario, Tarea.estado;
-- Listar Tareas --
SELECT * FROM Tarea;

-- Listar tareas con id = 1 --  
SELECT * FROM Tarea WHERE id = 1;

-- Listar tareas con condiciones --
SELECT * FROM Tarea WHERE (id = 1 OR id = 4) AND (id_lista = 2);

-- Descripcion y id de una tarea -- 
SELECT Tarea.id, Tarea.descripcion FROM Tarea;

-- Descripcion, id_lista y id de una tarea -- 
SELECT Tarea.id, Tarea.id_lista, Tarea.descripcion FROM Tarea;

-- Unir la tabla tarea con la tabla lista, usando el campo que tienen en común.
SELECT Tarea.id, Tarea.id_lista, Lista.id_usuario, Tarea.descripcion FROM Tarea JOIN Lista ON Tarea.id_lista = Lista.id;

-- Unir la tabla usuario con la tabla lista
SELECT Tarea.id, Tarea.id_lista, Lista.id_usuario, Usuario.id_departamento, Tarea.descripcion FROM Tarea JOIN Lista ON Tarea.id_lista = Lista.id JOIN Usuario ON Lista.id_usuario = Usuario.id;

-- Mostrar solo las tareas asociadas a un usuario.
SELECT Tarea.id, Tarea.id_lista, Lista.id_usuario, Usuario.id_departamento, Tarea.descripcion FROM Tarea JOIN Lista ON Tarea.id_lista = Lista.id JOIN Usuario ON Lista.id_usuario = Usuario.id WHERE id_usuario = 1;

-- Unir la tabla departamento con la tabla usuario
SELECT Tarea.id, Tarea.id_lista, Lista.id_usuario, Usuario.id_departamento, Departamento.id_gerencia, Tarea.descripcion FROM Tarea JOIN Lista ON Tarea.id_lista = Lista.id JOIN Usuario ON Lista.id_usuario = Usuario.id JOIN Departamento ON Usuario.id_departamento = Departamento.id;

-- Se usa AS para aplicar aliases
SELECT Tarea.id AS Tarea, Tarea.id_lista AS Lista, Lista.id_usuario AS Propietario, Usuario.id_departamento AS Departamento, Departamento.id_gerencia AS Gerencia, Tarea.descripcion AS Descripcion FROM Tarea JOIN Lista ON Tarea.id_lista = Lista.id JOIN Usuario ON Lista.id_usuario = Usuario.id JOIN Departamento ON Usuario.id_departamento = Departamento.id;

-- Reducir tamaño de una cadena (Descripción)
SELECT Tarea.id AS Tarea, Tarea.id_lista AS Lista, Lista.id_usuario AS Propietario, Usuario.id_departamento AS Departamento, Departamento.id_gerencia AS Gerencia, CONCAT(SUBSTRING(Tarea.descripcion,1,20), "…") AS Descripcion FROM Tarea JOIN Lista ON Tarea.id_lista = Lista.id JOIN Usuario ON Lista.id_usuario = Usuario.id JOIN Departamento ON Usuario.id_departamento = Departamento.id;

-- Cuantas tareas tiene un usuario
SELECT Lista.id_usuario AS "Identificador de Usuario", COUNT(*) AS "Cantidad de tareas del usuario" FROM Tarea JOIN Lista ON Tarea.id_lista = Lista.id GROUP BY Lista.id_usuario;

/*
Subconsulta: Es una consulta SQL dentro de otra consulta SQL, una subconsulta no debería generar una tabla sino solamente un dato. 
Ej: SELECT (SELECT 1 + 1) AS “Campo 1”, (SELECT “Hola Mundo”) AS “Campo 2”; 
*/

-- Agrupar a los usuarios que tienen tareas. 
SELECT Lista.id_usuario AS "Identificador de usuario", COUNT(*) AS "Cantidad de tareas"  FROM Tarea JOIN Lista ON Tarea.id_lista = Lista.id GROUP BY Lista.id_usuario;

-- Agrupamiento por el estado de las tareas y el id del usuario.
SELECT Lista.id_usuario AS "Identificador de usuario", Tarea.estado AS "Estado de la tarea", COUNT(*) AS "Cantidad de tareas"  FROM Tarea JOIN Lista ON Tarea.id_lista = Lista.id GROUP BY Lista.id_usuario, Tarea.estado;

-- Subconsulta del conteo total de registros para un usuario en específico que servirá para dar el valor porcentual de tareas completadas y no completadas. Se puede usar una tabla del exterior de la subconsulta en el interior de la subconsulta en este caso es la tabla Usuario.
SELECT Lista.id_usuario AS "Identificador de usuario", Tarea.estado AS "Estado de la tarea", COUNT(*) AS "Cantidad de tareas", (SELECT COUNT(*) FROM Tarea JOIN Lista ON Tarea.id_lista = Lista.id WHERE Lista.id_usuario = Usuario.id ) AS "Total de registros del usuario", CONCAT(COUNT(*)/(SELECT COUNT(*) FROM Tarea JOIN Lista ON Tarea.id_lista = Lista.id WHERE Lista.id_usuario = Usuario.id )*100, " %") AS "Porcentaje"  FROM Tarea JOIN Lista ON Tarea.id_lista = Lista.id JOIN Usuario ON Lista.id_usuario = Usuario.id GROUP BY Lista.id_usuario, Tarea.estado;
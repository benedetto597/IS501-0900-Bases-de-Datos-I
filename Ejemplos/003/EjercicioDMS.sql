
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

INSERT INTO Tareas(id_lista, descripcion) VALUES
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
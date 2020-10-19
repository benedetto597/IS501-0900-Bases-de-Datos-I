/*

 @author edgar.benedetto@unah.hn
 @date 08-10-2020
 @version 0.1

*/

-- Limpieza de las tablas en caso de que las tablas existieran -- 
TRUNCATE  Gerencia; 
TRUNCATE  Departamento;
TRUNCATE  Usuario;
TRUNCATE  Lista;
TRUNCATE  Tarea;

-- Se agregan datos de prueba a las tablas --
INSERT INTO Gerencia(nombre) VALUES
	('Tecnologias de informacion'), 
	('Mercadeo')
;

INSERT INTO Departamento(id_gerencia, nombre) VALUES
	(1, 'Desarrollo Web'), 
	(1, 'Desarrollo Movil'),
    (2, 'Canales digitales')
;

INSERT INTO Usuario(id_departamento, nombre) VALUES
	(1, 'Alan Vigil'), 
	(2, 'Alejandra Ramos'),
    (3, 'Yelmi Elvir')
;

INSERT INTO Lista(id_usuario, nombre) VALUES
	(1, 'Bases de Datos I'), 
	(1, 'Videojuegos para feriados'),
    (3, 'Peliculas Pendientes')
;

INSERT INTO Tarea(id_lista, descripcion) VALUES
	(1, 'Aprender sobre el modelo entidad-relacion'), 
	(1, 'Modelo Relacional'),
    (1, 'Listar las sentencias SQL para insertar, modificar y seleccionar 
    registros'),
    (2, 'Metal Gear Solid Collection'),
    (3, 'El silencio de los inocentes')
;
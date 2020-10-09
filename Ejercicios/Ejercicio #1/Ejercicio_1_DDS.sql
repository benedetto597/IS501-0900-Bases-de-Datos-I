/*

 @author edgar.benedetto@unah.hn
 @date 08-10-2020
 @version 0.1

*/

-- Creacion de la base de datos -- 
CREATE DATABASE IF NOT EXISTS EmpresaDB; 

-- Se selecciona la base de datos para su uso --
USE EmpresaDB;

-- Creacion de tablas de bases de datos --

-- Cada campo de llave primaria son un identificador de cada tabla -- 
-- Un atributo obligatorio o que no puede ser nulo (nombre) --
-- Para denotar las relaciones entre tablas se usa una llave foránea – 

-- Cada campo de texto con nomenclatura utf8 --
-- Limitar un tamaño de una cadena de texto (nombre) VARCHAR --
CREATE TABLE IF NOT EXISTS Gerencia(
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(200) NOT NULL
) CHARACTER SET utf8;


CREATE TABLE IF NOT EXISTS Departamento(
    id INT AUTO_INCREMENT PRIMARY KEY, 
    nombre VARCHAR(200) NOT NULL,
    id_gerencia INT NOT NULL 
) CHARACTER SET utf8;


CREATE TABLE IF NOT EXISTS Usuario(
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(200) NOT NULL,
    id_departamento INT NOT NULL
) CHARACTER SET utf8;

-- ON UPDATE NOW() permite actualizar un campo al actualizar la tabla que lo contiene, considerado un trigger o disparador -- 
-- TIMESTAMP DEFAULT NOW() valor de 32 bits, es un valor que tiene un origen en el tiempo que tiene la fecha de “ahora” – 
CREATE TABLE IF NOT EXISTS Lista(
    id INT AUTO_INCREMENT PRIMARY KEY,
	id_usuario INT NOT NULL,
    nombre TEXT NOT NULL,
    creacion TIMESTAMP DEFAULT NOW(),
    actualizado TIMESTAMP DEFAULT NOW() ON UPDATE NOW(),
    estado ENUM('vigente', 'archivado', 'eliminado') DEFAULT 'vigente'
) CHARACTER SET utf8;


CREATE TABLE IF NOT EXISTS Tarea(
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_lista INT NOT NULL,
    descripcion TEXT NOT NULL,
    creacion TIMESTAMP DEFAULT NOW(),
    actualizado TIMESTAMP DEFAULT NOW() ON UPDATE NOW(),
    estado ENUM('completado', 'no completado') DEFAULT 'no completado'
) CHARACTER SET utf8;
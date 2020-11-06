
-- Debido a que todo el diseño anterior fue creado en español, entonces, la nomenclatura hará uso del mismo idioma.

-- Creación de la base de datos.
CREATE DATABASE IF NOT EXISTS EmpresaBD:

-- Se selecciona la base de datos para su uso
USE EmpresaBD;

-- Se crean las tablas de base de datos.

    CREATE TABLE IF NOT EXISTS Gerencia(
        id INT AUTO_INCREMENT PRIMARY KEY,
        nombre VARCHAR(200) NOT NULL
    ) CHARACTER SET utf8;

    CREATE TABLE IF NOT EXISTS Departamento(
        id INT AUTO_INCREMENT PRIMARY KEY,
        id_gerencia INT NOT NULL,
        nombre VARCHAR(200) NOT NULL
    ) CHARACTER SET utf8;

    CREATE TABLE IF NOT EXISTS Usuario(
        id INT AUTO_INCREMENT PRIMARY KEY,
        id_departamento INT NOT NULL,
        nombre VARCHAR(200) NOT NULL
    ) CHARACTER SET utf8;

    CREATE TABLE IF NOT EXISTS Lista(
        id INT AUTO_INCREMENT PRIMARY KEY,
        id_usuario INT NOT NULL,
        nombre TEXT NOT NULL,
        creacion TIMESTAMP DEFAULT NOW(),
        actualizado TIMESTAMP DEFAULT NOW() ON UPDATE NOW(),
        estado ENUM('Vigente','Archivada','Eliminada') DEFAULT 'Vigente'
    ) CHARACTER SET utf8;
    
    CREATE TABLE IF NOT EXISTS Tarea(
        id INT AUTO_INCREMENT PRIMARY KEY,
        id_lista INT NOT NULL,
        descripcion TEXT NOT NULL,
        creacion TIMESTAMP DEFAULT NOW(),
        actualizado TIMESTAMP DEFAULT NOW() ON UPDATE NOW(),
        estado ENUM('Completada','No Completada') DEFAULT 'No Completada'
    ) CHARACTER SET utf8;
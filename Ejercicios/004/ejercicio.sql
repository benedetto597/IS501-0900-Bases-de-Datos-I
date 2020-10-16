
-- Creación de la base de datos, unicamente si esta no existe.

CREATE DATABASE IF NOT EXIST GameCatalogue;

-- Seleccionar la base de datos para su uso.
USE GameCatalogue;

-- Se crean las tablas de base de datos

    CREATE TABLE IF NOT EXISTS Player(
        id INT AUTO_INCREMENT PRIMARY KEY,
        tex_name TEXT NOT NULL,
        tim_creatio TIMESTAMP DEFAULT NOW(),
        cod_state ENUM('Active', 'Blocked', 'Inactive') DEFAULT 'Active'
    )CHARACTER SET utf8;

    CREATE TABLE IF NOT EXISTS Game(
        id INT AUTO_INCREMENT PRIMARY KEY,
        tex_name TEXT NOT NULL
    )CHARACTER SET utf8;

    -- Aĺicar la restricción de integridad referencial
    CREATE TABLE IF NOT EXISTS GamePlayer(
        id INT AUTO_INCREMENT PRIMARY KEY,
        id_player INT NOT NULL,
        id_game INT NOT NULL,
        tim_lastPLayed TIMESTAMP NULL,
        cod_state ENUM('on-process', 'nor-played', 'beated') DEFAULT 'not-played'
    )CHARACTER SET utf8;

-- Eliminar Tablas
/*DROP TABLE Player;
DROP TABLE Game;
DROP TABLE GamePlayer;*/

-- Eliminar la base de Datos
-- DROP DATABASE GameCatalogue;

/* Se le pide al estudiante:
    - Crear el diagrama y el modelo ER.
    - Aplicar en SQL las restricciones de integridad de Foreing Key basado en su ER.
    - Aplicar las restricciones de integridad mediante CREATE TABLE y mediante ALTER TABLE.
*/
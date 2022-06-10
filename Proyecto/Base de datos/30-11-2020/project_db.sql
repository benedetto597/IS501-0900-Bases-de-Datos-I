CREATE DATABASE IF NOT EXISTS ImageDatabase CHARACTER SET utf8;
USE ImageDatabase;

CREATE TABLE IF NOT EXISTS Binnacle (
    id INT AUTO_INCREMENT PRIMARY KEY COMMENT "id del registro de bitacora",
    jso_acciones JSON NOT NUll
) COMMENT "bitacora de usuario";

CREATE TABLE IF NOT EXISTS Manager (
	id INT AUTO_INCREMENT PRIMARY KEY COMMENT "id del administrador",
    var_userName VARCHAR(30) NOT NULL COMMENT "nombre de usuario",
    var_password VARCHAR(30) NOT NULL COMMENT "contraseña de usuario",
    id_binnacle INT NOT NULL,
    CONSTRAINT MAN_BIN_FK FOREIGN KEY (id_binnacle) 
        REFERENCES Binnacle(id)
        ON UPDATE CASCADE ON DELETE RESTRICT
) COMMENT "tabla de usuario administrador";

CREATE TABLE IF NOT EXISTS Operator(
	id INT AUTO_INCREMENT PRIMARY KEY COMMENT "id del operador",
    id_user INT NOT NULL COMMENT "id del usuarios con la que relacionamos la tabla",
    date_dateAdmission DATE NOT NULL COMMENT "fecha de ingreso del usuario",
    id_binnacle INT NOT NULL,
    CONSTRAINT OPE_BIN_FK FOREIGN KEY (id_binnacle) 
        REFERENCES Binnacle(id)
        ON UPDATE CASCADE ON DELETE RESTRICT
) COMMENT "tabla de usuarios operadores";

CREATE TABLE IF NOT EXISTS Graphics(
	id INT AUTO_INCREMENT PRIMARY KEY COMMENT "id del dibujo",
    jso_graph JSON NOT NULL COMMENT "dibujo del usuario guardado como JSON",
    id_operator INT NOT NULL COMMENT "id del usuario operador",
    CONSTRAINT GRA_OPE_FK FOREIGN KEY (id_operator) 
        REFERENCES Operator(id)
		ON UPDATE CASCADE ON DELETE RESTRICT
) COMMENT "tabla de los dibujos hechos por el usuario operador";

CREATE TABLE IF NOT EXISTS DrawingSettings (
    var_penColor VARCHAR(50) NOT NULL COMMENT "color del lapiz",
    var_fillColor VARCHAR(50) NOT NULL COMMENT "color de relleno"
) COMMENT "tabla de configuraciones de dibujo";

/*
Base de datos de respaldo con la misma estructura con la diferencia que la imagen se guarda
como LONGBLOB en vez de JSON
*/
CREATE DATABASE IF NOT EXISTS BackupImageDatabase CHARACTER SET utf8;
USE BackupImageDatabase;

CREATE TABLE IF NOT EXISTS Binnacle (
    id INT AUTO_INCREMENT PRIMARY KEY COMMENT "id del registro de bitacora",
    jso_acciones JSON NOT NUll
) COMMENT "bitacora de usuario";

CREATE TABLE IF NOT EXISTS Manager (
	id INT AUTO_INCREMENT PRIMARY KEY COMMENT "id del administrador",
    var_userName VARCHAR(30) NOT NULL COMMENT "nombre de usuario",
    var_password VARCHAR(30) NOT NULL COMMENT "contraseña de usuario",
    id_binnacle INT NOT NULL,
    CONSTRAINT MAN_BIN_FK FOREIGN KEY (id_binnacle) 
        REFERENCES Binnacle(id)
        ON UPDATE CASCADE ON DELETE RESTRICT
) COMMENT "tabla de usuario administrador";

CREATE TABLE IF NOT EXISTS Operator(
	id INT AUTO_INCREMENT PRIMARY KEY COMMENT "id del operador",
    id_user INT NOT NULL COMMENT "id del usuarios con la que relacionamos la tabla",
    date_dateAdmission DATE NOT NULL COMMENT "fecha de ingreso del usuario",
    id_binnacle INT NOT NULL,
    CONSTRAINT OPE_BIN_FK FOREIGN KEY (id_binnacle) 
        REFERENCES Binnacle(id)
        ON UPDATE CASCADE ON DELETE RESTRICT
) COMMENT "tabla de usuarios operadores";

CREATE TABLE IF NOT EXISTS Graphics(
	id INT AUTO_INCREMENT PRIMARY KEY COMMENT "id del dibujo",
    jso_graph JSON NOT NULL COMMENT "dibujo del usuario guardado como JSON",
    id_operator INT NOT NULL COMMENT "id del usuario operador",
    CONSTRAINT GRA_OPE_FK FOREIGN KEY (id_operator) 
        REFERENCES Operator(id)
		ON UPDATE CASCADE ON DELETE RESTRICT
) COMMENT "tabla de los dibujos hechos por el usuario operador";

CREATE TABLE IF NOT EXISTS DrawingSettings (
    var_penColor VARCHAR(50) NOT NULL COMMENT "color del lapiz",
    var_fillColor VARCHAR(50) NOT NULL COMMENT "color de relleno"
) COMMENT "tabla de configuraciones de dibujo";
CREATE DATABASE sistema_escolar;
USE sistema_escolar;

-- ==========================================
-- TABLA ROLES
-- ==========================================

CREATE TABLE roles (

                       id_rol INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
                       nombre_rol VARCHAR(255) NOT NULL UNIQUE,

                       fyh_creacion DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
                       fyh_actualizacion DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                       estado VARCHAR(11)

) ENGINE=InnoDB;

INSERT INTO roles (nombre_rol, estado) VALUES ('ADMINISTRADOR', '1');
INSERT INTO roles (nombre_rol, estado) VALUES ('DIRECTOR ACADÉMICO', '1');
INSERT INTO roles (nombre_rol, estado) VALUES ('DIRECTOR ADMINISTRATIVO', '1');
INSERT INTO roles (nombre_rol, estado) VALUES ('CONTADOR', '1');
INSERT INTO roles (nombre_rol, estado) VALUES ('SECRETARIA', '1');


-- ==========================================
-- TABLA USUARIOS
-- ==========================================

CREATE TABLE usuarios (

                          id_usuario INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
                          nombres VARCHAR(255) NOT NULL,
                          rol_id INT(11) NOT NULL,
                          email VARCHAR(255) NOT NULL UNIQUE,
                          password TEXT NOT NULL,

                          fyh_creacion DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
                          fyh_actualizacion DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                          estado VARCHAR(11),

                          FOREIGN KEY (rol_id)
                              REFERENCES roles(id_rol)
                              ON DELETE NO ACTION
                              ON UPDATE CASCADE

) ENGINE=InnoDB;

INSERT INTO usuarios
(nombres, rol_id, email, password, estado)
VALUES
    (
        'Emmanuel Coc',
        1,
        'admin@admin.com',
        '$2y$10$0tYmdHU9uGCIxY1f90W1EuIm54NQ8axowkxL1WzLbqO2LdNa8m3l2',
        '1'
    );


-- ==========================================
-- TABLA CONFIGURACIÓN INSTITUCIÓN
-- ==========================================

CREATE TABLE configuracion_instituciones (

                                             id_config_institucion INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
                                             nombre_institucion VARCHAR(255) NOT NULL,
                                             logo VARCHAR(255),
                                             direccion VARCHAR(255) NOT NULL,
                                             telefono VARCHAR(100),
                                             celular VARCHAR(100),
                                             correo VARCHAR(100),

                                             fyh_creacion DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                             fyh_actualizacion DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                                             estado VARCHAR(11)

) ENGINE=InnoDB;

INSERT INTO configuracion_instituciones
(nombre_institucion, logo, direccion, telefono, celular, correo, estado)
VALUES
    (
        'Emmanuel Web School',
        'logo.jpg',
        'Patzicía, Chimaltenango',
        '2228837',
        '59175657007',
        'info@manoloweb.com',
        '1'
    );


-- ==========================================
-- TABLA GESTIONES
-- ==========================================

CREATE TABLE gestiones (

                           id_gestion INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
                           gestion VARCHAR(255) NOT NULL,

                           fyh_creacion DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
                           fyh_actualizacion DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                           estado VARCHAR(11)

) ENGINE=InnoDB;

INSERT INTO gestiones
(gestion, estado)
VALUES
    ('GESTIÓN 2026', '1');


-- ==========================================
-- TABLA NIVELES
-- ==========================================

CREATE TABLE niveles (

                         id_nivel INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
                         gestion_id INT(11) NOT NULL,
                         nivel VARCHAR(255) NOT NULL,
                         turno VARCHAR(255) NOT NULL,

                         fyh_creacion DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
                         fyh_actualizacion DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                         estado VARCHAR(11),

                         FOREIGN KEY (gestion_id)
                             REFERENCES gestiones(id_gestion)
                             ON DELETE NO ACTION
                             ON UPDATE CASCADE

) ENGINE=InnoDB;

INSERT INTO niveles
(gestion_id, nivel, turno, estado)
VALUES
    (1, 'INICIAL', 'MAÑANA', '1');

SET @@session.time_zone = '-06:00';
SET time_zone = '-06:00';

CREATE TABLE roles (

                       id_rol        INT (11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
                       nombre_rol    VARCHAR (255) NOT NULL UNIQUE KEY,

                       fyh_creacion   DATETIME NULL,
                       fyh_actualizacion DATETIME NULL,
                       estado        VARCHAR (11)

)ENGINE=InnoDB;
INSERT INTO roles (nombre_rol,fyh_creacion,estado) VALUES  ('ADMINISTRADOR','2026-06-28 4:10:10','1');
INSERT INTO roles (nombre_rol,fyh_creacion,estado) VALUES  ('DIRECTOR ACADÉMICO','2026-06-28 4:10:10'',','1');
INSERT INTO roles (nombre_rol,fyh_creacion,estado) VALUES  ('DIRECTOR ADMINISTRATIVO','2026-06-28 4:10:10'',','1');
INSERT INTO roles (nombre_rol,fyh_creacion,estado) VALUES  ('CONTADOR','2026-06-28 4:10:10'',','1');
INSERT INTO roles (nombre_rol,fyh_creacion,estado) VALUES  ('SECRETARIA','2026-06-28 4:10:10'',','1');

CREATE TABLE usuarios (

                          id_usuario    INT (11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
                          nombres       VARCHAR (255) NOT NULL,
                          rol_id        INT (11) NOT NULL,
                          email         VARCHAR (255) NOT NULL UNIQUE KEY,
                          password      TEXT NOT NULL,

                          fyh_creacion   DATETIME NULL,
                          fyh_actualizacion DATETIME NULL,
                          estado        VARCHAR (11),

                          FOREIGN KEY (rol_id) REFERENCES roles (id_rol) on delete no action on update cascade

)ENGINE=InnoDB;
INSERT INTO usuarios (nombres,rol_id,email,password,fyh_creacion,estado)
VALUES ('Emmanuel Coc','1','admin@admin.com','$2y$10$0tYmdHU9uGCIxY1f90W1EuIm54NQ8axowkxL1WzLbqO2LdNa8m3l2','2026-06-28 16:10:10','1');

CREATE TABLE configuracion_instituciones (

                                             id_config_institucion    INT (11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
                                             nombre_institucion       VARCHAR (255) NOT NULL,
                                             logo                     VARCHAR (255) NULL,
                                             direccion                VARCHAR (255) NOT NULL,
                                             telefono                 VARCHAR (100) NULL,
                                             celular                  VARCHAR (100) NULL,
                                             correo                   VARCHAR (100) NULL,

                                             fyh_creacion   DATETIME NULL,
                                             fyh_actualizacion DATETIME NULL,
                                             estado        VARCHAR (11)

)ENGINE=InnoDB;
INSERT INTO configuracion_instituciones (nombre_institucion,logo,direccion,telefono,celular,correo,fyh_creacion,estado)
VALUES ('Emmanuel Web School','logo.jpg','Patzicia Chimaltenango','2228837','59175657007','info@manoloweb.com','2026-06-28 16:10:10','1');


CREATE TABLE gestiones (

                           id_gestion      INT (11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
                           gestion         VARCHAR (255) NOT NULL,

                           fyh_creacion   DATETIME NULL,
                           fyh_actualizacion DATETIME NULL,
                           estado        VARCHAR (11)

)ENGINE=InnoDB;
INSERT INTO gestiones (gestion,fyh_creacion,estado)
VALUES ('GESTIÓN 2026','2026-06-28 16:10:10','1');

CREATE TABLE niveles (

                         id_nivel       INT (11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
                         gestion_id     INT (11) NOT NULL,
                         nivel          VARCHAR (255) NOT NULL,
                         turno          VARCHAR (255) NOT NULL,

                         fyh_creacion   DATETIME NULL,
                         fyh_actualizacion DATETIME NULL,
                         estado        VARCHAR (11),

                         FOREIGN KEY (gestion_id) REFERENCES gestiones (id_gestion) on delete no action on update cascade

)ENGINE=InnoDB;
INSERT INTO niveles (gestion_id,nivel,turno,fyh_creacion,estado)
VALUES ('1','INICIAL','MAÑANA','2026-06-28 16:10:10','1');


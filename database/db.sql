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
INSERT INTO roles (nombre_rol,fyh_creacion,estado) VALUES  ('DOCENTE','2026-06-28 4:10:10'',','1');


CREATE TABLE usuarios (

                          id_usuario    INT (11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
                          rol_id        INT (11) NOT NULL,
                          email         VARCHAR (255) NOT NULL UNIQUE KEY,
                          password      TEXT NOT NULL,

                          fyh_creacion   DATETIME NULL,
                          fyh_actualizacion DATETIME NULL,
                          estado        VARCHAR (11),

                          FOREIGN KEY (rol_id) REFERENCES roles (id_rol) on delete no action on update cascade

)ENGINE=InnoDB;
INSERT INTO usuarios (rol_id,email,password,fyh_creacion,estado)
VALUES ('1','admin@admin.com','$2y$10$0tYmdHU9uGCIxY1f90W1EuIm54NQ8axowkxL1WzLbqO2LdNa8m3l2','2026-06-28 16:10:10','1');

CREATE TABLE personas (

                          id_persona      INT (11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
                          usuario_id             INT (11) NOT NULL,
                          nombres            VARCHAR (50) NOT NULL,
                          apellidos          VARCHAR (50) NOT NULL,
                          ci                 VARCHAR (20) NOT NULL,
                          fecha_nacimiento   VARCHAR (20) NOT NULL,
                          profesion          VARCHAR (50) NOT NULL,
                          direccion          VARCHAR (255) NOT NULL,
                          celular            VARCHAR (20) NOT NULL,

                          fyh_creacion   DATETIME NULL,
                          fyh_actualizacion DATETIME NULL,
                          estado        VARCHAR (11),

                          FOREIGN KEY (usuario_id) REFERENCES usuarios (id_usuario) on delete no action on update cascade

)ENGINE=InnoDB;
INSERT INTO personas (usuario_id,nombres,apellidos,ci,fecha_nacimiento,profesion,direccion,celular,fyh_creacion,estado)
VALUES ('1','Elias Emmanuel','Coc Xar','12345678','10/10/2001','LICENCIADO EN EDUCACIÓN','Zona 1, 5a. Avenida 10-25, Ciudad de Guatemala, Guatemala.','51825353','2026-06-28 15:46:10','1');

CREATE TABLE administrativos (

                                 id_administrativo      INT (11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
                                 persona_id             INT (11) NOT NULL,

                                 fyh_creacion   DATETIME NULL,
                                 fyh_actualizacion DATETIME NULL,
                                 estado        VARCHAR (11),

                                 FOREIGN KEY (persona_id) REFERENCES personas (id_persona) on delete no action on update cascade

)ENGINE=InnoDB;

CREATE TABLE docentes (

                          id_docente             INT (11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
                          persona_id             INT (11) NOT NULL,

                          fyh_creacion   DATETIME NULL,
                          fyh_actualizacion DATETIME NULL,
                          estado        VARCHAR (11),

                          FOREIGN KEY (persona_id) REFERENCES personas (id_persona) on delete no action on update cascade

)ENGINE=InnoDB;

CREATE TABLE estudiantes (

                             id_estudiante             INT (11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
                             persona_id             INT (11) NOT NULL,

                             fyh_creacion   DATETIME NULL,
                             fyh_actualizacion DATETIME NULL,
                             estado        VARCHAR (11),

                             FOREIGN KEY (persona_id) REFERENCES personas (id_persona) on delete no action on update cascade

)ENGINE=InnoDB;

CREATE TABLE ppffs (

                       id_ppff             INT (11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
                       persona_id             INT (11) NOT NULL,

                       fyh_creacion   DATETIME NULL,
                       fyh_actualizacion DATETIME NULL,
                       estado        VARCHAR (11),

                       FOREIGN KEY (persona_id) REFERENCES personas (id_persona) on delete no action on update cascade

)ENGINE=InnoDB;


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


-- =====================================
-- TABLA GESTIONES
-- =====================================
CREATE TABLE gestiones (

                           id_gestion INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
                           gestion VARCHAR(255) NOT NULL,

                           fyh_creacion DATETIME NULL,
                           fyh_actualizacion DATETIME NULL,
                           estado VARCHAR(11)

) ENGINE=InnoDB;

INSERT INTO gestiones (gestion, fyh_creacion, estado)
VALUES
    ('GESTIÓN 2026', NOW(), '1');


-- =====================================
-- TABLA NIVELES
-- =====================================
CREATE TABLE niveles (

                         id_nivel INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
                         gestion_id INT(11) NOT NULL,
                         nivel VARCHAR(255) NOT NULL,
                         turno VARCHAR(255) NOT NULL,

                         fyh_creacion DATETIME NULL,
                         fyh_actualizacion DATETIME NULL,
                         estado VARCHAR(11),

                         CONSTRAINT fk_niveles_gestiones
                             FOREIGN KEY (gestion_id)
                                 REFERENCES gestiones(id_gestion)
                                 ON DELETE NO ACTION
                                 ON UPDATE CASCADE

) ENGINE=InnoDB;

INSERT INTO niveles (gestion_id, nivel, turno, fyh_creacion, estado)
VALUES
    (1,'PREPRIMARIA','MAÑANA',NOW(),'1'),
    (1,'PRIMARIA','MAÑANA',NOW(),'1'),
    (1,'BÁSICOS','MAÑANA',NOW(),'1'),
    (1,'DIVERSIFICADO','MAÑANA',NOW(),'1');


-- =====================================
-- TABLA GRADOS
-- =====================================
CREATE TABLE grados (

                        id_grado INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
                        nivel_id INT(11) NOT NULL,
                        curso VARCHAR(255) NOT NULL,
                        paralelo VARCHAR(255) NOT NULL,

                        fyh_creacion DATETIME NULL,
                        fyh_actualizacion DATETIME NULL,
                        estado VARCHAR(11),

                        CONSTRAINT fk_grados_niveles
                            FOREIGN KEY (nivel_id)
                                REFERENCES niveles(id_nivel)
                                ON DELETE NO ACTION
                                ON UPDATE CASCADE

) ENGINE=InnoDB;

INSERT INTO grados (nivel_id, curso, paralelo, fyh_creacion, estado)
VALUES

-- PREPRIMARIA (nivel_id = 1)
(1,'PÁRVULOS','A',NOW(),'1'),
(1,'PREKÍNDER','A',NOW(),'1'),
(1,'KÍNDER','A',NOW(),'1'),

-- PRIMARIA (nivel_id = 2)
(2,'1° PRIMARIA','A',NOW(),'1'),
(2,'2° PRIMARIA','A',NOW(),'1'),
(2,'3° PRIMARIA','A',NOW(),'1'),
(2,'4° PRIMARIA','A',NOW(),'1'),
(2,'5° PRIMARIA','A',NOW(),'1'),
(2,'6° PRIMARIA','A',NOW(),'1'),

-- BÁSICOS (nivel_id = 3)
(3,'1° BÁSICOS','A',NOW(),'1'),
(3,'2° BÁSICOS','A',NOW(),'1'),
(3,'3° BÁSICOS','A',NOW(),'1'),

-- DIVERSIFICADO (nivel_id = 4)
(4,'4° BACHILLERATO','A',NOW(),'1'),
(4,'5° BACHILLERATO','A',NOW(),'1');


CREATE TABLE materias (

                        id_materia INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
                        nombre_materia VARCHAR(255) NOT NULL,

                        fyh_creacion DATETIME NULL,
                        fyh_actualizacion DATETIME NULL,
                        estado VARCHAR(11)
)ENGINE=InnoDB;
INSERT INTO materias (nombre_materia, fyh_creacion, estado)
VALUES ('MATEMATICA', '2026-06-29 11:03:10', '1');


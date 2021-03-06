-- MySQL Script generated by MySQL Workbench
-- mar 06 mar 2018 11:26:59 CST
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mantenimiento
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mantenimiento` ;

-- -----------------------------------------------------
-- Schema mantenimiento
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mantenimiento` DEFAULT CHARACTER SET utf8 ;
USE `mantenimiento` ;

-- -----------------------------------------------------
-- Table `mantenimiento`.`modelo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mantenimiento`.`modelo` ;

CREATE TABLE IF NOT EXISTS `mantenimiento`.`modelo` (
  `id_modelo` INT NOT NULL,
  `modelo` VARCHAR(45) NOT NULL,
  `descripcion` VARCHAR(45) NULL,
  PRIMARY KEY (`id_modelo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mantenimiento`.`marca`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mantenimiento`.`marca` ;

CREATE TABLE IF NOT EXISTS `mantenimiento`.`marca` (
  `id_marca` INT NOT NULL,
  `marca` VARCHAR(45) NOT NULL,
  `descripcion` VARCHAR(45) NULL,
  PRIMARY KEY (`id_marca`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mantenimiento`.`equipo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mantenimiento`.`equipo` ;

CREATE TABLE IF NOT EXISTS `mantenimiento`.`equipo` (
  `id_equipo` INT NOT NULL,
  `serie` VARCHAR(45) NOT NULL,
  `unidad` VARCHAR(45) NULL,
  PRIMARY KEY (`id_equipo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mantenimiento`.`detalle_equipo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mantenimiento`.`detalle_equipo` ;

CREATE TABLE IF NOT EXISTS `mantenimiento`.`detalle_equipo` (
  `id_detalle_equipo` INT NOT NULL,
  `dispositivo` VARCHAR(45) NOT NULL,
  `descripcion` VARCHAR(45) NULL,
  `marca_id_marca` INT NOT NULL,
  `modelo_id_modelo` INT NOT NULL,
  `equipo_id_equipo` INT NOT NULL,
  PRIMARY KEY (`id_detalle_equipo`),
  INDEX `fk_detalle_equipo_marca_idx` (`marca_id_marca` ASC),
  INDEX `fk_detalle_equipo_modelo1_idx` (`modelo_id_modelo` ASC),
  INDEX `fk_detalle_equipo_equipo1_idx` (`equipo_id_equipo` ASC),
  CONSTRAINT `fk_detalle_equipo_marca`
    FOREIGN KEY (`marca_id_marca`)
    REFERENCES `mantenimiento`.`marca` (`id_marca`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalle_equipo_modelo1`
    FOREIGN KEY (`modelo_id_modelo`)
    REFERENCES `mantenimiento`.`modelo` (`id_modelo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalle_equipo_equipo1`
    FOREIGN KEY (`equipo_id_equipo`)
    REFERENCES `mantenimiento`.`equipo` (`id_equipo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mantenimiento`.`tipo_mantenimiento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mantenimiento`.`tipo_mantenimiento` ;

CREATE TABLE IF NOT EXISTS `mantenimiento`.`tipo_mantenimiento` (
  `id_tipo_mantenimiento` INT NOT NULL,
  `tipo_mantenimiento` VARCHAR(45) NOT NULL,
  `observaciones` VARCHAR(45) NULL,
  PRIMARY KEY (`id_tipo_mantenimiento`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mantenimiento`.`solicitud`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mantenimiento`.`solicitud` ;

CREATE TABLE IF NOT EXISTS `mantenimiento`.`solicitud` (
  `id_solicitud` INT NOT NULL,
  `fecha` VARCHAR(45) NOT NULL,
  `responsable` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NULL,
  `telefono` VARCHAR(45) NULL,
  `descripcion` VARCHAR(45) NULL,
  `equipo_id_equipo` INT NOT NULL,
  `tipo_mantenimiento_id_tipo_mantenimiento` INT NOT NULL,
  PRIMARY KEY (`id_solicitud`),
  INDEX `fk_solicitud_equipo1_idx` (`equipo_id_equipo` ASC),
  INDEX `fk_solicitud_tipo_mantenimiento1_idx` (`tipo_mantenimiento_id_tipo_mantenimiento` ASC),
  CONSTRAINT `fk_solicitud_equipo1`
    FOREIGN KEY (`equipo_id_equipo`)
    REFERENCES `mantenimiento`.`equipo` (`id_equipo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_solicitud_tipo_mantenimiento1`
    FOREIGN KEY (`tipo_mantenimiento_id_tipo_mantenimiento`)
    REFERENCES `mantenimiento`.`tipo_mantenimiento` (`id_tipo_mantenimiento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mantenimiento`.`calendario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mantenimiento`.`calendario` ;

CREATE TABLE IF NOT EXISTS `mantenimiento`.`calendario` (
  `id_calendario` INT NOT NULL,
  `fecha_inicio` DATE NOT NULL,
  `descripcion` TEXT NULL,
  `responsable` VARCHAR(45) NOT NULL,
  `telefono` INT(8) NULL,
  `fecha_fin` DATE NULL,
  `cantidad` INT NOT NULL,
  PRIMARY KEY (`id_calendario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mantenimiento`.`orden_trabajo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mantenimiento`.`orden_trabajo` ;

CREATE TABLE IF NOT EXISTS `mantenimiento`.`orden_trabajo` (
  `id_orden_trabajo` INT NOT NULL,
  `fecha_inicio` DATE NOT NULL,
  `prioridad` VARCHAR(45) NOT NULL,
  `solicitud_id_solicitud` INT NOT NULL,
  `calendario_id_calendario` INT NOT NULL,
  PRIMARY KEY (`id_orden_trabajo`),
  INDEX `fk_orden_trabajo_calendario1_idx` (`calendario_id_calendario` ASC),
  INDEX `fk_orden_trabajo_solicitud1_idx` (`solicitud_id_solicitud` ASC),
  CONSTRAINT `fk_orden_trabajo_solicitud1`
    FOREIGN KEY (`solicitud_id_solicitud`)
    REFERENCES `mantenimiento`.`solicitud` (`id_solicitud`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_orden_trabajo_calendario1`
    FOREIGN KEY (`calendario_id_calendario`)
    REFERENCES `mantenimiento`.`calendario` (`id_calendario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mantenimiento`.`detalle_mantenimineto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mantenimiento`.`detalle_mantenimineto` ;

CREATE TABLE IF NOT EXISTS `mantenimiento`.`detalle_mantenimineto` (
  `id_detalle_mantenimineto` INT NOT NULL,
  `hardware/sotfware` VARCHAR(45) NOT NULL,
  `detalle_sotfware` TEXT NULL,
  `detalle_hardware` TEXT NULL,
  `orden_trabajo_id_orden_trabajo` INT NOT NULL,
  PRIMARY KEY (`id_detalle_mantenimineto`),
  INDEX `fk_detalle_mantenimineto_orden_trabajo1_idx` (`orden_trabajo_id_orden_trabajo` ASC),
  CONSTRAINT `fk_detalle_mantenimineto_orden_trabajo1`
    FOREIGN KEY (`orden_trabajo_id_orden_trabajo`)
    REFERENCES `mantenimiento`.`orden_trabajo` (`id_orden_trabajo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mantenimiento`.`pasos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mantenimiento`.`pasos` ;

CREATE TABLE IF NOT EXISTS `mantenimiento`.`pasos` (
  `id_paso` INT NOT NULL,
  `paso` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_paso`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mantenimiento`.`procedimiento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mantenimiento`.`procedimiento` ;

CREATE TABLE IF NOT EXISTS `mantenimiento`.`procedimiento` (
  `id_procedimiento` INT NOT NULL,
  `tipo_procedimiento` VARCHAR(45) NULL,
  `pasos_id_paso` INT NOT NULL,
  PRIMARY KEY (`id_procedimiento`),
  INDEX `fk_procedimiento_pasos1_idx` (`pasos_id_paso` ASC),
  CONSTRAINT `fk_procedimiento_pasos1`
    FOREIGN KEY (`pasos_id_paso`)
    REFERENCES `mantenimiento`.`pasos` (`id_paso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mantenimiento`.`estado_detalle_mantenimiento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mantenimiento`.`estado_detalle_mantenimiento` ;

CREATE TABLE IF NOT EXISTS `mantenimiento`.`estado_detalle_mantenimiento` (
  `id_estado_detalle_mantenimiento` INT NOT NULL,
  `estado` VARCHAR(45) NULL,
  `observaciones` VARCHAR(45) NULL,
  `detalle_mantenimineto_id_detalle_mantenimineto` INT NOT NULL,
  `procedimiento_id_procedimiento` INT NOT NULL,
  PRIMARY KEY (`id_estado_detalle_mantenimiento`),
  INDEX `fk_estado_detalle_mantenimiento_detalle_mantenimineto1_idx` (`detalle_mantenimineto_id_detalle_mantenimineto` ASC),
  INDEX `fk_estado_detalle_mantenimiento_procedimiento1_idx` (`procedimiento_id_procedimiento` ASC),
  CONSTRAINT `fk_estado_detalle_mantenimiento_detalle_mantenimineto1`
    FOREIGN KEY (`detalle_mantenimineto_id_detalle_mantenimineto`)
    REFERENCES `mantenimiento`.`detalle_mantenimineto` (`id_detalle_mantenimineto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_estado_detalle_mantenimiento_procedimiento1`
    FOREIGN KEY (`procedimiento_id_procedimiento`)
    REFERENCES `mantenimiento`.`procedimiento` (`id_procedimiento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mantenimiento`.`diagnostico_parte`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mantenimiento`.`diagnostico_parte` ;

CREATE TABLE IF NOT EXISTS `mantenimiento`.`diagnostico_parte` (
  `id_diagnostico_parte` INT NOT NULL,
  `parte` VARCHAR(45) NOT NULL,
  `observaciones` VARCHAR(45) NULL,
  PRIMARY KEY (`id_diagnostico_parte`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mantenimiento`.`diagnostico`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mantenimiento`.`diagnostico` ;

CREATE TABLE IF NOT EXISTS `mantenimiento`.`diagnostico` (
  `id_diagnostico` INT NOT NULL,
  `diagnostico` VARCHAR(45) NOT NULL,
  `procedimiento_id_procedimiento` INT NOT NULL,
  `diagnostico_parte_id_diagnostico_parte` INT NOT NULL,
  PRIMARY KEY (`id_diagnostico`),
  INDEX `fk_diagnostico_procedimiento1_idx` (`procedimiento_id_procedimiento` ASC),
  INDEX `fk_diagnostico_diagnostico_parte1_idx` (`diagnostico_parte_id_diagnostico_parte` ASC),
  CONSTRAINT `fk_diagnostico_procedimiento1`
    FOREIGN KEY (`procedimiento_id_procedimiento`)
    REFERENCES `mantenimiento`.`procedimiento` (`id_procedimiento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_diagnostico_diagnostico_parte1`
    FOREIGN KEY (`diagnostico_parte_id_diagnostico_parte`)
    REFERENCES `mantenimiento`.`diagnostico_parte` (`id_diagnostico_parte`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mantenimiento`.`trabajadores`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mantenimiento`.`trabajadores` ;

CREATE TABLE IF NOT EXISTS `mantenimiento`.`trabajadores` (
  `id_trabajador` INT NOT NULL,
  `nombres` VARCHAR(100) NOT NULL,
  `apellidos` VARCHAR(100) NOT NULL,
  `email` VARCHAR(45) NULL,
  PRIMARY KEY (`id_trabajador`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mantenimiento`.`cargo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mantenimiento`.`cargo` ;

CREATE TABLE IF NOT EXISTS `mantenimiento`.`cargo` (
  `id_cargo` INT NOT NULL,
  `cargo` VARCHAR(45) NOT NULL,
  `descripcion` VARCHAR(45) NULL,
  `trabajadores_id_trabajador` INT NOT NULL,
  PRIMARY KEY (`id_cargo`),
  INDEX `fk_cargo_trabajadores1_idx` (`trabajadores_id_trabajador` ASC),
  CONSTRAINT `fk_cargo_trabajadores1`
    FOREIGN KEY (`trabajadores_id_trabajador`)
    REFERENCES `mantenimiento`.`trabajadores` (`id_trabajador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mantenimiento`.`orden_trabajo_por_trabajadores`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mantenimiento`.`orden_trabajo_por_trabajadores` ;

CREATE TABLE IF NOT EXISTS `mantenimiento`.`orden_trabajo_por_trabajadores` (
  `orden_trabajo_id_orden_trabajo` INT NOT NULL,
  `trabajadores_id_trabajador` INT NOT NULL,
  `detalle_` TEXT NULL,
  PRIMARY KEY (`orden_trabajo_id_orden_trabajo`, `trabajadores_id_trabajador`),
  INDEX `fk_orden_trabajo_has_trabajadores_trabajadores1_idx` (`trabajadores_id_trabajador` ASC),
  INDEX `fk_orden_trabajo_has_trabajadores_orden_trabajo1_idx` (`orden_trabajo_id_orden_trabajo` ASC),
  CONSTRAINT `fk_orden_trabajo_has_trabajadores_orden_trabajo1`
    FOREIGN KEY (`orden_trabajo_id_orden_trabajo`)
    REFERENCES `mantenimiento`.`orden_trabajo` (`id_orden_trabajo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_orden_trabajo_has_trabajadores_trabajadores1`
    FOREIGN KEY (`trabajadores_id_trabajador`)
    REFERENCES `mantenimiento`.`trabajadores` (`id_trabajador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mantenimiento`.`asuetos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mantenimiento`.`asuetos` ;

CREATE TABLE IF NOT EXISTS `mantenimiento`.`asuetos` (
  `id_asuetos` INT NOT NULL,
  `fecha` DATE NOT NULL,
  `descripcion` VARCHAR(45) NULL,
  PRIMARY KEY (`id_asuetos`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

INSERT INTO marca(id_marca,marca,descripcion) VALUES(1,"DELL","PC");
INSERT INTO marca(id_marca,marca,descripcion) VALUES(2,"HP","PC");
INSERT INTO marca(id_marca,marca,descripcion) VALUES(3,"LENOVO","Laptop");
INSERT INTO marca(id_marca,marca,descripcion) VALUES(4,"marca","Laptop");

INSERT INTO modelo (id_modelo, modelo, descripcion) VALUES (1, "2sca", '');
INSERT INTO modelo (id_modelo, modelo, descripcion) VALUES (2, "v443", NULL);
INSERT INTO modelo (id_modelo, modelo, descripcion) VALUES (3, "2312cs", '');
INSERT INTO modelo (id_modelo, modelo, descripcion) VALUES (4, "dvddv443", NULL);

INSERT INTO equipo (id_equipo, serie, unidad) VALUES (1, "1", "ingenieria");
INSERT INTO equipo (id_equipo, serie, unidad) VALUES (2, "2", "idiomas");
INSERT INTO equipo (id_equipo, serie, unidad) VALUES (3, "3", "profesorado");
INSERT INTO equipo (id_equipo, serie, unidad) VALUES (4, "4", "medicina");

INSERT INTO detalle_equipo (id_detalle_equipo, dispositivo, descripcion, marca_id_marca, modelo_id_modelo, equipo_id_equipo) VALUES (1, "monitor", "io", 1, 1, 1);
INSERT INTO detalle_equipo (id_detalle_equipo, dispositivo, descripcion, marca_id_marca, modelo_id_modelo, equipo_id_equipo) VALUES (2, "cpu", "cpu", 2, 2, 2);
INSERT INTO detalle_equipo (id_detalle_equipo, dispositivo, descripcion, marca_id_marca, modelo_id_modelo, equipo_id_equipo) VALUES (3, "monitor", "io", 1, 2, 1);
INSERT INTO detalle_equipo (id_detalle_equipo, dispositivo, descripcion, marca_id_marca, modelo_id_modelo, equipo_id_equipo) VALUES (4, "mouse", "io", 1, 1, 1);
INSERT INTO detalle_equipo (id_detalle_equipo, dispositivo, descripcion, marca_id_marca, modelo_id_modelo, equipo_id_equipo) VALUES (5, "teclado", "io", 2, 1, 2);
INSERT INTO detalle_equipo (id_detalle_equipo, dispositivo, descripcion, marca_id_marca, modelo_id_modelo, equipo_id_equipo) VALUES (6, "teclado", "io", 4, 3, 3);
INSERT INTO detalle_equipo (id_detalle_equipo, dispositivo, descripcion, marca_id_marca, modelo_id_modelo, equipo_id_equipo) VALUES (7, "cpu", "cpu", 3, 4, 3);
INSERT INTO detalle_equipo (id_detalle_equipo, dispositivo, descripcion, marca_id_marca, modelo_id_modelo, equipo_id_equipo) VALUES (8, "monitor", "io", 4, 4, 4);
INSERT INTO detalle_equipo (id_detalle_equipo, dispositivo, descripcion, marca_id_marca, modelo_id_modelo, equipo_id_equipo) VALUES (9, "mouse", "io", 3, 3, 4);


INSERT INTO tipo_mantenimiento (id_tipo_mantenimiento, tipo_mantenimiento, observaciones) VALUES (1, "preventivo", "se realiza un mantenimiento preventivo");
INSERT INTO tipo_mantenimiento (id_tipo_mantenimiento, tipo_mantenimiento, observaciones) VALUES (2, "correctivo", "se arreglan partes dañadas");


INSERT INTO solicitud (id_solicitud, fecha, responsable, email, telefono, descripcion, equipo_id_equipo, tipo_mantenimiento_id_tipo_mantenimiento) VALUES (1, "2018-01-10", "vladimir", "vladi@gmail.com", "7777777", "realizar un mantenimiento preventivo", 1, 1);
INSERT INTO solicitud (id_solicitud, fecha, responsable, email, telefono, descripcion, equipo_id_equipo, tipo_mantenimiento_id_tipo_mantenimiento) VALUES (2, "2018-02-2", "fernando", "fer@gimail.com", "5555555", "no enciende", 2, 2);
INSERT INTO solicitud (id_solicitud, fecha, responsable, email, telefono, descripcion, equipo_id_equipo, tipo_mantenimiento_id_tipo_mantenimiento) VALUES (3, "2018-02-12", "jayson", "jay@outlook.es", "4444444", "limpieza", 3, 1);
INSERT INTO solicitud (id_solicitud, fecha, responsable, email, telefono, descripcion, equipo_id_equipo, tipo_mantenimiento_id_tipo_mantenimiento) VALUES (4, "2018-03-26", "rene", "rene@hotmail.es", "3333333", "cpu se apaga solo", 4, 2);


INSERT INTO trabajadores (id_trabajador, nombres, apellidos, email) VALUES (1, "juan", "menjivar", "juan@gmail.com");
INSERT INTO trabajadores (id_trabajador, nombres, apellidos, email) VALUES (2, "kevin", "castillo", "castillo@gmail.com");

INSERT INTO calendario (id_calendario, fecha_inicio, descripcion, responsable, telefono, fecha_fin, cantidad) VALUES (1, "2018-01-10", "ninguna", "juan", NULL, NULL, 1);
INSERT INTO calendario (id_calendario, fecha_inicio, descripcion, responsable, telefono, fecha_fin, cantidad) VALUES (2, "2018-02-15", NULL, "luis", NULL, CURRENT_DATE, 2);
INSERT INTO calendario (id_calendario, fecha_inicio, descripcion, responsable, telefono, fecha_fin, cantidad) VALUES (3, "2018-03-08", NULL, "jose", NULL, CURRENT_DATE, 2);

INSERT INTO orden_trabajo (id_orden_trabajo, fecha_inicio, prioridad, solicitud_id_solicitud, calendario_id_calendario) VALUES (1, "2018-01-12", "normal", 1, 1);
INSERT INTO orden_trabajo (id_orden_trabajo, fecha_inicio, prioridad, solicitud_id_solicitud, calendario_id_calendario) VALUES (2, "2018-02-09", "urgente", 2, 2);
INSERT INTO orden_trabajo (id_orden_trabajo, fecha_inicio, prioridad, solicitud_id_solicitud, calendario_id_calendario) VALUES (3, "2018-03-27", "normal", 3, 3);



INSERT INTO pasos (id_paso, paso) VALUES (1, "lipiar la pc por dentro");
INSERT INTO pasos (id_paso, paso) VALUES (2, "revisar los conectores");
INSERT INTO pasos (id_paso, paso) VALUES (3, "limpiar el monitor");
INSERT INTO pasos (id_paso, paso) VALUES (4, "atender el mouse");
INSERT INTO pasos (id_paso, paso) VALUES (5, "limpiar la disquetera");
INSERT INTO pasos (id_paso, paso) VALUES (6, "limpiar la superficie exterior");
INSERT INTO pasos (id_paso, paso) VALUES (7, "realizar un prueba de funcionnamiento");
INSERT INTO pasos (id_paso, paso) VALUES (8, "verificar que el equipo encienda");
INSERT INTO pasos (id_paso, paso) VALUES (9, "verificar que funcionen los controladores");
INSERT INTO pasos (id_paso, paso) VALUES (10, "revisar la hardaware");
INSERT INTO pasos (id_paso, paso) VALUES (11, "cambiar componentes");
INSERT INTO pasos (id_paso, paso) VALUES (12, "desistalar e instalar sotfware");


INSERT INTO procedimiento (id_procedimiento, tipo_procedimiento, pasos_id_paso) VALUES (1, "preventivo", 1);
INSERT INTO procedimiento (id_procedimiento, tipo_procedimiento, pasos_id_paso) VALUES (2, "preventivo", 2);
INSERT INTO procedimiento (id_procedimiento, tipo_procedimiento, pasos_id_paso) VALUES (3, "preventivo", 3);
INSERT INTO procedimiento (id_procedimiento, tipo_procedimiento, pasos_id_paso) VALUES (4, "preventivo", 4);
INSERT INTO procedimiento (id_procedimiento, tipo_procedimiento, pasos_id_paso) VALUES (5, "preventivo", 5);
INSERT INTO procedimiento (id_procedimiento, tipo_procedimiento, pasos_id_paso) VALUES (6, "preventivo", 6);
INSERT INTO procedimiento (id_procedimiento, tipo_procedimiento, pasos_id_paso) VALUES (7, "preventivo", 7);
INSERT INTO procedimiento (id_procedimiento, tipo_procedimiento, pasos_id_paso) VALUES (8, "correctivo", 8);
INSERT INTO procedimiento (id_procedimiento, tipo_procedimiento, pasos_id_paso) VALUES (9, "correctivo", 9);
INSERT INTO procedimiento (id_procedimiento, tipo_procedimiento, pasos_id_paso) VALUES (10, "correctivo", 10);
INSERT INTO procedimiento (id_procedimiento, tipo_procedimiento, pasos_id_paso) VALUES (11, "correctivo", 11);
INSERT INTO procedimiento (id_procedimiento, tipo_procedimiento, pasos_id_paso) VALUES (12, "correctivo", 12);

INSERT INTO detalle_mantenimineto (id_detalle_mantenimineto, `hardware/sotfware`, detalle_sotfware, detalle_hardware, orden_trabajo_id_orden_trabajo) VALUES (1, "hardware", NULL, "tiene polvo", 1);
INSERT INTO detalle_mantenimineto (id_detalle_mantenimineto, `hardware/sotfware`, detalle_sotfware, detalle_hardware, orden_trabajo_id_orden_trabajo) VALUES (2, "hardware", NULL, "no funcion el cpu", 2);
INSERT INTO detalle_mantenimineto (id_detalle_mantenimineto, `hardware/sotfware`, detalle_sotfware, detalle_hardware, orden_trabajo_id_orden_trabajo) VALUES (3, "sotfware", "no tiene antivirus", NULL, 3);

INSERT INTO estado_detalle_mantenimiento (id_estado_detalle_mantenimiento, estado, observaciones, detalle_mantenimineto_id_detalle_mantenimineto, procedimiento_id_procedimiento) VALUES (1, "finalizado", "ninguna", 1, 1);
INSERT INTO estado_detalle_mantenimiento (id_estado_detalle_mantenimiento, estado, observaciones, detalle_mantenimineto_id_detalle_mantenimineto, procedimiento_id_procedimiento) VALUES (2, "en proceso", "no funciona", 2, 2);
INSERT INTO estado_detalle_mantenimiento (id_estado_detalle_mantenimiento, estado, observaciones, detalle_mantenimineto_id_detalle_mantenimineto, procedimiento_id_procedimiento) VALUES (3, "en proceso", "no funciona el mouse", 3, 3);








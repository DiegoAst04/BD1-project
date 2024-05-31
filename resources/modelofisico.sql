-- ---
-- Globals
-- ---

-- SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
-- SET FOREIGN_KEY_CHECKS=0;

-- ---
-- Table 'Sucursal'
-- 
-- ---

DROP TABLE IF EXISTS `Sucursal`;
		
CREATE TABLE `Sucursal` (
  `ID` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `dirección` VARCHAR(128) NULL DEFAULT NULL,
  `teléfono` INTEGER NULL DEFAULT NULL,
  `ID_Evento` INTEGER NULL DEFAULT NULL,
  `DNI_Empleado` INTEGER NULL DEFAULT NULL,
  `ID_Caja` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`ID`, `ID_Evento`, `DNI_Empleado`)
);

-- ---
-- Table 'Empleado'
-- 
-- ---

DROP TABLE IF EXISTS `Empleado`;
		
CREATE TABLE `Empleado` (
  `DNI` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `nombre` VARCHAR(64) NULL DEFAULT NULL,
  `apellido` VARCHAR(64) NULL DEFAULT NULL,
  `puesto` VARCHAR(64) NULL DEFAULT NULL,
  `teléfonos` INTEGER NULL DEFAULT NULL,
  `salario` INTEGER NULL DEFAULT NULL,
  `contraseña` VARCHAR(64) NULL DEFAULT NULL,
  `ID_Mesa` INTEGER NULL DEFAULT NULL,
  `ID_Pedido` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`DNI`, `ID_Mesa`, `ID_Pedido`)
);

-- ---
-- Table 'Caja'
-- 
-- ---

DROP TABLE IF EXISTS `Caja`;
		
CREATE TABLE `Caja` (
  `ID` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `Ganancias` INTEGER NULL DEFAULT NULL,
  `DNI_Empleado` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`ID`, `DNI_Empleado`)
);

-- ---
-- Table 'Plato'
-- 
-- ---

DROP TABLE IF EXISTS `Plato`;
		
CREATE TABLE `Plato` (
  `ID` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `nombre` VARCHAR(64) NULL DEFAULT NULL,
  `descripción` MEDIUMTEXT NULL DEFAULT NULL,
  `tipo` VARCHAR(64) NULL DEFAULT NULL,
  `precio` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`ID`)
);

-- ---
-- Table 'Ingrediente'
-- 
-- ---

DROP TABLE IF EXISTS `Ingrediente`;
		
CREATE TABLE `Ingrediente` (
  `ID` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `nombre` VARCHAR(64) NULL DEFAULT NULL,
  `tipo` VARCHAR(64) NULL DEFAULT NULL,
  `costo` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`ID`)
);

-- ---
-- Table 'Factura'
-- 
-- ---

DROP TABLE IF EXISTS `Factura`;
		
CREATE TABLE `Factura` (
  `ID` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `fecha` DATE NULL DEFAULT NULL,
  `monto` INTEGER NULL DEFAULT NULL,
  `propina` INTEGER NULL DEFAULT NULL,
  `metodo_pago` CHAR NULL DEFAULT NULL,
  `ID_Pedido` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`ID`)
);

-- ---
-- Table 'Proveedor'
-- 
-- ---

DROP TABLE IF EXISTS `Proveedor`;
		
CREATE TABLE `Proveedor` (
  `RUC` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `nombre` VARCHAR(64) NULL DEFAULT NULL,
  `direccion` VARCHAR(128) NULL DEFAULT NULL,
  `telefonos` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`RUC`)
);

-- ---
-- Table 'Mesa'
-- 
-- ---

DROP TABLE IF EXISTS `Mesa`;
		
CREATE TABLE `Mesa` (
  `ID` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `n_mesa` INTEGER NULL DEFAULT NULL,
  `capacidad` INTEGER NULL DEFAULT NULL,
  `ubicacion` VARCHAR(8) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`)
);

-- ---
-- Table 'Reserva'
-- 
-- ---

DROP TABLE IF EXISTS `Reserva`;
		
CREATE TABLE `Reserva` (
  `ID` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `fecha` DATE NULL DEFAULT NULL,
  `hora` TIME NULL DEFAULT NULL,
  `n_personas` INTEGER NULL DEFAULT NULL,
  `ID_Mesa` INTEGER NULL DEFAULT NULL,
  `DNI_Cliente` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`ID`, `ID_Mesa`, `DNI_Cliente`)
);

-- ---
-- Table 'Evento'
-- 
-- ---

DROP TABLE IF EXISTS `Evento`;
		
CREATE TABLE `Evento` (
  `ID` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `nombre` VARCHAR(64) NULL DEFAULT NULL,
  `fecha` DATE NULL DEFAULT NULL,
  `lugar` VARCHAR(64) NULL DEFAULT NULL,
  `descripción` MEDIUMTEXT NULL DEFAULT NULL,
  PRIMARY KEY (`ID`)
);

-- ---
-- Table 'Promoción'
-- 
-- ---

DROP TABLE IF EXISTS `Promoción`;
		
CREATE TABLE `Promoción` (
  `ID` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `f_inicio` DATE NULL DEFAULT NULL,
  `f_fin` DATE NULL DEFAULT NULL,
  `descuento` INTEGER NULL DEFAULT NULL,
  `descripción` MEDIUMTEXT NULL DEFAULT NULL,
  PRIMARY KEY (`ID`)
);

-- ---
-- Table 'Horarios'
-- 
-- ---

DROP TABLE IF EXISTS `Horarios`;
		
CREATE TABLE `Horarios` (
  `ID` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `fecha` DATE NULL DEFAULT NULL,
  `turno` VARCHAR(64) NULL DEFAULT NULL,
  `DNI_Empleado` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`ID`, `DNI_Empleado`)
);

-- ---
-- Table 'Encuesta_satisfaccion'
-- 
-- ---

DROP TABLE IF EXISTS `Encuesta_satisfaccion`;
		
CREATE TABLE `Encuesta_satisfaccion` (
  `ID` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `fecha` DATE NULL DEFAULT NULL,
  `preg_resp` MEDIUMTEXT NULL DEFAULT NULL,
  `comentarios` MEDIUMTEXT NULL DEFAULT NULL,
  PRIMARY KEY (`ID`)
);

-- ---
-- Table 'Reclamo'
-- 
-- ---

DROP TABLE IF EXISTS `Reclamo`;
		
CREATE TABLE `Reclamo` (
  `ID` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `fecha` DATE NULL DEFAULT NULL,
  `descripción` MEDIUMTEXT NULL DEFAULT NULL,
  `DNI_Cliente` INTEGER NULL DEFAULT NULL,
  `DNI_Empleado` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`ID`, `DNI_Cliente`, `DNI_Empleado`)
);

-- ---
-- Table 'Pedido'
-- 
-- ---

DROP TABLE IF EXISTS `Pedido`;
		
CREATE TABLE `Pedido` (
  `ID` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `fecha` DATE NULL DEFAULT NULL,
  `hora` TIME NULL DEFAULT NULL,
  PRIMARY KEY (`ID`)
);

-- ---
-- Table 'Inventario'
-- 
-- ---

DROP TABLE IF EXISTS `Inventario`;
		
CREATE TABLE `Inventario` (
  `ID` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `cantidad` INTEGER NULL DEFAULT NULL,
  `nivel_alerta` INTEGER NULL DEFAULT NULL,
  `ID_Ingrediente` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`ID`)
);

-- ---
-- Table 'Cliente'
-- 
-- ---

DROP TABLE IF EXISTS `Cliente`;
		
CREATE TABLE `Cliente` (
  `DNI` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `nombre` VARCHAR(64) NULL DEFAULT NULL,
  `apellido` VARCHAR(64) NULL DEFAULT NULL,
  `domicilio` VARCHAR(128) NULL DEFAULT NULL,
  `teléfonos` INTEGER NULL DEFAULT NULL,
  `ID_Evaluación` INTEGER NULL DEFAULT NULL,
  `ID_Encuesta_satisfaccion` INTEGER NULL DEFAULT NULL,
  `ID_Factura` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`DNI`, `ID_Evaluación`, `ID_Encuesta_satisfaccion`, `ID_Factura`)
);

-- ---
-- Table 'evento_plato'
-- 
-- ---

DROP TABLE IF EXISTS `evento_plato`;
		
CREATE TABLE `evento_plato` (
  `ID_Evento` INTEGER NULL DEFAULT NULL,
  `ID_Plato` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`ID_Evento`, `ID_Plato`)
);

-- ---
-- Table 'plato_promocion'
-- 
-- ---

DROP TABLE IF EXISTS `plato_promocion`;
		
CREATE TABLE `plato_promocion` (
  `ID_Plato` INTEGER NULL DEFAULT NULL,
  `ID_Promoción` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`ID_Plato`, `ID_Promoción`)
);

-- ---
-- Table 'ingrediente_plato'
-- 
-- ---

DROP TABLE IF EXISTS `ingrediente_plato`;
		
CREATE TABLE `ingrediente_plato` (
  `ID_Plato` INTEGER NULL DEFAULT NULL,
  `ID_Ingrediente` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`ID_Plato`, `ID_Ingrediente`)
);

-- ---
-- Table 'suministra'
-- 
-- ---

DROP TABLE IF EXISTS `suministra`;
		
CREATE TABLE `suministra` (
  `ID_Ingrediente` INTEGER NULL DEFAULT NULL,
  `RUC_Proveedor` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`ID_Ingrediente`, `RUC_Proveedor`)
);

-- ---
-- Table 'plato_pedido'
-- 
-- ---

DROP TABLE IF EXISTS `plato_pedido`;
		
CREATE TABLE `plato_pedido` (
  `ID_Plato` INTEGER NULL DEFAULT NULL,
  `ID_Pedido` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`ID_Plato`, `ID_Pedido`)
);

-- ---
-- Foreign Keys 
-- ---

ALTER TABLE `Sucursal` ADD FOREIGN KEY (ID_Evento) REFERENCES `Evento` (`ID`);
ALTER TABLE `Sucursal` ADD FOREIGN KEY (DNI_Empleado) REFERENCES `Empleado` (`DNI`);
ALTER TABLE `Sucursal` ADD FOREIGN KEY (ID_Caja) REFERENCES `Caja` (`ID`);
ALTER TABLE `Empleado` ADD FOREIGN KEY (ID_Mesa) REFERENCES `Mesa` (`ID`);
ALTER TABLE `Empleado` ADD FOREIGN KEY (ID_Pedido) REFERENCES `Pedido` (`ID`);
ALTER TABLE `Caja` ADD FOREIGN KEY (DNI_Empleado) REFERENCES `Empleado` (`DNI`);
ALTER TABLE `Factura` ADD FOREIGN KEY (ID_Pedido) REFERENCES `Pedido` (`ID`);
ALTER TABLE `Reserva` ADD FOREIGN KEY (ID_Mesa) REFERENCES `Mesa` (`ID`);
ALTER TABLE `Reserva` ADD FOREIGN KEY (DNI_Cliente) REFERENCES `Cliente` (`DNI`);
ALTER TABLE `Horarios` ADD FOREIGN KEY (DNI_Empleado) REFERENCES `Empleado` (`DNI`);
ALTER TABLE `Reclamo` ADD FOREIGN KEY (DNI_Cliente) REFERENCES `Cliente` (`DNI`);
ALTER TABLE `Reclamo` ADD FOREIGN KEY (DNI_Empleado) REFERENCES `Empleado` (`DNI`);
ALTER TABLE `Inventario` ADD FOREIGN KEY (ID_Ingrediente) REFERENCES `Ingrediente` (`ID`);
ALTER TABLE `Cliente` ADD FOREIGN KEY (ID_Encuesta_satisfaccion) REFERENCES `Encuesta_satisfaccion` (`ID`);
ALTER TABLE `Cliente` ADD FOREIGN KEY (ID_Factura) REFERENCES `Factura` (`ID`);
ALTER TABLE `evento_plato` ADD FOREIGN KEY (ID_Evento) REFERENCES `Evento` (`ID`);
ALTER TABLE `evento_plato` ADD FOREIGN KEY (ID_Plato) REFERENCES `Plato` (`ID`);
ALTER TABLE `plato_promocion` ADD FOREIGN KEY (ID_Plato) REFERENCES `Plato` (`ID`);
ALTER TABLE `plato_promocion` ADD FOREIGN KEY (ID_Promoción) REFERENCES `Promoción` (`ID`);
ALTER TABLE `ingrediente_plato` ADD FOREIGN KEY (ID_Plato) REFERENCES `Plato` (`ID`);
ALTER TABLE `ingrediente_plato` ADD FOREIGN KEY (ID_Ingrediente) REFERENCES `Ingrediente` (`ID`);
ALTER TABLE `suministra` ADD FOREIGN KEY (ID_Ingrediente) REFERENCES `Ingrediente` (`ID`);
ALTER TABLE `suministra` ADD FOREIGN KEY (RUC_Proveedor) REFERENCES `Proveedor` (`RUC`);
ALTER TABLE `plato_pedido` ADD FOREIGN KEY (ID_Plato) REFERENCES `Plato` (`ID`);
ALTER TABLE `plato_pedido` ADD FOREIGN KEY (ID_Pedido) REFERENCES `Pedido` (`ID`);

-- ---
-- Table Properties
-- ---

-- ALTER TABLE `Sucursal` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Empleado` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Caja` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Plato` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Ingrediente` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Factura` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Proveedor` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Mesa` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Reserva` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Evento` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Promoción` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Horarios` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Encuesta_satisfaccion` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Reclamo` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Pedido` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Inventario` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Cliente` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `evento_plato` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `plato_promocion` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `ingrediente_plato` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `suministra` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `plato_pedido` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ---
-- Test Data
-- ---

-- INSERT INTO `Sucursal` (`ID`,`dirección`,`teléfono`,`ID_Evento`,`DNI_Empleado`,`ID_Caja`) VALUES
-- ('','','','','','');
-- INSERT INTO `Empleado` (`DNI`,`nombre`,`apellido`,`puesto`,`teléfonos`,`salario`,`contraseña`,`ID_Mesa`,`ID_Pedido`) VALUES
-- ('','','','','','','','','');
-- INSERT INTO `Caja` (`ID`,`Ganancias`,`DNI_Empleado`) VALUES
-- ('','','');
-- INSERT INTO `Plato` (`ID`,`nombre`,`descripción`,`tipo`,`precio`) VALUES
-- ('','','','','');
-- INSERT INTO `Ingrediente` (`ID`,`nombre`,`tipo`,`costo`) VALUES
-- ('','','','');
-- INSERT INTO `Factura` (`ID`,`fecha`,`monto`,`propina`,`metodo_pago`,`ID_Pedido`) VALUES
-- ('','','','','','');
-- INSERT INTO `Proveedor` (`RUC`,`nombre`,`direccion`,`telefonos`) VALUES
-- ('','','','');
-- INSERT INTO `Mesa` (`ID`,`n_mesa`,`capacidad`,`ubicacion`) VALUES
-- ('','','','');
-- INSERT INTO `Reserva` (`ID`,`fecha`,`hora`,`n_personas`,`ID_Mesa`,`DNI_Cliente`) VALUES
-- ('','','','','','');
-- INSERT INTO `Evento` (`ID`,`nombre`,`fecha`,`lugar`,`descripción`) VALUES
-- ('','','','','');
-- INSERT INTO `Promoción` (`ID`,`f_inicio`,`f_fin`,`descuento`,`descripción`) VALUES
-- ('','','','','');
-- INSERT INTO `Horarios` (`ID`,`fecha`,`turno`,`DNI_Empleado`) VALUES
-- ('','','','');
-- INSERT INTO `Encuesta_satisfaccion` (`ID`,`fecha`,`preg_resp`,`comentarios`) VALUES
-- ('','','','');
-- INSERT INTO `Reclamo` (`ID`,`fecha`,`descripción`,`DNI_Cliente`,`DNI_Empleado`) VALUES
-- ('','','','','');
-- INSERT INTO `Pedido` (`ID`,`fecha`,`hora`) VALUES
-- ('','','');
-- INSERT INTO `Inventario` (`ID`,`cantidad`,`nivel_alerta`,`ID_Ingrediente`) VALUES
-- ('','','','');
-- INSERT INTO `Cliente` (`DNI`,`nombre`,`apellido`,`domicilio`,`teléfonos`,`ID_Evaluación`,`ID_Encuesta_satisfaccion`,`ID_Factura`) VALUES
-- ('','','','','','','','');
-- INSERT INTO `evento_plato` (`ID_Evento`,`ID_Plato`) VALUES
-- ('','');
-- INSERT INTO `plato_promocion` (`ID_Plato`,`ID_Promoción`) VALUES
-- ('','');
-- INSERT INTO `ingrediente_plato` (`ID_Plato`,`ID_Ingrediente`) VALUES
-- ('','');
-- INSERT INTO `suministra` (`ID_Ingrediente`,`RUC_Proveedor`) VALUES
-- ('','');
-- INSERT INTO `plato_pedido` (`ID_Plato`,`ID_Pedido`) VALUES
-- ('','');
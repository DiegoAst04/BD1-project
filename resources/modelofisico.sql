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
  `ID` INTEGER AUTO_INCREMENT,
  `direccion` VARCHAR(128) DEFAULT NULL,
  `telefono` INTEGER DEFAULT NULL,
  PRIMARY KEY (`ID`)
);

-- ---
-- Table 'Empleado'
-- 
-- ---

DROP TABLE IF EXISTS `Empleado`;
		
CREATE TABLE `Empleado` (
  `DNI` INTEGER AUTO_INCREMENT,
  `nombre` VARCHAR(255) DEFAULT NULL,
  `apellido` VARCHAR(255) DEFAULT NULL,
  `puesto` VARCHAR(255) DEFAULT NULL,
  `contrasenia` VARCHAR(255) DEFAULT NULL,
  `salario` INTEGER DEFAULT NULL,
  `ID_Sucursal` INTEGER DEFAULT NULL,
  `ID_Caja` INTEGER DEFAULT NULL,
  `new field` INTEGER DEFAULT NULL,
  `ID_Horarios` INTEGER DEFAULT NULL,
  PRIMARY KEY (`DNI`)
);

-- ---
-- Table 'Mesa'
-- 
-- ---

DROP TABLE IF EXISTS `Mesa`;
		
CREATE TABLE `Mesa` (
  `ID` INTEGER AUTO_INCREMENT,
  `n_mesa` INTEGER DEFAULT NULL,
  `capacidad` INTEGER DEFAULT NULL,
  `ubicacion` VARCHAR(255) DEFAULT NULL,
  `DNI_Empleado` INTEGER DEFAULT NULL,
  `ID_Reserva` INTEGER DEFAULT NULL,
  `ID_Sucursal` INTEGER DEFAULT NULL,
  PRIMARY KEY (`ID`)
);

-- ---
-- Table 'Reserva'
-- 
-- ---

DROP TABLE IF EXISTS `Reserva`;

CREATE TABLE `Reserva` (
  `ID` INTEGER AUTO_INCREMENT,
  `fecha` DATE DEFAULT NULL,
  `n_personas` INTEGER DEFAULT NULL,
  `hora` TIME DEFAULT NULL,
  `DNI_Cliente` INTEGER DEFAULT NULL,
  `ID_Sucursal` INTEGER DEFAULT NULL,
  PRIMARY KEY (`ID`)
);

-- ---
-- Table 'Cliente'
-- 
-- ---

DROP TABLE IF EXISTS `Cliente`;

CREATE TABLE `Cliente` (
  `DNI` INTEGER AUTO_INCREMENT,
  `nombre` VARCHAR(255) DEFAULT NULL,
  `apellido` VARCHAR(255) DEFAULT NULL,
  `domicilio` VARCHAR(128) DEFAULT NULL,
  PRIMARY KEY (`DNI`)
);

-- ---
-- Table 'encuesta_satisfaccion'
-- 
-- ---

DROP TABLE IF EXISTS `encuesta_satisfaccion`;
		
CREATE TABLE `encuesta_satisfaccion` (
  `ID` INTEGER AUTO_INCREMENT,
  `fecha` DATE DEFAULT NULL,
  `preg_resp` INTEGER DEFAULT NULL,
  `comentarios` VARCHAR(255) DEFAULT NULL,
  `DNI_Cliente` INTEGER DEFAULT NULL,
  `ID_Sucursal` INTEGER DEFAULT NULL,
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
  `metodo_de_pago` INTEGER NULL DEFAULT NULL,
  `DNI_Cliente` INTEGER NULL DEFAULT NULL,
  `ID_Mesa` INTEGER NULL DEFAULT NULL,
  `ID_Sucursal` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`ID`, `ID_Mesa`)
);

-- ---
-- Table 'Reclamo'
-- 
-- ---

DROP TABLE IF EXISTS `Reclamo`;
		
CREATE TABLE `Reclamo` (
  `ID` INTEGER AUTO_INCREMENT,
  `fecha` DATE DEFAULT NULL,
  `descripcion` VARCHAR(255) DEFAULT NULL,
  `DNI_Empleado` INTEGER DEFAULT NULL,
  `DNI_Cliente` INTEGER DEFAULT NULL,
  `ID_Sucursal` INTEGER DEFAULT NULL,
  PRIMARY KEY (`ID`)
);

-- ---
-- Table 'Pedido'
-- 
-- ---

DROP TABLE IF EXISTS `Pedido`;
		
CREATE TABLE `Pedido` (
  `ID` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `hora` TIME NULL DEFAULT NULL,
  `fecha` DATE NULL DEFAULT NULL,
  `DNI_Empleado` INTEGER NULL DEFAULT NULL,
  `ID_Mesa` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`ID`)
);

-- ---
-- Table 'Horarios'
-- 
-- ---

DROP TABLE IF EXISTS `Horarios`;

CREATE TABLE `Horarios` (
  `ID` INTEGER AUTO_INCREMENT,
  `turno` VARCHAR (180) DEFAULT NULL,
  `hora_inicio` TIME DEFAULT NULL,
  `hora_fin` TIME DEFAULT NULL,
  PRIMARY KEY (`ID`)
);

-- ---
-- Table 'Plato'
-- 
-- ---

DROP TABLE IF EXISTS `Plato`;
		
CREATE TABLE `Plato` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(255) DEFAULT NULL,
  `descripcion` VARCHAR(255) DEFAULT NULL,
  `tipo` VARCHAR(255) DEFAULT NULL,
  `precio` INT DEFAULT NULL,
  PRIMARY KEY (`ID`)
);

-- ---
-- Table 'Promocion'
-- 
-- ---

DROP TABLE IF EXISTS `Promocion`;
		
CREATE TABLE `Promocion` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(255) DEFAULT NULL,
  `descuento` INT DEFAULT NULL,
  `ID_Sucursal` INT DEFAULT NULL,
  PRIMARY KEY (`ID`)
);

-- ---
-- Table 'Caja'
-- 
-- ---

DROP TABLE IF EXISTS `Caja`;
		
CREATE TABLE `Caja` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Ganancias` INT DEFAULT NULL,
  `ID_Sucursal` INT DEFAULT NULL,
  PRIMARY KEY (`ID`, `ID_Sucursal`)
);

-- ---
-- Table 'Evento'
-- 
-- ---

DROP TABLE IF EXISTS `Evento`;
		
CREATE TABLE `Evento` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(255) DEFAULT NULL,
  `fecha` DATE DEFAULT NULL,
  `lugar` VARCHAR(255) DEFAULT NULL,
  `descripcion` VARCHAR(1024) DEFAULT NULL,
  `ID_Sucursal` INT DEFAULT NULL,
  PRIMARY KEY (`ID`)
);

-- ---
-- Table 'Ingrediente'
-- 
-- ---

DROP TABLE IF EXISTS `Ingrediente`;
		
CREATE TABLE `Ingrediente` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(255) DEFAULT NULL,
  `Tipo` VARCHAR(50) DEFAULT NULL,
  `costo` INT DEFAULT NULL,
  PRIMARY KEY (`ID`)
);

-- ---
-- Table 'Proveedor'
-- 
-- ---

DROP TABLE IF EXISTS `Proveedor`;
		
CREATE TABLE `Proveedor` (
  `RUC` VARCHAR(20) NOT NULL,
  `nombre` VARCHAR(255) DEFAULT NULL,
  `direccion` VARCHAR(255) DEFAULT NULL,
  PRIMARY KEY (`RUC`)
);

-- ---
-- Table 'Inventario'
-- 
-- ---

DROP TABLE IF EXISTS `Inventario`;
		
CREATE TABLE `Inventario` (
  `ID` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `Cantidad` INTEGER NULL DEFAULT NULL,
  `ID_Ingrediente` INTEGER NULL DEFAULT NULL,
  `ID_Sucursal` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`ID`, `ID_Ingrediente`)
);

-- ---
-- Table 'Telefonos_empleado'
-- 
-- ---

DROP TABLE IF EXISTS `Telefonos_empleado`;
		
CREATE TABLE `Telefonos_empleado` (
  `telefono_empleado` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `DNI_Empleado` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`telefono_empleado`, `DNI_Empleado`)
);

-- ---
-- Table 'telefonos_proveedores'
-- 
-- ---

DROP TABLE IF EXISTS `telefonos_proveedores`;
		
CREATE TABLE `telefonos_proveedores` (
  `telefono_proveedor` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `RUC_Proveedor` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`telefono_proveedor`, `RUC_Proveedor`)
);

-- ---
-- Table 'telefonos_cliente'
-- 
-- ---

DROP TABLE IF EXISTS `telefonos_cliente`;
		
CREATE TABLE `telefonos_cliente` (
  `telefono_cliente` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `DNI_Cliente` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`telefono_cliente`, `DNI_Cliente`)
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
-- Table 'pedido_plato'
-- 
-- ---

DROP TABLE IF EXISTS `pedido_plato`;
		
CREATE TABLE `pedido_plato` (
  `ID_Pedido` INTEGER NULL DEFAULT NULL,
  `ID_Plato` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`ID_Pedido`, `ID_Plato`)
);

-- ---
-- Table 'proveedor_ingrediente'
-- 
-- ---

DROP TABLE IF EXISTS `proveedor_ingrediente`;
		
CREATE TABLE `proveedor_ingrediente` (
  `ID_Ingrediente` INTEGER NULL DEFAULT NULL,
  `RUC_Proveedor` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`ID_Ingrediente`, `RUC_Proveedor`)
);

-- ---
-- Table 'plato_ingrediente'
-- 
-- ---

DROP TABLE IF EXISTS `plato_ingrediente`;
		
CREATE TABLE `plato_ingrediente` (
  `ID_Plato` INTEGER NULL DEFAULT NULL,
  `ID_Ingrediente` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`ID_Plato`, `ID_Ingrediente`)
);

-- ---
-- Table 'promocion_plato'
-- 
-- ---

DROP TABLE IF EXISTS `promocion_plato`;
		
CREATE TABLE `promocion_plato` (
  `ID_Promocion` INTEGER NULL DEFAULT NULL,
  `ID_Plato` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`ID_Promocion`, `ID_Plato`)
);

-- ---
-- Foreign Keys 
-- ---

ALTER TABLE `Empleado` ADD FOREIGN KEY (ID_Sucursal) REFERENCES `Sucursal` (`ID`);
ALTER TABLE `Empleado` ADD FOREIGN KEY (ID_Caja) REFERENCES `Caja` (`ID`);
ALTER TABLE `Empleado` ADD FOREIGN KEY (ID_Horarios) REFERENCES `Horarios` (`ID`);
ALTER TABLE `Mesa` ADD FOREIGN KEY (DNI_Empleado) REFERENCES `Empleado` (`DNI`);
ALTER TABLE `Mesa` ADD FOREIGN KEY (ID_Reserva) REFERENCES `Reserva` (`ID`);
ALTER TABLE `Mesa` ADD FOREIGN KEY (ID_Sucursal) REFERENCES `Sucursal` (`ID`);
ALTER TABLE `Reserva` ADD FOREIGN KEY (DNI_Cliente) REFERENCES `Cliente` (`DNI`);
ALTER TABLE `Reserva` ADD FOREIGN KEY (ID_Sucursal) REFERENCES `Sucursal` (`ID`);
ALTER TABLE `encuesta_satisfaccion` ADD FOREIGN KEY (DNI_Cliente) REFERENCES `Cliente` (`DNI`);
ALTER TABLE `encuesta_satisfaccion` ADD FOREIGN KEY (ID_Sucursal) REFERENCES `Sucursal` (`ID`);
ALTER TABLE `Factura` ADD FOREIGN KEY (DNI_Cliente) REFERENCES `Cliente` (`DNI`);
ALTER TABLE `Factura` ADD FOREIGN KEY (ID_Mesa) REFERENCES `Mesa` (`ID`);
ALTER TABLE `Factura` ADD FOREIGN KEY (ID_Sucursal) REFERENCES `Sucursal` (`ID`);
ALTER TABLE `Reclamo` ADD FOREIGN KEY (DNI_Empleado) REFERENCES `Empleado` (`DNI`);
ALTER TABLE `Reclamo` ADD FOREIGN KEY (DNI_Cliente) REFERENCES `Cliente` (`DNI`);
ALTER TABLE `Reclamo` ADD FOREIGN KEY (ID_Sucursal) REFERENCES `Sucursal` (`ID`);
ALTER TABLE `Pedido` ADD FOREIGN KEY (DNI_Empleado) REFERENCES `Empleado` (`DNI`);
ALTER TABLE `Pedido` ADD FOREIGN KEY (ID_Mesa) REFERENCES `Mesa` (`ID`);
ALTER TABLE `Promocion` ADD FOREIGN KEY (ID_Sucursal) REFERENCES `Sucursal` (`ID`);
ALTER TABLE `Caja` ADD FOREIGN KEY (ID_Sucursal) REFERENCES `Sucursal` (`ID`);
ALTER TABLE `Evento` ADD FOREIGN KEY (ID_Sucursal) REFERENCES `Sucursal` (`ID`);
ALTER TABLE `Inventario` ADD FOREIGN KEY (ID_Ingrediente) REFERENCES `Ingrediente` (`ID`);
ALTER TABLE `Inventario` ADD FOREIGN KEY (ID_Sucursal) REFERENCES `Sucursal` (`ID`);
ALTER TABLE `Telefonos_empleado` ADD FOREIGN KEY (DNI_Empleado) REFERENCES `Empleado` (`DNI`);
ALTER TABLE `telefonos_proveedores` ADD FOREIGN KEY (RUC_Proveedor) REFERENCES `Proveedor` (`RUC`);
ALTER TABLE `telefonos_cliente` ADD FOREIGN KEY (DNI_Cliente) REFERENCES `Cliente` (`DNI`);
ALTER TABLE `evento_plato` ADD FOREIGN KEY (ID_Evento) REFERENCES `Evento` (`ID`);
ALTER TABLE `evento_plato` ADD FOREIGN KEY (ID_Plato) REFERENCES `Plato` (`ID`);
ALTER TABLE `pedido_plato` ADD FOREIGN KEY (ID_Pedido) REFERENCES `Pedido` (`ID`);
ALTER TABLE `pedido_plato` ADD FOREIGN KEY (ID_Plato) REFERENCES `Plato` (`ID`);
ALTER TABLE `proveedor_ingrediente` ADD FOREIGN KEY (ID_Ingrediente) REFERENCES `Ingrediente` (`ID`);
ALTER TABLE `proveedor_ingrediente` ADD FOREIGN KEY (RUC_Proveedor) REFERENCES `Proveedor` (`RUC`);
ALTER TABLE `plato_ingrediente` ADD FOREIGN KEY (ID_Plato) REFERENCES `Plato` (`ID`);
ALTER TABLE `plato_ingrediente` ADD FOREIGN KEY (ID_Ingrediente) REFERENCES `Ingrediente` (`ID`);
ALTER TABLE `promocion_plato` ADD FOREIGN KEY (ID_Promocion) REFERENCES `Promocion` (`ID`);
ALTER TABLE `promocion_plato` ADD FOREIGN KEY (ID_Plato) REFERENCES `Plato` (`ID`);

-- ---
-- Table Properties
-- ---

-- ALTER TABLE `Sucursal` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Empleado` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Mesa` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Reserva` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Cliente` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `encuesta_satisfaccion` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Factura` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Reclamo` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Pedido` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Horarios` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Plato` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Promocion` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Caja` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Evento` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Ingrediente` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Proveedor` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Inventario` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Telefonos_empleado` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `telefonos_proveedores` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `telefonos_cliente` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `evento_plato` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `pedido_plato` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `proveedor_ingrediente` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `plato_ingrediente` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `promocion_plato` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ---
-- Test Data
-- ---

-- INSERT INTO `Sucursal` (`ID`,`direccion`,`telefono`) VALUES
-- ('','','');
-- INSERT INTO `Empleado` (`DNI`,`nombre`,`apellido`,`puesto`,`contrasenia`,`salario`,`ID_Sucursal`,`ID_Caja`,`new field`,`ID_Horarios`) VALUES
-- ('','','','','','','','','','');
-- INSERT INTO `Mesa` (`ID`,`n_mesa`,`capacidad`,`ubicacion`,`DNI_Empleado`,`ID_Reserva`,`ID_Sucursal`) VALUES
-- ('','','','','','','');
-- INSERT INTO `Reserva` (`ID`,`fecha`,`n_personas`,`hora`,`DNI_Cliente`,`ID_Sucursal`) VALUES
-- ('','','','','','');
-- INSERT INTO `Cliente` (`DNI`,`nombre`,`apellido`,`domicilio`) VALUES
-- ('','','','');
-- INSERT INTO `encuesta_satisfaccion` (`ID`,`fecha`,`preg_resp`,`fecha`,`comentarios`,`DNI_Cliente`,`ID_Sucursal`) VALUES
-- ('','','','','','','');
-- INSERT INTO `Factura` (`ID`,`fecha`,`monto`,`propina`,`metodo_de_pago`,`DNI_Cliente`,`ID_Mesa`,`ID_Sucursal`) VALUES
-- ('','','','','','','','');
-- INSERT INTO `Reclamo` (`ID`,`fecha`,`descripcion`,`DNI_Empleado`,`DNI_Cliente`,`ID_Sucursal`) VALUES
-- ('','','','','','');
-- INSERT INTO `Pedido` (`ID`,`hora`,`fecha`,`DNI_Empleado`,`ID_Mesa`) VALUES
-- ('','','','','');
-- INSERT INTO `Horarios` (`ID`,`turno`,`hora_inicio`,`hora_fin`) VALUES
-- ('','','','');
-- INSERT INTO `Plato` (`ID`,`nombre`,`descripcion`,`tipo`,`precio`) VALUES
-- ('','','','','');
-- INSERT INTO `Promocion` (`ID`,`descripcion`,`descuento`,`ID_Sucursal`) VALUES
-- ('','','','');
-- INSERT INTO `Caja` (`ID`,`Ganancias`,`ID_Sucursal`) VALUES
-- ('','','');
-- INSERT INTO `Evento` (`ID`,`nombre`,`fecha`,`lugar`,`descripcion`,`ID_Sucursal`) VALUES
-- ('','','','','','');
-- INSERT INTO `Ingrediente` (`ID`,`nombre`,`Tipo`,`costo`) VALUES
-- ('','','','');
-- INSERT INTO `Proveedor` (`RUC`,`nombre`,`direccion`) VALUES
-- ('','','');
-- INSERT INTO `Inventario` (`ID`,`Cantidad`,`ID_Ingrediente`,`ID_Sucursal`) VALUES
-- ('','','','');
-- INSERT INTO `Telefonos_empleado` (`telefono_empleado`,`DNI_Empleado`) VALUES
-- ('','');
-- INSERT INTO `telefonos_proveedores` (`telefono_proveedor`,`RUC_Proveedor`) VALUES
-- ('','');
-- INSERT INTO `telefonos_cliente` (`telefono_cliente`,`DNI_Cliente`) VALUES
-- ('','');
-- INSERT INTO `evento_plato` (`ID_Evento`,`ID_Plato`) VALUES
-- ('','');
-- INSERT INTO `pedido_plato` (`ID_Pedido`,`ID_Plato`) VALUES
-- ('','');
-- INSERT INTO `proveedor_ingrediente` (`ID_Ingrediente`,`RUC_Proveedor`) VALUES
-- ('','');
-- INSERT INTO `plato_ingrediente` (`ID_Plato`,`ID_Ingrediente`) VALUES
-- ('','');
-- INSERT INTO `promocion_plato` (`ID_Promocion`,`ID_Plato`) VALUES
-- ('','');
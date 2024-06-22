-- ---
-- Globals
-- ---

-- SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
-- SET FOREIGN_KEY_CHECKS=0;

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
  `ID_Caja` INTEGER NULL DEFAULT NULL,
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
  PRIMARY KEY (`ID`)
);

-- ---
-- Table 'Caja'
-- 
-- ---

DROP TABLE IF EXISTS `Caja`;

CREATE TABLE `Caja` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `fecha_apertura` DATE DEFAULT NULL,
  `fecha_cierre` DATE DEFAULT NULL,
  `saldo_inicial` INT DEFAULT NULL,
  `saldo_final` INT DEFAULT NULL,
  `total_ingresos` INT DEFAULT NULL,
  `total_egresos` INT DEFAULT NULL,
  PRIMARY KEY (`ID`)
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
-- Foreign Keys 
-- ---

ALTER TABLE `Empleado`
  ADD CONSTRAINT `fk_Empleado_Horarios1`
  FOREIGN KEY (`ID_Horarios`)
  REFERENCES `Horarios` (`ID`);

ALTER TABLE `Mesa`
  ADD CONSTRAINT `fk_Mesa_Empleado1`
  FOREIGN KEY (`DNI_Empleado`)
  REFERENCES `Empleado` (`DNI`);

ALTER TABLE `Mesa`
  ADD CONSTRAINT `fk_Mesa_Reserva1`
  FOREIGN KEY (`ID_Reserva`)
  REFERENCES `Reserva` (`ID`);

ALTER TABLE `Reserva`
  ADD CONSTRAINT `fk_Reserva_Cliente1`
  FOREIGN KEY (`DNI_Cliente`)
  REFERENCES `Cliente` (`DNI`);

ALTER TABLE `encuesta_satisfaccion`
  ADD CONSTRAINT `fk_encuesta_satisfaccion_Cliente1`
  FOREIGN KEY (`DNI_Cliente`)
  REFERENCES `Cliente` (`DNI`);

ALTER TABLE `Factura`
  ADD CONSTRAINT `fk_Factura_Cliente1`
  FOREIGN KEY (`DNI_Cliente`)
  REFERENCES `Cliente` (`DNI`);

ALTER TABLE `Factura`
  ADD CONSTRAINT `fk_Factura_Mesa1`
  FOREIGN KEY (`ID_Mesa`)
  REFERENCES `Mesa` (`ID`);

ALTER TABLE `Factura`
  ADD CONSTRAINT `fk_Factura_Caja1`
  FOREIGN KEY (`ID_Caja`)
  REFERENCES `Caja` (`ID`);

ALTER TABLE `Reclamo`
  ADD CONSTRAINT `fk_Reclamo_Empleado1`
  FOREIGN KEY (`DNI_Empleado`)
  REFERENCES `Empleado` (`DNI`);

ALTER TABLE `Reclamo`
  ADD CONSTRAINT `fk_Reclamo_Cliente1`
  FOREIGN KEY (`DNI_Cliente`)
  REFERENCES `Cliente` (`DNI`);

ALTER TABLE `Pedido`
  ADD CONSTRAINT `fk_Pedido_Empleado1`
  FOREIGN KEY (`DNI_Empleado`)
  REFERENCES `Empleado` (`DNI`);

ALTER TABLE `Pedido`
  ADD CONSTRAINT `fk_Pedido_Mesa1`
  FOREIGN KEY (`ID_Mesa`)
  REFERENCES `Mesa` (`ID`);

ALTER TABLE `Inventario`
  ADD CONSTRAINT `fk_Inventario_Ingrediente1`
  FOREIGN KEY (`ID_Ingrediente`)
  REFERENCES `Ingrediente` (`ID`);

ALTER TABLE `Telefonos_empleado`
  ADD CONSTRAINT `fk_Telefonos_empleado_Empleado1`
  FOREIGN KEY (`DNI_Empleado`)
  REFERENCES `Empleado` (`DNI`);

ALTER TABLE `telefonos_proveedores`
  ADD CONSTRAINT `fk_telefonos_proveedores_Proveedor1`
  FOREIGN KEY (`RUC_Proveedor`)
  REFERENCES `Proveedor` (`RUC`);

ALTER TABLE `telefonos_cliente`
  ADD CONSTRAINT `fk_telefonos_cliente_Cliente1`
  FOREIGN KEY (`DNI_Cliente`)
  REFERENCES `Cliente` (`DNI`);

ALTER TABLE `evento_plato`
  ADD CONSTRAINT `fk_evento_plato_Evento1`
  FOREIGN KEY (`ID_Evento`)
  REFERENCES `Evento` (`ID`);

ALTER TABLE `evento_plato`
  ADD CONSTRAINT `fk_evento_plato_Plato1`
  FOREIGN KEY (`ID_Plato`)
  REFERENCES `Plato` (`ID`);

ALTER TABLE `pedido_plato`
  ADD CONSTRAINT `fk_pedido_plato_Pedido1`
  FOREIGN KEY (`ID_Pedido`)
  REFERENCES `Pedido` (`ID`);

ALTER TABLE `pedido_plato`
  ADD CONSTRAINT `fk_pedido_plato_Plato1`
  FOREIGN KEY (`ID_Plato`)
  REFERENCES `Plato` (`ID`);

ALTER TABLE `proveedor_ingrediente`
  ADD CONSTRAINT `fk_proveedor_ingrediente_Ingrediente1`
  FOREIGN KEY (`ID_Ingrediente`)
  REFERENCES `Ingrediente` (`ID`);

ALTER TABLE `proveedor_ingrediente`
  ADD CONSTRAINT `fk_proveedor_ingrediente_Proveedor1`
  FOREIGN KEY (`RUC_Proveedor`)
  REFERENCES `Proveedor` (`RUC`);

ALTER TABLE `plato_ingrediente`
  ADD CONSTRAINT `fk_plato_ingrediente_Plato1`
  FOREIGN KEY (`ID_Plato`)
  REFERENCES `Plato` (`ID`);

ALTER TABLE `plato_ingrediente`
  ADD CONSTRAINT `fk_plato_ingrediente_Ingrediente1`
  FOREIGN KEY (`ID_Ingrediente`)
  REFERENCES `Ingrediente` (`ID`);

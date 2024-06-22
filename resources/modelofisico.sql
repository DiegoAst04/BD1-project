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
  `RUC` INT NOT NULL AUTO_INCREMENT,
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

-- Modificación de la tabla Factura para incluir ID_Promocion
ALTER TABLE Factura ADD COLUMN ID_Promocion INT DEFAULT NULL;

-- Inserts para la tabla Caja
INSERT INTO Caja (ID, fecha_apertura, fecha_cierre, saldo_inicial, saldo_final, total_ingresos, total_egresos) VALUES
(1, '2024-01-01', '2024-01-01', 1000, 1500, 500, 0),
(2, '2024-01-01', '2024-01-01', 1000, 2000, 1000, 0),
(3, '2024-01-01', '2024-01-01', 1000, 1800, 800, 0);

-- Inserts para la tabla Horarios
INSERT INTO Horarios (ID, turno, hora_inicio, hora_fin) VALUES
(1, 'Mañana', '08:00:00', '16:00:00'),
(2, 'Tarde', '16:00:00', '00:00:00'),
(3, 'Noche', '00:00:00', '08:00:00');

-- Inserts para la tabla Empleado
INSERT INTO Empleado (DNI, nombre, apellido, puesto, contrasenia, salario, ID_Caja, ID_Horarios) VALUES
(1, 'Juan', 'Pérez', 'Cajero', 'password1', 30000, 1, 1),
(2, 'María', 'López', 'Cajero', 'password2', 30000, 2, 2),
(3, 'Carlos', 'García', 'Cajero', 'password3', 30000, 3, 3),
(4, 'Ana', 'Martínez', 'Mozo', 'password4', 25000, NULL, 1),
(5, 'Luis', 'Hernández', 'Mozo', 'password5', 25000, NULL, 2),
(6, 'Julia', 'Mendoza', 'Cajero', 'password6', 30000, 1, 1),
(7, 'Ricardo', 'Díaz', 'Cajero', 'password7', 30000, 2, 2),
(8, 'Sofía', 'Romero', 'Mozo', 'password8', 25000, NULL, 3),
(9, 'David', 'Silva', 'Mozo', 'password9', 25000, NULL, 1),
(10, 'Miguel', 'Fernández', 'Cajero', 'password10', 30000, 3, 3);

-- Inserts para la tabla Cliente
INSERT INTO Cliente (DNI, nombre, apellido, domicilio) VALUES
(1, 'Pedro', 'González', 'Calle Falsa 123'),
(2, 'Laura', 'Díaz', 'Avenida Siempre Viva 742'),
(3, 'Lucía', 'Fernández', 'Calle Principal 456'),
(4, 'Martín', 'Rodríguez', 'Plaza Mayor 789'),
(5, 'Santiago', 'Sánchez', 'Calle del Sol 101'),
(6, 'Valentina', 'Castro', 'Avenida del Parque 202'),
(7, 'Mariana', 'Ruiz', 'Boulevard de los Sueños 303'),
(8, 'Gustavo', 'Ortega', 'Callejón de las Flores 404'),
(9, 'Alejandra', 'Vega', 'Ruta del Vino 505'),
(10, 'Pablo', 'Cabrera', 'Camino Real 606');

-- Inserts para la tabla Mesa
INSERT INTO Mesa (ID, n_mesa, capacidad, ubicacion, DNI_Empleado, ID_Reserva) VALUES
(1, 1, 4, 'Terraza', 4, NULL),
(2, 2, 2, 'Interior', 5, NULL),
(3, 3, 6, 'Patio', 4, NULL),
(4, 4, 4, 'Terraza', 9, NULL),
(5, 5, 2, 'Interior', 5, NULL),
(6, 6, 6, 'Patio', 8, NULL),
(7, 7, 4, 'Terraza', 4, NULL),
(8, 8, 2, 'Interior', 5, NULL),
(9, 9, 6, 'Patio', 8, NULL),
(10, 10, 4, 'Terraza', 4, NULL);

-- Inserts para la tabla Plato
INSERT INTO Plato (ID, nombre, descripcion, tipo, precio) VALUES
(1, 'Coca-Cola', 'Bebida refrescante', 'Bebida', 10),
(2, 'Mojito', 'Coctel de ron', 'Coctel', 15),
(3, 'Hamburguesa', 'Hamburguesa con queso', 'Plato Principal', 50),
(4, 'Ensalada César', 'Ensalada con pollo', 'Entrante', 30),
(5, 'Helado', 'Helado de vainilla', 'Postre', 20),
(6, 'Pizza', 'Pizza de pepperoni', 'Plato Principal', 40),
(7, 'Sopa de Tomate', 'Sopa caliente', 'Entrante', 15),
(8, 'Tiramisu', 'Postre italiano', 'Postre', 25),
(9, 'Agua Mineral', 'Bebida sin gas', 'Bebida', 5),
(10, 'Limonada', 'Bebida refrescante', 'Bebida', 8);

-- Inserts para la tabla Pedido
INSERT INTO Pedido (ID, hora, fecha, DNI_Empleado, ID_Mesa) VALUES
(1, '12:00:00', '2024-06-20', 4, 1),
(2, '12:05:00', '2024-06-20', 4, 1),
(3, '12:10:00', '2024-06-20', 4, 1),
(4, '12:00:00', '2024-06-20', 5, 2),
(5, '12:05:00', '2024-06-20', 5, 2),
(6, '12:10:00', '2024-06-20', 5, 2),
(7, '12:00:00', '2024-06-20', 4, 3),
(8, '12:05:00', '2024-06-20', 4, 3),
(9, '12:10:00', '2024-06-20', 4, 3),
(10, '13:00:00', '2024-06-21', 9, 4),
(11, '13:05:00', '2024-06-21', 9, 4),
(12, '13:10:00', '2024-06-21', 9, 4),
(13, '13:00:00', '2024-06-21', 5, 5),
(14, '13:05:00', '2024-06-21', 5, 5),
(15, '13:10:00', '2024-06-21', 5, 5),
(16, '13:00:00', '2024-06-21', 8, 6),
(17, '13:05:00', '2024-06-21', 8, 6),
(18, '13:10:00', '2024-06-21', 8, 6),
(19, '13:00:00', '2024-06-21', 4, 7),
(20, '13:05:00', '2024-06-21', 4, 7);

-- Inserts para la tabla Factura
INSERT INTO Factura (ID, fecha, monto, propina, metodo_de_pago, DNI_Cliente, ID_Mesa, ID_Caja, ID_Promocion) VALUES
(1, '2024-06-20', 75, 10, 1, 1, 1, 1, 1),
(2, '2024-06-20', 90, 15, 1, 2, 2, 2, 2),
(3, '2024-06-20', 75, 10, 1, 3, 3, 3, NULL),
(4, '2024-06-21', 120, 20, 1, 4, 4, 1, 3),
(5, '2024-06-21', 90, 15, 1, 5, 5, 2, 4),
(6, '2024-06-21', 120, 20, 1, 6, 6, 3, NULL),
(7, '2024-06-21', 75, 10, 1, 7, 7, 1, 5),
(8, '2024-06-21', 90, 15, 1, 8, 8, 2, 1),
(9, '2024-06-21', 120, 20, 1, 9, 9, 3, 2),
(10, '2024-06-21', 75, 10, 1, 10, 10, 1, 3);

-- Inserts para la tabla Reclamo
INSERT INTO Reclamo (ID, fecha, descripcion, DNI_Empleado, DNI_Cliente) VALUES
(1, '2024-06-20', 'Comida fría', 4, 1),
(2, '2024-06-20', 'Servicio lento', 5, 2),
(3, '2024-06-21', 'Plato incorrecto', 4, 3),
(4, '2024-06-21', 'Bebida derramada', 9, 4),
(5, '2024-06-21', 'Tiempo de espera', 5, 5);

-- Inserts para la tabla Encuesta_Satisfaccion
INSERT INTO encuesta_satisfaccion (ID, fecha, preg_resp, comentarios, DNI_Cliente) VALUES
(1, '2024-06-20', 5, 'Muy bueno', 1),
(2, '2024-06-20', 4, 'Bueno', 2),
(3, '2024-06-20', 3, 'Regular', 3),
(4, '2024-06-21', 5, 'Excelente', 4),
(5, '2024-06-21', 4, 'Muy bueno', 5),
(6, '2024-06-21', 3, 'Satisfactorio', 6),
(7, '2024-06-21', 2, 'Mejorable', 7),
(8, '2024-06-21', 5, 'Perfecto', 8),
(9, '2024-06-21', 4, 'Muy bueno', 9),
(10, '2024-06-21', 5, 'Excelente', 10);

-- Inserts adicionales para completar la base de datos

-- Inserts para la tabla Reserva
INSERT INTO Reserva (ID, fecha, n_personas, hora, DNI_Cliente) VALUES
(1, '2024-06-20', 4, '19:00:00', 1),
(2, '2024-06-20', 2, '20:00:00', 2),
(3, '2024-06-20', 6, '21:00:00', 3),
(4, '2024-06-21', 4, '19:00:00', 4),
(5, '2024-06-21', 2, '20:00:00', 5),
(6, '2024-06-21', 6, '21:00:00', 6),
(7, '2024-06-22', 4, '19:00:00', 7),
(8, '2024-06-22', 2, '20:00:00', 8),
(9, '2024-06-22', 6, '21:00:00', 9),
(10, '2024-06-23', 4, '19:00:00', 10);

-- Inserts para la tabla Promocion
INSERT INTO Promocion (ID, descripcion, descuento) VALUES
(1, 'Descuento de verano', 10),
(2, '2x1 en bebidas', 50),
(3, 'Descuento de fidelidad', 15),
(4, 'Descuento de cumpleaños', 20),
(5, 'Descuento de primera visita', 5);

-- Inserts para la tabla Proveedor
INSERT INTO Proveedor (ID, nombre, direccion, telefono) VALUES
(1, 'Proveedor de Bebidas', 'Calle de las Bebidas 123', '123456789'),
(2, 'Proveedor de Carnes', 'Avenida de las Carnes 456', '987654321'),
(3, 'Proveedor de Verduras', 'Calle de las Verduras 789', '111222333'),
(4, 'Proveedor de Lácteos', 'Avenida de los Lácteos 101', '444555666'),
(5, 'Proveedor de Postres', 'Boulevard de los Postres 202', '777888999');

-- Inserts para la tabla Ingrediente
INSERT INTO Ingrediente (ID, nombre, ID_Proveedor) VALUES
(1, 'Coca-Cola', 1),
(2, 'Ron', 1),
(3, 'Carne de Res', 2),
(4, 'Queso', 4),
(5, 'Pollo', 2),
(6, 'Verduras Mixtas', 3),
(7, 'Pepperoni', 2),
(8, 'Vainilla', 5),
(9, 'Tomate', 3),
(10, 'Limón', 3);

-- Inserts para la tabla Plato_Ingrediente
INSERT INTO Plato_Ingrediente (ID_Plato, ID_Ingrediente) VALUES
(1, 1),  -- Coca-Cola
(2, 2),  -- Mojito: Ron
(3, 3),  -- Hamburguesa: Carne de Res
(3, 4),  -- Hamburguesa: Queso
(4, 5),  -- Ensalada César: Pollo
(4, 6),  -- Ensalada César: Verduras Mixtas
(6, 7),  -- Pizza: Pepperoni
(6, 4),  -- Pizza: Queso
(5, 8),  -- Helado: Vainilla
(7, 9),  -- Sopa de Tomate: Tomate
(8, 8),  -- Tiramisu: Vainilla
(9, 10), -- Agua Mineral: Limón
(10, 10);-- Limonada: Limón

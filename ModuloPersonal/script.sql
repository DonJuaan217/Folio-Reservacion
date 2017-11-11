-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema hotelfase2
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema hotelfase2
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `hotelfase2` DEFAULT CHARACTER SET latin1 ;
USE `hotelfase2` ;

-- -----------------------------------------------------
-- Table `hotelfase2`.`empleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelfase2`.`empleado` (
  `idEmpleado` INT(11) NOT NULL AUTO_INCREMENT,
  `dpi` VARCHAR(50) NULL DEFAULT NULL,
  `nit` VARCHAR(50) NULL DEFAULT NULL,
  `primerNombre` VARCHAR(50) NULL DEFAULT NULL,
  `segundoNombre` VARCHAR(50) NULL DEFAULT NULL,
  `apellidoPaterno` VARCHAR(50) NULL DEFAULT NULL,
  `apellidoMaterno` VARCHAR(50) NULL DEFAULT NULL,
  `edad` INT(11) NULL DEFAULT NULL,
  `email` VARCHAR(50) NULL DEFAULT NULL,
  `contactoEmergencia` VARCHAR(50) NULL DEFAULT NULL,
  `telefono` VARCHAR(50) NULL DEFAULT NULL,
  `direccionDomicilio` VARCHAR(50) NULL DEFAULT NULL,
  `fechaCreacionEmpleado` VARCHAR(50) NULL DEFAULT NULL,
  `nivelAcedemico` VARCHAR(50) NULL DEFAULT NULL,
  `noCuenta` INT(11) NULL DEFAULT NULL,
  `cuentabanco_idBanco` INT(11) NOT NULL,
  PRIMARY KEY (`idEmpleado`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `hotelfase2`.`horario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelfase2`.`horario` (
  `idHorario` INT(11) NOT NULL AUTO_INCREMENT,
  `horaEntrada` DATETIME NOT NULL,
  `horaSalida` DATETIME NOT NULL,
  `diasDescanso` INT NOT NULL,
  PRIMARY KEY (`idHorario`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `hotelfase2`.`departamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelfase2`.`departamento` (
  `idDepartamento` INT(11) NOT NULL AUTO_INCREMENT,
  `nombreDepartamento` VARCHAR(55) NOT NULL,
  `jefeDepartamento` VARCHAR(55) NOT NULL,
  PRIMARY KEY (`idDepartamento`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `hotelfase2`.`puesto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelfase2`.`puesto` (
  `idPuesto` INT(11) NOT NULL AUTO_INCREMENT,
  `nombrePuesto` VARCHAR(55) NOT NULL,
  `idDepartamento` INT(11) NOT NULL,
  `departamentoIdDepartamento` INT(11) NOT NULL,
  PRIMARY KEY (`idPuesto`),
  INDEX `fk_puesto_departamento1_idx` (`departamentoIdDepartamento` ASC))
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `hotelfase2`.`contrato`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelfase2`.`contrato` (
  `idContrato` INT(10) NOT NULL AUTO_INCREMENT,
  `fechaCreacionContrato` VARCHAR(50) NULL DEFAULT NULL,
  `estadoCivil` VARCHAR(45) NULL DEFAULT NULL,
  `lugar` VARCHAR(45) NULL DEFAULT NULL,
  `inicioRelacionTrabajo` VARCHAR(50) NULL DEFAULT NULL,
  `duracionContrato` VARCHAR(45) NULL DEFAULT NULL,
  `serviciosTrabajador` VARCHAR(50) NULL DEFAULT NULL,
  `jornadaTrabajador` VARCHAR(45) NULL DEFAULT NULL,
  `clausulasContrato` VARCHAR(50) NULL DEFAULT NULL,
  `nombreEmpleador` VARCHAR(45) NULL DEFAULT NULL,
  `horasLaboralesDiarias` INT(11) NULL DEFAULT NULL,
  `sueldoBase` DECIMAL(9,2) NULL DEFAULT NULL,
  `empleado_idEmpleado` INT(11) NOT NULL,
  `horario_idHorario` INT(11) NOT NULL,
  `puesto_idPuesto` INT(11) NOT NULL,
  PRIMARY KEY (`idContrato`),
  INDEX `fk_contrato_empleado1_idx` (`empleado_idEmpleado` ASC),
  INDEX `fk_contrato_horario1_idx` (`horario_idHorario` ASC),
  INDEX `fk_contrato_puesto1_idx` (`puesto_idPuesto` ASC))
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `hotelfase2`.`aguinaldo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelfase2`.`aguinaldo` (
  `idAguinaldo` INT(11) NOT NULL AUTO_INCREMENT,
  `fecha_aguinaldo_pago` DATETIME NOT NULL,
  `valorPercepcion` FLOAT NOT NULL,
  `estadoPago` INT(11) NOT NULL,
  `contrato_idContrato` INT(10) NOT NULL,
  PRIMARY KEY (`idAguinaldo`),
  INDEX `fk_aguinaldo_contrato1_idx` (`contrato_idContrato` ASC))
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `hotelfase2`.`vendedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelfase2`.`vendedor` (
  `idVendedor` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `telefono` VARCHAR(45) NULL,
  `direccion` VARCHAR(45) NULL,
  PRIMARY KEY (`idVendedor`))
ENGINE = InnoDB;
insert into vendedor values(1,"Antonio","Rosales","789","6ta");
insert into vendedor values(2,"Feliks","Zembdegs","987","3ra");


-- -----------------------------------------------------
-- Table `hotelfase2`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelfase2`.`cliente` (
  `idCliente` INT(11) NOT NULL AUTO_INCREMENT,
  `nitCliente` INT(11) NOT NULL,
  `nombreCliente` VARCHAR(50) NOT NULL,
  `apellidoCliente` VARCHAR(50) NOT NULL,
  `direccionCliente` VARCHAR(45) NOT NULL,
  `ciudadCliente` VARCHAR(45) NOT NULL,
  `paisCliente` VARCHAR(45) NOT NULL,
  `telefonoCliente` INT(15) NOT NULL,
  `correoCliente` VARCHAR(45) NULL DEFAULT NULL,
  `vendedor_idVendedor` INT NOT NULL,
  PRIMARY KEY (`idCliente`),
  INDEX `fk_cliente_vendedor1_idx` (`vendedor_idVendedor` ASC),
  CONSTRAINT `fk_cliente_vendedor1`
    FOREIGN KEY (`vendedor_idVendedor`)
    REFERENCES `hotelfase2`.`vendedor` (`idVendedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

insert into cliente values(0,000,"Consumidor final","Consumidor final","0 avenida","Guatemala","Guatemala",000,"Consumidor final",1);
insert into cliente values(1,111,"Carlo Andres","Reyes Villacorta","4ta avenida","Guatemala","Guatemala",123,"Carlos",1);
insert into cliente values(2,222,"Jorge Estuardo","Zuñiga Morales","7ma avenida","Guatemala","Guatemala",123,"Jorge",2);
-- -----------------------------------------------------
-- Table `hotelfase2`.`tipohabitacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelfase2`.`tipohabitacion` (
  `idTipoHabitacion` INT(11) NOT NULL AUTO_INCREMENT,
  `nombreTipoHabitacion` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`idTipoHabitacion`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `hotelfase2`.`habitacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelfase2`.`habitacion` (
  `idHabitacion` INT(11) NOT NULL,
  `estatusHabitacion` VARCHAR(45) NULL,
  `tipohabitacion_idTipoHabitacion` INT(11) NOT NULL,
  `tipo` VARCHAR(45) NULL,
  `Descripcion` VARCHAR(45) NULL,
  `costo` INT NULL,
  PRIMARY KEY (`idHabitacion`),
  INDEX `fk_habitacion_tipohabitacion1_idx` (`tipohabitacion_idTipoHabitacion` ASC),
  CONSTRAINT `fk_habitacion_tipohabitacion1`
    FOREIGN KEY (`tipohabitacion_idTipoHabitacion`)
    REFERENCES `hotelfase2`.`tipohabitacion` (`idTipoHabitacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;



-- -----------------------------------------------------
-- Table `hotelfase2`.`asignacionhabitacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelfase2`.`asignacionhabitacion` (
  `idAsignacionHabitacion` INT(11) NOT NULL AUTO_INCREMENT,
  `fechaInicio` DATE NULL DEFAULT NULL,
  `fechaFinal` DATE NULL DEFAULT NULL,
  `cliente_idCliente` INT(11) NOT NULL,
  `habitacion_idHabitacion` INT(11) NOT NULL,
  PRIMARY KEY (`idAsignacionHabitacion`),
  INDEX `fk_asignacionhabitacion_cliente1_idx` (`cliente_idCliente` ASC),
  INDEX `fk_asignacionhabitacion_habitacion1_idx` (`habitacion_idHabitacion` ASC))
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `hotelfase2`.`banco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelfase2`.`banco` (
  `idBanco` INT(11) NOT NULL,
  `nombre` VARCHAR(25) NULL DEFAULT NULL,
  PRIMARY KEY (`idBanco`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `hotelfase2`.`bodega`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelfase2`.`bodega` (
  `idBodega` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  `descripcion` VARCHAR(45) NULL DEFAULT NULL,
  `nivel` VARCHAR(45) NULL DEFAULT NULL,
  `capacidad` VARCHAR(45) NULL DEFAULT NULL,
  `encargado` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idBodega`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `hotelfase2`.`comprasdetalle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelfase2`.`comprasdetalle` (
  `idComprasDetalle` INT(11) NOT NULL,
  `id_productos` INT(11) NULL DEFAULT NULL,
  `cantidad` INT(11) NULL DEFAULT NULL,
  `subtotal` DOUBLE NULL DEFAULT NULL,
  PRIMARY KEY (`idComprasDetalle`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `hotelfase2`.`comprasencabezado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelfase2`.`comprasencabezado` (
  `idComprasEncabezado` INT(11) NOT NULL,
  `id_proveedor` INT(11) NULL DEFAULT NULL,
  `fecha` VARCHAR(45) NULL DEFAULT NULL,
  `idComprasDetalle` INT(11) NULL DEFAULT NULL,
  `total` DOUBLE NULL DEFAULT NULL,
  `comprasdetalle_idComprasDetalle` INT(11) NOT NULL,
  PRIMARY KEY (`idComprasEncabezado`),
  INDEX `fk_comprasencabezado_comprasdetalle1_idx` (`comprasdetalle_idComprasDetalle` ASC),
  CONSTRAINT `fk_comprasencabezado_comprasdetalle1`
    FOREIGN KEY (`comprasdetalle_idComprasDetalle`)
    REFERENCES `hotelfase2`.`comprasdetalle` (`idComprasDetalle`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `hotelfase2`.`moneda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelfase2`.`moneda` (
  `idMoneda` INT(11) NOT NULL,
  `moneda` VARCHAR(10) NULL DEFAULT NULL,
  `valor` FLOAT NULL DEFAULT NULL,
  `cuentabanco_idBanco` INT(11) NOT NULL,
  PRIMARY KEY (`idMoneda`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `hotelfase2`.`cuentabanco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelfase2`.`cuentabanco` (
  `noCuenta` VARCHAR(15) NOT NULL,
  `nombre` VARCHAR(60) NULL DEFAULT NULL,
  `saldoActual` FLOAT NULL DEFAULT NULL,
  `saldoDisponible` FLOAT NULL DEFAULT NULL,
  `tipoCuenta` VARCHAR(25) NULL DEFAULT NULL,
  `tipoMoneda` VARCHAR(25) NULL DEFAULT NULL,
  `banco_idBanco` INT(11) NOT NULL,
  `moneda_idMoneda` INT(11) NOT NULL,
  PRIMARY KEY (`noCuenta`),
  INDEX `fk_cuentabanco_banco1_idx` (`banco_idBanco` ASC),
  INDEX `fk_cuentabanco_moneda1_idx` (`moneda_idMoneda` ASC))
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `hotelfase2`.`cuentacontabilidad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelfase2`.`cuentacontabilidad` (
  `nomenclatura` INT(11) NOT NULL,
  `nombre` VARCHAR(40) NULL DEFAULT NULL,
  `saldo` VARCHAR(9) NULL DEFAULT NULL,
  `nivel` INT(11) NULL DEFAULT NULL,
  `saldoAnterior` DOUBLE NULL DEFAULT NULL,
  `cargoMes` DOUBLE NULL DEFAULT NULL,
  `abonoMes` DOUBLE NULL DEFAULT NULL,
  `saldoActual` DOUBLE NULL DEFAULT NULL,
  `cargoAcumulado` DOUBLE NULL DEFAULT NULL,
  `abonoAcumulado` DOUBLE NULL DEFAULT NULL,
  `presupuestado` DOUBLE NULL DEFAULT NULL,
  `naturaleza` VARCHAR(45) NULL,
  `tipo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`nomenclatura`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `hotelfase2`.`tipoDepreciacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelfase2`.`tipoDepreciacion` (
  `idTipoDepreciacion` INT NOT NULL,
  `descripcion` VARCHAR(75) NULL,
  `valor` DOUBLE NULL,
  PRIMARY KEY (`idTipoDepreciacion`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotelfase2`.`tipoProducto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelfase2`.`tipoProducto` (
  `idTipoProducto` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`idTipoProducto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotelfase2`.`productos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelfase2`.`productos` (
  `idProducto` INT(11) NOT NULL,
  `descripcion` VARCHAR(50) NULL DEFAULT NULL,
  `precio` INT(11) NULL DEFAULT NULL,
  `categoriaProducto` VARCHAR(45) NOT NULL,
  `comprasdetalle_idComprasDetalle` INT(11) NOT NULL,
  `tipoProducto_idTipoProducto` INT NOT NULL,
  PRIMARY KEY (`idProducto`),
  INDEX `fk_productos_comprasdetalle1_idx` (`comprasdetalle_idComprasDetalle` ASC),
  INDEX `fk_productos_tipoProducto1_idx` (`tipoProducto_idTipoProducto` ASC))
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `hotelfase2`.`inventario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelfase2`.`inventario` (
  `codigoInventario` INT(11) NOT NULL,
  `unidadMedida` VARCHAR(45) NOT NULL,
  `cantidad` VARCHAR(45) NULL DEFAULT NULL,
  `precioCompra` INT NULL DEFAULT NULL,
  `precioVenta` INT NULL,
  `productos_idProducto` INT(11) NOT NULL,
  PRIMARY KEY (`codigoInventario`),
  INDEX `fk_inventario_productos1_idx` (`productos_idProducto` ASC))
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `hotelfase2`.`depreciacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelfase2`.`depreciacion` (
  `totalArticulo` DOUBLE NULL DEFAULT NULL,
  `fechaCompra` DATE NULL DEFAULT NULL,
  `totalDepreciado` DOUBLE NULL DEFAULT NULL,
  `cuentacontabilidad_nomenclatura` INT(11) NOT NULL,
  `tipoDepreciacion_idTipoDepreciacion` INT NOT NULL,
  `inventario_codigoInventario` INT(11) NOT NULL,
  PRIMARY KEY (`cuentacontabilidad_nomenclatura`, `inventario_codigoInventario`),
  INDEX `fk_depreciacion_cuentacontabilidad1_idx` (`cuentacontabilidad_nomenclatura` ASC),
  INDEX `fk_depreciacion_tipoDepreciacion1_idx` (`tipoDepreciacion_idTipoDepreciacion` ASC),
  INDEX `fk_depreciacion_inventario1_idx` (`inventario_codigoInventario` ASC))
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `hotelfase2`.`despido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelfase2`.`despido` (
  `idDespido` INT(11) NOT NULL AUTO_INCREMENT,
  `causaDespido` VARCHAR(75) NOT NULL,
  `fechaDespido` DATETIME NOT NULL,
  `montoIndem` FLOAT NOT NULL,
  `contrato_idContrato` INT(10) NOT NULL,
  PRIMARY KEY (`idDespido`),
  INDEX `fk_despido_contrato1_idx` (`contrato_idContrato` ASC))
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `hotelfase2`.`servicio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelfase2`.`servicio` (
  `idServicio` INT(11) NOT NULL AUTO_INCREMENT,
  `nombreServicio` VARCHAR(50) NOT NULL,
  `costo_servicio` FLOAT NOT NULL,
  `descripcionServicio` VARCHAR(150) NULL DEFAULT NULL,
  `tipohabitacion_idTipoHabitacion` INT(11) NOT NULL,
  PRIMARY KEY (`idServicio`),
  INDEX `fk_servicio_tipohabitacion1_idx` (`tipohabitacion_idTipoHabitacion` ASC))
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `hotelfase2`.`detalleasignacionservicio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelfase2`.`detalleasignacionservicio` (
  `idAsignacionHabitacion` INT(11) NOT NULL,
  `diasServicio` INT(11) NOT NULL,
  `servicio_idServicio` INT(11) NOT NULL,
  PRIMARY KEY (`idAsignacionHabitacion`),
  INDEX `fk_detalleasignacionservicio_servicio1_idx` (`servicio_idServicio` ASC))
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `hotelfase2`.`mantenimiento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelfase2`.`mantenimiento` (
  `idMantenimiento` INT(11) NOT NULL AUTO_INCREMENT,
  `nombreMantenimiento` VARCHAR(45) NOT NULL,
  `descripcionMantenimiento` VARCHAR(150) NOT NULL,
  PRIMARY KEY (`idMantenimiento`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `hotelfase2`.`detallemantenimientohabitacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelfase2`.`detallemantenimientohabitacion` (
  `fechaUltimoMantenimiento` DATE NOT NULL,
  `mantenimiento_idMantenimiento` INT(11) NOT NULL,
  `habitacion_idHabitacion` INT(11) NOT NULL,
  INDEX `fk_detallemantenimientohabitacion_mantenimiento1_idx` (`mantenimiento_idMantenimiento` ASC),
  INDEX `fk_detallemantenimientohabitacion_habitacion1_idx` (`habitacion_idHabitacion` ASC),
  PRIMARY KEY (`mantenimiento_idMantenimiento`, `habitacion_idHabitacion`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `hotelfase2`.`periodo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelfase2`.`periodo` (
  `idPeriodo` INT(11) NOT NULL AUTO_INCREMENT,
  `fechaInicio` DATETIME NULL DEFAULT NULL,
  `fechaFin` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`idPeriodo`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `hotelfase2`.`nomina`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelfase2`.`nomina` (
  `idNomina` INT(11) NOT NULL AUTO_INCREMENT,
  `fechaEmision` DATETIME NOT NULL,
  `nombreEmpresa` VARCHAR(55) NOT NULL,
  `periodo_idPeriodo` INT(11) NOT NULL,
  `totalDeducido` FLOAT NOT NULL,
  `totalPercibidoPagar` FLOAT NOT NULL,
  `estado` INT NOT NULL,
  PRIMARY KEY (`idNomina`),
  INDEX `fk_nomina_periodo1_idx` (`periodo_idPeriodo` ASC))
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `hotelfase2`.`percepcionDeduccion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelfase2`.`percepcionDeduccion` (
  `id_PD` INT(11) NOT NULL AUTO_INCREMENT,
  `nombrePD` VARCHAR(10) NOT NULL,
  `valorPorcentaje` FLOAT NULL,
  `descripcionPD` VARCHAR(128) NULL,
  `flagOperacion` INT NOT NULL,
  PRIMARY KEY (`id_PD`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `hotelfase2`.`detallenomina`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelfase2`.`detallenomina` (
  `nominIdNomina` INT(11) NOT NULL,
  `contratoIdContrato` INT(10) NOT NULL,
  `id_PD` INT(11) NOT NULL,
  `valorPDcalculado` FLOAT NOT NULL,
  INDEX `fk_detallenomina_nomina1_idx` (`nominIdNomina` ASC),
  INDEX `fk_detallenomina_contrato1_idx` (`contratoIdContrato` ASC),
  PRIMARY KEY (`nominIdNomina`, `contratoIdContrato`, `id_PD`),
  INDEX `fk_detallenomina_percepcion1_idx` (`id_PD` ASC))
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `hotelfase2`.`partida`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelfase2`.`partida` (
  `idPartida` VARCHAR(12) NOT NULL,
  `numeroPartida` INT(11) NOT NULL,
  `definicionPartida` VARCHAR(300) NULL DEFAULT NULL,
  `total` DOUBLE NULL DEFAULT NULL,
  `fecha` DATE NULL,
  `estado` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idPartida`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `hotelfase2`.`detallepartida`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelfase2`.`detallepartida` (
  `numeroDetallePartida` INT(11) NOT NULL,
  `total` DOUBLE NULL DEFAULT NULL,
  `cuentacontabilidad_nomenclatura` INT(11) NOT NULL,
  `tipoPartida` VARCHAR(45) NOT NULL,
  `partida_idPartida` VARCHAR(12) NOT NULL,
  PRIMARY KEY (`numeroDetallePartida`, `partida_idPartida`),
  INDEX `fk_detallepartida_cuentacontabilidad1_idx` (`cuentacontabilidad_nomenclatura` ASC),
  INDEX `fk_detallepartida_partida1_idx` (`partida_idPartida` ASC))
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `hotelfase2`.`mesa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelfase2`.`mesa` (
  `idMesa` INT(11) NOT NULL AUTO_INCREMENT,
  `noMesa` INT(11) NOT NULL,
  `capacidad` INT(11) NOT NULL,
  PRIMARY KEY (`idMesa`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `hotelfase2`.`pedidoRestaurante`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelfase2`.`pedidoRestaurante` (
  `idPedidoRestaurante` INT(11) NOT NULL AUTO_INCREMENT,
  `fechaPedido` DATE NOT NULL,
  `mesa_idMesa` INT(11) NOT NULL,
  `cliente_idCliente` INT(11) NOT NULL,
  PRIMARY KEY (`idPedidoRestaurante`, `mesa_idMesa`, `cliente_idCliente`),
  INDEX `fk_pedido_mesa1_idx` (`mesa_idMesa` ASC),
  INDEX `fk_pedido_cliente1_idx` (`cliente_idCliente` ASC))
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `hotelfase2`.`detallepedidobebida`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelfase2`.`detallepedidobebida` (
  `cantidadBebida` INT(11) NOT NULL,
  `pedidoRestaurante_idPedido` INT(11) NOT NULL,
  `productos_idProducto` INT(11) NOT NULL,
  INDEX `fk_detallepedidobebida_pedidoRestaurante1_idx` (`pedidoRestaurante_idPedido` ASC),
  PRIMARY KEY (`pedidoRestaurante_idPedido`, `productos_idProducto`),
  INDEX `fk_detallepedidobebida_productos1_idx` (`productos_idProducto` ASC))
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `hotelfase2`.`receta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelfase2`.`receta` (
  `idReceta` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  `Procedimiento` LONGTEXT NULL,
  `tiempoPreparacion` VARCHAR(12) NULL,
  `numeroPersonas` INT NULL,
  PRIMARY KEY (`idReceta`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotelfase2`.`platillo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelfase2`.`platillo` (
  `idPlatillo` INT(11) NOT NULL AUTO_INCREMENT,
  `nombrePlatillo` VARCHAR(45) NOT NULL,
  `descripcionPlatillo` VARCHAR(200) NOT NULL,
  `costoPlatillo` FLOAT NOT NULL,
  `receta_idReceta` INT NOT NULL,
  PRIMARY KEY (`idPlatillo`),
  INDEX `fk_platillo_receta1_idx` (`receta_idReceta` ASC))
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `hotelfase2`.`detallepedidoplatillo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelfase2`.`detallepedidoplatillo` (
  `cantidadPlatillo` INT(11) NOT NULL,
  `platillo_idPlatillo` INT(11) NOT NULL,
  `pedidoRestaurante_idPedido` INT(11) NOT NULL,
  INDEX `fk_detallepedidoplatillo_platillo1_idx` (`platillo_idPlatillo` ASC),
  INDEX `fk_detallepedidoplatillo_pedidoRestaurante1_idx` (`pedidoRestaurante_idPedido` ASC),
  PRIMARY KEY (`platillo_idPlatillo`, `pedidoRestaurante_idPedido`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `hotelfase2`.`reservacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelfase2`.`reservacion` (
  `idReservacion` INT(11) NOT NULL AUTO_INCREMENT,
  `fechaEntrada` DATETIME NOT NULL,
  `fechaSalida` DATETIME NOT NULL,
  `estadoReserva` VARCHAR(45) NOT NULL,
  `nombreCliente` VARCHAR(45) NOT NULL,
  `apellidoCliente` VARCHAR(45) NULL,
  `cliente_idCliente` INT(11) NOT NULL,
  `tipo` VARCHAR(45) NULL,
  PRIMARY KEY (`idReservacion`),
  INDEX `fk_reservacion_cliente1_idx` (`cliente_idCliente` ASC),
  CONSTRAINT `fk_reservacion_cliente1`
    FOREIGN KEY (`cliente_idCliente`)
    REFERENCES `hotelfase2`.`cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;
select * from reservacion;




-- -----------------------------------------------------
-- Table `hotelfase2`.`detallereservacionservicio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelfase2`.`detallereservacionservicio` (
  `servicio_idServicio` INT(11) NOT NULL,
  `reservacion_idReservacion` INT(11) NOT NULL,
  INDEX `fk_detallereservacionservicio_servicio1_idx` (`servicio_idServicio` ASC),
  INDEX `fk_detallereservacionservicio_reservacion1_idx` (`reservacion_idReservacion` ASC))
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `hotelfase2`.`historialmoneda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelfase2`.`historialmoneda` (
  `idHistorial` INT(11) NOT NULL,
  `idMoneda` INT(11) NULL DEFAULT NULL,
  `fecha` DATE NULL DEFAULT NULL,
  `valor` FLOAT NULL DEFAULT NULL,
  `moneda_idMoneda` INT(11) NOT NULL,
  PRIMARY KEY (`idHistorial`),
  INDEX `fk_historialmoneda_moneda1_idx` (`moneda_idMoneda` ASC))
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `hotelfase2`.`horaextra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelfase2`.`horaextra` (
  `idHorasExtra` INT(11) NOT NULL,
  `fechaHoras` DATETIME NOT NULL,
  `cantidadHoras` INT NULL DEFAULT NULL,
  `personaAutorizo` VARCHAR(45) NULL DEFAULT NULL,
  `contrato_idContrato` INT(10) NOT NULL,
  PRIMARY KEY (`idHorasExtra`, `fechaHoras`),
  INDEX `fk_horaextra_contrato1_idx` (`contrato_idContrato` ASC))
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `hotelfase2`.`proveedores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelfase2`.`proveedores` (
  `idProveedores` INT(11) NOT NULL,
  `nombreProveedor` VARCHAR(45) NULL DEFAULT NULL,
  `direccion` VARCHAR(45) NULL,
  `representante` VARCHAR(45) NULL,
  `nit_proveedor` VARCHAR(45) NULL,
  PRIMARY KEY (`idProveedores`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `hotelfase2`.`registroigss`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelfase2`.`registroigss` (
  `noCarnetIgss` INT(11) NOT NULL,
  `contrato_idContrato` INT(10) NOT NULL,
  PRIMARY KEY (`noCarnetIgss`),
  INDEX `fk_registroigss_contrato1_idx` (`contrato_idContrato` ASC))
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `hotelfase2`.`registroirtra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelfase2`.`registroirtra` (
  `carneIrtra` INT(11) NOT NULL AUTO_INCREMENT,
  `contrato_idContrato` INT(10) NOT NULL,
  PRIMARY KEY (`carneIrtra`),
  INDEX `fk_registroirtra_contrato1_idx` (`contrato_idContrato` ASC))
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `hotelfase2`.`suspension`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelfase2`.`suspension` (
  `idregistroSuspension` INT(11) NOT NULL AUTO_INCREMENT,
  `fecha_inicioSuspencion` DATETIME NULL DEFAULT NULL,
  `fechaCulminacionSuspension` DATETIME NULL DEFAULT NULL,
  `motivoSuspension` VARCHAR(45) NULL DEFAULT NULL,
  `cantidadDiasSuspension` INT(11) NULL DEFAULT NULL,
  `autorizo` VARCHAR(45) NULL DEFAULT NULL,
  `estadoSus` INT(11) NULL DEFAULT NULL,
  `contrato_idContrato` INT(10) NOT NULL,
  PRIMARY KEY (`idregistroSuspension`),
  INDEX `fk_suspension_contrato1_idx` (`contrato_idContrato` ASC))
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `hotelfase2`.`tipopago`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelfase2`.`tipopago` (
  `idTipoPago` INT(11) NOT NULL,
  `nombre` VARCHAR(25) NULL DEFAULT NULL,
  PRIMARY KEY (`idTipoPago`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `hotelfase2`.`tipotransaccion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelfase2`.`tipotransaccion` (
  `idTipoTransaccion` INT(11) NOT NULL,
  `nombre` VARCHAR(30) NULL DEFAULT NULL,
  PRIMARY KEY (`idTipoTransaccion`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `hotelfase2`.`Conciliacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelfase2`.`Conciliacion` (
  `CorrConciliacion` INT NOT NULL,
  `noTransaccion` INT NULL,
  `fecha` DATE NULL,
  `valor` FLOAT NULL,
  PRIMARY KEY (`CorrConciliacion`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotelfase2`.`transaccion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelfase2`.`transaccion` (
  `noTransaccion` INT(11) NOT NULL,
  `valor` FLOAT NULL DEFAULT NULL,
  `idCuenta` INT(11) NULL DEFAULT NULL,
  `banco_idBanco` INT(11) NOT NULL,
  `cuentabanco_idBanco` INT(11) NOT NULL,
  `tipopago_idTipoPago` INT(11) NOT NULL,
  `Conciliacion_CorrConciliacion` INT NOT NULL,
  PRIMARY KEY (`noTransaccion`),
  INDEX `fk_transaccion_banco1_idx` (`banco_idBanco` ASC),
  INDEX `fk_transaccion_tipopago1_idx` (`tipopago_idTipoPago` ASC),
  INDEX `fk_transaccion_Conciliacion1_idx` (`Conciliacion_CorrConciliacion` ASC))
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `hotelfase2`.`vacaciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelfase2`.`vacaciones` (
  `idVacaciones` INT(11) NOT NULL AUTO_INCREMENT,
  `fechaInicioVacaciones` DATETIME NULL DEFAULT NULL,
  `fechaCulminacionVacaciones` DATETIME NULL DEFAULT NULL,
  `mesSolicitado` INT NULL DEFAULT NULL,
  `cantidadDiasHabiles` INT(11) NULL DEFAULT NULL,
  `estadoVacaciones` INT NULL DEFAULT NULL,
  `encargadoAutorizacion` VARCHAR(45) NULL DEFAULT NULL,
  `contrato_idContrato` INT(10) NOT NULL,
  PRIMARY KEY (`idVacaciones`),
  INDEX `fk_vacaciones_contrato1_idx` (`contrato_idContrato` ASC))
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `hotelfase2`.`bono14`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelfase2`.`bono14` (
  `idBono` INT NOT NULL AUTO_INCREMENT,
  `fechaBono14` DATETIME NOT NULL,
  `valorPercepcion` FLOAT NOT NULL,
  `estadoBono` INT NOT NULL,
  `contrato_idContrato` INT(10) NOT NULL,
  PRIMARY KEY (`idBono`),
  INDEX `fk_bono14_contrato1_idx` (`contrato_idContrato` ASC),
  CONSTRAINT `fk_bono14_contrato1`
    FOREIGN KEY (`contrato_idContrato`)
    REFERENCES `hotelfase2`.`contrato` (`idContrato`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotelfase2`.`pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelfase2`.`pedido` (
  `idPedido` INT NOT NULL AUTO_INCREMENT,
  `fecha` VARCHAR(45) NULL,
  `productos_idProducto` INT(11) NOT NULL,
  PRIMARY KEY (`idPedido`),
  INDEX `fk_pedido_productos1_idx` (`productos_idProducto` ASC),
  CONSTRAINT `fk_pedido_productos1`
    FOREIGN KEY (`productos_idProducto`)
    REFERENCES `hotelfase2`.`productos` (`idProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotelfase2`.`detallepedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelfase2`.`detallepedido` (
  `idDetallePedido` INT NOT NULL AUTO_INCREMENT,
  `pedido_idPedido` INT NOT NULL,
  `productos_idProducto` INT(11) NOT NULL,
  PRIMARY KEY (`idDetallePedido`),
  INDEX `fk_detallepedido_pedido1_idx` (`pedido_idPedido` ASC),
  INDEX `fk_detallepedido_productos1_idx` (`productos_idProducto` ASC),
  CONSTRAINT `fk_detallepedido_pedido1`
    FOREIGN KEY (`pedido_idPedido`)
    REFERENCES `hotelfase2`.`pedido` (`idPedido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_detallepedido_productos1`
    FOREIGN KEY (`productos_idProducto`)
    REFERENCES `hotelfase2`.`productos` (`idProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotelfase2`.`factura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelfase2`.`factura` (
  `idFactura` INT NOT NULL AUTO_INCREMENT,
  `fechaFactura` VARCHAR(45) NULL,
  `fechaVencimiento` VARCHAR(45) NULL,
  `totalFactura` VARCHAR(45) NULL,
  `Facturador` VARCHAR(45) NULL,
  `cliente_idCliente` INT(11) NOT NULL,
  PRIMARY KEY (`idFactura`),
  INDEX `fk_factura_cliente1_idx` (`cliente_idCliente` ASC),
  CONSTRAINT `fk_factura_cliente1`
    FOREIGN KEY (`cliente_idCliente`)
    REFERENCES `hotelfase2`.`cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotelfase2`.`detallefactura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelfase2`.`detallefactura` (
  `cantidadFacturado` INT NOT NULL,
  `precioFacturado` INT NULL,
  `factura_idFactura` INT NOT NULL,
  `productos_idProducto` INT(11) NOT NULL,
  INDEX `fk_detallefactura_factura1_idx` (`factura_idFactura` ASC),
  INDEX `fk_detallefactura_productos1_idx` (`productos_idProducto` ASC),
  CONSTRAINT `fk_detallefactura_factura1`
    FOREIGN KEY (`factura_idFactura`)
    REFERENCES `hotelfase2`.`factura` (`idFactura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_detallefactura_productos1`
    FOREIGN KEY (`productos_idProducto`)
    REFERENCES `hotelfase2`.`productos` (`idProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotelfase2`.`trasladobodega`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelfase2`.`trasladobodega` (
  `idTraslado` INT NOT NULL AUTO_INCREMENT,
  `bodegaEntra` VARCHAR(45) NULL,
  `bodegaSale` VARCHAR(45) NULL,
  `productos_idProducto` INT(11) NOT NULL,
  PRIMARY KEY (`idTraslado`),
  INDEX `fk_trasladobodega_productos1_idx` (`productos_idProducto` ASC),
  CONSTRAINT `fk_trasladobodega_productos1`
    FOREIGN KEY (`productos_idProducto`)
    REFERENCES `hotelfase2`.`productos` (`idProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotelfase2`.`tipoMedida`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelfase2`.`tipoMedida` (
  `idTipoMedida` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`idTipoMedida`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotelfase2`.`detallebodega`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelfase2`.`detallebodega` (
  `idDetalleBodega` INT NOT NULL AUTO_INCREMENT,
  `productos_idProducto` INT(11) NOT NULL,
  `bodega_idBodega` INT(11) NOT NULL,
  `cantidad` VARCHAR(45) NULL,
  `tipoMedida_idTipoMedida` INT NOT NULL,
  PRIMARY KEY (`idDetalleBodega`),
  INDEX `fk_detallebodega_productos1_idx` (`productos_idProducto` ASC),
  INDEX `fk_detallebodega_bodega1_idx` (`bodega_idBodega` ASC),
  INDEX `fk_detallebodega_tipoMedida1_idx` (`tipoMedida_idTipoMedida` ASC),
  CONSTRAINT `fk_detallebodega_productos1`
    FOREIGN KEY (`productos_idProducto`)
    REFERENCES `hotelfase2`.`productos` (`idProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_detallebodega_bodega1`
    FOREIGN KEY (`bodega_idBodega`)
    REFERENCES `hotelfase2`.`bodega` (`idBodega`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_detallebodega_tipoMedida1`
    FOREIGN KEY (`tipoMedida_idTipoMedida`)
    REFERENCES `hotelfase2`.`tipoMedida` (`idTipoMedida`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotelfase2`.`cotizacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelfase2`.`cotizacion` (
  `idCotizacion` INT NOT NULL AUTO_INCREMENT,
  `productos_idProducto` INT(11) NOT NULL,
  `cantidad` INT NULL,
  `fechaCotizacion` VARCHAR(45) NULL,
  `total` INT NULL,
  `empleado_idEmpleado` INT(11) NOT NULL,
  PRIMARY KEY (`idCotizacion`),
  INDEX `fk_cotizacion_productos1_idx` (`productos_idProducto` ASC),
  INDEX `fk_cotizacion_empleado1_idx` (`empleado_idEmpleado` ASC),
  CONSTRAINT `fk_cotizacion_productos1`
    FOREIGN KEY (`productos_idProducto`)
    REFERENCES `hotelfase2`.`productos` (`idProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cotizacion_empleado1`
    FOREIGN KEY (`empleado_idEmpleado`)
    REFERENCES `hotelfase2`.`empleado` (`idEmpleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotelfase2`.`cierreNomina`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelfase2`.`cierreNomina` (
  `idCierre` INT NOT NULL AUTO_INCREMENT,
  `nomina_idNomina` INT(11) NOT NULL,
  `fechaCierre` DATETIME NOT NULL,
  `totalPercibido` FLOAT NOT NULL,
  `totalDeducido` FLOAT NOT NULL,
  INDEX `fk_cierreNomina_nomina1_idx` (`nomina_idNomina` ASC),
  PRIMARY KEY (`idCierre`),
  CONSTRAINT `fk_cierreNomina_nomina1`
    FOREIGN KEY (`nomina_idNomina`)
    REFERENCES `hotelfase2`.`nomina` (`idNomina`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotelfase2`.`Transacciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelfase2`.`Transacciones` (
  `cod_transacciones` INT NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(45) NULL,
  `accion` VARCHAR(45) NULL,
  `cuentacontabilidad_nomenclatura` INT(11) NOT NULL,
  PRIMARY KEY (`cod_transacciones`, `cuentacontabilidad_nomenclatura`),
  INDEX `fk_Transacciones_cuentacontabilidad1_idx` (`cuentacontabilidad_nomenclatura` ASC),
  CONSTRAINT `fk_Transacciones_cuentacontabilidad1`
    FOREIGN KEY (`cuentacontabilidad_nomenclatura`)
    REFERENCES `hotelfase2`.`cuentacontabilidad` (`nomenclatura`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotelfase2`.`Movimientos_cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelfase2`.`Movimientos_cliente` (
  `Id_mov_cliente` INT NOT NULL AUTO_INCREMENT,
  `cod_transaccion` INT NOT NULL,
  `id_cliente` INT NOT NULL,
  `total_cobro` FLOAT NULL,
  `saldo` FLOAT NULL,
  `fecha` DATE NULL,
  `Transacciones_cod_transacciones` INT NOT NULL,
  `cliente_idCliente` INT(11) NOT NULL,
  `fechaVencimiento` DATE NULL,
  PRIMARY KEY (`Id_mov_cliente`),
  INDEX `fk_Movimientos_cliente_Transacciones1_idx` (`Transacciones_cod_transacciones` ASC),
  INDEX `fk_Movimientos_cliente_cliente1_idx` (`cliente_idCliente` ASC),
  CONSTRAINT `fk_Movimientos_cliente_Transacciones1`
    FOREIGN KEY (`Transacciones_cod_transacciones`)
    REFERENCES `hotelfase2`.`Transacciones` (`cod_transacciones`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Movimientos_cliente_cliente1`
    FOREIGN KEY (`cliente_idCliente`)
    REFERENCES `hotelfase2`.`cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotelfase2`.`Reporte`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelfase2`.`Reporte` (
  `id_reporte` INT NOT NULL,
  `fecha` DATE NULL,
  `observaciones` VARCHAR(45) NULL,
  PRIMARY KEY (`id_reporte`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotelfase2`.`Movimientos_proveedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelfase2`.`Movimientos_proveedor` (
  `Id_mov_proveedor` INT NOT NULL,
  `cod_transaccion` INT NULL,
  `id_proveedor` INT NULL,
  `total_pago` FLOAT NULL,
  `saldo` FLOAT NULL,
  `fecha` DATE NULL,
  `Transacciones_cod_transacciones` INT NOT NULL,
  `proveedores_idProveedores` INT(11) NOT NULL,
  PRIMARY KEY (`Id_mov_proveedor`),
  INDEX `fk_Movimientos_proveedor_Transacciones1_idx` (`Transacciones_cod_transacciones` ASC),
  INDEX `fk_Movimientos_proveedor_proveedores1_idx` (`proveedores_idProveedores` ASC),
  CONSTRAINT `fk_Movimientos_proveedor_Transacciones1`
    FOREIGN KEY (`Transacciones_cod_transacciones`)
    REFERENCES `hotelfase2`.`Transacciones` (`cod_transacciones`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Movimientos_proveedor_proveedores1`
    FOREIGN KEY (`proveedores_idProveedores`)
    REFERENCES `hotelfase2`.`proveedores` (`idProveedores`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotelfase2`.`historial`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelfase2`.`historial` (
  `idHistorial` INT NOT NULL,
  `fecha` DATE NULL,
  `valor` DOUBLE NULL,
  `cuentacontabilidad_nomenclatura` INT(11) NOT NULL,
  PRIMARY KEY (`idHistorial`),
  INDEX `fk_historial_cuentacontabilidad1_idx` (`cuentacontabilidad_nomenclatura` ASC),
  CONSTRAINT `fk_historial_cuentacontabilidad1`
    FOREIGN KEY (`cuentacontabilidad_nomenclatura`)
    REFERENCES `hotelfase2`.`cuentacontabilidad` (`nomenclatura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotelfase2`.`detalletransaccion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelfase2`.`detalletransaccion` (
  `CorrDetTransaccion` INT NOT NULL,
  `TipoOperacion` TINYINT NULL,
  `transaccion_noTransaccion` INT(11) NOT NULL,
  `tipotransaccion_idTipoTransaccion` INT(11) NOT NULL,
  PRIMARY KEY (`CorrDetTransaccion`),
  INDEX `fk_detalletransaccion_transaccion1_idx` (`transaccion_noTransaccion` ASC),
  INDEX `fk_detalletransaccion_tipotransaccion1_idx` (`tipotransaccion_idTipoTransaccion` ASC),
  CONSTRAINT `fk_detalletransaccion_transaccion1`
    FOREIGN KEY (`transaccion_noTransaccion`)
    REFERENCES `hotelfase2`.`transaccion` (`noTransaccion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalletransaccion_tipotransaccion1`
    FOREIGN KEY (`tipotransaccion_idTipoTransaccion`)
    REFERENCES `hotelfase2`.`tipotransaccion` (`idTipoTransaccion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotelfase2`.`detalleHabitacionReservacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelfase2`.`detalleHabitacionReservacion` (
  `reservacion_idReservacion` INT(11) NOT NULL,
  `habitacion_idHabitacion` INT(11) NOT NULL,
  INDEX `fk_detalleHabitacionReservacion_reservacion1_idx` (`reservacion_idReservacion` ASC),
  INDEX `fk_detalleHabitacionReservacion_habitacion1_idx` (`habitacion_idHabitacion` ASC),
  CONSTRAINT `fk_detalleHabitacionReservacion_reservacion1`
    FOREIGN KEY (`reservacion_idReservacion`)
    REFERENCES `hotelfase2`.`reservacion` (`idReservacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalleHabitacionReservacion_habitacion1`
    FOREIGN KEY (`habitacion_idHabitacion`)
    REFERENCES `hotelfase2`.`habitacion` (`idHabitacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotelfase2`.`tipoHuesped`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelfase2`.`tipoHuesped` (
  `idTipoHuesped` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `descripcion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idTipoHuesped`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotelfase2`.`detalleTipoHuepedReservacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelfase2`.`detalleTipoHuepedReservacion` (
  `reservacion_idReservacion` INT(11) NOT NULL,
  `tipoHuesped_idTipoHuesped` INT NOT NULL,
  `cantidad` INT NOT NULL,
  INDEX `fk_detalleTipoHuepedReservacion_reservacion1_idx` (`reservacion_idReservacion` ASC),
  INDEX `fk_detalleTipoHuepedReservacion_tipoHuesped1_idx` (`tipoHuesped_idTipoHuesped` ASC),
  CONSTRAINT `fk_detalleTipoHuepedReservacion_reservacion1`
    FOREIGN KEY (`reservacion_idReservacion`)
    REFERENCES `hotelfase2`.`reservacion` (`idReservacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalleTipoHuepedReservacion_tipoHuesped1`
    FOREIGN KEY (`tipoHuesped_idTipoHuesped`)
    REFERENCES `hotelfase2`.`tipoHuesped` (`idTipoHuesped`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotelfase2`.`detalleRecetaIngrediente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelfase2`.`detalleRecetaIngrediente` (
  `receta_idReceta` INT NOT NULL,
  `pesoOcantidad` VARCHAR(45) NOT NULL,
  `productos_idProducto` INT(11) NOT NULL,
  INDEX `fk_detalleRecetaIngrediente_receta1_idx` (`receta_idReceta` ASC),
  PRIMARY KEY (`receta_idReceta`, `productos_idProducto`),
  INDEX `fk_detalleRecetaIngrediente_productos1_idx` (`productos_idProducto` ASC),
  CONSTRAINT `fk_detalleRecetaIngrediente_receta1`
    FOREIGN KEY (`receta_idReceta`)
    REFERENCES `hotelfase2`.`receta` (`idReceta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalleRecetaIngrediente_productos1`
    FOREIGN KEY (`productos_idProducto`)
    REFERENCES `hotelfase2`.`productos` (`idProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotelfase2`.`vehiculo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelfase2`.`vehiculo` (
  `idVehiculo` INT NOT NULL,
  `tipo` VARCHAR(45) NULL,
  `capacidad` VARCHAR(45) NULL,
  `placa` VARCHAR(45) NULL,
  PRIMARY KEY (`idVehiculo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotelfase2`.`piloto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelfase2`.`piloto` (
  `idpiloto` INT NOT NULL,
  `nombre` VARCHAR(50) NULL,
  `dpi` VARCHAR(45) NULL,
  `telefono` VARCHAR(45) NULL,
  PRIMARY KEY (`idpiloto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotelfase2`.`viaje`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelfase2`.`viaje` (
  `idViaje` INT NOT NULL AUTO_INCREMENT,
  `fechaPrevistaOperacion` VARCHAR(45) NULL,
  `observaciones` VARCHAR(45) NULL,
  `vehiculo_idVehiculo` INT NOT NULL,
  `bodegaProcedencia` VARCHAR(45) NULL,
  `bodegaDestino` VARCHAR(45) NULL,
  `piloto_idpiloto` INT NOT NULL,
  PRIMARY KEY (`idViaje`),
  INDEX `fk_viaje_vehiculo1_idx` (`vehiculo_idVehiculo` ASC),
  INDEX `fk_viaje_piloto1_idx` (`piloto_idpiloto` ASC),
  CONSTRAINT `fk_viaje_vehiculo1`
    FOREIGN KEY (`vehiculo_idVehiculo`)
    REFERENCES `hotelfase2`.`vehiculo` (`idVehiculo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_viaje_piloto1`
    FOREIGN KEY (`piloto_idpiloto`)
    REFERENCES `hotelfase2`.`piloto` (`idpiloto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotelfase2`.`mercaderiaEnvio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelfase2`.`mercaderiaEnvio` (
  `idmercaderiaEnvio` INT NOT NULL AUTO_INCREMENT,
  `pesoMercaderia` INT NULL,
  `cantidadProducto` VARCHAR(45) NULL,
  `productos_idProducto` INT(11) NOT NULL,
  `observaciones` VARCHAR(45) NULL,
  `viaje_idViaje` INT NOT NULL,
  PRIMARY KEY (`idmercaderiaEnvio`),
  INDEX `fk_notaEnvio_productos1_idx` (`productos_idProducto` ASC),
  INDEX `fk_mercaderiaEnvio_viaje1_idx` (`viaje_idViaje` ASC),
  CONSTRAINT `fk_notaEnvio_productos1`
    FOREIGN KEY (`productos_idProducto`)
    REFERENCES `hotelfase2`.`productos` (`idProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_mercaderiaEnvio_viaje1`
    FOREIGN KEY (`viaje_idViaje`)
    REFERENCES `hotelfase2`.`viaje` (`idViaje`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotelfase2`.`comisiones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelfase2`.`comisiones` (
  `idComision` INT NOT NULL AUTO_INCREMENT,
  `porcentaje` FLOAT NULL,
  `inventario_codigoInventario` INT(11) NOT NULL,
  `empleado_idEmpleado` INT(11) NOT NULL,
  PRIMARY KEY (`idComision`),
  INDEX `fk_comisiones_inventario1_idx` (`inventario_codigoInventario` ASC),
  INDEX `fk_comisiones_empleado1_idx` (`empleado_idEmpleado` ASC),
  CONSTRAINT `fk_comisiones_inventario1`
    FOREIGN KEY (`inventario_codigoInventario`)
    REFERENCES `hotelfase2`.`inventario` (`codigoInventario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comisiones_empleado1`
    FOREIGN KEY (`empleado_idEmpleado`)
    REFERENCES `hotelfase2`.`empleado` (`idEmpleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotelfase2`.`transaccionesInventario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelfase2`.`transaccionesInventario` (
  `idTransaccionesInventario` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `efecto` VARCHAR(45) NULL,
  `cuentacontabilidad_nomenclatura` INT(11) NOT NULL,
  `estatus` VARCHAR(45) NULL,
  `fechaTransaccion` DATE NULL,
  PRIMARY KEY (`idTransaccionesInventario`),
  INDEX `fk_transaccionesInventario_cuentacontabilidad1_idx` (`cuentacontabilidad_nomenclatura` ASC),
  CONSTRAINT `fk_transaccionesInventario_cuentacontabilidad1`
    FOREIGN KEY (`cuentacontabilidad_nomenclatura`)
    REFERENCES `hotelfase2`.`cuentacontabilidad` (`nomenclatura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotelfase2`.`TipoMovimientoIventario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelfase2`.`TipoMovimientoIventario` (
  `idTipoMovimientoIventario` INT NOT NULL AUTO_INCREMENT,
  `nombreTipoMovimiento` VARCHAR(45) NULL,
  `Ingresoosalida` INT NULL,
  PRIMARY KEY (`idTipoMovimientoIventario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotelfase2`.`movimientoInventario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelfase2`.`movimientoInventario` (
  `codigoMovimientoInventario` INT NOT NULL,
  `descripcion` VARCHAR(45) NULL,
  `costo` INT NULL,
  `fecha` VARCHAR(45) NULL,
  `transaccionesInventario_idTransaccionesInventario` INT NOT NULL,
  `TipoMovimientoIventario_idTipoMovimientoIventario` INT NOT NULL,
  `bodega_idBodegaOrigen` INT(11) NOT NULL,
  `bodega_idBodegaDestino` INT(11) NOT NULL,
  PRIMARY KEY (`codigoMovimientoInventario`),
  INDEX `fk_movimientoInventario_transaccionesInventario1_idx` (`transaccionesInventario_idTransaccionesInventario` ASC),
  INDEX `fk_movimientoInventario_TipoMovimientoIventario1_idx` (`TipoMovimientoIventario_idTipoMovimientoIventario` ASC),
  INDEX `fk_movimientoInventario_bodega1_idx` (`bodega_idBodegaOrigen` ASC),
  INDEX `fk_movimientoInventario_bodega2_idx` (`bodega_idBodegaDestino` ASC),
  CONSTRAINT `fk_movimientoInventario_transaccionesInventario1`
    FOREIGN KEY (`transaccionesInventario_idTransaccionesInventario`)
    REFERENCES `hotelfase2`.`transaccionesInventario` (`idTransaccionesInventario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_movimientoInventario_TipoMovimientoIventario1`
    FOREIGN KEY (`TipoMovimientoIventario_idTipoMovimientoIventario`)
    REFERENCES `hotelfase2`.`TipoMovimientoIventario` (`idTipoMovimientoIventario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_movimientoInventario_bodega1`
    FOREIGN KEY (`bodega_idBodegaOrigen`)
    REFERENCES `hotelfase2`.`bodega` (`idBodega`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_movimientoInventario_bodega2`
    FOREIGN KEY (`bodega_idBodegaDestino`)
    REFERENCES `hotelfase2`.`bodega` (`idBodega`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotelfase2`.`polizaInventario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelfase2`.`polizaInventario` (
  `codigoPolizaInventario` INT NOT NULL,
  `ivaxCobrar` INT NULL,
  `ivaxPagar` INT NULL,
  `totalDebe` INT NULL,
  `totalHaber` INT NULL,
  `fechaInicial` VARCHAR(45) NULL,
  `fechaFinal` VARCHAR(45) NULL,
  `movimientoInventario_codigoMovimientoInventario` INT NOT NULL,
  PRIMARY KEY (`codigoPolizaInventario`),
  INDEX `fk_polizaInventario_movimientoInventario1_idx` (`movimientoInventario_codigoMovimientoInventario` ASC),
  CONSTRAINT `fk_polizaInventario_movimientoInventario1`
    FOREIGN KEY (`movimientoInventario_codigoMovimientoInventario`)
    REFERENCES `hotelfase2`.`movimientoInventario` (`codigoMovimientoInventario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotelfase2`.`perfil`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelfase2`.`perfil` (
  `idPerfil` INT NOT NULL AUTO_INCREMENT,
  `nombrePerfil` VARCHAR(45) NULL,
  `descripcionPerfil` VARCHAR(45) NULL,
  PRIMARY KEY (`idPerfil`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotelfase2`.`reporteador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelfase2`.`reporteador` (
  `idReporte` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `path` VARCHAR(45) NULL,
  `fecha` VARCHAR(45) NULL,
  PRIMARY KEY (`idReporte`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotelfase2`.`aplicacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelfase2`.`aplicacion` (
  `idAplicacion` INT NOT NULL,
  `nombreAplicacion` VARCHAR(45) NULL,
  `descripcionAplicacion` VARCHAR(45) NULL,
  `habilitarAplicacion` VARCHAR(45) NULL,
  `reporteador_idReporte` INT NOT NULL,
  PRIMARY KEY (`idAplicacion`),
  INDEX `fk_aplicacion_reporteador1_idx` (`reporteador_idReporte` ASC),
  CONSTRAINT `fk_aplicacion_reporteador1`
    FOREIGN KEY (`reporteador_idReporte`)
    REFERENCES `hotelfase2`.`reporteador` (`idReporte`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotelfase2`.`detallePerfilAplicacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelfase2`.`detallePerfilAplicacion` (
  `aplicacion_idAplicacion` INT NOT NULL,
  `perfil_idPerfil` INT NOT NULL,
  INDEX `fk_detallePerfilAplicacion_aplicacion1_idx` (`aplicacion_idAplicacion` ASC),
  INDEX `fk_detallePerfilAplicacion_perfil1_idx` (`perfil_idPerfil` ASC),
  CONSTRAINT `fk_detallePerfilAplicacion_aplicacion1`
    FOREIGN KEY (`aplicacion_idAplicacion`)
    REFERENCES `hotelfase2`.`aplicacion` (`idAplicacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_detallePerfilAplicacion_perfil1`
    FOREIGN KEY (`perfil_idPerfil`)
    REFERENCES `hotelfase2`.`perfil` (`idPerfil`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotelfase2`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelfase2`.`usuario` (
  `idUsuario` INT NOT NULL,
  `usuario` VARCHAR(45) NULL,
  `nombreUsuario` VARCHAR(45) NULL,
  `apellidoUsuario` VARCHAR(45) NULL,
  `contrasena` VARCHAR(45) NULL,
  `correoUsuario` VARCHAR(45) NULL,
  `telefonoUsuario` VARCHAR(45) NULL,
  PRIMARY KEY (`idUsuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotelfase2`.`detalleUsuarioPerfil`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelfase2`.`detalleUsuarioPerfil` (
  `perfil_idPerfil` INT NOT NULL,
  `usuario_idUsuario` INT NOT NULL,
  INDEX `fk_detalleUsuarioAplicacion_perfil1_idx` (`perfil_idPerfil` ASC),
  INDEX `fk_detalleUsuarioAplicacion_usuario1_idx` (`usuario_idUsuario` ASC),
  CONSTRAINT `fk_detalleUsuarioAplicacion_perfil1`
    FOREIGN KEY (`perfil_idPerfil`)
    REFERENCES `hotelfase2`.`perfil` (`idPerfil`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalleUsuarioAplicacion_usuario1`
    FOREIGN KEY (`usuario_idUsuario`)
    REFERENCES `hotelfase2`.`usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotelfase2`.`detalleAplicacionDerecho`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelfase2`.`detalleAplicacionDerecho` (
  `ingresar` TINYINT NULL,
  `modificar` TINYINT NULL,
  `eliminar` TINYINT NULL,
  `imprimir` TINYINT NULL,
  `consultar` TINYINT NULL,
  `usuario_idUsuario` INT NOT NULL,
  `aplicacion_idAplicacion` INT NOT NULL,
  INDEX `fk_detalleAplicacionDerecho_usuario1_idx` (`usuario_idUsuario` ASC),
  INDEX `fk_detalleAplicacionDerecho_aplicacion1_idx` (`aplicacion_idAplicacion` ASC),
  CONSTRAINT `fk_detalleAplicacionDerecho_usuario1`
    FOREIGN KEY (`usuario_idUsuario`)
    REFERENCES `hotelfase2`.`usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalleAplicacionDerecho_aplicacion1`
    FOREIGN KEY (`aplicacion_idAplicacion`)
    REFERENCES `hotelfase2`.`aplicacion` (`idAplicacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotelfase2`.`bitacora`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelfase2`.`bitacora` (
  `idBitacora` INT NOT NULL,
  `fechaBitacora` DATE NULL,
  `horaBitacora` TIME NULL,
  `accionUsuario` VARCHAR(45) NULL,
  `resultadoBitacora` VARCHAR(45) NULL,
  `errorBitacora` VARCHAR(45) NULL,
  `ipPc` VARCHAR(45) NULL,
  `usuario_idUsuario` INT NOT NULL,
  `aplicacion_idAplicacion` INT NOT NULL,
  PRIMARY KEY (`idBitacora`),
  INDEX `fk_bitacora_usuario1_idx` (`usuario_idUsuario` ASC),
  INDEX `fk_bitacora_aplicacion1_idx` (`aplicacion_idAplicacion` ASC),
  CONSTRAINT `fk_bitacora_usuario1`
    FOREIGN KEY (`usuario_idUsuario`)
    REFERENCES `hotelfase2`.`usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_bitacora_aplicacion1`
    FOREIGN KEY (`aplicacion_idAplicacion`)
    REFERENCES `hotelfase2`.`aplicacion` (`idAplicacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotelfase2`.`ordenedecompra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelfase2`.`ordenedecompra` (
  `idOrdenesCompra` INT NOT NULL,
  `proveedores_idProveedores` INT(11) NOT NULL,
  `productos_idProducto` INT(11) NOT NULL,
  `categoria` VARCHAR(45) NULL,
  PRIMARY KEY (`idOrdenesCompra`),
  INDEX `fk_ordenedecompra_proveedores1_idx` (`proveedores_idProveedores` ASC),
  INDEX `fk_ordenedecompra_productos1_idx` (`productos_idProducto` ASC),
  CONSTRAINT `fk_ordenedecompra_proveedores1`
    FOREIGN KEY (`proveedores_idProveedores`)
    REFERENCES `hotelfase2`.`proveedores` (`idProveedores`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ordenedecompra_productos1`
    FOREIGN KEY (`productos_idProducto`)
    REFERENCES `hotelfase2`.`productos` (`idProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotelfase2`.`controldevolucion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelfase2`.`controldevolucion` (
  `idControlDevolucion` INT NOT NULL,
  `devaluacionAutorizada` VARCHAR(45) NULL,
  `descripcion` VARCHAR(45) NULL,
  `ordenedecompra_idOrdenesCompra` INT NOT NULL,
  PRIMARY KEY (`idControlDevolucion`),
  INDEX `fk_controldevolucion_ordenedecompra1_idx` (`ordenedecompra_idOrdenesCompra` ASC),
  CONSTRAINT `fk_controldevolucion_ordenedecompra1`
    FOREIGN KEY (`ordenedecompra_idOrdenesCompra`)
    REFERENCES `hotelfase2`.`ordenedecompra` (`idOrdenesCompra`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotelfase2`.`controldemoras`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelfase2`.`controldemoras` (
  `idControlDemoras` INT NOT NULL,
  `fechaInicial` DATE NULL,
  `fechaPrevistaDeRecibido` DATE NULL,
  `demora` VARCHAR(45) NULL,
  `ordenedecompra_idOrdenesCompra` INT NOT NULL,
  PRIMARY KEY (`idControlDemoras`),
  INDEX `fk_controldemoras_ordenedecompra1_idx` (`ordenedecompra_idOrdenesCompra` ASC),
  CONSTRAINT `fk_controldemoras_ordenedecompra1`
    FOREIGN KEY (`ordenedecompra_idOrdenesCompra`)
    REFERENCES `hotelfase2`.`ordenedecompra` (`idOrdenesCompra`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotelfase2`.`DetalleMovimiento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelfase2`.`DetalleMovimiento` (
  `idDetalleMovimiento` INT NOT NULL AUTO_INCREMENT,
  `Cantidad` INT NULL,
  `CostoUnitario` INT NULL,
  `CostoTotal` INT NULL,
  `movimientoInventario_codigoMovimientoInventario` INT NOT NULL,
  `productos_idProducto` INT(11) NOT NULL,
  PRIMARY KEY (`idDetalleMovimiento`),
  INDEX `fk_DetalleMovimiento_movimientoInventario1_idx` (`movimientoInventario_codigoMovimientoInventario` ASC),
  INDEX `fk_DetalleMovimiento_productos1_idx` (`productos_idProducto` ASC),
  CONSTRAINT `fk_DetalleMovimiento_movimientoInventario1`
    FOREIGN KEY (`movimientoInventario_codigoMovimientoInventario`)
    REFERENCES `hotelfase2`.`movimientoInventario` (`codigoMovimientoInventario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_DetalleMovimiento_productos1`
    FOREIGN KEY (`productos_idProducto`)
    REFERENCES `hotelfase2`.`productos` (`idProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotelfase2`.`Checkin`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelfase2`.`Checkin` (
  `idCheckin` INT NOT NULL AUTO_INCREMENT,
  `fechaEntrada` DATE NOT NULL,
  `fechaSalida` DATE NOT NULL,
  `cliente_idCliente` INT(11) NOT NULL,
  `reservacion_idReservacion` INT(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`idCheckin`),
  INDEX `fk_Checkin_cliente1_idx` (`cliente_idCliente` ASC),
  INDEX `fk_Checkin_reservacion1_idx` (`reservacion_idReservacion` ASC),
  CONSTRAINT `fk_Checkin_cliente1`
    FOREIGN KEY (`cliente_idCliente`)
    REFERENCES `hotelfase2`.`cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Checkin_reservacion1`
    FOREIGN KEY (`reservacion_idReservacion`)
    REFERENCES `hotelfase2`.`reservacion` (`idReservacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;





-- -----------------------------------------------------
-- Table `hotelfase2`.`detalleHabitacionCheckin`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelfase2`.`detalleHabitacionCheckin` (
  `Checkin_idCheckin` INT NOT NULL,
  `habitacion_idHabitacion` INT(11) NOT NULL,
  INDEX `fk_detalleHabitacionCheckin_Checkin1_idx` (`Checkin_idCheckin` ASC),
  INDEX `fk_detalleHabitacionCheckin_habitacion1_idx` (`habitacion_idHabitacion` ASC),
  CONSTRAINT `fk_detalleHabitacionCheckin_Checkin1`
    FOREIGN KEY (`Checkin_idCheckin`)
    REFERENCES `hotelfase2`.`Checkin` (`idCheckin`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalleHabitacionCheckin_habitacion1`
    FOREIGN KEY (`habitacion_idHabitacion`)
    REFERENCES `hotelfase2`.`habitacion` (`idHabitacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotelfase2`.`detalleTipohuespedCheckin`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelfase2`.`detalleTipohuespedCheckin` (
  `Checkin_idCheckin` INT NOT NULL,
  `tipoHuesped_idTipoHuesped` INT NOT NULL,
  `cantidad` INT NOT NULL,
  INDEX `fk_detalleTipohuespedCheckin_Checkin1_idx` (`Checkin_idCheckin` ASC),
  INDEX `fk_detalleTipohuespedCheckin_tipoHuesped1_idx` (`tipoHuesped_idTipoHuesped` ASC),
  CONSTRAINT `fk_detalleTipohuespedCheckin_Checkin1`
    FOREIGN KEY (`Checkin_idCheckin`)
    REFERENCES `hotelfase2`.`Checkin` (`idCheckin`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalleTipohuespedCheckin_tipoHuesped1`
    FOREIGN KEY (`tipoHuesped_idTipoHuesped`)
    REFERENCES `hotelfase2`.`tipoHuesped` (`idTipoHuesped`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotelfase2`.`Folio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotelfase2`.`Folio` (
  `id_gasto` INT NOT NULL AUTO_INCREMENT,
  `habitacion` INT NULL,
  `tipoCliente` VARCHAR(45) NULL,
  `Nombre` VARCHAR(45) NULL,
  `Apellido` VARCHAR(45) NULL,
  `Servicio` VARCHAR(45) NULL,
  `fecha` DATETIME NULL,
  `monto` INT NULL,
  `descripcion` VARCHAR(45) NULL,
  `Id_reservacion` INT(11) NOT NULL,
  PRIMARY KEY (`id_gasto`, `Id_reservacion`),
  INDEX `fk_Folio_reservacion1_idx` (`Id_reservacion` ASC),
  CONSTRAINT `fk_Folio_reservacion1`
    FOREIGN KEY (`Id_reservacion`)
    REFERENCES `hotelfase2`.`reservacion` (`idReservacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

insert into cliente values(0,000,"Consumidor final","Consumidor final","0 avenida","Guatemala","Guatemala",000,"Consumidor final",1);
insert into checkin values(1,"2017-02-02","2017-02-02",1,1);
insert into checkin values(3,"2017-03-03","2017-03-03",3,3);
insert into reservacion values(0,"2017-01-01","2017-02-02","si","final","final",0,"Doble");
select * from tipohabitacion;
insert into habitacion values(0,"Si",2,"Doble","Dos camas",000);
select * from reservacion;
insert into reservacion values();
insert into reservacion values(0,"2017-01-01","2017-01-01","Si","Consumidor","Final",0,"Ninguno");
create view reporte_tipohabitacion as select * from tipohabitacion;
create view reporte_habitacion as select * from habitacion;
create view reporte_folio as select * from folio;
create view reporte_reservacion as select * from reservacion;
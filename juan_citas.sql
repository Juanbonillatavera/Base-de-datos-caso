-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 07-04-2022 a las 15:25:54
-- Versión del servidor: 5.7.33
-- Versión de PHP: 7.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;

SET time_zone = "+00:00";
/*!40101 
SET @OLD_CHARACTER_SET_CLIENT = @@CHARACTER_SET_CLIENT */;
/*!40101 
SET @OLD_CHARACTER_SET_RESULTS = @@CHARACTER_SET_RESULTS */;
/*!40101 
SET @OLD_COLLATION_CONNECTION = @@COLLATION_CONNECTION */;
/*!40101 
SET NAMES utf8mb4 */;--
-- Base de datos: `juan_citas`
--
-- --------------------------------------------------------
--
-- Estructura de tabla para la tabla `citas`
--
CREATE TABLE `citas` (
	`citnumero` INT ( 11 ) NOT NULL,
	`citfecha` date NOT NULL,
	`cithora` VARCHAR ( 10 ) NOT NULL,
	`citpaciente` VARCHAR ( 10 ) NOT NULL,
	`citmedico` VARCHAR ( 10 ) NOT NULL,
	`citconsultorio` INT ( 3 ) NOT NULL,
	`citestado` enum ( 'asignada', 'cumplida' ) NOT NULL DEFAULT 'asignada' 
) ENGINE = INNODB DEFAULT CHARSET = latin1;-- --------------------------------------------------------
--
-- Estructura de tabla para la tabla `consultorios`
--
CREATE TABLE `consultorios` ( `connumero` INT ( 3 ) NOT NULL, `connombre` VARCHAR ( 50 ) NOT NULL ) ENGINE = INNODB DEFAULT CHARSET = latin1;-- --------------------------------------------------------
--
-- Estructura de tabla para la tabla `medicos`
--
CREATE TABLE `medicos` ( `medidentificacion` VARCHAR ( 10 ) NOT NULL, `mednombres` VARCHAR ( 50 ) NOT NULL, `medapellidos` VARCHAR ( 50 ) NOT NULL ) ENGINE = INNODB DEFAULT CHARSET = latin1;-- --------------------------------------------------------
--
-- Estructura de tabla para la tabla `pacientes`
--
CREATE TABLE `pacientes` (
	`pacidentificacion` VARCHAR ( 10 ) NOT NULL,
	`pacnombres` VARCHAR ( 50 ) NOT NULL,
	`pacapellidos` VARCHAR ( 50 ) NOT NULL,
	`pacfechanacimiento` date NOT NULL,
	`pacsexo` enum ( 'M', 'f' ) NOT NULL 
) ENGINE = INNODB DEFAULT CHARSET = latin1;--
-- Volcado de datos para la tabla `pacientes`
--
INSERT INTO `pacientes` ( `pacidentificacion`, `pacnombres`, `pacapellidos`, `pacfechanacimiento`, `pacsexo` )
VALUES
	( '1098343678', 'Juan Antonio', 'Perez Pereira', '1978-08-09', 'M' ),
	( '29234333', 'Alejandra Marcela', 'Diaz Granados', '1980-03-24', 'f' ),
	( '37456298', 'Diana Marcela', 'Estevez', '1985-09-06', 'f' ),
	( '91222333', 'Carlos Jesus', 'Rodriguez Cala', '1970-01-23', 'M' );-- --------------------------------------------------------
--
-- Estructura de tabla para la tabla `tratamientos`
--
CREATE TABLE `tratamientos` (
	`tranumero` INT ( 11 ) NOT NULL,
	`trafechaasignado` date NOT NULL,
	`tradescripcion` text NOT NULL,
	`trafechainicio` date NOT NULL,
	`trafechafin` date NOT NULL,
	`traobservaciones` text NOT NULL,
	`trapaciente` VARCHAR ( 10 ) NOT NULL 
) ENGINE = INNODB DEFAULT CHARSET = latin1;--
-- Volcado de datos para la tabla `tratamientos`
--
INSERT INTO `tratamientos` ( `tranumero`, `trafechaasignado`, `tradescripcion`, `trafechainicio`, `trafechafin`, `traobservaciones`, `trapaciente` )
VALUES
	( 1, '2017-07-13', 'Tratamiento de conductos', '2017-08-01', '2017-08-03', 'paciente con hipertension', '91222333' ),
	( 2, '2017-07-13', 'Tratamiento de conductos', '2017-08-01', '2017-08-03', 'paciente con hipertension', '91222333' ),
	( 3, '2017-07-02', 'profilaxis', '2017-07-02', '2017-07-02', 'sin novedad', '1098343678' ),
	( 4, '2017-06-05', 'resina', '2017-06-05', '2017-06-05', 'paciente con sensibilidad', '37456298' );--
-- Índices para tablas volcadas
--
--
-- Indices de la tabla `citas`
--
ALTER TABLE `citas` ADD PRIMARY KEY ( `citnumero` ),
ADD KEY `citpaciente` ( `citpaciente` ),
ADD KEY `citmedico` ( `citmedico` ),
ADD KEY `citconsultorio` ( `citconsultorio` );--
-- Indices de la tabla `consultorios`
--
ALTER TABLE `consultorios` ADD PRIMARY KEY ( `connumero` );--
-- Indices de la tabla `medicos`
--
ALTER TABLE `medicos` ADD PRIMARY KEY ( `medidentificacion` );--
-- Indices de la tabla `pacientes`
--
ALTER TABLE `pacientes` ADD PRIMARY KEY ( `pacidentificacion` );--
-- Indices de la tabla `tratamientos`
--
ALTER TABLE `tratamientos` ADD PRIMARY KEY ( `tranumero` ),
ADD KEY `trapaciente` ( `trapaciente` );--
-- AUTO_INCREMENT de las tablas volcadas
--
--
-- AUTO_INCREMENT de la tabla `citas`
--
ALTER TABLE `citas` MODIFY `citnumero` INT ( 11 ) NOT NULL AUTO_INCREMENT;--
-- AUTO_INCREMENT de la tabla `tratamientos`
--
ALTER TABLE `tratamientos` MODIFY `tranumero` INT ( 11 ) NOT NULL AUTO_INCREMENT,
AUTO_INCREMENT = 5;--
-- Restricciones para tablas volcadas
--
--
-- Filtros para la tabla `citas`
--
ALTER TABLE `citas` ADD CONSTRAINT `citas_ibfk_1` FOREIGN KEY ( `citpaciente` ) REFERENCES `pacientes` ( `pacidentificacion` ),
ADD CONSTRAINT `citas_ibfk_2` FOREIGN KEY ( `citmedico` ) REFERENCES `medicos` ( `medidentificacion` ),
ADD CONSTRAINT `citas_ibfk_3` FOREIGN KEY ( `citconsultorio` ) REFERENCES `consultorios` ( `connumero` );--
-- Filtros para la tabla `tratamientos`
--
ALTER TABLE `tratamientos` ADD CONSTRAINT `tratamientos_ibfk_1` FOREIGN KEY ( `trapaciente` ) REFERENCES `pacientes` ( `pacidentificacion` );
COMMIT;
/*!40101 
SET CHARACTER_SET_CLIENT = @OLD_CHARACTER_SET_CLIENT */;
/*!40101 
SET CHARACTER_SET_RESULTS = @OLD_CHARACTER_SET_RESULTS */;
/*!40101 
SET COLLATION_CONNECTION = @OLD_COLLATION_CONNECTION */;
-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 25-03-2022 a las 13:57:18
-- Versión del servidor: 5.7.33
-- Versión de PHP: 7.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tiendadeportes3`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `cod_cliente` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `nom_cliente` varchar(30) NOT NULL,
  `ape_cliente` varchar(30) NOT NULL,
  `ciudad_cliente` varchar(30) NOT NULL,
  `fec_cliente` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`cod_cliente`, `id_cliente`, `nom_cliente`, `ape_cliente`, `ciudad_cliente`, `fec_cliente`) VALUES
(3416, 1006124903, 'Juan Esteban ', 'Bonilla', 'Ibague', '2022-03-25');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `leg_empleado` int(11) NOT NULL,
  `id_empleado` int(11) NOT NULL,
  `nom_empleado` varchar(30) NOT NULL,
  `dir_empleado` varchar(30) NOT NULL,
  `turno_cod_turno` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`leg_empleado`, `id_empleado`, `nom_empleado`, `dir_empleado`, `turno_cod_turno`) VALUES
(78, 100828393, 'Lagunitas tell', 'spm6 mz 6 casa 16 pola', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fabrica`
--

CREATE TABLE `fabrica` (
  `nit_fabrica` int(11) NOT NULL,
  `nom_fabrica` varchar(30) NOT NULL,
  `pas_fabrica` varchar(30) NOT NULL,
  `dir_empleado` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `fabrica`
--

INSERT INTO `fabrica` (`nit_fabrica`, `nom_fabrica`, `pas_fabrica`, `dir_empleado`) VALUES
(156127712, 'Exportara.lta', 'Colombia', 'carrera 18 avenida 9 risaralda');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `cod_producto` varchar(30) NOT NULL,
  `des_producto` varchar(30) NOT NULL,
  `col_producto` varchar(30) NOT NULL,
  `costo_producto` decimal(10,0) NOT NULL,
  `fabrica_nit_fabrica` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`cod_producto`, `des_producto`, `col_producto`, `costo_producto`, `fabrica_nit_fabrica`) VALUES
('2876A', 'Jabon para el aseo', 'rojo', '5000', 156127712);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sucursal`
--

CREATE TABLE `sucursal` (
  `num_sucursal` int(11) NOT NULL,
  `dir_sucursal` varchar(30) NOT NULL,
  `ciudad_sucursal` varchar(30) NOT NULL,
  `cliente_cod_cliente` int(11) NOT NULL,
  `producto_cod_producto` varchar(30) NOT NULL,
  `empleado_leg_empleado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `sucursal`
--

INSERT INTO `sucursal` (`num_sucursal`, `dir_sucursal`, `ciudad_sucursal`, `cliente_cod_cliente`, `producto_cod_producto`, `empleado_leg_empleado`) VALUES
(3, 'carrera 4 estadio n8', 'Ibague', 3416, '2876A', 78);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tarjeta`
--

CREATE TABLE `tarjeta` (
  `num_tarjeta` int(11) NOT NULL,
  `fecven_tarjeta` date NOT NULL,
  `cliente_cod_cliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tarjeta`
--

INSERT INTO `tarjeta` (`num_tarjeta`, `fecven_tarjeta`, `cliente_cod_cliente`) VALUES
(7628924, '2023-02-02', 3416);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `turno`
--

CREATE TABLE `turno` (
  `hor_turno` varchar(30) NOT NULL,
  `dia_turno` date NOT NULL,
  `cod_turno` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `turno`
--

INSERT INTO `turno` (`hor_turno`, `dia_turno`, `cod_turno`) VALUES
('2:00 a 4:00', '2022-03-29', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `cod_venta` int(11) NOT NULL,
  `cliente_cod_cliente` int(11) NOT NULL,
  `producto_cod_producto` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `venta`
--

INSERT INTO `venta` (`cod_venta`, `cliente_cod_cliente`, `producto_cod_producto`) VALUES
(98, 3416, '2876A');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`cod_cliente`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`leg_empleado`,`turno_cod_turno`),
  ADD KEY `fk_empleado_turno1_idx` (`turno_cod_turno`);

--
-- Indices de la tabla `fabrica`
--
ALTER TABLE `fabrica`
  ADD PRIMARY KEY (`nit_fabrica`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`cod_producto`,`fabrica_nit_fabrica`),
  ADD KEY `fk_producto_fabrica1_idx` (`fabrica_nit_fabrica`);

--
-- Indices de la tabla `sucursal`
--
ALTER TABLE `sucursal`
  ADD PRIMARY KEY (`num_sucursal`,`cliente_cod_cliente`,`producto_cod_producto`,`empleado_leg_empleado`),
  ADD KEY `fk_sucursal_cliente1_idx` (`cliente_cod_cliente`),
  ADD KEY `fk_sucursal_producto1_idx` (`producto_cod_producto`),
  ADD KEY `fk_sucursal_empleado1_idx` (`empleado_leg_empleado`);

--
-- Indices de la tabla `tarjeta`
--
ALTER TABLE `tarjeta`
  ADD PRIMARY KEY (`num_tarjeta`,`cliente_cod_cliente`),
  ADD KEY `fk_tarjeta_cliente_idx` (`cliente_cod_cliente`);

--
-- Indices de la tabla `turno`
--
ALTER TABLE `turno`
  ADD PRIMARY KEY (`cod_turno`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`cod_venta`,`cliente_cod_cliente`,`producto_cod_producto`),
  ADD KEY `fk_venta_cliente1_idx` (`cliente_cod_cliente`),
  ADD KEY `fk_venta_producto1_idx` (`producto_cod_producto`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `fk_empleado_turno1` FOREIGN KEY (`turno_cod_turno`) REFERENCES `turno` (`cod_turno`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `fk_producto_fabrica1` FOREIGN KEY (`fabrica_nit_fabrica`) REFERENCES `fabrica` (`nit_fabrica`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `sucursal`
--
ALTER TABLE `sucursal`
  ADD CONSTRAINT `fk_sucursal_cliente1` FOREIGN KEY (`cliente_cod_cliente`) REFERENCES `cliente` (`cod_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_sucursal_empleado1` FOREIGN KEY (`empleado_leg_empleado`) REFERENCES `empleado` (`leg_empleado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_sucursal_producto1` FOREIGN KEY (`producto_cod_producto`) REFERENCES `producto` (`cod_producto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tarjeta`
--
ALTER TABLE `tarjeta`
  ADD CONSTRAINT `fk_tarjeta_cliente` FOREIGN KEY (`cliente_cod_cliente`) REFERENCES `cliente` (`cod_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `venta`
--
ALTER TABLE `venta`
  ADD CONSTRAINT `fk_venta_cliente1` FOREIGN KEY (`cliente_cod_cliente`) REFERENCES `cliente` (`cod_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_venta_producto1` FOREIGN KEY (`producto_cod_producto`) REFERENCES `producto` (`cod_producto`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

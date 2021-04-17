-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-04-2021 a las 03:53:24
-- Versión del servidor: 10.4.18-MariaDB
-- Versión de PHP: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `php_test`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamentos`
--

CREATE TABLE `departamentos` (
  `id` int(11) NOT NULL,
  `departamento` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sucursal` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `departamentos`
--

INSERT INTO `departamentos` (`id`, `departamento`, `sucursal`) VALUES
(1, 'ventas', 'tijuana'),
(2, 'rh', 'tijuana'),
(3, 'TI', 'tijuana');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

CREATE TABLE `inventario` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `modelo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8_unicode_ci NOT NULL,
  `precio` float NOT NULL,
  `cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `inventario`
--

INSERT INTO `inventario` (`id`, `nombre`, `modelo`, `descripcion`, `precio`, `cantidad`) VALUES
(45, 'AMD', 'RYZEN 2700X', 'PROCESADOR AMD DE SEGUNDA GENERACIÓN, SOCKET AM4', 250, 0),
(46, 'AMD', 'RYZEN 5600X', 'PROCESADOR AMD DE CUARTA GENERACIÓN COMPATIBLE CON SOCKET AM4', 399, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rh`
--

CREATE TABLE `rh` (
  `id_empleado` int(11) NOT NULL,
  `nombres` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `apellido_paterno` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `apellido_materno` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `telefono` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `nacionalidad` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `departamento` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `rh`
--

INSERT INTO `rh` (`id_empleado`, `nombres`, `apellido_paterno`, `apellido_materno`, `telefono`, `email`, `nacionalidad`, `departamento`) VALUES
(3, 'Joe', 'Doe', 'Doe', '1234567', 'jd@bderp.com', 'Brasileña', 'ventas'),
(5, 'fernando alejandro', 'leon', 'carrizoza', '6641234468', 'falc@bderp.com', 'mexicana', 'TI'),
(10, 'Juan', 'Lopez', 'Lopez', '995263654', 'j.perez@bitdesign.com', 'mexicana', 'ventas'),
(12, 'Franco', 'Flores', 'Flores', '1234567', 'ff@bderp.com', 'mexicana', 'rh');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `ID` int(11) NOT NULL,
  `Nombre` varchar(15) NOT NULL,
  `contraseña` varchar(25) NOT NULL,
  `correo` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`ID`, `Nombre`, `contraseña`, `correo`) VALUES
(1, 'admin', 'admin', 'aa@asd.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id_ventas` int(11) NOT NULL,
  `id_empleado_venta` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `fecha_venta` date NOT NULL DEFAULT current_timestamp(),
  `valor_venta` float DEFAULT NULL,
  `id_producto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`id_ventas`, `id_empleado_venta`, `cantidad`, `fecha_venta`, `valor_venta`, `id_producto`) VALUES
(141, 3, 1, '2021-04-07', 250, 45),
(142, 10, 1, '2021-04-07', 399, 46),
(144, 3, 1, '2021-04-11', 250, 45);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `departamento` (`departamento`);

--
-- Indices de la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `precio` (`precio`);

--
-- Indices de la tabla `rh`
--
ALTER TABLE `rh`
  ADD PRIMARY KEY (`id_empleado`),
  ADD KEY `departamento` (`departamento`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id_ventas`),
  ADD KEY `id_producto` (`id_producto`),
  ADD KEY `id_empleado_venta` (`id_empleado_venta`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `inventario`
--
ALTER TABLE `inventario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT de la tabla `rh`
--
ALTER TABLE `rh`
  MODIFY `id_empleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id_ventas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=145;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `rh`
--
ALTER TABLE `rh`
  ADD CONSTRAINT `rh_ibfk_1` FOREIGN KEY (`departamento`) REFERENCES `departamentos` (`departamento`);

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `inventario` (`id`),
  ADD CONSTRAINT `ventas_ibfk_2` FOREIGN KEY (`id_empleado_venta`) REFERENCES `rh` (`id_empleado`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 27, 2021 at 10:31 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `php_test`
--

-- --------------------------------------------------------

--
-- Table structure for table `departamentos`
--

CREATE TABLE `departamentos` (
  `id` int(11) NOT NULL,
  `departamento` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sucursal` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `departamentos`
--

INSERT INTO `departamentos` (`id`, `departamento`, `sucursal`) VALUES
(1, 'ventas', 'tijuana'),
(2, 'rh', 'tijuana'),
(3, 'TI', 'tijuana');

-- --------------------------------------------------------

--
-- Table structure for table `inventario`
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
-- Dumping data for table `inventario`
--

INSERT INTO `inventario` (`id`, `nombre`, `modelo`, `descripcion`, `precio`, `cantidad`) VALUES
(41, 'AMD', '2700x', 'desc', 250, 100),
(42, 'AMD', '2600x', '...', 100, 20),
(43, 'Intel', '11700k', '...', 399, 11);

-- --------------------------------------------------------

--
-- Table structure for table `rh`
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
-- Dumping data for table `rh`
--

INSERT INTO `rh` (`id_empleado`, `nombres`, `apellido_paterno`, `apellido_materno`, `telefono`, `email`, `nacionalidad`, `departamento`) VALUES
(3, 'Joe', 'Doe', 'Doe', '1234567', 'jd@bderp.com', 'Brasileña', 'ventas'),
(5, 'fernando alejandro', 'leon', 'carrizoza', '6641234468', 'falc@bderp.com', 'mexicana', 'TI'),
(10, 'Juan', 'Lopez', 'Lopez', '995263654', 'j.perez@bitdesign.com', 'mexicana', 'ventas'),
(12, 'Franco', 'Flores', 'Flores', '1234567', 'ff@bderp.com', 'mexicana', 'rh'),
(13, 'xxxxxxx', 'x', 'x', 'x', 'x@x.com', 'x', 'TI');

-- --------------------------------------------------------

--
-- Table structure for table `ventas`
--

CREATE TABLE `ventas` (
  `id_ventas` int(11) NOT NULL,
  `id_empleado_venta` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `fecha_venta` datetime NOT NULL DEFAULT current_timestamp(),
  `valor_venta` decimal(10,0) DEFAULT NULL,
  `id_producto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ventas`
--

INSERT INTO `ventas` (`id_ventas`, `id_empleado_venta`, `cantidad`, `fecha_venta`, `valor_venta`, `id_producto`) VALUES
(54, 3, 10, '2021-03-24 16:12:46', NULL, 41);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `departamentos`
--
ALTER TABLE `departamentos`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `departamento` (`departamento`);

--
-- Indexes for table `inventario`
--
ALTER TABLE `inventario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `precio` (`precio`);

--
-- Indexes for table `rh`
--
ALTER TABLE `rh`
  ADD PRIMARY KEY (`id_empleado`),
  ADD KEY `departamento` (`departamento`);

--
-- Indexes for table `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id_ventas`),
  ADD KEY `id_producto` (`id_producto`),
  ADD KEY `id_empleado_venta` (`id_empleado_venta`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `departamentos`
--
ALTER TABLE `departamentos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `inventario`
--
ALTER TABLE `inventario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `rh`
--
ALTER TABLE `rh`
  MODIFY `id_empleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id_ventas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `rh`
--
ALTER TABLE `rh`
  ADD CONSTRAINT `rh_ibfk_1` FOREIGN KEY (`departamento`) REFERENCES `departamentos` (`departamento`);

--
-- Constraints for table `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `inventario` (`id`),
  ADD CONSTRAINT `ventas_ibfk_2` FOREIGN KEY (`id_empleado_venta`) REFERENCES `rh` (`id_empleado`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-07-2020 a las 10:03:14
-- Versión del servidor: 10.4.13-MariaDB
-- Versión de PHP: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `Cul_D_Ampolla`
--
CREATE DATABASE IF NOT EXISTS `Cul_D_Ampolla` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `Cul_D_Ampolla`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Clients`
--

DROP TABLE IF EXISTS `Clients`;
CREATE TABLE `Clients` (
  `id_client` int(11) NOT NULL,
  `nom` varchar(45) DEFAULT NULL,
  `adreca` varchar(45) DEFAULT NULL,
  `telefon` varchar(20) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `data_registre` timestamp(1) NULL DEFAULT current_timestamp(1)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `Clients`
--

INSERT INTO `Clients` (`id_client`, `nom`, `adreca`, `telefon`, `email`, `data_registre`) VALUES
(1, 'Antonio González Parra', 'Amílcar, 56 3-4', '93 442 23 23', 'agp@gmail.com', '2020-07-01 06:56:00.0'),
(2, 'José Vélez González', 'Guipúzcoa, 33 6-2', '93 442 23 24', 'jvg@gmail.com', '2020-02-04 07:56:00.0');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Empleats`
--

DROP TABLE IF EXISTS `Empleats`;
CREATE TABLE `Empleats` (
  `id_empleat` int(11) NOT NULL,
  `nom` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `Empleats`
--

INSERT INTO `Empleats` (`id_empleat`, `nom`) VALUES
(1, 'Juan Ramón Ortiz'),
(2, 'Óscar Rodríguez');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Marques`
--

DROP TABLE IF EXISTS `Marques`;
CREATE TABLE `Marques` (
  `id_marca` int(11) NOT NULL,
  `nom` varchar(45) DEFAULT NULL,
  `proveidor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `Marques`
--

INSERT INTO `Marques` (`id_marca`, `nom`, `proveidor`) VALUES
(1, 'Dolçe Gabana', 1),
(2, 'Dior', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Proveidors`
--

DROP TABLE IF EXISTS `Proveidors`;
CREATE TABLE `Proveidors` (
  `id_proveidor` int(11) NOT NULL,
  `nom` varchar(45) DEFAULT NULL,
  `carrer` varchar(45) DEFAULT NULL,
  `numero` varchar(5) DEFAULT NULL,
  `pis` varchar(2) DEFAULT NULL,
  `porta` varchar(2) DEFAULT NULL,
  `ciutat` varchar(30) DEFAULT NULL,
  `codi_postal` varchar(5) DEFAULT NULL,
  `pais` varchar(15) DEFAULT NULL,
  `telefon` varchar(15) DEFAULT NULL,
  `fax` varchar(15) DEFAULT NULL,
  `nif` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `Proveidors`
--

INSERT INTO `Proveidors` (`id_proveidor`, `nom`, `carrer`, `numero`, `pis`, `porta`, `ciutat`, `codi_postal`, `pais`, `telefon`, `fax`, `nif`) VALUES
(1, 'Proveidor1', 'Carrer1', '1', '1', '1', 'Barcelona', '08080', 'Espanya', '93 444 22 11', '93 444 22 12', '80303933X'),
(2, 'Proveidor2', 'Carrer2', '2', '2', '2', 'Barcelona', '08080', 'Espanya', '93 444 22 21', '93 444 22 22', '80303934X');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ProveidorsUlleres`
--

DROP TABLE IF EXISTS `ProveidorsUlleres`;
CREATE TABLE `ProveidorsUlleres` (
  `id_proveidorUllera` int(11) NOT NULL,
  `codi_proveidor` int(11) DEFAULT NULL,
  `codi_ullera` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ProveidorsUlleres`
--

INSERT INTO `ProveidorsUlleres` (`id_proveidorUllera`, `codi_proveidor`, `codi_ullera`) VALUES
(1, 1, 1),
(2, 2, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Ulleres`
--

DROP TABLE IF EXISTS `Ulleres`;
CREATE TABLE `Ulleres` (
  `id_ullera` int(11) NOT NULL,
  `proveidor` int(11) DEFAULT NULL,
  `marca` int(11) DEFAULT NULL,
  `model` varchar(45) DEFAULT NULL,
  `graduacio_vidre_esquerre` float DEFAULT NULL,
  `graduacio_vidre_dret` float DEFAULT NULL,
  `tipus_muntura` int(11) DEFAULT NULL,
  `color_muntura` varchar(45) DEFAULT NULL,
  `color_vidre_esquerre` varchar(15) DEFAULT NULL,
  `color_vidre_dret` varchar(15) DEFAULT NULL,
  `preu` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `Ulleres`
--

INSERT INTO `Ulleres` (`id_ullera`, `proveidor`, `marca`, `model`, `graduacio_vidre_esquerre`, `graduacio_vidre_dret`, `tipus_muntura`, `color_muntura`, `color_vidre_esquerre`, `color_vidre_dret`, `preu`) VALUES
(1, 1, 1, '232', 1.3, 2.1, 0, 'negre', '2', '2', 399),
(2, 2, 1, '322', 1, 2, 0, 'gris', '2', '2', 200);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Vendes`
--

DROP TABLE IF EXISTS `Vendes`;
CREATE TABLE `Vendes` (
  `id_venda` int(11) NOT NULL,
  `empleat` int(11) DEFAULT NULL,
  `codi_ullera` int(11) DEFAULT NULL,
  `codi_client` int(11) DEFAULT NULL,
  `data_venda` timestamp(1) NULL DEFAULT current_timestamp(1)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `Vendes`
--

INSERT INTO `Vendes` (`id_venda`, `empleat`, `codi_ullera`, `codi_client`, `data_venda`) VALUES
(1, 1, 1, 1, '0000-00-00 00:00:00.0');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `Clients`
--
ALTER TABLE `Clients`
  ADD PRIMARY KEY (`id_client`);

--
-- Indices de la tabla `Empleats`
--
ALTER TABLE `Empleats`
  ADD PRIMARY KEY (`id_empleat`);

--
-- Indices de la tabla `Marques`
--
ALTER TABLE `Marques`
  ADD PRIMARY KEY (`id_marca`);

--
-- Indices de la tabla `Proveidors`
--
ALTER TABLE `Proveidors`
  ADD PRIMARY KEY (`id_proveidor`);

--
-- Indices de la tabla `ProveidorsUlleres`
--
ALTER TABLE `ProveidorsUlleres`
  ADD PRIMARY KEY (`id_proveidorUllera`);

--
-- Indices de la tabla `Ulleres`
--
ALTER TABLE `Ulleres`
  ADD PRIMARY KEY (`id_ullera`),
  ADD KEY `FK_Proveidor` (`proveidor`),
  ADD KEY `FK_Marca` (`marca`);

--
-- Indices de la tabla `Vendes`
--
ALTER TABLE `Vendes`
  ADD PRIMARY KEY (`id_venda`),
  ADD KEY `fk_empleat` (`empleat`),
  ADD KEY `fk_ullera` (`codi_ullera`),
  ADD KEY `fk_client` (`codi_client`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `Clients`
--
ALTER TABLE `Clients`
  MODIFY `id_client` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `Empleats`
--
ALTER TABLE `Empleats`
  MODIFY `id_empleat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `Marques`
--
ALTER TABLE `Marques`
  MODIFY `id_marca` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `Proveidors`
--
ALTER TABLE `Proveidors`
  MODIFY `id_proveidor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `ProveidorsUlleres`
--
ALTER TABLE `ProveidorsUlleres`
  MODIFY `id_proveidorUllera` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `Ulleres`
--
ALTER TABLE `Ulleres`
  MODIFY `id_ullera` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `Vendes`
--
ALTER TABLE `Vendes`
  MODIFY `id_venda` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `Proveidors`
--
ALTER TABLE `Proveidors`
  ADD CONSTRAINT `proveidors_ibfk_1` FOREIGN KEY (`id_proveidor`) REFERENCES `ProveidorsUlleres` (`id_proveidorUllera`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `Ulleres`
--
ALTER TABLE `Ulleres`
  ADD CONSTRAINT `FK_Marca` FOREIGN KEY (`marca`) REFERENCES `Marques` (`id_marca`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_Proveidor` FOREIGN KEY (`proveidor`) REFERENCES `Proveidors` (`id_proveidor`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `Vendes`
--
ALTER TABLE `Vendes`
  ADD CONSTRAINT `fk_client` FOREIGN KEY (`codi_client`) REFERENCES `Clients` (`id_client`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_empleat` FOREIGN KEY (`empleat`) REFERENCES `Empleats` (`id_empleat`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ullera` FOREIGN KEY (`codi_ullera`) REFERENCES `Ulleres` (`id_ullera`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

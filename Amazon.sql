-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-07-2020 a las 20:22:26
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
-- Base de datos: `Amazon`
--
CREATE DATABASE IF NOT EXISTS `Amazon` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `Amazon`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Autor`
--

DROP TABLE IF EXISTS `Autor`;
CREATE TABLE `Autor` (
  `id_autor` int(11) NOT NULL,
  `nom` varchar(45) DEFAULT NULL,
  `adreca` varchar(100) DEFAULT NULL,
  `llibres_escrits` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Cataleg`
--

DROP TABLE IF EXISTS `Cataleg`;
CREATE TABLE `Cataleg` (
  `id_llibre` int(10) NOT NULL,
  `titol` varchar(100) DEFAULT NULL,
  `autor` int(11) DEFAULT NULL,
  `unitats` int(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Facturas`
--

DROP TABLE IF EXISTS `Facturas`;
CREATE TABLE `Facturas` (
  `id_factura` int(11) NOT NULL,
  `id_llibre` int(11) DEFAULT NULL,
  `id_usuari` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Usuaris`
--

DROP TABLE IF EXISTS `Usuaris`;
CREATE TABLE `Usuaris` (
  `id_usuari` int(11) NOT NULL,
  `nom` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `contrasenya` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `Autor`
--
ALTER TABLE `Autor`
  ADD PRIMARY KEY (`id_autor`),
  ADD UNIQUE KEY `id_autor_UNIQUE` (`id_autor`);

--
-- Indices de la tabla `Cataleg`
--
ALTER TABLE `Cataleg`
  ADD PRIMARY KEY (`id_llibre`),
  ADD KEY `FK_autor` (`autor`);

--
-- Indices de la tabla `Facturas`
--
ALTER TABLE `Facturas`
  ADD PRIMARY KEY (`id_factura`),
  ADD UNIQUE KEY `id_factura_UNIQUE` (`id_factura`),
  ADD KEY `FK_llibre` (`id_llibre`),
  ADD KEY `FK_usuari` (`id_usuari`);

--
-- Indices de la tabla `Usuaris`
--
ALTER TABLE `Usuaris`
  ADD PRIMARY KEY (`id_usuari`),
  ADD UNIQUE KEY `id_usuaris_UNIQUE` (`id_usuari`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `Cataleg`
--
ALTER TABLE `Cataleg`
  MODIFY `id_llibre` int(10) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `Cataleg`
--
ALTER TABLE `Cataleg`
  ADD CONSTRAINT `FK_autor` FOREIGN KEY (`autor`) REFERENCES `Autor` (`id_autor`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `Facturas`
--
ALTER TABLE `Facturas`
  ADD CONSTRAINT `FK_llibre` FOREIGN KEY (`id_llibre`) REFERENCES `Cataleg` (`id_llibre`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_usuari` FOREIGN KEY (`id_usuari`) REFERENCES `Usuaris` (`id_usuari`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-07-2020 a las 20:20:37
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
-- Base de datos: `Quadres`
--
CREATE DATABASE IF NOT EXISTS `Quadres` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci;
USE `Quadres`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Autor`
--

DROP TABLE IF EXISTS `Autor`;
CREATE TABLE `Autor` (
  `id_autor` int(11) NOT NULL,
  `nom` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `cognoms` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Comprador`
--

DROP TABLE IF EXISTS `Comprador`;
CREATE TABLE `Comprador` (
  `id_comprador` int(11) NOT NULL,
  `nom` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `cognom` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `dni` varchar(10) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Quadre`
--

DROP TABLE IF EXISTS `Quadre`;
CREATE TABLE `Quadre` (
  `id_quadre` int(11) NOT NULL,
  `preu` int(11) DEFAULT NULL,
  `id_autor` int(11) DEFAULT NULL,
  `id_comprador` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `Autor`
--
ALTER TABLE `Autor`
  ADD PRIMARY KEY (`id_autor`),
  ADD UNIQUE KEY `autor_id_UNIQUE` (`id_autor`);

--
-- Indices de la tabla `Comprador`
--
ALTER TABLE `Comprador`
  ADD PRIMARY KEY (`id_comprador`),
  ADD UNIQUE KEY `id_comprador_UNIQUE` (`id_comprador`);

--
-- Indices de la tabla `Quadre`
--
ALTER TABLE `Quadre`
  ADD PRIMARY KEY (`id_quadre`),
  ADD UNIQUE KEY `id_quadre_UNIQUE` (`id_quadre`),
  ADD KEY `FK_autor` (`id_autor`),
  ADD KEY `FK_comprador` (`id_comprador`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `Quadre`
--
ALTER TABLE `Quadre`
  ADD CONSTRAINT `FK_autor` FOREIGN KEY (`id_autor`) REFERENCES `Autor` (`id_autor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_comprador` FOREIGN KEY (`id_comprador`) REFERENCES `Comprador` (`id_comprador`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-07-2020 a las 20:18:36
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
-- Base de datos: `vueling`
--
CREATE DATABASE IF NOT EXISTS `vueling` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci;
USE `vueling`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Avions`
--

DROP TABLE IF EXISTS `Avions`;
CREATE TABLE `Avions` (
  `id_avio` int(11) NOT NULL,
  `capacitat` int(11) DEFAULT NULL,
  `model` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Seients`
--

DROP TABLE IF EXISTS `Seients`;
CREATE TABLE `Seients` (
  `id_seient` int(11) DEFAULT NULL,
  `avio_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `Avions`
--
ALTER TABLE `Avions`
  ADD PRIMARY KEY (`id_avio`),
  ADD UNIQUE KEY `id_avio_UNIQUE` (`id_avio`);

--
-- Indices de la tabla `Seients`
--
ALTER TABLE `Seients`
  ADD UNIQUE KEY `id_seient_UNIQUE` (`id_seient`),
  ADD KEY `id_avion` (`avio_id`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `Avions`
--
ALTER TABLE `Avions`
  ADD CONSTRAINT `FK_Avio` FOREIGN KEY (`id_avio`) REFERENCES `Seients` (`avio_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

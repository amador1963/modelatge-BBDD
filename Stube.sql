-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-07-2020 a las 20:21:00
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
-- Base de datos: `Stube`
--
CREATE DATABASE IF NOT EXISTS `Stube` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `Stube`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Usuaris`
--

DROP TABLE IF EXISTS `Usuaris`;
CREATE TABLE `Usuaris` (
  `id_usuari` int(11) NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `contrasenya` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Videos`
--

DROP TABLE IF EXISTS `Videos`;
CREATE TABLE `Videos` (
  `id_video` int(11) NOT NULL,
  `id_usuari` int(11) DEFAULT NULL,
  `titol` varchar(45) DEFAULT NULL,
  `descripcio` varchar(45) DEFAULT NULL,
  `url` varchar(45) DEFAULT NULL,
  `identificador` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `Usuaris`
--
ALTER TABLE `Usuaris`
  ADD PRIMARY KEY (`id_usuari`),
  ADD UNIQUE KEY `id_usuari_UNIQUE` (`id_usuari`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indices de la tabla `Videos`
--
ALTER TABLE `Videos`
  ADD PRIMARY KEY (`id_video`),
  ADD UNIQUE KEY `id_video_UNIQUE` (`id_video`),
  ADD KEY `id_usuari` (`id_usuari`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `Videos`
--
ALTER TABLE `Videos`
  ADD CONSTRAINT `id_usuari` FOREIGN KEY (`id_usuari`) REFERENCES `Usuaris` (`id_usuari`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-07-2020 a las 20:26:32
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
-- Base de datos: `XarxaSocial`
--
CREATE DATABASE IF NOT EXISTS `XarxaSocial` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `XarxaSocial`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Amics`
--

DROP TABLE IF EXISTS `Amics`;
CREATE TABLE `Amics` (
  `id_amic` int(11) NOT NULL,
  `id_usuari1` int(11) NOT NULL,
  `id_usuari2` int(11) NOT NULL,
  `informacioAmistat` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Fotos`
--

DROP TABLE IF EXISTS `Fotos`;
CREATE TABLE `Fotos` (
  `id_foto` int(11) NOT NULL,
  `id_usuari` int(11) NOT NULL,
  `adreca` varchar(100) NOT NULL,
  `url` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Usuaris`
--

DROP TABLE IF EXISTS `Usuaris`;
CREATE TABLE `Usuaris` (
  `id_usuari` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `contrasenya` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `Amics`
--
ALTER TABLE `Amics`
  ADD PRIMARY KEY (`id_amic`),
  ADD KEY `FK_usuari1` (`id_usuari1`),
  ADD KEY `FK_usuari2` (`id_usuari2`);

--
-- Indices de la tabla `Fotos`
--
ALTER TABLE `Fotos`
  ADD PRIMARY KEY (`id_foto`),
  ADD KEY `FK_usuari` (`id_usuari`);

--
-- Indices de la tabla `Usuaris`
--
ALTER TABLE `Usuaris`
  ADD PRIMARY KEY (`id_usuari`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `Amics`
--
ALTER TABLE `Amics`
  ADD CONSTRAINT `FK_usuari1` FOREIGN KEY (`id_usuari1`) REFERENCES `Usuaris` (`id_usuari`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_usuari2` FOREIGN KEY (`id_usuari2`) REFERENCES `Usuaris` (`id_usuari`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `Fotos`
--
ALTER TABLE `Fotos`
  ADD CONSTRAINT `FK_usuari` FOREIGN KEY (`id_usuari`) REFERENCES `Usuaris` (`id_usuari`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

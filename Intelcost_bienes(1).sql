-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 16-03-2021 a las 04:51:33
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.3.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `Intelcost_bienes`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Bienes`
--

CREATE TABLE `Bienes` (
  `id` int(11) NOT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `ciudad_id` int(11) NOT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `cp` varchar(5) DEFAULT NULL,
  `tipo_id` int(11) NOT NULL,
  `precio` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `Bienes`
--

INSERT INTO `Bienes` (`id`, `direccion`, `ciudad_id`, `telefono`, `cp`, `tipo_id`, `precio`) VALUES
(1, 'Ap #549-7395 Ut Rd.', 1, '3340520954', '85328', 1, 30746),
(2, 'P.O. Box 657, 9831 Cursus St.', 2, '488-441-5521', '04436', 2, 71045),
(3, 'Ap #325-2507 Quisque Av.', 3, '623-807-2869', '89804', 2, 36087),
(4, '347-866 Laoreet Road', 3, '997-640-8188', '94526', 2, 16048),
(5, '4732 Ipsum. Rd.', 4, '802-414-8872', '16295', 1, 45912);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Ciudades`
--

CREATE TABLE `Ciudades` (
  `id` int(11) NOT NULL,
  `nombreCiudad` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `Ciudades`
--

INSERT INTO `Ciudades` (`id`, `nombreCiudad`) VALUES
(1, 'New York'),
(2, 'Orlando'),
(3, 'Los Angeles'),
(4, 'Houston'),
(5, 'Washington'),
(6, 'Miami');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Guardados`
--

CREATE TABLE `Guardados` (
  `guardadoId` int(11) NOT NULL,
  `motivo` varchar(20) DEFAULT NULL,
  `bien_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `Guardados`
--

INSERT INTO `Guardados` (`guardadoId`, `motivo`, `bien_id`) VALUES
(1, 'TEST', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TiposBienes`
--

CREATE TABLE `TiposBienes` (
  `id` int(11) NOT NULL,
  `nombreTipo` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `TiposBienes`
--

INSERT INTO `TiposBienes` (`id`, `nombreTipo`) VALUES
(1, 'Casa'),
(2, 'Casa de Campo'),
(3, 'Apartamento');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `Bienes`
--
ALTER TABLE `Bienes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ciudad_id` (`ciudad_id`),
  ADD KEY `tipo_id` (`tipo_id`);

--
-- Indices de la tabla `Ciudades`
--
ALTER TABLE `Ciudades`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `Guardados`
--
ALTER TABLE `Guardados`
  ADD PRIMARY KEY (`guardadoId`),
  ADD KEY `bien_id` (`bien_id`);

--
-- Indices de la tabla `TiposBienes`
--
ALTER TABLE `TiposBienes`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `Bienes`
--
ALTER TABLE `Bienes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `Ciudades`
--
ALTER TABLE `Ciudades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `Guardados`
--
ALTER TABLE `Guardados`
  MODIFY `guardadoId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `TiposBienes`
--
ALTER TABLE `TiposBienes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `Bienes`
--
ALTER TABLE `Bienes`
  ADD CONSTRAINT `bienes_ibfk_1` FOREIGN KEY (`ciudad_id`) REFERENCES `ciudades` (`id`),
  ADD CONSTRAINT `bienes_ibfk_2` FOREIGN KEY (`tipo_id`) REFERENCES `TiposBienes` (`id`);

--
-- Filtros para la tabla `Guardados`
--
ALTER TABLE `Guardados`
  ADD CONSTRAINT `guardados_ibfk_1` FOREIGN KEY (`bien_id`) REFERENCES `Bienes` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

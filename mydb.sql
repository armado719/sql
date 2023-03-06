-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 05-03-2023 a las 19:06:19
-- Versión del servidor: 8.0.27
-- Versión de PHP: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `mydb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamentos`
--

DROP TABLE IF EXISTS `departamentos`;
CREATE TABLE IF NOT EXISTS `departamentos` (
  `departamento_id` int NOT NULL,
  `departamento_nombre` varchar(30) NOT NULL,
  `ubicaciones_ubicacion_id` int NOT NULL,
  PRIMARY KEY (`departamento_id`),
  KEY `fk_departamentos_ubicaciones1_idx` (`ubicaciones_ubicacion_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `departamentos`
--

INSERT INTO `departamentos` (`departamento_id`, `departamento_nombre`, `ubicaciones_ubicacion_id`) VALUES
(60, 'Antioquia', 51),
(61, 'valle', 50),
(62, 'Nariño', 54),
(63, 'Ecueador', 53),
(64, 'Meta', 52);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dependientes`
--

DROP TABLE IF EXISTS `dependientes`;
CREATE TABLE IF NOT EXISTS `dependientes` (
  `dependiente_id` int NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `vinculo` varchar(25) NOT NULL,
  `empleados_empleado_id` int NOT NULL,
  PRIMARY KEY (`dependiente_id`),
  KEY `fk_dependientes_empleados1_idx` (`empleados_empleado_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `dependientes`
--

INSERT INTO `dependientes` (`dependiente_id`, `nombre`, `apellido`, `vinculo`, `empleados_empleado_id`) VALUES
(569842, 'Pedro', 'rivera', 'cliente', 10023647),
(7542153, 'Lucia', 'Agular parra', 'Clente', 78412546),
(40123564, 'Martina ', 'FernandeZ', 'Contratista', 56213458),
(74125486, 'Milton ', 'Caicedo Lopez', 'Contratista', 10023647),
(450125410, 'Jhonatan', 'Maretinez Luna', 'Cliente', 58741254);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

DROP TABLE IF EXISTS `empleados`;
CREATE TABLE IF NOT EXISTS `empleados` (
  `empleado_id` int NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `apellido` varchar(25) NOT NULL,
  `email` varchar(100) NOT NULL,
  `numero_telefono` varchar(20) NOT NULL,
  `fecha_ingreso` date NOT NULL,
  `salario` decimal(10,0) NOT NULL,
  `gerencia_id` int NOT NULL,
  `departamentos_departamento_id` int NOT NULL,
  `trabajos_trabajo_id` int NOT NULL,
  PRIMARY KEY (`empleado_id`),
  KEY `fk_empleados_departamentos1_idx` (`departamentos_departamento_id`),
  KEY `fk_empleados_trabajos1_idx` (`trabajos_trabajo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`empleado_id`, `nombre`, `apellido`, `email`, `numero_telefono`, `fecha_ingreso`, `salario`, `gerencia_id`, `departamentos_departamento_id`, `trabajos_trabajo_id`) VALUES
(10023647, 'Carolina ', 'Diaz chavarro', 'diacar34@gmail.com', '3114578963', '2015-05-07', '16570000', 44, 60, 1008),
(40774015, 'Bernardo', 'Ramirez Lopez', 'bernardolp232@gamil.com', '3102547896', '2023-03-21', '1580000', 41, 62, 1005),
(56213458, 'Marta ', 'Riquelia osorio', 'marta874@gmail.com', '3054781254', '2014-05-08', '1265000', 43, 64, 1007),
(58741254, 'Caterine', 'Ramirez Enao', 'ramirecaty39@yahoo.es', '3214567895', '2000-02-09', '13650000', 45, 63, 1008),
(78412546, 'Alvaro', 'Lugo devia', 'alvaros2345@hotmailcom', '1204567895', '2023-03-22', '14580000', 42, 62, 1006);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paises`
--

DROP TABLE IF EXISTS `paises`;
CREATE TABLE IF NOT EXISTS `paises` (
  `pais_id` int NOT NULL,
  `pais_nombre` varchar(50) NOT NULL,
  `regiones_region_id` int NOT NULL,
  PRIMARY KEY (`pais_id`),
  KEY `fk_paises_regiones_idx` (`regiones_region_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `paises`
--

INSERT INTO `paises` (`pais_id`, `pais_nombre`, `regiones_region_id`) VALUES
(30, 'Colombia', 40),
(31, 'Venezuela', 43),
(32, 'ecuador', 44),
(33, 'Colombia', 41),
(34, 'Colombia', 43);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `regiones`
--

DROP TABLE IF EXISTS `regiones`;
CREATE TABLE IF NOT EXISTS `regiones` (
  `region_id` int NOT NULL,
  `region_nombre` varchar(25) NOT NULL,
  PRIMARY KEY (`region_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `regiones`
--

INSERT INTO `regiones` (`region_id`, `region_nombre`) VALUES
(40, 'Andina'),
(41, 'Amazonas'),
(42, 'caribe'),
(43, 'Orinoquia'),
(44, 'Pacifico');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trabajos`
--

DROP TABLE IF EXISTS `trabajos`;
CREATE TABLE IF NOT EXISTS `trabajos` (
  `trabajo_id` int NOT NULL,
  `trabajo_nombre` varchar(35) NOT NULL,
  `salario_minimo` decimal(10,0) NOT NULL,
  `salario_maximo` decimal(10,0) NOT NULL,
  PRIMARY KEY (`trabajo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `trabajos`
--

INSERT INTO `trabajos` (`trabajo_id`, `trabajo_nombre`, `salario_minimo`, `salario_maximo`) VALUES
(1005, 'Carpintero', '1250000', '1650000'),
(1006, 'Maetro de obra', '1200000', '2850000'),
(1007, 'Joyero', '1540000', '1840000'),
(1008, 'Igeniro Civil', '2540000', '3840000'),
(1009, 'Programador ', '3200000', '4500000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ubicaciones`
--

DROP TABLE IF EXISTS `ubicaciones`;
CREATE TABLE IF NOT EXISTS `ubicaciones` (
  `ubicacion_id` int NOT NULL,
  `direccion` varchar(45) NOT NULL,
  `codigo_postal` varchar(45) NOT NULL,
  `ciudad` varchar(12) NOT NULL,
  `estado_provincia` varchar(25) DEFAULT NULL,
  `paises_pais_id` int NOT NULL,
  PRIMARY KEY (`ubicacion_id`),
  KEY `fk_ubicaciones_paises1_idx` (`paises_pais_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `ubicaciones`
--

INSERT INTO `ubicaciones` (`ubicacion_id`, `direccion`, `codigo_postal`, `ciudad`, `estado_provincia`, `paises_pais_id`) VALUES
(50, 'clle 54 #12-10', '1000001', 'Cali', 'Valle', 33),
(51, 'carrera 12 # 45-02', '1000006', 'Bucaramanga', 'Santender', 33),
(52, 'Avenina 45 #78-01', '1000008', 'Villavicenci', 'Meta', 34),
(53, 'Carrera 10 # 42-21', '1000021', 'ibarra', 'Ecuador', 32),
(54, 'Calle 47 # 23-03', '10000025', 'Pasto', 'Nariño', 33);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `departamentos`
--
ALTER TABLE `departamentos`
  ADD CONSTRAINT `fk_departamentos_ubicaciones1` FOREIGN KEY (`ubicaciones_ubicacion_id`) REFERENCES `ubicaciones` (`ubicacion_id`);

--
-- Filtros para la tabla `dependientes`
--
ALTER TABLE `dependientes`
  ADD CONSTRAINT `fk_dependientes_empleados1` FOREIGN KEY (`empleados_empleado_id`) REFERENCES `empleados` (`empleado_id`);

--
-- Filtros para la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD CONSTRAINT `fk_empleados_departamentos1` FOREIGN KEY (`departamentos_departamento_id`) REFERENCES `departamentos` (`departamento_id`),
  ADD CONSTRAINT `fk_empleados_trabajos1` FOREIGN KEY (`trabajos_trabajo_id`) REFERENCES `trabajos` (`trabajo_id`);

--
-- Filtros para la tabla `paises`
--
ALTER TABLE `paises`
  ADD CONSTRAINT `fk_paises_regiones` FOREIGN KEY (`regiones_region_id`) REFERENCES `regiones` (`region_id`);

--
-- Filtros para la tabla `ubicaciones`
--
ALTER TABLE `ubicaciones`
  ADD CONSTRAINT `fk_ubicaciones_paises1` FOREIGN KEY (`paises_pais_id`) REFERENCES `paises` (`pais_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

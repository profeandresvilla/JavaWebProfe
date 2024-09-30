-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 30-09-2024 a las 15:58:07
-- Versión del servidor: 5.7.21
-- Versión de PHP: 5.6.35

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `facturacion`
--
CREATE DATABASE IF NOT EXISTS `facturacion` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `facturacion`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

DROP TABLE IF EXISTS `clientes`;
CREATE TABLE IF NOT EXISTS `clientes` (
  `idCliente` varchar(10) NOT NULL,
  `idTipo` int(11) NOT NULL,
  `nombres` varchar(30) NOT NULL,
  `apellidos` varchar(30) NOT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `idCiudad` int(11) DEFAULT NULL,
  `fechaNacimiento` date DEFAULT NULL,
  `fechaIngreso` date DEFAULT NULL,
  PRIMARY KEY (`idCliente`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`idCliente`, `idTipo`, `nombres`, `apellidos`, `direccion`, `telefono`, `idCiudad`, `fechaNacimiento`, `fechaIngreso`) VALUES
('1', 1, 'Juan Carlos', 'Zuluaga Cardona', 'Calle Luna Calle Sol', '233 4455', 1, '1974-09-23', '2012-12-19'),
('2', 3, 'Maria', 'Conchita', 'Calle Rosa con Amarillo', '233 4333', 7, '1980-12-14', '2012-12-19'),
('3', 1, 'Jaime', 'Vasquez', 'Avenida Guerrero', '233 4433', 5, '1976-12-14', '2012-12-14'),
('4', 4, 'Noemi', 'Cambell', 'Monaco', '2344 3332', 5, '1986-12-16', '2012-12-19');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallefactura`
--

DROP TABLE IF EXISTS `detallefactura`;
CREATE TABLE IF NOT EXISTS `detallefactura` (
  `idFactura` int(11) NOT NULL,
  `idLinea` int(11) NOT NULL,
  `idProducto` varchar(12) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  `precio` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  PRIMARY KEY (`idFactura`,`idLinea`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `detallefactura`
--

INSERT INTO `detallefactura` (`idFactura`, `idLinea`, `idProducto`, `descripcion`, `precio`, `cantidad`) VALUES
(1, 1, '10', 'Fabuloso x 500 ml', 4200, 6),
(1, 2, '1', 'Coca Cola x 350 Ml', 1300, 3),
(1, 3, '2', 'Pan Bimbo x 500 Gr', 3500, 12),
(1, 4, '3', 'Leche Colanta', 1900, 10),
(2, 1, '1', 'Coca Cola x 350 Ml', 1300, 3),
(2, 2, '2', 'Pan Bimbo x 500 Gr', 3500, 3),
(2, 3, '3', 'Leche Colanta', 1900, 6),
(2, 4, '10', 'Fabuloso x 500 ml', 4200, 7),
(3, 1, '1', 'Coca Cola x 350 Ml', 1300, 3),
(3, 2, '10', 'Fabuloso x 500 ml', 4200, 1),
(3, 3, '4', 'Salchichon Zenu x 500 Gr', 5000, 1),
(4, 1, '1', 'Coca Cola x 350 Ml', 1300, 3),
(4, 2, '3', 'Leche Colanta', 1900, 3),
(5, 1, '1', 'Coca Cola x 350 Ml', 1300, 2),
(5, 2, '3', 'Leche Colanta', 1900, 3),
(6, 0, '1', 'Coca Cola x 350 Ml', 1300, 12),
(6, 1, '2', 'Pan Bimbo x 500 Gr', 3500, 12),
(6, 2, '10', 'Fabuloso x 500 ml', 4200, 5),
(6, 3, '4', 'Salchichon Zenu x 500 Gr', 5000, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallefacturatmp`
--

DROP TABLE IF EXISTS `detallefacturatmp`;
CREATE TABLE IF NOT EXISTS `detallefacturatmp` (
  `idProducto` varchar(12) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  `precio` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  PRIMARY KEY (`idProducto`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

DROP TABLE IF EXISTS `factura`;
CREATE TABLE IF NOT EXISTS `factura` (
  `idFactura` int(11) NOT NULL,
  `idCliente` varchar(10) NOT NULL,
  `fecha` date NOT NULL,
  PRIMARY KEY (`idFactura`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `factura`
--

INSERT INTO `factura` (`idFactura`, `idCliente`, `fecha`) VALUES
(1, '1', '2012-12-20'),
(2, '2', '2012-12-20'),
(3, '3', '2012-12-20'),
(4, '1', '2012-12-20'),
(5, '1', '2012-12-20'),
(6, '4', '2012-12-21');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

DROP TABLE IF EXISTS `productos`;
CREATE TABLE IF NOT EXISTS `productos` (
  `idProducto` varchar(12) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  `precio` int(11) NOT NULL,
  `idIVA` int(11) NOT NULL,
  `notas` text,
  `foto` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`idProducto`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`idProducto`, `descripcion`, `precio`, `idIVA`, `notas`, `foto`) VALUES
('1', 'Coca Cola x 350 Ml', 1300, 1, 'La mejor', 'Coke.jpg'),
('2', 'Pan Bimbo x 500 Gr', 3500, 0, 'Simpre sueva y esponjoso', 'PanBimbo.jpg'),
('3', 'Leche Colanta', 1900, 1, '', 'LecheColanta.jpg'),
('10', 'Fabuloso x 500 ml', 4200, 2, 'Ricol y oloroso', 'Fabuloso.jpg'),
('4', 'Salchichon Zenu x 500 Gr', 5000, 3, 'Sabe rico con limon', 'SalchichonZenu.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `idUsuario` varchar(10) NOT NULL,
  `nombres` varchar(30) NOT NULL,
  `apellidos` varchar(30) NOT NULL,
  `clave` varchar(10) NOT NULL,
  `idPerfil` int(11) NOT NULL,
  `foto` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`idUsuario`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`idUsuario`, `nombres`, `apellidos`, `clave`, `idPerfil`, `foto`) VALUES
('zulu', 'Juan Carlos', 'Zuluaga Cardona', '123', 1, 'Zulu.JPG'),
('pepe', 'Pedro', 'Infante', '3030', 1, 'pedro_infante.jpg'),
('vale', 'Valery', 'Dominguez', '2020', 1, 'valerie-dominguez.jpg'),
('rosa', 'Rosa', 'Martinez', '123', 2, 'rosa-martinez-2.jpg'),
('ronal', 'Ronal', 'Hayazo', '123', 2, 'Ronal.jpg'),
('carla', 'Carla', 'Bruni', '123', 1, 'Carla+Bruni+carla07.jpg'),
('alvaro', 'Alvaro', 'Uribe', '123', 1, ''),
('angelino', 'Angelino', 'Garzon Lopez', '123', 2, ''),
('admin', 'Andrés Felipe', 'Villa Cardona', 'admin', 1, 'Foto.jpg');
SET FOREIGN_KEY_CHECKS=1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

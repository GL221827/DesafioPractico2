-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 28-04-2025 a las 03:49:28
-- Versión del servidor: 9.1.0
-- Versión de PHP: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `textil_export`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito`
--

DROP TABLE IF EXISTS `carrito`;
CREATE TABLE IF NOT EXISTS `carrito` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int NOT NULL,
  `id_producto` int NOT NULL,
  `cantidad` int UNSIGNED NOT NULL,
  `fecha_agregado` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_producto` (`id_producto`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

DROP TABLE IF EXISTS `categorias`;
CREATE TABLE IF NOT EXISTS `categorias` (
  `id_categoria` int NOT NULL AUTO_INCREMENT,
  `categoria` varchar(100) NOT NULL,
  PRIMARY KEY (`id_categoria`),
  UNIQUE KEY `categoria` (`categoria`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id_categoria`, `categoria`) VALUES
(1, 'TEXTIL'),
(2, 'DEPORTIVA'),
(3, 'PROMOCIONAL'),
(4, 'BOLSOS');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra`
--

DROP TABLE IF EXISTS `compra`;
CREATE TABLE IF NOT EXISTS `compra` (
  `id_compra` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `fecha_compra` datetime DEFAULT CURRENT_TIMESTAMP,
  `estado_pago` enum('pendiente','pagado','fallido') DEFAULT 'pagado',
  PRIMARY KEY (`id_compra`),
  KEY `id_usuario` (`id_usuario`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_compra`
--

DROP TABLE IF EXISTS `detalle_compra`;
CREATE TABLE IF NOT EXISTS `detalle_compra` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_compra` int NOT NULL,
  `id_producto` int NOT NULL,
  `cantidad` int UNSIGNED NOT NULL,
  `precio_unitario` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_compra` (`id_compra`),
  KEY `id_producto` (`id_producto`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

DROP TABLE IF EXISTS `productos`;
CREATE TABLE IF NOT EXISTS `productos` (
  `codigo_producto` varchar(9) NOT NULL DEFAULT '',
  `nombre_producto` text NOT NULL,
  `descripcion` varchar(150) NOT NULL,
  `imagen` varchar(255) DEFAULT NULL,
  `id_categoria` int NOT NULL,
  `precio` decimal(5,2) NOT NULL,
  `existencias` int UNSIGNED NOT NULL DEFAULT '0',
  PRIMARY KEY (`codigo_producto`),
  KEY `fk_categoria` (`id_categoria`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`codigo_producto`, `nombre_producto`, `descripcion`, `imagen`, `id_categoria`, `precio`, `existencias`) VALUES
('PROD00004', 'Termos de acero', 'Termos de acero inoxidable son goma de color para evitar que se caliente', NULL, 0, 4.25, 100),
('PROD00008', 'Camisetas basicas', 'Camisetas de algodón unisex, diferentes tallas', NULL, 1, 5.25, 500),
('PROD00007', 'Camiseta Real Madrid', 'Camiseta poliéster original del Real Madrid', NULL, 2, 15.00, 350),
('PROD00006', 'Bolsa Tote Bag', 'Bolso de lona tipo tote bag con asas largas', 'totebag.png', 3, 5.50, 300);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_usuarios`
--

DROP TABLE IF EXISTS `tipo_usuarios`;
CREATE TABLE IF NOT EXISTS `tipo_usuarios` (
  `id_tipo_usuario` int NOT NULL,
  `tipo_usuario` varchar(30) NOT NULL,
  PRIMARY KEY (`id_tipo_usuario`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `tipo_usuarios`
--

INSERT INTO `tipo_usuarios` (`id_tipo_usuario`, `tipo_usuario`) VALUES
(1, 'ADMIN'),
(2, 'EMPLEADO'),
(3, 'CLIENTE');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `telefono` varchar(50) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `contra` varchar(128) NOT NULL,
  `id_tipo_usuario` int NOT NULL,
  `autenticado` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `correo` (`correo`),
  KEY `id_tipo_usuario` (`id_tipo_usuario`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nombre`, `apellido`, `telefono`, `correo`, `contra`, `id_tipo_usuario`, `autenticado`) VALUES
(1, 'Juan', 'Pérez', '7594-5210', 'juan.perez@gmail.com', '349e4272dc8abd9757f8f4d688dea9f28f31ca086cc1c6eedb36da59a30ae16dac45de96026594ca882d087494719cb95bc9f013bf067e1ccf900f408ca84e35', 3, 0),
(2, 'Anna', 'Lopez', '6035-9687', 'annalopex123@gmail.com', 'cfbd3e3a8adc49b9e0061ade86c84b499012048c903185821f9428dd981c4610b6d660d484a88641bf81b5b840422ea9e3a5da29c12821eed60b0d281e5f43db', 3, 0),
(3, 'Brandon', 'Salazar', '7545-6325', 'brandonsalazar05@empleado.com', 'a06dac068e925e3be29d863ef30af65f7bb61188af843cc9693704f20ce329bcf28ff2d5458f46f4f45a3fc8b333931bf7c040b00f5ae4c515d97d4936dc6301', 2, 0),
(4, 'Karla', 'Del Barrio', '7561-3021', 'karladelbariio01@empleado.com', '6f0625d13cea7957f697cdae8979936854a4981845174a82abede12ee31ca854798b612f680570dfe6f1e154e9ebcc1e58c2bd0130b0dcbfeb78309b07a43b77', 2, 1),
(5, 'Andrea', 'Fuentes', '7595-2014', 'andreafuentes@admin.com', 'f611b7c6f006ae635aeb7083f01a0bce134e07a2d59332bd099d58a14429ee282f022976897a9994011eb09616cf2a747137baab53f5b8bb4e9c5811e9258f88', 1, 1),
(6, 'Aaron', 'Anderson', '6025-3064', 'aaronanderson@admin.com', '222b85e21ad007822cca418cdfd6d83adc188fafbf86f35d4a58e8b3fef9b941111b83d8aec242694c0312b158d60656e7e4da083c2cd7a64a2ca6bba0636039', 1, 0),
(11, 'Cindy ', 'Leon', '6058-9632', 'leoncindy16@gmail.com', 'b49a124ed48256b7e1e62bfb55b83b8f0270241753d46b37345c588012e912294e153df0ffbfef0e449c42d9f92e0c2ecc02860c8e2398041f3b1633b99d699b', 3, 1),
(12, 'Valeria', 'Gonzalez', '7558-9625', 'valeria.gonzaleez1@gmail.com', 'b49a124ed48256b7e1e62bfb55b83b8f0270241753d46b37345c588012e912294e153df0ffbfef0e449c42d9f92e0c2ecc02860c8e2398041f3b1633b99d699b', 3, 1);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         8.4.3 - MySQL Community Server - GPL
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.8.0.6908
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para instituto_matriculas
CREATE DATABASE IF NOT EXISTS `instituto_matriculas` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `instituto_matriculas`;

-- Volcando estructura para tabla instituto_matriculas.detalle_matricula_modulos
CREATE TABLE IF NOT EXISTS `detalle_matricula_modulos` (
  `id_detalle_mat` int NOT NULL AUTO_INCREMENT,
  `id_matricula` int DEFAULT NULL,
  `id_modulo` int DEFAULT NULL,
  `nota_final` decimal(3,1) DEFAULT '0.0',
  PRIMARY KEY (`id_detalle_mat`),
  KEY `id_matricula` (`id_matricula`),
  KEY `id_modulo` (`id_modulo`),
  CONSTRAINT `detalle_matricula_modulos_ibfk_1` FOREIGN KEY (`id_matricula`) REFERENCES `matriculas` (`id_matricula`) ON DELETE CASCADE,
  CONSTRAINT `detalle_matricula_modulos_ibfk_2` FOREIGN KEY (`id_modulo`) REFERENCES `modulos` (`id_modulo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla instituto_matriculas.estudiantes
CREATE TABLE IF NOT EXISTS `estudiantes` (
  `id_estudiante` int NOT NULL AUTO_INCREMENT,
  `documento` varchar(20) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_estudiante`),
  UNIQUE KEY `documento` (`documento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla instituto_matriculas.matriculas
CREATE TABLE IF NOT EXISTS `matriculas` (
  `id_matricula` int NOT NULL AUTO_INCREMENT,
  `codigo_matricula` varchar(30) NOT NULL,
  `id_estudiante` int DEFAULT NULL,
  `id_programa` int DEFAULT NULL,
  `periodo_academico` varchar(10) NOT NULL,
  `fecha_matricula` date NOT NULL,
  PRIMARY KEY (`id_matricula`),
  UNIQUE KEY `codigo_matricula` (`codigo_matricula`),
  KEY `id_estudiante` (`id_estudiante`),
  KEY `id_programa` (`id_programa`),
  CONSTRAINT `matriculas_ibfk_1` FOREIGN KEY (`id_estudiante`) REFERENCES `estudiantes` (`id_estudiante`),
  CONSTRAINT `matriculas_ibfk_2` FOREIGN KEY (`id_programa`) REFERENCES `programas_tecnicos` (`id_programa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla instituto_matriculas.modulos
CREATE TABLE IF NOT EXISTS `modulos` (
  `id_modulo` int NOT NULL AUTO_INCREMENT,
  `nombre_modulo` varchar(100) NOT NULL,
  `id_programa` int DEFAULT NULL,
  PRIMARY KEY (`id_modulo`),
  KEY `id_programa` (`id_programa`),
  CONSTRAINT `modulos_ibfk_1` FOREIGN KEY (`id_programa`) REFERENCES `programas_tecnicos` (`id_programa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla instituto_matriculas.programas_tecnicos
CREATE TABLE IF NOT EXISTS `programas_tecnicos` (
  `id_programa` int NOT NULL AUTO_INCREMENT,
  `nombre_programa` varchar(100) NOT NULL,
  `duracion_semestres` int NOT NULL,
  PRIMARY KEY (`id_programa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- La exportación de datos fue deseleccionada.


-- Volcando estructura de base de datos para modelofacturacion
CREATE DATABASE IF NOT EXISTS `modelofacturacion` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `modelofacturacion`;

-- Volcando estructura para tabla modelofacturacion.categoria
CREATE TABLE IF NOT EXISTS `categoria` (
  `id_categoria` smallint NOT NULL AUTO_INCREMENT,
  `categoria` varchar(45) NOT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla modelofacturacion.compania
CREATE TABLE IF NOT EXISTS `compania` (
  `id_compania` smallint NOT NULL AUTO_INCREMENT,
  `nit` varchar(45) NOT NULL,
  `compania` varchar(45) NOT NULL,
  PRIMARY KEY (`id_compania`),
  UNIQUE KEY `nit` (`nit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla modelofacturacion.factura
CREATE TABLE IF NOT EXISTS `factura` (
  `id_factura` bigint NOT NULL AUTO_INCREMENT,
  `id_persona` int NOT NULL,
  `id_compania` smallint NOT NULL,
  `id_terminos` tinyint NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `sub_total` float NOT NULL,
  `tasa_impuestos` float NOT NULL,
  PRIMARY KEY (`id_factura`),
  KEY `id_persona` (`id_persona`),
  KEY `id_compania` (`id_compania`),
  KEY `id_terminos` (`id_terminos`),
  CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`id_persona`),
  CONSTRAINT `factura_ibfk_2` FOREIGN KEY (`id_compania`) REFERENCES `compania` (`id_compania`),
  CONSTRAINT `factura_ibfk_3` FOREIGN KEY (`id_terminos`) REFERENCES `terminos` (`id_terminos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla modelofacturacion.factura_producto
CREATE TABLE IF NOT EXISTS `factura_producto` (
  `id_factura` bigint NOT NULL,
  `id_producto` int NOT NULL,
  `valor_unitario` float NOT NULL,
  `cantidad` smallint NOT NULL,
  PRIMARY KEY (`id_factura`,`id_producto`),
  KEY `id_producto` (`id_producto`),
  CONSTRAINT `factura_producto_ibfk_1` FOREIGN KEY (`id_factura`) REFERENCES `factura` (`id_factura`) ON DELETE CASCADE,
  CONSTRAINT `factura_producto_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla modelofacturacion.persona
CREATE TABLE IF NOT EXISTS `persona` (
  `id_persona` int NOT NULL AUTO_INCREMENT,
  `identificacion` varchar(45) NOT NULL,
  `nombres` varchar(45) NOT NULL,
  `direccion` varchar(250) DEFAULT NULL,
  `ciudad` varchar(60) DEFAULT NULL,
  `codigo_postal` varchar(15) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `correo` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id_persona`),
  UNIQUE KEY `identificacion` (`identificacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla modelofacturacion.producto
CREATE TABLE IF NOT EXISTS `producto` (
  `id_producto` int NOT NULL AUTO_INCREMENT,
  `id_categoria` smallint NOT NULL,
  `producto` varchar(100) NOT NULL,
  `existencia` int NOT NULL,
  `valor_unitario_venta` float NOT NULL,
  `valor_unitario_compra` float DEFAULT NULL,
  PRIMARY KEY (`id_producto`),
  KEY `id_categoria` (`id_categoria`),
  CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla modelofacturacion.terminos
CREATE TABLE IF NOT EXISTS `terminos` (
  `id_terminos` tinyint NOT NULL AUTO_INCREMENT,
  `terminos` varchar(45) NOT NULL,
  PRIMARY KEY (`id_terminos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- La exportación de datos fue deseleccionada.

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

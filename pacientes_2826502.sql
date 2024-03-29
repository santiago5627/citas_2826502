-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.28-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para citas_2826502
DROP DATABASE IF EXISTS `citas_2826502`;
CREATE DATABASE IF NOT EXISTS `citas_2826502` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `citas_2826502`;

-- Volcando estructura para tabla citas_2826502.citas
DROP TABLE IF EXISTS `citas`;
CREATE TABLE IF NOT EXISTS `citas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL DEFAULT current_timestamp(),
  `hora` time NOT NULL,
  `consultorio` int(11) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `paciente_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_citas_medico` (`doctor_id`),
  KEY `FK_citas_pacientes` (`paciente_id`),
  CONSTRAINT `FK_citas_medico` FOREIGN KEY (`doctor_id`) REFERENCES `medico` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_citas_pacientes` FOREIGN KEY (`paciente_id`) REFERENCES `pacientes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla citas_2826502.citas: ~1 rows (aproximadamente)
DELETE FROM `citas`;
INSERT INTO `citas` (`id`, `fecha`, `hora`, `consultorio`, `doctor_id`, `paciente_id`) VALUES
	(6, '2024-02-14', '16:57:57', 413, 1, 1);

-- Volcando estructura para tabla citas_2826502.medico
DROP TABLE IF EXISTS `medico`;
CREATE TABLE IF NOT EXISTS `medico` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_medico` varchar(50) NOT NULL DEFAULT '',
  `especialidad` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla citas_2826502.medico: ~2 rows (aproximadamente)
DELETE FROM `medico`;
INSERT INTO `medico` (`id`, `nombre_medico`, `especialidad`) VALUES
	(1, 'angel', 'dentista'),
	(2, 'andres', 'ginecologo');

-- Volcando estructura para tabla citas_2826502.pacientes
DROP TABLE IF EXISTS `pacientes`;
CREATE TABLE IF NOT EXISTS `pacientes` (
  `nombre` varchar(50) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `n_documento` bigint(20) NOT NULL DEFAULT 0,
  `celular` bigint(20) NOT NULL DEFAULT 0,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla citas_2826502.pacientes: ~2 rows (aproximadamente)
DELETE FROM `pacientes`;
INSERT INTO `pacientes` (`nombre`, `apellidos`, `n_documento`, `celular`, `id`) VALUES
	('oscar', 'vasquez', 13412313, 342342342, 1),
	('juan', 'aviles', 98098989, 87897897897, 2);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

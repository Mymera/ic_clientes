-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: sistema_telefonico
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ciudades`
--

DROP TABLE IF EXISTS `ciudades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ciudades` (
  `ciud_id` int(11) NOT NULL AUTO_INCREMENT,
  `ciud_nombre` varchar(255) NOT NULL,
  PRIMARY KEY (`ciud_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ciudades`
--

LOCK TABLES `ciudades` WRITE;
/*!40000 ALTER TABLE `ciudades` DISABLE KEYS */;
INSERT INTO `ciudades` VALUES (1,'Bogotá'),(2,'Medellín'),(3,'Cali'),(4,'Cartagena'),(5,'Barranquilla');
/*!40000 ALTER TABLE `ciudades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personas`
--

DROP TABLE IF EXISTS `personas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personas` (
  `dir_tel` varchar(15) NOT NULL,
  `dir_tipo_tel` varchar(50) DEFAULT NULL,
  `dir_nombre` varchar(255) NOT NULL,
  `dir_direccion` varchar(255) NOT NULL,
  `dir_ciud_id` int(11) DEFAULT NULL,
  `dir_email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`dir_tel`),
  KEY `dir_ciud_id` (`dir_ciud_id`),
  CONSTRAINT `personas_ibfk_1` FOREIGN KEY (`dir_ciud_id`) REFERENCES `ciudades` (`ciud_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personas`
--

LOCK TABLES `personas` WRITE;
/*!40000 ALTER TABLE `personas` DISABLE KEYS */;
INSERT INTO `personas` VALUES ('3001234567','Móvil','Juan Pérez','Calle 123',1,'jperez@gmail.com'),('3019876543','Móvil','María Gómez','Carrera 45',2,'mariag@outk.com'),('3025555555','Móvil','Luis Rodríguez','Av. Siempre Viva',3,'LuisR1521@gmail.com'),('3044444444','Fijo','Ana Torres','Calle 6',4,'anita_pos@gmail.com'),('3053333333','Móvil','Carlos Sánchez','Carrera 10',5,'Csanchez@hotmail.com');
/*!40000 ALTER TABLE `personas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `idUsuario` int(12) NOT NULL AUTO_INCREMENT,
  `nombreUsuario` varchar(50) NOT NULL,
  `passUsuario` varchar(60) NOT NULL,
  `email` varchar(60) NOT NULL,
  `tipoIdentificacion` varchar(50) NOT NULL,
  `numeroIdentificacion` int(20) DEFAULT NULL,
  `telefonoUsuario` int(10) NOT NULL,
  `fechaNacimiento` date NOT NULL,
  PRIMARY KEY (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (4,'juanito','$2y$10$96w/VXP2c/mbSMEew7cHS.U4dRRUcgCJNMtEsrC74HuoRj7QzVer.','juan@gmail.com','Cédula de ciudadania',415597,2147483647,'2024-10-10'),(5,'Juan2','$2y$10$n8awAcKpILMrEMw/6wk17e1xv4F6KK6F0DjRqYP3/F2GD77RWWtRq','juan2@gmail.com','Cédula de ciudadania',10223698,2147483647,'2024-10-18'),(6,'juan3','$2y$10$/CL4gwoh496cnr8KJdfsLupIiWhyeKXp0MMbWYvPU0OQgBkA2m.eq','juan3@gmail.com','Cédula de ciudadania',51651651,35131651,'2024-11-09');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'sistema_telefonico'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-16 12:08:23

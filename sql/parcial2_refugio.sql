-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: refugio
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Table structure for table `adopcion`
--

DROP TABLE IF EXISTS `adopcion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adopcion` (
  `ID_Adopcion` int NOT NULL,
  `Fecha` date NOT NULL,
  `ID_Adoptante` int NOT NULL,
  `ID_Animal` int NOT NULL,
  PRIMARY KEY (`ID_Adopcion`),
  KEY `ID_Adoptante` (`ID_Adoptante`),
  KEY `ID_Animal` (`ID_Animal`),
  CONSTRAINT `adopcion_ibfk_1` FOREIGN KEY (`ID_Adoptante`) REFERENCES `adoptante` (`ID_Adoptante`),
  CONSTRAINT `adopcion_ibfk_2` FOREIGN KEY (`ID_Animal`) REFERENCES `animal` (`ID_Animal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adopcion`
--

LOCK TABLES `adopcion` WRITE;
/*!40000 ALTER TABLE `adopcion` DISABLE KEYS */;
INSERT INTO `adopcion` VALUES (1,'2024-09-15',1,2),(3,'2024-01-10',2,5);
/*!40000 ALTER TABLE `adopcion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adoptante`
--

DROP TABLE IF EXISTS `adoptante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adoptante` (
  `ID_Adoptante` int NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Telefono` varchar(15) DEFAULT NULL,
  `Dirección` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID_Adoptante`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adoptante`
--

LOCK TABLES `adoptante` WRITE;
/*!40000 ALTER TABLE `adoptante` DISABLE KEYS */;
INSERT INTO `adoptante` VALUES (1,'Pedro López','111222333','Calle Falsa 123'),(2,'María Gómez','222333444','Avenida Siempre Viva 742');
/*!40000 ALTER TABLE `adoptante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `animal`
--

DROP TABLE IF EXISTS `animal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `animal` (
  `ID_Animal` int NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Especie` varchar(30) NOT NULL,
  `Fecha_Ingreso` date NOT NULL,
  `Estado_Salud` varchar(20) NOT NULL,
  `Disponible_Para_Adopcion` tinyint(1) NOT NULL,
  `Peso` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`ID_Animal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `animal`
--

LOCK TABLES `animal` WRITE;
/*!40000 ALTER TABLE `animal` DISABLE KEYS */;
INSERT INTO `animal` VALUES (1,'Fido','Perro','2024-01-15','bueno',1,NULL),(2,'Miau','Gato','2024-03-10','bueno',1,NULL),(3,'Paco','Perico','2023-11-20','malo',0,NULL),(4,'Lola','Perro','2024-06-05','bueno',0,NULL),(5,'Luna','Gato','2023-09-25','regular',1,NULL),(6,'Rex','Perro','2024-02-20','bueno',1,NULL);
/*!40000 ALTER TABLE `animal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuidados`
--

DROP TABLE IF EXISTS `cuidados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuidados` (
  `ID_Voluntario` int NOT NULL,
  `ID_Animal` int NOT NULL,
  PRIMARY KEY (`ID_Voluntario`,`ID_Animal`),
  KEY `ID_Animal` (`ID_Animal`),
  CONSTRAINT `cuidados_ibfk_1` FOREIGN KEY (`ID_Voluntario`) REFERENCES `voluntario` (`ID_Voluntario`),
  CONSTRAINT `cuidados_ibfk_2` FOREIGN KEY (`ID_Animal`) REFERENCES `animal` (`ID_Animal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuidados`
--

LOCK TABLES `cuidados` WRITE;
/*!40000 ALTER TABLE `cuidados` DISABLE KEYS */;
INSERT INTO `cuidados` VALUES (1,1),(1,2),(2,3),(3,4),(4,5),(4,6);
/*!40000 ALTER TABLE `cuidados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voluntario`
--

DROP TABLE IF EXISTS `voluntario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `voluntario` (
  `ID_Voluntario` int NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Telefono` varchar(15) NOT NULL,
  `Fecha_Incorporacion` date NOT NULL,
  PRIMARY KEY (`ID_Voluntario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voluntario`
--

LOCK TABLES `voluntario` WRITE;
/*!40000 ALTER TABLE `voluntario` DISABLE KEYS */;
INSERT INTO `voluntario` VALUES (1,'Juan Pérez','123456789','2023-05-01'),(2,'Ana Gómez','987654321','2024-02-15'),(3,'Carlos Ruiz','555555555','2023-11-01'),(4,'Federico Claramunt','333333333','2024-07-01'),(5,'Lucía Martínez','444444444','2024-04-20');
/*!40000 ALTER TABLE `voluntario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-04  9:26:49

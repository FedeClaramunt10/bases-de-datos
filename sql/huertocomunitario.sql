-- CREATE DATABASE huertocomunitario;
-- USE huertocomunitario;
-- MySQL dump 10.13  Distrib 8.0.39, for Win64 (x86_64)
--
-- Host: localhost    Database: huertocomunitario
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `actividad`
--

DROP TABLE IF EXISTS `actividad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actividad` (
  `ID_Actividad` int NOT NULL AUTO_INCREMENT,
  `Fecha` date NOT NULL,
  `Tipo_Actividad` varchar(20) NOT NULL,
  `Descripción` text,
  `ID_Usuario` int DEFAULT NULL,
  `ID_Parcela` int DEFAULT NULL,
  PRIMARY KEY (`ID_Actividad`),
  KEY `ID_Usuario` (`ID_Usuario`),
  KEY `ID_Parcela` (`ID_Parcela`),
  CONSTRAINT `actividad_ibfk_1` FOREIGN KEY (`ID_Usuario`) REFERENCES `usuario` (`ID_Usuario`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `actividad_ibfk_2` FOREIGN KEY (`ID_Parcela`) REFERENCES `parcela` (`ID_Parcela`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actividad`
--

LOCK TABLES `actividad` WRITE;
/*!40000 ALTER TABLE `actividad` DISABLE KEYS */;
INSERT INTO `actividad` VALUES (6,'2024-05-10','Plantación','Plantación de tomates',1,1),(7,'2024-06-01','Riego','Riego semanal',2,2),(8,'2024-07-15','Cosecha','Cosecha de zanahorias',3,3),(9,'2024-08-05','Limpieza','Limpieza de malas hierbas',4,4),(10,'2024-09-10','Plantación','Plantación de lechuga',5,5);
/*!40000 ALTER TABLE `actividad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cosecha`
--

DROP TABLE IF EXISTS `cosecha`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cosecha` (
  `ID_Cosecha` int NOT NULL AUTO_INCREMENT,
  `Cantidad` decimal(5,2) NOT NULL,
  `Fecha_Cosecha` date NOT NULL,
  `ID_Parcela` int DEFAULT NULL,
  `ID_Planta` int DEFAULT NULL,
  PRIMARY KEY (`ID_Cosecha`),
  KEY `ID_Parcela` (`ID_Parcela`),
  KEY `ID_Planta` (`ID_Planta`),
  CONSTRAINT `cosecha_ibfk_1` FOREIGN KEY (`ID_Parcela`) REFERENCES `parcela` (`ID_Parcela`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `cosecha_ibfk_2` FOREIGN KEY (`ID_Planta`) REFERENCES `planta` (`ID_Planta`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `cosecha_chk_1` CHECK ((`Cantidad` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cosecha`
--

LOCK TABLES `cosecha` WRITE;
/*!40000 ALTER TABLE `cosecha` DISABLE KEYS */;
INSERT INTO `cosecha` VALUES (1,10.50,'2024-08-15',1,1),(2,5.30,'2024-09-01',2,2),(3,7.20,'2024-09-25',3,3),(4,12.00,'2024-10-10',4,4),(5,9.80,'2024-10-20',5,5);
/*!40000 ALTER TABLE `cosecha` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parcela`
--

DROP TABLE IF EXISTS `parcela`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parcela` (
  `ID_Parcela` int NOT NULL AUTO_INCREMENT,
  `Tamaño` decimal(5,2) NOT NULL,
  `Tipo_Suelo` varchar(20) NOT NULL,
  PRIMARY KEY (`ID_Parcela`),
  CONSTRAINT `parcela_chk_1` CHECK ((`Tamaño` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parcela`
--

LOCK TABLES `parcela` WRITE;
/*!40000 ALTER TABLE `parcela` DISABLE KEYS */;
INSERT INTO `parcela` VALUES (1,25.50,'Arenoso'),(2,30.00,'Arcilloso'),(3,20.50,'Franco'),(4,35.00,'Arenoso'),(5,28.00,'Franco');
/*!40000 ALTER TABLE `parcela` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parcela_planta`
--

DROP TABLE IF EXISTS `parcela_planta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parcela_planta` (
  `ID_Parcela` int DEFAULT NULL,
  `ID_Planta` int DEFAULT NULL,
  `Fecha_Plantación` date NOT NULL,
  `Tiempo_Estimado_Cosecha` int NOT NULL,
  KEY `ID_Parcela` (`ID_Parcela`),
  KEY `ID_Planta` (`ID_Planta`),
  CONSTRAINT `parcela_planta_ibfk_1` FOREIGN KEY (`ID_Parcela`) REFERENCES `parcela` (`ID_Parcela`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `parcela_planta_ibfk_2` FOREIGN KEY (`ID_Planta`) REFERENCES `planta` (`ID_Planta`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parcela_planta`
--

LOCK TABLES `parcela_planta` WRITE;
/*!40000 ALTER TABLE `parcela_planta` DISABLE KEYS */;
INSERT INTO `parcela_planta` VALUES (1,1,'2024-05-10',90),(2,2,'2024-06-01',70),(3,3,'2024-07-15',60),(4,4,'2024-08-05',120),(5,5,'2024-09-10',85);
/*!40000 ALTER TABLE `parcela_planta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `planta`
--

DROP TABLE IF EXISTS `planta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `planta` (
  `ID_Planta` int NOT NULL AUTO_INCREMENT,
  `Nombre_Común` varchar(50) NOT NULL,
  `Especie` varchar(50) NOT NULL,
  `Temporada_Recomendada` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID_Planta`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `planta`
--

LOCK TABLES `planta` WRITE;
/*!40000 ALTER TABLE `planta` DISABLE KEYS */;
INSERT INTO `planta` VALUES (1,'Tomate','Solanum lycopersicum','Primavera'),(2,'Zanahoria','Daucus carota','Invierno'),(3,'Lechuga','Lactuca sativa','Otoño'),(4,'Pimiento','Capsicum annuum','Verano'),(5,'Calabacín','Cucurbita pepo','Primavera');
/*!40000 ALTER TABLE `planta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `ID_Usuario` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) NOT NULL,
  `Fecha_Inscripcion` date NOT NULL,
  `Correo` varchar(50) NOT NULL,
  PRIMARY KEY (`ID_Usuario`),
  UNIQUE KEY `Correo` (`Correo`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Carlos Martínez','2024-01-10','carlos.martinez@gmail.com'),(2,'María Gómez','2024-02-05','maria.gomez@hotmail.com'),(3,'Juan Pérez','2024-02-25','juan.perez@yahoo.com'),(4,'Lucía Hernández','2024-03-15','lucia.hernandez@gmail.com'),(5,'Pedro Sánchez','2024-04-20','pedro.sanchez@gmail.com'),(6,'Ana Torres','2024-05-12','ana.torres@gmail.com'),(7,'Luis López','2024-06-03','luis.lopez@gmail.com'),(8,'Sofía Ramírez','2024-07-07','sofia.ramirez@gmail.com'),(9,'Diego Fernández','2024-08-18','diego.fernandez@gmail.com'),(10,'Elena Ruiz','2024-09-25','elena.ruiz@gmail.com');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_parcela`
--

DROP TABLE IF EXISTS `usuario_parcela`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario_parcela` (
  `ID_Usuario` int DEFAULT NULL,
  `ID_Parcela` int DEFAULT NULL,
  KEY `ID_Usuario` (`ID_Usuario`),
  KEY `ID_Parcela` (`ID_Parcela`),
  CONSTRAINT `usuario_parcela_ibfk_1` FOREIGN KEY (`ID_Usuario`) REFERENCES `usuario` (`ID_Usuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `usuario_parcela_ibfk_2` FOREIGN KEY (`ID_Parcela`) REFERENCES `parcela` (`ID_Parcela`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_parcela`
--

LOCK TABLES `usuario_parcela` WRITE;
/*!40000 ALTER TABLE `usuario_parcela` DISABLE KEYS */;
INSERT INTO `usuario_parcela` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,1),(7,2),(8,3),(9,4),(10,5);
/*!40000 ALTER TABLE `usuario_parcela` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- 1. Obtener todos los usuarios registrados y los datos de las parcelas a su cargo, aunque no tengan parcelas asignadas
SELECT u.*, up.ID_Parcela
FROM usuario u
LEFT JOIN usuario_parcela up ON u.ID_Usuario = up.ID_Usuario;

-- 2. Listar las parcelas y sus respectivos tipos de suelo
SELECT p.ID_Parcela, p.Tamaño, p.Tipo_Suelo
FROM parcela p;

-- 3. Consultar todas las actividades realizadas en el huerto, mostrando el nombre del usuario que las realizó
SELECT a.Fecha, a.Tipo_Actividad, a.Descripción, u.Nombre AS Usuario
FROM actividad a
LEFT JOIN usuario u ON a.ID_Usuario = u.ID_Usuario;

-- 4. Listar las plantas que se han plantado y sus temporadas recomendadas
SELECT p.Nombre_Común, p.Temporada_Recomendada
FROM planta p;

-- 5. Obtener las parcelas donde se plantaron zanahorias (nombre común de planta)
SELECT pa.*
FROM parcela pa
JOIN parcela_planta pp ON pa.ID_Parcela = pp.ID_Parcela
JOIN planta pl ON pp.ID_Planta = pl.ID_Planta
WHERE pl.Nombre_Común = 'Zanahorias';

-- 6. Consultar todas las cosechas realizadas, mostrando planta y cantidad
SELECT c.Fecha_Cosecha, c.Cantidad, p.Nombre_Común AS Planta
FROM cosecha c
JOIN planta p ON c.ID_Planta = p.ID_Planta;


-- 7. Mostrar parcelas con fecha de plantación y tiempo estimado para cosecha
SELECT p.ID_Parcela, p.Tamaño, p.Tipo_Suelo, pp.Fecha_Plantación, pp.Tiempo_Estimado_Cosecha
FROM parcela p
JOIN parcela_planta pp ON p.ID_Parcela = pp.ID_Parcela;


-- 8. Listar las parcelas que tienen tamaño entre 25 y 35 metros cuadrados
SELECT * FROM parcela
WHERE Tamaño BETWEEN 25 AND 35;

-- 9. Mostrar actividades de tipo “Plantación” y “Cosecha”, incluyendo usuario responsable y tipo de suelo
SELECT a.Fecha, a.Tipo_Actividad, u.Nombre AS Responsable, p.Tipo_Suelo
FROM actividad a
LEFT JOIN usuario u ON a.ID_Usuario = u.ID_Usuario
LEFT JOIN parcela p ON a.`ID_Parcela` = p.ID_Parcela
WHERE a.Tipo_Actividad IN ('Plantación', 'Cosecha');

-- 10. Calcular cuántos días han pasado desde la última cosecha
SELECT DATEDIFF(CURDATE(), MAX(c.Fecha_Cosecha)) AS Dias_Desde_Ultima_Cosecha
FROM cosecha c;








-- MySQL dump 10.13  Distrib 8.0.39, for Win64 (x86_64)
--
-- Host: localhost    Database: pizzeria
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
-- Table structure for table `detalle_pedido`
--

DROP TABLE IF EXISTS `detalle_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_pedido` (
  `id_pedido` int NOT NULL,
  `id_ingrediente` int NOT NULL,
  `cantidad_pedida` decimal(10,2) DEFAULT NULL,
  `unidad` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_pedido`,`id_ingrediente`),
  KEY `id_ingrediente` (`id_ingrediente`),
  CONSTRAINT `detalle_pedido_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedido_proveedor` (`id_pedido`),
  CONSTRAINT `detalle_pedido_ibfk_2` FOREIGN KEY (`id_ingrediente`) REFERENCES `ingrediente` (`id_ingrediente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_pedido`
--

LOCK TABLES `detalle_pedido` WRITE;
/*!40000 ALTER TABLE `detalle_pedido` DISABLE KEYS */;
INSERT INTO `detalle_pedido` VALUES (1,3,20.00,'kg'),(1,8,10.00,'kg'),(2,2,15.00,'kg'),(3,4,10.00,'kg'),(3,9,5.00,'kg'),(4,6,2.00,'kg'),(5,1,20.00,'kg'),(6,7,5.00,'litros'),(7,10,25.00,'unidades'),(8,5,5.00,'kg'),(9,1,10.00,'kg'),(10,2,10.00,'kg');
/*!40000 ALTER TABLE `detalle_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingrediente`
--

DROP TABLE IF EXISTS `ingrediente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingrediente` (
  `id_ingrediente` int NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `cantidad_disponible` decimal(10,2) DEFAULT NULL,
  `unidad` varchar(20) DEFAULT NULL,
  `id_proveedor` int DEFAULT NULL,
  PRIMARY KEY (`id_ingrediente`),
  KEY `id_proveedor` (`id_proveedor`),
  CONSTRAINT `ingrediente_ibfk_1` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedor` (`id_proveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingrediente`
--

LOCK TABLES `ingrediente` WRITE;
/*!40000 ALTER TABLE `ingrediente` DISABLE KEYS */;
INSERT INTO `ingrediente` VALUES (1,'Harina',100.00,'kg',7),(2,'Queso mozzarella',50.00,'kg',2),(3,'Tomate',80.00,'kg',3),(4,'Jamón',30.00,'kg',4),(5,'Aceitunas',20.00,'kg',9),(6,'Orégano',5.00,'kg',6),(7,'Aceite de oliva',10.00,'litros',10),(8,'Champiñones',15.00,'kg',3),(9,'Salchicha',25.00,'kg',4),(10,'Masa prelista',50.00,'unidades',5);
/*!40000 ALTER TABLE `ingrediente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido_proveedor`
--

DROP TABLE IF EXISTS `pedido_proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido_proveedor` (
  `id_pedido` int NOT NULL,
  `id_proveedor` int DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  PRIMARY KEY (`id_pedido`),
  KEY `id_proveedor` (`id_proveedor`),
  CONSTRAINT `pedido_proveedor_ibfk_1` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedor` (`id_proveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido_proveedor`
--

LOCK TABLES `pedido_proveedor` WRITE;
/*!40000 ALTER TABLE `pedido_proveedor` DISABLE KEYS */;
INSERT INTO `pedido_proveedor` VALUES (1,3,'2025-05-01'),(2,2,'2025-05-01'),(3,4,'2025-05-01'),(4,6,'2025-05-02'),(5,7,'2025-05-02'),(6,10,'2025-05-03'),(7,5,'2025-05-03'),(8,9,'2025-05-03'),(9,1,'2025-05-04'),(10,8,'2025-05-04');
/*!40000 ALTER TABLE `pedido_proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pizza`
--

DROP TABLE IF EXISTS `pizza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pizza` (
  `id_pizza` int NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_pizza`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pizza`
--

LOCK TABLES `pizza` WRITE;
/*!40000 ALTER TABLE `pizza` DISABLE KEYS */;
INSERT INTO `pizza` VALUES (1,'Margarita',11000.00),(2,'Napolitana',13000.00),(3,'Hawaiana',12000.00),(4,'Cuatro Quesos',14000.00),(5,'Fugazzeta',10000.00),(6,'Pepperoni',14000.00),(7,'Champiñones',10000.00),(8,'Especial de la casa',16000.00),(9,'Vegetariana',12000.00),(10,'Picante',11000.00);
/*!40000 ALTER TABLE `pizza` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pizza_ingrediente`
--

DROP TABLE IF EXISTS `pizza_ingrediente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pizza_ingrediente` (
  `id_pizza` int NOT NULL,
  `id_ingrediente` int NOT NULL,
  `cantidad_necesaria` decimal(10,2) DEFAULT NULL,
  `unidad` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_pizza`,`id_ingrediente`),
  KEY `id_ingrediente` (`id_ingrediente`),
  CONSTRAINT `pizza_ingrediente_ibfk_1` FOREIGN KEY (`id_pizza`) REFERENCES `pizza` (`id_pizza`),
  CONSTRAINT `pizza_ingrediente_ibfk_2` FOREIGN KEY (`id_ingrediente`) REFERENCES `ingrediente` (`id_ingrediente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pizza_ingrediente`
--

LOCK TABLES `pizza_ingrediente` WRITE;
/*!40000 ALTER TABLE `pizza_ingrediente` DISABLE KEYS */;
INSERT INTO `pizza_ingrediente` VALUES (1,1,0.30,'kg'),(1,2,0.20,'kg'),(1,3,0.15,'kg'),(2,1,0.30,'kg'),(2,2,0.25,'kg'),(2,3,0.20,'kg'),(2,6,0.01,'kg'),(3,1,0.30,'kg'),(3,2,0.20,'kg'),(3,3,0.15,'kg'),(3,4,0.15,'kg'),(4,1,0.30,'kg'),(4,2,0.30,'kg'),(5,1,0.25,'kg'),(5,2,0.15,'kg'),(5,3,0.15,'kg'),(5,6,0.01,'kg'),(6,1,0.30,'kg'),(6,2,0.20,'kg'),(6,9,0.15,'kg'),(7,1,0.30,'kg'),(7,2,0.20,'kg'),(7,8,0.15,'kg'),(8,1,0.30,'kg'),(8,2,0.25,'kg'),(8,3,0.20,'kg'),(8,4,0.10,'kg'),(8,5,0.05,'kg'),(9,1,0.25,'kg'),(9,3,0.20,'kg'),(9,8,0.15,'kg'),(10,1,0.30,'kg'),(10,2,0.20,'kg'),(10,6,0.01,'kg'),(10,9,0.20,'kg');
/*!40000 ALTER TABLE `pizza_ingrediente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedor` (
  `id_proveedor` int NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_proveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (1,'Distribuidora Italiana','1111-2222','Calle Roma 123'),(2,'Lácteos del Sur','2222-3333','Av. Leche 456'),(3,'Vegetales Frescos','3333-4444','Huerta 789'),(4,'Carnes Premium','4444-5555','Ruta 1 km 10'),(5,'Delicias Congeladas','5555-6666','Parque Ind. 321'),(6,'Especias del Mundo','6666-7777','Calle Canela 111'),(7,'Panadería Central','7777-8888','Av. Harina 222'),(8,'Quesería Moderna','8888-9999','Camino Queso 333'),(9,'Distribuciones Gourmet','9999-0000','Zona Fría 444'),(10,'Aceites Selectos','1010-1111','Pueblo Oliva 555');
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vista_historial_pedidos`
--

DROP TABLE IF EXISTS `vista_historial_pedidos`;
/*!50001 DROP VIEW IF EXISTS `vista_historial_pedidos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_historial_pedidos` AS SELECT 
 1 AS `nombre_proveedor`,
 1 AS `fecha`,
 1 AS `nombre_ingrediente`,
 1 AS `cantidad_pedida`,
 1 AS `unidad`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_ingredientes_por_pizza`
--

DROP TABLE IF EXISTS `vista_ingredientes_por_pizza`;
/*!50001 DROP VIEW IF EXISTS `vista_ingredientes_por_pizza`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_ingredientes_por_pizza` AS SELECT 
 1 AS `nombre_pizza`,
 1 AS `nombre_ingrediente`,
 1 AS `cantidad_necesaria`,
 1 AS `unidad`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vista_historial_pedidos`
--

/*!50001 DROP VIEW IF EXISTS `vista_historial_pedidos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_historial_pedidos` AS select `pr`.`nombre` AS `nombre_proveedor`,`pp`.`fecha` AS `fecha`,`i`.`nombre` AS `nombre_ingrediente`,`dp`.`cantidad_pedida` AS `cantidad_pedida`,`dp`.`unidad` AS `unidad` from (((`pedido_proveedor` `pp` join `proveedor` `pr` on((`pp`.`id_proveedor` = `pr`.`id_proveedor`))) join `detalle_pedido` `dp` on((`pp`.`id_pedido` = `dp`.`id_pedido`))) join `ingrediente` `i` on((`dp`.`id_ingrediente` = `i`.`id_ingrediente`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_ingredientes_por_pizza`
--

/*!50001 DROP VIEW IF EXISTS `vista_ingredientes_por_pizza`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_ingredientes_por_pizza` AS select `p`.`nombre` AS `nombre_pizza`,`i`.`nombre` AS `nombre_ingrediente`,`pi`.`cantidad_necesaria` AS `cantidad_necesaria`,`pi`.`unidad` AS `unidad` from ((`pizza` `p` join `pizza_ingrediente` `pi` on((`p`.`id_pizza` = `pi`.`id_pizza`))) join `ingrediente` `i` on((`pi`.`id_ingrediente` = `i`.`id_ingrediente`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-22 18:30:40

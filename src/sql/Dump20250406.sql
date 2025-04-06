-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: techlogistics
-- ------------------------------------------------------
-- Server version	8.0.41

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `telefono` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Juan Pérez','juan.perez@mail.com','1234567890'),(2,'Ana Gómez','ana.gomez@mail.com','0987654321');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `envios`
--

DROP TABLE IF EXISTS `envios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `envios` (
  `id_envio` int NOT NULL AUTO_INCREMENT,
  `id_pedido` int DEFAULT NULL,
  `id_transportista` int DEFAULT NULL,
  `id_ruta` int DEFAULT NULL,
  `fecha_salida` date DEFAULT NULL,
  `fecha_entrega_estimada` date DEFAULT NULL,
  PRIMARY KEY (`id_envio`),
  KEY `id_pedido` (`id_pedido`),
  KEY `id_transportista` (`id_transportista`),
  KEY `id_ruta` (`id_ruta`),
  CONSTRAINT `envios_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id_pedido`),
  CONSTRAINT `envios_ibfk_2` FOREIGN KEY (`id_transportista`) REFERENCES `transportistas` (`id_transportista`),
  CONSTRAINT `envios_ibfk_3` FOREIGN KEY (`id_ruta`) REFERENCES `rutas` (`id_ruta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `envios`
--

LOCK TABLES `envios` WRITE;
/*!40000 ALTER TABLE `envios` DISABLE KEYS */;
/*!40000 ALTER TABLE `envios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estados_envio`
--

DROP TABLE IF EXISTS `estados_envio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estados_envio` (
  `id_estado` int NOT NULL AUTO_INCREMENT,
  `estado` varchar(50) NOT NULL,
  PRIMARY KEY (`id_estado`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estados_envio`
--

LOCK TABLES `estados_envio` WRITE;
/*!40000 ALTER TABLE `estados_envio` DISABLE KEYS */;
INSERT INTO `estados_envio` VALUES (1,'Pendiente'),(2,'Enviado'),(3,'Entregado'),(4,'Cancelado');
/*!40000 ALTER TABLE `estados_envio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estadosenvio`
--

DROP TABLE IF EXISTS `estadosenvio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estadosenvio` (
  `id_estado` int NOT NULL AUTO_INCREMENT,
  `id_envio` int DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `fecha_estado` datetime DEFAULT NULL,
  PRIMARY KEY (`id_estado`),
  KEY `id_envio` (`id_envio`),
  CONSTRAINT `estadosenvio_ibfk_1` FOREIGN KEY (`id_envio`) REFERENCES `envios` (`id_envio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estadosenvio`
--

LOCK TABLES `estadosenvio` WRITE;
/*!40000 ALTER TABLE `estadosenvio` DISABLE KEYS */;
/*!40000 ALTER TABLE `estadosenvio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido_producto`
--

DROP TABLE IF EXISTS `pedido_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido_producto` (
  `id_pedido` int NOT NULL,
  `id_producto` int NOT NULL,
  `cantidad` int DEFAULT NULL,
  PRIMARY KEY (`id_pedido`,`id_producto`),
  KEY `id_producto` (`id_producto`),
  CONSTRAINT `pedido_producto_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id_pedido`),
  CONSTRAINT `pedido_producto_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido_producto`
--

LOCK TABLES `pedido_producto` WRITE;
/*!40000 ALTER TABLE `pedido_producto` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedido_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos` (
  `id_pedido` int NOT NULL AUTO_INCREMENT,
  `id_cliente` int DEFAULT NULL,
  `fecha_pedido` varchar(255) DEFAULT NULL,
  `estado_actual` varchar(50) DEFAULT NULL,
  `estado` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_pedido`),
  KEY `id_cliente` (`id_cliente`),
  CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` VALUES (2,1,'2025-04-05','Pendiente',NULL),(3,2,'2025-04-06','Enviado',NULL),(4,2,'2025-04-06',NULL,NULL),(5,2,'2025-04-06',NULL,NULL),(6,2,'2025-04-05',NULL,'Enviado'),(7,1,'2025-04-05',NULL,'Enviado'),(8,2,'2025-05-04',NULL,'Pendiente'),(9,2,'2025-04-05',NULL,'Enviado'),(10,2,'2025-04-05',NULL,'Enviado'),(11,2,'2025-04-05',NULL,'Enviado'),(12,1,'2025-04-05',NULL,'Enviado'),(13,2,'2025-04-05',NULL,'Enviado'),(14,2,'2025-04-05',NULL,'Enviado'),(15,2,'2025-04-05',NULL,'Enviado'),(16,2,'2025-04-05',NULL,'Enviado'),(17,2,'2025-04-05',NULL,'Enviado'),(18,2,'2025-04-05',NULL,'Enviado'),(19,2,'2025-04-05',NULL,'Enviado'),(20,2,'2025-04-05',NULL,'Enviado'),(21,2,'2025-04-05',NULL,'Enviado'),(22,2,'2025-04-05',NULL,'Enviado'),(23,2,'2025-04-05',NULL,'Enviado'),(24,2,'2025-04-05',NULL,'Enviado'),(25,2,'2025-04-05',NULL,'Enviado'),(26,2,'2025-04-05',NULL,'Enviado'),(27,2,'2025-04-05',NULL,'Cancelado'),(28,2,'2025-01-08',NULL,'Enviado'),(29,1,'2025-05-05',NULL,'Pendiente'),(30,2,'2016-07-27',NULL,'Cancelado'),(31,1,'2025-12-31',NULL,'Entregado');
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos_productos`
--

DROP TABLE IF EXISTS `pedidos_productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos_productos` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cantidad` int NOT NULL,
  `id_pedido` bigint NOT NULL,
  `id_producto` bigint NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos_productos`
--

LOCK TABLES `pedidos_productos` WRITE;
/*!40000 ALTER TABLE `pedidos_productos` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedidos_productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `id_producto` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `precio` double NOT NULL,
  PRIMARY KEY (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'Laptop','Laptop Gaming',1200),(2,'Smartphone','Smartphone de última generación',800);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rutas`
--

DROP TABLE IF EXISTS `rutas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rutas` (
  `id_ruta` int NOT NULL AUTO_INCREMENT,
  `origen` varchar(255) DEFAULT NULL,
  `destino` varchar(255) DEFAULT NULL,
  `duracion_estim` time DEFAULT NULL,
  `distancia` double NOT NULL,
  `tiempo_estimado` double NOT NULL,
  `id_transportista` bigint DEFAULT NULL,
  PRIMARY KEY (`id_ruta`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rutas`
--

LOCK TABLES `rutas` WRITE;
/*!40000 ALTER TABLE `rutas` DISABLE KEYS */;
INSERT INTO `rutas` VALUES (1,'Ciudad A','Ciudad B','02:00:00',100.5,2,1),(2,'Ciudad B','Ciudad C','03:00:00',200,3,2);
/*!40000 ALTER TABLE `rutas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transportistas`
--

DROP TABLE IF EXISTS `transportistas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transportistas` (
  `id_transportista` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `telefono` varchar(255) DEFAULT NULL,
  `vehiculo` varchar(50) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_transportista`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transportistas`
--

LOCK TABLES `transportistas` WRITE;
/*!40000 ALTER TABLE `transportistas` DISABLE KEYS */;
INSERT INTO `transportistas` VALUES (1,'Transportes Rápidos S.A.','555123456',NULL,NULL),(2,'Envíos Express','555987654',NULL,NULL);
/*!40000 ALTER TABLE `transportistas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-06  0:09:53

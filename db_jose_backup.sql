-- MySQL dump 10.13  Distrib 8.0.40, for macos12.7 (arm64)
--
-- Host: localhost    Database: db_jose
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `bills`
--

DROP TABLE IF EXISTS `bills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bills` (
  `id` int NOT NULL AUTO_INCREMENT,
  `bill_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `estate_id` int NOT NULL,
  `clients_id` int NOT NULL,
  `owners_id` int NOT NULL,
  `ownership_percent` decimal(5,2) NOT NULL,
  `date` date NOT NULL,
  `tax_base` decimal(10,2) NOT NULL,
  `iva` decimal(10,2) NOT NULL,
  `irpf` decimal(10,2) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `date_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_refund` tinyint(1) DEFAULT '0',
  `original_bill_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `owners_id` (`owners_id`),
  KEY `clients_id` (`clients_id`),
  KEY `estate_id` (`estate_id`),
  KEY `fk_original_bill` (`original_bill_id`),
  CONSTRAINT `bills_ibfk_1` FOREIGN KEY (`owners_id`) REFERENCES `owners` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `bills_ibfk_2` FOREIGN KEY (`clients_id`) REFERENCES `clients` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `bills_ibfk_3` FOREIGN KEY (`estate_id`) REFERENCES `estates` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_original_bill` FOREIGN KEY (`original_bill_id`) REFERENCES `bills` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bills`
--

LOCK TABLES `bills` WRITE;
/*!40000 ALTER TABLE `bills` DISABLE KEYS */;
INSERT INTO `bills` VALUES (11,'FACT-0001',1,2,2,33.33,'2025-05-07',1000.00,210.00,150.00,1060.00,'2025-05-07 19:21:15','2025-05-07 19:21:15',0,NULL),(12,'FACT-0002',1,2,1,0.00,'2027-07-09',1000.00,210.00,150.00,1600.00,'2025-05-09 12:29:14','2025-05-09 12:29:14',0,NULL),(18,'FACT-0003',18,2,1,33.33,'2027-07-09',64.10,21.00,19.00,65.38,'2025-05-09 20:15:10','2025-05-09 20:29:05',0,NULL),(19,'ABONO-0001',1,2,2,33.33,'2025-05-10',-1000.00,210.00,150.00,-1060.00,'2025-05-10 10:46:10','2025-05-10 10:46:10',1,11),(20,'ABONO-0002',18,2,1,33.33,'2025-05-10',-64.10,21.00,19.00,-65.38,'2025-05-10 11:01:53','2025-05-10 11:01:53',1,18);
/*!40000 ALTER TABLE `bills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type_client` enum('particular','empresa','autonomo') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `lastname` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `company_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `identification` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `address` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `postal_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `location` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `province` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `country` varchar(100) NOT NULL,
  `date_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `identificacion` (`identification`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (1,'particular','endi','fray','endifray.sl','123456789b','comercio 1 6b','28007','madrid','madrid','','2025-04-17 08:59:13','2025-04-17 11:28:21'),(2,'particular','endi','fray','endifray.sl','12345678b','comercio 1 6b','28007','madrid','madrid','','2025-04-17 09:18:12','2025-05-01 16:59:11'),(3,'particular','endi','fray','','x2345679b','comercio 1 6b','28008','madrid','madrid','','2025-04-17 09:19:08','2025-04-17 09:19:08'),(4,'empresa','endi','fray','endifray.sl','x2345679','comercio 1 6b','28008','madrid','madrid','','2025-04-17 09:34:54','2025-04-17 09:34:54'),(5,'empresa','endi','fray','endifray.sl','b23456079','comercio 1 6b','28008','madrid','madrid','','2025-04-17 09:35:31','2025-04-17 09:35:31'),(6,'empresa','endi','fray','endifray.sl','b23456779','comercio 1 6b','28008','madrid','madrid','','2025-04-17 09:36:27','2025-04-17 09:36:27'),(7,'empresa','endi','fray','endifray.sl','b2356779','comercio 1 6b','28008','madrid','madrid','','2025-04-17 09:36:30','2025-04-17 09:36:30'),(8,'empresa','endi','fray','endifray.sl','B55236779','comercio 1 6b','28008','madrid','madrid','','2025-04-17 09:37:52','2025-04-17 09:37:52'),(10,'autonomo','endi','fray','endifray.sl','55236779b','comercio 1 6b','28008','madrid','madrid','','2025-04-24 12:06:03','2025-04-24 12:06:03'),(15,'autonomo','endi','fray','endifray.sl','55236771b','comercio 1 6b','28008','madrid','madrid','españa','2025-05-07 19:29:31','2025-05-07 19:29:31');
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estate_owners`
--

DROP TABLE IF EXISTS `estate_owners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estate_owners` (
  `id` int NOT NULL AUTO_INCREMENT,
  `estate_id` int NOT NULL,
  `owners_id` int NOT NULL,
  `ownership_precent` decimal(5,2) NOT NULL,
  `date_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `estate_id` (`estate_id`,`owners_id`),
  KEY `owners_id` (`owners_id`),
  CONSTRAINT `estate_owners_ibfk_1` FOREIGN KEY (`estate_id`) REFERENCES `estates` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `estate_owners_ibfk_2` FOREIGN KEY (`owners_id`) REFERENCES `owners` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estate_owners`
--

LOCK TABLES `estate_owners` WRITE;
/*!40000 ALTER TABLE `estate_owners` DISABLE KEYS */;
INSERT INTO `estate_owners` VALUES (1,1,2,33.33,'2025-05-07 11:00:07','2025-05-07 11:00:07'),(2,15,1,33.33,'2025-05-07 12:25:56','2025-05-07 12:25:56'),(3,15,2,33.33,'2025-05-07 12:36:22','2025-05-07 12:36:22'),(4,16,2,33.33,'2025-05-07 12:48:55','2025-05-07 12:48:55');
/*!40000 ALTER TABLE `estate_owners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estates`
--

DROP TABLE IF EXISTS `estates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estates` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cadastral_reference` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `address` varchar(255) NOT NULL,
  `postal_code` varchar(10) NOT NULL,
  `location` varchar(255) NOT NULL,
  `province` varchar(100) NOT NULL,
  `country` varchar(100) NOT NULL,
  `surface` decimal(10,2) NOT NULL,
  `date_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estates`
--

LOCK TABLES `estates` WRITE;
/*!40000 ALTER TABLE `estates` DISABLE KEYS */;
INSERT INTO `estates` VALUES (1,'8335803VL0083N0013EI',615.00,'calle monteleon 7 3 e','28440','guadarrama','madrid','españa',60.00,'2025-04-24 11:16:15','2025-05-21 08:12:21'),(15,'276SGHR4D4E5YE44UWA7',6140.00,'calle monteleon 7 3 e','28440','guadarrama','madrid','españa',60.00,'2025-04-27 09:45:58','2025-05-19 12:35:24'),(16,'276SGHR4D4E5YE44UWA5',600.00,'calle monteleon 7 3 e','28440','guadarrama','madrid','españa',60.00,'2025-04-27 09:46:15','2025-05-19 12:35:34'),(17,'276SGHR4D4E5YE44UWA6',600.00,'calle monteleon 7 3 e','28440','guadarrama','madrid','españa',60.00,'2025-04-27 09:46:20','2025-05-19 12:37:31'),(18,'276SGHR4D4E5YE44UWA1',600.00,'calle monteleon 7 3 e','28440','guadarrama','madrid','españa',60.00,'2025-05-07 19:41:03','2025-05-07 19:41:03'),(23,'23ERFGHTUOKS345RTGHN',444.00,'JUANA 3 5F','28400','MADRID','MADRID','ESPAÑA',9000.00,'2025-05-20 10:20:51','2025-05-20 10:20:51'),(24,'45RTYDER4UIOSW2345UF',5555.00,'HOLA 4 6Y','28004','MADRID','MADRID','ESPAÑA',8000.00,'2025-05-20 10:33:05','2025-05-20 10:33:05'),(25,'ER43EWDY568URE4RDTGK',4444.00,'HOLA34 56Y','28004','MADRID','MADRID','ESPAÑA',23.00,'2025-05-20 10:37:48','2025-05-20 10:37:48'),(26,'ERTDWERTUJ2345DTYU45',35.00,'FEUO 33 4R','28004','MADRID','MADRID','ESPAÑA',34.00,'2025-05-20 10:40:12','2025-05-21 10:16:35'),(27,'ERT45UEDFJRTY45RDTY4',55.00,'FGOLA 4 56Y','28004','MADRID','MADRID','ESPAÑA',45.00,'2025-05-20 10:53:06','2025-05-20 10:54:47'),(29,'78345TYERFH34RESGQ9I',666.00,'HOLAA 3 R','28004','MADRIOD','MADRID','ESPAÑA',900.00,'2025-05-21 08:14:11','2025-05-21 08:14:11');
/*!40000 ALTER TABLE `estates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `owners`
--

DROP TABLE IF EXISTS `owners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `owners` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `lastname` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(255) NOT NULL,
  `nif` varchar(20) NOT NULL,
  `address` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `postal_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `location` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `province` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `country` varchar(100) NOT NULL,
  `date_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nif` (`nif`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `owners`
--

LOCK TABLES `owners` WRITE;
/*!40000 ALTER TABLE `owners` DISABLE KEYS */;
INSERT INTO `owners` VALUES (1,'Pedro','García','pedro.garcia@example.com','12345678A','Calle Mayor 12','28013','Madrid','Madrid','','2025-04-27 15:08:14','2025-04-27 15:08:14'),(2,'Pedro2','García2','pedro.garcia2@example.com','12345678B','Calle Mayor 12','28013','Madrid','Madrid','','2025-04-27 21:23:51','2025-04-27 21:23:51'),(3,'Pedro3','García3','pedro.garcia2@example.com','12345678C','Calle Mayor 6','28013','Madrid','Madrid','','2025-04-27 21:24:53','2025-05-01 17:04:13');
/*!40000 ALTER TABLE `owners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `role` enum('admin','employee') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `date_create` timestamp NOT NULL,
  `date_update` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'endi','$2b$10$iK971wepJ0/65oUaHjBQxeajczpk4vf/duEyYQVwbBk7EfLp7ay2y','endi@gmail.com','666777555','admin','2025-05-14 08:15:45','2025-05-14 08:15:45'),(2,'jose1','$2b$10$8EXImHY9DS8lAIu2..IHq.d7g5jTl4B4EG/W3ch0tZcZp01iZAyNi','jose1@hotmail.com','666777333','employee','2025-05-14 08:15:52','2025-05-14 08:15:52'),(3,'endi14','$2b$10$kNMcEP6CfppD9/3u0djW5eISb99HSu/z3UTrC.lqZGO35buwDO/hy','endi4@hotmail.com','666666222','employee','2025-05-14 08:55:00','2025-05-22 21:05:45'),(4,'endi5','$2b$10$VBSpLRz1h6vlMEYMM/MbqOGXjBxQsJuEd98hgnGO8dcLxCgTza5V2','endi5@hotmail.com','666555777','employee','2025-05-14 11:33:52','2025-05-14 11:33:52'),(5,'endi6','$2b$10$ETLhVAPk7gndCtVYovO7u.m4eoFuOcv1v7UIl5Nwl0CKNwaTeNPG2','endi6@hotmail.com','666777888666','employee','2025-05-14 11:55:48','2025-05-14 11:55:48'),(6,'endi9','$2b$10$/eOkBK/qRbjQT4ghPd422.prO5miE4NzvcgR84w05Q2VFyhOA0.Qy','endi@hotmail.com','666777886','employee','2025-05-14 14:41:30','2025-05-14 14:41:30'),(7,'endif1','$2b$10$JM5Y3OfTowKvbltX.JaF9OlzsrtaHWxwG6.6LbNMDvxgADhv8U0gi','endif1@hotmail.com','666777885','employee','2025-05-14 14:54:39','2025-05-14 14:54:39'),(8,'endi1','$2b$10$lea2iU8BkUEdnEHq5tCjnuntkbCLAmBhilqcIKKnzTT0.ABJlWoTy','endi1@hotmail.com','666777888','employee','2025-05-14 17:12:32','2025-05-14 17:12:32'),(9,'3er','$2b$10$Gb0aQTOgmpfRmvOk27W8EODoJNKL1KjvNIA82x9VlIdFFFBirodIK','endi8@hotmail.com','666777567','employee','2025-05-16 09:47:44','2025-05-16 09:47:44');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-24 14:33:54

-- MySQL dump 10.13  Distrib 5.7.9, for osx10.9 (x86_64)
--
-- Host: 173.194.224.215    Database: pacientes-dev1
-- ------------------------------------------------------
-- Server version	5.6.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `info_contactos`
--

DROP TABLE IF EXISTS `info_contactos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `info_contactos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `telefono` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nombre_contacto` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parentesco` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `persona_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `info_contactos`
--

LOCK TABLES `info_contactos` WRITE;
/*!40000 ALTER TABLE `info_contactos` DISABLE KEYS */;
INSERT INTO `info_contactos` VALUES (1,'88138032','Andres Calderon','Padre',1,'2016-01-13 14:31:08','2016-01-13 14:31:08'),(2,'88326978','Rossy Gomez','Madre',1,'2016-01-13 14:32:16','2016-01-13 14:32:16'),(8,'88970445','Paola C','Hermana',2,'2016-01-13 20:23:31','2016-01-13 20:23:31'),(9,'88888888','David Gamboa','Hermano',3,'2016-01-13 21:56:58','2016-01-13 21:56:58'),(10,'81234567','Test','ABC',1,'2016-01-24 19:22:52','2016-01-24 19:22:52'),(11,'9988776655','AVD','sa',2,'2016-01-26 03:36:58','2016-01-26 03:36:58'),(12,'88970445','Paola Calderon','Familiar',4,'2016-02-03 23:23:00','2016-02-03 23:23:00'),(13,'8888888','Mino','ABc',4,'2016-02-03 23:23:16','2016-02-03 23:23:16'),(14,'88888888','aaaaaa','aaaaaa',6,'2016-03-18 21:13:26','2016-03-18 21:13:26'),(15,'222','aaa','sss',1,'2016-03-22 03:12:43','2016-03-22 03:12:43');
/*!40000 ALTER TABLE `info_contactos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-05-24 23:55:25

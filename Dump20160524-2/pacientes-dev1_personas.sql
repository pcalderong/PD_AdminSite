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
-- Table structure for table `personas`
--

DROP TABLE IF EXISTS `personas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `primer_apellido` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `segundo_apellido` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `correo_electronico` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `genero` tinyint(1) DEFAULT NULL,
  `cedula` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `estado_civil` int(11) DEFAULT NULL,
  `telefono` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personas`
--

LOCK TABLES `personas` WRITE;
/*!40000 ALTER TABLE `personas` DISABLE KEYS */;
INSERT INTO `personas` VALUES (1,'Paola','Calderon','Gomez','1999-04-08','paocalderon22@gmail.com',0,'114500006',9,'88326978','2016-01-13 05:17:28','2016-04-10 01:46:39'),(2,'Mary','Calderon','Gomez','1998-04-13','mary@gmail.com',0,'',0,'','2016-01-13 05:17:59','2016-01-13 05:17:59'),(3,'test','dos','tres','1998-01-13','',0,'',2,'','2016-01-13 05:18:30','2016-03-24 21:38:36'),(4,'Monserrat','Rojas','Jara','1998-05-05','monse@gmail.com',0,'111111111111',1,'88888888','2016-02-03 23:18:42','2016-02-03 23:18:42'),(6,'Minoshka ','Solis','Amador','2000-03-18','jjjjj',0,'11581095',1,'88888888','2016-03-18 20:56:18','2016-03-18 21:03:57'),(7,'Alberto','Jimenez','Lopez','2000-03-23','',1,'11111111',9,'99999999','2016-05-10 17:00:28','2016-05-25 03:54:05'),(8,'Rossy ','Gomez','Arce','2000-02-18',NULL,NULL,'11111112',NULL,'99999999','2016-05-10 17:00:28','2016-05-10 17:00:28'),(9,'Prueba1','Prueba11','Prueba111','1990-02-07','abc@def.com',1,'111111111',9,'22222222','2016-05-25 01:06:47','2016-05-25 01:06:47'),(10,'David','Gamboa','Mora','1992-04-16','aaa@bbb.com',1,'11111',9,'1111','2016-05-25 01:49:16','2016-05-25 01:49:16'),(11,'Ale','BB','CC','1998-04-08','eee@rrr.com',0,'34567890',9,'1111111','2016-05-25 01:50:18','2016-05-25 01:50:18'),(12,'Jackie','B','C','1999-04-08','aaa',0,'111111111',9,'88888888','2016-05-25 05:31:08','2016-05-25 05:31:08');
/*!40000 ALTER TABLE `personas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-05-24 23:55:36

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
-- Table structure for table `info_extra_pacientes`
--

DROP TABLE IF EXISTS `info_extra_pacientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `info_extra_pacientes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `estudiante` tinyint(1) DEFAULT NULL,
  `trabajador` tinyint(1) DEFAULT NULL,
  `lugar_estudio_trabajo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hijos` tinyint(1) DEFAULT NULL,
  `cant_hijos` int(11) DEFAULT NULL,
  `referencia_trab_social` tinyint(1) DEFAULT NULL,
  `ayuda_alimentos` tinyint(1) DEFAULT NULL,
  `ayuda_medicamento` tinyint(1) DEFAULT NULL,
  `persona_id` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `cant_hermanos` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `info_extra_pacientes`
--

LOCK TABLES `info_extra_pacientes` WRITE;
/*!40000 ALTER TABLE `info_extra_pacientes` DISABLE KEYS */;
INSERT INTO `info_extra_pacientes` VALUES (5,1,0,'HP',1,3,1,0,0,'1','2016-02-03 17:06:01','2016-02-03 17:06:01',NULL),(6,1,0,'Colegio X',1,2,0,1,0,'4','2016-02-03 23:23:33','2016-02-03 23:23:33',NULL),(7,1,0,'Colegio Tecnico Don Bosco',0,0,0,0,0,'11','2016-05-25 03:49:38','2016-05-25 03:49:38',NULL),(8,1,0,'Colegio Britanico',0,NULL,0,0,0,'7','2016-05-25 03:55:01','2016-05-25 03:55:01',NULL);
/*!40000 ALTER TABLE `info_extra_pacientes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-05-24 23:55:30

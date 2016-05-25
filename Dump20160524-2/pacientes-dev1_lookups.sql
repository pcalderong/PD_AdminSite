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
-- Table structure for table `lookups`
--

DROP TABLE IF EXISTS `lookups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lookups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent` int(11) DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `descripcion` text COLLATE utf8_unicode_ci,
  `lookup_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lookups`
--

LOCK TABLES `lookups` WRITE;
/*!40000 ALTER TABLE `lookups` DISABLE KEYS */;
INSERT INTO `lookups` VALUES (1,0,'EstadoPaciente','Informacion sobre estados clinicos','parent','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2,1,'Tratamiento','Tratamiento','EstadoPaciente','0000-00-00 00:00:00','0000-00-00 00:00:00'),(3,1,'Recaida','Recaida','EstadoPaciente','0000-00-00 00:00:00','0000-00-00 00:00:00'),(4,1,'Control','Control','EstadoPaciente','0000-00-00 00:00:00','0000-00-00 00:00:00'),(5,1,'Remision','Remision','EstadoPaciente','0000-00-00 00:00:00','0000-00-00 00:00:00'),(7,1,'Fallecido ','Fallecido','EstadoPaciente','0000-00-00 00:00:00','0000-00-00 00:00:00'),(8,0,'EstadoCivil','Define Estados Civiles','parent','0000-00-00 00:00:00','0000-00-00 00:00:00'),(9,8,'Soltero','Soltera','EstadoCivil','0000-00-00 00:00:00','0000-00-00 00:00:00'),(10,8,'Casado','Casada','EstadoCivil','0000-00-00 00:00:00','0000-00-00 00:00:00'),(11,8,'Union Libre','Union Libre','EstadoCivil','0000-00-00 00:00:00','0000-00-00 00:00:00'),(12,8,'Viudo','Viuda','EstadoCivil','0000-00-00 00:00:00','0000-00-00 00:00:00'),(13,0,'Especialidad','Especialidad','parent','0000-00-00 00:00:00','0000-00-00 00:00:00'),(14,13,'Hematologia','Especialidad','Especialidad','0000-00-00 00:00:00','2016-04-09 16:05:38'),(16,13,'Enfermedad Cronica','Especialidad','Especialidad','0000-00-00 00:00:00','0000-00-00 00:00:00'),(17,0,'Direccion','Direccion','parent','0000-00-00 00:00:00','0000-00-00 00:00:00'),(18,17,'San Jose','Provincia','Direccion','2016-02-02 05:12:37','2016-02-02 05:12:37'),(38,13,'Oncologia','Especialidad','Especialidad','2016-02-03 04:14:41','2016-02-03 04:14:41'),(41,17,'Heredia','Provincia','Direccion','2016-02-03 13:52:31','2016-02-03 13:52:31'),(48,17,'Aserri','Canton - San Jose','Direccion','2016-02-03 14:35:08','2016-03-28 14:31:55'),(49,17,'Perez Zeledon','Canton - San Jose','Direccion','2016-02-03 14:38:13','2016-03-28 14:35:44'),(50,0,'Padecimiento','Lista de Padecimientos y Tipos respectivos','parent','0000-00-00 00:00:00','0000-00-00 00:00:00'),(51,50,'Leucemia','Padecimiento','Padecimiento','0000-00-00 00:00:00','0000-00-00 00:00:00'),(54,17,'Cartago','Provincia','Direccion','2016-02-03 14:47:31','2016-02-03 14:47:31'),(55,50,'Linfoma de Hodgkin','Padecimiento','Padecimiento','2016-02-03 14:52:00','2016-02-03 14:52:00'),(56,17,'Alajuela','Provincia','Direccion','2016-02-03 15:04:27','2016-02-03 15:04:27'),(57,13,'Otro','Otro','Especialidad','2016-02-03 15:09:51','2016-02-03 15:09:51'),(58,1,'Otro','Otro','EstadoPaciente','2016-02-03 15:14:16','2016-02-03 15:14:16'),(64,17,'San Sebastan','Distrito - San Jose','Direccion','2016-02-03 16:33:31','2016-03-28 14:37:16'),(65,0,'Hospital','Hospital','parent','0000-00-00 00:00:00','0000-00-00 00:00:00'),(66,65,'San Juan de Dios','Hospital San Jose','Hospital','0000-00-00 00:00:00','0000-00-00 00:00:00'),(67,65,'Mexico','Uruca','Hospital','2016-02-03 17:17:08','2016-02-03 17:17:08'),(68,65,'Calderon Guardia','San Jose','Hospital','2016-02-03 17:17:20','2016-02-03 17:17:20'),(69,0,'TipoAtencion','Interaccion de Proyecto Daniel con los pacientes','parent','0000-00-00 00:00:00','0000-00-00 00:00:00'),(70,69,'Cuartos de PD','Cuartos de PD','TipoAtencion','0000-00-00 00:00:00','0000-00-00 00:00:00'),(71,17,'Guanacaste','Provincia','Direccion','2016-02-04 00:00:13','2016-02-04 00:00:13'),(72,17,'Liberia','Canton - Guanacaste ','Direccion','2016-03-28 14:32:07','2016-03-28 14:32:07'),(73,17,'San Carlos','Canton - Alajuela','Direccion','2016-03-28 14:32:21','2016-03-28 14:32:31'),(74,17,'Nicoya','Canton - Guanacaste','Direccion','2016-03-28 14:35:00','2016-03-28 14:37:26'),(75,17,'Cot','Canton - Cartago','Direccion','2016-03-28 14:35:14','2016-03-28 14:37:35'),(76,69,'Paciente','Ingreso a Cuartos de Proyecto',NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(77,69,'Paciente','Paciente','TipoAtencion','0000-00-00 00:00:00','0000-00-00 00:00:00'),(78,8,'Otro','Otro','EstadoCivil','2016-04-09 17:40:19','2016-04-09 17:40:19'),(79,17,'San Jose','Canton - San Jose','Direccion','2016-04-27 05:26:41','2016-04-27 05:26:41'),(80,50,'Leucemia linfática aguda','Padecimiento - Leucemia','Padecimiento','2016-04-30 13:41:03','2016-04-30 13:41:03'),(81,50,'Osteosarcoma','Padecimiento','Padecimiento','2016-05-05 02:38:20','2016-05-05 02:38:20'),(82,50,'Convencional Central','Padecimiento - Osteosarcoma','Padecimiento','2016-05-05 02:39:29','2016-05-05 02:39:29');
/*!40000 ALTER TABLE `lookups` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-05-24 23:54:58

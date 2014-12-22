CREATE DATABASE  IF NOT EXISTS `test` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `test`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: localhost    Database: test
-- ------------------------------------------------------
-- Server version	5.5.38

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
-- Table structure for table `paycal`
--

DROP TABLE IF EXISTS `paycal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paycal` (
  `datecal` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paycal`
--

LOCK TABLES `paycal` WRITE;
/*!40000 ALTER TABLE `paycal` DISABLE KEYS */;
INSERT INTO `paycal` VALUES ('06/22/14~07/05/14'),('07/06/14~07/19/14'),('07/20/14~08/02/14'),('08/03/14~08/16/14'),('08/17/14~08/30/14 '),('08/31/14~09/13/14 '),('09/14/14~09/27/14 '),('09/28/14~10/11/14 '),('10/12/14~10/25/14 '),('10/26/14~11/08/14 '),('11/09/14~11/22/14 '),('11/23/14~12/06/14 '),('12/07/14~12/20/14 '),('12/21/14~01/03/15 '),('01/04/15~01/17/15 '),('01/18/15~01/31/15 '),('02/01/15~02/14/15 '),('02/15/15~02/28/15 '),('03/01/15~03/14/15 '),('03/15/15~03/28/15 '),('03/29/15~04/11/15 '),('04/12/15~04/25/15 '),('04/26/15~05/09/15 '),('05/10/15~05/23/15 '),('05/24/15~06/06/15 '),('06/07/15~06/20/15');
/*!40000 ALTER TABLE `paycal` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-07-23 16:33:41

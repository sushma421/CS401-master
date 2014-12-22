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
-- Table structure for table `studentprofile`
--

DROP TABLE IF EXISTS `studentprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `studentprofile` (
  `fname` varchar(20) DEFAULT NULL,
  `lName` varchar(20) DEFAULT NULL,
  `neiuId` int(11) DEFAULT NULL,
  `neiuUserName` varchar(25) NOT NULL,
  `emailId` varchar(50) DEFAULT NULL,
  `manager` varchar(50) DEFAULT NULL,
  `jobId` int(11) DEFAULT NULL,
  `fundId` int(11) DEFAULT NULL,
  `orgId` int(11) DEFAULT NULL,
  `jobPosition` varchar(50) DEFAULT NULL,
  `activationStatus` int(11) DEFAULT NULL,
  PRIMARY KEY (`neiuUserName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studentprofile`
--

LOCK TABLES `studentprofile` WRITE;
/*!40000 ALTER TABLE `studentprofile` DISABLE KEYS */;
INSERT INTO `studentprofile` VALUES ('testFrstName','testLastName',555555,'testStudent','test@email.com',NULL,1,10036,20015,'Graduate Assistant',1),('FName1','LName1',121121,'UserName1','test1@email.com',NULL,1,10036,20015,'Graduate Assistant',1),('FName2','LName2',131131,'UserName2','test2@email.com',NULL,3,10034,20013,'StudentAid',1),('FName3','LName3',141141,'UserName3','test3@email.com',NULL,2,10035,20014,'Work Study',1);
/*!40000 ALTER TABLE `studentprofile` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-07-23 16:33:45

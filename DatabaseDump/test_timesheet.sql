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
-- Table structure for table `timesheet`
--

DROP TABLE IF EXISTS `timesheet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timesheet` (
  `timesheetId` int(11) NOT NULL AUTO_INCREMENT,
  `neiuId` int(11) DEFAULT NULL,
  `dateSubmitted` datetime DEFAULT NULL,
  `payPeriod` varchar(30) DEFAULT NULL,
  `week1mon` int(11) DEFAULT NULL,
  `week1tue` int(11) DEFAULT NULL,
  `week1wed` int(11) DEFAULT NULL,
  `week1thu` int(11) DEFAULT NULL,
  `week1fri` int(11) DEFAULT NULL,
  `week1sat` int(11) DEFAULT NULL,
  `week1sun` int(11) DEFAULT NULL,
  `week2mon` int(11) DEFAULT NULL,
  `week2tue` int(11) DEFAULT NULL,
  `week2wed` int(11) DEFAULT NULL,
  `week2thu` int(11) DEFAULT NULL,
  `week2fri` int(11) DEFAULT NULL,
  `week2sat` int(11) DEFAULT NULL,
  `week2sun` int(11) DEFAULT NULL,
  `totalweek1` int(11) DEFAULT NULL,
  `totalweek2` int(11) DEFAULT NULL,
  `totalweek` int(11) DEFAULT NULL,
  `studentComments` varchar(400) DEFAULT NULL,
  `managerComments` varchar(400) DEFAULT ' ',
  `timesheetStatus` varchar(20) DEFAULT 'Pending',
  PRIMARY KEY (`timesheetId`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timesheet`
--

LOCK TABLES `timesheet` WRITE;
/*!40000 ALTER TABLE `timesheet` DISABLE KEYS */;
INSERT INTO `timesheet` VALUES (32,592770,'2014-07-21 20:39:47','12/3/2013',0,0,0,6,0,6,0,0,0,0,0,6,0,0,12,6,18,'comments12','11','approved'),(35,555555,'2014-07-21 21:11:04','14/7-28/7',0,0,6,0,7,0,0,6,0,0,6,0,0,0,13,12,25,'test Student  comments updated','approved ','approved'),(57,555555,'2014-07-23 14:06:47','06/22/14~07/05/14',0,0,5,0,5,0,5,0,0,0,5,0,0,0,15,5,20,'student comments','manager comments','Rejected'),(59,555555,'2014-07-23 14:07:51','06/22/14~07/05/14',0,0,0,5,0,0,5,0,0,0,0,5,0,0,10,5,15,'test student comments',' ','Pending'),(60,121121,'2014-07-23 16:25:12','06/22/14~07/05/14',0,0,0,0,6,0,0,0,0,0,6,0,0,0,6,6,12,'student comments',' ','Pending');
/*!40000 ALTER TABLE `timesheet` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-07-23 16:33:43

-- MySQL dump 10.14  Distrib 5.5.34-MariaDB, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: EventoTest
-- ------------------------------------------------------
-- Server version	5.5.34-MariaDB-1~wheezy-log

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
-- Current Database: `EventoTest`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `EventoTest` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `EventoTest`;

--
-- Table structure for table `tblPerson`
--

DROP TABLE IF EXISTS `tblPerson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblPerson` (
  `IdPerson` int(11) NOT NULL AUTO_INCREMENT,
  `PersonAnrede` varchar(64) NOT NULL,
  `PersonVorname` varchar(64) NOT NULL,
  `PersonNachname` varchar(64) NOT NULL,
  PRIMARY KEY (`IdPerson`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblPerson`
--

LOCK TABLES `tblPerson` WRITE;
/*!40000 ALTER TABLE `tblPerson` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblPerson` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `EventoDevelopment`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `EventoDevelopment` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `EventoDevelopment`;

--
-- Table structure for table `MadrasApplication`
--

DROP TABLE IF EXISTS `MadrasApplication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MadrasApplication` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `APIKey` varchar(32) DEFAULT NULL,
  `Description` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MadrasApplication`
--

LOCK TABLES `MadrasApplication` WRITE;
/*!40000 ALTER TABLE `MadrasApplication` DISABLE KEYS */;
INSERT INTO `MadrasApplication` VALUES (1,'ruben','Test API key Ruben.'),(2,'w46ft789zuhi43','Stiftungsdatenbank, Beat Rohrer.');
/*!40000 ALTER TABLE `MadrasApplication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MadrasField`
--

DROP TABLE IF EXISTS `MadrasField`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MadrasField` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `ModelId` int(11) NOT NULL,
  `Name` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `ModelId` (`ModelId`,`Name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MadrasField`
--

LOCK TABLES `MadrasField` WRITE;
/*!40000 ALTER TABLE `MadrasField` DISABLE KEYS */;
INSERT INTO `MadrasField` VALUES (1,1,'IdPerson'),(2,1,'PersonAnrede'),(4,1,'PersonNachname'),(3,1,'PersonVorname');
/*!40000 ALTER TABLE `MadrasField` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MadrasFieldPermission`
--

DROP TABLE IF EXISTS `MadrasFieldPermission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MadrasFieldPermission` (
  `PermissionId` int(11) NOT NULL,
  `FieldId` int(11) NOT NULL,
  UNIQUE KEY `PermissionId` (`PermissionId`,`FieldId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MadrasFieldPermission`
--

LOCK TABLES `MadrasFieldPermission` WRITE;
/*!40000 ALTER TABLE `MadrasFieldPermission` DISABLE KEYS */;
INSERT INTO `MadrasFieldPermission` VALUES (1,1),(1,2),(1,3),(1,4);
/*!40000 ALTER TABLE `MadrasFieldPermission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MadrasModel`
--

DROP TABLE IF EXISTS `MadrasModel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MadrasModel` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MadrasModel`
--

LOCK TABLES `MadrasModel` WRITE;
/*!40000 ALTER TABLE `MadrasModel` DISABLE KEYS */;
INSERT INTO `MadrasModel` VALUES (1,'person');
/*!40000 ALTER TABLE `MadrasModel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MadrasPermission`
--

DROP TABLE IF EXISTS `MadrasPermission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MadrasPermission` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `ApplicationId` int(11) NOT NULL,
  `PermissionTypeId` int(11) NOT NULL,
  `FieldPermissionId` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `ApplicationId` (`ApplicationId`,`PermissionTypeId`,`FieldPermissionId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MadrasPermission`
--

LOCK TABLES `MadrasPermission` WRITE;
/*!40000 ALTER TABLE `MadrasPermission` DISABLE KEYS */;
INSERT INTO `MadrasPermission` VALUES (1,1,2,1);
/*!40000 ALTER TABLE `MadrasPermission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MadrasPermissionType`
--

DROP TABLE IF EXISTS `MadrasPermissionType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MadrasPermissionType` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MadrasPermissionType`
--

LOCK TABLES `MadrasPermissionType` WRITE;
/*!40000 ALTER TABLE `MadrasPermissionType` DISABLE KEYS */;
INSERT INTO `MadrasPermissionType` VALUES (1,'Create'),(2,'Read'),(3,'Update'),(4,'Delete');
/*!40000 ALTER TABLE `MadrasPermissionType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MadrasRoute`
--

DROP TABLE IF EXISTS `MadrasRoute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MadrasRoute` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `RoutePattern` varchar(256) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MadrasRoute`
--

LOCK TABLES `MadrasRoute` WRITE;
/*!40000 ALTER TABLE `MadrasRoute` DISABLE KEYS */;
INSERT INTO `MadrasRoute` VALUES (1,'/api/%/people/%');
/*!40000 ALTER TABLE `MadrasRoute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MadrasRouteModel`
--

DROP TABLE IF EXISTS `MadrasRouteModel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MadrasRouteModel` (
  `ModelId` int(11) NOT NULL,
  `RouteId` int(11) NOT NULL,
  UNIQUE KEY `ModelId` (`ModelId`,`RouteId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MadrasRouteModel`
--

LOCK TABLES `MadrasRouteModel` WRITE;
/*!40000 ALTER TABLE `MadrasRouteModel` DISABLE KEYS */;
INSERT INTO `MadrasRouteModel` VALUES (1,1);
/*!40000 ALTER TABLE `MadrasRouteModel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblPerson`
--

DROP TABLE IF EXISTS `tblPerson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblPerson` (
  `IdPerson` int(11) NOT NULL AUTO_INCREMENT,
  `PersonAnrede` varchar(64) NOT NULL,
  `PersonVorname` varchar(64) NOT NULL,
  `PersonNachname` varchar(64) NOT NULL,
  PRIMARY KEY (`IdPerson`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblPerson`
--

LOCK TABLES `tblPerson` WRITE;
/*!40000 ALTER TABLE `tblPerson` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblPerson` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-12-12 12:29:12

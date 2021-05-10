CREATE DATABASE  IF NOT EXISTS `crms` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `crms`;
-- MySQL dump 10.13  Distrib 8.0.22, for macos10.15 (x86_64)
--
-- Host: 127.0.0.1    Database: crms
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `affidavit`
--

DROP TABLE IF EXISTS `affidavit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `affidavit` (
  `docNumber` int NOT NULL,
  `email` varchar(320) DEFAULT NULL,
  `phoneNumber` varchar(20) DEFAULT NULL,
  `dateGiven` date DEFAULT NULL,
  `affiantName` varchar(75) NOT NULL,
  PRIMARY KEY (`docNumber`),
  CONSTRAINT `docNum_fkey` FOREIGN KEY (`docNumber`) REFERENCES `documents` (`docNumber`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `affidavit`
--

LOCK TABLES `affidavit` WRITE;
/*!40000 ALTER TABLE `affidavit` DISABLE KEYS */;
INSERT INTO `affidavit` VALUES (1,'aroberts@gmail.ca','604-123-4567','2021-03-03','Aaron Roberts'),(2,'oforslin@gmail.ca','604-345-6789','2021-03-05','Oliver Forslin'),(6,'bthomson@gmail.ca','604-234-5678','2021-03-04','Bonnie Thomson'),(7,'djohnson@gmail.ca','778-123-4567','2021-03-06','Dwayne Johnson'),(11,'khart@gmail.ca','778-234-5678','2021-03-07','Kevin Hart');
/*!40000 ALTER TABLE `affidavit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appellant`
--

DROP TABLE IF EXISTS `appellant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appellant` (
  `SIN` int NOT NULL,
  `caseNumber` int NOT NULL,
  `barristerEmail` varchar(320) DEFAULT NULL,
  `barristerName` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`SIN`,`caseNumber`),
  KEY `caseAppellant_fkey_idx` (`caseNumber`),
  CONSTRAINT `caseApp_fkey` FOREIGN KEY (`caseNumber`) REFERENCES `cases` (`Number`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sinApp_fkey` FOREIGN KEY (`SIN`) REFERENCES `participants` (`SIN`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appellant`
--

LOCK TABLES `appellant` WRITE;
/*!40000 ALTER TABLE `appellant` DISABLE KEYS */;
INSERT INTO `appellant` VALUES (123123345,4,'kmunynam@law.ca','Kristin Munynam'),(123345345,3,'jbean@law.ca','Jacob Bean'),(123456345,1,'hspecter@law.ca','Harvey Spectre'),(123456345,2,'mross@law.ca','Matthew Ross'),(123678345,5,'skerr@law.ca','Steve Kerr');
/*!40000 ALTER TABLE `appellant` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `appellant_AFTER_DELETE` AFTER DELETE ON `appellant` FOR EACH ROW BEGIN

DECLARE app_count INT;
DECLARE wit_count INT;
DECLARE resp_count INT;
SELECT count(*) 
INTO app_count
FROM appellant AS a     
WHERE OLD.SIN = a.SIN;

SELECT count(*) 
INTO wit_count
FROM witness AS w     
WHERE OLD.SIN = w.SIN;

SELECT count(*) 
INTO resp_count
FROM respondent AS r     
WHERE OLD.SIN = r.SIN;

IF app_count = 0 AND wit_count = 0 AND resp_count = 0
	THEN DELETE FROM participants 
	WHERE SIN = OLD.SIN;
END IF;
    

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `appellent`
--

DROP TABLE IF EXISTS `appellent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appellent` (
  `SIN` int NOT NULL,
  `caseNumber` int NOT NULL,
  `Name` varchar(75) DEFAULT NULL,
  `phoneNumber` varchar(20) DEFAULT NULL,
  `Address` varchar(100) DEFAULT NULL,
  `barristerEmail` varchar(320) DEFAULT NULL,
  `barristerName` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`SIN`,`caseNumber`),
  KEY `caseAppellant_fkey_idx` (`caseNumber`),
  CONSTRAINT `caseAppellant_fkey` FOREIGN KEY (`caseNumber`) REFERENCES `cases` (`Number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appellent`
--

LOCK TABLES `appellent` WRITE;
/*!40000 ALTER TABLE `appellent` DISABLE KEYS */;
INSERT INTO `appellent` VALUES (123123345,4,'Ryan Goodfellow','647-395-234','123 High Rd, Toronto, ON','kmunynam@law.ca','Kristin Munynam'),(123345345,3,'Sevak Ocala','647-345-204','123 TreeRoute Rd, Toronto, ON','jbean@law.ca','Jacob Bean'),(123456345,1,'John Deere','345-315-204','123 Deere Rd, Toronto, ON','hspecter@law.ca','Harvey Spectre'),(123456345,2,'Daniel lau','778-355-224','888 River Rd, Burnaby, BC','mross@law.ca','Matthew Ross'),(123678345,5,'Jakob Tico','612-348-294','123 Center St, Toronto, ON','skerr@law.ca','Steve Kerr');
/*!40000 ALTER TABLE `appellent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cases`
--

DROP TABLE IF EXISTS `cases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cases` (
  `Number` int NOT NULL AUTO_INCREMENT,
  `RegistryOfficer` int NOT NULL,
  `Judge` int NOT NULL,
  `Outcome` enum('Decision to Appellant','Decision to Respondent','Settled','No Outcome') NOT NULL,
  `Court` enum('FC','FCA','TCC','CMAC') NOT NULL,
  PRIMARY KEY (`Number`),
  KEY `RegistryOfficer_idx` (`RegistryOfficer`),
  KEY `judgeCase_fkey_idx` (`Judge`),
  CONSTRAINT `judgeCase_fkey` FOREIGN KEY (`Judge`) REFERENCES `judge` (`ID`),
  CONSTRAINT `RO_fkey` FOREIGN KEY (`RegistryOfficer`) REFERENCES `registry_officer` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cases`
--

LOCK TABLES `cases` WRITE;
/*!40000 ALTER TABLE `cases` DISABLE KEYS */;
INSERT INTO `cases` VALUES (1,11,3,'No Outcome','FC'),(2,12,5,'Settled','CMAC'),(3,12,2,'Decision to Appellant','FC'),(4,14,1,'No Outcome','FC'),(5,13,1,'No Outcome','FC');
/*!40000 ALTER TABLE `cases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents`
--

DROP TABLE IF EXISTS `documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documents` (
  `docNumber` int NOT NULL AUTO_INCREMENT,
  `caseNumber` int NOT NULL,
  `Deadline` date DEFAULT NULL,
  `Submitter` varchar(75) NOT NULL,
  `linkToDoc` varchar(2000) NOT NULL,
  `dateOfSubmission` date DEFAULT NULL,
  PRIMARY KEY (`docNumber`),
  KEY `case_fkey_idx` (`caseNumber`),
  CONSTRAINT `case_fkey` FOREIGN KEY (`caseNumber`) REFERENCES `cases` (`Number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents`
--

LOCK TABLES `documents` WRITE;
/*!40000 ALTER TABLE `documents` DISABLE KEYS */;
INSERT INTO `documents` VALUES (1,1,'2021-04-02','Chris Stevents','notSet','2021-03-14'),(2,2,'2021-04-02','Chris Stevents','notSet','2021-03-14'),(3,3,'2021-04-02','Miles Bricks','notSet','2021-03-14'),(4,4,'2021-04-02','Miles Bricks','notSet','2021-03-14'),(5,5,'2021-04-02','Anne Heath','notSet','2021-03-14'),(6,1,'2021-04-02','Chris Stevents','notSet','2021-03-14'),(7,2,'2021-04-02','Chris Stevents','notSet','2021-03-14'),(8,3,'2021-04-02','Miles Bricks','notSet','2021-03-14'),(9,4,'2021-04-02','Miles Bricks','notSet','2021-03-14'),(10,5,'2021-04-02','Anne Heath','notSet','2021-03-14'),(11,2,'2021-04-02','Chris Stevents','notSet','2021-03-14'),(12,4,'2021-04-02','Miles Bricks','notSet','2021-03-14'),(13,5,'2021-04-02','John Stevents','notSet','2021-03-14'),(14,4,'2021-04-02','Miles Bricks','notSet','2021-03-14'),(15,5,'2021-04-02','John Stevents','notSet','2021-03-14');
/*!40000 ALTER TABLE `documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factum`
--

DROP TABLE IF EXISTS `factum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `factum` (
  `docNumber` int NOT NULL,
  `releventMotion` varchar(100) NOT NULL,
  PRIMARY KEY (`docNumber`),
  CONSTRAINT `docNum_f_fkey` FOREIGN KEY (`docNumber`) REFERENCES `documents` (`docNumber`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factum`
--

LOCK TABLES `factum` WRITE;
/*!40000 ALTER TABLE `factum` DISABLE KEYS */;
INSERT INTO `factum` VALUES (3,'notSet'),(4,'notSet'),(5,'notSet'),(8,'notSet'),(9,'notSet'),(10,'notSet'),(12,'notSet'),(13,'notSet'),(14,'notSet'),(15,'notSet');
/*!40000 ALTER TABLE `factum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hearing`
--

DROP TABLE IF EXISTS `hearing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hearing` (
  `Date` timestamp(2) NOT NULL,
  `caseNumber` int NOT NULL,
  `locationRoom` int NOT NULL,
  `locationBuilding` varchar(100) NOT NULL,
  PRIMARY KEY (`Date`,`caseNumber`),
  KEY `caseHearing_fkey_idx` (`caseNumber`),
  KEY `location_fkey_idx` (`locationBuilding`,`locationRoom`),
  CONSTRAINT `caseHearing_fkey` FOREIGN KEY (`caseNumber`) REFERENCES `cases` (`Number`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `location_fkey` FOREIGN KEY (`locationBuilding`, `locationRoom`) REFERENCES `location` (`Building`, `roomNum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hearing`
--

LOCK TABLES `hearing` WRITE;
/*!40000 ALTER TABLE `hearing` DISABLE KEYS */;
INSERT INTO `hearing` VALUES ('2021-05-02 07:00:01.00',1,101,'Federal Court Burnaby'),('2021-05-03 08:00:01.00',2,102,'Federal Court Burnaby'),('2021-05-03 09:00:01.00',3,201,'Federal Court Vancouver'),('2021-05-04 11:00:01.00',4,202,'Federal Court Vancouver'),('2021-05-05 10:00:01.00',5,203,'Federal Court Vancouver');
/*!40000 ALTER TABLE `hearing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `judge`
--

DROP TABLE IF EXISTS `judge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `judge` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(75) NOT NULL,
  `Email` varchar(320) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `judge`
--

LOCK TABLES `judge` WRITE;
/*!40000 ALTER TABLE `judge` DISABLE KEYS */;
INSERT INTO `judge` VALUES (1,'Anthony Bean','abean@canadaJudge.ca'),(2,'Jordan Good','jgood@canadaJudge.ca'),(3,'Marie Cole','mcole@canadaJudge.ca'),(4,'Ashlynn Cook','acook@canadaJudge.ca'),(5,'Steve Rodger','srodger@canadaJudge.ca');
/*!40000 ALTER TABLE `judge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lawclerk`
--

DROP TABLE IF EXISTS `lawclerk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lawclerk` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `clerksFor` int NOT NULL,
  `Name` varchar(75) NOT NULL,
  `Email` varchar(320) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `judgeClerk_fkey_idx` (`clerksFor`),
  CONSTRAINT `judgeClerk_fkey` FOREIGN KEY (`clerksFor`) REFERENCES `judge` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lawclerk`
--

LOCK TABLES `lawclerk` WRITE;
/*!40000 ALTER TABLE `lawclerk` DISABLE KEYS */;
INSERT INTO `lawclerk` VALUES (1,1,'Shirin Hodgins','shodgins@canadaJudge.ca'),(2,1,'Kyle Bowder','kbowder@canadaJudge.ca'),(3,4,'Ian Robertson','irobertson@canadaJudge.ca'),(4,5,'Cameron Cooke','ccooke@canadaJudge.ca'),(5,5,'Arthur Bannon','abannon@canadaJudge.ca');
/*!40000 ALTER TABLE `lawclerk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location` (
  `Building` varchar(100) NOT NULL,
  `roomNum` int NOT NULL,
  `City` varchar(50) NOT NULL,
  `seatingCap` int DEFAULT NULL,
  PRIMARY KEY (`Building`,`roomNum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES ('Federal Court Burnaby',101,'Burnaby',150),('Federal Court Burnaby',102,'Burnaby',150),('Federal Court Vancouver',201,'Vancouver',200),('Federal Court Vancouver',202,'Vancouver',NULL),('Federal Court Vancouver',203,'Vancouver',200);
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participants`
--

DROP TABLE IF EXISTS `participants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `participants` (
  `SIN` int NOT NULL,
  `name` varchar(75) NOT NULL,
  `phoneNumber` varchar(20) NOT NULL,
  `address` varchar(100) NOT NULL,
  `email` varchar(320) DEFAULT NULL,
  PRIMARY KEY (`SIN`),
  UNIQUE KEY `SIN_UNIQUE` (`SIN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participants`
--

LOCK TABLES `participants` WRITE;
/*!40000 ALTER TABLE `participants` DISABLE KEYS */;
INSERT INTO `participants` VALUES (123123345,'Kristin Munynam','613-485-2324','765 Nanaimo St, Nanaimo, BC','kmunynam@law.ca'),(123345345,'Sevak Ocala','647-345-2045','123 TreeRoute Rd, Toronto, ON',NULL),(123456345,'John Deere','345-315-2045','123 Deere Rd, Toronto, ON',NULL),(123456375,'Daniel lau','778-355-2245','888 River Rd, Burnaby, BC',NULL),(123456789,'Kyle Lowry','778-123-4566','453 Dunk St, Toronto, ON','klowry@hotmail.com'),(123678345,'Jakob Tico','612-348-2944','123 Center St, Toronto, ON',NULL),(123678465,'Marty Anderson','456-340-2924','123 Richmond St, Toronto, ON',NULL),(234123123,'Chris Bowe','213-395-1129','123 South Rd, New Westminster, ON',NULL),(234567890,'Demar DeRozan','778-954-2385','452 Dunk St, Toronto, ON','dderozan@hotmail.com'),(321654987,'Vince Carter','778-574-9432','453 River Rd, Los Angeles, CA','vcarter@hotmail.com'),(456456305,'Brant Tractors','905-315-2094','123 Sideroad 13 Rd, Toronto, ON',NULL),(543876432,'Norman Powell','778-224-5667','451 EdgeWater Rd, Portland, OR','npowell@hotmail.com'),(654987098,'Matt Thomas','778-694-3844','458 Desert Rd, Orem, UT','mthomas@hotmail.com'),(704783345,'David Ryan','341-345-2347','12 North Rd, Burnaby, ON',NULL),(867456451,'Sekak Ocala','778-456-2241','888 Loop Ct, Burnaby, BC',NULL);
/*!40000 ALTER TABLE `participants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registry_officer`
--

DROP TABLE IF EXISTS `registry_officer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registry_officer` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(75) NOT NULL,
  `Email` varchar(320) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registry_officer`
--

LOCK TABLES `registry_officer` WRITE;
/*!40000 ALTER TABLE `registry_officer` DISABLE KEYS */;
INSERT INTO `registry_officer` VALUES (11,'Chris Stevents','cstevents@canada.ca'),(12,'Mark Miles','mmiles@canada.ca'),(13,'John Stevents','jstevents@canada.ca'),(14,'Miles Bricks','mbricks@canada.ca'),(15,'Anne Heath','aheath@canada.ca');
/*!40000 ALTER TABLE `registry_officer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `respondent`
--

DROP TABLE IF EXISTS `respondent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `respondent` (
  `SIN` int NOT NULL,
  `caseNumber` int NOT NULL,
  `barristerEmail` varchar(320) DEFAULT NULL,
  `barristerName` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`SIN`,`caseNumber`),
  KEY `caseRespondent_fkey_idx` (`caseNumber`),
  CONSTRAINT `caseRespondent_fkey` FOREIGN KEY (`caseNumber`) REFERENCES `cases` (`Number`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sinRes_fkey` FOREIGN KEY (`SIN`) REFERENCES `participants` (`SIN`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `respondent`
--

LOCK TABLES `respondent` WRITE;
/*!40000 ALTER TABLE `respondent` DISABLE KEYS */;
INSERT INTO `respondent` VALUES (123678465,5,'jbean@law.ca','Jacob Bean'),(234123123,4,'jhalcrow@law.ca','Josh Halcrow'),(456456305,1,'jpearson@law.ca','Jessica Pearson'),(704783345,3,'jbean@law.ca','Jacob Bean'),(867456451,2,'kmunynam@law.ca','Kristin Munynam');
/*!40000 ALTER TABLE `respondent` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `respondent_AFTER_DELETE` AFTER DELETE ON `respondent` FOR EACH ROW BEGIN
DECLARE app_count INT;
DECLARE wit_count INT;
DECLARE resp_count INT;
SELECT count(*) 
INTO app_count
FROM appellant AS a     
WHERE OLD.SIN = a.SIN;

SELECT count(*) 
INTO wit_count
FROM witness AS w     
WHERE OLD.SIN = w.SIN;

SELECT count(*) 
INTO resp_count
FROM respondent AS r     
WHERE OLD.SIN = r.SIN;

IF app_count = 0 AND wit_count = 0 AND resp_count = 0
	THEN DELETE FROM participants 
	WHERE SIN = OLD.SIN;
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `witness`
--

DROP TABLE IF EXISTS `witness`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `witness` (
  `SIN` int NOT NULL,
  `caseNumber` int NOT NULL,
  PRIMARY KEY (`SIN`,`caseNumber`),
  KEY `caseWitness_fkey_idx` (`caseNumber`),
  CONSTRAINT `caseWitness_fkey` FOREIGN KEY (`caseNumber`) REFERENCES `cases` (`Number`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sinWit_fkey` FOREIGN KEY (`SIN`) REFERENCES `participants` (`SIN`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `witness`
--

LOCK TABLES `witness` WRITE;
/*!40000 ALTER TABLE `witness` DISABLE KEYS */;
INSERT INTO `witness` VALUES (123456789,1),(234567890,2),(321654987,3),(654987098,4),(543876432,5);
/*!40000 ALTER TABLE `witness` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `witness_AFTER_DELETE` AFTER DELETE ON `witness` FOR EACH ROW BEGIN
DECLARE app_count INT;
DECLARE wit_count INT;
DECLARE resp_count INT;
SELECT count(*) 
INTO app_count
FROM appellant AS a     
WHERE OLD.SIN = a.SIN;

SELECT count(*) 
INTO wit_count
FROM witness AS w     
WHERE OLD.SIN = w.SIN;

SELECT count(*) 
INTO resp_count
FROM respondent AS r     
WHERE OLD.SIN = r.SIN;

IF app_count = 0 AND wit_count = 0 AND resp_count = 0
	THEN DELETE FROM participants 
	WHERE SIN = OLD.SIN;
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-13 10:33:04

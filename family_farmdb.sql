CREATE DATABASE  IF NOT EXISTS `FamilyFarmDB` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `FamilyFarmDB`;
-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: localhost    Database: FamilyFarmDB
-- ------------------------------------------------------
-- Server version	8.0.40-0ubuntu0.22.04.1

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
-- Table structure for table `AI_Recommendation_Fact`
--

DROP TABLE IF EXISTS `AI_Recommendation_Fact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AI_Recommendation_Fact` (
  `Recommendation_ID` int NOT NULL,
  `User_ID` int DEFAULT NULL,
  `Sensor_ID` int DEFAULT NULL,
  `Recommendation_Type` varchar(50) DEFAULT NULL,
  `Anomaly_Label` tinyint(1) DEFAULT NULL,
  `Plant_ID` int DEFAULT NULL,
  PRIMARY KEY (`Recommendation_ID`),
  KEY `Sensor_ID` (`Sensor_ID`),
  KEY `Plant_ID` (`Plant_ID`),
  CONSTRAINT `AI_Recommendation_Fact_ibfk_2` FOREIGN KEY (`Sensor_ID`) REFERENCES `Sensor_Dimension` (`Sensor_ID`),
  CONSTRAINT `AI_Recommendation_Fact_ibfk_3` FOREIGN KEY (`Plant_ID`) REFERENCES `Plant_Dimension` (`Plant_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AI_Recommendation_Fact`
--

LOCK TABLES `AI_Recommendation_Fact` WRITE;
/*!40000 ALTER TABLE `AI_Recommendation_Fact` DISABLE KEYS */;
/*!40000 ALTER TABLE `AI_Recommendation_Fact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Environment_Condition_Dimension`
--

DROP TABLE IF EXISTS `Environment_Condition_Dimension`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Environment_Condition_Dimension` (
  `Condition_ID` int NOT NULL,
  `Temperature_Range` varchar(50) DEFAULT NULL,
  `Humidity_Range` varchar(50) DEFAULT NULL,
  `Light_Level` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Condition_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Environment_Condition_Dimension`
--

LOCK TABLES `Environment_Condition_Dimension` WRITE;
/*!40000 ALTER TABLE `Environment_Condition_Dimension` DISABLE KEYS */;
/*!40000 ALTER TABLE `Environment_Condition_Dimension` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Growth_Metric_Fact`
--

DROP TABLE IF EXISTS `Growth_Metric_Fact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Growth_Metric_Fact` (
  `Growth_Metric_ID` int NOT NULL,
  `Plant_ID` int DEFAULT NULL,
  `Growth_Stage` varchar(50) DEFAULT NULL,
  `Health_Status` varchar(50) DEFAULT NULL,
  `Timestamp` datetime DEFAULT NULL,
  `Anomaly_Label` tinyint(1) DEFAULT NULL,
  `Condition_ID` int DEFAULT NULL,
  PRIMARY KEY (`Growth_Metric_ID`),
  KEY `Plant_ID` (`Plant_ID`),
  KEY `Condition_ID` (`Condition_ID`),
  KEY `Timestamp` (`Timestamp`),
  CONSTRAINT `Growth_Metric_Fact_ibfk_1` FOREIGN KEY (`Plant_ID`) REFERENCES `Plant_Dimension` (`Plant_ID`),
  CONSTRAINT `Growth_Metric_Fact_ibfk_2` FOREIGN KEY (`Condition_ID`) REFERENCES `Environment_Condition_Dimension` (`Condition_ID`),
  CONSTRAINT `Growth_Metric_Fact_ibfk_3` FOREIGN KEY (`Timestamp`) REFERENCES `Time_Dimension` (`Timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Growth_Metric_Fact`
--

LOCK TABLES `Growth_Metric_Fact` WRITE;
/*!40000 ALTER TABLE `Growth_Metric_Fact` DISABLE KEYS */;
/*!40000 ALTER TABLE `Growth_Metric_Fact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Interaction_Dimension`
--

DROP TABLE IF EXISTS `Interaction_Dimension`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Interaction_Dimension` (
  `Interaction_ID` int NOT NULL,
  `Interaction_Type` varchar(50) DEFAULT NULL,
  `Timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`Interaction_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Interaction_Dimension`
--

LOCK TABLES `Interaction_Dimension` WRITE;
/*!40000 ALTER TABLE `Interaction_Dimension` DISABLE KEYS */;
/*!40000 ALTER TABLE `Interaction_Dimension` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Plant_Dimension`
--

DROP TABLE IF EXISTS `Plant_Dimension`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Plant_Dimension` (
  `Plant_ID` int NOT NULL,
  `Plant_Type` varchar(50) DEFAULT NULL,
  `Plant_Area` decimal(10,2) DEFAULT NULL,
  `Recommended_Conditions` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Plant_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Plant_Dimension`
--

LOCK TABLES `Plant_Dimension` WRITE;
/*!40000 ALTER TABLE `Plant_Dimension` DISABLE KEYS */;
/*!40000 ALTER TABLE `Plant_Dimension` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Sensor_Dimension`
--

DROP TABLE IF EXISTS `Sensor_Dimension`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sensor_Dimension` (
  `Sensor_ID` int NOT NULL,
  `Sensor_Type` varchar(50) DEFAULT NULL,
  `Calibration_Date` date DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL,
  `Environment_Category` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Sensor_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sensor_Dimension`
--

LOCK TABLES `Sensor_Dimension` WRITE;
/*!40000 ALTER TABLE `Sensor_Dimension` DISABLE KEYS */;
/*!40000 ALTER TABLE `Sensor_Dimension` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Sensor_Reading_Fact`
--

DROP TABLE IF EXISTS `Sensor_Reading_Fact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sensor_Reading_Fact` (
  `Sensor_Reading_ID` int NOT NULL,
  `Sensor_ID` int DEFAULT NULL,
  `Reading_Value` decimal(10,2) DEFAULT NULL,
  `Timestamp` datetime DEFAULT NULL,
  `Sensor_Type` varchar(50) DEFAULT NULL,
  `Anomaly_Label` tinyint(1) DEFAULT NULL,
  `Alarm_Level` varchar(50) DEFAULT NULL,
  `Condition_ID` int DEFAULT NULL,
  `Plant_ID` int DEFAULT NULL,
  `Unit_ID` int DEFAULT NULL,
  PRIMARY KEY (`Sensor_Reading_ID`),
  KEY `Sensor_ID` (`Sensor_ID`),
  KEY `Condition_ID` (`Condition_ID`),
  KEY `Plant_ID` (`Plant_ID`),
  KEY `Timestamp` (`Timestamp`),
  KEY `Unit_ID` (`Unit_ID`),
  CONSTRAINT `Sensor_Reading_Fact_ibfk_1` FOREIGN KEY (`Sensor_ID`) REFERENCES `Sensor_Dimension` (`Sensor_ID`),
  CONSTRAINT `Sensor_Reading_Fact_ibfk_2` FOREIGN KEY (`Condition_ID`) REFERENCES `Environment_Condition_Dimension` (`Condition_ID`),
  CONSTRAINT `Sensor_Reading_Fact_ibfk_3` FOREIGN KEY (`Plant_ID`) REFERENCES `Plant_Dimension` (`Plant_ID`),
  CONSTRAINT `Sensor_Reading_Fact_ibfk_4` FOREIGN KEY (`Timestamp`) REFERENCES `Time_Dimension` (`Timestamp`),
  CONSTRAINT `Sensor_Reading_Fact_ibfk_5` FOREIGN KEY (`Unit_ID`) REFERENCES `Unit_Dimension` (`Unit_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sensor_Reading_Fact`
--

LOCK TABLES `Sensor_Reading_Fact` WRITE;
/*!40000 ALTER TABLE `Sensor_Reading_Fact` DISABLE KEYS */;
/*!40000 ALTER TABLE `Sensor_Reading_Fact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Time_Dimension`
--

DROP TABLE IF EXISTS `Time_Dimension`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Time_Dimension` (
  `Timestamp` datetime NOT NULL,
  `Day_of_Week` varchar(10) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Hour` int DEFAULT NULL,
  `Season` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Time_Dimension`
--

LOCK TABLES `Time_Dimension` WRITE;
/*!40000 ALTER TABLE `Time_Dimension` DISABLE KEYS */;
/*!40000 ALTER TABLE `Time_Dimension` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Unit_Dimension`
--

DROP TABLE IF EXISTS `Unit_Dimension`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Unit_Dimension` (
  `Unit_ID` int NOT NULL,
  `Unit_Height` decimal(10,2) DEFAULT NULL,
  `Plants_Number` int DEFAULT NULL,
  PRIMARY KEY (`Unit_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Unit_Dimension`
--

LOCK TABLES `Unit_Dimension` WRITE;
/*!40000 ALTER TABLE `Unit_Dimension` DISABLE KEYS */;
/*!40000 ALTER TABLE `Unit_Dimension` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User_Dimension`
--

DROP TABLE IF EXISTS `User_Dimension`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `User_Dimension` (
  `User_ID` int NOT NULL,
  `User_Age` int DEFAULT NULL,
  `Preferences` varchar(255) DEFAULT NULL,
  `Unit_ID` int DEFAULT NULL,
  PRIMARY KEY (`User_ID`),
  KEY `Unit_ID` (`Unit_ID`),
  CONSTRAINT `User_Dimension_ibfk_1` FOREIGN KEY (`Unit_ID`) REFERENCES `Unit_Dimension` (`Unit_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User_Dimension`
--

LOCK TABLES `User_Dimension` WRITE;
/*!40000 ALTER TABLE `User_Dimension` DISABLE KEYS */;
/*!40000 ALTER TABLE `User_Dimension` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User_Interaction_Fact`
--

DROP TABLE IF EXISTS `User_Interaction_Fact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `User_Interaction_Fact` (
  `User_Interaction_ID` int NOT NULL,
  `User_ID` int DEFAULT NULL,
  `Interaction_Type` varchar(50) DEFAULT NULL,
  `Timestamp` datetime DEFAULT NULL,
  `Sensor_ID` int DEFAULT NULL,
  `Interaction_ID` int DEFAULT NULL,
  PRIMARY KEY (`User_Interaction_ID`),
  KEY `User_ID` (`User_ID`),
  KEY `Sensor_ID` (`Sensor_ID`),
  KEY `Interaction_ID` (`Interaction_ID`),
  KEY `Timestamp` (`Timestamp`),
  CONSTRAINT `User_Interaction_Fact_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `User_Dimension` (`User_ID`),
  CONSTRAINT `User_Interaction_Fact_ibfk_2` FOREIGN KEY (`Sensor_ID`) REFERENCES `Sensor_Dimension` (`Sensor_ID`),
  CONSTRAINT `User_Interaction_Fact_ibfk_3` FOREIGN KEY (`Interaction_ID`) REFERENCES `Interaction_Dimension` (`Interaction_ID`),
  CONSTRAINT `User_Interaction_Fact_ibfk_4` FOREIGN KEY (`Timestamp`) REFERENCES `Time_Dimension` (`Timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User_Interaction_Fact`
--

LOCK TABLES `User_Interaction_Fact` WRITE;
/*!40000 ALTER TABLE `User_Interaction_Fact` DISABLE KEYS */;
/*!40000 ALTER TABLE `User_Interaction_Fact` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-23 22:03:25

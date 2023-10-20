-- MySQL dump 10.13  Distrib 8.0.34, for Linux (x86_64)
--
-- Host: localhost    Database: Tasks
-- ------------------------------------------------------
-- Server version	8.0.34-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Booking`
--

DROP TABLE IF EXISTS `Booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Booking` (
  `BookingID` varchar(3) NOT NULL,
  `TourID` varchar(2) DEFAULT NULL,
  `VehicleID` varchar(2) DEFAULT NULL,
  `ReserveID` varchar(2) DEFAULT NULL,
  `VisGroupID` varchar(3) DEFAULT NULL,
  `StaffID` varchar(2) DEFAULT NULL,
  `BookingDate` date DEFAULT NULL,
  `BookingTime` time DEFAULT NULL,
  PRIMARY KEY (`BookingID`),
  KEY `TourID` (`TourID`),
  KEY `VehicleID` (`VehicleID`),
  KEY `ReserveID` (`ReserveID`),
  KEY `StaffID` (`StaffID`),
  KEY `VisGroupID` (`VisGroupID`),
  CONSTRAINT `Booking_ibfk_1` FOREIGN KEY (`TourID`) REFERENCES `Tour` (`TourID`),
  CONSTRAINT `Booking_ibfk_2` FOREIGN KEY (`VehicleID`) REFERENCES `Vehicle` (`VehicleID`),
  CONSTRAINT `Booking_ibfk_3` FOREIGN KEY (`ReserveID`) REFERENCES `Reserve` (`ReserveID`),
  CONSTRAINT `Booking_ibfk_4` FOREIGN KEY (`StaffID`) REFERENCES `Staff` (`StaffID`),
  CONSTRAINT `Booking_ibfk_5` FOREIGN KEY (`VisGroupID`) REFERENCES `VisitorGroup` (`VisGroupID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Booking`
--

LOCK TABLES `Booking` WRITE;
/*!40000 ALTER TABLE `Booking` DISABLE KEYS */;
INSERT INTO `Booking` VALUES ('B10','T3','V1','R1','VG8','S2','2024-01-18','08:35:00'),('BO1','T4','V1','R2','VG2','S3','2024-03-29','10:28:00'),('BO2','T4','V2','R1','VG3','S3','2024-07-14','07:23:00'),('BO3','T5','V2','R5','VG1','S4','2023-11-04','07:40:00'),('BO4','T1','V2','R4','VG4','S5','2024-06-23','06:42:00'),('BO5','T1','V3','R3','VG5','S2','2024-11-25','07:13:00'),('BO6','T7','V2','R5','VG1','S3','2024-07-08','10:55:00'),('BO7','T5','V1','R1','VG8','S3','2024-09-04','06:06:00'),('BO8','T3','V1','R2','VG7','S4','2023-10-14','06:37:00'),('BO9','T2','V3','R3','VG6','S5','2024-01-01','09:07:00');
/*!40000 ALTER TABLE `Booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Orginisation`
--

DROP TABLE IF EXISTS `Orginisation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Orginisation` (
  `OrginisationID` varchar(2) NOT NULL,
  `OrginisationName` varchar(100) DEFAULT NULL,
  `OrginisationManager` varchar(100) DEFAULT NULL,
  `OrginisationNumber` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`OrginisationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Orginisation`
--

LOCK TABLES `Orginisation` WRITE;
/*!40000 ALTER TABLE `Orginisation` DISABLE KEYS */;
INSERT INTO `Orginisation` VALUES ('O1','Roll and Rock Corp','Elvis Presley','(60) 2775 8425'),('O2','BlueEyes Corp','Frank Sinatra','(70) 9175 8036'),('O3','Queen and Co','Freddie Mercury','(71) 9126 8504'),('O4','Liz Voices','Whiteney Houston','(10) 9647 8708'),('O5','Bad Guys','Billie Eilish','(78) 6686 3940'),('O6','Songbird Supreme','Mariah Carey','(02) 9481 1111');
/*!40000 ALTER TABLE `Orginisation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Partnership`
--

DROP TABLE IF EXISTS `Partnership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Partnership` (
  `ReserveID` varchar(2) NOT NULL,
  `OrginisationID` varchar(2) NOT NULL,
  `StartDate` date DEFAULT NULL,
  `EndDate` date DEFAULT NULL,
  `Amount` float(50,2) DEFAULT NULL,
  PRIMARY KEY (`ReserveID`,`OrginisationID`),
  KEY `OrginisationID` (`OrginisationID`),
  CONSTRAINT `Partnership_ibfk_1` FOREIGN KEY (`ReserveID`) REFERENCES `Reserve` (`ReserveID`),
  CONSTRAINT `Partnership_ibfk_2` FOREIGN KEY (`OrginisationID`) REFERENCES `Orginisation` (`OrginisationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Partnership`
--

LOCK TABLES `Partnership` WRITE;
/*!40000 ALTER TABLE `Partnership` DISABLE KEYS */;
INSERT INTO `Partnership` VALUES ('R1','O3','2021-08-31','2025-05-30',508485.00),('R2','O2','2023-07-20','2025-08-24',1632025.00),('R2','O6','2020-09-22','2026-04-08',1420420.00),('R3','O1','2021-09-01','2026-03-27',809930.00),('R4','O4','2022-04-30','2024-12-23',2339079.00),('R5','O5','2020-12-03','2025-09-29',1463627.00);
/*!40000 ALTER TABLE `Partnership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Reserve`
--

DROP TABLE IF EXISTS `Reserve`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Reserve` (
  `ReserveID` varchar(255) NOT NULL,
  `ReserveName` varchar(255) DEFAULT NULL,
  `ReserveLocation` varchar(255) DEFAULT NULL,
  `ReserveSize` int DEFAULT NULL,
  PRIMARY KEY (`ReserveID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Reserve`
--

LOCK TABLES `Reserve` WRITE;
/*!40000 ALTER TABLE `Reserve` DISABLE KEYS */;
INSERT INTO `Reserve` VALUES ('R1','Dwesa-Cwebe Nature Reserve','Eastern Cape Province',545),('R2','Caledon Nature Reserve','Free State',230),('R3','Hluhluwe-Umfolozi Game Reserve','KwaZulu-Natal',960),('R4','Kruger National Park','Mpumalanga',999),('R5','De Hoop Nature Reserve','Overberg',340),('R6','Pilanesberg National Park','North West Province',572),('R7','Blyde River Canyon Nature Reserve','Mpumalanga',290);
/*!40000 ALTER TABLE `Reserve` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Staff`
--

DROP TABLE IF EXISTS `Staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Staff` (
  `StaffID` varchar(2) NOT NULL,
  `StaffName` varchar(100) DEFAULT NULL,
  `StaffPosition` varchar(100) DEFAULT NULL,
  `StaffSalary` float(20,2) DEFAULT NULL,
  PRIMARY KEY (`StaffID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Staff`
--

LOCK TABLES `Staff` WRITE;
/*!40000 ALTER TABLE `Staff` DISABLE KEYS */;
INSERT INTO `Staff` VALUES ('S1','Blake Lively','Reserve Manager',120000.00),('S2','Health Ledger','Tour Guide',70000.00),('S3','Sheldon Cooper','Tour Guide',70000.00),('S4','Jessica Chastain','Senior Tour Guide',80000.00),('S5','Joaquin Phoenix','Junior Tour Guide',90000.00);
/*!40000 ALTER TABLE `Staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tour`
--

DROP TABLE IF EXISTS `Tour`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Tour` (
  `TourID` varchar(2) NOT NULL,
  `TourName` varchar(255) DEFAULT NULL,
  `TourCost` float(20,2) DEFAULT NULL,
  `TourDuration` int DEFAULT NULL,
  PRIMARY KEY (`TourID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tour`
--

LOCK TABLES `Tour` WRITE;
/*!40000 ALTER TABLE `Tour` DISABLE KEYS */;
INSERT INTO `Tour` VALUES ('T1','Premium Tour Package',500.00,6),('T2','Standard Tour Package',420.00,5),('T3','Whale Watching',200.00,3),('T4','Hiking and Biking',150.00,1),('T5','Safari',250.00,2),('T6','Lake Cruise',300.00,2),('T7','Shark Diving',250.00,2);
/*!40000 ALTER TABLE `Tour` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TourPackage`
--

DROP TABLE IF EXISTS `TourPackage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TourPackage` (
  `PackageTourID` varchar(2) NOT NULL,
  `ComponentTourID` varchar(2) NOT NULL,
  PRIMARY KEY (`PackageTourID`,`ComponentTourID`),
  KEY `ComponentTourID` (`ComponentTourID`),
  CONSTRAINT `TourPackage_ibfk_1` FOREIGN KEY (`PackageTourID`) REFERENCES `Tour` (`TourID`),
  CONSTRAINT `TourPackage_ibfk_2` FOREIGN KEY (`ComponentTourID`) REFERENCES `Tour` (`TourID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TourPackage`
--

LOCK TABLES `TourPackage` WRITE;
/*!40000 ALTER TABLE `TourPackage` DISABLE KEYS */;
INSERT INTO `TourPackage` VALUES ('T1','T4'),('T2','T4'),('T1','T5'),('T2','T6'),('T1','T7');
/*!40000 ALTER TABLE `TourPackage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Vehicle`
--

DROP TABLE IF EXISTS `Vehicle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Vehicle` (
  `VehicleID` varchar(255) NOT NULL,
  `ReserveID` varchar(255) NOT NULL,
  `VehicleType` varchar(255) DEFAULT NULL,
  `VehicleCapacity` int DEFAULT NULL,
  `VehicleRegoNum` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`VehicleID`,`ReserveID`),
  KEY `ReserveID` (`ReserveID`),
  CONSTRAINT `Vehicle_ibfk_1` FOREIGN KEY (`ReserveID`) REFERENCES `Reserve` (`ReserveID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Vehicle`
--

LOCK TABLES `Vehicle` WRITE;
/*!40000 ALTER TABLE `Vehicle` DISABLE KEYS */;
INSERT INTO `Vehicle` VALUES ('V1','R1','Bus',15,'AVH287'),('V1','R2','Off-road 4WD',8,'FNG552'),('V1','R3','Off-road 4WD',8,'MQR858'),('V1','R4','Off-road 4WD',8,'LMV199'),('V1','R5','Van',10,'KEV022'),('V2','R1','Ute with cage',6,'JQB042'),('V2','R3','Van',10,'BGC222'),('V2','R4','Van',10,'HTO587'),('V2','R5','Ute with cage',6,'HMG835'),('V3','R3','Bus',15,'ZZB964'),('V3','R4','Bus',15,'UFB445');
/*!40000 ALTER TABLE `Vehicle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VisitorGroup`
--

DROP TABLE IF EXISTS `VisitorGroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `VisitorGroup` (
  `VisGroupID` varchar(3) NOT NULL,
  `VisGroupName` varchar(100) DEFAULT NULL,
  `VisGroupCountry` varchar(100) DEFAULT NULL,
  `VisGroupNumPeople` int DEFAULT NULL,
  PRIMARY KEY (`VisGroupID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VisitorGroup`
--

LOCK TABLES `VisitorGroup` WRITE;
/*!40000 ALTER TABLE `VisitorGroup` DISABLE KEYS */;
INSERT INTO `VisitorGroup` VALUES ('VG1','Hugh Jackman','Austrulia',1),('VG2','Zoe Bell','New Zealand',7),('VG3','Nikole Kidman','Austrulia',5),('VG4','Jackie Chan','Hong Kong',8),('VG5','Kim SooHyun','Korea',14),('VG6','Parkmin Young','Korea',10),('VG7','Maggie Cheung','Hong Kong',3),('VG8','JunJi Hyun','Korea',6);
/*!40000 ALTER TABLE `VisitorGroup` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-20 18:10:04

-- MySQL dump 10.19  Distrib 10.3.34-MariaDB, for debian-linux-gnueabihf (armv8l)
--
-- Host: localhost    Database: multivend
-- ------------------------------------------------------
-- Server version	10.3.34-MariaDB-0+deb10u1
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
--
-- Table structure for table `tblBasket`
--
DROP TABLE IF EXISTS `tblBasket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblBasket` (
  `BasketId` bigint(20),
--  NOT NULL AUTO_INCREMENT,
  `PromotionType` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `StartDateTime` datetime DEFAULT NULL,
  `EndDateTime` datetime DEFAULT NULL,
  `Price` float DEFAULT NULL,
  `CreateDateTime` datetime DEFAULT NULL,
  `UpdateDateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`BasketId`)
);
--ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblBasket`
--

LOCK TABLES `tblBasket` WRITE;
/*!40000 ALTER TABLE `tblBasket` DISABLE KEYS */;
INSERT INTO `tblBasket` VALUES (1,'QuantityToPrice','2021-07-07 10:12:37','2021-07-14 10:12:37',0.99,'2020-11-09 11:29:20','2020-11-09 11:29:20'),(2,'Set','2021-07-07 10:12:37','2021-07-14 10:12:37',0.59,'2020-11-09 11:29:20','2020-11-09 11:29:20');
/*!40000 ALTER TABLE `tblBasket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblBasketProduct`
--

DROP TABLE IF EXISTS `tblBasketProduct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblBasketProduct` (
  `BasketProductId` bigint(20) NOT NULL AUTO_INCREMENT,
  `BasketId` bigint(20) DEFAULT NULL,
  `EAN` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`BasketProductId`),
  KEY `BasketId` (`BasketId`),
  CONSTRAINT `tblBasketProduct_ibfk_1` FOREIGN KEY (`BasketId`) REFERENCES `tblBasket` (`BasketId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblBasketProduct`
--

LOCK TABLES `tblBasketProduct` WRITE;
/*!40000 ALTER TABLE `tblBasketProduct` DISABLE KEYS */;
INSERT INTO `tblBasketProduct` VALUES (1,1,5),(2,1,5),(3,1,5),(4,2,15),(5,2,2),(6,2,3);
/*!40000 ALTER TABLE `tblBasketProduct` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblBlik`
--

DROP TABLE IF EXISTS `tblBlik`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblBlik` (
  `BlikId` bigint(20) NOT NULL AUTO_INCREMENT,
  `Id` bigint(20) DEFAULT NULL,
  `MerchantSecret` varchar(2000) CHARACTER SET utf8 DEFAULT NULL,
  `ApiKey` varchar(2000) CHARACTER SET utf8 DEFAULT NULL,
  `ApiPass` varchar(2000) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`BlikId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblBlik`
--

LOCK TABLES `tblBlik` WRITE;
/*!40000 ALTER TABLE `tblBlik` DISABLE KEYS */;
INSERT INTO `tblBlik` VALUES (1,35665,'XGWuD3q5DNS27wUh','5fda7d4b426c76566bfbd0419d6d7ff3a8067e64','5zhVyeX2RHfrp8L');
/*!40000 ALTER TABLE `tblBlik` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblCart`
--

DROP TABLE IF EXISTS `tblCart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblCart` (
  `MachineFeederNo` varchar(255) CHARACTER SET utf8 NOT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `CreateDateTime` datetime DEFAULT NULL,
  `UpdateDateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`MachineFeederNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblCart`
--

LOCK TABLES `tblCart` WRITE;
/*!40000 ALTER TABLE `tblCart` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblCart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblCategory`
--

DROP TABLE IF EXISTS `tblCategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblCategory` (
  `CategoryId` bigint(20) NOT NULL AUTO_INCREMENT,
  `CategoryNo` int(11) DEFAULT NULL,
  `Name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Image` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `CreateUserId` int(11) DEFAULT NULL,
  `UpdateUserId` int(11) DEFAULT NULL,
  `CreateDateTime` datetime DEFAULT NULL,
  `UpdateDateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`CategoryId`),
  UNIQUE KEY `Name` (`Name`),
  UNIQUE KEY `Name_2` (`Name`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblCategory`
--

LOCK TABLES `tblCategory` WRITE;
/*!40000 ALTER TABLE `tblCategory` DISABLE KEYS */;
INSERT INTO `tblCategory` VALUES (29,NULL,'Kategoria 1','images/dev/categories/2021-07-07T08-03-23.153Z-5905669246583.png',1,1,'2021-06-29 11:54:19','2021-07-09 10:22:37'),(30,NULL,'Kategoria 2','images/dev/categories/2021-07-07T08-02-49.543Z-3800205875109.png',1,1,'2021-06-29 11:54:46','2021-07-09 10:22:45'),(33,NULL,'Kategoria 3','images/dev/categories/2021-07-07T08-02-17.436Z-5449000011114.png',1,1,'2021-07-07 10:02:42','2021-07-09 10:22:55'),(34,NULL,'Kategoria 4','images/dev/categories/2021-07-09T08-16-41.493Z-1237.png',1,1,'2021-07-09 10:17:00','2021-07-09 10:23:02');
/*!40000 ALTER TABLE `tblCategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblCategoryProduct`
--

DROP TABLE IF EXISTS `tblCategoryProduct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblCategoryProduct` (
  `CategoryProductId` int(11) NOT NULL AUTO_INCREMENT,
  `CategoryId` int(11) NOT NULL,
  `EAN` bigint(20) NOT NULL,
  `CreateUserId` bigint(20) NOT NULL,
  `UpdateUserId` bigint(20) NOT NULL,
  `CreateDateTime` datetime NOT NULL,
  `UpdateDateTime` datetime NOT NULL,
  PRIMARY KEY (`CategoryProductId`)
) ENGINE=InnoDB AUTO_INCREMENT=230 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblCategoryProduct`
--

LOCK TABLES `tblCategoryProduct` WRITE;
/*!40000 ALTER TABLE `tblCategoryProduct` DISABLE KEYS */;
INSERT INTO `tblCategoryProduct` VALUES (195,29,5,1,1,'2021-07-07 10:01:33','2021-07-07 10:01:33'),(196,33,15,1,1,'2021-07-07 10:04:17','2021-07-07 10:04:17'),(197,29,2,1,1,'2021-07-07 10:04:35','2021-07-07 10:04:35'),(198,29,3,1,1,'2021-07-07 10:04:52','2021-07-07 10:04:52'),(200,29,121,1,1,'2021-07-07 10:05:08','2021-07-07 10:05:08'),(201,33,10784,1,1,'2021-07-07 10:05:24','2021-07-07 10:05:24'),(202,33,20797,1,1,'2021-07-07 10:05:30','2021-07-07 10:05:30'),(203,33,21388,1,1,'2021-07-07 10:05:36','2021-07-07 10:05:36'),(205,34,10050,1,1,'2021-07-09 10:17:15','2021-07-09 10:17:15'),(206,34,10051,1,1,'2021-07-09 10:17:23','2021-07-09 10:17:23'),(207,34,10056,1,1,'2021-07-09 10:17:32','2021-07-09 10:17:32'),(208,29,10012,1,1,'2021-07-09 10:17:40','2021-07-09 10:17:40'),(209,29,253453,1,1,'2021-07-09 10:17:52','2021-07-09 10:17:52'),(210,33,100,1,1,'2021-07-09 10:18:18','2021-07-09 10:18:18'),(211,29,21515,1,1,'2021-07-09 10:18:29','2021-07-09 10:18:29'),(212,33,21070,1,1,'2021-07-09 10:18:36','2021-07-09 10:18:36'),(213,33,21092,1,1,'2021-07-09 10:18:40','2021-07-09 10:18:40'),(214,33,21093,1,1,'2021-07-09 10:18:47','2021-07-09 10:18:47'),(215,33,5,1,1,'2021-07-09 10:21:51','2021-07-09 10:21:51'),(216,30,5,1,1,'2021-07-09 10:21:51','2021-07-09 10:21:51'),(217,34,5,1,1,'2021-07-09 10:21:51','2021-07-09 10:21:51'),(218,29,15,1,1,'2021-07-09 10:21:59','2021-07-09 10:21:59'),(219,30,15,1,1,'2021-07-09 10:21:59','2021-07-09 10:21:59'),(220,34,15,1,1,'2021-07-09 10:21:59','2021-07-09 10:21:59'),(224,29,10784,1,1,'2021-07-09 10:22:16','2021-07-09 10:22:16'),(225,30,10784,1,1,'2021-07-09 10:22:16','2021-07-09 10:22:16'),(226,34,10784,1,1,'2021-07-09 10:22:16','2021-07-09 10:22:16'),(227,29,20797,1,1,'2021-07-09 10:22:26','2021-07-09 10:22:26'),(228,30,20797,1,1,'2021-07-09 10:22:26','2021-07-09 10:22:26'),(229,34,20797,1,1,'2021-07-09 10:22:26','2021-07-09 10:22:26');
/*!40000 ALTER TABLE `tblCategoryProduct` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblFooter`
--

DROP TABLE IF EXISTS `tblFooter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblFooter` (
  `FooterId` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Image` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`FooterId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblFooter`
--

LOCK TABLES `tblFooter` WRITE;
/*!40000 ALTER TABLE `tblFooter` DISABLE KEYS */;
INSERT INTO `tblFooter` VALUES (1,'Footer 1','images/dev/footer.png'),(2,'Footer 2','images/multivend/footer/1080x195/1.png'),(3,'Footer 3','images/multivend/footer/1080x195/1.png');
/*!40000 ALTER TABLE `tblFooter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblHeader`
--

DROP TABLE IF EXISTS `tblHeader`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblHeader` (
  `HeaderId` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Image` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`HeaderId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblHeader`
--

LOCK TABLES `tblHeader` WRITE;
/*!40000 ALTER TABLE `tblHeader` DISABLE KEYS */;
INSERT INTO `tblHeader` VALUES (1,'Header 1','images/dev/header.png');
/*!40000 ALTER TABLE `tblHeader` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblLog`
--

DROP TABLE IF EXISTS `tblLog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblLog` (
  `LogId` bigint(20) NOT NULL AUTO_INCREMENT,
  `Message` varchar(2000) CHARACTER SET utf8 DEFAULT NULL,
  `Level` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `CreateDateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`LogId`)
) ENGINE=InnoDB AUTO_INCREMENT=106681 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblLog`
--

LOCK TABLES `tblLog` WRITE;
/*!40000 ALTER TABLE `tblLog` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblLog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblMachine`
--

DROP TABLE IF EXISTS `tblMachine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblMachine` (
  `MachineId` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `SerialNo` varchar(255) CHARACTER SET utf8 NOT NULL,
  `AutoUpdate` int(11) NOT NULL,
  `Type` varchar(255) CHARACTER SET utf8 NOT NULL,
  `TimeZone` int(11) NOT NULL,
  `CurrencyType` varchar(255) CHARACTER SET utf8 NOT NULL,
  `DecimalPoints` int(11) NOT NULL,
  `LastSqlUpdateDateTime` datetime DEFAULT current_timestamp(),
  `HeartbeatThresholdHigh` int(11) DEFAULT 600,
  `HeartbeatThresholdLow` int(11) DEFAULT 1200,
  `TrxCheckThreshold` int(11) DEFAULT 38400,
  `TrxCountThreshold` int(11) DEFAULT 259200,
  `LastGSMLevel` int(11) DEFAULT 10,
  `SoftwareVersion` varchar(350) DEFAULT NULL,
  `PaymentSystem` varchar(200) DEFAULT '',
  `ForceSoftwareUpdate` int(11) DEFAULT 0,
  `Lng` decimal(10,6) DEFAULT 14.476088,
  `Lat` decimal(10,6) DEFAULT 53.382865,
  `UnlimitedMachineProducts` tinyint(1) DEFAULT 0,
  `UpdateDateTime` datetime DEFAULT '2020-10-01 00:00:00',
  `ClientId` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  `RemoteIP` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`MachineId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblMachine`
--

LOCK TABLES `tblMachine` WRITE;
/*!40000 ALTER TABLE `tblMachine` DISABLE KEYS */;
INSERT INTO `tblMachine` VALUES (1,'DefaultIMG','DefaultIMG',0,'V11',2,' zł',2,'2022-09-27 09:19:09',600,1200,38400,259200,10,'VS_995301f1fb543190f4863f0eaca2e651a27d68f4.VR_fea36d2d3925f8d38735d35592e3b2ea111636f0.VD_a6fa58b643c597a0266a79d599c9ec536dd7f199.RP_0653b360c789513b10fa267f966b9521128281d6.MA_9e4d16ae6e0dfda974d52bb3e1345d75e085742d.MD_b61c0b4b859779abb5b4b988c1b9c6b8d1c8ad88.RS_ed9151c82e61c574772bf5d8487df3ae293b525e','',0,14.476088,53.382865,1,'2022-04-14 11:59:27','DefaultIMG','DO AKUTALIZACJI');
/*!40000 ALTER TABLE `tblMachine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblMachineProduct`
--

DROP TABLE IF EXISTS `tblMachineProduct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblMachineProduct` (
  `MachineProductId` bigint(20) NOT NULL AUTO_INCREMENT,
  `MachineFeederNo` varchar(255) CHARACTER SET utf8 NOT NULL,
  `EAN` bigint(20) NOT NULL,
  `Price` float NOT NULL,
  `DiscountedPrice` float DEFAULT NULL,
  `Quantity` int(11) NOT NULL,
  `MaxItemCount` int(11) NOT NULL,
  `Width` int(11) DEFAULT NULL,
  `CreateUserId` bigint(20) NOT NULL,
  `UpdateUserId` bigint(20) NOT NULL,
  `CreateDateTime` datetime NOT NULL,
  `UpdateDateTime` datetime NOT NULL,
  `IsLocked` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`MachineProductId`),
  UNIQUE KEY `MachineFeederNo` (`MachineFeederNo`),
  UNIQUE KEY `MachineFeederNo_2` (`MachineFeederNo`),
  UNIQUE KEY `MachineFeederNo_3` (`MachineFeederNo`)
) ENGINE=InnoDB AUTO_INCREMENT=234911 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblMachineProduct`
--

LOCK TABLES `tblMachineProduct` WRITE;
/*!40000 ALTER TABLE `tblMachineProduct` DISABLE KEYS */;
INSERT INTO `tblMachineProduct` VALUES (234759,'2',1,0.2,NULL,0,20,NULL,1,2,'2021-04-27 10:48:28','2021-11-19 10:42:10',0),(234762,'5',1,0.2,NULL,0,10,NULL,1,2,'2021-04-27 10:48:28','2021-10-27 13:58:06',0),(234763,'6',1,0.2,NULL,0,10,NULL,1,2,'2021-04-27 10:48:28','2021-08-19 11:38:19',0),(234764,'7',1,0.2,NULL,0,10,NULL,1,2,'2021-04-27 10:48:28','2021-07-21 09:10:55',0),(234765,'8',1,0.2,NULL,0,10,NULL,1,2,'2021-04-27 10:48:28','2021-07-21 09:10:55',0),(234766,'9',1,0.2,NULL,0,10,NULL,1,2,'2021-04-27 10:48:28','2021-10-12 14:36:05',0),(234767,'11',1,0.2,NULL,0,10,NULL,1,2,'2021-04-27 10:48:28','2021-10-13 09:42:54',0),(234768,'12',1,0.2,NULL,0,10,NULL,1,1,'2021-10-13 09:42:55','2021-10-13 09:42:55',0),(234769,'13',1,0.2,NULL,0,10,NULL,1,2,'2021-04-27 10:48:28','2021-10-12 14:33:00',0),(234770,'14',1,0.2,NULL,0,10,NULL,1,2,'2021-04-27 10:48:28','2021-10-12 14:36:05',0),(234771,'15',1,0.2,NULL,0,10,NULL,1,2,'2021-04-27 10:48:28','2021-10-12 14:33:00',0),(234772,'16',1,0.2,NULL,0,10,NULL,1,2,'2021-04-27 10:48:28','2021-07-07 10:09:22',0),(234773,'17',1,0.2,NULL,0,10,NULL,1,2,'2021-04-27 10:48:28','2021-07-07 10:09:22',0),(234774,'18',1,0.2,NULL,0,10,NULL,1,2,'2021-04-27 10:48:28','2021-07-07 10:09:22',0),(234775,'19',1,0.2,NULL,0,10,NULL,1,2,'2021-04-27 10:48:28','2021-07-07 10:09:22',0),(234776,'21',1,0.2,NULL,0,10,NULL,1,2,'2021-04-27 10:48:28','2021-07-07 10:09:22',0),(234777,'22',1,0.2,NULL,0,10,NULL,1,2,'2021-04-27 10:48:28','2021-10-12 14:36:05',0),(234778,'23',1,0.2,NULL,0,10,NULL,1,2,'2021-04-27 10:48:28','2021-07-07 10:09:22',0),(234779,'24',1,0.2,NULL,0,10,NULL,1,2,'2021-04-27 10:48:28','2021-07-07 10:09:22',0),(234780,'25',1,0.2,NULL,0,10,NULL,1,2,'2021-04-27 10:48:28','2021-10-12 14:36:05',0),(234781,'26',1,0.2,NULL,0,10,NULL,1,2,'2021-04-27 10:48:28','2021-07-07 10:09:22',0),(234782,'27',1,0.2,NULL,0,10,NULL,1,2,'2021-04-27 10:48:28','2021-07-07 10:09:22',0),(234783,'28',1,0.2,NULL,0,10,NULL,1,2,'2021-04-27 10:48:28','2021-07-07 10:09:22',0),(234784,'29',1,0.2,NULL,0,10,NULL,1,2,'2021-04-27 10:48:28','2021-07-07 10:09:22',0),(234785,'31',1,0.2,NULL,0,10,NULL,1,2,'2021-04-27 10:48:28','2021-10-13 09:42:56',0),(234786,'32',1,0.2,NULL,0,10,NULL,1,2,'2021-04-27 10:48:28','2021-07-07 10:09:22',0),(234787,'33',1,0.2,NULL,0,10,NULL,1,2,'2021-04-27 10:48:28','2021-07-07 10:09:22',0),(234788,'34',1,0.2,NULL,0,10,NULL,1,2,'2021-04-27 10:48:28','2021-07-07 10:09:22',0),(234789,'35',1,0.2,NULL,0,10,NULL,1,2,'2021-04-27 10:48:28','2021-10-12 14:36:05',0),(234790,'36',1,0.2,NULL,0,10,NULL,1,2,'2021-04-27 10:48:28','2021-07-07 10:09:22',0),(234791,'37',1,0.2,NULL,0,10,NULL,1,2,'2021-04-27 10:48:28','2021-07-07 10:09:22',0),(234792,'38',1,0.2,NULL,0,10,NULL,1,2,'2021-04-27 10:48:28','2021-07-07 10:09:22',0),(234793,'39',1,0.2,NULL,0,10,NULL,1,2,'2021-04-27 10:48:28','2021-07-07 10:09:22',0),(234794,'41',1,0.2,NULL,0,10,NULL,1,2,'2021-04-27 10:48:28','2021-07-07 10:09:22',0),(234795,'42',1,0.2,NULL,0,10,NULL,1,2,'2021-04-27 10:48:28','2021-07-07 10:09:22',0),(234796,'43',1,0.2,NULL,0,10,NULL,1,2,'2021-04-27 10:48:28','2021-07-07 10:09:22',0),(234797,'44',1,0.2,NULL,0,10,NULL,1,2,'2021-04-27 10:48:28','2021-10-12 14:36:05',0),(234798,'45',1,0.2,NULL,0,10,NULL,1,2,'2021-04-27 10:48:28','2021-07-07 10:09:22',0),(234799,'46',1,0.2,NULL,0,10,NULL,1,2,'2021-04-27 10:48:28','2021-07-07 10:09:22',0),(234800,'47',1,0.2,NULL,0,10,NULL,1,2,'2021-04-27 10:48:28','2021-07-07 10:09:22',0),(234801,'48',1,0.2,NULL,0,10,NULL,1,2,'2021-04-27 10:48:28','2021-07-07 10:09:22',0),(234802,'49',1,0.2,NULL,0,10,NULL,1,2,'2021-04-27 10:48:28','2021-07-07 10:09:22',0),(234803,'51',1,0.2,NULL,0,10,NULL,1,2,'2021-04-27 10:48:28','2021-07-07 10:09:22',0),(234804,'52',1,0.2,NULL,0,10,NULL,1,2,'2021-04-27 10:48:28','2021-07-07 10:09:22',0),(234805,'53',1,0.2,NULL,0,10,NULL,1,2,'2021-04-27 10:48:28','2021-07-07 10:09:22',0),(234806,'54',1,0.2,NULL,0,10,NULL,1,2,'2021-04-27 10:48:28','2021-07-07 10:09:22',0),(234807,'55',1,0.2,NULL,0,10,NULL,1,2,'2021-04-27 10:48:28','2021-07-07 10:09:22',0),(234808,'56',1,0.2,NULL,0,10,NULL,1,2,'2021-04-27 10:48:28','2021-07-07 10:09:22',0),(234809,'57',1,0.2,NULL,0,10,NULL,1,2,'2021-04-27 10:48:28','2021-07-07 10:09:22',0),(234810,'58',1,0.2,NULL,0,10,NULL,1,2,'2021-04-27 10:48:28','2021-07-07 10:09:22',0),(234811,'59',1,0.2,NULL,0,10,NULL,1,2,'2021-04-27 10:48:28','2021-07-07 10:09:22',0),(234813,'60',1,0.2,NULL,0,10,NULL,1,1,'2021-10-12 14:36:05','2021-10-12 14:36:05',0),(234897,'68',1,0.2,NULL,0,10,NULL,1,1,'2021-11-16 09:33:13','2021-11-16 09:33:13',0),(234898,'69',1,0.2,NULL,0,10,NULL,1,1,'2021-11-16 09:33:13','2021-11-16 09:33:13',0),(234899,'62',1,0.2,NULL,0,10,NULL,1,1,'2021-11-16 09:33:13','2021-11-16 09:33:13',0),(234900,'63',1,0.2,NULL,0,10,NULL,1,1,'2021-11-16 09:33:13','2021-11-16 09:33:13',0),(234901,'66',1,0.2,NULL,0,10,NULL,1,1,'2021-11-16 09:33:13','2021-11-16 09:33:13',0),(234902,'67',1,0.2,NULL,0,10,NULL,1,1,'2021-11-16 09:33:13','2021-11-16 09:33:13',0),(234903,'64',1,0.2,NULL,0,10,NULL,1,1,'2021-11-16 09:33:13','2021-11-16 09:33:13',0),(234904,'65',1,0.2,NULL,0,10,NULL,1,1,'2021-11-16 09:33:13','2021-11-16 09:33:13',0),(234905,'61',1,0.2,NULL,0,10,NULL,1,1,'2021-11-16 09:42:06','2021-11-16 09:42:06',0),(234906,'4',1,0.2,NULL,0,10,NULL,1,1,'2021-11-19 09:55:15','2021-11-19 10:55:15',0),(234907,'3',1,0.2,NULL,0,10,NULL,1,1,'2021-11-19 09:55:15','2021-11-19 10:55:15',0),(234908,'1',1,0.2,NULL,0,20,NULL,1,2,'2021-11-19 12:44:02','2021-11-19 13:44:02',0);
/*!40000 ALTER TABLE `tblMachineProduct` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblPaymentType`
--

DROP TABLE IF EXISTS `tblPaymentType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblPaymentType` (
  `PaymentTypeId` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Enabled` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`PaymentTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblPaymentType`
--

LOCK TABLES `tblPaymentType` WRITE;
/*!40000 ALTER TABLE `tblPaymentType` DISABLE KEYS */;
INSERT INTO `tblPaymentType` VALUES (1,'Cashless_Terminal',1),(2,'Coin_Acceptor',1),(3,'Cashless_Token',0),(4,'BLIK',0),(5,'Bill_Acceptor',0),(6,'Code',0);
/*!40000 ALTER TABLE `tblPaymentType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblPermission`
--

DROP TABLE IF EXISTS `tblPermission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblPermission` (
  `PermissionId` bigint(20) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`PermissionId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblPermission`
--

LOCK TABLES `tblPermission` WRITE;
/*!40000 ALTER TABLE `tblPermission` DISABLE KEYS */;
INSERT INTO `tblPermission` VALUES (1,'VD_PRODUCTS'),(2,'VD_CATEGORIES'),(3,'VD_MACHINE_CONFIG'),(4,'VD_MACHINE_RECHARGE'),(5,'VD_USERS');
/*!40000 ALTER TABLE `tblPermission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblProductEx`
--

DROP TABLE IF EXISTS `tblProductEx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblProductEx` (
  `EAN` bigint(20) NOT NULL,
  `Name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `Description` varchar(20000) CHARACTER SET utf8 DEFAULT NULL,
  `Image` varchar(255) DEFAULT NULL,
  `Thumbnail` varchar(255) DEFAULT NULL,
  `Associations` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Groups` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `CreateUserId` bigint(20) NOT NULL,
  `UpdateUserId` bigint(20) DEFAULT NULL,
  `CreateDateTime` datetime NOT NULL,
  `UpdateDateTime` datetime NOT NULL,
  `LastPriceNetto` float DEFAULT 0,
  `VatId` int(11) DEFAULT 3,
  PRIMARY KEY (`EAN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblProductEx`
--

LOCK TABLES `tblProductEx` WRITE;
/*!40000 ALTER TABLE `tblProductEx` DISABLE KEYS */;
INSERT INTO `tblProductEx` VALUES (1,'Nazwa produktu','Opis produktu ...','images/dev/products/1.png','images/dev/products/1.png',NULL,NULL,1,1,'2021-04-27 13:03:09','2022-01-17 11:02:40',0,3);
/*!40000 ALTER TABLE `tblProductEx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblRole`
--

DROP TABLE IF EXISTS `tblRole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblRole` (
  `RoleId` bigint(20) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `CreateUserId` int(11) DEFAULT NULL,
  `UpdateUserId` int(11) DEFAULT NULL,
  `CreateDateTime` datetime DEFAULT NULL,
  `UpdateDateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`RoleId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblRole`
--

LOCK TABLES `tblRole` WRITE;
/*!40000 ALTER TABLE `tblRole` DISABLE KEYS */;
INSERT INTO `tblRole` VALUES (1,'Serwisant',1,1,'2020-09-08 12:58:41','2020-09-08 12:58:41'),(2,'Właściciel',1,1,'2020-09-08 12:58:41','2020-09-08 12:58:41');
/*!40000 ALTER TABLE `tblRole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblRolePermission`
--

DROP TABLE IF EXISTS `tblRolePermission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblRolePermission` (
  `RolePermissionId` bigint(20) NOT NULL AUTO_INCREMENT,
  `RoleId` int(11) DEFAULT NULL,
  `PermissionId` int(11) DEFAULT NULL,
  PRIMARY KEY (`RolePermissionId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblRolePermission`
--

LOCK TABLES `tblRolePermission` WRITE;
/*!40000 ALTER TABLE `tblRolePermission` DISABLE KEYS */;
INSERT INTO `tblRolePermission` VALUES (1,1,4),(6,2,1),(7,2,2),(8,2,3),(9,2,4),(10,2,5);
/*!40000 ALTER TABLE `tblRolePermission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblScreensaver`
--

DROP TABLE IF EXISTS `tblScreensaver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblScreensaver` (
  `ScreensaverId` bigint(20) NOT NULL AUTO_INCREMENT,
  `Image` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Duration` int(11) DEFAULT 10,
  PRIMARY KEY (`ScreensaverId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblScreensaver`
--

LOCK TABLES `tblScreensaver` WRITE;
/*!40000 ALTER TABLE `tblScreensaver` DISABLE KEYS */;
INSERT INTO `tblScreensaver` VALUES (1,'images/multivend/screensaver/1.jpg',10),(2,'images/multivend/screensaver/2.jpg',10),(3,'images/multivend/screensaver/3.jpg',10),(4,'images/multivend/screensaver/4.jpg',10);
/*!40000 ALTER TABLE `tblScreensaver` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblServiceman`
--

DROP TABLE IF EXISTS `tblServiceman`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblServiceman` (
  `ServicemanId` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Phone` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Email` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`ServicemanId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblServiceman`
--

LOCK TABLES `tblServiceman` WRITE;
/*!40000 ALTER TABLE `tblServiceman` DISABLE KEYS */;
INSERT INTO `tblServiceman` VALUES (1,'Infolinia','','');
/*!40000 ALTER TABLE `tblServiceman` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblTransaction`
--

DROP TABLE IF EXISTS `tblTransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblTransaction` (
  `TransactionId` bigint(20) NOT NULL AUTO_INCREMENT,
  `UUID` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `GiveAwayNo` bigint(20) DEFAULT NULL,
  `Name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `PaymentType` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `MachineFeederNo` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `EAN` bigint(20) DEFAULT NULL,
  `Price` float DEFAULT NULL,
  `CreateDateTime` datetime DEFAULT NULL,
  `UpdateDateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`TransactionId`)
) ENGINE=InnoDB AUTO_INCREMENT=360 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblTransaction`
--

LOCK TABLES `tblTransaction` WRITE;
/*!40000 ALTER TABLE `tblTransaction` DISABLE KEYS */;
INSERT INTO `tblTransaction` VALUES (1,'305c1b05-2a88-11ec-951a-e2f63b76507a',1,'Product received','Cashless_Terminal','103',10782,0.02,'2021-10-11 13:56:03','2021-10-11 13:56:44'),(2,'97c3a9fb-2abb-11ec-945f-e2f63b76507a',1,'Product received','Coin_Acceptor','101',20843,0.2,'2021-10-12 14:55:48','2021-10-12 14:56:28'),(3,'b5992bda-2abb-11ec-945f-e2f63b76507a',1,'Product received','Coin_Acceptor','101',20843,0.2,'2021-10-12 14:56:38','2021-10-12 14:57:13'),(4,'d57664b9-2abb-11ec-945f-e2f63b76507a',1,'Product received','Coin_Acceptor','101',20843,0.2,'2021-10-12 14:57:31','2021-10-12 14:58:09'),(5,'ee651b0b-2abb-11ec-945f-e2f63b76507a',1,'Product received','Coin_Acceptor','102',15,2.3,'2021-10-12 14:58:13','2021-10-12 14:59:39'),(6,'2459bfe7-2abc-11ec-945f-e2f63b76507a',1,'Product received','Coin_Acceptor','103',10782,0.02,'2021-10-12 14:59:44','2021-10-12 15:00:13'),(7,'467194a0-2abc-11ec-945f-e2f63b76507a',1,'Product received','Coin_Acceptor','111',21093,0.2,'2021-10-12 15:00:41','2021-10-12 15:01:22'),(8,'6251a7bd-2abc-11ec-945f-e2f63b76507a',1,'Product received','Coin_Acceptor','112',1,0.2,'2021-10-12 15:01:28','2021-10-12 15:02:02'),(9,'7f2c5269-2abc-11ec-945f-e2f63b76507a',1,'Product received','Coin_Acceptor','112',1,0.2,'2021-10-12 15:02:16','2021-10-12 15:02:50'),(10,'97d24783-2abc-11ec-945f-e2f63b76507a',1,'Product received','Coin_Acceptor','112',1,0.2,'2021-10-12 15:02:57','2021-10-12 15:03:23'),(11,'5edb3708-2abe-11ec-945f-e2f63b76507a',1,'Product received','Coin_Acceptor','131',1,0.2,'2021-10-12 15:15:41','2021-10-12 15:16:09'),(12,'ac6e56a4-2b6a-11ec-961c-e2f63b76507a',1,'Product received','Coin_Acceptor','101',20843,0.2,'2021-10-13 09:44:22','2021-10-13 09:45:02'),(13,'9aa67571-2bf6-11ec-95a4-e2f63b76507a',1,'Vend denied','Cashless_Terminal','103',10782,0.02,'2021-10-13 10:07:41','2021-10-13 10:07:56'),(14,'aab13ac9-2bf6-11ec-95a4-e2f63b76507a',1,'Open','Cashless_Terminal','103',10782,0.02,'2021-10-13 10:08:08','2021-10-13 10:08:08'),(15,'1dcbeb26-2bf7-11ec-95a4-e2f63b76507a',1,'Product received','Coin_Acceptor','101',20843,0.2,'2021-10-13 10:11:21','2021-10-13 10:11:54'),(16,'35012e8a-2bf7-11ec-95a4-e2f63b76507a',1,'Product received','Coin_Acceptor','101',20843,0.2,'2021-10-13 10:12:00','2021-10-13 10:12:45'),(17,'b5dfc459-2bf7-11ec-95a4-e2f63b76507a',1,'Vend canceled','Cashless_Terminal','103',10782,0.02,'2021-10-13 10:15:36','2021-10-13 10:16:34'),(18,'dfba31d6-2bf7-11ec-95a4-e2f63b76507a',1,'Vend failure','Cashless_Terminal','101',20843,0.2,'2021-10-13 10:16:46','2021-10-13 10:17:03'),(19,'05c56e76-2bf8-11ec-95a4-e2f63b76507a',1,'Vend canceled','Cashless_Terminal','104',3,0.02,'2021-10-13 10:17:50','2021-10-13 10:17:56'),(20,'0fa285da-2bf8-11ec-95a4-e2f63b76507a',1,'Vend denied','Cashless_Terminal','104',3,0.02,'2021-10-13 10:18:07','2021-10-13 10:19:22'),(21,'ab9d7002-2bf8-11ec-95a4-e2f63b76507a',1,'Product received','Cashless_Terminal','103',10782,0.02,'2021-10-13 10:22:28','2021-10-13 10:23:27'),(22,'dc6f8214-2bf8-11ec-95a4-e2f63b76507a',1,'Vend success','Coin_Acceptor','111',21093,0.2,'2021-10-13 10:23:50','2021-10-13 10:24:20'),(23,'73a6ff1f-2bfe-11ec-9492-e2f63b76507a',1,'Product received','Coin_Acceptor','101',20843,0.2,'2021-10-13 10:28:42','2021-10-13 10:29:21'),(24,'73a6ff1f-2bfe-11ec-9492-e2f63b76507a',2,'Product received','Coin_Acceptor','101',20843,0.2,'2021-10-13 10:28:42','2021-10-13 10:29:52'),(25,'73a6ff1f-2bfe-11ec-9492-e2f63b76507a',3,'Product received','Coin_Acceptor','101',20843,0.2,'2021-10-13 10:28:42','2021-10-13 10:30:22'),(26,'73a6ff1f-2bfe-11ec-9492-e2f63b76507a',4,'Product received','Coin_Acceptor','101',20843,0.2,'2021-10-13 10:28:42','2021-10-13 10:30:49'),(27,'73a6ff1f-2bfe-11ec-9492-e2f63b76507a',5,'Product received','Coin_Acceptor','101',20843,0.2,'2021-10-13 10:28:42','2021-10-13 10:31:18'),(28,'65292514-2c01-11ec-9492-e2f63b76507a',1,'Product received','Coin_Acceptor','102',15,2.3,'2021-10-13 10:49:46','2021-10-13 10:51:15'),(29,'65292514-2c01-11ec-9492-e2f63b76507a',2,'Product received','Coin_Acceptor','102',15,2.3,'2021-10-13 10:49:46','2021-10-13 10:51:44'),(30,'65292514-2c01-11ec-9492-e2f63b76507a',3,'Product received','Coin_Acceptor','103',10782,0.02,'2021-10-13 10:49:46','2021-10-13 10:52:09'),(31,'65292514-2c01-11ec-9492-e2f63b76507a',4,'Product received','Coin_Acceptor','103',10782,0.02,'2021-10-13 10:49:46','2021-10-13 10:52:36'),(32,'6c158262-2c07-11ec-948b-e2f63b76507a',1,'Product received','Cashless_Terminal','103',10782,0.02,'2021-10-13 11:33:27','2021-10-13 11:34:09'),(33,'4b5749ca-2c0a-11ec-94f2-e2f63b76507a',1,'Product received','Cashless_Terminal','103',10782,0.02,'2021-10-13 11:55:32','2021-10-13 11:56:08'),(34,'c8317fcf-2cf4-11ec-94d2-e2f63b76507a',1,'Product received','Cashless_Terminal','103',10782,0.02,'2021-10-18 08:43:53','2021-10-18 08:44:42'),(35,'89828706-30ab-11ec-9509-e2f63b76507a',1,'Vend canceled','Coin_Acceptor','102',15,2.3,'2021-10-19 09:14:18','2021-10-19 09:14:27'),(36,'a07bf1ff-30ab-11ec-9509-e2f63b76507a',1,'Payment approved','Coin_Acceptor','103',10782,0.02,'2021-10-19 09:14:56','2021-10-19 09:14:56'),(37,'6875251c-30ac-11ec-94c2-e2f63b76507a',1,'Payment approved','Coin_Acceptor','103',10782,0.02,'2021-10-19 09:17:17','2021-10-19 09:17:17'),(38,'c7b54f64-30ac-11ec-9593-e2f63b76507a',1,'Product received','Coin_Acceptor','103',10782,0.02,'2021-10-19 09:19:48','2021-10-19 09:20:16'),(39,'f6c384db-30ac-11ec-9593-e2f63b76507a',1,'Vend failure','Coin_Acceptor','202',1,0.2,'2021-10-19 09:21:07','2021-10-19 09:21:22'),(40,'088935bf-30ad-11ec-9593-e2f63b76507a',1,'Vend failure','Coin_Acceptor','303',1,0.02,'2021-10-19 09:21:37','2021-10-19 09:22:11'),(41,'55dcf86f-30ad-11ec-9593-e2f63b76507a',1,'Product received','Coin_Acceptor','101',20843,0.2,'2021-10-19 09:23:47','2021-10-19 09:24:49'),(42,'55dcf86f-30ad-11ec-9593-e2f63b76507a',2,'Vend failure','Coin_Acceptor','101',20843,0.2,'2021-10-19 09:23:47','2021-10-19 09:25:13'),(43,'55dcf86f-30ad-11ec-9593-e2f63b76507a',3,'Vend failure','Coin_Acceptor','101',20843,0.2,'2021-10-19 09:23:47','2021-10-19 09:25:13'),(44,'55dcf86f-30ad-11ec-9593-e2f63b76507a',4,'Vend failure','Coin_Acceptor','101',20843,0.2,'2021-10-19 09:23:47','2021-10-19 09:25:44'),(45,'14cf2fed-318b-11ec-9614-e2f63b76507a',1,'Vend denied','Coin_Acceptor','111',21093,0.2,'2021-10-20 11:54:44','2021-10-20 11:54:49'),(46,'3f8ae73d-318b-11ec-9614-e2f63b76507a',1,'Vend denied','Coin_Acceptor','101',20843,0.2,'2021-10-20 11:55:55','2021-10-20 11:56:03'),(47,'7ca57397-318f-11ec-94cc-e2f63b76507a',1,'Vend denied','Coin_Acceptor','121',1,0.2,'2021-10-20 12:29:00','2021-10-20 12:29:09'),(48,'7dc8a761-3190-11ec-93ee-e2f63b76507a',1,'Vend denied','Cashless_Terminal','112',1,0.2,'2021-10-20 12:42:27','2021-10-20 12:42:55'),(49,'9bd3dc3e-3190-11ec-93ee-e2f63b76507a',1,'Product received','Cashless_Terminal','112',1,0.2,'2021-10-20 12:43:17','2021-10-20 12:43:27'),(50,'b22bf3b6-3190-11ec-93ee-e2f63b76507a',1,'Vend denied','Cashless_Terminal','114',1,0.2,'2021-10-20 12:43:54','2021-10-20 12:44:19'),(51,'9bd9b739-3193-11ec-9378-e2f63b76507a',1,'Vend denied','Coin_Acceptor','131',1,0.2,'2021-10-20 12:51:57','2021-10-20 12:52:27'),(52,'2f0dcb66-3194-11ec-9378-e2f63b76507a',1,'Vend failure','Coin_Acceptor','139',1,0.2,'2021-10-20 12:56:04','2021-10-20 12:56:14'),(53,'40b62367-3194-11ec-9378-e2f63b76507a',1,'Vend denied','Coin_Acceptor','114',1,0.2,'2021-10-20 12:56:33','2021-10-20 12:56:45'),(54,'839cad02-3194-11ec-9378-e2f63b76507a',1,'Vend denied','Coin_Acceptor','116',1,0.2,'2021-10-20 12:58:25','2021-10-20 12:58:34'),(55,'d9139a36-3194-11ec-9401-e2f63b76507a',1,'Vend denied','Coin_Acceptor','114',1,0.2,'2021-10-20 13:04:30','2021-10-20 13:04:35'),(56,'e916363a-319d-11ec-9401-e2f63b76507a',1,'Vend denied','Coin_Acceptor','132',1,0.2,'2021-10-20 14:09:22','2021-10-20 14:09:36'),(57,'0a72ccae-31a0-11ec-94bd-e2f63b76507a',1,'Vend denied','Coin_Acceptor','124',1,0.2,'2021-10-20 14:21:23','2021-10-20 14:21:35'),(58,'8e3b66ee-31a2-11ec-95b1-e2f63b76507a',1,'Product received','Coin_Acceptor','126',1,0.2,'2021-10-20 14:47:13','2021-10-20 14:47:57'),(59,'2dad7b79-31a3-11ec-95b1-e2f63b76507a',1,'Vend failure','Coin_Acceptor','126',1,0.2,'2021-10-20 14:51:40','2021-10-20 14:52:27'),(60,'2894f527-31a4-11ec-95b1-e2f63b76507a',1,'Vend failure','Coin_Acceptor','101',20843,0.2,'2021-10-20 14:58:41','2021-10-20 14:59:16'),(61,'4ac66e6b-31a4-11ec-95b1-e2f63b76507a',1,'Vend canceled','Coin_Acceptor','111',21093,0.2,'2021-10-20 14:59:39','2021-10-20 14:59:40'),(62,'4f96f002-31a4-11ec-95b1-e2f63b76507a',1,'Vend failure','Coin_Acceptor','111',21093,0.2,'2021-10-20 14:59:47','2021-10-20 15:00:20'),(63,'ca9d188f-31a4-11ec-95b1-e2f63b76507a',1,'Vend failure','Coin_Acceptor','112',1,0.2,'2021-10-20 15:03:13','2021-10-20 15:03:41'),(64,'e27693a4-31a4-11ec-95b1-e2f63b76507a',1,'Vend failure','Coin_Acceptor','116',1,0.2,'2021-10-20 15:03:53','2021-10-20 15:04:21'),(65,'feb63e07-31a4-11ec-95b1-e2f63b76507a',1,'Vend failure','Coin_Acceptor','147',1,0.2,'2021-10-20 15:04:41','2021-10-20 15:05:01'),(66,'12d37425-31a5-11ec-95b1-e2f63b76507a',1,'Vend canceled','Coin_Acceptor','121',1,0.2,'2021-10-20 15:05:14','2021-10-20 15:05:24'),(67,'1e07a774-31a5-11ec-95b1-e2f63b76507a',1,'Vend canceled','Coin_Acceptor','121',1,0.2,'2021-10-20 15:05:33','2021-10-20 15:05:34'),(68,'227aa8b6-31a5-11ec-95b1-e2f63b76507a',1,'Vend canceled','Coin_Acceptor','121',1,0.2,'2021-10-20 15:05:41','2021-10-20 15:05:44'),(69,'f11a9acf-31a4-11ec-9579-e2f63b76507a',1,'Vend failure','Coin_Acceptor','121',1,0.2,'2021-10-20 15:08:02','2021-10-20 15:08:34'),(70,'8e9c9edd-31a5-11ec-9579-e2f63b76507a',1,'Vend failure','Coin_Acceptor','131',1,0.2,'2021-10-20 15:12:27','2021-10-20 15:13:04'),(71,'4378dffe-31a6-11ec-9579-e2f63b76507a',1,'Open','Coin_Acceptor','131',1,0.2,'2021-10-20 15:17:30','2021-10-20 15:17:30'),(72,'b56c7cc4-31a8-11ec-9419-e2f63b76507a',1,'Vend failure','Coin_Acceptor','101',20843,0.2,'2021-10-20 15:22:57','2021-10-20 15:23:39'),(73,'db2ed430-31a8-11ec-9419-e2f63b76507a',1,'Vend failure','Coin_Acceptor','114',1,0.2,'2021-10-20 15:24:00','2021-10-20 15:24:35'),(74,'401bfdc4-31aa-11ec-992b-e2f63b76507a',1,'Vend failure','Coin_Acceptor','101',20843,0.2,'2021-10-20 15:38:53','2021-10-20 15:39:36'),(75,'64a89213-31aa-11ec-992b-e2f63b76507a',1,'Vend failure','Coin_Acceptor','111',21093,0.2,'2021-10-20 15:39:54','2021-10-20 15:40:30'),(76,'8396725b-31aa-11ec-992b-e2f63b76507a',1,'Product received','Coin_Acceptor','102',15,2.3,'2021-10-20 15:40:46','2021-10-20 15:42:11'),(77,'be053b07-31aa-11ec-992b-e2f63b76507a',1,'Vend canceled','Coin_Acceptor','121',1,0.2,'2021-10-20 15:42:24','2021-10-20 15:42:31'),(78,'120bd944-31ab-11ec-992b-e2f63b76507a',1,'Vend canceled','Coin_Acceptor','114',1,0.2,'2021-10-20 15:44:45','2021-10-20 15:44:47'),(79,'45dcdb4b-31ab-11ec-992b-e2f63b76507a',1,'Vend canceled','Coin_Acceptor','121',1,0.2,'2021-10-20 15:46:12','2021-10-20 15:46:14'),(80,'5b38dde0-31ad-11ec-9460-e2f63b76507a',1,'Open','Coin_Acceptor','101',20843,0.2,'2021-10-20 16:04:00','2021-10-20 16:04:00'),(81,'9a60931d-31ae-11ec-9472-e2f63b76507a',1,'Vend failure','Coin_Acceptor','101',20843,0.2,'2021-10-20 16:05:51','2021-10-20 16:06:23'),(82,'cc491731-31ae-11ec-9472-e2f63b76507a',1,'Vend canceled','Coin_Acceptor','111',21093,0.2,'2021-10-20 16:07:15','2021-10-20 16:07:20'),(83,'fb689690-3235-11ec-9383-e2f63b76507a',1,'Product received','Coin_Acceptor','125',1,0.2,'2021-10-21 08:16:45','2021-10-21 08:17:11'),(84,'1924c9a4-3236-11ec-9383-e2f63b76507a',1,'Product received','Coin_Acceptor','124',1,0.2,'2021-10-21 08:17:35','2021-10-21 08:18:00'),(85,'37c3cf01-3236-11ec-9383-e2f63b76507a',1,'Vend canceled','Coin_Acceptor','123',1,0.2,'2021-10-21 08:18:27','2021-10-21 08:18:37'),(86,'49e6a4c6-3236-11ec-9383-e2f63b76507a',1,'Product received','Coin_Acceptor','123',1,0.2,'2021-10-21 08:18:57','2021-10-21 08:19:26'),(87,'653f4528-3236-11ec-9383-e2f63b76507a',1,'Vend canceled','Coin_Acceptor','123',1,0.2,'2021-10-21 08:19:43','2021-10-21 08:19:46'),(88,'6ae3e897-3236-11ec-9383-e2f63b76507a',1,'Vend failure','Coin_Acceptor','123',1,0.2,'2021-10-21 08:19:52','2021-10-21 08:20:19'),(89,'956f54e2-3236-11ec-9383-e2f63b76507a',1,'Product received','Coin_Acceptor','122',1,0.2,'2021-10-21 08:21:04','2021-10-21 08:21:31'),(90,'c40cdf84-3236-11ec-9383-e2f63b76507a',1,'Vend canceled','Coin_Acceptor','122',1,0.2,'2021-10-21 08:22:22','2021-10-21 08:22:24'),(91,'e46a4979-3236-11ec-9383-e2f63b76507a',1,'Product received','Coin_Acceptor','117',1,0.2,'2021-10-21 08:23:16','2021-10-21 08:23:42'),(92,'047c0fc2-3237-11ec-9383-e2f63b76507a',1,'Vend failure','Coin_Acceptor','117',1,0.2,'2021-10-21 08:24:10','2021-10-21 08:24:33'),(93,'2bcaac9c-3237-11ec-9383-e2f63b76507a',1,'Vend failure','Coin_Acceptor','111',21093,0.2,'2021-10-21 08:25:16','2021-10-21 08:25:47'),(94,'2bcaac9c-3237-11ec-9383-e2f63b76507a',2,'Vend failure','Coin_Acceptor','111',21093,0.2,'2021-10-21 08:25:16','2021-10-21 08:25:47'),(95,'4ed7b7a2-3237-11ec-9383-e2f63b76507a',1,'Vend failure','Coin_Acceptor','112',1,0.2,'2021-10-21 08:26:15','2021-10-21 08:26:37'),(96,'7358cfa2-3237-11ec-9383-e2f63b76507a',1,'Vend failure','Coin_Acceptor','116',1,0.2,'2021-10-21 08:27:16','2021-10-21 08:27:39'),(97,'db08a4c2-3237-11ec-9383-e2f63b76507a',1,'Vend canceled','Coin_Acceptor','113',1,0.2,'2021-10-21 08:30:10','2021-10-21 08:30:42'),(98,'0eb2840e-3238-11ec-9383-e2f63b76507a',1,'Vend canceled','Coin_Acceptor','121',1,0.2,'2021-10-21 08:31:37','2021-10-21 08:31:43'),(99,'0eb2840e-3238-11ec-9383-e2f63b76507a',2,'Vend canceled','Coin_Acceptor','121',1,0.2,'2021-10-21 08:31:37','2021-10-21 08:31:43'),(100,'9b3df1ac-3238-11ec-9383-e2f63b76507a',1,'Vend failure','Coin_Acceptor','121',1,0.2,'2021-10-21 08:35:33','2021-10-21 08:36:02'),(101,'1a237c0e-3239-11ec-9383-e2f63b76507a',1,'Vend failure','Coin_Acceptor','122',1,0.2,'2021-10-21 08:39:05','2021-10-21 08:39:27'),(102,'0579c024-323c-11ec-94e8-e2f63b76507a',1,'Vend denied','Cashless_Terminal','141',1,0.2,'2021-10-21 08:58:15','2021-10-21 08:59:26'),(103,'40775f42-323c-11ec-94e8-e2f63b76507a',1,'Vend canceled','Cashless_Terminal','113',1,0.2,'2021-10-21 08:59:54','2021-10-21 09:00:24'),(104,'6182ace3-323c-11ec-94e8-e2f63b76507a',1,'Vend denied','Cashless_Terminal','111',21093,0.2,'2021-10-21 09:00:50','2021-10-21 09:01:02'),(105,'8530c1c4-323c-11ec-94e8-e2f63b76507a',1,'Vend denied','Cashless_Terminal','111',21093,0.2,'2021-10-21 09:01:50','2021-10-21 09:02:12'),(106,'b686f763-323c-11ec-94e8-e2f63b76507a',1,'Vend denied','Cashless_Terminal','113',1,0.2,'2021-10-21 09:03:13','2021-10-21 09:03:27'),(107,'de5cb93f-323c-11ec-94e8-e2f63b76507a',1,'Vend denied','Coin_Acceptor','115',1,0.2,'2021-10-21 09:04:19','2021-10-21 09:04:40'),(108,'2393c7bc-3240-11ec-961e-e2f63b76507a',1,'Vend canceled','Coin_Acceptor','111',21093,0.2,'2021-10-21 09:38:43','2021-10-21 09:38:44'),(109,'2a5f122a-3240-11ec-961e-e2f63b76507a',1,'Vend canceled','Coin_Acceptor','111',21093,0.2,'2021-10-21 09:38:54','2021-10-21 09:38:56'),(110,'300f68f3-3240-11ec-961e-e2f63b76507a',1,'Vend canceled','Coin_Acceptor','111',21093,0.2,'2021-10-21 09:39:04','2021-10-21 09:39:05'),(111,'5392e4ef-3240-11ec-961e-e2f63b76507a',1,'Vend canceled','Coin_Acceptor','111',21093,0.2,'2021-10-21 09:40:03','2021-10-21 09:40:04'),(112,'59446ca2-3240-11ec-961e-e2f63b76507a',1,'Vend canceled','Coin_Acceptor','111',21093,0.2,'2021-10-21 09:40:13','2021-10-21 09:40:14'),(113,'5edc929c-3240-11ec-961e-e2f63b76507a',1,'Vend canceled','Coin_Acceptor','111',21093,0.2,'2021-10-21 09:40:22','2021-10-21 09:40:24'),(114,'691a5924-3240-11ec-961e-e2f63b76507a',1,'Open','BLIK','111',21093,0.2,'2021-10-21 09:40:39','2021-10-21 09:40:39'),(115,'82bf1c7f-3240-11ec-961e-e2f63b76507a',1,'Vend canceled','Coin_Acceptor','118',1,0.2,'2021-10-21 09:41:22','2021-10-21 09:41:23'),(116,'888641f3-3240-11ec-961e-e2f63b76507a',1,'Vend canceled','Coin_Acceptor','118',1,0.2,'2021-10-21 09:41:32','2021-10-21 09:41:33'),(117,'8dee06a6-3240-11ec-961e-e2f63b76507a',1,'Vend canceled','Coin_Acceptor','118',1,0.2,'2021-10-21 09:41:41','2021-10-21 09:41:42'),(118,'9351dd28-3240-11ec-961e-e2f63b76507a',1,'Vend canceled','Coin_Acceptor','118',1,0.2,'2021-10-21 09:41:50','2021-10-21 09:41:51'),(119,'99edb0b6-3240-11ec-961e-e2f63b76507a',1,'Vend canceled','Coin_Acceptor','118',1,0.2,'2021-10-21 09:42:01','2021-10-21 09:42:03'),(120,'99edb0b6-3240-11ec-961e-e2f63b76507a',2,'Vend canceled','Coin_Acceptor','111',21093,0.2,'2021-10-21 09:42:01','2021-10-21 09:42:03'),(121,'43e4a7e2-3242-11ec-94ba-e2f63b76507a',1,'Vend canceled','Coin_Acceptor','123',1,0.2,'2021-10-21 09:45:03','2021-10-21 09:45:03'),(122,'4b2e900e-3242-11ec-94ba-e2f63b76507a',1,'Vend canceled','Coin_Acceptor','123',1,0.2,'2021-10-21 09:45:15','2021-10-21 09:45:19'),(123,'66084d81-3242-11ec-94ba-e2f63b76507a',1,'Vend canceled','Coin_Acceptor','123',1,0.2,'2021-10-21 09:46:00','2021-10-21 09:46:02'),(124,'749a7f14-3242-11ec-94ba-e2f63b76507a',1,'Vend canceled','Coin_Acceptor','123',1,0.2,'2021-10-21 09:46:25','2021-10-21 09:46:26'),(125,'7dabe37b-3242-11ec-94ba-e2f63b76507a',1,'Vend canceled','Cashless_Terminal','123',1,0.2,'2021-10-21 09:46:40','2021-10-21 09:46:48'),(126,'977d3a12-3242-11ec-94ba-e2f63b76507a',1,'Vend failure','Cashless_Terminal','123',1,0.2,'2021-10-21 09:47:23','2021-10-21 09:47:54'),(127,'e53186ec-3244-11ec-9544-e2f63b76507a',1,'Vend canceled','Coin_Acceptor','111',21093,0.2,'2021-10-21 10:04:44','2021-10-21 10:04:45'),(128,'964e7909-366d-11ec-940b-e2f63b76507a',1,'Product received','Coin_Acceptor','101',20843,0.2,'2021-10-27 08:31:21','2021-10-27 08:32:05'),(129,'e3c22b0a-3701-11ec-9544-e2f63b76507a',1,'Vend failure','Coin_Acceptor','203',1,0.2,'2021-10-27 11:02:43','2021-10-27 11:02:57'),(130,'0bbd4a7e-3702-11ec-9544-e2f63b76507a',1,'Product received','Coin_Acceptor','101',20843,0.2,'2021-10-27 11:03:50','2021-10-27 11:04:20'),(131,'309f6509-3702-11ec-9544-e2f63b76507a',1,'Vend failure','Coin_Acceptor','205',1,0.2,'2021-10-27 11:04:52','2021-10-27 11:05:06'),(132,'4111df72-3702-11ec-9544-e2f63b76507a',1,'Vend canceled','Coin_Acceptor','104',3,0.02,'2021-10-27 11:05:20','2021-10-27 11:05:22'),(133,'5536b21b-3702-11ec-9544-e2f63b76507a',1,'Vend failure','Coin_Acceptor','207',1,0.2,'2021-10-27 11:05:54','2021-10-27 11:06:13'),(134,'5536b21b-3702-11ec-9544-e2f63b76507a',2,'Vend failure','Coin_Acceptor','207',1,0.2,'2021-10-27 11:05:54','2021-10-27 11:06:13'),(135,'8a8188d3-3702-11ec-9544-e2f63b76507a',1,'Product received','Coin_Acceptor','111',21093,0.2,'2021-10-27 11:07:23','2021-10-27 11:08:02'),(136,'a6f0557b-3702-11ec-9544-e2f63b76507a',1,'Product received','Coin_Acceptor','112',1,0.2,'2021-10-27 11:08:11','2021-10-27 11:08:43'),(137,'beeaee41-3702-11ec-9544-e2f63b76507a',1,'Product received','Coin_Acceptor','113',1,0.2,'2021-10-27 11:08:51','2021-10-27 11:09:25'),(138,'d7e8b698-3702-11ec-9544-e2f63b76507a',1,'Product received','Coin_Acceptor','114',1,0.2,'2021-10-27 11:09:33','2021-10-27 11:10:00'),(139,'286d5ec7-3703-11ec-9544-e2f63b76507a',1,'Product received','Coin_Acceptor','116',1,0.2,'2021-10-27 11:11:48','2021-10-27 11:12:18'),(140,'6218fae4-3703-11ec-9544-e2f63b76507a',1,'Product received','Coin_Acceptor','113',1,0.2,'2021-10-27 11:13:25','2021-10-27 11:13:57'),(141,'7e6a5695-3703-11ec-9544-e2f63b76507a',1,'Product received','Coin_Acceptor','113',1,0.2,'2021-10-27 11:14:12','2021-10-27 11:14:42'),(142,'00144550-3715-11ec-9544-e2f63b76507a',1,'Product received','Coin_Acceptor','114',1,0.2,'2021-10-27 13:19:31','2021-10-27 13:20:08'),(143,'00144550-3715-11ec-9544-e2f63b76507a',2,'Vend failure','Coin_Acceptor','114',1,0.2,'2021-10-27 13:19:31','2021-10-27 13:20:31'),(144,'e13a296a-3718-11ec-9544-e2f63b76507a',1,'Product received','Coin_Acceptor','115',1,0.2,'2021-10-27 13:47:18','2021-10-27 13:48:09'),(145,'b02e6d3a-371b-11ec-9544-e2f63b76507a',1,'Product received','Coin_Acceptor','104',3,0.2,'2021-10-27 14:07:24','2021-10-27 14:08:05'),(146,'d0188536-371b-11ec-9544-e2f63b76507a',1,'Product received','Coin_Acceptor','104',3,0.2,'2021-10-27 14:08:17','2021-10-27 14:08:57'),(147,'ec872f10-371b-11ec-9544-e2f63b76507a',1,'Product received','Coin_Acceptor','103',3,0.2,'2021-10-27 14:09:05','2021-10-27 14:09:42'),(148,'0884750b-371c-11ec-9544-e2f63b76507a',1,'Product received','Coin_Acceptor','105',3,0.2,'2021-10-27 14:09:52','2021-10-27 14:10:27'),(149,'21a7c937-371c-11ec-9544-e2f63b76507a',1,'Vend failure','Coin_Acceptor','105',3,0.2,'2021-10-27 14:10:34','2021-10-27 14:11:03'),(150,'40a73418-371c-11ec-9544-e2f63b76507a',1,'Vend failure','Coin_Acceptor','104',3,0.2,'2021-10-27 14:11:26','2021-10-27 14:11:57'),(151,'62e8de4f-371c-11ec-9544-e2f63b76507a',1,'Product received','Coin_Acceptor','102',3,0.2,'2021-10-27 14:12:24','2021-10-27 14:12:59'),(152,'7d6a8df3-371c-11ec-9544-e2f63b76507a',1,'Product received','Coin_Acceptor','102',3,0.2,'2021-10-27 14:13:08','2021-10-27 14:13:45'),(153,'9b4c62be-371c-11ec-9544-e2f63b76507a',1,'Vend failure','Coin_Acceptor','102',3,0.2,'2021-10-27 14:13:58','2021-10-27 14:14:28'),(154,'1ae8b28f-3720-11ec-94e0-e2f63b76507a',1,'Product received','Coin_Acceptor','102',3,0.2,'2021-10-27 14:22:21','2021-10-27 14:23:03'),(155,'4b33c971-3720-11ec-94e0-e2f63b76507a',1,'Product received','Coin_Acceptor','102',3,0.2,'2021-10-27 14:23:42','2021-10-27 14:24:17'),(156,'f70534c6-373b-11ec-94cc-e2f63b76507a',1,'Vend canceled','Coin_Acceptor','102',3,0.2,'2021-10-28 12:08:55','2021-10-28 12:09:05'),(157,'049e8385-373c-11ec-94cc-e2f63b76507a',1,'Product received','Coin_Acceptor','102',3,0.2,'2021-10-28 12:09:17','2021-10-28 12:09:53'),(158,'2a2d194b-373c-11ec-94cc-e2f63b76507a',1,'Product received','Coin_Acceptor','105',3,0.2,'2021-10-28 12:10:20','2021-10-28 12:10:51'),(159,'42ddd9a7-373c-11ec-94cc-e2f63b76507a',1,'Product received','Coin_Acceptor','104',3,0.2,'2021-10-28 12:11:02','2021-10-28 12:11:35'),(160,'5ba4030c-373c-11ec-94cc-e2f63b76507a',1,'Product received','Coin_Acceptor','105',3,0.2,'2021-10-28 12:11:43','2021-10-28 12:12:14'),(161,'72cc8ca4-373c-11ec-94cc-e2f63b76507a',1,'Product received','Coin_Acceptor','102',3,0.2,'2021-10-28 12:12:22','2021-10-28 12:12:50'),(162,'617eb1e8-38c1-11ec-94cd-e2f63b76507a',1,'Product received','Coin_Acceptor','114',1,0.2,'2021-11-04 08:56:45','2021-11-04 08:57:17'),(163,'4b2d178c-38cc-11ec-94cd-e2f63b76507a',1,'Product received','Coin_Acceptor','114',1,0.2,'2021-11-04 10:14:52','2021-11-04 10:15:22'),(164,'f0bcf8cf-4082-11ec-9635-e2f63b76507a',1,'Product received','Cashless_Terminal','102',3,0.2,'2021-11-08 12:00:19','2021-11-08 12:01:12'),(165,'30d4f92d-4083-11ec-9635-e2f63b76507a',1,'Product received','Cashless_Terminal','102',3,0.2,'2021-11-08 12:02:07','2021-11-08 12:02:57'),(166,'e1423a16-409f-11ec-95ed-e2f63b76507a',1,'Vend failure','Coin_Acceptor','206',1,0.2,'2021-11-09 14:56:31','2021-11-09 14:56:50'),(167,'fa06482b-409f-11ec-95ed-e2f63b76507a',1,'Vend failure','Coin_Acceptor','205',1,0.2,'2021-11-09 14:57:13','2021-11-09 14:57:27'),(168,'0ba1bc51-40a0-11ec-95ed-e2f63b76507a',1,'Vend failure','Coin_Acceptor','301',1,0.02,'2021-11-09 14:57:43','2021-11-09 14:58:16'),(169,'2cf418ad-40a0-11ec-95ed-e2f63b76507a',1,'Vend failure','Coin_Acceptor','304',1,0.02,'2021-11-09 14:58:38','2021-11-09 14:59:13'),(170,'2b0dfd81-4165-11ec-9558-e2f63b76507a',1,'Vend failure','Coin_Acceptor','301',1,0.2,'2021-11-09 15:01:30','2021-11-09 15:02:01'),(171,'452c26d4-4165-11ec-9558-e2f63b76507a',1,'Vend failure','Coin_Acceptor','201',1,0.2,'2021-11-09 15:02:14','2021-11-09 15:02:28'),(172,'59fc7ad7-4165-11ec-9558-e2f63b76507a',1,'Vend failure','Coin_Acceptor','302',1,0.2,'2021-11-09 15:02:49','2021-11-09 15:03:26'),(173,'84f00179-4165-11ec-9558-e2f63b76507a',1,'Vend failure','Coin_Acceptor','304',1,0.02,'2021-11-09 15:04:01','2021-11-09 15:04:38'),(174,'bb66aab6-4604-11ec-9427-e2f63b76507a',1,'Open','Code','102',3,0.2,'2021-11-15 12:34:50','2021-11-15 12:34:50'),(175,'69ae4a5b-4609-11ec-94ca-e2f63b76507a',1,'Product received','Coin_Acceptor','102',3,0.2,'2021-11-15 12:45:11','2021-11-15 12:45:45'),(176,'ae07b8b9-4609-11ec-94ca-e2f63b76507a',1,'Open','Code','102',3,0.2,'2021-11-15 12:47:05','2021-11-15 12:47:05'),(177,'fee8a518-4626-11ec-954b-e2f63b76507a',1,'Product received','Coin_Acceptor','132',1,0.2,'2021-11-16 08:10:56','2021-11-16 08:11:30'),(178,'fee8a518-4626-11ec-954b-e2f63b76507a',2,'Product received','Coin_Acceptor','132',1,0.2,'2021-11-16 08:10:56','2021-11-16 08:11:57'),(179,'76688628-46ad-11ec-9460-e2f63b76507a',1,'Vend failure','Coin_Acceptor','160',1,0.2,'2021-11-16 08:25:12','2021-11-16 08:25:17'),(180,'a6548c50-46ad-11ec-9460-e2f63b76507a',1,'Vend failure','Coin_Acceptor','163',5,0.2,'2021-11-16 08:26:33','2021-11-16 08:26:36'),(181,'d0d3f725-46ad-11ec-9460-e2f63b76507a',1,'Vend failure','Coin_Acceptor','166',5,0.2,'2021-11-16 08:27:44','2021-11-16 08:27:53'),(182,'772a4717-46ae-11ec-9460-e2f63b76507a',1,'Product received','Coin_Acceptor','131',1,0.2,'2021-11-16 08:32:23','2021-11-16 08:32:58'),(183,'9290ce9c-46ae-11ec-9460-e2f63b76507a',1,'Product received','Coin_Acceptor','121',1,0.2,'2021-11-16 08:33:09','2021-11-16 08:34:04'),(184,'c7a72732-46ae-11ec-9460-e2f63b76507a',1,'Product received','Coin_Acceptor','122',1,0.2,'2021-11-16 08:34:38','2021-11-16 08:35:11'),(185,'26d5d730-46b0-11ec-9460-e2f63b76507a',1,'Vend failure','Coin_Acceptor','164',1,0.2,'2021-11-16 08:44:27','2021-11-16 08:44:31'),(186,'315f8b52-46b0-11ec-9460-e2f63b76507a',1,'Vend failure','Coin_Acceptor','165',1,0.2,'2021-11-16 08:44:45','2021-11-16 08:44:53'),(187,'564b08c5-46b0-11ec-9460-e2f63b76507a',1,'Vend failure','Coin_Acceptor','163',1,0.2,'2021-11-16 08:45:47','2021-11-16 08:45:52'),(188,'651de9db-46b0-11ec-9460-e2f63b76507a',1,'Vend failure','Coin_Acceptor','161',1,0.2,'2021-11-16 08:46:12','2021-11-16 08:46:15'),(189,'ab13d4bf-46b0-11ec-94c0-e2f63b76507a',1,'Vend canceled','Coin_Acceptor','153',1,0.2,'2021-11-16 08:47:37','2021-11-16 08:47:39'),(190,'b4413b8a-46b0-11ec-94c0-e2f63b76507a',1,'Product received','Coin_Acceptor','153',1,0.2,'2021-11-16 08:47:52','2021-11-16 08:48:19'),(191,'dc5f7c5e-46b1-11ec-94c0-e2f63b76507a',1,'Product received','Coin_Acceptor','154',1,0.2,'2021-11-16 08:56:09','2021-11-16 08:56:33'),(192,'2fb007ec-46b2-11ec-94c0-e2f63b76507a',1,'Product received','Coin_Acceptor','153',1,0.2,'2021-11-16 08:58:29','2021-11-16 08:58:54'),(193,'4625ae43-46b2-11ec-94c0-e2f63b76507a',1,'Product received','Coin_Acceptor','156',1,0.2,'2021-11-16 08:59:06','2021-11-16 08:59:32'),(194,'8ff1ed3b-46b2-11ec-94c0-e2f63b76507a',1,'Product received','Coin_Acceptor','151',1,0.2,'2021-11-16 09:01:10','2021-11-16 09:01:36'),(195,'4bdb1a3e-46b3-11ec-94c0-e2f63b76507a',1,'Product received','Coin_Acceptor','151',1,0.2,'2021-11-16 09:06:26','2021-11-16 09:07:05'),(196,'cd7b3cbb-46b3-11ec-94c0-e2f63b76507a',1,'Vend failure','Coin_Acceptor','131',1,0.2,'2021-11-16 09:10:03','2021-11-16 09:10:09'),(197,'34a96337-46b4-11ec-951b-e2f63b76507a',1,'Vend failure','Coin_Acceptor','131',1,0.2,'2021-11-16 09:12:49','2021-11-16 09:13:06'),(198,'6d6dcf19-46b5-11ec-96c1-e2f63b76507a',1,'Product received','Coin_Acceptor','131',1,0.2,'2021-11-16 09:16:51','2021-11-16 09:17:20'),(199,'bb2d9273-46b5-11ec-96c1-e2f63b76507a',1,'Product received','Coin_Acceptor','131',1,0.2,'2021-11-16 09:19:01','2021-11-16 09:19:30'),(200,'d0f6adcf-46b5-11ec-96c1-e2f63b76507a',1,'Product received','Coin_Acceptor','121',1,0.2,'2021-11-16 09:19:38','2021-11-16 09:20:05'),(201,'e5916244-46b5-11ec-96c1-e2f63b76507a',1,'Vend failure','Coin_Acceptor','153',1,0.2,'2021-11-16 09:20:13','2021-11-16 09:20:15'),(202,'0d87798b-46b6-11ec-96c1-e2f63b76507a',1,'Payment approved','Coin_Acceptor','156',1,0.2,'2021-11-16 09:21:20','2021-11-16 09:21:22'),(203,'3d27e1e5-46b6-11ec-9628-e2f63b76507a',1,'Product received','Coin_Acceptor','156',1,0.2,'2021-11-16 09:23:07','2021-11-16 09:23:31'),(204,'5bd42dfb-46b6-11ec-9628-e2f63b76507a',1,'Product received','Coin_Acceptor','156',1,0.2,'2021-11-16 09:23:59','2021-11-16 09:24:25'),(205,'96112a69-46b6-11ec-9628-e2f63b76507a',1,'Product received','Coin_Acceptor','157',1,0.2,'2021-11-16 09:25:37','2021-11-16 09:26:06'),(206,'edbc33bf-46bb-11ec-9471-e2f63b76507a',1,'Product received','Cashless_Terminal','156',1,0.2,'2021-11-16 10:11:55','2021-11-16 10:12:30'),(207,'ade5b293-46cc-11ec-9471-e2f63b76507a',1,'Product received','Cashless_Terminal','122',1,0.2,'2021-11-16 12:11:49','2021-11-16 12:12:31'),(208,'ce7d675c-46ce-11ec-9471-e2f63b76507a',1,'Vend canceled','Cashless_Terminal','203',1,0.2,'2021-11-16 12:27:03','2021-11-16 12:27:21'),(209,'2ef9471e-46d2-11ec-9471-e2f63b76507a',1,'Vend failure','Cashless_Terminal','202',1,0.2,'2021-11-16 12:51:13','2021-11-16 12:51:35'),(210,'575c9487-46d2-11ec-9471-e2f63b76507a',1,'Vend failure','Cashless_Terminal','203',1,0.2,'2021-11-16 12:52:21','2021-11-16 12:52:43'),(211,'fa60bd7f-46d2-11ec-9471-e2f63b76507a',1,'Product received','Cashless_Terminal','101',20843,0.2,'2021-11-16 12:56:54','2021-11-16 12:57:47'),(212,'d25dc79b-46d5-11ec-9471-e2f63b76507a',1,'Vend failure','Cashless_Terminal','201',1,0.2,'2021-11-16 13:17:16','2021-11-16 13:17:39'),(213,'ee88501e-46d5-11ec-9471-e2f63b76507a',1,'Vend failure','Cashless_Terminal','205',1,0.2,'2021-11-16 13:18:03','2021-11-16 13:18:24'),(214,'0f139fa0-46d6-11ec-9471-e2f63b76507a',1,'Vend failure','Cashless_Terminal','204',1,0.2,'2021-11-16 13:18:58','2021-11-16 13:19:19'),(215,'2902af1c-46d6-11ec-9471-e2f63b76507a',1,'Vend failure','Cashless_Terminal','206',1,0.2,'2021-11-16 13:19:41','2021-11-16 13:20:02'),(216,'063f35af-46d7-11ec-9471-e2f63b76507a',1,'Vend failure','Cashless_Terminal','208',1,0.2,'2021-11-16 13:25:52','2021-11-16 13:26:13'),(217,'6d836745-46d8-11ec-94b1-e2f63b76507a',1,'Vend failure','Cashless_Terminal','209',1,0.2,'2021-11-16 13:28:07','2021-11-16 13:28:29'),(218,'a6a241fa-46d8-11ec-94b1-e2f63b76507a',1,'Payment approved','Cashless_Terminal','201',1,0.2,'2021-11-16 13:29:43','2021-11-16 13:29:56'),(219,'eb5e9bc4-46d8-11ec-94db-e2f63b76507a',1,'Vend canceled','Cashless_Terminal','208',1,0.2,'2021-11-16 13:31:48','2021-11-16 13:31:51'),(220,'fa0d6ce1-46d8-11ec-94db-e2f63b76507a',1,'Vend failure','Cashless_Terminal','101',20843,0.2,'2021-11-16 13:32:13','2021-11-16 13:32:54'),(221,'20c7c836-46d9-11ec-94db-e2f63b76507a',1,'Vend canceled','Cashless_Terminal','103',3,0.2,'2021-11-16 13:33:18','2021-11-16 13:33:27'),(222,'9b52b19d-46d9-11ec-95a6-e2f63b76507a',1,'Vend canceled','Cashless_Terminal','101',20843,0.2,'2021-11-16 13:37:19','2021-11-16 13:37:23'),(223,'a96bcc7e-46d9-11ec-95a6-e2f63b76507a',1,'Vend canceled','Cashless_Terminal','101',20843,0.2,'2021-11-16 13:37:43','2021-11-16 13:37:43'),(224,'ad7560ba-46d9-11ec-95a6-e2f63b76507a',1,'Vend canceled','Cashless_Terminal','101',20843,0.2,'2021-11-16 13:37:49','2021-11-16 13:37:53'),(225,'b3e2b36e-46d9-11ec-95a6-e2f63b76507a',1,'Vend canceled','Cashless_Terminal','101',20843,0.2,'2021-11-16 13:38:00','2021-11-16 13:38:03'),(226,'bac24890-46d9-11ec-95a6-e2f63b76507a',1,'Vend canceled','Cashless_Terminal','101',20843,0.2,'2021-11-16 13:38:12','2021-11-16 13:38:13'),(227,'c5370624-46d9-11ec-95a6-e2f63b76507a',1,'Vend canceled','Cashless_Terminal','101',20843,0.2,'2021-11-16 13:38:29','2021-11-16 13:38:33'),(228,'e84f9e86-46d9-11ec-95a6-e2f63b76507a',1,'Vend canceled','Cashless_Terminal','201',1,0.2,'2021-11-16 13:39:28','2021-11-16 13:39:33'),(229,'f8fa5bbc-46d9-11ec-95a6-e2f63b76507a',1,'Vend failure','Cashless_Terminal','301',1,0.02,'2021-11-16 13:39:56','2021-11-16 13:40:37'),(230,'1138d880-46eb-11ec-95a6-e2f63b76507a',1,'Vend failure','Cashless_Terminal','156',1,0.2,'2021-11-16 15:42:18','2021-11-16 15:42:47'),(231,'e8bdda02-46ff-11ec-949d-e2f63b76507a',1,'Vend failure','Coin_Acceptor','111',21093,0.2,'2021-11-18 14:38:55','2021-11-18 14:39:18'),(232,'56d098b4-4936-11ec-94a2-e2f63b76507a',1,'Open','Code','102',10781,1,'2021-11-19 13:48:15','2021-11-19 13:48:15'),(233,'ca5a964f-4936-11ec-94a2-e2f63b76507a',1,'Product received','Code','122',1,0.2,'2021-11-19 13:51:29','2021-11-19 13:51:57'),(234,'edea2a69-4936-11ec-94a2-e2f63b76507a',1,'Open','Code','124',1,0.2,'2021-11-19 13:52:28','2021-11-19 13:52:28'),(235,'fabf1352-4936-11ec-94a2-e2f63b76507a',1,'Product received','Code','124',1,0.2,'2021-11-19 13:52:50','2021-11-19 13:53:17'),(236,'6d202076-494a-11ec-94cf-e2f63b76507a',1,'Vend denied','Cashless_Terminal','132',1,0.2,'2021-11-22 08:40:33','2021-11-22 08:41:09'),(237,'8fdd636e-494a-11ec-94cf-e2f63b76507a',1,'Vend denied','Cashless_Terminal','132',1,0.2,'2021-11-22 08:41:31','2021-11-22 08:42:07'),(238,'b1e5ad54-494a-11ec-94cf-e2f63b76507a',1,'Vend denied','Cashless_Terminal','132',1,0.2,'2021-11-22 08:42:29','2021-11-22 08:43:05'),(239,'e38421ab-494a-11ec-94cf-e2f63b76507a',1,'Vend denied','Cashless_Terminal','102',10781,1,'2021-11-22 08:43:52','2021-11-22 08:44:28'),(240,'17ce9fb3-494b-11ec-94cf-e2f63b76507a',1,'Product received','Cashless_Terminal','135',1,0.2,'2021-11-22 08:45:19','2021-11-22 08:46:19'),(241,'4fe285bc-494b-11ec-94cf-e2f63b76507a',1,'Product received','Cashless_Terminal','132',1,0.2,'2021-11-22 08:46:54','2021-11-22 08:47:12'),(242,'674b4c58-494b-11ec-94cf-e2f63b76507a',1,'Product received','Cashless_Terminal','135',1,0.2,'2021-11-22 08:47:33','2021-11-22 08:47:49'),(243,'fd065881-4b68-11ec-9572-e2f63b76507a',1,'Product received','Cashless_Terminal','122',1,0.2,'2021-11-22 09:05:13','2021-11-22 09:06:03'),(244,'5febd32b-4b87-11ec-9464-e2f63b76507a',1,'Product received','Cashless_Terminal','114',1,0.2,'2021-11-22 12:40:24','2021-11-22 12:41:08'),(245,'b1cca833-4ba4-11ec-9489-e2f63b76507a',1,'Product received','Cashless_Terminal','113',1,0.2,'2021-11-24 08:47:26','2021-11-24 08:48:08'),(246,'50f43d84-4baf-11ec-9489-e2f63b76507a',1,'Product received','Coin_Acceptor','125',1,0.2,'2021-11-24 10:03:28','2021-11-24 10:03:58'),(247,'a25eef53-4d28-11ec-9506-e2f63b76507a',1,'Product received','Coin_Acceptor','125',1,0.2,'2021-11-24 14:24:45','2021-11-24 14:25:15'),(248,'b7b913dd-4d29-11ec-9506-e2f63b76507a',1,'Product received','Coin_Acceptor','105',3,0.2,'2021-11-24 14:32:30','2021-11-24 14:33:02'),(249,'f393b482-4d2a-11ec-9506-e2f63b76507a',1,'Vend failure','Coin_Acceptor','202',1,0.2,'2021-11-24 14:41:20','2021-11-24 14:41:43'),(250,'1cd45acf-4d2b-11ec-9506-e2f63b76507a',1,'Vend failure','Coin_Acceptor','201',1,0.2,'2021-11-24 14:42:29','2021-11-24 14:42:50'),(251,'a6696388-4d32-11ec-9430-e2f63b76507a',1,'Vend canceled','Coin_Acceptor','125',1,0.2,'2021-11-25 12:39:34','2021-11-25 12:39:36'),(252,'d5bd24cb-4d35-11ec-9430-e2f63b76507a',1,'Product received','Coin_Acceptor','125',1,0.2,'2021-11-25 13:02:22','2021-11-25 13:03:01'),(253,'80d1a906-4d36-11ec-9430-e2f63b76507a',1,'Product received','Coin_Acceptor','125',1,0.2,'2021-11-25 13:07:09','2021-11-25 13:07:45'),(254,'cba7c556-4e15-11ec-94e3-e2f63b76507a',1,'Product received','Cashless_Terminal','111',21093,0.2,'2021-11-26 11:17:44','2021-11-26 11:18:28'),(255,'eb3e7043-4e15-11ec-94e3-e2f63b76507a',1,'Product received','Cashless_Terminal','125',1,0.2,'2021-11-26 11:18:37','2021-11-26 11:19:14'),(256,'191ec57f-50f1-11ec-94f9-e2f63b76507a',1,'Vend canceled','Cashless_Terminal','115',1,0.2,'2021-11-29 09:55:13','2021-11-29 09:55:34'),(257,'5f145958-50f1-11ec-94f9-e2f63b76507a',1,'Vend denied','Cashless_Terminal','115',1,0.2,'2021-11-29 09:57:10','2021-11-29 09:57:46'),(258,'f6f17fa0-50f2-11ec-94f9-e2f63b76507a',1,'Vend denied','Cashless_Terminal','115',1,0.2,'2021-11-29 10:08:34','2021-11-29 10:09:11'),(259,'53765e63-510c-11ec-94f9-e2f63b76507a',1,'Vend canceled','Cashless_Terminal','115',1,0.2,'2021-11-29 13:10:07','2021-11-29 13:11:03'),(260,'7dc28333-510c-11ec-94f9-e2f63b76507a',1,'Product received','Cashless_Terminal','116',1,0.2,'2021-11-29 13:11:18','2021-11-29 13:12:09'),(261,'31743739-5120-11ec-9619-e2f63b76507a',1,'Vend denied','Cashless_Terminal','115',1,0.2,'2021-11-29 15:27:11','2021-11-29 15:27:46'),(262,'4ee9100a-5120-11ec-9619-e2f63b76507a',1,'Vend canceled','Cashless_Terminal','115',1,0.2,'2021-11-29 15:28:01','2021-11-29 15:28:08'),(263,'e2e39388-5124-11ec-9530-e2f63b76507a',1,'Vend denied','Cashless_Terminal','115',1,0.2,'2021-11-30 09:55:30','2021-11-30 09:56:07'),(264,'78243087-51c4-11ec-94a5-e2f63b76507a',1,'Product received','Cashless_Terminal','115',1,0.2,'2021-11-30 11:02:09','2021-11-30 11:02:55'),(265,'34848453-51da-11ec-9561-e2f63b76507a',1,'Vend canceled','Cashless_Terminal','115',1,0.2,'2021-11-30 13:45:45','2021-11-30 13:45:58'),(266,'48b82641-51da-11ec-9561-e2f63b76507a',1,'Vend denied','Cashless_Terminal','115',1,0.2,'2021-11-30 13:46:19','2021-11-30 13:46:53'),(267,'8f4eaff7-5279-11ec-95a5-e2f63b76507a',1,'Vend denied','Cashless_Terminal','113',1,0.2,'2021-12-01 08:39:04','2021-12-01 08:39:55'),(268,'1fa67889-5282-11ec-95d6-e2f63b76507a',1,'Product received','Coin_Acceptor','114',1,0.2,'2021-12-01 09:41:46','2021-12-01 09:42:15'),(269,'7500b658-5282-11ec-95d6-e2f63b76507a',1,'Product received','Coin_Acceptor','113',1,0.2,'2021-12-01 09:44:09','2021-12-01 09:44:39'),(270,'a6e3486a-5284-11ec-95d6-e2f63b76507a',1,'Open','Cashless_Terminal','112',1,0.2,'2021-12-01 09:59:51','2021-12-01 09:59:51'),(271,'89d284cc-5287-11ec-9619-e2f63b76507a',1,'Vend denied','Cashless_Terminal','114',1,0.2,'2021-12-01 10:18:54','2021-12-01 10:19:28'),(272,'a7467b5c-5287-11ec-9619-e2f63b76507a',1,'Vend canceled','Cashless_Terminal','114',1,0.2,'2021-12-01 10:19:43','2021-12-01 10:20:00'),(273,'beeb728a-5287-11ec-9619-e2f63b76507a',1,'Vend canceled','Cashless_Terminal','101',10781,1,'2021-12-01 10:20:23','2021-12-01 10:20:30'),(274,'94cf38f4-5288-11ec-9619-e2f63b76507a',1,'Vend canceled','Cashless_Terminal','101',10781,2.2,'2021-12-01 10:26:22','2021-12-01 10:26:35'),(275,'a9014972-5288-11ec-9619-e2f63b76507a',1,'Vend canceled','Cashless_Terminal','102',10781,1,'2021-12-01 10:26:56','2021-12-01 10:27:04'),(276,'dda411cb-5288-11ec-9619-e2f63b76507a',1,'Vend canceled','Cashless_Terminal','101',10781,2.2,'2021-12-01 10:28:24','2021-12-01 10:28:31'),(277,'f4066ef3-5288-11ec-9619-e2f63b76507a',1,'Vend canceled','Cashless_Terminal','101',10781,2.2,'2021-12-01 10:29:02','2021-12-01 10:29:10'),(278,'01333f41-5289-11ec-9619-e2f63b76507a',1,'Vend canceled','Cashless_Terminal','115',1,0.2,'2021-12-01 10:29:24','2021-12-01 10:29:31'),(279,'0d8df78e-5289-11ec-9619-e2f63b76507a',1,'Vend canceled','Cashless_Terminal','101',10781,2.2,'2021-12-01 10:29:45','2021-12-01 10:29:51'),(280,'1a6ca565-5289-11ec-9619-e2f63b76507a',1,'Vend canceled','Cashless_Terminal','102',10781,1,'2021-12-01 10:30:06','2021-12-01 10:30:12'),(281,'e6dd4fa2-528e-11ec-948a-e2f63b76507a',1,'Vend denied','Cashless_Terminal','111',21093,0.2,'2021-12-01 11:16:45','2021-12-01 11:17:00'),(282,'55550542-529a-11ec-948a-e2f63b76507a',1,'Product received','Cashless_Terminal','112',1,0.2,'2021-12-01 12:38:35','2021-12-01 12:39:15'),(283,'9ab25e08-52b7-11ec-948a-e2f63b76507a',1,'Vend denied','Cashless_Terminal','115',1,0.2,'2021-12-01 16:08:06','2021-12-01 16:08:55'),(284,'cf7cc00e-535c-11ec-94e6-e2f63b76507a',1,'Product received','Cashless_Terminal','115',1,0.2,'2021-12-02 11:52:59','2021-12-02 11:53:36'),(285,'83046755-537f-11ec-94e6-e2f63b76507a',1,'Product received','Cashless_Terminal','124',1,0.2,'2021-12-02 16:01:23','2021-12-02 16:02:02'),(286,'a16bcc99-537f-11ec-94e6-e2f63b76507a',1,'Product received','Cashless_Terminal','116',1,0.2,'2021-12-02 16:02:14','2021-12-02 16:03:22'),(287,'62876e4c-540d-11ec-94f8-e2f63b76507a',1,'Product received','Coin_Acceptor','114',1,0.2,'2021-12-03 14:10:45','2021-12-03 14:11:29'),(288,'62876e4c-540d-11ec-94f8-e2f63b76507a',2,'Product received','Coin_Acceptor','118',1,0.2,'2021-12-03 14:10:45','2021-12-03 14:12:00'),(289,'31023d0d-5410-11ec-94f8-e2f63b76507a',1,'Vend success','Coin_Acceptor','111',21093,0.2,'2021-12-03 14:30:51','2021-12-03 14:31:41'),(290,'8021f284-543d-11ec-94df-e2f63b76507a',1,'Vend canceled','Coin_Acceptor','111',21093,0.2,'2021-12-03 14:33:50','2021-12-03 14:33:50'),(291,'85911990-543d-11ec-94df-e2f63b76507a',1,'Vend success','Coin_Acceptor','111',21093,0.2,'2021-12-03 14:33:59','2021-12-03 14:34:11'),(292,'f32b6fa2-543d-11ec-9611-e2f63b76507a',1,'Vend canceled','Coin_Acceptor','114',1,0.2,'2021-12-03 14:36:54','2021-12-03 14:38:27'),(293,'f32b6fa2-543d-11ec-9611-e2f63b76507a',2,'Vend canceled','Coin_Acceptor','115',1,0.2,'2021-12-03 14:36:54','2021-12-03 14:38:27'),(294,'98512330-543e-11ec-9611-e2f63b76507a',1,'Vend success','Coin_Acceptor','114',1,0.2,'2021-12-03 14:41:31','2021-12-03 14:41:42'),(295,'98512330-543e-11ec-9611-e2f63b76507a',2,'Open','Coin_Acceptor','115',1,0.2,'2021-12-03 14:41:31','2021-12-03 14:41:31'),(296,'6b85ea44-5440-11ec-9520-e2f63b76507a',1,'Product received','Coin_Acceptor','114',1,0.2,'2021-12-03 14:55:22','2021-12-03 14:56:39'),(297,'c8c3304c-5440-11ec-9520-e2f63b76507a',2,'Vend canceled','Coin_Acceptor','115',1,0.2,'2021-12-03 14:57:58','2021-12-03 14:58:06'),(298,'c8c3304c-5440-11ec-9520-e2f63b76507a',1,'Vend canceled','Coin_Acceptor','115',1,0.2,'2021-12-03 14:57:58','2021-12-03 14:58:06'),(299,'d6706988-5440-11ec-9520-e2f63b76507a',1,'Product received','Coin_Acceptor','115',1,0.2,'2021-12-03 14:58:21','2021-12-03 14:58:52'),(300,'97c04433-5448-11ec-95a7-e2f63b76507a',1,'Product received','Cashless_Terminal','112',1,0.2,'2021-12-07 09:26:48','2021-12-07 09:27:26'),(301,'b6a47c3f-5448-11ec-95a7-e2f63b76507a',1,'Product received','Cashless_Terminal','135',1,0.2,'2021-12-07 09:27:40','2021-12-07 09:28:13'),(302,'b8849868-5753-11ec-93e7-e2f63b76507a',1,'Vend failure','Coin_Acceptor','114',1,0.2,'2021-12-07 12:56:19','2021-12-07 12:57:52'),(303,'ff76ec91-5753-11ec-93e7-e2f63b76507a',1,'Product received','Coin_Acceptor','113',1,0.2,'2021-12-07 12:58:18','2021-12-07 12:59:20'),(304,'52a5cb78-5754-11ec-93e7-e2f63b76507a',1,'Vend failure','Coin_Acceptor','111',21093,0.2,'2021-12-07 13:00:38','2021-12-07 13:02:09'),(305,'8c6b77bc-5756-11ec-93e7-e2f63b76507a',1,'Vend failure','Coin_Acceptor','115',1,0.2,'2021-12-07 13:16:34','2021-12-07 13:18:07'),(306,'da822ff9-5756-11ec-93e7-e2f63b76507a',1,'Vend failure','Coin_Acceptor','112',1,0.2,'2021-12-07 13:18:45','2021-12-07 13:20:17'),(307,'7ac5786f-5757-11ec-93e7-e2f63b76507a',1,'Product received','Coin_Acceptor','117',1,0.2,'2021-12-07 13:23:13','2021-12-07 13:23:49'),(308,'e0582342-5757-11ec-93e7-e2f63b76507a',1,'Vend failure','Coin_Acceptor','117',1,0.2,'2021-12-07 13:26:04','2021-12-07 13:27:36'),(309,'57357bec-5758-11ec-93e7-e2f63b76507a',1,'Vend failure','Coin_Acceptor','119',1,0.2,'2021-12-07 13:29:23','2021-12-07 13:30:56'),(310,'30387d56-575a-11ec-93e7-e2f63b76507a',1,'Vend canceled','Coin_Acceptor','121',1,0.2,'2021-12-07 13:42:37','2021-12-07 13:42:40'),(311,'39c565f9-575a-11ec-93e7-e2f63b76507a',1,'Vend failure','Coin_Acceptor','121',1,0.2,'2021-12-07 13:42:53','2021-12-07 13:44:27'),(312,'7e4e6261-575a-11ec-93e7-e2f63b76507a',1,'Vend canceled','Coin_Acceptor','122',1,0.2,'2021-12-07 13:44:48','2021-12-07 13:44:50'),(313,'95b6ac24-575a-11ec-93e7-e2f63b76507a',1,'Vend failure','Coin_Acceptor','122',1,0.2,'2021-12-07 13:45:27','2021-12-07 13:46:57'),(314,'d6437b39-575a-11ec-93e7-e2f63b76507a',1,'Product received','Coin_Acceptor','123',1,0.2,'2021-12-07 13:47:15','2021-12-07 13:47:44'),(315,'8eef6a2e-575b-11ec-93e7-e2f63b76507a',1,'Vend canceled','Coin_Acceptor','123',1,0.2,'2021-12-07 13:52:25','2021-12-07 13:52:26'),(316,'984d3ac4-575b-11ec-93e7-e2f63b76507a',1,'Vend failure','Coin_Acceptor','123',1,0.2,'2021-12-07 13:52:41','2021-12-07 13:54:14'),(317,'9ea6bf04-575c-11ec-93e7-e2f63b76507a',1,'Open','Coin_Acceptor','124',1,0.2,'2021-12-07 14:00:01','2021-12-07 14:00:01'),(318,'d47dbf22-575c-11ec-9511-e2f63b76507a',1,'Vend canceled','Coin_Acceptor','122',1,0.2,'2021-12-07 14:03:12','2021-12-07 14:03:14'),(319,'0ed0b359-5764-11ec-954a-e2f63b76507a',1,'Product received','Coin_Acceptor','114',1,0.2,'2021-12-07 14:46:44','2021-12-07 14:47:12'),(320,'363fcdaa-5764-11ec-954a-e2f63b76507a',1,'Product received','Coin_Acceptor','122',1,0.2,'2021-12-07 14:47:50','2021-12-07 14:48:20'),(321,'8f809385-5764-11ec-954a-e2f63b76507a',1,'Product received','Coin_Acceptor','121',1,0.2,'2021-12-07 14:50:19','2021-12-07 14:50:49'),(322,'8c249765-5765-11ec-954a-e2f63b76507a',1,'Payment approved','Coin_Acceptor','122',1,0.2,'2021-12-07 14:57:23','2021-12-07 14:57:27'),(323,'3208748b-5765-11ec-9402-e2f63b76507a',1,'Product received','Coin_Acceptor','122',1,0.2,'2021-12-07 14:59:14','2021-12-07 14:59:40'),(324,'485cd70c-5765-11ec-9402-e2f63b76507a',1,'Product received','Coin_Acceptor','112',1,0.2,'2021-12-07 14:59:51','2021-12-07 15:00:19'),(325,'9f1086f7-576e-11ec-94c0-e2f63b76507a',1,'Vend denied','Cashless_Terminal','115',1,0.2,'2021-12-07 16:03:29','2021-12-07 16:03:35'),(326,'ab1f1e6c-576e-11ec-94c0-e2f63b76507a',1,'Vend denied','Cashless_Terminal','116',1,0.2,'2021-12-07 16:03:49','2021-12-07 16:03:54'),(327,'e5f5a863-576d-11ec-9428-e2f63b76507a',1,'Product received','Coin_Acceptor','112',1,0.2,'2021-12-08 07:13:29','2021-12-08 07:14:42'),(328,'611da2cd-576e-11ec-9428-e2f63b76507a',1,'Product received','Coin_Acceptor','112',1,0.2,'2021-12-08 07:16:56','2021-12-08 07:17:28'),(329,'13daf256-5772-11ec-9428-e2f63b76507a',1,'Product received','Coin_Acceptor','115',1,0.2,'2021-12-08 07:43:24','2021-12-08 07:44:02'),(330,'caa26760-5773-11ec-9428-e2f63b76507a',1,'Vend denied','Cashless_Terminal','115',1,0.2,'2021-12-08 07:55:40','2021-12-08 07:55:46'),(331,'cc86098b-5780-11ec-9428-e2f63b76507a',1,'Product received','Coin_Acceptor','125',1,0.2,'2021-12-08 09:28:47','2021-12-08 09:30:00'),(332,'7b8be1cf-5834-11ec-95d7-e2f63b76507a',1,'Product received','Cashless_Terminal','115',1,0.2,'2021-12-09 08:57:12','2021-12-09 08:57:52'),(333,'99851436-5834-11ec-95d7-e2f63b76507a',1,'Product received','Cashless_Terminal','135',1,0.2,'2021-12-09 08:58:02','2021-12-09 08:58:40'),(334,'a1c4f8dd-5837-11ec-95d7-e2f63b76507a',1,'Vend canceled','Coin_Acceptor','101',10781,1,'2021-12-09 09:19:45','2021-12-09 09:19:51'),(335,'5b7b0583-584f-11ec-95d7-e2f63b76507a',1,'Product received','Coin_Acceptor','116',1,0.2,'2021-12-09 12:09:35','2021-12-09 12:10:01'),(336,'31864c11-585a-11ec-95d7-e2f63b76507a',1,'Open','Coin_Acceptor','126',1,0.2,'2021-12-09 13:27:09','2021-12-09 13:27:09'),(337,'70ebc57a-58eb-11ec-9463-e2f63b76507a',1,'Product received','Coin_Acceptor','126',1,0.2,'2021-12-09 13:29:26','2021-12-09 13:29:53'),(338,'0173c9d1-58f4-11ec-9433-e2f63b76507a',1,'Vend canceled','Coin_Acceptor','126',1,0.2,'2021-12-09 14:36:12','2021-12-09 14:36:13'),(339,'659f8279-58f5-11ec-955d-e2f63b76507a',1,'Payment approved','Coin_Acceptor','126',1,0.2,'2021-12-09 14:39:40','2021-12-09 14:39:43'),(340,'b7775030-58f5-11ec-94ab-e2f63b76507a',1,'Product received','Coin_Acceptor','125',1,0.2,'2021-12-09 14:41:58','2021-12-09 14:42:27'),(341,'fc36f3ac-5911-11ec-9597-e2f63b76507a',1,'Vend success','Cashless_Terminal','114',1,0.2,'2021-12-10 08:33:29','2021-12-10 08:34:00'),(342,'44b55663-5bf2-11ec-94cf-e2f63b76507a',1,'Product received','Cashless_Terminal','115',1,0.2,'2021-12-13 09:55:53','2021-12-13 09:56:34'),(343,'eec800f6-5c06-11ec-95e2-e2f63b76507a',1,'Product received','Coin_Acceptor','111',21093,0.2,'2021-12-15 08:47:04','2021-12-15 08:47:35'),(344,'25de4c56-5d81-11ec-9438-e2f63b76507a',1,'Vend canceled','Coin_Acceptor','111',21093,0.2,'2021-12-15 09:29:54','2021-12-15 09:30:01'),(345,'e700e095-5d80-11ec-93a9-e2f63b76507a',1,'Vend denied','Coin_Acceptor','111',21093,0.2,'2021-12-15 09:31:43','2021-12-15 09:32:04'),(346,'7f1a5f9e-bbc9-11ec-9603-e2f63b76507a',1,'Product received','Coin_Acceptor','9',1,0.2,'2022-04-14 10:05:10','2022-04-14 10:05:48'),(347,'565b8b9f-bbcb-11ec-9603-e2f63b76507a',1,'Vend canceled','Coin_Acceptor','9',1,0.2,'2022-04-14 10:18:20','2022-04-14 10:18:24'),(348,'6470d194-bbcb-11ec-9603-e2f63b76507a',1,'Product received','Coin_Acceptor','9',1,0.2,'2022-04-14 10:18:44','2022-04-14 10:19:29'),(349,'c593c1d8-bbcb-11ec-9443-e2f63b76507a',1,'Vend failure','Coin_Acceptor','111',21093,0.2,'2022-04-14 10:24:50','2022-04-14 10:26:23'),(350,'0f7e0899-bbcc-11ec-9443-e2f63b76507a',1,'Product received','Coin_Acceptor','9',1,0.2,'2022-04-14 10:26:54','2022-04-14 10:27:34'),(351,'daeee801-bbcd-11ec-93aa-e2f63b76507a',1,'Vend canceled','Coin_Acceptor','9',1,0.2,'2022-04-14 10:39:37','2022-04-14 10:39:46'),(352,'13e262b4-bbce-11ec-93aa-e2f63b76507a',1,'Vend failure','Coin_Acceptor','9',1,0.2,'2022-04-14 10:41:13','2022-04-14 10:42:12'),(353,'47c0b34f-bbd1-11ec-9589-e2f63b76507a',1,'Vend failure','Coin_Acceptor','111',21093,0.2,'2022-04-14 11:01:58','2022-04-14 11:02:37'),(354,'8138905f-bbd1-11ec-9589-e2f63b76507a',1,'Product received','Coin_Acceptor','9',1,0.2,'2022-04-14 11:03:34','2022-04-14 11:04:14'),(355,'bf2d2436-bbd2-11ec-9589-e2f63b76507a',1,'Vend failure','Coin_Acceptor','9',1,0.2,'2022-04-14 11:12:28','2022-04-14 11:13:11'),(356,'eddce210-bbd2-11ec-9589-e2f63b76507a',1,'Product received','Coin_Acceptor','112',1,0.2,'2022-04-14 11:13:46','2022-04-14 11:14:20'),(357,'133bf915-bbd3-11ec-9589-e2f63b76507a',1,'Vend failure','Coin_Acceptor','112',1,0.2,'2022-04-14 11:14:49','2022-04-14 11:16:18'),(358,'d1bd92c6-bbd7-11ec-967c-e2f63b76507a',1,'Product received','Coin_Acceptor','1',1,0.2,'2022-04-14 11:57:29','2022-04-14 11:58:24'),(359,'00d4fee7-bbd8-11ec-967c-e2f63b76507a',1,'Vend failure','Coin_Acceptor','3',1,0.2,'2022-04-14 11:58:48','2022-04-14 11:59:27');
/*!40000 ALTER TABLE `tblTransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblTranslation`
--

DROP TABLE IF EXISTS `tblTranslation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblTranslation` (
  `Key` varchar(1000) CHARACTER SET utf8 NOT NULL,
  `Translation` varchar(2000) CHARACTER SET utf8 NOT NULL,
  `LanguageCode` varchar(20) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`Key`,`LanguageCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblTranslation`
--

LOCK TABLES `tblTranslation` WRITE;
/*!40000 ALTER TABLE `tblTranslation` DISABLE KEYS */;
INSERT INTO `tblTranslation` VALUES ('Anulowanie transakcji','Canceling transaction','EN'),('Anulowanie transakcji','Anulowanie transakcji','PL'),('Anulowanie transakcji','Скасування трансакції','UA'),('Anuluj','Cancel','EN'),('Anuluj','Anuluj','PL'),('Anuluj','Скасувати','UA'),('Automat nie wydaje reszty.','The machine does not return change.','EN'),('Automat nie wydaje reszty.','Automat nie wydaje reszty.','PL'),('Automat nie wydaje reszty.','Машина не віддає решти.','UA'),('Automat nieczynny','Machine out of order','EN'),('Automat nieczynny','Automat nieczynny','PL'),('Automat nieczynny','Машина вийшла з ладу','UA'),('BLIK','BLIK','EN'),('BLIK','BLIK','PL'),('Chemia, higiena','Cosmetics and Hygene','EN'),('Chemia, higiena','Chemia, higiena','PL'),('Chemia, higiena','Хімія та гігієна','UA'),('Chipsy i orzeszki','Chips','EN'),('Chipsy i orzeszki','Chipsy i orzeszki','PL'),('Chipsy i orzeszki','Чіпси та горішки','UA'),('Cofnij','Undo','EN'),('Cofnij','Cofnij','PL'),('Cofnij','Назад','UA'),('Dania gotowe','Ready Meals','EN'),('Dania gotowe','Dania gotowe','PL'),('Dania gotowe','Готові страви','UA'),('Dodaj do koszyka','Add','EN'),('Dodaj do koszyka','Dodaj do koszyka','PL'),('Dodaj do koszyka','Вибрати','UA'),('Dziękujemy i zapraszamy ponownie','Thank you','EN'),('Dziękujemy i zapraszamy ponownie','Dziękujemy i zapraszamy ponownie','PL'),('Dziękujemy i zapraszamy ponownie','Дякуэмо','UA'),('Energetyki','Energy drinks','EN'),('Energetyki','Energetyki','PL'),('Energetyki','Енергетичні напої','UA'),('Energetyki izotoniki','Isotonic and Energy Drinks','EN'),('Energetyki izotoniki','Energetyki izotoniki','PL'),('Energetyki izotoniki','енергетичні та ізотонічні напої','UA'),('Energetyki, izotoniki','Energetyki, izotoniki','PL'),('Halo, jest tam kto? Dotknij, aby potwierdzić. Zawartość koszyka zostanie usunięta za','Anybody here? Tap the screen to confirm. The cart will reset in','EN'),('Halo, jest tam kto? Dotknij, aby potwierdzić. Zawartość koszyka zostanie usunięta za','Halo, jest tam kto? Dotknij, aby potwierdzić. Zawartość koszyka zostanie usunięta za','PL'),('Halo, jest tam kto? Dotknij, aby potwierdzić. Zawartość koszyka zostanie usunięta za','Привіт, хтось там? Торкніться, щоб підтвердити. Вміст кошика буде видалено в','UA'),('i poczekaj na pozostałe','and wait for the rest','EN'),('i poczekaj na pozostałe','i poczekaj na pozostałe','PL'),('i poczekaj na pozostałe','і чекайте інших','UA'),('i resztę','and change','EN'),('i resztę','i resztę','PL'),('i resztę','та решту','UA'),('Inne','Others','EN'),('Inne','Inne','PL'),('Inne','Інші','UA'),('Instanty','Instants','EN'),('Instanty','Instanty','PL'),('Instanty','Локшина швидкого приготування','UA'),('Jogurty','Yoghurts','EN'),('Jogurty','Jogurty','PL'),('Jogurty','йогурти','UA'),('Kanapki','Sandwiches','EN'),('Kanapki','Kanapki','PL'),('Kanapki','Бутерброди','UA'),('Karta odrzucona. Spróbuj ponownie.','Card rejected. Try again.','EN'),('Karta odrzucona. Spróbuj ponownie.','Karta odrzucona. Spróbuj ponownie.','PL'),('Karta odrzucona. Spróbuj ponownie.','Картку відхилено. Спробуйте ще раз.','UA'),('Karta zblizeniowa','Card','EN'),('Karta zblizeniowa','Karta zblizeniowa','PL'),('Kategorie','Categories','EN'),('Kategorie','Kategorie','PL'),('Kategorie','Категорії','UA'),('Kawy, herbaty','Tea and Coffee','EN'),('Kawy, herbaty','Kawy, herbaty','PL'),('Kawy, herbaty','Кава та чай','UA'),('Klawiatura','Numpad','EN'),('Klawiatura','Klawiatura','PL'),('Klawiatura','Клавіатура','UA'),('Klucz odrzucony. Spróbuj ponownie.','Token rejected. Try again.','EN'),('Klucz odrzucony. Spróbuj ponownie.','Klucz odrzucony. Spróbuj ponownie.','PL'),('Klucz odrzucony. Spróbuj ponownie.','Ключ відхилено. Спробуйте ще раз.','UA'),('Kod BLIK poprawny','BLIK code correct','EN'),('Kod BLIK poprawny','Kod BLIK poprawny','PL'),('Kod BLIK poprawny','Код BLIK правильний','UA'),('Konserwy i przetwory','Canned and jarred foods','EN'),('Konserwy i przetwory','Konserwy i przetwory','PL'),('Konserwy i przetwory','Консерви','UA'),('Kontynuuj zakupy','Continue shopping','EN'),('Kontynuuj zakupy','Kontynuuj zakupy','PL'),('Kontynuuj zakupy','Продовжити покупки','UA'),('Kosmetyki','Cosmetics','EN'),('Kosmetyki','Kosmetyki','PL'),('Kosmetyki','Косметика','UA'),('Koszyk jest pełny','Cart is full','EN'),('Koszyk jest pełny','Koszyk jest pełny','PL'),('Koszyk jest pełny','Кошик повний','UA'),('Koszyk pełny','Cart full','EN'),('Koszyk pełny','Koszyk pełny','PL'),('Koszyk pełny','Кошик повний','UA'),('Menu główne','Other categories','EN'),('Menu główne','Menu główne','PL'),('Menu główne','Інші категорії','UA'),('Mięsne','Meat products','EN'),('Mięsne','Mięsne','PL'),('Mięsne','М\'ясо','UA'),('Monety','Coins','EN'),('Monety','Monety','PL'),('Może reklamówkę?','How about a bag?','EN'),('Może reklamówkę?','Może reklamówkę?','PL'),('Może reklamówkę?','Хочеш пакет?','UA'),('Młynarskie','Cereals and Grainy Products','EN'),('Młynarskie','Młynarskie','PL'),('Młynarskie','Млинні вироби','UA'),('Nabiał','Dairy','EN'),('Nabiał','Nabiał','PL'),('Nabiał','Молочні','UA'),('Napoje, soki','Napoje, soki','PL'),('Nastąpi zwrot monet.','Coins will be returned.','EN'),('Nastąpi zwrot monet.','Nastąpi zwrot monet.','PL'),('Nastąpi zwrot monet.','Монети будуть повернуті.','UA'),('Nie udało się zwrócić środków na konto, skontaktuj się z właścicielem automatu.','Unable to return payment. Contact the owner of the machine.','EN'),('Nie udało się zwrócić środków na konto, skontaktuj się z właścicielem automatu.','Nie udało się zwrócić środków na konto, skontaktuj się z właścicielem automatu.','PL'),('Nie udało się zwrócić środków na konto, skontaktuj się z właścicielem automatu.','Не вдалося повернути кошти на рахунок, зв’яжіться з власником торгового автомата.','UA'),('Nieprawidłowy numer BLIK. Spróbuj ponownie.','Incorrect BLIK number. Try again.','EN'),('Nieprawidłowy numer BLIK. Spróbuj ponownie.','Nieprawidłowy numer BLIK. Spróbuj ponownie.','PL'),('Nieprawidłowy numer BLIK. Spróbuj ponownie.','Недійсний номер BLIK. Спробуйте ще раз.','UA'),('Nierozpoznane monety. Odbierz monety i spróbuj ponownie.','Unrecognized coins. Collect your coins and try again.','EN'),('Nierozpoznane monety. Odbierz monety i spróbuj ponownie.','Nierozpoznane monety. Odbierz monety i spróbuj ponownie.','PL'),('Nierozpoznane monety. Odbierz monety i spróbuj ponownie.','Нерозпізнані монети. Візьміть монети і спробуйте ще раз.','UA'),('Odbierz monety.','Collect your coins.','EN'),('Odbierz monety.','Odbierz monety.','PL'),('Odbierz monety.','Візьміть монети.','UA'),('Odbierz produkty','Pick up your products','EN'),('Odbierz produkty','Odbierz produkty','PL'),('Odbierz produkty','Візьміть продукти','UA'),('Odbierz zakupy','Pick up your products','EN'),('Odbierz zakupy','Odbierz zakupy','PL'),('Odbierz zakupy','Візьміть покупки','UA'),('Pieczywo','Baked goods','EN'),('Pieczywo','Pieczywo','PL'),('Pieczywo','Хлібобулочні вироби','UA'),('Piwo bezalkoholowe','Alcohol-free Beer','EN'),('Piwo bezalkoholowe','Piwo bezalkoholowe','PL'),('Piwo bezalkoholowe','Безалкогольне пиво','UA'),('Postępuj zgodnie z instrukcjami na terminalu płatniczym.','Follow instructions on the terminal.','EN'),('Postępuj zgodnie z instrukcjami na terminalu płatniczym.','Postępuj zgodnie z instrukcjami na terminalu płatniczym.','PL'),('Postępuj zgodnie z instrukcjami na terminalu płatniczym.','Дотримуйтесь інструкцій на платіжному терміналі.','UA'),('Powrót','Return','EN'),('Powrót','Powrót','PL'),('Pozostała kwota','Amount left','EN'),('Pozostała kwota','Pozostała kwota','PL'),('Pozostała kwota','Решта суми','UA'),('Pozostałe artykuły','Other Products','EN'),('Pozostałe artykuły','Pozostałe artykuły','PL'),('Pozostałe artykuły','Інші харчові продукти','UA'),('Problem z połączeniem. Spróbuj ponownie.','Connection error. Try again.','EN'),('Problem z połączeniem. Spróbuj ponownie.','Problem z połączeniem. Spróbuj ponownie.','PL'),('Problem z połączeniem. Spróbuj ponownie.','Проблема підключення. Спробуйте ще раз.','UA'),('Problem z połączeniem. W razie upłynięcia czasu oczekiwania nastąpi powrót do strony startowej.','There\'s a connectivity issue. The application will return to main page after awaiting time expires.','EN'),('Problem z połączeniem. W razie upłynięcia czasu oczekiwania nastąpi powrót do strony startowej.','Problem z połączeniem. W razie upłynięcia czasu oczekiwania nastąpi powrót do strony startowej.','PL'),('Problem z połączeniem. W razie upłynięcia czasu oczekiwania nastąpi powrót do strony startowej.','Проблема підключення. Якщо час очікування минув, вас повернуть на стартову сторінку.','UA'),('Produkt jest wydawany','Fetching product','EN'),('Produkt jest wydawany','Produkt jest wydawany','PL'),('Produkt jest wydawany','Продукт видається','UA'),('Produkt niedostępny. Spróbuj ponownie.','Product unavailable. Try again.','EN'),('Produkt niedostępny. Spróbuj ponownie.','Produkt niedostępny. Spróbuj ponownie.','PL'),('Produkt niedostępny. Spróbuj ponownie.','Продукт відсутній. Спробуйте ще раз.','UA'),('Produkty','Products','EN'),('Produkty','Produkty','PL'),('Produkty','Продукти','UA'),('Produkty są wydawane','Fetching products','EN'),('Produkty są wydawane','Produkty są wydawane','PL'),('Produkty są wydawane','Продукти видаються','UA'),('Produkty zbożowe','Produkty zbożowe','PL'),('Proszę czekać','Please wait','EN'),('Proszę czekać','Proszę czekać','PL'),('Proszę czekać','Будь ласка, зачекайте','UA'),('Przekąski','Snacks','EN'),('Przekąski','Przekąski','PL'),('Przekąski','Закуски','UA'),('Przetwarzanie płatności','Processing payment','EN'),('Przetwarzanie płatności','Przetwarzanie płatności','PL'),('Przetwarzanie płatności','Обробка платежу','UA'),('Przetwory','Jarred foods','EN'),('Przetwory','Przetwory','PL'),('Przetwory','Баночні вироби','UA'),('Płatność BLIKiem nie powiodła się. Spróbuj ponownie.','BLIK payment failed. Try again.','EN'),('Płatność BLIKiem nie powiodła się. Spróbuj ponownie.','Płatność BLIKiem nie powiodła się. Spróbuj ponownie.','PL'),('Płatność BLIKiem nie powiodła się. Spróbuj ponownie.','Помилка оплати BLIK. Спробуйте ще раз.','UA'),('Razem','Total','EN'),('Razem','Razem','PL'),('Razem','Разом','UA'),('Reklamówka','Shopping Bag','EN'),('Reklamówka','Reklamówka','PL'),('Reklamówka','Пакет','UA'),('Skontaktuj się z obsługą','Contact tech support','EN'),('Skontaktuj się z obsługą','Skontaktuj się z obsługą','PL'),('Skontaktuj się z obsługą','Зверніться в службу підтримки','UA'),('Soki i napoje','Beverages','EN'),('Soki i napoje','Soki i napoje','PL'),('Soki i napoje','Соки та Напої','UA'),('Środki zwrócone pomyślnie.','Payment returned.','EN'),('Środki zwrócone pomyślnie.','Środki zwrócone pomyślnie.','PL'),('Środki zwrócone pomyślnie.','Кошти успішно повернуто.','UA'),('Sypkie','Cereals and grainy products','EN'),('Sypkie','Sypkie','PL'),('Sypkie','Сипучі продукти','UA'),('Słodycze','Sweets','EN'),('Słodycze','Słodycze','PL'),('Słodycze','Солодощі','UA'),('Terminal nie odpowiada. W razie upłynięcia czasu oczekiwania nastąpi powrót do strony startowej.','No response from terminal. The application will return to main page after awaiting time expires.','EN'),('Terminal nie odpowiada. W razie upłynięcia czasu oczekiwania nastąpi powrót do strony startowej.','Terminal nie odpowiada. W razie upłynięcia czasu oczekiwania nastąpi powrót do strony startowej.','PL'),('Terminal nie odpowiada. W razie upłynięcia czasu oczekiwania nastąpi powrót do strony startowej.','Термінал не відповідає. Якщо час очікування минув, вас повернуть на початкову сторінку.','UA'),('Token','Token','EN'),('Token','Token','PL'),('Transakcja anulowana.','Transaction canceled.','EN'),('Transakcja anulowana.','Transakcja anulowana.','PL'),('Transakcja anulowana.','Трансакцію скасовано.','UA'),('Transakcja nie powiodła się, środki zostaną zwrócone.','Transaction failed. Your payment will be returned.','EN'),('Transakcja nie powiodła się, środki zostaną zwrócone.','Transakcja nie powiodła się, środki zostaną zwrócone.','PL'),('Transakcja nie powiodła się, środki zostaną zwrócone.','Не вдалося здійснити трансакцію, кошти будуть повернені.','UA'),('Transakcja nie powiodła się.','Transaction failed.','EN'),('Transakcja nie powiodła się.','Transakcja nie powiodła się.','PL'),('Transakcja nie powiodła się.','Не вдалося здійснити трансакцію.','UA'),('Transakcja przerwana. Spróbuj ponownie.','Transaction canceled due to connectivity issue. Try again.','EN'),('Transakcja przerwana. Spróbuj ponownie.','Transakcja przerwana. Spróbuj ponownie.','PL'),('Transakcja przerwana. Spróbuj ponownie.','Трансакція зупинена. Спробуйте ще раз.','UA'),('Transakcja zatwierdzona','Transaction approved','EN'),('Transakcja zatwierdzona','Transakcja zatwierdzona','PL'),('Transakcja zatwierdzona','Трансакція затверджена','UA'),('Trwa aktualizacja oprogramowania','Software update in progress','EN'),('Trwa aktualizacja oprogramowania','Trwa aktualizacja oprogramowania','PL'),('Trwa aktualizacja oprogramowania','Оновлення програмного забезпечення','UA'),('Trwają prace konserwacyjne','Maintenance work in progress','EN'),('Trwają prace konserwacyjne','Trwają prace konserwacyjne','PL'),('Trwają prace konserwacyjne','Тривають роботи з технічного обслуговування','UA'),('Twój koszyk','Payment','EN'),('Twój koszyk','Twój koszyk','PL'),('Twój koszyk','Платити','UA'),('Tłuszcze','Cooking Fats','EN'),('Tłuszcze','Tłuszcze','PL'),('Tłuszcze','Жири','UA'),('Upłynął czas na odbiór produktu.','Product not collected in time.','EN'),('Upłynął czas na odbiór produktu.','Upłynął czas na odbiór produktu.','PL'),('Upłynął czas na odbiór produktu.','Минув час збору продукту.','UA'),('Upłynął czas. Spróbuj ponownie.','Time alloted for purchase expired. Try again.','EN'),('Upłynął czas. Spróbuj ponownie.','Upłynął czas. Spróbuj ponownie.','PL'),('Upłynął czas. Spróbuj ponownie.','Час минув. Спробуйте ще раз.','UA'),('Usuń','Remove','EN'),('Usuń','Usuń','PL'),('Usuń','Видалити','UA'),('Usuń wszystko','Remove all','EN'),('Usuń wszystko','Usuń wszystko','PL'),('Usuń wszystko','Видалити всі','UA'),('Usuń z koszyka','Remove from cart','EN'),('Usuń z koszyka','Usuń z koszyka','PL'),('Usuń z koszyka','Видалити з кошика','UA'),('Warzywa i owoce','Fruits and vegetables','EN'),('Warzywa i owoce','Warzywa i owoce','PL'),('Warzywa i owoce','Фрукти та Овочі','UA'),('Wędliny','Meat Products','EN'),('Wędliny','Wędliny','PL'),('Wędliny','М\'ясо та ковбаси','UA'),('Weryfikacja','verification','EN'),('Weryfikacja','Weryfikacja','PL'),('Weryfikacja','Перевірка','UA'),('Woda','Water','EN'),('Woda','Woda','PL'),('Woda','Вода','UA'),('Wody','Wody','PL'),('Wpisz BLIK','Type your BLIK','EN'),('Wpisz BLIK','Wpisz BLIK','PL'),('Wpisz BLIK','Введіть BLIK','UA'),('Wybierz produkt','Choose product','EN'),('Wybierz produkt','Wybierz produkt','PL'),('Wybierz produkt','Виберіть продукт','UA'),('Wybierz sposób płatności','That\'s all, let me pay','EN'),('Wybierz sposób płatności','Wybierz sposób płatności','PL'),('Wybierz sposób płatności','Це все, я плачу','UA'),('wysyłanie żądania','Sending request','EN'),('wysyłanie żądania','wysyłanie żądania','PL'),('wysyłanie żądania','Надсилання запиту','UA'),('Zwracanie monet...','Returning coins...','EN'),('Zwracanie monet...','Zwracanie monet...','PL'),('Zwracanie monet...','Повернення монет...','UA'),('Zwracanie środków na konto...','Returning payment...','EN'),('Zwracanie środków na konto...','Zwracanie środków na konto...','PL'),('Zwracanie środków na konto...','Повернення коштів на рахунок...','UA');
/*!40000 ALTER TABLE `tblTranslation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblUISettings`
--

DROP TABLE IF EXISTS `tblUISettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblUISettings` (
  `UISettingsId` bigint(20) NOT NULL AUTO_INCREMENT,
  `MenuOptionalText` varchar(2000) CHARACTER SET utf8 DEFAULT NULL,
  `ProductDetailsSimpleView` tinyint(1) DEFAULT NULL,
  `MenuOptionalImage` varchar(2000) CHARACTER SET utf8 DEFAULT NULL,
  `LangSwitchExpandable` tinyint(1) DEFAULT NULL,
  `CoinsCreditEnabled` tinyint(1) DEFAULT 0,
  `ScreensaverEnabled` tinyint(1) DEFAULT 1,
  `ScreensaverTimeout` int(11) DEFAULT 120,
  `AutomaticallyAddToCart` tinyint(1) DEFAULT 0,
  `CartImage` varchar(250) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`UISettingsId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblUISettings`
--

LOCK TABLES `tblUISettings` WRITE;
/*!40000 ALTER TABLE `tblUISettings` DISABLE KEYS */;
INSERT INTO `tblUISettings` VALUES (1,' ',1,'',0,1,0,120,0,'images/dev/cart.png');
/*!40000 ALTER TABLE `tblUISettings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblUISkin`
--

DROP TABLE IF EXISTS `tblUISkin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblUISkin` (
  `UISkinId` int(11) NOT NULL AUTO_INCREMENT,
  `Name` text DEFAULT NULL,
  PRIMARY KEY (`UISkinId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblUISkin`
--

LOCK TABLES `tblUISkin` WRITE;
/*!40000 ALTER TABLE `tblUISkin` DISABLE KEYS */;
INSERT INTO `tblUISkin` VALUES (1,'Default'),(2,'Dark');
/*!40000 ALTER TABLE `tblUISkin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblUISkinType`
--

DROP TABLE IF EXISTS `tblUISkinType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblUISkinType` (
  `UISkinId` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Enabled` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`UISkinId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblUISkinType`
--

LOCK TABLES `tblUISkinType` WRITE;
/*!40000 ALTER TABLE `tblUISkinType` DISABLE KEYS */;
INSERT INTO `tblUISkinType` VALUES (1,'Default',0),(2,'Dark',1);
/*!40000 ALTER TABLE `tblUISkinType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblUITimeout`
--

DROP TABLE IF EXISTS `tblUITimeout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblUITimeout` (
  `TimeoutId` int(11) NOT NULL AUTO_INCREMENT,
  `ProductChoiceTimeout` int(11) DEFAULT NULL,
  `PaymentChoiceTimeout` int(11) DEFAULT NULL,
  `BlikTimeout` int(11) DEFAULT NULL,
  PRIMARY KEY (`TimeoutId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblUITimeout`
--

LOCK TABLES `tblUITimeout` WRITE;
/*!40000 ALTER TABLE `tblUITimeout` DISABLE KEYS */;
INSERT INTO `tblUITimeout` VALUES (1,90,90,90);
/*!40000 ALTER TABLE `tblUITimeout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblUIVendType`
--

DROP TABLE IF EXISTS `tblUIVendType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblUIVendType` (
  `UIVendTypeId` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Enabled` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`UIVendTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblUIVendType`
--

LOCK TABLES `tblUIVendType` WRITE;
/*!40000 ALTER TABLE `tblUIVendType` DISABLE KEYS */;
INSERT INTO `tblUIVendType` VALUES (1,'Single_Vend',1),(2,'Multi_Vend',0);
/*!40000 ALTER TABLE `tblUIVendType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblUIViewType`
--

DROP TABLE IF EXISTS `tblUIViewType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblUIViewType` (
  `UIViewId` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Enabled` tinyint(1) DEFAULT NULL,
  `DefaultView` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`UIViewId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblUIViewType`
--

LOCK TABLES `tblUIViewType` WRITE;
/*!40000 ALTER TABLE `tblUIViewType` DISABLE KEYS */;
INSERT INTO `tblUIViewType` VALUES (1,'Numpad',1,1),(2,'Categories',0,0),(3,'Grid',0,0);
/*!40000 ALTER TABLE `tblUIViewType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblUpdate`
--

DROP TABLE IF EXISTS `tblUpdate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblUpdate` (
  `UpdateId` bigint(20) NOT NULL AUTO_INCREMENT,
  `MA_From` varchar(100) DEFAULT NULL,
  `MA_To` varchar(100) DEFAULT NULL,
  `MA_LastUpdateDateTime` datetime DEFAULT NULL,
  `MA_LastError` text DEFAULT NULL,
  `MD_From` varchar(100) DEFAULT NULL,
  `MD_To` varchar(100) DEFAULT NULL,
  `MD_LastUpdateDateTime` datetime DEFAULT NULL,
  `MD_LastError` text DEFAULT NULL,
  `RS_From` varchar(100) DEFAULT NULL,
  `RS_To` varchar(100) DEFAULT NULL,
  `RS_LastUpdateDateTime` datetime DEFAULT NULL,
  `RS_LastError` text DEFAULT NULL,
  `VS_From` varchar(100) DEFAULT NULL,
  `VS_To` varchar(100) DEFAULT NULL,
  `VS_LastUpdateDateTime` datetime DEFAULT NULL,
  `VS_LastError` text DEFAULT NULL,
  `VR_From` varchar(100) DEFAULT NULL,
  `VR_To` varchar(100) DEFAULT NULL,
  `VR_LastUpdateDateTime` datetime DEFAULT NULL,
  `VR_LastError` text DEFAULT NULL,
  `RP_From` varchar(100) DEFAULT NULL,
  `RP_To` varchar(100) DEFAULT NULL,
  `RP_LastUpdateDateTime` datetime DEFAULT NULL,
  `RP_LastError` text DEFAULT NULL,
  `VD_From` varchar(100) DEFAULT NULL,
  `VD_To` varchar(100) DEFAULT NULL,
  `VD_LastUpdateDateTime` datetime DEFAULT NULL,
  `VD_LastError` text DEFAULT NULL,
  PRIMARY KEY (`UpdateId`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblUpdate`
--

LOCK TABLES `tblUpdate` WRITE;
/*!40000 ALTER TABLE `tblUpdate` DISABLE KEYS */;
INSERT INTO `tblUpdate` VALUES (32,'MA_0000000000000000000000000000000000000000','MA_9e4d16ae6e0dfda974d52bb3e1345d75e085742d','2021-10-11 12:41:37','Ok','MD_0000000000000000000000000000000000000000','MD_b61c0b4b859779abb5b4b988c1b9c6b8d1c8ad88','2021-10-11 12:41:37','Ok','RS_0000000000000000000000000000000000000000','RS_ed9151c82e61c574772bf5d8487df3ae293b525e','2021-10-11 12:41:37','Ok','VS_0000000000000000000000000000000000000000','VS_995301f1fb543190f4863f0eaca2e651a27d68f4','2021-10-11 12:41:37','Ok','VR_0000000000000000000000000000000000000000','VR_fea36d2d3925f8d38735d35592e3b2ea111636f0','2021-10-11 12:41:37','Ok','RP_0000000000000000000000000000000000000000','RP_0653b360c789513b10fa267f966b9521128281d6','2021-10-11 12:41:37','Ok','VD_0000000000000000000000000000000000000000','VD_a6fa58b643c597a0266a79d599c9ec536dd7f199','2021-10-11 12:41:37','Ok');
/*!40000 ALTER TABLE `tblUpdate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblUser`
--

DROP TABLE IF EXISTS `tblUser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblUser` (
  `UserId` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `Email` varchar(255) CHARACTER SET utf8 NOT NULL,
  `Password` varchar(2000) CHARACTER SET utf8 NOT NULL,
  `RoleId` int(11) DEFAULT NULL,
  `NotificationEmail` varchar(255) CHARACTER SET utf8 DEFAULT '',
  `IsAdmin` varchar(255) CHARACTER SET utf8 DEFAULT '1',
  PRIMARY KEY (`UserId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblUser`
--

LOCK TABLES `tblUser` WRITE;
/*!40000 ALTER TABLE `tblUser` DISABLE KEYS */;
INSERT INTO `tblUser` VALUES (1,'Serwisant','s@zmien.pl','123456',1,'','0'),(2,'Właściciel','w@zmien.pl','123456',2,'','0');
/*!40000 ALTER TABLE `tblUser` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-29 11:50:29

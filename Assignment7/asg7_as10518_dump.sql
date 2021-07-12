-- MySQL dump 10.14  Distrib 5.5.60-MariaDB, for Linux (x86_64)
--
-- Host: warehouse    Database: as10518_ChessData
-- ------------------------------------------------------
-- Server version	5.1.73

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
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `countries` (
  `country_ID` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `country_name` varchar(15) NOT NULL,
  `country_secondary` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`country_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (1,'France',NULL),(2,'England',NULL),(3,'Prussia',NULL),(4,'USA',NULL),(5,'Austria-Hungry',NULL),(6,'Germany',NULL),(7,'Cuba',NULL),(8,'Russia',NULL),(9,'Netherlands',NULL),(10,'Soviet Union','Russia'),(11,'Soviet Union','Armenia'),(12,'Soviet Union','Latvia'),(13,'Soviet Union','Ukraine'),(14,'Soviet Union','Georgia'),(15,'India',NULL),(16,'Ukraine',NULL),(17,'Uzbekistan',NULL),(18,'Bulgaria',NULL),(19,'Norway',NULL),(20,'Czechoslovakia',NULL),(21,'China',NULL);
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `games`
--

DROP TABLE IF EXISTS `games`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `games` (
  `game_ID` int(11) NOT NULL AUTO_INCREMENT,
  `game_date` date NOT NULL,
  `game_whiteFirstName` varchar(15) DEFAULT NULL,
  `game_whiteLastName` varchar(30) DEFAULT NULL,
  `game_whiteRating` int(4) DEFAULT NULL,
  `game_blackFirstName` varchar(15) DEFAULT NULL,
  `game_blackLastName` varchar(30) DEFAULT NULL,
  `game_blackRating` int(4) DEFAULT NULL,
  `game_victor` char(5) DEFAULT NULL,
  `game_type` varchar(50) DEFAULT NULL,
  `game_totalMoves` int(3) DEFAULT NULL,
  PRIMARY KEY (`game_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `games`
--

LOCK TABLES `games` WRITE;
/*!40000 ALTER TABLE `games` DISABLE KEYS */;
/*!40000 ALTER TABLE `games` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `players`
--

DROP TABLE IF EXISTS `players`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `players` (
  `player_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `player_firstName` varchar(15) DEFAULT NULL,
  `player_lastName` varchar(30) NOT NULL,
  `player_countryID` int(2) NOT NULL,
  `player_DOB` date NOT NULL,
  `player_FIDE_rating` int(4) DEFAULT NULL,
  `player_FIDE_peak` int(4) DEFAULT NULL,
  `player_peak_year` year(4) DEFAULT NULL,
  `player_statusID` int(1) DEFAULT NULL,
  PRIMARY KEY (`player_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `players`
--

LOCK TABLES `players` WRITE;
/*!40000 ALTER TABLE `players` DISABLE KEYS */;
INSERT INTO `players` VALUES (1,'Paul','Morphy',4,'1837-06-22',NULL,NULL,NULL,1),(2,'Wilhelm','Steinitz',5,'1836-05-17',NULL,NULL,NULL,1),(3,'Emanuel','Lasker',6,'1868-12-24',NULL,NULL,NULL,1),(4,'Jose','Capablanca',7,'1888-11-19',NULL,NULL,NULL,1),(5,'Alexander','Alekhine',1,'1892-10-31',NULL,NULL,NULL,1),(6,'Max','Euwe',9,'1901-05-20',NULL,NULL,NULL,1),(7,'Mikhail','Botvinnik',10,'1911-08-17',NULL,NULL,NULL,1),(8,'Vasily','Smyslov',10,'1921-03-24',NULL,NULL,NULL,1),(9,'Mikhail','Tal',12,'1936-11-09',NULL,NULL,NULL,1),(10,'Tigran','Petrosian',11,'1939-06-17',NULL,NULL,NULL,1),(11,'Boris','Spassky',10,'1937-01-30',NULL,NULL,NULL,2),(12,'Robert','Fischer',4,'1943-03-09',NULL,2785,1972,1),(13,'Anatoly','Karpov',10,'1951-05-23',2619,2780,1994,2),(14,'Gary','Kasparov',10,'1963-04-13',2812,2851,1999,2),(15,'Alexander','Khalifman',10,'1966-01-18',2614,2702,2003,3),(16,'Viswanathan','Anand',15,'1969-12-11',2784,2817,2011,3),(17,'Vladimir','Kramnik',10,'1975-06-25',2801,2810,2013,3),(18,'Ruslan','Ponomariov',16,'1983-10-11',2726,2758,2011,3),(19,'Rustam','Kasimdzhanov',17,'1979-12-05',2657,2715,2001,3),(20,'Veselin','Topalov',18,'1975-03-15',2780,2816,2001,3),(21,'Magnus','Carlson',19,'1990-12-30',2844,2881,2014,3),(22,'Asher','Sebban',27,'1997-11-14',1240,1560,2019,3);
/*!40000 ALTER TABLE `players` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statuses`
--

DROP TABLE IF EXISTS `statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `statuses` (
  `status_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status_type` varchar(10) NOT NULL,
  PRIMARY KEY (`status_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statuses`
--

LOCK TABLES `statuses` WRITE;
/*!40000 ALTER TABLE `statuses` DISABLE KEYS */;
INSERT INTO `statuses` VALUES (1,'deceased'),(2,'retired'),(3,'active');
/*!40000 ALTER TABLE `statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `titles`
--

DROP TABLE IF EXISTS `titles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `titles` (
  `title_ID` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `title_name` varchar(15) NOT NULL,
  PRIMARY KEY (`title_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `titles`
--

LOCK TABLES `titles` WRITE;
/*!40000 ALTER TABLE `titles` DISABLE KEYS */;
INSERT INTO `titles` VALUES (1,'Noteworthy'),(2,'Unofficial'),(3,'Pre-FIDE'),(4,'FIDE'),(5,'Classical'),(6,'Undisputed'),(7,'Women\'s');
/*!40000 ALTER TABLE `titles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `worldChampions`
--

DROP TABLE IF EXISTS `worldChampions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `worldChampions` (
  `champ_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `champ_playerID` int(5) NOT NULL,
  `champ_startDate` int(4) DEFAULT NULL,
  `champ_endDate` int(4) DEFAULT NULL,
  `champ_countryID` int(3) NOT NULL,
  `champ_dateEstimated` enum('True','False') NOT NULL,
  `champ_titleID` int(1) NOT NULL,
  PRIMARY KEY (`champ_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `worldChampions`
--

LOCK TABLES `worldChampions` WRITE;
/*!40000 ALTER TABLE `worldChampions` DISABLE KEYS */;
INSERT INTO `worldChampions` VALUES (1,1,1858,1862,4,'False',2),(2,2,1886,1894,5,'True',3),(3,2,1886,1894,2,'True',3),(4,2,1886,1894,4,'True',3),(5,3,1894,1921,6,'False',3),(6,4,1921,1927,7,'False',3),(7,5,1927,1935,8,'False',3),(8,6,1935,1937,9,'False',3),(9,5,1937,1946,1,'False',3),(10,7,1948,1957,10,'False',4),(11,8,1957,1958,10,'False',4),(12,7,1958,1960,10,'False',4),(13,9,1960,1961,12,'False',4),(14,7,1961,1963,10,'False',4),(15,10,1963,1969,11,'False',4),(16,11,1969,1972,10,'False',4),(17,12,1972,1975,4,'False',4),(18,13,1975,1985,10,'False',4),(19,14,1985,1993,10,'False',4),(20,14,1993,2000,8,'False',5),(21,17,2000,2006,8,'False',5),(22,13,1993,1999,8,'False',4),(23,15,1999,2000,8,'False',4),(24,16,2000,2002,15,'False',4),(25,18,2002,2004,16,'False',4),(26,19,2004,2005,17,'False',4),(27,20,2005,2006,18,'False',4),(28,17,2006,2007,8,'False',6),(29,16,2007,2013,15,'False',6),(30,21,2013,2019,19,'False',6);
/*!40000 ALTER TABLE `worldChampions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-06-07  5:52:47

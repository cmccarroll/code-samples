-- MySQL dump 10.13  Distrib 5.5.50, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: quest_ogm
-- ------------------------------------------------------
-- Server version	5.5.50-0ubuntu0.14.04.1

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
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `account_num` varchar(45) DEFAULT NULL,
  `super_account` tinyint(1) DEFAULT '0',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL,
  `created_by` int(11) unsigned NOT NULL,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `modified_by` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_accounts_1_idx` (`created_by`),
  KEY `modified` (`modified_by`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES (1,'Quest','',1,1,'2016-09-04 01:09:47',1,'2016-11-18 19:44:02',1),(3,'Fred\'s Drilling','123456',0,1,'0000-00-00 00:00:00',1,'2016-11-15 07:27:31',1),(5,'Omni Consolidated','12121234',0,1,'2016-09-08 23:54:00',1,'2016-11-07 22:20:51',1),(8,'Fred123','12345',0,1,'2016-09-26 13:37:38',1,'2016-11-15 07:27:47',1),(9,'Jackson\'s Drilling Co.','1234564',0,1,'2016-11-07 16:21:38',1,'2016-11-07 22:22:16',1);
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `action_tags`
--

DROP TABLE IF EXISTS `action_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `action_tags` (
  `action_id` int(10) unsigned NOT NULL,
  `tag_id` int(10) unsigned NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(10) unsigned NOT NULL,
  PRIMARY KEY (`action_id`,`tag_id`),
  KEY `fk_action_tags_2_idx` (`tag_id`),
  CONSTRAINT `fk_action_tags_1` FOREIGN KEY (`action_id`) REFERENCES `actions` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_action_tags_2` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `action_tags`
--

LOCK TABLES `action_tags` WRITE;
/*!40000 ALTER TABLE `action_tags` DISABLE KEYS */;
INSERT INTO `action_tags` VALUES (1,15,'2016-11-18 05:23:24',1),(5,14,'2016-11-18 05:22:14',1),(6,14,'2016-11-18 05:25:32',1),(6,16,'2016-11-18 05:25:32',1),(7,16,'2016-11-20 05:03:00',1);
/*!40000 ALTER TABLE `action_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `actions`
--

DROP TABLE IF EXISTS `actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `xml_name` varchar(45) NOT NULL,
  `description` varchar(45) DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  `created` datetime NOT NULL,
  `created_by` int(10) unsigned NOT NULL,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `modified_by` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actions`
--

LOCK TABLES `actions` WRITE;
/*!40000 ALTER TABLE `actions` DISABLE KEYS */;
INSERT INTO `actions` VALUES (1,'Shutdown Pump','shutdownpump','1\'s',1,'2016-11-16 21:11:55',1,'2016-11-20 05:17:19',1),(2,'Startup Pump','startuppump','',1,'2016-11-16 23:39:32',1,'2016-11-18 04:42:52',1),(3,'Shut off Valve','shutoffvalve','',1,'2016-11-16 23:40:14',1,NULL,NULL),(4,'Open Valve','openvalve','',1,'2016-11-16 23:40:42',1,NULL,NULL),(5,'Reboot OPCUA Server','rebootopcuaserver','',1,'2016-11-16 23:41:11',1,'2016-11-17 05:41:33',1),(6,'Just Because','justbecause','',1,'2016-11-17 23:24:42',1,'2016-11-18 05:25:00',1),(7,'Now is the Time','nowisthetime','1\'s',1,'2016-11-19 23:02:14',1,'2016-11-20 05:03:00',1);
/*!40000 ALTER TABLE `actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `activity_log`
--

DROP TABLE IF EXISTS `activity_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activity_log` (
  `user_id` int(10) unsigned NOT NULL,
  `time_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`,`time_stamp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_log`
--

LOCK TABLES `activity_log` WRITE;
/*!40000 ALTER TABLE `activity_log` DISABLE KEYS */;
INSERT INTO `activity_log` VALUES (0,'2016-10-06 01:52:40'),(1,'2017-01-09 21:36:01'),(36,'2016-11-21 18:57:37'),(47,'2016-11-18 20:49:59');
/*!40000 ALTER TABLE `activity_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_log`
--

DROP TABLE IF EXISTS `admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `account_id` int(10) unsigned NOT NULL,
  `object_name` varchar(45) NOT NULL,
  `table` varchar(45) DEFAULT NULL,
  `foreign_id` varchar(45) DEFAULT NULL,
  `action` varchar(20) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user` (`object_name`),
  KEY `fk_admin_log_1_idx` (`account_id`),
  KEY `fk_admin_log_2_idx` (`created_by`),
  CONSTRAINT `fk_admin_log_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2451 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_log`
--

LOCK TABLES `admin_log` WRITE;
/*!40000 ALTER TABLE `admin_log` DISABLE KEYS */;
INSERT INTO `admin_log` VALUES (748,1,'Allen Bradley 1765','devices','10','UPDATE','Device - Allen Bradley 1765 modified','2016-10-18 21:48:53',1),(749,1,'Allen Bradley 1765','devices','1','INSERT','Allen Bradley 1765 configured with Pressure','2016-10-18 21:48:53',1),(750,1,'Allen Bradley 1765','devices','8','INSERT','Allen Bradley 1765 configured with Savy','2016-10-18 21:48:53',1),(751,1,'Allen Bradley 1765','devices','10','INSERT','Allen Bradley 1765 configured with Critical Mass','2016-10-18 21:48:53',1),(752,5,'15\' Oil Tank','devices','7','UPDATE','Device - 15\' Oil Tank modified','2016-10-18 22:27:34',1),(753,5,'15\' Oil Tank','devices','7','UPDATE','Device - 15\' Oil Tank modified','2016-10-18 22:28:39',1),(754,5,'15\' Oil Tank','devices','7','UPDATE','Device - 15\' Oil Tank modified','2016-10-18 22:28:59',1),(755,5,'15\' Oil Tank','devices','1','INSERT','15\' Oil Tank configured with Pressuretag','2016-10-18 22:28:59',1),(756,5,'15\' Oil Tank','devices','5','INSERT','15\' Oil Tank configured with Davidtag','2016-10-18 22:28:59',1),(757,5,'15\' Oil Tank','devices','7','UPDATE','Device - 15\' Oil Tank modified','2016-10-18 22:29:11',1),(758,5,'15\' Oil Tank','devices','1','INSERT','15\' Oil Tank configured with Pressuretag','2016-10-18 22:29:11',1),(759,5,'15\' Oil Tank','devices','3','INSERT','15\' Oil Tank configured with Tank Leveltag','2016-10-18 22:29:11',1),(760,5,'15\' Oil Tank','devices','5','INSERT','15\' Oil Tank configured with Davidtag','2016-10-18 22:29:11',1),(761,5,'15\' Oil Tank','devices','6','INSERT','15\' Oil Tank configured with Beccatag','2016-10-18 22:29:11',1),(762,5,'20\' Water Tank','devices','5','UPDATE','Device - 20\' Water Tank modified','2016-10-18 22:29:58',1),(763,5,'20\' Water Tank','devices','1','INSERT','20\' Water Tank configured with Pressuretag','2016-10-18 22:29:58',1),(764,5,'20\' Water Tank','devices','3','INSERT','20\' Water Tank configured with Tank Leveltag','2016-10-18 22:29:58',1),(765,5,'Fred\'s Site','sites','30','INSERT','New site - Fred\'s Site added','2016-10-18 22:55:43',1),(766,5,'Fred\'s Site','sites','30','UPDATE','Site - Fred\'s Site modified','2016-10-18 22:56:04',1),(767,5,'Becca\'s Bonaza','sites','16','UPDATE','Site - Becca\'s Bonaza modified','2016-10-18 23:03:40',1),(768,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-10-19 14:58:56',1),(769,1,'15\' Oil Tank','devices','7','UPDATE','Device - 15\' Oil Tank modified','2016-10-19 14:59:28',1),(770,1,'15\' Oil Tank','devices','1','INSERT','15\' Oil Tank configured with Pressuretag','2016-10-19 14:59:28',1),(771,1,'15\' Oil Tank','devices','3','INSERT','15\' Oil Tank configured with Tank Leveltag','2016-10-19 14:59:29',1),(772,1,'15\' Oil Tank','devices','4','INSERT','15\' Oil Tank configured with Bettytag','2016-10-19 14:59:29',1),(773,1,'15\' Oil Tank','devices','5','INSERT','15\' Oil Tank configured with Davidtag','2016-10-19 14:59:29',1),(774,1,'15\' Oil Tank','devices','6','INSERT','15\' Oil Tank configured with Beccatag','2016-10-19 14:59:29',1),(775,1,'15\' Oil Tank','devices','7','UPDATE','Device - 15\' Oil Tank modified','2016-10-19 14:59:44',1),(776,1,'15\' Oil Tank','devices','7','UPDATE','Device - 15\' Oil Tank modified','2016-10-19 14:59:49',1),(777,1,'15\' Oil Tank','devices','7','UPDATE','Device - 15\' Oil Tank modified','2016-10-19 14:59:57',1),(778,1,'15\' Oil Tank','devices','7','UPDATE','Device - 15\' Oil Tank modified','2016-10-19 15:00:46',1),(779,1,'15\' Oil Tank','devices','7','UPDATE','Device - 15\' Oil Tank modified','2016-10-19 15:01:40',1),(780,1,'15\' Oil Tank','devices','7','UPDATE','Device - 15\' Oil Tank modified','2016-10-19 15:02:05',1),(781,1,'15\' Oil Tank','devices','7','UPDATE','Device - 15\' Oil Tank modified','2016-10-19 15:02:51',1),(782,1,'15\' Oil Tank','devices','7','UPDATE','Device - 15\' Oil Tank modified','2016-10-19 15:03:01',1),(783,1,'15\' Oil Tank','devices','1','INSERT','15\' Oil Tank configured with Pressuretag','2016-10-19 15:03:02',1),(784,1,'15\' Oil Tank','devices','4','INSERT','15\' Oil Tank configured with Bettytag','2016-10-19 15:03:02',1),(785,1,'15\' Oil Tank','devices','6','INSERT','15\' Oil Tank configured with Beccatag','2016-10-19 15:03:02',1),(786,5,'Becca\'s Bonaza','sites','16','UPDATE','Site - Becca\'s Bonaza modified','2016-10-19 15:03:42',1),(787,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-10-19 16:04:22',1),(788,1,'20\' Oil Tank','devices','11','INSERT','New device - 20\' Oil Tank added','2016-10-19 16:05:41',1),(789,1,'20\' Oil Tank','devices','11','DELETE','Device - 20\' Oil Tank deleted','2016-10-19 16:06:06',1),(790,1,'bbb','devices','12','INSERT','New device - bbb added','2016-10-19 16:06:49',1),(791,1,'bbb','devices','12','UPDATE','Device - bbb modified','2016-10-19 16:13:58',1),(792,1,'bbb','devices','12','UPDATE','Device - bbb modified','2016-10-19 16:14:57',1),(793,1,'bbb','devices','12','UPDATE','Device - bbb modified','2016-10-19 16:18:52',1),(794,1,'bbb','device_registers','1','INSERT','bbb configured with tag','2016-10-19 16:18:52',1),(795,1,'bbb','device_registers','4','INSERT','bbb configured with Pressuretag','2016-10-19 16:18:52',1),(796,1,'bbb','device_registers','6','INSERT','bbb configured with Bettytag','2016-10-19 16:18:52',1),(797,1,'bbb','devices','12','UPDATE','Device - bbb modified','2016-10-19 16:20:20',1),(798,1,'bbb','device_registers','1','INSERT','bbb configured with Pressuretag','2016-10-19 16:20:20',1),(799,1,'bbb','device_registers','4','INSERT','bbb configured with Bettytag','2016-10-19 16:20:20',1),(800,1,'bbb','device_registers','6','INSERT','bbb configured with Beccatag','2016-10-19 16:20:20',1),(801,1,'bbb','devices','12','UPDATE','Device - bbb modified','2016-10-19 16:20:39',1),(802,1,'bbb','device_registers','10','INSERT','bbb configured with Critical Masstag','2016-10-19 16:20:39',1),(803,1,'bbb','devices','12','DELETE','Device - bbb deleted','2016-10-19 16:30:04',1),(804,1,'20\' Oil Tank','devices','13','INSERT','New device - 20\' Oil Tank added','2016-10-19 16:30:55',1),(805,1,'20\' Oil Tank','device_registers','1','INSERT','20\' Oil Tank configured with Pressuretag','2016-10-19 16:30:55',1),(806,1,'20\' Oil Tank','device_registers','3','INSERT','20\' Oil Tank configured with Tank Leveltag','2016-10-19 16:30:55',1),(807,1,'20\' Oil Tank','device_registers','10','INSERT','20\' Oil Tank configured with Critical Masstag','2016-10-19 16:30:55',1),(808,1,'20\' Oil Tank','devices','13','UPDATE','Device - 20\' Oil Tank modified','2016-10-19 16:31:12',1),(809,1,'20\' Oil Tank','device_registers','1','INSERT','20\' Oil Tank configured with Pressuretag','2016-10-19 16:31:13',1),(810,1,'20\' Oil Tank','device_registers','3','INSERT','20\' Oil Tank configured with Tank Leveltag','2016-10-19 16:31:13',1),(811,1,'20\' Oil Tank','device_registers','5','INSERT','20\' Oil Tank configured with Davidtag','2016-10-19 16:31:13',1),(812,1,'20\' Oil Tank','device_registers','10','INSERT','20\' Oil Tank configured with Critical Masstag','2016-10-19 16:31:13',1),(813,5,'Becca\'s Bonaza','sites','16','UPDATE','Site - Becca\'s Bonaza modified','2016-10-19 16:32:05',1),(814,5,'Becca\'s Bonaza','site_devices','5','INSERT','Becca\'s Bonaza configured with 20\' Water Tankdevice','2016-10-19 16:32:05',1),(815,5,'Becca\'s Bonaza','site_devices','7','INSERT','Becca\'s Bonaza configured with 15\' Oil Tankdevice','2016-10-19 16:32:05',1),(816,5,'Becca\'s Bonaza','site_devices','10','INSERT','Becca\'s Bonaza configured with Allen Bradley 1765device','2016-10-19 16:32:06',1),(817,5,'Becca\'s Bonaza','sites','16','UPDATE','Site - Becca\'s Bonaza modified','2016-10-19 16:32:25',1),(818,5,'Becca\'s Bonaza','site_devices','5','INSERT','Becca\'s Bonaza configured with 20\' Water Tankdevice','2016-10-19 16:32:25',1),(819,5,'Becca\'s Bonaza','site_devices','10','INSERT','Becca\'s Bonaza configured with Allen Bradley 1765device','2016-10-19 16:32:25',1),(820,5,'!test','sites','31','INSERT','New site - !test added','2016-10-19 16:32:48',1),(821,5,'!test','site_devices','5','INSERT','!test configured with 20\' Water Tankdevice','2016-10-19 16:32:48',1),(822,5,'!test','site_devices','7','INSERT','!test configured with 15\' Oil Tankdevice','2016-10-19 16:32:48',1),(823,5,'!test','sites','31','UPDATE','Site - !test modified','2016-10-19 16:36:46',1),(824,5,'!test','site_devices','5','INSERT','!test configured with 20\' Water Tankdevice','2016-10-19 16:36:46',1),(825,5,'!test','site_devices','7','INSERT','!test configured with 15\' Oil Tankdevice','2016-10-19 16:36:46',1),(826,5,'!test','sites','31','UPDATE','Site - !test modified','2016-10-19 16:37:12',1),(827,5,'!test','site_devices','5','INSERT','!test configured with 20\' Water Tankdevice','2016-10-19 16:37:12',1),(828,5,'!test','site_devices','7','INSERT','!test configured with 15\' Oil Tankdevice','2016-10-19 16:37:12',1),(829,5,'!test','sites','31','UPDATE','Site - !test modified','2016-10-19 16:37:22',1),(830,5,'!test','site_devices','5','INSERT','!test configured with 20\' Water Tankdevice','2016-10-19 16:37:22',1),(831,5,'!test','site_devices','7','INSERT','!test configured with 15\' Oil Tankdevice','2016-10-19 16:37:22',1),(832,5,'!test','sites','31','DELETE','Site - !test deleted','2016-10-19 16:37:33',1),(833,5,'!Test','sites','32','INSERT','New site - !Test added','2016-10-19 16:39:38',1),(834,5,'!Test','site_devices','5','INSERT','!Test configured with 20\' Water Tankdevice','2016-10-19 16:39:38',1),(835,5,'!Test','site_devices','13','INSERT','!Test configured with 20\' Oil Tankdevice','2016-10-19 16:39:39',1),(836,1,'David','registers','5','UPDATE','Data point - David modified','2016-10-19 17:53:40',1),(837,1,'David Niven','registers','5','UPDATE','Data point - David Niven modified','2016-10-19 17:53:54',1),(838,1,'West Terlingua','sites','29','UPDATE','Site - West Terlingua modified','2016-10-19 17:55:06',1),(839,1,'West Terlingua','site_devices','5','INSERT','West Terlingua configured with 20\' Water Tankdevice','2016-10-19 17:55:06',1),(840,1,'West Terlingua','site_devices','7','INSERT','West Terlingua configured with 15\' Oil Tankdevice','2016-10-19 17:55:06',1),(841,1,'West Terlingua','site_devices','10','INSERT','West Terlingua configured with Allen Bradley 1765device','2016-10-19 17:55:06',1),(842,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-10-19 18:46:31',1),(843,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-10-19 18:46:58',1),(844,1,'Kris','sites','25','UPDATE','Site - Kris modified','2016-10-19 18:47:14',1),(845,1,'Kris','site_devices','5','INSERT','Kris configured with 20\' Water Tankdevice','2016-10-19 18:47:14',1),(846,1,'Kris','site_devices','7','INSERT','Kris configured with 15\' Oil Tankdevice','2016-10-19 18:47:14',1),(847,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-10-19 19:31:13',1),(848,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-10-19 20:53:32',1),(849,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-10-19 22:38:09',1),(850,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-10-20 03:03:09',1),(851,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-10-20 04:05:40',1),(852,1,'Kris','sites','25','UPDATE','Site - Kris modified','2016-10-20 04:31:33',1),(853,1,'Kris','site_devices','5','INSERT','Kris configured with 20\' Water Tankdevice','2016-10-20 04:31:34',1),(854,1,'Kris','site_devices','7','INSERT','Kris configured with 15\' Oil Tankdevice','2016-10-20 04:31:34',1),(855,1,'Kris','site_devices','10','INSERT','Kris configured with Allen Bradley 1765device','2016-10-20 04:31:34',1),(856,5,'123 Give it to Me','sites','33','INSERT','New site - 123 Give it to Me added','2016-10-20 04:42:12',1),(857,5,'123 Give it to Me','site_devices','5','INSERT','123 Give it to Me configured with 20\' Water Tankdevice','2016-10-20 04:42:12',1),(858,5,'123 Give it to Me','site_devices','7','INSERT','123 Give it to Me configured with 15\' Oil Tankdevice','2016-10-20 04:42:12',1),(859,5,'123 Give it to Me','sites','34','INSERT','New site - 123 Give it to Me added','2016-10-20 04:42:15',1),(860,5,'123 Give it to Me','site_devices','5','INSERT','123 Give it to Me configured with 20\' Water Tankdevice','2016-10-20 04:42:15',1),(861,5,'123 Give it to Me','site_devices','7','INSERT','123 Give it to Me configured with 15\' Oil Tankdevice','2016-10-20 04:42:15',1),(862,5,'123 Give it to Me','sites','33','DELETE','Site - 123 Give it to Me deleted','2016-10-20 04:42:40',1),(863,5,'!Test 456','sites','32','UPDATE','Site - !Test 456 modified','2016-10-20 05:01:54',1),(864,5,'!Test 456','site_devices','5','INSERT','!Test 456 configured with 20\' Water Tankdevice','2016-10-20 05:01:54',1),(865,5,'!Test 456','site_devices','13','INSERT','!Test 456 configured with 20\' Oil Tankdevice','2016-10-20 05:01:54',1),(866,1,'Pumpers','departments','4','UPDATE','Department - Pumpers  reactivated','2016-10-20 05:31:08',1),(867,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-10-20 06:06:25',1),(868,1,'15\' Oil Tank','devices','7','UPDATE','Device - 15\' Oil Tank modified','2016-10-20 06:51:55',1),(869,1,'15\' Oil Tank','device_registers','1','INSERT','15\' Oil Tank configured with Pressuretag','2016-10-20 06:51:55',1),(870,1,'15\' Oil Tank','device_registers','6','INSERT','15\' Oil Tank configured with Beccatag','2016-10-20 06:51:55',1),(871,1,'15\' Oil Tank','device_registers','8','INSERT','15\' Oil Tank configured with Savytag','2016-10-20 06:51:55',1),(872,1,'15\' Oil Tank','device_registers','12','INSERT','15\' Oil Tank configured with Oil Leaktag','2016-10-20 06:51:55',1),(873,1,'15\' Oil Tank','devices','7','UPDATE','Device - 15\' Oil Tank modified','2016-10-20 06:52:24',1),(874,1,'15\' Oil Tank','device_registers','1','INSERT','15\' Oil Tank configured with Pressuretag','2016-10-20 06:52:24',1),(875,1,'15\' Oil Tank','device_registers','3','INSERT','15\' Oil Tank configured with Tank Leveltag','2016-10-20 06:52:24',1),(876,1,'15\' Oil Tank','device_registers','4','INSERT','15\' Oil Tank configured with Bettytag','2016-10-20 06:52:24',1),(877,1,'15\' Oil Tank','device_registers','5','INSERT','15\' Oil Tank configured with David Niventag','2016-10-20 06:52:24',1),(878,1,'15\' Oil Tank','device_registers','6','INSERT','15\' Oil Tank configured with Beccatag','2016-10-20 06:52:24',1),(879,1,'15\' Oil Tank','device_registers','7','INSERT','15\' Oil Tank configured with Blaketag','2016-10-20 06:52:25',1),(880,1,'15\' Oil Tank','device_registers','8','INSERT','15\' Oil Tank configured with Savytag','2016-10-20 06:52:25',1),(881,1,'15\' Oil Tank','device_registers','10','INSERT','15\' Oil Tank configured with Critical Masstag','2016-10-20 06:52:25',1),(882,1,'15\' Oil Tank','device_registers','12','INSERT','15\' Oil Tank configured with Oil Leaktag','2016-10-20 06:52:25',1),(883,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-10-20 15:21:54',1),(884,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-10-20 15:53:19',1),(885,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-10-20 16:24:30',1),(886,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-10-20 18:31:31',1),(887,1,'Betty','device_registers','4','DELETE','Device register - Betty deleted','2016-10-20 18:55:35',1),(888,1,'Oil Leak','device_registers','12','DELETE','Device register - Oil Leak deleted','2016-10-20 18:55:46',1),(889,1,'David Niven','device_registers','5','DELETE','Device register - David Niven deleted','2016-10-20 18:55:56',1),(890,1,'OPC-UA Server','devices','14','INSERT','New device - OPC-UA Server added','2016-10-20 18:57:16',1),(891,1,'OPC-UA Server','device_registers','1','INSERT','OPC-UA Server configured with Pressure tag','2016-10-20 18:57:16',1),(892,1,'OPC-UA Server','device_registers','3','INSERT','OPC-UA Server configured with Tank Level tag','2016-10-20 18:57:16',1),(893,1,'OPC-UA Server','device_registers','4','INSERT','OPC-UA Server configured with Betty tag','2016-10-20 18:57:16',1),(894,1,'OPC-UA Server','device_registers','5','INSERT','OPC-UA Server configured with David Niven tag','2016-10-20 18:57:17',1),(895,1,'OPC-UA Server','device_registers','6','INSERT','OPC-UA Server configured with Becca tag','2016-10-20 18:57:17',1),(896,1,'OPC-UA Server','device_registers','7','INSERT','OPC-UA Server configured with Blake tag','2016-10-20 18:57:17',1),(897,1,'OPC-UA Server','device_registers','8','INSERT','OPC-UA Server configured with Savy tag','2016-10-20 18:57:17',1),(898,1,'OPC-UA Server','device_registers','10','INSERT','OPC-UA Server configured with Critical Mass tag','2016-10-20 18:57:17',1),(899,1,'OPC-UA Server','device_registers','12','INSERT','OPC-UA Server configured with Oil Leak tag','2016-10-20 18:57:17',1),(900,1,'Betty','device_registers','4','DELETE','Device register - Betty deleted','2016-10-20 18:57:34',1),(901,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-10-20 21:30:20',1),(902,1,'Jessica','sites','24','UPDATE','Site - Jessica modified','2016-10-20 21:35:58',1),(903,1,'Jessica','site_devices','13','INSERT','Jessica configured with 20\' Oil Tank device','2016-10-20 21:35:58',1),(904,1,'Jessica','site_devices','14','INSERT','Jessica configured with OPC-UA Server device','2016-10-20 21:35:59',1),(905,1,'15\' Hanz Oil Tank','devices','7','UPDATE','Device - 15\' Hanz Oil Tank modified','2016-10-20 21:49:20',1),(906,1,'15\' Hanz Oil Tank','device_registers','1','INSERT','15\' Hanz Oil Tank configured with Pressure tag','2016-10-20 21:49:20',1),(907,1,'15\' Hanz Oil Tank','device_registers','3','INSERT','15\' Hanz Oil Tank configured with Tank Level tag','2016-10-20 21:49:20',1),(908,1,'15\' Hanz Oil Tank','device_registers','6','INSERT','15\' Hanz Oil Tank configured with Becca tag','2016-10-20 21:49:20',1),(909,1,'15\' Hanz Oil Tank','device_registers','7','INSERT','15\' Hanz Oil Tank configured with Blake tag','2016-10-20 21:49:20',1),(910,1,'15\' Hanz Oil Tank','device_registers','8','INSERT','15\' Hanz Oil Tank configured with Savy tag','2016-10-20 21:49:20',1),(911,1,'15\' Hanz Oil Tank','device_registers','10','INSERT','15\' Hanz Oil Tank configured with Critical Mass tag','2016-10-20 21:49:20',1),(912,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-10-21 17:23:28',1),(913,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-10-21 18:20:48',1),(914,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-10-22 02:33:20',1),(915,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-10-23 16:30:05',1),(916,5,'Omni Consolidated 123','accounts','5','UPDATE','Account - Omni Consolidated 123 modified','2016-10-23 16:53:39',1),(917,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-10-23 16:56:16',1),(918,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-11-07 13:15:39',1),(919,5,'Objects','modules','24','UPDATE','Module - Objects modified','2016-11-07 14:01:14',1),(920,5,'Devices','modules','0','INSERT','New module - Devices created','2016-11-07 14:02:02',1),(921,5,'Measurements','modules','40','UPDATE','Module - Measurements modified','2016-11-07 14:02:54',1),(922,5,'Modules','modules','25','UPDATE','Module - Modules modified','2016-11-07 14:03:28',1),(923,1,'Super User','group_permissions','1','INSERT','Super User granted access to Admin','2016-11-07 14:05:21',1),(924,1,'Super User','group_permissions','1','INSERT','Super User granted access to System','2016-11-07 14:05:21',1),(925,1,'Super User','group_permissions','1','INSERT','Super User granted access to Accounts','2016-11-07 14:05:21',1),(926,1,'Super User','group_permissions','1','INSERT','Super User granted access to Admin Log','2016-11-07 14:05:21',1),(927,1,'Super User','group_permissions','1','INSERT','Super User granted access to Objects','2016-11-07 14:05:21',1),(928,1,'Super User','group_permissions','1','INSERT','Super User granted access to Devices','2016-11-07 14:05:21',1),(929,1,'Super User','group_permissions','1','INSERT','Super User granted access to Measurements','2016-11-07 14:05:21',1),(930,1,'Super User','group_permissions','1','INSERT','Super User granted access to Modules','2016-11-07 14:05:21',1),(931,1,'Super User','group_permissions','1','INSERT','Super User granted access to Departments','2016-11-07 14:05:21',1),(932,1,'Super User','group_permissions','1','INSERT','Super User granted access to Groups','2016-11-07 14:05:21',1),(933,1,'Super User','group_permissions','1','INSERT','Super User granted access to Sites','2016-11-07 14:05:21',1),(934,1,'Super User','group_permissions','1','INSERT','Super User granted access to Users','2016-11-07 14:05:21',1),(935,1,'Super User','group_permissions','1','INSERT','Super User granted access to Dashboard','2016-11-07 14:05:21',1),(936,1,'Super User','group_permissions','1','INSERT','Super User granted access to Help','2016-11-07 14:05:21',1),(937,1,'Super User','group_permissions','1','INSERT','Super User granted access to Submit Ticket','2016-11-07 14:05:21',1),(938,1,'Super User','group_permissions','1','INSERT','Super User granted access to Tickets','2016-11-07 14:05:21',1),(939,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-11-07 14:05:33',1),(940,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-11-07 15:10:39',1),(941,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-11-07 17:06:58',1),(942,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-11-07 18:13:50',1),(943,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-11-07 18:44:55',1),(944,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-11-07 22:18:47',1),(945,1,'Omni Consolidated','accounts','5','UPDATE','Account - Omni Consolidated modified','2016-11-07 22:20:51',1),(946,1,'Fred123','accounts','8','UPDATE','Account - Fred123  deactivated','2016-11-07 22:20:58',1),(947,1,'Jackson\'s Drilling','accounts','9','INSERT','New account - Jackson\'s Drilling added','2016-11-07 22:21:38',1),(948,1,'Jackson\'s Drilling Co.','accounts','9','UPDATE','Account - Jackson\'s Drilling Co. modified','2016-11-07 22:22:00',1),(949,1,'Jackson\'s Drilling Co.','accounts','9','UPDATE','Account - Jackson\'s Drilling Co. modified','2016-11-07 22:22:11',1),(950,1,'Jackson\'s Drilling Co.','accounts','9','UPDATE','Account - Jackson\'s Drilling Co.  reactivated','2016-11-07 22:22:16',1),(951,1,'Tank Stick','devices','1','INSERT','New device - Tank Stick added','2016-11-07 23:05:02',1),(952,1,'Transducer','devices','2','INSERT','New device - Transducer added','2016-11-07 23:05:32',1),(953,1,'Transfer Pump','devices','3','INSERT','New device - Transfer Pump added','2016-11-07 23:05:54',1),(954,1,'Oil Tank','objects','1','INSERT','New object - Oil Tank added','2016-11-07 23:17:55',1),(955,1,'Oil Tank','objects','1','UPDATE','Account - Oil Tank modified','2016-11-07 23:21:34',1),(956,1,'Oil Tank','objects','1','UPDATE','Account - Oil Tank modified','2016-11-07 23:21:55',1),(957,1,'Oil Tank','objects','1','UPDATE','Account - Oil Tank modified','2016-11-07 23:24:23',1),(958,1,'Oil Tank','objects','1','UPDATE','Object - Oil Tank modified','2016-11-07 23:26:12',1),(959,1,'Oil Tank','objects','1','UPDATE','Object - Oil Tank modified','2016-11-07 23:27:01',1),(960,1,'Oil Tank','objects','1','UPDATE','Object - Oil Tank modified','2016-11-07 23:27:10',1),(961,1,'Oil Tank','objects','1','UPDATE','Object - Oil Tank modified','2016-11-07 23:28:27',1),(962,1,'Oil Tank','objects','1','UPDATE','Object - Oil Tank modified','2016-11-07 23:33:29',1),(963,1,'Oil Tank','objects','1','UPDATE','Object - Oil Tank modified','2016-11-07 23:33:55',1),(964,1,'Oil Tank','object_devices','1','INSERT','Oil Tank configured with Tank Stick tag','2016-11-07 23:33:55',1),(965,1,'Oil Tank','objects','1','UPDATE','Object - Oil Tank modified','2016-11-07 23:34:19',1),(966,1,'Oil Tank','object_devices','1','INSERT','Oil Tank configured with Tank Stick tag','2016-11-07 23:34:20',1),(967,1,'Oil Tank','object_devices','2','INSERT','Oil Tank configured with Transducer tag','2016-11-07 23:34:20',1),(968,1,'Oil Tank','objects','1','UPDATE','Object - Oil Tank modified','2016-11-07 23:35:03',1),(969,1,'Oil Tank','object_devices','3','INSERT','Oil Tank configured with Transfer Pump tag','2016-11-07 23:35:03',1),(970,1,'Oil Tank','objects','1','DELETE','Object - Oil Tank deleted','2016-11-07 23:35:20',1),(971,1,'Oil Tank','objects','2','INSERT','New object - Oil Tank added','2016-11-07 23:36:07',1),(972,1,'Oil Tank','object_devices','1','INSERT','Oil Tank configured with Tank Stick tag','2016-11-07 23:36:07',1),(973,1,'Oil Tank','object_devices','2','INSERT','Oil Tank configured with Transducer tag','2016-11-07 23:36:07',1),(974,1,'Oil Tank','objects','2','UPDATE','Object - Oil Tank  deactivated','2016-11-07 23:36:21',1),(975,1,'Oil Tank','objects','2','UPDATE','Object - Oil Tank  reactivated','2016-11-07 23:36:27',1),(976,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-11-08 00:13:11',1),(977,1,'Tags','modules','41','INSERT','New module - Tags created','2016-11-08 00:18:14',1),(978,1,'Modules','modules','25','UPDATE','Module - Modules modified','2016-11-08 00:18:33',1),(979,1,'Super User','group_permissions','1','INSERT','Super User granted access to Admin','2016-11-08 00:20:05',1),(980,1,'Super User','group_permissions','1','INSERT','Super User granted access to System','2016-11-08 00:20:05',1),(981,1,'Super User','group_permissions','1','INSERT','Super User granted access to Accounts','2016-11-08 00:20:05',1),(982,1,'Super User','group_permissions','1','INSERT','Super User granted access to Admin Log','2016-11-08 00:20:05',1),(983,1,'Super User','group_permissions','1','INSERT','Super User granted access to Objects','2016-11-08 00:20:05',1),(984,1,'Super User','group_permissions','1','INSERT','Super User granted access to Measurements','2016-11-08 00:20:05',1),(985,1,'Super User','group_permissions','1','INSERT','Super User granted access to Tags','2016-11-08 00:20:05',1),(986,1,'Super User','group_permissions','1','INSERT','Super User granted access to Modules','2016-11-08 00:20:05',1),(987,1,'Super User','group_permissions','1','INSERT','Super User granted access to Departments','2016-11-08 00:20:05',1),(988,1,'Super User','group_permissions','1','INSERT','Super User granted access to Groups','2016-11-08 00:20:05',1),(989,1,'Super User','group_permissions','1','INSERT','Super User granted access to Sites','2016-11-08 00:20:05',1),(990,1,'Super User','group_permissions','1','INSERT','Super User granted access to Users','2016-11-08 00:20:05',1),(991,1,'Super User','group_permissions','1','INSERT','Super User granted access to Dashboard','2016-11-08 00:20:05',1),(992,1,'Super User','group_permissions','1','INSERT','Super User granted access to Help','2016-11-08 00:20:05',1),(993,1,'Super User','group_permissions','1','INSERT','Super User granted access to Submit Ticket','2016-11-08 00:20:05',1),(994,1,'Super User','group_permissions','1','INSERT','Super User granted access to Tickets','2016-11-08 00:20:05',1),(995,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-11-08 00:20:17',1),(996,1,'AST','tags','1','INSERT','New data point - AST added','2016-11-08 00:28:37',1),(997,1,'CST','tags','2','INSERT','New data point - CST added','2016-11-08 00:28:48',1),(998,1,'BST','tags','3','INSERT','New data point - BST added','2016-11-08 00:29:02',1),(999,1,'AST','tags','1','UPDATE','Data point - AST modified','2016-11-08 00:29:50',1),(1000,1,'AST1','tags','1','UPDATE','Data point - AST1 modified','2016-11-08 00:30:06',1),(1001,1,'CST','tags','2','DELETE','Tag - CST deleted','2016-11-08 00:30:24',1),(1002,1,'AST','tags','1','UPDATE','Data point - AST modified','2016-11-08 00:30:34',1),(1003,1,'AST','tags','1','UPDATE','Tag - AST  deactivated','2016-11-08 00:30:40',1),(1004,1,'CST','tags','4','INSERT','New data point - CST added','2016-11-08 00:30:50',1),(1005,1,'CST','tags','4','DELETE','Tag - CST deleted','2016-11-08 00:30:58',1),(1006,1,'CST','tags','5','INSERT','New data point - CST added','2016-11-08 00:31:07',1),(1007,1,'AST','tags','1','UPDATE','Data point - AST modified','2016-11-08 00:31:21',1),(1008,1,'Level','measurements','1','INSERT','New object - Level added','2016-11-08 00:43:47',1),(1009,1,'Level','measurements','2','INSERT','New object - Level added','2016-11-08 00:45:12',1),(1010,1,'Level','measurements','0000000001','DELETE','Measurement - Level deleted','2016-11-08 00:45:59',1),(1011,1,'Level','measurements','0000000002','UPDATE','Measurement - Level  deactivated','2016-11-08 00:46:07',1),(1012,1,'Level','measurements','0000000002','DELETE','Measurement - Level deleted','2016-11-08 00:46:13',1),(1013,1,'Level','measurements','3','INSERT','New object - Level added','2016-11-08 00:46:23',1),(1014,1,'Level','measurements','4','INSERT','New object - Level added','2016-11-08 00:46:44',1),(1015,1,'Level','measurements','5','INSERT','New object - Level added','2016-11-08 00:50:25',1),(1016,1,'Level','measurements','0000000003','DELETE','Measurement - Level deleted','2016-11-08 00:50:53',1),(1017,1,'Level','measurements','0000000004','DELETE','Measurement - Level deleted','2016-11-08 00:51:01',1),(1018,1,'Level','measurements','0000000005','DELETE','Measurement - Level deleted','2016-11-08 00:51:06',1),(1019,1,'Level','measurements','6','INSERT','New object - Level added','2016-11-08 00:51:23',1),(1020,1,'Level','measurements','7','INSERT','New object - Level added','2016-11-08 00:52:11',1),(1021,1,'Level','measurements','0000000006','DELETE','Measurement - Level deleted','2016-11-08 00:52:27',1),(1022,1,'Level','measurements','0000000007','DELETE','Measurement - Level deleted','2016-11-08 00:52:38',1),(1023,1,'Level','measurements','8','INSERT','New object - Level added','2016-11-08 00:53:01',1),(1024,1,'Level','measurements','0000000008','UPDATE','Object - Level modified','2016-11-08 00:55:03',1),(1025,1,'Level','measurements','0000000008','UPDATE','Object - Level modified','2016-11-08 00:56:02',1),(1026,1,'Level','measurements','0000000008','UPDATE','Object - Level modified','2016-11-08 00:56:28',1),(1027,1,'Level','measurements','0000000008','UPDATE','Object - Level modified','2016-11-08 00:56:39',1),(1028,1,'Level','measurements','0000000008','UPDATE','Object - Level modified','2016-11-08 00:57:19',1),(1029,1,'Level','measurements','0000000008','UPDATE','Object - Level modified','2016-11-08 00:58:36',1),(1030,1,'Level','measurements','0000000008','UPDATE','Object - Level modified','2016-11-08 00:59:33',1),(1031,1,'Level','measurements','0000000008','UPDATE','Object - Level modified','2016-11-08 01:00:36',1),(1032,1,'Level','measurements','0000000008','UPDATE','Object - Level modified','2016-11-08 01:06:05',1),(1033,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-11-08 01:59:28',1),(1034,1,'Level','measurements','0000000008','UPDATE','Object - Level modified','2016-11-08 01:59:52',1),(1035,1,'Level','measurements','0000000008','UPDATE','Object - Level modified','2016-11-08 02:06:35',1),(1036,1,'Level','measurements','0000000008','UPDATE','Object - Level modified','2016-11-08 02:17:09',1),(1037,1,'Level','measurement_tags','1','INSERT','Level configured with AST tag','2016-11-08 02:17:10',1),(1038,1,'Temperature','measurements','9','INSERT','New object - Temperature added','2016-11-08 02:18:46',1),(1039,1,'Temperature','measurements','0000000009','UPDATE','Object - Temperature modified','2016-11-08 02:19:14',1),(1040,1,'Temperature','measurement_tags','1','INSERT','Temperature configured with AST tag','2016-11-08 02:19:14',1),(1041,1,'Pressure','measurements','10','INSERT','New object - Pressure added','2016-11-08 02:19:39',1),(1042,1,'Pressure','measurements','11','INSERT','New object - Pressure added','2016-11-08 02:20:08',1),(1043,1,'Pressure','measurement_tags','1','INSERT','Pressure configured with AST tag','2016-11-08 02:20:08',1),(1044,1,'Pressure','measurement_tags','3','INSERT','Pressure configured with BST tag','2016-11-08 02:20:08',1),(1045,1,'Pressure','measurements','0000000010','DELETE','Measurement - Pressure deleted','2016-11-08 02:20:42',1),(1046,1,'Pressure','measurements','0000000011','UPDATE','Object - Pressure modified','2016-11-08 02:20:50',1),(1047,1,'Pressure','measurement_tags','3','INSERT','Pressure configured with BST tag','2016-11-08 02:20:50',1),(1048,1,'Cookin','measurements','12','INSERT','New object - Cookin added','2016-11-08 02:23:58',1),(1049,1,'Cookin','measurement_tags','1','INSERT','Cookin configured with AST tag','2016-11-08 02:23:58',1),(1050,1,'Cookin','measurement_tags','5','INSERT','Cookin configured with CST tag','2016-11-08 02:23:58',1),(1051,1,'Cookin','measurement_tags','3','INSERT','Cookin configured with BST tag','2016-11-08 02:23:58',1),(1052,1,'Cookin','measurements','0000000012','UPDATE','Object - Cookin modified','2016-11-08 02:24:13',1),(1053,1,'Cookin','measurements','0000000012','UPDATE','Object - Cookin modified','2016-11-08 02:24:22',1),(1054,1,'Cookin','measurement_tags','1','INSERT','Cookin configured with AST tag','2016-11-08 02:24:22',1),(1055,1,'Cookin','measurement_tags','5','INSERT','Cookin configured with CST tag','2016-11-08 02:24:22',1),(1056,1,'Sleepin','measurements','13','INSERT','New object - Sleepin added','2016-11-08 02:24:52',1),(1057,1,'Sleepin','measurement_tags','1','INSERT','Sleepin configured with AST tag','2016-11-08 02:24:52',1),(1058,1,'Sleepin','measurement_tags','5','INSERT','Sleepin configured with CST tag','2016-11-08 02:24:52',1),(1059,1,'Sleepin','measurements','14','INSERT','New object - Sleepin added','2016-11-08 02:26:11',1),(1060,1,'Sleepin','measurement_tags','1','INSERT','Sleepin configured with AST tag','2016-11-08 02:26:11',1),(1061,1,'Sleepin','measurement_tags','5','INSERT','Sleepin configured with CST tag','2016-11-08 02:26:11',1),(1062,1,'Sleepin','measurements','0000000013','DELETE','Measurement - Sleepin deleted','2016-11-08 02:28:54',1),(1063,1,'Sleepin','measurements','0000000014','DELETE','Measurement - Sleepin deleted','2016-11-08 02:29:04',1),(1064,1,'Cookin','measurements','0000000012','DELETE','Measurement - Cookin deleted','2016-11-08 02:29:11',1),(1065,1,'Cookin','measurements','15','INSERT','New object - Cookin added','2016-11-08 02:29:31',1),(1066,1,'Cookin','measurement_tags','1','INSERT','Cookin configured with AST tag','2016-11-08 02:29:31',1),(1067,1,'Cookin','measurement_tags','5','INSERT','Cookin configured with CST tag','2016-11-08 02:29:31',1),(1068,1,'Cookin','measurements','0000000015','UPDATE','Object - Cookin modified','2016-11-08 02:29:50',1),(1069,1,'Cookin','measurement_tags','5','INSERT','Cookin configured with CST tag','2016-11-08 02:29:50',1),(1070,1,'Temperature','measurements','0000000009','UPDATE','Object - Temperature modified','2016-11-08 02:30:45',1),(1071,1,'Temperature','measurement_tags','1','INSERT','Temperature configured with AST tag','2016-11-08 02:30:45',1),(1072,1,'Temperature','measurement_tags','3','INSERT','Temperature configured with BST tag','2016-11-08 02:30:45',1),(1073,1,'Temperature','measurements','0000000009','UPDATE','Measurement - Temperature modified','2016-11-08 02:34:55',1),(1074,1,'Temperature','measurement_tags','3','INSERT','Temperature configured with BST tag','2016-11-08 02:34:55',1),(1075,1,'Cookin','measurements','0000000015','DELETE','Measurement - Cookin deleted','2016-11-08 02:37:59',1),(1076,1,'Test\'s','measurements','16','INSERT','New measurement - Test\'s added','2016-11-08 02:40:13',1),(1077,1,'Test\'s','measurement_tags','1','INSERT','Test\'s configured with AST tag','2016-11-08 02:40:13',1),(1078,1,'Test\'s','measurement_tags','3','INSERT','Test\'s configured with BST tag','2016-11-08 02:40:13',1),(1079,1,'Test\'s','measurements','0000000016','UPDATE','Measurement - Test\'s modified','2016-11-08 02:40:21',1),(1080,1,'Test\'s','measurement_tags','3','INSERT','Test\'s configured with BST tag','2016-11-08 02:40:21',1),(1081,1,'Test\'s','measurements','0000000016','DELETE','Measurement - Test\'s deleted','2016-11-08 02:40:50',1),(1082,1,'Super User','group_permissions','1','INSERT','Super User granted access to Admin','2016-11-08 02:41:33',1),(1083,1,'Super User','group_permissions','1','INSERT','Super User granted access to System','2016-11-08 02:41:33',1),(1084,1,'Super User','group_permissions','1','INSERT','Super User granted access to Accounts','2016-11-08 02:41:33',1),(1085,1,'Super User','group_permissions','1','INSERT','Super User granted access to Admin Log','2016-11-08 02:41:33',1),(1086,1,'Super User','group_permissions','1','INSERT','Super User granted access to Objects','2016-11-08 02:41:33',1),(1087,1,'Super User','group_permissions','1','INSERT','Super User granted access to Devices','2016-11-08 02:41:33',1),(1088,1,'Super User','group_permissions','1','INSERT','Super User granted access to Measurements','2016-11-08 02:41:33',1),(1089,1,'Super User','group_permissions','1','INSERT','Super User granted access to Tags','2016-11-08 02:41:33',1),(1090,1,'Super User','group_permissions','1','INSERT','Super User granted access to Modules','2016-11-08 02:41:33',1),(1091,1,'Super User','group_permissions','1','INSERT','Super User granted access to Departments','2016-11-08 02:41:33',1),(1092,1,'Super User','group_permissions','1','INSERT','Super User granted access to Groups','2016-11-08 02:41:33',1),(1093,1,'Super User','group_permissions','1','INSERT','Super User granted access to Sites','2016-11-08 02:41:33',1),(1094,1,'Super User','group_permissions','1','INSERT','Super User granted access to Users','2016-11-08 02:41:33',1),(1095,1,'Super User','group_permissions','1','INSERT','Super User granted access to Dashboard','2016-11-08 02:41:33',1),(1096,1,'Super User','group_permissions','1','INSERT','Super User granted access to Help','2016-11-08 02:41:33',1),(1097,1,'Super User','group_permissions','1','INSERT','Super User granted access to Submit Ticket','2016-11-08 02:41:33',1),(1098,1,'Super User','group_permissions','1','INSERT','Super User granted access to Tickets','2016-11-08 02:41:33',1),(1099,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-11-08 02:41:47',1),(1100,1,'Cookin','measurements','17','INSERT','New measurement - Cookin added','2016-11-08 03:15:52',1),(1101,1,'Cookin','measurement_tags','1','INSERT','Cookin configured with AST tag','2016-11-08 03:15:52',1),(1102,1,'Cookin','measurements','0000000017','DELETE','Measurement - Cookin deleted','2016-11-08 03:18:05',1),(1103,1,'Cookin','measurements','18','INSERT','New measurement - Cookin added','2016-11-08 03:18:34',1),(1104,1,'Cookin','measurement_tags','1','INSERT','Cookin configured with AST tag','2016-11-08 03:18:34',1),(1105,1,'Cookin','measurements','0000000018','UPDATE','Measurement - Cookin modified','2016-11-08 03:19:06',1),(1106,1,'Cookin','measurement_tags','1','INSERT','Cookin configured with AST tag','2016-11-08 03:19:06',1),(1107,1,'Level','measurements','0000000008','UPDATE','Measurement - Level modified','2016-11-08 03:35:01',1),(1108,1,'Level','measurement_tags','3','INSERT','Level configured with BST tag','2016-11-08 03:35:01',1),(1109,1,'Test\'s','devices','4','INSERT','New device - Test\'s added','2016-11-08 03:43:15',1),(1110,1,'Test\'s','devices','5','INSERT','New device - Test\'s added','2016-11-08 03:45:09',1),(1111,1,'Test\'s','devices','4','DELETE','Device - Test\'s deleted','2016-11-08 03:50:10',1),(1112,1,'Test\'s','devices','5','DELETE','Device - Test\'s deleted','2016-11-08 03:50:22',1),(1113,1,'Fred\'s','devices','6','INSERT','New device - Fred\'s added','2016-11-08 03:50:38',1),(1114,1,'Fred\'s','device_measurements','0000000008','INSERT','Fred\'s configured with Level measurement','2016-11-08 03:50:38',1),(1115,1,'Fred\'s','device_measurements','0000000009','INSERT','Fred\'s configured with Temperature measurement','2016-11-08 03:50:38',1),(1116,1,'Fred\'s','devices','6','UPDATE','Device - Fred\'s modified','2016-11-08 03:52:05',1),(1117,1,'Fred\'s','device_measurements','0000000011','INSERT','Fred\'s configured with Pressure measurement','2016-11-08 03:52:05',1),(1118,1,'Fred\'s','devices','6','DELETE','Device - Fred\'s deleted','2016-11-08 03:52:39',1),(1119,1,'Tank Stick','devices','1','UPDATE','Device - Tank Stick modified','2016-11-08 03:52:54',1),(1120,1,'Tank Stick','device_measurements','0000000008','INSERT','Tank Stick configured with Level measurement','2016-11-08 03:52:54',1),(1121,1,'Tank Stick','devices','1','UPDATE','Device - Tank Stick modified','2016-11-08 04:00:56',1),(1122,1,'Tank Stick','device_measurements','0000000008','INSERT','Tank Stick configured with Level measurement','2016-11-08 04:00:56',1),(1123,1,'Tank Stick','device_measurements','0000000011','INSERT','Tank Stick configured with Pressure measurement','2016-11-08 04:00:56',1),(1124,1,'Tank Stick','devices','1','UPDATE','Device - Tank Stick modified','2016-11-08 04:01:05',1),(1125,1,'Tank Stick','device_measurements','0000000008','INSERT','Tank Stick configured with Level measurement','2016-11-08 04:01:05',1),(1126,1,'Fred\'s','devices','7','INSERT','New device - Fred\'s added','2016-11-08 04:01:20',1),(1127,1,'Fred\'s','device_measurements','0000000008','INSERT','Fred\'s configured with Level measurement','2016-11-08 04:01:20',1),(1128,1,'Fred\'s','device_measurements','0000000009','INSERT','Fred\'s configured with Temperature measurement','2016-11-08 04:01:21',1),(1129,1,'Fred\'s','devices','7','UPDATE','Device - Fred\'s modified','2016-11-08 04:01:36',1),(1130,1,'Fred\'s','device_measurements','0000000018','INSERT','Fred\'s configured with Cookin measurement','2016-11-08 04:01:36',1),(1131,1,'Fred\'s','devices','7','DELETE','Device - Fred\'s deleted','2016-11-08 04:03:11',1),(1132,1,'Fred','devices','8','INSERT','New device - Fred added','2016-11-08 04:03:29',1),(1133,1,'Fred','device_measurements','0000000008','INSERT','Fred configured with Level measurement','2016-11-08 04:03:29',1),(1134,1,'Fred','device_measurements','0000000009','INSERT','Fred configured with Temperature measurement','2016-11-08 04:03:29',1),(1135,1,'Fred','devices','8','DELETE','Device - Fred deleted','2016-11-08 04:03:51',1),(1136,1,'Level','device_measurements','0000000008','DELETE','Device measurement - Level deleted','2016-11-08 04:13:53',1),(1137,1,'Tank Stick','devices','1','UPDATE','Device - Tank Stick modified','2016-11-08 04:18:34',1),(1138,1,'Tank Stick','device_measurements','0000000008','INSERT','Tank Stick configured with Level measurement','2016-11-08 04:18:34',1),(1139,1,'Tank Stick','device_measurements','0000000009','INSERT','Tank Stick configured with Temperature measurement','2016-11-08 04:18:34',1),(1140,1,'Lucy\'s','devices','9','INSERT','New device - Lucy\'s added','2016-11-08 04:19:29',1),(1141,1,'Lucy\'s','device_measurements','0000000008','INSERT','Lucy\'s configured with Level measurement','2016-11-08 04:19:29',1),(1142,1,'Lucy\'s','device_measurements','0000000011','INSERT','Lucy\'s configured with Pressure measurement','2016-11-08 04:19:29',1),(1143,1,'Lucy\'s','devices','10','INSERT','New device - Lucy\'s added','2016-11-08 04:20:18',1),(1144,1,'Lucy\'s','device_measurements','0000000008','INSERT','Lucy\'s configured with Level measurement','2016-11-08 04:20:18',1),(1145,1,'Lucy\'s','device_measurements','0000000011','INSERT','Lucy\'s configured with Pressure measurement','2016-11-08 04:20:18',1),(1146,1,'Lucy\'s','devices','10','DELETE','Device - Lucy\'s deleted','2016-11-08 04:27:41',1),(1147,1,'Oil Tank','objects','2','UPDATE','Object - Oil Tank  deactivated','2016-11-08 06:40:55',1),(1148,1,'123','objects','3','INSERT','New object - 123 added','2016-11-08 06:42:32',1),(1149,1,'123','object_devices','1','INSERT','123 configured with Tank Stick device','2016-11-08 06:42:32',1),(1150,1,'123','objects','3','UPDATE','Object - 123 modified','2016-11-08 06:51:01',1),(1151,1,'123','object_devices','1','INSERT','123 configured with Tank Stick device','2016-11-08 06:51:01',1),(1152,1,'456','objects','3','UPDATE','Object - 456 modified','2016-11-08 06:51:15',1),(1153,1,'456','object_devices','1','INSERT','456 configured with Tank Stick device','2016-11-08 06:51:16',1),(1154,1,'456','object_devices','2','INSERT','456 configured with Transducer device','2016-11-08 06:51:16',1),(1155,1,'456','object_devices','3','INSERT','456 configured with Transfer Pump device','2016-11-08 06:51:16',1),(1156,1,'456','objects','3','UPDATE','Object - 456 modified','2016-11-08 06:51:38',1),(1157,1,'456','object_devices','1','INSERT','456 configured with Tank Stick device','2016-11-08 06:51:38',1),(1158,1,'456','object_devices','2','INSERT','456 configured with Transducer device','2016-11-08 06:51:38',1),(1159,1,'456','object_devices','3','INSERT','456 configured with Transfer Pump device','2016-11-08 06:51:38',1),(1160,1,'456','objects','3','UPDATE','Object - 456 modified','2016-11-08 06:51:47',1),(1161,1,'456','object_devices','1','INSERT','456 configured with Tank Stick device','2016-11-08 06:51:47',1),(1162,1,'456','object_devices','2','INSERT','456 configured with Transducer device','2016-11-08 06:51:47',1),(1163,1,'456','object_devices','3','INSERT','456 configured with Transfer Pump device','2016-11-08 06:51:47',1),(1164,1,'Oil Tank','objects','2','UPDATE','Object - Oil Tank  reactivated','2016-11-08 06:51:54',1),(1165,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-11-08 15:33:58',1),(1166,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-11-08 15:34:34',1),(1167,1,'Water Tank','objects','3','UPDATE','Object - Water Tank modified','2016-11-08 15:35:59',1),(1168,1,'Water Tank','object_devices','1','INSERT','Water Tank configured with Tank Stick device','2016-11-08 15:35:59',1),(1169,1,'Water Tank','object_devices','2','INSERT','Water Tank configured with Transducer device','2016-11-08 15:35:59',1),(1170,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-11-08 17:03:13',1),(1171,5,'Test\'s','objects','4','INSERT','New object - Test\'s added','2016-11-08 18:01:13',1),(1172,5,'Test\'s','object_devices','1','INSERT','Test\'s configured with Tank Stick device','2016-11-08 18:01:13',1),(1173,5,'Test\'s','object_devices','3','INSERT','Test\'s configured with Transfer Pump device','2016-11-08 18:01:13',1),(1174,5,'Test\'s','objects','4','UPDATE','Object - Test\'s  deactivated','2016-11-08 18:09:14',1),(1175,5,'Test\'s','objects','4','UPDATE','Object - Test\'s  reactivated','2016-11-08 18:09:23',1),(1176,5,'Level','device_measurements','0000000008','DELETE','Device measurement - Level deleted','2016-11-08 18:35:55',1),(1177,5,'!Test 456','sites','32','UPDATE','Site - !Test 456  deactivated','2016-11-08 18:53:32',1),(1178,5,'123 Give it to Me','sites','34','UPDATE','Site - 123 Give it to Me modified','2016-11-08 19:19:42',1),(1179,5,'123 Give it to Me','sites','34','UPDATE','Site - 123 Give it to Me modified','2016-11-08 19:19:55',1),(1180,5,'123 Give it to Me','sites','34','UPDATE','Site - 123 Give it to Me modified','2016-11-08 19:22:22',1),(1181,5,'123 Give it to Me','sites','34','UPDATE','Site - 123 Give it to Me modified','2016-11-08 19:23:07',1),(1182,5,'123 Give it to Me','sites','34','UPDATE','Site - 123 Give it to Me modified','2016-11-08 19:24:09',1),(1183,5,'123 Give it to Me','site_objects','2','INSERT','123 Give it to Me configured with Oil Tank object','2016-11-08 19:24:09',1),(1184,5,'123 Give it to Me','site_objects','3','INSERT','123 Give it to Me configured with Water Tank object','2016-11-08 19:24:09',1),(1185,5,'Transducer','devices','2','UPDATE','Device - Transducer modified','2016-11-08 19:33:49',1),(1186,5,'Transducer','device_measurements','0000000008','INSERT','Transducer configured with Level measurement','2016-11-08 19:33:49',1),(1187,5,'Transducer','device_measurements','0000000011','INSERT','Transducer configured with Pressure measurement','2016-11-08 19:33:50',1),(1188,5,'Transducer','device_measurements','0000000018','INSERT','Transducer configured with Cookin measurement','2016-11-08 19:33:50',1),(1189,5,'Oil Tank','objects','2','UPDATE','Object - Oil Tank  deactivated','2016-11-08 19:35:24',1),(1190,5,'Becca\'s Object','objects','5','INSERT','New object - Becca\'s Object added','2016-11-08 19:38:52',1),(1191,5,'Becca\'s Object','object_devices','1','INSERT','Becca\'s Object configured with Tank Stick device','2016-11-08 19:38:52',1),(1192,5,'Becca\'s Object','object_devices','2','INSERT','Becca\'s Object configured with Transducer device','2016-11-08 19:38:52',1),(1193,5,'Oil Tank','objects','2','UPDATE','Object - Oil Tank  reactivated','2016-11-08 19:39:14',1),(1194,5,'Oil Tank','objects','2','UPDATE','Object - Oil Tank  deactivated','2016-11-08 19:39:35',1),(1195,5,'Level','measurements','0000000008','UPDATE','Measurement - Level  deactivated','2016-11-08 19:39:59',1),(1196,5,'Level','measurements','0000000008','UPDATE','Measurement - Level  reactivated','2016-11-08 19:41:26',1),(1197,5,'Level','measurements','0000000008','UPDATE','Measurement - Level  deactivated','2016-11-08 19:42:36',1),(1198,1,'John Miles','users','41','UPDATE','User - jmiles  deactivated','2016-11-08 19:55:49',1),(1199,1,'Jessica','sites','24','UPDATE','Site - Jessica modified','2016-11-08 19:58:53',1),(1200,1,'Jessica','site_objects','3','INSERT','Jessica configured with Water Tank object','2016-11-08 19:58:53',1),(1201,1,'Jessica','site_objects','4','INSERT','Jessica configured with Test\'s object','2016-11-08 19:58:53',1),(1202,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-11-08 21:10:15',1),(1203,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-11-09 04:45:53',1),(1204,1,'Administration','departments','1','UPDATE','Department - Administration  deactivated','2016-11-09 04:50:03',1),(1205,1,'Maintenance','departments','6','UPDATE','Department - Maintenance modified','2016-11-09 04:51:27',1),(1206,1,'Transfer Pump','devices','3','UPDATE','Device - Transfer Pump  deactivated','2016-11-09 04:54:03',1),(1207,1,'Transfer Pump','devices','3','UPDATE','Device - Transfer Pump  reactivated','2016-11-09 04:54:09',1),(1208,1,'Temperature','measurements','0000000009','UPDATE','Measurement - Temperature  deactivated','2016-11-09 04:55:20',1),(1209,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-11-09 05:36:21',1),(1210,1,'Fred\'s Drilling','accounts','3','UPDATE','Account - Fred\'s Drilling  deactivated','2016-11-09 05:50:33',1),(1211,1,'Fred\'s Drilling','accounts','3','UPDATE','Account - Fred\'s Drilling  reactivated','2016-11-09 05:50:39',1),(1212,1,'Fred\'s Drilling1','accounts','3','UPDATE','Account - Fred\'s Drilling1 modified','2016-11-09 05:50:58',1),(1213,1,'Fred\'s Drilling','accounts','3','UPDATE','Account - Fred\'s Drilling modified','2016-11-09 05:51:14',1),(1214,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-11-09 07:17:50',1),(1215,1,'Oil Tank1','objects','2','UPDATE','Object - Oil Tank1 modified','2016-11-09 07:18:17',1),(1216,1,'Oil Tank1','object_devices','1','INSERT','Oil Tank1 configured with Tank Stick device','2016-11-09 07:18:17',1),(1217,1,'Oil Tank1','object_devices','2','INSERT','Oil Tank1 configured with Transducer device','2016-11-09 07:18:17',1),(1218,1,'Oil Tank1','object_devices','3','INSERT','Oil Tank1 configured with Transfer Pump device','2016-11-09 07:18:17',1),(1219,1,'Oil Tank','objects','2','UPDATE','Object - Oil Tank modified','2016-11-09 07:18:31',1),(1220,1,'Oil Tank','object_devices','1','INSERT','Oil Tank configured with Tank Stick device','2016-11-09 07:18:31',1),(1221,1,'Oil Tank','object_devices','2','INSERT','Oil Tank configured with Transducer device','2016-11-09 07:18:31',1),(1222,1,'Oil Tank','object_devices','3','INSERT','Oil Tank configured with Transfer Pump device','2016-11-09 07:18:31',1),(1223,1,'Oil Tank','objects','2','UPDATE','Object - Oil Tank  deactivated','2016-11-09 07:23:26',1),(1224,1,'Oil Tank','objects','2','UPDATE','Object - Oil Tank modified','2016-11-09 07:23:40',1),(1225,1,'Oil Tank','object_devices','1','INSERT','Oil Tank configured with Tank Stick device','2016-11-09 07:23:40',1),(1226,1,'Oil Tank','object_devices','3','INSERT','Oil Tank configured with Transfer Pump device','2016-11-09 07:23:40',1),(1227,1,'1234','objects','6','INSERT','New object - 1234 added','2016-11-09 07:24:44',1),(1228,1,'1234','object_devices','1','INSERT','1234 configured with Tank Stick device','2016-11-09 07:24:44',1),(1229,1,'1234','object_devices','9','INSERT','1234 configured with Lucy\'s device','2016-11-09 07:24:44',1),(1230,1,'Lucy\'s1','devices','9','UPDATE','Device - Lucy\'s1 modified','2016-11-09 07:32:23',1),(1231,1,'Lucy\'s1','device_measurements','0000000011','INSERT','Lucy\'s1 configured with Pressure measurement','2016-11-09 07:32:23',1),(1232,1,'Lucy\'s1','device_measurements','0000000018','INSERT','Lucy\'s1 configured with Cookin measurement','2016-11-09 07:32:23',1),(1233,1,'Lucy\'s','devices','9','UPDATE','Device - Lucy\'s modified','2016-11-09 07:32:38',1),(1234,1,'Lucy\'s','device_measurements','0000000011','INSERT','Lucy\'s configured with Pressure measurement','2016-11-09 07:32:38',1),(1235,1,'Lucy\'s','devices','9','UPDATE','Device - Lucy\'s  deactivated','2016-11-09 07:33:05',1),(1236,1,'Lucy\'s','devices','9','UPDATE','Device - Lucy\'s  reactivated','2016-11-09 07:33:11',1),(1237,1,'Lucy\'s','devices','9','DELETE','Device - Lucy\'s deleted','2016-11-09 07:33:31',1),(1238,1,'1234','devices','11','INSERT','New device - 1234 added','2016-11-09 07:34:03',1),(1239,1,'1234','device_measurements','0000000011','INSERT','1234 configured with Pressure measurement','2016-11-09 07:34:03',1),(1240,1,'Cookin','device_measurements','0000000018','DELETE','Device measurement - Cookin deleted','2016-11-09 07:40:19',1),(1241,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-11-09 10:00:19',1),(1242,1,'Becca','measurements','19','INSERT','New measurement - Becca added','2016-11-09 10:04:42',1),(1243,1,'Becca','measurement_tags','1','INSERT','Becca configured with AST tag','2016-11-09 10:04:43',1),(1244,1,'Becca','measurement_tags','5','INSERT','Becca configured with CST tag','2016-11-09 10:04:43',1),(1245,1,'Becca','measurements','0000000019','UPDATE','Measurement - Becca  deactivated','2016-11-09 10:05:18',1),(1246,1,'Becca1','measurements','0000000019','UPDATE','Measurement - Becca1 modified','2016-11-09 10:05:41',1),(1247,1,'Becca1','measurement_tags','1','INSERT','Becca1 configured with AST tag','2016-11-09 10:05:41',1),(1248,1,'Becca1','measurement_tags','3','INSERT','Becca1 configured with BST tag','2016-11-09 10:05:41',1),(1249,1,'Becca1','measurement_tags','5','INSERT','Becca1 configured with CST tag','2016-11-09 10:05:41',1),(1250,1,'Pressure','measurements','0000000011','UPDATE','Measurement - Pressure modified','2016-11-09 10:06:11',1),(1251,1,'Pressure','measurement_tags','1','INSERT','Pressure configured with AST tag','2016-11-09 10:06:11',1),(1252,1,'Pressure','measurement_tags','3','INSERT','Pressure configured with BST tag','2016-11-09 10:06:11',1),(1253,1,'Pressure','measurements','0000000011','UPDATE','Measurement - Pressure modified','2016-11-09 10:06:36',1),(1254,1,'Pressure','measurement_tags','3','INSERT','Pressure configured with BST tag','2016-11-09 10:06:36',1),(1255,1,'Becca1','measurements','0000000019','UPDATE','Measurement - Becca1 modified','2016-11-09 10:07:05',1),(1256,1,'Becca1','measurements','0000000019','UPDATE','Measurement - Becca1 modified','2016-11-09 10:07:18',1),(1257,1,'Becca1','measurement_tags','1','INSERT','Becca1 configured with AST tag','2016-11-09 10:07:18',1),(1258,1,'Becca1','measurement_tags','3','INSERT','Becca1 configured with BST tag','2016-11-09 10:07:18',1),(1259,1,'Becca1','measurement_tags','5','INSERT','Becca1 configured with CST tag','2016-11-09 10:07:18',1),(1260,1,'Level','measurements','0000000008','UPDATE','Measurement - Level modified','2016-11-09 10:07:36',1),(1261,1,'Level','measurement_tags','1','INSERT','Level configured with AST tag','2016-11-09 10:07:37',1),(1262,1,'Level','measurement_tags','3','INSERT','Level configured with BST tag','2016-11-09 10:07:37',1),(1263,1,'Level','measurements','0000000008','UPDATE','Measurement - Level modified','2016-11-09 10:08:33',1),(1264,1,'Level','measurement_tags','1','INSERT','Level configured with AST tag','2016-11-09 10:08:33',1),(1265,1,'Level','measurement_tags','3','INSERT','Level configured with BST tag','2016-11-09 10:08:34',1),(1266,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-11-09 14:46:32',1),(1267,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-11-09 17:06:57',1),(1268,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-11-09 17:32:45',1),(1269,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-11-09 19:36:54',1),(1270,1,'Level1','measurements','8','UPDATE','Measurement - Level1 modified','2016-11-09 19:41:43',1),(1271,1,'Level1','measurement_tags','3','INSERT','Level1 configured with BST tag','2016-11-09 19:41:43',1),(1272,1,'Level1','measurements','8','UPDATE','Measurement - Level1 modified','2016-11-09 19:41:46',1),(1273,1,'Level1','measurement_tags','3','INSERT','Level1 configured with BST tag','2016-11-09 19:41:47',1),(1274,1,'Level1','measurements','8','UPDATE','Measurement - Level1 modified','2016-11-09 19:41:47',1),(1275,1,'Level1','measurement_tags','3','INSERT','Level1 configured with BST tag','2016-11-09 19:41:47',1),(1276,1,'Level1','measurements','8','UPDATE','Measurement - Level1 modified','2016-11-09 19:41:47',1),(1277,1,'Level1','measurement_tags','3','INSERT','Level1 configured with BST tag','2016-11-09 19:41:48',1),(1278,1,'Level1','measurements','8','UPDATE','Measurement - Level1 modified','2016-11-09 19:41:48',1),(1279,1,'Level1','measurement_tags','3','INSERT','Level1 configured with BST tag','2016-11-09 19:41:48',1),(1280,1,'Level1','measurements','8','UPDATE','Measurement - Level1 modified','2016-11-09 19:41:54',1),(1281,1,'Level1','measurement_tags','3','INSERT','Level1 configured with BST tag','2016-11-09 19:41:54',1),(1282,1,'Level1','measurements','8','UPDATE','Measurement - Level1 modified','2016-11-09 19:42:12',1),(1283,1,'Level1','measurement_tags','3','INSERT','Level1 configured with BST tag','2016-11-09 19:42:12',1),(1284,1,'Level1','measurements','8','UPDATE','Measurement - Level1 modified','2016-11-09 19:42:22',1),(1285,1,'Level1','measurement_tags','3','INSERT','Level1 configured with BST tag','2016-11-09 19:42:22',1),(1286,1,'Level','measurements','8','UPDATE','Measurement - Level modified','2016-11-09 19:42:37',1),(1287,1,'Level','measurement_tags','3','INSERT','Level configured with BST tag','2016-11-09 19:42:37',1),(1288,1,'123','measurements','20','INSERT','New measurement - 123 added','2016-11-09 19:43:05',1),(1289,1,'123','measurement_tags','1','INSERT','123 configured with AST tag','2016-11-09 19:43:05',1),(1290,1,'123','measurement_tags','5','INSERT','123 configured with CST tag','2016-11-09 19:43:05',1),(1291,1,'123','measurements','20','UPDATE','Measurement - 123  deactivated','2016-11-09 19:43:22',1),(1292,1,'123','measurements','20','UPDATE','Measurement - 123 modified','2016-11-09 19:43:37',1),(1293,1,'123','measurement_tags','1','INSERT','123 configured with AST tag','2016-11-09 19:43:37',1),(1294,1,'123','measurement_tags','5','INSERT','123 configured with CST tag','2016-11-09 19:43:37',1),(1295,1,'123','measurements','20','DELETE','Measurement - 123 deleted','2016-11-09 19:43:48',1),(1296,1,'123','tags','6','INSERT','New data point - 123 added','2016-11-09 19:44:48',1),(1297,1,'123456','tags','6','UPDATE','Data point - 123456 modified','2016-11-09 19:45:02',1),(1298,1,'123456','tags','6','UPDATE','Data point - 123456 modified','2016-11-09 19:45:11',1),(1299,1,'123456','tags','6','UPDATE','Tag - 123456  deactivated','2016-11-09 19:45:18',1),(1300,1,'123456','tags','6','UPDATE','Tag - 123456  reactivated','2016-11-09 19:45:23',1),(1301,1,'123456','tags','6','DELETE','Tag - 123456 deleted','2016-11-09 19:45:30',1),(1302,1,'Accounts','modules','22','UPDATE','Module - Accounts  reactivated','2016-11-09 19:46:43',1),(1303,1,'Accounts','modules','22','UPDATE','Module - Accounts  reactivated','2016-11-09 19:47:00',1),(1304,1,'Admin1','modules','20','UPDATE','Module - Admin1 modified','2016-11-09 20:14:52',1),(1305,1,'Admin','modules','20','UPDATE','Module - Admin modified','2016-11-09 20:15:02',1),(1306,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-11-09 21:06:17',1),(1307,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-11-09 22:32:18',1),(1308,1,'123','sites','35','INSERT','New site - 123 added','2016-11-09 23:00:47',1),(1309,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-11-10 00:04:47',1),(1310,1,'456','objects','7','INSERT','New object - 456 added','2016-11-10 00:05:26',1),(1311,1,'456','object_devices','1','INSERT','456 configured with Tank Stick device','2016-11-10 00:05:26',1),(1312,1,'456','object_devices','2','INSERT','456 configured with Transducer device','2016-11-10 00:05:26',1),(1313,1,'456s','objects','7','UPDATE','Object - 456s modified','2016-11-10 00:05:53',1),(1314,1,'456s','object_devices','1','INSERT','456s configured with Tank Stick device','2016-11-10 00:05:53',1),(1315,1,'456s','object_devices','11','INSERT','456s configured with 1234 device','2016-11-10 00:05:53',1),(1316,1,'456s','objects','7','DELETE','Object - 456s deleted','2016-11-10 00:06:03',1),(1317,1,'aaa','devices','12','INSERT','New device - aaa added','2016-11-10 00:06:40',1),(1318,1,'aaa','device_measurements','11','INSERT','aaa configured with Pressure measurement','2016-11-10 00:06:40',1),(1319,1,'aaa','device_measurements','19','INSERT','aaa configured with Becca1 measurement','2016-11-10 00:06:40',1),(1320,1,'aaa','devices','12','UPDATE','Device - aaa  deactivated','2016-11-10 00:06:48',1),(1321,1,'aaa','devices','12','UPDATE','Device - aaa  reactivated','2016-11-10 00:07:23',1),(1322,1,'1234','objects','6','UPDATE','Object - 1234 modified','2016-11-10 00:07:40',1),(1323,1,'1234','object_devices','1','INSERT','1234 configured with Tank Stick device','2016-11-10 00:07:40',1),(1324,1,'1234','object_devices','12','INSERT','1234 configured with aaa device','2016-11-10 00:07:41',1),(1325,1,'111111','measurements','21','INSERT','New measurement - 111111 added','2016-11-10 00:08:03',1),(1326,1,'111111','measurement_tags','1','INSERT','111111 configured with AST tag','2016-11-10 00:08:03',1),(1327,1,'ccccccc','measurements','21','UPDATE','Measurement - ccccccc modified','2016-11-10 00:08:17',1),(1328,1,'ccccccc','measurement_tags','1','INSERT','ccccccc configured with AST tag','2016-11-10 00:08:17',1),(1329,1,'ccccccc','measurements','21','DELETE','Measurement - ccccccc deleted','2016-11-10 00:08:23',1),(1330,1,'MAS','tags','7','INSERT','New data point - MAS added','2016-11-10 00:10:07',1),(1331,1,'MAS','tags','7','UPDATE','Data point - MAS modified','2016-11-10 00:10:23',1),(1332,1,'MAS','tags','7','DELETE','Tag - MAS deleted','2016-11-10 00:10:30',1),(1333,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-11-10 01:21:39',1),(1334,1,'gas','tags','8','INSERT','New data point - gas added','2016-11-10 01:24:26',1),(1335,1,'gas','tags','8','UPDATE','Tag - gas  deactivated','2016-11-10 01:24:38',1),(1336,1,'name','measurements','22','INSERT','New measurement - name added','2016-11-10 01:28:10',1),(1337,1,'name','measurement_tags','1','INSERT','name configured with AST tag','2016-11-10 01:28:10',1),(1338,1,'hanz','devices','13','INSERT','New device - hanz added','2016-11-10 01:39:29',1),(1339,1,'hanz','device_measurements','8','INSERT','hanz configured with Level measurement','2016-11-10 01:39:30',1),(1340,1,'hanz','device_measurements','11','INSERT','hanz configured with Pressure measurement','2016-11-10 01:39:30',1),(1341,1,'hanz','device_measurements','18','INSERT','hanz configured with Cookin measurement','2016-11-10 01:39:30',1),(1342,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-11-10 03:23:17',1),(1343,1,'fred','sites','36','INSERT','New site - fred added','2016-11-10 03:23:46',1),(1344,1,'1234','departments','0','INSERT','New department - 1234 added','2016-11-10 03:30:35',1),(1345,1,'1234567','departments','0','UPDATE','Department - 1234567 modified','2016-11-10 04:00:48',1),(1346,1,'1234567','departments','0','UPDATE','Department - 1234567 modified','2016-11-10 04:00:58',1),(1347,1,'456','devices','14','INSERT','New device - 456 added','2016-11-10 04:02:52',1),(1348,1,'456','device_measurements','11','INSERT','456 configured with Pressure measurement','2016-11-10 04:02:53',1),(1349,1,'456a','devices','14','UPDATE','Device - 456a modified','2016-11-10 04:03:13',1),(1350,1,'456a','device_measurements','8','INSERT','456a configured with Level measurement','2016-11-10 04:03:13',1),(1351,1,'456a','device_measurements','11','INSERT','456a configured with Pressure measurement','2016-11-10 04:03:13',1),(1352,1,'456a','devices','14','UPDATE','Device - 456a  reactivated','2016-11-10 04:03:26',1),(1353,1,'123456','groups','0','INSERT','New group - 123456 added','2016-11-10 04:03:58',1),(1354,1,'123456a','groups','0','UPDATE','Group - 123456a modified','2016-11-10 04:04:13',1),(1355,1,'123456a','groups','0','UPDATE','Group - 123456a modified','2016-11-10 04:04:29',1),(1356,1,'1234','measurements','23','INSERT','New measurement - 1234 added','2016-11-10 04:05:35',1),(1357,1,'1234','measurement_tags','1','INSERT','1234 configured with AST tag','2016-11-10 04:05:35',1),(1358,1,'1234','measurement_tags','5','INSERT','1234 configured with CST tag','2016-11-10 04:05:36',1),(1359,1,'1234a','measurements','23','UPDATE','Measurement - 1234a modified','2016-11-10 04:06:02',1),(1360,1,'1234a','measurement_tags','1','INSERT','1234a configured with AST tag','2016-11-10 04:06:02',1),(1361,1,'Temperature','measurements','9','UPDATE','Measurement - Temperature  reactivated','2016-11-10 04:06:57',1),(1362,1,'1234a','measurements','23','UPDATE','Measurement - 1234a  reactivated','2016-11-10 04:07:08',1),(1363,1,'1234aaa','measurements','24','INSERT','New measurement - 1234aaa added','2016-11-10 04:15:46',1),(1364,1,'1234aaa','measurement_tags','1','INSERT','1234aaa configured with AST tag','2016-11-10 04:15:46',1),(1365,1,'1234aaa444','measurements','24','UPDATE','Measurement - 1234aaa444 modified','2016-11-10 04:16:08',1),(1366,1,'1234aaa444','measurement_tags','1','INSERT','1234aaa444 configured with AST tag','2016-11-10 04:16:08',1),(1367,1,'1234aaa444','measurement_tags','3','INSERT','1234aaa444 configured with BST tag','2016-11-10 04:16:08',1),(1368,1,'1234aaa444','measurements','24','UPDATE','Measurement - 1234aaa444 modified','2016-11-10 04:16:30',1),(1369,1,'1234aaa444','measurement_tags','3','INSERT','1234aaa444 configured with BST tag','2016-11-10 04:16:30',1),(1370,1,'1234aaa444','measurements','24','UPDATE','Measurement - 1234aaa444  deactivated','2016-11-10 04:16:37',1),(1371,1,'123','modules','42','INSERT','New module - 123 created','2016-11-10 04:25:00',1),(1372,1,'123aa','modules','42','UPDATE','Module - 123aa modified','2016-11-10 04:25:17',1),(1373,1,'123aa','modules','42','DELETE','Module - 123aa deleted','2016-11-10 04:25:24',1),(1374,1,'Dashboard','modules','39','UPDATE','Module - Dashboard modified','2016-11-10 04:25:35',1),(1375,1,'sdtwgbw','objects','8','INSERT','New object - sdtwgbw added','2016-11-10 04:28:27',1),(1376,1,'sdtwgbw','object_devices','1','INSERT','sdtwgbw configured with Tank Stick device','2016-11-10 04:28:27',1),(1377,1,'sdtwgbw','objects','8','UPDATE','Object - sdtwgbw modified','2016-11-10 04:28:41',1),(1378,1,'sdtwgbw','object_devices','1','INSERT','sdtwgbw configured with Tank Stick device','2016-11-10 04:28:41',1),(1379,1,'sdtwgbw','object_devices','11','INSERT','sdtwgbw configured with 1234 device','2016-11-10 04:28:41',1),(1380,1,'sdtwgbw','object_devices','13','INSERT','sdtwgbw configured with hanz device','2016-11-10 04:28:41',1),(1381,1,'sdtwgbw','objects','8','UPDATE','Object - sdtwgbw modified','2016-11-10 04:28:53',1),(1382,1,'sdtwgbw','object_devices','1','INSERT','sdtwgbw configured with Tank Stick device','2016-11-10 04:28:53',1),(1383,1,'sdtwgbw','object_devices','11','INSERT','sdtwgbw configured with 1234 device','2016-11-10 04:28:53',1),(1384,1,'sdtwgbw','object_devices','13','INSERT','sdtwgbw configured with hanz device','2016-11-10 04:28:53',1),(1385,1,'sdtwgbw','objects','8','UPDATE','Object - sdtwgbw  deactivated','2016-11-10 04:28:57',1),(1386,1,'sdtwgbw','objects','8','UPDATE','Object - sdtwgbw  reactivated','2016-11-10 04:29:01',1),(1387,1,'wr5ty5y','sites','37','INSERT','New site - wr5ty5y added','2016-11-10 04:30:19',1),(1388,1,'wr5ty5y','site_objects','2','INSERT','wr5ty5y configured with Oil Tank object','2016-11-10 04:30:19',1),(1389,1,'wr5ty5yaaa','sites','37','UPDATE','Site - wr5ty5yaaa modified','2016-11-10 04:39:11',1),(1390,1,'wr5ty5yaaa','site_objects','2','INSERT','wr5ty5yaaa configured with Oil Tank object','2016-11-10 04:39:11',1),(1391,1,'wr5ty5yaaa','site_objects','5','INSERT','wr5ty5yaaa configured with Becca\'s Object object','2016-11-10 04:39:11',1),(1392,1,'aaaaaaaaaaa','tags','9','INSERT','New data point - aaaaaaaaaaa added','2016-11-10 04:40:17',1),(1393,1,'aaaaaaaaaaa123','tags','9','UPDATE','Data point - aaaaaaaaaaa123 modified','2016-11-10 04:40:32',1),(1394,1,'aaaaaaaaaaa123','tags','9','UPDATE','Data point - aaaaaaaaaaa123 modified','2016-11-10 04:40:50',1),(1395,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-11-10 12:57:28',1),(1396,1,'Savannah McCarroll','users','43','INSERT','New user - smccarroll added','2016-11-10 12:58:38',1),(1397,1,'Savannah McCarroll','user_departments','43','INSERT','Department - 1234567 assigned','2016-11-10 12:58:38',1),(1398,1,'Savannah McCarroll','user_groups','43','INSERT','Group - Super User assigned','2016-11-10 12:58:38',1),(1399,1,'Roy McCarroll','users','44','INSERT','New user - rmccarroll added','2016-11-10 13:11:25',1),(1400,1,'Roy McCarroll','user_departments','44','INSERT','Department - 1234567 assigned','2016-11-10 13:11:25',1),(1401,1,'Roy McCarroll','user_groups','44','INSERT','Group - Super User assigned','2016-11-10 13:11:25',1),(1402,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-11-10 15:46:18',1),(1403,1,'John Levinski','users','45','INSERT','New user - jlevinski added','2016-11-10 15:52:42',1),(1404,1,'John Levinski','user_departments','45','INSERT','Department - wwww123 assigned','2016-11-10 15:52:42',1),(1405,1,'John Levinski','user_departments','45','INSERT','Department - Fred assigned','2016-11-10 15:52:42',1),(1406,1,'John Levinski','user_groups','45','INSERT','Group - Account Admin assigned','2016-11-10 15:52:42',1),(1407,1,'John Levinski','user_groups','45','INSERT','Group - Manager assigned','2016-11-10 15:52:42',1),(1408,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-11-10 19:53:29',1),(1409,1,'John Levinski','users','45','UPDATE','User - jlevinski modified','2016-11-10 19:53:54',1),(1410,1,'John Levinski','users','45','UPDATE','User - jlevinski  reactivated','2016-11-10 20:04:21',1),(1411,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-11-10 21:50:43',1),(1412,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-11-11 03:44:03',1),(1413,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-11-11 04:09:10',1),(1414,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-11-14 17:07:48',1),(1415,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-11-14 19:37:17',1),(1416,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-11-14 21:27:45',1),(1417,1,'System','modules','21','UPDATE','Module - System modified','2016-11-14 21:28:21',1),(1418,1,'Departments','modules','27','UPDATE','Module - Departments modified','2016-11-14 21:28:45',1),(1419,1,'Groups','modules','28','UPDATE','Module - Groups modified','2016-11-14 21:28:55',1),(1420,1,'Sites','modules','29','UPDATE','Module - Sites modified','2016-11-14 21:29:03',1),(1421,1,'Users','modules','30','UPDATE','Module - Users modified','2016-11-14 21:29:16',1),(1422,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-11-14 23:24:00',0),(1423,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-11-15 01:56:12',0),(1424,1,'Sales','departments','7','UPDATE','Department - Sales modified','2016-11-15 02:15:24',1),(1425,1,'Fred','departments','9','DELETE','Department - Fred deleted','2016-11-15 02:15:32',1),(1426,1,'IT','departments','0','UPDATE','Department - IT modified','2016-11-15 02:16:01',1),(1427,1,'123456a','groups','0','DELETE','Group - 123456a deleted','2016-11-15 02:16:20',1),(1428,5,'Adam West','users','36','LOGIN','awest logged in','2016-11-15 02:17:09',0),(1429,5,'Adam West','users','36','LOGIN','awest logged in','2016-11-15 02:17:12',0),(1430,5,'Adam West','users','36','LOGIN','awest logged in','2016-11-15 02:17:14',0),(1431,5,'Adam West','users','36','LOGIN','awest logged in','2016-11-15 02:17:14',0),(1432,5,'Adam West','users','36','LOGIN','awest logged in','2016-11-15 02:17:14',0),(1433,5,'Adam West','users','36','LOGIN','awest logged in','2016-11-15 02:17:23',0),(1434,5,'Adam West','users','36','LOGIN','awest logged in','2016-11-15 02:18:42',0),(1435,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-11-15 02:19:09',0),(1436,5,'Adam West','users','36','LOGIN','awest logged in','2016-11-15 02:19:33',0),(1437,5,'Adam West','users','36','LOGIN','awest logged in','2016-11-15 02:20:36',0),(1438,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-11-15 02:22:01',0),(1439,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-11-15 05:36:17',0),(1440,5,'123 Show it to Me','sites','34','UPDATE','Site - 123 Show it to Me modified','2016-11-15 05:38:25',1),(1441,5,'123 Show it to Me','site_objects','2','INSERT','123 Show it to Me configured with Oil Tank object','2016-11-15 05:38:26',1),(1442,5,'123 Show it to Me','site_objects','3','INSERT','123 Show it to Me configured with Water Tank object','2016-11-15 05:38:26',1),(1443,5,'Landy\'s Revenge','sites','13','UPDATE','Site - Landy\'s Revenge modified','2016-11-15 05:40:24',1),(1444,5,'Landy\'s Revenge','site_objects','2','INSERT','Landy\'s Revenge configured with Oil Tank object','2016-11-15 05:40:24',1),(1445,5,'Landy\'s Revenge','site_objects','3','INSERT','Landy\'s Revenge configured with Water Tank object','2016-11-15 05:40:24',1),(1446,5,'Michael\'s Glory Hole','sites','11','UPDATE','Site - Michael\'s Glory Hole modified','2016-11-15 05:41:06',1),(1447,5,'Pontential is Everything','sites','12','UPDATE','Site - Pontential is Everything modified','2016-11-15 05:41:37',1),(1448,5,'Pontential is Everything','site_objects','2','INSERT','Pontential is Everything configured with Oil Tank object','2016-11-15 05:41:37',1),(1449,5,'Pontential is Everything','site_objects','4','INSERT','Pontential is Everything configured with Test\'s object','2016-11-15 05:41:37',1),(1450,5,'Pontential is Everything','site_objects','6','INSERT','Pontential is Everything configured with 1234 object','2016-11-15 05:41:37',1),(1451,5,'jkl','sites','10','DELETE','Site - jkl deleted','2016-11-15 05:41:51',1),(1452,5,'Victory or Death','sites','14','UPDATE','Site - Victory or Death modified','2016-11-15 05:42:10',1),(1453,5,'Savy\'s Future','sites','18','UPDATE','Site - Savy\'s Future modified','2016-11-15 05:42:44',1),(1454,5,'Savy\'s Future','site_objects','2','INSERT','Savy\'s Future configured with Oil Tank object','2016-11-15 05:42:44',1),(1455,5,'Savy\'s Future','site_objects','4','INSERT','Savy\'s Future configured with Test\'s object','2016-11-15 05:42:44',1),(1456,5,'Savy\'s Future','site_objects','8','INSERT','Savy\'s Future configured with sdtwgbw object','2016-11-15 05:42:44',1),(1457,5,'Yankees Good Night','sites','15','UPDATE','Site - Yankees Good Night modified','2016-11-15 05:43:22',1),(1458,5,'Roy\'s Renaissance','sites','20','UPDATE','Site - Roy\'s Renaissance modified','2016-11-15 05:43:50',1),(1459,5,'Roy\'s Renaissance','site_objects','2','INSERT','Roy\'s Renaissance configured with Oil Tank object','2016-11-15 05:43:50',1),(1460,5,'Roy\'s Renaissance','site_objects','3','INSERT','Roy\'s Renaissance configured with Water Tank object','2016-11-15 05:43:50',1),(1461,5,'Stranger Things have Happened','sites','18','UPDATE','Site - Stranger Things have Happened modified','2016-11-15 05:44:24',1),(1462,5,'Stranger Things have Happened','site_objects','2','INSERT','Stranger Things have Happened configured with Oil Tank object','2016-11-15 05:44:24',1),(1463,5,'Stranger Things have Happened','site_objects','4','INSERT','Stranger Things have Happened configured with Test\'s object','2016-11-15 05:44:25',1),(1464,5,'Stranger Things have Happened','site_objects','8','INSERT','Stranger Things have Happened configured with sdtwgbw object','2016-11-15 05:44:25',1),(1465,1,'&lt;div style=','accounts','3','UPDATE','Account - &lt;div style= modified','2016-11-15 07:26:44',1),(1466,1,'Fred\'s Drilling','accounts','3','UPDATE','Account - Fred\'s Drilling modified','2016-11-15 07:27:31',1),(1467,1,'Fred\'s Drilling','accounts','3','UPDATE','Account - Fred\'s Drilling modified','2016-11-15 07:27:37',1),(1468,1,'Fred123','accounts','8','UPDATE','Account - Fred123 modified','2016-11-15 07:27:47',1),(1469,5,'Becca\'s Bonaza','sites','16','UPDATE','Site - Becca\'s Bonaza modified','2016-11-15 08:45:35',1),(1470,5,'Becca\'s Bonaza','site_objects','2','INSERT','Becca\'s Bonaza configured with Oil Tank object','2016-11-15 08:45:36',1),(1471,5,'Becca\'s Bonaza','site_objects','3','INSERT','Becca\'s Bonaza configured with Water Tank object','2016-11-15 08:45:36',1),(1472,5,'Becca\'s Bonaza','site_objects','5','INSERT','Becca\'s Bonaza configured with Becca\'s Object object','2016-11-15 08:45:36',1),(1473,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-11-15 17:07:39',0),(1474,5,'123 Show it to Me','sites','34','UPDATE','Site - 123 Show it to Me modified','2016-11-15 19:03:05',1),(1475,5,'123 Show it to Me','site_objects','2','INSERT','123 Show it to Me configured with Oil Tank object','2016-11-15 19:03:06',1),(1476,5,'123 Show it to Me','site_objects','3','INSERT','123 Show it to Me configured with Water Tank object','2016-11-15 19:03:06',1),(1477,5,'123 Show it to Me','site_objects','5','INSERT','123 Show it to Me configured with Becca\'s Object object','2016-11-15 19:03:06',1),(1478,5,'Pump Jack','objects','5','UPDATE','Object - Pump Jack modified','2016-11-15 19:03:43',1),(1479,5,'Pump Jack','object_devices','1','INSERT','Pump Jack configured with Tank Stick device','2016-11-15 19:03:43',1),(1480,5,'Pump Jack','object_devices','2','INSERT','Pump Jack configured with Transducer device','2016-11-15 19:03:43',1),(1481,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-11-15 19:54:46',0),(1482,5,'Oil Tank','objects','2','UPDATE','Object - Oil Tank modified','2016-11-15 20:03:48',1),(1483,5,'Oil Tank','object_devices','1','INSERT','Oil Tank configured with Tank Stick device','2016-11-15 20:03:48',1),(1484,5,'Oil Tank','object_devices','3','INSERT','Oil Tank configured with Transfer Pump device','2016-11-15 20:03:48',1),(1485,5,'Water Tank','objects','3','UPDATE','Object - Water Tank modified','2016-11-15 20:04:32',1),(1486,5,'Water Tank','object_devices','1','INSERT','Water Tank configured with Tank Stick device','2016-11-15 20:04:32',1),(1487,5,'Water Tank','object_devices','2','INSERT','Water Tank configured with Transducer device','2016-11-15 20:04:32',1),(1488,5,'Pump Jack','objects','5','UPDATE','Object - Pump Jack modified','2016-11-15 20:04:44',1),(1489,5,'Pump Jack','object_devices','1','INSERT','Pump Jack configured with Tank Stick device','2016-11-15 20:04:44',1),(1490,5,'Pump Jack','object_devices','2','INSERT','Pump Jack configured with Transducer device','2016-11-15 20:04:44',1),(1491,5,'CMC\'s Slush','sites','6','UPDATE','Site - CMC\'s Slush modified','2016-11-15 20:37:13',1),(1492,5,'CMC\'s Slush','site_objects','2','INSERT','CMC\'s Slush configured with Oil Tank object','2016-11-15 20:37:13',1),(1493,5,'CMC\'s Slush','site_objects','3','INSERT','CMC\'s Slush configured with Water Tank object','2016-11-15 20:37:13',1),(1494,5,'Jackson\'s Hole','sites','17','UPDATE','Site - Jackson\'s Hole modified','2016-11-15 20:37:33',1),(1495,5,'Jackson\'s Hole','site_objects','2','INSERT','Jackson\'s Hole configured with Oil Tank object','2016-11-15 20:37:33',1),(1496,5,'Jackson\'s Hole','site_objects','4','INSERT','Jackson\'s Hole configured with Test\'s object','2016-11-15 20:37:33',1),(1497,5,'Jackson\'s Hole','site_objects','5','INSERT','Jackson\'s Hole configured with Pump Jack object','2016-11-15 20:37:34',1),(1498,5,'456','sites','38','INSERT','New site - 456 added','2016-11-15 21:03:24',1),(1499,5,'456','site_objects','2','INSERT','456 configured with Oil Tank object','2016-11-15 21:03:24',1),(1500,5,'456','site_objects','3','INSERT','456 configured with Water Tank object','2016-11-15 21:03:24',1),(1501,5,'456','site_objects','5','INSERT','456 configured with Pump Jack object','2016-11-15 21:03:24',1),(1502,5,'456','sites','38','DELETE','Site - 456 deleted','2016-11-15 21:10:32',1),(1503,5,'!Test 456','sites','32','UPDATE','Site - !Test 456  reactivated','2016-11-15 21:12:53',1),(1504,5,'123 Show it to Me','sites','34','UPDATE','Site - 123 Show it to Me  deactivated','2016-11-15 21:17:00',1),(1505,5,'123 Show it to Me','sites','34','UPDATE','Site - 123 Show it to Me  reactivated','2016-11-15 21:17:07',1),(1506,5,'!Test 456','sites','32','UPDATE','Site - !Test 456  deactivated','2016-11-15 21:17:13',1),(1507,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-11-16 03:16:10',0),(1508,5,'Oil Tank','objects','2','UPDATE','Object - Oil Tank modified','2016-11-16 04:10:36',1),(1509,5,'Oil Tank','object_devices','1','INSERT','Oil Tank configured with Tank Stick device','2016-11-16 04:10:36',1),(1510,5,'Oil Tank','object_devices','3','INSERT','Oil Tank configured with Transfer Pump device','2016-11-16 04:10:36',1),(1511,5,'ACME XFR - 24 Oil Tank','objects','2','UPDATE','Object - ACME XFR - 24 Oil Tank modified','2016-11-16 04:17:12',1),(1512,5,'ACME XFR - 24 Oil Tank','object_devices','1','INSERT','ACME XFR - 24 Oil Tank configured with Tank Stick device','2016-11-16 04:17:13',1),(1513,5,'ACME XFR - 24 Oil Tank','object_devices','3','INSERT','ACME XFR - 24 Oil Tank configured with Transfer Pump device','2016-11-16 04:17:13',1),(1514,5,'Sampson RR - 26 Water Tank','objects','3','UPDATE','Object - Sampson RR - 26 Water Tank modified','2016-11-16 04:22:03',1),(1515,5,'Sampson RR - 26 Water Tank','object_devices','1','INSERT','Sampson RR - 26 Water Tank configured with Tank Stick device','2016-11-16 04:22:03',1),(1516,5,'Sampson RR - 26 Water Tank','object_devices','2','INSERT','Sampson RR - 26 Water Tank configured with Transducer device','2016-11-16 04:22:03',1),(1517,5,'Drake 25 Series Pump Jack','objects','5','UPDATE','Object - Drake 25 Series Pump Jack modified','2016-11-16 04:24:36',1),(1518,5,'Drake 25 Series Pump Jack','object_devices','1','INSERT','Drake 25 Series Pump Jack configured with Tank Stick device','2016-11-16 04:24:36',1),(1519,5,'Drake 25 Series Pump Jack','object_devices','2','INSERT','Drake 25 Series Pump Jack configured with Transducer device','2016-11-16 04:24:36',1),(1520,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-11-16 08:31:27',0),(1521,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-11-16 08:39:39',0),(1522,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-11-16 17:16:23',0),(1523,1,'Jessica','sites','24','UPDATE','Site - Jessica modified','2016-11-16 17:17:09',1),(1524,1,'Jessica','site_objects','2','INSERT','Jessica configured with ACME XFR - 24 Oil Tank object','2016-11-16 17:17:09',1),(1525,1,'Jessica','site_objects','3','INSERT','Jessica configured with Sampson RR - 26 Water Tank object','2016-11-16 17:17:09',1),(1526,1,'Jessica','site_objects','5','INSERT','Jessica configured with Drake 25 Series Pump Jack object','2016-11-16 17:17:09',1),(1527,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-11-16 18:47:32',0),(1528,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-11-16 21:38:22',0),(1529,1,'Devices','modules','42','INSERT','New module - Devices created','2016-11-16 21:39:24',1),(1530,1,'Executions','modules','43','INSERT','New module - Executions created','2016-11-16 21:39:54',1),(1531,1,'Measurements','modules','44','INSERT','New module - Measurements created','2016-11-16 21:40:25',1),(1532,1,'Triggers','modules','45','INSERT','New module - Triggers created','2016-11-16 21:40:49',1),(1533,1,'Technician','groups','6','UPDATE','Group - Technician  deactivated','2016-11-16 22:08:16',1),(1534,1,'Technician','groups','6','UPDATE','Group - Technician  reactivated','2016-11-16 22:08:23',1),(1535,1,'Device Menu','modules','1','UPDATE','Module - Device Menu modified','2016-11-16 22:20:49',1),(1536,1,'Super User','group_permissions','1','INSERT','Super User granted access to Admin','2016-11-16 23:10:40',1),(1537,1,'Super User','group_permissions','1','INSERT','Super User granted access to Departments','2016-11-16 23:10:40',1),(1538,1,'Super User','group_permissions','1','INSERT','Super User granted access to Groups','2016-11-16 23:10:40',1),(1539,1,'Super User','group_permissions','1','INSERT','Super User granted access to Sites','2016-11-16 23:10:40',1),(1540,1,'Super User','group_permissions','1','INSERT','Super User granted access to Users','2016-11-16 23:10:40',1),(1541,1,'Super User','group_permissions','1','INSERT','Super User granted access to System','2016-11-16 23:10:40',1),(1542,1,'Super User','group_permissions','1','INSERT','Super User granted access to Accounts','2016-11-16 23:10:40',1),(1543,1,'Super User','group_permissions','1','INSERT','Super User granted access to Admin Log','2016-11-16 23:10:40',1),(1544,1,'Super User','group_permissions','1','INSERT','Super User granted access to Objects','2016-11-16 23:10:40',1),(1545,1,'Super User','group_permissions','1','INSERT','Super User granted access to Device Menu','2016-11-16 23:10:40',1),(1546,1,'Super User','group_permissions','1','INSERT','Super User granted access to Devices','2016-11-16 23:10:40',1),(1547,1,'Super User','group_permissions','1','INSERT','Super User granted access to Executions','2016-11-16 23:10:40',1),(1548,1,'Super User','group_permissions','1','INSERT','Super User granted access to Measurements','2016-11-16 23:10:40',1),(1549,1,'Super User','group_permissions','1','INSERT','Super User granted access to Tags','2016-11-16 23:10:40',1),(1550,1,'Super User','group_permissions','1','INSERT','Super User granted access to Modules','2016-11-16 23:10:40',1),(1551,1,'Super User','group_permissions','1','INSERT','Super User granted access to Dashboard','2016-11-16 23:10:40',1),(1552,1,'Super User','group_permissions','1','INSERT','Super User granted access to Help','2016-11-16 23:10:40',1),(1553,1,'Super User','group_permissions','1','INSERT','Super User granted access to Submit Ticket','2016-11-16 23:10:40',1),(1554,1,'Super User','group_permissions','1','INSERT','Super User granted access to Tickets','2016-11-16 23:10:40',1),(1555,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-11-16 23:11:28',0),(1556,1,'Super User','group_permissions','1','INSERT','Super User granted access to Admin','2016-11-16 23:43:12',1),(1557,1,'Super User','group_permissions','1','INSERT','Super User granted access to Departments','2016-11-16 23:43:12',1),(1558,1,'Super User','group_permissions','1','INSERT','Super User granted access to Groups','2016-11-16 23:43:12',1),(1559,1,'Super User','group_permissions','1','INSERT','Super User granted access to Sites','2016-11-16 23:43:12',1),(1560,1,'Super User','group_permissions','1','INSERT','Super User granted access to Users','2016-11-16 23:43:12',1),(1561,1,'Super User','group_permissions','1','INSERT','Super User granted access to System','2016-11-16 23:43:12',1),(1562,1,'Super User','group_permissions','1','INSERT','Super User granted access to Accounts','2016-11-16 23:43:12',1),(1563,1,'Super User','group_permissions','1','INSERT','Super User granted access to Admin Log','2016-11-16 23:43:12',1),(1564,1,'Super User','group_permissions','1','INSERT','Super User granted access to Objects','2016-11-16 23:43:12',1),(1565,1,'Super User','group_permissions','1','INSERT','Super User granted access to Device Menu','2016-11-16 23:43:12',1),(1566,1,'Super User','group_permissions','1','INSERT','Super User granted access to Devices','2016-11-16 23:43:12',1),(1567,1,'Super User','group_permissions','1','INSERT','Super User granted access to Executions','2016-11-16 23:43:12',1),(1568,1,'Super User','group_permissions','1','INSERT','Super User granted access to Measurements','2016-11-16 23:43:12',1),(1569,1,'Super User','group_permissions','1','INSERT','Super User granted access to Triggers','2016-11-16 23:43:12',1),(1570,1,'Super User','group_permissions','1','INSERT','Super User granted access to Measurements','2016-11-16 23:43:12',1),(1571,1,'Super User','group_permissions','1','INSERT','Super User granted access to Tags','2016-11-16 23:43:12',1),(1572,1,'Super User','group_permissions','1','INSERT','Super User granted access to Modules','2016-11-16 23:43:12',1),(1573,1,'Super User','group_permissions','1','INSERT','Super User granted access to Dashboard','2016-11-16 23:43:12',1),(1574,1,'Super User','group_permissions','1','INSERT','Super User granted access to Help','2016-11-16 23:43:12',1),(1575,1,'Super User','group_permissions','1','INSERT','Super User granted access to Submit Ticket','2016-11-16 23:43:12',1),(1576,1,'Super User','group_permissions','1','INSERT','Super User granted access to Tickets','2016-11-16 23:43:12',1),(1577,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-11-16 23:43:25',0),(1578,1,'Tags','modules','41','DELETE','Module - Tags deleted','2016-11-16 23:45:21',1),(1579,1,'Measurements','modules','40','DELETE','Module - Measurements deleted','2016-11-16 23:45:40',1),(1580,1,'Tags','modules','46','INSERT','New module - Tags created','2016-11-16 23:46:15',1),(1581,1,'Triggers','modules','45','UPDATE','Module - Triggers modified','2016-11-16 23:46:32',1),(1582,1,'Devices','modules','42','UPDATE','Module - Devices modified','2016-11-16 23:48:07',1),(1583,1,'Executions','modules','43','UPDATE','Module - Executions modified','2016-11-16 23:48:23',1),(1584,1,'Measurements','modules','44','UPDATE','Module - Measurements modified','2016-11-16 23:48:37',1),(1585,1,'Triggers','modules','45','UPDATE','Module - Triggers modified','2016-11-16 23:49:05',1),(1586,1,'Super User','group_permissions','1','INSERT','Super User granted access to Admin','2016-11-16 23:49:52',1),(1587,1,'Super User','group_permissions','1','INSERT','Super User granted access to Departments','2016-11-16 23:49:52',1),(1588,1,'Super User','group_permissions','1','INSERT','Super User granted access to Groups','2016-11-16 23:49:52',1),(1589,1,'Super User','group_permissions','1','INSERT','Super User granted access to Sites','2016-11-16 23:49:52',1),(1590,1,'Super User','group_permissions','1','INSERT','Super User granted access to Users','2016-11-16 23:49:52',1),(1591,1,'Super User','group_permissions','1','INSERT','Super User granted access to System','2016-11-16 23:49:52',1),(1592,1,'Super User','group_permissions','1','INSERT','Super User granted access to Accounts','2016-11-16 23:49:52',1),(1593,1,'Super User','group_permissions','1','INSERT','Super User granted access to Admin Log','2016-11-16 23:49:52',1),(1594,1,'Super User','group_permissions','1','INSERT','Super User granted access to Objects','2016-11-16 23:49:52',1),(1595,1,'Super User','group_permissions','1','INSERT','Super User granted access to Device Menu','2016-11-16 23:49:52',1),(1596,1,'Super User','group_permissions','1','INSERT','Super User granted access to Devices','2016-11-16 23:49:52',1),(1597,1,'Super User','group_permissions','1','INSERT','Super User granted access to Executions','2016-11-16 23:49:52',1),(1598,1,'Super User','group_permissions','1','INSERT','Super User granted access to Measurements','2016-11-16 23:49:52',1),(1599,1,'Super User','group_permissions','1','INSERT','Super User granted access to Tags','2016-11-16 23:49:52',1),(1600,1,'Super User','group_permissions','1','INSERT','Super User granted access to Triggers','2016-11-16 23:49:52',1),(1601,1,'Super User','group_permissions','1','INSERT','Super User granted access to Modules','2016-11-16 23:49:52',1),(1602,1,'Super User','group_permissions','1','INSERT','Super User granted access to Dashboard','2016-11-16 23:49:52',1),(1603,1,'Super User','group_permissions','1','INSERT','Super User granted access to Help','2016-11-16 23:49:52',1),(1604,1,'Super User','group_permissions','1','INSERT','Super User granted access to Submit Ticket','2016-11-16 23:49:52',1),(1605,1,'Super User','group_permissions','1','INSERT','Super User granted access to Tickets','2016-11-16 23:49:52',1),(1606,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-11-16 23:50:02',0),(1607,1,'Stop Motor','executions','1','INSERT','New execution - Stop Motor added','2016-11-17 00:10:36',1),(1608,1,'Stop Motor1','executions','1','UPDATE','Execution - Stop Motor1 modified','2016-11-17 00:15:11',1),(1609,1,'Stop Motor','executions','1','UPDATE','Execution - Stop Motor modified','2016-11-17 00:15:22',1),(1610,1,'Stop Motor','executions','1','UPDATE','Execution - Stop Motor  deactivated','2016-11-17 00:15:29',1),(1611,1,'Stop Motor','executions','1','UPDATE','Execution - Stop Motor  reactivated','2016-11-17 00:15:38',1),(1612,1,'Reboot OPCUA Server','executions','2','INSERT','New execution - Reboot OPCUA Server added','2016-11-17 00:16:25',1),(1613,1,'Start Motor','executions','3','INSERT','New execution - Start Motor added','2016-11-17 00:19:33',1),(1614,1,'Actions','modules','47','INSERT','New module - Actions created','2016-11-17 00:33:13',1),(1615,1,'Executions','modules','43','UPDATE','Module - Executions modified','2016-11-17 00:33:28',1),(1616,1,'Measurements','modules','44','UPDATE','Module - Measurements modified','2016-11-17 00:33:46',1),(1617,1,'Tags','modules','46','UPDATE','Module - Tags modified','2016-11-17 00:34:11',1),(1618,1,'Triggers','modules','45','UPDATE','Module - Triggers modified','2016-11-17 00:34:30',1),(1619,1,'Super User','group_permissions','1','INSERT','Super User granted access to Admin','2016-11-17 00:34:54',1),(1620,1,'Super User','group_permissions','1','INSERT','Super User granted access to Departments','2016-11-17 00:34:54',1),(1621,1,'Super User','group_permissions','1','INSERT','Super User granted access to Groups','2016-11-17 00:34:54',1),(1622,1,'Super User','group_permissions','1','INSERT','Super User granted access to Sites','2016-11-17 00:34:54',1),(1623,1,'Super User','group_permissions','1','INSERT','Super User granted access to Users','2016-11-17 00:34:54',1),(1624,1,'Super User','group_permissions','1','INSERT','Super User granted access to System','2016-11-17 00:34:54',1),(1625,1,'Super User','group_permissions','1','INSERT','Super User granted access to Accounts','2016-11-17 00:34:54',1),(1626,1,'Super User','group_permissions','1','INSERT','Super User granted access to Admin Log','2016-11-17 00:34:54',1),(1627,1,'Super User','group_permissions','1','INSERT','Super User granted access to Objects','2016-11-17 00:34:54',1),(1628,1,'Super User','group_permissions','1','INSERT','Super User granted access to Device Menu','2016-11-17 00:34:54',1),(1629,1,'Super User','group_permissions','1','INSERT','Super User granted access to Devices','2016-11-17 00:34:54',1),(1630,1,'Super User','group_permissions','1','INSERT','Super User granted access to Actions','2016-11-17 00:34:54',1),(1631,1,'Super User','group_permissions','1','INSERT','Super User granted access to Executions','2016-11-17 00:34:54',1),(1632,1,'Super User','group_permissions','1','INSERT','Super User granted access to Measurements','2016-11-17 00:34:54',1),(1633,1,'Super User','group_permissions','1','INSERT','Super User granted access to Tags','2016-11-17 00:34:54',1),(1634,1,'Super User','group_permissions','1','INSERT','Super User granted access to Triggers','2016-11-17 00:34:54',1),(1635,1,'Super User','group_permissions','1','INSERT','Super User granted access to Modules','2016-11-17 00:34:54',1),(1636,1,'Super User','group_permissions','1','INSERT','Super User granted access to Dashboard','2016-11-17 00:34:54',1),(1637,1,'Super User','group_permissions','1','INSERT','Super User granted access to Help','2016-11-17 00:34:54',1),(1638,1,'Super User','group_permissions','1','INSERT','Super User granted access to Submit Ticket','2016-11-17 00:34:54',1),(1639,1,'Super User','group_permissions','1','INSERT','Super User granted access to Tickets','2016-11-17 00:34:54',1),(1640,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-11-17 00:35:54',0),(1641,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-11-17 01:14:57',0),(1642,1,'Test','executions','4','INSERT','New execution - Test added','2016-11-17 01:15:36',1),(1643,1,'Test','executions','5','INSERT','New execution - Test added','2016-11-17 01:16:44',1),(1644,1,'Test','executions','6','INSERT','New execution - Test added','2016-11-17 01:18:40',1),(1645,1,'Test','execution_tags','3','INSERT','Test configured with Start Motor tag','2016-11-17 01:18:40',1),(1646,1,'Test','execution_tags','9','INSERT','Test configured with  tag','2016-11-17 01:18:40',1),(1647,1,'Test','executions','6','UPDATE','Execution - Test modified','2016-11-17 01:21:34',1),(1648,1,'Test','execution_tags','1','INSERT','Test configured with Stop Motor tag','2016-11-17 01:21:34',1),(1649,1,'Test','execution_tags','5','INSERT','Test configured with Test tag','2016-11-17 01:21:34',1),(1650,1,'Test','executions','6','UPDATE','Execution - Test modified','2016-11-17 01:22:31',1),(1651,1,'Test','execution_tags','1','INSERT','Test configured with Stop Motor tag','2016-11-17 01:22:31',1),(1652,1,'Test','execution_tags','5','INSERT','Test configured with Test tag','2016-11-17 01:22:31',1),(1653,1,'Test','executions','5','DELETE','Execution - Test deleted','2016-11-17 01:22:46',1),(1654,1,'Test','executions','4','DELETE','Execution - Test deleted','2016-11-17 01:23:05',1),(1655,1,'Test','executions','6','UPDATE','Execution - Test  deactivated','2016-11-17 01:23:10',1),(1656,1,'Test','executions','6','UPDATE','Execution - Test  reactivated','2016-11-17 01:23:14',1),(1657,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-11-17 03:03:34',0),(1658,1,'Shutdown Pump','actions','1','INSERT','New action - Shutdown Pump added','2016-11-17 03:11:56',1),(1659,1,'Shutdown Pump1','actions','1','UPDATE','Action - Shutdown Pump1 modified','2016-11-17 03:13:53',1),(1660,1,'Shutdown Pump','actions','1','UPDATE','Action - Shutdown Pump modified','2016-11-17 03:14:11',1),(1661,1,'Shutdown Pump','actions','1','UPDATE','Action - Shutdown Pump  deactivated','2016-11-17 03:20:29',1),(1662,1,'Shutdown Pump','actions','1','UPDATE','Action - Shutdown Pump  reactivated','2016-11-17 03:20:33',1),(1663,1,'AST','tags','1','UPDATE','Tag - AST modified','2016-11-17 03:55:23',1),(1664,1,'DST','tags','8','UPDATE','Tag - DST modified','2016-11-17 04:27:02',1),(1665,1,'EST','tags','9','UPDATE','Tag - EST modified','2016-11-17 04:27:43',1),(1666,1,'EST','tags','9','UPDATE','Tag - EST modified','2016-11-17 04:27:57',1),(1667,1,'AST','tags','1','UPDATE','Tag - AST modified','2016-11-17 04:28:38',1),(1668,1,'FST','tags','10','INSERT','New tag - FST added','2016-11-17 04:29:09',1),(1669,1,'AST','tags','1','UPDATE','Tag - AST modified','2016-11-17 04:32:20',1),(1670,1,'BST','tags','3','UPDATE','Tag - BST modified','2016-11-17 04:32:48',1),(1671,1,'CST','tags','5','UPDATE','Tag - CST modified','2016-11-17 04:33:16',1),(1672,1,'DST','tags','8','UPDATE','Tag - DST modified','2016-11-17 04:33:28',1),(1673,1,'EST','tags','9','UPDATE','Tag - EST modified','2016-11-17 04:33:39',1),(1674,1,'FST','tags','10','UPDATE','Tag - FST modified','2016-11-17 04:34:05',1),(1675,1,'GST','tags','11','INSERT','New tag - GST added','2016-11-17 04:36:48',1),(1676,1,'HST','tags','12','INSERT','New tag - HST added','2016-11-17 04:37:04',1),(1677,1,'IST','tags','13','INSERT','New tag - IST added','2016-11-17 04:37:22',1),(1678,1,'Startup Pump','actions','2','INSERT','New action - Startup Pump added','2016-11-17 05:39:32',1),(1679,1,'Shut off Valve','actions','3','INSERT','New action - Shut off Valve added','2016-11-17 05:40:14',1),(1680,1,'Open Valve','actions','4','INSERT','New action - Open Valve added','2016-11-17 05:40:42',1),(1681,1,'Reboot OPC Server','actions','5','INSERT','New action - Reboot OPC Server added','2016-11-17 05:41:11',1),(1682,1,'Reboot OPCUA Server','actions','5','UPDATE','Action - Reboot OPCUA Server modified','2016-11-17 05:41:33',1),(1683,1,'Tank Overflow','triggers','1','INSERT','New trigger - Tank Overflow added','2016-11-17 05:43:28',1),(1684,1,'Tank Overflow','triggers','1','UPDATE','Trigger - Tank Overflow modified','2016-11-17 05:51:03',1),(1685,1,'Tank Overflow','triggers','1','UPDATE','Trigger - Tank Overflow modified','2016-11-17 05:52:08',1),(1686,1,'Tank Overflow','triggers','1','UPDATE','Trigger - Tank Overflow modified','2016-11-17 06:00:03',1),(1687,1,'Tank Overflow','trigger_actions','1','INSERT','Tank Overflow configured with Tank Overflow object','2016-11-17 06:00:04',1),(1688,1,'Tank Overflow','trigger_actions','3','INSERT','Tank Overflow configured with  object','2016-11-17 06:00:04',1),(1689,1,'Tank Overflow','trigger_tags','5','INSERT','Tank Overflow configured with  object','2016-11-17 06:00:04',1),(1690,1,'Tank Overflow','trigger_tags','13','INSERT','Tank Overflow configured with  object','2016-11-17 06:00:04',1),(1691,1,'Tank Overflow','triggers','1','UPDATE','Trigger - Tank Overflow modified','2016-11-17 06:01:22',1),(1692,1,'Tank Overflow','trigger_actions','1','INSERT','Tank Overflow configured with Tank Overflow object','2016-11-17 06:01:22',1),(1693,1,'Tank Overflow','trigger_actions','3','INSERT','Tank Overflow configured with  object','2016-11-17 06:01:22',1),(1694,1,'Tank Overflow','trigger_tags','5','INSERT','Tank Overflow configured with  object','2016-11-17 06:01:22',1),(1695,1,'Tank Overflow','trigger_tags','13','INSERT','Tank Overflow configured with  object','2016-11-17 06:01:22',1),(1696,1,'Tank Overflow','triggers','1','UPDATE','Trigger - Tank Overflow modified','2016-11-17 06:02:49',1),(1697,1,'Tank Overflow','trigger_actions','1','INSERT','Tank Overflow configured with Tank Overflow object','2016-11-17 06:02:49',1),(1698,1,'Tank Overflow','trigger_actions','4','INSERT','Tank Overflow configured with  object','2016-11-17 06:02:49',1),(1699,1,'Tank Overflow','trigger_actions','5','INSERT','Tank Overflow configured with  object','2016-11-17 06:02:50',1),(1700,1,'Tank Overflow','trigger_tags','10','INSERT','Tank Overflow configured with  object','2016-11-17 06:02:50',1),(1701,1,'Tank Overflow','triggers','1','UPDATE','Trigger - Tank Overflow modified','2016-11-17 06:03:04',1),(1702,1,'Tank Overflow','trigger_actions','1','INSERT','Tank Overflow configured with Tank Overflow object','2016-11-17 06:03:04',1),(1703,1,'Tank Overflow','trigger_actions','4','INSERT','Tank Overflow configured with  object','2016-11-17 06:03:04',1),(1704,1,'Tank Overflow','trigger_actions','5','INSERT','Tank Overflow configured with  object','2016-11-17 06:03:04',1),(1705,1,'Tank Overflow','trigger_tags','10','INSERT','Tank Overflow configured with  object','2016-11-17 06:03:04',1),(1706,1,'Tank Overflow','triggers','1','UPDATE','Trigger - Tank Overflow modified','2016-11-17 06:03:18',1),(1707,1,'Tank Overflow','trigger_actions','1','INSERT','Tank Overflow configured with Tank Overflow object','2016-11-17 06:03:18',1),(1708,1,'Tank Overflow','trigger_actions','4','INSERT','Tank Overflow configured with  object','2016-11-17 06:03:18',1),(1709,1,'Tank Overflow','trigger_actions','5','INSERT','Tank Overflow configured with  object','2016-11-17 06:03:18',1),(1710,1,'Tank Overflow','trigger_tags','10','INSERT','Tank Overflow configured with  object','2016-11-17 06:03:18',1),(1711,1,'Tank Overflow','triggers','1','UPDATE','Trigger - Tank Overflow  deactivated','2016-11-17 06:03:27',1),(1712,1,'Tank Overflow','triggers','1','UPDATE','Trigger - Tank Overflow  reactivated','2016-11-17 06:03:32',1),(1713,1,'OPCUA Admins','groups','0','INSERT','New group - OPCUA Admins added','2016-11-17 06:07:27',1),(1714,1,'OPCUA Admins','group_permissions','0','INSERT','OPCUA Admins granted access to Admin','2016-11-17 06:11:36',1),(1715,1,'OPCUA Admins','group_permissions','0','INSERT','OPCUA Admins granted access to Sites','2016-11-17 06:11:36',1),(1716,1,'OPCUA Admins','group_permissions','0','INSERT','OPCUA Admins granted access to System','2016-11-17 06:11:36',1),(1717,1,'OPCUA Admins','group_permissions','0','INSERT','OPCUA Admins granted access to Admin Log','2016-11-17 06:11:36',1),(1718,1,'OPCUA Admins','group_permissions','0','INSERT','OPCUA Admins granted access to Objects','2016-11-17 06:11:36',1),(1719,1,'OPCUA Admins','group_permissions','0','INSERT','OPCUA Admins granted access to Device Menu','2016-11-17 06:11:36',1),(1720,1,'OPCUA Admins','group_permissions','0','INSERT','OPCUA Admins granted access to Devices','2016-11-17 06:11:36',1),(1721,1,'OPCUA Admins','group_permissions','0','INSERT','OPCUA Admins granted access to Actions','2016-11-17 06:11:36',1),(1722,1,'OPCUA Admins','group_permissions','0','INSERT','OPCUA Admins granted access to Executions','2016-11-17 06:11:36',1),(1723,1,'OPCUA Admins','group_permissions','0','INSERT','OPCUA Admins granted access to Measurements','2016-11-17 06:11:36',1),(1724,1,'OPCUA Admins','group_permissions','0','INSERT','OPCUA Admins granted access to Tags','2016-11-17 06:11:36',1),(1725,1,'OPCUA Admins','group_permissions','0','INSERT','OPCUA Admins granted access to Triggers','2016-11-17 06:11:36',1),(1726,1,'OPCUA Admins','group_permissions','0','INSERT','OPCUA Admins granted access to Dashboard','2016-11-17 06:11:36',1),(1727,1,'OPCUA Admins','group_permissions','0','INSERT','OPCUA Admins granted access to Help','2016-11-17 06:11:36',1),(1728,1,'OPCUA Admins','group_permissions','0','INSERT','OPCUA Admins granted access to Submit Ticket','2016-11-17 06:11:36',1),(1729,1,'OPCUA Admins','group_permissions','0','INSERT','OPCUA Admins granted access to Tickets','2016-11-17 06:11:36',1),(1730,1,'OPC UA','users','46','INSERT','New user - opcua added','2016-11-17 06:14:33',1),(1731,1,'OPC UA','user_departments','46','INSERT','Department - IT assigned','2016-11-17 06:14:33',1),(1732,1,'OPC UA','user_groups','46','INSERT','Group - Manager assigned','2016-11-17 06:14:33',1),(1733,1,'OPC UA','user_groups','46','INSERT','Group - OPCUA Admins assigned','2016-11-17 06:15:04',1),(1734,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-11-17 17:06:38',0),(1735,1,'Shutdown Pump','actions','1','UPDATE','Action - Shutdown Pump modified','2016-11-17 17:08:38',1),(1736,1,'Shutdown Pump','actions','1','UPDATE','Action - Shutdown Pump modified','2016-11-17 17:08:50',1),(1737,1,'Shutdown Pump1','actions','1','UPDATE','Action - Shutdown Pump1 modified','2016-11-17 17:09:02',1),(1738,1,'Shutdown Pump','actions','1','UPDATE','Action - Shutdown Pump modified','2016-11-17 17:09:15',1),(1739,1,'Shutdown Pump','actions','1','UPDATE','Action - Shutdown Pump  reactivated','2016-11-17 17:09:21',1),(1740,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-11-17 17:46:11',0),(1741,1,'Measurements','modules','44','UPDATE','Module - Measurements modified','2016-11-17 17:47:22',1),(1742,1,'Executions','modules','43','UPDATE','Module - Executions modified','2016-11-17 17:47:43',1),(1743,1,'Actions','modules','47','UPDATE','Module - Actions modified','2016-11-17 17:48:07',1),(1744,1,'Triggers','modules','45','UPDATE','Module - Triggers modified','2016-11-17 17:48:29',1),(1745,1,'Tags','modules','46','UPDATE','Module - Tags modified','2016-11-17 17:48:55',1),(1746,1,'Overheated Motor','triggers','2','INSERT','New trigger - Overheated Motor added','2016-11-17 19:46:29',1),(1747,1,'Overheated Motor','trigger_actions','1','INSERT','Overheated Motor configured with Tank Overflow object','2016-11-17 19:46:29',1),(1748,1,'Overheated Motor','trigger_actions','3','INSERT','Overheated Motor configured with  object','2016-11-17 19:46:29',1),(1749,1,'Overheated Motor','triggers','3','INSERT','New trigger - Overheated Motor added','2016-11-17 19:56:19',1),(1750,1,'Overheated Motor','trigger_actions','1','INSERT','Overheated Motor configured with Shutdown Pump action','2016-11-17 19:56:19',1),(1751,1,'Overheated Motor','trigger_actions','3','INSERT','Overheated Motor configured with Shut off Valve action','2016-11-17 19:56:19',1),(1752,1,'Overheated Motor','triggers','4','INSERT','New trigger - Overheated Motor added','2016-11-17 19:57:26',1),(1753,1,'Overheated Motor','trigger_actions','1','INSERT','Overheated Motor configured with Shutdown Pump action','2016-11-17 19:57:26',1),(1754,1,'Overheated Motor','trigger_actions','3','INSERT','Overheated Motor configured with Shut off Valve action','2016-11-17 19:57:26',1),(1755,1,'Overheated Motor','triggers','2','DELETE','Trigger - Overheated Motor deleted','2016-11-17 20:00:20',1),(1756,1,'Overheated Motor','triggers','3','DELETE','Trigger - Overheated Motor deleted','2016-11-17 20:00:26',1),(1757,1,'Stuck Valve','triggers','5','INSERT','New trigger - Stuck Valve added','2016-11-17 20:09:08',1),(1758,1,'Stuck Valve','triggers','6','INSERT','New trigger - Stuck Valve added','2016-11-17 20:11:08',1),(1759,1,'Stuck Valve','trigger_actions','3','INSERT','Stuck Valve configured with Shut off Valve action','2016-11-17 20:11:08',1),(1760,1,'Stuck Valve','trigger_actions','2','INSERT','Stuck Valve configured with Startup Pump action','2016-11-17 20:11:08',1),(1761,1,'Stuck Valve','trigger_tags','10','INSERT','Stuck Valve configured with FST trigger','2016-11-17 20:11:08',1),(1762,1,'Stuck Valve','triggers','5','UPDATE','Trigger - Stuck Valve modified','2016-11-17 20:11:40',1),(1763,1,'Stuck Valve','trigger_actions','1','INSERT','Stuck Valve configured with Shutdown Pump action','2016-11-17 20:11:40',1),(1764,1,'Stuck Valve','trigger_actions','3','INSERT','Stuck Valve configured with Shut off Valve action','2016-11-17 20:11:40',1),(1765,1,'Stuck Valve','trigger_tags','5','INSERT','Stuck Valve configured with CST trigger','2016-11-17 20:11:40',1),(1766,1,'Stuck Valve','trigger_tags','13','INSERT','Stuck Valve configured with IST trigger','2016-11-17 20:11:41',1),(1767,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-11-17 20:46:09',0),(1768,1,'Stuck Valve','triggers','5','DELETE','Trigger - Stuck Valve deleted','2016-11-17 20:46:43',1),(1769,1,'Electric Motor','devices','15','INSERT','New device - Electric Motor added','2016-11-17 20:49:56',1),(1770,1,'Electric Motor','devices','16','INSERT','New device - Electric Motor added','2016-11-17 20:51:21',1),(1771,1,'Electric Motor','devices','15','DELETE','Device - Electric Motor deleted','2016-11-17 20:54:37',1),(1772,1,'Electric Motor','devices','16','DELETE','Device - Electric Motor deleted','2016-11-17 20:54:43',1),(1773,1,'Electric Motor','devices','17','INSERT','New device - Electric Motor added','2016-11-17 21:11:32',1),(1774,1,'Electric Motor','devices','18','INSERT','New device - Electric Motor added','2016-11-17 21:12:20',1),(1775,1,'Electric Motor','device_executions','1','INSERT','Electric Motor configured with Stop Motor execution','2016-11-17 21:12:20',1),(1776,1,'Electric Motor','device_executions','3','INSERT','Electric Motor configured with Start Motor execution','2016-11-17 21:12:20',1),(1777,1,'Electric Motor','device_measurements','8','INSERT','Electric Motor configured with Level measurement','2016-11-17 21:12:20',1),(1778,1,'Electric Motor','device_measurements','9','INSERT','Electric Motor configured with Temperature measurement','2016-11-17 21:12:20',1),(1779,1,'Electric Motor','device_measurements','11','INSERT','Electric Motor configured with Pressure measurement','2016-11-17 21:12:20',1),(1780,1,'Electric Motor','device_triggers','4','INSERT','Electric Motor configured with Overheated Motor trigger','2016-11-17 21:12:20',1),(1781,1,'Electric Motor','device_triggers','6','INSERT','Electric Motor configured with Stuck Valve trigger','2016-11-17 21:12:20',1),(1782,1,'Electric Motor','devices','18','UPDATE','Device - Electric Motor modified','2016-11-17 21:18:53',1),(1783,1,'Electric Motor','device_executions','2','INSERT','Electric Motor configured with Reboot OPCUA Server execution','2016-11-17 21:18:54',1),(1784,1,'Electric Motor','device_executions','6','INSERT','Electric Motor configured with Test execution','2016-11-17 21:18:54',1),(1785,1,'Electric Motor','device_measurements','18','INSERT','Electric Motor configured with Cookin measurement','2016-11-17 21:18:54',1),(1786,1,'Electric Motor','device_measurements','22','INSERT','Electric Motor configured with name measurement','2016-11-17 21:18:54',1),(1787,1,'Electric Motor','device_triggers','1','INSERT','Electric Motor configured with Tank Overflow trigger','2016-11-17 21:18:54',1),(1788,1,'hanz','devices','13','UPDATE','Device - hanz modified','2016-11-17 21:20:46',1),(1789,1,'hanz','device_executions','1','INSERT','hanz configured with Stop Motor execution','2016-11-17 21:20:46',1),(1790,1,'hanz','device_executions','3','INSERT','hanz configured with Start Motor execution','2016-11-17 21:20:47',1),(1791,1,'hanz','device_measurements','8','INSERT','hanz configured with Level measurement','2016-11-17 21:20:47',1),(1792,1,'hanz','device_measurements','11','INSERT','hanz configured with Pressure measurement','2016-11-17 21:20:47',1),(1793,1,'hanz','device_measurements','18','INSERT','hanz configured with Cookin measurement','2016-11-17 21:20:47',1),(1794,1,'hanz','device_triggers','4','INSERT','hanz configured with Overheated Motor trigger','2016-11-17 21:20:47',1),(1795,1,'hanz','device_triggers','6','INSERT','hanz configured with Stuck Valve trigger','2016-11-17 21:20:47',1),(1796,1,'hanz','devices','13','UPDATE','Device - hanz modified','2016-11-17 21:21:19',1),(1797,1,'hanz','device_executions','1','INSERT','hanz configured with Stop Motor execution','2016-11-17 21:21:19',1),(1798,1,'hanz','device_executions','2','INSERT','hanz configured with Reboot OPCUA Server execution','2016-11-17 21:21:19',1),(1799,1,'hanz','device_executions','3','INSERT','hanz configured with Start Motor execution','2016-11-17 21:21:19',1),(1800,1,'hanz','device_measurements','11','INSERT','hanz configured with Pressure measurement','2016-11-17 21:21:20',1),(1801,1,'hanz','device_measurements','18','INSERT','hanz configured with Cookin measurement','2016-11-17 21:21:20',1),(1802,1,'hanz','device_measurements','19','INSERT','hanz configured with Becca1 measurement','2016-11-17 21:21:20',1),(1803,1,'hanz','device_triggers','1','INSERT','hanz configured with Tank Overflow trigger','2016-11-17 21:21:20',1),(1804,1,'hanz','device_triggers','4','INSERT','hanz configured with Overheated Motor trigger','2016-11-17 21:21:20',1),(1805,1,'hanz','devices','13','DELETE','Device - hanz deleted','2016-11-17 21:22:34',1),(1806,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-11-17 21:59:58',0),(1807,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-11-18 02:18:00',0),(1808,1,'Electric Motor','devices','18','UPDATE','Device - Electric Motor modified','2016-11-18 02:48:42',1),(1809,1,'Electric Motor','device_executions','1','INSERT','Electric Motor configured with Stop Motor execution','2016-11-18 02:48:43',1),(1810,1,'Electric Motor','device_executions','3','INSERT','Electric Motor configured with Start Motor execution','2016-11-18 02:48:43',1),(1811,1,'Electric Motor','device_measurements','8','INSERT','Electric Motor configured with Level measurement','2016-11-18 02:48:43',1),(1812,1,'Electric Motor','device_measurements','9','INSERT','Electric Motor configured with Temperature measurement','2016-11-18 02:48:43',1),(1813,1,'Electric Motor','device_measurements','11','INSERT','Electric Motor configured with Pressure measurement','2016-11-18 02:48:43',1),(1814,1,'Electric Motor','device_triggers','4','INSERT','Electric Motor configured with Overheated Motor trigger','2016-11-18 02:48:43',1),(1815,1,'Electric Motor','devices','17','DELETE','Device - Electric Motor deleted','2016-11-18 02:49:04',1),(1816,1,'Electric Motor','devices','18','UPDATE','Device - Electric Motor modified','2016-11-18 02:51:11',1),(1817,1,'Electric Motor','devices','18','UPDATE','Device - Electric Motor modified','2016-11-18 02:51:27',1),(1818,1,'Electric Motor','device_executions','1','INSERT','Electric Motor configured with Stop Motor execution','2016-11-18 02:51:27',1),(1819,1,'Electric Motor','device_executions','3','INSERT','Electric Motor configured with Start Motor execution','2016-11-18 02:51:27',1),(1820,1,'Electric Motor','device_measurements','9','INSERT','Electric Motor configured with Temperature measurement','2016-11-18 02:51:27',1),(1821,1,'Electric Motor','device_measurements','11','INSERT','Electric Motor configured with Pressure measurement','2016-11-18 02:51:28',1),(1822,1,'Electric Motor','device_measurements','18','INSERT','Electric Motor configured with Cookin measurement','2016-11-18 02:51:28',1),(1823,1,'Electric Motor','device_triggers','4','INSERT','Electric Motor configured with Overheated Motor trigger','2016-11-18 02:51:28',1),(1824,1,'JST','tags','14','INSERT','New tag - JST added','2016-11-18 02:57:29',1),(1825,1,'KST','tags','15','INSERT','New tag - KST added','2016-11-18 02:57:43',1),(1826,1,'LST','tags','16','INSERT','New tag - LST added','2016-11-18 02:57:58',1),(1827,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-11-18 03:21:42',0),(1828,5,'Shutdown Pump','actions','1','UPDATE','Action - Shutdown Pump modified','2016-11-18 04:03:03',1),(1829,5,'Shutdown Pump','actions','1','UPDATE','Action - Shutdown Pump modified','2016-11-18 04:40:02',1),(1830,5,'Shutdown Pump','actions','1','UPDATE','Action - Shutdown Pump modified','2016-11-18 04:42:25',1),(1831,5,'Startup Pump','actions','2','UPDATE','Action - Startup Pump modified','2016-11-18 04:42:52',1),(1832,5,'Shutdown Pump','actions','1','UPDATE','Action - Shutdown Pump modified','2016-11-18 04:51:05',1),(1833,5,'Shutdown Pump','actions','1','UPDATE','Action - Shutdown Pump modified','2016-11-18 04:52:50',1),(1834,5,'Shutdown Pump','actions','1','UPDATE','Action - Shutdown Pump modified','2016-11-18 04:53:28',1),(1835,5,'Shutdown Pump','actions','1','UPDATE','Action - Shutdown Pump modified','2016-11-18 04:53:41',1),(1836,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-11-18 05:20:14',0),(1837,1,'Shutdown Pump','actions','1','UPDATE','Action - Shutdown Pump modified','2016-11-18 05:20:39',1),(1838,1,'Shutdown Pump','action_tags','14','INSERT','Shutdown Pump configured with JST tag','2016-11-18 05:20:39',1),(1839,1,'Shutdown Pump','action_tags','16','INSERT','Shutdown Pump configured with LST tag','2016-11-18 05:20:39',1),(1840,1,'Shutdown Pump','actions','1','UPDATE','Action - Shutdown Pump modified','2016-11-18 05:21:14',1),(1841,1,'Shutdown Pump','action_tags','15','INSERT','Shutdown Pump configured with KST tag','2016-11-18 05:21:14',1),(1842,1,'Reboot OPCUA Server','actions','5','UPDATE','Action - Reboot OPCUA Server modified','2016-11-18 05:22:12',1),(1843,1,'Reboot OPCUA Server','action_tags','14','INSERT','Reboot OPCUA Server configured with JST tag','2016-11-18 05:22:12',1),(1844,1,'Reboot OPCUA Server','actions','5','UPDATE','Action - Reboot OPCUA Server modified','2016-11-18 05:22:14',1),(1845,1,'Reboot OPCUA Server','action_tags','14','INSERT','Reboot OPCUA Server configured with JST tag','2016-11-18 05:22:14',1),(1846,1,'Shutdown Pump','actions','1','UPDATE','Action - Shutdown Pump modified','2016-11-18 05:23:10',1),(1847,1,'Shutdown Pump','action_tags','14','INSERT','Shutdown Pump configured with JST tag','2016-11-18 05:23:10',1),(1848,1,'Shutdown Pump','action_tags','16','INSERT','Shutdown Pump configured with LST tag','2016-11-18 05:23:10',1),(1849,1,'Shutdown Pump','actions','1','UPDATE','Action - Shutdown Pump modified','2016-11-18 05:23:24',1),(1850,1,'Shutdown Pump','action_tags','15','INSERT','Shutdown Pump configured with KST tag','2016-11-18 05:23:24',1),(1851,1,'Just Because','actions','6','INSERT','New action - Just Because added','2016-11-18 05:24:43',1),(1852,1,'Just Because','action_tags','14','INSERT','Just Because configured with JST tag','2016-11-18 05:24:43',1),(1853,1,'Just Because','action_tags','15','INSERT','Just Because configured with KST tag','2016-11-18 05:24:43',1),(1854,1,'Just Because','actions','6','UPDATE','Action - Just Because modified','2016-11-18 05:25:00',1),(1855,1,'Just Because','action_tags','14','INSERT','Just Because configured with JST tag','2016-11-18 05:25:00',1),(1856,1,'Just Because','actions','6','UPDATE','Action - Just Because modified','2016-11-18 05:25:20',1),(1857,1,'Just Because','action_tags','15','INSERT','Just Because configured with KST tag','2016-11-18 05:25:20',1),(1858,1,'Just Because','action_tags','16','INSERT','Just Because configured with LST tag','2016-11-18 05:25:20',1),(1859,1,'Just Because','actions','6','UPDATE','Action - Just Because modified','2016-11-18 05:25:32',1),(1860,1,'Just Because','action_tags','14','INSERT','Just Because configured with JST tag','2016-11-18 05:25:32',1),(1861,1,'Just Because','action_tags','16','INSERT','Just Because configured with LST tag','2016-11-18 05:25:32',1),(1862,1,'Overheated Motor','triggers','4','UPDATE','Trigger - Overheated Motor modified','2016-11-18 05:26:21',1),(1863,1,'Overheated Motor','trigger_actions','1','INSERT','Overheated Motor configured with Shutdown Pump action','2016-11-18 05:26:21',1),(1864,1,'Overheated Motor','trigger_actions','3','INSERT','Overheated Motor configured with Shut off Valve action','2016-11-18 05:26:21',1),(1865,1,'Overheated Motor','trigger_tags','10','INSERT','Overheated Motor configured with FST trigger','2016-11-18 05:26:21',1),(1866,1,'Overheated Motor','triggers','4','UPDATE','Trigger - Overheated Motor modified','2016-11-18 05:28:25',1),(1867,1,'Overheated Motor','trigger_actions','2','INSERT','Overheated Motor configured with Startup Pump action','2016-11-18 05:28:25',1),(1868,1,'Overheated Motor','trigger_actions','6','INSERT','Overheated Motor configured with Just Because action','2016-11-18 05:28:25',1),(1869,1,'Overheated Motor','trigger_tags','5','INSERT','Overheated Motor configured with CST trigger','2016-11-18 05:28:26',1),(1870,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-11-18 15:32:28',0),(1871,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-11-18 16:17:38',0),(1872,5,'Site','sites','38','INSERT','New site - Site added','2016-11-18 17:26:45',1),(1873,5,'Site','site_objects','2','INSERT','Site configured with ACME XFR - 24 Oil Tank object','2016-11-18 17:26:45',1),(1874,5,'Site','site_objects','3','INSERT','Site configured with Sampson RR - 26 Water Tank object','2016-11-18 17:26:45',1),(1875,5,'Site','site_objects','5','INSERT','Site configured with Drake 25 Series Pump Jack object','2016-11-18 17:26:45',1),(1876,5,'Account Admins','groups','10','INSERT','New group - Account Admins added','2016-11-18 17:47:07',1),(1877,5,'IT','groups','11','INSERT','New group - IT added','2016-11-18 17:47:52',1),(1878,5,'Pumpers','groups','12','INSERT','New group - Pumpers added','2016-11-18 17:48:05',1),(1879,5,'Administration','departments','8','INSERT','New department - Administration added','2016-11-18 17:49:23',1),(1880,5,'Office','departments','10','INSERT','New department - Office added','2016-11-18 18:00:56',1),(1881,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-11-18 19:21:58',0),(1882,5,'Account Admins','group_permissions','10','INSERT','Account Admins granted access to Admin','2016-11-18 19:23:05',1),(1883,5,'Account Admins','group_permissions','10','INSERT','Account Admins granted access to Departments','2016-11-18 19:23:05',1),(1884,5,'Account Admins','group_permissions','10','INSERT','Account Admins granted access to Groups','2016-11-18 19:23:05',1),(1885,5,'Account Admins','group_permissions','10','INSERT','Account Admins granted access to Sites','2016-11-18 19:23:05',1),(1886,5,'Account Admins','group_permissions','10','INSERT','Account Admins granted access to Users','2016-11-18 19:23:05',1),(1887,5,'Account Admins','group_permissions','10','INSERT','Account Admins granted access to Dashboard','2016-11-18 19:23:05',1),(1888,5,'Account Admins','group_permissions','10','INSERT','Account Admins granted access to Help','2016-11-18 19:23:05',1),(1889,5,'Account Admins','group_permissions','10','INSERT','Account Admins granted access to Submit Ticket','2016-11-18 19:23:05',1),(1890,5,'Account Admins','group_permissions','10','INSERT','Account Admins granted access to Tickets','2016-11-18 19:23:05',1),(1891,5,'Adam West','user_groups','10','INSERT','Adam West configured with Account Admins group','2016-11-18 19:28:36',1),(1892,5,'Adam West','user_groups','10','INSERT','Adam West configured with Account Admins group','2016-11-18 19:30:19',1),(1893,5,'Adam West','user_groups','11','INSERT','Adam West configured with IT group','2016-11-18 19:30:20',1),(1894,5,'Adam West','user_groups','10','INSERT','Adam West configured with Account Admins group','2016-11-18 19:30:45',1),(1895,5,'Adam West','user_groups','11','INSERT','Adam West configured with IT group','2016-11-18 19:30:45',1),(1896,5,'Adam West','users','36','LOGIN','awest logged in','2016-11-18 19:31:23',0),(1897,5,'Adam West','user_departments','8','INSERT','Adam West configured with Administration department','2016-11-18 19:33:18',36),(1898,5,'Adam West','user_departments','8','INSERT','Adam West configured with Administration department','2016-11-18 19:37:48',36),(1899,5,'Adam West','user_departments','8','INSERT','Adam West configured with Administration department','2016-11-18 19:38:21',36),(1900,5,'Adam West','users','36','LOGIN','awest logged in','2016-11-18 19:49:56',0),(1901,5,'Adam West','users','36','LOGIN','awest logged in','2016-11-18 20:13:35',0),(1902,5,'Adam West','users','36','LOGIN','awest logged in','2016-11-18 20:14:03',0),(1903,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-11-18 20:15:06',0),(1904,1,'John Technician','users','47','INSERT','New user - tech added','2016-11-18 20:16:30',1),(1905,1,'John Technician','user_groups','6','INSERT','John Technician configured with Technician group','2016-11-18 20:17:04',1),(1906,1,'Technicians','groups','6','UPDATE','Group - Technicians modified','2016-11-18 20:20:34',1),(1907,1,'Technicians','group_permissions','6','INSERT','Technicians granted access to Admin','2016-11-18 20:21:26',1),(1908,1,'Technicians','group_permissions','6','INSERT','Technicians granted access to Sites','2016-11-18 20:21:26',1),(1909,1,'Technicians','group_permissions','6','INSERT','Technicians granted access to System','2016-11-18 20:21:26',1),(1910,1,'Technicians','group_permissions','6','INSERT','Technicians granted access to Objects','2016-11-18 20:21:26',1),(1911,1,'Technicians','group_permissions','6','INSERT','Technicians granted access to Device Menu','2016-11-18 20:21:26',1),(1912,1,'Technicians','group_permissions','6','INSERT','Technicians granted access to Executions','2016-11-18 20:21:26',1),(1913,1,'Technicians','group_permissions','6','INSERT','Technicians granted access to Measurements','2016-11-18 20:21:26',1),(1914,1,'Technicians','group_permissions','6','INSERT','Technicians granted access to Triggers','2016-11-18 20:21:26',1),(1915,1,'Technicians','group_permissions','6','INSERT','Technicians granted access to Actions','2016-11-18 20:21:26',1),(1916,1,'Technicians','group_permissions','6','INSERT','Technicians granted access to Tags','2016-11-18 20:21:26',1),(1917,1,'Technicians','group_permissions','6','INSERT','Technicians granted access to Modules','2016-11-18 20:21:26',1),(1918,1,'Technicians','group_permissions','6','INSERT','Technicians granted access to Dashboard','2016-11-18 20:21:26',1),(1919,1,'Technicians','group_permissions','6','INSERT','Technicians granted access to Help','2016-11-18 20:21:26',1),(1920,1,'Technicians','group_permissions','6','INSERT','Technicians granted access to Submit Ticket','2016-11-18 20:21:26',1),(1921,1,'Technicians','group_permissions','6','INSERT','Technicians granted access to Tickets','2016-11-18 20:21:26',1),(1922,1,'John Technician','users','47','LOGIN','tech logged in','2016-11-18 20:22:07',0),(1923,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-11-18 20:23:01',0),(1924,1,'Technicians','group_permissions','6','INSERT','Technicians granted access to Admin','2016-11-18 20:23:15',1),(1925,1,'Technicians','group_permissions','6','INSERT','Technicians granted access to Sites','2016-11-18 20:23:15',1),(1926,1,'Technicians','group_permissions','6','INSERT','Technicians granted access to System','2016-11-18 20:23:15',1),(1927,1,'Technicians','group_permissions','6','INSERT','Technicians granted access to Objects','2016-11-18 20:23:15',1),(1928,1,'Technicians','group_permissions','6','INSERT','Technicians granted access to Device Menu','2016-11-18 20:23:15',1),(1929,1,'Technicians','group_permissions','6','INSERT','Technicians granted access to Executions','2016-11-18 20:23:15',1),(1930,1,'Technicians','group_permissions','6','INSERT','Technicians granted access to Measurements','2016-11-18 20:23:15',1),(1931,1,'Technicians','group_permissions','6','INSERT','Technicians granted access to Triggers','2016-11-18 20:23:15',1),(1932,1,'Technicians','group_permissions','6','INSERT','Technicians granted access to Actions','2016-11-18 20:23:15',1),(1933,1,'Technicians','group_permissions','6','INSERT','Technicians granted access to Tags','2016-11-18 20:23:15',1),(1934,1,'Technicians','group_permissions','6','INSERT','Technicians granted access to Dashboard','2016-11-18 20:23:15',1),(1935,1,'Technicians','group_permissions','6','INSERT','Technicians granted access to Help','2016-11-18 20:23:15',1),(1936,1,'Technicians','group_permissions','6','INSERT','Technicians granted access to Submit Ticket','2016-11-18 20:23:15',1),(1937,1,'Technicians','group_permissions','6','INSERT','Technicians granted access to Tickets','2016-11-18 20:23:15',1),(1938,1,'John Technician','users','47','LOGIN','tech logged in','2016-11-18 20:23:27',0),(1939,1,'John Technician','users','47','LOGIN','tech logged in','2016-11-18 20:49:59',0),(1940,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-11-18 20:52:57',0),(1941,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-11-18 21:25:06',0),(1942,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-11-18 21:38:18',0),(1943,5,'Oil Tank','objects','2','UPDATE','Object - Oil Tank modified','2016-11-18 22:03:15',1),(1944,5,'Oil Tank','object_devices','1','INSERT','Oil Tank configured with Tank Stick device','2016-11-18 22:03:16',1),(1945,5,'Oil Tank','object_devices','3','INSERT','Oil Tank configured with Transfer Pump device','2016-11-18 22:03:16',1),(1946,5,'Oil Tank','objects','2','UPDATE','Object - Oil Tank modified','2016-11-18 22:03:41',1),(1947,5,'Oil Tank','object_devices','1','INSERT','Oil Tank configured with Tank Stick device','2016-11-18 22:03:41',1),(1948,5,'Oil Tank','object_devices','3','INSERT','Oil Tank configured with Transfer Pump device','2016-11-18 22:03:41',1),(1949,5,'Oil Tank','objects','2','UPDATE','Object - Oil Tank modified','2016-11-18 22:05:56',1),(1950,5,'Oil Tank','object_devices','1','INSERT','Oil Tank configured with Tank Stick device','2016-11-18 22:05:56',1),(1951,5,'Oil Tank','object_devices','3','INSERT','Oil Tank configured with Transfer Pump device','2016-11-18 22:05:56',1),(1952,5,'Oil Tank','objects','2','UPDATE','Object - Oil Tank modified','2016-11-18 22:06:17',1),(1953,5,'Oil Tank','object_devices','1','INSERT','Oil Tank configured with Tank Stick device','2016-11-18 22:06:17',1),(1954,5,'Oil Tank','object_devices','3','INSERT','Oil Tank configured with Transfer Pump device','2016-11-18 22:06:17',1),(1955,5,'Oil Tank','objects','2','UPDATE','Object - Oil Tank modified','2016-11-18 22:07:24',1),(1956,5,'Oil Tank','object_devices','1','INSERT','Oil Tank configured with Tank Stick device','2016-11-18 22:07:24',1),(1957,5,'Oil Tank','object_devices','3','INSERT','Oil Tank configured with Transfer Pump device','2016-11-18 22:07:24',1),(1958,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-11-18 22:37:54',0),(1959,1,'Electric Motor','devices','18','UPDATE','Device - Electric Motor modified','2016-11-18 22:40:25',1),(1960,1,'Electric Motor','device_executions','1','INSERT','Electric Motor configured with Stop Motor execution','2016-11-18 22:40:25',1),(1961,1,'Electric Motor','device_executions','3','INSERT','Electric Motor configured with Start Motor execution','2016-11-18 22:40:25',1),(1962,1,'Electric Motor','device_measurements','9','INSERT','Electric Motor configured with Temperature measurement','2016-11-18 22:40:25',1),(1963,1,'Electric Motor','device_measurements','11','INSERT','Electric Motor configured with Pressure measurement','2016-11-18 22:40:25',1),(1964,1,'Electric Motor','device_measurements','18','INSERT','Electric Motor configured with Cookin measurement','2016-11-18 22:40:25',1),(1965,1,'Electric Motor','device_triggers','4','INSERT','Electric Motor configured with Overheated Motor trigger','2016-11-18 22:40:26',1),(1966,1,'Oil Tank','objects','2','UPDATE','Object - Oil Tank modified','2016-11-18 22:41:01',1),(1967,1,'Oil Tank','object_devices','1','INSERT','Oil Tank configured with Tank Stick device','2016-11-18 22:41:01',1),(1968,1,'Oil Tank','object_devices','3','INSERT','Oil Tank configured with Transfer Pump device','2016-11-18 22:41:01',1),(1969,1,'Oil Tank','objects','2','UPDATE','Object - Oil Tank modified','2016-11-18 22:42:27',1),(1970,1,'Oil Tank','object_devices','1','INSERT','Oil Tank configured with Tank Stick device','2016-11-18 22:42:27',1),(1971,1,'Oil Tank','object_devices','3','INSERT','Oil Tank configured with Transfer Pump device','2016-11-18 22:42:27',1),(1972,1,'Pump Jack','objects','5','UPDATE','Object - Pump Jack modified','2016-11-18 22:54:22',1),(1973,1,'Pump Jack','object_devices','1','INSERT','Pump Jack configured with Tank Stick device','2016-11-18 22:54:22',1),(1974,1,'Pump Jack','object_devices','2','INSERT','Pump Jack configured with Transducer device','2016-11-18 22:54:22',1),(1975,1,'Water Tank','objects','3','UPDATE','Object - Water Tank modified','2016-11-18 22:55:11',1),(1976,1,'Water Tank','object_devices','1','INSERT','Water Tank configured with Tank Stick device','2016-11-18 22:55:11',1),(1977,1,'Water Tank','object_devices','2','INSERT','Water Tank configured with Transducer device','2016-11-18 22:55:11',1),(1978,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-11-18 23:40:51',0),(1979,5,'Yankees Good Night','sites','15','UPDATE','Site - Yankees Good Night modified','2016-11-18 23:52:15',1),(1980,5,'Yankees Good Night','site_objects','2','INSERT','Yankees Good Night configured with Oil Tank object','2016-11-18 23:52:15',1),(1981,5,'Yankees Good Night','site_objects','3','INSERT','Yankees Good Night configured with Water Tank object','2016-11-18 23:52:15',1),(1982,5,'Yankees Good Night','site_objects','5','INSERT','Yankees Good Night configured with Pump Jack object','2016-11-18 23:52:15',1),(1983,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-11-19 14:26:36',0),(1984,1,'Oil Pump','devices','19','INSERT','New device - Oil Pump added','2016-11-19 14:28:09',1),(1985,1,'Oil Pump','device_executions','6','INSERT','Oil Pump configured with Test execution','2016-11-19 14:28:09',1),(1986,1,'Oil Pump','device_measurements','11','INSERT','Oil Pump configured with Pressure measurement','2016-11-19 14:28:10',1),(1987,1,'Oil Pump','device_measurements','19','INSERT','Oil Pump configured with Becca1 measurement','2016-11-19 14:28:10',1),(1988,1,'Oil Pump','device_triggers','6','INSERT','Oil Pump configured with Stuck Valve trigger','2016-11-19 14:28:10',1),(1989,1,'Oil Pump1','devices','19','UPDATE','Device - Oil Pump1 modified','2016-11-19 14:29:21',1),(1990,1,'Oil Pump1','device_executions','1','INSERT','Oil Pump1 configured with Stop Motor execution','2016-11-19 14:29:21',1),(1991,1,'Oil Pump1','device_executions','6','INSERT','Oil Pump1 configured with Test execution','2016-11-19 14:29:21',1),(1992,1,'Oil Pump1','device_measurements','8','INSERT','Oil Pump1 configured with Level measurement','2016-11-19 14:29:21',1),(1993,1,'Oil Pump1','device_measurements','11','INSERT','Oil Pump1 configured with Pressure measurement','2016-11-19 14:29:21',1),(1994,1,'Oil Pump1','device_measurements','19','INSERT','Oil Pump1 configured with Becca1 measurement','2016-11-19 14:29:21',1),(1995,1,'Oil Pump1','device_triggers','1','INSERT','Oil Pump1 configured with Tank Overflow trigger','2016-11-19 14:29:21',1),(1996,1,'Oil Pump1','device_triggers','6','INSERT','Oil Pump1 configured with Stuck Valve trigger','2016-11-19 14:29:21',1),(1997,1,'Oil Pump','devices','19','UPDATE','Device - Oil Pump modified','2016-11-19 14:29:44',1),(1998,1,'Oil Pump','device_executions','1','INSERT','Oil Pump configured with Stop Motor execution','2016-11-19 14:29:44',1),(1999,1,'Oil Pump','device_executions','6','INSERT','Oil Pump configured with Test execution','2016-11-19 14:29:44',1),(2000,1,'Oil Pump','device_measurements','8','INSERT','Oil Pump configured with Level measurement','2016-11-19 14:29:44',1),(2001,1,'Oil Pump','device_measurements','11','INSERT','Oil Pump configured with Pressure measurement','2016-11-19 14:29:45',1),(2002,1,'Oil Pump','device_measurements','19','INSERT','Oil Pump configured with Becca1 measurement','2016-11-19 14:29:45',1),(2003,1,'Oil Pump','device_triggers','1','INSERT','Oil Pump configured with Tank Overflow trigger','2016-11-19 14:29:45',1),(2004,1,'Oil Pump','device_triggers','6','INSERT','Oil Pump configured with Stuck Valve trigger','2016-11-19 14:29:45',1),(2005,1,'Kill Site','executions','7','INSERT','New execution - Kill Site added','2016-11-19 14:38:10',1),(2006,1,'Kill Site','execution_tags','1','INSERT','Kill Site configured with Stop Motor tag','2016-11-19 14:38:10',1),(2007,1,'Kill Site','execution_tags','11','INSERT','Kill Site configured with  tag','2016-11-19 14:38:11',1),(2008,1,'Kill Site1','executions','7','UPDATE','Execution - Kill Site1 modified','2016-11-19 14:38:24',1),(2009,1,'Kill Site1','execution_tags','8','INSERT','Kill Site1 configured with  tag','2016-11-19 14:38:24',1),(2010,1,'Kill Site','executions','7','UPDATE','Execution - Kill Site modified','2016-11-19 14:38:38',1),(2011,1,'Kill Site','execution_tags','11','INSERT','Kill Site configured with  tag','2016-11-19 14:38:38',1),(2012,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-11-19 20:21:18',0),(2013,1,'Heater Treater','devices','20','INSERT','New device - Heater Treater added','2016-11-19 20:32:23',1),(2014,1,'Heater Treater','device_executions','1','INSERT','Heater Treater configured with Stop Motor execution','2016-11-19 20:32:24',1),(2015,1,'Heater Treater','device_measurements','9','INSERT','Heater Treater configured with Temperature measurement','2016-11-19 20:32:24',1),(2016,1,'Heater Treater','device_measurements','11','INSERT','Heater Treater configured with Pressure measurement','2016-11-19 20:32:24',1),(2017,1,'Heater Treater','device_measurements','18','INSERT','Heater Treater configured with Cookin measurement','2016-11-19 20:32:24',1),(2018,1,'Heater Treater','device_triggers','4','INSERT','Heater Treater configured with Overheated Motor trigger','2016-11-19 20:32:24',1),(2019,1,'Heater Treater','device_triggers','6','INSERT','Heater Treater configured with Stuck Valve trigger','2016-11-19 20:32:24',1),(2020,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-11-19 20:57:26',0),(2021,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-11-19 22:29:51',0),(2022,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-11-19 22:51:51',0),(2023,1,'Stop Motor','executions','1','UPDATE','Execution - Stop Motor modified','2016-11-19 23:12:50',1),(2024,1,'Stop Motor','execution_tags','1','INSERT','Stop Motor configured with Stop Motor tag','2016-11-19 23:12:50',1),(2025,1,'Stop Motor','execution_tags','8','INSERT','Stop Motor configured with  tag','2016-11-19 23:12:50',1),(2026,1,'Notify Super','executions','8','INSERT','New execution - Notify Super added','2016-11-19 23:42:29',1),(2027,1,'Notify Super','execution_tags','1','INSERT','Notify Super configured with Stop Motor tag','2016-11-19 23:42:30',1),(2028,1,'Notify Super','execution_tags','11','INSERT','Notify Super configured with  tag','2016-11-19 23:42:30',1),(2029,1,'Notify Super1','executions','8','UPDATE','Execution - Notify Super1 modified','2016-11-19 23:43:11',1),(2030,1,'Notify Super1','execution_tags','8','INSERT','Notify Super1 configured with Notify Super1 tag','2016-11-19 23:43:11',1),(2031,1,'Notify Super1','execution_tags','11','INSERT','Notify Super1 configured with  tag','2016-11-19 23:43:11',1),(2032,1,'Notify Super','executions','8','UPDATE','Execution - Notify Super modified','2016-11-19 23:43:29',1),(2033,1,'Notify Super','execution_tags','8','INSERT','Notify Super configured with Notify Super tag','2016-11-19 23:43:30',1),(2034,1,'Notify Super','execution_tags','11','INSERT','Notify Super configured with  tag','2016-11-19 23:43:30',1),(2035,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-11-20 00:16:29',0),(2036,1,'Catastrophic Faliure','triggers','7','INSERT','New trigger - Catastrophic Faliure added','2016-11-20 01:18:38',1),(2037,1,'Catastrophic Faliure','trigger_actions','5','INSERT','Catastrophic Faliure configured with Reboot OPCUA Server action','2016-11-20 01:18:38',1),(2038,1,'Catastrophic Faliure','trigger_actions','3','INSERT','Catastrophic Faliure configured with Shut off Valve action','2016-11-20 01:18:38',1),(2039,1,'Catastrophic Faliure','trigger_actions','1','INSERT','Catastrophic Faliure configured with Shutdown Pump action','2016-11-20 01:18:38',1),(2040,1,'Catastrophic Faliure','trigger_tags','5','INSERT','Catastrophic Faliure configured with CST tag','2016-11-20 01:18:38',1),(2041,1,'Catastrophic Faliure1','triggers','7','UPDATE','Trigger - Catastrophic Faliure1 modified','2016-11-20 01:19:01',1),(2042,1,'Catastrophic Faliure1','trigger_actions','4','INSERT','Catastrophic Faliure1 configured with Open Valve action','2016-11-20 01:19:01',1),(2043,1,'Catastrophic Faliure1','trigger_tags','13','INSERT','Catastrophic Faliure1 configured with IST tag','2016-11-20 01:19:02',1),(2044,1,'Catastrophic Faliure1','triggers','7','UPDATE','Trigger - Catastrophic Faliure1 modified','2016-11-20 01:19:23',1),(2045,1,'Catastrophic Faliure1','trigger_actions','1','INSERT','Catastrophic Faliure1 configured with Shutdown Pump action','2016-11-20 01:19:23',1),(2046,1,'Catastrophic Faliure1','trigger_actions','3','INSERT','Catastrophic Faliure1 configured with Shut off Valve action','2016-11-20 01:19:23',1),(2047,1,'Catastrophic Faliure1','trigger_actions','5','INSERT','Catastrophic Faliure1 configured with Reboot OPCUA Server action','2016-11-20 01:19:24',1),(2048,1,'Catastrophic Faliure1','trigger_tags','13','INSERT','Catastrophic Faliure1 configured with IST tag','2016-11-20 01:19:24',1),(2049,1,'Catastrophic Faliure','triggers','7','UPDATE','Trigger - Catastrophic Faliure modified','2016-11-20 01:19:34',1),(2050,1,'Catastrophic Faliure','trigger_actions','1','INSERT','Catastrophic Faliure configured with Shutdown Pump action','2016-11-20 01:19:34',1),(2051,1,'Catastrophic Faliure','trigger_actions','3','INSERT','Catastrophic Faliure configured with Shut off Valve action','2016-11-20 01:19:34',1),(2052,1,'Catastrophic Faliure','trigger_actions','5','INSERT','Catastrophic Faliure configured with Reboot OPCUA Server action','2016-11-20 01:19:34',1),(2053,1,'Catastrophic Faliure','trigger_tags','13','INSERT','Catastrophic Faliure configured with IST tag','2016-11-20 01:19:34',1),(2054,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-11-20 04:16:37',0),(2055,1,'Now is the Time','actions','7','INSERT','New action - Now is the Time added','2016-11-20 05:02:14',1),(2056,1,'Now is the Time','action_tags','14','INSERT','Now is the Time configured with JST tag','2016-11-20 05:02:14',1),(2057,1,'Now is the Time','action_tags','15','INSERT','Now is the Time configured with KST tag','2016-11-20 05:02:14',1),(2058,1,'Now is the Time1','actions','7','UPDATE','Action - Now is the Time1 modified','2016-11-20 05:02:37',1),(2059,1,'Now is the Time1','action_tags','15','INSERT','Now is the Time1 configured with KST tag','2016-11-20 05:02:37',1),(2060,1,'Now is the Time1','action_tags','16','INSERT','Now is the Time1 configured with LST tag','2016-11-20 05:02:37',1),(2061,1,'Now is the Time','actions','7','UPDATE','Action - Now is the Time modified','2016-11-20 05:03:00',1),(2062,1,'Now is the Time','action_tags','16','INSERT','Now is the Time configured with LST tag','2016-11-20 05:03:00',1),(2063,1,'Shutdown Pump','actions','1','UPDATE','Action - Shutdown Pump  deactivated','2016-11-20 05:17:15',1),(2064,1,'Shutdown Pump','actions','1','UPDATE','Action - Shutdown Pump  reactivated','2016-11-20 05:17:19',1),(2065,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-11-20 06:01:46',0),(2066,1,'Transducer','devices','2','UPDATE','Device - Transducer modified','2016-11-20 07:36:33',1),(2067,1,'Transducer','device_executions','2','INSERT','Transducer configured with Reboot OPCUA Server execution','2016-11-20 07:36:33',1),(2068,1,'Transducer','device_executions','3','INSERT','Transducer configured with Start Motor execution','2016-11-20 07:36:33',1),(2069,1,'Transducer','device_measurements','8','INSERT','Transducer configured with Level measurement','2016-11-20 07:36:33',1),(2070,1,'Transducer','device_measurements','11','INSERT','Transducer configured with Pressure measurement','2016-11-20 07:36:34',1),(2071,1,'Transducer','device_triggers','1','INSERT','Transducer configured with Tank Overflow trigger','2016-11-20 07:36:34',1),(2072,1,'Transducer','device_triggers','7','INSERT','Transducer configured with Catastrophic Faliure trigger','2016-11-20 07:36:34',1),(2073,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-11-20 17:35:17',0),(2074,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-11-20 17:35:36',0),(2075,1,'Oil Tank','objects','2','UPDATE','Object - Oil Tank modified','2016-11-20 17:36:52',1),(2076,1,'Oil Tank','object_devices','1','INSERT','Oil Tank configured with Tank Stick device','2016-11-20 17:36:52',1),(2077,1,'Oil Tank','object_devices','3','INSERT','Oil Tank configured with Transfer Pump device','2016-11-20 17:36:52',1),(2078,1,'Oil Tank','object_devices','18','INSERT','Oil Tank configured with Electric Motor device','2016-11-20 17:36:52',1),(2079,1,'Oil Tank','object_devices','19','INSERT','Oil Tank configured with Oil Pump device','2016-11-20 17:36:52',1),(2080,1,'Oil Tank','object_devices','20','INSERT','Oil Tank configured with Heater Treater device','2016-11-20 17:36:52',1),(2081,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-11-20 19:33:44',0),(2082,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-11-20 20:39:03',0),(2083,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-11-20 21:07:28',0),(2084,1,'Administration','departments','1','UPDATE','Department - Administration modified','2016-11-20 21:26:32',1),(2085,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-11-20 23:07:42',0),(2086,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-11-21 05:38:47',0),(2087,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-11-21 18:24:07',0),(2088,5,'Adam West','users','36','LOGIN','awest logged in','2016-11-21 18:25:01',0),(2089,5,'Adam West','users','36','LOGIN','awest logged in','2016-11-21 18:57:37',0),(2090,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-11-21 21:20:43',0),(2091,5,'Comanche #1','sites','13','UPDATE','Site - Comanche #1 modified','2016-11-21 21:38:00',1),(2092,5,'Comanche #1','site_objects','2','INSERT','Comanche #1 configured with Oil Tank object','2016-11-21 21:38:00',1),(2093,5,'Comanche #1','site_objects','3','INSERT','Comanche #1 configured with Water Tank object','2016-11-21 21:38:01',1),(2094,5,'Comanche #1','sites','13','UPDATE','Site - Comanche #1 modified','2016-11-21 21:39:06',1),(2095,5,'Comanche #1','site_objects','2','INSERT','Comanche #1 configured with Oil Tank object','2016-11-21 21:39:06',1),(2096,5,'Comanche #1','site_objects','3','INSERT','Comanche #1 configured with Water Tank object','2016-11-21 21:39:06',1),(2097,5,'Comanche #1','sites','13','UPDATE','Site - Comanche #1 modified','2016-11-21 21:40:27',1),(2098,5,'Comanche #1','site_objects','2','INSERT','Comanche #1 configured with Oil Tank object','2016-11-21 21:40:27',1),(2099,5,'Comanche #1','site_objects','3','INSERT','Comanche #1 configured with Water Tank object','2016-11-21 21:40:27',1),(2100,5,'Comanche #2','sites','17','UPDATE','Site - Comanche #2 modified','2016-11-21 21:41:26',1),(2101,5,'Comanche #2','site_objects','2','INSERT','Comanche #2 configured with Oil Tank object','2016-11-21 21:41:26',1),(2102,5,'Comanche #2','site_objects','4','INSERT','Comanche #2 configured with Test\'s object','2016-11-21 21:41:27',1),(2103,5,'Comanche #2','site_objects','5','INSERT','Comanche #2 configured with Pump Jack object','2016-11-21 21:41:27',1),(2104,5,'Comanche #3','sites','11','UPDATE','Site - Comanche #3 modified','2016-11-21 21:43:24',1),(2105,5,'Comanche #3','site_objects','2','INSERT','Comanche #3 configured with Oil Tank object','2016-11-21 21:43:25',1),(2106,5,'Comanche #3','site_objects','3','INSERT','Comanche #3 configured with Water Tank object','2016-11-21 21:43:25',1),(2107,5,'Comanche #3','site_objects','5','INSERT','Comanche #3 configured with Pump Jack object','2016-11-21 21:43:25',1),(2108,5,'Apache #1','sites','16','UPDATE','Site - Apache #1 modified','2016-11-21 21:54:19',1),(2109,5,'Apache #1','site_objects','2','INSERT','Apache #1 configured with Oil Tank object','2016-11-21 21:54:19',1),(2110,5,'Apache #1','site_objects','3','INSERT','Apache #1 configured with Water Tank object','2016-11-21 21:54:19',1),(2111,5,'Apache #1','site_objects','5','INSERT','Apache #1 configured with Pump Jack object','2016-11-21 21:54:19',1),(2112,5,'Apache #2','sites','5','UPDATE','Site - Apache #2 modified','2016-11-21 21:54:39',1),(2113,5,'Apache #3','sites','12','UPDATE','Site - Apache #3 modified','2016-11-21 21:55:25',1),(2114,5,'Apache #3','site_objects','2','INSERT','Apache #3 configured with Oil Tank object','2016-11-21 21:55:25',1),(2115,5,'Apache #3','site_objects','4','INSERT','Apache #3 configured with Test\'s object','2016-11-21 21:55:25',1),(2116,5,'Apache #3','site_objects','6','INSERT','Apache #3 configured with 1234 object','2016-11-21 21:55:25',1),(2117,5,'Apache #3','sites','12','UPDATE','Site - Apache #3 modified','2016-11-21 21:56:43',1),(2118,5,'Apache #3','site_objects','2','INSERT','Apache #3 configured with Oil Tank object','2016-11-21 21:56:43',1),(2119,5,'Apache #3','site_objects','4','INSERT','Apache #3 configured with Test\'s object','2016-11-21 21:56:43',1),(2120,5,'Apache #3','site_objects','6','INSERT','Apache #3 configured with 1234 object','2016-11-21 21:56:43',1),(2121,5,'Apache #3','sites','12','UPDATE','Site - Apache #3 modified','2016-11-21 21:57:33',1),(2122,5,'Apache #3','site_objects','2','INSERT','Apache #3 configured with Oil Tank object','2016-11-21 21:57:33',1),(2123,5,'Apache #3','site_objects','4','INSERT','Apache #3 configured with Test\'s object','2016-11-21 21:57:33',1),(2124,5,'Apache #3','site_objects','6','INSERT','Apache #3 configured with 1234 object','2016-11-21 21:57:33',1),(2125,5,'Comanche #4','sites','19','UPDATE','Site - Comanche #4 modified','2016-11-21 21:59:19',1),(2126,5,'Comanche #4','site_objects','3','INSERT','Comanche #4 configured with Water Tank object','2016-11-21 21:59:19',1),(2127,5,'Comanche #4','site_objects','5','INSERT','Comanche #4 configured with Pump Jack object','2016-11-21 21:59:19',1),(2128,5,'Comanche #4','sites','19','UPDATE','Site - Comanche #4 modified','2016-11-21 21:59:58',1),(2129,5,'Comanche #4','site_objects','3','INSERT','Comanche #4 configured with Water Tank object','2016-11-21 21:59:59',1),(2130,5,'Comanche #4','site_objects','5','INSERT','Comanche #4 configured with Pump Jack object','2016-11-21 21:59:59',1),(2131,5,'Comanche #5','sites','6','UPDATE','Site - Comanche #5 modified','2016-11-21 22:01:07',1),(2132,5,'Comanche #5','site_objects','2','INSERT','Comanche #5 configured with Oil Tank object','2016-11-21 22:01:07',1),(2133,5,'Comanche #5','site_objects','3','INSERT','Comanche #5 configured with Water Tank object','2016-11-21 22:01:07',1),(2134,5,'Comanche #6','sites','7','UPDATE','Site - Comanche #6 modified','2016-11-21 22:01:28',1),(2135,5,'Iroquois #1','sites','34','UPDATE','Site - Iroquois #1 modified','2016-11-21 22:04:01',1),(2136,5,'Iroquois #1','site_objects','2','INSERT','Iroquois #1 configured with Oil Tank object','2016-11-21 22:04:01',1),(2137,5,'Iroquois #1','site_objects','3','INSERT','Iroquois #1 configured with Water Tank object','2016-11-21 22:04:01',1),(2138,5,'Iroquois #1','site_objects','5','INSERT','Iroquois #1 configured with Pump Jack object','2016-11-21 22:04:01',1),(2139,5,'Iroquois #2','sites','30','UPDATE','Site - Iroquois #2 modified','2016-11-21 22:04:20',1),(2140,5,'Iroquois #3','sites','20','UPDATE','Site - Iroquois #3 modified','2016-11-21 22:05:13',1),(2141,5,'Iroquois #3','site_objects','2','INSERT','Iroquois #3 configured with Oil Tank object','2016-11-21 22:05:13',1),(2142,5,'Iroquois #3','site_objects','3','INSERT','Iroquois #3 configured with Water Tank object','2016-11-21 22:05:13',1),(2143,5,'Iroquois #3','sites','20','UPDATE','Site - Iroquois #3 modified','2016-11-21 22:05:49',1),(2144,5,'Iroquois #3','site_objects','2','INSERT','Iroquois #3 configured with Oil Tank object','2016-11-21 22:05:49',1),(2145,5,'Iroquois #3','site_objects','3','INSERT','Iroquois #3 configured with Water Tank object','2016-11-21 22:05:49',1),(2146,5,'Iroquois #1','sites','34','UPDATE','Site - Iroquois #1 modified','2016-11-21 22:06:40',1),(2147,5,'Iroquois #1','site_objects','2','INSERT','Iroquois #1 configured with Oil Tank object','2016-11-21 22:06:40',1),(2148,5,'Iroquois #1','site_objects','3','INSERT','Iroquois #1 configured with Water Tank object','2016-11-21 22:06:40',1),(2149,5,'Iroquois #1','site_objects','5','INSERT','Iroquois #1 configured with Pump Jack object','2016-11-21 22:06:40',1),(2150,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-11-22 01:37:58',0),(2151,5,'Golden Field #1','sites','22','UPDATE','Site - Golden Field #1 modified','2016-11-22 01:42:54',1),(2152,5,'Golden Field #1','site_objects','5','INSERT','Golden Field #1 configured with Pump Jack object','2016-11-22 01:42:54',1),(2153,5,'Golden Field #2','sites','18','UPDATE','Site - Golden Field #2 modified','2016-11-22 01:43:13',1),(2154,5,'Golden Field #2','site_objects','2','INSERT','Golden Field #2 configured with Oil Tank object','2016-11-22 01:43:13',1),(2155,5,'Golden Field #2','site_objects','4','INSERT','Golden Field #2 configured with Test\'s object','2016-11-22 01:43:13',1),(2156,5,'Golden Field #2','site_objects','8','INSERT','Golden Field #2 configured with sdtwgbw object','2016-11-22 01:43:13',1),(2157,5,'Golden Field #3','sites','38','UPDATE','Site - Golden Field #3 modified','2016-11-22 01:43:33',1),(2158,5,'Golden Field #3','site_objects','2','INSERT','Golden Field #3 configured with Oil Tank object','2016-11-22 01:43:33',1),(2159,5,'Golden Field #3','site_objects','3','INSERT','Golden Field #3 configured with Water Tank object','2016-11-22 01:43:33',1),(2160,5,'Golden Field #3','site_objects','5','INSERT','Golden Field #3 configured with Pump Jack object','2016-11-22 01:43:33',1),(2161,5,'Golden Field #4','sites','21','UPDATE','Site - Golden Field #4 modified','2016-11-22 01:43:48',1),(2162,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-11-22 02:17:48',0),(2163,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-11-22 03:59:12',0),(2164,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-11-22 21:15:17',0),(2165,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-11-22 22:20:01',0),(2166,5,'Comanche #5','sites','39','INSERT','New site - Comanche #5 added','2016-11-22 22:33:50',1),(2167,5,'Comanche #5','site_objects','2','INSERT','Comanche #5 configured with Oil Tank object','2016-11-22 22:33:51',1),(2168,5,'Comanche #5','site_objects','3','INSERT','Comanche #5 configured with Water Tank object','2016-11-22 22:33:51',1),(2169,5,'Comanche #5','site_objects','5','INSERT','Comanche #5 configured with Pump Jack object','2016-11-22 22:33:51',1),(2170,5,'Comanche #7','sites','39','UPDATE','Site - Comanche #7 modified','2016-11-22 22:34:07',1),(2171,5,'Comanche #7','site_objects','2','INSERT','Comanche #7 configured with Oil Tank object','2016-11-22 22:34:07',1),(2172,5,'Comanche #7','site_objects','3','INSERT','Comanche #7 configured with Water Tank object','2016-11-22 22:34:07',1),(2173,5,'Comanche #7','site_objects','5','INSERT','Comanche #7 configured with Pump Jack object','2016-11-22 22:34:07',1),(2174,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-11-22 23:38:37',0),(2175,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-11-23 00:00:41',0),(2176,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-11-23 00:16:01',0),(2177,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-11-23 00:27:13',0),(2178,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-11-24 14:36:42',0),(2179,1,'Object Menu','modules','24','UPDATE','Module - Object Menu modified','2016-11-24 15:00:38',1),(2180,1,'Objects','modules','48','INSERT','New module - Objects created','2016-11-24 15:01:09',1),(2181,1,'Object Images','modules','49','INSERT','New module - Object Images created','2016-11-24 15:01:49',1),(2182,1,'Images','modules','49','UPDATE','Module - Images modified','2016-11-24 15:02:44',1),(2183,1,'Super User','group_permissions','1','INSERT','Super User granted access to Admin','2016-11-24 15:03:03',1),(2184,1,'Super User','group_permissions','1','INSERT','Super User granted access to Departments','2016-11-24 15:03:03',1),(2185,1,'Super User','group_permissions','1','INSERT','Super User granted access to Groups','2016-11-24 15:03:03',1),(2186,1,'Super User','group_permissions','1','INSERT','Super User granted access to Sites','2016-11-24 15:03:03',1),(2187,1,'Super User','group_permissions','1','INSERT','Super User granted access to Users','2016-11-24 15:03:03',1),(2188,1,'Super User','group_permissions','1','INSERT','Super User granted access to System','2016-11-24 15:03:03',1),(2189,1,'Super User','group_permissions','1','INSERT','Super User granted access to Accounts','2016-11-24 15:03:03',1),(2190,1,'Super User','group_permissions','1','INSERT','Super User granted access to Admin Log','2016-11-24 15:03:03',1),(2191,1,'Super User','group_permissions','1','INSERT','Super User granted access to Object Menu','2016-11-24 15:03:03',1),(2192,1,'Super User','group_permissions','1','INSERT','Super User granted access to Objects','2016-11-24 15:03:03',1),(2193,1,'Super User','group_permissions','1','INSERT','Super User granted access to Images','2016-11-24 15:03:03',1),(2194,1,'Super User','group_permissions','1','INSERT','Super User granted access to Device Menu','2016-11-24 15:03:03',1),(2195,1,'Super User','group_permissions','1','INSERT','Super User granted access to Devices','2016-11-24 15:03:03',1),(2196,1,'Super User','group_permissions','1','INSERT','Super User granted access to Executions','2016-11-24 15:03:03',1),(2197,1,'Super User','group_permissions','1','INSERT','Super User granted access to Measurements','2016-11-24 15:03:03',1),(2198,1,'Super User','group_permissions','1','INSERT','Super User granted access to Triggers','2016-11-24 15:03:03',1),(2199,1,'Super User','group_permissions','1','INSERT','Super User granted access to Actions','2016-11-24 15:03:03',1),(2200,1,'Super User','group_permissions','1','INSERT','Super User granted access to Tags','2016-11-24 15:03:03',1),(2201,1,'Super User','group_permissions','1','INSERT','Super User granted access to Modules','2016-11-24 15:03:03',1),(2202,1,'Super User','group_permissions','1','INSERT','Super User granted access to Dashboard','2016-11-24 15:03:03',1),(2203,1,'Super User','group_permissions','1','INSERT','Super User granted access to Help','2016-11-24 15:03:03',1),(2204,1,'Super User','group_permissions','1','INSERT','Super User granted access to Submit Ticket','2016-11-24 15:03:03',1),(2205,1,'Super User','group_permissions','1','INSERT','Super User granted access to Tickets','2016-11-24 15:03:03',1),(2206,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-11-24 15:03:14',0),(2207,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-11-24 16:01:46',0),(2208,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-11-27 17:37:55',0),(2209,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-11-27 21:20:29',0),(2210,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-11-27 22:23:33',0),(2211,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-11-28 05:45:11',0),(2212,1,'test123','object_images',NULL,'INSERT','New object image - test123 added','2016-11-28 05:58:44',0),(2213,1,'test123','object_images','4','DELETE','Object image - test123 deleted','2016-11-28 06:00:59',1),(2214,1,'Testing','object_images',NULL,'INSERT','New object image - Testing added','2016-11-28 06:01:32',0),(2215,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-11-28 16:31:21',0),(2216,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-11-28 17:04:51',0),(2217,1,'Pump Jack','object_images','1','UPDATE','Object image - Pump Jack  deactivated','2016-11-28 17:41:45',1),(2218,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-11-28 17:55:54',0),(2219,1,'Pump Jack','object_images','1','UPDATE','Object image - Pump Jack  reactivated','2016-11-28 18:07:01',1),(2220,1,'Testing','object_images','5','UPDATE','Object image - Testing  deactivated','2016-11-28 18:07:09',1),(2221,1,'Testing','object_images','5','UPDATE','Object image - Testing  reactivated','2016-11-28 18:07:40',1),(2222,1,'Oil Tank','object_images','2','UPDATE','Object image - Oil Tank  deactivated','2016-11-28 18:23:24',1),(2223,1,'Oil Tank','object_images','2','UPDATE','Object image - Oil Tank  reactivated','2016-11-28 18:23:30',1),(2224,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-11-28 21:04:26',0),(2225,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-11-29 16:56:00',0),(2226,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-11-29 17:27:36',0),(2227,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-11-29 17:56:34',0),(2228,1,'Manufacturers','modules','50','INSERT','New module - Manufacturers created','2016-11-29 19:00:56',1),(2229,1,'Models','modules','51','INSERT','New module - Models created','2016-11-29 19:01:35',1),(2230,1,'Manufacturers','modules','52','INSERT','New module - Manufacturers created','2016-11-29 19:02:31',1),(2231,1,'Manufacturers','modules','53','INSERT','New module - Manufacturers created','2016-11-29 19:02:31',1),(2232,1,'Manufacturers','modules','54','INSERT','New module - Manufacturers created','2016-11-29 19:02:31',1),(2233,1,'Manufacturers','modules','55','INSERT','New module - Manufacturers created','2016-11-29 19:02:31',1),(2234,1,'Manufacturers','modules','53','DELETE','Module - Manufacturers deleted','2016-11-29 19:03:10',1),(2235,1,'Manufacturers','modules','52','DELETE','Module - Manufacturers deleted','2016-11-29 19:03:24',1),(2236,1,'Manufacturers','modules','55','DELETE','Module - Manufacturers deleted','2016-11-29 19:03:43',1),(2237,1,'Models','modules','56','INSERT','New module - Models created','2016-11-29 19:04:15',1),(2238,1,'Models','modules','51','UPDATE','Module - Models modified','2016-11-29 19:04:45',1),(2239,1,'Super User','group_permissions','1','INSERT','Super User granted access to Admin','2016-11-29 19:06:16',1),(2240,1,'Super User','group_permissions','1','INSERT','Super User granted access to Departments','2016-11-29 19:06:16',1),(2241,1,'Super User','group_permissions','1','INSERT','Super User granted access to Groups','2016-11-29 19:06:16',1),(2242,1,'Super User','group_permissions','1','INSERT','Super User granted access to Sites','2016-11-29 19:06:16',1),(2243,1,'Super User','group_permissions','1','INSERT','Super User granted access to Users','2016-11-29 19:06:16',1),(2244,1,'Super User','group_permissions','1','INSERT','Super User granted access to System','2016-11-29 19:06:16',1),(2245,1,'Super User','group_permissions','1','INSERT','Super User granted access to Accounts','2016-11-29 19:06:16',1),(2246,1,'Super User','group_permissions','1','INSERT','Super User granted access to Admin Log','2016-11-29 19:06:16',1),(2247,1,'Super User','group_permissions','1','INSERT','Super User granted access to Object Menu','2016-11-29 19:06:16',1),(2248,1,'Super User','group_permissions','1','INSERT','Super User granted access to Objects','2016-11-29 19:06:16',1),(2249,1,'Super User','group_permissions','1','INSERT','Super User granted access to Images','2016-11-29 19:06:16',1),(2250,1,'Super User','group_permissions','1','INSERT','Super User granted access to Manufacturers','2016-11-29 19:06:16',1),(2251,1,'Super User','group_permissions','1','INSERT','Super User granted access to Models','2016-11-29 19:06:16',1),(2252,1,'Super User','group_permissions','1','INSERT','Super User granted access to Device Menu','2016-11-29 19:06:16',1),(2253,1,'Super User','group_permissions','1','INSERT','Super User granted access to Devices','2016-11-29 19:06:16',1),(2254,1,'Super User','group_permissions','1','INSERT','Super User granted access to Executions','2016-11-29 19:06:16',1),(2255,1,'Super User','group_permissions','1','INSERT','Super User granted access to Measurements','2016-11-29 19:06:16',1),(2256,1,'Super User','group_permissions','1','INSERT','Super User granted access to Triggers','2016-11-29 19:06:16',1),(2257,1,'Super User','group_permissions','1','INSERT','Super User granted access to Actions','2016-11-29 19:06:16',1),(2258,1,'Super User','group_permissions','1','INSERT','Super User granted access to Tags','2016-11-29 19:06:16',1),(2259,1,'Super User','group_permissions','1','INSERT','Super User granted access to Manufacturers','2016-11-29 19:06:16',1),(2260,1,'Super User','group_permissions','1','INSERT','Super User granted access to Models','2016-11-29 19:06:16',1),(2261,1,'Super User','group_permissions','1','INSERT','Super User granted access to Modules','2016-11-29 19:06:16',1),(2262,1,'Super User','group_permissions','1','INSERT','Super User granted access to Dashboard','2016-11-29 19:06:16',1),(2263,1,'Super User','group_permissions','1','INSERT','Super User granted access to Help','2016-11-29 19:06:16',1),(2264,1,'Super User','group_permissions','1','INSERT','Super User granted access to Submit Ticket','2016-11-29 19:06:16',1),(2265,1,'Super User','group_permissions','1','INSERT','Super User granted access to Tickets','2016-11-29 19:06:16',1),(2266,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-11-29 19:06:29',0),(2267,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-11-29 20:57:41',0),(2268,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-11-30 01:02:47',0),(2269,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-11-30 01:47:32',0),(2270,1,'fred','manufacturers','1','INSERT','New Object manufacturer - fred added','2016-11-30 02:17:51',1),(2271,1,'fred1','manufacturers','1','UPDATE','Object Manufacturer - fred1 modified','2016-11-30 02:27:18',1),(2272,1,'fred1','manufacturers','1','UPDATE','Object Manufacturer - fred1 modified','2016-11-30 02:27:34',1),(2273,1,'fred','manufacturers','1','UPDATE','Object Manufacturer - fred modified','2016-11-30 02:28:32',1),(2274,1,'fred','manufacturers','1','UPDATE','Object Manufacturer - fred modified','2016-11-30 02:33:17',1),(2275,1,'fred','manufacturers','1','UPDATE','Object Manufacturer - fred modified','2016-11-30 02:34:09',1),(2276,1,'fred','manufacturers','1','UPDATE','Object Manufacturer - fred modified','2016-11-30 02:34:35',1),(2277,1,'fred','manufacturers','1','UPDATE','Object Manufacturer - fred modified','2016-11-30 02:35:38',1),(2278,1,'fred','manufacturers','1','UPDATE','Manufacturer - fred  reactivated','2016-11-30 02:35:54',1),(2279,1,'fred','manufacturers','1','UPDATE','Manufacturer - fred  deactivated','2016-11-30 02:35:59',1),(2280,1,'Fred','manufacturers','1','UPDATE','Object Manufacturer - Fred modified','2016-11-30 02:47:36',1),(2281,1,'Fred1','manufacturers','1','UPDATE','Object Manufacturer - Fred1 modified','2016-11-30 02:48:16',1),(2282,1,'Fred','manufacturers','1','UPDATE','Object Manufacturer - Fred modified','2016-11-30 02:48:27',1),(2283,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-11-30 03:59:31',0),(2284,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-11-30 16:41:33',0),(2285,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-12-01 02:42:13',0),(2286,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-12-01 21:24:12',0),(2287,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-12-02 17:18:27',0),(2288,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-12-02 19:13:07',0),(2289,1,'Test 123','manufacturers','2','INSERT','New Device manufacturer - Test 123 added','2016-12-02 19:47:23',1),(2290,1,'Test 123a','manufacturers','2','UPDATE','Device Manufacturer - Test 123a modified','2016-12-02 19:47:38',1),(2291,1,'Test 123','manufacturers','2','UPDATE','Device Manufacturer - Test 123 modified','2016-12-02 19:47:48',1),(2292,1,'Test 123','manufacturers','2','UPDATE','Device Manufacturer - Test 123 modified','2016-12-02 19:48:00',1),(2293,1,'Test 123','manufacturers','2','UPDATE','Manufacturer - Test 123  deactivated','2016-12-02 19:48:07',1),(2294,1,'Test 123','manufacturers','2','UPDATE','Manufacturer - Test 123  reactivated','2016-12-02 19:48:11',1),(2295,1,'Test 123','manufacturers','2','DELETE','Manufacturer - Test 123 deleted','2016-12-02 19:49:45',1),(2296,1,'Testing 123','manufacturers','3','INSERT','New Device manufacturer - Testing 123 added','2016-12-02 19:50:24',1),(2297,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-12-02 20:43:22',0),(2298,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-12-03 05:49:41',0),(2299,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-12-05 15:02:56',0),(2300,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-12-05 15:37:09',0),(2301,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-12-05 19:46:09',0),(2302,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-12-05 21:19:27',0),(2303,1,'Tank Stick','devices','1','UPDATE','Device - Tank Stick  deactivated','2016-12-05 22:20:25',1),(2304,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-12-05 23:15:07',0),(2305,1,'Images','modules','49','UPDATE','Module - Images modified','2016-12-06 00:30:02',1),(2306,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-12-06 00:48:40',0),(2307,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-12-06 00:58:35',0),(2308,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-12-06 01:02:30',0),(2309,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-12-14 21:10:13',0),(2310,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-12-14 21:45:47',0),(2311,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-12-15 00:13:53',0),(2312,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-12-15 01:38:57',0),(2313,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-12-15 02:17:24',0),(2314,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-12-15 03:25:04',0),(2315,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-12-16 01:25:40',0),(2316,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-12-16 15:18:09',0),(2317,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-12-16 15:18:34',0),(2318,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-12-16 16:56:28',0),(2319,1,'123','sites','40','INSERT','New site - 123 added','2016-12-16 16:57:13',1),(2320,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-12-16 17:30:34',0),(2321,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-12-16 19:04:50',0),(2322,1,'456','sites','41','INSERT','New site - 456 added','2016-12-16 20:02:32',1),(2323,1,'456','sites','42','INSERT','New site - 456 added','2016-12-16 20:02:50',1),(2324,1,'456','sites','42','DELETE','Site - 456 deleted','2016-12-16 20:03:23',1),(2325,1,'456','sites','41','DELETE','Site - 456 deleted','2016-12-16 20:03:33',1),(2326,1,'456','sites','43','INSERT','New site - 456 added','2016-12-16 20:04:37',1),(2327,1,'456','sites','44','INSERT','New site - 456 added','2016-12-16 20:05:19',1),(2328,1,'456','sites','44','DELETE','Site - 456 deleted','2016-12-16 20:05:37',1),(2329,1,'456','sites','43','DELETE','Site - 456 deleted','2016-12-16 20:05:46',1),(2330,1,'123','sites','35','DELETE','Site - 123 deleted','2016-12-16 20:05:53',1),(2331,1,'456','sites','45','INSERT','New site - 456 added','2016-12-16 20:22:33',1),(2332,1,'456','sites','46','INSERT','New site - 456 added','2016-12-16 20:23:03',1),(2333,1,'456','sites','45','DELETE','Site - 456 deleted','2016-12-16 20:23:23',1),(2334,1,'456','sites','46','DELETE','Site - 456 deleted','2016-12-16 20:23:33',1),(2335,1,'456','sites','47','INSERT','New site - 456 added','2016-12-16 20:23:40',1),(2336,1,'456','sites','47','DELETE','Site - 456 deleted','2016-12-16 20:24:10',1),(2337,1,'456','sites','48','INSERT','New site - 456 added','2016-12-16 20:24:24',1),(2338,1,'456','sites','48','DELETE','Site - 456 deleted','2016-12-16 20:26:00',1),(2339,1,'456','sites','49','INSERT','New site - 456 added','2016-12-16 20:26:12',1),(2340,1,'456','sites','49','DELETE','Site - 456 deleted','2016-12-16 20:27:58',1),(2341,1,'aaa','sites','50','INSERT','New site - aaa added','2016-12-16 21:03:06',1),(2342,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-12-17 00:27:54',0),(2343,1,'Modules','modules','25','UPDATE','Module - Modules modified','2016-12-17 00:42:58',1),(2344,1,'Device Menu','modules','1','UPDATE','Module - Device Menu modified','2016-12-17 00:43:15',1),(2345,1,'Object Menu','modules','24','UPDATE','Module - Object Menu modified','2016-12-17 00:43:39',1),(2346,1,'Controllers','modules','57','INSERT','New module - Controllers created','2016-12-17 00:44:17',1),(2347,1,'Super User','group_permissions','1','INSERT','Super User granted access to Admin','2016-12-17 00:47:39',1),(2348,1,'Super User','group_permissions','1','INSERT','Super User granted access to Departments','2016-12-17 00:47:39',1),(2349,1,'Super User','group_permissions','1','INSERT','Super User granted access to Groups','2016-12-17 00:47:39',1),(2350,1,'Super User','group_permissions','1','INSERT','Super User granted access to Sites','2016-12-17 00:47:39',1),(2351,1,'Super User','group_permissions','1','INSERT','Super User granted access to Users','2016-12-17 00:47:39',1),(2352,1,'Super User','group_permissions','1','INSERT','Super User granted access to System','2016-12-17 00:47:39',1),(2353,1,'Super User','group_permissions','1','INSERT','Super User granted access to Accounts','2016-12-17 00:47:39',1),(2354,1,'Super User','group_permissions','1','INSERT','Super User granted access to Admin Log','2016-12-17 00:47:39',1),(2355,1,'Super User','group_permissions','1','INSERT','Super User granted access to Controllers','2016-12-17 00:47:39',1),(2356,1,'Super User','group_permissions','1','INSERT','Super User granted access to Object Menu','2016-12-17 00:47:39',1),(2357,1,'Super User','group_permissions','1','INSERT','Super User granted access to Objects','2016-12-17 00:47:39',1),(2358,1,'Super User','group_permissions','1','INSERT','Super User granted access to Images','2016-12-17 00:47:39',1),(2359,1,'Super User','group_permissions','1','INSERT','Super User granted access to Manufacturers','2016-12-17 00:47:39',1),(2360,1,'Super User','group_permissions','1','INSERT','Super User granted access to Models','2016-12-17 00:47:39',1),(2361,1,'Super User','group_permissions','1','INSERT','Super User granted access to Device Menu','2016-12-17 00:47:39',1),(2362,1,'Super User','group_permissions','1','INSERT','Super User granted access to Devices','2016-12-17 00:47:39',1),(2363,1,'Super User','group_permissions','1','INSERT','Super User granted access to Executions','2016-12-17 00:47:39',1),(2364,1,'Super User','group_permissions','1','INSERT','Super User granted access to Measurements','2016-12-17 00:47:39',1),(2365,1,'Super User','group_permissions','1','INSERT','Super User granted access to Triggers','2016-12-17 00:47:39',1),(2366,1,'Super User','group_permissions','1','INSERT','Super User granted access to Actions','2016-12-17 00:47:39',1),(2367,1,'Super User','group_permissions','1','INSERT','Super User granted access to Tags','2016-12-17 00:47:39',1),(2368,1,'Super User','group_permissions','1','INSERT','Super User granted access to Manufacturers','2016-12-17 00:47:39',1),(2369,1,'Super User','group_permissions','1','INSERT','Super User granted access to Models','2016-12-17 00:47:39',1),(2370,1,'Super User','group_permissions','1','INSERT','Super User granted access to Modules','2016-12-17 00:47:39',1),(2371,1,'Super User','group_permissions','1','INSERT','Super User granted access to Dashboard','2016-12-17 00:47:39',1),(2372,1,'Super User','group_permissions','1','INSERT','Super User granted access to Help','2016-12-17 00:47:39',1),(2373,1,'Super User','group_permissions','1','INSERT','Super User granted access to Submit Ticket','2016-12-17 00:47:39',1),(2374,1,'Super User','group_permissions','1','INSERT','Super User granted access to Tickets','2016-12-17 00:47:39',1),(2375,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-12-17 00:47:52',0),(2376,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-12-17 07:00:09',0),(2377,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-12-19 18:42:34',0),(2378,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-12-19 19:26:43',0),(2379,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-12-19 21:01:32',0),(2380,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-12-19 21:01:50',0),(2381,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-12-20 17:29:59',0),(2382,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-12-23 19:24:15',0),(2383,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-12-27 16:39:27',0),(2384,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-12-27 17:56:58',0),(2385,1,'Controllers','modules','58','INSERT','New module - Controllers created','2016-12-27 18:13:00',1),(2386,1,'Controller Menu','modules','57','UPDATE','Module - Controller Menu modified','2016-12-27 18:13:37',1),(2387,1,'Controllers','modules','58','UPDATE','Module - Controllers modified','2016-12-27 18:14:22',1),(2388,1,'Manufacturers','modules','59','INSERT','New module - Manufacturers created','2016-12-27 18:14:46',1),(2389,1,'Manufacturers','modules','59','UPDATE','Module - Manufacturers modified','2016-12-27 18:15:38',1),(2390,1,'Manufacturers','modules','59','UPDATE','Module - Manufacturers modified','2016-12-27 18:16:19',1),(2391,1,'Models','modules','60','INSERT','New module - Models created','2016-12-27 18:16:50',1),(2392,1,'Super User','group_permissions','1','INSERT','Super User granted access to Admin','2016-12-27 18:17:38',1),(2393,1,'Super User','group_permissions','1','INSERT','Super User granted access to Departments','2016-12-27 18:17:38',1),(2394,1,'Super User','group_permissions','1','INSERT','Super User granted access to Groups','2016-12-27 18:17:38',1),(2395,1,'Super User','group_permissions','1','INSERT','Super User granted access to Sites','2016-12-27 18:17:38',1),(2396,1,'Super User','group_permissions','1','INSERT','Super User granted access to Users','2016-12-27 18:17:38',1),(2397,1,'Super User','group_permissions','1','INSERT','Super User granted access to System','2016-12-27 18:17:38',1),(2398,1,'Super User','group_permissions','1','INSERT','Super User granted access to Accounts','2016-12-27 18:17:38',1),(2399,1,'Super User','group_permissions','1','INSERT','Super User granted access to Admin Log','2016-12-27 18:17:38',1),(2400,1,'Super User','group_permissions','1','INSERT','Super User granted access to Controller Menu','2016-12-27 18:17:38',1),(2401,1,'Super User','group_permissions','1','INSERT','Super User granted access to Controllers','2016-12-27 18:17:38',1),(2402,1,'Super User','group_permissions','1','INSERT','Super User granted access to Manufacturers','2016-12-27 18:17:38',1),(2403,1,'Super User','group_permissions','1','INSERT','Super User granted access to Models','2016-12-27 18:17:38',1),(2404,1,'Super User','group_permissions','1','INSERT','Super User granted access to Object Menu','2016-12-27 18:17:38',1),(2405,1,'Super User','group_permissions','1','INSERT','Super User granted access to Objects','2016-12-27 18:17:38',1),(2406,1,'Super User','group_permissions','1','INSERT','Super User granted access to Images','2016-12-27 18:17:38',1),(2407,1,'Super User','group_permissions','1','INSERT','Super User granted access to Manufacturers','2016-12-27 18:17:38',1),(2408,1,'Super User','group_permissions','1','INSERT','Super User granted access to Models','2016-12-27 18:17:38',1),(2409,1,'Super User','group_permissions','1','INSERT','Super User granted access to Device Menu','2016-12-27 18:17:38',1),(2410,1,'Super User','group_permissions','1','INSERT','Super User granted access to Devices','2016-12-27 18:17:38',1),(2411,1,'Super User','group_permissions','1','INSERT','Super User granted access to Executions','2016-12-27 18:17:38',1),(2412,1,'Super User','group_permissions','1','INSERT','Super User granted access to Measurements','2016-12-27 18:17:38',1),(2413,1,'Super User','group_permissions','1','INSERT','Super User granted access to Triggers','2016-12-27 18:17:38',1),(2414,1,'Super User','group_permissions','1','INSERT','Super User granted access to Actions','2016-12-27 18:17:38',1),(2415,1,'Super User','group_permissions','1','INSERT','Super User granted access to Tags','2016-12-27 18:17:38',1),(2416,1,'Super User','group_permissions','1','INSERT','Super User granted access to Manufacturers','2016-12-27 18:17:38',1),(2417,1,'Super User','group_permissions','1','INSERT','Super User granted access to Models','2016-12-27 18:17:38',1),(2418,1,'Super User','group_permissions','1','INSERT','Super User granted access to Modules','2016-12-27 18:17:38',1),(2419,1,'Super User','group_permissions','1','INSERT','Super User granted access to Dashboard','2016-12-27 18:17:38',1),(2420,1,'Super User','group_permissions','1','INSERT','Super User granted access to Help','2016-12-27 18:17:38',1),(2421,1,'Super User','group_permissions','1','INSERT','Super User granted access to Submit Ticket','2016-12-27 18:17:38',1),(2422,1,'Super User','group_permissions','1','INSERT','Super User granted access to Tickets','2016-12-27 18:17:38',1),(2423,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-12-27 18:17:52',0),(2424,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-12-27 23:34:11',0),(2425,1,'123','manufacturers','4','INSERT','New Controller manufacturer - 123 added','2016-12-27 23:36:35',1),(2426,1,'123','manufacturers','4','UPDATE','Manufacturer - 123  deactivated','2016-12-27 23:36:43',1),(2427,1,'123','manufacturers','4','UPDATE','Manufacturer - 123  reactivated','2016-12-27 23:36:52',1),(2428,1,'Fred\'s Widgets','manufacturers','4','UPDATE','Controller Manufacturer - Fred\'s Widgets modified','2016-12-27 23:37:48',1),(2429,1,'Controllers','modules','58','UPDATE','Module - Controllers modified','2016-12-27 23:46:11',1),(2430,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-12-28 16:07:58',0),(2431,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-12-28 16:44:54',0),(2432,1,'Quest Automated','users','1','LOGIN','admin logged in','2016-12-30 20:25:06',0),(2433,1,'Quest Automated','users','1','LOGIN','admin logged in','2017-01-04 19:51:36',0),(2434,1,'Quest Automated','users','1','LOGIN','admin logged in','2017-01-05 19:32:55',0),(2435,1,'Quest Automated','users','1','LOGIN','admin logged in','2017-01-05 19:44:05',0),(2436,1,'Quest Automated','users','1','LOGIN','admin logged in','2017-01-05 21:10:57',0),(2437,1,'Quest Automated','users','1','LOGIN','admin logged in','2017-01-06 01:21:12',0),(2438,1,'Quest Automated','users','1','LOGIN','admin logged in','2017-01-06 03:41:12',0),(2439,1,'Quest Automated','users','1','LOGIN','admin logged in','2017-01-06 03:42:33',0),(2440,1,'Quest Automated','users','1','LOGIN','admin logged in','2017-01-06 19:42:47',0),(2441,1,'Quest Automated','users','1','LOGIN','admin logged in','2017-01-07 12:39:02',0),(2442,1,'Fred\'s Widgets','manufacturers','4','UPDATE','Controller Manufacturer - Fred\'s Widgets modified','2017-01-07 12:49:06',1),(2443,1,'Fred\'s Widgets','manufacturers','4','UPDATE','Controller Manufacturer - Fred\'s Widgets modified','2017-01-07 12:49:16',1),(2444,1,'Fred\'s Widgets','manufacturers','4','UPDATE','Controller Manufacturer - Fred\'s Widgets modified','2017-01-07 12:49:53',1),(2445,1,'Fred\'s Widgetsi','manufacturers','4','UPDATE','Controller Manufacturer - Fred\'s Widgetsi modified','2017-01-07 12:50:07',1),(2446,1,'Fred\'s Widgets','manufacturers','4','UPDATE','Controller Manufacturer - Fred\'s Widgets modified','2017-01-07 12:50:25',1),(2447,1,'Fred\'s Widgets','manufacturers','4','UPDATE','Manufacturer - Fred\'s Widgets  reactivated','2017-01-07 12:50:32',1),(2448,1,'Jessica\'s Gadgets','manufacturers','5','INSERT','New Controller manufacturer - Jessica\'s Gadgets added','2017-01-07 12:51:53',1),(2449,1,'Quest Automated','users','1','LOGIN','admin logged in','2017-01-09 21:01:23',0),(2450,1,'Quest Automated','users','1','LOGIN','admin logged in','2017-01-09 21:36:01',0);
/*!40000 ALTER TABLE `admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `controller_objects`
--

DROP TABLE IF EXISTS `controller_objects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `controller_objects` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `controller_id` int(10) unsigned NOT NULL,
  `object_id` int(10) unsigned NOT NULL,
  `latitude` decimal(18,15) DEFAULT NULL,
  `longitude` decimal(18,15) DEFAULT NULL,
  `xml_name` varchar(45) DEFAULT NULL,
  `sms_num` varchar(15) DEFAULT NULL,
  `last_report` datetime DEFAULT NULL,
  `last_restart` datetime DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_site_objects_1_idx` (`controller_id`),
  KEY `fk_site_objects_2_idx` (`object_id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `controller_objects`
--

LOCK TABLES `controller_objects` WRITE;
/*!40000 ALTER TABLE `controller_objects` DISABLE KEYS */;
INSERT INTO `controller_objects` VALUES (1,40,2,NULL,NULL,'as1231','',NULL,NULL,1,'2016-12-16 16:57:13',1),(2,40,2,NULL,NULL,'as4561','','0000-00-00 00:00:00',NULL,1,'2016-12-16 16:57:13',1),(3,40,3,NULL,NULL,'as789',NULL,NULL,NULL,1,'2016-12-16 16:57:13',1),(4,40,3,NULL,NULL,'at1231',NULL,NULL,NULL,1,'2016-12-16 16:57:13',1),(5,40,3,NULL,NULL,'at4561',NULL,NULL,NULL,1,'2016-12-16 16:57:13',1),(6,40,5,NULL,NULL,'at7891',NULL,NULL,NULL,1,'2016-12-16 16:57:13',1),(42,50,2,NULL,NULL,NULL,NULL,NULL,NULL,1,'2016-12-16 21:03:06',1),(43,50,2,NULL,NULL,NULL,NULL,NULL,NULL,1,'2016-12-16 21:03:06',1),(44,50,3,NULL,NULL,NULL,NULL,NULL,NULL,1,'2016-12-16 21:03:06',1),(45,50,3,NULL,NULL,NULL,NULL,NULL,NULL,1,'2016-12-16 21:03:06',1),(46,50,5,NULL,NULL,NULL,NULL,NULL,NULL,1,'2016-12-16 21:03:06',1);
/*!40000 ALTER TABLE `controller_objects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `controllers`
--

DROP TABLE IF EXISTS `controllers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `controllers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `man_id` int(11) unsigned NOT NULL,
  `model_id` int(11) unsigned NOT NULL,
  `name` varchar(45) NOT NULL,
  `xml_name` varchar(45) DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `controllers`
--

LOCK TABLES `controllers` WRITE;
/*!40000 ALTER TABLE `controllers` DISABLE KEYS */;
/*!40000 ALTER TABLE `controllers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departments` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '		',
  `account_id` int(11) unsigned NOT NULL,
  `name` varchar(45) NOT NULL,
  `manager_id` int(11) unsigned DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL,
  `created_by` int(11) unsigned NOT NULL,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `modified_by` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_departments_1_idx` (`account_id`),
  KEY `fk_departments_2_idx` (`created_by`),
  KEY `modified` (`modified_by`),
  CONSTRAINT `fk_departments_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1,1,'Administration',2,1,'2016-09-05 06:56:46',1,'2016-11-20 21:26:32',1),(4,1,'Pumpers',10,1,'2016-09-05 17:48:55',1,'2016-10-20 05:31:08',1),(6,1,'Maintenance',2,1,'2016-09-09 15:49:57',2,'2016-11-09 04:51:27',1),(7,1,'Sales',2,1,'2016-09-11 23:11:03',1,'2016-11-15 02:15:24',1),(8,5,'Administration',36,1,'2016-11-18 11:49:23',1,'2016-11-18 17:50:11',NULL),(10,5,'Office',0,1,'2016-11-18 12:00:56',1,NULL,NULL);
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device_executions`
--

DROP TABLE IF EXISTS `device_executions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `device_executions` (
  `device_id` int(10) unsigned NOT NULL,
  `execution_id` int(10) unsigned NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(10) unsigned NOT NULL,
  PRIMARY KEY (`device_id`,`execution_id`),
  KEY `fk_device_executions_2_idx` (`execution_id`),
  CONSTRAINT `fk_device_executions_1` FOREIGN KEY (`device_id`) REFERENCES `devices` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_device_executions_2` FOREIGN KEY (`execution_id`) REFERENCES `executions` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device_executions`
--

LOCK TABLES `device_executions` WRITE;
/*!40000 ALTER TABLE `device_executions` DISABLE KEYS */;
INSERT INTO `device_executions` VALUES (2,2,'2016-11-20 07:36:33',1),(2,3,'2016-11-20 07:36:33',1),(18,1,'2016-11-18 22:40:25',1),(18,3,'2016-11-18 22:40:25',1),(19,1,'2016-11-19 14:29:44',1),(19,6,'2016-11-19 14:29:44',1),(20,1,'2016-11-19 20:32:24',1);
/*!40000 ALTER TABLE `device_executions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device_measurements`
--

DROP TABLE IF EXISTS `device_measurements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `device_measurements` (
  `device_id` int(10) unsigned NOT NULL,
  `measurement_id` int(10) unsigned NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(10) unsigned NOT NULL,
  PRIMARY KEY (`device_id`,`measurement_id`),
  KEY `fk_device_measurements_2_idx` (`measurement_id`),
  CONSTRAINT `fk_device_measurements_1` FOREIGN KEY (`device_id`) REFERENCES `devices` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_device_measurements_2` FOREIGN KEY (`measurement_id`) REFERENCES `measurements` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device_measurements`
--

LOCK TABLES `device_measurements` WRITE;
/*!40000 ALTER TABLE `device_measurements` DISABLE KEYS */;
INSERT INTO `device_measurements` VALUES (1,9,'2016-11-08 04:18:34',1),(2,8,'2016-11-20 07:36:33',1),(2,11,'2016-11-20 07:36:34',1),(11,11,'2016-11-09 07:34:03',1),(12,11,'2016-11-10 00:06:40',1),(12,19,'2016-11-10 00:06:40',1),(14,8,'2016-11-10 04:03:13',1),(14,11,'2016-11-10 04:03:13',1),(18,9,'2016-11-18 22:40:25',1),(18,11,'2016-11-18 22:40:25',1),(18,18,'2016-11-18 22:40:25',1),(19,8,'2016-11-19 14:29:44',1),(19,11,'2016-11-19 14:29:45',1),(19,19,'2016-11-19 14:29:45',1),(20,9,'2016-11-19 20:32:24',1),(20,11,'2016-11-19 20:32:24',1),(20,18,'2016-11-19 20:32:24',1);
/*!40000 ALTER TABLE `device_measurements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device_triggers`
--

DROP TABLE IF EXISTS `device_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `device_triggers` (
  `device_id` int(10) unsigned NOT NULL,
  `trigger_id` int(10) unsigned NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(10) unsigned NOT NULL,
  PRIMARY KEY (`device_id`,`trigger_id`),
  KEY `fk_device_triggers_2_idx` (`trigger_id`),
  CONSTRAINT `fk_device_triggers_1` FOREIGN KEY (`device_id`) REFERENCES `devices` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_device_triggers_2` FOREIGN KEY (`trigger_id`) REFERENCES `triggers` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device_triggers`
--

LOCK TABLES `device_triggers` WRITE;
/*!40000 ALTER TABLE `device_triggers` DISABLE KEYS */;
INSERT INTO `device_triggers` VALUES (2,1,'2016-11-20 07:36:34',1),(2,7,'2016-11-20 07:36:34',1),(18,4,'2016-11-18 22:40:25',1),(19,1,'2016-11-19 14:29:45',1),(19,6,'2016-11-19 14:29:45',1),(20,4,'2016-11-19 20:32:24',1),(20,6,'2016-11-19 20:32:24',1);
/*!40000 ALTER TABLE `device_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devices`
--

DROP TABLE IF EXISTS `devices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devices` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `xml_name` varchar(45) DEFAULT NULL,
  `man_name` varchar(45) DEFAULT NULL,
  `mod_name` varchar(45) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL,
  `created_by` int(11) unsigned NOT NULL,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `modified_by` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devices`
--

LOCK TABLES `devices` WRITE;
/*!40000 ALTER TABLE `devices` DISABLE KEYS */;
INSERT INTO `devices` VALUES (1,'Tank Stick',NULL,NULL,NULL,'Ethyl\'s',0,'2016-11-07 17:05:02',1,'2016-12-05 22:20:25',1),(2,'Transducer','transducer','Augustus','RMC - 33','',1,'2016-11-07 17:05:32',1,'2016-11-20 07:36:33',1),(3,'Transfer Pump',NULL,NULL,NULL,'',1,'2016-11-07 17:05:53',1,'2016-11-09 04:54:09',NULL),(11,'1234',NULL,NULL,NULL,'5678',1,'2016-11-09 01:34:03',1,NULL,NULL),(12,'aaa',NULL,NULL,NULL,'sss',1,'2016-11-09 18:06:40',1,'2016-11-10 00:07:23',NULL),(14,'456a',NULL,NULL,NULL,'123b',1,'2016-11-09 22:02:52',1,'2016-11-10 04:03:26',1),(18,'Electric Motor','electricmoto','123','456','',1,'2016-11-17 15:12:20',1,'2016-11-18 22:40:25',1),(19,'Oil Pump','oilpump','Raymond','454-XL','Description\'s',1,'2016-11-19 08:28:09',1,'2016-11-19 14:29:44',1),(20,'Heater Treater','heatertreater','Randolf','VXS - 356 Magnum','',1,'2016-11-19 14:32:23',1,NULL,NULL);
/*!40000 ALTER TABLE `devices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `execution_tags`
--

DROP TABLE IF EXISTS `execution_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `execution_tags` (
  `execution_id` int(10) unsigned NOT NULL,
  `tag_id` int(10) unsigned NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  PRIMARY KEY (`execution_id`,`tag_id`),
  KEY `fk_execution_tags_2_idx` (`tag_id`),
  CONSTRAINT `fk_execution_tags_1` FOREIGN KEY (`execution_id`) REFERENCES `executions` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_execution_tags_2` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `execution_tags`
--

LOCK TABLES `execution_tags` WRITE;
/*!40000 ALTER TABLE `execution_tags` DISABLE KEYS */;
INSERT INTO `execution_tags` VALUES (1,1,'2016-11-19 23:12:50',1),(1,8,'2016-11-19 23:12:50',1),(6,1,'2016-11-17 01:22:31',1),(6,5,'2016-11-17 01:22:31',1),(7,11,'2016-11-19 14:38:38',1),(8,8,'2016-11-19 23:43:29',1),(8,11,'2016-11-19 23:43:30',1);
/*!40000 ALTER TABLE `execution_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `executions`
--

DROP TABLE IF EXISTS `executions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `executions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `xml_name` varchar(45) NOT NULL,
  `description` varchar(45) DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  `created` datetime NOT NULL,
  `created_by` int(10) unsigned NOT NULL,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `modified_by` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `executions`
--

LOCK TABLES `executions` WRITE;
/*!40000 ALTER TABLE `executions` DISABLE KEYS */;
INSERT INTO `executions` VALUES (1,'Stop Motor','stop-motor','Desc\'s',1,'2016-11-16 18:10:36',1,'2016-11-17 00:15:38',1),(2,'Reboot OPCUA Server','RebootOPCUAServer','',1,'2016-11-16 18:16:25',1,NULL,NULL),(3,'Start Motor','StartMotor','',1,'2016-11-16 18:19:33',1,NULL,NULL),(6,'Test','test','',1,'2016-11-16 19:18:40',1,'2016-11-17 01:23:14',1),(7,'Kill Site','killsite','',1,'2016-11-19 08:38:10',1,'2016-11-19 14:38:38',1),(8,'Notify Super','notifysuper','',1,'2016-11-19 17:42:29',1,'2016-11-19 23:43:29',1);
/*!40000 ALTER TABLE `executions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_permissions`
--

DROP TABLE IF EXISTS `group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` int(10) unsigned NOT NULL,
  `module_id` int(10) unsigned NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `group` (`group_id`),
  KEY `permission` (`module_id`),
  KEY `fk_group_permissions_1_idx` (`created_by`),
  CONSTRAINT `fk_group_permissions_1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_group_permissions_2` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=399 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_permissions`
--

LOCK TABLES `group_permissions` WRITE;
/*!40000 ALTER TABLE `group_permissions` DISABLE KEYS */;
INSERT INTO `group_permissions` VALUES (252,10,20,'2016-11-18 19:23:05',1),(253,10,27,'2016-11-18 19:23:05',1),(254,10,28,'2016-11-18 19:23:05',1),(255,10,29,'2016-11-18 19:23:05',1),(256,10,30,'2016-11-18 19:23:05',1),(257,10,39,'2016-11-18 19:23:05',1),(258,10,31,'2016-11-18 19:23:05',1),(259,10,33,'2016-11-18 19:23:05',1),(260,10,32,'2016-11-18 19:23:05',1),(276,6,20,'2016-11-18 20:23:15',1),(277,6,29,'2016-11-18 20:23:15',1),(278,6,21,'2016-11-18 20:23:15',1),(279,6,24,'2016-11-18 20:23:15',1),(280,6,1,'2016-11-18 20:23:15',1),(281,6,43,'2016-11-18 20:23:15',1),(282,6,44,'2016-11-18 20:23:15',1),(283,6,45,'2016-11-18 20:23:15',1),(284,6,47,'2016-11-18 20:23:15',1),(285,6,46,'2016-11-18 20:23:15',1),(286,6,39,'2016-11-18 20:23:15',1),(287,6,31,'2016-11-18 20:23:15',1),(288,6,33,'2016-11-18 20:23:15',1),(289,6,32,'2016-11-18 20:23:15',1),(368,1,20,'2016-12-27 18:17:38',1),(369,1,27,'2016-12-27 18:17:38',1),(370,1,28,'2016-12-27 18:17:38',1),(371,1,29,'2016-12-27 18:17:38',1),(372,1,30,'2016-12-27 18:17:38',1),(373,1,21,'2016-12-27 18:17:38',1),(374,1,22,'2016-12-27 18:17:38',1),(375,1,23,'2016-12-27 18:17:38',1),(376,1,57,'2016-12-27 18:17:38',1),(377,1,58,'2016-12-27 18:17:38',1),(378,1,59,'2016-12-27 18:17:38',1),(379,1,60,'2016-12-27 18:17:38',1),(380,1,24,'2016-12-27 18:17:38',1),(381,1,48,'2016-12-27 18:17:38',1),(382,1,49,'2016-12-27 18:17:38',1),(383,1,50,'2016-12-27 18:17:38',1),(384,1,51,'2016-12-27 18:17:38',1),(385,1,1,'2016-12-27 18:17:38',1),(386,1,42,'2016-12-27 18:17:38',1),(387,1,43,'2016-12-27 18:17:38',1),(388,1,44,'2016-12-27 18:17:38',1),(389,1,45,'2016-12-27 18:17:38',1),(390,1,47,'2016-12-27 18:17:38',1),(391,1,46,'2016-12-27 18:17:38',1),(392,1,54,'2016-12-27 18:17:38',1),(393,1,56,'2016-12-27 18:17:38',1),(394,1,25,'2016-12-27 18:17:38',1),(395,1,39,'2016-12-27 18:17:38',1),(396,1,31,'2016-12-27 18:17:38',1),(397,1,33,'2016-12-27 18:17:38',1),(398,1,32,'2016-12-27 18:17:38',1);
/*!40000 ALTER TABLE `group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `account_id` int(11) unsigned NOT NULL,
  `name` varchar(45) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL,
  `created_by` int(11) unsigned NOT NULL,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `modified_by` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_groups_1_idx` (`account_id`),
  KEY `fk_groups_2_idx` (`created_by`),
  KEY `modified` (`modified_by`),
  CONSTRAINT `fk_groups_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` VALUES (1,1,'Super User',NULL,1,'2016-09-04 01:12:02',1,'2016-11-20 21:39:21',1),(2,1,'Account Admin','123\'s',1,'2016-09-04 02:32:43',1,'2016-10-04 04:17:50',1),(3,1,'Pumper',NULL,1,'2016-09-06 01:25:00',1,'2016-10-04 04:17:50',1),(4,1,'Manager',NULL,1,'2016-09-06 02:12:15',1,'2016-10-04 04:17:50',1),(6,1,'Technicians','',1,'2016-09-06 02:31:47',1,'2016-11-18 20:20:34',1),(7,1,'Maintenance',NULL,1,'2016-09-06 02:32:48',1,'2016-10-04 04:17:50',NULL),(9,1,'Test','descript\'s',1,'2016-09-09 10:00:17',1,'2016-10-04 04:17:50',1),(10,5,'Account Admins','',1,'2016-11-18 11:47:07',1,NULL,NULL),(11,5,'IT','',1,'2016-11-18 11:47:52',1,NULL,NULL),(12,5,'Pumpers','',1,'2016-11-18 11:48:05',1,NULL,NULL);
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manufacturers`
--

DROP TABLE IF EXISTS `manufacturers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manufacturers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `man_type` varchar(45) NOT NULL,
  `primary_contact` varchar(100) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manufacturers`
--

LOCK TABLES `manufacturers` WRITE;
/*!40000 ALTER TABLE `manufacturers` DISABLE KEYS */;
INSERT INTO `manufacturers` VALUES (1,'ACME','Object','fred@acme.com','www.fred.com','fred\'s',1,'2016-11-29 20:17:51',1,'2016-12-17 06:57:59',1),(3,'McCarroll Industries','Device','jed@testing123.com','testing123.com','description\'s',1,'2016-12-02 13:50:23',1,'2016-12-17 06:57:59',NULL),(4,'Fred\'s Widgets','Controller','Fred O\'Dell','www.fredswidgets.com','description\'s',1,'2016-12-27 17:36:34',1,'2017-01-07 12:50:32',1),(5,'Jessica\'s Gadgets','Controller','jessica@jessicasgadgets.com','www.jessicasgadgets.com','description\'s',1,'2017-01-07 06:51:53',1,NULL,NULL);
/*!40000 ALTER TABLE `manufacturers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `measurement_tags`
--

DROP TABLE IF EXISTS `measurement_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `measurement_tags` (
  `measurement_id` int(10) unsigned NOT NULL,
  `tag_id` int(10) unsigned NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(10) unsigned NOT NULL,
  PRIMARY KEY (`measurement_id`,`tag_id`),
  KEY `fk_measurement_tags_2_idx` (`tag_id`),
  CONSTRAINT `fk_measurement_tags_1` FOREIGN KEY (`measurement_id`) REFERENCES `measurements` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_measurement_tags_2` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `measurement_tags`
--

LOCK TABLES `measurement_tags` WRITE;
/*!40000 ALTER TABLE `measurement_tags` DISABLE KEYS */;
INSERT INTO `measurement_tags` VALUES (8,3,'2016-11-09 19:42:37',1),(9,3,'2016-11-08 02:34:55',1),(11,3,'2016-11-09 10:06:36',1),(18,1,'2016-11-08 03:19:06',1),(19,1,'2016-11-09 10:07:18',1),(19,3,'2016-11-09 10:07:18',1),(19,5,'2016-11-09 10:07:18',1),(22,1,'2016-11-10 01:28:10',1),(23,1,'2016-11-10 04:06:02',1),(24,3,'2016-11-10 04:16:30',1);
/*!40000 ALTER TABLE `measurement_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `measurements`
--

DROP TABLE IF EXISTS `measurements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `measurements` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `xml_name` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `units` varchar(45) DEFAULT NULL,
  `threshold` varchar(45) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL,
  `created_by` int(10) unsigned NOT NULL,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `modified_by` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `measurements`
--

LOCK TABLES `measurements` WRITE;
/*!40000 ALTER TABLE `measurements` DISABLE KEYS */;
INSERT INTO `measurements` VALUES (8,'Level',NULL,'Ethyl\'s','Centimeters','1',1,'2016-11-07 18:53:01',1,'2016-11-09 19:42:37',1),(9,'Temperature',NULL,'Test\'s','',NULL,1,'2016-11-07 20:18:46',1,'2016-11-10 04:06:57',1),(11,'Pressure',NULL,'','','',1,'2016-11-07 20:20:08',1,'2016-11-09 10:06:10',1),(18,'Cookin',NULL,'Fred\'s','Inches','.25',1,'2016-11-07 21:18:34',1,'2016-11-08 03:19:06',1),(19,'Becca1',NULL,'Yeah\'s1','Inches1','11',1,'2016-11-09 04:04:42',1,'2016-11-09 10:05:41',1),(22,'name',NULL,'','','',1,'2016-11-09 19:28:10',1,NULL,NULL),(23,'1234a',NULL,'desc\'sa','1a','2a',1,'2016-11-09 22:05:35',1,'2016-11-10 04:07:08',1),(24,'1234aaa444',NULL,'q4','a4','s4',0,'2016-11-09 22:15:46',1,'2016-11-10 04:16:37',1);
/*!40000 ALTER TABLE `measurements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_images`
--

DROP TABLE IF EXISTS `model_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `model_images` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `model_id` int(10) unsigned NOT NULL,
  `name` varchar(45) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `image_name` varchar(255) NOT NULL,
  `thumb_name` varchar(255) NOT NULL,
  `active` tinyint(1) DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_model_images_1_idx` (`model_id`),
  CONSTRAINT `fk_model_images_1` FOREIGN KEY (`model_id`) REFERENCES `models` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_images`
--

LOCK TABLES `model_images` WRITE;
/*!40000 ALTER TABLE `model_images` DISABLE KEYS */;
INSERT INTO `model_images` VALUES (1,1,'Pump Jack','','pump_jack.png','pump_jack.png',1,'2016-11-15 19:16:00',1),(2,2,'Oil Tank','','oil_tank.png','oil_tank.png',1,'2016-11-15 19:17:00',1),(3,3,'Water Tank','','water_tank.png','water_tank.png',1,'2016-11-15 19:17:30',1);
/*!40000 ALTER TABLE `model_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `models`
--

DROP TABLE IF EXISTS `models`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `models` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `man_id` int(11) unsigned NOT NULL,
  `image_id` int(10) unsigned NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `mod_type` varchar(45) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  `created` datetime DEFAULT NULL,
  `created_by` int(10) unsigned NOT NULL,
  `modified` timestamp NULL DEFAULT NULL,
  `modified_by` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_models_1_idx` (`man_id`),
  KEY `fk_models_2_idx` (`image_id`),
  CONSTRAINT `fk_models_1` FOREIGN KEY (`man_id`) REFERENCES `manufacturers` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_models_2` FOREIGN KEY (`image_id`) REFERENCES `model_images` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `models`
--

LOCK TABLES `models` WRITE;
/*!40000 ALTER TABLE `models` DISABLE KEYS */;
INSERT INTO `models` VALUES (1,1,1,'123','Device',NULL,1,'2016-11-29 22:11:00',1,'0000-00-00 00:00:00',0),(2,1,2,'456','Device',NULL,1,'2016-11-29 22:11:30',1,NULL,NULL),(3,1,3,'789','Object',NULL,1,'2016-11-29 22:12:00',1,NULL,NULL);
/*!40000 ALTER TABLE `models` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modules`
--

DROP TABLE IF EXISTS `modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modules` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '		',
  `parent_id` int(11) unsigned NOT NULL DEFAULT '0',
  `name` varchar(45) DEFAULT NULL,
  `controller` varchar(45) DEFAULT NULL,
  `method` varchar(45) DEFAULT NULL,
  `order_by` tinyint(3) DEFAULT '1',
  `active` tinyint(1) DEFAULT '1',
  `super_user` tinyint(1) DEFAULT '0',
  `created` datetime NOT NULL,
  `created_by` int(11) unsigned NOT NULL,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `modified_by` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `parent` (`parent_id`),
  KEY `modified` (`modified_by`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modules`
--

LOCK TABLES `modules` WRITE;
/*!40000 ALTER TABLE `modules` DISABLE KEYS */;
INSERT INTO `modules` VALUES (1,21,'Device Menu','devices','',5,1,0,'2016-11-07 08:02:02',1,'2016-12-17 00:43:15',1),(20,0,'Admin','','',1,1,0,'2016-09-30 10:59:35',1,'2016-11-09 20:15:02',1),(21,20,'System','','',5,1,1,'2016-09-30 11:25:15',1,'2016-11-14 21:28:21',1),(22,21,'Accounts','accounts','',1,1,0,'2016-09-30 11:29:51',1,'2016-10-04 04:25:23',1),(23,21,'Admin Log','admin_log','',2,1,0,'2016-09-30 11:35:15',1,'2016-10-04 04:25:23',NULL),(24,21,'Object Menu','','',4,1,0,'2016-09-30 11:47:04',1,'2016-12-17 00:43:39',1),(25,21,'Modules','modules','',6,1,0,'2016-09-30 11:47:38',1,'2016-12-17 00:42:57',1),(27,20,'Departments','departments','',1,1,0,'2016-09-30 11:48:31',1,'2016-11-14 21:28:45',1),(28,20,'Groups','groups','',2,1,0,'2016-09-30 11:48:52',1,'2016-11-14 21:28:54',1),(29,20,'Sites','sites','',3,1,0,'2016-09-30 11:51:51',1,'2016-11-14 21:29:03',1),(30,20,'Users','users','',4,1,0,'2016-09-30 11:52:43',1,'2016-11-14 21:29:16',1),(31,0,'Help','','',3,1,0,'2016-09-30 12:02:18',1,'2016-10-04 04:25:23',1),(32,31,'Tickets','help','tickets',2,1,0,'2016-09-30 15:31:59',1,'2016-10-04 04:25:23',1),(33,31,'Submit Ticket','help','submit_ticket',1,1,0,'2016-09-30 15:32:54',1,'2016-10-04 04:25:23',1),(39,0,'Dashboard','dashboard','',2,1,0,'2016-10-01 13:48:02',1,'2016-11-10 04:25:35',1),(42,1,'Devices','devices','',1,1,0,'2016-11-16 15:39:24',1,'2016-11-16 23:48:06',1),(43,1,'Executions','executions','',2,1,0,'2016-11-16 15:39:53',1,'2016-11-17 17:47:42',1),(44,1,'Measurements','measurements','',3,1,0,'2016-11-16 15:40:25',1,'2016-11-17 17:47:22',1),(45,1,'Triggers','triggers','',4,1,0,'2016-11-16 15:40:49',1,'2016-11-17 17:48:29',1),(46,1,'Tags','tags','',6,1,0,'2016-11-16 17:46:15',1,'2016-11-17 17:48:55',1),(47,1,'Actions','actions','',5,1,0,'2016-11-16 18:33:13',1,'2016-11-17 17:48:07',1),(48,24,'Objects','objects','',1,1,0,'2016-11-24 09:01:09',1,NULL,NULL),(49,24,'Images','models','images',2,1,0,'2016-11-24 09:01:49',1,'2016-12-06 00:30:02',1),(50,24,'Manufacturers','manufacturers','objects',3,1,0,'2016-11-29 13:00:55',1,NULL,NULL),(51,24,'Models','models','objects',4,1,0,'2016-11-29 13:01:35',1,'2016-11-29 19:04:45',1),(54,1,'Manufacturers','manufacturers','devices',7,1,0,'2016-11-29 13:02:31',1,NULL,NULL),(56,1,'Models','models','devices',8,1,0,'2016-11-29 13:04:15',1,NULL,NULL),(57,21,'Controller Menu','','',3,1,0,'2016-12-16 18:44:17',1,'2016-12-27 18:13:37',1),(58,57,'Controllers','controllers','',1,1,0,'2016-12-27 12:13:00',1,'2016-12-27 23:46:11',1),(59,57,'Manufacturers','manufacturers','controllers',2,1,0,'2016-12-27 12:14:46',1,'2016-12-27 18:16:19',1),(60,57,'Models','models','controllers',3,1,0,'2016-12-27 12:16:50',1,NULL,NULL);
/*!40000 ALTER TABLE `modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notifications` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(10) unsigned NOT NULL,
  `type` varchar(45) NOT NULL,
  `message` varchar(45) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_notifications_1_idx` (`site_id`),
  CONSTRAINT `fk_notifications_1` FOREIGN KEY (`site_id`) REFERENCES `sites` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `object_devices`
--

DROP TABLE IF EXISTS `object_devices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `object_devices` (
  `object_id` int(10) unsigned NOT NULL,
  `device_id` int(10) unsigned NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  PRIMARY KEY (`object_id`,`device_id`),
  KEY `fk_object_devices_2_idx` (`device_id`),
  CONSTRAINT `fk_object_devices_1` FOREIGN KEY (`object_id`) REFERENCES `objects` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_object_devices_2` FOREIGN KEY (`device_id`) REFERENCES `devices` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `object_devices`
--

LOCK TABLES `object_devices` WRITE;
/*!40000 ALTER TABLE `object_devices` DISABLE KEYS */;
INSERT INTO `object_devices` VALUES (2,1,'2016-11-20 17:36:52',1),(2,3,'2016-11-20 17:36:52',1),(2,18,'2016-11-20 17:36:52',1),(2,19,'2016-11-20 17:36:52',1),(2,20,'2016-11-20 17:36:52',1),(3,1,'2016-11-18 22:55:11',1),(3,2,'2016-11-18 22:55:11',1),(4,1,'2016-11-08 18:01:13',1),(4,3,'2016-11-08 18:01:13',1),(5,1,'2016-11-18 22:54:22',1),(5,2,'2016-11-18 22:54:22',1),(6,1,'2016-11-10 00:07:40',1),(6,12,'2016-11-10 00:07:41',1),(8,1,'2016-11-10 04:28:53',1),(8,11,'2016-11-10 04:28:53',1);
/*!40000 ALTER TABLE `object_devices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `objects`
--

DROP TABLE IF EXISTS `objects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `objects` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `image_id` int(10) unsigned DEFAULT NULL,
  `model_id` int(10) unsigned NOT NULL,
  `name` varchar(45) NOT NULL,
  `xml_name` varchar(45) DEFAULT NULL,
  `man_name` varchar(45) DEFAULT NULL,
  `mod_name` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL,
  `created_by` int(11) unsigned NOT NULL,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `modified_by` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `image` (`image_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `objects`
--

LOCK TABLES `objects` WRITE;
/*!40000 ALTER TABLE `objects` DISABLE KEYS */;
INSERT INTO `objects` VALUES (2,2,0,'Oil Tank','oiltank','ACME','XFR - 24','ACME 24x7 (mil gal) Xetreme Flame Reduction',1,'2016-11-07 17:36:07',1,'2016-11-18 22:42:27',1),(3,3,0,'Water Tank','Sampsonwatertank','Sampson','RR - 32','Model #3610022',1,'2016-11-08 00:42:32',1,'2016-11-18 22:55:11',1),(4,NULL,0,'Test\'s',NULL,NULL,NULL,'Desc\'s',1,'2016-11-08 12:01:12',1,'2016-11-08 18:09:23',NULL),(5,1,0,'Pump Jack','Drake25pumpjack','Drake','25 Series','Use your imagination.',1,'2016-11-08 13:38:52',1,'2016-11-18 22:54:21',1),(6,NULL,0,'1234',NULL,NULL,NULL,'5678',1,'2016-11-09 01:24:44',1,'2016-11-10 00:07:40',1),(8,NULL,0,'sdtwgbw',NULL,NULL,NULL,'rtnhberth',1,'2016-11-09 22:28:27',1,'2016-11-10 04:29:01',1);
/*!40000 ALTER TABLE `objects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions` (
  `id` int(11) unsigned NOT NULL,
  `name` varchar(45) NOT NULL,
  `controller` varchar(45) NOT NULL,
  `method` varchar(45) NOT NULL,
  `created` datetime NOT NULL,
  `created_by` int(11) unsigned NOT NULL,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `modified_by` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_permissions_1_idx` (`created_by`),
  KEY `modified` (`modified_by`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `input_type` varchar(45) DEFAULT NULL,
  `active` tinyint(4) DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_settings_1_idx` (`created_by`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'Pagination','text',1,'0000-00-00 00:00:00',1),(2,'Home Page','select_module',1,'0000-00-00 00:00:00',1);
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site_attrib_types`
--

DROP TABLE IF EXISTS `site_attrib_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `site_attrib_types` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(45) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL,
  `created_by` int(11) unsigned NOT NULL,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `modified_by` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site_attrib_types`
--

LOCK TABLES `site_attrib_types` WRITE;
/*!40000 ALTER TABLE `site_attrib_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `site_attrib_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site_attribs`
--

DROP TABLE IF EXISTS `site_attribs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `site_attribs` (
  `id` int(11) NOT NULL,
  `site_id` int(10) unsigned NOT NULL,
  `site_attrib_type` int(10) unsigned NOT NULL,
  `measurement_id` int(10) unsigned NOT NULL,
  `value` varchar(45) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_site_attribs_1_idx` (`site_id`),
  KEY `fk_site_attribs_2_idx` (`measurement_id`),
  KEY `fk_site_attribs_3_idx` (`site_attrib_type`),
  CONSTRAINT `fk_site_attribs_1` FOREIGN KEY (`site_id`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_site_attribs_2` FOREIGN KEY (`measurement_id`) REFERENCES `measurements` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_site_attribs_3` FOREIGN KEY (`site_attrib_type`) REFERENCES `site_attrib_types` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site_attribs`
--

LOCK TABLES `site_attribs` WRITE;
/*!40000 ALTER TABLE `site_attribs` DISABLE KEYS */;
/*!40000 ALTER TABLE `site_attribs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site_controllers`
--

DROP TABLE IF EXISTS `site_controllers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `site_controllers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(11) unsigned NOT NULL,
  `controller_id` int(11) unsigned NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_site_remote_controllers_1_idx` (`site_id`),
  KEY `fk_site_remote_controllers_2_idx` (`controller_id`),
  CONSTRAINT `fk_site_remote_controllers_1` FOREIGN KEY (`site_id`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_site_remote_controllers_2` FOREIGN KEY (`controller_id`) REFERENCES `controllers` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site_controllers`
--

LOCK TABLES `site_controllers` WRITE;
/*!40000 ALTER TABLE `site_controllers` DISABLE KEYS */;
/*!40000 ALTER TABLE `site_controllers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site_states`
--

DROP TABLE IF EXISTS `site_states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `site_states` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `state` varchar(45) NOT NULL,
  `class` varchar(45) DEFAULT NULL,
  `icon` varchar(45) DEFAULT NULL,
  `image` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site_states`
--

LOCK TABLES `site_states` WRITE;
/*!40000 ALTER TABLE `site_states` DISABLE KEYS */;
INSERT INTO `site_states` VALUES (1,'Good to Go','online','green','pump_jack_green.png',NULL),(2,'Comm Problem','offline','gray','pump_jack_gray.png',NULL),(3,'Major Problem','error','red','pump_jack_red.png',NULL),(4,'Minor Problem','issue','yellow','pump_jack_yellow.png',NULL);
/*!40000 ALTER TABLE `site_states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sites`
--

DROP TABLE IF EXISTS `sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sites` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `account_id` int(11) unsigned NOT NULL,
  `name` varchar(45) NOT NULL,
  `xml_name` varchar(45) DEFAULT NULL,
  `latitude` decimal(18,15) DEFAULT NULL,
  `longitude` decimal(18,15) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `status` varchar(45) NOT NULL DEFAULT 'Online',
  `status_change` datetime DEFAULT NULL,
  `created` datetime NOT NULL,
  `created_by` int(10) unsigned NOT NULL,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `modified_by` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `account` (`account_id`),
  CONSTRAINT `fk_sites_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sites`
--

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;
INSERT INTO `sites` VALUES (5,5,'Apache #2',NULL,32.308555000000000,-94.277435000000000,1,'Online',NULL,'2016-09-18 10:51:18',36,'2016-11-21 21:54:38',1),(6,5,'Comanche #5',NULL,32.423304000000000,-94.234302000000000,1,'Online',NULL,'2016-09-18 10:51:33',36,'2016-11-21 22:01:06',1),(7,5,'Comanche #6',NULL,32.433089000000000,-94.257820000000000,1,'Offline','2016-11-04 16:44:22','2016-09-18 10:52:01',36,'2016-11-21 22:01:28',1),(8,5,'Jeanie\'s Ship',NULL,32.567536100000000,-94.153680000000000,1,'Online',NULL,'2016-09-18 10:52:07',36,'2016-11-07 13:53:56',36),(9,5,'Savy\'s College',NULL,32.578340000000000,-94.122006000000000,1,'Online',NULL,'2016-09-18 10:52:14',36,'2016-11-07 13:53:56',36),(11,5,'Comanche #3',NULL,32.420125000000000,-94.202420000000000,1,'Online',NULL,'2016-09-18 10:52:28',36,'2016-11-21 21:43:24',1),(12,5,'Apache #3',NULL,32.330560000000000,-94.244814000000000,1,'Online',NULL,'2016-09-18 10:52:35',36,'2016-11-21 21:57:33',1),(13,5,'Comanche #1',NULL,32.420125000000000,-94.162420000000000,1,'Online',NULL,'2016-09-18 10:52:43',36,'2016-11-21 21:40:27',1),(14,5,'Victory or Death',NULL,0.000000000000000,0.000000000000000,1,'Online',NULL,'2016-09-18 10:52:53',36,'2016-11-15 05:42:10',1),(15,5,'Yankees Good Night',NULL,0.000000000000000,0.000000000000000,1,'Online',NULL,'2016-09-18 10:53:00',36,'2016-11-15 05:43:22',1),(16,5,'Apache #1',NULL,32.320560000000000,-94.314814000000000,1,'Online',NULL,'2016-09-18 10:53:12',36,'2016-11-21 21:54:19',1),(17,5,'Comanche #2',NULL,32.440125000000000,-94.182420000000000,1,'Problem','2016-09-21 17:22:22','2016-09-18 10:53:27',36,'2016-11-21 21:41:26',1),(18,5,'Golden Field #2',NULL,0.000000000000000,0.000000000000000,1,'Online',NULL,'2016-09-18 10:53:34',36,'2016-11-22 01:43:13',1),(19,5,'Comanche #4',NULL,32.435351000000000,-94.126290000000000,1,'Online',NULL,'2016-09-18 10:53:50',36,'2016-11-21 21:59:58',1),(20,5,'Iroquois #3',NULL,32.637587000000000,-94.219134000000000,1,'Online',NULL,'2016-09-18 10:54:08',36,'2016-11-21 22:05:49',1),(21,5,'Golden Field #4',NULL,32.598720000000000,-94.156969000000000,1,'Online',NULL,'2016-09-18 10:54:16',36,'2016-11-22 01:43:48',1),(22,5,'Golden Field #1',NULL,32.586111000000000,-94.189088000000000,1,'Error','2016-09-21 15:45:33','2016-09-18 10:54:34',36,'2016-11-22 01:42:54',1),(23,1,'Lilly',NULL,0.000000000000000,0.000000000000000,1,'Online',NULL,'2016-09-18 10:54:46',36,'2016-11-07 13:53:56',NULL),(24,1,'Jessica',NULL,0.000000000000000,0.000000000000000,1,'Online',NULL,'2016-09-18 10:54:58',36,'2016-11-07 13:53:56',1),(25,1,'Kris',NULL,0.000000000000000,0.000000000000000,1,'Online',NULL,'2016-09-18 10:55:09',36,'2016-11-07 13:53:56',1),(26,1,'Samantha',NULL,0.000000000000000,0.000000000000000,1,'Online',NULL,'2016-09-18 10:55:17',36,'2016-11-07 13:53:56',NULL),(27,1,'Julie',NULL,0.000000000000000,0.000000000000000,1,'Online',NULL,'2016-09-18 10:55:23',36,'2016-11-07 13:53:56',NULL),(28,1,'Ricki',NULL,0.000000000000000,0.000000000000000,1,'Online',NULL,'2016-09-18 10:55:30',36,'2016-11-07 13:53:56',NULL),(29,1,'West Terlingua',NULL,32.308555000000000,-94.277435000000000,1,'Online',NULL,'2016-09-26 23:05:16',1,'2016-11-07 13:53:56',1),(30,5,'Iroquois #2',NULL,32.657587000000000,-94.249134000000000,1,'Online',NULL,'2016-10-18 17:55:42',1,'2016-11-21 22:04:20',1),(32,5,'!Test 456',NULL,0.000000000000000,0.000000000000000,0,'Online',NULL,'2016-10-19 11:39:38',1,'2016-11-15 21:17:13',1),(34,5,'Iroquois #1',NULL,32.625087000000000,-94.273216000000000,1,'Online',NULL,'2016-10-19 23:42:15',1,'2016-11-21 22:06:40',1),(36,1,'fred',NULL,0.000000000000000,0.000000000000000,1,'Online',NULL,'2016-11-09 21:23:46',1,NULL,NULL),(37,1,'wr5ty5yaaa',NULL,0.000000000000000,0.000000000000000,0,'Online',NULL,'2016-11-09 22:30:19',1,'2016-11-10 04:39:11',1),(38,5,'Golden Field #3',NULL,0.000000000000000,0.000000000000000,1,'Online',NULL,'2016-11-18 11:26:45',1,'2016-11-22 01:43:33',1),(39,5,'Comanche #7',NULL,0.000000000000000,0.000000000000000,1,'Online',NULL,'2016-11-22 16:33:50',1,'2016-11-22 22:34:07',1),(40,1,'123',NULL,123.000000000000000,456.000000000000000,1,'Online',NULL,'2016-12-16 10:57:13',1,NULL,NULL),(50,1,'aaa',NULL,0.000000000000000,0.000000000000000,1,'Online',NULL,'2016-12-16 15:03:05',1,NULL,NULL);
/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag_data`
--

DROP TABLE IF EXISTS `tag_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag_data` (
  `site_id` int(10) unsigned NOT NULL,
  `tag_id` int(10) unsigned NOT NULL,
  `value` float NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`site_id`,`tag_id`,`created`),
  KEY `fk_tag_data_2_idx` (`tag_id`),
  CONSTRAINT `fk_tag_data_1` FOREIGN KEY (`site_id`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_tag_data_2` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag_data`
--

LOCK TABLES `tag_data` WRITE;
/*!40000 ALTER TABLE `tag_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `xml_name` varchar(45) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `tag_type` varchar(25) NOT NULL,
  `active` tinyint(1) DEFAULT '1',
  `created` datetime NOT NULL,
  `created_by` int(11) unsigned NOT NULL,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `modified_by` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'AST','AST','Description\'s 123','execution',1,'2016-11-07 18:28:37',1,'2016-11-17 04:32:20',1),(3,'BST','bst','','measurement',1,'2016-11-07 18:29:01',1,'2016-11-17 04:32:48',1),(5,'CST','cst','','trigger',1,'2016-11-07 18:31:07',1,'2016-11-17 04:33:16',1),(8,'DST','dst','desc','execution',1,'2016-11-09 19:24:26',1,'2016-11-17 04:33:28',1),(9,'EST','est','','measurement',1,'2016-11-09 22:40:17',1,'2016-11-17 04:33:39',1),(10,'FST','fst','','trigger',1,'2016-11-16 22:29:08',1,'2016-11-17 04:34:05',1),(11,'GST','gst','','execution',1,'2016-11-16 22:36:48',1,NULL,NULL),(12,'HST','hst','','measurement',1,'2016-11-16 22:37:04',1,NULL,NULL),(13,'IST','ist','','trigger',1,'2016-11-16 22:37:22',1,NULL,NULL),(14,'JST','jst','','action',1,'2016-11-17 20:57:29',1,NULL,NULL),(15,'KST','kst','','action',1,'2016-11-17 20:57:43',1,NULL,NULL),(16,'LST','lst','','action',1,'2016-11-17 20:57:58',1,NULL,NULL);
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tickets`
--

DROP TABLE IF EXISTS `tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tickets` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `account_id` int(11) unsigned NOT NULL,
  `module_id` int(11) unsigned NOT NULL,
  `issue` varchar(255) NOT NULL,
  `status` varchar(45) DEFAULT 'Open',
  `created` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `modified_by` int(11) DEFAULT NULL,
  `resolved` datetime DEFAULT NULL,
  `resolved_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tickets_1_idx` (`account_id`),
  KEY `fk_tickets_2_idx` (`module_id`),
  CONSTRAINT `fk_tickets_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tickets_2` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickets`
--

LOCK TABLES `tickets` WRITE;
/*!40000 ALTER TABLE `tickets` DISABLE KEYS */;
INSERT INTO `tickets` VALUES (1,1,39,'Need new features...','Open','2016-10-03 09:11:33',1,'2016-10-03 14:11:33',NULL,NULL,NULL),(2,1,27,'Can\'t add a new...','Open','2016-10-03 21:07:13',1,'2016-10-04 02:07:13',NULL,NULL,NULL),(3,1,31,'Doesn\'t work...','Open','2016-10-03 21:11:00',1,'2016-10-04 02:11:00',NULL,NULL,NULL),(4,1,31,'Doesn\'t work...','Open','2016-10-03 21:11:17',1,'2016-10-04 02:11:17',NULL,NULL,NULL),(5,1,23,'1234','Open','2016-10-03 21:58:08',1,'2016-10-04 02:58:08',NULL,NULL,NULL);
/*!40000 ALTER TABLE `tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trigger_actions`
--

DROP TABLE IF EXISTS `trigger_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trigger_actions` (
  `trigger_id` int(10) unsigned NOT NULL,
  `action_id` int(10) unsigned NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  PRIMARY KEY (`trigger_id`,`action_id`),
  KEY `fk_trigger_actions_2_idx` (`action_id`),
  CONSTRAINT `fk_trigger_actions_1` FOREIGN KEY (`trigger_id`) REFERENCES `triggers` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_trigger_actions_2` FOREIGN KEY (`action_id`) REFERENCES `actions` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trigger_actions`
--

LOCK TABLES `trigger_actions` WRITE;
/*!40000 ALTER TABLE `trigger_actions` DISABLE KEYS */;
INSERT INTO `trigger_actions` VALUES (1,1,'2016-11-17 06:03:18',1),(1,4,'2016-11-17 06:03:18',1),(1,5,'2016-11-17 06:03:18',1),(4,2,'2016-11-18 05:28:25',1),(4,6,'2016-11-18 05:28:25',1),(6,2,'2016-11-17 20:11:08',1),(6,3,'2016-11-17 20:11:08',1),(7,1,'2016-11-20 01:19:34',1),(7,3,'2016-11-20 01:19:34',1),(7,5,'2016-11-20 01:19:34',1);
/*!40000 ALTER TABLE `trigger_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trigger_tags`
--

DROP TABLE IF EXISTS `trigger_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trigger_tags` (
  `trigger_id` int(10) unsigned NOT NULL,
  `tag_id` int(10) unsigned NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  PRIMARY KEY (`trigger_id`,`tag_id`),
  KEY `fk_trigger_tags_2_idx` (`tag_id`),
  CONSTRAINT `fk_trigger_tags_1` FOREIGN KEY (`trigger_id`) REFERENCES `triggers` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_trigger_tags_2` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trigger_tags`
--

LOCK TABLES `trigger_tags` WRITE;
/*!40000 ALTER TABLE `trigger_tags` DISABLE KEYS */;
INSERT INTO `trigger_tags` VALUES (1,10,'2016-11-17 06:03:18',1),(4,5,'2016-11-18 05:28:26',1),(6,10,'2016-11-17 20:11:08',1),(7,13,'2016-11-20 01:19:34',1);
/*!40000 ALTER TABLE `trigger_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `triggers`
--

DROP TABLE IF EXISTS `triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `triggers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `xml_name` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `threshold` varchar(45) DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  `created` datetime DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `modified_by` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `triggers`
--

LOCK TABLES `triggers` WRITE;
/*!40000 ALTER TABLE `triggers` DISABLE KEYS */;
INSERT INTO `triggers` VALUES (1,'Tank Overflow','tankoverflow','',NULL,1,'2016-11-16 23:43:28',1,'2016-11-17 06:03:31',1),(4,'Overheated Motor','overheatedmoto','',NULL,1,'2016-11-17 13:57:26',1,'2016-11-18 05:26:21',1),(6,'Stuck Valve','stuckvalv','',NULL,1,'2016-11-17 14:11:08',1,NULL,NULL),(7,'Catastrophic Faliure','catastrophicfaliure','desc\'s',NULL,1,'2016-11-19 19:18:38',1,'2016-11-20 01:19:34',1);
/*!40000 ALTER TABLE `triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_departments`
--

DROP TABLE IF EXISTS `user_departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_departments` (
  `user_id` int(11) unsigned NOT NULL,
  `department_id` int(11) unsigned NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`department_id`),
  KEY `user` (`user_id`),
  KEY `department` (`department_id`),
  CONSTRAINT `fk_user_departments_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_departments_2` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_departments`
--

LOCK TABLES `user_departments` WRITE;
/*!40000 ALTER TABLE `user_departments` DISABLE KEYS */;
INSERT INTO `user_departments` VALUES (1,1,'2016-09-27 04:40:42',1),(1,6,'2016-09-27 04:40:42',1),(2,1,'2016-09-26 05:06:49',1),(2,6,'2016-09-26 05:06:49',1),(4,1,'2016-09-26 05:07:08',1),(4,7,'2016-09-26 05:07:08',1),(13,1,'2016-09-12 10:00:00',1),(13,4,'2016-09-12 10:00:00',1),(15,1,'2016-09-12 05:53:23',1),(15,6,'2016-09-12 05:53:23',1),(36,8,'2016-11-18 19:38:21',36),(37,1,'2016-09-16 07:39:54',1),(39,7,'2016-10-18 18:40:36',1),(41,1,'2016-09-29 19:15:26',1),(45,7,'2016-11-10 15:52:42',1);
/*!40000 ALTER TABLE `user_departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_groups`
--

DROP TABLE IF EXISTS `user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_groups` (
  `user_id` int(11) unsigned NOT NULL,
  `group_id` int(11) unsigned NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) unsigned NOT NULL,
  PRIMARY KEY (`group_id`,`user_id`),
  KEY `user` (`user_id`),
  KEY `group` (`group_id`),
  CONSTRAINT `fk_user_groups_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_groups_2` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_groups`
--

LOCK TABLES `user_groups` WRITE;
/*!40000 ALTER TABLE `user_groups` DISABLE KEYS */;
INSERT INTO `user_groups` VALUES (1,1,'2016-09-07 15:00:30',1),(43,1,'2016-11-10 12:58:38',1),(44,1,'2016-11-10 13:11:25',1),(2,2,'2016-09-18 06:21:33',1),(4,2,'2016-09-26 05:07:17',1),(13,2,'2016-09-12 10:00:11',1),(37,2,'2016-09-16 07:30:01',1),(41,2,'2016-09-29 19:15:26',1),(45,2,'2016-11-10 15:52:42',1),(2,4,'2016-09-18 06:21:33',1),(4,4,'2016-09-26 05:07:17',1),(13,4,'2016-09-12 10:00:11',1),(15,4,'2016-09-12 06:12:57',1),(37,4,'2016-09-16 07:30:01',1),(39,4,'2016-10-18 18:40:59',1),(40,4,'2016-09-27 04:58:39',1),(45,4,'2016-11-10 15:52:42',1),(39,6,'2016-10-18 18:40:59',1),(47,6,'2016-11-18 20:17:04',1),(36,10,'2016-11-18 19:30:45',1),(36,11,'2016-11-18 19:30:45',1);
/*!40000 ALTER TABLE `user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_settings`
--

DROP TABLE IF EXISTS `user_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_settings` (
  `user_id` int(10) unsigned NOT NULL,
  `home_page` varchar(45) DEFAULT NULL,
  `pagination` tinyint(3) unsigned DEFAULT NULL,
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `fk_user_settings_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_settings`
--

LOCK TABLES `user_settings` WRITE;
/*!40000 ALTER TABLE `user_settings` DISABLE KEYS */;
INSERT INTO `user_settings` VALUES (1,'58',29,'2017-01-06 19:52:13'),(36,'',0,'2016-11-18 20:13:43');
/*!40000 ALTER TABLE `user_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `account_id` int(11) unsigned NOT NULL DEFAULT '1',
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `user_name` varchar(45) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(100) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL,
  `created_by` int(11) unsigned NOT NULL,
  `modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `modified_by` int(11) unsigned DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `deleted_by` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `account` (`account_id`),
  KEY `modified_by` (`modified_by`),
  CONSTRAINT `fk_users_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,1,'Quest','Automated','admin','admin@quest-automated.com','202cb962ac59075b964b07152d234b70',1,'2016-09-04 01:09:54',1,'2016-11-10 13:09:22',1,0,NULL),(2,1,'Carroll','McCarroll','cmc','cmccarroll@quest-automated.com','900150983cd24fb0d6963f7d28e17f72',1,'2016-09-06 00:19:03',1,'2016-11-10 13:09:22',1,0,NULL),(4,1,'Blake','McCarroll','bmccarroll','blake.mccarroll@gmail.com','698d51a19d8a121ce581499d7b701668',1,'2016-09-06 01:24:36',1,'2016-11-10 13:09:22',1,0,NULL),(13,3,'Elaine','Rice','erice','erice@gmail.com','8fa14cdd754f91cc6554c9e71929cce7',1,'2016-09-11 14:37:41',1,'2016-11-10 13:09:22',1,0,NULL),(15,3,'Kyle','Rote','krote','krote@gmail.com','e4da3b7fbbce2345d7772b0674a318d5',1,'2016-09-11 14:42:21',1,'2016-11-10 13:09:22',1,0,NULL),(36,5,'Adam','West','awest','awest@gmail.com','1a1dc91c907325c69271ddf0c944bc72',1,'2016-09-13 23:11:17',1,'2016-11-10 13:09:22',NULL,0,NULL),(37,5,'John','Dillard','jdillard','jdillard@gmail.com','1a1dc91c907325c69271ddf0c944bc72',1,'2016-09-14 20:24:08',1,'2016-11-10 13:09:22',1,0,NULL),(39,5,'Baby','One','bone','bone','1a1dc91c907325c69271ddf0c944bc72',1,'2016-09-15 08:36:33',1,'2016-11-10 13:09:22',NULL,0,NULL),(40,1,'Rebecca','Pope','rpope','rpope@gmail.com','1a1dc91c907325c69271ddf0c944bc72',1,'2016-09-25 23:43:51',1,'2016-11-10 13:09:22',NULL,0,NULL),(41,1,'John','Miles','jmiles','jmiles@gmail.com','1a1dc91c907325c69271ddf0c944bc72',0,'2016-09-29 14:15:26',1,'2016-11-10 13:09:22',1,0,NULL),(43,1,'Savannah','McCarroll','smccarroll','smccarroll@gmail.com','6848d756da66e55b42f79c0728e351ad',1,'2016-11-10 06:58:38',1,'2016-11-10 13:09:22',NULL,0,NULL),(44,1,'Roy','McCarroll','rmccarroll','roymccarroll@gmail.com','202cb962ac59075b964b07152d234b70',1,'2016-11-10 07:11:25',1,NULL,NULL,0,0),(45,1,'John','Levinski','jlevinski','jlevinski@gmail.com','202cb962ac59075b964b07152d234b70',1,'2016-11-10 09:52:42',1,'2016-11-10 20:04:20',1,0,0),(46,1,'OPC','UA','opcua','opcua@gmail.com','5f4dcc3b5aa765d61d8327deb882cf99',1,'2016-11-17 00:14:33',1,NULL,NULL,0,0),(47,1,'John','Technician','tech','John.Technician@gmail.com','1a1dc91c907325c69271ddf0c944bc72',1,'2016-11-18 14:16:30',1,NULL,NULL,0,0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-01-09 15:45:49

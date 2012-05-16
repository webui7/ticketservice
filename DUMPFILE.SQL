-- MySQL dump 10.13  Distrib 5.1.58, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: webui_rails11
-- ------------------------------------------------------
-- Server version	5.1.58-1ubuntu1

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
-- Current Database: `webui_rails11`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `webui_rails11` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `webui_rails11`;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `depname` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1,'department A','2012-05-11 22:52:27','2012-05-11 22:52:27'),(2,'department B','2012-05-11 22:52:41','2012-05-11 22:52:41'),(3,'department C','2012-05-11 22:52:53','2012-05-11 22:52:53');
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `owners`
--

DROP TABLE IF EXISTS `owners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `owners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ownername` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `owners`
--

LOCK TABLES `owners` WRITE;
/*!40000 ALTER TABLE `owners` DISABLE KEYS */;
INSERT INTO `owners` VALUES (1,'customer','2012-05-13 19:33:32','2012-05-13 19:33:32'),(2,'support team member 1','2012-05-13 19:34:32','2012-05-13 19:34:32'),(3,'Support team member 2','2012-05-13 19:34:43','2012-05-13 19:34:43');
/*!40000 ALTER TABLE `owners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20120511100551'),('20120511215713'),('20120511215831'),('20120511215913'),('20120513184405'),('20120513190645'),('20120513190845');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statuses`
--

DROP TABLE IF EXISTS `statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `statuses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `statusname` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statuses`
--

LOCK TABLES `statuses` WRITE;
/*!40000 ALTER TABLE `statuses` DISABLE KEYS */;
INSERT INTO `statuses` VALUES (1,'Waiting for Staff Response','2012-05-11 22:49:51','2012-05-11 22:49:51'),(2,'Waiting for Customer','2012-05-11 22:50:10','2012-05-11 22:50:10'),(3,'On Hold','2012-05-11 22:50:39','2012-05-11 22:50:39'),(4,'Cancelled','2012-05-11 22:51:05','2012-05-11 22:51:45'),(5,'Completed','2012-05-11 22:51:28','2012-05-11 22:51:28');
/*!40000 ALTER TABLE `statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tickets`
--

DROP TABLE IF EXISTS `tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tickets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reference` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `requestbody` varchar(255) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickets`
--

LOCK TABLES `tickets` WRITE;
/*!40000 ALTER TABLE `tickets` DISABLE KEYS */;
INSERT INTO `tickets` VALUES (25,'ACD-000025','vasja','andriy777@ukr.net','<div class=\'req\'><span class=\'req_title\'>Customer request:</span><br>just check</div><br/><br/>customer  REPLY<br/>SADAFfas<br/><br/><span class=\'req_title\'>Support team member 2  REPLY</span><br/>ccbxcvzxvxcv\r\nsd\r\nsdfsdfs\r\n\r\n\r\n\r\ndsfasdfsdfa',1,1,NULL,'2012-05-14 06:50:04','2012-05-14 07:09:16','check 1',3),(26,'ACD-000026','vasja1 ','andriy777@ukr.net','<div class=\'req\'><span class=\'req_title\'>Customer request:</span><br>asdsadad</div><br/><br/>support team member 1  REPLY<br/>stuff reply<br/><br/><span class=\'req_title\'>support team member 1  REPLY</span><br/>dsdsfsdafdsf<br/><br/><span class=\'req_title',2,3,NULL,'2012-05-14 06:53:23','2012-05-14 15:32:16','subject1',2),(27,'ACD-000027','sadadf','andriy777@ukr.net','<div class=\'req\'><span class=\'req_title\'>Customer request:</span><br>sadfsdgsdgadgsd</div><br/><br/><span class=\'req_title\'>customer  REPLY</span><br/>cancelled\r\n<br/><br/><span class=\'req_title\'>Support team member 2  REPLY</span><br/>fgdfsgdgdfsg<br/><b',1,3,NULL,'2012-05-14 15:30:01','2012-05-14 15:45:35','sadsadfaf',3),(28,'ACD-000028','dsafdsfad','andriy777@ukr.net','<div class=\'req\'><span class=\'req_title\'>Customer request:</span><br>sgsdgsdfsdfsdf</div><br/><br/><span class=\'req_title\'>customer  REPLY</span><br/>this is some text<br/><br/><span class=\'req_title\'>Support team member 2  REPLY</span><br/>this is new re',1,2,NULL,'2012-05-14 15:30:32','2012-05-14 15:33:49','werertwer  jkdskjkjdsklf dsfgdafsgfds',3);
/*!40000 ALTER TABLE `tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usename` varchar(255) DEFAULT NULL,
  `ownername` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','support team ','12345','2012-05-11 22:46:12','2012-05-11 22:46:12'),(2,'admin1','Some name','12345678','2012-05-12 19:22:01','2012-05-12 19:22:01');
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

-- Dump completed on 2012-05-14 23:50:23

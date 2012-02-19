-- MySQL dump 10.13  Distrib 5.1.41, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: startup_test
-- ------------------------------------------------------
-- Server version	5.1.41-3ubuntu12.10

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
-- Current Database: `startup_test`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `startup_test` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `startup_test`;

--
-- Table structure for table `3f7f6ece338d68f7fbd069377de434e0_db_version`
--

DROP TABLE IF EXISTS `3f7f6ece338d68f7fbd069377de434e0_db_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `3f7f6ece338d68f7fbd069377de434e0_db_version` (
  `version` int(10) unsigned NOT NULL DEFAULT '16',
  PRIMARY KEY (`version`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `3f7f6ece338d68f7fbd069377de434e0_db_version`
--

LOCK TABLES `3f7f6ece338d68f7fbd069377de434e0_db_version` WRITE;
/*!40000 ALTER TABLE `3f7f6ece338d68f7fbd069377de434e0_db_version` DISABLE KEYS */;
INSERT INTO `3f7f6ece338d68f7fbd069377de434e0_db_version` VALUES (16);
/*!40000 ALTER TABLE `3f7f6ece338d68f7fbd069377de434e0_db_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `u_account_charge`
--

DROP TABLE IF EXISTS `u_account_charge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `u_account_charge` (
  `account_id` int(11) NOT NULL,
  `date_time` datetime NOT NULL,
  `amount` decimal(10,0) DEFAULT NULL,
  UNIQUE KEY `acct_id_datetime` (`account_id`,`date_time`),
  KEY `account_idx` (`account_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `u_account_charge`
--

LOCK TABLES `u_account_charge` WRITE;
/*!40000 ALTER TABLE `u_account_charge` DISABLE KEYS */;
/*!40000 ALTER TABLE `u_account_charge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `u_account_features`
--

DROP TABLE IF EXISTS `u_account_features`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `u_account_features` (
  `account_id` int(10) unsigned NOT NULL COMMENT 'User ID',
  `feature_id` int(2) unsigned NOT NULL COMMENT 'Feature ID',
  PRIMARY KEY (`account_id`,`feature_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Keeps feature list for all users';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `u_account_features`
--

LOCK TABLES `u_account_features` WRITE;
/*!40000 ALTER TABLE `u_account_features` DISABLE KEYS */;
/*!40000 ALTER TABLE `u_account_features` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `u_account_users`
--

DROP TABLE IF EXISTS `u_account_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `u_account_users` (
  `account_id` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `role` tinyint(4) unsigned NOT NULL DEFAULT '0',
  KEY `user_account` (`account_id`),
  KEY `account_user` (`user_id`),
  CONSTRAINT `account_user` FOREIGN KEY (`user_id`) REFERENCES `u_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `u_account_users_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `u_accounts` (`id`),
  CONSTRAINT `u_account_users_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `u_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `u_account_users`
--

LOCK TABLES `u_account_users` WRITE;
/*!40000 ALTER TABLE `u_account_users` DISABLE KEYS */;
INSERT INTO `u_account_users` VALUES (80,58,1),(81,59,1),(82,60,1),(83,61,1),(84,62,1);
/*!40000 ALTER TABLE `u_account_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `u_accounts`
--

DROP TABLE IF EXISTS `u_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `u_accounts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` text,
  `plan` varchar(256) DEFAULT NULL,
  `schedule` varchar(256) DEFAULT NULL,
  `engine` varchar(256) DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  `schedule_changed` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `u_accounts`
--

LOCK TABLES `u_accounts` WRITE;
/*!40000 ALTER TABLE `u_accounts` DISABLE KEYS */;
INSERT INTO `u_accounts` VALUES (80,'FREE (irkko)','0',NULL,NULL,1,NULL),(81,'FREE (Paul)','0',NULL,NULL,1,NULL),(82,'FREE (irina)','0',NULL,NULL,1,NULL),(83,'FREE (Sergey Chernyshev)','0',NULL,NULL,1,NULL),(84,'FREE (qqq)','0',NULL,NULL,1,NULL);
/*!40000 ALTER TABLE `u_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `u_activity`
--

DROP TABLE IF EXISTS `u_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `u_activity` (
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time of activity',
  `user_id` int(10) unsigned NOT NULL COMMENT 'User ID',
  `activity_id` int(2) unsigned NOT NULL COMMENT 'Activity ID',
  KEY `time` (`time`),
  KEY `user_id` (`user_id`),
  KEY `activity_id` (`activity_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores user activities';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `u_activity`
--

LOCK TABLES `u_activity` WRITE;
/*!40000 ALTER TABLE `u_activity` DISABLE KEYS */;
INSERT INTO `u_activity` VALUES ('2012-01-24 20:41:58',58,1009),('2012-01-24 20:42:07',58,1000),('2012-01-24 20:42:22',58,1000),('2012-01-24 20:43:13',58,1000),('2012-01-24 20:43:24',58,1014),('2012-01-24 20:43:35',58,1000),('2012-01-25 22:00:24',59,1009),('2012-01-25 22:00:31',59,1000),('2012-02-05 21:44:46',59,1017),('2012-02-06 17:13:06',60,1009),('2012-02-06 17:20:27',60,1008),('2012-02-06 17:21:57',60,1000),('2012-02-06 18:42:27',59,1015),('2012-02-06 18:58:29',61,1009),('2012-02-06 18:58:41',61,1008),('2012-02-06 18:58:49',61,1000),('2012-02-06 19:45:54',60,1015),('2012-02-07 15:16:27',60,1015),('2012-02-07 16:03:02',60,1008),('2012-02-07 16:04:29',60,1000),('2012-02-07 17:24:45',61,1015),('2012-02-07 18:06:38',61,1015),('2012-02-07 22:14:06',61,1015),('2012-02-09 15:09:03',60,1000),('2012-02-09 16:30:36',60,1008),('2012-02-09 16:49:46',60,1000),('2012-02-10 20:07:39',61,1016),('2012-02-13 08:09:34',60,1000),('2012-02-13 15:53:54',60,1015),('2012-02-14 13:21:40',60,1000),('2012-02-14 15:20:10',60,1015),('2012-02-14 17:17:10',60,1008),('2012-02-14 17:18:38',62,1009),('2012-02-15 09:00:18',62,1015),('2012-02-15 09:00:18',62,1015);
/*!40000 ALTER TABLE `u_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `u_admin_daily_stats_cache`
--

DROP TABLE IF EXISTS `u_admin_daily_stats_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `u_admin_daily_stats_cache` (
  `day` date NOT NULL COMMENT 'Date for which calculations are stored',
  `active_users` int(10) NOT NULL COMMENT 'Number of active users calculated for this day',
  PRIMARY KEY (`day`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `u_admin_daily_stats_cache`
--

LOCK TABLES `u_admin_daily_stats_cache` WRITE;
/*!40000 ALTER TABLE `u_admin_daily_stats_cache` DISABLE KEYS */;
INSERT INTO `u_admin_daily_stats_cache` VALUES ('2012-01-25',0),('2012-01-26',0),('2012-01-27',0),('2012-01-28',0),('2012-01-29',0),('2012-01-30',0),('2012-01-31',0),('2012-02-01',0),('2012-02-02',0),('2012-02-03',0),('2012-02-04',0),('2012-02-05',0),('2012-02-06',0),('2012-02-07',1),('2012-02-08',1),('2012-02-09',2),('2012-02-10',3),('2012-02-11',3),('2012-02-12',3),('2012-02-13',3),('2012-02-14',3);
/*!40000 ALTER TABLE `u_admin_daily_stats_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `u_cmp`
--

DROP TABLE IF EXISTS `u_cmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `u_cmp` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Campaign ID',
  `name` varchar(255) NOT NULL COMMENT 'Campaign Name',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Campaigns';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `u_cmp`
--

LOCK TABLES `u_cmp` WRITE;
/*!40000 ALTER TABLE `u_cmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `u_cmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `u_cmp_content`
--

DROP TABLE IF EXISTS `u_cmp_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `u_cmp_content` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Campaign content ID',
  `content` varchar(255) NOT NULL COMMENT 'Campaign content (dor A/B testing of different ads)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `content` (`content`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Campaign content';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `u_cmp_content`
--

LOCK TABLES `u_cmp_content` WRITE;
/*!40000 ALTER TABLE `u_cmp_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `u_cmp_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `u_cmp_keywords`
--

DROP TABLE IF EXISTS `u_cmp_keywords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `u_cmp_keywords` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Campaign keyword combination ID',
  `keywords` varchar(255) NOT NULL COMMENT 'Comma separated list of campaign keywords',
  PRIMARY KEY (`id`),
  UNIQUE KEY `keywords` (`keywords`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Campaign keywords';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `u_cmp_keywords`
--

LOCK TABLES `u_cmp_keywords` WRITE;
/*!40000 ALTER TABLE `u_cmp_keywords` DISABLE KEYS */;
/*!40000 ALTER TABLE `u_cmp_keywords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `u_cmp_medium`
--

DROP TABLE IF EXISTS `u_cmp_medium`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `u_cmp_medium` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Campaign medium ID',
  `medium` varchar(255) NOT NULL COMMENT 'Campaign Medium (cpc, banners, email, twitter & atc',
  PRIMARY KEY (`id`),
  UNIQUE KEY `medium` (`medium`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Campaign medium';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `u_cmp_medium`
--

LOCK TABLES `u_cmp_medium` WRITE;
/*!40000 ALTER TABLE `u_cmp_medium` DISABLE KEYS */;
/*!40000 ALTER TABLE `u_cmp_medium` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `u_cmp_source`
--

DROP TABLE IF EXISTS `u_cmp_source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `u_cmp_source` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Campaign source ID',
  `source` varchar(255) NOT NULL COMMENT 'Campaign Source (google, newsletter5, widget1, embedplayer2)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `source` (`source`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Campaign source';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `u_cmp_source`
--

LOCK TABLES `u_cmp_source` WRITE;
/*!40000 ALTER TABLE `u_cmp_source` DISABLE KEYS */;
/*!40000 ALTER TABLE `u_cmp_source` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `u_googlefriendconnect`
--

DROP TABLE IF EXISTS `u_googlefriendconnect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `u_googlefriendconnect` (
  `user_id` int(10) unsigned NOT NULL COMMENT 'User ID',
  `google_id` varchar(255) NOT NULL COMMENT 'Google Friend Connect ID',
  `userpic` text NOT NULL COMMENT 'Google Friend Connect User picture',
  PRIMARY KEY (`user_id`,`google_id`),
  CONSTRAINT `gfc_user` FOREIGN KEY (`user_id`) REFERENCES `u_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `u_googlefriendconnect`
--

LOCK TABLES `u_googlefriendconnect` WRITE;
/*!40000 ALTER TABLE `u_googlefriendconnect` DISABLE KEYS */;
/*!40000 ALTER TABLE `u_googlefriendconnect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `u_invitation`
--

DROP TABLE IF EXISTS `u_invitation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `u_invitation` (
  `code` char(10) NOT NULL COMMENT 'Code',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'When invitation was created',
  `issuedby` bigint(10) unsigned NOT NULL DEFAULT '1' COMMENT 'User who issued the invitation. Default is Sergey.',
  `sentto` text COMMENT 'Note about who this invitation was sent to',
  `user` bigint(10) unsigned DEFAULT NULL COMMENT 'User name',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `u_invitation`
--

LOCK TABLES `u_invitation` WRITE;
/*!40000 ALTER TABLE `u_invitation` DISABLE KEYS */;
/*!40000 ALTER TABLE `u_invitation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `u_oauth_consumer_registry`
--

DROP TABLE IF EXISTS `u_oauth_consumer_registry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `u_oauth_consumer_registry` (
  `ocr_id` int(11) NOT NULL AUTO_INCREMENT,
  `ocr_usa_id_ref` int(11) DEFAULT NULL,
  `ocr_consumer_key` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `ocr_consumer_secret` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `ocr_signature_methods` varchar(255) NOT NULL DEFAULT 'HMAC-SHA1,PLAINTEXT',
  `ocr_server_uri` varchar(255) NOT NULL,
  `ocr_server_uri_host` varchar(128) NOT NULL,
  `ocr_server_uri_path` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `ocr_request_token_uri` varchar(255) NOT NULL,
  `ocr_authorize_uri` varchar(255) NOT NULL,
  `ocr_access_token_uri` varchar(255) NOT NULL,
  `ocr_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ocr_id`),
  UNIQUE KEY `ocr_consumer_key` (`ocr_consumer_key`,`ocr_usa_id_ref`,`ocr_server_uri`),
  KEY `ocr_server_uri` (`ocr_server_uri`),
  KEY `ocr_server_uri_host` (`ocr_server_uri_host`,`ocr_server_uri_path`),
  KEY `ocr_usa_id_ref` (`ocr_usa_id_ref`),
  CONSTRAINT `ocr_oauth_user_id` FOREIGN KEY (`ocr_usa_id_ref`) REFERENCES `u_user_oauth_identity` (`oauth_user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `u_oauth_consumer_registry`
--

LOCK TABLES `u_oauth_consumer_registry` WRITE;
/*!40000 ALTER TABLE `u_oauth_consumer_registry` DISABLE KEYS */;
/*!40000 ALTER TABLE `u_oauth_consumer_registry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `u_oauth_consumer_token`
--

DROP TABLE IF EXISTS `u_oauth_consumer_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `u_oauth_consumer_token` (
  `oct_id` int(11) NOT NULL AUTO_INCREMENT,
  `oct_ocr_id_ref` int(11) NOT NULL,
  `oct_usa_id_ref` int(11) NOT NULL,
  `oct_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `oct_token` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `oct_token_secret` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `oct_token_type` enum('request','authorized','access') DEFAULT NULL,
  `oct_token_ttl` datetime NOT NULL DEFAULT '9999-12-31 00:00:00',
  `oct_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`oct_id`),
  UNIQUE KEY `oct_usa_id_ref` (`oct_usa_id_ref`,`oct_ocr_id_ref`,`oct_token_type`,`oct_name`),
  KEY `oct_token_ttl` (`oct_token_ttl`),
  KEY `oct_token_server_id` (`oct_ocr_id_ref`),
  CONSTRAINT `oct_oauth_user_id` FOREIGN KEY (`oct_usa_id_ref`) REFERENCES `u_user_oauth_identity` (`oauth_user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `oct_token_server_id` FOREIGN KEY (`oct_ocr_id_ref`) REFERENCES `u_oauth_consumer_registry` (`ocr_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `u_oauth_consumer_token`
--

LOCK TABLES `u_oauth_consumer_token` WRITE;
/*!40000 ALTER TABLE `u_oauth_consumer_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `u_oauth_consumer_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `u_oauth_log`
--

DROP TABLE IF EXISTS `u_oauth_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `u_oauth_log` (
  `olg_id` int(11) NOT NULL AUTO_INCREMENT,
  `olg_osr_consumer_key` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `olg_ost_token` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `olg_ocr_consumer_key` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `olg_oct_token` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `olg_usa_id_ref` int(11) DEFAULT NULL,
  `olg_received` text NOT NULL,
  `olg_sent` text NOT NULL,
  `olg_base_string` text NOT NULL,
  `olg_notes` text NOT NULL,
  `olg_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `olg_remote_ip` bigint(20) NOT NULL,
  PRIMARY KEY (`olg_id`),
  KEY `olg_osr_consumer_key` (`olg_osr_consumer_key`,`olg_id`),
  KEY `olg_ost_token` (`olg_ost_token`,`olg_id`),
  KEY `olg_ocr_consumer_key` (`olg_ocr_consumer_key`,`olg_id`),
  KEY `olg_oct_token` (`olg_oct_token`,`olg_id`),
  KEY `olg_usa_id_ref` (`olg_usa_id_ref`,`olg_id`),
  CONSTRAINT `olg_oauth_user_id` FOREIGN KEY (`olg_usa_id_ref`) REFERENCES `u_user_oauth_identity` (`oauth_user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `u_oauth_log`
--

LOCK TABLES `u_oauth_log` WRITE;
/*!40000 ALTER TABLE `u_oauth_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `u_oauth_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `u_oid_associations`
--

DROP TABLE IF EXISTS `u_oid_associations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `u_oid_associations` (
  `server_url` blob NOT NULL,
  `handle` varchar(255) NOT NULL DEFAULT '',
  `secret` blob NOT NULL,
  `issued` int(11) NOT NULL DEFAULT '0',
  `lifetime` int(11) NOT NULL DEFAULT '0',
  `assoc_type` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`server_url`(255),`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `u_oid_associations`
--

LOCK TABLES `u_oid_associations` WRITE;
/*!40000 ALTER TABLE `u_oid_associations` DISABLE KEYS */;
/*!40000 ALTER TABLE `u_oid_associations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `u_oid_nonces`
--

DROP TABLE IF EXISTS `u_oid_nonces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `u_oid_nonces` (
  `server_url` text NOT NULL,
  `timestamp` int(11) NOT NULL DEFAULT '0',
  `salt` varchar(40) NOT NULL DEFAULT '',
  UNIQUE KEY `server_url` (`server_url`(255),`timestamp`,`salt`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `u_oid_nonces`
--

LOCK TABLES `u_oid_nonces` WRITE;
/*!40000 ALTER TABLE `u_oid_nonces` DISABLE KEYS */;
/*!40000 ALTER TABLE `u_oid_nonces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `u_user_features`
--

DROP TABLE IF EXISTS `u_user_features`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `u_user_features` (
  `user_id` int(10) unsigned NOT NULL COMMENT 'User ID',
  `feature_id` int(2) unsigned NOT NULL COMMENT 'Feature ID',
  PRIMARY KEY (`user_id`,`feature_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Keeps feature list for all users';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `u_user_features`
--

LOCK TABLES `u_user_features` WRITE;
/*!40000 ALTER TABLE `u_user_features` DISABLE KEYS */;
/*!40000 ALTER TABLE `u_user_features` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `u_user_oauth_identity`
--

DROP TABLE IF EXISTS `u_user_oauth_identity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `u_user_oauth_identity` (
  `oauth_user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'oauth-php user id',
  `module` varchar(64) NOT NULL COMMENT 'Module id',
  `user_id` int(10) unsigned DEFAULT NULL COMMENT 'UserBase user id',
  `identity` text COMMENT 'String uniquely identifying user on the oauth server',
  `userinfo` text COMMENT 'Serialized user information to be used for rendering',
  PRIMARY KEY (`oauth_user_id`),
  KEY `oauth_identity_user_id` (`user_id`),
  CONSTRAINT `oauth_identity_user_id` FOREIGN KEY (`user_id`) REFERENCES `u_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table that links UserBase users and oauth-php users and thei';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `u_user_oauth_identity`
--

LOCK TABLES `u_user_oauth_identity` WRITE;
/*!40000 ALTER TABLE `u_user_oauth_identity` DISABLE KEYS */;
/*!40000 ALTER TABLE `u_user_oauth_identity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `u_user_preferences`
--

DROP TABLE IF EXISTS `u_user_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `u_user_preferences` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `current_account_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `preference_current_account` (`current_account_id`),
  CONSTRAINT `preference_user` FOREIGN KEY (`user_id`) REFERENCES `u_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `u_user_preferences_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `u_users` (`id`),
  CONSTRAINT `u_user_preferences_ibfk_2` FOREIGN KEY (`current_account_id`) REFERENCES `u_accounts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `u_user_preferences`
--

LOCK TABLES `u_user_preferences` WRITE;
/*!40000 ALTER TABLE `u_user_preferences` DISABLE KEYS */;
INSERT INTO `u_user_preferences` VALUES (63,NULL),(64,NULL),(58,80),(59,81),(60,82),(61,83),(62,84);
/*!40000 ALTER TABLE `u_user_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `u_users`
--

DROP TABLE IF EXISTS `u_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `u_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT 'Status of the user (enabled/disabled)',
  `regtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time of registration',
  `regmodule` varchar(64) NOT NULL COMMENT 'Registration module ID',
  `name` text NOT NULL,
  `username` varchar(25) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `pass` varchar(40) NOT NULL COMMENT 'Password digest',
  `salt` varchar(13) NOT NULL COMMENT 'Salt',
  `temppass` varchar(13) DEFAULT NULL COMMENT 'Temporary password used for password recovery',
  `loginlinkcode` varchar(10) DEFAULT NULL COMMENT 'One time code used to login',
  `temppasstime` timestamp NULL DEFAULT NULL COMMENT 'Temporary password generation time',
  `requirespassreset` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Flag indicating that user must reset their password before using the site',
  `fb_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Facebook user ID',
  `last_accessed` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `points` int(10) unsigned NOT NULL DEFAULT '0',
  `referer` blob COMMENT 'Page user came from when registered',
  `reg_cmp_source_id` int(10) unsigned DEFAULT NULL COMMENT 'Campaign Source (google, newsletter5, widget1, embedplayer2)',
  `reg_cmp_medium_id` int(10) unsigned DEFAULT NULL COMMENT 'Campaign Medium (cpc, banners, email, twitter & atc)',
  `reg_cmp_keywords_id` int(10) unsigned DEFAULT NULL COMMENT 'Campaign Term (paid campaign keywords)',
  `reg_cmp_content_id` int(10) unsigned DEFAULT NULL COMMENT 'Campaign Content (for differentiating ads)',
  `reg_cmp_name_id` int(10) unsigned DEFAULT NULL COMMENT 'Campaign Name',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `fb_id` (`fb_id`),
  KEY `registration_campaign_source` (`reg_cmp_source_id`),
  KEY `registration_campaign_medium` (`reg_cmp_medium_id`),
  KEY `registration_campaign_keywords` (`reg_cmp_keywords_id`),
  KEY `registration_campaign_content` (`reg_cmp_content_id`),
  KEY `registration_campaign_name` (`reg_cmp_name_id`),
  CONSTRAINT `registration_campaign_content` FOREIGN KEY (`reg_cmp_content_id`) REFERENCES `u_cmp_content` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `registration_campaign_keywords` FOREIGN KEY (`reg_cmp_keywords_id`) REFERENCES `u_cmp_keywords` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `registration_campaign_medium` FOREIGN KEY (`reg_cmp_medium_id`) REFERENCES `u_cmp_medium` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `registration_campaign_name` FOREIGN KEY (`reg_cmp_name_id`) REFERENCES `u_cmp` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `registration_campaign_source` FOREIGN KEY (`reg_cmp_source_id`) REFERENCES `u_cmp_source` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `u_users`
--

LOCK TABLES `u_users` WRITE;
/*!40000 ALTER TABLE `u_users` DISABLE KEYS */;
INSERT INTO `u_users` VALUES (58,1,'2012-01-24 20:41:58','userpass','irkko','admin','irina.v.kovaleva@gmail.com','37cb569839693ca6f1401e91b17251dff8b14bdb','4f1f17ecac29b',NULL,NULL,NULL,0,NULL,'0000-00-00 00:00:00',5,NULL,NULL,NULL,NULL,NULL,NULL),(59,1,'2012-01-25 22:00:24','userpass','Paul','spacediver','paul.sutyrin@gmail.com','7fc9bad645c1c263324a47a456b8c3a3f1c095f0','4f207b78d317a',NULL,NULL,NULL,0,NULL,'0000-00-00 00:00:00',6,NULL,NULL,NULL,NULL,NULL,NULL),(60,1,'2012-02-06 17:13:06','userpass','irina','webdeva','i_smith@mail.ru','e7f9d5511be12eafadc3aa6d2cbf066fb485ae23','4f300a22b9af3',NULL,NULL,NULL,0,NULL,'0000-00-00 00:00:00',19,NULL,NULL,NULL,NULL,NULL,NULL),(61,1,'2012-02-06 18:58:29','userpass','Sergey Chernyshev','sergeychernyshev','sergey.chernyshev@gmail.com','c55251957fc83115907355d2adfaca1b9be0fc54','4f3022d552acb',NULL,NULL,NULL,0,NULL,'0000-00-00 00:00:00',13,NULL,NULL,NULL,NULL,NULL,NULL),(62,1,'2012-02-14 17:18:38','userpass','qqq','tst','qqq@mail.ru','82d3b0af6c1403f08091816346ad1c5de2f8109b','4f3a976e8bbbc',NULL,NULL,NULL,0,NULL,'0000-00-00 00:00:00',7,NULL,NULL,NULL,NULL,NULL,NULL),(63,1,'2012-02-17 16:59:40','userpass','whale','whale','whale2.box@gmail.com','88c97956c8b3e77cb2bdad306d1a14b0fe8762b3','4f3e877c1ed28',NULL,NULL,NULL,0,NULL,'0000-00-00 00:00:00',0,NULL,NULL,NULL,NULL,NULL,NULL),(64,1,'2012-02-17 17:04:10','userpass','whale','whale2','whl@sinijkit.ru','077c276d158f6c769bd0bd8ab9d77646cf39c1b6','4f3e888ac69c0',NULL,NULL,NULL,0,NULL,'0000-00-00 00:00:00',0,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `u_users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-02-20  1:29:13

-- MySQL dump 10.13  Distrib 8.0.19, for Linux (x86_64)
--
-- Host: localhost    Database: asterisk
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `agent_number_map`
--

DROP TABLE IF EXISTS `agent_number_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agent_number_map` (
  `id` int NOT NULL AUTO_INCREMENT,
  `agent_id` varchar(100) DEFAULT NULL,
  `agent_number` varchar(40) DEFAULT NULL,
  `instance` varchar(255) DEFAULT NULL,
  `status` varchar(100) NOT NULL DEFAULT 'FREE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `agent_queue_status`
--

DROP TABLE IF EXISTS `agent_queue_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agent_queue_status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `agent_name` varchar(50) NOT NULL,
  `status` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `agent_status`
--

DROP TABLE IF EXISTS `agent_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agent_status` (
  `agentId` varchar(40) NOT NULL DEFAULT '',
  `agentName` varchar(40) DEFAULT NULL,
  `agentStatus` varchar(30) DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT NULL,
  `callid` double(18,6) unsigned DEFAULT '0.000000',
  `queue` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`agentId`),
  KEY `agentName` (`agentName`),
  KEY `agentStatus` (`agentStatus`,`timestamp`,`callid`),
  KEY `queue` (`queue`),
  KEY `callid` (`callid`),
  KEY `callid_2` (`callid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `apicommunication`
--

DROP TABLE IF EXISTS `apicommunication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `apicommunication` (
  `id` int NOT NULL AUTO_INCREMENT,
  `leadid` varchar(25) NOT NULL,
  `cammunicationid` varchar(15) NOT NULL,
  `context` varchar(25) NOT NULL,
  `api` varchar(500) DEFAULT NULL,
  `status` int NOT NULL,
  `autostatus` varchar(50) NOT NULL,
  `hittime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `recfilename` varchar(200) NOT NULL,
  `recfilenamepush` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `leadid` (`leadid`),
  KEY `status` (`status`),
  KEY `context` (`context`),
  KEY `hittime` (`hittime`),
  KEY `datapush` (`autostatus`,`status`,`hittime`)
) ENGINE=MyISAM AUTO_INCREMENT=1145879 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `apilog`
--

DROP TABLE IF EXISTS `apilog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `apilog` (
  `id` int NOT NULL AUTO_INCREMENT,
  `apisource` varchar(20) DEFAULT NULL,
  `ip` varchar(20) DEFAULT NULL,
  `apiurl` varchar(250) DEFAULT NULL,
  `leadid` varchar(10) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `agentid` varchar(20) NOT NULL,
  `campaign` varchar(50) NOT NULL,
  `apicalltime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `leadid` (`leadid`),
  KEY `phone` (`phone`),
  KEY `agentid` (`agentid`),
  KEY `campaign` (`campaign`),
  KEY `apicalltime` (`apicalltime`)
) ENGINE=MyISAM AUTO_INCREMENT=6103 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `call_status`
--

DROP TABLE IF EXISTS `call_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `call_status` (
  `callId` varchar(50) NOT NULL,
  `callerId` varchar(13) NOT NULL,
  `status` varchar(30) NOT NULL,
  `timestamp` timestamp NULL DEFAULT NULL,
  `queue` varchar(25) NOT NULL,
  `position` varchar(11) NOT NULL,
  `originalPosition` varchar(11) NOT NULL,
  `holdtime` varchar(11) NOT NULL,
  `keyPressed` varchar(11) NOT NULL,
  `callduration` int NOT NULL,
  PRIMARY KEY (`callId`),
  KEY `callerId` (`callerId`),
  KEY `status` (`status`),
  KEY `timestamp` (`timestamp`),
  KEY `queue` (`queue`),
  KEY `position` (`position`,`originalPosition`,`holdtime`),
  KEY `callId` (`callId`,`callerId`,`queue`),
  KEY `callId_2` (`callId`,`callerId`,`queue`),
  KEY `queue_2` (`queue`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `calling_environment`
--

DROP TABLE IF EXISTS `calling_environment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `calling_environment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `prefix` varchar(50) NOT NULL,
  `domain` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `campaign_route`
--

DROP TABLE IF EXISTS `campaign_route`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `campaign_route` (
  `campaign_name` varchar(25) NOT NULL DEFAULT '',
  `server_ip` varchar(15) DEFAULT NULL,
  `context` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`campaign_name`),
  KEY `server_ip` (`server_ip`,`context`),
  KEY `context` (`context`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cdr`
--

DROP TABLE IF EXISTS `cdr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cdr` (
  `calldate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `clid` varchar(80) NOT NULL DEFAULT '',
  `src` varchar(80) NOT NULL DEFAULT '',
  `dst` varchar(80) NOT NULL DEFAULT '',
  `dcontext` varchar(80) NOT NULL DEFAULT '',
  `channel` varchar(80) NOT NULL DEFAULT '',
  `dstchannel` varchar(80) NOT NULL DEFAULT '',
  `lastapp` varchar(80) NOT NULL DEFAULT '',
  `lastdata` varchar(80) NOT NULL DEFAULT '',
  `duration` int NOT NULL DEFAULT '0',
  `billsec` int NOT NULL DEFAULT '0',
  `disposition` varchar(45) NOT NULL DEFAULT '',
  `amaflags` int NOT NULL DEFAULT '0',
  `accountcode` varchar(20) NOT NULL DEFAULT '',
  `uniqueid` varchar(32) NOT NULL DEFAULT '',
  `userfield` varchar(255) NOT NULL DEFAULT '',
  KEY `uniqueid` (`uniqueid`),
  KEY `dst` (`dst`),
  KEY `channel` (`channel`,`accountcode`),
  KEY `calldate` (`calldate`),
  KEY `channel_2` (`channel`,`accountcode`),
  KEY `calldate_2` (`calldate`),
  KEY `disposition` (`disposition`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dnc_list`
--

DROP TABLE IF EXISTS `dnc_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dnc_list` (
  `phone` bigint NOT NULL,
  `addedby` varchar(50) NOT NULL,
  `requestedby` varchar(50) NOT NULL,
  `addeddate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`phone`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dnclist_ob`
--

DROP TABLE IF EXISTS `dnclist_ob`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dnclist_ob` (
  `id` int NOT NULL AUTO_INCREMENT,
  `phone` bigint NOT NULL,
  `addedby` varchar(50) NOT NULL,
  `requestedby` varchar(50) NOT NULL,
  `addeddate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4907 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `domain_info_master`
--

DROP TABLE IF EXISTS `domain_info_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `domain_info_master` (
  `id` int NOT NULL AUTO_INCREMENT,
  `instance` varchar(100) DEFAULT NULL,
  `domain` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `inCallLog`
--

DROP TABLE IF EXISTS `inCallLog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inCallLog` (
  `id` int NOT NULL AUTO_INCREMENT,
  `calltime` datetime NOT NULL,
  `answertime` varchar(50) DEFAULT NULL,
  `callid` varchar(50) NOT NULL,
  `matrixcallid` varchar(50) NOT NULL,
  `uid` varchar(50) NOT NULL,
  `agentid` varchar(50) NOT NULL,
  `leadid` bigint NOT NULL,
  `encphone` varchar(50) NOT NULL,
  `phone` bigint NOT NULL,
  `campaign` varchar(50) NOT NULL,
  `duration` int NOT NULL DEFAULT '0',
  `talktime` int NOT NULL DEFAULT '0',
  `hanguptime` datetime DEFAULT NULL,
  `disposition` varchar(100) NOT NULL DEFAULT '',
  `channel` varchar(255) DEFAULT '',
  `destchannel` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=422 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `obCallLog`
--

DROP TABLE IF EXISTS `obCallLog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `obCallLog` (
  `id` int NOT NULL AUTO_INCREMENT,
  `calltime` datetime NOT NULL,
  `answertime` varchar(50) DEFAULT NULL,
  `hanguptime` datetime DEFAULT NULL,
  `callid` varchar(50) NOT NULL,
  `matrixcallid` varchar(50) NOT NULL,
  `uid` varchar(50) NOT NULL,
  `agentid` varchar(50) NOT NULL,
  `leadid` bigint NOT NULL,
  `encphone` varchar(50) NOT NULL,
  `phone` bigint NOT NULL,
  `campaign` varchar(50) NOT NULL,
  `disposition` varchar(50) NOT NULL DEFAULT '',
  `duration` int NOT NULL DEFAULT '0',
  `talktime` int NOT NULL DEFAULT '0',
  `channel` varchar(255) DEFAULT NULL,
  `crm_uniq` varchar(255) DEFAULT NULL,
  `destchannel` varchar(255) DEFAULT NULL,
  `callstatus` varchar(255) DEFAULT '',
  `astcallid` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `calltime` (`calltime`),
  KEY `callid` (`callid`),
  KEY `leadid` (`leadid`),
  KEY `phone` (`phone`)
) ENGINE=MyISAM AUTO_INCREMENT=4977 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `queue_log_pro`
--

DROP TABLE IF EXISTS `queue_log_pro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `queue_log_pro` (
  `recid` int unsigned NOT NULL AUTO_INCREMENT,
  `origid` int unsigned NOT NULL,
  `callid` varchar(32) NOT NULL DEFAULT '',
  `queuename` varchar(32) NOT NULL DEFAULT '',
  `agentdev` varchar(32) NOT NULL,
  `agent` varchar(32) NOT NULL,
  `event` varchar(32) NOT NULL DEFAULT '',
  `data` varchar(128) NOT NULL,
  `data1` varchar(128) NOT NULL,
  `data2` varchar(128) NOT NULL,
  `data3` varchar(128) NOT NULL,
  `data4` varchar(128) NOT NULL,
  `data5` varchar(128) NOT NULL,
  `time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  KEY `data1` (`data1`),
  KEY `data2` (`data2`),
  KEY `data3` (`data3`),
  KEY `event` (`event`),
  KEY `queuename` (`queuename`),
  KEY `callid` (`callid`),
  KEY `agentdev` (`agentdev`),
  KEY `origid` (`origid`),
  KEY `recid` (`recid`),
  KEY `recid_2` (`recid`),
  KEY `time` (`time`)
) ENGINE=InnoDB AUTO_INCREMENT=2562 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `bi_queueEvents` BEFORE INSERT ON `queue_log_pro` FOR EACH ROW BEGIN
IF NEW.event = 'ADDMEMBER' THEN
INSERT INTO `agent_status` (agentId,agentStatus,timestamp,callid,queue) VALUES (NEW.agent,'LOGGEDIN',NOW(),NULL,NEW.queuename) ON DUPLICATE KEY UPDATE agentStatus = "LOGGEDIN", timestamp = NOW(), callid = NULL, queue=NEW.queuename;
ELSEIF NEW.event = 'REMOVEMEMBER' THEN
INSERT INTO `agent_status` (agentId,agentStatus,timestamp,callid,queue) VALUES (NEW.agent,'LOGGEDOUT',NOW(),NULL,NEW.queuename) ON DUPLICATE KEY UPDATE agentStatus = "LOGGEDOUT", timestamp = NOW(), callid = NULL, queue=NEW.queuename;
ELSEIF NEW.event = 'PAUSE' THEN
INSERT INTO agent_status (agentId,agentStatus,timestamp,callid,queue) VALUES (NEW.agent,'PAUSE',NOW(),NULL,NEW.queuename) ON DUPLICATE KEY UPDATE agentStatus = "PAUSE", timestamp = NOW(), callid = NULL, queue=NEW.queuename;
ELSEIF NEW.event = 'UNPAUSE' THEN
INSERT INTO `agent_status` (agentId,agentStatus,timestamp,callid,queue) VALUES (NEW.agent,'READY',NOW(),NULL,NEW.queuename) ON DUPLICATE KEY UPDATE agentStatus = "READY", timestamp = NOW(), callid = NULL, queue=NEW.queuename;
ELSEIF NEW.event = 'ENTERQUEUE' THEN
INSERT INTO `call_status` VALUES
(NEW.callid,New.data2,'inQue',NOW(),NEW.queuename,'','','','',0);
ELSEIF NEW.event = 'CONNECT' THEN
UPDATE `call_status` SET
callid = NEW.callid,
status = NEW.event,
timestamp = NOW(),
queue = NEW.queuename,
holdtime = New.data1
where callid = NEW.callid;
INSERT INTO agent_status (agentId,agentStatus,timestamp,callid,queue) VALUES
(NEW.agent,NEW.event,
NOW(),
NEW.callid,
NEW.queuename)
ON DUPLICATE KEY UPDATE
agentStatus = NEW.event,
timestamp = NOW(),
callid = NEW.callid,
queue=NEW.queuename;
ELSEIF NEW.event in ('COMPLETECALLER','COMPLETEAGENT') THEN
UPDATE `call_status` SET
callid = NEW.callid,
status = NEW.event,
timestamp = NOW(),
queue = NEW.queuename,
originalPosition = NEW.data3,
holdtime = NEW.data1,
callduration = NEW.data2
where callid = NEW.callid;
INSERT INTO agent_status (agentId,agentStatus,timestamp,callid,queue) VALUES (NEW.agent,NEW.event,NOW(),NULL,NEW.queuename) ON DUPLICATE KEY UPDATE agentStatus = "READY", timestamp = NOW(), callid = NULL, queue=NEW.queuename;
ELSEIF NEW.event in ('TRANSFER') THEN
UPDATE `call_status` SET
callid = NEW.callid,
status = NEW.event,
timestamp = NOW(),
queue = NEW.queuename,
holdtime = NEW.data1,
callduration = NEW.data2 
where callid = NEW.callid;
INSERT INTO agent_status (agentId,agentStatus,timestamp,callid,queue) VALUES
(NEW.agent,'READY',NOW(),NULL,NEW.queuename)
ON DUPLICATE KEY UPDATE
agentStatus = "READY",
timestamp = NOW(),
callid = NULL,
queue=NEW.queuename;
ELSEIF NEW.event in ('ABANDON','EXITEMPTY') THEN
UPDATE `call_status` SET
callid = NEW.callid,
status = NEW.event,
timestamp = NOW(),
queue = NEW.queuename,
position = NEW.data1,
originalPosition = NEw.data2,
holdtime = NEW.data3
where callid = NEW.callid;
ELSEIF NEW.event = 'EXITWITHTIMEOUT' THEN
UPDATE `call_status` SET
callid = NEW.callid,
status = NEW.event,
timestamp = NOW(),
queue = NEW.queuename,
position = New.data1
where callid = NEW.callid;

END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `queue_member_table`
--

DROP TABLE IF EXISTS `queue_member_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `queue_member_table` (
  `uniqueid` int unsigned NOT NULL AUTO_INCREMENT,
  `membername` varchar(40) DEFAULT NULL,
  `queue_name` varchar(128) DEFAULT NULL,
  `interface` varchar(128) DEFAULT NULL,
  `penalty` int DEFAULT NULL,
  `paused` int DEFAULT NULL,
  `user` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`uniqueid`),
  UNIQUE KEY `queue_interface` (`queue_name`,`interface`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `resqueuestatus_ob`
--

DROP TABLE IF EXISTS `resqueuestatus_ob`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resqueuestatus_ob` (
  `agentid` varchar(50) NOT NULL,
  `queue` varchar(100) DEFAULT NULL,
  `status` varchar(100) NOT NULL,
  `statustime` datetime DEFAULT NULL,
  PRIMARY KEY (`agentid`),
  UNIQUE KEY `agentid` (`agentid`),
  KEY `status` (`status`),
  KEY `statustime` (`statustime`),
  KEY `queue` (`queue`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `secure_user`
--

DROP TABLE IF EXISTS `secure_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `secure_user` (
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sip_buddies_webphone`
--

DROP TABLE IF EXISTS `sip_buddies_webphone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sip_buddies_webphone` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL DEFAULT '',
  `host` varchar(31) NOT NULL DEFAULT '',
  `nat` varchar(255) NOT NULL DEFAULT 'force_rport,comedia',
  `type` enum('user','peer','friend') NOT NULL DEFAULT 'peer',
  `accountcode` varchar(20) DEFAULT NULL,
  `amaflags` varchar(13) DEFAULT NULL,
  `call-limit` smallint unsigned DEFAULT NULL,
  `callgroup` varchar(10) DEFAULT NULL,
  `callerid` varchar(80) DEFAULT NULL,
  `cancallforward` char(3) DEFAULT 'yes',
  `canreinvite` char(3) DEFAULT 'yes',
  `context` varchar(80) DEFAULT NULL,
  `defaultip` varchar(45) DEFAULT NULL,
  `dtmfmode` varchar(255) NOT NULL DEFAULT 'auto',
  `fromuser` varchar(80) DEFAULT NULL,
  `fromdomain` varchar(80) DEFAULT NULL,
  `insecure` varchar(4) DEFAULT NULL,
  `language` char(2) DEFAULT NULL,
  `mailbox` varchar(50) DEFAULT NULL,
  `md5secret` varchar(80) DEFAULT NULL,
  `deny` varchar(95) DEFAULT NULL,
  `permit` varchar(95) DEFAULT NULL,
  `mask` varchar(95) DEFAULT NULL,
  `musiconhold` varchar(100) DEFAULT NULL,
  `pickupgroup` varchar(10) DEFAULT NULL,
  `qualify` char(3) DEFAULT 'yes',
  `regexten` varchar(80) DEFAULT NULL,
  `restrictcid` char(3) DEFAULT NULL,
  `rtpkeepalive` varchar(10) NOT NULL DEFAULT '30',
  `rtptimeout` char(3) DEFAULT '60',
  `rtpholdtimeout` char(3) DEFAULT '300',
  `secret` varchar(80) DEFAULT NULL,
  `setvar` varchar(100) DEFAULT NULL,
  `disallow` varchar(100) DEFAULT 'all',
  `allow` varchar(100) DEFAULT 'g729;ilbc;gsm;ulaw;alaw',
  `fullcontact` varchar(80) NOT NULL DEFAULT '',
  `ipaddr` varchar(45) NOT NULL DEFAULT '',
  `port` smallint unsigned NOT NULL DEFAULT '0',
  `regserver` varchar(100) DEFAULT NULL,
  `regseconds` int NOT NULL DEFAULT '0',
  `lastms` int NOT NULL DEFAULT '0',
  `username` varchar(80) NOT NULL DEFAULT '',
  `defaultuser` varchar(80) NOT NULL DEFAULT '',
  `subscribecontext` varchar(80) DEFAULT NULL,
  `useragent` varchar(255) DEFAULT NULL,
  `encryption` varchar(10) DEFAULT NULL,
  `avpf` varchar(10) DEFAULT NULL,
  `force_avp` varchar(10) DEFAULT NULL,
  `icesupport` varchar(10) DEFAULT NULL,
  `directmedia` varchar(50) DEFAULT 'yes',
  `dtlsenable` varchar(10) DEFAULT NULL,
  `dtlsverify` varchar(20) DEFAULT NULL,
  `dtlscertfile` varchar(50) DEFAULT NULL,
  `dtlscafile` varchar(50) DEFAULT NULL,
  `dtlssetup` varchar(10) DEFAULT NULL,
  `rtcp_mux` varchar(10) DEFAULT NULL,
  `callbackextension` varchar(50) DEFAULT NULL,
  `direct_media` varchar(50) DEFAULT 'yes',
  PRIMARY KEY (`id`),
  KEY `Ipaddress` (`ipaddr`,`port`),
  KEY `name` (`name`),
  KEY `username` (`username`),
  KEY `nat` (`nat`),
  KEY `host` (`host`)
) ENGINE=MyISAM AUTO_INCREMENT=52111 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-30 23:53:07

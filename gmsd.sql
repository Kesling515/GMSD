-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: localhost    Database: gmsd
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `announcement`
--

DROP TABLE IF EXISTS `announcement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `announcement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `announcer` varchar(50) COLLATE utf8_bin NOT NULL,
  `content` text COLLATE utf8_bin NOT NULL,
  `contime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcement`
--

LOCK TABLES `announcement` WRITE;
/*!40000 ALTER TABLE `announcement` DISABLE KEYS */;
INSERT INTO `announcement` VALUES (3,'admin','你好你好你好<img src=\"http://localhost:8080/GMSD/page/kindeditor-4.1.7/plugins/emoticons/images/0.gif\" alt=\"\" border=\"0\" /><br />','2019-06-21 23:27:33'),(7,'admin','你好呀，我很好，大家好！<br />','2019-06-21 23:32:28'),(13,'admin','夏天天气太热了，学校准备暑假期间进行空调安装，请暑假回家同学保管好宿舍的贵重物品<img src=\"http://localhost:8080/GMSD/page/kindeditor-4.1.7/plugins/emoticons/images/42.gif\" alt=\"\" border=\"0\" /><br />','2019-06-22 15:06:46');
/*!40000 ALTER TABLE `announcement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `helpyourself`
--

DROP TABLE IF EXISTS `helpyourself`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `helpyourself` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(300) DEFAULT NULL,
  `answer` varchar(300) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `helpyourself`
--

LOCK TABLES `helpyourself` WRITE;
/*!40000 ALTER TABLE `helpyourself` DISABLE KEYS */;
INSERT INTO `helpyourself` VALUES (1,'水龙头滴水','水龙头坏了','其他故障',1),(2,'宿舍内灯管不亮','灯管坏了；灯座坏了','电灯故障',0),(3,'热水器水流不稳定','热水器内有空气，请开开到最大放热水几分钟','热水器故障',0),(4,'马桶水箱不流水','可能桶内浮球脱落','其他故障',0),(5,'热水器漏电','关闭宿舍电源，联系工程部','其他故障',0),(6,'热水器喷热水','关闭水闸和电源，致电工程部','热水器故障',0);
/*!40000 ALTER TABLE `helpyourself` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `order_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fault_desc` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `indoor_time` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `address` varchar(50) COLLATE utf8_bin NOT NULL,
  `phone` varchar(11) COLLATE utf8_bin DEFAULT NULL,
  `repair_desc` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `comment` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_detail`
--

LOCK TABLES `order_detail` WRITE;
/*!40000 ALTER TABLE `order_detail` DISABLE KEYS */;
INSERT INTO `order_detail` VALUES (34,'222222','2222222','2222','12345678912',NULL,NULL,0),(35,'222222','2222222','2222','12345678912','屁事太多，没什么好修的',NULL,0),(36,'222222','2222222','2222','12345678912','完美',NULL,0),(37,'44444444','444444444','4444','12345698778','热水器老化，更换新的热水器','维修小哥太凶，差评',1),(38,'123','122313','222','12345678901','小哥我技术有限，无能为力，哈哈哈',NULL,0),(39,'1111111','1111111','1111','11111111111','什么乱七八糟的东西，看不懂，不会修','维修小哥实在太好了，五星好评',5),(40,'1111','1111111','8888','12345678901','热水器老化严重','很好',5),(41,'1111','1111','1111','12345678901',NULL,NULL,0),(42,'宿舍天花板滴水','晚上8点至12点','8848','12345678911','修好了修好了',NULL,0),(43,'宿舍厕所的们锁坏了','中午12点至下午2点','8848','12345678911','锁芯老化，已更换新门锁',NULL,0),(44,'热水器的热水阀滴水','早上10点至中午12点','8848','12345678911','阀门老化，已维修完成',NULL,0),(45,'宿舍太热，风扇太小','全天都在，除了饭点时间','8848','12345678911',NULL,NULL,0),(46,'阳台灯泡坏了','12：00 — 18：00','8412','12345678922','灯泡烧坏，已更换新电灯',NULL,0),(47,'马桶水箱坏了','20：00——22：00','8412','12345678922',NULL,NULL,0),(48,'阳台灯管闪烁，影响休息','早上均可','8412','12345678922',NULL,NULL,0),(49,'热水器水不热','全天都在','8412','12345678922','热水器热水温控按钮出错',NULL,0),(50,'热水器出现异响','下午两点至晚上8点','8412','12345678933',NULL,NULL,0),(51,'宿舍门上的窗子破了','早上7：00至中午12：00','8412','12345678933','风刮烂了',NULL,0),(52,'厕所排气扇坏了','中午12：00至晚上8：00','8412','12345678933',NULL,NULL,0),(53,'热水器坏了','全天均在','8848','12345678911','热水器阀门松了',NULL,0),(54,'门窗坏了','早上均在','8412','12345678999',NULL,NULL,0),(55,'灯管不亮了','下午两点至四点','8412','12345678999',NULL,NULL,0),(56,'shudfsdfsfs','123213132','8412','11111111111',NULL,NULL,0),(57,'热水器花了','早上都在','8412','12345678911',NULL,NULL,0),(58,'电灯花了','晚上','8412','12345678901',NULL,'很好',5);
/*!40000 ALTER TABLE `order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_main`
--

DROP TABLE IF EXISTS `order_main`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `order_main` (
  `order_no` varchar(60) COLLATE utf8_bin NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `creater_id` int(11) NOT NULL,
  `state` int(11) DEFAULT '1',
  `assign_time` datetime DEFAULT NULL,
  `repairer_id` int(11) DEFAULT NULL,
  `order_type` int(11) DEFAULT NULL,
  `detail_id` int(11) DEFAULT NULL,
  `finish_time` datetime DEFAULT NULL,
  PRIMARY KEY (`order_no`),
  UNIQUE KEY `detail_id_UNIQUE` (`detail_id`),
  KEY `FK_order_type_id_idx` (`order_type`) /*!80000 INVISIBLE */,
  KEY `FK_order_detail_id_idx` (`detail_id`),
  KEY `FK_creater_id_idx` (`creater_id`) /*!80000 INVISIBLE */,
  KEY `FK_repirer_id_idx` (`repairer_id`) /*!80000 INVISIBLE */,
  CONSTRAINT `FK_creater_id` FOREIGN KEY (`creater_id`) REFERENCES `user_info` (`id`),
  CONSTRAINT `FK_order_detail_id` FOREIGN KEY (`detail_id`) REFERENCES `order_detail` (`id`),
  CONSTRAINT `FK_order_type_id` FOREIGN KEY (`order_type`) REFERENCES `order_type` (`id`),
  CONSTRAINT `FK_repirer_id` FOREIGN KEY (`repairer_id`) REFERENCES `user_info` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_main`
--

LOCK TABLES `order_main` WRITE;
/*!40000 ALTER TABLE `order_main` DISABLE KEYS */;
INSERT INTO `order_main` VALUES ('No.201906170720392002','2019-06-17 00:00:00',1,5,NULL,NULL,3,34,NULL),('No.201906170724541891','2019-06-17 00:00:00',1,3,'2019-06-18 00:00:00',5,3,35,'2019-06-22 07:09:55'),('No.201906170728166266','2019-06-17 00:00:00',1,3,'2019-06-18 00:00:00',3,3,36,'2019-06-18 08:45:49'),('No.201906170749384261','2019-06-17 00:00:00',1,4,'2019-06-17 00:00:00',5,1,37,'2019-06-22 07:09:19'),('No.201906180321472338','2019-06-18 00:00:00',1,3,'2019-06-18 00:00:00',5,2,38,'2019-06-22 07:10:37'),('No.201906180334319525','2019-06-18 07:34:32',1,4,'2019-06-18 00:00:00',5,1,39,'2019-06-22 07:11:04'),('No.201906191250582584','2019-06-19 04:50:59',1,4,'2019-06-19 04:50:59',3,1,40,'2019-06-20 09:58:06'),('No.201906191251249351','2019-06-19 04:51:25',1,1,NULL,NULL,2,41,NULL),('No.201906220246197085','2019-06-22 06:46:20',14,3,'2019-06-23 12:10:50',3,3,42,'2019-06-23 12:12:30'),('No.201906220247108722','2019-06-22 06:47:11',14,3,'2019-06-22 07:04:38',25,2,43,'2019-06-22 07:44:17'),('No.201906220248074973','2019-06-22 06:48:07',14,3,'2019-06-22 06:48:07',5,1,44,'2019-06-22 07:41:53'),('No.201906220250518881','2019-06-22 06:50:52',14,1,NULL,NULL,3,45,NULL),('No.201906220252466785','2019-06-22 06:52:46',15,3,'2019-06-22 07:04:53',24,3,46,'2019-06-22 07:42:42'),('No.201906220253595228','2019-06-22 06:54:00',15,1,NULL,NULL,3,47,NULL),('No.201906220255189705','2019-06-22 06:55:19',15,1,NULL,NULL,3,48,NULL),('No.201906220255579744','2019-06-22 06:55:58',15,3,'2019-06-22 06:55:58',3,1,49,'2019-06-22 07:43:42'),('No.201906220257197472','2019-06-22 06:57:20',16,2,'2019-06-22 06:57:20',5,1,50,NULL),('No.201906220259483648','2019-06-22 06:59:48',16,3,'2019-06-23 12:11:08',26,2,51,'2019-06-23 12:11:52'),('No.201906220300528800','2019-06-22 07:00:52',16,2,'2019-06-22 07:04:29',5,3,52,NULL),('No.201906230807182416','2019-06-23 12:07:19',14,3,'2019-06-23 12:07:19',26,1,53,'2019-06-23 12:10:06'),('No.201906230808252664','2019-06-23 12:08:26',12,2,'2019-06-23 12:10:41',5,2,54,NULL),('No.201906230809104968','2019-06-23 12:09:11',12,1,NULL,NULL,3,55,NULL),('No.201906250841304545','2019-06-25 00:41:31',1,2,'2019-06-25 00:41:31',25,1,56,NULL),('No.201906270437127132','2019-06-27 08:37:12',1,2,'2019-06-27 08:37:12',24,1,57,NULL),('No.201906270441258044','2019-06-27 08:41:25',1,2,'2019-06-27 08:43:51',5,2,58,NULL);
/*!40000 ALTER TABLE `order_main` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_type`
--

DROP TABLE IF EXISTS `order_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `order_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `auto_dispat` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_type`
--

LOCK TABLES `order_type` WRITE;
/*!40000 ALTER TABLE `order_type` DISABLE KEYS */;
INSERT INTO `order_type` VALUES (1,'热水器故障',1),(2,'门窗锁',0),(3,'其他故障',0);
/*!40000 ALTER TABLE `order_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stat`
--

DROP TABLE IF EXISTS `stat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `stat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` int(11) DEFAULT NULL,
  `work_id` int(11) DEFAULT NULL,
  `date` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat`
--

LOCK TABLES `stat` WRITE;
/*!40000 ALTER TABLE `stat` DISABLE KEYS */;
INSERT INTO `stat` VALUES (5,0,3,'2019-06-19'),(6,0,5,'2019-06-19'),(7,1,3,'2019-06-20'),(8,0,5,'2019-06-20'),(9,1,3,'2019-06-17'),(10,0,3,'2019-06-21'),(11,0,5,'2019-06-21'),(12,0,24,'2019-06-21'),(13,0,25,'2019-06-21'),(14,0,26,'2019-06-21'),(15,5,5,'2019-06-22'),(16,1,25,'2019-06-22'),(17,1,24,'2019-06-22'),(18,1,3,'2019-06-22'),(19,0,26,'2019-06-22'),(20,1,3,'2019-06-23'),(21,2,26,'2019-06-23'),(22,0,5,'2019-06-23'),(23,0,24,'2019-06-23'),(24,0,25,'2019-06-23'),(25,0,3,'2019-06-24'),(26,0,5,'2019-06-24'),(27,0,24,'2019-06-24'),(28,0,25,'2019-06-24'),(29,0,26,'2019-06-24'),(30,0,3,'2019-06-26'),(31,0,5,'2019-06-26'),(32,0,24,'2019-06-26'),(33,0,25,'2019-06-26'),(34,0,26,'2019-06-26');
/*!40000 ALTER TABLE `stat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_info`
--

DROP TABLE IF EXISTS `user_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sex` int(11) DEFAULT NULL,
  `dorm` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `stuclass` varchar(80) COLLATE utf8_bin DEFAULT NULL,
  `phone` varchar(11) COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(20) COLLATE utf8_bin NOT NULL,
  `is_delete` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `FK_user_main_account_idx` (`user_id`),
  CONSTRAINT `FK_user_main_account` FOREIGN KEY (`user_id`) REFERENCES `user_main` (`account`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_info`
--

LOCK TABLES `user_info` WRITE;
/*!40000 ALTER TABLE `user_info` DISABLE KEYS */;
INSERT INTO `user_info` VALUES (1,1,'8412','计算机科学与技术16','15016136130','15016136130@163.com',1620502143,'林准升',1),(2,0,'工程部','无','12345678901','1123@qq.com',111,'admin',1),(3,0,'工程部','无','123456789','123@smms.com',222,'worker',1),(4,1,'8848','计算机科学与技术16','15016136130','15016136130@qq.com',333,'林霖',1),(5,0,'工程2部',NULL,'12345678900','1234@123.com',444,'李易峰',1),(6,0,NULL,NULL,NULL,NULL,666,'linlin',1),(7,0,NULL,NULL,NULL,NULL,777,'黄依依',1),(8,0,NULL,NULL,NULL,NULL,888,'王力宏',1),(9,0,NULL,NULL,NULL,NULL,999,'何炅',1),(10,0,NULL,NULL,NULL,NULL,1620502144,'杜海涛',1),(11,0,NULL,NULL,NULL,NULL,1620502145,'周杰伦',1),(12,0,NULL,NULL,NULL,NULL,1620502146,'林俊杰',1),(13,0,NULL,NULL,NULL,NULL,1620502147,'杨幂',1),(14,1,'8848','计算机科学与技术16','12345678911','123456789@qq.com',1620502101,'许嵩',1),(15,0,NULL,NULL,NULL,NULL,1620502102,'胡歌',1),(16,0,NULL,NULL,NULL,NULL,1620502103,'东方不败',1),(17,0,NULL,NULL,NULL,NULL,1620502104,'特洛伍德',1),(18,0,NULL,NULL,NULL,NULL,1620502107,'爱格妮斯',1),(19,0,NULL,NULL,NULL,NULL,1620502108,'特雷德尔',1),(20,0,NULL,NULL,NULL,NULL,1620502109,'令狐中',1),(21,0,NULL,NULL,NULL,NULL,1620502110,'佩格提',1),(22,0,NULL,NULL,NULL,NULL,1620502111,'狄克斯',1),(23,0,NULL,NULL,NULL,NULL,1620502112,'乔峰',1),(24,0,NULL,NULL,NULL,NULL,1111,'陈奕迅',1),(25,0,NULL,NULL,NULL,NULL,2222,'刘德华',1),(26,0,NULL,NULL,NULL,NULL,3333,'张无忌',1);
/*!40000 ALTER TABLE `user_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_main`
--

DROP TABLE IF EXISTS `user_main`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user_main` (
  `account` int(11) NOT NULL,
  `name` varchar(20) COLLATE utf8_bin NOT NULL,
  `password` varchar(20) COLLATE utf8_bin NOT NULL,
  `role_id` int(11) NOT NULL,
  `is_delete` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`account`),
  KEY `role_id_idx` (`role_id`),
  CONSTRAINT `role_id` FOREIGN KEY (`role_id`) REFERENCES `user_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_main`
--

LOCK TABLES `user_main` WRITE;
/*!40000 ALTER TABLE `user_main` DISABLE KEYS */;
INSERT INTO `user_main` VALUES (111,'admin','123',1,1),(222,'worker','123',2,1),(333,'林霖','123',3,1),(444,'李易峰','123',2,1),(666,'linlin','123',3,1),(777,'黄依依','123',1,1),(888,'王力宏','123',3,1),(999,'何炅','123',3,1),(1111,'陈奕迅','123',2,1),(2222,'刘德华','123',2,1),(3333,'张无忌','123',2,1),(1620502101,'许嵩','123',3,1),(1620502102,'胡歌','123',3,1),(1620502103,'东方不败','123',3,1),(1620502104,'特洛伍德','123',3,1),(1620502107,'爱格妮斯','123',3,1),(1620502108,'特雷德尔','123',3,1),(1620502109,'令狐中','123',3,1),(1620502110,'佩格提','123',3,1),(1620502111,'狄克斯','123',3,1),(1620502112,'乔峰','123',3,1),(1620502143,'林准升','123',3,1),(1620502144,'杜海涛','123',3,1),(1620502145,'周杰伦','123',3,1),(1620502146,'林俊杰','123',3,1),(1620502147,'杨幂','123',3,1);
/*!40000 ALTER TABLE `user_main` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (1,'管理员'),(2,'维修人员'),(3,'学生');
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-07-04 19:11:49

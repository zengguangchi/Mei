-- MySQL dump 10.13  Distrib 5.7.24, for Linux (x86_64)
--
-- Host: localhost    Database: mymlh
-- ------------------------------------------------------
-- Server version	5.7.24-0ubuntu0.16.04.1

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add user',2,'add_user'),(5,'Can change user',2,'change_user'),(6,'Can delete user',2,'delete_user'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add permission',4,'add_permission'),(11,'Can change permission',4,'change_permission'),(12,'Can delete permission',4,'delete_permission'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add lunbo',7,'add_lunbo'),(20,'Can change lunbo',7,'change_lunbo'),(21,'Can delete lunbo',7,'delete_lunbo'),(22,'Can add men',8,'add_men'),(23,'Can change men',8,'change_men'),(24,'Can delete men',8,'delete_men'),(25,'Can add user',9,'add_user'),(26,'Can change user',9,'change_user'),(27,'Can delete user',9,'delete_user'),(28,'Can add goods detailed',10,'add_goodsdetailed'),(29,'Can change goods detailed',10,'change_goodsdetailed'),(30,'Can delete goods detailed',10,'delete_goodsdetailed'),(31,'Can add cart',11,'add_cart'),(32,'Can change cart',11,'change_cart'),(33,'Can delete cart',11,'delete_cart');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(4,'auth','permission'),(2,'auth','user'),(5,'contenttypes','contenttype'),(11,'meilihuiapp','cart'),(10,'meilihuiapp','goodsdetailed'),(7,'meilihuiapp','lunbo'),(8,'meilihuiapp','men'),(9,'meilihuiapp','user'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2019-01-16 11:07:16.315350'),(2,'auth','0001_initial','2019-01-16 11:07:16.863869'),(3,'admin','0001_initial','2019-01-16 11:07:16.962755'),(4,'admin','0002_logentry_remove_auto_add','2019-01-16 11:07:16.989788'),(5,'contenttypes','0002_remove_content_type_name','2019-01-16 11:07:17.069853'),(6,'auth','0002_alter_permission_name_max_length','2019-01-16 11:07:17.109351'),(7,'auth','0003_alter_user_email_max_length','2019-01-16 11:07:17.185476'),(8,'auth','0004_alter_user_username_opts','2019-01-16 11:07:17.203983'),(9,'auth','0005_alter_user_last_login_null','2019-01-16 11:07:17.247283'),(10,'auth','0006_require_contenttypes_0002','2019-01-16 11:07:17.251615'),(11,'auth','0007_alter_validators_add_error_messages','2019-01-16 11:07:17.273465'),(12,'auth','0008_alter_user_username_max_length','2019-01-16 11:07:17.320388'),(13,'meilihuiapp','0001_initial','2019-01-16 11:07:17.412963'),(14,'sessions','0001_initial','2019-01-16 11:07:17.477077'),(16,'meilihuiapp','0002_cart','2019-01-17 09:54:33.549611');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('5h271p8tintq3n4al4p546qttb6nzken','MDkyN2NjNmI0NDkxOTcwNGVmNjk3MGRiOTQ3ZGE2ODdkMTdhNTUwNzp7InRva2VuIjoiMDllYmY4MjEyYzBiY2ZmYTU3OGJhZWQwNjU2MmU2ZmEifQ==','2019-01-31 13:52:47.795651'),('aserzqktsmcia72b4dsk165ygadn2965','OWJjMjI2ZWUxMzZiZGEwZThmZjc3MWM5MGQ3OThkOGY4ZmUwYjE3MTp7InRva2VuIjoiZjk0ZWJmODA2Mzg0NGI3NTBlOGJkNGYxZWYzOTkyNzAifQ==','2019-02-01 10:06:52.952483'),('tom8c119lpik079u80odm41int5vum7p','YTBkZjNjZmM4NTFmYTdjOTY5ZmQ5NTc5M2JhYjBmMGYxOGFiMTk1Nzp7InRva2VuIjoiYjk5YzY3NWFkODk2Yzc0ZjYzYTFkNmZkMjdkMjhiZDgifQ==','2019-02-01 08:36:26.675224');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meilihuiapp_cart`
--

DROP TABLE IF EXISTS `meilihuiapp_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meilihuiapp_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `isselect` tinyint(1) NOT NULL,
  `number` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `meilihuiapp_cart_goods_id_2b205c8f_fk_meilihuia` (`goods_id`),
  KEY `meilihuiapp_cart_user_id_de058f76_fk_meilihuiapp_user_id` (`user_id`),
  CONSTRAINT `meilihuiapp_cart_goods_id_2b205c8f_fk_meilihuia` FOREIGN KEY (`goods_id`) REFERENCES `meilihuiapp_goodsdetailed` (`id`),
  CONSTRAINT `meilihuiapp_cart_user_id_de058f76_fk_meilihuiapp_user_id` FOREIGN KEY (`user_id`) REFERENCES `meilihuiapp_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meilihuiapp_cart`
--

LOCK TABLES `meilihuiapp_cart` WRITE;
/*!40000 ALTER TABLE `meilihuiapp_cart` DISABLE KEYS */;
INSERT INTO `meilihuiapp_cart` VALUES (10,1,1,1,1);
/*!40000 ALTER TABLE `meilihuiapp_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meilihuiapp_goodsdetailed`
--

DROP TABLE IF EXISTS `meilihuiapp_goodsdetailed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meilihuiapp_goodsdetailed` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `img` varchar(100) NOT NULL,
  `pr1` varchar(50) NOT NULL,
  `span` varchar(20) NOT NULL,
  `span1` varchar(20) NOT NULL,
  `smallimg1` varchar(100) NOT NULL,
  `smallimg2` varchar(100) NOT NULL,
  `smallimg3` varchar(100) NOT NULL,
  `dis` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meilihuiapp_goodsdetailed`
--

LOCK TABLES `meilihuiapp_goodsdetailed` WRITE;
/*!40000 ALTER TABLE `meilihuiapp_goodsdetailed` DISABLE KEYS */;
INSERT INTO `meilihuiapp_goodsdetailed` VALUES (1,'深灰色青果领长袖外套','images1/KWD-244-00001a_480w-640h.jpg','KENT&CURWEN','3560','8900','images1/KWD-244-00001a_80w-107h.jpg','images1/KWD-244-00001b_80w-107h.jpg','images1/KWD-244-00001c_80w-107h.jpg','4'),(2,'灰色V领纽扣式针织开衫','images1/KWD-215-00045a_480w-640h.jpg','KENT&CURWEN','1560','3900','images1/KWD-215-00045a_80w-107h.jpg','images1/KWD-215-00045u_80w-107h.jpg','images1/KWD-215-00045w_80w-107h.jpg','4'),(3,'淡蓝色条纹长袖衬衫','images1/KWD-206-00011a_480w-640h.jpg','KENT&CURWEN','690','2300','images1/KWD-206-00011a_80w-107h.jpg','images1/KWD-206-00011u_80w-107h.jpg','images1/KWD-206-00011w_80w-107h.jpg','3'),(4,'灰色直筒长裤','images1/KWD-203-00003a_480w-640h.jpg','KENT&CURWEN','990','3300','images1/KWD-203-00003a_80w-107h.jpg','images1/KWD-203-00003u_80w-107h.jpg','images1/KWD-203-00003w_80w-107h.jpg','3'),(5,'蓝色格纹平驳领长袖外套','images1/KWD-244-00005a_480w-640h.jpg','KENT&CURWEN','3960','9900','images1/KWD-244-00005a_80w-107h.jpg','images1/KWD-244-00005b_80w-107h.jpg','images1/KWD-244-00005c_80w-107h.jpg','4');
/*!40000 ALTER TABLE `meilihuiapp_goodsdetailed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meilihuiapp_lunbo`
--

DROP TABLE IF EXISTS `meilihuiapp_lunbo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meilihuiapp_lunbo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meilihuiapp_lunbo`
--

LOCK TABLES `meilihuiapp_lunbo` WRITE;
/*!40000 ALTER TABLE `meilihuiapp_lunbo` DISABLE KEYS */;
INSERT INTO `meilihuiapp_lunbo` VALUES (1,'images/nav1.jpg'),(2,'images/nav2.jpg'),(3,'images/nav3.jpg'),(4,'images/nav4.jpg'),(5,'images/nav5.jpg');
/*!40000 ALTER TABLE `meilihuiapp_lunbo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meilihuiapp_men`
--

DROP TABLE IF EXISTS `meilihuiapp_men`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meilihuiapp_men` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menid` varchar(10) NOT NULL,
  `mai` varchar(20) NOT NULL,
  `img` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  `p1` varchar(50) NOT NULL,
  `span` varchar(100) NOT NULL,
  `span1` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meilihuiapp_men`
--

LOCK TABLES `meilihuiapp_men` WRITE;
/*!40000 ALTER TABLE `meilihuiapp_men` DISABLE KEYS */;
INSERT INTO `meilihuiapp_men` VALUES (1,'good1','买手推荐','images1/KWD-244-00001a.jpg','深灰色青果领长袖外套','KENT&CURWEN','3,560','8,900'),(2,'good2','买手推荐','images1/KWD-215-00045a.jpg','灰色V领纽扣式针织开衫','KENT&CURWEN','1,560','3,900'),(3,'good3','买手推荐','images1/KWD-206-00011a.jpg','淡蓝色条纹长袖衬衫','KENT&CURWEN','690','3300'),(4,'good4','买手推荐','images1/KWD-203-00003a.jpg','灰色直筒长裤','KENT&CURWEN','990','3300'),(5,'good5','买手推荐','images1/KWD-244-00005a.jpg','黑色全棉系带家居长裤','KENT&CURWEN/舒雅','110','199');
/*!40000 ALTER TABLE `meilihuiapp_men` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meilihuiapp_user`
--

DROP TABLE IF EXISTS `meilihuiapp_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meilihuiapp_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `passwrod` varchar(50) NOT NULL,
  `token` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meilihuiapp_user`
--

LOCK TABLES `meilihuiapp_user` WRITE;
/*!40000 ALTER TABLE `meilihuiapp_user` DISABLE KEYS */;
INSERT INTO `meilihuiapp_user` VALUES (1,'123@qq.com','13798888888','nanac','e10adc3949ba59abbe56e057f20f883e','f94ebf8063844b750e8bd4f1ef399270');
/*!40000 ALTER TABLE `meilihuiapp_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-01-18 20:32:11

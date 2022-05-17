-- MySQL dump 10.13  Distrib 8.0.25, for Linux (x86_64)
--
-- Host: csvu.mysql.pythonanywhere-services.com    Database: csvu$csvu_database
-- ------------------------------------------------------
-- Server version	5.7.34-log

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
-- Table structure for table `attendance_data`
--

DROP TABLE IF EXISTS `attendance_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attendance_data` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `scholar_no` varchar(15) NOT NULL,
  `course_code` varchar(11) NOT NULL,
  `classes_attended` int(5) NOT NULL,
  `classes_total` int(5) NOT NULL,
  `percentage` float NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance_data`
--

LOCK TABLES `attendance_data` WRITE;
/*!40000 ALTER TABLE `attendance_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `attendance_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (1,'Students'),(2,'Teachers');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (9,1,88),(1,2,9),(2,2,10),(3,2,11),(4,2,12),(5,2,13),(6,2,14),(7,2,15),(8,2,16);
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add attendance data',7,'add_attendancedata'),(26,'Can change attendance data',7,'change_attendancedata'),(27,'Can delete attendance data',7,'delete_attendancedata'),(28,'Can view attendance data',7,'view_attendancedata'),(29,'Can add auth group',8,'add_authgroup'),(30,'Can change auth group',8,'change_authgroup'),(31,'Can delete auth group',8,'delete_authgroup'),(32,'Can view auth group',8,'view_authgroup'),(33,'Can add auth group permissions',9,'add_authgrouppermissions'),(34,'Can change auth group permissions',9,'change_authgrouppermissions'),(35,'Can delete auth group permissions',9,'delete_authgrouppermissions'),(36,'Can view auth group permissions',9,'view_authgrouppermissions'),(37,'Can add auth permission',10,'add_authpermission'),(38,'Can change auth permission',10,'change_authpermission'),(39,'Can delete auth permission',10,'delete_authpermission'),(40,'Can view auth permission',10,'view_authpermission'),(41,'Can add auth user',11,'add_authuser'),(42,'Can change auth user',11,'change_authuser'),(43,'Can delete auth user',11,'delete_authuser'),(44,'Can view auth user',11,'view_authuser'),(45,'Can add auth user groups',12,'add_authusergroups'),(46,'Can change auth user groups',12,'change_authusergroups'),(47,'Can delete auth user groups',12,'delete_authusergroups'),(48,'Can view auth user groups',12,'view_authusergroups'),(49,'Can add auth user user permissions',13,'add_authuseruserpermissions'),(50,'Can change auth user user permissions',13,'change_authuseruserpermissions'),(51,'Can delete auth user user permissions',13,'delete_authuseruserpermissions'),(52,'Can view auth user user permissions',13,'view_authuseruserpermissions'),(53,'Can add courses',14,'add_courses'),(54,'Can change courses',14,'change_courses'),(55,'Can delete courses',14,'delete_courses'),(56,'Can view courses',14,'view_courses'),(57,'Can add department',15,'add_department'),(58,'Can change department',15,'change_department'),(59,'Can delete department',15,'delete_department'),(60,'Can view department',15,'view_department'),(61,'Can add django admin log',16,'add_djangoadminlog'),(62,'Can change django admin log',16,'change_djangoadminlog'),(63,'Can delete django admin log',16,'delete_djangoadminlog'),(64,'Can view django admin log',16,'view_djangoadminlog'),(65,'Can add django content type',17,'add_djangocontenttype'),(66,'Can change django content type',17,'change_djangocontenttype'),(67,'Can delete django content type',17,'delete_djangocontenttype'),(68,'Can view django content type',17,'view_djangocontenttype'),(69,'Can add django migrations',18,'add_djangomigrations'),(70,'Can change django migrations',18,'change_djangomigrations'),(71,'Can delete django migrations',18,'delete_djangomigrations'),(72,'Can view django migrations',18,'view_djangomigrations'),(73,'Can add django session',19,'add_djangosession'),(74,'Can change django session',19,'change_djangosession'),(75,'Can delete django session',19,'delete_djangosession'),(76,'Can view django session',19,'view_djangosession'),(77,'Can add grading scale',20,'add_gradingscale'),(78,'Can change grading scale',20,'change_gradingscale'),(79,'Can delete grading scale',20,'delete_gradingscale'),(80,'Can view grading scale',20,'view_gradingscale'),(81,'Can add semester session',21,'add_semestersession'),(82,'Can change semester session',21,'change_semestersession'),(83,'Can delete semester session',21,'delete_semestersession'),(84,'Can view semester session',21,'view_semestersession'),(85,'Can add students info',22,'add_studentsinfo'),(86,'Can change students info',22,'change_studentsinfo'),(87,'Can delete students info',22,'delete_studentsinfo'),(88,'Can view students info',22,'view_studentsinfo'),(89,'Can add teachers',23,'add_teachers'),(90,'Can change teachers',23,'change_teachers'),(91,'Can delete teachers',23,'delete_teachers'),(92,'Can view teachers',23,'view_teachers'),(93,'Can add auth group permission',24,'add_authgrouppermission'),(94,'Can change auth group permission',24,'change_authgrouppermission'),(95,'Can delete auth group permission',24,'delete_authgrouppermission'),(96,'Can view auth group permission',24,'view_authgrouppermission'),(97,'Can add auth user group',25,'add_authusergroup'),(98,'Can change auth user group',25,'change_authusergroup'),(99,'Can delete auth user group',25,'delete_authusergroup'),(100,'Can view auth user group',25,'view_authusergroup'),(101,'Can add auth user user permission',26,'add_authuseruserpermission'),(102,'Can change auth user user permission',26,'change_authuseruserpermission'),(103,'Can delete auth user user permission',26,'delete_authuseruserpermission'),(104,'Can view auth user user permission',26,'view_authuseruserpermission'),(105,'Can add course',27,'add_course'),(106,'Can change course',27,'change_course'),(107,'Can delete course',27,'delete_course'),(108,'Can view course',27,'view_course'),(109,'Can add django migration',28,'add_djangomigration'),(110,'Can change django migration',28,'change_djangomigration'),(111,'Can delete django migration',28,'delete_djangomigration'),(112,'Can view django migration',28,'view_djangomigration'),(113,'Can add teacher',29,'add_teacher'),(114,'Can change teacher',29,'change_teacher'),(115,'Can delete teacher',29,'delete_teacher'),(116,'Can view teacher',29,'view_teacher'),(117,'Can add student',30,'add_student'),(118,'Can change student',30,'change_student'),(119,'Can delete student',30,'delete_student'),(120,'Can view student',30,'view_student');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$320000$R4PD0Q3ngCEGwZrvEtlbsv$5i7XhtjjmljUUpNTBCyUHwA0YPYsoHKEuWMXLpMB3CA=','2022-05-17 01:20:12.884439',1,'admin','','','admin@email.com',1,1,'2022-05-15 10:38:00.416000'),(2,'pbkdf2_sha256$320000$sKfuRFsBgJjx6z3JNz8n8E$E4YjN81PBPh7+Qr4/zdVKR0kjVCXNoY2Ebuy/9o7FiI=','2022-05-16 01:17:19.000000',0,'teacher1','teacher1_first_name','teacher1_last_name','teacher1@email.com',1,1,'2022-05-15 23:39:12.000000'),(3,'pbkdf2_sha256$320000$jBuRa74zMbcWQuVqfz56VY$RB8B2RNnQ/KTnCWa0NAYtkqURLHIBWYnU6KY2KycW+c=','2022-05-16 08:22:39.780050',0,'student1','','','',1,1,'2022-05-16 08:21:30.000000');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
INSERT INTO `auth_user_groups` VALUES (1,2,2),(2,3,1);
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
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
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courses` (
  `course_id` int(255) NOT NULL AUTO_INCREMENT,
  `course_name` varchar(100) NOT NULL,
  `course_abbr` varchar(20) DEFAULT NULL,
  `course_department_id` int(200) NOT NULL,
  `course_credit` int(2) NOT NULL,
  PRIMARY KEY (`course_id`),
  UNIQUE KEY `course_name` (`course_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES (1,'Bachelor in Information Technology','',1,10);
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `dept_id` int(255) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`dept_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'Information Technology');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2022-05-15 23:36:27.675000','1','Students',1,'[{\"added\": {}}]',3,1),(2,'2022-05-15 23:39:12.519000','2','teacher1',1,'[{\"added\": {}}]',4,1),(3,'2022-05-15 23:45:20.319000','2','teacher1',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\"]}}]',4,1),(4,'2022-05-16 00:50:39.977000','2','teacher1',2,'[{\"changed\": {\"fields\": [\"Staff status\"]}}]',4,1),(5,'2022-05-16 03:46:27.457170','2','Teachers',1,'[{\"added\": {}}]',3,1),(6,'2022-05-16 03:46:47.104192','2','teacher1',2,'[{\"changed\": {\"fields\": [\"Groups\"]}}]',4,1),(7,'2022-05-16 08:20:26.584151','1','Students',2,'[{\"changed\": {\"fields\": [\"Permissions\"]}}]',3,1),(8,'2022-05-16 08:21:31.312034','3','student1',1,'[{\"added\": {}}]',4,1),(9,'2022-05-16 08:22:20.589328','3','student1',2,'[{\"changed\": {\"fields\": [\"Staff status\", \"Groups\"]}}]',4,1),(10,'2022-05-17 01:20:24.764349','1','Information Technology',1,'[{\"added\": {}}]',15,1),(11,'2022-05-17 01:21:34.741795','1','Course object (1)',1,'[{\"added\": {}}]',27,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(7,'fireapp','attendancedata'),(8,'fireapp','authgroup'),(24,'fireapp','authgrouppermission'),(9,'fireapp','authgrouppermissions'),(10,'fireapp','authpermission'),(11,'fireapp','authuser'),(25,'fireapp','authusergroup'),(12,'fireapp','authusergroups'),(26,'fireapp','authuseruserpermission'),(13,'fireapp','authuseruserpermissions'),(27,'fireapp','course'),(14,'fireapp','courses'),(15,'fireapp','department'),(16,'fireapp','djangoadminlog'),(17,'fireapp','djangocontenttype'),(28,'fireapp','djangomigration'),(18,'fireapp','djangomigrations'),(19,'fireapp','djangosession'),(20,'fireapp','gradingscale'),(21,'fireapp','semestersession'),(30,'fireapp','student'),(22,'fireapp','studentsinfo'),(29,'fireapp','teacher'),(23,'fireapp','teachers'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2022-05-16 03:41:26.371540'),(2,'auth','0001_initial','2022-05-16 03:41:27.187418'),(3,'admin','0001_initial','2022-05-16 03:41:27.455449'),(4,'admin','0002_logentry_remove_auto_add','2022-05-16 03:41:27.507506'),(5,'admin','0003_logentry_add_action_flag_choices','2022-05-16 03:41:27.543414'),(6,'contenttypes','0002_remove_content_type_name','2022-05-16 03:41:27.743346'),(7,'auth','0002_alter_permission_name_max_length','2022-05-16 03:41:27.868427'),(8,'auth','0003_alter_user_email_max_length','2022-05-16 03:41:27.967540'),(9,'auth','0004_alter_user_username_opts','2022-05-16 03:41:28.019331'),(10,'auth','0005_alter_user_last_login_null','2022-05-16 03:41:28.111448'),(11,'auth','0006_require_contenttypes_0002','2022-05-16 03:41:28.127321'),(12,'auth','0007_alter_validators_add_error_messages','2022-05-16 03:41:28.163324'),(13,'auth','0008_alter_user_username_max_length','2022-05-16 03:41:28.271466'),(14,'auth','0009_alter_user_last_name_max_length','2022-05-16 03:41:28.375394'),(15,'auth','0010_alter_group_name_max_length','2022-05-16 03:41:28.499605'),(16,'auth','0011_update_proxy_permissions','2022-05-16 03:41:28.583124'),(17,'auth','0012_alter_user_first_name_max_length','2022-05-16 03:41:28.819427'),(18,'sessions','0001_initial','2022-05-16 03:41:28.907401'),(19,'fireapp','0001_initial','2022-05-16 05:37:59.399386'),(20,'fireapp','0002_authgrouppermission_authusergroup_and_more','2022-05-16 06:41:05.659389'),(21,'fireapp','0003_delete_authgroup_delete_authgrouppermission_and_more','2022-05-16 06:48:50.169298'),(22,'fireapp','0004_student_delete_semestersession_delete_studentsinfo','2022-05-16 08:02:31.007387');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
INSERT INTO `django_session` VALUES ('92hyejj5pyr9tg6dtq80zwgw554hn512','.eJxVjEEOwiAQRe_C2pABOlpcuu8ZyAAzUjU0Ke3KeHfbpAvdvvf-f6tA61LC2ngOY1ZXZdTpl0VKT667yA-q90mnqS7zGPWe6MM2PUyZX7ej_Tso1Mq2FjEWDZIFb7K4KAzJojjK_iwx9tyJsNsoAThIHRL4HH0PckFEA-rzBQDHOE0:1nqDeh:5A-FO4NV3EtyvWtiCxz7Dvh_NTe62ZsgRTf_pmz6Dmo','2022-05-29 12:47:27.341000'),('l90p86m12fn41bt9y1pig4ka0jkis6vy','.eJxVjEEOwiAQRe_C2pABOlpcuu8ZyAAzUjU0Ke3KeHfbpAvdvvf-f6tA61LC2ngOY1ZXZdTpl0VKT667yA-q90mnqS7zGPWe6MM2PUyZX7ej_Tso1Mq2FjEWDZIFb7K4KAzJojjK_iwx9tyJsNsoAThIHRL4HH0PckFEA-rzBQDHOE0:1nqlsi:AtSMMQKnLHDn_TgnCrVNO5SBUakiOV1wDhLDO-118i0','2022-05-31 01:20:12.892858');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grading_scale`
--

DROP TABLE IF EXISTS `grading_scale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grading_scale` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `teacher_id` int(10) NOT NULL,
  `course_code` varchar(10) NOT NULL,
  `course_dep` int(11) NOT NULL,
  `gradescale` varchar(100) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grading_scale`
--

LOCK TABLES `grading_scale` WRITE;
/*!40000 ALTER TABLE `grading_scale` DISABLE KEYS */;
/*!40000 ALTER TABLE `grading_scale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `semester_session`
--

DROP TABLE IF EXISTS `semester_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `semester_session` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session` int(11) NOT NULL,
  `type` varchar(10) NOT NULL,
  `result_published` int(2) NOT NULL DEFAULT '0',
  `student_registration` int(2) NOT NULL DEFAULT '0' COMMENT '0 means resgistration is not goign and 1 means registration going on',
  `starting_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `semester_session`
--

LOCK TABLES `semester_session` WRITE;
/*!40000 ALTER TABLE `semester_session` DISABLE KEYS */;
INSERT INTO `semester_session` VALUES (1,2015,'even',0,0,'2014-12-31 18:30:00');
/*!40000 ALTER TABLE `semester_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students_info`
--

DROP TABLE IF EXISTS `students_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `scholar_no` varchar(15) NOT NULL,
  `name` varchar(100) NOT NULL,
  `gender` varchar(6) NOT NULL,
  `category` varchar(5) NOT NULL,
  `programme` varchar(100) NOT NULL,
  `department` int(3) NOT NULL,
  `semester` int(2) NOT NULL,
  `session` varchar(20) NOT NULL,
  `mobile` bigint(20) NOT NULL,
  `mobile_verified` int(2) NOT NULL DEFAULT '0',
  `parents_mobile` bigint(20) NOT NULL,
  `courses` varchar(100) NOT NULL,
  `courses_load` varchar(100) DEFAULT NULL,
  `spi` float DEFAULT NULL,
  `total_score` float DEFAULT NULL,
  `total_max_score` float DEFAULT NULL,
  `cpi` float DEFAULT NULL,
  `home_address` text NOT NULL,
  `hostel_address` text NOT NULL,
  `payment_verified` int(2) DEFAULT '1',
  `blocked` int(2) NOT NULL,
  `approved` int(2) NOT NULL,
  `biography` text NOT NULL,
  `published` int(2) NOT NULL DEFAULT '0',
  `cv_link` varchar(255) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students_info`
--

LOCK TABLES `students_info` WRITE;
/*!40000 ALTER TABLE `students_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `students_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teachers`
--

DROP TABLE IF EXISTS `teachers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teachers` (
  `teacher_id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `privilege` varchar(15) NOT NULL,
  `dept_id` int(2) DEFAULT NULL,
  `mobile` bigint(20) NOT NULL,
  `blocked` int(1) NOT NULL DEFAULT '0',
  `approved` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`teacher_id`),
  UNIQUE KEY `mobile` (`mobile`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=147 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teachers`
--

LOCK TABLES `teachers` WRITE;
/*!40000 ALTER TABLE `teachers` DISABLE KEYS */;
/*!40000 ALTER TABLE `teachers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-17  1:28:56

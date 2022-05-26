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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (2,'Students'),(1,'Teachers');
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
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,1,7),(8,1,8),(9,1,9),(10,1,10),(11,1,11),(12,1,12),(13,1,13),(14,1,14),(15,1,15),(16,1,16),(17,1,21),(18,1,22),(19,1,23),(20,1,24),(21,1,25),(22,1,26),(23,1,27),(24,1,28),(26,1,30),(27,1,31),(28,1,32),(30,2,2),(31,2,12),(32,2,16),(33,2,24),(34,2,30),(29,2,32);
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
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add custom user',1,'add_customuser'),(2,'Can change custom user',1,'change_customuser'),(3,'Can delete custom user',1,'delete_customuser'),(4,'Can view custom user',1,'view_customuser'),(5,'Can add department',2,'add_department'),(6,'Can change department',2,'change_department'),(7,'Can delete department',2,'delete_department'),(8,'Can view department',2,'view_department'),(9,'Can add section',3,'add_section'),(10,'Can change section',3,'change_section'),(11,'Can delete section',3,'delete_section'),(12,'Can view section',3,'view_section'),(13,'Can add subject',4,'add_subject'),(14,'Can change subject',4,'change_subject'),(15,'Can delete subject',4,'delete_subject'),(16,'Can view subject',4,'view_subject'),(17,'Can add teacher',5,'add_teacher'),(18,'Can change teacher',5,'change_teacher'),(19,'Can delete teacher',5,'delete_teacher'),(20,'Can view teacher',5,'view_teacher'),(21,'Can add course',6,'add_course'),(22,'Can change course',6,'change_course'),(23,'Can delete course',6,'delete_course'),(24,'Can view course',6,'view_course'),(25,'Can add attendance data',7,'add_attendancedata'),(26,'Can change attendance data',7,'change_attendancedata'),(27,'Can delete attendance data',7,'delete_attendancedata'),(28,'Can view attendance data',7,'view_attendancedata'),(29,'Can add student',8,'add_student'),(30,'Can change student',8,'change_student'),(31,'Can delete student',8,'delete_student'),(32,'Can view student',8,'view_student'),(33,'Can add log entry',9,'add_logentry'),(34,'Can change log entry',9,'change_logentry'),(35,'Can delete log entry',9,'delete_logentry'),(36,'Can view log entry',9,'view_logentry'),(37,'Can add permission',10,'add_permission'),(38,'Can change permission',10,'change_permission'),(39,'Can delete permission',10,'delete_permission'),(40,'Can view permission',10,'view_permission'),(41,'Can add group',11,'add_group'),(42,'Can change group',11,'change_group'),(43,'Can delete group',11,'delete_group'),(44,'Can view group',11,'view_group'),(45,'Can add content type',12,'add_contenttype'),(46,'Can change content type',12,'change_contenttype'),(47,'Can delete content type',12,'delete_contenttype'),(48,'Can view content type',12,'view_contenttype'),(49,'Can add session',13,'add_session'),(50,'Can change session',13,'change_session'),(51,'Can delete session',13,'delete_session'),(52,'Can view session',13,'view_session');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
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
  KEY `django_admin_log_user_id_c564eba6_fk_fireapp_customuser_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_fireapp_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `fireapp_customuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2022-05-25 13:07:51.477985','1','admin1@email.com',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\"]}}]',1,1),(2,'2022-05-25 14:55:06.203682','4','teacher1@email.com',1,'[{\"added\": {}}]',1,1),(3,'2022-05-25 15:48:42.937573','4','teacher1@email.com',2,'[{\"changed\": {\"fields\": [\"Middle name\"]}}]',1,1),(4,'2022-05-25 16:11:48.601511','1','Teachers',1,'[{\"added\": {}}]',11,1),(5,'2022-05-25 16:12:20.463508','4','teacher1@email.com',2,'[{\"changed\": {\"fields\": [\"Groups\"]}}]',1,1),(6,'2022-05-26 04:55:07.932171','1','Teachers',2,'[{\"changed\": {\"fields\": [\"Permissions\"]}}]',11,1),(7,'2022-05-26 06:01:12.593450','6','student1@email.com',1,'[{\"added\": {}}]',1,4),(8,'2022-05-26 08:24:47.417609','1','BSIT-2022A',1,'[{\"added\": {}}]',3,4),(9,'2022-05-26 08:32:09.535225','2','Students',1,'[{\"added\": {}}]',11,1),(10,'2022-05-26 08:33:04.172805','6','student1@email.com',2,'[{\"changed\": {\"fields\": [\"Groups\"]}}]',1,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (9,'admin','logentry'),(11,'auth','group'),(10,'auth','permission'),(12,'contenttypes','contenttype'),(7,'fireapp','attendancedata'),(6,'fireapp','course'),(1,'fireapp','customuser'),(2,'fireapp','department'),(3,'fireapp','section'),(8,'fireapp','student'),(4,'fireapp','subject'),(5,'fireapp','teacher'),(13,'sessions','session');
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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2022-05-25 08:33:20.866004'),(2,'contenttypes','0002_remove_content_type_name','2022-05-25 08:33:20.967997'),(3,'auth','0001_initial','2022-05-25 08:33:21.330972'),(4,'auth','0002_alter_permission_name_max_length','2022-05-25 08:33:21.413970'),(5,'auth','0003_alter_user_email_max_length','2022-05-25 08:33:21.430967'),(6,'auth','0004_alter_user_username_opts','2022-05-25 08:33:21.443966'),(7,'auth','0005_alter_user_last_login_null','2022-05-25 08:33:21.455965'),(8,'auth','0006_require_contenttypes_0002','2022-05-25 08:33:21.460966'),(9,'auth','0007_alter_validators_add_error_messages','2022-05-25 08:33:21.478964'),(10,'auth','0008_alter_user_username_max_length','2022-05-25 08:33:21.493965'),(11,'auth','0009_alter_user_last_name_max_length','2022-05-25 08:33:21.506966'),(12,'auth','0010_alter_group_name_max_length','2022-05-25 08:33:21.542962'),(13,'auth','0011_update_proxy_permissions','2022-05-25 08:33:21.555959'),(14,'auth','0012_alter_user_first_name_max_length','2022-05-25 08:33:21.568959'),(15,'fireapp','0001_initial','2022-05-25 08:33:22.935921'),(16,'admin','0001_initial','2022-05-25 08:33:23.128861'),(17,'admin','0002_logentry_remove_auto_add','2022-05-25 08:33:23.152858'),(18,'admin','0003_logentry_add_action_flag_choices','2022-05-25 08:33:23.175857'),(19,'sessions','0001_initial','2022-05-25 08:33:23.233852'),(20,'fireapp','0002_auto_20220526_0242','2022-05-26 02:42:26.260046'),(21,'fireapp','0003_auto_20220526_0556','2022-05-26 05:57:06.567819');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('clqr19ctvsfv6i7o9d0uajsrc3o9xh3k','.eJxVjMsOwiAQRf-FtSEwQIe4dO83kOExUjWQlHZl_Hdt0oVu7znnvkSgba1hG2UJcxZnocXpd4uUHqXtIN-p3bpMva3LHOWuyIMOee25PC-H-3dQadRvjaxtJmA7ITp0UFCBVk4BJ8PJMkZi8MoqA9Zkrz2A5mKScmZKEaJ4fwC_qjb4:1ntteh:uZF2TxlV9dFIyjXrXyQeP9jeyHk5WHZ3eZ3Mk30BgxA','2022-06-08 16:14:39.400779'),('jqfw55crk1uwfoke1j764j1w68sg2z32','.eJxVjEEOwiAQRe_C2hA6TFpw6d4zkGEYpGogKe3KeHdt0oVu_3vvv1SgbS1h67KEOamzQnX63SLxQ-oO0p3qrWludV3mqHdFH7Tra0vyvBzu30GhXr41EGQxbowQM9MoLgOnbBAHsDAZMuSQCB14jGidsR6HiSlZ8MBsWb0_7Ng3tQ:1nu8vq:Ct_hNo_K-0yLiO5pGwqdHOk2YGHsIwZPqNQJiNfFokk','2022-06-09 08:33:22.633379');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fireapp_attendancedata`
--

DROP TABLE IF EXISTS `fireapp_attendancedata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fireapp_attendancedata` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `classes_attended` int(11) NOT NULL,
  `classes_total` int(11) NOT NULL,
  `date` date NOT NULL,
  `section_id` bigint(20) NOT NULL,
  `subject_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fireapp_attendancedata_section_id_7480abb1_fk_fireapp_section_id` (`section_id`),
  KEY `fireapp_attendancedata_subject_id_a21d393f_fk_fireapp_subject_id` (`subject_id`),
  CONSTRAINT `fireapp_attendancedata_section_id_7480abb1_fk_fireapp_section_id` FOREIGN KEY (`section_id`) REFERENCES `fireapp_section` (`id`),
  CONSTRAINT `fireapp_attendancedata_subject_id_a21d393f_fk_fireapp_subject_id` FOREIGN KEY (`subject_id`) REFERENCES `fireapp_subject` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fireapp_attendancedata`
--

LOCK TABLES `fireapp_attendancedata` WRITE;
/*!40000 ALTER TABLE `fireapp_attendancedata` DISABLE KEYS */;
/*!40000 ALTER TABLE `fireapp_attendancedata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fireapp_course`
--

DROP TABLE IF EXISTS `fireapp_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fireapp_course` (
  `course_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `course_name` varchar(100) NOT NULL,
  `course_abbr` varchar(20) NOT NULL,
  `course_credit` smallint(5) unsigned NOT NULL,
  `course_department_id` bigint(20) NOT NULL,
  PRIMARY KEY (`course_id`),
  UNIQUE KEY `course_name` (`course_name`),
  KEY `fireapp_course_course_department_id_e4bf2b0e_fk_fireapp_d` (`course_department_id`),
  CONSTRAINT `fireapp_course_course_department_id_e4bf2b0e_fk_fireapp_d` FOREIGN KEY (`course_department_id`) REFERENCES `fireapp_department` (`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fireapp_course`
--

LOCK TABLES `fireapp_course` WRITE;
/*!40000 ALTER TABLE `fireapp_course` DISABLE KEYS */;
/*!40000 ALTER TABLE `fireapp_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fireapp_course_subjects`
--

DROP TABLE IF EXISTS `fireapp_course_subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fireapp_course_subjects` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `course_id` bigint(20) NOT NULL,
  `subject_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `fireapp_course_subjects_course_id_subject_id_019d7917_uniq` (`course_id`,`subject_id`),
  KEY `fireapp_course_subje_subject_id_4db571e7_fk_fireapp_s` (`subject_id`),
  CONSTRAINT `fireapp_course_subje_course_id_f6cc95d5_fk_fireapp_c` FOREIGN KEY (`course_id`) REFERENCES `fireapp_course` (`course_id`),
  CONSTRAINT `fireapp_course_subje_subject_id_4db571e7_fk_fireapp_s` FOREIGN KEY (`subject_id`) REFERENCES `fireapp_subject` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fireapp_course_subjects`
--

LOCK TABLES `fireapp_course_subjects` WRITE;
/*!40000 ALTER TABLE `fireapp_course_subjects` DISABLE KEYS */;
/*!40000 ALTER TABLE `fireapp_course_subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fireapp_customuser`
--

DROP TABLE IF EXISTS `fireapp_customuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fireapp_customuser` (
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `gender` varchar(1) NOT NULL,
  `birth_date` date NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `middle_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `user_type` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fireapp_customuser`
--

LOCK TABLES `fireapp_customuser` WRITE;
/*!40000 ALTER TABLE `fireapp_customuser` DISABLE KEYS */;
INSERT INTO `fireapp_customuser` VALUES ('pbkdf2_sha256$320000$VRy961i5YtSFLIs6uCKrfn$vkQ/1gb539PTguxd6GeBpPM1lxqCBWU79zeNe7Vzs2U=','2022-05-26 08:30:42.787287',1,1,'admin1@email.com',1,1,'2022-05-25 08:34:59.733792','M','2022-05-25','admin_firstname','','admin_lastname',1),('pbkdf2_sha256$320000$FTOFfQY7jm4B7zSgw8C1Cv$vnLX+KiOyfHJzyIr7JYQ7MDx9JMUNTBy/m7DEBzDAeQ=','2022-05-26 08:33:22.620946',0,4,'teacher1@email.com',1,1,'2022-05-25 14:54:48.935765','M','2022-05-25','teacher1_first_name','middle_name','teacher1_last_name',2),('pbkdf2_sha256$320000$xTC5jqn2nfw7QmNTpvtArR$L2AEpnsyUmszR66XkfPfqrSK5Uaw2B4OqdNKMPqcmac=','2022-05-26 07:56:15.114985',0,6,'student1@email.com',1,1,'2022-05-26 06:01:11.488591','M','2022-05-26','student1_first_name','','student1_last_name',3);
/*!40000 ALTER TABLE `fireapp_customuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fireapp_customuser_groups`
--

DROP TABLE IF EXISTS `fireapp_customuser_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fireapp_customuser_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `customuser_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `fireapp_customuser_groups_customuser_id_group_id_1ae19470_uniq` (`customuser_id`,`group_id`),
  KEY `fireapp_customuser_groups_group_id_9e124fbd_fk_auth_group_id` (`group_id`),
  CONSTRAINT `fireapp_customuser_g_customuser_id_4b1f54ba_fk_fireapp_c` FOREIGN KEY (`customuser_id`) REFERENCES `fireapp_customuser` (`id`),
  CONSTRAINT `fireapp_customuser_groups_group_id_9e124fbd_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fireapp_customuser_groups`
--

LOCK TABLES `fireapp_customuser_groups` WRITE;
/*!40000 ALTER TABLE `fireapp_customuser_groups` DISABLE KEYS */;
INSERT INTO `fireapp_customuser_groups` VALUES (1,4,1),(2,6,2);
/*!40000 ALTER TABLE `fireapp_customuser_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fireapp_customuser_user_permissions`
--

DROP TABLE IF EXISTS `fireapp_customuser_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fireapp_customuser_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `customuser_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `fireapp_customuser_user__customuser_id_permission_dcac8ce3_uniq` (`customuser_id`,`permission_id`),
  KEY `fireapp_customuser_u_permission_id_5a33335c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `fireapp_customuser_u_customuser_id_c2251b9f_fk_fireapp_c` FOREIGN KEY (`customuser_id`) REFERENCES `fireapp_customuser` (`id`),
  CONSTRAINT `fireapp_customuser_u_permission_id_5a33335c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fireapp_customuser_user_permissions`
--

LOCK TABLES `fireapp_customuser_user_permissions` WRITE;
/*!40000 ALTER TABLE `fireapp_customuser_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `fireapp_customuser_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fireapp_department`
--

DROP TABLE IF EXISTS `fireapp_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fireapp_department` (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`dept_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fireapp_department`
--

LOCK TABLES `fireapp_department` WRITE;
/*!40000 ALTER TABLE `fireapp_department` DISABLE KEYS */;
/*!40000 ALTER TABLE `fireapp_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fireapp_section`
--

DROP TABLE IF EXISTS `fireapp_section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fireapp_section` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `section_name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `section_name` (`section_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fireapp_section`
--

LOCK TABLES `fireapp_section` WRITE;
/*!40000 ALTER TABLE `fireapp_section` DISABLE KEYS */;
INSERT INTO `fireapp_section` VALUES (1,'BSIT-2022A');
/*!40000 ALTER TABLE `fireapp_section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fireapp_student`
--

DROP TABLE IF EXISTS `fireapp_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fireapp_student` (
  `user_id` int(11) NOT NULL,
  `scholar_no` varchar(15) NOT NULL,
  `mobile` bigint(20) unsigned NOT NULL,
  `parents_mobile` bigint(20) unsigned NOT NULL,
  `home_address` longtext NOT NULL,
  `section_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `scholar_no` (`scholar_no`),
  KEY `fireapp_student_section_id_5579869f_fk_fireapp_section_id` (`section_id`),
  CONSTRAINT `fireapp_student_section_id_5579869f_fk_fireapp_section_id` FOREIGN KEY (`section_id`) REFERENCES `fireapp_section` (`id`),
  CONSTRAINT `fireapp_student_user_id_615210c7_fk_fireapp_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `fireapp_customuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fireapp_student`
--

LOCK TABLES `fireapp_student` WRITE;
/*!40000 ALTER TABLE `fireapp_student` DISABLE KEYS */;
INSERT INTO `fireapp_student` VALUES (6,'',0,0,'',NULL);
/*!40000 ALTER TABLE `fireapp_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fireapp_subject`
--

DROP TABLE IF EXISTS `fireapp_subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fireapp_subject` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `subject_name` varchar(50) NOT NULL,
  `unit` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fireapp_subject`
--

LOCK TABLES `fireapp_subject` WRITE;
/*!40000 ALTER TABLE `fireapp_subject` DISABLE KEYS */;
/*!40000 ALTER TABLE `fireapp_subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fireapp_teacher`
--

DROP TABLE IF EXISTS `fireapp_teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fireapp_teacher` (
  `user_id` int(11) NOT NULL,
  `department_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `fireapp_teacher_department_id_7c40a0b5_fk_fireapp_d` (`department_id`),
  CONSTRAINT `fireapp_teacher_department_id_7c40a0b5_fk_fireapp_d` FOREIGN KEY (`department_id`) REFERENCES `fireapp_department` (`dept_id`),
  CONSTRAINT `fireapp_teacher_user_id_54f01d24_fk_fireapp_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `fireapp_customuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fireapp_teacher`
--

LOCK TABLES `fireapp_teacher` WRITE;
/*!40000 ALTER TABLE `fireapp_teacher` DISABLE KEYS */;
INSERT INTO `fireapp_teacher` VALUES (4,NULL);
/*!40000 ALTER TABLE `fireapp_teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fireapp_teacher_sections`
--

DROP TABLE IF EXISTS `fireapp_teacher_sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fireapp_teacher_sections` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `teacher_id` int(11) NOT NULL,
  `section_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `fireapp_teacher_sections_teacher_id_section_id_56ba47fb_uniq` (`teacher_id`,`section_id`),
  KEY `fireapp_teacher_sect_section_id_aa0bc64e_fk_fireapp_s` (`section_id`),
  CONSTRAINT `fireapp_teacher_sect_section_id_aa0bc64e_fk_fireapp_s` FOREIGN KEY (`section_id`) REFERENCES `fireapp_section` (`id`),
  CONSTRAINT `fireapp_teacher_sect_teacher_id_abd8255e_fk_fireapp_t` FOREIGN KEY (`teacher_id`) REFERENCES `fireapp_teacher` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fireapp_teacher_sections`
--

LOCK TABLES `fireapp_teacher_sections` WRITE;
/*!40000 ALTER TABLE `fireapp_teacher_sections` DISABLE KEYS */;
/*!40000 ALTER TABLE `fireapp_teacher_sections` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-26  9:13:10

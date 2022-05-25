-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 25, 2022 at 07:08 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `csvu$csvu_database`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_group`
--

INSERT INTO `auth_group` (`id`, `name`) VALUES
(1, 'Teachers');

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_group_permissions`
--

INSERT INTO `auth_group_permissions` (`id`, `group_id`, `permission_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6),
(7, 1, 7),
(8, 1, 8),
(9, 1, 9),
(10, 1, 10),
(11, 1, 11),
(12, 1, 12),
(13, 1, 13),
(14, 1, 14),
(15, 1, 15),
(16, 1, 16),
(17, 1, 21),
(18, 1, 22),
(19, 1, 23),
(20, 1, 24),
(21, 1, 25),
(22, 1, 26),
(23, 1, 27),
(24, 1, 28),
(25, 1, 29),
(26, 1, 30),
(27, 1, 31),
(28, 1, 32);

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add custom user', 1, 'add_customuser'),
(2, 'Can change custom user', 1, 'change_customuser'),
(3, 'Can delete custom user', 1, 'delete_customuser'),
(4, 'Can view custom user', 1, 'view_customuser'),
(5, 'Can add department', 2, 'add_department'),
(6, 'Can change department', 2, 'change_department'),
(7, 'Can delete department', 2, 'delete_department'),
(8, 'Can view department', 2, 'view_department'),
(9, 'Can add section', 3, 'add_section'),
(10, 'Can change section', 3, 'change_section'),
(11, 'Can delete section', 3, 'delete_section'),
(12, 'Can view section', 3, 'view_section'),
(13, 'Can add subject', 4, 'add_subject'),
(14, 'Can change subject', 4, 'change_subject'),
(15, 'Can delete subject', 4, 'delete_subject'),
(16, 'Can view subject', 4, 'view_subject'),
(17, 'Can add teacher', 5, 'add_teacher'),
(18, 'Can change teacher', 5, 'change_teacher'),
(19, 'Can delete teacher', 5, 'delete_teacher'),
(20, 'Can view teacher', 5, 'view_teacher'),
(21, 'Can add course', 6, 'add_course'),
(22, 'Can change course', 6, 'change_course'),
(23, 'Can delete course', 6, 'delete_course'),
(24, 'Can view course', 6, 'view_course'),
(25, 'Can add attendance data', 7, 'add_attendancedata'),
(26, 'Can change attendance data', 7, 'change_attendancedata'),
(27, 'Can delete attendance data', 7, 'delete_attendancedata'),
(28, 'Can view attendance data', 7, 'view_attendancedata'),
(29, 'Can add student', 8, 'add_student'),
(30, 'Can change student', 8, 'change_student'),
(31, 'Can delete student', 8, 'delete_student'),
(32, 'Can view student', 8, 'view_student'),
(33, 'Can add log entry', 9, 'add_logentry'),
(34, 'Can change log entry', 9, 'change_logentry'),
(35, 'Can delete log entry', 9, 'delete_logentry'),
(36, 'Can view log entry', 9, 'view_logentry'),
(37, 'Can add permission', 10, 'add_permission'),
(38, 'Can change permission', 10, 'change_permission'),
(39, 'Can delete permission', 10, 'delete_permission'),
(40, 'Can view permission', 10, 'view_permission'),
(41, 'Can add group', 11, 'add_group'),
(42, 'Can change group', 11, 'change_group'),
(43, 'Can delete group', 11, 'delete_group'),
(44, 'Can view group', 11, 'view_group'),
(45, 'Can add content type', 12, 'add_contenttype'),
(46, 'Can change content type', 12, 'change_contenttype'),
(47, 'Can delete content type', 12, 'delete_contenttype'),
(48, 'Can view content type', 12, 'view_contenttype'),
(49, 'Can add session', 13, 'add_session'),
(50, 'Can change session', 13, 'change_session'),
(51, 'Can delete session', 13, 'delete_session'),
(52, 'Can view session', 13, 'view_session');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2022-05-25 13:07:51.477985', '1', 'admin1@email.com', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\"]}}]', 1, 1),
(2, '2022-05-25 14:55:06.203682', '4', 'teacher1@email.com', 1, '[{\"added\": {}}]', 1, 1),
(3, '2022-05-25 15:48:42.937573', '4', 'teacher1@email.com', 2, '[{\"changed\": {\"fields\": [\"Middle name\"]}}]', 1, 1),
(4, '2022-05-25 16:11:48.601511', '1', 'Teachers', 1, '[{\"added\": {}}]', 11, 1),
(5, '2022-05-25 16:12:20.463508', '4', 'teacher1@email.com', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(9, 'admin', 'logentry'),
(11, 'auth', 'group'),
(10, 'auth', 'permission'),
(12, 'contenttypes', 'contenttype'),
(7, 'fireapp', 'attendancedata'),
(6, 'fireapp', 'course'),
(1, 'fireapp', 'customuser'),
(2, 'fireapp', 'department'),
(3, 'fireapp', 'section'),
(8, 'fireapp', 'student'),
(4, 'fireapp', 'subject'),
(5, 'fireapp', 'teacher'),
(13, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2022-05-25 08:33:20.866004'),
(2, 'contenttypes', '0002_remove_content_type_name', '2022-05-25 08:33:20.967997'),
(3, 'auth', '0001_initial', '2022-05-25 08:33:21.330972'),
(4, 'auth', '0002_alter_permission_name_max_length', '2022-05-25 08:33:21.413970'),
(5, 'auth', '0003_alter_user_email_max_length', '2022-05-25 08:33:21.430967'),
(6, 'auth', '0004_alter_user_username_opts', '2022-05-25 08:33:21.443966'),
(7, 'auth', '0005_alter_user_last_login_null', '2022-05-25 08:33:21.455965'),
(8, 'auth', '0006_require_contenttypes_0002', '2022-05-25 08:33:21.460966'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2022-05-25 08:33:21.478964'),
(10, 'auth', '0008_alter_user_username_max_length', '2022-05-25 08:33:21.493965'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2022-05-25 08:33:21.506966'),
(12, 'auth', '0010_alter_group_name_max_length', '2022-05-25 08:33:21.542962'),
(13, 'auth', '0011_update_proxy_permissions', '2022-05-25 08:33:21.555959'),
(14, 'auth', '0012_alter_user_first_name_max_length', '2022-05-25 08:33:21.568959'),
(15, 'fireapp', '0001_initial', '2022-05-25 08:33:22.935921'),
(16, 'admin', '0001_initial', '2022-05-25 08:33:23.128861'),
(17, 'admin', '0002_logentry_remove_auto_add', '2022-05-25 08:33:23.152858'),
(18, 'admin', '0003_logentry_add_action_flag_choices', '2022-05-25 08:33:23.175857'),
(19, 'sessions', '0001_initial', '2022-05-25 08:33:23.233852');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('clqr19ctvsfv6i7o9d0uajsrc3o9xh3k', '.eJxVjMsOwiAQRf-FtSEwQIe4dO83kOExUjWQlHZl_Hdt0oVu7znnvkSgba1hG2UJcxZnocXpd4uUHqXtIN-p3bpMva3LHOWuyIMOee25PC-H-3dQadRvjaxtJmA7ITp0UFCBVk4BJ8PJMkZi8MoqA9Zkrz2A5mKScmZKEaJ4fwC_qjb4:1ntteh:uZF2TxlV9dFIyjXrXyQeP9jeyHk5WHZ3eZ3Mk30BgxA', '2022-06-08 16:14:39.400779');

-- --------------------------------------------------------

--
-- Table structure for table `fireapp_attendancedata`
--

CREATE TABLE `fireapp_attendancedata` (
  `id` bigint(20) NOT NULL,
  `classes_attended` int(11) NOT NULL,
  `classes_total` int(11) NOT NULL,
  `date` date NOT NULL,
  `section_id` bigint(20) NOT NULL,
  `subject_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `fireapp_course`
--

CREATE TABLE `fireapp_course` (
  `course_id` bigint(20) NOT NULL,
  `course_name` varchar(100) NOT NULL,
  `course_abbr` varchar(20) NOT NULL,
  `course_credit` smallint(5) UNSIGNED NOT NULL CHECK (`course_credit` >= 0),
  `course_department_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `fireapp_course_subjects`
--

CREATE TABLE `fireapp_course_subjects` (
  `id` bigint(20) NOT NULL,
  `course_id` bigint(20) NOT NULL,
  `subject_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `fireapp_customuser`
--

CREATE TABLE `fireapp_customuser` (
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `id` int(11) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `gender` varchar(1) NOT NULL,
  `birth_date` date NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `middle_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `user_type` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `fireapp_customuser`
--

INSERT INTO `fireapp_customuser` (`password`, `last_login`, `is_superuser`, `id`, `email`, `is_staff`, `is_active`, `date_joined`, `gender`, `birth_date`, `first_name`, `middle_name`, `last_name`, `user_type`) VALUES
('pbkdf2_sha256$320000$VRy961i5YtSFLIs6uCKrfn$vkQ/1gb539PTguxd6GeBpPM1lxqCBWU79zeNe7Vzs2U=', '2022-05-25 16:14:39.395780', 1, 1, 'admin1@email.com', 1, 1, '2022-05-25 08:34:59.733792', 'M', '2022-05-25', 'admin_firstname', '', 'admin_lastname', '1'),
('pbkdf2_sha256$320000$FTOFfQY7jm4B7zSgw8C1Cv$vnLX+KiOyfHJzyIr7JYQ7MDx9JMUNTBy/m7DEBzDAeQ=', '2022-05-25 16:12:37.604431', 0, 4, 'teacher1@email.com', 1, 1, '2022-05-25 14:54:48.935765', 'M', '2022-05-25', 'teacher1_first_name', 'middle_name', 'teacher1_last_name', '2');

-- --------------------------------------------------------

--
-- Table structure for table `fireapp_customuser_groups`
--

CREATE TABLE `fireapp_customuser_groups` (
  `id` bigint(20) NOT NULL,
  `customuser_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `fireapp_customuser_groups`
--

INSERT INTO `fireapp_customuser_groups` (`id`, `customuser_id`, `group_id`) VALUES
(1, 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `fireapp_customuser_user_permissions`
--

CREATE TABLE `fireapp_customuser_user_permissions` (
  `id` bigint(20) NOT NULL,
  `customuser_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `fireapp_department`
--

CREATE TABLE `fireapp_department` (
  `dept_id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `fireapp_section`
--

CREATE TABLE `fireapp_section` (
  `id` bigint(20) NOT NULL,
  `section_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `fireapp_student`
--

CREATE TABLE `fireapp_student` (
  `user_id` int(11) NOT NULL,
  `scholar_no` varchar(15) NOT NULL,
  `mobile` bigint(20) UNSIGNED NOT NULL CHECK (`mobile` >= 0),
  `parents_mobile` bigint(20) UNSIGNED NOT NULL CHECK (`parents_mobile` >= 0),
  `home_address` longtext NOT NULL,
  `section_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `fireapp_subject`
--

CREATE TABLE `fireapp_subject` (
  `id` bigint(20) NOT NULL,
  `subject_name` varchar(50) NOT NULL,
  `unit` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `fireapp_teacher`
--

CREATE TABLE `fireapp_teacher` (
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `fireapp_teacher`
--

INSERT INTO `fireapp_teacher` (`user_id`) VALUES
(4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_fireapp_customuser_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `fireapp_attendancedata`
--
ALTER TABLE `fireapp_attendancedata`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fireapp_attendancedata_section_id_7480abb1_fk_fireapp_section_id` (`section_id`),
  ADD KEY `fireapp_attendancedata_subject_id_a21d393f_fk_fireapp_subject_id` (`subject_id`);

--
-- Indexes for table `fireapp_course`
--
ALTER TABLE `fireapp_course`
  ADD PRIMARY KEY (`course_id`),
  ADD UNIQUE KEY `course_name` (`course_name`),
  ADD KEY `fireapp_course_course_department_id_e4bf2b0e_fk_fireapp_d` (`course_department_id`);

--
-- Indexes for table `fireapp_course_subjects`
--
ALTER TABLE `fireapp_course_subjects`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `fireapp_course_subjects_course_id_subject_id_019d7917_uniq` (`course_id`,`subject_id`),
  ADD KEY `fireapp_course_subje_subject_id_4db571e7_fk_fireapp_s` (`subject_id`);

--
-- Indexes for table `fireapp_customuser`
--
ALTER TABLE `fireapp_customuser`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `fireapp_customuser_groups`
--
ALTER TABLE `fireapp_customuser_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `fireapp_customuser_groups_customuser_id_group_id_1ae19470_uniq` (`customuser_id`,`group_id`),
  ADD KEY `fireapp_customuser_groups_group_id_9e124fbd_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `fireapp_customuser_user_permissions`
--
ALTER TABLE `fireapp_customuser_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `fireapp_customuser_user__customuser_id_permission_dcac8ce3_uniq` (`customuser_id`,`permission_id`),
  ADD KEY `fireapp_customuser_u_permission_id_5a33335c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `fireapp_department`
--
ALTER TABLE `fireapp_department`
  ADD PRIMARY KEY (`dept_id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `fireapp_section`
--
ALTER TABLE `fireapp_section`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `section_name` (`section_name`);

--
-- Indexes for table `fireapp_student`
--
ALTER TABLE `fireapp_student`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `scholar_no` (`scholar_no`),
  ADD KEY `fireapp_student_section_id_5579869f_fk_fireapp_section_id` (`section_id`);

--
-- Indexes for table `fireapp_subject`
--
ALTER TABLE `fireapp_subject`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fireapp_teacher`
--
ALTER TABLE `fireapp_teacher`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `fireapp_attendancedata`
--
ALTER TABLE `fireapp_attendancedata`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fireapp_course`
--
ALTER TABLE `fireapp_course`
  MODIFY `course_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fireapp_course_subjects`
--
ALTER TABLE `fireapp_course_subjects`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fireapp_customuser`
--
ALTER TABLE `fireapp_customuser`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `fireapp_customuser_groups`
--
ALTER TABLE `fireapp_customuser_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `fireapp_customuser_user_permissions`
--
ALTER TABLE `fireapp_customuser_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fireapp_department`
--
ALTER TABLE `fireapp_department`
  MODIFY `dept_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fireapp_section`
--
ALTER TABLE `fireapp_section`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fireapp_subject`
--
ALTER TABLE `fireapp_subject`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_fireapp_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `fireapp_customuser` (`id`);

--
-- Constraints for table `fireapp_attendancedata`
--
ALTER TABLE `fireapp_attendancedata`
  ADD CONSTRAINT `fireapp_attendancedata_section_id_7480abb1_fk_fireapp_section_id` FOREIGN KEY (`section_id`) REFERENCES `fireapp_section` (`id`),
  ADD CONSTRAINT `fireapp_attendancedata_subject_id_a21d393f_fk_fireapp_subject_id` FOREIGN KEY (`subject_id`) REFERENCES `fireapp_subject` (`id`);

--
-- Constraints for table `fireapp_course`
--
ALTER TABLE `fireapp_course`
  ADD CONSTRAINT `fireapp_course_course_department_id_e4bf2b0e_fk_fireapp_d` FOREIGN KEY (`course_department_id`) REFERENCES `fireapp_department` (`dept_id`);

--
-- Constraints for table `fireapp_course_subjects`
--
ALTER TABLE `fireapp_course_subjects`
  ADD CONSTRAINT `fireapp_course_subje_course_id_f6cc95d5_fk_fireapp_c` FOREIGN KEY (`course_id`) REFERENCES `fireapp_course` (`course_id`),
  ADD CONSTRAINT `fireapp_course_subje_subject_id_4db571e7_fk_fireapp_s` FOREIGN KEY (`subject_id`) REFERENCES `fireapp_subject` (`id`);

--
-- Constraints for table `fireapp_customuser_groups`
--
ALTER TABLE `fireapp_customuser_groups`
  ADD CONSTRAINT `fireapp_customuser_g_customuser_id_4b1f54ba_fk_fireapp_c` FOREIGN KEY (`customuser_id`) REFERENCES `fireapp_customuser` (`id`),
  ADD CONSTRAINT `fireapp_customuser_groups_group_id_9e124fbd_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `fireapp_customuser_user_permissions`
--
ALTER TABLE `fireapp_customuser_user_permissions`
  ADD CONSTRAINT `fireapp_customuser_u_customuser_id_c2251b9f_fk_fireapp_c` FOREIGN KEY (`customuser_id`) REFERENCES `fireapp_customuser` (`id`),
  ADD CONSTRAINT `fireapp_customuser_u_permission_id_5a33335c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Constraints for table `fireapp_student`
--
ALTER TABLE `fireapp_student`
  ADD CONSTRAINT `fireapp_student_section_id_5579869f_fk_fireapp_section_id` FOREIGN KEY (`section_id`) REFERENCES `fireapp_section` (`id`),
  ADD CONSTRAINT `fireapp_student_user_id_615210c7_fk_fireapp_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `fireapp_customuser` (`id`);

--
-- Constraints for table `fireapp_teacher`
--
ALTER TABLE `fireapp_teacher`
  ADD CONSTRAINT `fireapp_teacher_user_id_54f01d24_fk_fireapp_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `fireapp_customuser` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

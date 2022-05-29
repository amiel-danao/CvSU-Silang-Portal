-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 29, 2022 at 06:11 PM
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
(2, 'Students'),
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
(36, 1, 1),
(1, 1, 2),
(2, 1, 4),
(3, 1, 5),
(4, 1, 6),
(5, 1, 7),
(6, 1, 8),
(7, 1, 9),
(8, 1, 10),
(9, 1, 11),
(10, 1, 12),
(11, 1, 13),
(12, 1, 14),
(13, 1, 15),
(14, 1, 16),
(15, 1, 17),
(16, 1, 18),
(17, 1, 19),
(18, 1, 20),
(19, 1, 21),
(20, 1, 22),
(21, 1, 23),
(22, 1, 24),
(23, 1, 25),
(24, 1, 26),
(25, 1, 27),
(26, 1, 28),
(49, 1, 30),
(27, 1, 32),
(28, 1, 33),
(29, 1, 34),
(30, 1, 35),
(31, 1, 36),
(32, 1, 37),
(33, 1, 38),
(34, 1, 39),
(35, 1, 40),
(46, 1, 61),
(47, 1, 62),
(48, 1, 63),
(45, 1, 64),
(43, 1, 65),
(37, 2, 2),
(38, 2, 4),
(40, 2, 12),
(41, 2, 24),
(39, 2, 36),
(44, 2, 64),
(42, 2, 66);

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
(1, 'Can add User', 1, 'add_customuser'),
(2, 'Can change User', 1, 'change_customuser'),
(3, 'Can delete User', 1, 'delete_customuser'),
(4, 'Can view User', 1, 'view_customuser'),
(5, 'Can add department', 2, 'add_department'),
(6, 'Can change department', 2, 'change_department'),
(7, 'Can delete department', 2, 'delete_department'),
(8, 'Can view department', 2, 'view_department'),
(9, 'Can add quiz data', 3, 'add_quizdata'),
(10, 'Can change quiz data', 3, 'change_quizdata'),
(11, 'Can delete quiz data', 3, 'delete_quizdata'),
(12, 'Can view quiz data', 3, 'view_quizdata'),
(13, 'Can add section', 4, 'add_section'),
(14, 'Can change section', 4, 'change_section'),
(15, 'Can delete section', 4, 'delete_section'),
(16, 'Can view section', 4, 'view_section'),
(17, 'Can add subject', 5, 'add_subject'),
(18, 'Can change subject', 5, 'change_subject'),
(19, 'Can delete subject', 5, 'delete_subject'),
(20, 'Can view subject', 5, 'view_subject'),
(21, 'Can add quiz', 6, 'add_quiz'),
(22, 'Can change quiz', 6, 'change_quiz'),
(23, 'Can delete quiz', 6, 'delete_quiz'),
(24, 'Can view quiz', 6, 'view_quiz'),
(25, 'Can add course', 7, 'add_course'),
(26, 'Can change course', 7, 'change_course'),
(27, 'Can delete course', 7, 'delete_course'),
(28, 'Can view course', 7, 'view_course'),
(29, 'Can add teacher', 8, 'add_teacher'),
(30, 'Can change teacher', 8, 'change_teacher'),
(31, 'Can delete teacher', 8, 'delete_teacher'),
(32, 'Can view teacher', 8, 'view_teacher'),
(33, 'Can add student', 9, 'add_student'),
(34, 'Can change student', 9, 'change_student'),
(35, 'Can delete student', 9, 'delete_student'),
(36, 'Can view student', 9, 'view_student'),
(37, 'Can add attendance data', 10, 'add_attendancedata'),
(38, 'Can change attendance data', 10, 'change_attendancedata'),
(39, 'Can delete attendance data', 10, 'delete_attendancedata'),
(40, 'Can view attendance data', 10, 'view_attendancedata'),
(41, 'Can add log entry', 11, 'add_logentry'),
(42, 'Can change log entry', 11, 'change_logentry'),
(43, 'Can delete log entry', 11, 'delete_logentry'),
(44, 'Can view log entry', 11, 'view_logentry'),
(45, 'Can add permission', 12, 'add_permission'),
(46, 'Can change permission', 12, 'change_permission'),
(47, 'Can delete permission', 12, 'delete_permission'),
(48, 'Can view permission', 12, 'view_permission'),
(49, 'Can add group', 13, 'add_group'),
(50, 'Can change group', 13, 'change_group'),
(51, 'Can delete group', 13, 'delete_group'),
(52, 'Can view group', 13, 'view_group'),
(53, 'Can add content type', 14, 'add_contenttype'),
(54, 'Can change content type', 14, 'change_contenttype'),
(55, 'Can delete content type', 14, 'delete_contenttype'),
(56, 'Can view content type', 14, 'view_contenttype'),
(57, 'Can add session', 15, 'add_session'),
(58, 'Can change session', 15, 'change_session'),
(59, 'Can delete session', 15, 'delete_session'),
(60, 'Can view session', 15, 'view_session'),
(61, 'Can add grade', 16, 'add_grade'),
(62, 'Can change grade', 16, 'change_grade'),
(63, 'Can delete grade', 16, 'delete_grade'),
(64, 'Can view grade', 16, 'view_grade'),
(65, 'Teacher account', 8, 'is_teacher'),
(66, 'Student account', 9, 'is_student');

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
(1, '2022-05-29 11:36:12.810724', '1', 'Teachers', 1, '[{\"added\": {}}]', 13, 1),
(2, '2022-05-29 11:36:46.063590', '3', 'teacher1@email.com', 1, '[{\"added\": {}}]', 1, 1),
(3, '2022-05-29 11:41:50.232611', '1', 'Teachers', 2, '[{\"changed\": {\"fields\": [\"Permissions\"]}}]', 13, 1),
(4, '2022-05-29 11:49:08.890868', '2', 'Students', 1, '[{\"added\": {}}]', 13, 1),
(5, '2022-05-29 11:53:36.257342', '4', 'student1@email.com', 1, '[{\"added\": {}}]', 1, 3),
(6, '2022-05-29 12:23:17.787590', '1', 'QuizData object (1)', 1, '[{\"added\": {}}]', 3, 3),
(7, '2022-05-29 12:45:37.057822', '1', 'Quiz object (1)', 1, '[{\"added\": {}}]', 6, 3),
(8, '2022-05-29 12:46:59.844398', '1', 'BSIT-2022A', 1, '[{\"added\": {}}]', 4, 3),
(9, '2022-05-29 12:47:11.134656', '2', 'BSCS-2022A', 1, '[{\"added\": {}}]', 4, 3),
(10, '2022-05-29 13:10:52.756491', '7', 'student2@email.com', 1, '[{\"added\": {}}]', 1, 3),
(11, '2022-05-29 13:22:47.377660', '7', 'student2_first_name student2_last_name', 2, '[{\"changed\": {\"fields\": [\"Scholar no\"]}}]', 9, 3),
(12, '2022-05-29 14:00:20.423007', '2', 'Students', 2, '[{\"changed\": {\"fields\": [\"Permissions\"]}}]', 13, 1),
(13, '2022-05-29 14:00:58.363526', '1', 'Teachers', 2, '[{\"changed\": {\"fields\": [\"Permissions\"]}}]', 13, 1),
(14, '2022-05-29 14:27:24.842551', '2', 'Students', 2, '[{\"changed\": {\"fields\": [\"Permissions\"]}}]', 13, 1),
(15, '2022-05-29 14:27:33.417989', '1', 'Teachers', 2, '[{\"changed\": {\"fields\": [\"Permissions\"]}}]', 13, 1),
(16, '2022-05-29 14:29:09.061727', '1', 'Math', 1, '[{\"added\": {}}]', 5, 3),
(17, '2022-05-29 14:29:11.178583', '1', 'Grade object (1)', 1, '[{\"added\": {}}]', 16, 3),
(18, '2022-05-29 15:03:24.607011', '1', 'Teachers', 2, '[{\"changed\": {\"fields\": [\"Permissions\"]}}]', 13, 1),
(19, '2022-05-29 15:03:44.729698', '3', 'teacher1_first_name teacher1_last_name', 2, '[{\"changed\": {\"fields\": [\"Sections\"]}}]', 8, 3),
(20, '2022-05-29 15:12:31.341180', '4', 'student1_first_name student1_last_name', 2, '[{\"changed\": {\"fields\": [\"Scholar no\", \"Section\"]}}]', 9, 3),
(21, '2022-05-29 15:33:37.343215', '7', 'student2_first_name student2_last_name', 2, '[{\"changed\": {\"fields\": [\"Section\"]}}]', 9, 3),
(22, '2022-05-29 15:39:59.954147', '1', 'Information Technology', 1, '[{\"added\": {}}]', 2, 3),
(23, '2022-05-29 15:40:15.107148', '3', 'teacher1_first_name teacher1_last_name', 2, '[{\"changed\": {\"fields\": [\"Department\", \"Subjects\"]}}]', 8, 3),
(24, '2022-05-29 16:10:03.126385', '3', 'teacher1_first_name teacher1_last_name', 2, '[{\"changed\": {\"fields\": [\"Teacher id\"]}}]', 8, 3);

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
(11, 'admin', 'logentry'),
(13, 'auth', 'group'),
(12, 'auth', 'permission'),
(14, 'contenttypes', 'contenttype'),
(10, 'fireapp', 'attendancedata'),
(7, 'fireapp', 'course'),
(1, 'fireapp', 'customuser'),
(2, 'fireapp', 'department'),
(16, 'fireapp', 'grade'),
(6, 'fireapp', 'quiz'),
(3, 'fireapp', 'quizdata'),
(4, 'fireapp', 'section'),
(9, 'fireapp', 'student'),
(5, 'fireapp', 'subject'),
(8, 'fireapp', 'teacher'),
(15, 'sessions', 'session');

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
(1, 'contenttypes', '0001_initial', '2022-05-29 11:30:21.367759'),
(2, 'contenttypes', '0002_remove_content_type_name', '2022-05-29 11:30:21.708738'),
(3, 'auth', '0001_initial', '2022-05-29 11:30:22.297696'),
(4, 'auth', '0002_alter_permission_name_max_length', '2022-05-29 11:30:22.425686'),
(5, 'auth', '0003_alter_user_email_max_length', '2022-05-29 11:30:22.450686'),
(6, 'auth', '0004_alter_user_username_opts', '2022-05-29 11:30:22.482683'),
(7, 'auth', '0005_alter_user_last_login_null', '2022-05-29 11:30:22.510682'),
(8, 'auth', '0006_require_contenttypes_0002', '2022-05-29 11:30:22.518687'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2022-05-29 11:30:22.541681'),
(10, 'auth', '0008_alter_user_username_max_length', '2022-05-29 11:30:22.569681'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2022-05-29 11:30:22.593681'),
(12, 'auth', '0010_alter_group_name_max_length', '2022-05-29 11:30:22.654673'),
(13, 'auth', '0011_update_proxy_permissions', '2022-05-29 11:30:22.684673'),
(14, 'auth', '0012_alter_user_first_name_max_length', '2022-05-29 11:30:22.712676'),
(15, 'fireapp', '0001_initial', '2022-05-29 11:30:25.816471'),
(16, 'admin', '0001_initial', '2022-05-29 11:30:26.099452'),
(17, 'admin', '0002_logentry_remove_auto_add', '2022-05-29 11:30:26.134443'),
(18, 'admin', '0003_logentry_add_action_flag_choices', '2022-05-29 11:30:26.179440'),
(19, 'sessions', '0001_initial', '2022-05-29 11:30:26.287438'),
(20, 'fireapp', '0002_student_current_semester_student_current_year', '2022-05-29 13:33:06.370093'),
(21, 'fireapp', '0003_alter_student_current_semester_and_more', '2022-05-29 13:52:57.061064'),
(22, 'fireapp', '0004_alter_student_options_alter_teacher_options', '2022-05-29 13:57:23.664590'),
(23, 'fireapp', '0005_grade_grade', '2022-05-29 14:11:45.050140'),
(24, 'fireapp', '0006_student_course', '2022-05-29 14:57:04.950909');

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
('foxq3zngs9h9jezw09npqk28b5ye1k4f', '.eJxVjDsOwjAQBe_iGlmO_6ak5wzWrneDA8iR4qRC3B0ipYD2zcx7iQzbWvPWeckTibMw4vS7IZQHtx3QHdptlmVu6zKh3BV50C6vM_Hzcrh_BxV6_dZF--QjJxOCBbAYvR61GhNyIW3IKo_orGNSgRTbpAaMYAAGQO0COvH-AOAmN_Y:1nvLPp:cTkyxQyNYc3cc201tHoWixcRtQG6AStOeshm670xi0c', '2022-06-12 16:05:17.351113');

-- --------------------------------------------------------

--
-- Table structure for table `fireapp_attendancedata`
--

CREATE TABLE `fireapp_attendancedata` (
  `id` bigint(20) NOT NULL,
  `date` date NOT NULL,
  `section_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `fireapp_attendancedata_students_attended`
--

CREATE TABLE `fireapp_attendancedata_students_attended` (
  `id` bigint(20) NOT NULL,
  `attendancedata_id` bigint(20) NOT NULL,
  `student_id` int(11) NOT NULL
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
  `course_department_id` bigint(20) DEFAULT NULL
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
  `user_type` smallint(5) UNSIGNED NOT NULL CHECK (`user_type` >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `fireapp_customuser`
--

INSERT INTO `fireapp_customuser` (`password`, `last_login`, `is_superuser`, `id`, `email`, `is_staff`, `is_active`, `date_joined`, `gender`, `birth_date`, `first_name`, `middle_name`, `last_name`, `user_type`) VALUES
('pbkdf2_sha256$320000$8Jd8RPite8h8oQ2g1mcBvq$YDa8eCU4JFOYHSMAAxzZ3b1OW5Imp40L9IrzIe7yKW4=', '2022-05-29 16:04:31.985085', 1, 1, 'admin1@email.com', 1, 1, '2022-05-29 11:31:17.539075', 'M', '2022-05-29', '', '', '', 1),
('pbkdf2_sha256$320000$5mcCLP8KuvVQRAlOa4rEeu$fu242xLnhRvdX1C+aHfTJjdrLq+cDo2z3Rr2aiALlOA=', '2022-05-29 16:05:17.337162', 0, 3, 'teacher1@email.com', 1, 1, '2022-05-29 11:36:45.413588', 'M', '2022-05-29', 'teacher1_first_name', '', 'teacher1_last_name', 2),
('pbkdf2_sha256$320000$euAf0Ath0xfNUQY3jysyIG$NBjSggIuCiJpLRfKm7Tv3qxYXVaX386s16oyu3J+xm4=', '2022-05-29 14:33:39.985965', 0, 4, 'student1@email.com', 1, 1, '2022-05-29 11:53:35.712378', 'M', '2022-05-29', 'student1_first_name', '', 'student1_last_name', 3),
('pbkdf2_sha256$320000$xCxt4ReMRUrgnZNhAptOwh$W0VEkSbl3JFxOxgq5IJlNdMYcQGMZZp7LXVSOotgnLo=', NULL, 0, 7, 'student2@email.com', 1, 1, '2022-05-29 13:10:51.877549', 'M', '2022-05-29', 'student2_first_name', '', 'student2_last_name', 3);

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
(1, 3, 1),
(2, 4, 2),
(3, 7, 2);

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

--
-- Dumping data for table `fireapp_department`
--

INSERT INTO `fireapp_department` (`dept_id`, `name`) VALUES
(1, 'Information Technology');

-- --------------------------------------------------------

--
-- Table structure for table `fireapp_grade`
--

CREATE TABLE `fireapp_grade` (
  `id` bigint(20) NOT NULL,
  `student_year` smallint(5) UNSIGNED NOT NULL CHECK (`student_year` >= 0),
  `student_semester` smallint(5) UNSIGNED NOT NULL CHECK (`student_semester` >= 0),
  `student_id` int(11) DEFAULT NULL,
  `subject_id` bigint(20) DEFAULT NULL,
  `grade` smallint(5) UNSIGNED NOT NULL CHECK (`grade` >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `fireapp_grade`
--

INSERT INTO `fireapp_grade` (`id`, `student_year`, `student_semester`, `student_id`, `subject_id`, `grade`) VALUES
(1, 1, 1, 4, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `fireapp_quiz`
--

CREATE TABLE `fireapp_quiz` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_score` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `fireapp_quiz`
--

INSERT INTO `fireapp_quiz` (`id`, `name`, `total_score`) VALUES
(1, 'quiz1-BSIT-2022A', 100);

-- --------------------------------------------------------

--
-- Table structure for table `fireapp_quizdata`
--

CREATE TABLE `fireapp_quizdata` (
  `id` bigint(20) NOT NULL,
  `score` int(11) NOT NULL,
  `date_taken` datetime(6) NOT NULL,
  `student_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `fireapp_quizdata`
--

INSERT INTO `fireapp_quizdata` (`id`, `score`, `date_taken`, `student_id`) VALUES
(1, 85, '2022-05-29 12:23:16.000000', 4);

-- --------------------------------------------------------

--
-- Table structure for table `fireapp_quiz_quiz_datas`
--

CREATE TABLE `fireapp_quiz_quiz_datas` (
  `id` bigint(20) NOT NULL,
  `quiz_id` bigint(20) NOT NULL,
  `quizdata_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `fireapp_quiz_quiz_datas`
--

INSERT INTO `fireapp_quiz_quiz_datas` (`id`, `quiz_id`, `quizdata_id`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `fireapp_section`
--

CREATE TABLE `fireapp_section` (
  `id` bigint(20) NOT NULL,
  `section_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `fireapp_section`
--

INSERT INTO `fireapp_section` (`id`, `section_name`) VALUES
(2, 'BSCS-2022A'),
(1, 'BSIT-2022A');

-- --------------------------------------------------------

--
-- Table structure for table `fireapp_student`
--

CREATE TABLE `fireapp_student` (
  `user_id` int(11) NOT NULL,
  `scholar_no` varchar(15) NOT NULL,
  `date_enrolled` date NOT NULL,
  `mobile` bigint(20) UNSIGNED NOT NULL CHECK (`mobile` >= 0),
  `parents_mobile` bigint(20) UNSIGNED NOT NULL CHECK (`parents_mobile` >= 0),
  `home_address` longtext NOT NULL,
  `section_id` bigint(20) DEFAULT NULL,
  `current_semester` smallint(5) UNSIGNED NOT NULL,
  `current_year` smallint(5) UNSIGNED NOT NULL,
  `course_id` bigint(20) DEFAULT NULL
) ;

--
-- Dumping data for table `fireapp_student`
--

INSERT INTO `fireapp_student` (`user_id`, `scholar_no`, `date_enrolled`, `mobile`, `parents_mobile`, `home_address`, `section_id`, `current_semester`, `current_year`, `course_id`) VALUES
(4, '2022-00004', '2022-05-29', 0, 0, '', 2, 1, 1, NULL),
(7, '2022-00007', '2022-05-29', 0, 0, '', 2, 1, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `fireapp_subject`
--

CREATE TABLE `fireapp_subject` (
  `id` bigint(20) NOT NULL,
  `subject_name` varchar(50) NOT NULL,
  `unit` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `fireapp_subject`
--

INSERT INTO `fireapp_subject` (`id`, `subject_name`, `unit`) VALUES
(1, 'Math', 1);

-- --------------------------------------------------------

--
-- Table structure for table `fireapp_teacher`
--

CREATE TABLE `fireapp_teacher` (
  `user_id` int(11) NOT NULL,
  `teacher_id` varchar(40) DEFAULT NULL,
  `department_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `fireapp_teacher`
--

INSERT INTO `fireapp_teacher` (`user_id`, `teacher_id`, `department_id`) VALUES
(3, '2022-E0003', 1);

-- --------------------------------------------------------

--
-- Table structure for table `fireapp_teacher_sections`
--

CREATE TABLE `fireapp_teacher_sections` (
  `id` bigint(20) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `section_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `fireapp_teacher_sections`
--

INSERT INTO `fireapp_teacher_sections` (`id`, `teacher_id`, `section_id`) VALUES
(1, 3, 1),
(2, 3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `fireapp_teacher_subjects`
--

CREATE TABLE `fireapp_teacher_subjects` (
  `id` bigint(20) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `subject_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `fireapp_teacher_subjects`
--

INSERT INTO `fireapp_teacher_subjects` (`id`, `teacher_id`, `subject_id`) VALUES
(1, 3, 1);

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
  ADD UNIQUE KEY `fireapp_attendancedata_date_section_id_084bb0aa_uniq` (`date`,`section_id`),
  ADD KEY `fireapp_attendancedata_section_id_7480abb1_fk_fireapp_section_id` (`section_id`);

--
-- Indexes for table `fireapp_attendancedata_students_attended`
--
ALTER TABLE `fireapp_attendancedata_students_attended`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `fireapp_attendancedata_s_attendancedata_id_studen_d7ae4834_uniq` (`attendancedata_id`,`student_id`),
  ADD KEY `fireapp_attendanceda_student_id_7d42195a_fk_fireapp_s` (`student_id`);

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
-- Indexes for table `fireapp_grade`
--
ALTER TABLE `fireapp_grade`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `fireapp_grade_student_id_subject_id_st_6d784ffe_uniq` (`student_id`,`subject_id`,`student_year`,`student_semester`),
  ADD KEY `fireapp_grade_subject_id_0eb98b65_fk_fireapp_subject_id` (`subject_id`);

--
-- Indexes for table `fireapp_quiz`
--
ALTER TABLE `fireapp_quiz`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `fireapp_quizdata`
--
ALTER TABLE `fireapp_quizdata`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fireapp_quizdata_student_id_a060b4b1_fk_fireapp_student_user_id` (`student_id`);

--
-- Indexes for table `fireapp_quiz_quiz_datas`
--
ALTER TABLE `fireapp_quiz_quiz_datas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `fireapp_quiz_quiz_datas_quiz_id_quizdata_id_a6019d23_uniq` (`quiz_id`,`quizdata_id`),
  ADD KEY `fireapp_quiz_quiz_da_quizdata_id_7b135c88_fk_fireapp_q` (`quizdata_id`);

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
  ADD KEY `fireapp_student_section_id_5579869f_fk_fireapp_section_id` (`section_id`),
  ADD KEY `fireapp_student_course_id_eea51b75_fk_fireapp_course_course_id` (`course_id`);

--
-- Indexes for table `fireapp_subject`
--
ALTER TABLE `fireapp_subject`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fireapp_teacher`
--
ALTER TABLE `fireapp_teacher`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `teacher_id` (`teacher_id`),
  ADD KEY `fireapp_teacher_department_id_7c40a0b5_fk_fireapp_d` (`department_id`);

--
-- Indexes for table `fireapp_teacher_sections`
--
ALTER TABLE `fireapp_teacher_sections`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `fireapp_teacher_sections_teacher_id_section_id_56ba47fb_uniq` (`teacher_id`,`section_id`),
  ADD KEY `fireapp_teacher_sect_section_id_aa0bc64e_fk_fireapp_s` (`section_id`);

--
-- Indexes for table `fireapp_teacher_subjects`
--
ALTER TABLE `fireapp_teacher_subjects`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `fireapp_teacher_subjects_teacher_id_subject_id_448f1a7d_uniq` (`teacher_id`,`subject_id`),
  ADD KEY `fireapp_teacher_subj_subject_id_8533f5db_fk_fireapp_s` (`subject_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `fireapp_attendancedata`
--
ALTER TABLE `fireapp_attendancedata`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fireapp_attendancedata_students_attended`
--
ALTER TABLE `fireapp_attendancedata_students_attended`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `fireapp_customuser_groups`
--
ALTER TABLE `fireapp_customuser_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `fireapp_customuser_user_permissions`
--
ALTER TABLE `fireapp_customuser_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fireapp_department`
--
ALTER TABLE `fireapp_department`
  MODIFY `dept_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `fireapp_grade`
--
ALTER TABLE `fireapp_grade`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `fireapp_quiz`
--
ALTER TABLE `fireapp_quiz`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `fireapp_quizdata`
--
ALTER TABLE `fireapp_quizdata`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `fireapp_quiz_quiz_datas`
--
ALTER TABLE `fireapp_quiz_quiz_datas`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `fireapp_section`
--
ALTER TABLE `fireapp_section`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `fireapp_subject`
--
ALTER TABLE `fireapp_subject`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `fireapp_teacher_sections`
--
ALTER TABLE `fireapp_teacher_sections`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `fireapp_teacher_subjects`
--
ALTER TABLE `fireapp_teacher_subjects`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
  ADD CONSTRAINT `fireapp_attendancedata_section_id_7480abb1_fk_fireapp_section_id` FOREIGN KEY (`section_id`) REFERENCES `fireapp_section` (`id`);

--
-- Constraints for table `fireapp_attendancedata_students_attended`
--
ALTER TABLE `fireapp_attendancedata_students_attended`
  ADD CONSTRAINT `fireapp_attendanceda_attendancedata_id_973a6be0_fk_fireapp_a` FOREIGN KEY (`attendancedata_id`) REFERENCES `fireapp_attendancedata` (`id`),
  ADD CONSTRAINT `fireapp_attendanceda_student_id_7d42195a_fk_fireapp_s` FOREIGN KEY (`student_id`) REFERENCES `fireapp_student` (`user_id`);

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
-- Constraints for table `fireapp_grade`
--
ALTER TABLE `fireapp_grade`
  ADD CONSTRAINT `fireapp_grade_student_id_eb6baeff_fk_fireapp_student_user_id` FOREIGN KEY (`student_id`) REFERENCES `fireapp_student` (`user_id`),
  ADD CONSTRAINT `fireapp_grade_subject_id_0eb98b65_fk_fireapp_subject_id` FOREIGN KEY (`subject_id`) REFERENCES `fireapp_subject` (`id`);

--
-- Constraints for table `fireapp_quizdata`
--
ALTER TABLE `fireapp_quizdata`
  ADD CONSTRAINT `fireapp_quizdata_student_id_a060b4b1_fk_fireapp_student_user_id` FOREIGN KEY (`student_id`) REFERENCES `fireapp_student` (`user_id`);

--
-- Constraints for table `fireapp_quiz_quiz_datas`
--
ALTER TABLE `fireapp_quiz_quiz_datas`
  ADD CONSTRAINT `fireapp_quiz_quiz_da_quizdata_id_7b135c88_fk_fireapp_q` FOREIGN KEY (`quizdata_id`) REFERENCES `fireapp_quizdata` (`id`),
  ADD CONSTRAINT `fireapp_quiz_quiz_datas_quiz_id_19551b0e_fk_fireapp_quiz_id` FOREIGN KEY (`quiz_id`) REFERENCES `fireapp_quiz` (`id`);

--
-- Constraints for table `fireapp_student`
--
ALTER TABLE `fireapp_student`
  ADD CONSTRAINT `fireapp_student_course_id_eea51b75_fk_fireapp_course_course_id` FOREIGN KEY (`course_id`) REFERENCES `fireapp_course` (`course_id`),
  ADD CONSTRAINT `fireapp_student_section_id_5579869f_fk_fireapp_section_id` FOREIGN KEY (`section_id`) REFERENCES `fireapp_section` (`id`),
  ADD CONSTRAINT `fireapp_student_user_id_615210c7_fk_fireapp_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `fireapp_customuser` (`id`);

--
-- Constraints for table `fireapp_teacher`
--
ALTER TABLE `fireapp_teacher`
  ADD CONSTRAINT `fireapp_teacher_department_id_7c40a0b5_fk_fireapp_d` FOREIGN KEY (`department_id`) REFERENCES `fireapp_department` (`dept_id`),
  ADD CONSTRAINT `fireapp_teacher_user_id_54f01d24_fk_fireapp_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `fireapp_customuser` (`id`);

--
-- Constraints for table `fireapp_teacher_sections`
--
ALTER TABLE `fireapp_teacher_sections`
  ADD CONSTRAINT `fireapp_teacher_sect_section_id_aa0bc64e_fk_fireapp_s` FOREIGN KEY (`section_id`) REFERENCES `fireapp_section` (`id`),
  ADD CONSTRAINT `fireapp_teacher_sect_teacher_id_abd8255e_fk_fireapp_t` FOREIGN KEY (`teacher_id`) REFERENCES `fireapp_teacher` (`user_id`);

--
-- Constraints for table `fireapp_teacher_subjects`
--
ALTER TABLE `fireapp_teacher_subjects`
  ADD CONSTRAINT `fireapp_teacher_subj_subject_id_8533f5db_fk_fireapp_s` FOREIGN KEY (`subject_id`) REFERENCES `fireapp_subject` (`id`),
  ADD CONSTRAINT `fireapp_teacher_subj_teacher_id_ed20f19a_fk_fireapp_t` FOREIGN KEY (`teacher_id`) REFERENCES `fireapp_teacher` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

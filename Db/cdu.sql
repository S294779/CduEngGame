-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 14, 2017 at 03:49 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cdu`
--

-- --------------------------------------------------------

--
-- Table structure for table `wd_admins`
--

CREATE TABLE `wd_admins` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `wd_admins`
--

INSERT INTO `wd_admins` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@gmail.com', '$2y$10$/R2UzamxvJ91eLzxenr.de4eLOcqpA4zDuwXGNCB2vJ2pW.QR6cFC', 'z8tA1a5dfC2mST8nLjB1s2cc0aKVtIu9LZh9HOK5oFybIyrhLhF9byUd9tlB', '2017-04-08 06:10:09', '2017-04-08 06:10:09');

-- --------------------------------------------------------

--
-- Table structure for table `wd_chat_messages`
--

CREATE TABLE `wd_chat_messages` (
  `id` int(11) NOT NULL,
  `message` text NOT NULL,
  `from_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `arrived_time` datetime NOT NULL,
  `seen_time` datetime DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `wd_common_question`
--

CREATE TABLE `wd_common_question` (
  `id` int(11) NOT NULL,
  `question` varchar(255) NOT NULL,
  `subpart` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_asked` tinyint(1) NOT NULL COMMENT '1="Question has been asked",0="Not asked"'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wd_common_question`
--

INSERT INTO `wd_common_question` (`id`, `question`, `subpart`, `created_at`, `updated_at`, `is_asked`) VALUES
(1, 'What is your name?', '{\"1\":\"What is\",\"2\":\"your\",\"3\":\"name?\"}', '2017-05-06 01:15:56', '2017-05-06 01:16:17', 1),
(2, 'ewrtyui', '{\"1\":\"sdfghj\",\"2\":\"wertfghj\",\"3\":\"erdtfghjk\"}', '2017-05-07 15:34:57', '2017-05-07 15:34:57', 0),
(3, 'What is your father name?', '{\"1\":\"What is\",\"2\":\"your father\",\"3\":\"name?\"}', '2017-05-13 15:32:35', '2017-05-13 15:39:13', 1);

-- --------------------------------------------------------

--
-- Table structure for table `wd_extra_answer`
--

CREATE TABLE `wd_extra_answer` (
  `id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `common_question_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `question_text` varchar(255) NOT NULL,
  `answer_text` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wd_extra_answer`
--

INSERT INTO `wd_extra_answer` (`id`, `question_id`, `common_question_id`, `group_id`, `student_id`, `question_text`, `answer_text`, `created_at`, `updated_at`) VALUES
(1, 10, 3, 2, 1, 'What is your father name?', 'qwertyuiop', '2017-05-13 16:03:17', '2017-05-13 16:03:17');

-- --------------------------------------------------------

--
-- Table structure for table `wd_general_setting`
--

CREATE TABLE `wd_general_setting` (
  `id` int(11) NOT NULL,
  `setting_code` varchar(100) NOT NULL,
  `setting_value` text NOT NULL,
  `setting_description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wd_general_setting`
--

INSERT INTO `wd_general_setting` (`id`, `setting_code`, `setting_value`, `setting_description`) VALUES
(1, 'MAX_MEMBER_IN_GROUP', '10', 'Specifying maximum number of member in a group'),
(2, 'FLIP_GAME_WINDOW_SIZE', '10X4', 'Specifying default size of matrix'),
(3, 'NUMBER_OF_COMMON_QUESTION', '3', 'Specify number of questions asking to the  student while matching pair'),
(4, 'EMAIL_SENDING_DAY', '[\"Wednesday\",\"Friday\"]', 'Specify day on which emails are to be sent.'),
(5, 'MAIL_SETTING_HOST', 'smtp.gmail.com', 'hot for mail setting'),
(6, 'MAIL_SETTING_DRIVER', 'smtp', 'mail driver for mail setting'),
(7, 'MAIL_SETTING_ENCRYPT', 'ssl', 'mail encryption for mail setting'),
(8, 'MAIL_SETTING_PORT', '465', 'mail port for mail setting'),
(9, 'MAIL_SETTING_USERNAME', 'bbstha143@gmail.com', 'mail username for mail setting'),
(10, 'MAIL_SETTING_PASSWORD', 'mRaHZAzoQxY//YiycaBNaQsSc0rHxx0uE6r6', 'mail password for mail setting'),
(11, 'MAIL_SETTING_MAIL_FROM_ADDR', 'bbstha143@gmail.com', 'mail from address for mail setting'),
(12, 'MAIL_SETTING_MAIL_FROM_NAME', 'CDU', 'mail from name for mail setting'),
(13, 'GAME_PLAYING_TIME', '[{\"from\":\"04:00\",\"to\":\"23:44\"},{\"from\":\"01:00\",\"to\":\"05:00\"}]', 'times for playing game');

-- --------------------------------------------------------

--
-- Table structure for table `wd_group`
--

CREATE TABLE `wd_group` (
  `id` int(11) NOT NULL,
  `group_name` varchar(255) NOT NULL,
  `group_description` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `release_group` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `wd_group`
--

INSERT INTO `wd_group` (`id`, `group_name`, `group_description`, `created_at`, `updated_at`, `release_group`) VALUES
(2, 'test', 'this is test', '2017-05-13 15:28:03', '2017-05-13 15:28:03', 1);

-- --------------------------------------------------------

--
-- Table structure for table `wd_group_progress`
--

CREATE TABLE `wd_group_progress` (
  `id` int(11) NOT NULL,
  `group_name` varchar(255) NOT NULL,
  `group_id` int(11) NOT NULL,
  `group_members` text NOT NULL,
  `total_time_taken` varchar(200) NOT NULL,
  `question` varchar(255) NOT NULL,
  `total_matched` int(11) NOT NULL,
  `matched_percentage` decimal(11,2) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `wd_group_progress`
--

INSERT INTO `wd_group_progress` (`id`, `group_name`, `group_id`, `group_members`, `total_time_taken`, `question`, `total_matched`, `matched_percentage`, `created_at`, `updated_at`) VALUES
(2, 'test', 2, '[{\"student_id\":4,\"student_name\":\"Bishal Shrestha\",\"answer_count\":20}]', '0:3:38.80', 'This is ttest', 20, '100.00', '2017-05-13 16:27:34', '2017-05-14 13:48:05');

-- --------------------------------------------------------

--
-- Table structure for table `wd_group_question`
--

CREATE TABLE `wd_group_question` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wd_group_question`
--

INSERT INTO `wd_group_question` (`id`, `group_id`, `question_id`, `created_at`, `updated_at`) VALUES
(20, 2, 11, '2017-05-13 16:22:58', '2017-05-13 16:22:58');

-- --------------------------------------------------------

--
-- Table structure for table `wd_matching_unit_collection`
--

CREATE TABLE `wd_matching_unit_collection` (
  `id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `unit` varchar(255) NOT NULL,
  `matching_unit` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `wd_matrix_table`
--

CREATE TABLE `wd_matrix_table` (
  `id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `first_pair` int(11) NOT NULL,
  `second_pair` int(11) NOT NULL,
  `unique_key` varchar(200) NOT NULL,
  `label` varchar(255) NOT NULL,
  `xposition` int(11) NOT NULL,
  `yposition` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `hint` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `wd_matrix_table`
--

INSERT INTO `wd_matrix_table` (`id`, `question_id`, `first_pair`, `second_pair`, `unique_key`, `label`, `xposition`, `yposition`, `created_at`, `updated_at`, `hint`) VALUES
(1361, 11, 3, 2, '1494692005789', 'c2', 1, 1, '2017-05-13 16:22:55', '2017-05-13 16:22:55', 0),
(1362, 11, 2, 1, '1494692005760', 'b1', 2, 1, '2017-05-13 16:22:55', '2017-05-13 16:22:55', 1),
(1363, 11, 3, 2, '1494692005705', 'c2', 3, 1, '2017-05-13 16:22:55', '2017-05-13 16:22:55', 0),
(1364, 11, 1, 1, '1494692005723', 'a1', 4, 1, '2017-05-13 16:22:55', '2017-05-13 16:22:55', 0),
(1365, 11, 2, 1, '1494692005731', 'b1', 5, 1, '2017-05-13 16:22:55', '2017-05-13 16:22:55', 0),
(1366, 11, 2, 1, '1494692005696', 'b1', 6, 1, '2017-05-13 16:22:55', '2017-05-13 16:22:55', 1),
(1367, 11, 3, 2, '1494692005766', 'c2', 7, 1, '2017-05-13 16:22:55', '2017-05-13 16:22:55', 0),
(1368, 11, 4, 2, '1494692005713', 'd2', 8, 1, '2017-05-13 16:22:55', '2017-05-13 16:22:55', 0),
(1369, 11, 1, 1, '1494692005639', 'a1', 9, 1, '2017-05-13 16:22:55', '2017-05-13 16:22:55', 0),
(1370, 11, 3, 1, '1494692005739', 'c1', 10, 1, '2017-05-13 16:22:55', '2017-05-13 16:22:55', 0),
(1371, 11, 2, 2, '1494692005731', 'b2', 1, 2, '2017-05-13 16:22:55', '2017-05-13 16:22:55', 0),
(1372, 11, 4, 2, '1494692005745', 'd2', 2, 2, '2017-05-13 16:22:56', '2017-05-13 16:22:56', 0),
(1373, 11, 2, 2, '1494692005652', 'b2', 3, 2, '2017-05-13 16:22:56', '2017-05-13 16:22:56', 0),
(1374, 11, 4, 1, '1494692005677', 'd1', 4, 2, '2017-05-13 16:22:56', '2017-05-13 16:22:56', 0),
(1375, 11, 2, 1, '1494692005784', 'b1', 5, 2, '2017-05-13 16:22:56', '2017-05-13 16:22:56', 0),
(1376, 11, 4, 1, '1494692005745', 'd1', 6, 2, '2017-05-13 16:22:56', '2017-05-13 16:22:56', 0),
(1377, 11, 2, 2, '1494692005696', 'b2', 7, 2, '2017-05-13 16:22:56', '2017-05-13 16:22:56', 0),
(1378, 11, 4, 1, '1494692005795', 'd1', 8, 2, '2017-05-13 16:22:56', '2017-05-13 16:22:56', 1),
(1379, 11, 3, 1, '1494692005789', 'c1', 9, 2, '2017-05-13 16:22:56', '2017-05-13 16:22:56', 0),
(1380, 11, 1, 2, '1494692005777', 'a2', 10, 2, '2017-05-13 16:22:56', '2017-05-13 16:22:56', 0),
(1381, 11, 3, 2, '1494692005739', 'c2', 1, 3, '2017-05-13 16:22:56', '2017-05-13 16:22:56', 0),
(1382, 11, 4, 2, '1494692005795', 'd2', 2, 3, '2017-05-13 16:22:56', '2017-05-13 16:22:56', 0),
(1383, 11, 1, 1, '1494692005753', 'a1', 3, 3, '2017-05-13 16:22:56', '2017-05-13 16:22:56', 0),
(1384, 11, 4, 2, '1494692005772', 'd2', 4, 3, '2017-05-13 16:22:57', '2017-05-13 16:22:57', 0),
(1385, 11, 1, 2, '1494692005723', 'a2', 5, 3, '2017-05-13 16:22:57', '2017-05-13 16:22:57', 0),
(1386, 11, 1, 1, '1494692005777', 'a1', 6, 3, '2017-05-13 16:22:57', '2017-05-13 16:22:57', 0),
(1387, 11, 1, 1, '1494692005689', 'a1', 7, 3, '2017-05-13 16:22:57', '2017-05-13 16:22:57', 0),
(1388, 11, 3, 1, '1494692005705', 'c1', 8, 3, '2017-05-13 16:22:57', '2017-05-13 16:22:57', 0),
(1389, 11, 2, 1, '1494692005652', 'b1', 9, 3, '2017-05-13 16:22:57', '2017-05-13 16:22:57', 0),
(1390, 11, 1, 2, '1494692005689', 'a2', 10, 3, '2017-05-13 16:22:57', '2017-05-13 16:22:57', 0),
(1391, 11, 2, 2, '1494692005784', 'b2', 1, 4, '2017-05-13 16:22:57', '2017-05-13 16:22:57', 0),
(1392, 11, 3, 1, '1494692005766', 'c1', 2, 4, '2017-05-13 16:22:57', '2017-05-13 16:22:57', 0),
(1393, 11, 3, 1, '1494692005664', 'c1', 3, 4, '2017-05-13 16:22:57', '2017-05-13 16:22:57', 0),
(1394, 11, 4, 1, '1494692005772', 'd1', 4, 4, '2017-05-13 16:22:57', '2017-05-13 16:22:57', 0),
(1395, 11, 4, 2, '1494692005677', 'd2', 5, 4, '2017-05-13 16:22:57', '2017-05-13 16:22:57', 0),
(1396, 11, 2, 2, '1494692005760', 'b2', 6, 4, '2017-05-13 16:22:57', '2017-05-13 16:22:57', 0),
(1397, 11, 4, 1, '1494692005713', 'd1', 7, 4, '2017-05-13 16:22:57', '2017-05-13 16:22:57', 0),
(1398, 11, 1, 2, '1494692005639', 'a2', 8, 4, '2017-05-13 16:22:57', '2017-05-13 16:22:57', 0),
(1399, 11, 1, 2, '1494692005753', 'a2', 9, 4, '2017-05-13 16:22:57', '2017-05-13 16:22:57', 0),
(1400, 11, 3, 2, '1494692005664', 'c2', 10, 4, '2017-05-13 16:22:57', '2017-05-13 16:22:57', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wd_matrix_table_ans`
--

CREATE TABLE `wd_matrix_table_ans` (
  `id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `first_pair` int(11) NOT NULL,
  `second_pair` int(11) NOT NULL,
  `unique_key` varchar(200) NOT NULL,
  `label` varchar(255) NOT NULL,
  `xposition` int(11) NOT NULL,
  `yposition` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `group_id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `time_taken` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `wd_matrix_table_ans`
--

INSERT INTO `wd_matrix_table_ans` (`id`, `question_id`, `first_pair`, `second_pair`, `unique_key`, `label`, `xposition`, `yposition`, `created_at`, `updated_at`, `group_id`, `student_id`, `time_taken`) VALUES
(125, 11, 4, 2, '1494769144637', 'd2', 2, 2, '2017-05-14 13:39:06', '2017-05-14 13:39:06', 2, 4, '14.43'),
(126, 11, 4, 1, '1494769144637', 'd1', 4, 4, '2017-05-14 13:39:06', '2017-05-14 13:39:06', 2, 4, '14.43'),
(127, 11, 3, 2, '1494769195802', 'c2', 1, 1, '2017-05-14 13:39:56', '2017-05-14 13:39:56', 2, 4, '00.95'),
(128, 11, 3, 1, '1494769195802', 'c1', 9, 2, '2017-05-14 13:39:57', '2017-05-14 13:39:57', 2, 4, '00.95'),
(129, 11, 2, 1, '1494769207647', 'b1', 2, 1, '2017-05-14 13:40:10', '2017-05-14 13:40:10', 2, 4, '14.42'),
(130, 11, 2, 2, '1494769207647', 'b2', 6, 4, '2017-05-14 13:40:10', '2017-05-14 13:40:10', 2, 4, '14.42'),
(131, 11, 3, 2, '1494769221635', 'c2', 3, 1, '2017-05-14 13:40:23', '2017-05-14 13:40:23', 2, 4, '26.97'),
(132, 11, 3, 1, '1494769221635', 'c1', 8, 3, '2017-05-14 13:40:23', '2017-05-14 13:40:23', 2, 4, '26.97'),
(133, 11, 1, 1, '1494769230302', 'a1', 4, 1, '2017-05-14 13:40:31', '2017-05-14 13:40:31', 2, 4, '35.29'),
(134, 11, 1, 2, '1494769230302', 'a2', 5, 3, '2017-05-14 13:40:31', '2017-05-14 13:40:31', 2, 4, '35.29'),
(135, 11, 2, 1, '1494769237882', 'b1', 5, 1, '2017-05-14 13:40:39', '2017-05-14 13:40:39', 2, 4, '42.95'),
(136, 11, 2, 2, '1494769237882', 'b2', 1, 2, '2017-05-14 13:40:39', '2017-05-14 13:40:39', 2, 4, '42.95'),
(137, 11, 2, 1, '1494769247760', 'b1', 6, 1, '2017-05-14 13:40:49', '2017-05-14 13:40:49', 2, 4, '53.49'),
(138, 11, 2, 2, '1494769247760', 'b2', 1, 4, '2017-05-14 13:40:49', '2017-05-14 13:40:49', 2, 4, '53.49'),
(139, 11, 4, 2, '1494769270492', 'd2', 8, 1, '2017-05-14 13:41:11', '2017-05-14 13:41:11', 2, 4, '01:15.65'),
(140, 11, 4, 1, '1494769270492', 'd1', 7, 4, '2017-05-14 13:41:11', '2017-05-14 13:41:11', 2, 4, '01:15.65'),
(141, 11, 3, 2, '1494769278013', 'c2', 7, 1, '2017-05-14 13:41:19', '2017-05-14 13:41:19', 2, 4, '01:23.20'),
(142, 11, 3, 1, '1494769278013', 'c1', 2, 4, '2017-05-14 13:41:19', '2017-05-14 13:41:19', 2, 4, '01:23.20'),
(143, 11, 1, 1, '1494769285670', 'a1', 9, 1, '2017-05-14 13:41:26', '2017-05-14 13:41:26', 2, 4, '01:30.62'),
(144, 11, 1, 2, '1494769285670', 'a2', 8, 4, '2017-05-14 13:41:26', '2017-05-14 13:41:26', 2, 4, '01:30.62'),
(145, 11, 3, 1, '1494769292299', 'c1', 10, 1, '2017-05-14 13:41:33', '2017-05-14 13:41:33', 2, 4, '01:37.48'),
(146, 11, 3, 2, '1494769292299', 'c2', 1, 3, '2017-05-14 13:41:33', '2017-05-14 13:41:33', 2, 4, '01:37.48'),
(147, 11, 2, 2, '1494769317106', 'b2', 3, 2, '2017-05-14 13:41:58', '2017-05-14 13:41:58', 2, 4, '02:02.08'),
(148, 11, 2, 1, '1494769317106', 'b1', 9, 3, '2017-05-14 13:41:58', '2017-05-14 13:41:58', 2, 4, '02:02.08'),
(149, 11, 4, 2, '1494769327467', 'd2', 5, 4, '2017-05-14 13:42:08', '2017-05-14 13:42:08', 2, 4, '02:12.51'),
(150, 11, 4, 1, '1494769327467', 'd1', 4, 2, '2017-05-14 13:42:08', '2017-05-14 13:42:08', 2, 4, '02:12.51'),
(151, 11, 1, 2, '1494769345448', 'a2', 10, 2, '2017-05-14 13:42:26', '2017-05-14 13:42:26', 2, 4, '02:30.58'),
(152, 11, 1, 1, '1494769345448', 'a1', 6, 3, '2017-05-14 13:42:26', '2017-05-14 13:42:26', 2, 4, '02:30.58'),
(153, 11, 1, 2, '1494769351992', 'a2', 10, 3, '2017-05-14 13:42:33', '2017-05-14 13:42:33', 2, 4, '02:36.98'),
(154, 11, 1, 1, '1494769351992', 'a1', 7, 3, '2017-05-14 13:42:33', '2017-05-14 13:42:33', 2, 4, '02:36.98'),
(155, 11, 3, 1, '1494769357681', 'c1', 3, 4, '2017-05-14 13:42:39', '2017-05-14 13:42:39', 2, 4, '02:42.81'),
(156, 11, 3, 2, '1494769357681', 'c2', 10, 4, '2017-05-14 13:42:39', '2017-05-14 13:42:39', 2, 4, '02:42.81'),
(157, 11, 1, 1, '1494769363148', 'a1', 3, 3, '2017-05-14 13:42:44', '2017-05-14 13:42:44', 2, 4, '02:48.38'),
(158, 11, 1, 2, '1494769363148', 'a2', 9, 4, '2017-05-14 13:42:44', '2017-05-14 13:42:44', 2, 4, '02:48.38'),
(159, 11, 4, 2, '1494769371117', 'd2', 2, 3, '2017-05-14 13:42:52', '2017-05-14 13:42:52', 2, 4, '02:56.28'),
(160, 11, 4, 1, '1494769371117', 'd1', 8, 2, '2017-05-14 13:42:52', '2017-05-14 13:42:52', 2, 4, '02:56.28'),
(161, 11, 4, 2, '1494769377863', 'd2', 4, 3, '2017-05-14 13:42:58', '2017-05-14 13:42:58', 2, 4, '03:02.59'),
(162, 11, 4, 1, '1494769377863', 'd1', 6, 2, '2017-05-14 13:42:58', '2017-05-14 13:42:58', 2, 4, '03:02.59'),
(163, 11, 2, 1, '1494769379346', 'b1', 5, 2, '2017-05-14 13:43:00', '2017-05-14 13:43:00', 2, 4, '03:04.14'),
(164, 11, 2, 2, '1494769379346', 'b2', 7, 2, '2017-05-14 13:43:00', '2017-05-14 13:43:00', 2, 4, '03:04.14');

-- --------------------------------------------------------

--
-- Table structure for table `wd_migrations`
--

CREATE TABLE `wd_migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `wd_password_resets`
--

CREATE TABLE `wd_password_resets` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `expired_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `wd_questions`
--

CREATE TABLE `wd_questions` (
  `id` int(11) NOT NULL,
  `question` varchar(255) NOT NULL,
  `common_question_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `ans_matrix_size_x` int(11) NOT NULL,
  `ans_matrix_size_y` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wd_questions`
--

INSERT INTO `wd_questions` (`id`, `question`, `common_question_id`, `created_at`, `updated_at`, `ans_matrix_size_x`, `ans_matrix_size_y`) VALUES
(11, 'This is ttest', 3, '2017-05-13 16:06:52', '2017-05-13 16:22:52', 10, 4);

-- --------------------------------------------------------

--
-- Table structure for table `wd_question_options`
--

CREATE TABLE `wd_question_options` (
  `id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `first_pair` int(11) NOT NULL,
  `second_pair` int(11) NOT NULL,
  `question_option` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `wd_question_options`
--

INSERT INTO `wd_question_options` (`id`, `question_id`, `first_pair`, `second_pair`, `question_option`, `created_at`, `updated_at`) VALUES
(523, 11, 1, 1, 'a1', '2017-05-13 16:22:54', '2017-05-13 16:22:54'),
(524, 11, 1, 2, 'a2', '2017-05-13 16:22:54', '2017-05-13 16:22:54'),
(525, 11, 2, 1, 'b1', '2017-05-13 16:22:55', '2017-05-13 16:22:55'),
(526, 11, 2, 2, 'b2', '2017-05-13 16:22:55', '2017-05-13 16:22:55'),
(527, 11, 3, 1, 'c1', '2017-05-13 16:22:55', '2017-05-13 16:22:55'),
(528, 11, 3, 2, 'c2', '2017-05-13 16:22:55', '2017-05-13 16:22:55'),
(529, 11, 4, 1, 'd1', '2017-05-13 16:22:55', '2017-05-13 16:22:55'),
(530, 11, 4, 2, 'd2', '2017-05-13 16:22:55', '2017-05-13 16:22:55');

-- --------------------------------------------------------

--
-- Table structure for table `wd_users`
--

CREATE TABLE `wd_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `timezone` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `wd_users`
--

INSERT INTO `wd_users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`, `group_id`, `timezone`) VALUES
(4, 'Bishal Shrestha', 'bsal@gmail.com', '$2y$10$5MBI.6cx3MthRjzmhfCqW.wwEPewnTSftiHsMBS.N2jGzLG8CtcAa', '81tXEbyCn4LglspW3LYQuQGfhZXOWRWpRDpO730GHQglDQcKQv9zNjNF4Gdk', '2017-05-14 00:33:30', '2017-05-14 00:33:38', 2, 'Australia/Darwin'),
(5, 'anil', 'anil@gmail.com', '$2y$10$nU3uDaNc.0c77AY8K.j7G.VrwIsqTbD20AXlGsWNABk83V/jWnsFW', NULL, '2017-05-14 04:15:39', '2017-05-14 04:15:44', 1, 'Australia/Darwin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `wd_admins`
--
ALTER TABLE `wd_admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wd_chat_messages`
--
ALTER TABLE `wd_chat_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wd_common_question`
--
ALTER TABLE `wd_common_question`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wd_extra_answer`
--
ALTER TABLE `wd_extra_answer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wd_general_setting`
--
ALTER TABLE `wd_general_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wd_group`
--
ALTER TABLE `wd_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wd_group_progress`
--
ALTER TABLE `wd_group_progress`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wd_group_question`
--
ALTER TABLE `wd_group_question`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wd_matrix_table`
--
ALTER TABLE `wd_matrix_table`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wd_matrix_table_ans`
--
ALTER TABLE `wd_matrix_table_ans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wd_migrations`
--
ALTER TABLE `wd_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wd_password_resets`
--
ALTER TABLE `wd_password_resets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wd_questions`
--
ALTER TABLE `wd_questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wd_question_options`
--
ALTER TABLE `wd_question_options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wd_users`
--
ALTER TABLE `wd_users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `wd_admins`
--
ALTER TABLE `wd_admins`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `wd_chat_messages`
--
ALTER TABLE `wd_chat_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wd_common_question`
--
ALTER TABLE `wd_common_question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `wd_extra_answer`
--
ALTER TABLE `wd_extra_answer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `wd_general_setting`
--
ALTER TABLE `wd_general_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `wd_group`
--
ALTER TABLE `wd_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `wd_group_progress`
--
ALTER TABLE `wd_group_progress`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `wd_group_question`
--
ALTER TABLE `wd_group_question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `wd_matrix_table`
--
ALTER TABLE `wd_matrix_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1401;
--
-- AUTO_INCREMENT for table `wd_matrix_table_ans`
--
ALTER TABLE `wd_matrix_table_ans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=165;
--
-- AUTO_INCREMENT for table `wd_migrations`
--
ALTER TABLE `wd_migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wd_password_resets`
--
ALTER TABLE `wd_password_resets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wd_questions`
--
ALTER TABLE `wd_questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `wd_question_options`
--
ALTER TABLE `wd_question_options`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=531;
--
-- AUTO_INCREMENT for table `wd_users`
--
ALTER TABLE `wd_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

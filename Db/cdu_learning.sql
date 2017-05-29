-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 15, 2017 at 09:31 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cdu_learning`
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
  `correct_review` enum('0','1','2') NOT NULL COMMENT '0="pending",1="correct","incorrect"',
  `question_text` varchar(255) NOT NULL,
  `answer_text` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wd_extra_answer`
--

INSERT INTO `wd_extra_answer` (`id`, `question_id`, `common_question_id`, `group_id`, `student_id`, `correct_review`, `question_text`, `answer_text`, `created_at`, `updated_at`) VALUES
(2, 11, 3, 2, 1, '1', 'wescgfkml', 'azsexfcgvhjmk,.', '2017-05-15 17:49:08', '2017-05-15 19:30:24');

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
(9, 'MAIL_SETTING_USERNAME', 'sbr.mgr1@gmail.com', 'mail username for mail setting'),
(10, 'MAIL_SETTING_PASSWORD', 'CzOKO6QSuAzoWxDS58NSEnk/MMhF/F3a', 'mail password for mail setting'),
(11, 'MAIL_SETTING_MAIL_FROM_ADDR', 'sbr.mgr1@gmail.com', 'mail from address for mail setting'),
(12, 'MAIL_SETTING_MAIL_FROM_NAME', 'CDU', 'mail from name for mail setting'),
(13, 'GAME_PLAYING_TIME', '[{\"from\":\"16:00\",\"to\":\"00:00\"}]', 'times for playing game');

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
(1, '1st group', 'asadsa', '2017-05-11 13:49:15', '2017-05-11 13:49:15', 1),
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
(1, '1st group', 1, '[{\"student_id\":2,\"student_name\":\"Krishna\",\"answer_count\":0}]', '0:0:0.0', 'This is ttest', 0, '0.00', '2017-05-13 15:27:09', '2017-05-15 19:30:48'),
(2, 'test', 2, '[{\"student_id\":1,\"student_name\":\"Samsher\",\"answer_count\":20}]', '0:4:11.41', 'This is ttest', 20, '100.00', '2017-05-13 16:27:34', '2017-05-15 19:30:48');

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
(30, 1, 11, '2017-05-15 17:44:26', '2017-05-15 17:44:26'),
(31, 2, 11, '2017-05-15 17:44:26', '2017-05-15 17:44:26');

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
(1601, 11, 2, 1, '1494864310519', 'b1', 1, 1, '2017-05-15 17:44:24', '2017-05-15 17:44:24', 0),
(1602, 11, 1, 2, '1494864310574', 'a2', 2, 1, '2017-05-15 17:44:24', '2017-05-15 17:44:24', 0),
(1603, 11, 3, 1, '1494864310447', 'c1', 3, 1, '2017-05-15 17:44:24', '2017-05-15 17:44:24', 0),
(1604, 11, 1, 2, '1494864310423', 'a2', 4, 1, '2017-05-15 17:44:24', '2017-05-15 17:44:24', 0),
(1605, 11, 2, 2, '1494864310555', 'b2', 5, 1, '2017-05-15 17:44:24', '2017-05-15 17:44:24', 0),
(1606, 11, 3, 2, '1494864310562', 'c2', 6, 1, '2017-05-15 17:44:24', '2017-05-15 17:44:24', 0),
(1607, 11, 3, 2, '1494864310586', 'c2', 7, 1, '2017-05-15 17:44:24', '2017-05-15 17:44:24', 0),
(1608, 11, 3, 1, '1494864310529', 'c1', 8, 1, '2017-05-15 17:44:24', '2017-05-15 17:44:24', 0),
(1609, 11, 2, 1, '1494864310436', 'b1', 9, 1, '2017-05-15 17:44:24', '2017-05-15 17:44:24', 0),
(1610, 11, 4, 2, '1494864310591', 'd2', 10, 1, '2017-05-15 17:44:24', '2017-05-15 17:44:24', 0),
(1611, 11, 2, 1, '1494864310580', 'b1', 1, 2, '2017-05-15 17:44:24', '2017-05-15 17:44:24', 0),
(1612, 11, 3, 2, '1494864310447', 'c2', 2, 2, '2017-05-15 17:44:24', '2017-05-15 17:44:24', 0),
(1613, 11, 4, 2, '1494864310568', 'd2', 3, 2, '2017-05-15 17:44:24', '2017-05-15 17:44:24', 0),
(1614, 11, 4, 1, '1494864310539', 'd1', 4, 2, '2017-05-15 17:44:24', '2017-05-15 17:44:24', 0),
(1615, 11, 4, 2, '1494864310505', 'd2', 5, 2, '2017-05-15 17:44:24', '2017-05-15 17:44:24', 0),
(1616, 11, 2, 1, '1494864310555', 'b1', 6, 2, '2017-05-15 17:44:24', '2017-05-15 17:44:24', 0),
(1617, 11, 2, 2, '1494864310436', 'b2', 7, 2, '2017-05-15 17:44:25', '2017-05-15 17:44:25', 0),
(1618, 11, 2, 2, '1494864310580', 'b2', 8, 2, '2017-05-15 17:44:25', '2017-05-15 17:44:25', 0),
(1619, 11, 1, 1, '1494864310465', 'a1', 9, 2, '2017-05-15 17:44:25', '2017-05-15 17:44:25', 0),
(1620, 11, 2, 1, '1494864310480', 'b1', 10, 2, '2017-05-15 17:44:25', '2017-05-15 17:44:25', 0),
(1621, 11, 1, 1, '1494864310574', 'a1', 1, 3, '2017-05-15 17:44:25', '2017-05-15 17:44:25', 0),
(1622, 11, 4, 1, '1494864310457', 'd1', 2, 3, '2017-05-15 17:44:25', '2017-05-15 17:44:25', 1),
(1623, 11, 4, 1, '1494864310591', 'd1', 3, 3, '2017-05-15 17:44:25', '2017-05-15 17:44:25', 0),
(1624, 11, 1, 1, '1494864310547', 'a1', 4, 3, '2017-05-15 17:44:25', '2017-05-15 17:44:25', 0),
(1625, 11, 1, 2, '1494864310547', 'a2', 5, 3, '2017-05-15 17:44:25', '2017-05-15 17:44:25', 0),
(1626, 11, 3, 2, '1494864310496', 'c2', 6, 3, '2017-05-15 17:44:25', '2017-05-15 17:44:25', 0),
(1627, 11, 4, 2, '1494864310457', 'd2', 7, 3, '2017-05-15 17:44:25', '2017-05-15 17:44:25', 0),
(1628, 11, 3, 1, '1494864310496', 'c1', 8, 3, '2017-05-15 17:44:25', '2017-05-15 17:44:25', 0),
(1629, 11, 3, 1, '1494864310562', 'c1', 9, 3, '2017-05-15 17:44:25', '2017-05-15 17:44:25', 0),
(1630, 11, 2, 2, '1494864310519', 'b2', 10, 3, '2017-05-15 17:44:25', '2017-05-15 17:44:25', 0),
(1631, 11, 2, 2, '1494864310480', 'b2', 1, 4, '2017-05-15 17:44:25', '2017-05-15 17:44:25', 0),
(1632, 11, 1, 2, '1494864310512', 'a2', 2, 4, '2017-05-15 17:44:25', '2017-05-15 17:44:25', 0),
(1633, 11, 1, 1, '1494864310423', 'a1', 3, 4, '2017-05-15 17:44:25', '2017-05-15 17:44:25', 0),
(1634, 11, 4, 1, '1494864310505', 'd1', 4, 4, '2017-05-15 17:44:26', '2017-05-15 17:44:26', 1),
(1635, 11, 1, 2, '1494864310465', 'a2', 5, 4, '2017-05-15 17:44:26', '2017-05-15 17:44:26', 0),
(1636, 11, 4, 1, '1494864310568', 'd1', 6, 4, '2017-05-15 17:44:26', '2017-05-15 17:44:26', 1),
(1637, 11, 3, 2, '1494864310529', 'c2', 7, 4, '2017-05-15 17:44:26', '2017-05-15 17:44:26', 0),
(1638, 11, 3, 1, '1494864310586', 'c1', 8, 4, '2017-05-15 17:44:26', '2017-05-15 17:44:26', 0),
(1639, 11, 1, 1, '1494864310512', 'a1', 9, 4, '2017-05-15 17:44:26', '2017-05-15 17:44:26', 0),
(1640, 11, 4, 2, '1494864310539', 'd2', 10, 4, '2017-05-15 17:44:26', '2017-05-15 17:44:26', 0);

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
(85, 11, 1, 1, '1494870291921', 'a1', 1, 3, '2017-05-15 17:44:53', '2017-05-15 17:44:53', 2, 1, '20.89'),
(86, 11, 1, 2, '1494870291921', 'a2', 4, 1, '2017-05-15 17:44:53', '2017-05-15 17:44:53', 2, 1, '20.89'),
(87, 11, 2, 2, '1494870308175', 'b2', 1, 4, '2017-05-15 17:45:09', '2017-05-15 17:45:09', 2, 1, '36.93'),
(88, 11, 2, 1, '1494870308175', 'b1', 1, 2, '2017-05-15 17:45:09', '2017-05-15 17:45:09', 2, 1, '36.93'),
(89, 11, 4, 1, '1494870316230', 'd1', 3, 3, '2017-05-15 17:45:17', '2017-05-15 17:45:17', 2, 1, '45.17'),
(90, 11, 4, 2, '1494870316230', 'd2', 3, 2, '2017-05-15 17:45:17', '2017-05-15 17:45:17', 2, 1, '45.17'),
(91, 11, 4, 2, '1494870322678', 'd2', 5, 2, '2017-05-15 17:45:23', '2017-05-15 17:45:23', 2, 1, '51.37'),
(92, 11, 4, 1, '1494870322678', 'd1', 2, 3, '2017-05-15 17:45:23', '2017-05-15 17:45:23', 2, 1, '51.37'),
(93, 11, 2, 2, '1494870329374', 'b2', 5, 1, '2017-05-15 17:45:30', '2017-05-15 17:45:30', 2, 1, '57.98'),
(94, 11, 2, 1, '1494870329374', 'b1', 6, 2, '2017-05-15 17:45:30', '2017-05-15 17:45:30', 2, 1, '57.98'),
(95, 11, 1, 1, '1494870333294', 'a1', 4, 3, '2017-05-15 17:45:34', '2017-05-15 17:45:34', 2, 1, '01:01.55'),
(96, 11, 1, 2, '1494870333294', 'a2', 5, 3, '2017-05-15 17:45:34', '2017-05-15 17:45:34', 2, 1, '01:01.55'),
(97, 11, 3, 1, '1494870347789', 'c1', 3, 1, '2017-05-15 17:45:48', '2017-05-15 17:45:48', 2, 1, '01:16.23'),
(98, 11, 3, 2, '1494870347789', 'c2', 7, 4, '2017-05-15 17:45:48', '2017-05-15 17:45:48', 2, 1, '01:16.23'),
(99, 11, 3, 2, '1494870351853', 'c2', 2, 2, '2017-05-15 17:45:53', '2017-05-15 17:45:53', 2, 1, '01:20.58'),
(100, 11, 3, 1, '1494870351853', 'c1', 8, 3, '2017-05-15 17:45:53', '2017-05-15 17:45:53', 2, 1, '01:20.58'),
(101, 11, 1, 2, '1494870383597', 'a2', 2, 4, '2017-05-15 17:46:24', '2017-05-15 17:46:24', 2, 1, '01:52.31'),
(102, 11, 1, 1, '1494870383597', 'a1', 3, 4, '2017-05-15 17:46:24', '2017-05-15 17:46:24', 2, 1, '01:52.31'),
(103, 11, 4, 2, '1494870393200', 'd2', 7, 3, '2017-05-15 17:46:34', '2017-05-15 17:46:34', 2, 1, '02:01.61'),
(104, 11, 4, 1, '1494870393200', 'd1', 6, 4, '2017-05-15 17:46:34', '2017-05-15 17:46:34', 2, 1, '02:01.61'),
(105, 11, 2, 2, '1494870399534', 'b2', 10, 3, '2017-05-15 17:46:40', '2017-05-15 17:46:40', 2, 1, '02:08.01'),
(106, 11, 2, 1, '1494870399534', 'b1', 9, 1, '2017-05-15 17:46:40', '2017-05-15 17:46:40', 2, 1, '02:08.01'),
(107, 11, 3, 1, '1494870424622', 'c1', 9, 3, '2017-05-15 17:47:06', '2017-05-15 17:47:06', 2, 1, '02:33.81'),
(108, 11, 3, 2, '1494870424622', 'c2', 6, 3, '2017-05-15 17:47:06', '2017-05-15 17:47:06', 2, 1, '02:33.81'),
(109, 11, 2, 2, '1494870433302', 'b2', 7, 2, '2017-05-15 17:47:14', '2017-05-15 17:47:14', 2, 1, '02:41.83'),
(110, 11, 2, 1, '1494870433302', 'b1', 10, 2, '2017-05-15 17:47:14', '2017-05-15 17:47:14', 2, 1, '02:41.83'),
(111, 11, 4, 1, '1494870442160', 'd1', 4, 2, '2017-05-15 17:47:23', '2017-05-15 17:47:23', 2, 1, '02:50.84'),
(112, 11, 4, 2, '1494870442160', 'd2', 10, 1, '2017-05-15 17:47:23', '2017-05-15 17:47:23', 2, 1, '02:50.84'),
(113, 11, 3, 2, '1494870449238', 'c2', 7, 1, '2017-05-15 17:47:30', '2017-05-15 17:47:30', 2, 1, '02:58.26'),
(114, 11, 3, 1, '1494870449238', 'c1', 8, 1, '2017-05-15 17:47:30', '2017-05-15 17:47:30', 2, 1, '02:58.26'),
(115, 11, 1, 2, '1494870451774', 'a2', 5, 4, '2017-05-15 17:47:33', '2017-05-15 17:47:33', 2, 1, '03:00.77'),
(116, 11, 1, 1, '1494870451774', 'a1', 9, 2, '2017-05-15 17:47:33', '2017-05-15 17:47:33', 2, 1, '03:00.77'),
(117, 11, 1, 2, '1494870459133', 'a2', 2, 1, '2017-05-15 17:47:40', '2017-05-15 17:47:40', 2, 1, '03:08.14'),
(118, 11, 1, 1, '1494870459133', 'a1', 9, 4, '2017-05-15 17:47:40', '2017-05-15 17:47:40', 2, 1, '03:08.14'),
(119, 11, 3, 1, '1494870461591', 'c1', 8, 4, '2017-05-15 17:47:43', '2017-05-15 17:47:43', 2, 1, '03:10.60'),
(120, 11, 3, 2, '1494870461591', 'c2', 6, 1, '2017-05-15 17:47:43', '2017-05-15 17:47:43', 2, 1, '03:10.60'),
(121, 11, 2, 2, '1494870463918', 'b2', 8, 2, '2017-05-15 17:47:45', '2017-05-15 17:47:45', 2, 1, '03:12.82'),
(122, 11, 2, 1, '1494870463918', 'b1', 1, 1, '2017-05-15 17:47:45', '2017-05-15 17:47:45', 2, 1, '03:12.82'),
(123, 11, 4, 1, '1494870466046', 'd1', 4, 4, '2017-05-15 17:47:47', '2017-05-15 17:47:47', 2, 1, '03:14.71'),
(124, 11, 4, 2, '1494870466046', 'd2', 10, 4, '2017-05-15 17:47:47', '2017-05-15 17:47:47', 2, 1, '03:14.71');

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
(571, 11, 1, 1, 'a1', '2017-05-15 17:44:24', '2017-05-15 17:44:24'),
(572, 11, 1, 2, 'a2', '2017-05-15 17:44:24', '2017-05-15 17:44:24'),
(573, 11, 2, 1, 'b1', '2017-05-15 17:44:24', '2017-05-15 17:44:24'),
(574, 11, 2, 2, 'b2', '2017-05-15 17:44:24', '2017-05-15 17:44:24'),
(575, 11, 3, 1, 'c1', '2017-05-15 17:44:24', '2017-05-15 17:44:24'),
(576, 11, 3, 2, 'c2', '2017-05-15 17:44:24', '2017-05-15 17:44:24'),
(577, 11, 4, 1, 'd1', '2017-05-15 17:44:24', '2017-05-15 17:44:24'),
(578, 11, 4, 2, 'd2', '2017-05-15 17:44:24', '2017-05-15 17:44:24');

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
(1, 'Samsher', 'sbr.mgr1@gmail.com', '$2y$10$v1X/JcfwhFJpgsWf7.WVsOZnrWwTKRvE7k4KOncTbn4MywhDtONA6', 'kzqTOb6yfmPFgFCk2aRXF8BjRJCrY9jvHz0kxqwF7oClZfZcCeEN40DHXJje', '2017-04-29 07:19:46', '2017-05-13 23:35:36', 2, 'Asia/Kathmandu'),
(2, 'Krishna', 'krishna@gmail.com', '$2y$10$DOO9fthJ0t0Ewb5ueH7EcOhbwwzTFn56rvWS0RcAtQflbSFcq2lmu', '6Ev3N2l6i2dlRK1xDVGyT3s7izO6mmYMb4B1vLInUfba4sEdLvSncIFthUtK', '2017-04-29 07:36:25', '2017-05-05 21:30:36', 1, 'Asia/Kathmandu'),
(3, 'test', 'test@gmail.com', '$2y$10$YwHjtTkzTMRf9oBiJa1DD.nsr4gc6yQHuUEfswBdrrNH8cBOZSBH.', NULL, '2017-04-30 04:26:00', '2017-04-30 04:26:05', 6, 'Asia/Kathmandu');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
--
-- AUTO_INCREMENT for table `wd_matrix_table`
--
ALTER TABLE `wd_matrix_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1641;
--
-- AUTO_INCREMENT for table `wd_matrix_table_ans`
--
ALTER TABLE `wd_matrix_table_ans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=125;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=579;
--
-- AUTO_INCREMENT for table `wd_users`
--
ALTER TABLE `wd_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

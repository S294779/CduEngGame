-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 25, 2017 at 01:01 AM
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
(1, 'admin', 'admin@gmail.com', '$2y$10$/R2UzamxvJ91eLzxenr.de4eLOcqpA4zDuwXGNCB2vJ2pW.QR6cFC', '9bzHOeYeE7W0t8SfEGSvrzRKxeWwd64mLHHlXjNq22RKcQ8GbOGq1bSvF9kv', '2017-04-08 06:10:09', '2017-04-08 06:10:09');

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

--
-- Dumping data for table `wd_chat_messages`
--

INSERT INTO `wd_chat_messages` (`id`, `message`, `from_id`, `group_id`, `arrived_time`, `seen_time`, `deleted`) VALUES
(1, 'hi', 9, 5, '2017-04-23 07:24:09', '2017-04-23 07:24:18', 0),
(2, 'hi', 5, 5, '2017-04-23 07:24:29', '2017-04-23 07:24:34', 0),
(3, 'game kaha pugyo?', 9, 5, '2017-04-23 07:24:52', '2017-04-23 07:24:58', 0),
(4, 'kheldai xu', 5, 5, '2017-04-23 07:25:11', '2017-04-23 07:25:14', 0),
(5, 'a', 9, 5, '2017-04-23 07:25:19', '2017-04-23 07:25:28', 0),
(6, '1 calorie == 4.312 joule hunxa hoinara', 9, 5, '2017-04-23 07:26:19', '2017-04-23 07:26:28', 0),
(7, 'ho ho', 5, 5, '2017-04-23 07:26:57', '2017-04-23 07:27:04', 0),
(8, 'timile vettayo ra?', 9, 5, '2017-04-23 07:27:25', '2017-04-23 07:27:28', 0),
(9, 'yek thauma veteko thiyo', 5, 5, '2017-04-23 07:27:53', '2017-04-23 07:27:54', 0),
(10, 'hi', 9, 5, '2017-04-23 07:33:28', '2017-04-23 07:33:59', 0),
(11, 'hi2', 9, 5, '2017-04-23 07:34:55', '2017-04-23 07:35:06', 0),
(12, 'hi', 5, 5, '2017-04-23 07:35:59', '2017-04-23 07:36:00', 0),
(13, 'sdfs\r\nsdfdfd\r\nfdf', 5, 5, '2017-04-23 07:41:31', '2017-04-23 07:41:40', 0),
(14, 'hi', 9, 5, '2017-04-24 13:49:57', '2017-04-24 13:50:24', 0),
(15, 'hi', 5, 5, '2017-04-24 13:50:36', '2017-04-24 13:50:42', 0),
(16, 'Hi', 9, 5, '2017-04-24 14:08:20', '2017-04-24 14:08:48', 0),
(17, 'Hii', 9, 5, '2017-04-24 14:51:29', '2017-04-24 14:51:39', 0),
(18, 'Oee kalu', 9, 5, '2017-04-24 14:51:50', '2017-04-24 15:03:01', 0),
(19, 'rf', 5, 5, '2017-04-24 22:43:20', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wd_common_question`
--

CREATE TABLE `wd_common_question` (
  `id` int(11) NOT NULL,
  `question` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_asked` tinyint(1) NOT NULL COMMENT '1="Question has been asked",0="Not asked"'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wd_common_question`
--

INSERT INTO `wd_common_question` (`id`, `question`, `created_at`, `updated_at`, `is_asked`) VALUES
(3, 'What is your name?', '2017-04-15 16:18:51', '2017-04-22 03:56:39', 1),
(4, 'What are you?', '2017-04-20 15:25:25', '2017-04-22 03:58:54', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wd_extra_answer`
--

CREATE TABLE `wd_extra_answer` (
  `answer_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `answer_text` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wd_extra_answer`
--

INSERT INTO `wd_extra_answer` (`answer_id`, `question_id`, `student_id`, `answer_text`, `created_at`, `updated_at`) VALUES
(1, 3, 5, 'sdfgsf', '2017-04-23 06:57:41', '2017-04-23 06:57:41'),
(2, 3, 5, 'dfghjkl', '2017-04-23 07:07:08', '2017-04-23 07:07:08'),
(3, 3, 5, 'dfghjk', '2017-04-23 07:19:00', '2017-04-23 07:19:00'),
(4, 3, 9, 'Hdhrhfhdh', '2017-04-24 14:08:08', '2017-04-24 14:08:08');

-- --------------------------------------------------------

--
-- Table structure for table `wd_general_setting`
--

CREATE TABLE `wd_general_setting` (
  `id` int(11) NOT NULL,
  `setting_code` varchar(100) NOT NULL,
  `setting_value` varchar(100) NOT NULL,
  `setting_description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wd_general_setting`
--

INSERT INTO `wd_general_setting` (`id`, `setting_code`, `setting_value`, `setting_description`) VALUES
(1, 'MAX_MEMBER_IN_GROUP', '10', 'Specifying maximum number of member in a group'),
(2, 'FLIP_GAME_WINDOW_SIZE', '10X4', 'Specifying default size of matrix'),
(3, 'NUMBER_OF_COMMON_QUESTION', '3', 'Specify number of questions asking to the  student while matching pair'),
(4, 'EMAIL_SENDING_DAY', '[\"Monday\",\"Tuesday\",\"Wednesday\",\"Thursday\",\"Friday\",\"Saturday\"]', 'Specify day on which emails are to be sent.');

-- --------------------------------------------------------

--
-- Table structure for table `wd_group`
--

CREATE TABLE `wd_group` (
  `id` int(11) NOT NULL,
  `group_name` varchar(255) NOT NULL,
  `group_description` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `wd_group`
--

INSERT INTO `wd_group` (`id`, `group_name`, `group_description`, `created_at`, `updated_at`) VALUES
(5, '1st group dfdf', 'this is first group', '2017-04-11 01:04:38', '2017-04-20 13:48:11'),
(6, '2nd Group', '2nd Group', '2017-04-11 01:05:03', '2017-04-11 01:05:03');

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
(26, 5, 1, '2017-04-23 12:40:46', '2017-04-23 12:40:46'),
(27, 6, 1, '2017-04-23 12:40:47', '2017-04-23 12:40:47');

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
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `wd_matrix_table`
--

INSERT INTO `wd_matrix_table` (`id`, `question_id`, `first_pair`, `second_pair`, `unique_key`, `label`, `xposition`, `yposition`, `created_at`, `updated_at`) VALUES
(281, 1, 1, 1, '1492951185188', '1Kg', 1, 1, '2017-04-23 12:40:44', '2017-04-23 12:40:44'),
(282, 1, 2, 1, '1492951216220', '1Calorie', 2, 1, '2017-04-23 12:40:44', '2017-04-23 12:40:44'),
(283, 1, 3, 1, '1492951221284', '1 Mile', 3, 1, '2017-04-23 12:40:44', '2017-04-23 12:40:44'),
(284, 1, 1, 1, '1492951190172', '1Kg', 4, 1, '2017-04-23 12:40:44', '2017-04-23 12:40:44'),
(285, 1, 2, 2, '1492951213940', '4.184Joule', 5, 1, '2017-04-23 12:40:44', '2017-04-23 12:40:44'),
(286, 1, 4, 1, '1492951231165', '1 Meter', 6, 1, '2017-04-23 12:40:44', '2017-04-23 12:40:44'),
(287, 1, 1, 2, '1492951195357', '1000gm', 7, 1, '2017-04-23 12:40:44', '2017-04-23 12:40:44'),
(288, 1, 4, 2, '1492951233581', '3.280 Foot', 8, 1, '2017-04-23 12:40:44', '2017-04-23 12:40:44'),
(289, 1, 1, 2, '1492951187013', '1000gm', 9, 1, '2017-04-23 12:40:44', '2017-04-23 12:40:44'),
(290, 1, 4, 1, '1492951233581', '1 Meter', 10, 1, '2017-04-23 12:40:44', '2017-04-23 12:40:44'),
(291, 1, 1, 2, '1492951192364', '1000gm', 1, 2, '2017-04-23 12:40:44', '2017-04-23 12:40:44'),
(292, 1, 3, 1, '1492951224933', '1 Mile', 2, 2, '2017-04-23 12:40:45', '2017-04-23 12:40:45'),
(293, 1, 2, 1, '1492951207021', '1Calorie', 3, 2, '2017-04-23 12:40:45', '2017-04-23 12:40:45'),
(294, 1, 3, 2, '1492951227108', '1.609 Kilo meter', 4, 2, '2017-04-23 12:40:45', '2017-04-23 12:40:45'),
(295, 1, 2, 2, '1492951208636', '4.184Joule', 5, 2, '2017-04-23 12:40:45', '2017-04-23 12:40:45'),
(296, 1, 1, 1, '1492951187013', '1Kg', 6, 2, '2017-04-23 12:40:45', '2017-04-23 12:40:45'),
(297, 1, 4, 2, '1492951236909', '3.280 Foot', 7, 2, '2017-04-23 12:40:45', '2017-04-23 12:40:45'),
(298, 1, 2, 1, '1492951212476', '1Calorie', 8, 2, '2017-04-23 12:40:45', '2017-04-23 12:40:45'),
(299, 1, 3, 1, '1492951223388', '1 Mile', 9, 2, '2017-04-23 12:40:45', '2017-04-23 12:40:45'),
(300, 1, 1, 2, '1492951197364', '1000gm', 10, 2, '2017-04-23 12:40:45', '2017-04-23 12:40:45'),
(301, 1, 2, 1, '1492951208636', '1Calorie', 1, 3, '2017-04-23 12:40:45', '2017-04-23 12:40:45'),
(302, 1, 2, 2, '1492951210380', '4.184Joule', 2, 3, '2017-04-23 12:40:45', '2017-04-23 12:40:45'),
(303, 1, 1, 2, '1492951185188', '1000gm', 3, 3, '2017-04-23 12:40:45', '2017-04-23 12:40:45'),
(304, 1, 4, 2, '1492951231165', '3.280 Foot', 4, 3, '2017-04-23 12:40:45', '2017-04-23 12:40:45'),
(305, 1, 4, 1, '1492951236909', '1 Meter', 5, 3, '2017-04-23 12:40:45', '2017-04-23 12:40:45'),
(306, 1, 3, 2, '1492951223388', '1.609 Kilo meter', 6, 3, '2017-04-23 12:40:45', '2017-04-23 12:40:45'),
(307, 1, 2, 2, '1492951216220', '4.184Joule', 7, 3, '2017-04-23 12:40:45', '2017-04-23 12:40:45'),
(308, 1, 1, 1, '1492951192364', '1Kg', 8, 3, '2017-04-23 12:40:45', '2017-04-23 12:40:45'),
(309, 1, 3, 1, '1492951227108', '1 Mile', 9, 3, '2017-04-23 12:40:45', '2017-04-23 12:40:45'),
(310, 1, 2, 2, '1492951212476', '4.184Joule', 10, 3, '2017-04-23 12:40:45', '2017-04-23 12:40:45'),
(311, 1, 1, 2, '1492951190172', '1000gm', 1, 4, '2017-04-23 12:40:46', '2017-04-23 12:40:46'),
(312, 1, 3, 2, '1492951224933', '1.609 Kilo meter', 2, 4, '2017-04-23 12:40:46', '2017-04-23 12:40:46'),
(313, 1, 1, 1, '1492951195357', '1Kg', 3, 4, '2017-04-23 12:40:46', '2017-04-23 12:40:46'),
(314, 1, 3, 2, '1492951221284', '1.609 Kilo meter', 4, 4, '2017-04-23 12:40:46', '2017-04-23 12:40:46'),
(315, 1, 2, 2, '1492951207021', '4.184Joule', 5, 4, '2017-04-23 12:40:46', '2017-04-23 12:40:46'),
(316, 1, 1, 2, '1492951188629', '1000gm', 6, 4, '2017-04-23 12:40:46', '2017-04-23 12:40:46'),
(317, 1, 2, 1, '1492951210380', '1Calorie', 7, 4, '2017-04-23 12:40:46', '2017-04-23 12:40:46'),
(318, 1, 1, 1, '1492951197364', '1Kg', 8, 4, '2017-04-23 12:40:46', '2017-04-23 12:40:46'),
(319, 1, 2, 1, '1492951213940', '1Calorie', 9, 4, '2017-04-23 12:40:46', '2017-04-23 12:40:46'),
(320, 1, 1, 1, '1492951188629', '1Kg', 10, 4, '2017-04-23 12:40:46', '2017-04-23 12:40:46');

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
(1, 1, 1, 1, '1493042877903', '1Kg', 1, 1, '2017-04-24 14:08:08', '2017-04-24 14:08:08', 5, 9, '00.00'),
(2, 1, 1, 2, '1493042877903', '1000gm', 3, 3, '2017-04-24 14:08:08', '2017-04-24 14:08:08', 5, 9, '00.00');

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
-- Table structure for table `wd_questions`
--

CREATE TABLE `wd_questions` (
  `id` int(11) NOT NULL,
  `question` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `ans_matrix_size_x` int(11) NOT NULL,
  `ans_matrix_size_y` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wd_questions`
--

INSERT INTO `wd_questions` (`id`, `question`, `created_at`, `updated_at`, `ans_matrix_size_x`, `ans_matrix_size_y`) VALUES
(1, 'Find the pair of units in different system that describe the same dimensions', '2017-04-15 03:49:04', '2017-04-17 14:04:32', 10, 4);

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
(1, 1, 1, 1, '1Kg', '2017-04-23 12:40:43', '2017-04-23 12:40:43'),
(2, 1, 1, 2, '1000gm', '2017-04-23 12:40:44', '2017-04-23 12:40:44'),
(3, 1, 2, 1, '1Calorie', '2017-04-23 12:40:44', '2017-04-23 12:40:44'),
(4, 1, 2, 2, '4.184Joule', '2017-04-23 12:40:44', '2017-04-23 12:40:44'),
(5, 1, 3, 1, '1 Mile', '2017-04-23 12:40:44', '2017-04-23 12:40:44'),
(6, 1, 3, 2, '1.609 Kilo meter', '2017-04-23 12:40:44', '2017-04-23 12:40:44'),
(7, 1, 4, 1, '1 Meter', '2017-04-23 12:40:44', '2017-04-23 12:40:44'),
(8, 1, 4, 2, '3.280 Foot', '2017-04-23 12:40:44', '2017-04-23 12:40:44');

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
  `group_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `wd_users`
--

INSERT INTO `wd_users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`, `group_id`) VALUES
(5, 'Samsher', 'sbr.mgr1@hotmail.com', '$2y$10$lexNQiet73KiRGErvTLSNeBTyhWMREZtzrUALkJiyyn5rUJ.gy5vK', 'bkbVaJmyCbU7JlPCiIM2aQOM5FUrxOo40Y6pU0Zz2yljlDbtFj4aUEMJXG1b', '2017-04-10 19:23:31', '2017-04-10 20:37:59', 5),
(7, 'sss', 'sss@sss.com', '$2y$10$7sD5KMoFz.RnIj6WeXNSDu/4YUjozRMaLqn6FUhBz7Ya/gBTKx5qO', 'a85x7IEJ2ntffnc3iRTilhGPuCYT5qUSRi7KjmJwoDEj4NvTmQAAl6pmUpEG', '2017-04-16 07:30:34', '2017-04-16 07:30:55', 6),
(8, 'Samsher', 'sbr.mgr121@hotmail.com', '$2y$10$iPggsgyQCO75k1U9e51ZbeYRSXkbscODziOwZQXHF8t0O84HYxrEW', NULL, '2017-04-19 19:44:38', '2017-04-19 19:44:38', NULL),
(9, 'Krishna', 'krishna@gmail.com', '$2y$10$W7PMXubDrScTsVORm6sRXOjLrrFj9a8IOt.a6Ul549arLw0Tdc/EC', NULL, '2017-04-22 08:37:29', '2017-04-22 08:39:43', 5),
(10, 'ram', 'ram@gmail.com', '$2y$10$mK0EufYMP0Ksps0Ne7qmzON93yCAeKnG/cSAO0PIKsX1zEn8h7uBW', NULL, '2017-04-22 08:40:30', '2017-04-22 08:42:29', 5);

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
  ADD PRIMARY KEY (`answer_id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `wd_common_question`
--
ALTER TABLE `wd_common_question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `wd_extra_answer`
--
ALTER TABLE `wd_extra_answer`
  MODIFY `answer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `wd_general_setting`
--
ALTER TABLE `wd_general_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `wd_group`
--
ALTER TABLE `wd_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `wd_group_question`
--
ALTER TABLE `wd_group_question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `wd_matrix_table`
--
ALTER TABLE `wd_matrix_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=321;
--
-- AUTO_INCREMENT for table `wd_matrix_table_ans`
--
ALTER TABLE `wd_matrix_table_ans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `wd_migrations`
--
ALTER TABLE `wd_migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wd_questions`
--
ALTER TABLE `wd_questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `wd_question_options`
--
ALTER TABLE `wd_question_options`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `wd_users`
--
ALTER TABLE `wd_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 22, 2017 at 06:41 AM
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
(1, 3, 5, 'Samsher', '2017-04-22 04:26:34', '2017-04-22 04:26:34'),
(2, 4, 5, 'Student', '2017-04-22 04:26:49', '2017-04-22 04:26:49');

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
(2, 'FLIP_GAME_WINDOW_SIZE', '10X4_', 'Specifying default size of matrix'),
(3, 'NUMBER_OF_COMMON_QUESTION', '3', 'Specify number of questions asking to the  student while matching pair'),
(4, 'EMAIL_SENDING_DAY', 'Friday', 'Specify day on which emails are to be sent.');

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
(24, 5, 1, '2017-04-19 17:54:53', '2017-04-19 17:54:53'),
(25, 6, 1, '2017-04-19 17:54:53', '2017-04-19 17:54:53');

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
(241, 1, 4, 1, '1492624399958', '1Kg', 1, 1, '2017-04-19 17:54:51', '2017-04-19 17:54:51'),
(242, 1, 7, 1, '1492624424311', '1 Meter', 2, 1, '2017-04-19 17:54:51', '2017-04-19 17:54:51'),
(243, 1, 5, 1, '1492624437446', '1calorie', 3, 1, '2017-04-19 17:54:51', '2017-04-19 17:54:51'),
(244, 1, 6, 2, '1492624420035', '1.609 Kilo meter', 4, 1, '2017-04-19 17:54:52', '2017-04-19 17:54:52'),
(245, 1, 4, 1, '1492624469458', '1Kg', 5, 1, '2017-04-19 17:54:52', '2017-04-19 17:54:52'),
(246, 1, 4, 2, '1492624405841', '1000gram', 6, 1, '2017-04-19 17:54:52', '2017-04-19 17:54:52'),
(247, 1, 4, 1, '1492624479380', '1Kg', 7, 1, '2017-04-19 17:54:52', '2017-04-19 17:54:52'),
(248, 1, 5, 2, '1492624443418', '4.184Joule', 8, 1, '2017-04-19 17:54:52', '2017-04-19 17:54:52'),
(249, 1, 5, 1, '1492624446834', '1calorie', 9, 1, '2017-04-19 17:54:52', '2017-04-19 17:54:52'),
(250, 1, 6, 2, '1492624416635', '1.609 Kilo meter', 10, 1, '2017-04-19 17:54:52', '2017-04-19 17:54:52'),
(251, 1, 6, 1, '1492624416635', '1 Mile', 1, 2, '2017-04-19 17:54:52', '2017-04-19 17:54:52'),
(252, 1, 7, 2, '1492624432329', '3.280 Foot', 2, 2, '2017-04-19 17:54:52', '2017-04-19 17:54:52'),
(253, 1, 5, 1, '1492624410019', '1calorie', 3, 2, '2017-04-19 17:54:52', '2017-04-19 17:54:52'),
(254, 1, 4, 2, '1492624474164', '1000gram', 4, 2, '2017-04-19 17:54:52', '2017-04-19 17:54:52'),
(255, 1, 6, 1, '1492624452301', '1 Mile', 5, 2, '2017-04-19 17:54:52', '2017-04-19 17:54:52'),
(256, 1, 5, 2, '1492624412464', '4.184Joule', 6, 2, '2017-04-19 17:54:52', '2017-04-19 17:54:52'),
(257, 1, 7, 2, '1492624484632', '3.280 Foot', 7, 2, '2017-04-19 17:54:52', '2017-04-19 17:54:52'),
(258, 1, 4, 1, '1492624403363', '1Kg', 8, 2, '2017-04-19 17:54:52', '2017-04-19 17:54:52'),
(259, 1, 7, 1, '1492624432329', '1 Meter', 9, 2, '2017-04-19 17:54:52', '2017-04-19 17:54:52'),
(260, 1, 5, 1, '1492624443418', '1calorie', 10, 2, '2017-04-19 17:54:52', '2017-04-19 17:54:52'),
(261, 1, 7, 1, '1492624426951', '1 Meter', 1, 3, '2017-04-19 17:54:52', '2017-04-19 17:54:52'),
(262, 1, 7, 2, '1492624460450', '3.280 Foot', 2, 3, '2017-04-19 17:54:52', '2017-04-19 17:54:52'),
(263, 1, 4, 2, '1492624479380', '1000gram', 3, 3, '2017-04-19 17:54:52', '2017-04-19 17:54:52'),
(264, 1, 4, 2, '1492624399958', '1000gram', 4, 3, '2017-04-19 17:54:52', '2017-04-19 17:54:52'),
(265, 1, 5, 2, '1492624446834', '4.184Joule', 5, 3, '2017-04-19 17:54:52', '2017-04-19 17:54:52'),
(266, 1, 4, 1, '1492624474164', '1Kg', 6, 3, '2017-04-19 17:54:52', '2017-04-19 17:54:52'),
(267, 1, 7, 2, '1492624426951', '3.280 Foot', 7, 3, '2017-04-19 17:54:52', '2017-04-19 17:54:52'),
(268, 1, 7, 1, '1492624460450', '1 Meter', 8, 3, '2017-04-19 17:54:52', '2017-04-19 17:54:52'),
(269, 1, 6, 1, '1492624454834', '1 Mile', 9, 3, '2017-04-19 17:54:52', '2017-04-19 17:54:52'),
(270, 1, 6, 1, '1492624420035', '1 Mile', 10, 3, '2017-04-19 17:54:52', '2017-04-19 17:54:52'),
(271, 1, 5, 1, '1492624412464', '1calorie', 1, 4, '2017-04-19 17:54:52', '2017-04-19 17:54:52'),
(272, 1, 4, 2, '1492624469458', '1000gram', 2, 4, '2017-04-19 17:54:52', '2017-04-19 17:54:52'),
(273, 1, 7, 1, '1492624484632', '1 Meter', 3, 4, '2017-04-19 17:54:53', '2017-04-19 17:54:53'),
(274, 1, 7, 2, '1492624424311', '3.280 Foot', 4, 4, '2017-04-19 17:54:53', '2017-04-19 17:54:53'),
(275, 1, 6, 2, '1492624454834', '1.609 Kilo meter', 5, 4, '2017-04-19 17:54:53', '2017-04-19 17:54:53'),
(276, 1, 4, 1, '1492624405841', '1Kg', 6, 4, '2017-04-19 17:54:53', '2017-04-19 17:54:53'),
(277, 1, 6, 2, '1492624452301', '1.609 Kilo meter', 7, 4, '2017-04-19 17:54:53', '2017-04-19 17:54:53'),
(278, 1, 5, 2, '1492624410019', '4.184Joule', 8, 4, '2017-04-19 17:54:53', '2017-04-19 17:54:53'),
(279, 1, 5, 2, '1492624437446', '4.184Joule', 9, 4, '2017-04-19 17:54:53', '2017-04-19 17:54:53'),
(280, 1, 4, 2, '1492624403363', '1000gram', 10, 4, '2017-04-19 17:54:53', '2017-04-19 17:54:53');

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
(1, 1, 4, 1, '1492835185276', '1Kg', 1, 1, '2017-04-22 04:26:49', '2017-04-22 04:26:49', 5, 5, '00.00'),
(2, 1, 4, 2, '1492835185276', '1000gram', 4, 2, '2017-04-22 04:26:49', '2017-04-22 04:26:49', 5, 5, '00.00'),
(3, 1, 7, 2, '1492835198548', '3.280 Foot', 2, 3, '2017-04-22 04:26:49', '2017-04-22 04:26:49', 5, 5, '00.00'),
(4, 1, 7, 1, '1492835198548', '1 Meter', 1, 3, '2017-04-22 04:26:49', '2017-04-22 04:26:49', 5, 5, '00.00'),
(5, 1, 4, 2, '1492835217387', '1000gram', 4, 3, '2017-04-22 04:26:58', '2017-04-22 04:26:58', 5, 5, '09.21'),
(6, 1, 4, 1, '1492835217387', '1Kg', 5, 1, '2017-04-22 04:26:58', '2017-04-22 04:26:58', 5, 5, '09.21'),
(7, 1, 4, 1, '1492835543180', '1Kg', 7, 1, '2017-04-22 04:32:24', '2017-04-22 04:32:24', 5, 5, '22.52'),
(8, 1, 4, 2, '1492835543180', '1000gram', 2, 4, '2017-04-22 04:32:24', '2017-04-22 04:32:24', 5, 5, '22.52'),
(9, 1, 7, 2, '1492835549916', '3.280 Foot', 7, 2, '2017-04-22 04:32:30', '2017-04-22 04:32:30', 5, 5, '28.86'),
(10, 1, 7, 1, '1492835549916', '1 Meter', 8, 3, '2017-04-22 04:32:30', '2017-04-22 04:32:30', 5, 5, '28.86'),
(11, 1, 6, 2, '1492835562436', '1.609 Kilo meter', 4, 1, '2017-04-22 04:32:43', '2017-04-22 04:32:43', 5, 5, '41.39'),
(12, 1, 6, 1, '1492835562436', '1 Mile', 5, 2, '2017-04-22 04:32:43', '2017-04-22 04:32:43', 5, 5, '41.39'),
(13, 1, 5, 2, '1492835567021', '4.184Joule', 8, 1, '2017-04-22 04:32:47', '2017-04-22 04:32:47', 5, 5, '45.94'),
(14, 1, 5, 1, '1492835567021', '1calorie', 9, 1, '2017-04-22 04:32:47', '2017-04-22 04:32:47', 5, 5, '45.94'),
(15, 1, 6, 1, '1492835586716', '1 Mile', 1, 2, '2017-04-22 04:33:07', '2017-04-22 04:33:07', 5, 5, '01:06.20'),
(16, 1, 6, 2, '1492835586716', '1.609 Kilo meter', 5, 4, '2017-04-22 04:33:08', '2017-04-22 04:33:08', 5, 5, '01:06.20'),
(17, 1, 5, 2, '1492835611420', '4.184Joule', 5, 3, '2017-04-22 04:33:32', '2017-04-22 04:33:32', 5, 5, '01:30.95'),
(18, 1, 5, 1, '1492835611420', '1calorie', 3, 2, '2017-04-22 04:33:32', '2017-04-22 04:33:32', 5, 5, '01:30.95'),
(19, 1, 4, 2, '1492835614604', '1000gram', 3, 3, '2017-04-22 04:33:37', '2017-04-22 04:33:37', 5, 5, '01:36.30'),
(20, 1, 4, 1, '1492835614604', '1Kg', 8, 2, '2017-04-22 04:33:38', '2017-04-22 04:33:38', 5, 5, '01:36.30'),
(21, 1, 4, 2, '1492835632572', '1000gram', 10, 4, '2017-04-22 04:33:53', '2017-04-22 04:33:53', 5, 5, '01:52.20'),
(22, 1, 4, 1, '1492835632572', '1Kg', 6, 4, '2017-04-22 04:33:53', '2017-04-22 04:33:53', 5, 5, '01:52.20'),
(23, 1, 7, 2, '1492835645933', '3.280 Foot', 2, 2, '2017-04-22 04:34:07', '2017-04-22 04:34:07', 5, 5, '02:05.33'),
(24, 1, 7, 1, '1492835645933', '1 Meter', 3, 4, '2017-04-22 04:34:07', '2017-04-22 04:34:07', 5, 5, '02:05.33');

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
(5, 'Samsher', 'sbr.mgr1@hotmail.com', '$2y$10$lexNQiet73KiRGErvTLSNeBTyhWMREZtzrUALkJiyyn5rUJ.gy5vK', '283W6gjSnnj2rPLgSbmQryM1vq5eW39ELBlKvC57c4n9hdVdOC4gtSSCxT4o', '2017-04-10 19:23:31', '2017-04-10 20:37:59', 5),
(7, 'sss', 'sss@sss.com', '$2y$10$7sD5KMoFz.RnIj6WeXNSDu/4YUjozRMaLqn6FUhBz7Ya/gBTKx5qO', 'a85x7IEJ2ntffnc3iRTilhGPuCYT5qUSRi7KjmJwoDEj4NvTmQAAl6pmUpEG', '2017-04-16 07:30:34', '2017-04-16 07:30:55', 6),
(8, 'Samsher', 'sbr.mgr121@hotmail.com', '$2y$10$iPggsgyQCO75k1U9e51ZbeYRSXkbscODziOwZQXHF8t0O84HYxrEW', NULL, '2017-04-19 19:44:38', '2017-04-19 19:44:38', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `wd_admins`
--
ALTER TABLE `wd_admins`
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
-- AUTO_INCREMENT for table `wd_common_question`
--
ALTER TABLE `wd_common_question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `wd_extra_answer`
--
ALTER TABLE `wd_extra_answer`
  MODIFY `answer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `wd_matrix_table`
--
ALTER TABLE `wd_matrix_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=281;
--
-- AUTO_INCREMENT for table `wd_matrix_table_ans`
--
ALTER TABLE `wd_matrix_table_ans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wd_users`
--
ALTER TABLE `wd_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

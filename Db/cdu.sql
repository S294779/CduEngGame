-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 22, 2017 at 04:52 AM
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
(1, 'admin', 'admin@gmail.com', '$2y$10$/R2UzamxvJ91eLzxenr.de4eLOcqpA4zDuwXGNCB2vJ2pW.QR6cFC', 'TuwhskzKQZe6Tljw4Qgq9jDTgrYG1diEsOi2puqwbdf02sKLHrk5Emwgc443', '2017-04-08 06:10:09', '2017-04-08 06:10:09');

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
(1, 'hi', 5, 1, '2017-05-16 23:43:40', NULL, 0),
(2, 'hello Bro', 5, 1, '2017-05-21 14:00:19', NULL, 0);

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
(4, 'What is the Solution for this Problem?', '{\"1\":\"What is the\",\"2\":\"Solution for this\",\"3\":\"Problem?\"}', '2017-05-16 23:06:13', '2017-05-16 23:06:19', 1);

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
(10, 'MAIL_SETTING_PASSWORD', 'uHdtPWCwOxkzQ6LQ/LEtzX0+L7ROLAqt', 'mail password for mail setting'),
(11, 'MAIL_SETTING_MAIL_FROM_ADDR', 'bbstha143@gmail.com', 'mail from address for mail setting'),
(12, 'MAIL_SETTING_MAIL_FROM_NAME', 'CDU', 'mail from name for mail setting'),
(13, 'GAME_PLAYING_TIME', '[{\"from\":\"16:00\",\"to\":\"00:00\"},{\"from\":\"07:45\",\"to\":\"20:30\"}]', 'times for playing game');

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
(1, '1st group', 'This is first group', '2017-05-11 13:49:15', '2017-05-21 14:25:31', 1),
(3, '2nd Group', 'This is Second Group', '2017-05-21 14:25:50', '2017-05-21 14:25:50', 1);

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
(1, '1st group', 1, '[{\"student_id\":4,\"student_name\":\"Bishal Shrestha\",\"answer_count\":0},{\"student_id\":5,\"student_name\":\"anil\",\"answer_count\":0}]', '0:0:0.0', 'Find the pair in the pair of units that measure the same dimension', 0, '0.00', '2017-05-13 15:27:09', '2017-05-22 00:24:14');

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
(44, 1, 13, '2017-05-21 14:26:40', '2017-05-21 14:26:40'),
(45, 3, 13, '2017-05-21 14:26:40', '2017-05-21 14:26:40');

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
(1820, 12, 8, 1, '1495375247523', 'l ', 1, 1, '2017-05-21 14:20:13', '2017-05-21 14:20:13', 0),
(1821, 12, 7, 2, '1495375247510', 'Lbf', 2, 1, '2017-05-21 14:20:14', '2017-05-21 14:20:14', 0),
(1822, 12, 9, 1, '1495375247534', 'pa', 3, 1, '2017-05-21 14:20:14', '2017-05-21 14:20:14', 0),
(1823, 12, 3, 1, '1495375247470', 'in', 4, 1, '2017-05-21 14:20:14', '2017-05-21 14:20:14', 0),
(1824, 12, 4, 2, '1495375247485', 'lbm', 5, 1, '2017-05-21 14:20:14', '2017-05-21 14:20:14', 0),
(1825, 12, 4, 1, '1495375247485', 'kg', 1, 2, '2017-05-21 14:20:14', '2017-05-21 14:20:14', 1),
(1826, 12, 11, 1, '1495375247543', 'kWh', 2, 2, '2017-05-21 14:20:14', '2017-05-21 14:20:14', 0),
(1827, 12, 2, 1, '1495375247462', 'm', 3, 2, '2017-05-21 14:20:14', '2017-05-21 14:20:14', 1),
(1828, 12, 5, 2, '1495375247494', 'R', 4, 2, '2017-05-21 14:20:14', '2017-05-21 14:20:14', 0),
(1829, 12, 2, 2, '1495375247462', 'Ft', 5, 2, '2017-05-21 14:20:14', '2017-05-21 14:20:14', 0),
(1830, 12, 8, 2, '1495375247523', 'Gal', 1, 3, '2017-05-21 14:20:14', '2017-05-21 14:20:14', 0),
(1831, 12, 1, 1, '1495375247453', 'Kj', 2, 3, '2017-05-21 14:20:14', '2017-05-21 14:20:14', 0),
(1832, 12, 11, 2, '1495375247543', 'J', 3, 3, '2017-05-21 14:20:14', '2017-05-21 14:20:14', 0),
(1833, 12, 9, 2, '1495375247534', 'torr', 4, 3, '2017-05-21 14:20:14', '2017-05-21 14:20:14', 0),
(1834, 12, 6, 1, '1495375247503', 's', 5, 3, '2017-05-21 14:20:14', '2017-05-21 14:20:14', 0),
(1835, 12, 7, 1, '1495375247510', 'n', 1, 4, '2017-05-21 14:20:14', '2017-05-21 14:20:14', 0),
(1836, 12, 6, 2, '1495375247503', 'h', 2, 4, '2017-05-21 14:20:14', '2017-05-21 14:20:14', 0),
(1837, 12, 5, 1, '1495375247494', 'K', 3, 4, '2017-05-21 14:20:14', '2017-05-21 14:20:14', 0),
(1838, 12, 1, 2, '1495375247453', 'Btu', 4, 4, '2017-05-21 14:20:14', '2017-05-21 14:20:14', 0),
(1839, 12, 3, 2, '1495375247470', 'cm', 5, 4, '2017-05-21 14:20:14', '2017-05-21 14:20:14', 0),
(1870, 13, 1, 2, '1495376368997', '947.817 BTU', 1, 1, '2017-05-21 14:26:39', '2017-05-21 14:26:39', 0),
(1871, 13, 12, 2, '1495376369070', '0.035 Ounce', 2, 1, '2017-05-21 14:26:39', '2017-05-21 14:26:39', 0),
(1872, 13, 2, 2, '1495376369004', '418.4 KJ', 3, 1, '2017-05-21 14:26:39', '2017-05-21 14:26:39', 0),
(1873, 13, 4, 2, '1495376369016', '100m', 4, 1, '2017-05-21 14:26:39', '2017-05-21 14:26:39', 0),
(1874, 13, 15, 2, '1495376369089', '5280 Foot', 5, 1, '2017-05-21 14:26:39', '2017-05-21 14:26:39', 0),
(1875, 13, 8, 1, '1495376369045', '900 C', 6, 1, '2017-05-21 14:26:39', '2017-05-21 14:26:39', 0),
(1876, 13, 5, 1, '1495376369025', '100 Kg', 1, 2, '2017-05-21 14:26:39', '2017-05-21 14:26:39', 0),
(1877, 13, 11, 2, '1495376369065', '3.28 ft/s', 2, 2, '2017-05-21 14:26:39', '2017-05-21 14:26:39', 0),
(1878, 13, 1, 1, '1495376368997', '1000KJ', 3, 2, '2017-05-21 14:26:39', '2017-05-21 14:26:39', 0),
(1879, 13, 3, 2, '1495376369009', '10ft', 4, 2, '2017-05-21 14:26:39', '2017-05-21 14:26:39', 0),
(1880, 13, 13, 2, '1495376369077', '1000 g', 5, 2, '2017-05-21 14:26:39', '2017-05-21 14:26:39', 0),
(1881, 13, 11, 1, '1495376369065', '1 m/s', 6, 2, '2017-05-21 14:26:39', '2017-05-21 14:26:39', 0),
(1882, 13, 2, 1, '1495376369004', '100 KCal', 1, 3, '2017-05-21 14:26:39', '2017-05-21 14:26:39', 0),
(1883, 13, 9, 2, '1495376369051', '1162.13 F', 2, 3, '2017-05-21 14:26:39', '2017-05-21 14:26:39', 0),
(1884, 13, 5, 2, '1495376369025', '0.1 Ton', 3, 3, '2017-05-21 14:26:39', '2017-05-21 14:26:39', 0),
(1885, 13, 7, 1, '1495376369039', '0.5 Bar', 4, 3, '2017-05-21 14:26:40', '2017-05-21 14:26:40', 0),
(1886, 13, 3, 1, '1495376369009', '0.93 m', 5, 3, '2017-05-21 14:26:40', '2017-05-21 14:26:40', 0),
(1887, 13, 8, 2, '1495376369045', '1652 F', 6, 3, '2017-05-21 14:26:40', '2017-05-21 14:26:40', 0),
(1888, 13, 4, 1, '1495376369016', '119.6 yard', 1, 4, '2017-05-21 14:26:40', '2017-05-21 14:26:40', 0),
(1889, 13, 6, 1, '1495376369030', '100 Pa', 2, 4, '2017-05-21 14:26:40', '2017-05-21 14:26:40', 1),
(1890, 13, 7, 2, '1495376369039', '50000 Pa', 3, 4, '2017-05-21 14:26:40', '2017-05-21 14:26:40', 0),
(1891, 13, 10, 2, '1495376369058', '1.47 ft/s', 4, 4, '2017-05-21 14:26:40', '2017-05-21 14:26:40', 0),
(1892, 13, 15, 1, '1495376369089', '1 Mile', 5, 4, '2017-05-21 14:26:40', '2017-05-21 14:26:40', 0),
(1893, 13, 6, 2, '1495376369030', '0.75 Torr', 6, 4, '2017-05-21 14:26:40', '2017-05-21 14:26:40', 0),
(1894, 13, 12, 1, '1495376369070', '1 g', 1, 5, '2017-05-21 14:26:40', '2017-05-21 14:26:40', 0),
(1895, 13, 9, 1, '1495376369051', '901 k', 2, 5, '2017-05-21 14:26:40', '2017-05-21 14:26:40', 0),
(1896, 13, 13, 1, '1495376369077', '1 Kg', 3, 5, '2017-05-21 14:26:40', '2017-05-21 14:26:40', 0),
(1897, 13, 14, 1, '1495376369084', '1 Km', 4, 5, '2017-05-21 14:26:40', '2017-05-21 14:26:40', 1),
(1898, 13, 14, 2, '1495376369084', '1000 m', 5, 5, '2017-05-21 14:26:40', '2017-05-21 14:26:40', 0),
(1899, 13, 10, 1, '1495376369058', '1 mi/h', 6, 5, '2017-05-21 14:26:40', '2017-05-21 14:26:40', 1);

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
(12, 'Find the pair of units in different systems that describe the same dimensions', 4, '2017-05-16 23:12:45', '2017-05-21 13:57:31', 5, 4),
(13, 'Find the pair in the pair of units that measure the same dimension', 4, '2017-05-21 14:15:20', '2017-05-21 14:15:20', 6, 5);

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
(749, 12, 1, 1, 'Kj', '2017-05-21 14:20:13', '2017-05-21 14:20:13'),
(750, 12, 1, 2, 'Btu', '2017-05-21 14:20:13', '2017-05-21 14:20:13'),
(751, 12, 2, 1, 'm', '2017-05-21 14:20:13', '2017-05-21 14:20:13'),
(752, 12, 2, 2, 'Ft', '2017-05-21 14:20:13', '2017-05-21 14:20:13'),
(753, 12, 3, 1, 'in', '2017-05-21 14:20:13', '2017-05-21 14:20:13'),
(754, 12, 3, 2, 'cm', '2017-05-21 14:20:13', '2017-05-21 14:20:13'),
(755, 12, 4, 1, 'kg', '2017-05-21 14:20:13', '2017-05-21 14:20:13'),
(756, 12, 4, 2, 'lbm', '2017-05-21 14:20:13', '2017-05-21 14:20:13'),
(757, 12, 5, 1, 'K', '2017-05-21 14:20:13', '2017-05-21 14:20:13'),
(758, 12, 5, 2, 'R', '2017-05-21 14:20:13', '2017-05-21 14:20:13'),
(759, 12, 6, 1, 's', '2017-05-21 14:20:13', '2017-05-21 14:20:13'),
(760, 12, 6, 2, 'h', '2017-05-21 14:20:13', '2017-05-21 14:20:13'),
(761, 12, 7, 1, 'n', '2017-05-21 14:20:13', '2017-05-21 14:20:13'),
(762, 12, 7, 2, 'Lbf', '2017-05-21 14:20:13', '2017-05-21 14:20:13'),
(763, 12, 8, 1, 'l ', '2017-05-21 14:20:13', '2017-05-21 14:20:13'),
(764, 12, 8, 2, 'Gal', '2017-05-21 14:20:13', '2017-05-21 14:20:13'),
(765, 12, 9, 2, 'torr', '2017-05-21 14:20:13', '2017-05-21 14:20:13'),
(766, 12, 9, 1, 'pa', '2017-05-21 14:20:13', '2017-05-21 14:20:13'),
(767, 12, 11, 1, 'kWh', '2017-05-21 14:20:13', '2017-05-21 14:20:13'),
(768, 12, 11, 2, 'J', '2017-05-21 14:20:13', '2017-05-21 14:20:13'),
(799, 13, 1, 1, '1000KJ', '2017-05-21 14:26:37', '2017-05-21 14:26:37'),
(800, 13, 1, 2, '947.817 BTU', '2017-05-21 14:26:37', '2017-05-21 14:26:37'),
(801, 13, 2, 1, '100 KCal', '2017-05-21 14:26:37', '2017-05-21 14:26:37'),
(802, 13, 2, 2, '418.4 KJ', '2017-05-21 14:26:37', '2017-05-21 14:26:37'),
(803, 13, 3, 1, '0.93 m', '2017-05-21 14:26:37', '2017-05-21 14:26:37'),
(804, 13, 3, 2, '10ft', '2017-05-21 14:26:37', '2017-05-21 14:26:37'),
(805, 13, 4, 2, '100m', '2017-05-21 14:26:37', '2017-05-21 14:26:37'),
(806, 13, 4, 1, '119.6 yard', '2017-05-21 14:26:37', '2017-05-21 14:26:37'),
(807, 13, 5, 1, '100 Kg', '2017-05-21 14:26:37', '2017-05-21 14:26:37'),
(808, 13, 5, 2, '0.1 Ton', '2017-05-21 14:26:37', '2017-05-21 14:26:37'),
(809, 13, 6, 1, '100 Pa', '2017-05-21 14:26:37', '2017-05-21 14:26:37'),
(810, 13, 6, 2, '0.75 Torr', '2017-05-21 14:26:38', '2017-05-21 14:26:38'),
(811, 13, 7, 1, '0.5 Bar', '2017-05-21 14:26:38', '2017-05-21 14:26:38'),
(812, 13, 7, 2, '50000 Pa', '2017-05-21 14:26:38', '2017-05-21 14:26:38'),
(813, 13, 8, 1, '900 C', '2017-05-21 14:26:38', '2017-05-21 14:26:38'),
(814, 13, 8, 2, '1652 F', '2017-05-21 14:26:38', '2017-05-21 14:26:38'),
(815, 13, 9, 1, '901 k', '2017-05-21 14:26:38', '2017-05-21 14:26:38'),
(816, 13, 9, 2, '1162.13 F', '2017-05-21 14:26:38', '2017-05-21 14:26:38'),
(817, 13, 10, 1, '1 mi/h', '2017-05-21 14:26:38', '2017-05-21 14:26:38'),
(818, 13, 10, 2, '1.47 ft/s', '2017-05-21 14:26:38', '2017-05-21 14:26:38'),
(819, 13, 11, 1, '1 m/s', '2017-05-21 14:26:38', '2017-05-21 14:26:38'),
(820, 13, 11, 2, '3.28 ft/s', '2017-05-21 14:26:38', '2017-05-21 14:26:38'),
(821, 13, 12, 1, '1 g', '2017-05-21 14:26:38', '2017-05-21 14:26:38'),
(822, 13, 12, 2, '0.035 Ounce', '2017-05-21 14:26:38', '2017-05-21 14:26:38'),
(823, 13, 13, 1, '1 Kg', '2017-05-21 14:26:38', '2017-05-21 14:26:38'),
(824, 13, 13, 2, '1000 g', '2017-05-21 14:26:38', '2017-05-21 14:26:38'),
(825, 13, 14, 1, '1 Km', '2017-05-21 14:26:38', '2017-05-21 14:26:38'),
(826, 13, 14, 2, '1000 m', '2017-05-21 14:26:38', '2017-05-21 14:26:38'),
(827, 13, 15, 1, '1 Mile', '2017-05-21 14:26:38', '2017-05-21 14:26:38'),
(828, 13, 15, 2, '5280 Foot', '2017-05-21 14:26:39', '2017-05-21 14:26:39');

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
(4, 'Bishal Shrestha', 'bsal@gmail.com', '$2y$10$wVWdKfFHO0cBQ8Hzyeb8WuZDhMwDtL4HQ4qxWCew6061.hXgtKfza', 'AiWqXtCK6qxG0qE5oEvgulgupHG2fhKImB7xOIPeG3Uzjr0LMH13WxGUR1hG', '2017-05-16 13:23:39', '2017-05-16 13:23:43', 1, 'Australia/Darwin'),
(5, 'anil', 'anil@gmail.com', '$2y$10$fOLF5hkmFnq7rUI7Z2bWLeiaIP3EP62vi14s/b.HqAAptnYaCCAy6', 'Z7PFiXSeDjDSNVA7KqVlQ27Bzm9jH0NnIf6hORoxigHfJMQhHCDOFVftG5Cf', '2017-05-16 13:43:03', '2017-05-16 13:43:08', 1, 'Australia/Darwin');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `wd_common_question`
--
ALTER TABLE `wd_common_question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `wd_extra_answer`
--
ALTER TABLE `wd_extra_answer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wd_general_setting`
--
ALTER TABLE `wd_general_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `wd_group`
--
ALTER TABLE `wd_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `wd_group_progress`
--
ALTER TABLE `wd_group_progress`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `wd_group_question`
--
ALTER TABLE `wd_group_question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;
--
-- AUTO_INCREMENT for table `wd_matrix_table`
--
ALTER TABLE `wd_matrix_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1900;
--
-- AUTO_INCREMENT for table `wd_matrix_table_ans`
--
ALTER TABLE `wd_matrix_table_ans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `wd_question_options`
--
ALTER TABLE `wd_question_options`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=829;
--
-- AUTO_INCREMENT for table `wd_users`
--
ALTER TABLE `wd_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

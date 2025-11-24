-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 15, 2024 at 12:18 PM
-- Server version: 8.2.0
-- PHP Version: 8.2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `portal`
--

-- --------------------------------------------------------

--
-- Table structure for table `agent_list`
--

DROP TABLE IF EXISTS `agent_list`;
CREATE TABLE IF NOT EXISTS `agent_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `mobile` bigint NOT NULL,
  `whatsapp` bigint NOT NULL,
  `company_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `company_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `company_website` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `comission` int NOT NULL,
  `status` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=115 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `agent_list`
--

INSERT INTO `agent_list` (`id`, `type`, `name`, `email`, `mobile`, `whatsapp`, `company_name`, `company_address`, `company_website`, `comission`, `status`) VALUES
(101, 1, 'Yogesh', 'yogesh@bafna.net', 9902012547, 9902012547, 'Moti Corporation', 'Hebbal, Bangalore', 'www.moticorporation.com', 30, 1),
(102, 0, 'Pradeep', 'test@test', 1234567890, 1234567890, '', '', '', 0, 0),
(103, 0, 'Gautam', 'gautam@bafna.net', 1234567891, 1234567891, '', '', '', 0, 0),
(104, 0, 'Jasintha', 'jasi@test.com', 1234567892, 1234567892, '', '', '', 0, 0),
(105, 0, 'Rahul', 'rahul@test', 1234567893, 1234567893, '', '', '', 0, 0),
(106, 0, 'Rakesh', 'rakesh@test', 1234567894, 1234567894, '', '', '', 0, 0),
(107, 0, 'test', 'test@test.com', 1212, 1212, '', '', '', 20, 1),
(108, 0, 'Rajesh', 'rajesh@test.com', 12154, 12154, '', '', '', 0, 0),
(109, 0, 'Yogesh B', 'yogesh@test.com', 9902012548, 9902012548, '', '', '', 0, 0),
(110, 0, 'Yogesh G', 'gyogesh@test.com', 9902012549, 9902012549, '', '', '', 0, 0),
(111, 0, 'Yogesh G', 'gyogesh1@test.com', 9902012540, 9902012540, '', '', '', 0, 0),
(112, 0, 'Pradeep k', 'pk@test', 12457, 12457, '', '', '', 0, 0),
(113, 0, 'Pradeepk', 'pkr@test', 1478, 1478, '', '', '', 0, 0),
(114, 1, 'pks', 'pks@test', 1256, 1256, 'test', 'test', 'test.com', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `callback_list`
--

DROP TABLE IF EXISTS `callback_list`;
CREATE TABLE IF NOT EXISTS `callback_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `lead_id` int NOT NULL,
  `callback_datentime` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `callback_list`
--

INSERT INTO `callback_list` (`id`, `lead_id`, `callback_datentime`) VALUES
(1, 1, 1717843920),
(2, 1, 1717931100),
(3, 1, 1718105760),
(4, 1, 1717841520),
(5, 1, 1718429460);

-- --------------------------------------------------------

--
-- Table structure for table `country_list`
--

DROP TABLE IF EXISTS `country_list`;
CREATE TABLE IF NOT EXISTS `country_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `currency` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `country_list`
--

INSERT INTO `country_list` (`id`, `name`, `currency`) VALUES
(1, 'usa', 'usd'),
(2, 'uk', 'gbp'),
(3, 'canada', 'cad'),
(4, 'germany', 'pound');

-- --------------------------------------------------------

--
-- Table structure for table `course_list`
--

DROP TABLE IF EXISTS `course_list`;
CREATE TABLE IF NOT EXISTS `course_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `intake` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `duration` int NOT NULL,
  `eligibility` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `university_id` int NOT NULL,
  `fee` int NOT NULL,
  `scholarship_available` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `course_list`
--

INSERT INTO `course_list` (`id`, `name`, `type`, `intake`, `duration`, `eligibility`, `university_id`, `fee`, `scholarship_available`) VALUES
(1, 'Bsc (HONS) Accounting & Finance', 'Undergraduate', 'jan', 36, '10th', 1, 15900, 1),
(2, 'Bsc (HONS) Architecture', 'Undergraduate', 'jan', 35, '12th', 1, 16700, 0),
(3, 'Bsc (HONS) Artificial Intelligence', 'Undergraduate', 'Sep', 36, '12th', 1, 16700, 0),
(4, 'Bsc (HONS) Banking & Finance', 'Undergraduate', 'Sep', 36, '12th', 1, 15900, 0),
(5, 'Bsc (HONS) Biomedical Science', 'Undergraduate', 'Sep', 36, '12th', 1, 16700, 0),
(6, 'Bsc(HONS) Computer Games Technology', 'Undergraduate', 'Sep', 36, '12th', 1, 15900, 0),
(7, 'Msc Mechanical Engineering', 'Postgraduate', 'Sep', 24, 'Bachelor', 1, 17700, 0),
(8, 'MAarch Architecture', 'Postgraduate', 'Sep', 24, 'Bachelor', 1, 17700, 0),
(9, 'MSC Automation & Robotics', 'Postgraduate', 'jan', 12, 'Bachelor', 1, 17700, 0),
(10, 'MSC Applied Bioscience', 'Postgraduate', 'jan', 15, 'Bachelor', 1, 17700, 0),
(11, 'MSC Artificial Intelligence', 'Postgraduate', 'Sep', 12, 'Bachelor', 1, 17700, 0),
(12, 'MSC Computer Science', 'Postgraduate', 'jan', 20, 'Bachelor', 1, 17700, 0),
(13, 'Bsc (HONS) Actuarial Science', 'Undergraduate', 'Sep', 36, '12th', 2, 24500, 0),
(14, 'Bsc (HONS) Accounting & Finance', 'Undergraduate', 'Sep', 36, '12th', 2, 24500, 0),
(15, 'MEng (HONS) Aeronautical Engineering', 'Undergraduate', 'Sep', 48, '12th', 2, 20760, 0),
(16, 'Bsc (HONS) Banking & International Finance', 'Undergraduate', 'Sep', 36, '12th', 2, 24500, 0),
(17, 'Bsc (HONS) Business Management', 'Undergraduate', 'Sep', 36, '12th', 2, 24500, 0),
(18, 'Msc Robotics, AI & Autonomous systems', 'Postgraduate', 'Sep', 12, 'Bachelor', 2, 21800, 0),
(19, 'Msc Business Economics/ International Business Economics', 'Postgraduate', 'Sep', 12, 'Bachelor', 2, 20910, 0),
(20, 'MA Marketting Communications', 'Postgraduate', 'Sep', 12, 'Bachelor', 2, 21650, 0),
(21, 'MA international Journalism', 'Postgraduate', 'Sep', 12, 'Bachelor', 2, 24400, 0),
(22, 'Msc Psychology', 'Postgraduate', 'Sep', 12, 'Bachelor', 2, 18200, 0),
(23, 'Animation BA (HONS)', 'Undergraduate', 'Sep', 36, '12th', 3, 16250, 0),
(24, 'Architecture BA (HONS)', 'Undergraduate', 'Sep', 36, '12th', 3, 15750, 0),
(25, 'Business Management BA (HONS)', 'Undergraduate', 'Sep', 36, '12th', 3, 15750, 0),
(26, 'Accounting & Economics BA (HONS)', 'Undergraduate', 'Sep', 36, '12th', 3, 15250, 0),
(27, 'Advertising and Marketing Communications BA (HONS)', 'Undergraduate', 'Sep', 36, '12th', 3, 15750, 0),
(28, 'Finance & Banking Msc', 'Postgraduate', 'Sep', 12, 'Bachelor', 3, 17950, 0),
(29, 'International Commercial Law & Practice LLM', 'Postgraduate', 'Sep', 12, 'Bachelor', 3, 17950, 0),
(30, 'Advanced Biomedical Science MSc/PG Dip/PG Cert', 'Postgraduate', 'Sep', 12, 'Bachelor', 3, 16800, 0),
(31, 'Architecture MArch', 'Postgraduate', 'Sep', 24, 'Bachelor', 3, 15750, 0),
(32, 'Computing MSc/PG Dip/PG Cert', 'Postgraduate', 'jan', 18, 'Bachelor', 3, 17600, 0),
(33, 'BA (Hons) Accounting', 'Undergraduate', 'Sep', 48, '12th', 4, 14170, 0),
(34, 'BSc (Hons) Biomedical Science', 'Undergraduate', 'Sep', 48, '12th', 4, 16680, 0),
(35, 'BSc/BSc (Hons) Architectural Technology', 'Undergraduate', 'Sep', 48, '12th', 4, 16680, 0),
(36, 'BA/BA (Hons) Business Management', 'Undergraduate', 'Sep', 48, '12th', 4, 14170, 0),
(37, 'Msc Accounting', 'Postgraduate', 'Sep', 12, 'Bachelor', 4, 18800, 0),
(38, 'MSc International Marketing (Dual Degree)', 'Postgraduate', 'Sep', 12, 'Bachelor', 4, 18800, 0),
(39, 'MSc Medical Biology', 'Postgraduate', 'Sep', 12, 'Bachelor', 4, 18800, 0),
(40, 'MBA', 'Postgraduate', 'Sep', 12, 'Bachelor', 4, 18540, 0),
(41, 'MSc Advanced Structural Engineering', 'Postgraduate', 'Sep', 12, 'Bachelor', 4, 18800, 0),
(42, 'Business Management BSc', 'Undergraduate', 'Sep', 36, '12th', 5, 33450, 0),
(43, 'Law LLB', 'Undergraduate', 'Sep', 36, '12th', 5, 29472, 0),
(44, 'Physiotherapy BSc', 'Undergraduate', 'Sep', 36, '12th', 5, 33450, 0),
(45, 'Global Health & Social Medicine BA', 'Undergraduate', 'Sep', 36, '12th', 5, 25284, 0),
(46, 'Accounting & Finance BSc', 'Undergraduate', 'Sep', 36, '12th', 5, 33450, 0),
(47, 'Advanced Software Engineering MSc', 'Postgraduate', 'Sep', 12, 'Bachelor', 5, 35244, 0),
(48, 'Mental Health, Ethics and Law MSc', 'Postgraduate', 'Sep', 12, 'Bachelor', 5, 29472, 0),
(49, 'Modern Literature & Culture MA', 'Postgraduate', 'Sep', 12, 'Bachelor', 5, 27996, 0),
(50, 'Management & Technological Change MSc', 'Postgraduate', 'Sep', 12, 'Bachelor', 5, 33450, 0),
(51, 'Digital Asset & Media Management MA', 'Postgraduate', 'Sep', 12, 'Bachelor', 5, 31368, 0),
(52, 'Digital Business Management - BSc (Hons)', 'Undergraduate', 'Sep', 36, '12th', 6, 15576, 0),
(53, 'Architecture (Top-up) - BA (Hons)', 'Undergraduate', 'Sep', 12, '12th', 6, 19250, 0),
(54, 'Architecture - BA (Hons)', 'Undergraduate', 'Sep', 36, '12th', 6, 17110, 0),
(55, 'Fashion Marketing and Journalism - BA (Hons)', 'Undergraduate', 'Sep', 36, '12th', 6, 17600, 0),
(56, 'Business Management - BA (Hons)', 'Undergraduate', 'Sep', 36, '12th', 6, 17600, 0),
(57, 'Artificial Intelligence - MSc', 'Postgraduate', 'Sep', 12, 'Bachelor', 6, 18150, 0),
(58, 'Creative, Digital and Professional Writing - MA', 'Postgraduate', 'Sep', 12, 'Bachelor', 6, 18150, 0),
(59, 'Criminology - MSc', 'Postgraduate', 'Sep', 12, 'Bachelor', 6, 18150, 0),
(60, 'Architecture - MA', 'Postgraduate', 'Sep', 12, 'Bachelor', 6, 16330, 0),
(61, 'Biomedical Science - MSc', 'Postgraduate', 'Sep', 12, 'Bachelor', 6, 18150, 0),
(62, 'Graphic Design BA (Hons)', 'Undergraduate', 'Sep', 36, '12th', 7, 17900, 0),
(63, 'Computer Science (Artificial Intelligence) BSc (Hons)', 'Undergraduate', 'Sep', 36, '12th', 7, 17150, 0),
(64, 'Accounting and Finance BSc (Hons)', 'Undergraduate', 'Sep', 36, '12th', 7, 17150, 0),
(65, 'Animation BA (Hons)', 'Undergraduate', 'Sep', 36, '12th', 7, 17150, 0),
(66, 'Biological Sciences BSc (Hons)', 'Undergraduate', 'Sep', 36, '12th', 7, 17150, 0),
(67, 'Biomedical Science MSc', 'Postgraduate', 'Sep', 12, 'Bachelor', 7, 19850, 0),
(68, 'Biotechnology MSc', 'Postgraduate', 'Sep', 12, 'Bachelor', 7, 19850, 0),
(69, 'Finance (2yr) MSc', 'Postgraduate', 'Sep', 12, 'Bachelor', 7, 22100, 0),
(70, 'Management and International Business MSc', 'Postgraduate', 'Sep', 12, 'Bachelor', 7, 21000, 0),
(71, 'Psychology MSc', 'Postgraduate', 'Sep', 12, 'Bachelor', 7, 17500, 0),
(72, 'Business Management BA (Hons)', 'Undergraduate', 'Sep', 36, '12th', 8, 14000, 0),
(73, 'Digital Marketing BA (Hons)', 'Undergraduate', 'Sep', 36, '12th', 8, 14000, 0),
(74, 'Events Management BA (Hons)', 'Undergraduate', 'Sep', 36, '12th', 8, 13500, 0),
(75, 'Finance and Accounting BSc (Hons)', 'Undergraduate', 'Sep', 48, '12th', 8, 14000, 0),
(76, 'Health and Social Care BSc (Hons)', 'Undergraduate', 'Sep', 36, '12th', 8, 14000, 0),
(77, 'Education and Learning MA', 'Postgraduate', 'Sep', 18, 'Bachelor', 8, 11000, 0),
(78, 'Enterprise Management MSc', 'Postgraduate', 'Sep', 12, 'Bachelor', 8, 15000, 0),
(79, 'Hospitality with Tourism Management MSc', 'Postgraduate', 'Sep', 24, 'Bachelor', 8, 15000, 0),
(80, 'Aviation Management MSc', 'Postgraduate', 'Sep', 18, 'Bachelor', 8, 15000, 0),
(81, 'Finance and Accounting MSc', 'Postgraduate', 'Sep', 12, 'Bachelor', 8, 15000, 0),
(82, 'BSc (Hons) Construction Management', 'Undergraduate', 'Sep', 36, '12th', 9, 16000, 0),
(83, 'BSc (Hons) Data Science and Artificial Intelligence', 'Undergraduate', 'Sep', 36, '12th', 9, 16000, 0),
(84, 'BSc (Hons) Architectural Technology', 'Undergraduate', 'Sep', 36, '12th', 9, 16000, 0),
(85, 'BSc (Hons) Audio Engineering', 'Undergraduate', 'Sep', 36, '12th', 9, 14000, 0),
(86, 'BA (Hons) Business and Management', 'Undergraduate', 'Sep', 36, '12th', 9, 16000, 0),
(87, 'MSc Construction Management', 'Postgraduate', 'Sep', 12, 'Bachelor', 9, 17500, 0),
(88, 'MSc Civil Engineering', 'Postgraduate', 'Sep', 12, 'Bachelor', 9, 17500, 0),
(89, 'MSc International Events Management', 'Postgraduate', 'Sep', 12, 'Bachelor', 9, 17500, 0),
(90, 'MSc Information and Technology', 'Postgraduate', 'Sep', 12, 'Bachelor', 9, 17500, 0),
(91, 'MSc Accounting and Finance', 'Postgraduate', 'Sep', 12, 'Bachelor', 9, 17500, 0),
(92, 'Law with Criminology, LLB Hons', 'Undergraduate', 'Sep', 36, '12th', 10, 17000, 0),
(93, 'Pharmaceutical Sciences, BSc (Hons)', 'Undergraduate', 'Sep', 36, '12th', 10, 17000, 0),
(94, 'Mathematics and Computing, BSc (Hons)', 'Undergraduate', 'Sep', 36, '12th', 10, 15100, 0),
(95, 'Animation, BA (Hons)', 'Undergraduate', 'Sep', 36, '12th', 10, 17000, 0),
(96, 'Accounting and Finance, BA (Hons)', 'Undergraduate', 'Sep', 36, '12th', 10, 17000, 0),
(97, 'Computer Science, MSc', 'Postgraduate', 'Sep', 12, 'Bachelor', 10, 18150, 0),
(98, 'International Events Management, MA', 'Postgraduate', 'Sep', 12, 'Bachelor', 10, 18150, 0),
(99, 'International Business, MBA', 'Postgraduate', 'Sep', 24, 'Bachelor', 10, 19975, 0),
(100, 'Accounting and Finance, MSc', 'Postgraduate', 'Sep', 12, 'Bachelor', 10, 18150, 0);

-- --------------------------------------------------------

--
-- Table structure for table `document_list`
--

DROP TABLE IF EXISTS `document_list`;
CREATE TABLE IF NOT EXISTS `document_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `uploaded_file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_required` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `document_list`
--

INSERT INTO `document_list` (`id`, `name`, `uploaded_file_name`, `is_required`) VALUES
(1, '10th Markssheet', '10th_makrkssheet', 0),
(2, '10th Certificate', '10th_certificate', 0),
(3, '10+2 Markssheet', '12th_markssheet', 0),
(4, '10+2 Certificate', '12th_certificate', 0),
(5, 'Graduation Markssheet', 'graduation_markssheet', 0),
(6, 'Graduation Certificate', 'graduation_certificate', 0),
(7, 'Passport', 'passport', 1),
(8, 'IELTS Score Card', 'ielts_score_card', 1);

-- --------------------------------------------------------

--
-- Table structure for table `leads_activity_history`
--

DROP TABLE IF EXISTS `leads_activity_history`;
CREATE TABLE IF NOT EXISTS `leads_activity_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `lead_id` int NOT NULL,
  `status_id` int NOT NULL,
  `comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `activity_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `datentime` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `leads_activity_history`
--

INSERT INTO `leads_activity_history` (`id`, `lead_id`, `status_id`, `comment`, `activity_by`, `datentime`) VALUES
(1, 1, 1, 'created', 'student', 1717668883),
(2, 1, 1, 'Documents Uploaded', 'Portal User', 1717668894),
(3, 1, 1, 'profile updated', 'admin', 1717670507),
(4, 1, 1, 'Documents Uploaded', 'Portal User', 1717670533),
(5, 1, 1, 'profile updated', 'admin', 1717670806),
(6, 1, 1, 'Documents Uploaded', 'Portal User', 1717671058),
(7, 1, 1, 'Student wants callback', '', 1717671169),
(8, 1, 1, 'profile updated', 'admin', 1717671374),
(9, 1, 1, 'assigned to Pradeep Ranka', 'admin', 1717671653),
(10, 1, 1, 'Student wants callback', 'Pradeep Ranka', 1717671929),
(11, 1, 2, 'Status Updated', 'Admin', 1717672538),
(12, 1, 2, 'assigned to Jasi', 'admin', 1717673741),
(13, 1, 2, 'Student wants callback', 'Jasi', 1717673771),
(14, 1, 2, 'assigned to Pradeep Ranka', 'admin', 1717754550),
(15, 1, 2, 'profile updated', 'admin', 1717755065),
(16, 1, 3, 'Status Updated', 'Admin', 1717755079),
(17, 1, 3, 'Documents Uploaded', 'Portal User', 1717755124),
(18, 1, 3, 'Student wants callback', 'Pradeep Ranka', 1717755154),
(19, 2, 1, 'created', 'student', 1717759219),
(20, 2, 1, 'Documents Uploaded', 'Portal User', 1717759228),
(21, 1, 3, 'profile updated', 'admin', 1718173204),
(22, 1, 3, 'assigned to Yogesh Bafna', 'admin', 1718256109),
(23, 1, 3, 'Student Wants Callback', 'Yogesh Bafna', 1718256734),
(24, 3, 1, 'created', 'student', 1718365440),
(25, 4, 1, 'created', 'student', 1718365725),
(26, 5, 1, 'created', 'student', 1718366126),
(27, 6, 1, 'created', 'student', 1718366174),
(28, 7, 1, 'created', 'student', 1718366204),
(29, 8, 1, 'created', 'student', 1718366229),
(30, 9, 1, 'created', 'student', 1718366307),
(31, 10, 1, 'created', 'student', 1718366393),
(32, 11, 1, 'created', 'student', 1718366428),
(33, 12, 1, 'created', 'student', 1718366495),
(34, 13, 1, 'created', 'student', 1718366533),
(35, 14, 1, 'created', 'student', 1718366554),
(36, 15, 1, 'created', 'student', 1718366813),
(37, 16, 1, 'created', 'student', 1718366853),
(38, 17, 1, 'created', 'student', 1718366889),
(39, 18, 1, 'created', 'student', 1718366895),
(40, 19, 1, 'created', 'student', 1718366905),
(41, 20, 1, 'created', 'student', 1718366912),
(42, 21, 1, 'created', 'student', 1718366969),
(43, 22, 1, 'created', 'student', 1718367265),
(44, 23, 1, 'created', 'student', 1718367449),
(45, 24, 1, 'created', 'student', 1718367482),
(46, 25, 1, 'created', 'student', 1718367535),
(47, 26, 1, 'created', 'student', 1718367607),
(48, 27, 1, 'created', 'student', 1718367774),
(49, 28, 1, 'created', 'student', 1718367831),
(50, 29, 1, 'created', 'student', 1718367851),
(51, 30, 1, 'created', 'student', 1718367868),
(52, 31, 1, 'created', 'student', 1718367904),
(53, 32, 1, 'created', 'student', 1718367915),
(54, 33, 1, 'created', 'student', 1718367930),
(55, 34, 1, 'created', 'student', 1718367947),
(56, 35, 1, 'created', 'student', 1718367983),
(57, 36, 1, 'created', 'student', 1718367996),
(58, 37, 1, 'created', 'student', 1718368075),
(59, 38, 1, 'created', 'student', 1718368103),
(60, 39, 1, 'created', 'student', 1718368115),
(61, 40, 1, 'created', 'student', 1718368121),
(62, 41, 1, 'created', 'student', 1718368127),
(63, 42, 1, 'created', 'student', 1718368132),
(64, 43, 1, 'created', 'student', 1718368138);

-- --------------------------------------------------------

--
-- Table structure for table `leads_details`
--

DROP TABLE IF EXISTS `leads_details`;
CREATE TABLE IF NOT EXISTS `leads_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `urn` int NOT NULL,
  `status_id` int NOT NULL,
  `student_id` int NOT NULL,
  `course_id` int NOT NULL,
  `datentime` int NOT NULL,
  `source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `leads_details`
--

INSERT INTO `leads_details` (`id`, `urn`, `status_id`, `student_id`, `course_id`, `datentime`, `source`) VALUES
(1, 948747, 3, 3, 8, 1717668883, 'CA Showcase'),
(2, 334640, 1, 4, 20, 1717759219, 'CA Showcase'),
(3, 670303, 1, 9, 2, 1718365440, 'CA Showcase'),
(4, 824487, 1, 10, 2, 1718365725, 'CA Showcase'),
(5, 140979, 1, 11, 2, 1718366126, 'CA Showcase'),
(6, 485087, 1, 12, 2, 1718366174, 'CA Showcase'),
(7, 332933, 1, 13, 2, 1718366204, 'CA Showcase'),
(8, 991468, 1, 14, 2, 1718366229, 'CA Showcase'),
(9, 727258, 1, 15, 2, 1718366307, 'CA Showcase'),
(10, 595884, 1, 16, 2, 1718366393, 'CA Showcase'),
(11, 566459, 1, 17, 2, 1718366428, 'CA Showcase'),
(12, 967747, 1, 18, 2, 1718366495, 'CA Showcase'),
(13, 893796, 1, 19, 2, 1718366533, 'CA Showcase'),
(14, 236638, 1, 20, 2, 1718366554, 'CA Showcase'),
(15, 912648, 1, 21, 2, 1718366813, 'CA Showcase'),
(16, 429396, 1, 22, 2, 1718366853, 'CA Showcase'),
(17, 967821, 1, 23, 2, 1718366889, 'CA Showcase'),
(18, 315298, 1, 24, 2, 1718366895, 'CA Showcase'),
(19, 441060, 1, 25, 2, 1718366905, 'CA Showcase'),
(20, 986031, 1, 26, 2, 1718366912, 'CA Showcase'),
(21, 389673, 1, 27, 2, 1718366969, 'CA Showcase'),
(22, 343126, 1, 28, 2, 1718367265, 'CA Showcase'),
(23, 362017, 1, 29, 2, 1718367449, 'CA Showcase'),
(24, 335720, 1, 30, 2, 1718367482, 'CA Showcase'),
(25, 455400, 1, 31, 2, 1718367535, 'CA Showcase'),
(26, 425086, 1, 32, 2, 1718367607, 'CA Showcase'),
(27, 693671, 1, 33, 2, 1718367774, 'CA Showcase'),
(28, 730143, 1, 34, 2, 1718367831, 'CA Showcase'),
(29, 829224, 1, 35, 2, 1718367851, 'CA Showcase'),
(30, 756997, 1, 36, 2, 1718367868, 'CA Showcase'),
(31, 743906, 1, 37, 2, 1718367904, 'CA Showcase'),
(32, 794790, 1, 38, 2, 1718367915, 'CA Showcase'),
(33, 222242, 1, 39, 2, 1718367930, 'CA Showcase'),
(34, 316544, 1, 40, 2, 1718367947, 'CA Showcase'),
(35, 899749, 1, 41, 2, 1718367983, 'CA Showcase'),
(36, 115169, 1, 42, 2, 1718367996, 'CA Showcase'),
(37, 292639, 1, 43, 2, 1718368075, 'CA Showcase'),
(38, 298311, 1, 44, 2, 1718368103, 'CA Showcase'),
(39, 956623, 1, 45, 2, 1718368115, 'CA Showcase'),
(40, 231458, 1, 46, 2, 1718368121, 'CA Showcase'),
(41, 943361, 1, 47, 2, 1718368127, 'CA Showcase'),
(42, 293810, 1, 48, 2, 1718368132, 'CA Showcase'),
(43, 701859, 1, 49, 2, 1718368138, 'CA Showcase');

-- --------------------------------------------------------

--
-- Table structure for table `lead_staff_relation`
--

DROP TABLE IF EXISTS `lead_staff_relation`;
CREATE TABLE IF NOT EXISTS `lead_staff_relation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `lead_id` int NOT NULL,
  `staff_id` int NOT NULL,
  `datentime` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lead_staff_relation`
--

INSERT INTO `lead_staff_relation` (`id`, `lead_id`, `staff_id`, `datentime`) VALUES
(1, 1, 2, 1717671653),
(2, 1, 3, 1717673741),
(3, 1, 2, 1717754550),
(4, 1, 4, 1718256109);

-- --------------------------------------------------------

--
-- Table structure for table `lead_status_list`
--

DROP TABLE IF EXISTS `lead_status_list`;
CREATE TABLE IF NOT EXISTS `lead_status_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `step_order` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lead_status_list`
--

INSERT INTO `lead_status_list` (`id`, `description`, `step_order`) VALUES
(1, 'New Lead', 1),
(2, 'Pre Application', 2),
(3, 'Applied', 3),
(4, 'Cas Issued', 4),
(5, 'Visa Application', 5),
(6, 'Visa Issued', 6),
(7, 'Complete', 7),
(8, 'Kill Lead', 999),
(9, 'Rejected By University', 888),
(10, 'Visa Rejected', 777);

-- --------------------------------------------------------

--
-- Table structure for table `login_detail`
--

DROP TABLE IF EXISTS `login_detail`;
CREATE TABLE IF NOT EXISTS `login_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ref_id` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `login_type` int NOT NULL,
  `status` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `login_detail`
--

INSERT INTO `login_detail` (`id`, `ref_id`, `username`, `password`, `login_type`, `status`) VALUES
(1, '4', 'admin', 'as1234', 111, 1),
(9, 'SA101', 'yogesh@bafna.net', '123456', 4, 1),
(10, 'SA102', 'test@test', '123456', 4, 1),
(11, 'SA103', 'gautam@bafna.net', '123456', 4, 1),
(12, 'SA104', 'jasi@test.com', '123456', 4, 1),
(13, 'SA105', 'rahul@test', '123456', 4, 1),
(14, 'SA106', 'rakesh@test', '123456', 4, 1),
(15, 'SA107', 'test@test.com', '123456', 4, 1),
(16, 'SA108', 'rajesh@test.com', '123456', 4, 1),
(17, 'SA109', 'yogesh@test.com', '123456', 4, 1),
(18, 'SA110', 'gyogesh@test.com', '123456', 4, 1),
(19, 'SA111', 'gyogesh1@test.com', '123456', 4, 1),
(20, 'SA112', 'pk@test', '123456', 4, 1),
(21, 'SA113', 'pkr@test', '123456', 4, 1),
(22, 'SA114', 'pks@test', '123456', 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `login_type_list`
--

DROP TABLE IF EXISTS `login_type_list`;
CREATE TABLE IF NOT EXISTS `login_type_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `uses_rights` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `login_type_list`
--

INSERT INTO `login_type_list` (`id`, `description`, `uses_rights`) VALUES
(1, 'admin', 11),
(2, 'tech', 11),
(3, 'subadmin', 11),
(4, 'agent', 11),
(5, 'student', 11);

-- --------------------------------------------------------

--
-- Table structure for table `min_education_list`
--

DROP TABLE IF EXISTS `min_education_list`;
CREATE TABLE IF NOT EXISTS `min_education_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `min_education_list`
--

INSERT INTO `min_education_list` (`id`, `description`) VALUES
(1, '10th'),
(2, '10+2'),
(3, 'diploma'),
(4, 'pg diploma'),
(5, 'graduate'),
(6, 'master');

-- --------------------------------------------------------

--
-- Table structure for table `staff_list`
--

DROP TABLE IF EXISTS `staff_list`;
CREATE TABLE IF NOT EXISTS `staff_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `mobile` bigint NOT NULL,
  `designation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `division` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `staff_list`
--

INSERT INTO `staff_list` (`id`, `name`, `email`, `mobile`, `designation`, `division`) VALUES
(1, 'pradeep kumar gupta', 'test@test.com', 1234567890, 'sales executive', 'sales'),
(2, 'Pradeep Ranka', 'pradeep@test.com', 2147483647, 'sales executive', 'sales'),
(3, 'Jasintha', 'jasi@test.com', 2147483647, 'backend', 'sales'),
(4, 'Yogesh Bafna', 'yogesh@bafna.net', 9902012547, 'Director', 'Management'),
(5, 'Amit', 'amit@moticorporation', 7618844888, 'Software Developer', 'IT');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
CREATE TABLE IF NOT EXISTS `students` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `mobile` bigint NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `dob` int NOT NULL,
  `brief_note` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `userid` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `name`, `mobile`, `email`, `dob`, `brief_note`, `userid`, `password`) VALUES
(1, 'Yogesh', 2147483647, 'yogesh@bafna.net', 0, 'No Note', 'yogesh@bafna.net', 'std1234'),
(2, 'Yogesh', 2147483647, 'yogesh@bafna.net', 0, 'No Note', 'yogesh@bafna.net', 'std1234'),
(3, 'Yogesh G', 2147483647, 'yogesh@bafna.net', 315513000, 'No Note', 'yogesh@bafna.net', 'std1234'),
(4, 'G Yogesh Bafna', 2147483647, 'yogesh@bafna.net', 0, 'No Note', 'yogesh@bafna.net', 'std1234'),
(5, 'test', 123456, 'test@test.com', 0, 'No Note', 'test@test.com', 'std1234'),
(6, 'test', 123456, 'test@test.com', 0, 'No Note', 'test@test.com', 'std1234'),
(7, 'test', 123456, 'test@test.com', 0, 'No Note', 'test@test.com', 'std1234'),
(8, 'test', 1234567890, 'test@test', 0, 'No Note', 'test@test', 'std1234'),
(9, 'test', 1234567890, 'test@test', 0, 'No Note', 'test@test', 'std1234'),
(10, 'test', 1234567890, 'test@test', 0, 'No Note', 'test@test', 'std1234'),
(11, 'test', 1234567890, 'yogesh@bafna.net', 0, 'No Note', 'yogesh@bafna.net', 'std1234'),
(12, 'test', 1234567890, 'yogesh@bafna.net', 0, 'No Note', 'yogesh@bafna.net', 'std1234'),
(13, 'test', 1234567890, 'yogesh@bafna.net', 0, 'No Note', 'yogesh@bafna.net', 'std1234'),
(14, 'test', 1234567890, 'yogesh@bafna.net', 0, 'No Note', 'yogesh@bafna.net', 'std1234'),
(15, 'test', 1234567890, 'yogesh@bafna.net', 0, 'No Note', 'yogesh@bafna.net', 'std1234'),
(16, 'test', 1234567890, 'yogesh@bafna.net', 0, 'No Note', 'yogesh@bafna.net', 'std1234'),
(17, 'test', 1234567890, 'yogesh@bafna.net', 0, 'No Note', 'yogesh@bafna.net', 'std1234'),
(18, 'test', 1234567890, 'yogesh@bafna.net', 0, 'No Note', 'yogesh@bafna.net', 'std1234'),
(19, 'test', 1234567890, 'yogesh@bafna.net', 0, 'No Note', 'yogesh@bafna.net', 'std1234'),
(20, 'test', 1234567890, 'yogesh@bafna.net', 0, 'No Note', 'yogesh@bafna.net', 'std1234'),
(21, 'test', 1234567890, 'yogesh@bafna.net', 0, 'No Note', 'yogesh@bafna.net', 'std1234'),
(22, 'test', 1234567890, 'yogesh@bafna.net', 0, 'No Note', 'yogesh@bafna.net', 'std1234'),
(23, 'test', 1234567890, 'yogesh@bafna.net', 0, 'No Note', 'yogesh@bafna.net', 'std1234'),
(24, 'test', 1234567890, 'yogesh@bafna.net', 0, 'No Note', 'yogesh@bafna.net', 'std1234'),
(25, 'test', 1234567890, 'yogesh@bafna.net', 0, 'No Note', 'yogesh@bafna.net', 'std1234'),
(26, 'test', 1234567890, 'yogesh@bafna.net', 0, 'No Note', 'yogesh@bafna.net', 'std1234'),
(27, 'test', 1234567890, 'yogesh@bafna.net', 0, 'No Note', 'yogesh@bafna.net', 'std1234'),
(28, 'test', 1234567890, 'yogesh@bafna.net', 0, 'No Note', 'yogesh@bafna.net', 'std1234'),
(29, 'test', 1234567890, 'yogesh@bafna.net', 0, 'No Note', 'yogesh@bafna.net', 'std1234'),
(30, 'test', 1234567890, 'yogesh@bafna.net', 0, 'No Note', 'yogesh@bafna.net', 'std1234'),
(31, 'test', 1234567890, 'yogesh@bafna.net', 0, 'No Note', 'yogesh@bafna.net', 'std1234'),
(32, 'test', 1234567890, 'yogesh@bafna.net', 0, 'No Note', 'yogesh@bafna.net', 'std1234'),
(33, 'test', 1234567890, 'yogesh@bafna.net', 0, 'No Note', 'yogesh@bafna.net', 'std1234'),
(34, 'test', 1234567890, 'yogesh@bafna.net', 0, 'No Note', 'yogesh@bafna.net', 'std1234'),
(35, 'test', 1234567890, 'yogesh@bafna.net', 0, 'No Note', 'yogesh@bafna.net', 'std1234'),
(36, 'test', 1234567890, 'yogesh@bafna.net', 0, 'No Note', 'yogesh@bafna.net', 'std1234'),
(37, 'test', 1234567890, 'yogesh@bafna.net', 0, 'No Note', 'yogesh@bafna.net', 'std1234'),
(38, 'test', 1234567890, 'yogesh@bafna.net', 0, 'No Note', 'yogesh@bafna.net', 'std1234'),
(39, 'test', 1234567890, 'yogesh@bafna.net', 0, 'No Note', 'yogesh@bafna.net', 'std1234'),
(40, 'test', 1234567890, 'yogesh@bafna.net', 0, 'No Note', 'yogesh@bafna.net', 'std1234'),
(41, 'test', 1234567890, 'yogesh@bafna.net', 0, 'No Note', 'yogesh@bafna.net', 'std1234'),
(42, 'test', 1234567890, 'yogesh@bafna.net', 0, 'No Note', 'yogesh@bafna.net', 'std1234'),
(43, 'test', 1234567890, 'yogesh@bafna.co.uk', 0, 'No Note', 'yogesh@bafna.co.uk', 'std1234'),
(44, 'test', 1234567890, 'yogesh@bafna.co.uk', 0, 'No Note', 'yogesh@bafna.co.uk', 'std1234'),
(45, 'test', 1234567890, 'yogesh@bafna.co.uk', 0, 'No Note', 'yogesh@bafna.co.uk', 'std1234'),
(46, 'test', 1234567890, 'yogesh@bafna.co.uk', 0, 'No Note', 'yogesh@bafna.co.uk', 'std1234'),
(47, 'test', 1234567890, 'yogesh@bafna.co.uk', 0, 'No Note', 'yogesh@bafna.co.uk', 'std1234'),
(48, 'test', 1234567890, 'yogesh@bafna.co.uk', 0, 'No Note', 'yogesh@bafna.co.uk', 'std1234'),
(49, 'test', 1234567890, 'yogesh@bafna.co.uk', 0, 'No Note', 'yogesh@bafna.co.uk', 'std1234');

-- --------------------------------------------------------

--
-- Table structure for table `university_list`
--

DROP TABLE IF EXISTS `university_list`;
CREATE TABLE IF NOT EXISTS `university_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `region` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `country_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `university_list`
--

INSERT INTO `university_list` (`id`, `name`, `region`, `country_id`) VALUES
(1, 'Anglia Ruskin University', 'London', 2),
(2, 'City University of London', 'London', 2),
(3, 'De Montfort University', 'London', 2),
(4, 'Edinburgh Napier University', 'London', 2),
(5, 'Kings College London', 'London', 2),
(6, 'London Metropolitan University', 'London', 2),
(7, 'Nottingham Trent University', 'London', 2),
(8, 'University College Birmingham', 'London', 2),
(9, 'Leeds Beckett University', 'London', 2),
(10, 'University of Greenwich', 'London', 2);

-- --------------------------------------------------------

--
-- Table structure for table `urn_audit_history`
--

DROP TABLE IF EXISTS `urn_audit_history`;
CREATE TABLE IF NOT EXISTS `urn_audit_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `lead_id` int NOT NULL,
  `status_id` int NOT NULL,
  `student_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `student_dob` int NOT NULL,
  `student_mobile` bigint NOT NULL,
  `student_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `student_brief_note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `updation_remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `datentime` int NOT NULL,
  `updated_columns` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `urn_audit_history`
--

INSERT INTO `urn_audit_history` (`id`, `lead_id`, `status_id`, `student_name`, `student_dob`, `student_mobile`, `student_email`, `student_brief_note`, `updation_remark`, `datentime`, `updated_columns`) VALUES
(1, 1, 1, 'Yogesh', 0, 2147483647, 'yogesh@bafna.net', 'No Note', 'Created By Student', 1717668770, ''),
(2, 1, 1, 'Yogesh', 0, 2147483647, 'yogesh@bafna.net', 'No Note', 'Created By Student', 1717668883, ''),
(3, 1, 1, 'Yogesh', 0, 2147483647, 'yogesh@bafna.net', 'No Note', 'Upload by Portal User', 1717668894, ''),
(4, 1, 1, 'Yogesh', 915129000, 2147483647, 'yogesh@bafna.net', 'No Note', 'DOB Updated', 1717670507, ''),
(5, 1, 1, 'Yogesh', 915129000, 2147483647, 'yogesh@bafna.net', 'No Note', 'Upload by Portal User', 1717670533, ''),
(6, 1, 1, 'Yogesh', 946665000, 2147483647, 'yogesh@bafna.net', 'No Note', 'DOB Reupdated', 1717670806, ''),
(7, 1, 1, 'Yogesh', 946665000, 2147483647, 'yogesh@bafna.net', 'No Note', 'Upload by Portal User', 1717671058, ''),
(8, 1, 1, 'Yogesh', 852057000, 2147483647, 'yogesh@bafna.net', 'No Note', 'DOB Reupdated', 1717671374, ''),
(9, 1, 2, 'Yogesh', 852057000, 2147483647, 'yogesh@bafna.net', 'No Note', 'Status Updated', 1717672538, ''),
(10, 1, 2, 'Yogesh', 315513000, 2147483647, 'yogesh@bafna.net', 'No Note', 'DOB Reupdated', 1717755065, ''),
(11, 1, 3, 'Yogesh', 315513000, 2147483647, 'yogesh@bafna.net', 'No Note', 'Status Updated', 1717755079, ''),
(12, 1, 3, 'Yogesh', 315513000, 2147483647, 'yogesh@bafna.net', 'No Note', 'Upload by Portal User', 1717755124, ''),
(13, 2, 1, 'G Yogesh Bafna', 0, 2147483647, 'yogesh@bafna.net', 'No Note', 'Created By Student', 1717759219, ''),
(14, 2, 1, 'G Yogesh Bafna', 0, 2147483647, 'yogesh@bafna.net', 'No Note', 'Upload by Portal User', 1717759228, ''),
(15, 1, 3, 'Yogesh G', 315513000, 2147483647, 'yogesh@bafna.net', 'No Note', 'Name Updated', 1718173204, ''),
(16, 3, 1, 'test', 0, 1234567890, 'test@test', 'No Note', 'Created By Student', 1718365440, ''),
(17, 4, 1, 'test', 0, 1234567890, 'test@test', 'No Note', 'Created By Student', 1718365725, ''),
(18, 5, 1, 'test', 0, 1234567890, 'yogesh@bafna.net', 'No Note', 'Created By Student', 1718366126, ''),
(19, 6, 1, 'test', 0, 1234567890, 'yogesh@bafna.net', 'No Note', 'Created By Student', 1718366174, ''),
(20, 7, 1, 'test', 0, 1234567890, 'yogesh@bafna.net', 'No Note', 'Created By Student', 1718366204, ''),
(21, 8, 1, 'test', 0, 1234567890, 'yogesh@bafna.net', 'No Note', 'Created By Student', 1718366229, ''),
(22, 9, 1, 'test', 0, 1234567890, 'yogesh@bafna.net', 'No Note', 'Created By Student', 1718366307, ''),
(23, 10, 1, 'test', 0, 1234567890, 'yogesh@bafna.net', 'No Note', 'Created By Student', 1718366393, ''),
(24, 11, 1, 'test', 0, 1234567890, 'yogesh@bafna.net', 'No Note', 'Created By Student', 1718366428, ''),
(25, 12, 1, 'test', 0, 1234567890, 'yogesh@bafna.net', 'No Note', 'Created By Student', 1718366495, ''),
(26, 13, 1, 'test', 0, 1234567890, 'yogesh@bafna.net', 'No Note', 'Created By Student', 1718366533, ''),
(27, 14, 1, 'test', 0, 1234567890, 'yogesh@bafna.net', 'No Note', 'Created By Student', 1718366554, ''),
(28, 15, 1, 'test', 0, 1234567890, 'yogesh@bafna.net', 'No Note', 'Created By Student', 1718366813, ''),
(29, 16, 1, 'test', 0, 1234567890, 'yogesh@bafna.net', 'No Note', 'Created By Student', 1718366853, ''),
(30, 17, 1, 'test', 0, 1234567890, 'yogesh@bafna.net', 'No Note', 'Created By Student', 1718366889, ''),
(31, 18, 1, 'test', 0, 1234567890, 'yogesh@bafna.net', 'No Note', 'Created By Student', 1718366895, ''),
(32, 19, 1, 'test', 0, 1234567890, 'yogesh@bafna.net', 'No Note', 'Created By Student', 1718366905, ''),
(33, 20, 1, 'test', 0, 1234567890, 'yogesh@bafna.net', 'No Note', 'Created By Student', 1718366912, ''),
(34, 21, 1, 'test', 0, 1234567890, 'yogesh@bafna.net', 'No Note', 'Created By Student', 1718366969, ''),
(35, 22, 1, 'test', 0, 1234567890, 'yogesh@bafna.net', 'No Note', 'Created By Student', 1718367265, ''),
(36, 23, 1, 'test', 0, 1234567890, 'yogesh@bafna.net', 'No Note', 'Created By Student', 1718367449, ''),
(37, 24, 1, 'test', 0, 1234567890, 'yogesh@bafna.net', 'No Note', 'Created By Student', 1718367482, ''),
(38, 25, 1, 'test', 0, 1234567890, 'yogesh@bafna.net', 'No Note', 'Created By Student', 1718367535, ''),
(39, 26, 1, 'test', 0, 1234567890, 'yogesh@bafna.net', 'No Note', 'Created By Student', 1718367607, ''),
(40, 27, 1, 'test', 0, 1234567890, 'yogesh@bafna.net', 'No Note', 'Created By Student', 1718367774, ''),
(41, 28, 1, 'test', 0, 1234567890, 'yogesh@bafna.net', 'No Note', 'Created By Student', 1718367831, ''),
(42, 29, 1, 'test', 0, 1234567890, 'yogesh@bafna.net', 'No Note', 'Created By Student', 1718367851, ''),
(43, 30, 1, 'test', 0, 1234567890, 'yogesh@bafna.net', 'No Note', 'Created By Student', 1718367868, ''),
(44, 31, 1, 'test', 0, 1234567890, 'yogesh@bafna.net', 'No Note', 'Created By Student', 1718367904, ''),
(45, 32, 1, 'test', 0, 1234567890, 'yogesh@bafna.net', 'No Note', 'Created By Student', 1718367915, ''),
(46, 33, 1, 'test', 0, 1234567890, 'yogesh@bafna.net', 'No Note', 'Created By Student', 1718367930, ''),
(47, 34, 1, 'test', 0, 1234567890, 'yogesh@bafna.net', 'No Note', 'Created By Student', 1718367947, ''),
(48, 35, 1, 'test', 0, 1234567890, 'yogesh@bafna.net', 'No Note', 'Created By Student', 1718367983, ''),
(49, 36, 1, 'test', 0, 1234567890, 'yogesh@bafna.net', 'No Note', 'Created By Student', 1718367996, ''),
(50, 37, 1, 'test', 0, 1234567890, 'yogesh@bafna.co.uk', 'No Note', 'Created By Student', 1718368075, ''),
(51, 38, 1, 'test', 0, 1234567890, 'yogesh@bafna.co.uk', 'No Note', 'Created By Student', 1718368103, ''),
(52, 39, 1, 'test', 0, 1234567890, 'yogesh@bafna.co.uk', 'No Note', 'Created By Student', 1718368115, ''),
(53, 40, 1, 'test', 0, 1234567890, 'yogesh@bafna.co.uk', 'No Note', 'Created By Student', 1718368121, ''),
(54, 41, 1, 'test', 0, 1234567890, 'yogesh@bafna.co.uk', 'No Note', 'Created By Student', 1718368127, ''),
(55, 42, 1, 'test', 0, 1234567890, 'yogesh@bafna.co.uk', 'No Note', 'Created By Student', 1718368132, ''),
(56, 43, 1, 'test', 0, 1234567890, 'yogesh@bafna.co.uk', 'No Note', 'Created By Student', 1718368138, '');

-- --------------------------------------------------------

--
-- Table structure for table `urn_document_upload_history`
--

DROP TABLE IF EXISTS `urn_document_upload_history`;
CREATE TABLE IF NOT EXISTS `urn_document_upload_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `lead_id` int NOT NULL,
  `urn` int NOT NULL,
  `file_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `datentime` int NOT NULL,
  `upload_by` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `urn_document_upload_history`
--

INSERT INTO `urn_document_upload_history` (`id`, `lead_id`, `urn`, `file_name`, `datentime`, `upload_by`) VALUES
(1, 1, 948747, '10th_makrkssheet_1717668894.jpg', 1717668894, 0),
(2, 1, 948747, '6_1717668894.pdf', 1717668894, 0),
(3, 1, 948747, '2005_1717668894.jpg', 1717668894, 0),
(4, 1, 948747, '10th_makrkssheet_1717670533.jpg', 1717670533, 0),
(5, 1, 948747, 'ielts_score_card_1717670533.jpg', 1717670533, 0),
(6, 1, 948747, 'graduation_certificate_1717671058.jpg', 1717671058, 0),
(7, 1, 948747, '10th_makrkssheet_1717755124.jpg', 1717755124, 0),
(8, 2, 334640, '10th_makrkssheet_1717759228.jpg', 1717759228, 0),
(9, 2, 334640, '5_1717759228.pdf', 1717759228, 0);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

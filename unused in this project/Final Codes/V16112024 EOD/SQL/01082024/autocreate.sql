-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Aug 01, 2024 at 12:33 PM
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
-- Database: `ca-portal-v2-live`
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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `agent_list`
--

INSERT INTO `agent_list` (`id`, `type`, `name`, `email`, `mobile`, `whatsapp`, `company_name`, `company_address`, `company_website`, `comission`, `status`) VALUES
(1, 0, 'Yogesh Bafna', 'yogesh@sa.com', 9920015247, 9902015247, '', '', '', 30, 1),
(2, 1, 'Y Mamta Bafna', 'mamta@sa.com', 9902012548, 1234567890, 'Moti Corporation', 'Hebbal Bengaluru', 'www.moticorporation.com', 30, 1);

-- --------------------------------------------------------

--
-- Table structure for table `application_point_list`
--

DROP TABLE IF EXISTS `application_point_list`;
CREATE TABLE IF NOT EXISTS `application_point_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `contact_person_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `mobile` bigint NOT NULL,
  `comission_percentage` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `application_point_list`
--

INSERT INTO `application_point_list` (`id`, `name`, `type`, `address`, `contact_person_name`, `email`, `mobile`, `comission_percentage`) VALUES
(1, 'crizac management pvt ltd', 'i', 'usa', 'test', 'crizac@test', 123456, 30),
(2, 'Bangalore University', 'u', 'Bangalore', 'IT HEAD', 'text@test', 123456, 30);

-- --------------------------------------------------------

--
-- Table structure for table `callback_list`
--

DROP TABLE IF EXISTS `callback_list`;
CREATE TABLE IF NOT EXISTS `callback_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `lead_id` int NOT NULL,
  `callback_datentime` int NOT NULL,
  `prev_remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` int NOT NULL,
  `call_remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `updated_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `hold_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `updation_datentime` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chat_history`
--

DROP TABLE IF EXISTS `chat_history`;
CREATE TABLE IF NOT EXISTS `chat_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `message` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `message_type` int NOT NULL,
  `sender_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `receiver_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `datentime` int NOT NULL,
  `status` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chat_relationship_list`
--

DROP TABLE IF EXISTS `chat_relationship_list`;
CREATE TABLE IF NOT EXISTS `chat_relationship_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `student_id` int NOT NULL,
  `support_id` int NOT NULL,
  `support_type` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `comission_paid_history`
--

DROP TABLE IF EXISTS `comission_paid_history`;
CREATE TABLE IF NOT EXISTS `comission_paid_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `lead_id` int NOT NULL,
  `lead_amount` int NOT NULL,
  `comission_amount` int NOT NULL,
  `comission_paid` int NOT NULL,
  `comission_paid_to` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `datentime` int NOT NULL,
  `transaction_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=MyISAM AUTO_INCREMENT=112 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `course_list`
--

INSERT INTO `course_list` (`id`, `name`, `type`, `intake`, `duration`, `eligibility`, `university_id`, `fee`, `scholarship_available`) VALUES
(1, 'Bsc (HONS) Accounting & Finance', 'Undergraduate', 'JAN,SEP', 36, '10th', 1, 15900, 1),
(2, 'Bsc (HONS) Architecture', 'Undergraduate', 'JAN', 35, '12th', 1, 16700, 0),
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
-- Table structure for table `deletion_pending_leads`
--

DROP TABLE IF EXISTS `deletion_pending_leads`;
CREATE TABLE IF NOT EXISTS `deletion_pending_leads` (
  `id` int NOT NULL AUTO_INCREMENT,
  `lead_id` int NOT NULL,
  `status_before_req` int NOT NULL,
  `batch_id` int NOT NULL,
  `req_by` int NOT NULL,
  `req_datentime` int NOT NULL,
  `approved_by` int NOT NULL,
  `approval_datentime` int NOT NULL,
  `req_remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `approval_remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `document_list`
--

INSERT INTO `document_list` (`id`, `name`, `uploaded_file_name`, `is_required`) VALUES
(1, 'Student Photo', 'student_photo', 0),
(2, '10th Markssheet', '10th_makrkssheet', 0),
(3, '10th Certificate', '10th_certificate', 0),
(4, 'Letter of Recommendation', 'lor', 0),
(5, 'Statement of Purpose', 'sop', 0),
(6, 'Highest Education Proof', 'highest_education_proof', 0),
(8, 'Passport', 'passport', 1);

-- --------------------------------------------------------

--
-- Table structure for table `income_history`
--

DROP TABLE IF EXISTS `income_history`;
CREATE TABLE IF NOT EXISTS `income_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `lead_id` int NOT NULL,
  `lead_amount` int NOT NULL,
  `comission_amount` int NOT NULL,
  `comission_rcvd` int NOT NULL,
  `application_point_id` int NOT NULL,
  `datentime` int NOT NULL,
  `transaction_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `transaction_proof_file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `entry_done_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `entry_datentime` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `leads_details`
--

DROP TABLE IF EXISTS `leads_details`;
CREATE TABLE IF NOT EXISTS `leads_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `urn` int NOT NULL,
  `status_id` int NOT NULL,
  `status_batch_id` int NOT NULL,
  `student_id` int NOT NULL,
  `course_id` int NOT NULL,
  `datentime` int NOT NULL,
  `created_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `source_id` int NOT NULL,
  `application_point_id` int NOT NULL,
  `allocated_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lead_allocation_list`
--

DROP TABLE IF EXISTS `lead_allocation_list`;
CREATE TABLE IF NOT EXISTS `lead_allocation_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `lead_id` int NOT NULL,
  `allocated_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `datentime` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lead_sources_list`
--

DROP TABLE IF EXISTS `lead_sources_list`;
CREATE TABLE IF NOT EXISTS `lead_sources_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `datentime` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lead_sources_list`
--

INSERT INTO `lead_sources_list` (`id`, `description`, `datentime`) VALUES
(1, 'Google', 1719299784),
(2, 'WhatsApp', 1719299784),
(3, 'Meta', 1719299784),
(4, 'Sulekha', 1719299784),
(5, 'Organic', 1719301117),
(6, 'Others', 1721708520);

-- --------------------------------------------------------

--
-- Table structure for table `lead_status_list`
--

DROP TABLE IF EXISTS `lead_status_list`;
CREATE TABLE IF NOT EXISTS `lead_status_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `step_order` int NOT NULL,
  `batch_id` int NOT NULL,
  `datentime` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lead_status_list`
--

INSERT INTO `lead_status_list` (`id`, `description`, `step_order`, `batch_id`, `datentime`) VALUES
(1, 'New', 1, 1, 1719484628),
(2, 'Pre Application', 2, 1, 1719484628),
(3, 'Verification', 3, 1, 1719484628),
(4, 'Applied', 4, 1, 1719484628),
(5, 'URN Approved', 5, 1, 1719484628),
(6, 'Token Paid', 6, 1, 1719484628),
(7, 'CAS Issued', 7, 1, 1719484628),
(8, 'Visa Applied', 8, 1, 1719484628),
(9, 'Visa Approved', 9, 1, 1719484628),
(10, 'Fee Paid', 10, 1, 1719484628),
(11, 'Complete', 11, 1, 1719484628),
(12, 'Deleted', 999, 1, 1719484628),
(13, 'URN Rejected', 888, 1, 1719484628),
(14, 'Visa Rejected', 777, 1, 1719484628),
(15, 'Pending', 666, 1, 1719484628);

-- --------------------------------------------------------

--
-- Table structure for table `login_detail`
--

DROP TABLE IF EXISTS `login_detail`;
CREATE TABLE IF NOT EXISTS `login_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ref_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `login_type` int NOT NULL,
  `status` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `login_detail`
--

INSERT INTO `login_detail` (`id`, `ref_id`, `username`, `password`, `login_type`, `status`) VALUES
(1, 'BS1', 'admin', '@dmin', 7, 1),
(43, 'SP1', 'jasi@sa.com', '123456', 6, 1),
(42, 'SA2', 'mamta@sa.com', '98765', 4, 1),
(41, 'SA1', 'yogesh@sa.com', '123456', 4, 1),
(33, 'BS3', 'jasi@bs.com', '123456', 3, 1),
(32, 'BS2', 'yogesh@bafna.net', '12345', 1, 1),
(37, 'BS8', 'manish@bafna.net', '123456', 8, 1),
(44, 'BS9', 'amit@moticorporation.com', '123456', 8, 1);

-- --------------------------------------------------------

--
-- Table structure for table `login_type_list`
--

DROP TABLE IF EXISTS `login_type_list`;
CREATE TABLE IF NOT EXISTS `login_type_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `uses_rights` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `login_type_list`
--

INSERT INTO `login_type_list` (`id`, `description`, `uses_rights`) VALUES
(1, 'Admin', 11),
(2, 'Tech', 11),
(3, 'Backend Staff', 11),
(4, 'Agent', 11),
(5, 'Student', 11),
(6, 'Sales Person', 0),
(7, 'Super Admin', 11),
(8, 'Management', 11),
(9, 'Portal Visitor', 11);

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

DROP TABLE IF EXISTS `menu_items`;
CREATE TABLE IF NOT EXISTS `menu_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `submenu_id_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `icon_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `parent_menu_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`id`, `description`, `submenu_id_name`, `icon_name`, `parent_menu_id`) VALUES
(1, 'CRM', 'CRM', 'pie-chart', 1),
(2, 'URN Management', 'URN', 'users', 1),
(3, 'University Management', 'UNIV', 'clipboard', 1),
(4, 'User Management', 'USER', 'user', 1),
(5, 'Report Management', 'REPORT', 'file', 1),
(6, 'Chat', 'CHAT', 'message-square', 1),
(8, 'Site Management', 'SITE', 'dribbble', 1),
(7, 'Management Account', 'FUND', 'dollar-sign', 1),
(9, 'Menu Management', 'MENU', 'align-left', 1),
(12, 'CRM', 'CRM', 'pie-chart', 2),
(13, 'URN Management', 'URN', 'users', 2),
(14, 'Account', 'ACCOUNT', 'user', 2),
(15, 'Chat', 'CHAT', 'message-square', 2),
(16, 'CRM', 'CRM', 'pie-chart', 3),
(17, 'Account', 'ACCOUNT', 'user', 3),
(18, 'Chat', 'CHAT', 'message-square', 3);

-- --------------------------------------------------------

--
-- Table structure for table `menu_list`
--

DROP TABLE IF EXISTS `menu_list`;
CREATE TABLE IF NOT EXISTS `menu_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menu_list`
--

INSERT INTO `menu_list` (`id`, `description`) VALUES
(1, 'Main'),
(2, 'Partner'),
(3, 'Student');

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
-- Table structure for table `predefined_test_list`
--

DROP TABLE IF EXISTS `predefined_test_list`;
CREATE TABLE IF NOT EXISTS `predefined_test_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `predefined_test_list`
--

INSERT INTO `predefined_test_list` (`id`, `name`) VALUES
(1, 'IELTS'),
(2, 'TOEFL'),
(3, 'GRE'),
(4, 'DULINGO'),
(5, 'GMAT'),
(6, 'PTE'),
(7, 'SAT');

-- --------------------------------------------------------

--
-- Table structure for table `sales_person_list`
--

DROP TABLE IF EXISTS `sales_person_list`;
CREATE TABLE IF NOT EXISTS `sales_person_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `mobile` bigint NOT NULL,
  `whatsapp` bigint NOT NULL,
  `salary` int NOT NULL,
  `comission` int NOT NULL,
  `status` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sales_person_list`
--

INSERT INTO `sales_person_list` (`id`, `name`, `email`, `mobile`, `whatsapp`, `salary`, `comission`, `status`) VALUES
(1, 'Jasintha', 'jasi@sa.com', 112, 112, 10000, 30, 1);

-- --------------------------------------------------------

--
-- Table structure for table `site_settings`
--

DROP TABLE IF EXISTS `site_settings`;
CREATE TABLE IF NOT EXISTS `site_settings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `site_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `wsp_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `wsp_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `crm_version` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `site_logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `site_settings`
--

INSERT INTO `site_settings` (`id`, `site_title`, `wsp_name`, `wsp_url`, `crm_version`, `site_logo`) VALUES
(1, 'Campus Abroad CRM V2', 'Moti Corporation', 'www.moticorporation.com', 'CRM v2.0', 'ca-logo.png');

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
  `role_type` int NOT NULL,
  `authorised_menu_options` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `staff_list`
--

INSERT INTO `staff_list` (`id`, `name`, `email`, `mobile`, `designation`, `division`, `role_type`, `authorised_menu_options`) VALUES
(2, 'G Yogesh Bafna', 'yogesh@bafna.net', 9902012547, 'Director', 'Management', 1, '1,2,3,4,5,6,8,7'),
(3, 'Jasintha', 'jasi@bs.com', 1237890, 'CSE', 'Support', 3, '1,2,6'),
(1, 'admin', 'info@campus-abroad.co.in', 9902012547, 'Admin', 'Management', 7, '1,2,3,4,5,6,7,8,9'),
(8, 'Manish Bafna', 'manish@bafna.net', 123, 'Manager', 'Management', 8, '1,2,3,4,5,6'),
(9, 'Amit S', 'amit@moticorporation.com', 7618844888, 'Developer', 'IT', 8, '1,2,3,4,5,6,7,8');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
CREATE TABLE IF NOT EXISTS `students` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `mobile` bigint NOT NULL,
  `alternate_mobile` bigint NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `dob` int NOT NULL,
  `brief_note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_callback_request_list`
--

DROP TABLE IF EXISTS `student_callback_request_list`;
CREATE TABLE IF NOT EXISTS `student_callback_request_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `lead_id` int NOT NULL,
  `callback_datentime` int NOT NULL,
  `reamrk` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `student_id` int NOT NULL,
  `request_datentime` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_wishlist`
--

DROP TABLE IF EXISTS `student_wishlist`;
CREATE TABLE IF NOT EXISTS `student_wishlist` (
  `id` int NOT NULL AUTO_INCREMENT,
  `student_id` int NOT NULL,
  `course_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `submenu_items`
--

DROP TABLE IF EXISTS `submenu_items`;
CREATE TABLE IF NOT EXISTS `submenu_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `href_link` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `parent_menu_item_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `submenu_items`
--

INSERT INTO `submenu_items` (`id`, `description`, `href_link`, `parent_menu_item_id`) VALUES
(1, 'URN Lead', 'leads.php', 1),
(2, 'Create Lead', 'temp_leads.php', 1),
(23, 'Chat List', 'chat_list.php', 6),
(5, 'Calls', 'callback_list.php', 1),
(6, 'Menu Items', 'menu_items.php', 9),
(7, 'Commission', 'commission_history.php', 7),
(8, 'Site Info', 'site_settings.php', 8),
(9, 'Options', 'portal_settings.php', 8),
(10, 'Courses', 'view_course.php', 3),
(11, 'Universities', 'university_list.php', 3),
(12, 'Lead Source', 'lead_source_report.php', 5),
(13, 'Agent', 'agent_report.php', 5),
(14, 'Sales Person', 'sales_person_report.php', 5),
(15, 'Application Point', 'application_point_report.php', 5),
(16, 'Students', 'student_report.php', 5),
(17, 'Calls', 'call_report.php', 5),
(18, 'Staff', 'staff_list.php', 4),
(19, 'Agent', 'agent_list.php', 4),
(20, 'Sales Person', 'sales_person_list.php', 4),
(21, 'Application Point', 'application_point_list.php', 4),
(22, 'Submenu Items', 'submenu_items.php', 9),
(24, 'Menu List', 'menu_list.php', 9),
(25, 'Profile', 'myaccount.php', 14),
(26, 'Chat List', 'chat_list.php', 15),
(27, 'Wallet', 'mywallet.php', 14),
(28, 'Create Lead', 'temp_leads.php', 12),
(29, 'URN Lead', 'leads.php', 12),
(30, 'Calls', 'callback_list.php', 12),
(31, 'Chat List', 'chat_list.php', 18),
(32, 'Course Finder', 'course_finder.php', 16),
(33, 'University Finder', 'university_finder.php', 16),
(34, 'Profile', 'myaccount.php', 17),
(35, 'Settings', 'myaccount.php?tab=settings', 17),
(36, 'Wishlist', 'mywishlist.php', 17),
(37, 'Application', 'myurn_list.php', 17);

-- --------------------------------------------------------

--
-- Table structure for table `temp_leads`
--

DROP TABLE IF EXISTS `temp_leads`;
CREATE TABLE IF NOT EXISTS `temp_leads` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `mobile` bigint NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `datentime` int NOT NULL,
  `creator_id` int NOT NULL,
  `creator_type` int NOT NULL,
  `source_id` int NOT NULL,
  `status` int NOT NULL,
  `remark` varchar(1048) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `hidden` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `university_list`
--

INSERT INTO `university_list` (`id`, `name`, `region`, `country_id`) VALUES
(1, 'Anglia Ruskin University', 'London 1', 2),
(2, 'City University of London', 'London', 2),
(3, 'De Montfort University', 'London', 2),
(4, 'Edinburgh Napier University', 'London', 2),
(5, 'Kings College London', 'London', 2),
(6, 'London Metropolitan University', 'London', 2),
(7, 'Nottingham Trent University', 'London', 2),
(8, 'University College Birmingham', 'London', 2),
(9, 'Leeds Beckett University', 'London', 2),
(10, 'University of Greenwich', 'London', 2),
(26, 'Karnataka University', 'Bangalore', 1),
(25, 'Bangalore University', 'Bangalore', 1);

-- --------------------------------------------------------

--
-- Table structure for table `urn_audit_history`
--

DROP TABLE IF EXISTS `urn_audit_history`;
CREATE TABLE IF NOT EXISTS `urn_audit_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `lead_id` int NOT NULL,
  `course_id` int NOT NULL,
  `status_id` int NOT NULL,
  `student_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `student_dob` int NOT NULL,
  `student_mobile` bigint NOT NULL,
  `student_mobile_alt` bigint NOT NULL,
  `student_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `student_address` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `student_brief_note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `highest_education_type` int NOT NULL,
  `highest_education_name` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `highest_education_from_year` int NOT NULL,
  `highest_education_to_year` int NOT NULL,
  `highest_education_institution` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `highest_education_institution_city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `highest_education_institution_country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `test_taken_flag` int NOT NULL,
  `test_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `other_test_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `passport_number` int NOT NULL,
  `passport_place_of_issue` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `passport_issued_on` int NOT NULL,
  `passport_valid_till` int NOT NULL,
  `passport_holder_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `passport_holder_surname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `immigration_applied` int NOT NULL,
  `immigration_detail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `past_visa_refusal_status` int NOT NULL,
  `past_visa_refusal_detail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `serious_medical_status` int NOT NULL,
  `medical_condition_detail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `criminal_offence_status` int NOT NULL,
  `criminal_offence_detail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `updation_remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `datentime` int NOT NULL,
  `updated_columns` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `urn_document_upload_history`
--

DROP TABLE IF EXISTS `urn_document_upload_history`;
CREATE TABLE IF NOT EXISTS `urn_document_upload_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `lead_id` int NOT NULL,
  `urn` int NOT NULL,
  `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `datentime` int NOT NULL,
  `upload_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_deleted` int NOT NULL,
  `deleted_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `deletion_datentime` int NOT NULL,
  `deletion_remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wallet_history`
--

DROP TABLE IF EXISTS `wallet_history`;
CREATE TABLE IF NOT EXISTS `wallet_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `wallet_id` int NOT NULL,
  `transaction_remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `transaction_amount` int NOT NULL,
  `transaction_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `transaction_date` int NOT NULL,
  `transaction_type` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `wallet_history`
--

INSERT INTO `wallet_history` (`id`, `wallet_id`, `transaction_remark`, `transaction_amount`, `transaction_id`, `transaction_date`, `transaction_type`) VALUES
(1, 1, 'Wallet Created', 0, '', 1720428928, 111),
(2, 2, 'Wallet Created', 0, '', 1720428989, 111),
(3, 3, 'Wallet Created', 0, '', 1720429058, 111);

-- --------------------------------------------------------

--
-- Table structure for table `wallet_list`
--

DROP TABLE IF EXISTS `wallet_list`;
CREATE TABLE IF NOT EXISTS `wallet_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `holder_id` int NOT NULL,
  `holder_type` int NOT NULL,
  `balance` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `wallet_list`
--

INSERT INTO `wallet_list` (`id`, `holder_id`, `holder_type`, `balance`) VALUES
(1, 1, 4, 0),
(2, 2, 4, 0),
(3, 1, 6, 0);

-- --------------------------------------------------------

--
-- Table structure for table `withdrawl_request_list`
--

DROP TABLE IF EXISTS `withdrawl_request_list`;
CREATE TABLE IF NOT EXISTS `withdrawl_request_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `wallet_id` int NOT NULL,
  `amount` int NOT NULL,
  `req_datentime` int NOT NULL,
  `status` int NOT NULL,
  `approved_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `approval_datentime` int NOT NULL,
  `proof_file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `transaction_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `transaction_datentime` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

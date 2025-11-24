-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 17, 2025 at 12:36 PM
-- Server version: 8.3.0
-- PHP Version: 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lms-v2-2025`
--

-- --------------------------------------------------------

--
-- Table structure for table `action_perform_list`
--

DROP TABLE IF EXISTS `action_perform_list`;
CREATE TABLE IF NOT EXISTS `action_perform_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `action_perform_list`
--

INSERT INTO `action_perform_list` (`id`, `description`) VALUES
(1, 'Withdrawal Request'),
(2, 'Withdrawal Approval'),
(3, 'Status Update'),
(4, 'Allocate'),
(18, 'Agent Signup'),
(6, 'New Callback Set'),
(7, 'Callback Update'),
(19, 'Sales Person Signup'),
(10, 'URN Rejected'),
(11, 'Visa Rejected'),
(12, 'Document Upload'),
(13, 'URN Profile Update'),
(14, 'Additional Details Update'),
(15, 'Academic Details Update'),
(16, 'Course Selection Update'),
(17, 'URN Allocation'),
(20, 'Backend Staff Signup'),
(21, 'Management Staff Signup'),
(22, 'Applied'),
(23, 'URN Approved'),
(24, 'Visa Applied'),
(25, 'Visa Approved'),
(26, 'Fee Paid'),
(27, 'Deleted'),
(28, 'Enrolled');

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
  `bank_account_holder_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `bank_account_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `bank_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `bank_address` varchar(5040) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `bank_account_number` bigint NOT NULL,
  `bank_ifsc` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `comission` decimal(10,2) NOT NULL,
  `status` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `agent_list`
--

INSERT INTO `agent_list` (`id`, `type`, `name`, `email`, `mobile`, `whatsapp`, `company_name`, `company_address`, `company_website`, `bank_account_holder_name`, `bank_account_type`, `bank_name`, `bank_address`, `bank_account_number`, `bank_ifsc`, `comission`, `status`) VALUES
(1, 0, 'Yogesh Bafna', 'yogesh@sa.com', 9920015247, 9902015247, '', '', '', '', '', '', '', 0, '', 30.00, 1),
(2, 1, 'Y Mamta Bafna', 'mamta@sa.com', 9902012548, 1234567890, 'Moti Corporation', 'Hebbal Bengaluru', 'www.moticorporation.com', 'Moti Corporation', 'ca', 'HDFC', 'Hebbal Bangalore India', 986547123012, 'HDFC0000111', 30.00, 1),
(3, 0, 'Tanvi Bafna', 'tanvi@sa.com', 9865321470, 9865321470, '', '', '', '', '', '', '', 0, '', 30.00, 1),
(4, 1, 'Manish Bafna', 'manish@sa.com', 9875421630, 9875421630, 'Moti Builders', 'Chennai', 'www.motibuilders.com', '', '', '', '', 0, '', 30.50, 1),
(5, 1, 'Reet Bafna', 'reet@sa.com', 9865328540, 9865328540, 'Moti Infra', 'Hebbal Bangalore India', 'www.motiinfra.com', 'Moti Infra', 'ca', 'AXIS', 'Sanjay Nagar Bangalore', 5624358565, 'UTIB0000111', 30.00, 1);

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
  `comission_percentage` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `application_point_list`
--

INSERT INTO `application_point_list` (`id`, `name`, `type`, `address`, `contact_person_name`, `email`, `mobile`, `comission_percentage`) VALUES
(1, 'crizac management pvt ltd', 'i', 'usa', 'test', 'crizac@test', 123456, 30.00),
(2, 'Bangalore University', 'u', 'Bangalore', 'IT HEAD', 'text@test', 123456, 30.00),
(3, 'Delhi University', 'u', 'New Delhi India', 'Shivanand Singh', 'shivs@ap.com', 9865321470, 35.00),
(4, 'Krishna Consultancy', 'i', 'Kerala complex', 'Thomas', 'thomas@kc.net', 9988778899, 22.00);

-- --------------------------------------------------------

--
-- Table structure for table `bank_accounts_list`
--

DROP TABLE IF EXISTS `bank_accounts_list`;
CREATE TABLE IF NOT EXISTS `bank_accounts_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `crn` int NOT NULL,
  `account_holder_name` varchar(1024) COLLATE utf8mb4_general_ci NOT NULL,
  `bank_name` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `branch_address` varchar(5120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ifsc` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `account_number` bigint NOT NULL,
  `verification_status` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bank_accounts_list`
--

INSERT INTO `bank_accounts_list` (`id`, `crn`, `account_holder_name`, `bank_name`, `branch_address`, `ifsc`, `account_number`, `verification_status`) VALUES
(7, 1004, 'Arpita Sinha', 'HDFC', 'Hebbal Bangalore', 'HDFC12345', 1542369870, 0),
(10, 1002, 'Arpita', 'HDFC', 'hebbal', 'HDFC12345', 54236001, 0);

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
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `callback_list`
--

INSERT INTO `callback_list` (`id`, `lead_id`, `callback_datentime`, `prev_remark`, `status`, `call_remark`, `updated_by`, `hold_by`, `updation_datentime`) VALUES
(1, 50, 1728105300, 'Student wants callback', 1, 'Student did not receive call', 'BS2', 'BS2', 1728105443),
(2, 49, 1728105900, 'Student wants callback', 0, '', '', '', 0),
(3, 44, 1728194400, 'Students wants callback', 0, '', '', '', 0),
(4, 50, 1728108000, 'Callback rescheduled', 0, '', '', '', 0),
(5, 51, 1728204600, 'He will have all his documents ready to go thru ', 0, '', '', '', 0),
(6, 50, 1731735660, 'testing', 1, 'jsdfjdbskf', 'BS2', 'BS2', 1731735856);

-- --------------------------------------------------------

--
-- Table structure for table `call_history`
--

DROP TABLE IF EXISTS `call_history`;
CREATE TABLE IF NOT EXISTS `call_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `lead_id` int NOT NULL,
  `type` int NOT NULL,
  `remark` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `remark_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `datentime` int NOT NULL,
  `dataentry_datentime` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `call_history`
--

INSERT INTO `call_history` (`id`, `lead_id`, `type`, `remark`, `remark_by`, `datentime`, `dataentry_datentime`) VALUES
(1, 50, 1, 'Student did not receive call', 'BS2', 1728105443, 1728105443),
(2, 50, 1, 'not rcvd and rescheduled', 'BS2', 1731735787, 1731735787),
(3, 50, 1, 'reupdate', 'BS2', 1731735828, 1731735828),
(4, 50, 1, 'jsdfjdbskf', 'BS2', 1731735856, 1731735856);

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
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `chat_history`
--

INSERT INTO `chat_history` (`id`, `message`, `message_type`, `sender_id`, `receiver_id`, `datentime`, `status`) VALUES
(1, 'hi', 0, 'BS2', 'SP3', 1728037805, 0),
(2, 'Dear Yogesh , i am struggling to proceed with shiju trillion application because you are not proceeding', 0, 'SP2', 'BS2', 1728110030, 0),
(3, 'Hema, i ahve asked 1000 times for passsport copy. how do you expect me to proceed?\r\n', 0, 'BS2', 'SP2', 1728110077, 0),
(4, 'ok attached.', 0, 'SP2', 'BS2', 1728110113, 0);

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
  `comission_amount` decimal(10,2) NOT NULL,
  `comission_paid` int NOT NULL,
  `comission_paid_to` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `datentime` int NOT NULL,
  `transaction_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comission_paid_history`
--

INSERT INTO `comission_paid_history` (`id`, `lead_id`, `lead_amount`, `comission_amount`, `comission_paid`, `comission_paid_to`, `datentime`, `transaction_id`) VALUES
(1, 35, 27500, 825.00, 1, 'SP2', 1728017204, 'WT1728017204'),
(2, 45, 16700, 501.00, 1, 'SP2', 1725697308, 'WT1725697308'),
(3, 46, 24500, 2205.00, 1, 'SA2', 1726122343, 'WT1726122343'),
(4, 47, 33450, 2926.88, 1, 'SP3', 1728016273, 'WT1728016273'),
(5, 34, 57630, 1728.90, 1, 'SP2', 1728017788, 'WT1728017788'),
(6, 29, 35000, 3150.00, 1, 'SP1', 1728017788, 'WT1728017788'),
(7, 40, 30500, 2745.00, 1, 'SA3', 1728017788, 'WT1728017788'),
(8, 39, 56550, 5089.50, 1, 'SA2', 1728020074, 'WT1728020074'),
(9, 25, 0, 0.00, 1, 'SP3', 1728020074, 'WT1728020074'),
(10, 37, 15576, 1168.20, 1, 'SP3', 1728020074, 'WT1728020074'),
(11, 14, 15576, 1362.90, 1, 'SP3', 1728020183, 'WT1728020183'),
(12, 33, 40000, 3500.00, 1, 'SP3', 1728023597, 'WT1728023597'),
(13, 36, 29800, 1043.00, 1, 'SP2', 1728025083, 'WT1728025083');

-- --------------------------------------------------------

--
-- Table structure for table `countrywise_top10_university`
--

DROP TABLE IF EXISTS `countrywise_top10_university`;
CREATE TABLE IF NOT EXISTS `countrywise_top10_university` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uni_id` int NOT NULL,
  `country_id` int NOT NULL,
  `rank` int NOT NULL,
  `show_in_popular` int NOT NULL,
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
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `country_list`
--

INSERT INTO `country_list` (`id`, `name`, `currency`) VALUES
(1, 'usa', 'usd'),
(2, 'uk', 'gbp'),
(3, 'canada', 'cad'),
(4, 'germany', 'pound'),
(5, 'Australia', 'AUD');

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
  `subject_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=97 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `course_list`
--

INSERT INTO `course_list` (`id`, `name`, `type`, `intake`, `duration`, `eligibility`, `university_id`, `fee`, `scholarship_available`, `subject_id`) VALUES
(1, 'Bsc (HONS) Accounting & Finance', 'Undergraduate', 'Sep', 36, '12th', 1, 15900, 0, 0),
(2, 'Bsc (HONS) Architecture', 'Undergraduate', 'Sep', 36, '12th', 1, 16700, 0, 0),
(3, 'Bsc (HONS) Artificial Intelligence', 'Undergraduate', 'Sep', 36, '12th', 1, 16700, 0, 0),
(4, 'Bsc (HONS) Actuarial Science', 'Undergraduate', 'Sep', 36, '12th', 2, 24500, 0, 0),
(5, 'Bsc (HONS) Accounting & Finance', 'Undergraduate', 'Sep', 36, '12th', 2, 24500, 0, 0),
(6, 'MEng (HONS) Aeronautical Engineering', 'Undergraduate', 'Sep', 48, '12th', 2, 20760, 0, 0),
(7, 'Animation BA (HONS)', 'Undergraduate', 'Sep', 36, '12th', 3, 16250, 0, 0),
(8, 'Architecture BA (HONS)', 'Undergraduate', 'Sep', 36, '12th', 3, 15750, 0, 0),
(9, 'Business Management BA (HONS)', 'Undergraduate', 'Sep', 36, '12th', 3, 15750, 0, 0),
(10, 'BA (Hons) Accounting', 'Undergraduate', 'Sep', 48, '12th', 4, 14170, 0, 0),
(11, 'BSc (Hons) Biomedical Science', 'Undergraduate', 'Sep', 48, '12th', 4, 16680, 0, 0),
(12, 'BSc/BSc (Hons) Architectural Technology', 'Undergraduate', 'Sep', 48, '12th', 4, 16680, 0, 0),
(13, 'Business Management BSc', 'Undergraduate', 'Sep', 36, '12th', 5, 33450, 0, 0),
(14, 'Law LLB', 'Undergraduate', 'Sep', 36, '12th', 5, 29472, 0, 0),
(15, 'Physiotherapy BSc', 'Undergraduate', 'Sep', 36, '12th', 5, 33450, 0, 0),
(16, 'Digital Business Management - BSc (Hons)', 'Undergraduate', 'Sep', 36, '12th', 6, 15576, 0, 0),
(17, 'Architecture (Top-up) - BA (Hons)', 'Undergraduate', 'Sep', 12, '12th', 6, 19250, 0, 0),
(18, 'Architecture - BA (Hons)', 'Undergraduate', 'Sep', 36, '12th', 6, 17110, 0, 0),
(19, 'Graphic Design BA (Hons)', 'Undergraduate', 'Sep', 36, '12th', 7, 17900, 0, 0),
(20, 'Computer Science (Artificial Intelligence) BSc (Hons)', 'Undergraduate', 'Sep', 36, '12th', 7, 17150, 0, 0),
(21, 'Accounting and Finance BSc (Hons)', 'Undergraduate', 'Sep', 36, '12th', 7, 17150, 0, 0),
(22, 'Business Management BA (Hons)', 'Undergraduate', 'Sep', 36, '12th', 8, 14000, 0, 0),
(23, 'Digital Marketing BA (Hons)', 'Undergraduate', 'Sep', 36, '12th', 8, 14000, 0, 0),
(24, 'Events Management BA (Hons)', 'Undergraduate', 'Sep', 36, '12th', 8, 13500, 0, 0),
(25, 'BSc (Hons) Construction Management', 'Undergraduate', 'Sep', 36, '12th', 9, 16000, 0, 0),
(26, 'BSc (Hons) Data Science and Artificial Intelligence', 'Undergraduate', 'Sep', 36, '12th', 9, 16000, 0, 0),
(27, 'BSc (Hons) Architectural Technology', 'Undergraduate', 'Sep', 36, '12th', 9, 16000, 0, 0),
(28, 'Law with Criminology, LLB Hons', 'Undergraduate', 'Sep', 36, '12th', 10, 17000, 0, 0),
(29, 'Pharmaceutical Sciences, BSc (Hons)', 'Undergraduate', 'Sep', 36, '12th', 10, 17000, 0, 0),
(30, 'Mathematics and Computing, BSc (Hons)', 'Undergraduate', 'Sep', 36, '12th', 10, 15100, 0, 0),
(31, 'Master of Law', 'Post Graduate', 'Sep', 12, 'LLB', 33, 70430, 0, 0),
(32, 'Bachelor of Science [B.S] (Psychology)', 'Undergraduate', 'Nov', 48, '12th', 33, 56550, 0, 0),
(33, 'Bachelor of Science [B.S] Mechanical Engineering', 'Undergraduate', 'Nov', 48, '12th', 33, 56550, 0, 0),
(34, 'Bachelor of Arts in Neuroscience', 'Undergraduate', 'Sep', 48, '12th', 35, 57630, 0, 0),
(35, 'Bachelor of Arts in Chemistry', 'Undergraduate', 'Sep', 48, '12th', 35, 57630, 0, 0),
(36, 'Bachelor of Arts in Physics', 'Undergraduate', 'Sep', 48, '12th', 35, 57630, 0, 0),
(37, 'BS with a Major in Integrated Health Studies-Concentration in Health and Science', 'Undergraduate', 'Sep', 48, '12th', 36, 30554, 0, 0),
(38, 'BA in the Teaching of English', 'Undergraduate', 'Jan', 48, '12th', 36, 28718, 0, 0),
(39, 'BA in Art History', 'Undergraduate', 'Jan', 48, '12th', 36, 28718, 0, 0),
(40, 'BA in Chemical Physics', 'Undergraduate', 'Sep', 48, '12th', 37, 30754, 0, 0),
(41, 'B.S. in Computer Science', 'Undergraduate', 'Sep', 48, '12th', 37, 30754, 0, 0),
(42, 'B.S. in Mechanical Engineering', 'Undergraduate', 'Sep', 48, '12th', 37, 30754, 0, 0),
(43, 'Biomedical Science, BAS', 'Undergraduate', 'Sep', 48, '12th', 38, 46700, 0, 0),
(44, 'BA in Biochemistry', 'Undergraduate', 'Sep', 48, '12th', 38, 46700, 0, 0),
(45, 'BA in Biology', 'Undergraduate', 'Sep', 48, '12th', 38, 46700, 0, 0),
(46, 'B.Sc in Physics', 'Undergraduate', 'Sep', 36, '12th', 39, 26500, 0, 0),
(47, 'Bachelor of Medical Science', 'Undergraduate', 'Sep', 36, '12th', 39, 26500, 0, 0),
(48, 'BSc in Biochemistry', 'Undergraduate', 'Sep', 36, '12th', 39, 26500, 0, 0),
(49, 'Bachelor of Science in Psychology', 'Undergraduate', 'Sep', 36, '12th', 40, 27500, 0, 0),
(50, 'Bachelor of Science in Veterinary Bioscience', 'Undergraduate', 'Sep', 36, '12th', 40, 22000, 0, 0),
(51, 'Bachelor of Science in Marine Biology', 'Undergraduate', 'Sep', 36, '12th', 40, 26000, 0, 0),
(52, 'Bachelor of Science (Medical Science)', 'Undergraduate', 'Sep', 36, '12th', 41, 29800, 0, 0),
(53, 'Bachelor of Science in Geology and Geophysics', 'Undergraduate', 'Sep', 36, '12th', 41, 25200, 0, 0),
(54, 'Bachelor of Science in Genetics and Genomics', 'Undergraduate', 'Sep', 36, '12th', 41, 28000, 0, 0),
(55, 'Bachelor of Biotechnology', 'Undergraduate', 'Sep', 36, '12th', 42, 23000, 0, 0),
(56, 'Bachelor of Physiotherapy (Honours)', 'Undergraduate', 'Sep', 36, '12th', 42, 24000, 0, 0),
(57, 'Bachelor of Science', 'Undergraduate', 'Sep', 36, '12th', 42, 24000, 0, 0),
(58, 'Bachelor of Science in Psychology', 'Undergraduate', 'Sep', 36, '12th', 43, 24000, 0, 0),
(59, 'Bachelor of Health Sciences', 'Undergraduate', 'Sep', 36, '12th', 43, 21000, 0, 0),
(60, 'Bachelor of Science in Biochemistry', 'Undergraduate', 'Sep', 36, '12th', 43, 24000, 0, 0),
(61, 'Bachelor of Science in Geology', 'Undergraduate', 'Sep', 36, '12th', 44, 21500, 0, 0),
(62, 'Bachelor of Science (Marine Biology)', 'Undergraduate', 'Sep', 36, '12th', 44, 21500, 0, 0),
(63, 'Bachelor of Science in Physics', 'Undergraduate', 'Sep', 36, '12th', 44, 21500, 0, 0),
(64, 'Bachelor of Science in Psychology', 'Undergraduate', 'Sep', 36, '12th', 45, 0, 0, 0),
(65, 'Bachelor of Science in Biology', 'Undergraduate', 'Sep', 36, '12th', 45, 0, 0, 0),
(66, 'Bachelor of Science in Mathematics', 'Undergraduate', 'Sep', 36, '12th', 45, 0, 0, 0),
(67, 'Bachelor of Science in Psychology', 'Undergraduate', 'Sep', 36, '12th', 46, 0, 0, 0),
(68, 'Bachelor of Science in Bioinformatics', 'Undergraduate', 'Sep', 36, '12th', 46, 0, 0, 0),
(69, 'MSc Data Science', 'Post Graduate', 'Sep', 24, 'UG', 46, 0, 0, 0),
(70, 'Molecular Biotechnology - Bachelor of Science (BSc)', 'Undergraduate', 'Sep', 36, '12th', 47, 2600, 0, 0),
(71, 'Bachelors in Biology', 'Undergraduate', 'Sep', 36, '12th', 47, 2600, 0, 0),
(72, 'BSc in Earth Sciences', 'Undergraduate', 'Sep', 36, '12th', 47, 2600, 0, 0),
(73, 'Master in Data Science', 'Post Graduate', 'Sep', 24, 'UG', 49, 2700, 0, 0),
(74, 'M.Sc. in Mathematics in Business and Economics', 'Post Graduate', 'Sep', 24, 'UG', 49, 2700, 0, 0),
(75, 'Master of Science in Business Informatics', 'Post Graduate', 'Sep', 24, 'UG', 49, 2700, 0, 0),
(76, 'Bachelor of Arts (B.A)', 'Undergraduate', 'Sep', 36, '12th', 50, 0, 0, 0),
(77, 'BS in Mathematical Data ScienceÂ ', 'Undergraduate', 'Sep', 36, '12th', 50, 0, 0, 0),
(78, 'BS in Biology', 'Undergraduate', 'Sep', 36, '12th', 50, 0, 0, 0),
(79, 'BSc Hons in Psychology', 'Undergraduate', 'Sep', 48, '12th', 51, 60000, 0, 0),
(80, 'BSc Hons in Biology', 'Undergraduate', 'Sep', 48, '12th', 51, 60000, 0, 0),
(81, 'BSc Hons in Biochemistry', 'Undergraduate', 'Sep', 48, '12th', 51, 60000, 0, 0),
(82, 'Bachelor of Science in Microbiology and Immunology', 'Undergraduate', 'Sep', 48, '12th', 52, 48000, 0, 0),
(83, 'Bachelor of Science in Biology', 'Undergraduate', 'Sep', 48, '12th', 52, 48000, 0, 0),
(84, 'Bachelor of Science in Zoology', 'Undergraduate', 'Sep', 48, '12th', 52, 48000, 0, 0),
(85, 'Bachelor of Science (BSc) Hons. Applied Mathematics', 'Undergraduate', 'Sep', 48, '12th', 53, 40000, 0, 0),
(86, 'Bachelor of Science in Kinesiology (BSc(Kinesiology))', 'Undergraduate', 'Sep', 36, '12th', 53, 40000, 0, 0),
(87, 'Bachelor of Arts/ Bachelor of Science (BSc) in Psychology', 'Undergraduate', 'Sep', 48, '12th', 53, 40000, 0, 0),
(88, 'Bachelor of Science Honours in Neuroscience', 'Undergraduate', 'Sep', 48, '12th', 54, 35000, 0, 0),
(89, 'Bachelor of Science Honours Life Sciences', 'Undergraduate', 'Sep', 48, '12th', 54, 35000, 0, 0),
(90, 'Bachelor of Technology in Biotechnology', 'Undergraduate', 'Sep', 48, '12th', 54, 35000, 0, 0),
(91, 'Bachelor of Medical Imaging (Honours)', 'Undergraduate', 'Sep', 36, '12th', 55, 35000, 0, 0),
(92, 'Bachelor of Science in Biological Sciences', 'Undergraduate', 'Sep', 36, '12th', 55, 35000, 0, 0),
(93, 'Bachelor of Vision Science', 'Undergraduate', 'Sep', 36, '12th', 55, 35000, 0, 0),
(94, 'Bachelor of Science (BSc) General', 'Undergraduate', 'Sep', 36, '12th', 56, 30500, 0, 0),
(95, 'BSc Biological Sciences', 'Undergraduate', 'Sep', 36, '12th', 56, 30500, 0, 0),
(96, 'BSc Hons Applied Mathematics', 'Undergraduate', 'Sep', 36, '12th', 56, 30500, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `customers_list`
--

DROP TABLE IF EXISTS `customers_list`;
CREATE TABLE IF NOT EXISTS `customers_list` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `mobile` bigint NOT NULL,
  `alt_mobile` bigint NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `dob` int NOT NULL,
  `brief_note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `company_name` varchar(1024) COLLATE utf8mb4_general_ci NOT NULL,
  `cust_type` int NOT NULL,
  `permanent_address` varchar(5120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `lead_source_id` int NOT NULL,
  `primary_bank` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1007 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers_list`
--

INSERT INTO `customers_list` (`id`, `name`, `mobile`, `alt_mobile`, `email`, `dob`, `brief_note`, `company_name`, `cust_type`, `permanent_address`, `lead_source_id`, `primary_bank`) VALUES
(1001, 'Veeru', 9922001235, 0, 'veeru@st.com', 0, 'No Note', 'ABC Traders', 2, 'Hebbal', 1, 0),
(1002, 'arpita', 9945251325, 1234569870, 'arpita@st.com', 0, 'No Note', '', 1, 'hebbala', 5, 0),
(1004, 'Arpita Sinha', 1452369870, 2563149870, 'arpitasinha@st.com', 0, 'No Note', 'Arpita Traders', 2, 'hebbala', 5, 7),
(1005, 'Sarala Sinha', 1452369870, 2563141234, 'saralasinha@test.com', 0, 'Special Remark', '', 1, 'hebbala bangalore', 5, 0),
(1006, 'Suhana', 9922001234, 5236498710, 'suhana@st.com', 0, 'No Note', '', 1, 'Yelahnka Bangalore', 3, 0);

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
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `deletion_pending_leads`
--

INSERT INTO `deletion_pending_leads` (`id`, `lead_id`, `status_before_req`, `batch_id`, `req_by`, `req_datentime`, `approved_by`, `approval_datentime`, `req_remark`, `approval_remark`) VALUES
(1, 6, 1, 1, 3, 1724826597, 2, 1724826808, 'Not Interested', 'Verify on Call, Not Interested'),
(2, 32, 1, 1, 3, 1724827848, 2, 1724828103, 'Not Interested', 'Approve Deletion'),
(3, 38, 1, 1, 3, 1724828969, 2, 1724829100, 'Not Interested', 'Approved'),
(4, 2, 1, 1, 3, 1724830593, 2, 1724830632, 'Deletion Email Testing', 'Approved'),
(5, 42, 1, 1, 3, 1724831077, 2, 1724831263, 'Request Deletion', 'Approved'),
(6, 43, 1, 1, 3, 1724831702, 2, 1724832140, 'Request Lead', 'approved on call verification'),
(7, 44, 1, 1, 3, 1724832071, 0, 0, 'Student Not Interested', ''),
(8, 54, 1, 1, 3, 1731734337, 2, 1731734409, 'request to delete', 'approve testin');

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
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `document_list`
--

INSERT INTO `document_list` (`id`, `name`, `uploaded_file_name`, `is_required`) VALUES
(1, 'Student Photo', 'student_photo', 0),
(2, '10th Marksheet', '10th_makrksheet', 0),
(3, '10th Certificate', '10th_certificate', 0),
(4, 'Letter of Recommendation', 'lor', 0),
(5, 'Statement of Purpose', 'sop', 0),
(6, 'Highest Education Proof', 'highest_education_proof', 1),
(8, 'Passport', 'passport', 1);

-- --------------------------------------------------------

--
-- Table structure for table `email_alerts_setup`
--

DROP TABLE IF EXISTS `email_alerts_setup`;
CREATE TABLE IF NOT EXISTS `email_alerts_setup` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email_trigger_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `from_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `to_emails` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `on_actions` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `email_alerts_setup`
--

INSERT INTO `email_alerts_setup` (`id`, `email_trigger_type`, `from_email`, `to_emails`, `on_actions`) VALUES
(2, 'Secondary', 'support@campus-abroad.co.in', 'amit@moticorporation.com,accounts@bafna.net', '1,2'),
(4, 'Primary', 'support@campus-abroad.co.in', 'amit@moticorporation.com,yogesh@bafna.net', '1,2,3,4,6,7,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27'),
(5, 'Red alert', 'ShijuGBP@GBP.com', 'gyb@gyb.com', '1,2,3');

-- --------------------------------------------------------

--
-- Table structure for table `email_history`
--

DROP TABLE IF EXISTS `email_history`;
CREATE TABLE IF NOT EXISTS `email_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `content` varchar(5120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `recipients` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sender` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `datentime` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=330 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `email_history`
--

INSERT INTO `email_history` (`id`, `type`, `subject`, `content`, `recipients`, `sender`, `datentime`) VALUES
(1, 'New Backend Staff Signup Alert', 'Welcome Pradeep Ranka to Campus-Abroad', 'New Backend Staff Signup Alert', 'pradeep@bs.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724408988),
(2, 'URN Allocation Alert', 'CA171814 URN Allocation Alert', 'URN Allocation Alert', 'mamta@sa.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724413330),
(3, 'URN Allocation Alert', 'CA171814 URN Allocation Alert', 'URN Allocation Alert', 'yogesh@sa.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724413374),
(4, 'Document Upload Alert', 'CA361439 Document Upload Alert', 'Document Upload Alert', 'jasi@st.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724820673),
(5, 'URN Profile Update Alert', 'CA361439 URN Profile Update Alert', 'URN Profile Update Alert', 'jasi@st.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724820777),
(6, 'Academic Details Updated Alert', 'CA361439 Academic Details Updated Alert', 'Academic Details Updated Alert', 'jasi@st.com', 'support@campus-abroad.co.in', 1724822020),
(7, 'Document Upload Alert', 'CA655074 Document Upload Alert', 'Document Upload Alert', 'abhigailstephen123@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724822363),
(8, 'Document Upload Alert', 'CA655074 Document Upload Alert', 'Document Upload Alert', 'abhigailstephen123@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724822377),
(9, 'Academic Details Update Alert', 'CA361439 Academic Details Update Alert', 'Academic Details Update Alert', 'jasi@st.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724822425),
(10, 'Additional Details Updated Alert', 'CA361439 Additional Details Updated Alert', 'Additional Details Updated Alert', 'jasi@st.com', 'support@campus-abroad.co.in', 1724822520),
(11, 'Academic Details Update Alert', 'CA655074 Academic Details Update Alert', 'Academic Details Update Alert', 'abhigailstephen123@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724822588),
(12, 'Additional Details Update Alert', 'CA361439 Additional Details Update Alert', 'Additional Details Update Alert', 'jasi@st.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724822662),
(13, 'Additional Details Update Alert', 'CA655074 Additional Details Update Alert', 'Additional Details Update Alert', 'abhigailstephen123@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724822855),
(14, 'URN Allocation Alert', 'CA655074 URN Allocation Alert', 'URN Allocation Alert', 'jasi@sa.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724822907),
(15, 'Course Selection Updated Alert', 'CA361439 Course Selection Updated Alert', 'Course Selection Updated Alert', 'jasi@st.com', 'support@campus-abroad.co.in', 1724822924),
(16, 'Course Selection Update Alert', 'CA361439 Course Selection Update Alert', 'Course Selection Update Alert', 'jasi@st.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724823185),
(17, 'URN Allocation Alert', 'CA361439 URN Allocation Alert', 'URN Allocation Alert', 'mamta@sa.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724823219),
(18, 'URN Allocation Alert', 'CA361439 URN Allocation Alert', 'URN Allocation Alert', 'jasi@sa.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724823283),
(19, 'New Callback Set Alert', 'CA361439 New Callback Set Alert', 'New Callback Set Alert', 'jasi@st.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724823358),
(20, 'Document Upload Alert', 'CA792686 Document Upload Alert', 'Document Upload Alert', 'Adithya67@gamil.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724823364),
(21, 'Document Upload Alert', 'CA101896 Document Upload Alert', 'Document Upload Alert', 'Alshiyaashok@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724823469),
(22, 'URN Allocation Alert', 'CA101896 URN Allocation Alert', 'URN Allocation Alert', 'yogesh@sa.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724823493),
(23, 'URN Allocation Alert', 'CA361439 URN Allocation Alert', 'URN Allocation Alert', 'mamta@sa.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724823524),
(24, 'Document Upload Alert', 'CA131828 Document Upload Alert', 'Document Upload Alert', 'Aruns501@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724823575),
(25, 'Document Upload Alert', 'CA943645 Document Upload Alert', 'Document Upload Alert', 'Amitha996@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724823821),
(26, 'Document Upload Alert', 'CA582916 Document Upload Alert', 'Document Upload Alert', 'Ashwini101@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724823897),
(27, 'Document Upload Alert', 'CA365110 Document Upload Alert', 'Document Upload Alert', 'Bhavya996@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724823955),
(28, 'URN Allocation Alert', 'CA928158 URN Allocation Alert', 'URN Allocation Alert', 'jasi@sa.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724824010),
(29, 'Document Upload Alert', 'CA448541 Document Upload Alert', 'Document Upload Alert', 'charan@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724824105),
(30, 'Document Upload Alert', 'CA516072 Document Upload Alert', 'Document Upload Alert', 'chiranjeevi@gamil.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724824180),
(31, 'URN Allocation Alert', 'CA516072 URN Allocation Alert', 'URN Allocation Alert', 'jasi@sa.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724824203),
(32, 'Document Upload Alert', 'CA742352 Document Upload Alert', 'Document Upload Alert', 'darshan@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724824274),
(33, 'URN Allocation Alert', 'CA742352 URN Allocation Alert', 'URN Allocation Alert', 'jasi@sa.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724824286),
(34, 'Document Upload Alert', 'CA834547 Document Upload Alert', 'Document Upload Alert', 'deepadominic@gmaail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724824364),
(35, 'URN Allocation Alert', 'CA834547 URN Allocation Alert', 'URN Allocation Alert', 'jasi@sa.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724824376),
(36, 'URN Allocation Alert', 'CA738761 URN Allocation Alert', 'URN Allocation Alert', 'jasi@sa.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724824442),
(37, 'URN Allocation Alert', 'CA663542 URN Allocation Alert', 'URN Allocation Alert', 'jasi@sa.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724824502),
(38, 'Document Upload Alert', 'CA884026 Document Upload Alert', 'Document Upload Alert', 'elezabeth@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724824812),
(39, 'URN Allocation Alert', 'CA884026 URN Allocation Alert', 'URN Allocation Alert', 'jasi@sa.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724824836),
(40, 'URN Allocation Alert', 'CA481061 URN Allocation Alert', 'URN Allocation Alert', 'mamta@sa.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724824892),
(41, 'URN Profile Update Alert', 'CA361439 URN Profile Update Alert', 'URN Profile Update Alert', 'jasi@st.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724824971),
(42, 'URN Allocation Alert', 'CA434685 URN Allocation Alert', 'URN Allocation Alert', 'jasi@sa.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724824984),
(43, 'Course Selection Update Alert', 'CA361439 Course Selection Update Alert', 'Course Selection Update Alert', 'jasi@st.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724825044),
(44, 'Academic Details Update Alert', 'CA361439 Academic Details Update Alert', 'Academic Details Update Alert', 'jasi@st.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724825103),
(45, 'URN Allocation Alert', 'CA575530 URN Allocation Alert', 'URN Allocation Alert', 'jasi@sa.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724825204),
(46, 'New Sales Person Signup Alert', 'Welcome Hema to Campus-Abroad', 'New Sales Person Signup Alert', 'Hema@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724825270),
(47, 'URN Allocation Alert', 'CA520169 URN Allocation Alert', 'URN Allocation Alert', 'Hema@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724825438),
(48, 'Document Upload Alert', 'CA751713 Document Upload Alert', 'Document Upload Alert', 'jeni@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724825503),
(49, 'URN Allocation Alert', 'CA891032 URN Allocation Alert', 'URN Allocation Alert', 'yogesh@sa.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724825654),
(50, 'URN Allocation Alert', 'CA389944 URN Allocation Alert', 'URN Allocation Alert', 'Hema@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724825721),
(51, 'Document Upload Alert', 'CA440067 Document Upload Alert', 'Document Upload Alert', 'kruthika@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724825905),
(52, 'URN Allocation Alert', 'CA497752 URN Allocation Alert', 'URN Allocation Alert', 'Hema@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724825981),
(53, 'Document Upload Alert', 'CA390400 Document Upload Alert', 'Document Upload Alert', 'malathi@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724826493),
(54, 'URN Allocation Alert', 'CA390400 URN Allocation Alert', 'URN Allocation Alert', 'jasi@sa.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724826686),
(55, 'Document Upload Alert', 'CA202114 Document Upload Alert', 'Document Upload Alert', 'manohar@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724827177),
(56, 'URN Allocation Alert', 'CA202114 URN Allocation Alert', 'URN Allocation Alert', 'Hema@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724827188),
(57, 'URN Allocation Alert', 'CA356393 URN Allocation Alert', 'URN Allocation Alert', 'Hema@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724827254),
(58, 'Status Updated Alert', 'CA751713 Status Updated Alert', 'Status Updated Alert', 'jeni@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724827297),
(59, 'Document Upload Alert', 'CA968293 Document Upload Alert', 'Document Upload Alert', 'mitesh@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724827302),
(60, 'URN Allocation Alert', 'CA178908 URN Allocation Alert', 'URN Allocation Alert', 'jasi@sa.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724827342),
(61, 'Document Upload Alert', 'CA714621 Document Upload Alert', 'Document Upload Alert', 'naveen@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724827390),
(62, 'Document Upload Alert', 'CA569799 Document Upload Alert', 'Document Upload Alert', 'nikitha@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724827448),
(63, 'Document Upload Alert', 'CA507414 Document Upload Alert', 'Document Upload Alert', 'parthiban@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724827524),
(64, 'URN Allocation Alert', 'CA507414 URN Allocation Alert', 'URN Allocation Alert', 'jasi@sa.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724827536),
(65, 'URN Allocation Alert', 'CA480905 URN Allocation Alert', 'URN Allocation Alert', 'Hema@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724827585),
(66, 'Document Upload Alert', 'CA480905 Document Upload Alert', 'Document Upload Alert', 'ranjitha@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724827639),
(67, 'URN Allocation Alert', 'CA873227 URN Allocation Alert', 'URN Allocation Alert', 'Hema@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724827672),
(68, 'URN Allocation Alert', 'CA463188 URN Allocation Alert', 'URN Allocation Alert', 'mamta@sa.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724827718),
(69, 'Status Updated Alert', 'CA751713 Status Updated Alert', 'Status Updated Alert', 'jeni@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724827754),
(70, 'URN Allocation Alert', 'CA184732 URN Allocation Alert', 'URN Allocation Alert', 'jasi@sa.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724827779),
(71, 'URN Allocation Alert', 'CA635769 URN Allocation Alert', 'URN Allocation Alert', 'jasi@sa.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724827824),
(72, 'URN Profile Update Alert', 'CA873227 URN Profile Update Alert', 'URN Profile Update Alert', 'pavithra@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724828310),
(73, 'Academic Details Update Alert', 'CA873227 Academic Details Update Alert', 'Academic Details Update Alert', 'pavithra@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724828437),
(74, 'Additional Details Update Alert', 'CA873227 Additional Details Update Alert', 'Additional Details Update Alert', 'pavithra@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724828635),
(75, 'URN Profile Update Alert', 'CA480905 URN Profile Update Alert', 'URN Profile Update Alert', 'ranjitha@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724828887),
(76, 'Academic Details Update Alert', 'CA480905 Academic Details Update Alert', 'Academic Details Update Alert', 'ranjitha@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724829043),
(77, 'URN Profile Update Alert', 'CA356393 URN Profile Update Alert', 'URN Profile Update Alert', 'megha@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724830321),
(78, 'Academic Details Update Alert', 'CA356393 Academic Details Update Alert', 'Academic Details Update Alert', 'megha@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724830406),
(79, 'Additional Details Update Alert', 'CA356393 Additional Details Update Alert', 'Additional Details Update Alert', 'megha@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724830482),
(80, 'Deleted Alert', 'CA251129 Deleted', 'CA251129 Deleted', 'rajiv@st.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724830543),
(81, 'Deleted Alert', 'CA655074 Deleted', 'CA655074 Deleted', 'abhigailstephen123@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724830764),
(82, 'Academic Details Update Alert', 'CA520169 Academic Details Update Alert', 'Academic Details Update Alert', 'jananasprin@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724830962),
(83, 'URN Deleted Alert', 'CA792686 Deleted Alert', 'CA792686 Deleted Alert', 'Adithya67@gamil.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724831003),
(84, 'Additional Details Update Alert', 'CA520169 Additional Details Update Alert', 'Additional Details Update Alert', 'jananasprin@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724831038),
(85, 'Academic Details Update Alert', 'CA569799 Academic Details Update Alert', 'Academic Details Update Alert', 'nikitha@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724831283),
(86, 'Additional Details Update Alert', 'CA569799 Additional Details Update Alert', 'Additional Details Update Alert', 'nikitha@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724831628),
(87, 'Status Updated Alert', 'CA Status Updated Alert', 'Status Updated Alert', ',amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724831708),
(88, 'Status Updated Alert', 'CA248663 Status Updated Alert', 'Status Updated Alert', 'sharath@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724832082),
(89, 'URN Deleted Alert', 'CA445560 Deleted Alert', 'CA445560 Deleted Alert', 'srinidhi@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724832151),
(90, 'Status Updated Alert', 'CA569799 Status Updated Alert', 'Status Updated Alert', 'nikitha@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724832192),
(91, 'Status Updated Alert', 'CA569799 Status Updated Alert', 'Status Updated Alert', 'nikitha@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724832325),
(92, 'URN Applied Alert', 'CA569799 Applied Alert', 'CA569799 Applied Alert', 'nikitha@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724832396),
(93, 'URN URN Approved Alert', 'CA569799 URN Approved Alert', 'CA569799 URN Approved Alert', 'nikitha@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724832549),
(94, 'URN Allocation Alert', 'CA569799 URN Allocation Alert', 'URN Allocation Alert', 'Hema@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724832624),
(95, 'Status Updated Alert', 'CA635769 Status Updated Alert', 'Status Updated Alert', 'priya@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724832938),
(96, 'Document Upload Alert', 'CA635769 Document Upload Alert', 'Document Upload Alert', 'priya@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724833029),
(97, 'URN Visa Applied Alert', 'CA569799 Visa Applied Alert', 'CA569799 Visa Applied Alert', 'nikitha@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724833303),
(98, 'URN Visa Approved Alert', 'CA569799 Visa Approved Alert', 'CA569799 Visa Approved Alert', 'nikitha@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724833352),
(99, 'URN Fee Paid Alert', 'CA569799 Fee Paid Alert', 'CA569799 Fee Paid Alert', 'nikitha@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724833519),
(100, 'Status Updated Alert', 'CA569799 Status Updated Alert', 'Status Updated Alert', 'nikitha@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724833562),
(101, 'URN Allocation Alert', 'CA714621 URN Allocation Alert', 'URN Allocation Alert', 'Hema@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724833815),
(102, 'New Callback Set Alert', 'CA714621 New Callback Set Alert', 'New Callback Set Alert', 'naveen@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724833881),
(103, 'Academic Details Update Alert', 'CA714621 Academic Details Update Alert', 'Academic Details Update Alert', 'naveen@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724833998),
(104, 'Additional Details Update Alert', 'CA714621 Additional Details Update Alert', 'Additional Details Update Alert', 'naveen@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724834116),
(105, 'Status Updated Alert', 'CA714621 Status Updated Alert', 'Status Updated Alert', 'naveen@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724834154),
(106, 'Status Updated Alert', 'CA714621 Status Updated Alert', 'Status Updated Alert', 'naveen@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724834197),
(107, 'New Callback Set Alert', 'CA663542 New Callback Set Alert', 'New Callback Set Alert', 'ethanalvin@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724834267),
(108, 'URN Profile Update Alert', 'CA635769 URN Profile Update Alert', 'URN Profile Update Alert', 'priya@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724834335),
(109, 'URN Applied Alert', 'CA714621 Applied Alert', 'CA714621 Applied Alert', 'naveen@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724834635),
(110, 'Status Updated Alert', 'CA742352 Status Updated Alert', 'Status Updated Alert', 'darshan@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724834719),
(111, 'Academic Details Update Alert', 'CA742352 Academic Details Update Alert', 'Academic Details Update Alert', 'darshan@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724834854),
(112, 'Document Upload Alert', 'CA635769 Document Upload Alert', 'Document Upload Alert', 'priya@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724835255),
(113, 'Additional Details Update Alert', 'CA742352 Additional Details Update Alert', 'Additional Details Update Alert', 'darshan@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724837190),
(114, 'URN URN Approved Alert', 'CA714621 URN Approved Alert', 'CA714621 URN Approved Alert', 'naveen@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724837309),
(115, 'URN Visa Applied Alert', 'CA714621 Visa Applied Alert', 'CA714621 Visa Applied Alert', 'naveen@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724837343),
(116, 'URN Visa Approved Alert', 'CA714621 Visa Approved Alert', 'CA714621 Visa Approved Alert', 'naveen@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724837838),
(117, 'Status Updated Alert', 'CA635769 Status Updated Alert', 'Status Updated Alert', 'priya@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724837922),
(118, 'URN Applied Alert', 'CA635769 Applied Alert', 'CA635769 Applied Alert', 'priya@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724837994),
(119, 'URN URN Rejected Alert', 'CA635769 URN Rejected Alert', 'CA635769 URN Rejected Alert', 'priya@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724838158),
(120, 'URN Deleted Alert', 'CA751713 Deleted Alert', 'CA751713 Deleted Alert', 'jeni@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724838275),
(121, 'New Callback Set Alert', 'CA184732 New Callback Set Alert', 'New Callback Set Alert', 'nishanth@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724838411),
(122, 'New Callback Set Alert', 'CA184732 New Callback Set Alert', 'New Callback Set Alert', 'nishanth@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724838423),
(123, 'New Callback Set Alert', 'CA184732 New Callback Set Alert', 'New Callback Set Alert', 'nishanth@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724838434),
(124, 'Document Upload Alert', 'CA184732 Document Upload Alert', 'Document Upload Alert', 'nishanth@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724838485),
(125, 'Academic Details Update Alert', 'CA184732 Academic Details Update Alert', 'Academic Details Update Alert', 'nishanth@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724839496),
(126, 'Additional Details Update Alert', 'CA184732 Additional Details Update Alert', 'Additional Details Update Alert', 'nishanth@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724839581),
(127, 'Status Updated Alert', 'CA184732 Status Updated Alert', 'Status Updated Alert', 'nishanth@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724839642),
(128, 'Status Updated Alert', 'CA184732 Status Updated Alert', 'Status Updated Alert', 'nishanth@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724839778),
(129, 'URN Applied Alert', 'CA184732 Applied Alert', 'CA184732 Applied Alert', 'nishanth@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724840761),
(130, 'Academic Details Update Alert', 'CA440067 Academic Details Update Alert', 'Academic Details Update Alert', 'kruthika@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724840859),
(131, 'Additional Details Update Alert', 'CA440067 Additional Details Update Alert', 'Additional Details Update Alert', 'kruthika@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724840940),
(132, 'Status Updated Alert', 'CA440067 Status Updated Alert', 'Status Updated Alert', 'kruthika@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724840972),
(133, 'Status Updated Alert', 'CA440067 Status Updated Alert', 'Status Updated Alert', 'kruthika@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724841005),
(134, 'URN Applied Alert', 'CA440067 Applied Alert', 'CA440067 Applied Alert', 'kruthika@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724841036),
(135, 'URN URN Approved Alert', 'CA440067 URN Approved Alert', 'CA440067 URN Approved Alert', 'kruthika@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724841066),
(136, 'Academic Details Update Alert', 'CA202114 Academic Details Update Alert', 'Academic Details Update Alert', 'manohar@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724841136),
(137, 'Additional Details Update Alert', 'CA202114 Additional Details Update Alert', 'Additional Details Update Alert', 'manohar@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724841212),
(138, 'Academic Details Update Alert', 'CA463188 Academic Details Update Alert', 'Academic Details Update Alert', 'praveen@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724841293),
(139, 'Additional Details Update Alert', 'CA463188 Additional Details Update Alert', 'Additional Details Update Alert', 'praveen@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724841460),
(140, 'Status Updated Alert', 'CA463188 Status Updated Alert', 'Status Updated Alert', 'praveen@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724841533),
(141, 'Status Updated Alert', 'CA463188 Status Updated Alert', 'Status Updated Alert', 'praveen@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724841577),
(142, 'Academic Details Update Alert', 'CA390400 Academic Details Update Alert', 'Academic Details Update Alert', 'malathi@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724841820),
(143, 'Additional Details Update Alert', 'CA390400 Additional Details Update Alert', 'Additional Details Update Alert', 'malathi@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724842006),
(144, 'Status Updated Alert', 'CA390400 Status Updated Alert', 'Status Updated Alert', 'malathi@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724842079),
(145, 'Status Updated Alert', 'CA390400 Status Updated Alert', 'Status Updated Alert', 'malathi@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724842114),
(146, 'URN Applied Alert', 'CA390400 Applied Alert', 'CA390400 Applied Alert', 'malathi@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724842202),
(147, 'Document Upload Alert', 'CA389944 Document Upload Alert', 'Document Upload Alert', 'kavana@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724842268),
(148, 'Academic Details Update Alert', 'CA389944 Academic Details Update Alert', 'Academic Details Update Alert', 'kavana@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724842354),
(149, 'Additional Details Update Alert', 'CA389944 Additional Details Update Alert', 'Additional Details Update Alert', 'kavana@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724842426),
(150, 'Status Updated Alert', 'CA389944 Status Updated Alert', 'Status Updated Alert', 'kavana@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724842458),
(151, 'URN URN Approved Alert', 'CA184732 URN Approved Alert', 'CA184732 URN Approved Alert', 'nishanth@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724842494),
(152, 'URN Visa Applied Alert', 'CA440067 Visa Applied Alert', 'CA440067 Visa Applied Alert', 'kruthika@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724842524),
(153, 'URN Visa Rejected Alert', 'CA440067 Visa Rejected Alert', 'CA440067 Visa Rejected Alert', 'kruthika@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724842598),
(154, 'URN Visa Applied Alert', 'CA184732 Visa Applied Alert', 'CA184732 Visa Applied Alert', 'nishanth@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724843534),
(155, 'URN URN Approved Alert', 'CA390400 URN Approved Alert', 'CA390400 URN Approved Alert', 'malathi@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724843572),
(156, 'URN Applied Alert', 'CA463188 Applied Alert', 'CA463188 Applied Alert', 'praveen@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724843623),
(157, 'URN URN Approved Alert', 'CA463188 URN Approved Alert', 'CA463188 URN Approved Alert', 'praveen@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724843671),
(158, 'Status Updated Alert', 'CA389944 Status Updated Alert', 'Status Updated Alert', 'kavana@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724843728),
(159, 'URN Applied Alert', 'CA389944 Applied Alert', 'CA389944 Applied Alert', 'kavana@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724843760),
(160, 'Status Updated Alert', 'CA742352 Status Updated Alert', 'Status Updated Alert', 'darshan@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724843808),
(161, 'Document Upload Alert', 'CA466509 Document Upload Alert', 'Document Upload Alert', 'kiran@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724843885),
(162, 'Academic Details Update Alert', 'CA466509 Academic Details Update Alert', 'Academic Details Update Alert', 'kiran@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724844069),
(163, 'Additional Details Update Alert', 'CA466509 Additional Details Update Alert', 'Additional Details Update Alert', 'kiran@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724844170),
(164, 'URN Allocation Alert', 'CA466509 URN Allocation Alert', 'URN Allocation Alert', 'jasi@sa.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724844286),
(165, 'Status Updated Alert', 'CA466509 Status Updated Alert', 'Status Updated Alert', 'kiran@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724844322),
(166, 'URN Visa Applied Alert', 'CA390400 Visa Applied Alert', 'CA390400 Visa Applied Alert', 'malathi@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724844361),
(167, 'URN Visa Approved Alert', 'CA390400 Visa Approved Alert', 'CA390400 Visa Approved Alert', 'malathi@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724844395),
(168, 'URN Fee Paid Alert', 'CA714621 Fee Paid Alert', 'CA714621 Fee Paid Alert', 'naveen@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724844428),
(169, 'Document Upload Alert', 'CA178908 Document Upload Alert', 'Document Upload Alert', 'mugilraj@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724846524),
(170, 'Academic Details Update Alert', 'CA178908 Academic Details Update Alert', 'Academic Details Update Alert', 'mugilraj@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724846628),
(171, 'Additional Details Update Alert', 'CA178908 Additional Details Update Alert', 'Additional Details Update Alert', 'mugilraj@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724846736),
(172, 'Status Updated Alert', 'CA178908 Status Updated Alert', 'Status Updated Alert', 'mugilraj@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724846796),
(173, 'Status Updated Alert', 'CA178908 Status Updated Alert', 'Status Updated Alert', 'mugilraj@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1724846870),
(174, 'Document Upload Alert', 'CA344605 Document Upload Alert', 'Document Upload Alert', 'rajkumar@st.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1725695267),
(175, 'URN Allocation Alert', 'CA344605 URN Allocation Alert', 'URN Allocation Alert', 'Hema@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1725695308),
(176, 'Status Updated Alert', 'CA344605 Status Updated Alert', 'Status Updated Alert', 'rajkumar@st.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1725695374),
(177, 'Status Updated Alert', 'CA344605 Status Updated Alert', 'Status Updated Alert', 'rajkumar@st.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1725695405),
(178, 'URN Applied Alert', 'CA344605 Applied Alert', 'CA344605 Applied Alert', 'rajkumar@st.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1725695441),
(179, 'URN Applied Alert', 'CA344605 Applied Alert', 'CA344605 Applied Alert', 'rajkumar@st.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1725695453),
(180, 'URN URN Approved Alert', 'CA344605 URN Approved Alert', 'CA344605 URN Approved Alert', 'rajkumar@st.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1725697096),
(181, 'URN Visa Applied Alert', 'CA344605 Visa Applied Alert', 'CA344605 Visa Applied Alert', 'rajkumar@st.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1725697142),
(182, 'URN Visa Approved Alert', 'CA344605 Visa Approved Alert', 'CA344605 Visa Approved Alert', 'rajkumar@st.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1725697173),
(183, 'URN Fee Paid Alert', 'CA344605 Fee Paid Alert', 'CA344605 Fee Paid Alert', 'rajkumar@st.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1725697199),
(184, 'Status Updated Alert', 'CA344605 Status Updated Alert', 'Status Updated Alert', 'rajkumar@st.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1725697239),
(185, 'New Callback Set Alert', 'CA480905 New Callback Set Alert', 'New Callback Set Alert', 'ranjitha@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1725700361),
(186, 'Course Selection Update Alert', 'CA480905 Course Selection Update Alert', 'Course Selection Update Alert', 'ranjitha@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1726033903),
(187, 'URN Profile Update Alert', 'CA480905 URN Profile Update Alert', 'URN Profile Update Alert', 'ranjitha@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1726033937),
(188, 'Status Updated Alert', 'CA480905 Status Updated Alert', 'Status Updated Alert', 'ranjitha@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1726034078),
(189, 'Status Updated Alert', 'CA480905 Status Updated Alert', 'Status Updated Alert', 'ranjitha@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1726034121),
(190, 'URN Applied Alert', 'CA480905 Applied Alert', 'CA480905 Applied Alert', 'ranjitha@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1726034156),
(191, 'Status Updated Alert', 'CA507414 Status Updated Alert', 'Status Updated Alert', 'parthiban@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1726115438),
(192, 'Status Updated Alert', 'CA507414 Status Updated Alert', 'Status Updated Alert', 'parthiban@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1726115482),
(193, 'Document Upload Alert', 'CA507414 Document Upload Alert', 'Document Upload Alert', 'parthiban@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1726115565),
(194, 'Document Upload Alert', 'CA233708 Document Upload Alert', 'Document Upload Alert', 'raj@st.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1726120996),
(195, 'Academic Details Update Alert', 'CA233708 Academic Details Update Alert', 'Academic Details Update Alert', 'raj@st.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1726121136),
(196, 'Additional Details Update Alert', 'CA233708 Additional Details Update Alert', 'Additional Details Update Alert', 'raj@st.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1726121240),
(197, 'URN Profile Update Alert', 'CA233708 URN Profile Update Alert', 'URN Profile Update Alert', 'raj@st.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1726121333),
(198, 'URN Allocation Alert', 'CA233708 URN Allocation Alert', 'URN Allocation Alert', 'mamta@sa.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1726121534),
(199, 'Status Updated Alert', 'CA233708 Status Updated Alert', 'Status Updated Alert', 'raj@st.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1726121727),
(200, 'Status Updated Alert', 'CA233708 Status Updated Alert', 'Status Updated Alert', 'raj@st.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1726121760),
(201, 'URN Applied Alert', 'CA233708 Applied Alert', 'CA233708 Applied Alert', 'raj@st.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1726121910),
(202, 'URN URN Approved Alert', 'CA233708 URN Approved Alert', 'CA233708 URN Approved Alert', 'raj@st.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1726122002),
(203, 'URN Visa Applied Alert', 'CA233708 Visa Applied Alert', 'CA233708 Visa Applied Alert', 'raj@st.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1726122187),
(204, 'URN Visa Approved Alert', 'CA233708 Visa Approved Alert', 'CA233708 Visa Approved Alert', 'raj@st.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1726122210),
(205, 'URN Fee Paid Alert', 'CA233708 Fee Paid Alert', 'CA233708 Fee Paid Alert', 'raj@st.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1726122232),
(206, 'Status Updated Alert', 'CA233708 Status Updated Alert', 'Status Updated Alert', 'raj@st.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1726122257),
(207, 'Document Upload Alert', 'CA583323 Document Upload Alert', 'Document Upload Alert', 'rajiv1@st.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1726123218),
(208, 'Status Updated Alert', 'CA583323 Status Updated Alert', 'Status Updated Alert', 'rajiv1@st.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1726123435),
(209, 'Status Updated Alert', 'CA583323 Status Updated Alert', 'Status Updated Alert', 'rajiv1@st.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1726123472),
(210, 'Document Upload Alert', 'CA583323 Document Upload Alert', 'Document Upload Alert', 'rajiv1@st.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1726123512),
(211, 'Document Upload Alert', 'CA583323 Document Upload Alert', 'Document Upload Alert', 'rajiv1@st.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1726123540),
(212, 'New Agent Signup Alert', 'Welcome Tanvi Bafna to Campus-Abroad', 'New Agent Signup Alert', 'tanvi@sa.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1728013745),
(213, 'New Agent Signup Alert', 'Welcome Moti Builders to Campus-Abroad', 'New Agent Signup Alert', 'manish@sa.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1728013820),
(214, 'New Sales Person Signup Alert', 'Welcome Manish Paul to Campus-Abroad', 'New Sales Person Signup Alert', 'manish@sp.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1728013942),
(215, 'New Sales Person Signup Alert', 'Welcome Ranjita Gupta to Campus-Abroad', 'New Sales Person Signup Alert', 'ranjita@sp.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1728014022),
(216, 'Document Upload Alert', 'CA583323 Document Upload Alert', 'Document Upload Alert', 'rajiv1@st.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1728015187),
(217, 'URN Profile Update Alert', 'CA583323 URN Profile Update Alert', 'URN Profile Update Alert', 'rajiv1@st.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1728015297),
(218, 'Academic Details Update Alert', 'CA583323 Academic Details Update Alert', 'Academic Details Update Alert', 'rajiv1@st.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1728015420),
(219, 'Additional Details Update Alert', 'CA583323 Additional Details Update Alert', 'Additional Details Update Alert', 'rajiv1@st.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1728015516),
(220, 'URN Allocation Alert', 'CA583323 URN Allocation Alert', 'URN Allocation Alert', 'manish@sp.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1728015650),
(221, 'URN Applied Alert', 'CA583323 Applied Alert', 'CA583323 Applied Alert', 'rajiv1@st.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1728015727),
(222, 'URN URN Approved Alert', 'CA583323 URN Approved Alert', 'CA583323 URN Approved Alert', 'rajiv1@st.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1728015793),
(223, 'URN Visa Applied Alert', 'CA583323 Visa Applied Alert', 'CA583323 Visa Applied Alert', 'rajiv1@st.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1728015822),
(224, 'URN Visa Approved Alert', 'CA583323 Visa Approved Alert', 'CA583323 Visa Approved Alert', 'rajiv1@st.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1728015858),
(225, 'URN Fee Paid Alert', 'CA583323 Fee Paid Alert', 'CA583323 Fee Paid Alert', 'rajiv1@st.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1728015920),
(226, 'Status Updated Alert', 'CA583323 Status Updated Alert', 'Status Updated Alert', 'rajiv1@st.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1728015991),
(227, 'Status Updated Alert', 'CA714621 Status Updated Alert', 'Status Updated Alert', 'naveen@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1728017520),
(228, 'URN Fee Paid Alert', 'CA390400 Fee Paid Alert', 'CA390400 Fee Paid Alert', 'malathi@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1728017576),
(229, 'Status Updated Alert', 'CA390400 Status Updated Alert', 'Status Updated Alert', 'malathi@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1728017605),
(230, 'URN Allocation Alert', 'CA184732 URN Allocation Alert', 'URN Allocation Alert', 'tanvi@sa.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1728017663),
(231, 'URN Visa Approved Alert', 'CA184732 Visa Approved Alert', 'CA184732 Visa Approved Alert', 'nishanth@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1728017695),
(232, 'URN Fee Paid Alert', 'CA184732 Fee Paid Alert', 'CA184732 Fee Paid Alert', 'nishanth@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1728017723),
(233, 'Status Updated Alert', 'CA184732 Status Updated Alert', 'Status Updated Alert', 'nishanth@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1728017754),
(234, 'Withdrawal Request Alert', 'Withdrawal Request Alert', 'Withdrawal Request Alert', 'Hema@gmail.com,amit@moticorporation.com,accounts@bafna.net,yogesh@bafna.net', 'support@campus-abroad.co.in', 1728018447),
(235, 'Withdrawal Request Alert', 'Withdrawal Request Alert', 'Withdrawal Request Alert', 'Hema@gmail.com,amit@moticorporation.com,accounts@bafna.net,yogesh@bafna.net', 'support@campus-abroad.co.in', 1728018523),
(236, 'Withdrawal Approval Alert', 'Withdrawal Approval Alert', 'Withdrawal Approval Alert', 'Hema@gmail.com,amit@moticorporation.com,accounts@bafna.net,yogesh@bafna.net', 'support@campus-abroad.co.in', 1728018608),
(237, 'URN Visa Applied Alert', 'CA463188 Visa Applied Alert', 'CA463188 Visa Applied Alert', 'praveen@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1728018774),
(238, 'URN Visa Approved Alert', 'CA463188 Visa Approved Alert', 'CA463188 Visa Approved Alert', 'praveen@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1728018852),
(239, 'URN Fee Paid Alert', 'CA463188 Fee Paid Alert', 'CA463188 Fee Paid Alert', 'praveen@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1728018899),
(240, 'Status Updated Alert', 'CA463188 Status Updated Alert', 'Status Updated Alert', 'praveen@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1728018935),
(241, 'URN Allocation Alert', 'CA389944 URN Allocation Alert', 'URN Allocation Alert', 'manish@sp.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1728018996),
(242, 'URN URN Approved Alert', 'CA389944 URN Approved Alert', 'CA389944 URN Approved Alert', 'kavana@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1728019020),
(243, 'URN Visa Applied Alert', 'CA389944 Visa Applied Alert', 'CA389944 Visa Applied Alert', 'kavana@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1728019046),
(244, 'URN Visa Approved Alert', 'CA389944 Visa Approved Alert', 'CA389944 Visa Approved Alert', 'kavana@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1728019078),
(245, 'URN Fee Paid Alert', 'CA389944 Fee Paid Alert', 'CA389944 Fee Paid Alert', 'kavana@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1728019100),
(246, 'Status Updated Alert', 'CA389944 Status Updated Alert', 'Status Updated Alert', 'kavana@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1728019121),
(247, 'URN Allocation Alert', 'CA480905 URN Allocation Alert', 'URN Allocation Alert', 'manish@sp.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1728019204),
(248, 'URN URN Approved Alert', 'CA480905 URN Approved Alert', 'CA480905 URN Approved Alert', 'ranjitha@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1728019235),
(249, 'URN Visa Applied Alert', 'CA480905 Visa Applied Alert', 'CA480905 Visa Applied Alert', 'ranjitha@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1728019256),
(250, 'URN Visa Approved Alert', 'CA480905 Visa Approved Alert', 'CA480905 Visa Approved Alert', 'ranjitha@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1728019276),
(251, 'URN Fee Paid Alert', 'CA480905 Fee Paid Alert', 'CA480905 Fee Paid Alert', 'ranjitha@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1728019304),
(252, 'Status Updated Alert', 'CA480905 Status Updated Alert', 'Status Updated Alert', 'ranjitha@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1728019329),
(253, 'Course Selection Update Alert', 'CA742352 Course Selection Update Alert', 'Course Selection Update Alert', 'darshan@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1728019531);
INSERT INTO `email_history` (`id`, `type`, `subject`, `content`, `recipients`, `sender`, `datentime`) VALUES
(254, 'URN Allocation Alert', 'CA742352 URN Allocation Alert', 'URN Allocation Alert', 'manish@sp.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1728019561),
(255, 'URN Applied Alert', 'CA742352 Applied Alert', 'CA742352 Applied Alert', 'darshan@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1728019599),
(256, 'URN URN Approved Alert', 'CA742352 URN Approved Alert', 'CA742352 URN Approved Alert', 'darshan@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1728019625),
(257, 'URN Visa Applied Alert', 'CA742352 Visa Applied Alert', 'CA742352 Visa Applied Alert', 'darshan@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1728019668),
(258, 'URN Visa Approved Alert', 'CA742352 Visa Approved Alert', 'CA742352 Visa Approved Alert', 'darshan@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1728019709),
(259, 'URN Fee Paid Alert', 'CA742352 Fee Paid Alert', 'CA742352 Fee Paid Alert', 'darshan@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1728019743),
(260, 'Status Updated Alert', 'CA742352 Status Updated Alert', 'Status Updated Alert', 'darshan@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1728019772),
(261, 'Withdrawal Request Alert', 'Withdrawal Request Alert', 'Withdrawal Request Alert', 'manish@sp.com,amit@moticorporation.com,accounts@bafna.net,yogesh@bafna.net', 'support@campus-abroad.co.in', 1728022586),
(262, 'Withdrawal Approval Alert', 'Withdrawal Approval Alert', 'Withdrawal Approval Alert', 'manish@sp.com,amit@moticorporation.com,accounts@bafna.net,yogesh@bafna.net', 'support@campus-abroad.co.in', 1728022620),
(263, 'Withdrawal Request Alert', 'Withdrawal Request Alert', 'Withdrawal Request Alert', 'manish@sp.com,amit@moticorporation.com,accounts@bafna.net,yogesh@bafna.net', 'support@campus-abroad.co.in', 1728022992),
(264, 'URN Profile Update Alert', 'CA178908 URN Profile Update Alert', 'URN Profile Update Alert', 'mugilraj@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1728023065),
(265, 'URN Allocation Alert', 'CA178908 URN Allocation Alert', 'URN Allocation Alert', 'manish@sp.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1728023140),
(266, 'URN Applied Alert', 'CA178908 Applied Alert', 'CA178908 Applied Alert', 'mugilraj@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1728023264),
(267, 'URN URN Approved Alert', 'CA178908 URN Approved Alert', 'CA178908 URN Approved Alert', 'mugilraj@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1728023288),
(268, 'URN Visa Applied Alert', 'CA178908 Visa Applied Alert', 'CA178908 Visa Applied Alert', 'mugilraj@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1728023339),
(269, 'URN Visa Approved Alert', 'CA178908 Visa Approved Alert', 'CA178908 Visa Approved Alert', 'mugilraj@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1728023361),
(270, 'URN Fee Paid Alert', 'CA178908 Fee Paid Alert', 'CA178908 Fee Paid Alert', 'mugilraj@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1728023387),
(271, 'Status Updated Alert', 'CA178908 Status Updated Alert', 'Status Updated Alert', 'mugilraj@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1728023554),
(272, 'Withdrawal Approval Alert', 'Withdrawal Approval Alert', 'Withdrawal Approval Alert', 'manish@sp.com,amit@moticorporation.com,accounts@bafna.net,yogesh@bafna.net', 'support@campus-abroad.co.in', 1728023672),
(273, 'Withdrawal Request Alert', 'Withdrawal Request Alert', 'Withdrawal Request Alert', 'manish@sp.com,amit@moticorporation.com,accounts@bafna.net,yogesh@bafna.net', 'support@campus-abroad.co.in', 1728024391),
(274, 'Withdrawal Approval Alert', 'Withdrawal Approval Alert', 'Withdrawal Approval Alert', 'manish@sp.com,amit@moticorporation.com,accounts@bafna.net,yogesh@bafna.net', 'support@campus-abroad.co.in', 1728024509),
(275, 'URN Profile Update Alert', 'CA507414 URN Profile Update Alert', 'URN Profile Update Alert', 'parthiban@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1728024626),
(276, 'URN Allocation Alert', 'CA507414 URN Allocation Alert', 'URN Allocation Alert', 'Hema@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1728024748),
(277, 'Document Upload Alert', 'CA507414 Document Upload Alert', 'Document Upload Alert', 'parthiban@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1728024778),
(278, 'URN Applied Alert', 'CA507414 Applied Alert', 'CA507414 Applied Alert', 'parthiban@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1728024807),
(279, 'URN URN Approved Alert', 'CA507414 URN Approved Alert', 'CA507414 URN Approved Alert', 'parthiban@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1728024833),
(280, 'URN Visa Applied Alert', 'CA507414 Visa Applied Alert', 'CA507414 Visa Applied Alert', 'parthiban@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1728024921),
(281, 'URN Visa Approved Alert', 'CA507414 Visa Approved Alert', 'CA507414 Visa Approved Alert', 'parthiban@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1728024950),
(282, 'URN Fee Paid Alert', 'CA507414 Fee Paid Alert', 'CA507414 Fee Paid Alert', 'parthiban@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1728025019),
(283, 'Status Updated Alert', 'CA507414 Status Updated Alert', 'Status Updated Alert', 'parthiban@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1728025041),
(284, 'Withdrawal Request Alert', 'Withdrawal Request Alert', 'Withdrawal Request Alert', 'manish@sp.com,amit@moticorporation.com,accounts@bafna.net,yogesh@bafna.net', 'support@campus-abroad.co.in', 1728025170),
(285, 'Withdrawal Approval Alert', 'Withdrawal Approval Alert', 'Withdrawal Approval Alert', 'manish@sp.com,amit@moticorporation.com,accounts@bafna.net,yogesh@bafna.net', 'support@campus-abroad.co.in', 1728025219),
(286, 'Withdrawal Request Alert', 'Withdrawal Request Alert', 'Withdrawal Request Alert', 'Hema@gmail.com,amit@moticorporation.com,accounts@bafna.net,yogesh@bafna.net', 'support@campus-abroad.co.in', 1728025436),
(287, 'Withdrawal Approval Alert', 'Withdrawal Approval Alert', 'Withdrawal Approval Alert', 'Hema@gmail.com,amit@moticorporation.com,accounts@bafna.net,yogesh@bafna.net', 'support@campus-abroad.co.in', 1728025465),
(288, 'Withdrawal Request Alert', 'Withdrawal Request Alert', 'Withdrawal Request Alert', 'Hema@gmail.com,amit@moticorporation.com,accounts@bafna.net,yogesh@bafna.net', 'support@campus-abroad.co.in', 1728025522),
(289, 'Withdrawal Approval Alert', 'Withdrawal Approval Alert', 'Withdrawal Approval Alert', 'Hema@gmail.com,amit@moticorporation.com,accounts@bafna.net,yogesh@bafna.net', 'support@campus-abroad.co.in', 1728025573),
(290, 'New Agent Signup Alert', 'Welcome Reet Bafna to Campus-Abroad', 'New Agent Signup Alert', 'reet@sa.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1728037195),
(291, 'URN Allocation Alert', 'CA466509 URN Allocation Alert', 'URN Allocation Alert', 'manish@sp.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1728045136),
(292, 'URN Profile Update Alert', 'CA466509 URN Profile Update Alert', 'URN Profile Update Alert', 'kiran@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1728045251),
(293, 'Status Updated Alert', 'CA466509 Status Updated Alert', 'Status Updated Alert', 'kiran@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1728045282),
(294, 'URN Allocation Alert', 'CA491455 URN Allocation Alert', 'URN Allocation Alert', 'manish@sp.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1728104008),
(295, 'New Callback Set Alert', 'CA491455 New Callback Set Alert', 'New Callback Set Alert', 'Richard@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1728104094),
(296, 'New Callback Set Alert', 'CA236982 New Callback Set Alert', 'New Callback Set Alert', 'sathvik@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1728104166),
(297, 'New Callback Set Alert', 'CA248663 New Callback Set Alert', 'New Callback Set Alert', 'sharath@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1728105355),
(298, 'Callback Update Alert', 'CA491455 Callback Update Alert', 'Callback Update Alert', 'Richard@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1728105454),
(299, 'New Callback Set Alert', 'CA491455 New Callback Set Alert', 'New Callback Set Alert', 'Richard@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1728105538),
(300, 'URN Profile Update Alert', 'CA265137 URN Profile Update Alert', 'URN Profile Update Alert', 'shijuGBP@GBP.Com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1728106705),
(301, 'URN Profile Update Alert', 'CA265137 URN Profile Update Alert', 'URN Profile Update Alert', 'shijuGBP@GBP.Com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1728106826),
(302, 'New Callback Set Alert', 'CA265137 New Callback Set Alert', 'New Callback Set Alert', 'shijuGBP@GBP.Com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1728107118),
(303, 'URN Allocation Alert', 'CA265137 URN Allocation Alert', 'URN Allocation Alert', 'Hema@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1728107200),
(304, 'URN Allocation Alert', 'CA265137 URN Allocation Alert', 'URN Allocation Alert', 'manish@sp.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1728107355),
(305, 'Document Upload Alert', 'CA265137 Document Upload Alert', 'Document Upload Alert', 'shijuGBP@GBP.Com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1728107443),
(306, 'Academic Details Update Alert', 'CA265137 Academic Details Update Alert', 'Academic Details Update Alert', 'shijuGBP@GBP.Com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1728107611),
(307, 'Status Updated Alert', 'CA265137 Status Updated Alert', 'Status Updated Alert', 'shijuGBP@GBP.Com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1728107788),
(308, 'Document Upload Alert', 'CA265137 Document Upload Alert', 'Document Upload Alert', 'shijuGBP@GBP.Com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1728107890),
(309, 'Status Updated Alert', 'CA265137 Status Updated Alert', 'Status Updated Alert', 'shijuGBP@GBP.Com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1728107934),
(310, 'URN Applied Alert', 'CA265137 Applied Alert', 'CA265137 Applied Alert', 'shijuGBP@GBP.Com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1728108100),
(311, 'URN URN Approved Alert', 'CA265137 URN Approved Alert', 'CA265137 URN Approved Alert', 'shijuGBP@GBP.Com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1728108194),
(312, 'Withdrawal Request Alert', 'Withdrawal Request Alert', 'Withdrawal Request Alert', 'Hema@gmail.com,amit@moticorporation.com,accounts@bafna.net,yogesh@bafna.net', 'support@campus-abroad.co.in', 1728109539),
(313, 'Status Updated Alert', 'CA292452 Status Updated Alert', 'Status Updated Alert', 'nimilphilipzoo@gmail.com,amit@moticorporation.com,yogesh@bafna.net,gyb@gyb.com', 'support@campus-abroad.co.in', 1729599169),
(314, 'Status Updated Alert', 'CA292452 Status Updated Alert', 'Status Updated Alert', 'nimilphilipzoo@gmail.com,amit@moticorporation.com,yogesh@bafna.net,gyb@gyb.com', 'support@campus-abroad.co.in', 1729599188),
(315, 'New Management Staff Signup Alert', 'Welcome Nimil to Campus-Abroad', 'New Management Staff Signup Alert', 'nimilphilipzoo@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1729705501),
(316, 'Status Updated Alert', 'CA822720 Status Updated Alert', 'Status Updated Alert', 'nimilphilip@gmail.com,amit@moticorporation.com,yogesh@bafna.net,gyb@gyb.com', 'support@campus-abroad.co.in', 1729708711),
(317, 'Status Updated Alert', 'CA822720 Status Updated Alert', 'Status Updated Alert', 'nimilphilip@gmail.com,amit@moticorporation.com,yogesh@bafna.net,gyb@gyb.com', 'support@campus-abroad.co.in', 1729708728),
(318, 'Status Updated Alert', 'CA822720 Status Updated Alert', 'Status Updated Alert', 'nimilphilip@gmail.com,amit@moticorporation.com,yogesh@bafna.net,gyb@gyb.com', 'support@campus-abroad.co.in', 1731566625),
(319, 'Withdrawal Request Alert', 'Withdrawal Request Alert', 'Withdrawal Request Alert', 'mamta@sa.com,amit@moticorporation.com,accounts@bafna.net,yogesh@bafna.net,gyb@gyb.com', 'support@campus-abroad.co.in', 1731730993),
(320, 'Withdrawal Approval Alert', 'Withdrawal Approval Alert', 'Withdrawal Approval Alert', 'mamta@sa.com,amit@moticorporation.com,accounts@bafna.net,yogesh@bafna.net,gyb@gyb.com', 'support@campus-abroad.co.in', 1731731111),
(321, 'Withdrawal Request Alert', 'Withdrawal Request Alert', 'Withdrawal Request Alert', 'manish@sp.com,amit@moticorporation.com,accounts@bafna.net,yogesh@bafna.net,gyb@gyb.com', 'support@campus-abroad.co.in', 1731732659),
(322, 'Withdrawal Approval Alert', 'Withdrawal Approval Alert', 'Withdrawal Approval Alert', 'manish@sp.com,amit@moticorporation.com,accounts@bafna.net,yogesh@bafna.net,gyb@gyb.com', 'support@campus-abroad.co.in', 1731732773),
(323, 'Status Updated Alert', 'CA811731 Status Updated Alert', 'Status Updated Alert', 'sddsfsd@f.c,amit@moticorporation.com,yogesh@bafna.net,gyb@gyb.com', 'support@campus-abroad.co.in', 1731733939),
(324, 'Status Updated Alert', 'CA516253 Status Updated Alert', 'Status Updated Alert', 'nimilphilip@gmail.com,amit@moticorporation.com,yogesh@bafna.net,gyb@gyb.com', 'support@campus-abroad.co.in', 1731734345),
(325, 'URN Deleted Alert', 'CA516253 Deleted Alert', 'CA516253 Deleted Alert', 'nimilphilip@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1731734415),
(326, 'New Callback Set Alert', 'CA491455 New Callback Set Alert', 'New Callback Set Alert', 'Richard@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1731735499),
(327, 'Callback Update Alert', 'CA491455 Callback Update Alert', 'Callback Update Alert', 'Richard@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1731735793),
(328, 'Callback Update Alert', 'CA491455 Callback Update Alert', 'Callback Update Alert', 'Richard@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1731735834),
(329, 'Callback Update Alert', 'CA491455 Callback Update Alert', 'Callback Update Alert', 'Richard@gmail.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1731735862);

-- --------------------------------------------------------

--
-- Table structure for table `guarantor_list`
--

DROP TABLE IF EXISTS `guarantor_list`;
CREATE TABLE IF NOT EXISTS `guarantor_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `crn` int NOT NULL,
  `name` varchar(2048) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(2048) COLLATE utf8mb4_general_ci NOT NULL,
  `mobile` bigint NOT NULL,
  `current_address` varchar(5120) COLLATE utf8mb4_general_ci NOT NULL,
  `permanent_address` varchar(5120) COLLATE utf8mb4_general_ci NOT NULL,
  `company` varchar(1024) COLLATE utf8mb4_general_ci NOT NULL,
  `document_upload` int NOT NULL,
  `document_count` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `income_history`
--

DROP TABLE IF EXISTS `income_history`;
CREATE TABLE IF NOT EXISTS `income_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `lead_id` int NOT NULL,
  `lead_amount` decimal(10,2) NOT NULL,
  `comission_amount` decimal(10,2) NOT NULL,
  `comission_rcvd` int NOT NULL,
  `application_point_id` int NOT NULL,
  `datentime` int NOT NULL,
  `transaction_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `transaction_proof_file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `entry_done_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `entry_datentime` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `income_history`
--

INSERT INTO `income_history` (`id`, `lead_id`, `lead_amount`, `comission_amount`, `comission_rcvd`, `application_point_id`, `datentime`, `transaction_id`, `transaction_proof_file_name`, `entry_done_by`, `entry_datentime`) VALUES
(1, 35, 27500.00, 8250.00, 1, 1, 1728016200, 'OCT1245', 'OCT1245.pdf', 'BS2', 1728017204),
(2, 45, 16700.00, 5010.00, 1, 1, 1725256380, 'sfwrtrt', 'sfwrtrt.pdf', 'BS2', 1725697308),
(3, 46, 24500.00, 7350.00, 1, 1, 1726121400, '123456', '123456.jpg', 'BS2', 1726122343),
(4, 47, 33450.00, 11707.50, 1, 3, 1728015300, 'OCT12345', 'OCT12345.pdf', 'BS2', 1728016273),
(5, 34, 57630.00, 17289.00, 1, 1, 1728016800, 'OCT121', 'OCT121.pdf', 'BS2', 1728017788),
(6, 29, 35000.00, 10500.00, 1, 1, 1728016800, 'OCT121', 'OCT121.pdf', 'BS2', 1728017788),
(7, 40, 30500.00, 9150.00, 1, 1, 1728016800, 'OCT121', 'OCT121.pdf', 'BS2', 1728017788),
(8, 39, 56550.00, 16965.00, 1, 1, 1728019080, 'OCT122', 'OCT122.pdf', 'BS2', 1728020074),
(9, 25, 0.00, 0.00, 1, 1, 1728019080, 'OCT122', 'OCT122.pdf', 'BS2', 1728020074),
(10, 37, 15576.00, 4672.80, 1, 1, 1728019080, 'OCT122', 'OCT122.pdf', 'BS2', 1728020074),
(11, 14, 15576.00, 5451.60, 1, 3, 1728019200, 'OCT123', 'OCT123.pdf', 'BS2', 1728020183),
(12, 33, 40000.00, 14000.00, 1, 3, 1728022620, 'OCT126', 'OCT126.pdf', 'BS2', 1728023597),
(13, 36, 29800.00, 10430.00, 1, 3, 1728024120, 'OCT128', 'OCT128.pdf', 'BS2', 1728025083);

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
) ENGINE=MyISAM AUTO_INCREMENT=391 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `leads_activity_history`
--

INSERT INTO `leads_activity_history` (`id`, `lead_id`, `status_id`, `comment`, `activity_by`, `datentime`) VALUES
(1, 1, 1, 'Created', 'Portal Visitor', 1724411378),
(2, 2, 1, 'Created', 'Portal Visitor', 1724411685),
(3, 2, 1, 'assigned to SA2', 'BS2', 1724413318),
(4, 2, 1, 'assigned to SA1', 'BS2', 1724413362),
(5, 3, 1, 'URN Created', 'BS2', 1724820642),
(6, 3, 1, 'Documents Uploaded', 'BS2', 1724820661),
(7, 3, 1, 'Alt Mobile, DOB & Address Added', 'BS2', 1724820766),
(8, 3, 1, 'Academic Details & Test Added', 'BS2', 1724822014),
(9, 4, 1, 'URN Created', 'BS2', 1724822125),
(10, 4, 1, 'Documents Uploaded', 'BS2', 1724822352),
(11, 4, 1, 'Documents Uploaded', 'BS2', 1724822366),
(12, 3, 1, 'Academic Updated', 'BS2', 1724822413),
(13, 3, 1, 'Passport Details Added', 'BS2', 1724822514),
(14, 4, 1, 'I dind not take any test', 'BS2', 1724822575),
(15, 3, 1, 'Passport Updated', 'BS2', 1724822650),
(16, 4, 1, 'Passport detail added', 'BS2', 1724822840),
(17, 4, 1, 'assigned to SP1', 'BS2', 1724822896),
(18, 3, 1, 'course selection updated', 'BS2', 1724822918),
(19, 3, 1, 'course selection updated', 'BS2', 1724823173),
(20, 3, 1, 'assigned to SA2', 'BS2', 1724823207),
(21, 3, 1, 'assigned to SP1', 'BS2', 1724823272),
(22, 5, 1, 'URN Created', 'BS8', 1724823324),
(23, 3, 1, 'Wants Callback', 'BS2', 1724823347),
(24, 5, 1, 'Documents Uploaded', 'BS8', 1724823349),
(25, 6, 1, 'URN Created', 'BS8', 1724823431),
(26, 6, 1, 'Documents Uploaded', 'BS8', 1724823459),
(27, 6, 1, 'assigned to SA1', 'BS8', 1724823482),
(28, 3, 1, 'assigned to SA2', 'BS2', 1724823512),
(29, 7, 1, 'URN Created', 'BS8', 1724823533),
(30, 7, 1, 'Documents Uploaded', 'BS8', 1724823563),
(31, 8, 1, 'URN Created', 'BS8', 1724823780),
(32, 8, 1, 'Documents Uploaded', 'BS8', 1724823810),
(33, 9, 1, 'URN Created', 'BS8', 1724823867),
(34, 9, 1, 'Documents Uploaded', 'BS8', 1724823886),
(35, 3, 1, 'Passport Number Rectified', 'SA2', 1724823895),
(36, 10, 1, 'URN Created', 'BS8', 1724823925),
(37, 10, 1, 'Documents Uploaded', 'BS8', 1724823944),
(38, 3, 1, 'Academic Detail Updated', 'SA2', 1724823947),
(39, 11, 1, 'URN Created', 'BS8', 1724823980),
(40, 11, 1, 'assigned to SP1', 'BS8', 1724823993),
(41, 3, 1, 'Documents Uploaded', 'SA2', 1724824051),
(42, 12, 1, 'URN Created', 'BS8', 1724824068),
(43, 3, 1, 'course selection updated', 'SA2', 1724824073),
(44, 12, 1, 'Documents Uploaded', 'BS8', 1724824094),
(45, 3, 1, 'Wants Callback', 'SA2', 1724824142),
(46, 13, 1, 'URN Created', 'BS8', 1724824144),
(47, 13, 1, 'Documents Uploaded', 'BS8', 1724824169),
(48, 13, 1, 'assigned to SP1', 'BS8', 1724824191),
(49, 14, 1, 'URN Created', 'BS8', 1724824241),
(50, 14, 1, 'Documents Uploaded', 'BS8', 1724824262),
(51, 14, 1, 'assigned to SP1', 'BS8', 1724824274),
(52, 15, 1, 'URN Created', 'BS8', 1724824326),
(53, 15, 1, 'Documents Uploaded', 'BS8', 1724824353),
(54, 15, 1, 'assigned to SP1', 'BS8', 1724824364),
(55, 16, 1, 'URN Created', 'BS8', 1724824422),
(56, 16, 1, 'assigned to SP1', 'BS8', 1724824432),
(57, 17, 1, 'URN Created', 'BS8', 1724824481),
(58, 17, 1, 'assigned to SP1', 'BS8', 1724824491),
(59, 18, 1, 'URN Created', 'BS8', 1724824776),
(60, 18, 1, 'Documents Uploaded', 'BS8', 1724824800),
(61, 18, 1, 'assigned to SP1', 'BS8', 1724824825),
(62, 19, 1, 'URN Created', 'BS8', 1724824867),
(63, 19, 1, 'assigned to SA2', 'BS8', 1724824880),
(64, 20, 1, 'URN Created', 'BS8', 1724824950),
(65, 3, 1, 'Alt Mobile Updated', 'SA2', 1724824960),
(66, 20, 1, 'assigned to SP1', 'BS8', 1724824973),
(67, 3, 1, 'course selection updated', 'SA2', 1724825032),
(68, 3, 1, 'Academic Details Updated', 'SA2', 1724825092),
(69, 21, 1, 'URN Created', 'BS8', 1724825178),
(70, 21, 1, 'assigned to SP1', 'BS8', 1724825193),
(71, 22, 1, 'URN Created', 'BS8', 1724825415),
(72, 22, 1, 'assigned to SP2', 'BS8', 1724825427),
(73, 23, 1, 'URN Created', 'BS8', 1724825469),
(74, 23, 1, 'Documents Uploaded', 'BS8', 1724825492),
(75, 24, 1, 'URN Created', 'BS8', 1724825632),
(76, 24, 1, 'assigned to SA1', 'BS8', 1724825644),
(77, 25, 1, 'URN Created', 'BS8', 1724825689),
(78, 25, 1, 'assigned to SP2', 'BS8', 1724825699),
(79, 26, 1, 'URN Created', 'BS8', 1724825766),
(80, 27, 1, 'URN Created', 'BS8', 1724825865),
(81, 27, 1, 'Documents Uploaded', 'BS8', 1724825894),
(82, 28, 1, 'URN Created', 'BS8', 1724825953),
(83, 28, 1, 'assigned to SP2', 'BS8', 1724825969),
(84, 0, 0, '', 'SA2', 1724826289),
(85, 3, 1, 'Wants Callback', 'SA2', 1724826350),
(86, 29, 1, 'URN Created', 'BS8', 1724826462),
(87, 29, 1, 'Documents Uploaded', 'BS8', 1724826482),
(88, 6, 15, 'Not Interested', 'BS3', 1724826597),
(89, 29, 1, 'assigned to SP1', 'BS8', 1724826675),
(90, 6, 12, 'URN Deleted', 'BS2', 1724826808),
(91, 30, 1, 'URN Created', 'BS8', 1724827148),
(92, 30, 1, 'Documents Uploaded', 'BS8', 1724827165),
(93, 30, 1, 'assigned to SP2', 'BS8', 1724827177),
(94, 31, 1, 'URN Created', 'BS8', 1724827234),
(95, 31, 1, 'assigned to SP2', 'BS8', 1724827243),
(96, 32, 1, 'URN Created', 'BS8', 1724827276),
(97, 23, 2, 'Status Updated', 'BS2', 1724827286),
(98, 32, 1, 'Documents Uploaded', 'BS8', 1724827287),
(99, 33, 1, 'URN Created', 'BS8', 1724827319),
(100, 33, 1, 'assigned to SP1', 'BS8', 1724827330),
(101, 34, 1, 'URN Created', 'BS8', 1724827361),
(102, 34, 1, 'Documents Uploaded', 'BS8', 1724827379),
(103, 35, 1, 'URN Created', 'BS8', 1724827415),
(104, 35, 1, 'Documents Uploaded', 'BS8', 1724827436),
(105, 36, 1, 'URN Created', 'BS8', 1724827496),
(106, 36, 1, 'Documents Uploaded', 'BS8', 1724827513),
(107, 36, 1, 'assigned to SP1', 'BS8', 1724827524),
(108, 37, 1, 'URN Created', 'BS8', 1724827557),
(109, 37, 1, 'assigned to SP2', 'BS8', 1724827573),
(110, 37, 1, 'Documents Uploaded', 'BS8', 1724827628),
(111, 38, 1, 'URN Created', 'BS8', 1724827652),
(112, 38, 1, 'assigned to SP2', 'BS8', 1724827661),
(113, 39, 1, 'URN Created', 'BS8', 1724827693),
(114, 39, 1, 'assigned to SA2', 'BS8', 1724827707),
(115, 23, 3, 'Status Updated', 'BS2', 1724827743),
(116, 40, 1, 'URN Created', 'BS8', 1724827756),
(117, 40, 1, 'assigned to SP1', 'BS8', 1724827767),
(118, 41, 1, 'URN Created', 'BS8', 1724827797),
(119, 41, 1, 'assigned to SP1', 'BS8', 1724827808),
(120, 32, 15, 'Not Interested', 'BS3', 1724827848),
(121, 32, 12, 'URN Deleted', 'BS2', 1724828103),
(122, 38, 1, 'Basic details entered', 'SP2', 1724828294),
(123, 38, 1, 'Documents Uploaded', 'SP2', 1724828330),
(124, 38, 1, 'Update Academic Details', 'SP2', 1724828425),
(125, 38, 1, 'Updated Passport details', 'SP2', 1724828624),
(126, 38, 1, 'Requested other documents', 'SP2', 1724828689),
(127, 37, 1, 'Interested', 'SP2', 1724828875),
(128, 37, 1, 'Requested for passport', 'SP2', 1724828936),
(129, 37, 1, 'Documents Uploaded', 'SP2', 1724828959),
(130, 38, 15, 'Not Interested', 'BS3', 1724828969),
(131, 37, 1, 'No', 'SP2', 1724829032),
(132, 38, 12, 'URN Deleted', 'BS2', 1724829100),
(133, 31, 1, 'Interested', 'SP2', 1724830310),
(134, 31, 1, 'Documents Uploaded', 'SP2', 1724830343),
(135, 31, 1, 'Updated', 'SP2', 1724830396),
(136, 31, 1, 'Updated', 'SP2', 1724830471),
(137, 1, 12, 'Status Updated', 'BS2', 1724830532),
(138, 30, 1, 'Requested documents to upload', 'SP2', 1724830589),
(139, 2, 15, 'Deletion Email Testing', 'BS3', 1724830593),
(140, 2, 12, 'URN Deleted', 'BS2', 1724830632),
(141, 28, 1, 'Call not picked. so will call after sometime', 'SP2', 1724830642),
(142, 4, 12, 'Status Updated', 'BS2', 1724830753),
(143, 25, 1, 'Requested for documents', 'SP2', 1724830757),
(144, 22, 1, 'She has mailed the documents. icase of missing documents should call her tomorrow', 'SP2', 1724830844),
(145, 22, 1, 'Documents Uploaded', 'SP2', 1724830860),
(146, 22, 1, 'Documents Uploaded', 'SP2', 1724830867),
(147, 22, 1, 'Academic details updated', 'SP2', 1724830940),
(148, 5, 12, 'Status Updated', 'BS2', 1724830989),
(149, 22, 1, 'Passport details updated', 'SP2', 1724831027),
(150, 42, 1, 'URN Created', 'BS2', 1724831048),
(151, 42, 15, 'Request Deletion', 'BS3', 1724831077),
(152, 42, 12, 'URN Deleted', 'BS2', 1724831263),
(153, 35, 1, 'Academic details updated', 'BS8', 1724831270),
(154, 35, 1, 'Passport details updated', 'BS8', 1724831616),
(155, 43, 1, 'URN Created', 'BS3', 1724831683),
(156, 43, 15, 'Request Lead', 'BS3', 1724831702),
(157, 44, 1, 'URN Created', 'BS3', 1724832048),
(158, 44, 15, 'Student Not Interested', 'BS3', 1724832071),
(159, 43, 12, 'URN Deleted', 'BS2', 1724832140),
(160, 35, 2, 'Status Updated', 'BS8', 1724832181),
(161, 35, 3, 'Status Updated', 'BS8', 1724832314),
(162, 35, 4, 'Status Updated', 'BS8', 1724832384),
(163, 35, 4, 'should update the status of Application applied', 'BS8', 1724832483),
(164, 35, 5, 'Status Updated', 'BS8', 1724832537),
(165, 35, 5, 'assigned to SP2', 'BS8', 1724832603),
(166, 41, 2, 'Status Updated', 'BS8', 1724832927),
(167, 41, 2, 'Documents Uploaded', 'BS8', 1724833017),
(168, 41, 2, 'Alt Mobile & Address Updated', 'ST41', 1724833017),
(169, 35, 8, 'Status Updated', 'BS8', 1724833292),
(170, 35, 9, 'Status Updated', 'BS8', 1724833341),
(171, 35, 10, 'Status Updated', 'BS8', 1724833507),
(172, 35, 11, 'Status Updated', 'BS8', 1724833551),
(173, 34, 1, 'assigned to SP2', 'BS8', 1724833804),
(174, 34, 1, 'Calle for documents', 'BS8', 1724833869),
(175, 34, 1, 'Academic details updated', 'BS8', 1724833987),
(176, 34, 1, 'Passport details updated', 'BS8', 1724834105),
(177, 34, 2, 'Status Updated', 'BS8', 1724834143),
(178, 34, 3, 'Status Updated', 'BS8', 1724834186),
(179, 17, 1, 'call for documents', 'BS8', 1724834256),
(180, 41, 2, 'Alt Mob & Address Added', 'ST41', 1724834324),
(181, 34, 4, 'Status Updated', 'BS8', 1724834623),
(182, 14, 2, 'Status Updated', 'BS8', 1724834696),
(183, 14, 2, 'Academic update', 'BS8', 1724834843),
(184, 41, 2, 'Documents Uploaded', 'ST41', 1724835244),
(185, 14, 2, 'Passport details updated', 'BS8', 1724837179),
(186, 34, 5, 'Status Updated', 'BS8', 1724837297),
(187, 34, 8, 'Status Updated', 'BS8', 1724837331),
(188, 34, 9, 'Status Updated', 'BS8', 1724837822),
(189, 41, 3, 'Status Updated', 'BS8', 1724837907),
(190, 41, 4, 'Status Updated', 'BS8', 1724837978),
(191, 41, 13, 'Status Updated', 'BS8', 1724838135),
(192, 23, 12, 'Status Updated', 'BS8', 1724838264),
(193, 40, 1, 'He gave the details', 'BS8', 1724838394),
(194, 40, 1, 'He gave the details', 'BS8', 1724838411),
(195, 40, 1, 'He gave the details', 'BS8', 1724838423),
(196, 40, 1, 'Documents Uploaded', 'BS8', 1724838473),
(197, 40, 1, 'Academic details updated', 'BS8', 1724839485),
(198, 40, 1, 'Passport details updated', 'BS8', 1724839570),
(199, 40, 2, 'Status Updated', 'BS8', 1724839627),
(200, 40, 3, 'Status Updated', 'BS8', 1724839762),
(201, 40, 4, 'Status Updated', 'BS8', 1724840751),
(202, 27, 1, 'Updated', 'BS8', 1724840848),
(203, 27, 1, 'Updated', 'BS8', 1724840928),
(204, 27, 2, 'Status Updated', 'BS8', 1724840961),
(205, 27, 3, 'Status Updated', 'BS8', 1724840991),
(206, 27, 4, 'Status Updated', 'BS8', 1724841025),
(207, 27, 5, 'Status Updated', 'BS8', 1724841055),
(208, 30, 1, 'updated', 'BS8', 1724841125),
(209, 30, 1, 'Updated', 'BS8', 1724841200),
(210, 39, 1, 'updated', 'BS8', 1724841279),
(211, 39, 1, 'Updated', 'BS8', 1724841440),
(212, 39, 2, 'Status Updated', 'BS8', 1724841519),
(213, 39, 3, 'Status Updated', 'BS8', 1724841566),
(214, 29, 1, 'Updated', 'BS8', 1724841809),
(215, 29, 1, 'Updated', 'BS8', 1724841994),
(216, 29, 2, 'Status Updated', 'BS8', 1724842067),
(217, 29, 3, 'Status Updated', 'BS8', 1724842102),
(218, 29, 4, 'Status Updated', 'BS8', 1724842191),
(219, 25, 1, 'Documents Uploaded', 'BS8', 1724842252),
(220, 25, 1, 'Academic details updated', 'BS8', 1724842343),
(221, 25, 1, 'Information Updated', 'BS8', 1724842408),
(222, 25, 2, 'Status Updated', 'BS8', 1724842447),
(223, 40, 5, 'Status Updated', 'BS8', 1724842483),
(224, 27, 8, 'Status Updated', 'BS8', 1724842512),
(225, 45, 1, 'Created', 'Portal Visitor', 1724842536),
(226, 45, 1, 'Documents Uploaded', 'Portal Visitor', 1724842563),
(227, 27, 14, 'Status Updated', 'BS8', 1724842587),
(228, 40, 8, 'Status Updated', 'BS8', 1724843523),
(229, 29, 5, 'Status Updated', 'BS8', 1724843560),
(230, 39, 4, 'Status Updated', 'BS8', 1724843607),
(231, 39, 5, 'Status Updated', 'BS8', 1724843659),
(232, 25, 3, 'Status Updated', 'BS8', 1724843717),
(233, 25, 4, 'Status Updated', 'BS8', 1724843749),
(234, 14, 3, 'Status Updated', 'BS8', 1724843797),
(235, 26, 1, 'Documents Uploaded', 'BS8', 1724843873),
(236, 26, 1, 'Academic details updated', 'BS8', 1724844058),
(237, 26, 1, 'Other details updated', 'BS8', 1724844159),
(238, 26, 1, 'assigned to SP1', 'BS8', 1724844274),
(239, 26, 2, 'Status Updated', 'BS8', 1724844311),
(240, 29, 8, 'Status Updated', 'BS8', 1724844350),
(241, 29, 9, 'Status Updated', 'BS8', 1724844383),
(242, 34, 10, 'Status Updated', 'BS8', 1724844416),
(243, 33, 1, 'Documents Uploaded', 'BS8', 1724846513),
(244, 33, 1, 'Academic details ', 'BS8', 1724846616),
(245, 33, 1, 'Passport ', 'BS8', 1724846725),
(246, 33, 2, 'Status Updated', 'BS8', 1724846785),
(247, 33, 3, 'Status Updated', 'BS8', 1724846859),
(248, 0, 0, 'Documents Uploaded', 'Portal Visitor', 1724888055),
(249, 45, 1, 'Documents Uploaded', 'BS2', 1725695255),
(250, 45, 1, 'assigned to SP2', 'BS2', 1725695298),
(251, 45, 2, 'Status Updated', 'BS2', 1725695363),
(252, 45, 3, 'Status Updated', 'BS2', 1725695393),
(253, 45, 4, 'Status Updated', 'BS2', 1725695430),
(254, 45, 4, 'Status Updated', 'BS2', 1725695441),
(255, 45, 5, 'Status Updated', 'BS2', 1725697085),
(256, 45, 8, 'Status Updated', 'BS2', 1725697120),
(257, 45, 9, 'Status Updated', 'BS2', 1725697161),
(258, 45, 10, 'Status Updated', 'BS2', 1725697188),
(259, 45, 11, 'Status Updated', 'BS2', 1725697222),
(260, 37, 1, 'call back', 'BS2', 1725700350),
(261, 37, 1, 'course selection updated', 'BS2', 1726033892),
(262, 37, 1, 'Change of university', 'BS2', 1726033925),
(263, 37, 2, 'Status Updated', 'BS2', 1726034067),
(264, 37, 3, 'Status Updated', 'BS2', 1726034110),
(265, 37, 4, 'Status Updated', 'BS2', 1726034144),
(266, 36, 2, 'Status Updated', 'BS2', 1726115418),
(267, 36, 3, 'Status Updated', 'BS2', 1726115470),
(268, 36, 3, 'Documents Uploaded', 'BS2', 1726115554),
(269, 46, 1, 'URN Created', 'BS2', 1726120932),
(270, 46, 1, 'Documents Uploaded', 'BS2', 1726120981),
(271, 46, 1, 'Academic details Added', 'BS2', 1726121116),
(272, 46, 1, 'Passport Details added', 'BS2', 1726121221),
(273, 46, 1, 'Profile Detail Updated', 'BS2', 1726121322),
(274, 46, 1, 'assigned to SA2', 'BS2', 1726121518),
(275, 46, 2, 'Status Updated', 'BS2', 1726121717),
(276, 46, 3, 'Status Updated', 'BS2', 1726121749),
(277, 46, 4, 'Status Updated', 'BS2', 1726121898),
(278, 46, 5, 'Status Updated', 'BS2', 1726121986),
(279, 46, 8, 'Status Updated', 'BS2', 1726122176),
(280, 46, 9, 'Status Updated', 'BS2', 1726122199),
(281, 46, 10, 'Status Updated', 'BS2', 1726122221),
(282, 46, 11, 'Status Updated', 'BS2', 1726122246),
(283, 47, 1, 'URN Created', 'BS2', 1726122537),
(284, 47, 1, 'Documents Uploaded', 'BS2', 1726123205),
(285, 47, 2, 'Status Updated', 'BS2', 1726123424),
(286, 47, 3, 'Status Updated', 'BS2', 1726123460),
(287, 47, 3, 'Documents Uploaded', 'BS2', 1726123500),
(288, 47, 3, 'Documents Uploaded', 'BS2', 1726123529),
(289, 0, 0, 'Documents Uploaded', 'Portal Visitor', 1726257691),
(290, 0, 0, 'Documents Uploaded', 'Portal Visitor', 1727903909),
(291, 48, 1, 'Created', 'Portal Visitor', 1728013468),
(292, 48, 1, 'Documents Uploaded', 'Portal Visitor', 1728013507),
(293, 47, 3, 'Documents Uploaded', 'BS2', 1728015176),
(294, 47, 3, 'Alt Mobile, DOB & Address Updated', 'BS2', 1728015286),
(295, 47, 3, 'Academic Details Added', 'BS2', 1728015407),
(296, 47, 3, 'Passport Details Added', 'BS2', 1728015501),
(297, 47, 3, 'assigned to SP3', 'BS2', 1728015639),
(298, 47, 4, 'Status Updated', 'BS2', 1728015715),
(299, 47, 5, 'Status Updated', 'BS2', 1728015779),
(300, 47, 8, 'Status Updated', 'BS2', 1728015810),
(301, 47, 9, 'Status Updated', 'BS2', 1728015847),
(302, 47, 10, 'Status Updated', 'BS2', 1728015909),
(303, 47, 11, 'Status Updated', 'BS2', 1728015980),
(304, 34, 11, 'Status Updated', 'BS2', 1728017509),
(305, 29, 10, 'Status Updated', 'BS2', 1728017564),
(306, 29, 11, 'Status Updated', 'BS2', 1728017594),
(307, 40, 8, 'assigned to SA3', 'BS2', 1728017652),
(308, 40, 9, 'Status Updated', 'BS2', 1728017676),
(309, 40, 10, 'Status Updated', 'BS2', 1728017712),
(310, 40, 11, 'Status Updated', 'BS2', 1728017742),
(311, 39, 8, 'Status Updated', 'BS2', 1728018757),
(312, 39, 9, 'Status Updated', 'BS2', 1728018841),
(313, 39, 10, 'Status Updated', 'BS2', 1728018881),
(314, 39, 11, 'Status Updated', 'BS2', 1728018924),
(315, 25, 4, 'assigned to SP3', 'BS2', 1728018985),
(316, 25, 5, 'Status Updated', 'BS2', 1728019008),
(317, 25, 8, 'Status Updated', 'BS2', 1728019032),
(318, 25, 9, 'Status Updated', 'BS2', 1728019057),
(319, 25, 10, 'Status Updated', 'BS2', 1728019089),
(320, 25, 11, 'Status Updated', 'BS2', 1728019110),
(321, 37, 4, 'assigned to SP3', 'BS2', 1728019186),
(322, 37, 5, 'Status Updated', 'BS2', 1728019216),
(323, 37, 8, 'Status Updated', 'BS2', 1728019245),
(324, 37, 9, 'Status Updated', 'BS2', 1728019265),
(325, 37, 10, 'Status Updated', 'BS2', 1728019288),
(326, 37, 11, 'Status Updated', 'BS2', 1728019317),
(327, 14, 3, 'course selection updated', 'BS2', 1728019519),
(328, 14, 3, 'assigned to SP3', 'BS2', 1728019550),
(329, 14, 4, 'Status Updated', 'BS2', 1728019587),
(330, 14, 5, 'Status Updated', 'BS2', 1728019614),
(331, 14, 8, 'Status Updated', 'BS2', 1728019657),
(332, 14, 9, 'Status Updated', 'BS2', 1728019698),
(333, 14, 10, 'Status Updated', 'BS2', 1728019724),
(334, 14, 11, 'Status Updated', 'BS2', 1728019761),
(335, 33, 3, 'Address & DOB Updated', 'BS2', 1728023054),
(336, 33, 3, 'assigned to SP3', 'BS2', 1728023128),
(337, 33, 4, 'Status Updated', 'BS2', 1728023243),
(338, 33, 5, 'Status Updated', 'BS2', 1728023277),
(339, 33, 8, 'Status Updated', 'BS2', 1728023327),
(340, 33, 9, 'Status Updated', 'BS2', 1728023350),
(341, 33, 10, 'Status Updated', 'BS2', 1728023375),
(342, 33, 11, 'Status Updated', 'BS2', 1728023543),
(343, 36, 3, 'DOB & Address Updated', 'BS2', 1728024615),
(344, 36, 3, 'assigned to SP2', 'BS2', 1728024733),
(345, 36, 3, 'Documents Uploaded', 'BS2', 1728024767),
(346, 36, 4, 'Status Updated', 'BS2', 1728024796),
(347, 36, 5, 'Status Updated', 'BS2', 1728024822),
(348, 36, 8, 'Status Updated', 'BS2', 1728024911),
(349, 36, 9, 'Status Updated', 'BS2', 1728024939),
(350, 36, 10, 'Status Updated', 'BS2', 1728025007),
(351, 36, 11, 'Status Updated', 'BS2', 1728025030),
(352, 26, 2, 'assigned to SP3', 'BS2', 1728045125),
(353, 26, 2, 'Alt Mob, DOB & Address Updated', 'BS2', 1728045240),
(354, 26, 3, 'Status Updated', 'BS2', 1728045265),
(355, 26, 3, 'Documents Uploaded', 'SP3', 1728103125),
(356, 26, 3, 'Documents Uploaded', 'SP3', 1728103149),
(357, 49, 1, 'URN Created', 'BS2', 1728103933),
(358, 50, 1, 'URN Created', 'BS2', 1728103985),
(359, 50, 1, 'assigned to SP3', 'BS2', 1728103997),
(360, 50, 1, 'Student wants callback', 'BS2', 1728104082),
(361, 49, 1, 'Student wants callback', 'BS2', 1728104145),
(362, 44, 15, 'Students wants callback', 'BS2', 1728105344),
(363, 50, 1, 'Callback rescheduled', 'BS2', 1728105522),
(364, 51, 1, 'URN Created', 'BS2', 1728106575),
(365, 51, 1, 'Spoken to shiju and he has asked for few days to consider', 'BS2', 1728106693),
(366, 51, 1, 'Spoke to shiju and got his private and main number.', 'BS2', 1728106815),
(367, 51, 1, 'He will have all his documents ready to go thru ', 'BS2', 1728107106),
(368, 51, 1, 'assigned to SP2', 'BS2', 1728107189),
(369, 51, 1, 'assigned to SP3', 'BS2', 1728107338),
(370, 51, 1, 'Documents Uploaded', 'BS2', 1728107431),
(371, 51, 1, 'bsc maths', 'BS2', 1728107595),
(372, 51, 2, 'Status Updated', 'BS2', 1728107777),
(373, 51, 2, 'Documents Uploaded', 'BS2', 1728107878),
(374, 51, 3, 'Status Updated', 'BS2', 1728107922),
(375, 51, 4, 'Status Updated', 'BS2', 1728108089),
(376, 51, 5, 'Status Updated', 'BS2', 1728108182),
(377, 52, 1, 'Created', 'Portal Visitor', 1729598964),
(378, 53, 1, 'URN Created', 'BS2', 1729599044),
(379, 53, 2, 'Status Updated', 'BS2', 1729599153),
(380, 53, 2, 'Status Updated', 'BS2', 1729599170),
(381, 54, 1, 'URN Created', 'BS12', 1729708638),
(382, 55, 1, 'URN Created', 'BS12', 1729708640),
(383, 55, 2, 'Status Updated', 'BS12', 1729708695),
(384, 55, 2, 'Status Updated', 'BS12', 1729708712),
(385, 56, 1, 'created', 'student', 1729850787),
(386, 55, 3, 'Status Updated', 'BS2', 1731566608),
(387, 52, 2, 'Status Updated', 'BS2', 1731733931),
(388, 54, 15, 'request to delete', 'BS3', 1731734337),
(389, 54, 12, 'URN Deleted', 'BS2', 1731734409),
(390, 50, 1, 'testing', 'BS2', 1731735493);

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
) ENGINE=MyISAM AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `leads_details`
--

INSERT INTO `leads_details` (`id`, `urn`, `status_id`, `status_batch_id`, `student_id`, `course_id`, `datentime`, `created_by`, `source_id`, `application_point_id`, `allocated_id`) VALUES
(1, 251129, 12, 1, 1, 2, 1724411378, 'ST1', 5, 0, ''),
(2, 171814, 12, 1, 2, 2, 1724411685, 'ST2', 5, 0, 'SA1'),
(3, 361439, 1, 1, 3, 3, 1724820642, 'BS2', 5, 0, 'SA2'),
(4, 655074, 12, 1, 4, 26, 1724822125, 'BS2', 1, 0, 'SP1'),
(5, 792686, 12, 1, 5, 53, 1724823324, 'BS8', 3, 0, ''),
(6, 101896, 12, 1, 6, 34, 1724823431, 'BS8', 2, 0, 'SA1'),
(7, 131828, 1, 1, 7, 64, 1724823533, 'BS8', 6, 0, ''),
(8, 943645, 1, 1, 8, 31, 1724823780, 'BS8', 4, 0, ''),
(9, 582916, 1, 1, 9, 85, 1724823867, 'BS8', 1, 0, ''),
(10, 365110, 1, 1, 10, 26, 1724823925, 'BS8', 3, 0, ''),
(11, 928158, 1, 1, 11, 12, 1724823980, 'BS8', 1, 0, 'SP1'),
(12, 448541, 1, 1, 12, 21, 1724824068, 'BS8', 1, 0, ''),
(13, 516072, 1, 1, 13, 55, 1724824144, 'BS8', 1, 0, 'SP1'),
(14, 742352, 11, 1, 14, 16, 1724824241, 'BS8', 4, 3, 'SP3'),
(15, 834547, 1, 1, 15, 37, 1724824326, 'BS8', 3, 0, 'SP1'),
(16, 738761, 1, 1, 16, 59, 1724824422, 'BS8', 6, 0, 'SP1'),
(17, 663542, 1, 1, 17, 80, 1724824481, 'BS8', 4, 0, 'SP1'),
(18, 884026, 1, 1, 18, 75, 1724824776, 'BS8', 3, 0, 'SP1'),
(19, 481061, 1, 1, 19, 54, 1724824867, 'BS8', 6, 0, 'SA2'),
(20, 434685, 1, 1, 20, 66, 1724824950, 'BS8', 3, 0, 'SP1'),
(21, 575530, 1, 1, 21, 26, 1724825178, 'BS8', 1, 0, 'SP1'),
(22, 520169, 1, 1, 22, 42, 1724825415, 'BS8', 4, 0, 'SP2'),
(23, 751713, 12, 1, 23, 50, 1724825469, 'BS8', 1, 0, ''),
(24, 891032, 1, 1, 24, 74, 1724825632, 'BS8', 4, 0, 'SA1'),
(25, 389944, 11, 1, 25, 69, 1724825689, 'BS8', 6, 1, 'SP3'),
(26, 466509, 3, 1, 26, 55, 1724825766, 'BS8', 1, 0, 'SP3'),
(27, 440067, 14, 1, 27, 82, 1724825865, 'BS8', 3, 1, ''),
(28, 497752, 1, 1, 28, 90, 1724825953, 'BS8', 1, 0, 'SP2'),
(29, 390400, 11, 1, 29, 90, 1724826462, 'BS8', 4, 1, 'SP1'),
(30, 202114, 1, 1, 30, 61, 1724827148, 'BS8', 6, 0, 'SP2'),
(31, 356393, 1, 1, 31, 83, 1724827234, 'BS8', 3, 0, 'SP2'),
(32, 968293, 12, 1, 32, 68, 1724827276, 'BS8', 1, 0, ''),
(33, 178908, 11, 1, 33, 87, 1724827319, 'BS8', 4, 3, 'SP3'),
(34, 714621, 11, 1, 34, 35, 1724827361, 'BS8', 6, 1, 'SP2'),
(35, 569799, 11, 1, 35, 49, 1724827415, 'BS8', 4, 1, 'SP2'),
(36, 507414, 11, 1, 36, 52, 1724827496, 'BS8', 3, 3, 'SP2'),
(37, 480905, 11, 1, 37, 16, 1724827557, 'BS8', 3, 1, 'SP3'),
(38, 873227, 12, 1, 38, 14, 1724827652, 'BS8', 1, 0, 'SP2'),
(39, 463188, 11, 1, 39, 33, 1724827693, 'BS8', 6, 1, 'SA2'),
(40, 184732, 11, 1, 40, 96, 1724827756, 'BS8', 3, 1, 'SA3'),
(41, 635769, 13, 1, 41, 36, 1724827797, 'BS8', 3, 1, 'SP1'),
(42, 730306, 12, 1, 42, 4, 1724831048, 'BS2', 6, 0, ''),
(43, 445560, 12, 1, 43, 8, 1724831683, 'BS3', 1, 0, ''),
(44, 248663, 15, 1, 44, 7, 1724832048, 'BS3', 6, 0, ''),
(45, 344605, 11, 1, 45, 3, 1724842536, 'ST45', 5, 1, 'SP2'),
(46, 233708, 11, 1, 46, 4, 1726120932, 'BS2', 3, 1, 'SA2'),
(47, 583323, 11, 1, 47, 13, 1726122537, 'BS2', 4, 3, 'SP3'),
(48, 282829, 1, 1, 48, 39, 1728013468, 'ST48', 5, 0, ''),
(49, 236982, 1, 1, 49, 8, 1728103933, 'BS2', 3, 0, ''),
(50, 491455, 1, 1, 50, 40, 1728103985, 'BS2', 3, 0, 'SP3'),
(51, 265137, 5, 1, 51, 13, 1728106575, 'BS2', 1, 1, 'SP3'),
(52, 811731, 2, 1, 52, 79, 1729598964, 'ST52', 5, 0, ''),
(53, 292452, 2, 1, 53, 1, 1729599044, 'BS2', 3, 0, ''),
(54, 516253, 12, 1, 54, 2, 1729708638, 'BS12', 3, 0, ''),
(55, 822720, 3, 1, 55, 2, 1729708640, 'BS12', 3, 0, ''),
(56, 282154, 1, 1, 53, 2, 1729850787, '', 5, 0, '');

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
) ENGINE=MyISAM AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lead_allocation_list`
--

INSERT INTO `lead_allocation_list` (`id`, `lead_id`, `allocated_id`, `datentime`) VALUES
(1, 2, 'SA2', 1724413318),
(2, 2, 'SA1', 1724413362),
(3, 4, 'SP1', 1724822896),
(4, 3, 'SA2', 1724823207),
(5, 3, 'SP1', 1724823272),
(6, 6, 'SA1', 1724823482),
(7, 3, 'SA2', 1724823512),
(8, 11, 'SP1', 1724823993),
(9, 13, 'SP1', 1724824191),
(10, 14, 'SP1', 1724824274),
(11, 15, 'SP1', 1724824364),
(12, 16, 'SP1', 1724824432),
(13, 17, 'SP1', 1724824491),
(14, 18, 'SP1', 1724824825),
(15, 19, 'SA2', 1724824880),
(16, 20, 'SP1', 1724824973),
(17, 21, 'SP1', 1724825193),
(18, 22, 'SP2', 1724825427),
(19, 24, 'SA1', 1724825644),
(20, 25, 'SP2', 1724825699),
(21, 28, 'SP2', 1724825969),
(22, 29, 'SP1', 1724826675),
(23, 30, 'SP2', 1724827177),
(24, 31, 'SP2', 1724827243),
(25, 33, 'SP1', 1724827330),
(26, 36, 'SP1', 1724827524),
(27, 37, 'SP2', 1724827573),
(28, 38, 'SP2', 1724827661),
(29, 39, 'SA2', 1724827707),
(30, 40, 'SP1', 1724827767),
(31, 41, 'SP1', 1724827808),
(32, 35, 'SP2', 1724832603),
(33, 34, 'SP2', 1724833804),
(34, 26, 'SP1', 1724844274),
(35, 45, 'SP2', 1725695298),
(36, 46, 'SA2', 1726121518),
(37, 47, 'SP3', 1728015639),
(38, 40, 'SA3', 1728017652),
(39, 25, 'SP3', 1728018985),
(40, 37, 'SP3', 1728019186),
(41, 14, 'SP3', 1728019550),
(42, 33, 'SP3', 1728023128),
(43, 36, 'SP2', 1728024733),
(44, 26, 'SP3', 1728045125),
(45, 50, 'SP3', 1728103997),
(46, 51, 'SP2', 1728107189),
(47, 51, 'SP3', 1728107338);

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
(8, 'Visa Applied', 6, 1, 1719484628),
(9, 'Visa Approved', 7, 1, 1719484628),
(10, 'Fee Paid', 8, 1, 1719484628),
(11, 'Complete', 9, 1, 1719484628),
(12, 'Deleted', 999, 1, 1719484628),
(13, 'URN Rejected', 888, 1, 1719484628),
(14, 'Visa Rejected', 777, 1, 1719484628),
(15, 'Pending', 666, 1, 1719484628);

-- --------------------------------------------------------

--
-- Table structure for table `logged_user_list`
--

DROP TABLE IF EXISTS `logged_user_list`;
CREATE TABLE IF NOT EXISTS `logged_user_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_ref_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `logged_user_list`
--

INSERT INTO `logged_user_list` (`id`, `user_ref_id`) VALUES
(68, 'BS12'),
(67, 'ST53'),
(65, 'ST53'),
(64, 'BS12'),
(89, 'BS2'),
(90, 'BS2'),
(91, 'BS2'),
(92, 'BS2'),
(93, 'SA2'),
(94, 'SP3'),
(95, 'BS3'),
(96, 'BS2'),
(97, 'BS2'),
(98, 'SA2'),
(99, 'BS2'),
(100, 'BS2'),
(101, 'BS1'),
(102, 'BS1');

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
) ENGINE=MyISAM AUTO_INCREMENT=127 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(57, 'BS10', 'amit@moticorporation.com', '123456', 8, 1),
(58, 'BS11', 'pradeep@bs.com', '123456', 3, 0),
(59, 'ST1', 'rajiv@st.com', 'test1234', 5, 1),
(60, 'ST2', 'rajesh@st.com', 'test1234', 5, 1),
(61, 'ST3', 'jasi@st.com', 'std123456', 5, 1),
(62, 'ST4', 'abhigailstephen123@gmail.com', 'std123456', 5, 1),
(63, 'ST5', 'Adithya67@gamil.com', 'std123456', 5, 1),
(64, 'ST6', 'Alshiyaashok@gmail.com', 'std123456', 5, 1),
(65, 'ST7', 'Aruns501@gmail.com', 'std123456', 5, 1),
(66, 'ST8', 'Amitha996@gmail.com', 'std123456', 5, 1),
(67, 'ST9', 'Ashwini101@gmail.com', 'std123456', 5, 1),
(68, 'ST10', 'Bhavya996@gmail.com', 'std123456', 5, 1),
(69, 'ST11', 'Binnui@gmail.com', 'std123456', 5, 1),
(70, 'ST12', 'charan@gmail.com', 'std123456', 5, 1),
(71, 'ST13', 'chiranjeevi@gamil.com', 'std123456', 5, 1),
(72, 'ST14', 'darshan@gmail.com', 'std123456', 5, 1),
(73, 'ST15', 'deepadominic@gmaail.com', 'std123456', 5, 1),
(74, 'ST16', 'deon635@gmail.com', 'std123456', 5, 1),
(75, 'ST17', 'ethanalvin@gmail.com', 'std123456', 5, 1),
(76, 'ST18', 'elezabeth@gmail.com', 'std123456', 5, 1),
(77, 'ST19', 'franklin@gmail.com', 'std123456', 5, 1),
(78, 'ST20', 'ganga@gmail.com', 'std123456', 5, 1),
(79, 'ST21', 'harshitha@gmail.com', 'std123456', 5, 1),
(80, 'SP2', 'Hema@gmail.com', '123456', 6, 1),
(81, 'ST22', 'jananasprin@gmail.com', 'std123456', 5, 1),
(82, 'ST23', 'jeni@gmail.com', 'std123456', 5, 1),
(83, 'ST24', 'Karthik@gmail.com', 'std123456', 5, 1),
(84, 'ST25', 'kavana@gmail.com', 'std123456', 5, 1),
(85, 'ST26', 'kiran@gmail.com', 'std123456', 5, 1),
(86, 'ST27', 'kruthika@gmail.com', 'std123456', 5, 1),
(87, 'ST28', 'leela@gmail.com', 'std123456', 5, 1),
(88, 'ST29', 'malathi@gmail.com', 'std123456', 5, 1),
(89, 'ST30', 'manohar@gmail.com', 'std123456', 5, 1),
(90, 'ST31', 'megha@gmail.com', 'std123456', 5, 1),
(91, 'ST32', 'mitesh@gmail.com', 'std123456', 5, 1),
(92, 'ST33', 'mugilraj@gmail.com', 'std123456', 5, 1),
(93, 'ST34', 'naveen@gmail.com', 'std123456', 5, 1),
(94, 'ST35', 'nikitha@gmail.com', 'std123456', 5, 1),
(95, 'ST36', 'parthiban@gmail.com', 'std123456', 5, 1),
(96, 'ST37', 'ranjitha@gmail.com', 'std123456', 5, 1),
(97, 'ST38', 'pavithra@gmail.com', 'std123456', 5, 1),
(98, 'ST39', 'praveen@gmail.com', 'std123456', 5, 1),
(99, 'ST40', 'nishanth@gmail.com', 'std123456', 5, 1),
(100, 'ST41', 'priya@gmail.com', '123456789', 5, 1),
(101, 'ST42', 'thanshika@gmail.com', 'std123456', 5, 1),
(102, 'ST43', 'srinidhi@gmail.com', 'std123456', 5, 1),
(103, 'ST44', 'sharath@gmail.com', 'std123456', 5, 1),
(104, 'ST45', 'rajkumar@st.com', 'test1234', 5, 1),
(105, 'ST46', 'raj@st.com', 'std123456', 5, 1),
(106, 'ST47', 'rajiv1@st.com', 'std123456', 5, 1),
(107, 'ST48', 'shubh@st.com', 'test1234', 5, 1),
(108, 'SA3', 'tanvi@sa.com', '123456', 4, 1),
(109, 'SA4', 'manish@sa.com', '123456', 4, 1),
(110, 'SP3', 'manish@sp.com', '123456', 6, 1),
(111, 'SP4', 'ranjita@sp.com', '123456', 6, 1),
(112, 'SA5', 'reet@sa.com', '123456', 4, 1),
(113, 'ST49', 'sathvik@gmail.com', 'std123456', 5, 1),
(114, 'ST50', 'Richard@gmail.com', 'std123456', 5, 1),
(115, 'ST51', 'shijuGBP@GBP.Com', 'std123456', 5, 1),
(116, 'ST52', 'sddsfsd@f.c', 'test1234', 5, 1),
(117, 'ST53', 'nimilphilipzoo@gmail.com', 'std123456', 5, 1),
(118, 'BS12', 'nimilphilipzoo@gmail.com', '123456', 8, 1),
(119, 'ST54', 'nimilphilip@gmail.com', 'std123456', 5, 1),
(120, 'ST55', 'nimilphilip@gmail.com', 'std123456', 5, 1),
(121, 'CR1001', 'veeru@st.com', '123456', 5, 1),
(122, 'CR1002', 'arpita@st.com', '123456', 5, 1),
(124, 'CR1004', 'arpitasinha@st.com', '123456', 5, 1),
(125, 'CR1005', 'saralasinha@test.com', '123456', 5, 1),
(126, 'CR1006', 'suhana@st.com', '123456', 5, 1);

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
-- Table structure for table `lrn_list`
--

DROP TABLE IF EXISTS `lrn_list`;
CREATE TABLE IF NOT EXISTS `lrn_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `urn` int NOT NULL,
  `status_id` int NOT NULL,
  `status_batch_id` int NOT NULL,
  `crn` int NOT NULL,
  `product_id` int NOT NULL,
  `datentime` int NOT NULL,
  `created_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `source_id` int NOT NULL,
  `allocated_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`id`, `description`, `submenu_id_name`, `icon_name`, `parent_menu_id`) VALUES
(1, 'CRM', 'CRM', 'pie-chart', 1),
(2, 'LRN Management', 'LRN', 'file', 1),
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
(21, 'Setup Email Alerts', 'EMAIL-ALERTS', 'mail', 1),
(20, 'Reports', 'REPORT', 'file', 2),
(22, 'Communication History', 'COMMUNICATION', 'calendar', 1),
(23, 'CRN Managaement', 'CRN', 'users', 1);

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
-- Table structure for table `popular_search`
--

DROP TABLE IF EXISTS `popular_search`;
CREATE TABLE IF NOT EXISTS `popular_search` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `image_path` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  `bank_account_holder_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `bank_account_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `bank_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `bank_address` varchar(5040) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `bank_account_number` bigint NOT NULL,
  `bank_ifsc` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `salary` int NOT NULL,
  `comission` decimal(10,2) NOT NULL,
  `status` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sales_person_list`
--

INSERT INTO `sales_person_list` (`id`, `name`, `email`, `mobile`, `whatsapp`, `bank_account_holder_name`, `bank_account_type`, `bank_name`, `bank_address`, `bank_account_number`, `bank_ifsc`, `salary`, `comission`, `status`) VALUES
(1, 'Jasintha', 'jasi@sa.com', 112, 112, '', '', '', '', 0, '', 10000, 30.00, 1),
(2, 'Hema', 'Hema@gmail.com', 7432189563, 7432189563, '', '', '', '', 0, '', 30000, 10.00, 1),
(3, 'Manish Paul', 'manish@sp.com', 9865742310, 9865742310, 'Manish Paul', 'sb', 'AXIS', 'Sanjay Nagar Bangalore India', 254896, 'UTIB0000111', 10000, 25.00, 1),
(4, 'Ranjita Gupta', 'ranjita@sp.com', 9865324172, 9865324172, '', '', '', '', 0, '', 15000, 25.00, 1);

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
(1, 'Campus Abroad CRM V2', 'Moti Corporation', 'www.moticorporation.com', 'CRM v2.1', 'ca-logo.png');

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
  `status` int NOT NULL,
  `authorised_menu_options` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `authorised_submenu_options` varchar(5120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `staff_list`
--

INSERT INTO `staff_list` (`id`, `name`, `email`, `mobile`, `designation`, `division`, `role_type`, `status`, `authorised_menu_options`, `authorised_submenu_options`) VALUES
(2, 'G Yogesh Bafna', 'yogesh@bafna.net', 9902012547, 'Director', 'Management', 1, 1, '1,2,3,4,5,6,8,7,21,22,23', '1,2,10,11,18,19,20,21,12,13,14,15,16,39,23,8,9,7,41,5,42,43,44'),
(3, 'Jasintha', 'jasi@bs.com', 1237890, 'CSE', 'Support', 3, 1, '1,2,6', '1,2,23'),
(1, 'admin', 'info@campus-abroad.co.in', 9902012547, 'Admin', 'Management', 7, 1, '1,2,3,4,5,6,7,8,9', ''),
(8, 'Manish Bafna', 'manish@bafna.net', 123, 'Manager', 'Management', 8, 1, '1,2,3,4,5,6,7', '1,2,10,11,18,19,20,21,12,13,14,15,16,17,39,23,7'),
(10, 'Amit Sriwastav', 'amit@moticorporation.com', 7618844888, 'Developer', 'IT', 8, 1, '1,2,3,4,5,6,8,7,21,22', '1,2,10,11,18,19,20,21,12,13,14,15,16,17,39,23,8,9,7,41,5,42'),
(11, 'Pradeep Ranka', 'pradeep@bs.com', 7986789612, 'Backend Executive', 'Sales', 3, 0, '1,2,6', '1,2,23'),
(12, 'Nimil', 'nimilphilipzoo@gmail.com', 7994970111, 'Marketing Manager', 'Marketing', 8, 0, '1,2,3,5,6', '1,2,10,11,12,23');

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
) ENGINE=MyISAM AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `name`, `mobile`, `alternate_mobile`, `email`, `dob`, `brief_note`) VALUES
(1, 'Rajiv', 9876987612, 0, 'rajiv@st.com', 0, 'No Note'),
(2, 'Rajesh', 9876987613, 0, 'rajesh@st.com', 0, 'No Note'),
(3, 'Jasi', 1234567890, 1234567891, 'jasi@st.com', 473365800, 'No Note'),
(4, 'Abhigail Stephen', 9980642004, 0, 'abhigailstephen123@gmail.com', 0, 'No Note'),
(5, 'Adithya Sidharth', 9863563555, 0, 'Adithya67@gamil.com', 0, 'No Note'),
(6, 'Alshiya Ashok', 9646355356, 0, 'Alshiyaashok@gmail.com', 0, 'No Note'),
(7, 'Arun', 7788522643, 0, 'Aruns501@gmail.com', 0, 'No Note'),
(8, 'Amitha', 7852655365, 0, 'Amitha996@gmail.com', 0, 'No Note'),
(9, 'Ashwini', 8865321543, 0, 'Ashwini101@gmail.com', 0, 'No Note'),
(10, 'Bhavya', 8812563464, 0, 'Bhavya996@gmail.com', 0, 'No Note'),
(11, 'Binnui', 8842336645, 0, 'Binnui@gmail.com', 0, 'No Note'),
(12, 'Charan', 8965633312, 0, 'charan@gmail.com', 0, 'No Note'),
(13, 'Chiranjeevi', 8296639747, 0, 'chiranjeevi@gamil.com', 0, 'No Note'),
(14, 'Darshan', 9972704287, 0, 'darshan@gmail.com', 0, 'No Note'),
(15, 'Deepa Dominic', 9008165341, 0, 'deepadominic@gmaail.com', 0, 'No Note'),
(16, 'Deon', 9856326332, 0, 'deon635@gmail.com', 0, 'No Note'),
(17, 'Ethan', 7125346987, 0, 'ethanalvin@gmail.com', 0, 'No Note'),
(18, 'Elizabeth', 8835633456, 0, 'elezabeth@gmail.com', 0, 'No Note'),
(19, 'Franklin', 9796523366, 0, 'franklin@gmail.com', 0, 'No Note'),
(20, 'Ganga', 9633543352, 0, 'ganga@gmail.com', 0, 'No Note'),
(21, 'Harshitha', 9853332332, 0, 'harshitha@gmail.com', 0, 'No Note'),
(22, 'Janani', 9756223356, 0, 'jananasprin@gmail.com', 0, 'No Note'),
(23, 'Jeni', 9899886231, 0, 'jeni@gmail.com', 0, 'No Note'),
(24, 'Karthik', 7782146531, 0, 'Karthik@gmail.com', 0, 'No Note'),
(25, 'Kavana', 7080901452, 0, 'kavana@gmail.com', 0, 'No Note'),
(26, 'Kiran', 9080125656, 9080125656, 'kiran@gmail.com', 1009823400, 'No Note'),
(27, 'Kruthika', 8814632545, 0, 'kruthika@gmail.com', 0, 'No Note'),
(28, 'Leela', 8810456328, 0, 'leela@gmail.com', 0, 'No Note'),
(29, 'Malathi', 8932567234, 0, 'malathi@gmail.com', 0, 'No Note'),
(30, 'Manohar', 9970254637, 0, 'manohar@gmail.com', 0, 'No Note'),
(31, 'Megha', 9901035469, 0, 'megha@gmail.com', 1137695400, 'No Note'),
(32, 'Mitesh', 9972363332, 0, 'mitesh@gmail.com', 0, 'No Note'),
(33, 'Mugilraj', 9859898565, 0, 'mugilraj@gmail.com', 946665000, 'No Note'),
(34, 'Naveen', 9898653354, 0, 'naveen@gmail.com', 0, 'No Note'),
(35, 'Nikitha', 7896423566, 0, 'nikitha@gmail.com', 0, 'No Note'),
(36, 'Parthiban', 9444499276, 0, 'parthiban@gmail.com', 915129000, 'No Note'),
(37, 'Ranjitha', 9815363335, 0, 'ranjitha@gmail.com', 916770600, 'Doesnt have passport'),
(38, 'Pavithra', 9663355332, 0, 'pavithra@gmail.com', 1086028200, 'No Note'),
(39, 'Praveen', 9916335544, 0, 'praveen@gmail.com', 0, 'No Note'),
(40, 'Nishanth', 8965633565, 0, 'nishanth@gmail.com', 0, 'No Note'),
(41, 'Priya', 9815635463, 123456, 'priya@gmail.com', -19800, 'No Note'),
(42, 'Thanshika', 9363255645, 0, 'thanshika@gmail.com', 0, 'No Note'),
(43, 'Srinidhi', 8986555455, 0, 'srinidhi@gmail.com', 0, 'No Note'),
(44, 'sharath', 7954654645, 0, 'sharath@gmail.com', 0, 'No Note'),
(45, 'Rajkumar', 9871234564, 0, 'rajkumar@st.com', 0, 'No Note'),
(46, 'Raj', 9988665533, 1234567890, 'raj@st.com', 631132200, 'No Note'),
(47, 'Rajiv', 9977558822, 9977558822, 'rajiv1@st.com', 915129000, 'No Note'),
(48, 'Shubhanand', 9876541230, 0, 'shubh@st.com', 0, 'No Note'),
(49, 'Sathvik', 7898965456, 0, 'sathvik@gmail.com', 0, 'No Note'),
(50, 'Richard', 9635533355, 0, 'Richard@gmail.com', 0, 'No Note'),
(51, 'Shiju Trillion', 7025847457, 0, 'shijuGBP@GBP.Com', 978287400, 'Shiju was very keen to join Kings. he is a British natinal ksdjfbhsdfhdkdcnksdjfbdui'),
(52, 'asdasdsa', 9223372036854775807, 0, 'sddsfsd@f.c', 0, 'No Note'),
(53, 'Nimil Philip', 7994970111, 0, 'nimilphilipzoo@gmail.com', 0, 'No Note'),
(54, 'test', 9072430726, 0, 'nimilphilip@gmail.com', 0, 'No Note'),
(55, 'test', 9072430726, 0, 'nimilphilip@gmail.com', 0, 'No Note');

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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student_wishlist`
--

INSERT INTO `student_wishlist` (`id`, `student_id`, `course_id`) VALUES
(1, 41, 2),
(2, 41, 3);

-- --------------------------------------------------------

--
-- Table structure for table `subject_list`
--

DROP TABLE IF EXISTS `subject_list`;
CREATE TABLE IF NOT EXISTS `subject_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
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
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `submenu_items`
--

INSERT INTO `submenu_items` (`id`, `description`, `href_link`, `parent_menu_item_id`) VALUES
(1, 'URN Lead', '../urn_management/leads.php', 1),
(2, 'Create Lead', '../lead_management/temp_leads.php', 1),
(23, 'Chat List', '../chat_management/chat_list.php', 6),
(5, 'Calls', '../communication_history_management/callback_list.php', 22),
(6, 'Menu Items', '../menu_management/menu_items.php', 9),
(7, 'Commission', '../commission_management/commission_history.php', 7),
(8, 'Site Info', '../site_management/site_settings.php', 8),
(9, 'Options', '../site_management/portal_settings.php', 8),
(10, 'Courses', '../university_management/view_course.php', 3),
(11, 'Universities', '../university_management/university_list.php', 3),
(12, 'Lead Source', '../report_management/lead_source_report.php', 5),
(13, 'Agent', '../report_management/agent_report.php', 5),
(14, 'Sales Person', '../report_management/sales_person_report.php', 5),
(15, 'Application Point', '../report_management/application_point_report.php', 5),
(16, 'Students', '../report_management/student_report.php', 5),
(18, 'Staff', '../staff_management/staff_list.php', 4),
(19, 'Agent', '../agent_management/agent_list.php', 4),
(20, 'Sales Person', '../sales_person_management/sales_person_list.php', 4),
(21, 'Application Point', '../application_point_management/application_point_list.php', 4),
(22, 'Submenu Items', '../menu_management/submenu_items.php', 9),
(24, 'Menu List', '../menu_management/menu_list.php', 9),
(25, 'Profile', '../myaccount/myaccount.php', 14),
(26, 'Chat List', '../chat_management/chat_list_partner.php', 15),
(27, 'Wallet', '../myaccount/mywallet.php', 14),
(28, 'Create Lead', '../lead_management/temp_leads.php', 12),
(29, 'URN Lead', '../urn_management/leads.php', 12),
(31, 'Chat List', 'chat_list.php', 18),
(32, 'Course Finder', 'course_finder.php', 16),
(33, 'University Finder', 'university_finder.php', 16),
(34, 'Profile', 'myaccount.php', 17),
(35, 'Settings', 'myaccount.php?tab=settings', 17),
(36, 'Wishlist', 'mywishlist.php', 17),
(37, 'Application', 'myurn_list.php', 17),
(39, 'University Performance', '../report_management/university_performance_report.php', 5),
(40, 'University Performance', '../report_management/university_performance_report.php', 20),
(41, 'Email Alerts', '../alert_management/email_alerts_settings.php', 21),
(42, 'Emails', '../communication_history_management/email_history.php', 22),
(43, 'CRN List', '../crn_management/crn_list.php', 23),
(44, 'Create CRN', '../crn_management/create_crn.php', 23);

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
) ENGINE=MyISAM AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `temp_leads`
--

INSERT INTO `temp_leads` (`id`, `name`, `mobile`, `email`, `datentime`, `creator_id`, `creator_type`, `source_id`, `status`, `remark`, `hidden`) VALUES
(1, 'Jasi', 1234567890, 'jasi@st.com', 1724820168, 2, 1, 5, 1, 'URN Created', 1),
(2, 'Abhigail Stephen', 9980642004, 'abhigailstephen123@gmail.com', 1724822000, 2, 1, 1, 1, 'URN Created', 1),
(3, 'Adithya Sidharth', 9863563555, 'Adithya67@gamil.com', 1724822000, 2, 1, 3, 1, 'URN Created', 1),
(4, 'Alshiya Ashok', 9646355356, 'Alshiyaashok@gmail.com', 1724822000, 2, 1, 2, 1, 'URN Created', 1),
(5, 'Amitha', 7852655365, 'Amitha996@gmail.com', 1724822000, 2, 1, 4, 1, 'URN Created', 1),
(6, 'Arun', 7788522643, 'Aruns501@gmail.com', 1724822000, 2, 1, 6, 1, 'URN Created', 1),
(7, 'Ashwini', 8865321543, 'Ashwini101@gmail.com', 1724822000, 2, 1, 1, 1, 'URN Created', 1),
(8, 'Bhavya', 8812563464, 'Bhavya996@gmail.com', 1724822000, 2, 1, 3, 1, 'URN Created', 1),
(9, 'Binnui', 8842336645, 'Binnui@gmail.com', 1724822000, 2, 1, 1, 1, 'URN Created', 1),
(10, 'Charan', 8965633312, 'charan@gmail.com', 1724822000, 2, 1, 1, 1, 'URN Created', 1),
(11, 'Chiranjeevi', 8296639747, 'chiranjeevi@gamil.com', 1724822000, 2, 1, 1, 1, 'URN Created', 1),
(12, 'Darshan', 9972704287, 'darshan@gmail.com', 1724822000, 2, 1, 4, 1, 'URN Created', 1),
(13, 'Deepa Dominic', 9008165341, 'deepadominic@gmaail.com', 1724822000, 2, 1, 3, 1, 'URN Created', 1),
(14, 'Deon', 9856326332, 'deon635@gmail.com', 1724822000, 2, 1, 6, 1, 'URN Created', 1),
(15, 'Ethan', 7125346987, 'ethanalvin@gmail.com', 1724822000, 2, 1, 4, 1, 'URN Created', 1),
(16, 'Elizabeth', 8835633456, 'elezabeth@gmail.com', 1724822000, 2, 1, 3, 1, 'URN Created', 1),
(17, 'Franklin', 9796523366, 'franklin@gmail.com', 1724822000, 2, 1, 6, 1, 'URN Created', 1),
(18, 'Ganga', 9633543352, 'ganga@gmail.com', 1724822000, 2, 1, 3, 1, 'URN Created', 1),
(19, 'Harshitha', 9853332332, 'harshitha@gmail.com', 1724822000, 2, 1, 1, 1, 'URN Created', 1),
(20, 'Janani', 9756223356, 'jananasprin@gmail.com', 1724822000, 2, 1, 4, 1, 'URN Created', 1),
(21, 'Jeni', 9899886231, 'jeni@gmail.com', 1724822000, 2, 1, 1, 1, 'URN Created', 1),
(22, 'Karthik', 7782146531, 'Karthik@gmail.com', 1724822000, 2, 1, 4, 1, 'URN Created', 1),
(23, 'Kavana', 7080901452, 'kavana@gmail.com', 1724822000, 2, 1, 6, 1, 'URN Created', 1),
(24, 'Kiran', 9080125656, 'kiran@gmail.com', 1724822000, 2, 1, 1, 1, 'URN Created', 1),
(25, 'Kruthika', 8814632545, 'kruthika@gmail.com', 1724822000, 2, 1, 3, 1, 'URN Created', 1),
(26, 'Leela', 8810456328, 'leela@gmail.com', 1724822000, 2, 1, 1, 1, 'URN Created', 1),
(27, 'Malathi', 8932567234, 'malathi@gmail.com', 1724822000, 2, 1, 4, 1, 'URN Created', 1),
(28, 'Manohar', 9970254637, 'manohar@gmail.com', 1724822000, 2, 1, 6, 1, 'URN Created', 1),
(29, 'Megha', 9901035469, 'megha@gmail.com', 1724822000, 2, 1, 3, 1, 'URN Created', 1),
(30, 'Mitesh', 9972363332, 'mitesh@gmail.com', 1724822000, 2, 1, 1, 1, 'URN Created', 1),
(31, 'Mugilraj', 9859898565, 'mugilraj@gmail.com', 1724822000, 2, 1, 4, 1, 'URN Created', 1),
(32, 'Naveen', 9898653354, 'naveen@gmail.com', 1724822000, 2, 1, 6, 1, 'URN Created', 1),
(33, 'Nikitha', 7896423566, 'nikitha@gmail.com', 1724822000, 2, 1, 4, 1, 'URN Created', 1),
(34, 'Nishanth', 8965633565, 'nishanth@gmail.com', 1724822000, 2, 1, 3, 1, 'URN Created', 1),
(35, 'Parthiban', 9444499276, 'parthiban@gmail.com', 1724822000, 2, 1, 3, 1, 'URN Created', 1),
(36, 'Pavithra', 9663355332, 'pavithra@gmail.com', 1724822000, 2, 1, 1, 1, 'URN Created', 1),
(37, 'Praveen', 9916335544, 'praveen@gmail.com', 1724822000, 2, 1, 6, 1, 'URN Created', 1),
(38, 'Priya', 9815635463, 'priya@gmail.com', 1724822000, 2, 1, 3, 1, 'URN Created', 1),
(39, 'Raju', 9236556633, 'raju1@gmail.com', 1724822000, 2, 1, 1, 0, '', 0),
(40, 'Ranjitha', 9815363335, 'ranjitha@gmail.com', 1724822000, 2, 1, 3, 1, 'URN Created', 1),
(41, 'Rebecca', 9665463255, 'rebecca@gmail.com', 1724822000, 2, 1, 6, 0, '', 0),
(42, 'Reeta', 8893256633, 'reeta@gmail.com', 1724822000, 2, 1, 3, 0, '', 0),
(43, 'Richard', 9635533355, 'Richard@gmail.com', 1724822000, 2, 1, 3, 1, 'URN Created', 1),
(44, 'Sam Keith', 9988665332, 'samkeith@gmail.com', 1724822000, 2, 1, 1, 0, '', 0),
(45, 'Sandeep', 9987666522, 'sandeep@gmail.com', 1724822000, 2, 1, 4, 0, '', 0),
(46, 'Sanjana', 8766646362, 'sanjana@gmail.com', 1724822000, 2, 1, 1, 0, '', 0),
(47, 'Sathvik', 7898965456, 'sathvik@gmail.com', 1724822000, 2, 1, 3, 1, 'URN Created', 1),
(48, 'sharath', 7954654645, 'sharath@gmail.com', 1724822000, 2, 1, 6, 1, 'URN Created', 1),
(49, 'Srinidhi', 8986555455, 'srinidhi@gmail.com', 1724822000, 2, 1, 1, 1, 'URN Created', 1),
(50, 'Thanshika', 9363255645, 'thanshika@gmail.com', 1724822000, 2, 1, 6, 1, 'URN Created', 1),
(51, 'Raj', 9988665533, 'raj@st.com', 1726120904, 2, 1, 3, 1, 'URN Created', 1),
(52, 'Rajiv', 9977558822, 'rajiv1@st.com', 1726122449, 2, 1, 4, 1, 'URN Created', 1),
(53, 'Deepak', 9902012548, 'deepak@st.com', 1728104323, 2, 1, 1, 0, '', 0),
(54, 'Suhana', 9922001234, 'suhana@st.com', 1728104881, 2, 1, 3, 1, 'CRN Created', 1),
(55, 'Reet', 9922001236, 'reet@st.com', 1728104881, 2, 1, 3, 0, '', 0),
(56, 'Yogesh', 9922001237, 'yogesh@st.com', 1728104881, 2, 1, 1, 0, '', 0),
(57, 'Mamta', 9922001346, '', 1728104881, 2, 1, 1, 0, '', 0),
(58, 'Tanvi', 9922001365, '', 1728104881, 2, 1, 4, 0, '', 0),
(59, 'Sumita', 9922001458, 'sumita@st.com', 1728104881, 2, 1, 3, 0, '', 0),
(60, 'Susmita', 8855447629, 'susmita@st.com', 1728104881, 2, 1, 3, 0, '', 0),
(61, 'yogita', 9900213654, 'yogita@st.com', 1728104881, 2, 1, 1, 0, '', 0),
(62, 'Rachita', 9988123456, 'rachita@st.com', 1728104881, 2, 1, 1, 0, '', 0),
(63, 'Archit', 9920201452, 'archit@st.com', 1728104881, 2, 1, 4, 0, '', 0),
(64, 'Veeru', 9922001235, 'veeru@st.com', 1728104955, 2, 1, 2, 1, 'CRN Created', 1),
(65, 'Mamta', 9922001346, '', 1728104955, 2, 1, 1, 0, '', 0),
(66, 'Tanvi', 9922001365, '', 1728104955, 2, 1, 4, 0, '', 0),
(67, 'Chandrika', 9922001452, '', 1728104955, 2, 1, 2, 0, '', 0),
(68, 'arpita', 9945251325, 'arpita@st.com', 1728104955, 2, 1, 2, 1, 'CRN Created', 1),
(69, 'sarvesh', 9911002453, 'sarvesh@st.com', 1728104955, 2, 1, 2, 0, '', 0),
(70, 'Shiju Trillion', 70070070, 'shijuGBP@GBP.Com', 1728106478, 2, 1, 1, 1, 'URN Created', 1),
(71, 'Nimil Philip', 7994970111, 'nimilphilipzoo@gmail.com', 1729598949, 2, 1, 3, 1, 'URN Created', 1),
(72, 'test', 9072430726, 'nimilphilip@gmail.com', 1729665397, 2, 1, 3, 1, 'URN Created', 1);

-- --------------------------------------------------------

--
-- Table structure for table `university_list`
--

DROP TABLE IF EXISTS `university_list`;
CREATE TABLE IF NOT EXISTS `university_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `logo` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `region` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `country_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `university_list`
--

INSERT INTO `university_list` (`id`, `name`, `logo`, `region`, `country_id`) VALUES
(1, 'Anglia Ruskin University', '', 'London', 2),
(2, 'City University of London', '', 'London', 2),
(3, 'De Montfort University', '', 'London', 2),
(4, 'Edinburgh Napier University', '', 'London', 2),
(5, 'Kings College London', '', 'London', 2),
(6, 'London Metropolitan University', '', 'London', 2),
(7, 'Nottingham Trent University', '', 'London', 2),
(8, 'University College Birmingham', '', 'London', 2),
(9, 'Leeds Beckett University', '', 'London', 2),
(10, 'University of Greenwich', '', 'London', 2),
(27, 'University of Oxford', '', 'England', 2),
(28, 'University of Cambridge', '', 'England', 2),
(29, 'Imperial College London', '', 'England', 2),
(30, 'University of Edinburgh', '', 'Edinburgh', 2),
(31, 'University of Manchester', '', 'Manchester', 2),
(32, 'University of Warwick', '', 'Coventry', 2),
(33, 'Harvard University', '', 'Massachusets', 1),
(34, 'Standford University', '', 'California', 1),
(35, 'Princeton University', '', 'New Jersey', 1),
(36, 'University of Chicago', '', 'Illinois', 1),
(37, 'Columbia University', '', 'New York', 1),
(38, 'University of Pennsylvania', '', 'Pennsylvania', 1),
(39, 'Australian National University', '', 'Canbera', 5),
(40, 'University of Melbourne', '', 'Melbourne', 5),
(41, 'University of Sydney', '', 'Sydney', 5),
(42, 'University of Queensland', '', 'Brisbane', 5),
(43, 'Monash University', '', 'Melbourne', 5),
(44, 'University of Adelaide', '', 'Adelaide', 5),
(45, 'Humboldt University of Berlin', '', 'Berlin', 4),
(46, 'Ludwig Maximilian University of Munich', '', 'Munich', 4),
(47, 'Heidelberg University', '', 'Heidelberg', 4),
(48, 'University of Freiburg', '', 'Freiburg im Breisgau', 4),
(49, 'University of Mannheim', '', 'Mannheim', 4),
(50, 'University of Gottingen', '', 'Gottingen', 4),
(51, 'University of Toronto', '', 'Toronto', 3),
(52, 'University of British Columbia', '', 'Vancouver', 3),
(53, 'McGill University', '', 'Montreal', 3),
(54, 'McMaster University', '', 'Hamilton', 3),
(55, 'Queens University', '', 'Ontario', 3),
(56, 'University of Alberta', '', 'Edmonton', 3),
(57, 'Standford University', '', 'California', 1);

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
) ENGINE=MyISAM AUTO_INCREMENT=321 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `urn_audit_history`
--

INSERT INTO `urn_audit_history` (`id`, `lead_id`, `course_id`, `status_id`, `student_name`, `student_dob`, `student_mobile`, `student_mobile_alt`, `student_email`, `student_address`, `student_brief_note`, `highest_education_type`, `highest_education_name`, `highest_education_from_year`, `highest_education_to_year`, `highest_education_institution`, `highest_education_institution_city`, `highest_education_institution_country`, `test_taken_flag`, `test_name`, `other_test_name`, `passport_number`, `passport_place_of_issue`, `passport_issued_on`, `passport_valid_till`, `passport_holder_name`, `passport_holder_surname`, `immigration_applied`, `immigration_detail`, `past_visa_refusal_status`, `past_visa_refusal_detail`, `serious_medical_status`, `medical_condition_detail`, `criminal_offence_status`, `criminal_offence_detail`, `updation_remark`, `datentime`, `updated_columns`) VALUES
(1, 1, 2, 1, 'Rajiv', 0, 9876987612, 0, 'rajiv@st.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Created By Portal Visitor', 1724411378, ''),
(2, 2, 2, 1, 'Rajesh', 0, 9876987613, 0, 'rajesh@st.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Created By Portal Visitor', 1724411685, ''),
(3, 3, 2, 1, 'Jasi', 0, 1234567890, 0, 'jasi@st.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Created By Admin', 1724820642, ''),
(4, 3, 2, 1, 'Jasi', 0, 1234567890, 0, 'jasi@st.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Documents Uploaded By BS2', 1724820661, ''),
(5, 3, 2, 1, 'Jasi', 473365800, 1234567890, 1234567890, 'jasi@st.com', '3rd floor Moti Tower\r\nHebbal India', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Alt Mobile, DOB & Address Added', 1724820766, 'student_dob,student_mobile_alt,student_address'),
(6, 3, 2, 1, 'Jasi', 473365800, 1234567890, 1234567890, 'jasi@st.com', '3rd floor Moti Tower\r\nHebbal India', 'No Note', 3, 'Intermediate Commerce', 2022, 2024, 'Karnataka Board', 'Bangalore', 'India', 1, 'IELTS', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Academic Details & Test Added', 1724822014, 'highest_education_type,highest_education_name,highest_education_from_year,highest_education_to_year,highest_education_institution,highest_education_institution_city,highest_education_institution_country,test_taken_flag,test_name'),
(7, 4, 26, 1, 'Abhigail Stephen', 0, 9980642004, 0, 'abhigailstephen123@gmail.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Created By Admin', 1724822125, ''),
(8, 4, 26, 1, 'Abhigail Stephen', 0, 9980642004, 0, 'abhigailstephen123@gmail.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Documents Uploaded By BS2', 1724822352, ''),
(9, 4, 26, 1, 'Abhigail Stephen', 0, 9980642004, 0, 'abhigailstephen123@gmail.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Documents Uploaded By BS2', 1724822366, ''),
(10, 3, 2, 1, 'Jasi', 473365800, 1234567890, 1234567890, 'jasi@st.com', '3rd floor Moti Tower\r\nHebbal India', 'No Note', 3, 'Intermediate Commerce', 2021, 2023, 'Karnataka Board', 'Bangalore', 'India', 1, 'IELTS', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Academic Updated', 1724822413, 'highest_education_from_year,highest_education_to_year,test_name'),
(11, 3, 2, 1, 'Jasi', 473365800, 1234567890, 1234567890, 'jasi@st.com', '3rd floor Moti Tower\r\nHebbal India', 'No Note', 3, 'Intermediate Commerce', 2021, 2023, 'Karnataka Board', 'Bangalore', 'India', 1, 'IELTS', '', 1234567890, 'India', 631132200, 1735669800, 'Jasi', 'NA', 0, '', 0, '', 0, '', 0, '', 'Passport Details Added', 1724822514, 'passport_number,passport_place_of_issue,passport_holder_name,passport_holder_surname,passport_issued_on,passport_valid_till'),
(12, 4, 26, 1, 'Abhigail Stephen', 0, 9980642004, 0, 'abhigailstephen123@gmail.com', '', 'No Note', 3, 'Plus Two', 2019, 2021, 'Vijaya Pre University', 'Karnataka', 'India', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'I dind not take any test', 1724822575, 'highest_education_type,highest_education_name,highest_education_from_year,highest_education_to_year,highest_education_institution,highest_education_institution_city,highest_education_institution_country'),
(13, 3, 2, 1, 'Jasi', 473365800, 1234567890, 1234567890, 'jasi@st.com', '3rd floor Moti Tower\r\nHebbal India', 'No Note', 3, 'Intermediate Commerce', 2021, 2023, 'Karnataka Board', 'Bangalore', 'India', 1, 'IELTS', '', 1234567890, 'India', 631132200, 1735669800, 'Jasi', 'Paulraj', 0, '', 0, '', 0, '', 0, '', 'Passport Updated', 1724822650, 'passport_holder_surname'),
(14, 4, 26, 1, 'Abhigail Stephen', 0, 9980642004, 0, 'abhigailstephen123@gmail.com', '', 'No Note', 3, 'Plus Two', 2019, 2021, 'Vijaya Pre University', 'Karnataka', 'India', 0, '', '', 123456789, 'Bangalore', 1357756200, 2147483647, 'Abhigail ', 'Stephen', 0, '', 0, '', 0, '', 0, '', 'Passport detail added', 1724822840, 'passport_number,passport_place_of_issue,passport_holder_name,passport_holder_surname,passport_issued_on,passport_valid_till'),
(15, 3, 12, 1, 'Jasi', 473365800, 1234567890, 1234567890, 'jasi@st.com', '3rd floor Moti Tower\r\nHebbal India', 'No Note', 3, 'Intermediate Commerce', 2021, 2023, 'Karnataka Board', 'Bangalore', 'India', 1, 'IELTS', '', 1234567890, 'India', 631132200, 1735669800, 'Jasi', 'Paulraj', 0, '', 0, '', 0, '', 0, '', 'course selection updated', 1724822918, 'course'),
(16, 3, 16, 1, 'Jasi', 473365800, 1234567890, 1234567890, 'jasi@st.com', '3rd floor Moti Tower\r\nHebbal India', 'No Note', 3, 'Intermediate Commerce', 2021, 2023, 'Karnataka Board', 'Bangalore', 'India', 1, 'IELTS', '', 1234567890, 'India', 631132200, 1735669800, 'Jasi', 'Paulraj', 0, '', 0, '', 0, '', 0, '', 'course selection updated', 1724823173, 'course'),
(17, 5, 53, 1, 'Adithya Sidharth', 0, 9863563555, 0, 'Adithya67@gamil.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Created By Admin', 1724823324, ''),
(18, 5, 53, 1, 'Adithya Sidharth', 0, 9863563555, 0, 'Adithya67@gamil.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Documents Uploaded By BS8', 1724823349, ''),
(19, 6, 34, 1, 'Alshiya Ashok', 0, 9646355356, 0, 'Alshiyaashok@gmail.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Created By Admin', 1724823431, ''),
(20, 6, 34, 1, 'Alshiya Ashok', 0, 9646355356, 0, 'Alshiyaashok@gmail.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Documents Uploaded By BS8', 1724823459, ''),
(21, 7, 64, 1, 'Arun', 0, 7788522643, 0, 'Aruns501@gmail.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Created By Admin', 1724823533, ''),
(22, 7, 64, 1, 'Arun', 0, 7788522643, 0, 'Aruns501@gmail.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Documents Uploaded By BS8', 1724823563, ''),
(23, 8, 31, 1, 'Amitha', 0, 7852655365, 0, 'Amitha996@gmail.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Created By Admin', 1724823780, ''),
(24, 8, 31, 1, 'Amitha', 0, 7852655365, 0, 'Amitha996@gmail.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Documents Uploaded By BS8', 1724823810, ''),
(25, 9, 85, 1, 'Ashwini', 0, 8865321543, 0, 'Ashwini101@gmail.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Created By Admin', 1724823867, ''),
(26, 9, 85, 1, 'Ashwini', 0, 8865321543, 0, 'Ashwini101@gmail.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Documents Uploaded By BS8', 1724823886, ''),
(27, 3, 16, 1, 'Jasi', 473365800, 1234567890, 1234567890, 'jasi@st.com', '3rd floor Moti Tower\r\nHebbal India', 'No Note', 3, 'Intermediate Commerce', 2021, 2023, 'Karnataka Board', 'Bangalore', 'India', 1, 'IELTS', '', 1234567891, 'India', 631132200, 1735669800, 'Jasi', 'Paulraj', 0, '', 0, '', 0, '', 0, '', 'Passport Number Rectified', 1724823895, 'passport_number'),
(28, 10, 26, 1, 'Bhavya', 0, 8812563464, 0, 'Bhavya996@gmail.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Created By Admin', 1724823925, ''),
(29, 10, 26, 1, 'Bhavya', 0, 8812563464, 0, 'Bhavya996@gmail.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Documents Uploaded By BS8', 1724823944, ''),
(30, 3, 16, 1, 'Jasi', 473365800, 1234567890, 1234567890, 'jasi@st.com', '3rd floor Moti Tower\r\nHebbal India', 'No Note', 3, 'Intermediate Commerce', 2021, 2023, 'Karnataka Board', 'Bangalore North', 'India', 1, 'IELTS', '', 1234567891, 'India', 631132200, 1735669800, 'Jasi', 'Paulraj', 0, '', 0, '', 0, '', 0, '', 'Academic Detail Updated', 1724823947, 'highest_education_institution_city,test_name'),
(31, 11, 12, 1, 'Binnui', 0, 8842336645, 0, 'Binnui@gmail.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Created By Admin', 1724823980, ''),
(32, 3, 16, 1, 'Jasi', 473365800, 1234567890, 1234567890, 'jasi@st.com', '3rd floor Moti Tower\r\nHebbal India', 'No Note', 3, 'Intermediate Commerce', 2021, 2023, 'Karnataka Board', 'Bangalore North', 'India', 1, 'IELTS', '', 1234567891, 'India', 631132200, 1735669800, 'Jasi', 'Paulraj', 0, '', 0, '', 0, '', 0, '', 'Documents Uploaded By SA2', 1724824051, ''),
(33, 12, 21, 1, 'Charan', 0, 8965633312, 0, 'charan@gmail.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Created By Admin', 1724824068, ''),
(34, 3, 36, 1, 'Jasi', 473365800, 1234567890, 1234567890, 'jasi@st.com', '3rd floor Moti Tower\r\nHebbal India', 'No Note', 3, 'Intermediate Commerce', 2021, 2023, 'Karnataka Board', 'Bangalore North', 'India', 1, 'IELTS', '', 1234567891, 'India', 631132200, 1735669800, 'Jasi', 'Paulraj', 0, '', 0, '', 0, '', 0, '', 'course selection updated', 1724824073, 'course'),
(35, 12, 21, 1, 'Charan', 0, 8965633312, 0, 'charan@gmail.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Documents Uploaded By BS8', 1724824094, ''),
(36, 13, 55, 1, 'Chiranjeevi', 0, 8296639747, 0, 'chiranjeevi@gamil.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Created By Admin', 1724824144, ''),
(37, 13, 55, 1, 'Chiranjeevi', 0, 8296639747, 0, 'chiranjeevi@gamil.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Documents Uploaded By BS8', 1724824169, ''),
(38, 14, 21, 1, 'Darshan', 0, 9972704287, 0, 'darshan@gmail.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Created By Admin', 1724824241, ''),
(39, 14, 21, 1, 'Darshan', 0, 9972704287, 0, 'darshan@gmail.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Documents Uploaded By BS8', 1724824262, ''),
(40, 15, 37, 1, 'Deepa Dominic', 0, 9008165341, 0, 'deepadominic@gmaail.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Created By Admin', 1724824326, ''),
(41, 15, 37, 1, 'Deepa Dominic', 0, 9008165341, 0, 'deepadominic@gmaail.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Documents Uploaded By BS8', 1724824353, ''),
(42, 16, 59, 1, 'Deon', 0, 9856326332, 0, 'deon635@gmail.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Created By Admin', 1724824422, ''),
(43, 17, 80, 1, 'Ethan', 0, 7125346987, 0, 'ethanalvin@gmail.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Created By Admin', 1724824481, ''),
(44, 18, 75, 1, 'Elizabeth', 0, 8835633456, 0, 'elezabeth@gmail.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Created By Admin', 1724824776, ''),
(45, 18, 75, 1, 'Elizabeth', 0, 8835633456, 0, 'elezabeth@gmail.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Documents Uploaded By BS8', 1724824800, ''),
(46, 19, 54, 1, 'Franklin', 0, 9796523366, 0, 'franklin@gmail.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Created By Admin', 1724824867, ''),
(47, 20, 66, 1, 'Ganga', 0, 9633543352, 0, 'ganga@gmail.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Created By Admin', 1724824950, ''),
(48, 3, 36, 1, 'Jasi', 473365800, 1234567890, 1234567891, 'jasi@st.com', '3rd floor Moti Tower\r\nHebbal India', 'No Note', 3, 'Intermediate Commerce', 2021, 2023, 'Karnataka Board', 'Bangalore North', 'India', 1, 'IELTS', '', 1234567891, 'India', 631132200, 1735669800, 'Jasi', 'Paulraj', 0, '', 0, '', 0, '', 0, '', 'Alt Mobile Updated', 1724824960, 'student_mobile_alt'),
(49, 3, 3, 1, 'Jasi', 473365800, 1234567890, 1234567891, 'jasi@st.com', '3rd floor Moti Tower\r\nHebbal India', 'No Note', 3, 'Intermediate Commerce', 2021, 2023, 'Karnataka Board', 'Bangalore North', 'India', 1, 'IELTS', '', 1234567891, 'India', 631132200, 1735669800, 'Jasi', 'Paulraj', 0, '', 0, '', 0, '', 0, '', 'course selection updated', 1724825032, 'course'),
(50, 3, 3, 1, 'Jasi', 473365800, 1234567890, 1234567891, 'jasi@st.com', '3rd floor Moti Tower\r\nHebbal India', 'No Note', 3, 'Intermediate Commerce', 2022, 2024, 'Karnataka Board', 'Bangalore North', 'India', 1, 'IELTS', '', 1234567891, 'India', 631132200, 1735669800, 'Jasi', 'Paulraj', 0, '', 0, '', 0, '', 0, '', 'Academic Details Updated', 1724825092, 'highest_education_from_year,highest_education_to_year,test_name'),
(51, 21, 26, 1, 'Harshitha', 0, 9853332332, 0, 'harshitha@gmail.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Created By Admin', 1724825178, ''),
(52, 22, 42, 1, 'Janani', 0, 9756223356, 0, 'jananasprin@gmail.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Created By Admin', 1724825415, ''),
(53, 23, 50, 1, 'Jeni', 0, 9899886231, 0, 'jeni@gmail.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Created By Admin', 1724825469, ''),
(54, 23, 50, 1, 'Jeni', 0, 9899886231, 0, 'jeni@gmail.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Documents Uploaded By BS8', 1724825492, ''),
(55, 24, 74, 1, 'Karthik', 0, 7782146531, 0, 'Karthik@gmail.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Created By Admin', 1724825632, ''),
(56, 25, 69, 1, 'Kavana', 0, 7080901452, 0, 'kavana@gmail.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Created By Admin', 1724825689, ''),
(57, 26, 55, 1, 'Kiran', 0, 9080125656, 0, 'kiran@gmail.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Created By Admin', 1724825766, ''),
(58, 27, 82, 1, 'Kruthika', 0, 8814632545, 0, 'kruthika@gmail.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Created By Admin', 1724825865, ''),
(59, 27, 82, 1, 'Kruthika', 0, 8814632545, 0, 'kruthika@gmail.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Documents Uploaded By BS8', 1724825894, ''),
(60, 28, 90, 1, 'Leela', 0, 8810456328, 0, 'leela@gmail.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Created By Admin', 1724825953, ''),
(61, 29, 90, 1, 'Malathi', 0, 8932567234, 0, 'malathi@gmail.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Created By Admin', 1724826462, ''),
(62, 29, 90, 1, 'Malathi', 0, 8932567234, 0, 'malathi@gmail.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Documents Uploaded By BS8', 1724826482, ''),
(63, 6, 34, 15, 'Alshiya Ashok', 0, 9646355356, 0, 'Alshiyaashok@gmail.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Not Interested', 1724826597, 'status'),
(64, 6, 34, 12, 'Alshiya Ashok', 0, 9646355356, 0, 'Alshiyaashok@gmail.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'URN Deleted', 1724826808, 'status'),
(65, 30, 61, 1, 'Manohar', 0, 9970254637, 0, 'manohar@gmail.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Created By Admin', 1724827148, ''),
(66, 30, 61, 1, 'Manohar', 0, 9970254637, 0, 'manohar@gmail.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Documents Uploaded By BS8', 1724827165, ''),
(67, 31, 83, 1, 'Megha', 0, 9901035469, 0, 'megha@gmail.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Created By Admin', 1724827234, ''),
(68, 32, 68, 1, 'Mitesh', 0, 9972363332, 0, 'mitesh@gmail.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Created By Admin', 1724827276, ''),
(69, 23, 50, 2, 'Jeni', 0, 9899886231, 0, 'jeni@gmail.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1724827286, 'status'),
(70, 32, 68, 1, 'Mitesh', 0, 9972363332, 0, 'mitesh@gmail.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Documents Uploaded By BS8', 1724827287, ''),
(71, 33, 87, 1, 'Mugilraj', 0, 9859898565, 0, 'mugilraj@gmail.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Created By Admin', 1724827319, ''),
(72, 34, 35, 1, 'Naveen', 0, 9898653354, 0, 'naveen@gmail.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Created By Admin', 1724827361, ''),
(73, 34, 35, 1, 'Naveen', 0, 9898653354, 0, 'naveen@gmail.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Documents Uploaded By BS8', 1724827379, ''),
(74, 35, 49, 1, 'Nikitha', 0, 7896423566, 0, 'nikitha@gmail.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Created By Admin', 1724827415, ''),
(75, 35, 49, 1, 'Nikitha', 0, 7896423566, 0, 'nikitha@gmail.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Documents Uploaded By BS8', 1724827436, ''),
(76, 36, 52, 1, 'Parthiban', 0, 9444499276, 0, 'parthiban@gmail.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Created By Admin', 1724827496, ''),
(77, 36, 52, 1, 'Parthiban', 0, 9444499276, 0, 'parthiban@gmail.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Documents Uploaded By BS8', 1724827513, ''),
(78, 37, 4, 1, 'Ranjitha', 0, 9815363335, 0, 'ranjitha@gmail.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Created By Admin', 1724827557, ''),
(79, 37, 4, 1, 'Ranjitha', 0, 9815363335, 0, 'ranjitha@gmail.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Documents Uploaded By BS8', 1724827628, ''),
(80, 38, 14, 1, 'Pavithra', 0, 9663355332, 0, 'pavithra@gmail.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Created By Admin', 1724827652, ''),
(81, 39, 33, 1, 'Praveen', 0, 9916335544, 0, 'praveen@gmail.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Created By Admin', 1724827693, ''),
(82, 23, 50, 3, 'Jeni', 0, 9899886231, 0, 'jeni@gmail.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1724827743, 'status'),
(83, 40, 96, 1, 'Nishanth', 0, 8965633565, 0, 'nishanth@gmail.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Created By Admin', 1724827756, ''),
(84, 41, 36, 1, 'Priya', 0, 9815635463, 0, 'priya@gmail.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Created By Admin', 1724827797, ''),
(85, 32, 68, 15, 'Mitesh', 0, 9972363332, 0, 'mitesh@gmail.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Not Interested', 1724827848, 'status'),
(86, 32, 68, 12, 'Mitesh', 0, 9972363332, 0, 'mitesh@gmail.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'URN Deleted', 1724828103, 'status'),
(87, 38, 14, 1, 'Pavithra', 1086028200, 9663355332, 0, 'pavithra@gmail.com', '#1, 1st main, Henuru, Bangalore', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Basic details entered', 1724828294, 'student_dob,student_address'),
(88, 38, 14, 1, 'Pavithra', 1086028200, 9663355332, 0, 'pavithra@gmail.com', '#1, 1st main, Henuru, Bangalore', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Documents Uploaded By SP2', 1724828330, ''),
(89, 38, 14, 1, 'Pavithra', 1086028200, 9663355332, 0, 'pavithra@gmail.com', '#1, 1st main, Henuru, Bangalore', 'No Note', 2, 'LLB', 2021, 2023, 'Vijaya Pre University', 'Karnataka', 'India', 1, 'IELTS,GMAT', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Update Academic Details', 1724828425, 'highest_education_type,highest_education_name,highest_education_from_year,highest_education_to_year,highest_education_institution,highest_education_institution_city,highest_education_institution_country,test_taken_flag,test_name'),
(90, 38, 14, 1, 'Pavithra', 1086028200, 9663355332, 0, 'pavithra@gmail.com', '#1, 1st main, Henuru, Bangalore', 'No Note', 2, 'LLB', 2021, 2023, 'Vijaya Pre University', 'Karnataka', 'India', 1, 'IELTS,GMAT', '', 123456789, 'Bangalore', 1622485800, 1969641000, 'Pavithra', 'Vijay', 0, '', 0, '', 0, '', 0, '', 'Updated Passport details', 1724828624, 'passport_number,passport_place_of_issue,passport_holder_name,passport_holder_surname,passport_issued_on,passport_valid_till'),
(91, 37, 4, 1, 'Ranjitha', 916770600, 9815363335, 0, 'ranjitha@gmail.com', 'Bangalore', 'Doesnt have passport', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Interested', 1724828875, 'student_dob,student_brief_note,student_address'),
(92, 37, 4, 1, 'Ranjitha', 916770600, 9815363335, 0, 'ranjitha@gmail.com', 'Bangalore', 'Doesnt have passport', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Documents Uploaded By SP2', 1724828959, ''),
(93, 38, 14, 15, 'Pavithra', 1086028200, 9663355332, 0, 'pavithra@gmail.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Not Interested', 1724828969, 'status'),
(94, 37, 4, 1, 'Ranjitha', 916770600, 9815363335, 0, 'ranjitha@gmail.com', 'Bangalore', 'Doesnt have passport', 3, 'Plus Two', 2014, 2018, 'Vijaya Pre University', 'Karnataka', 'India', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'No', 1724829032, 'highest_education_type,highest_education_name,highest_education_from_year,highest_education_to_year,highest_education_institution,highest_education_institution_city,highest_education_institution_country'),
(95, 38, 14, 12, 'Pavithra', 1086028200, 9663355332, 0, 'pavithra@gmail.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'URN Deleted', 1724829100, 'status'),
(96, 31, 83, 1, 'Megha', 1137695400, 9901035469, 0, 'megha@gmail.com', 'Bangalore', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Interested', 1724830310, 'student_dob,student_address'),
(97, 31, 83, 1, 'Megha', 1137695400, 9901035469, 0, 'megha@gmail.com', 'Bangalore', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Documents Uploaded By SP2', 1724830343, ''),
(98, 31, 83, 1, 'Megha', 1137695400, 9901035469, 0, 'megha@gmail.com', 'Bangalore', 'No Note', 3, 'Plus Two', 2020, 2024, 'Vijaya Pre University', 'Karnataka', 'India', 1, 'IELTS', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Updated', 1724830396, 'highest_education_type,highest_education_name,highest_education_from_year,highest_education_to_year,highest_education_institution,highest_education_institution_city,highest_education_institution_country,test_taken_flag,test_name'),
(99, 31, 83, 1, 'Megha', 1137695400, 9901035469, 0, 'megha@gmail.com', 'Bangalore', 'No Note', 3, 'Plus Two', 2020, 2024, 'Vijaya Pre University', 'Karnataka', 'India', 1, 'IELTS', '', 2147483647, 'Bangalore', 1656613800, 2066841000, 'Megha', 'Akash', 0, '', 0, '', 0, '', 0, '', 'Updated', 1724830471, 'passport_number,passport_place_of_issue,passport_holder_name,passport_holder_surname,passport_issued_on,passport_valid_till'),
(100, 1, 2, 12, 'Rajiv', 0, 9876987612, 0, 'rajiv@st.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1724830532, 'status'),
(101, 2, 2, 15, 'Rajesh', 0, 9876987613, 0, 'rajesh@st.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Deletion Email Testing', 1724830593, 'status'),
(102, 2, 2, 12, 'Rajesh', 0, 9876987613, 0, 'rajesh@st.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'URN Deleted', 1724830632, 'status'),
(103, 4, 26, 12, 'Abhigail Stephen', 0, 9980642004, 0, 'abhigailstephen123@gmail.com', '', 'No Note', 3, 'Plus Two', 2019, 2021, 'Vijaya Pre University', 'Karnataka', 'India', 0, '', '', 123456789, 'Bangalore', 1357756200, 2147483647, 'Abhigail ', 'Stephen', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1724830753, 'status'),
(104, 22, 42, 1, 'Janani', 0, 9756223356, 0, 'jananasprin@gmail.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Documents Uploaded By SP2', 1724830860, ''),
(105, 22, 42, 1, 'Janani', 0, 9756223356, 0, 'jananasprin@gmail.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Documents Uploaded By SP2', 1724830867, ''),
(106, 22, 42, 1, 'Janani', 0, 9756223356, 0, 'jananasprin@gmail.com', '', 'No Note', 3, 'Plus Two', 2021, 2024, 'Vijaya Pre University', 'Karnataka', 'India', 1, 'IELTS', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Academic details updated', 1724830940, 'highest_education_type,highest_education_name,highest_education_from_year,highest_education_to_year,highest_education_institution,highest_education_institution_city,highest_education_institution_country,test_taken_flag,test_name'),
(107, 5, 53, 12, 'Adithya Sidharth', 0, 9863563555, 0, 'Adithya67@gamil.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1724830989, 'status'),
(108, 22, 42, 1, 'Janani', 0, 9756223356, 0, 'jananasprin@gmail.com', '', 'No Note', 3, 'Plus Two', 2021, 2024, 'Vijaya Pre University', 'Karnataka', 'India', 1, 'IELTS', '', 123456789, 'Bangalore', 1672511400, 2082738600, 'Janani', 'Asprin', 0, '', 0, '', 0, '', 0, '', 'Passport details updated', 1724831027, 'passport_number,passport_place_of_issue,passport_holder_name,passport_holder_surname,passport_issued_on,passport_valid_till'),
(109, 42, 4, 1, 'Thanshika', 0, 9363255645, 0, 'thanshika@gmail.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Created By Admin', 1724831048, ''),
(110, 42, 4, 15, 'Thanshika', 0, 9363255645, 0, 'thanshika@gmail.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Request Deletion', 1724831077, 'status'),
(111, 42, 4, 12, 'Thanshika', 0, 9363255645, 0, 'thanshika@gmail.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'URN Deleted', 1724831263, 'status'),
(112, 35, 49, 1, 'Nikitha', 0, 7896423566, 0, 'nikitha@gmail.com', '', 'No Note', 3, 'Plus Two', 2021, 2024, 'Vijaya Pre University', 'Karnataka', 'India', 1, 'IELTS', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Academic details updated', 1724831270, 'highest_education_type,highest_education_name,highest_education_from_year,highest_education_to_year,highest_education_institution,highest_education_institution_city,highest_education_institution_country,test_taken_flag,test_name'),
(113, 35, 49, 1, 'Nikitha', 0, 7896423566, 0, 'nikitha@gmail.com', '', 'No Note', 3, 'Plus Two', 2021, 2024, 'Vijaya Pre University', 'Karnataka', 'India', 1, 'IELTS', '', 1234568536, 'Bangalore', 1388514600, 1798741800, 'Nikitha', 'Venkatesh', 0, '', 0, '', 0, '', 0, '', 'Passport details updated', 1724831616, 'passport_number,passport_place_of_issue,passport_holder_name,passport_holder_surname,passport_issued_on,passport_valid_till'),
(114, 43, 8, 1, 'Srinidhi', 0, 8986555455, 0, 'srinidhi@gmail.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Created By Admin', 1724831683, ''),
(115, 43, 8, 15, 'Srinidhi', 0, 8986555455, 0, 'srinidhi@gmail.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Request Lead', 1724831702, 'status'),
(116, 44, 7, 1, 'sharath', 0, 7954654645, 0, 'sharath@gmail.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Created By Admin', 1724832048, ''),
(117, 44, 7, 15, 'sharath', 0, 7954654645, 0, 'sharath@gmail.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Student Not Interested', 1724832071, 'status'),
(118, 43, 8, 12, 'Srinidhi', 0, 8986555455, 0, 'srinidhi@gmail.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'approved on call verification', 1724832140, 'status'),
(119, 35, 49, 2, 'Nikitha', 0, 7896423566, 0, 'nikitha@gmail.com', '', 'No Note', 3, 'Plus Two', 2021, 2024, 'Vijaya Pre University', 'Karnataka', 'India', 1, 'IELTS', '', 1234568536, 'Bangalore', 1388514600, 1798741800, 'Nikitha', 'Venkatesh', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1724832181, 'status'),
(120, 35, 49, 3, 'Nikitha', 0, 7896423566, 0, 'nikitha@gmail.com', '', 'No Note', 3, 'Plus Two', 2021, 2024, 'Vijaya Pre University', 'Karnataka', 'India', 1, 'IELTS', '', 1234568536, 'Bangalore', 1388514600, 1798741800, 'Nikitha', 'Venkatesh', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1724832314, 'status'),
(121, 35, 49, 4, 'Nikitha', 0, 7896423566, 0, 'nikitha@gmail.com', '', 'No Note', 3, 'Plus Two', 2021, 2024, 'Vijaya Pre University', 'Karnataka', 'India', 1, 'IELTS', '', 1234568536, 'Bangalore', 1388514600, 1798741800, 'Nikitha', 'Venkatesh', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1724832384, 'status'),
(122, 35, 49, 5, 'Nikitha', 0, 7896423566, 0, 'nikitha@gmail.com', '', 'No Note', 3, 'Plus Two', 2021, 2024, 'Vijaya Pre University', 'Karnataka', 'India', 1, 'IELTS', '', 1234568536, 'Bangalore', 1388514600, 1798741800, 'Nikitha', 'Venkatesh', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1724832537, 'status'),
(123, 41, 36, 2, 'Priya', 0, 9815635463, 0, 'priya@gmail.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1724832927, 'status'),
(124, 41, 36, 2, 'Priya', 0, 9815635463, 0, 'priya@gmail.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Documents Uploaded By BS8', 1724833017, ''),
(125, 41, 36, 2, 'Priya', -19800, 9815635463, 123456789, 'priya@gmail.com', 'Hebbal', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Alt Mobile & Address Updated', 1724833017, 'student_mobile_alt,student_address'),
(126, 35, 49, 8, 'Nikitha', 0, 7896423566, 0, 'nikitha@gmail.com', '', 'No Note', 3, 'Plus Two', 2021, 2024, 'Vijaya Pre University', 'Karnataka', 'India', 1, 'IELTS', '', 1234568536, 'Bangalore', 1388514600, 1798741800, 'Nikitha', 'Venkatesh', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1724833292, 'status'),
(127, 35, 49, 9, 'Nikitha', 0, 7896423566, 0, 'nikitha@gmail.com', '', 'No Note', 3, 'Plus Two', 2021, 2024, 'Vijaya Pre University', 'Karnataka', 'India', 1, 'IELTS', '', 1234568536, 'Bangalore', 1388514600, 1798741800, 'Nikitha', 'Venkatesh', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1724833341, 'status'),
(128, 35, 49, 10, 'Nikitha', 0, 7896423566, 0, 'nikitha@gmail.com', '', 'No Note', 3, 'Plus Two', 2021, 2024, 'Vijaya Pre University', 'Karnataka', 'India', 1, 'IELTS', '', 1234568536, 'Bangalore', 1388514600, 1798741800, 'Nikitha', 'Venkatesh', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1724833507, 'status'),
(129, 35, 49, 11, 'Nikitha', 0, 7896423566, 0, 'nikitha@gmail.com', '', 'No Note', 3, 'Plus Two', 2021, 2024, 'Vijaya Pre University', 'Karnataka', 'India', 1, 'IELTS', '', 1234568536, 'Bangalore', 1388514600, 1798741800, 'Nikitha', 'Venkatesh', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1724833551, 'status'),
(130, 34, 35, 1, 'Naveen', 0, 9898653354, 0, 'naveen@gmail.com', '', 'No Note', 3, 'Plus Two', 2022, 2024, 'Christ pre University', 'Karnataka', 'India', 1, 'IELTS', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Academic details updated', 1724833987, 'highest_education_type,highest_education_name,highest_education_from_year,highest_education_to_year,highest_education_institution,highest_education_institution_city,highest_education_institution_country,test_taken_flag,test_name'),
(131, 34, 35, 1, 'Naveen', 0, 9898653354, 0, 'naveen@gmail.com', '', 'No Note', 3, 'Plus Two', 2022, 2024, 'Christ pre University', 'Karnataka', 'India', 1, 'IELTS', '', 2147483647, 'Bangalore', 1640975400, 1861900200, 'Naveen', 'Nayak', 0, '', 0, '', 0, '', 0, '', 'Passport details updated', 1724834105, 'passport_number,passport_place_of_issue,passport_holder_name,passport_holder_surname,passport_issued_on,passport_valid_till'),
(132, 34, 35, 2, 'Naveen', 0, 9898653354, 0, 'naveen@gmail.com', '', 'No Note', 3, 'Plus Two', 2022, 2024, 'Christ pre University', 'Karnataka', 'India', 1, 'IELTS', '', 2147483647, 'Bangalore', 1640975400, 1861900200, 'Naveen', 'Nayak', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1724834143, 'status'),
(133, 34, 35, 3, 'Naveen', 0, 9898653354, 0, 'naveen@gmail.com', '', 'No Note', 3, 'Plus Two', 2022, 2024, 'Christ pre University', 'Karnataka', 'India', 1, 'IELTS', '', 2147483647, 'Bangalore', 1640975400, 1861900200, 'Naveen', 'Nayak', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1724834186, 'status'),
(134, 41, 36, 2, 'Priya', -19800, 9815635463, 123456, 'priya@gmail.com', 'Hebbal', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Alt Mob & Address Added', 1724834324, 'student_mobile_alt,student_address'),
(135, 34, 35, 4, 'Naveen', 0, 9898653354, 0, 'naveen@gmail.com', '', 'No Note', 3, 'Plus Two', 2022, 2024, 'Christ pre University', 'Karnataka', 'India', 1, 'IELTS', '', 2147483647, 'Bangalore', 1640975400, 1861900200, 'Naveen', 'Nayak', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1724834623, 'status'),
(136, 14, 21, 2, 'Darshan', 0, 9972704287, 0, 'darshan@gmail.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1724834696, 'status'),
(137, 14, 21, 2, 'Darshan', 0, 9972704287, 0, 'darshan@gmail.com', '', 'No Note', 3, 'Plus Two', 2022, 2024, 'Christ pre University', 'Karnataka', 'India', 1, 'IELTS', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Academic update', 1724834843, 'highest_education_type,highest_education_name,highest_education_from_year,highest_education_to_year,highest_education_institution,highest_education_institution_city,highest_education_institution_country,test_taken_flag,test_name'),
(138, 41, 36, 2, 'Priya', -19800, 9815635463, 123456, 'priya@gmail.com', 'Hebbal', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Documents Uploaded By ST41', 1724835244, ''),
(139, 14, 21, 2, 'Darshan', 0, 9972704287, 0, 'darshan@gmail.com', '', 'No Note', 3, 'Plus Two', 2022, 2024, 'Christ pre University', 'Karnataka', 'India', 1, 'IELTS', '', 2147483647, 'Bangalore', 1546281000, 1893436200, 'Darshan', 'S', 0, '', 0, '', 0, '', 0, '', 'Passport details updated', 1724837179, 'passport_number,passport_place_of_issue,passport_holder_name,passport_holder_surname,passport_issued_on,passport_valid_till'),
(140, 34, 35, 5, 'Naveen', 0, 9898653354, 0, 'naveen@gmail.com', '', 'No Note', 3, 'Plus Two', 2022, 2024, 'Christ pre University', 'Karnataka', 'India', 1, 'IELTS', '', 2147483647, 'Bangalore', 1640975400, 1861900200, 'Naveen', 'Nayak', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1724837297, 'status'),
(141, 34, 35, 8, 'Naveen', 0, 9898653354, 0, 'naveen@gmail.com', '', 'No Note', 3, 'Plus Two', 2022, 2024, 'Christ pre University', 'Karnataka', 'India', 1, 'IELTS', '', 2147483647, 'Bangalore', 1640975400, 1861900200, 'Naveen', 'Nayak', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1724837331, 'status'),
(142, 34, 35, 9, 'Naveen', 0, 9898653354, 0, 'naveen@gmail.com', '', 'No Note', 3, 'Plus Two', 2022, 2024, 'Christ pre University', 'Karnataka', 'India', 1, 'IELTS', '', 2147483647, 'Bangalore', 1640975400, 1861900200, 'Naveen', 'Nayak', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1724837822, 'status'),
(143, 41, 36, 3, 'Priya', -19800, 9815635463, 123456, 'priya@gmail.com', 'Hebbal', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1724837907, 'status'),
(144, 41, 36, 4, 'Priya', -19800, 9815635463, 123456, 'priya@gmail.com', 'Hebbal', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1724837978, 'status'),
(145, 41, 36, 13, 'Priya', -19800, 9815635463, 123456, 'priya@gmail.com', 'Hebbal', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1724838135, 'status'),
(146, 23, 50, 12, 'Jeni', 0, 9899886231, 0, 'jeni@gmail.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1724838264, 'status'),
(147, 40, 96, 1, 'Nishanth', 0, 8965633565, 0, 'nishanth@gmail.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Documents Uploaded By BS8', 1724838473, ''),
(148, 40, 96, 1, 'Nishanth', 0, 8965633565, 0, 'nishanth@gmail.com', '', 'No Note', 3, 'Plus Two', 2021, 2024, 'Christ pre University', 'Karnataka', 'India', 1, 'IELTS', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Academic details updated', 1724839485, 'highest_education_type,highest_education_name,highest_education_from_year,highest_education_to_year,highest_education_institution,highest_education_institution_city,highest_education_institution_country,test_taken_flag,test_name'),
(149, 40, 96, 1, 'Nishanth', 0, 8965633565, 0, 'nishanth@gmail.com', '', 'No Note', 3, 'Plus Two', 2021, 2024, 'Christ pre University', 'Karnataka', 'India', 1, 'IELTS', '', 2147483647, 'Bangalore', 1642962600, 1877452200, 'Nishanth', 'A', 0, '', 0, '', 0, '', 0, '', 'Passport details updated', 1724839570, 'passport_number,passport_place_of_issue,passport_holder_name,passport_holder_surname,passport_issued_on,passport_valid_till'),
(150, 40, 96, 2, 'Nishanth', 0, 8965633565, 0, 'nishanth@gmail.com', '', 'No Note', 3, 'Plus Two', 2021, 2024, 'Christ pre University', 'Karnataka', 'India', 1, 'IELTS', '', 2147483647, 'Bangalore', 1642962600, 1877452200, 'Nishanth', 'A', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1724839627, 'status'),
(151, 40, 96, 3, 'Nishanth', 0, 8965633565, 0, 'nishanth@gmail.com', '', 'No Note', 3, 'Plus Two', 2021, 2024, 'Christ pre University', 'Karnataka', 'India', 1, 'IELTS', '', 2147483647, 'Bangalore', 1642962600, 1877452200, 'Nishanth', 'A', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1724839762, 'status'),
(152, 40, 96, 4, 'Nishanth', 0, 8965633565, 0, 'nishanth@gmail.com', '', 'No Note', 3, 'Plus Two', 2021, 2024, 'Christ pre University', 'Karnataka', 'India', 1, 'IELTS', '', 2147483647, 'Bangalore', 1642962600, 1877452200, 'Nishanth', 'A', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1724840751, 'status'),
(153, 27, 82, 1, 'Kruthika', 0, 8814632545, 0, 'kruthika@gmail.com', '', 'No Note', 3, 'Plus Two', 2021, 2024, 'Christ pre University', 'Karnataka', 'India', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Updated', 1724840848, 'highest_education_type,highest_education_name,highest_education_from_year,highest_education_to_year,highest_education_institution,highest_education_institution_city,highest_education_institution_country'),
(154, 27, 82, 1, 'Kruthika', 0, 8814632545, 0, 'kruthika@gmail.com', '', 'No Note', 3, 'Plus Two', 2021, 2024, 'Christ pre University', 'Karnataka', 'India', 0, '', '', 2147483647, 'Bangalore', 1441477800, 1915122600, 'Kruthika', 'Anand', 0, '', 0, '', 0, '', 0, '', 'Updated', 1724840928, 'passport_number,passport_place_of_issue,passport_holder_name,passport_holder_surname,passport_issued_on,passport_valid_till'),
(155, 27, 82, 2, 'Kruthika', 0, 8814632545, 0, 'kruthika@gmail.com', '', 'No Note', 3, 'Plus Two', 2021, 2024, 'Christ pre University', 'Karnataka', 'India', 0, '', '', 2147483647, 'Bangalore', 1441477800, 1915122600, 'Kruthika', 'Anand', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1724840961, 'status'),
(156, 27, 82, 3, 'Kruthika', 0, 8814632545, 0, 'kruthika@gmail.com', '', 'No Note', 3, 'Plus Two', 2021, 2024, 'Christ pre University', 'Karnataka', 'India', 0, '', '', 2147483647, 'Bangalore', 1441477800, 1915122600, 'Kruthika', 'Anand', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1724840991, 'status'),
(157, 27, 82, 4, 'Kruthika', 0, 8814632545, 0, 'kruthika@gmail.com', '', 'No Note', 3, 'Plus Two', 2021, 2024, 'Christ pre University', 'Karnataka', 'India', 0, '', '', 2147483647, 'Bangalore', 1441477800, 1915122600, 'Kruthika', 'Anand', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1724841025, 'status'),
(158, 27, 82, 5, 'Kruthika', 0, 8814632545, 0, 'kruthika@gmail.com', '', 'No Note', 3, 'Plus Two', 2021, 2024, 'Christ pre University', 'Karnataka', 'India', 0, '', '', 2147483647, 'Bangalore', 1441477800, 1915122600, 'Kruthika', 'Anand', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1724841055, 'status'),
(159, 30, 61, 1, 'Manohar', 0, 9970254637, 0, 'manohar@gmail.com', '', 'No Note', 3, 'Plus Two', 2020, 2024, 'Vijaya Pre University', 'Karnataka', 'India', 1, 'IELTS', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'updated', 1724841125, 'highest_education_type,highest_education_name,highest_education_from_year,highest_education_to_year,highest_education_institution,highest_education_institution_city,highest_education_institution_country,test_taken_flag,test_name'),
(160, 30, 61, 1, 'Manohar', 0, 9970254637, 0, 'manohar@gmail.com', '', 'No Note', 3, 'Plus Two', 2020, 2024, 'Vijaya Pre University', 'Karnataka', 'India', 1, 'IELTS', '', 65646546, 'Bangalore', 1687545000, 1976898600, 'Manohar', 's', 0, '', 0, '', 0, '', 0, '', 'Updated', 1724841200, 'passport_number,passport_place_of_issue,passport_holder_name,passport_holder_surname,passport_issued_on,passport_valid_till'),
(161, 39, 33, 1, 'Praveen', 0, 9916335544, 0, 'praveen@gmail.com', '', 'No Note', 3, 'Plus Two', 2022, 2024, 'Vijaya Pre University', 'Karnataka', 'India', 1, 'IELTS', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'updated', 1724841279, 'highest_education_type,highest_education_name,highest_education_from_year,highest_education_to_year,highest_education_institution,highest_education_institution_city,highest_education_institution_country,test_taken_flag,test_name'),
(162, 39, 33, 1, 'Praveen', 0, 9916335544, 0, 'praveen@gmail.com', '', 'No Note', 3, 'Plus Two', 2022, 2024, 'Vijaya Pre University', 'Karnataka', 'India', 1, 'IELTS', '', 2147483647, 'Bangalore', 1599676200, 1915209000, 'Praveen', 'Kumar', 0, '', 0, '', 0, '', 0, '', 'Updated', 1724841440, 'passport_number,passport_place_of_issue,passport_holder_name,passport_holder_surname,passport_issued_on,passport_valid_till'),
(163, 39, 33, 2, 'Praveen', 0, 9916335544, 0, 'praveen@gmail.com', '', 'No Note', 3, 'Plus Two', 2022, 2024, 'Vijaya Pre University', 'Karnataka', 'India', 1, 'IELTS', '', 2147483647, 'Bangalore', 1599676200, 1915209000, 'Praveen', 'Kumar', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1724841519, 'status'),
(164, 39, 33, 3, 'Praveen', 0, 9916335544, 0, 'praveen@gmail.com', '', 'No Note', 3, 'Plus Two', 2022, 2024, 'Vijaya Pre University', 'Karnataka', 'India', 1, 'IELTS', '', 2147483647, 'Bangalore', 1599676200, 1915209000, 'Praveen', 'Kumar', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1724841566, 'status'),
(165, 29, 90, 1, 'Malathi', 0, 8932567234, 0, 'malathi@gmail.com', '', 'No Note', 3, 'Plus Two', 2020, 2023, 'Christ pre University', 'Karnataka', 'India', 1, 'TOEFL', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Updated', 1724841809, 'highest_education_type,highest_education_name,highest_education_from_year,highest_education_to_year,highest_education_institution,highest_education_institution_city,highest_education_institution_country,test_taken_flag,test_name'),
(166, 29, 90, 1, 'Malathi', 0, 8932567234, 0, 'malathi@gmail.com', '', 'No Note', 3, 'Plus Two', 2020, 2023, 'Christ pre University', 'Karnataka', 'India', 1, 'TOEFL', '', 2147483647, 'Bangalore', 1237401000, 1773858600, 'Malathi', 'M', 0, '', 0, '', 0, '', 0, '', 'Updated', 1724841994, 'passport_number,passport_place_of_issue,passport_holder_name,passport_holder_surname,passport_issued_on,passport_valid_till'),
(167, 29, 90, 2, 'Malathi', 0, 8932567234, 0, 'malathi@gmail.com', '', 'No Note', 3, 'Plus Two', 2020, 2023, 'Christ pre University', 'Karnataka', 'India', 1, 'TOEFL', '', 2147483647, 'Bangalore', 1237401000, 1773858600, 'Malathi', 'M', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1724842067, 'status'),
(168, 29, 90, 3, 'Malathi', 0, 8932567234, 0, 'malathi@gmail.com', '', 'No Note', 3, 'Plus Two', 2020, 2023, 'Christ pre University', 'Karnataka', 'India', 1, 'TOEFL', '', 2147483647, 'Bangalore', 1237401000, 1773858600, 'Malathi', 'M', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1724842102, 'status'),
(169, 29, 90, 4, 'Malathi', 0, 8932567234, 0, 'malathi@gmail.com', '', 'No Note', 3, 'Plus Two', 2020, 2023, 'Christ pre University', 'Karnataka', 'India', 1, 'TOEFL', '', 2147483647, 'Bangalore', 1237401000, 1773858600, 'Malathi', 'M', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1724842191, 'status'),
(170, 25, 69, 1, 'Kavana', 0, 7080901452, 0, 'kavana@gmail.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Documents Uploaded By BS8', 1724842252, ''),
(171, 25, 69, 1, 'Kavana', 0, 7080901452, 0, 'kavana@gmail.com', '', 'No Note', 2, 'Bsc data Science', 2021, 2024, 'Christ pre University', 'Karnataka', 'India', 1, 'IELTS', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Academic details updated', 1724842343, 'highest_education_type,highest_education_name,highest_education_from_year,highest_education_to_year,highest_education_institution,highest_education_institution_city,highest_education_institution_country,test_taken_flag,test_name'),
(172, 25, 69, 1, 'Kavana', 0, 7080901452, 0, 'kavana@gmail.com', '', 'No Note', 2, 'Bsc data Science', 2021, 2024, 'Christ pre University', 'Karnataka', 'India', 1, 'IELTS', '', 2147483647, 'Bangalore', 1642185000, 1957717800, 'Kavana', 'M', 0, '', 0, '', 0, '', 0, '', 'Information Updated', 1724842408, 'passport_number,passport_place_of_issue,passport_holder_name,passport_holder_surname,passport_issued_on,passport_valid_till'),
(173, 25, 69, 2, 'Kavana', 0, 7080901452, 0, 'kavana@gmail.com', '', 'No Note', 2, 'Bsc data Science', 2021, 2024, 'Christ pre University', 'Karnataka', 'India', 1, 'IELTS', '', 2147483647, 'Bangalore', 1642185000, 1957717800, 'Kavana', 'M', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1724842447, 'status'),
(174, 40, 96, 5, 'Nishanth', 0, 8965633565, 0, 'nishanth@gmail.com', '', 'No Note', 3, 'Plus Two', 2021, 2024, 'Christ pre University', 'Karnataka', 'India', 1, 'IELTS', '', 2147483647, 'Bangalore', 1642962600, 1877452200, 'Nishanth', 'A', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1724842483, 'status'),
(175, 27, 82, 8, 'Kruthika', 0, 8814632545, 0, 'kruthika@gmail.com', '', 'No Note', 3, 'Plus Two', 2021, 2024, 'Christ pre University', 'Karnataka', 'India', 0, '', '', 2147483647, 'Bangalore', 1441477800, 1915122600, 'Kruthika', 'Anand', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1724842512, 'status');
INSERT INTO `urn_audit_history` (`id`, `lead_id`, `course_id`, `status_id`, `student_name`, `student_dob`, `student_mobile`, `student_mobile_alt`, `student_email`, `student_address`, `student_brief_note`, `highest_education_type`, `highest_education_name`, `highest_education_from_year`, `highest_education_to_year`, `highest_education_institution`, `highest_education_institution_city`, `highest_education_institution_country`, `test_taken_flag`, `test_name`, `other_test_name`, `passport_number`, `passport_place_of_issue`, `passport_issued_on`, `passport_valid_till`, `passport_holder_name`, `passport_holder_surname`, `immigration_applied`, `immigration_detail`, `past_visa_refusal_status`, `past_visa_refusal_detail`, `serious_medical_status`, `medical_condition_detail`, `criminal_offence_status`, `criminal_offence_detail`, `updation_remark`, `datentime`, `updated_columns`) VALUES
(176, 45, 3, 1, 'Rajkumar', 0, 9871234564, 0, 'rajkumar@st.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Created By Portal Visitor', 1724842536, ''),
(177, 45, 3, 1, 'Rajkumar', 0, 9871234564, 0, 'rajkumar@st.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Documents Uploaded by Portal Visitor', 1724842563, ''),
(178, 27, 82, 14, 'Kruthika', 0, 8814632545, 0, 'kruthika@gmail.com', '', 'No Note', 3, 'Plus Two', 2021, 2024, 'Christ pre University', 'Karnataka', 'India', 0, '', '', 2147483647, 'Bangalore', 1441477800, 1915122600, 'Kruthika', 'Anand', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1724842587, 'status'),
(179, 40, 96, 8, 'Nishanth', 0, 8965633565, 0, 'nishanth@gmail.com', '', 'No Note', 3, 'Plus Two', 2021, 2024, 'Christ pre University', 'Karnataka', 'India', 1, 'IELTS', '', 2147483647, 'Bangalore', 1642962600, 1877452200, 'Nishanth', 'A', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1724843523, 'status'),
(180, 29, 90, 5, 'Malathi', 0, 8932567234, 0, 'malathi@gmail.com', '', 'No Note', 3, 'Plus Two', 2020, 2023, 'Christ pre University', 'Karnataka', 'India', 1, 'TOEFL', '', 2147483647, 'Bangalore', 1237401000, 1773858600, 'Malathi', 'M', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1724843560, 'status'),
(181, 39, 33, 4, 'Praveen', 0, 9916335544, 0, 'praveen@gmail.com', '', 'No Note', 3, 'Plus Two', 2022, 2024, 'Vijaya Pre University', 'Karnataka', 'India', 1, 'IELTS', '', 2147483647, 'Bangalore', 1599676200, 1915209000, 'Praveen', 'Kumar', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1724843607, 'status'),
(182, 39, 33, 5, 'Praveen', 0, 9916335544, 0, 'praveen@gmail.com', '', 'No Note', 3, 'Plus Two', 2022, 2024, 'Vijaya Pre University', 'Karnataka', 'India', 1, 'IELTS', '', 2147483647, 'Bangalore', 1599676200, 1915209000, 'Praveen', 'Kumar', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1724843659, 'status'),
(183, 25, 69, 3, 'Kavana', 0, 7080901452, 0, 'kavana@gmail.com', '', 'No Note', 2, 'Bsc data Science', 2021, 2024, 'Christ pre University', 'Karnataka', 'India', 1, 'IELTS', '', 2147483647, 'Bangalore', 1642185000, 1957717800, 'Kavana', 'M', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1724843717, 'status'),
(184, 25, 69, 4, 'Kavana', 0, 7080901452, 0, 'kavana@gmail.com', '', 'No Note', 2, 'Bsc data Science', 2021, 2024, 'Christ pre University', 'Karnataka', 'India', 1, 'IELTS', '', 2147483647, 'Bangalore', 1642185000, 1957717800, 'Kavana', 'M', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1724843749, 'status'),
(185, 14, 21, 3, 'Darshan', 0, 9972704287, 0, 'darshan@gmail.com', '', 'No Note', 3, 'Plus Two', 2022, 2024, 'Christ pre University', 'Karnataka', 'India', 1, 'IELTS', '', 2147483647, 'Bangalore', 1546281000, 1893436200, 'Darshan', 'S', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1724843797, 'status'),
(186, 26, 55, 1, 'Kiran', 0, 9080125656, 0, 'kiran@gmail.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Documents Uploaded By BS8', 1724843873, ''),
(187, 26, 55, 1, 'Kiran', 0, 9080125656, 0, 'kiran@gmail.com', '', 'No Note', 3, 'Plus Two', 2021, 2024, 'Vijaya Pre University', 'Karnataka', 'India', 1, 'IELTS', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Academic details updated', 1724844058, 'highest_education_type,highest_education_name,highest_education_from_year,highest_education_to_year,highest_education_institution,highest_education_institution_city,highest_education_institution_country,test_taken_flag,test_name'),
(188, 26, 55, 1, 'Kiran', 0, 9080125656, 0, 'kiran@gmail.com', '', 'No Note', 3, 'Plus Two', 2021, 2024, 'Vijaya Pre University', 'Karnataka', 'India', 1, 'IELTS', '', 2147483647, 'Bangalore', 1328034600, 1769884200, 'Kiran', 'K', 0, '', 0, '', 0, '', 0, '', 'Other details updated', 1724844159, 'passport_number,passport_place_of_issue,passport_holder_name,passport_holder_surname,passport_issued_on,passport_valid_till'),
(189, 26, 55, 2, 'Kiran', 0, 9080125656, 0, 'kiran@gmail.com', '', 'No Note', 3, 'Plus Two', 2021, 2024, 'Vijaya Pre University', 'Karnataka', 'India', 1, 'IELTS', '', 2147483647, 'Bangalore', 1328034600, 1769884200, 'Kiran', 'K', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1724844311, 'status'),
(190, 29, 90, 8, 'Malathi', 0, 8932567234, 0, 'malathi@gmail.com', '', 'No Note', 3, 'Plus Two', 2020, 2023, 'Christ pre University', 'Karnataka', 'India', 1, 'TOEFL', '', 2147483647, 'Bangalore', 1237401000, 1773858600, 'Malathi', 'M', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1724844350, 'status'),
(191, 29, 90, 9, 'Malathi', 0, 8932567234, 0, 'malathi@gmail.com', '', 'No Note', 3, 'Plus Two', 2020, 2023, 'Christ pre University', 'Karnataka', 'India', 1, 'TOEFL', '', 2147483647, 'Bangalore', 1237401000, 1773858600, 'Malathi', 'M', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1724844383, 'status'),
(192, 34, 35, 10, 'Naveen', 0, 9898653354, 0, 'naveen@gmail.com', '', 'No Note', 3, 'Plus Two', 2022, 2024, 'Christ pre University', 'Karnataka', 'India', 1, 'IELTS', '', 2147483647, 'Bangalore', 1640975400, 1861900200, 'Naveen', 'Nayak', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1724844416, 'status'),
(193, 33, 87, 1, 'Mugilraj', 0, 9859898565, 0, 'mugilraj@gmail.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Documents Uploaded By BS8', 1724846513, ''),
(194, 33, 87, 1, 'Mugilraj', 0, 9859898565, 0, 'mugilraj@gmail.com', '', 'No Note', 3, 'Plus Two', 2020, 2024, 'Christ pre University', 'Karnataka', 'India', 1, 'IELTS', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Academic details ', 1724846616, 'highest_education_type,highest_education_name,highest_education_from_year,highest_education_to_year,highest_education_institution,highest_education_institution_city,highest_education_institution_country,test_taken_flag,test_name'),
(195, 33, 87, 1, 'Mugilraj', 0, 9859898565, 0, 'mugilraj@gmail.com', '', 'No Note', 3, 'Plus Two', 2020, 2024, 'Christ pre University', 'Karnataka', 'India', 1, 'IELTS', '', 2147483647, 'Bangalore', 1579458600, 1895077800, 'Mugilraj', 'H', 0, '', 0, '', 0, '', 0, '', 'Passport ', 1724846725, 'passport_number,passport_place_of_issue,passport_holder_name,passport_holder_surname,passport_issued_on,passport_valid_till'),
(196, 33, 87, 2, 'Mugilraj', 0, 9859898565, 0, 'mugilraj@gmail.com', '', 'No Note', 3, 'Plus Two', 2020, 2024, 'Christ pre University', 'Karnataka', 'India', 1, 'IELTS', '', 2147483647, 'Bangalore', 1579458600, 1895077800, 'Mugilraj', 'H', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1724846785, 'status'),
(197, 33, 87, 3, 'Mugilraj', 0, 9859898565, 0, 'mugilraj@gmail.com', '', 'No Note', 3, 'Plus Two', 2020, 2024, 'Christ pre University', 'Karnataka', 'India', 1, 'IELTS', '', 2147483647, 'Bangalore', 1579458600, 1895077800, 'Mugilraj', 'H', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1724846859, 'status'),
(198, 0, 0, 0, '', 0, 0, 0, '', '', '', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Documents Uploaded by Portal Visitor', 1724888055, ''),
(199, 45, 3, 1, 'Rajkumar', 0, 9871234564, 0, 'rajkumar@st.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Documents Uploaded By BS2', 1725695255, ''),
(200, 45, 3, 2, 'Rajkumar', 0, 9871234564, 0, 'rajkumar@st.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1725695363, 'status'),
(201, 45, 3, 3, 'Rajkumar', 0, 9871234564, 0, 'rajkumar@st.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1725695393, 'status'),
(202, 45, 3, 4, 'Rajkumar', 0, 9871234564, 0, 'rajkumar@st.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1725695430, 'status'),
(203, 45, 3, 4, 'Rajkumar', 0, 9871234564, 0, 'rajkumar@st.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1725695441, 'status'),
(204, 45, 3, 5, 'Rajkumar', 0, 9871234564, 0, 'rajkumar@st.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1725697085, 'status'),
(205, 45, 3, 8, 'Rajkumar', 0, 9871234564, 0, 'rajkumar@st.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1725697120, 'status'),
(206, 45, 3, 9, 'Rajkumar', 0, 9871234564, 0, 'rajkumar@st.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1725697161, 'status'),
(207, 45, 3, 10, 'Rajkumar', 0, 9871234564, 0, 'rajkumar@st.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1725697188, 'status'),
(208, 45, 3, 11, 'Rajkumar', 0, 9871234564, 0, 'rajkumar@st.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1725697222, 'status'),
(209, 37, 16, 1, 'Ranjitha', 916770600, 9815363335, 0, 'ranjitha@gmail.com', 'Bangalore', 'Doesnt have passport', 3, 'Plus Two', 2014, 2018, 'Vijaya Pre University', 'Karnataka', 'India', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'course selection updated', 1726033892, 'course'),
(210, 37, 16, 1, 'Ranjitha', 916770600, 9815363335, 0, 'ranjitha@gmail.com', 'Bangalore', 'Doesnt have passport', 3, 'Plus Two', 2014, 2018, 'Vijaya Pre University', 'Karnataka', 'India', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Change of university', 1726033925, ''),
(211, 37, 16, 2, 'Ranjitha', 916770600, 9815363335, 0, 'ranjitha@gmail.com', 'Bangalore', 'Doesnt have passport', 3, 'Plus Two', 2014, 2018, 'Vijaya Pre University', 'Karnataka', 'India', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1726034067, 'status'),
(212, 37, 16, 3, 'Ranjitha', 916770600, 9815363335, 0, 'ranjitha@gmail.com', 'Bangalore', 'Doesnt have passport', 3, 'Plus Two', 2014, 2018, 'Vijaya Pre University', 'Karnataka', 'India', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1726034110, 'status'),
(213, 37, 16, 4, 'Ranjitha', 916770600, 9815363335, 0, 'ranjitha@gmail.com', 'Bangalore', 'Doesnt have passport', 3, 'Plus Two', 2014, 2018, 'Vijaya Pre University', 'Karnataka', 'India', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1726034144, 'status'),
(214, 36, 52, 2, 'Parthiban', 0, 9444499276, 0, 'parthiban@gmail.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1726115418, 'status'),
(215, 36, 52, 3, 'Parthiban', 0, 9444499276, 0, 'parthiban@gmail.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1726115470, 'status'),
(216, 36, 52, 3, 'Parthiban', 0, 9444499276, 0, 'parthiban@gmail.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Documents Uploaded By BS2', 1726115554, ''),
(217, 46, 4, 1, 'Raj', 0, 9988665533, 0, 'raj@st.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Created By Admin', 1726120932, ''),
(218, 46, 4, 1, 'Raj', 0, 9988665533, 0, 'raj@st.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Documents Uploaded By BS2', 1726120981, ''),
(219, 46, 4, 1, 'Raj', 0, 9988665533, 0, 'raj@st.com', '', 'No Note', 1, 'MBA', 2000, 2002, 'Bangalore University', 'bngalore', 'India', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Academic details Added', 1726121116, 'highest_education_type,highest_education_name,highest_education_from_year,highest_education_to_year,highest_education_institution,highest_education_institution_city,highest_education_institution_country'),
(220, 46, 4, 1, 'Raj', 0, 9988665533, 0, 'raj@st.com', '', 'No Note', 1, 'MBA', 2000, 2002, 'Bangalore University', 'bngalore', 'India', 0, '', '', 123456, 'India', 946665000, 1735669800, 'Raj', 'NA', 0, '', 0, '', 0, '', 0, '', 'Passport Details added', 1726121221, 'passport_number,passport_place_of_issue,passport_holder_name,passport_holder_surname,passport_issued_on,passport_valid_till'),
(221, 46, 4, 1, 'Raj', 631132200, 9988665533, 1234567890, 'raj@st.com', 'Hebbal', 'No Note', 1, 'MBA', 2000, 2002, 'Bangalore University', 'bngalore', 'India', 0, '', '', 123456, 'India', 946665000, 1735669800, 'Raj', 'NA', 0, '', 0, '', 0, '', 0, '', 'Profile Detail Updated', 1726121322, 'student_dob,student_mobile_alt,student_address'),
(222, 46, 4, 2, 'Raj', 631132200, 9988665533, 1234567890, 'raj@st.com', 'Hebbal', 'No Note', 1, 'MBA', 2000, 2002, 'Bangalore University', 'bngalore', 'India', 0, '', '', 123456, 'India', 946665000, 1735669800, 'Raj', 'NA', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1726121717, 'status'),
(223, 46, 4, 3, 'Raj', 631132200, 9988665533, 1234567890, 'raj@st.com', 'Hebbal', 'No Note', 1, 'MBA', 2000, 2002, 'Bangalore University', 'bngalore', 'India', 0, '', '', 123456, 'India', 946665000, 1735669800, 'Raj', 'NA', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1726121749, 'status'),
(224, 46, 4, 4, 'Raj', 631132200, 9988665533, 1234567890, 'raj@st.com', 'Hebbal', 'No Note', 1, 'MBA', 2000, 2002, 'Bangalore University', 'bngalore', 'India', 0, '', '', 123456, 'India', 946665000, 1735669800, 'Raj', 'NA', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1726121898, 'status'),
(225, 46, 4, 5, 'Raj', 631132200, 9988665533, 1234567890, 'raj@st.com', 'Hebbal', 'No Note', 1, 'MBA', 2000, 2002, 'Bangalore University', 'bngalore', 'India', 0, '', '', 123456, 'India', 946665000, 1735669800, 'Raj', 'NA', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1726121986, 'status'),
(226, 46, 4, 8, 'Raj', 631132200, 9988665533, 1234567890, 'raj@st.com', 'Hebbal', 'No Note', 1, 'MBA', 2000, 2002, 'Bangalore University', 'bngalore', 'India', 0, '', '', 123456, 'India', 946665000, 1735669800, 'Raj', 'NA', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1726122176, 'status'),
(227, 46, 4, 9, 'Raj', 631132200, 9988665533, 1234567890, 'raj@st.com', 'Hebbal', 'No Note', 1, 'MBA', 2000, 2002, 'Bangalore University', 'bngalore', 'India', 0, '', '', 123456, 'India', 946665000, 1735669800, 'Raj', 'NA', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1726122199, 'status'),
(228, 46, 4, 10, 'Raj', 631132200, 9988665533, 1234567890, 'raj@st.com', 'Hebbal', 'No Note', 1, 'MBA', 2000, 2002, 'Bangalore University', 'bngalore', 'India', 0, '', '', 123456, 'India', 946665000, 1735669800, 'Raj', 'NA', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1726122221, 'status'),
(229, 46, 4, 11, 'Raj', 631132200, 9988665533, 1234567890, 'raj@st.com', 'Hebbal', 'No Note', 1, 'MBA', 2000, 2002, 'Bangalore University', 'bngalore', 'India', 0, '', '', 123456, 'India', 946665000, 1735669800, 'Raj', 'NA', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1726122246, 'status'),
(230, 47, 13, 1, 'Rajiv', 0, 9977558822, 0, 'rajiv1@st.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Created By Admin', 1726122537, ''),
(231, 47, 13, 1, 'Rajiv', 0, 9977558822, 0, 'rajiv1@st.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Documents Uploaded By BS2', 1726123205, ''),
(232, 47, 13, 2, 'Rajiv', 0, 9977558822, 0, 'rajiv1@st.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1726123424, 'status'),
(233, 47, 13, 3, 'Rajiv', 0, 9977558822, 0, 'rajiv1@st.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1726123460, 'status'),
(234, 47, 13, 3, 'Rajiv', 0, 9977558822, 0, 'rajiv1@st.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Documents Uploaded By BS2', 1726123500, ''),
(235, 47, 13, 3, 'Rajiv', 0, 9977558822, 0, 'rajiv1@st.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Documents Uploaded By BS2', 1726123529, ''),
(236, 0, 0, 0, '', 0, 0, 0, '', '', '', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Documents Uploaded by Portal Visitor', 1726257691, ''),
(237, 0, 0, 0, '', 0, 0, 0, '', '', '', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Documents Uploaded by Portal Visitor', 1727903909, ''),
(238, 48, 39, 1, 'Shubhanand', 0, 9876541230, 0, 'shubh@st.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Created By Portal Visitor', 1728013468, ''),
(239, 48, 39, 1, 'Shubhanand', 0, 9876541230, 0, 'shubh@st.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Documents Uploaded by Portal Visitor', 1728013507, ''),
(240, 47, 13, 3, 'Rajiv', 0, 9977558822, 0, 'rajiv1@st.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Documents Uploaded By BS2', 1728015176, ''),
(241, 47, 13, 3, 'Rajiv', 915129000, 9977558822, 9977558822, 'rajiv1@st.com', 'Chennai India', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Alt Mobile, DOB & Address Updated', 1728015286, 'student_dob,student_mobile_alt,student_address'),
(242, 47, 13, 3, 'Rajiv', 915129000, 9977558822, 9977558822, 'rajiv1@st.com', 'Chennai India', 'No Note', 3, 'Intermediate', 2021, 2023, 'Karnataka Board', 'Bengalore', 'India', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Academic Details Added', 1728015407, 'highest_education_type,highest_education_name,highest_education_from_year,highest_education_to_year,highest_education_institution,highest_education_institution_city,highest_education_institution_country'),
(243, 47, 13, 3, 'Rajiv', 915129000, 9977558822, 9977558822, 'rajiv1@st.com', 'Chennai India', 'No Note', 3, 'Intermediate', 2021, 2023, 'Karnataka Board', 'Bengalore', 'India', 0, '', '', 98658, 'India', 946665000, 1735669800, 'Rajiv', 'NA', 0, '', 0, '', 0, '', 0, '', 'Passport Details Added', 1728015501, 'passport_number,passport_place_of_issue,passport_holder_name,passport_holder_surname,passport_issued_on,passport_valid_till'),
(244, 47, 13, 4, 'Rajiv', 915129000, 9977558822, 9977558822, 'rajiv1@st.com', 'Chennai India', 'No Note', 3, 'Intermediate', 2021, 2023, 'Karnataka Board', 'Bengalore', 'India', 0, '', '', 98658, 'India', 946665000, 1735669800, 'Rajiv', 'NA', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1728015715, 'status'),
(245, 47, 13, 5, 'Rajiv', 915129000, 9977558822, 9977558822, 'rajiv1@st.com', 'Chennai India', 'No Note', 3, 'Intermediate', 2021, 2023, 'Karnataka Board', 'Bengalore', 'India', 0, '', '', 98658, 'India', 946665000, 1735669800, 'Rajiv', 'NA', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1728015779, 'status'),
(246, 47, 13, 8, 'Rajiv', 915129000, 9977558822, 9977558822, 'rajiv1@st.com', 'Chennai India', 'No Note', 3, 'Intermediate', 2021, 2023, 'Karnataka Board', 'Bengalore', 'India', 0, '', '', 98658, 'India', 946665000, 1735669800, 'Rajiv', 'NA', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1728015810, 'status'),
(247, 47, 13, 9, 'Rajiv', 915129000, 9977558822, 9977558822, 'rajiv1@st.com', 'Chennai India', 'No Note', 3, 'Intermediate', 2021, 2023, 'Karnataka Board', 'Bengalore', 'India', 0, '', '', 98658, 'India', 946665000, 1735669800, 'Rajiv', 'NA', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1728015847, 'status'),
(248, 47, 13, 10, 'Rajiv', 915129000, 9977558822, 9977558822, 'rajiv1@st.com', 'Chennai India', 'No Note', 3, 'Intermediate', 2021, 2023, 'Karnataka Board', 'Bengalore', 'India', 0, '', '', 98658, 'India', 946665000, 1735669800, 'Rajiv', 'NA', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1728015909, 'status'),
(249, 47, 13, 11, 'Rajiv', 915129000, 9977558822, 9977558822, 'rajiv1@st.com', 'Chennai India', 'No Note', 3, 'Intermediate', 2021, 2023, 'Karnataka Board', 'Bengalore', 'India', 0, '', '', 98658, 'India', 946665000, 1735669800, 'Rajiv', 'NA', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1728015980, 'status'),
(250, 34, 35, 11, 'Naveen', 0, 9898653354, 0, 'naveen@gmail.com', '', 'No Note', 3, 'Plus Two', 2022, 2024, 'Christ pre University', 'Karnataka', 'India', 1, 'IELTS', '', 2147483647, 'Bangalore', 1640975400, 1861900200, 'Naveen', 'Nayak', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1728017509, 'status'),
(251, 29, 90, 10, 'Malathi', 0, 8932567234, 0, 'malathi@gmail.com', '', 'No Note', 3, 'Plus Two', 2020, 2023, 'Christ pre University', 'Karnataka', 'India', 1, 'TOEFL', '', 2147483647, 'Bangalore', 1237401000, 1773858600, 'Malathi', 'M', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1728017564, 'status'),
(252, 29, 90, 11, 'Malathi', 0, 8932567234, 0, 'malathi@gmail.com', '', 'No Note', 3, 'Plus Two', 2020, 2023, 'Christ pre University', 'Karnataka', 'India', 1, 'TOEFL', '', 2147483647, 'Bangalore', 1237401000, 1773858600, 'Malathi', 'M', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1728017594, 'status'),
(253, 40, 96, 9, 'Nishanth', 0, 8965633565, 0, 'nishanth@gmail.com', '', 'No Note', 3, 'Plus Two', 2021, 2024, 'Christ pre University', 'Karnataka', 'India', 1, 'IELTS', '', 2147483647, 'Bangalore', 1642962600, 1877452200, 'Nishanth', 'A', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1728017676, 'status'),
(254, 40, 96, 10, 'Nishanth', 0, 8965633565, 0, 'nishanth@gmail.com', '', 'No Note', 3, 'Plus Two', 2021, 2024, 'Christ pre University', 'Karnataka', 'India', 1, 'IELTS', '', 2147483647, 'Bangalore', 1642962600, 1877452200, 'Nishanth', 'A', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1728017712, 'status'),
(255, 40, 96, 11, 'Nishanth', 0, 8965633565, 0, 'nishanth@gmail.com', '', 'No Note', 3, 'Plus Two', 2021, 2024, 'Christ pre University', 'Karnataka', 'India', 1, 'IELTS', '', 2147483647, 'Bangalore', 1642962600, 1877452200, 'Nishanth', 'A', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1728017742, 'status'),
(256, 39, 33, 8, 'Praveen', 0, 9916335544, 0, 'praveen@gmail.com', '', 'No Note', 3, 'Plus Two', 2022, 2024, 'Vijaya Pre University', 'Karnataka', 'India', 1, 'IELTS', '', 2147483647, 'Bangalore', 1599676200, 1915209000, 'Praveen', 'Kumar', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1728018757, 'status'),
(257, 39, 33, 9, 'Praveen', 0, 9916335544, 0, 'praveen@gmail.com', '', 'No Note', 3, 'Plus Two', 2022, 2024, 'Vijaya Pre University', 'Karnataka', 'India', 1, 'IELTS', '', 2147483647, 'Bangalore', 1599676200, 1915209000, 'Praveen', 'Kumar', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1728018841, 'status'),
(258, 39, 33, 10, 'Praveen', 0, 9916335544, 0, 'praveen@gmail.com', '', 'No Note', 3, 'Plus Two', 2022, 2024, 'Vijaya Pre University', 'Karnataka', 'India', 1, 'IELTS', '', 2147483647, 'Bangalore', 1599676200, 1915209000, 'Praveen', 'Kumar', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1728018881, 'status'),
(259, 39, 33, 11, 'Praveen', 0, 9916335544, 0, 'praveen@gmail.com', '', 'No Note', 3, 'Plus Two', 2022, 2024, 'Vijaya Pre University', 'Karnataka', 'India', 1, 'IELTS', '', 2147483647, 'Bangalore', 1599676200, 1915209000, 'Praveen', 'Kumar', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1728018924, 'status'),
(260, 25, 69, 5, 'Kavana', 0, 7080901452, 0, 'kavana@gmail.com', '', 'No Note', 2, 'Bsc data Science', 2021, 2024, 'Christ pre University', 'Karnataka', 'India', 1, 'IELTS', '', 2147483647, 'Bangalore', 1642185000, 1957717800, 'Kavana', 'M', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1728019008, 'status'),
(261, 25, 69, 8, 'Kavana', 0, 7080901452, 0, 'kavana@gmail.com', '', 'No Note', 2, 'Bsc data Science', 2021, 2024, 'Christ pre University', 'Karnataka', 'India', 1, 'IELTS', '', 2147483647, 'Bangalore', 1642185000, 1957717800, 'Kavana', 'M', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1728019032, 'status'),
(262, 25, 69, 9, 'Kavana', 0, 7080901452, 0, 'kavana@gmail.com', '', 'No Note', 2, 'Bsc data Science', 2021, 2024, 'Christ pre University', 'Karnataka', 'India', 1, 'IELTS', '', 2147483647, 'Bangalore', 1642185000, 1957717800, 'Kavana', 'M', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1728019057, 'status'),
(263, 25, 69, 10, 'Kavana', 0, 7080901452, 0, 'kavana@gmail.com', '', 'No Note', 2, 'Bsc data Science', 2021, 2024, 'Christ pre University', 'Karnataka', 'India', 1, 'IELTS', '', 2147483647, 'Bangalore', 1642185000, 1957717800, 'Kavana', 'M', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1728019089, 'status'),
(264, 25, 69, 11, 'Kavana', 0, 7080901452, 0, 'kavana@gmail.com', '', 'No Note', 2, 'Bsc data Science', 2021, 2024, 'Christ pre University', 'Karnataka', 'India', 1, 'IELTS', '', 2147483647, 'Bangalore', 1642185000, 1957717800, 'Kavana', 'M', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1728019110, 'status'),
(265, 37, 16, 5, 'Ranjitha', 916770600, 9815363335, 0, 'ranjitha@gmail.com', 'Bangalore', 'Doesnt have passport', 3, 'Plus Two', 2014, 2018, 'Vijaya Pre University', 'Karnataka', 'India', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1728019216, 'status'),
(266, 37, 16, 8, 'Ranjitha', 916770600, 9815363335, 0, 'ranjitha@gmail.com', 'Bangalore', 'Doesnt have passport', 3, 'Plus Two', 2014, 2018, 'Vijaya Pre University', 'Karnataka', 'India', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1728019245, 'status'),
(267, 37, 16, 9, 'Ranjitha', 916770600, 9815363335, 0, 'ranjitha@gmail.com', 'Bangalore', 'Doesnt have passport', 3, 'Plus Two', 2014, 2018, 'Vijaya Pre University', 'Karnataka', 'India', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1728019265, 'status'),
(268, 37, 16, 10, 'Ranjitha', 916770600, 9815363335, 0, 'ranjitha@gmail.com', 'Bangalore', 'Doesnt have passport', 3, 'Plus Two', 2014, 2018, 'Vijaya Pre University', 'Karnataka', 'India', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1728019288, 'status'),
(269, 37, 16, 11, 'Ranjitha', 916770600, 9815363335, 0, 'ranjitha@gmail.com', 'Bangalore', 'Doesnt have passport', 3, 'Plus Two', 2014, 2018, 'Vijaya Pre University', 'Karnataka', 'India', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1728019317, 'status'),
(270, 14, 16, 3, 'Darshan', 0, 9972704287, 0, 'darshan@gmail.com', '', 'No Note', 3, 'Plus Two', 2022, 2024, 'Christ pre University', 'Karnataka', 'India', 1, 'IELTS', '', 2147483647, 'Bangalore', 1546281000, 1893436200, 'Darshan', 'S', 0, '', 0, '', 0, '', 0, '', 'course selection updated', 1728019519, 'course'),
(271, 14, 16, 4, 'Darshan', 0, 9972704287, 0, 'darshan@gmail.com', '', 'No Note', 3, 'Plus Two', 2022, 2024, 'Christ pre University', 'Karnataka', 'India', 1, 'IELTS', '', 2147483647, 'Bangalore', 1546281000, 1893436200, 'Darshan', 'S', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1728019587, 'status'),
(272, 14, 16, 5, 'Darshan', 0, 9972704287, 0, 'darshan@gmail.com', '', 'No Note', 3, 'Plus Two', 2022, 2024, 'Christ pre University', 'Karnataka', 'India', 1, 'IELTS', '', 2147483647, 'Bangalore', 1546281000, 1893436200, 'Darshan', 'S', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1728019614, 'status'),
(273, 14, 16, 8, 'Darshan', 0, 9972704287, 0, 'darshan@gmail.com', '', 'No Note', 3, 'Plus Two', 2022, 2024, 'Christ pre University', 'Karnataka', 'India', 1, 'IELTS', '', 2147483647, 'Bangalore', 1546281000, 1893436200, 'Darshan', 'S', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1728019657, 'status'),
(274, 14, 16, 9, 'Darshan', 0, 9972704287, 0, 'darshan@gmail.com', '', 'No Note', 3, 'Plus Two', 2022, 2024, 'Christ pre University', 'Karnataka', 'India', 1, 'IELTS', '', 2147483647, 'Bangalore', 1546281000, 1893436200, 'Darshan', 'S', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1728019698, 'status'),
(275, 14, 16, 10, 'Darshan', 0, 9972704287, 0, 'darshan@gmail.com', '', 'No Note', 3, 'Plus Two', 2022, 2024, 'Christ pre University', 'Karnataka', 'India', 1, 'IELTS', '', 2147483647, 'Bangalore', 1546281000, 1893436200, 'Darshan', 'S', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1728019724, 'status'),
(276, 14, 16, 11, 'Darshan', 0, 9972704287, 0, 'darshan@gmail.com', '', 'No Note', 3, 'Plus Two', 2022, 2024, 'Christ pre University', 'Karnataka', 'India', 1, 'IELTS', '', 2147483647, 'Bangalore', 1546281000, 1893436200, 'Darshan', 'S', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1728019761, 'status'),
(277, 33, 87, 3, 'Mugilraj', 946665000, 9859898565, 0, 'mugilraj@gmail.com', 'Hebbal Bengalore', 'No Note', 3, 'Plus Two', 2020, 2024, 'Christ pre University', 'Karnataka', 'India', 1, 'IELTS', '', 2147483647, 'Bangalore', 1579458600, 1895077800, 'Mugilraj', 'H', 0, '', 0, '', 0, '', 0, '', 'Address & DOB Updated', 1728023054, 'student_dob,student_address'),
(278, 33, 87, 4, 'Mugilraj', 946665000, 9859898565, 0, 'mugilraj@gmail.com', 'Hebbal Bengalore', 'No Note', 3, 'Plus Two', 2020, 2024, 'Christ pre University', 'Karnataka', 'India', 1, 'IELTS', '', 2147483647, 'Bangalore', 1579458600, 1895077800, 'Mugilraj', 'H', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1728023243, 'status'),
(279, 33, 87, 5, 'Mugilraj', 946665000, 9859898565, 0, 'mugilraj@gmail.com', 'Hebbal Bengalore', 'No Note', 3, 'Plus Two', 2020, 2024, 'Christ pre University', 'Karnataka', 'India', 1, 'IELTS', '', 2147483647, 'Bangalore', 1579458600, 1895077800, 'Mugilraj', 'H', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1728023277, 'status'),
(280, 33, 87, 8, 'Mugilraj', 946665000, 9859898565, 0, 'mugilraj@gmail.com', 'Hebbal Bengalore', 'No Note', 3, 'Plus Two', 2020, 2024, 'Christ pre University', 'Karnataka', 'India', 1, 'IELTS', '', 2147483647, 'Bangalore', 1579458600, 1895077800, 'Mugilraj', 'H', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1728023327, 'status'),
(281, 33, 87, 9, 'Mugilraj', 946665000, 9859898565, 0, 'mugilraj@gmail.com', 'Hebbal Bengalore', 'No Note', 3, 'Plus Two', 2020, 2024, 'Christ pre University', 'Karnataka', 'India', 1, 'IELTS', '', 2147483647, 'Bangalore', 1579458600, 1895077800, 'Mugilraj', 'H', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1728023350, 'status'),
(282, 33, 87, 10, 'Mugilraj', 946665000, 9859898565, 0, 'mugilraj@gmail.com', 'Hebbal Bengalore', 'No Note', 3, 'Plus Two', 2020, 2024, 'Christ pre University', 'Karnataka', 'India', 1, 'IELTS', '', 2147483647, 'Bangalore', 1579458600, 1895077800, 'Mugilraj', 'H', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1728023375, 'status'),
(283, 33, 87, 11, 'Mugilraj', 946665000, 9859898565, 0, 'mugilraj@gmail.com', 'Hebbal Bengalore', 'No Note', 3, 'Plus Two', 2020, 2024, 'Christ pre University', 'Karnataka', 'India', 1, 'IELTS', '', 2147483647, 'Bangalore', 1579458600, 1895077800, 'Mugilraj', 'H', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1728023543, 'status'),
(284, 36, 52, 3, 'Parthiban', 915129000, 9444499276, 0, 'parthiban@gmail.com', 'Hebbal', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'DOB & Address Updated', 1728024615, 'student_dob,student_address'),
(285, 36, 52, 3, 'Parthiban', 915129000, 9444499276, 0, 'parthiban@gmail.com', 'Hebbal', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Documents Uploaded By BS2', 1728024767, ''),
(286, 36, 52, 4, 'Parthiban', 915129000, 9444499276, 0, 'parthiban@gmail.com', 'Hebbal', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1728024796, 'status'),
(287, 36, 52, 5, 'Parthiban', 915129000, 9444499276, 0, 'parthiban@gmail.com', 'Hebbal', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1728024822, 'status'),
(288, 36, 52, 8, 'Parthiban', 915129000, 9444499276, 0, 'parthiban@gmail.com', 'Hebbal', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1728024911, 'status'),
(289, 36, 52, 9, 'Parthiban', 915129000, 9444499276, 0, 'parthiban@gmail.com', 'Hebbal', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1728024939, 'status'),
(290, 36, 52, 10, 'Parthiban', 915129000, 9444499276, 0, 'parthiban@gmail.com', 'Hebbal', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1728025007, 'status'),
(291, 36, 52, 11, 'Parthiban', 915129000, 9444499276, 0, 'parthiban@gmail.com', 'Hebbal', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1728025030, 'status'),
(292, 26, 55, 2, 'Kiran', 1009823400, 9080125656, 9080125656, 'kiran@gmail.com', 'Hebbal Bangalore', 'No Note', 3, 'Plus Two', 2021, 2024, 'Vijaya Pre University', 'Karnataka', 'India', 1, 'IELTS', '', 2147483647, 'Bangalore', 1328034600, 1769884200, 'Kiran', 'K', 0, '', 0, '', 0, '', 0, '', 'Alt Mob, DOB & Address Updated', 1728045240, 'student_dob,student_mobile_alt,student_address'),
(293, 26, 55, 3, 'Kiran', 1009823400, 9080125656, 9080125656, 'kiran@gmail.com', 'Hebbal Bangalore', 'No Note', 3, 'Plus Two', 2021, 2024, 'Vijaya Pre University', 'Karnataka', 'India', 1, 'IELTS', '', 2147483647, 'Bangalore', 1328034600, 1769884200, 'Kiran', 'K', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1728045265, 'status'),
(294, 26, 55, 3, 'Kiran', 1009823400, 9080125656, 9080125656, 'kiran@gmail.com', 'Hebbal Bangalore', 'No Note', 3, 'Plus Two', 2021, 2024, 'Vijaya Pre University', 'Karnataka', 'India', 1, 'IELTS', '', 2147483647, 'Bangalore', 1328034600, 1769884200, 'Kiran', 'K', 0, '', 0, '', 0, '', 0, '', 'Documents Uploaded By SP3', 1728103125, ''),
(295, 26, 55, 3, 'Kiran', 1009823400, 9080125656, 9080125656, 'kiran@gmail.com', 'Hebbal Bangalore', 'No Note', 3, 'Plus Two', 2021, 2024, 'Vijaya Pre University', 'Karnataka', 'India', 1, 'IELTS', '', 2147483647, 'Bangalore', 1328034600, 1769884200, 'Kiran', 'K', 0, '', 0, '', 0, '', 0, '', 'Documents Uploaded By SP3', 1728103149, ''),
(296, 49, 8, 1, 'Sathvik', 0, 7898965456, 0, 'sathvik@gmail.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Created By Admin', 1728103933, ''),
(297, 50, 40, 1, 'Richard', 0, 9635533355, 0, 'Richard@gmail.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Created By Admin', 1728103985, ''),
(298, 51, 13, 1, 'Shiju Trillion', 0, 70070070, 0, 'shijuGBP@GBP.Com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Created By Admin', 1728106575, ''),
(299, 51, 13, 1, 'Shiju Trillion', 978287400, 70070070, 0, 'shijuGBP@GBP.Com', 'Reserve bank of India - Delhi', 'Shiju was very keen to join Kings. he is a British natinal ksdjfbhsdfhdkdcnksdjfbdui', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Spoken to shiju and he has asked for few days to consider', 1728106693, 'student_dob,student_brief_note,student_address'),
(300, 51, 13, 1, 'Shiju Trillion', 978287400, 7025847457, 0, 'shijuGBP@GBP.Com', 'Reserve bank of India - Delhi', 'Shiju was very keen to join Kings. he is a British natinal ksdjfbhsdfhdkdcnksdjfbdui', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Spoke to shiju and got his private and main number.', 1728106815, 'student_mobile_primary'),
(301, 51, 13, 1, 'Shiju Trillion', 978287400, 7025847457, 0, 'shijuGBP@GBP.Com', 'Reserve bank of India - Delhi', 'Shiju was very keen to join Kings. he is a British natinal ksdjfbhsdfhdkdcnksdjfbdui', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Documents Uploaded By BS2', 1728107431, ''),
(302, 51, 13, 1, 'Shiju Trillion', 978287400, 7025847457, 0, 'shijuGBP@GBP.Com', 'Reserve bank of India - Delhi', 'Shiju was very keen to join Kings. he is a British natinal ksdjfbhsdfhdkdcnksdjfbdui', 2, 'bsc sciene', 2020, 2023, 'Uni of Kerala', 'Cochin', 'india', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'bsc maths', 1728107595, 'highest_education_type,highest_education_name,highest_education_from_year,highest_education_to_year,highest_education_institution,highest_education_institution_city,highest_education_institution_country'),
(303, 51, 13, 2, 'Shiju Trillion', 978287400, 7025847457, 0, 'shijuGBP@GBP.Com', 'Reserve bank of India - Delhi', 'Shiju was very keen to join Kings. he is a British natinal ksdjfbhsdfhdkdcnksdjfbdui', 2, 'bsc sciene', 2020, 2023, 'Uni of Kerala', 'Cochin', 'india', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1728107777, 'status'),
(304, 51, 13, 2, 'Shiju Trillion', 978287400, 7025847457, 0, 'shijuGBP@GBP.Com', 'Reserve bank of India - Delhi', 'Shiju was very keen to join Kings. he is a British natinal ksdjfbhsdfhdkdcnksdjfbdui', 2, 'bsc sciene', 2020, 2023, 'Uni of Kerala', 'Cochin', 'india', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Documents Uploaded By BS2', 1728107878, ''),
(305, 51, 13, 3, 'Shiju Trillion', 978287400, 7025847457, 0, 'shijuGBP@GBP.Com', 'Reserve bank of India - Delhi', 'Shiju was very keen to join Kings. he is a British natinal ksdjfbhsdfhdkdcnksdjfbdui', 2, 'bsc sciene', 2020, 2023, 'Uni of Kerala', 'Cochin', 'india', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1728107922, 'status'),
(306, 51, 13, 4, 'Shiju Trillion', 978287400, 7025847457, 0, 'shijuGBP@GBP.Com', 'Reserve bank of India - Delhi', 'Shiju was very keen to join Kings. he is a British natinal ksdjfbhsdfhdkdcnksdjfbdui', 2, 'bsc sciene', 2020, 2023, 'Uni of Kerala', 'Cochin', 'india', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1728108089, 'status'),
(307, 51, 13, 5, 'Shiju Trillion', 978287400, 7025847457, 0, 'shijuGBP@GBP.Com', 'Reserve bank of India - Delhi', 'Shiju was very keen to join Kings. he is a British natinal ksdjfbhsdfhdkdcnksdjfbdui', 2, 'bsc sciene', 2020, 2023, 'Uni of Kerala', 'Cochin', 'india', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1728108182, 'status'),
(308, 52, 79, 1, 'asdasdsa', 0, 9223372036854775807, 0, 'sddsfsd@f.c', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Created By Portal Visitor', 1729598964, ''),
(309, 53, 1, 1, 'Nimil Philip', 0, 7994970111, 0, 'nimilphilipzoo@gmail.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Created By Admin', 1729599044, ''),
(310, 53, 1, 2, 'Nimil Philip', 0, 7994970111, 0, 'nimilphilipzoo@gmail.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1729599153, 'status'),
(311, 53, 1, 2, 'Nimil Philip', 0, 7994970111, 0, 'nimilphilipzoo@gmail.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1729599170, 'status'),
(312, 54, 2, 1, 'test', 0, 9072430726, 0, 'nimilphilip@gmail.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Created By Admin', 1729708638, ''),
(313, 55, 2, 1, 'test', 0, 9072430726, 0, 'nimilphilip@gmail.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Created By Admin', 1729708640, ''),
(314, 55, 2, 2, 'test', 0, 9072430726, 0, 'nimilphilip@gmail.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1729708695, 'status'),
(315, 55, 2, 2, 'test', 0, 9072430726, 0, 'nimilphilip@gmail.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1729708712, 'status'),
(316, 56, 2, 1, 'Nimil Philip', 0, 7994970111, 0, 'nimilphilipzoo@gmail.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Created By Student', 1729850787, ''),
(317, 55, 2, 3, 'test', 0, 9072430726, 0, 'nimilphilip@gmail.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1731566608, 'status'),
(318, 52, 79, 2, 'asdasdsa', 0, 9223372036854775807, 0, 'sddsfsd@f.c', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'Status Updated', 1731733931, 'status'),
(319, 54, 2, 15, 'test', 0, 9072430726, 0, 'nimilphilip@gmail.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'request to delete', 1731734337, 'status'),
(320, 54, 2, 12, 'test', 0, 9072430726, 0, 'nimilphilip@gmail.com', '', 'No Note', 0, '', 0, 0, '', '', '', 0, '', '', 0, '', 0, 0, '', '', 0, '', 0, '', 0, '', 0, '', 'approve testin', 1731734409, 'status');

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
) ENGINE=MyISAM AUTO_INCREMENT=172 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `urn_document_upload_history`
--

INSERT INTO `urn_document_upload_history` (`id`, `lead_id`, `urn`, `file_name`, `datentime`, `upload_by`, `is_deleted`, `deleted_by`, `deletion_datentime`, `deletion_remark`) VALUES
(1, 3, 361439, 'student_photo_1724820661.jpg', 1724820661, 'BS2', 0, '', 0, ''),
(2, 3, 361439, '10th_makrksheet_1724820661.pdf', 1724820661, 'BS2', 0, '', 0, ''),
(3, 3, 361439, 'academic/highest_education_proof_1724822014.pdf', 1724822014, 'BS2', 0, '', 0, ''),
(4, 3, 361439, 'academic/IELTS_proof_1724822014.jpg', 1724822014, 'BS2', 0, '', 0, ''),
(5, 4, 655074, 'student_photo_1724822352.jpg', 1724822352, 'BS2', 0, '', 0, ''),
(6, 4, 655074, '10th_makrksheet_1724822352.jpg', 1724822352, 'BS2', 0, '', 0, ''),
(7, 4, 655074, '10th_certificate_1724822352.jpg', 1724822352, 'BS2', 0, '', 0, ''),
(8, 4, 655074, 'student_photo_1724822366.jpg', 1724822366, 'BS2', 0, '', 0, ''),
(9, 4, 655074, '10th_makrksheet_1724822366.jpg', 1724822366, 'BS2', 0, '', 0, ''),
(10, 4, 655074, '10th_certificate_1724822366.jpg', 1724822366, 'BS2', 0, '', 0, ''),
(11, 3, 361439, 'academic/passport_1724822514.pdf', 1724822514, 'BS2', 0, '', 0, ''),
(12, 4, 655074, 'academic/highest_education_proof_1724822575.jpg', 1724822575, 'BS2', 0, '', 0, ''),
(13, 4, 655074, 'academic/passport_1724822840.jpg', 1724822840, 'BS2', 0, '', 0, ''),
(14, 5, 792686, 'student_photo_1724823349.jpg', 1724823349, 'BS8', 0, '', 0, ''),
(15, 5, 792686, '10th_makrksheet_1724823349.jpg', 1724823349, 'BS8', 0, '', 0, ''),
(16, 5, 792686, '10th_certificate_1724823349.jpg', 1724823349, 'BS8', 0, '', 0, ''),
(17, 6, 101896, 'student_photo_1724823459.jpg', 1724823459, 'BS8', 0, '', 0, ''),
(18, 6, 101896, '10th_makrksheet_1724823459.jpg', 1724823459, 'BS8', 0, '', 0, ''),
(19, 6, 101896, '10th_certificate_1724823459.jpg', 1724823459, 'BS8', 0, '', 0, ''),
(20, 7, 131828, 'student_photo_1724823563.jpg', 1724823563, 'BS8', 0, '', 0, ''),
(21, 7, 131828, '10th_makrksheet_1724823563.jpg', 1724823563, 'BS8', 0, '', 0, ''),
(22, 7, 131828, '10th_certificate_1724823563.jpg', 1724823563, 'BS8', 0, '', 0, ''),
(23, 8, 943645, 'student_photo_1724823810.jpg', 1724823810, 'BS8', 0, '', 0, ''),
(24, 8, 943645, '10th_makrksheet_1724823810.jpg', 1724823810, 'BS8', 0, '', 0, ''),
(25, 8, 943645, '10th_certificate_1724823810.jpg', 1724823810, 'BS8', 0, '', 0, ''),
(26, 9, 582916, 'student_photo_1724823886.jpg', 1724823886, 'BS8', 0, '', 0, ''),
(27, 9, 582916, '10th_makrksheet_1724823886.jpg', 1724823886, 'BS8', 0, '', 0, ''),
(28, 9, 582916, '10th_certificate_1724823886.jpg', 1724823886, 'BS8', 0, '', 0, ''),
(29, 10, 365110, 'student_photo_1724823944.jpg', 1724823944, 'BS8', 0, '', 0, ''),
(30, 10, 365110, '10th_makrksheet_1724823944.jpg', 1724823944, 'BS8', 0, '', 0, ''),
(31, 10, 365110, '10th_certificate_1724823944.jpg', 1724823944, 'BS8', 0, '', 0, ''),
(32, 3, 361439, 'highest_education_proof_1724824051.pdf', 1724824051, 'SA2', 0, '', 0, ''),
(33, 12, 448541, 'student_photo_1724824094.jpg', 1724824094, 'BS8', 0, '', 0, ''),
(34, 12, 448541, '10th_makrksheet_1724824094.jpg', 1724824094, 'BS8', 0, '', 0, ''),
(35, 13, 516072, 'student_photo_1724824169.jpg', 1724824169, 'BS8', 0, '', 0, ''),
(36, 13, 516072, '10th_makrksheet_1724824169.jpg', 1724824169, 'BS8', 0, '', 0, ''),
(37, 13, 516072, '10th_certificate_1724824169.jpg', 1724824169, 'BS8', 0, '', 0, ''),
(38, 14, 742352, 'student_photo_1724824262.jpg', 1724824262, 'BS8', 0, '', 0, ''),
(39, 14, 742352, '10th_makrksheet_1724824262.jpg', 1724824262, 'BS8', 0, '', 0, ''),
(40, 14, 742352, '10th_certificate_1724824262.jpg', 1724824262, 'BS8', 0, '', 0, ''),
(41, 15, 834547, 'student_photo_1724824353.jpg', 1724824353, 'BS8', 0, '', 0, ''),
(42, 15, 834547, '10th_makrksheet_1724824353.jpg', 1724824353, 'BS8', 0, '', 0, ''),
(43, 15, 834547, '10th_certificate_1724824353.jpg', 1724824353, 'BS8', 0, '', 0, ''),
(44, 18, 884026, 'student_photo_1724824800.jpg', 1724824800, 'BS8', 0, '', 0, ''),
(45, 18, 884026, '10th_makrksheet_1724824800.jpg', 1724824800, 'BS8', 0, '', 0, ''),
(46, 18, 884026, 'sop_1724824800.jpg', 1724824800, 'BS8', 0, '', 0, ''),
(47, 23, 751713, 'student_photo_1724825492.jpg', 1724825492, 'BS8', 0, '', 0, ''),
(48, 23, 751713, '10th_makrksheet_1724825492.jpg', 1724825492, 'BS8', 0, '', 0, ''),
(49, 23, 751713, '10th_certificate_1724825492.jpg', 1724825492, 'BS8', 0, '', 0, ''),
(50, 27, 440067, 'student_photo_1724825894.jpg', 1724825894, 'BS8', 0, '', 0, ''),
(51, 27, 440067, '10th_makrksheet_1724825894.jpg', 1724825894, 'BS8', 0, '', 0, ''),
(52, 27, 440067, '10th_certificate_1724825894.jpg', 1724825894, 'BS8', 0, '', 0, ''),
(53, 29, 390400, 'student_photo_1724826482.jpg', 1724826482, 'BS8', 0, '', 0, ''),
(54, 29, 390400, '10th_makrksheet_1724826482.jpg', 1724826482, 'BS8', 0, '', 0, ''),
(55, 29, 390400, '10th_certificate_1724826482.jpg', 1724826482, 'BS8', 0, '', 0, ''),
(56, 30, 202114, 'student_photo_1724827165.jpg', 1724827165, 'BS8', 0, '', 0, ''),
(57, 30, 202114, '10th_makrksheet_1724827165.jpg', 1724827165, 'BS8', 0, '', 0, ''),
(58, 30, 202114, '10th_certificate_1724827165.jpg', 1724827165, 'BS8', 0, '', 0, ''),
(59, 32, 968293, 'student_photo_1724827287.jpg', 1724827287, 'BS8', 0, '', 0, ''),
(60, 34, 714621, 'student_photo_1724827379.jpg', 1724827379, 'BS8', 0, '', 0, ''),
(61, 34, 714621, '10th_makrksheet_1724827379.jpg', 1724827379, 'BS8', 0, '', 0, ''),
(62, 34, 714621, '10th_certificate_1724827379.jpg', 1724827379, 'BS8', 0, '', 0, ''),
(63, 35, 569799, 'student_photo_1724827436.jpg', 1724827436, 'BS8', 0, '', 0, ''),
(64, 35, 569799, '10th_makrksheet_1724827436.jpg', 1724827436, 'BS8', 0, '', 0, ''),
(65, 35, 569799, '10th_certificate_1724827436.jpg', 1724827436, 'BS8', 0, '', 0, ''),
(66, 36, 507414, 'student_photo_1724827513.jpg', 1724827513, 'BS8', 0, '', 0, ''),
(67, 36, 507414, '10th_makrksheet_1724827513.jpg', 1724827513, 'BS8', 0, '', 0, ''),
(68, 37, 480905, 'student_photo_1724827628.jpg', 1724827628, 'BS8', 0, '', 0, ''),
(69, 38, 873227, 'student_photo_1724828330.jpg', 1724828330, 'SP2', 0, '', 0, ''),
(70, 38, 873227, '10th_makrksheet_1724828330.jpg', 1724828330, 'SP2', 0, '', 0, ''),
(71, 38, 873227, '10th_certificate_1724828330.jpg', 1724828330, 'SP2', 0, '', 0, ''),
(72, 38, 873227, 'academic/highest_education_proof_1724828425.jpg', 1724828425, 'SP2', 0, '', 0, ''),
(73, 38, 873227, 'academic/IELTS_proof_1724828425.jfif', 1724828425, 'SP2', 0, '', 0, ''),
(74, 38, 873227, 'academic/GMAT_proof_1724828425.jfif', 1724828425, 'SP2', 0, '', 0, ''),
(75, 38, 873227, 'academic/passport_1724828624.jpg', 1724828624, 'SP2', 0, '', 0, ''),
(76, 37, 480905, 'student_photo_1724828959.jpg', 1724828959, 'SP2', 0, '', 0, ''),
(77, 37, 480905, '10th_makrksheet_1724828959.jpg', 1724828959, 'SP2', 0, '', 0, ''),
(78, 37, 480905, '10th_certificate_1724828959.jpg', 1724828959, 'SP2', 0, '', 0, ''),
(79, 31, 356393, 'student_photo_1724830342.jpg', 1724830342, 'SP2', 0, '', 0, ''),
(80, 31, 356393, '10th_makrksheet_1724830342.jpg', 1724830343, 'SP2', 0, '', 0, ''),
(81, 31, 356393, '10th_certificate_1724830342.jpg', 1724830343, 'SP2', 0, '', 0, ''),
(82, 31, 356393, 'academic/highest_education_proof_1724830396.jpg', 1724830396, 'SP2', 0, '', 0, ''),
(83, 31, 356393, 'academic/IELTS_proof_1724830396.jfif', 1724830396, 'SP2', 0, '', 0, ''),
(84, 31, 356393, 'academic/passport_1724830471.jpg', 1724830471, 'SP2', 0, '', 0, ''),
(85, 22, 520169, 'student_photo_1724830860.jpg', 1724830860, 'SP2', 0, '', 0, ''),
(86, 22, 520169, '10th_makrksheet_1724830860.jpg', 1724830860, 'SP2', 0, '', 0, ''),
(87, 22, 520169, 'student_photo_1724830867.jpg', 1724830867, 'SP2', 0, '', 0, ''),
(88, 22, 520169, '10th_makrksheet_1724830867.jpg', 1724830867, 'SP2', 0, '', 0, ''),
(89, 22, 520169, '10th_certificate_1724830867.jpg', 1724830867, 'SP2', 0, '', 0, ''),
(90, 22, 520169, 'academic/highest_education_proof_1724830940.jpg', 1724830940, 'SP2', 0, '', 0, ''),
(91, 22, 520169, 'academic/IELTS_proof_1724830940.jfif', 1724830940, 'SP2', 0, '', 0, ''),
(92, 22, 520169, 'academic/passport_1724831027.jpg', 1724831027, 'SP2', 0, '', 0, ''),
(93, 35, 569799, 'academic/highest_education_proof_1724831270.jpg', 1724831270, 'BS8', 0, '', 0, ''),
(94, 35, 569799, 'academic/IELTS_proof_1724831270.jfif', 1724831270, 'BS8', 0, '', 0, ''),
(95, 35, 569799, 'academic/passport_1724831616.jpg', 1724831616, 'BS8', 0, '', 0, ''),
(96, 41, 635769, 'student_photo_1724833017.jpg', 1724833017, 'BS8', 0, '', 0, ''),
(97, 41, 635769, '10th_makrksheet_1724833017.jpg', 1724833017, 'BS8', 0, '', 0, ''),
(98, 34, 714621, 'academic/highest_education_proof_1724833987.jpg', 1724833987, 'BS8', 0, '', 0, ''),
(99, 34, 714621, 'academic/IELTS_proof_1724833987.jpg', 1724833987, 'BS8', 0, '', 0, ''),
(100, 34, 714621, 'academic/passport_1724834105.jpg', 1724834105, 'BS8', 0, '', 0, ''),
(101, 14, 742352, 'academic/highest_education_proof_1724834843.jpg', 1724834843, 'BS8', 0, '', 0, ''),
(102, 14, 742352, 'academic/IELTS_proof_1724834843.jfif', 1724834843, 'BS8', 0, '', 0, ''),
(103, 41, 635769, 'student_photo_1724835244.jpg', 1724835244, 'ST41', 0, '', 0, ''),
(104, 14, 742352, 'academic/passport_1724837179.jpg', 1724837179, 'BS8', 0, '', 0, ''),
(105, 40, 184732, 'student_photo_1724838473.jpg', 1724838473, 'BS8', 0, '', 0, ''),
(106, 40, 184732, '10th_certificate_1724838473.jpg', 1724838473, 'BS8', 0, '', 0, ''),
(107, 40, 184732, 'lor_1724838473.jpg', 1724838473, 'BS8', 0, '', 0, ''),
(108, 40, 184732, 'academic/highest_education_proof_1724839485.jpg', 1724839485, 'BS8', 0, '', 0, ''),
(109, 40, 184732, 'academic/IELTS_proof_1724839485.jfif', 1724839485, 'BS8', 0, '', 0, ''),
(110, 40, 184732, 'academic/passport_1724839570.jpg', 1724839570, 'BS8', 0, '', 0, ''),
(111, 27, 440067, 'academic/highest_education_proof_1724840848.jpg', 1724840848, 'BS8', 0, '', 0, ''),
(112, 27, 440067, 'academic/passport_1724840928.jpg', 1724840928, 'BS8', 0, '', 0, ''),
(113, 30, 202114, 'academic/highest_education_proof_1724841125.jpg', 1724841125, 'BS8', 1, 'BS2', 1731734547, 'wrong document uploaded'),
(114, 30, 202114, 'academic/IELTS_proof_1724841125.jfif', 1724841125, 'BS8', 0, '', 0, ''),
(115, 30, 202114, 'academic/passport_1724841200.jpg', 1724841200, 'BS8', 0, '', 0, ''),
(116, 39, 463188, 'academic/highest_education_proof_1724841279.jpg', 1724841279, 'BS8', 0, '', 0, ''),
(117, 39, 463188, 'academic/IELTS_proof_1724841279.jfif', 1724841279, 'BS8', 0, '', 0, ''),
(118, 39, 463188, 'academic/passport_1724841440.jpg', 1724841440, 'BS8', 0, '', 0, ''),
(119, 29, 390400, 'academic/highest_education_proof_1724841809.jpg', 1724841809, 'BS8', 0, '', 0, ''),
(120, 29, 390400, 'academic/TOEFL_proof_1724841809.jfif', 1724841809, 'BS8', 0, '', 0, ''),
(121, 29, 390400, 'academic/passport_1724841994.jpg', 1724841994, 'BS8', 0, '', 0, ''),
(122, 25, 389944, 'student_photo_1724842252.jpg', 1724842252, 'BS8', 0, '', 0, ''),
(123, 25, 389944, 'lor_1724842252.jpg', 1724842252, 'BS8', 0, '', 0, ''),
(124, 25, 389944, 'highest_education_proof_1724842252.jpg', 1724842252, 'BS8', 0, '', 0, ''),
(125, 25, 389944, 'academic/highest_education_proof_1724842343.jpg', 1724842343, 'BS8', 0, '', 0, ''),
(126, 25, 389944, 'academic/IELTS_proof_1724842343.jfif', 1724842343, 'BS8', 0, '', 0, ''),
(127, 25, 389944, 'academic/passport_1724842408.jpg', 1724842408, 'BS8', 0, '', 0, ''),
(128, 45, 344605, 'student_photo_1724842563.jpg', 1724842563, 'PV1', 0, '', 0, ''),
(129, 45, 344605, '10th_makrksheet_1724842563.pdf', 1724842563, 'PV1', 0, '', 0, ''),
(130, 26, 466509, 'student_photo_1724843873.jpg', 1724843873, 'BS8', 0, '', 0, ''),
(131, 26, 466509, '10th_makrksheet_1724843873.jpg', 1724843873, 'BS8', 0, '', 0, ''),
(132, 26, 466509, '10th_certificate_1724843873.jpg', 1724843873, 'BS8', 0, '', 0, ''),
(133, 26, 466509, 'academic/highest_education_proof_1724844058.jpg', 1724844058, 'BS8', 0, '', 0, ''),
(134, 26, 466509, 'academic/IELTS_proof_1724844058.jpg', 1724844058, 'BS8', 0, '', 0, ''),
(135, 26, 466509, 'academic/passport_1724844159.jpg', 1724844159, 'BS8', 0, '', 0, ''),
(136, 33, 178908, 'student_photo_1724846513.jpg', 1724846513, 'BS8', 0, '', 0, ''),
(137, 33, 178908, '10th_makrksheet_1724846513.jpg', 1724846513, 'BS8', 0, '', 0, ''),
(138, 33, 178908, '10th_certificate_1724846513.jpg', 1724846513, 'BS8', 0, '', 0, ''),
(139, 33, 178908, 'academic/highest_education_proof_1724846616.jpg', 1724846616, 'BS8', 0, '', 0, ''),
(140, 33, 178908, 'academic/IELTS_proof_1724846616.jfif', 1724846616, 'BS8', 0, '', 0, ''),
(141, 33, 178908, 'academic/passport_1724846725.jpg', 1724846725, 'BS8', 0, '', 0, ''),
(142, 45, 344605, 'student_photo_1725695255.pdf', 1725695255, 'BS2', 1, 'BS2', 1726123671, 'test'),
(143, 45, 344605, '10th_makrksheet_1725695255.pdf', 1725695255, 'BS2', 0, '', 0, ''),
(144, 45, 344605, '10th_certificate_1725695255.pdf', 1725695255, 'BS2', 0, '', 0, ''),
(145, 45, 344605, 'lor_1725695255.pdf', 1725695255, 'BS2', 0, '', 0, ''),
(146, 45, 344605, 'sop_1725695255.pdf', 1725695255, 'BS2', 0, '', 0, ''),
(147, 45, 344605, 'highest_education_proof_1725695255.pdf', 1725695255, 'BS2', 0, '', 0, ''),
(148, 45, 344605, 'passport_1725695255.pdf', 1725695255, 'BS2', 0, '', 0, ''),
(149, 36, 507414, 'passport_1726115554.pdf', 1726115554, 'BS2', 0, '', 0, ''),
(150, 46, 233708, 'student_photo_1726120981.jpg', 1726120981, 'BS2', 0, '', 0, ''),
(151, 46, 233708, '10th_makrksheet_1726120981.pdf', 1726120981, 'BS2', 0, '', 0, ''),
(152, 46, 233708, 'academic/highest_education_proof_1726121116.pdf', 1726121116, 'BS2', 0, '', 0, ''),
(153, 46, 233708, 'academic/passport_1726121221.jpg', 1726121221, 'BS2', 0, '', 0, ''),
(154, 47, 583323, 'student_photo_1726123205.jpg', 1726123205, 'BS2', 0, '', 0, ''),
(155, 47, 583323, 'passport_1726123205.pdf', 1726123205, 'BS2', 1, 'BS2', 1726123403, 'test'),
(156, 47, 583323, 'passport_1726123500.pdf', 1726123500, 'BS2', 1, 'BS2', 1726123563, 'test'),
(157, 47, 583323, 'highest_education_proof_1726123529.pdf', 1726123529, 'BS2', 1, 'BS2', 1728015072, 'Testing'),
(158, 48, 282829, 'student_photo_1728013507.jpg', 1728013507, 'PV1', 0, '', 0, ''),
(159, 48, 282829, 'passport_1728013507.pdf', 1728013507, 'PV1', 0, '', 0, ''),
(160, 47, 583323, 'highest_education_proof_1728015176.pdf', 1728015176, 'BS2', 0, '', 0, ''),
(161, 47, 583323, 'passport_1728015176.pdf', 1728015176, 'BS2', 0, '', 0, ''),
(162, 36, 507414, 'highest_education_proof_1728024767.pdf', 1728024767, 'BS2', 0, '', 0, ''),
(163, 26, 466509, 'student_photo_1728103125.jpg', 1728103125, 'SP3', 0, '', 0, ''),
(164, 26, 466509, 'student_photo_1728103149.jpg', 1728103149, 'SP3', 0, '', 0, ''),
(165, 51, 265137, 'student_photo_1728107431.jpg', 1728107431, 'BS2', 0, '', 0, ''),
(166, 51, 265137, 'academic/highest_education_proof_1728107595.jpg', 1728107595, 'BS2', 0, '', 0, ''),
(167, 51, 265137, '10th_makrksheet_1728107878.jpg', 1728107878, 'BS2', 0, '', 0, ''),
(168, 51, 265137, '10th_certificate_1728107878.jpg', 1728107878, 'BS2', 0, '', 0, ''),
(169, 51, 265137, 'lor_1728107878.jpg', 1728107878, 'BS2', 0, '', 0, ''),
(170, 51, 265137, 'sop_1728107878.jpg', 1728107878, 'BS2', 0, '', 0, ''),
(171, 51, 265137, 'passport_1728107878.jpg', 1728107878, 'BS2', 0, '', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `wallet_history`
--

DROP TABLE IF EXISTS `wallet_history`;
CREATE TABLE IF NOT EXISTS `wallet_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `wallet_id` int NOT NULL,
  `transaction_remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `transaction_amount` decimal(10,2) NOT NULL,
  `transaction_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `transaction_date` int NOT NULL,
  `transaction_type` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `wallet_history`
--

INSERT INTO `wallet_history` (`id`, `wallet_id`, `transaction_remark`, `transaction_amount`, `transaction_id`, `transaction_date`, `transaction_type`) VALUES
(1, 1, 'Wallet Created', 0.00, '', 1720428928, 111),
(2, 2, 'Wallet Created', 0.00, '', 1720428989, 111),
(3, 3, 'Wallet Created', 0.00, '', 1720429058, 111),
(5, 4, 'Wallet Created', 0.00, '', 1724825258, 111),
(6, 4, 'Commission Credited for URN 344605', 501.00, 'WT1725697308', 1725697308, 1),
(7, 2, 'Commission Credited for URN 233708', 2205.00, 'WT1726122343', 1726122343, 1),
(8, 5, 'Wallet Created', 0.00, '', 1728013735, 111),
(9, 6, 'Wallet Created', 0.00, '', 1728013805, 111),
(10, 7, 'Wallet Created', 0.00, '', 1728013930, 111),
(11, 8, 'Wallet Created', 0.00, '', 1728014011, 111),
(12, 7, 'Commission Credited for URN 583323', 2926.88, 'WT1728016273', 1728016273, 1),
(13, 4, 'Commission Credited for URN 569799', 825.00, 'WT1728017204', 1728017204, 1),
(14, 4, 'Commission Credited for URN 714621', 1728.90, 'WT1728017788', 1728017788, 1),
(15, 3, 'Commission Credited for URN 390400', 3150.00, 'WT1728017788', 1728017788, 1),
(16, 5, 'Commission Credited for URN 184732', 2745.00, 'WT1728017788', 1728017788, 1),
(17, 4, 'Amount Withdrawl', 1100.00, 'W-OCT12', 1728017580, 0),
(18, 2, 'Commission Credited for URN 463188', 5089.50, 'WT1728020074', 1728020074, 1),
(19, 7, 'Commission Credited for URN 389944', 0.00, 'WT1728020074', 1728020074, 1),
(20, 7, 'Commission Credited for URN 480905', 1168.20, 'WT1728020074', 1728020074, 1),
(21, 7, 'Commission Credited for URN 742352', 1362.90, 'WT1728020183', 1728020183, 1),
(22, 7, 'Amount Withdrawl', 1524.00, 'W-OCT125', 1728021600, 0),
(23, 7, 'Commission Credited for URN 178908', 3500.00, 'WT1728023597', 1728023597, 1),
(24, 7, 'Amount Withdrawl', 1200.00, 'W-OCT126', 1728022680, 0),
(25, 7, 'Amount Withdrawl', 500.00, 'W-OCT127', 1728023460, 0),
(26, 4, 'Commission Credited for URN 507414', 1043.00, 'WT1728025083', 1728025083, 1),
(27, 7, 'Amount Withdrawl', 528.00, 'W-OCT128', 1728024180, 0),
(28, 4, 'Amount Withdrawl', 599.00, 'W-OCT128', 1728024480, 0),
(29, 4, 'Amount Withdrawl', 499.00, 'W-OCT130', 1728024540, 0),
(30, 9, 'Wallet Created', 0.00, '', 1728037183, 111),
(31, 2, 'Amount Withdrawl', 10.00, 'NOV16112024', 1731728700, 0),
(32, 7, 'Amount Withdrawl', 10.00, 'NOV16112024', 1731731700, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wallet_list`
--

DROP TABLE IF EXISTS `wallet_list`;
CREATE TABLE IF NOT EXISTS `wallet_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `holder_id` int NOT NULL,
  `holder_type` int NOT NULL,
  `balance` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `wallet_list`
--

INSERT INTO `wallet_list` (`id`, `holder_id`, `holder_type`, `balance`) VALUES
(1, 1, 4, 1503.00),
(2, 2, 4, 7284.50),
(3, 1, 6, 3150.00),
(4, 2, 6, 1899.90),
(5, 3, 4, 2745.00),
(6, 4, 4, 0.00),
(7, 3, 6, 5195.98),
(8, 4, 6, 0.00),
(9, 5, 4, 0.00);

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
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `withdrawl_request_list`
--

INSERT INTO `withdrawl_request_list` (`id`, `wallet_id`, `amount`, `req_datentime`, `status`, `approved_by`, `approval_datentime`, `proof_file_name`, `transaction_id`, `transaction_datentime`) VALUES
(1, 4, 1000, 1728018421, 1, 'BS2', 1728018591, 'W-OCT12.jpg', 'W-OCT12', 1728017580),
(2, 4, 100, 1728018507, 1, 'BS2', 1728018591, 'W-OCT12.jpg', 'W-OCT12', 1728017580),
(3, 7, 1524, 1728022563, 1, 'BS2', 1728022603, 'W-OCT125.jpg', 'W-OCT125', 1728021600),
(4, 7, 1200, 1728022976, 1, 'BS2', 1728023651, 'W-OCT126.jpg', 'W-OCT126', 1728022680),
(5, 7, 500, 1728024374, 1, 'BS2', 1728024492, 'W-OCT127.jpg', 'W-OCT127', 1728023460),
(6, 7, 528, 1728025146, 1, 'BS2', 1728025195, 'W-OCT128.jpg', 'W-OCT128', 1728024180),
(7, 4, 599, 1728025419, 1, 'BS2', 1728025449, 'W-OCT128.jpg', 'W-OCT128', 1728024480),
(8, 4, 499, 1728025506, 1, 'BS2', 1728025552, 'W-OCT130.jpg', 'W-OCT130', 1728024540),
(9, 4, 500, 1728109522, 0, '', 0, '', '', 0),
(10, 2, 10, 1731730982, 1, 'BS2', 1731731101, 'NOV16112024.pdf', 'NOV16112024', 1731728700),
(11, 7, 10, 1731732649, 1, 'BS2', 1731732763, 'NOV16112024.pdf', 'NOV16112024', 1731731700);

-- --------------------------------------------------------

--
-- Table structure for table `working_on_lead_list`
--

DROP TABLE IF EXISTS `working_on_lead_list`;
CREATE TABLE IF NOT EXISTS `working_on_lead_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `lead_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `working_on_lead_list`
--

INSERT INTO `working_on_lead_list` (`id`, `user`, `lead_id`) VALUES
(82, 'BS3', 49);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 24, 2025 at 12:34 PM
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
-- Table structure for table `active_chat_list`
--

DROP TABLE IF EXISTS `active_chat_list`;
CREATE TABLE IF NOT EXISTS `active_chat_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customer` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `staff` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `status` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bank_accounts_list`
--

INSERT INTO `bank_accounts_list` (`id`, `crn`, `account_holder_name`, `bank_name`, `branch_address`, `ifsc`, `account_number`, `verification_status`) VALUES
(7, 1004, 'Arpita Sinha', 'HDFC', 'Hebbal Bangalore', 'HDFC12345', 1542369870, 0),
(12, 1004, 'Arpita Sinha', 'HDFC', 'Hebbal', 'HDFC12345', 542301, 0),
(20, 1001, 'Veeru Devgan', 'State Bank of India', 'NRI Branch Bellary Road', 'SBIN012345', 5329100, 0),
(16, 1002, 'Arpita', 'HDFC', 'RT Nagar', 'HDFC12345', 4563201, 0),
(22, 1004, 'Arpita Sinha', 'State Bank of India', 'Sanjay Nagar', 'SBIN002', 10238075265, 0),
(23, 1016, 'Mamta', 'HDFC', 'Sanjay Nagar', 'HDFC102456', 98653201452, 1);

-- --------------------------------------------------------

--
-- Table structure for table `callback_list`
--

DROP TABLE IF EXISTS `callback_list`;
CREATE TABLE IF NOT EXISTS `callback_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `lrn` int NOT NULL,
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

INSERT INTO `callback_list` (`id`, `lrn`, `callback_datentime`, `prev_remark`, `status`, `call_remark`, `updated_by`, `hold_by`, `updation_datentime`) VALUES
(1, 535694, 1746597600, 'Customer wants callback', 0, '', '', '', 0),
(2, 535694, 1746683400, 'testing', 0, '', '', '', 0),
(3, 535694, 1746683400, 'testing', 0, '', '', '', 0),
(4, 535694, 1746687000, 'testing', 0, '', '', '', 0),
(5, 535694, 1746776100, 'test', 0, '', '', '', 0),
(6, 189053, 1747735200, 'Customer want callback on 3.30 PM', 0, '', '', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `call_history`
--

DROP TABLE IF EXISTS `call_history`;
CREATE TABLE IF NOT EXISTS `call_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `lrn` int NOT NULL,
  `type` int NOT NULL,
  `remark` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `remark_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `datentime` int NOT NULL,
  `dataentry_datentime` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `call_history`
--

INSERT INTO `call_history` (`id`, `lrn`, `type`, `remark`, `remark_by`, `datentime`, `dataentry_datentime`) VALUES
(1, 535694, 1, 'Call Not rcvd', 'BS2', 1746593100, 1746594584),
(2, 535694, 1, 'Call Not Rcvd', 'BS2', 1746596100, 1746594658),
(3, 308829, 1, 'Tried to connect customer', 'BS2', 1763979120, 1763968238);

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
  `staff_id` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `datentime` int NOT NULL,
  `status` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `chat_history`
--

INSERT INTO `chat_history` (`id`, `message`, `message_type`, `sender_id`, `receiver_id`, `staff_id`, `datentime`, `status`) VALUES
(40, 'Hi', 0, 'BS2', 'BS10', '', 1754022153, 0),
(39, 'test', 0, 'CR1001', 'CS', '', 1753945311, 0),
(38, 'test', 0, 'CS', 'CR1001', '', 1753945304, 0),
(37, 'test', 0, 'CR1001', 'CS', '', 1753945221, 0),
(35, 'test', 0, 'CS', 'CR1001', '', 1753945130, 0),
(31, 'CS_CR1001_1753772775.png', 1, 'CS', 'CR1001', '', 1753772775, 0),
(32, 'Image testing', 0, 'CR1001', 'CS', '', 1753787148, 0),
(33, 'Image sending both side', 0, 'CS', 'CR1001', '', 1753787166, 0),
(24, 'TEST', 0, 'CR1001', 'CS', '', 1753702582, 0),
(25, 'Hi', 0, 'CS', 'CR1001', '', 1753770838, 0),
(26, 'Test', 0, 'CR1001', 'CS', '', 1753770850, 0),
(36, 'test', 0, 'CR1001', 'CS', '', 1753945138, 0),
(34, 'another staff', 0, 'CS', 'CR1001', '', 1753788840, 0),
(29, 'CR1001_CS_1753772663.png', 1, 'CR1001', 'CS', '', 1753772663, 0),
(28, 'Test again', 0, 'CR1001', 'CS', '', 1753770887, 0),
(27, 'asdfgh', 0, 'CR1001', 'CS', '', 1753770858, 0),
(23, 'Test', 0, 'CR1001', 'CS', '', 1753699807, 0),
(22, 'Hi', 0, 'CS', 'CR1001', '', 1753688328, 0),
(41, 'Testing', 0, 'BS2', 'BS10', '', 1754022157, 0),
(42, 'Hi', 0, 'BS10', 'BS2', '', 1754024854, 0),
(43, 'Testing', 0, 'BS10', 'BS2', '', 1754024858, 0),
(44, '1234', 0, 'BS10', 'BS2', '', 1754032084, 0),
(45, 'Hi', 0, 'CR1002', 'CS', '', 1754033853, 0),
(46, 'Hi', 0, 'CS', 'CR1002', '', 1754033875, 0),
(47, 'Test', 0, 'CR1002', 'CS', '', 1754034016, 0),
(48, 'test', 0, 'CS', 'CR1001', '', 1754040351, 0),
(49, 'Hi', 0, 'CR1016', 'CS', '', 1754564781, 0),
(50, 'Hi', 0, 'CS', 'CR1016', '', 1754624617, 0),
(51, 'How to get gold loan', 0, 'CR1016', 'CS', '', 1754624638, 0),
(52, 'Hi\r\nis there someone to help me?', 0, 'CR1001', 'CS', '', 1755488850, 0),
(53, 'Hi how may i help you?', 0, 'CS', 'CR1001', '', 1755488893, 0);

-- --------------------------------------------------------

--
-- Table structure for table `chat_history_old`
--

DROP TABLE IF EXISTS `chat_history_old`;
CREATE TABLE IF NOT EXISTS `chat_history_old` (
  `id` int NOT NULL AUTO_INCREMENT,
  `message` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `message_type` int NOT NULL,
  `sender_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `receiver_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `staff_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `datentime` int NOT NULL,
  `status` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `chat_history_old`
--

INSERT INTO `chat_history_old` (`id`, `message`, `message_type`, `sender_id`, `receiver_id`, `staff_id`, `datentime`, `status`) VALUES
(1, 'Hi', 0, 'BS2', 'CR1001', 'BS2', 1752917254, 0),
(2, 'BS2_CR1001_1752917372.png', 1, 'BS2', 'CR1001', 'BS2', 1752917372, 0),
(3, 'Hi I want to take gold loan', 0, 'CR1001', 'BS2', 'BS2', 1752917899, 0),
(4, 'hi', 0, 'BS10', 'CR1001', 'BS10', 1752921078, 0),
(5, 'testing', 0, 'CR1001', 'BS10', 'BS10', 1752921270, 0),
(6, 'hi', 0, 'BS10', 'BS2', '', 1752921467, 0),
(7, 'testing', 0, 'CR1001', 'BS2', 'BS2', 1753082983, 0),
(8, 'test', 0, 'CR1001', 'BS2', 'BS2', 1753099729, 0),
(9, 'online status check', 0, 'CR1001', 'BS2', 'BS2', 1753178267, 0),
(10, 'Check ctrl enter', 0, 'BS2', 'CR1001', 'BS2', 1753184353, 0),
(11, 'Check ctrl plus enter', 0, 'CR1001', 'BS2', 'BS2', 1753184396, 0),
(12, 'check again', 0, 'CR1001', 'BS2', 'BS2', 1753184547, 0),
(13, 'test again', 0, 'BS2', 'CR1001', 'BS2', 1753184557, 0),
(14, 'test again', 0, 'BS2', 'CR1001', 'BS2', 1753184662, 0),
(15, 'test again', 0, 'CR1001', 'BS2', 'BS2', 1753184673, 0),
(16, 'BS2_CR1001_1753244724.png', 1, 'BS2', 'CR1001', 'BS2', 1753244724, 0),
(17, 'Test click', 0, 'BS2', 'CR1001', '', 1753255398, 0),
(18, 'Test ctrl enter', 0, 'BS2', 'CR1001', '', 1753255409, 0);

-- --------------------------------------------------------

--
-- Table structure for table `chat_sessions_list`
--

DROP TABLE IF EXISTS `chat_sessions_list`;
CREATE TABLE IF NOT EXISTS `chat_sessions_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cust_id` varchar(1024) COLLATE utf8mb4_general_ci NOT NULL,
  `staff_id` varchar(1024) COLLATE utf8mb4_general_ci NOT NULL,
  `status` int NOT NULL,
  `started_on` int NOT NULL,
  `updated_on` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `chat_sessions_list`
--

INSERT INTO `chat_sessions_list` (`id`, `cust_id`, `staff_id`, `status`, `started_on`, `updated_on`) VALUES
(19, 'CR1001', 'BS2', 0, 0, 0),
(26, 'CR1002', '', 0, 1754049695, 1754049695),
(27, 'CR1016', 'BS2', 0, 1754564773, 1754564773);

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `company_type_list`
--

DROP TABLE IF EXISTS `company_type_list`;
CREATE TABLE IF NOT EXISTS `company_type_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(1024) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `company_type_list`
--

INSERT INTO `company_type_list` (`id`, `description`) VALUES
(1, 'Pvt Ltd'),
(2, 'LLP'),
(3, 'OPC Pvt Ltd'),
(4, 'Properietership'),
(5, 'Partnership'),
(6, 'Other'),
(7, 'LLC');

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
-- Table structure for table `crn_company_details`
--

DROP TABLE IF EXISTS `crn_company_details`;
CREATE TABLE IF NOT EXISTS `crn_company_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `crn` int NOT NULL,
  `name` varchar(1024) COLLATE utf8mb4_general_ci NOT NULL,
  `mobile` bigint NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `address` varchar(5120) COLLATE utf8mb4_general_ci NOT NULL,
  `type` int NOT NULL,
  `doi` int NOT NULL,
  `annual_turnover` bigint NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `crn_company_details`
--

INSERT INTO `crn_company_details` (`id`, `crn`, `name`, `mobile`, `email`, `address`, `type`, `doi`, `annual_turnover`) VALUES
(1, 1004, 'Arpita Traders', 1234567890, 'mgbafna1957@gmail.com', 'Moti Chamber\r\nHebbal 560024', 4, 1743445800, 100000),
(3, 1001, 'Veeru Corporation', 9876501235, 'abctraders@test.com', 'Yeshwantpur Bangalore\r\nIndia 560021', 5, 1735669800, 500000);

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
  `credit_limit` bigint NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1017 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers_list`
--

INSERT INTO `customers_list` (`id`, `name`, `mobile`, `alt_mobile`, `email`, `dob`, `brief_note`, `company_name`, `cust_type`, `permanent_address`, `lead_source_id`, `primary_bank`, `credit_limit`) VALUES
(1001, 'Veeru', 9922001236, 9922001237, 'veeru@cr.com', 631132200, 'No Note', 'Veeru Corporation', 2, 'Hebbal', 1, 20, 660000),
(1002, 'arpita', 9945251325, 1234569870, 'arpita@st.com', -19800, 'No Note', 'ABC Traders', 1, 'hebbala', 5, 16, 0),
(1004, 'Arpita Sinha', 1452369870, 2563149870, 'arpitasinha@st.com', 0, 'No Note', 'Arpita Traders', 2, 'hebbala', 5, 22, 1700000),
(1005, 'Sarala Sinha', 1452369870, 2563141234, 'saralasinha@test.com', 0, 'Special Remark', '', 1, 'hebbala bangalore', 5, 0, 0),
(1006, 'Suhana', 9922001234, 5236498710, 'suhana@st.com', 0, 'No Note', '', 1, 'Yelahnka Bangalore', 3, 0, 0),
(1007, 'sarvesh', 9911002453, 0, 'sarvesh@st.com', 0, 'No Note', 'Sarvesh Corp', 2, 'Yeshwantpur', 2, 0, 0),
(1013, 'test', 9072430726, 0, 'nimilphilip@gmail.com', 0, 'No Note', '', 1, 'aaaaa', 3, 0, 0),
(1010, 'Raghav', 7586329014, 2513680495, 'raghav@test.com', 0, 'No Note', 'XYZ Traders', 1, 'Hebbal', 5, 0, 0),
(1012, 'Veeru', 1452369870, 2563149870, 'arpita@test.com', 0, 'No Note', '', 1, 'aaaaa', 5, 0, 0),
(1014, 'Nimil Philip', 7994970111, 0, 'nimilphilipzoo@gmail.com', 0, 'No Note', '', 1, 'test', 3, 0, 0),
(1015, 'sarvesh', 9911002453, 0, 'sarvesh@test.com', 0, 'No Note', '', 1, 'Hebbala Bangalore', 2, 0, 0),
(1016, 'Mamta', 9922001346, 0, 'mamta@test.com', -19800, 'No Note', '', 1, 'Bangalore', 1, 23, 96000);

-- --------------------------------------------------------

--
-- Table structure for table `customer_request_list`
--

DROP TABLE IF EXISTS `customer_request_list`;
CREATE TABLE IF NOT EXISTS `customer_request_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `request_type_id` int NOT NULL,
  `datentime` int NOT NULL,
  `resolved_on` int NOT NULL,
  `status` int NOT NULL,
  `request_for` bigint NOT NULL,
  `resolved_by` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `remark` varchar(5120) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer_request_list`
--

INSERT INTO `customer_request_list` (`id`, `request_type_id`, `datentime`, `resolved_on`, `status`, `request_for`, `resolved_by`, `remark`) VALUES
(3, 2, 1751455651, 1751527622, 2, 4574861750762985, 'BS2', 'Can Not Change'),
(4, 6, 1751527992, 1751528061, 1, 4574861750762985, 'BS2', 'LoanTop-up Approved'),
(5, 5, 1751528298, 0, 0, 4574861750762985, '', ''),
(6, 6, 1751613018, 0, 0, 6141381750335196, '', ''),
(7, 4, 1751613555, 0, 0, 8586121748928019, '', ''),
(8, 6, 1752579580, 0, 0, 1890531752559489, '', ''),
(9, 4, 1754289180, 1754289328, 1, 6331321754281382, 'BS2', 'Interest Rate updated to 5.5% WEF 14-08-2025');

-- --------------------------------------------------------

--
-- Table structure for table `customer_request_type_list`
--

DROP TABLE IF EXISTS `customer_request_type_list`;
CREATE TABLE IF NOT EXISTS `customer_request_type_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(5120) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer_request_type_list`
--

INSERT INTO `customer_request_type_list` (`id`, `description`) VALUES
(1, 'Change Personal Info'),
(2, 'Change Bank Account'),
(3, 'Change Company Info'),
(4, 'Change Interest Rate'),
(5, 'Increase Credit Limit'),
(6, 'Loan Top-up'),
(7, 'Make Part Payment');

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
-- Table structure for table `dispatch_list`
--

DROP TABLE IF EXISTS `dispatch_list`;
CREATE TABLE IF NOT EXISTS `dispatch_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `lan` bigint NOT NULL,
  `lrn` int NOT NULL,
  `requested_amount` bigint NOT NULL,
  `approved_loan_amount` bigint NOT NULL,
  `approval_datentime` int NOT NULL,
  `approval_date` int NOT NULL,
  `status` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dispatch_list`
--

INSERT INTO `dispatch_list` (`id`, `lan`, `lrn`, `requested_amount`, `approved_loan_amount`, `approval_datentime`, `approval_date`, `status`) VALUES
(1, 8586121748928019, 858612, 200000, 10000, 1748928019, 1748889000, 1),
(2, 6141381750335196, 614138, 500000, 100000, 1750335196, 1750271400, 1),
(3, 4574861750762985, 457486, 1000000, 500000, 1750762985, 1750703400, 1),
(4, 9205731751692639, 920573, 1000000, 700000, 1751692639, 1751653800, 1),
(5, 1890531752559489, 189053, 5000001, 500000, 1752559489, 1752517800, 1),
(6, 6299381753359494, 629938, 100000, 20000, 1753359494, 1753295400, 1),
(7, 6331321754281382, 633132, 100000, 80000, 1754281382, 1754245800, 1);

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
(1, 'Proof of Address', 'poa', 1),
(2, 'Proof of Identity', 'poi', 1),
(3, 'Customer Photo', 'customer_photo', 1),
(4, 'PAN Card', 'pan', 1),
(5, 'Canceled Cheque', 'bank_cheque', 1),
(6, 'Signed Agreement', 'signed_agreement', 1),
(7, 'Company COI', 'coi', 0),
(8, 'Income Proof', 'income_proof', 1),
(9, 'Company PAN', 'company_pan', 0),
(10, 'Company POA', 'company_poa', 0),
(11, 'Proof of Ownership', 'poo', 1);

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
) ENGINE=MyISAM AUTO_INCREMENT=97 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `email_history`
--

INSERT INTO `email_history` (`id`, `type`, `subject`, `content`, `recipients`, `sender`, `datentime`) VALUES
(1, 'New Callback Set Alert', 'CA New Callback Set Alert', 'New Callback Set Alert', 'veeru@st.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1746591047),
(2, 'New Callback Set Alert', 'LA535694 New Callback Set Alert', 'New Callback Set Alert', 'veeru@st.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1746591311),
(3, 'New Callback Set Alert', 'LA535694 New Callback Set Alert', 'New Callback Set Alert', 'veeru@st.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1746591336),
(4, 'New Callback Set Alert', 'LA535694 New Callback Set Alert', 'New Callback Set Alert', 'veeru@st.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1746591780),
(5, 'LRN Customer Profile Update Alert', 'LA535694 LRN Customer Profile Update Alert', 'LRN Customer Profile Update Alert', 'veeru@st.com', 'support@campus-abroad.co.in', 1746593081),
(6, 'Loan Detail Update Alert', 'LA535694 Loan Detail Update Alert', 'Loan Detail Update Alert', 'veeru@st.com', 'support@campus-abroad.co.in', 1746593730),
(7, 'Company Detail Update Alert', 'LA535694 Company Detail Update Alert', 'Company Detail Update Alert', 'veeru@st.com', 'support@campus-abroad.co.in', 1746593962),
(8, 'Company Detail Update Alert', 'LA858612 Company Detail Update Alert', 'Company Detail Update Alert', 'arpitasinha@st.com', 'support@campus-abroad.co.in', 1746596210),
(9, 'Guarantor Update Alert', 'LA858612 Guarantor Update Alert', 'Guarantor Update Alert', 'arpitasinha@st.com', 'support@campus-abroad.co.in', 1746596417),
(10, 'Loan Detail Update Alert', 'LA858612 Loan Detail Update Alert', 'Loan Detail Update Alert', 'arpitasinha@st.com', 'support@campus-abroad.co.in', 1746596723),
(11, 'Customer Profile Update Alert', 'LA858612 Customer Profile Update Alert', 'Customer Profile Update Alert', 'arpitasinha@st.com', 'support@campus-abroad.co.in', 1746597630),
(12, 'Customer Profile Update Alert', 'LA858612 Customer Profile Update Alert', 'Customer Profile Update Alert', 'arpitasinha@st.com', 'support@campus-abroad.co.in', 1746597810),
(13, 'New Callback Set Alert', 'LA189053 New Callback Set Alert', 'New Callback Set Alert', 'arpitasinha@st.com,amit@moticorporation.com,yogesh@bafna.net', 'support@campus-abroad.co.in', 1747731990),
(14, 'Guarantor Update Alert', 'LA189053 Guarantor Update Alert', 'Guarantor Update Alert', 'arpitasinha@st.com', 'support@campus-abroad.co.in', 1747732936),
(15, 'Company Detail Update Alert', 'LA189053 Company Detail Update Alert', 'Company Detail Update Alert', 'arpitasinha@st.com', 'support@campus-abroad.co.in', 1747733101),
(16, 'Customer Profile Update Alert', 'LA189053 Customer Profile Update Alert', 'Customer Profile Update Alert', 'arpitasinha@st.com', 'support@campus-abroad.co.in', 1747733207),
(17, 'Guarantor Update Alert', 'LA189053 Guarantor Update Alert', 'Guarantor Update Alert', 'arpitasinha@st.com', 'support@campus-abroad.co.in', 1747734596),
(18, 'Loan Detail Update Alert', 'LA189053 Loan Detail Update Alert', 'Loan Detail Update Alert', 'arpitasinha@st.com', 'support@campus-abroad.co.in', 1747734659),
(19, 'Guarantor Update Alert', 'LA614138 Guarantor Update Alert', 'Guarantor Update Alert', 'arpitasinha@st.com', 'support@campus-abroad.co.in', 1747908125),
(20, 'LRN Status Updated Alert', 'LA858612 LRN Status Updated Alert', 'LRN Status Updated Alert', 'arpitasinha@st.com', 'support@campus-abroad.co.in', 1748073023),
(21, 'LRN Status Updated Alert', 'LA614138 LRN Status Updated Alert', 'LRN Status Updated Alert', 'arpitasinha@st.com', 'support@campus-abroad.co.in', 1748082394),
(22, 'Customer Profile Update Alert', 'LA614138 Customer Profile Update Alert', 'Customer Profile Update Alert', 'arpitasinha@st.com', 'support@campus-abroad.co.in', 1748085177),
(23, 'Loan Detail Update Alert', 'LA614138 Loan Detail Update Alert', 'Loan Detail Update Alert', 'arpitasinha@st.com', 'support@campus-abroad.co.in', 1748085217),
(24, 'LRN Status Updated Alert', 'LA614138 LRN Status Updated Alert', 'LRN Status Updated Alert', 'arpitasinha@st.com', 'support@campus-abroad.co.in', 1748085775),
(25, 'LRN Status Updated Alert', 'LA854764 LRN Status Updated Alert', 'LRN Status Updated Alert', 'veeru@st.com', 'support@campus-abroad.co.in', 1748089599),
(26, 'LRN Status Updated Alert', 'LA383568 LRN Status Updated Alert', 'LRN Status Updated Alert', 'veeru@st.com', 'support@campus-abroad.co.in', 1748318711),
(27, 'LRN Status Updated Alert', 'LA914948 LRN Status Updated Alert', 'LRN Status Updated Alert', 'arpitasinha@st.com', 'support@campus-abroad.co.in', 1748319263),
(28, 'LRN Agreement Generated Alert', 'LA614138 LRN Agreement Generated Alert', 'LRN Agreement Generated Alert', 'arpitasinha@st.com', 'support@campus-abroad.co.in', 1748342465),
(29, 'LRN Agreement Generated Alert', 'LA614138 LRN Agreement Generated Alert', 'LRN Agreement Generated Alert', 'arpitasinha@st.com', 'support@campus-abroad.co.in', 1748342586),
(30, 'LRN Agreement Generated Alert', 'LA614138 LRN Agreement Generated Alert', 'LRN Agreement Generated Alert', 'arpitasinha@st.com', 'support@campus-abroad.co.in', 1748407590),
(31, 'Customer Profile Update Alert', 'LA457486 Customer Profile Update Alert', 'Customer Profile Update Alert', 'veeru@st.com', 'support@campus-abroad.co.in', 1748493970),
(32, 'Customer Profile Update Alert', 'LA457486 Customer Profile Update Alert', 'Customer Profile Update Alert', 'veeru@st.com', 'support@campus-abroad.co.in', 1748493990),
(33, 'Customer Profile Update Alert', 'LA457486 Customer Profile Update Alert', 'Customer Profile Update Alert', 'veeru@st.com', 'support@campus-abroad.co.in', 1748501623),
(34, 'Company Detail Update Alert', 'LA457486 Company Detail Update Alert', 'Company Detail Update Alert', 'veeru@st.com', 'support@campus-abroad.co.in', 1748510198),
(35, 'Company Detail Update Alert', 'LA457486 Company Detail Update Alert', 'Company Detail Update Alert', 'veeru@st.com', 'support@campus-abroad.co.in', 1748510290),
(36, 'Company Detail Update Alert', 'LA457486 Company Detail Update Alert', 'Company Detail Update Alert', 'veeru@st.com', 'support@campus-abroad.co.in', 1748512115),
(37, 'Company Detail Update Alert', 'LA457486 Company Detail Update Alert', 'Company Detail Update Alert', 'veeru@st.com', 'support@campus-abroad.co.in', 1748512222),
(38, 'Company Detail Update Alert', 'LA457486 Company Detail Update Alert', 'Company Detail Update Alert', 'veeru@st.com', 'support@campus-abroad.co.in', 1748512528),
(39, 'Customer Profile Update Alert', 'LA457486 Customer Profile Update Alert', 'Customer Profile Update Alert', 'veeru@st.com', 'support@campus-abroad.co.in', 1748514994),
(40, 'Customer Profile Update Alert', 'LA457486 Customer Profile Update Alert', 'Customer Profile Update Alert', 'veeru@st.com', 'support@campus-abroad.co.in', 1748516287),
(41, 'Customer Profile Update Alert', 'LA457486 Customer Profile Update Alert', 'Customer Profile Update Alert', 'veeru@st.com', 'support@campus-abroad.co.in', 1748516367),
(42, 'Bank Account Update Alert', 'LA189053 Bank Account Update Alert', 'Bank Account Update Alert', 'arpitasinha@st.com', 'support@campus-abroad.co.in', 1748518073),
(43, 'Guarantor Update Alert', 'LA189053 Guarantor Update Alert', 'Guarantor Update Alert', 'arpitasinha@st.com', 'support@campus-abroad.co.in', 1748518410),
(44, 'Guarantor Update Alert', 'LA189053 Guarantor Update Alert', 'Guarantor Update Alert', 'arpitasinha@st.com', 'support@campus-abroad.co.in', 1748520305),
(45, 'Guarantor Update Alert', 'LA189053 Guarantor Update Alert', 'Guarantor Update Alert', 'arpitasinha@st.com', 'support@campus-abroad.co.in', 1748520355),
(46, 'Guarantor Update Alert', 'LA457486 Guarantor Update Alert', 'Guarantor Update Alert', 'veeru@st.com', 'support@campus-abroad.co.in', 1748520720),
(47, 'Loan Detail Update Alert', 'LA189053 Loan Detail Update Alert', 'Loan Detail Update Alert', 'arpitasinha@st.com', 'support@campus-abroad.co.in', 1748521370),
(48, 'Loan Detail Update Alert', 'LA189053 Loan Detail Update Alert', 'Loan Detail Update Alert', 'arpitasinha@st.com', 'support@campus-abroad.co.in', 1748521629),
(49, 'Loan Detail Update Alert', 'LA189053 Loan Detail Update Alert', 'Loan Detail Update Alert', 'arpitasinha@st.com', 'support@campus-abroad.co.in', 1748577656),
(50, 'Loan Detail Update Alert', 'LA457486 Loan Detail Update Alert', 'Loan Detail Update Alert', 'veeru@st.com', 'support@campus-abroad.co.in', 1748584730),
(51, 'Customer Profile Update Alert', 'LA457486 Customer Profile Update Alert', 'Customer Profile Update Alert', 'veeru@st.com', 'support@campus-abroad.co.in', 1748584840),
(52, 'Guarantor Update Alert', 'LA858612 Guarantor Update Alert', 'Guarantor Update Alert', 'arpitasinha@st.com', 'support@campus-abroad.co.in', 1748585934),
(53, 'Guarantor Update Alert', 'LA858612 Guarantor Update Alert', 'Guarantor Update Alert', 'arpitasinha@st.com', 'support@campus-abroad.co.in', 1748586266),
(54, 'Bank Account Update Alert', 'LA858612 Bank Account Update Alert', 'Bank Account Update Alert', 'arpitasinha@st.com', 'support@campus-abroad.co.in', 1748589272),
(55, 'Company Detail Update Alert', 'LA858612 Company Detail Update Alert', 'Company Detail Update Alert', 'arpitasinha@st.com', 'support@campus-abroad.co.in', 1748589642),
(56, 'Loan Detail Update Alert', 'LA457486 Loan Detail Update Alert', 'Loan Detail Update Alert', 'veeru@st.com', 'support@campus-abroad.co.in', 1748590323),
(57, 'Customer Profile Update Alert', 'LA457486 Customer Profile Update Alert', 'Customer Profile Update Alert', 'veeru@st.com', 'support@campus-abroad.co.in', 1748590403),
(58, 'Guarantor Update Alert', 'LA858612 Guarantor Update Alert', 'Guarantor Update Alert', 'arpitasinha@st.com', 'support@campus-abroad.co.in', 1748602675),
(59, 'LRN Status Updated Alert', 'LA858612 LRN Status Updated Alert', 'LRN Status Updated Alert', 'arpitasinha@st.com', 'support@campus-abroad.co.in', 1748664611),
(60, 'LRN Agreement Generated Alert', 'LA858612 LRN Agreement Generated Alert', 'LRN Agreement Generated Alert', 'arpitasinha@st.com', 'support@campus-abroad.co.in', 1748664664),
(61, 'Guarantor Update Alert', 'LA920573 Guarantor Update Alert', 'Guarantor Update Alert', 'arpitasinha@st.com', 'support@campus-abroad.co.in', 1748675654),
(62, 'LRN Status Updated Alert', 'LA858612 LRN Status Updated Alert', 'LRN Status Updated Alert', 'arpitasinha@st.com', 'support@campus-abroad.co.in', 1748693379),
(63, 'LRN Status Updated Alert', 'LA457486 LRN Status Updated Alert', 'LRN Status Updated Alert', 'veeru@st.com', 'support@campus-abroad.co.in', 1748694072),
(64, 'LRN Status Updated Alert', 'LA858612 LRN Status Updated Alert', 'LRN Status Updated Alert', 'arpitasinha@st.com', 'support@campus-abroad.co.in', 1748926084),
(65, 'LRN Status Updated Alert', 'LA858612 LRN Status Updated Alert', 'LRN Status Updated Alert', 'arpitasinha@st.com', 'support@campus-abroad.co.in', 1748928019),
(66, 'LRN Status Updated Alert', 'LA614138 LRN Status Updated Alert', 'LRN Status Updated Alert', 'arpitasinha@st.com', 'support@campus-abroad.co.in', 1750335196),
(67, 'LRN Status Updated Alert', 'LA457486 LRN Status Updated Alert', 'LRN Status Updated Alert', 'veeru@st.com', 'support@campus-abroad.co.in', 1750762799),
(68, 'LRN Agreement Generated Alert', 'LA457486 LRN Agreement Generated Alert', 'LRN Agreement Generated Alert', 'veeru@st.com', 'support@campus-abroad.co.in', 1750762860),
(69, 'LRN Status Updated Alert', 'LA457486 LRN Status Updated Alert', 'LRN Status Updated Alert', 'veeru@st.com', 'support@campus-abroad.co.in', 1750762985),
(70, 'Customer Profile Update Alert', 'LA920573 Customer Profile Update Alert', 'Customer Profile Update Alert', 'arpitasinha@st.com', 'support@campus-abroad.co.in', 1751626742),
(71, 'Loan Detail Update Alert', 'LA920573 Loan Detail Update Alert', 'Loan Detail Update Alert', 'arpitasinha@st.com', 'support@campus-abroad.co.in', 1751627031),
(72, 'LRN Status Updated Alert', 'LA920573 LRN Status Updated Alert', 'LRN Status Updated Alert', 'arpitasinha@st.com', 'support@campus-abroad.co.in', 1751627160),
(73, 'LRN Status Updated Alert', 'LA920573 LRN Status Updated Alert', 'LRN Status Updated Alert', 'arpitasinha@st.com', 'support@campus-abroad.co.in', 1751627322),
(74, 'LRN Agreement Generated Alert', 'LA920573 LRN Agreement Generated Alert', 'LRN Agreement Generated Alert', 'arpitasinha@st.com', 'support@campus-abroad.co.in', 1751688094),
(75, 'LRN Status Updated Alert', 'LA920573 LRN Status Updated Alert', 'LRN Status Updated Alert', 'arpitasinha@st.com', 'support@campus-abroad.co.in', 1751692639),
(76, 'Guarantor Update Alert', 'LA189053 Guarantor Update Alert', 'Guarantor Update Alert', 'arpitasinha@st.com', 'support@campus-abroad.co.in', 1751890378),
(77, 'Bank Account Update Alert', 'LA189053 Bank Account Update Alert', 'Bank Account Update Alert', 'arpitasinha@st.com', 'support@campus-abroad.co.in', 1751890404),
(78, 'LRN Status Updated Alert', 'LA189053 LRN Status Updated Alert', 'LRN Status Updated Alert', 'arpitasinha@st.com', 'support@campus-abroad.co.in', 1752558978),
(79, 'LRN Status Updated Alert', 'LA189053 LRN Status Updated Alert', 'LRN Status Updated Alert', 'arpitasinha@st.com', 'support@campus-abroad.co.in', 1752559409),
(80, 'LRN Agreement Generated Alert', 'LA189053 LRN Agreement Generated Alert', 'LRN Agreement Generated Alert', 'arpitasinha@st.com', 'support@campus-abroad.co.in', 1752559437),
(81, 'LRN Status Updated Alert', 'LA189053 LRN Status Updated Alert', 'LRN Status Updated Alert', 'arpitasinha@st.com', 'support@campus-abroad.co.in', 1752559489),
(82, 'LRN Status Updated Alert', 'LA629938 LRN Status Updated Alert', 'LRN Status Updated Alert', 'mamta@test.com', 'support@campus-abroad.co.in', 1752578926),
(83, 'Loan Detail Update Alert', 'LA629938 Loan Detail Update Alert', 'Loan Detail Update Alert', 'mamta@test.com', 'support@campus-abroad.co.in', 1752579019),
(84, 'Guarantor Update Alert', 'LA629938 Guarantor Update Alert', 'Guarantor Update Alert', 'mamta@test.com', 'support@campus-abroad.co.in', 1752580574),
(85, 'Customer Profile Update Alert', 'LA308829 Customer Profile Update Alert', 'Customer Profile Update Alert', 'arpitasinha@st.com', 'support@campus-abroad.co.in', 1752830056),
(86, 'Customer Profile Update Alert', 'LA629938 Customer Profile Update Alert', 'Customer Profile Update Alert', 'mamta@test.com', 'support@campus-abroad.co.in', 1753359195),
(87, 'LRN Status Updated Alert', 'LA629938 LRN Status Updated Alert', 'LRN Status Updated Alert', 'mamta@test.com', 'support@campus-abroad.co.in', 1753359324),
(88, 'LRN Agreement Generated Alert', 'LA629938 LRN Agreement Generated Alert', 'LRN Agreement Generated Alert', 'mamta@test.com', 'support@campus-abroad.co.in', 1753359388),
(89, 'LRN Status Updated Alert', 'LA629938 LRN Status Updated Alert', 'LRN Status Updated Alert', 'mamta@test.com', 'support@campus-abroad.co.in', 1753359494),
(90, 'LRN Status Updated Alert', 'LA633132 LRN Status Updated Alert', 'LRN Status Updated Alert', 'mamta@test.com', 'support@campus-abroad.co.in', 1754280684),
(91, 'Customer Profile Update Alert', 'LA633132 Customer Profile Update Alert', 'Customer Profile Update Alert', 'mamta@test.com', 'support@campus-abroad.co.in', 1754280770),
(92, 'Loan Detail Update Alert', 'LA633132 Loan Detail Update Alert', 'Loan Detail Update Alert', 'mamta@test.com', 'support@campus-abroad.co.in', 1754280825),
(93, 'Guarantor Update Alert', 'LA633132 Guarantor Update Alert', 'Guarantor Update Alert', 'mamta@test.com', 'support@campus-abroad.co.in', 1754280836),
(94, 'LRN Status Updated Alert', 'LA633132 LRN Status Updated Alert', 'LRN Status Updated Alert', 'mamta@test.com', 'support@campus-abroad.co.in', 1754281157),
(95, 'LRN Agreement Generated Alert', 'LA633132 LRN Agreement Generated Alert', 'LRN Agreement Generated Alert', 'mamta@test.com', 'support@campus-abroad.co.in', 1754281208),
(96, 'LRN Status Updated Alert', 'LA633132 LRN Status Updated Alert', 'LRN Status Updated Alert', 'mamta@test.com', 'support@campus-abroad.co.in', 1754281382);

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
  `document_title` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `guarantor_list`
--

INSERT INTO `guarantor_list` (`id`, `crn`, `name`, `email`, `mobile`, `current_address`, `permanent_address`, `company`, `document_title`) VALUES
(6, 1004, 'Rahul Kumar', 'rahulkumar@testcom', 8523614970, 'Hebbal', 'Hebbal', 'Individual', 'idproof'),
(5, 1002, 'Test Guarantor', 'tgc@test.com', 8523697410, 'Hebbal', 'Hebbal', 'TG Corp', 'idproof'),
(7, 1004, 'Veeru', 'testuser@test.com', 9380006337, 'adadad', 'asadadad', 'ABC Corp', 'pan'),
(8, 1001, 'Rajesh Kumar', 'rajeshcorp@test.com', 9652301487, 'Yeshwantpur Bangalore', 'Yeshwantpur Bangalore', 'Rajesh Corporation', 'Id_proof'),
(9, 1004, 'Mamta', 'mamta@test.com', 9865214730, 'Yashwantpur', 'Yashwantpur', 'Mamta Trader', 'poi'),
(10, 1016, 'Tanvi', 'tanvi@test.com', 1234569870, 'Hebbala', 'Hebbala', 'Tanvi Corporation', 'ID Proof');

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `introducer_list`
--

DROP TABLE IF EXISTS `introducer_list`;
CREATE TABLE IF NOT EXISTS `introducer_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` int NOT NULL,
  `name` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `mobile` bigint NOT NULL,
  `address` varchar(5120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `commission_percent` int NOT NULL,
  `contact_person` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `document_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `bank_name` varchar(1025) COLLATE utf8mb4_general_ci NOT NULL,
  `account_number` bigint NOT NULL,
  `ifsc` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `introducer_list`
--

INSERT INTO `introducer_list` (`id`, `type`, `name`, `email`, `mobile`, `address`, `commission_percent`, `contact_person`, `document_title`, `bank_name`, `account_number`, `ifsc`) VALUES
(1, 1, 'Sanjay Kumar', 'sanjay@test.com', 9876501234, 'Sanjay Nagar Bangalore', 35, '', 'id_proof', '', 0, ''),
(2, 2, 'Moti Builders', 'motibuilders@test.com', 1203456798, 'Moti Chamber Hebbala Bangalore', 35, 'Tanvi Bafna', 'reg_cert', '', 0, ''),
(4, 2, 'Rahul Constructions', 'rahuleconstructions@test.com', 8523614970, 'Hebbala', 30, 'Rahul Sinha', 'reg_cert', '', 0, ''),
(5, 2, 'Moti Group', 'tanvibafna@test.com', 8523614970, 'Hebbala', 40, 'Tanvi Bafna', 'reg_cert', '', 0, ''),
(6, 1, 'Mamta', 'mamta@test.com', 9966558812, 'Yeshwantpur', 35, '', 'PAN', 'HDFC', 98321456, 'HDFC001'),
(7, 1, 'Jasintha Paulraj', 'jasintha@test.com', 9805612034, 'Moti Chamber Hebbala', 30, '', 'pan', 'State Bank of India', 53216986, 'SBIN002');

-- --------------------------------------------------------

--
-- Table structure for table `lan_activity_history`
--

DROP TABLE IF EXISTS `lan_activity_history`;
CREATE TABLE IF NOT EXISTS `lan_activity_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `lan` bigint NOT NULL,
  `lrn` int NOT NULL,
  `comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `activity_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `datentime` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=94 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lan_activity_history`
--

INSERT INTO `lan_activity_history` (`id`, `lan`, `lrn`, `comment`, `activity_by`, `datentime`) VALUES
(1, 8586121748928019, 858612, 'LAN Generated', 'BS2', 1748928019),
(32, 8586121748928019, 858612, 'Interest Rate Updated', 'BS2', 1750247924),
(7, 8586121748928019, 858612, 'LAN Dispatch', 'BS2', 1749459757),
(34, 8586121748928019, 858612, 'Topup Amount Approved', 'BS2', 1750312799),
(35, 8586121748928019, 858612, 'Topup Amount Approved', 'BS2', 1750320281),
(36, 6141381750335196, 614138, 'LAN Generated', 'BS2', 1750335196),
(37, 6141381750335196, 614138, 'LAN Dispatch & Amount Disbursed', 'BS2', 1750336325),
(38, 6141381750335196, 614138, 'Topup Amount Approved', 'BS2', 1750404025),
(39, 6141381750335196, 614138, 'Interest Rate Updated', 'BS2', 1750411987),
(40, 4574861750762985, 457486, 'LAN Generated', 'BS2', 1750762985),
(78, 4574861750762985, 457486, 'Credit Limit Updated', 'BS2', 1751863508),
(33, 8586121748928019, 858612, 'Topup Amount Approved', 'BS2', 1750304860),
(76, 9205731751692639, 920573, 'LAN Generated', 'BS2', 1751692639),
(77, 9205731751692639, 920573, 'LAN Dispatch & Amount Disbursed', 'BS2', 1751718281),
(75, 4574861750762985, 457486, 'Topup Amount Approved', 'BS2', 1751259442),
(74, 4574861750762985, 457486, 'LAN Dispatch & Amount Disbursed', 'BS2', 1751258074),
(79, 6141381750335196, 614138, 'Credit Limit Updated', 'BS2', 1751869367),
(80, 9205731751692639, 920573, 'Credit Limit Updated', 'BS2', 1751888780),
(81, 1890531752559489, 189053, 'LAN Generated', 'BS2', 1752559489),
(84, 1890531752559489, 189053, 'LAN Dispatch & Amount Disbursed', 'BS2', 1752560144),
(85, 8586121748928019, 858612, 'Credit Limit Updated', 'BS2', 1752836171),
(86, 8586121748928019, 858612, 'Credit Limit Updated', 'BS2', 1752836651),
(87, 1890531752559489, 189053, 'Credit Limit Updated', 'BS2', 1752836752),
(88, 6299381753359494, 629938, 'LAN Generated', 'BS2', 1753359494),
(89, 6299381753359494, 629938, 'LAN Dispatch & Amount Disbursed', 'BS2', 1753359524),
(90, 6299381753359494, 629938, 'Topup Amount Approved', 'BS2', 1753417333),
(91, 6331321754281382, 633132, 'LAN Generated', 'BS2', 1754281382),
(92, 6331321754281382, 633132, 'LAN Dispatch & Amount Disbursed', 'BS2', 1754281539),
(93, 6331321754281382, 633132, 'Interest Rate Updated', 'BS2', 1754289260);

-- --------------------------------------------------------

--
-- Table structure for table `lan_audit_history`
--

DROP TABLE IF EXISTS `lan_audit_history`;
CREATE TABLE IF NOT EXISTS `lan_audit_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `lan` bigint NOT NULL,
  `lrn` int NOT NULL,
  `product_id` int NOT NULL,
  `required_loan_amount` bigint NOT NULL,
  `status_id` int NOT NULL,
  `cust_type` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `company_name` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `company_type` int NOT NULL,
  `company_doi` int NOT NULL,
  `company_turnover` bigint NOT NULL,
  `company_email` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `company_mobile` bigint NOT NULL,
  `company_address` varchar(3072) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `dob` int NOT NULL,
  `mobile` bigint NOT NULL,
  `alt_mobile` bigint NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `permanent_address` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `current_address` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `brief_note` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `guarantor_id` int NOT NULL,
  `introducer_id` int NOT NULL,
  `bank_account` int NOT NULL,
  `credit_limit` bigint NOT NULL,
  `approved_loan_amount` bigint NOT NULL,
  `payment_frequency` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `loan_tenure` int NOT NULL,
  `roi` int NOT NULL,
  `updation_remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `datentime` int NOT NULL,
  `updated_columns` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=94 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lan_audit_history`
--

INSERT INTO `lan_audit_history` (`id`, `lan`, `lrn`, `product_id`, `required_loan_amount`, `status_id`, `cust_type`, `name`, `company_name`, `company_type`, `company_doi`, `company_turnover`, `company_email`, `company_mobile`, `company_address`, `dob`, `mobile`, `alt_mobile`, `email`, `permanent_address`, `current_address`, `brief_note`, `guarantor_id`, `introducer_id`, `bank_account`, `credit_limit`, `approved_loan_amount`, `payment_frequency`, `loan_tenure`, `roi`, `updation_remark`, `datentime`, `updated_columns`) VALUES
(1, 8586121748928019, 858612, 2, 200000, 4, 2, 'Arpita Sinha', 'Arpita Traders', 4, 1743445800, 1000000, 'mgbafna1957@gmail.com', 1234567890, 'Moti Chamber Hebbal 560024 India', 631132200, 1452369870, 2563149870, 'arpitasinha@st.com', 'Hebbala', '#1 4th A Main road Vinayakanagar Bangalore 560024 India', 'No Note', 6, 1, 22, 0, 10000, 'Weekly', 10, 5, 'LAN Generated', 1748928019, ''),
(7, 8586121748928019, 858612, 2, 200000, 4, 2, 'Arpita Sinha', 'Arpita Traders', 4, 1743445800, 1000000, 'mgbafna1957@gmail.com', 1234567890, 'Moti Chamber Hebbal 560024 India', 631132200, 1452369870, 2563149870, 'arpitasinha@st.com', 'Hebbala', '#1 4th A Main road Vinayakanagar Bangalore 560024 India', 'No Note', 6, 1, 22, 0, 10000, 'Weekly', 10, 5, 'LAN Dispatched', 1749459757, ''),
(32, 8586121748928019, 858612, 2, 200000, 4, 2, 'Arpita Sinha', 'Arpita Traders', 4, 1743445800, 1000000, 'mgbafna1957@gmail.com', 1234567890, 'Moti Chamber Hebbal 560024 India', 631132200, 1452369870, 2563149870, 'arpitasinha@st.com', 'Hebbala', '#1 4th A Main road Vinayakanagar Bangalore 560024 India', 'No Note', 6, 1, 22, 0, 10000, 'Weekly', 10, 6, 'Interest Rate Updated', 1750247924, 'roi'),
(33, 8586121748928019, 858612, 2, 200000, 4, 2, 'Arpita Sinha', 'Arpita Traders', 4, 1743445800, 1000000, 'mgbafna1957@gmail.com', 1234567890, 'Moti Chamber Hebbal 560024 India', 631132200, 1452369870, 2563149870, 'arpitasinha@st.com', 'Hebbala', '#1 4th A Main road Vinayakanagar Bangalore 560024 India', 'No Note', 6, 1, 22, 0, 15000, 'Weekly', 10, 6, 'Topup Amount Approved', 1750304860, 'approved_loan_amount'),
(34, 8586121748928019, 858612, 2, 200000, 4, 2, 'Arpita Sinha', 'Arpita Traders', 4, 1743445800, 1000000, 'mgbafna1957@gmail.com', 1234567890, 'Moti Chamber Hebbal 560024 India', 631132200, 1452369870, 2563149870, 'arpitasinha@st.com', 'Hebbala', '#1 4th A Main road Vinayakanagar Bangalore 560024 India', 'No Note', 6, 1, 22, 0, 20000, 'Weekly', 10, 6, 'Topup Amount Approved', 1750312799, 'approved_loan_amount'),
(35, 8586121748928019, 858612, 2, 200000, 4, 2, 'Arpita Sinha', 'Arpita Traders', 4, 1743445800, 1000000, 'mgbafna1957@gmail.com', 1234567890, 'Moti Chamber Hebbal 560024 India', 631132200, 1452369870, 2563149870, 'arpitasinha@st.com', 'Hebbala', '#1 4th A Main road Vinayakanagar Bangalore 560024 India', 'No Note', 6, 1, 22, 0, 25000, 'Weekly', 10, 6, 'Topup Amount Approved', 1750320281, 'approved_loan_amount'),
(36, 6141381750335196, 614138, 1, 500000, 4, 2, 'Arpita Sinha', 'Arpita Traders', 4, 1743445800, 100000, 'mgbafna1957@gmail.com', 1234567890, 'Moti Chamber\r\nHebbal 560024', 631132200, 1452369870, 2563149870, 'arpitasinha@st.com', '#4 4th A Main road Vinayakanagar Bangalore 560024 India', '#4 4th A Main road Vinayakanagar Bangalore 560024 India', 'No Note', 9, 2, 22, 0, 100000, 'Yearly', 5, 10, 'LAN Generated', 1750335196, ''),
(37, 6141381750335196, 614138, 1, 500000, 4, 2, 'Arpita Sinha', 'Arpita Traders', 4, 1743445800, 100000, 'mgbafna1957@gmail.com', 1234567890, 'Moti Chamber\r\nHebbal 560024', 631132200, 1452369870, 2563149870, 'arpitasinha@st.com', '#4 4th A Main road Vinayakanagar Bangalore 560024 India', '#4 4th A Main road Vinayakanagar Bangalore 560024 India', 'No Note', 9, 2, 22, 0, 100000, 'Yearly', 5, 10, 'LAN Dispatched & Amount Disbursed', 1750336325, ''),
(38, 6141381750335196, 614138, 1, 500000, 4, 2, 'Arpita Sinha', 'Arpita Traders', 4, 1743445800, 100000, 'mgbafna1957@gmail.com', 1234567890, 'Moti Chamber\r\nHebbal 560024', 631132200, 1452369870, 2563149870, 'arpitasinha@st.com', '#4 4th A Main road Vinayakanagar Bangalore 560024 India', '#4 4th A Main road Vinayakanagar Bangalore 560024 India', 'No Note', 9, 2, 22, 0, 110000, 'Yearly', 5, 10, 'Topup Amount Approved', 1750404025, 'approved_loan_amount'),
(39, 6141381750335196, 614138, 1, 500000, 4, 2, 'Arpita Sinha', 'Arpita Traders', 4, 1743445800, 100000, 'mgbafna1957@gmail.com', 1234567890, 'Moti Chamber\r\nHebbal 560024', 631132200, 1452369870, 2563149870, 'arpitasinha@st.com', '#4 4th A Main road Vinayakanagar Bangalore 560024 India', '#4 4th A Main road Vinayakanagar Bangalore 560024 India', 'No Note', 9, 2, 22, 0, 110000, 'Yearly', 5, 5, 'Interest Rate Updated', 1750411987, 'roi'),
(40, 4574861750762985, 457486, 2, 1000000, 4, 2, 'Veeru Yadav', 'Veeru Corporation', 5, 1735669800, 500000, 'abctraders@test.com', 9876501235, 'Yeshwantpur North Bangalore India 560021', 631132200, 9922001236, 9922001236, 'veeru@st.com', 'Hebbal1', 'Hebbal', 'No Note', 8, 5, 20, 0, 500000, 'Monthly', 10, 4, 'LAN Generated', 1750762985, ''),
(74, 4574861750762985, 457486, 2, 1000000, 4, 2, 'Veeru Yadav', 'Veeru Corporation', 5, 1735669800, 500000, 'abctraders@test.com', 9876501235, 'Yeshwantpur North Bangalore India 560021', 631132200, 9922001236, 9922001236, 'veeru@st.com', 'Hebbal1', 'Hebbal', 'No Note', 8, 5, 20, 0, 500000, 'Monthly', 10, 4, 'LAN Dispatched & Amount Disbursed', 1751258074, ''),
(75, 4574861750762985, 457486, 2, 1000000, 4, 2, 'Veeru Yadav', 'Veeru Corporation', 5, 1735669800, 500000, 'abctraders@test.com', 9876501235, 'Yeshwantpur North Bangalore India 560021', 631132200, 9922001236, 9922001236, 'veeru@st.com', 'Hebbal1', 'Hebbal', 'No Note', 8, 5, 20, 0, 550000, 'Monthly', 10, 4, 'Topup Amount Approved', 1751259442, 'approved_loan_amount'),
(76, 9205731751692639, 920573, 1, 1000000, 4, 2, 'Arpita Sinha', 'Arpita Traders', 4, 1743445800, 100000, 'mgbafna1957@gmail.com', 1234567890, 'Moti Chamber\r\nHebbal 560024', 915129000, 1452369870, 2563149870, 'arpitasinha@st.com', 'Dwarka Sec 11\r\nDelhi', 'Dwarka Sec 11\r\nDelhi', 'No Note', 6, 6, 22, 840000, 700000, 'Weekly', 12, 6, 'LAN Generated', 1751692639, ''),
(77, 9205731751692639, 920573, 1, 1000000, 4, 2, 'Arpita Sinha', 'Arpita Traders', 4, 1743445800, 100000, 'mgbafna1957@gmail.com', 1234567890, 'Moti Chamber\r\nHebbal 560024', 915129000, 1452369870, 2563149870, 'arpitasinha@st.com', 'Dwarka Sec 11\r\nDelhi', 'Dwarka Sec 11\r\nDelhi', 'No Note', 6, 6, 22, 840000, 700000, 'Weekly', 12, 6, 'LAN Dispatched & Amount Disbursed', 1751718281, ''),
(78, 4574861750762985, 457486, 2, 1000000, 4, 2, 'Veeru Yadav', 'Veeru Corporation', 5, 1735669800, 500000, 'abctraders@test.com', 9876501235, 'Yeshwantpur North Bangalore India 560021', 631132200, 9922001236, 9922001236, 'veeru@st.com', 'Hebbal1', 'Hebbal', 'No Note', 8, 5, 20, 660000, 550000, 'Monthly', 10, 4, 'Credit Limit Updated', 1751863508, 'credit_limit'),
(79, 6141381750335196, 614138, 1, 500000, 4, 2, 'Arpita Sinha', 'Arpita Traders', 4, 1743445800, 100000, 'mgbafna1957@gmail.com', 1234567890, 'Moti Chamber\r\nHebbal 560024', 631132200, 1452369870, 2563149870, 'arpitasinha@st.com', '#4 4th A Main road Vinayakanagar Bangalore 560024 India', '#4 4th A Main road Vinayakanagar Bangalore 560024 India', 'No Note', 9, 2, 22, 850000, 110000, 'Yearly', 5, 5, 'Credit Limit Updated', 1751869367, 'credit_limit'),
(80, 9205731751692639, 920573, 1, 1000000, 4, 2, 'Arpita Sinha', 'Arpita Traders', 4, 1743445800, 100000, 'mgbafna1957@gmail.com', 1234567890, 'Moti Chamber\r\nHebbal 560024', 915129000, 1452369870, 2563149870, 'arpitasinha@st.com', 'Dwarka Sec 11\r\nDelhi', 'Dwarka Sec 11\r\nDelhi', 'No Note', 6, 6, 22, 900000, 700000, 'Weekly', 12, 6, 'Credit Limit Updated', 1751888780, 'credit_limit'),
(81, 1890531752559489, 189053, 2, 5000001, 4, 2, 'Arpita Sinha', 'Arpita Communicatios', 4, 1740767400, 100000, 'mgbafna1957@gmail.com', 1234567890, 'Moti Chamber\r\nHebbal 560024', 915129000, 1452369870, 2563149870, 'arpitasinha@st.com', '4th A Main Road Hebbala Bangaluru 560024', '4th A Main Road Hebbala Bangaluru 560024', 'No Note', 6, 2, 22, 900000, 500000, 'Weekly', 15, 5, 'LAN Generated', 1752559489, ''),
(84, 1890531752559489, 189053, 2, 5000001, 4, 2, 'Arpita Sinha', 'Arpita Communicatios', 4, 1740767400, 100000, 'mgbafna1957@gmail.com', 1234567890, 'Moti Chamber\r\nHebbal 560024', 915129000, 1452369870, 2563149870, 'arpitasinha@st.com', '4th A Main Road Hebbala Bangaluru 560024', '4th A Main Road Hebbala Bangaluru 560024', 'No Note', 6, 2, 22, 900000, 500000, 'Weekly', 15, 5, 'LAN Dispatched & Amount Disbursed', 1752560144, ''),
(85, 8586121748928019, 858612, 2, 200000, 4, 2, 'Arpita Sinha', 'Arpita Traders', 4, 1743445800, 1000000, 'mgbafna1957@gmail.com', 1234567890, 'Moti Chamber Hebbal 560024 India', 631132200, 1452369870, 2563149870, 'arpitasinha@st.com', 'Hebbala', '#1 4th A Main road Vinayakanagar Bangalore 560024 India', 'No Note', 6, 1, 22, 1500000, 25000, 'Weekly', 10, 6, 'Credit Limit Updated', 1752836171, 'credit_limit'),
(86, 8586121748928019, 858612, 2, 200000, 4, 2, 'Arpita Sinha', 'Arpita Traders', 4, 1743445800, 1000000, 'mgbafna1957@gmail.com', 1234567890, 'Moti Chamber Hebbal 560024 India', 631132200, 1452369870, 2563149870, 'arpitasinha@st.com', 'Hebbala', '#1 4th A Main road Vinayakanagar Bangalore 560024 India', 'No Note', 6, 1, 22, 1600000, 25000, 'Weekly', 10, 6, 'Credit Limit Updated', 1752836651, 'credit_limit'),
(87, 1890531752559489, 189053, 2, 5000001, 4, 2, 'Arpita Sinha', 'Arpita Communicatios', 4, 1740767400, 100000, 'mgbafna1957@gmail.com', 1234567890, 'Moti Chamber\r\nHebbal 560024', 915129000, 1452369870, 2563149870, 'arpitasinha@st.com', '4th A Main Road Hebbala Bangaluru 560024', '4th A Main Road Hebbala Bangaluru 560024', 'No Note', 6, 2, 22, 1700000, 500000, 'Weekly', 15, 5, 'Credit Limit Updated', 1752836752, 'credit_limit'),
(88, 6299381753359494, 629938, 1, 100000, 4, 1, 'Mamta', '', 0, 0, 0, '', 0, '', 946665000, 9922001346, 0, 'mamta@test.com', 'Hebbala Bangalore', 'Hebbala Bangalore', 'No Note', 10, 4, 23, 24000, 20000, 'Weekly', 10, 5, 'LAN Generated', 1753359494, ''),
(89, 6299381753359494, 629938, 1, 100000, 4, 1, 'Mamta', '', 0, 0, 0, '', 0, '', 946665000, 9922001346, 0, 'mamta@test.com', 'Hebbala Bangalore', 'Hebbala Bangalore', 'No Note', 10, 4, 23, 24000, 20000, 'Weekly', 10, 5, 'LAN Dispatched & Amount Disbursed', 1753359524, ''),
(90, 6299381753359494, 629938, 1, 100000, 4, 1, 'Mamta', '', 0, 0, 0, '', 0, '', 946665000, 9922001346, 0, 'mamta@test.com', 'Hebbala Bangalore', 'Hebbala Bangalore', 'No Note', 10, 4, 23, 24000, 30000, 'Weekly', 10, 5, 'Topup Amount Approved', 1753417333, 'approved_loan_amount'),
(91, 6331321754281382, 633132, 1, 100000, 4, 1, 'Mamta', '', 0, 0, 0, '', 0, '', 342210600, 9922001346, 9922001346, 'mamta@test.com', 'Hebbala Bangalore', 'Hebbala Bangalore', 'No Note', 10, 1, 23, 96000, 80000, 'Weekly', 10, 6, 'LAN Generated', 1754281382, ''),
(92, 6331321754281382, 633132, 1, 100000, 4, 1, 'Mamta', '', 0, 0, 0, '', 0, '', 342210600, 9922001346, 9922001346, 'mamta@test.com', 'Hebbala Bangalore', 'Hebbala Bangalore', 'No Note', 10, 1, 23, 96000, 80000, 'Weekly', 10, 6, 'LAN Dispatched & Amount Disbursed', 1754281539, ''),
(93, 6331321754281382, 633132, 1, 100000, 4, 1, 'Mamta', '', 0, 0, 0, '', 0, '', 342210600, 9922001346, 9922001346, 'mamta@test.com', 'Hebbala Bangalore', 'Hebbala Bangalore', 'No Note', 10, 1, 23, 96000, 80000, 'Weekly', 10, 6, 'Interest Rate Updated', 1754289260, 'roi');

-- --------------------------------------------------------

--
-- Table structure for table `lan_ledger_transactions`
--

DROP TABLE IF EXISTS `lan_ledger_transactions`;
CREATE TABLE IF NOT EXISTS `lan_ledger_transactions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `lan` bigint NOT NULL,
  `lrn` int NOT NULL,
  `crn` int NOT NULL,
  `amount` float NOT NULL,
  `remark` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `date` int NOT NULL,
  `type` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=675 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lan_ledger_transactions`
--

INSERT INTO `lan_ledger_transactions` (`id`, `lan`, `lrn`, `crn`, `amount`, `remark`, `date`, `type`) VALUES
(8, 8586121748928019, 858612, 1004, 500, 'Interest Debit', 1749493800, 0),
(7, 8586121748928019, 858612, 1004, 9800, 'Loan Amount Disbursed', 1748889000, 0),
(6, 8586121748928019, 858612, 1004, 200, 'Processing Fee Applied', 1748889000, 0),
(9, 8586121748928019, 858612, 1004, 500, 'Interest Debit', 1750098600, 0),
(10, 8586121748928019, 858612, 1004, 500, 'Interest Debit', 1750703400, 0),
(30, 8586121748928019, 858612, 1004, 600, 'Interest Debit', 1754937000, 0),
(29, 8586121748928019, 858612, 1004, 600, 'Interest Debit', 1754332200, 0),
(28, 8586121748928019, 858612, 1004, 600, 'Interest Debit', 1753727400, 0),
(27, 8586121748928019, 858612, 1004, 600, 'Interest Debit', 1753122600, 0),
(26, 8586121748928019, 858612, 1004, 600, 'Interest Debit', 1752517800, 0),
(25, 8586121748928019, 858612, 1004, 600, 'Interest Debit', 1751913000, 0),
(24, 8586121748928019, 858612, 1004, 600, 'Interest Debit', 1751308200, 0),
(18, 8586121748928019, 858612, 1004, 600, 'Customer Payment Received', 1749321000, 1),
(19, 8586121748928019, 858612, 1004, 300, 'Customer Payment Received', 1749407400, 1),
(21, 8586121748928019, 858612, 1004, 600, 'Customer Payment Received', 1749493800, 1),
(22, 8586121748928019, 858612, 1004, 700, 'Customer Payment Received', 1749666600, 1),
(23, 8586121748928019, 858612, 1004, 200, 'Interest Rate Updation Fee WEF 2025-06-30', 1750185000, 0),
(31, 8586121748928019, 858612, 1004, 700, 'Amount Adjusted After Interest Update', 1750185000, 0),
(32, 8586121748928019, 858612, 1004, 700, 'Amount Adjusted After Interest Update', 1750185000, 1),
(576, 9205731751692639, 920573, 1004, 42000, 'Interest Debit', 1758306600, 0),
(571, 9205731751692639, 920573, 1004, 42000, 'Interest Debit', 1755282600, 0),
(572, 9205731751692639, 920573, 1004, 42000, 'Interest Debit', 1755887400, 0),
(573, 9205731751692639, 920573, 1004, 42000, 'Interest Debit', 1756492200, 0),
(104, 6141381750335196, 614138, 1004, 200, 'Topup Processing Charges', 1750357800, 0),
(105, 6141381750335196, 614138, 1004, 9800, 'Topup Amount Disbursed', 1750357800, 0),
(575, 9205731751692639, 920573, 1004, 42000, 'Interest Debit', 1757701800, 0),
(574, 9205731751692639, 920573, 1004, 42000, 'Interest Debit', 1757097000, 0),
(116, 6141381750335196, 614138, 1004, 5500, 'Interest Debit', 1908037800, 0),
(115, 6141381750335196, 614138, 1004, 5500, 'Interest Debit', 1876501800, 0),
(114, 6141381750335196, 614138, 1004, 5500, 'Interest Debit', 1844965800, 0),
(113, 6141381750335196, 614138, 1004, 5500, 'Interest Debit', 1813343400, 0),
(112, 6141381750335196, 614138, 1004, 5500, 'Interest Debit', 1781807400, 0),
(97, 6141381750335196, 614138, 1004, 2000, 'Processing Fee Applied', 1750271400, 0),
(98, 6141381750335196, 614138, 1004, 98000, 'Loan Amount Disbursed', 1750271400, 0),
(95, 8586121748928019, 858612, 1004, 500, 'Interest on Topup', 1754937000, 0),
(94, 8586121748928019, 858612, 1004, 500, 'Interest on Topup', 1754332200, 0),
(93, 8586121748928019, 858612, 1004, 500, 'Interest on Topup', 1753727400, 0),
(92, 8586121748928019, 858612, 1004, 500, 'Interest on Topup', 1753122600, 0),
(91, 8586121748928019, 858612, 1004, 500, 'Interest on Topup', 1752517800, 0),
(90, 8586121748928019, 858612, 1004, 500, 'Interest on Topup', 1751913000, 0),
(89, 8586121748928019, 858612, 1004, 500, 'Interest on Topup', 1751308200, 0),
(88, 8586121748928019, 858612, 1004, 358, 'Remaining Days Interest on Topup', 1750703400, 0),
(87, 8586121748928019, 858612, 1004, 4900, 'Topup Amount Disbursed', 1750271400, 0),
(86, 8586121748928019, 858612, 1004, 100, 'Topup Processing Charges', 1750271400, 0),
(111, 6141381750335196, 614138, 1004, 2200, 'Interest Rate Updation Fee WEF 2025-12-30', 1750357800, 0),
(565, 9205731751692639, 920573, 1004, 686000, 'Loan Amount Disbursed', 1751653800, 0),
(566, 9205731751692639, 920573, 1004, 42000, 'Interest Debit', 1752258600, 0),
(567, 9205731751692639, 920573, 1004, 42000, 'Interest Debit', 1752863400, 0),
(568, 9205731751692639, 920573, 1004, 42000, 'Interest Debit', 1753468200, 0),
(569, 9205731751692639, 920573, 1004, 42000, 'Interest Debit', 1754073000, 0),
(570, 9205731751692639, 920573, 1004, 42000, 'Interest Debit', 1754677800, 0),
(562, 4574861750762985, 457486, 1001, 1500, 'Interest on Topup', 1776969000, 0),
(564, 9205731751692639, 920573, 1004, 14000, 'Processing Fee Applied', 1751653800, 0),
(561, 4574861750762985, 457486, 1001, 1500, 'Interest on Topup', 1774290600, 0),
(560, 4574861750762985, 457486, 1001, 1500, 'Interest on Topup', 1771871400, 0),
(559, 4574861750762985, 457486, 1001, 1500, 'Interest on Topup', 1769193000, 0),
(557, 4574861750762985, 457486, 1001, 1500, 'Interest on Topup', 1763922600, 0),
(558, 4574861750762985, 457486, 1001, 1500, 'Interest on Topup', 1766514600, 0),
(556, 4574861750762985, 457486, 1001, 1500, 'Interest on Topup', 1761244200, 0),
(555, 4574861750762985, 457486, 1001, 1500, 'Interest on Topup', 1758652200, 0),
(554, 4574861750762985, 457486, 1001, 1500, 'Interest on Topup', 1755973800, 0),
(550, 4574861750762985, 457486, 1001, 32000, 'Customer Payment Received', 1750789800, 1),
(551, 4574861750762985, 457486, 1001, 1000, 'Topup Processing Charges', 1751221800, 0),
(552, 4574861750762985, 457486, 1001, 49000, 'Topup Amount Disbursed', 1751221800, 0),
(553, 4574861750762985, 457486, 1001, 1200, 'Remaining Days Interest on Topup', 1753295400, 0),
(549, 4574861750762985, 457486, 1001, 20000, 'Interest Debit', 1776969000, 0),
(548, 4574861750762985, 457486, 1001, 20000, 'Interest Debit', 1774290600, 0),
(547, 4574861750762985, 457486, 1001, 20000, 'Interest Debit', 1771871400, 0),
(546, 4574861750762985, 457486, 1001, 20000, 'Interest Debit', 1769193000, 0),
(545, 4574861750762985, 457486, 1001, 20000, 'Interest Debit', 1766514600, 0),
(544, 4574861750762985, 457486, 1001, 20000, 'Interest Debit', 1763922600, 0),
(543, 4574861750762985, 457486, 1001, 20000, 'Interest Debit', 1761244200, 0),
(542, 4574861750762985, 457486, 1001, 20000, 'Interest Debit', 1758652200, 0),
(541, 4574861750762985, 457486, 1001, 20000, 'Interest Debit', 1755973800, 0),
(540, 4574861750762985, 457486, 1001, 20000, 'Interest Debit', 1753295400, 0),
(538, 4574861750762985, 457486, 1001, 10000, 'Processing Fee Applied', 1750703400, 0),
(539, 4574861750762985, 457486, 1001, 490000, 'Loan Amount Disbursed', 1750703400, 0),
(577, 9205731751692639, 920573, 1004, 42000, 'Interest Debit', 1758911400, 0),
(578, 8586121748928019, 858612, 1004, 150, 'Customer Payment Received', 1751653800, 1),
(637, 6299381753359494, 629938, 1016, 1000, 'Interest Debit', 1757529000, 0),
(636, 6299381753359494, 629938, 1016, 1000, 'Interest Debit', 1756924200, 0),
(635, 6299381753359494, 629938, 1016, 1000, 'Interest Debit', 1756319400, 0),
(634, 6299381753359494, 629938, 1016, 1000, 'Interest Debit', 1755714600, 0),
(633, 6299381753359494, 629938, 1016, 1000, 'Interest Debit', 1755109800, 0),
(632, 6299381753359494, 629938, 1016, 1000, 'Interest Debit', 1754505000, 0),
(631, 6299381753359494, 629938, 1016, 1000, 'Interest Debit', 1753900200, 0),
(630, 6299381753359494, 629938, 1016, 19500, 'Loan Amount Disbursed', 1753295400, 0),
(629, 6299381753359494, 629938, 1016, 500, 'Processing Fee Applied', 1753295400, 0),
(628, 1890531752559489, 189053, 1004, 40000, 'Customer Payment Received', 1752517800, 1),
(627, 1890531752559489, 189053, 1004, 25000, 'Interest Debit', 1761589800, 0),
(626, 1890531752559489, 189053, 1004, 25000, 'Interest Debit', 1760985000, 0),
(625, 1890531752559489, 189053, 1004, 25000, 'Interest Debit', 1760380200, 0),
(624, 1890531752559489, 189053, 1004, 25000, 'Interest Debit', 1759775400, 0),
(623, 1890531752559489, 189053, 1004, 25000, 'Interest Debit', 1759170600, 0),
(622, 1890531752559489, 189053, 1004, 25000, 'Interest Debit', 1758565800, 0),
(621, 1890531752559489, 189053, 1004, 25000, 'Interest Debit', 1757961000, 0),
(620, 1890531752559489, 189053, 1004, 25000, 'Interest Debit', 1757356200, 0),
(619, 1890531752559489, 189053, 1004, 25000, 'Interest Debit', 1756751400, 0),
(618, 1890531752559489, 189053, 1004, 25000, 'Interest Debit', 1756146600, 0),
(617, 1890531752559489, 189053, 1004, 25000, 'Interest Debit', 1755541800, 0),
(616, 1890531752559489, 189053, 1004, 25000, 'Interest Debit', 1754937000, 0),
(615, 1890531752559489, 189053, 1004, 25000, 'Interest Debit', 1754332200, 0),
(614, 1890531752559489, 189053, 1004, 25000, 'Interest Debit', 1753727400, 0),
(613, 1890531752559489, 189053, 1004, 25000, 'Interest Debit', 1753122600, 0),
(612, 1890531752559489, 189053, 1004, 490000, 'Loan Amount Disbursed', 1752517800, 0),
(611, 1890531752559489, 189053, 1004, 10000, 'Processing Fee Applied', 1752517800, 0),
(638, 6299381753359494, 629938, 1016, 1000, 'Interest Debit', 1758133800, 0),
(639, 6299381753359494, 629938, 1016, 1000, 'Interest Debit', 1758738600, 0),
(640, 6299381753359494, 629938, 1016, 1000, 'Interest Debit', 1759343400, 0),
(641, 6299381753359494, 629938, 1016, 350, 'Topup Processing Charges', 1753381800, 0),
(642, 6299381753359494, 629938, 1016, 9650, 'Topup Amount Disbursed', 1753381800, 0),
(643, 6299381753359494, 629938, 1016, 516, 'Remaining Days Interest on Topup', 1753900200, 0),
(644, 6299381753359494, 629938, 1016, 600, 'Interest on Topup', 1754505000, 0),
(645, 6299381753359494, 629938, 1016, 600, 'Interest on Topup', 1755109800, 0),
(646, 6299381753359494, 629938, 1016, 600, 'Interest on Topup', 1755714600, 0),
(647, 6299381753359494, 629938, 1016, 600, 'Interest on Topup', 1756319400, 0),
(648, 6299381753359494, 629938, 1016, 600, 'Interest on Topup', 1756924200, 0),
(649, 6299381753359494, 629938, 1016, 600, 'Interest on Topup', 1757529000, 0),
(650, 6299381753359494, 629938, 1016, 600, 'Interest on Topup', 1758133800, 0),
(651, 6299381753359494, 629938, 1016, 600, 'Interest on Topup', 1758738600, 0),
(652, 6299381753359494, 629938, 1016, 600, 'Interest on Topup', 1759343400, 0),
(653, 6331321754281382, 633132, 1016, 2000, 'Processing Fee Applied', 1754245800, 0),
(654, 6331321754281382, 633132, 1016, 78000, 'Loan Amount Disbursed', 1754245800, 0),
(655, 6331321754281382, 633132, 1016, 4800, 'Interest Debit', 1754850600, 0),
(674, 6331321754281382, 633132, 1016, 4400, 'Interest Debit', 1760293800, 0),
(673, 6331321754281382, 633132, 1016, 4400, 'Interest Debit', 1759689000, 0),
(672, 6331321754281382, 633132, 1016, 4400, 'Interest Debit', 1759084200, 0),
(671, 6331321754281382, 633132, 1016, 4400, 'Interest Debit', 1758479400, 0),
(670, 6331321754281382, 633132, 1016, 4400, 'Interest Debit', 1757874600, 0),
(669, 6331321754281382, 633132, 1016, 4400, 'Interest Debit', 1757269800, 0),
(668, 6331321754281382, 633132, 1016, 4400, 'Interest Debit', 1756665000, 0),
(667, 6331321754281382, 633132, 1016, 4400, 'Interest Debit', 1756060200, 0),
(666, 6331321754281382, 633132, 1016, 4400, 'Interest Debit', 1755455400, 0),
(665, 6331321754281382, 633132, 1016, 2000, 'Interest Rate Updation Fee WEF 2025-08-14', 1754245800, 0);

-- --------------------------------------------------------

--
-- Table structure for table `lan_list`
--

DROP TABLE IF EXISTS `lan_list`;
CREATE TABLE IF NOT EXISTS `lan_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `lan` bigint NOT NULL,
  `lrn` int NOT NULL,
  `product_id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `company_name` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `mobile` bigint NOT NULL,
  `alt_mobile` bigint NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `approved_loan_amount` bigint NOT NULL,
  `payment_frequency` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `loan_tenure` int NOT NULL,
  `roi` int NOT NULL,
  `paid_amount` float NOT NULL,
  `due_balance` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lan_list`
--

INSERT INTO `lan_list` (`id`, `lan`, `lrn`, `product_id`, `name`, `company_name`, `mobile`, `alt_mobile`, `email`, `approved_loan_amount`, `payment_frequency`, `loan_tenure`, `roi`, `paid_amount`, `due_balance`) VALUES
(1, 8586121748928019, 858612, 2, 'Arpita Sinha', 'Arpita Traders', 1452369870, 2563149870, 'arpitasinha@st.com', 25000, 'Weekly', 10, 6, 0, 0),
(2, 6141381750335196, 614138, 1, 'Arpita Sinha', 'Arpita Traders', 1452369870, 2563149870, 'arpitasinha@st.com', 110000, 'Yearly', 5, 5, 0, 0),
(3, 4574861750762985, 457486, 2, 'Veeru Yadav', 'Veeru Corporation', 9922001236, 9922001236, 'veeru@st.com', 550000, 'Monthly', 10, 4, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `lan_processing_charges_list`
--

DROP TABLE IF EXISTS `lan_processing_charges_list`;
CREATE TABLE IF NOT EXISTS `lan_processing_charges_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `lan` bigint NOT NULL,
  `amount` float NOT NULL,
  `remark` varchar(5120) COLLATE utf8mb4_general_ci NOT NULL,
  `applied_on` int NOT NULL,
  `waived_on` int NOT NULL,
  `status` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lan_processing_charges_list`
--

INSERT INTO `lan_processing_charges_list` (`id`, `lan`, `amount`, `remark`, `applied_on`, `waived_on`, `status`) VALUES
(1, 8586121748928019, 200, 'Processing Fee Applied', 1748889000, 0, 0),
(2, 8586121748928019, 100, 'Topup Processing Charges', 1750271400, 0, 0),
(3, 8586121748928019, 200, 'Interest Rate Updation Fee WEF 2025-06-30', 1750185000, 0, 0),
(4, 6141381750335196, 2000, 'Processing Fee Applied', 1750271400, 0, 0),
(5, 6141381750335196, 200, 'Topup Processing Charges', 1750357800, 0, 0),
(6, 6141381750335196, 2200, 'Interest Rate Updation Fee WEF 2025-12-30', 1750357800, 0, 0),
(57, 6331321754281382, 2000, 'Interest Rate Updation Fee WEF 2025-08-14', 1754245800, 0, 0),
(56, 6331321754281382, 2000, 'Processing Fee Applied', 1754245800, 0, 0),
(54, 6299381753359494, 500, 'Processing Fee Applied', 1753295400, 0, 0),
(55, 6299381753359494, 350, 'Topup Processing Charges', 1753381800, 0, 0),
(53, 1890531752559489, 10000, 'Processing Fee Applied', 1752517800, 0, 0),
(49, 4574861750762985, 1000, 'Topup Processing Charges', 1751221800, 0, 0),
(50, 9205731751692639, 14000, 'Processing Fee Applied', 1751653800, 0, 0),
(48, 4574861750762985, 10000, 'Processing Fee Applied', 1750703400, 0, 0);

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
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lead_status_list`
--

INSERT INTO `lead_status_list` (`id`, `description`, `step_order`, `batch_id`, `datentime`) VALUES
(1, 'New', 1, 1, 1744977988),
(2, 'In Verification', 2, 1, 1744977988),
(3, 'Verified', 3, 1, 1744977988),
(4, 'Approved', 4, 1, 1744977988),
(6, 'Deleted', 999, 1, 1744977988),
(7, 'LRN Rejected', 888, 1, 1744977988),
(8, 'Customer Rejected', 777, 1, 1744977988);

-- --------------------------------------------------------

--
-- Table structure for table `logged_user_list`
--

DROP TABLE IF EXISTS `logged_user_list`;
CREATE TABLE IF NOT EXISTS `logged_user_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_ref_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=271 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `logged_user_list`
--

INSERT INTO `logged_user_list` (`id`, `user_ref_id`) VALUES
(223, 'CR1001'),
(227, 'CR1001'),
(228, 'BS10'),
(229, 'CR1002'),
(231, 'CR1016'),
(234, 'BS10'),
(241, 'CR1001'),
(242, 'BS10'),
(244, 'CR1001'),
(270, 'BS2');

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
) ENGINE=MyISAM AUTO_INCREMENT=137 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `login_detail`
--

INSERT INTO `login_detail` (`id`, `ref_id`, `username`, `password`, `login_type`, `status`) VALUES
(1, 'BS1', 'admin', '@dmin', 7, 1),
(127, 'CR1007', 'sarvesh@st.com', '123456', 5, 1),
(32, 'BS2', 'yogesh@bafna.net', '12345', 1, 1),
(37, 'BS8', 'manish@bafna.net', '123456', 3, 1),
(57, 'BS10', 'amit@moticorporation.com', '123456', 8, 1),
(128, 'CR1008', 'sumita@st.com', '123456', 5, 1),
(129, 'CR1009', 'rachita@st.com', '123456', 5, 1),
(130, 'CR1010', 'raghav@test.com', '123456', 5, 1),
(131, 'CR1011', 'veeru@test.com', '123456', 5, 1),
(132, 'CR1012', 'arpita@test.com', '123456', 5, 1),
(133, 'CR1013', 'nimilphilip@gmail.com', '123456', 5, 1),
(134, 'CR1014', 'nimilphilipzoo@gmail.com', '123456', 5, 1),
(135, 'CR1015', 'sarvesh@test.com', '123456', 5, 1),
(136, 'CR1016', 'mamta@test.com', '123456', 5, 1),
(121, 'CR1001', 'veeru@cr.com', '123456', 5, 1),
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
(5, 'Customer', 11),
(7, 'Super Admin', 11),
(8, 'Management', 11),
(9, 'Portal Visitor', 11);

-- --------------------------------------------------------

--
-- Table structure for table `lrn_activity_history`
--

DROP TABLE IF EXISTS `lrn_activity_history`;
CREATE TABLE IF NOT EXISTS `lrn_activity_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `lrn` int NOT NULL,
  `status_id` int NOT NULL,
  `comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `activity_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `datentime` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=221 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lrn_activity_history`
--

INSERT INTO `lrn_activity_history` (`id`, `lrn`, `status_id`, `comment`, `activity_by`, `datentime`) VALUES
(4, 884042, 1, 'LRN Created', 'BS2', 1745210504),
(5, 884042, 1, 'Mobile, DOB, Current Address, Brief Note Updated', 'BS2', 1745231329),
(6, 884042, 1, 'Mobile Updated', 'BS2', 1745231509),
(7, 884042, 1, 'Alt Mobile updated', 'BS2', 1745231708),
(8, 884042, 1, 'DOB, Both Address, Type Updated', 'BS2', 1745233163),
(9, 884042, 1, 'Guarantor Added', 'BS2', 1745237991),
(10, 884042, 1, 'Guarantor Updated', 'BS2', 1745238492),
(15, 884042, 1, 'Loan Details Updated', 'BS2', 1745301957),
(13, 884042, 1, 'Loan Details Added', 'BS2', 1745301537),
(14, 884042, 1, 'Loan Details Updated', 'BS2', 1745301660),
(16, 884042, 1, 'Mobile, DOB,Brief Note Updated', 'BS2', 1745302230),
(17, 884042, 1, 'Guarantor Updated', 'BS2', 1745302322),
(18, 884042, 1, 'Loan Details Updated', 'BS2', 1745303744),
(19, 884042, 1, 'DOB Updated', 'BS2', 1745319471),
(20, 884042, 1, 'Documents Uploaded', 'BS2', 1745323669),
(21, 884042, 1, 'Documents Uploaded', 'BS2', 1745324138),
(22, 884042, 1, 'Documents Uploaded', 'BS2', 1745324252),
(23, 884042, 1, 'Loan Details Updated', 'BS2', 1745380251),
(24, 884042, 1, 'Name Updated', 'BS2', 1745381570),
(25, 884042, 1, 'Documents Uploaded', 'BS2', 1745838198),
(26, 884042, 1, 'Type Updated', 'BS2', 1745841561),
(27, 884042, 1, 'Type Updated', 'BS2', 1745841675),
(28, 884042, 1, 'Loan Details Updated', 'BS2', 1745841815),
(29, 884042, 1, 'Loan Details Updated', 'BS2', 1745841826),
(30, 884042, 1, 'Guarantor Updated', 'BS2', 1745841838),
(31, 884042, 1, 'DOB Updated', 'BS2', 1746096358),
(32, 884042, 1, 'fsdfsdafsaf', 'BS2', 1746102614),
(33, 884042, 1, 'company email added', 'BS2', 1746157722),
(34, 884042, 1, 'Company Type Updated', 'BS2', 1746158380),
(35, 884042, 1, 'Customer Type Updated for testing', 'BS2', 1746159254),
(36, 884042, 1, 'Customer Type Updated for testing', 'BS2', 1746159952),
(37, 884042, 1, 'testing', 'BS2', 1746160441),
(38, 884042, 1, 'testing', 'BS2', 1746160458),
(39, 884042, 1, 'Guarantor Updated', 'BS2', 1746161770),
(40, 884042, 1, 'Company Name Updated', 'BS2', 1746162651),
(41, 884042, 1, 'Loan Details Updated', 'BS2', 1746180678),
(42, 884042, 1, 'Loan Details Updated', 'BS2', 1746180879),
(43, 884042, 1, 'Loan Details Updated', 'BS2', 1746184326),
(44, 884042, 1, 'Loan Amount Updated', 'BS2', 1746184914),
(45, 884042, 1, 'test', 'BS2', 1746186044),
(46, 884042, 1, 'Product, Amount & Introducer Updated', 'BS2', 1746186515),
(47, 884042, 1, 'Loan Details Updated', 'BS2', 1746187211),
(48, 884042, 1, 'Bank Account Added', 'BS2', 1746189247),
(49, 884042, 1, 'Bank Account Updated', 'BS2', 1746269860),
(50, 884042, 1, 'Bank Account Updated', 'BS2', 1746271661),
(53, 535694, 1, 'LRN Created', 'BS2', 1746428594),
(54, 535694, 1, 'Guarantor Added', 'BS2', 1746429380),
(55, 962388, 1, 'LRN Created', 'BS2', 1746435397),
(56, 854764, 1, 'LRN Created', 'BS2', 1746435419),
(57, 383568, 1, 'LRN Created', 'BS2', 1746435526),
(58, 535694, 1, 'Product, Loan Amount, Introducer Added', 'BS2', 1746436397),
(59, 858612, 1, 'LRN Created', 'BS2', 1746442752),
(60, 535694, 1, 'DOB & Current Address Updated', 'BS2', 1746528799),
(62, 535694, 1, 'DOB Updated', 'BS2', 1746529468),
(63, 535694, 1, 'Company DOI Updated', 'BS2', 1746530291),
(64, 535694, 1, 'Customer wants callback', 'BS2', 1746590644),
(65, 535694, 1, 'testing', 'BS2', 1746591041),
(66, 535694, 1, 'testing', 'BS2', 1746591311),
(67, 535694, 1, 'testing', 'BS2', 1746591336),
(68, 535694, 1, 'test', 'BS2', 1746591780),
(69, 535694, 1, 'DOB Updated', 'BS2', 1746592267),
(72, 535694, 1, 'Loan Amount Updated', 'BS2', 1746593730),
(71, 535694, 1, 'DOB Updated', 'BS2', 1746593081),
(73, 535694, 1, 'Company Annual Turnover Updated', 'BS2', 1746593962),
(74, 858612, 1, 'Annual Turover & Address Updated', 'BS2', 1746596210),
(75, 858612, 1, 'Guarantor Added', 'BS2', 1746596417),
(76, 858612, 1, 'Product, Loan Amount, Introducer Added', 'BS2', 1746596723),
(77, 858612, 1, 'Current Address, Permanent Address Updated', 'BS2', 1746597630),
(78, 858612, 1, 'DOB Updated', 'BS2', 1746597810),
(79, 189053, 1, 'LRN Created', 'BS2', 1747719345),
(80, 189053, 1, 'Customer want callback on 3.30 PM', 'BS2', 1747731990),
(81, 189053, 1, 'Guarantor Added', 'BS2', 1747732936),
(82, 189053, 1, 'Company Name, DOI updated', 'BS2', 1747733101),
(83, 189053, 1, 'Both Address, DOB Updated', 'BS2', 1747733207),
(84, 189053, 1, 'Guarantor Updated', 'BS2', 1747734596),
(85, 189053, 1, 'Loan Details added', 'BS2', 1747734659),
(86, 920573, 1, 'LRN Created', 'BS2', 1747740451),
(88, 914948, 1, 'LRN Created', 'BS2', 1747809854),
(89, 457486, 1, 'LRN Created', 'BS2', 1747811557),
(90, 308829, 1, 'LRN Created', 'BS2', 1747811591),
(91, 614138, 1, 'LRN Created', 'BS2', 1747812194),
(92, 614138, 1, 'Documents Uploaded', 'BS2', 1747812703),
(93, 614138, 1, 'Guarantor Added', 'BS2', 1747908125),
(94, 614138, 1, 'Documents Uploaded', 'BS2', 1747982890),
(95, 614138, 1, 'Documents Uploaded', 'BS2', 1747985466),
(96, 614138, 1, 'Documents Uploaded', 'BS2', 1747985874),
(97, 614138, 1, 'Documents Uploaded', 'BS2', 1747986362),
(98, 614138, 1, 'Documents Uploaded', 'BS2', 1747994553),
(99, 457486, 1, 'Documents Uploaded', 'BS2', 1747994721),
(103, 858612, 2, 'Move to In Verification', 'BS2', 1748073023),
(104, 614138, 1, 'Documents Uploaded', 'BS2', 1748079270),
(105, 614138, 1, 'Documents Uploaded', 'BS2', 1748079280),
(106, 614138, 2, 'Move to In Verification', 'BS2', 1748082394),
(107, 614138, 2, 'Documents Uploaded', 'BS2', 1748082416),
(108, 614138, 2, 'Documents Uploaded', 'BS2', 1748084882),
(109, 614138, 2, 'DOB, Both Address Updated', 'BS2', 1748085177),
(110, 614138, 2, 'Loan Details Updated', 'BS2', 1748085217),
(111, 614138, 3, 'All Documents & detail has verified.', 'BS2', 1748085775),
(112, 854764, 6, 'Customer Not Interested', 'BS2', 1748089599),
(113, 383568, 7, 'Not Eligible', 'BS2', 1748318709),
(114, 914948, 8, 'Customer not interested', 'BS2', 1748319261),
(116, 614138, 3, 'Agreement Generated', 'BS2', 1748342584),
(119, 614138, 3, 'Customer Signed Agreement Uploaded', 'BS2', 1748411498),
(120, 457486, 1, 'Documents Uploaded', 'BS2', 1748423906),
(121, 457486, 1, 'Documents Uploaded', 'BS2', 1748428183),
(122, 457486, 1, 'Documents Uploaded', 'BS2', 1748428282),
(123, 457486, 1, 'Documents Uploaded', 'BS2', 1748429118),
(124, 457486, 1, 'Documents Uploaded', 'BS2', 1748430083),
(125, 457486, 1, 'Documents Uploaded', 'BS2', 1748430156),
(126, 457486, 1, 'Documents Uploaded', 'BS2', 1748432992),
(127, 457486, 1, 'Documents Uploaded', 'BS2', 1748433122),
(128, 457486, 1, 'DOB, Current Address Updated', 'BS2', 1748493970),
(132, 457486, 1, 'Permanent Address Updated', 'BS2', 1748501623),
(133, 457486, 1, 'Company Address Updated', 'BS2', 1748510198),
(137, 457486, 1, 'Company Address Updated', 'BS2', 1748512528),
(138, 457486, 1, 'Customer Changed to Individual', 'BS2', 1748514994),
(139, 457486, 1, 'Type updated to corporate', 'BS2', 1748516287),
(140, 457486, 1, 'Updated to Individual', 'BS2', 1748516367),
(141, 189053, 1, 'Bank Account Updated', 'BS2', 1748518073),
(143, 189053, 1, 'Guarantor Updated', 'BS2', 1748520305),
(144, 189053, 1, 'Guarantor Updated', 'BS2', 1748520355),
(145, 457486, 1, 'Guarantor Added', 'BS2', 1748520720),
(146, 189053, 1, 'Requested Loan Amount Updated', 'BS2', 1748521370),
(147, 189053, 1, 'Introducer Updated', 'BS2', 1748521629),
(148, 189053, 1, 'Product, Introducer Updated', 'BS2', 1748577656),
(149, 457486, 1, 'Documents Uploaded', 'BS2', 1748584598),
(150, 457486, 1, 'Loan Details Added', 'BS2', 1748584730),
(151, 457486, 1, 'Customer Type Updated to Corporate', 'BS2', 1748584840),
(152, 858612, 2, 'Guarantor Updated', 'BS2', 1748585934),
(153, 858612, 2, 'Guarantor Updated', 'BS2', 1748586266),
(154, 858612, 2, 'Bank Account Updated', 'BS2', 1748589272),
(155, 858612, 2, 'Company Address Updated', 'BS2', 1748589642),
(156, 457486, 1, 'Product Updated', 'BS2', 1748590323),
(157, 457486, 1, 'Documents Uploaded', 'BS2', 1748590360),
(158, 457486, 1, 'Name Updated', 'BS2', 1748590403),
(159, 858612, 2, 'Guarantor Updated', 'BS2', 1748602675),
(160, 858612, 2, 'Documents Uploaded', 'BS2', 1748664260),
(161, 858612, 2, 'Documents Uploaded', 'BS2', 1748664295),
(162, 858612, 3, 'All details & documents verified', 'BS2', 1748664611),
(163, 858612, 3, 'Agreement Generated', 'BS2', 1748664664),
(164, 858612, 3, 'Customer Signed Agreement Uploaded', 'BS2', 1748669134),
(165, 920573, 1, 'Guarantor Added', 'BS2', 1748675654),
(169, 858612, 4, 'LRN Approved & LAN Generated', 'BS2', 1748928019),
(167, 457486, 2, 'Send to Verification Process', 'BS2', 1748694072),
(170, 614138, 4, 'LRN Approved & LAN Generated', 'BS2', 1750335196),
(171, 457486, 3, 'Documents Verified', 'BS2', 1750762799),
(172, 457486, 3, 'Agreement Generated', 'BS2', 1750762860),
(173, 457486, 3, 'Customer Signed Agreement Uploaded', 'BS2', 1750762929),
(174, 457486, 4, 'LRN Approved & LAN Generated', 'BS2', 1750762985),
(177, 920573, 1, 'DOB, Both Address Updated', 'BS2', 1751626742),
(178, 920573, 1, 'Loan Details Added', 'BS2', 1751627031),
(179, 920573, 2, 'LRN Verified', 'BS2', 1751627160),
(180, 920573, 2, 'Documents Uploaded', 'BS2', 1751627253),
(181, 920573, 3, 'Approved', 'BS2', 1751627322),
(182, 920573, 3, 'Agreement Generated', 'BS2', 1751688094),
(183, 920573, 3, 'Customer Signed Agreement Uploaded', 'BS2', 1751688171),
(184, 920573, 4, 'LRN Approved & LAN Generated', 'BS2', 1751692639),
(185, 189053, 1, 'Guarantor Updated', 'BS2', 1751890378),
(186, 189053, 1, 'Bank Account Updated', 'BS2', 1751890404),
(187, 189053, 2, 'Sent for verification', 'BS2', 1752558978),
(188, 189053, 2, 'Documents Uploaded', 'BS2', 1752559386),
(189, 189053, 3, 'All documents has verified', 'BS2', 1752559409),
(190, 189053, 3, 'Agreement Generated', 'BS2', 1752559437),
(191, 189053, 3, 'Customer Signed Agreement Uploaded', 'BS2', 1752559467),
(192, 189053, 4, 'LRN Approved & LAN Generated', 'BS2', 1752559489),
(193, 255669, 1, 'LRN Created', 'BS2', 1752578352),
(194, 562286, 1, 'LRN Created', 'BS2', 1752578442),
(195, 136371, 1, 'LRN Created', 'BS2', 1752578467),
(196, 629938, 1, 'LRN Created', 'BS2', 1752578574),
(197, 629938, 2, 'Sent to Verification', 'BS2', 1752578926),
(198, 629938, 2, 'Loan Detail Added', 'BS2', 1752579019),
(199, 629938, 2, 'Guarantor Added', 'BS2', 1752580574),
(200, 308829, 1, 'DOB, Both Address Updated', 'BS10', 1752830056),
(202, 633132, 1, 'LRN Created', 'BS2', 1753069796),
(203, 633132, 1, 'Documents Uploaded', 'BS2', 1753069962),
(204, 629938, 2, 'DOB  & Both Address Updated', 'BS2', 1753359195),
(205, 629938, 2, 'Documents Uploaded', 'BS2', 1753359276),
(206, 629938, 3, 'All document has verified', 'BS2', 1753359324),
(207, 629938, 3, 'Agreement Generated', 'BS2', 1753359388),
(208, 629938, 3, 'Customer Signed Agreement Uploaded', 'BS2', 1753359433),
(209, 629938, 4, 'Customer Signed Agreement Verified & LRN Approved & LAN Generated', 'BS2', 1753359494),
(210, 633132, 2, 'Send to verification', 'BS2', 1754280684),
(211, 633132, 2, 'DOB, Alt mobile & both address updated', 'BS2', 1754280770),
(212, 633132, 2, 'Loan details added', 'BS2', 1754280825),
(213, 633132, 2, 'Guarantor Added', 'BS2', 1754280836),
(214, 633132, 2, 'Documents Uploaded', 'BS2', 1754280911),
(215, 633132, 2, 'Documents Uploaded', 'BS2', 1754281099),
(216, 633132, 3, 'All details and documents has verified', 'BS2', 1754281157),
(217, 633132, 3, 'Agreement Generated', 'BS2', 1754281208),
(218, 633132, 3, 'Customer Signed Agreement Uploaded', 'BS2', 1754281308),
(219, 633132, 4, 'LRN Approved & LAN Generated', 'BS2', 1754281382);

-- --------------------------------------------------------

--
-- Table structure for table `lrn_agreements_list`
--

DROP TABLE IF EXISTS `lrn_agreements_list`;
CREATE TABLE IF NOT EXISTS `lrn_agreements_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `lrn` int NOT NULL,
  `agreement_id` bigint NOT NULL,
  `datentime` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lrn_agreements_list`
--

INSERT INTO `lrn_agreements_list` (`id`, `lrn`, `agreement_id`, `datentime`) VALUES
(8, 920573, 9205731751688094, 1751688094),
(7, 457486, 4574861750762860, 1750762860),
(6, 858612, 8586121748664664, 1748664664),
(4, 614138, 6141381748342584, 1748342584),
(9, 189053, 1890531752559437, 1752559437),
(10, 629938, 6299381753359388, 1753359388),
(11, 633132, 6331321754281208, 1754281208);

-- --------------------------------------------------------

--
-- Table structure for table `lrn_allocation_list`
--

DROP TABLE IF EXISTS `lrn_allocation_list`;
CREATE TABLE IF NOT EXISTS `lrn_allocation_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `lrn` int NOT NULL,
  `allocated_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `datentime` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lrn_audit_history`
--

DROP TABLE IF EXISTS `lrn_audit_history`;
CREATE TABLE IF NOT EXISTS `lrn_audit_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `lrn` int NOT NULL,
  `product_id` int NOT NULL,
  `required_loan_amount` bigint NOT NULL,
  `status_id` int NOT NULL,
  `cust_type` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `company_name` varchar(1024) COLLATE utf8mb4_general_ci NOT NULL,
  `company_type` int NOT NULL,
  `company_doi` int NOT NULL,
  `company_turnover` bigint NOT NULL,
  `company_email` varchar(1024) COLLATE utf8mb4_general_ci NOT NULL,
  `company_mobile` bigint NOT NULL,
  `company_address` varchar(3072) COLLATE utf8mb4_general_ci NOT NULL,
  `dob` int NOT NULL,
  `mobile` bigint NOT NULL,
  `alt_mobile` bigint NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `permanent_address` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `current_address` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `brief_note` varchar(1024) COLLATE utf8mb4_general_ci NOT NULL,
  `guarantor_id` int NOT NULL,
  `introducer_id` int NOT NULL,
  `bank_account` int NOT NULL,
  `approved_loan_amount` bigint NOT NULL,
  `payment_frequency` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `loan_tenure` int NOT NULL,
  `roi` int NOT NULL,
  `updation_remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `datentime` int NOT NULL,
  `updated_columns` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=208 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lrn_audit_history`
--

INSERT INTO `lrn_audit_history` (`id`, `lrn`, `product_id`, `required_loan_amount`, `status_id`, `cust_type`, `name`, `company_name`, `company_type`, `company_doi`, `company_turnover`, `company_email`, `company_mobile`, `company_address`, `dob`, `mobile`, `alt_mobile`, `email`, `permanent_address`, `current_address`, `brief_note`, `guarantor_id`, `introducer_id`, `bank_account`, `approved_loan_amount`, `payment_frequency`, `loan_tenure`, `roi`, `updation_remark`, `datentime`, `updated_columns`) VALUES
(4, 884042, 0, 0, 1, 2, 'Arpita Sinha', 'Arpita Traders', 0, 0, 0, '', 0, '', 0, 1452369870, 2563149870, 'arpitasinha@st.com', 'hebbala', '', 'No Note', 0, 0, 0, 0, '', 0, 0, 'Created By Admin', 1745210504, ''),
(5, 884042, 0, 0, 1, 1, 'Arpita Sinha', 'Arpita Traders', 0, 0, 0, '', 0, '', 324671400, 1452369871, 2563149870, 'arpitasinha@st.com', 'hebbala', 'sanjay nagar', 'Special Referrence', 0, 0, 0, 0, '', 0, 0, 'Mobile, DOB, Current Address, Brief Note Updated', 1745231329, 'mobile,dob,cust_type,current_address,brief_note'),
(6, 884042, 0, 0, 1, 1, 'Arpita Sinha', 'Arpita Traders', 0, 0, 0, '', 0, '', 324671400, 1452369872, 2563149870, 'arpitasinha@st.com', 'hebbala', 'sanjay nagar', 'Special Referrence', 0, 0, 0, 0, '', 0, 0, 'Mobile Updated', 1745231509, 'mobile'),
(7, 884042, 0, 0, 1, 1, 'Arpita Sinha', 'Arpita Traders', 0, 0, 0, '', 0, '', 324671400, 1452369872, 2563149871, 'arpitasinha@st.com', 'hebbala', 'sanjay nagar', 'Special Referrence', 0, 0, 0, 0, '', 0, 0, 'Alt Mobile updated', 1745231708, 'alt_mobile'),
(8, 884042, 0, 0, 1, 2, 'Arpita Sinha', 'Arpita Traders', 0, 0, 0, '', 0, '', 482437800, 1452369872, 2563149871, 'arpitasinha@st.com', 'Hebbala Bangalore', 'Sanjay Nagar Bangalore', 'Special Referrence', 0, 0, 0, 0, '', 0, 0, 'DOB, Both Address, Type Updated', 1745233163, 'dob,cust_type,permanent_address,current_address'),
(9, 884042, 0, 0, 1, 2, 'Arpita Sinha', 'Arpita Traders', 0, 0, 0, '', 0, '', 482437800, 1452369872, 2563149871, 'arpitasinha@st.com', 'Hebbala Bangalore', 'Sanjay Nagar Bangalore', 'Special Referrence', 6, 0, 0, 0, '', 0, 0, 'Guarantor Added', 1745237991, 'guarantor_id'),
(10, 884042, 0, 0, 1, 2, 'Arpita Sinha', 'Arpita Traders', 0, 0, 0, '', 0, '', 482437800, 1452369872, 2563149871, 'arpitasinha@st.com', 'Hebbala Bangalore', 'Sanjay Nagar Bangalore', 'Special Referrence', 7, 0, 0, 0, '', 0, 0, 'Guarantor Updated', 1745238492, 'guarantor_id'),
(11, 884042, 1, 100000, 1, 2, 'Arpita Sinha', 'Arpita Traders', 0, 0, 0, '', 0, '', 482437800, 1452369872, 2563149871, 'arpitasinha@st.com', 'Hebbala Bangalore', 'Sanjay Nagar Bangalore', 'Special Referrence', 7, 0, 0, 0, '', 0, 0, 'Loan Details Added', 1745301537, 'product_id,required_loan_amount'),
(12, 884042, 2, 100000, 1, 2, 'Arpita Sinha', 'Arpita Traders', 0, 0, 0, '', 0, '', 482437800, 1452369872, 2563149871, 'arpitasinha@st.com', 'Hebbala Bangalore', 'Sanjay Nagar Bangalore', 'Special Referrence', 7, 0, 0, 0, '', 0, 0, 'Loan Details Updated', 1745301660, 'product_id,required_loan_amount'),
(13, 884042, 2, 200000, 1, 2, 'Arpita Sinha', 'Arpita Traders', 0, 0, 0, '', 0, '', 482437800, 1452369872, 2563149871, 'arpitasinha@st.com', 'Hebbala Bangalore', 'Sanjay Nagar Bangalore', 'Special Referrence', 7, 0, 0, 0, '', 0, 0, 'Loan Details Updated', 1745301957, 'required_loan_amount'),
(14, 884042, 2, 200000, 1, 2, 'Arpita Sinha', 'Arpita Traders', 0, 0, 0, '', 0, '', 640204200, 1452369873, 2563149871, 'arpitasinha@st.com', 'Hebbala Bangalore', 'Sanjay Nagar Bangalore', 'Special Referrence By Admin', 7, 0, 0, 0, '', 0, 0, 'Mobile, DOB,Brief Note Updated', 1745302230, 'mobile,dob,brief_note'),
(15, 884042, 2, 200000, 1, 2, 'Arpita Sinha', 'Arpita Traders', 0, 0, 0, '', 0, '', 640204200, 1452369873, 2563149871, 'arpitasinha@st.com', 'Hebbala Bangalore', 'Sanjay Nagar Bangalore', 'Special Referrence By Admin', 6, 0, 0, 0, '', 0, 0, 'Guarantor Updated', 1745302322, 'guarantor_id'),
(16, 884042, 2, 2000002, 1, 2, 'Arpita Sinha', 'Arpita Traders', 0, 0, 0, '', 0, '', 640204200, 1452369873, 2563149871, 'arpitasinha@st.com', 'Hebbala Bangalore', 'Sanjay Nagar Bangalore', 'Special Referrence By Admin', 6, 0, 0, 0, '', 0, 0, 'Loan Details Updated', 1745303744, 'required_loan_amount'),
(17, 884042, 2, 2000002, 1, 2, 'Arpita Sinha', 'Arpita Traders', 0, 0, 0, '', 0, '', 640463400, 1452369873, 2563149871, 'arpitasinha@st.com', 'Hebbala Bangalore', 'Sanjay Nagar Bangalore', 'Special Referrence By Admin', 6, 0, 0, 0, '', 0, 0, 'DOB Updated', 1745319471, 'dob'),
(18, 884042, 2, 2000002, 1, 2, 'Arpita Sinha', 'Arpita Traders', 0, 0, 0, '', 0, '', 640463400, 1452369873, 2563149871, 'arpitasinha@st.com', 'Hebbala Bangalore', 'Sanjay Nagar Bangalore', 'Special Referrence By Admin', 6, 0, 0, 0, '', 0, 0, 'Documents Uploaded', 1745323669, ''),
(19, 884042, 2, 2000002, 1, 2, 'Arpita Sinha', 'Arpita Traders', 0, 0, 0, '', 0, '', 640463400, 1452369873, 2563149871, 'arpitasinha@st.com', 'Hebbala Bangalore', 'Sanjay Nagar Bangalore', 'Special Referrence By Admin', 6, 0, 0, 0, '', 0, 0, 'Documents Uploaded', 1745324138, ''),
(20, 884042, 2, 2000002, 1, 2, 'Arpita Sinha', 'Arpita Traders', 0, 0, 0, '', 0, '', 640463400, 1452369873, 2563149871, 'arpitasinha@st.com', 'Hebbala Bangalore', 'Sanjay Nagar Bangalore', 'Special Referrence By Admin', 6, 0, 0, 0, '', 0, 0, 'Documents Uploaded', 1745324252, ''),
(21, 884042, 2, 200000, 1, 2, 'Arpita Sinha', 'Arpita Traders', 0, 0, 0, '', 0, '', 640463400, 1452369873, 2563149871, 'arpitasinha@st.com', 'Hebbala Bangalore', 'Sanjay Nagar Bangalore', 'Special Referrence By Admin', 6, 0, 0, 0, '', 0, 0, 'Loan Details Updated', 1745380251, 'required_loan_amount'),
(22, 884042, 2, 200000, 1, 2, 'Arpita S Sinha', 'Arpita Traders', 0, 0, 0, '', 0, '', 640463400, 1452369873, 2563149871, 'arpitasinha@st.com', 'Hebbala Bangalore', 'Sanjay Nagar Bangalore', 'Special Referrence By Admin', 6, 0, 0, 0, '', 0, 0, 'Name Updated', 1745381570, 'name'),
(23, 884042, 2, 200000, 1, 2, 'Arpita S Sinha', 'Arpita Traders', 0, 0, 0, '', 0, '', 640463400, 1452369873, 2563149871, 'arpitasinha@st.com', 'Hebbala Bangalore', 'Sanjay Nagar Bangalore', 'Special Referrence By Admin', 6, 0, 0, 0, '', 0, 0, 'Documents Uploaded', 1745838198, ''),
(24, 884042, 2, 200000, 1, 1, 'Arpita S Sinha', 'Arpita Traders', 0, 0, 0, '', 0, '', 640463400, 1452369873, 2563149871, 'arpitasinha@st.com', 'Hebbala Bangalore', 'Sanjay Nagar Bangalore', 'Special Referrence By Admin', 6, 0, 0, 0, '', 0, 0, 'Type Updated', 1745841561, 'cust_type'),
(25, 884042, 2, 200000, 1, 2, 'Arpita S Sinha', 'Arpita Traders', 0, 0, 0, '', 0, '', 640463400, 1452369873, 2563149871, 'arpitasinha@st.com', 'Hebbala Bangalore', 'Sanjay Nagar Bangalore', 'Special Referrence By Admin', 6, 0, 0, 0, '', 0, 0, 'Type Updated', 1745841675, 'cust_type'),
(26, 884042, 2, 2000000, 1, 2, 'Arpita S Sinha', 'Arpita Traders', 0, 0, 0, '', 0, '', 640463400, 1452369873, 2563149871, 'arpitasinha@st.com', 'Hebbala Bangalore', 'Sanjay Nagar Bangalore', 'Special Referrence By Admin', 6, 0, 0, 0, '', 0, 0, 'Loan Details Updated', 1745841815, 'required_loan_amount'),
(27, 884042, 2, 400000, 1, 2, 'Arpita S Sinha', 'Arpita Traders', 0, 0, 0, '', 0, '', 640463400, 1452369873, 2563149871, 'arpitasinha@st.com', 'Hebbala Bangalore', 'Sanjay Nagar Bangalore', 'Special Referrence By Admin', 6, 0, 0, 0, '', 0, 0, 'Loan Details Updated', 1745841826, 'required_loan_amount'),
(28, 884042, 2, 400000, 1, 2, 'Arpita S Sinha', 'Arpita Traders', 0, 0, 0, '', 0, '', 640463400, 1452369873, 2563149871, 'arpitasinha@st.com', 'Hebbala Bangalore', 'Sanjay Nagar Bangalore', 'Special Referrence By Admin', 7, 0, 0, 0, '', 0, 0, 'Guarantor Updated', 1745841838, 'guarantor_id'),
(29, 884042, 2, 400000, 1, 2, 'Arpita S Sinha', 'Arpita Traders', 0, 0, 0, '', 0, '', 703621800, 1452369873, 2563149871, 'arpitasinha@st.com', 'Hebbala Bangalore', 'Sanjay Nagar Bangalore', 'Special Referrence By Admin', 7, 0, 0, 0, '', 0, 0, 'DOB Updated', 1746096358, 'dob'),
(30, 884042, 2, 400000, 1, 2, 'Arpita S Sinha', 'Arpita Traders', 0, 1577817000, 100000, '', 9876543210, 'Moti Chamber Hebbal', 703621800, 1452369873, 2563149871, 'arpitasinha@st.com', 'Hebbala Bangalore', 'Sanjay Nagar Bangalore', 'Special Referrence By Admin', 7, 0, 0, 0, '', 0, 0, 'company details updated', 1746102614, 'company_doi,company_turnover,company_mobile,company_address'),
(31, 884042, 2, 400000, 1, 2, 'Arpita S Sinha', 'Arpita Traders', 0, 1577817000, 100000, 'arpitatrader@test.com', 9876543210, 'Moti Chamber Hebbal', 703621800, 1452369873, 2563149871, 'arpitasinha@st.com', 'Hebbala Bangalore', 'Sanjay Nagar Bangalore', 'Special Referrence By Admin', 7, 0, 0, 0, '', 0, 0, 'company email added', 1746157722, 'company_email'),
(32, 884042, 2, 400000, 1, 2, 'Arpita S Sinha', 'Arpita Traders', 4, 1577817000, 100000, 'arpitatrader@test.com', 9876543210, 'Moti Chamber Hebbal', 703621800, 1452369873, 2563149871, 'arpitasinha@st.com', 'Hebbala Bangalore', 'Sanjay Nagar Bangalore', 'Special Referrence By Admin', 7, 0, 0, 0, '', 0, 0, 'Company Type Updated', 1746158380, 'company_type'),
(33, 884042, 2, 400000, 1, 1, 'Arpita S Sinha', 'Arpita Traders', 4, 1577817000, 100000, 'arpitatrader@test.com', 9876543210, 'Moti Chamber Hebbal', 703621800, 1452369873, 2563149871, 'arpitasinha@st.com', 'Hebbala Bangalore', 'Sanjay Nagar Bangalore', 'Special Referrence By Admin', 7, 0, 0, 0, '', 0, 0, 'Customer Type Updated for testing', 1746159254, 'cust_type'),
(34, 884042, 2, 400000, 1, 2, 'Arpita S Sinha', 'Arpita Traders', 4, 1577817000, 100000, 'arpitatrader@test.com', 9876543210, 'Moti Chamber Hebbal', 703621800, 1452369873, 2563149871, 'arpitasinha@st.com', 'Hebbala Bangalore', 'Sanjay Nagar Bangalore', 'Special Referrence By Admin', 7, 0, 0, 0, '', 0, 0, 'Customer Type Updated for testing', 1746159952, 'cust_type'),
(35, 884042, 2, 400000, 1, 1, 'Arpita S Sinha', 'Arpita Traders', 4, 1577817000, 100000, 'arpitatrader@test.com', 9876543210, 'Moti Chamber Hebbal', 703621800, 1452369873, 2563149871, 'arpitasinha@st.com', 'Hebbala Bangalore', 'Sanjay Nagar Bangalore', 'Special Referrence By Admin', 7, 0, 0, 0, '', 0, 0, 'testing', 1746160441, 'cust_type'),
(36, 884042, 2, 400000, 1, 2, 'Arpita S Sinha', 'Arpita Traders', 4, 1577817000, 100000, 'arpitatrader@test.com', 9876543210, 'Moti Chamber Hebbal', 703621800, 1452369873, 2563149871, 'arpitasinha@st.com', 'Hebbala Bangalore', 'Sanjay Nagar Bangalore', 'Special Referrence By Admin', 7, 0, 0, 0, '', 0, 0, 'testing', 1746160458, 'cust_type'),
(37, 884042, 2, 400000, 1, 2, 'Arpita S Sinha', 'Arpita Traders', 4, 1577817000, 100000, 'arpitatrader@test.com', 9876543210, 'Moti Chamber Hebbal', 703621800, 1452369873, 2563149871, 'arpitasinha@st.com', 'Hebbala Bangalore', 'Sanjay Nagar Bangalore', 'Special Referrence By Admin', 6, 0, 0, 0, '', 0, 0, 'Guarantor Updated', 1746161770, 'guarantor_id'),
(38, 884042, 2, 400000, 1, 2, 'Arpita S Sinha', 'Arpita Corporation', 4, 1577817000, 100000, 'arpitatrader@test.com', 9876543210, 'Moti Chamber Hebbal', 703621800, 1452369873, 2563149871, 'arpitasinha@st.com', 'Hebbala Bangalore', 'Sanjay Nagar Bangalore', 'Special Referrence By Admin', 6, 0, 0, 0, '', 0, 0, 'Company Name Updated', 1746162651, 'company_name'),
(39, 884042, 1, 400000, 1, 2, 'Arpita S Sinha', 'Arpita Corporation', 4, 1577817000, 100000, 'arpitatrader@test.com', 9876543210, 'Moti Chamber Hebbal', 703621800, 1452369873, 2563149871, 'arpitasinha@st.com', 'Hebbala Bangalore', 'Sanjay Nagar Bangalore', 'Special Referrence By Admin', 6, 0, 0, 0, '', 0, 0, 'Loan Details Updated', 1746180678, 'product_id'),
(40, 884042, 2, 400000, 1, 2, 'Arpita S Sinha', 'Arpita Corporation', 4, 1577817000, 100000, 'arpitatrader@test.com', 9876543210, 'Moti Chamber Hebbal', 703621800, 1452369873, 2563149871, 'arpitasinha@st.com', 'Hebbala Bangalore', 'Sanjay Nagar Bangalore', 'Special Referrence By Admin', 6, 2, 0, 0, '', 0, 0, 'Loan Details Updated', 1746180879, 'introducer_id,product_id'),
(41, 884042, 1, 400000, 1, 2, 'Arpita S Sinha', 'Arpita Corporation', 4, 1577817000, 100000, 'arpitatrader@test.com', 9876543210, 'Moti Chamber Hebbal', 703621800, 1452369873, 2563149871, 'arpitasinha@st.com', 'Hebbala Bangalore', 'Sanjay Nagar Bangalore', 'Special Referrence By Admin', 6, 5, 0, 0, '', 0, 0, 'Loan Details Updated', 1746184326, 'introducer_id,product_id'),
(42, 884042, 1, 4000001, 1, 2, 'Arpita S Sinha', 'Arpita Corporation', 4, 1577817000, 100000, 'arpitatrader@test.com', 9876543210, 'Moti Chamber Hebbal', 703621800, 1452369873, 2563149871, 'arpitasinha@st.com', 'Hebbala Bangalore', 'Sanjay Nagar Bangalore', 'Special Referrence By Admin', 6, 5, 0, 0, '', 0, 0, 'Loan Amount Updated', 1746184914, 'required_loan_amount'),
(43, 884042, 1, 400000, 1, 2, 'Arpita S Sinha', 'Arpita Corporation', 4, 1577817000, 100000, 'arpitatrader@test.com', 9876543210, 'Moti Chamber Hebbal', 703621800, 1452369873, 2563149871, 'arpitasinha@st.com', 'Hebbala Bangalore', 'Sanjay Nagar Bangalore', 'Special Referrence By Admin', 6, 5, 0, 0, '', 0, 0, 'test', 1746186044, 'required_loan_amount'),
(44, 884042, 2, 500000, 1, 2, 'Arpita S Sinha', 'Arpita Corporation', 4, 1577817000, 100000, 'arpitatrader@test.com', 9876543210, 'Moti Chamber Hebbal', 703621800, 1452369873, 2563149871, 'arpitasinha@st.com', 'Hebbala Bangalore', 'Sanjay Nagar Bangalore', 'Special Referrence By Admin', 6, 4, 0, 0, '', 0, 0, 'Product, Amount & Introducer Updated', 1746186515, 'introducer_id,product_id,required_loan_amount'),
(45, 884042, 1, 500001, 1, 2, 'Arpita S Sinha', 'Arpita Corporation', 4, 1577817000, 100000, 'arpitatrader@test.com', 9876543210, 'Moti Chamber Hebbal', 703621800, 1452369873, 2563149871, 'arpitasinha@st.com', 'Hebbala Bangalore', 'Sanjay Nagar Bangalore', 'Special Referrence By Admin', 6, 5, 0, 0, '', 0, 0, 'Loan Details Updated', 1746187211, 'introducer_id,product_id,required_loan_amount'),
(46, 884042, 1, 500001, 1, 2, 'Arpita S Sinha', 'Arpita Corporation', 4, 1577817000, 100000, 'arpitatrader@test.com', 9876543210, 'Moti Chamber Hebbal', 703621800, 1452369873, 2563149871, 'arpitasinha@st.com', 'Hebbala Bangalore', 'Sanjay Nagar Bangalore', 'Special Referrence By Admin', 6, 5, 7, 0, '', 0, 0, 'Bank Account Added', 1746189247, 'bank_account'),
(47, 884042, 1, 500001, 1, 2, 'Arpita S Sinha', 'Arpita Corporation', 4, 1577817000, 100000, 'arpitatrader@test.com', 9876543210, 'Moti Chamber Hebbal', 703621800, 1452369873, 2563149871, 'arpitasinha@st.com', 'Hebbala Bangalore', 'Sanjay Nagar Bangalore', 'Special Referrence By Admin', 6, 5, 12, 0, '', 0, 0, 'Bank Account Updated', 1746269860, 'bank_account'),
(48, 884042, 1, 500001, 1, 2, 'Arpita S Sinha', 'Arpita Corporation', 4, 1577817000, 100000, 'arpitatrader@test.com', 9876543210, 'Moti Chamber Hebbal', 703621800, 1452369873, 2563149871, 'arpitasinha@st.com', 'Hebbala Bangalore', 'Sanjay Nagar Bangalore', 'Special Referrence By Admin', 6, 5, 7, 0, '', 0, 0, 'Bank Account Updated', 1746271661, 'bank_account'),
(51, 535694, 0, 0, 1, 2, 'Veeru', 'Veeru Corporation', 5, 1735669800, 500000, 'abctraders@test.com', 9876501234, 'Yeshwantpur Bangalore', 0, 9922001235, 9922001236, 'veeru@st.com', 'Hebbal', '', 'No Note', 0, 0, 20, 0, '', 0, 0, 'Created By Admin', 1746428594, ''),
(52, 535694, 0, 0, 1, 2, 'Veeru', 'Veeru Corporation', 5, 1735669800, 500000, 'abctraders@test.com', 9876501234, 'Yeshwantpur Bangalore', 0, 9922001235, 9922001236, 'veeru@st.com', 'Hebbal', '', 'No Note', 8, 0, 20, 0, '', 0, 0, 'Guarantor Added', 1746429380, 'guarantor_id'),
(53, 962388, 0, 0, 1, 2, 'Veeru', 'Veeru Corporation', 5, 1735669800, 500000, 'abctraders@test.com', 9876501234, 'Yeshwantpur Bangalore', 0, 9922001235, 9922001236, 'veeru@st.com', 'Hebbal', '', 'No Note', 0, 0, 20, 0, '', 0, 0, 'Created By Admin', 1746435397, ''),
(54, 854764, 0, 0, 1, 2, 'Veeru', 'Veeru Corporation', 5, 1735669800, 500000, 'abctraders@test.com', 9876501234, 'Yeshwantpur Bangalore', 0, 9922001235, 9922001236, 'veeru@st.com', 'Hebbal', '', 'No Note', 0, 0, 20, 0, '', 0, 0, 'Created By Admin', 1746435419, ''),
(55, 383568, 0, 0, 1, 2, 'Veeru', 'Veeru Corporation', 5, 1735669800, 500000, 'abctraders@test.com', 9876501234, 'Yeshwantpur Bangalore', 0, 9922001235, 9922001236, 'veeru@st.com', 'Hebbal', '', 'No Note', 0, 0, 20, 0, '', 0, 0, 'Created By Admin', 1746435526, ''),
(56, 535694, 2, 1000000, 1, 2, 'Veeru', 'Veeru Corporation', 5, 1735669800, 500000, 'abctraders@test.com', 9876501234, 'Yeshwantpur Bangalore', 0, 9922001235, 9922001236, 'veeru@st.com', 'Hebbal', '', 'No Note', 8, 2, 20, 0, '', 0, 0, 'Product, Loan Amount, Introducer Added', 1746436397, 'introducer_id,product_id,required_loan_amount'),
(57, 858612, 0, 0, 1, 2, 'Arpita Sinha', 'Arpita Traders', 4, 1743445800, 100000, 'mgbafna1957@gmail.com', 1234567890, 'Moti Chamber\r\nHebbal 560024', 0, 1452369870, 2563149870, 'arpitasinha@st.com', 'hebbala', '', 'No Note', 0, 0, 12, 0, '', 0, 0, 'Created By Admin', 1746442752, ''),
(58, 535694, 2, 1000000, 1, 2, 'Veeru', 'Veeru Corporation', 5, 1735669800, 500000, 'abctraders@test.com', 9876501234, 'Yeshwantpur Bangalore', 66600, 9922001235, 9922001236, 'veeru@st.com', 'Hebbal', 'Hebbala Bangalore', 'No Note', 8, 2, 20, 0, '', 0, 0, 'DOB & Current Address Updated', 1746528799, 'dob,current_address'),
(60, 535694, 2, 1000000, 1, 2, 'Veeru', 'Veeru Corporation', 5, 1735669800, 500000, 'abctraders@test.com', 9876501234, 'Yeshwantpur Bangalore', 946751400, 9922001235, 9922001236, 'veeru@st.com', 'Hebbal', 'Hebbala Bangalore', 'No Note', 8, 2, 20, 0, '', 0, 0, 'DOB Updated', 1746529468, 'dob'),
(61, 535694, 2, 1000000, 1, 2, 'Veeru', 'Veeru Corporation', 5, 946665000, 500000, 'abctraders@test.com', 9876501234, 'Yeshwantpur Bangalore', 946751400, 9922001235, 9922001236, 'veeru@st.com', 'Hebbal', 'Hebbala Bangalore', 'No Note', 8, 2, 20, 0, '', 0, 0, 'Company DOI Updated', 1746530291, 'company_doi'),
(62, 535694, 2, 1000000, 1, 2, 'Veeru', 'Veeru Corporation', 5, 946665000, 500000, 'abctraders@test.com', 9876501234, 'Yeshwantpur Bangalore', 631218600, 9922001235, 9922001236, 'veeru@st.com', 'Hebbal', 'Hebbala Bangalore', 'No Note', 8, 2, 20, 0, '', 0, 0, 'DOB Updated', 1746592267, 'dob'),
(65, 535694, 2, 10000001, 1, 2, 'Veeru', 'Veeru Corporation', 5, 946665000, 500000, 'abctraders@test.com', 9876501234, 'Yeshwantpur Bangalore', 946751400, 9922001235, 9922001236, 'veeru@st.com', 'Hebbal', 'Hebbala Bangalore', 'No Note', 8, 2, 20, 0, '', 0, 0, 'Loan Amount Updated', 1746593730, 'required_loan_amount'),
(64, 535694, 2, 1000000, 1, 2, 'Veeru', 'Veeru Corporation', 5, 946665000, 500000, 'abctraders@test.com', 9876501234, 'Yeshwantpur Bangalore', 946751400, 9922001235, 9922001236, 'veeru@st.com', 'Hebbal', 'Hebbala Bangalore', 'No Note', 8, 2, 20, 0, '', 0, 0, 'DOB Updated', 1746593081, 'dob'),
(66, 535694, 2, 10000001, 1, 2, 'Veeru', 'Veeru Corporation', 5, 946665000, 5000000, 'abctraders@test.com', 9876501234, 'Yeshwantpur Bangalore', 946751400, 9922001235, 9922001236, 'veeru@st.com', 'Hebbal', 'Hebbala Bangalore', 'No Note', 8, 2, 20, 0, '', 0, 0, 'Company Annual Turnover Updated', 1746593962, 'company_turnover'),
(67, 858612, 0, 0, 1, 2, 'Arpita Sinha', 'Arpita Traders', 4, 1743445800, 1000000, 'mgbafna1957@gmail.com', 1234567890, 'Moti Chamber\r\nHebbal 560024\r\nIndia', 0, 1452369870, 2563149870, 'arpitasinha@st.com', 'hebbala', '', 'No Note', 0, 0, 12, 0, '', 0, 0, 'Annual Turover & Address Updated', 1746596210, 'company_turnover,company_address'),
(68, 858612, 0, 0, 1, 2, 'Arpita Sinha', 'Arpita Traders', 4, 1743445800, 1000000, 'mgbafna1957@gmail.com', 1234567890, 'Moti Chamber\r\nHebbal 560024\r\nIndia', 0, 1452369870, 2563149870, 'arpitasinha@st.com', 'hebbala', '', 'No Note', 6, 0, 12, 0, '', 0, 0, 'Guarantor Added', 1746596417, 'guarantor_id'),
(69, 858612, 2, 200000, 1, 2, 'Arpita Sinha', 'Arpita Traders', 4, 1743445800, 1000000, 'mgbafna1957@gmail.com', 1234567890, 'Moti Chamber\r\nHebbal 560024\r\nIndia', 0, 1452369870, 2563149870, 'arpitasinha@st.com', 'hebbala', '', 'No Note', 6, 1, 12, 0, '', 0, 0, 'Product, Loan Amount, Introducer Added', 1746596723, 'introducer_id,product_id,required_loan_amount'),
(70, 858612, 2, 200000, 1, 2, 'Arpita Sinha', 'Arpita Traders', 4, 1743445800, 1000000, 'mgbafna1957@gmail.com', 1234567890, 'Moti Chamber\r\nHebbal 560024\r\nIndia', -19800, 1452369870, 2563149870, 'arpitasinha@st.com', 'Hebbala', '#1 4th A Main road Vinayakanagar Bangalore 560024 India', 'No Note', 6, 1, 12, 0, '', 0, 0, 'Current Address, Permanent Address Updated', 1746597630, 'permanent_address,current_address'),
(71, 858612, 2, 200000, 1, 2, 'Arpita Sinha', 'Arpita Traders', 4, 1743445800, 1000000, 'mgbafna1957@gmail.com', 1234567890, 'Moti Chamber\r\nHebbal 560024\r\nIndia', 631132200, 1452369870, 2563149870, 'arpitasinha@st.com', 'Hebbala', '#1 4th A Main road Vinayakanagar Bangalore 560024 India', 'No Note', 6, 1, 12, 0, '', 0, 0, 'DOB Updated', 1746597810, 'dob'),
(72, 189053, 0, 0, 1, 2, 'Arpita Sinha', 'Arpita Traders', 4, 1743445800, 100000, 'mgbafna1957@gmail.com', 1234567890, 'Moti Chamber\r\nHebbal 560024', 0, 1452369870, 2563149870, 'arpitasinha@st.com', 'hebbala', '', 'No Note', 0, 0, 12, 0, '', 0, 0, 'Created By Admin', 1747719345, ''),
(73, 189053, 0, 0, 1, 2, 'Arpita Sinha', 'Arpita Traders', 4, 1743445800, 100000, 'mgbafna1957@gmail.com', 1234567890, 'Moti Chamber\r\nHebbal 560024', 0, 1452369870, 2563149870, 'arpitasinha@st.com', 'hebbala', '', 'No Note', 6, 0, 12, 0, '', 0, 0, 'Guarantor Added', 1747732936, 'guarantor_id'),
(74, 189053, 0, 0, 1, 2, 'Arpita Sinha', 'Arpita Communicatios', 4, 1740767400, 100000, 'mgbafna1957@gmail.com', 1234567890, 'Moti Chamber\r\nHebbal 560024', 0, 1452369870, 2563149870, 'arpitasinha@st.com', 'hebbala', '', 'No Note', 6, 0, 12, 0, '', 0, 0, 'Company Name, DOI updated', 1747733101, 'company_name,company_doi'),
(75, 189053, 0, 0, 1, 2, 'Arpita Sinha', 'Arpita Communicatios', 4, 1740767400, 100000, 'mgbafna1957@gmail.com', 1234567890, 'Moti Chamber\r\nHebbal 560024', 915129000, 1452369870, 2563149870, 'arpitasinha@st.com', '4th A Main Road Hebbala Bangaluru 560024', '4th A Main Road Hebbala Bangaluru 560024', 'No Note', 6, 0, 12, 0, '', 0, 0, 'Both Address, DOB Updated', 1747733207, 'dob,permanent_address,current_address'),
(76, 189053, 0, 0, 1, 2, 'Arpita Sinha', 'Arpita Communicatios', 4, 1740767400, 100000, 'mgbafna1957@gmail.com', 1234567890, 'Moti Chamber\r\nHebbal 560024', 915129000, 1452369870, 2563149870, 'arpitasinha@st.com', '4th A Main Road Hebbala Bangaluru 560024', '4th A Main Road Hebbala Bangaluru 560024', 'No Note', 7, 0, 12, 0, '', 0, 0, 'Guarantor Updated', 1747734596, 'guarantor_id'),
(77, 189053, 1, 500000, 1, 2, 'Arpita Sinha', 'Arpita Communicatios', 4, 1740767400, 100000, 'mgbafna1957@gmail.com', 1234567890, 'Moti Chamber\r\nHebbal 560024', 915129000, 1452369870, 2563149870, 'arpitasinha@st.com', '4th A Main Road Hebbala Bangaluru 560024', '4th A Main Road Hebbala Bangaluru 560024', 'No Note', 7, 5, 12, 0, '', 0, 0, 'Loan Details added', 1747734659, 'introducer_id,product_id,required_loan_amount'),
(78, 920573, 0, 0, 1, 2, 'Arpita Sinha', 'Arpita Traders', 4, 1743445800, 100000, 'mgbafna1957@gmail.com', 1234567890, 'Moti Chamber\r\nHebbal 560024', 0, 1452369870, 2563149870, 'arpitasinha@st.com', 'hebbala', '', 'No Note', 0, 0, 22, 0, '', 0, 0, 'Created By Admin', 1747740451, ''),
(80, 914948, 0, 0, 1, 2, 'Arpita Sinha', 'Arpita Traders', 4, 1743445800, 100000, 'mgbafna1957@gmail.com', 1234567890, 'Moti Chamber\r\nHebbal 560024', 0, 1452369870, 2563149870, 'arpitasinha@st.com', 'hebbala', '', 'No Note', 0, 0, 22, 0, '', 0, 0, 'Created By Admin', 1747809854, ''),
(81, 457486, 0, 0, 1, 2, 'Veeru', 'Veeru Corporation', 5, 1735669800, 500000, 'abctraders@test.com', 9876501235, 'Yeshwantpur Bangalore\r\nIndia 560021', 0, 9922001236, 9922001236, 'veeru@st.com', 'Hebbal', '', 'No Note', 0, 0, 20, 0, '', 0, 0, 'Created By Admin', 1747811557, ''),
(82, 308829, 0, 0, 1, 2, 'Arpita Sinha', 'Arpita Traders', 4, 1743445800, 100000, 'mgbafna1957@gmail.com', 1234567890, 'Moti Chamber\r\nHebbal 560024', 0, 1452369870, 2563149870, 'arpitasinha@st.com', 'hebbala', '', 'No Note', 0, 0, 22, 0, '', 0, 0, 'Created By Admin', 1747811591, ''),
(83, 614138, 0, 0, 1, 2, 'Arpita Sinha', 'Arpita Traders', 4, 1743445800, 100000, 'mgbafna1957@gmail.com', 1234567890, 'Moti Chamber\r\nHebbal 560024', 0, 1452369870, 2563149870, 'arpitasinha@st.com', 'hebbala', '', 'No Note', 0, 0, 22, 0, '', 0, 0, 'Created By Admin', 1747812194, ''),
(84, 614138, 0, 0, 1, 2, 'Arpita Sinha', 'Arpita Traders', 4, 1743445800, 100000, 'mgbafna1957@gmail.com', 1234567890, 'Moti Chamber\r\nHebbal 560024', 0, 1452369870, 2563149870, 'arpitasinha@st.com', 'hebbala', '', 'No Note', 0, 0, 22, 0, '', 0, 0, 'Documents Uploaded', 1747812703, ''),
(85, 614138, 0, 0, 1, 2, 'Arpita Sinha', 'Arpita Traders', 4, 1743445800, 100000, 'mgbafna1957@gmail.com', 1234567890, 'Moti Chamber\r\nHebbal 560024', 0, 1452369870, 2563149870, 'arpitasinha@st.com', 'hebbala', '', 'No Note', 9, 0, 22, 0, '', 0, 0, 'Guarantor Added', 1747908125, 'guarantor_id'),
(86, 614138, 0, 0, 1, 2, 'Arpita Sinha', 'Arpita Traders', 4, 1743445800, 100000, 'mgbafna1957@gmail.com', 1234567890, 'Moti Chamber\r\nHebbal 560024', 0, 1452369870, 2563149870, 'arpitasinha@st.com', 'hebbala', '', 'No Note', 9, 0, 22, 0, '', 0, 0, 'Documents Uploaded', 1747982890, ''),
(87, 614138, 0, 0, 1, 2, 'Arpita Sinha', 'Arpita Traders', 4, 1743445800, 100000, 'mgbafna1957@gmail.com', 1234567890, 'Moti Chamber\r\nHebbal 560024', 0, 1452369870, 2563149870, 'arpitasinha@st.com', 'hebbala', '', 'No Note', 9, 0, 22, 0, '', 0, 0, 'Documents Uploaded', 1747985466, ''),
(88, 614138, 0, 0, 1, 2, 'Arpita Sinha', 'Arpita Traders', 4, 1743445800, 100000, 'mgbafna1957@gmail.com', 1234567890, 'Moti Chamber\r\nHebbal 560024', 0, 1452369870, 2563149870, 'arpitasinha@st.com', 'hebbala', '', 'No Note', 9, 0, 22, 0, '', 0, 0, 'Documents Uploaded', 1747985874, ''),
(89, 614138, 0, 0, 1, 2, 'Arpita Sinha', 'Arpita Traders', 4, 1743445800, 100000, 'mgbafna1957@gmail.com', 1234567890, 'Moti Chamber\r\nHebbal 560024', 0, 1452369870, 2563149870, 'arpitasinha@st.com', 'hebbala', '', 'No Note', 9, 0, 22, 0, '', 0, 0, 'Documents Uploaded', 1747986362, ''),
(90, 614138, 0, 0, 1, 2, 'Arpita Sinha', 'Arpita Traders', 4, 1743445800, 100000, 'mgbafna1957@gmail.com', 1234567890, 'Moti Chamber\r\nHebbal 560024', 0, 1452369870, 2563149870, 'arpitasinha@st.com', 'hebbala', '', 'No Note', 9, 0, 22, 0, '', 0, 0, 'Documents Uploaded', 1747994553, ''),
(91, 457486, 0, 0, 1, 2, 'Veeru', 'Veeru Corporation', 5, 1735669800, 500000, 'abctraders@test.com', 9876501235, 'Yeshwantpur Bangalore\r\nIndia 560021', 0, 9922001236, 9922001236, 'veeru@st.com', 'Hebbal', '', 'No Note', 0, 0, 20, 0, '', 0, 0, 'Documents Uploaded', 1747994721, ''),
(96, 614138, 0, 0, 1, 2, 'Arpita Sinha', 'Arpita Traders', 4, 1743445800, 100000, 'mgbafna1957@gmail.com', 1234567890, 'Moti Chamber\r\nHebbal 560024', 0, 1452369870, 2563149870, 'arpitasinha@st.com', 'hebbala', '', 'No Note', 9, 0, 22, 0, '', 0, 0, 'Documents Uploaded', 1748079270, ''),
(97, 614138, 0, 0, 1, 2, 'Arpita Sinha', 'Arpita Traders', 4, 1743445800, 100000, 'mgbafna1957@gmail.com', 1234567890, 'Moti Chamber\r\nHebbal 560024', 0, 1452369870, 2563149870, 'arpitasinha@st.com', 'hebbala', '', 'No Note', 9, 0, 22, 0, '', 0, 0, 'Documents Uploaded', 1748079280, ''),
(95, 858612, 2, 200000, 2, 2, 'Arpita Sinha', 'Arpita Traders', 4, 1743445800, 1000000, 'mgbafna1957@gmail.com', 1234567890, 'Moti Chamber\r\nHebbal 560024\r\nIndia', 631132200, 1452369870, 2563149870, 'arpitasinha@st.com', 'Hebbala', '#1 4th A Main road Vinayakanagar Bangalore 560024 India', 'No Note', 6, 1, 12, 0, '', 0, 0, 'Status Updated', 1748073023, 'status_id'),
(98, 614138, 0, 0, 2, 2, 'Arpita Sinha', 'Arpita Traders', 4, 1743445800, 100000, 'mgbafna1957@gmail.com', 1234567890, 'Moti Chamber\r\nHebbal 560024', 0, 1452369870, 2563149870, 'arpitasinha@st.com', 'hebbala', '', 'No Note', 9, 0, 22, 0, '', 0, 0, 'Move to In Verification', 1748082394, 'status_id'),
(99, 614138, 0, 0, 2, 2, 'Arpita Sinha', 'Arpita Traders', 4, 1743445800, 100000, 'mgbafna1957@gmail.com', 1234567890, 'Moti Chamber\r\nHebbal 560024', 0, 1452369870, 2563149870, 'arpitasinha@st.com', 'hebbala', '', 'No Note', 9, 0, 22, 0, '', 0, 0, 'Documents Uploaded', 1748082416, ''),
(100, 614138, 0, 0, 2, 2, 'Arpita Sinha', 'Arpita Traders', 4, 1743445800, 100000, 'mgbafna1957@gmail.com', 1234567890, 'Moti Chamber\r\nHebbal 560024', 0, 1452369870, 2563149870, 'arpitasinha@st.com', 'hebbala', '', 'No Note', 9, 0, 22, 0, '', 0, 0, 'Documents Uploaded', 1748084882, ''),
(101, 614138, 0, 0, 2, 2, 'Arpita Sinha', 'Arpita Traders', 4, 1743445800, 100000, 'mgbafna1957@gmail.com', 1234567890, 'Moti Chamber\r\nHebbal 560024', 631132200, 1452369870, 2563149870, 'arpitasinha@st.com', '#4 4th A Main road Vinayakanagar Bangalore 560024 India', '#4 4th A Main road Vinayakanagar Bangalore 560024 India', 'No Note', 9, 0, 22, 0, '', 0, 0, 'DOB, Both Address Updated', 1748085177, 'dob,permanent_address,current_address'),
(102, 614138, 1, 500000, 2, 2, 'Arpita Sinha', 'Arpita Traders', 4, 1743445800, 100000, 'mgbafna1957@gmail.com', 1234567890, 'Moti Chamber\r\nHebbal 560024', 631132200, 1452369870, 2563149870, 'arpitasinha@st.com', '#4 4th A Main road Vinayakanagar Bangalore 560024 India', '#4 4th A Main road Vinayakanagar Bangalore 560024 India', 'No Note', 9, 2, 22, 0, '', 0, 0, 'Loan Details Updated', 1748085217, 'introducer_id,product_id,required_loan_amount'),
(103, 614138, 1, 500000, 3, 2, 'Arpita Sinha', 'Arpita Traders', 4, 1743445800, 100000, 'mgbafna1957@gmail.com', 1234567890, 'Moti Chamber\r\nHebbal 560024', 631132200, 1452369870, 2563149870, 'arpitasinha@st.com', '#4 4th A Main road Vinayakanagar Bangalore 560024 India', '#4 4th A Main road Vinayakanagar Bangalore 560024 India', 'No Note', 9, 2, 22, 0, '', 0, 0, 'All Documents & detail has verified.', 1748085774, 'status_id'),
(104, 854764, 0, 0, 6, 2, 'Veeru', 'Veeru Corporation', 5, 1735669800, 500000, 'abctraders@test.com', 9876501234, 'Yeshwantpur Bangalore', 0, 9922001235, 9922001236, 'veeru@st.com', 'Hebbal', '', 'No Note', 0, 0, 20, 0, '', 0, 0, 'Customer Not Interested', 1748089599, 'status_id'),
(105, 383568, 0, 0, 7, 2, 'Veeru', 'Veeru Corporation', 5, 1735669800, 500000, 'abctraders@test.com', 9876501234, 'Yeshwantpur Bangalore', 0, 9922001235, 9922001236, 'veeru@st.com', 'Hebbal', '', 'No Note', 0, 0, 20, 0, '', 0, 0, 'Not Eligible', 1748318709, 'status_id'),
(106, 914948, 0, 0, 8, 2, 'Arpita Sinha', 'Arpita Traders', 4, 1743445800, 100000, 'mgbafna1957@gmail.com', 1234567890, 'Moti Chamber\r\nHebbal 560024', 0, 1452369870, 2563149870, 'arpitasinha@st.com', 'hebbala', '', 'No Note', 0, 0, 22, 0, '', 0, 0, 'Customer not interested', 1748319261, 'status_id'),
(111, 614138, 1, 500000, 3, 2, 'Arpita Sinha', 'Arpita Traders', 4, 1743445800, 100000, 'mgbafna1957@gmail.com', 1234567890, 'Moti Chamber\r\nHebbal 560024', 631132200, 1452369870, 2563149870, 'arpitasinha@st.com', '#4 4th A Main road Vinayakanagar Bangalore 560024 India', '#4 4th A Main road Vinayakanagar Bangalore 560024 India', 'No Note', 9, 2, 22, 100000, 'Yearly', 5, 10, 'Customer Signed Agreement Uploaded', 1748411498, ''),
(108, 614138, 1, 500000, 3, 2, 'Arpita Sinha', 'Arpita Traders', 4, 1743445800, 100000, 'mgbafna1957@gmail.com', 1234567890, 'Moti Chamber\r\nHebbal 560024', 631132200, 1452369870, 2563149870, 'arpitasinha@st.com', '#4 4th A Main road Vinayakanagar Bangalore 560024 India', '#4 4th A Main road Vinayakanagar Bangalore 560024 India', 'No Note', 9, 2, 22, 100000, 'Yearly', 5, 10, 'Agreement Generated', 1748342584, 'approved_loan_amount,payment_frequency,loan_tenure,roi'),
(112, 457486, 0, 0, 1, 2, 'Veeru', 'Veeru Corporation', 5, 1735669800, 500000, 'abctraders@test.com', 9876501235, 'Yeshwantpur Bangalore\r\nIndia 560021', 0, 9922001236, 9922001236, 'veeru@st.com', 'Hebbal', '', 'No Note', 0, 0, 20, 0, '', 0, 0, 'Documents Uploaded', 1748423906, ''),
(113, 457486, 0, 0, 1, 2, 'Veeru', 'Veeru Corporation', 5, 1735669800, 500000, 'abctraders@test.com', 9876501235, 'Yeshwantpur Bangalore\r\nIndia 560021', 0, 9922001236, 9922001236, 'veeru@st.com', 'Hebbal', '', 'No Note', 0, 0, 20, 0, '', 0, 0, 'Documents Uploaded', 1748428183, ''),
(114, 457486, 0, 0, 1, 2, 'Veeru', 'Veeru Corporation', 5, 1735669800, 500000, 'abctraders@test.com', 9876501235, 'Yeshwantpur Bangalore\r\nIndia 560021', 0, 9922001236, 9922001236, 'veeru@st.com', 'Hebbal', '', 'No Note', 0, 0, 20, 0, '', 0, 0, 'Documents Uploaded', 1748428282, ''),
(115, 457486, 0, 0, 1, 2, 'Veeru', 'Veeru Corporation', 5, 1735669800, 500000, 'abctraders@test.com', 9876501235, 'Yeshwantpur Bangalore\r\nIndia 560021', 0, 9922001236, 9922001236, 'veeru@st.com', 'Hebbal', '', 'No Note', 0, 0, 20, 0, '', 0, 0, 'Documents Uploaded', 1748429118, ''),
(116, 457486, 0, 0, 1, 2, 'Veeru', 'Veeru Corporation', 5, 1735669800, 500000, 'abctraders@test.com', 9876501235, 'Yeshwantpur Bangalore\r\nIndia 560021', 0, 9922001236, 9922001236, 'veeru@st.com', 'Hebbal', '', 'No Note', 0, 0, 20, 0, '', 0, 0, 'Documents Uploaded', 1748430083, ''),
(117, 457486, 0, 0, 1, 2, 'Veeru', 'Veeru Corporation', 5, 1735669800, 500000, 'abctraders@test.com', 9876501235, 'Yeshwantpur Bangalore\r\nIndia 560021', 0, 9922001236, 9922001236, 'veeru@st.com', 'Hebbal', '', 'No Note', 0, 0, 20, 0, '', 0, 0, 'Documents Uploaded', 1748430156, ''),
(118, 457486, 0, 0, 1, 2, 'Veeru', 'Veeru Corporation', 5, 1735669800, 500000, 'abctraders@test.com', 9876501235, 'Yeshwantpur Bangalore\r\nIndia 560021', 0, 9922001236, 9922001236, 'veeru@st.com', 'Hebbal', '', 'No Note', 0, 0, 20, 0, '', 0, 0, 'Documents Uploaded', 1748432992, ''),
(119, 457486, 0, 0, 1, 2, 'Veeru', 'Veeru Corporation', 5, 1735669800, 500000, 'abctraders@test.com', 9876501235, 'Yeshwantpur Bangalore\r\nIndia 560021', 0, 9922001236, 9922001236, 'veeru@st.com', 'Hebbal', '', 'No Note', 0, 0, 20, 0, '', 0, 0, 'Documents Uploaded', 1748433122, ''),
(120, 457486, 0, 0, 1, 2, 'Veeru', 'Veeru Corporation', 5, 1735669800, 500000, 'abctraders@test.com', 9876501235, 'Yeshwantpur Bangalore\r\nIndia 560021', 631132200, 9922001236, 9922001236, 'veeru@st.com', 'Hebbal', 'Hebbal', 'No Note', 0, 0, 20, 0, '', 0, 0, 'DOB, Current Address Updated', 1748493970, 'dob,current_address'),
(122, 457486, 0, 0, 1, 2, 'Veeru', 'Veeru Corporation', 5, 1735669800, 500000, 'abctraders@test.com', 9876501235, 'Yeshwantpur Bangalore\r\nIndia 560021', 631132200, 9922001236, 9922001236, 'veeru@st.com', 'Hebbal1', 'Hebbal', 'No Note', 0, 0, 20, 0, '', 0, 0, 'Permanent Address Updated', 1748501623, 'permanent_address'),
(123, 457486, 0, 0, 1, 2, 'Veeru', 'Veeru Corporation', 5, 1735669800, 500000, 'abctraders@test.com', 9876501235, 'Yeshwantpur Bangalore\r\nIndia 560021', 631132200, 9922001236, 9922001236, 'veeru@st.com', 'Hebbal1', 'Hebbal', 'No Note', 0, 0, 20, 0, '', 0, 0, 'Company Address Updated', 1748510198, 'company_address'),
(127, 457486, 0, 0, 1, 2, 'Veeru', 'Veeru Corporation', 5, 1735669800, 500000, 'abctraders@test.com', 9876501235, 'Yeshwantpur North Bangalore India 560021', 631132200, 9922001236, 9922001236, 'veeru@st.com', 'Hebbal1', 'Hebbal', 'No Note', 0, 0, 20, 0, '', 0, 0, 'Company Address Updated', 1748512528, 'company_address'),
(128, 457486, 0, 0, 1, 1, 'Veeru', 'Veeru Corporation', 5, 1735669800, 500000, 'abctraders@test.com', 9876501235, 'Yeshwantpur North Bangalore India 560021', 631132200, 9922001236, 9922001236, 'veeru@st.com', 'Hebbal1', 'Hebbal', 'No Note', 0, 0, 20, 0, '', 0, 0, 'Customer Changed to Individual', 1748514994, 'cust_type'),
(129, 457486, 0, 0, 1, 2, 'Veeru', 'Veeru Corporation', 5, 1735669800, 500000, 'abctraders@test.com', 9876501235, 'Yeshwantpur North Bangalore India 560021', 631132200, 9922001236, 9922001236, 'veeru@st.com', 'Hebbal1', 'Hebbal', 'No Note', 0, 0, 20, 0, '', 0, 0, 'Type updated to corporate', 1748516287, 'cust_type'),
(130, 457486, 0, 0, 1, 1, 'Veeru', 'Veeru Corporation', 5, 1735669800, 500000, 'abctraders@test.com', 9876501235, 'Yeshwantpur North Bangalore India 560021', 631132200, 9922001236, 9922001236, 'veeru@st.com', 'Hebbal1', 'Hebbal', 'No Note', 0, 0, 20, 0, '', 0, 0, 'Updated to Individual', 1748516367, 'cust_type'),
(131, 189053, 1, 500000, 1, 2, 'Arpita Sinha', 'Arpita Communicatios', 4, 1740767400, 100000, 'mgbafna1957@gmail.com', 1234567890, 'Moti Chamber\r\nHebbal 560024', 915129000, 1452369870, 2563149870, 'arpitasinha@st.com', '4th A Main Road Hebbala Bangaluru 560024', '4th A Main Road Hebbala Bangaluru 560024', 'No Note', 7, 5, 7, 0, '', 0, 0, 'Bank Account Updated', 1748518073, 'bank_account'),
(133, 189053, 1, 500000, 1, 2, 'Arpita Sinha', 'Arpita Communicatios', 4, 1740767400, 100000, 'mgbafna1957@gmail.com', 1234567890, 'Moti Chamber\r\nHebbal 560024', 915129000, 1452369870, 2563149870, 'arpitasinha@st.com', '4th A Main Road Hebbala Bangaluru 560024', '4th A Main Road Hebbala Bangaluru 560024', 'No Note', 6, 5, 7, 0, '', 0, 0, 'Guarantor Updated', 1748520305, 'guarantor_id'),
(134, 189053, 1, 500000, 1, 2, 'Arpita Sinha', 'Arpita Communicatios', 4, 1740767400, 100000, 'mgbafna1957@gmail.com', 1234567890, 'Moti Chamber\r\nHebbal 560024', 915129000, 1452369870, 2563149870, 'arpitasinha@st.com', '4th A Main Road Hebbala Bangaluru 560024', '4th A Main Road Hebbala Bangaluru 560024', 'No Note', 7, 5, 7, 0, '', 0, 0, 'Guarantor Updated', 1748520355, 'guarantor_id'),
(135, 457486, 0, 0, 1, 1, 'Veeru', 'Veeru Corporation', 5, 1735669800, 500000, 'abctraders@test.com', 9876501235, 'Yeshwantpur North Bangalore India 560021', 631132200, 9922001236, 9922001236, 'veeru@st.com', 'Hebbal1', 'Hebbal', 'No Note', 8, 0, 20, 0, '', 0, 0, 'Guarantor Added', 1748520720, 'guarantor_id'),
(136, 189053, 1, 5000001, 1, 2, 'Arpita Sinha', 'Arpita Communicatios', 4, 1740767400, 100000, 'mgbafna1957@gmail.com', 1234567890, 'Moti Chamber\r\nHebbal 560024', 915129000, 1452369870, 2563149870, 'arpitasinha@st.com', '4th A Main Road Hebbala Bangaluru 560024', '4th A Main Road Hebbala Bangaluru 560024', 'No Note', 7, 5, 7, 0, '', 0, 0, 'Requested Loan Amount Updated', 1748521370, 'required_loan_amount'),
(137, 189053, 1, 5000001, 1, 2, 'Arpita Sinha', 'Arpita Communicatios', 4, 1740767400, 100000, 'mgbafna1957@gmail.com', 1234567890, 'Moti Chamber\r\nHebbal 560024', 915129000, 1452369870, 2563149870, 'arpitasinha@st.com', '4th A Main Road Hebbala Bangaluru 560024', '4th A Main Road Hebbala Bangaluru 560024', 'No Note', 7, 6, 7, 0, '', 0, 0, 'Introducer Updated', 1748521629, 'introducer_id'),
(138, 189053, 2, 5000001, 1, 2, 'Arpita Sinha', 'Arpita Communicatios', 4, 1740767400, 100000, 'mgbafna1957@gmail.com', 1234567890, 'Moti Chamber\r\nHebbal 560024', 915129000, 1452369870, 2563149870, 'arpitasinha@st.com', '4th A Main Road Hebbala Bangaluru 560024', '4th A Main Road Hebbala Bangaluru 560024', 'No Note', 7, 2, 7, 0, '', 0, 0, 'Product, Introducer Updated', 1748577656, 'introducer_id,product_id'),
(139, 457486, 0, 0, 1, 1, 'Veeru', 'Veeru Corporation', 5, 1735669800, 500000, 'abctraders@test.com', 9876501235, 'Yeshwantpur North Bangalore India 560021', 631132200, 9922001236, 9922001236, 'veeru@st.com', 'Hebbal1', 'Hebbal', 'No Note', 8, 0, 20, 0, '', 0, 0, 'Documents Uploaded', 1748584598, ''),
(140, 457486, 1, 1000000, 1, 1, 'Veeru', 'Veeru Corporation', 5, 1735669800, 500000, 'abctraders@test.com', 9876501235, 'Yeshwantpur North Bangalore India 560021', 631132200, 9922001236, 9922001236, 'veeru@st.com', 'Hebbal1', 'Hebbal', 'No Note', 8, 5, 20, 0, '', 0, 0, 'Loan Details Added', 1748584730, 'introducer_id,product_id,required_loan_amount'),
(141, 457486, 1, 1000000, 1, 2, 'Veeru', 'Veeru Corporation', 5, 1735669800, 500000, 'abctraders@test.com', 9876501235, 'Yeshwantpur North Bangalore India 560021', 631132200, 9922001236, 9922001236, 'veeru@st.com', 'Hebbal1', 'Hebbal', 'No Note', 8, 5, 20, 0, '', 0, 0, 'Customer Type Updated to Corporate', 1748584840, 'cust_type'),
(142, 858612, 2, 200000, 2, 2, 'Arpita Sinha', 'Arpita Traders', 4, 1743445800, 1000000, 'mgbafna1957@gmail.com', 1234567890, 'Moti Chamber\r\nHebbal 560024\r\nIndia', 631132200, 1452369870, 2563149870, 'arpitasinha@st.com', 'Hebbala', '#1 4th A Main road Vinayakanagar Bangalore 560024 India', 'No Note', 9, 1, 12, 0, '', 0, 0, 'Guarantor Updated', 1748585934, 'guarantor_id'),
(143, 858612, 2, 200000, 2, 2, 'Arpita Sinha', 'Arpita Traders', 4, 1743445800, 1000000, 'mgbafna1957@gmail.com', 1234567890, 'Moti Chamber\r\nHebbal 560024\r\nIndia', 631132200, 1452369870, 2563149870, 'arpitasinha@st.com', 'Hebbala', '#1 4th A Main road Vinayakanagar Bangalore 560024 India', 'No Note', 7, 1, 12, 0, '', 0, 0, 'Guarantor Updated', 1748586266, 'guarantor_id'),
(144, 858612, 2, 200000, 2, 2, 'Arpita Sinha', 'Arpita Traders', 4, 1743445800, 1000000, 'mgbafna1957@gmail.com', 1234567890, 'Moti Chamber\r\nHebbal 560024\r\nIndia', 631132200, 1452369870, 2563149870, 'arpitasinha@st.com', 'Hebbala', '#1 4th A Main road Vinayakanagar Bangalore 560024 India', 'No Note', 7, 1, 22, 0, '', 0, 0, 'Bank Account Updated', 1748589272, 'bank_account'),
(145, 858612, 2, 200000, 2, 2, 'Arpita Sinha', 'Arpita Traders', 4, 1743445800, 1000000, 'mgbafna1957@gmail.com', 1234567890, 'Moti Chamber Hebbal 560024 India', 631132200, 1452369870, 2563149870, 'arpitasinha@st.com', 'Hebbala', '#1 4th A Main road Vinayakanagar Bangalore 560024 India', 'No Note', 7, 1, 22, 0, '', 0, 0, 'Company Address Updated', 1748589642, 'company_address'),
(146, 457486, 2, 1000000, 1, 2, 'Veeru', 'Veeru Corporation', 5, 1735669800, 500000, 'abctraders@test.com', 9876501235, 'Yeshwantpur North Bangalore India 560021', 631132200, 9922001236, 9922001236, 'veeru@st.com', 'Hebbal1', 'Hebbal', 'No Note', 8, 5, 20, 0, '', 0, 0, 'Product Updated', 1748590323, 'product_id'),
(147, 457486, 2, 1000000, 1, 2, 'Veeru', 'Veeru Corporation', 5, 1735669800, 500000, 'abctraders@test.com', 9876501235, 'Yeshwantpur North Bangalore India 560021', 631132200, 9922001236, 9922001236, 'veeru@st.com', 'Hebbal1', 'Hebbal', 'No Note', 8, 5, 20, 0, '', 0, 0, 'Documents Uploaded', 1748590360, ''),
(148, 457486, 2, 1000000, 1, 2, 'Veeru Yadav', 'Veeru Corporation', 5, 1735669800, 500000, 'abctraders@test.com', 9876501235, 'Yeshwantpur North Bangalore India 560021', 631132200, 9922001236, 9922001236, 'veeru@st.com', 'Hebbal1', 'Hebbal', 'No Note', 8, 5, 20, 0, '', 0, 0, 'Name Updated', 1748590403, 'name'),
(149, 858612, 2, 200000, 2, 2, 'Arpita Sinha', 'Arpita Traders', 4, 1743445800, 1000000, 'mgbafna1957@gmail.com', 1234567890, 'Moti Chamber Hebbal 560024 India', 631132200, 1452369870, 2563149870, 'arpitasinha@st.com', 'Hebbala', '#1 4th A Main road Vinayakanagar Bangalore 560024 India', 'No Note', 6, 1, 22, 0, '', 0, 0, 'Guarantor Updated', 1748602675, 'guarantor_id'),
(150, 858612, 2, 200000, 2, 2, 'Arpita Sinha', 'Arpita Traders', 4, 1743445800, 1000000, 'mgbafna1957@gmail.com', 1234567890, 'Moti Chamber Hebbal 560024 India', 631132200, 1452369870, 2563149870, 'arpitasinha@st.com', 'Hebbala', '#1 4th A Main road Vinayakanagar Bangalore 560024 India', 'No Note', 6, 1, 22, 0, '', 0, 0, 'Documents Uploaded', 1748664260, ''),
(151, 858612, 2, 200000, 2, 2, 'Arpita Sinha', 'Arpita Traders', 4, 1743445800, 1000000, 'mgbafna1957@gmail.com', 1234567890, 'Moti Chamber Hebbal 560024 India', 631132200, 1452369870, 2563149870, 'arpitasinha@st.com', 'Hebbala', '#1 4th A Main road Vinayakanagar Bangalore 560024 India', 'No Note', 6, 1, 22, 0, '', 0, 0, 'Documents Uploaded', 1748664295, ''),
(152, 858612, 2, 200000, 3, 2, 'Arpita Sinha', 'Arpita Traders', 4, 1743445800, 1000000, 'mgbafna1957@gmail.com', 1234567890, 'Moti Chamber Hebbal 560024 India', 631132200, 1452369870, 2563149870, 'arpitasinha@st.com', 'Hebbala', '#1 4th A Main road Vinayakanagar Bangalore 560024 India', 'No Note', 6, 1, 22, 0, '', 0, 0, 'All details & documents verified', 1748664611, 'status_id'),
(153, 858612, 2, 200000, 3, 2, 'Arpita Sinha', 'Arpita Traders', 4, 1743445800, 1000000, 'mgbafna1957@gmail.com', 1234567890, 'Moti Chamber Hebbal 560024 India', 631132200, 1452369870, 2563149870, 'arpitasinha@st.com', 'Hebbala', '#1 4th A Main road Vinayakanagar Bangalore 560024 India', 'No Note', 6, 1, 22, 10000, 'Weekly', 10, 5, 'Agreement Generated', 1748664664, 'approved_loan_amount,payment_frequency,loan_tenure,roi'),
(154, 858612, 2, 200000, 3, 2, 'Arpita Sinha', 'Arpita Traders', 4, 1743445800, 1000000, 'mgbafna1957@gmail.com', 1234567890, 'Moti Chamber Hebbal 560024 India', 631132200, 1452369870, 2563149870, 'arpitasinha@st.com', 'Hebbala', '#1 4th A Main road Vinayakanagar Bangalore 560024 India', 'No Note', 6, 1, 22, 10000, 'Weekly', 10, 5, 'Customer Signed Agreement Uploaded', 1748669134, ''),
(155, 920573, 0, 0, 1, 2, 'Arpita Sinha', 'Arpita Traders', 4, 1743445800, 100000, 'mgbafna1957@gmail.com', 1234567890, 'Moti Chamber\r\nHebbal 560024', 0, 1452369870, 2563149870, 'arpitasinha@st.com', 'hebbala', '', 'No Note', 6, 0, 22, 0, '', 0, 0, 'Guarantor Added', 1748675654, 'guarantor_id'),
(159, 858612, 2, 200000, 4, 2, 'Arpita Sinha', 'Arpita Traders', 4, 1743445800, 1000000, 'mgbafna1957@gmail.com', 1234567890, 'Moti Chamber Hebbal 560024 India', 631132200, 1452369870, 2563149870, 'arpitasinha@st.com', 'Hebbala', '#1 4th A Main road Vinayakanagar Bangalore 560024 India', 'No Note', 6, 1, 22, 10000, 'Weekly', 10, 5, 'LRN Approved & LAN Generated', 1748928019, 'status_id'),
(157, 457486, 2, 1000000, 2, 2, 'Veeru Yadav', 'Veeru Corporation', 5, 1735669800, 500000, 'abctraders@test.com', 9876501235, 'Yeshwantpur North Bangalore India 560021', 631132200, 9922001236, 9922001236, 'veeru@st.com', 'Hebbal1', 'Hebbal', 'No Note', 8, 5, 20, 0, '', 0, 0, 'Send to Verification Process', 1748694072, 'status_id'),
(160, 614138, 1, 500000, 4, 2, 'Arpita Sinha', 'Arpita Traders', 4, 1743445800, 100000, 'mgbafna1957@gmail.com', 1234567890, 'Moti Chamber\r\nHebbal 560024', 631132200, 1452369870, 2563149870, 'arpitasinha@st.com', '#4 4th A Main road Vinayakanagar Bangalore 560024 India', '#4 4th A Main road Vinayakanagar Bangalore 560024 India', 'No Note', 9, 2, 22, 100000, 'Yearly', 5, 10, 'LRN Approved & LAN Generated', 1750335196, 'status_id'),
(161, 457486, 2, 1000000, 3, 2, 'Veeru Yadav', 'Veeru Corporation', 5, 1735669800, 500000, 'abctraders@test.com', 9876501235, 'Yeshwantpur North Bangalore India 560021', 631132200, 9922001236, 9922001236, 'veeru@st.com', 'Hebbal1', 'Hebbal', 'No Note', 8, 5, 20, 0, '', 0, 0, 'Documents Verified', 1750762799, 'status_id'),
(162, 457486, 2, 1000000, 3, 2, 'Veeru Yadav', 'Veeru Corporation', 5, 1735669800, 500000, 'abctraders@test.com', 9876501235, 'Yeshwantpur North Bangalore India 560021', 631132200, 9922001236, 9922001236, 'veeru@st.com', 'Hebbal1', 'Hebbal', 'No Note', 8, 5, 20, 500000, 'Monthly', 10, 4, 'Agreement Generated', 1750762860, 'approved_loan_amount,payment_frequency,loan_tenure,roi'),
(163, 457486, 2, 1000000, 3, 2, 'Veeru Yadav', 'Veeru Corporation', 5, 1735669800, 500000, 'abctraders@test.com', 9876501235, 'Yeshwantpur North Bangalore India 560021', 631132200, 9922001236, 9922001236, 'veeru@st.com', 'Hebbal1', 'Hebbal', 'No Note', 8, 5, 20, 500000, 'Monthly', 10, 4, 'Customer Signed Agreement Uploaded', 1750762929, ''),
(164, 457486, 2, 1000000, 4, 2, 'Veeru Yadav', 'Veeru Corporation', 5, 1735669800, 500000, 'abctraders@test.com', 9876501235, 'Yeshwantpur North Bangalore India 560021', 631132200, 9922001236, 9922001236, 'veeru@st.com', 'Hebbal1', 'Hebbal', 'No Note', 8, 5, 20, 500000, 'Monthly', 10, 4, 'LRN Approved & LAN Generated', 1750762985, 'status_id'),
(167, 920573, 0, 0, 1, 2, 'Arpita Sinha', 'Arpita Traders', 4, 1743445800, 100000, 'mgbafna1957@gmail.com', 1234567890, 'Moti Chamber\r\nHebbal 560024', 915129000, 1452369870, 2563149870, 'arpitasinha@st.com', 'Dwarka Sec 11\r\nDelhi', 'Dwarka Sec 11\r\nDelhi', 'No Note', 6, 0, 22, 0, '', 0, 0, 'DOB, Both Address Updated', 1751626742, 'dob,current_address,permanent_address'),
(168, 920573, 1, 1000000, 1, 2, 'Arpita Sinha', 'Arpita Traders', 4, 1743445800, 100000, 'mgbafna1957@gmail.com', 1234567890, 'Moti Chamber\r\nHebbal 560024', 915129000, 1452369870, 2563149870, 'arpitasinha@st.com', 'Dwarka Sec 11\r\nDelhi', 'Dwarka Sec 11\r\nDelhi', 'No Note', 6, 6, 22, 0, '', 0, 0, 'Loan Details Added', 1751627031, 'introducer_id,product_id,required_loan_amount'),
(169, 920573, 1, 1000000, 2, 2, 'Arpita Sinha', 'Arpita Traders', 4, 1743445800, 100000, 'mgbafna1957@gmail.com', 1234567890, 'Moti Chamber\r\nHebbal 560024', 915129000, 1452369870, 2563149870, 'arpitasinha@st.com', 'Dwarka Sec 11\r\nDelhi', 'Dwarka Sec 11\r\nDelhi', 'No Note', 6, 6, 22, 0, '', 0, 0, 'LRN Verified', 1751627160, 'status_id'),
(170, 920573, 1, 1000000, 2, 2, 'Arpita Sinha', 'Arpita Traders', 4, 1743445800, 100000, 'mgbafna1957@gmail.com', 1234567890, 'Moti Chamber\r\nHebbal 560024', 915129000, 1452369870, 2563149870, 'arpitasinha@st.com', 'Dwarka Sec 11\r\nDelhi', 'Dwarka Sec 11\r\nDelhi', 'No Note', 6, 6, 22, 0, '', 0, 0, 'Documents Uploaded', 1751627253, ''),
(171, 920573, 1, 1000000, 3, 2, 'Arpita Sinha', 'Arpita Traders', 4, 1743445800, 100000, 'mgbafna1957@gmail.com', 1234567890, 'Moti Chamber\r\nHebbal 560024', 915129000, 1452369870, 2563149870, 'arpitasinha@st.com', 'Dwarka Sec 11\r\nDelhi', 'Dwarka Sec 11\r\nDelhi', 'No Note', 6, 6, 22, 0, '', 0, 0, 'Approved', 1751627322, 'status_id'),
(172, 920573, 1, 1000000, 3, 2, 'Arpita Sinha', 'Arpita Traders', 4, 1743445800, 100000, 'mgbafna1957@gmail.com', 1234567890, 'Moti Chamber\r\nHebbal 560024', 915129000, 1452369870, 2563149870, 'arpitasinha@st.com', 'Dwarka Sec 11\r\nDelhi', 'Dwarka Sec 11\r\nDelhi', 'No Note', 6, 6, 22, 700000, 'Weekly', 12, 6, 'Agreement Generated', 1751688094, 'approved_loan_amount,payment_frequency,loan_tenure,roi'),
(173, 920573, 1, 1000000, 3, 2, 'Arpita Sinha', 'Arpita Traders', 4, 1743445800, 100000, 'mgbafna1957@gmail.com', 1234567890, 'Moti Chamber\r\nHebbal 560024', 915129000, 1452369870, 2563149870, 'arpitasinha@st.com', 'Dwarka Sec 11\r\nDelhi', 'Dwarka Sec 11\r\nDelhi', 'No Note', 6, 6, 22, 700000, 'Weekly', 12, 6, 'Customer Signed Agreement Uploaded', 1751688171, '');
INSERT INTO `lrn_audit_history` (`id`, `lrn`, `product_id`, `required_loan_amount`, `status_id`, `cust_type`, `name`, `company_name`, `company_type`, `company_doi`, `company_turnover`, `company_email`, `company_mobile`, `company_address`, `dob`, `mobile`, `alt_mobile`, `email`, `permanent_address`, `current_address`, `brief_note`, `guarantor_id`, `introducer_id`, `bank_account`, `approved_loan_amount`, `payment_frequency`, `loan_tenure`, `roi`, `updation_remark`, `datentime`, `updated_columns`) VALUES
(174, 920573, 1, 1000000, 4, 2, 'Arpita Sinha', 'Arpita Traders', 4, 1743445800, 100000, 'mgbafna1957@gmail.com', 1234567890, 'Moti Chamber\r\nHebbal 560024', 915129000, 1452369870, 2563149870, 'arpitasinha@st.com', 'Dwarka Sec 11\r\nDelhi', 'Dwarka Sec 11\r\nDelhi', 'No Note', 6, 6, 22, 700000, 'Weekly', 12, 6, 'LRN Approved & LAN Generated', 1751692639, 'status_id'),
(175, 189053, 2, 5000001, 1, 2, 'Arpita Sinha', 'Arpita Communicatios', 4, 1740767400, 100000, 'mgbafna1957@gmail.com', 1234567890, 'Moti Chamber\r\nHebbal 560024', 915129000, 1452369870, 2563149870, 'arpitasinha@st.com', '4th A Main Road Hebbala Bangaluru 560024', '4th A Main Road Hebbala Bangaluru 560024', 'No Note', 6, 2, 7, 0, '', 0, 0, 'Guarantor Updated', 1751890378, 'guarantor_id'),
(176, 189053, 2, 5000001, 1, 2, 'Arpita Sinha', 'Arpita Communicatios', 4, 1740767400, 100000, 'mgbafna1957@gmail.com', 1234567890, 'Moti Chamber\r\nHebbal 560024', 915129000, 1452369870, 2563149870, 'arpitasinha@st.com', '4th A Main Road Hebbala Bangaluru 560024', '4th A Main Road Hebbala Bangaluru 560024', 'No Note', 6, 2, 22, 0, '', 0, 0, 'Bank Account Updated', 1751890404, 'bank_account'),
(177, 189053, 2, 5000001, 2, 2, 'Arpita Sinha', 'Arpita Communicatios', 4, 1740767400, 100000, 'mgbafna1957@gmail.com', 1234567890, 'Moti Chamber\r\nHebbal 560024', 915129000, 1452369870, 2563149870, 'arpitasinha@st.com', '4th A Main Road Hebbala Bangaluru 560024', '4th A Main Road Hebbala Bangaluru 560024', 'No Note', 6, 2, 22, 0, '', 0, 0, 'Sent for verification', 1752558978, 'status_id'),
(178, 189053, 2, 5000001, 2, 2, 'Arpita Sinha', 'Arpita Communicatios', 4, 1740767400, 100000, 'mgbafna1957@gmail.com', 1234567890, 'Moti Chamber\r\nHebbal 560024', 915129000, 1452369870, 2563149870, 'arpitasinha@st.com', '4th A Main Road Hebbala Bangaluru 560024', '4th A Main Road Hebbala Bangaluru 560024', 'No Note', 6, 2, 22, 0, '', 0, 0, 'Documents Uploaded', 1752559386, ''),
(179, 189053, 2, 5000001, 3, 2, 'Arpita Sinha', 'Arpita Communicatios', 4, 1740767400, 100000, 'mgbafna1957@gmail.com', 1234567890, 'Moti Chamber\r\nHebbal 560024', 915129000, 1452369870, 2563149870, 'arpitasinha@st.com', '4th A Main Road Hebbala Bangaluru 560024', '4th A Main Road Hebbala Bangaluru 560024', 'No Note', 6, 2, 22, 0, '', 0, 0, 'All documents has verified', 1752559409, 'status_id'),
(180, 189053, 2, 5000001, 3, 2, 'Arpita Sinha', 'Arpita Communicatios', 4, 1740767400, 100000, 'mgbafna1957@gmail.com', 1234567890, 'Moti Chamber\r\nHebbal 560024', 915129000, 1452369870, 2563149870, 'arpitasinha@st.com', '4th A Main Road Hebbala Bangaluru 560024', '4th A Main Road Hebbala Bangaluru 560024', 'No Note', 6, 2, 22, 500000, 'Weekly', 15, 5, 'Agreement Generated', 1752559437, 'approved_loan_amount,payment_frequency,loan_tenure,roi'),
(181, 189053, 2, 5000001, 3, 2, 'Arpita Sinha', 'Arpita Communicatios', 4, 1740767400, 100000, 'mgbafna1957@gmail.com', 1234567890, 'Moti Chamber\r\nHebbal 560024', 915129000, 1452369870, 2563149870, 'arpitasinha@st.com', '4th A Main Road Hebbala Bangaluru 560024', '4th A Main Road Hebbala Bangaluru 560024', 'No Note', 6, 2, 22, 500000, 'Weekly', 15, 5, 'Customer Signed Agreement Uploaded', 1752559467, ''),
(182, 189053, 2, 5000001, 4, 2, 'Arpita Sinha', 'Arpita Communicatios', 4, 1740767400, 100000, 'mgbafna1957@gmail.com', 1234567890, 'Moti Chamber\r\nHebbal 560024', 915129000, 1452369870, 2563149870, 'arpitasinha@st.com', '4th A Main Road Hebbala Bangaluru 560024', '4th A Main Road Hebbala Bangaluru 560024', 'No Note', 6, 2, 22, 500000, 'Weekly', 15, 5, 'LRN Approved & LAN Generated', 1752559489, 'status_id'),
(183, 629938, 0, 0, 1, 1, 'Mamta', '', 0, 0, 0, '', 0, '', 0, 9922001346, 0, 'mamta@test.com', 'Bangalore', '', 'No Note', 0, 0, 23, 0, '', 0, 0, 'Created By Admin', 1752578574, ''),
(184, 629938, 0, 0, 2, 1, 'Mamta', '', 0, 0, 0, '', 0, '', 0, 9922001346, 0, 'mamta@test.com', 'Bangalore', '', 'No Note', 0, 0, 23, 0, '', 0, 0, 'Sent to Verification', 1752578926, 'status_id'),
(185, 629938, 1, 100000, 2, 1, 'Mamta', '', 0, 0, 0, '', 0, '', 0, 9922001346, 0, 'mamta@test.com', 'Bangalore', '', 'No Note', 0, 4, 23, 0, '', 0, 0, 'Loan Detail Added', 1752579019, 'introducer_id,product_id,required_loan_amount'),
(186, 629938, 1, 100000, 2, 1, 'Mamta', '', 0, 0, 0, '', 0, '', 0, 9922001346, 0, 'mamta@test.com', 'Bangalore', '', 'No Note', 10, 4, 23, 0, '', 0, 0, 'Guarantor Added', 1752580574, 'guarantor_id'),
(187, 308829, 0, 0, 1, 2, 'Arpita Sinha', 'Arpita Traders', 4, 1743445800, 100000, 'mgbafna1957@gmail.com', 1234567890, 'Moti Chamber\r\nHebbal 560024', 946665000, 1452369870, 2563149870, 'arpitasinha@st.com', 'Hebbala Bengaluru', 'Hebbala Bengaluru', 'No Note', 0, 0, 22, 0, '', 0, 0, 'DOB, Both Address Updated', 1752830056, 'dob,current_address,permanent_address'),
(189, 633132, 0, 0, 1, 1, 'Mamta', '', 0, 0, 0, '', 0, '', 0, 9922001346, 0, 'mamta@test.com', 'Bangalore', '', 'No Note', 0, 0, 23, 0, '', 0, 0, 'Created By Admin', 1753069796, ''),
(190, 633132, 0, 0, 1, 1, 'Mamta', '', 0, 0, 0, '', 0, '', 0, 9922001346, 0, 'mamta@test.com', 'Bangalore', '', 'No Note', 0, 0, 23, 0, '', 0, 0, 'Documents Uploaded', 1753069962, ''),
(191, 629938, 1, 100000, 2, 1, 'Mamta', '', 0, 0, 0, '', 0, '', 946665000, 9922001346, 0, 'mamta@test.com', 'Hebbala Bangalore', 'Hebbala Bangalore', 'No Note', 10, 4, 23, 0, '', 0, 0, 'DOB  & Both Address Updated', 1753359195, 'dob,current_address,permanent_address'),
(192, 629938, 1, 100000, 2, 1, 'Mamta', '', 0, 0, 0, '', 0, '', 946665000, 9922001346, 0, 'mamta@test.com', 'Hebbala Bangalore', 'Hebbala Bangalore', 'No Note', 10, 4, 23, 0, '', 0, 0, 'Documents Uploaded', 1753359276, ''),
(193, 629938, 1, 100000, 3, 1, 'Mamta', '', 0, 0, 0, '', 0, '', 946665000, 9922001346, 0, 'mamta@test.com', 'Hebbala Bangalore', 'Hebbala Bangalore', 'No Note', 10, 4, 23, 0, '', 0, 0, 'All document has verified', 1753359324, 'status_id'),
(194, 629938, 1, 100000, 3, 1, 'Mamta', '', 0, 0, 0, '', 0, '', 946665000, 9922001346, 0, 'mamta@test.com', 'Hebbala Bangalore', 'Hebbala Bangalore', 'No Note', 10, 4, 23, 20000, 'Weekly', 10, 5, 'Agreement Generated', 1753359388, 'approved_loan_amount,payment_frequency,loan_tenure,roi'),
(195, 629938, 1, 100000, 3, 1, 'Mamta', '', 0, 0, 0, '', 0, '', 946665000, 9922001346, 0, 'mamta@test.com', 'Hebbala Bangalore', 'Hebbala Bangalore', 'No Note', 10, 4, 23, 20000, 'Weekly', 10, 5, 'Customer Signed Agreement Uploaded', 1753359433, ''),
(196, 629938, 1, 100000, 4, 1, 'Mamta', '', 0, 0, 0, '', 0, '', 946665000, 9922001346, 0, 'mamta@test.com', 'Hebbala Bangalore', 'Hebbala Bangalore', 'No Note', 10, 4, 23, 20000, 'Weekly', 10, 5, 'Customer Signed Agreement Verified & LRN Approved & LAN Generated', 1753359494, 'status_id'),
(197, 633132, 0, 0, 2, 1, 'Mamta', '', 0, 0, 0, '', 0, '', 0, 9922001346, 0, 'mamta@test.com', 'Bangalore', '', 'No Note', 0, 0, 23, 0, '', 0, 0, 'Send to verification', 1754280684, 'status_id'),
(198, 633132, 0, 0, 2, 1, 'Mamta', '', 0, 0, 0, '', 0, '', 342210600, 9922001346, 9922001346, 'mamta@test.com', 'Hebbala Bangalore', 'Hebbala Bangalore', 'No Note', 0, 0, 23, 0, '', 0, 0, 'DOB, Alt mobile & both address updated', 1754280770, 'dob,alt_mobile,current_address,permanent_address'),
(199, 633132, 1, 100000, 2, 1, 'Mamta', '', 0, 0, 0, '', 0, '', 342210600, 9922001346, 9922001346, 'mamta@test.com', 'Hebbala Bangalore', 'Hebbala Bangalore', 'No Note', 0, 1, 23, 0, '', 0, 0, 'Loan details added', 1754280825, 'introducer_id,product_id,required_loan_amount'),
(200, 633132, 1, 100000, 2, 1, 'Mamta', '', 0, 0, 0, '', 0, '', 342210600, 9922001346, 9922001346, 'mamta@test.com', 'Hebbala Bangalore', 'Hebbala Bangalore', 'No Note', 10, 1, 23, 0, '', 0, 0, 'Guarantor Added', 1754280836, 'guarantor_id'),
(201, 633132, 1, 100000, 2, 1, 'Mamta', '', 0, 0, 0, '', 0, '', 342210600, 9922001346, 9922001346, 'mamta@test.com', 'Hebbala Bangalore', 'Hebbala Bangalore', 'No Note', 10, 1, 23, 0, '', 0, 0, 'Documents Uploaded', 1754280911, ''),
(202, 633132, 1, 100000, 2, 1, 'Mamta', '', 0, 0, 0, '', 0, '', 342210600, 9922001346, 9922001346, 'mamta@test.com', 'Hebbala Bangalore', 'Hebbala Bangalore', 'No Note', 10, 1, 23, 0, '', 0, 0, 'Documents Uploaded', 1754281099, ''),
(203, 633132, 1, 100000, 3, 1, 'Mamta', '', 0, 0, 0, '', 0, '', 342210600, 9922001346, 9922001346, 'mamta@test.com', 'Hebbala Bangalore', 'Hebbala Bangalore', 'No Note', 10, 1, 23, 0, '', 0, 0, 'All details and documents has verified', 1754281157, 'status_id'),
(204, 633132, 1, 100000, 3, 1, 'Mamta', '', 0, 0, 0, '', 0, '', 342210600, 9922001346, 9922001346, 'mamta@test.com', 'Hebbala Bangalore', 'Hebbala Bangalore', 'No Note', 10, 1, 23, 80000, 'Weekly', 10, 6, 'Agreement Generated', 1754281208, 'approved_loan_amount,payment_frequency,loan_tenure,roi'),
(205, 633132, 1, 100000, 3, 1, 'Mamta', '', 0, 0, 0, '', 0, '', 342210600, 9922001346, 9922001346, 'mamta@test.com', 'Hebbala Bangalore', 'Hebbala Bangalore', 'No Note', 10, 1, 23, 80000, 'Weekly', 10, 6, 'Customer Signed Agreement Uploaded', 1754281308, ''),
(206, 633132, 1, 100000, 4, 1, 'Mamta', '', 0, 0, 0, '', 0, '', 342210600, 9922001346, 9922001346, 'mamta@test.com', 'Hebbala Bangalore', 'Hebbala Bangalore', 'No Note', 10, 1, 23, 80000, 'Weekly', 10, 6, 'LRN Approved & LAN Generated', 1754281382, 'status_id');

-- --------------------------------------------------------

--
-- Table structure for table `lrn_document_upload_history`
--

DROP TABLE IF EXISTS `lrn_document_upload_history`;
CREATE TABLE IF NOT EXISTS `lrn_document_upload_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `lrn` int NOT NULL,
  `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `datentime` int NOT NULL,
  `upload_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_deleted` int NOT NULL,
  `deleted_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `deletion_datentime` int NOT NULL,
  `deletion_remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lrn_document_upload_history`
--

INSERT INTO `lrn_document_upload_history` (`id`, `lrn`, `file_name`, `datentime`, `upload_by`, `is_deleted`, `deleted_by`, `deletion_datentime`, `deletion_remark`) VALUES
(1, 884042, 'poa_1745323669.png', 1745323669, 'BS2', 0, '', 0, ''),
(2, 884042, 'poi_1745324138.png', 1745324138, 'BS2', 0, '', 0, ''),
(3, 884042, 'add payment in_1745324252.png', 1745324252, 'BS2', 1, 'BS2', 1745324711, 'test'),
(4, 884042, 'customer_photo_1745838198.jpg', 1745838198, 'BS2', 0, '', 0, ''),
(8, 914948, 'poi_1747809854.png', 1747809854, 'BS2', 0, '', 0, ''),
(7, 914948, 'pan_1747809854.png', 1747809854, 'BS2', 0, '', 0, ''),
(9, 457486, 'Id_proof_1747811557.png', 1747811557, 'BS2', 0, '', 0, ''),
(10, 308829, 'pan_1747811591.png', 1747811591, 'BS2', 0, '', 0, ''),
(11, 308829, 'poi_1747811591.png', 1747811591, 'BS2', 0, '', 0, ''),
(12, 614138, 'pan_1747812194.png', 1747812194, 'BS2', 0, '', 0, ''),
(13, 614138, 'poi_1747812194.png', 1747812194, 'BS2', 1, 'BS2', 1747812674, 'blur image'),
(14, 614138, 'poi_1747812703.jpg', 1747812703, 'BS2', 0, '', 0, ''),
(15, 614138, 'customer_photo_1747982890.jpg', 1747982890, 'BS2', 1, 'BS2', 1747985860, 'wrong image'),
(16, 614138, 'customer_photo_1747985466.jpg', 1747985466, 'BS2', 1, 'BS2', 1747985485, 'wrong image'),
(17, 614138, 'customer_photo_1747985874.jpg', 1747985874, 'BS2', 1, 'BS2', 1747986327, 'wrong image'),
(18, 614138, 'customer_photo_1747986362.jpg', 1747986362, 'BS2', 0, '', 0, ''),
(19, 614138, 'bank_cheque_1747994553.pdf', 1747994553, 'BS2', 1, 'BS2', 1748084845, 'wrong doc'),
(20, 457486, 'customer_photo_1747994721.jpg', 1747994721, 'BS2', 0, '', 0, ''),
(21, 614138, 'poa_1748079270.pdf', 1748079270, 'BS2', 0, '', 0, ''),
(22, 614138, 'income_proof_1748079270.pdf', 1748079270, 'BS2', 1, 'BS2', 1748082253, 'wrong doc'),
(23, 614138, 'signed_agreement_1748079280.pdf', 1748079280, 'BS2', 1, 'BS2', 1748082226, 'wrong doc'),
(24, 614138, 'income_proof_1748082416.pdf', 1748082416, 'BS2', 0, '', 0, ''),
(25, 614138, 'bank_cheque_1748084882.pdf', 1748084882, 'BS2', 0, '', 0, ''),
(28, 614138, 'signed_agreement_1748411498.pdf', 1748411498, 'BS2', 0, '', 0, ''),
(29, 457486, 'pan_1748423906.jpg', 1748423906, 'BS2', 0, '', 0, ''),
(30, 457486, 'bank_cheque_1748428183.jpg', 1748428183, 'BS2', 0, '', 0, ''),
(31, 457486, 'poi_1748428282.jpg', 1748428282, 'BS2', 1, 'BS2', 1748428306, 'wrong doc'),
(32, 457486, 'poa_1748429118.jpg', 1748429118, 'BS2', 0, '', 0, ''),
(33, 457486, 'poi_1748432992.pdf', 1748432992, 'BS2', 0, '', 0, ''),
(34, 457486, 'printtest2_1748433122.pdf', 1748433122, 'BS2', 0, '', 0, ''),
(35, 457486, 'printtest_1748433122.pdf', 1748433122, 'BS2', 0, '', 0, ''),
(36, 457486, 'income_proof_1748584598.pdf', 1748584598, 'BS2', 0, '', 0, ''),
(37, 457486, 'company_pan_1748590360.jpg', 1748590360, 'BS2', 0, '', 0, ''),
(38, 858612, 'poa_1748664260.pdf', 1748664260, 'BS2', 0, '', 0, ''),
(39, 858612, 'poi_1748664260.pdf', 1748664260, 'BS2', 0, '', 0, ''),
(40, 858612, 'customer_photo_1748664260.pdf', 1748664260, 'BS2', 1, 'BS2', 1748664281, 'wrong doc'),
(41, 858612, 'pan_1748664260.pdf', 1748664260, 'BS2', 0, '', 0, ''),
(42, 858612, 'bank_cheque_1748664260.pdf', 1748664260, 'BS2', 0, '', 0, ''),
(43, 858612, 'income_proof_1748664260.pdf', 1748664260, 'BS2', 0, '', 0, ''),
(44, 858612, 'customer_photo_1748664295.jpg', 1748664295, 'BS2', 0, '', 0, ''),
(45, 858612, 'signed_agreement_1748669134.pdf', 1748669134, 'BS2', 0, '', 0, ''),
(46, 457486, 'signed_agreement_1750762929.pdf', 1750762929, 'BS2', 0, '', 0, ''),
(47, 920573, 'poa_1751627253.jpg', 1751627253, 'BS2', 0, '', 0, ''),
(48, 920573, 'poi_1751627253.jpg', 1751627253, 'BS2', 0, '', 0, ''),
(49, 920573, 'customer_photo_1751627253.jpg', 1751627253, 'BS2', 0, '', 0, ''),
(50, 920573, 'pan_1751627253.jpg', 1751627253, 'BS2', 0, '', 0, ''),
(51, 920573, 'bank_cheque_1751627253.jpg', 1751627253, 'BS2', 0, '', 0, ''),
(52, 920573, 'income_proof_1751627253.jpg', 1751627253, 'BS2', 0, '', 0, ''),
(53, 920573, 'signed_agreement_1751688171.pdf', 1751688171, 'BS2', 0, '', 0, ''),
(54, 189053, 'poa_1752559386.pdf', 1752559386, 'BS2', 0, '', 0, ''),
(55, 189053, 'poi_1752559386.pdf', 1752559386, 'BS2', 0, '', 0, ''),
(56, 189053, 'customer_photo_1752559386.jpg', 1752559386, 'BS2', 0, '', 0, ''),
(57, 189053, 'pan_1752559386.pdf', 1752559386, 'BS2', 0, '', 0, ''),
(58, 189053, 'bank_cheque_1752559386.pdf', 1752559386, 'BS2', 0, '', 0, ''),
(59, 189053, 'income_proof_1752559386.pdf', 1752559386, 'BS2', 0, '', 0, ''),
(60, 189053, 'signed_agreement_1752559467.pdf', 1752559467, 'BS2', 0, '', 0, ''),
(61, 633132, 'customer_photo_1753069962.jpg', 1753069962, 'BS2', 0, '', 0, ''),
(62, 629938, 'poa_1753359276.pdf', 1753359276, 'BS2', 0, '', 0, ''),
(63, 629938, 'poi_1753359276.pdf', 1753359276, 'BS2', 0, '', 0, ''),
(64, 629938, 'customer_photo_1753359276.jpg', 1753359276, 'BS2', 0, '', 0, ''),
(65, 629938, 'pan_1753359276.jpg', 1753359276, 'BS2', 0, '', 0, ''),
(66, 629938, 'bank_cheque_1753359276.jpg', 1753359276, 'BS2', 0, '', 0, ''),
(67, 629938, 'income_proof_1753359276.jpg', 1753359276, 'BS2', 0, '', 0, ''),
(68, 629938, 'signed_agreement_1753359433.pdf', 1753359433, 'BS2', 0, '', 0, ''),
(69, 633132, 'poa_1754280911.jpg', 1754280911, 'BS2', 0, '', 0, ''),
(70, 633132, 'poi_1754280911.jpg', 1754280911, 'BS2', 0, '', 0, ''),
(71, 633132, 'pan_1754280911.jpg', 1754280911, 'BS2', 0, '', 0, ''),
(72, 633132, 'bank_cheque_1754280911.jpg', 1754280911, 'BS2', 0, '', 0, ''),
(73, 633132, 'income_proof_1754280911.jpg', 1754280911, 'BS2', 0, '', 0, ''),
(74, 633132, 'poo_1754281099.pdf', 1754281099, 'BS2', 0, '', 0, ''),
(75, 633132, 'signed_agreement_1754281308.pdf', 1754281308, 'BS2', 0, '', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `lrn_list`
--

DROP TABLE IF EXISTS `lrn_list`;
CREATE TABLE IF NOT EXISTS `lrn_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `lrn` int NOT NULL,
  `status_id` int NOT NULL,
  `crn` int NOT NULL,
  `datentime` int NOT NULL,
  `created_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `source_id` int NOT NULL,
  `allocated_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lrn_list`
--

INSERT INTO `lrn_list` (`id`, `lrn`, `status_id`, `crn`, `datentime`, `created_by`, `source_id`, `allocated_id`) VALUES
(4, 884042, 1, 1004, 1745210504, 'BS2', 5, ''),
(7, 535694, 1, 1001, 1746428594, 'BS2', 1, ''),
(8, 962388, 1, 1001, 1746435397, 'BS2', 1, ''),
(9, 854764, 6, 1001, 1746435419, 'BS2', 1, ''),
(10, 383568, 7, 1001, 1746435526, 'BS2', 1, ''),
(11, 858612, 4, 1004, 1746442752, 'BS2', 5, ''),
(12, 189053, 4, 1004, 1747719345, 'BS2', 5, ''),
(13, 920573, 4, 1004, 1747740451, 'BS2', 5, ''),
(15, 914948, 8, 1004, 1747809854, 'BS2', 5, ''),
(16, 457486, 4, 1001, 1747811557, 'BS2', 1, ''),
(17, 308829, 1, 1004, 1747811591, 'BS2', 5, ''),
(18, 614138, 4, 1004, 1747812194, 'BS2', 5, ''),
(26, 633132, 4, 1016, 1753069796, 'BS2', 1, ''),
(24, 629938, 4, 1016, 1752578574, 'BS2', 1, '');

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
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`id`, `description`, `submenu_id_name`, `icon_name`, `parent_menu_id`) VALUES
(1, 'CRM', 'CRM', 'pie-chart', 1),
(2, 'LRN Management', 'LRN', 'file', 1),
(26, 'Chat', 'CHAT', 'message-square', 1),
(4, 'User Management', 'USER', 'user', 1),
(5, 'Report Management', 'REPORT', 'file', 1),
(27, 'Chat', 'CHAT', 'message-square', 3),
(8, 'Site Management', 'SITE', 'dribbble', 1),
(7, 'Management Account', 'FUND', 'dollar-sign', 1),
(9, 'Menu Management', 'MENU', 'align-left', 1),
(12, 'CRM', 'CRM', 'pie-chart', 2),
(13, 'URN Management', 'URN', 'users', 2),
(14, 'Account', 'ACCOUNT', 'user', 2),
(25, 'LAN Management', 'LAN', 'file', 1),
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
(3, 'Customer');

-- --------------------------------------------------------

--
-- Table structure for table `processing_charges_list`
--

DROP TABLE IF EXISTS `processing_charges_list`;
CREATE TABLE IF NOT EXISTS `processing_charges_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(5120) COLLATE utf8mb4_general_ci NOT NULL,
  `percentage` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `processing_charges_list`
--

INSERT INTO `processing_charges_list` (`id`, `description`, `percentage`) VALUES
(1, 'New Loan', 2.5),
(2, 'Top Up', 3.5),
(3, 'Loan Extension', 2),
(4, 'ROI Updation', 2.5);

-- --------------------------------------------------------

--
-- Table structure for table `product_list`
--

DROP TABLE IF EXISTS `product_list`;
CREATE TABLE IF NOT EXISTS `product_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(1024) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_list`
--

INSERT INTO `product_list` (`id`, `description`) VALUES
(1, 'Gold Loan'),
(2, 'Personal Loan');

-- --------------------------------------------------------

--
-- Table structure for table `repayment_schedule_list`
--

DROP TABLE IF EXISTS `repayment_schedule_list`;
CREATE TABLE IF NOT EXISTS `repayment_schedule_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `lan` bigint NOT NULL,
  `lrn` int NOT NULL,
  `crn` int NOT NULL,
  `principal` float NOT NULL,
  `interest` float NOT NULL,
  `other_charges` float NOT NULL,
  `due_amount` float NOT NULL,
  `due_date` int NOT NULL,
  `collected_amount` float NOT NULL,
  `collected_date` int NOT NULL,
  `status` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=416 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `repayment_schedule_list`
--

INSERT INTO `repayment_schedule_list` (`id`, `lan`, `lrn`, `crn`, `principal`, `interest`, `other_charges`, `due_amount`, `due_date`, `collected_amount`, `collected_date`, `status`) VALUES
(111, 8586121748928019, 858612, 1004, 15000, 1100, 0, 16100, 1754937000, 0, 0, 0),
(110, 8586121748928019, 858612, 1004, 0, 1100, 0, 1100, 1754332200, 0, 0, 0),
(109, 8586121748928019, 858612, 1004, 0, 1100, 0, 1100, 1753727400, 0, 0, 0),
(108, 8586121748928019, 858612, 1004, 0, 1100, 0, 1100, 1753122600, 0, 0, 0),
(107, 8586121748928019, 858612, 1004, 0, 1100, 0, 1100, 1752517800, 0, 0, 0),
(106, 8586121748928019, 858612, 1004, 0, 1100, 0, 1100, 1751913000, 0, 0, 0),
(105, 8586121748928019, 858612, 1004, 0, 1300, 0, 1300, 1751308200, 700, 1750185000, 2),
(93, 8586121748928019, 858612, 1004, 0, 858, 0, 858, 1750703400, 500, 1750185000, 2),
(92, 8586121748928019, 858612, 1004, 0, 500, 0, 500, 1750098600, 100, 1749321000, 2),
(91, 8586121748928019, 858612, 1004, 0, 500, 0, 500, 1749493800, 500, 1749321000, 1),
(101, 8586121748928019, 858612, 1004, 0, 0, 0, 0, 1750098600, 200, 1749407400, 2),
(102, 8586121748928019, 858612, 1004, 0, 0, 0, 0, 1750098600, 100, 1749407400, 2),
(104, 8586121748928019, 858612, 1004, 0, 0, 0, 0, 1750098600, 100, 1749493800, 2),
(145, 6141381750335196, 614138, 1004, 110000, 5500, 0, 115500, 1908037800, 0, 0, 0),
(144, 6141381750335196, 614138, 1004, 0, 5500, 0, 5500, 1876501800, 0, 0, 0),
(143, 6141381750335196, 614138, 1004, 0, 5500, 0, 5500, 1844965800, 0, 0, 0),
(142, 6141381750335196, 614138, 1004, 0, 5500, 0, 5500, 1813343400, 0, 0, 0),
(141, 6141381750335196, 614138, 1004, 0, 7700, 0, 7700, 1781807400, 0, 0, 0),
(322, 4574861750762985, 457486, 1001, 550000, 21500, 0, 571500, 1776969000, 0, 0, 0),
(321, 4574861750762985, 457486, 1001, 0, 21500, 0, 21500, 1774290600, 0, 0, 0),
(320, 4574861750762985, 457486, 1001, 0, 21500, 0, 21500, 1771871400, 0, 0, 0),
(319, 4574861750762985, 457486, 1001, 0, 21500, 0, 21500, 1769193000, 0, 0, 0),
(318, 4574861750762985, 457486, 1001, 0, 21500, 0, 21500, 1766514600, 0, 0, 0),
(317, 4574861750762985, 457486, 1001, 0, 21500, 0, 21500, 1763922600, 0, 0, 0),
(316, 4574861750762985, 457486, 1001, 0, 21500, 0, 21500, 1761244200, 0, 0, 0),
(315, 4574861750762985, 457486, 1001, 0, 21500, 0, 21500, 1758652200, 0, 0, 0),
(331, 9205731751692639, 920573, 1004, 0, 42000, 0, 42000, 1753468200, 0, 0, 0),
(314, 4574861750762985, 457486, 1001, 0, 21500, 0, 21500, 1755973800, 10800, 1750789800, 2),
(313, 4574861750762985, 457486, 1001, 0, 21200, 0, 21200, 1753295400, 21200, 1750789800, 1),
(332, 9205731751692639, 920573, 1004, 0, 42000, 0, 42000, 1754073000, 0, 0, 0),
(329, 9205731751692639, 920573, 1004, 0, 42000, 0, 42000, 1752258600, 0, 0, 0),
(330, 9205731751692639, 920573, 1004, 0, 42000, 0, 42000, 1752863400, 0, 0, 0),
(333, 9205731751692639, 920573, 1004, 0, 42000, 0, 42000, 1754677800, 0, 0, 0),
(334, 9205731751692639, 920573, 1004, 0, 42000, 0, 42000, 1755282600, 0, 0, 0),
(335, 9205731751692639, 920573, 1004, 0, 42000, 0, 42000, 1755887400, 0, 0, 0),
(336, 9205731751692639, 920573, 1004, 0, 42000, 0, 42000, 1756492200, 0, 0, 0),
(337, 9205731751692639, 920573, 1004, 0, 42000, 0, 42000, 1757097000, 0, 0, 0),
(338, 9205731751692639, 920573, 1004, 0, 42000, 0, 42000, 1757701800, 0, 0, 0),
(339, 9205731751692639, 920573, 1004, 0, 42000, 0, 42000, 1758306600, 0, 0, 0),
(340, 9205731751692639, 920573, 1004, 700000, 42000, 0, 742000, 1758911400, 0, 0, 0),
(341, 8586121748928019, 858612, 1004, 0, 0, 0, 0, 1750703400, 150, 1751653800, 2),
(410, 6331321754281382, 633132, 1016, 0, 4400, 0, 4400, 1757269800, 0, 0, 0),
(409, 6331321754281382, 633132, 1016, 0, 4400, 0, 4400, 1756665000, 0, 0, 0),
(408, 6331321754281382, 633132, 1016, 0, 4400, 0, 4400, 1756060200, 0, 0, 0),
(407, 6331321754281382, 633132, 1016, 0, 4400, 2000, 6400, 1755455400, 0, 0, 0),
(397, 6331321754281382, 633132, 1016, 0, 4800, 0, 4800, 1754850600, 0, 0, 0),
(396, 6299381753359494, 629938, 1016, 30000, 1600, 0, 31600, 1759343400, 0, 0, 0),
(395, 6299381753359494, 629938, 1016, 0, 1600, 0, 1600, 1758738600, 0, 0, 0),
(394, 6299381753359494, 629938, 1016, 0, 1600, 0, 1600, 1758133800, 0, 0, 0),
(393, 6299381753359494, 629938, 1016, 0, 1600, 0, 1600, 1757529000, 0, 0, 0),
(392, 6299381753359494, 629938, 1016, 0, 1600, 0, 1600, 1756924200, 0, 0, 0),
(391, 6299381753359494, 629938, 1016, 0, 1600, 0, 1600, 1756319400, 0, 0, 0),
(390, 6299381753359494, 629938, 1016, 0, 1600, 0, 1600, 1755714600, 0, 0, 0),
(389, 6299381753359494, 629938, 1016, 0, 1600, 0, 1600, 1755109800, 0, 0, 0),
(388, 6299381753359494, 629938, 1016, 0, 1600, 0, 1600, 1754505000, 0, 0, 0),
(387, 6299381753359494, 629938, 1016, 0, 1516, 0, 1516, 1753900200, 0, 0, 2),
(386, 1890531752559489, 189053, 1004, 500000, 25000, 0, 525000, 1761589800, 0, 0, 0),
(385, 1890531752559489, 189053, 1004, 0, 25000, 0, 25000, 1760985000, 0, 0, 0),
(384, 1890531752559489, 189053, 1004, 0, 25000, 0, 25000, 1760380200, 0, 0, 0),
(383, 1890531752559489, 189053, 1004, 0, 25000, 0, 25000, 1759775400, 0, 0, 0),
(382, 1890531752559489, 189053, 1004, 0, 25000, 0, 25000, 1759170600, 0, 0, 0),
(381, 1890531752559489, 189053, 1004, 0, 25000, 0, 25000, 1758565800, 0, 0, 0),
(380, 1890531752559489, 189053, 1004, 0, 25000, 0, 25000, 1757961000, 0, 0, 0),
(379, 1890531752559489, 189053, 1004, 0, 25000, 0, 25000, 1757356200, 0, 0, 0),
(378, 1890531752559489, 189053, 1004, 0, 25000, 0, 25000, 1756751400, 0, 0, 0),
(377, 1890531752559489, 189053, 1004, 0, 25000, 0, 25000, 1756146600, 0, 0, 0),
(376, 1890531752559489, 189053, 1004, 0, 25000, 0, 25000, 1755541800, 0, 0, 0),
(375, 1890531752559489, 189053, 1004, 0, 25000, 0, 25000, 1754937000, 0, 0, 0),
(374, 1890531752559489, 189053, 1004, 0, 25000, 0, 25000, 1754332200, 0, 0, 0),
(373, 1890531752559489, 189053, 1004, 0, 25000, 0, 25000, 1753727400, 15000, 1752517800, 2),
(372, 1890531752559489, 189053, 1004, 0, 25000, 0, 25000, 1753122600, 25000, 1752517800, 1),
(411, 6331321754281382, 633132, 1016, 0, 4400, 0, 4400, 1757874600, 0, 0, 0),
(412, 6331321754281382, 633132, 1016, 0, 4400, 0, 4400, 1758479400, 0, 0, 0),
(413, 6331321754281382, 633132, 1016, 0, 4400, 0, 4400, 1759084200, 0, 0, 0),
(414, 6331321754281382, 633132, 1016, 0, 4400, 0, 4400, 1759689000, 0, 0, 0),
(415, 6331321754281382, 633132, 1016, 80000, 4400, 0, 84400, 1760293800, 0, 0, 0);

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
(1, 'LMS V2 2025', 'Moti Corporation', 'www.moticorporation.com', 'LMS V2.0', 'lms-logo.png');

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
(2, 'G Yogesh Bafna', 'yogesh@bafna.net', 9902012547, 'Director', 'Management', 1, 1, '1,2,26,4,5,8,7,25,21,22,23', '1,2,46,45,57,18,56,12,16,39,8,9,55,7,47,52,51,50,49,48,53,41,5,42,43,44'),
(8, 'Manish Bafna', 'manish@bafna.net', 123, 'Manager', 'Management', 3, 1, '1,2,25,23', '1,2,46,45,47,52,51,50,49,48,43,44'),
(10, 'Amit Sriwastav', 'amit@moticorporation.com', 7618844888, 'Developer', 'IT', 8, 1, '1,2,26,4,5,8,7,25,21,22', '1,2,46,45,57,18,56,12,16,39,8,9,55,7,47,52,51,50,49,48,41,5,42'),
(1, 'admin', 'info@campus-abroad.co.in', 9902012547, 'Admin', 'Management', 7, 1, '1,2,3,4,5,6,7,8,9', '');

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
-- Table structure for table `submenu_items`
--

DROP TABLE IF EXISTS `submenu_items`;
CREATE TABLE IF NOT EXISTS `submenu_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `href_link` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `parent_menu_item_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `submenu_items`
--

INSERT INTO `submenu_items` (`id`, `description`, `href_link`, `parent_menu_item_id`) VALUES
(1, 'LRNs', '../lrn_management/lrn_list.php', 1),
(2, 'Leads', '../lead_management/temp_leads.php', 1),
(54, 'Request', 'my_request_list.php', 16),
(5, 'Calls', '../communication_history_management/callback_list.php', 22),
(6, 'Menu Items', '../menu_management/menu_items.php', 9),
(7, 'Commission', '../commission_management/commission_history.php', 7),
(8, 'Site Info', '../site_management/site_settings.php', 8),
(9, 'Options', '../site_management/portal_settings.php', 8),
(46, 'Calculator', '../loan_calculator/calculate_loan.php', 1),
(47, 'Dispatch List', '../lan_management/dispatch_list.php', 25),
(12, 'Lead Source', '../report_management/lead_source_report.php', 5),
(52, 'Part Payment List', '../lan_management/partial_payment_list.php', 25),
(51, 'Received Payment List', '../lan_management/rcvd_payment_list.php', 25),
(16, 'Customer', '../report_management/customer_report.php', 5),
(18, 'Users', '../staff_management/staff_list.php', 4),
(50, 'Missed Payment List', '../lan_management/missed_payment_list.php', 25),
(49, 'Due Payment List', '../lan_management/due_payment_list.php', 25),
(48, 'Active LAN', '../lan_management/lan_list.php', 25),
(22, 'Submenu Items', '../menu_management/submenu_items.php', 9),
(24, 'Menu List', '../menu_management/menu_list.php', 9),
(25, 'Profile', '../myaccount/myaccount.php', 14),
(53, 'LAN Requests', '../lan_management/lan_request_list.php', 25),
(27, 'Wallet', '../myaccount/mywallet.php', 14),
(28, 'Create Lead', '../lead_management/temp_leads.php', 12),
(29, 'URN Lead', '../urn_management/leads.php', 12),
(45, 'Introducers', '../introducer_management/list.php', 1),
(34, 'Profile', 'myaccount.php', 17),
(35, 'Settings', 'myaccount.php?tab=settings', 17),
(36, 'LAN', 'mylan_list.php', 16),
(37, 'Application', 'mylrn_list.php', 16),
(39, 'Product Performance', '../report_management/product_performance_report.php', 5),
(40, 'University Performance', '../report_management/university_performance_report.php', 20),
(41, 'Email Alerts', '../alert_management/email_alerts_settings.php', 21),
(42, 'Emails', '../communication_history_management/email_history.php', 22),
(43, 'CRN List', '../crn_management/crn_list.php', 23),
(44, 'Create CRN', '../crn_management/create_crn.php', 23),
(55, 'Features', '../site_management/lms_features.php', 8),
(56, 'My Activities', '../staff_management/staff_activity_history.php', 4),
(57, 'Chat List', '../chat_management/chat_list.php', 26),
(58, 'Chat Support', 'chat_history.php?chat_with=CS', 27);

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
) ENGINE=MyISAM AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `temp_leads`
--

INSERT INTO `temp_leads` (`id`, `name`, `mobile`, `email`, `datentime`, `creator_id`, `creator_type`, `source_id`, `status`, `remark`, `hidden`) VALUES
(1, 'Jasi', 1234567890, 'jasi@st.com', 1724820168, 2, 1, 5, 0, '', 0),
(2, 'Abhigail Stephen', 9980642004, 'abhigailstephen123@gmail.com', 1724822000, 2, 1, 1, 0, '', 0),
(3, 'Adithya Sidharth', 9863563555, 'Adithya67@gamil.com', 1724822000, 2, 1, 3, 0, '', 0),
(4, 'Alshiya Ashok', 9646355356, 'Alshiyaashok@gmail.com', 1724822000, 2, 1, 2, 0, '', 0),
(5, 'Amitha', 7852655365, 'Amitha996@gmail.com', 1724822000, 2, 1, 4, 0, '', 0),
(6, 'Arun', 7788522643, 'Aruns501@gmail.com', 1724822000, 2, 1, 6, 0, '', 0),
(7, 'Ashwini', 8865321543, 'Ashwini101@gmail.com', 1724822000, 2, 1, 1, 0, '', 0),
(8, 'Bhavya', 8812563464, 'Bhavya996@gmail.com', 1724822000, 2, 1, 3, 0, '', 0),
(9, 'Binnui', 8842336645, 'Binnui@gmail.com', 1724822000, 2, 1, 1, 0, '', 0),
(10, 'Charan', 8965633312, 'charan@gmail.com', 1724822000, 2, 1, 1, 0, '', 0),
(11, 'Chiranjeevi', 8296639747, 'chiranjeevi@gamil.com', 1724822000, 2, 1, 1, 0, '', 0),
(12, 'Darshan', 9972704287, 'darshan@gmail.com', 1724822000, 2, 1, 4, 0, '', 0),
(13, 'Deepa Dominic', 9008165341, 'deepadominic@gmaail.com', 1724822000, 2, 1, 3, 0, '', 0),
(14, 'Deon', 9856326332, 'deon635@gmail.com', 1724822000, 2, 1, 6, 0, '', 0),
(15, 'Ethan', 7125346987, 'ethanalvin@gmail.com', 1724822000, 2, 1, 4, 0, '', 0),
(16, 'Elizabeth', 8835633456, 'elezabeth@gmail.com', 1724822000, 2, 1, 3, 0, '', 0),
(17, 'Franklin', 9796523366, 'franklin@gmail.com', 1724822000, 2, 1, 6, 0, '', 0),
(18, 'Ganga', 9633543352, 'ganga@gmail.com', 1724822000, 2, 1, 3, 0, '', 0),
(19, 'Harshitha', 9853332332, 'harshitha@gmail.com', 1724822000, 2, 1, 1, 0, '', 0),
(20, 'Janani', 9756223356, 'jananasprin@gmail.com', 1724822000, 2, 1, 4, 0, '', 0),
(21, 'Jeni', 9899886231, 'jeni@gmail.com', 1724822000, 2, 1, 1, 0, '', 0),
(22, 'Karthik', 7782146531, 'Karthik@gmail.com', 1724822000, 2, 1, 4, 0, '', 0),
(23, 'Kavana', 7080901452, 'kavana@gmail.com', 1724822000, 2, 1, 6, 0, '', 0),
(24, 'Kiran', 9080125656, 'kiran@gmail.com', 1724822000, 2, 1, 1, 0, '', 0),
(25, 'Kruthika', 8814632545, 'kruthika@gmail.com', 1724822000, 2, 1, 3, 0, '', 0),
(26, 'Leela', 8810456328, 'leela@gmail.com', 1724822000, 2, 1, 1, 0, '', 0),
(27, 'Malathi', 8932567234, 'malathi@gmail.com', 1724822000, 2, 1, 4, 0, '', 0),
(28, 'Manohar', 9970254637, 'manohar@gmail.com', 1724822000, 2, 1, 6, 0, '', 0),
(29, 'Megha', 9901035469, 'megha@gmail.com', 1724822000, 2, 1, 3, 0, '', 0),
(30, 'Mitesh', 9972363332, 'mitesh@gmail.com', 1724822000, 2, 1, 1, 0, '', 0),
(31, 'Mugilraj', 9859898565, 'mugilraj@gmail.com', 1724822000, 2, 1, 4, 0, '', 0),
(32, 'Naveen', 9898653354, 'naveen@gmail.com', 1724822000, 2, 1, 6, 0, '', 0),
(33, 'Nikitha', 7896423566, 'nikitha@gmail.com', 1724822000, 2, 1, 4, 0, '', 0),
(34, 'Nishanth', 8965633565, 'nishanth@gmail.com', 1724822000, 2, 1, 3, 0, '', 0),
(35, 'Parthiban', 9444499276, 'parthiban@gmail.com', 1724822000, 2, 1, 3, 0, '', 0),
(36, 'Pavithra', 9663355332, 'pavithra@gmail.com', 1724822000, 2, 1, 1, 0, '', 0),
(37, 'Praveen', 9916335544, 'praveen@gmail.com', 1724822000, 2, 1, 6, 0, '', 0),
(38, 'Priya', 9815635463, 'priya@gmail.com', 1724822000, 2, 1, 3, 0, '', 0),
(39, 'Raju', 9236556633, 'raju1@gmail.com', 1724822000, 2, 1, 1, 0, '', 0),
(40, 'Ranjitha', 9815363335, 'ranjitha@gmail.com', 1724822000, 2, 1, 3, 0, '', 0),
(41, 'Rebecca', 9665463255, 'rebecca@gmail.com', 1724822000, 2, 1, 6, 0, '', 0),
(42, 'Reeta', 8893256633, 'reeta@gmail.com', 1724822000, 2, 1, 3, 0, '', 0),
(43, 'Richard', 9635533355, 'Richard@gmail.com', 1724822000, 2, 1, 3, 0, '', 0),
(44, 'Sam Keith', 9988665332, 'samkeith@gmail.com', 1724822000, 2, 1, 1, 0, '', 0),
(45, 'Sandeep', 9987666522, 'sandeep@gmail.com', 1724822000, 2, 1, 4, 0, '', 0),
(46, 'Sanjana', 8766646362, 'sanjana@gmail.com', 1724822000, 2, 1, 1, 0, '', 0),
(47, 'Sathvik', 7898965456, 'sathvik@gmail.com', 1724822000, 2, 1, 3, 0, '', 0),
(48, 'sharath', 7954654645, 'sharath@gmail.com', 1724822000, 2, 1, 6, 0, '', 0),
(49, 'Srinidhi', 8986555455, 'srinidhi@gmail.com', 1724822000, 2, 1, 1, 0, '', 0),
(50, 'Thanshika', 9363255645, 'thanshika@gmail.com', 1724822000, 2, 1, 6, 0, '', 0),
(51, 'Raj', 9988665533, 'raj@st.com', 1726120904, 2, 1, 3, 0, '', 0),
(52, 'Rajiv', 9977558822, 'rajiv1@st.com', 1726122449, 2, 1, 4, 0, '', 0),
(53, 'Deepak', 9902012548, 'deepak@st.com', 1728104323, 2, 1, 1, 0, '', 0),
(54, 'Suhana', 9922001234, 'suhana@st.com', 1728104881, 2, 1, 3, 0, '', 0),
(55, 'Reet', 9922001236, 'reet@st.com', 1728104881, 2, 1, 3, 0, '', 0),
(56, 'Yogesh', 9922001237, 'yogesh@st.com', 1728104881, 2, 1, 1, 0, '', 0),
(57, 'Mamta', 9922001346, '', 1728104881, 2, 1, 1, 0, '', 0),
(58, 'Tanvi', 9922001365, '', 1728104881, 2, 1, 4, 0, '', 0),
(59, 'Sumita', 9922001458, 'sumita@cr.com', 1728104881, 2, 1, 3, 0, '', 0),
(60, 'Susmita', 8855447629, 'susmita@st.com', 1728104881, 2, 1, 3, 0, '', 0),
(61, 'yogita', 9900213654, 'yogita@st.com', 1728104881, 2, 1, 1, 0, '', 0),
(62, 'Rachita', 9988123456, 'rachita@st.com', 1728104881, 2, 1, 1, 0, '', 0),
(63, 'Archit', 9920201452, 'archit@st.com', 1728104881, 2, 1, 4, 0, '', 0),
(64, 'Veeru', 9922001235, 'veeru@test.com', 1728104955, 2, 1, 2, 1, 'CRN Created', 1),
(65, 'Mamta', 9922001346, 'mamta@test.com', 1728104955, 2, 1, 1, 1, 'CRN Created', 1),
(66, 'Tanvi', 9922001365, '', 1728104955, 2, 1, 4, 0, '', 0),
(67, 'Chandrika', 9922001452, 'chandrika@test.com', 1728104955, 2, 1, 2, 0, '', 0),
(68, 'arpita', 9945251325, 'arpita@cr.com', 1728104955, 2, 1, 2, 0, '', 0),
(69, 'sarvesh', 9911002453, 'sarvesh@test.com', 1728104955, 2, 1, 2, 1, 'CRN Created', 1),
(70, 'Shiju Trillion', 70070070, 'shijuGBP@GBP.Com', 1728106478, 2, 1, 1, 0, '', 0),
(71, 'Nimil Philip', 7994970111, 'nimilphilipzoo@gmail.com', 1729598949, 2, 1, 3, 1, 'CRN Created', 1),
(72, 'test', 9072430726, 'nimilphilip@gmail.com', 1729665397, 2, 1, 3, 1, 'CRN Created', 1),
(73, 'Trisha', 9865324102, 'trisha@cr.com', 1752639520, 2, 1, 2, 0, '', 0),
(74, 'Reet Sinha', 8653290147, 'reet@st.com', 1752639627, 2, 1, 1, 0, '', 0),
(75, 'Arpita', 8456321097, 'arpitasinha@st.com', 1752639705, 2, 1, 3, 0, '', 0),
(76, 'Jahnavi', 8563290147, '', 1752640117, 2, 1, 2, 0, '', 0);

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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

-- --------------------------------------------------------

--
-- Table structure for table `working_on_lan_list`
--

DROP TABLE IF EXISTS `working_on_lan_list`;
CREATE TABLE IF NOT EXISTS `working_on_lan_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `lan` bigint NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=96 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `working_on_lrn_list`
--

DROP TABLE IF EXISTS `working_on_lrn_list`;
CREATE TABLE IF NOT EXISTS `working_on_lrn_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `lrn` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=279 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

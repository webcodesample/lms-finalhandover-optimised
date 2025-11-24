-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 01, 2025 at 12:37 PM
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
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bank_accounts_list`
--

INSERT INTO `bank_accounts_list` (`id`, `crn`, `account_holder_name`, `bank_name`, `branch_address`, `ifsc`, `account_number`, `verification_status`) VALUES
(7, 1004, 'Arpita Sinha', 'HDFC', 'Hebbal Bangalore', 'HDFC12345', 1542369870, 0),
(12, 1004, 'Arpita Sinha', 'HDFC', 'Hebbal', 'HDFC12345', 542301, 0),
(16, 1002, 'Arpita', 'HDFC', 'RT Nagar', 'HDFC12345', 4563201, 0);

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `company_type_list`
--

INSERT INTO `company_type_list` (`id`, `description`) VALUES
(1, 'Pvt Ltd'),
(2, 'LLP'),
(3, 'OPC Pvt Ltd'),
(4, 'Properietership'),
(5, 'Partnership');

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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `crn_company_details`
--

INSERT INTO `crn_company_details` (`id`, `crn`, `name`, `mobile`, `email`, `address`, `type`, `doi`, `annual_turnover`) VALUES
(1, 1004, 'Arpita Traders', 1234567890, 'mgbafna1957@gmail.com', 'Moti Chamber\r\nHebbal 560024', 4, 1743445800, 100000);

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
) ENGINE=MyISAM AUTO_INCREMENT=1015 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers_list`
--

INSERT INTO `customers_list` (`id`, `name`, `mobile`, `alt_mobile`, `email`, `dob`, `brief_note`, `company_name`, `cust_type`, `permanent_address`, `lead_source_id`, `primary_bank`) VALUES
(1001, 'Veeru', 9922001235, 0, 'veeru@st.com', 0, 'No Note', 'ABC Traders', 2, 'Hebbal', 1, 0),
(1002, 'arpita', 9945251325, 1234569870, 'arpita@st.com', 0, 'No Note', 'ABC Traders', 1, 'hebbala', 5, 16),
(1004, 'Arpita Sinha', 1452369870, 2563149870, 'arpitasinha@st.com', 0, 'No Note', 'Arpita Traders', 2, 'hebbala', 5, 12),
(1005, 'Sarala Sinha', 1452369870, 2563141234, 'saralasinha@test.com', 0, 'Special Remark', '', 1, 'hebbala bangalore', 5, 0),
(1006, 'Suhana', 9922001234, 5236498710, 'suhana@st.com', 0, 'No Note', '', 1, 'Yelahnka Bangalore', 3, 0),
(1007, 'sarvesh', 9911002453, 0, 'sarvesh@st.com', 0, 'No Note', 'Sarvesh Corp', 2, 'Yeshwantpur', 2, 0),
(1013, 'test', 9072430726, 0, 'nimilphilip@gmail.com', 0, 'No Note', '', 1, 'aaaaa', 3, 0),
(1010, 'Raghav', 7586329014, 2513680495, 'raghav@test.com', 0, 'No Note', 'XYZ Traders', 1, 'Hebbal', 5, 0),
(1012, 'Veeru', 1452369870, 2563149870, 'arpita@test.com', 0, 'No Note', '', 1, 'aaaaa', 5, 0),
(1014, 'Nimil Philip', 7994970111, 0, 'nimilphilipzoo@gmail.com', 0, 'No Note', '', 1, 'test', 3, 0);

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
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `document_list`
--

INSERT INTO `document_list` (`id`, `name`, `uploaded_file_name`, `is_required`) VALUES
(1, 'Proof of Address', 'poa', 1),
(2, 'Proof of Identity', 'poi', 1),
(3, 'Customer Photo', 'customer_photo', 1),
(4, 'PAN', 'pan', 1),
(5, 'Canceled Cheque', 'bank_cheque', 1);

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `guarantor_list`
--

INSERT INTO `guarantor_list` (`id`, `crn`, `name`, `email`, `mobile`, `current_address`, `permanent_address`, `company`, `document_title`) VALUES
(6, 1004, 'Rahul Kumar', 'rahulkumar@testcom', 8523614970, 'Hebbal', 'Hebbal', 'Individual', 'idproof'),
(5, 1002, 'Test Guarantor', 'tgc@test.com', 8523697410, 'Hebbal', 'Hebbal', 'TG Corp', 'idproof'),
(7, 1004, 'Veeru', 'testuser@test.com', 9380006337, 'adadad', 'asadadad', 'ABC Corp', 'pan');

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
(2, 'Pre Verification', 2, 1, 1744977988),
(3, 'Verified', 3, 1, 1744977988),
(4, 'Approved', 4, 1, 1744977988),
(5, 'Inactive', 5, 1, 1744977988),
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
) ENGINE=MyISAM AUTO_INCREMENT=116 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(102, 'BS1'),
(103, 'BS1'),
(104, 'BS1'),
(105, 'BS1'),
(106, 'BS1'),
(107, 'BS1'),
(108, 'BS2'),
(109, 'BS1'),
(110, 'BS1'),
(111, 'BS2'),
(112, 'BS2'),
(113, 'BS2'),
(114, 'BS2'),
(115, 'BS2');

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
) ENGINE=MyISAM AUTO_INCREMENT=135 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `login_detail`
--

INSERT INTO `login_detail` (`id`, `ref_id`, `username`, `password`, `login_type`, `status`) VALUES
(1, 'BS1', 'admin', '@dmin', 7, 1),
(127, 'CR1007', 'sarvesh@st.com', '123456', 5, 1),
(32, 'BS2', 'yogesh@bafna.net', '12345', 1, 1),
(37, 'BS8', 'manish@bafna.net', '123456', 8, 1),
(57, 'BS10', 'amit@moticorporation.com', '123456', 8, 1),
(128, 'CR1008', 'sumita@st.com', '123456', 5, 1),
(129, 'CR1009', 'rachita@st.com', '123456', 5, 1),
(130, 'CR1010', 'raghav@test.com', '123456', 5, 1),
(131, 'CR1011', 'veeru@test.com', '123456', 5, 1),
(132, 'CR1012', 'arpita@test.com', '123456', 5, 1),
(133, 'CR1013', 'nimilphilip@gmail.com', '123456', 5, 1),
(134, 'CR1014', 'nimilphilipzoo@gmail.com', '123456', 5, 1),
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
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(32, 884042, 1, 'fsdfsdafsaf', 'BS2', 1746102614);

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
  `updation_remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `datentime` int NOT NULL,
  `updated_columns` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lrn_audit_history`
--

INSERT INTO `lrn_audit_history` (`id`, `lrn`, `product_id`, `required_loan_amount`, `status_id`, `cust_type`, `name`, `company_name`, `company_type`, `company_doi`, `company_turnover`, `company_email`, `company_mobile`, `company_address`, `dob`, `mobile`, `alt_mobile`, `email`, `permanent_address`, `current_address`, `brief_note`, `guarantor_id`, `updation_remark`, `datentime`, `updated_columns`) VALUES
(4, 884042, 0, 0, 1, 2, 'Arpita Sinha', 'Arpita Traders', 0, 0, 0, '', 0, '', 0, 1452369870, 2563149870, 'arpitasinha@st.com', 'hebbala', '', 'No Note', 0, 'Created By Admin', 1745210504, ''),
(5, 884042, 0, 0, 1, 1, 'Arpita Sinha', 'Arpita Traders', 0, 0, 0, '', 0, '', 324671400, 1452369871, 2563149870, 'arpitasinha@st.com', 'hebbala', 'sanjay nagar', 'Special Referrence', 0, 'Mobile, DOB, Current Address, Brief Note Updated', 1745231329, 'mobile,dob,cust_type,current_address,brief_note'),
(6, 884042, 0, 0, 1, 1, 'Arpita Sinha', 'Arpita Traders', 0, 0, 0, '', 0, '', 324671400, 1452369872, 2563149870, 'arpitasinha@st.com', 'hebbala', 'sanjay nagar', 'Special Referrence', 0, 'Mobile Updated', 1745231509, 'mobile'),
(7, 884042, 0, 0, 1, 1, 'Arpita Sinha', 'Arpita Traders', 0, 0, 0, '', 0, '', 324671400, 1452369872, 2563149871, 'arpitasinha@st.com', 'hebbala', 'sanjay nagar', 'Special Referrence', 0, 'Alt Mobile updated', 1745231708, 'alt_mobile'),
(8, 884042, 0, 0, 1, 2, 'Arpita Sinha', 'Arpita Traders', 0, 0, 0, '', 0, '', 482437800, 1452369872, 2563149871, 'arpitasinha@st.com', 'Hebbala Bangalore', 'Sanjay Nagar Bangalore', 'Special Referrence', 0, 'DOB, Both Address, Type Updated', 1745233163, 'dob,cust_type,permanent_address,current_address'),
(9, 884042, 0, 0, 1, 2, 'Arpita Sinha', 'Arpita Traders', 0, 0, 0, '', 0, '', 482437800, 1452369872, 2563149871, 'arpitasinha@st.com', 'Hebbala Bangalore', 'Sanjay Nagar Bangalore', 'Special Referrence', 6, 'Guarantor Added', 1745237991, 'guarantor_id'),
(10, 884042, 0, 0, 1, 2, 'Arpita Sinha', 'Arpita Traders', 0, 0, 0, '', 0, '', 482437800, 1452369872, 2563149871, 'arpitasinha@st.com', 'Hebbala Bangalore', 'Sanjay Nagar Bangalore', 'Special Referrence', 7, 'Guarantor Updated', 1745238492, 'guarantor_id'),
(11, 884042, 1, 100000, 1, 2, 'Arpita Sinha', 'Arpita Traders', 0, 0, 0, '', 0, '', 482437800, 1452369872, 2563149871, 'arpitasinha@st.com', 'Hebbala Bangalore', 'Sanjay Nagar Bangalore', 'Special Referrence', 7, 'Loan Details Added', 1745301537, 'product_id,required_loan_amount'),
(12, 884042, 2, 100000, 1, 2, 'Arpita Sinha', 'Arpita Traders', 0, 0, 0, '', 0, '', 482437800, 1452369872, 2563149871, 'arpitasinha@st.com', 'Hebbala Bangalore', 'Sanjay Nagar Bangalore', 'Special Referrence', 7, 'Loan Details Updated', 1745301660, 'product_id,required_loan_amount'),
(13, 884042, 2, 200000, 1, 2, 'Arpita Sinha', 'Arpita Traders', 0, 0, 0, '', 0, '', 482437800, 1452369872, 2563149871, 'arpitasinha@st.com', 'Hebbala Bangalore', 'Sanjay Nagar Bangalore', 'Special Referrence', 7, 'Loan Details Updated', 1745301957, 'required_loan_amount'),
(14, 884042, 2, 200000, 1, 2, 'Arpita Sinha', 'Arpita Traders', 0, 0, 0, '', 0, '', 640204200, 1452369873, 2563149871, 'arpitasinha@st.com', 'Hebbala Bangalore', 'Sanjay Nagar Bangalore', 'Special Referrence By Admin', 7, 'Mobile, DOB,Brief Note Updated', 1745302230, 'mobile,dob,brief_note'),
(15, 884042, 2, 200000, 1, 2, 'Arpita Sinha', 'Arpita Traders', 0, 0, 0, '', 0, '', 640204200, 1452369873, 2563149871, 'arpitasinha@st.com', 'Hebbala Bangalore', 'Sanjay Nagar Bangalore', 'Special Referrence By Admin', 6, 'Guarantor Updated', 1745302322, 'guarantor_id'),
(16, 884042, 2, 2000002, 1, 2, 'Arpita Sinha', 'Arpita Traders', 0, 0, 0, '', 0, '', 640204200, 1452369873, 2563149871, 'arpitasinha@st.com', 'Hebbala Bangalore', 'Sanjay Nagar Bangalore', 'Special Referrence By Admin', 6, 'Loan Details Updated', 1745303744, 'required_loan_amount'),
(17, 884042, 2, 2000002, 1, 2, 'Arpita Sinha', 'Arpita Traders', 0, 0, 0, '', 0, '', 640463400, 1452369873, 2563149871, 'arpitasinha@st.com', 'Hebbala Bangalore', 'Sanjay Nagar Bangalore', 'Special Referrence By Admin', 6, 'DOB Updated', 1745319471, 'dob'),
(18, 884042, 2, 2000002, 1, 2, 'Arpita Sinha', 'Arpita Traders', 0, 0, 0, '', 0, '', 640463400, 1452369873, 2563149871, 'arpitasinha@st.com', 'Hebbala Bangalore', 'Sanjay Nagar Bangalore', 'Special Referrence By Admin', 6, 'Documents Uploaded', 1745323669, ''),
(19, 884042, 2, 2000002, 1, 2, 'Arpita Sinha', 'Arpita Traders', 0, 0, 0, '', 0, '', 640463400, 1452369873, 2563149871, 'arpitasinha@st.com', 'Hebbala Bangalore', 'Sanjay Nagar Bangalore', 'Special Referrence By Admin', 6, 'Documents Uploaded', 1745324138, ''),
(20, 884042, 2, 2000002, 1, 2, 'Arpita Sinha', 'Arpita Traders', 0, 0, 0, '', 0, '', 640463400, 1452369873, 2563149871, 'arpitasinha@st.com', 'Hebbala Bangalore', 'Sanjay Nagar Bangalore', 'Special Referrence By Admin', 6, 'Documents Uploaded', 1745324252, ''),
(21, 884042, 2, 200000, 1, 2, 'Arpita Sinha', 'Arpita Traders', 0, 0, 0, '', 0, '', 640463400, 1452369873, 2563149871, 'arpitasinha@st.com', 'Hebbala Bangalore', 'Sanjay Nagar Bangalore', 'Special Referrence By Admin', 6, 'Loan Details Updated', 1745380251, 'required_loan_amount'),
(22, 884042, 2, 200000, 1, 2, 'Arpita S Sinha', 'Arpita Traders', 0, 0, 0, '', 0, '', 640463400, 1452369873, 2563149871, 'arpitasinha@st.com', 'Hebbala Bangalore', 'Sanjay Nagar Bangalore', 'Special Referrence By Admin', 6, 'Name Updated', 1745381570, 'name'),
(23, 884042, 2, 200000, 1, 2, 'Arpita S Sinha', 'Arpita Traders', 0, 0, 0, '', 0, '', 640463400, 1452369873, 2563149871, 'arpitasinha@st.com', 'Hebbala Bangalore', 'Sanjay Nagar Bangalore', 'Special Referrence By Admin', 6, 'Documents Uploaded', 1745838198, ''),
(24, 884042, 2, 200000, 1, 1, 'Arpita S Sinha', 'Arpita Traders', 0, 0, 0, '', 0, '', 640463400, 1452369873, 2563149871, 'arpitasinha@st.com', 'Hebbala Bangalore', 'Sanjay Nagar Bangalore', 'Special Referrence By Admin', 6, 'Type Updated', 1745841561, 'cust_type'),
(25, 884042, 2, 200000, 1, 2, 'Arpita S Sinha', 'Arpita Traders', 0, 0, 0, '', 0, '', 640463400, 1452369873, 2563149871, 'arpitasinha@st.com', 'Hebbala Bangalore', 'Sanjay Nagar Bangalore', 'Special Referrence By Admin', 6, 'Type Updated', 1745841675, 'cust_type'),
(26, 884042, 2, 2000000, 1, 2, 'Arpita S Sinha', 'Arpita Traders', 0, 0, 0, '', 0, '', 640463400, 1452369873, 2563149871, 'arpitasinha@st.com', 'Hebbala Bangalore', 'Sanjay Nagar Bangalore', 'Special Referrence By Admin', 6, 'Loan Details Updated', 1745841815, 'required_loan_amount'),
(27, 884042, 2, 400000, 1, 2, 'Arpita S Sinha', 'Arpita Traders', 0, 0, 0, '', 0, '', 640463400, 1452369873, 2563149871, 'arpitasinha@st.com', 'Hebbala Bangalore', 'Sanjay Nagar Bangalore', 'Special Referrence By Admin', 6, 'Loan Details Updated', 1745841826, 'required_loan_amount'),
(28, 884042, 2, 400000, 1, 2, 'Arpita S Sinha', 'Arpita Traders', 0, 0, 0, '', 0, '', 640463400, 1452369873, 2563149871, 'arpitasinha@st.com', 'Hebbala Bangalore', 'Sanjay Nagar Bangalore', 'Special Referrence By Admin', 7, 'Guarantor Updated', 1745841838, 'guarantor_id'),
(29, 884042, 2, 400000, 1, 2, 'Arpita S Sinha', 'Arpita Traders', 0, 0, 0, '', 0, '', 703621800, 1452369873, 2563149871, 'arpitasinha@st.com', 'Hebbala Bangalore', 'Sanjay Nagar Bangalore', 'Special Referrence By Admin', 7, 'DOB Updated', 1746096358, 'dob'),
(30, 884042, 2, 400000, 1, 2, 'Arpita S Sinha', 'Arpita Traders', 0, 1577817000, 100000, '', 9876543210, 'sdmfkdsfbsdaf', 703621800, 1452369873, 2563149871, 'arpitasinha@st.com', 'Hebbala Bangalore', 'Sanjay Nagar Bangalore', 'Special Referrence By Admin', 7, 'fsdfsdafsaf', 1746102614, 'company_doi,company_turnover,company_mobile,company_address');

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
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lrn_document_upload_history`
--

INSERT INTO `lrn_document_upload_history` (`id`, `lrn`, `file_name`, `datentime`, `upload_by`, `is_deleted`, `deleted_by`, `deletion_datentime`, `deletion_remark`) VALUES
(1, 884042, 'poa_1745323669.png', 1745323669, 'BS2', 0, '', 0, ''),
(2, 884042, 'poi_1745324138.png', 1745324138, 'BS2', 0, '', 0, ''),
(3, 884042, 'add payment in_1745324252.png', 1745324252, 'BS2', 1, 'BS2', 1745324711, 'test'),
(4, 884042, 'customer_photo_1745838198.jpg', 1745838198, 'BS2', 0, '', 0, '');

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
  `product_id` int NOT NULL,
  `datentime` int NOT NULL,
  `created_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `source_id` int NOT NULL,
  `allocated_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lrn_list`
--

INSERT INTO `lrn_list` (`id`, `lrn`, `status_id`, `crn`, `product_id`, `datentime`, `created_by`, `source_id`, `allocated_id`) VALUES
(4, 884042, 1, 1004, 0, 1745210504, 'BS2', 5, '');

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
(4, 'User Management', 'USER', 'user', 1),
(5, 'Report Management', 'REPORT', 'file', 1),
(8, 'Site Management', 'SITE', 'dribbble', 1),
(7, 'Management Account', 'FUND', 'dollar-sign', 1),
(9, 'Menu Management', 'MENU', 'align-left', 1),
(12, 'CRM', 'CRM', 'pie-chart', 2),
(13, 'URN Management', 'URN', 'users', 2),
(14, 'Account', 'ACCOUNT', 'user', 2),
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(8, 'Manish Bafna', 'manish@bafna.net', 123, 'Manager', 'Management', 8, 1, '1,2,3,4,5,6,7', '1,2,10,11,18,19,20,21,12,13,14,15,16,17,39,23,7'),
(10, 'Amit Sriwastav', 'amit@moticorporation.com', 7618844888, 'Developer', 'IT', 8, 1, '1,2,3,4,5,6,8,7,21,22', '1,2,10,11,18,19,20,21,12,13,14,15,16,17,39,23,8,9,7,41,5,42'),
(1, 'admin', 'info@campus-abroad.co.in', 9902012547, 'Admin', 'Management', 7, 1, '1,2,3,4,5,6,7,8,9', '');

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
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `submenu_items`
--

INSERT INTO `submenu_items` (`id`, `description`, `href_link`, `parent_menu_item_id`) VALUES
(1, 'LRNs', '../lrn_management/lrn_list.php', 1),
(2, 'Leads', '../lead_management/temp_leads.php', 1),
(5, 'Calls', '../communication_history_management/callback_list.php', 22),
(6, 'Menu Items', '../menu_management/menu_items.php', 9),
(7, 'Commission', '../commission_management/commission_history.php', 7),
(8, 'Site Info', '../site_management/site_settings.php', 8),
(9, 'Options', '../site_management/portal_settings.php', 8),
(12, 'Lead Source', '../report_management/lead_source_report.php', 5),
(16, 'Customer', '../report_management/customer_report.php', 5),
(18, 'Staff', '../staff_management/staff_list.php', 4),
(22, 'Submenu Items', '../menu_management/submenu_items.php', 9),
(24, 'Menu List', '../menu_management/menu_list.php', 9),
(25, 'Profile', '../myaccount/myaccount.php', 14),
(27, 'Wallet', '../myaccount/mywallet.php', 14),
(28, 'Create Lead', '../lead_management/temp_leads.php', 12),
(29, 'URN Lead', '../urn_management/leads.php', 12),
(34, 'Profile', 'myaccount.php', 17),
(35, 'Settings', 'myaccount.php?tab=settings', 17),
(36, 'Wishlist', 'mywishlist.php', 17),
(37, 'Application', 'myurn_list.php', 17),
(39, 'Product Performance', '../report_management/product_performance_report.php', 5),
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
(59, 'Sumita', 9922001458, 'sumita@st.com', 1728104881, 2, 1, 3, 0, '', 0),
(60, 'Susmita', 8855447629, 'susmita@st.com', 1728104881, 2, 1, 3, 0, '', 0),
(61, 'yogita', 9900213654, 'yogita@st.com', 1728104881, 2, 1, 1, 0, '', 0),
(62, 'Rachita', 9988123456, 'rachita@st.com', 1728104881, 2, 1, 1, 0, '', 0),
(63, 'Archit', 9920201452, 'archit@st.com', 1728104881, 2, 1, 4, 0, '', 0),
(64, 'Veeru', 9922001235, 'veeru@test.com', 1728104955, 2, 1, 2, 1, 'CRN Created', 1),
(65, 'Mamta', 9922001346, '', 1728104955, 2, 1, 1, 0, '', 0),
(66, 'Tanvi', 9922001365, '', 1728104955, 2, 1, 4, 0, '', 0),
(67, 'Chandrika', 9922001452, '', 1728104955, 2, 1, 2, 0, '', 0),
(68, 'arpita', 9945251325, 'arpita@st.com', 1728104955, 2, 1, 2, 0, '', 0),
(69, 'sarvesh', 9911002453, 'sarvesh@st.com', 1728104955, 2, 1, 2, 0, '', 0),
(70, 'Shiju Trillion', 70070070, 'shijuGBP@GBP.Com', 1728106478, 2, 1, 1, 0, '', 0),
(71, 'Nimil Philip', 7994970111, 'nimilphilipzoo@gmail.com', 1729598949, 2, 1, 3, 1, 'CRN Created', 1),
(72, 'test', 9072430726, 'nimilphilip@gmail.com', 1729665397, 2, 1, 3, 1, 'CRN Created', 1);

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
  `lrn` int NOT NULL,
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
-- Table structure for table `working_on_lrn_list`
--

DROP TABLE IF EXISTS `working_on_lrn_list`;
CREATE TABLE IF NOT EXISTS `working_on_lrn_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `lrn` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `working_on_lrn_list`
--

INSERT INTO `working_on_lrn_list` (`id`, `user`, `lrn`) VALUES
(21, 'BS2', 884042);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

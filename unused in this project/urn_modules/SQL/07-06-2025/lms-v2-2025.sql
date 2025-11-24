-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 07, 2025 at 12:39 PM
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
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bank_accounts_list`
--

INSERT INTO `bank_accounts_list` (`id`, `crn`, `account_holder_name`, `bank_name`, `branch_address`, `ifsc`, `account_number`, `verification_status`) VALUES
(7, 1004, 'Arpita Sinha', 'HDFC', 'Hebbal Bangalore', 'HDFC12345', 1542369870, 0),
(12, 1004, 'Arpita Sinha', 'HDFC', 'Hebbal', 'HDFC12345', 542301, 0),
(20, 1001, 'Veeru Devgan', 'State Bank of India', 'NRI Branch Bellary Road', 'SBIN012345', 5329100, 0),
(16, 1002, 'Arpita', 'HDFC', 'RT Nagar', 'HDFC12345', 4563201, 0),
(22, 1004, 'Arpita Sinha', 'State Bank of India', 'Sanjay Nagar', 'SBIN002', 10238075265, 0);

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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `call_history`
--

INSERT INTO `call_history` (`id`, `lrn`, `type`, `remark`, `remark_by`, `datentime`, `dataentry_datentime`) VALUES
(1, 535694, 1, 'Call Not rcvd', 'BS2', 1746593100, 1746594584),
(2, 535694, 1, 'Call Not Rcvd', 'BS2', 1746596100, 1746594658);

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
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1016 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers_list`
--

INSERT INTO `customers_list` (`id`, `name`, `mobile`, `alt_mobile`, `email`, `dob`, `brief_note`, `company_name`, `cust_type`, `permanent_address`, `lead_source_id`, `primary_bank`) VALUES
(1001, 'Veeru', 9922001236, 9922001236, 'veeru@st.com', 0, 'No Note', 'Veeru Corporation', 2, 'Hebbal', 1, 20),
(1002, 'arpita', 9945251325, 1234569870, 'arpita@st.com', 0, 'No Note', 'ABC Traders', 1, 'hebbala', 5, 16),
(1004, 'Arpita Sinha', 1452369870, 2563149870, 'arpitasinha@st.com', 0, 'No Note', 'Arpita Traders', 2, 'hebbala', 5, 22),
(1005, 'Sarala Sinha', 1452369870, 2563141234, 'saralasinha@test.com', 0, 'Special Remark', '', 1, 'hebbala bangalore', 5, 0),
(1006, 'Suhana', 9922001234, 5236498710, 'suhana@st.com', 0, 'No Note', '', 1, 'Yelahnka Bangalore', 3, 0),
(1007, 'sarvesh', 9911002453, 0, 'sarvesh@st.com', 0, 'No Note', 'Sarvesh Corp', 2, 'Yeshwantpur', 2, 0),
(1013, 'test', 9072430726, 0, 'nimilphilip@gmail.com', 0, 'No Note', '', 1, 'aaaaa', 3, 0),
(1010, 'Raghav', 7586329014, 2513680495, 'raghav@test.com', 0, 'No Note', 'XYZ Traders', 1, 'Hebbal', 5, 0),
(1012, 'Veeru', 1452369870, 2563149870, 'arpita@test.com', 0, 'No Note', '', 1, 'aaaaa', 5, 0),
(1014, 'Nimil Philip', 7994970111, 0, 'nimilphilipzoo@gmail.com', 0, 'No Note', '', 1, 'test', 3, 0),
(1015, 'sarvesh', 9911002453, 0, 'sarvesh@test.com', 0, 'No Note', '', 1, 'Hebbala Bangalore', 2, 0);

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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dispatch_list`
--

INSERT INTO `dispatch_list` (`id`, `lan`, `lrn`, `requested_amount`, `approved_loan_amount`, `approval_datentime`, `approval_date`, `status`) VALUES
(1, 8586121748928019, 858612, 200000, 10000, 1748928019, 1748889000, 1);

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
(1, 'Proof of Address', 'poa', 1),
(2, 'Proof of Identity', 'poi', 1),
(3, 'Customer Photo', 'customer_photo', 1),
(4, 'PAN Card', 'pan', 1),
(5, 'Canceled Cheque', 'bank_cheque', 1),
(6, 'Signed Agreement', 'signed_agreement', 1),
(7, 'Company COI', 'coi', 0),
(8, 'Income Proof', 'income_proof', 1),
(9, 'Company PAN', 'company_pan', 0),
(10, 'Company POA', 'company_poa', 0);

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
) ENGINE=MyISAM AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(65, 'LRN Status Updated Alert', 'LA858612 LRN Status Updated Alert', 'LRN Status Updated Alert', 'arpitasinha@st.com', 'support@campus-abroad.co.in', 1748928019);

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
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `guarantor_list`
--

INSERT INTO `guarantor_list` (`id`, `crn`, `name`, `email`, `mobile`, `current_address`, `permanent_address`, `company`, `document_title`) VALUES
(6, 1004, 'Rahul Kumar', 'rahulkumar@testcom', 8523614970, 'Hebbal', 'Hebbal', 'Individual', 'idproof'),
(5, 1002, 'Test Guarantor', 'tgc@test.com', 8523697410, 'Hebbal', 'Hebbal', 'TG Corp', 'idproof'),
(7, 1004, 'Veeru', 'testuser@test.com', 9380006337, 'adadad', 'asadadad', 'ABC Corp', 'pan'),
(8, 1001, 'Rajesh Kumar', 'rajeshcorp@test.com', 9652301487, 'Yeshwantpur Bangalore', 'Yeshwantpur Bangalore', 'Rajesh Corporation', 'Id_proof'),
(9, 1004, 'Mamta', 'mamta@test.com', 9865214730, 'Yashwantpur', 'Yashwantpur', 'Mamta Trader', 'poi');

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
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lan_activity_history`
--

INSERT INTO `lan_activity_history` (`id`, `lan`, `lrn`, `comment`, `activity_by`, `datentime`) VALUES
(1, 8586121748928019, 858612, 'LAN Generated', 'BS2', 1748928019),
(2, 8586121748928019, 858612, 'LAN Dispatch', 'BS2', 1748928539),
(3, 8586121748928019, 858612, 'LAN Dispatch', 'BS2', 1748938353),
(4, 8586121748928019, 858612, 'LAN Dispatch', 'BS2', 1748939973);

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
  `approved_loan_amount` bigint NOT NULL,
  `payment_frequency` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `loan_tenure` int NOT NULL,
  `roi` int NOT NULL,
  `updation_remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `datentime` int NOT NULL,
  `updated_columns` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lan_audit_history`
--

INSERT INTO `lan_audit_history` (`id`, `lan`, `lrn`, `product_id`, `required_loan_amount`, `status_id`, `cust_type`, `name`, `company_name`, `company_type`, `company_doi`, `company_turnover`, `company_email`, `company_mobile`, `company_address`, `dob`, `mobile`, `alt_mobile`, `email`, `permanent_address`, `current_address`, `brief_note`, `guarantor_id`, `introducer_id`, `bank_account`, `approved_loan_amount`, `payment_frequency`, `loan_tenure`, `roi`, `updation_remark`, `datentime`, `updated_columns`) VALUES
(1, 8586121748928019, 858612, 2, 200000, 4, 2, 'Arpita Sinha', 'Arpita Traders', 4, 1743445800, 1000000, 'mgbafna1957@gmail.com', 1234567890, 'Moti Chamber Hebbal 560024 India', 631132200, 1452369870, 2563149870, 'arpitasinha@st.com', 'Hebbala', '#1 4th A Main road Vinayakanagar Bangalore 560024 India', 'No Note', 6, 1, 22, 10000, 'Weekly', 10, 5, 'LAN Generated', 1748928019, ''),
(4, 8586121748928019, 858612, 2, 200000, 4, 2, 'Arpita Sinha', 'Arpita Traders', 4, 1743445800, 1000000, 'mgbafna1957@gmail.com', 1234567890, 'Moti Chamber Hebbal 560024 India', 631132200, 1452369870, 2563149870, 'arpitasinha@st.com', 'Hebbala', '#1 4th A Main road Vinayakanagar Bangalore 560024 India', 'No Note', 6, 1, 22, 10000, 'Weekly', 10, 5, 'LAN Dispatched', 1748939973, '');

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
  `remark` varchar(1024) COLLATE utf8mb4_general_ci NOT NULL,
  `date` int NOT NULL,
  `type` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lan_ledger_transactions`
--

INSERT INTO `lan_ledger_transactions` (`id`, `lan`, `lrn`, `crn`, `amount`, `remark`, `date`, `type`) VALUES
(6, 8586121748928019, 858612, 1004, 200, 'Processing Fee Applied', 1748889000, 0),
(7, 8586121748928019, 858612, 1004, 9800, 'Loan Amount Disbursed', 1748889000, 0);

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
(5, 'LAN Created', 5, 1, 1744977988),
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
) ENGINE=MyISAM AUTO_INCREMENT=134 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(115, 'BS2'),
(116, 'BS2'),
(117, 'BS2'),
(118, 'BS1'),
(119, 'BS2'),
(120, 'BS2'),
(121, 'BS2'),
(122, 'BS2'),
(123, 'BS2'),
(124, 'BS2'),
(125, 'BS2'),
(126, 'BS2'),
(127, 'BS2'),
(128, 'BS8'),
(129, 'BS2'),
(130, 'BS1'),
(131, 'BS1'),
(132, 'BS2'),
(133, 'BS1');

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
) ENGINE=MyISAM AUTO_INCREMENT=136 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=MyISAM AUTO_INCREMENT=170 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(167, 457486, 2, 'Send to Verification Process', 'BS2', 1748694072);

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
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lrn_agreements_list`
--

INSERT INTO `lrn_agreements_list` (`id`, `lrn`, `agreement_id`, `datentime`) VALUES
(6, 858612, 8586121748664664, 1748664664),
(4, 614138, 6141381748342584, 1748342584);

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
) ENGINE=MyISAM AUTO_INCREMENT=160 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(157, 457486, 2, 1000000, 2, 2, 'Veeru Yadav', 'Veeru Corporation', 5, 1735669800, 500000, 'abctraders@test.com', 9876501235, 'Yeshwantpur North Bangalore India 560021', 631132200, 9922001236, 9922001236, 'veeru@st.com', 'Hebbal1', 'Hebbal', 'No Note', 8, 5, 20, 0, '', 0, 0, 'Send to Verification Process', 1748694072, 'status_id');

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
) ENGINE=MyISAM AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(45, 858612, 'signed_agreement_1748669134.pdf', 1748669134, 'BS2', 0, '', 0, '');

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
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(12, 189053, 1, 1004, 1747719345, 'BS2', 5, ''),
(13, 920573, 1, 1004, 1747740451, 'BS2', 5, ''),
(15, 914948, 8, 1004, 1747809854, 'BS2', 5, ''),
(16, 457486, 2, 1001, 1747811557, 'BS2', 1, ''),
(17, 308829, 1, 1004, 1747811591, 'BS2', 5, ''),
(18, 614138, 3, 1004, 1747812194, 'BS2', 5, '');

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
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(3, 'Student');

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
  `due_amount` float NOT NULL,
  `due_date` int NOT NULL,
  `collected_amount` float NOT NULL,
  `collected_date` int NOT NULL,
  `status` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `repayment_schedule_list`
--

INSERT INTO `repayment_schedule_list` (`id`, `lan`, `lrn`, `crn`, `principal`, `interest`, `due_amount`, `due_date`, `collected_amount`, `collected_date`, `status`) VALUES
(1, 8586121748928019, 858612, 1004, 0, 500, 500, 1749493800, 500, 1749493800, 1),
(2, 8586121748928019, 858612, 1004, 0, 500, 500, 1750098600, 0, 0, 0),
(3, 8586121748928019, 858612, 1004, 0, 500, 500, 1750703400, 0, 0, 0),
(4, 8586121748928019, 858612, 1004, 0, 500, 500, 1751308200, 500, 1749407400, 1),
(5, 8586121748928019, 858612, 1004, 0, 500, 500, 1751913000, 0, 0, 0),
(6, 8586121748928019, 858612, 1004, 0, 500, 500, 1752517800, 0, 0, 0),
(7, 8586121748928019, 858612, 1004, 0, 500, 500, 1753122600, 0, 0, 0),
(8, 8586121748928019, 858612, 1004, 0, 500, 500, 1753727400, 0, 0, 0),
(9, 8586121748928019, 858612, 1004, 0, 500, 500, 1754332200, 0, 0, 0),
(10, 8586121748928019, 858612, 1004, 10000, 500, 10500, 1754937000, 0, 0, 0);

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
(1, 'LMS V2 2025', 'Moti Corporation', 'www.moticorporation.com', 'LMS v2.0', 'lms-logo.png');

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
(2, 'G Yogesh Bafna', 'yogesh@bafna.net', 9902012547, 'Director', 'Management', 1, 1, '1,2,4,5,8,7,25,21,22,23', '1,2,46,45,18,12,16,39,8,9,7,47,51,50,49,48,41,5,42,43,44'),
(8, 'Manish Bafna', 'manish@bafna.net', 123, 'Manager', 'Management', 3, 1, '1,2,22,23', '1,2,5,42,43,44'),
(10, 'Amit Sriwastav', 'amit@moticorporation.com', 7618844888, 'Developer', 'IT', 8, 1, '1,2,3,4,5,6,8,7,21,22', '1,2,10,11,18,19,20,21,12,13,14,15,16,17,39,23,8,9,7,41,5,42'),
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
) ENGINE=MyISAM AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(46, 'Calculator', '../loan_calculator/calculate_loan.php', 1),
(47, 'Dispatch List', '../lan_management/dispatch_list.php', 25),
(12, 'Lead Source', '../report_management/lead_source_report.php', 5),
(51, 'Received Payment List', '../lan_management/rcvd_payment_list.php', 25),
(16, 'Customer', '../report_management/customer_report.php', 5),
(18, 'Staff', '../staff_management/staff_list.php', 4),
(50, 'Missed Payment List', '../lan_management/missed_payment_list.php', 25),
(49, 'Due Payment List', '../lan_management/due_payment_list.php', 25),
(48, 'Active LAN', '../lan_management/lan_list.php', 25),
(22, 'Submenu Items', '../menu_management/submenu_items.php', 9),
(24, 'Menu List', '../menu_management/menu_list.php', 9),
(25, 'Profile', '../myaccount/myaccount.php', 14),
(27, 'Wallet', '../myaccount/mywallet.php', 14),
(28, 'Create Lead', '../lead_management/temp_leads.php', 12),
(29, 'URN Lead', '../urn_management/leads.php', 12),
(45, 'Introducers', '../introducer_management/list.php', 1),
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
(65, 'Mamta', 9922001346, 'mamta@test.com', 1728104955, 2, 1, 1, 0, '', 0),
(66, 'Tanvi', 9922001365, '', 1728104955, 2, 1, 4, 0, '', 0),
(67, 'Chandrika', 9922001452, '', 1728104955, 2, 1, 2, 0, '', 0),
(68, 'arpita', 9945251325, 'arpita@st.com', 1728104955, 2, 1, 2, 0, '', 0),
(69, 'sarvesh', 9911002453, 'sarvesh@test.com', 1728104955, 2, 1, 2, 1, 'CRN Created', 1),
(70, 'Shiju Trillion', 70070070, 'shijuGBP@GBP.Com', 1728106478, 2, 1, 1, 0, '', 0),
(71, 'Nimil Philip', 7994970111, 'nimilphilipzoo@gmail.com', 1729598949, 2, 1, 3, 1, 'CRN Created', 1),
(72, 'test', 9072430726, 'nimilphilip@gmail.com', 1729665397, 2, 1, 3, 1, 'CRN Created', 1);

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
) ENGINE=MyISAM AUTO_INCREMENT=217 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `working_on_lrn_list`
--

INSERT INTO `working_on_lrn_list` (`id`, `user`, `lrn`) VALUES
(197, 'BS8', 189053);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

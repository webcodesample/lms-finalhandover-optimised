-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Sep 22, 2025 at 09:18 AM
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer_request_type_list`
--

DROP TABLE IF EXISTS `customer_request_type_list`;
CREATE TABLE IF NOT EXISTS `customer_request_type_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(5120) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `logged_user_list`
--

DROP TABLE IF EXISTS `logged_user_list`;
CREATE TABLE IF NOT EXISTS `logged_user_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_ref_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menu_list`
--

DROP TABLE IF EXISTS `menu_list`;
CREATE TABLE IF NOT EXISTS `menu_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
-- Table structure for table `submenu_items`
--

DROP TABLE IF EXISTS `submenu_items`;
CREATE TABLE IF NOT EXISTS `submenu_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `href_link` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `parent_menu_item_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

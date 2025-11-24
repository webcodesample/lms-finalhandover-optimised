-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jul 03, 2024 at 10:57 AM
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
-- Table structure for table `document_list`
--

DROP TABLE IF EXISTS `document_list`;
CREATE TABLE IF NOT EXISTS `document_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `uploaded_file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_required` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `document_list`
--

INSERT INTO `document_list` (`id`, `name`, `uploaded_file_name`, `is_required`) VALUES
(1, 'Student Photo', 'student_photo', 0),
(2, '10th Markssheet', '10th_makrkssheet', 0),
(3, '10th Certificate', '10th_certificate', 0),
(4, '10+2 Markssheet', '12th_markssheet', 0),
(5, '10+2 Certificate', '12th_certificate', 0),
(6, 'Graduation Markssheet', 'graduation_markssheet', 0),
(7, 'Graduation Certificate', 'graduation_certificate', 0),
(8, 'Passport', 'passport', 1),
(9, 'IELTS Score Card', 'ielts_score_card', 1);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

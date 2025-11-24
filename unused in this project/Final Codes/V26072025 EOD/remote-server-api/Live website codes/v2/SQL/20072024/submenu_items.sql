-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jul 20, 2024 at 06:58 AM
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
-- Database: `ca-portal-v2`
--

-- --------------------------------------------------------

--
-- Table structure for table `submenu_items`
--

DROP TABLE IF EXISTS `submenu_items`;
CREATE TABLE IF NOT EXISTS `submenu_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `href_link` varchar(1024) COLLATE utf8mb4_general_ci NOT NULL,
  `parent_menu_item_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

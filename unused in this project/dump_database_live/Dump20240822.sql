-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: campus-abroad.co.in    Database: CAversion2
-- ------------------------------------------------------
-- Server version	5.5.5-10.6.18-MariaDB-cll-lve

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `action_perform_list`
--

DROP TABLE IF EXISTS `action_perform_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `action_perform_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `action_perform_list`
--

LOCK TABLES `action_perform_list` WRITE;
/*!40000 ALTER TABLE `action_perform_list` DISABLE KEYS */;
INSERT INTO `action_perform_list` VALUES (1,'Withdrawal Request'),(2,'Withdrawal Approval'),(3,'Status Update'),(4,'Allocate'),(18,'Agent Signup'),(6,'New Callback Set'),(7,'Callback Update'),(19,'Sales Person Signup'),(10,'URN Rejected'),(11,'Visa Rejected'),(12,'Document Upload'),(13,'URN Profile Update'),(14,'Additional Details Update'),(15,'Academic Details Update'),(16,'Course Selection Update'),(17,'URN Allocation'),(20,'Backend Staff Signup'),(21,'Management Staff Signup');
/*!40000 ALTER TABLE `action_perform_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agent_list`
--

DROP TABLE IF EXISTS `agent_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agent_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobile` bigint(20) NOT NULL,
  `whatsapp` bigint(20) NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `company_address` varchar(255) NOT NULL,
  `company_website` varchar(255) NOT NULL,
  `comission` float NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agent_list`
--

LOCK TABLES `agent_list` WRITE;
/*!40000 ALTER TABLE `agent_list` DISABLE KEYS */;
INSERT INTO `agent_list` VALUES (1,0,'Yogesh Bafna','yogesh@sa.com',9920015247,9902015247,'','','',30,1),(2,1,'Y Mamta Bafna','mamta@sa.com',9902012548,1234567890,'Moti Corporation','Hebbal Bengaluru','www.moticorporation.com',30,1),(3,1,'menzies','menzies@mail.com',9551346276,9554343216,'menzies ltd','hebbal','edutech.com',13,1),(4,0,'Test','test@sa.com',9876543210,9876543210,'','','',30,1),(5,0,'Ramesh','ramesh@sa.com',9876512344,9876512344,'','','',25,1),(6,0,'suman','suman@mail.com',2345690876,23456790786,'','','',20,1);
/*!40000 ALTER TABLE `agent_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `application_point_list`
--

DROP TABLE IF EXISTS `application_point_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `application_point_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `type` varchar(10) NOT NULL,
  `address` varchar(255) NOT NULL,
  `contact_person_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobile` bigint(20) NOT NULL,
  `comission_percentage` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application_point_list`
--

LOCK TABLES `application_point_list` WRITE;
/*!40000 ALTER TABLE `application_point_list` DISABLE KEYS */;
INSERT INTO `application_point_list` VALUES (1,'crizac management pvt ltd','i','uk','test','crizac@test',123456,30),(2,'Bangalore University','u','Bangalore','IT HEAD','text@test',123456,30),(3,'Oxford University','u','Oxford','Andrew','andrew@mail.com',2071012345,20),(4,'Edutech','i','mg road','sanjay','edutech@mail.com',3920493209,11);
/*!40000 ALTER TABLE `application_point_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `call_history`
--

DROP TABLE IF EXISTS `call_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `call_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lead_id` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `remark` varchar(2048) NOT NULL,
  `remark_by` varchar(255) NOT NULL,
  `datentime` int(11) NOT NULL,
  `dataentry_datentime` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `call_history`
--

LOCK TABLES `call_history` WRITE;
/*!40000 ALTER TABLE `call_history` DISABLE KEYS */;
INSERT INTO `call_history` VALUES (1,4,1,'test','BS2',1723535020,1723535020),(2,8,1,'call completed','BS8',1724138392,1724138392);
/*!40000 ALTER TABLE `call_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `callback_list`
--

DROP TABLE IF EXISTS `callback_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `callback_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lead_id` int(11) NOT NULL,
  `callback_datentime` int(11) NOT NULL,
  `prev_remark` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `call_remark` varchar(255) NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `hold_by` varchar(255) NOT NULL,
  `updation_datentime` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `callback_list`
--

LOCK TABLES `callback_list` WRITE;
/*!40000 ALTER TABLE `callback_list` DISABLE KEYS */;
INSERT INTO `callback_list` VALUES (1,2,1723187700,'need to call',0,'','','',0),(2,3,1723617300,'email to be sent to client',0,'','','',0),(3,5,1723634400,'write a letter',0,'','','',0),(4,4,1723534980,'call',1,'test','BS2','BS2',1723535020),(5,8,1724137800,'call',1,'call completed','BS8','BS8',1724138392);
/*!40000 ALTER TABLE `callback_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat_history`
--

DROP TABLE IF EXISTS `chat_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chat_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` varchar(2048) NOT NULL,
  `message_type` int(11) NOT NULL,
  `sender_id` varchar(255) NOT NULL,
  `receiver_id` varchar(255) NOT NULL,
  `datentime` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat_history`
--

LOCK TABLES `chat_history` WRITE;
/*!40000 ALTER TABLE `chat_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `chat_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat_relationship_list`
--

DROP TABLE IF EXISTS `chat_relationship_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chat_relationship_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL,
  `support_id` int(11) NOT NULL,
  `support_type` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat_relationship_list`
--

LOCK TABLES `chat_relationship_list` WRITE;
/*!40000 ALTER TABLE `chat_relationship_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `chat_relationship_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comission_paid_history`
--

DROP TABLE IF EXISTS `comission_paid_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comission_paid_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lead_id` int(11) NOT NULL,
  `lead_amount` int(11) NOT NULL,
  `comission_amount` int(11) NOT NULL,
  `comission_paid` int(11) NOT NULL,
  `comission_paid_to` varchar(255) NOT NULL,
  `datentime` int(11) NOT NULL,
  `transaction_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comission_paid_history`
--

LOCK TABLES `comission_paid_history` WRITE;
/*!40000 ALTER TABLE `comission_paid_history` DISABLE KEYS */;
INSERT INTO `comission_paid_history` VALUES (1,1,16700,1503,1,'SP1',1723014007,'WT1723014007'),(2,2,24400,1464,1,'SP2',1723186558,'WT1723186558'),(3,3,24500,2205,1,'SA1',1723801708,'WT1723801708'),(4,5,17700,177,1,'SP3',1724227424,'WT1724227424'),(5,7,16700,1002,1,'SP2',1724227479,'WT1724227479'),(6,7,16700,1002,1,'SP2',1724227479,'WT1724227479'),(7,8,16700,334,1,'SP5',1724139510,'WT1724139510');
/*!40000 ALTER TABLE `comission_paid_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country_list`
--

DROP TABLE IF EXISTS `country_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `country_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `currency` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country_list`
--

LOCK TABLES `country_list` WRITE;
/*!40000 ALTER TABLE `country_list` DISABLE KEYS */;
INSERT INTO `country_list` VALUES (1,'usa','usd'),(2,'uk','gbp'),(3,'canada','cad'),(4,'germany','pound'),(7,'Australia','Dollars');
/*!40000 ALTER TABLE `country_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_list`
--

DROP TABLE IF EXISTS `course_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `intake` varchar(255) NOT NULL,
  `duration` int(11) NOT NULL,
  `eligibility` varchar(255) NOT NULL,
  `university_id` int(11) NOT NULL,
  `fee` int(11) NOT NULL,
  `scholarship_available` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=118 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_list`
--

LOCK TABLES `course_list` WRITE;
/*!40000 ALTER TABLE `course_list` DISABLE KEYS */;
INSERT INTO `course_list` VALUES (1,'Bsc (HONS) Accounting & Finance','Undergraduate','JAN,SEP',36,'10th',1,15900,1),(2,'Bsc (HONS) Architecture','Undergraduate','JAN',35,'12th',1,16700,0),(3,'Bsc (HONS) Artificial Intelligence','Undergraduate','Sep',36,'12th',1,16700,0),(4,'Bsc (HONS) Banking & Finance','Undergraduate','Sep',36,'12th',1,15900,0),(5,'Bsc (HONS) Biomedical Science','Undergraduate','Sep',36,'12th',1,16700,0),(6,'Bsc(HONS) Computer Games Technology','Undergraduate','Sep',36,'12th',1,15900,0),(7,'Msc Mechanical Engineering','Postgraduate','Sep',24,'Bachelor',1,17700,0),(8,'MAarch Architecture','Postgraduate','Sep',24,'Bachelor',1,17700,0),(9,'MSC Automation & Robotics','Postgraduate','jan',12,'Bachelor',1,17700,0),(10,'MSC Applied Bioscience','Postgraduate','jan',15,'Bachelor',1,17700,0),(11,'MSC Artificial Intelligence','Postgraduate','Sep',12,'Bachelor',1,17700,0),(12,'MSC Computer Science','Postgraduate','jan',20,'Bachelor',1,17700,0),(13,'Bsc (HONS) Actuarial Science','Undergraduate','Sep',36,'12th',2,24500,0),(14,'Bsc (HONS) Accounting & Finance','Undergraduate','Sep',36,'12th',2,24500,0),(15,'MEng (HONS) Aeronautical Engineering','Undergraduate','Sep',48,'12th',2,20760,0),(16,'Bsc (HONS) Banking & International Finance','Undergraduate','Sep',36,'12th',2,24500,0),(17,'Bsc (HONS) Business Management','Undergraduate','Sep',36,'12th',2,24500,0),(18,'Msc Robotics, AI & Autonomous systems','Postgraduate','Sep',12,'Bachelor',2,21800,0),(19,'Msc Business Economics/ International Business Economics','Postgraduate','Sep',12,'Bachelor',2,20910,0),(20,'MA Marketting Communications','Postgraduate','Sep',12,'Bachelor',2,21650,0),(21,'MA international Journalism','Postgraduate','Sep',12,'Bachelor',2,24400,0),(22,'Msc Psychology','Postgraduate','Sep',12,'Bachelor',2,18200,0),(23,'Animation BA (HONS)','Undergraduate','Sep',36,'12th',3,16250,0),(24,'Architecture BA (HONS)','Undergraduate','Sep',36,'12th',3,15750,0),(25,'Business Management BA (HONS)','Undergraduate','Sep',36,'12th',3,15750,0),(26,'Accounting & Economics BA (HONS)','Undergraduate','Sep',36,'12th',3,15250,0),(27,'Advertising and Marketing Communications BA (HONS)','Undergraduate','Sep',36,'12th',3,15750,0),(28,'Finance & Banking Msc','Postgraduate','Sep',12,'Bachelor',3,17950,0),(29,'International Commercial Law & Practice LLM','Postgraduate','Sep',12,'Bachelor',3,17950,0),(30,'Advanced Biomedical Science MSc/PG Dip/PG Cert','Postgraduate','Sep',12,'Bachelor',3,16800,0),(31,'Architecture MArch','Postgraduate','Sep',24,'Bachelor',3,15750,0),(32,'Computing MSc/PG Dip/PG Cert','Postgraduate','jan',18,'Bachelor',3,17600,0),(33,'BA (Hons) Accounting','Undergraduate','Sep',48,'12th',4,14170,0),(34,'BSc (Hons) Biomedical Science','Undergraduate','Sep',48,'12th',4,16680,0),(35,'BSc/BSc (Hons) Architectural Technology','Undergraduate','Sep',48,'12th',4,16680,0),(36,'BA/BA (Hons) Business Management','Undergraduate','Sep',48,'12th',4,14170,0),(37,'Msc Accounting','Postgraduate','Sep',12,'Bachelor',4,18800,0),(38,'MSc International Marketing (Dual Degree)','Postgraduate','Sep',12,'Bachelor',4,18800,0),(39,'MSc Medical Biology','Postgraduate','Sep',12,'Bachelor',4,18800,0),(40,'MBA','Postgraduate','Sep',12,'Bachelor',4,18540,0),(41,'MSc Advanced Structural Engineering','Postgraduate','Sep',12,'Bachelor',4,18800,0),(42,'Business Management BSc','Undergraduate','Sep',36,'12th',5,33450,0),(43,'Law LLB','Undergraduate','Sep',36,'12th',5,29472,0),(44,'Physiotherapy BSc','Undergraduate','Sep',36,'12th',5,33450,0),(45,'Global Health & Social Medicine BA','Undergraduate','Sep',36,'12th',5,25284,0),(46,'Accounting & Finance BSc','Undergraduate','Sep',36,'12th',5,33450,0),(47,'Advanced Software Engineering MSc','Postgraduate','Sep',12,'Bachelor',5,35244,0),(48,'Mental Health, Ethics and Law MSc','Postgraduate','Sep',12,'Bachelor',5,29472,0),(49,'Modern Literature & Culture MA','Postgraduate','Sep',12,'Bachelor',5,27996,0),(50,'Management & Technological Change MSc','Postgraduate','Sep',12,'Bachelor',5,33450,0),(51,'Digital Asset & Media Management MA','Postgraduate','Sep',12,'Bachelor',5,31368,0),(52,'Digital Business Management - BSc (Hons)','Undergraduate','Sep',36,'12th',6,15576,0),(53,'Architecture (Top-up) - BA (Hons)','Undergraduate','Sep',12,'12th',6,19250,0),(54,'Architecture - BA (Hons)','Undergraduate','Sep',36,'12th',6,17110,0),(55,'Fashion Marketing and Journalism - BA (Hons)','Undergraduate','Sep',36,'12th',6,17600,0),(56,'Business Management - BA (Hons)','Undergraduate','Sep',36,'12th',6,17600,0),(57,'Artificial Intelligence - MSc','Postgraduate','Sep',12,'Bachelor',6,18150,0),(58,'Creative, Digital and Professional Writing - MA','Postgraduate','Sep',12,'Bachelor',6,18150,0),(59,'Criminology - MSc','Postgraduate','Sep',12,'Bachelor',6,18150,0),(60,'Architecture - MA','Postgraduate','Sep',12,'Bachelor',6,16330,0),(61,'Biomedical Science - MSc','Postgraduate','Sep',12,'Bachelor',6,18150,0),(62,'Graphic Design BA (Hons)','Undergraduate','Sep',36,'12th',7,17900,0),(63,'Computer Science (Artificial Intelligence) BSc (Hons)','Undergraduate','Sep',36,'12th',7,17150,0),(64,'Accounting and Finance BSc (Hons)','Undergraduate','Sep',36,'12th',7,17150,0),(65,'Animation BA (Hons)','Undergraduate','Sep',36,'12th',7,17150,0),(66,'Biological Sciences BSc (Hons)','Undergraduate','Sep',36,'12th',7,17150,0),(67,'Biomedical Science MSc','Postgraduate','Sep',12,'Bachelor',7,19850,0),(68,'Biotechnology MSc','Postgraduate','Sep',12,'Bachelor',7,19850,0),(69,'Finance (2yr) MSc','Postgraduate','Sep',12,'Bachelor',7,22100,0),(70,'Management and International Business MSc','Postgraduate','Sep',12,'Bachelor',7,21000,0),(71,'Psychology MSc','Postgraduate','Sep',12,'Bachelor',7,17500,0),(72,'Business Management BA (Hons)','Undergraduate','Sep',36,'12th',8,14000,0),(73,'Digital Marketing BA (Hons)','Undergraduate','Sep',36,'12th',8,14000,0),(74,'Events Management BA (Hons)','Undergraduate','Sep',36,'12th',8,13500,0),(75,'Finance and Accounting BSc (Hons)','Undergraduate','Sep',48,'12th',8,14000,0),(76,'Health and Social Care BSc (Hons)','Undergraduate','Sep',36,'12th',8,14000,0),(77,'Education and Learning MA','Postgraduate','Sep',18,'Bachelor',8,11000,0),(78,'Enterprise Management MSc','Postgraduate','Sep',12,'Bachelor',8,15000,0),(79,'Hospitality with Tourism Management MSc','Postgraduate','Sep',24,'Bachelor',8,15000,0),(80,'Aviation Management MSc','Postgraduate','Sep',18,'Bachelor',8,15000,0),(81,'Finance and Accounting MSc','Postgraduate','Sep',12,'Bachelor',8,15000,0),(82,'BSc (Hons) Construction Management','Undergraduate','Sep',36,'12th',9,16000,0),(83,'BSc (Hons) Data Science and Artificial Intelligence','Undergraduate','Sep',36,'12th',9,16000,0),(84,'BSc (Hons) Architectural Technology','Undergraduate','Sep',36,'12th',9,16000,0),(85,'BSc (Hons) Audio Engineering','Undergraduate','Sep',36,'12th',9,14000,0),(86,'BA (Hons) Business and Management','Undergraduate','Sep',36,'12th',9,16000,0),(87,'MSc Construction Management','Postgraduate','Sep',12,'Bachelor',9,17500,0),(88,'MSc Civil Engineering','Postgraduate','Sep',12,'Bachelor',9,17500,0),(89,'MSc International Events Management','Postgraduate','Sep',12,'Bachelor',9,17500,0),(90,'MSc Information and Technology','Postgraduate','Sep',12,'Bachelor',9,17500,0),(91,'MSc Accounting and Finance','Postgraduate','Sep',12,'Bachelor',9,17500,0),(92,'Law with Criminology, LLB Hons','Undergraduate','Sep',36,'12th',10,17000,0),(93,'Pharmaceutical Sciences, BSc (Hons)','Undergraduate','Sep',36,'12th',10,17000,0),(94,'Mathematics and Computing, BSc (Hons)','Undergraduate','Sep',36,'12th',10,15100,0),(95,'Animation, BA (Hons)','Undergraduate','Sep',36,'12th',10,17000,0),(96,'Accounting and Finance, BA (Hons)','Undergraduate','Sep',36,'12th',10,17000,0),(97,'Computer Science, MSc','Postgraduate','Sep',12,'Bachelor',10,18150,0),(98,'International Events Management, MA','Postgraduate','Sep',12,'Bachelor',10,18150,0),(99,'International Business, MBA','Postgraduate','Sep',24,'Bachelor',10,19975,0),(100,'Accounting and Finance, MSc','Postgraduate','Sep',12,'Bachelor',10,18150,0),(112,'BBM','UG','SEP',36,'12th',27,26500,0),(113,'BSC Psychology','UG','SEP',36,'12th',27,20000,0),(114,'BA Literature','Undergraduate','SEP',36,'12th',27,16500,0),(115,'BA Econimics','UG','SEP',24,'12th',27,20000,0),(116,'MSC Psychology','PG','SEP',24,'Under graduate',27,25000,0),(117,'MA Business Analytics','PG','SEP',24,'Under graduate',27,30000,0);
/*!40000 ALTER TABLE `course_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deletion_pending_leads`
--

DROP TABLE IF EXISTS `deletion_pending_leads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deletion_pending_leads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lead_id` int(11) NOT NULL,
  `status_before_req` int(11) NOT NULL,
  `batch_id` int(11) NOT NULL,
  `req_by` int(11) NOT NULL,
  `req_datentime` int(11) NOT NULL,
  `approved_by` int(11) NOT NULL,
  `approval_datentime` int(11) NOT NULL,
  `req_remark` varchar(255) NOT NULL,
  `approval_remark` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deletion_pending_leads`
--

LOCK TABLES `deletion_pending_leads` WRITE;
/*!40000 ALTER TABLE `deletion_pending_leads` DISABLE KEYS */;
/*!40000 ALTER TABLE `deletion_pending_leads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `document_list`
--

DROP TABLE IF EXISTS `document_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `document_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `uploaded_file_name` varchar(255) NOT NULL,
  `is_required` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document_list`
--

LOCK TABLES `document_list` WRITE;
/*!40000 ALTER TABLE `document_list` DISABLE KEYS */;
INSERT INTO `document_list` VALUES (1,'Student Photo','student_photo',0),(2,'10th Marksheet','10th_makrksheet',0),(3,'10th Certificate','10th_certificate',0),(4,'Letter of Recommendation','lor',0),(5,'Statement of Purpose','sop',0),(6,'Highest Education Proof','highest_education_proof',0),(8,'Passport','passport',1);
/*!40000 ALTER TABLE `document_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_alerts_setup`
--

DROP TABLE IF EXISTS `email_alerts_setup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_alerts_setup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email_trigger_type` varchar(255) NOT NULL,
  `from_email` varchar(255) NOT NULL,
  `to_emails` varchar(255) NOT NULL,
  `on_actions` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_alerts_setup`
--

LOCK TABLES `email_alerts_setup` WRITE;
/*!40000 ALTER TABLE `email_alerts_setup` DISABLE KEYS */;
INSERT INTO `email_alerts_setup` VALUES (2,'Secondary','support@campus-abroad.co.in','yogesh@bafna.net','1,2,3,4,6,7,10,11,12,13,14,15,16,17,18,19,20,21'),(4,'Primary','support@campus-abroad.co.in','amit@moticorporation.com','1,2,3,4,6,7,10,11,12,13,14,15,16,17,18,19,20,21'),(5,'Accounts','support@campus-abroad.co.in','accounts@bafna.net','1,2');
/*!40000 ALTER TABLE `email_alerts_setup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_history`
--

DROP TABLE IF EXISTS `email_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `content` varchar(5120) NOT NULL,
  `recipients` varchar(255) NOT NULL,
  `sender` varchar(255) NOT NULL,
  `datentime` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=187 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_history`
--

LOCK TABLES `email_history` WRITE;
/*!40000 ALTER TABLE `email_history` DISABLE KEYS */;
INSERT INTO `email_history` VALUES (1,'Profile Updated Alert','CA953765 Profile Updated Alert','Profile Updated Alert','arpita@st.com','support@campus-abroad.co.in',1723528306),(2,'Profile Updated Alert','CA494964 Profile Updated Alert','Profile Updated Alert','rajesh@mail.com','support@campus-abroad.co.in',1723528522),(3,'Course Selection Updated Alert','CA953765 Course Selection Updated Alert','Course Selection Updated Alert','arpita@st.com','support@campus-abroad.co.in',1723530210),(4,'Course Selection Updated Alert','CA953765 Course Selection Updated Alert','Course Selection Updated Alert','arpita@st.com','support@campus-abroad.co.in',1723530268),(5,'Profile Updated Alert','CA953765 Profile Updated Alert','Profile Updated Alert','arpita@st.com','support@campus-abroad.co.in',1723530306),(6,'Documents Upload Alert','CA953765 Documents Upload Alert','Documents Upload Alert','arpita@st.com','support@campus-abroad.co.in',1723530341),(7,'Academic Details Updated Alert','CA953765 Academic Details Updated Alert','Academic Details Updated Alert','arpita@st.com','support@campus-abroad.co.in',1723530589),(8,'Status Updated Alert','CA953765 Status Updated Alert','Status Updated Alert','arpita@st.com','support@campus-abroad.co.in',1723530644),(9,'Status Updated Alert','CA953765 Status Updated Alert','Status Updated Alert','arpita@st.com','support@campus-abroad.co.in',1723530667),(10,'Status Updated Alert','CA953765 Status Updated Alert','Status Updated Alert','arpita@st.com','support@campus-abroad.co.in',1723530939),(11,'Status Updated Alert','CA953765 Status Updated Alert','Status Updated Alert','arpita@st.com','support@campus-abroad.co.in',1723530962),(12,'Status Updated Alert','CA953765 Status Updated Alert','Status Updated Alert','arpita@st.com','support@campus-abroad.co.in',1723530982),(13,'Status Updated Alert','CA953765 Status Updated Alert','Status Updated Alert','arpita@st.com','support@campus-abroad.co.in',1723531021),(14,'Status Updated Alert','CA953765 Status Updated Alert','Status Updated Alert','arpita@st.com','support@campus-abroad.co.in',1723531022),(15,'Status Updated Alert','CA953765 Status Updated Alert','Status Updated Alert','arpita@st.com','support@campus-abroad.co.in',1723531852),(16,'Status Updated Alert','CA953765 Status Updated Alert','Status Updated Alert','arpita@st.com','support@campus-abroad.co.in',1723531902),(17,'Status Updated Alert','CA953765 Status Updated Alert','Status Updated Alert','arpita@st.com','support@campus-abroad.co.in',1723531965),(18,'Status Updated Alert','CA953765 Status Updated Alert','Status Updated Alert','arpita@st.com,amit@moticorporation.com,yogesh@bafna.net,manish@bafna.net','support@campus-abroad.co.in',1723532822),(19,'Course Selection Updated Alert','CA629998 Course Selection Updated Alert','Course Selection Updated Alert','manoj@mail.com','support@campus-abroad.co.in',1723533453),(20,'Status Updated Alert','CA629998 Status Updated Alert','Status Updated Alert','manoj@mail.com,amit@moticorporation.com,yogesh@bafna.net,manish@bafna.net','support@campus-abroad.co.in',1723533506),(21,'Status Updated Alert','CA629998 Status Updated Alert','Status Updated Alert','manoj@mail.com,amit@moticorporation.com,yogesh@bafna.net,manish@bafna.net','support@campus-abroad.co.in',1723533650),(22,'Profile Updated Alert','CA629998 Profile Updated Alert','Profile Updated Alert','manoj@mail.com','support@campus-abroad.co.in',1723533738),(23,'Status Updated Alert','CA629998 Status Updated Alert','Status Updated Alert','manoj@mail.com,amit@moticorporation.com,yogesh@bafna.net,manish@bafna.net','support@campus-abroad.co.in',1723533766),(24,'Status Updated Alert','CA629998 Status Updated Alert','Status Updated Alert','manoj@mail.com,amit@moticorporation.com,yogesh@bafna.net,manish@bafna.net','support@campus-abroad.co.in',1723533796),(25,'Status Updated Alert','CA629998 Status Updated Alert','Status Updated Alert','manoj@mail.com,amit@moticorporation.com,yogesh@bafna.net,manish@bafna.net','support@campus-abroad.co.in',1723533949),(26,'Status Updated Alert','CA629998 Status Updated Alert','Status Updated Alert','manoj@mail.com,amit@moticorporation.com,yogesh@bafna.net,manish@bafna.net','support@campus-abroad.co.in',1723533965),(27,'Status Updated Alert','CA629998 Status Updated Alert','Status Updated Alert','manoj@mail.com,amit@moticorporation.com,yogesh@bafna.net,manish@bafna.net','support@campus-abroad.co.in',1723533985),(28,'Status Updated Alert','CA629998 Status Updated Alert','Status Updated Alert','manoj@mail.com,amit@moticorporation.com,yogesh@bafna.net,manish@bafna.net','support@campus-abroad.co.in',1723534360),(29,'Status Updated Alert','CA629998 Status Updated Alert','Status Updated Alert','manoj@mail.com,amit@moticorporation.com,yogesh@bafna.net,manish@bafna.net','support@campus-abroad.co.in',1723534417),(30,'Status Updated Alert','CA629998 Status Updated Alert','Status Updated Alert','manoj@mail.com,yogesh@bafna.net,amit@moticorporation.com','support@campus-abroad.co.in',1723620626),(31,'Status Updated Alert','CA494964 Status Updated Alert','Status Updated Alert','rajesh@mail.com,yogesh@bafna.net,amit@moticorporation.com','support@campus-abroad.co.in',1723620867),(32,'Status Updated Alert','CA494964 Status Updated Alert','Status Updated Alert','rajesh@mail.com,yogesh@bafna.net,amit@moticorporation.com','support@campus-abroad.co.in',1723621028),(33,'URN Profile Update Alert','CA494964 URN Profile Update Alert','URN Profile Update Alert','rajesh@mail.com,amit@moticorporation.com,as4u.in@gmail.com','support@campus-abroad.co.in',1723621155),(34,'URN Profile Update Alert','CA494964 URN Profile Update Alert','URN Profile Update Alert','rajesh@mail.com,amit@moticorporation.com,as4u.in@gmail.com','support@campus-abroad.co.in',1723621393),(35,'Document Upload Alert','CA494964 Document Upload Alert','Document Upload Alert','rajesh@mail.com,yogesh@bafna.net,amit@moticorporation.com,as4u.in@gmail.com','support@campus-abroad.co.in',1723621489),(36,'New Backend Staff Signup Alert','Welcome Rajiv to Campus-Abroad','New Backend Staff Signup Alert','rajiv@bs.com,amit@moticorporation.com','support@campus-abroad.co.in',1723621934),(37,'New Agent Signup Alert','Welcome Ramesh to Campus-Abroad','New Agent Signup Alert','ramesh@sa.com,amit@moticorporation.com','support@campus-abroad.co.in',1723622054),(38,'New Sales Person Signup Alert','Welcome Arpita to Campus-Abroad','New Sales Person Signup Alert','arpita@sp.com,amit@moticorporation.com','support@campus-abroad.co.in',1723622191),(39,'Withdrawal Request Alert','Withdrawal Request Alert','Withdrawal Request Alert','jasi@sa.com,amit@moticorporation.com','support@campus-abroad.co.in',1723622389),(40,'Withdrawal Approval Alert','Withdrawal Approval Alert','Withdrawal Approval Alert','jasi@sa.com,amit@moticorporation.com','support@campus-abroad.co.in',1723622482),(41,'Withdrawal Approval Alert','Withdrawal Approval Alert','Withdrawal Approval Alert','jasi@sa.com,amit@moticorporation.com','support@campus-abroad.co.in',1723630092),(42,'Withdrawal Request Alert','Withdrawal Request Alert','Withdrawal Request Alert','yogesh@sa.com,amit@moticorporation.com','support@campus-abroad.co.in',1723630198),(43,'Withdrawal Approval Alert','Withdrawal Approval Alert','Withdrawal Approval Alert','yogesh@sa.com,amit@moticorporation.com','support@campus-abroad.co.in',1723630245),(44,'Withdrawal Request Alert','Withdrawal Request Alert','Withdrawal Request Alert','yogesh@sa.com,amit@moticorporation.com,accounts@bafna.net','support@campus-abroad.co.in',1723631368),(45,'Withdrawal Approval Alert','Withdrawal Approval Alert','Withdrawal Approval Alert','yogesh@sa.com,amit@moticorporation.com,accounts@bafna.net','support@campus-abroad.co.in',1723631530),(46,'URN Allocation Alert','CA615938 URN Allocation Alert','URN Allocation Alert','mamta@sa.com,yogesh@bafna.net,amit@moticorporation.com','support@campus-abroad.co.in',1723796047),(47,'Status Updated Alert','CA615938 Status Updated Alert','Status Updated Alert','chhavi@mail.com,yogesh@bafna.net,amit@moticorporation.com','support@campus-abroad.co.in',1723796089),(48,'Status Updated Alert','CA615938 Status Updated Alert','Status Updated Alert','chhavi@mail.com,yogesh@bafna.net,amit@moticorporation.com','support@campus-abroad.co.in',1723796101),(49,'Status Updated Alert','CA615938 Status Updated Alert','Status Updated Alert','chhavi@mail.com,yogesh@bafna.net,amit@moticorporation.com','support@campus-abroad.co.in',1723796113),(50,'Status Updated Alert','CA615938 Status Updated Alert','Status Updated Alert','chhavi@mail.com,yogesh@bafna.net,amit@moticorporation.com','support@campus-abroad.co.in',1723796124),(51,'Status Updated Alert','CA615938 Status Updated Alert','Status Updated Alert','chhavi@mail.com,yogesh@bafna.net,amit@moticorporation.com','support@campus-abroad.co.in',1723796136),(52,'Academic Details Updated Alert','CA615938 Academic Details Updated Alert','Academic Details Updated Alert','chhavi@mail.com','support@campus-abroad.co.in',1723796299),(53,'Academic Details Updated Alert','CA615938 Academic Details Updated Alert','Academic Details Updated Alert','chhavi@mail.com','support@campus-abroad.co.in',1723796305),(54,'Academic Details Updated Alert','CA615938 Academic Details Updated Alert','Academic Details Updated Alert','chhavi@mail.com','support@campus-abroad.co.in',1723796311),(55,'Academic Details Updated Alert','CA615938 Academic Details Updated Alert','Academic Details Updated Alert','chhavi@mail.com','support@campus-abroad.co.in',1723796317),(56,'Academic Details Updated Alert','CA615938 Academic Details Updated Alert','Academic Details Updated Alert','chhavi@mail.com','support@campus-abroad.co.in',1723797190),(57,'Academic Details Updated Alert','CA615938 Academic Details Updated Alert','Academic Details Updated Alert','chhavi@mail.com','support@campus-abroad.co.in',1723797289),(58,'Status Updated Alert','CA615938 Status Updated Alert','Status Updated Alert','chhavi@mail.com,yogesh@bafna.net,amit@moticorporation.com','support@campus-abroad.co.in',1723797343),(59,'Course Selection Updated Alert','CA615938 Course Selection Updated Alert','Course Selection Updated Alert','chhavi@mail.com','support@campus-abroad.co.in',1723797388),(60,'Course Selection Updated Alert','CA615938 Course Selection Updated Alert','Course Selection Updated Alert','chhavi@mail.com','support@campus-abroad.co.in',1723797394),(61,'Applied Alert','CA615938 Applied','CA615938 Applied','chhavi@mail.com','support@campus-abroad.co.in',1723797417),(62,'URN Allocation Alert','CA615938 URN Allocation Alert','URN Allocation Alert','komal@mail.com,yogesh@bafna.net,amit@moticorporation.com','support@campus-abroad.co.in',1723797463),(63,'URN Approved Alert','CA615938 URN Approved','CA615938 URN Approved','chhavi@mail.com','support@campus-abroad.co.in',1723797484),(64,'Status Updated Alert','CA615938 Status Updated Alert','Status Updated Alert','chhavi@mail.com,yogesh@bafna.net,amit@moticorporation.com','support@campus-abroad.co.in',1723797617),(65,'Status Updated Alert','CA615938 Status Updated Alert','Status Updated Alert','chhavi@mail.com,yogesh@bafna.net,amit@moticorporation.com','support@campus-abroad.co.in',1723797629),(66,'Status Updated Alert','CA615938 Status Updated Alert','Status Updated Alert','chhavi@mail.com,yogesh@bafna.net,amit@moticorporation.com','support@campus-abroad.co.in',1723797640),(67,'Status Updated Alert','CA615938 Status Updated Alert','Status Updated Alert','chhavi@mail.com,yogesh@bafna.net,amit@moticorporation.com','support@campus-abroad.co.in',1723797652),(68,'Status Updated Alert','CA615938 Status Updated Alert','Status Updated Alert','chhavi@mail.com,yogesh@bafna.net,amit@moticorporation.com','support@campus-abroad.co.in',1723797663),(69,'Status Updated Alert','CA615938 Status Updated Alert','Status Updated Alert','chhavi@mail.com,yogesh@bafna.net,amit@moticorporation.com','support@campus-abroad.co.in',1723797681),(70,'Status Updated Alert','CA615938 Status Updated Alert','Status Updated Alert','chhavi@mail.com,yogesh@bafna.net,amit@moticorporation.com','support@campus-abroad.co.in',1723798939),(71,'Status Updated Alert','CA615938 Status Updated Alert','Status Updated Alert','chhavi@mail.com,yogesh@bafna.net,amit@moticorporation.com','support@campus-abroad.co.in',1723798951),(72,'Status Updated Alert','CA615938 Status Updated Alert','Status Updated Alert','chhavi@mail.com,yogesh@bafna.net,amit@moticorporation.com','support@campus-abroad.co.in',1723798962),(73,'Status Updated Alert','CA615938 Status Updated Alert','Status Updated Alert','chhavi@mail.com,yogesh@bafna.net,amit@moticorporation.com','support@campus-abroad.co.in',1723798974),(74,'Status Updated Alert','CA615938 Status Updated Alert','Status Updated Alert','chhavi@mail.com,yogesh@bafna.net,amit@moticorporation.com','support@campus-abroad.co.in',1723798985),(75,'Visa Applied Alert','CA615938 Visa Applied','CA615938 Visa Applied','chhavi@mail.com','support@campus-abroad.co.in',1723799107),(76,'Visa Approved Alert','CA615938 Visa Approved','CA615938 Visa Approved','chhavi@mail.com','support@campus-abroad.co.in',1723799144),(77,'Visa Approved Alert','CA615938 Visa Approved','CA615938 Visa Approved','chhavi@mail.com','support@campus-abroad.co.in',1723799150),(78,'Fee Paid Alert','CA615938 Fee Paid','CA615938 Fee Paid','chhavi@mail.com','support@campus-abroad.co.in',1723799216),(79,'Status Updated Alert','CA615938 Status Updated Alert','Status Updated Alert','chhavi@mail.com,yogesh@bafna.net,amit@moticorporation.com','support@campus-abroad.co.in',1723799251),(80,'Status Updated Alert','CA615938 Status Updated Alert','Status Updated Alert','chhavi@mail.com,yogesh@bafna.net,amit@moticorporation.com','support@campus-abroad.co.in',1723799263),(81,'Withdrawal Request Alert','Withdrawal Request Alert','Withdrawal Request Alert','komal@mail.com,yogesh@bafna.net,amit@moticorporation.com,accounts@bafna.net','support@campus-abroad.co.in',1723802169),(82,'Withdrawal Approval Alert','Withdrawal Approval Alert','Withdrawal Approval Alert','komal@mail.com,yogesh@bafna.net,amit@moticorporation.com,accounts@bafna.net','support@campus-abroad.co.in',1723803057),(83,'Withdrawal Approval Alert','Withdrawal Approval Alert','Withdrawal Approval Alert','komal@mail.com,yogesh@bafna.net,amit@moticorporation.com,accounts@bafna.net','support@campus-abroad.co.in',1723803074),(84,'URN Allocation Alert','CA766610 URN Allocation Alert','URN Allocation Alert','ramesh@sa.com,yogesh@bafna.net,amit@moticorporation.com','support@campus-abroad.co.in',1724048888),(85,'Additional Details Updated Alert','CA766610 Additional Details Updated Alert','Additional Details Updated Alert','rajiv@st.com','support@campus-abroad.co.in',1724049310),(86,'Additional Details Updated Alert','CA766610 Additional Details Updated Alert','Additional Details Updated Alert','rajiv@st.com','support@campus-abroad.co.in',1724049316),(87,'Additional Details Updated Alert','CA766610 Additional Details Updated Alert','Additional Details Updated Alert','rajiv@st.com','support@campus-abroad.co.in',1724049324),(88,'Withdrawal Request Alert','Withdrawal Request Alert','Withdrawal Request Alert','yogesh@sa.com,yogesh@bafna.net,amit@moticorporation.com,accounts@bafna.net','support@campus-abroad.co.in',1724050627),(89,'Withdrawal Request Alert','Withdrawal Request Alert','Withdrawal Request Alert','yogesh@sa.com,yogesh@bafna.net,amit@moticorporation.com,accounts@bafna.net','support@campus-abroad.co.in',1724050644),(90,'Withdrawal Request Alert','Withdrawal Request Alert','Withdrawal Request Alert','yogesh@sa.com,yogesh@bafna.net,amit@moticorporation.com,accounts@bafna.net','support@campus-abroad.co.in',1724050661),(91,'Withdrawal Approval Alert','Withdrawal Approval Alert','Withdrawal Approval Alert','yogesh@sa.com,yogesh@bafna.net,amit@moticorporation.com,accounts@bafna.net','support@campus-abroad.co.in',1724050845),(92,'Withdrawal Approval Alert','Withdrawal Approval Alert','Withdrawal Approval Alert','yogesh@sa.com,yogesh@bafna.net,amit@moticorporation.com,accounts@bafna.net','support@campus-abroad.co.in',1724050862),(93,'Withdrawal Request Alert','Withdrawal Request Alert','Withdrawal Request Alert','yogesh@sa.com,yogesh@bafna.net,amit@moticorporation.com,accounts@bafna.net','support@campus-abroad.co.in',1724051757),(94,'Withdrawal Approval Alert','Withdrawal Approval Alert','Withdrawal Approval Alert','yogesh@sa.com,yogesh@bafna.net,amit@moticorporation.com,accounts@bafna.net','support@campus-abroad.co.in',1724051912),(95,'Withdrawal Request Alert','Withdrawal Request Alert','Withdrawal Request Alert','komal@mail.com,yogesh@bafna.net,amit@moticorporation.com,accounts@bafna.net','support@campus-abroad.co.in',1724052618),(96,'Withdrawal Approval Alert','Withdrawal Approval Alert','Withdrawal Approval Alert','komal@mail.com,yogesh@bafna.net,amit@moticorporation.com,accounts@bafna.net','support@campus-abroad.co.in',1724052734),(97,'Withdrawal Request Alert','Withdrawal Request Alert','Withdrawal Request Alert','komal@mail.com,yogesh@bafna.net,amit@moticorporation.com,accounts@bafna.net','support@campus-abroad.co.in',1724052814),(98,'Withdrawal Request Alert','Withdrawal Request Alert','Withdrawal Request Alert','komal@mail.com,yogesh@bafna.net,amit@moticorporation.com,accounts@bafna.net','support@campus-abroad.co.in',1724052849),(99,'Withdrawal Approval Alert','Withdrawal Approval Alert','Withdrawal Approval Alert','komal@mail.com,yogesh@bafna.net,amit@moticorporation.com,accounts@bafna.net','support@campus-abroad.co.in',1724053193),(100,'New Backend Staff Signup Alert','Welcome Anil to Campus-Abroad','New Backend Staff Signup Alert','anil@mail.com,yogesh@bafna.net,amit@moticorporation.com','support@campus-abroad.co.in',1724055490),(101,'New Agent Signup Alert','Welcome suman to Campus-Abroad','New Agent Signup Alert','suman@mail.com,yogesh@bafna.net,amit@moticorporation.com','support@campus-abroad.co.in',1724055819),(102,'URN Allocation Alert','CA766610 URN Allocation Alert','URN Allocation Alert','sam@mail.com,yogesh@bafna.net,amit@moticorporation.com','support@campus-abroad.co.in',1724136374),(103,'New Sales Person Signup Alert','Welcome Anjana to Campus-Abroad','New Sales Person Signup Alert','anjana@mail.com,yogesh@bafna.net,amit@moticorporation.com','support@campus-abroad.co.in',1724136840),(104,'URN Allocation Alert','CA766610 URN Allocation Alert','URN Allocation Alert','anjana@mail.com,yogesh@bafna.net,amit@moticorporation.com','support@campus-abroad.co.in',1724136922),(105,'Document Upload Alert','CA766610 Document Upload Alert','Document Upload Alert','rajiv@st.com,yogesh@bafna.net,amit@moticorporation.com','support@campus-abroad.co.in',1724137027),(106,'Academic Details Updated Alert','CA766610 Academic Details Updated Alert','Academic Details Updated Alert','rajiv@st.com','support@campus-abroad.co.in',1724137431),(107,'Academic Details Updated Alert','CA766610 Academic Details Updated Alert','Academic Details Updated Alert','rajiv@st.com','support@campus-abroad.co.in',1724137438),(108,'New Callback Set Alert','CA766610 New Callback Set Alert','New Callback Set Alert','rajiv@st.com,yogesh@bafna.net,amit@moticorporation.com','support@campus-abroad.co.in',1724137567),(109,'Status Updated Alert','CA766610 Status Updated Alert','Status Updated Alert','rajiv@st.com,yogesh@bafna.net,amit@moticorporation.com','support@campus-abroad.co.in',1724137619),(110,'Status Updated Alert','CA766610 Status Updated Alert','Status Updated Alert','rajiv@st.com,yogesh@bafna.net,amit@moticorporation.com','support@campus-abroad.co.in',1724137893),(111,'Applied Alert','CA766610 Applied','CA766610 Applied','rajiv@st.com','support@campus-abroad.co.in',1724138049),(112,'URN Approved Alert','CA766610 URN Approved','CA766610 URN Approved','rajiv@st.com','support@campus-abroad.co.in',1724138078),(113,'Status Updated Alert','CA766610 Status Updated Alert','Status Updated Alert','rajiv@st.com,yogesh@bafna.net,amit@moticorporation.com','support@campus-abroad.co.in',1724138107),(114,'Status Updated Alert','CA766610 Status Updated Alert','Status Updated Alert','rajiv@st.com,yogesh@bafna.net,amit@moticorporation.com','support@campus-abroad.co.in',1724138163),(115,'Visa Applied Alert','CA766610 Visa Applied','CA766610 Visa Applied','rajiv@st.com','support@campus-abroad.co.in',1724138192),(116,'Visa Applied Alert','CA766610 Visa Applied','CA766610 Visa Applied','rajiv@st.com','support@campus-abroad.co.in',1724138198),(117,'Visa Approved Alert','CA766610 Visa Approved','CA766610 Visa Approved','rajiv@st.com','support@campus-abroad.co.in',1724138249),(118,'Fee Paid Alert','CA766610 Fee Paid','CA766610 Fee Paid','rajiv@st.com','support@campus-abroad.co.in',1724138273),(119,'Callback Update Alert','CA766610 Callback Update Alert','Callback Update Alert','rajiv@st.com,yogesh@bafna.net,amit@moticorporation.com','support@campus-abroad.co.in',1724138408),(120,'Status Updated Alert','CA766610 Status Updated Alert','Status Updated Alert','rajiv@st.com,yogesh@bafna.net,amit@moticorporation.com','support@campus-abroad.co.in',1724138501),(121,'Withdrawal Request Alert','Withdrawal Request Alert','Withdrawal Request Alert','anjana@mail.com,yogesh@bafna.net,amit@moticorporation.com,accounts@bafna.net','support@campus-abroad.co.in',1724139733),(122,'Withdrawal Request Alert','Withdrawal Request Alert','Withdrawal Request Alert','anjana@mail.com,yogesh@bafna.net,amit@moticorporation.com,accounts@bafna.net','support@campus-abroad.co.in',1724139751),(123,'Withdrawal Approval Alert','Withdrawal Approval Alert','Withdrawal Approval Alert','anjana@mail.com,yogesh@bafna.net,amit@moticorporation.com,accounts@bafna.net','support@campus-abroad.co.in',1724140231),(124,'Withdrawal Request Alert','Withdrawal Request Alert','Withdrawal Request Alert','mamta@sa.com,yogesh@bafna.net,amit@moticorporation.com,accounts@bafna.net','support@campus-abroad.co.in',1724144441),(125,'Withdrawal Request Alert','Withdrawal Request Alert','Withdrawal Request Alert','mamta@sa.com,yogesh@bafna.net,amit@moticorporation.com,accounts@bafna.net','support@campus-abroad.co.in',1724144480),(126,'Withdrawal Request Alert','Withdrawal Request Alert','Withdrawal Request Alert','mamta@sa.com,yogesh@bafna.net,amit@moticorporation.com,accounts@bafna.net','support@campus-abroad.co.in',1724144546),(127,'Withdrawal Request Alert','Withdrawal Request Alert','Withdrawal Request Alert','mamta@sa.com,yogesh@bafna.net,amit@moticorporation.com,accounts@bafna.net','support@campus-abroad.co.in',1724144625),(128,'Withdrawal Request Alert','Withdrawal Request Alert','Withdrawal Request Alert','mamta@sa.com,yogesh@bafna.net,amit@moticorporation.com,accounts@bafna.net','support@campus-abroad.co.in',1724145393),(129,'Withdrawal Request Alert','Withdrawal Request Alert','Withdrawal Request Alert','mamta@sa.com,yogesh@bafna.net,amit@moticorporation.com,accounts@bafna.net','support@campus-abroad.co.in',1724145626),(130,'Withdrawal Request Alert','Withdrawal Request Alert','Withdrawal Request Alert','mamta@sa.com,yogesh@bafna.net,amit@moticorporation.com,accounts@bafna.net','support@campus-abroad.co.in',1724145668),(131,'Withdrawal Request Alert','Withdrawal Request Alert','Withdrawal Request Alert','mamta@sa.com,yogesh@bafna.net,amit@moticorporation.com,accounts@bafna.net','support@campus-abroad.co.in',1724145686),(132,'Withdrawal Request Alert','Withdrawal Request Alert','Withdrawal Request Alert','mamta@sa.com,yogesh@bafna.net,amit@moticorporation.com,accounts@bafna.net','support@campus-abroad.co.in',1724145724),(133,'Withdrawal Request Alert','Withdrawal Request Alert','Withdrawal Request Alert','mamta@sa.com,yogesh@bafna.net,amit@moticorporation.com,accounts@bafna.net','support@campus-abroad.co.in',1724145748),(134,'Withdrawal Approval Alert','Withdrawal Approval Alert','Withdrawal Approval Alert','mamta@sa.com,yogesh@bafna.net,amit@moticorporation.com,accounts@bafna.net','support@campus-abroad.co.in',1724146379),(135,'Withdrawal Request Alert','Withdrawal Request Alert','Withdrawal Request Alert','mamta@sa.com,yogesh@bafna.net,amit@moticorporation.com,accounts@bafna.net','support@campus-abroad.co.in',1724218289),(136,'Withdrawal Request Alert','Withdrawal Request Alert','Withdrawal Request Alert','mamta@sa.com,yogesh@bafna.net,amit@moticorporation.com,accounts@bafna.net','support@campus-abroad.co.in',1724218328),(137,'Withdrawal Request Alert','Withdrawal Request Alert','Withdrawal Request Alert','mamta@sa.com,yogesh@bafna.net,amit@moticorporation.com,accounts@bafna.net','support@campus-abroad.co.in',1724218355),(138,'Withdrawal Request Alert','Withdrawal Request Alert','Withdrawal Request Alert','mamta@sa.com,yogesh@bafna.net,amit@moticorporation.com,accounts@bafna.net','support@campus-abroad.co.in',1724219255),(139,'Withdrawal Request Alert','Withdrawal Request Alert','Withdrawal Request Alert','mamta@sa.com,yogesh@bafna.net,amit@moticorporation.com,accounts@bafna.net','support@campus-abroad.co.in',1724219272),(140,'Withdrawal Request Alert','Withdrawal Request Alert','Withdrawal Request Alert','mamta@sa.com,yogesh@bafna.net,amit@moticorporation.com,accounts@bafna.net','support@campus-abroad.co.in',1724219289),(141,'Withdrawal Request Alert','Withdrawal Request Alert','Withdrawal Request Alert','mamta@sa.com,yogesh@bafna.net,amit@moticorporation.com,accounts@bafna.net','support@campus-abroad.co.in',1724219483),(142,'Withdrawal Request Alert','Withdrawal Request Alert','Withdrawal Request Alert','mamta@sa.com,yogesh@bafna.net,amit@moticorporation.com,accounts@bafna.net','support@campus-abroad.co.in',1724219500),(143,'Withdrawal Request Alert','Withdrawal Request Alert','Withdrawal Request Alert','mamta@sa.com,yogesh@bafna.net,amit@moticorporation.com,accounts@bafna.net','support@campus-abroad.co.in',1724219516),(144,'Withdrawal Request Alert','Withdrawal Request Alert','Withdrawal Request Alert','mamta@sa.com,yogesh@bafna.net,amit@moticorporation.com,accounts@bafna.net','support@campus-abroad.co.in',1724219903),(145,'Withdrawal Request Alert','Withdrawal Request Alert','Withdrawal Request Alert','mamta@sa.com,yogesh@bafna.net,amit@moticorporation.com,accounts@bafna.net','support@campus-abroad.co.in',1724219920),(146,'Withdrawal Request Alert','Withdrawal Request Alert','Withdrawal Request Alert','mamta@sa.com,yogesh@bafna.net,amit@moticorporation.com,accounts@bafna.net','support@campus-abroad.co.in',1724219937),(147,'Withdrawal Request Alert','Withdrawal Request Alert','Withdrawal Request Alert','mamta@sa.com,yogesh@bafna.net,amit@moticorporation.com,accounts@bafna.net','support@campus-abroad.co.in',1724219954),(148,'Withdrawal Request Alert','Withdrawal Request Alert','Withdrawal Request Alert','yogesh@sa.com,yogesh@bafna.net,amit@moticorporation.com,accounts@bafna.net','support@campus-abroad.co.in',1724220149),(149,'Withdrawal Request Alert','Withdrawal Request Alert','Withdrawal Request Alert','yogesh@sa.com,yogesh@bafna.net,amit@moticorporation.com,accounts@bafna.net','support@campus-abroad.co.in',1724220166),(150,'Withdrawal Request Alert','Withdrawal Request Alert','Withdrawal Request Alert','yogesh@sa.com,yogesh@bafna.net,amit@moticorporation.com,accounts@bafna.net','support@campus-abroad.co.in',1724220183),(151,'Withdrawal Request Alert','Withdrawal Request Alert','Withdrawal Request Alert','yogesh@sa.com,yogesh@bafna.net,amit@moticorporation.com,accounts@bafna.net','support@campus-abroad.co.in',1724220247),(152,'Withdrawal Request Alert','Withdrawal Request Alert','Withdrawal Request Alert','menzies@mail.com,yogesh@bafna.net,amit@moticorporation.com,accounts@bafna.net','support@campus-abroad.co.in',1724220254),(153,'Withdrawal Request Alert','Withdrawal Request Alert','Withdrawal Request Alert','yogesh@sa.com,yogesh@bafna.net,amit@moticorporation.com,accounts@bafna.net','support@campus-abroad.co.in',1724220264),(154,'Withdrawal Request Alert','Withdrawal Request Alert','Withdrawal Request Alert','menzies@mail.com,yogesh@bafna.net,amit@moticorporation.com,accounts@bafna.net','support@campus-abroad.co.in',1724220271),(155,'Withdrawal Request Alert','Withdrawal Request Alert','Withdrawal Request Alert','yogesh@sa.com,yogesh@bafna.net,amit@moticorporation.com,accounts@bafna.net','support@campus-abroad.co.in',1724220654),(156,'Withdrawal Request Alert','Withdrawal Request Alert','Withdrawal Request Alert','yogesh@sa.com,yogesh@bafna.net,amit@moticorporation.com,accounts@bafna.net','support@campus-abroad.co.in',1724220810),(157,'Withdrawal Request Alert','Withdrawal Request Alert','Withdrawal Request Alert','yogesh@sa.com,yogesh@bafna.net,amit@moticorporation.com,accounts@bafna.net','support@campus-abroad.co.in',1724220865),(158,'Withdrawal Request Alert','Withdrawal Request Alert','Withdrawal Request Alert','yogesh@sa.com,yogesh@bafna.net,amit@moticorporation.com,accounts@bafna.net','support@campus-abroad.co.in',1724220966),(159,'Withdrawal Request Alert','Withdrawal Request Alert','Withdrawal Request Alert','yogesh@sa.com,yogesh@bafna.net,amit@moticorporation.com,accounts@bafna.net','support@campus-abroad.co.in',1724221068),(160,'Withdrawal Request Alert','Withdrawal Request Alert','Withdrawal Request Alert','yogesh@sa.com,yogesh@bafna.net,amit@moticorporation.com,accounts@bafna.net','support@campus-abroad.co.in',1724221287),(161,'Withdrawal Request Alert','Withdrawal Request Alert','Withdrawal Request Alert','yogesh@sa.com,yogesh@bafna.net,amit@moticorporation.com,accounts@bafna.net','support@campus-abroad.co.in',1724221335),(162,'Withdrawal Request Alert','Withdrawal Request Alert','Withdrawal Request Alert','yogesh@sa.com,yogesh@bafna.net,amit@moticorporation.com,accounts@bafna.net','support@campus-abroad.co.in',1724221885),(163,'Withdrawal Request Alert','Withdrawal Request Alert','Withdrawal Request Alert','yogesh@sa.com,yogesh@bafna.net,amit@moticorporation.com,accounts@bafna.net','support@campus-abroad.co.in',1724221972),(164,'Withdrawal Request Alert','Withdrawal Request Alert','Withdrawal Request Alert','yogesh@sa.com,yogesh@bafna.net,amit@moticorporation.com,accounts@bafna.net','support@campus-abroad.co.in',1724222313),(165,'Document Upload Alert','CA732712 Document Upload Alert','Document Upload Alert','reeth@mail.com,yogesh@bafna.net,amit@moticorporation.com','support@campus-abroad.co.in',1724222590),(166,'Academic Details Updated Alert','CA732712 Academic Details Updated Alert','Academic Details Updated Alert','reeth@mail.com','support@campus-abroad.co.in',1724222986),(167,'Withdrawal Request Alert','Withdrawal Request Alert','Withdrawal Request Alert','yogesh@sa.com,yogesh@bafna.net,amit@moticorporation.com,accounts@bafna.net','support@campus-abroad.co.in',1724223161),(168,'Withdrawal Request Alert','Withdrawal Request Alert','Withdrawal Request Alert','yogesh@sa.com,yogesh@bafna.net,amit@moticorporation.com,accounts@bafna.net','support@campus-abroad.co.in',1724223472),(169,'Withdrawal Request Alert','Withdrawal Request Alert','Withdrawal Request Alert','yogesh@sa.com,yogesh@bafna.net,amit@moticorporation.com,accounts@bafna.net','support@campus-abroad.co.in',1724223568),(170,'Withdrawal Request Alert','Withdrawal Request Alert','Withdrawal Request Alert','yogesh@sa.com,yogesh@bafna.net,amit@moticorporation.com,accounts@bafna.net','support@campus-abroad.co.in',1724223628),(171,'Withdrawal Approval Alert','Withdrawal Approval Alert','Withdrawal Approval Alert','yogesh@sa.com,yogesh@bafna.net,amit@moticorporation.com,accounts@bafna.net','support@campus-abroad.co.in',1724223745),(172,'Withdrawal Request Alert','Withdrawal Request Alert','Withdrawal Request Alert','yogesh@sa.com,yogesh@bafna.net,amit@moticorporation.com,accounts@bafna.net','support@campus-abroad.co.in',1724224001),(173,'Withdrawal Request Alert','Withdrawal Request Alert','Withdrawal Request Alert','yogesh@sa.com,yogesh@bafna.net,amit@moticorporation.com,accounts@bafna.net','support@campus-abroad.co.in',1724224343),(174,'Withdrawal Request Alert','Withdrawal Request Alert','Withdrawal Request Alert','sam@mail.com,yogesh@bafna.net,amit@moticorporation.com,accounts@bafna.net','support@campus-abroad.co.in',1724227655),(175,'Withdrawal Request Alert','Withdrawal Request Alert','Withdrawal Request Alert','sam@mail.com,yogesh@bafna.net,amit@moticorporation.com,accounts@bafna.net','support@campus-abroad.co.in',1724227672),(176,'Withdrawal Request Alert','Withdrawal Request Alert','Withdrawal Request Alert','yogesh@sa.com,yogesh@bafna.net,amit@moticorporation.com,accounts@bafna.net','support@campus-abroad.co.in',1724227864),(177,'Withdrawal Request Alert','Withdrawal Request Alert','Withdrawal Request Alert','yogesh@sa.com,yogesh@bafna.net,amit@moticorporation.com,accounts@bafna.net','support@campus-abroad.co.in',1724227890),(178,'Withdrawal Request Alert','Withdrawal Request Alert','Withdrawal Request Alert','yogesh@sa.com,yogesh@bafna.net,amit@moticorporation.com,accounts@bafna.net','support@campus-abroad.co.in',1724228068),(179,'Withdrawal Request Alert','Withdrawal Request Alert','Withdrawal Request Alert','yogesh@sa.com,yogesh@bafna.net,amit@moticorporation.com,accounts@bafna.net','support@campus-abroad.co.in',1724228229),(180,'URN Allocation Alert','CA494964 URN Allocation Alert','URN Allocation Alert','menzies@mail.com,yogesh@bafna.net,amit@moticorporation.com','support@campus-abroad.co.in',1724307036),(181,'Course Selection Updated Alert','CA494964 Course Selection Updated Alert','Course Selection Updated Alert','rajesh@mail.com','support@campus-abroad.co.in',1724307248),(182,'Applied Alert','CA494964 Applied','CA494964 Applied','rajesh@mail.com','support@campus-abroad.co.in',1724309718),(183,'URN Approved Alert','CA494964 URN Approved','CA494964 URN Approved','rajesh@mail.com','support@campus-abroad.co.in',1724309757),(184,'Status Updated Alert','CA494964 Status Updated Alert','Status Updated Alert','rajesh@mail.com,yogesh@bafna.net,amit@moticorporation.com','support@campus-abroad.co.in',1724309804),(185,'Status Updated Alert','CA494964 Status Updated Alert','Status Updated Alert','rajesh@mail.com,yogesh@bafna.net,amit@moticorporation.com','support@campus-abroad.co.in',1724309835),(186,'Visa Applied Alert','CA494964 Visa Applied','CA494964 Visa Applied','rajesh@mail.com','support@campus-abroad.co.in',1724310221);
/*!40000 ALTER TABLE `email_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `income_history`
--

DROP TABLE IF EXISTS `income_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `income_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lead_id` int(11) NOT NULL,
  `lead_amount` int(11) NOT NULL,
  `comission_amount` int(11) NOT NULL,
  `comission_rcvd` int(11) NOT NULL,
  `application_point_id` int(11) NOT NULL,
  `datentime` int(11) NOT NULL,
  `transaction_id` varchar(255) NOT NULL,
  `transaction_proof_file_name` varchar(255) NOT NULL,
  `entry_done_by` varchar(255) NOT NULL,
  `entry_datentime` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `income_history`
--

LOCK TABLES `income_history` WRITE;
/*!40000 ALTER TABLE `income_history` DISABLE KEYS */;
INSERT INTO `income_history` VALUES (1,1,16700,5010,1,1,1723013940,'1345','1345.jpeg','BS2',1723014007),(2,2,24400,7320,1,2,1723186500,'1213','1213.jpg','BS2',1723186558),(3,3,24500,7350,1,1,1723801680,'1345','1345.jpg','BS2',1723801708),(4,5,17700,1770,1,4,1724227380,'23455','23455.jpg','BS8',1724227424),(5,7,16700,5010,1,2,1724313840,'4565','4565.jpg','BS8',1724227479),(6,7,16700,5010,1,2,1724313840,'4565','4565.jpg','BS8',1724227479),(7,8,16700,1670,1,4,1724139420,'1`234','1`234.jpg','BS8',1724139510);
/*!40000 ALTER TABLE `income_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lead_allocation_list`
--

DROP TABLE IF EXISTS `lead_allocation_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lead_allocation_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lead_id` int(11) NOT NULL,
  `allocated_id` varchar(255) NOT NULL,
  `datentime` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lead_allocation_list`
--

LOCK TABLES `lead_allocation_list` WRITE;
/*!40000 ALTER TABLE `lead_allocation_list` DISABLE KEYS */;
INSERT INTO `lead_allocation_list` VALUES (1,1,'SA1',1723013295),(2,1,'SP1',1723013364),(3,2,'SP2',1723097373),(4,4,'SP2',1723450576),(5,3,'SP1',1723530232),(6,3,'SA1',1723530285),(7,5,'SA3',1723533413),(8,5,'SP3',1723533468),(9,7,'SA2',1723796037),(10,7,'SP2',1723797448),(11,8,'SA5',1724048876),(12,8,'SP3',1724136363),(13,8,'SP5',1724136911),(14,4,'SA3',1724307026);
/*!40000 ALTER TABLE `lead_allocation_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lead_sources_list`
--

DROP TABLE IF EXISTS `lead_sources_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lead_sources_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL,
  `datentime` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lead_sources_list`
--

LOCK TABLES `lead_sources_list` WRITE;
/*!40000 ALTER TABLE `lead_sources_list` DISABLE KEYS */;
INSERT INTO `lead_sources_list` VALUES (1,'Google',1719299784),(2,'WhatsApp',1719299784),(3,'Meta',1719299784),(4,'Sulekha',1719299784),(5,'Organic',1719301117),(6,'Others',1721708520),(8,'LinkedIN',1723463693);
/*!40000 ALTER TABLE `lead_sources_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lead_status_list`
--

DROP TABLE IF EXISTS `lead_status_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lead_status_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL,
  `step_order` int(11) NOT NULL,
  `batch_id` int(11) NOT NULL,
  `datentime` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lead_status_list`
--

LOCK TABLES `lead_status_list` WRITE;
/*!40000 ALTER TABLE `lead_status_list` DISABLE KEYS */;
INSERT INTO `lead_status_list` VALUES (1,'New',1,1,1719484628),(2,'Pre Application',2,1,1719484628),(3,'Verification',3,1,1719484628),(4,'Applied',4,1,1719484628),(5,'URN Approved',5,1,1719484628),(6,'Token Paid',6,1,1719484628),(7,'CAS Issued',7,1,1719484628),(8,'Visa Applied',8,1,1719484628),(9,'Visa Approved',9,1,1719484628),(10,'Fee Paid',10,1,1719484628),(11,'Complete',11,1,1719484628),(12,'Deleted',999,1,1719484628),(13,'URN Rejected',888,1,1719484628),(14,'Visa Rejected',777,1,1719484628),(15,'Pending',666,1,1719484628);
/*!40000 ALTER TABLE `lead_status_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leads_activity_history`
--

DROP TABLE IF EXISTS `leads_activity_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leads_activity_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lead_id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL,
  `comment` varchar(255) NOT NULL,
  `activity_by` varchar(255) NOT NULL,
  `datentime` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=162 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leads_activity_history`
--

LOCK TABLES `leads_activity_history` WRITE;
/*!40000 ALTER TABLE `leads_activity_history` DISABLE KEYS */;
INSERT INTO `leads_activity_history` VALUES (1,1,1,'URN Created','BS2',1723012729),(2,1,1,'Documents Uploaded','BS2',1723012816),(3,1,1,'waiting for results','BS2',1723013123),(4,1,1,'details uploaded','BS2',1723013231),(5,1,1,'assigned to SA1','BS2',1723013295),(6,1,2,'Status Updated','BS2',1723013308),(7,1,3,'Status Updated','BS2',1723013326),(8,1,3,'assigned to SP1','BS2',1723013364),(9,1,4,'Status Updated','BS2',1723013378),(10,1,5,'Status Updated','BS2',1723013393),(11,1,6,'Status Updated','BS2',1723013409),(12,1,7,'Status Updated','BS2',1723013424),(13,1,8,'Status Updated','BS2',1723013444),(14,1,9,'Status Updated','BS2',1723013465),(15,1,10,'Status Updated','BS2',1723013482),(16,1,11,'Status Updated','BS2',1723013503),(17,2,1,'URN Created','BS2',1723096918),(18,2,1,'Documents Uploaded','BS2',1723097034),(19,2,1,'test','BS2',1723097174),(20,2,1,'test','BS2',1723097239),(21,2,1,'assigned to SP2','BS2',1723097372),(22,2,2,'Status Updated','BS2',1723097385),(23,2,2,'need to call','BS2',1723097441),(24,2,3,'Status Updated','BS2',1723097456),(25,2,4,'Status Updated','BS2',1723097476),(26,2,5,'Status Updated','BS2',1723097495),(27,2,6,'Status Updated','BS2',1723097515),(28,2,7,'Status Updated','BS2',1723097531),(29,2,8,'Status Updated','BS2',1723097546),(30,2,9,'Status Updated','BS2',1723097562),(31,2,10,'Status Updated','BS2',1723097580),(32,2,11,'Status Updated','BS2',1723097600),(33,3,1,'Created','Portal Visitor',1723291238),(34,3,1,'Documents Uploaded','Portal Visitor',1723291828),(35,3,1,'testing','BS2',1723449585),(36,3,1,'course selection updated','BS2',1723449718),(37,3,1,'address updated','BS2',1723449765),(38,3,1,'test','BS2',1723450077),(39,3,1,'course selection updated','BS2',1723450269),(40,3,1,'course selection updated','BS2',1723450285),(41,4,1,'URN Created','BS2',1723450407),(42,4,1,'Documents Uploaded','BS2',1723450441),(43,4,1,'test','BS2',1723450535),(44,4,1,'assigned to SP2','BS2',1723450576),(45,4,1,'course selection updated','BS2',1723450628),(46,3,1,'course selection updated','BS2',1723451396),(47,5,1,'URN Created','BS2',1723451503),(48,5,1,'course selection updated','BS2',1723451519),(49,3,1,'Alt Mobile & DOB Updated','BS2',1723528306),(50,4,1,'DOB Updated','BS2',1723528522),(51,3,1,'course selection updated','BS2',1723530210),(52,3,1,'assigned to SP1','BS2',1723530232),(53,3,1,'course selection updated','BS2',1723530268),(54,3,1,'assigned to SA1','BS2',1723530285),(55,3,1,'sales agent reallocated','BS2',1723530306),(56,3,1,'Documents Uploaded','BS2',1723530341),(57,3,1,'updated','BS2',1723530589),(58,3,2,'Status Updated','BS2',1723530644),(59,3,3,'Status Updated','BS2',1723530667),(60,3,3,'email to be sent to client','BS2',1723530731),(61,3,4,'Status Updated','BS2',1723530939),(62,3,5,'Status Updated','BS2',1723530962),(63,3,6,'Status Updated','BS2',1723530982),(64,3,7,'Status Updated','BS2',1723531021),(65,3,7,'Status Updated','BS2',1723531022),(66,3,8,'Status Updated','BS2',1723531852),(67,3,9,'Status Updated','BS2',1723531902),(68,3,10,'Status Updated','BS2',1723531965),(69,3,11,'Status Updated','BS2',1723532822),(70,5,1,'assigned to SA3','BS2',1723533413),(71,5,1,'course selection updated','BS2',1723533453),(72,5,1,'assigned to SP3','BS2',1723533468),(73,5,2,'Status Updated','BS2',1723533506),(74,5,2,'write a letter','BS2',1723533564),(75,5,3,'Status Updated','BS2',1723533650),(76,5,3,'address updated','BS2',1723533738),(77,5,4,'Status Updated','BS2',1723533766),(78,5,5,'Status Updated','BS2',1723533796),(79,5,6,'Status Updated','BS2',1723533949),(80,5,7,'Status Updated','BS2',1723533965),(81,5,8,'Status Updated','BS2',1723533985),(82,5,9,'Status Updated','BS2',1723534360),(83,5,10,'Status Updated','BS2',1723534417),(84,4,1,'call','BS2',1723534937),(85,5,11,'Status Updated','BS2',1723620626),(86,4,2,'Status Updated','BS2',1723620867),(87,4,3,'Status Updated','BS2',1723621017),(88,4,3,'DOB Updated','BS2',1723621155),(89,4,3,'DOB Updated','BS2',1723621381),(90,4,3,'Documents Uploaded','BS2',1723621472),(91,6,1,'Created','Portal Visitor',1723795638),(92,6,1,'Documents Uploaded','Portal Visitor',1723795734),(93,7,1,'Created','Portal Visitor',1723795851),(94,7,1,'Documents Uploaded','Portal Visitor',1723795901),(95,7,1,'assigned to SA2','BS2',1723796037),(96,7,2,'Status Updated','BS2',1723796078),(97,7,2,'Status Updated','BS2',1723796090),(98,7,2,'Status Updated','BS2',1723796102),(99,7,2,'Status Updated','BS2',1723796114),(100,7,2,'Status Updated','BS2',1723796125),(101,7,2,'test','BS2',1723796290),(102,7,2,'test','BS2',1723796300),(103,7,2,'test','BS2',1723796305),(104,7,2,'test','BS2',1723796311),(105,7,2,'test','BS2',1723797184),(106,7,2,'test','BS2',1723797283),(107,7,3,'Status Updated','BS2',1723797332),(108,7,3,'course selection updated','BS2',1723797383),(109,7,3,'course selection updated','BS2',1723797389),(110,7,4,'Status Updated','BS2',1723797411),(111,7,4,'assigned to SP2','BS2',1723797448),(112,7,5,'Status Updated','BS2',1723797479),(113,7,6,'Status Updated','BS2',1723797606),(114,7,6,'Status Updated','BS2',1723797618),(115,7,6,'Status Updated','BS2',1723797629),(116,7,6,'Status Updated','BS2',1723797641),(117,7,6,'Status Updated','BS2',1723797652),(118,7,6,'Status Updated','BS2',1723797664),(119,7,7,'Status Updated','BS2',1723798925),(120,7,7,'Status Updated','BS2',1723798940),(121,7,7,'Status Updated','BS2',1723798952),(122,7,7,'Status Updated','BS2',1723798963),(123,7,7,'Status Updated','BS2',1723798974),(124,7,8,'Status Updated','BS2',1723799101),(125,7,9,'Status Updated','BS2',1723799138),(126,7,9,'Status Updated','BS2',1723799145),(127,7,10,'Status Updated','BS2',1723799210),(128,7,11,'Status Updated','BS2',1723799239),(129,7,11,'Status Updated','BS2',1723799252),(130,8,1,'Created','Portal Visitor',1723800966),(131,8,1,'Documents Uploaded','Portal Visitor',1723800989),(132,8,1,'assigned to SA5','BS8',1724048876),(133,8,1,'details uploaded','BS8',1724049304),(134,8,1,'details uploaded','BS8',1724049311),(135,8,1,'details uploaded','BS8',1724049318),(136,8,1,'assigned to SP3','BS8',1724136363),(137,8,1,'assigned to SP5','BS8',1724136911),(138,8,1,'Documents Uploaded','BS8',1724137016),(139,8,1,'details uploaded','BS8',1724137426),(140,8,1,'details uploaded','BS8',1724137432),(141,8,1,'call','BS8',1724137556),(142,8,2,'Status Updated','BS8',1724137608),(143,8,3,'Status Updated','BS8',1724137873),(144,8,4,'Status Updated','BS8',1724138043),(145,8,5,'Status Updated','BS8',1724138069),(146,8,6,'Status Updated','BS8',1724138096),(147,8,7,'Status Updated','BS8',1724138152),(148,8,8,'Status Updated','BS8',1724138187),(149,8,8,'Status Updated','BS8',1724138193),(150,8,9,'Status Updated','BS8',1724138236),(151,8,10,'Status Updated','BS8',1724138267),(152,8,11,'Status Updated','BS8',1724138486),(153,6,1,'Documents Uploaded','BS8',1724222579),(154,6,1,'test','BS8',1724222980),(155,4,3,'assigned to SA3','BS8',1724307026),(156,4,3,'course selection updated','BS8',1724307242),(157,4,4,'Status Updated','BS8',1724309713),(158,4,5,'Status Updated','BS8',1724309752),(159,4,6,'Status Updated','BS8',1724309786),(160,4,7,'Status Updated','BS8',1724309824),(161,4,8,'Status Updated','BS8',1724310215);
/*!40000 ALTER TABLE `leads_activity_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leads_details`
--

DROP TABLE IF EXISTS `leads_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leads_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `urn` int(11) NOT NULL,
  `status_id` int(11) NOT NULL,
  `status_batch_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `datentime` int(11) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `source_id` int(11) NOT NULL,
  `application_point_id` int(11) NOT NULL,
  `allocated_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leads_details`
--

LOCK TABLES `leads_details` WRITE;
/*!40000 ALTER TABLE `leads_details` DISABLE KEYS */;
INSERT INTO `leads_details` VALUES (1,975546,11,1,1,5,1723012729,'BS2',3,1,'SP1'),(2,906643,11,1,2,21,1723096918,'BS2',5,2,'SP2'),(3,953765,11,1,3,14,1723291238,'ST3',5,1,'SA1'),(4,494964,8,1,4,112,1723450407,'BS2',6,3,'SA3'),(5,629998,11,1,5,10,1723451503,'BS2',5,4,'SP3'),(6,732712,1,1,6,13,1723795638,'ST6',5,0,''),(7,615938,11,1,7,3,1723795851,'ST7',5,2,'SP2'),(8,766610,11,1,8,2,1723800966,'ST8',5,4,'SP5');
/*!40000 ALTER TABLE `leads_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_detail`
--

DROP TABLE IF EXISTS `login_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ref_id` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `login_type` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_detail`
--

LOCK TABLES `login_detail` WRITE;
/*!40000 ALTER TABLE `login_detail` DISABLE KEYS */;
INSERT INTO `login_detail` VALUES (1,'BS1','admin','@dmin',7,1),(43,'SP1','jasi@sa.com','123456',6,1),(42,'SA2','mamta@sa.com','98765',4,1),(41,'SA1','yogesh@sa.com','123456',4,1),(33,'BS3','jasi@bs.com','123456',3,1),(32,'BS2','yogesh@bafna.net','12345',1,1),(37,'BS8','manish@bafna.net','123456',8,1),(57,'BS10','amit@moticorporation.com','123456',8,1),(58,'ST1','sakshi@mail.com','std123456',5,1),(59,'ST2','suresh@mail.com','std123456',5,1),(60,'SP2','komal@mail.com','123456',6,1),(61,'ST3','arpita@st.com','test1234',5,1),(62,'ST4','rajesh@mail.com','std123456',5,1),(63,'ST5','manoj@mail.com','std123456',5,1),(64,'SA3','menzies@mail.com','123456',4,1),(65,'SP3','sam@mail.com','123456',6,1),(66,'SA4','test@sa.com','123456',4,1),(67,'BS11','rajiv@bs.com','123456',3,1),(68,'SA5','ramesh@sa.com','123456',4,1),(69,'SP4','arpita@sp.com','123456',6,1),(70,'ST6','reeth@mail.com','test1234',5,1),(71,'ST7','chhavi@mail.com','test1234',5,1),(72,'ST8','rajiv@st.com','test1234',5,1),(73,'BS12','anil@mail.com','123456',3,1),(74,'SA6','suman@mail.com','123456',4,1),(75,'SP5','anjana@mail.com','123456',6,1);
/*!40000 ALTER TABLE `login_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_type_list`
--

DROP TABLE IF EXISTS `login_type_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login_type_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL,
  `uses_rights` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_type_list`
--

LOCK TABLES `login_type_list` WRITE;
/*!40000 ALTER TABLE `login_type_list` DISABLE KEYS */;
INSERT INTO `login_type_list` VALUES (1,'Admin',11),(2,'Tech',11),(3,'Backend Staff',11),(4,'Agent',11),(5,'Student',11),(6,'Sales Person',0),(7,'Super Admin',11),(8,'Management',11),(9,'Portal Visitor',11);
/*!40000 ALTER TABLE `login_type_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_items`
--

DROP TABLE IF EXISTS `menu_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL,
  `submenu_id_name` varchar(255) NOT NULL,
  `icon_name` varchar(255) NOT NULL,
  `parent_menu_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_items`
--

LOCK TABLES `menu_items` WRITE;
/*!40000 ALTER TABLE `menu_items` DISABLE KEYS */;
INSERT INTO `menu_items` VALUES (1,'CRM','CRM','pie-chart',1),(2,'URN Management','URN','users',1),(3,'University Management','UNIV','clipboard',1),(4,'User Management','USER','user',1),(5,'Report Management','REPORT','file',1),(6,'Chat','CHAT','message-square',1),(8,'Site Management','SITE','dribbble',1),(7,'Management Account','FUND','dollar-sign',1),(9,'Menu Management','MENU','align-left',1),(12,'CRM','CRM','pie-chart',2),(13,'URN Management','URN','users',2),(14,'Account','ACCOUNT','user',2),(15,'Chat','CHAT','message-square',2),(16,'CRM','CRM','pie-chart',3),(17,'Account','ACCOUNT','user',3),(18,'Chat','CHAT','message-square',3),(20,'Reports','REPORT','file',2),(21,'Setup Email Alert','EMAIL-ALERT','mail',1),(22,'Communication History','COMMUNICATION','calendar',1);
/*!40000 ALTER TABLE `menu_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_list`
--

DROP TABLE IF EXISTS `menu_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_list`
--

LOCK TABLES `menu_list` WRITE;
/*!40000 ALTER TABLE `menu_list` DISABLE KEYS */;
INSERT INTO `menu_list` VALUES (1,'Main'),(2,'Partner'),(3,'Student');
/*!40000 ALTER TABLE `menu_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `min_education_list`
--

DROP TABLE IF EXISTS `min_education_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `min_education_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `min_education_list`
--

LOCK TABLES `min_education_list` WRITE;
/*!40000 ALTER TABLE `min_education_list` DISABLE KEYS */;
INSERT INTO `min_education_list` VALUES (1,'10th'),(2,'10+2'),(3,'diploma'),(4,'pg diploma'),(5,'graduate'),(6,'master');
/*!40000 ALTER TABLE `min_education_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `predefined_test_list`
--

DROP TABLE IF EXISTS `predefined_test_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `predefined_test_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `predefined_test_list`
--

LOCK TABLES `predefined_test_list` WRITE;
/*!40000 ALTER TABLE `predefined_test_list` DISABLE KEYS */;
INSERT INTO `predefined_test_list` VALUES (1,'IELTS'),(2,'TOEFL'),(3,'GRE'),(4,'DULINGO'),(5,'GMAT'),(6,'PTE'),(7,'SAT');
/*!40000 ALTER TABLE `predefined_test_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_person_list`
--

DROP TABLE IF EXISTS `sales_person_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales_person_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobile` bigint(20) NOT NULL,
  `whatsapp` bigint(20) NOT NULL,
  `salary` int(11) NOT NULL,
  `comission` float NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_person_list`
--

LOCK TABLES `sales_person_list` WRITE;
/*!40000 ALTER TABLE `sales_person_list` DISABLE KEYS */;
INSERT INTO `sales_person_list` VALUES (1,'Jasintha','jasi@sa.com',112,112,10000,30,1),(2,'Komal','komal@mail.com',9551345678,9551356790,15000,20,1),(3,'samara','sam@mail.com',456789876,9554343216,15000,10,1),(4,'Arpita','arpita@sp.com',9876512343,9876512343,10000,30,1),(5,'Anjana','anjana@mail.com',4567890876,4567890876,0,20,1);
/*!40000 ALTER TABLE `sales_person_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site_settings`
--

DROP TABLE IF EXISTS `site_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `site_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_title` varchar(255) NOT NULL,
  `wsp_name` varchar(255) NOT NULL,
  `wsp_url` varchar(255) NOT NULL,
  `crm_version` varchar(255) NOT NULL,
  `site_logo` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site_settings`
--

LOCK TABLES `site_settings` WRITE;
/*!40000 ALTER TABLE `site_settings` DISABLE KEYS */;
INSERT INTO `site_settings` VALUES (1,'Campus Abroad CRM V2','Moti Corporation','www.moticorporation.com','CRM v2.0','ca-logo.png');
/*!40000 ALTER TABLE `site_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_list`
--

DROP TABLE IF EXISTS `staff_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobile` bigint(20) NOT NULL,
  `designation` varchar(255) NOT NULL,
  `division` varchar(255) NOT NULL,
  `role_type` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `authorised_menu_options` varchar(2048) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_list`
--

LOCK TABLES `staff_list` WRITE;
/*!40000 ALTER TABLE `staff_list` DISABLE KEYS */;
INSERT INTO `staff_list` VALUES (2,'G Yogesh Bafna','yogesh@bafna.net',9902012547,'Director','Management',1,1,'1,2,3,4,5,6,8,7,21,22'),(3,'Jasintha','jasi@bs.com',1237890,'CSE','Support',3,1,'1,2,6'),(1,'admin','info@campus-abroad.co.in',9902012547,'Admin','Management',7,1,'1,2,3,4,5,6,7,8,9'),(8,'Manish Bafna','manish@bafna.net',123,'Manager','Management',8,1,'1,2,3,4,5,6,7'),(10,'Amit Sriwastav','amit@moticorporation.com',7618844888,'Developer','IT',8,1,'1,2,3,4,5,6,8,7'),(11,'Rajiv','rajiv@bs.com',9876512345,'CSE','Sales',3,0,'1,2,6'),(12,'Anil','anil@mail.com',2334659087,'executive','agent',3,0,'1,2,3,4,6');
/*!40000 ALTER TABLE `staff_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_callback_request_list`
--

DROP TABLE IF EXISTS `student_callback_request_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_callback_request_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lead_id` int(11) NOT NULL,
  `callback_datentime` int(11) NOT NULL,
  `reamrk` varchar(255) NOT NULL,
  `student_id` int(11) NOT NULL,
  `request_datentime` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_callback_request_list`
--

LOCK TABLES `student_callback_request_list` WRITE;
/*!40000 ALTER TABLE `student_callback_request_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_callback_request_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_wishlist`
--

DROP TABLE IF EXISTS `student_wishlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_wishlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_wishlist`
--

LOCK TABLES `student_wishlist` WRITE;
/*!40000 ALTER TABLE `student_wishlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_wishlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `mobile` bigint(20) NOT NULL,
  `alternate_mobile` bigint(20) NOT NULL,
  `email` varchar(255) NOT NULL,
  `dob` int(11) NOT NULL,
  `brief_note` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1,'sakshi',5678912345,0,'sakshi@mail.com',0,'No Note'),(2,'suresh',2345678905,0,'suresh@mail.com',0,'No Note'),(3,'Arpita',123456,12345,'arpita@st.com',315513000,'No Note'),(4,'Rajesh',9875634217,12345,'rajesh@mail.com',315513000,'No Note'),(5,'manoj',9988752345,0,'manoj@mail.com',-19800,'No Note'),(6,'Reeth ',2345667986,0,'reeth@mail.com',0,'No Note'),(7,'chhavi',9876523456,0,'chhavi@mail.com',0,'No Note'),(8,'rajiv',98765,0,'rajiv@st.com',0,'No Note');
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submenu_items`
--

DROP TABLE IF EXISTS `submenu_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `submenu_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL,
  `href_link` varchar(1024) NOT NULL,
  `parent_menu_item_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submenu_items`
--

LOCK TABLES `submenu_items` WRITE;
/*!40000 ALTER TABLE `submenu_items` DISABLE KEYS */;
INSERT INTO `submenu_items` VALUES (1,'URN Lead','leads.php',1),(2,'Create Lead','temp_leads.php',1),(23,'Chat List','chat_list.php',6),(5,'Calls','callback_list.php',22),(6,'Menu Items','menu_items.php',9),(7,'Commission','commission_history.php',7),(8,'Site Info','site_settings.php',8),(9,'Options','portal_settings.php',8),(10,'Courses','view_course.php',3),(11,'Universities','university_list.php',3),(12,'Lead Source','lead_source_report.php',5),(13,'Agent','agent_report.php',5),(14,'Sales Person','sales_person_report.php',5),(15,'Application Point','application_point_report.php',5),(16,'Students','student_report.php',5),(18,'Staff','staff_list.php',4),(19,'Agent','agent_list.php',4),(20,'Sales Person','sales_person_list.php',4),(21,'Application Point','application_point_list.php',4),(22,'Submenu Items','submenu_items.php',9),(24,'Menu List','menu_list.php',9),(25,'Profile','myaccount.php',14),(26,'Chat List','chat_list.php',15),(27,'Wallet','mywallet.php',14),(28,'Create Lead','temp_leads.php',12),(29,'URN Lead','leads.php',12),(30,'Calls','callback_list.php',12),(31,'Chat List','chat_list.php',18),(32,'Course Finder','course_finder.php',16),(33,'University Finder','university_finder.php',16),(34,'Profile','myaccount.php',17),(35,'Settings','myaccount.php?tab=settings',17),(36,'Wishlist','mywishlist.php',17),(37,'Application','myurn_list.php',17),(39,'University Performance','university_performance_report.php',5),(40,'University Performance','university_performance_report.php',20),(41,'Email Alert','email_alerts_settings.php',21),(42,'Emails','email_history.php',22);
/*!40000 ALTER TABLE `submenu_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `temp_leads`
--

DROP TABLE IF EXISTS `temp_leads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `temp_leads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `mobile` bigint(20) NOT NULL,
  `email` varchar(255) NOT NULL,
  `datentime` int(11) NOT NULL,
  `creator_id` int(11) NOT NULL,
  `creator_type` int(11) NOT NULL,
  `source_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `remark` varchar(1048) NOT NULL,
  `hidden` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temp_leads`
--

LOCK TABLES `temp_leads` WRITE;
/*!40000 ALTER TABLE `temp_leads` DISABLE KEYS */;
INSERT INTO `temp_leads` VALUES (1,'sakshi',5678912345,'sakshi@mail.com',1723012512,2,1,3,1,'URN Created',1),(2,'suresh',2345678905,'suresh@mail.com',1723096890,2,1,5,1,'URN Created',1),(3,'Rajesh',9875634217,'rajesh@mail.com',1723450375,2,1,6,1,'URN Created',1),(4,'manoj',9988752345,'manoj@mail.com',1723451477,2,1,5,1,'URN Created',1);
/*!40000 ALTER TABLE `temp_leads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `university_list`
--

DROP TABLE IF EXISTS `university_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `university_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `region` varchar(255) NOT NULL,
  `country_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `university_list`
--

LOCK TABLES `university_list` WRITE;
/*!40000 ALTER TABLE `university_list` DISABLE KEYS */;
INSERT INTO `university_list` VALUES (1,'Anglia Ruskin University','London 1',2),(2,'City University of London','London',2),(3,'De Montfort University','London',2),(4,'Edinburgh Napier University','London',2),(5,'Kings College London','London',2),(6,'London Metropolitan University','London',2),(7,'Nottingham Trent University','London',2),(8,'University College Birmingham','London',2),(9,'Leeds Beckett University','London',2),(10,'University of Greenwich','London',2),(26,'Karnataka University','Bangalore',1),(25,'Bangalore University','Bangalore',1),(27,'Oxford university','Oxford',2);
/*!40000 ALTER TABLE `university_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `urn_audit_history`
--

DROP TABLE IF EXISTS `urn_audit_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `urn_audit_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lead_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL,
  `student_name` varchar(255) NOT NULL,
  `student_dob` int(11) NOT NULL,
  `student_mobile` bigint(20) NOT NULL,
  `student_mobile_alt` bigint(20) NOT NULL,
  `student_email` varchar(255) NOT NULL,
  `student_address` varchar(1024) NOT NULL,
  `student_brief_note` varchar(255) NOT NULL,
  `highest_education_type` int(11) NOT NULL,
  `highest_education_name` varchar(1024) NOT NULL,
  `highest_education_from_year` int(11) NOT NULL,
  `highest_education_to_year` int(11) NOT NULL,
  `highest_education_institution` varchar(1024) NOT NULL,
  `highest_education_institution_city` varchar(255) NOT NULL,
  `highest_education_institution_country` varchar(255) NOT NULL,
  `test_taken_flag` int(11) NOT NULL,
  `test_name` varchar(255) NOT NULL,
  `other_test_name` varchar(255) NOT NULL,
  `passport_number` int(11) NOT NULL,
  `passport_place_of_issue` varchar(255) NOT NULL,
  `passport_issued_on` int(11) NOT NULL,
  `passport_valid_till` int(11) NOT NULL,
  `passport_holder_name` varchar(255) NOT NULL,
  `passport_holder_surname` varchar(255) NOT NULL,
  `immigration_applied` int(11) NOT NULL,
  `immigration_detail` varchar(255) NOT NULL,
  `past_visa_refusal_status` int(11) NOT NULL,
  `past_visa_refusal_detail` varchar(255) NOT NULL,
  `serious_medical_status` int(11) NOT NULL,
  `medical_condition_detail` varchar(255) NOT NULL,
  `criminal_offence_status` int(11) NOT NULL,
  `criminal_offence_detail` varchar(255) NOT NULL,
  `updation_remark` varchar(255) NOT NULL,
  `datentime` int(11) NOT NULL,
  `updated_columns` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=143 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `urn_audit_history`
--

LOCK TABLES `urn_audit_history` WRITE;
/*!40000 ALTER TABLE `urn_audit_history` DISABLE KEYS */;
INSERT INTO `urn_audit_history` VALUES (1,1,5,1,'sakshi',0,5678912345,0,'sakshi@mail.com','','No Note',0,'',0,0,'','','',0,'','',0,'',0,0,'','',0,'',0,'',0,'',0,'','Created By Admin',1723012729,''),(2,1,5,1,'sakshi',0,5678912345,0,'sakshi@mail.com','','No Note',0,'',0,0,'','','',0,'','',0,'',0,0,'','',0,'',0,'',0,'',0,'','Documents Uploaded By BS2',1723012816,''),(3,1,5,1,'sakshi',0,5678912345,0,'sakshi@mail.com','','No Note',3,'12 cbse marksheet',2022,2023,'CBSE','Bengaluru','India',1,'GRE','',0,'',0,0,'','',0,'',0,'',0,'',0,'','waiting for results',1723013123,'highest_education_type,highest_education_name,highest_education_from_year,highest_education_to_year,highest_education_institution,highest_education_institution_city,highest_education_institution_country,test_taken_flag,test_name'),(4,1,5,1,'sakshi',0,5678912345,0,'sakshi@mail.com','','No Note',3,'12 cbse marksheet',2022,2023,'CBSE','Bengaluru','India',1,'GRE','',34567,'chennai',-19800,-19800,'Sakshi','mehta',1,'uk',1,'usa',0,'',0,'','details uploaded',1723013231,'passport_number,passport_place_of_issue,passport_holder_name,passport_holder_surname,passport_issued_on,passport_valid_till'),(5,1,5,2,'sakshi',0,5678912345,0,'sakshi@mail.com','','No Note',3,'12 cbse marksheet',2022,2023,'CBSE','Bengaluru','India',1,'GRE','',34567,'chennai',-19800,-19800,'Sakshi','mehta',1,'uk',1,'usa',0,'',0,'','Status Updated',1723013308,'status'),(6,1,5,3,'sakshi',0,5678912345,0,'sakshi@mail.com','','No Note',3,'12 cbse marksheet',2022,2023,'CBSE','Bengaluru','India',1,'GRE','',34567,'chennai',-19800,-19800,'Sakshi','mehta',1,'uk',1,'usa',0,'',0,'','Status Updated',1723013326,'status'),(7,1,5,4,'sakshi',0,5678912345,0,'sakshi@mail.com','','No Note',3,'12 cbse marksheet',2022,2023,'CBSE','Bengaluru','India',1,'GRE','',34567,'chennai',-19800,-19800,'Sakshi','mehta',1,'uk',1,'usa',0,'',0,'','Status Updated',1723013378,'status'),(8,1,5,5,'sakshi',0,5678912345,0,'sakshi@mail.com','','No Note',3,'12 cbse marksheet',2022,2023,'CBSE','Bengaluru','India',1,'GRE','',34567,'chennai',-19800,-19800,'Sakshi','mehta',1,'uk',1,'usa',0,'',0,'','Status Updated',1723013393,'status'),(9,1,5,6,'sakshi',0,5678912345,0,'sakshi@mail.com','','No Note',3,'12 cbse marksheet',2022,2023,'CBSE','Bengaluru','India',1,'GRE','',34567,'chennai',-19800,-19800,'Sakshi','mehta',1,'uk',1,'usa',0,'',0,'','Status Updated',1723013409,'status'),(10,1,5,7,'sakshi',0,5678912345,0,'sakshi@mail.com','','No Note',3,'12 cbse marksheet',2022,2023,'CBSE','Bengaluru','India',1,'GRE','',34567,'chennai',-19800,-19800,'Sakshi','mehta',1,'uk',1,'usa',0,'',0,'','Status Updated',1723013424,'status'),(11,1,5,8,'sakshi',0,5678912345,0,'sakshi@mail.com','','No Note',3,'12 cbse marksheet',2022,2023,'CBSE','Bengaluru','India',1,'GRE','',34567,'chennai',-19800,-19800,'Sakshi','mehta',1,'uk',1,'usa',0,'',0,'','Status Updated',1723013444,'status'),(12,1,5,9,'sakshi',0,5678912345,0,'sakshi@mail.com','','No Note',3,'12 cbse marksheet',2022,2023,'CBSE','Bengaluru','India',1,'GRE','',34567,'chennai',-19800,-19800,'Sakshi','mehta',1,'uk',1,'usa',0,'',0,'','Status Updated',1723013465,'status'),(13,1,5,10,'sakshi',0,5678912345,0,'sakshi@mail.com','','No Note',3,'12 cbse marksheet',2022,2023,'CBSE','Bengaluru','India',1,'GRE','',34567,'chennai',-19800,-19800,'Sakshi','mehta',1,'uk',1,'usa',0,'',0,'','Status Updated',1723013482,'status'),(14,1,5,11,'sakshi',0,5678912345,0,'sakshi@mail.com','','No Note',3,'12 cbse marksheet',2022,2023,'CBSE','Bengaluru','India',1,'GRE','',34567,'chennai',-19800,-19800,'Sakshi','mehta',1,'uk',1,'usa',0,'',0,'','Status Updated',1723013503,'status'),(15,2,21,1,'suresh',0,2345678905,0,'suresh@mail.com','','No Note',0,'',0,0,'','','',0,'','',0,'',0,0,'','',0,'',0,'',0,'',0,'','Created By Admin',1723096918,''),(16,2,21,1,'suresh',0,2345678905,0,'suresh@mail.com','','No Note',0,'',0,0,'','','',0,'','',0,'',0,0,'','',0,'',0,'',0,'',0,'','Documents Uploaded By BS2',1723097034,''),(17,2,21,1,'suresh',0,2345678905,0,'suresh@mail.com','','No Note',2,'bsc journalism',2020,2023,'Delhi university','Delhi','India',1,'PTE','',0,'',0,0,'','',0,'',0,'',0,'',0,'','test',1723097174,'highest_education_type,highest_education_name,highest_education_from_year,highest_education_to_year,highest_education_institution,highest_education_institution_city,highest_education_institution_country,test_taken_flag,test_name'),(18,2,21,1,'suresh',0,2345678905,0,'suresh@mail.com','','No Note',2,'bsc journalism',2020,2023,'Delhi university','Delhi','India',1,'PTE','',56789,'Delhi',-19800,-19800,'Suresh','Kumar',1,'Uk',0,'',0,'',0,'','test',1723097239,'passport_number,passport_place_of_issue,passport_holder_name,passport_holder_surname,passport_issued_on,passport_valid_till'),(19,2,21,2,'suresh',0,2345678905,0,'suresh@mail.com','','No Note',2,'bsc journalism',2020,2023,'Delhi university','Delhi','India',1,'PTE','',56789,'Delhi',-19800,-19800,'Suresh','Kumar',1,'Uk',0,'',0,'',0,'','Status Updated',1723097385,'status'),(20,2,21,3,'suresh',0,2345678905,0,'suresh@mail.com','','No Note',2,'bsc journalism',2020,2023,'Delhi university','Delhi','India',1,'PTE','',56789,'Delhi',-19800,-19800,'Suresh','Kumar',1,'Uk',0,'',0,'',0,'','Status Updated',1723097456,'status'),(21,2,21,4,'suresh',0,2345678905,0,'suresh@mail.com','','No Note',2,'bsc journalism',2020,2023,'Delhi university','Delhi','India',1,'PTE','',56789,'Delhi',-19800,-19800,'Suresh','Kumar',1,'Uk',0,'',0,'',0,'','Status Updated',1723097476,'status'),(22,2,21,5,'suresh',0,2345678905,0,'suresh@mail.com','','No Note',2,'bsc journalism',2020,2023,'Delhi university','Delhi','India',1,'PTE','',56789,'Delhi',-19800,-19800,'Suresh','Kumar',1,'Uk',0,'',0,'',0,'','Status Updated',1723097495,'status'),(23,2,21,6,'suresh',0,2345678905,0,'suresh@mail.com','','No Note',2,'bsc journalism',2020,2023,'Delhi university','Delhi','India',1,'PTE','',56789,'Delhi',-19800,-19800,'Suresh','Kumar',1,'Uk',0,'',0,'',0,'','Status Updated',1723097515,'status'),(24,2,21,7,'suresh',0,2345678905,0,'suresh@mail.com','','No Note',2,'bsc journalism',2020,2023,'Delhi university','Delhi','India',1,'PTE','',56789,'Delhi',-19800,-19800,'Suresh','Kumar',1,'Uk',0,'',0,'',0,'','Status Updated',1723097531,'status'),(25,2,21,8,'suresh',0,2345678905,0,'suresh@mail.com','','No Note',2,'bsc journalism',2020,2023,'Delhi university','Delhi','India',1,'PTE','',56789,'Delhi',-19800,-19800,'Suresh','Kumar',1,'Uk',0,'',0,'',0,'','Status Updated',1723097546,'status'),(26,2,21,9,'suresh',0,2345678905,0,'suresh@mail.com','','No Note',2,'bsc journalism',2020,2023,'Delhi university','Delhi','India',1,'PTE','',56789,'Delhi',-19800,-19800,'Suresh','Kumar',1,'Uk',0,'',0,'',0,'','Status Updated',1723097562,'status'),(27,2,21,10,'suresh',0,2345678905,0,'suresh@mail.com','','No Note',2,'bsc journalism',2020,2023,'Delhi university','Delhi','India',1,'PTE','',56789,'Delhi',-19800,-19800,'Suresh','Kumar',1,'Uk',0,'',0,'',0,'','Status Updated',1723097580,'status'),(28,2,21,11,'suresh',0,2345678905,0,'suresh@mail.com','','No Note',2,'bsc journalism',2020,2023,'Delhi university','Delhi','India',1,'PTE','',56789,'Delhi',-19800,-19800,'Suresh','Kumar',1,'Uk',0,'',0,'',0,'','Status Updated',1723097600,'status'),(29,3,1,1,'Arpita',0,123456,0,'arpita@st.com','','No Note',0,'',0,0,'','','',0,'','',0,'',0,0,'','',0,'',0,'',0,'',0,'','Created By Portal Visitor',1723291238,''),(30,3,1,1,'Arpita',0,123456,0,'arpita@st.com','','No Note',0,'',0,0,'','','',0,'','',0,'',0,0,'','',0,'',0,'',0,'',0,'','Documents Uploaded by Portal Visitor',1723291828,''),(31,3,1,1,'Arpita',0,123456,0,'arpita@st.com','','No Note',0,'',0,0,'','','',0,'','',56789,'chennai',1481481000,1607711400,'Arpita','Desai',1,'uk',0,'',0,'',0,'','testing',1723449585,'passport_number,passport_place_of_issue,passport_holder_name,passport_holder_surname,passport_issued_on,passport_valid_till'),(32,3,112,1,'Arpita',0,123456,0,'arpita@st.com','','No Note',0,'',0,0,'','','',0,'','',56789,'chennai',1481481000,1607711400,'Arpita','Desai',1,'uk',0,'',0,'',0,'','course selection updated',1723449718,'course'),(33,3,112,1,'Arpita',-19800,123456,0,'arpita@st.com','Bagalur cross','No Note',0,'',0,0,'','','',0,'','',56789,'chennai',1481481000,1607711400,'Arpita','Desai',1,'uk',0,'',0,'',0,'','address updated',1723449765,'student_address'),(34,3,112,1,'Arpita',-19800,123456,0,'arpita@st.com','Bagalur cross','No Note',0,'',0,0,'','','',0,'','',56789,'chennai',1481481000,1607711400,'Arpita','Desai',1,'uk',0,'',0,'',0,'','test',1723450077,''),(35,3,116,1,'Arpita',-19800,123456,0,'arpita@st.com','Bagalur cross','No Note',0,'',0,0,'','','',0,'','',56789,'chennai',1481481000,1607711400,'Arpita','Desai',1,'uk',0,'',0,'',0,'','course selection updated',1723450269,'course'),(36,3,1,1,'Arpita',-19800,123456,0,'arpita@st.com','Bagalur cross','No Note',0,'',0,0,'','','',0,'','',56789,'chennai',1481481000,1607711400,'Arpita','Desai',1,'uk',0,'',0,'',0,'','course selection updated',1723450285,'course'),(37,4,113,1,'Rajesh',0,9875634217,0,'rajesh@mail.com','','No Note',0,'',0,0,'','','',0,'','',0,'',0,0,'','',0,'',0,'',0,'',0,'','Created By Admin',1723450407,''),(38,4,113,1,'Rajesh',0,9875634217,0,'rajesh@mail.com','','No Note',0,'',0,0,'','','',0,'','',0,'',0,0,'','',0,'',0,'',0,'',0,'','Documents Uploaded By BS2',1723450441,''),(39,4,113,1,'Rajesh',0,9875634217,0,'rajesh@mail.com','','No Note',2,'12 cbse marksheet',2021,2008,'CBSE','Chennai','India',1,'GMAT','',0,'',0,0,'','',0,'',0,'',0,'',0,'','test',1723450535,'highest_education_type,highest_education_name,highest_education_from_year,highest_education_to_year,highest_education_institution,highest_education_institution_city,highest_education_institution_country,test_taken_flag,test_name'),(40,4,115,1,'Rajesh',0,9875634217,0,'rajesh@mail.com','','No Note',2,'12 cbse marksheet',2021,2008,'CBSE','Chennai','India',1,'GMAT','',0,'',0,0,'','',0,'',0,'',0,'',0,'','course selection updated',1723450628,'course'),(41,3,3,1,'Arpita',-19800,123456,0,'arpita@st.com','Bagalur cross','No Note',0,'',0,0,'','','',0,'','',56789,'chennai',1481481000,1607711400,'Arpita','Desai',1,'uk',0,'',0,'',0,'','course selection updated',1723451396,'course'),(42,5,117,1,'manoj',0,9988752345,0,'manoj@mail.com','','No Note',0,'',0,0,'','','',0,'','',0,'',0,0,'','',0,'',0,'',0,'',0,'','Created By Admin',1723451503,''),(43,5,8,1,'manoj',0,9988752345,0,'manoj@mail.com','','No Note',0,'',0,0,'','','',0,'','',0,'',0,0,'','',0,'',0,'',0,'',0,'','course selection updated',1723451519,'course'),(44,3,3,1,'Arpita',315513000,123456,12345,'arpita@st.com','Bagalur cross','No Note',0,'',0,0,'','','',0,'','',56789,'chennai',1481481000,1607711400,'Arpita','Desai',1,'uk',0,'',0,'',0,'','Alt Mobile & DOB Updated',1723528306,'student_dob,student_mobile_alt'),(45,4,115,1,'Rajesh',315513000,9875634217,12345,'rajesh@mail.com','Hebbal','No Note',2,'12 cbse marksheet',2021,2008,'CBSE','Chennai','India',1,'GMAT','',0,'',0,0,'','',0,'',0,'',0,'',0,'','DOB Updated',1723528522,'student_dob,student_mobile_alt,student_address'),(46,3,17,1,'Arpita',315513000,123456,12345,'arpita@st.com','Bagalur cross','No Note',0,'',0,0,'','','',0,'','',56789,'chennai',1481481000,1607711400,'Arpita','Desai',1,'uk',0,'',0,'',0,'','course selection updated',1723530210,'course'),(47,3,14,1,'Arpita',315513000,123456,12345,'arpita@st.com','Bagalur cross','No Note',0,'',0,0,'','','',0,'','',56789,'chennai',1481481000,1607711400,'Arpita','Desai',1,'uk',0,'',0,'',0,'','course selection updated',1723530268,'course'),(48,3,14,1,'Arpita',315513000,123456,12345,'arpita@st.com','Bagalur cross','No Note',0,'',0,0,'','','',0,'','',56789,'chennai',1481481000,1607711400,'Arpita','Desai',1,'uk',0,'',0,'',0,'','sales agent reallocated',1723530306,''),(49,3,14,1,'Arpita',315513000,123456,12345,'arpita@st.com','Bagalur cross','No Note',0,'',0,0,'','','',0,'','',56789,'chennai',1481481000,1607711400,'Arpita','Desai',1,'uk',0,'',0,'',0,'','Documents Uploaded By BS2',1723530341,''),(50,3,14,1,'Arpita',315513000,123456,12345,'arpita@st.com','Bagalur cross','No Note',2,'12 cbse marksheet',2010,2014,'nagarjuna','Bengaluru','India',1,'TOEFL','',56789,'chennai',1481481000,1607711400,'Arpita','Desai',1,'uk',0,'',0,'',0,'','updated',1723530589,'highest_education_type,highest_education_name,highest_education_from_year,highest_education_to_year,highest_education_institution,highest_education_institution_city,highest_education_institution_country,test_taken_flag,test_name'),(51,3,14,2,'Arpita',315513000,123456,12345,'arpita@st.com','Bagalur cross','No Note',2,'12 cbse marksheet',2010,2014,'nagarjuna','Bengaluru','India',1,'TOEFL','',56789,'chennai',1481481000,1607711400,'Arpita','Desai',1,'uk',0,'',0,'',0,'','Status Updated',1723530644,'status'),(52,3,14,3,'Arpita',315513000,123456,12345,'arpita@st.com','Bagalur cross','No Note',2,'12 cbse marksheet',2010,2014,'nagarjuna','Bengaluru','India',1,'TOEFL','',56789,'chennai',1481481000,1607711400,'Arpita','Desai',1,'uk',0,'',0,'',0,'','Status Updated',1723530667,'status'),(53,3,14,4,'Arpita',315513000,123456,12345,'arpita@st.com','Bagalur cross','No Note',2,'12 cbse marksheet',2010,2014,'nagarjuna','Bengaluru','India',1,'TOEFL','',56789,'chennai',1481481000,1607711400,'Arpita','Desai',1,'uk',0,'',0,'',0,'','Status Updated',1723530939,'status'),(54,3,14,5,'Arpita',315513000,123456,12345,'arpita@st.com','Bagalur cross','No Note',2,'12 cbse marksheet',2010,2014,'nagarjuna','Bengaluru','India',1,'TOEFL','',56789,'chennai',1481481000,1607711400,'Arpita','Desai',1,'uk',0,'',0,'',0,'','Status Updated',1723530962,'status'),(55,3,14,6,'Arpita',315513000,123456,12345,'arpita@st.com','Bagalur cross','No Note',2,'12 cbse marksheet',2010,2014,'nagarjuna','Bengaluru','India',1,'TOEFL','',56789,'chennai',1481481000,1607711400,'Arpita','Desai',1,'uk',0,'',0,'',0,'','Status Updated',1723530982,'status'),(56,3,14,7,'Arpita',315513000,123456,12345,'arpita@st.com','Bagalur cross','No Note',2,'12 cbse marksheet',2010,2014,'nagarjuna','Bengaluru','India',1,'TOEFL','',56789,'chennai',1481481000,1607711400,'Arpita','Desai',1,'uk',0,'',0,'',0,'','Status Updated',1723531021,'status'),(57,3,14,7,'Arpita',315513000,123456,12345,'arpita@st.com','Bagalur cross','No Note',2,'12 cbse marksheet',2010,2014,'nagarjuna','Bengaluru','India',1,'TOEFL','',56789,'chennai',1481481000,1607711400,'Arpita','Desai',1,'uk',0,'',0,'',0,'','Status Updated',1723531022,'status'),(58,3,14,8,'Arpita',315513000,123456,12345,'arpita@st.com','Bagalur cross','No Note',2,'12 cbse marksheet',2010,2014,'nagarjuna','Bengaluru','India',1,'TOEFL','',56789,'chennai',1481481000,1607711400,'Arpita','Desai',1,'uk',0,'',0,'',0,'','Status Updated',1723531852,'status'),(59,3,14,9,'Arpita',315513000,123456,12345,'arpita@st.com','Bagalur cross','No Note',2,'12 cbse marksheet',2010,2014,'nagarjuna','Bengaluru','India',1,'TOEFL','',56789,'chennai',1481481000,1607711400,'Arpita','Desai',1,'uk',0,'',0,'',0,'','Status Updated',1723531902,'status'),(60,3,14,10,'Arpita',315513000,123456,12345,'arpita@st.com','Bagalur cross','No Note',2,'12 cbse marksheet',2010,2014,'nagarjuna','Bengaluru','India',1,'TOEFL','',56789,'chennai',1481481000,1607711400,'Arpita','Desai',1,'uk',0,'',0,'',0,'','Status Updated',1723531965,'status'),(61,3,14,11,'Arpita',315513000,123456,12345,'arpita@st.com','Bagalur cross','No Note',2,'12 cbse marksheet',2010,2014,'nagarjuna','Bengaluru','India',1,'TOEFL','',56789,'chennai',1481481000,1607711400,'Arpita','Desai',1,'uk',0,'',0,'',0,'','Status Updated',1723532822,'status'),(62,5,10,1,'manoj',0,9988752345,0,'manoj@mail.com','','No Note',0,'',0,0,'','','',0,'','',0,'',0,0,'','',0,'',0,'',0,'',0,'','course selection updated',1723533453,'course'),(63,5,10,2,'manoj',0,9988752345,0,'manoj@mail.com','','No Note',0,'',0,0,'','','',0,'','',0,'',0,0,'','',0,'',0,'',0,'',0,'','Status Updated',1723533506,'status'),(64,5,10,3,'manoj',0,9988752345,0,'manoj@mail.com','','No Note',0,'',0,0,'','','',0,'','',0,'',0,0,'','',0,'',0,'',0,'',0,'','Status Updated',1723533650,'status'),(65,5,10,3,'manoj',-19800,9988752345,0,'manoj@mail.com','mg road','No Note',0,'',0,0,'','','',0,'','',0,'',0,0,'','',0,'',0,'',0,'',0,'','address updated',1723533738,'student_address'),(66,5,10,4,'manoj',-19800,9988752345,0,'manoj@mail.com','mg road','No Note',0,'',0,0,'','','',0,'','',0,'',0,0,'','',0,'',0,'',0,'',0,'','Status Updated',1723533766,'status'),(67,5,10,5,'manoj',-19800,9988752345,0,'manoj@mail.com','mg road','No Note',0,'',0,0,'','','',0,'','',0,'',0,0,'','',0,'',0,'',0,'',0,'','Status Updated',1723533796,'status'),(68,5,10,6,'manoj',-19800,9988752345,0,'manoj@mail.com','mg road','No Note',0,'',0,0,'','','',0,'','',0,'',0,0,'','',0,'',0,'',0,'',0,'','Status Updated',1723533949,'status'),(69,5,10,7,'manoj',-19800,9988752345,0,'manoj@mail.com','mg road','No Note',0,'',0,0,'','','',0,'','',0,'',0,0,'','',0,'',0,'',0,'',0,'','Status Updated',1723533965,'status'),(70,5,10,8,'manoj',-19800,9988752345,0,'manoj@mail.com','mg road','No Note',0,'',0,0,'','','',0,'','',0,'',0,0,'','',0,'',0,'',0,'',0,'','Status Updated',1723533985,'status'),(71,5,10,9,'manoj',-19800,9988752345,0,'manoj@mail.com','mg road','No Note',0,'',0,0,'','','',0,'','',0,'',0,0,'','',0,'',0,'',0,'',0,'','Status Updated',1723534360,'status'),(72,5,10,10,'manoj',-19800,9988752345,0,'manoj@mail.com','mg road','No Note',0,'',0,0,'','','',0,'','',0,'',0,0,'','',0,'',0,'',0,'',0,'','Status Updated',1723534417,'status'),(73,5,10,11,'manoj',-19800,9988752345,0,'manoj@mail.com','mg road','No Note',0,'',0,0,'','','',0,'','',0,'',0,0,'','',0,'',0,'',0,'',0,'','Status Updated',1723620626,'status'),(74,4,115,2,'Rajesh',315513000,9875634217,12345,'rajesh@mail.com','Hebbal','No Note',2,'12 cbse marksheet',2021,2008,'CBSE','Chennai','India',1,'GMAT','',0,'',0,0,'','',0,'',0,'',0,'',0,'','Status Updated',1723620867,'status'),(75,4,115,3,'Rajesh',315513000,9875634217,12345,'rajesh@mail.com','Hebbal','No Note',2,'12 cbse marksheet',2021,2008,'CBSE','Chennai','India',1,'GMAT','',0,'',0,0,'','',0,'',0,'',0,'',0,'','Status Updated',1723621017,'status'),(76,4,115,3,'Rajesh',631132200,9875634217,12345,'rajesh@mail.com','Hebbal','No Note',2,'12 cbse marksheet',2021,2008,'CBSE','Chennai','India',1,'GMAT','',0,'',0,0,'','',0,'',0,'',0,'',0,'','DOB Updated',1723621155,'student_dob'),(77,4,115,3,'Rajesh',315513000,9875634217,12345,'rajesh@mail.com','Hebbal','No Note',2,'12 cbse marksheet',2021,2008,'CBSE','Chennai','India',1,'GMAT','',0,'',0,0,'','',0,'',0,'',0,'',0,'','DOB Updated',1723621381,'student_dob'),(78,4,115,3,'Rajesh',315513000,9875634217,12345,'rajesh@mail.com','Hebbal','No Note',2,'12 cbse marksheet',2021,2008,'CBSE','Chennai','India',1,'GMAT','',0,'',0,0,'','',0,'',0,'',0,'',0,'','Documents Uploaded By BS2',1723621472,''),(79,6,13,1,'Reeth ',0,2345667986,0,'reeth@mail.com','','No Note',0,'',0,0,'','','',0,'','',0,'',0,0,'','',0,'',0,'',0,'',0,'','Created By Portal Visitor',1723795638,''),(80,6,13,1,'Reeth ',0,2345667986,0,'reeth@mail.com','','No Note',0,'',0,0,'','','',0,'','',0,'',0,0,'','',0,'',0,'',0,'',0,'','Documents Uploaded by Portal Visitor',1723795734,''),(81,7,10,1,'chhavi',0,9876523456,0,'chhavi@mail.com','','No Note',0,'',0,0,'','','',0,'','',0,'',0,0,'','',0,'',0,'',0,'',0,'','Created By Portal Visitor',1723795851,''),(82,7,10,1,'chhavi',0,9876523456,0,'chhavi@mail.com','','No Note',0,'',0,0,'','','',0,'','',0,'',0,0,'','',0,'',0,'',0,'',0,'','Documents Uploaded by Portal Visitor',1723795901,''),(83,7,10,2,'chhavi',0,9876523456,0,'chhavi@mail.com','','No Note',0,'',0,0,'','','',0,'','',0,'',0,0,'','',0,'',0,'',0,'',0,'','Status Updated',1723796078,'status'),(84,7,10,2,'chhavi',0,9876523456,0,'chhavi@mail.com','','No Note',0,'',0,0,'','','',0,'','',0,'',0,0,'','',0,'',0,'',0,'',0,'','Status Updated',1723796090,'status'),(85,7,10,2,'chhavi',0,9876523456,0,'chhavi@mail.com','','No Note',0,'',0,0,'','','',0,'','',0,'',0,0,'','',0,'',0,'',0,'',0,'','Status Updated',1723796102,'status'),(86,7,10,2,'chhavi',0,9876523456,0,'chhavi@mail.com','','No Note',0,'',0,0,'','','',0,'','',0,'',0,0,'','',0,'',0,'',0,'',0,'','Status Updated',1723796114,'status'),(87,7,10,2,'chhavi',0,9876523456,0,'chhavi@mail.com','','No Note',0,'',0,0,'','','',0,'','',0,'',0,0,'','',0,'',0,'',0,'',0,'','Status Updated',1723796125,'status'),(88,7,10,2,'chhavi',0,9876523456,0,'chhavi@mail.com','','No Note',2,'BAarchitecture',2020,2023,'Delhi university','Delhi','India',1,'GMAT','',0,'',0,0,'','',0,'',0,'',0,'',0,'','test',1723796290,'highest_education_type,highest_education_name,highest_education_from_year,highest_education_to_year,highest_education_institution,highest_education_institution_city,highest_education_institution_country,test_taken_flag,test_name'),(89,7,10,2,'chhavi',0,9876523456,0,'chhavi@mail.com','','No Note',2,'BAarchitecture',2020,2023,'Delhi university','Delhi','India',1,'GMAT','',0,'',0,0,'','',0,'',0,'',0,'',0,'','test',1723796300,'highest_education_type,highest_education_name,highest_education_from_year,highest_education_to_year,highest_education_institution,highest_education_institution_city,highest_education_institution_country,test_taken_flag,test_name'),(90,7,10,2,'chhavi',0,9876523456,0,'chhavi@mail.com','','No Note',2,'BAarchitecture',2020,2023,'Delhi university','Delhi','India',1,'GMAT','',0,'',0,0,'','',0,'',0,'',0,'',0,'','test',1723796305,'highest_education_type,highest_education_name,highest_education_from_year,highest_education_to_year,highest_education_institution,highest_education_institution_city,highest_education_institution_country,test_taken_flag,test_name'),(91,7,10,2,'chhavi',0,9876523456,0,'chhavi@mail.com','','No Note',2,'BAarchitecture',2020,2023,'Delhi university','Delhi','India',1,'GMAT','',0,'',0,0,'','',0,'',0,'',0,'',0,'','test',1723796311,'highest_education_type,highest_education_name,highest_education_from_year,highest_education_to_year,highest_education_institution,highest_education_institution_city,highest_education_institution_country,test_taken_flag,test_name'),(92,7,10,2,'chhavi',0,9876523456,0,'chhavi@mail.com','','No Note',2,'BAarchitecture',2020,2023,'Delhi university','Delhi','India',1,'GMAT','',0,'',0,0,'','',0,'',0,'',0,'',0,'','test',1723797184,'test_name'),(93,7,10,2,'chhavi',0,9876523456,0,'chhavi@mail.com','','No Note',2,'BAarchitecture',2020,2023,'Delhi university','Delhi','India',1,'GMAT','',0,'',0,0,'','',0,'',0,'',0,'',0,'','test',1723797283,'test_name'),(94,7,10,3,'chhavi',0,9876523456,0,'chhavi@mail.com','','No Note',2,'BAarchitecture',2020,2023,'Delhi university','Delhi','India',1,'GMAT','',0,'',0,0,'','',0,'',0,'',0,'',0,'','Status Updated',1723797332,'status'),(95,7,3,3,'chhavi',0,9876523456,0,'chhavi@mail.com','','No Note',2,'BAarchitecture',2020,2023,'Delhi university','Delhi','India',1,'GMAT','',0,'',0,0,'','',0,'',0,'',0,'',0,'','course selection updated',1723797383,'course'),(96,7,3,3,'chhavi',0,9876523456,0,'chhavi@mail.com','','No Note',2,'BAarchitecture',2020,2023,'Delhi university','Delhi','India',1,'GMAT','',0,'',0,0,'','',0,'',0,'',0,'',0,'','course selection updated',1723797389,'course'),(97,7,3,4,'chhavi',0,9876523456,0,'chhavi@mail.com','','No Note',2,'BAarchitecture',2020,2023,'Delhi university','Delhi','India',1,'GMAT','',0,'',0,0,'','',0,'',0,'',0,'',0,'','Status Updated',1723797411,'status'),(98,7,3,5,'chhavi',0,9876523456,0,'chhavi@mail.com','','No Note',2,'BAarchitecture',2020,2023,'Delhi university','Delhi','India',1,'GMAT','',0,'',0,0,'','',0,'',0,'',0,'',0,'','Status Updated',1723797479,'status'),(99,7,3,6,'chhavi',0,9876523456,0,'chhavi@mail.com','','No Note',2,'BAarchitecture',2020,2023,'Delhi university','Delhi','India',1,'GMAT','',0,'',0,0,'','',0,'',0,'',0,'',0,'','Status Updated',1723797606,'status'),(100,7,3,6,'chhavi',0,9876523456,0,'chhavi@mail.com','','No Note',2,'BAarchitecture',2020,2023,'Delhi university','Delhi','India',1,'GMAT','',0,'',0,0,'','',0,'',0,'',0,'',0,'','Status Updated',1723797618,'status'),(101,7,3,6,'chhavi',0,9876523456,0,'chhavi@mail.com','','No Note',2,'BAarchitecture',2020,2023,'Delhi university','Delhi','India',1,'GMAT','',0,'',0,0,'','',0,'',0,'',0,'',0,'','Status Updated',1723797629,'status'),(102,7,3,6,'chhavi',0,9876523456,0,'chhavi@mail.com','','No Note',2,'BAarchitecture',2020,2023,'Delhi university','Delhi','India',1,'GMAT','',0,'',0,0,'','',0,'',0,'',0,'',0,'','Status Updated',1723797641,'status'),(103,7,3,6,'chhavi',0,9876523456,0,'chhavi@mail.com','','No Note',2,'BAarchitecture',2020,2023,'Delhi university','Delhi','India',1,'GMAT','',0,'',0,0,'','',0,'',0,'',0,'',0,'','Status Updated',1723797652,'status'),(104,7,3,6,'chhavi',0,9876523456,0,'chhavi@mail.com','','No Note',2,'BAarchitecture',2020,2023,'Delhi university','Delhi','India',1,'GMAT','',0,'',0,0,'','',0,'',0,'',0,'',0,'','Status Updated',1723797664,'status'),(105,7,3,7,'chhavi',0,9876523456,0,'chhavi@mail.com','','No Note',2,'BAarchitecture',2020,2023,'Delhi university','Delhi','India',1,'GMAT','',0,'',0,0,'','',0,'',0,'',0,'',0,'','Status Updated',1723798925,'status'),(106,7,3,7,'chhavi',0,9876523456,0,'chhavi@mail.com','','No Note',2,'BAarchitecture',2020,2023,'Delhi university','Delhi','India',1,'GMAT','',0,'',0,0,'','',0,'',0,'',0,'',0,'','Status Updated',1723798940,'status'),(107,7,3,7,'chhavi',0,9876523456,0,'chhavi@mail.com','','No Note',2,'BAarchitecture',2020,2023,'Delhi university','Delhi','India',1,'GMAT','',0,'',0,0,'','',0,'',0,'',0,'',0,'','Status Updated',1723798952,'status'),(108,7,3,7,'chhavi',0,9876523456,0,'chhavi@mail.com','','No Note',2,'BAarchitecture',2020,2023,'Delhi university','Delhi','India',1,'GMAT','',0,'',0,0,'','',0,'',0,'',0,'',0,'','Status Updated',1723798963,'status'),(109,7,3,7,'chhavi',0,9876523456,0,'chhavi@mail.com','','No Note',2,'BAarchitecture',2020,2023,'Delhi university','Delhi','India',1,'GMAT','',0,'',0,0,'','',0,'',0,'',0,'',0,'','Status Updated',1723798974,'status'),(110,7,3,8,'chhavi',0,9876523456,0,'chhavi@mail.com','','No Note',2,'BAarchitecture',2020,2023,'Delhi university','Delhi','India',1,'GMAT','',0,'',0,0,'','',0,'',0,'',0,'',0,'','Status Updated',1723799101,'status'),(111,7,3,9,'chhavi',0,9876523456,0,'chhavi@mail.com','','No Note',2,'BAarchitecture',2020,2023,'Delhi university','Delhi','India',1,'GMAT','',0,'',0,0,'','',0,'',0,'',0,'',0,'','Status Updated',1723799138,'status'),(112,7,3,9,'chhavi',0,9876523456,0,'chhavi@mail.com','','No Note',2,'BAarchitecture',2020,2023,'Delhi university','Delhi','India',1,'GMAT','',0,'',0,0,'','',0,'',0,'',0,'',0,'','Status Updated',1723799145,'status'),(113,7,3,10,'chhavi',0,9876523456,0,'chhavi@mail.com','','No Note',2,'BAarchitecture',2020,2023,'Delhi university','Delhi','India',1,'GMAT','',0,'',0,0,'','',0,'',0,'',0,'',0,'','Status Updated',1723799210,'status'),(114,7,3,11,'chhavi',0,9876523456,0,'chhavi@mail.com','','No Note',2,'BAarchitecture',2020,2023,'Delhi university','Delhi','India',1,'GMAT','',0,'',0,0,'','',0,'',0,'',0,'',0,'','Status Updated',1723799239,'status'),(115,7,3,11,'chhavi',0,9876523456,0,'chhavi@mail.com','','No Note',2,'BAarchitecture',2020,2023,'Delhi university','Delhi','India',1,'GMAT','',0,'',0,0,'','',0,'',0,'',0,'',0,'','Status Updated',1723799252,'status'),(116,8,2,1,'rajiv',0,98765,0,'rajiv@st.com','','No Note',0,'',0,0,'','','',0,'','',0,'',0,0,'','',0,'',0,'',0,'',0,'','Created By Portal Visitor',1723800966,''),(117,8,2,1,'rajiv',0,98765,0,'rajiv@st.com','','No Note',0,'',0,0,'','','',0,'','',0,'',0,0,'','',0,'',0,'',0,'',0,'','Documents Uploaded by Portal Visitor',1723800989,''),(118,8,2,1,'rajiv',0,98765,0,'rajiv@st.com','','No Note',0,'',0,0,'','','',0,'','',1223,'chennai',1724005800,1787077800,'Rajiv','kumar',1,'uk',0,'',0,'',0,'','details uploaded',1724049304,'passport_number,passport_place_of_issue,passport_holder_name,passport_holder_surname,passport_issued_on,passport_valid_till'),(119,8,2,1,'rajiv',0,98765,0,'rajiv@st.com','','No Note',0,'',0,0,'','','',0,'','',1223,'chennai',1724005800,1787077800,'Rajiv','kumar',1,'uk',0,'',0,'',0,'','details uploaded',1724049311,'passport_number,passport_place_of_issue,passport_holder_name,passport_holder_surname,passport_issued_on,passport_valid_till'),(120,8,2,1,'rajiv',0,98765,0,'rajiv@st.com','','No Note',0,'',0,0,'','','',0,'','',1223,'chennai',1724005800,1787077800,'Rajiv','kumar',1,'uk',0,'',0,'',0,'','details uploaded',1724049318,'passport_number,passport_place_of_issue,passport_holder_name,passport_holder_surname,passport_issued_on,passport_valid_till'),(121,8,2,1,'rajiv',0,98765,0,'rajiv@st.com','','No Note',0,'',0,0,'','','',0,'','',1223,'chennai',1724005800,1787077800,'Rajiv','kumar',1,'uk',0,'',0,'',0,'','Documents Uploaded By BS8',1724137016,''),(122,8,2,1,'rajiv',0,98765,0,'rajiv@st.com','','No Note',3,'bsc',2021,2023,'bangalore university','bangalore','India',1,'TOEFL','',1223,'chennai',1724005800,1787077800,'Rajiv','kumar',1,'uk',0,'',0,'',0,'','details uploaded',1724137426,'highest_education_type,highest_education_name,highest_education_from_year,highest_education_to_year,highest_education_institution,highest_education_institution_city,highest_education_institution_country,test_taken_flag,test_name'),(123,8,2,1,'rajiv',0,98765,0,'rajiv@st.com','','No Note',3,'bsc',2021,2023,'bangalore university','bangalore','India',1,'TOEFL','',1223,'chennai',1724005800,1787077800,'Rajiv','kumar',1,'uk',0,'',0,'',0,'','details uploaded',1724137432,'highest_education_type,highest_education_name,highest_education_from_year,highest_education_to_year,highest_education_institution,highest_education_institution_city,highest_education_institution_country,test_taken_flag,test_name'),(124,8,2,2,'rajiv',0,98765,0,'rajiv@st.com','','No Note',3,'bsc',2021,2023,'bangalore university','bangalore','India',1,'TOEFL','',1223,'chennai',1724005800,1787077800,'Rajiv','kumar',1,'uk',0,'',0,'',0,'','Status Updated',1724137608,'status'),(125,8,2,3,'rajiv',0,98765,0,'rajiv@st.com','','No Note',3,'bsc',2021,2023,'bangalore university','bangalore','India',1,'TOEFL','',1223,'chennai',1724005800,1787077800,'Rajiv','kumar',1,'uk',0,'',0,'',0,'','Status Updated',1724137873,'status'),(126,8,2,4,'rajiv',0,98765,0,'rajiv@st.com','','No Note',3,'bsc',2021,2023,'bangalore university','bangalore','India',1,'TOEFL','',1223,'chennai',1724005800,1787077800,'Rajiv','kumar',1,'uk',0,'',0,'',0,'','Status Updated',1724138043,'status'),(127,8,2,5,'rajiv',0,98765,0,'rajiv@st.com','','No Note',3,'bsc',2021,2023,'bangalore university','bangalore','India',1,'TOEFL','',1223,'chennai',1724005800,1787077800,'Rajiv','kumar',1,'uk',0,'',0,'',0,'','Status Updated',1724138069,'status'),(128,8,2,6,'rajiv',0,98765,0,'rajiv@st.com','','No Note',3,'bsc',2021,2023,'bangalore university','bangalore','India',1,'TOEFL','',1223,'chennai',1724005800,1787077800,'Rajiv','kumar',1,'uk',0,'',0,'',0,'','Status Updated',1724138096,'status'),(129,8,2,7,'rajiv',0,98765,0,'rajiv@st.com','','No Note',3,'bsc',2021,2023,'bangalore university','bangalore','India',1,'TOEFL','',1223,'chennai',1724005800,1787077800,'Rajiv','kumar',1,'uk',0,'',0,'',0,'','Status Updated',1724138152,'status'),(130,8,2,8,'rajiv',0,98765,0,'rajiv@st.com','','No Note',3,'bsc',2021,2023,'bangalore university','bangalore','India',1,'TOEFL','',1223,'chennai',1724005800,1787077800,'Rajiv','kumar',1,'uk',0,'',0,'',0,'','Status Updated',1724138187,'status'),(131,8,2,8,'rajiv',0,98765,0,'rajiv@st.com','','No Note',3,'bsc',2021,2023,'bangalore university','bangalore','India',1,'TOEFL','',1223,'chennai',1724005800,1787077800,'Rajiv','kumar',1,'uk',0,'',0,'',0,'','Status Updated',1724138193,'status'),(132,8,2,9,'rajiv',0,98765,0,'rajiv@st.com','','No Note',3,'bsc',2021,2023,'bangalore university','bangalore','India',1,'TOEFL','',1223,'chennai',1724005800,1787077800,'Rajiv','kumar',1,'uk',0,'',0,'',0,'','Status Updated',1724138236,'status'),(133,8,2,10,'rajiv',0,98765,0,'rajiv@st.com','','No Note',3,'bsc',2021,2023,'bangalore university','bangalore','India',1,'TOEFL','',1223,'chennai',1724005800,1787077800,'Rajiv','kumar',1,'uk',0,'',0,'',0,'','Status Updated',1724138267,'status'),(134,8,2,11,'rajiv',0,98765,0,'rajiv@st.com','','No Note',3,'bsc',2021,2023,'bangalore university','bangalore','India',1,'TOEFL','',1223,'chennai',1724005800,1787077800,'Rajiv','kumar',1,'uk',0,'',0,'',0,'','Status Updated',1724138486,'status'),(135,6,13,1,'Reeth ',0,2345667986,0,'reeth@mail.com','','No Note',0,'',0,0,'','','',0,'','',0,'',0,0,'','',0,'',0,'',0,'',0,'','Documents Uploaded By BS8',1724222579,''),(136,6,13,1,'Reeth ',0,2345667986,0,'reeth@mail.com','','No Note',3,'matric',2021,2024,'bangalore university','bangalore','india',1,'PTE','',0,'',0,0,'','',0,'',0,'',0,'',0,'','test',1724222980,'highest_education_type,highest_education_name,highest_education_from_year,highest_education_to_year,highest_education_institution,highest_education_institution_city,highest_education_institution_country,test_taken_flag,test_name'),(137,4,112,3,'Rajesh',315513000,9875634217,12345,'rajesh@mail.com','Hebbal','No Note',2,'12 cbse marksheet',2021,2008,'CBSE','Chennai','India',1,'GMAT','',0,'',0,0,'','',0,'',0,'',0,'',0,'','course selection updated',1724307242,'course'),(138,4,112,4,'Rajesh',315513000,9875634217,12345,'rajesh@mail.com','Hebbal','No Note',2,'12 cbse marksheet',2021,2008,'CBSE','Chennai','India',1,'GMAT','',0,'',0,0,'','',0,'',0,'',0,'',0,'','Status Updated',1724309713,'status'),(139,4,112,5,'Rajesh',315513000,9875634217,12345,'rajesh@mail.com','Hebbal','No Note',2,'12 cbse marksheet',2021,2008,'CBSE','Chennai','India',1,'GMAT','',0,'',0,0,'','',0,'',0,'',0,'',0,'','Status Updated',1724309752,'status'),(140,4,112,6,'Rajesh',315513000,9875634217,12345,'rajesh@mail.com','Hebbal','No Note',2,'12 cbse marksheet',2021,2008,'CBSE','Chennai','India',1,'GMAT','',0,'',0,0,'','',0,'',0,'',0,'',0,'','Status Updated',1724309786,'status'),(141,4,112,7,'Rajesh',315513000,9875634217,12345,'rajesh@mail.com','Hebbal','No Note',2,'12 cbse marksheet',2021,2008,'CBSE','Chennai','India',1,'GMAT','',0,'',0,0,'','',0,'',0,'',0,'',0,'','Status Updated',1724309824,'status'),(142,4,112,8,'Rajesh',315513000,9875634217,12345,'rajesh@mail.com','Hebbal','No Note',2,'12 cbse marksheet',2021,2008,'CBSE','Chennai','India',1,'GMAT','',0,'',0,0,'','',0,'',0,'',0,'',0,'','Status Updated',1724310215,'status');
/*!40000 ALTER TABLE `urn_audit_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `urn_document_upload_history`
--

DROP TABLE IF EXISTS `urn_document_upload_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `urn_document_upload_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lead_id` int(11) NOT NULL,
  `urn` int(11) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `datentime` int(11) NOT NULL,
  `upload_by` varchar(255) NOT NULL,
  `is_deleted` int(11) NOT NULL,
  `deleted_by` varchar(255) NOT NULL,
  `deletion_datentime` int(11) NOT NULL,
  `deletion_remark` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `urn_document_upload_history`
--

LOCK TABLES `urn_document_upload_history` WRITE;
/*!40000 ALTER TABLE `urn_document_upload_history` DISABLE KEYS */;
INSERT INTO `urn_document_upload_history` VALUES (1,1,975546,'student_photo_1723012816.jpg',1723012816,'BS2',0,'',0,''),(2,1,975546,'academic/highest_education_proof_1723013123.jpg',1723013123,'BS2',0,'',0,''),(3,1,975546,'academic/GRE_proof_1723013123.jpeg',1723013123,'BS2',0,'',0,''),(4,1,975546,'academic/passport_1723013231.jpeg',1723013231,'BS2',0,'',0,''),(5,2,906643,'student_photo_1723097034.jpg',1723097034,'BS2',0,'',0,''),(6,2,906643,'passport_1723097034.jpg',1723097034,'BS2',0,'',0,''),(7,2,906643,'academic/PTE_proof_1723097174.png',1723097174,'BS2',0,'',0,''),(8,2,906643,'academic/passport_1723097239.jpg',1723097239,'BS2',0,'',0,''),(9,3,953765,'student_photo_1723291828.jpg',1723291828,'PV1',0,'',0,''),(10,3,953765,'academic/passport_1723449585.jpg',1723449585,'BS2',0,'',0,''),(11,4,494964,'student_photo_1723450441.jpg',1723450441,'BS2',0,'',0,''),(12,4,494964,'10th_certificate_1723450441.jpg',1723450441,'BS2',0,'',0,''),(13,4,494964,'highest_education_proof_1723450441.jpg',1723450441,'BS2',0,'',0,''),(14,4,494964,'academic/highest_education_proof_1723450535.jpg',1723450535,'BS2',0,'',0,''),(15,4,494964,'academic/GMAT_proof_1723450535.png',1723450535,'BS2',0,'',0,''),(16,3,953765,'lor_1723530341.jpg',1723530341,'BS2',0,'',0,''),(17,3,953765,'academic/TOEFL_proof_1723530589.png',1723530589,'BS2',0,'',0,''),(18,4,494964,'student_photo_1723621472.jpg',1723621472,'BS2',0,'',0,''),(19,6,732712,'student_photo_1723795734.jpg',1723795734,'PV1',0,'',0,''),(20,6,732712,'lor_1723795734.jpg',1723795734,'PV1',0,'',0,''),(21,7,615938,'student_photo_1723795901.jpg',1723795901,'PV1',0,'',0,''),(22,7,615938,'10th_certificate_1723795901.jpg',1723795901,'PV1',0,'',0,''),(23,7,615938,'academic/highest_education_proof_1723796290.jpg',1723796290,'BS2',0,'',0,''),(24,7,615938,'academic/highest_education_proof_1723796300.jpg',1723796300,'BS2',0,'',0,''),(25,7,615938,'academic/highest_education_proof_1723796305.jpg',1723796305,'BS2',0,'',0,''),(26,7,615938,'academic/highest_education_proof_1723796311.jpg',1723796311,'BS2',0,'',0,''),(27,8,766610,'student_photo_1724137016.jpg',1724137016,'BS8',0,'',0,''),(28,6,732712,'student_photo_1724222579.jpg',1724222579,'BS8',0,'',0,''),(29,6,732712,'sop_1724222579.jpg',1724222579,'BS8',0,'',0,'');
/*!40000 ALTER TABLE `urn_document_upload_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wallet_history`
--

DROP TABLE IF EXISTS `wallet_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wallet_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wallet_id` int(11) NOT NULL,
  `transaction_remark` varchar(255) NOT NULL,
  `transaction_amount` int(11) NOT NULL,
  `transaction_id` varchar(255) NOT NULL,
  `transaction_date` int(11) NOT NULL,
  `transaction_type` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wallet_history`
--

LOCK TABLES `wallet_history` WRITE;
/*!40000 ALTER TABLE `wallet_history` DISABLE KEYS */;
INSERT INTO `wallet_history` VALUES (1,1,'Wallet Created',0,'',1720428928,111),(2,2,'Wallet Created',0,'',1720428989,111),(3,3,'Wallet Created',0,'',1720429058,111),(5,3,'Commission Credited for URN 975546',1503,'WT1723014007',1723014007,1),(6,4,'Wallet Created',0,'',1723097342,111),(7,4,'Commission Credited for URN 906643',1464,'WT1723186558',1723186558,1),(8,4,'Amount Withdrawl',1300,'1213',1723186800,0),(9,5,'Wallet Created',0,'',1723532949,111),(10,6,'Wallet Created',0,'',1723533000,111),(11,7,'Wallet Created',0,'',1723543519,111),(12,8,'Wallet Created',0,'',1723622046,111),(13,9,'Wallet Created',0,'',1723622180,111),(14,3,'Amount Withdrawl',1200,'12345',1723614180,0),(15,3,'Amount Withdrawl',3,'12',1723626900,0),(16,1,'Amount Withdrawl',100,'123',1723626900,0),(17,1,'Amount Withdrawl',100,'123',1723626900,0),(18,1,'Commission Credited for URN 953765',2205,'WT1723801708',1723801708,1),(24,4,'Amount Withdrawl',1000,'3456',1724052660,0),(25,4,'Amount Withdrawl',664,'4567',1724053080,0),(23,1,'Amount Withdrawl',2205,'12345',1724050980,0),(26,10,'Wallet Created',0,'',1724055807,111),(27,11,'Wallet Created',0,'',1724136829,111),(28,11,'Commission Credited for URN 766610',334,'WT1724139510',1724139510,1),(29,11,'Amount Withdrawl',668,'1234',1724140140,0),(30,2,'Amount Withdrawl',2,'12',1724145300,0),(31,1,'Amount Withdrawl',560,'1234',1724223660,0),(32,6,'Commission Credited for URN 629998',177,'WT1724227424',1724227424,1),(33,4,'Commission Credited for URN 615938',1002,'WT1724227479',1724227479,1),(34,4,'Commission Credited for URN 615938',1002,'WT1724227479',1724227479,1);
/*!40000 ALTER TABLE `wallet_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wallet_list`
--

DROP TABLE IF EXISTS `wallet_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wallet_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `holder_id` int(11) NOT NULL,
  `holder_type` int(11) NOT NULL,
  `balance` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wallet_list`
--

LOCK TABLES `wallet_list` WRITE;
/*!40000 ALTER TABLE `wallet_list` DISABLE KEYS */;
INSERT INTO `wallet_list` VALUES (1,1,4,1940),(2,2,4,1498),(3,1,6,300),(4,2,6,2004),(5,3,4,1500),(6,3,6,1677),(7,4,4,2500),(8,5,4,2500),(9,4,6,1500),(10,6,4,0),(11,5,6,-334);
/*!40000 ALTER TABLE `wallet_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `withdrawl_request_list`
--

DROP TABLE IF EXISTS `withdrawl_request_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `withdrawl_request_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wallet_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `req_datentime` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `approved_by` varchar(255) NOT NULL,
  `approval_datentime` int(11) NOT NULL,
  `proof_file_name` varchar(255) NOT NULL,
  `transaction_id` varchar(255) NOT NULL,
  `transaction_datentime` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `withdrawl_request_list`
--

LOCK TABLES `withdrawl_request_list` WRITE;
/*!40000 ALTER TABLE `withdrawl_request_list` DISABLE KEYS */;
INSERT INTO `withdrawl_request_list` VALUES (1,3,1200,1723014182,1,'BS2',1723622476,'12345.jpg','12345',1723614180),(2,3,300,1723014648,0,'',0,'','',0),(3,4,1300,1723186711,1,'BS2',1723186846,'1213.jpg','1213',1723186800),(4,3,3,1723622384,1,'BS2',1723630086,'12.jpg','12',1723626900),(5,1,100,1723630185,1,'BS2',1723630240,'123.jpg','123',1723626900),(6,1,100,1723631356,1,'BS2',1723631518,'123.jpg','123',1723626900),(7,4,164,1723802151,1,'BS2',1723803057,'1345.jpg','1345',1723803000),(8,1,3508,1724050602,1,'BS8',1724050845,'1234.jpg','1234',1724050800),(9,1,3508,1724050628,1,'BS8',1724050845,'1234.jpg','1234',1724050800),(10,1,3508,1724050644,1,'BS8',1724050845,'1234.jpg','1234',1724050800),(11,1,2205,1724051740,1,'BS8',1724051887,'12345.pdf','12345',1724050980),(12,4,1000,1724052601,1,'BS8',1724052717,'3456.jpg','3456',1724052660),(13,4,660,1724052797,1,'BS8',1724053177,'4567.jpg','4567',1724053080),(14,4,4,1724052833,1,'BS8',1724053177,'4567.jpg','4567',1724053080),(15,11,334,1724139716,1,'BS8',1724140215,'1234.jpg','1234',1724140140),(16,11,334,1724139734,1,'BS8',1724140215,'1234.jpg','1234',1724140140),(17,2,10,1724144419,0,'',0,'','',0),(18,2,10,1724144463,0,'',0,'','',0),(19,2,10,1724144528,0,'',0,'','',0),(20,2,10,1724144608,0,'',0,'','',0),(21,2,11,1724145376,0,'',0,'','',0),(22,2,15,1724145610,0,'',0,'','',0),(23,2,5,1724145652,0,'',0,'','',0),(24,2,5,1724145669,0,'',0,'','',0),(25,2,2,1724145707,0,'',0,'','',0),(26,2,2,1724145725,1,'BS8',1724146362,'12.jpg','12',1724145300),(27,2,10,1724218273,0,'',0,'','',0),(28,2,10,1724218311,0,'',0,'','',0),(29,2,10,1724218329,0,'',0,'','',0),(30,2,390,1724219238,0,'',0,'','',0),(31,2,390,1724219255,0,'',0,'','',0),(32,2,390,1724219273,0,'',0,'','',0),(33,2,10,1724219467,0,'',0,'','',0),(34,2,10,1724219484,0,'',0,'','',0),(35,2,10,1724219500,0,'',0,'','',0),(36,2,100,1724219886,0,'',0,'','',0),(37,2,100,1724219903,0,'',0,'','',0),(38,2,5,1724219921,0,'',0,'','',0),(39,2,5,1724219937,0,'',0,'','',0),(40,1,10,1724220132,0,'',0,'','',0),(41,1,10,1724220150,0,'',0,'','',0),(42,1,10,1724220166,0,'',0,'','',0),(43,1,10,1724220230,0,'',0,'','',0),(44,5,500,1724220236,0,'',0,'','',0),(45,1,10,1724220247,0,'',0,'','',0),(46,5,500,1724220255,0,'',0,'','',0),(47,1,10,1724220637,0,'',0,'','',0),(48,1,10,1724220794,0,'',0,'','',0),(49,1,10,1724220848,0,'',0,'','',0),(50,1,10,1724220949,0,'',0,'','',0),(51,1,10,1724221051,0,'',0,'','',0),(52,1,10,1724221271,0,'',0,'','',0),(53,1,5,1724221310,0,'',0,'','',0),(54,1,5,1724221868,0,'',0,'','',0),(55,1,5,1724221956,0,'',0,'','',0),(56,1,5,1724222287,0,'',0,'','',0),(57,1,5,1724223138,0,'',0,'','',0),(58,1,5,1724223455,0,'',0,'','',0),(59,1,360,1724223550,1,'BS8',1724223728,'1234.jpg','1234',1724223660),(60,1,200,1724223611,1,'BS8',1724223728,'1234.jpg','1234',1724223660),(61,1,10,1724223984,0,'',0,'','',0),(62,1,5,1724224325,0,'',0,'','',0),(63,6,1677,1724227638,0,'',0,'','',0),(64,6,1677,1724227655,0,'',0,'','',0),(65,1,200,1724227848,0,'',0,'','',0),(66,1,200,1724227873,0,'',0,'','',0),(67,1,200,1724228047,0,'',0,'','',0),(68,1,100,1724228213,0,'',0,'','',0);
/*!40000 ALTER TABLE `withdrawl_request_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `working_on_lead_list`
--

DROP TABLE IF EXISTS `working_on_lead_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `working_on_lead_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(255) NOT NULL,
  `lead_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `working_on_lead_list`
--

LOCK TABLES `working_on_lead_list` WRITE;
/*!40000 ALTER TABLE `working_on_lead_list` DISABLE KEYS */;
INSERT INTO `working_on_lead_list` VALUES (90,'BS8',4);
/*!40000 ALTER TABLE `working_on_lead_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'CAversion2'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-22 12:30:12

-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Dec 10, 2024 at 05:56 AM
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
-- Database: `paytrack`
--

-- --------------------------------------------------------

--
-- Table structure for table `employment_info`
--

DROP TABLE IF EXISTS `employment_info`;
CREATE TABLE IF NOT EXISTS `employment_info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_number` varchar(50) NOT NULL,
  `employment_type` varchar(50) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `hire_date` date NOT NULL,
  `position` varchar(255) DEFAULT NULL,
  `salary_rate` decimal(10,2) DEFAULT NULL,
  `bank_name` varchar(255) DEFAULT NULL,
  `account_holder_name` varchar(255) DEFAULT NULL,
  `account_number` varchar(50) DEFAULT NULL,
  `routing_number` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id_number` (`id_number`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `employment_info`
--

INSERT INTO `employment_info` (`id`, `id_number`, `employment_type`, `department`, `hire_date`, `position`, `salary_rate`, `bank_name`, `account_holder_name`, `account_number`, `routing_number`, `created_at`) VALUES
(1, 'SD001', 'Full-Time', 'Sales Department', '2024-11-01', 'Sales Manager', 500.00, 'BDO', 'Harlyn Nebreja', '04272004', '0427', '2024-11-02 02:55:38'),
(2, 'SM002', 'Part-Time', 'Service Department', '2024-11-12', 'Service Manager', 500.00, 'BDO', 'Kimberly Asi', '12345', '123', '2024-11-02 07:56:36'),
(3, 'SD001', 'Full-Time', 'Sales Department', '2024-10-31', 'Sales Manager', 600.00, 'BDO', 'Harlyn Nebreja', '04272004', '0427', '2024-11-08 15:02:49'),
(4, 'SD001', 'Full-Time', 'Sales Department', '2024-10-31', 'Sales Manager', 500.00, 'BDO', 'Harlyn Nebreja', '04272004', '042704', '2024-11-08 15:27:19'),
(5, 'IT101', 'Full-Time', 'IT Department', '2020-06-17', 'Systems Analyst', 600.00, 'BDO', 'Alfia Bahia', '12345', '123', '2024-11-09 02:16:54');

-- --------------------------------------------------------

--
-- Table structure for table `holidays`
--

DROP TABLE IF EXISTS `holidays`;
CREATE TABLE IF NOT EXISTS `holidays` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `holidays`
--

INSERT INTO `holidays` (`id`, `title`, `description`, `start_date`, `end_date`, `created_at`) VALUES
(1, 'Bonifacio Day', 'walang pasok', '2024-11-30', '2024-11-30', '2024-11-05 13:15:10'),
(2, 'Oriental Mindoro day', 'founding anniversary', '2024-11-15', '2024-11-15', '2024-11-09 01:52:58'),
(3, 'Christmas', 'pasko', '2024-12-25', '2024-11-25', '2024-11-09 02:21:45');

-- --------------------------------------------------------

--
-- Table structure for table `leave_requests`
--

DROP TABLE IF EXISTS `leave_requests`;
CREATE TABLE IF NOT EXISTS `leave_requests` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_number` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `leave_type` enum('Sick Leave','Casual Leave','Annual Leave','Maternity Leave','Paternity Leave','Unpaid Leave') NOT NULL,
  `leave_date` date NOT NULL,
  `end_date` date NOT NULL,
  `message` text NOT NULL,
  `status` enum('Pending','Approved','Rejected') DEFAULT 'Pending',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id_number` (`id_number`(250))
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `leave_requests`
--

INSERT INTO `leave_requests` (`id`, `id_number`, `subject`, `leave_type`, `leave_date`, `end_date`, `message`, `status`, `created_at`) VALUES
(1, 'SD001', 'Sick', 'Sick Leave', '2024-11-03', '2024-11-05', 'Please Approved', 'Pending', '2024-11-02 02:56:13'),
(2, 'IT101', 'Sick', 'Sick Leave', '2024-11-10', '2024-11-11', 'please approve', 'Pending', '2024-11-09 02:17:54');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `last_name` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `dob` date NOT NULL,
  `gender` varchar(20) NOT NULL,
  `status` varchar(20) NOT NULL,
  `contact_number` varchar(20) NOT NULL,
  `emergency_number` varchar(20) NOT NULL,
  `address` varchar(255) NOT NULL,
  `email` varchar(50) NOT NULL,
  `id_number` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `role` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `last_name`, `first_name`, `middle_name`, `dob`, `gender`, `status`, `contact_number`, `emergency_number`, `address`, `email`, `id_number`, `password`, `created_at`, `role`) VALUES
(1, 'Constantino', 'Sunshyne', 'Alulod', '2003-09-29', 'Feamle', 'Single', '09202136816', '09202136816', 'Sta. Rita', 'sunshyneconstantino@gmail.com', '10001', '$2b$10$lHpPn5AwGkO82ssXKGRBN.YlPahPBDkFxaJvPCGHseTa09gGT997a', '2024-10-29 12:13:56', 'Employee'),
(2, 'asi', 'kimberly', 'o', '2024-10-30', 'Feamle', 'Married', '123456789', '123456789', 'Parang, Calapan City', 'kimsissy@gmail.com', '10002', '$2b$10$LwlWFRD96LO3lmZ9OKReeuT.zT6EdPIsNjrid87Re6idkoBwrbgQO', '2024-10-29 12:52:20', 'Employee'),
(3, 'asi', 'kimberly', 'otieco', '2004-04-19', 'Feamle', 'Single', '09664090314', '09297596819', 'Parang, Calapan City', 'kimsissy@gmail.com', '10003', '$2b$10$3DbrEPqHm4sqFNFiBZuk2OcvB9FKBJ4X2bFnkwrvWHtjC17sV1roq', '2024-10-29 23:47:46', 'Employee'),
(4, 'Nebreja', 'Harlyn', 'Podra', '2004-04-23', 'Male', 'Single', '09933886462', '09202136816', 'Laguna, Naujan', 'harlyn@gmail.com', 'SD001', '$2b$10$8A5oCwYfHG9jW2IY1mONeewmFbfDEl6GIjARn63lqQKY5/3fbMfSK', '2024-11-02 02:54:08', 'Employee'),
(5, 'Isuzu', 'Isuzu', 'Isuzu', '2024-11-30', 'Male', 'Single', '09202136816', '09202136816', 'Puting Tubig, Calapan City', 'isuzu@gmail.com', 'ISUZU', '$2b$10$HVtTyZqnx4CHv2G9TNwgAOrrMLg4/rmw9K7WPjsEs/EHAEHLRy00W', '2024-11-02 05:25:55', 'Admin'),
(6, 'Asi', 'Kimberly', 'It', '2024-11-22', 'Male', 'Single', '09202136816', '09202136816', 'Parang, Calapan City', 'asi@gmail.com', 'SM002', '$2b$10$N4bwsnJO8sZDe9ZaGez2.uV4nnAxXmaU8v627wu8FqDvLHp2jIM32', '2024-11-02 05:34:13', 'Employee'),
(7, 'Bahia', 'Alfia', 'Aaron', '2004-07-02', 'Male', 'Single', '09123456789', '09123456789', 'Aurora, Naujan', 'alfiabahia@gmail.com', 'IT101', '$2b$10$xi.ch2DcpiEAL612rvNjZOkNb6KmSElJe7w8D3GE483DS.lgBJl.i', '2024-11-09 02:11:15', 'Employee'),
(8, 'Bahia', 'Alfia', 'Aaron', '2004-07-02', 'Male', 'Single', '09123456789', '09123456789', 'Aurora, Naujan', 'alfiabahia@gmail.com', 'IT101', '$2b$10$erMLv.29bWmsIAxigo1xd.jR.TAfHNLsytrFvEtT3i.ELP4WllIcS', '2024-11-09 02:11:40', 'Employee'),
(9, 'Constantino', 'Sunshyne', 'Alulod', '2003-09-29', 'Feamle', 'Married', '09202136816', '09202136816', 'Sta. Rita', 'sunshyneconstantino@gmail.com', '10001', '$2b$10$LUXsozSAU5Wlro9Erequyu.dOMiD8EWrL5EyvflyZh8N9PDYk9C82', '2024-11-25 10:39:37', 'Employee'),
(10, 'Constantino', 'Sunshyne', 'Alulod', '2003-10-29', 'Feamle', 'Single', '09202136816', '09202136816', 'Sta. Rita', 'sunshyneconstantino@gmail.com', 'IT101', '$2b$10$7q3i1LWdtl07A.VoK5xDqOPHF1N3qZ3SU/Mouo5KI9ECEAViVjcC6', '2024-11-25 10:44:11', 'Employee');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

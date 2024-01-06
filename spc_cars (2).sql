-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 06, 2024 at 06:04 PM
-- Server version: 8.0.17
-- PHP Version: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `spc_cars`
--

-- --------------------------------------------------------

--
-- Table structure for table `cars`
--

CREATE TABLE `cars` (
  `id` int(11) NOT NULL,
  `doc_id` varchar(100) NOT NULL,
  `driverName` varchar(100) NOT NULL,
  `carNo` varchar(20) NOT NULL,
  `carTypeId` varchar(100) NOT NULL,
  `mgId` varchar(100) NOT NULL,
  `irregularities` varchar(500) NOT NULL,
  `notes` varchar(500) NOT NULL,
  `phone` int(20) NOT NULL,
  `user_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `carstypes`
--

CREATE TABLE `carstypes` (
  `id` int(11) NOT NULL,
  `doc_id` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `active` int(11) NOT NULL DEFAULT '1',
  `user_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `carstypes`
--

INSERT INTO `carstypes` (`id`, `doc_id`, `name`, `active`, `user_id`) VALUES
(3, '1696747034772', 'بوكس', 1, ''),
(4, '1696747049356', 'موتر', 1, ''),
(5, '1696747056344', 'ركشة', 1, ''),
(6, '1696747063344', 'صالون', 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `managements`
--

CREATE TABLE `managements` (
  `id` int(11) NOT NULL,
  `doc_id` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `active` int(11) NOT NULL DEFAULT '1',
  `user_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `managements`
--

INSERT INTO `managements` (`id`, `doc_id`, `name`, `active`, `user_id`) VALUES
(5, '1696746932911', 'المشتريات', 1, ''),
(6, '1696746941146', 'الرئاسة', 1, ''),
(7, '1696746950748', 'الكهرباء', 1, ''),
(8, '1696746962757', 'الخدمات', 1, ''),
(17, '1696999177754', 'الجنوبية', 1, '32453245'),
(19, '1696999193655', 'البحرية', 1, '32453245'),
(20, '1696999202110', 'الشمالي', 1, '32453245'),
(21, '1696999218828', 'المستشفى', 1, '32453245');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` int(11) NOT NULL,
  `doc_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` varchar(100) NOT NULL,
  `create_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `running` int(11) NOT NULL DEFAULT '1',
  `logout_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `doc_id`, `user_id`, `create_at`, `update_at`, `running`, `logout_at`) VALUES
(1, '20231010091014509', '32453245', '2023-10-10 11:34:14', '2023-10-10 11:34:14', 1, NULL),
(2, '20231010091054669', '1696843494843', '2023-10-10 11:38:54', '2023-10-10 11:38:54', 1, NULL),
(3, '20231010091025691', '32453245', '2023-10-10 11:52:25', '2023-10-10 11:52:25', 1, NULL),
(4, '20231010101040254', '1696843494843', '2023-10-10 12:02:40', '2023-10-10 12:02:40', 1, NULL),
(5, '20231010101004233', '32453245', '2023-10-10 12:04:04', '2023-10-10 12:04:04', 1, NULL),
(6, '20231010101013461', '1696843494843', '2023-10-10 12:08:13', '2023-10-10 12:08:13', 1, NULL),
(7, '20231010101004739', '32453245', '2023-10-10 12:12:04', '2023-10-10 12:12:04', 1, NULL),
(8, '20231010101052437', '32453245', '2023-10-10 12:12:52', '2023-10-10 12:12:52', 1, NULL),
(9, '20231010101011112', '32453245', '2023-10-10 12:15:11', '2023-10-10 12:15:11', 1, NULL),
(10, '20231010031006415', '1696843494843', '2023-10-10 17:52:06', '2023-10-10 17:52:06', 1, NULL),
(11, '20231010041034475', '32453245', '2023-10-10 18:05:34', '2023-10-10 18:05:34', 1, NULL),
(12, '20231010041051997', '32453245', '2023-10-10 18:08:51', '2023-10-10 18:08:51', 1, NULL),
(13, '20231011041045997', '32453245', '2023-10-11 06:34:45', '2023-10-11 06:34:45', 1, NULL),
(14, '20231011041037619', '32453245', '2023-10-11 06:35:37', '2023-10-11 06:35:37', 1, NULL),
(15, '20231011041059629', '1696998990527', '2023-10-11 06:36:59', '2023-10-11 06:36:59', 1, NULL),
(16, '20231011041056397', '32453245', '2023-10-11 06:38:56', '2023-10-11 06:38:56', 1, NULL),
(17, '20231011041024543', '32453245', '2023-10-11 06:48:24', '2023-10-11 06:48:24', 1, NULL),
(18, '20231012091007401', '1696843494843', '2023-10-12 23:13:07', '2023-10-12 23:13:07', 1, NULL),
(19, '20231016061030349', '1696843494843', '2023-10-16 08:39:31', '2023-10-16 08:39:31', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `doc_id` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `phone` int(20) NOT NULL,
  `password` varchar(100) NOT NULL,
  `user_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `role` int(11) NOT NULL DEFAULT '0',
  `active` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `doc_id`, `name`, `phone`, `password`, `user_id`, `role`, `active`) VALUES
(1, '32453245', 'محمد اسماعيل', 115642026, '1212', '32453245', 1, 1),
(2, '1696843494843', 'المهتدي حسن علي', 123, '123', '32453245', 0, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carstypes`
--
ALTER TABLE `carstypes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `managements`
--
ALTER TABLE `managements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cars`
--
ALTER TABLE `cars`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `carstypes`
--
ALTER TABLE `carstypes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `managements`
--
ALTER TABLE `managements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `sessions`
--
ALTER TABLE `sessions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

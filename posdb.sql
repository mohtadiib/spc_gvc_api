-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Oct 07, 2023 at 05:59 PM
-- Server version: 5.7.34
-- PHP Version: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `companypos`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
                              `id` int(11) NOT NULL,
                              `doc_id` varchar(100) NOT NULL,
                              `name` varchar(20) NOT NULL,
                              `active` int(11) NOT NULL DEFAULT '1',
                              `company_id` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `doc_id`, `name`, `active`, `company_id`) VALUES
                                                                              (17, '1694090438483', 'عصائر', 1, NULL),
                                                                              (18, '1694090444456', 'فطائر', 1, NULL),
                                                                              (19, '1694090495026', 'ساندويتشات', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
                           `id` int(11) NOT NULL,
                           `name` varchar(100) DEFAULT NULL,
                           `title` varchar(100) NOT NULL,
                           `phone` int(20) NOT NULL,
                           `pass` varchar(100) DEFAULT NULL,
                           `email` varchar(50) DEFAULT NULL,
                           `logo` varchar(500) DEFAULT NULL,
                           `create_at` datetime DEFAULT NULL,
                           `unic_id` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`id`, `name`, `title`, `phone`, `pass`, `email`, `logo`, `create_at`, `unic_id`) VALUES
                                                                                                            (1, 'جاك بولو', 'جاك بولو', 920749357, '555', 'mohtadyp@gmail.com', './assets/logo.png', '2021-06-26 18:47:09', '202106260447094771'),
                                                                                                            (2, 'محمد النور حسين اسماعيل', 'النور للاسبيرات', 912345566, '444', 'alnor@gmail.com', 'uploads/592168946.png', '2021-08-20 19:33:49', '202108200533495082'),
                                                                                                            (3, 'خالد سلك', 'الجوازات', 920749355, '5566', 'mohamed@gmail.com', 'uploads/249490433.jpg', '2021-08-23 18:55:40', '202108230455401787'),
                                                                                                            (4, 'الباقر بيبش', 'جاك بولو', 123123123, '123', 'mohtadyb@gmail.com', 'uploads/636745734.png', '2022-01-11 08:02:30', '202201110602302170'),
                                                                                                            (5, 'ياسر للأساس', 'ياسر للاساس', 912410038, '123', 'yasir@gmai.com', 'uploads/774937422.png', '2022-02-13 14:52:19', '202202131252191655'),
                                                                                                            (6, 'wUmrLVWz', 'Mr.', 1, 'g00dPa$$w0rD', 'sample@email.tst', 'This type of image is not allow', '2022-03-13 02:10:34', '202203131210346429'),
                                                                                                            (7, 'wUmrLVWz', 'Mr.', 1, 'g00dPa$$w0rD', 'sample@email.tst', 'This type of image is not allow', '2022-03-13 02:10:35', '202203131210357248'),
                                                                                                            (8, 'wUmrLVWz', 'Mr.', 1, 'g00dPa$$w0rD', 'sample@email.tst', '20', '2022-03-13 02:10:47', '202203131210471646'),
                                                                                                            (9, 'wUmrLVWz', 'Mr.', 1, 'g00dPa$$w0rD', 'sample@email.tst', '20', '2022-03-13 02:10:47', '202203131210476109');

-- --------------------------------------------------------

--
-- Table structure for table `configration`
--

CREATE TABLE `configration` (
                                `id` int(11) NOT NULL,
                                `full_total` int(50) DEFAULT NULL,
                                `returned` int(11) DEFAULT '0',
                                `manyValue` int(50) DEFAULT NULL,
                                `manyindisk` int(50) DEFAULT NULL,
                                `begin_time` timestamp NULL DEFAULT NULL,
                                `end_time` timestamp NULL DEFAULT NULL,
                                `employee_id` int(11) DEFAULT NULL,
                                `opened` int(11) DEFAULT NULL,
                                `profits_daily` int(100) DEFAULT NULL,
                                `company_id` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `configration`
--

INSERT INTO `configration` (`id`, `full_total`, `returned`, `manyValue`, `manyindisk`, `begin_time`, `end_time`, `employee_id`, `opened`, `profits_daily`, `company_id`) VALUES
    (1, 45000, 0, 0, 45000, NULL, '2022-06-06 11:33:02', 4, 0, NULL, '202106260447094771');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
                            `id` int(11) NOT NULL,
                            `customer_name` varchar(100) NOT NULL,
                            `contact` int(11) DEFAULT '0',
                            `address` varchar(100) NOT NULL,
                            `admin` int(11) NOT NULL,
                            `company_id` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `customer_name`, `contact`, `address`, `admin`, `company_id`) VALUES
    (1, 'الموظف', 0, '', 0, '202106260447094771');

-- --------------------------------------------------------

--
-- Table structure for table `depts`
--

CREATE TABLE `depts` (
                         `id` int(11) NOT NULL,
                         `debt_status` int(11) DEFAULT NULL,
                         `person_name` varchar(100) DEFAULT NULL,
                         `person_phone` int(11) DEFAULT NULL,
                         `person_national_id` int(50) DEFAULT NULL,
                         `many_value` int(11) DEFAULT NULL,
                         `date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                         `date_time_done` timestamp NULL DEFAULT NULL,
                         `done` int(11) DEFAULT '0',
                         `employee_id` int(11) NOT NULL,
                         `employee_done` int(11) DEFAULT '0',
                         `employee_done_name` varchar(100) DEFAULT NULL,
                         `sale_id` varchar(100) DEFAULT NULL,
                         `show` int(11) NOT NULL DEFAULT '1',
                         `company_id` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `employee_permissions`
--

CREATE TABLE `employee_permissions` (
                                        `id` int(11) NOT NULL,
                                        `number` int(11) NOT NULL,
                                        `title` varchar(50) NOT NULL,
                                        `employee_id` varchar(100) NOT NULL,
                                        `company_id` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employee_permissions`
--

INSERT INTO `employee_permissions` (`id`, `number`, `title`, `employee_id`, `company_id`) VALUES
                                                                                              (8, 1, 'الرئيسية', '202206060106137476', '202106260447094771'),
                                                                                              (9, 6, 'المبيعات', '202206060106137476', '202106260447094771'),
                                                                                              (10, 7, 'إدارة المبيعات', '202206060106137476', '202106260447094771'),
                                                                                              (11, 8, 'العملاء', '202206060106137476', '202106260447094771'),
                                                                                              (12, 10, 'المنصرفات', '202206060106137476', '202106260447094771');

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
                         `id` int(11) NOT NULL,
                         `doc_id` varchar(100) NOT NULL,
                         `name` varchar(100) NOT NULL,
                         `active` int(11) NOT NULL DEFAULT '0',
                         `company_id` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `doc_id`, `name`, `active`, `company_id`) VALUES
                                                                         (1, '1694945624265', 'مياه', 1, NULL),
                                                                         (2, '1694945628113', 'كهرباء', 1, NULL),
                                                                         (3, '1694949253265', 'ورق', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `outputs`
--

CREATE TABLE `outputs` (
                           `id` int(11) NOT NULL,
                           `doc_id` varchar(100) NOT NULL,
                           `item_id` varchar(100) DEFAULT NULL,
                           `moneyValue` int(50) DEFAULT NULL,
                           `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                           `employee_id` varchar(100) DEFAULT NULL,
                           `active` int(11) DEFAULT '0',
                           `company_id` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `outputs`
--

INSERT INTO `outputs` (`id`, `doc_id`, `item_id`, `moneyValue`, `timestamp`, `employee_id`, `active`, `company_id`) VALUES
                                                                                                                        (1, '1694949766015', NULL, NULL, '2023-09-17 11:24:05', NULL, 0, NULL),
                                                                                                                        (2, '1694949766015', NULL, NULL, '2023-09-17 11:24:07', '1693491845877', 0, NULL),
                                                                                                                        (3, '1694949766015', '1694949253265', NULL, '2023-09-17 11:24:17', '1693491845877', 0, NULL),
                                                                                                                        (4, '1694949766015', '1694949253265', 4234, '2023-09-17 11:24:33', '1693491845877', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
                            `id` int(11) NOT NULL,
                            `doc_id` varchar(100) NOT NULL,
                            `category_id` varchar(100) DEFAULT NULL,
                            `product_code` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
                            `name` varchar(100) DEFAULT NULL,
                            `product_image` varchar(1000) DEFAULT NULL,
                            `cost` int(11) DEFAULT NULL,
                            `price` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
                            `qty` int(10) DEFAULT NULL,
                            `minimum_qty` int(11) DEFAULT NULL,
                            `conditions` varchar(500) DEFAULT NULL,
                            `needed` int(11) DEFAULT '0',
                            `check_qty` varchar(255) DEFAULT '0',
                            `total_price` int(100) DEFAULT '0',
                            `total_cost` int(100) DEFAULT '0',
                            `company_id` varchar(100) DEFAULT NULL,
                            `active` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `doc_id`, `category_id`, `product_code`, `name`, `product_image`, `cost`, `price`, `qty`, `minimum_qty`, `conditions`, `needed`, `check_qty`, `total_price`, `total_cost`, `company_id`, `active`) VALUES
                                                                                                                                                                                                                                     (5, '1694094167294', '1694090444456', NULL, 'كرسبي', 'crispy.png', NULL, '2200', NULL, NULL, NULL, 0, '0', 0, 0, NULL, 1),
                                                                                                                                                                                                                                     (6, '1694094511606', '1694090444456', NULL, 'بيرقر', 'burger.jpeg', NULL, '3000', NULL, NULL, NULL, 0, '0', 0, 0, NULL, 1),
                                                                                                                                                                                                                                     (9, '1694095363500', '1694090495026', NULL, 'زنجر', 'zinger.jpeg', NULL, '2400', NULL, NULL, NULL, 0, '0', 0, 0, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
                         `id` int(11) NOT NULL,
                         `doc_id` varchar(100) NOT NULL,
                         `user_id` int(11) DEFAULT NULL,
                         `quantity_items` int(11) DEFAULT '0',
                         `vat` int(11) DEFAULT NULL,
                         `date_time` timestamp NULL DEFAULT NULL,
                         `total_price` int(11) DEFAULT NULL,
                         `total_product_cost` int(11) DEFAULT NULL,
                         `full_total_price` int(11) DEFAULT NULL,
                         `employee_id` varchar(100) DEFAULT NULL,
                         `products` varchar(2000) DEFAULT NULL,
                         `returned` int(11) DEFAULT '0',
                         `invoice` varchar(100) DEFAULT NULL,
                         `pay_type` int(11) DEFAULT NULL,
                         `company_id` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `doc_id`, `user_id`, `quantity_items`, `vat`, `date_time`, `total_price`, `total_product_cost`, `full_total_price`, `employee_id`, `products`, `returned`, `invoice`, `pay_type`, `company_id`) VALUES
                                                                                                                                                                                                                               (1, '1694934472318', 123, 5, NULL, NULL, 13000, NULL, 13000, '1693491845874', NULL, 0, '1694934472', 1, '123'),
                                                                                                                                                                                                                               (2, '1694936464038', 123, 6, NULL, NULL, 15600, NULL, 15600, '1693491845877', NULL, 0, '1694936464', 1, '123');

-- --------------------------------------------------------

--
-- Table structure for table `sales_order`
--

CREATE TABLE `sales_order` (
                               `id` int(11) NOT NULL,
                               `doc_id` varchar(100) DEFAULT NULL,
                               `product_id` varchar(100) DEFAULT NULL,
                               `qty` int(10) DEFAULT '0',
                               `cost` int(11) DEFAULT NULL,
                               `invoice` varchar(100) DEFAULT NULL,
                               `company_id` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sales_order`
--

INSERT INTO `sales_order` (`id`, `doc_id`, `product_id`, `qty`, `cost`, `invoice`, `company_id`) VALUES
                                                                                                     (1, '1752952', '1694095363500', 2, NULL, '1694934472318', NULL),
                                                                                                     (2, '1752508', '1694094511606', 2, NULL, '1694934472318', NULL),
                                                                                                     (3, '1752226', '1694094167294', 1, NULL, '1694934472318', NULL),
                                                                                                     (4, '1704694', '1694094511606', 3, NULL, '1694936464038', NULL),
                                                                                                     (5, '1704552', '1694094167294', 3, NULL, '1694936464038', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `stock`
--

CREATE TABLE `stock` (
                         `id` int(11) NOT NULL,
                         `product_id` int(11) NOT NULL,
                         `supplier_id` int(11) NOT NULL,
                         `quantity` int(11) NOT NULL,
                         `damaged` int(11) NOT NULL,
                         `total_cost` int(11) NOT NULL,
                         `unit_cost` int(11) NOT NULL,
                         `more` int(11) DEFAULT NULL,
                         `company_id` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `supliers`
--

CREATE TABLE `supliers` (
                            `id` int(11) NOT NULL,
                            `name` varchar(100) NOT NULL,
                            `address` varchar(100) NOT NULL,
                            `phone` int(20) NOT NULL,
                            `person` varchar(100) NOT NULL,
                            `company_id` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `supliers`
--

INSERT INTO `supliers` (`id`, `name`, `address`, `phone`, `person`, `company_id`) VALUES
    (2, 'بشير', '', 0, 'mhb', '202106260447094771');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
                         `id` int(11) NOT NULL,
                         `doc_id` varchar(100) NOT NULL,
                         `name` varchar(100) DEFAULT NULL,
                         `phone` int(11) DEFAULT NULL,
                         `email` varchar(100) DEFAULT NULL,
                         `address` varchar(100) DEFAULT NULL,
                         `password` varchar(100) DEFAULT NULL,
                         `nationalId` int(100) DEFAULT NULL,
                         `salary` int(11) DEFAULT NULL,
                         `role` int(11) DEFAULT '0',
                         `employee_id` varchar(100) DEFAULT NULL,
                         `status` int(11) NOT NULL DEFAULT '1',
                         `company_id` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `doc_id`, `name`, `phone`, `email`, `address`, `password`, `nationalId`, `salary`, `role`, `employee_id`, `status`, `company_id`) VALUES
                                                                                                                                                                 (1, '4234', 'المدير', 44, 'mohtadyp@gmail.com', NULL, '44', NULL, NULL, 1, NULL, 1, '202106260447094771'),
                                                                                                                                                                 (7, '1693491845877', 'المهتدي', 114612006, NULL, NULL, '12345', NULL, NULL, NULL, NULL, 1, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `configration`
--
ALTER TABLE `configration`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `depts`
--
ALTER TABLE `depts`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee_permissions`
--
ALTER TABLE `employee_permissions`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `outputs`
--
ALTER TABLE `outputs`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales_order`
--
ALTER TABLE `sales_order`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stock`
--
ALTER TABLE `stock`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `supliers`
--
ALTER TABLE `supliers`
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
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `configration`
--
ALTER TABLE `configration`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `depts`
--
ALTER TABLE `depts`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee_permissions`
--
ALTER TABLE `employee_permissions`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `outputs`
--
ALTER TABLE `outputs`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sales_order`
--
ALTER TABLE `sales_order`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `stock`
--
ALTER TABLE `stock`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `supliers`
--
ALTER TABLE `supliers`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

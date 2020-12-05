-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 05, 2020 at 06:12 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `study`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_admin`
--

CREATE TABLE `tb_admin` (
  `admin_id` int(50) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `admin_name` varchar(256) NOT NULL,
  `created_at` datetime(6) NOT NULL DEFAULT current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_admin`
--

INSERT INTO `tb_admin` (`admin_id`, `is_active`, `admin_name`, `created_at`) VALUES
(1, 1, 'Bunty', '2020-12-05 08:14:08.462719'),
(2, 1, 'Amit', '2020-12-05 08:14:29.703271'),
(3, 1, 'Rahul', '2020-12-05 08:14:55.681431'),
(4, 0, 'Sarwan', '2020-12-05 08:16:01.046377');

-- --------------------------------------------------------

--
-- Table structure for table `tb_user`
--

CREATE TABLE `tb_user` (
  `user_id` int(50) NOT NULL,
  `admin_id` int(50) NOT NULL,
  `user_name` varchar(250) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_user`
--

INSERT INTO `tb_user` (`user_id`, `admin_id`, `user_name`, `created_at`) VALUES
(1, 1, 'vicky', '2020-12-05 08:08:07'),
(2, 1, 'vicky1', '2020-12-05 08:09:11'),
(3, 1, 'vicky2', '2020-12-05 08:09:43'),
(4, 1, 'vicky3', '2020-12-05 08:10:01'),
(5, 2, 'sonu1', '2020-12-05 08:10:29'),
(6, 2, 'sonu2', '2020-12-05 08:10:53'),
(7, 3, 'rohit1', '2020-12-05 08:11:26'),
(8, 3, 'rohit2', '2020-12-05 08:11:55'),
(9, 3, 'rohit3', '2020-12-05 08:12:14'),
(10, 4, 'person1', '2020-12-05 08:16:56');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_admin`
--
ALTER TABLE `tb_admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_admin`
--
ALTER TABLE `tb_admin`
  MODIFY `admin_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `user_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 29, 2024 at 01:06 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `EZTechMovieDB`
--

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `plan_id` int(11) DEFAULT NULL,
  `payment_method` varchar(255) DEFAULT NULL,
  `membership_start_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `username`, `password`, `plan_id`, `payment_method`, `membership_start_date`) VALUES
(1, 'John Monroe', 'password123', 1, 'Credit Card', '2023-01-15'),
(2, 'Jane Smith', 'securepass', 2, 'PayPal', '2023-02-28'),
(3, 'Samantha Jackson', 'strongpwd', 3, 'Credit Card', '2023-03-10');

-- --------------------------------------------------------

--
-- Table structure for table `customer_dvd_rental`
--

CREATE TABLE `customer_dvd_rental` (
  `cdr_id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `movie_id` int(11) DEFAULT NULL,
  `rental_date` date DEFAULT NULL,
  `return_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer_dvd_rental`
--

INSERT INTO `customer_dvd_rental` (`cdr_id`, `customer_id`, `movie_id`, `rental_date`, `return_date`) VALUES
(1, 1, 1, '2024-02-15', '2024-02-20'),
(2, 2, 3, '2024-02-16', '2024-02-21'),
(3, 3, 2, '2024-02-17', '2024-02-22');

-- --------------------------------------------------------

--
-- Table structure for table `customer_movie_stream`
--

CREATE TABLE `customer_movie_stream` (
  `cms_id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `movie_id` int(11) DEFAULT NULL,
  `stream_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer_movie_stream`
--

INSERT INTO `customer_movie_stream` (`cms_id`, `customer_id`, `movie_id`, `stream_date`) VALUES
(1, 1, 1, '2024-02-15'),
(2, 2, 3, '2024-02-16'),
(3, 3, 2, '2024-02-16'),
(4, 1, 4, '2024-02-17'),
(5, 2, 5, '2024-02-17'),
(6, 1, 1, '2024-02-15'),
(7, 2, 3, '2024-02-16'),
(8, 3, 2, '2024-02-16'),
(9, 1, 4, '2024-02-17'),
(10, 2, 5, '2024-02-17');

-- --------------------------------------------------------

--
-- Table structure for table `movies`
--

CREATE TABLE `movies` (
  `movie_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `available_on_dvd` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `movies`
--

INSERT INTO `movies` (`movie_id`, `title`, `available_on_dvd`) VALUES
(1, 'The Shawshank Redemption', 1),
(2, 'The Godfather', 1),
(3, 'The Dark Knight', 0),
(4, 'Pulp Fiction', 1),
(5, 'Forrest Gump', 0);

-- --------------------------------------------------------

--
-- Table structure for table `plans`
--

CREATE TABLE `plans` (
  `plan_id` int(11) NOT NULL,
  `plan_name` varchar(255) NOT NULL,
  `plan_type` enum('streaming','DVD') NOT NULL,
  `max_streams` int(11) DEFAULT NULL,
  `max_devices` int(11) DEFAULT NULL,
  `max_dvds` int(11) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `hd_available` tinyint(1) DEFAULT 0,
  `uhd_available` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `plans`
--

INSERT INTO `plans` (`plan_id`, `plan_name`, `plan_type`, `max_streams`, `max_devices`, `max_dvds`, `price`, `hd_available`, `uhd_available`) VALUES
(1, 'Individual Plan', 'streaming', 1, 1, 0, 0.00, 0, 0),
(2, 'Friendly Plan', 'streaming', 2, 2, 0, 0.00, 1, 0),
(3, 'Family Plan', 'streaming', 4, 4, 0, 0.00, 1, 1),
(4, 'Individual DVD', 'DVD', 0, 0, 1, 4.99, 0, 0),
(5, 'Friendly DVD', 'DVD', 0, 0, 1, 7.99, 0, 0),
(6, 'Family DVD', 'DVD', 0, 0, 2, 11.99, 0, 0),
(7, 'Individual Plan', 'streaming', 1, 1, 0, 0.00, 0, 0),
(8, 'Friendly Plan', 'streaming', 2, 2, 0, 0.00, 1, 0),
(9, 'Family Plan', 'streaming', 4, 4, 0, 0.00, 1, 1),
(10, 'Individual DVD', 'DVD', 0, 0, 1, 4.99, 0, 0),
(11, 'Friendly DVD', 'DVD', 0, 0, 1, 7.99, 0, 0),
(12, 'Family DVD', 'DVD', 0, 0, 2, 11.99, 0, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `plan_id` (`plan_id`);

--
-- Indexes for table `customer_dvd_rental`
--
ALTER TABLE `customer_dvd_rental`
  ADD PRIMARY KEY (`cdr_id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `movie_id` (`movie_id`);

--
-- Indexes for table `customer_movie_stream`
--
ALTER TABLE `customer_movie_stream`
  ADD PRIMARY KEY (`cms_id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `movie_id` (`movie_id`);

--
-- Indexes for table `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`movie_id`);

--
-- Indexes for table `plans`
--
ALTER TABLE `plans`
  ADD PRIMARY KEY (`plan_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `customer_dvd_rental`
--
ALTER TABLE `customer_dvd_rental`
  MODIFY `cdr_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `customer_movie_stream`
--
ALTER TABLE `customer_movie_stream`
  MODIFY `cms_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `movies`
--
ALTER TABLE `movies`
  MODIFY `movie_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `plans`
--
ALTER TABLE `plans`
  MODIFY `plan_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `customers_ibfk_1` FOREIGN KEY (`plan_id`) REFERENCES `plans` (`plan_id`);

--
-- Constraints for table `customer_dvd_rental`
--
ALTER TABLE `customer_dvd_rental`
  ADD CONSTRAINT `customer_dvd_rental_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`),
  ADD CONSTRAINT `customer_dvd_rental_ibfk_2` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`movie_id`);

--
-- Constraints for table `customer_movie_stream`
--
ALTER TABLE `customer_movie_stream`
  ADD CONSTRAINT `customer_movie_stream_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`),
  ADD CONSTRAINT `customer_movie_stream_ibfk_2` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`movie_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

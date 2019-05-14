-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: sophia
-- Generation Time: Nov 05, 2018 at 12:24 AM
-- Server version: 5.7.24-0ubuntu0.18.04.1
-- PHP Version: 7.2.10-0ubuntu0.18.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hfmchu`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendancelist`
--

CREATE TABLE `attendancelist` (
  `id` int(11) NOT NULL,
  `studentname` varchar(256) DEFAULT NULL,
  `major` varchar(256) DEFAULT NULL,
  `course` varchar(256) DEFAULT NULL,
  `coursedate` date DEFAULT NULL,
  `attendOrNot` varchar(7) NOT NULL DEFAULT 'PRESENT'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `attendancelist`
--

INSERT INTO `attendancelist` (`id`, `studentname`, `major`, `course`, `coursedate`, `attendOrNot`) VALUES
(1, 'Alice', 'BEng', 'COMP3322', '2018-10-15', 'PRESENT'),
(2, 'Bob', 'BEcon', 'COMP3327', '2018-10-16', 'PRESENT'),
(3, 'Charlie', 'BBA', 'COMP3329', '2018-10-11', 'PRESENT'),
(4, 'Dave', 'BBA', 'COMP3322', '2018-10-12', 'PRESENT'),
(5, 'Eve', 'BJ', 'COMP3403', '2018-10-15', 'PRESENT'),
(6, 'Issac', 'BEng', 'COMP3403', '2018-10-16', 'PRESENT');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendancelist`
--
ALTER TABLE `attendancelist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attendancelist`
--
ALTER TABLE `attendancelist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

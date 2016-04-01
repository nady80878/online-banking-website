-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 01, 2016 at 05:54 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `atm_db`
--
--
-- Database: `bnk`
--

-- --------------------------------------------------------

--
-- Table structure for table `deposit`
--
-- in use(#1146 - Table 'bnk.deposit' doesn't exist)
-- Error reading data: (#1146 - Table 'bnk.deposit' doesn't exist)

-- --------------------------------------------------------

--
-- Table structure for table `process`
--
-- in use(#1146 - Table 'bnk.process' doesn't exist)
-- Error reading data: (#1146 - Table 'bnk.process' doesn't exist)

-- --------------------------------------------------------

--
-- Table structure for table `transfer`
--
-- in use(#1146 - Table 'bnk.transfer' doesn't exist)
-- Error reading data: (#1146 - Table 'bnk.transfer' doesn't exist)

-- --------------------------------------------------------

--
-- Table structure for table `users`
--
-- in use(#1146 - Table 'bnk.users' doesn't exist)
-- Error reading data: (#1146 - Table 'bnk.users' doesn't exist)

-- --------------------------------------------------------

--
-- Table structure for table `withdraw`
--
-- in use(#1146 - Table 'bnk.withdraw' doesn't exist)
-- Error reading data: (#1146 - Table 'bnk.withdraw' doesn't exist)
--
-- Database: `chatty`
--

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--
-- in use(#1146 - Table 'chatty.migrations' doesn't exist)
-- Error reading data: (#1146 - Table 'chatty.migrations' doesn't exist)

-- --------------------------------------------------------

--
-- Table structure for table `users`
--
-- in use(#1146 - Table 'chatty.users' doesn't exist)
-- Error reading data: (#1146 - Table 'chatty.users' doesn't exist)
--
-- Database: `coolcode`
--

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `firstname` varchar(20) NOT NULL,
  `lastname` varchar(20) DEFAULT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(70) NOT NULL,
  `email` varchar(50) NOT NULL,
  `gender` varchar(6) NOT NULL,
  `type` varchar(6) NOT NULL,
  `timestamp` bigint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`firstname`, `lastname`, `username`, `password`, `email`, `gender`, `type`, `timestamp`) VALUES
('nady', 'shalaby', 'nady80878', '$2y$10$kG.Y9rUw96TQ/plUNghJ3.t2FpVPv8.D.ZGRD0qK3waOu0DFLbCyu', 'nady80878@gmail.com', 'male', 'normal', 1444657994),
('hadeer', 'shalaby', 'hadeer', '$2y$10$dolhBbtW8rdu20dqCo/e2.nIHnblpoykhzAuZPqGBCnsK6L2Zez82', 'hadeer@gmail.com', 'female', 'normal', 1444837892);
--
-- Database: `laravel`
--
--
-- Database: `login_register`
--

-- --------------------------------------------------------

--
-- Table structure for table `users`
--
-- in use(#1146 - Table 'login_register.users' doesn't exist)
-- Error reading data: (#1146 - Table 'login_register.users' doesn't exist)
--
-- Database: `test`
--

-- --------------------------------------------------------

--
-- Table structure for table `product`
--
-- in use(#1146 - Table 'test.product' doesn't exist)
-- Error reading data: (#1146 - Table 'test.product' doesn't exist)

-- --------------------------------------------------------

--
-- Table structure for table `student`
--
-- in use(#1146 - Table 'test.student' doesn't exist)
-- Error reading data: (#1146 - Table 'test.student' doesn't exist)

-- --------------------------------------------------------

--
-- Table structure for table `teacher`
--
-- in use(#1146 - Table 'test.teacher' doesn't exist)
-- Error reading data: (#1146 - Table 'test.teacher' doesn't exist)

-- --------------------------------------------------------

--
-- Table structure for table `users`
--
-- in use(#1146 - Table 'test.users' doesn't exist)
-- Error reading data: (#1146 - Table 'test.users' doesn't exist)
--
-- Database: `yadawi`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--
-- in use(#1146 - Table 'yadawi.category' doesn't exist)
-- Error reading data: (#1146 - Table 'yadawi.category' doesn't exist)

-- --------------------------------------------------------

--
-- Table structure for table `items`
--
-- in use(#1146 - Table 'yadawi.items' doesn't exist)
-- Error reading data: (#1146 - Table 'yadawi.items' doesn't exist)

-- --------------------------------------------------------

--
-- Table structure for table `sub_category`
--
-- in use(#1146 - Table 'yadawi.sub_category' doesn't exist)
-- Error reading data: (#1146 - Table 'yadawi.sub_category' doesn't exist)

-- --------------------------------------------------------

--
-- Table structure for table `type`
--
-- in use(#1146 - Table 'yadawi.type' doesn't exist)
-- Error reading data: (#1146 - Table 'yadawi.type' doesn't exist)

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `username` varchar(30) NOT NULL,
  `fullname` varchar(70) DEFAULT NULL,
  `password` varchar(60) NOT NULL,
  `email` varchar(40) NOT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `company` varchar(30) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `fax` varchar(30) DEFAULT NULL,
  `country` varchar(30) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL,
  `state` varchar(30) DEFAULT NULL,
  `zip_code` varchar(10) DEFAULT NULL,
  `street_address` text,
  `avatar` blob,
  `description` text,
  `cover` longblob,
  PRIMARY KEY (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users_facebook`
--
-- in use(#1146 - Table 'yadawi.users_facebook' doesn't exist)
-- Error reading data: (#1146 - Table 'yadawi.users_facebook' doesn't exist)

-- --------------------------------------------------------

--
-- Table structure for table `users_google`
--
-- in use(#1146 - Table 'yadawi.users_google' doesn't exist)
-- Error reading data: (#1146 - Table 'yadawi.users_google' doesn't exist)

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

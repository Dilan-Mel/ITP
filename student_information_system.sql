-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 18, 2017 at 05:28 AM
-- Server version: 5.6.12-log
-- PHP Version: 5.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `student information system`
--
CREATE DATABASE IF NOT EXISTS `student information system` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `student information system`;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  PRIMARY KEY (`aid`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`aid`, `name`, `username`, `password`) VALUES
(1, 'Amal', 'amal', 'amal123'),
(2, 'Kamal', 'kamal', 'kamal123'),
(3, 'Bimal', 'bimal', 'bimal123'),
(4, 'Nimal', 'nimal', 'nimal123');

-- --------------------------------------------------------

--
-- Table structure for table `attendence`
--

CREATE TABLE IF NOT EXISTS `attendence` (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `sid` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `prsent_days` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`aid`),
  KEY `sid` (`sid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `attendence`
--

INSERT INTO `attendence` (`aid`, `sid`, `name`, `prsent_days`) VALUES
(1, 1, 'Madushan', 1),
(2, 2, 'Chethiya', 2),
(3, 3, 'Gihan', 1),
(4, 4, 'Mel', 3),
(5, 5, 'Sahan', 2);

-- --------------------------------------------------------

--
-- Table structure for table `results`
--

CREATE TABLE IF NOT EXISTS `results` (
  `rid` int(11) NOT NULL AUTO_INCREMENT,
  `sid` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `Maths` varchar(1) DEFAULT NULL,
  `IT` varchar(1) DEFAULT NULL,
  `Physics` varchar(1) DEFAULT NULL,
  `Commerce` varchar(1) DEFAULT NULL,
  `Bio` varchar(1) DEFAULT NULL,
  `Chemistry` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`rid`),
  UNIQUE KEY `sid` (`sid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `results`
--

INSERT INTO `results` (`rid`, `sid`, `name`, `Maths`, `IT`, `Physics`, `Commerce`, `Bio`, `Chemistry`) VALUES
(1, 1, 'Madushan', 'A', 'A', 'B', 'A', 'A', 'A'),
(2, 2, 'Chethiya', 'B', 'C', 'A', 'A', 'B', 'A'),
(3, 3, 'Gihan', 'A', 'A', 'A', 'C', 'B', 'B'),
(4, 4, 'Mel', 'A', 'A', 'A', 'B', 'A', 'A'),
(5, 5, 'Sahan', 'A', 'C', 'A', 'B', 'A', 'C');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE IF NOT EXISTS `student` (
  `sid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `address` varchar(30) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `class` varchar(11) NOT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`sid`, `name`, `address`, `phone`, `class`) VALUES
(1, 'Madushan', '78Z Malabe', '0729865321', '11B'),
(2, 'Chethiya', '15B Ampitiya, Kandy', '0779056214', '11C'),
(3, 'Gihan', '12A Penideniya, Kandy', '0811489527', '11B'),
(4, 'Mel', '159H Colombo', '0119874562', '11D'),
(5, 'Sahan', '154B Kandy', '0112365478', '11D');

-- --------------------------------------------------------

--
-- Table structure for table `teacher`
--

CREATE TABLE IF NOT EXISTS `teacher` (
  `tid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `nic` varchar(10) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `address` varchar(30) NOT NULL,
  PRIMARY KEY (`tid`),
  UNIQUE KEY `nic` (`nic`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=22 ;

--
-- Dumping data for table `teacher`
--

INSERT INTO `teacher` (`tid`, `name`, `username`, `password`, `nic`, `phone`, `address`) VALUES
(1, 'Jack', 'jack', 'jack123', '123456789v', '0757845126', '12A Colombo'),
(2, 'Jill', 'jill', 'jill123', '987456121v', '0119845326', '15C Colombo'),
(3, 'John', 'john', 'john123', '789456123v', '0271234568', '16W Ampara'),
(4, 'James', 'james', 'james123', '987654213v', '0777894562', '17Z Kandy'),
(5, 'Jenny', 'jenny', 'jenny123', '965478213V', '0112365478', '178A Gampola');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attendence`
--
ALTER TABLE `attendence`
  ADD CONSTRAINT `fk_attsid` FOREIGN KEY (`sid`) REFERENCES `student` (`sid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `results`
--
ALTER TABLE `results`
  ADD CONSTRAINT `fk_resultsid` FOREIGN KEY (`sid`) REFERENCES `student` (`sid`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

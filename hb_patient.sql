-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 07, 2018 at 10:28 AM
-- Server version: 5.7.14
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `iblis`
--

-- --------------------------------------------------------

--
-- Table structure for table `hb_patient`
--

CREATE TABLE `hb_patient` (
  `id` int(11) UNSIGNED NOT NULL,
  `facilityid` int(11) UNSIGNED DEFAULT NULL,
  `hubid` int(11) UNSIGNED DEFAULT NULL,
  `districtid` int(11) UNSIGNED DEFAULT NULL,
  `locatorid` varchar(250) NOT NULL,
  `otherid` int(11) UNSIGNED NOT NULL,
  `patientname` varchar(250) NOT NULL,
  `patientid` varchar(250) NOT NULL,
  `sex` tinyint(3) UNSIGNED NOT NULL,
  `age` decimal(10,2) UNSIGNED DEFAULT NULL,
  `telephonenumber` varchar(13) DEFAULT NULL,
  `hbeagresult` tinyint(3) UNSIGNED NOT NULL,
  `hbsagresult` tinyint(3) UNSIGNED NOT NULL,
  `hbdiagonosisdate` datetime NOT NULL,
  `hbaltvalue` decimal(4,3) UNSIGNED DEFAULT NULL,
  `hbastvalue` decimal(4,3) UNSIGNED DEFAULT NULL,
  `hbplateletcount` decimal(4,3) UNSIGNED DEFAULT NULL,
  `asltorpltgreaterthantwo` tinyint(3) UNSIGNED NOT NULL,
  `fetalprotainvalue` varchar(250) DEFAULT NULL,
  `otherhbpreliminaryfindings` blob,
  `coinfectionhivhbsag` tinyint(3) UNSIGNED NOT NULL,
  `coinfectionhdvhbsag` tinyint(3) UNSIGNED NOT NULL,
  `coinfectionhcvhbsag` tinyint(3) UNSIGNED NOT NULL,
  `otherhbconinfections` varchar(250) DEFAULT NULL,
  `isonhptreatment` tinyint(3) UNSIGNED NOT NULL,
  `hbinitiationdate` datetime DEFAULT NULL,
  `hbdrudtype` tinyint(3) UNSIGNED NOT NULL,
  `isonhivtreatment` tinyint(3) UNSIGNED NOT NULL,
  `hivinitiationdate` datetime DEFAULT NULL,
  `hivdrugtype` tinyint(3) UNSIGNED NOT NULL,
  `lastroutineviralloaddate` datetime DEFAULT NULL,
  `lastroutineviralloadsampletype` tinyint(3) UNSIGNED NOT NULL,
  `lastroutineviralloadvalue` varchar(250) DEFAULT NULL,
  `lastrepeatviralloaddate` datetime DEFAULT NULL,
  `lastrepeatviralloadvalue` varchar(250) DEFAULT NULL,
  `lastrepeatviralloadsampletype` tinyint(3) UNSIGNED NOT NULL,
  `samplecollectiondate` datetime DEFAULT NULL,
  `sampletypecollected` tinyint(3) UNSIGNED NOT NULL,
  `samplereceptiondate` datetime DEFAULT NULL,
  `labtechnitian` varchar(250) DEFAULT NULL,
  `createdby` int(11) UNSIGNED DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `lastupdatedby` int(11) DEFAULT NULL,
  `deleted_at` datetime NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hb_patient`
--

INSERT INTO `hb_patient` (`id`, `facilityid`, `hubid`, `districtid`, `locatorid`, `otherid`, `patientname`, `patientid`, `sex`, `age`, `telephonenumber`, `hbeagresult`, `hbsagresult`, `hbdiagonosisdate`, `hbaltvalue`, `hbastvalue`, `hbplateletcount`, `asltorpltgreaterthantwo`, `fetalprotainvalue`, `otherhbpreliminaryfindings`, `coinfectionhivhbsag`, `coinfectionhdvhbsag`, `coinfectionhcvhbsag`, `otherhbconinfections`, `isonhptreatment`, `hbinitiationdate`, `hbdrudtype`, `isonhivtreatment`, `hivinitiationdate`, `hivdrugtype`, `lastroutineviralloaddate`, `lastroutineviralloadsampletype`, `lastroutineviralloadvalue`, `lastrepeatviralloaddate`, `lastrepeatviralloadvalue`, `lastrepeatviralloadsampletype`, `samplecollectiondate`, `sampletypecollected`, `samplereceptiondate`, `labtechnitian`, `createdby`, `created_at`, `updated_at`, `lastupdatedby`, `deleted_at`, `status`) VALUES
(1, 1974, 4, 1, '844-fi', 4294967295, 'Patientc', '657449', 2, '78.00', '0702859491', 1, 2, '2018-02-13 00:00:00', '0.320', '0.430', '0.859', 0, '0.908', 0x6e6f6e65, 1, 1, 1, 'afdasf', 1, '2018-02-19 00:00:00', 4, 1, '2018-02-12 00:00:00', 1, '2018-02-21 00:00:00', 1, '0.879', '2018-02-15 00:00:00', '0.987', 1, '2018-02-06 00:00:00', 1, '2018-02-21 00:00:00', 'Jackie', 1, '2018-02-03 09:44:57', '2018-02-03 09:44:57', NULL, '0000-00-00 00:00:00', 0),
(3, 1209, 10, 2, '68486', 4294967295, 'Kasimula', '4', 2, '8.00', '0701370078', 1, 1, '2018-02-14 00:00:00', '0.658', '0.435', '0.640', 1, '0.453', 0x6173, 1, 0, 1, '', 0, '2018-02-14 00:00:00', 2, 1, '2018-02-28 00:00:00', 0, '2018-02-14 00:00:00', 1, '0.54', '2018-02-14 00:00:00', '0.467', 2, '2018-02-21 00:00:00', 1, '2018-02-21 00:00:00', 'Pasit', 1, '2018-02-03 10:49:18', '2018-02-05 13:04:51', NULL, '0000-00-00 00:00:00', 1),
(4, 47, 31, 3, '958485-0', 4294967295, 'kantint', '860000', 1, '67.00', '0779507910', 1, 2, '2018-02-01 00:00:00', '0.670', '0.679', '0.674', 0, '0.68', '', 0, 1, 0, '', 0, '2018-02-02 00:00:00', 2, 0, '2018-02-02 00:00:00', 0, '2018-02-01 00:00:00', 1, '0.45', '2018-02-14 00:00:00', '0.54', 1, '2018-02-08 00:00:00', 2, '2018-02-21 00:00:00', 'allan', 2, '2018-02-07 13:21:22', '2018-02-07 13:21:22', NULL, '0000-00-00 00:00:00', 0),
(5, 47, 31, 3, '58674', 95941, 'Patint', '870000', 2, '71.00', '0709486747', 1, 2, '2018-02-07 13:23:25', '0.996', '0.098', '0.099', 1, '0.98', NULL, 1, 0, 1, NULL, 4, '2018-02-07 13:24:41', 2, 1, '2018-02-07 13:24:49', 1, '2018-02-07 13:25:02', 1, '0.65', '2018-02-07 13:25:10', '0.98', 1, '2018-02-07 13:25:22', 1, '2018-02-07 13:25:30', 'Martha', 1, '2018-02-07 13:25:40', '2018-02-07 13:25:47', NULL, '2018-02-07 13:25:47', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `hb_patient`
--
ALTER TABLE `hb_patient`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `hb_patient`
--
ALTER TABLE `hb_patient`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

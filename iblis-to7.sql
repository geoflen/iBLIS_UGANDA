-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 22, 2018 at 05:18 PM
-- Server version: 5.7.14
-- PHP Version: 7.0.10

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
-- Table structure for table `adhoc_configs`
--

DROP TABLE IF EXISTS `adhoc_configs`;
CREATE TABLE `adhoc_configs` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `option` int(10) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `adhoc_configs`
--

INSERT INTO `adhoc_configs` (`id`, `name`, `option`) VALUES
(1, 'Report', 1),
(2, 'ULIN', 1),
(3, 'Clinician_UI', 2);

-- --------------------------------------------------------

--
-- Table structure for table `analytic_specimen_rejections`
--

DROP TABLE IF EXISTS `analytic_specimen_rejections`;
CREATE TABLE `analytic_specimen_rejections` (
  `id` int(10) UNSIGNED NOT NULL,
  `test_id` int(10) UNSIGNED NOT NULL,
  `specimen_id` int(10) UNSIGNED NOT NULL,
  `rejected_by` int(10) UNSIGNED NOT NULL,
  `rejection_reason_id` int(10) UNSIGNED DEFAULT NULL,
  `reject_explained_to` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `time_rejected` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `analytic_specimen_rejection_reasons`
--

DROP TABLE IF EXISTS `analytic_specimen_rejection_reasons`;
CREATE TABLE `analytic_specimen_rejection_reasons` (
  `id` int(10) UNSIGNED NOT NULL,
  `specimen_id` int(10) UNSIGNED NOT NULL,
  `rejection_id` int(10) UNSIGNED NOT NULL,
  `reason_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `assigned_roles`
--

DROP TABLE IF EXISTS `assigned_roles`;
CREATE TABLE `assigned_roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `assigned_roles`
--

INSERT INTO `assigned_roles` (`id`, `user_id`, `role_id`) VALUES
(1, 1, 1),
(2, 1, 1),
(3, 2, 4),
(4, 1, 1),
(5, 2, 4),
(6, 3, 5),
(7, 1, 1),
(8, 2, 4),
(13, 3, 5),
(10, 3, 5),
(11, 1, 1),
(12, 2, 4),
(14, 1, 1),
(15, 2, 4),
(16, 3, 5),
(17, 4, 6);

-- --------------------------------------------------------

--
-- Table structure for table `barcode_settings`
--

DROP TABLE IF EXISTS `barcode_settings`;
CREATE TABLE `barcode_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `encoding_format` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `barcode_width` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `barcode_height` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `text_size` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `barcode_settings`
--

INSERT INTO `barcode_settings` (`id`, `encoding_format`, `barcode_width`, `barcode_height`, `text_size`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'code39', '2', '30', '11', NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25');

-- --------------------------------------------------------

--
-- Table structure for table `commodities`
--

DROP TABLE IF EXISTS `commodities`;
CREATE TABLE `commodities` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `metric_id` int(10) UNSIGNED NOT NULL,
  `unit_price` decimal(8,2) NOT NULL,
  `item_code` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `storage_req` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `min_level` int(11) NOT NULL,
  `max_level` int(11) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `controls`
--

DROP TABLE IF EXISTS `controls`;
CREATE TABLE `controls` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lot_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `control_measures`
--

DROP TABLE IF EXISTS `control_measures`;
CREATE TABLE `control_measures` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `unit` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `control_id` int(10) UNSIGNED NOT NULL,
  `control_measure_type_id` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `control_measure_ranges`
--

DROP TABLE IF EXISTS `control_measure_ranges`;
CREATE TABLE `control_measure_ranges` (
  `id` int(10) UNSIGNED NOT NULL,
  `upper_range` decimal(6,2) DEFAULT NULL,
  `lower_range` decimal(6,2) DEFAULT NULL,
  `alphanumeric` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `control_measure_id` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `control_results`
--

DROP TABLE IF EXISTS `control_results`;
CREATE TABLE `control_results` (
  `id` int(10) UNSIGNED NOT NULL,
  `results` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `control_measure_id` int(10) UNSIGNED NOT NULL,
  `control_test_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `control_tests`
--

DROP TABLE IF EXISTS `control_tests`;
CREATE TABLE `control_tests` (
  `id` int(10) UNSIGNED NOT NULL,
  `entered_by` int(10) UNSIGNED NOT NULL,
  `control_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `culture_durations`
--

DROP TABLE IF EXISTS `culture_durations`;
CREATE TABLE `culture_durations` (
  `id` int(10) UNSIGNED NOT NULL,
  `duration` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `culture_observations`
--

DROP TABLE IF EXISTS `culture_observations`;
CREATE TABLE `culture_observations` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `test_id` int(10) UNSIGNED NOT NULL,
  `observation` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `daily_alphanumeric_counts`
--

DROP TABLE IF EXISTS `daily_alphanumeric_counts`;
CREATE TABLE `daily_alphanumeric_counts` (
  `id` int(10) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `daily_test_type_count_id` int(10) UNSIGNED NOT NULL,
  `measure_id` int(10) UNSIGNED NOT NULL,
  `measure_range_id` int(10) UNSIGNED NOT NULL,
  `result_interpretation_id` int(10) UNSIGNED DEFAULT NULL,
  `count` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `daily_gram_stain_result_counts`
--

DROP TABLE IF EXISTS `daily_gram_stain_result_counts`;
CREATE TABLE `daily_gram_stain_result_counts` (
  `id` int(10) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `daily_test_type_count_id` int(10) UNSIGNED NOT NULL,
  `gram_stain_range_id` int(10) UNSIGNED NOT NULL,
  `count` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `daily_hiv_counts`
--

DROP TABLE IF EXISTS `daily_hiv_counts`;
CREATE TABLE `daily_hiv_counts` (
  `id` int(10) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `daily_test_type_count_id` int(10) UNSIGNED NOT NULL,
  `purpose` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `count` int(10) UNSIGNED NOT NULL,
  `measure_id` int(10) UNSIGNED DEFAULT NULL,
  `measure_range_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `daily_negative_cultures`
--

DROP TABLE IF EXISTS `daily_negative_cultures`;
CREATE TABLE `daily_negative_cultures` (
  `id` int(10) UNSIGNED NOT NULL,
  `organism_id` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `daily_negative_gram_stains`
--

DROP TABLE IF EXISTS `daily_negative_gram_stains`;
CREATE TABLE `daily_negative_gram_stains` (
  `id` int(10) UNSIGNED NOT NULL,
  `gram_stain_range_id` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `daily_numeric_range_counts`
--

DROP TABLE IF EXISTS `daily_numeric_range_counts`;
CREATE TABLE `daily_numeric_range_counts` (
  `id` int(10) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `daily_test_type_count_id` int(10) UNSIGNED NOT NULL,
  `measure_id` int(10) UNSIGNED NOT NULL,
  `result` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `result_interpretation_id` int(10) UNSIGNED DEFAULT NULL,
  `count` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `daily_organism_counts`
--

DROP TABLE IF EXISTS `daily_organism_counts`;
CREATE TABLE `daily_organism_counts` (
  `id` int(10) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `daily_test_type_count_id` int(10) UNSIGNED NOT NULL,
  `organism_id` int(10) UNSIGNED NOT NULL,
  `result_interpretation_id` int(10) UNSIGNED DEFAULT NULL,
  `count` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `daily_rejection_reason_counts`
--

DROP TABLE IF EXISTS `daily_rejection_reason_counts`;
CREATE TABLE `daily_rejection_reason_counts` (
  `id` int(10) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `daily_specimen_count_id` int(10) UNSIGNED NOT NULL,
  `reason_id` int(10) UNSIGNED NOT NULL,
  `count` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `daily_specimen_counts`
--

DROP TABLE IF EXISTS `daily_specimen_counts`;
CREATE TABLE `daily_specimen_counts` (
  `id` int(10) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `all` int(10) UNSIGNED NOT NULL,
  `accepted` int(10) UNSIGNED NOT NULL,
  `rejected` int(10) UNSIGNED NOT NULL,
  `referred_in` int(10) UNSIGNED DEFAULT NULL,
  `referred_out` int(10) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `daily_specimen_type_counts`
--

DROP TABLE IF EXISTS `daily_specimen_type_counts`;
CREATE TABLE `daily_specimen_type_counts` (
  `id` int(10) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `daily_specimen_count_id` int(10) UNSIGNED NOT NULL,
  `specimen_type_id` int(10) UNSIGNED NOT NULL,
  `all` int(10) UNSIGNED NOT NULL,
  `accepted` int(10) UNSIGNED NOT NULL,
  `rejected` int(10) UNSIGNED NOT NULL,
  `referred_in` int(10) UNSIGNED NOT NULL,
  `referred_out` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `daily_susceptibility_counts`
--

DROP TABLE IF EXISTS `daily_susceptibility_counts`;
CREATE TABLE `daily_susceptibility_counts` (
  `id` int(10) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `daily_organism_count_id` int(10) UNSIGNED NOT NULL,
  `antibiotic_id` int(10) UNSIGNED NOT NULL,
  `interpretation_id` int(10) UNSIGNED NOT NULL,
  `count` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `daily_test_counts`
--

DROP TABLE IF EXISTS `daily_test_counts`;
CREATE TABLE `daily_test_counts` (
  `id` int(10) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `all` int(10) UNSIGNED NOT NULL,
  `referred_in` int(10) UNSIGNED NOT NULL,
  `referred_out` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `daily_test_type_counts`
--

DROP TABLE IF EXISTS `daily_test_type_counts`;
CREATE TABLE `daily_test_type_counts` (
  `id` int(10) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `daily_test_count_id` int(10) UNSIGNED NOT NULL,
  `test_type_id` int(10) UNSIGNED NOT NULL,
  `age_upper_limit` int(10) UNSIGNED NOT NULL,
  `age_lower_limit` int(10) UNSIGNED NOT NULL,
  `gender` int(10) UNSIGNED NOT NULL,
  `all` int(10) UNSIGNED NOT NULL,
  `referred_in` int(10) UNSIGNED NOT NULL,
  `referred_out` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `daily_turn_around_time`
--

DROP TABLE IF EXISTS `daily_turn_around_time`;
CREATE TABLE `daily_turn_around_time` (
  `id` int(10) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `daily_test_type_count_id` int(10) UNSIGNED NOT NULL,
  `avg_reception_tostart` int(10) UNSIGNED NOT NULL,
  `avg_start_tocompletion` int(10) UNSIGNED NOT NULL,
  `avg_reception_tocompletion` int(10) UNSIGNED NOT NULL,
  `avg_start_tovarification` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `diseases`
--

DROP TABLE IF EXISTS `diseases`;
CREATE TABLE `diseases` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(60) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `diseases`
--

INSERT INTO `diseases` (`id`, `name`) VALUES
(1, 'Malaria'),
(2, 'Typhoid'),
(3, 'Shigella Dysentry');

-- --------------------------------------------------------

--
-- Table structure for table `district`
--

DROP TABLE IF EXISTS `district`;
CREATE TABLE `district` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `nr` mediumint(8) UNSIGNED NOT NULL,
  `districtcode` varchar(20) NOT NULL,
  `name` varchar(234) NOT NULL,
  `regionid` tinyint(3) UNSIGNED NOT NULL,
  `province` int(3) NOT NULL,
  `created` datetime NOT NULL,
  `createdby` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `district`
--

INSERT INTO `district` (`id`, `nr`, `districtcode`, `name`, `regionid`, `province`, `created`, `createdby`) VALUES
(1, 0, '', 'Abim', 12, 12, '0000-00-00 00:00:00', 'system'),
(2, 0, '', 'Adjumani', 14, 14, '0000-00-00 00:00:00', 'system'),
(3, 0, '', 'Amolatar', 10, 10, '0000-00-00 00:00:00', 'system'),
(4, 0, '', 'Amuria', 12, 12, '0000-00-00 00:00:00', 'system'),
(5, 0, '', 'Amuru', 10, 10, '0000-00-00 00:00:00', 'system'),
(6, 0, '', 'Apac', 10, 10, '0000-00-00 00:00:00', 'system'),
(7, 0, '', 'Arua', 14, 14, '0000-00-00 00:00:00', 'system'),
(8, 0, '', 'Budaka', 9, 9, '0000-00-00 00:00:00', 'system'),
(9, 0, '', 'Bududa', 9, 9, '0000-00-00 00:00:00', 'system'),
(10, 0, '', 'Bugiri', 7, 7, '0000-00-00 00:00:00', 'system'),
(11, 0, '', 'Buikwe ', 6, 6, '0000-00-00 00:00:00', 'system'),
(12, 0, '', 'Bukedea', 12, 12, '0000-00-00 00:00:00', 'system'),
(13, 0, '', 'Bukwo', 9, 9, '0000-00-00 00:00:00', 'system'),
(14, 0, '', 'Buliisa', 11, 11, '0000-00-00 00:00:00', 'system'),
(15, 0, '', 'Bundibugyo', 11, 11, '0000-00-00 00:00:00', 'system'),
(16, 0, '', 'Bushenyi', 13, 13, '0000-00-00 00:00:00', 'system'),
(17, 0, '', 'Busia', 9, 9, '0000-00-00 00:00:00', 'system'),
(18, 0, '', 'Butaleja', 9, 9, '0000-00-00 00:00:00', 'system'),
(19, 0, '', 'Buvuma', 6, 6, '0000-00-00 00:00:00', 'system'),
(20, 0, '', 'Buyende ', 7, 7, '0000-00-00 00:00:00', 'system'),
(22, 0, '', 'Dokolo', 10, 10, '0000-00-00 00:00:00', 'system'),
(23, 0, '', 'Gulu', 10, 10, '0000-00-00 00:00:00', 'system'),
(24, 0, '', 'Hoima', 11, 11, '0000-00-00 00:00:00', 'system'),
(25, 0, '', 'Ibanda', 13, 13, '0000-00-00 00:00:00', 'system'),
(26, 0, '', 'Iganga', 7, 7, '0000-00-00 00:00:00', 'system'),
(27, 0, '', 'Isingiro', 13, 13, '0000-00-00 00:00:00', 'system'),
(28, 0, '', 'Jinja', 7, 7, '0000-00-00 00:00:00', 'system'),
(29, 0, '', 'Kaabong ', 12, 12, '0000-00-00 00:00:00', 'system'),
(30, 0, '', 'Kabale', 13, 13, '0000-00-00 00:00:00', 'system'),
(31, 0, '', 'Kabarole', 11, 11, '0000-00-00 00:00:00', 'system'),
(32, 0, '', 'Kaberamaido', 12, 12, '0000-00-00 00:00:00', 'system'),
(33, 0, '', 'Kalangala', 5, 5, '0000-00-00 00:00:00', 'system'),
(34, 0, '', 'Kaliro', 7, 7, '0000-00-00 00:00:00', 'system'),
(35, 0, '', 'Kampala', 8, 8, '0000-00-00 00:00:00', 'system'),
(36, 0, '', 'Kamuli', 7, 7, '0000-00-00 00:00:00', 'system'),
(37, 0, '', 'Kamwenge', 11, 11, '0000-00-00 00:00:00', 'system'),
(38, 0, '', 'Kanungu', 13, 13, '0000-00-00 00:00:00', 'system'),
(39, 0, '', 'Kapchorwa', 9, 9, '0000-00-00 00:00:00', 'system'),
(40, 0, '', 'Kasese', 11, 11, '0000-00-00 00:00:00', 'system'),
(41, 0, '', 'Katakwi ', 12, 12, '0000-00-00 00:00:00', 'system'),
(42, 0, '', 'Kayunga', 6, 6, '0000-00-00 00:00:00', 'system'),
(43, 0, '', 'Kibaale', 11, 11, '0000-00-00 00:00:00', 'system'),
(44, 0, '', 'Kiboga', 6, 6, '0000-00-00 00:00:00', 'system'),
(45, 0, '', 'Kiruhura', 13, 13, '0000-00-00 00:00:00', 'system'),
(46, 0, '', 'Kisoro', 13, 13, '0000-00-00 00:00:00', 'system'),
(47, 0, '', 'Kitgum', 10, 10, '0000-00-00 00:00:00', 'system'),
(48, 0, '', 'Koboko', 14, 14, '0000-00-00 00:00:00', 'system'),
(49, 0, '', 'Kotido', 12, 12, '0000-00-00 00:00:00', 'system'),
(50, 0, '', 'Kumi', 12, 12, '0000-00-00 00:00:00', 'system'),
(51, 0, '', 'Kyegegwa', 11, 11, '0000-00-00 00:00:00', 'system'),
(52, 0, '', 'Kyenjojo', 11, 11, '0000-00-00 00:00:00', 'system'),
(53, 0, '', 'Lamwo', 10, 10, '0000-00-00 00:00:00', 'system'),
(54, 0, '', 'Lira', 10, 10, '0000-00-00 00:00:00', 'system'),
(55, 0, '', 'Luweero', 6, 6, '0000-00-00 00:00:00', 'system'),
(56, 0, '', 'Lyantonde', 5, 5, '0000-00-00 00:00:00', 'system'),
(57, 0, '', 'Manafwa', 9, 9, '0000-00-00 00:00:00', 'system'),
(58, 0, '', 'Maracha Terego', 14, 14, '0000-00-00 00:00:00', 'system'),
(59, 0, '', 'Masaka', 5, 5, '0000-00-00 00:00:00', 'system'),
(60, 0, '', 'Masindi ', 11, 11, '0000-00-00 00:00:00', 'system'),
(61, 0, '', 'Mayuge', 7, 7, '0000-00-00 00:00:00', 'system'),
(62, 0, '', 'Mbale', 9, 9, '0000-00-00 00:00:00', 'system'),
(63, 0, '', 'Mbarara', 13, 13, '0000-00-00 00:00:00', 'system'),
(64, 0, '', 'Mityana', 6, 6, '0000-00-00 00:00:00', 'system'),
(65, 0, '', 'Moroto', 12, 12, '0000-00-00 00:00:00', 'system'),
(66, 0, '', 'Moyo', 14, 14, '0000-00-00 00:00:00', 'system'),
(67, 0, '', 'Mpigi', 5, 5, '0000-00-00 00:00:00', 'system'),
(68, 0, '', 'Mubende', 6, 6, '0000-00-00 00:00:00', 'system'),
(69, 0, '', 'Mukono ', 6, 6, '0000-00-00 00:00:00', 'system'),
(70, 0, '', 'Nakapiripirit', 12, 12, '0000-00-00 00:00:00', 'system'),
(71, 0, '', 'Nakaseke', 6, 6, '0000-00-00 00:00:00', 'system'),
(72, 0, '', 'Nakasongola', 6, 6, '0000-00-00 00:00:00', 'system'),
(73, 0, '', 'Namutumba ', 7, 7, '0000-00-00 00:00:00', 'system'),
(74, 0, '', 'Nebbi', 14, 14, '0000-00-00 00:00:00', 'system'),
(75, 0, '', 'Ntungamo', 13, 13, '0000-00-00 00:00:00', 'system'),
(77, 0, '', 'Oyam', 10, 10, '0000-00-00 00:00:00', 'system'),
(78, 0, '', 'Pader', 10, 10, '0000-00-00 00:00:00', 'system'),
(79, 0, '', 'Pallisa', 9, 9, '0000-00-00 00:00:00', 'system'),
(80, 0, '', 'Rakai', 5, 5, '0000-00-00 00:00:00', 'system'),
(81, 0, '', 'Rukungiri', 13, 13, '0000-00-00 00:00:00', 'system'),
(82, 0, '', 'Ssembabule', 5, 5, '0000-00-00 00:00:00', 'system'),
(83, 0, '', 'Sironko', 9, 9, '0000-00-00 00:00:00', 'system'),
(84, 0, '', 'Soroti', 12, 12, '0000-00-00 00:00:00', 'system'),
(85, 0, '', 'Tororo', 9, 9, '0000-00-00 00:00:00', 'system'),
(86, 0, '', 'Wakiso', 5, 5, '0000-00-00 00:00:00', 'system'),
(87, 0, '', 'Yumbe', 14, 14, '0000-00-00 00:00:00', 'system'),
(88, 0, '', 'Butambala', 5, 5, '0000-00-00 00:00:00', 'system'),
(89, 0, '', 'Gomba', 5, 5, '0000-00-00 00:00:00', 'system'),
(90, 0, '', 'Kalungu', 5, 5, '0000-00-00 00:00:00', 'system'),
(91, 0, '', 'Kyankwanzi', 6, 6, '0000-00-00 00:00:00', 'system'),
(92, 0, '', 'Lwengo', 5, 5, '0000-00-00 00:00:00', 'system'),
(93, 0, '', 'Bukomansimbi', 5, 5, '0000-00-00 00:00:00', 'system'),
(94, 0, '', 'Bulambuli', 9, 9, '0000-00-00 00:00:00', 'system'),
(95, 0, '', 'Kibuku', 9, 9, '0000-00-00 00:00:00', 'system'),
(96, 0, '', 'Kween', 9, 9, '0000-00-00 00:00:00', 'system'),
(97, 0, '', 'Luuka', 7, 7, '0000-00-00 00:00:00', 'system'),
(98, 0, '', 'Namayingo', 7, 7, '0000-00-00 00:00:00', 'system'),
(99, 0, '', 'Ngora', 12, 12, '0000-00-00 00:00:00', 'system'),
(100, 0, '', 'Serere', 12, 12, '0000-00-00 00:00:00', 'system'),
(101, 0, '', 'Agago', 10, 10, '0000-00-00 00:00:00', 'system'),
(102, 0, '', 'Alebtong', 10, 10, '0000-00-00 00:00:00', 'system'),
(103, 0, '', 'Amudat', 12, 12, '0000-00-00 00:00:00', 'system'),
(104, 0, '', 'Kole', 10, 10, '0000-00-00 00:00:00', 'system'),
(105, 0, '', 'Napak', 12, 12, '0000-00-00 00:00:00', 'system'),
(106, 0, '', 'Nwoya', 10, 10, '0000-00-00 00:00:00', 'system'),
(107, 0, '', 'Otuke', 10, 10, '0000-00-00 00:00:00', 'system'),
(108, 0, '', 'Zombo', 14, 14, '0000-00-00 00:00:00', 'system'),
(109, 0, '', 'Buhweju', 13, 13, '0000-00-00 00:00:00', 'system'),
(110, 0, '', 'Kiryandongo', 11, 11, '0000-00-00 00:00:00', 'system'),
(111, 0, '', 'Mitooma', 13, 13, '0000-00-00 00:00:00', 'system'),
(112, 0, '', 'Ntoroko', 11, 11, '0000-00-00 00:00:00', 'system'),
(113, 0, '', 'Rubirizi', 13, 13, '0000-00-00 00:00:00', 'system'),
(114, 0, '', 'Sheema', 13, 13, '0000-00-00 00:00:00', 'system');

-- --------------------------------------------------------

--
-- Table structure for table `drugs`
--

DROP TABLE IF EXISTS `drugs`;
CREATE TABLE `drugs` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `drugs`
--

INSERT INTO `drugs` (`id`, `name`, `description`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Amikacin', NULL, NULL, '2017-05-31 14:29:37', '2017-05-31 14:29:37'),
(2, 'Ampicillin', NULL, NULL, '2017-05-31 14:29:38', '2017-05-31 14:29:38'),
(3, 'Augmentin', NULL, NULL, '2017-05-31 14:29:38', '2017-05-31 14:29:38'),
(4, 'Cefotaxime', NULL, NULL, '2017-05-31 14:29:38', '2017-05-31 14:29:38'),
(5, 'Ceftazidime', NULL, NULL, '2017-05-31 14:29:38', '2017-05-31 14:29:38'),
(6, 'Ceftriaxone', NULL, NULL, '2017-05-31 14:29:39', '2017-05-31 14:29:39'),
(7, 'Ceftizoxime', NULL, NULL, '2017-05-31 14:29:39', '2017-05-31 14:29:39'),
(8, 'Cefuroxime', NULL, NULL, '2017-05-31 14:29:39', '2017-05-31 14:29:39'),
(9, 'Cefuroxime oral', NULL, NULL, '2017-05-31 14:29:39', '2017-05-31 14:29:39'),
(10, 'Chloramphenicol', NULL, NULL, '2017-05-31 14:29:39', '2017-05-31 14:29:39'),
(11, 'Ciprofloxacin', NULL, NULL, '2017-05-31 14:29:39', '2017-05-31 14:29:39'),
(12, 'Co-trimoxazole', NULL, NULL, '2017-05-31 14:29:39', '2017-05-31 14:29:39'),
(13, 'Gentamicin', NULL, NULL, '2017-05-31 14:29:39', '2017-05-31 14:29:39'),
(14, 'Imipenem', NULL, NULL, '2017-05-31 14:29:40', '2017-05-31 14:29:40'),
(15, 'Meropenem', NULL, NULL, '2017-05-31 14:29:40', '2017-05-31 14:29:40'),
(16, 'Nalidixic acid', NULL, NULL, '2017-05-31 14:29:40', '2017-05-31 14:29:40'),
(17, 'Peperacillintazobactam', NULL, NULL, '2017-05-31 14:29:40', '2017-05-31 14:29:40'),
(18, 'Piperacillin', NULL, NULL, '2017-05-31 14:29:40', '2017-05-31 14:29:40'),
(19, 'Nitrofurantoin', NULL, NULL, '2017-05-31 14:29:40', '2017-05-31 14:29:40'),
(20, 'Trimethoprim', NULL, NULL, '2017-05-31 14:29:40', '2017-05-31 14:29:40'),
(21, 'Amoxycillin', NULL, NULL, '2017-05-31 14:29:41', '2017-05-31 14:29:41'),
(22, 'Cefepime', NULL, NULL, '2017-05-31 14:29:41', '2017-05-31 14:29:41'),
(23, 'Colistin', NULL, NULL, '2017-05-31 14:29:42', '2017-05-31 14:29:42'),
(24, 'Tetracycline', NULL, NULL, '2017-05-31 14:29:48', '2017-05-31 14:29:48'),
(25, 'Erythromycin', NULL, NULL, '2017-05-31 14:29:53', '2017-05-31 14:29:53'),
(26, 'Clindamycin', NULL, NULL, '2017-05-31 14:29:53', '2017-05-31 14:29:53'),
(27, 'Vancomycin', NULL, NULL, '2017-05-31 14:29:53', '2017-05-31 14:29:53'),
(28, 'Linezolid', NULL, NULL, '2017-05-31 14:29:53', '2017-05-31 14:29:53'),
(29, 'Penicillin G', NULL, NULL, '2017-05-31 14:29:53', '2017-05-31 14:29:53'),
(30, 'Cefoxitin', NULL, NULL, '2017-05-31 14:29:53', '2017-05-31 14:29:53'),
(31, 'Rifampicin', NULL, NULL, '2017-05-31 14:29:54', '2017-05-31 14:29:54'),
(32, 'Streptomycin', NULL, NULL, '2017-05-31 14:30:05', '2017-05-31 14:30:05'),
(33, 'Minocycline', NULL, NULL, '2017-05-31 14:30:08', '2017-05-31 14:30:08'),
(34, 'Cefexime', NULL, NULL, '2017-05-31 14:30:09', '2017-05-31 14:30:09'),
(35, 'spectinomycin', NULL, NULL, '2017-05-31 14:30:09', '2017-05-31 14:30:09'),
(36, 'Oxacillin', NULL, NULL, '2017-05-31 14:30:21', '2017-05-31 14:30:21'),
(37, 'Levofloxacin', NULL, NULL, '2017-05-31 14:30:54', '2017-05-31 14:30:54'),
(38, 'Cefuroxime Parentral', NULL, NULL, '2017-05-31 14:30:59', '2017-05-31 14:30:59'),
(39, 'High level Gentamicin', NULL, NULL, '2017-05-31 14:31:06', '2017-05-31 14:31:06');

-- --------------------------------------------------------

--
-- Table structure for table `drug_susceptibility`
--

DROP TABLE IF EXISTS `drug_susceptibility`;
CREATE TABLE `drug_susceptibility` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `drug_id` int(10) UNSIGNED NOT NULL,
  `isolated_organism_id` int(10) UNSIGNED NOT NULL,
  `drug_susceptibility_measure_id` int(10) UNSIGNED NOT NULL,
  `zone_diameter` int(10) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `drug_susceptibility_measures`
--

DROP TABLE IF EXISTS `drug_susceptibility_measures`;
CREATE TABLE `drug_susceptibility_measures` (
  `id` int(10) UNSIGNED NOT NULL,
  `symbol` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `interpretation` varchar(60) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `drug_susceptibility_measures`
--

INSERT INTO `drug_susceptibility_measures` (`id`, `symbol`, `interpretation`) VALUES
(1, 'S', 'Sensitive'),
(2, 'I', 'Intermediate'),
(3, 'R', 'Resistant');

-- --------------------------------------------------------

--
-- Table structure for table `equip_config`
--

DROP TABLE IF EXISTS `equip_config`;
CREATE TABLE `equip_config` (
  `id` int(10) UNSIGNED NOT NULL,
  `equip_id` int(10) UNSIGNED NOT NULL,
  `prop_id` int(10) UNSIGNED NOT NULL,
  `prop_value` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `external_dump`
--

DROP TABLE IF EXISTS `external_dump`;
CREATE TABLE `external_dump` (
  `id` int(10) UNSIGNED NOT NULL,
  `lab_no` int(11) NOT NULL,
  `parent_lab_no` int(11) NOT NULL,
  `test_id` int(11) DEFAULT NULL,
  `requesting_clinician` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `investigation` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `provisional_diagnosis` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `request_date` timestamp NULL DEFAULT NULL,
  `order_stage` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `result` text COLLATE utf8_unicode_ci,
  `result_returned` int(11) DEFAULT NULL,
  `patient_visit_number` int(11) DEFAULT NULL,
  `patient_id` int(11) NOT NULL,
  `full_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dob` datetime DEFAULT NULL,
  `gender` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `postal_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cost` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `receipt_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `receipt_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `waiver_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `system_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `external_users`
--

DROP TABLE IF EXISTS `external_users`;
CREATE TABLE `external_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `internal_user_id` int(10) UNSIGNED NOT NULL,
  `external_user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `facilities`
--

DROP TABLE IF EXISTS `facilities`;
CREATE TABLE `facilities` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `facility`
--

DROP TABLE IF EXISTS `facility`;
CREATE TABLE `facility` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `parentid` mediumint(8) UNSIGNED DEFAULT '0',
  `ipid` mediumint(8) UNSIGNED DEFAULT NULL,
  `code` varchar(250) DEFAULT NULL,
  `name` varchar(250) NOT NULL,
  `facilitylevelid` smallint(2) NOT NULL,
  `type` tinyint(3) UNSIGNED ZEROFILL DEFAULT NULL,
  `isactive` tinyint(3) UNSIGNED DEFAULT NULL,
  `districtid` mediumint(8) UNSIGNED NOT NULL,
  `regionid` int(11) UNSIGNED DEFAULT NULL,
  `hubid` mediumint(8) UNSIGNED NOT NULL,
  `healthregionid` mediumint(8) UNSIGNED DEFAULT NULL,
  `hubname` varchar(250) DEFAULT NULL,
  `phonenumber` varchar(20) DEFAULT NULL,
  `distancefromhub` decimal(10,2) UNSIGNED DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `contactperson` varchar(250) DEFAULT NULL,
  `address` text,
  `returnaddress` text,
  `longitude` decimal(10,6) DEFAULT NULL,
  `latitude` decimal(10,6) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `createdby` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `facility`
--

INSERT INTO `facility` (`id`, `parentid`, `ipid`, `code`, `name`, `facilitylevelid`, `type`, `isactive`, `districtid`, `regionid`, `hubid`, `healthregionid`, `hubname`, `phonenumber`, `distancefromhub`, `email`, `contactperson`, `address`, `returnaddress`, `longitude`, `latitude`, `created_at`, `updated_at`, `createdby`) VALUES
(2, 23, NULL, '0', 'Abako H/C III', 6, 002, NULL, 102, NULL, 108, NULL, NULL, '772312515', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(3, NULL, 1, '0', 'Aber Hospital', 9, 003, NULL, 77, NULL, 4, 4, 'Aber Hub', '782117574', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(4, NULL, NULL, '0', 'Abim Hospital', 9, 003, NULL, 1, NULL, 5, 1, 'Abim Hub', '777281715', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(5, 3, NULL, '0', 'Aboke H/C IV', 7, 002, NULL, 104, NULL, 4, NULL, NULL, '779075630', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(6, 3, NULL, '0', 'Abongomola H/C III', 6, 002, NULL, 6, NULL, 4, NULL, NULL, '772868854', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(7, 195, NULL, '0', 'Acet H/C II', 5, 002, NULL, 23, NULL, 27, NULL, NULL, '77646333', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(8, 608, NULL, '0', 'Achol Pii H/C III', 6, 002, NULL, 101, NULL, 107, NULL, NULL, '774253869', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(9, 608, NULL, '0', 'Acholi Bur H/C III', 6, 002, NULL, 78, NULL, 107, NULL, NULL, '785966429', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(10, NULL, NULL, '0', 'Adjumani Hospital', 9, 002, NULL, 2, NULL, 6, 3, 'Adjumani Hub', '772918562', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(11, 179, NULL, '0', 'Adok H/C II', 5, 002, NULL, 22, NULL, 23, NULL, NULL, '752418166', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(12, 3, NULL, '0', 'Aduku H/C II (NGO)', 5, 002, NULL, 6, NULL, 4, NULL, NULL, ' ', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(13, 3, NULL, '0', 'Aduku H/C IV ', 7, 002, NULL, 6, NULL, 4, NULL, NULL, '779330623', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(14, 416, NULL, '0', 'Agali H/C III', 6, 002, NULL, 54, NULL, 61, NULL, NULL, '777114666', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(15, 439, NULL, '0', 'Agoro H/C III', 6, 002, NULL, 53, NULL, 65, NULL, NULL, '711068465', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(16, 995, NULL, '0', 'Agu H/C III', 6, 002, NULL, 99, NULL, 105, NULL, NULL, '782424967', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(17, 614, NULL, '0', 'Agule H/C III', 6, 002, NULL, 79, NULL, 82, NULL, NULL, '773084891', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(18, 3, NULL, '0', 'Agulurude H/C III', 6, 002, NULL, 77, NULL, 4, NULL, NULL, '777583284', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(19, 179, NULL, '0', 'Agwata H/C III', 6, 002, NULL, 22, NULL, 23, NULL, NULL, '774993910', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(20, 416, NULL, '0', 'Akalo H/C III', 6, 002, NULL, 104, NULL, 61, NULL, NULL, '753761001', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(21, 3, NULL, '0', 'Akokoro H/C III', 6, 002, NULL, 6, NULL, 4, NULL, NULL, '773577763', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(22, 360, NULL, '0', 'Akuna Laber H/C III', 6, 002, NULL, 47, NULL, 56, NULL, NULL, '774849340', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(23, NULL, NULL, '0', 'Alebtong H/C IV', 7, 002, NULL, 102, NULL, 108, 2, 'Alebtong Hub ', '772628341', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(24, 4, NULL, '0', 'Alerek H/C III', 6, 002, NULL, 1, NULL, 5, NULL, NULL, '775287200', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(25, 38, NULL, '0', 'Alero H/C III', 6, 002, NULL, 106, NULL, 10, NULL, NULL, '717573999', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(26, 416, NULL, '0', 'Alito H/C III', 6, 002, NULL, 104, NULL, 61, NULL, NULL, '756802305', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(27, 2493, NULL, '0', 'Alive Medical Services H/C III', 6, 002, NULL, 35, NULL, 41, NULL, NULL, '414258580', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(29, 416, NULL, '0', 'Amach H/C IV', 7, 002, NULL, 54, NULL, 61, NULL, NULL, '777647634', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(30, 31, NULL, '0', 'Amai Community Hospital', 9, 002, NULL, 3, NULL, 7, NULL, NULL, '773016662', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(31, NULL, NULL, '0', 'Amolatar H/C IV ', 7, 003, NULL, 3, NULL, 7, 4, 'Amolatar Hub', '773897355', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(32, 416, NULL, '0', 'Amuca SDA H/C III', 6, 002, NULL, 54, NULL, 61, NULL, NULL, '787324669', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(33, 179, NULL, '0', 'Amuda H/C II', 5, 002, NULL, 22, NULL, 23, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(34, 696, NULL, '0', 'Amudat Hospital', 9, 002, NULL, 103, NULL, 94, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(35, 23, NULL, '0', 'Amugu H/C III', 6, 002, NULL, 102, NULL, 108, NULL, NULL, '782681664', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(36, NULL, NULL, '0', 'Amuria H/C IV', 7, 002, NULL, 4, NULL, 8, 5, 'Amuria Hub', '773308460', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(37, 195, NULL, '0', 'Amuru H/C III', 6, 002, NULL, 23, NULL, 27, NULL, NULL, '774848923', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(38, NULL, NULL, '0', 'Anaka Hospital', 9, 002, NULL, 106, NULL, 10, 2, 'Anaka Hub', '774805770', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(40, 227, NULL, '0', 'Anyara H/C III', 6, 002, NULL, 32, NULL, 34, NULL, NULL, '776996063', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(41, 3, NULL, '0', 'Anyeke H/C IV', 7, 002, NULL, 77, NULL, 4, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(42, 3, NULL, '0', 'Apac Hospital ', 9, 002, NULL, 6, NULL, 4, NULL, NULL, '75246534', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(43, 416, NULL, '0', 'Apala Bar Owoo H/C III', 6, 002, NULL, 104, NULL, 61, NULL, NULL, '785966224', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(44, 23, NULL, '0', 'Apala H/C III', 6, 002, NULL, 102, NULL, 108, NULL, NULL, '777053344', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(45, 670, NULL, '0', 'Apapai H/C IV (Serere)', 7, 002, NULL, 100, NULL, 90, NULL, NULL, '744006516', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(46, 3, NULL, '0', 'Apoi H/C III', 6, 002, NULL, 6, NULL, 4, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(47, 31, NULL, '0', 'Aputi H/C III', 6, 002, NULL, 3, NULL, 7, NULL, NULL, '773394839', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(48, 712, NULL, '0', 'Ariwa H/C III', 6, 002, NULL, 87, NULL, 96, NULL, NULL, '779744905', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(49, 416, NULL, '0', 'Aromo H/C III', 6, 002, NULL, 54, NULL, 61, NULL, NULL, '774059095', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(50, NULL, NULL, '0', 'Arua R R Hospital', 11, 002, NULL, 7, NULL, 11, 3, 'Arua Hub', '752663302', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(51, 179, NULL, '0', 'Atabu H/C II', 5, 002, NULL, 22, NULL, 23, NULL, NULL, '782418166', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(52, 608, NULL, '0', 'Atanga H/C III', 6, 002, NULL, 78, NULL, 107, NULL, NULL, '783317151', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(53, NULL, NULL, '0', 'Atiak H/C IV ', 7, 002, NULL, 5, NULL, 12, 2, 'Atiak Hub', '775666037', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(55, 56, NULL, '0', 'Atool H/C II', 5, 002, NULL, 50, NULL, 13, NULL, NULL, '782254913', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(56, NULL, NULL, '0', 'Atutur Hospital', 9, 002, NULL, 50, NULL, 13, 5, 'Atutur Hub', '782027766', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(57, 195, NULL, '0', 'Awach H/C IV ', 7, 002, NULL, 23, NULL, 27, NULL, NULL, '782040787', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(58, 53, NULL, '0', 'Awer H/C II', 5, 002, NULL, 5, NULL, 12, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(59, 608, NULL, '0', 'Awere H/C III', 6, 002, NULL, 78, NULL, 107, NULL, NULL, '774022194', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(60, 195, NULL, '0', 'Awoo H/C II', 5, 002, NULL, 23, NULL, 27, NULL, NULL, '774817575', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(61, 416, NULL, '0', 'Ayer H/C II', 5, 002, NULL, 104, NULL, 61, NULL, NULL, '754808980', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(62, 195, NULL, '0', 'Aywee H/C III', 6, 002, NULL, 23, NULL, 27, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(63, 199, NULL, '0', 'Azur Christian H/C IV', 7, 002, NULL, 24, NULL, 28, NULL, NULL, '783658054', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(64, 204, NULL, '0', 'Baitambogwe H/C III', 6, 002, NULL, 61, NULL, 29, NULL, NULL, '774140176', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(65, 416, NULL, '0', 'Bala H/C III', 6, 002, NULL, 104, NULL, 61, NULL, NULL, '779203475', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(66, 416, NULL, '0', 'Barapwo H/C III', 6, 002, NULL, 54, NULL, 61, NULL, NULL, '775172582', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(67, 179, NULL, '0', 'Bardyang H/C II', 5, 002, NULL, 22, NULL, 23, NULL, NULL, '752418166', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(68, 416, NULL, '0', 'Barr H/C III', 6, 002, NULL, 54, NULL, 61, NULL, NULL, '772618460', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(69, 179, NULL, '0', 'Bata H/C III', 6, 002, NULL, 22, NULL, 23, NULL, NULL, '772657256', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(71, 53, NULL, '0', 'Bibia H/C III', 6, 002, NULL, 5, NULL, 12, NULL, NULL, '774592062', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(72, 1150, NULL, '0', 'Biddabugya H/C III', 6, 002, NULL, 71, NULL, 79, NULL, NULL, '785732682', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(73, 649, NULL, '0', 'Bigodi H/C III', 6, 002, NULL, 37, NULL, 101, NULL, NULL, '773295818', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(74, 544, NULL, '0', 'Bihanga H/C III (Buhweju)', 6, 002, NULL, 109, NULL, 80, NULL, NULL, '781507660', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(75, 195, NULL, '0', 'Binya H/C II', 5, 002, NULL, 23, NULL, 27, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(76, 279, NULL, '0', 'Binyiny H/C III', 6, 002, NULL, 39, NULL, 44, NULL, NULL, '754172238', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(78, 644, NULL, '0', 'Bisheshe H/C III', 6, 002, NULL, 25, NULL, 85, NULL, NULL, '783627202', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(79, 341, NULL, '0', 'Bishop Masereka H/C III', 6, 002, NULL, 40, NULL, 52, NULL, NULL, '774114384', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(80, 469, NULL, '0', 'Bitereko H/C III', 6, 002, NULL, 111, NULL, 72, NULL, NULL, '782444026', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(81, 3, NULL, '0', 'Bobi H/C III', 6, 002, NULL, 23, NULL, 4, NULL, NULL, '785414568', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(82, 425, NULL, '0', 'Bombo Military Hospital ', 9, 002, NULL, 55, NULL, 63, NULL, NULL, '772859404', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(83, 416, NULL, '0', 'Boroboro H/C III', 6, 002, NULL, 54, NULL, 61, NULL, NULL, '777141157', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(84, 211, NULL, '0', 'Bubaare H/C III (Mbarara)', 6, 002, NULL, 63, NULL, 71, NULL, NULL, '773006481', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(85, 460, NULL, '0', 'Bubulo H/C IV', 7, 002, NULL, 57, NULL, 70, NULL, NULL, '752521805', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(86, NULL, NULL, '0', 'Budadiri H/C IV', 7, 002, NULL, 83, NULL, 114, 7, 'Budadiri Hub ', '782083486', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(87, 460, NULL, '0', 'Budaka H/C IV', 7, 002, NULL, 8, NULL, 70, NULL, NULL, '782310948', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(88, 222, NULL, '0', 'Budondo H/C IV', 7, 002, NULL, 28, NULL, 31, NULL, NULL, '782932700', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(89, 2493, NULL, '0', 'Bududa Hospital', 9, 002, NULL, 9, NULL, 41, NULL, NULL, '782150480', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(90, 144, NULL, '0', 'Budumba H/C III', 6, 002, NULL, 18, NULL, 20, NULL, NULL, '753701164', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(91, 460, NULL, '0', 'Bufumbo H/C IV', 7, 002, NULL, 62, NULL, 70, NULL, NULL, '782664114', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(92, 644, NULL, '0', 'Bufunda H/C III', 6, 002, NULL, 25, NULL, 85, NULL, NULL, '772935060', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(93, 144, NULL, '0', 'Bugalo H/C III', 6, 002, NULL, 18, NULL, 20, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(94, 211, NULL, '0', 'Bugamba H/C IV', 7, 002, NULL, 63, NULL, 71, NULL, NULL, '782460178', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(95, 199, NULL, '0', 'Bugambe H/C II (Hoima)', 5, 002, NULL, 24, NULL, 28, NULL, NULL, '782323029', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(96, 199, NULL, '0', 'Bugambe Tea H/C III (Hoima)', 6, 002, NULL, 24, NULL, 28, NULL, NULL, '782946022', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(97, 222, NULL, '0', 'Bugembe H/C  IV', 7, 002, NULL, 28, NULL, 31, NULL, NULL, '772323503', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(98, 86, NULL, '0', 'Buginyanya H/C III (Sironko)', 6, 002, NULL, 83, NULL, 114, NULL, NULL, '784959757', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(99, NULL, NULL, '0', 'Bugiri Hospital', 9, 002, NULL, 10, NULL, 15, 8, 'Bugiri Hub', '782309581', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(100, 460, NULL, '0', 'Bugobero H/C IV', 7, 002, NULL, 57, NULL, 70, NULL, NULL, '752521809', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(101, 204, NULL, '0', 'Bugono H/C IV', 7, 002, NULL, 26, NULL, 29, NULL, NULL, '712950841', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(102, 341, NULL, '0', 'Bugoye H/C III', 6, 002, NULL, 40, NULL, 52, NULL, NULL, '706907535', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(103, 224, NULL, '0', 'Buhara H/C III (Govt)', 6, 002, NULL, 30, NULL, 33, NULL, NULL, '787032220', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(104, 450, NULL, '0', 'Buhehe H/C III', 6, 002, NULL, 17, NULL, 67, NULL, NULL, '779346042', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(105, 199, NULL, '0', 'Buhimba H/C III', 6, 002, NULL, 24, NULL, 28, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(106, 558, NULL, '0', 'Buhunga H/C IV', 7, 002, NULL, 81, NULL, 81, NULL, NULL, '701353844', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(107, 311, NULL, '0', 'Buikwe Hospital (St Charlse Lwanga)', 9, 002, NULL, 11, NULL, 48, NULL, NULL, '784470442', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(108, 398, NULL, '0', 'Bujubuli H/C III', 6, 002, NULL, 51, NULL, 58, NULL, NULL, '782591502', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(109, 124, NULL, '0', 'Bukangama H/C III', 6, 002, NULL, 15, NULL, 18, NULL, NULL, '794527535', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(110, 56, NULL, '0', 'Bukedea H/C IV', 7, 002, NULL, 12, NULL, 13, NULL, NULL, '716041412', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(111, 650, NULL, '0', 'Buremba H/C III', 6, 002, NULL, 45, NULL, 86, NULL, NULL, '773007418', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(112, 2493, NULL, '0', 'Bukigai H/C III', 6, 002, NULL, 9, NULL, 41, NULL, NULL, '775985968', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(113, 224, NULL, '0', 'Bukinda H/C III', 6, 002, NULL, 30, NULL, 33, NULL, NULL, '775573662', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(114, 320, NULL, '0', 'Bukomero H/C IV', 7, 002, NULL, 44, NULL, 50, NULL, NULL, '784713664', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(115, 451, NULL, '0', 'Bukoto H/C III', 6, 002, NULL, 59, NULL, 68, NULL, NULL, '784834893', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(116, 149, NULL, '0', 'Bukulula H/C IV', 7, 002, NULL, 90, NULL, 100, NULL, NULL, '775430480', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(117, 187, NULL, '0', 'Bukuuku H/C IV ', 7, 002, NULL, 31, NULL, 25, NULL, NULL, '704753355', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(118, 295, NULL, '0', 'Bukuya H/C III', 6, 002, NULL, 68, NULL, 46, NULL, NULL, '712134102', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(119, 279, NULL, '0', 'Bukwo H/C IV', 7, 002, NULL, 13, NULL, 44, NULL, NULL, '777603015', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(120, 99, NULL, '0', 'Bulange H/C III', 6, 002, NULL, 73, NULL, 15, NULL, NULL, '782553672', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(121, NULL, NULL, '0', 'Buliisa H/C IV', 7, 002, NULL, 14, NULL, 16, 6, 'Buliisa Hub', '774665077', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(122, 222, NULL, '0', 'Buluba Hospital St Francis', 9, 002, NULL, 61, NULL, 31, NULL, NULL, '777054600', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(123, NULL, NULL, '0', 'Bumanya H/C IV', 7, 002, NULL, 34, NULL, 17, 8, 'Bumanya Hub', '788597147', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(124, NULL, NULL, '0', 'Bundibugyo Hospital  ', 9, 002, NULL, 15, NULL, 18, 9, 'Bundibugyo Hub', '771630999', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(125, 416, NULL, '0', 'Bung H/C II', 5, 002, NULL, 104, NULL, 61, NULL, NULL, '751721709', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(126, 460, NULL, '0', 'Bungokho Mutoto H/C III', 6, 002, NULL, 62, NULL, 70, NULL, NULL, '704312235', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(127, 649, NULL, '0', 'Bunoga H/C III', 6, 002, NULL, 37, NULL, 101, NULL, NULL, '753341673', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(128, 204, NULL, '0', 'Bunyiiro H/C III', 6, 002, NULL, 26, NULL, 29, NULL, NULL, '706028527', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(129, 199, NULL, '0', 'Buraru H/C III', 6, 002, NULL, 24, NULL, 28, NULL, NULL, '773702096', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(131, 144, NULL, '0', 'Busaba H/C III', 6, 002, NULL, 18, NULL, 20, NULL, NULL, '753097842', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(132, 460, NULL, '0', 'Busamaga H/C III', 6, 002, NULL, 62, NULL, 70, NULL, NULL, ' ', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(133, 460, NULL, '0', 'Busano H/C III', 6, 002, NULL, 62, NULL, 70, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(134, 355, NULL, '0', 'Busanza H/C IV ', 7, 002, NULL, 46, NULL, 54, NULL, NULL, '773219980', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(135, 204, NULL, '0', 'Busesa H/C IV', 7, 002, NULL, 26, NULL, 29, NULL, NULL, '772697750', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(136, 614, NULL, '0', 'Buseta H/C III', 6, 002, NULL, 95, NULL, 82, NULL, NULL, '751480609', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(137, NULL, NULL, '0', 'Bushenyi H/C IV', 7, 002, NULL, 16, NULL, 19, 12, 'Bushenyi Hub', '701283662', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(138, 137, NULL, '0', 'Bushenyi Medical Centre H/C III', 6, 002, NULL, 16, NULL, 19, NULL, NULL, '772958343', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(139, 460, NULL, '0', 'Bushikori H/C III', 6, 002, NULL, 62, NULL, 70, NULL, NULL, '784959757', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(140, 2493, NULL, '0', 'Bushiyi H/C III', 6, 002, NULL, 9, NULL, 41, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(142, 450, NULL, '0', 'Busia H/C IV', 7, 002, NULL, 17, NULL, 67, NULL, NULL, '777828568', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(143, 649, NULL, '0', 'Busiriba H/C II', 5, 002, NULL, 37, NULL, 101, NULL, NULL, ' ', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(144, NULL, NULL, '0', 'Busolwe Hospital', 9, 002, NULL, 18, NULL, 20, 7, 'Busolwe Hub', '753200001', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(145, 460, NULL, '0', 'Busiu H/C IV', 7, 002, NULL, 62, NULL, 70, NULL, NULL, '752840585', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(146, 2493, NULL, '0', 'Butabika  Hospital', 9, 002, NULL, 35, NULL, 41, NULL, NULL, '772848761', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(147, 56, NULL, '0', 'Butebo H/C IV', 7, 002, NULL, 79, NULL, 13, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(148, 199, NULL, '0', 'Butema H/C III', 6, 002, NULL, 24, NULL, 28, NULL, NULL, '773764156', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(149, NULL, NULL, '0', 'Butenga H/C IV', 7, 002, NULL, 93, NULL, 100, 10, 'Butenga Hub ', '752851694', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(150, 1241, NULL, '0', 'Butiiti H/C III', 6, 002, NULL, 52, NULL, 60, NULL, NULL, '779982354', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(151, 460, NULL, '0', 'Butiru H/C III', 6, 002, NULL, 57, NULL, 70, NULL, NULL, '772079346', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(152, 1241, NULL, '0', 'Butunduzi H/C III', 6, 002, NULL, 52, NULL, 60, NULL, NULL, '774455662', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(153, 313, NULL, '0', 'Buvuma H/C IV', 7, 002, NULL, 19, NULL, 49, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(154, 329, NULL, '0', 'Buwaiswa H/C III', 6, 002, NULL, 61, NULL, 117, NULL, NULL, '782899189', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(155, 788, NULL, '0', 'Buwambo H/C IV', 7, 002, NULL, 86, NULL, 24, NULL, NULL, '772885227', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(156, 86, NULL, '0', 'Buwasa H/C IV', 7, 002, NULL, 83, NULL, 114, NULL, NULL, '772699588', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(157, 698, NULL, '0', 'Buwasunguyi H/C II', 5, 002, NULL, 57, NULL, 95, NULL, NULL, '774788450', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(158, 222, NULL, '0', 'Buwenge H/C IV', 7, 002, NULL, 28, NULL, 31, NULL, NULL, '774532044', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(159, 629, NULL, '0', 'Buyamba H/C III-Rakai', 6, 002, NULL, 80, NULL, 83, NULL, NULL, '754724490', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(160, NULL, NULL, '0', 'Buyinja H/C IV', 7, 002, NULL, 98, NULL, 21, 8, 'Buyinja Hub', '772533225', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(161, 669, NULL, '0', 'Buyoga H/C III', 6, 002, NULL, 93, NULL, 93, NULL, NULL, '75151592764', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(162, 240, NULL, '0', 'Bwera Hospital ', 9, 002, NULL, 40, NULL, 37, NULL, NULL, '773981466', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(163, 452, NULL, '0', 'Bwijanga H/C IV', 7, 002, NULL, 60, NULL, 69, NULL, NULL, '782675394', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(164, 276, NULL, '0', 'Bwindi Community Hospital', 9, 002, NULL, 38, NULL, 43, NULL, NULL, '774035916', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(165, 649, NULL, '0', 'Bwizi H/C III', 6, 002, NULL, 37, NULL, 101, NULL, NULL, '776294245', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(166, 211, NULL, '0', 'Bwizibwera H/C IV ', 7, 002, NULL, 63, NULL, 71, NULL, NULL, '701241770', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(167, 212, NULL, '0', 'Bwongyera H/C III', 6, 002, NULL, 75, NULL, 30, NULL, NULL, '787718152', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(168, 355, NULL, '0', 'Chahafi H/C IV', 7, 002, NULL, 46, NULL, 54, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(169, 3, NULL, '0', 'Chawente H/C IV', 7, 002, NULL, 6, NULL, 4, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(170, 3, NULL, '0', 'Chegere H/C II', 5, 002, NULL, 6, NULL, 4, NULL, NULL, '772352137', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(171, 10, NULL, '0', 'Ciforo H/C III', 6, 002, NULL, 2, NULL, 6, NULL, NULL, '774223837', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(172, 137, NULL, '0', 'Comboni Hospital', 9, 002, NULL, 16, NULL, 19, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(173, 195, NULL, '0', 'Coope H/C II', 5, 002, NULL, 23, NULL, 27, NULL, NULL, '774848424', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(174, 380, NULL, '0', 'Kotido COU   H/C III', 6, 002, NULL, 49, NULL, 57, NULL, NULL, '775780829', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(175, 460, NULL, '0', 'Cure Children Hospital of Uganda', 12, 002, NULL, 62, NULL, 70, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(176, 195, NULL, '0', 'Cwero H/C III', 6, 002, NULL, 23, NULL, 27, NULL, NULL, '778402703', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(177, 450, NULL, '0', 'Dabani Hosipital', 7, 002, NULL, 17, NULL, 67, NULL, NULL, '779110252', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(178, 674, NULL, '0', 'Dakabela H/C III', 6, 002, NULL, 84, NULL, 92, NULL, NULL, '772329858', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(179, NULL, NULL, '0', 'Dokolo H/C IV', 7, 002, NULL, 22, NULL, 23, 4, 'Dokolo Hub', '782266750', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(180, 659, NULL, '0', 'Endiinzi H/C III', 6, 002, NULL, 27, NULL, 87, NULL, NULL, '787295718', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(181, 788, NULL, '0', 'Entebbe Grade A Hospital', 9, 002, NULL, 86, NULL, 24, NULL, NULL, '752263100', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(182, 31, NULL, '0', 'Etam H/C III', 6, 002, NULL, 3, NULL, 7, NULL, NULL, '773115270', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(183, 650, NULL, '0', 'Family Health Resource Centre Kiruhura ', 12, 002, NULL, 45, NULL, 86, NULL, NULL, '785108327', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(184, 222, NULL, '0', 'Family Hope Centre Jinja', 12, 002, NULL, 28, NULL, 31, NULL, NULL, '772819859', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(185, 2493, NULL, '0', 'Family Hope Centre Kampala', 12, 002, NULL, 35, NULL, 41, NULL, NULL, '752528843', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(186, 1241, NULL, '0', 'FinlaysMwenge H/C III', 6, 002, NULL, 52, NULL, 60, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(187, NULL, NULL, '0', 'FortPortal R R Hospital', 11, 002, NULL, 31, NULL, 25, 9, 'FortPortal Hub', '772339369', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(188, 313, NULL, '0', 'Galiraaya H/C III', 6, 002, NULL, 42, NULL, 49, NULL, NULL, '752398986', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(189, 460, NULL, '0', 'Gangama H/C II', 5, 002, NULL, 62, NULL, 70, NULL, NULL, ' ', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(190, 614, NULL, '0', 'Gogonyo H/C III', 6, 002, NULL, 79, NULL, 82, NULL, NULL, '777258208', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(191, NULL, NULL, '0', 'Gombe Hospital ', 9, 002, NULL, 88, NULL, 26, 10, 'Gombe Hub', '775272856', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(192, 195, NULL, '0', 'Gulu Independent Hospital', 9, 002, NULL, 23, NULL, 27, NULL, NULL, '778640859', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(193, 195, NULL, '0', 'Gulu Military Hospital (4th Division)', 9, 002, NULL, 23, NULL, 27, NULL, NULL, '778938159', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(194, 195, NULL, '0', 'Gulu Prison H/C III', 6, 002, NULL, 23, NULL, 27, NULL, NULL, '754414873', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(195, NULL, NULL, '0', 'Gulu R R Hospital', 11, 002, NULL, 23, NULL, 27, 2, 'Gulu Hub', '779201168', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(196, 674, NULL, '0', 'Gweri H/C III', 6, 002, NULL, 84, NULL, 92, NULL, NULL, '774206049', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(197, 224, NULL, '0', 'Hamurwa H/C IV', 7, 002, NULL, 30, NULL, 33, NULL, NULL, '775828838', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(198, 195, NULL, '0', 'Herman Meiner H/C II', 5, 002, NULL, 23, NULL, 27, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(199, NULL, NULL, '0', 'Hoima R R Hospital', 11, 002, NULL, 24, NULL, 28, 6, 'Hoima Hub', '775923299', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(200, 1081, NULL, '0', 'Holy Family Hospital-Nyapea', 9, 002, NULL, 108, NULL, 78, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(201, 644, NULL, '0', 'Ibanda Hospital', 9, 002, NULL, 25, NULL, 85, NULL, NULL, '783406816', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(202, 3, NULL, '0', 'Ibuje H/C III', 6, 002, NULL, 6, NULL, 4, NULL, NULL, '784485391', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(203, 3, NULL, '0', 'Iceme H/C III', 6, 002, NULL, 77, NULL, 4, NULL, NULL, '772085176', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(204, NULL, NULL, '0', 'Iganga Hospital', 9, 002, NULL, 26, NULL, 29, 8, 'Iganga Hub', '772621850', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(205, 240, NULL, '0', 'Ihandiro H/C III', 6, 002, NULL, 40, NULL, 37, NULL, NULL, '779785304', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(206, 460, NULL, '0', 'Iki  Iki H/C III', 6, 002, NULL, 8, NULL, 70, NULL, NULL, '779035400', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(207, 3, NULL, '0', 'Inomo H/C III', 6, 002, NULL, 6, NULL, 4, NULL, NULL, '782290652', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(208, 187, NULL, '0', 'Iruhuura H/C III', 6, 002, NULL, 31, NULL, 25, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(209, 137, NULL, '0', 'Ishaka Adventist Hospital', 9, 002, NULL, 16, NULL, 19, NULL, NULL, '784979804', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(210, 644, NULL, '0', 'Ishongororo H/C IV', 7, 002, NULL, 25, NULL, 85, NULL, NULL, '776534734', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(211, NULL, NULL, '0', 'Iss Clinic (Mbarara R R Hospital)', 12, 002, NULL, 63, NULL, 71, 12, 'Mbarara Hub', '755553190', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(212, NULL, NULL, '0', 'Itojo Hospital', 9, 002, NULL, 75, NULL, 30, 12, 'Itojo Hub', '704338228', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(213, 123, NULL, '0', 'Ivukula H/C III', 6, 002, NULL, 73, NULL, 17, NULL, NULL, '774250829', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(214, 187, NULL, '0', 'JCRC Fort Portal', 12, 002, NULL, 31, NULL, 25, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(215, 195, NULL, '0', 'JCRC Gulu', 12, 002, NULL, 23, NULL, 27, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(216, 224, NULL, '0', 'JCRC Kabale', 12, 002, NULL, 30, NULL, 33, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(217, 222, NULL, '0', 'JCRC Kakira', 12, 002, NULL, 28, NULL, 31, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(218, 460, NULL, '0', 'JCRC Mbale', 12, 002, NULL, 62, NULL, 70, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(219, 211, NULL, '0', 'JCRC Mbarara', 12, 002, NULL, 63, NULL, 71, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(220, 480, NULL, '0', 'JCRC Mubende', 12, 002, NULL, 68, NULL, 76, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(221, 3, NULL, '0', 'Jengari H/C II', 5, 002, NULL, 6, NULL, 4, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(222, NULL, NULL, '0', 'Jinja R R Hospital ', 11, 002, NULL, 28, NULL, 31, 8, 'Jinja Hub', '712811359', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(223, NULL, NULL, '0', 'Kaabong Hospital', 9, 002, NULL, 29, NULL, 32, 1, 'Kaabong Hub', '783712118', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(224, NULL, NULL, '0', 'Kabale R R Hospital', 11, 002, NULL, 30, NULL, 33, 13, 'Kabale Hub', '782407445', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(225, 187, NULL, '0', 'Kabarole Hospital C.O.U', 9, 002, NULL, 31, NULL, 25, NULL, NULL, '782813064', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(226, 187, NULL, '0', 'Kabende H/C II', 5, 002, NULL, 31, NULL, 25, NULL, NULL, '704673787', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(227, NULL, NULL, '0', 'Kaberamaido H/C IV', 7, 002, NULL, 32, NULL, 34, 5, 'Kaberamaido Hub', '782873234', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(228, 629, NULL, '0', 'Kabira H/C III (Rakai)', 6, 002, NULL, 80, NULL, 83, NULL, NULL, '779294758', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(230, 649, NULL, '0', 'Kabuga H/C III ', 6, 002, NULL, 37, NULL, 101, NULL, NULL, '784834077', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(231, 629, NULL, '0', 'Kabuwoko H/C III', 6, 002, NULL, 80, NULL, 83, NULL, NULL, '782957686', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(232, 659, NULL, '0', 'Kabuyanda H/C IV', 7, 002, NULL, 27, NULL, 87, NULL, NULL, '782018727', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(233, 358, NULL, '0', 'Kabwohe Clinical Research Centre', 12, 002, NULL, 114, NULL, 55, NULL, NULL, '779442114', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(234, 358, NULL, '0', 'Kabwohe H/C IV', 7, 002, NULL, 114, NULL, 55, NULL, NULL, '778049876', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(235, 199, NULL, '0', 'Kabwoya H/C III', 6, 002, NULL, 24, NULL, 28, NULL, NULL, '774642432', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(236, 144, NULL, '0', 'Kachonga H/C III', 6, 002, NULL, 18, NULL, 20, NULL, NULL, '772454606', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(237, 56, NULL, '0', 'Kachumbala H/C III', 6, 002, NULL, 12, NULL, 13, NULL, NULL, '700903312', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(238, 614, NULL, '0', 'Kaderuna H/C III', 6, 002, NULL, 8, NULL, 82, NULL, NULL, '783371407', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(239, NULL, NULL, '0', 'Kagadi  Hospital', 9, 002, NULL, 43, NULL, 36, 6, 'Kagadi Hub', '758184524', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(240, NULL, NULL, '0', 'Kagando Hospital', 9, 002, NULL, 40, NULL, 37, 9, 'Kagando Hub', '712325628', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(241, 187, NULL, '0', 'Kagote H/C III', 6, 002, NULL, 31, NULL, 25, NULL, NULL, '782972575', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(242, 788, NULL, '0', 'Kajjansi H/C III', 6, 002, NULL, 86, NULL, 24, NULL, NULL, '712193417', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(243, 398, NULL, '0', 'Kakabara H/C III', 6, 002, NULL, 51, NULL, 58, NULL, NULL, '782856089', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(244, NULL, NULL, '0', 'Kakindo H/C IV', 7, 002, NULL, 43, NULL, 38, 6, 'Kakindo Hub', '779541559', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(245, 187, NULL, '0', 'Kakinga H/C III', 6, 002, NULL, 31, NULL, 25, NULL, NULL, '773239725', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(246, 222, NULL, '0', 'Kakira Sugar Works Hospital ', 9, 002, NULL, 28, NULL, 31, NULL, NULL, '774427238', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(247, 124, NULL, '0', 'Kakuka H/C III', 6, 002, NULL, 15, NULL, 18, NULL, NULL, '792111918', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(248, 244, NULL, '0', 'Kakumiro H/C IV ', 7, 002, NULL, 43, NULL, 38, NULL, NULL, '78389792', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(249, 629, NULL, '0', 'Kakuuto H/C IV', 7, 002, NULL, 80, NULL, 83, NULL, NULL, '789404356', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(250, 195, NULL, '0', 'Kal Ali H/C II', 5, 002, NULL, 23, NULL, 27, NULL, NULL, '773024270', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(251, 53, NULL, '0', 'Kaladima H/C III', 6, 002, NULL, 5, NULL, 12, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(252, 425, NULL, '0', 'Kalagala H/C IV', 7, 002, NULL, 55, NULL, 63, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(253, NULL, NULL, '0', 'Kalangala H/C IV', 7, 002, NULL, 33, NULL, 113, 10, 'Kalangala Hub ', '774022611', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(255, 629, NULL, '0', 'Kalisizo Hospital ', 9, 002, NULL, 80, NULL, 83, NULL, NULL, '703058040', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(256, NULL, NULL, '0', 'Kalongo Hospital ', 9, 002, NULL, 101, NULL, 39, 2, 'Kalongo Hub', '775920363', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(257, 149, NULL, '0', 'Kalungu H/C III', 6, 002, NULL, 90, NULL, 100, NULL, NULL, '778666098', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(258, 56, NULL, '0', 'Kamacha H/C III', 6, 002, NULL, 50, NULL, 13, NULL, NULL, '774383339', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(259, 276, NULL, '0', 'Kambuga Hospital ', 9, 002, NULL, 38, NULL, 43, NULL, NULL, '772576219', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(261, 674, NULL, '0', 'Kamuda H/C III', 6, 002, NULL, 84, NULL, 92, NULL, NULL, '774192370', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(262, 224, NULL, '0', 'Kamuganguzi H/C III', 6, 002, NULL, 30, NULL, 33, NULL, NULL, '779411945', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(263, 614, NULL, '0', 'Kamuge H/C III', 6, 002, NULL, 79, NULL, 82, NULL, NULL, '782642627', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(264, 224, NULL, '0', 'Kamukira H/C IV ', 7, 002, NULL, 30, NULL, 33, NULL, NULL, '771648484', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(265, 2484, NULL, '0', 'Kamwenge H/C III', 9, 002, NULL, 36, NULL, 42, NULL, NULL, '788011071', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(266, 2484, NULL, '0', 'Kamuli Mission Hospital', 9, 002, NULL, 36, NULL, 42, NULL, NULL, '772034038', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(267, 649, NULL, '0', 'Kamwenge H/C III', 6, 002, NULL, 37, NULL, 101, NULL, NULL, '772957997', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(268, 224, NULL, '0', 'Kamwezi   H/C IV ', 7, 002, NULL, 30, NULL, 33, NULL, NULL, '779412269', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(269, 2493, NULL, '0', 'Kamwokya Christian Caring Community ', 12, 002, NULL, 35, NULL, 41, NULL, NULL, '754560375', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(270, 380, NULL, '0', 'Kanawat H/C III', 6, 002, NULL, 49, NULL, 57, NULL, NULL, '782679529', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(271, 649, NULL, '0', 'Kanara H/C II', 5, 002, NULL, 37, NULL, 101, NULL, NULL, '789929390', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(272, 179, NULL, '0', 'Kangai H/C III', 6, 002, NULL, 22, NULL, 23, NULL, NULL, '774222224', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(273, 614, NULL, '0', 'Kanginima Hospital', 9, 002, NULL, 79, NULL, 82, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(274, 313, NULL, '0', 'Kangulumira H/C IV', 7, 002, NULL, 42, NULL, 49, NULL, NULL, '775547825', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(275, 650, NULL, '0', 'Kanoni H/C III (Kiruhura)', 6, 002, NULL, 45, NULL, 86, NULL, NULL, '782837423', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(276, NULL, NULL, '0', 'Kanungu H/C IV', 7, 002, NULL, 38, NULL, 43, 13, 'Kannungu H/C IV', '774521156', NULL, '', '', NULL, '', NULL, NULL, '2017-10-15 16:14:16', '2017-11-22 13:09:23', ''),
(277, 2493, NULL, '0', 'Kanyanya H/C IV', 7, 002, NULL, 35, NULL, 41, NULL, NULL, ' ', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(278, 56, NULL, '0', 'Kanyum H/C III', 6, 002, NULL, 50, NULL, 13, NULL, NULL, '785621692', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(279, NULL, NULL, '0', 'Kapchorwa Hospital', 9, 002, NULL, 39, NULL, 44, 7, 'Kapchorwa Hub', '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(280, 1150, NULL, '0', 'Kapeeka H/C III', 6, 002, NULL, 71, NULL, 79, NULL, NULL, '771616533', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(281, 995, NULL, '0', 'Kapir H/C III', 6, 002, NULL, 99, NULL, 105, NULL, NULL, '774405237', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(282, 279, NULL, '0', 'Kaproron H/C IV', 7, 002, NULL, 96, NULL, 44, NULL, NULL, '775641345', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(283, 240, NULL, '0', 'Karambi H/C III (Kasese)', 6, 002, NULL, 40, NULL, 37, NULL, NULL, '787391262', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(284, 223, NULL, '0', 'Karenga H/C IV', 7, 002, NULL, 29, NULL, 32, NULL, NULL, '775899843', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(285, 124, NULL, '0', 'Karugutu H/C IV', 7, 002, NULL, 112, NULL, 18, NULL, NULL, '787230261', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(286, 544, NULL, '0', 'Karungu H/C III (Buhweju)', 6, 002, NULL, 109, NULL, 80, NULL, NULL, '752352381', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(287, 425, NULL, '0', 'Kasala H/C III', 6, 002, NULL, 55, NULL, 63, NULL, NULL, '774035014', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(288, 425, NULL, '0', 'Kasana H/C IV', 7, 002, NULL, 55, NULL, 63, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(289, 240, NULL, '0', 'Kasanga PHC III', 6, 002, NULL, 40, NULL, 37, NULL, NULL, '773416108', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(290, 2493, NULL, '0', 'Kasangati H/C IV', 7, 002, NULL, 86, NULL, 41, NULL, NULL, '774957192', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', '');
INSERT INTO `facility` (`id`, `parentid`, `ipid`, `code`, `name`, `facilitylevelid`, `type`, `isactive`, `districtid`, `regionid`, `hubid`, `healthregionid`, `hubname`, `phonenumber`, `distancefromhub`, `email`, `contactperson`, `address`, `returnaddress`, `longitude`, `latitude`, `created_at`, `updated_at`, `createdby`) VALUES
(291, 629, NULL, '0', 'Kasasa H/C III', 6, 002, NULL, 80, NULL, 83, NULL, NULL, '700367349', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(292, 279, NULL, '0', 'Kaserem H/C III', 6, 002, NULL, 39, NULL, 44, NULL, NULL, '701947989', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(293, 341, NULL, '0', 'Kasese Town Council H/C III', 6, 002, NULL, 40, NULL, 52, NULL, NULL, '777184708', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(294, 659, NULL, '0', 'Kashumba H/C III', 6, 002, NULL, 27, NULL, 87, NULL, NULL, '752830018', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(295, NULL, NULL, '0', 'Kassanda H/C IV', 7, 002, NULL, 68, NULL, 46, 11, 'kassanda Hub', '775964900', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(296, 187, NULL, '0', 'Kasunganyanja H/C III', 6, 002, NULL, 31, NULL, 25, NULL, NULL, '782744020', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(297, 187, NULL, '0', 'Kasusu H/C III', 6, 002, NULL, 31, NULL, 25, NULL, NULL, '773772235', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(298, 187, NULL, '0', 'Kaswa H/C III', 6, 002, NULL, 31, NULL, 25, NULL, NULL, '706495723', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(299, 788, NULL, '0', 'Katabi Military Hospital', 9, 002, NULL, 86, NULL, 24, NULL, NULL, '782872085', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(300, 341, NULL, '0', 'Katadoba H/C III', 6, 002, NULL, 40, NULL, 52, NULL, NULL, '779777068', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(301, 674, NULL, '0', 'Katakwi H/C IV', 7, 002, NULL, 41, NULL, 92, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(302, 187, NULL, '0', 'Kataraka H/C IV', 7, 002, NULL, 31, NULL, 25, NULL, NULL, '782750179', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(303, 639, NULL, '0', 'Katerera H/C III', 6, 002, NULL, 113, NULL, 84, NULL, NULL, '784689180', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(304, 223, NULL, '0', 'Kathile H/C III', 6, 002, NULL, 29, NULL, 32, NULL, NULL, '753553172', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(305, 669, NULL, '0', 'Katimba H/C III', 6, 002, NULL, 82, NULL, 93, NULL, NULL, '779212201', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(306, 1241, NULL, '0', 'Katooke H/C III', 6, 002, NULL, 52, NULL, 60, NULL, NULL, '777741725', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(307, 240, NULL, '0', 'Katwe H/C III (Kasese)', 6, 002, NULL, 40, NULL, 37, NULL, NULL, '700245247', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(309, 2493, NULL, '0', 'Kawempe H/C IV', 7, 002, NULL, 35, NULL, 41, NULL, NULL, '782418874', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(310, 2493, NULL, '0', 'Kawempe Home Care', 12, 002, NULL, 35, NULL, 41, NULL, NULL, '783270837', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(311, NULL, NULL, '0', 'Kawolo Hospital', 9, 002, NULL, 11, NULL, 48, 11, 'Kawolo Hub', '772628157', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(312, 212, NULL, '0', 'Kayonza H/C III (Ntungamo)  ', 6, 002, NULL, 75, NULL, 30, NULL, NULL, '775148855', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(313, NULL, NULL, '0', 'Kayunga Hospital', 9, 002, NULL, 42, NULL, 49, 11, 'Kayunga Hub', '778886873', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(314, 650, NULL, '0', 'Kazo H/C IV', 7, 002, NULL, 45, NULL, 86, NULL, NULL, '772977845', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(315, 558, NULL, '0', 'Kebisoni H/C IV', 7, 002, NULL, 81, NULL, 81, NULL, NULL, '777460710', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(317, 244, NULL, '0', 'Kibaale H/C IV', 7, 002, NULL, 43, NULL, 38, NULL, NULL, '782096683', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(318, 199, NULL, '0', 'Kibaire H/C II', 5, 002, NULL, 24, NULL, 28, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(319, 187, NULL, '0', 'Kibiito H/C IV ', 7, 002, NULL, 31, NULL, 25, NULL, NULL, '7077480859', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(320, NULL, NULL, '0', 'Kiboga Hospital', 9, 002, NULL, 44, NULL, 50, 11, 'Kiboga Hub', '7755999701', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(321, 614, NULL, '0', 'Kibuku H/C IV', 7, 002, NULL, 95, NULL, 82, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(322, 2493, NULL, '0', 'Kibuli Muslim Hospital ', 9, 002, NULL, 35, NULL, 41, NULL, NULL, '772318348', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(323, 649, NULL, '0', 'Kicheche H/C III', 6, 002, NULL, 37, NULL, 101, NULL, NULL, '752964196', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(324, 187, NULL, '0', 'Kicwamba H/C III (Kabarole)', 6, 002, NULL, 31, NULL, 25, NULL, NULL, '774204875', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(325, NULL, NULL, '0', 'Kidera H/C IV', 7, 002, NULL, 20, NULL, 51, 8, 'Kidera Hub', '784747717', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(326, 56, NULL, '0', 'Kidongole H/C III', 6, 002, NULL, 12, NULL, 13, NULL, NULL, '783445499', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(327, 398, NULL, '0', 'Kigambo H/C II', 5, 002, NULL, 51, NULL, 58, NULL, NULL, '702769171', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(328, 295, NULL, '0', 'Kiganda H/C IV', 7, 002, NULL, 68, NULL, 46, NULL, NULL, '781498913', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(329, NULL, NULL, '0', 'Kigandalo H/C IV', 7, 002, NULL, 61, NULL, 117, 8, 'Kigandalo hub', '774725303', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(330, 1241, NULL, '0', 'Kigaraale H/C III', 6, 002, NULL, 52, NULL, 60, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(331, 358, NULL, '0', 'Kigarama H/C III', 6, 002, NULL, 114, NULL, 55, NULL, NULL, '782240597', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(332, 199, NULL, '0', 'Kigorobya H/C IV', 7, 002, NULL, 24, NULL, 28, NULL, NULL, '700604096', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(333, 276, NULL, '0', 'Kihiihi H/C IV', 7, 002, NULL, 38, NULL, 43, NULL, NULL, '779541916', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(334, 187, NULL, '0', 'Kijura H/C III', 6, 002, NULL, 31, NULL, 25, NULL, NULL, '787226897', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(335, 659, NULL, '0', 'Kikagate H/C III', 6, 002, NULL, 27, NULL, 87, NULL, NULL, '776462343', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(336, 187, NULL, '0', 'Kiko H/C III', 6, 002, NULL, 31, NULL, 25, NULL, NULL, '74330157', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(337, 199, NULL, '0', 'Kikuube H/C IV', 7, 002, NULL, 24, NULL, 28, NULL, NULL, '774318380', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(338, 644, NULL, '0', 'Kikyenkye H/C III', 6, 002, NULL, 25, NULL, 85, NULL, NULL, '752401556', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(339, 124, NULL, '0', 'Kikyo H/C IV ', 7, 002, NULL, 15, NULL, 18, NULL, NULL, '779484569', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(340, 256, NULL, '0', 'Kilak H/C III', 6, 002, NULL, 78, NULL, 39, NULL, NULL, '774336186', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(341, NULL, NULL, '0', 'Kilembe Mines Hospital', 9, 002, NULL, 40, NULL, 52, 9, 'Kilembe Mines Hub', '783327494', NULL, '', 'KASOKE HENRY', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(342, 433, NULL, '0', 'Kinoni H/C III (Lwengo)', 6, 002, NULL, 92, NULL, 115, NULL, NULL, '783557603', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(343, 211, NULL, '0', 'Kinoni H/C IV (Mbarara)', 7, 002, NULL, 63, NULL, 71, NULL, NULL, '775815620', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(344, 341, NULL, '0', 'Kinyabwamba H/C III', 6, 002, NULL, 40, NULL, 52, NULL, NULL, '773596024', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(345, 240, NULL, '0', 'Kinyamaseke H/C III', 6, 002, NULL, 40, NULL, 37, NULL, NULL, '787362514', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(346, 187, NULL, '0', 'Kirambi  H/C  III', 6, 002, NULL, 31, NULL, 25, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(347, 1150, NULL, '0', 'Kirema H/C III', 6, 002, NULL, 71, NULL, 79, NULL, NULL, '782667396', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(348, 2493, NULL, '0', 'Kiruddu H/C III', 6, 002, NULL, 35, NULL, 41, NULL, NULL, '712008051', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(349, 650, NULL, '0', 'Kiruhura H/C IV', 7, 002, NULL, 45, NULL, 86, NULL, NULL, '752655890', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(350, NULL, NULL, '0', 'Kiryandongo Hospital', 9, 002, NULL, 110, NULL, 53, 6, 'kiryandongo Hub', '784415121', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(351, 199, NULL, '0', 'Kisaaru Tea H/C II', 5, 002, NULL, 24, NULL, 28, NULL, NULL, '759961949', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(352, 558, NULL, '0', 'Kisiizi Hospital C.O.U (Rukungiri)', 9, 002, NULL, 81, NULL, 81, NULL, NULL, '775362708', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(353, 1241, NULL, '0', 'Kisojo H/C III (Kyenjojo)', 6, 002, NULL, 52, NULL, 60, NULL, NULL, '774072755', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(354, 187, NULL, '0', 'Kisomoro H/C III', 6, 002, NULL, 31, NULL, 25, NULL, NULL, '772931104', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(355, NULL, NULL, '0', 'Kisoro Hospital', 9, 002, NULL, 46, NULL, 54, 13, 'Kisoro Hub', '782879611', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(356, 788, NULL, '0', 'Kisubi Hospital', 9, 002, NULL, 86, NULL, 24, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(357, 2493, NULL, '0', 'Kiswa H/C IV', 7, 002, NULL, 35, NULL, 41, NULL, NULL, '782439571', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(358, NULL, NULL, '0', 'Kitagata  Hospital', 9, 002, NULL, 114, NULL, 55, 12, 'kitagata Hub', '782379703', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(359, 2493, NULL, '0', 'Kitebi H/C III', 6, 002, NULL, 35, NULL, 41, NULL, NULL, '788400410', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(360, NULL, NULL, '0', 'Kitgum General Hospital', 9, 002, NULL, 47, NULL, 56, 2, 'Kitgum Hub', '784340824', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(361, 360, NULL, '0', 'Kitgum Matidi H/C III', 6, 002, NULL, 47, NULL, 56, NULL, NULL, '782994849', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(362, 191, NULL, '0', 'Kitimba H/C III', 6, 002, NULL, 88, NULL, 26, NULL, NULL, '701362998', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(363, 212, NULL, '0', 'Kitondo H/C III', 6, 002, NULL, 75, NULL, 30, NULL, NULL, '779098867', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(364, 199, NULL, '0', 'Kitoole H/C II', 5, 002, NULL, 24, NULL, 28, NULL, NULL, '779545981', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(365, 451, NULL, '0', 'Kitovu Hospital ', 9, 002, NULL, 59, NULL, 68, NULL, NULL, '753612190', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(366, 341, NULL, '0', 'Kitswamba H/C III', 6, 002, NULL, 40, NULL, 52, NULL, NULL, '785114118', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(367, 212, NULL, '0', 'Kitwe H/C IV', 7, 002, NULL, 75, NULL, 30, NULL, NULL, '782479505', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(368, 329, NULL, '0', 'Kityerera H/C IV', 7, 002, NULL, 61, NULL, 117, NULL, NULL, '774157719', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(369, 433, NULL, '0', 'Kiwangala H/C IV', 7, 002, NULL, 92, NULL, 115, NULL, NULL, '7014388783', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(370, 1150, NULL, '0', 'Kiwoko Hospital ', 9, 002, NULL, 71, NULL, 79, NULL, NULL, '779652937', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(371, 187, NULL, '0', 'Kiyombya H/C III', 6, 002, NULL, 31, NULL, 25, NULL, NULL, '781177043', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(372, 451, NULL, '0', 'Kiyumba H/C IV', 7, 002, NULL, 59, NULL, 68, NULL, NULL, '753075923', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(373, 204, NULL, '0', 'Kiyunga H/C IV ( Luuka)', 7, 002, NULL, 97, NULL, 29, NULL, NULL, '782389973', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(374, NULL, NULL, '0', 'Koboko H/C IV', 7, 002, NULL, 48, NULL, 11, 14, 'Koboko hub', '794884681', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(375, 995, NULL, '0', 'Kobwin H/C III', 6, 002, NULL, 99, NULL, 105, NULL, NULL, '774662408', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(376, 38, NULL, '0', 'Koch Goma H/C III', 6, 002, NULL, 106, NULL, 10, NULL, NULL, '779652419', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(377, 195, NULL, '0', 'Koch Ongako H/C III', 6, 002, NULL, 23, NULL, 27, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(378, 313, NULL, '0', 'Kojja H/C IV', 7, 002, NULL, 69, NULL, 49, NULL, NULL, '782861434', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(379, 460, NULL, '0', 'Kolonyi H/C III', 6, 002, NULL, 62, NULL, 70, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(380, NULL, NULL, '0', 'Kotido H/C IV', 7, 002, NULL, 49, NULL, 57, 1, 'Kotido Hub', '788244922', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(381, 698, NULL, '0', 'Kubongi Military Hospital', 9, 002, NULL, 85, NULL, 95, NULL, NULL, ' ', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(382, 712, NULL, '0', 'Kulikulinga H/C III', 6, 002, NULL, 87, NULL, 96, NULL, NULL, '782316155', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(383, 50, NULL, '0', 'Kuluva Hospital', 9, 002, NULL, 7, NULL, 11, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(384, 995, NULL, '0', 'Kumi H/C IV', 7, 002, NULL, 50, NULL, 105, NULL, NULL, '785872595', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(385, 995, NULL, '0', 'Kumi Hospital ', 9, 002, NULL, 50, NULL, 105, NULL, NULL, '779466258', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(386, 179, NULL, '0', 'Kwera H/C III', 6, 002, NULL, 22, NULL, 23, NULL, NULL, '774919190', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(387, 649, NULL, '0', 'Kyabenda H/C III', 6, 002, NULL, 37, NULL, 101, NULL, NULL, '772958100', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(388, 137, NULL, '0', 'Kyabugimbi H/C IV ', 7, 002, NULL, 16, NULL, 19, NULL, NULL, '776554509', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(389, 451, NULL, '0', 'Kyanamukaka H/C IV', 7, 002, NULL, 59, NULL, 68, NULL, NULL, '784508486', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(390, 199, NULL, '0', 'Kyangwali H/C IV', 7, 002, NULL, 24, NULL, 28, NULL, NULL, '775522283', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(391, 358, NULL, '0', 'Kyangyenyi H/C III', 6, 002, NULL, 114, NULL, 55, NULL, NULL, '779413048', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(393, 674, NULL, '0', 'Kyara H/C III', 6, 002, NULL, 84, NULL, 92, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(394, 240, NULL, '0', 'Kyarumba PHC III', 6, 002, NULL, 40, NULL, 37, NULL, NULL, '778781736', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(395, 1241, NULL, '0', 'Kyarusozi H/C IV ', 7, 002, NULL, 52, NULL, 60, NULL, NULL, '701323841', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(396, 433, NULL, '0', 'Kyazanga H/C IV', 7, 002, NULL, 92, NULL, 115, NULL, NULL, '782343989', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(397, 629, NULL, '0', 'Kyebe H/C III', 6, 002, NULL, 80, NULL, 83, NULL, NULL, '775734163', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(398, NULL, NULL, '0', 'Kyegegwa H/C IV', 7, 002, NULL, 51, NULL, 58, 9, 'Kyegegwa Hub', '774512264', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(399, 199, NULL, '0', 'Kyehoro H/C III', 6, 002, NULL, 24, NULL, 28, NULL, NULL, '783706631', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(400, 1241, NULL, '0', 'Kyembogo H/C III', 6, 002, NULL, 52, NULL, 60, NULL, NULL, '774107290', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(402, 670, NULL, '0', 'Kyere H/C III', 6, 002, NULL, 100, NULL, 90, NULL, NULL, '773009591', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(403, 195, NULL, '0', 'Labworomor H/C III', 6, 002, NULL, 23, NULL, 27, NULL, NULL, '711994021', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(404, NULL, 1, '0', 'cafu', 1, 002, NULL, 47, NULL, 56, NULL, NULL, '774151891', NULL, '', '', NULL, '', NULL, NULL, '2017-10-15 16:14:16', '2017-11-01 12:20:21', ''),
(405, 360, NULL, '0', 'Laguti H/C III', 6, 002, NULL, 78, NULL, 56, NULL, NULL, '782274125', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(406, NULL, NULL, '0', 'Lalogi  H/C IV ', 7, 002, NULL, 23, NULL, 102, 2, 'Lalogi Hub ', '777328083', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(407, 195, NULL, '0', 'Lamanober H/C III', 6, 002, NULL, 23, NULL, 27, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(408, 38, NULL, '0', 'Langol H/C II', 5, 002, NULL, 106, NULL, 10, NULL, NULL, '711771296', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(409, 195, NULL, '0', 'Lapainat H/C III', 6, 002, NULL, 23, NULL, 27, NULL, NULL, '777646767', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(410, 195, NULL, '0', 'Laroo H/C III', 6, 002, NULL, 23, NULL, 27, NULL, NULL, '783157225', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(411, 38, NULL, '0', 'Latoro H/C II', 5, 002, NULL, 23, NULL, 10, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(412, 195, NULL, '0', 'Layibi Techo H/C III', 6, 002, NULL, 23, NULL, 27, NULL, NULL, '782554660', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(413, 256, NULL, '0', 'Lira  Kato H/C III (  Agago )', 6, 002, NULL, 101, NULL, 39, NULL, NULL, '789914352', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(414, 416, NULL, '0', 'Lira Medical Centre ', 12, 002, NULL, 54, NULL, 61, NULL, NULL, '783463131', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(415, 256, NULL, '0', 'Lira Palwo H/C III', 6, 002, NULL, 101, NULL, 39, NULL, NULL, '777483084', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(416, NULL, NULL, '0', 'Lira R R Hospital', 9, 002, NULL, 54, NULL, 61, 4, 'Lira Hub', '701652073', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(417, 360, NULL, '0', 'Lobo  rom H/C III', 6, 002, NULL, 47, NULL, 56, NULL, NULL, '782635594', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(418, 374, NULL, '0', 'Lobule H/C III', 6, 002, NULL, 48, NULL, 11, NULL, NULL, '773992252', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(419, 439, NULL, '0', 'Lokung H/C III', 6, 002, NULL, 53, NULL, 65, NULL, NULL, '775643537', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(420, 696, NULL, '0', 'Lorengedwat H/C III', 6, 002, NULL, 70, NULL, 94, NULL, NULL, '774092392', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(421, 3, NULL, '0', 'Lugole H/C II', 5, 002, NULL, 6, NULL, 4, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(422, 195, NULL, '0', 'Lugore H/C II', 5, 002, NULL, 23, NULL, 27, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(423, 256, NULL, '0', 'Lukole H/C III', 6, 002, NULL, 101, NULL, 39, NULL, NULL, '772923667', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(424, 450, NULL, '0', 'Lumino H/C III', 6, 002, NULL, 17, NULL, 67, NULL, NULL, '774110673', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(425, NULL, NULL, '0', 'Luwero H/C IV ', 7, 002, NULL, 55, NULL, 63, 11, 'Luweero H/C IV', '788047051', NULL, '', '', NULL, '', NULL, NULL, '2017-10-15 16:14:16', '2017-11-22 13:10:20', ''),
(426, 788, NULL, '0', 'Luwunga H/C III', 6, 002, NULL, 86, NULL, 24, NULL, NULL, '788692649', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(427, 227, NULL, '0', 'Lwala Hospital ', 9, 002, NULL, 32, NULL, 34, NULL, NULL, '755198300', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(428, 629, NULL, '0', 'Lwamaggwa H/C III', 6, 002, NULL, 80, NULL, 83, NULL, NULL, '774678765', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(429, 460, NULL, '0', 'Lwangoli H/C III', 6, 002, NULL, 62, NULL, 70, NULL, NULL, '774176589', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(430, 629, NULL, '0', 'Lwankoni H/C III', 6, 002, NULL, 80, NULL, 83, NULL, NULL, '704399155', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(431, 669, NULL, '0', 'Lwebitakuli H/C III', 6, 002, NULL, 82, NULL, 93, NULL, NULL, '702966204', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(432, 669, NULL, '0', 'Lwemiyaga H/C III', 6, 002, NULL, 82, NULL, 93, NULL, NULL, '702663871', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(433, NULL, NULL, '0', 'Lwengo H/C IV', 7, 002, NULL, 92, NULL, 115, 10, 'Lwengo Hub ', '772434073', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(434, NULL, NULL, '0', 'Lyantonde Hospital ', 9, 002, NULL, 56, NULL, 64, 10, 'Lyantonde Hub', '782319989', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(435, 239, NULL, '0', 'Mabaale H/C III', 6, 002, NULL, 43, NULL, 36, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(437, 659, NULL, '0', 'Mabona H/C III', 6, 002, NULL, 27, NULL, 87, NULL, NULL, '782866505', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(438, NULL, NULL, '0', 'Maddu H/C IV', 7, 002, NULL, 89, NULL, 122, 10, 'Maddu ', '706805773', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(439, NULL, NULL, '0', 'Madi Opei H/C IV ', 7, 002, NULL, 53, NULL, 65, 2, 'Madi Opei Hub', '774262576', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(440, 698, NULL, '0', 'St Elizabeth H/C IV-Magale', 7, 002, NULL, 57, NULL, 95, NULL, NULL, '771452797', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(441, 649, NULL, '0', 'Mahyoro H/C III', 6, 002, NULL, 37, NULL, 101, NULL, NULL, '779403403', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(442, 341, NULL, '0', 'Makathi H/C II', 5, 002, NULL, 40, NULL, 52, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(443, 211, NULL, '0', 'Makenke H/C IV (UPDF) ', 7, 002, NULL, 63, NULL, 71, NULL, NULL, '782077202', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(444, 311, NULL, '0', 'Makonge H/C III', 6, 002, NULL, 11, NULL, 48, NULL, NULL, '785297473', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(445, 669, NULL, '0', 'Makukuulu H/C III', 6, 002, NULL, 93, NULL, 93, NULL, NULL, '706411798', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(446, 698, NULL, '0', 'Malaba H/C III', 6, 002, NULL, 85, NULL, 95, NULL, NULL, '701421427', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(447, 56, NULL, '0', 'Malera H/C III', 6, 002, NULL, 12, NULL, 13, NULL, NULL, '772038867', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(448, 329, NULL, '0', 'Malongo H/C III', 6, 002, NULL, 61, NULL, 117, NULL, NULL, '752980622', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(449, 50, NULL, '0', ' Maracha Hospital (St Joseph)', 9, 002, NULL, 58, NULL, 11, NULL, NULL, '788364706', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(450, NULL, NULL, '0', 'Masafu Hospital', 9, 002, NULL, 17, NULL, 67, 7, 'Masafu Hub', '774610555', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(451, NULL, NULL, '0', 'Masaka R R Hospital', 9, 002, NULL, 59, NULL, 68, 10, 'Masaka Hub', '777832111', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(452, NULL, NULL, '0', 'Masindi Hospital', 9, 002, NULL, 60, NULL, 69, 6, 'Masindi Hub', '784531512', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(453, NULL, NULL, '0', 'Matany Hospital', 9, 002, NULL, 105, NULL, 103, 1, 'Matany Hub', '783477077', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(454, 669, NULL, '0', 'Mateete H/C III ', 6, 002, NULL, 82, NULL, 93, NULL, NULL, '702806337', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(455, 712, NULL, '0', 'Matuma H/C III', 6, 002, NULL, 87, NULL, 96, NULL, NULL, '753814741', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(456, 204, NULL, '0', 'Mayuge H/C III (Mayuge)', 6, 002, NULL, 61, NULL, 29, NULL, NULL, '755758657', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(457, 224, NULL, '0', 'Maziba H/C IV', 7, 002, NULL, 30, NULL, 33, NULL, NULL, '785005857', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(458, 659, NULL, '0', 'Mbaare H/C III', 6, 002, NULL, 27, NULL, 87, NULL, NULL, '782878717', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(459, 1241, NULL, '0', 'Mbale H/C II', 5, 002, NULL, 52, NULL, 60, NULL, NULL, '776823122', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(460, NULL, NULL, '0', 'Mbale R R Hospital', 11, 002, NULL, 62, NULL, 70, 7, 'Mbale Hub', '703356181', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(461, 211, NULL, '0', 'Mbarara H/C IV', 7, 002, NULL, 63, NULL, 71, NULL, NULL, '782320620', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(462, 211, NULL, '0', 'Mbarara Military Hospital', 9, 002, NULL, 63, NULL, 71, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(465, 2493, NULL, '0', 'Mengo Hospital-EMTCT', 9, 002, NULL, 35, NULL, 41, NULL, NULL, '784233988', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(466, 712, NULL, '0', 'Midigo H/C IV', 7, 002, NULL, 87, NULL, 96, NULL, NULL, '754217120', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(467, 705, NULL, '0', 'Mildmay Hospital Uganda ', 12, 002, NULL, 35, NULL, 116, NULL, NULL, '701776096', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(468, 195, NULL, '0', 'Minakulu Bobi H/C II (Gulu)', 5, 002, NULL, 23, NULL, 27, NULL, NULL, '777048072', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(469, NULL, NULL, '0', 'Mitooma H/C IV', 7, 002, NULL, 111, NULL, 72, 12, 'Mitooma Hub', '773393977', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(470, NULL, NULL, '0', 'Mityana Hospital', 9, 002, NULL, 64, NULL, 73, 11, 'Mityana Hub', '774220741', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(471, 211, NULL, '0', 'Rubaya H/C III (Mbarara)', 6, 002, NULL, 63, NULL, 71, NULL, NULL, '701241770', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(472, NULL, NULL, '0', 'Moroto R R Hospital', 11, 002, NULL, 65, NULL, 74, 1, 'Moroto Hub', '759734243', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(473, 4, NULL, '0', 'Morulem H/C III', 6, 002, NULL, 1, NULL, 5, NULL, NULL, '781528287', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(474, NULL, NULL, '0', 'Moyo Hospital', 9, 002, NULL, 66, NULL, 75, 3, 'Moyo Hub', '0782469752', NULL, '', 'SYDNEY AGUAKA', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(475, 398, NULL, '0', 'Mpara H/C III', 6, 002, NULL, 51, NULL, 58, NULL, NULL, '782663996', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(476, 199, NULL, '0', 'Mparangasi H/C III', 6, 002, NULL, 24, NULL, 28, NULL, NULL, '782593337', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(477, 224, NULL, '0', 'Mparo H/C IV', 7, 002, NULL, 30, NULL, 33, NULL, NULL, '782769421', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(478, NULL, NULL, '0', 'Mpigi H/C IV ', 7, 002, NULL, 67, NULL, 26, 10, 'Mpigi Hub', '782350920', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(479, 222, NULL, '0', 'Mpumudde H/C IV (Jinja)', 7, 002, NULL, 28, NULL, 31, NULL, NULL, '752815738', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(480, NULL, NULL, '0', 'Mubende R R Hospital ', 11, 002, NULL, 68, NULL, 76, 11, 'Mubende Hub', '754676881', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(481, 480, NULL, '0', 'Mubende Rehabilitation Centre ', 12, 002, NULL, 68, NULL, 76, NULL, NULL, '775405287', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(482, 360, NULL, '0', 'Mucwini H/C III', 6, 002, NULL, 47, NULL, 56, NULL, NULL, '713315241', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(483, 191, NULL, '0', 'Muduuma H/C III', 6, 002, NULL, 67, NULL, 26, NULL, NULL, '706031304', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(484, 187, NULL, '0', 'Mugusu H/C III', 6, 002, NULL, 31, NULL, 25, NULL, NULL, '783482234', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(485, 341, NULL, '0', 'Muhokya H/C III', 6, 002, NULL, 40, NULL, 52, NULL, NULL, '774552460', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(486, 199, NULL, '0', 'Muhwiju H/C III', 6, 002, NULL, 24, NULL, 28, NULL, NULL, '782569339', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(487, 341, NULL, '0', 'Mukathi H/C III', 6, 002, NULL, 40, NULL, 52, NULL, NULL, '772823662', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(488, 224, NULL, '0', 'Muko H/C IV ', 7, 002, NULL, 30, NULL, 33, NULL, NULL, '775662135', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(489, 313, NULL, '0', 'Mukono Municipal H/C IV', 7, 002, NULL, 69, NULL, 49, NULL, NULL, '779256124', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(490, 698, NULL, '0', 'Mukuju H/C IV', 7, 002, NULL, 85, NULL, 95, NULL, NULL, '0702/0772456893', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(492, 995, NULL, '0', 'Mukura H/C III', 6, 002, NULL, 99, NULL, 105, NULL, NULL, '704062016', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(494, 698, NULL, '0', 'Mulanda H/C IV', 7, 002, NULL, 85, NULL, 95, NULL, NULL, '782433120', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(495, 2493, NULL, '0', 'Murchison Bay Hospital ', 9, 002, NULL, 35, NULL, 41, NULL, NULL, '703529428', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(496, 240, NULL, '0', 'Musyenene H/C III', 6, 002, NULL, 40, NULL, 37, NULL, NULL, '781409464', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(497, 355, NULL, '0', 'St Francis Hospital (Mutolere)', 9, 002, NULL, 46, NULL, 54, NULL, NULL, '702837989', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(498, 279, NULL, '0', 'Muyembe  H/C IV', 7, 002, NULL, 94, NULL, 44, NULL, NULL, '782857543', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(499, 470, NULL, '0', 'Mwera H/C IV', 7, 002, NULL, 64, NULL, 73, NULL, NULL, '704536996', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(500, 360, NULL, '0', 'Naam Okora H/C III', 6, 002, NULL, 47, NULL, 56, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(501, 144, NULL, '0', 'Nabiganda H/C III', 6, 002, NULL, 18, NULL, 20, NULL, NULL, '775797046', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(502, 629, NULL, '0', 'Nabigasa H/C III', 6, 002, NULL, 80, NULL, 83, NULL, NULL, '753196368', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(503, 696, NULL, '0', 'Nabilatuk H/C IV', 7, 002, NULL, 70, NULL, 94, NULL, NULL, '782486566', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(504, 313, NULL, '0', 'Naggalama Hospital ', 9, 002, NULL, 69, NULL, 49, NULL, NULL, '782465300', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(505, 2493, NULL, '0', 'Naguru Police H/C IV', 7, 002, NULL, 35, NULL, 41, NULL, NULL, '774154776,774887838', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(506, 696, NULL, '0', 'Nakapiripirit Field Hospital', 9, 002, NULL, 70, NULL, 94, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(507, 696, NULL, '0', 'Nakapiripirit H/C III', 6, 002, NULL, 70, NULL, 94, NULL, NULL, '773713733', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(508, 1150, NULL, '0', 'Nakaseke  Hospital ', 9, 002, NULL, 71, NULL, 79, NULL, NULL, '782163363', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(509, 762, NULL, '0', 'Nakasongola Military Hospital ', 9, 002, NULL, 72, NULL, 77, NULL, NULL, '706865209', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(510, 2493, NULL, '0', 'Dr Charlse Farthing Memorial Clinic', 1, 002, NULL, 35, NULL, 41, NULL, NULL, '200903497', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(511, 659, NULL, '0', 'Nakivale H/C III', 6, 002, NULL, 27, NULL, 87, NULL, NULL, '774234863', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(512, 460, NULL, '0', 'Namakwekwe H/C III', 6, 002, NULL, 62, NULL, 70, NULL, NULL, '779002615', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(513, 696, NULL, '0', 'Namalu H/C III', 6, 002, NULL, 70, NULL, 94, NULL, NULL, '782925904', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(514, 460, NULL, '0', 'Namanyonyi H/C III', 6, 002, NULL, 62, NULL, 70, NULL, NULL, '779968470', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(515, 31, NULL, '0', 'Namasale H/C III', 6, 002, NULL, 3, NULL, 7, NULL, NULL, '773742299', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(516, 460, NULL, '0', 'Namawanga H/C III', 6, 002, NULL, 62, NULL, 70, NULL, NULL, '787273406', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(517, 705, NULL, '0', 'Namayumba H/C IV', 7, 002, NULL, 86, NULL, 116, NULL, NULL, '775379510', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(518, 204, NULL, '0', 'Nambale H/C III', 6, 002, NULL, 26, NULL, 29, NULL, NULL, '773131980', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(519, 3, NULL, '0', 'Nambieso H/C III', 6, 002, NULL, 6, NULL, 4, NULL, NULL, '777568308', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(520, 360, NULL, '0', 'Namokora H/C IV', 7, 002, NULL, 47, NULL, 56, NULL, NULL, '781099201', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(521, 2484, NULL, '0', 'Namugongo H/C III (kaliro)', 6, 002, NULL, 34, NULL, 42, NULL, NULL, '782895562', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(522, 204, NULL, '0', 'Namungalwe H/C III', 6, 002, NULL, 26, NULL, 29, NULL, NULL, '774021328', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(523, 2493, NULL, '0', 'Holy Cross Orthodox (Namungoona) Hospital ', 9, 002, NULL, 35, NULL, 41, NULL, NULL, '774450424', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(524, 123, NULL, '0', 'Namutumba H/C  III (Namutumba)', 6, 002, NULL, 73, NULL, 17, NULL, NULL, '700728077', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(525, 2484, NULL, '0', 'Namwendwa H/C IV', 7, 002, NULL, 36, NULL, 42, NULL, NULL, '781430612', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(526, 2484, NULL, '0', 'Nankandulo H/C IV', 7, 002, NULL, 36, NULL, 42, NULL, NULL, '773772209', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(527, 99, NULL, '0', 'Nankoma H/C IV', 7, 002, NULL, 10, NULL, 15, NULL, NULL, '782767193', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(529, 123, NULL, '0', 'Nawaikoke H/C III', 6, 002, NULL, 34, NULL, 17, NULL, NULL, '774679588', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(530, 788, NULL, '0', 'Ndejje H/C III', 6, 002, NULL, 86, NULL, 24, NULL, NULL, '752613587', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(531, NULL, NULL, '0', 'Nebbi Hospital ', 9, 002, NULL, 74, NULL, 78, 3, 'Nebbi Hub', '772672761', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(532, 3, NULL, '0', 'Ngai H/C III', 6, 002, NULL, 77, NULL, 4, NULL, NULL, '774378411', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(533, 191, NULL, '0', 'Ngando H/C III', 6, 002, NULL, 88, NULL, 26, NULL, NULL, '774916493', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(534, 659, NULL, '0', 'Ngarama H/C III', 6, 002, NULL, 27, NULL, 87, NULL, NULL, '703188986', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(535, 416, NULL, '0', 'Ngetta H/C III', 6, 002, NULL, 54, NULL, 61, NULL, NULL, '771406225', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(536, 212, NULL, '0', 'Ngoma H/C III (Ntungamo)', 6, 002, NULL, 75, NULL, 30, NULL, NULL, '771606513', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(537, 995, NULL, '0', 'Ngora Freda car Hospital (NGO)', 9, 002, NULL, 99, NULL, 105, NULL, NULL, '777751164', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(538, 199, NULL, '0', 'Ngurwe H/C II', 5, 002, NULL, 24, NULL, 28, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(539, 311, NULL, '0', 'Nkokonjeru Hospital (Buikwe)', 9, 002, NULL, 11, NULL, 48, NULL, NULL, '702291173', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(540, 478, NULL, '0', 'Nkozi Hospital ', 9, 002, NULL, 67, NULL, 26, NULL, NULL, '781486244', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(541, 187, NULL, '0', 'Nkuruba H/C  III', 6, 002, NULL, 31, NULL, 25, NULL, NULL, '777640973', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(542, 2493, NULL, '0', 'Nsambya Hospital ', 9, 002, NULL, 35, NULL, 41, NULL, NULL, '772438740', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(543, 659, NULL, '0', 'Nshungyezi H/C III', 6, 002, NULL, 27, NULL, 87, NULL, NULL, '773260477', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(544, NULL, NULL, '0', 'Nsiika H/C IV', 7, 002, NULL, 109, NULL, 80, 12, 'Nsiika Hub', '783388777', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(545, 123, NULL, '0', 'Nsinze H/C IV ', 7, 002, NULL, 73, NULL, 17, NULL, NULL, '774023943', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(547, 649, NULL, '0', 'Ntara H/C IV', 7, 002, NULL, 37, NULL, 101, NULL, NULL, '787654289', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(549, 212, NULL, '0', 'Ntungamo H/C III', 6, 002, NULL, 75, NULL, 30, NULL, NULL, '772626966', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(550, 669, NULL, '0', 'Ntuusi H/C IV', 7, 002, NULL, 82, NULL, 93, NULL, NULL, '702328641', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(551, NULL, NULL, '0', 'Ntwetwe H/C IV ', 7, 002, NULL, 91, NULL, 106, 11, 'Ntwetwe Hub ', '772434967', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(553, 649, NULL, '0', 'Nyabbani H/C III', 6, 002, NULL, 37, NULL, 101, NULL, NULL, '78365254', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(554, 240, NULL, '0', 'Nyabirongo H/C III', 6, 002, NULL, 40, NULL, 37, NULL, NULL, '781552142', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(555, 240, NULL, '0', 'Nyabugando H/C III', 6, 002, NULL, 40, NULL, 37, NULL, NULL, '755995988', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(556, 124, NULL, '0', 'Nyahuka H/C IV', 7, 002, NULL, 15, NULL, 18, NULL, NULL, '777579391', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(557, 1241, NULL, '0', 'Nyakarongo  H/C   II', 5, 002, NULL, 52, NULL, 60, NULL, NULL, '779775070', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(558, NULL, NULL, '0', 'Nyakibale Hospital', 9, 002, NULL, 81, NULL, 81, 13, 'Nyakibale Hub', '782061394', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(559, 659, NULL, '0', 'Nyakitunda H/C III', 6, 002, NULL, 27, NULL, 87, NULL, NULL, '753059587', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(560, 4, NULL, '0', 'Nyakwae H/C III', 6, 002, NULL, 1, NULL, 5, NULL, NULL, '392612587', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(561, 212, NULL, '0', 'Nyakyera H/C III', 6, 002, NULL, 75, NULL, 30, NULL, NULL, '779338969', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(562, 1241, NULL, '0', 'Nyamabuga H/C III', 6, 002, NULL, 52, NULL, 60, NULL, NULL, '783887158', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(563, 644, NULL, '0', 'Nyamarebe H/C III', 6, 002, NULL, 25, NULL, 85, NULL, NULL, '706289046', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(564, 211, NULL, '0', 'Nyamitanga H/C III', 6, 002, NULL, 63, NULL, 71, NULL, NULL, '751644743', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(565, 659, NULL, '0', 'Nyamuyanja H/C IV', 7, 002, NULL, 27, NULL, 87, NULL, NULL, '753622521', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(566, 1241, NULL, '0', 'Nyankwanzi H/C III', 6, 002, NULL, 52, NULL, 60, NULL, NULL, '771447484', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(568, 659, NULL, '0', 'Nyarubungo H/C III', 6, 002, NULL, 27, NULL, 87, NULL, NULL, '774030609', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(569, 311, NULL, '0', 'Nyenga Hospital', 9, 002, NULL, 11, NULL, 48, NULL, NULL, '752832172', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(570, 56, NULL, '0', 'Nyero H/C III', 6, 002, NULL, 50, NULL, 13, NULL, NULL, '782225048', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(571, 425, NULL, '0', 'Nyimbwa H/C IV', 7, 002, NULL, 55, NULL, 63, NULL, NULL, '702145435', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(572, 227, NULL, '0', 'Ochero H/C III', 6, 002, NULL, 32, NULL, 34, NULL, NULL, '782146065', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(573, 195, NULL, '0', 'Odek H/C III', 6, 002, NULL, 23, NULL, 27, NULL, NULL, '777053335', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(574, 360, NULL, '0', 'Ogili H/C III', 6, 002, NULL, 47, NULL, 56, NULL, NULL, ' ', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(575, 416, NULL, '0', 'Ogur H/C IV', 7, 002, NULL, 54, NULL, 61, NULL, NULL, '776720330', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(576, 416, NULL, '0', 'Okole H/C III', 6, 002, NULL, 104, NULL, 61, NULL, NULL, '774690495', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(577, 416, NULL, '0', 'Okwongo H/C III', 6, 002, NULL, 107, NULL, 61, NULL, NULL, '782556798', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(578, 50, NULL, '0', 'Oli H/C IV', 7, 002, NULL, 7, NULL, 11, NULL, NULL, '772382131', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(579, 416, NULL, '0', 'Olilim H/C III', 6, 002, NULL, 107, NULL, 61, NULL, NULL, '782578681', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(581, 360, NULL, '0', 'Omiya Anyima H/C III', 6, 002, NULL, 47, NULL, 56, NULL, NULL, '757111305', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', '');
INSERT INTO `facility` (`id`, `parentid`, `ipid`, `code`, `name`, `facilitylevelid`, `type`, `isactive`, `districtid`, `regionid`, `hubid`, `healthregionid`, `hubname`, `phonenumber`, `distancefromhub`, `email`, `contactperson`, `address`, `returnaddress`, `longitude`, `latitude`, `created_at`, `updated_at`, `createdby`) VALUES
(582, 23, NULL, '0', 'Omoro H/C III', 6, 002, NULL, 102, NULL, 108, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(583, 50, NULL, '0', 'Omugo H/C IV', 7, 002, NULL, 7, NULL, 11, NULL, NULL, '790156980', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(584, 195, NULL, '0', 'Ongako H/C III', 6, 002, NULL, 23, NULL, 27, NULL, NULL, '772939754', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(585, 416, NULL, '0', 'Ongica H/C III', 6, 002, NULL, 54, NULL, 61, NULL, NULL, '774752244', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(586, 56, NULL, '0', 'Ongino H/C III', 6, 002, NULL, 50, NULL, 13, NULL, NULL, '753760027', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(587, 3, NULL, '0', 'Opit H/C III', 6, 002, NULL, 23, NULL, 4, NULL, NULL, '784447105', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(588, 195, NULL, '0', 'Orapwoyo H/C II', 5, 002, NULL, 23, NULL, 27, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(589, 50, NULL, '0', 'Oriajin Hospital', 9, 002, NULL, 7, NULL, 11, NULL, NULL, '718218901', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(590, 195, NULL, '0', 'Oroko H/C II', 5, 002, NULL, 23, NULL, 27, NULL, NULL, '774593194', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(591, 360, NULL, '0', 'Orom H/C III', 6, 002, NULL, 47, NULL, 56, NULL, NULL, '754315651', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(592, 416, NULL, '0', 'Orum H/C IV', 7, 002, NULL, 107, NULL, 61, NULL, NULL, '777053544', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(593, 4, NULL, '0', 'Orwamuge H/C III', 6, 002, NULL, 1, NULL, 5, NULL, NULL, '774469277', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(594, 53, NULL, '0', 'Otong H/C II', 5, 002, NULL, 5, NULL, 12, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(595, 3, NULL, '0', 'Otwal H/C III', 6, 002, NULL, 77, NULL, 4, NULL, NULL, '774604019', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(596, 53, NULL, '0', 'Owek Lakim H/C III', 6, 002, NULL, 5, NULL, 12, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(597, 3, NULL, '0', 'Owiny H/C II', 5, 002, NULL, 6, NULL, 4, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(598, 53, NULL, '0', 'Pabbo H/C III (Amuru Govt)', 6, 002, NULL, 5, NULL, 12, NULL, NULL, '772033221', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(599, 195, NULL, '0', 'Pabwo H/C III (Gulu)', 6, 002, NULL, 23, NULL, 27, NULL, NULL, '777645760', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(600, 608, NULL, '0', 'Pader H/C III', 6, 002, NULL, 78, NULL, 107, NULL, NULL, '783882250', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(601, 439, NULL, '0', 'Padibe H/C IV', 7, 002, NULL, 53, NULL, 65, NULL, NULL, '781399224', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(602, 649, NULL, '0', 'Padre Pio H/C III', 6, 002, NULL, 37, NULL, 101, NULL, NULL, '777360407', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(603, 416, NULL, '0', 'PAG H/C IV', 7, 002, NULL, 54, NULL, 61, NULL, NULL, '777073408', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(604, 195, NULL, '0', 'Paibona H/C II', 5, 002, NULL, 23, NULL, 27, NULL, NULL, '772355467', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(605, 195, NULL, '0', 'Paicho H/C II', 5, 002, NULL, 23, NULL, 27, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(606, 256, NULL, '0', 'Paimol H/C III', 6, 002, NULL, 101, NULL, 39, NULL, NULL, '756197662', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(607, 360, NULL, '0', 'Pajimo Military H/C III', 6, 002, NULL, 47, NULL, 56, NULL, NULL, '783774436', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(608, NULL, NULL, '0', 'Pajule H/C  IV ', 7, 002, NULL, 78, NULL, 107, 2, 'Pajule Hub ', '753075677', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(609, 439, NULL, '0', 'Palabek  Gem H/C III', 6, 002, NULL, 53, NULL, 65, NULL, NULL, '774640138', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(610, 439, NULL, '0', 'Palabek Ogili H/C III', 6, 002, NULL, 53, NULL, 65, NULL, NULL, '775989446', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(611, 439, NULL, '0', 'Palabek-Kal H/C III', 6, 002, NULL, 53, NULL, 65, NULL, NULL, '774612100', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(612, 195, NULL, '0', 'Palenga H/C II', 5, 002, NULL, 23, NULL, 27, NULL, NULL, '772184331', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(613, 614, NULL, '0', 'Pallisa H/C III', 6, 002, NULL, 79, NULL, 82, NULL, NULL, '782518096', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(614, NULL, NULL, '0', 'Pallisa General Hospital ', 9, 002, NULL, 79, NULL, 82, 7, 'Palisa General Hospital', '782642627', NULL, '', '', NULL, '', NULL, NULL, '2017-10-15 16:14:16', '2017-11-22 13:09:56', ''),
(615, 439, NULL, '0', 'Paloga H/C III', 6, 002, NULL, 53, NULL, 65, NULL, NULL, '782449096', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(616, 121, NULL, '0', 'Paraa H/C II', 5, 002, NULL, 14, NULL, 16, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(617, 195, NULL, '0', 'Patiko H/C III', 6, 002, NULL, 23, NULL, 27, NULL, NULL, '712390584', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(618, 256, NULL, '0', 'Patongo H/C III', 6, 002, NULL, 101, NULL, 39, NULL, NULL, '772923667', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(619, 53, NULL, '0', 'Pawel H/C II', 5, 002, NULL, 5, NULL, 12, NULL, NULL, '715557557', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(620, 2493, NULL, '0', 'PIDC (Baylor-Mulago)', 12, 002, NULL, 35, NULL, 41, NULL, NULL, '782012948', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(621, 670, NULL, '0', 'Pingire H/C III', 6, 002, NULL, 100, NULL, 90, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(622, 53, NULL, '0', 'Pogo H/C II', 5, 002, NULL, 5, NULL, 12, NULL, NULL, '718756866', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(623, 256, NULL, '0', 'Porogali H/C II', 5, 002, NULL, 78, NULL, 39, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(624, 195, NULL, '0', 'Pugwinyi H/C II', 5, 002, NULL, 23, NULL, 27, NULL, NULL, '777364439', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(625, 195, NULL, '0', 'Punena H/C III', 6, 002, NULL, 23, NULL, 27, NULL, NULL, '782573933', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(626, 38, NULL, '0', 'Purongo H/C III', 6, 002, NULL, 106, NULL, 10, NULL, NULL, '77578230', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(628, 629, NULL, '0', 'Rakai Health Sciences Program', 12, 002, NULL, 80, NULL, 83, NULL, NULL, '782685412', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(629, NULL, NULL, '0', 'Rakai Hospital', 9, 002, NULL, 80, NULL, 83, 10, 'Rakai Hub', '782532085', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(630, 438, NULL, '0', 'Rapha Medical Centre', 12, 002, NULL, 89, NULL, 122, NULL, NULL, '774947921', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(631, NULL, NULL, '0', 'Rhino Camp H/C IV', 7, 002, NULL, 7, NULL, 11, 3, 'Rhino Camp hub', '773072013', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(632, 212, NULL, '0', 'Rubaare H/C IV', 7, 002, NULL, 75, NULL, 30, NULL, NULL, '705221137', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(633, 2493, NULL, '0', 'Lubaga Hospital', 9, 002, NULL, 35, NULL, 41, NULL, NULL, '782955139', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(634, 224, NULL, '0', 'Rubaya H/C IV (Kabale)', 7, 002, NULL, 30, NULL, 33, NULL, NULL, '778826036', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(635, 698, NULL, '0', 'Rubongi Military Hospital', 9, 002, NULL, 85, NULL, 95, NULL, NULL, '772440195', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(636, 355, NULL, '0', 'Rubuguri H/C IV', 7, 002, NULL, 46, NULL, 54, NULL, NULL, '778280024', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(637, 659, NULL, '0', 'Rugaaga H/C IV', 7, 002, NULL, 27, NULL, 87, NULL, NULL, '705012059', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(638, 224, NULL, '0', 'Rugarama Hospital', 9, 002, NULL, 30, NULL, 33, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(639, NULL, NULL, '0', 'Rugazi H/C IV', 7, 002, NULL, 113, NULL, 84, 12, 'Rugazi Hub', '788772011', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(640, 212, NULL, '0', 'Ruhaama H/C III', 6, 002, NULL, 75, NULL, 30, NULL, NULL, '785369350', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(641, 659, NULL, '0', 'Ruhiira H/C III', 6, 002, NULL, 27, NULL, 87, NULL, NULL, '776384538', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(642, 224, NULL, '0', 'Ruhija H/C III', 6, 002, NULL, 30, NULL, 33, NULL, NULL, '773450360', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(643, 558, NULL, '0', 'Ruhinda H/C III', 6, 002, NULL, 81, NULL, 81, NULL, NULL, '773947209', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(644, NULL, NULL, '0', 'Ruhoko H/C IV', 7, 002, NULL, 25, NULL, 85, 12, 'Ruhoko Hub', '782842624', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(645, 644, NULL, '0', 'Rukiri H/C III', 6, 002, NULL, 25, NULL, 85, NULL, NULL, '783013988', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(646, 212, NULL, '0', 'Rukoni H/C III', 6, 002, NULL, 75, NULL, 30, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(647, 341, NULL, '0', 'Rukooki H/C III', 6, 002, NULL, 40, NULL, 52, NULL, NULL, '783441142', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(648, 558, NULL, '0', 'Rukungiri H/C IV', 7, 002, NULL, 81, NULL, 81, NULL, NULL, '775979607', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(649, NULL, NULL, '0', 'Rukunyu H/C IV', 7, 002, NULL, 37, NULL, 101, 9, 'Rukunyu Hub ', '775605861', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(650, NULL, NULL, '0', 'Rushere Community Hospital', 9, 002, NULL, 45, NULL, 86, 12, 'Rushere Hub', '704876202', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(651, 212, NULL, '0', 'Rushooka H/C II', 5, 002, NULL, 75, NULL, 30, NULL, NULL, '702257762', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(652, 187, NULL, '0', 'Ruteete H/C III', 7, 002, NULL, 31, NULL, 25, NULL, NULL, '772912839', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(653, 1241, NULL, '0', 'Rwaitengya H/C II', 5, 002, NULL, 52, NULL, 60, NULL, NULL, '777741707', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(654, 558, NULL, '0', 'Rwakabengo H/C III', 6, 002, NULL, 81, NULL, 81, NULL, NULL, '703451064', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(655, 649, NULL, '0', 'Rwamwanja H/C III', 6, 002, NULL, 37, NULL, 101, NULL, NULL, '777244786', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(656, 212, NULL, '0', 'Rwashamaire H/C IV', 7, 002, NULL, 75, NULL, 30, NULL, NULL, '772654754', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(657, 124, NULL, '0', 'Rwebisengo H/C III', 6, 002, NULL, 112, NULL, 18, NULL, NULL, '779780301', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(658, 212, NULL, '0', 'Rweikiniro H/C III', 6, 002, NULL, 75, NULL, 30, NULL, NULL, '781711510', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(659, NULL, NULL, '0', 'Rwekubo H/C IV', 7, 002, NULL, 27, NULL, 87, 12, 'Rwekubo Hub', '782526859', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(660, 650, NULL, '0', 'Rwemikoma H/C III', 6, 002, NULL, 45, NULL, 86, NULL, NULL, '775578669', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(661, 644, NULL, '0', 'Rwenkobwa H/C III', 6, 002, NULL, 25, NULL, 85, NULL, NULL, '754294972', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(662, 199, NULL, '0', 'Rwenyawawa H/C III', 6, 002, NULL, 24, NULL, 28, NULL, NULL, '777316225', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(663, 341, NULL, '0', 'Rwesande H/C IV ', 7, 002, NULL, 40, NULL, 52, NULL, NULL, '7048396118', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(665, 1241, NULL, '0', 'Rwibale H/C II', 5, 002, NULL, 52, NULL, 60, NULL, NULL, '753503776', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(666, 187, NULL, '0', 'Rwimi H/C III', 6, 002, NULL, 31, NULL, 25, NULL, NULL, '772329079', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(667, 705, NULL, '0', 'Saidinah Abubaker Hospital', 9, 002, NULL, 86, NULL, 116, NULL, NULL, '701163363', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(668, 313, NULL, '0', 'Seeta Nazigo H/C III', 6, 002, NULL, 69, NULL, 49, NULL, NULL, '782796891', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(669, NULL, NULL, '0', 'Ssembabule H/C IV', 7, 002, NULL, 82, NULL, 93, 10, 'Ssembabule Hub', '782310690', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(670, NULL, NULL, '0', 'Serere H/C IV', 7, 002, NULL, 100, NULL, 90, 5, 'Serere Hub', '702194595', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(671, 358, NULL, '0', 'Shuku H/C IV', 7, 002, NULL, 114, NULL, 55, NULL, NULL, '782404266', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(672, 279, NULL, '0', 'Siipi H/C III', 6, 002, NULL, 39, NULL, 44, NULL, NULL, '784895000', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(673, 86, NULL, '0', 'Sironko H/C III', 6, 002, NULL, 83, NULL, 114, NULL, NULL, '775009313', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(674, NULL, NULL, '0', 'Soroti R R Hospital', 11, 002, NULL, 84, NULL, 92, 5, 'Soroti Hub', '772686962', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(675, 195, NULL, '0', 'SOS CU H/C II GULU', 5, 002, NULL, 23, NULL, 27, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(676, 1241, NULL, '0', 'St Adolf H/C III (Butiiti)', 6, 002, NULL, 52, NULL, 60, NULL, NULL, '783867300', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(677, 2493, NULL, '0', 'St Balikuddembe Market/Uganda Cares  AHF', 12, 002, NULL, 35, NULL, 41, NULL, NULL, '774223400', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(678, 36, NULL, '0', 'St Clare Orungo H/C III', 6, 002, NULL, 4, NULL, 8, NULL, NULL, '782715724', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(679, 360, NULL, '0', 'St Joseph Hospital  Kitgum ', 9, 002, NULL, 47, NULL, 56, NULL, NULL, '777920300', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(681, 341, NULL, '0', 'St Pauls H/C IV', 7, 002, NULL, 40, NULL, 52, NULL, NULL, '775196986', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(682, 439, NULL, '0', 'St Peter and Paul H/C III', 6, 002, NULL, 53, NULL, 65, NULL, NULL, '789012339', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(683, 472, NULL, '0', 'St Pius Kidepo Rupa H/C III', 6, 002, NULL, 65, NULL, 74, NULL, NULL, '77290377', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(684, 2493, NULL, '0', 'St Stephens Disp & Maternity Center (Luzira)', 12, 002, NULL, 35, NULL, 41, NULL, NULL, '701245886', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(685, 195, NULL, '0', 'TASO Gulu ', 12, 002, NULL, 23, NULL, 27, NULL, NULL, '783210962', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(686, 222, NULL, '0', 'TASO Jinja', 12, 002, NULL, 28, NULL, 31, NULL, NULL, '704530620', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(687, 451, NULL, '0', 'TASO Masaka', 12, 002, NULL, 59, NULL, 68, NULL, NULL, '772933800', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(688, 452, NULL, '0', 'TASO Masindi ', 12, 002, NULL, 60, NULL, 69, NULL, NULL, '774713910', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(689, 460, NULL, '0', 'TASO Mbale', 12, 002, NULL, 62, NULL, 70, NULL, NULL, '704312235', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(690, 211, NULL, '0', 'TASO Mbarara', 12, 002, NULL, 63, NULL, 71, NULL, NULL, '782361466', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(691, 2493, NULL, '0', 'TASO Mulago ', 12, 002, NULL, 35, NULL, 41, NULL, NULL, '782602176', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(692, 558, NULL, '0', 'TASO Rukungiri', 12, 002, NULL, 81, NULL, 81, NULL, NULL, '772893531', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(693, 674, NULL, '0', 'TASO Soroti', 12, 002, NULL, 84, NULL, 92, NULL, NULL, '706918133', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(694, 698, NULL, '0', 'TASO Tororo', 12, 002, NULL, 85, NULL, 95, NULL, NULL, '702965377', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(695, 3, NULL, '0', 'Teboke H/C III', 6, 002, NULL, 6, NULL, 4, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(696, NULL, NULL, '0', 'Tokora H/C IV', 7, 002, NULL, 70, NULL, 94, 1, 'Tokora Hub', '774073626', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(697, 187, NULL, '0', 'Toro  Kahuna H/C III', 6, 002, NULL, 31, NULL, 25, NULL, NULL, '779500352', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(698, NULL, NULL, '0', 'Tororo District Hospital ', 9, 002, NULL, 85, NULL, 95, 7, 'Tororo Hub', '774560551', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(699, 674, NULL, '0', 'Tubur H/C III', 6, 002, NULL, 84, NULL, 92, NULL, NULL, '782732576', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(700, 195, NULL, '0', 'Umor H/C III', 6, 002, NULL, 23, NULL, 27, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(701, 195, NULL, '0', 'Unyama H/C II', 5, 002, NULL, 23, NULL, 27, NULL, NULL, '772437255', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(702, 149, NULL, '0', 'Villa Maria Hospital', 9, 002, NULL, 90, NULL, 100, NULL, NULL, '783978800', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(703, 187, NULL, '0', 'Virika Hospital', 9, 002, NULL, 31, NULL, 25, NULL, NULL, '783766916', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(704, 329, NULL, '0', 'Wabulungu H/C III', 6, 002, NULL, 61, NULL, 117, NULL, NULL, '787586608', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(705, NULL, NULL, '0', 'Wakiso H/C IV', 7, 002, NULL, 86, NULL, 116, 10, 'Wakiso Hub ', '774549827', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(706, 222, NULL, '0', 'Walukuba H/C IV ', 7, 002, NULL, 28, NULL, 31, NULL, NULL, '782815424', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(707, 674, NULL, '0', 'Western Division H/C III', 6, 002, NULL, 84, NULL, 92, NULL, NULL, '773712033', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(708, 195, NULL, '0', 'Wino H/C II', 5, 002, NULL, 23, NULL, 27, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(709, 256, NULL, '0', 'Wol H/C III', 6, 002, NULL, 101, NULL, 39, NULL, NULL, '777223186', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(711, 187, NULL, '0', 'Yerya H/C III', 6, 002, NULL, 31, NULL, 25, NULL, NULL, '777742888', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(712, NULL, NULL, '0', 'Yumbe Hospital', 9, 002, NULL, 87, NULL, 96, 3, 'Yumbe Hub', '752101452', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(713, 669, NULL, '0', 'Kitaasa H/C III', 6, 002, NULL, 93, NULL, 93, NULL, NULL, '772366861', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(714, 669, NULL, '0', 'Luyitaayita H/C III (NGO)', 6, 002, NULL, 93, NULL, 93, NULL, NULL, '772820376', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(715, 669, NULL, '0', 'Bigasa H/C III', 6, 002, NULL, 93, NULL, 93, NULL, NULL, '7828503605', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(716, 669, NULL, '0', 'Kabigi H/C III', 6, 002, NULL, 93, NULL, 93, NULL, NULL, '753703374', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(717, 705, NULL, '0', 'Nampunge Church of God H/C III', 6, 002, NULL, 86, NULL, 116, NULL, NULL, '774532736', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(720, 137, NULL, '0', 'Kyeizooba H/C III', 6, 002, NULL, 16, NULL, 19, NULL, NULL, '779664167', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(721, 669, NULL, '0', 'St Marys MNH Bukomansimbi', 12, 002, NULL, 93, NULL, 93, NULL, NULL, '773068022', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(722, 313, NULL, '0', 'Mpunge H/C III (Mukono)', 6, 002, NULL, 69, NULL, 49, NULL, NULL, '782683345', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(723, 313, NULL, '0', 'Koome H/C III', 6, 002, NULL, 69, NULL, 49, NULL, NULL, '772039195', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(724, 451, NULL, '0', 'Kitabaazi H/C II', 5, 002, NULL, 59, NULL, 68, NULL, NULL, '77243334', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(725, 360, NULL, '0', 'Akilok H/C II', 5, 002, NULL, 47, NULL, 56, NULL, NULL, '753522022', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(726, 470, NULL, '0', 'Naama H/C III', 6, 002, NULL, 64, NULL, 73, NULL, NULL, '702182998', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(727, 470, NULL, '0', 'St Luke KMD (Kiyinda )H/C III (Mityana)', 6, 002, NULL, 64, NULL, 73, NULL, NULL, '779112037', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(728, 380, NULL, '0', 'Rengen H/C III', 6, 002, NULL, 49, NULL, 57, NULL, NULL, '773714808', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(729, 313, NULL, '0', 'Nagojje H/C III', 6, 002, NULL, 69, NULL, 49, NULL, NULL, '773414353', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(730, 788, NULL, '0', 'Nabweru H/C III', 6, 002, NULL, 86, NULL, 24, NULL, NULL, '782560764', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(731, 788, NULL, '0', 'Epi Centre H/C III (Wakiso)', 6, 002, NULL, 86, NULL, 24, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(732, 705, NULL, '0', 'Nabutiti H/C III', 6, 002, NULL, 86, NULL, 116, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(733, 788, NULL, '0', 'Nakawuka H/C III', 6, 002, NULL, 86, NULL, 24, NULL, NULL, '772407852', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(734, 788, NULL, '0', 'Kasanje H/C III', 6, 002, NULL, 86, NULL, 24, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(735, 788, NULL, '0', 'Nsangi H/C III', 6, 002, NULL, 86, NULL, 24, NULL, NULL, '783195419', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(736, 705, NULL, '0', 'Namulonge H/C III', 6, 002, NULL, 86, NULL, 116, NULL, NULL, '772552703', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(738, 705, NULL, '0', 'Kawanda H/C III', 6, 002, NULL, 86, NULL, 116, NULL, NULL, '712934537', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(739, 374, NULL, '0', 'Koboko Mission H/C III', 6, 002, NULL, 48, NULL, 11, NULL, NULL, '774246529', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(741, 374, NULL, '0', 'Ludara H/C III', 6, 002, NULL, 48, NULL, 11, NULL, NULL, '783757722', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(742, 480, NULL, '0', 'St Gabriel Mirembe Maria H/C III', 6, 002, NULL, 68, NULL, 76, NULL, NULL, '781013509', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(743, 478, NULL, '0', 'Buwama H/C III', 6, 002, NULL, 67, NULL, 26, NULL, NULL, '702121442', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(744, 137, NULL, '0', 'Kabushaho H/C III', 6, 002, NULL, 16, NULL, 19, NULL, NULL, '773562236', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(745, 222, NULL, '0', 'Jinja Central H/C III', 6, 002, NULL, 28, NULL, 31, NULL, NULL, '785207777', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(746, 360, NULL, '0', 'Gweng-coo H/C II', 5, 002, NULL, 47, NULL, 56, NULL, NULL, '782635594', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(747, 2493, NULL, '0', 'MJAP-Mulago ', 12, 002, NULL, 35, NULL, 41, NULL, NULL, '703628445', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(748, 470, NULL, '0', 'Ssekanyonyi H/C IV', 7, 002, NULL, 64, NULL, 73, NULL, NULL, '775289350', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(749, 313, NULL, '0', 'Nabalanga H/C III', 6, 002, NULL, 69, NULL, 49, NULL, NULL, '772557616', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(752, 2493, NULL, '0', 'International Hospital Kampala', 9, 002, NULL, 35, NULL, 41, NULL, NULL, '785194134', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(753, 480, NULL, '0', 'Kitenga H/C III', 6, 002, NULL, 68, NULL, 76, NULL, NULL, '750800141', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(754, 531, NULL, '0', 'Goli H/C III (Nebbi)', 6, 002, NULL, 74, NULL, 78, NULL, NULL, '774274219', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(755, 313, NULL, '0', 'Namuganga H/C III', 6, 002, NULL, 69, NULL, 49, NULL, NULL, '782863847', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(756, 425, NULL, '0', 'St Luke Namaliga H/C III', 6, 002, NULL, 55, NULL, 63, NULL, NULL, '772188398', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(757, 313, NULL, '0', 'Kyabazaala H/C III', 6, 002, NULL, 69, NULL, 49, NULL, NULL, '752580986', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(758, 434, NULL, '0', 'Mpumudde H/C III (Lyantonde)', 6, 002, NULL, 56, NULL, 64, NULL, NULL, '757380166', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(759, 313, NULL, '0', 'Takajjunge H/C II', 5, 002, NULL, 69, NULL, 49, NULL, NULL, '781314021', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(760, 489, NULL, '0', 'Kyetume Community Based H/C III (Mukono)', 6, 002, NULL, 69, NULL, 98, NULL, NULL, '0771431078', NULL, '', 'Ikuma Anna Lucy', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(761, 50, NULL, '0', 'Kijomoro H/C III', 6, 002, NULL, 58, NULL, 11, NULL, NULL, '777443805', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(762, NULL, NULL, '0', 'Nakasongola H/C IV', 7, 002, NULL, 72, NULL, 77, 11, 'Nakasongola Hub', '772664388', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(763, 439, NULL, '0', 'Ngom-oromo H/C II', 5, 002, NULL, 53, NULL, 65, NULL, NULL, '783774860', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(764, 313, NULL, '0', 'Nazigo H/C III', 6, 002, NULL, 42, NULL, 49, NULL, NULL, '776269130', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(765, 434, NULL, '0', 'Lyantonde Muslim H/C III', 6, 002, NULL, 56, NULL, 64, NULL, NULL, '774674746', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(766, 313, NULL, '0', 'Katoogo H/C III', 6, 002, NULL, 69, NULL, 49, NULL, NULL, '772572333', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(767, 531, NULL, '0', 'Pakwach H/C IV', 7, 002, NULL, 74, NULL, 78, NULL, NULL, '772877585', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(768, 204, NULL, '0', 'Iganga Islamic HC III', 6, 002, NULL, 26, NULL, 29, NULL, NULL, '782705365', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(769, 451, NULL, '0', 'Nyendo H/C II', 5, 002, NULL, 59, NULL, 68, NULL, NULL, '754848432', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(770, 438, NULL, '0', 'Mpenja H/C III', 6, 002, NULL, 89, NULL, 122, NULL, NULL, '782700305', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(771, 199, NULL, '0', 'Dwoli H/C III', 6, 002, NULL, 24, NULL, 28, NULL, NULL, '773398844', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(772, 2493, NULL, '0', 'Komamboga H/C III', 6, 002, NULL, 35, NULL, 41, NULL, NULL, '0701387607/ 07024966', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(773, 2493, NULL, '0', 'Kisugu H/C III', 6, 002, NULL, 35, NULL, 41, NULL, NULL, '783215551', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(774, 451, NULL, '0', 'Masaka Municipal Council H/C II', 7, 002, NULL, 59, NULL, 68, NULL, NULL, '777832111', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(775, 222, NULL, '0', 'Butagaya H/C III', 6, 002, NULL, 28, NULL, 31, NULL, NULL, '75293710', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(776, 222, NULL, '0', 'Busedde H/C III', 6, 002, NULL, 28, NULL, 31, NULL, NULL, '753312049', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(777, 434, NULL, '0', 'Kaliro H/C III (Lyantonde)', 6, 002, NULL, 56, NULL, 64, NULL, NULL, '782030841', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(778, 244, NULL, '0', 'Kisiita H/C III', 6, 002, NULL, 43, NULL, 38, NULL, NULL, '784290690', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(779, 123, NULL, '0', 'Busembatia H/C III', 6, 002, NULL, 26, NULL, 17, NULL, NULL, '772065683', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(780, 531, NULL, '0', 'Panyimur H/C III', 6, 002, NULL, 74, NULL, 78, NULL, NULL, '753772872', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(782, 2493, NULL, '0', 'Kisenyi H/C IV (Kampala)', 7, 002, NULL, 35, NULL, 41, NULL, NULL, '774441466', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(784, 698, NULL, '0', 'Osukuru H/C III', 6, 002, NULL, 85, NULL, 95, NULL, NULL, '785269965', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(785, 256, NULL, '0', 'Achol Pii Millitary H/C IV', 9, 002, NULL, 78, NULL, 39, NULL, NULL, '783949134', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(786, 311, NULL, '0', 'Njeru T/C H/C III', 6, 002, NULL, 11, NULL, 48, NULL, NULL, '773473526', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(787, 451, NULL, '0', 'Mpugwe H/C III', 6, 002, NULL, 59, NULL, 68, NULL, NULL, '702929961', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(788, NULL, NULL, '0', 'Entebbe Grade B Hospital', 9, 002, NULL, 86, NULL, 24, 10, 'Entebbe Hub', '772493489', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(789, 470, NULL, '0', 'Maanyi H/C III', 6, 002, NULL, 64, NULL, 73, NULL, NULL, '701959174', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(790, 470, NULL, '0', 'Malangala H/C III', 6, 002, NULL, 64, NULL, 73, NULL, NULL, '782895329', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(792, 2484, NULL, '0', 'Ikumbya H/C III (Luuka)', 6, 002, NULL, 97, NULL, 42, NULL, NULL, '782949756', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(793, 295, NULL, '0', 'Kitokolo H/C II', 5, 002, NULL, 68, NULL, 46, NULL, NULL, '775499582', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(794, 1081, NULL, '0', 'Paidha H/C III', 6, 002, NULL, 108, NULL, 78, NULL, NULL, '782228980', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(795, 1081, NULL, '0', 'Zeu H/C III', 6, 002, NULL, 108, NULL, 78, NULL, NULL, '772913196', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(796, 320, NULL, '0', 'Lwamata H/C III', 6, 002, NULL, 44, NULL, 50, NULL, NULL, '779136350', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(797, 669, NULL, '0', 'St Agatha Lwebitakuli', 12, 002, NULL, 82, NULL, 93, NULL, NULL, '783930972', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(798, 2484, NULL, '0', 'Lulyambuzi H/C III', 6, 002, NULL, 36, NULL, 42, NULL, NULL, '781556754', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(800, 311, NULL, '0', 'Wakisi H/C III', 6, 002, NULL, 11, NULL, 48, NULL, NULL, '753718182', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(801, 698, NULL, '0', 'Mifumi H/C III', 6, 002, NULL, 85, NULL, 95, NULL, NULL, '775458376', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(802, 123, NULL, '0', 'Budini H/C III', 6, 002, NULL, 34, NULL, 17, NULL, NULL, '782322010', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(803, 325, NULL, '0', 'Nkondo H/C III', 6, 002, NULL, 20, NULL, 51, NULL, NULL, '754605455', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(804, 2484, NULL, '0', 'Namasagali H/C III', 6, 002, NULL, 36, NULL, 42, NULL, NULL, '753531227', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(805, 204, NULL, '0', 'Iganga Municipal Council H/C III', 6, 002, NULL, 26, NULL, 29, NULL, NULL, '773233235', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(806, 2484, NULL, '0', 'Kitayunjwa H/C III', 6, 002, NULL, 36, NULL, 42, NULL, NULL, '751674285', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(807, 123, NULL, '0', 'Bukonte H/C III', 6, 002, NULL, 73, NULL, 17, NULL, NULL, '781447699', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(808, 160, NULL, '0', 'Banda H/C III (Namayingo)', 6, 002, NULL, 98, NULL, 21, NULL, NULL, '773497924', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(809, 2484, NULL, '0', 'Buluya H/C II', 5, 002, NULL, 36, NULL, 42, NULL, NULL, '758834530', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(810, 2484, NULL, '0', 'Bulopa H/C III', 6, 002, NULL, 36, NULL, 42, NULL, NULL, '773546040', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(811, 204, NULL, '0', 'Nakalama H/C III', 6, 002, NULL, 26, NULL, 29, NULL, NULL, '712812079', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(812, 99, NULL, '0', 'Buluguyi H/C III', 6, 002, NULL, 10, NULL, 15, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(813, 160, NULL, '0', 'Bumooli H/C III', 6, 002, NULL, 98, NULL, 21, NULL, NULL, '773861703', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(814, 2484, NULL, '0', 'Balawoli H/C III', 6, 002, NULL, 36, NULL, 42, NULL, NULL, '754670380', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(816, 99, NULL, '0', 'Muterere H/C III', 6, 002, NULL, 10, NULL, 15, NULL, NULL, '774838862', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(817, 160, NULL, '0', 'Mayuge H/C III (Bugiri)', 6, 002, NULL, 10, NULL, 21, NULL, NULL, '782279196', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(818, 123, NULL, '0', 'Nabisoigi H/C III', 6, 002, NULL, 73, NULL, 17, NULL, NULL, '777265464', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(819, 2484, NULL, '0', 'Mbulamuti H/C III', 6, 002, NULL, 36, NULL, 42, NULL, NULL, '775816902', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(820, 99, NULL, '0', 'Bulidha H/C III', 6, 002, NULL, 10, NULL, 15, NULL, NULL, '781471217', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(821, 2484, NULL, '0', 'Bupadhengo H/C III', 6, 002, NULL, 36, NULL, 42, NULL, NULL, '782301791', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(823, 470, NULL, '0', 'Kitongo H/C III', 6, 002, NULL, 64, NULL, 73, NULL, NULL, '773825884', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(824, 480, NULL, '0', 'Nabingoola H/C III', 6, 002, NULL, 68, NULL, 76, NULL, NULL, '782808427', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(825, 398, NULL, '0', 'Kazinga H/C III', 6, 002, NULL, 51, NULL, 58, NULL, NULL, '774163674', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(826, 398, NULL, '0', 'Kasule H/C III', 6, 002, NULL, 51, NULL, 58, NULL, NULL, '774445743', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(827, 137, NULL, '0', 'Kabiira H/C III (Bushenyi)', 6, 002, NULL, 16, NULL, 19, NULL, NULL, '751422089', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(828, 36, NULL, '0', 'Kapelebyong H/C IV', 7, 002, NULL, 4, NULL, 8, NULL, NULL, '783140399', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(829, 313, NULL, '0', 'Kasawo H/C III', 6, 002, NULL, 69, NULL, 49, NULL, NULL, '772546203', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(830, 195, NULL, '0', 'Bardege H/C III', 6, 002, NULL, 23, NULL, 27, NULL, NULL, '779116765', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(831, 325, NULL, '0', 'Buyende H/C III', 6, 002, NULL, 20, NULL, 51, NULL, NULL, '779224881', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(832, 325, NULL, '0', 'Irundu H/C III', 6, 002, NULL, 20, NULL, 51, NULL, NULL, '784481556', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(833, 99, NULL, '0', 'Nabukalu H/C III', 6, 002, NULL, 10, NULL, 15, NULL, NULL, '773236228', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(834, 123, NULL, '0', 'Gadumire H/C III', 6, 002, NULL, 34, NULL, 17, NULL, NULL, '779052792', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(835, 123, NULL, '0', 'Magada H/C III', 6, 002, NULL, 73, NULL, 17, NULL, NULL, '756004366', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(836, 204, NULL, '0', 'Makuutu H/C III', 6, 002, NULL, 26, NULL, 29, NULL, NULL, '782087299', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(837, 38, NULL, '0', 'Wii Anaka H/C II', 5, 002, NULL, 106, NULL, 10, NULL, NULL, '779997003', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(838, 137, NULL, '0', 'KIU Teaching Hospital', 9, 002, NULL, 16, NULL, 19, NULL, NULL, '705764883', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(839, 480, NULL, '0', 'Buwaata H/C II', 5, 002, NULL, 68, NULL, 76, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(840, 434, NULL, '0', 'Kinuuka H/C III', 6, 002, NULL, 56, NULL, 64, NULL, NULL, '782319989', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(841, 2484, NULL, '0', 'Nabirumba H/C III', 6, 002, NULL, 36, NULL, 42, NULL, NULL, '776938773', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(842, 160, NULL, '0', 'Sigulu H/C III', 6, 002, NULL, 98, NULL, 21, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(843, 474, NULL, '0', 'Eria H/C III', 6, 002, NULL, 66, NULL, 75, NULL, NULL, '772329509', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(844, 670, NULL, '0', 'Bugondo H/C III', 6, 002, NULL, 100, NULL, 90, NULL, NULL, '777053637', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(845, 313, NULL, '0', 'Kyampisi H/C III', 6, 002, NULL, 69, NULL, 49, NULL, NULL, '752822247', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(846, 674, NULL, '0', 'Asuret H/C III', 6, 002, NULL, 84, NULL, 92, NULL, NULL, '782240420', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(847, 480, NULL, '0', 'Kasambya H/C IV (Mubende)', 7, 002, NULL, 68, NULL, 76, NULL, NULL, '776747526', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(848, 629, NULL, '0', 'Kimuli H/C III', 6, 002, NULL, 80, NULL, 83, NULL, NULL, '754448895', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(849, 50, NULL, '0', 'Oleba H/C III', 6, 002, NULL, 58, NULL, 11, NULL, NULL, '775698811', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(850, 416, NULL, '0', 'Ayago H/C III', 6, 002, NULL, 54, NULL, 61, NULL, NULL, '774093016', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(851, 788, NULL, '0', 'Bussi H/C III', 6, 002, NULL, 86, NULL, 24, NULL, NULL, '782589306', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(852, 123, NULL, '0', 'Namwiwa H/C III', 6, 002, NULL, 34, NULL, 17, NULL, NULL, '779647294', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(853, 239, NULL, '0', 'Kyaterekera H/C III', 6, 002, NULL, 43, NULL, 36, NULL, NULL, '774080859', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(854, 256, NULL, '0', 'St Janani H/C II', 5, 002, NULL, 101, NULL, 39, NULL, NULL, '781404053', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(855, 239, NULL, '0', 'St Ambrose Charity H/C III', 6, 002, NULL, 43, NULL, 36, NULL, NULL, '774178100', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(856, 434, NULL, '0', 'Kasagama H/C III', 6, 002, NULL, 56, NULL, 64, NULL, NULL, '782392496', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(857, 1181, NULL, '0', 'Usuk H/C III', 6, 002, NULL, 41, NULL, 47, NULL, NULL, '774160844', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(858, 204, NULL, '0', 'Bulamagi H/C III', 6, 002, NULL, 26, NULL, 29, NULL, NULL, '779601010', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(859, 153, NULL, '0', 'Bugaya H/C III (Buvuma)', 6, 002, NULL, 19, NULL, 49, NULL, NULL, '776562714', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(860, 788, NULL, '0', 'Katabi H/C III', 6, 002, NULL, 86, NULL, 24, NULL, NULL, '772668793', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(861, 1081, NULL, '0', 'Kango H/C III', 6, 002, NULL, 108, NULL, 78, NULL, NULL, '783752350', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(862, 222, NULL, '0', 'Butaga H/C III', 6, 002, NULL, 28, NULL, 31, NULL, NULL, '789602504', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(863, 295, NULL, '0', 'Madudu H/C III', 6, 002, NULL, 68, NULL, 46, NULL, NULL, '704701360', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(864, 788, NULL, '0', 'Ndejje H/C IV (Wakiso)', 7, 002, NULL, 86, NULL, 24, NULL, NULL, '752613587', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(865, 480, NULL, '0', 'Kabamba H/C III', 6, 002, NULL, 68, NULL, 76, NULL, NULL, '702006222', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(866, 712, NULL, '0', 'Lodonga H/C III', 6, 002, NULL, 87, NULL, 96, NULL, NULL, '774815291', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(867, 705, NULL, '0', 'Ttikalu H/C III', 6, 002, NULL, 86, NULL, 116, NULL, NULL, '782375250', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(868, 712, NULL, '0', 'Kochi H/C III', 6, 002, NULL, 87, NULL, 96, NULL, NULL, '784373144', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(869, 374, NULL, '0', 'Ayipe H/C III', 6, 002, NULL, 48, NULL, 11, NULL, NULL, '773994110', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(870, 451, NULL, '0', 'Nakasojjo H/C II', 5, 002, NULL, 59, NULL, 68, NULL, NULL, '779214576', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(871, 451, NULL, '0', 'Ssunga H/C III', 6, 002, NULL, 59, NULL, 68, NULL, NULL, '779516892', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(872, 199, NULL, '0', 'Kyehoro H/C II', 5, 002, NULL, 24, NULL, 28, NULL, NULL, '774089364', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(873, 629, NULL, '0', 'Kibanda H/C III (Rakai)', 6, 002, NULL, 80, NULL, 83, NULL, NULL, '778271344', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(874, 50, NULL, '0', 'Adumi H/C IV', 7, 002, NULL, 7, NULL, 11, NULL, NULL, '772347268', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', '');
INSERT INTO `facility` (`id`, `parentid`, `ipid`, `code`, `name`, `facilitylevelid`, `type`, `isactive`, `districtid`, `regionid`, `hubid`, `healthregionid`, `hubname`, `phonenumber`, `distancefromhub`, `email`, `contactperson`, `address`, `returnaddress`, `longitude`, `latitude`, `created_at`, `updated_at`, `createdby`) VALUES
(875, 313, NULL, '0', 'Kabanga H/C III', 6, 002, NULL, 69, NULL, 49, NULL, NULL, '782971648', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(876, 311, NULL, '0', 'Ngogwe H/C III', 6, 002, NULL, 11, NULL, 48, NULL, NULL, '751230267', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(877, 99, NULL, '0', 'Bulesa H/C III', 6, 002, NULL, 10, NULL, 15, NULL, NULL, '787528852', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(878, 544, NULL, '0', 'Buredo H/C III', 6, 002, NULL, 109, NULL, 80, NULL, NULL, '751273991', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(879, 629, NULL, '0', 'Kifamba H/C III (Rakai)', 6, 002, NULL, 80, NULL, 83, NULL, NULL, '782272354', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(880, 313, NULL, '0', 'Goma H/C III', 6, 002, NULL, 69, NULL, 49, NULL, NULL, '782923738', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(881, 295, NULL, '0', 'Musozi H/C III', 6, 002, NULL, 68, NULL, 46, NULL, NULL, '755097869', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(882, 360, NULL, '0', 'Okidi H/C III', 6, 002, NULL, 47, NULL, 56, NULL, NULL, '775634031', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(883, 204, NULL, '0', 'Nawandala H/C III', 6, 002, NULL, 26, NULL, 29, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(884, 160, NULL, '0', 'Mutumba H/C III', 6, 002, NULL, 98, NULL, 21, NULL, NULL, '776663877', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(885, 451, NULL, '0', 'Buwunga H/C III (Masaka)', 6, 002, NULL, 59, NULL, 68, NULL, NULL, '706308207', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(886, 2484, NULL, '0', 'Bugulumbya H/C III', 6, 002, NULL, 36, NULL, 42, NULL, NULL, '783907440', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(887, 204, NULL, '0', 'Lubira H/C III', 6, 002, NULL, 26, NULL, 29, NULL, NULL, '783288553', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(888, 160, NULL, '0', 'St Matia Mulumba H/C III (Namayingo)', 6, 002, NULL, 98, NULL, 21, NULL, NULL, '785041846', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(889, 360, NULL, '0', 'Archdicondary H/C II', 5, 002, NULL, 47, NULL, 56, NULL, NULL, '776355535', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(890, 313, NULL, '0', 'Bbaale H/C IV', 7, 002, NULL, 42, NULL, 49, NULL, NULL, '774868071', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(892, 360, NULL, '0', 'Newlife H/C III', 6, 002, NULL, 47, NULL, 56, NULL, NULL, '782171097', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(894, 222, NULL, '0', 'Budima H/C III', 6, 002, NULL, 28, NULL, 31, NULL, NULL, '783665019', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(895, 222, NULL, '0', 'Lukolo H/C III', 6, 002, NULL, 28, NULL, 31, NULL, NULL, '756358648', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(897, 199, NULL, '0', 'Nsozi H/C III', 6, 002, NULL, 24, NULL, 28, NULL, NULL, '773627721', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(898, 480, NULL, '0', 'Kiyuni H/C III (Mubende)', 6, 002, NULL, 68, NULL, 76, NULL, NULL, '705068525', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(899, 762, NULL, '0', 'Lwampanga H/C III', 6, 002, NULL, 72, NULL, 77, NULL, NULL, '774630725', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(900, 295, NULL, '0', 'Kyanamugera H/C II', 5, 002, NULL, 68, NULL, 46, NULL, NULL, '753261909', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(901, 470, NULL, '0', 'Kabule H/C III', 6, 002, NULL, 64, NULL, 73, NULL, NULL, '0775337911/077445881', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(902, 2493, NULL, '0', 'Paragon Hospital', 9, 002, NULL, 35, NULL, 41, NULL, NULL, '772688100', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(903, 438, NULL, '0', 'Kanoni H/C III (Gomba)', 6, 002, NULL, 89, NULL, 122, NULL, NULL, '774112997', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(904, 123, NULL, '0', 'Uganda Reproductive Health Bureau', 12, 002, NULL, 34, NULL, 17, NULL, NULL, '782671620', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(905, 99, NULL, '0', 'Iwemba H/C III', 6, 002, NULL, 10, NULL, 15, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(906, 438, NULL, '0', 'Kifampa H/C III (Gomba)', 6, 002, NULL, 89, NULL, 122, NULL, NULL, '755623835', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(907, 311, NULL, '0', 'Buwagajjo H/C III', 6, 002, NULL, 11, NULL, 48, NULL, NULL, '773442061', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(908, 762, NULL, '0', 'Nakayonza H/C III', 6, 002, NULL, 72, NULL, 77, NULL, NULL, '775144458', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(909, 311, NULL, '0', 'Busabaga H/C III', 6, 002, NULL, 11, NULL, 48, NULL, NULL, '751946283', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(910, 674, NULL, '0', 'Atiriri H/C IV', 7, 002, NULL, 84, NULL, 92, NULL, NULL, '774206049', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(911, 712, NULL, '0', 'Yumbe H/C III', 6, 002, NULL, 87, NULL, 96, NULL, NULL, '756410530', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(912, 698, NULL, '0', 'Bumwoni H/C III', 6, 002, NULL, 57, NULL, 95, NULL, NULL, '784953327', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(913, 674, NULL, '0', 'Kateta H/C III', 6, 002, NULL, 100, NULL, 92, NULL, NULL, '75195657', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(914, 670, NULL, '0', 'Atiira H/C III', 6, 002, NULL, 100, NULL, 90, NULL, NULL, '782892780', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(915, 3, NULL, '0', 'Reproductive Health Uganda (Apac)', 12, 002, NULL, 6, NULL, 4, NULL, NULL, '774014164', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(916, 149, NULL, '0', 'Kyamulibwa H/C III', 6, 002, NULL, 90, NULL, 100, NULL, NULL, '789641470', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(917, NULL, NULL, '0', 'Eastern Division', 2, 002, NULL, 0, NULL, 0, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(918, 674, NULL, '0', 'Eastern Division H/C III', 6, 002, NULL, 84, NULL, 92, NULL, NULL, '774574117', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(919, 995, NULL, '0', 'Ngora Maternity Unit H/C III', 6, 002, NULL, 99, NULL, 105, NULL, NULL, '774610030', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(921, 99, NULL, '0', 'Kigulu H/C II', 5, 002, NULL, 10, NULL, 15, NULL, NULL, '712211325', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(922, 788, NULL, '0', 'Kigungu H/C III', 6, 002, NULL, 86, NULL, 24, NULL, NULL, '774013068', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(923, 472, NULL, '0', 'Lorengechora H/C III', 6, 002, NULL, 105, NULL, 74, NULL, NULL, '773902104', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(924, 10, NULL, '0', 'Mungula H/C IV', 7, 002, NULL, 2, NULL, 6, NULL, NULL, '773244301', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(925, 472, NULL, '0', 'Iriiri H/C III', 6, 002, NULL, 105, NULL, 74, NULL, NULL, '772506949', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(926, 995, NULL, '0', 'Atoot H/C II', 5, 002, NULL, 99, NULL, 105, NULL, NULL, '782983154', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(927, 311, NULL, '0', 'Najjembe H/C III', 6, 002, NULL, 11, NULL, 48, NULL, NULL, '7835801413', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(928, 313, NULL, '0', 'Lugasa H/C III', 6, 002, NULL, 42, NULL, 49, NULL, NULL, '774485472', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(929, 380, NULL, '0', 'Kacheri H/C III', 6, 002, NULL, 49, NULL, 57, NULL, NULL, '782690004', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(930, 674, NULL, '0', 'Princess Diana H/C IV', 7, 002, NULL, 84, NULL, 92, NULL, NULL, '784479487', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(931, 50, NULL, '0', 'Odupi H/C III', 6, 002, NULL, 7, NULL, 11, NULL, NULL, '774084117', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(932, 698, NULL, '0', 'Buwabwala H/C III', 6, 002, NULL, 57, NULL, 95, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(933, 698, NULL, '0', 'Bubutu H/C III', 6, 002, NULL, 57, NULL, 95, NULL, NULL, '752521809', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(934, 222, NULL, '0', 'Jinja Islamic H/C', 1, 002, NULL, 28, NULL, 31, NULL, NULL, '712561446', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(935, 705, NULL, '0', 'Bulondo H/C III', 6, 002, NULL, 86, NULL, 116, NULL, NULL, '775618386', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(936, 160, NULL, '0', 'Singila H/C II', 5, 002, NULL, 98, NULL, 21, NULL, NULL, '782674946', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(937, 2493, NULL, '0', 'Banda H/C II (Wakiso)', 5, 002, NULL, 86, NULL, 41, NULL, NULL, '782646535', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(938, 204, NULL, '0', 'Irongo H/C III', 6, 002, NULL, 97, NULL, 29, NULL, NULL, '713821945', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(939, 160, NULL, '0', 'Kandege H/C II', 5, 002, NULL, 98, NULL, 21, NULL, NULL, '784759501', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(940, 2484, NULL, '0', 'Butansi H/C III', 6, 002, NULL, 36, NULL, 42, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(941, 244, NULL, '0', 'Nkooko H/C III', 6, 002, NULL, 43, NULL, 38, NULL, NULL, '773467769', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(942, 50, NULL, '0', 'Logiri H/C III', 6, 002, NULL, 7, NULL, 11, NULL, NULL, '777443762', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(943, 698, NULL, '0', 'Nabitsiichi H/C III', 6, 002, NULL, 57, NULL, 95, NULL, NULL, '777262244', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(944, 50, NULL, '0', 'Wadra H/C III', 6, 002, NULL, 58, NULL, 11, NULL, NULL, '791866200', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(945, 698, NULL, '0', 'Nagongera H/C IV', 7, 002, NULL, 85, NULL, 95, NULL, NULL, '774353014', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(946, 470, NULL, '0', 'Mayirye H/C III', 6, 002, NULL, 64, NULL, 73, NULL, NULL, '779109003', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(948, 227, NULL, '0', 'Kalaki H/C III', 6, 002, NULL, 32, NULL, 34, NULL, NULL, '778216995', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(949, 762, NULL, '0', 'Bamugolodde H/C III', 6, 002, NULL, 72, NULL, 77, NULL, NULL, '775155336', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(950, 36, NULL, '0', 'Abarilela H/C III', 6, 002, NULL, 4, NULL, 8, NULL, NULL, '775349900', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(951, 149, NULL, '0', 'Kyamulibwa H/C IV', 7, 002, NULL, 90, NULL, 100, NULL, NULL, '787195832', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(952, NULL, NULL, '0', 'Ketaasa H/C III', 6, 002, NULL, 93, NULL, 0, NULL, NULL, '772366861', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(954, 698, NULL, '0', 'Bumbo H/C III', 6, 002, NULL, 57, NULL, 95, NULL, NULL, '776123889', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(956, 531, NULL, '0', 'Wadelai H/C III', 6, 002, NULL, 74, NULL, 78, NULL, NULL, '773363951', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(957, 50, NULL, '0', 'Tara H/C III', 6, 002, NULL, 58, NULL, 11, NULL, NULL, '777455851', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(958, 153, NULL, '0', 'Busamuzi H/C III', 6, 002, NULL, 19, NULL, 49, NULL, NULL, '776533001', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(959, 191, NULL, '0', 'Bulo H/C III', 6, 002, NULL, 88, NULL, 26, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(960, 762, NULL, '0', 'Nakitoma H/C III', 6, 002, NULL, 72, NULL, 77, NULL, NULL, '775751508', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(961, 425, NULL, '0', 'Nsawo H/C III', 6, 002, NULL, 55, NULL, 63, NULL, NULL, '772186149', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(962, 222, NULL, '0', 'Kakaire H/C III', 6, 002, NULL, 28, NULL, 31, NULL, NULL, '773009580', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(963, 222, NULL, '0', 'Wakitaka H/C III', 6, 002, NULL, 28, NULL, 31, NULL, NULL, '774681260', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(964, 222, NULL, '0', 'Buwenge Hospital', 9, 002, NULL, 28, NULL, 31, NULL, NULL, '774174781', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(965, 160, NULL, '0', 'Hukeseho H/C III', 6, 002, NULL, 98, NULL, 21, NULL, NULL, '778094200', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(966, 99, NULL, '0', 'Bugiri Town Council H/C II', 5, 002, NULL, 10, NULL, 15, NULL, NULL, '782119856', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(967, 311, NULL, '0', 'Tongolo H/C II', 5, 002, NULL, 11, NULL, 48, NULL, NULL, '777674963', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(968, 311, NULL, '0', 'Buikwe H/C III', 6, 002, NULL, 11, NULL, 48, NULL, NULL, '779313239', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(969, 3, NULL, '0', 'Chawente H/C III', 6, 002, NULL, 6, NULL, 4, NULL, NULL, '774164916', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(970, 670, NULL, '0', 'Kadungulu H/C III', 6, 002, NULL, 100, NULL, 90, NULL, NULL, '785705528', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(971, 2493, NULL, '0', 'Kawaala H/C III', 6, 002, NULL, 35, NULL, 41, NULL, NULL, '777425862', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(972, 478, NULL, '0', 'Ggolo H/C III', 6, 002, NULL, 67, NULL, 26, NULL, NULL, '779203475', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(973, 474, NULL, '0', 'Dufile H/C III', 6, 002, NULL, 66, NULL, 75, NULL, NULL, '785920582', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(974, 311, NULL, '0', 'Makindu H/C III', 6, 002, NULL, 11, NULL, 48, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(975, 2484, NULL, '0', 'Bukoova H/C III', 6, 002, NULL, 97, NULL, 42, NULL, NULL, '79486623', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(976, 762, NULL, '0', 'Kakooge H/C III', 6, 002, NULL, 72, NULL, 77, NULL, NULL, '78449090', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(977, 712, NULL, '0', 'Kei H/C III', 6, 002, NULL, 87, NULL, 96, NULL, NULL, '773297077', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(978, 50, NULL, '0', 'Oluvu H/C III', 6, 002, NULL, 58, NULL, 11, NULL, NULL, '782850030', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(979, 995, NULL, '0', 'Omiito H/C II', 5, 002, NULL, 99, NULL, 105, NULL, NULL, '783108793', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(980, 629, NULL, '0', 'Kyalulangira H/C III', 6, 002, NULL, 80, NULL, 83, NULL, NULL, '782354936', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(981, 452, NULL, '0', 'Kimengo H/C III', 6, 002, NULL, 60, NULL, 69, NULL, NULL, '783450600', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(982, 398, NULL, '0', 'Hapuuyo H/C III', 6, 002, NULL, 51, NULL, 58, NULL, NULL, '776062974', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(983, 698, NULL, '0', 'Iyolwa H/C III', 6, 002, NULL, 85, NULL, 95, NULL, NULL, '782086004', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(984, 762, NULL, '0', 'Kazwama H/C II', 5, 002, NULL, 72, NULL, 77, NULL, NULL, '782585897', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(985, 295, NULL, '0', 'Kyato H/C II', 5, 002, NULL, 68, NULL, 46, NULL, NULL, '788055915', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(987, 199, NULL, '0', 'Kabale H/C III (Hoima)', 6, 002, NULL, 24, NULL, 28, NULL, NULL, '774968571', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(988, 36, NULL, '0', 'Wera H/C III  ST MICHAEL ', 6, 002, NULL, 4, NULL, 8, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(989, 469, NULL, '0', 'Bubangizi H/C III', 6, 002, NULL, 111, NULL, 72, NULL, NULL, '773338112', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(990, 469, NULL, '0', 'Nyakatsiro H/C III', 6, 002, NULL, 111, NULL, 72, NULL, NULL, '775209767', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(991, 311, NULL, '0', 'Metha Hospital', 9, 002, NULL, 11, NULL, 48, NULL, NULL, '752645220', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(992, 425, NULL, '0', 'Bishop Ceaser Asili Hospital', 9, 002, NULL, 55, NULL, 63, NULL, NULL, '788689839', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(993, 474, NULL, '0', 'Lefori H/C III', 6, 002, NULL, 66, NULL, 75, NULL, NULL, '782929122', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(994, 451, NULL, '0', 'Bukakata H/C III', 6, 002, NULL, 59, NULL, 68, NULL, NULL, '703842081', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(995, NULL, NULL, '0', 'Ngora H/C IV', 7, 002, NULL, 99, NULL, 105, 5, 'Ngora Hub ', '785668142', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(996, 1150, NULL, '0', 'Semuto H/C IV', 7, 002, NULL, 71, NULL, 79, NULL, NULL, '787499257', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(997, 478, NULL, '0', 'Nswanjere H/C III (St Joseph)', 6, 002, NULL, 67, NULL, 26, NULL, NULL, '783507197', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(998, 222, NULL, '0', 'Magamaga H/C III', 6, 002, NULL, 28, NULL, 31, NULL, NULL, '772471072', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(999, 425, NULL, '0', 'Bombo H/C III', 6, 002, NULL, 55, NULL, 63, NULL, NULL, '773123529', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1000, 425, NULL, '0', 'Katikamu H/C III', 6, 002, NULL, 55, NULL, 63, NULL, NULL, '775353590', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1001, 472, NULL, '0', 'Kangole H/C III', 6, 002, NULL, 105, NULL, 74, NULL, NULL, '774811955', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1002, 425, NULL, '0', 'Ndejje University H/C III', 6, 002, NULL, 55, NULL, 63, NULL, NULL, '772445682', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1003, 531, NULL, '0', 'Panyigoro H/C III', 6, 002, NULL, 74, NULL, 78, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1004, 10, NULL, '0', 'Azaipi H/C III', 6, 002, NULL, 2, NULL, 6, NULL, NULL, '782904210', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1005, 474, NULL, '0', 'Obongi H/C IV', 7, 002, NULL, 66, NULL, 75, NULL, NULL, '773890644', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1006, 762, NULL, '0', 'Our Lady  of Lourdes H/C III (Nakasongola)', 6, 002, NULL, 72, NULL, 77, NULL, NULL, '782777430', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1007, 222, NULL, '0', 'Mpambwe H/C III', 6, 002, NULL, 28, NULL, 31, NULL, NULL, '783069403', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1008, 223, NULL, '0', 'Lotim H/C II', 5, 002, NULL, 29, NULL, 32, NULL, NULL, '775287200', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1009, 50, NULL, '0', 'Katiyi H/C III', 6, 002, NULL, 7, NULL, 11, NULL, NULL, '774738058', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1010, 425, NULL, '0', 'Zirobwe H/C III', 6, 002, NULL, 55, NULL, 63, NULL, NULL, '782419115', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1011, 3, NULL, '0', 'Apwori H/C III', 6, 002, NULL, 6, NULL, 4, NULL, NULL, '779633267', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1012, 474, NULL, '0', 'Laropi H/C III', 6, 002, NULL, 66, NULL, 75, NULL, NULL, '782797276', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1013, 531, NULL, '0', 'Pokwero H/C III', 6, 002, NULL, 74, NULL, 78, NULL, NULL, '774564784', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1014, 425, NULL, '0', 'Kamira H/C III', 6, 002, NULL, 55, NULL, 63, NULL, NULL, '773864847', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1015, 56, NULL, '0', 'Omatenga H/C II', 5, 002, NULL, 50, NULL, 13, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1016, 472, NULL, '0', 'Nadunget H/C III', 6, 002, NULL, 65, NULL, 74, NULL, NULL, '782110280', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1017, 425, NULL, '0', 'Butuntumula H/C III', 6, 002, NULL, 55, NULL, 63, NULL, NULL, '774101036', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1018, 199, NULL, '0', 'Bugambe H/C III (Hoima)', 6, 002, NULL, 24, NULL, 28, NULL, NULL, '775661876', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1019, 425, NULL, '0', 'Katuugo H/C II', 5, 002, NULL, 55, NULL, 63, NULL, NULL, '772531714', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1020, 649, NULL, '0', 'Kakasi C.O.U H/C III', 6, 002, NULL, 37, NULL, 101, NULL, NULL, '781522484', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1021, 320, NULL, '0', 'Nabwendo H/C III', 6, 002, NULL, 44, NULL, 50, NULL, NULL, '785840041', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1022, 470, NULL, '0', 'Kalangaalo H/C II', 5, 002, NULL, 64, NULL, 73, NULL, NULL, '772324196', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1023, 478, NULL, '0', 'Nindye H/C III', 6, 002, NULL, 67, NULL, 26, NULL, NULL, '772893821', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1024, 451, NULL, '0', 'Bukeeri H/C III', 6, 002, NULL, 59, NULL, 68, NULL, NULL, '702930554', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1025, 478, NULL, '0', 'Bunjako H/C III', 6, 002, NULL, 67, NULL, 26, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1027, 698, NULL, '0', 'Panyangasi H/C III', 6, 002, NULL, 85, NULL, 95, NULL, NULL, '773815556', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1028, 227, NULL, '0', 'Bululu H/C III', 6, 002, NULL, 32, NULL, 34, NULL, NULL, '782146065', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1029, 350, NULL, '0', 'Panyadoli H/C III', 6, 002, NULL, 110, NULL, 53, NULL, NULL, '784305700', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1030, 425, NULL, '0', 'Kikoma H/C III', 6, 002, NULL, 55, NULL, 63, NULL, NULL, '772375997', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1031, 56, NULL, '0', 'Mukongoro H/C III', 6, 002, NULL, 50, NULL, 13, NULL, NULL, '782015270', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1032, 350, NULL, '0', 'St Jude Thaddeous Karungu H/C', 12, 002, NULL, 110, NULL, 53, NULL, NULL, '785406822', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1033, 531, NULL, '0', 'Kucwiny H/C III', 6, 002, NULL, 74, NULL, 78, NULL, NULL, '756243651', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1034, 350, NULL, '0', 'Masindi Port H/C III', 6, 002, NULL, 110, NULL, 53, NULL, NULL, '775172633', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1036, 311, NULL, '0', 'St Francis Health Care Services', 12, 002, NULL, 11, NULL, 48, NULL, NULL, '75455173', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1037, 439, NULL, '0', 'Potika H/C II', 5, 002, NULL, 53, NULL, 65, NULL, NULL, '778466208', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1038, 470, NULL, '0', 'St Padre Pio H/C III Busunju', 6, 002, NULL, 64, NULL, 73, NULL, NULL, '783523378', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1039, 788, NULL, '0', 'Kakiri H/C III', 6, 002, NULL, 86, NULL, 24, NULL, NULL, '772674849', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1040, 629, NULL, '0', 'Kiziba H/C III (Rakai)', 6, 002, NULL, 80, NULL, 83, NULL, NULL, '778658435', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1041, 2493, NULL, '0', 'Seguku H/C II', 5, 002, NULL, 86, NULL, 41, NULL, NULL, '772493521', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1042, 191, NULL, '0', 'Kyabadaaza H/C III', 6, 002, NULL, 88, NULL, 26, NULL, NULL, '782447049', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1043, 279, NULL, '0', 'Kabeykia H/C III', 6, 002, NULL, 39, NULL, 44, NULL, NULL, '782235986', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1044, 149, NULL, '0', 'Kiragga H/C III', 6, 002, NULL, 90, NULL, 100, NULL, NULL, '787419829', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1045, 50, NULL, '0', 'Anyavu H/C II', 5, 002, NULL, 7, NULL, 11, NULL, NULL, '758996063', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1046, 425, NULL, '0', 'Katikamu-Kisule H/C III', 6, 002, NULL, 55, NULL, 63, NULL, NULL, '782059796', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1047, 350, NULL, '0', 'Mutunda H/C III', 6, 002, NULL, 110, NULL, 53, NULL, NULL, '774267099', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1048, 350, NULL, '0', 'Kigumba H/C III', 6, 002, NULL, 110, NULL, 53, NULL, NULL, '772988671', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1049, 1081, NULL, '0', 'Agiermach H/C III', 6, 002, NULL, 108, NULL, 78, NULL, NULL, '773169570', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1050, 313, NULL, '0', 'Busaana H/C III', 6, 002, NULL, 42, NULL, 49, NULL, NULL, '772337351', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1051, 425, NULL, '0', 'Bamunanika H/C III', 6, 002, NULL, 55, NULL, 63, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1052, 311, NULL, '0', 'Kavule H/C II', 5, 002, NULL, 11, NULL, 48, NULL, NULL, '772334648', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1053, 50, NULL, '0', 'Ovujo H/C III', 6, 002, NULL, 58, NULL, 11, NULL, NULL, '774278178', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1054, 50, NULL, '0', 'St Francis H/C III Ocodri', 6, 002, NULL, 7, NULL, 11, NULL, NULL, '777441014', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1055, 433, NULL, '0', 'Naanywa H/C III', 6, 002, NULL, 92, NULL, 115, NULL, NULL, '772575208', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1056, 50, NULL, '0', 'Vurra H/C III', 6, 002, NULL, 7, NULL, 11, NULL, NULL, '782071515', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1057, 124, NULL, '0', 'Bubukwanga H/C III', 6, 002, NULL, 15, NULL, 18, NULL, NULL, '779481319', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1058, 425, NULL, '0', 'Lukomera Maternity Centre', 12, 002, NULL, 55, NULL, 63, NULL, NULL, '783195153', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1059, 472, NULL, '0', 'Moroto Army H/C IV', 7, 002, NULL, 65, NULL, 74, NULL, NULL, '789503034', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1060, 313, NULL, '0', 'Mukono Hospital C.O.U', 9, 002, NULL, 69, NULL, 49, NULL, NULL, '774066387', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1061, 438, NULL, '0', 'Bukalagi H/C III', 6, 002, NULL, 89, NULL, 122, NULL, NULL, '754138335', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1062, 705, NULL, '0', 'Mende H/C III', 6, 002, NULL, 86, NULL, 116, NULL, NULL, '775922302', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1063, 99, NULL, '0', 'Kayango H/C III', 6, 002, NULL, 10, NULL, 15, NULL, NULL, '772317674', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1064, 531, NULL, '0', 'Nyaravur H/C III', 6, 002, NULL, 74, NULL, 78, NULL, NULL, '771035432', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1065, 425, NULL, '0', 'Kyalugondo H/C III', 6, 002, NULL, 55, NULL, 63, NULL, NULL, '702487880', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1066, 425, NULL, '0', 'Wabusana H/C III', 6, 002, NULL, 55, NULL, 63, NULL, NULL, '782852711', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1067, 311, NULL, '0', 'Ssi H/C III', 6, 002, NULL, 11, NULL, 48, NULL, NULL, '0774463756/075126722', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1068, 380, NULL, '0', 'Panyangara H/C III', 6, 002, NULL, 49, NULL, 57, NULL, NULL, '782842756', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1069, 50, NULL, '0', 'Ajia H/C III', 6, 002, NULL, 7, NULL, 11, NULL, NULL, '774684879', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1072, 669, NULL, '0', 'Kitanda H/C III', 6, 002, NULL, 93, NULL, 93, NULL, NULL, '774319402', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1073, 629, NULL, '0', 'Lwanda H/C III', 6, 002, NULL, 80, NULL, 83, NULL, NULL, '774250308', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1074, 137, NULL, '0', 'Bitooma H/C III', 6, 002, NULL, 16, NULL, 19, NULL, NULL, '777407512', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1075, 531, NULL, '0', 'Parombo H/C III', 6, 002, NULL, 74, NULL, 78, NULL, NULL, '774566858', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1076, 470, NULL, '0', 'Bulera H/C III', 6, 002, NULL, 64, NULL, 73, NULL, NULL, '789496775', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1077, 50, NULL, '0', 'Yivu Abea H/C II', 5, 002, NULL, 58, NULL, 11, NULL, NULL, '756067072', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1078, 1181, NULL, '0', 'Toroma H/C IV', 7, 002, NULL, 41, NULL, 47, NULL, NULL, '774151227', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1079, 433, NULL, '0', 'Kimwanyi H/C III', 6, 002, NULL, 92, NULL, 115, NULL, NULL, '774989372', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1080, 36, NULL, '0', 'St Micheal HCF H/C III (Amuria)', 6, 002, NULL, 4, NULL, 8, NULL, NULL, '777687013', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1081, NULL, NULL, '0', 'Warr H/C III', 6, 002, NULL, 108, NULL, 78, 3, 'Warr hub', '773971339', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1082, 478, NULL, '0', 'Bukasa H/C IV', 7, 002, NULL, 33, NULL, 113, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1083, 153, NULL, '0', 'Bweema H/C III', 6, 002, NULL, 19, NULL, 49, NULL, NULL, '771487441', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1084, 452, NULL, '0', 'Kinyara H/C III', 6, 002, NULL, 60, NULL, 69, NULL, NULL, '701582072', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1085, 279, NULL, '0', 'Kabeywa H/C III', 6, 002, NULL, 39, NULL, 44, NULL, NULL, '782235986', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1086, 425, NULL, '0', 'Awebwa Maternity Centre', 12, 002, NULL, 55, NULL, 63, NULL, NULL, '785937453', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1087, 149, NULL, '0', 'Kabungo H/C III', 6, 002, NULL, 90, NULL, 100, NULL, NULL, '774455075', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1088, 452, NULL, '0', 'Nyantonzi H/C III', 6, 002, NULL, 60, NULL, 69, NULL, NULL, '782804742', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1089, 788, NULL, '0', 'Wamala H/C II', 5, 002, NULL, 86, NULL, 24, NULL, NULL, '777550255', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1090, 425, NULL, '0', 'Bowa H/C III', 6, 002, NULL, 55, NULL, 63, NULL, NULL, '774039639', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1092, 350, NULL, '0', 'Diima H/C III', 6, 002, NULL, 110, NULL, 53, NULL, NULL, '772033680', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1093, 50, NULL, '0', 'Kamaka H/C III', 6, 002, NULL, 58, NULL, 11, NULL, NULL, '787542565', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1094, 425, NULL, '0', 'Ssekamuli H/C III', 6, 002, NULL, 55, NULL, 63, NULL, NULL, '782506688', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1095, 56, NULL, '0', 'Kolir H/C III', 6, 002, NULL, 12, NULL, 13, NULL, NULL, '782315702', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1097, 3, NULL, '0', 'Lacor Opit H/C III- Gulu', 6, 002, NULL, 23, NULL, 4, NULL, NULL, '0777320900/077781745', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1098, 1181, NULL, '0', 'St Kevin H/C III', 6, 002, NULL, 41, NULL, 47, NULL, NULL, '789476311', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1099, 474, NULL, '0', 'Moyo Mission H/C III', 6, 002, NULL, 66, NULL, 75, NULL, NULL, '782781619', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1100, 480, NULL, '0', 'Kalonga H/C III', 6, 002, NULL, 68, NULL, 76, NULL, NULL, '774105613', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1101, 295, NULL, '0', 'Myanzi H/C III (Mubende)', 6, 002, NULL, 68, NULL, 46, NULL, NULL, '777597967', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1102, 705, NULL, '0', 'Kira H/C III', 6, 002, NULL, 86, NULL, 116, NULL, NULL, '702210451', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1103, 762, NULL, '0', 'Nabiswera H/C III', 6, 002, NULL, 72, NULL, 77, NULL, NULL, '775967443', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1104, 762, NULL, '0', 'Wabigalo H/C III', 6, 002, NULL, 72, NULL, 77, NULL, NULL, '772510162', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1105, 50, NULL, '0', 'St Luke H/C III Katiyi', 12, 002, NULL, 7, NULL, 11, NULL, NULL, '782240065', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1106, 674, NULL, '0', 'Tiriri H/C IV', 7, 002, NULL, 84, NULL, 92, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1107, 50, NULL, '0', 'Ediofe H/C III', 6, 002, NULL, 7, NULL, 11, NULL, NULL, '774497489', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1108, 631, NULL, '0', 'Ogoko H/C II', 5, 002, NULL, 7, NULL, 11, NULL, NULL, '774564653', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1109, 244, NULL, '0', 'Nyamarwa H/C III (Kibaale)', 6, 002, NULL, 43, NULL, 38, NULL, NULL, '783984137', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1110, 239, NULL, '0', 'Isunga H/C III', 6, 002, NULL, 43, NULL, 36, NULL, NULL, '703876718', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1111, 239, NULL, '0', 'Mpeefu H/C III', 6, 002, NULL, 43, NULL, 36, NULL, NULL, '782717237', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1112, 199, NULL, '0', 'Buseruka H/C III', 6, 002, NULL, 24, NULL, 28, NULL, NULL, '771603871', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1113, 199, NULL, '0', 'Kaseeta H/C III', 6, 002, NULL, 24, NULL, 28, NULL, NULL, '777101404', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1114, 2493, NULL, '0', 'TASO Kanyanya', 12, 002, NULL, 35, NULL, 41, NULL, NULL, '772353599', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1115, 227, NULL, '0', 'Otuboi H/C III', 6, 002, NULL, 32, NULL, 34, NULL, NULL, '78456683', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1116, 227, NULL, '0', 'Alwa H/C III', 6, 002, NULL, 32, NULL, 34, NULL, NULL, '718878117', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1117, 551, NULL, '0', 'Kiyuni H/C III (Kyankwanzi)', 6, 002, NULL, 91, NULL, 106, NULL, NULL, '775913798', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1118, 204, NULL, '0', 'Waibuga H/C III', 6, 002, NULL, 97, NULL, 29, NULL, NULL, '753190506', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1119, 696, NULL, '0', 'Loroo H/C III', 6, 002, NULL, 103, NULL, 94, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1120, 696, NULL, '0', 'Cheptapoyo H/C II', 5, 002, NULL, 103, NULL, 94, NULL, NULL, '775975201', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1121, 438, NULL, '0', 'Kyaayi H/C III', 6, 002, NULL, 89, NULL, 122, NULL, NULL, '757288810', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1122, 614, NULL, '0', 'Kakoro H/C III', 6, 002, NULL, 79, NULL, 82, NULL, NULL, '782153309', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1123, 3, NULL, '0', 'Minakulu H/C III (Oyam)', 6, 002, NULL, 77, NULL, 4, NULL, NULL, '752994325', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1124, 472, NULL, '0', 'Lokopo H/C III', 6, 002, NULL, 105, NULL, 74, NULL, NULL, '753553216', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1125, 416, NULL, '0', 'Ober H/C III', 6, 002, NULL, 54, NULL, 61, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1126, 480, NULL, '0', 'Kibalinga H/C III', 6, 002, NULL, 68, NULL, 76, NULL, NULL, '705905158', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1127, 470, NULL, '0', 'Kyamusisi H/C III', 6, 002, NULL, 64, NULL, 73, NULL, NULL, '776954450', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1128, 36, NULL, '0', 'Asamuk H/C III', 6, 002, NULL, 4, NULL, 8, NULL, NULL, '783191692', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1130, 425, NULL, '0', 'St Marys H/C Kasaala', 12, 002, NULL, 55, NULL, 63, NULL, NULL, '775596473', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1131, 149, NULL, '0', 'Lukaya H/C III', 6, 002, NULL, 90, NULL, 100, NULL, NULL, '783406816', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1133, 240, NULL, '0', 'Kyondo H/C III', 6, 002, NULL, 40, NULL, 37, NULL, NULL, '773980505', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1134, 341, NULL, '0', 'Kanamba H/C III', 6, 002, NULL, 40, NULL, 52, NULL, NULL, '773415489', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1135, 341, NULL, '0', 'Karusandara H/C III', 6, 002, NULL, 40, NULL, 52, NULL, NULL, '779457973', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1136, 240, NULL, '0', 'Mt Riwenzori H/C III', 6, 002, NULL, 40, NULL, 37, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1137, 341, NULL, '0', 'Maliba H/C III', 6, 002, NULL, 40, NULL, 52, NULL, NULL, '753139988', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1138, 341, NULL, '0', 'Isule H/C III', 6, 002, NULL, 40, NULL, 52, NULL, NULL, '783813863', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1139, 341, NULL, '0', 'Hima Cement Clinic', 7, 002, NULL, 40, NULL, 52, NULL, NULL, '702255365', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1140, 223, NULL, '0', 'Kapedo H/C III', 6, 002, NULL, 29, NULL, 32, NULL, NULL, '785075122', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1141, 137, NULL, '0', 'Nyabubare H/C III', 6, 002, NULL, 16, NULL, 19, NULL, NULL, '701195071', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1142, 629, NULL, '0', 'Kyotera Medical Centre', 12, 002, NULL, 80, NULL, 83, NULL, NULL, '709230738', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1143, 99, NULL, '0', 'Kayogera H/C II', 5, 002, NULL, 10, NULL, 15, NULL, NULL, '782428661', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1144, 472, NULL, '0', 'Tapac H/C III', 6, 002, NULL, 65, NULL, 74, NULL, NULL, '775241847', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1145, 313, NULL, '0', 'Wabwoko H/C III', 6, 002, NULL, 42, NULL, 49, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1146, 698, NULL, '0', 'Merikit H/C III', 6, 002, NULL, 85, NULL, 95, NULL, NULL, '782307894', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1147, 1150, NULL, '0', 'Kikamulo H/C III', 6, 002, NULL, 71, NULL, 79, NULL, NULL, '773710558', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1148, 341, NULL, '0', 'Rwenzori Mountaineering Services', 12, 002, NULL, 40, NULL, 52, NULL, NULL, '789568755', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1149, 1150, NULL, '0', 'Wakyato H/C III', 6, 002, NULL, 71, NULL, 79, NULL, NULL, '775330824', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1150, NULL, NULL, '0', 'Ngoma H/C IV (Nakaseke)', 7, 002, NULL, 71, NULL, 79, 11, 'Ngoma Hub', '777386117', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1151, 1150, NULL, '0', 'Kinyogoga H/C III', 6, 002, NULL, 71, NULL, 79, NULL, NULL, '777823384', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1152, 425, NULL, '0', 'Kasozi H/C III (Luwero)', 6, 002, NULL, 55, NULL, 63, NULL, NULL, '773952579', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1153, 425, NULL, '0', 'Makulubita H/C III', 6, 002, NULL, 55, NULL, 63, NULL, NULL, '704593907', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1154, 425, NULL, '0', 'Nakatonya H/C III', 6, 002, NULL, 55, NULL, 63, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1155, 425, NULL, '0', 'Nattyole H/C III', 6, 002, NULL, 55, NULL, 63, NULL, NULL, '789584455', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1156, 425, NULL, '0', 'Luteete H/C III (Luwero)', 6, 002, NULL, 55, NULL, 63, NULL, NULL, '773462440', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1157, 425, NULL, '0', 'Holy Cross H/C III (Kikyusa)', 6, 002, NULL, 55, NULL, 63, NULL, NULL, '783134283', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1158, 425, NULL, '0', 'Bukalasa H/C III', 6, 002, NULL, 55, NULL, 63, NULL, NULL, '782951541', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1159, 2484, NULL, '0', 'Nawanyago H/C III', 6, 002, NULL, 36, NULL, 42, NULL, NULL, '779468841', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1160, 123, NULL, '0', 'Kaliro H/C IV (Kaliro)', 7, 002, NULL, 34, NULL, 17, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1161, 325, NULL, '0', 'Wesunire H/C III', 6, 002, NULL, 20, NULL, 51, NULL, NULL, '772074771', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1162, 222, NULL, '0', 'Bubambwe H/C III', 6, 002, NULL, 28, NULL, 31, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1163, 2493, NULL, '0', 'Kireku H/C III', 6, 002, NULL, 86, NULL, 41, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1164, 50, NULL, '0', 'Aripea H/C III', 6, 002, NULL, 7, NULL, 11, NULL, NULL, '774132977', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1165, 50, NULL, '0', 'Cilio H/C III', 6, 002, NULL, 7, NULL, 11, NULL, NULL, '774362299', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1166, 50, NULL, '0', 'Otombari H/C III', 6, 002, NULL, 7, NULL, 11, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1167, 631, NULL, '0', 'Inde H/C III', 6, 002, NULL, 7, NULL, 11, NULL, NULL, '774134184', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1168, 50, NULL, '0', 'Oje (Mission) H/C III', 6, 002, NULL, 7, NULL, 11, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', '');
INSERT INTO `facility` (`id`, `parentid`, `ipid`, `code`, `name`, `facilitylevelid`, `type`, `isactive`, `districtid`, `regionid`, `hubid`, `healthregionid`, `hubname`, `phonenumber`, `distancefromhub`, `email`, `contactperson`, `address`, `returnaddress`, `longitude`, `latitude`, `created_at`, `updated_at`, `createdby`) VALUES
(1169, 137, NULL, '0', 'Kyamuhunga H/C III', 6, 002, NULL, 16, NULL, 19, NULL, NULL, '704774905', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1170, 531, NULL, '0', 'Alwi H/C III', 6, 002, NULL, 74, NULL, 78, NULL, NULL, '774626457', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1171, 762, NULL, '0', 'Kalungi H/C III (Nakasongola)', 6, 002, NULL, 72, NULL, 77, NULL, NULL, '779510066', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1172, 380, NULL, '0', 'Nakapelimoru H/C III', 6, 002, NULL, 49, NULL, 57, NULL, NULL, '757949957', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1174, 191, NULL, '0', 'Our Lady Of Maria Assumpta', 12, 002, NULL, 88, NULL, 26, NULL, NULL, '778142382', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1175, 788, NULL, '0', 'Bweyogerere H/C III', 6, 002, NULL, 86, NULL, 24, NULL, NULL, '782687070', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1176, 698, NULL, '0', 'Kirewa Community H/C III', 6, 002, NULL, 85, NULL, 95, NULL, NULL, '779112270', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1177, 137, NULL, '0', 'Kakanju H/C III', 6, 002, NULL, 16, NULL, 19, NULL, NULL, '782749848', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1178, 358, NULL, '0', 'Bugongi H/C III', 6, 002, NULL, 114, NULL, 55, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1179, 313, NULL, '0', 'Kawongo H/C III', 6, 002, NULL, 42, NULL, 49, NULL, NULL, '784074745', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1180, 470, NULL, '0', 'Lulagala H/C III', 6, 002, NULL, 64, NULL, 73, NULL, NULL, '776373051', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1181, NULL, NULL, '0', 'Katakwi Hospital', 9, 002, NULL, 41, NULL, 47, 5, 'Katakwi Hub', '7780129142', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1182, 469, NULL, '0', 'Kabira H/C III (Mitooma)', 6, 002, NULL, 111, NULL, 72, NULL, NULL, '751422089', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1183, 669, NULL, '0', 'Mirambi H/C III', 6, 002, NULL, 93, NULL, 93, NULL, NULL, '777510067', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1184, 452, NULL, '0', 'Ikoba H/C III', 6, 002, NULL, 60, NULL, 69, NULL, NULL, '701913230', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1185, 2493, NULL, '0', 'Bushika H/C III', 6, 002, NULL, 9, NULL, 41, NULL, NULL, '782152230', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1186, 480, NULL, '0', 'Nkoko H/C III', 6, 002, NULL, 68, NULL, 76, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1188, 244, NULL, '0', 'Kyabasaija H/C III', 6, 002, NULL, 43, NULL, 38, NULL, NULL, '787139636', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1190, 480, NULL, '0', 'Bujuni H/C III', 6, 002, NULL, 68, NULL, 76, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1191, 480, NULL, '0', 'Butawaata H/C III', 6, 002, NULL, 68, NULL, 76, NULL, NULL, '788798757', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1192, 674, NULL, '0', 'Soroti H/C III', 6, 002, NULL, 84, NULL, 92, NULL, NULL, '782515470', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1193, 253, NULL, '0', 'Mazinga H/C III', 6, 002, NULL, 33, NULL, 113, NULL, NULL, '752621249', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1194, 705, NULL, '0', 'Community H/C (Kawempe)', 12, 002, NULL, 86, NULL, 116, NULL, NULL, '779823668', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1195, 313, NULL, '0', 'Bulika H/C II', 5, 002, NULL, 69, NULL, 49, NULL, NULL, '772026320', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1196, 53, NULL, '0', 'Oberabic H/C II', 5, 002, NULL, 5, NULL, 12, NULL, NULL, '774559828', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1197, 2484, NULL, '0', 'St Matia Mulumba H/C III -Irundu(Buyende)', 6, 002, NULL, 20, NULL, 42, NULL, NULL, '751661651', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1198, 531, NULL, '0', 'Orussi H/C III', 6, 002, NULL, 74, NULL, 78, NULL, NULL, '775794960', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1199, 788, NULL, '0', 'Luna Medical Cetre (Katooke)', 12, 002, NULL, 86, NULL, 24, NULL, NULL, '772480242', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1200, 470, NULL, '0', 'Magala H/C III', 6, 002, NULL, 64, NULL, 73, NULL, NULL, '772867322', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1202, 211, NULL, '0', 'Biharwe H/C III', 6, 002, NULL, 63, NULL, 71, NULL, NULL, '772870408', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1203, 211, NULL, '0', 'Kakoba Division H/C III', 6, 002, NULL, 63, NULL, 71, NULL, NULL, '782777708', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1205, 211, NULL, '0', 'Rubindi H/C III', 6, 002, NULL, 63, NULL, 71, NULL, NULL, '773474737', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1206, 211, NULL, '0', 'Mwizi H/C III', 6, 002, NULL, 63, NULL, 71, NULL, NULL, '703009996', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1207, 253, NULL, '0', 'Mulabana H/C II', 5, 002, NULL, 33, NULL, 113, NULL, NULL, '773309388', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1208, 149, NULL, '0', 'Kiti H/C III', 6, 002, NULL, 90, NULL, 100, NULL, NULL, '700484101', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1209, 10, NULL, '0', 'Openzinzi H/C III', 6, 002, NULL, 2, NULL, 6, NULL, NULL, '772545083', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1210, 470, NULL, '0', 'Kambaala H/C III', 6, 002, NULL, 64, NULL, 73, NULL, NULL, '786019262', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1211, 244, NULL, '0', 'Emesco H/C IV', 7, 002, NULL, 43, NULL, 38, NULL, NULL, '779531458', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1212, 480, NULL, '0', 'Mirembe Maria Gorreti H/C III ', 6, 002, NULL, 68, NULL, 76, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1213, 295, NULL, '0', 'St Matia Mulumba H/C III (Mubende)', 6, 002, NULL, 68, NULL, 46, NULL, NULL, '753908002', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1214, 450, NULL, '0', 'Lunyo H/C III', 6, 002, NULL, 17, NULL, 67, NULL, NULL, '774265872', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1215, 452, NULL, '0', 'Masindi Army Barracks', 12, 002, NULL, 60, NULL, 69, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1216, 452, NULL, '0', 'Field Artilary Army Barracks H/C IV', 12, 002, NULL, 60, NULL, 69, NULL, NULL, '774777675', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1217, 350, NULL, '0', 'Katulikire H/C III', 6, 002, NULL, 110, NULL, 53, NULL, NULL, '705378343', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1219, 256, NULL, '0', 'Puranga H/C III', 6, 002, NULL, 78, NULL, 39, NULL, NULL, '789736161', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1220, 313, NULL, '0', 'Ntenjeru H/C III', 6, 002, NULL, 42, NULL, 49, NULL, NULL, '782421768', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1221, 10, NULL, '0', 'Maaji A H/C II', 5, 002, NULL, 2, NULL, 6, NULL, NULL, '775990577', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1222, 191, NULL, '0', 'Epi Centre H/C IV (Butambala)', 7, 002, NULL, 88, NULL, 26, NULL, NULL, '757895866', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1223, 650, NULL, '0', 'Engari Community H/C', 12, 002, NULL, 45, NULL, 86, NULL, NULL, '784835251', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1224, 450, NULL, '0', 'Buteba H/C III', 6, 002, NULL, 17, NULL, 67, NULL, NULL, '782014159', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1225, 433, NULL, '0', 'Katovu H/C III', 6, 002, NULL, 92, NULL, 115, NULL, NULL, '784077699', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1226, 1181, NULL, '0', 'Kapujan H/C III', 6, 002, NULL, 41, NULL, 47, NULL, NULL, '774578147', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1227, 416, NULL, '0', 'Okwang H/C III', 6, 002, NULL, 107, NULL, 61, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1228, 137, NULL, '0', 'Nyarugoote H/C II', 5, 002, NULL, 16, NULL, 19, NULL, NULL, '782452313', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1229, 224, NULL, '0', 'Kashambya H/C III', 6, 002, NULL, 30, NULL, 33, NULL, NULL, '771681090', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1230, 558, NULL, '0', 'Nyakagyeme H/C III', 6, 002, NULL, 81, NULL, 81, NULL, NULL, '782668019', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1231, 558, NULL, '0', 'Kibirizi H/C III', 6, 002, NULL, 81, NULL, 81, NULL, NULL, '787061113', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1232, 211, NULL, '0', 'Kagongi H/C III', 6, 002, NULL, 63, NULL, 71, NULL, NULL, '774615891', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1233, 211, NULL, '0', 'Ndeija H/C III', 6, 002, NULL, 63, NULL, 71, NULL, NULL, '773562161', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1235, 470, NULL, '0', 'Uganda Muslim Supreme Council H/C III', 6, 002, NULL, 64, NULL, 73, NULL, NULL, '782030633', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1236, 224, NULL, '0', 'Kaharo H/C III', 6, 002, NULL, 30, NULL, 33, NULL, NULL, '702852095', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1237, 149, NULL, '0', 'Kabale H/C III (Kalungu)', 6, 002, NULL, 90, NULL, 100, NULL, NULL, '704570573', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1238, 425, NULL, '0', 'Namaggwa Clinic', 12, 002, NULL, 55, NULL, 63, NULL, NULL, '782136403', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1239, 698, NULL, '0', 'Mudakori H/C III', 6, 002, NULL, 85, NULL, 95, NULL, NULL, '0772/0702440973', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1240, 474, NULL, '0', 'Metu H/C III', 6, 002, NULL, 66, NULL, 75, NULL, NULL, '782204645', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1241, NULL, NULL, '0', 'Kyenjojo Hospital', 9, 002, NULL, 52, NULL, 60, 9, 'Kyenjojo Hub', '782972895', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1242, 1241, NULL, '0', 'Kaihura Villa Maria H/C II', 5, 002, NULL, 52, NULL, 60, NULL, NULL, '785103555', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1243, 1241, NULL, '0', 'St Martin H/C III -Mabira (Kyenjojo)', 6, 002, NULL, 52, NULL, 60, NULL, NULL, '771414700', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1244, 438, NULL, '0', 'Kisozi H/C III', 6, 002, NULL, 89, NULL, 122, NULL, NULL, '703270227', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1245, 187, NULL, '0', 'Mitandi H/C III (NGO)', 6, 002, NULL, 31, NULL, 25, NULL, NULL, '777637040', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1246, 1241, NULL, '0', 'Bufunjo H/C III', 6, 002, NULL, 52, NULL, 60, NULL, NULL, '703918802', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1247, 649, NULL, '0', 'Ntonwa H/C II', 5, 002, NULL, 37, NULL, 101, NULL, NULL, '772976181', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1248, 204, NULL, '0', 'Bukanga H/C III', 6, 002, NULL, 97, NULL, 29, NULL, NULL, '773549059', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1249, 558, NULL, '0', 'Nyakishenyi H/C III', 6, 002, NULL, 81, NULL, 81, NULL, NULL, '774231659', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1250, 1181, NULL, '0', 'Aakum H/C II', 5, 002, NULL, 41, NULL, 47, NULL, NULL, '773010075', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1251, 1181, NULL, '0', 'Akoboi H/C II (katakwi)', 5, 002, NULL, 41, NULL, 47, NULL, NULL, '775429485', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1252, 227, NULL, '0', 'Kobulubulu H/C III ', 6, 002, NULL, 32, NULL, 34, NULL, NULL, '753350409', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1254, 558, NULL, '0', 'Ndama H/C III', 6, 002, NULL, 81, NULL, 81, NULL, NULL, '782715894', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1255, 191, NULL, '0', 'Kibibi Nursing Home H/C III', 6, 002, NULL, 88, NULL, 26, NULL, NULL, '782080267', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1256, 451, NULL, '0', 'Butende H/C III', 6, 002, NULL, 59, NULL, 68, NULL, NULL, '775776565', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1257, 99, NULL, '0', 'Buwunga H/C III (Bugiri)', 6, 002, NULL, 10, NULL, 15, NULL, NULL, '784904850', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1258, 614, NULL, '0', 'Kameke H/C III', 6, 002, NULL, 79, NULL, 82, NULL, NULL, '756720664', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1259, 355, NULL, '0', 'Muramba H/C III', 6, 002, NULL, 46, NULL, 54, NULL, NULL, '781557742', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1260, 355, NULL, '0', 'Kinanira H/C III', 6, 002, NULL, 46, NULL, 54, NULL, NULL, '773337826', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1261, 355, NULL, '0', 'Nyarusiza H/C III', 6, 002, NULL, 46, NULL, 54, NULL, NULL, '773258770', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1262, 705, NULL, '0', 'Kasozi H/C III (Wakiso)', 6, 002, NULL, 86, NULL, 116, NULL, NULL, '782740565', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1263, 204, NULL, '0', 'Busowobi H/C III', 6, 002, NULL, 26, NULL, 29, NULL, NULL, '783900263', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1264, 276, NULL, '0', 'Rugyeyo H/C III', 6, 002, NULL, 38, NULL, 43, NULL, NULL, '772950155', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1265, 558, NULL, '0', 'North Kigezi Diocese M C H/C IV', 7, 002, NULL, 81, NULL, 81, NULL, NULL, '776123652', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1266, 558, NULL, '0', 'Bugangari H/C IV', 7, 002, NULL, 81, NULL, 81, NULL, NULL, '782473508', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1268, 358, NULL, '0', 'Mushanga H/C III', 6, 002, NULL, 114, NULL, 55, NULL, NULL, '782793329', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1269, 649, NULL, '0', 'Rwenjaza H/C II', 5, 002, NULL, 37, NULL, 101, NULL, NULL, '777841148', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1270, 124, NULL, '0', 'Stella Maris H/C II', 5, 002, NULL, 112, NULL, 18, NULL, NULL, '781266562', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1271, 1241, NULL, '0', 'Mwenge Estate Clinic', 12, 002, NULL, 52, NULL, 60, NULL, NULL, '787365791', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1273, 153, NULL, '0', 'Buwooya H/C III', 6, 002, NULL, 19, NULL, 49, NULL, NULL, '776147873', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1274, 698, NULL, '0', 'Bison H/C III', 6, 002, NULL, 85, NULL, 95, NULL, NULL, '779958793', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1275, 224, NULL, '0', 'Bufundi H/C III', 6, 002, NULL, 30, NULL, 33, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1276, 558, NULL, '0', 'Bwambara H/C III', 6, 002, NULL, 81, NULL, 81, NULL, NULL, '782741062', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1277, 224, NULL, '0', 'Butanda H/C III', 6, 002, NULL, 30, NULL, 33, NULL, NULL, '782272686', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1278, 698, NULL, '0', 'Kiyeyi H/C III', 6, 002, NULL, 85, NULL, 95, NULL, NULL, '703565790', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1280, 416, NULL, '0', 'Buwa H/C II', 5, 002, NULL, 104, NULL, 61, NULL, NULL, '782190949', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1281, 211, NULL, '0', 'MJAP-MMC  H/C IV', 7, 002, NULL, 63, NULL, 71, NULL, NULL, '755553193', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1282, 531, NULL, '0', 'Pakadha H/C III', 6, 002, NULL, 108, NULL, 78, NULL, NULL, '773953411', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1283, 50, NULL, '0', 'Offaka H/C III', 6, 002, NULL, 7, NULL, 11, NULL, NULL, '772611344', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1284, 191, NULL, '0', 'Buyanja H/C III (Mpigi)', 6, 002, NULL, 67, NULL, 26, NULL, NULL, '772938435', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1285, 124, NULL, '0', 'Kanyamwirima H/C III', 6, 002, NULL, 15, NULL, 18, NULL, NULL, '777364670', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1286, 478, NULL, '0', 'Mitala Maria H/C III', 6, 002, NULL, 67, NULL, 26, NULL, NULL, '784171268', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1287, 199, NULL, '0', 'Buhanika H/C III', 6, 002, NULL, 24, NULL, 28, NULL, NULL, '774304731', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1288, 460, NULL, '0', 'Namatala H/C IV', 7, 002, NULL, 62, NULL, 70, NULL, NULL, '779832509', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1289, 659, NULL, '0', 'Isibuka H/C III', 6, 002, NULL, 27, NULL, 87, NULL, NULL, '785843285', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1290, 659, NULL, '0', 'Kabugu H/C II', 5, 002, NULL, 27, NULL, 87, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1291, 659, NULL, '0', 'Kibengo H/C II', 5, 002, NULL, 27, NULL, 87, NULL, NULL, '788528932', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1292, 650, NULL, '0', 'Sanga H/C III', 6, 002, NULL, 45, NULL, 86, NULL, NULL, '777086003', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1293, 650, NULL, '0', 'Kashongi H/C III', 6, 002, NULL, 45, NULL, 86, NULL, NULL, '704492278', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1294, 137, NULL, '0', 'Ankole Tea H/C II', 5, 002, NULL, 16, NULL, 19, NULL, NULL, '705954346', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1295, 659, NULL, '0', 'Juru H/C II', 5, 002, NULL, 27, NULL, 87, NULL, NULL, '773832296', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1296, 224, NULL, '0', 'Iremera H/C III', 6, 002, NULL, 46, NULL, 33, NULL, NULL, '775578333', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1297, 355, NULL, '0', 'Gasovu H/C III', 6, 002, NULL, 46, NULL, 54, NULL, NULL, '783472944', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1298, 2493, NULL, '0', 'Hope Clinic Lukuli', 12, 002, NULL, 35, NULL, 41, NULL, NULL, '785037971', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1299, 187, NULL, '0', 'Nyantaboma H/C III', 6, 002, NULL, 31, NULL, 25, NULL, NULL, '775106042', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1300, 1241, NULL, '0', 'Hope Again Medical Centre (Kyenjojo)', 12, 002, NULL, 52, NULL, 60, NULL, NULL, '783030068', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1301, 199, NULL, '0', 'Bujumbura H/C III', 6, 002, NULL, 24, NULL, 28, NULL, NULL, '775580123', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1302, 211, NULL, '0', 'Nyakayojo H/C III', 6, 002, NULL, 63, NULL, 71, NULL, NULL, '750405263', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1303, 2493, NULL, '0', 'Nsambya Home Care', 12, 002, NULL, 35, NULL, 41, NULL, NULL, '782946608', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1304, 472, NULL, '0', 'Loputuk H/C III', 6, 002, NULL, 65, NULL, 74, NULL, NULL, '774509752', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1305, 50, NULL, '0', 'Wandi H/C III', 6, 002, NULL, 7, NULL, 11, NULL, NULL, '779910186', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1306, 674, NULL, '0', 'Kuchinjaji H/C III', 6, 002, NULL, 84, NULL, 92, NULL, NULL, '717319981', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1307, 149, NULL, '0', 'Kasambya H/C III (Kalungu)', 6, 002, NULL, 90, NULL, 100, NULL, NULL, '753126432', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1308, 50, NULL, '0', 'Opia H/C III', 6, 002, NULL, 7, NULL, 11, NULL, NULL, '777205160', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1309, 558, NULL, '0', 'Burombe H/C III', 6, 002, NULL, 81, NULL, 81, NULL, NULL, '392859470', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1310, 124, NULL, '0', 'Busaru H/C IV', 7, 002, NULL, 15, NULL, 18, NULL, NULL, '777124443', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1311, 224, NULL, '0', 'Rushoroza H/C III', 6, 002, NULL, 30, NULL, 33, NULL, NULL, '788705556', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1312, 279, NULL, '0', 'Tegeres H/C III', 6, 002, NULL, 39, NULL, 44, NULL, NULL, '704079686', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1313, 2493, NULL, '0', 'Mengo Hospital Counselling & HomeCare', 12, 002, NULL, 35, NULL, 41, NULL, NULL, '779174935', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1314, 551, NULL, '0', 'Butemba H/C III', 6, 002, NULL, 91, NULL, 106, NULL, NULL, '782258255', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1315, 313, NULL, '0', 'Lubya H/C II', 5, 002, NULL, 19, NULL, 49, NULL, NULL, '775359981', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1316, 320, NULL, '0', 'Katwe H/C III (Kiboga)', 6, 002, NULL, 44, NULL, 50, NULL, NULL, '784751968', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1317, 239, NULL, '0', 'Bwikara H/C III', 6, 002, NULL, 43, NULL, 36, NULL, NULL, '779037385', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1318, 470, NULL, '0', 'St Jacinta H/C III', 6, 002, NULL, 64, NULL, 73, NULL, NULL, '784784764', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1319, 124, NULL, '0', 'Ntandi H/C III', 6, 002, NULL, 15, NULL, 18, NULL, NULL, '782658738', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1320, 696, NULL, '0', 'Lolachat H/C III', 6, 002, NULL, 70, NULL, 94, NULL, NULL, '779287502', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1321, 224, NULL, '0', 'Kyanamira H/C III', 6, 002, NULL, 30, NULL, 33, NULL, NULL, '777544747', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1322, 674, NULL, '0', 'AIDS Information Centre (Soroti)', 12, 002, NULL, 84, NULL, 92, NULL, NULL, '782568048', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1323, 558, NULL, '0', 'Rwenshama H/C III', 6, 002, NULL, 81, NULL, 81, NULL, NULL, '782663275', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1324, 1181, NULL, '0', 'Aketa H/C III', 6, 002, NULL, 41, NULL, 47, NULL, NULL, '774353570', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1325, 313, NULL, '0', 'Nkokonjeru  H/C III (Kayunga)', 6, 002, NULL, 42, NULL, 49, NULL, NULL, '782649498', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1326, 313, NULL, '0', 'Nakifuma H/C III', 6, 002, NULL, 69, NULL, 49, NULL, NULL, '782973510', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1327, 313, NULL, '0', 'Kimenyedde H/C II', 5, 002, NULL, 69, NULL, 49, NULL, NULL, '703914568', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1328, 124, NULL, '0', 'Ntoroko H/C III (Ntoroko)', 6, 002, NULL, 112, NULL, 18, NULL, NULL, '773651028', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1329, 544, NULL, '0', 'Burere H/C III', 6, 002, NULL, 109, NULL, 80, NULL, NULL, '776303135', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1330, 137, NULL, '0', 'Kamuhunga H/C IV', 7, 002, NULL, 16, NULL, 19, NULL, NULL, '706768213', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1331, 50, NULL, '0', 'Orivu H/C II', 5, 002, NULL, 7, NULL, 11, NULL, NULL, '784325737', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1332, 50, NULL, '0', 'Bileafe H/C III', 6, 002, NULL, 7, NULL, 11, NULL, NULL, '773169512', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1333, 224, NULL, '0', 'CBHA-USAID RHU Project -Kabale', 12, 002, NULL, 30, NULL, 33, NULL, NULL, '700390172', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1334, 199, NULL, '0', 'Mukabara H/C III', 6, 002, NULL, 24, NULL, 28, NULL, NULL, '779428429', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1335, 670, NULL, '0', 'Kamod H/C II', 5, 002, NULL, 100, NULL, 90, NULL, NULL, '774554005', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1338, 195, NULL, '0', 'St Peters H/C II', 5, 002, NULL, 23, NULL, 27, NULL, NULL, '779754582', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1340, 644, NULL, '0', 'Kanywambogo H/C III', 6, 002, NULL, 25, NULL, 85, NULL, NULL, '774437949', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1341, 1181, NULL, '0', 'Magoro H/C III', 6, 002, NULL, 41, NULL, 47, NULL, NULL, '781560419', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1342, 1181, NULL, '0', 'Ngariam H/C III', 6, 002, NULL, 41, NULL, 47, NULL, NULL, '787454838', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1344, 650, NULL, '0', 'Nyakashashara H/C III', 6, 002, NULL, 45, NULL, 86, NULL, NULL, '777578374', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1345, 558, NULL, '0', 'Kisiizi  H/C III', 6, 002, NULL, 81, NULL, 81, NULL, NULL, '772654749', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1347, 191, NULL, '0', 'Maria Assumpta', 12, 002, NULL, 88, NULL, 26, NULL, NULL, '771868759', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1348, 191, NULL, '0', 'Sanyu Dom Service', 12, 002, NULL, 67, NULL, 26, NULL, NULL, '782189824', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1349, 2493, NULL, '0', 'PNC (Baylor-Mulago)', 12, 002, NULL, 35, NULL, 41, NULL, NULL, '775135977', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1350, 629, NULL, '0', 'Kasaali  H/C III', 6, 002, NULL, 80, NULL, 83, NULL, NULL, '782581121', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1351, 629, NULL, '0', 'Mutukula H/C III', 6, 002, NULL, 80, NULL, 83, NULL, NULL, '702153292', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1352, 674, NULL, '0', 'Kichinjaji  H/C  III', 6, 002, NULL, 84, NULL, 92, NULL, NULL, '775844853', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1353, 355, NULL, '0', 'Kagano  H/C   III', 6, 002, NULL, 46, NULL, 54, NULL, NULL, '787782378', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1354, 670, NULL, '0', 'Kidetok Mission H/C III', 6, 002, NULL, 100, NULL, 90, NULL, NULL, '7755237160', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1355, 227, NULL, '0', 'Kaberamaido Catholic H/C III', 6, 002, NULL, 32, NULL, 34, NULL, NULL, '779183236', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1356, 614, NULL, '0', 'Apopong  H/C  III', 5, 002, NULL, 79, NULL, 82, NULL, NULL, '777603058', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1357, 36, NULL, '0', 'Acowa  H/C  III', 6, 002, NULL, 4, NULL, 8, NULL, NULL, '773416892', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1358, 36, NULL, '0', 'Acumet  H/C   III', 6, 002, NULL, 4, NULL, 8, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1359, 137, NULL, '0', 'Hunter  Foundation  Hospital', 9, 002, NULL, 16, NULL, 19, NULL, NULL, '0751977464/070335122', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1360, 212, NULL, '0', 'Rugarama H/C III', 6, 002, NULL, 75, NULL, 30, NULL, NULL, '775445801', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1361, 50, NULL, '0', 'Anyiribu H/C III  ', 6, 002, NULL, 7, NULL, 11, NULL, NULL, '784494108', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1362, 650, NULL, '0', 'Kikatsi H/C III', 6, 002, NULL, 45, NULL, 86, NULL, NULL, '782840099', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1365, 472, NULL, '0', 'Lopeei H/C III', 6, 002, NULL, 105, NULL, 74, NULL, NULL, '784502424', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1366, 659, NULL, '0', 'Ntungu H/C II', 5, 002, NULL, 27, NULL, 87, NULL, NULL, '753540667', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1367, 608, NULL, '0', 'Rackoko H/C III', 6, 002, NULL, 78, NULL, 107, NULL, NULL, '777003811', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1370, 416, NULL, '0', 'Reproductive Health Uganda (Lira)', 12, 002, NULL, 54, NULL, 61, NULL, NULL, '788900286', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1371, 199, NULL, '0', 'Reproductive Health Uganda (Hoima)', 12, 002, NULL, 24, NULL, 28, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1372, 50, NULL, '0', 'Bondo H/C III', 6, 002, NULL, 7, NULL, 11, NULL, NULL, '777627975', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1373, 56, NULL, '0', 'Kabarwa   H/C  III', 6, 002, NULL, 12, NULL, 13, NULL, NULL, '752849976', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1374, 470, NULL, '0', 'Kikandwa  H/C  III', 6, 002, NULL, 64, NULL, 73, NULL, NULL, '774831073', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1375, 659, NULL, '0', 'Kikokwa  H/C   III', 6, 002, NULL, 27, NULL, 87, NULL, NULL, '702340590', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1378, 311, NULL, '0', 'Bowagajjo H/C III', 6, 002, NULL, 11, NULL, 48, NULL, NULL, '0783289055/075281372', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1379, 614, NULL, '0', 'Buchanagandi H/C III', 6, 002, NULL, 95, NULL, 82, NULL, NULL, '772388939', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1380, 425, NULL, '0', 'Kisule H/C III', 6, 002, NULL, 55, NULL, 63, NULL, NULL, '753691775', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1381, 224, NULL, '0', 'Bwikinda   H/C III', 6, 002, NULL, 30, NULL, 33, NULL, NULL, '703832444', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1382, 558, NULL, '0', 'Karuhembe H/C II', 5, 002, NULL, 81, NULL, 81, NULL, NULL, '772469607', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1383, 86, NULL, '0', 'Buteza H/C III', 6, 002, NULL, 83, NULL, 114, NULL, NULL, '777269814', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1384, 253, NULL, '0', 'Lulamba H/C III', 6, 002, NULL, 33, NULL, 113, NULL, NULL, '782318061', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1385, 253, NULL, '0', 'Mugoye H/C III', 6, 002, NULL, 33, NULL, 113, NULL, NULL, '782026552', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1386, 253, NULL, '0', 'Bubeke H/C III', 6, 002, NULL, 33, NULL, 113, NULL, NULL, '706492023', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1387, 614, NULL, '0', 'Tirinyi H/C III', 6, 002, NULL, 95, NULL, 82, NULL, NULL, '782147786', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1388, 1081, NULL, '0', 'Zumbo H/C III', 6, 002, NULL, 108, NULL, 78, NULL, NULL, '783794644', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1390, 659, NULL, '0', 'Kanywamaizi H/C III', 6, 002, NULL, 27, NULL, 87, NULL, NULL, '774437949', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1391, 551, NULL, '0', 'Kyankwanzi H/C III', 6, 002, NULL, 91, NULL, 106, NULL, NULL, '782921669', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1392, 650, NULL, '0', 'Burunga H/C III', 6, 002, NULL, 45, NULL, 86, NULL, NULL, '785357186', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1393, 187, NULL, '0', 'Karambi H/C III (Kabarole)', 6, 002, NULL, 31, NULL, 25, NULL, NULL, '779088450', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1394, 629, NULL, '0', 'Kacheera H/C III', 6, 002, NULL, 80, NULL, 83, NULL, NULL, '783782379', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1395, 240, NULL, '0', 'Hima  Govt H/C III', 6, 002, NULL, 40, NULL, 37, NULL, NULL, '774118384', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1396, 50, NULL, '0', 'St Joseph Hospital (Maracha)', 9, 002, NULL, 58, NULL, 11, NULL, NULL, '782495092', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1398, 211, NULL, '0', 'Kashare H/C III', 6, 002, NULL, 63, NULL, 71, NULL, NULL, '773147700', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1399, 239, NULL, '0', 'Kahunde H/c II', 5, 002, NULL, 43, NULL, 36, NULL, NULL, '781682059', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1400, 244, NULL, '0', 'Kiryanga H/C III', 6, 002, NULL, 43, NULL, 38, NULL, NULL, '783271188', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1401, 239, NULL, '0', 'Muhoro H/C III', 6, 002, NULL, 43, NULL, 36, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1402, 452, NULL, '0', 'Pakanyi H/C III', 6, 002, NULL, 60, NULL, 69, NULL, NULL, '773022229', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1403, 355, NULL, '0', 'Nyarubuye H/C III', 6, 002, NULL, 46, NULL, 54, NULL, NULL, '775116345', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1404, 460, NULL, '0', 'Kolonyi Hospital', 9, 002, NULL, 62, NULL, 70, NULL, NULL, '783426583', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1405, 450, NULL, '0', 'Busitema H/C III', 6, 002, NULL, 17, NULL, 67, NULL, NULL, '782416956', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1407, 279, NULL, '0', 'Buluganya H/C III', 6, 002, NULL, 94, NULL, 44, NULL, NULL, '779601907', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1409, 398, NULL, '0', 'Karwenyi H/C II', 5, 002, NULL, 51, NULL, 58, NULL, NULL, '775119923', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1410, 191, NULL, '0', 'Kalamba H/C II', 5, 002, NULL, 88, NULL, 26, NULL, NULL, '776192760', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1411, 279, NULL, '0', 'Chebonet H/C III', 6, 002, NULL, 39, NULL, 44, NULL, NULL, '77933588', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1413, 531, NULL, '0', 'Padwot Midyere H/C III', 6, 002, NULL, 74, NULL, 78, NULL, NULL, '783794644', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1414, 276, NULL, '0', 'CBHA -USAID Project (RHU)- Kanungu', 12, 002, NULL, 38, NULL, 43, NULL, NULL, '782571348', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1415, 3, NULL, '0', 'Alenga H/C III', 6, 002, NULL, 6, NULL, 4, NULL, NULL, '752238402', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1416, 36, NULL, '0', 'Obalanga H/C III', 6, 002, NULL, 4, NULL, 8, NULL, NULL, '755986656', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1419, 253, NULL, '0', 'Bwendero H/C III', 6, 002, NULL, 33, NULL, 113, NULL, NULL, '782840049', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1420, 696, NULL, '0', 'Karita H/C III (Amudat)', 6, 002, NULL, 103, NULL, 94, NULL, NULL, '781762787', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1421, 544, NULL, '0', 'Butare H/C III(Buhweju)', 6, 002, NULL, 109, NULL, 80, NULL, NULL, '789392890', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1422, 279, NULL, '0', 'Chesower H/C III', 6, 002, NULL, 13, NULL, 44, NULL, NULL, '777252116', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1424, 224, NULL, '0', 'Kakomo H/C III', 6, 002, NULL, 30, NULL, 33, NULL, NULL, '779010578', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1425, 558, NULL, '0', 'Buyanja H/C III (Rukungiri)', 6, 002, NULL, 81, NULL, 81, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1426, 2493, NULL, '0', 'JOY Medical Centre', 12, 002, NULL, 35, NULL, 41, NULL, NULL, '775348765', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1427, 374, NULL, '0', 'Dranya H/C III', 6, 002, NULL, 48, NULL, 11, NULL, NULL, '782667177', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1428, 374, NULL, '0', 'Dricile H/C III', 6, 002, NULL, 48, NULL, 11, NULL, NULL, '775086109', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1430, 425, NULL, '0', 'Mariana Maternity Home', 12, 002, NULL, 55, NULL, 63, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1431, 433, NULL, '0', 'Makondo H/C II', 5, 002, NULL, 92, NULL, 115, NULL, NULL, '785833640', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1432, 460, NULL, '0', 'Kameruka H/C III', 6, 002, NULL, 8, NULL, 70, NULL, NULL, '783248396', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1433, 240, NULL, '0', 'Katunguru H/C III (Kasese)', 6, 002, NULL, 40, NULL, 37, NULL, NULL, '779929113', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1434, 460, NULL, '0', 'Marah H/C III', 6, 002, NULL, 8, NULL, 70, NULL, NULL, '782495092', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1435, 659, NULL, '0', 'Rubondo H/C II', 5, 002, NULL, 27, NULL, 87, NULL, NULL, '774845808', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1436, 531, NULL, '0', 'Angal Hospital (St Luke)', 9, 002, NULL, 74, NULL, 78, NULL, NULL, '774943778', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1437, 639, NULL, '0', 'Kicwamba H/C III', 6, 002, NULL, 113, NULL, 84, NULL, NULL, '782763676', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1438, 204, NULL, '0', 'Ikonia H/C III', 6, 002, NULL, 97, NULL, 29, NULL, NULL, '779486179', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1439, 450, NULL, '0', 'Mbehenyi H/C III', 6, 002, NULL, 17, NULL, 67, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1440, 187, NULL, '0', 'Kasenda H/C III', 6, 002, NULL, 31, NULL, 25, NULL, NULL, '700714323', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1441, 50, NULL, '0', 'Oraba H/C II', 5, 002, NULL, 48, NULL, 11, NULL, NULL, '793996672', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1442, 86, NULL, '0', 'Buwalasi H/C III', 6, 002, NULL, 83, NULL, 114, NULL, NULL, '772453391', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1443, 480, NULL, '0', 'Mawujjo H/C II', 5, 002, NULL, 68, NULL, 76, NULL, NULL, '775477608', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1444, 650, NULL, '0', 'Kinoni H/C III (Kiruhura)', 6, 002, NULL, 45, NULL, 86, NULL, NULL, '784673609', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1445, 614, NULL, '0', 'Bulangira H/C III', 6, 002, NULL, 95, NULL, 82, NULL, NULL, '774206402', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1446, 211, NULL, '0', 'Kanyaryeru H/C III', 6, 002, NULL, 45, NULL, 71, NULL, NULL, '782185442', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1447, 551, NULL, '0', 'Kikonda H/C III', 6, 002, NULL, 91, NULL, 106, NULL, NULL, '773095756', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1448, 614, NULL, '0', 'Kadama H/C III', 6, 002, NULL, 95, NULL, 82, NULL, NULL, '757511949', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1450, 1081, NULL, '0', 'Jangokoro H/C III', 6, 002, NULL, 108, NULL, 78, NULL, NULL, '784498604', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1451, 451, NULL, '0', 'Lambu H/C II', 5, 002, NULL, 59, NULL, 68, NULL, NULL, '776342034', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1452, 279, NULL, '0', 'Cheptuya H/C III', 6, 002, NULL, 39, NULL, 44, NULL, NULL, '701659969', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1453, 788, NULL, '0', 'TASO Entebbe', 12, 002, NULL, 86, NULL, 24, NULL, NULL, '752812084', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1454, 195, NULL, '0', 'Omel H/C II', 5, 002, NULL, 23, NULL, 27, NULL, NULL, '773957701', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1455, 325, NULL, '0', 'Bugaya H/C III (Buyende)', 6, 002, NULL, 20, NULL, 51, NULL, NULL, '753404721', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1456, 195, NULL, '0', 'Dino H/C II', 5, 002, NULL, 23, NULL, 27, NULL, NULL, '772949356', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1457, 240, NULL, '0', 'Kyarumba H/C III (Government)', 6, 002, NULL, 40, NULL, 37, NULL, NULL, '783653013', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1458, 460, NULL, '0', 'Naboa H/C III', 6, 002, NULL, 8, NULL, 70, NULL, NULL, '782310948', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1459, 696, NULL, '0', 'Amaler H/C III', 6, 002, NULL, 70, NULL, 94, NULL, NULL, '777851634', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1460, 1241, NULL, '0', 'Kyakatara H/C III', 6, 002, NULL, 52, NULL, 60, NULL, NULL, '775777869', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1461, 639, NULL, '0', 'Kichwamba H/C III (Rubirizi)', 6, 002, NULL, 113, NULL, 84, NULL, NULL, '772831110', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1462, 311, NULL, '0', 'Health Initiative for Africa (BMC)', 12, 002, NULL, 11, NULL, 48, NULL, NULL, '777040536', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1463, 211, NULL, '0', 'Makenke H/C IV', 7, 002, NULL, 63, NULL, 71, NULL, NULL, '702077202', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1464, 452, NULL, '0', 'Kyatiri H/C III', 6, 002, NULL, 60, NULL, 69, NULL, NULL, '772370508', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1465, 341, NULL, '0', 'Kabatunda H/C III', 6, 002, NULL, 40, NULL, 52, NULL, NULL, '777308162', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1466, 614, NULL, '0', 'Galimagi H/C III', 6, 002, NULL, 79, NULL, 82, NULL, NULL, '788022411', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1467, 187, NULL, '0', 'Kida Hospital', 9, 002, NULL, 31, NULL, 25, NULL, NULL, '779776333', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1468, 452, NULL, '0', 'Nyakitibwa H/C III', 6, 002, NULL, 60, NULL, 69, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1469, 531, NULL, '0', 'Pakia H/C III', 6, 002, NULL, 74, NULL, 78, NULL, NULL, '787148565', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1470, 698, NULL, '0', 'St Anthony Hospital', 9, 002, NULL, 85, NULL, 95, NULL, NULL, '788486600', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1471, 195, NULL, '0', 'Loyo Ajonga H/C II', 5, 002, NULL, 23, NULL, 27, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1472, 2493, NULL, '0', 'Nurture  Africa H/C III', 6, 002, NULL, 86, NULL, 41, NULL, NULL, '777335365', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1473, 698, NULL, '0', 'Kwapa H/C III', 6, 002, NULL, 85, NULL, 95, NULL, NULL, '753663517', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1474, 240, NULL, '0', 'Kisojo H/C II (Kasese)', 5, 002, NULL, 40, NULL, 37, NULL, NULL, '772920134', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1475, 279, NULL, '0', 'Bukwo General Hospital', 9, 002, NULL, 13, NULL, 44, NULL, NULL, '753900412', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', '');
INSERT INTO `facility` (`id`, `parentid`, `ipid`, `code`, `name`, `facilitylevelid`, `type`, `isactive`, `districtid`, `regionid`, `hubid`, `healthregionid`, `hubname`, `phonenumber`, `distancefromhub`, `email`, `contactperson`, `address`, `returnaddress`, `longitude`, `latitude`, `created_at`, `updated_at`, `createdby`) VALUES
(1480, 38, NULL, '0', 'St Andrew H/C II', 5, 002, NULL, 106, NULL, 10, NULL, NULL, '755162506', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1481, 224, NULL, '0', 'Kakatunda H/C III', 6, 002, NULL, 30, NULL, 33, NULL, NULL, '783943467', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1482, 239, NULL, '0', 'Kinyarugunjo H/C III', 6, 002, NULL, 43, NULL, 36, NULL, NULL, '78780608', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1483, 470, NULL, '0', 'Makonzi H/C III', 6, 002, NULL, 64, NULL, 73, NULL, NULL, '774220141', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1484, 121, NULL, '0', 'Biiso H/C III', 6, 002, NULL, 14, NULL, 16, NULL, NULL, '788775339', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1485, 416, NULL, '0', 'FICRD', 12, 002, NULL, 54, NULL, 61, NULL, NULL, '787079947', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1486, 398, NULL, '0', 'Wekomiire H/C III (St Thereza)', 6, 002, NULL, 51, NULL, 58, NULL, NULL, '788037431', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1487, 474, NULL, '0', 'Palorinya H/C III', 6, 002, NULL, 66, NULL, 75, NULL, NULL, '753910286', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1488, 470, NULL, '0', 'St Francis C H/C III (HOSFA)- Mityana', 6, 002, NULL, 64, NULL, 73, NULL, NULL, '779492379', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1489, 698, NULL, '0', 'Kukewa H/C III', 6, 002, NULL, 57, NULL, 95, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1490, 698, NULL, '0', 'Bukewa H/C III', 6, 002, NULL, 57, NULL, 95, NULL, NULL, '788308221', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1491, 698, NULL, '0', 'Bukhabusi H/C III', 6, 002, NULL, 57, NULL, 95, NULL, NULL, '773851384', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1492, 460, NULL, '0', 'Nakaloke H/C III', 6, 002, NULL, 62, NULL, 70, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1493, 50, NULL, '0', 'Aroi H/C III', 6, 002, NULL, 7, NULL, 11, NULL, NULL, '782500543', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1494, 195, NULL, '0', 'Lanenober H/C III', 6, 002, NULL, 23, NULL, 27, NULL, NULL, '781293554', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1495, 788, NULL, '0', 'Wagagai H/C IV', 7, 002, NULL, 86, NULL, 24, NULL, NULL, '776555092', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1496, 788, NULL, '0', 'Nassolo Wamala H/C II', 5, 002, NULL, 86, NULL, 24, NULL, NULL, '777550235', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1497, 311, NULL, '0', 'Lugazi Muslim H/C II', 5, 002, NULL, 11, NULL, 48, NULL, NULL, '788860511', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1498, 551, NULL, '0', 'Mujunza H/C II', 5, 002, NULL, 91, NULL, 106, NULL, NULL, '781029097', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1499, 670, NULL, '0', 'Aarapoo H/C II', 5, 002, NULL, 100, NULL, 90, NULL, NULL, '778553101', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1500, 995, NULL, '0', 'Ajeluk H/C III', 6, 002, NULL, 99, NULL, 105, NULL, NULL, '782961216', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1501, 56, NULL, '0', 'Agaria H/C II', 5, 002, NULL, 50, NULL, 13, NULL, NULL, '784458781', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1502, 276, NULL, '0', 'Kanyantorogo H/C III', 6, 002, NULL, 38, NULL, 43, NULL, NULL, '782440485', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1503, 355, NULL, '0', 'Buhozi H/C III', 6, 002, NULL, 46, NULL, 54, NULL, NULL, '787719517', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1504, 2493, NULL, '0', 'Reachout (  Kinawataka   Site)', 12, 002, NULL, 35, NULL, 41, NULL, NULL, '776509554', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1505, 211, NULL, '0', 'Bukiro H/C III', 6, 002, NULL, 63, NULL, 71, NULL, NULL, '782596463', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1506, 211, NULL, '0', 'Ruharo Mission Hospital', 9, 002, NULL, 63, NULL, 71, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1507, 705, NULL, '0', 'Kiziba H/C III (Wakiso)', 6, 002, NULL, 86, NULL, 116, NULL, NULL, '712880371', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1508, 1241, NULL, '0', 'Mwenge H/C III', 6, 002, NULL, 52, NULL, 60, NULL, NULL, '782312850', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1509, 705, NULL, '0', 'Busawa Manze H/C III', 6, 002, NULL, 86, NULL, 116, NULL, NULL, '776189191', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1510, 460, NULL, '0', 'Katira H/C III (Budaka)', 6, 002, NULL, 8, NULL, 70, NULL, NULL, '782982003', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1511, 86, NULL, '0', 'Bugitimwa H/C III', 6, 002, NULL, 83, NULL, 114, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1512, 195, NULL, '0', 'Te-Atoo H/C II', 5, 002, NULL, 23, NULL, 27, NULL, NULL, '782798268', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1513, 311, NULL, '0', 'Ddungi H/C II', 5, 002, NULL, 11, NULL, 48, NULL, NULL, '75026832', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1514, 36, NULL, '0', 'AIDS  Information Centre (AMURIA)', 12, 002, NULL, 4, NULL, 8, NULL, NULL, '702003008', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1515, 558, NULL, '0', 'St Sabena H/C II', 5, 002, NULL, 81, NULL, 81, NULL, NULL, '787288238', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1516, 450, NULL, '0', 'Bulumbi H/C III', 6, 002, NULL, 17, NULL, 67, NULL, NULL, '787774706', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1517, 195, NULL, '0', 'Lacor Hospital', 9, 002, NULL, 23, NULL, 27, NULL, NULL, '782381045', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1518, 674, NULL, '0', 'Lalle H/C II', 5, 002, NULL, 84, NULL, 92, NULL, NULL, '774303912', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1519, 279, NULL, '0', 'Bumwambu H/C III', 6, 002, NULL, 94, NULL, 44, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1520, 50, NULL, '0', 'Nyadri H/C III', 6, 002, NULL, 58, NULL, 11, NULL, NULL, '775757293', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1521, 2493, NULL, '0', 'Reachout (Mbuya Site)', 12, 002, NULL, 35, NULL, 41, NULL, NULL, '782283023', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1522, 438, NULL, '0', 'Buyanja H/C (Gomba)', 1, 002, NULL, 89, NULL, 122, NULL, NULL, '788068935', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1523, 195, NULL, '0', 'Lujorongole H/C II', 5, 002, NULL, 23, NULL, 27, NULL, NULL, '777646767', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1524, 460, NULL, '0', 'Kamonkoli H/C III', 6, 002, NULL, 8, NULL, 70, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1526, 629, NULL, '0', 'Kasensero H/C II', 5, 002, NULL, 80, NULL, 83, NULL, NULL, '779417473', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1527, 460, NULL, '0', 'Sapiri H/C III', 6, 002, NULL, 8, NULL, 70, NULL, NULL, '772915124', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1529, 674, NULL, '0', 'Aukot H/C II', 5, 002, NULL, 84, NULL, 92, NULL, NULL, '782344096', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1531, 211, NULL, '0', 'Nyaruhandagazi H/C IV', 7, 002, NULL, 63, NULL, 71, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1532, 211, NULL, '0', 'Buzibwera H/C IV', 7, 002, NULL, 63, NULL, 71, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1534, 211, NULL, '0', 'Makonje H/C II St Franciska', 5, 002, NULL, 63, NULL, 71, NULL, NULL, '789960508', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1535, 211, NULL, '0', 'AIDS Information Centre (Mbarara)', 12, 002, NULL, 63, NULL, 71, NULL, NULL, '0702/0772-566692', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1536, 211, NULL, '0', 'Kamukuzi H/C III', 6, 002, NULL, 63, NULL, 71, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1537, 211, NULL, '0', 'Mbarara Community Hospital', 9, 002, NULL, 63, NULL, 71, NULL, NULL, '774654482', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1538, 224, NULL, '0', 'Muko H/C III (NGO)', 6, 002, NULL, 30, NULL, 33, NULL, NULL, '784044472', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1539, 224, NULL, '0', 'Kaara H/C III', 6, 002, NULL, 30, NULL, 33, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1540, 224, NULL, '0', 'Kyogo H/C III', 6, 002, NULL, 30, NULL, 33, NULL, NULL, '783703691', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1541, 224, NULL, '0', 'Kitooma H/C III', 6, 002, NULL, 30, NULL, 33, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1542, 224, NULL, '0', 'Buhara H/C III (NGO)', 6, 002, NULL, 30, NULL, 33, NULL, NULL, '784558233', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1543, 224, NULL, '0', 'Kitanga H/C III', 6, 002, NULL, 30, NULL, 33, NULL, NULL, '7002915661', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1545, 224, NULL, '0', 'Nyarushanje H/C III', 6, 002, NULL, 30, NULL, 33, NULL, NULL, '701182237', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1546, 224, NULL, '0', 'Kirigime Hospital (UMSC)', 9, 002, NULL, 30, NULL, 33, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1547, 224, NULL, '0', 'Rubanda PHC H/C III', 6, 002, NULL, 30, NULL, 33, NULL, NULL, '784124212', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1548, 187, NULL, '0', 'Luteete H/C III (FortPortal)', 6, 002, NULL, 31, NULL, 25, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1549, 195, NULL, '0', 'Alokolum H/C II', 5, 002, NULL, 23, NULL, 27, NULL, NULL, '774849203', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1550, 195, NULL, '0', 'Patuda H/C II', 5, 002, NULL, 23, NULL, 27, NULL, NULL, '773348588', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1551, 195, NULL, '0', 'Lelaobaro H/C II', 5, 002, NULL, 23, NULL, 27, NULL, NULL, '773469253', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1552, 195, NULL, '0', 'Tekulu H/C II', 6, 002, NULL, 23, NULL, 27, NULL, NULL, '774592555', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1553, 195, NULL, '0', 'Koro Abili H/C II', 5, 002, NULL, 23, NULL, 27, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1554, 195, NULL, '0', 'Koro Lapainat H/C II', 5, 002, NULL, 23, NULL, 27, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1555, 195, NULL, '0', 'Lakwatomer H/C II', 5, 002, NULL, 23, NULL, 27, NULL, NULL, '700131086', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1557, 195, NULL, '0', 'Rwot Obilo H/C II', 5, 002, NULL, 23, NULL, 27, NULL, NULL, '777011365', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1558, 195, NULL, '0', 'GwengDiya H/C II', 5, 002, NULL, 23, NULL, 27, NULL, NULL, '715458549', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1559, 195, NULL, '0', 'Lapeta H/C II', 5, 002, NULL, 23, NULL, 27, NULL, NULL, '779025443', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1560, 195, NULL, '0', 'Pukony H/C II', 5, 002, NULL, 23, NULL, 27, NULL, NULL, '782723643', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1561, 187, NULL, '0', 'Kasonganyanja H/C III', 6, 002, NULL, 40, NULL, 25, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1562, 50, NULL, '0', 'Arivu H/C III', 6, 002, NULL, 7, NULL, 11, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1563, 50, NULL, '0', 'Driate H/C III', 6, 002, NULL, 7, NULL, 11, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1564, 2493, NULL, '0', 'Reachout (Banda Site)', 12, 002, NULL, 35, NULL, 41, NULL, NULL, '754308311', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1565, 253, NULL, '0', 'Bufumira H/C III', 6, 002, NULL, 33, NULL, 113, NULL, NULL, '773445008', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1566, 696, NULL, '0', '407 Brigade H/C III', 6, 002, NULL, 70, NULL, 94, NULL, NULL, '789801648', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1567, 452, NULL, '0', 'Kijunjubwa H/C III', 6, 002, NULL, 60, NULL, 69, NULL, NULL, '776335580', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1568, 187, NULL, '0', 'Katojo H/C III', 6, 002, NULL, 31, NULL, 25, NULL, NULL, '704300443', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1569, 629, NULL, '0', 'Byakabanda H/C III', 6, 002, NULL, 80, NULL, 83, NULL, NULL, '775072717', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1570, 469, NULL, '0', 'Kashenshero H/C III', 6, 002, NULL, 111, NULL, 72, NULL, NULL, '782204050', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1571, 674, NULL, '0', 'Teso Safe Motherhood Project', 12, 002, NULL, 84, NULL, 92, NULL, NULL, '779038290', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1572, 1241, NULL, '0', 'Kyankaramata H/C II', 5, 002, NULL, 52, NULL, 60, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1575, 629, NULL, '0', 'Kirumba H/C III (Rakai)', 6, 002, NULL, 80, NULL, 83, NULL, NULL, '7773319300', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1576, 320, NULL, '0', 'Muwanga H/C III', 6, 002, NULL, 44, NULL, 50, NULL, NULL, '0775307477/078260021', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1577, 211, NULL, '0', 'Holy Innocent Childrens Hospital', 9, 002, NULL, 63, NULL, 71, NULL, NULL, '775967880', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1578, 199, NULL, '0', 'Bujalya H/C III', 6, 002, NULL, 24, NULL, 28, NULL, NULL, '773771916', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1579, 211, NULL, '0', 'Mugarama H/C III (Mbarara)', 6, 002, NULL, 63, NULL, 71, NULL, NULL, '774105065', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1581, 121, NULL, '0', 'Butiaba H/C II', 5, 002, NULL, 14, NULL, 16, NULL, NULL, '782833281', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1582, 56, NULL, '0', 'Olimai Community H/C III', 6, 002, NULL, 50, NULL, 13, NULL, NULL, '778572003', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1583, 160, NULL, '0', 'Biwihi H/C II', 5, 002, NULL, 98, NULL, 21, NULL, NULL, '776189069', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1584, 239, NULL, '0', 'Mugarama H/C III (Kibaale)', 6, 002, NULL, 43, NULL, 36, NULL, NULL, '706263108', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1585, 2484, NULL, '0', 'Namuningi H/C II', 5, 002, NULL, 36, NULL, 42, NULL, NULL, '782436123', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1586, 191, NULL, '0', 'Kawonawo H/C II', 5, 002, NULL, 88, NULL, 26, NULL, NULL, '782641959', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1587, 295, NULL, '0', 'Kyakiddu H/C II', 5, 002, NULL, 68, NULL, 46, NULL, NULL, '776841655', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1588, 36, NULL, '0', 'Amucu H/C III', 6, 002, NULL, 4, NULL, 8, NULL, NULL, '787324669', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1589, 50, NULL, '0', 'Okollo H/C III', 5, 002, NULL, 7, NULL, 11, NULL, NULL, '773217752', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1590, 239, NULL, '0', 'Rugashali H/C III', 6, 002, NULL, 43, NULL, 36, NULL, NULL, '775851688', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1591, 239, NULL, '0', 'St Micheal H/C III (Kibaale)', 6, 002, NULL, 43, NULL, 36, NULL, NULL, '774682219', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1592, 276, NULL, '0', 'Kirima H/C III', 6, 002, NULL, 38, NULL, 43, NULL, NULL, '782605075', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1593, 2493, NULL, '0', 'Kireka SDA H/C III', 6, 002, NULL, 86, NULL, 41, NULL, NULL, '773433690', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1594, 2493, NULL, '0', 'Nsambya Police H/C IV', 7, 002, NULL, 35, NULL, 41, NULL, NULL, '782061513', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1596, 53, NULL, '0', 'Olwal H/C III', 6, 002, NULL, 5, NULL, 12, NULL, NULL, '782593689', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1597, 698, NULL, '0', 'Beatrice Tierney H/C III', 6, 002, NULL, 57, NULL, 95, NULL, NULL, '784626402', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1598, 614, NULL, '0', 'Kibale H/C III(Palisa)', 6, 002, NULL, 79, NULL, 82, NULL, NULL, '777769756', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1599, 256, NULL, '0', 'Adilang H/C III', 6, 002, NULL, 101, NULL, 39, NULL, NULL, '774398895', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1600, 223, NULL, '0', 'Kalapata H/C III', 6, 002, NULL, 29, NULL, 32, NULL, NULL, '775899843', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1601, 670, NULL, '0', 'Omagoro H/C III', 5, 002, NULL, 100, NULL, 90, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1602, 649, NULL, '0', 'Bihanga H/C II (Kamwenge)', 5, 002, NULL, 37, NULL, 101, NULL, NULL, '779085512', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1603, 452, NULL, '0', 'FAD Army H/C IV', 7, 002, NULL, 60, NULL, 69, NULL, NULL, '772383227', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1604, 478, NULL, '0', 'St Monica H/C III (Katende)', 6, 002, NULL, 67, NULL, 26, NULL, NULL, '776232003', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1605, 551, NULL, '0', 'Nalinya Ndagire H/C III', 6, 002, NULL, 91, NULL, 106, NULL, NULL, '775274267', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1606, 788, NULL, '0', 'Mutundwe H/C II', 5, 002, NULL, 86, NULL, 24, NULL, NULL, '782565176', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1607, 659, NULL, '0', 'Kyabirukwa H/C III', 6, 002, NULL, 27, NULL, 87, NULL, NULL, '776744174', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1608, 253, NULL, '0', 'Jaana H/C II', 5, 002, NULL, 33, NULL, 113, NULL, NULL, '778138096', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1609, 279, NULL, '0', 'Gamatimbeyi H/C III', 6, 002, NULL, 94, NULL, 44, NULL, NULL, '701267208', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1610, 649, NULL, '0', 'Kabingo H/C II', 5, 002, NULL, 37, NULL, 101, NULL, NULL, '774591800', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1611, 10, NULL, '0', 'Pakele H/C III', 6, 002, NULL, 2, NULL, 6, NULL, NULL, '785637443', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1612, 1241, NULL, '0', 'Kigoyera H/C II', 5, 002, NULL, 52, NULL, 60, NULL, NULL, '785103555', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1613, 639, NULL, '0', 'Kyenzaza H/C II', 5, 002, NULL, 113, NULL, 84, NULL, NULL, '777842815', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1614, 698, NULL, '0', 'Bunambale H/C III', 6, 002, NULL, 57, NULL, 95, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1615, 256, NULL, '0', 'Alim H/C II', 5, 002, NULL, 78, NULL, 39, NULL, NULL, '754193865', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1616, 649, NULL, '0', 'Biguli  H/C III', 6, 002, NULL, 37, NULL, 101, NULL, NULL, '783788998', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1617, 355, NULL, '0', 'Bukimbiri H/C III', 6, 002, NULL, 46, NULL, 54, NULL, NULL, '774319327', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1618, 224, NULL, '0', 'Bubaare H/C III (Kabale)', 6, 002, NULL, 30, NULL, 33, NULL, NULL, '772692569', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1619, 124, NULL, '0', 'Ebenezer SDA Medical H/C III', 6, 002, NULL, 15, NULL, 18, NULL, NULL, '773353463', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1620, 160, NULL, '0', 'Busiro H/C III', 6, 002, NULL, 98, NULL, 21, NULL, NULL, '753065298', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1621, 276, NULL, '0', 'Rutenga H/C III', 6, 002, NULL, 38, NULL, 43, NULL, NULL, '774091142', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1622, 650, NULL, '0', 'St Marys H/C III-Kyeibuza', 6, 002, NULL, 45, NULL, 86, NULL, NULL, '785206020', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1623, 50, NULL, '0', 'Ayivuni H/C', 1, 002, NULL, 7, NULL, 11, NULL, NULL, '772347583', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1624, 187, NULL, '0', 'Rambia H/C III', 6, 002, NULL, 31, NULL, 25, NULL, NULL, '778383399', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1625, 698, NULL, '0', 'Mella H/C III', 6, 002, NULL, 85, NULL, 95, NULL, NULL, '774405748', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1626, 469, NULL, '0', 'Kanyabwanga H/C III', 6, 002, NULL, 111, NULL, 72, NULL, NULL, '782347461', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1627, 705, NULL, '0', 'Mutungo H/C II', 5, 002, NULL, 86, NULL, 116, NULL, NULL, '701378090', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1628, 698, NULL, '0', 'Molo H/C III', 6, 002, NULL, 85, NULL, 95, NULL, NULL, '779774381', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1629, 451, NULL, '0', 'Kyabakuza H/C II', 5, 002, NULL, 59, NULL, 68, NULL, NULL, '752628662', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1630, 1241, NULL, '0', 'Myeri H/C II (Kyenjojo)', 5, 002, NULL, 52, NULL, 60, NULL, NULL, '702924551', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1631, 23, NULL, '0', 'Aloi H/C III', 6, 002, NULL, 102, NULL, 108, NULL, NULL, '774889493', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1632, 712, NULL, '0', 'Yoyo H/C III', 6, 002, NULL, 87, NULL, 96, NULL, NULL, '773203594', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1633, 531, NULL, '0', 'Paminya H/C III', 6, 002, NULL, 74, NULL, 78, NULL, NULL, '775612173', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1634, 649, NULL, '0', 'Kimulikidongo H/C II', 5, 002, NULL, 37, NULL, 101, NULL, NULL, '777237768', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1635, 10, NULL, '0', 'Ofua H/C III', 6, 002, NULL, 2, NULL, 6, NULL, NULL, '774667160', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1636, 295, NULL, '0', 'Mundadde H/C III', 6, 002, NULL, 68, NULL, 46, NULL, NULL, '704803509', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1637, 240, NULL, '0', 'Kasenyi H/C II', 5, 002, NULL, 40, NULL, 37, NULL, NULL, '772954987', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1638, 360, NULL, '0', 'Pajimo H/C III', 6, 002, NULL, 47, NULL, 56, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1639, 698, NULL, '0', 'Poyameri H/C III', 6, 002, NULL, 85, NULL, 95, NULL, NULL, '751166853', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1640, 86, NULL, '0', 'Bumumulo H/C III', 6, 002, NULL, 83, NULL, 114, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1642, 144, NULL, '0', 'Butaleja H/C III', 6, 002, NULL, 18, NULL, 20, NULL, NULL, '772322768', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1643, 341, NULL, '0', 'Mahango H/C III', 6, 002, NULL, 40, NULL, 52, NULL, NULL, '783974758', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1644, 472, NULL, '0', 'Lotome H/C III', 6, 002, NULL, 105, NULL, 74, NULL, NULL, '772506949', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1645, 705, NULL, '0', 'Kabubbu H/C III', 6, 002, NULL, 86, NULL, 116, NULL, NULL, '782637984', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1646, 631, NULL, '0', 'Siripi H/C III', 6, 002, NULL, 7, NULL, 11, NULL, NULL, '774465518', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1647, 698, NULL, '0', 'Petta H/C III', 6, 002, NULL, 85, NULL, 95, NULL, NULL, '784959209', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1648, 313, NULL, '0', 'Lwajje H/C III', 6, 002, NULL, 19, NULL, 49, NULL, NULL, '782762164', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1649, 1181, NULL, '0', 'Bisina H/C II', 5, 002, NULL, 41, NULL, 47, NULL, NULL, '777332815', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1650, 670, NULL, '0', 'Kyere Mission H/C III', 6, 002, NULL, 100, NULL, 90, NULL, NULL, '756554229', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1651, 629, NULL, '0', 'Kyarulangira H/C III', 6, 002, NULL, 80, NULL, 83, NULL, NULL, '782587246', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1652, 10, NULL, '0', 'Robidire H/C III', 6, 002, NULL, 2, NULL, 6, NULL, NULL, '783799456', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1653, 313, NULL, '0', 'Namatale H/C II', 5, 002, NULL, 19, NULL, 49, NULL, NULL, '785010733', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1654, 762, NULL, '0', 'St Francis H/C   III Migyeera', 1, 002, NULL, 72, NULL, 77, NULL, NULL, '777859113', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1655, 698, NULL, '0', 'Paya H/C III', 6, 002, NULL, 85, NULL, 95, NULL, NULL, '781336819', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1656, 50, NULL, '0', 'Ocea H/C II', 5, 002, NULL, 7, NULL, 11, NULL, NULL, '773385476', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1657, 649, NULL, '0', 'Kichwamba H/C II (Kamwenge)', 5, 002, NULL, 37, NULL, 101, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1658, 2493, NULL, '0', 'Bukibokolo H/C III', 6, 002, NULL, 9, NULL, 41, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1659, 350, NULL, '0', 'St Marys Kigumba H/C III (NGO)', 6, 002, NULL, 110, NULL, 53, NULL, NULL, '759412154', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1660, 696, NULL, '0', 'Lemusuii H/C III', 6, 002, NULL, 70, NULL, 94, NULL, NULL, '752381099', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1661, 320, NULL, '0', 'Kambugu H/C III (Kiboga)', 6, 002, NULL, 44, NULL, 50, NULL, NULL, '754013674', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1662, 705, NULL, '0', 'Mirembe H/C III', 6, 002, NULL, 86, NULL, 116, NULL, NULL, '782893593', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1663, 380, NULL, '0', 'Lokitelebu H/C III', 6, 002, NULL, 49, NULL, 57, NULL, NULL, '753553166', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1664, 199, NULL, '0', 'Bujugu H/C III', 6, 002, NULL, 24, NULL, 28, NULL, NULL, '773262635', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1665, 279, NULL, '0', 'Bunambutye H/C III', 6, 002, NULL, 94, NULL, 44, NULL, NULL, '784959757', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1666, 398, NULL, '0', 'Ruhangire H/C II', 5, 002, NULL, 51, NULL, 58, NULL, NULL, '784305477', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1667, 253, NULL, '0', 'Bumangi H/C II', 5, 002, NULL, 33, NULL, 113, NULL, NULL, '774058432', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1668, 124, NULL, '0', 'Kisubba H/C III', 6, 002, NULL, 15, NULL, 18, NULL, NULL, '774663311', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1669, 341, NULL, '0', 'Busunga H/C II', 5, 002, NULL, 15, NULL, 52, NULL, NULL, '774204978', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1670, 995, NULL, '0', 'Opot H/C II', 5, 002, NULL, 99, NULL, 105, NULL, NULL, '782589254', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1671, 355, NULL, '0', 'Potters Villiage', 4, 002, NULL, 46, NULL, 54, NULL, NULL, '778280024', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1672, 698, NULL, '0', 'Bupoto H/c III', 6, 002, NULL, 57, NULL, 95, NULL, NULL, '700422756', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1673, 531, NULL, '0', 'Kalowang H/C III', 6, 002, NULL, 74, NULL, 78, NULL, NULL, '773123380', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1674, 698, NULL, '0', 'Kisoko H/C III (Tororo)', 6, 002, NULL, 85, NULL, 95, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1675, 56, NULL, '0', 'Agurut H/C II', 5, 002, NULL, 50, NULL, 13, NULL, NULL, '782707899', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1677, 450, NULL, '0', 'Focrev H/C III', 6, 002, NULL, 17, NULL, 67, NULL, NULL, '759501297', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1678, 244, NULL, '0', 'Kyebando H/C III', 6, 002, NULL, 43, NULL, 38, NULL, NULL, '783099516', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1679, 1181, NULL, '0', 'Katakwi COU H/C II', 5, 002, NULL, 41, NULL, 47, NULL, NULL, '775292699', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1680, 38, NULL, '0', 'Coorom H/C II(Koch)', 5, 002, NULL, 106, NULL, 10, NULL, NULL, '70754849975', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1681, 311, NULL, '0', 'Bukaya H/C II', 5, 002, NULL, 11, NULL, 48, NULL, NULL, '779357602', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1682, 478, NULL, '0', 'Nabyewanga H/C II', 5, 002, NULL, 67, NULL, 26, NULL, NULL, '705886414', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1683, 191, NULL, '0', 'Kyali H/C III', 6, 002, NULL, 67, NULL, 26, NULL, NULL, '772574390', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1684, 474, NULL, '0', 'Eremi H/C III', 6, 002, NULL, 66, NULL, 75, NULL, NULL, '782847611', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1685, 698, NULL, '0', 'Atangi H/C III', 6, 002, NULL, 85, NULL, 95, NULL, NULL, '777774206', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1686, 311, NULL, '0', 'Kingdom Life Medical Martenity H/C II', 5, 002, NULL, 11, NULL, 48, NULL, NULL, '774875341', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1687, 36, NULL, '0', 'St Francis Acumet', 1, 002, NULL, 4, NULL, 8, NULL, NULL, '784513357', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1688, 224, NULL, '0', 'Ikumba H/C III (Kabale)', 6, 002, NULL, 30, NULL, 33, NULL, NULL, '774615869', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1689, 224, NULL, '0', 'AIDS Information Centre (Kabale)', 12, 002, NULL, 30, NULL, 33, NULL, NULL, '772444687', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1690, 470, NULL, '0', 'Mityana H/C III (UMSC)', 6, 002, NULL, 64, NULL, 73, NULL, NULL, '782733697', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1691, 240, NULL, '0', 'St Francis Assisi Kitabu (Kasese)', 1, 002, NULL, 40, NULL, 37, NULL, NULL, '774171329', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1692, 224, NULL, '0', 'Mpungu H/C II (kabale)', 5, 002, NULL, 30, NULL, 33, NULL, NULL, '757696492', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1693, 478, NULL, '0', 'Bujuuko H/C III', 6, 002, NULL, 67, NULL, 26, NULL, NULL, '702024884', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1694, 478, NULL, '0', 'Sekiwunga H/C III', 6, 002, NULL, 67, NULL, 24, NULL, NULL, '782082334', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1695, 149, NULL, '0', 'Lusago H/C II', 5, 002, NULL, 90, NULL, 100, NULL, NULL, '775430480', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1696, 470, NULL, '0', 'Kikka Yokana H/C II', 5, 002, NULL, 64, NULL, 73, NULL, NULL, '782930214', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1697, 614, NULL, '0', 'Nabuli H/C III', 6, 002, NULL, 95, NULL, 82, NULL, NULL, '782816354', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1698, 478, NULL, '0', 'Butooro H/C III', 6, 002, NULL, 67, NULL, 26, NULL, NULL, '705440185', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1700, 650, NULL, '0', 'Lamezia H/C III', 6, 002, NULL, 45, NULL, 86, NULL, NULL, '701167475', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1701, 50, NULL, '0', 'Ocodri H/C III', 6, 002, NULL, 7, NULL, 11, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1702, 50, NULL, '0', 'Yinga H/C III', 6, 002, NULL, 7, NULL, 11, NULL, NULL, '772880181', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1703, 276, NULL, '0', 'Matanda H/C III', 6, 002, NULL, 38, NULL, 43, NULL, NULL, '774462544', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1704, 478, NULL, '0', 'Kampiringisa H/C III', 6, 002, NULL, 67, NULL, 26, NULL, NULL, '772877014', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1705, 239, NULL, '0', 'Muziizi H/C II', 12, 002, NULL, 43, NULL, 36, NULL, NULL, '782411884', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1706, 124, NULL, '0', 'Mantoroba H/C II', 5, 002, NULL, 15, NULL, 18, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1708, 224, NULL, '0', 'Kashasha H/C II', 5, 002, NULL, 30, NULL, 33, NULL, NULL, '773944620', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1709, 350, NULL, '0', 'Apodorwa H/C II', 5, 002, NULL, 110, NULL, 53, NULL, NULL, '773110848', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1710, 50, NULL, '0', 'Eliofe H/C III', 6, 002, NULL, 58, NULL, 11, NULL, NULL, '773227114', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1711, 86, NULL, '0', 'Butandiga H/C III', 6, 002, NULL, 83, NULL, 114, NULL, NULL, '776060892', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1712, 460, NULL, '0', 'Malukhu H/C III', 6, 002, NULL, 62, NULL, 70, NULL, NULL, '774206095', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1713, 2493, NULL, '0', 'China Uganda Friendship Hospital- Naguru', 9, 002, NULL, 35, NULL, 41, NULL, NULL, '774531882', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1714, 276, NULL, '0', 'Nyakatare H/C III', 6, 002, NULL, 38, NULL, 43, NULL, NULL, '782272867', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1715, 86, NULL, '0', 'Bunaseke H/C III', 6, 002, NULL, 83, NULL, 114, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1716, 1081, NULL, '0', 'Alangi H/C III', 6, 002, NULL, 108, NULL, 78, NULL, NULL, '783463883', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1717, 276, NULL, '0', 'Mpungu H/C III (Kanungu)', 6, 002, NULL, 38, NULL, 43, NULL, NULL, '702660347', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1718, 53, NULL, '0', 'Labongogali H/C III', 5, 002, NULL, 5, NULL, 12, NULL, NULL, '783210962', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1719, 614, NULL, '0', 'Kagumu H/C III', 6, 002, NULL, 95, NULL, 82, NULL, NULL, '755547746', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1720, 478, NULL, '0', 'Ggoli H/C III (Mpigi)', 6, 002, NULL, 67, NULL, 26, NULL, NULL, '0702103042', NULL, '', 'Ngobya Ibrahim', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1722, 276, NULL, '0', 'Nyamirama H/C III', 6, 002, NULL, 38, NULL, 43, NULL, NULL, '774267549', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1723, 2493, NULL, '0', 'Senta Medicare', 12, 002, NULL, 86, NULL, 41, NULL, NULL, '703124393', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1724, 224, NULL, '0', 'Mukongo H/C III', 6, 002, NULL, 30, NULL, 33, NULL, NULL, '784044473', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1725, 629, NULL, '0', 'St Bernards Mannya H/C III', 6, 002, NULL, 80, NULL, 83, NULL, NULL, '751849102', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1726, 558, NULL, '0', 'Rwengiri  H/C III', 6, 002, NULL, 81, NULL, 81, NULL, NULL, '777402097', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1727, 187, NULL, '0', 'Ageteraine Nursing Home', 12, 002, NULL, 31, NULL, 25, NULL, NULL, '758712279', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1728, 121, NULL, '0', 'Bugoigo H/C II', 5, 002, NULL, 14, NULL, 16, NULL, NULL, '752386114', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1729, 204, NULL, '0', 'Ibulanku H/C III', 6, 002, NULL, 26, NULL, 29, NULL, NULL, '784464139', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1732, 2493, NULL, '0', 'Ebenezer Clinical Laboratory', 12, 002, NULL, 35, NULL, 41, NULL, NULL, '7752324676', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1733, 705, NULL, '0', 'Wattuba H/C III', 6, 002, NULL, 86, NULL, 116, NULL, NULL, '782417949', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1734, 276, NULL, '0', 'Katete H/C III', 6, 002, NULL, 38, NULL, 43, NULL, NULL, '775141825', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1735, 544, NULL, '0', 'Enganju H/C II', 5, 002, NULL, 109, NULL, 80, NULL, NULL, '784835251', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1736, 650, NULL, '0', 'Rurambiira H/C II', 5, 002, NULL, 45, NULL, 86, NULL, NULL, '773832248', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1737, 489, NULL, '0', 'Kyetume H/C III (Mukono)', 6, 002, NULL, 69, NULL, 98, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1738, 433, NULL, '0', 'Kyetume H/C III (Lwengo)', 6, 002, NULL, 92, NULL, 115, NULL, NULL, '772885521', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1739, 224, NULL, '0', 'Kijurera H/C II', 5, 002, NULL, 30, NULL, 33, NULL, NULL, '777858417', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1740, 551, NULL, '0', 'Kikolimbo H/C III', 6, 002, NULL, 91, NULL, 106, NULL, NULL, '772434967', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1741, 10, NULL, '0', 'Kureku H/C II', 5, 002, NULL, 2, NULL, 6, NULL, NULL, '772994554', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1742, 341, NULL, '0', 'Kyanya H/C III', 6, 002, NULL, 40, NULL, 52, NULL, NULL, '784554057', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1743, 311, NULL, '0', 'Health Initiatives Association', 12, 002, NULL, 11, NULL, 48, NULL, NULL, '775285123', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1744, 451, NULL, '0', 'Masaka Prision H/C III', 6, 002, NULL, 59, NULL, 68, NULL, NULL, '782034476', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1745, 253, NULL, '0', 'SIAAP Bugoma Clinic', 3, 002, NULL, 33, NULL, 113, NULL, NULL, '784869599', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1746, 650, NULL, '0', 'Kitura H/C III', 6, 002, NULL, 45, NULL, 86, NULL, NULL, '753117169', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1747, 470, NULL, '0', 'Buyambi H/C II- (st Noa) Mityana', 5, 002, NULL, 64, NULL, 73, NULL, NULL, '785428891', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1748, 705, NULL, '0', 'Taqwa H/C III', 6, 002, NULL, 86, NULL, 116, NULL, NULL, '772019587', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1749, 451, NULL, '0', 'Masaka Police Clinic', 12, 002, NULL, 59, NULL, 68, NULL, NULL, '752337301', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1750, 313, NULL, '0', 'Noahs Ark Family Clinic', 12, 002, NULL, 69, NULL, 49, NULL, NULL, '773783853', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1751, 2493, NULL, '0', 'Ggwatiro Hospital', 9, 002, NULL, 86, NULL, 41, NULL, NULL, '700876045', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1752, 705, NULL, '0', 'Uganda Martyrs Hospital (Namugongo)', 12, 002, NULL, 86, NULL, 116, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1753, 56, NULL, '0', 'Kachumbala Mission Dispensary', 12, 002, NULL, 12, NULL, 13, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1754, 434, NULL, '0', 'St Francis Mbiriizi H/C III', 3, 002, NULL, 92, NULL, 64, NULL, NULL, '773837749', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1755, 639, NULL, '0', 'Katunguru H/C III(Rubirizi)', 6, 002, NULL, 113, NULL, 84, NULL, NULL, '772959793', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1756, 53, NULL, '0', 'Pacilo H/C II', 5, 002, NULL, 5, NULL, 12, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1757, 433, NULL, '0', 'Mbirizi Moslem H/C III', 6, 002, NULL, 92, NULL, 115, NULL, NULL, '772914091', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1758, 659, NULL, '0', 'Kyeirumba H/C III', 6, 002, NULL, 27, NULL, 87, NULL, NULL, '779664167', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1759, 788, NULL, '0', 'Bweyogerere H/C III Muslim', 6, 002, NULL, 86, NULL, 24, NULL, NULL, '782800415', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1760, 788, NULL, '0', 'St Apollo H/C III-Namasuba', 6, 002, NULL, 86, NULL, 24, NULL, NULL, '779299952', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1761, 614, NULL, '0', 'Kasodo H/C III', 6, 002, NULL, 79, NULL, 82, NULL, NULL, '774020719', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1762, 712, NULL, '0', 'Barakala H/C III', 5, 002, NULL, 87, NULL, 96, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1763, 313, NULL, '0', 'Nkata H/C II', 5, 002, NULL, 19, NULL, 49, NULL, NULL, '774793344', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1764, 195, NULL, '0', 'Lacor H/C III (Pabbo)', 6, 002, NULL, 5, NULL, 27, NULL, NULL, '774210582', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1765, 788, NULL, '0', 'Lufuka Valley Health Centre III', 6, 002, NULL, 86, NULL, 24, NULL, NULL, '783503664', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1766, 2493, NULL, '0', 'Meeting Point Kampala', 12, 002, NULL, 35, NULL, 41, NULL, NULL, '774666799', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1767, 705, NULL, '0', 'Nalugala H/C II', 5, 002, NULL, 86, NULL, 116, NULL, NULL, '782728437', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1768, 629, NULL, '0', 'Mitukula H/C III', 6, 002, NULL, 80, NULL, 83, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1769, 433, NULL, '0', 'Kyamaganda HCIII', 6, 002, NULL, 92, NULL, 115, NULL, NULL, '705341280', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1770, 224, NULL, '0', 'Kagunga H/C II', 5, 002, NULL, 30, NULL, 33, NULL, NULL, '702545987', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1771, 631, NULL, '0', 'Olujobo H/C III', 6, 002, NULL, 7, NULL, 11, NULL, NULL, '774611242', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', '');
INSERT INTO `facility` (`id`, `parentid`, `ipid`, `code`, `name`, `facilitylevelid`, `type`, `isactive`, `districtid`, `regionid`, `hubid`, `healthregionid`, `hubname`, `phonenumber`, `distancefromhub`, `email`, `contactperson`, `address`, `returnaddress`, `longitude`, `latitude`, `created_at`, `updated_at`, `createdby`) VALUES
(1772, 470, NULL, '0', 'Namutamba H/C III  COU  (Mityana)', 6, 002, NULL, 64, NULL, 73, NULL, NULL, '774077961', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1773, 276, NULL, '0', 'Nyamwegabira H/C III', 6, 002, NULL, 38, NULL, 43, NULL, NULL, '777470702', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1774, 276, NULL, '0', 'Kayonza H/C III (Kanungu)', 6, 002, NULL, 38, NULL, 43, NULL, NULL, '775148855', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1775, 204, NULL, '0', 'Kasambiika H/C II', 5, 002, NULL, 26, NULL, 29, NULL, NULL, '775444602', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1776, 36, NULL, '0', 'Morungatuny H/C III', 6, 002, NULL, 4, NULL, 8, NULL, NULL, '778767472', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1777, 53, NULL, '0', 'Lacor H/C III (Amuru)', 6, 002, NULL, 5, NULL, 12, NULL, NULL, '774210582', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1779, 650, NULL, '0', 'Lake Mburo H/C III', 6, 002, NULL, 45, NULL, 86, NULL, NULL, '772057442', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1780, 639, NULL, '0', 'Kishenyi H/C II (Rubirizi)', 5, 002, NULL, 113, NULL, 84, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1781, 788, NULL, '0', 'Foyer H/C III', 6, 002, NULL, 86, NULL, 24, NULL, NULL, '780675172', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1782, 433, NULL, '0', 'Nkoni Health Center III', 6, 002, NULL, 92, NULL, 115, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1783, 439, NULL, '0', 'Anaka H/C II', 5, 002, NULL, 53, NULL, 65, NULL, NULL, '787067014', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1784, 788, NULL, '0', 'Zzinga H/C II', 5, 002, NULL, 86, NULL, 24, NULL, NULL, '703351413', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1785, 629, NULL, '0', 'Lwakaloolo H/C II', 5, 002, NULL, 80, NULL, 83, NULL, NULL, '774880730', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1786, 629, NULL, '0', 'Kibuuka H/C II', 5, 002, NULL, 80, NULL, 83, NULL, NULL, '774880730', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1787, 629, NULL, '0', 'Butiti H/C II (Rakai)', 5, 002, NULL, 80, NULL, 83, NULL, NULL, '774880730', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1788, 705, NULL, '0', 'Zia Angelina ', 3, 002, NULL, 86, NULL, 116, NULL, NULL, '776265920', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1789, 10, NULL, '0', 'Dzaipi H/C III', 6, 002, NULL, 2, NULL, 6, NULL, NULL, '782461487', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1790, 224, NULL, '0', 'Bigungiro H/C II', 5, 002, NULL, 30, NULL, 33, NULL, NULL, '772831913', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1791, 558, NULL, '0', 'Rusheshe H/C III', 6, 002, NULL, 81, NULL, 81, NULL, NULL, '772703519', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1792, 224, NULL, '0', 'Kihefo H/C III', 6, 002, NULL, 30, NULL, 33, NULL, NULL, '777228884', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1793, 480, NULL, '0', 'Kabbo H/C II', 5, 002, NULL, 68, NULL, 76, NULL, NULL, '784797776', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1794, 355, NULL, '0', 'Gateriteri H/C III', 6, 002, NULL, 46, NULL, 54, NULL, NULL, '773035758', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1795, 474, NULL, '0', 'Aliba H/C III', 6, 002, NULL, 66, NULL, 75, NULL, NULL, '775800996', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1796, 469, NULL, '0', 'Mutara H/C III', 6, 002, NULL, 111, NULL, 72, NULL, NULL, '772665593', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1797, 478, NULL, '0', 'Kituntu H/C III', 6, 002, NULL, 67, NULL, 26, NULL, NULL, '782057880', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1798, 460, NULL, '0', 'Siira H/C III', 1, 002, NULL, 62, NULL, 70, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1799, 629, NULL, '0', 'Ssanje Domiciliary Clinic', 12, 002, NULL, 80, NULL, 83, NULL, NULL, '782407878', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1800, 279, NULL, '0', 'Kapkoloswo H/C III', 6, 002, NULL, 13, NULL, 44, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1801, 398, NULL, '0', 'Bugogo H/C III', 6, 002, NULL, 51, NULL, 58, NULL, NULL, '774445143', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1803, 558, NULL, '0', 'Buhandagazi H/C II', 5, 002, NULL, 81, NULL, 81, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1804, 2493, NULL, '0', 'St Stephens Hospital (Mpererwe)', 12, 002, NULL, 35, NULL, 41, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1805, 669, NULL, '0', 'Kyabi H/C III', 6, 002, NULL, 82, NULL, 93, NULL, NULL, '783978800', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1806, 160, NULL, '0', 'Haama H/C II', 5, 002, NULL, 98, NULL, 21, NULL, NULL, '752468355', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1807, 469, NULL, '0', 'Rwoburunga H/C III', 6, 002, NULL, 111, NULL, 72, NULL, NULL, '706219414', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1808, 659, NULL, '0', 'Kakoma H/C III', 6, 002, NULL, 27, NULL, 87, NULL, NULL, '7013262560', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1809, 279, NULL, '0', 'Buginyanya H/C III (Bulambuli)', 6, 002, NULL, 94, NULL, 44, NULL, NULL, '778803541', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1810, 788, NULL, '0', 'Doctors Hospital Sseguku', 12, 002, NULL, 86, NULL, 24, NULL, NULL, '705555117', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1811, 712, NULL, '0', 'Apo H/C II', 5, 002, NULL, 87, NULL, 96, NULL, NULL, '756579825', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1812, 56, NULL, '0', 'St Martha Maternity Home- Bukedea', 12, 002, NULL, 12, NULL, 13, NULL, NULL, '784112232', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1813, 244, NULL, '0', 'Nalweyo H/C III', 6, 002, NULL, 43, NULL, 38, NULL, NULL, '784737753', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1814, 358, NULL, '0', 'Hope Medical Centre (AMG)(Sheema)', 1, 002, NULL, 114, NULL, 55, NULL, NULL, '704143612', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1815, 149, NULL, '0', 'Mukwano Medical Services Ltd', 12, 002, NULL, 90, NULL, 100, NULL, NULL, '774131371', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1816, 644, NULL, '0', 'Bihanga Army H/C II', 5, 002, NULL, 25, NULL, 85, NULL, NULL, '777656664', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1817, 276, NULL, '0', 'Makiro H/C III', 6, 002, NULL, 38, NULL, 43, NULL, NULL, '775018551', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1818, 244, NULL, '0', 'Igayaza H/C II', 6, 002, NULL, 43, NULL, 38, NULL, NULL, '772366801', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1819, 99, NULL, '0', 'Maziriga H/C II', 5, 002, NULL, 10, NULL, 15, NULL, NULL, '783288025', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1820, 224, NULL, '0', 'Kibanda H/C II (Kabale)', 5, 002, NULL, 30, NULL, 33, NULL, NULL, '774481008', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1821, 355, NULL, '0', 'Nyakinama H/C III', 6, 002, NULL, 46, NULL, 54, NULL, NULL, '777787410', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1822, 558, NULL, '0', 'Burama H/C II', 5, 002, NULL, 81, NULL, 81, NULL, NULL, '774435011', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1823, 650, NULL, '0', 'Busingye Maternity Home', 12, 002, NULL, 45, NULL, 86, NULL, NULL, '714404180', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1824, 144, NULL, '0', 'Mulagi H/C III', 6, 002, NULL, 18, NULL, 20, NULL, NULL, '783015770', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1825, 325, NULL, '0', 'Bukungu H/C II', 5, 002, NULL, 20, NULL, 51, NULL, NULL, '779820224', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1826, 2493, NULL, '0', 'Bukalasi H/C III', 6, 002, NULL, 9, NULL, 41, NULL, NULL, '785338944', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1827, 355, NULL, '0', 'Rutaka H/C III', 6, 002, NULL, 46, NULL, 54, NULL, NULL, '774215237', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1828, 358, NULL, '0', 'Kihunda H/C III', 6, 002, NULL, 114, NULL, 55, NULL, NULL, '773947343', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1829, 149, NULL, '0', 'Well Springs Medical  Center Kamutuuza', 3, 002, NULL, 90, NULL, 100, NULL, NULL, '779212047', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1830, 240, NULL, '0', 'Kitholhu H/C III', 6, 002, NULL, 40, NULL, 37, NULL, NULL, '782835901', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1831, 212, NULL, '0', 'St Lucia Kagamba H/C III', 6, 002, NULL, 75, NULL, 30, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1832, 224, NULL, '0', 'Kitojo H/C II', 5, 002, NULL, 30, NULL, 33, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1833, 311, NULL, '0', 'Kasubi H/C III', 6, 002, NULL, 11, NULL, 48, NULL, NULL, '772499744', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1834, 160, NULL, '0', 'Bugaana H/C II', 5, 002, NULL, 98, NULL, 21, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1835, 227, NULL, '0', 'Aliwa H/C III', 6, 002, NULL, 32, NULL, 34, NULL, NULL, '753899895', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1836, 224, NULL, '0', 'Kandago H/C II', 5, 002, NULL, 30, NULL, 33, NULL, NULL, '775492120', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1837, 160, NULL, '0', 'Buyombo H/C II', 5, 002, NULL, 98, NULL, 21, NULL, NULL, '758724496', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1838, 212, NULL, '0', 'Butare H/C III (Ntungamo )', 6, 002, NULL, 75, NULL, 30, NULL, NULL, '782343589', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1839, 187, NULL, '0', 'Kiguma H/C II', 5, 002, NULL, 31, NULL, 25, NULL, NULL, '704416299', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1840, 187, NULL, '0', 'FortPortal Prisons H/C III', 6, 002, NULL, 31, NULL, 25, NULL, NULL, '716162250', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1841, 995, NULL, '0', 'St Anthony H/C II', 5, 002, NULL, 99, NULL, 105, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1842, 674, NULL, '0', 'St Francis H/C III (Soroti)', 6, 002, NULL, 84, NULL, 92, NULL, NULL, '779950833', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1843, 355, NULL, '0', 'Nyabihuniko H/C III', 6, 002, NULL, 46, NULL, 54, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1844, 224, NULL, '0', 'Kigazi H/C II', 5, 002, NULL, 30, NULL, 33, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1845, 86, NULL, '0', 'Bulujewa H/C III', 6, 002, NULL, 83, NULL, 114, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1846, 86, NULL, '0', 'Bumulisha H/C III', 6, 002, NULL, 83, NULL, 114, NULL, NULL, '772908937', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1847, 224, NULL, '0', 'Rwanjura H/C II', 5, 002, NULL, 30, NULL, 33, NULL, NULL, '773261609', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1848, 558, NULL, '0', 'Bikurungu H/C III', 6, 002, NULL, 81, NULL, 81, NULL, NULL, '774954846', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1849, 659, NULL, '0', 'Kirumba H/C III (Isingiro)', 6, 002, NULL, 27, NULL, 87, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1850, 629, NULL, '0', 'Bikiira H/C III', 6, 002, NULL, 80, NULL, 83, NULL, NULL, '704247985', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1852, 187, NULL, '0', 'Rubona H/C II', 5, 002, NULL, 31, NULL, 25, NULL, NULL, '772912839', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1853, 187, NULL, '0', 'Mucwa H/C II', 5, 002, NULL, 31, NULL, 25, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1854, 224, NULL, '0', 'Kiyebe H/C III', 6, 002, NULL, 30, NULL, 33, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1855, 86, NULL, '0', 'Bulwala H/C III', 6, 002, NULL, 83, NULL, 114, NULL, NULL, '783229204', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1856, 460, NULL, '0', 'Joy Medical Center (Mbale  )', 1, 002, NULL, 62, NULL, 70, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1857, 50, NULL, '0', 'Riki H/C III', 6, 002, NULL, 7, NULL, 11, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1858, 50, NULL, '0', 'TBOROKOLONGO H/C III', 6, 002, NULL, 48, NULL, 11, NULL, NULL, '794928830', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1859, 211, NULL, '0', 'Ruti H/C', 5, 002, NULL, 63, NULL, 71, NULL, NULL, '785000862', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1861, 10, NULL, '0', 'Adjumani Mission H/C III', 6, 002, NULL, 2, NULL, 6, NULL, NULL, '791919994', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1863, 460, NULL, '0', 'Mbale Main Prisons H/C III', 6, 002, NULL, 62, NULL, 70, NULL, NULL, '782006378', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1864, 227, NULL, '0', 'Kakure H/C II', 5, 002, NULL, 32, NULL, 34, NULL, NULL, '779470907', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1865, 474, NULL, '0', 'Itula H/C III', 6, 002, NULL, 66, NULL, 75, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1866, 1181, NULL, '0', 'Aliakamer H/C II', 5, 002, NULL, 41, NULL, 47, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1867, 629, NULL, '0', 'Lwembajjo H/C III', 1, 002, NULL, 80, NULL, 83, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1868, 253, NULL, '0', 'Kachanga H/C II', 5, 002, NULL, 33, NULL, 113, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1869, 253, NULL, '0', 'Jaana H/C II', 5, 002, NULL, 33, NULL, 113, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1870, 224, NULL, '0', 'Kahondo H/C II', 5, 002, NULL, 30, NULL, 33, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1871, 224, NULL, '0', 'Nyarurambi H/C II', 5, 002, NULL, 30, NULL, 33, NULL, NULL, '782368976', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1872, 614, NULL, '0', 'Kabwangasi H/C III', 6, 002, NULL, 79, NULL, 82, NULL, NULL, '777527725', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1873, 558, NULL, '0', 'ST Andrew H/C III (Nyarushanje)', 1, 002, NULL, 81, NULL, 81, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1874, 698, NULL, '0', 'Lwanjusi H/C III', 6, 002, NULL, 57, NULL, 95, NULL, NULL, '778137347', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1875, 160, NULL, '0', 'Bukimbi H/C II', 5, 002, NULL, 98, NULL, 21, NULL, NULL, '751164212', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1876, 160, NULL, '0', 'Isinde H/C II', 5, 002, NULL, 98, NULL, 21, NULL, NULL, '782904532', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1877, 160, NULL, '0', 'Bugali H/C II', 5, 002, NULL, 98, NULL, 21, NULL, NULL, '755451976', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1878, 224, NULL, '0', 'Kakore H/C II', 5, 002, NULL, 30, NULL, 33, NULL, NULL, '702552506', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1879, 160, NULL, '0', 'Dohwe H/C II', 5, 002, NULL, 98, NULL, 21, NULL, NULL, '782229255', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1880, 696, NULL, '0', 'Karinga H/CI II', 5, 002, NULL, 70, NULL, 94, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1881, 460, NULL, '0', 'Tajar H/C II', 5, 002, NULL, 12, NULL, 70, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1882, 224, NULL, '0', 'Nangara H/C II', 5, 002, NULL, 30, NULL, 33, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1883, 374, NULL, '0', 'Gborokolongo H/C III', 6, 002, NULL, 48, NULL, 11, NULL, NULL, '774928830', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1884, 2493, NULL, '0', 'Namugongo Fund For Special Children', 3, 002, NULL, 86, NULL, 41, NULL, NULL, '775019662', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1885, 358, NULL, '0', 'AMG Bugongi- Hope Medical Center', 1, 002, NULL, 114, NULL, 55, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1886, 670, NULL, '0', 'ST Martins H/C III ( AMAKIO)', 6, 002, NULL, 100, NULL, 90, NULL, NULL, '776252599', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1887, 698, NULL, '0', 'Kisoko H/C III', 6, 002, NULL, 85, NULL, 95, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1888, 434, NULL, '0', 'St Elizabeth H/C III KIJJUKIZO', 6, 002, NULL, 56, NULL, 64, NULL, NULL, '705857074', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1889, 614, NULL, '0', 'Kirika H/C III', 6, 002, NULL, 95, NULL, 82, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1890, 705, NULL, '0', 'St Francis Of Assis Naddangira H/C III', 6, 002, NULL, 86, NULL, 116, NULL, NULL, '781009076', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1891, 450, NULL, '0', 'Nabulola CMC H/C III', 6, 002, NULL, 17, NULL, 67, NULL, NULL, '779346042', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1893, 320, NULL, '0', 'Kyanamuyojo H/C III', 6, 002, NULL, 44, NULL, 50, NULL, NULL, '772354507', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1894, 240, NULL, '0', 'Kahokya H/C II', 5, 002, NULL, 40, NULL, 37, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1895, 614, NULL, '0', 'Community H/C (Kibuku)', 1, 002, NULL, 95, NULL, 82, NULL, NULL, '777849590', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1896, 149, NULL, '0', 'Theresa Ledochow H/C II', 5, 002, NULL, 90, NULL, 100, NULL, NULL, '782375510', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1897, 279, NULL, '0', 'Gamogo H/C III', 6, 002, NULL, 39, NULL, 44, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1898, 53, NULL, '0', 'Otwee H/C III', 6, 002, NULL, 5, NULL, 12, NULL, NULL, '774397446', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1899, 325, NULL, '0', 'Kagulu H/C II', 5, 002, NULL, 20, NULL, 51, NULL, NULL, '750885814', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1900, 224, NULL, '0', 'Nyakasharara H/C II (Kabale)', 5, 002, NULL, 30, NULL, 33, NULL, NULL, '775664930', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1901, 222, NULL, '0', 'Gadafi H/C III', 6, 002, NULL, 28, NULL, 31, NULL, NULL, '782154269', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1902, 137, NULL, '0', 'Ryeishe H/C III', 6, 002, NULL, 16, NULL, 19, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1903, 137, NULL, '0', 'Burungira H/C II', 5, 002, NULL, 16, NULL, 19, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1904, 137, NULL, '0', 'SWAZI H/C III', 5, 002, NULL, 16, NULL, 19, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1905, 1905, 1, '0', 'Rugazi Mission H/C II', 1, 002, NULL, 113, NULL, 84, NULL, NULL, '', NULL, '', '', NULL, '', NULL, NULL, '2017-10-15 16:14:16', '2017-11-01 12:42:10', ''),
(1906, 639, NULL, '0', 'Rutoto SDA H/C  11', 5, 002, NULL, 113, NULL, 84, NULL, NULL, '703316413', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1907, 544, NULL, '0', 'Tumu Hospital', 1, 002, NULL, 109, NULL, 80, NULL, NULL, '759271751', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1908, 650, NULL, '0', 'Kibuza ', 1, 002, NULL, 45, NULL, 86, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1909, 650, NULL, '0', 'Mbaba Community', 1, 002, NULL, 45, NULL, 86, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1910, 276, NULL, '0', 'Kinaba H/C III', 6, 002, NULL, 38, NULL, 43, NULL, NULL, '757225160', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1911, 276, NULL, '0', 'Nyakinoni H/C', 1, 002, NULL, 38, NULL, 43, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1912, 276, NULL, '0', 'Nyakashozi H/C', 1, 002, NULL, 38, NULL, 43, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1913, 276, NULL, '0', 'Kayonza Tea Factory', 1, 002, NULL, 38, NULL, 43, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1914, 276, NULL, '0', 'Butogota HC', 1, 002, NULL, 38, NULL, 43, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1915, 276, NULL, '0', 'Kanyantorogo HC', 1, 002, NULL, 38, NULL, 43, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1916, 558, NULL, '0', 'Nyakisenyi PNFP ', 1, 002, NULL, 81, NULL, 81, NULL, NULL, '782856340', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1917, 355, NULL, '0', 'Nteko H/C III', 6, 002, NULL, 46, NULL, 54, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1918, 355, NULL, '0', 'Kagezi H/C III', 6, 002, NULL, 46, NULL, 54, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1919, 355, NULL, '0', 'Nyakabande H/C II', 5, 002, NULL, 46, NULL, 54, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1920, 2493, NULL, '0', 'Bufuma H/C III', 6, 002, NULL, 9, NULL, 41, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1921, 659, NULL, '0', 'Kemubeizi H/c', 1, 002, NULL, 27, NULL, 87, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1922, 659, NULL, '0', 'Ruborogota H/C III', 6, 002, NULL, 27, NULL, 87, NULL, NULL, '7742880529', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1923, 279, NULL, '0', 'Bumasobo H/c Iii', 6, 002, NULL, 94, NULL, 44, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1924, 698, NULL, '0', 'Nyondo Hc Iii', 6, 002, NULL, 57, NULL, 95, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1925, 1181, NULL, '0', 'Okocho H/C II', 5, 002, NULL, 41, NULL, 47, NULL, NULL, '754782711', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1926, 531, NULL, '0', 'Jupanziri H/C III', 6, 002, NULL, 74, NULL, 78, NULL, NULL, '782692583', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1927, 311, NULL, '0', 'Kalagala H/C II', 5, 002, NULL, 11, NULL, 48, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1928, 311, NULL, '0', 'Naminya H/C II', 5, 002, NULL, 11, NULL, 48, NULL, NULL, '787037823', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1929, 311, NULL, '0', 'Nile Breweries H/C II', 5, 002, NULL, 11, NULL, 48, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1930, 311, NULL, '0', 'Buziika H/C II', 5, 002, NULL, 11, NULL, 48, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1931, 311, NULL, '0', 'Bugungu H/C III', 6, 002, NULL, 11, NULL, 48, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1933, 311, NULL, '0', 'Kazibz H/C II', 5, 002, NULL, 86, NULL, 48, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1937, 311, NULL, '0', 'Kasimba Muslim H/C II', 1, 002, NULL, 86, NULL, 48, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1938, 311, NULL, '0', 'Kizigo H/C II', 5, 002, NULL, 11, NULL, 48, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1939, 311, NULL, '0', 'Senyi H/C II', 5, 002, NULL, 11, NULL, 48, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1940, 311, NULL, '0', 'Namulesa H/C II', 5, 002, NULL, 11, NULL, 48, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1941, 311, NULL, '0', 'Living Water H/C', 5, 002, NULL, 11, NULL, 48, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1942, 311, NULL, '0', 'Bubiro H/C II', 5, 002, NULL, 11, NULL, 48, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1943, 788, NULL, '0', 'St.Joseph\'s Buyege H/C III', 6, 002, NULL, 86, NULL, 24, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1944, 788, NULL, '0', 'Lweza H/C III (NGO)', 6, 002, NULL, 86, NULL, 24, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1946, 788, NULL, '0', 'Nyanama Domicially', 1, 002, NULL, 86, NULL, 24, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1947, 788, NULL, '0', 'Nabbingo H/C III', 6, 002, NULL, 86, NULL, 24, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1948, 788, NULL, '0', 'Katende H/C ', 1, 002, NULL, 86, NULL, 24, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1949, 788, NULL, '0', 'Busesebba H/C III', 6, 002, NULL, 86, NULL, 24, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1950, 788, NULL, '0', 'Busambala H/C III ', 6, 002, NULL, 86, NULL, 24, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1951, 788, NULL, '0', 'Emmanuel Medical Centre', 1, 002, NULL, 86, NULL, 24, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1952, 191, NULL, '0', 'Muduuma H/C II', 5, 002, NULL, 67, NULL, 26, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1953, 191, NULL, '0', 'Rapha H/C', 1, 002, NULL, 67, NULL, 26, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1954, 191, NULL, '0', 'Kilokola H/C II', 5, 002, NULL, 88, NULL, 26, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1955, 191, NULL, '0', 'Kibanga H/C III (St Elisabeth of thuringen ) ', 6, 002, NULL, 67, NULL, 26, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1956, 191, NULL, '0', 'Kabasanda H/C II', 5, 002, NULL, 88, NULL, 26, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1957, 191, NULL, '0', 'Mpigi Police', 1, 002, NULL, 67, NULL, 26, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1958, 191, NULL, '0', 'Kibigga', 1, 002, NULL, 88, NULL, 26, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1959, 191, NULL, '0', 'Bugobango H/C', 1, 002, NULL, 88, NULL, 26, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1960, 191, NULL, '0', 'Kiddawalime ', 1, 002, NULL, 88, NULL, 26, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1961, 191, NULL, '0', 'Rapha NGO', 1, 002, NULL, 88, NULL, 26, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1962, 191, NULL, '0', 'Ngomanene ', 1, 002, NULL, 89, NULL, 26, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1963, 191, NULL, '0', 'Ngelibalya H/C II', 1, 002, NULL, 88, NULL, 26, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1964, 705, NULL, '0', 'Ngomanene H/C III', 5, 002, NULL, 88, NULL, 116, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1965, 191, NULL, '0', 'Kanzire H/C III', 5, 002, NULL, 88, NULL, 26, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1966, 222, NULL, '0', 'Jinja Police H/C III (Maternity)', 6, 002, NULL, 28, NULL, 31, NULL, NULL, '701156403', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1967, 313, NULL, '0', 'Kiyindi Landing Site', 1, 002, NULL, 69, NULL, 49, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1968, 313, NULL, '0', 'Royal Zan Vanten', 5, 002, NULL, 69, NULL, 49, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1969, 313, NULL, '0', 'KIgogola H/C II', 5, 002, NULL, 69, NULL, 49, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1970, 313, NULL, '0', 'Seeta-Kasawo H/C II', 5, 002, NULL, 69, NULL, 49, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1971, 313, NULL, '0', 'Seeta-Namuganga', 6, 002, NULL, 42, NULL, 49, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1972, 4, NULL, '0', 'Opopong H/C II', 5, 002, NULL, 1, NULL, 5, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1973, 4, NULL, '0', 'Oretha H/C II', 5, 002, NULL, 1, NULL, 5, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1974, 4, NULL, '0', 'Pupukanya H/C II', 5, 002, NULL, 1, NULL, 5, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1975, 4, NULL, '0', 'Obokolome H/C II', 5, 002, NULL, 1, NULL, 5, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1976, 4, NULL, '0', 'Katabok H/C II', 5, 002, NULL, 1, NULL, 5, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1977, 4, NULL, '0', 'Kiru H/C II', 5, 002, NULL, 1, NULL, 5, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1978, 4, NULL, '0', 'Adea H/C II', 5, 002, NULL, 1, NULL, 5, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1979, 4, NULL, '0', 'Gagming H/C II', 5, 002, NULL, 1, NULL, 5, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1980, 4, NULL, '0', 'Awach H/C II', 5, 002, NULL, 1, NULL, 5, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1981, 4, NULL, '0', 'Anita H/C II', 5, 002, NULL, 1, NULL, 5, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1982, 4, NULL, '0', 'Kamu H/C II', 5, 002, NULL, 1, NULL, 5, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1983, 4, NULL, '0', 'Atunga H/C II ', 5, 002, NULL, 1, NULL, 5, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1984, 4, NULL, '0', 'Wilala H/C II', 5, 002, NULL, 1, NULL, 5, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1985, 4, NULL, '0', 'Koya H/C II', 5, 002, NULL, 1, NULL, 5, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1987, 788, NULL, '0', 'Masajja H/C III', 6, 002, NULL, 86, NULL, 24, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1988, 788, NULL, '0', 'Kitooro H/C II (Private)', 5, 002, NULL, 86, NULL, 24, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1991, 191, NULL, '0', 'Kibugga H/C III', 6, 002, NULL, 67, NULL, 26, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1992, 788, NULL, '0', 'Kkonge H/C II', 5, 002, NULL, 67, NULL, 24, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1993, 696, NULL, '0', 'Nanyonia Angikalio H/C III', 6, 002, NULL, 70, NULL, 94, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1994, 696, NULL, '0', 'Moruita H/C III', 6, 002, NULL, 70, NULL, 94, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1995, 696, NULL, '0', 'Alakas H/C II', 5, 002, NULL, 70, NULL, 94, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1996, 696, NULL, '0', 'Natirae H/C II', 5, 002, NULL, 70, NULL, 94, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1997, 696, NULL, '0', 'Nakaale H/C II', 5, 002, NULL, 70, NULL, 94, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1998, 696, NULL, '0', 'Nabulenger H/C II', 5, 002, NULL, 70, NULL, 94, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(1999, 696, NULL, '0', 'Namalu Prison H/C II', 5, 002, NULL, 70, NULL, 94, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2000, 696, NULL, '0', 'St Mathias Amaler H/C III', 6, 002, NULL, 70, NULL, 94, NULL, NULL, '778926667', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2001, 227, NULL, '0', 'Apapai H/C II', 5, 002, NULL, 32, NULL, 34, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2002, 311, NULL, '0', 'Nakibizzi H/C II', 5, 002, NULL, 11, NULL, 48, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2003, 311, NULL, '0', 'Kisimbi Muslim H/C II', 5, 002, NULL, 11, NULL, 48, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2004, 311, NULL, '0', 'Dungi H/C II', 5, 002, NULL, 11, NULL, 48, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2006, 380, NULL, '0', 'Lookorok H/C II', 6, 002, NULL, 49, NULL, 57, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2007, 380, NULL, '0', 'Brigade H/C II', 5, 002, NULL, 49, NULL, 57, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2008, 380, NULL, '0', 'Napumpum H/C II', 5, 002, NULL, 49, NULL, 57, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2009, 380, NULL, '0', 'Nakwakwa', 5, 002, NULL, 49, NULL, 57, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2010, 380, NULL, '0', 'Losilang H/C II', 5, 002, NULL, 49, NULL, 57, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2011, 223, NULL, '0', 'Lobalangit H/C II', 5, 002, NULL, 29, NULL, 32, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2012, 4, NULL, '0', 'Moulem H/C II', 5, 002, NULL, 1, NULL, 5, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2014, 223, NULL, '0', 'Pire H/C II', 5, 002, NULL, 29, NULL, 32, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2015, 223, NULL, '0', 'Lokori H/C II', 5, 002, NULL, 29, NULL, 32, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2016, 223, NULL, '0', 'Kopoth H/C II', 5, 002, NULL, 29, NULL, 32, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2017, 223, NULL, '0', 'Lochom H/C II', 5, 002, NULL, 29, NULL, 32, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2018, 223, NULL, '0', 'Kakamar H/C II', 5, 002, NULL, 29, NULL, 32, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2019, 223, NULL, '0', 'Kocholo H/C II', 5, 002, NULL, 29, NULL, 32, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2020, 223, NULL, '0', 'St Jude (Kidepo) H/C II', 5, 002, NULL, 29, NULL, 32, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2021, 223, NULL, '0', 'Kamion H/C II', 5, 002, NULL, 29, NULL, 32, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2022, 223, NULL, '0', 'Lokwakalamoe H/C II', 5, 002, NULL, 29, NULL, 32, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2023, 223, NULL, '0', 'Loyoro H/C II', 5, 002, NULL, 29, NULL, 32, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2024, 223, NULL, '0', 'Lokanayona H/C II', 5, 002, NULL, 29, NULL, 32, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2025, 223, NULL, '0', 'Kidepo H/C II', 5, 002, NULL, 29, NULL, 32, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2026, 223, NULL, '0', 'Lomeris H/C II', 5, 002, NULL, 29, NULL, 32, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2027, 223, NULL, '0', 'Lokerui H/C II', 5, 002, NULL, 29, NULL, 32, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2028, 223, NULL, '0', 'Lokolia H/C II', 5, 002, NULL, 29, NULL, 32, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2029, 223, NULL, '0', 'Kaadong Mission H/C II', 5, 002, NULL, 29, NULL, 32, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2030, 223, NULL, '0', 'Kalimon H/C II', 5, 002, NULL, 29, NULL, 32, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2031, 223, NULL, '0', 'Lomodoch H/C II', 5, 002, NULL, 29, NULL, 32, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2032, 223, NULL, '0', 'Kaimese H/C II', 5, 002, NULL, 29, NULL, 32, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2033, 223, NULL, '0', 'Narengepak H//C II', 5, 002, NULL, 29, NULL, 32, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2034, 474, NULL, '0', 'Gwere H/C II', 5, 002, NULL, 66, NULL, 75, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2035, 474, NULL, '0', 'Iboa H/C II', 5, 002, NULL, 66, NULL, 75, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2036, 474, NULL, '0', 'Indilinga H/C II', 5, 002, NULL, 66, NULL, 75, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2037, 474, NULL, '0', 'Besia H/C III', 6, 002, NULL, 66, NULL, 75, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2038, 474, NULL, '0', 'Lama H/C II', 5, 002, NULL, 66, NULL, 75, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2039, 474, NULL, '0', 'Gbalala H/C II', 5, 002, NULL, 66, NULL, 75, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2040, 474, NULL, '0', 'Lomunga H/C II', 5, 002, NULL, 66, NULL, 75, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2041, 474, NULL, '0', 'Goopi H/C II', 5, 002, NULL, 66, NULL, 75, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2042, 474, NULL, '0', 'Logoba H/C III', 6, 002, NULL, 66, NULL, 75, NULL, NULL, '78550430', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2043, 474, NULL, '0', 'FR.Bilbao H/C III', 6, 002, NULL, 66, NULL, 75, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2044, 531, NULL, '0', 'Showers H/C ', 1, 002, NULL, 74, NULL, 78, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2045, 531, NULL, '0', 'Akworo H/C III', 6, 002, NULL, 74, NULL, 78, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2046, 531, NULL, '0', 'Pakwach Mission H/C ', 1, 002, NULL, 74, NULL, 78, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2047, 788, NULL, '0', 'Kigo Prisons H/C III', 6, 002, NULL, 86, NULL, 24, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2048, 191, NULL, '0', 'Nsonzibbirye H/C II', 5, 002, NULL, 88, NULL, 26, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2049, 224, NULL, '0', 'Ikamiro H/C II', 5, 002, NULL, 30, NULL, 33, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2050, 295, NULL, '0', 'Kikandwa H/C II', 5, 002, NULL, 68, NULL, 46, NULL, NULL, '774192370', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2051, 224, NULL, '0', 'Kanjobe H/C II', 5, 002, NULL, 30, NULL, 33, NULL, NULL, '773096721', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2052, 1150, NULL, '0', 'Buddabugya H/C III', 6, 002, NULL, 71, NULL, 79, NULL, NULL, '785732683', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2053, 1150, NULL, '0', 'Kaweweta H/C III', 6, 002, NULL, 71, NULL, 79, NULL, NULL, '775108554', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2054, 438, NULL, '0', 'Kasambya H/C II (Gomba)', 5, 002, NULL, 89, NULL, 122, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2055, 438, NULL, '0', 'Mamba H/C II', 5, 002, NULL, 89, NULL, 122, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2056, 438, NULL, '0', 'Namabeya H/C II', 5, 002, NULL, 89, NULL, 122, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2057, 438, NULL, '0', 'Mawuki H/C II', 5, 002, NULL, 89, NULL, 122, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2058, 438, NULL, '0', 'Kitwe H/C II', 5, 002, NULL, 89, NULL, 122, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2059, 762, NULL, '0', 'Luwero Industries', 1, 002, NULL, 72, NULL, 77, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2060, 762, NULL, '0', 'Franciscan H/C KAKOOGE', 1, 002, NULL, 72, NULL, 77, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2061, 1150, NULL, '0', 'Kyangato H/C II', 5, 002, NULL, 71, NULL, 79, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2062, 1150, NULL, '0', 'Nakaseeta H/C II', 5, 002, NULL, 71, NULL, 79, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2063, 1150, NULL, '0', 'Kakoola H/C III', 6, 002, NULL, 71, NULL, 79, NULL, NULL, '772611417', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2064, 1150, NULL, '0', 'Lusangya H/C II', 5, 002, NULL, 71, NULL, 79, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2065, 1150, NULL, '0', 'Namuusale H/C II', 5, 002, NULL, 71, NULL, 79, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2066, 434, NULL, '0', 'Kabatema H/C II', 5, 002, NULL, 56, NULL, 64, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2067, 434, NULL, '0', 'Lyakajura H/C III', 6, 002, NULL, 71, NULL, 64, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2068, 434, NULL, '0', 'Lwengenyi H/C III', 6, 002, NULL, 56, NULL, 64, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2069, 433, NULL, '0', 'Kyazanga Muslim H/C III', 6, 002, NULL, 56, NULL, 115, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2070, 434, NULL, '0', 'Kabayanda H/C II', 5, 002, NULL, 56, NULL, 64, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2071, 425, NULL, '0', 'Orient Medical Centre', 1, 002, NULL, 55, NULL, 63, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2072, 295, NULL, '0', 'ST JOSEPH  H/ C III(Madudu)', 6, 002, NULL, 68, NULL, 46, NULL, NULL, '784921517', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', '');
INSERT INTO `facility` (`id`, `parentid`, `ipid`, `code`, `name`, `facilitylevelid`, `type`, `isactive`, `districtid`, `regionid`, `hubid`, `healthregionid`, `hubname`, `phonenumber`, `distancefromhub`, `email`, `contactperson`, `address`, `returnaddress`, `longitude`, `latitude`, `created_at`, `updated_at`, `createdby`) VALUES
(2073, 2493, NULL, '0', 'JCRC Lubowa(Wakiso)', 12, 002, NULL, 86, NULL, 41, NULL, NULL, '774576204', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2074, 144, NULL, '0', 'Bubalya H/C III', 6, 002, NULL, 18, NULL, 20, NULL, NULL, '755480363', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2075, 279, NULL, '0', 'Ngenge H/C III', 6, 002, NULL, 96, NULL, 44, NULL, NULL, '701755943', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2076, 313, NULL, '0', 'Nazigo Mission H/C II', 5, 002, NULL, 42, NULL, 49, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2077, 313, NULL, '0', 'Bukamba H/C II', 5, 002, NULL, 42, NULL, 49, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2078, 313, NULL, '0', 'Nakatovu H/C II', 5, 002, NULL, 42, NULL, 49, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2079, 313, NULL, '0', 'Namusaala H/C II', 5, 002, NULL, 42, NULL, 49, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2080, 313, NULL, '0', 'Namuyenje H/C II', 5, 002, NULL, 69, NULL, 49, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2081, 313, NULL, '0', 'Kiyoola H/C II', 5, 002, NULL, 69, NULL, 49, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2082, 350, NULL, '0', 'Diika H/C II', 5, 002, NULL, 110, NULL, 53, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2083, 144, NULL, '0', 'Kangalaba H/C III', 6, 002, NULL, 18, NULL, 20, NULL, NULL, '751622941', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2084, 311, NULL, '0', 'Kabizzi H/C II', 5, 002, NULL, 11, NULL, 48, NULL, NULL, '752813722', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2085, 452, NULL, '0', 'Budongo H/C II', 5, 002, NULL, 60, NULL, 69, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2086, 452, NULL, '0', 'Ntooma H/C II', 5, 002, NULL, 60, NULL, 69, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2087, 452, NULL, '0', 'Masindi Kitara Medical Center', 1, 002, NULL, 60, NULL, 69, NULL, NULL, 'Kitara H/C III', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2088, 452, NULL, '0', 'Kitanyata H/C II', 5, 002, NULL, 60, NULL, 69, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2089, 452, NULL, '0', 'Kugezi H/C II', 5, 002, NULL, 60, NULL, 69, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2090, 452, NULL, '0', 'Kigenga H/C II', 5, 002, NULL, 60, NULL, 69, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2091, 350, NULL, '0', 'Karungu H/C III', 6, 002, NULL, 110, NULL, 53, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2092, 121, NULL, '0', 'Kigwera H/C II', 5, 002, NULL, 14, NULL, 16, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2093, 121, NULL, '0', 'Avogera H/C II', 5, 002, NULL, 14, NULL, 16, NULL, NULL, '777318720', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2094, 121, NULL, '0', 'Uganda Matyrs H/C II', 5, 002, NULL, 14, NULL, 16, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2095, 121, NULL, '0', 'Kihungya H/C II', 5, 002, NULL, 14, NULL, 16, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2096, 121, NULL, '0', 'Sofad H/C II', 5, 002, NULL, 14, NULL, 16, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2097, 239, NULL, '0', 'Kyakabadiima H/C II', 5, 002, NULL, 43, NULL, 36, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2098, 239, NULL, '0', 'Galibileka H/C II', 5, 002, NULL, 43, NULL, 36, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2099, 239, NULL, '0', 'Burora H/C II', 5, 002, NULL, 43, NULL, 36, NULL, NULL, '775196657', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2100, 239, NULL, '0', 'Mugalike H/C III', 6, 002, NULL, 43, NULL, 36, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2101, 239, NULL, '0', 'Mugalike H/C II', 5, 002, NULL, 43, NULL, 36, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2102, 239, NULL, '0', 'Kyabasala H/C II', 5, 002, NULL, 43, NULL, 36, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2103, 239, NULL, '0', 'Mabira H/C III', 6, 002, NULL, 52, NULL, 36, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2104, 244, NULL, '0', 'St Marys H/C III(Kibaale)', 6, 002, NULL, 43, NULL, 38, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2105, 244, NULL, '0', 'Bathania H/C III', 6, 002, NULL, 43, NULL, 38, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2106, 244, NULL, '0', 'Kabubwa H/C II', 5, 002, NULL, 43, NULL, 38, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2107, 244, NULL, '0', 'Mpasaana H/C II', 5, 002, NULL, 43, NULL, 38, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2108, 244, NULL, '0', 'St Luke Bujuni H/C III (Kibaale)', 6, 002, NULL, 43, NULL, 38, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2110, 244, NULL, '0', 'St Aulistin H/C III', 6, 002, NULL, 43, NULL, 38, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2111, 320, NULL, '0', 'Seeta H/C II', 5, 002, NULL, 44, NULL, 50, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2112, 320, NULL, '0', 'Agape H/C III', 6, 002, NULL, 44, NULL, 50, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2113, 320, NULL, '0', 'Nyamiranga H/C III', 6, 002, NULL, 44, NULL, 50, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2114, 320, NULL, '0', 'Bamusuta H/C II', 5, 002, NULL, 44, NULL, 50, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2115, 320, NULL, '0', 'Vumba H/C II', 5, 002, NULL, 91, NULL, 50, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2116, 295, NULL, '0', 'Bbira H/C II', 5, 002, NULL, 0, NULL, 46, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2117, 199, NULL, '0', 'Karongo H/C III', 6, 002, NULL, 24, NULL, 28, NULL, NULL, '703599289', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2118, 244, NULL, '0', 'Kasambya H/C III (Kibaale)', 6, 002, NULL, 43, NULL, 38, NULL, NULL, '778103303', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2119, 659, NULL, '0', 'Kasaana H/C III', 6, 002, NULL, 27, NULL, 87, NULL, NULL, '758115686', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2120, 224, NULL, '0', 'Bucundura H/C II', 5, 002, NULL, 30, NULL, 33, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2121, 279, NULL, '0', 'Kwanyiny', 6, 002, NULL, 96, NULL, 44, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2122, 674, NULL, '0', 'Awaliwal H/C II', 5, 002, NULL, 84, NULL, 92, NULL, NULL, '774751438', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2123, 460, NULL, '0', 'Siita Save Life H/C III', 6, 002, NULL, 8, NULL, 70, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2125, 341, NULL, '0', 'Buhaghura H/C III', 6, 002, NULL, 40, NULL, 52, NULL, NULL, '772824124', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2126, 460, NULL, '0', 'Bumadanda H/C III', 6, 002, NULL, 62, NULL, 70, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2127, 470, NULL, '0', 'Kyantungo H/C IV', 7, 002, NULL, 64, NULL, 73, NULL, NULL, '782492377', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2129, 470, NULL, '0', 'Cardinal Nsubuga H/C III', 6, 002, NULL, 64, NULL, 73, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2131, 629, NULL, '0', 'Manya H/C III', 6, 002, NULL, 80, NULL, 83, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2132, 629, NULL, '0', 'Kibaale  H/C II( Rakai)', 5, 002, NULL, 80, NULL, 83, NULL, NULL, '772324018', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2133, 629, NULL, '0', 'Nazareth H/C II', 5, 002, NULL, 80, NULL, 83, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2134, 629, NULL, '0', 'St Gyaviira Domicilliary Cilinic', 1, 002, NULL, 80, NULL, 83, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2135, 629, NULL, '0', 'St Martin  Clinic (Bukunda)', 3, 002, NULL, 80, NULL, 83, NULL, NULL, '703832444', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2136, 631, NULL, '0', 'Pawor H/C III', 6, 002, NULL, 7, NULL, 11, NULL, NULL, '781409007', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2137, 460, NULL, '0', 'Wanale H/C III', 6, 002, NULL, 62, NULL, 70, NULL, NULL, '775407290', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2138, 204, NULL, '0', 'Sagitu H/C II', 5, 002, NULL, 61, NULL, 29, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2139, 149, NULL, '0', 'St Francis Of Asiisi Marternity Home (lukaya)', 3, 002, NULL, 90, NULL, 100, NULL, NULL, '772571917', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2140, 2493, NULL, '0', 'Bulucheke H/c III', 6, 002, NULL, 9, NULL, 41, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2141, 36, NULL, '0', 'Ongutoi Health Center', 1, 002, NULL, 4, NULL, 8, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2142, 211, NULL, '0', 'Nyamityobora H/C III', 6, 002, NULL, 63, NULL, 71, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2143, 460, NULL, '0', 'Bunapongo H/C III', 6, 002, NULL, 62, NULL, 70, NULL, NULL, '775028600', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2144, 669, NULL, '0', 'Kawoko muslim H/C III', 6, 002, NULL, 93, NULL, 93, NULL, NULL, '751075596', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2145, 451, NULL, '0', 'Teguzibirwa Dom ', 3, 002, NULL, 90, NULL, 68, NULL, NULL, '701483245', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2146, 50, NULL, '0', 'Pajulu H/C III (Arua)', 6, 002, NULL, 7, NULL, 11, NULL, NULL, '774084117', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2147, 669, NULL, '0', 'Buke Nursing Home', 1, 002, NULL, 93, NULL, 93, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2148, 614, NULL, '0', 'Kasasira H/C III', 6, 002, NULL, 95, NULL, 82, NULL, NULL, '782147786', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2149, 788, NULL, '0', 'Kitooro H/C III', 6, 002, NULL, 86, NULL, 24, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2150, 38, NULL, '0', 'Koch Lii H/C II', 5, 002, NULL, 106, NULL, 10, NULL, NULL, '793767878', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2151, 2493, NULL, '0', 'Touch Namuwongo (IHK)', 9, 002, NULL, 35, NULL, 41, NULL, NULL, 'Immaculate Mbabazi', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2152, 121, NULL, '0', 'Marine Military H/C II', 5, 002, NULL, 14, NULL, 16, NULL, NULL, '700404143', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2154, 629, NULL, '0', 'Muzito Cilinic', 12, 002, NULL, 80, NULL, 83, NULL, NULL, '781554717', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2155, 279, NULL, '0', 'Atari H/C II', 5, 002, NULL, 39, NULL, 44, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2156, 279, NULL, '0', 'Chepsukunya H/C II', 5, 002, NULL, 0, NULL, 44, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2157, 279, NULL, '0', 'Sundet H/C II', 5, 002, NULL, 0, NULL, 44, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2158, 279, NULL, '0', 'Kiriki H/C II', 5, 002, NULL, 39, NULL, 44, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2159, 279, NULL, '0', 'Kapteror H/C II', 5, 002, NULL, 39, NULL, 44, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2160, 279, NULL, '0', 'Chemwon H/C III', 6, 002, NULL, 96, NULL, 44, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2161, 279, NULL, '0', 'Tukumo H/C II', 5, 002, NULL, 39, NULL, 44, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2162, 279, NULL, '0', 'Mengya H/C II', 5, 002, NULL, 39, NULL, 44, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2163, 279, NULL, '0', 'Terenboy H/C II', 5, 002, NULL, 39, NULL, 44, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2164, 279, NULL, '0', 'Konta H/C II', 5, 002, NULL, 39, NULL, 44, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2165, 425, NULL, '0', 'Nsanvu H/C II', 5, 002, NULL, 55, NULL, 63, NULL, NULL, '782775162', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2166, 10, NULL, '0', 'Ukusijoni H/C III', 6, 002, NULL, 2, NULL, 6, NULL, NULL, '779200342', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2167, 279, NULL, '0', 'Kabelyo H/C II', 5, 002, NULL, 39, NULL, 44, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2168, 279, NULL, '0', 'Kwarus H/C II', 5, 002, NULL, 39, NULL, 44, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2169, 279, NULL, '0', 'Kaserem Christian H/C II', 5, 002, NULL, 39, NULL, 44, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2171, 279, NULL, '0', 'Bukhalu H/C III', 6, 002, NULL, 94, NULL, 44, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2172, 279, NULL, '0', 'Bumugusha H/C III', 6, 002, NULL, 39, NULL, 44, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2173, 279, NULL, '0', 'Kwoti H/C II', 5, 002, NULL, 39, NULL, 44, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2174, 279, NULL, '0', 'Kapkwomurya H/C II', 5, 002, NULL, 39, NULL, 44, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2175, 279, NULL, '0', 'Tumboboi H/C II', 5, 002, NULL, 39, NULL, 44, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2176, 279, NULL, '0', 'Kaplelko H/C II', 5, 002, NULL, 39, NULL, 44, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2177, 279, NULL, '0', 'Reproductive Health Medical Center II', 5, 002, NULL, 39, NULL, 44, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2178, 279, NULL, '0', 'Gamatui H/C II', 6, 002, NULL, 39, NULL, 44, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2179, 450, NULL, '0', 'Lumino Catholic', 1, 002, NULL, 17, NULL, 67, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2180, 450, NULL, '0', 'Namungodi H/C II', 5, 002, NULL, 17, NULL, 67, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2181, 450, NULL, '0', 'Buwembe H/C II', 5, 002, NULL, 17, NULL, 67, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2182, 450, NULL, '0', 'Buwumba H/C III', 6, 002, NULL, 17, NULL, 67, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2183, 450, NULL, '0', 'Busia Police', 1, 002, NULL, 17, NULL, 67, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2184, 614, NULL, '0', 'Nabuule H/C III', 6, 002, NULL, 79, NULL, 82, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2185, 614, NULL, '0', 'Mpongi H/C III', 6, 002, NULL, 79, NULL, 82, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2186, 614, NULL, '0', 'Limoto H/C III', 6, 002, NULL, 79, NULL, 82, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2188, 614, NULL, '0', 'Kabweri H/C II', 5, 002, NULL, 79, NULL, 82, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2189, 614, NULL, '0', 'Oloko H/C III', 6, 002, NULL, 79, NULL, 82, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2190, 614, NULL, '0', 'Kaukura H/C II', 5, 002, NULL, 79, NULL, 82, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2191, 614, NULL, '0', 'Kaucho Mission H/CIII', 6, 002, NULL, 79, NULL, 82, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2192, 614, NULL, '0', 'Kaboloi H/C III', 6, 002, NULL, 79, NULL, 82, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2193, 614, NULL, '0', 'Kapwai Pacodat H/C III', 6, 002, NULL, 79, NULL, 82, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2194, 614, NULL, '0', 'Obutete H/C II', 5, 002, NULL, 79, NULL, 82, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2195, 614, NULL, '0', 'Oladot H/C III', 6, 002, NULL, 79, NULL, 82, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2196, 614, NULL, '0', 'Kapwai H/C III', 6, 002, NULL, 79, NULL, 82, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2197, 10, NULL, '0', 'Mary Land H/C II', 6, 002, NULL, 2, NULL, 6, NULL, NULL, '777450165', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2198, 670, NULL, '0', 'Kagwara H/C II', 5, 002, NULL, 100, NULL, 90, NULL, NULL, '750723809', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2199, 480, NULL, '0', 'Kabamba Military Hospital', 9, 002, NULL, 68, NULL, 76, NULL, NULL, '773774770', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2200, 227, NULL, '0', 'Pakegido H/C III', 6, 002, NULL, 32, NULL, 34, NULL, NULL, '779360008', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2201, 2493, NULL, '0', 'Kampala West Medical Clinic', 1, 002, NULL, 35, NULL, 41, NULL, NULL, '775051525', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2202, 788, NULL, '0', 'St Magdalene H/c II', 5, 002, NULL, 86, NULL, 24, NULL, NULL, '779326094', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2203, 38, NULL, '0', 'Todora H/C II', 5, 002, NULL, 106, NULL, 10, NULL, NULL, '782040746', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2204, 2493, NULL, '0', 'Community H/C (Kaliro)', 1, 002, NULL, 34, NULL, 41, NULL, NULL, '754341786', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2205, 460, NULL, '0', 'Makhonje H/C III', 6, 002, NULL, 62, NULL, 70, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2206, 2493, NULL, '0', 'MUJHU (Mulago)', 3, 002, NULL, 35, NULL, 41, NULL, NULL, '772618577', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2207, 439, NULL, '0', 'Ogako H/C II', 5, 002, NULL, 53, NULL, 65, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2208, 279, NULL, '0', 'Kortek H/C III', 6, 002, NULL, 13, NULL, 44, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2209, 38, NULL, '0', 'Aparanga H/C II', 5, 002, NULL, 106, NULL, 10, NULL, NULL, '712654165', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2210, 674, NULL, '0', 'Soroti Medical Associate Nursing Home', 1, 002, NULL, 84, NULL, 92, NULL, NULL, '777193932', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2212, 123, NULL, '0', 'Kaliro Medical Center', 1, 002, NULL, 34, NULL, 17, NULL, NULL, '750566434', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2213, 311, NULL, '0', 'Lugala H/C III', 6, 002, NULL, 11, NULL, 48, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2215, 788, NULL, '0', 'Qudrah Medical Center', 1, 002, NULL, 86, NULL, 24, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2216, 311, NULL, '0', 'Kikwayi H/C II', 5, 002, NULL, 11, NULL, 48, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2217, 669, NULL, '0', 'Bukomansimbi Medical Centre', 1, 002, NULL, 93, NULL, 93, NULL, NULL, '753331341', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2218, 224, NULL, '0', 'Hakishenyi H/C II', 5, 002, NULL, 30, NULL, 33, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2219, 195, NULL, '0', 'Angaya H/C III', 6, 002, NULL, 23, NULL, 27, NULL, NULL, '774351121', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2220, 2493, NULL, '0', 'SAREC Medicare Center', 3, 002, NULL, 35, NULL, 41, NULL, NULL, '700665522', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2221, 2484, NULL, '0', 'Dr Ambrosolic Clinic (Kaliro)', 12, 002, NULL, 34, NULL, 42, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2222, 788, NULL, '0', 'Kitala H/C II', 5, 002, NULL, 86, NULL, 24, NULL, NULL, '775361737', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2223, 31, NULL, '0', 'Alemere H/C II', 5, 002, NULL, 3, NULL, 7, NULL, NULL, '783479888', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2224, 439, NULL, '0', 'Kapeta H/C II', 5, 002, NULL, 53, NULL, 65, NULL, NULL, '7743392119', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2225, 416, NULL, '0', 'Aliwang H/C III', 5, 002, NULL, 107, NULL, 61, NULL, NULL, '775064649', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2226, 451, NULL, '0', 'Kamulegu H/C III', 6, 002, NULL, 59, NULL, 68, NULL, NULL, '702112742', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2227, 698, NULL, '0', 'Kyamwinula H/C III', 6, 002, NULL, 85, NULL, 95, NULL, NULL, '772440973', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2228, 311, NULL, '0', 'Lugazi  H/C II', 5, 002, NULL, 11, NULL, 48, NULL, NULL, '753474238', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2229, 160, NULL, '0', 'Haama H/C II', 5, 002, NULL, 98, NULL, 21, NULL, NULL, '752468355', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2230, 160, NULL, '0', 'Lolwe H/C III', 6, 002, NULL, 98, NULL, 21, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2231, 224, NULL, '0', 'Bwindi H/C III', 6, 002, NULL, 30, NULL, 33, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2232, 224, NULL, '0', 'Kafunjo H/C II', 5, 002, NULL, 30, NULL, 33, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2233, 451, NULL, '0', 'Kitunga H/C II', 5, 002, NULL, 59, NULL, 68, NULL, NULL, '777841057', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2234, 341, NULL, '0', 'Kalibu H/C III', 6, 002, NULL, 40, NULL, 52, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2235, 398, NULL, '0', 'Kashagazi H/C II', 5, 002, NULL, 51, NULL, 58, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2236, 124, NULL, '0', 'Burondo H/C II', 5, 002, NULL, 15, NULL, 18, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2237, 124, NULL, '0', 'Rwengara H/C II', 5, 002, NULL, 15, NULL, 18, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2238, 124, NULL, '0', 'Butama H/C III', 6, 002, NULL, 15, NULL, 18, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2239, 124, NULL, '0', 'Bulyambwa H/C II', 5, 002, NULL, 15, NULL, 18, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2240, 649, NULL, '0', 'Buhanda H/C II', 5, 002, NULL, 37, NULL, 101, NULL, NULL, '0775246087', NULL, '', 'Agnes', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2241, 124, NULL, '0', 'Busoru H/C II', 5, 002, NULL, 0, NULL, 18, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2242, 124, NULL, '0', 'Kasulenga H/C II', 5, 002, NULL, 0, NULL, 18, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2243, 124, NULL, '0', 'Bundigoma HC III', 6, 002, NULL, 15, NULL, 18, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2244, 124, NULL, '0', 'Musandama H/C II', 5, 002, NULL, 15, NULL, 18, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2245, 124, NULL, '0', 'Bupompoli H/C II', 5, 002, NULL, 15, NULL, 18, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2246, 124, NULL, '0', 'Bundimulangya H/C II', 5, 002, NULL, 15, NULL, 18, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2247, 124, NULL, '0', 'Kayenje H/C II', 5, 002, NULL, 15, NULL, 18, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2248, 160, NULL, '0', 'Bujwanga H/C II', 5, 002, NULL, 98, NULL, 21, NULL, NULL, '771428391', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2249, 227, NULL, '0', 'Abalang H/C II', 5, 002, NULL, 32, NULL, 34, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2250, 36, NULL, '0', 'Wera H/C III', 6, 002, NULL, 4, NULL, 8, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2251, 1181, NULL, '0', 'Ongongoja H/C II', 5, 002, NULL, 41, NULL, 47, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2252, 1181, NULL, '0', 'Akurao H/C II', 5, 002, NULL, 41, NULL, 47, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2253, 1181, NULL, '0', 'Okoritok H/C II', 5, 002, NULL, 41, NULL, 47, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2254, 1181, NULL, '0', 'Opeta H/C II', 5, 002, NULL, 41, NULL, 47, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2255, 1181, NULL, '0', 'Olilim H/C II (Katakwi)', 5, 002, NULL, 41, NULL, 47, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2256, 1181, NULL, '0', 'Palam H/C II', 5, 002, NULL, 41, NULL, 47, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2257, 123, NULL, '0', 'Kaliro T C ', 1, 002, NULL, 34, NULL, 17, NULL, NULL, '775246303', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2258, 659, NULL, '0', 'Rurongo H/C II', 5, 002, NULL, 27, NULL, 87, NULL, NULL, '777306703', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2259, 256, NULL, '0', 'Posta Uganda', 1, 002, NULL, 26, NULL, 39, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2260, 204, NULL, '0', 'Bukunga H/C III', 6, 002, NULL, 26, NULL, 29, NULL, NULL, '782907272', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2261, 204, NULL, '0', 'Bulunagi H/C III', 6, 002, NULL, 26, NULL, 29, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2262, 211, NULL, '0', 'Rwemigina H/C II', 5, 002, NULL, 63, NULL, 71, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2263, 10, NULL, '0', 'Bira HC III', 6, 002, NULL, 2, NULL, 6, NULL, NULL, '779700550', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2264, 788, NULL, '0', 'Kyengera H/C II', 5, 002, NULL, 86, NULL, 24, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2265, 425, NULL, '0', 'Bugema University H/C III', 6, 002, NULL, 55, NULL, 63, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2266, 253, NULL, '0', 'Lujjabwa H/C II', 5, 002, NULL, 33, NULL, 113, NULL, NULL, '751947144', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2267, 160, NULL, '0', 'Buyambo H/C II', 5, 002, NULL, 98, NULL, 21, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2268, 160, NULL, '0', 'Buchumba H/C II', 5, 002, NULL, 98, NULL, 21, NULL, NULL, '776409201', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2269, 439, NULL, '0', 'Apyeta H/C II', 5, 002, NULL, 53, NULL, 65, NULL, NULL, '775129930', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2270, 460, NULL, '0', 'Lyama H/C III', 6, 002, NULL, 8, NULL, 70, NULL, NULL, '701558464', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2271, 179, NULL, '0', 'Anyacoto H/C II', 5, 002, NULL, 22, NULL, 23, NULL, NULL, '777786876', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2272, 160, NULL, '0', 'Syanyonja H/C II', 5, 002, NULL, 98, NULL, 21, NULL, NULL, '755607128', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2273, 50, NULL, '0', 'St Jude UCEPPI H/C III', 6, 002, NULL, 7, NULL, 11, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2274, 179, NULL, '0', 'Amwoma H/C III', 6, 002, NULL, 22, NULL, 23, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2275, 31, NULL, '0', 'Biko H/C II', 5, 002, NULL, 3, NULL, 7, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2276, 460, NULL, '0', 'Mout Elgon Hospital (Mbale)', 9, 002, NULL, 62, NULL, 70, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2277, 329, NULL, '0', 'Bwondha HC II', 5, 002, NULL, 61, NULL, 117, NULL, NULL, '755757657', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2278, 551, NULL, '0', 'Sirimula H/C III', 6, 002, NULL, 91, NULL, 106, NULL, NULL, '782200434', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2279, 451, NULL, '0', 'Buyaga H/C III (Masaka)', 5, 002, NULL, 59, NULL, 68, NULL, NULL, '759024150', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2280, 439, NULL, '0', 'Dibolyec H/C II', 5, 002, NULL, 53, NULL, 65, NULL, NULL, '772388741', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2281, 253, NULL, '0', 'Kasekulo H/C II', 5, 002, NULL, 33, NULL, 113, NULL, NULL, '785026432', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2283, 179, NULL, '0', 'Kachung H/C II', 5, 002, NULL, 22, NULL, 23, NULL, NULL, '782723162', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2284, 311, NULL, '0', 'Wanyange (St Benedict)', 1, 002, NULL, 11, NULL, 48, NULL, NULL, '752832172', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2285, 650, NULL, '0', 'Kyampangara H/C II', 5, 002, NULL, 45, NULL, 86, NULL, NULL, '787508850', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2286, 149, NULL, '0', 'Lukaya Health Care Centre', 3, 002, NULL, 90, NULL, 100, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2287, 179, NULL, '0', 'Awiri H/C II', 5, 002, NULL, 22, NULL, 23, NULL, NULL, '777112388', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2288, 222, NULL, '0', 'Muwumba H/C III', 6, 002, NULL, 28, NULL, 31, NULL, NULL, '783710004', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2289, 99, NULL, '0', 'Wakawaka H/C II', 5, 002, NULL, 10, NULL, 15, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2291, 439, NULL, '0', 'Katum H/C II', 5, 002, NULL, 53, NULL, 65, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2292, 195, NULL, '0', 'Te-Got H/C II', 5, 002, NULL, 23, NULL, 27, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2293, 460, NULL, '0', 'Mbale Police H/C III', 6, 002, NULL, 62, NULL, 70, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2294, 279, NULL, '0', 'Bumugusha H/C III (Bulambuli)', 6, 002, NULL, 94, NULL, 44, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2295, 224, NULL, '0', 'Bwama H/C III', 6, 002, NULL, 30, NULL, 33, NULL, NULL, '775930279', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2296, 224, NULL, '0', 'Kyobugombe H/C II', 5, 002, NULL, 30, NULL, 33, NULL, NULL, '782377141', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2297, 38, NULL, '0', 'St Francis H/C II', 5, 002, NULL, 106, NULL, 10, NULL, NULL, '779202094', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2298, 670, NULL, '0', 'Oburin H/C II', 5, 002, NULL, 100, NULL, 90, NULL, NULL, '775027440', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2299, 416, NULL, '0', 'Alango H/C II', 5, 002, NULL, 107, NULL, 61, NULL, NULL, '782556798', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2300, 416, NULL, '0', 'Atangwata H/C III', 6, 002, NULL, 107, NULL, 61, NULL, NULL, '757165056', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2301, 608, NULL, '0', 'All Saints H/C II', 5, 002, NULL, 78, NULL, 107, NULL, NULL, '777371190', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2302, 195, NULL, '0', 'Pawel Angany  H/C II', 5, 002, NULL, 23, NULL, 27, NULL, NULL, '774848926', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2303, 360, NULL, '0', 'Lagot H/C II', 5, 002, NULL, 47, NULL, 56, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2304, 2493, NULL, '0', 'Medical Research Council (Mengo)', 3, 002, NULL, 35, NULL, 41, NULL, NULL, '754736312', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2305, 2493, NULL, '0', 'Zaam Medical Center', 1, 002, NULL, 35, NULL, 41, NULL, NULL, '771845789', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2306, 195, NULL, '0', 'Oitino HCII', 5, 002, NULL, 23, NULL, 27, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2307, 86, NULL, '0', 'Masiyompo H/C III', 6, 002, NULL, 83, NULL, 114, NULL, NULL, '772394032', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2308, 460, NULL, '0', 'Bukedea Mission Dispensary', 1, 002, NULL, 12, NULL, 70, NULL, NULL, '7025051972', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2309, 2493, NULL, '0', 'Wentz Medical Center', 1, 002, NULL, 35, NULL, 41, NULL, NULL, '772655045', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2310, 313, NULL, '0', 'Namiti H/C II', 5, 002, NULL, 19, NULL, 49, NULL, NULL, '779348652', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2312, 614, NULL, '0', 'Multicare Medical Centre', 12, 002, NULL, 79, NULL, 82, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2313, 460, NULL, '0', 'St Austin H/C II(Mbale)', 5, 002, NULL, 62, NULL, 70, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2314, 204, NULL, '0', 'Masolya H/C II', 5, 002, NULL, 61, NULL, 29, NULL, NULL, '756742331', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2315, 696, NULL, '0', 'Lokales H/C II', 5, 002, NULL, 103, NULL, 94, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2316, 239, NULL, '0', 'Allustin H/C III', 6, 002, NULL, 43, NULL, 36, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2317, 137, NULL, '0', 'Ruhomuro H/C III', 6, 002, NULL, 16, NULL, 19, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2318, 4, NULL, '0', 'Kanu H/C II', 5, 002, NULL, 1, NULL, 5, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2319, 380, NULL, '0', '405 Brigade HC III', 6, 002, NULL, 49, NULL, 57, NULL, NULL, '772022191', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2320, 222, NULL, '0', 'Kakira H/C III (Jinja)', 6, 002, NULL, 28, NULL, 31, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2321, 187, NULL, '0', 'Kidubuli HCIII', 6, 002, NULL, 31, NULL, 25, NULL, NULL, '773984355', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2322, 416, NULL, '0', 'Barjobi HCIII', 6, 002, NULL, 107, NULL, 61, NULL, NULL, '772025255', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2323, 452, NULL, '0', 'Masindi Military Hospital', 9, 002, NULL, 60, NULL, 69, NULL, NULL, '783945484', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2324, 2493, NULL, '0', 'Infectious Diseases Institute', 1, 002, NULL, 35, NULL, 41, NULL, NULL, '772352116', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2325, 99, NULL, '0', 'Fastline Medical Centre', 10, 002, NULL, 10, NULL, 15, NULL, NULL, '753213130', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2326, 451, NULL, '0', 'Kitovu Mobile', 1, 002, NULL, 59, NULL, 68, NULL, NULL, '774396177', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2327, 124, NULL, '0', 'Rwangara H/C II', 6, 002, NULL, 112, NULL, 18, NULL, NULL, '774117518', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2328, 224, NULL, '0', 'Rwenyangye H/C II', 5, 002, NULL, 30, NULL, 33, NULL, NULL, '774487962', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2329, 160, NULL, '0', 'Mulombi Health Centre II', 5, 002, NULL, 98, NULL, 21, NULL, NULL, '753027938', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2330, 2493, NULL, '0', 'Faith Mulira Health Care Center', 8, 002, NULL, 86, NULL, 41, NULL, NULL, '775556356', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2331, 416, NULL, '0', 'Barocok H/C II', 5, 002, NULL, 107, NULL, 61, NULL, NULL, '712239917', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2332, 460, NULL, '0', 'Hope Medical Centre', 10, 002, NULL, 62, NULL, 70, NULL, NULL, '779374806', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2333, 2493, NULL, '0', 'Royal Health Care', 8, 002, NULL, 35, NULL, 41, NULL, NULL, '774545265', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2334, 439, NULL, '0', 'Padibe West H/C III', 6, 002, NULL, 53, NULL, 65, NULL, NULL, '706052468', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2335, 674, NULL, '0', 'Agirigiroi H/C II', 5, 002, NULL, 84, NULL, 92, NULL, NULL, '783242081', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2336, 325, NULL, '0', 'Kakooge H/C II', 5, 002, NULL, 20, NULL, 51, NULL, NULL, '756928794', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2337, 313, NULL, '0', 'Eseri Domiciliary Clinic', 3, 002, NULL, 69, NULL, 49, NULL, NULL, '784935470', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2338, 2493, NULL, '0', 'Equator Health Services', 1, 002, NULL, 35, NULL, 41, NULL, NULL, '774905909', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2339, 187, NULL, '0', 'Muhoti Military H/C III', 6, 002, NULL, 31, NULL, 25, NULL, NULL, '784434850', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2340, 1241, NULL, '0', 'Munobwa Clinic', 3, 002, NULL, 52, NULL, 60, NULL, NULL, '7002299429', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2341, 629, NULL, '0', 'Kayanja H/C II', 5, 002, NULL, 80, NULL, 83, NULL, NULL, '782952313', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2342, 659, NULL, '0', 'Kamubeizi H/C II', 5, 002, NULL, 27, NULL, 87, NULL, NULL, '771418206', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2343, 698, NULL, '0', 'Butiru Chrisco Hospital', 9, 002, NULL, 57, NULL, 95, NULL, NULL, '787727809', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2344, 23, NULL, '0', 'Alanyi H/C III', 6, 002, NULL, 102, NULL, 108, NULL, NULL, '784775900', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2345, 137, NULL, '0', 'Ruhumuro H/C III', 6, 002, NULL, 16, NULL, 19, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2346, 3, NULL, '0', 'Aganga H/C II', 5, 002, NULL, 6, NULL, 4, NULL, NULL, '777038324', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2347, 56, NULL, '0', 'Midas Touch Medical Services', 1, 002, NULL, 50, NULL, 13, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2348, 187, NULL, '0', 'Nyabuswa H/C III', 6, 002, NULL, 31, NULL, 25, NULL, NULL, '706942454', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2349, 50, NULL, '0', 'Arua Police H/C III', 6, 002, NULL, 7, NULL, 11, NULL, NULL, '776031982', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2350, 670, NULL, '0', 'Akoboi H/C II (Serere)', 5, 002, NULL, 100, NULL, 90, NULL, NULL, '772194595', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2351, 2493, NULL, '0', 'Medik Hospital Kawempe', 9, 002, NULL, 35, NULL, 41, NULL, NULL, '773630335', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2352, 223, NULL, '0', 'Kaabong Mission H/C III', 6, 002, NULL, 29, NULL, 32, NULL, NULL, '787633765', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2353, 416, NULL, '0', 'Anep Moroto H/C II', 5, 002, NULL, 107, NULL, 61, NULL, NULL, '782434589', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2354, 36, NULL, '0', 'Amusus H/C II', 5, 002, NULL, 4, NULL, 8, NULL, NULL, '783900525', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2355, 416, NULL, '0', 'Ogwete H/C II', 5, 002, NULL, 107, NULL, 61, NULL, NULL, '773116855', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2356, 144, NULL, '0', 'Naweyo H/C III', 6, 002, NULL, 18, NULL, 20, NULL, NULL, '759410502', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', ''),
(2357, 191, NULL, '0', 'Double Cure Medical Centre', 6, 002, NULL, 67, NULL, 26, NULL, NULL, '772016917', NULL, '', 'Mutebi Sumaya', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'system'),
(2358, 439, NULL, '0', 'Pangira H/C II', 5, 002, NULL, 53, NULL, 65, NULL, NULL, '784805819', NULL, '', 'Akello Santa', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'system'),
(2359, 224, NULL, '0', 'Kibuzigye H/C II', 5, 002, NULL, 30, NULL, 33, NULL, NULL, '788353787', NULL, '', 'NAKURE BERINA', 'KIBUZIGYE H/C II P.O.BOX KABALE', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'system'),
(2360, 144, NULL, '0', 'Nakwasi H/C III', 6, 002, NULL, 18, NULL, 20, NULL, NULL, '757142666', NULL, '', 'Namunyana Samali', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'system'),
(2361, 472, NULL, '0', 'District Medical Officer\'s Clinic H/C II', 5, 002, NULL, 65, NULL, 74, NULL, NULL, '782151782', NULL, '', 'AUILENG FRANCIS', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'system'),
(2362, 179, NULL, '0', 'Abalang H/C II (Dokolo)', 5, 002, NULL, 22, NULL, 23, NULL, NULL, '782734502', NULL, '', 'AKOCH JOSEPHINE', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'system'),
(2363, 416, NULL, '0', 'Kristina H/C II', 5, 002, NULL, 107, NULL, 61, NULL, NULL, '775077735', NULL, '', 'BUA DAVID', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'system'),
(2364, 472, NULL, '0', 'Apeitolim H/C II', 5, 002, NULL, 105, NULL, 74, NULL, NULL, '783477077', NULL, '', 'LOPADE ERICK', 'C/O MAKATHI H/C II', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'system'),
(2366, 144, NULL, '0', 'Busabi H/C III', 6, 002, NULL, 18, NULL, 20, NULL, NULL, '779345296', NULL, '', 'NYAMWENGE BEZA', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'system');
INSERT INTO `facility` (`id`, `parentid`, `ipid`, `code`, `name`, `facilitylevelid`, `type`, `isactive`, `districtid`, `regionid`, `hubid`, `healthregionid`, `hubname`, `phonenumber`, `distancefromhub`, `email`, `contactperson`, `address`, `returnaddress`, `longitude`, `latitude`, `created_at`, `updated_at`, `createdby`) VALUES
(2367, 56, NULL, '0', 'Akide H/C II', 5, 002, NULL, 50, NULL, 13, NULL, NULL, '783237827', NULL, '', 'Aguti Harriet', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'system'),
(2368, 2493, NULL, '0', 'Nansana H/C II', 5, 002, NULL, 86, NULL, 41, NULL, NULL, '782834773', NULL, '', 'KASOGA LOY', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'system'),
(2369, 674, NULL, '0', 'Uganda Cares (Soroti)', 13, 002, NULL, 84, NULL, 92, NULL, NULL, '782555940', NULL, '', 'AMUGE CATHY', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'system'),
(2370, 360, NULL, '0', 'Diocese Of Kitgum H/C II', 5, 002, NULL, 47, NULL, 56, NULL, NULL, '775013893', NULL, '', 'Aparo Sunday', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'system'),
(2371, 222, NULL, '0', 'Soft Power Health Clinic', 0, 002, NULL, 28, NULL, 31, NULL, NULL, '776973082', NULL, '', 'MENYA HARUNA', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'system'),
(2372, 222, NULL, '0', 'St Benedict Health Center', 8, 002, NULL, 28, NULL, 31, NULL, NULL, '788153464', NULL, '', 'AKUJO SUSAN', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'system'),
(2373, 614, NULL, '0', 'Kaboloi H/C III', 6, 002, NULL, 79, NULL, 82, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'system'),
(2374, 222, NULL, '0', 'Jinja Remand H/C II', 5, 002, NULL, 28, NULL, 31, NULL, NULL, '787431000', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'system'),
(2375, 222, NULL, '0', 'Jinja Main Prison H/C III', 6, 002, NULL, 28, NULL, 31, NULL, NULL, '772432358', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'system'),
(2376, 195, NULL, '0', 'Awaca H/C IV', 7, 002, NULL, 23, NULL, 27, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'system'),
(2377, 629, NULL, '0', 'St Jacob Health Center(Lwamaggwa)', 8, 002, NULL, 80, NULL, 83, NULL, NULL, '776487439', NULL, '', 'SSEMYALO PHILIP', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'system'),
(2378, 460, NULL, '0', 'Naiku Health Centre III', 6, 002, NULL, 62, NULL, 70, NULL, NULL, '779444875', NULL, '', 'ALOKA GEORGE', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'system'),
(2379, 149, NULL, '0', 'St Monica Birongo H/C III (Kalungu)', 6, 002, NULL, 90, NULL, 100, NULL, NULL, '700302855', NULL, '', 'SR. SARAH NANGONZI', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'system'),
(2380, 160, NULL, '0', 'Rabachi H/C II', 5, 002, NULL, 98, NULL, 21, NULL, NULL, '783145980', NULL, '', 'Nandera Lilian', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'system'),
(2381, 398, NULL, '0', 'Kishagazi H/C II', 5, 002, NULL, 51, NULL, 58, NULL, NULL, '782293716', NULL, '', 'ABOKI GODFREY', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'system'),
(2382, 222, NULL, '0', 'SCSC+AC0-Kimaka H/C II', 5, 002, NULL, 28, NULL, 31, NULL, NULL, '781475259', NULL, '', 'MORO ANDREW', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'system'),
(2383, 788, NULL, '0', 'Jjanda H/C III', 6, 002, NULL, 86, NULL, 24, NULL, NULL, '782194608', NULL, '', 'AMENU TOM', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'system'),
(2385, 650, NULL, '0', 'Nkungu H/C III', 6, 002, NULL, 45, NULL, 86, NULL, NULL, '772090041', NULL, '', 'TWIKIRIZE CHRISTINE', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'system'),
(2386, NULL, NULL, '0', 'Buhange H/C III', 6, 002, NULL, 73, NULL, 0, NULL, NULL, '773897760', NULL, '', 'KANTONO NORAH', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'system'),
(2387, 460, NULL, '0', 'Kerekerene H/C III', 6, 002, NULL, 8, NULL, 70, NULL, NULL, '776099234', NULL, '', 'ZIWU JULIUS', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'system'),
(2388, 179, NULL, '0', 'Awelo H/C II', 5, 002, NULL, 22, NULL, 23, NULL, NULL, '774827612', NULL, '', 'ACAI SUSAN', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'system'),
(2389, NULL, NULL, '0', 'Majira H/C III', 6, 002, NULL, 94, NULL, 0, NULL, NULL, '701267208', NULL, '', 'Alfred Magusho', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'system'),
(2390, 23, NULL, '0', 'Abia H/C II', 3, 002, NULL, 102, NULL, 108, NULL, NULL, '7509972267', NULL, '', 'CAROLINE', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'system'),
(2391, 256, NULL, '0', 'Lapul H/C III', 6, 002, NULL, 78, NULL, 39, NULL, NULL, '756149876', NULL, '', 'OJOK JOHN', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'system'),
(2392, 50, NULL, '0', 'OMBIDRI ONDREA H/C III', 6, 002, NULL, 7, NULL, 11, NULL, NULL, '', NULL, '', 'AFAYOA CHARLES', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'system'),
(2393, NULL, NULL, '0', 'Kitunga H/C II (Kabale)', 5, 002, NULL, 30, NULL, 0, NULL, NULL, '779211721', NULL, '', 'Nahabwe Gloria', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'system'),
(2394, 712, NULL, '0', 'Alnoor H/C II', 5, 002, NULL, 87, NULL, 96, NULL, NULL, '779818555', NULL, '', 'ACIDRINGA HAKIM', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'system'),
(2395, 788, NULL, '0', 'Rapha Medical Centre(Wakiso)', 12, 002, NULL, 86, NULL, 24, NULL, NULL, '0772853398', NULL, '', 'Kizanda', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'admin'),
(2396, 50, NULL, '', 'Aids Information Centre (Arua)', 12, 002, NULL, 7, NULL, 11, NULL, NULL, '0776248007', NULL, '', 'Nyiiro Herbert', '', 'Arua Regional Referal Hospital', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'admin'),
(2397, 2493, NULL, '', 'Outreach (URA)', 12, 002, NULL, 35, NULL, 41, NULL, NULL, '0753808181', NULL, '', 'Raymon CPHL', 'Kampala', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'admin'),
(2398, 23, NULL, '', 'Abako Elim H/C II', 5, 002, NULL, 102, NULL, 108, NULL, NULL, '0778898887', NULL, '', 'Omara Tonny', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'admin'),
(2399, 329, NULL, '', 'Jaguzi H/C II', 5, 002, NULL, 61, NULL, 117, NULL, NULL, '0752980122', NULL, '', 'Tiberimbwako Teddy', 'Mayuge', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'admin'),
(2400, 179, NULL, '', 'Alapata H/C II (Dokolo)', 5, 002, NULL, 22, NULL, 23, NULL, NULL, '0783415873', NULL, '', 'Abalo Agnes', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'admin'),
(2401, 478, NULL, '', 'Donna Carnevale Medical Centre', 10, 002, NULL, 67, NULL, 26, NULL, NULL, '0703650657', NULL, '', 'Mubarak', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'admin'),
(2402, 2493, NULL, '', 'Outreach Makerere', 12, 002, NULL, 35, NULL, 41, NULL, NULL, '0753808181', NULL, '', 'Raymon CPHL', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'admin'),
(2403, 2493, NULL, '', 'Mukwaya General Hospital', 9, 002, NULL, 35, NULL, 41, NULL, NULL, '0772902696', NULL, '', 'Sr Wanyenze Rita', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'admin'),
(2404, 698, NULL, '', 'Outreach Tororo', 12, 002, NULL, 85, NULL, 95, NULL, NULL, '0753808181', NULL, '', 'Raymon CPHL', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'admin'),
(2406, 2493, NULL, '', 'CPHL', 13, 002, NULL, 35, NULL, 41, NULL, NULL, '', NULL, '', 'Aeko Stephen', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'admin'),
(2407, 2493, NULL, '', 'Outreach Lugogo Grounds', 12, 002, NULL, 35, NULL, 41, NULL, NULL, '0774347122', NULL, '', 'Steven CPHL', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'admin'),
(2408, 2493, NULL, '', 'Outreach Uganda Meseum', 12, 002, NULL, 35, NULL, 41, NULL, NULL, '0774347122', NULL, '', 'Aeko Stephen', 'CPHL', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'admin'),
(2409, 2493, NULL, '', 'Kalege H/C II', 5, 002, NULL, 71, NULL, 41, NULL, NULL, '0771889800', NULL, '', 'Namatta Janet', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'admin'),
(2410, 712, NULL, '', 'Dramba H/C II', 5, 002, NULL, 87, NULL, 96, NULL, NULL, '0784340895', NULL, '', 'Acema Michael', 'yumbe', 'Yumbe HUB', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'admin'),
(2411, 470, NULL, '', 'Busunju H/C II', 5, 002, NULL, 64, NULL, 73, NULL, NULL, '0784756534', NULL, '', 'NABBOSA HELLEN', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'admin'),
(2412, 551, NULL, '', 'St Balikuddembe H/C III', 6, 002, NULL, 91, NULL, 106, NULL, NULL, '0786228002', NULL, '', 'Nabaweesi Sarah', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'admin'),
(2413, 23, NULL, '', 'Akura II', 5, 002, NULL, 102, NULL, 108, NULL, NULL, '0772635911', NULL, '', 'Ayoo Stella Grace', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'admin'),
(2414, 460, NULL, '', 'Aids Information Center(Mbale)', 10, 002, NULL, 62, NULL, 70, NULL, NULL, '', NULL, '', 'ACHOM', 'Mbale', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'admin'),
(2415, 224, NULL, '', 'Kagarama H/C II', 5, 002, NULL, 30, NULL, 33, NULL, NULL, '0773553369', NULL, '', 'Musinguzi Agatha', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'admin'),
(2416, 2493, NULL, '', 'Kampala Medical Chambers', 10, 002, NULL, 35, NULL, 41, NULL, NULL, '', NULL, '', '', 'Kampala', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'admin'),
(2417, 2493, NULL, '', 'Outreach Wakiso', 12, 002, NULL, 86, NULL, 41, NULL, NULL, '0774347122', NULL, '', 'Steven CPHL', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'admin'),
(2418, 187, NULL, '', 'Buziirasagama H/C II', 5, 002, NULL, 31, NULL, 25, NULL, NULL, '0756497019', NULL, '', 'Tumusiime Lameka', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'admin'),
(2419, 2493, NULL, '', 'Outreach Parliament', 12, 002, NULL, 35, NULL, 41, NULL, NULL, '0774347122', NULL, '', 'Aeko Stephen', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'admin'),
(2420, 2493, NULL, '', 'Kyadondo Medical Centre', 12, 002, NULL, 35, NULL, 41, NULL, NULL, '0701062885', NULL, '', 'Akram', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'admin'),
(2421, 451, NULL, '', 'Kirumba H/C II', 5, 002, NULL, 59, NULL, 68, NULL, NULL, '0787608422', NULL, '', 'Nanyonga Mirembe Milly', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'admin'),
(2422, 416, NULL, '', 'Charis H/C III', 6, 002, NULL, 54, NULL, 61, NULL, NULL, '0777113777,772738880', NULL, '', 'Ongom Bonny/Owera Tonny', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'admin'),
(2423, 425, NULL, '', 'Kibengo H/C III', 6, 002, NULL, 55, NULL, 63, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'admin'),
(2424, 56, NULL, '', 'Holy Innocents H/C III (Bukedea)', 6, 002, NULL, 12, NULL, 13, NULL, NULL, '0786947000', NULL, '', 'Eworo Julius', '', 'Atutur Hub ', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'admin'),
(2425, 2493, NULL, '', 'Millitary Police H/C III (Makindye)', 6, 002, NULL, 86, NULL, 41, NULL, NULL, '0777394045', NULL, '', 'Harriet N', 'Makindye', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'admin'),
(2426, 629, NULL, '', 'ST Charles Kabuwoko H/C III', 6, 002, NULL, 80, NULL, 83, NULL, NULL, '0759955030', NULL, '', 'Marie', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'admin'),
(2427, 2493, NULL, '', 'Case Hospital', 9, 002, NULL, 35, NULL, 41, NULL, NULL, '0772033552', NULL, '', 'NINGO GEOFFREY', 'KAMPALA', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'admin'),
(2428, 279, NULL, '', 'Buyaga H/C III', 6, 002, NULL, 94, NULL, 44, NULL, NULL, '0752614638', NULL, '', 'Miram Mutonyi', 'Bulambuli', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'admin'),
(2429, 149, NULL, '', 'Kalungi H/C III (Kalungu)', 6, 002, NULL, 90, NULL, 100, NULL, NULL, '0785012625', NULL, '', 'Andrew', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'admin'),
(2430, 608, NULL, '', 'Ogom H/C III', 6, 002, NULL, 78, NULL, 107, NULL, NULL, '0782540454', NULL, '', 'Aber Margaret', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'admin'),
(2431, 2493, NULL, '', 'Henrob Medical Centre', 10, 002, NULL, 86, NULL, 41, NULL, NULL, '0776239291', NULL, '', 'Namuwanga Hellen', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'admin'),
(2433, 204, NULL, '', 'Nsale H/C II', 5, 002, NULL, 26, NULL, 29, NULL, NULL, '0755751157', NULL, '', 'Isabirye Mawazi', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'admin'),
(2434, 2493, NULL, '', 'Outreach Ndeeba', 12, 002, NULL, 35, NULL, 41, NULL, NULL, '0774347122', NULL, '', 'Aeko Stephen', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'admin'),
(2435, 311, NULL, '', 'Kasobi H/C III', 6, 002, NULL, 11, NULL, 48, NULL, NULL, '0777822688', NULL, '', 'Namusisi Ritah', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'admin'),
(2436, 50, NULL, '', 'Oluko Solidale H/C III', 6, 002, NULL, 7, NULL, 11, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'admin'),
(2437, 50, NULL, '', 'St Assumpta H/C III', 6, 002, NULL, 7, NULL, 11, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'admin'),
(2438, 2493, NULL, '', 'Benedict Medical Centre', 10, 002, NULL, 35, NULL, 41, NULL, NULL, '0788336378', NULL, '', 'Owere Gerald', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'admin'),
(2439, 149, NULL, '', 'Kigasa H/C II', 5, 002, NULL, 90, NULL, 100, NULL, NULL, '0776111333', NULL, '', 'Nalwadda Jane', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'admin'),
(2440, 705, NULL, '', 'Family Care Hospital', 9, 002, NULL, 86, NULL, 116, NULL, NULL, '0786514531', NULL, '', 'Nyamgoma Gladys', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'admin'),
(2441, 279, NULL, '', 'Buyeka H/C III', 6, 002, NULL, 94, NULL, 44, NULL, NULL, '0783422933', NULL, '', 'Mutonyi Florence', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'admin'),
(2442, 360, NULL, '', 'Angagura H/C III', 6, 002, NULL, 78, NULL, 56, NULL, NULL, '0785493913', NULL, '', 'Akello Judith', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'admin'),
(2443, 398, NULL, '', 'Migamba H/C II', 5, 002, NULL, 51, NULL, 58, NULL, NULL, '0789877177', NULL, '', 'Jackline Nuwahereza', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'admin'),
(2444, 439, NULL, '', 'Patika H/C II', 5, 002, NULL, 53, NULL, 65, NULL, NULL, '0782532787', NULL, '', 'Arach Alice Nyeko', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'admin'),
(2445, 2493, NULL, '', 'Chandaria Medical Centre', 10, 002, NULL, 35, NULL, 41, NULL, NULL, '0773146462', NULL, '', 'Lubangakene Israel', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'admin'),
(2446, 614, NULL, '', 'Nagwere H/C III', 6, 002, NULL, 79, NULL, 82, NULL, NULL, '0776008574', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'admin'),
(2447, 649, NULL, '', 'Nkabbani H/C III', 6, 002, NULL, 37, NULL, 101, NULL, NULL, '0789222206', NULL, '', 'Twesiime Wyclife', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'admin'),
(2448, 341, NULL, '', '305 Brigade Kavera H/C III', 6, 002, NULL, 40, NULL, 52, NULL, NULL, '0775187626', NULL, '', 'Herbert', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'admin'),
(2449, 406, NULL, '', 'St Philips H/C II', 5, 002, NULL, 23, NULL, 102, NULL, NULL, '0775333316', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'admin'),
(2450, 2493, NULL, '', 'Emergency Operations Centre', 12, 002, NULL, 35, NULL, 41, NULL, NULL, '0753808181', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'admin'),
(2451, 2493, NULL, '', 'Aids Information Centre (Kampala)', 12, 002, NULL, 35, NULL, 41, NULL, NULL, '0776248007', NULL, '', 'Herbert', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'admin'),
(2452, 211, NULL, '', 'Karwensanga H/C II', 5, 002, NULL, 63, NULL, 71, NULL, NULL, '0775296080', NULL, '', 'Byanyima F', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'admin'),
(2453, 649, NULL, '', 'Rwenzori Medical Centre', 12, 002, NULL, 37, NULL, 101, NULL, NULL, '0773277846', NULL, '', 'Ategeka Andrew', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'admin'),
(2454, 137, NULL, '', 'Bushenyi H/C III', 6, 002, NULL, 9, NULL, 19, NULL, NULL, '0782787148', NULL, '', 'Kalyetsi Rogers', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'admin'),
(2455, 195, NULL, '', 'St Luke H/C II (Gulu)', 5, 002, NULL, 23, NULL, 27, NULL, NULL, '0785547921', NULL, '', 'Goretty Nancy', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'admin'),
(2456, 438, NULL, '', 'Bulwadda H/C II', 5, 002, NULL, 89, NULL, 122, NULL, NULL, '0755874093', NULL, '', 'Nakaweesi Eunice', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'admin'),
(2457, 649, NULL, '', 'Kabambiro H/C III', 6, 002, NULL, 37, NULL, 101, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'admin'),
(2458, 472, NULL, '', 'Morulinga H/C II', 5, 002, NULL, 105, NULL, 74, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'admin'),
(2459, 195, NULL, '', 'Abwoch H/C II', 5, 002, NULL, 23, NULL, 27, NULL, NULL, '0779755726', NULL, '', 'Arach Filda', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'admin'),
(2460, 460, NULL, '', 'Buwangwa H/C III', 6, 002, NULL, 62, NULL, 70, NULL, NULL, '', NULL, '', 'Kabuya Salama', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'admin'),
(2461, 2493, NULL, '', 'Span Medicare Kisaasi', 12, 002, NULL, 35, NULL, 41, NULL, NULL, '0785200809', NULL, '', 'Awino Mariam', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'admin'),
(2462, 313, NULL, '', 'Kansambwe H/C II', 5, 002, NULL, 69, NULL, 49, NULL, NULL, '0774310376', NULL, '', 'Bulyaba Esther', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'admin'),
(2463, 279, NULL, '', 'Masira H/C III', 6, 002, NULL, 94, NULL, 44, NULL, NULL, '0703487426', NULL, '', 'Seela Damali', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'admin'),
(2464, 659, NULL, '', 'Rulongo H/C II', 5, 002, NULL, 27, NULL, 87, NULL, NULL, '0700349175', NULL, '', 'Niwarinda Simon', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'admin'),
(2465, 2493, NULL, '', 'Outreach Mulago', 12, 002, NULL, 35, NULL, 41, NULL, NULL, '', NULL, '', 'Raymon', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'admin'),
(2466, 50, NULL, '', 'Otumbari H/C III', 6, 002, NULL, 7, NULL, 11, NULL, NULL, '0780710075', NULL, '', 'Vincent', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'admin'),
(2467, 406, NULL, '', 'Dream Centre Uganda', 12, 002, NULL, 23, NULL, 102, NULL, NULL, '0783742459', NULL, '', 'Anena Vicky', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'admin'),
(2468, 42, NULL, '', 'Apire H/C III', 6, 002, NULL, 6, NULL, 104, NULL, NULL, '0773577763', NULL, '', 'Olung Tom', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'admin'),
(2469, 650, NULL, '', 'Rwabarata H/C II', 5, 002, NULL, 45, NULL, 86, NULL, NULL, '0787978075', NULL, '', 'MUHWEZI MOSES', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'admin'),
(2470, 650, NULL, '', 'Kashangi H/C III', 6, 002, NULL, 45, NULL, 86, NULL, NULL, '0782766190', NULL, '', 'NATUKUNDA CLEOPHAS', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'admin'),
(2471, 531, NULL, '', 'Pakinach H/C IV', 7, 002, NULL, 74, NULL, 78, NULL, NULL, '0772900764', NULL, '', 'AMA MANANO IMMACULATE', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'admin'),
(2472, 86, NULL, '', 'Shared Blessings H/C III', 6, 002, NULL, 83, NULL, 114, NULL, NULL, '0751544198', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'admin'),
(2473, 425, NULL, '', 'St Kizito H/C III', 6, 002, NULL, 55, NULL, 63, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'admin'),
(2474, 211, NULL, '', 'Mayanja Memorial Hospital', 9, 002, NULL, 63, NULL, 71, NULL, NULL, '0773944259', NULL, '', 'Julian', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'admin'),
(2475, 191, NULL, '', 'Kanziira H/C II', 5, 002, NULL, 89, NULL, 26, NULL, NULL, '0772452238', NULL, '', 'Nabatanzi Harriet', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'admin'),
(2476, 2493, NULL, '', 'Rift Valley Medical Centre', 10, 002, NULL, 35, NULL, 41, NULL, NULL, '0772685456', NULL, '', 'Dr. John Ariganyira', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'admin'),
(2477, 460, NULL, '', 'Budwale H/C III', 6, 002, NULL, 62, NULL, 70, NULL, NULL, '0779733968', NULL, '', 'Malinga Samuel', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'admin'),
(2478, 38, NULL, '', 'Lulyango H/C II', 5, 002, NULL, 106, NULL, 10, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'admin'),
(2479, 329, NULL, '', 'Bugoto H/C II', 5, 002, NULL, 61, NULL, 117, NULL, NULL, '0780561378', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'admin'),
(2480, 705, NULL, '', 'Hassan Tourabi', 3, 002, NULL, 86, NULL, 116, NULL, NULL, '0759528258', NULL, 'justinokiring@gmail.com', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'admin'),
(2481, 23, NULL, '', 'Obim H/C', 4, 002, NULL, 102, NULL, 108, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'admin'),
(2482, 438, NULL, '', 'Kyayi H/C III', 6, 002, NULL, 89, NULL, 122, NULL, NULL, '0751862494', NULL, '', 'Nalwoga Ruth', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'admin'),
(2483, 341, NULL, '', 'Rukoki H/C III', 6, 002, NULL, 40, NULL, 52, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'admin'),
(2484, NULL, NULL, '', 'Kamuli District Govt Hospital', 9, 002, NULL, 36, NULL, 42, 8, 'Kamuli Hub', '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'admin'),
(2485, 124, NULL, '', 'Outreach Bundibugyo', 12, 002, NULL, 15, NULL, 18, NULL, NULL, '', NULL, '', 'Raymon', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'admin'),
(2486, 2484, NULL, '', 'Kiige H/C II', 5, 002, NULL, 36, NULL, 42, NULL, NULL, '', NULL, '', '', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'admin'),
(2487, 195, NULL, '', 'Tegot H/CII', 5, 002, NULL, 23, NULL, 27, NULL, NULL, '0782841055', NULL, '', 'Okee Betty', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'admin'),
(2488, 187, NULL, '', 'Kabonero H/C III', 6, 002, NULL, 31, NULL, 25, NULL, NULL, '0783851005', NULL, '', 'Tukwasiibwe C', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'admin'),
(2489, 2493, NULL, '', 'Mulago National Referal', 11, 002, NULL, 35, NULL, 41, NULL, NULL, '0772505643', NULL, '', 'Deogratias', '', '', NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', 'admin'),
(2493, NULL, NULL, NULL, 'UNHLS', 5, 002, NULL, 35, NULL, 41, 14, 'Kampala Hub', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-15 16:14:16', '2017-10-15 16:14:16', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `facilitylevel`
--

DROP TABLE IF EXISTS `facilitylevel`;
CREATE TABLE `facilitylevel` (
  `id` smallint(2) UNSIGNED NOT NULL,
  `level` varchar(100) NOT NULL,
  `created` datetime NOT NULL,
  `createdby` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `facilitylevel`
--

INSERT INTO `facilitylevel` (`id`, `level`, `created`, `createdby`) VALUES
(3, 'Clinic', '0000-00-00 00:00:00', ''),
(4, 'H/C ', '0000-00-00 00:00:00', ''),
(5, 'H/C II', '0000-00-00 00:00:00', ''),
(6, 'H/C III', '0000-00-00 00:00:00', ''),
(7, 'H/C IV', '0000-00-00 00:00:00', ''),
(8, 'Health Care Center', '0000-00-00 00:00:00', ''),
(9, 'Hospital', '0000-00-00 00:00:00', ''),
(10, 'Medical Centre', '0000-00-00 00:00:00', ''),
(11, 'Regional Referral Hospital', '0000-00-00 00:00:00', ''),
(12, 'Special Clinic', '0000-00-00 00:00:00', ''),
(13, 'LAB', '2015-08-28 02:06:10', 'system');

-- --------------------------------------------------------

--
-- Table structure for table `gram_break_points`
--

DROP TABLE IF EXISTS `gram_break_points`;
CREATE TABLE `gram_break_points` (
  `id` int(10) UNSIGNED NOT NULL,
  `drug_id` int(10) UNSIGNED NOT NULL,
  `gram_stain_range_id` int(10) UNSIGNED NOT NULL,
  `resistant_max` decimal(4,1) DEFAULT NULL,
  `intermediate_min` decimal(4,1) DEFAULT NULL,
  `intermediate_max` decimal(4,1) DEFAULT NULL,
  `sensitive_min` decimal(4,1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gram_drug_susceptibility`
--

DROP TABLE IF EXISTS `gram_drug_susceptibility`;
CREATE TABLE `gram_drug_susceptibility` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `drug_id` int(10) UNSIGNED NOT NULL,
  `gram_stain_result_id` int(10) UNSIGNED NOT NULL,
  `drug_susceptibility_measure_id` int(10) UNSIGNED NOT NULL,
  `zone_diameter` int(10) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gram_stain_ranges`
--

DROP TABLE IF EXISTS `gram_stain_ranges`;
CREATE TABLE `gram_stain_ranges` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `gram_stain_ranges`
--

INSERT INTO `gram_stain_ranges` (`id`, `name`) VALUES
(1, 'No organism seen'),
(2, 'Gram positive cocci in singles'),
(3, 'Gram positive cocci in chains'),
(4, 'Gram positive cocci in clusters'),
(5, 'Gram positive diplococci'),
(6, 'Gram positive micrococci'),
(7, 'Gram positive rods'),
(8, 'Gram positive rods with terminal spores'),
(9, 'Gram positive rods with sub-terminal spores'),
(10, 'Gram positive rods with endospores'),
(11, 'Gram negative diplococci'),
(12, 'Gram negative intracellular diplococci'),
(13, 'Gram negative extracellular diplococci'),
(14, 'Gram negative rods'),
(15, 'Gram positive yeast cells'),
(16, 'Gram negative pleomorphic rods'),
(17, '+ Gram positive cocci in singles'),
(18, '+ Gram positive cocci in chains'),
(19, '+ Gram positive cocci in clusters'),
(20, '+ Gram positive diplococci'),
(21, '+ Gram positive micrococci'),
(22, '+ Gram positive rods'),
(23, '+ Gram positive rods with terminal spores'),
(24, '+ Gram positive rods with sub-terminal spores'),
(25, '+ Gram positive rods with endospores'),
(26, '+ Gram negative diplococci'),
(27, '+ Gram negative intracellular diplococci'),
(28, '+ Gram negative extracellular diplococci'),
(29, '+ Gram negative rods'),
(30, '+ Gram positive yeast cells'),
(31, '+ Gram negative pleomorphic rods'),
(32, '++ Gram positive cocci in singles'),
(33, '++ Gram positive cocci in chains'),
(34, '++ Gram positive cocci in clusters'),
(35, '++ Gram positive diplococci'),
(36, '++ Gram positive micrococci'),
(37, '++ Gram positive rods'),
(38, '++ Gram positive rods with terminal spores'),
(39, '++ Gram positive rods with sub-terminal spores'),
(40, '++ Gram positive rods with endospores'),
(41, '++ Gram negative diplococci'),
(42, '++ Gram negative intracellular diplococci'),
(43, '++ Gram negative extracellular diplococci'),
(44, '++ Gram negative rods'),
(45, '++ Gram positive yeast cells'),
(46, '++ Gram negative pleomorphic rods'),
(47, '+++ Gram positive cocci in singles'),
(48, '+++ Gram positive cocci in chains'),
(49, '+++ Gram positive cocci in clusters'),
(50, '+++ Gram positive diplococci'),
(51, '+++ Gram positive micrococci'),
(52, '+++ Gram positive rods'),
(53, '+++ Gram positive rods with terminal spores'),
(54, '+++ Gram positive rods with sub-terminal spores'),
(55, '+++ Gram positive rods with endospores'),
(56, '+++ Gram negative diplococci'),
(57, '+++ Gram negative intracellular diplococci'),
(58, '+++ Gram negative extracellular diplococci'),
(59, '+++ Gram negative rods'),
(60, '+++ Gram positive yeast cells'),
(61, '+++ Gram negative pleomorphic rods');

-- --------------------------------------------------------

--
-- Table structure for table `gram_stain_results`
--

DROP TABLE IF EXISTS `gram_stain_results`;
CREATE TABLE `gram_stain_results` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `test_id` int(10) UNSIGNED NOT NULL,
  `gram_stain_range_id` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hb_patient`
--

DROP TABLE IF EXISTS `hb_patient`;
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
  `deleted_at` datetime DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hb_patient`
--

INSERT INTO `hb_patient` (`id`, `facilityid`, `hubid`, `districtid`, `locatorid`, `otherid`, `patientname`, `patientid`, `sex`, `age`, `telephonenumber`, `hbeagresult`, `hbsagresult`, `hbdiagonosisdate`, `hbaltvalue`, `hbastvalue`, `hbplateletcount`, `asltorpltgreaterthantwo`, `fetalprotainvalue`, `otherhbpreliminaryfindings`, `coinfectionhivhbsag`, `coinfectionhdvhbsag`, `coinfectionhcvhbsag`, `otherhbconinfections`, `isonhptreatment`, `hbinitiationdate`, `hbdrudtype`, `isonhivtreatment`, `hivinitiationdate`, `hivdrugtype`, `lastroutineviralloaddate`, `lastroutineviralloadsampletype`, `lastroutineviralloadvalue`, `lastrepeatviralloaddate`, `lastrepeatviralloadvalue`, `lastrepeatviralloadsampletype`, `samplecollectiondate`, `sampletypecollected`, `samplereceptiondate`, `labtechnitian`, `createdby`, `created_at`, `updated_at`, `lastupdatedby`, `deleted_at`, `status`) VALUES
(1, 1974, 4, 1, '844-fi', 4294967295, 'Patientc', '657449', 2, '78.00', '0702859491', 1, 2, '2018-02-13 00:00:00', '0.320', '0.430', '0.859', 0, '0.908', 0x6e6f6e65, 1, 1, 1, 'afdasf', 1, '2018-02-19 00:00:00', 4, 1, '2018-02-12 00:00:00', 1, '2018-02-21 00:00:00', 1, '0.879', '2018-02-15 00:00:00', '0.987', 1, '2018-02-06 00:00:00', 1, '2018-02-21 00:00:00', 'Jackie', 1, '2018-02-03 09:44:57', '2018-02-03 09:44:57', NULL, NULL, 0),
(3, 1209, 10, 2, '68486', 4294967295, 'Kasimula', '4', 2, '8.00', '0701370078', 1, 1, '2018-02-14 00:00:00', '0.658', '0.435', '0.640', 1, '0.453', 0x6173, 1, 0, 1, '', 0, '2018-02-14 00:00:00', 2, 1, '2018-02-28 00:00:00', 0, '2018-02-14 00:00:00', 1, '0.54', '2018-02-14 00:00:00', '0.467', 2, '2018-02-21 00:00:00', 1, '2018-02-21 00:00:00', 'Pasit', 1, '2018-02-03 10:49:18', '2018-02-09 14:05:45', NULL, NULL, 0),
(4, 47, 31, 3, '958485-0', 4294967295, 'kantint', '860000', 1, '67.00', '0779507910', 1, 2, '2018-02-01 00:00:00', '0.670', '0.679', '0.674', 0, '0.68', '', 0, 1, 0, '', 0, '2018-02-02 00:00:00', 2, 0, '2018-02-02 00:00:00', 0, '2018-02-01 00:00:00', 1, '0.45', '2018-02-14 00:00:00', '0.54', 1, '2018-02-08 00:00:00', 2, '2018-02-21 00:00:00', 'allan', 2, '2018-02-07 13:21:22', '2018-02-09 14:05:45', NULL, NULL, 0),
(5, 47, 31, 3, '58674', 95941, 'Patint', '870000', 2, '71.00', '0709486747', 1, 2, '2018-02-07 13:23:25', '0.996', '0.098', '0.099', 1, '0.98', NULL, 1, 0, 1, NULL, 4, '2018-02-07 13:24:41', 2, 1, '2018-02-07 13:24:49', 1, '2018-02-07 13:25:02', 1, '0.65', '2018-02-07 13:25:10', '0.98', 1, '2018-02-07 13:25:22', 1, '2018-02-07 13:25:30', 'Martha', 1, '2018-02-07 13:25:40', '2018-02-07 13:25:47', NULL, NULL, 0),
(6, 1974, 4, 1, '844-fi', 4294967295, 'Milen', '6574', 2, '78.00', '0702859491', 1, 2, '2018-02-13 00:00:00', '0.320', '0.430', '0.859', 0, '0.908', 0x6e6f6e65, 1, 1, 1, 'afdasf', 1, '2018-02-19 00:00:00', 4, 1, '2018-02-12 00:00:00', 1, '2018-02-21 00:00:00', 1, '0.879', '2018-02-15 00:00:00', '0.987', 1, '2018-02-06 00:00:00', 1, '2018-02-21 00:00:00', 'Jackie', 1, '2018-02-03 09:44:57', '2018-02-09 14:13:40', NULL, NULL, 0),
(7, 1209, 10, 2, '68486', 4294967295, 'Juba', '40405', 2, '8.00', '0701370078', 1, 1, '2018-02-14 00:00:00', '0.658', '0.435', '0.640', 1, '0.453', 0x6173, 1, 0, 1, '', 0, '2018-02-14 00:00:00', 2, 1, '2018-02-28 00:00:00', 0, '2018-02-14 00:00:00', 1, '0.54', '2018-02-14 00:00:00', '0.467', 2, '2018-02-21 00:00:00', 1, '2018-02-21 00:00:00', 'Pasit', 1, '2018-02-03 10:49:18', '2018-02-09 13:36:46', NULL, NULL, 0),
(8, 47, 31, 3, '958485-0', 4294967295, 'Tines', '86003', 1, '67.00', '0779507910', 1, 2, '2018-02-01 00:00:00', '0.670', '0.679', '0.674', 0, '0.68', '', 0, 1, 0, '', 0, '2018-02-02 00:00:00', 2, 0, '2018-02-02 00:00:00', 0, '2018-02-01 00:00:00', 1, '0.45', '2018-02-14 00:00:00', '0.54', 1, '2018-02-08 00:00:00', 2, '2018-02-21 00:00:00', 'allan', 2, '2018-02-07 13:21:22', '2018-02-07 13:21:22', NULL, NULL, 0),
(9, 47, 31, 3, '58674', 95941, 'Patint', '87004', 2, '71.00', '0709486747', 1, 2, '2018-02-07 13:23:25', '0.996', '0.098', '0.099', 1, '0.98', NULL, 1, 0, 1, NULL, 4, '2018-02-07 13:24:41', 2, 1, '2018-02-07 13:24:49', 1, '2018-02-07 13:25:02', 1, '0.65', '2018-02-07 13:25:10', '0.98', 1, '2018-02-07 13:25:22', 1, '2018-02-07 13:25:30', 'Martha', 1, '2018-02-07 13:25:40', '2018-02-07 13:25:47', NULL, NULL, 0),
(10, 1974, 4, 1, '844-fi', 4294967295, 'Kajan', '6234', 2, '78.00', '0702859491', 1, 2, '2018-02-13 00:00:00', '0.320', '0.430', '0.859', 0, '0.908', 0x6e6f6e65, 1, 1, 1, 'afdasf', 1, '2018-02-19 00:00:00', 4, 1, '2018-02-12 00:00:00', 1, '2018-02-21 00:00:00', 1, '0.879', '2018-02-15 00:00:00', '0.987', 1, '2018-02-06 00:00:00', 1, '2018-02-21 00:00:00', 'Jackie', 1, '2018-02-03 09:44:57', '2018-02-09 13:47:59', NULL, NULL, 0),
(11, 1209, 10, 2, '68486', 4294967295, 'Pain', '40103', 2, '8.00', '0701370078', 1, 1, '2018-02-14 00:00:00', '0.658', '0.435', '0.640', 1, '0.453', 0x6173, 1, 0, 1, '', 0, '2018-02-14 00:00:00', 2, 1, '2018-02-28 00:00:00', 0, '2018-02-14 00:00:00', 1, '0.54', '2018-02-14 00:00:00', '0.467', 2, '2018-02-21 00:00:00', 1, '2018-02-21 00:00:00', 'Pasit', 1, '2018-02-03 10:49:18', '2018-02-09 14:13:40', NULL, NULL, 0),
(12, 47, 31, 3, '958485-0', 4294967295, 'Tuness', '860453', 1, '67.00', '0779507910', 1, 2, '2018-02-01 00:00:00', '0.670', '0.679', '0.674', 0, '0.68', '', 0, 1, 0, '', 0, '2018-02-02 00:00:00', 2, 0, '2018-02-02 00:00:00', 0, '2018-02-01 00:00:00', 1, '0.45', '2018-02-14 00:00:00', '0.54', 1, '2018-02-08 00:00:00', 2, '2018-02-21 00:00:00', 'allan', 2, '2018-02-07 13:21:22', '2018-02-07 13:21:22', NULL, NULL, 0),
(13, 47, 31, 3, '58674', 95941, 'Punck', '059584', 2, '71.00', '0709486747', 1, 2, '2018-02-07 13:23:25', '0.996', '0.098', '0.099', 1, '0.98', NULL, 1, 0, 1, NULL, 4, '2018-02-07 13:24:41', 2, 1, '2018-02-07 13:24:49', 1, '2018-02-07 13:25:02', 1, '0.65', '2018-02-07 13:25:10', '0.98', 1, '2018-02-07 13:25:22', 1, '2018-02-07 13:25:30', 'Martha', 1, '2018-02-07 13:25:40', '2018-02-07 13:25:47', NULL, NULL, 0),
(14, 1974, 4, 1, '844-fi', 4294967295, 'Pony', '65574', 2, '78.00', '0702859491', 1, 2, '2018-02-13 00:00:00', '0.320', '0.430', '0.859', 0, '0.908', 0x6e6f6e65, 1, 1, 1, 'afdasf', 1, '2018-02-19 00:00:00', 4, 1, '2018-02-12 00:00:00', 1, '2018-02-21 00:00:00', 1, '0.879', '2018-02-15 00:00:00', '0.987', 1, '2018-02-06 00:00:00', 1, '2018-02-21 00:00:00', 'Jackie', 1, '2018-02-03 09:44:57', '2018-02-03 09:44:57', NULL, NULL, 0),
(15, 1209, 10, 2, '68486', 4294967295, 'Piay', '300405', 2, '8.00', '0701370078', 1, 1, '2018-02-14 00:00:00', '0.658', '0.435', '0.640', 1, '0.453', 0x6173, 1, 0, 1, '', 0, '2018-02-14 00:00:00', 2, 1, '2018-02-28 00:00:00', 0, '2018-02-14 00:00:00', 1, '0.54', '2018-02-14 00:00:00', '0.467', 2, '2018-02-21 00:00:00', 1, '2018-02-21 00:00:00', 'Pasit', 1, '2018-02-03 10:49:18', '2018-02-05 13:04:51', NULL, NULL, 0),
(16, 47, 31, 3, '958485-0', 4294967295, 'Ant', '186003', 1, '67.00', '0779507910', 1, 2, '2018-02-01 00:00:00', '0.670', '0.679', '0.674', 0, '0.68', '', 0, 1, 0, '', 0, '2018-02-02 00:00:00', 2, 0, '2018-02-02 00:00:00', 0, '2018-02-01 00:00:00', 1, '0.45', '2018-02-14 00:00:00', '0.54', 1, '2018-02-08 00:00:00', 2, '2018-02-21 00:00:00', 'allan', 2, '2018-02-07 13:21:22', '2018-02-09 15:02:42', NULL, NULL, 1),
(17, 47, 31, 3, '58674', 95941, 'Kayn', '97004', 2, '71.00', '0709486747', 1, 2, '2018-02-07 13:23:25', '0.996', '0.098', '0.099', 1, '0.98', NULL, 1, 0, 1, NULL, 4, '2018-02-07 13:24:41', 2, 1, '2018-02-07 13:24:49', 1, '2018-02-07 13:25:02', 1, '0.65', '2018-02-07 13:25:10', '0.98', 1, '2018-02-07 13:25:22', 1, '2018-02-07 13:25:30', 'Martha', 1, '2018-02-07 13:25:40', '2018-02-09 14:03:52', NULL, NULL, 0),
(18, 1974, 4, 1, '844-fi', 4294967295, 'Lawn', '76234', 2, '78.00', '0702859491', 1, 2, '2018-02-13 00:00:00', '0.320', '0.430', '0.859', 0, '0.908', 0x6e6f6e65, 1, 1, 1, 'afdasf', 1, '2018-02-19 00:00:00', 4, 1, '2018-02-12 00:00:00', 1, '2018-02-21 00:00:00', 1, '0.879', '2018-02-15 00:00:00', '0.987', 1, '2018-02-06 00:00:00', 1, '2018-02-21 00:00:00', 'Jackie', 1, '2018-02-03 09:44:57', '2018-02-09 14:13:40', NULL, NULL, 0),
(19, 1209, 10, 2, '68486', 4294967295, 'Andante', '9040103', 2, '8.00', '0701370078', 1, 1, '2018-02-14 00:00:00', '0.658', '0.435', '0.640', 1, '0.453', 0x6173, 1, 0, 1, '', 0, '2018-02-14 00:00:00', 2, 1, '2018-02-28 00:00:00', 0, '2018-02-14 00:00:00', 1, '0.54', '2018-02-14 00:00:00', '0.467', 2, '2018-02-21 00:00:00', 1, '2018-02-21 00:00:00', 'Pasit', 1, '2018-02-03 10:49:18', '2018-02-09 15:02:42', NULL, NULL, 1),
(20, 47, 31, 3, '958485-0', 4294967295, 'Fredn', '956453', 1, '67.00', '0779507910', 1, 2, '2018-02-01 00:00:00', '0.670', '0.679', '0.674', 0, '0.68', '', 0, 1, 0, '', 0, '2018-02-02 00:00:00', 2, 0, '2018-02-02 00:00:00', 0, '2018-02-01 00:00:00', 1, '0.45', '2018-02-14 00:00:00', '0.54', 1, '2018-02-08 00:00:00', 2, '2018-02-21 00:00:00', 'allan', 2, '2018-02-07 13:21:22', '2018-02-09 15:02:42', NULL, NULL, 1),
(21, 47, 31, 3, '58674', 95941, 'Plura', '06978', 2, '71.00', '0709486747', 1, 2, '2018-02-07 13:23:25', '0.996', '0.098', '0.099', 1, '0.98', NULL, 1, 0, 1, NULL, 4, '2018-02-07 13:24:41', 2, 1, '2018-02-07 13:24:49', 1, '2018-02-07 13:25:02', 1, '0.65', '2018-02-07 13:25:10', '0.98', 1, '2018-02-07 13:25:22', 1, '2018-02-07 13:25:30', 'Martha', 1, '2018-02-07 13:25:40', '2018-02-07 13:25:47', NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `hb_patientworksheet`
--

DROP TABLE IF EXISTS `hb_patientworksheet`;
CREATE TABLE `hb_patientworksheet` (
  `id` int(11) UNSIGNED NOT NULL,
  `hbpatientid` int(11) UNSIGNED NOT NULL,
  `worksheetid` int(11) UNSIGNED NOT NULL,
  `barcode` blob NOT NULL,
  `created_at` datetime NOT NULL,
  `createdby` int(11) UNSIGNED NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `lastupdatedby` int(11) UNSIGNED DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hb_patientworksheet`
--

INSERT INTO `hb_patientworksheet` (`id`, `hbpatientid`, `worksheetid`, `barcode`, `created_at`, `createdby`, `updated_at`, `lastupdatedby`, `deleted_at`) VALUES
(32, 19, 12, '', '2018-02-09 15:02:42', 4, '2018-02-09 15:02:42', NULL, NULL),
(33, 16, 12, '', '2018-02-09 15:02:42', 4, '2018-02-09 15:02:42', NULL, NULL),
(34, 20, 12, '', '2018-02-09 15:02:42', 4, '2018-02-09 15:02:42', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `hb_worksheet`
--

DROP TABLE IF EXISTS `hb_worksheet`;
CREATE TABLE `hb_worksheet` (
  `id` int(11) UNSIGNED NOT NULL,
  `refnumber` int(11) UNSIGNED NOT NULL,
  `machinetype` int(11) UNSIGNED NOT NULL,
  `sampletype` int(11) UNSIGNED NOT NULL,
  `sampleprep` varchar(250) NOT NULL,
  `sampleprepexpirydate` datetime NOT NULL,
  `bulklysisbuffer` varchar(250) NOT NULL,
  `bulklysisbufferexpirydate` datetime DEFAULT NULL,
  `control` varchar(250) NOT NULL,
  `controlexpirydate` datetime NOT NULL,
  `calibrator` varchar(250) NOT NULL,
  `calibratorexpirydate` datetime NOT NULL,
  `amplificationkit` varchar(250) NOT NULL,
  `amplificationkitexpirydate` datetime NOT NULL,
  `assaydate` datetime NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL,
  `createdby` int(11) UNSIGNED NOT NULL,
  `lastupdatedate` datetime DEFAULT NULL,
  `lastupdatedby` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hb_worksheet`
--

INSERT INTO `hb_worksheet` (`id`, `refnumber`, `machinetype`, `sampletype`, `sampleprep`, `sampleprepexpirydate`, `bulklysisbuffer`, `bulklysisbufferexpirydate`, `control`, `controlexpirydate`, `calibrator`, `calibratorexpirydate`, `amplificationkit`, `amplificationkitexpirydate`, `assaydate`, `status`, `created_at`, `updated_at`, `deleted_at`, `createdby`, `lastupdatedate`, `lastupdatedby`) VALUES
(12, 4294967295, 1, 2, '34', '2018-02-16 00:00:00', 'we', '2018-02-16 00:00:00', '34', '2018-02-15 00:00:00', '32', '2018-02-16 00:00:00', '3', '2018-02-15 00:00:00', '2018-02-23 00:00:00', 1, '2018-02-09 15:01:49', '2018-02-09 15:02:42', '0000-00-00 00:00:00', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `hub`
--

DROP TABLE IF EXISTS `hub`;
CREATE TABLE `hub` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(250) NOT NULL,
  `facility` varchar(250) DEFAULT NULL,
  `facilityid` int(11) UNSIGNED DEFAULT NULL,
  `email` varchar(250) NOT NULL,
  `address` varchar(250) NOT NULL,
  `healthregionid` int(11) UNSIGNED DEFAULT NULL,
  `ipid` int(11) UNSIGNED DEFAULT NULL,
  `createdby` int(11) UNSIGNED DEFAULT NULL,
  `coordinatorid` int(11) UNSIGNED DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hub`
--

INSERT INTO `hub` (`id`, `name`, `facility`, `facilityid`, `email`, `address`, `healthregionid`, `ipid`, `createdby`, `coordinatorid`, `created_at`, `updated_at`) VALUES
(4, 'Aber Hub', 'Aber Hospital', 3, '', '', 4, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 'Abim Hub', 'Abim Hospital', 4, '', '', 1, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 'Adjumani Hub', 'Adjumani Hospital', 10, '', '', 3, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 'Amolatar Hub', 'Amolatar H/C IV', 31, '', '', 4, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 'Amuria Hub', 'Amuria H/C IV', 36, '', '', 5, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 'Anaka Hub', 'Anaka Hospital', 38, '', '', 2, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 'Arua Hub', 'Arua R R Hospital', 50, '', '', 3, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, 'Atiak Hub', 'Atiak H/C IV', 53, '', '', 2, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, 'Atutur Hub', 'Atutur Hospital', 56, '', '', 5, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, 'Bugiri Hub', 'Bugiri Hospital', 99, '', '', 8, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(16, 'Buliisa Hub', 'Buliisa H/C IV', 121, '', '', 6, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(17, 'Bumanya Hub', 'Bumanya H/C IV', 123, '', '', 8, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(18, 'Bundibugyo Hub', 'Bundibugyo Hospital', 124, '', '', 9, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(19, 'Bushenyi Hub', 'Bushenyi H/C IV', 137, '', '', 12, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(20, 'Busolwe Hub', 'Busolwe Hospital', 144, '', '', 7, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(21, 'Buyinja Hub', 'Buyinja H/C IV', 160, '', '', 8, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(23, 'Dokolo Hub', 'Dokolo H/C IV', 179, '', '', 4, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(24, 'Entebbe Hub', 'Entebbe Grade B Hospital', 788, '', '', 10, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(25, 'FortPortal Hub', 'FortPortal R R Hospital', 187, '', '', 9, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(26, 'Gombe Hub', 'Gombe Hospital ', 191, '', '', 10, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(27, 'Gulu Hub', 'Gulu R R Hospital', 195, '', '', 2, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(28, 'Hoima Hub', 'Hoima R R Hospital', 199, '', '', 6, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(29, 'Iganga Hub', 'Iganga Hospital', 204, '', '', 8, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(30, 'Itojo Hub', 'Itojo Hospital', 212, '', '', 12, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(31, 'Jinja Hub', 'Jinja R R Hospital ', 222, '', '', 8, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(32, 'Kaabong Hub', 'Kaabong Hospital', 223, '', '', 1, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(33, 'Kabale Hub', 'Kabale R R Hospital', 224, '', '', 13, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(34, 'Kaberamaido Hub', 'Kaberamaido H/C IV', 227, '', '', 5, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(36, 'Kagadi Hub', 'Kagadi  Hospital', 239, '', '', 6, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(37, 'Kagando Hub', 'Kagando Hospital', 240, '', '', 9, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(38, 'Kakindo Hub', 'Kakindo H/C IV', 244, '', '', 6, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(39, 'Kalongo Hub', 'Kalongo Hospital', 256, '', '', 2, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(41, 'Kampala Hub', 'UNHLS', 2493, '', '', 10, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(42, 'Kamuli Hub', 'Kamuli District Govt Hospital', 2484, '', '', 8, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(43, 'Kanungu Hub', 'Kanungu H/C IV', 276, '', '', 13, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(44, 'Kapchorwa Hub', 'Kapchorwa Hospital', 279, '', '', 7, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(46, 'kassanda Hub', 'Kassanda H/C IV', 295, '', '', 11, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(47, 'Katakwi Hub', 'Katakwi Hospital', 1181, '', '', 5, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(48, 'Kawolo Hub', 'Kawolo Hospital', 311, '', '', 11, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(49, 'Kayunga Hub', 'Kayunga Hospital', 313, '', '', 11, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(50, 'Kiboga Hub', 'Kiboga Hospital', 320, '', '', 11, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(51, 'Kidera Hub', 'Kidera H/C IV', 325, '', '', 8, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(52, 'Kilembe Mines Hub', 'Kilembe Mines Hospital', 341, '', '', 9, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(53, 'kiryandongo Hub', 'Kiryandongo Hospital', 350, '', '', 6, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(54, 'Kisoro Hub', 'Kisoro Hospital', 355, '', '', 13, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(55, 'kitagata Hub', 'Kitagata  Hospital', 358, '', '', 12, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(56, 'Kitgum Hub', 'Kitgum General Hospital', 360, '', '', 2, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(57, 'Kotido Hub', 'Kotido H/C IV', 380, '', '', 1, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(58, 'Kyegegwa Hub', 'Kyegegwa H/C IV', 398, '', '', 9, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(60, 'Kyenjojo Hub', 'Kyenjojo Hospital', 1241, '', '', 9, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(61, 'Lira Hub', 'Lira R R Hospital', 416, '', '', 4, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(63, 'Luwero Hub', 'Luwero H/C IV', 425, '', '', 11, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(64, 'Lyantonde Hub', 'Lyantonde Hospital ', 434, '', '', 10, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(65, 'Madi Opei Hub', 'Madi Opei H/C IV', 439, '', '', 2, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(67, 'Masafu Hub', 'Masafu Hospital', 450, '', '', 7, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(68, 'Masaka Hub', 'Masaka R R Hospital', 451, '', '', 10, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(69, 'Masindi Hub', 'Masindi Hospital', 452, '', '', 6, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(70, 'Mbale Hub', 'Mbale R R Hospital', 460, '', '', 7, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(71, 'Mbarara Hub', 'Iss Clinic (Mbarara R R Hospital)', 211, '', '', 12, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(72, 'Mitooma Hub', 'Mitooma H/C IV', 469, '', '', 12, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(73, 'Mityana Hub', 'Mityana Hospital', 470, '', '', 11, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(74, 'Moroto Hub', 'Moroto R R Hospital', 472, '', '', 1, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(75, 'Moyo Hub', 'Moyo Hospital', 474, '', '', 3, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(76, 'Mubende Hub', 'Mubende R R Hospital ', 480, '', '', 11, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(77, 'Nakasongola Hub', 'Nakasongola H/C IV', 762, '', '', 11, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(78, 'Nebbi Hub', 'Nebbi Hospital', 531, '', '', 3, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(79, 'Ngoma Hub', 'Ngoma H/C IV (Nakaseke)', 1150, '', '', 11, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(80, 'Nsiika Hub', 'Nsiika H/C IV', 544, '', '', 12, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(81, 'Nyakibale Hub', 'Nyakibale Hospital', 558, '', '', 13, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(82, 'Pallisa Hub', 'Pallisa General Hospital', 614, '', '', 7, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(83, 'Rakai Hub', 'Rakai Hospital', 629, '', '', 10, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(84, 'Rugazi Hub', 'Rugazi H/C IV', 639, '', '', 12, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(85, 'Ruhoko Hub', 'Ruhoko H/C IV', 644, '', '', 12, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(86, 'Rushere Hub', 'Rushere Community Hospital', 650, '', '', 12, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(87, 'Rwekubo Hub', 'Rwekubo H/C IV', 659, '', '', 12, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(90, 'Serere Hub', 'Serere H/C IV', 670, '', '', 5, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(92, 'Soroti Hub', 'Soroti R R Hospital', 674, '', '', 5, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(93, 'Ssembabule Hub', 'Ssembabule H/C IV', 669, '', '', 10, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(94, 'Tokora Hub', 'Tokora H/C IV', 696, '', '', 1, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(95, 'Tororo Hub', 'Tororo District Hospital', 698, '', '', 7, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(96, 'Yumbe Hub', 'Yumbe Hospital', 712, '', '', 3, NULL, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(98, 'MUKONO', 'Mukono Municipal H/C IV', 489, '', '', 11, NULL, NULL, NULL, '2015-10-12 14:39:33', '0000-00-00 00:00:00'),
(100, 'Butenga Hub ', 'Butenga H/C IV', 149, '', '', 10, NULL, NULL, NULL, '2016-02-03 11:47:02', '0000-00-00 00:00:00'),
(101, 'Rukunyu Hub ', 'Rukunyu H/C IV', 649, '', '', 9, NULL, NULL, NULL, '2016-02-25 18:57:09', '0000-00-00 00:00:00'),
(102, 'Lalogi Hub ', 'Lalogi  H/C IV', 406, '', '', 2, NULL, NULL, NULL, '2016-04-20 10:13:28', '0000-00-00 00:00:00'),
(103, 'Matany Hub', 'Matany Hospital', 453, '', '', 1, NULL, NULL, NULL, '2016-05-04 10:15:42', '0000-00-00 00:00:00'),
(104, 'Apac Hub ', 'Apac Hospital', 42, '', '', 4, NULL, NULL, NULL, '2016-05-09 13:05:53', '0000-00-00 00:00:00'),
(105, 'Ngora Hub ', 'Ngora H/C IV', 995, '', '', 5, NULL, NULL, NULL, '2016-06-01 15:57:04', '0000-00-00 00:00:00'),
(106, 'Ntwetwe Hub ', 'Ntwetwe H/C IV', 551, '', '', 11, NULL, NULL, NULL, '2016-06-01 16:07:52', '0000-00-00 00:00:00'),
(107, 'Pajule Hub ', 'Pajule H/C  IV', 608, '', '', 2, NULL, NULL, NULL, '2016-06-10 10:59:06', '0000-00-00 00:00:00'),
(108, 'Alebtong Hub ', 'Alebtong H/C IV', 23, '', '', 2, NULL, NULL, NULL, '2016-06-10 10:59:46', '0000-00-00 00:00:00'),
(113, 'Kalangala Hub ', 'Kalangala H/C IV', 253, '', '', 10, NULL, NULL, NULL, '2016-06-14 12:46:01', '0000-00-00 00:00:00'),
(114, 'Budadiri Hub ', 'Budadiri H/C IV', 86, '', '', 7, NULL, NULL, NULL, '2016-06-15 14:49:41', '0000-00-00 00:00:00'),
(115, 'Lwengo Hub ', 'Lwengo H/C IV', 433, '', '', 10, NULL, NULL, NULL, '2016-06-17 08:55:03', '0000-00-00 00:00:00'),
(116, 'Wakiso Hub ', 'Wakiso H/C IV', 705, '', '', 10, NULL, NULL, NULL, '2016-06-17 08:56:00', '0000-00-00 00:00:00'),
(117, 'Kigandalo hub', 'Kigandalo H/C IV', 329, '', '', 8, NULL, NULL, NULL, '2016-06-17 12:34:23', '0000-00-00 00:00:00'),
(121, 'Bududa ', 'Bududa Hospital', 89, 'te@gmail.com', 'Address', 7, NULL, 1, NULL, '2017-10-30 12:33:41', '2017-10-30 12:33:46'),
(122, 'Maddu ', 'Maddu H/C IV', 438, 'mad@gmail.com', 'Adderss', 10, NULL, 1, NULL, '2017-10-30 12:58:35', '2017-10-30 12:58:36');

-- --------------------------------------------------------

--
-- Table structure for table `ii_quickcodes`
--

DROP TABLE IF EXISTS `ii_quickcodes`;
CREATE TABLE `ii_quickcodes` (
  `id` int(10) UNSIGNED NOT NULL,
  `feed_source` tinyint(4) NOT NULL,
  `config_prop` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `instruments`
--

DROP TABLE IF EXISTS `instruments`;
CREATE TABLE `instruments` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `ip` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hostname` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `driver_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `instruments`
--

INSERT INTO `instruments` (`id`, `name`, `ip`, `hostname`, `description`, `driver_name`, `created_at`, `updated_at`) VALUES
(1, 'Celltac F Mek 8222', '192.168.1.12', 'HEMASERVER', 'Automatic analyzer with 22 parameters and WBC 5 part diff Hematology Analyzer', 'KBLIS\\Plugins\\CelltacFMachine', '2018-01-29 13:00:25', '2018-01-29 13:00:25');

-- --------------------------------------------------------

--
-- Table structure for table `instrument_testtypes`
--

DROP TABLE IF EXISTS `instrument_testtypes`;
CREATE TABLE `instrument_testtypes` (
  `instrument_id` int(10) UNSIGNED NOT NULL,
  `test_type_id` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `instrument_testtypes`
--

INSERT INTO `instrument_testtypes` (`instrument_id`, `test_type_id`) VALUES
(1, 6);

-- --------------------------------------------------------

--
-- Table structure for table `interfaced_equipment`
--

DROP TABLE IF EXISTS `interfaced_equipment`;
CREATE TABLE `interfaced_equipment` (
  `id` int(10) UNSIGNED NOT NULL,
  `equipment_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `comm_type` tinyint(4) NOT NULL,
  `equipment_version` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `lab_section` int(10) UNSIGNED NOT NULL,
  `feed_source` tinyint(4) NOT NULL,
  `config_file` varchar(2000) COLLATE utf8_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `isolated_organisms`
--

DROP TABLE IF EXISTS `isolated_organisms`;
CREATE TABLE `isolated_organisms` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `test_id` int(10) UNSIGNED NOT NULL,
  `organism_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `issues`
--

DROP TABLE IF EXISTS `issues`;
CREATE TABLE `issues` (
  `id` int(10) UNSIGNED NOT NULL,
  `receipt_id` int(10) UNSIGNED NOT NULL,
  `topup_request_id` int(10) UNSIGNED NOT NULL,
  `quantity_issued` int(11) NOT NULL,
  `issued_to` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `remarks` varchar(400) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lookuptype`
--

DROP TABLE IF EXISTS `lookuptype`;
CREATE TABLE `lookuptype` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  `datecreated` datetime NOT NULL,
  `createdby` int(11) UNSIGNED NOT NULL,
  `lastupdatedate` datetime DEFAULT NULL,
  `lastupdatedby` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `lookuptype`
--

INSERT INTO `lookuptype` (`id`, `name`, `description`, `datecreated`, `createdby`, `lastupdatedate`, `lastupdatedby`) VALUES
(1, 'FACILITY_LEVELS', 'Whether a facility is referral hospital, health center 4 etc', '2017-10-07 11:47:06', 1, '2017-10-07 11:47:08', NULL),
(2, 'FACILITY_TYPE', 'Whether it is a hub, facility or both', '2017-10-07 11:47:59', 1, '2017-10-07 11:48:01', NULL),
(3, 'STAFF_TYPES', 'Whether casual e.g bike rider, or office staff', '2017-10-11 11:27:10', 1, '2017-10-11 11:27:13', NULL),
(4, 'DESIGNATIONS', 'The different staff job titles', '2017-10-11 11:29:20', 1, '2017-10-11 11:29:22', NULL),
(5, 'HEALTH_REGIONS', 'The health regions', '2017-10-23 13:09:16', 1, NULL, NULL),
(6, 'YES_NO', 'The yes, no options', '2017-10-25 13:33:21', 1, '2017-10-25 13:33:25', NULL),
(7, 'GENDER', 'whether female or male', '2018-02-02 12:50:06', 1, NULL, NULL),
(8, 'POSITIVE_NEGATIVE', 'The values of test results', '2018-02-02 15:00:15', 1, NULL, NULL),
(9, 'HB_DRUG_TYPES', 'Types drugs for hb', '2018-02-02 23:22:49', 1, NULL, NULL),
(10, 'HIV_DRUG_TYPES', 'hiv drugs', '2018-02-02 23:42:16', 1, NULL, NULL),
(11, 'SAMPLE_TYPES', 'hiv and hb sample types', '2018-02-03 00:19:34', 1, NULL, NULL),
(12, 'HB_FORM_STATUS', 'Whether pending approvel, approved etc', '2018-02-05 12:29:30', 1, NULL, NULL),
(13, 'MACHINE_TYPES', 'Whether abbot, etc', '2018-02-06 12:54:23', 1, NULL, NULL),
(14, 'WORKSHEET_STATUS', 'Whether printed, pending samples', '2018-02-07 10:54:42', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `lookuptypevalue`
--

DROP TABLE IF EXISTS `lookuptypevalue`;
CREATE TABLE `lookuptypevalue` (
  `id` int(11) UNSIGNED NOT NULL,
  `lookuptypeid` int(11) UNSIGNED NOT NULL,
  `lookuptypevalue` varchar(50) NOT NULL,
  `lookupvaluedescription` varchar(255) NOT NULL,
  `createdby` int(11) UNSIGNED NOT NULL,
  `datecreated` datetime NOT NULL,
  `lastupdatedate` datetime DEFAULT NULL,
  `lastupdatedby` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `lookuptypevalue`
--

INSERT INTO `lookuptypevalue` (`id`, `lookuptypeid`, `lookuptypevalue`, `lookupvaluedescription`, `createdby`, `datecreated`, `lastupdatedate`, `lastupdatedby`) VALUES
(1, 1, '1', 'Clinic ', 1, '2017-10-07 11:49:41', '2017-10-07 11:49:42', NULL),
(2, 1, '2', 'H/C', 1, '2016-10-07 11:50:33', NULL, NULL),
(3, 1, '3', 'H/C', 1, '2017-10-07 11:51:45', NULL, NULL),
(4, 1, '4', 'H/C II', 1, '2017-10-07 11:52:10', NULL, NULL),
(5, 1, '5', 'H/C III', 1, '2017-10-07 11:52:41', NULL, NULL),
(6, 1, '6', 'H/C IV', 1, '2017-10-07 11:53:17', NULL, NULL),
(7, 1, '7', 'Health Care Center', 1, '2017-10-07 11:53:38', NULL, NULL),
(8, 1, '8', 'Hospital', 1, '2017-10-07 11:53:01', NULL, NULL),
(9, 1, '9', 'Medical Centre', 1, '2017-10-07 11:54:26', NULL, NULL),
(10, 1, '10', 'Regional Referral Hospital', 1, '2017-10-07 11:54:53', NULL, NULL),
(11, 1, '11', 'Special Clinic', 1, '2017-10-07 11:55:20', NULL, NULL),
(12, 1, '12', 'LAB', 1, '2017-10-07 11:55:47', NULL, NULL),
(13, 2, '1', 'Hub', 1, '2017-10-07 11:55:29', NULL, NULL),
(14, 2, '2', 'Facility', 1, '2017-10-07 11:56:56', '2017-10-07 11:56:57', NULL),
(15, 2, '3', 'Hub & Facility', 1, '2017-10-07 11:57:38', NULL, NULL),
(16, 3, '1', 'Sample Transporter', 1, '2017-10-11 11:27:47', '2017-10-11 11:27:49', NULL),
(17, 3, '2', 'Staff Member', 1, '2017-10-11 11:28:17', '2017-10-11 11:28:18', NULL),
(18, 4, '1', 'Lab Technician', 1, '2017-10-11 11:30:25', '2017-10-11 11:30:26', NULL),
(19, 4, '2', 'Lab Assistant', 1, '2017-10-11 11:32:42', '2017-10-11 11:32:43', NULL),
(20, 6, '1', 'Yes', 1, '2017-10-25 13:34:11', NULL, NULL),
(21, 6, '0', 'No', 1, '2017-10-25 13:34:40', NULL, NULL),
(22, 7, '1', 'Male', 1, '2018-02-02 12:50:38', NULL, NULL),
(23, 7, '2', 'Female', 1, '2018-02-02 12:51:02', NULL, NULL),
(24, 8, '1', 'Positive', 1, '2018-02-02 15:00:54', NULL, NULL),
(25, 8, '2', 'Negative', 1, '2018-02-02 15:01:16', '2018-02-02 15:01:17', NULL),
(26, 9, '1', 'Baraclude (entecavir)', 1, '2018-02-02 23:24:04', NULL, NULL),
(27, 9, '2', 'Epivir-HBV (lamivudine)', 1, '2018-02-02 23:24:47', NULL, NULL),
(28, 9, '3', 'Intron A (interferon alfa-2b)', 1, '2018-02-02 23:25:16', NULL, NULL),
(29, 9, '4', 'Hepsera (adefovir dipivoxil)', 1, '2018-02-02 23:25:48', NULL, NULL),
(30, 10, '1', 'Integrase inhibitors (INSTIs)', 1, '2018-02-02 23:43:16', NULL, NULL),
(31, 10, '2', 'Fusion inhibitors (FIs)', 1, '2018-02-02 23:43:43', NULL, NULL),
(32, 11, '1', 'Plasma', 1, '2018-02-03 00:20:06', NULL, NULL),
(33, 11, '2', 'DBS', 1, '2018-02-03 00:20:43', NULL, NULL),
(34, 12, '0', 'Pending Approval', 1, '2018-02-05 12:33:25', '2018-02-05 12:33:26', NULL),
(35, 12, '1', 'Approved', 1, '2018-02-05 12:33:41', '2018-02-05 12:33:42', NULL),
(36, 12, '2', 'Rejected', 1, '2018-02-05 15:16:35', '2018-02-05 15:16:43', NULL),
(37, 12, '3', 'Added to Worksheet', 1, '2018-02-05 15:17:14', '2018-02-05 15:17:20', NULL),
(38, 12, '4', 'Completed', 1, '2018-02-05 15:17:41', '2018-02-05 15:17:45', NULL),
(39, 13, '1', 'Abbot', 1, '2018-02-06 12:54:54', '2018-02-06 12:54:55', NULL),
(40, 14, '0', 'Pending Samples', 1, '2018-02-07 11:00:18', '2018-02-07 11:00:20', NULL),
(41, 14, '1', 'Samples Added', 1, '2018-02-07 11:01:36', NULL, NULL),
(42, 14, '2', 'Printed', 1, '2018-02-07 11:02:02', NULL, NULL),
(43, 14, '3', 'Completed', 1, '2018-02-07 11:03:06', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `lots`
--

DROP TABLE IF EXISTS `lots`;
CREATE TABLE `lots` (
  `id` int(10) UNSIGNED NOT NULL,
  `number` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8_unicode_ci DEFAULT NULL,
  `expiry` date NOT NULL,
  `instrument_id` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `measures`
--

DROP TABLE IF EXISTS `measures`;
CREATE TABLE `measures` (
  `id` int(10) UNSIGNED NOT NULL,
  `measure_type_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `unit` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `measures`
--

INSERT INTO `measures` (`id`, `measure_type_id`, `name`, `unit`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, 'Screening', '', NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25', NULL),
(2, 2, 'Confirmatory Test (Statpak)', '', NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25', NULL),
(3, 2, 'Unigold', '', NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25', NULL),
(4, 2, 'BS for mps', '', NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25', NULL),
(5, 4, 'GXM', '', NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25', NULL),
(6, 2, 'Blood Grouping', '', NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25', NULL),
(7, 1, 'HB', 'g/dL', NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25', NULL),
(8, 4, 'Pus cells', '', NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25', NULL),
(9, 4, 'S. haematobium', '', NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25', NULL),
(10, 4, 'T. vaginalis', '', NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25', NULL),
(11, 4, 'Yeast cells', '', NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25', NULL),
(12, 4, 'Red blood cells', '', NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25', NULL),
(13, 4, 'Bacteria', '', NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25', NULL),
(14, 4, 'Spermatozoa', '', NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25', NULL),
(15, 4, 'Epithelial cells', '', NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25', NULL),
(16, 4, 'Glucose', '', NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25', NULL),
(17, 4, 'Ketones', '', NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25', NULL),
(18, 4, 'Proteins', '', NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25', NULL),
(19, 4, 'Blood', '', NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25', NULL),
(20, 4, 'Bilirubin', '', NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25', NULL),
(21, 4, 'Urobilinogen Phenlpyruvic acid', '', NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25', NULL),
(22, 4, 'pH', '', NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25', NULL),
(23, 1, 'WBC', 'x10³/µL', NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25', NULL),
(24, 1, 'Lym', 'L', NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25', NULL),
(25, 1, 'Mon', '*', NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25', NULL),
(26, 1, 'Neu', '*', NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25', NULL),
(27, 1, 'Eos', '', NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25', NULL),
(28, 1, 'Baso', '', NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25', NULL),
(29, 2, 'Salmonella Antigen Test', '', NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25', NULL),
(30, 2, 'Direct COOMBS Test', '', NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25', NULL),
(31, 2, 'Du Test', '', NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25', NULL),
(32, 2, 'Sickling Test', '', NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25', NULL),
(33, 2, 'Borrelia', '', NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25', NULL),
(34, 2, 'VDRL', '', NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25', NULL),
(35, 2, 'Pregnancy Test', '', NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25', NULL),
(36, 2, 'Brucella', '', NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25', NULL),
(37, 2, 'H. Pylori', '', NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25', NULL),
(38, 1, 'WBC', 'x10³/µL', NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25', NULL),
(39, 1, 'RBC', 'x10⁶/µL', NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25', NULL),
(40, 1, 'HGB', 'g/dL', NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25', NULL),
(41, 1, 'HCT', '%', NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25', NULL),
(42, 1, 'MCV', 'fL', NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25', NULL),
(43, 1, 'MCH', 'pg', NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25', NULL),
(44, 1, 'MCHC', 'g/dL', NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25', NULL),
(45, 1, 'PLT', 'x10³/µL', NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25', NULL),
(46, 1, 'RDW-SD', 'fL', NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25', NULL),
(47, 1, 'RDW-CV', '%', NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25', NULL),
(48, 1, 'PDW', 'fL', NULL, '2018-01-29 13:00:26', '2018-01-29 13:00:26', NULL),
(49, 1, 'MPV', 'fL', NULL, '2018-01-29 13:00:26', '2018-01-29 13:00:26', NULL),
(50, 1, 'P-LCR', '%', NULL, '2018-01-29 13:00:26', '2018-01-29 13:00:26', NULL),
(51, 1, 'PCT', '%', NULL, '2018-01-29 13:00:26', '2018-01-29 13:00:26', NULL),
(52, 1, 'NEUT#', 'x10³/µL', NULL, '2018-01-29 13:00:26', '2018-01-29 13:00:26', NULL),
(53, 1, 'LYMPH#', 'x10³/µL', NULL, '2018-01-29 13:00:26', '2018-01-29 13:00:26', NULL),
(54, 1, 'MONO#', 'x10³/µL', NULL, '2018-01-29 13:00:26', '2018-01-29 13:00:26', NULL),
(55, 1, 'EO#', 'x10³/µL', NULL, '2018-01-29 13:00:26', '2018-01-29 13:00:26', NULL),
(56, 1, 'BASO#', 'x10³/µL', NULL, '2018-01-29 13:00:26', '2018-01-29 13:00:26', NULL),
(57, 1, 'NEUT%', '%', NULL, '2018-01-29 13:00:26', '2018-01-29 13:00:26', NULL),
(58, 1, 'LYMPH%', '%', NULL, '2018-01-29 13:00:26', '2018-01-29 13:00:26', NULL),
(59, 1, 'MONO%', '%', NULL, '2018-01-29 13:00:26', '2018-01-29 13:00:26', NULL),
(60, 1, 'EO%', '%', NULL, '2018-01-29 13:00:26', '2018-01-29 13:00:26', NULL),
(61, 1, 'BASO%', '%', NULL, '2018-01-29 13:00:26', '2018-01-29 13:00:26', NULL),
(62, 2, 'Crag', '', NULL, '2018-01-29 13:00:26', '2018-01-29 13:00:26', NULL),
(63, 4, 'Differential', '', NULL, '2018-01-29 13:00:26', '2018-01-29 13:00:26', NULL),
(64, 4, 'Total Cell Count', '', NULL, '2018-01-29 13:00:26', '2018-01-29 13:00:26', NULL),
(65, 4, 'Lymphocytes', '', NULL, '2018-01-29 13:00:26', '2018-01-29 13:00:26', NULL),
(66, 4, 'Quantitative Culture', '', NULL, '2018-01-29 13:00:26', '2018-01-29 13:00:26', NULL),
(67, 4, 'RBC Count', '', NULL, '2018-01-29 13:00:26', '2018-01-29 13:00:26', NULL),
(68, 4, 'TPHA', '', NULL, '2018-01-29 13:00:26', '2018-01-29 13:00:26', NULL),
(69, 4, 'HCG', '', NULL, '2018-01-29 13:00:26', '2018-01-29 13:00:26', NULL),
(70, 4, 'Bilirubin', '', NULL, '2018-01-29 13:00:26', '2018-01-29 13:00:26', NULL),
(71, 4, 'Blood', '', NULL, '2018-01-29 13:00:26', '2018-01-29 13:00:26', NULL),
(72, 4, 'Glucose', '', NULL, '2018-01-29 13:00:26', '2018-01-29 13:00:26', NULL),
(73, 4, 'Ketones', '', NULL, '2018-01-29 13:00:26', '2018-01-29 13:00:26', NULL),
(74, 4, 'Leukocytes', '', NULL, '2018-01-29 13:00:26', '2018-01-29 13:00:26', NULL),
(75, 4, 'Microscopy', '', NULL, '2018-01-29 13:00:26', '2018-01-29 13:00:26', NULL),
(76, 4, 'Nitrite', '', NULL, '2018-01-29 13:00:26', '2018-01-29 13:00:26', NULL),
(77, 4, 'pH', '', NULL, '2018-01-29 13:00:26', '2018-01-29 13:00:26', NULL),
(78, 4, 'Protein', '', NULL, '2018-01-29 13:00:26', '2018-01-29 13:00:26', NULL),
(79, 4, 'Specific Gravity', '', NULL, '2018-01-29 13:00:26', '2018-01-29 13:00:26', NULL),
(80, 4, 'Urobilinogen', '', NULL, '2018-01-29 13:00:26', '2018-01-29 13:00:26', NULL),
(81, 4, 'Appearance', '', NULL, '2018-01-29 13:00:26', '2018-01-29 13:00:26', NULL),
(82, 4, 'Culture and Sensitivity', NULL, NULL, '2018-01-29 13:00:26', '2018-01-29 13:00:26', NULL),
(83, 4, 'Gram Staining', '', NULL, '2018-01-29 13:00:26', '2018-01-29 13:00:26', NULL),
(84, 2, 'India Ink Staining', NULL, NULL, '2018-01-29 13:00:26', '2018-01-29 13:00:26', NULL),
(85, 4, 'Protein', NULL, NULL, '2018-01-29 13:00:26', '2018-01-29 13:00:26', NULL),
(86, 4, 'Wet preparation (saline preparation)', NULL, NULL, '2018-01-29 13:00:26', '2018-01-29 13:00:26', NULL),
(87, 4, 'White Blood Cell Count', NULL, NULL, '2018-01-29 13:00:26', '2018-01-29 13:00:26', NULL),
(88, 4, 'ZN Staining', NULL, NULL, '2018-01-29 13:00:26', '2018-01-29 13:00:26', NULL),
(89, 4, 'Modified ZN', '', NULL, '2018-01-29 13:00:26', '2018-01-29 13:00:26', NULL),
(90, 4, 'Wet Saline Iodine Prep', '', NULL, '2018-01-29 13:00:26', '2018-01-29 13:00:26', NULL),
(91, 2, 'SERUM AMYLASE', '', NULL, '2018-01-29 13:00:26', '2018-01-29 13:00:26', NULL),
(92, 2, 'calcium', '', NULL, '2018-01-29 13:00:26', '2018-01-29 13:00:26', NULL),
(93, 2, 'SGOT', '', NULL, '2018-01-29 13:00:26', '2018-01-29 13:00:26', NULL),
(94, 2, 'Indirect COOMBS test', '', NULL, '2018-01-29 13:00:26', '2018-01-29 13:00:26', NULL),
(95, 2, 'Direct COOMBS test', '', NULL, '2018-01-29 13:00:26', '2018-01-29 13:00:26', NULL),
(96, 2, 'Du test', '', NULL, '2018-01-29 13:00:26', '2018-01-29 13:00:26', NULL),
(97, 4, 'RPR', '', NULL, '2018-01-29 13:00:26', '2018-01-29 13:00:26', NULL),
(98, 4, 'Serum Crag', '', NULL, '2018-01-29 13:00:26', '2018-01-29 13:00:26', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `measure_name_mappings`
--

DROP TABLE IF EXISTS `measure_name_mappings`;
CREATE TABLE `measure_name_mappings` (
  `id` int(10) UNSIGNED NOT NULL,
  `test_name_mapping_id` int(10) UNSIGNED NOT NULL,
  `measure_id` int(10) UNSIGNED DEFAULT NULL,
  `standard_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `system_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `measure_name_mappings`
--

INSERT INTO `measure_name_mappings` (`id`, `test_name_mapping_id`, `measure_id`, `standard_name`, `system_name`) VALUES
(1, 1, NULL, 'WBC', 'wbc'),
(2, 1, NULL, 'RBC', 'rbc'),
(3, 1, NULL, 'hgb', 'hgb'),
(4, 2, NULL, 'Hb', 'hb'),
(5, 3, NULL, 'ESR', 'esr'),
(6, 4, NULL, 'Bleeding time', 'bleeding_time'),
(7, 5, NULL, 'Prothrombin Time', 'prothrombin_time'),
(8, 6, NULL, 'Clotting Time', 'clotting_time'),
(9, 7, NULL, 'ABO Grouping', 'abo_grouping'),
(10, 8, NULL, 'Combs', 'combs'),
(11, 9, NULL, 'Cross Matching', 'cross_matching'),
(12, 10, NULL, 'Malaria Microscopy', 'malaria_microscopy'),
(13, 11, NULL, 'Malaria RDTs', 'malaria_rdts'),
(14, 12, NULL, 'Stool Microscopy', 'stool_microscopy'),
(15, 13, NULL, 'VDRL/RPR', 'vdrl_rpr'),
(16, 14, NULL, 'TPHA', 'tpha'),
(17, 15, NULL, 'Shigella Dysentery', 'shigella_dysentery'),
(18, 16, NULL, 'Hepatitis B', 'hepatitis_b'),
(19, 17, NULL, 'Brucella', 'brucella'),
(20, 18, NULL, 'Pregnancy Test', 'pregnancy_test'),
(21, 19, NULL, 'Rheumatoid Factor', 'rheumatoid_factor'),
(22, 20, NULL, 'CD4 tests', 'cd4_tests'),
(23, 21, NULL, 'Viral Load Tests', 'viral_load_tests'),
(24, 22, NULL, 'ZN for AFBs', 'zn_for_afbs'),
(25, 23, NULL, 'Culture & Sensitivity', 'culture_sensitivity'),
(26, 24, NULL, 'Gram Stain', 'gram_stain'),
(27, 25, NULL, 'India Ink', 'india_ink'),
(28, 26, NULL, 'Wet Preps', 'wet_preps'),
(29, 27, NULL, 'Urine Microscopy', 'urine_microscopy'),
(30, 28, NULL, 'Urea', 'urea'),
(31, 28, NULL, 'Calcium', 'calcium'),
(32, 28, NULL, 'Potassium', 'potassium'),
(33, 28, NULL, 'Sodium', 'sodium'),
(34, 28, NULL, 'Creatinine', 'creatinine'),
(35, 29, NULL, 'ALT', 'alt'),
(36, 29, NULL, 'AST', 'ast'),
(37, 29, NULL, 'Albumin', 'albumin'),
(38, 29, NULL, 'Total Protein', 'total_protein'),
(39, 30, NULL, 'Triglycerides', 'triglycerides'),
(40, 30, NULL, 'Cholesterol', 'cholesterol'),
(41, 30, NULL, 'CK', 'ck'),
(42, 30, NULL, 'LDH', 'ldh'),
(43, 30, NULL, 'HDL', 'hdl'),
(44, 31, NULL, 'Alkaline Phosphates', 'alkaline_phosphates'),
(45, 32, NULL, 'Amylase', 'amylase'),
(46, 33, NULL, 'Glucose', 'glucose'),
(47, 34, NULL, 'Uric Acid', 'uric_acid'),
(48, 35, NULL, 'Lactate', 'lactate'),
(49, 36, NULL, 'Determine', 'determine'),
(50, 36, NULL, 'Stat-pak', 'stat_pak'),
(51, 36, NULL, 'Unigold', 'unigold');

-- --------------------------------------------------------

--
-- Table structure for table `measure_ranges`
--

DROP TABLE IF EXISTS `measure_ranges`;
CREATE TABLE `measure_ranges` (
  `id` int(10) UNSIGNED NOT NULL,
  `measure_id` int(10) UNSIGNED NOT NULL,
  `age_min` decimal(8,2) DEFAULT NULL,
  `age_max` decimal(8,2) DEFAULT NULL,
  `gender` tinyint(3) UNSIGNED DEFAULT NULL,
  `range_lower` decimal(7,3) DEFAULT NULL,
  `range_upper` decimal(7,3) DEFAULT NULL,
  `alphanumeric` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `interpretation` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `result_interpretation_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `measure_ranges`
--

INSERT INTO `measure_ranges` (`id`, `measure_id`, `age_min`, `age_max`, `gender`, `range_lower`, `range_upper`, `alphanumeric`, `interpretation`, `deleted_at`, `result_interpretation_id`) VALUES
(1, 1, NULL, NULL, NULL, NULL, NULL, 'Reactive', '', NULL, NULL),
(2, 1, NULL, NULL, NULL, NULL, NULL, 'Non-Reactive', '', NULL, NULL),
(3, 2, NULL, NULL, NULL, NULL, NULL, 'Reactive', '', NULL, NULL),
(4, 2, NULL, NULL, NULL, NULL, NULL, 'Non-Reactive', '', NULL, NULL),
(5, 3, NULL, NULL, NULL, NULL, NULL, 'Reactive', '', NULL, NULL),
(6, 3, NULL, NULL, NULL, NULL, NULL, 'Non-Reactive', '', NULL, NULL),
(7, 4, NULL, NULL, NULL, NULL, NULL, 'No mps seen', 'Negative', NULL, NULL),
(8, 4, NULL, NULL, NULL, NULL, NULL, '+', 'Positive', NULL, NULL),
(9, 4, NULL, NULL, NULL, NULL, NULL, '++', 'Positive', NULL, NULL),
(10, 4, NULL, NULL, NULL, NULL, NULL, '+++', 'Positive', NULL, NULL),
(11, 6, NULL, NULL, NULL, NULL, NULL, 'O-', NULL, NULL, NULL),
(12, 6, NULL, NULL, NULL, NULL, NULL, 'O+', NULL, NULL, NULL),
(13, 6, NULL, NULL, NULL, NULL, NULL, 'A-', NULL, NULL, NULL),
(14, 6, NULL, NULL, NULL, NULL, NULL, 'A+', NULL, NULL, NULL),
(15, 6, NULL, NULL, NULL, NULL, NULL, 'B-', NULL, NULL, NULL),
(16, 6, NULL, NULL, NULL, NULL, NULL, 'B+', NULL, NULL, NULL),
(17, 6, NULL, NULL, NULL, NULL, NULL, 'AB-', NULL, NULL, NULL),
(18, 6, NULL, NULL, NULL, NULL, NULL, 'AB+', NULL, NULL, NULL),
(19, 23, '0.00', '100.00', 2, '4.000', '11.000', NULL, NULL, NULL, NULL),
(20, 24, '0.00', '100.00', 2, '1.500', '4.000', NULL, NULL, NULL, NULL),
(21, 25, '0.00', '100.00', 2, '0.100', '9.000', NULL, NULL, NULL, NULL),
(22, 26, '0.00', '100.00', 2, '2.500', '7.000', NULL, NULL, NULL, NULL),
(23, 27, '0.00', '100.00', 2, '0.000', '6.000', NULL, NULL, NULL, NULL),
(24, 28, '0.00', '100.00', 2, '0.000', '2.000', NULL, NULL, NULL, NULL),
(25, 29, NULL, NULL, NULL, NULL, NULL, 'Positive', NULL, NULL, NULL),
(26, 29, NULL, NULL, NULL, NULL, NULL, 'Negative', NULL, NULL, NULL),
(27, 30, NULL, NULL, NULL, NULL, NULL, 'Positive', NULL, NULL, NULL),
(28, 30, NULL, NULL, NULL, NULL, NULL, 'Negative', NULL, NULL, NULL),
(29, 31, NULL, NULL, NULL, NULL, NULL, 'Positive', NULL, NULL, NULL),
(30, 31, NULL, NULL, NULL, NULL, NULL, 'Negative', NULL, NULL, NULL),
(31, 32, NULL, NULL, NULL, NULL, NULL, 'Positive', NULL, NULL, NULL),
(32, 32, NULL, NULL, NULL, NULL, NULL, 'Negative', NULL, NULL, NULL),
(33, 33, NULL, NULL, NULL, NULL, NULL, 'Positive', NULL, NULL, NULL),
(34, 33, NULL, NULL, NULL, NULL, NULL, 'Negative', NULL, NULL, NULL),
(35, 34, NULL, NULL, NULL, NULL, NULL, 'Positive', NULL, NULL, NULL),
(36, 34, NULL, NULL, NULL, NULL, NULL, 'Negative', NULL, NULL, NULL),
(37, 35, NULL, NULL, NULL, NULL, NULL, 'Positive', NULL, NULL, NULL),
(38, 35, NULL, NULL, NULL, NULL, NULL, 'Negative', NULL, NULL, NULL),
(39, 36, NULL, NULL, NULL, NULL, NULL, 'Positive', NULL, NULL, NULL),
(40, 36, NULL, NULL, NULL, NULL, NULL, 'Negative', NULL, NULL, NULL),
(41, 37, NULL, NULL, NULL, NULL, NULL, 'Positive', NULL, NULL, NULL),
(42, 37, NULL, NULL, NULL, NULL, NULL, 'Negative', NULL, NULL, NULL),
(43, 38, '0.00', '0.02', 2, '3.000', '15.000', NULL, NULL, NULL, NULL),
(44, 38, '0.02', '0.08', 2, '3.000', '15.000', NULL, NULL, NULL, NULL),
(45, 38, '0.08', '1.00', 2, '3.000', '15.000', NULL, NULL, NULL, NULL),
(46, 38, '1.00', '12.00', 2, '3.000', '15.000', NULL, NULL, NULL, NULL),
(47, 38, '12.00', '60.00', 0, '3.000', '15.000', NULL, NULL, NULL, NULL),
(48, 38, '12.00', '60.00', 1, '4.000', '11.000', NULL, NULL, NULL, NULL),
(49, 38, '60.00', '999.00', 2, '3.000', '15.000', NULL, NULL, NULL, NULL),
(50, 39, '0.00', '0.02', 2, '2.500', '5.500', NULL, NULL, NULL, NULL),
(51, 39, '0.02', '0.08', 2, '2.500', '5.500', NULL, NULL, NULL, NULL),
(52, 39, '0.08', '1.00', 2, '2.500', '5.500', NULL, NULL, NULL, NULL),
(53, 39, '1.00', '12.00', 2, '2.500', '5.500', NULL, NULL, NULL, NULL),
(54, 39, '12.00', '60.00', 0, '2.500', '5.500', NULL, NULL, NULL, NULL),
(55, 39, '12.00', '60.00', 1, '2.500', '5.500', NULL, NULL, NULL, NULL),
(56, 39, '60.00', '999.00', 2, '2.500', '5.500', NULL, NULL, NULL, NULL),
(57, 40, '0.00', '0.02', 2, '12.000', '16.000', NULL, NULL, NULL, NULL),
(58, 40, '0.02', '0.08', 2, '8.000', '17.000', NULL, NULL, NULL, NULL),
(59, 40, '0.08', '1.00', 2, '8.000', '17.000', NULL, NULL, NULL, NULL),
(60, 40, '1.00', '12.00', 2, '8.000', '17.000', NULL, NULL, NULL, NULL),
(61, 40, '12.00', '60.00', 0, '13.000', '17.000', NULL, NULL, NULL, NULL),
(62, 40, '12.00', '60.00', 1, '12.000', '14.000', NULL, NULL, NULL, NULL),
(63, 40, '60.00', '999.00', 2, '8.000', '17.000', NULL, NULL, NULL, NULL),
(64, 41, '0.00', '0.02', 2, '26.000', '50.000', NULL, NULL, NULL, NULL),
(65, 41, '0.02', '0.08', 2, '26.000', '50.000', NULL, NULL, NULL, NULL),
(66, 41, '0.08', '1.00', 2, '26.000', '50.000', NULL, NULL, NULL, NULL),
(67, 41, '1.00', '12.00', 2, '26.000', '50.000', NULL, NULL, NULL, NULL),
(68, 41, '12.00', '60.00', 0, '26.000', '50.000', NULL, NULL, NULL, NULL),
(69, 41, '12.00', '60.00', 1, '26.000', '50.000', NULL, NULL, NULL, NULL),
(70, 41, '60.00', '999.00', 2, '26.000', '50.000', NULL, NULL, NULL, NULL),
(71, 42, '0.00', '0.02', 2, '86.000', '110.000', NULL, NULL, NULL, NULL),
(72, 42, '0.02', '0.08', 2, '86.000', '110.000', NULL, NULL, NULL, NULL),
(73, 42, '0.08', '1.00', 2, '86.000', '110.000', NULL, NULL, NULL, NULL),
(74, 42, '1.00', '12.00', 2, '86.000', '110.000', NULL, NULL, NULL, NULL),
(75, 42, '12.00', '60.00', 0, '86.000', '110.000', NULL, NULL, NULL, NULL),
(76, 42, '12.00', '60.00', 1, '86.000', '110.000', NULL, NULL, NULL, NULL),
(77, 42, '60.00', '999.00', 2, '86.000', '110.000', NULL, NULL, NULL, NULL),
(78, 43, '0.00', '0.02', 2, '26.000', '38.000', NULL, NULL, NULL, NULL),
(79, 43, '0.02', '0.08', 2, '26.000', '38.000', NULL, NULL, NULL, NULL),
(80, 43, '0.08', '1.00', 2, '26.000', '38.000', NULL, NULL, NULL, NULL),
(81, 43, '1.00', '12.00', 2, '26.000', '38.000', NULL, NULL, NULL, NULL),
(82, 43, '12.00', '60.00', 0, '26.000', '38.000', NULL, NULL, NULL, NULL),
(83, 43, '12.00', '60.00', 1, '26.000', '38.000', NULL, NULL, NULL, NULL),
(84, 43, '60.00', '999.00', 2, '26.000', '38.000', NULL, NULL, NULL, NULL),
(85, 44, '0.00', '0.02', 2, '31.000', '37.000', NULL, NULL, NULL, NULL),
(86, 44, '0.02', '0.08', 2, '31.000', '37.000', NULL, NULL, NULL, NULL),
(87, 44, '0.08', '1.00', 2, '31.000', '37.000', NULL, NULL, NULL, NULL),
(88, 44, '1.00', '12.00', 2, '31.000', '37.000', NULL, NULL, NULL, NULL),
(89, 44, '12.00', '60.00', 0, '31.000', '37.000', NULL, NULL, NULL, NULL),
(90, 44, '12.00', '60.00', 1, '31.000', '37.000', NULL, NULL, NULL, NULL),
(91, 44, '60.00', '999.00', 2, '31.000', '37.000', NULL, NULL, NULL, NULL),
(92, 45, '0.00', '0.02', 2, '50.000', '400.000', NULL, NULL, NULL, NULL),
(93, 45, '0.02', '0.08', 2, '50.000', '400.000', NULL, NULL, NULL, NULL),
(94, 45, '0.08', '1.00', 2, '50.000', '400.000', NULL, NULL, NULL, NULL),
(95, 45, '1.00', '12.00', 2, '50.000', '400.000', NULL, NULL, NULL, NULL),
(96, 45, '12.00', '60.00', 0, '50.000', '400.000', NULL, NULL, NULL, NULL),
(97, 45, '12.00', '60.00', 1, '50.000', '400.000', NULL, NULL, NULL, NULL),
(98, 45, '60.00', '999.00', 2, '50.000', '400.000', NULL, NULL, NULL, NULL),
(99, 46, '0.00', '0.02', 2, '37.000', '54.000', NULL, NULL, NULL, NULL),
(100, 46, '0.02', '0.08', 2, '37.000', '54.000', NULL, NULL, NULL, NULL),
(101, 46, '0.08', '1.00', 2, '37.000', '54.000', NULL, NULL, NULL, NULL),
(102, 46, '1.00', '12.00', 2, '37.000', '54.000', NULL, NULL, NULL, NULL),
(103, 46, '12.00', '60.00', 0, '37.000', '54.000', NULL, NULL, NULL, NULL),
(104, 46, '12.00', '60.00', 1, '37.000', '54.000', NULL, NULL, NULL, NULL),
(105, 46, '60.00', '999.00', 2, '37.000', '54.000', NULL, NULL, NULL, NULL),
(106, 47, '0.00', '0.02', 2, '11.000', '16.000', NULL, NULL, NULL, NULL),
(107, 47, '0.02', '0.08', 2, '11.000', '16.000', NULL, NULL, NULL, NULL),
(108, 47, '0.08', '1.00', 2, '11.000', '16.000', NULL, NULL, NULL, NULL),
(109, 47, '1.00', '12.00', 2, '11.000', '16.000', NULL, NULL, NULL, NULL),
(110, 47, '12.00', '60.00', 0, '11.000', '16.000', NULL, NULL, NULL, NULL),
(111, 47, '12.00', '60.00', 1, '11.000', '16.000', NULL, NULL, NULL, NULL),
(112, 47, '60.00', '999.00', 2, '11.000', '16.000', NULL, NULL, NULL, NULL),
(113, 48, '0.00', '0.02', 2, '9.000', '17.000', NULL, NULL, NULL, NULL),
(114, 48, '0.02', '0.08', 2, '9.000', '17.000', NULL, NULL, NULL, NULL),
(115, 48, '0.08', '1.00', 2, '9.000', '17.000', NULL, NULL, NULL, NULL),
(116, 48, '1.00', '12.00', 2, '9.000', '17.000', NULL, NULL, NULL, NULL),
(117, 48, '12.00', '60.00', 0, '9.000', '17.000', NULL, NULL, NULL, NULL),
(118, 48, '12.00', '60.00', 1, '9.000', '17.000', NULL, NULL, NULL, NULL),
(119, 48, '60.00', '999.00', 2, '9.000', '17.000', NULL, NULL, NULL, NULL),
(120, 49, '0.00', '0.02', 2, '9.000', '13.000', NULL, NULL, NULL, NULL),
(121, 49, '0.02', '0.08', 2, '9.000', '13.000', NULL, NULL, NULL, NULL),
(122, 49, '0.08', '1.00', 2, '9.000', '13.000', NULL, NULL, NULL, NULL),
(123, 49, '1.00', '12.00', 2, '9.000', '13.000', NULL, NULL, NULL, NULL),
(124, 49, '12.00', '60.00', 0, '9.000', '13.000', NULL, NULL, NULL, NULL),
(125, 49, '12.00', '60.00', 1, '9.000', '13.000', NULL, NULL, NULL, NULL),
(126, 49, '60.00', '999.00', 2, '9.000', '13.000', NULL, NULL, NULL, NULL),
(127, 50, '0.00', '0.02', 2, '13.000', '43.000', NULL, NULL, NULL, NULL),
(128, 50, '0.02', '0.08', 2, '13.000', '43.000', NULL, NULL, NULL, NULL),
(129, 50, '0.08', '1.00', 2, '13.000', '43.000', NULL, NULL, NULL, NULL),
(130, 50, '1.00', '12.00', 2, '13.000', '43.000', NULL, NULL, NULL, NULL),
(131, 50, '12.00', '60.00', 0, '13.000', '43.000', NULL, NULL, NULL, NULL),
(132, 50, '12.00', '60.00', 1, '13.000', '43.000', NULL, NULL, NULL, NULL),
(133, 50, '60.00', '999.00', 2, '13.000', '43.000', NULL, NULL, NULL, NULL),
(134, 51, '0.00', '0.02', 2, '0.170', '0.350', NULL, NULL, NULL, NULL),
(135, 51, '0.02', '0.08', 2, '0.170', '0.350', NULL, NULL, NULL, NULL),
(136, 51, '0.08', '1.00', 2, '0.170', '0.350', NULL, NULL, NULL, NULL),
(137, 51, '1.00', '12.00', 2, '0.170', '0.350', NULL, NULL, NULL, NULL),
(138, 51, '12.00', '60.00', 0, '0.170', '0.350', NULL, NULL, NULL, NULL),
(139, 51, '12.00', '60.00', 1, '0.170', '0.350', NULL, NULL, NULL, NULL),
(140, 51, '60.00', '999.00', 2, '0.170', '0.350', NULL, NULL, NULL, NULL),
(141, 52, '0.00', '0.02', 2, '1.500', '7.000', NULL, NULL, NULL, NULL),
(142, 52, '0.02', '0.08', 2, '1.500', '7.000', NULL, NULL, NULL, NULL),
(143, 52, '0.08', '1.00', 2, '1.500', '7.000', NULL, NULL, NULL, NULL),
(144, 52, '1.00', '12.00', 2, '1.500', '7.000', NULL, NULL, NULL, NULL),
(145, 52, '12.00', '60.00', 0, '1.500', '7.000', NULL, NULL, NULL, NULL),
(146, 52, '12.00', '60.00', 1, '1.500', '7.000', NULL, NULL, NULL, NULL),
(147, 52, '60.00', '999.00', 2, '1.500', '7.000', NULL, NULL, NULL, NULL),
(148, 53, '0.00', '0.02', 2, '1.000', '3.700', NULL, NULL, NULL, NULL),
(149, 53, '0.02', '0.08', 2, '1.000', '3.700', NULL, NULL, NULL, NULL),
(150, 53, '0.08', '1.00', 2, '1.000', '3.700', NULL, NULL, NULL, NULL),
(151, 53, '1.00', '12.00', 2, '1.000', '3.700', NULL, NULL, NULL, NULL),
(152, 53, '12.00', '60.00', 0, '1.000', '3.700', NULL, NULL, NULL, NULL),
(153, 53, '12.00', '60.00', 1, '1.000', '3.700', NULL, NULL, NULL, NULL),
(154, 53, '60.00', '999.00', 2, '1.000', '3.700', NULL, NULL, NULL, NULL),
(155, 54, '0.00', '0.02', 2, '0.000', '0.700', NULL, NULL, NULL, NULL),
(156, 54, '0.02', '0.08', 2, '0.000', '0.700', NULL, NULL, NULL, NULL),
(157, 54, '0.08', '1.00', 2, '0.000', '0.700', NULL, NULL, NULL, NULL),
(158, 54, '1.00', '12.00', 2, '0.000', '0.700', NULL, NULL, NULL, NULL),
(159, 54, '12.00', '60.00', 0, '0.000', '0.700', NULL, NULL, NULL, NULL),
(160, 54, '12.00', '60.00', 1, '0.000', '0.700', NULL, NULL, NULL, NULL),
(161, 54, '60.00', '999.00', 2, '0.000', '0.700', NULL, NULL, NULL, NULL),
(162, 55, '0.00', '0.02', 2, '0.000', '0.400', NULL, NULL, NULL, NULL),
(163, 55, '0.02', '0.08', 2, '0.000', '0.400', NULL, NULL, NULL, NULL),
(164, 55, '0.08', '1.00', 2, '0.000', '0.400', NULL, NULL, NULL, NULL),
(165, 55, '1.00', '12.00', 2, '0.000', '0.400', NULL, NULL, NULL, NULL),
(166, 55, '12.00', '60.00', 0, '0.000', '0.400', NULL, NULL, NULL, NULL),
(167, 55, '12.00', '60.00', 1, '0.000', '0.400', NULL, NULL, NULL, NULL),
(168, 55, '60.00', '999.00', 2, '0.000', '0.400', NULL, NULL, NULL, NULL),
(169, 56, '0.00', '0.02', 2, '0.000', '0.100', NULL, NULL, NULL, NULL),
(170, 56, '0.02', '0.08', 2, '0.000', '0.100', NULL, NULL, NULL, NULL),
(171, 56, '0.08', '1.00', 2, '0.000', '0.100', NULL, NULL, NULL, NULL),
(172, 56, '1.00', '12.00', 2, '0.000', '0.100', NULL, NULL, NULL, NULL),
(173, 56, '12.00', '60.00', 0, '0.000', '0.100', NULL, NULL, NULL, NULL),
(174, 56, '12.00', '60.00', 1, '0.000', '0.100', NULL, NULL, NULL, NULL),
(175, 56, '60.00', '999.00', 2, '0.000', '0.100', NULL, NULL, NULL, NULL),
(176, 57, '0.00', '0.02', 2, '37.000', '72.000', NULL, NULL, NULL, NULL),
(177, 57, '0.02', '0.08', 2, '37.000', '72.000', NULL, NULL, NULL, NULL),
(178, 57, '0.08', '1.00', 2, '37.000', '72.000', NULL, NULL, NULL, NULL),
(179, 57, '1.00', '12.00', 2, '37.000', '72.000', NULL, NULL, NULL, NULL),
(180, 57, '12.00', '60.00', 0, '37.000', '72.000', NULL, NULL, NULL, NULL),
(181, 57, '12.00', '60.00', 1, '37.000', '72.000', NULL, NULL, NULL, NULL),
(182, 57, '60.00', '999.00', 2, '37.000', '72.000', NULL, NULL, NULL, NULL),
(183, 58, '0.00', '0.02', 2, '20.000', '50.000', NULL, NULL, NULL, NULL),
(184, 58, '0.02', '0.08', 2, '20.000', '50.000', NULL, NULL, NULL, NULL),
(185, 58, '0.08', '1.00', 2, '20.000', '50.000', NULL, NULL, NULL, NULL),
(186, 58, '1.00', '12.00', 2, '20.000', '50.000', NULL, NULL, NULL, NULL),
(187, 58, '12.00', '60.00', 0, '20.000', '50.000', NULL, NULL, NULL, NULL),
(188, 58, '12.00', '60.00', 1, '20.000', '50.000', NULL, NULL, NULL, NULL),
(189, 58, '60.00', '999.00', 2, '20.000', '50.000', NULL, NULL, NULL, NULL),
(190, 59, '0.00', '0.02', 2, '0.000', '14.000', NULL, NULL, NULL, NULL),
(191, 59, '0.02', '0.08', 2, '0.000', '14.000', NULL, NULL, NULL, NULL),
(192, 59, '0.08', '1.00', 2, '0.000', '14.000', NULL, NULL, NULL, NULL),
(193, 59, '1.00', '12.00', 2, '0.000', '14.000', NULL, NULL, NULL, NULL),
(194, 59, '12.00', '60.00', 0, '0.000', '14.000', NULL, NULL, NULL, NULL),
(195, 59, '12.00', '60.00', 1, '0.000', '14.000', NULL, NULL, NULL, NULL),
(196, 59, '60.00', '999.00', 2, '0.000', '14.000', NULL, NULL, NULL, NULL),
(197, 60, '0.00', '0.02', 2, '0.000', '6.000', NULL, NULL, NULL, NULL),
(198, 60, '0.02', '0.08', 2, '0.000', '6.000', NULL, NULL, NULL, NULL),
(199, 60, '0.08', '1.00', 2, '0.000', '6.000', NULL, NULL, NULL, NULL),
(200, 60, '1.00', '12.00', 2, '0.000', '6.000', NULL, NULL, NULL, NULL),
(201, 60, '12.00', '60.00', 0, '0.000', '6.000', NULL, NULL, NULL, NULL),
(202, 60, '12.00', '60.00', 1, '0.000', '6.000', NULL, NULL, NULL, NULL),
(203, 60, '60.00', '999.00', 2, '0.000', '6.000', NULL, NULL, NULL, NULL),
(204, 61, '0.00', '0.02', 2, '0.000', '1.000', NULL, NULL, NULL, NULL),
(205, 61, '0.02', '0.08', 2, '0.000', '1.000', NULL, NULL, NULL, NULL),
(206, 61, '0.08', '1.00', 2, '0.000', '1.000', NULL, NULL, NULL, NULL),
(207, 61, '1.00', '12.00', 2, '0.000', '1.000', NULL, NULL, NULL, NULL),
(208, 61, '12.00', '60.00', 0, '0.000', '1.000', NULL, NULL, NULL, NULL),
(209, 61, '12.00', '60.00', 1, '0.000', '1.000', NULL, NULL, NULL, NULL),
(210, 61, '60.00', '999.00', 2, '0.000', '1.000', NULL, NULL, NULL, NULL),
(211, 62, NULL, NULL, NULL, NULL, NULL, 'Reactive', NULL, NULL, NULL),
(212, 62, NULL, NULL, NULL, NULL, NULL, 'Non Reactive', NULL, NULL, NULL),
(213, 84, NULL, NULL, NULL, NULL, NULL, 'Positive', NULL, NULL, NULL),
(214, 84, NULL, NULL, NULL, NULL, NULL, 'Negative', NULL, NULL, NULL),
(215, 91, NULL, NULL, NULL, NULL, NULL, 'Low', NULL, NULL, NULL),
(216, 91, NULL, NULL, NULL, NULL, NULL, 'High', NULL, NULL, NULL),
(217, 91, NULL, NULL, NULL, NULL, NULL, 'Normal', NULL, NULL, NULL),
(218, 92, NULL, NULL, NULL, NULL, NULL, 'High', NULL, NULL, NULL),
(219, 92, NULL, NULL, NULL, NULL, NULL, 'Low', NULL, NULL, NULL),
(220, 92, NULL, NULL, NULL, NULL, NULL, 'Normal', NULL, NULL, NULL),
(221, 93, NULL, NULL, NULL, NULL, NULL, 'High', NULL, NULL, NULL),
(222, 93, NULL, NULL, NULL, NULL, NULL, 'Low', NULL, NULL, NULL),
(223, 93, NULL, NULL, NULL, NULL, NULL, 'Normal', NULL, NULL, NULL),
(224, 94, NULL, NULL, NULL, NULL, NULL, 'Positive', NULL, NULL, NULL),
(225, 94, NULL, NULL, NULL, NULL, NULL, 'Negative', NULL, NULL, NULL),
(226, 95, NULL, NULL, NULL, NULL, NULL, 'Positive', NULL, NULL, NULL),
(227, 95, NULL, NULL, NULL, NULL, NULL, 'Negative', NULL, NULL, NULL),
(228, 96, NULL, NULL, NULL, NULL, NULL, 'Positive', NULL, NULL, NULL),
(229, 96, NULL, NULL, NULL, NULL, NULL, 'Negative', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `measure_types`
--

DROP TABLE IF EXISTS `measure_types`;
CREATE TABLE `measure_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `measure_types`
--

INSERT INTO `measure_types` (`id`, `name`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Numeric Range', NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(2, 'Alphanumeric Values', NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(3, 'Autocomplete', NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(4, 'Free Text', NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25');

-- --------------------------------------------------------

--
-- Table structure for table `metrics`
--

DROP TABLE IF EXISTS `metrics`;
CREATE TABLE `metrics` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`migration`, `batch`) VALUES
('2014_07_24_082711_CreatekBLIStables', 1),
('2014_09_02_114206_entrust_setup_tables', 1),
('2014_10_09_162222_externaldumptable', 1),
('2015_02_04_004704_add_index_to_parentlabno', 1),
('2015_02_11_112608_remove_unique_constraint_on_patient_number', 1),
('2015_02_17_104134_qc_tables', 1),
('2015_02_23_112018_create_microbiology_tables', 1),
('2015_02_27_084341_createInventoryTables', 1),
('2015_03_16_155558_create_surveillance', 1),
('2015_06_24_145526_update_test_types_table', 1),
('2015_06_24_154426_FreeTestsColumn', 1),
('2016_03_30_145749_lab_config_settings', 1),
('2016_07_26_095319_create_unhls_financial_years_table', 1),
('2016_07_26_095409_create_unhls_drugs_table', 1),
('2016_08_17_181955_create_rejection_reasons', 1),
('2016_08_31_135348_create_unhls_stockcard', 1),
('2016_08_31_135420_create_unhls_stockrequisition', 1),
('2016_09_28_091952_create_unhls_warehouse', 1),
('2016_09_28_095327_create_unhls_staff', 1),
('2016_10_03_220056_create_bbincidences_table', 1),
('2016_10_03_220511_create_bbactions_table', 1),
('2016_10_03_220622_create_bbcauses_table', 1),
('2016_10_03_220702_create_bbnatures_table', 1),
('2016_10_03_220852_create_bbincidences_action_table', 1),
('2016_10_03_220959_create_bbincidences_cause_table', 1),
('2016_10_03_221055_create_bbincidences_nature_table', 1),
('2016_10_13_170615_create_unhls_equipment_suppliers_table', 1),
('2016_10_19_115152_create_referral_reasons', 1),
('2017_01_16_103507_create_equipment_inventory_table', 1),
('2017_01_16_103533_create_equipment_maintenance_table', 1),
('2017_01_16_103546_create_equipment_breakdown_table', 1),
('2017_04_27_134821_create_wards_table', 1),
('2017_04_27_144035_update_visits_table', 1),
('2017_04_27_160407_create_therapy_table', 1),
('2017_05_25_131728_updateUNHLSBreakdown', 1),
('2017_06_19_094902_update_equipment_inventory_table', 1),
('2017_06_19_111831_update_equipment_breakdown_table', 1),
('2017_06_19_115028_update_unhls_stockcard_table', 1),
('2017_06_20_043838_alter_stockcard_table', 1),
('2017_06_30_183112_update_microbiology_functionalities', 1),
('2017_07_05_170430_create_reports_tables', 1),
('2017_07_27_160147_create_visit_status_table', 1),
('2017_07_27_160228_add_status_column_to_visit_table', 1),
('2017_07_28_113854_add_clinical_notes_column_to_table', 1),
('2017_07_28_120834_add_phone_contact_column_to_table', 1),
('2017_07_31_020011_create_uuids_table', 1),
('2017_08_02_192917_alter_specimen_id_nullable_unhls_tests', 1),
('2017_08_22_080201_create_test_name_mappings_table', 1),
('2017_10_10_094958_update_hiv_report_table', 1),
('2017_10_15_122554_adhoc_configs_table', 1),
('2017_11_07_160414_create_instrument_column_tables', 1),
('2017_11_15_121513_update_visit_table', 1),
('2018_01_12_152202_add_column_range_interpretion', 1);

-- --------------------------------------------------------

--
-- Table structure for table `organisms`
--

DROP TABLE IF EXISTS `organisms`;
CREATE TABLE `organisms` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `organisms`
--

INSERT INTO `organisms` (`id`, `name`, `description`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Pseudomonas aeruginosa', NULL, NULL, '2017-05-31 11:29:37', '2017-05-31 11:29:37'),
(2, 'Escherichia coli', NULL, NULL, '2017-05-31 11:29:38', '2017-05-31 11:29:38'),
(3, 'Enterobacteriacae', NULL, NULL, '2017-05-31 11:29:40', '2017-05-31 11:29:40'),
(5, 'Pseudomonas flourescens', NULL, NULL, '2017-05-31 11:29:43', '2017-05-31 11:29:43'),
(6, 'Pseudomonas spp', NULL, NULL, '2017-05-31 11:29:44', '2017-05-31 11:29:44'),
(12, 'Acinetobacter spp', NULL, NULL, '2017-05-31 11:29:47', '2017-05-31 11:29:47'),
(13, 'Acinetobacter baumannii', NULL, NULL, '2017-05-31 11:29:48', '2017-05-31 11:29:48'),
(16, 'Salmonella spp', NULL, NULL, '2017-05-31 11:29:50', '2017-05-31 11:29:50'),
(17, 'Salmonella typhi', NULL, NULL, '2017-05-31 11:29:51', '2017-05-31 11:29:51'),
(18, 'Salmonella paratyphi B', NULL, NULL, '2017-05-31 11:29:51', '2017-05-31 11:29:51'),
(19, 'Salmonella choleraesuis', NULL, NULL, '2017-05-31 11:29:52', '2017-05-31 11:29:52'),
(20, 'Vibrio cholerae', NULL, NULL, '2017-05-31 11:29:52', '2017-05-31 11:29:52'),
(21, 'Viridans streptococcus', NULL, NULL, '2017-05-31 11:29:52', '2017-05-31 11:29:52'),
(22, 'Staphylococcus aureas', NULL, '2017-06-25 13:34:14', '2017-05-31 11:29:53', '2017-06-25 13:34:14'),
(23, 'Staphylococcus aureus', NULL, NULL, '2017-05-31 11:29:54', '2017-05-31 11:29:54'),
(24, 'Staphylococcus epidermidis', NULL, NULL, '2017-05-31 11:29:55', '2017-05-31 11:29:55'),
(25, 'Staphylococcus spp', NULL, NULL, '2017-05-31 11:29:56', '2017-05-31 11:29:56'),
(26, 'Staphylococus aureus', NULL, '2017-06-25 13:35:55', '2017-05-31 11:29:57', '2017-06-25 13:35:55'),
(29, 'Staphylococcus horminis', NULL, NULL, '2017-05-31 11:30:00', '2017-05-31 11:30:00'),
(30, 'Staphylococcus pasteuri.', NULL, NULL, '2017-05-31 11:30:01', '2017-05-31 11:30:01'),
(31, 'Staphylococcus saprophyticus', NULL, NULL, '2017-05-31 11:30:02', '2017-05-31 11:30:02'),
(32, 'Enterobacter spp', NULL, NULL, '2017-05-31 11:30:03', '2017-05-31 11:30:03'),
(33, 'Enterobacter cloacae', NULL, NULL, '2017-05-31 11:30:04', '2017-05-31 11:30:04'),
(34, 'Enterococcus spp', NULL, NULL, '2017-05-31 11:30:05', '2017-05-31 11:30:05'),
(35, 'Enterococcus feacalis', NULL, NULL, '2017-05-31 11:30:06', '2017-05-31 11:30:06'),
(36, 'Streptococcus spp', NULL, NULL, '2017-05-31 11:30:07', '2017-05-31 11:30:07'),
(37, 'Burkholderia cepacia', NULL, NULL, '2017-05-31 11:30:07', '2017-05-31 11:30:07'),
(38, 'Burkholderia mallei', NULL, NULL, '2017-05-31 11:30:08', '2017-05-31 11:30:08'),
(39, 'Burkholderia pseudomallei', NULL, NULL, '2017-05-31 11:30:08', '2017-05-31 11:30:08'),
(40, 'Neisseria spp', NULL, NULL, '2017-05-31 11:30:09', '2017-05-31 11:30:09'),
(41, 'Neisseria gonorrhae', NULL, NULL, '2017-05-31 11:30:09', '2017-05-31 11:30:09'),
(42, 'Neisseria gonorrhoeae', NULL, NULL, '2017-05-31 11:30:09', '2017-05-31 11:30:09'),
(43, 'Neisseria meningitidis', NULL, NULL, '2017-05-31 11:30:10', '2017-05-31 11:30:10'),
(44, 'Haemophilus spp', NULL, NULL, '2017-05-31 11:30:10', '2017-05-31 11:30:10'),
(45, 'Haemophilus influenzae spp', NULL, NULL, '2017-05-31 11:30:11', '2017-05-31 11:30:11'),
(46, 'Haemophilus influenzae type B', NULL, NULL, '2017-05-31 11:30:12', '2017-05-31 11:30:12'),
(47, 'Haemophilus influenzae isolated', NULL, '2017-06-25 14:15:27', '2017-05-31 11:30:12', '2017-06-25 14:15:27'),
(48, 'Haemophilus influenzae nontypaeble', NULL, NULL, '2017-05-31 11:30:13', '2017-05-31 11:30:13'),
(52, 'Haemophilus influenza', NULL, NULL, '2017-05-31 11:30:16', '2017-05-31 11:30:16'),
(53, 'Haemophilus ducreyi', NULL, NULL, '2017-05-31 11:30:16', '2017-05-31 11:30:16'),
(54, 'Haemophilus aphrophilus', NULL, NULL, '2017-05-31 11:30:17', '2017-05-31 11:30:17'),
(55, 'Haemophilus aegyptius', NULL, NULL, '2017-05-31 11:30:17', '2017-05-31 11:30:17'),
(56, 'Haemophilus parainfluenzae', NULL, NULL, '2017-05-31 11:30:18', '2017-05-31 11:30:18'),
(61, 'Streptococcus pneumoniae', NULL, NULL, '2017-05-31 11:30:21', '2017-05-31 11:30:21'),
(67, 'Enterobacter aerogenes', NULL, NULL, '2017-05-31 11:30:27', '2017-05-31 11:30:27'),
(68, 'Edwardsiella tarda', NULL, NULL, '2017-05-31 11:30:28', '2017-05-31 11:30:28'),
(69, 'Ehrlichia chaffeensis', NULL, NULL, '2017-05-31 11:30:29', '2017-05-31 11:30:29'),
(70, 'Ehrlicia chaffeensis', NULL, '2017-06-25 13:28:41', '2017-05-31 11:30:30', '2017-06-25 13:28:41'),
(71, 'Eikenella corrodens', NULL, NULL, '2017-05-31 11:30:31', '2017-05-31 11:30:31'),
(72, 'Klebsiella pneumoniae', NULL, NULL, '2017-05-31 11:30:32', '2017-05-31 11:30:32'),
(74, 'Klebsiella oxytoca', NULL, NULL, '2017-05-31 11:30:35', '2017-05-31 11:30:35'),
(75, 'Kelbsiella spp', NULL, NULL, '2017-05-31 11:30:36', '2017-05-31 11:30:36'),
(76, 'Kingella kingae', NULL, NULL, '2017-05-31 11:30:38', '2017-05-31 11:30:38'),
(77, 'Proteus mirabilis', NULL, NULL, '2017-05-31 11:30:39', '2017-05-31 11:30:39'),
(79, 'Citrobacter freundi', NULL, '2017-06-25 13:27:19', '2017-05-31 11:30:41', '2017-06-25 13:27:19'),
(80, 'Citrobacter freundii', NULL, NULL, '2017-05-31 11:30:43', '2017-05-31 11:30:43'),
(81, 'Citrobacter spp', NULL, NULL, '2017-05-31 11:30:44', '2017-05-31 11:30:44'),
(83, 'Providencia spp', NULL, NULL, '2017-05-31 11:30:46', '2017-05-31 11:30:46'),
(84, 'Proteus valgaris', NULL, NULL, '2017-05-31 11:30:48', '2017-05-31 11:30:48'),
(87, 'Providentia rettgeri', NULL, NULL, '2017-05-31 11:30:51', '2017-05-31 11:30:51'),
(88, 'Providentia stuartii', NULL, NULL, '2017-05-31 11:30:52', '2017-05-31 11:30:52'),
(89, 'Salmonella nontyphi group B', NULL, NULL, '2017-05-31 11:30:53', '2017-05-31 11:30:53'),
(90, 'Stenotrophomonas maltophilia', NULL, NULL, '2017-05-31 11:30:53', '2017-05-31 11:30:53'),
(91, 'Morganella morganii', NULL, NULL, '2017-05-31 11:30:54', '2017-05-31 11:30:54'),
(95, 'Morganella spp', NULL, NULL, '2017-05-31 11:30:58', '2017-05-31 11:30:58'),
(96, 'Salmonella paratyphi A', NULL, NULL, '2017-05-31 11:30:59', '2017-05-31 11:30:59'),
(97, 'Enterrococcus faecium', NULL, NULL, '2017-05-31 11:31:00', '2017-05-31 11:31:00'),
(98, 'Shigella boydii', NULL, NULL, '2017-05-31 11:31:01', '2017-05-31 11:31:01'),
(99, 'Shigella dysenteriae', NULL, NULL, '2017-05-31 11:31:01', '2017-05-31 11:31:01'),
(100, 'Shigella flexneri', NULL, NULL, '2017-05-31 11:31:01', '2017-05-31 11:31:01'),
(101, 'Shigella sonnei', NULL, NULL, '2017-05-31 11:31:02', '2017-05-31 11:31:02'),
(102, 'Streptococcus pyogenes', NULL, NULL, '2017-05-31 11:31:02', '2017-05-31 11:31:02'),
(103, 'Streptococcus pyogenes (Group A Strep)', NULL, NULL, '2017-05-31 11:31:03', '2017-05-31 11:31:03'),
(107, 'Streptococcus salivarius', NULL, NULL, '2017-05-31 11:31:05', '2017-05-31 11:31:05'),
(108, 'Streptococcus sanguis', NULL, NULL, '2017-05-31 11:31:05', '2017-05-31 11:31:05'),
(109, 'Salmonella group B', NULL, NULL, '2017-05-31 11:31:06', '2017-05-31 11:31:06'),
(110, 'Moraxella spp', NULL, NULL, '2017-05-31 11:31:07', '2017-05-31 11:31:07'),
(111, 'Coagulase-negative Staphylococcus', NULL, NULL, '2017-05-31 11:31:07', '2017-05-31 11:31:07');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'manage_incidents', 'Can Manage Biorisk & Biosecurity Incidents', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(2, 'register_incident', 'Can Register BB Incidences', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(3, 'summary_log', 'Can view BB summary log', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(4, 'facility_report', 'Can create faility BB report', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(5, 'view_names', 'Can view patient names', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(6, 'manage_patients', 'Can add patients', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(7, 'receive_external_test', 'Can receive test requests', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(8, 'request_test', 'Can request new test', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(9, 'accept_test_specimen', 'Can accept test specimen', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(10, 'reject_test_specimen', 'Can reject test specimen', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(11, 'change_test_specimen', 'Can change test specimen', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(12, 'start_test', 'Can start tests', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(13, 'enter_test_results', 'Can enter tests results', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(14, 'edit_test_results', 'Can edit test results', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(15, 'verify_test_results', 'Can verify test results', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(16, 'send_results_to_external_system', 'Can send test results to external systems', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(17, 'refer_specimens', 'Can refer specimens', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(18, 'manage_users', 'Can manage users', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(19, 'manage_test_catalog', 'Can manage test catalog', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(20, 'manage_lab_configurations', 'Can manage lab configurations', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(21, 'view_reports', 'Can view reports', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(22, 'manage_inventory', 'Can manage inventory', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(23, 'request_topup', 'Can request top-up', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(24, 'manage_qc', 'Can manage Quality Control', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(25, 'manage_appointments', 'Can manage appointments with Clinician', '2018-01-29 13:00:26', '2018-01-29 13:00:26'),
(26, 'make_labrequests', 'Can make lab requests(Only for Clinicians)', '2018-01-29 13:00:26', '2018-01-29 13:00:26'),
(27, 'manage_visits', 'Can manage visit content', '2018-01-29 13:00:26', '2018-01-29 13:00:26'),
(28, 'patient_approve', 'Can approve hb forms', '2018-02-05 02:00:00', '2018-02-04 21:00:00'),
(29, 'patient_create_worksheet', 'can create hb worksheet', '2018-02-04 21:00:00', '2018-02-04 21:00:00'),
(30, 'create_hb_patient', 'Can create hepatitis b patient', '2018-02-05 21:00:00', '2018-02-15 21:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

DROP TABLE IF EXISTS `permission_role`;
CREATE TABLE `permission_role` (
  `id` int(10) UNSIGNED NOT NULL,
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`id`, `permission_id`, `role_id`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 1),
(5, 5, 1),
(6, 6, 1),
(7, 7, 1),
(8, 8, 1),
(9, 9, 1),
(10, 10, 1),
(11, 11, 1),
(12, 12, 1),
(13, 13, 1),
(14, 14, 1),
(15, 15, 1),
(16, 16, 1),
(17, 17, 1),
(18, 18, 1),
(19, 19, 1),
(20, 20, 1),
(21, 21, 1),
(22, 22, 1),
(23, 23, 1),
(24, 24, 1),
(25, 25, 1),
(26, 26, 1),
(27, 27, 1),
(28, 1, 1),
(29, 2, 1),
(30, 3, 1),
(31, 4, 1),
(32, 5, 1),
(33, 6, 1),
(34, 7, 1),
(35, 8, 1),
(36, 9, 1),
(37, 10, 1),
(38, 11, 1),
(39, 12, 1),
(40, 13, 1),
(41, 14, 1),
(42, 15, 1),
(43, 16, 1),
(44, 17, 1),
(45, 18, 1),
(46, 19, 1),
(47, 20, 1),
(48, 21, 1),
(49, 22, 1),
(50, 23, 1),
(51, 24, 1),
(52, 25, 1),
(53, 26, 1),
(54, 27, 1),
(55, 28, 5),
(56, 1, 1),
(57, 2, 1),
(58, 3, 1),
(59, 4, 1),
(60, 5, 1),
(61, 6, 1),
(62, 7, 1),
(63, 8, 1),
(64, 9, 1),
(65, 10, 1),
(66, 11, 1),
(67, 12, 1),
(68, 13, 1),
(69, 14, 1),
(70, 15, 1),
(71, 16, 1),
(72, 17, 1),
(73, 18, 1),
(74, 19, 1),
(75, 20, 1),
(76, 21, 1),
(77, 22, 1),
(78, 23, 1),
(79, 24, 1),
(80, 25, 1),
(81, 26, 1),
(82, 27, 1),
(83, 28, 5),
(84, 29, 6),
(85, 1, 1),
(86, 2, 1),
(87, 3, 1),
(88, 4, 1),
(89, 5, 1),
(90, 6, 1),
(91, 7, 1),
(92, 8, 1),
(93, 9, 1),
(94, 10, 1),
(95, 11, 1),
(96, 12, 1),
(97, 13, 1),
(98, 14, 1),
(99, 15, 1),
(100, 16, 1),
(101, 17, 1),
(102, 18, 1),
(103, 19, 1),
(104, 20, 1),
(105, 21, 1),
(106, 22, 1),
(107, 23, 1),
(108, 24, 1),
(109, 25, 1),
(110, 26, 1),
(111, 27, 1),
(112, 28, 5),
(113, 29, 6),
(114, 30, 4);

-- --------------------------------------------------------

--
-- Table structure for table `pre_analytic_specimen_rejections`
--

DROP TABLE IF EXISTS `pre_analytic_specimen_rejections`;
CREATE TABLE `pre_analytic_specimen_rejections` (
  `id` int(10) UNSIGNED NOT NULL,
  `specimen_id` int(10) UNSIGNED NOT NULL,
  `rejected_by` int(10) UNSIGNED NOT NULL,
  `rejection_reason_id` int(10) UNSIGNED DEFAULT NULL,
  `reject_explained_to` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `time_rejected` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `receipts`
--

DROP TABLE IF EXISTS `receipts`;
CREATE TABLE `receipts` (
  `id` int(10) UNSIGNED NOT NULL,
  `commodity_id` int(10) UNSIGNED NOT NULL,
  `supplier_id` int(10) UNSIGNED NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL,
  `batch_no` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `expiry_date` date NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `referrals`
--

DROP TABLE IF EXISTS `referrals`;
CREATE TABLE `referrals` (
  `id` int(10) UNSIGNED NOT NULL,
  `sample_obtainer` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `cadre_obtainer` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `sample_date` date NOT NULL,
  `sample_time` timestamp NULL DEFAULT NULL,
  `time_dispatch` timestamp NULL DEFAULT NULL,
  `storage_condition` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `transport_type` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(10) UNSIGNED NOT NULL,
  `referral_reason` int(10) UNSIGNED NOT NULL,
  `priority_specimen` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `facility_id` int(10) UNSIGNED NOT NULL,
  `person` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `contacts` text COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `referral_reasons`
--

DROP TABLE IF EXISTS `referral_reasons`;
CREATE TABLE `referral_reasons` (
  `id` int(10) UNSIGNED NOT NULL,
  `reason` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rejection_reasons`
--

DROP TABLE IF EXISTS `rejection_reasons`;
CREATE TABLE `rejection_reasons` (
  `id` int(10) UNSIGNED NOT NULL,
  `reason` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `rejection_reasons`
--

INSERT INTO `rejection_reasons` (`id`, `reason`) VALUES
(1, 'Inadequate sample volume'),
(2, 'Haemolysed sample'),
(3, 'Specimen without lab request form'),
(4, 'No test ordered on  lab request form of sample'),
(5, 'No sample label or identifier'),
(6, 'Wrong sample label'),
(7, 'Unclear sample label'),
(8, 'Sample in wrong container'),
(9, 'Damaged/broken/leaking sample container'),
(10, 'Too old sample'),
(11, 'Date of sample collection not specified'),
(12, 'Time of sample collection not specified'),
(13, 'Improper transport media'),
(14, 'Sample type unacceptable for required test'),
(15, 'Other');

-- --------------------------------------------------------

--
-- Table structure for table `report_diseases`
--

DROP TABLE IF EXISTS `report_diseases`;
CREATE TABLE `report_diseases` (
  `id` int(10) UNSIGNED NOT NULL,
  `test_type_id` int(10) UNSIGNED NOT NULL,
  `disease_id` int(10) UNSIGNED NOT NULL,
  `result_interpretation_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `report_diseases`
--

INSERT INTO `report_diseases` (`id`, `test_type_id`, `disease_id`, `result_interpretation_id`) VALUES
(1, 2, 1, NULL),
(2, 7, 2, NULL),
(3, 18, 3, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `result_interpretations`
--

DROP TABLE IF EXISTS `result_interpretations`;
CREATE TABLE `result_interpretations` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `result_interpretations`
--

INSERT INTO `result_interpretations` (`id`, `name`) VALUES
(1, 'High'),
(2, 'Normal'),
(3, 'Low'),
(4, 'HGB<8'),
(5, 'HGB≥8'),
(6, 'Positive'),
(7, 'Negative');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Superadmin', NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(2, 'Technologist', NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(3, 'Receptionist', NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(4, 'Data entrant', NULL, '2018-02-05 13:00:25', '2018-01-29 13:00:25'),
(5, 'Data QC\r\n\r\n', NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(6, 'Laboratory ', NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(7, 'Lab', NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25');

-- --------------------------------------------------------

--
-- Table structure for table `specimens`
--

DROP TABLE IF EXISTS `specimens`;
CREATE TABLE `specimens` (
  `id` int(10) UNSIGNED NOT NULL,
  `specimen_type_id` int(10) UNSIGNED NOT NULL,
  `specimen_status_id` int(10) UNSIGNED NOT NULL DEFAULT '2',
  `accepted_by` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `referral_id` int(10) UNSIGNED DEFAULT NULL,
  `time_collected` timestamp NULL DEFAULT NULL,
  `time_accepted` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `specimen_statuses`
--

DROP TABLE IF EXISTS `specimen_statuses`;
CREATE TABLE `specimen_statuses` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(45) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `specimen_statuses`
--

INSERT INTO `specimen_statuses` (`id`, `name`) VALUES
(1, 'specimen-not-collected'),
(2, 'specimen-accepted'),
(3, 'specimen-rejected');

-- --------------------------------------------------------

--
-- Table structure for table `specimen_types`
--

DROP TABLE IF EXISTS `specimen_types`;
CREATE TABLE `specimen_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `specimen_types`
--

INSERT INTO `specimen_types` (`id`, `name`, `description`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Ascitic Tap', NULL, NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(2, 'Dried Blood Spot', NULL, NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(3, 'Nasal Swab', NULL, NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(4, 'Pleural Tap', NULL, NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(5, 'Rectal Swab', NULL, NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(6, 'Semen', NULL, NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(7, 'Skin', NULL, NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(8, 'Vomitus', NULL, NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(9, 'Synovial Fluid', NULL, NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(10, 'Urethral Smear', NULL, NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(11, 'Vaginal Smear', NULL, NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(12, 'Water', NULL, NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(13, 'Stool', NULL, NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(14, 'CSF', NULL, NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(15, 'Wound swab', NULL, NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(16, 'Pus swab', NULL, NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(17, 'HVS', NULL, NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(18, 'Eye swab', NULL, NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(19, 'Ear swab', NULL, NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(20, 'Throat swab', NULL, NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(21, 'Pus Aspirate', NULL, NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(22, 'Blood', NULL, NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(23, 'BAL', NULL, NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(24, 'Sputum', NULL, NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(25, 'Uretheral swab', NULL, NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(26, 'Urine', NULL, NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25');

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
CREATE TABLE `suppliers` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `phone_no` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `physical_address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `testtype_measures`
--

DROP TABLE IF EXISTS `testtype_measures`;
CREATE TABLE `testtype_measures` (
  `id` int(10) UNSIGNED NOT NULL,
  `test_type_id` int(10) UNSIGNED NOT NULL,
  `measure_id` int(10) UNSIGNED NOT NULL,
  `ordering` tinyint(4) DEFAULT NULL,
  `nesting` tinyint(4) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `testtype_measures`
--

INSERT INTO `testtype_measures` (`id`, `test_type_id`, `measure_id`, `ordering`, `nesting`) VALUES
(1, 1, 1, NULL, NULL),
(2, 1, 2, NULL, NULL),
(3, 1, 3, NULL, NULL),
(4, 2, 4, NULL, NULL),
(5, 3, 5, NULL, NULL),
(6, 3, 6, NULL, NULL),
(7, 4, 7, NULL, NULL),
(8, 5, 8, NULL, NULL),
(9, 5, 9, NULL, NULL),
(10, 5, 10, NULL, NULL),
(11, 5, 11, NULL, NULL),
(12, 5, 12, NULL, NULL),
(13, 5, 13, NULL, NULL),
(14, 5, 14, NULL, NULL),
(15, 5, 15, NULL, NULL),
(16, 5, 16, NULL, NULL),
(17, 5, 17, NULL, NULL),
(18, 5, 18, NULL, NULL),
(19, 5, 19, NULL, NULL),
(20, 5, 20, NULL, NULL),
(21, 5, 21, NULL, NULL),
(22, 5, 22, NULL, NULL),
(23, 6, 23, NULL, NULL),
(24, 6, 24, NULL, NULL),
(25, 6, 25, NULL, NULL),
(26, 6, 26, NULL, NULL),
(27, 6, 27, NULL, NULL),
(28, 6, 28, NULL, NULL),
(29, 7, 29, NULL, NULL),
(30, 8, 30, NULL, NULL),
(31, 9, 31, NULL, NULL),
(32, 10, 32, NULL, NULL),
(33, 11, 33, NULL, NULL),
(34, 12, 34, NULL, NULL),
(35, 13, 35, NULL, NULL),
(36, 14, 36, NULL, NULL),
(37, 15, 37, NULL, NULL),
(38, 16, 38, NULL, NULL),
(39, 16, 39, NULL, NULL),
(40, 16, 40, NULL, NULL),
(41, 16, 41, NULL, NULL),
(42, 16, 42, NULL, NULL),
(43, 16, 43, NULL, NULL),
(44, 16, 44, NULL, NULL),
(45, 16, 45, NULL, NULL),
(46, 16, 46, NULL, NULL),
(47, 16, 47, NULL, NULL),
(48, 16, 48, NULL, NULL),
(49, 16, 49, NULL, NULL),
(50, 16, 50, NULL, NULL),
(51, 16, 51, NULL, NULL),
(52, 16, 52, NULL, NULL),
(53, 16, 53, NULL, NULL),
(54, 16, 54, NULL, NULL),
(55, 16, 55, NULL, NULL),
(56, 16, 56, NULL, NULL),
(57, 16, 57, NULL, NULL),
(58, 16, 58, NULL, NULL),
(59, 16, 59, NULL, NULL),
(60, 16, 60, NULL, NULL),
(61, 16, 61, NULL, NULL),
(62, 34, 69, NULL, NULL),
(63, 35, 70, NULL, NULL),
(64, 36, 71, NULL, NULL),
(65, 37, 72, NULL, NULL),
(66, 38, 73, NULL, NULL),
(67, 39, 74, NULL, NULL),
(68, 40, 75, NULL, NULL),
(69, 41, 76, NULL, NULL),
(70, 42, 77, NULL, NULL),
(71, 21, 78, NULL, NULL),
(72, 43, 79, NULL, NULL),
(73, 44, 80, NULL, NULL),
(74, 27, 62, NULL, NULL),
(75, 28, 63, NULL, NULL),
(76, 29, 64, NULL, NULL),
(77, 30, 65, NULL, NULL),
(78, 31, 66, NULL, NULL),
(79, 32, 67, NULL, NULL),
(80, 33, 68, NULL, NULL),
(81, 18, 82, NULL, NULL),
(82, 19, 83, NULL, NULL),
(83, 17, 81, NULL, NULL),
(84, 20, 84, NULL, NULL),
(85, 21, 85, NULL, NULL),
(86, 22, 86, NULL, NULL),
(87, 24, 87, NULL, NULL),
(88, 25, 88, NULL, NULL),
(89, 26, 89, NULL, NULL),
(90, 45, 97, NULL, NULL),
(91, 46, 98, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `testtype_specimentypes`
--

DROP TABLE IF EXISTS `testtype_specimentypes`;
CREATE TABLE `testtype_specimentypes` (
  `id` int(10) UNSIGNED NOT NULL,
  `test_type_id` int(10) UNSIGNED NOT NULL,
  `specimen_type_id` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `testtype_specimentypes`
--

INSERT INTO `testtype_specimentypes` (`id`, `test_type_id`, `specimen_type_id`) VALUES
(1, 1, 22),
(2, 2, 22),
(3, 3, 22),
(4, 4, 22),
(5, 4, 3),
(6, 4, 4),
(7, 4, 8),
(8, 6, 22),
(9, 7, 22),
(10, 8, 22),
(11, 9, 22),
(12, 10, 22),
(13, 11, 26),
(14, 12, 22),
(15, 13, 26),
(16, 14, 22),
(17, 15, 13),
(18, 16, 22),
(19, 34, 26),
(20, 35, 26),
(21, 36, 26),
(22, 37, 26),
(23, 38, 26),
(24, 39, 26),
(25, 40, 26),
(26, 41, 26),
(27, 42, 26),
(28, 21, 26),
(29, 43, 26),
(30, 44, 26),
(31, 18, 13),
(32, 17, 13),
(33, 26, 13),
(34, 18, 26),
(35, 17, 26),
(36, 17, 14),
(37, 21, 14),
(38, 20, 14),
(39, 24, 14),
(40, 19, 14),
(41, 25, 14),
(42, 18, 14),
(43, 27, 14),
(44, 28, 14),
(45, 29, 14),
(46, 30, 14),
(47, 33, 14),
(48, 31, 14),
(49, 32, 14),
(50, 19, 16),
(51, 17, 16),
(52, 25, 16),
(53, 18, 16),
(54, 19, 15),
(55, 17, 15),
(56, 25, 15),
(57, 18, 15),
(58, 22, 25),
(59, 17, 25),
(60, 19, 25),
(61, 18, 25),
(62, 22, 17),
(63, 17, 17),
(64, 19, 17),
(65, 18, 17),
(66, 19, 18),
(67, 18, 18),
(68, 17, 18),
(69, 17, 19),
(70, 19, 19),
(71, 18, 19),
(72, 17, 20),
(73, 19, 20),
(74, 18, 20),
(75, 21, 21),
(76, 19, 21),
(77, 17, 21),
(78, 25, 21),
(79, 18, 21),
(80, 17, 23),
(81, 19, 23),
(82, 25, 23),
(83, 18, 23),
(84, 25, 24),
(85, 17, 24),
(86, 19, 24),
(87, 18, 24),
(88, 45, 22),
(89, 46, 22),
(90, 33, 22),
(91, 18, 22);

-- --------------------------------------------------------

--
-- Table structure for table `test_categories`
--

DROP TABLE IF EXISTS `test_categories`;
CREATE TABLE `test_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `test_categories`
--

INSERT INTO `test_categories` (`id`, `name`, `description`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'PARASITOLOGY', '', NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(2, 'MICROBIOLOGY', '', NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(3, 'HEMATOLOGY', '', NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(4, 'SEROLOGY', '', NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(5, 'BLOOD TRANSFUSION', '', NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25');

-- --------------------------------------------------------

--
-- Table structure for table `test_name_mappings`
--

DROP TABLE IF EXISTS `test_name_mappings`;
CREATE TABLE `test_name_mappings` (
  `id` int(10) UNSIGNED NOT NULL,
  `test_type_id` int(10) UNSIGNED DEFAULT NULL,
  `standard_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `system_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `test_name_mappings`
--

INSERT INTO `test_name_mappings` (`id`, `test_type_id`, `standard_name`, `system_name`) VALUES
(1, NULL, 'CBC', 'cbc'),
(2, NULL, 'Hb', 'hb'),
(3, NULL, 'ESR', 'esr'),
(4, NULL, 'Bleeding time', 'bleeding_time'),
(5, NULL, 'Prothrombin Time', 'prothrombin_time'),
(6, NULL, 'Clotting Time', 'clotting_time'),
(7, NULL, 'ABO Grouping', 'abo_grouping'),
(8, NULL, 'Combs', 'combs'),
(9, NULL, 'Cross Matching', 'cross_matching'),
(10, NULL, 'Malaria Microscopy', 'malaria_microscopy'),
(11, NULL, 'Malaria RDTs', 'malaria_rdts'),
(12, NULL, 'Stool Microscopy', 'stool_microscopy'),
(13, NULL, 'VDRL/RPR', 'vdrl_rpr'),
(14, NULL, 'TPHA', 'tpha'),
(15, NULL, 'Shigella Dysentery', 'shigella_dysentery'),
(16, NULL, 'Hepatitis B', 'hepatitis_b'),
(17, NULL, 'Brucella', 'brucella'),
(18, NULL, 'Pregnancy Test', 'pregnancy_test'),
(19, NULL, 'Rheumatoid Factor', 'rheumatoid_factor'),
(20, NULL, 'CD4 tests', 'cd4_tests'),
(21, NULL, 'Viral Load Tests', 'viral_load_tests'),
(22, NULL, 'ZN for AFBs', 'zn_for_afbs'),
(23, NULL, 'Culture & Sensitivity', 'culture_sensitivity'),
(24, NULL, 'Gram Stain', 'gram_stain'),
(25, NULL, 'India Ink', 'india_ink'),
(26, NULL, 'Wet Preps', 'wet_preps'),
(27, NULL, 'Urine Microscopy', 'urine_microscopy'),
(28, NULL, 'Renal Profile', 'renal_profile'),
(29, NULL, 'Liver Profile', 'liver_profile'),
(30, NULL, 'Lipid/Cardiac Profile', 'lipid_cardiac_profile'),
(31, NULL, 'Alkaline Phosphates', 'alkaline_phosphates'),
(32, NULL, 'Amylase', 'amylase'),
(33, NULL, 'Glucose', 'glucose'),
(34, NULL, 'Uric Acid', 'uric_acid'),
(35, NULL, 'Lactate', 'lactate'),
(36, NULL, 'HIV', 'hiv');

-- --------------------------------------------------------

--
-- Table structure for table `test_phases`
--

DROP TABLE IF EXISTS `test_phases`;
CREATE TABLE `test_phases` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(45) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `test_phases`
--

INSERT INTO `test_phases` (`id`, `name`) VALUES
(1, 'Pre-Analytical'),
(2, 'Analytical'),
(3, 'Post-Analytical');

-- --------------------------------------------------------

--
-- Table structure for table `test_statuses`
--

DROP TABLE IF EXISTS `test_statuses`;
CREATE TABLE `test_statuses` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `test_phase_id` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `test_statuses`
--

INSERT INTO `test_statuses` (`id`, `name`, `test_phase_id`) VALUES
(1, 'not-received', 1),
(2, 'pending', 1),
(3, 'started', 2),
(4, 'completed', 3),
(5, 'verified', 3),
(6, 'specimen-rejected-at-analysis', 3);

-- --------------------------------------------------------

--
-- Table structure for table `test_types`
--

DROP TABLE IF EXISTS `test_types`;
CREATE TABLE `test_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `test_category_id` int(10) UNSIGNED NOT NULL,
  `targetTAT` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `orderable_test` int(11) DEFAULT NULL,
  `prevalence_threshold` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `accredited` tinyint(4) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `test_types`
--

INSERT INTO `test_types` (`id`, `name`, `description`, `test_category_id`, `targetTAT`, `orderable_test`, `prevalence_threshold`, `accredited`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'HIV', NULL, 4, NULL, 1, NULL, NULL, NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(2, 'BS for mps', NULL, 1, NULL, 1, NULL, NULL, NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(3, 'GXM', NULL, 1, NULL, NULL, NULL, NULL, NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(4, 'HB', NULL, 1, NULL, 1, NULL, NULL, NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(5, 'Urinalysis', NULL, 1, NULL, NULL, NULL, NULL, NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(6, 'WBC', NULL, 1, NULL, NULL, NULL, NULL, NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(7, 'Salmonella Antigen Test', NULL, 1, NULL, NULL, NULL, NULL, NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(8, 'Direct COOMBS Test', NULL, 5, NULL, NULL, NULL, NULL, NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(9, 'DU Test', NULL, 5, NULL, NULL, NULL, NULL, NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(10, 'Sickling Test', NULL, 3, NULL, NULL, NULL, NULL, NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(11, 'Borrelia', NULL, 1, NULL, NULL, NULL, NULL, NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(12, 'VDRL', NULL, 4, NULL, NULL, NULL, NULL, NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(13, 'Pregnancy Test', NULL, 4, NULL, NULL, NULL, NULL, NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(14, 'Brucella', NULL, 4, NULL, NULL, NULL, NULL, NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(15, 'H. Pylori', NULL, 4, NULL, NULL, NULL, NULL, NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(16, 'CBC', NULL, 3, NULL, 1, NULL, NULL, NULL, '2018-01-29 13:00:26', '2018-01-29 13:00:26'),
(17, 'Appearance', NULL, 2, NULL, NULL, NULL, NULL, NULL, '2018-01-29 13:00:26', '2018-01-29 13:00:26'),
(18, 'Culture and Sensitivity', NULL, 2, NULL, NULL, NULL, NULL, NULL, '2018-01-29 13:00:26', '2018-01-29 13:00:26'),
(19, 'Gram Staining', NULL, 2, NULL, NULL, NULL, NULL, NULL, '2018-01-29 13:00:26', '2018-01-29 13:00:26'),
(20, 'India Ink Staining', NULL, 2, NULL, NULL, NULL, NULL, NULL, '2018-01-29 13:00:26', '2018-01-29 13:00:26'),
(21, 'Protein', NULL, 2, NULL, NULL, NULL, NULL, NULL, '2018-01-29 13:00:26', '2018-01-29 13:00:26'),
(22, 'Wet preparation (saline preparation)', NULL, 2, NULL, NULL, NULL, NULL, NULL, '2018-01-29 13:00:26', '2018-01-29 13:00:26'),
(23, 'Wet Saline Iodine Prep', NULL, 2, NULL, NULL, NULL, NULL, NULL, '2018-01-29 13:00:26', '2018-01-29 13:00:26'),
(24, 'White Blood Cell Count', NULL, 2, NULL, NULL, NULL, NULL, NULL, '2018-01-29 13:00:26', '2018-01-29 13:00:26'),
(25, 'ZN Staining', NULL, 2, NULL, NULL, NULL, NULL, NULL, '2018-01-29 13:00:26', '2018-01-29 13:00:26'),
(26, 'Modified ZN', NULL, 2, NULL, NULL, NULL, NULL, NULL, '2018-01-29 13:00:26', '2018-01-29 13:00:26'),
(27, 'Crag', NULL, 2, NULL, NULL, NULL, NULL, NULL, '2018-01-29 13:00:26', '2018-01-29 13:00:26'),
(28, 'Differential', NULL, 2, NULL, NULL, NULL, NULL, NULL, '2018-01-29 13:00:26', '2018-01-29 13:00:26'),
(29, 'Total Cell Count', NULL, 2, NULL, NULL, NULL, NULL, NULL, '2018-01-29 13:00:26', '2018-01-29 13:00:26'),
(30, 'Lymphocytes', NULL, 2, NULL, NULL, NULL, NULL, NULL, '2018-01-29 13:00:26', '2018-01-29 13:00:26'),
(31, 'Quantitative Culture', NULL, 2, NULL, NULL, NULL, NULL, NULL, '2018-01-29 13:00:26', '2018-01-29 13:00:26'),
(32, 'RBC Count', NULL, 2, NULL, NULL, NULL, NULL, NULL, '2018-01-29 13:00:26', '2018-01-29 13:00:26'),
(33, 'TPHA', NULL, 2, NULL, NULL, NULL, NULL, NULL, '2018-01-29 13:00:26', '2018-01-29 13:00:26'),
(34, 'HCG', NULL, 2, NULL, NULL, NULL, NULL, NULL, '2018-01-29 13:00:26', '2018-01-29 13:00:26'),
(35, 'Bilirubin', NULL, 2, NULL, NULL, NULL, NULL, NULL, '2018-01-29 13:00:26', '2018-01-29 13:00:26'),
(36, 'Blood', NULL, 2, NULL, NULL, NULL, NULL, NULL, '2018-01-29 13:00:26', '2018-01-29 13:00:26'),
(37, 'Glucose', NULL, 2, NULL, NULL, NULL, NULL, NULL, '2018-01-29 13:00:26', '2018-01-29 13:00:26'),
(38, 'Ketones', NULL, 2, NULL, NULL, NULL, NULL, NULL, '2018-01-29 13:00:26', '2018-01-29 13:00:26'),
(39, 'Leukocytes', NULL, 2, NULL, NULL, NULL, NULL, NULL, '2018-01-29 13:00:26', '2018-01-29 13:00:26'),
(40, 'Microscopy', NULL, 2, NULL, NULL, NULL, NULL, NULL, '2018-01-29 13:00:26', '2018-01-29 13:00:26'),
(41, 'Nitrite', NULL, 2, NULL, NULL, NULL, NULL, NULL, '2018-01-29 13:00:26', '2018-01-29 13:00:26'),
(42, 'pH', NULL, 2, NULL, NULL, NULL, NULL, NULL, '2018-01-29 13:00:26', '2018-01-29 13:00:26'),
(43, 'Specific Gravity', NULL, 2, NULL, NULL, NULL, NULL, NULL, '2018-01-29 13:00:26', '2018-01-29 13:00:26'),
(44, 'Urobilinogen', NULL, 2, NULL, NULL, NULL, NULL, NULL, '2018-01-29 13:00:26', '2018-01-29 13:00:26'),
(45, 'RPR', NULL, 2, NULL, NULL, NULL, NULL, NULL, '2018-01-29 13:00:26', '2018-01-29 13:00:26'),
(46, 'Serum Crag', NULL, 2, NULL, NULL, NULL, NULL, NULL, '2018-01-29 13:00:26', '2018-01-29 13:00:26');

-- --------------------------------------------------------

--
-- Table structure for table `therapy`
--

DROP TABLE IF EXISTS `therapy`;
CREATE TABLE `therapy` (
  `id` int(10) UNSIGNED NOT NULL,
  `visit_id` int(10) UNSIGNED NOT NULL,
  `patient_id` int(10) UNSIGNED NOT NULL,
  `previous_therapy` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `current_therapy` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `clinical_notes` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `clinician` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `therapy`
--

INSERT INTO `therapy` (`id`, `visit_id`, `patient_id`, `previous_therapy`, `current_therapy`, `clinical_notes`, `clinician`, `contact`) VALUES
(1, 1, 1, '', '', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tokens`
--

DROP TABLE IF EXISTS `tokens`;
CREATE TABLE `tokens` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `topup_requests`
--

DROP TABLE IF EXISTS `topup_requests`;
CREATE TABLE `topup_requests` (
  `id` int(10) UNSIGNED NOT NULL,
  `commodity_id` int(10) UNSIGNED NOT NULL,
  `test_category_id` int(10) UNSIGNED NOT NULL,
  `order_quantity` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `remarks` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `unhls_bbactions`
--

DROP TABLE IF EXISTS `unhls_bbactions`;
CREATE TABLE `unhls_bbactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `actionname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `unhls_bbactions`
--

INSERT INTO `unhls_bbactions` (`id`, `actionname`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Reported to administration for further action', '2018-01-29 13:00:25', '2018-01-29 13:00:25', NULL),
(2, 'Referred to mental department', '2018-01-29 13:00:25', '2018-01-29 13:00:25', NULL),
(3, 'Gave first aid (e.g. arrested bleeding)', '2018-01-29 13:00:25', '2018-01-29 13:00:25', NULL),
(4, 'Referred to clinician for further management', '2018-01-29 13:00:25', '2018-01-29 13:00:25', NULL),
(5, 'Conducted risk assessment', '2018-01-29 13:00:25', '2018-01-29 13:00:25', NULL),
(6, 'Intervened to interrupt/arrest progress of incident (e.g. Used neutralizing agent, stopping a fight)', '2018-01-29 13:00:25', '2018-01-29 13:00:25', NULL),
(7, 'Disposed off broken container to designated waste bin/sharps', '2018-01-29 13:00:25', '2018-01-29 13:00:25', NULL),
(8, 'Patient sample taken & referred to testing lab Isolated suspected patient', '2018-01-29 13:00:25', '2018-01-29 13:00:25', NULL),
(9, 'Reported to or engaged national level BRM for intervention', '2018-01-29 13:00:25', '2018-01-29 13:00:25', NULL),
(10, 'Victim counseled', '2018-01-29 13:00:25', '2018-01-29 13:00:25', NULL),
(11, 'Contacted Police', '2018-01-29 13:00:25', '2018-01-29 13:00:25', NULL),
(12, 'Used spill kit', '2018-01-29 13:00:25', '2018-01-29 13:00:25', NULL),
(13, 'Administered PEP', '2018-01-29 13:00:25', '2018-01-29 13:00:25', NULL),
(14, 'Referred to disciplinary committee', '2018-01-29 13:00:25', '2018-01-29 13:00:25', NULL),
(15, 'Contained the spillage', '2018-01-29 13:00:25', '2018-01-29 13:00:25', NULL),
(16, 'Disinfected the place', '2018-01-29 13:00:25', '2018-01-29 13:00:25', NULL),
(17, 'Switched off the Electricity Mains', '2018-01-29 13:00:25', '2018-01-29 13:00:25', NULL),
(18, 'Washed punctured area', '2018-01-29 13:00:25', '2018-01-29 13:00:25', NULL),
(19, 'Others', '2018-01-29 13:00:25', '2018-01-29 13:00:25', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `unhls_bbcauses`
--

DROP TABLE IF EXISTS `unhls_bbcauses`;
CREATE TABLE `unhls_bbcauses` (
  `id` int(10) UNSIGNED NOT NULL,
  `causename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `unhls_bbcauses`
--

INSERT INTO `unhls_bbcauses` (`id`, `causename`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Defective Equipment', '2018-01-29 13:00:25', '2018-01-29 13:00:25', NULL),
(2, 'Hazardous Chemicals', '2018-01-29 13:00:25', '2018-01-29 13:00:25', NULL),
(3, 'Unsafe Procedure', '2018-01-29 13:00:25', '2018-01-29 13:00:25', NULL),
(4, 'Psychological causes (e.g. emotional condition, depression, mental confusion)', '2018-01-29 13:00:25', '2018-01-29 13:00:25', NULL),
(5, 'Unsafe storage of laboratory chemicals', '2018-01-29 13:00:25', '2018-01-29 13:00:25', NULL),
(6, 'Lack of Skill or Knowledge', '2018-01-29 13:00:25', '2018-01-29 13:00:25', NULL),
(7, 'Lack of Personal Protective Equipment', '2018-01-29 13:00:25', '2018-01-29 13:00:25', NULL),
(8, 'Unsafe Working Environment', '2018-01-29 13:00:25', '2018-01-29 13:00:25', NULL),
(9, 'Lack of Adequate Physical Security', '2018-01-29 13:00:25', '2018-01-29 13:00:25', NULL),
(10, 'Unsafe location of laboratory equipment', '2018-01-29 13:00:25', '2018-01-29 13:00:25', NULL),
(11, 'Other', '2018-01-29 13:00:25', '2018-01-29 13:00:25', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `unhls_bbincidences`
--

DROP TABLE IF EXISTS `unhls_bbincidences`;
CREATE TABLE `unhls_bbincidences` (
  `id` int(10) UNSIGNED NOT NULL,
  `facility_id` int(10) UNSIGNED NOT NULL,
  `serial_no` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `occurrence_date` date NOT NULL,
  `occurrence_time` time NOT NULL,
  `personnel_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `personnel_surname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `personnel_othername` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `personnel_gender` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `personnel_dob` date NOT NULL,
  `personnel_age` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `personnel_category` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `personnel_telephone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `personnel_email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nok_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nok_telephone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nok_email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lab_section` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `occurrence` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ulin` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `equip_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `equip_code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `task` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `officer_fname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `officer_lname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `officer_cadre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `officer_telephone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `extent` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `firstaid` text COLLATE utf8_unicode_ci NOT NULL,
  `intervention` text COLLATE utf8_unicode_ci NOT NULL,
  `intervention_date` date NOT NULL,
  `intervention_time` time NOT NULL,
  `intervention_followup` text COLLATE utf8_unicode_ci NOT NULL,
  `mo_fname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mo_lname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mo_designation` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mo_telephone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cause` text COLLATE utf8_unicode_ci NOT NULL,
  `corrective_action` text COLLATE utf8_unicode_ci NOT NULL,
  `referral_status` text COLLATE utf8_unicode_ci NOT NULL,
  `status` text COLLATE utf8_unicode_ci NOT NULL,
  `analysis_date` date NOT NULL,
  `analysis_time` time NOT NULL,
  `bo_fname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `bo_lname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `bo_designation` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `bo_telephone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `findings` text COLLATE utf8_unicode_ci NOT NULL,
  `improvement_plan` text COLLATE utf8_unicode_ci NOT NULL,
  `response_date` date NOT NULL,
  `response_time` time NOT NULL,
  `brm_fname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `brm_lname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `brm_designation` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `brm_telephone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `createdby` int(10) UNSIGNED DEFAULT NULL,
  `updatedby` int(10) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `unhls_bbincidences_action`
--

DROP TABLE IF EXISTS `unhls_bbincidences_action`;
CREATE TABLE `unhls_bbincidences_action` (
  `id` int(10) UNSIGNED NOT NULL,
  `bbincidence_id` int(10) UNSIGNED NOT NULL,
  `action_id` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `unhls_bbincidences_cause`
--

DROP TABLE IF EXISTS `unhls_bbincidences_cause`;
CREATE TABLE `unhls_bbincidences_cause` (
  `id` int(10) UNSIGNED NOT NULL,
  `bbincidence_id` int(10) UNSIGNED NOT NULL,
  `cause_id` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `unhls_bbincidences_nature`
--

DROP TABLE IF EXISTS `unhls_bbincidences_nature`;
CREATE TABLE `unhls_bbincidences_nature` (
  `id` int(10) UNSIGNED NOT NULL,
  `bbincidence_id` int(10) UNSIGNED NOT NULL,
  `nature_id` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `unhls_bbnatures`
--

DROP TABLE IF EXISTS `unhls_bbnatures`;
CREATE TABLE `unhls_bbnatures` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `class` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `priority` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `unhls_bbnatures`
--

INSERT INTO `unhls_bbnatures` (`id`, `name`, `class`, `priority`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Assault/Fight among staff', 'Physical', 'Minor', NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(2, 'Fainting', 'Physical', 'Minor', NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(3, 'Roof leakages', 'Physical', 'Minor', NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(4, 'Machine cuts/bruises', 'Mechanical', 'Minor', NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(5, 'Electric shock/burn', 'Mechanical', 'Major', NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(6, 'Death within lab', 'Ergonometric and Medical', 'Major', NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(7, 'Slip or fall', 'Physical', 'Minor', NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(8, 'Unnecessary destruction of lab material', 'Physical', 'Minor', NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(9, 'Theft of laboratory consumables', 'Physical', 'Minor', NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(10, 'Breakage of sample container', 'Physical', 'Minor', NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(11, 'Prick/cut by unused sharps', 'Physical', 'Minor', NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(12, 'Injury caused by laboratory objects', 'Physical', 'Minor', NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(13, 'Chemical burn', 'Chemical', 'Minor', NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(14, 'Theft of chemical', 'Chemical', 'Minor', NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(15, 'Chemical spillage', 'Chemical', 'Major', NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(16, 'Theft of equipment', 'Physical', 'Major', NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(17, 'Attack on the Lab', 'Physical', 'Major', NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(18, 'Collapsing building', 'Physical', 'Major', NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(19, 'Bike rider accident', 'Physical', 'Major', NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(20, 'Fire', 'Physical', 'Major', NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(21, 'Needle prick or cuts by used sharps', 'Biological', 'Minor', NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(22, 'Sample spillage', 'Biological', 'Minor', NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(23, 'Theft of samples', 'Biological', 'Major', NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(24, 'Contact with VHF suspect', 'Biological', 'Major', NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(25, 'Contact with radiological materials', 'Radiological', 'Major', NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(26, 'Theft of radiological materials', 'Radiological', 'Major', NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(27, 'Poor disposal of radiological materials', 'Radiological', 'Major', NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(28, 'Poor vision from inadequate light', 'Ergonometric and Medical', 'Minor', NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(29, 'Back pain from posture effects', 'Ergonometric and Medical', 'Minor', NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(30, 'Other occupational hazard', 'Ergonometric and Medical', 'Minor', NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(31, 'Other', 'Other', 'Other', NULL, '2018-01-29 13:00:25', '2018-01-29 13:00:25');

-- --------------------------------------------------------

--
-- Table structure for table `unhls_districts`
--

DROP TABLE IF EXISTS `unhls_districts`;
CREATE TABLE `unhls_districts` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `unhls_districts`
--

INSERT INTO `unhls_districts` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Kampala', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(2, 'Buikwe', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(3, 'Bukomansimbi', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(4, 'Butambala', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(5, 'Buvuma', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(6, 'Gomba', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(7, 'Kalangala', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(8, 'Kalungu', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(9, 'Kayunga', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(10, 'Kiboga', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(11, 'Kyankwanzi', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(12, 'Luweero', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(13, 'Lwengo', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(14, 'Lyantonde', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(15, 'Masaka', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(16, 'Mityana', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(17, 'Mpigi', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(18, 'Mubende', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(19, 'Mukono', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(20, 'Nakaseke', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(21, 'Nakasongola', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(22, 'Rakai', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(23, 'Ssembabule', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(24, 'Wakiso', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(25, 'Amuria', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(26, 'Budaka', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(27, 'Bududa', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(28, 'Bugiri', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(29, 'Bukedea', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(30, 'Bukwa', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(31, 'Bulambuli', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(32, 'Busia', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(33, 'Butaleja', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(34, 'Buyende', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(35, 'Iganga', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(36, 'Jinja', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(37, 'Kaberamaido', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(38, 'Kaliro', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(39, 'Kamuli', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(40, 'Kapchorwa', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(41, 'Katakwi', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(42, 'Kibuku', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(43, 'Kumi', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(44, 'Kween', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(45, 'Luuka', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(46, 'Manafwa', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(47, 'Mayuge', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(48, 'Mbale', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(49, 'Namayingo', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(50, 'Namutumba', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(51, 'Ngora', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(52, 'Pallisa', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(53, 'Serere', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(54, 'Sironko', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(55, 'Soroti', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(56, 'Tororo', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(57, 'Abim', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(58, 'Adjumani', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(59, 'Agago', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(60, 'Alebtong', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(61, 'Amolatar', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(62, 'Amudat', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(63, 'Amuru', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(64, 'Apac', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(65, 'Arua', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(66, 'Dokolo', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(67, 'Gulu', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(68, 'Kaabong', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(69, 'Kitgum', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(70, 'Koboko', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(71, 'Kole', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(72, 'Kotido', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(73, 'Lamwo', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(74, 'Lira', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(75, 'Maracha', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(76, 'Moroto', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(77, 'Moyo', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(78, 'Nakapiripirit', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(79, 'Napak', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(80, 'Nebbi', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(81, 'Nwoya', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(82, 'Otuke', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(83, 'Oyam', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(84, 'Pader', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(85, 'Yumbe', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(86, 'Zombo', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(87, 'Buhweju', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(88, 'Buliisa', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(89, 'Bundibugyo', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(90, 'Bushenyi', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(91, 'Hoima', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(92, 'Ibanda', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(93, 'Isingiro', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(94, 'Kabale', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(95, 'Kabarole', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(96, 'Kamwenge', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(97, 'Kanungu', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(98, 'Kasese', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(99, 'Kibaale', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(100, 'Kiruhura', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(101, 'Kiryandongo', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(102, 'Kisoro', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(103, 'Kyegegwa', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(104, 'Kyenjojo', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(105, 'Masindi', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(106, 'Mbarara', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(107, 'Mitooma', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(108, 'Ntoroko', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(109, 'Ntungamo', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(110, 'Rubirizi', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(111, 'Rukungiri', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(112, 'Sheema', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(113, 'Omoro', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(114, 'Kagadi', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(115, 'Kakumiro', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(116, 'Rubanda', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(117, 'Bukwo', '2018-01-29 13:00:25', '2018-01-29 13:00:25');

-- --------------------------------------------------------

--
-- Table structure for table `unhls_drugs`
--

DROP TABLE IF EXISTS `unhls_drugs`;
CREATE TABLE `unhls_drugs` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `formulation` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `strength` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pack_size` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `unit_of_issue` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `amc` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `max_stock_level` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `min_stock_level` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `unhls_equipment_breakdown`
--

DROP TABLE IF EXISTS `unhls_equipment_breakdown`;
CREATE TABLE `unhls_equipment_breakdown` (
  `id` int(10) UNSIGNED NOT NULL,
  `district_id` int(10) UNSIGNED NOT NULL,
  `facility_id` int(10) UNSIGNED NOT NULL,
  `year_id` int(10) UNSIGNED NOT NULL,
  `equipment_id` int(10) UNSIGNED NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `action_taken` text COLLATE utf8_unicode_ci NOT NULL,
  `hsd_request` text COLLATE utf8_unicode_ci NOT NULL,
  `in_charge_id` int(11) NOT NULL,
  `priority` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `report_date` datetime DEFAULT NULL,
  `restored_by` int(11) DEFAULT NULL,
  `restore_date` datetime DEFAULT NULL,
  `comment` longtext COLLATE utf8_unicode_ci,
  `breakdown_type` int(11) NOT NULL,
  `reported_by` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `breakdown_date` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `unhls_equipment_inventory`
--

DROP TABLE IF EXISTS `unhls_equipment_inventory`;
CREATE TABLE `unhls_equipment_inventory` (
  `id` int(10) UNSIGNED NOT NULL,
  `district_id` int(10) UNSIGNED NOT NULL,
  `facility_id` int(10) UNSIGNED NOT NULL,
  `year_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `model` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `serial_number` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `location` int(11) NOT NULL,
  `procurement_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `purchase_date` datetime NOT NULL,
  `delivery_date` datetime NOT NULL,
  `verification_date` datetime NOT NULL,
  `installation_date` datetime NOT NULL,
  `spare_parts` tinyint(1) NOT NULL,
  `warranty` int(11) NOT NULL,
  `life_span` int(11) NOT NULL,
  `service_frequency` tinyint(1) NOT NULL,
  `service_contract` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `supplier_id` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `unhls_equipment_maintenance`
--

DROP TABLE IF EXISTS `unhls_equipment_maintenance`;
CREATE TABLE `unhls_equipment_maintenance` (
  `id` int(10) UNSIGNED NOT NULL,
  `district_id` int(10) UNSIGNED NOT NULL,
  `facility_id` int(10) UNSIGNED NOT NULL,
  `year_id` int(10) UNSIGNED NOT NULL,
  `equipment_id` int(10) UNSIGNED NOT NULL,
  `last_service_date` datetime NOT NULL,
  `next_service_date` datetime NOT NULL,
  `serviced_by_name` text COLLATE utf8_unicode_ci NOT NULL,
  `serviced_by_contact` text COLLATE utf8_unicode_ci NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `comment` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `unhls_equipment_suppliers`
--

DROP TABLE IF EXISTS `unhls_equipment_suppliers`;
CREATE TABLE `unhls_equipment_suppliers` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `unhls_facilities`
--

DROP TABLE IF EXISTS `unhls_facilities`;
CREATE TABLE `unhls_facilities` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `district_id` int(10) UNSIGNED NOT NULL,
  `level_id` int(10) UNSIGNED NOT NULL,
  `ownership_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `unhls_facilities`
--

INSERT INTO `unhls_facilities` (`id`, `code`, `name`, `district_id`, `level_id`, `ownership_id`, `created_at`, `updated_at`) VALUES
(1, 'LBK1', 'CENTRAL PUBLIC HEALTH LABORATORIES', 1, 1, 1, '2018-01-29 13:00:25', '2018-01-29 13:00:25');

-- --------------------------------------------------------

--
-- Table structure for table `unhls_facility_level`
--

DROP TABLE IF EXISTS `unhls_facility_level`;
CREATE TABLE `unhls_facility_level` (
  `id` int(10) UNSIGNED NOT NULL,
  `level` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `unhls_facility_level`
--

INSERT INTO `unhls_facility_level` (`id`, `level`, `created_at`, `updated_at`) VALUES
(1, 'Public NRH', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(2, 'Public RRH', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(3, 'Public GH', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(4, 'Public HCIV', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(5, 'Public HCIII', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(6, 'Hospital', '2018-01-29 13:00:25', '2018-01-29 13:00:25');

-- --------------------------------------------------------

--
-- Table structure for table `unhls_facility_ownership`
--

DROP TABLE IF EXISTS `unhls_facility_ownership`;
CREATE TABLE `unhls_facility_ownership` (
  `id` int(10) UNSIGNED NOT NULL,
  `owner` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `unhls_facility_ownership`
--

INSERT INTO `unhls_facility_ownership` (`id`, `owner`, `created_at`, `updated_at`) VALUES
(1, 'Public', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(2, 'PFP', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(3, 'PNFP', '2018-01-29 13:00:25', '2018-01-29 13:00:25'),
(4, 'Other', '2018-01-29 13:00:25', '2018-01-29 13:00:25');

-- --------------------------------------------------------

--
-- Table structure for table `unhls_financial_years`
--

DROP TABLE IF EXISTS `unhls_financial_years`;
CREATE TABLE `unhls_financial_years` (
  `id` int(10) UNSIGNED NOT NULL,
  `year` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `unhls_patients`
--

DROP TABLE IF EXISTS `unhls_patients`;
CREATE TABLE `unhls_patients` (
  `id` int(10) UNSIGNED NOT NULL,
  `patient_number` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ulin` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nin` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `dob` date NOT NULL,
  `gender` tinyint(4) NOT NULL DEFAULT '0',
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `village_residence` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `village_workplace` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `occupation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `external_patient_number` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `unhls_patients`
--

INSERT INTO `unhls_patients` (`id`, `patient_number`, `ulin`, `nin`, `name`, `dob`, `gender`, `email`, `address`, `village_residence`, `village_workplace`, `phone_number`, `occupation`, `external_patient_number`, `created_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, '12345', 'LBK1/1802/1/KJ', 'mfd234543', 'Kajuka John', '1993-01-01', 0, '', 'P.O.Box 2323', 'Kyalinka', 'Kyalinkas', '0786945331', 'Makanika', NULL, 1, NULL, '2018-02-01 06:54:38', '2018-02-01 06:54:38');

-- --------------------------------------------------------

--
-- Table structure for table `unhls_rejection_reasons`
--

DROP TABLE IF EXISTS `unhls_rejection_reasons`;
CREATE TABLE `unhls_rejection_reasons` (
  `id` int(10) UNSIGNED NOT NULL,
  `reason` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `unhls_staff`
--

DROP TABLE IF EXISTS `unhls_staff`;
CREATE TABLE `unhls_staff` (
  `id` int(10) UNSIGNED NOT NULL,
  `facility_id` int(10) UNSIGNED NOT NULL,
  `firstName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lastName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `unhls_stockcard`
--

DROP TABLE IF EXISTS `unhls_stockcard`;
CREATE TABLE `unhls_stockcard` (
  `id` int(10) UNSIGNED NOT NULL,
  `district_id` int(10) UNSIGNED NOT NULL,
  `facility_id` int(10) UNSIGNED NOT NULL,
  `year_id` int(10) UNSIGNED NOT NULL,
  `commodity_id` int(10) UNSIGNED NOT NULL,
  `to_from` int(11) NOT NULL,
  `to_from_type` int(11) NOT NULL,
  `voucher_number` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `action` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch_number` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `issue_date` datetime NOT NULL,
  `expiry_date` datetime NOT NULL,
  `initials` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remarks` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `balance` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `transaction_date` datetime DEFAULT NULL,
  `quantity_in` int(11) DEFAULT NULL,
  `quantity_out` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `unhls_stockrequisition`
--

DROP TABLE IF EXISTS `unhls_stockrequisition`;
CREATE TABLE `unhls_stockrequisition` (
  `id` int(10) UNSIGNED NOT NULL,
  `district_id` int(10) UNSIGNED NOT NULL,
  `facility_id` int(10) UNSIGNED NOT NULL,
  `year_id` int(10) UNSIGNED NOT NULL,
  `item_id` int(10) UNSIGNED NOT NULL,
  `issued_to` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `voucher_number` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `quantity_required` int(11) NOT NULL,
  `quantity_issued` int(11) NOT NULL,
  `issue_date` datetime NOT NULL,
  `remarks` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `unhls_tests`
--

DROP TABLE IF EXISTS `unhls_tests`;
CREATE TABLE `unhls_tests` (
  `id` int(10) UNSIGNED NOT NULL,
  `visit_id` bigint(20) UNSIGNED NOT NULL,
  `test_type_id` int(10) UNSIGNED NOT NULL,
  `specimen_id` int(10) UNSIGNED DEFAULT NULL,
  `interpretation` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `test_status_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `created_by` int(10) UNSIGNED NOT NULL,
  `tested_by` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `verified_by` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `requested_by` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `purpose` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `time_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `time_started` timestamp NULL DEFAULT NULL,
  `time_completed` timestamp NULL DEFAULT NULL,
  `time_verified` timestamp NULL DEFAULT NULL,
  `time_sent` timestamp NULL DEFAULT NULL,
  `external_id` int(11) DEFAULT NULL,
  `instrument` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `unhls_test_results`
--

DROP TABLE IF EXISTS `unhls_test_results`;
CREATE TABLE `unhls_test_results` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `test_id` int(10) UNSIGNED NOT NULL,
  `measure_id` int(10) UNSIGNED NOT NULL,
  `result` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `time_entered` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `unhls_visits`
--

DROP TABLE IF EXISTS `unhls_visits`;
CREATE TABLE `unhls_visits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `patient_id` int(10) UNSIGNED NOT NULL,
  `visit_type` varchar(12) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Out-patient',
  `visit_number` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ward_id` int(11) DEFAULT NULL,
  `bed_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `visit_status_id` int(11) DEFAULT NULL,
  `hospitalized` int(10) UNSIGNED DEFAULT NULL,
  `on_antibiotics` int(10) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `unhls_visits`
--

INSERT INTO `unhls_visits` (`id`, `patient_id`, `visit_type`, `visit_number`, `created_at`, `updated_at`, `ward_id`, `bed_no`, `visit_status_id`, `hospitalized`, `on_antibiotics`) VALUES
(1, 1, 'Out-patient', NULL, '2018-02-01 06:57:22', '2018-02-01 06:57:22', 0, '', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `unhls_warehouse`
--

DROP TABLE IF EXISTS `unhls_warehouse`;
CREATE TABLE `unhls_warehouse` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` tinyint(4) NOT NULL DEFAULT '0',
  `designation` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `facility_id` int(10) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `phone_contact` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`, `name`, `gender`, `designation`, `image`, `remember_token`, `facility_id`, `deleted_at`, `created_at`, `updated_at`, `phone_contact`) VALUES
(1, 'administrator', '$2y$10$L41uRvGQi1pZNAd73va.u.rJ0Duesz9Ld8ddCvGUvbv9mRmghcmM2', '', 'A-LIS Admin', 0, 'Systems Administrator', NULL, 'BGn3d2LlOugimBOVVCGYduaZrX7t3W0cn1SSNTM9SSiQFmrezEIG87JXREOX', 1, NULL, '2018-01-29 13:00:25', '2018-02-08 05:12:56', NULL),
(2, 'john', '$2y$10$8ezqjboSLGZLSs004E3cg.8HAeM/I/njRdKgeAjkB8dagwDU4ZoPC', 'john@dev.cm', 'john data entrant', 0, 'data entrant', NULL, 'rxzc2JdPeeAvBEJhe3aoOXkLH9BoFJDYGtF3pAcR0juPsV10oBYy1zIONTlJ', 1, NULL, '2018-02-05 09:07:41', '2018-02-07 10:37:04', NULL),
(3, 'allan', '$2y$10$ysLXLxaFpEnNJQQ8HEF2h.8dAvb5epf7B3gX5wSt57v15cD2VMG6y', 'allan@dev.com', 'allan kisakye', 0, 'Approver', NULL, 'QfkTxSn7GZzSOndGNWEx1H1Lb32WQVVTKxG7PfR8iXbcydl8rgnBXh9atGQO', 1, NULL, '2018-02-05 09:09:10', '2018-02-07 10:06:43', NULL),
(4, 'lilian', '$2y$10$j4Weu7ZjsUuS343iUBf3FObOjAO7wZMX7pL0VczwbIfCKVGT/M4TO', 'lilian@dev.com', 'Lilian', 0, 'Lab', NULL, '0PGqcq2ZJg7PK8258Nkepd6IeADnYXhtz9cMMMD0wqogn68zbv3sCqXB8Mgd', 1, NULL, '2018-02-06 08:20:13', '2018-02-07 10:06:04', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `uuids`
--

DROP TABLE IF EXISTS `uuids`;
CREATE TABLE `uuids` (
  `id` int(10) UNSIGNED NOT NULL,
  `counter` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `uuids`
--

INSERT INTO `uuids` (`id`, `counter`) VALUES
(1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `visit_statuses`
--

DROP TABLE IF EXISTS `visit_statuses`;
CREATE TABLE `visit_statuses` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(45) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `visit_statuses`
--

INSERT INTO `visit_statuses` (`id`, `name`) VALUES
(1, 'appointment-made'),
(2, 'test-request-made'),
(3, 'specimen_received'),
(4, 'tests-completed');

-- --------------------------------------------------------

--
-- Table structure for table `wards`
--

DROP TABLE IF EXISTS `wards`;
CREATE TABLE `wards` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `zone_diameters`
--

DROP TABLE IF EXISTS `zone_diameters`;
CREATE TABLE `zone_diameters` (
  `id` int(10) UNSIGNED NOT NULL,
  `drug_id` int(10) UNSIGNED NOT NULL,
  `organism_id` int(10) UNSIGNED NOT NULL,
  `resistant_max` decimal(4,1) DEFAULT NULL,
  `intermediate_min` decimal(4,1) DEFAULT NULL,
  `intermediate_max` decimal(4,1) DEFAULT NULL,
  `sensitive_min` decimal(4,1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `zone_diameters`
--

INSERT INTO `zone_diameters` (`id`, `drug_id`, `organism_id`, `resistant_max`, `intermediate_min`, `intermediate_max`, `sensitive_min`) VALUES
(1, 1, 1, '14.0', '15.0', '16.0', '17.0'),
(2, 2, 2, '13.0', '14.0', '16.0', '17.0'),
(3, 3, 2, '13.0', '14.0', '17.0', '18.0'),
(4, 4, 2, '22.0', '23.0', '25.0', '26.0'),
(5, 5, 2, '17.0', '18.0', '20.0', '21.0'),
(6, 6, 2, '19.0', '20.0', '22.0', '23.0'),
(7, 7, 2, '22.0', '23.0', '25.0', '26.0'),
(8, 8, 2, '14.0', '15.0', '17.0', '18.0'),
(9, 9, 2, '14.0', '15.0', '22.0', '23.0'),
(10, 10, 2, '12.0', '13.0', '17.0', '18.0'),
(11, 11, 2, '15.0', '16.0', '20.0', '21.0'),
(12, 12, 2, '10.0', '11.0', '15.0', '16.0'),
(13, 13, 2, '12.0', '13.0', '14.0', '15.0'),
(14, 14, 2, '19.0', '20.0', '22.0', '23.0'),
(15, 15, 2, '19.0', '20.0', '22.0', '23.0'),
(16, 16, 2, '13.0', '14.0', '18.0', '19.0'),
(17, 17, 2, '17.0', '18.0', '20.0', '21.0'),
(18, 18, 2, '17.0', '18.0', '20.0', '21.0'),
(19, 19, 2, '13.0', '14.0', '16.0', '17.0'),
(20, 20, 2, '10.0', '11.0', '15.0', '16.0'),
(21, 2, 3, '13.0', '14.0', '16.0', '17.0'),
(22, 8, 3, '14.0', '15.0', '17.0', '18.0'),
(23, 9, 3, '14.0', '15.0', '22.0', '23.0'),
(24, 21, 3, '13.0', '14.0', '17.0', '18.0'),
(25, 13, 3, '12.0', '13.0', '14.0', '15.0'),
(26, 12, 3, '10.0', '11.0', '15.0', '16.0'),
(27, 10, 3, '12.0', '13.0', '17.0', '18.0'),
(28, 11, 3, '15.0', '16.0', '20.0', '21.0'),
(29, 6, 3, '19.0', '20.0', '22.0', '23.0'),
(30, 7, 3, '22.0', '23.0', '25.0', '26.0'),
(31, 5, 3, '17.0', '18.0', '20.0', '21.0'),
(32, 22, 3, NULL, NULL, NULL, '25.0'),
(33, 18, 3, '17.0', '18.0', '20.0', '21.0'),
(34, 17, 3, '17.0', '18.0', '20.0', '21.0'),
(35, 14, 3, '19.0', '20.0', '22.0', '23.0'),
(36, 16, 3, '13.0', '14.0', '18.0', '19.0'),
(37, 19, 3, '14.0', '15.0', '16.0', '17.0'),
(38, 18, 1, '14.0', '15.0', '20.0', '21.0'),
(39, 17, 1, '14.0', '15.0', '20.0', '21.0'),
(40, 5, 1, '14.0', '15.0', '17.0', '18.0'),
(41, 22, 1, '14.0', '15.0', '17.0', '18.0'),
(42, 13, 1, '12.0', '13.0', '14.0', '15.0'),
(43, 11, 1, '15.0', '16.0', '20.0', '21.0'),
(44, 14, 1, '13.0', '14.0', '15.0', '16.0'),
(45, 15, 1, '13.0', '14.0', '15.0', '16.0'),
(46, 23, 1, '10.0', NULL, NULL, '12.0'),
(57, 1, 5, '14.0', '15.0', '16.0', '17.0'),
(58, 22, 5, '14.0', '15.0', '17.0', '18.0'),
(59, 5, 5, '14.0', '15.0', '17.0', '18.0'),
(60, 11, 5, '15.0', '16.0', '20.0', '21.0'),
(61, 23, 5, '10.0', NULL, NULL, '11.0'),
(62, 13, 5, '12.0', '13.0', '14.0', '15.0'),
(63, 14, 5, '13.0', '14.0', '15.0', '16.0'),
(64, 15, 5, '13.0', '14.0', '15.0', '16.0'),
(65, 17, 5, '14.0', '15.0', '20.0', '21.0'),
(66, 18, 5, '14.0', '15.0', '20.0', '21.0'),
(67, 1, 6, '14.0', '15.0', '16.0', '17.0'),
(68, 22, 6, '14.0', '15.0', '17.0', '18.0'),
(69, 5, 6, '14.0', '15.0', '17.0', '18.0'),
(70, 11, 6, '15.0', '16.0', '20.0', '21.0'),
(71, 23, 6, '10.0', NULL, NULL, '11.0'),
(72, 13, 6, '12.0', '13.0', '14.0', '15.0'),
(73, 14, 6, '13.0', '14.0', '15.0', '16.0'),
(74, 15, 6, '13.0', '14.0', '15.0', '16.0'),
(75, 17, 6, '14.0', '15.0', '20.0', '21.0'),
(76, 18, 6, '14.0', '15.0', '20.0', '21.0'),
(127, 17, 12, '17.0', '18.0', '20.0', '21.0'),
(128, 20, 12, '10.0', '11.0', '15.0', '16.0'),
(129, 15, 12, '14.0', '15.0', '17.0', '18.0'),
(130, 1, 12, '14.0', '15.0', '16.0', '17.0'),
(131, 22, 12, '14.0', '15.0', '17.0', '18.0'),
(132, 5, 12, '14.0', '15.0', '17.0', '18.0'),
(133, 6, 12, '13.0', '14.0', '20.0', '21.0'),
(134, 11, 12, '15.0', '16.0', '20.0', '21.0'),
(135, 13, 12, '12.0', '13.0', '14.0', '15.0'),
(136, 24, 12, '11.0', '12.0', '14.0', '15.0'),
(137, 14, 12, '18.0', '19.0', '21.0', '22.0'),
(138, 18, 12, '17.0', '18.0', '20.0', '21.0'),
(139, 17, 13, '17.0', '18.0', '20.0', '21.0'),
(140, 18, 13, '17.0', '18.0', '20.0', '21.0'),
(141, 1, 13, '14.0', '15.0', '16.0', '17.0'),
(142, 14, 13, '18.0', '19.0', '21.0', '22.0'),
(143, 13, 13, '12.0', '13.0', '14.0', '15.0'),
(144, 11, 13, '15.0', '16.0', '20.0', '21.0'),
(145, 5, 13, '14.0', '15.0', '17.0', '18.0'),
(146, 6, 13, '13.0', '14.0', '20.0', '21.0'),
(147, 22, 13, '14.0', '15.0', '17.0', '18.0'),
(148, 24, 13, '11.0', '12.0', '14.0', '15.0'),
(149, 15, 13, '14.0', '15.0', '17.0', '18.0'),
(150, 20, 13, '10.0', '11.0', '15.0', '16.0'),
(175, 11, 16, '20.0', '21.0', '30.0', '31.0'),
(176, 2, 16, '13.0', '14.0', '16.0', '17.0'),
(177, 16, 16, '13.0', '14.0', '18.0', '19.0'),
(178, 12, 16, '10.0', '11.0', '15.0', '16.0'),
(179, 10, 16, '12.0', '13.0', '17.0', '18.0'),
(180, 6, 16, '19.0', '20.0', '22.0', '23.0'),
(181, 2, 17, '13.0', '14.0', '16.0', '17.0'),
(182, 11, 17, '20.0', '21.0', '30.0', '31.0'),
(183, 16, 17, '13.0', '14.0', '18.0', '19.0'),
(184, 12, 17, '10.0', '11.0', '15.0', '16.0'),
(185, 10, 17, '12.0', '13.0', '17.0', '18.0'),
(186, 6, 17, '19.0', '20.0', '22.0', '23.0'),
(187, 2, 18, '13.0', '14.0', '16.0', '17.0'),
(188, 6, 18, '19.0', '20.0', '22.0', '23.0'),
(189, 11, 18, '20.0', '21.0', '30.0', '31.0'),
(190, 16, 18, '13.0', '14.0', '18.0', '19.0'),
(191, 10, 18, '12.0', '13.0', '17.0', '18.0'),
(192, 12, 18, '10.0', '11.0', '15.0', '16.0'),
(193, 6, 19, '19.0', '20.0', '22.0', '23.0'),
(194, 2, 19, '13.0', '14.0', '16.0', '17.0'),
(195, 11, 19, '20.0', '21.0', '30.0', '31.0'),
(196, 10, 19, '12.0', '13.0', '17.0', '18.0'),
(197, 16, 19, '13.0', '14.0', '18.0', '19.0'),
(198, 12, 19, '10.0', '11.0', '15.0', '16.0'),
(199, 10, 20, '12.0', '13.0', '17.0', '18.0'),
(200, 24, 20, '14.0', '15.0', '18.0', '19.0'),
(201, 20, 20, '10.0', '11.0', '15.0', '16.0'),
(202, 2, 20, '13.0', '14.0', '16.0', '17.0'),
(203, 6, 21, '24.0', '25.0', '26.0', '27.0'),
(204, 25, 21, '15.0', '16.0', '20.0', '21.0'),
(205, 26, 21, '15.0', '16.0', '18.0', '19.0'),
(206, 10, 21, '17.0', '18.0', '20.0', '21.0'),
(207, 27, 21, NULL, NULL, NULL, '17.0'),
(208, 28, 21, NULL, NULL, NULL, '21.0'),
(209, 24, 21, '18.0', '19.0', '22.0', '23.0'),
(223, 1, 23, '14.0', '15.0', '16.0', '17.0'),
(224, 11, 23, '15.0', '16.0', '20.0', '21.0'),
(225, 10, 23, '12.0', '13.0', '17.0', '18.0'),
(226, 25, 23, '13.0', '14.0', '22.0', '23.0'),
(227, 26, 23, '14.0', '15.0', '20.0', '21.0'),
(228, 13, 23, '12.0', '13.0', '14.0', '15.0'),
(229, 19, 23, '14.0', '15.0', '16.0', '17.0'),
(230, 28, 23, '16.0', NULL, NULL, '21.0'),
(231, 31, 23, '16.0', '17.0', '19.0', '20.0'),
(232, 24, 23, '14.0', '15.0', '18.0', '19.0'),
(233, 20, 23, '10.0', '11.0', '15.0', '16.0'),
(234, 27, 23, NULL, NULL, NULL, NULL),
(235, 30, 23, '21.0', NULL, NULL, '22.0'),
(236, 29, 23, '28.0', NULL, NULL, '29.0'),
(238, 1, 24, '14.0', '15.0', '16.0', '17.0'),
(239, 27, 24, NULL, NULL, NULL, NULL),
(240, 20, 24, '10.0', '11.0', '15.0', '16.0'),
(241, 31, 24, '16.0', '17.0', '19.0', '20.0'),
(242, 24, 24, '14.0', '15.0', '18.0', '19.0'),
(243, 29, 24, '28.0', NULL, NULL, '29.0'),
(244, 19, 24, '14.0', '15.0', '16.0', '17.0'),
(245, 28, 24, '16.0', NULL, NULL, '21.0'),
(246, 13, 24, '12.0', '13.0', '14.0', '15.0'),
(247, 25, 24, '13.0', '14.0', '22.0', '23.0'),
(248, 26, 24, '14.0', '15.0', '20.0', '21.0'),
(249, 11, 24, '15.0', '16.0', '20.0', '21.0'),
(250, 10, 24, '12.0', '13.0', '17.0', '18.0'),
(251, 30, 24, '21.0', NULL, NULL, '22.0'),
(252, 28, 25, '16.0', NULL, NULL, '21.0'),
(253, 31, 25, '16.0', '17.0', '19.0', '20.0'),
(254, 19, 25, '14.0', '15.0', '16.0', '17.0'),
(255, 1, 25, '14.0', '15.0', '16.0', '17.0'),
(256, 13, 25, '12.0', '13.0', '14.0', '15.0'),
(257, 11, 25, '15.0', '16.0', '20.0', '21.0'),
(258, 10, 25, '12.0', '13.0', '17.0', '18.0'),
(259, 20, 25, '10.0', '11.0', '15.0', '16.0'),
(260, 24, 25, '14.0', '15.0', '18.0', '19.0'),
(261, 27, 25, NULL, NULL, NULL, NULL),
(262, 26, 25, '14.0', '15.0', '20.0', '21.0'),
(263, 25, 25, '13.0', '14.0', '22.0', '23.0'),
(264, 30, 25, '21.0', NULL, NULL, '22.0'),
(265, 29, 25, '28.0', NULL, NULL, '29.0'),
(308, 27, 29, NULL, NULL, NULL, NULL),
(309, 20, 29, NULL, NULL, NULL, NULL),
(310, 24, 29, NULL, NULL, NULL, NULL),
(311, 31, 29, NULL, NULL, NULL, NULL),
(312, 29, 29, NULL, NULL, NULL, NULL),
(313, 19, 29, NULL, NULL, NULL, NULL),
(314, 28, 29, NULL, NULL, NULL, NULL),
(315, 13, 29, NULL, NULL, NULL, NULL),
(316, 25, 29, NULL, NULL, NULL, NULL),
(317, 26, 29, NULL, NULL, NULL, NULL),
(318, 11, 29, NULL, NULL, NULL, NULL),
(319, 10, 29, NULL, NULL, NULL, NULL),
(320, 30, 29, NULL, NULL, NULL, NULL),
(321, 1, 29, NULL, NULL, NULL, NULL),
(322, 1, 30, NULL, NULL, NULL, NULL),
(323, 30, 30, NULL, NULL, NULL, NULL),
(324, 27, 30, NULL, NULL, NULL, NULL),
(325, 20, 30, NULL, NULL, NULL, NULL),
(326, 24, 30, NULL, NULL, NULL, NULL),
(327, 31, 30, NULL, NULL, NULL, NULL),
(328, 29, 30, NULL, NULL, NULL, NULL),
(329, 19, 30, NULL, NULL, NULL, NULL),
(330, 28, 30, NULL, NULL, NULL, NULL),
(331, 13, 30, NULL, NULL, NULL, NULL),
(332, 25, 30, NULL, NULL, NULL, NULL),
(333, 26, 30, NULL, NULL, NULL, NULL),
(334, 11, 30, NULL, NULL, NULL, NULL),
(335, 10, 30, NULL, NULL, NULL, NULL),
(336, 1, 31, NULL, NULL, NULL, NULL),
(337, 30, 31, NULL, NULL, NULL, NULL),
(338, 27, 31, NULL, NULL, NULL, NULL),
(339, 20, 31, NULL, NULL, NULL, NULL),
(340, 24, 31, NULL, NULL, NULL, NULL),
(341, 31, 31, NULL, NULL, NULL, NULL),
(342, 29, 31, NULL, NULL, NULL, NULL),
(343, 19, 31, NULL, NULL, NULL, NULL),
(344, 28, 31, NULL, NULL, NULL, NULL),
(345, 13, 31, NULL, NULL, NULL, NULL),
(346, 25, 31, NULL, NULL, NULL, NULL),
(347, 26, 31, NULL, NULL, NULL, NULL),
(348, 10, 31, NULL, NULL, NULL, NULL),
(349, 11, 31, NULL, NULL, NULL, NULL),
(350, 18, 32, '17.0', '18.0', '20.0', '21.0'),
(351, 17, 32, '17.0', '18.0', '20.0', '21.0'),
(352, 19, 32, '14.0', '15.0', '16.0', '17.0'),
(353, 16, 32, '13.0', '14.0', '18.0', '19.0'),
(354, 14, 32, '19.0', '20.0', '22.0', '23.0'),
(355, 13, 32, '12.0', '13.0', '14.0', '15.0'),
(356, 12, 32, '10.0', '11.0', '15.0', '16.0'),
(357, 11, 32, '15.0', '16.0', '20.0', '21.0'),
(358, 10, 32, '12.0', '13.0', '17.0', '18.0'),
(359, 8, 32, '14.0', '15.0', '22.0', '23.0'),
(360, 6, 32, '13.0', '14.0', '20.0', '21.0'),
(361, 5, 32, '13.0', '14.0', '20.0', '21.0'),
(362, 2, 32, '13.0', '14.0', '16.0', '17.0'),
(363, 21, 32, '13.0', '14.0', '17.0', '18.0'),
(364, 18, 33, '17.0', '18.0', '20.0', '21.0'),
(365, 17, 33, '17.0', '18.0', '20.0', '21.0'),
(366, 19, 33, '13.0', '14.0', '16.0', '17.0'),
(367, 16, 33, '13.0', '14.0', '18.0', '19.0'),
(368, 14, 33, '19.0', '20.0', '22.0', '23.0'),
(369, 13, 33, '12.0', '13.0', '14.0', '15.0'),
(370, 11, 33, '15.0', '16.0', '20.0', '21.0'),
(371, 10, 33, '12.0', '13.0', '17.0', '18.0'),
(372, 12, 33, '10.0', '11.0', '15.0', '16.0'),
(373, 8, 33, '14.0', '15.0', '17.0', '18.0'),
(374, 6, 33, '13.0', '14.0', '20.0', '21.0'),
(375, 5, 33, '13.0', '14.0', '20.0', '21.0'),
(376, 22, 33, NULL, NULL, NULL, '25.0'),
(377, 2, 33, '13.0', '14.0', '16.0', '17.0'),
(378, 28, 34, '20.0', '21.0', '22.0', '23.0'),
(379, 31, 34, '16.0', '17.0', '19.0', '20.0'),
(380, 19, 34, '14.0', '15.0', '16.0', '17.0'),
(381, 32, 34, '6.0', '7.0', '9.0', '10.0'),
(382, 11, 34, '15.0', '16.0', '20.0', '21.0'),
(383, 10, 34, '12.0', '13.0', '17.0', '18.0'),
(384, 27, 34, '14.0', '15.0', '17.0', '18.0'),
(385, 24, 34, '14.0', '15.0', '18.0', '19.0'),
(386, 25, 34, '13.0', '14.0', '22.0', '23.0'),
(387, 29, 34, '14.0', NULL, NULL, '15.0'),
(388, 2, 34, '16.0', NULL, NULL, '17.0'),
(389, 27, 35, '14.0', '15.0', '17.0', '18.0'),
(390, 24, 35, '14.0', '15.0', '18.0', '19.0'),
(391, 32, 35, '6.0', '7.0', '9.0', '10.0'),
(392, 31, 35, '16.0', '17.0', '19.0', '20.0'),
(393, 29, 35, '14.0', NULL, NULL, '15.0'),
(394, 19, 35, '14.0', '15.0', '16.0', '17.0'),
(395, 28, 35, '20.0', '21.0', '22.0', '23.0'),
(396, 13, 35, '6.0', '7.0', '9.0', '10.0'),
(397, 25, 35, '13.0', '14.0', '22.0', '23.0'),
(398, 11, 35, '15.0', '16.0', '20.0', '21.0'),
(399, 10, 35, '12.0', '13.0', '17.0', '18.0'),
(400, 2, 35, '16.0', NULL, NULL, '17.0'),
(401, 24, 36, '18.0', '19.0', '22.0', '23.0'),
(402, 27, 36, NULL, NULL, NULL, '17.0'),
(403, 10, 36, '17.0', '18.0', '20.0', '21.0'),
(404, 26, 36, '15.0', '16.0', '18.0', '19.0'),
(405, 25, 36, '15.0', '16.0', '20.0', '21.0'),
(406, 6, 36, NULL, NULL, NULL, '24.0'),
(407, 15, 37, '15.0', '16.0', '19.0', '20.0'),
(408, 20, 37, '10.0', '11.0', '15.0', '16.0'),
(409, 33, 37, '14.0', '15.0', '18.0', '19.0'),
(410, 5, 37, '17.0', '18.0', '20.0', '21.0'),
(411, 5, 38, '17.0', '18.0', '20.0', '21.0'),
(412, 15, 38, '15.0', '16.0', '19.0', '20.0'),
(413, 33, 38, '14.0', '15.0', '18.0', '19.0'),
(414, 20, 38, '10.0', '11.0', '15.0', '16.0'),
(415, 5, 39, '17.0', '18.0', '20.0', '21.0'),
(416, 15, 39, '15.0', '16.0', '19.0', '20.0'),
(417, 33, 39, '14.0', '15.0', '18.0', '19.0'),
(418, 20, 39, '10.0', '11.0', '15.0', '16.0'),
(419, 6, 40, NULL, NULL, NULL, '35.0'),
(420, 34, 40, NULL, NULL, NULL, '31.0'),
(421, 11, 40, '27.0', '28.0', '40.0', '41.0'),
(422, 29, 40, '26.0', '27.0', '46.0', '47.0'),
(423, 24, 40, '30.0', '31.0', '37.0', '38.0'),
(424, 35, 40, '14.0', '15.0', '17.0', '18.0'),
(425, 24, 41, '30.0', '31.0', '37.0', '38.0'),
(426, 35, 41, '14.0', '15.0', '17.0', '18.0'),
(427, 29, 41, '26.0', '27.0', '46.0', '47.0'),
(428, 11, 41, '27.0', '28.0', '40.0', '41.0'),
(429, 6, 41, NULL, NULL, NULL, '35.0'),
(430, 24, 42, '30.0', '31.0', '37.0', '38.0'),
(431, 35, 42, '14.0', '15.0', '17.0', '18.0'),
(432, 29, 42, '26.0', '27.0', '46.0', '47.0'),
(433, 11, 42, '27.0', '28.0', '40.0', '41.0'),
(434, 6, 42, NULL, NULL, NULL, '35.0'),
(435, 6, 43, NULL, NULL, NULL, '35.0'),
(436, 11, 43, '27.0', '28.0', '40.0', '41.0'),
(437, 29, 43, '26.0', '27.0', '46.0', '47.0'),
(438, 35, 43, '14.0', '15.0', '17.0', '18.0'),
(439, 24, 43, '30.0', '31.0', '37.0', '38.0'),
(440, 24, 44, '25.0', '26.0', '28.0', '29.0'),
(441, 20, 44, '10.0', '11.0', '15.0', '16.0'),
(442, 15, 44, NULL, NULL, NULL, '20.0'),
(443, 31, 44, '16.0', '17.0', '19.0', '20.0'),
(444, 8, 44, '16.0', '17.0', '19.0', '20.0'),
(445, 11, 44, NULL, NULL, NULL, '21.0'),
(446, 10, 44, '25.0', '26.0', '28.0', '29.0'),
(447, 3, 44, '19.0', NULL, NULL, '20.0'),
(448, 2, 44, '18.0', '19.0', '21.0', '22.0'),
(449, 6, 44, NULL, NULL, NULL, '20.0'),
(450, 20, 45, '10.0', '11.0', '15.0', '16.0'),
(451, 24, 45, '25.0', '26.0', '28.0', '29.0'),
(452, 31, 45, '16.0', '17.0', '19.0', '20.0'),
(453, 15, 45, NULL, NULL, NULL, '20.0'),
(454, 11, 45, NULL, NULL, NULL, '21.0'),
(455, 10, 45, '25.0', '26.0', '28.0', '29.0'),
(456, 8, 45, '16.0', '17.0', '19.0', '20.0'),
(457, 6, 45, NULL, NULL, NULL, '26.0'),
(458, 3, 45, '19.0', NULL, NULL, '20.0'),
(459, 2, 45, '18.0', '19.0', '21.0', '22.0'),
(460, 6, 46, NULL, NULL, NULL, '26.0'),
(461, 8, 46, '16.0', '17.0', '19.0', '20.0'),
(462, 20, 46, '10.0', '11.0', '15.0', '16.0'),
(463, 24, 46, '25.0', '26.0', '28.0', '29.0'),
(464, 31, 46, '16.0', '17.0', '19.0', '20.0'),
(465, 15, 46, NULL, NULL, NULL, '20.0'),
(466, 11, 46, NULL, NULL, NULL, '21.0'),
(467, 10, 46, '25.0', '26.0', '28.0', '29.0'),
(468, 3, 46, '19.0', NULL, NULL, '20.0'),
(469, 2, 46, '18.0', '19.0', '21.0', '22.0'),
(480, 20, 48, '10.0', '11.0', '15.0', '16.0'),
(481, 24, 48, '25.0', '26.0', '28.0', '29.0'),
(482, 31, 48, '16.0', '17.0', '19.0', '20.0'),
(483, 15, 48, NULL, NULL, NULL, '20.0'),
(484, 11, 48, NULL, NULL, NULL, '21.0'),
(485, 10, 48, '25.0', '26.0', '28.0', '29.0'),
(486, 8, 48, '16.0', '17.0', '19.0', '20.0'),
(487, 6, 48, NULL, NULL, NULL, '26.0'),
(488, 3, 48, '19.0', NULL, NULL, '20.0'),
(489, 2, 48, '18.0', '19.0', '21.0', '22.0'),
(519, 3, 52, '19.0', NULL, NULL, '20.0'),
(520, 2, 52, '18.0', '19.0', '21.0', '22.0'),
(521, 20, 52, '10.0', '11.0', '15.0', '16.0'),
(522, 24, 52, '25.0', '26.0', '28.0', '29.0'),
(523, 31, 52, '16.0', '17.0', '19.0', '20.0'),
(524, 15, 52, NULL, NULL, NULL, '20.0'),
(525, 8, 52, '16.0', '17.0', '19.0', '20.0'),
(526, 6, 52, NULL, NULL, NULL, '26.0'),
(527, 11, 52, NULL, NULL, NULL, '21.0'),
(528, 10, 52, '25.0', '26.0', '28.0', '29.0'),
(529, 20, 53, '10.0', '11.0', '15.0', '16.0'),
(530, 24, 53, '25.0', '26.0', '28.0', '29.0'),
(531, 31, 53, '16.0', '17.0', '19.0', '20.0'),
(532, 15, 53, NULL, NULL, NULL, '20.0'),
(533, 11, 53, NULL, NULL, NULL, '21.0'),
(534, 10, 53, '25.0', '26.0', '28.0', '29.0'),
(535, 8, 53, '16.0', '17.0', '19.0', '20.0'),
(536, 6, 53, NULL, NULL, NULL, '26.0'),
(537, 3, 53, '19.0', NULL, NULL, '20.0'),
(538, 2, 53, '18.0', '19.0', '21.0', '22.0'),
(539, 31, 54, '16.0', '17.0', '19.0', '20.0'),
(540, 24, 54, '25.0', '26.0', '28.0', '29.0'),
(541, 20, 54, '10.0', '11.0', '15.0', '16.0'),
(542, 15, 54, NULL, NULL, NULL, '20.0'),
(543, 11, 54, NULL, NULL, NULL, '21.0'),
(544, 10, 54, '25.0', '26.0', '28.0', '29.0'),
(545, 8, 54, '16.0', '17.0', '19.0', '20.0'),
(546, 6, 54, NULL, NULL, NULL, '26.0'),
(547, 3, 54, '19.0', NULL, NULL, '20.0'),
(548, 2, 54, '18.0', '19.0', '21.0', '22.0'),
(549, 20, 55, '10.0', '11.0', '15.0', '16.0'),
(550, 24, 55, '25.0', '26.0', '28.0', '29.0'),
(551, 31, 55, '16.0', '17.0', '19.0', '20.0'),
(552, 15, 55, NULL, NULL, NULL, '20.0'),
(553, 11, 55, NULL, NULL, NULL, '21.0'),
(554, 10, 55, '25.0', '26.0', '28.0', '29.0'),
(555, 8, 55, '16.0', '17.0', '19.0', '20.0'),
(556, 6, 55, NULL, NULL, NULL, '26.0'),
(557, 3, 55, '19.0', NULL, NULL, '20.0'),
(558, 2, 55, '18.0', '19.0', '21.0', '22.0'),
(559, 20, 56, '10.0', '11.0', '15.0', '16.0'),
(560, 24, 56, '25.0', '26.0', '28.0', '29.0'),
(561, 31, 56, '16.0', '17.0', '19.0', '20.0'),
(562, 15, 56, NULL, NULL, NULL, '20.0'),
(563, 11, 56, NULL, NULL, NULL, '21.0'),
(564, 10, 56, '25.0', '26.0', '28.0', '29.0'),
(565, 8, 56, '16.0', '17.0', '19.0', '20.0'),
(566, 6, 56, NULL, NULL, NULL, '26.0'),
(567, 3, 56, '19.0', NULL, NULL, '20.0'),
(568, 2, 56, '18.0', '19.0', '21.0', '22.0'),
(601, 20, 61, '15.0', '16.0', '18.0', '19.0'),
(602, 24, 61, '24.0', '25.0', '27.0', '28.0'),
(603, 31, 61, '16.0', '17.0', '18.0', '19.0'),
(604, 28, 61, NULL, NULL, NULL, '21.0'),
(605, 10, 61, '20.0', NULL, NULL, '21.0'),
(606, 26, 61, '15.0', '16.0', '18.0', '19.0'),
(607, 25, 61, '15.0', '16.0', '20.0', '21.0'),
(608, 36, 61, NULL, NULL, NULL, '20.0'),
(699, 18, 67, NULL, NULL, NULL, NULL),
(700, 17, 67, NULL, NULL, NULL, NULL),
(701, 19, 67, NULL, NULL, NULL, NULL),
(702, 16, 67, NULL, NULL, NULL, NULL),
(703, 15, 67, NULL, NULL, NULL, NULL),
(704, 14, 67, NULL, NULL, NULL, NULL),
(705, 13, 67, NULL, NULL, NULL, NULL),
(706, 12, 67, NULL, NULL, NULL, NULL),
(707, 11, 67, NULL, NULL, NULL, NULL),
(708, 10, 67, NULL, NULL, NULL, NULL),
(709, 9, 67, NULL, NULL, NULL, NULL),
(710, 8, 67, NULL, NULL, NULL, NULL),
(711, 6, 67, NULL, NULL, NULL, NULL),
(712, 5, 67, NULL, NULL, NULL, NULL),
(713, 4, 67, NULL, NULL, NULL, NULL),
(714, 22, 67, NULL, NULL, NULL, NULL),
(715, 2, 67, '13.0', '14.0', '16.0', '17.0'),
(716, 9, 33, '14.0', '15.0', '22.0', '23.0'),
(717, 18, 68, '17.0', '18.0', '20.0', '21.0'),
(718, 17, 68, '17.0', '18.0', '20.0', '21.0'),
(719, 19, 68, '13.0', '14.0', '16.0', '17.0'),
(720, 16, 68, '13.0', '14.0', '18.0', '19.0'),
(721, 15, 68, '19.0', '20.0', '22.0', '23.0'),
(722, 13, 68, '12.0', '13.0', '14.0', '15.0'),
(723, 14, 68, '19.0', '20.0', '22.0', '23.0'),
(724, 12, 68, '10.0', '11.0', '15.0', '16.0'),
(725, 11, 68, '15.0', '16.0', '20.0', '21.0'),
(726, 10, 68, '12.0', '13.0', '17.0', '18.0'),
(727, 9, 68, '14.0', '15.0', '22.0', '23.0'),
(728, 8, 68, '14.0', '15.0', '17.0', '18.0'),
(729, 6, 68, '19.0', '20.0', '22.0', '23.0'),
(730, 5, 68, '17.0', '18.0', '20.0', '21.0'),
(731, 4, 68, '22.0', '23.0', '25.0', '26.0'),
(732, 22, 68, NULL, NULL, NULL, '25.0'),
(733, 2, 68, '13.0', '14.0', '16.0', '17.0'),
(734, 21, 68, '13.0', '14.0', '17.0', '18.0'),
(735, 16, 69, '13.0', '14.0', '18.0', '19.0'),
(736, 17, 69, '17.0', '18.0', '20.0', '21.0'),
(737, 18, 69, '17.0', '18.0', '20.0', '21.0'),
(738, 19, 69, '13.0', '14.0', '16.0', '17.0'),
(739, 21, 69, '13.0', '14.0', '17.0', '18.0'),
(740, 2, 69, '13.0', '14.0', '16.0', '17.0'),
(741, 22, 69, NULL, NULL, NULL, '25.0'),
(742, 4, 69, '22.0', '23.0', '25.0', '26.0'),
(743, 5, 69, '17.0', '18.0', '20.0', '21.0'),
(744, 6, 69, '19.0', '20.0', '22.0', '23.0'),
(745, 9, 69, '14.0', '15.0', '22.0', '23.0'),
(746, 8, 69, '14.0', '15.0', '17.0', '18.0'),
(747, 10, 69, '12.0', '13.0', '17.0', '18.0'),
(748, 11, 69, '15.0', '16.0', '20.0', '21.0'),
(749, 12, 69, '10.0', '11.0', '15.0', '16.0'),
(750, 13, 69, '12.0', '13.0', '14.0', '15.0'),
(751, 15, 69, '19.0', '20.0', '22.0', '23.0'),
(752, 14, 69, '19.0', '20.0', '22.0', '23.0'),
(771, 18, 71, '17.0', '18.0', '20.0', '21.0'),
(772, 17, 71, '17.0', '18.0', '20.0', '21.0'),
(773, 19, 71, '13.0', '14.0', '16.0', '17.0'),
(774, 16, 71, '13.0', '14.0', '18.0', '19.0'),
(775, 15, 71, '19.0', '20.0', '22.0', '23.0'),
(776, 14, 71, '19.0', '20.0', '22.0', '23.0'),
(777, 13, 71, '12.0', '13.0', '14.0', '15.0'),
(778, 12, 71, '10.0', '11.0', '15.0', '16.0'),
(779, 9, 71, '14.0', '15.0', '22.0', '23.0'),
(780, 8, 71, '14.0', '15.0', '17.0', '18.0'),
(781, 6, 71, '19.0', '20.0', '22.0', '23.0'),
(782, 5, 71, '17.0', '18.0', '20.0', '21.0'),
(783, 4, 71, '22.0', '23.0', '25.0', '26.0'),
(784, 22, 71, NULL, NULL, NULL, '25.0'),
(785, 21, 71, '13.0', '14.0', '17.0', '18.0'),
(786, 2, 71, '13.0', '14.0', '16.0', '17.0'),
(787, 11, 71, '15.0', '16.0', '20.0', '21.0'),
(788, 10, 71, '12.0', '13.0', '17.0', '18.0'),
(789, 18, 72, '17.0', '18.0', '20.0', '21.0'),
(790, 17, 72, '17.0', '18.0', '20.0', '21.0'),
(791, 19, 72, '13.0', '14.0', '16.0', '17.0'),
(792, 16, 72, '13.0', '14.0', '18.0', '19.0'),
(793, 15, 72, '19.0', '20.0', '22.0', '23.0'),
(794, 14, 72, '19.0', '20.0', '22.0', '23.0'),
(795, 13, 72, '12.0', '13.0', '14.0', '15.0'),
(796, 12, 72, '10.0', '11.0', '15.0', '16.0'),
(797, 11, 72, '15.0', '16.0', '20.0', '21.0'),
(798, 10, 72, '12.0', '13.0', '17.0', '18.0'),
(799, 9, 72, '14.0', '15.0', '22.0', '23.0'),
(800, 8, 72, '14.0', '15.0', '17.0', '18.0'),
(801, 6, 72, '19.0', '20.0', '22.0', '23.0'),
(802, 5, 72, '17.0', '18.0', '20.0', '21.0'),
(803, 4, 72, '22.0', '23.0', '25.0', '26.0'),
(804, 22, 72, NULL, NULL, NULL, '25.0'),
(805, 2, 72, '13.0', '14.0', '16.0', '17.0'),
(806, 21, 72, '13.0', '14.0', '17.0', '18.0'),
(825, 18, 74, '17.0', '18.0', '20.0', '21.0'),
(826, 17, 74, '17.0', '18.0', '20.0', '21.0'),
(827, 19, 74, '13.0', '14.0', '16.0', '17.0'),
(828, 16, 74, '13.0', '14.0', '18.0', '19.0'),
(829, 15, 74, '19.0', '20.0', '22.0', '23.0'),
(830, 14, 74, '19.0', '20.0', '22.0', '23.0'),
(831, 13, 74, '12.0', '13.0', '14.0', '15.0'),
(832, 12, 74, '10.0', '11.0', '15.0', '16.0'),
(833, 11, 74, '15.0', '16.0', '20.0', '21.0'),
(834, 10, 74, '12.0', '13.0', '17.0', '18.0'),
(835, 9, 74, '14.0', '15.0', '22.0', '23.0'),
(836, 8, 74, '14.0', '15.0', '17.0', '18.0'),
(837, 6, 74, '19.0', '20.0', '22.0', '23.0'),
(838, 5, 74, '17.0', '18.0', '20.0', '21.0'),
(839, 4, 74, '22.0', '23.0', '25.0', '26.0'),
(840, 22, 74, NULL, NULL, NULL, '25.0'),
(841, 2, 74, '13.0', '14.0', '16.0', '17.0'),
(842, 21, 74, '13.0', '14.0', '17.0', '18.0'),
(843, 18, 75, '17.0', '18.0', '20.0', '21.0'),
(844, 17, 75, '17.0', '18.0', '20.0', '21.0'),
(845, 19, 75, '13.0', '14.0', '16.0', '17.0'),
(846, 16, 75, '13.0', '14.0', '18.0', '19.0'),
(847, 15, 75, '19.0', '20.0', '22.0', '23.0'),
(848, 14, 75, '19.0', '20.0', '22.0', '23.0'),
(849, 13, 75, '12.0', '13.0', '14.0', '15.0'),
(850, 12, 75, '10.0', '11.0', '15.0', '16.0'),
(851, 10, 75, '12.0', '13.0', '17.0', '18.0'),
(852, 11, 75, '15.0', '16.0', '20.0', '21.0'),
(853, 9, 75, '14.0', '15.0', '22.0', '23.0'),
(854, 8, 75, '14.0', '15.0', '17.0', '18.0'),
(855, 6, 75, '19.0', '20.0', '22.0', '23.0'),
(856, 5, 75, '17.0', '18.0', '20.0', '21.0'),
(857, 4, 75, '22.0', '23.0', '25.0', '26.0'),
(858, 22, 75, NULL, NULL, NULL, '25.0'),
(859, 2, 75, '13.0', '14.0', '16.0', '17.0'),
(860, 21, 75, '13.0', '14.0', '17.0', '18.0'),
(861, 18, 76, '17.0', '18.0', '20.0', '21.0'),
(862, 17, 76, '17.0', '18.0', '20.0', '21.0'),
(863, 19, 76, '13.0', '14.0', '16.0', '17.0'),
(864, 16, 76, '13.0', '14.0', '18.0', '19.0'),
(865, 15, 76, '19.0', '20.0', '22.0', '23.0'),
(866, 14, 76, '19.0', '20.0', '22.0', '23.0'),
(867, 13, 76, '12.0', '13.0', '14.0', '15.0'),
(868, 12, 76, '10.0', '11.0', '15.0', '16.0'),
(869, 10, 76, '12.0', '13.0', '17.0', '18.0'),
(870, 11, 76, '15.0', '16.0', '20.0', '21.0'),
(871, 9, 76, '14.0', '15.0', '22.0', '23.0'),
(872, 8, 76, '14.0', '15.0', '17.0', '18.0'),
(873, 6, 76, '19.0', '20.0', '22.0', '23.0'),
(874, 5, 76, '17.0', '18.0', '20.0', '21.0'),
(875, 4, 76, '22.0', '23.0', '25.0', '26.0'),
(876, 22, 76, NULL, NULL, NULL, '25.0'),
(877, 2, 76, '13.0', '14.0', '16.0', '17.0'),
(878, 21, 76, '13.0', '14.0', '17.0', '18.0'),
(879, 18, 77, '17.0', '18.0', '20.0', '21.0'),
(880, 17, 77, '17.0', '18.0', '20.0', '21.0'),
(881, 19, 77, '13.0', '14.0', '16.0', '17.0'),
(882, 16, 77, '13.0', '14.0', '18.0', '19.0'),
(883, 15, 77, '19.0', '20.0', '22.0', '23.0'),
(884, 14, 77, '19.0', '20.0', '22.0', '23.0'),
(885, 13, 77, '12.0', '13.0', '14.0', '15.0'),
(886, 12, 77, '10.0', '11.0', '15.0', '16.0'),
(887, 11, 77, '15.0', '16.0', '20.0', '21.0'),
(888, 10, 77, '12.0', '13.0', '17.0', '18.0'),
(889, 9, 77, '14.0', '15.0', '22.0', '23.0'),
(890, 8, 77, '14.0', '15.0', '17.0', '18.0'),
(891, 6, 77, '19.0', '20.0', '22.0', '23.0'),
(892, 5, 77, '17.0', '18.0', '20.0', '21.0'),
(893, 4, 77, '22.0', '23.0', '25.0', '26.0'),
(894, 22, 77, NULL, NULL, NULL, '25.0'),
(895, 2, 77, '13.0', '14.0', '16.0', '17.0'),
(896, 21, 77, '13.0', '14.0', '17.0', '18.0'),
(933, 18, 80, '17.0', '18.0', '20.0', '21.0'),
(934, 17, 80, '17.0', '18.0', '20.0', '21.0'),
(935, 19, 80, '13.0', '14.0', '16.0', '17.0'),
(936, 16, 80, '13.0', '14.0', '18.0', '19.0'),
(937, 15, 80, '19.0', '20.0', '22.0', '23.0'),
(938, 14, 80, '19.0', '20.0', '22.0', '23.0'),
(939, 13, 80, '12.0', '13.0', '14.0', '15.0'),
(940, 12, 80, '10.0', '11.0', '15.0', '16.0'),
(941, 10, 80, '12.0', '13.0', '17.0', '18.0'),
(942, 11, 80, '15.0', '16.0', '20.0', '21.0'),
(943, 9, 80, '14.0', '15.0', '22.0', '23.0'),
(944, 8, 80, '14.0', '15.0', '17.0', '18.0'),
(945, 6, 80, '19.0', '20.0', '22.0', '23.0'),
(946, 5, 80, '17.0', '18.0', '20.0', '21.0'),
(947, 4, 80, '22.0', '23.0', '25.0', '26.0'),
(948, 22, 80, NULL, NULL, NULL, '25.0'),
(949, 2, 80, '13.0', '14.0', '16.0', '17.0'),
(950, 21, 80, '13.0', '14.0', '17.0', '18.0'),
(951, 18, 81, '17.0', '18.0', '20.0', '21.0'),
(952, 17, 81, '17.0', '18.0', '20.0', '21.0'),
(953, 19, 81, '13.0', '14.0', '16.0', '17.0'),
(954, 16, 81, '13.0', '14.0', '18.0', '19.0'),
(955, 15, 81, '19.0', '20.0', '22.0', '23.0'),
(956, 14, 81, '19.0', '20.0', '22.0', '23.0'),
(957, 13, 81, '12.0', '13.0', '14.0', '15.0'),
(958, 12, 81, '10.0', '11.0', '15.0', '16.0'),
(959, 10, 81, '12.0', '13.0', '17.0', '18.0'),
(960, 11, 81, '15.0', '16.0', '20.0', '21.0'),
(961, 9, 81, '14.0', '15.0', '22.0', '23.0'),
(962, 8, 81, '14.0', '15.0', '17.0', '18.0'),
(963, 6, 81, '19.0', '20.0', '22.0', '23.0'),
(964, 5, 81, '17.0', '18.0', '20.0', '21.0'),
(965, 4, 81, '22.0', '23.0', '25.0', '26.0'),
(966, 22, 81, NULL, NULL, NULL, '25.0'),
(967, 21, 81, '13.0', '14.0', '17.0', '18.0'),
(968, 2, 81, '13.0', '14.0', '16.0', '17.0'),
(987, 18, 83, '17.0', '18.0', '20.0', '21.0'),
(988, 17, 83, '17.0', '18.0', '20.0', '21.0'),
(989, 19, 83, '13.0', '14.0', '16.0', '17.0'),
(990, 16, 83, '13.0', '14.0', '18.0', '19.0'),
(991, 15, 83, '19.0', '20.0', '22.0', '23.0'),
(992, 14, 83, '19.0', '20.0', '22.0', '23.0'),
(993, 13, 83, '12.0', '13.0', '14.0', '15.0'),
(994, 12, 83, '10.0', '11.0', '15.0', '16.0'),
(995, 11, 83, '15.0', '16.0', '20.0', '21.0'),
(996, 10, 83, '12.0', '13.0', '17.0', '18.0'),
(997, 9, 83, '14.0', '15.0', '22.0', '23.0'),
(998, 8, 83, '14.0', '15.0', '17.0', '18.0'),
(999, 6, 83, '19.0', '20.0', '22.0', '23.0'),
(1000, 5, 83, '17.0', '18.0', '20.0', '21.0'),
(1001, 4, 83, '22.0', '23.0', '25.0', '26.0'),
(1002, 22, 83, NULL, NULL, NULL, '25.0'),
(1003, 2, 83, '13.0', '14.0', '16.0', '17.0'),
(1004, 21, 83, '13.0', '14.0', '17.0', '18.0'),
(1005, 16, 84, NULL, NULL, NULL, NULL),
(1006, 15, 84, NULL, NULL, NULL, NULL),
(1007, 14, 84, NULL, NULL, NULL, NULL),
(1008, 13, 84, NULL, NULL, NULL, NULL),
(1009, 12, 84, NULL, NULL, NULL, NULL),
(1010, 11, 84, NULL, NULL, NULL, NULL),
(1011, 10, 84, NULL, NULL, NULL, NULL),
(1012, 9, 84, NULL, NULL, NULL, NULL),
(1013, 8, 84, NULL, NULL, NULL, NULL),
(1014, 6, 84, NULL, NULL, NULL, NULL),
(1015, 5, 84, NULL, NULL, NULL, NULL),
(1016, 4, 84, NULL, NULL, NULL, NULL),
(1017, 22, 84, NULL, NULL, NULL, NULL),
(1018, 2, 84, NULL, NULL, NULL, NULL),
(1019, 21, 84, NULL, NULL, NULL, NULL),
(1020, 18, 84, NULL, NULL, NULL, NULL),
(1021, 17, 84, NULL, NULL, NULL, NULL),
(1022, 19, 84, NULL, NULL, NULL, NULL),
(1023, 15, 3, '19.0', '20.0', '22.0', '23.0'),
(1060, 18, 87, '17.0', '18.0', '20.0', '21.0'),
(1061, 17, 87, '17.0', '18.0', '20.0', '21.0'),
(1062, 19, 87, '13.0', '14.0', '16.0', '17.0'),
(1063, 16, 87, '13.0', '14.0', '18.0', '19.0'),
(1064, 15, 87, '19.0', '20.0', '22.0', '23.0'),
(1065, 14, 87, '19.0', '20.0', '22.0', '23.0'),
(1066, 13, 87, '12.0', '13.0', '14.0', '15.0'),
(1067, 12, 87, '10.0', '11.0', '15.0', '16.0'),
(1068, 11, 87, '15.0', '16.0', '20.0', '21.0'),
(1069, 10, 87, '12.0', '13.0', '17.0', '18.0'),
(1070, 9, 87, '14.0', '15.0', '22.0', '23.0'),
(1071, 8, 87, '14.0', '15.0', '17.0', '18.0'),
(1072, 6, 87, '19.0', '20.0', '22.0', '23.0'),
(1073, 5, 87, '17.0', '18.0', '20.0', '21.0'),
(1074, 4, 87, '22.0', '23.0', '25.0', '26.0'),
(1075, 22, 87, NULL, NULL, NULL, '25.0'),
(1076, 2, 87, '13.0', '14.0', '16.0', '17.0'),
(1077, 21, 87, '13.0', '14.0', '17.0', '18.0'),
(1078, 18, 88, '17.0', '18.0', '20.0', '21.0'),
(1079, 17, 88, '17.0', '18.0', '20.0', '21.0'),
(1080, 19, 88, '13.0', '14.0', '16.0', '17.0'),
(1081, 16, 88, '13.0', '14.0', '18.0', '19.0'),
(1082, 15, 88, '19.0', '20.0', '22.0', '23.0'),
(1083, 14, 88, '19.0', '20.0', '22.0', '23.0'),
(1084, 13, 88, '12.0', '13.0', '14.0', '15.0'),
(1085, 12, 88, '10.0', '11.0', '15.0', '16.0'),
(1086, 11, 88, '15.0', '16.0', '20.0', '21.0'),
(1087, 10, 88, '12.0', '13.0', '17.0', '18.0'),
(1088, 8, 88, '14.0', '15.0', '17.0', '18.0'),
(1089, 9, 88, '14.0', '15.0', '22.0', '23.0'),
(1090, 6, 88, '19.0', '20.0', '22.0', '23.0'),
(1091, 5, 88, '17.0', '18.0', '20.0', '21.0'),
(1092, 22, 88, NULL, NULL, NULL, '25.0'),
(1093, 4, 88, '22.0', '23.0', '25.0', '26.0'),
(1094, 2, 88, '13.0', '14.0', '16.0', '17.0'),
(1095, 21, 88, '13.0', '14.0', '17.0', '18.0'),
(1096, 2, 89, NULL, NULL, NULL, NULL),
(1097, 6, 89, NULL, NULL, NULL, NULL),
(1098, 10, 89, NULL, NULL, NULL, NULL),
(1099, 11, 89, NULL, NULL, NULL, NULL),
(1100, 12, 89, NULL, NULL, NULL, NULL),
(1101, 16, 89, NULL, NULL, NULL, NULL),
(1102, 20, 90, '10.0', '11.0', '15.0', '16.0'),
(1103, 33, 90, '14.0', '15.0', '18.0', '19.0'),
(1104, 37, 90, '13.0', '14.0', '16.0', '17.0'),
(1105, 9, 91, '14.0', '15.0', '22.0', '23.0'),
(1106, 18, 91, '17.0', '18.0', '20.0', '21.0'),
(1107, 17, 91, '17.0', '18.0', '20.0', '21.0'),
(1108, 19, 91, '13.0', '14.0', '16.0', '17.0'),
(1109, 16, 91, '13.0', '14.0', '18.0', '19.0'),
(1110, 15, 91, '19.0', '20.0', '22.0', '23.0'),
(1111, 14, 91, '19.0', '20.0', '22.0', '23.0'),
(1112, 13, 91, '12.0', '13.0', '14.0', '15.0'),
(1113, 12, 91, '10.0', '11.0', '15.0', '16.0'),
(1114, 10, 91, '12.0', '13.0', '17.0', '18.0'),
(1115, 11, 91, '15.0', '16.0', '20.0', '21.0'),
(1116, 8, 91, '14.0', '15.0', '17.0', '18.0'),
(1117, 6, 91, '19.0', '20.0', '22.0', '23.0'),
(1118, 5, 91, '17.0', '18.0', '20.0', '21.0'),
(1119, 4, 91, '22.0', '23.0', '25.0', '26.0'),
(1120, 22, 91, NULL, NULL, NULL, '25.0'),
(1121, 2, 91, '13.0', '14.0', '16.0', '17.0'),
(1122, 21, 91, '13.0', '14.0', '17.0', '18.0'),
(1177, 18, 95, '17.0', '18.0', '20.0', '21.0'),
(1178, 17, 95, '17.0', '18.0', '20.0', '21.0'),
(1179, 19, 95, '13.0', '14.0', '16.0', '17.0'),
(1180, 16, 95, '13.0', '14.0', '18.0', '19.0'),
(1181, 15, 95, '19.0', '20.0', '22.0', '23.0'),
(1182, 14, 95, '19.0', '20.0', '22.0', '23.0'),
(1183, 13, 95, '12.0', '13.0', '14.0', '15.0'),
(1184, 12, 95, '10.0', '11.0', '15.0', '16.0'),
(1185, 11, 95, '15.0', '16.0', '20.0', '21.0'),
(1186, 10, 95, '12.0', '13.0', '17.0', '18.0'),
(1187, 9, 95, '14.0', '15.0', '22.0', '23.0'),
(1188, 8, 95, '14.0', '15.0', '17.0', '18.0'),
(1189, 6, 95, '19.0', '20.0', '22.0', '23.0'),
(1190, 5, 95, '17.0', '18.0', '20.0', '21.0'),
(1191, 4, 95, '22.0', '23.0', '25.0', '26.0'),
(1192, 22, 95, NULL, NULL, NULL, '25.0'),
(1193, 2, 95, '13.0', '14.0', '16.0', '17.0'),
(1194, 21, 95, '13.0', '14.0', '17.0', '18.0'),
(1195, 38, 91, '14.0', '15.0', '17.0', '18.0'),
(1196, 2, 96, NULL, NULL, NULL, NULL),
(1197, 6, 96, NULL, NULL, NULL, NULL),
(1198, 10, 96, NULL, NULL, NULL, NULL),
(1199, 11, 96, NULL, NULL, NULL, NULL),
(1200, 12, 96, NULL, NULL, NULL, NULL),
(1201, 16, 96, NULL, NULL, NULL, NULL),
(1202, 27, 97, '14.0', '15.0', '17.0', '18.0'),
(1203, 24, 97, '14.0', '15.0', '18.0', '19.0'),
(1204, 32, 97, '6.0', '7.0', '9.0', '10.0'),
(1205, 31, 97, '16.0', '17.0', '19.0', '20.0'),
(1206, 29, 97, '14.0', NULL, NULL, '15.0'),
(1207, 19, 97, '14.0', '15.0', '16.0', '17.0'),
(1208, 28, 97, '20.0', '21.0', '22.0', '23.0'),
(1209, 13, 97, '6.0', '7.0', '9.0', '10.0'),
(1210, 25, 97, '13.0', '14.0', '22.0', '23.0'),
(1211, 11, 97, '15.0', '16.0', '20.0', '21.0'),
(1212, 10, 97, '12.0', '13.0', '17.0', '18.0'),
(1213, 2, 97, '16.0', NULL, NULL, '17.0'),
(1214, 2, 98, '13.0', '14.0', '16.0', '17.0'),
(1215, 11, 98, '15.0', '16.0', '20.0', '21.0'),
(1216, 12, 98, '10.0', '11.0', '15.0', '16.0'),
(1217, 16, 98, '13.0', '14.0', '18.0', '19.0'),
(1218, 2, 99, '13.0', '14.0', '16.0', '17.0'),
(1219, 11, 99, '15.0', '16.0', '20.0', '21.0'),
(1220, 12, 99, '10.0', '11.0', '15.0', '16.0'),
(1221, 16, 99, '13.0', '14.0', '18.0', '19.0'),
(1222, 2, 100, '13.0', '14.0', '16.0', '17.0'),
(1223, 11, 100, '15.0', '16.0', '20.0', '21.0'),
(1224, 12, 100, '10.0', '11.0', '15.0', '16.0'),
(1225, 16, 100, '13.0', '14.0', '18.0', '19.0'),
(1226, 2, 101, '13.0', '14.0', '16.0', '17.0'),
(1227, 11, 101, '15.0', '16.0', '20.0', '21.0'),
(1228, 12, 101, '10.0', '11.0', '15.0', '16.0'),
(1229, 16, 101, '13.0', '14.0', '18.0', '19.0'),
(1230, 29, 36, NULL, NULL, NULL, '24.0'),
(1231, 29, 102, NULL, NULL, NULL, '24.0'),
(1232, 6, 102, NULL, NULL, NULL, '24.0'),
(1233, 25, 102, '15.0', '16.0', '20.0', '21.0'),
(1234, 26, 102, '15.0', '16.0', '18.0', '19.0'),
(1235, 10, 102, '17.0', '18.0', '20.0', '21.0'),
(1236, 27, 102, NULL, NULL, NULL, '17.0'),
(1237, 24, 102, '18.0', '19.0', '22.0', '23.0'),
(1238, 27, 103, NULL, NULL, NULL, '17.0'),
(1239, 24, 103, '18.0', '19.0', '22.0', '23.0'),
(1240, 29, 103, NULL, NULL, NULL, '24.0'),
(1241, 25, 103, '15.0', '16.0', '20.0', '21.0'),
(1242, 26, 103, '15.0', '16.0', '18.0', '19.0'),
(1243, 10, 103, '17.0', '18.0', '20.0', '21.0'),
(1244, 6, 103, NULL, NULL, NULL, '24.0'),
(1266, 27, 107, NULL, NULL, NULL, '17.0'),
(1267, 24, 107, '18.0', '19.0', '22.0', '23.0'),
(1268, 29, 107, NULL, NULL, NULL, '24.0'),
(1269, 25, 107, '15.0', '16.0', '20.0', '21.0'),
(1270, 26, 107, '15.0', '16.0', '18.0', '19.0'),
(1271, 10, 107, '17.0', '18.0', '20.0', '21.0'),
(1272, 6, 107, NULL, NULL, NULL, '24.0'),
(1273, 27, 108, NULL, NULL, NULL, '17.0'),
(1274, 24, 108, '18.0', '19.0', '22.0', '23.0'),
(1275, 29, 108, NULL, NULL, NULL, '24.0'),
(1276, 25, 108, '15.0', '16.0', '20.0', '21.0'),
(1277, 26, 108, '15.0', '16.0', '18.0', '19.0'),
(1278, 10, 108, '17.0', '18.0', '20.0', '21.0'),
(1279, 6, 108, NULL, NULL, NULL, '24.0'),
(1280, 22, 32, '18.0', '19.0', '24.0', '25.0'),
(1281, 1, 32, '14.0', '15.0', '16.0', '17.0'),
(1282, 2, 109, '13.0', '14.0', '16.0', '17.0'),
(1283, 10, 109, '12.0', '13.0', '17.0', '18.0'),
(1284, 11, 109, '15.0', '16.0', '20.0', '21.0'),
(1285, 12, 109, '10.0', '11.0', '15.0', '16.0'),
(1286, 6, 109, '13.0', '14.0', '20.0', '21.0'),
(1287, 16, 109, '13.0', '14.0', '18.0', '19.0'),
(1288, 39, 34, '6.0', '7.0', '9.0', '10.0'),
(1289, 3, 33, '13.0', '14.0', '17.0', '18.0'),
(1290, 15, 33, '19.0', '20.0', '22.0', '23.0'),
(1291, 4, 33, '22.0', '23.0', '25.0', '26.0'),
(1292, 25, 110, '13.0', '14.0', '22.0', '23.0'),
(1293, 26, 110, '14.0', '15.0', '20.0', '21.0'),
(1294, 24, 110, '14.0', '15.0', '18.0', '19.0'),
(1295, 12, 110, '10.0', '11.0', '15.0', '16.0'),
(1296, 10, 110, '12.0', '13.0', '17.0', '18.0'),
(1297, 11, 110, '15.0', '16.0', '20.0', '21.0'),
(1298, 13, 110, '12.0', '13.0', '14.0', '15.0'),
(1299, 19, 110, '13.0', '14.0', '16.0', '17.0'),
(1300, 31, 110, '16.0', '17.0', '19.0', '20.0'),
(1301, 28, 110, '16.0', '17.0', '20.0', '21.0'),
(1302, 24, 111, '14.0', '15.0', '18.0', '19.0'),
(1303, 27, 111, NULL, NULL, NULL, '15.0'),
(1304, 31, 111, '16.0', '17.0', '19.0', '20.0'),
(1305, 19, 111, '14.0', '15.0', '16.0', '17.0'),
(1306, 28, 111, NULL, NULL, NULL, '20.0'),
(1307, 11, 111, '15.0', '16.0', '20.0', '21.0'),
(1308, 10, 111, '12.0', '13.0', '17.0', '18.0'),
(1309, 36, 111, '19.0', NULL, NULL, '25.0'),
(1310, 29, 111, '28.0', NULL, NULL, '29.0'),
(1311, 26, 111, '14.0', '15.0', '20.0', '21.0'),
(1312, 12, 111, '10.0', '11.0', '15.0', '16.0'),
(1313, 13, 111, '12.0', '13.0', '14.0', '15.0');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adhoc_configs`
--
ALTER TABLE `adhoc_configs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `analytic_specimen_rejections`
--
ALTER TABLE `analytic_specimen_rejections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `analytic_specimen_rejections_rejected_by_index` (`rejected_by`),
  ADD KEY `analytic_specimen_rejections_test_id_foreign` (`test_id`),
  ADD KEY `analytic_specimen_rejections_specimen_id_foreign` (`specimen_id`),
  ADD KEY `analytic_specimen_rejections_rejection_reason_id_foreign` (`rejection_reason_id`);

--
-- Indexes for table `analytic_specimen_rejection_reasons`
--
ALTER TABLE `analytic_specimen_rejection_reasons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `analytic_specimen_rejection_reasons_specimen_id_foreign` (`specimen_id`),
  ADD KEY `analytic_specimen_rejection_reasons_rejection_id_foreign` (`rejection_id`),
  ADD KEY `analytic_specimen_rejection_reasons_reason_id_foreign` (`reason_id`);

--
-- Indexes for table `assigned_roles`
--
ALTER TABLE `assigned_roles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assigned_roles_user_id_foreign` (`user_id`),
  ADD KEY `assigned_roles_role_id_foreign` (`role_id`);

--
-- Indexes for table `barcode_settings`
--
ALTER TABLE `barcode_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `commodities`
--
ALTER TABLE `commodities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `commodities_metric_id_foreign` (`metric_id`);

--
-- Indexes for table `controls`
--
ALTER TABLE `controls`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `controls_name_unique` (`name`),
  ADD KEY `controls_lot_id_foreign` (`lot_id`);

--
-- Indexes for table `control_measures`
--
ALTER TABLE `control_measures`
  ADD PRIMARY KEY (`id`),
  ADD KEY `control_measures_control_measure_type_id_foreign` (`control_measure_type_id`),
  ADD KEY `control_measures_control_id_foreign` (`control_id`);

--
-- Indexes for table `control_measure_ranges`
--
ALTER TABLE `control_measure_ranges`
  ADD PRIMARY KEY (`id`),
  ADD KEY `control_measure_ranges_control_measure_id_foreign` (`control_measure_id`);

--
-- Indexes for table `control_results`
--
ALTER TABLE `control_results`
  ADD PRIMARY KEY (`id`),
  ADD KEY `control_results_control_test_id_foreign` (`control_test_id`),
  ADD KEY `control_results_control_measure_id_foreign` (`control_measure_id`);

--
-- Indexes for table `control_tests`
--
ALTER TABLE `control_tests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `control_tests_control_id_foreign` (`control_id`),
  ADD KEY `control_tests_entered_by_foreign` (`entered_by`);

--
-- Indexes for table `culture_durations`
--
ALTER TABLE `culture_durations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `culture_observations`
--
ALTER TABLE `culture_observations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `culture_observations_user_id_foreign` (`user_id`),
  ADD KEY `culture_observations_test_id_foreign` (`test_id`);

--
-- Indexes for table `daily_alphanumeric_counts`
--
ALTER TABLE `daily_alphanumeric_counts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `daily_alphanumeric_counts_daily_test_type_count_id_foreign` (`daily_test_type_count_id`),
  ADD KEY `daily_alphanumeric_counts_measure_id_foreign` (`measure_id`),
  ADD KEY `daily_alphanumeric_counts_measure_range_id_foreign` (`measure_range_id`),
  ADD KEY `daily_alphanumeric_counts_result_interpretation_id_foreign` (`result_interpretation_id`);

--
-- Indexes for table `daily_gram_stain_result_counts`
--
ALTER TABLE `daily_gram_stain_result_counts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `daily_gram_stain_result_counts_daily_test_type_count_id_foreign` (`daily_test_type_count_id`);

--
-- Indexes for table `daily_hiv_counts`
--
ALTER TABLE `daily_hiv_counts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `daily_hiv_counts_daily_test_type_count_id_foreign` (`daily_test_type_count_id`);

--
-- Indexes for table `daily_negative_cultures`
--
ALTER TABLE `daily_negative_cultures`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `daily_negative_gram_stains`
--
ALTER TABLE `daily_negative_gram_stains`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `daily_numeric_range_counts`
--
ALTER TABLE `daily_numeric_range_counts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `daily_numeric_range_counts_daily_test_type_count_id_foreign` (`daily_test_type_count_id`),
  ADD KEY `daily_numeric_range_counts_measure_id_foreign` (`measure_id`),
  ADD KEY `daily_numeric_range_counts_result_interpretation_id_foreign` (`result_interpretation_id`);

--
-- Indexes for table `daily_organism_counts`
--
ALTER TABLE `daily_organism_counts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `daily_organism_counts_organism_id_foreign` (`organism_id`),
  ADD KEY `daily_organism_counts_result_interpretation_id_foreign` (`result_interpretation_id`);

--
-- Indexes for table `daily_rejection_reason_counts`
--
ALTER TABLE `daily_rejection_reason_counts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `daily_rejection_reason_counts_daily_specimen_count_id_foreign` (`daily_specimen_count_id`),
  ADD KEY `daily_rejection_reason_counts_reason_id_foreign` (`reason_id`);

--
-- Indexes for table `daily_specimen_counts`
--
ALTER TABLE `daily_specimen_counts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `daily_specimen_counts_date_unique` (`date`);

--
-- Indexes for table `daily_specimen_type_counts`
--
ALTER TABLE `daily_specimen_type_counts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `daily_specimen_type_counts_daily_specimen_count_id_foreign` (`daily_specimen_count_id`),
  ADD KEY `daily_specimen_type_counts_specimen_type_id_foreign` (`specimen_type_id`);

--
-- Indexes for table `daily_susceptibility_counts`
--
ALTER TABLE `daily_susceptibility_counts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `daily_susceptibility_counts_daily_organism_count_id_foreign` (`daily_organism_count_id`),
  ADD KEY `daily_susceptibility_counts_antibiotic_id_foreign` (`antibiotic_id`),
  ADD KEY `daily_susceptibility_counts_interpretation_id_foreign` (`interpretation_id`);

--
-- Indexes for table `daily_test_counts`
--
ALTER TABLE `daily_test_counts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `daily_test_counts_date_unique` (`date`);

--
-- Indexes for table `daily_test_type_counts`
--
ALTER TABLE `daily_test_type_counts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `daily_test_type_counts_test_type_id_foreign` (`test_type_id`),
  ADD KEY `daily_test_type_counts_daily_test_count_id_foreign` (`daily_test_count_id`);

--
-- Indexes for table `daily_turn_around_time`
--
ALTER TABLE `daily_turn_around_time`
  ADD PRIMARY KEY (`id`),
  ADD KEY `daily_turn_around_time_daily_test_type_count_id_foreign` (`daily_test_type_count_id`);

--
-- Indexes for table `diseases`
--
ALTER TABLE `diseases`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `district`
--
ALTER TABLE `district`
  ADD PRIMARY KEY (`id`),
  ADD KEY `regionIDIndex` (`regionid`);

--
-- Indexes for table `drugs`
--
ALTER TABLE `drugs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `drugs_name_unique` (`name`);

--
-- Indexes for table `drug_susceptibility`
--
ALTER TABLE `drug_susceptibility`
  ADD PRIMARY KEY (`id`),
  ADD KEY `drug_susceptibility_user_id_foreign` (`user_id`),
  ADD KEY `drug_susceptibility_drug_id_foreign` (`drug_id`),
  ADD KEY `drug_susceptibility_isolated_organism_id_foreign` (`isolated_organism_id`),
  ADD KEY `drug_susceptibility_drug_susceptibility_measure_id_foreign` (`drug_susceptibility_measure_id`);

--
-- Indexes for table `drug_susceptibility_measures`
--
ALTER TABLE `drug_susceptibility_measures`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `equip_config`
--
ALTER TABLE `equip_config`
  ADD PRIMARY KEY (`id`),
  ADD KEY `equip_config_equip_id_foreign` (`equip_id`),
  ADD KEY `equip_config_prop_id_foreign` (`prop_id`);

--
-- Indexes for table `external_dump`
--
ALTER TABLE `external_dump`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `external_dump_lab_no_unique` (`lab_no`),
  ADD KEY `external_dump_parent_lab_no_index` (`parent_lab_no`);

--
-- Indexes for table `external_users`
--
ALTER TABLE `external_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `external_users_internal_user_id_unique` (`internal_user_id`);

--
-- Indexes for table `facilities`
--
ALTER TABLE `facilities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `facility`
--
ALTER TABLE `facility`
  ADD PRIMARY KEY (`id`),
  ADD KEY `districtIDIndex` (`districtid`),
  ADD KEY `hubIDIndex` (`hubid`),
  ADD KEY `facilityLevelIDIndex` (`facilitylevelid`),
  ADD KEY `uniqueIndex` (`name`,`districtid`);

--
-- Indexes for table `facilitylevel`
--
ALTER TABLE `facilitylevel`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uniqueIndex` (`level`);

--
-- Indexes for table `gram_break_points`
--
ALTER TABLE `gram_break_points`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gram_break_points_drug_id_foreign` (`drug_id`),
  ADD KEY `gram_break_points_gram_stain_range_id_foreign` (`gram_stain_range_id`);

--
-- Indexes for table `gram_drug_susceptibility`
--
ALTER TABLE `gram_drug_susceptibility`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gram_drug_susceptibility_user_id_foreign` (`user_id`),
  ADD KEY `gram_drug_susceptibility_drug_id_foreign` (`drug_id`),
  ADD KEY `gram_drug_susceptibility_gram_stain_result_id_foreign` (`gram_stain_result_id`),
  ADD KEY `gram_drug_susceptibility_drug_susceptibility_measure_id_foreign` (`drug_susceptibility_measure_id`);

--
-- Indexes for table `gram_stain_ranges`
--
ALTER TABLE `gram_stain_ranges`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gram_stain_results`
--
ALTER TABLE `gram_stain_results`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gram_stain_results_user_id_foreign` (`user_id`),
  ADD KEY `gram_stain_results_test_id_foreign` (`test_id`),
  ADD KEY `gram_stain_results_gram_stain_range_id_foreign` (`gram_stain_range_id`);

--
-- Indexes for table `hb_patient`
--
ALTER TABLE `hb_patient`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hb_patientworksheet`
--
ALTER TABLE `hb_patientworksheet`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hb_worksheet`
--
ALTER TABLE `hb_worksheet`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hub`
--
ALTER TABLE `hub`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uniqueIndex` (`name`,`email`),
  ADD KEY `emailIndex` (`email`);

--
-- Indexes for table `ii_quickcodes`
--
ALTER TABLE `ii_quickcodes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `instruments`
--
ALTER TABLE `instruments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `instrument_testtypes`
--
ALTER TABLE `instrument_testtypes`
  ADD UNIQUE KEY `instrument_testtypes_instrument_id_test_type_id_unique` (`instrument_id`,`test_type_id`),
  ADD KEY `instrument_testtypes_test_type_id_foreign` (`test_type_id`);

--
-- Indexes for table `interfaced_equipment`
--
ALTER TABLE `interfaced_equipment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `interfaced_equipment_lab_section_foreign` (`lab_section`);

--
-- Indexes for table `isolated_organisms`
--
ALTER TABLE `isolated_organisms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `isolated_organisms_user_id_foreign` (`user_id`),
  ADD KEY `isolated_organisms_test_id_foreign` (`test_id`),
  ADD KEY `isolated_organisms_organism_id_foreign` (`organism_id`);

--
-- Indexes for table `issues`
--
ALTER TABLE `issues`
  ADD PRIMARY KEY (`id`),
  ADD KEY `issues_topup_request_id_foreign` (`topup_request_id`),
  ADD KEY `issues_receipt_id_foreign` (`receipt_id`),
  ADD KEY `issues_issued_to_foreign` (`issued_to`),
  ADD KEY `issues_user_id_foreign` (`user_id`);

--
-- Indexes for table `lookuptype`
--
ALTER TABLE `lookuptype`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lookuptypevalue`
--
ALTER TABLE `lookuptypevalue`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lots`
--
ALTER TABLE `lots`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `lots_number_unique` (`number`),
  ADD KEY `lots_instrument_id_foreign` (`instrument_id`);

--
-- Indexes for table `measures`
--
ALTER TABLE `measures`
  ADD PRIMARY KEY (`id`),
  ADD KEY `measures_measure_type_id_foreign` (`measure_type_id`);

--
-- Indexes for table `measure_name_mappings`
--
ALTER TABLE `measure_name_mappings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `measure_name_mappings_system_name_unique` (`system_name`);

--
-- Indexes for table `measure_ranges`
--
ALTER TABLE `measure_ranges`
  ADD PRIMARY KEY (`id`),
  ADD KEY `measure_ranges_alphanumeric_index` (`alphanumeric`),
  ADD KEY `measure_ranges_measure_id_foreign` (`measure_id`);

--
-- Indexes for table `measure_types`
--
ALTER TABLE `measure_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `measure_types_name_unique` (`name`);

--
-- Indexes for table `metrics`
--
ALTER TABLE `metrics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `organisms`
--
ALTER TABLE `organisms`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `organisms_name_unique` (`name`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_unique` (`name`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permission_role_permission_id_foreign` (`permission_id`),
  ADD KEY `permission_role_role_id_foreign` (`role_id`);

--
-- Indexes for table `pre_analytic_specimen_rejections`
--
ALTER TABLE `pre_analytic_specimen_rejections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pre_analytic_specimen_rejections_rejected_by_index` (`rejected_by`),
  ADD KEY `pre_analytic_specimen_rejections_specimen_id_foreign` (`specimen_id`),
  ADD KEY `pre_analytic_specimen_rejections_rejection_reason_id_foreign` (`rejection_reason_id`);

--
-- Indexes for table `receipts`
--
ALTER TABLE `receipts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `receipts_commodity_id_foreign` (`commodity_id`),
  ADD KEY `receipts_supplier_id_foreign` (`supplier_id`),
  ADD KEY `receipts_user_id_foreign` (`user_id`);

--
-- Indexes for table `referrals`
--
ALTER TABLE `referrals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `referrals_user_id_foreign` (`user_id`),
  ADD KEY `referrals_facility_id_foreign` (`facility_id`);

--
-- Indexes for table `referral_reasons`
--
ALTER TABLE `referral_reasons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rejection_reasons`
--
ALTER TABLE `rejection_reasons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `report_diseases`
--
ALTER TABLE `report_diseases`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `report_diseases_test_type_id_disease_id_unique` (`test_type_id`,`disease_id`),
  ADD KEY `report_diseases_disease_id_foreign` (`disease_id`);

--
-- Indexes for table `result_interpretations`
--
ALTER TABLE `result_interpretations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indexes for table `specimens`
--
ALTER TABLE `specimens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `specimens_accepted_by_index` (`accepted_by`),
  ADD KEY `specimens_specimen_type_id_foreign` (`specimen_type_id`),
  ADD KEY `specimens_specimen_status_id_foreign` (`specimen_status_id`),
  ADD KEY `specimens_referral_id_foreign` (`referral_id`);

--
-- Indexes for table `specimen_statuses`
--
ALTER TABLE `specimen_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `specimen_types`
--
ALTER TABLE `specimen_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `testtype_measures`
--
ALTER TABLE `testtype_measures`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `testtype_measures_test_type_id_measure_id_unique` (`test_type_id`,`measure_id`),
  ADD KEY `testtype_measures_measure_id_foreign` (`measure_id`);

--
-- Indexes for table `testtype_specimentypes`
--
ALTER TABLE `testtype_specimentypes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `testtype_specimentypes_test_type_id_specimen_type_id_unique` (`test_type_id`,`specimen_type_id`),
  ADD KEY `testtype_specimentypes_specimen_type_id_foreign` (`specimen_type_id`);

--
-- Indexes for table `test_categories`
--
ALTER TABLE `test_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `test_categories_name_unique` (`name`);

--
-- Indexes for table `test_name_mappings`
--
ALTER TABLE `test_name_mappings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `test_name_mappings_system_name_unique` (`system_name`);

--
-- Indexes for table `test_phases`
--
ALTER TABLE `test_phases`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `test_statuses`
--
ALTER TABLE `test_statuses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `test_statuses_test_phase_id_foreign` (`test_phase_id`);

--
-- Indexes for table `test_types`
--
ALTER TABLE `test_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `test_types_test_category_id_foreign` (`test_category_id`);

--
-- Indexes for table `therapy`
--
ALTER TABLE `therapy`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tokens`
--
ALTER TABLE `tokens`
  ADD KEY `tokens_email_index` (`email`),
  ADD KEY `tokens_token_index` (`token`);

--
-- Indexes for table `topup_requests`
--
ALTER TABLE `topup_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `topup_requests_test_category_id_foreign` (`test_category_id`),
  ADD KEY `topup_requests_commodity_id_foreign` (`commodity_id`),
  ADD KEY `topup_requests_user_id_foreign` (`user_id`);

--
-- Indexes for table `unhls_bbactions`
--
ALTER TABLE `unhls_bbactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `unhls_bbcauses`
--
ALTER TABLE `unhls_bbcauses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `unhls_bbincidences`
--
ALTER TABLE `unhls_bbincidences`
  ADD PRIMARY KEY (`id`),
  ADD KEY `unhls_bbincidences_facility_id_foreign` (`facility_id`),
  ADD KEY `unhls_bbincidences_createdby_foreign` (`createdby`);

--
-- Indexes for table `unhls_bbincidences_action`
--
ALTER TABLE `unhls_bbincidences_action`
  ADD PRIMARY KEY (`id`),
  ADD KEY `unhls_bbincidences_action_bbincidence_id_foreign` (`bbincidence_id`),
  ADD KEY `unhls_bbincidences_action_action_id_foreign` (`action_id`);

--
-- Indexes for table `unhls_bbincidences_cause`
--
ALTER TABLE `unhls_bbincidences_cause`
  ADD PRIMARY KEY (`id`),
  ADD KEY `unhls_bbincidences_cause_bbincidence_id_foreign` (`bbincidence_id`),
  ADD KEY `unhls_bbincidences_cause_cause_id_foreign` (`cause_id`);

--
-- Indexes for table `unhls_bbincidences_nature`
--
ALTER TABLE `unhls_bbincidences_nature`
  ADD PRIMARY KEY (`id`),
  ADD KEY `unhls_bbincidences_nature_bbincidence_id_foreign` (`bbincidence_id`),
  ADD KEY `unhls_bbincidences_nature_nature_id_foreign` (`nature_id`);

--
-- Indexes for table `unhls_bbnatures`
--
ALTER TABLE `unhls_bbnatures`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `unhls_districts`
--
ALTER TABLE `unhls_districts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `unhls_drugs`
--
ALTER TABLE `unhls_drugs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `unhls_equipment_breakdown`
--
ALTER TABLE `unhls_equipment_breakdown`
  ADD PRIMARY KEY (`id`),
  ADD KEY `unhls_equipment_breakdown_district_id_foreign` (`district_id`),
  ADD KEY `unhls_equipment_breakdown_facility_id_foreign` (`facility_id`),
  ADD KEY `unhls_equipment_breakdown_year_id_foreign` (`year_id`),
  ADD KEY `unhls_equipment_breakdown_equipment_id_foreign` (`equipment_id`);

--
-- Indexes for table `unhls_equipment_inventory`
--
ALTER TABLE `unhls_equipment_inventory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `unhls_equipment_inventory_district_id_foreign` (`district_id`),
  ADD KEY `unhls_equipment_inventory_facility_id_foreign` (`facility_id`),
  ADD KEY `unhls_equipment_inventory_year_id_foreign` (`year_id`),
  ADD KEY `unhls_equipment_inventory_supplier_id_foreign` (`supplier_id`);

--
-- Indexes for table `unhls_equipment_maintenance`
--
ALTER TABLE `unhls_equipment_maintenance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `unhls_equipment_maintenance_district_id_foreign` (`district_id`),
  ADD KEY `unhls_equipment_maintenance_facility_id_foreign` (`facility_id`),
  ADD KEY `unhls_equipment_maintenance_year_id_foreign` (`year_id`),
  ADD KEY `unhls_equipment_maintenance_equipment_id_foreign` (`equipment_id`);

--
-- Indexes for table `unhls_equipment_suppliers`
--
ALTER TABLE `unhls_equipment_suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `unhls_facilities`
--
ALTER TABLE `unhls_facilities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `unhls_facilities_level_id_foreign` (`level_id`),
  ADD KEY `unhls_facilities_district_id_foreign` (`district_id`),
  ADD KEY `unhls_facilities_ownership_id_foreign` (`ownership_id`);

--
-- Indexes for table `unhls_facility_level`
--
ALTER TABLE `unhls_facility_level`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `unhls_facility_ownership`
--
ALTER TABLE `unhls_facility_ownership`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `unhls_financial_years`
--
ALTER TABLE `unhls_financial_years`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `unhls_patients`
--
ALTER TABLE `unhls_patients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `unhls_patients_external_patient_number_index` (`external_patient_number`),
  ADD KEY `unhls_patients_created_by_index` (`created_by`);

--
-- Indexes for table `unhls_rejection_reasons`
--
ALTER TABLE `unhls_rejection_reasons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `unhls_staff`
--
ALTER TABLE `unhls_staff`
  ADD PRIMARY KEY (`id`),
  ADD KEY `unhls_staff_facility_id_foreign` (`facility_id`);

--
-- Indexes for table `unhls_stockcard`
--
ALTER TABLE `unhls_stockcard`
  ADD PRIMARY KEY (`id`),
  ADD KEY `unhls_stockcard_district_id_foreign` (`district_id`),
  ADD KEY `unhls_stockcard_facility_id_foreign` (`facility_id`),
  ADD KEY `unhls_stockcard_year_id_foreign` (`year_id`),
  ADD KEY `unhls_stockcard_commodity_id_foreign` (`commodity_id`);

--
-- Indexes for table `unhls_stockrequisition`
--
ALTER TABLE `unhls_stockrequisition`
  ADD PRIMARY KEY (`id`),
  ADD KEY `unhls_stockrequisition_district_id_foreign` (`district_id`),
  ADD KEY `unhls_stockrequisition_facility_id_foreign` (`facility_id`),
  ADD KEY `unhls_stockrequisition_year_id_foreign` (`year_id`),
  ADD KEY `unhls_stockrequisition_item_id_foreign` (`item_id`);

--
-- Indexes for table `unhls_tests`
--
ALTER TABLE `unhls_tests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `unhls_tests_created_by_index` (`created_by`),
  ADD KEY `unhls_tests_tested_by_index` (`tested_by`),
  ADD KEY `unhls_tests_verified_by_index` (`verified_by`),
  ADD KEY `unhls_tests_visit_id_foreign` (`visit_id`),
  ADD KEY `unhls_tests_test_type_id_foreign` (`test_type_id`),
  ADD KEY `unhls_tests_specimen_id_foreign` (`specimen_id`),
  ADD KEY `unhls_tests_test_status_id_foreign` (`test_status_id`);

--
-- Indexes for table `unhls_test_results`
--
ALTER TABLE `unhls_test_results`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unhls_test_results_test_id_measure_id_unique` (`test_id`,`measure_id`),
  ADD KEY `unhls_test_results_measure_id_foreign` (`measure_id`);

--
-- Indexes for table `unhls_visits`
--
ALTER TABLE `unhls_visits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `unhls_visits_visit_number_index` (`visit_number`),
  ADD KEY `unhls_visits_patient_id_foreign` (`patient_id`);

--
-- Indexes for table `unhls_warehouse`
--
ALTER TABLE `unhls_warehouse`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD KEY `users_facility_id_foreign` (`facility_id`);

--
-- Indexes for table `uuids`
--
ALTER TABLE `uuids`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `visit_statuses`
--
ALTER TABLE `visit_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wards`
--
ALTER TABLE `wards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zone_diameters`
--
ALTER TABLE `zone_diameters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `zone_diameters_drug_id_foreign` (`drug_id`),
  ADD KEY `zone_diameters_organism_id_foreign` (`organism_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adhoc_configs`
--
ALTER TABLE `adhoc_configs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `analytic_specimen_rejections`
--
ALTER TABLE `analytic_specimen_rejections`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `analytic_specimen_rejection_reasons`
--
ALTER TABLE `analytic_specimen_rejection_reasons`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `assigned_roles`
--
ALTER TABLE `assigned_roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `barcode_settings`
--
ALTER TABLE `barcode_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `commodities`
--
ALTER TABLE `commodities`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `controls`
--
ALTER TABLE `controls`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `control_measures`
--
ALTER TABLE `control_measures`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `control_measure_ranges`
--
ALTER TABLE `control_measure_ranges`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `control_results`
--
ALTER TABLE `control_results`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `control_tests`
--
ALTER TABLE `control_tests`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `culture_durations`
--
ALTER TABLE `culture_durations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `culture_observations`
--
ALTER TABLE `culture_observations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `daily_alphanumeric_counts`
--
ALTER TABLE `daily_alphanumeric_counts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `daily_gram_stain_result_counts`
--
ALTER TABLE `daily_gram_stain_result_counts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `daily_hiv_counts`
--
ALTER TABLE `daily_hiv_counts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `daily_negative_cultures`
--
ALTER TABLE `daily_negative_cultures`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `daily_negative_gram_stains`
--
ALTER TABLE `daily_negative_gram_stains`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `daily_numeric_range_counts`
--
ALTER TABLE `daily_numeric_range_counts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `daily_organism_counts`
--
ALTER TABLE `daily_organism_counts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `daily_rejection_reason_counts`
--
ALTER TABLE `daily_rejection_reason_counts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `daily_specimen_counts`
--
ALTER TABLE `daily_specimen_counts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `daily_specimen_type_counts`
--
ALTER TABLE `daily_specimen_type_counts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `daily_susceptibility_counts`
--
ALTER TABLE `daily_susceptibility_counts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `daily_test_counts`
--
ALTER TABLE `daily_test_counts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `daily_test_type_counts`
--
ALTER TABLE `daily_test_type_counts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `daily_turn_around_time`
--
ALTER TABLE `daily_turn_around_time`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `diseases`
--
ALTER TABLE `diseases`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `district`
--
ALTER TABLE `district`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;
--
-- AUTO_INCREMENT for table `drugs`
--
ALTER TABLE `drugs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;
--
-- AUTO_INCREMENT for table `drug_susceptibility`
--
ALTER TABLE `drug_susceptibility`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `drug_susceptibility_measures`
--
ALTER TABLE `drug_susceptibility_measures`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `equip_config`
--
ALTER TABLE `equip_config`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `external_dump`
--
ALTER TABLE `external_dump`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `external_users`
--
ALTER TABLE `external_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `facilities`
--
ALTER TABLE `facilities`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `facility`
--
ALTER TABLE `facility`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2494;
--
-- AUTO_INCREMENT for table `facilitylevel`
--
ALTER TABLE `facilitylevel`
  MODIFY `id` smallint(2) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `gram_break_points`
--
ALTER TABLE `gram_break_points`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `gram_drug_susceptibility`
--
ALTER TABLE `gram_drug_susceptibility`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `gram_stain_ranges`
--
ALTER TABLE `gram_stain_ranges`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;
--
-- AUTO_INCREMENT for table `gram_stain_results`
--
ALTER TABLE `gram_stain_results`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `hb_patient`
--
ALTER TABLE `hb_patient`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `hb_patientworksheet`
--
ALTER TABLE `hb_patientworksheet`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
--
-- AUTO_INCREMENT for table `hb_worksheet`
--
ALTER TABLE `hb_worksheet`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `hub`
--
ALTER TABLE `hub`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=123;
--
-- AUTO_INCREMENT for table `ii_quickcodes`
--
ALTER TABLE `ii_quickcodes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `instruments`
--
ALTER TABLE `instruments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `interfaced_equipment`
--
ALTER TABLE `interfaced_equipment`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `isolated_organisms`
--
ALTER TABLE `isolated_organisms`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `issues`
--
ALTER TABLE `issues`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `lookuptype`
--
ALTER TABLE `lookuptype`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `lookuptypevalue`
--
ALTER TABLE `lookuptypevalue`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;
--
-- AUTO_INCREMENT for table `lots`
--
ALTER TABLE `lots`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `measures`
--
ALTER TABLE `measures`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;
--
-- AUTO_INCREMENT for table `measure_name_mappings`
--
ALTER TABLE `measure_name_mappings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;
--
-- AUTO_INCREMENT for table `measure_ranges`
--
ALTER TABLE `measure_ranges`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=230;
--
-- AUTO_INCREMENT for table `metrics`
--
ALTER TABLE `metrics`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `organisms`
--
ALTER TABLE `organisms`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;
--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `permission_role`
--
ALTER TABLE `permission_role`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;
--
-- AUTO_INCREMENT for table `pre_analytic_specimen_rejections`
--
ALTER TABLE `pre_analytic_specimen_rejections`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `receipts`
--
ALTER TABLE `receipts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `referrals`
--
ALTER TABLE `referrals`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `referral_reasons`
--
ALTER TABLE `referral_reasons`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `rejection_reasons`
--
ALTER TABLE `rejection_reasons`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `report_diseases`
--
ALTER TABLE `report_diseases`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `result_interpretations`
--
ALTER TABLE `result_interpretations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `specimens`
--
ALTER TABLE `specimens`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `specimen_types`
--
ALTER TABLE `specimen_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `testtype_measures`
--
ALTER TABLE `testtype_measures`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;
--
-- AUTO_INCREMENT for table `testtype_specimentypes`
--
ALTER TABLE `testtype_specimentypes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;
--
-- AUTO_INCREMENT for table `test_categories`
--
ALTER TABLE `test_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `test_name_mappings`
--
ALTER TABLE `test_name_mappings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
--
-- AUTO_INCREMENT for table `test_types`
--
ALTER TABLE `test_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;
--
-- AUTO_INCREMENT for table `therapy`
--
ALTER TABLE `therapy`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `topup_requests`
--
ALTER TABLE `topup_requests`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `unhls_bbactions`
--
ALTER TABLE `unhls_bbactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `unhls_bbcauses`
--
ALTER TABLE `unhls_bbcauses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `unhls_bbincidences`
--
ALTER TABLE `unhls_bbincidences`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `unhls_bbincidences_action`
--
ALTER TABLE `unhls_bbincidences_action`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `unhls_bbincidences_cause`
--
ALTER TABLE `unhls_bbincidences_cause`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `unhls_bbincidences_nature`
--
ALTER TABLE `unhls_bbincidences_nature`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `unhls_bbnatures`
--
ALTER TABLE `unhls_bbnatures`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
--
-- AUTO_INCREMENT for table `unhls_districts`
--
ALTER TABLE `unhls_districts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=118;
--
-- AUTO_INCREMENT for table `unhls_drugs`
--
ALTER TABLE `unhls_drugs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `unhls_equipment_breakdown`
--
ALTER TABLE `unhls_equipment_breakdown`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `unhls_equipment_inventory`
--
ALTER TABLE `unhls_equipment_inventory`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `unhls_equipment_maintenance`
--
ALTER TABLE `unhls_equipment_maintenance`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `unhls_equipment_suppliers`
--
ALTER TABLE `unhls_equipment_suppliers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `unhls_facilities`
--
ALTER TABLE `unhls_facilities`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `unhls_facility_level`
--
ALTER TABLE `unhls_facility_level`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `unhls_facility_ownership`
--
ALTER TABLE `unhls_facility_ownership`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `unhls_financial_years`
--
ALTER TABLE `unhls_financial_years`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `unhls_patients`
--
ALTER TABLE `unhls_patients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `unhls_rejection_reasons`
--
ALTER TABLE `unhls_rejection_reasons`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `unhls_staff`
--
ALTER TABLE `unhls_staff`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `unhls_stockcard`
--
ALTER TABLE `unhls_stockcard`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `unhls_stockrequisition`
--
ALTER TABLE `unhls_stockrequisition`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `unhls_tests`
--
ALTER TABLE `unhls_tests`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `unhls_test_results`
--
ALTER TABLE `unhls_test_results`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `unhls_visits`
--
ALTER TABLE `unhls_visits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `unhls_warehouse`
--
ALTER TABLE `unhls_warehouse`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `uuids`
--
ALTER TABLE `uuids`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `visit_statuses`
--
ALTER TABLE `visit_statuses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `wards`
--
ALTER TABLE `wards`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `zone_diameters`
--
ALTER TABLE `zone_diameters`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1314;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

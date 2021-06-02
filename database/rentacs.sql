-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : mer. 02 juin 2021 à 10:28
-- Version du serveur :  10.3.29-MariaDB-cll-lve
-- Version de PHP : 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `rentacst_ren143`
--

-- --------------------------------------------------------

--
-- Structure de la table `agency_profiles`
--

CREATE TABLE `agency_profiles` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `company_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_address` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `cac_rc_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_phone_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_contact_person_email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_contact_person_phone_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_contact_person_address` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `airlines`
--

CREATE TABLE `airlines` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icao_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `airports`
--

CREATE TABLE `airports` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `amenities`
--

CREATE TABLE `amenities` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `amenities`
--

INSERT INTO `amenities` (`id`, `name`, `icon`, `created_at`, `updated_at`) VALUES
(6, 'Free wifi', '602a4d4ec9bdf_1613385038.png', '2019-11-02 16:02:01', '2021-02-15 10:30:38'),
(7, 'Reservations', '602a4d609a901_1613385056.png', '2019-11-04 14:37:01', '2021-02-15 10:30:56'),
(8, 'Credit cards', '602a4dadcfddd_1613385133.png', '2019-11-04 14:37:19', '2021-02-15 10:32:13'),
(9, 'Non smoking', '602a4dc24fb12_1613385154.png', '2019-11-04 14:40:22', '2021-02-15 10:32:34'),
(22, NULL, '60b640f23021c_1622556914.png', '2021-06-01 14:15:14', '2021-06-01 14:15:14');

-- --------------------------------------------------------

--
-- Structure de la table `amenities_translations`
--

CREATE TABLE `amenities_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `amenities_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `amenities_translations`
--

INSERT INTO `amenities_translations` (`id`, `amenities_id`, `locale`, `name`) VALUES
(1, 6, 'en', 'Free wifi'),
(2, 7, 'en', 'Reservations'),
(3, 8, 'en', 'Credit cards'),
(4, 9, 'en', 'Non smoking'),
(13, 8, 'fr', 'Cartes bancaires'),
(14, 9, 'fr', 'Non-fumeur'),
(15, 6, 'fr', 'Wifi Gratuit'),
(16, 7, 'fr', 'Reservations'),
(33, 22, 'en', NULL),
(34, 22, 'fr', 'Climatisation');

-- --------------------------------------------------------

--
-- Structure de la table `attractions`
--

CREATE TABLE `attractions` (
  `id` int(10) UNSIGNED NOT NULL,
  `package_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `information` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `attractions`
--

INSERT INTO `attractions` (`id`, `package_id`, `name`, `city`, `address`, `date`, `information`, `created_at`, `updated_at`) VALUES
(1, 1, 'ok', 'ok', 'ok', '11/11/11', 'jhfd', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `banks`
--

CREATE TABLE `banks` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `banks`
--

INSERT INTO `banks` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'CIH', '2021-01-28 09:16:30', '2021-01-28 09:16:30'),
(2, 'AttijariwafaBank', '2021-01-28 09:16:30', '2021-01-28 09:16:30'),
(3, 'BMCE', '2021-01-28 09:16:30', '2021-01-28 09:16:30'),
(4, 'BMCI', '2021-01-28 09:16:30', '2021-01-28 09:16:30'),
(5, 'SGMB', '2021-01-28 09:16:30', '2021-01-28 09:16:30');

-- --------------------------------------------------------

--
-- Structure de la table `bank_details`
--

CREATE TABLE `bank_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `account_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_branch` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ifsc_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pan` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `bank_details`
--

INSERT INTO `bank_details` (`id`, `account_name`, `account_number`, `bank_id`, `bank_branch`, `ifsc_code`, `pan`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Rentacs Tours', '300290190', '4', 'Ikeja', '44903', '44904533', 1, '2021-01-28 09:16:30', '2021-01-28 09:16:30');

-- --------------------------------------------------------

--
-- Structure de la table `bank_payments`
--

CREATE TABLE `bank_payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `reference` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `booking_reference` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` int(11) NOT NULL,
  `bank_detail_id` int(11) NOT NULL,
  `slip_photo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `bookings`
--

CREATE TABLE `bookings` (
  `id` int(11) UNSIGNED NOT NULL,
  `reference` varchar(50) DEFAULT NULL,
  `place_id` int(11) DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `numbber_of_adult` int(11) DEFAULT NULL,
  `numbber_of_children` int(11) DEFAULT NULL,
  `bookable_id` int(10) UNSIGNED DEFAULT NULL,
  `date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `name` varchar(255) DEFAULT '',
  `email` varchar(255) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `message` varchar(500) DEFAULT NULL,
  `bookable_type` varchar(50) DEFAULT NULL,
  `type` int(2) DEFAULT NULL,
  `status` int(2) DEFAULT 2 COMMENT 'status default pending: 2',
  `payment_status` int(2) NOT NULL DEFAULT 0 COMMENT '2',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `bookings`
--

INSERT INTO `bookings` (`id`, `reference`, `place_id`, `user_id`, `numbber_of_adult`, `numbber_of_children`, `bookable_id`, `date`, `end_date`, `name`, `email`, `phone_number`, `message`, `bookable_type`, `type`, `status`, `payment_status`, `created_at`, `updated_at`) VALUES
(21, '2105318974997', NULL, 1, 1, 0, 1, '2021-05-31', '2021-06-03', 'zakaria', 'zakaria@gmail.com', '00000000', NULL, 'App\\Package', 1, 2, 0, '2021-05-31 14:06:57', '2021-05-31 14:06:57'),
(22, '2105318433156', NULL, NULL, 1, 0, 36, '2021-05-31', '2021-05-31', 'zakaria', 'zakaria@gmail.com', '00000', NULL, 'App\\Place', 1, 2, 0, '2021-05-31 15:16:23', '2021-05-31 15:16:23');

-- --------------------------------------------------------

--
-- Structure de la table `cabin_types`
--

CREATE TABLE `cabin_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `cabin_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cabin_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `cabin_types`
--

INSERT INTO `cabin_types` (`id`, `cabin_code`, `cabin_name`, `created_at`, `updated_at`) VALUES
(1, 'Y', 'Economy', '2021-01-28 09:16:31', '2021-01-28 09:16:31'),
(2, 'S', 'Premium Economy', '2021-01-28 09:16:31', '2021-01-28 09:16:31'),
(3, 'C', 'Business', '2021-01-28 09:16:31', '2021-01-28 09:16:31'),
(4, 'J', 'Premium Business', '2021-01-28 09:16:31', '2021-01-28 09:16:31'),
(5, 'F', 'First', '2021-01-28 09:16:31', '2021-01-28 09:16:31'),
(6, 'P', 'Premium First', '2021-01-28 09:16:31', '2021-01-28 09:16:31');

-- --------------------------------------------------------

--
-- Structure de la table `car_bookings`
--

CREATE TABLE `car_bookings` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `priority` int(11) DEFAULT 0,
  `is_feature` int(11) DEFAULT 0,
  `feature_title` varchar(255) DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `icon_map_marker` varchar(255) DEFAULT NULL,
  `color_code` varchar(80) DEFAULT NULL,
  `type` varchar(10) DEFAULT 'place',
  `status` int(11) DEFAULT 1,
  `seo_title` varchar(255) DEFAULT NULL,
  `seo_description` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `priority`, `is_feature`, `feature_title`, `image`, `icon_map_marker`, `color_code`, `type`, `status`, `seo_title`, `seo_description`, `created_at`, `updated_at`) VALUES
(1, NULL, 'bivouacs', 40, 1, NULL, '5ffd6d7dead88_1610444157.png', '5ffd6d7dead88_1610444157.png', '#846fcd', 'offer', 1, NULL, NULL, '2020-12-19 23:27:26', '2021-06-01 16:05:42'),
(11, 'See & Do', 'trekking', 100, 1, 'Must See & Do', '5ffd6efb72501_1610444539.jpg', '5ddba7be9c049_1574676414.svg', '#58cc70', 'offer', 1, NULL, NULL, '2019-10-25 11:11:08', '2021-02-10 12:53:04'),
(12, 'Eat & Drink', 'motorcycle', 20, 1, 'Where to Eat', '5ffd6e5aaa5c7_1610444378.jpg', '5fedbf56327d4_1609416534.png', '#5493f9', 'offer', 1, NULL, NULL, '2019-10-25 11:11:19', '2021-01-12 09:39:38'),
(13, 'Stay', 'golf-tours', 10, 1, 'Place to stay', '5ffd6f30032a6_1610444592.jpg', '5fedc00a907e5_1609416714.png', '#f99a54', 'offer', 1, 'Golf Tours', 'Golf Tours', '2019-10-25 11:11:45', '2021-01-12 09:43:12'),
(21, NULL, 'surf', 40, 1, NULL, '5ffd6d295b1bb_1610444073.png', '5fedbec891fc5_1609416392.png', '#846fcd', 'offer', 1, NULL, NULL, '2020-12-19 23:27:26', '2021-01-12 09:34:33'),
(22, NULL, 'circuits-et-sejours-organises', 10, 1, NULL, NULL, NULL, NULL, 'place', 1, NULL, NULL, '2021-01-25 09:14:19', '2021-02-10 12:53:27'),
(23, NULL, 'astuces-et-conseils', 0, 0, NULL, NULL, NULL, NULL, 'post', 1, 'Astuces et Conseils', 'Astuces et Conseils', '2021-02-12 15:50:24', '2021-02-12 15:50:24'),
(24, NULL, 'golf-tours', 100, 0, NULL, NULL, NULL, NULL, 'place', 1, 'Golf', 'Golf', '2021-06-01 11:30:04', '2021-06-01 11:30:34'),
(26, NULL, 'trekking', 100, 0, NULL, NULL, NULL, NULL, 'place', 1, 'Trekking', 'Trekking', '2021-06-01 12:09:23', '2021-06-01 12:09:23'),
(27, NULL, 'camping', NULL, 0, NULL, NULL, NULL, NULL, 'place', 1, 'Camping', 'Camping', '2021-06-01 14:13:58', '2021-06-01 14:13:58'),
(28, NULL, 'circuit-et-sejour-organise', 0, 0, NULL, '60b6474434ffc_1622558532.png', NULL, NULL, 'offer', 1, NULL, NULL, '2021-06-01 14:24:39', '2021-06-01 14:42:13');

-- --------------------------------------------------------

--
-- Structure de la table `category_translations`
--

CREATE TABLE `category_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `feature_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `category_translations`
--

INSERT INTO `category_translations` (`id`, `category_id`, `locale`, `name`, `feature_title`) VALUES
(20, 23, 'en', 'Tips & Tricks', NULL),
(21, 23, 'fr', 'Astuces et Conseils', NULL),
(24, 25, 'en', 'Trekking', NULL),
(28, 22, 'en', 'Circuits et Séjours organisés', 'Circuits et Séjours organisés'),
(29, 22, 'fr', 'Circuits et Séjours organisés', 'Circuits et Séjours organisés'),
(30, 21, 'en', 'Surf', 'Surf'),
(31, 21, 'fr', 'Surf', 'Surf'),
(32, 20, 'en', 'Bivouacs', 'Bivouacs'),
(33, 20, 'fr', 'Bivouacs', 'Bivouacs'),
(34, 13, 'en', 'Golf Tours', 'Golf Tours'),
(35, 13, 'fr', 'Golf Tours', 'Golf Tours'),
(36, 12, 'en', 'Motorcycle', 'Motorcycle'),
(37, 12, 'fr', 'Motorcycle', 'Motorcycle'),
(38, 11, 'en', 'Trekking', 'Trekking'),
(39, 11, 'fr', 'Trekking', 'Trekking'),
(40, 24, 'en', 'Golf Tours', NULL),
(41, 24, 'fr', 'Golf Tours', 'Golf'),
(43, 26, 'en', 'Trekking', 'Trekking'),
(44, 26, 'fr', 'Trekking', NULL),
(45, 25, 'fr', 'Trekking', NULL),
(46, 27, 'en', 'Camping', NULL),
(47, 27, 'fr', 'Camping', NULL),
(48, 28, 'en', 'Circuit et sejour organisé', NULL),
(49, 28, 'fr', 'Circuit et sejour organisé', NULL),
(50, 29, 'en', 'Bivouacs', NULL),
(51, 29, 'fr', 'Bivouacs', NULL),
(52, 1, 'en', 'Bivouacs', NULL),
(53, 1, 'fr', 'Bivouacs', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `category_types`
--

CREATE TABLE `category_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `category_types`
--

INSERT INTO `category_types` (`id`, `category_id`, `name`, `description`, `slug`, `image`, `icon`, `color`, `created_at`, `updated_at`) VALUES
(1, 12, NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-18 15:27:25', '2021-05-18 15:27:25'),
(2, 12, NULL, NULL, NULL, NULL, '', NULL, '2021-05-18 15:28:06', '2021-05-18 15:33:20'),
(3, 12, NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-19 08:06:45', '2021-05-19 08:06:45'),
(4, 13, NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-19 08:07:45', '2021-05-19 08:07:45'),
(5, 13, NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-19 08:07:58', '2021-05-19 08:07:58'),
(13, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-01 15:08:17', '2021-06-01 15:08:17'),
(14, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-01 15:13:35', '2021-06-01 15:13:35');

-- --------------------------------------------------------

--
-- Structure de la table `category_type_translations`
--

CREATE TABLE `category_type_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_type_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `category_type_translations`
--

INSERT INTO `category_type_translations` (`id`, `category_type_id`, `locale`, `name`, `description`) VALUES
(7, 1, 'en', 'LOCATION DE MOTOS', NULL),
(8, 1, 'fr', 'LOCATION DE MOTOS', NULL),
(9, 2, 'en', 'VISITES GUIDÉES EN MOTO', NULL),
(10, 2, 'fr', 'VISITES GUIDÉES EN MOTO', NULL),
(11, 3, 'en', 'CIRCUITS EN MOTO AUTONOMES', NULL),
(12, 3, 'fr', 'CIRCUITS EN MOTO AUTONOMES', NULL),
(13, 4, 'en', 'Golf Courses', NULL),
(14, 4, 'fr', 'Golf Courses', NULL),
(15, 5, 'en', NULL, NULL),
(16, 5, 'fr', 'Golf Packages', NULL),
(17, 6, 'en', NULL, NULL),
(18, 6, 'fr', 'Golf Packages', NULL),
(19, 7, 'en', 'Sejour organisé', NULL),
(20, 7, 'fr', 'Sejour organisé', NULL),
(29, 12, 'en', 'TIZIPLUS LUXURY DESERT CAMP', NULL),
(30, 12, 'fr', 'TIZIPLUS LUXURY DESERT CAMP', NULL),
(31, 13, 'en', 'TIZIPLUS LUXURY DESERT CAMP', NULL),
(32, 13, 'fr', 'TIZIPLUS LUXURY DESERT CAMP', NULL),
(33, 14, 'en', 'TOUAREG DREAM CHEGAGA LUXURY CAMP', NULL),
(34, 14, 'fr', 'TOUAREG DREAM CHEGAGA LUXURY CAMP', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `cities`
--

CREATE TABLE `cities` (
  `id` int(11) UNSIGNED NOT NULL,
  `country_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `intro` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thumb` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `banner` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `best_time_to_visit` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `language` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lat` double DEFAULT NULL,
  `lng` double DEFAULT NULL,
  `priority` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 1,
  `seo_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `cities`
--

INSERT INTO `cities` (`id`, `country_id`, `name`, `slug`, `intro`, `description`, `thumb`, `banner`, `best_time_to_visit`, `currency`, `language`, `lat`, `lng`, `priority`, `status`, `seo_title`, `seo_description`, `created_at`, `updated_at`) VALUES
(23, 13, 'Dakhla', 'dakhla', NULL, NULL, '602e8df9bb970_1613663737.jpg', '602e8df9bbbe0_1613663737.jpg', 'Anytime', 'Dirham DH', 'Arabe français', 27.8521664, -12.1632718, 0, 1, 'Ville de Dakhla', 'Située au sud du Maroc, Dakhla est une petite partie de paradis, perdue entre les eaux de l\'Atlantique et les sables du Sahara. Elle vous offre...', '2019-10-25 11:09:36', '2021-03-04 20:04:48'),
(31, 13, '', 'marrakech', NULL, NULL, '5fde981328c4c_1608423443.jpg', '5fde981329a9f_1608423443.jpg', 'Anytime', 'Dirham DH', 'Arabe français English', 31.6294723, -7.9810845, 0, 1, 'Ville de Marrakech', 'Entre tradition et modernité, Marrakech est la promesse de sensations inégalées. La ville rouge vous offre un dépaysement total.', '2020-12-19 22:31:25', '2021-03-04 20:18:34'),
(32, 13, '', 'fes', NULL, NULL, '600af1c50e923_1611329989.jpg', '600af1c50eefb_1611329989.jpg', 'Anytime', 'DH', 'Arabe français', 34.0181246, -5.0078451, 0, 1, NULL, NULL, '2021-01-22 14:28:01', '2021-02-24 16:14:52'),
(33, 13, '', 'chefchaouen', NULL, NULL, '600af213256f2_1611330067.jpg', '600af21325c05_1611330067.jpg', 'Anytime', 'DH', 'Berber', 35.168796, -5.2683641, 0, 1, 'Ville de Chefchaouen', 'Construite à flanc de montagne, Chefchaouen est une ville aux vibrations particulières. Son charme unique donne une impression d\'irréalité.', '2021-01-22 14:30:29', '2021-03-04 20:02:39'),
(34, 13, '', 'agadir', NULL, NULL, '600af1696fd3f_1611329897.jpg', '600af169702ff_1611329897.jpg', 'Anytime', NULL, 'Arabe français', 30.4277547, -9.5981072, 0, 1, 'Ville d\'Agadir', 'Dans l\'ouest du pays, bordé par les vagues de l\'Atlantique, Rentacs Tours vous emmène à Agadir. Quelle que soit la saison Agadir reste l\'une des perles du Maroc', '2021-01-22 14:35:15', '2021-03-04 20:02:56'),
(35, 13, '', 'el-jadida', NULL, NULL, '600e8f3dd54bd_1611566909.jpg', '600e8f3dd58f4_1611566909.jpg', 'Anytime', 'DH', 'Arabe français', 33.2316326, -8.5007116, 0, 1, 'Ville d\'El Jadida', 'Située le long de la côte atlantique du Maroc, entre la plus grande ville du pays, Casablanca, et la populaire ville côtière d\'Essaouira, El Jadida est en quelque sorte une destination hors des sentiers battus pour les touristes internationaux.', '2021-01-25 08:16:39', '2021-03-04 19:45:57'),
(37, 13, NULL, 'essaouira', NULL, NULL, '60b619c0a6bce_1622546880.jpeg', '60b619c1797fe_1622546881.jpeg', 'tout le temp', 'dh', NULL, NULL, NULL, 0, 1, 'essaouira', 'essaouira', '2021-06-01 10:28:01', '2021-06-01 10:28:01'),
(39, 13, NULL, 'casablanca', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2021-06-01 13:13:15', '2021-06-01 13:13:15'),
(40, 13, NULL, 'saidia', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, '2021-06-01 13:28:05', '2021-06-01 13:28:05');

-- --------------------------------------------------------

--
-- Structure de la table `city_translations`
--

CREATE TABLE `city_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `city_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `intro` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `city_translations`
--

INSERT INTO `city_translations` (`id`, `city_id`, `locale`, `name`, `intro`, `description`) VALUES
(1, 23, 'en', 'Dakhla', NULL, 'Dakhla'),
(11, 31, 'en', 'Marrakech', NULL, 'Marrakesh is the fourth largest city in the Kingdom of Morocco. It is the capital of the mid-southwestern region of Marrakesh-Safi. It is west of the foothills of the Atlas Mountains.'),
(12, 31, 'fr', 'Marrakech', NULL, 'Marrakech, est une ville située dans le centre du Maroc au pied des montagnes de l\'Atlas. Marrakech est surnommée « la ville rouge » ou la « ville ocre » en référence à la couleur rouge d\'une grande partie de ses immeubles et ses maisons.'),
(13, 32, 'en', 'Fes', NULL, 'Fez is situated at a crossroad connecting the important cities of different regions; 206 km (128 mi) from Tangier to the northwest, 246 km (153 mi) from Casablanca, 189 km (117 mi) from Rabat to the west, and 387 km (240 mi) from Marrakesh to the southwes'),
(14, 32, 'fr', 'Fès', NULL, 'située à 180 km à l\'est de Rabat, entre le massif du Rif et le Moyen Atlas. Faisant partie des villes impériales du Maroc, elle a été à plusieurs époques la capitale du pays et est considérée de nos jours comme sa capitale spirituelle.'),
(15, 33, 'en', 'Chefchaouen', NULL, 'Also known as Chaouen, is a city in northwest Morocco. It is the chief town of the province of the same name, and is noted for its buildings in shades of blue. Chefchaouen is situated just inland from Tangier and Tétouan.'),
(16, 33, 'fr', 'Chefchaouen', 'intro', 'Ville du nord-ouest du Maroc, bâtie à 600 m d\'altitude au pied des monts Kelaa et Meggou, sur la chaîne du Rif. Elle est le chef-lieu de la province homonyme. Sa population est de 42 786 habitants.'),
(17, 34, 'en', 'Agadir', NULL, 'major city in Morocco. It is located on the shore of the Atlantic Ocean near the foot of the Atlas Mountains, just north of the point where the Souss River flows into the ocean and 509 kilometres (316 mi) south of Casablanca. Agadir is the capital of the'),
(18, 34, 'fr', 'Agadir', NULL, 'Ville du sud-ouest Marocain, située sur la côte atlantique, dans la région du Souss, à 508 km au sud de Casablanca, à 173 km d\'Essaouira et à 235 km à l\'ouest de Marrakech5. Surnommée «la capitale du Souss», Agadir est le chef-lieu de la région administra'),
(19, 23, 'fr', 'Dakhla', NULL, 'Dakhla'),
(20, 35, 'en', 'El Jadida', NULL, NULL),
(21, 35, 'fr', 'El Jadida', NULL, NULL),
(24, 37, 'en', 'Essaouira', 'intro', 'description'),
(25, 37, 'fr', 'Essaouira', 'into', 'description'),
(28, 39, 'en', 'Casablanca', 'intro', 'desc'),
(29, 39, 'fr', 'Casablanca', 'intro', 'desc'),
(30, 40, 'en', 'Saidia', 'desc', 'desc'),
(31, 40, 'fr', 'Saidia', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `comments`
--

CREATE TABLE `comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `cooperate_customer_profiles`
--

CREATE TABLE `cooperate_customer_profiles` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `company_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_address` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_cac_rc_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_phone_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_contact_person_email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_contact_person_phone_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_contact_person_address` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `countries`
--

CREATE TABLE `countries` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `priority` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 1,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_cover_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `countries`
--

INSERT INTO `countries` (`id`, `name`, `slug`, `priority`, `status`, `description`, `seo_title`, `seo_description`, `seo_cover_image`, `created_at`, `updated_at`) VALUES
(13, 'Maroc', 'maroc', 0, 1, 'MAD', NULL, NULL, NULL, '2020-12-19 22:28:47', '2021-02-11 20:25:03'),
(15, 'France', 'france', 0, 1, NULL, NULL, NULL, NULL, '2021-06-01 10:26:13', '2021-06-01 10:26:13'),
(16, 'Espagne', 'espagne', 0, 1, NULL, NULL, NULL, NULL, '2021-06-01 13:12:09', '2021-06-01 13:12:09');

-- --------------------------------------------------------

--
-- Structure de la table `email_subscribers`
--

CREATE TABLE `email_subscribers` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ipAddress` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `faqs`
--

CREATE TABLE `faqs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `faqs`
--

INSERT INTO `faqs` (`id`, `status`, `title`, `content`, `created_at`, `updated_at`) VALUES
(2, '1', 'CONDITIONS GÉNÉRALES', '<p><span style=\"font-weight: 400;\">Les pr&eacute;sentes Conditions G&eacute;n&eacute;rales de Vente r&eacute;gissent les ventes de voyages propos&eacute;es, de s&eacute;jours ou de forfaits propos&eacute;es sur le Site RENTACS TOURS, au sens du Code de tourisme Marocain.</span></p>', '2021-04-16 15:17:40', '2021-04-23 14:04:08'),
(4, '1', '1) Inscription', '<p><span style=\"font-weight: 400;\">Toute inscription doit &ecirc;tre accompagn&eacute;e d&rsquo;un versement de 30% du montant total du voyage choisi pour &ecirc;tre confirm&eacute;e ; Le solde doit &ecirc;tre r&eacute;gl&eacute; au plus tard 30 jours avant le d&eacute;part du voyage. Le client n&rsquo;ayant pas vers&eacute; le solde &agrave; la date convenue est consid&eacute;r&eacute; comme ayant annul&eacute; son voyage et encourt de ce fait, les frais d&rsquo;annulation pr&eacute;vus par les pr&eacute;sentes conditions. En cas d&rsquo;inscription tardive, moins de 30 jours avant la date pr&eacute;vue du voyage, le client devra acquitter la totalit&eacute; du montant de ce voyage.</span></p>\r\n<p><span style=\"font-weight: 400;\">Pour toute inscription &agrave; moins de 10 jours de la date de d&eacute;part, nous nous r&eacute;servons le droit de facturer au client tous frais suppl&eacute;mentaires pouvant intervenir tels que t&eacute;l&eacute;phone, fax, etc&hellip;</span></p>', '2021-04-23 14:01:33', '2021-04-23 14:03:09'),
(5, '1', '2) Confirmation d’inscription', '<p><span style=\"font-weight: 400;\">La confirmation d&eacute;finitive de votre voyage ne pourra se faire qu&rsquo;apr&egrave;s paiement int&eacute;gral des prestations et apr&egrave;s v&eacute;rification des disponibilit&eacute;s aupr&egrave;s de nos fournisseurs. L&rsquo;Acheteur re&ccedil;oit automatiquement les &eacute;l&eacute;ments essentiels tels que l&rsquo;identification de la prestation achet&eacute;e et le prix pay&eacute;.</span></p>\r\n<p><span style=\"font-weight: 400;\">Le formulaire de r&eacute;servation confirm&eacute;e correspond au contrat de voyage et comporte le descriptif de la prestation et ses caract&eacute;ristiques essentielles, ainsi que le prix et les conditions d&rsquo;annulation, de modification.</span></p>\r\n<p><span style=\"font-weight: 400;\">Les compagnies a&eacute;riennes peuvent &agrave; tout moment exiger l&rsquo;&eacute;mission ou le paiement anticip&eacute; sans remboursement possible des billets inclus dans le forfait. Dans ce cas, ou si l&rsquo;acheteur exige l&rsquo;&eacute;mission anticip&eacute; de son billet, les conditions de modification ou d&rsquo;annulation du forfait peuvent s&rsquo;en trouver modifi&eacute;es.</span></p>', '2021-04-23 14:02:10', '2021-04-23 14:02:10'),
(6, '1', '3) Tarification', '<p><span style=\"font-weight: 400;\">Les fiches descriptives des voyages et s&eacute;jours RENTACS TOURS mentionnent ce qui est compris dans le prix et ce qui ne l&rsquo;est pas.</span></p>\r\n<p><span style=\"font-weight: 400;\">Sauf disposition contraire dans le descriptif du voyage, le forfait de base est annonc&eacute; en Dirhams Marocains et en TTC et ne comprend pas les boissons, les repas suppl&eacute;mentaires, les d&eacute;penses &agrave; r&eacute;gler sur place, les d&eacute;penses personnelles, les spectacles, les excursions, les frais de vaccin, ni certaines prestations obligatoires telles que les taxes locales, le suppl&eacute;ment d&icirc;ner de r&eacute;veillon ou occasion sp&eacute;ciale, les frais de visas&hellip; ainsi que tout service ou prestation non express&eacute;ment mentionn&eacute;s au descriptif. RENTACS TOURS d&eacute;cline toute responsabilit&eacute; pour les achats personnels sur place.</span></p>', '2021-04-23 14:02:51', '2021-04-23 14:02:51'),
(7, '1', '4) Modes de paiement', '<p><span style=\"font-weight: 400;\">L&rsquo;Acheteur dispose de plusieurs modes de paiement sur le site Internet :</span></p>\r\n<ul>\r\n<li aria-level=\"1\"><strong>Par cartes bancaires et cartes de paiement</strong></li>\r\n</ul>\r\n<p><span style=\"font-weight: 400;\">RENTACS TOURS accepte les cartes bancaires et les cartes de paiement suivantes sur son site Internet (site s&eacute;curis&eacute;):</span></p>\r\n<ul>\r\n<li style=\"font-weight: 400;\" aria-level=\"1\"><span style=\"font-weight: 400;\">carte Visa</span></li>\r\n<li style=\"font-weight: 400;\" aria-level=\"1\"><span style=\"font-weight: 400;\">carte CMI</span></li>\r\n<li style=\"font-weight: 400;\" aria-level=\"1\"><span style=\"font-weight: 400;\">&nbsp;carte MasterCard</span></li>\r\n<li style=\"font-weight: 400;\" aria-level=\"1\"><span style=\"font-weight: 400;\">&nbsp;carte Maestro</span></li>\r\n<li style=\"font-weight: 400;\" aria-level=\"1\"><span style=\"font-weight: 400;\">carte American Express</span></li>\r\n</ul>\r\n<p>&nbsp;</p>\r\n<ul>\r\n<li aria-level=\"1\"><strong>Par virement bancaire</strong></li>\r\n</ul>\r\n<p><span style=\"font-weight: 400;\">RENTACS TOURS accepte les r&egrave;glements par virement bancaire. Le virement doit imp&eacute;rativement &ecirc;tre confirm&eacute; par la banque &eacute;mettrice (photocopie ordre de virement&hellip;). Cette confirmation de virement doit faire mention du nom, pr&eacute;nom et num&eacute;ro de commande.</span></p>\r\n<p><span style=\"font-weight: 400;\">Coordonn&eacute;es bancaires de RENTACS TOURS :&nbsp;</span></p>\r\n<p><span style=\"font-weight: 400;\">Banque&nbsp;: Attijariwafabank</span></p>\r\n<p><span style=\"font-weight: 400;\">Agence&nbsp;: Centre d&rsquo;affaires YACOUB EL MANSOUR&nbsp;</span></p>\r\n<p><span style=\"font-weight: 400;\">Code Banque&nbsp;: 007</span></p>\r\n<p><span style=\"font-weight: 400;\">Code Ville&nbsp;: 780</span></p>\r\n<p><span style=\"font-weight: 400;\">Num&eacute;ro de compte : 003394000002546</span></p>\r\n<p><span style=\"font-weight: 400;\">Cl&eacute; Rib&nbsp;: 93</span></p>\r\n<p><span style=\"font-weight: 400;\">SWIFT : BCMAMAMC</span></p>\r\n<p><span style=\"font-weight: 400;\">D&rsquo;autres moyens de paiement sont disponibles &agrave; l&rsquo;agence RENTACS TOURS de Casablanca 13 rue El Kassar-1</span><span style=\"font-weight: 400;\">er</span><span style=\"font-weight: 400;\"> &eacute;tape- Maarif CASABLANCA MOROCCO.</span></p>', '2021-04-23 15:43:51', '2021-04-23 15:44:10'),
(8, '1', '5)- Modifications et reports', '<p><span style=\"font-weight: 400;\">Toute demande de modification de r&eacute;servation &eacute;manant du client n\'entra&icirc;nera aucun frais si, ni la date de d&eacute;part, ni l&rsquo;acheminement pr&eacute;vu initialement, ni le lieu de destination ne sont modifi&eacute;s, et qu&rsquo;elle intervient dans les cas suivants :</span></p>\r\n<ul>\r\n<li style=\"font-weight: 400;\" aria-level=\"1\"><span style=\"font-weight: 400;\">Augmentation du nombre de participants</span></li>\r\n<li style=\"font-weight: 400;\" aria-level=\"1\"><span style=\"font-weight: 400;\">Remplacement de la formule pour les repas, si celle-ci est envisageable</span></li>\r\n</ul>', '2021-04-23 15:44:28', '2021-04-23 15:44:28'),
(9, '1', '6/ Séjours modifiés ou écourtés', '<p><span style=\"font-weight: 400;\">Si en cas d&rsquo;impr&eacute;vu, le client devait &eacute;courter son s&eacute;jour, ou si au cours de celui-ci, il ne b&eacute;n&eacute;ficiait pas de certaines prestations pr&eacute;vues au programme, toute demande relative &agrave; un remboursement de prestation non fournie devra obligatoirement &ecirc;tre accompagn&eacute;e d&rsquo;une attestation sign&eacute;e du prestataire de service concern&eacute;, pr&eacute;cisant son accord pour le remboursement total ou partiel. Tout voyage interrompu ou abr&eacute;g&eacute;, toute prestation non consomm&eacute;e du fait d&rsquo;un voyageur, pour quelque cause que ce soit, pourront dans ces conditions faire l&rsquo;objet d&rsquo;un remboursement mais les appr&eacute;ciations subjectives ne seront pas prises en compte.</span></p>', '2021-04-23 15:44:38', '2021-04-23 15:44:38'),
(10, '1', '7/ Condition d’annulation', '<p><span style=\"font-weight: 400;\">L&rsquo;annulation par le client de son inscription entra&icirc;nera l\'exigibilit&eacute; des frais suivants :</span></p>\r\n<p><span style=\"font-weight: 400;\">Plus de 30 jours avant le d&eacute;part : Il sera retenu le montant des frais de dossier (non remboursable).</span></p>\r\n<p><span style=\"font-weight: 400;\">L&rsquo;organisateur se r&eacute;serve le droit de facturer en suppl&eacute;ment les frais de t&eacute;l&eacute;phone, fax qu&rsquo;il aurait eu &agrave; engager pour effectuer les r&eacute;servations et/ou annulations.</span></p>\r\n<ul>\r\n<li style=\"font-weight: 400;\" aria-level=\"1\"><span style=\"font-weight: 400;\">Entre 30 et 21 jours du d&eacute;part, il sera retenu 25% du montant du voyage.</span></li>\r\n<li style=\"font-weight: 400;\" aria-level=\"1\"><span style=\"font-weight: 400;\">Entre 20 et 8 jours avant le d&eacute;part du voyage, il sera retenu 50% du montant du voyage.</span></li>\r\n<li style=\"font-weight: 400;\" aria-level=\"1\"><span style=\"font-weight: 400;\">Entre 7 et 2 jours avant le d&eacute;part du voyage, il sera retenu 75% du montant total du voyage.</span></li>\r\n<li style=\"font-weight: 400;\" aria-level=\"1\"><span style=\"font-weight: 400;\">Moins de 2 jours avant le d&eacute;part, il sera retenu 90% du montant du voyage.</span></li>\r\n<li style=\"font-weight: 400;\" aria-level=\"1\"><span style=\"font-weight: 400;\">Pour une non pr&eacute;sentation &agrave; l&rsquo;enregistrement du vol, il sera retenu 100% du montant total du voyage.</span></li>\r\n</ul>\r\n<p><span style=\"font-weight: 400;\">Le d&eacute;faut d&rsquo;enregistrement, au lieu de d&eacute;part du voyage a&eacute;rien &agrave; forfait, occasionn&eacute; par un retard de pr&eacute;acheminement a&eacute;rien quelle qu&rsquo;en soit la cause, n&rsquo;est pas exon&eacute;r&eacute; de frais d&rsquo;annulation, et n&rsquo;entra&icirc;ne pas la responsabilit&eacute; de RENTACS TOURS.</span></p>\r\n<p><span style=\"font-weight: 400;\">Les frais d&rsquo;annulation des compagnies a&eacute;riennes peuvent &ecirc;tre sp&eacute;cifiques sur certains vols ou certaines destinations. Dans ce cas, ils seront indiqu&eacute;s d&egrave;s qu&rsquo;ils seront port&eacute;s &agrave; notre connaissance.</span></p>', '2021-04-23 15:44:57', '2021-04-23 15:44:57'),
(11, '1', '7/ Annulation ou modification du fait de RENTACS TOURS', '<p><span style=\"font-weight: 400;\">Si l\'annulation est impos&eacute;e par des circonstances de force majeure ou des raisons de s&eacute;curit&eacute;, le client n&rsquo;a le droit &agrave; aucune indemnit&eacute;.&nbsp;</span></p>', '2021-04-23 15:45:12', '2021-04-23 15:45:12'),
(12, '1', '8/ Transport Aérien', '<p><span style=\"font-weight: 400;\">Les impr&eacute;vus de contretemps ou incidents pouvant survenir lors de l&rsquo;utilisation du transport a&eacute;rien sont r&eacute;gies par les dispositions de la convention de Varsovie, du r&egrave;glement de la communaut&eacute; europ&eacute;enne n&deg; 261/2004 ou les r&eacute;glementations locales r&eacute;gissant les transports nationaux du pays concern&eacute;.</span></p>\r\n<p><span style=\"font-weight: 400;\">Les voyageurs seront inform&eacute;s de l&rsquo;identit&eacute; du ou des transporteurs contractuels ou, de fait, susceptibles de r&eacute;aliser le vol achet&eacute;.</span></p>\r\n<p><span style=\"font-weight: 400;\">D&rsquo;autre part, en cas de modification de leur structure tarifaire, les compagnies a&eacute;riennes se laissent la possibilit&eacute; de revoir &agrave; la hausse ou &agrave; la baisse certains de leurs tarifs. Dans ce cas, nous serons amen&eacute;s &agrave; r&eacute;percuter ces variations tarifaires dans le prix de nos forfaits.</span></p>', '2021-04-23 15:45:24', '2021-04-23 15:45:24'),
(13, '1', '9/ Descriptions et informations', '<p><span style=\"font-weight: 400;\">Les informations et les descriptions mentionn&eacute;es sur ce site, sont fournies de bonne foi sur les indications et documents qui nous sont fournis sous la responsabilit&eacute; de leurs auteurs.</span></p>\r\n<p><span style=\"font-weight: 400;\">Les fermetures temporaires de certains &eacute;quipements dues &agrave; des travaux, &agrave; des d&eacute;faillances techniques ou autres sont toujours possibles ; de m&ecirc;me, les conditions m&eacute;t&eacute;orologiques peuvent parfois provoquer l&rsquo;annulation de certaines activit&eacute;s.</span></p>\r\n<p><span style=\"font-weight: 400;\">RENTACS TOURS s&rsquo;engage &agrave; communiquer &agrave; ses clients toutes les modifications &eacute;ventuelles susceptibles d&rsquo;&ecirc;tre apport&eacute;es aux informations contenues sur ce site, ou sur le d&eacute;roulement du voyage r&eacute;serv&eacute;.</span></p>', '2021-04-23 15:45:39', '2021-04-23 15:45:39'),
(14, '1', '10/ Service après-vente', '<p><span style=\"font-weight: 400;\">Tout dysfonctionnement ou d&eacute;faillance dans l\'ex&eacute;cution du contrat constat&eacute;e par les clients doit &ecirc;tre signal&eacute; dans les plus brefs d&eacute;lais, par &eacute;crit &agrave; l\'organisateur. La r&eacute;clamation doit parvenir sous pli recommand&eacute;. Nous nous efforcerons d&rsquo;apporter une solution rapide &agrave; tout litige. Le d&eacute;lai peut varier en fonction de notre enqu&ecirc;te ou du d&eacute;lai de r&eacute;ponse de nos prestataires.</span></p>', '2021-04-23 15:45:50', '2021-04-23 15:45:50'),
(15, '1', '11/ Juridiction', '<p><span style=\"font-weight: 400;\">En cas de contestation ou de litige, le tribunal du domicile du voyageur est comp&eacute;tent.</span></p>', '2021-04-23 15:46:06', '2021-04-23 15:46:06');

-- --------------------------------------------------------

--
-- Structure de la table `flight_bookings`
--

CREATE TABLE `flight_bookings` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `reference` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pnr` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `itinerary_amount` bigint(20) NOT NULL,
  `markup` bigint(20) NOT NULL,
  `markdown` bigint(20) NOT NULL,
  `vat` bigint(20) NOT NULL,
  `voucher_id` int(11) NOT NULL,
  `voucher_amount` bigint(20) NOT NULL,
  `total_amount` bigint(20) NOT NULL,
  `ticket_time_limit` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_status` int(11) NOT NULL DEFAULT 0,
  `issue_ticket_status` int(11) NOT NULL DEFAULT 0,
  `void_ticket_status` int(11) NOT NULL DEFAULT 0,
  `cancel_ticket_status` int(11) NOT NULL DEFAULT 0,
  `pnr_request_response` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `flight_bookings`
--

INSERT INTO `flight_bookings` (`id`, `user_id`, `reference`, `pnr`, `itinerary_amount`, `markup`, `markdown`, `vat`, `voucher_id`, `voucher_amount`, `total_amount`, `ticket_time_limit`, `payment_status`, `issue_ticket_status`, `void_ticket_status`, `cancel_ticket_status`, `pnr_request_response`, `created_at`, `updated_at`) VALUES
(1, 4, 'AIR-KLAHGV', 'TVPR7W', 20525800, 205258, 0, 0, 0, 0, 20731058, '2018-04-24T23:59:00', 0, 0, 0, 0, '{\"pnr\":\"TVPR7W\",\"flights\":[{\"@attributes\":{\"Status\":\"HK\",\"ItinSeqNumber\":\"2\"},\"Air\":{\"@attributes\":{\"DepartureDateTime\":\"2018-04-24T22:35:00\",\"ArrivalDateTime\":\"2018-04-25T04:20:00\",\"StopQuantity\":\"0\",\"RPH\":\"1\",\"FlightNumber\":\"780\",\"ResBookDesigCode\":\"T\",\"NumberInParty\":\"1\",\"Status\":\"HK\",\"E_TicketEligibility\":\"Eligible\",\"DepartureDay\":\"Tue\",\"OrginDestType\":\"First\"},\"DepartureAirport\":\"London-Heathrow, United Kingdom\",\"ArrivalAirport\":\"Cairo-Cairo Intl, Egypt\",\"OperatingAirline\":\"Egyptair\",\"Equipment\":\"BOEING 737-800 JET\",\"MarketingAirline\":\"Egyptair\",\"MarriageGrp\":\"MIN1\",\"TPA_Extensions\":{\"@attributes\":{\"ConfirmationNumber\":\"TVPR7W\"}}}},{\"@attributes\":{\"Status\":\"HK\",\"ItinSeqNumber\":\"3\"},\"Air\":{\"@attributes\":{\"DepartureDateTime\":\"2018-04-25T05:25:00\",\"ArrivalDateTime\":\"2018-04-25T10:55:00\",\"StopQuantity\":\"0\",\"RPH\":\"2\",\"FlightNumber\":\"901\",\"ResBookDesigCode\":\"T\",\"NumberInParty\":\"1\",\"Status\":\"HK\",\"E_TicketEligibility\":\"Eligible\",\"DepartureDay\":\"Wed\",\"OrginDestType\":\"Intermediate\"},\"DepartureAirport\":\"Cairo-Cairo Intl, Egypt\",\"ArrivalAirport\":\"Dubai-Dubai Intl, United Arab Emirates\",\"OperatingAirline\":\"Egyptair\",\"Equipment\":\"BOEING 737-800 JET\",\"MarketingAirline\":\"Egyptair\",\"MarriageGrp\":\"MIN1\",\"TPA_Extensions\":{\"@attributes\":{\"ConfirmationNumber\":\"TVPR7W\"}}}},{\"@attributes\":{\"Status\":\"HK\",\"ItinSeqNumber\":\"4\"},\"Air\":{\"@attributes\":{\"DepartureDateTime\":\"2018-04-28T05:20:00\",\"ArrivalDateTime\":\"2018-04-28T07:00:00\",\"StopQuantity\":\"0\",\"RPH\":\"3\",\"FlightNumber\":\"911\",\"ResBookDesigCode\":\"T\",\"NumberInParty\":\"1\",\"Status\":\"HK\",\"E_TicketEligibility\":\"Eligible\",\"DepartureDay\":\"Sat\",\"OrginDestType\":\"First\"},\"DepartureAirport\":\"Dubai-Dubai Intl, United Arab Emirates\",\"ArrivalAirport\":\"Cairo-Cairo Intl, Egypt\",\"OperatingAirline\":\"Egyptair\",\"Equipment\":\"AIRBUS INDUSTRIE A330-300 JET\",\"MarketingAirline\":\"Egyptair\",\"MarriageGrp\":\"MIN2\",\"TPA_Extensions\":{\"@attributes\":{\"ConfirmationNumber\":\"TVPR7W\"}}}},{\"@attributes\":{\"Status\":\"HK\",\"ItinSeqNumber\":\"5\"},\"Air\":{\"@attributes\":{\"DepartureDateTime\":\"2018-04-28T09:10:00\",\"ArrivalDateTime\":\"2018-04-28T13:35:00\",\"StopQuantity\":\"0\",\"RPH\":\"4\",\"FlightNumber\":\"777\",\"ResBookDesigCode\":\"T\",\"NumberInParty\":\"1\",\"Status\":\"HK\",\"E_TicketEligibility\":\"Eligible\",\"DepartureDay\":\"Sat\",\"OrginDestType\":\"Intermediate\"},\"DepartureAirport\":\"Cairo-Cairo Intl, Egypt\",\"ArrivalAirport\":\"London-Heathrow, United Kingdom\",\"OperatingAirline\":\"Egyptair\",\"Equipment\":\"BOEING 777-300 JET\",\"MarketingAirline\":\"Egyptair\",\"MarriageGrp\":\"MIN2\",\"TPA_Extensions\":{\"@attributes\":{\"ConfirmationNumber\":\"TVPR7W\"}}}}],\"bagsAllowance\":[{\"@attributes\":{\"PricingSource\":\"Private\",\"TravelerRefNumberRPHList\":\"1\",\"FlightRefNumberRPHList\":\"2 3 4 5\",\"RPH\":\"1\"},\"PassengerTypeQuantity\":{\"@attributes\":{\"Code\":\"ADT\",\"Quantity\":\"1\"}},\"FareBasisCodes\":{\"FareBasisCode\":[\"TLRIGB\",\"TLRIGB\",\"TLRIGB\",\"TLRIGB\"]},\"PassengerFare\":{\"BaseFare\":{\"@attributes\":{\"Amount\":\"56247\",\"CurrencyCode\":\"NGN\",\"DecimalPlaces\":\"0\"}},\"EquivFare\":{\"@attributes\":{\"Amount\":\"11000\",\"CurrencyCode\":\"GBP\",\"DecimalPlaces\":\"2\"}},\"Taxes\":{\"Tax\":[{\"@attributes\":{\"Code\":\"YQ\",\"Amount\":\"7200\",\"DecimalPlaces\":\"0\"}},{\"@attributes\":{\"Code\":\"YQ\",\"Amount\":\"3600\",\"DecimalPlaces\":\"0\"}},{\"@attributes\":{\"Code\":\"YR\",\"Amount\":\"62384\",\"DecimalPlaces\":\"0\"}},{\"@attributes\":{\"Code\":\"GB\",\"Amount\":\"39885\",\"DecimalPlaces\":\"0\"}},{\"@attributes\":{\"Code\":\"UB\",\"Amount\":\"22964\",\"DecimalPlaces\":\"0\"}},{\"@attributes\":{\"Code\":\"EQ\",\"Amount\":\"720\",\"DecimalPlaces\":\"0\"}},{\"@attributes\":{\"Code\":\"AE\",\"Amount\":\"7353\",\"DecimalPlaces\":\"0\"}},{\"@attributes\":{\"Code\":\"F6\",\"Amount\":\"3432\",\"DecimalPlaces\":\"0\"}},{\"@attributes\":{\"Code\":\"TP\",\"Amount\":\"491\",\"DecimalPlaces\":\"0\"}},{\"@attributes\":{\"Code\":\"ZR\",\"Amount\":\"982\",\"DecimalPlaces\":\"0\"}}]},\"TotalFare\":{\"@attributes\":{\"Amount\":\"205258\",\"CurrencyCode\":\"NGN\",\"DecimalPlaces\":\"0\"}}},\"TPA_Extensions\":{\"FareCalculation\":\"LON MS X\\/CAI MS DXB M\\/IT TLRIGB\\/PV MS X\\/CAI MS LON M\\/IT TLRIGB\\/PV END\",\"ValidatingAirlineCode\":\"*F*MS\",\"BagAllowance\":[{\"@attributes\":{\"Quantity\":\"1\",\"Type\":\"Piece\",\"ItinSeqNumber\":\"2\"}},{\"@attributes\":{\"Quantity\":\"1\",\"Type\":\"Piece\",\"ItinSeqNumber\":\"3\"}},{\"@attributes\":{\"Quantity\":\"1\",\"Type\":\"Piece\",\"ItinSeqNumber\":\"4\"}},{\"@attributes\":{\"Quantity\":\"1\",\"Type\":\"Piece\",\"ItinSeqNumber\":\"5\"}}]}}],\"passengers\":[{\"@attributes\":{\"RPH\":\"1\"},\"Customer\":{\"PersonName\":{\"@attributes\":{\"NameType\":\"ADT\"},\"GivenName\":\"DAMILOLA OLAMIDE MR\",\"Surname\":\"OGUNSAKIN\"},\"Telephone\":{\"@attributes\":{\"PhoneNumber\":\"LOS\",\"PhoneUseType\":\"H\"}},\"Email\":\"OGUNSAKIN191@GMAIL.COM\"}}]}', '2021-01-28 09:16:31', '2021-01-28 09:16:31'),
(2, 4, 'AIR-AQLYZT', 'TVQ532', 60615000, 606150, 0, 0, 0, 0, 61221150, '2018-04-26T23:59:00', 0, 0, 0, 0, '', '2021-01-28 09:16:31', '2021-01-28 09:16:31');

-- --------------------------------------------------------

--
-- Structure de la table `flight_deals`
--

CREATE TABLE `flight_deals` (
  `id` int(10) UNSIGNED NOT NULL,
  `package_id` int(11) NOT NULL,
  `origin` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `destination` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `airline` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cabin` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `information` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `flight_deals`
--

INSERT INTO `flight_deals` (`id`, `package_id`, `origin`, `destination`, `date`, `airline`, `cabin`, `information`, `created_at`, `updated_at`) VALUES
(1, 1, 'CMN - Casablanca-Mohammed V, Morocco', 'HKG - Hong Kong-Hong Kong Intl, Hong Kong', '04-07-2021', 'Emirates Airlines', 'Y', 'kkkkk', '2021-01-29 13:37:53', '2021-01-29 13:37:53');

-- --------------------------------------------------------

--
-- Structure de la table `galleries`
--

CREATE TABLE `galleries` (
  `id` int(10) UNSIGNED NOT NULL,
  `image_type_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `package_id` int(11) DEFAULT NULL,
  `image_path` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `genders`
--

CREATE TABLE `genders` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `genders`
--

INSERT INTO `genders` (`id`, `type`, `created_at`, `updated_at`) VALUES
(1, 'Male', '2021-01-28 09:16:31', '2021-01-28 09:16:31'),
(2, 'Female', '2021-01-28 09:16:31', '2021-01-28 09:16:31');

-- --------------------------------------------------------

--
-- Structure de la table `good_to_knows`
--

CREATE TABLE `good_to_knows` (
  `id` int(10) UNSIGNED NOT NULL,
  `package_id` int(11) DEFAULT NULL,
  `check_in` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `check_out` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cancellation_prepayment` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `children_beds` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `internet` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pets` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `groups` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `hotels`
--

CREATE TABLE `hotels` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `hotel_bookings`
--

CREATE TABLE `hotel_bookings` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `reference` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pnr` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hotel_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hotel_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hotel_city_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hotel_chain_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hotel_context_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `room_booking_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate_plan_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guarantee` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `adult_guest` int(11) NOT NULL,
  `child_guest` int(11) NOT NULL,
  `check_in_date` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `check_out_date` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `base_amount` bigint(20) NOT NULL,
  `vat` bigint(20) NOT NULL,
  `markup` bigint(20) NOT NULL,
  `markdown` bigint(20) NOT NULL,
  `voucher_id` bigint(20) NOT NULL,
  `voucher_amount` bigint(20) NOT NULL,
  `total_amount` bigint(20) NOT NULL,
  `expiry_date` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_status` int(11) NOT NULL DEFAULT 0,
  `reservation_status` int(11) NOT NULL DEFAULT 0,
  `cancellation_status` int(11) NOT NULL DEFAULT 0,
  `pnr_request_response` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `hotel_deals`
--

CREATE TABLE `hotel_deals` (
  `id` int(10) UNSIGNED NOT NULL,
  `package_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `star_rating` int(11) NOT NULL,
  `stay_start_date` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stay_duration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stay_end_date` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `information` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `languages`
--

CREATE TABLE `languages` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `native_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_default` int(11) NOT NULL,
  `is_active` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `languages`
--

INSERT INTO `languages` (`id`, `name`, `native_name`, `code`, `is_default`, `is_active`, `created_at`, `updated_at`) VALUES
(7, 'Arabic', 'العربية', 'ar', 0, 0, '2020-04-02 00:20:54', '2020-04-02 00:20:54'),
(30, 'Chinese', '中文 (Zhōngwén), 汉语, 漢語', 'zh', 0, 0, '2020-04-02 00:20:54', '2020-04-02 00:20:54'),
(40, 'English', 'English', 'en', 0, 1, '2020-04-02 00:20:54', '2021-01-06 14:37:39'),
(47, 'French', 'français, langue française', 'fr', 1, 1, '2020-04-02 00:20:54', '2021-01-06 14:37:39'),
(51, 'German', 'Deutsch', 'de', 0, 0, '2020-04-02 00:20:54', '2020-04-02 00:20:54'),
(72, 'Japanese', '日本語 (にほんご／にっぽんご)', 'ja', 0, 0, '2020-04-02 00:20:54', '2020-04-02 00:20:54'),
(85, 'Korean', '한국어 (韓國語), 조선말 (朝鮮語)', 'ko', 0, 0, '2020-04-02 00:20:54', '2020-04-02 00:20:54'),
(126, 'Polish', 'polski', 'pl', 0, 0, '2020-04-02 00:20:54', '2020-04-02 00:20:54'),
(128, 'Portuguese', 'Português', 'pt', 0, 0, '2020-04-02 00:20:54', '2020-04-02 00:20:54'),
(133, 'Russian', 'русский язык', 'ru', 0, 0, '2020-04-02 00:20:54', '2020-04-02 00:20:54'),
(163, 'Turkish', 'Türkçe', 'tr', 0, 0, '2020-04-02 00:20:54', '2020-04-02 00:20:54');

-- --------------------------------------------------------

--
-- Structure de la table `ltm_translations`
--

CREATE TABLE `ltm_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `locale` varchar(191) COLLATE utf8mb4_bin NOT NULL,
  `group` varchar(191) COLLATE utf8mb4_bin NOT NULL,
  `key` text COLLATE utf8mb4_bin NOT NULL,
  `value` text COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `ltm_translations`
--

INSERT INTO `ltm_translations` (`id`, `status`, `locale`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1, 0, 'en', 'auth', 'failed', 'These credentials do not match our records.', '2021-01-28 14:04:43', '2021-01-29 08:50:47'),
(2, 0, 'en', 'auth', 'throttle', 'Too many login attempts. Please try again in :seconds seconds.', '2021-01-28 14:04:43', '2021-01-29 08:50:47'),
(3, 0, 'en', 'pagination', 'previous', '&laquo; Previous', '2021-01-28 14:04:43', '2021-05-27 09:37:52'),
(4, 0, 'en', 'pagination', 'next', 'Next &raquo;', '2021-01-28 14:04:43', '2021-05-27 09:37:52'),
(5, 0, 'en', 'passwords', 'password', 'Passwords must be at least six characters and match the confirmation.', '2021-01-28 14:04:43', '2021-05-27 09:39:28'),
(6, 0, 'en', 'passwords', 'reset', 'Your password has been reset!', '2021-01-28 14:04:43', '2021-05-27 09:39:28'),
(7, 0, 'en', 'passwords', 'sent', 'We have e-mailed your password reset link!', '2021-01-28 14:04:43', '2021-05-27 09:39:28'),
(8, 0, 'en', 'passwords', 'token', 'This password reset token is invalid.', '2021-01-28 14:04:43', '2021-05-27 09:39:28'),
(9, 0, 'en', 'passwords', 'user', 'We can\'t find a user with that e-mail address.', '2021-01-28 14:04:43', '2021-05-27 09:39:28'),
(10, 0, 'en', 'validation', 'accepted', 'The :attribute must be accepted.', '2021-01-28 14:04:43', '2021-01-29 08:50:47'),
(11, 0, 'en', 'validation', 'active_url', 'The :attribute is not a valid URL.', '2021-01-28 14:04:43', '2021-01-29 08:50:47'),
(12, 0, 'en', 'validation', 'after', 'The :attribute must be a date after :date.', '2021-01-28 14:04:43', '2021-01-29 08:50:47'),
(13, 0, 'en', 'validation', 'after_or_equal', 'The :attribute must be a date after or equal to :date.', '2021-01-28 14:04:43', '2021-01-29 08:50:47'),
(14, 0, 'en', 'validation', 'alpha', 'The :attribute may only contain letters.', '2021-01-28 14:04:43', '2021-01-29 08:50:47'),
(15, 0, 'en', 'validation', 'alpha_dash', 'The :attribute may only contain letters, numbers, and dashes.', '2021-01-28 14:04:43', '2021-01-29 08:50:47'),
(16, 0, 'en', 'validation', 'alpha_num', 'The :attribute may only contain letters and numbers.', '2021-01-28 14:04:43', '2021-01-29 08:50:47'),
(17, 0, 'en', 'validation', 'array', 'The :attribute must be an array.', '2021-01-28 14:04:43', '2021-01-29 08:50:47'),
(18, 0, 'en', 'validation', 'before', 'The :attribute must be a date before :date.', '2021-01-28 14:04:43', '2021-01-29 08:50:47'),
(19, 0, 'en', 'validation', 'before_or_equal', 'The :attribute must be a date before or equal to :date.', '2021-01-28 14:04:43', '2021-01-29 08:50:47'),
(20, 0, 'en', 'validation', 'between.numeric', 'The :attribute must be between :min and :max.', '2021-01-28 14:04:43', '2021-01-29 08:50:47'),
(21, 0, 'en', 'validation', 'between.file', 'The :attribute must be between :min and :max kilobytes.', '2021-01-28 14:04:43', '2021-01-29 08:50:47'),
(22, 0, 'en', 'validation', 'between.string', 'The :attribute must be between :min and :max characters.', '2021-01-28 14:04:43', '2021-01-29 08:50:47'),
(23, 0, 'en', 'validation', 'between.array', 'The :attribute must have between :min and :max items.', '2021-01-28 14:04:43', '2021-01-29 08:50:47'),
(24, 0, 'en', 'validation', 'boolean', 'The :attribute field must be true or false.', '2021-01-28 14:04:43', '2021-01-29 08:50:47'),
(25, 0, 'en', 'validation', 'confirmed', 'The :attribute confirmation does not match.', '2021-01-28 14:04:43', '2021-01-29 08:50:47'),
(26, 0, 'en', 'validation', 'date', 'The :attribute is not a valid date.', '2021-01-28 14:04:43', '2021-01-29 08:50:47'),
(27, 0, 'en', 'validation', 'date_format', 'The :attribute does not match the format :format.', '2021-01-28 14:04:43', '2021-01-29 08:50:47'),
(28, 0, 'en', 'validation', 'different', 'The :attribute and :other must be different.', '2021-01-28 14:04:43', '2021-01-29 08:50:47'),
(29, 0, 'en', 'validation', 'digits', 'The :attribute must be :digits digits.', '2021-01-28 14:04:43', '2021-01-29 08:50:47'),
(30, 0, 'en', 'validation', 'digits_between', 'The :attribute must be between :min and :max digits.', '2021-01-28 14:04:43', '2021-01-29 08:50:47'),
(31, 0, 'en', 'validation', 'dimensions', 'The :attribute has invalid image dimensions.', '2021-01-28 14:04:43', '2021-01-29 08:50:47'),
(32, 0, 'en', 'validation', 'distinct', 'The :attribute field has a duplicate value.', '2021-01-28 14:04:43', '2021-01-29 08:50:47'),
(33, 0, 'en', 'validation', 'email', 'The :attribute must be a valid email address.', '2021-01-28 14:04:43', '2021-01-29 08:50:47'),
(34, 0, 'en', 'validation', 'exists', 'The selected :attribute is invalid.', '2021-01-28 14:04:43', '2021-01-29 08:50:47'),
(35, 0, 'en', 'validation', 'file', 'The :attribute must be a file.', '2021-01-28 14:04:43', '2021-01-29 08:50:47'),
(36, 0, 'en', 'validation', 'filled', 'The :attribute field must have a value.', '2021-01-28 14:04:43', '2021-01-29 08:50:47'),
(37, 0, 'en', 'validation', 'image', 'The :attribute must be an image.', '2021-01-28 14:04:43', '2021-01-29 08:50:47'),
(38, 0, 'en', 'validation', 'in', 'The selected :attribute is invalid.', '2021-01-28 14:04:43', '2021-01-29 08:50:47'),
(39, 0, 'en', 'validation', 'in_array', 'The :attribute field does not exist in :other.', '2021-01-28 14:04:43', '2021-01-29 08:50:47'),
(40, 0, 'en', 'validation', 'integer', 'The :attribute must be an integer.', '2021-01-28 14:04:43', '2021-01-29 08:50:47'),
(41, 0, 'en', 'validation', 'ip', 'The :attribute must be a valid IP address.', '2021-01-28 14:04:43', '2021-01-29 08:50:47'),
(42, 0, 'en', 'validation', 'ipv4', 'The :attribute must be a valid IPv4 address.', '2021-01-28 14:04:43', '2021-01-29 08:50:47'),
(43, 0, 'en', 'validation', 'ipv6', 'The :attribute must be a valid IPv6 address.', '2021-01-28 14:04:43', '2021-01-29 08:50:47'),
(44, 0, 'en', 'validation', 'json', 'The :attribute must be a valid JSON string.', '2021-01-28 14:04:43', '2021-01-29 08:50:47'),
(45, 0, 'en', 'validation', 'max.numeric', 'The :attribute may not be greater than :max.', '2021-01-28 14:04:43', '2021-01-29 08:50:47'),
(46, 0, 'en', 'validation', 'max.file', 'The :attribute may not be greater than :max kilobytes.', '2021-01-28 14:04:43', '2021-01-29 08:50:47'),
(47, 0, 'en', 'validation', 'max.string', 'The :attribute may not be greater than :max characters.', '2021-01-28 14:04:43', '2021-01-29 08:50:47'),
(48, 0, 'en', 'validation', 'max.array', 'The :attribute may not have more than :max items.', '2021-01-28 14:04:43', '2021-01-29 08:50:47'),
(49, 0, 'en', 'validation', 'mimes', 'The :attribute must be a file of type: :values.', '2021-01-28 14:04:43', '2021-01-29 08:50:47'),
(50, 0, 'en', 'validation', 'mimetypes', 'The :attribute must be a file of type: :values.', '2021-01-28 14:04:43', '2021-01-29 08:50:47'),
(51, 0, 'en', 'validation', 'min.numeric', 'The :attribute must be at least :min.', '2021-01-28 14:04:43', '2021-01-29 08:50:47'),
(52, 0, 'en', 'validation', 'min.file', 'The :attribute must be at least :min kilobytes.', '2021-01-28 14:04:43', '2021-01-29 08:50:47'),
(53, 0, 'en', 'validation', 'min.string', 'The :attribute must be at least :min characters.', '2021-01-28 14:04:43', '2021-01-29 08:50:47'),
(54, 0, 'en', 'validation', 'min.array', 'The :attribute must have at least :min items.', '2021-01-28 14:04:44', '2021-01-29 08:50:47'),
(55, 0, 'en', 'validation', 'not_in', 'The selected :attribute is invalid.', '2021-01-28 14:04:44', '2021-01-29 08:50:47'),
(56, 0, 'en', 'validation', 'not_regex', 'The :attribute format is invalid.', '2021-01-28 14:04:44', '2021-01-29 08:50:47'),
(57, 0, 'en', 'validation', 'numeric', 'The :attribute must be a number.', '2021-01-28 14:04:44', '2021-01-29 08:50:47'),
(58, 0, 'en', 'validation', 'present', 'The :attribute field must be present.', '2021-01-28 14:04:44', '2021-01-29 08:50:47'),
(59, 0, 'en', 'validation', 'regex', 'The :attribute format is invalid.', '2021-01-28 14:04:44', '2021-01-29 08:50:47'),
(60, 0, 'en', 'validation', 'required', 'The :attribute field is required.', '2021-01-28 14:04:44', '2021-01-29 08:50:47'),
(61, 0, 'en', 'validation', 'required_if', 'The :attribute field is required when :other is :value.', '2021-01-28 14:04:44', '2021-01-29 08:50:47'),
(62, 0, 'en', 'validation', 'required_unless', 'The :attribute field is required unless :other is in :values.', '2021-01-28 14:04:44', '2021-01-29 08:50:47'),
(63, 0, 'en', 'validation', 'required_with', 'The :attribute field is required when :values is present.', '2021-01-28 14:04:44', '2021-01-29 08:50:47'),
(64, 0, 'en', 'validation', 'required_with_all', 'The :attribute field is required when :values is present.', '2021-01-28 14:04:44', '2021-01-29 08:50:47'),
(65, 0, 'en', 'validation', 'required_without', 'The :attribute field is required when :values is not present.', '2021-01-28 14:04:44', '2021-01-29 08:50:47'),
(66, 0, 'en', 'validation', 'required_without_all', 'The :attribute field is required when none of :values are present.', '2021-01-28 14:04:44', '2021-01-29 08:50:47'),
(67, 0, 'en', 'validation', 'same', 'The :attribute and :other must match.', '2021-01-28 14:04:44', '2021-01-29 08:50:47'),
(68, 0, 'en', 'validation', 'size.numeric', 'The :attribute must be :size.', '2021-01-28 14:04:44', '2021-01-29 08:50:47'),
(69, 0, 'en', 'validation', 'size.file', 'The :attribute must be :size kilobytes.', '2021-01-28 14:04:44', '2021-01-29 08:50:47'),
(70, 0, 'en', 'validation', 'size.string', 'The :attribute must be :size characters.', '2021-01-28 14:04:44', '2021-01-29 08:50:47'),
(71, 0, 'en', 'validation', 'size.array', 'The :attribute must contain :size items.', '2021-01-28 14:04:44', '2021-01-29 08:50:47'),
(72, 0, 'en', 'validation', 'string', 'The :attribute must be a string.', '2021-01-28 14:04:44', '2021-01-29 08:50:47'),
(73, 0, 'en', 'validation', 'timezone', 'The :attribute must be a valid zone.', '2021-01-28 14:04:44', '2021-01-29 08:50:47'),
(74, 0, 'en', 'validation', 'unique', 'The :attribute has already been taken.', '2021-01-28 14:04:44', '2021-01-29 08:50:47'),
(75, 0, 'en', 'validation', 'uploaded', 'The :attribute failed to upload.', '2021-01-28 14:04:44', '2021-01-29 08:50:47'),
(76, 0, 'en', 'validation', 'url', 'The :attribute format is invalid.', '2021-01-28 14:04:44', '2021-01-29 08:50:47'),
(77, 0, 'en', 'validation', 'custom.attribute-name.rule-name', 'custom-message', '2021-01-28 14:04:44', '2021-01-29 08:50:47'),
(78, 0, 'en', '_json', 'Translations', 'TRANSLATIONS', '2021-01-28 14:18:08', '2021-05-31 14:58:52'),
(79, 0, 'en', '_json', 'Settings', 'SETTINGS', '2021-01-28 14:25:15', '2021-05-31 14:58:52'),
(80, 0, 'en', '_json', 'Vats', 'VATS', '2021-01-28 14:25:15', '2021-05-31 14:58:52'),
(81, 0, 'en', '_json', 'Markups', 'MARKUPS', '2021-01-28 14:25:15', '2021-05-31 14:58:52'),
(82, 0, 'en', '_json', 'Markdowns', 'MARKDOWNS', '2021-01-28 14:25:15', '2021-05-31 14:58:52'),
(83, 0, 'en', '_json', 'Banks', 'BANKS', '2021-01-28 14:25:15', '2021-05-31 14:58:52'),
(84, 0, 'en', '_json', 'Users Management', 'USERS MANAGEMENT', '2021-01-28 14:25:15', '2021-05-31 14:58:52'),
(85, 0, 'en', '_json', 'Email Subscribers', 'EMAIL SUBSCRIBERS', '2021-01-28 14:25:15', '2021-05-31 14:58:52'),
(86, 0, 'en', '_json', 'Visa Applications', 'VISA APPLICATIONS', '2021-01-28 14:25:15', '2021-05-31 14:58:52'),
(87, 0, 'en', '_json', 'Wallets Management', 'WALLETS MANAGEMENT', '2021-01-28 14:25:15', '2021-05-31 14:58:52'),
(88, 0, 'en', '_json', 'New Customer', 'NEW CUSTOMER', '2021-01-29 10:43:26', '2021-05-31 14:58:52'),
(89, 0, 'en', '_json', 'Create Customer', 'CREATE CUSTOMER', '2021-01-29 10:43:26', '2021-05-31 14:58:52'),
(90, 0, 'en', '_json', 'Name', 'NAME', '2021-01-29 10:43:26', '2021-05-31 14:58:52'),
(91, 0, 'en', '_json', 'Company Name', 'COMPANY NAME', '2021-01-29 10:43:26', '2021-05-31 14:58:52'),
(92, 0, 'en', '_json', 'Email', 'EMAIL', '2021-01-29 10:43:26', '2021-05-31 14:58:52'),
(93, 0, 'en', '_json', 'Phone Number', 'PHONE NUMBER', '2021-01-29 10:43:26', '2021-05-31 14:58:52'),
(94, 0, 'en', '_json', 'Tax Number', 'TAX NUMBER', '2021-01-29 10:43:26', '2021-05-31 14:58:52'),
(95, 0, 'en', '_json', 'Address', 'ADDRESS', '2021-01-29 10:43:26', '2021-05-31 14:58:52'),
(96, 0, 'en', '_json', 'Postal Code', 'POSTAL CODE', '2021-01-29 10:43:26', '2021-05-31 14:58:52'),
(97, 0, 'en', '_json', 'City', 'CITY', '2021-01-29 10:43:26', '2021-05-31 14:58:52'),
(98, 0, 'en', '_json', 'Country', 'COUNTRY', '2021-01-29 10:43:26', '2021-05-31 14:58:52'),
(99, 0, 'en', '_json', 'Save', 'SAVE', '2021-01-29 10:43:26', '2021-05-31 14:58:52'),
(100, 0, 'en', '_json', 'Back', 'BACK', '2021-01-29 10:43:26', '2021-05-31 14:58:52'),
(101, 0, 'en', '_json', 'Edit Customer', 'EDIT CUSTOMER', '2021-01-29 10:43:26', '2021-05-31 14:58:52'),
(102, 0, 'en', '_json', 'Update', 'UPDATE', '2021-01-29 10:43:26', '2021-05-31 14:58:52'),
(103, 0, 'en', '_json', 'Customers List', 'CUSTOMERS LIST', '2021-01-29 10:43:26', '2021-05-31 14:58:52'),
(104, 0, 'en', '_json', 'Customers', 'CUSTOMERS', '2021-01-29 10:43:26', '2021-05-31 14:58:52'),
(105, 0, 'en', '_json', 'Add New Customer', 'ADD NEW CUSTOMER', '2021-01-29 10:43:26', '2021-05-31 14:58:52'),
(106, 0, 'en', '_json', 'Company name', 'COMPANY NAME', '2021-01-29 10:43:26', '2021-05-31 14:58:52'),
(107, 0, 'en', '_json', 'Phone', 'Phone', '2021-01-29 10:43:26', '2021-05-31 14:58:52'),
(108, 0, 'en', '_json', 'Created at', 'CREATED AT', '2021-01-29 10:43:26', '2021-05-31 14:58:52'),
(109, 0, 'en', '_json', 'Edit', 'EDIT', '2021-01-29 10:43:26', '2021-05-31 14:58:52'),
(110, 0, 'en', '_json', 'Delete', 'DELETE', '2021-01-29 10:43:26', '2021-05-31 14:58:52'),
(111, 0, 'en', '_json', 'New Purchase', 'NEW PURCHASE', '2021-01-29 10:43:26', '2021-05-31 14:58:52'),
(112, 0, 'en', '_json', 'Reference no', 'REFERENCE NO', '2021-01-29 10:43:26', '2021-05-31 14:58:52'),
(113, 0, 'en', '_json', 'Supplier', 'SUPPLIER', '2021-01-29 10:43:26', '2021-05-31 14:58:52'),
(114, 0, 'en', '_json', 'User', 'USER', '2021-01-29 10:43:26', '2021-05-31 14:58:52'),
(115, 0, 'en', '_json', 'Select user', 'SELECT USER', '2021-01-29 10:43:26', '2021-05-31 14:58:52'),
(116, 0, 'en', '_json', 'Product', 'PRODUCT', '2021-01-29 10:43:26', '2021-05-31 14:58:52'),
(117, 0, 'en', '_json', 'Qty', 'QTY', '2021-01-29 10:43:26', '2021-05-31 14:58:52'),
(118, 0, 'en', '_json', 'Price', 'PRICE', '2021-01-29 10:43:26', '2021-05-31 14:58:52'),
(119, 0, 'en', '_json', 'Total', 'TOTAL', '2021-01-29 10:43:26', '2021-05-31 14:58:52'),
(120, 0, 'en', '_json', 'Enter Product Name', 'ENTER PRODUCT NAME', '2021-01-29 10:43:26', '2021-05-31 14:58:52'),
(121, 0, 'en', '_json', 'Enter Qty', 'ENTER QTY', '2021-01-29 10:43:26', '2021-05-31 14:58:52'),
(122, 0, 'en', '_json', 'Enter Unit Price', 'ENTER UNIT PRICE', '2021-01-29 10:43:26', '2021-05-31 14:58:52'),
(123, 0, 'en', '_json', 'Add Row', 'ADD ROW', '2021-01-29 10:43:26', '2021-05-31 14:58:52'),
(124, 0, 'en', '_json', 'Delete Row', 'DELETE ROW', '2021-01-29 10:43:26', '2021-05-31 14:58:52'),
(125, 0, 'en', '_json', 'Sub Total', 'SUB TOTAL', '2021-01-29 10:43:26', '2021-05-31 14:58:52'),
(126, 0, 'en', '_json', 'Tax', 'TAX', '2021-01-29 10:43:26', '2021-05-31 14:58:52'),
(127, 0, 'en', '_json', 'Tax Amount', 'TAX AMOUNT', '2021-01-29 10:43:26', '2021-05-31 14:58:52'),
(128, 0, 'en', '_json', 'Grand Total', 'GRAND TOTAL', '2021-01-29 10:43:26', '2021-05-31 14:58:52'),
(129, 0, 'en', '_json', 'Sale Status', 'SALE STATUS', '2021-01-29 10:43:26', '2021-05-31 14:58:52'),
(130, 0, 'en', '_json', 'Completed', 'COMPLETED', '2021-01-29 10:43:26', '2021-05-31 14:58:52'),
(131, 0, 'en', '_json', 'Pending', 'PENDING', '2021-01-29 10:43:26', '2021-05-31 14:58:52'),
(132, 0, 'en', '_json', 'Payment Status', 'PAYMENT STATUS', '2021-01-29 10:43:26', '2021-05-31 14:58:52'),
(133, 0, 'en', '_json', 'Due', 'DUE', '2021-01-29 10:43:26', '2021-05-31 14:58:52'),
(134, 0, 'en', '_json', 'Partial', 'PARTIAL', '2021-01-29 10:43:26', '2021-05-31 14:58:52'),
(135, 0, 'en', '_json', 'Paid', 'PAID', '2021-01-29 10:43:26', '2021-05-31 14:58:52'),
(136, 0, 'en', '_json', 'Paid By', 'PAID BY', '2021-01-29 10:43:26', '2021-05-31 14:58:52'),
(137, 0, 'en', '_json', 'Cash', 'CASH', '2021-01-29 10:43:26', '2021-05-31 14:58:52'),
(138, 0, 'en', '_json', 'Cheque', 'CHEQUE', '2021-01-29 10:43:26', '2021-05-31 14:58:52'),
(139, 0, 'en', '_json', 'Deposit', 'DEPOSIT', '2021-01-29 10:43:26', '2021-05-31 14:58:52'),
(140, 0, 'en', '_json', 'Attach Document', 'ATTACH DOCUMENT', '2021-01-29 10:43:26', '2021-05-31 14:58:52'),
(141, 0, 'en', '_json', 'Total Amount', 'TOTAL AMOUNT', '2021-01-29 10:43:26', '2021-05-31 14:58:52'),
(142, 0, 'en', '_json', 'Paying Amount', 'PAYING AMOUNT', '2021-01-29 10:43:26', '2021-05-31 14:58:52'),
(143, 0, 'en', '_json', 'Change', 'CHANGE', '2021-01-29 10:43:26', '2021-05-31 14:58:52'),
(144, 0, 'en', '_json', 'Purchase Note', 'PURCHASE NOTE', '2021-01-29 10:43:26', '2021-05-31 14:58:52'),
(145, 0, 'en', '_json', 'Edit Purchase', 'EDIT PURCHASE', '2021-01-29 10:43:26', '2021-05-31 14:58:52'),
(146, 0, 'en', '_json', 'Total amount', 'TOTAL AMOUNT', '2021-01-29 10:43:26', '2021-05-31 14:58:52'),
(147, 0, 'en', '_json', 'Purchases', 'PURCHASES', '2021-01-29 10:43:26', '2021-05-31 14:58:52'),
(148, 0, 'en', '_json', 'Add New Purchase', 'ADD NEW PURCHASE', '2021-01-29 10:43:26', '2021-05-31 14:58:52'),
(149, 0, 'en', '_json', 'Status', 'STATUS', '2021-01-29 10:43:26', '2021-05-31 14:58:52'),
(150, 0, 'en', '_json', 'Grand total', 'GRAND TOTAL', '2021-01-29 10:43:26', '2021-05-31 14:58:52'),
(151, 0, 'en', '_json', 'Payment status', 'PAYMENT STATUS', '2021-01-29 10:43:26', '2021-05-31 14:58:52'),
(152, 0, 'en', '_json', 'Create Sale', 'CREATE SALE', '2021-01-29 10:43:26', '2021-05-31 14:58:52'),
(153, 0, 'en', '_json', 'Customer', 'CUSTOMER', '2021-01-29 10:43:26', '2021-05-31 14:58:52'),
(154, 0, 'en', '_json', 'Select Customer', 'SELECT CUSTOMER', '2021-01-29 10:43:26', '2021-05-31 14:58:52'),
(155, 0, 'en', '_json', 'Select Supplier', 'SELECT SUPPLIER', '2021-01-29 10:43:26', '2021-05-31 14:58:52'),
(156, 0, 'en', '_json', 'Recieved Amount', 'RECIEVED AMOUNT', '2021-01-29 10:43:26', '2021-05-31 14:58:52'),
(157, 0, 'en', '_json', 'Payment Note', 'PAYMENT NOTE', '2021-01-29 10:43:26', '2021-05-31 14:58:52'),
(158, 0, 'en', '_json', 'Sale Note', 'SALE NOTE', '2021-01-29 10:43:26', '2021-05-31 14:58:52'),
(159, 0, 'en', '_json', 'Staff Note', 'STAFF NOTE', '2021-01-29 10:43:26', '2021-05-31 14:58:52'),
(160, 0, 'en', '_json', 'Edit Sale', 'EDIT SALE', '2021-01-29 10:43:26', '2021-05-31 14:58:52'),
(161, 0, 'en', '_json', 'Sales', 'SALES', '2021-01-29 10:43:26', '2021-05-31 14:58:52'),
(162, 0, 'en', '_json', 'Add New Sale', 'ADD NEW SALE', '2021-01-29 10:43:26', '2021-05-31 14:58:52'),
(163, 0, 'en', '_json', 'Booking ID', 'BOOKING ID', '2021-01-29 10:43:26', '2021-05-31 14:58:52'),
(164, 0, 'en', '_json', 'Booking Type', 'BOOKING TYPE', '2021-01-29 10:43:26', '2021-05-31 14:58:52'),
(165, 0, 'en', '_json', 'Create Supplier', 'CREATE SUPPLIER', '2021-01-29 10:43:26', '2021-05-31 14:58:52'),
(166, 0, 'en', '_json', 'Edit Supplier', 'EDIT SUPPLIER', '2021-01-29 10:43:26', '2021-05-31 14:58:52'),
(167, 0, 'en', '_json', 'Suppliers', 'SUPPLIERS', '2021-01-29 10:43:26', '2021-05-31 14:58:52'),
(168, 0, 'en', '_json', 'Add New Supplier', 'ADD NEW SUPPLIER', '2021-01-29 10:43:26', '2021-05-31 14:58:52'),
(169, 0, 'en', '_json', 'Supplier Name', 'SUPPLIER NAME', '2021-01-29 10:43:26', '2021-05-31 14:58:52'),
(170, 0, 'en', '_json', 'Supplier Company', 'SUPPLIER COMPANY', '2021-01-29 10:43:26', '2021-05-31 14:58:52'),
(171, 0, 'en', '_json', 'Language', 'LANGUAGE', '2021-01-29 10:43:26', '2021-05-31 14:58:52'),
(172, 0, 'en', '_json', 'Create New Purchase', 'CREATE NEW PURCHASE', '2021-01-29 15:41:41', '2021-05-31 14:58:52'),
(173, 0, 'en', '_json', 'Create New Sale', 'CREATE NEW SALE', '2021-01-29 15:41:41', '2021-05-31 14:58:52'),
(174, 0, 'en', '_json', 'Create User', 'CREATE USER', '2021-01-29 15:41:41', '2021-05-31 14:58:52'),
(175, 0, 'en', '_json', 'Close', 'CLOSE', '2021-01-29 15:41:41', '2021-05-31 14:58:52'),
(176, 0, 'en', '_json', 'Create New Supplier', 'CREATE NEW SUPPLIER', '2021-01-29 15:41:41', '2021-05-31 14:58:52'),
(177, 0, 'en', '_json', 'Action', 'ACTION', '2021-01-29 15:41:41', '2021-05-31 14:58:52'),
(178, 0, 'en', '_json', 'Travel Packages', 'TRAVEL PACKAGES', '2021-01-29 15:41:41', '2021-05-31 14:58:52'),
(179, 0, 'en', '_json', 'Continue(Save Package)', 'CONTINUE(SAVE PACKAGE)', '2021-01-29 15:41:41', '2021-05-31 14:58:52'),
(180, 0, 'en', '_json', 'Attraction', 'ATTRACTION', '2021-01-29 15:41:41', '2021-05-31 14:58:52'),
(181, 0, 'en', '_json', 'Attraction Name', 'ATTRACTION NAME', '2021-01-29 15:41:41', '2021-05-31 14:58:52'),
(182, 0, 'en', '_json', 'Attraction City', 'ATTRACTION CITY', '2021-01-29 15:41:41', '2021-05-31 14:58:52'),
(183, 0, 'en', '_json', 'Attraction Date', 'ATTRACTION DATE', '2021-01-29 15:41:41', '2021-05-31 14:58:52'),
(184, 0, 'en', '_json', 'Location Description', 'LOCATION DESCRIPTION', '2021-01-29 15:41:41', '2021-05-31 14:58:52'),
(185, 0, 'en', '_json', 'Attraction Additional Information', 'ATTRACTION ADDITIONAL INFORMATION', '2021-01-29 15:41:41', '2021-05-31 14:58:52'),
(186, 0, 'en', '_json', 'Sight Seeings', 'SIGHT SEEINGS', '2021-01-29 15:41:41', '2021-05-31 14:58:52'),
(187, 0, 'en', '_json', 'Add More Sight Seeing', 'ADD MORE SIGHT SEEING', '2021-01-29 15:41:41', '2021-05-31 14:58:52'),
(188, 0, 'en', '_json', 'Sight Seeing Title', 'SIGHT SEEING TITLE', '2021-01-29 15:41:41', '2021-05-31 14:58:52'),
(189, 0, 'en', '_json', 'Sight Seeing Description', 'SIGHT SEEING DESCRIPTION', '2021-01-29 15:41:41', '2021-05-31 14:58:52'),
(190, 0, 'en', '_json', 'Continue (Save Attraction)', 'CONTINUE (SAVE ATTRACTION)', '2021-01-29 15:41:41', '2021-05-31 14:58:52'),
(191, 0, 'en', '_json', 'Attraction Gallery', 'ATTRACTION GALLERY', '2021-01-29 15:41:41', '2021-05-31 14:58:52'),
(192, 0, 'en', '_json', 'Drag and Drop or Click On Box to Select Multiple Images', 'DRAG AND DROP OR CLICK ON BOX TO SELECT MULTIPLE IMAGES', '2021-01-29 15:41:41', '2021-05-31 14:58:52'),
(193, 0, 'en', '_json', 'Continue', 'CONTINUE', '2021-01-29 15:41:41', '2021-05-31 14:58:52'),
(194, 0, 'en', '_json', 'Create New Package', 'CREATE NEW PACKAGE', '2021-01-29 15:41:41', '2021-05-31 14:58:52'),
(195, 0, 'en', '_json', 'Package type', 'PACKAGE TYPE', '2021-01-29 15:41:42', '2021-05-31 14:58:52'),
(196, 0, 'en', '_json', 'Package category', 'PACKAGE CATEGORY', '2021-01-29 15:41:42', '2021-05-31 14:58:52'),
(197, 0, 'en', '_json', 'Package name', 'PACKAGE NAME', '2021-01-29 15:41:42', '2021-05-31 14:58:52'),
(198, 0, 'en', '_json', 'Phone number', 'PHONE NUMBER', '2021-01-29 15:41:42', '2021-05-31 14:58:52'),
(199, 0, 'en', '_json', 'Adult price', 'ADULT PRICE', '2021-01-29 15:41:42', '2021-05-31 14:58:52'),
(200, 0, 'en', '_json', 'Children price', 'CHILDREN PRICE', '2021-01-29 15:41:42', '2021-05-31 14:58:52'),
(201, 0, 'en', '_json', 'Infants price', 'INFANTS PRICE', '2021-01-29 15:41:42', '2021-05-31 14:58:52'),
(202, 0, 'en', '_json', 'Flight', 'FLIGHT', '2021-01-29 15:41:42', '2021-05-31 14:58:52'),
(203, 0, 'en', '_json', 'Hotel', 'HOTEL', '2021-01-29 15:41:42', '2021-05-31 14:58:52'),
(204, 0, 'en', '_json', 'Deactivated', 'DEACTIVATED', '2021-01-29 15:41:42', '2021-05-31 14:58:52'),
(205, 0, 'en', '_json', 'Activated', 'ACTIVATED', '2021-01-29 15:41:42', '2021-05-31 14:58:52'),
(206, 0, 'en', '_json', 'Add sight seeing', 'ADD SIGHT SEEING', '2021-01-29 15:41:42', '2021-05-31 14:58:52'),
(207, 0, 'en', '_json', 'Confirmation', 'CONFIRMATION', '2021-01-29 15:41:42', '2021-05-31 14:58:52'),
(208, 0, 'en', '_json', 'Flight Information', 'FLIGHT INFORMATION', '2021-01-29 15:41:42', '2021-05-31 14:58:52'),
(209, 0, 'en', '_json', 'Are you sure', 'ARE YOU SURE', '2021-01-29 15:41:42', '2021-05-31 14:58:52'),
(210, 0, 'en', '_json', 'Booking Confirmation', 'BOOKING CONFIRMATION', '2021-01-29 15:41:42', '2021-05-31 14:58:52'),
(211, 0, 'en', '_json', 'Inclusion', 'INCLUSION', '2021-01-29 15:41:42', '2021-05-31 14:58:52'),
(212, 0, 'en', '_json', 'Exclusion', 'EXCLUSION', '2021-01-29 15:41:42', '2021-05-31 14:58:52'),
(213, 0, 'en', '_json', 'KNOW MORE', 'KNOW MORE', '2021-01-29 15:41:42', '2021-05-31 14:58:52'),
(214, 0, 'en', '_json', 'LAST MINUTE DEALS', 'LAST MINUTE DEALS', '2021-01-29 15:41:42', '2021-05-31 14:58:52'),
(215, 0, 'en', '_json', 'SAVE MORE', 'SAVE MORE', '2021-01-29 15:41:42', '2021-05-31 14:58:52'),
(216, 0, 'en', '_json', 'Starting From', 'STARTING FROM', '2021-01-29 15:41:42', '2021-05-31 14:58:52'),
(217, 0, 'en', '_json', 'VIEW DETAIL', 'VIEW DETAIL', '2021-01-29 15:41:42', '2021-05-31 14:58:52'),
(218, 0, 'en', '_json', 'Home Settings', 'HOME SETTINGS', '2021-01-29 15:41:42', '2021-05-31 14:58:52'),
(219, 0, 'en', '_json', 'Login', 'LOGIN', '2021-01-30 08:59:38', '2021-05-31 14:58:52'),
(220, 0, 'en', '_json', 'Oh snap!', 'OH SNAP!', '2021-01-30 08:59:38', '2021-05-31 14:58:52'),
(221, 0, 'en', '_json', 'Login with', 'LOGIN WITH', '2021-01-30 08:59:38', '2021-05-31 14:58:52'),
(222, 0, 'en', '_json', 'Your Email', 'YOUR EMAIL', '2021-01-30 08:59:38', '2021-05-31 14:58:52'),
(223, 0, 'en', '_json', 'Enter Password', 'ENTER PASSWORD', '2021-01-30 08:59:38', '2021-05-31 14:58:52'),
(224, 0, 'en', '_json', 'Remember Me', 'REMEMBER ME', '2021-01-30 08:59:38', '2021-05-31 14:58:52'),
(225, 0, 'en', '_json', 'Forgot Password?', 'FORGOT PASSWORD?', '2021-01-30 08:59:38', '2021-05-31 14:58:52'),
(226, 0, 'en', '_json', 'Recover password', 'RECOVER PASSWORD', '2021-01-30 08:59:38', '2021-05-31 14:58:52'),
(227, 0, 'en', '_json', 'New to', 'NEW TO', '2021-01-30 08:59:39', '2021-05-31 14:58:52'),
(228, 0, 'en', '_json', 'Sign Up', 'SIGN UP', '2021-01-30 08:59:39', '2021-05-31 14:58:52'),
(229, 0, 'en', '_json', 'Recover Password', 'RECOVER PASSWORD', '2021-01-30 08:59:39', '2021-05-31 14:58:52'),
(230, 0, 'en', '_json', 'Great !!!', 'GREAT !!!', '2021-01-30 08:59:39', '2021-05-31 14:58:52'),
(231, 0, 'en', '_json', 'We will send you a link to reset password.', 'WE WILL SEND YOU A LINK TO RESET PASSWORD.', '2021-01-30 08:59:39', '2021-05-31 14:58:52'),
(232, 0, 'en', '_json', 'Your Email Address', 'YOUR EMAIL ADDRESS', '2021-01-30 08:59:39', '2021-05-31 14:58:52'),
(233, 0, 'en', '_json', 'Create Account', 'CREATE ACCOUNT', '2021-01-30 08:59:39', '2021-05-31 14:58:52'),
(234, 0, 'en', '_json', 'Reset your password now', 'RESET YOUR PASSWORD NOW', '2021-01-30 08:59:39', '2021-05-31 14:58:52'),
(235, 0, 'en', '_json', 'Your password', 'YOUR PASSWORD', '2021-01-30 08:59:39', '2021-05-31 14:58:52'),
(236, 0, 'en', '_json', 'Confirm Password', 'CONFIRM PASSWORD', '2021-01-30 08:59:39', '2021-05-31 14:58:52'),
(237, 0, 'en', '_json', 'I Agree', 'I AGREE', '2021-01-30 08:59:39', '2021-05-31 14:58:52'),
(238, 0, 'en', '_json', 'By clicking Register, you agree to the', 'By clicking Register, you agree to the', '2021-01-30 08:59:39', '2021-05-31 14:58:52'),
(239, 0, 'en', '_json', 'Terms and Conditions', 'Terms and Conditions', '2021-01-30 08:59:39', '2021-05-31 14:58:52'),
(240, 0, 'en', '_json', 'set out by this site, including our Cookie Use.', 'set out by this site, including our Cookie Use.', '2021-01-30 08:59:39', '2021-05-31 14:58:52'),
(241, 0, 'en', '_json', 'Register', 'REGISTER', '2021-01-30 08:59:39', '2021-05-31 14:58:52'),
(242, 0, 'en', '_json', 'Dashboard', 'DASHBOARD', '2021-01-30 08:59:39', '2021-05-31 14:58:52'),
(243, 0, 'en', '_json', 'Edit Profile', 'EDIT PROFILE', '2021-01-30 08:59:39', '2021-05-31 14:58:52'),
(244, 0, 'en', '_json', 'Logout', 'LOGOUT', '2021-01-30 08:59:39', '2021-05-31 14:58:52'),
(245, 0, 'en', '_json', 'Book Flight', 'BOOK FLIGHT', '2021-01-30 08:59:39', '2021-05-31 14:58:52'),
(246, 0, 'en', '_json', 'Book Hotel', 'BOOK HOTEL', '2021-01-30 08:59:39', '2021-05-31 14:58:52'),
(247, 0, 'en', '_json', 'Navigation', 'NAVIGATION', '2021-01-30 08:59:39', '2021-05-31 14:58:52'),
(248, 0, 'en', '_json', 'Create New', 'CREATE NEW', '2021-01-30 08:59:39', '2021-05-31 14:58:52'),
(249, 0, 'en', '_json', 'Commercial', 'COMMERCIAL', '2021-01-30 08:59:39', '2021-05-31 14:58:52'),
(250, 0, 'en', '_json', 'Sale List', 'SALE LIST', '2021-01-30 08:59:39', '2021-05-31 14:58:52'),
(251, 0, 'en', '_json', 'Purchase', 'PURCHASE', '2021-01-30 08:59:39', '2021-05-31 14:58:52'),
(252, 0, 'en', '_json', 'Purchase List', 'PURCHASE LIST', '2021-01-30 08:59:39', '2021-05-31 14:58:52'),
(253, 0, 'en', '_json', 'Suppliers List', 'SUPPLIERS LIST', '2021-01-30 08:59:39', '2021-05-31 14:58:52'),
(254, 0, 'en', '_json', 'Manage Bookings', 'MANAGE BOOKINGS', '2021-01-30 08:59:39', '2021-05-31 14:58:52'),
(255, 0, 'en', '_json', 'Manage Packages', 'MANAGE PACKAGES', '2021-01-30 08:59:39', '2021-05-31 14:58:52'),
(256, 0, 'en', '_json', 'Packages List', 'PACKAGES LIST', '2021-01-30 08:59:39', '2021-05-31 14:58:52'),
(257, 0, 'en', '_json', 'Manage Categories', 'MANAGE CATEGORIES', '2021-01-30 08:59:39', '2021-05-31 14:58:52'),
(258, 0, 'en', '_json', 'My Wallet', 'MY WALLET', '2021-01-30 08:59:39', '2021-05-31 14:58:52'),
(259, 0, 'en', '_json', 'Manage Profile', 'MANAGE PROFILE', '2021-01-30 08:59:39', '2021-05-31 14:58:52'),
(260, 0, 'en', '_json', 'Log Out', 'LOG OUT', '2021-01-30 08:59:39', '2021-05-31 14:58:52'),
(261, 0, 'en', '_json', 'Sign in', 'SIGN IN', '2021-01-31 10:34:57', '2021-05-31 14:58:52'),
(262, 0, 'en', '_json', 'Who we are', 'WHO WE ARE', '2021-01-31 10:34:57', '2021-05-31 14:58:52'),
(263, 0, 'en', '_json', 'Read more', 'READ MORE', '2021-01-31 10:34:57', '2021-05-31 14:58:52'),
(264, 0, 'en', '_json', 'Discover amazing things to do everywhere you go.', 'DISCOVER AMAZING THINGS TO DO EVERYWHERE YOU GO.', '2021-01-31 10:34:57', '2021-05-31 14:58:52'),
(265, 0, 'en', '_json', 'Company', 'COMPANY', '2021-01-31 10:34:57', '2021-05-31 14:58:52'),
(266, 0, 'en', '_json', 'About Us', 'ABOUT US', '2021-01-31 10:34:57', '2021-05-31 14:58:52'),
(267, 0, 'en', '_json', 'Blog', 'BLOG', '2021-01-31 10:34:57', '2021-05-31 14:58:52'),
(268, 0, 'en', '_json', 'Contact', 'CONTACT', '2021-01-31 10:34:57', '2021-05-31 14:58:52'),
(269, 0, 'en', '_json', 'Contact Us', 'CONTACT US', '2021-01-31 10:34:57', '2021-05-31 14:58:52'),
(270, 0, 'en', '_json', 'Adresse', 'ADRESSE', '2021-01-31 10:34:57', '2021-05-31 14:58:52'),
(271, 0, 'en', '_json', 'Enter your email', 'ENTER YOUR EMAIL', '2021-01-31 10:34:57', '2021-05-31 14:58:52'),
(272, 0, 'en', '_json', 'Sign-up to receive regular updates from us.', 'SIGN-UP TO RECEIVE REGULAR UPDATES FROM US.', '2021-01-31 10:34:57', '2021-05-31 14:58:52'),
(273, 0, 'en', '_json', 'Rentacs Tours', 'RENTACS TOURS', '2021-01-31 10:34:57', '2021-05-31 14:58:52'),
(274, 0, 'en', '_json', 'All rights reserved.', 'ALL RIGHTS RESERVED.', '2021-01-31 10:34:57', '2021-05-31 14:58:52'),
(275, 0, 'en', '_json', 'Profile', 'PROFILE', '2021-01-31 10:34:57', '2021-05-31 14:58:52'),
(276, 0, 'en', '_json', 'Wishlist', 'WISHLIST', '2021-01-31 10:34:57', '2021-05-31 14:58:52'),
(277, 0, 'en', '_json', 'Flights', 'FLIGHTS', '2021-01-31 10:34:57', '2021-05-31 14:58:52'),
(278, 0, 'en', '_json', 'Hotels', 'HOTELS', '2021-01-31 10:34:57', '2021-05-31 14:58:52'),
(279, 0, 'en', '_json', 'Hot Deals', 'HOT DEALS', '2021-01-31 10:34:57', '2021-05-31 14:58:52'),
(280, 0, 'en', '_json', 'Golf tours', 'GOLF TOURS', '2021-01-31 10:34:57', '2021-05-31 14:58:52'),
(281, 0, 'en', '_json', 'Motorcycle', 'MOTORCYCLE', '2021-01-31 10:34:57', '2021-05-31 14:58:52'),
(282, 0, 'en', '_json', 'Surf', 'SURF', '2021-01-31 10:34:57', '2021-05-31 14:58:52'),
(283, 0, 'en', '_json', 'Trekking', 'TREKKING', '2021-01-31 10:34:57', '2021-05-31 14:58:52'),
(284, 0, 'en', '_json', 'Bivouacs', 'BIVOUACS', '2021-01-31 10:34:57', '2021-05-31 14:58:52'),
(285, 0, 'en', '_json', 'Best offers', 'BEST OFFERS', '2021-01-31 10:34:57', '2021-05-31 14:58:52'),
(286, 0, 'fr', '_json', 'Login', 'S\'identifier', '2021-02-01 09:24:16', '2021-05-31 14:58:52'),
(287, 0, 'fr', '_json', 'Oh snap!', 'Oh snap!', '2021-02-01 09:24:16', '2021-05-31 14:58:52'),
(288, 0, 'fr', '_json', 'Login with', 'Connectez-vous avec', '2021-02-01 09:24:16', '2021-05-31 14:58:52'),
(289, 0, 'fr', '_json', 'Your Email', 'Votre e-mail', '2021-02-01 09:24:16', '2021-05-31 14:58:52'),
(290, 0, 'fr', '_json', 'Enter Password', 'Entrer le mot de passe', '2021-02-01 09:24:16', '2021-05-31 14:58:52'),
(291, 0, 'fr', '_json', 'Remember Me', 'Souviens-toi de moi', '2021-02-01 09:24:16', '2021-05-31 14:58:52'),
(292, 0, 'fr', '_json', 'Forgot Password?', 'Mot de passe oublié?', '2021-02-01 09:24:16', '2021-05-31 14:58:52'),
(293, 0, 'fr', '_json', 'Recover password', 'Récupérer mot de passe', '2021-02-01 09:24:16', '2021-05-31 14:58:52'),
(294, 0, 'fr', '_json', 'New to', 'Nouveau sur', '2021-02-01 09:24:16', '2021-05-31 14:58:52'),
(295, 0, 'fr', '_json', 'Sign Up', 'S\'inscrire', '2021-02-01 09:24:16', '2021-05-31 14:58:52'),
(296, 0, 'fr', '_json', 'Recover Password', 'Récupérer mot de passe', '2021-02-01 09:24:17', '2021-05-31 14:58:52'),
(297, 0, 'fr', '_json', 'Great !!!', 'Génial !!!', '2021-02-01 09:24:17', '2021-05-31 14:58:52'),
(298, 0, 'fr', '_json', 'We will send you a link to reset password.', 'Nous vous enverrons un lien pour réinitialiser le mot de passe.', '2021-02-01 09:24:17', '2021-05-31 14:58:52'),
(299, 0, 'fr', '_json', 'Your Email Address', 'Votre adresse email', '2021-02-01 09:24:17', '2021-05-31 14:58:52'),
(300, 0, 'fr', '_json', 'Create Account', 'Créer un compte', '2021-02-01 09:24:17', '2021-05-31 14:58:52'),
(301, 0, 'fr', '_json', 'Reset your password now', 'Réinitialisez votre mot de passe maintenant', '2021-02-01 09:24:17', '2021-05-31 14:58:52'),
(302, 0, 'fr', '_json', 'Your password', 'Votre mot de passe', '2021-02-01 09:24:17', '2021-05-31 14:58:52'),
(303, 0, 'fr', '_json', 'Confirm Password', 'Confirmez le mot de passe', '2021-02-01 09:24:17', '2021-05-31 14:58:52'),
(304, 0, 'fr', '_json', 'I Agree', 'Je suis d\'accord', '2021-02-01 09:24:17', '2021-05-31 14:58:52'),
(305, 0, 'fr', '_json', 'By clicking Register, you agree to the', 'En cliquant sur S\'inscrire, vous acceptez les', '2021-02-01 09:24:17', '2021-05-31 14:58:52'),
(306, 0, 'fr', '_json', 'Terms and Conditions', 'CONDITIONS GÉNÉRALES DE VENTE', '2021-02-01 09:24:17', '2021-05-31 14:58:52'),
(307, 0, 'fr', '_json', 'set out by this site, including our Cookie Use.', 'défini par ce site, y compris notre utilisation des cookies.', '2021-02-01 09:24:17', '2021-05-31 14:58:52'),
(308, 0, 'fr', '_json', 'Register', 'S\'inscrire', '2021-02-01 09:24:17', '2021-05-31 14:58:52'),
(309, 0, 'fr', '_json', 'Dashboard', 'Tableau de bord', '2021-02-01 09:24:17', '2021-05-31 14:58:52'),
(310, 0, 'fr', '_json', 'No places', 'Aucune offre', '2021-02-01 09:24:17', '2021-05-31 14:58:52'),
(311, 0, 'fr', '_json', 'Category', 'Catégorie', '2021-02-01 09:24:17', '2021-05-31 14:58:52'),
(312, 0, 'fr', '_json', 'Places', 'Offres specials', '2021-02-01 09:24:17', '2021-05-31 14:58:52'),
(313, 0, 'fr', '_json', 'Back to list', 'Retour à la liste', '2021-02-01 09:24:17', '2021-05-31 14:58:52'),
(314, 0, 'fr', '_json', 'Show all', 'Afficher tout', '2021-02-01 09:24:17', '2021-05-31 14:58:52'),
(315, 0, 'fr', '_json', 'Introducing', 'Présentation', '2021-02-01 09:24:17', '2021-05-31 14:58:52'),
(316, 0, 'fr', '_json', 'Currency', 'Devise', '2021-02-01 09:24:17', '2021-05-31 14:58:52'),
(317, 0, 'fr', '_json', 'Languages', 'LANGUES', '2021-02-01 09:24:17', '2021-05-31 14:58:52'),
(318, 0, 'fr', '_json', 'Best time to visit', 'MEILLEUR MOMENT POUR VISITER', '2021-02-01 09:24:17', '2021-05-31 14:58:52'),
(319, 0, 'fr', '_json', 'Maps view', 'Affichage des cartes', '2021-02-01 09:24:17', '2021-05-31 14:58:52'),
(320, 0, 'fr', '_json', 'See all', 'Voir tout', '2021-02-01 09:24:17', '2021-05-31 14:58:52'),
(321, 0, 'fr', '_json', 'results', 'résultats', '2021-02-01 09:24:17', '2021-05-31 14:58:52'),
(322, 0, 'fr', '_json', 'Clear All', 'Tout effacer', '2021-02-01 09:24:17', '2021-05-31 14:58:52'),
(323, 0, 'fr', '_json', 'Filter', 'Filtre', '2021-02-01 09:24:17', '2021-05-31 14:58:52'),
(324, 0, 'fr', '_json', 'Sort By', 'Trier par', '2021-02-01 09:24:17', '2021-05-31 14:58:52'),
(325, 0, 'fr', '_json', 'Newest', 'Le plus récent', '2021-02-01 09:24:17', '2021-05-31 14:58:52'),
(326, 0, 'fr', '_json', 'Average rating', 'Note moyenne', '2021-02-01 09:24:17', '2021-05-31 14:58:52'),
(327, 0, 'fr', '_json', 'Price: Low to high', 'Prix: Plus bas au plus haut', '2021-02-01 09:24:17', '2021-05-31 14:58:52'),
(328, 0, 'fr', '_json', 'Price: High to low', 'Prix: plus haut au plus bas', '2021-02-01 09:24:17', '2021-05-31 14:58:52'),
(329, 0, 'fr', '_json', 'Price Filter', 'Filtre de prix', '2021-02-01 09:24:17', '2021-05-31 14:58:52'),
(330, 0, 'fr', '_json', 'Free', 'Gratuit', '2021-02-01 09:24:17', '2021-05-31 14:58:52'),
(331, 0, 'fr', '_json', 'Low: $', 'Faible: $', '2021-02-01 09:24:17', '2021-05-31 14:58:52'),
(332, 0, 'fr', '_json', 'Medium: $$', 'Moyen: $$', '2021-02-01 09:24:17', '2021-05-31 14:58:52'),
(333, 0, 'fr', '_json', 'High: $$$', 'Élevé: $$$', '2021-02-01 09:24:17', '2021-05-31 14:58:52'),
(334, 0, 'fr', '_json', 'Types', 'Les types', '2021-02-01 09:24:17', '2021-05-31 14:58:52'),
(335, 0, 'fr', '_json', 'Amenities', 'Services', '2021-02-01 09:24:17', '2021-05-31 14:58:52'),
(336, 0, 'fr', '_json', 'Explorer Other Cities', 'Explorer d\'autres villes', '2021-02-01 09:24:17', '2021-05-31 14:58:52'),
(337, 0, 'fr', '_json', 'places', 'Offres', '2021-02-01 09:24:17', '2021-05-31 14:58:52'),
(338, 0, 'fr', '_json', 'No cities', 'Pas de villes', '2021-02-01 09:24:17', '2021-05-31 14:58:52'),
(339, 0, 'fr', '_json', 'reviews', 'Avis', '2021-02-01 09:24:17', '2021-05-31 14:58:52'),
(340, 0, 'fr', '_json', 'About Us', 'À propos', '2021-02-01 09:24:17', '2021-05-31 14:58:52'),
(341, 0, 'fr', '_json', 'Our Offices', 'Horaires d\'ouvertures', '2021-02-01 09:24:17', '2021-05-31 14:58:52'),
(342, 0, 'fr', '_json', 'Get Direction', 'Obtenir la direction', '2021-02-01 09:24:17', '2021-05-31 14:58:52'),
(343, 0, 'fr', '_json', 'Get in touch with us', 'Prenez contact avec nous', '2021-02-01 09:24:17', '2021-05-31 14:58:52'),
(344, 0, 'fr', '_json', 'First name', 'Prénom', '2021-02-01 09:24:17', '2021-05-31 14:58:52'),
(345, 0, 'fr', '_json', 'Last name', 'Nom', '2021-02-01 09:24:17', '2021-05-31 14:58:52'),
(346, 0, 'fr', '_json', 'Email', 'Email', '2021-02-01 09:24:17', '2021-05-31 14:58:52'),
(347, 0, 'fr', '_json', 'Phone number', 'Numéro de téléphone', '2021-02-01 09:24:17', '2021-05-31 14:58:52'),
(348, 0, 'fr', '_json', 'Message', 'Message', '2021-02-01 09:24:17', '2021-05-31 14:58:52'),
(349, 0, 'fr', '_json', 'Send Message', 'Envoyer le message', '2021-02-01 09:24:17', '2021-05-31 14:58:52'),
(350, 0, 'fr', '_json', 'Contact Us', 'Nous contacter', '2021-02-01 09:24:17', '2021-05-31 14:58:52'),
(351, 0, 'fr', '_json', 'We want to hear from you.', 'Nous voulons de vos nouvelles.', '2021-02-01 09:24:17', '2021-05-31 14:58:52'),
(352, 0, 'fr', '_json', 'Adresse', 'Adresse', '2021-02-01 09:24:17', '2021-05-31 14:58:52'),
(353, 0, 'fr', '_json', 'Genaral', 'Générale', '2021-02-01 09:24:17', '2021-05-31 14:58:52'),
(354, 0, 'fr', '_json', 'Location', 'Emplacement', '2021-02-01 09:24:17', '2021-05-31 14:58:52'),
(355, 0, 'fr', '_json', 'Contact info', 'Informations de contact', '2021-02-01 09:24:17', '2021-05-31 14:58:52'),
(356, 0, 'fr', '_json', 'Social network', 'Réseau social', '2021-02-01 09:24:17', '2021-05-31 14:58:52'),
(357, 0, 'fr', '_json', 'Open hours', 'Heures d\'ouverture', '2021-02-01 09:24:17', '2021-05-31 14:58:52'),
(358, 0, 'fr', '_json', 'Media', 'Médias', '2021-02-01 09:24:17', '2021-05-31 14:58:52'),
(359, 0, 'fr', '_json', 'Edit my place', 'Modifier ma place', '2021-02-01 09:24:17', '2021-05-31 14:58:52'),
(360, 0, 'fr', '_json', 'Add new place', 'Ajouter une offre special', '2021-02-01 09:24:17', '2021-05-31 14:58:52'),
(361, 0, 'fr', '_json', 'Place Name', 'Nom de l\'offre special', '2021-02-01 09:24:17', '2021-05-31 14:58:52'),
(362, 0, 'fr', '_json', 'What the name of place', 'quel est le nom de l\'offre special', '2021-02-01 09:24:18', '2021-05-31 14:58:52'),
(363, 0, 'fr', '_json', 'Price Range', 'Intervalle des prix', '2021-02-01 09:24:18', '2021-05-31 14:58:52'),
(364, 0, 'fr', '_json', 'Description', 'Description', '2021-02-01 09:24:18', '2021-05-31 14:58:52'),
(365, 0, 'fr', '_json', 'Select Category', 'Choisir une catégorie', '2021-02-01 09:24:18', '2021-05-31 14:58:52'),
(366, 0, 'fr', '_json', 'Place Type', 'Type de destination', '2021-02-01 09:24:18', '2021-05-31 14:58:52'),
(367, 0, 'fr', '_json', 'Select Place Type', 'Sélectionnez le type d\'offre', '2021-02-01 09:24:18', '2021-05-31 14:58:52'),
(368, 0, 'fr', '_json', 'Place Address', 'Adresse de la destination', '2021-02-01 09:24:18', '2021-05-31 14:58:52'),
(369, 0, 'fr', '_json', 'Select country', 'Sélection de Pays', '2021-02-01 09:24:18', '2021-05-31 14:58:52'),
(370, 0, 'fr', '_json', 'Select city', 'Sélection de ville', '2021-02-01 09:24:18', '2021-05-31 14:58:52'),
(371, 0, 'fr', '_json', 'Full Address', 'Adresse complète', '2021-02-01 09:24:18', '2021-05-31 14:58:52'),
(372, 0, 'fr', '_json', 'Place Location at Google Map', 'Placer la position sur Google Map', '2021-02-01 09:24:18', '2021-05-31 14:58:52'),
(373, 0, 'fr', '_json', 'Your email address', 'Votre adresse email', '2021-02-01 09:24:18', '2021-05-31 14:58:52'),
(374, 0, 'fr', '_json', 'Your phone number', 'Votre numéro de téléphone', '2021-02-01 09:24:18', '2021-05-31 14:58:52'),
(375, 0, 'fr', '_json', 'Website', 'Site Internet', '2021-02-01 09:24:18', '2021-05-31 14:58:52'),
(376, 0, 'fr', '_json', 'Your website url', 'L\'adresse URL de votre site', '2021-02-01 09:24:18', '2021-05-31 14:58:52'),
(377, 0, 'fr', '_json', 'Social Networks', 'Réseau social', '2021-02-01 09:24:18', '2021-05-31 14:58:52'),
(378, 0, 'fr', '_json', 'Select network', 'Sélectionnez réseau', '2021-02-01 09:24:18', '2021-05-31 14:58:52'),
(379, 0, 'fr', '_json', 'Enter URL include http or www', 'Entrez l\'URL inclure http ou www', '2021-02-01 09:24:18', '2021-05-31 14:58:52'),
(380, 0, 'fr', '_json', 'Add more', 'Ajouter plus de', '2021-02-01 09:24:18', '2021-05-31 14:58:52'),
(382, 0, 'fr', '_json', 'Thumb image', 'Image du pouce', '2021-02-01 09:24:18', '2021-05-31 14:58:52'),
(383, 0, 'fr', '_json', 'Maximum file size: 1 MB', 'Taille maximale du fichier: 1 Mo', '2021-02-01 09:24:18', '2021-05-31 14:58:52'),
(384, 0, 'fr', '_json', 'Gallery Images', 'Galerie d\'images', '2021-02-01 09:24:18', '2021-05-31 14:58:52'),
(385, 0, 'fr', '_json', 'Video', 'Vidéo', '2021-02-01 09:24:18', '2021-05-31 14:58:52'),
(386, 0, 'fr', '_json', 'Youtube, Vimeo video url', 'Youtube, URL vidéo Vimeo', '2021-02-01 09:24:18', '2021-05-31 14:58:52'),
(387, 0, 'fr', '_json', 'Login to submit', 'Login to submit', '2021-02-01 09:24:18', '2021-05-31 14:58:52'),
(388, 0, 'fr', '_json', 'Update', 'Mise à jour', '2021-02-01 09:24:18', '2021-05-31 14:58:52'),
(389, 0, 'fr', '_json', 'Submit', 'Envoyer', '2021-02-01 09:24:18', '2021-05-31 14:58:52'),
(390, 0, 'fr', '_json', 'Gallery', 'Galerie', '2021-02-01 09:24:18', '2021-05-31 14:58:52'),
(391, 0, 'fr', '_json', 'Show more', 'Montrer plus', '2021-02-01 09:24:18', '2021-05-31 14:58:52'),
(392, 0, 'fr', '_json', 'Book now', 'Réserver maintenant', '2021-02-01 09:24:18', '2021-05-31 14:58:52'),
(393, 0, 'fr', '_json', 'Location & Maps', 'Emplacement et cartes', '2021-02-01 09:24:18', '2021-05-31 14:58:52'),
(394, 0, 'fr', '_json', 'Direction', 'Direction', '2021-02-01 09:24:18', '2021-05-31 14:58:52'),
(395, 0, 'fr', '_json', 'Contact Info', 'Informations de contact', '2021-02-01 09:24:18', '2021-05-31 14:58:52'),
(396, 0, 'fr', '_json', 'Review', 'Avis', '2021-02-01 09:24:18', '2021-05-31 14:58:52'),
(397, 0, 'fr', '_json', 'to review', 'réviser', '2021-02-01 09:24:18', '2021-05-31 14:58:52'),
(398, 0, 'fr', '_json', 'Write a review', 'Partagé votre Avis', '2021-02-01 09:24:18', '2021-05-31 14:58:52'),
(399, 0, 'fr', '_json', 'Rate This Place', 'Évaluez cette offre', '2021-02-01 09:24:18', '2021-05-31 14:58:52'),
(400, 0, 'fr', '_json', 'error!', 'erreur!', '2021-02-01 09:24:18', '2021-05-31 14:58:52'),
(401, 0, 'fr', '_json', 'Booking online', 'Réservation en ligne', '2021-02-01 09:24:18', '2021-05-31 14:58:52'),
(402, 0, 'fr', '_json', 'Make a reservation', 'Faire une réservation', '2021-02-01 09:24:18', '2021-05-31 14:58:52'),
(403, 0, 'fr', '_json', 'Send me a message', 'Envoyez-moi un message', '2021-02-01 09:24:18', '2021-05-31 14:58:52'),
(404, 0, 'fr', '_json', 'Send', 'Envoyer', '2021-02-01 09:24:18', '2021-05-31 14:58:52'),
(405, 0, 'fr', '_json', 'Banner Ads', 'Bannière publicitaire', '2021-02-01 09:24:18', '2021-05-31 14:58:52'),
(406, 0, 'fr', '_json', 'View', 'Vue', '2021-02-01 09:24:18', '2021-05-31 14:58:52'),
(407, 0, 'fr', '_json', 'Person', 'Personne', '2021-02-01 09:24:18', '2021-05-31 14:58:52'),
(408, 0, 'fr', '_json', 'Adults', 'Adultes', '2021-02-01 09:24:18', '2021-05-31 14:58:52'),
(409, 0, 'fr', '_json', 'Childrens', 'Enfants', '2021-02-01 09:24:18', '2021-05-31 14:58:52'),
(410, 0, 'fr', '_json', 'You won\'t be charged yet', 'Vous ne serez pas encore facturé', '2021-02-01 09:24:18', '2021-05-31 14:58:52'),
(411, 0, 'fr', '_json', 'You successfully created your booking.', 'Vous avez créé votre réservation avec succès.', '2021-02-01 09:24:18', '2021-05-31 14:58:52'),
(412, 0, 'fr', '_json', 'Your Booking is Pending, We Will Contact You as Soon as Possible.', 'Votre réservation est en attente, nous vous contacterons dès que possible.', '2021-02-01 09:24:18', '2021-05-31 14:58:52'),
(413, 0, 'fr', '_json', 'An error occurred. Please try again.', 'Une erreur est survenue. Veuillez réessayer.', '2021-02-01 09:24:18', '2021-05-31 14:58:52'),
(414, 0, 'fr', '_json', 'Similar places', 'Destinations similaires', '2021-02-01 09:24:18', '2021-05-31 14:58:52'),
(415, 0, 'fr', '_json', 'Overview', 'Aperçu', '2021-02-01 09:24:18', '2021-05-31 14:58:52'),
(416, 0, 'fr', '_json', 'By Booking.com', 'Par Booking.com', '2021-02-01 09:24:18', '2021-05-31 14:58:52'),
(417, 0, 'fr', '_json', 'All Country', 'Tous les pays', '2021-02-01 09:24:18', '2021-05-31 14:58:52'),
(418, 0, 'fr', '_json', 'All City', 'Toutes les villes', '2021-02-01 09:24:18', '2021-05-31 14:58:52'),
(419, 0, 'fr', '_json', 'Select Categories', 'Sélection catégories', '2021-02-01 09:24:18', '2021-05-31 14:58:52'),
(420, 0, 'fr', '_json', 'All categories', 'Toutes les catégories', '2021-02-01 09:24:18', '2021-05-31 14:58:52'),
(421, 0, 'fr', '_json', 'by', 'par', '2021-02-01 09:24:18', '2021-05-31 14:58:52'),
(422, 0, 'fr', '_json', 'Related Articles', 'Articles similaires', '2021-02-01 09:24:18', '2021-05-31 14:58:52'),
(423, 0, 'fr', '_json', 'Blog', 'Blog', '2021-02-01 09:24:18', '2021-05-31 14:58:52'),
(424, 0, 'fr', '_json', 'All', 'Tout', '2021-02-01 09:24:18', '2021-05-31 14:58:52'),
(425, 0, 'fr', '_json', 'Search results', 'Résultats de recherche', '2021-02-01 09:24:18', '2021-05-31 14:58:52'),
(426, 0, 'fr', '_json', 'results for', 'résultats pour', '2021-02-01 09:24:18', '2021-05-31 14:58:52'),
(427, 0, 'fr', '_json', 'Date', 'Date', '2021-02-01 09:24:18', '2021-05-31 14:58:52'),
(428, 0, 'fr', '_json', 'cities', 'Villes', '2021-02-01 09:24:18', '2021-05-31 14:58:52'),
(429, 0, 'fr', '_json', 'Activity', 'Activité', '2021-02-01 09:24:18', '2021-05-31 14:58:52'),
(430, 0, 'fr', '_json', 'More', 'Plus', '2021-02-01 09:24:18', '2021-05-31 14:58:52'),
(431, 0, 'fr', '_json', 'Apply', 'Appliquer', '2021-02-01 09:24:18', '2021-05-31 14:58:52'),
(432, 0, 'fr', '_json', 'Maps', 'Plans', '2021-02-01 09:24:18', '2021-05-31 14:58:52'),
(433, 0, 'fr', '_json', 'Nothing found!', 'Rien n\'a été trouvé!', '2021-02-01 09:24:18', '2021-05-31 14:58:52'),
(434, 0, 'fr', '_json', 'We\'re sorry but we do not have any listings matching your search, try to change you search settings', 'Nous sommes désolés, mais aucune resultat ne correspond à votre recherche, essayez de modifier les mots vos de recherche', '2021-02-01 09:24:18', '2021-05-31 14:58:52'),
(435, 0, 'fr', '_json', 'Close', 'Fermer', '2021-02-01 09:24:18', '2021-05-31 14:58:52'),
(436, 0, 'fr', '_json', 'New Customer', 'Nouveau Client', '2021-02-01 09:24:18', '2021-05-31 14:58:52'),
(437, 0, 'fr', '_json', 'Create Customer', 'Ajouter un Client', '2021-02-01 09:24:18', '2021-05-31 14:58:52'),
(438, 0, 'fr', '_json', 'Name', 'Nom', '2021-02-01 09:24:18', '2021-05-31 14:58:52'),
(439, 0, 'fr', '_json', 'Company Name', 'Nom de Société', '2021-02-01 09:24:18', '2021-05-31 14:58:52'),
(440, 0, 'fr', '_json', 'Phone Number', 'Numéro de téléphone', '2021-02-01 09:24:19', '2021-05-31 14:58:52'),
(441, 0, 'fr', '_json', 'Tax Number', 'N° ICE', '2021-02-01 09:24:19', '2021-05-31 14:58:52'),
(442, 0, 'fr', '_json', 'Address', 'Adresse', '2021-02-01 09:24:19', '2021-05-31 14:58:52'),
(443, 0, 'fr', '_json', 'Postal Code', 'Code Postal', '2021-02-01 09:24:19', '2021-05-31 14:58:52'),
(444, 0, 'fr', '_json', 'City', 'Ville', '2021-02-01 09:24:19', '2021-05-31 14:58:52'),
(445, 0, 'fr', '_json', 'Country', 'Pays', '2021-02-01 09:24:19', '2021-05-31 14:58:52'),
(446, 0, 'fr', '_json', 'Save', 'sauvegarder', '2021-02-01 09:24:19', '2021-05-31 14:58:52'),
(447, 0, 'fr', '_json', 'Back', 'Retour', '2021-02-01 09:24:19', '2021-05-31 14:58:52'),
(448, 0, 'fr', '_json', 'Edit Customer', 'Modifier le Client', '2021-02-01 09:24:19', '2021-05-31 14:58:52'),
(449, 0, 'fr', '_json', 'Customers List', 'Liste des clients', '2021-02-01 09:24:19', '2021-05-31 14:58:52'),
(450, 0, 'fr', '_json', 'Customers', 'Clients', '2021-02-01 09:24:19', '2021-05-31 14:58:52'),
(451, 0, 'fr', '_json', 'Add New Customer', 'Ajouter un nouveau client', '2021-02-01 09:24:19', '2021-05-31 14:58:52'),
(452, 0, 'fr', '_json', 'Company name', 'Nom de l\'entreprise', '2021-02-01 09:24:19', '2021-05-31 14:58:52'),
(453, 0, 'fr', '_json', 'Phone', 'Téléphone', '2021-02-01 09:24:19', '2021-05-31 14:58:52'),
(454, 0, 'fr', '_json', 'Created at', 'Créé à', '2021-02-01 09:24:19', '2021-05-31 14:58:52'),
(455, 0, 'fr', '_json', 'Edit', 'Modifier', '2021-02-01 09:24:19', '2021-05-31 14:58:52'),
(456, 0, 'fr', '_json', 'Delete', 'Supprimer', '2021-02-01 09:24:19', '2021-05-31 14:58:52'),
(457, 0, 'fr', '_json', 'Create New Purchase', 'Créer un nouvel achat', '2021-02-01 09:24:19', '2021-05-31 14:58:52'),
(458, 0, 'fr', '_json', 'New Purchase', 'Nouvel Achat', '2021-02-01 09:24:19', '2021-05-31 14:58:52'),
(459, 0, 'fr', '_json', 'Reference no', 'Numéro de référence', '2021-02-01 09:24:19', '2021-05-31 14:58:52'),
(460, 0, 'fr', '_json', 'Supplier', 'Fournisseur', '2021-02-01 09:24:19', '2021-05-31 14:58:52'),
(461, 0, 'fr', '_json', 'User', 'Utilisateur', '2021-02-01 09:24:19', '2021-05-31 14:58:52'),
(462, 0, 'fr', '_json', 'Select user', 'Sélection Utilisateur', '2021-02-01 09:24:19', '2021-05-31 14:58:52');
INSERT INTO `ltm_translations` (`id`, `status`, `locale`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(463, 0, 'fr', '_json', 'Product', 'Produit', '2021-02-01 09:24:19', '2021-05-31 14:58:52'),
(464, 0, 'fr', '_json', 'Qty', 'Qty', '2021-02-01 09:24:19', '2021-05-31 14:58:52'),
(465, 0, 'fr', '_json', 'Price', 'Prix', '2021-02-01 09:24:19', '2021-05-31 14:58:52'),
(466, 0, 'fr', '_json', 'Total', 'Total', '2021-02-01 09:24:19', '2021-05-31 14:58:52'),
(467, 0, 'fr', '_json', 'Enter Product Name', 'Entrez le nom', '2021-02-01 09:24:19', '2021-05-31 14:58:52'),
(468, 0, 'fr', '_json', 'Enter Qty', 'Entrez la quantité', '2021-02-01 09:24:19', '2021-05-31 14:58:52'),
(469, 0, 'fr', '_json', 'Enter Unit Price', 'Entrez le prix unitaire', '2021-02-01 09:24:19', '2021-05-31 14:58:52'),
(470, 0, 'fr', '_json', 'Add Row', 'Ajouter une ligne', '2021-02-01 09:24:19', '2021-05-31 14:58:52'),
(471, 0, 'fr', '_json', 'Delete Row', 'Supprimer une ligne', '2021-02-01 09:24:19', '2021-05-31 14:58:52'),
(472, 0, 'fr', '_json', 'Sub Total', 'Sous Total', '2021-02-01 09:24:19', '2021-05-31 14:58:52'),
(473, 0, 'fr', '_json', 'Tax', 'TVA', '2021-02-01 09:24:19', '2021-05-31 14:58:52'),
(474, 0, 'fr', '_json', 'Tax Amount', 'Montant TVA', '2021-02-01 09:24:19', '2021-05-31 14:58:52'),
(475, 0, 'fr', '_json', 'Grand Total', 'Total', '2021-02-01 09:24:19', '2021-05-31 14:58:52'),
(476, 0, 'fr', '_json', 'Sale Status', 'Status de Vente', '2021-02-01 09:24:19', '2021-05-31 14:58:52'),
(477, 0, 'fr', '_json', 'Completed', 'Terminé', '2021-02-01 09:24:19', '2021-05-31 14:58:52'),
(478, 0, 'fr', '_json', 'Pending', 'En attente', '2021-02-01 09:24:19', '2021-05-31 14:58:52'),
(479, 0, 'fr', '_json', 'Payment Status', 'Statut de paiement', '2021-02-01 09:24:19', '2021-05-31 14:58:52'),
(480, 0, 'fr', '_json', 'Due', 'Impayé', '2021-02-01 09:24:19', '2021-05-31 14:58:52'),
(481, 0, 'fr', '_json', 'Partial', 'Partiel', '2021-02-01 09:24:19', '2021-05-31 14:58:52'),
(482, 0, 'fr', '_json', 'Paid', 'Payé', '2021-02-01 09:24:19', '2021-05-31 14:58:52'),
(483, 0, 'fr', '_json', 'Paid By', 'Payé par', '2021-02-01 09:24:19', '2021-05-31 14:58:52'),
(484, 0, 'fr', '_json', 'Cash', 'Cash', '2021-02-01 09:24:19', '2021-05-31 14:58:52'),
(485, 0, 'fr', '_json', 'Cheque', 'Chèque', '2021-02-01 09:24:19', '2021-05-31 14:58:52'),
(486, 0, 'fr', '_json', 'Deposit', 'Dépôt', '2021-02-01 09:24:19', '2021-05-31 14:58:52'),
(487, 0, 'fr', '_json', 'Attach Document', 'Joindre un document', '2021-02-01 09:24:19', '2021-05-31 14:58:52'),
(488, 0, 'fr', '_json', 'Total Amount', 'Montant Total', '2021-02-01 09:24:19', '2021-05-31 14:58:52'),
(489, 0, 'fr', '_json', 'Paying Amount', 'Montant de paiement', '2021-02-01 09:24:19', '2021-05-31 14:58:52'),
(490, 0, 'fr', '_json', 'Change', 'Changer', '2021-02-01 09:24:19', '2021-05-31 14:58:52'),
(491, 0, 'fr', '_json', 'Purchase Note', 'Note d\'Achat', '2021-02-01 09:24:19', '2021-05-31 14:58:52'),
(492, 0, 'fr', '_json', 'Edit Purchase', 'Modifier l\'Achat', '2021-02-01 09:24:19', '2021-05-31 14:58:52'),
(493, 0, 'fr', '_json', 'Select Supplier', 'Sélection fournisseur', '2021-02-01 09:24:19', '2021-05-31 14:58:52'),
(494, 0, 'fr', '_json', 'Total amount', 'Montant total', '2021-02-01 09:24:19', '2021-05-31 14:58:52'),
(495, 0, 'fr', '_json', 'Purchases', 'Achats', '2021-02-01 09:24:19', '2021-05-31 14:58:52'),
(496, 0, 'fr', '_json', 'Add New Purchase', 'Ajouter un Achat', '2021-02-01 09:24:19', '2021-05-31 14:58:52'),
(497, 0, 'fr', '_json', 'Status', 'Statut', '2021-02-01 09:24:19', '2021-05-31 14:58:52'),
(498, 0, 'fr', '_json', 'Grand total', 'Somme finale', '2021-02-01 09:24:19', '2021-05-31 14:58:52'),
(499, 0, 'fr', '_json', 'Payment status', 'Statut de paiement', '2021-02-01 09:24:19', '2021-05-31 14:58:52'),
(500, 0, 'fr', '_json', 'Create New Sale', 'Créer une nouvelle vente', '2021-02-01 09:24:19', '2021-05-31 14:58:52'),
(501, 0, 'fr', '_json', 'Create Sale', 'Ajouter une Vente', '2021-02-01 09:24:19', '2021-05-31 14:58:52'),
(502, 0, 'fr', '_json', 'Customer', 'Client', '2021-02-01 09:24:19', '2021-05-31 14:58:52'),
(503, 0, 'fr', '_json', 'Select Customer', 'Sélectionnez le client', '2021-02-01 09:24:19', '2021-05-31 14:58:52'),
(504, 0, 'fr', '_json', 'Recieved Amount', 'Montant Reçu', '2021-02-01 09:24:19', '2021-05-31 14:58:52'),
(505, 0, 'fr', '_json', 'Payment Note', 'Note de paiement', '2021-02-01 09:24:19', '2021-05-31 14:58:52'),
(506, 0, 'fr', '_json', 'Sale Note', 'Note de Vente', '2021-02-01 09:24:19', '2021-05-31 14:58:52'),
(507, 0, 'fr', '_json', 'Staff Note', 'Note Staff', '2021-02-01 09:24:19', '2021-05-31 14:58:52'),
(508, 0, 'fr', '_json', 'Edit Sale', 'Modifier la vente', '2021-02-01 09:24:19', '2021-05-31 14:58:52'),
(509, 0, 'fr', '_json', 'Sales', 'Ventes', '2021-02-01 09:24:20', '2021-05-31 14:58:52'),
(510, 0, 'fr', '_json', 'Add New Sale', 'Ajouter une vente', '2021-02-01 09:24:20', '2021-05-31 14:58:52'),
(511, 0, 'fr', '_json', 'Booking ID', 'Réservation ID', '2021-02-01 09:24:20', '2021-05-31 14:58:52'),
(512, 0, 'fr', '_json', 'Booking Type', 'Type de réservation', '2021-02-01 09:24:20', '2021-05-31 14:58:52'),
(513, 0, 'fr', '_json', 'Settings', 'Réglage', '2021-02-01 09:24:20', '2021-05-31 14:58:52'),
(514, 0, 'fr', '_json', 'Users Management', 'Gestion des utilisateurs', '2021-02-01 09:24:20', '2021-05-31 14:58:52'),
(515, 0, 'fr', '_json', 'Create User', 'Ajouter un utilisateur', '2021-02-01 09:24:20', '2021-05-31 14:58:52'),
(516, 0, 'fr', '_json', 'Create New Supplier', 'Créer un nouveau fournisseur', '2021-02-01 09:24:20', '2021-05-31 14:58:52'),
(517, 0, 'fr', '_json', 'Create Supplier', 'Ajouter un fournisseur', '2021-02-01 09:24:20', '2021-05-31 14:58:52'),
(518, 0, 'fr', '_json', 'Edit Supplier', 'Modifier le fournisseur', '2021-02-01 09:24:20', '2021-05-31 14:58:52'),
(519, 0, 'fr', '_json', 'Suppliers', 'Fournisseurs', '2021-02-01 09:24:20', '2021-05-31 14:58:52'),
(520, 0, 'fr', '_json', 'Add New Supplier', 'Ajouter un fournisseur', '2021-02-01 09:24:20', '2021-05-31 14:58:52'),
(521, 0, 'fr', '_json', 'Supplier Name', 'Nom du fournisseur', '2021-02-01 09:24:20', '2021-05-31 14:58:52'),
(522, 0, 'fr', '_json', 'Supplier Company', 'Entreprise fournisseur', '2021-02-01 09:24:20', '2021-05-31 14:58:52'),
(523, 0, 'fr', '_json', 'Action', 'Action', '2021-02-01 09:24:20', '2021-05-31 14:58:52'),
(524, 0, 'fr', '_json', 'Travel Packages', 'Forfaits de voyage', '2021-02-01 09:24:20', '2021-05-31 14:58:52'),
(525, 0, 'fr', '_json', 'Continue(Save Package)', 'Continuer (Enregistrer le package)', '2021-02-01 09:24:20', '2021-05-31 14:58:52'),
(526, 0, 'fr', '_json', 'Attraction', 'Attraction', '2021-02-01 09:24:20', '2021-05-31 14:58:52'),
(527, 0, 'fr', '_json', 'Attraction Name', 'Nom de l\'attraction', '2021-02-01 09:24:20', '2021-05-31 14:58:52'),
(528, 0, 'fr', '_json', 'Attraction City', 'Ville d\'attraction', '2021-02-01 09:24:20', '2021-05-31 14:58:52'),
(529, 0, 'fr', '_json', 'Attraction Date', 'Date de l\'attraction', '2021-02-01 09:24:20', '2021-05-31 14:58:52'),
(530, 0, 'fr', '_json', 'Location Description', 'Description de l\'emplacement', '2021-02-01 09:24:20', '2021-05-31 14:58:52'),
(531, 0, 'fr', '_json', 'Attraction Additional Information', 'Informations supplémentaires sur l\'attraction', '2021-02-01 09:24:20', '2021-05-31 14:58:52'),
(532, 0, 'fr', '_json', 'Sight Seeings', 'Visites touristiques', '2021-02-01 09:24:20', '2021-05-31 14:58:52'),
(533, 0, 'fr', '_json', 'Add More Sight Seeing', 'Ajouter plus de vue', '2021-02-01 09:24:20', '2021-05-31 14:58:52'),
(534, 0, 'fr', '_json', 'Sight Seeing Title', 'Titre voyant', '2021-02-01 09:24:20', '2021-05-31 14:58:52'),
(535, 0, 'fr', '_json', 'Sight Seeing Description', 'Description de la vue', '2021-02-01 09:24:20', '2021-05-31 14:58:52'),
(536, 0, 'fr', '_json', 'Continue (Save Attraction)', 'Continuer (Enregistrer l\'attraction)', '2021-02-01 09:24:20', '2021-05-31 14:58:52'),
(537, 0, 'fr', '_json', 'Attraction Gallery', 'Galerie d\'attraction', '2021-02-01 09:24:20', '2021-05-31 14:58:52'),
(538, 0, 'fr', '_json', 'Drag and Drop or Click On Box to Select Multiple Images', 'Faites glisser et déposez ou cliquez sur la zone pour sélectionner plusieurs images', '2021-02-01 09:24:20', '2021-05-31 14:58:52'),
(539, 0, 'fr', '_json', 'Continue', 'Continuer', '2021-02-01 09:24:20', '2021-05-31 14:58:52'),
(540, 0, 'fr', '_json', 'Create New Package', 'Créer un nouveau package', '2021-02-01 09:24:20', '2021-05-31 14:58:52'),
(541, 0, 'fr', '_json', 'Package type', 'Type d\'emballage', '2021-02-01 09:24:20', '2021-05-31 14:58:52'),
(542, 0, 'fr', '_json', 'Package category', 'Catégorie de package', '2021-02-01 09:24:20', '2021-05-31 14:58:52'),
(543, 0, 'fr', '_json', 'Package name', 'Nom du pack', '2021-02-01 09:24:20', '2021-05-31 14:58:52'),
(544, 0, 'fr', '_json', 'Adult price', 'Prix ​​adulte', '2021-02-01 09:24:20', '2021-05-31 14:58:52'),
(545, 0, 'fr', '_json', 'Children price', 'Prix ​​enfants', '2021-02-01 09:24:20', '2021-05-31 14:58:52'),
(546, 0, 'fr', '_json', 'Infants price', 'Prix ​​nourrissons', '2021-02-01 09:24:20', '2021-05-31 14:58:52'),
(547, 0, 'fr', '_json', 'Flight', 'Vol', '2021-02-01 09:24:20', '2021-05-31 14:58:52'),
(548, 0, 'fr', '_json', 'Hotel', 'Hôtel', '2021-02-01 09:24:20', '2021-05-31 14:58:52'),
(549, 0, 'fr', '_json', 'Deactivated', 'Désactivé', '2021-02-01 09:24:20', '2021-05-31 14:58:52'),
(550, 0, 'fr', '_json', 'Activated', 'Activé', '2021-02-01 09:24:20', '2021-05-31 14:58:52'),
(551, 0, 'fr', '_json', 'Add sight seeing', 'Ajouter des visites touristiques', '2021-02-01 09:24:20', '2021-05-31 14:58:52'),
(552, 0, 'fr', '_json', 'Confirmation', 'Confirmation', '2021-02-01 09:24:20', '2021-05-31 14:58:52'),
(553, 0, 'fr', '_json', 'Flight Information', 'Information du vol', '2021-02-01 09:24:20', '2021-05-31 14:58:52'),
(554, 0, 'fr', '_json', 'Are you sure', 'Êtes-vous sûr?', '2021-02-01 09:24:20', '2021-05-31 14:58:52'),
(555, 0, 'fr', '_json', 'Booking Confirmation', 'Confirmation de réservation', '2021-02-01 09:24:20', '2021-05-31 14:58:52'),
(556, 0, 'fr', '_json', 'Inclusion', 'Inclusion', '2021-02-01 09:24:20', '2021-05-31 14:58:52'),
(557, 0, 'fr', '_json', 'Exclusion', 'Exclusion', '2021-02-01 09:24:20', '2021-05-31 14:58:52'),
(558, 0, 'fr', '_json', 'Sign in', 'Se connecter', '2021-02-01 09:24:20', '2021-05-31 14:58:52'),
(559, 0, 'fr', '_json', 'KNOW MORE', 'SAVOIR PLUS', '2021-02-01 09:24:20', '2021-05-31 14:58:52'),
(560, 0, 'fr', '_json', 'Who we are', 'Qui sommes nous', '2021-02-01 09:24:20', '2021-05-31 14:58:52'),
(561, 0, 'fr', '_json', 'Read more', 'En Savoir plus', '2021-02-01 09:24:20', '2021-05-31 14:58:52'),
(562, 0, 'fr', '_json', 'Starting From', 'A partir de', '2021-02-01 09:24:20', '2021-05-31 14:58:52'),
(563, 0, 'fr', '_json', 'Edit Profile', 'Modifcation du profil', '2021-02-01 09:24:20', '2021-05-31 14:58:52'),
(564, 0, 'fr', '_json', 'Logout', 'Se déconnecter', '2021-02-01 09:24:20', '2021-05-31 14:58:52'),
(565, 0, 'fr', '_json', 'Book Flight', 'Réserver un vol', '2021-02-01 09:24:20', '2021-05-31 14:58:52'),
(566, 0, 'fr', '_json', 'Book Hotel', 'Réserver un hôtel', '2021-02-01 09:24:20', '2021-05-31 14:58:52'),
(567, 0, 'fr', '_json', 'Navigation', 'Navigation', '2021-02-01 09:24:20', '2021-05-31 14:58:52'),
(568, 0, 'fr', '_json', 'Create New', 'Créer un nouveau', '2021-02-01 09:24:20', '2021-05-31 14:58:52'),
(569, 0, 'fr', '_json', 'Commercial', 'Commercial', '2021-02-01 09:24:20', '2021-05-31 14:58:52'),
(570, 0, 'fr', '_json', 'Sale List', 'Liste de vente', '2021-02-01 09:24:20', '2021-05-31 14:58:52'),
(571, 0, 'fr', '_json', 'Purchase', 'Achat', '2021-02-01 09:24:20', '2021-05-31 14:58:52'),
(572, 0, 'fr', '_json', 'Purchase List', 'Liste d\'achats', '2021-02-01 09:24:20', '2021-05-31 14:58:52'),
(573, 0, 'fr', '_json', 'Suppliers List', 'Liste des fournisseurs', '2021-02-01 09:24:20', '2021-05-31 14:58:52'),
(574, 0, 'fr', '_json', 'Manage Bookings', 'Gérer les réservations', '2021-02-01 09:24:20', '2021-05-31 14:58:52'),
(575, 0, 'fr', '_json', 'Manage Packages', 'Gérer les packages', '2021-02-01 09:24:20', '2021-05-31 14:58:52'),
(576, 0, 'fr', '_json', 'Packages List', 'Liste des packages', '2021-02-01 09:24:21', '2021-05-31 14:58:52'),
(577, 0, 'fr', '_json', 'Manage Categories', 'Gérer les catégories', '2021-02-01 09:24:21', '2021-05-31 14:58:52'),
(578, 0, 'fr', '_json', 'My Wallet', 'Mon portefeuille', '2021-02-01 09:24:21', '2021-05-31 14:58:52'),
(579, 0, 'fr', '_json', 'Manage Profile', 'Gérer le profil', '2021-02-01 09:24:21', '2021-05-31 14:58:52'),
(580, 0, 'fr', '_json', 'Home Settings', 'Paramètres General', '2021-02-01 09:24:21', '2021-05-31 14:58:52'),
(581, 0, 'fr', '_json', 'Vats', 'TAX', '2021-02-01 09:24:21', '2021-05-31 14:58:52'),
(582, 0, 'fr', '_json', 'Markups', 'Marquages', '2021-02-01 09:24:21', '2021-05-31 14:58:52'),
(583, 0, 'fr', '_json', 'Markdowns', 'Démarques', '2021-02-01 09:24:21', '2021-05-31 14:58:52'),
(584, 0, 'fr', '_json', 'Banks', 'Banques', '2021-02-01 09:24:21', '2021-05-31 14:58:52'),
(585, 0, 'fr', '_json', 'Email Subscribers', 'Abonnés aux courriels', '2021-02-01 09:24:21', '2021-05-31 14:58:52'),
(586, 0, 'fr', '_json', 'Visa Applications', 'Demandes de visa', '2021-02-01 09:24:21', '2021-05-31 14:58:52'),
(587, 0, 'fr', '_json', 'Language', 'Langue', '2021-02-01 09:24:21', '2021-05-31 14:58:52'),
(588, 0, 'fr', '_json', 'Translations', 'Traductions', '2021-02-01 09:24:21', '2021-05-31 14:58:52'),
(589, 0, 'fr', '_json', 'Wallets Management', 'Gestion des portefeuilles', '2021-02-01 09:24:21', '2021-05-31 14:58:52'),
(590, 0, 'fr', '_json', 'Log Out', 'Se déconnecter', '2021-02-01 09:24:21', '2021-05-31 14:58:52'),
(591, 0, 'fr', '_json', 'Discover amazing things to do everywhere you go.', 'Découvrez des choses incroyables à faire partout où vous allez.', '2021-02-01 09:24:21', '2021-05-31 14:58:52'),
(592, 0, 'fr', '_json', 'Company', 'Société', '2021-02-01 09:24:21', '2021-05-31 14:58:52'),
(593, 0, 'fr', '_json', 'Contact', 'Contact', '2021-02-01 09:24:21', '2021-05-31 14:58:52'),
(594, 0, 'fr', '_json', 'Enter your email', 'Entrez votre email', '2021-02-01 09:24:21', '2021-05-31 14:58:52'),
(595, 0, 'fr', '_json', 'Sign-up to receive regular updates from us.', 'Inscrivez-vous pour recevoir des mises à jour régulières de notre part.', '2021-02-01 09:24:21', '2021-05-31 14:58:52'),
(596, 0, 'fr', '_json', 'Rentacs Tours', 'Visites à Rentacs', '2021-02-01 09:24:21', '2021-05-31 14:58:52'),
(597, 0, 'fr', '_json', 'All rights reserved.', 'Tous droits réservés', '2021-02-01 09:24:21', '2021-05-31 14:58:52'),
(598, 0, 'fr', '_json', 'LAST MINUTE DEALS', 'OFFRES DE LA DERNIÈRE MINUTE', '2021-02-01 09:24:21', '2021-05-31 14:58:52'),
(599, 0, 'fr', '_json', 'SAVE MORE', 'ÉCONOMISEZ PLUS', '2021-02-01 09:24:21', '2021-05-31 14:58:52'),
(600, 0, 'fr', '_json', 'VIEW DETAIL', 'VOIR LES DÉTAILS', '2021-02-01 09:24:21', '2021-05-31 14:58:52'),
(601, 0, 'fr', '_json', 'Profile', 'Profil', '2021-02-01 09:24:21', '2021-05-31 14:58:52'),
(602, 0, 'fr', '_json', 'Wishlist', 'Liste de souhaits', '2021-02-01 09:24:21', '2021-05-31 14:58:52'),
(603, 0, 'fr', '_json', 'Flights', 'Vols', '2021-02-01 09:24:21', '2021-05-31 14:58:52'),
(604, 0, 'fr', '_json', 'Hotels', 'Hôtels', '2021-02-01 09:24:21', '2021-05-31 14:58:52'),
(605, 0, 'fr', '_json', 'Hot Deals', 'Bonnes affaires', '2021-02-01 09:24:21', '2021-05-31 14:58:52'),
(606, 0, 'fr', '_json', 'Golf tours', 'Tours de golf', '2021-02-01 09:24:21', '2021-05-31 14:58:52'),
(607, 0, 'fr', '_json', 'Motorcycle', 'Moto', '2021-02-01 09:24:21', '2021-05-31 14:58:52'),
(608, 0, 'fr', '_json', 'Surf', 'Le surf', '2021-02-01 09:24:21', '2021-05-31 14:58:52'),
(609, 0, 'fr', '_json', 'Trekking', 'Trekking', '2021-02-01 09:24:21', '2021-05-31 14:58:52'),
(610, 0, 'fr', '_json', 'Bivouacs', 'Bivouacs', '2021-02-01 09:24:21', '2021-05-31 14:58:52'),
(611, 0, 'fr', '_json', 'Best offers', 'Meilleures offres', '2021-02-01 09:24:21', '2021-05-31 14:58:52'),
(612, 0, 'fr', '_json', 'Log out', 'Se déconnecter', '2021-02-01 09:24:21', '2021-05-31 14:58:52'),
(614, 0, 'en', '_json', 'Amenities', 'AMENITIES', '2021-02-01 15:27:22', '2021-05-31 14:58:52'),
(615, 0, 'en', '_json', 'Add amenities', 'ADD AMENITIES', '2021-02-01 15:27:22', '2021-05-31 14:58:52'),
(616, 0, 'en', '_json', 'Amenities Name', 'AMENITIES NAME', '2021-02-01 15:27:22', '2021-05-31 14:58:52'),
(617, 0, 'en', '_json', 'Add', 'ADD', '2021-02-01 15:27:22', '2021-05-31 14:58:52'),
(618, 0, 'en', '_json', 'Cancel', 'CANCEL', '2021-02-01 15:27:22', '2021-05-31 14:58:52'),
(619, 0, 'en', '_json', 'Create Booking', 'CREATE BOOKING', '2021-02-01 15:27:22', '2021-05-31 14:58:52'),
(620, 0, 'en', '_json', 'New Booking', 'NEW BOOKING', '2021-02-01 15:27:22', '2021-05-31 14:58:52'),
(621, 0, 'en', '_json', 'User Name', 'USER NAME', '2021-02-01 15:27:22', '2021-05-31 14:58:52'),
(622, 0, 'en', '_json', 'Place', 'PLACE', '2021-02-01 15:27:22', '2021-05-31 14:58:52'),
(623, 0, 'en', '_json', 'Number of adult', 'NUMBER OF ADULT', '2021-02-01 15:27:22', '2021-05-31 14:58:52'),
(624, 0, 'en', '_json', 'Number of Children', 'NUMBER OF CHILDREN', '2021-02-01 15:27:23', '2021-05-31 14:58:52'),
(625, 0, 'en', '_json', 'Date', 'DATE', '2021-02-01 15:27:23', '2021-05-31 14:58:52'),
(626, 0, 'en', '_json', 'time', 'TIME', '2021-02-01 15:27:23', '2021-05-31 14:58:52'),
(627, 0, 'en', '_json', 'Time', 'TIME', '2021-02-01 15:27:23', '2021-05-31 14:58:52'),
(628, 0, 'en', '_json', 'ACTIVE', 'ACTIVE', '2021-02-01 15:27:23', '2021-05-31 14:58:52'),
(629, 0, 'en', '_json', 'INACTIVE', 'INACTIVE', '2021-02-01 15:27:23', '2021-05-31 14:58:52'),
(630, 0, 'en', '_json', 'PENDING', 'PENDING', '2021-02-01 15:27:23', '2021-05-31 14:58:52'),
(631, 0, 'en', '_json', 'Edit Booking', 'EDIT BOOKING', '2021-02-01 15:27:23', '2021-05-31 14:58:52'),
(632, 0, 'en', '_json', 'Bookings', 'BOOKINGS', '2021-02-01 15:27:23', '2021-05-31 14:58:52'),
(633, 0, 'en', '_json', 'Add New Booking', 'ADD NEW BOOKING', '2021-02-01 15:27:23', '2021-05-31 14:58:52'),
(634, 0, 'en', '_json', 'Booking at', 'BOOKING AT', '2021-02-01 15:27:23', '2021-05-31 14:58:52'),
(635, 0, 'en', '_json', 'Approved', 'APPROVED', '2021-02-01 15:27:23', '2021-05-31 14:58:52'),
(636, 0, 'en', '_json', 'Detail', 'DETAIL', '2021-02-01 15:27:23', '2021-05-31 14:58:52'),
(637, 0, 'en', '_json', 'Approve', 'APPROVE', '2021-02-01 15:27:23', '2021-05-31 14:58:52'),
(638, 0, 'en', '_json', 'Place deleted', 'PLACE DELETED', '2021-02-01 15:27:23', '2021-05-31 14:58:52'),
(639, 0, 'en', '_json', 'Booking detail', 'BOOKING DETAIL', '2021-02-01 15:27:23', '2021-05-31 14:58:52'),
(640, 0, 'en', '_json', 'Booking place', 'BOOKING PLACE', '2021-02-01 15:27:23', '2021-05-31 14:58:52'),
(641, 0, 'en', '_json', 'Booking datetime', 'BOOKING DATETIME', '2021-02-01 15:27:23', '2021-05-31 14:58:52'),
(642, 0, 'en', '_json', 'Number of Adult', 'NUMBER OF ADULT', '2021-02-01 15:27:23', '2021-05-31 14:58:52'),
(643, 0, 'en', '_json', 'Booking status', 'BOOKING STATUS', '2021-02-01 15:27:23', '2021-05-31 14:58:52'),
(644, 0, 'en', '_json', 'Activity', 'ACTIVITY', '2021-02-01 15:27:23', '2021-05-31 14:58:52'),
(645, 0, 'en', '_json', 'Add Activity', 'ADD ACTIVITY', '2021-02-01 15:27:23', '2021-05-31 14:58:52'),
(646, 0, 'en', '_json', 'Category Name', 'CATEGORY NAME', '2021-02-01 15:27:23', '2021-05-31 14:58:52'),
(647, 0, 'en', '_json', 'Priority', 'PRIORITY', '2021-02-01 15:27:23', '2021-05-31 14:58:52'),
(648, 0, 'en', '_json', 'Is feature', 'IS FEATURE', '2021-02-01 15:27:23', '2021-05-31 14:58:52'),
(649, 0, 'en', '_json', 'Add category', 'ADD CATEGORY', '2021-02-01 15:27:23', '2021-05-31 14:58:52'),
(650, 0, 'en', '_json', 'Category name', 'CATEGORY NAME', '2021-02-01 15:27:23', '2021-05-31 14:58:52'),
(651, 0, 'en', '_json', 'Color', 'COLOR', '2021-02-01 15:27:23', '2021-05-31 14:58:52'),
(652, 0, 'en', '_json', 'SEO title', 'SEO TITLE', '2021-02-01 15:27:23', '2021-05-31 14:58:52'),
(653, 0, 'en', '_json', 'Meta Description', 'META DESCRIPTION', '2021-02-01 15:27:23', '2021-05-31 14:58:52'),
(654, 0, 'en', '_json', 'Add city', 'ADD CITY', '2021-02-01 15:27:23', '2021-05-31 14:58:52'),
(655, 0, 'en', '_json', 'Select country', 'SELECT COUNTRY', '2021-02-01 15:27:23', '2021-05-31 14:58:52'),
(656, 0, 'en', '_json', 'City Name', 'CITY NAME', '2021-02-01 15:27:23', '2021-05-31 14:58:52'),
(657, 0, 'en', '_json', 'Description', 'DESCRIPTION', '2021-02-01 15:27:23', '2021-05-31 14:58:52'),
(658, 0, 'en', '_json', 'Intro', 'INTRO', '2021-02-01 15:27:23', '2021-05-31 14:58:52'),
(659, 0, 'en', '_json', 'Thumbnail image', 'THUMBNAIL IMAGE', '2021-02-01 15:27:23', '2021-05-31 14:58:52'),
(660, 0, 'en', '_json', 'Banner image', 'BANNER IMAGE', '2021-02-01 15:27:23', '2021-05-31 14:58:52'),
(661, 0, 'en', '_json', 'Time to visit', 'TIME TO VISIT', '2021-02-01 15:27:23', '2021-05-31 14:58:52'),
(662, 0, 'en', '_json', 'Currency', 'CURRENCY', '2021-02-01 15:27:23', '2021-05-31 14:58:52'),
(663, 0, 'en', '_json', 'Location', 'LOCATION', '2021-02-01 15:27:23', '2021-05-31 14:58:52'),
(664, 0, 'en', '_json', 'Search city location...', 'SEARCH CITY LOCATION...', '2021-02-01 15:27:23', '2021-05-31 14:58:52'),
(665, 0, 'en', '_json', 'Countries', 'COUNTRIES', '2021-02-01 15:27:23', '2021-05-31 14:58:52'),
(666, 0, 'en', '_json', 'Add country', 'ADD COUNTRY', '2021-02-01 15:27:23', '2021-05-31 14:58:52'),
(667, 0, 'en', '_json', 'Country name', 'COUNTRY NAME', '2021-02-01 15:27:23', '2021-05-31 14:58:52'),
(668, 0, 'en', '_json', 'All Places', 'ALL PLACES', '2021-02-01 15:27:23', '2021-05-31 14:58:52'),
(669, 0, 'en', '_json', 'Activity Type', 'ACTIVITY TYPE', '2021-02-01 15:27:23', '2021-05-31 14:58:52'),
(670, 0, 'en', '_json', 'Cities', 'Cities', '2021-02-01 15:27:23', '2021-05-31 14:58:52'),
(671, 0, 'en', '_json', 'All Posts', 'ALL POSTS', '2021-02-01 15:27:23', '2021-05-31 14:58:52'),
(672, 0, 'en', '_json', 'Categories', 'CATEGORIES', '2021-02-01 15:27:24', '2021-05-31 14:58:52'),
(673, 0, 'en', '_json', 'Pages', 'PAGES', '2021-02-01 15:27:24', '2021-05-31 14:58:52'),
(674, 0, 'en', '_json', 'Reviews', 'REVIEWS', '2021-02-01 15:27:24', '2021-05-31 14:58:52'),
(675, 0, 'en', '_json', 'Account Management', 'ACCOUNT MANAGEMENT', '2021-02-01 15:27:24', '2021-05-31 14:58:52'),
(676, 0, 'en', '_json', 'Users', 'USERS', '2021-02-01 15:27:24', '2021-05-31 14:58:52'),
(677, 0, 'en', '_json', 'Testimonials', 'TESTIMONIALS', '2021-02-01 15:27:24', '2021-05-31 14:58:52'),
(678, 0, 'en', '_json', 'General Settings', 'GENERAL SETTINGS', '2021-02-01 15:27:24', '2021-05-31 14:58:52'),
(679, 0, 'en', '_json', 'Languages', 'LANGUAGES', '2021-02-01 15:27:24', '2021-05-31 14:58:52'),
(680, 0, 'en', '_json', 'Home Page', 'HOME PAGE', '2021-02-01 15:27:24', '2021-05-31 14:58:52'),
(681, 0, 'en', '_json', 'Add Page', 'ADD PAGE', '2021-02-01 15:27:24', '2021-05-31 14:58:52'),
(682, 0, 'en', '_json', 'Title', 'TITLE', '2021-02-01 15:27:24', '2021-05-31 14:58:52'),
(683, 0, 'en', '_json', 'Content', 'CONTENT', '2021-02-01 15:27:24', '2021-05-31 14:58:52'),
(684, 0, 'en', '_json', 'SEO', 'SEO', '2021-02-01 15:27:24', '2021-05-31 14:58:52'),
(685, 0, 'en', '_json', 'Publish', 'PUBLISH', '2021-02-01 15:27:24', '2021-05-31 14:58:52'),
(686, 0, 'en', '_json', 'Edit Page', 'EDIT PAGE', '2021-02-01 15:27:24', '2021-05-31 14:58:52'),
(687, 0, 'en', '_json', 'Add new Page', 'ADD NEW PAGE', '2021-02-01 15:27:24', '2021-05-31 14:58:52'),
(688, 0, 'en', '_json', 'All categories', 'ALL CATEGORIES', '2021-02-01 15:27:24', '2021-05-31 14:58:52'),
(689, 0, 'en', '_json', 'Genaral', 'GENARAL', '2021-02-01 15:27:24', '2021-05-31 14:58:52'),
(690, 0, 'en', '_json', 'Place name', 'PLACE NAME', '2021-02-01 15:27:24', '2021-05-31 14:58:52'),
(691, 0, 'en', '_json', 'What the name of place', 'WHAT THE NAME OF PLACE', '2021-02-01 15:27:24', '2021-05-31 14:58:52'),
(692, 0, 'en', '_json', 'Price range', 'PRICE RANGE', '2021-02-01 15:27:24', '2021-05-31 14:58:52'),
(693, 0, 'en', '_json', 'Offre Date', 'OFFRE DATE', '2021-02-01 15:27:24', '2021-05-31 14:58:52'),
(694, 0, 'en', '_json', 'Category', 'CATEGORY', '2021-02-01 15:27:24', '2021-05-31 14:58:52'),
(695, 0, 'en', '_json', 'Place type', 'PLACE TYPE', '2021-02-01 15:27:24', '2021-05-31 14:58:52'),
(696, 0, 'en', '_json', 'Select Country', 'SELECT COUNTRY', '2021-02-01 15:27:24', '2021-05-31 14:58:52'),
(697, 0, 'en', '_json', 'Please select country first', 'PLEASE SELECT COUNTRY FIRST', '2021-02-01 15:27:24', '2021-05-31 14:58:52'),
(698, 0, 'en', '_json', 'Place Address', 'PLACE ADDRESS', '2021-02-01 15:27:24', '2021-05-31 14:58:52'),
(699, 0, 'en', '_json', 'Search address...', 'SEARCH ADDRESS...', '2021-02-01 15:27:24', '2021-05-31 14:58:52'),
(700, 0, 'en', '_json', 'Contact info', 'CONTACT INFO', '2021-02-01 15:27:24', '2021-05-31 14:58:52'),
(701, 0, 'en', '_json', 'Website', 'WEBSITE', '2021-02-01 15:27:24', '2021-05-31 14:58:52'),
(702, 0, 'en', '_json', 'Social Networks', 'SOCIAL NETWORKS', '2021-02-01 15:27:24', '2021-05-31 14:58:52'),
(703, 0, 'en', '_json', 'Enter URL include http or www', 'ENTER URL INCLUDE HTTP OR WWW', '2021-02-01 15:27:24', '2021-05-31 14:58:52'),
(704, 0, 'en', '_json', 'Opening hours', 'OPENING HOURS', '2021-02-01 15:27:24', '2021-05-31 14:58:52'),
(705, 0, 'en', '_json', 'Media', 'MEDIA', '2021-02-01 15:27:24', '2021-05-31 14:58:52'),
(706, 0, 'en', '_json', 'Gallery images', 'GALLERY IMAGES', '2021-02-01 15:27:24', '2021-05-31 14:58:52'),
(707, 0, 'en', '_json', 'Video', 'VIDEO', '2021-02-01 15:27:24', '2021-05-31 14:58:52'),
(708, 0, 'en', '_json', 'Booking type', 'BOOKING TYPE', '2021-02-01 15:27:24', '2021-05-31 14:58:52'),
(709, 0, 'en', '_json', 'Booking form', 'BOOKING FORM', '2021-02-01 15:27:24', '2021-05-31 14:58:52'),
(710, 0, 'en', '_json', 'Enquiry Form', 'ENQUIRY FORM', '2021-02-01 15:27:24', '2021-05-31 14:58:52'),
(711, 0, 'en', '_json', 'Booking Now', 'BOOKING NOW', '2021-02-01 15:27:24', '2021-05-31 14:58:52'),
(712, 0, 'en', '_json', 'Affiliate Banner Ads', 'AFFILIATE BANNER ADS', '2021-02-01 15:27:24', '2021-05-31 14:58:52'),
(713, 0, 'en', '_json', 'Submit', 'SUBMIT', '2021-02-01 15:27:24', '2021-05-31 14:58:52'),
(714, 0, 'en', '_json', 'Add more', 'ADD MORE', '2021-02-01 15:27:24', '2021-05-31 14:58:52'),
(715, 0, 'en', '_json', 'Contact form', 'CONTACT FORM', '2021-02-01 15:27:24', '2021-05-31 14:58:52'),
(716, 0, 'en', '_json', 'Banner link', 'BANNER LINK', '2021-02-01 15:27:24', '2021-05-31 14:58:52'),
(717, 0, 'en', '_json', 'Maps', 'MAPS', '2021-02-01 15:27:24', '2021-05-31 14:58:52'),
(718, 0, 'en', '_json', 'Add place', 'Add Special Offer', '2021-02-01 15:27:24', '2021-05-31 14:58:52'),
(719, 0, 'en', '_json', 'Hightlight', 'HIGHTLIGHT', '2021-02-01 15:27:24', '2021-05-31 14:58:52'),
(720, 0, 'en', '_json', 'Social network', 'SOCIAL NETWORK', '2021-02-01 15:27:24', '2021-05-31 14:58:52'),
(722, 0, 'en', '_json', 'Booking link', 'BOOKING LINK', '2021-02-01 15:27:24', '2021-05-31 14:58:52'),
(723, 0, 'en', '_json', 'Places', 'PLACES', '2021-02-01 15:27:24', '2021-05-31 14:58:52'),
(724, 0, 'en', '_json', 'All Country', 'ALL COUNTRY', '2021-02-01 15:27:24', '2021-05-31 14:58:52'),
(725, 0, 'en', '_json', 'Select city', 'SELECT CITY', '2021-02-01 15:27:24', '2021-05-31 14:58:52'),
(726, 0, 'en', '_json', 'All City', 'ALL CITY', '2021-02-01 15:27:24', '2021-05-31 14:58:52'),
(727, 0, 'en', '_json', 'Select Activity', 'SELECT ACTIVITY', '2021-02-01 15:27:24', '2021-05-31 14:58:52'),
(728, 0, 'en', '_json', 'All Activities', 'ALL ACTIVITIES', '2021-02-01 15:27:24', '2021-05-31 14:58:52'),
(729, 0, 'en', '_json', 'Add place type', 'ADD PLACE TYPE', '2021-02-01 15:27:24', '2021-05-31 14:58:52'),
(730, 0, 'en', '_json', 'Place type name', 'PLACE TYPE NAME', '2021-02-01 15:27:24', '2021-05-31 14:58:52'),
(731, 0, 'en', '_json', 'Select Category', 'SELECT CATEGORY', '2021-02-01 15:27:24', '2021-05-31 14:58:52'),
(732, 0, 'en', '_json', 'Reviewer', 'REVIEWER', '2021-02-01 15:27:25', '2021-05-31 14:58:52'),
(733, 0, 'en', '_json', 'Comment', 'COMMENT', '2021-02-01 15:27:25', '2021-05-31 14:58:52'),
(734, 0, 'en', '_json', 'Star', 'STAR', '2021-02-01 15:27:25', '2021-05-31 14:58:52'),
(735, 0, 'en', '_json', 'New Sale', 'NEW SALE', '2021-02-01 15:27:25', '2021-05-31 14:58:52'),
(736, 0, 'en', '_json', 'New Supplier', 'NEW SUPPLIER', '2021-02-01 15:27:25', '2021-05-31 14:58:52'),
(737, 0, 'en', '_json', 'Edit testimonial', 'EDIT TESTIMONIAL', '2021-02-01 15:27:25', '2021-05-31 14:58:52'),
(738, 0, 'en', '_json', 'Add testimonial', 'ADD TESTIMONIAL', '2021-02-01 15:27:25', '2021-05-31 14:58:52'),
(739, 0, 'en', '_json', 'Add new Testimonial', 'ADD NEW TESTIMONIAL', '2021-02-01 15:27:25', '2021-05-31 14:58:52'),
(740, 0, 'en', '_json', 'Avatar', 'AVATAR', '2021-02-01 15:27:25', '2021-05-31 14:58:52'),
(741, 0, 'en', '_json', 'Job title', 'JOB TITLE', '2021-02-01 15:27:25', '2021-05-31 14:58:52'),
(742, 0, 'en', '_json', 'New user', 'NEW USER', '2021-02-01 15:27:25', '2021-05-31 14:58:52'),
(743, 0, 'en', '_json', 'Password', 'PASSWORD', '2021-02-01 15:27:25', '2021-05-31 14:58:52'),
(744, 0, 'en', '_json', 'Role', 'ROLE', '2021-02-01 15:27:25', '2021-05-31 14:58:52'),
(745, 0, 'en', '_json', 'Visitor', 'VISITOR', '2021-02-01 15:27:25', '2021-05-31 14:58:52'),
(746, 0, 'en', '_json', 'Wholeseller', 'WHOLESELLER', '2021-02-01 15:27:25', '2021-05-31 14:58:52'),
(747, 0, 'en', '_json', 'Agent', 'AGENT', '2021-02-01 15:27:25', '2021-05-31 14:58:52'),
(748, 0, 'en', '_json', 'Edit User', 'EDIT USER', '2021-02-01 15:27:25', '2021-05-31 14:58:52'),
(749, 0, 'en', '_json', 'Add New User', 'ADD NEW USER', '2021-02-01 15:27:25', '2021-05-31 14:58:52'),
(750, 0, 'en', '_json', 'Is Admin', 'IS ADMIN', '2021-02-01 15:27:25', '2021-05-31 14:58:52'),
(751, 0, 'en', '_json', 'No places', 'NO PLACES', '2021-02-01 15:27:25', '2021-05-31 14:58:52'),
(752, 0, 'en', '_json', 'Back to list', 'BACK TO LIST', '2021-02-01 15:27:25', '2021-05-31 14:58:52'),
(753, 0, 'en', '_json', 'Show all', 'SHOW ALL', '2021-02-01 15:27:25', '2021-05-31 14:58:52'),
(754, 0, 'en', '_json', 'Introducing', 'INTRODUCING', '2021-02-01 15:27:25', '2021-05-31 14:58:52'),
(755, 0, 'en', '_json', 'Best time to visit', 'BEST TIME TO VISIT', '2021-02-01 15:27:25', '2021-05-31 14:58:52'),
(756, 0, 'en', '_json', 'Maps view', 'MAPS VIEW', '2021-02-01 15:27:25', '2021-05-31 14:58:52'),
(757, 0, 'en', '_json', 'See all', 'SEE ALL', '2021-02-01 15:27:25', '2021-05-31 14:58:52'),
(758, 0, 'en', '_json', 'results', 'RESULTS', '2021-02-01 15:27:25', '2021-05-31 14:58:52'),
(759, 0, 'en', '_json', 'Clear All', 'CLEAR ALL', '2021-02-01 15:27:25', '2021-05-31 14:58:52'),
(760, 0, 'en', '_json', 'Filter', 'FILTER', '2021-02-01 15:27:25', '2021-05-31 14:58:52'),
(761, 0, 'en', '_json', 'Sort By', 'SORT BY', '2021-02-01 15:27:25', '2021-05-31 14:58:52'),
(762, 0, 'en', '_json', 'Newest', 'NEWEST', '2021-02-01 15:27:25', '2021-05-31 14:58:52'),
(763, 0, 'en', '_json', 'Average rating', 'AVERAGE RATING', '2021-02-01 15:27:25', '2021-05-31 14:58:52'),
(764, 0, 'en', '_json', 'Price: Low to high', 'PRICE: LOW TO HIGH', '2021-02-01 15:27:25', '2021-05-31 14:58:52'),
(765, 0, 'en', '_json', 'Price: High to low', 'PRICE: HIGH TO LOW', '2021-02-01 15:27:25', '2021-05-31 14:58:52'),
(766, 0, 'en', '_json', 'Price Filter', 'PRICE FILTER', '2021-02-01 15:27:25', '2021-05-31 14:58:52'),
(767, 0, 'en', '_json', 'Free', 'FREE', '2021-02-01 15:27:25', '2021-05-31 14:58:52'),
(768, 0, 'en', '_json', 'Low: $', 'LOW: $', '2021-02-01 15:27:25', '2021-05-31 14:58:52'),
(769, 0, 'en', '_json', 'Medium: $$', 'MEDIUM: $$', '2021-02-01 15:27:25', '2021-05-31 14:58:52'),
(770, 0, 'en', '_json', 'High: $$$', 'HIGH: $$$', '2021-02-01 15:27:25', '2021-05-31 14:58:52'),
(771, 0, 'en', '_json', 'Types', 'TYPES', '2021-02-01 15:27:25', '2021-05-31 14:58:52'),
(772, 0, 'en', '_json', 'Explorer Other Cities', 'EXPLORER OTHER CITIES', '2021-02-01 15:27:25', '2021-05-31 14:58:52'),
(773, 0, 'en', '_json', 'places', 'Special Offers', '2021-02-01 15:27:25', '2021-05-31 14:58:52'),
(774, 0, 'en', '_json', 'No cities', 'NO CITIES', '2021-02-01 15:27:25', '2021-05-31 14:58:52'),
(775, 0, 'en', '_json', 'reviews', 'REVIEWS', '2021-02-01 15:27:25', '2021-05-31 14:58:52'),
(776, 0, 'en', '_json', 'Our Offices', 'OUR OFFICES', '2021-02-01 15:27:25', '2021-05-31 14:58:52'),
(777, 0, 'en', '_json', 'Get Direction', 'GET DIRECTION', '2021-02-01 15:27:25', '2021-05-31 14:58:52'),
(778, 0, 'en', '_json', 'Get in touch with us', 'GET IN TOUCH WITH US', '2021-02-01 15:27:25', '2021-05-31 14:58:52'),
(779, 0, 'en', '_json', 'First name', 'FIRST NAME', '2021-02-01 15:27:26', '2021-05-31 14:58:52'),
(780, 0, 'en', '_json', 'Last name', 'LAST NAME', '2021-02-01 15:27:26', '2021-05-31 14:58:52'),
(781, 0, 'en', '_json', 'Message', 'MESSAGE', '2021-02-01 15:27:26', '2021-05-31 14:58:52'),
(782, 0, 'en', '_json', 'Send Message', 'SEND MESSAGE', '2021-02-01 15:27:26', '2021-05-31 14:58:52'),
(783, 0, 'en', '_json', 'We want to hear from you.', 'WE WANT TO HEAR FROM YOU.', '2021-02-01 15:27:26', '2021-05-31 14:58:52'),
(784, 0, 'en', '_json', 'Open hours', 'OPEN HOURS', '2021-02-01 15:27:26', '2021-05-31 14:58:52'),
(785, 0, 'en', '_json', 'Edit my place', 'EDIT MY PLACE', '2021-02-01 15:27:26', '2021-05-31 14:58:52'),
(786, 0, 'en', '_json', 'Add new place', 'ADD NEW PLACE', '2021-02-01 15:27:26', '2021-05-31 14:58:52'),
(787, 0, 'en', '_json', 'Place Name', 'PLACE NAME', '2021-02-01 15:27:26', '2021-05-31 14:58:52'),
(788, 0, 'en', '_json', 'Price Range', 'PRICE RANGE', '2021-02-01 15:27:26', '2021-05-31 14:58:52'),
(789, 0, 'en', '_json', 'Place Type', 'PLACE TYPE', '2021-02-01 15:27:26', '2021-05-31 14:58:52'),
(790, 0, 'en', '_json', 'Select Place Type', 'SELECT PLACE TYPE', '2021-02-01 15:27:26', '2021-05-31 14:58:52'),
(791, 0, 'en', '_json', 'Full Address', 'FULL ADDRESS', '2021-02-01 15:27:26', '2021-05-31 14:58:52'),
(792, 0, 'en', '_json', 'Place Location at Google Map', 'PLACE LOCATION AT GOOGLE MAP', '2021-02-01 15:27:26', '2021-05-31 14:58:52'),
(793, 0, 'en', '_json', 'Your email address', 'YOUR EMAIL ADDRESS', '2021-02-01 15:27:26', '2021-05-31 14:58:52'),
(794, 0, 'en', '_json', 'Your phone number', 'YOUR PHONE NUMBER', '2021-02-01 15:27:26', '2021-05-31 14:58:52'),
(795, 0, 'en', '_json', 'Your website url', 'YOUR WEBSITE URL', '2021-02-01 15:27:26', '2021-05-31 14:58:52'),
(796, 0, 'en', '_json', 'Select network', 'SELECT NETWORK', '2021-02-01 15:27:26', '2021-05-31 14:58:52'),
(798, 0, 'en', '_json', 'Thumb image', 'THUMB IMAGE', '2021-02-01 15:27:26', '2021-05-31 14:58:52'),
(799, 0, 'en', '_json', 'Maximum file size: 1 MB', 'MAXIMUM FILE SIZE: 1 MB', '2021-02-01 15:27:26', '2021-05-31 14:58:52'),
(800, 0, 'en', '_json', 'Gallery Images', 'GALLERY IMAGES', '2021-02-01 15:27:26', '2021-05-31 14:58:52'),
(801, 0, 'en', '_json', 'Youtube, Vimeo video url', 'Youtube, Vimeo video url', '2021-02-01 15:27:26', '2021-05-31 14:58:52'),
(802, 0, 'en', '_json', 'Login to submit', 'LOGIN TO SUBMIT', '2021-02-01 15:27:26', '2021-05-31 14:58:52'),
(803, 0, 'en', '_json', 'Gallery', 'GALLERY', '2021-02-01 15:27:26', '2021-05-31 14:58:52'),
(804, 0, 'en', '_json', 'Show more', 'SHOW MORE', '2021-02-01 15:27:26', '2021-05-31 14:58:52'),
(805, 0, 'en', '_json', 'Book now', 'BOOK NOW', '2021-02-01 15:27:26', '2021-05-31 14:58:52'),
(806, 0, 'en', '_json', 'Location & Maps', 'LOCATION & MAPS', '2021-02-01 15:27:26', '2021-05-31 14:58:52'),
(807, 0, 'en', '_json', 'Direction', 'DIRECTION', '2021-02-01 15:27:26', '2021-05-31 14:58:52'),
(808, 0, 'en', '_json', 'Contact Info', 'CONTACT INFO', '2021-02-01 15:27:26', '2021-05-31 14:58:52'),
(809, 0, 'en', '_json', 'Review', 'REVIEW', '2021-02-01 15:27:26', '2021-05-31 14:58:52'),
(810, 0, 'en', '_json', 'to review', 'TO REVIEW', '2021-02-01 15:27:26', '2021-05-31 14:58:52'),
(811, 0, 'en', '_json', 'Write a review', 'WRITE A REVIEW', '2021-02-01 15:27:26', '2021-05-31 14:58:52'),
(812, 0, 'en', '_json', 'Rate This Place', 'RATE THIS PLACE', '2021-02-01 15:27:26', '2021-05-31 14:58:52'),
(813, 0, 'en', '_json', 'error!', 'ERROR!', '2021-02-01 15:27:26', '2021-05-31 14:58:52'),
(814, 0, 'en', '_json', 'Booking online', 'BOOKING ONLINE', '2021-02-01 15:27:26', '2021-05-31 14:58:52'),
(815, 0, 'en', '_json', 'Make a reservation', 'MAKE A RESERVATION', '2021-02-01 15:27:26', '2021-05-31 14:58:52'),
(816, 0, 'en', '_json', 'Send me a message', 'SEND ME A MESSAGE', '2021-02-01 15:27:26', '2021-05-31 14:58:52'),
(817, 0, 'en', '_json', 'Send', 'SEND', '2021-02-01 15:27:26', '2021-05-31 14:58:52'),
(818, 0, 'en', '_json', 'Banner Ads', 'BANNER ADS', '2021-02-01 15:27:26', '2021-05-31 14:58:52'),
(819, 0, 'en', '_json', 'View', 'VIEW', '2021-02-01 15:27:26', '2021-05-31 14:58:52'),
(820, 0, 'en', '_json', 'Person', 'PERSON', '2021-02-01 15:27:26', '2021-05-31 14:58:52'),
(821, 0, 'en', '_json', 'Adults', 'ADULTS', '2021-02-01 15:27:26', '2021-05-31 14:58:52'),
(822, 0, 'en', '_json', 'Childrens', 'CHILDRENS', '2021-02-01 15:27:26', '2021-05-31 14:58:52'),
(823, 0, 'en', '_json', 'You won\'t be charged yet', 'YOU WON\'T BE CHARGED YET', '2021-02-01 15:27:26', '2021-05-31 14:58:52'),
(824, 0, 'en', '_json', 'You successfully created your booking.', 'YOU SUCCESSFULLY CREATED YOUR BOOKING.', '2021-02-01 15:27:26', '2021-05-31 14:58:52'),
(825, 0, 'en', '_json', 'Your Booking is Pending, We Will Contact You as Soon as Possible.', 'Your Booking is Pending, We Will Contact You as Soon as Possible.', '2021-02-01 15:27:26', '2021-05-31 14:58:52'),
(826, 0, 'en', '_json', 'An error occurred. Please try again.', 'AN ERROR OCCURRED. PLEASE TRY AGAIN.', '2021-02-01 15:27:26', '2021-05-31 14:58:52'),
(827, 0, 'en', '_json', 'Similar places', 'SIMILAR PLACES', '2021-02-01 15:27:26', '2021-05-31 14:58:52'),
(828, 0, 'en', '_json', 'Overview', 'OVERVIEW', '2021-02-01 15:27:26', '2021-05-31 14:58:52'),
(829, 0, 'en', '_json', 'By Booking.com', 'BY BOOKING.COM', '2021-02-01 15:27:26', '2021-05-31 14:58:52'),
(830, 0, 'en', '_json', 'Select Categories', 'SELECT CATEGORIES', '2021-02-01 15:27:26', '2021-05-31 14:58:52'),
(831, 0, 'en', '_json', 'by', 'BY', '2021-02-01 15:27:26', '2021-05-31 14:58:52'),
(832, 0, 'en', '_json', 'Related Articles', 'RELATED ARTICLES', '2021-02-01 15:27:26', '2021-05-31 14:58:52'),
(833, 0, 'en', '_json', 'All', 'ALL', '2021-02-01 15:27:26', '2021-05-31 14:58:52'),
(834, 0, 'en', '_json', 'Search results', 'SEARCH RESULTS', '2021-02-01 15:27:26', '2021-05-31 14:58:52'),
(835, 0, 'en', '_json', 'results for', 'RESULTS FOR', '2021-02-01 15:27:26', '2021-05-31 14:58:52'),
(836, 0, 'en', '_json', 'cities', 'CITIES', '2021-02-01 15:27:26', '2021-05-31 14:58:52'),
(837, 0, 'en', '_json', 'More', 'MORE', '2021-02-01 15:27:26', '2021-05-31 14:58:52'),
(838, 0, 'en', '_json', 'Apply', 'APPLY', '2021-02-01 15:27:26', '2021-05-31 14:58:52'),
(839, 0, 'en', '_json', 'Nothing found!', 'NOTHING FOUND!', '2021-02-01 15:27:26', '2021-05-31 14:58:52'),
(840, 0, 'en', '_json', 'We\'re sorry but we do not have any listings matching your search, try to change you search settings', 'We\'re sorry but we do not have any listings matching your search, try to change you search settings', '2021-02-01 15:27:26', '2021-05-31 14:58:52'),
(841, 0, 'en', '_json', 'Staticts', 'STATICTS', '2021-02-01 15:27:27', '2021-05-31 14:58:52'),
(842, 0, 'en', '_json', 'Find', 'FIND', '2021-02-01 15:27:27', '2021-05-31 14:58:52'),
(843, 0, 'en', '_json', 'Where are you going?', 'WHERE ARE YOU GOING?', '2021-02-01 15:27:27', '2021-05-31 14:58:52'),
(844, 0, 'en', '_json', 'Where', 'WHERE', '2021-02-01 15:27:27', '2021-05-31 14:58:52'),
(845, 0, 'en', '_json', 'City?', 'CITY?', '2021-02-01 15:27:27', '2021-05-31 14:58:52'),
(846, 0, 'en', '_json', 'Place List', 'PLACE LIST', '2021-02-01 15:27:27', '2021-05-31 14:58:52'),
(847, 0, 'en', '_json', 'Categories List', 'CATEGORIES LIST', '2021-02-01 15:27:27', '2021-05-31 14:58:52'),
(848, 0, 'en', '_json', 'Log out', 'LOG OUT', '2021-02-01 15:27:27', '2021-05-31 14:58:52'),
(849, 0, 'en', '_json', 'Booking', 'BOOKING', '2021-02-03 16:09:36', '2021-05-31 14:58:52'),
(850, 1, 'en', '_json', 'Edit place', NULL, '2021-02-03 16:09:36', '2021-05-31 13:24:10'),
(851, 0, 'en', '_json', 'Browse Businesses by Category', 'BROWSE BUSINESSES BY CATEGORY', '2021-02-03 16:09:37', '2021-05-31 14:58:52'),
(852, 0, 'en', '_json', 'Activity List', 'ACTIVITY LIST', '2021-02-03 16:09:37', '2021-05-31 14:58:52'),
(853, 0, 'en', '_json', 'Amenities List', 'AMENITIES LIST', '2021-02-03 16:09:37', '2021-05-31 14:58:52'),
(854, 0, 'en', '_json', 'Cities List', 'Cities List', '2021-02-03 16:09:37', '2021-05-31 14:58:52'),
(855, 0, 'en', '_json', 'Countries List', 'COUNTRIES LIST', '2021-02-03 16:09:37', '2021-05-31 14:58:52'),
(856, 0, 'en', '_json', 'My account', 'MY ACCOUNT', '2021-02-05 21:34:43', '2021-05-31 14:58:52'),
(857, 0, 'en', '_json', 'Reset Password', 'RESET PASSWORD', '2021-02-05 21:34:43', '2021-05-31 14:58:52'),
(858, 0, 'en', '_json', 'New password', 'NEW PASSWORD', '2021-02-05 21:34:43', '2021-05-31 14:58:52'),
(859, 0, 'en', '_json', 'Enter new password', 'ENTER NEW PASSWORD', '2021-02-05 21:34:43', '2021-05-31 14:58:52'),
(860, 0, 'en', '_json', 'Re-new password', 'RE-NEW PASSWORD', '2021-02-05 21:34:43', '2021-05-31 14:58:52'),
(861, 0, 'en', '_json', 'All cities', 'ALL CITIES', '2021-02-05 21:34:43', '2021-05-31 14:58:52'),
(862, 0, 'en', '_json', 'Search', 'SEARCH', '2021-02-05 21:34:43', '2021-05-31 14:58:52'),
(863, 0, 'en', '_json', 'ID', 'ID', '2021-02-05 21:34:43', '2021-05-31 14:58:52'),
(864, 0, 'en', '_json', 'Thumb', 'THUMB', '2021-02-05 21:34:43', '2021-05-31 14:58:52'),
(865, 0, 'en', '_json', 'No item found', 'NO ITEM FOUND', '2021-02-05 21:34:43', '2021-05-31 14:58:52'),
(866, 0, 'en', '_json', 'Children', 'CHILDREN', '2021-02-05 21:34:43', '2021-05-31 14:58:52'),
(867, 0, 'en', '_json', 'Infants', 'INFANTS', '2021-02-05 21:34:43', '2021-05-31 14:58:52'),
(868, 0, 'en', '_json', 'Latest Booking', 'LATEST BOOKING', '2021-02-05 21:34:43', '2021-05-31 14:58:52'),
(869, 0, 'en', '_json', 'Find Cheap Flights', 'FIND CHEAP FLIGHTS', '2021-02-05 21:34:44', '2021-05-31 14:58:52'),
(870, 0, 'en', '_json', 'One Way', 'ONE WAY', '2021-02-05 21:34:44', '2021-05-31 14:58:52'),
(871, 0, 'en', '_json', 'Round Trip', 'ROUND TRIP', '2021-02-05 21:34:44', '2021-05-31 14:58:52'),
(872, 0, 'en', '_json', 'Multi Destination', 'MULTI DESTINATION', '2021-02-05 21:34:44', '2021-05-31 14:58:52'),
(873, 0, 'en', '_json', 'Departure City', 'DEPARTURE CITY', '2021-02-05 21:34:44', '2021-05-31 14:58:52'),
(874, 0, 'en', '_json', 'Destination City', 'DESTINATION CITY', '2021-02-05 21:34:44', '2021-05-31 14:58:52'),
(875, 0, 'en', '_json', 'Departure Date', 'DEPARTURE DATE', '2021-02-05 21:34:44', '2021-05-31 14:58:52'),
(876, 0, 'en', '_json', 'Return Date', 'RETURN DATE', '2021-02-05 21:34:44', '2021-05-31 14:58:52'),
(877, 0, 'en', '_json', 'Book Flight Tickets', 'BOOK FLIGHT TICKETS', '2021-02-05 21:34:44', '2021-05-31 14:58:52'),
(878, 0, 'en', '_json', 'Adult', 'ADULT', '2021-02-05 21:34:44', '2021-05-31 14:58:52'),
(879, 0, 'en', '_json', 'Child', 'CHILD', '2021-02-05 21:34:44', '2021-05-31 14:58:52'),
(880, 0, 'en', '_json', 'below 2yrs', 'BELOW 2YRS', '2021-02-05 21:34:44', '2021-05-31 14:58:52'),
(881, 0, 'en', '_json', 'Search Flights', 'SEARCH FLIGHTS', '2021-02-05 21:34:44', '2021-05-31 14:58:52'),
(882, 0, 'en', '_json', 'Book Hotel Rooms', 'BOOK HOTEL ROOMS', '2021-02-05 21:34:44', '2021-05-31 14:58:52'),
(883, 0, 'en', '_json', 'I Want To Go', 'I WANT TO GO', '2021-02-05 21:34:44', '2021-05-31 14:58:52'),
(884, 0, 'en', '_json', 'CheckIn', 'CHECKIN', '2021-02-05 21:34:44', '2021-05-31 14:58:52'),
(885, 0, 'en', '_json', 'CheckOut', 'CHECKOUT', '2021-02-05 21:34:44', '2021-05-31 14:58:52'),
(886, 0, 'en', '_json', 'BEST OFFERS', 'BEST OFFERS', '2021-02-05 21:34:44', '2021-05-31 14:58:52'),
(887, 0, 'en', '_json', 'We are finding the cheapest available flights for you. Hold on for some seconds', 'WE ARE FINDING THE CHEAPEST AVAILABLE FLIGHTS FOR YOU. HOLD ON FOR SOME SECONDS', '2021-02-05 21:34:44', '2021-05-31 14:58:52'),
(888, 0, 'en', '_json', 'Departure Airport', 'DEPARTURE AIRPORT', '2021-02-05 21:34:44', '2021-05-31 14:58:52'),
(889, 0, 'en', '_json', 'Destination Airport', 'DESTINATION AIRPORT', '2021-02-05 21:34:44', '2021-05-31 14:58:52'),
(890, 0, 'en', '_json', 'Cabin', 'CABIN', '2021-02-05 21:34:44', '2021-05-31 14:58:52'),
(891, 0, 'fr', '_json', 'Explore the world', 'Explorer le monde', '2021-02-05 21:37:34', '2021-05-31 14:58:52'),
(892, 0, 'fr', '_json', 'Destinations', 'Les destinations', '2021-02-05 21:37:34', '2021-05-31 14:58:52'),
(893, 0, 'fr', '_json', 'Add place', 'Ajouter une offre special', '2021-02-05 21:37:34', '2021-05-31 14:58:52'),
(894, 0, 'fr', '_json', 'Type a city or location', 'Saisissez une ville ou un emplacement', '2021-02-05 21:37:34', '2021-05-31 14:58:52'),
(895, 0, 'fr', '_json', 'Popular cities', 'Villes populaires', '2021-02-05 21:37:34', '2021-05-31 14:58:52'),
(896, 0, 'fr', '_json', 'Get the App', 'Obtenir l\'application', '2021-02-05 21:37:34', '2021-05-31 14:58:52'),
(897, 0, 'fr', '_json', 'Download the app and go to travel the world.', 'Téléchargez l\'application et partez parcourir le monde.', '2021-02-05 21:37:34', '2021-05-31 14:58:52'),
(898, 0, 'fr', '_json', 'Related stories', 'Histoires en Relation', '2021-02-05 21:37:34', '2021-05-31 14:58:52'),
(899, 0, 'fr', '_json', 'Popular:', 'Populaire', '2021-02-05 21:37:34', '2021-05-31 14:58:52'),
(900, 0, 'fr', '_json', 'View more', 'Voir plus', '2021-02-05 21:37:34', '2021-05-31 14:58:52'),
(901, 0, 'fr', '_json', '404 Error', 'Erreur 404', '2021-02-05 21:37:34', '2021-05-31 14:58:52'),
(902, 0, 'fr', '_json', 'All cities', 'Toutes les villes', '2021-02-05 21:37:34', '2021-05-31 14:58:52'),
(903, 0, 'fr', '_json', 'Avatar', 'Avatar', '2021-02-05 21:37:34', '2021-05-31 14:58:52'),
(904, 0, 'fr', '_json', 'Basic Info', 'Informations de base', '2021-02-05 21:37:34', '2021-05-31 14:58:52'),
(905, 0, 'fr', '_json', 'Change Password', 'Changer le mot de passe', '2021-02-05 21:37:35', '2021-05-31 14:58:52'),
(906, 0, 'fr', '_json', 'Continue with', 'Continuer avec', '2021-02-05 21:37:35', '2021-05-31 14:58:52'),
(907, 0, 'fr', '_json', 'Enter facebook', 'Entrez Facebook', '2021-02-05 21:37:35', '2021-05-31 14:58:52'),
(908, 0, 'fr', '_json', 'Enter instagram', 'Entez Instagram', '2021-02-05 21:37:35', '2021-05-31 14:58:52'),
(909, 0, 'fr', '_json', 'Enter new password', 'Entrez un nouveau mot de passe', '2021-02-05 21:37:35', '2021-05-31 14:58:52'),
(910, 0, 'fr', '_json', 'Enter old password', 'Entrez l\'ancien mot de passe', '2021-02-05 21:37:35', '2021-05-31 14:58:52'),
(911, 0, 'fr', '_json', 'Enter phone number', 'Entrez le numéro de téléphone', '2021-02-05 21:37:35', '2021-05-31 14:58:52'),
(912, 0, 'fr', '_json', 'Enter your name', 'Entrez votre nom', '2021-02-05 21:37:35', '2021-05-31 14:58:52'),
(913, 0, 'fr', '_json', 'Facebook', 'Facebook', '2021-02-05 21:37:35', '2021-05-31 14:58:52'),
(914, 0, 'fr', '_json', 'Faqs', 'FAQS', '2021-02-05 21:37:35', '2021-05-31 14:58:52'),
(915, 0, 'fr', '_json', 'Forgot password', 'Mot de passe oublié', '2021-02-05 21:37:35', '2021-05-31 14:58:52'),
(916, 0, 'fr', '_json', 'Full name', 'Nom complet', '2021-02-05 21:37:35', '2021-05-31 14:58:52'),
(917, 0, 'fr', '_json', 'Homepage', 'Page d\'accueil', '2021-02-05 21:37:35', '2021-05-31 14:58:52'),
(918, 0, 'fr', '_json', 'Make sure you\'ve typed in the URL correctly or try go', 'Assurez-vous que vous avez correctement saisi l\'URL ou essayez d\'aller', '2021-02-05 21:37:35', '2021-05-31 14:58:52'),
(919, 0, 'fr', '_json', 'My account', 'Mon compte', '2021-02-05 21:37:35', '2021-05-31 14:58:52'),
(920, 0, 'fr', '_json', 'My Places', 'Destinations', '2021-02-05 21:37:35', '2021-05-31 14:58:52'),
(921, 0, 'fr', '_json', 'New password', 'Nouveau mot de passe', '2021-02-05 21:37:35', '2021-05-31 14:58:52'),
(922, 0, 'fr', '_json', 'No item found', 'Aucun élément trouvé', '2021-02-05 21:37:35', '2021-05-31 14:58:52'),
(923, 0, 'fr', '_json', 'Old password', 'Ancien mot de passe', '2021-02-05 21:37:35', '2021-05-31 14:58:52'),
(924, 0, 'fr', '_json', 'Place', 'Offre special', '2021-02-05 21:37:35', '2021-05-31 14:58:52'),
(925, 0, 'fr', '_json', 'Place name', 'Nom de l\'offre special', '2021-02-05 21:37:35', '2021-05-31 14:58:52'),
(926, 0, 'fr', '_json', 'Profile Setting', 'Réglage du profil', '2021-02-05 21:37:36', '2021-05-31 14:58:52'),
(927, 0, 'fr', '_json', 'Re-new password', 'Nouveau mot de passe', '2021-02-05 21:37:36', '2021-05-31 14:58:52'),
(928, 0, 'fr', '_json', 'Reset Password', 'réinitialiser le mot de passe', '2021-02-05 21:37:36', '2021-05-31 14:58:52'),
(929, 0, 'fr', '_json', 'Search', 'Rechercher', '2021-02-05 21:37:36', '2021-05-31 14:58:52'),
(930, 0, 'fr', '_json', 'Sorry, we couldn\'t find that page.', 'Désolé, nous n\'avons pas pu trouver cette page.', '2021-02-05 21:37:36', '2021-05-31 14:58:52'),
(931, 0, 'fr', '_json', 'Thumb', 'Thumb', '2021-02-05 21:37:36', '2021-05-31 14:58:52'),
(932, 0, 'fr', '_json', 'Upload new', 'Importer un nouveau', '2021-02-05 21:37:36', '2021-05-31 14:58:52'),
(933, 0, 'fr', '_json', 'We can\'t find the page or studio you\'re looking for.', 'Nous ne trouvons pas la page ou le studio que vous recherchez.', '2021-02-05 21:37:36', '2021-05-31 14:58:52'),
(934, 0, 'fr', '_json', 'Browse Businesses by Category', 'Parcourir par catégorie', '2021-02-05 21:37:36', '2021-05-31 14:58:52'),
(935, 0, 'fr', '_json', 'categories', 'Categories', '2021-02-05 21:37:36', '2021-05-31 14:58:52'),
(936, 0, 'fr', '_json', 'Featured Cities', 'Villes en vedette', '2021-02-05 21:37:36', '2021-05-31 14:58:52'),
(937, 0, 'fr', '_json', 'Find', 'Trouver', '2021-02-05 21:37:36', '2021-05-31 14:58:52'),
(938, 0, 'fr', '_json', 'From Our Blog', 'Depuis notre Blog', '2021-02-05 21:37:36', '2021-05-31 14:58:52'),
(939, 0, 'fr', '_json', 'Instagram', 'Instagram', '2021-02-05 21:37:36', '2021-05-31 14:58:52'),
(940, 0, 'fr', '_json', 'Log In', 'Connexion', '2021-02-05 21:37:36', '2021-05-31 14:58:52'),
(941, 0, 'fr', '_json', 'Or', 'Ou', '2021-02-05 21:37:36', '2021-05-31 14:58:52'),
(942, 0, 'fr', '_json', 'Search places ...', 'Recherche Destinations ...', '2021-02-05 21:37:37', '2021-05-31 14:58:52'),
(943, 0, 'fr', '_json', 'Where', 'Où', '2021-02-05 21:37:37', '2021-05-31 14:58:52'),
(944, 0, 'fr', '_json', 'Add amenities', 'Ajouter un service', '2021-02-05 21:37:37', '2021-05-31 14:58:52'),
(945, 0, 'fr', '_json', 'Add Activity', 'Ajouter une activité', '2021-02-05 21:37:37', '2021-05-31 14:58:52'),
(946, 0, 'fr', '_json', 'SEO title', 'titre SEO', '2021-02-05 21:37:37', '2021-05-31 14:58:52'),
(947, 0, 'fr', '_json', 'Meta Description', 'Meta Description', '2021-02-05 21:37:37', '2021-05-31 14:58:52');
INSERT INTO `ltm_translations` (`id`, `status`, `locale`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(948, 0, 'fr', '_json', 'All Places', 'Toutes les offres specials', '2021-02-05 21:37:37', '2021-05-31 14:58:52'),
(949, 0, 'fr', '_json', 'Activity Type', 'Type d\'activités', '2021-02-05 21:37:37', '2021-05-31 14:58:52'),
(950, 0, 'fr', '_json', 'Countries', 'Pays', '2021-02-05 21:37:37', '2021-05-31 14:58:52'),
(951, 0, 'fr', '_json', 'Pages', 'Pages', '2021-02-05 21:37:37', '2021-05-31 14:58:52'),
(952, 0, 'fr', '_json', 'Bookings', 'Réservations', '2021-02-05 21:37:37', '2021-05-31 14:58:52'),
(953, 0, 'fr', '_json', 'SEO', 'SEO', '2021-02-05 21:37:37', '2021-05-31 14:58:52'),
(954, 0, 'fr', '_json', 'Choose your next destination', 'Choisissez votre prochaine destination', '2021-02-05 21:37:37', '2021-05-31 14:58:52'),
(956, 0, 'fr', '_json', 'Business Listing', 'Business Listing', '2021-02-05 21:37:37', '2021-05-31 14:58:52'),
(957, 0, 'fr', '_json', 'Trending Business Places', 'Destinations en tendance', '2021-02-05 21:37:37', '2021-05-31 14:58:52'),
(958, 0, 'fr', '_json', 'Choose the city you\'ll be living in next', 'Choisissez la prochaine ville dans laquelle vous vivrez', '2021-02-05 21:37:37', '2021-05-31 14:58:52'),
(959, 0, 'fr', '_json', 'Lost your password? Please enter your email address. You will receive a link to create a new password via email.', 'Mot de passe perdu? Veuillez saisir votre adresse e-mail. Vous recevrez un lien pour créer un nouveau mot de passe par e-mail.', '2021-02-05 21:37:37', '2021-05-31 14:58:52'),
(960, 0, 'fr', '_json', 'Paris', 'Paris', '2021-02-05 21:37:37', '2021-05-31 14:58:52'),
(961, 0, 'fr', '_json', 'Amenities Name', 'Nom du service', '2021-02-05 21:37:37', '2021-05-31 14:58:52'),
(962, 0, 'fr', '_json', 'Add', 'Ajouter', '2021-02-05 21:37:37', '2021-05-31 14:58:52'),
(963, 0, 'fr', '_json', 'Cancel', 'Annuler', '2021-02-05 21:37:37', '2021-05-31 14:58:52'),
(964, 0, 'fr', '_json', 'Booking at', 'Réservation au', '2021-02-05 21:37:37', '2021-05-31 14:58:52'),
(965, 0, 'fr', '_json', 'Booking place', 'Réserver sur l\'offre special', '2021-02-05 21:37:37', '2021-05-31 14:58:52'),
(966, 0, 'fr', '_json', 'Booking datetime', 'Date de réservation', '2021-02-05 21:37:37', '2021-05-31 14:58:52'),
(967, 0, 'fr', '_json', 'Number of Adult', 'Nombre d\'adultes', '2021-02-05 21:37:37', '2021-05-31 14:58:52'),
(968, 0, 'fr', '_json', 'Number of Children', 'Nombre d\'enfants', '2021-02-05 21:37:37', '2021-05-31 14:58:52'),
(969, 0, 'fr', '_json', 'Booking status', 'Statut de réservation', '2021-02-05 21:37:37', '2021-05-31 14:58:52'),
(970, 0, 'fr', '_json', 'Category Name', 'Nom de la catégorie', '2021-02-05 21:37:37', '2021-05-31 14:58:52'),
(971, 0, 'fr', '_json', 'Priority', 'Priorité', '2021-02-05 21:37:37', '2021-05-31 14:58:52'),
(972, 0, 'fr', '_json', 'Add city', 'Ajouter une ville', '2021-02-05 21:37:37', '2021-05-31 14:58:52'),
(973, 0, 'fr', '_json', 'City Name', 'Nom de la ville', '2021-02-05 21:37:37', '2021-05-31 14:58:52'),
(974, 0, 'fr', '_json', 'Add country', 'Ajouter un pays', '2021-02-05 21:37:37', '2021-05-31 14:58:52'),
(975, 0, 'fr', '_json', 'Country name', 'Nom du pays', '2021-02-05 21:37:37', '2021-05-31 14:58:52'),
(976, 0, 'fr', '_json', 'Users', 'Utilisateurs', '2021-02-05 21:37:37', '2021-05-31 14:58:52'),
(977, 0, 'fr', '_json', 'Booking Make', 'Faire une réservation', '2021-02-05 21:37:37', '2021-05-31 14:58:52'),
(978, 0, 'fr', '_json', 'Booking type', 'Type de réservation', '2021-02-05 21:37:37', '2021-05-31 14:58:52'),
(979, 0, 'fr', '_json', 'Affiliate Book Buttons', 'Boutons d\'affiliation', '2021-02-05 21:37:37', '2021-05-31 14:58:52'),
(981, 0, 'fr', '_json', 'Booking link', 'Lien de réservation', '2021-02-05 21:37:37', '2021-05-31 14:58:52'),
(982, 0, 'fr', '_json', 'Add Post', 'Ajouter un Article', '2021-02-05 21:37:37', '2021-05-31 14:58:52'),
(983, 0, 'fr', '_json', 'Title', 'Titre', '2021-02-05 21:37:37', '2021-05-31 14:58:52'),
(984, 0, 'fr', '_json', 'Content', 'Contenu', '2021-02-05 21:37:37', '2021-05-31 14:58:52'),
(985, 0, 'fr', '_json', 'Posts', 'Articles', '2021-02-05 21:37:37', '2021-05-31 14:58:52'),
(986, 0, 'fr', '_json', 'Booking form', 'Formulaire de réservation', '2021-02-05 21:37:37', '2021-05-31 14:58:52'),
(987, 0, 'fr', '_json', 'Enquiry Form', 'Formulaire', '2021-02-05 21:37:37', '2021-05-31 14:58:52'),
(988, 0, 'fr', '_json', 'Welcome to Admin Dashboard.', 'Bienvenue dans le tableau de bord d\'administration.', '2021-02-05 21:37:37', '2021-05-31 14:58:52'),
(989, 0, 'fr', '_json', 'The Admin Site is an area which only the administrator​ can access. From here you can manage (delete, edit, create) places, categories, cities, country, manage users, review, booking...', 'Le site d\'administration est une zone à laquelle seul l\'administrateur peut accéder. De là, vous pouvez gérer (supprimer, modifier, créer) des lieux, des catégories, des villes, des pays, gérer les utilisateurs, consulter, réserver.', '2021-02-05 21:37:37', '2021-05-31 14:58:52'),
(990, 0, 'fr', '_json', 'Staticts', 'Statistiques', '2021-02-05 21:37:37', '2021-05-31 14:58:52'),
(991, 0, 'fr', '_json', 'Booking detail', 'Détails de la réservation', '2021-02-05 21:37:37', '2021-05-31 14:58:52'),
(992, 0, 'fr', '_json', 'Add category', 'Ajouter une catégorie', '2021-02-05 21:37:37', '2021-05-31 14:58:52'),
(993, 0, 'fr', '_json', 'Color', 'Couleur', '2021-02-05 21:37:37', '2021-05-31 14:58:52'),
(994, 0, 'fr', '_json', 'Intro', 'Intro', '2021-02-05 21:37:38', '2021-05-31 14:58:52'),
(995, 0, 'fr', '_json', 'All Posts', 'Tous les posts', '2021-02-05 21:37:38', '2021-05-31 14:58:52'),
(996, 0, 'fr', '_json', 'Testimonials', 'Témoignages', '2021-02-05 21:37:38', '2021-05-31 14:58:52'),
(997, 0, 'fr', '_json', 'General Settings', 'Paramètre géréraux', '2021-02-05 21:37:38', '2021-05-31 14:58:52'),
(998, 0, 'fr', '_json', 'Add place type', 'Ajouter un type d\'offre special', '2021-02-05 21:37:38', '2021-05-31 14:58:52'),
(999, 0, 'fr', '_json', 'Place type name', 'Nom du type d\'offre special', '2021-02-05 21:37:38', '2021-05-31 14:58:52'),
(1000, 0, 'fr', '_json', 'Publish', 'Publier', '2021-02-05 21:37:38', '2021-05-31 14:58:52'),
(1001, 0, 'fr', '_json', 'Learn More', 'Lire plus', '2021-02-05 21:37:38', '2021-05-31 14:58:52'),
(1002, 0, 'fr', '_json', 'Add New', 'Ajouter un nouveau', '2021-02-05 21:37:38', '2021-05-31 14:58:52'),
(1003, 0, 'fr', '_json', 'Offre Date', 'Fin de l\'Offre', '2021-02-05 21:37:38', '2021-05-31 14:58:52'),
(1004, 0, 'fr', '_json', 'New Booking', 'Nouvelle Réservation', '2021-02-05 21:37:38', '2021-05-31 14:58:52'),
(1005, 0, 'fr', '_json', 'User Name', 'Nom Utilisateur', '2021-02-05 21:37:38', '2021-05-31 14:58:52'),
(1006, 0, 'fr', '_json', 'PENDING', 'En cours', '2021-02-05 21:37:38', '2021-05-31 14:58:52'),
(1007, 0, 'fr', '_json', 'Edit Booking', 'Modifier la réservation', '2021-02-05 21:37:38', '2021-05-31 14:58:52'),
(1008, 0, 'fr', '_json', 'Approved', 'Approuvé', '2021-02-05 21:37:38', '2021-05-31 14:58:52'),
(1009, 0, 'fr', '_json', 'Place deleted', 'offre special supprimée', '2021-02-05 21:37:38', '2021-05-31 14:58:52'),
(1010, 0, 'fr', '_json', 'Approve', 'Approuver', '2021-02-05 21:37:38', '2021-05-31 14:58:52'),
(1011, 0, 'fr', '_json', 'Comment', 'Commentaire', '2021-02-05 21:37:38', '2021-05-31 14:58:52'),
(1012, 0, 'fr', '_json', 'Booking', 'Réservation', '2021-02-05 21:37:38', '2021-05-31 14:58:52'),
(1013, 0, 'fr', '_json', 'Please select country first', 'Veuillez d\'abord sélectionner le pays', '2021-02-05 21:37:38', '2021-05-31 14:58:52'),
(1014, 0, 'fr', '_json', 'Star', 'Étoile', '2021-02-05 21:37:38', '2021-05-31 14:58:52'),
(1015, 0, 'fr', '_json', 'Add New Booking', 'Ajouter une nouvelle réservation', '2021-02-05 21:37:38', '2021-05-31 14:58:52'),
(1016, 0, 'fr', '_json', 'Add new Post', 'Ajouter un nouveau post', '2021-02-05 21:37:38', '2021-05-31 14:58:52'),
(1017, 0, 'fr', '_json', 'Add new Testimonial', 'Ajouter un témoignage', '2021-02-05 21:37:38', '2021-05-31 14:58:52'),
(1018, 0, 'fr', '_json', 'New user', 'Nouvelle Utilisateur', '2021-02-05 21:37:38', '2021-05-31 14:58:52'),
(1019, 0, 'fr', '_json', 'Add New User', 'Ajouter un nouvel utilisateur', '2021-02-05 21:37:38', '2021-05-31 14:58:52'),
(1020, 0, 'fr', '_json', 'and', 'et', '2021-02-05 21:37:38', '2021-05-31 14:58:52'),
(1021, 0, 'fr', '_json', 'Account Management', 'Gestion des Comptes', '2021-02-05 21:37:38', '2021-05-31 14:58:52'),
(1022, 0, 'fr', '_json', 'New Sale', 'Nouvelle Vente', '2021-02-05 21:37:38', '2021-05-31 14:58:52'),
(1023, 0, 'fr', '_json', 'New Supplier', 'Nouveau Fournisseur', '2021-02-05 21:37:38', '2021-05-31 14:58:52'),
(1024, 0, 'fr', '_json', 'Create Booking', 'Ajouter une Réservation', '2021-02-05 21:37:38', '2021-05-31 14:58:52'),
(1025, 0, 'fr', '_json', 'Edit Page', 'Modifier la page', '2021-02-05 21:37:38', '2021-05-31 14:58:52'),
(1026, 0, 'fr', '_json', 'Purchase Status', 'Status d\'Achat', '2021-02-05 21:37:38', '2021-05-31 14:58:52'),
(1027, 0, 'fr', '_json', 'Add testimonial', 'Ajouter un témoignage', '2021-02-05 21:37:39', '2021-05-31 14:58:52'),
(1028, 0, 'fr', '_json', 'Password', 'Mot de passe', '2021-02-05 21:37:39', '2021-05-31 14:58:52'),
(1029, 0, 'fr', '_json', 'Edit User', 'Modifier l\'utilisateur', '2021-02-05 21:37:39', '2021-05-31 14:58:52'),
(1030, 0, 'fr', '_json', 'View all', 'Voir tout', '2021-02-05 21:37:39', '2021-05-31 14:58:52'),
(1031, 0, 'fr', '_json', 'Subtotal', 'Sous Total', '2021-02-05 21:37:39', '2021-05-31 14:58:52'),
(1032, 0, 'fr', '_json', 'Continue Shopping', 'Continuer votre achat', '2021-02-05 21:37:39', '2021-05-31 14:58:52'),
(1033, 0, 'fr', '_json', 'Add Page', 'Ajouter une page', '2021-02-05 21:37:39', '2021-05-31 14:58:52'),
(1034, 0, 'fr', '_json', 'City?', 'Ville?', '2021-02-05 21:37:39', '2021-05-31 14:58:52'),
(1035, 0, 'fr', '_json', 'Select Activity', 'Sélection d\'Activité', '2021-02-05 21:37:39', '2021-05-31 14:58:52'),
(1036, 0, 'fr', '_json', 'Role', 'Rôle', '2021-02-05 21:37:39', '2021-05-31 14:58:52'),
(1037, 0, 'fr', '_json', 'Wholeseller', 'Fournisseur', '2021-02-05 21:37:39', '2021-05-31 14:58:52'),
(1038, 0, 'fr', '_json', 'Where are you going?', 'Où allez vous ?', '2021-02-05 21:37:39', '2021-05-31 14:58:52'),
(1039, 0, 'fr', '_json', 'Visitor', 'Visiteur', '2021-02-05 21:37:39', '2021-05-31 14:58:52'),
(1040, 0, 'fr', '_json', 'time', 'temp', '2021-02-05 21:37:39', '2021-05-31 14:58:52'),
(1041, 0, 'fr', '_json', 'Home Page', 'Accueil', '2021-02-05 21:37:39', '2021-05-31 14:58:52'),
(1042, 0, 'fr', '_json', 'Add new Page', 'Ajouter une nouvelle page', '2021-02-05 21:37:39', '2021-05-31 14:58:52'),
(1043, 0, 'fr', '_json', 'Booking Now', 'Réservez maintenant', '2021-02-05 21:37:39', '2021-05-31 14:58:52'),
(1044, 0, 'fr', '_json', 'All Activities', 'Toutes les activités', '2021-02-05 21:37:39', '2021-05-31 14:58:52'),
(1045, 0, 'fr', '_json', 'Is Admin', 'est Admin', '2021-02-05 21:37:39', '2021-05-31 14:58:52'),
(1046, 0, 'fr', '_json', 'Accept the', 'Accepter', '2021-02-05 21:37:39', '2021-05-31 14:58:52'),
(1047, 0, 'fr', '_json', 'Latest Stories', 'Derniers Articles', '2021-02-05 21:37:39', '2021-05-31 14:58:52'),
(1048, 0, 'en', '_json', 'VILLES A VOIR', 'VILLES A VOIR', '2021-02-07 11:36:46', '2021-05-31 14:58:52'),
(1049, 0, 'en', '_json', '404 Error', '404 Error', '2021-02-07 11:37:54', '2021-05-31 14:58:52'),
(1050, 0, 'fr', '_json', 'ACTIVE', 'ACTIF', '2021-02-07 19:24:12', '2021-05-31 14:58:52'),
(1051, 0, 'fr', '_json', 'Activity List', 'Liste d\'activités', '2021-02-07 19:24:12', '2021-05-31 14:58:52'),
(1052, 0, 'fr', '_json', 'Adult', 'Adulte', '2021-02-07 19:24:12', '2021-05-31 14:58:52'),
(1053, 0, 'fr', '_json', 'Affiliate Banner Ads', 'Annonces de bannière d\'affiliation', '2021-02-07 19:24:12', '2021-05-31 14:58:52'),
(1054, 0, 'fr', '_json', 'Agent', 'Agent', '2021-02-07 19:24:12', '2021-05-31 14:58:52'),
(1055, 0, 'fr', '_json', 'Amenities List', 'Liste des Services', '2021-02-07 19:24:12', '2021-05-31 14:58:52'),
(1056, 0, 'fr', '_json', 'BEST OFFERS', 'Meilleures offres', '2021-02-07 19:24:12', '2021-05-31 14:58:52'),
(1057, 0, 'fr', '_json', 'Banner image', 'Image de bannière', '2021-02-07 19:24:12', '2021-05-31 14:58:52'),
(1058, 0, 'fr', '_json', 'Banner link', 'Lien de bannière', '2021-02-07 19:24:13', '2021-05-31 14:58:52'),
(1059, 0, 'fr', '_json', 'Book Flight Tickets', 'Réserver un billet d\'avion', '2021-02-07 19:24:13', '2021-05-31 14:58:52'),
(1060, 0, 'fr', '_json', 'Book Hotel Rooms', 'Réserver des chambres d\'hôtel', '2021-02-07 19:24:13', '2021-05-31 14:58:52'),
(1061, 0, 'fr', '_json', 'Cabin', 'Cabine', '2021-02-07 19:24:13', '2021-05-31 14:58:52'),
(1062, 0, 'fr', '_json', 'Categories', 'Catégories', '2021-02-07 19:24:13', '2021-05-31 14:58:52'),
(1063, 0, 'fr', '_json', 'Categories List', 'Liste des catégories', '2021-02-07 19:24:13', '2021-05-31 14:58:52'),
(1064, 0, 'fr', '_json', 'Category name', 'Nom de l\'activité', '2021-02-07 19:24:13', '2021-05-31 14:58:52'),
(1065, 0, 'fr', '_json', 'CheckIn', 'Enregistrement', '2021-02-07 19:24:13', '2021-05-31 14:58:52'),
(1066, 0, 'fr', '_json', 'CheckOut', 'Check-out', '2021-02-07 19:24:13', '2021-05-31 14:58:52'),
(1067, 0, 'fr', '_json', 'Child', 'Enfant', '2021-02-07 19:24:13', '2021-05-31 14:58:52'),
(1068, 0, 'fr', '_json', 'Children', 'Enfants', '2021-02-07 19:24:13', '2021-05-31 14:58:52'),
(1069, 0, 'fr', '_json', 'Cities', 'Villes', '2021-02-07 19:24:13', '2021-05-31 14:58:52'),
(1070, 0, 'fr', '_json', 'Cities List', 'Liste des villes', '2021-02-07 19:24:13', '2021-05-31 14:58:52'),
(1071, 0, 'fr', '_json', 'Contact form', 'Formulaire de contact', '2021-02-07 19:24:13', '2021-05-31 14:58:52'),
(1072, 0, 'fr', '_json', 'Countries List', 'Liste des pays', '2021-02-07 19:24:13', '2021-05-31 14:58:52'),
(1073, 0, 'fr', '_json', 'Departure Airport', 'Aéroport de départ', '2021-02-07 19:24:14', '2021-05-31 14:58:52'),
(1074, 0, 'fr', '_json', 'Departure City', 'Ville de départ', '2021-02-07 19:24:14', '2021-05-31 14:58:52'),
(1075, 0, 'fr', '_json', 'Departure Date', 'Date de départ', '2021-02-07 19:24:14', '2021-05-31 14:58:52'),
(1076, 0, 'fr', '_json', 'Destination Airport', 'Aéroport de destination', '2021-02-07 19:24:14', '2021-05-31 14:58:52'),
(1077, 0, 'fr', '_json', 'Destination City', 'Destination', '2021-02-07 19:24:14', '2021-05-31 14:58:52'),
(1078, 0, 'fr', '_json', 'Detail', 'Détails', '2021-02-07 19:24:14', '2021-05-31 14:58:52'),
(1079, 0, 'fr', '_json', 'Edit place', 'Modifier l\'offre special', '2021-02-07 19:24:14', '2021-05-31 14:58:52'),
(1080, 0, 'fr', '_json', 'Edit testimonial', 'Modifier le témoignage', '2021-02-07 19:24:14', '2021-05-31 14:58:52'),
(1081, 0, 'fr', '_json', 'Find Cheap Flights', 'Trouver des vols pas chers', '2021-02-07 19:24:14', '2021-05-31 14:58:52'),
(1082, 0, 'fr', '_json', 'Gallery images', 'Images de la galerie', '2021-02-07 19:24:14', '2021-05-31 14:58:52'),
(1083, 0, 'fr', '_json', 'Hightlight', 'Hightlight', '2021-02-07 19:24:14', '2021-05-31 14:58:52'),
(1084, 0, 'fr', '_json', 'I Want To Go', 'Je veux y aller', '2021-02-07 19:24:14', '2021-05-31 14:58:52'),
(1085, 0, 'fr', '_json', 'ID', 'ID', '2021-02-07 19:24:14', '2021-05-31 14:58:52'),
(1086, 0, 'fr', '_json', 'INACTIVE', 'INACTIF', '2021-02-07 19:24:15', '2021-05-31 14:58:52'),
(1087, 0, 'fr', '_json', 'Infants', 'Les bébés', '2021-02-07 19:24:15', '2021-05-31 14:58:52'),
(1088, 0, 'fr', '_json', 'Is feature', 'Vedette', '2021-02-07 19:24:15', '2021-05-31 14:58:52'),
(1089, 0, 'fr', '_json', 'Job title', 'Profession', '2021-02-07 19:24:15', '2021-05-31 14:58:52'),
(1090, 0, 'fr', '_json', 'Latest Booking', 'Dernière réservation', '2021-02-07 19:24:15', '2021-05-31 14:58:52'),
(1091, 0, 'fr', '_json', 'Multi Destination', 'Multi-Destinations', '2021-02-07 19:24:15', '2021-05-31 14:58:52'),
(1092, 0, 'fr', '_json', 'Number of adult', 'Nombre d\'adultes', '2021-02-07 19:24:15', '2021-05-31 14:58:52'),
(1093, 0, 'fr', '_json', 'One Way', 'Aller simple', '2021-02-07 19:24:15', '2021-05-31 14:58:52'),
(1094, 0, 'fr', '_json', 'Opening hours', 'Horaires d\'ouvertures', '2021-02-07 19:24:15', '2021-05-31 14:58:52'),
(1095, 0, 'fr', '_json', 'Place List', 'Liste des offre specials', '2021-02-07 19:24:16', '2021-05-31 14:58:52'),
(1096, 0, 'fr', '_json', 'Place type', 'Type d\'offre special', '2021-02-07 19:24:16', '2021-05-31 14:58:52'),
(1097, 0, 'fr', '_json', 'Price range', 'Échelle des prix', '2021-02-07 19:24:16', '2021-05-31 14:58:52'),
(1098, 0, 'fr', '_json', 'Return Date', 'Date de retour', '2021-02-07 19:24:16', '2021-05-31 14:58:52'),
(1099, 0, 'fr', '_json', 'Reviewer', 'Critique', '2021-02-07 19:24:16', '2021-05-31 14:58:52'),
(1100, 0, 'fr', '_json', 'Reviews', 'Avis', '2021-02-07 19:24:16', '2021-05-31 14:58:52'),
(1101, 0, 'fr', '_json', 'Round Trip', 'Aller-retour', '2021-02-07 19:24:16', '2021-05-31 14:58:52'),
(1102, 0, 'fr', '_json', 'Search Flights', 'Recherche de vols', '2021-02-07 19:24:16', '2021-05-31 14:58:52'),
(1103, 0, 'fr', '_json', 'Search address...', 'Rechercher une adresse ...', '2021-02-07 19:24:17', '2021-05-31 14:58:52'),
(1104, 0, 'fr', '_json', 'Search city location...', 'Rechercher un emplacement dans la ville ...', '2021-02-07 19:24:17', '2021-05-31 14:58:52'),
(1105, 0, 'fr', '_json', 'Select Country', 'Choisissez le pays', '2021-02-07 19:24:17', '2021-05-31 14:58:52'),
(1106, 0, 'fr', '_json', 'Thumbnail image', 'Image miniature', '2021-02-07 19:24:17', '2021-05-31 14:58:52'),
(1107, 0, 'fr', '_json', 'Time', 'Temps', '2021-02-07 19:24:17', '2021-05-31 14:58:52'),
(1108, 0, 'fr', '_json', 'Time to visit', 'Temps de visiter', '2021-02-07 19:24:17', '2021-05-31 14:58:52'),
(1109, 0, 'fr', '_json', 'VILLES A VOIR', 'VILLES A VOIR', '2021-02-07 19:24:17', '2021-05-31 14:58:52'),
(1110, 0, 'fr', '_json', 'We are finding the cheapest available flights for you. Hold on for some seconds', 'Nous recherchons pour vous les vols disponibles les moins chers. Attends quelques secondes', '2021-02-07 19:24:18', '2021-05-31 14:58:52'),
(1111, 0, 'fr', '_json', 'below 2yrs', 'en dessous de 2 ans', '2021-02-07 19:24:18', '2021-05-31 14:58:52'),
(1113, 0, 'en', '_json', 'Accept the', 'ACCEPT THE', '2021-02-07 19:33:20', '2021-05-31 14:58:52'),
(1114, 0, 'en', '_json', 'Add New', 'ADD NEW', '2021-02-07 19:33:20', '2021-05-31 14:58:52'),
(1115, 0, 'en', '_json', 'Add Post', 'ADD POST', '2021-02-07 19:33:20', '2021-05-31 14:58:52'),
(1116, 0, 'en', '_json', 'Add new Post', 'ADD NEW POST', '2021-02-07 19:33:20', '2021-05-31 14:58:52'),
(1117, 0, 'en', '_json', 'Affiliate Book Buttons', 'AFFILIATE BOOK BUTTONS', '2021-02-07 19:33:21', '2021-05-31 14:58:52'),
(1118, 0, 'en', '_json', 'Basic Info', 'BASIC INFO', '2021-02-07 19:33:21', '2021-05-31 14:58:52'),
(1119, 0, 'en', '_json', 'Booking Make', 'BOOKING MAKE', '2021-02-07 19:33:21', '2021-05-31 14:58:52'),
(1120, 0, 'en', '_json', 'Business Listing', 'BUSINESS LISTING', '2021-02-07 19:33:21', '2021-05-31 14:58:52'),
(1121, 0, 'en', '_json', 'By clicking Register you agree to the', 'BY CLICKING REGISTER YOU AGREE TO THE', '2021-02-07 19:33:22', '2021-05-31 14:58:52'),
(1122, 0, 'en', '_json', 'Change Password', 'CHANGE PASSWORD', '2021-02-07 19:33:22', '2021-05-31 14:58:52'),
(1123, 0, 'en', '_json', 'Choose the city you\'ll be living in next', 'CHOOSE THE CITY YOU\'LL BE LIVING IN NEXT', '2021-02-07 19:33:22', '2021-05-31 14:58:52'),
(1124, 0, 'en', '_json', 'Choose your next destination', 'Choose your next destination', '2021-02-07 19:33:22', '2021-05-31 14:58:52'),
(1125, 0, 'en', '_json', 'Continue Shopping', 'CONTINUE SHOPPING', '2021-02-07 19:33:22', '2021-05-31 14:58:52'),
(1126, 0, 'en', '_json', 'Continue with', 'CONTINUE WITH', '2021-02-07 19:33:22', '2021-05-31 14:58:52'),
(1127, 0, 'en', '_json', 'Destinations', 'DESTINATIONS', '2021-02-07 19:33:23', '2021-05-31 14:58:52'),
(1128, 0, 'en', '_json', 'Download the app and go to travel the world.', 'DOWNLOAD THE APP AND GO TO TRAVEL THE WORLD.', '2021-02-07 19:33:23', '2021-05-31 14:58:52'),
(1129, 0, 'en', '_json', 'Enter facebook', 'ENTER FACEBOOK', '2021-02-07 19:33:23', '2021-05-31 14:58:52'),
(1130, 0, 'en', '_json', 'Enter instagram', 'ENTER INSTAGRAM', '2021-02-07 19:33:23', '2021-05-31 14:58:52'),
(1131, 0, 'en', '_json', 'Enter old password', 'ENTER OLD PASSWORD', '2021-02-07 19:33:23', '2021-05-31 14:58:52'),
(1132, 0, 'en', '_json', 'Enter phone number', 'ENTER PHONE NUMBER', '2021-02-07 19:33:23', '2021-05-31 14:58:52'),
(1133, 0, 'en', '_json', 'Enter your name', 'ENTER YOUR NAME', '2021-02-07 19:33:23', '2021-05-31 14:58:52'),
(1134, 0, 'en', '_json', 'Explore the world', 'EXPLORE THE WORLD', '2021-02-07 19:33:23', '2021-05-31 14:58:52'),
(1135, 0, 'en', '_json', 'Facebook', 'FACEBOOK', '2021-02-07 19:33:23', '2021-05-31 14:58:52'),
(1136, 0, 'en', '_json', 'Faqs', 'FAQS', '2021-02-07 19:33:23', '2021-05-31 14:58:52'),
(1137, 0, 'en', '_json', 'Featured Cities', 'FEATURED CITIES', '2021-02-07 19:33:23', '2021-05-31 14:58:52'),
(1138, 0, 'en', '_json', 'Forgot password', 'FORGOT PASSWORD', '2021-02-07 19:33:23', '2021-05-31 14:58:52'),
(1139, 0, 'en', '_json', 'From Our Blog', 'FROM OUR BLOG', '2021-02-07 19:33:23', '2021-05-31 14:58:52'),
(1140, 0, 'en', '_json', 'Full name', 'FULL NAME', '2021-02-07 19:33:23', '2021-05-31 14:58:52'),
(1141, 0, 'en', '_json', 'Get the App', 'GET THE APP', '2021-02-07 19:33:24', '2021-05-31 14:58:52'),
(1142, 0, 'en', '_json', 'Homepage', 'HOMEPAGE', '2021-02-07 19:33:24', '2021-05-31 14:58:52'),
(1143, 0, 'en', '_json', 'Instagram', 'INSTAGRAM', '2021-02-07 19:33:24', '2021-05-31 14:58:52'),
(1144, 0, 'en', '_json', 'Latest Stories', 'LATEST STORIES', '2021-02-07 19:33:24', '2021-05-31 14:58:52'),
(1145, 0, 'en', '_json', 'Learn More', 'LEARN MORE', '2021-02-07 19:33:24', '2021-05-31 14:58:52'),
(1146, 0, 'en', '_json', 'Log In', 'LOG IN', '2021-02-07 19:33:24', '2021-05-31 14:58:52'),
(1147, 0, 'en', '_json', 'Lost your password? Please enter your email address. You will receive a link to create a new password via email.', 'LOST YOUR PASSWORD? PLEASE ENTER YOUR EMAIL ADDRESS. YOU WILL RECEIVE A LINK TO CREATE A NEW PASSWORD VIA EMAIL.', '2021-02-07 19:33:24', '2021-05-31 14:58:52'),
(1148, 0, 'en', '_json', 'Make sure you\'ve typed in the URL correctly or try go', 'MAKE SURE YOU\'VE TYPED IN THE URL CORRECTLY OR TRY GO', '2021-02-07 19:33:24', '2021-05-31 14:58:52'),
(1149, 0, 'en', '_json', 'My Places', 'MY PLACES', '2021-02-07 19:33:25', '2021-05-31 14:58:52'),
(1150, 0, 'en', '_json', 'Old password', 'OLD PASSWORD', '2021-02-07 19:33:25', '2021-05-31 14:58:52'),
(1151, 0, 'en', '_json', 'Or', 'OR', '2021-02-07 19:33:25', '2021-05-31 14:58:52'),
(1152, 0, 'en', '_json', 'Paris', 'PARIS', '2021-02-07 19:33:25', '2021-05-31 14:58:52'),
(1153, 0, 'en', '_json', 'Popular cities', 'POPULAR CITIES', '2021-02-07 19:33:26', '2021-05-31 14:58:52'),
(1154, 0, 'en', '_json', 'Popular:', 'POPULAR:', '2021-02-07 19:33:26', '2021-05-31 14:58:52'),
(1155, 0, 'en', '_json', 'Posts', 'POSTS', '2021-02-07 19:33:26', '2021-05-31 14:58:52'),
(1156, 0, 'en', '_json', 'Profile Setting', 'PROFILE SETTING', '2021-02-07 19:33:26', '2021-05-31 14:58:52'),
(1157, 0, 'en', '_json', 'Purchase Status', 'PURCHASE STATUS', '2021-02-07 19:33:26', '2021-05-31 14:58:52'),
(1158, 0, 'en', '_json', 'Related stories', 'RELATED STORIES', '2021-02-07 19:33:26', '2021-05-31 14:58:52'),
(1159, 0, 'en', '_json', 'Search places ...', 'SEARCH PLACES ...', '2021-02-07 19:33:26', '2021-05-31 14:58:52'),
(1160, 0, 'en', '_json', 'Sorry we couldn\'t find that page.', 'SORRY WE COULDN\'T FIND THAT PAGE.', '2021-02-07 19:33:27', '2021-05-31 14:58:52'),
(1161, 0, 'en', '_json', 'Subtotal', 'SUBTOTAL', '2021-02-07 19:33:27', '2021-05-31 14:58:52'),
(1162, 0, 'en', '_json', 'The Admin Site is an area which only the administrator​ can access. From here you can manage (delete edit create) places categories cities country manage users review booking...', 'THE ADMIN SITE IS AN AREA WHICH ONLY THE ADMINISTRATOR​ CAN ACCESS. FROM HERE YOU CAN MANAGE (DELETE EDIT CREATE) PLACES CATEGORIES CITIES COUNTRY MANAGE USERS REVIEW BOOKING...', '2021-02-07 19:33:27', '2021-05-31 14:58:52'),
(1163, 0, 'en', '_json', 'Trending Business Places', 'TRENDING BUSINESS PLACES', '2021-02-07 19:33:27', '2021-05-31 14:58:52'),
(1164, 0, 'en', '_json', 'Type a city or location', 'TYPE A CITY OR LOCATION', '2021-02-07 19:33:27', '2021-05-31 14:58:52'),
(1165, 0, 'en', '_json', 'Upload new', 'UPLOAD NEW', '2021-02-07 19:33:28', '2021-05-31 14:58:52'),
(1166, 0, 'en', '_json', 'View all', 'VIEW ALL', '2021-02-07 19:33:28', '2021-05-31 14:58:52'),
(1167, 0, 'en', '_json', 'View more', 'VIEW MORE', '2021-02-07 19:33:28', '2021-05-31 14:58:52'),
(1168, 0, 'en', '_json', 'We can\'t find the page or studio you\'re looking for.', 'WE CAN\'T FIND THE PAGE OR STUDIO YOU\'RE LOOKING FOR.', '2021-02-07 19:33:28', '2021-05-31 14:58:52'),
(1169, 0, 'en', '_json', 'We\'re sorry but we do not have any listings matching your search try to change you search settings', 'WE\'RE SORRY BUT WE DO NOT HAVE ANY LISTINGS MATCHING YOUR SEARCH TRY TO CHANGE YOU SEARCH SETTINGS', '2021-02-07 19:33:28', '2021-05-31 14:58:52'),
(1170, 0, 'en', '_json', 'Welcome to Admin Dashboard.', 'WELCOME TO ADMIN DASHBOARD.', '2021-02-07 19:33:28', '2021-05-31 14:58:52'),
(1171, 0, 'en', '_json', 'Your Booking is Pending We Will Contact You as Soon as Possible.', 'YOUR BOOKING IS PENDING WE WILL CONTACT YOU AS SOON AS POSSIBLE.', '2021-02-07 19:33:28', '2021-05-31 14:58:52'),
(1172, 0, 'en', '_json', 'Youtube Vimeo video url', 'YOUTUBE VIMEO VIDEO URL', '2021-02-07 19:33:28', '2021-05-31 14:58:52'),
(1173, 0, 'en', '_json', 'and', 'AND', '2021-02-07 19:33:28', '2021-05-31 14:58:52'),
(1174, 0, 'en', '_json', 'categories', 'CATEGORIES', '2021-02-07 19:33:28', '2021-05-31 14:58:52'),
(1175, 0, 'en', '_json', 'set out by this site including our Cookie Use.', 'SET OUT BY THIS SITE INCLUDING OUR COOKIE USE.', '2021-02-07 19:33:28', '2021-05-31 14:58:52'),
(1177, 0, 'en', '_json', 'Sorry, we couldn\'t find that page.', 'Sorry, we couldn\'t find that page.', '2021-02-07 19:34:52', '2021-05-31 14:58:52'),
(1178, 0, 'en', '_json', 'The Admin Site is an area which only the administrator​ can access. From here you can manage (delete, edit, create) places, categories, cities, country, manage users, review, booking...', 'The Admin Site is an area which only the administrator​ can access. From here you can manage (delete, edit, create) places, categories, cities, country, manage users, review, booking...', '2021-02-07 19:35:00', '2021-05-31 14:58:52'),
(1179, 0, 'fr', '_json', 'Youtube Vimeo video url', 'Youtube Vimeo video url', '2021-02-07 19:35:27', '2021-05-31 14:58:52'),
(1180, 0, 'fr', '_json', 'Your Booking is Pending We Will Contact You as Soon as Possible.', 'Votre réservation est en attente Nous vous contacterons dès que possible.', '2021-02-11 19:51:01', '2021-05-31 14:58:52'),
(1181, 0, 'fr', '_json', 'We\'re sorry but we do not have any listings matching your search try to change you search settings', 'Nous sommes désolés, mais nous n\'avons aucune annonce correspondant à votre recherche. Essayez de modifier vos paramètres de recherche', '2021-02-11 19:51:14', '2021-05-31 14:58:52'),
(1182, 0, 'fr', '_json', 'Sorry we couldn\'t find that page.', 'Désolé, nous n\'avons pas pu trouver cette page.', '2021-02-11 19:51:30', '2021-05-31 14:58:52'),
(1185, 0, 'fr', '_json', 'Sur Name', 'Nom', '2021-02-11 19:51:59', '2021-05-31 14:58:52'),
(1187, 0, 'fr', '_json', 'Valid Email', 'Email Valide', '2021-02-11 19:51:59', '2021-05-31 14:58:52'),
(1192, 0, 'fr', '_json', 'Add new', 'Ajouter', '2021-02-11 19:51:59', '2021-05-31 14:58:52'),
(1198, 0, 'fr', '_json', 'Client infos', 'infos client', '2021-02-11 19:51:59', '2021-05-31 14:58:52'),
(1203, 0, 'fr', '_json', 'Itinerary', 'itinéraires', '2021-02-11 19:51:59', '2021-05-31 14:58:52'),
(1204, 0, 'fr', '_json', 'Included', 'Inclus', '2021-02-11 19:51:59', '2021-05-31 14:58:52'),
(1206, 0, 'fr', '_json', 'Guest', 'Nombre de Visiteurs', '2021-02-11 19:51:59', '2021-05-31 14:58:52'),
(1207, 0, 'fr', '_json', 'Enter your phone', 'Entrez votre numéro', '2021-02-11 19:51:59', '2021-05-31 14:58:52'),
(1208, 0, 'fr', '_json', 'Enter your message', 'Entrez votre message', '2021-02-11 19:51:59', '2021-05-31 14:58:52'),
(1211, 0, 'fr', '_json', 'Search Hotels', 'Recherche des Hotels', '2021-02-11 19:51:59', '2021-05-31 14:58:52'),
(1213, 0, 'fr', '_json', 'Obtenir l\'application', 'Obtenir l\'application', '2021-02-11 19:52:00', '2021-05-31 14:58:52'),
(1216, 0, 'fr', '_json', 'Hello', 'Bonjour', '2021-02-11 19:52:00', '2021-05-31 14:58:52'),
(1218, 0, 'fr', '_json', 'Online', 'En ligne', '2021-02-11 19:52:00', '2021-05-31 14:58:52'),
(1220, 0, 'fr', '_json', 'My Transactions', 'Mes Transactions', '2021-02-11 19:52:00', '2021-05-31 14:58:52'),
(1221, 0, 'fr', '_json', 'Hi,', 'Bonjour,', '2021-02-11 19:52:00', '2021-05-31 14:58:52'),
(1222, 0, 'fr', '_json', 'By clicking Register you agree to the', 'En cliquant sur S\'inscrire, vous acceptez les', '2021-02-11 19:52:33', '2021-05-31 14:58:52'),
(1223, 0, 'en', '_json', 'Client infos', 'Client infos', '2021-02-11 19:52:43', '2021-05-31 14:58:52'),
(1224, 0, 'en', '_json', 'Enter your message', 'Enter your message', '2021-02-11 19:53:53', '2021-05-31 14:58:52'),
(1225, 0, 'en', '_json', 'Enter your phone', 'Enter your phone', '2021-02-11 19:53:57', '2021-05-31 14:58:52'),
(1226, 0, 'en', '_json', 'Hello', 'Hello', '2021-02-11 19:54:07', '2021-05-31 14:58:52'),
(1227, 0, 'en', '_json', 'Search Hotels', 'Search Hotels', '2021-02-11 19:57:13', '2021-05-31 14:58:52'),
(1228, 0, 'fr', '_json', 'Cities to visit', 'Villes à visiter', '2021-02-11 20:39:17', '2021-05-31 14:58:52'),
(1230, 0, 'en', '_json', 'Cities to visit', 'Cities to visit', '2021-02-11 20:40:51', '2021-05-31 14:58:52'),
(1231, 0, 'fr', '_json', 'Sign up to receive our best offers.', 'Inscrivez-vous pour recevoir nos meilleures offres.', '2021-02-11 21:13:06', '2021-05-31 14:58:52'),
(1232, 0, 'en', '_json', 'Sign up to receive our best offers.', 'Sign up to receive our best offers.', '2021-02-11 21:13:16', '2021-05-31 14:58:52'),
(1233, 0, 'fr', '_json', 'Vats Management', 'Gestion de la TAX', '2021-02-12 16:03:30', '2021-05-31 14:58:52'),
(1237, 0, 'fr', '_json', 'Vat List', 'List TVA', '2021-02-12 16:03:30', '2021-05-31 14:58:52'),
(1240, 0, 'fr', '_json', 'Contact information', 'Informations de contact', '2021-02-12 16:03:31', '2021-05-31 14:58:52'),
(1241, 0, 'fr', '_json', 'Manage Pages', 'Gérer les pages', '2021-02-12 16:03:31', '2021-05-31 14:58:52'),
(1242, 0, 'fr', '_json', 'Administration', 'Administration', '2021-02-12 16:03:31', '2021-05-31 14:58:52'),
(1243, 0, 'en', '_json', 'Administration', 'Administration', '2021-02-12 16:03:54', '2021-05-31 14:58:52'),
(1244, 0, 'en', '_json', 'Manage Pages', 'Manage Pages', '2021-02-15 15:16:29', '2021-05-31 14:58:52'),
(1245, 0, 'en', '_json', 'Included', 'Included', '2021-02-15 15:33:06', '2021-05-31 14:58:52'),
(1246, 0, 'en', '_json', 'My Transactions', 'My Transactions', '2021-02-15 15:33:53', '2021-05-31 14:58:52'),
(1247, 0, 'en', '_json', 'Obtenir l\'application', 'Get the application', '2021-02-15 15:34:35', '2021-05-31 14:58:52'),
(1248, 0, 'en', '_json', 'Vat List', 'Vat List', '2021-02-15 15:37:07', '2021-05-31 14:58:52'),
(1249, 0, 'en', '_json', 'Vats Management', 'Vats Management', '2021-02-15 15:37:43', '2021-05-31 14:58:52'),
(1250, 0, 'en', '_json', 'Transactions', 'Transactions', '2021-02-15 15:37:50', '2021-05-31 14:58:52'),
(1251, 0, 'en', '_json', 'Terms & Conditions', 'Terms & Conditions', '2021-02-15 15:37:58', '2021-05-31 14:58:52'),
(1252, 0, 'en', '_json', 'Sur Name', 'Name', '2021-02-15 15:38:08', '2021-05-31 14:58:52'),
(1254, 0, 'fr', '_json', 'Enter Day', 'Entez le jour', '2021-02-15 20:08:34', '2021-05-31 14:58:52'),
(1255, 0, 'fr', '_json', 'Save here and book later', 'Enregistrer ici et réservez plus tard', '2021-02-15 20:08:34', '2021-05-31 14:58:52'),
(1256, 0, 'fr', '_json', 'Quick Links', 'Liens Rapides', '2021-02-15 20:08:34', '2021-05-31 14:58:52'),
(1257, 0, 'en', '_json', 'Quick Links', 'Quick Links', '2021-02-15 20:10:23', '2021-05-31 14:58:52'),
(1258, 0, 'fr', '_json', 'account', 'Compte', '2021-02-15 20:18:57', '2021-05-31 14:58:52'),
(1259, 0, 'en', '_json', 'account', 'Account', '2021-02-15 20:19:54', '2021-05-31 14:58:52'),
(1260, 0, 'en', '_json', 'Hi,', 'Hi,', '2021-02-16 16:37:53', '2021-05-31 14:58:52'),
(1261, 0, 'en', '_json', 'Valid Email', 'Valid Email', '2021-02-16 19:43:33', '2021-05-31 14:58:52'),
(1262, 0, 'fr', '_json', 'Lundi - Vendredi', 'Lundi - Vendredi', '2021-02-16 19:51:45', '2021-05-31 14:58:52'),
(1263, 0, 'fr', '_json', 'Booking list', 'Liste des réservations', '2021-02-16 19:51:45', '2021-05-31 14:58:52'),
(1264, 0, 'fr', '_json', 'Clear Cache', 'Vider le cache', '2021-02-16 19:51:46', '2021-05-31 14:58:52'),
(1266, 0, 'en', '_json', 'Itinerary', 'Itinerary', '2021-02-16 19:52:41', '2021-05-31 14:58:52'),
(1267, 0, 'en', '_json', 'Lundi - Vendredi', 'Monday - Friday', '2021-02-16 19:53:21', '2021-05-31 14:58:52'),
(1269, 0, 'fr', '_json', 'Choose between hundred places', 'Choisissez entre une centaine de destinations', '2021-02-17 15:50:22', '2021-05-31 14:58:52'),
(1270, 0, 'fr', '_json', 'Home', 'Accueil', '2021-02-17 15:50:22', '2021-05-31 14:58:52'),
(1273, 0, 'fr', '_json', 'Rentacstours, motocycle rental company and tour operator, located in Casablanca, relies on\n                            the technical know-how and years of experience acquired from EagleRider, a world leader\n                            company since 1992. Rentacstours was created by 2 motorcycle enthusiasts and HOG Harley\n                            Davidson road team certified.', 'Rentacstours, société de location de motos et tour opérateur, située à Casablanca, s\'appuie sur le savoir-faire technique et les années d\'expérience acquises auprès d\'EagleRider, leader mondial depuis 1992. Rentacstours a été créée par 2 passionnés de moto et certifiés HOG Harley Davidson road team.', '2021-02-17 17:02:21', '2021-05-31 14:58:52'),
(1274, 0, 'fr', '_json', 'Rentacstours, motocycle rental company and tour operator, located in Casablanca, relies on\n                            the technical know-how and years of experience acquired from EagleRider, a world leader\n                            company since 1992. Rentacstours was created by 2 motorcycle enthusiasts and HOG Harley\n                            Davidson road team certified', 'Rentacstours, société de location de motos et tour opérateur, située à Casablanca, s\'appuie sur le savoir-faire technique et les années d\'expérience acquises auprès d\'EagleRider, leader mondial depuis 1992. Rentacstours a été créée par 2 passionnés de moto et certifiés HOG Harley Davidson road team.', '2021-02-17 17:02:38', '2021-05-31 14:58:52'),
(1275, 0, 'fr', '_json', 'Rentacstours about info', 'Fondée par deux bikers passionnés certifiés par HOG Harley-Davidson: Nizar CHAWAD et Mohamed Ali ANOUAR, et profitant de l\'expertise managériale de monsieur Ali Amrani, Rentacstours est aujourd’hui une extension de savoir-faire et une multitude de services sur mesure allant des voyages organisés hôtels, hébergement, vol aux activités de divertissement, sports extrêmes et bien-être Motorcycle, Golf tour, Bivouacs, Trekking, Surf, Yoga .. Nous proposons aussi des services à l’international grâce à la participation de différents partenaires qui ont accepté de prendre part à cette aventure.', '2021-02-17 17:04:05', '2021-05-31 14:58:52'),
(1276, 0, 'en', '_json', 'Rentacstours about info', 'Rentacstours, motocycle rental company and tour operator, located in Casablanca, relies on the technical know-how and years of experience acquired from EagleRider, a world leader company since 1992. Rentacstours was created by 2 motorcycle enthusiasts and HOG Harley Davidson road team certified.', '2021-02-17 17:04:40', '2021-05-31 14:58:52'),
(1277, 0, 'en', '_json', 'Guest', 'Guest', '2021-02-19 20:25:38', '2021-05-31 14:58:52'),
(1280, 0, 'fr', '_json', 'Booking For', 'Réservation pour', '2021-03-01 20:59:32', '2021-05-31 14:58:52'),
(1281, 0, 'fr', '_json', '60 characters or less', '60 caractères ou moins', '2021-03-01 20:59:33', '2021-05-31 14:58:52'),
(1282, 0, 'fr', '_json', '160 characters or less', '160 caractères ou moins', '2021-03-01 20:59:33', '2021-05-31 14:58:52'),
(1283, 0, 'fr', '_json', 'Other Name', 'Nom utilisateur', '2021-03-01 20:59:33', '2021-05-31 14:58:52'),
(1284, 0, 'fr', '_json', 'Add VAT', 'Ajouter la TAX', '2021-03-01 20:59:33', '2021-05-31 14:58:52'),
(1285, 0, 'fr', '_json', 'choose vat type', 'choisir le type de TVA', '2021-03-01 20:59:33', '2021-05-31 14:58:52'),
(1286, 0, 'fr', '_json', 'vat value e.g. 12.00', 'valeur de la tva, par exemple 12,00', '2021-03-01 20:59:33', '2021-05-31 14:58:52'),
(1287, 0, 'fr', '_json', 'Value Type', 'Type de valeur', '2021-03-01 20:59:33', '2021-05-31 14:58:52'),
(1288, 0, 'fr', '_json', 'Value', 'Valeur', '2021-03-01 20:59:33', '2021-05-31 14:58:52'),
(1289, 0, 'fr', '_json', 'Email Subscriptions', 'Inscription des Email', '2021-03-01 20:59:33', '2021-05-31 14:58:52'),
(1290, 0, 'fr', '_json', 'Emails', 'Emails', '2021-03-01 20:59:33', '2021-05-31 14:58:52'),
(1291, 0, 'fr', '_json', 'Menu Management', 'Gestion du Menu', '2021-03-01 20:59:33', '2021-05-31 14:58:52'),
(1292, 0, 'fr', '_json', 'Packages Categories', 'Catégories de paquets', '2021-03-01 20:59:33', '2021-05-31 14:58:52'),
(1293, 0, 'fr', '_json', 'Package Categories', 'Pack d\'activité', '2021-03-01 20:59:33', '2021-05-31 14:58:52'),
(1294, 0, 'fr', '_json', 'Package Category', 'Pack d\'activité', '2021-03-01 20:59:33', '2021-05-31 14:58:52'),
(1295, 0, 'fr', '_json', 'Active', 'Actif', '2021-03-01 20:59:33', '2021-05-31 14:58:52'),
(1296, 0, 'fr', '_json', 'Disabled', 'Désactivé', '2021-03-01 20:59:33', '2021-05-31 14:58:52'),
(1297, 0, 'fr', '_json', 'Edit package category', 'Modifier la catégorie de pack', '2021-03-01 20:59:33', '2021-05-31 14:58:52'),
(1298, 0, 'fr', '_json', 'Open hourses', 'Heures d\'ouverture', '2021-03-01 20:59:33', '2021-05-31 14:58:52'),
(1299, 0, 'fr', '_json', 'BOOKING TYPE', 'Type de Réservation', '2021-03-01 20:59:33', '2021-05-31 14:58:52'),
(1300, 0, 'fr', '_json', 'City name', 'Nom de la ville', '2021-03-01 20:59:33', '2021-05-31 14:58:52'),
(1301, 0, 'fr', '_json', 'Package Itinerary', 'Pack Itineraire', '2021-03-01 20:59:33', '2021-05-31 14:58:52'),
(1302, 0, 'fr', '_json', 'Opening Hours', 'Horaires d\'ouvertures', '2021-03-01 20:59:33', '2021-05-31 14:58:52'),
(1303, 0, 'fr', '_json', 'Airport or City Name', 'Airport ou nom de la Ville', '2021-03-01 20:59:33', '2021-05-31 14:58:52'),
(1304, 0, 'fr', '_json', 'E.g. City, Airport', 'Par exemple, ville, aéroport', '2021-03-01 20:59:33', '2021-05-31 14:58:52'),
(1305, 0, 'fr', '_json', 'Téléchargez l\'application et partez parcourir le monde.', 'Download the application and travel the world.', '2021-03-01 20:59:33', '2021-05-31 14:58:52'),
(1307, 0, 'fr', '_json', 'Offline(Bank)', 'T/T (Banque)', '2021-03-01 20:59:34', '2021-05-31 14:58:52'),
(1308, 0, 'fr', '_json', 'Menu Settings', 'Réglage Menu', '2021-03-01 20:59:34', '2021-05-31 14:58:52'),
(1309, 0, 'fr', '_json', 'Clear translations', 'Nettoyer la traduction', '2021-03-01 20:59:34', '2021-05-31 14:58:52'),
(1310, 0, 'fr', '_json', 'Deleted', 'Supprimé', '2021-03-03 16:08:46', '2021-05-31 14:58:52'),
(1311, 0, 'fr', '_json', 'New Booking(s).', 'Nouvelle Reservation', '2021-03-03 16:08:47', '2021-05-31 14:58:52'),
(1312, 0, 'fr', '_json', 'You Have a new order.', 'Vous avez une nouvelle commande', '2021-03-03 16:08:47', '2021-05-31 14:58:52'),
(1313, 0, 'fr', '_json', 'No New Notifications.', 'Aucune Notifications.', '2021-03-03 16:08:47', '2021-05-31 14:58:52'),
(1314, 0, 'fr', '_json', 'New Notification(s).', 'Nouvelle Notification(s)', '2021-03-03 16:08:47', '2021-05-31 14:58:52'),
(1315, 0, 'fr', '_json', 'A New User Has Registered.', 'Un nouvel utilisateur s\'est inscrit.', '2021-03-03 16:08:47', '2021-05-31 14:58:52'),
(1316, 0, 'fr', '_json', 'Hi', 'Bonjour', '2021-03-03 16:08:47', '2021-05-31 14:58:52'),
(1317, 0, 'fr', '_json', 'Successful Flight Bookings', 'Réservations de vol réussies', '2021-03-08 16:31:18', '2021-05-31 14:58:52'),
(1318, 0, 'fr', '_json', 'Successful Hotel Bookings', 'Réservations hôtel réussies', '2021-03-08 16:31:18', '2021-05-31 14:58:52'),
(1319, 0, 'fr', '_json', 'Successful Package Bookings', 'Réservations de Pack   réussies', '2021-03-08 16:31:18', '2021-05-31 14:58:52'),
(1320, 0, 'fr', '_json', 'Booking Size', 'Taille de la réservation', '2021-03-08 16:31:18', '2021-05-31 14:58:52'),
(1321, 0, 'fr', '_json', 'Packages', 'Pack', '2021-03-08 16:31:18', '2021-05-31 14:58:52'),
(1322, 0, 'fr', '_json', 'Enter Pnr or booking reference', 'Entrer le Pnr ou la reference de reservation', '2021-03-08 16:31:19', '2021-05-31 14:58:52'),
(1323, 0, 'fr', '_json', 'Terms & Conditions', 'CONDITIONS GÉNÉRALES DE VENTE', '2021-03-08 16:45:58', '2021-05-31 14:58:52'),
(1324, 0, 'fr', '_json', 'Menu Structure', 'Structure du Menu', '2021-03-08 16:51:26', '2021-05-31 14:58:52'),
(1325, 0, 'fr', '_json', 'Select the menu you want to edit', 'Sélectionnez le menu que vous souhaitez modifier', '2021-03-08 16:51:26', '2021-05-31 14:58:52'),
(1326, 0, 'fr', '_json', 'or', 'ou', '2021-03-08 16:58:46', '2021-05-31 14:58:52'),
(1327, 0, 'fr', '_json', 'Create new menu', 'Créer un nouveau Menu', '2021-03-08 16:58:46', '2021-05-31 14:58:52'),
(1328, 0, 'fr', '_json', 'Custom Link', 'Lien personnalisé', '2021-03-08 16:58:46', '2021-05-31 14:58:52'),
(1329, 0, 'fr', '_json', 'Press return or enter to expand', 'Appuyez sur retour ou sur entrée pour développer', '2021-03-08 16:58:46', '2021-05-31 14:58:52'),
(1330, 0, 'fr', '_json', 'URL', 'Lien (URL)', '2021-03-08 16:58:46', '2021-05-31 14:58:52'),
(1331, 0, 'fr', '_json', 'Label', 'Nom', '2021-03-08 16:58:46', '2021-05-31 14:58:52'),
(1332, 0, 'fr', '_json', 'Add menu item', 'Ajouter un élément au menu', '2021-03-08 16:58:46', '2021-05-31 14:58:52'),
(1333, 0, 'fr', '_json', 'Create menu', 'Créer un Menu', '2021-03-08 16:58:46', '2021-05-31 14:58:52'),
(1334, 0, 'fr', '_json', 'Enter menu name', 'Entrer le nom du Menu', '2021-03-08 16:58:46', '2021-05-31 14:58:52'),
(1335, 0, 'fr', '_json', 'Save menu', 'Enregistrer le Menu', '2021-03-08 16:58:46', '2021-05-31 14:58:52'),
(1336, 0, 'fr', '_json', 'Place each item in the order you prefer. Click on the arrow to the right of the item to display more configuration options.', 'Placez chaque article dans l\'ordre que vous préférez. Cliquez sur la flèche à droite de l\'élément pour afficher plus d\'options de configuration.', '2021-03-08 16:58:46', '2021-05-31 14:58:52'),
(1338, 0, 'fr', '_json', 'Link', 'Lien', '2021-03-08 16:58:46', '2021-05-31 14:58:52'),
(1339, 0, 'fr', '_json', 'Class CSS (optional)', 'Class CSS (optionnel)', '2021-03-08 16:58:46', '2021-05-31 14:58:52'),
(1340, 0, 'fr', '_json', 'Update item', 'Mise à jour de l\'element', '2021-03-08 16:58:46', '2021-05-31 14:58:52'),
(1341, 0, 'fr', '_json', 'Move up', 'Déplacer vers le haut', '2021-03-08 16:58:46', '2021-05-31 14:58:52'),
(1343, 0, 'fr', '_json', 'Delete menu', 'Supprimé le Menu', '2021-03-08 16:58:46', '2021-05-31 14:58:52'),
(1344, 0, 'fr', '_json', 'Using Email', 'Utilisation du courrier électronique', '2021-04-20 15:52:54', '2021-05-31 14:58:52'),
(1345, 0, 'fr', '_json', 'Hotel Name', 'Nom de l\'hôtel', '2021-04-20 15:52:54', '2021-05-31 14:58:52'),
(1346, 0, 'fr', '_json', 'Manage Your Information', 'Gerer vos informations', '2021-04-20 15:52:54', '2021-05-31 14:58:52'),
(1347, 0, 'fr', '_json', 'Surname', 'Nom', '2021-04-20 15:52:54', '2021-05-31 14:58:52'),
(1348, 0, 'fr', '_json', 'First Name', 'Prénom', '2021-04-20 15:52:55', '2021-05-31 14:58:52'),
(1349, 0, 'fr', '_json', 'Update Customer Information', 'Mise à jour des informations sur les clients', '2021-04-20 15:52:55', '2021-05-31 14:58:52'),
(1350, 0, 'fr', '_json', 'Enter New Password', 'Entrer le nouveau mot de passe', '2021-04-20 15:52:55', '2021-05-31 14:58:52'),
(1351, 0, 'fr', '_json', 'Confirm New Password', 'Confirmer le nouveau mot de passe', '2021-04-20 15:52:55', '2021-05-31 14:58:52'),
(1352, 0, 'fr', '_json', 'You are logged in!', 'Vous êtes connecté !', '2021-04-20 15:52:55', '2021-05-31 14:58:52'),
(1353, 0, 'fr', '_json', 'Bookings List', 'Liste des réservations', '2021-04-20 15:52:55', '2021-05-31 14:58:52'),
(1354, 0, 'fr', '_json', 'Actions', 'Actions', '2021-04-20 15:52:55', '2021-05-31 14:58:52'),
(1355, 0, 'fr', '_json', 'Reference', 'Référence', '2021-04-20 15:52:55', '2021-05-31 14:58:52'),
(1356, 0, 'fr', '_json', 'Reservation Status', 'Statut de la réservation', '2021-04-20 15:52:55', '2021-05-31 14:58:52'),
(1357, 0, 'fr', '_json', 'Customer Name', 'Nom du client', '2021-04-20 15:52:55', '2021-05-31 14:58:52'),
(1358, 0, 'fr', '_json', 'Reservations Attempts', 'Tentatives de réservation', '2021-04-20 15:52:55', '2021-05-31 14:58:52'),
(1359, 0, 'fr', '_json', 'Payed Successful Reservations', 'Réservations réussies payées', '2021-04-20 15:52:55', '2021-05-31 14:58:52'),
(1360, 0, 'fr', '_json', 'Payed Unsuccessful Reservations', 'Réservations infructueuses payées', '2021-04-20 15:52:55', '2021-05-31 14:58:52'),
(1361, 0, 'fr', '_json', 'Failed Reservations', 'Réservations échouées', '2021-04-20 15:52:55', '2021-05-31 14:58:52'),
(1362, 0, 'fr', '_json', 'Cancelled Reservations', 'Réservations annulées', '2021-04-20 15:52:55', '2021-05-31 14:58:52'),
(1364, 0, 'fr', '_json', 'Due Date', 'Date d\'expiration', '2021-04-20 15:52:55', '2021-05-31 14:58:52'),
(1365, 0, 'fr', '_json', 'Cancellation Status', 'Statut d\'annulation', '2021-04-20 15:52:55', '2021-05-31 14:58:52'),
(1366, 0, 'fr', '_json', 'Successful', 'Succès de', '2021-04-20 15:52:55', '2021-05-31 14:58:52'),
(1367, 0, 'fr', '_json', 'Incomplete', 'Incomplète', '2021-04-20 15:52:55', '2021-05-31 14:58:52'),
(1368, 0, 'fr', '_json', 'Feature title', 'Titre en vedette', '2021-04-20 15:52:55', '2021-05-31 14:58:52'),
(1369, 0, 'fr', '_json', 'Icon Marker', 'Marqueur d\'icône', '2021-04-20 15:52:55', '2021-05-31 14:58:52'),
(1370, 0, 'fr', '_json', 'City List', 'Liste des villes', '2021-04-20 15:52:56', '2021-05-31 14:58:52'),
(1371, 0, 'fr', '_json', 'ICE', 'ICE', '2021-04-20 15:52:56', '2021-05-31 14:58:52'),
(1372, 0, 'fr', '_json', 'Code Postal', 'Code postal', '2021-04-20 15:52:56', '2021-05-31 14:58:52'),
(1374, 0, 'fr', '_json', 'Pays', 'Pays', '2021-04-20 15:52:56', '2021-05-31 14:58:52'),
(1375, 0, 'fr', '_json', 'Subscribers', 'Abonnès à la newsletter', '2021-04-20 15:52:56', '2021-05-31 14:58:52'),
(1376, 0, 'fr', '_json', 'Today', 'Aujourd\'hui', '2021-04-20 15:52:56', '2021-05-31 14:58:52'),
(1377, 0, 'fr', '_json', 'Last month', 'Le mois dernier', '2021-04-20 15:52:56', '2021-05-31 14:58:52'),
(1378, 0, 'fr', '_json', 'Last 6 month', '6 derniers mois', '2021-04-20 15:52:56', '2021-05-31 14:58:52'),
(1379, 0, 'fr', '_json', 'Last year', 'L\'année dernière', '2021-04-20 15:52:56', '2021-05-31 14:58:52'),
(1380, 0, 'fr', '_json', 'Total Sales', 'Total des ventes', '2021-04-20 15:52:56', '2021-05-31 14:58:52'),
(1381, 0, 'fr', '_json', 'Total Purchases', 'Total des achats', '2021-04-20 15:52:56', '2021-05-31 14:58:52'),
(1382, 0, 'fr', '_json', 'Total Return', 'Total des avoirs', '2021-04-20 15:52:56', '2021-05-31 14:58:52'),
(1383, 0, 'fr', '_json', 'Wallet Balance', 'Solde du portefeuille', '2021-04-20 15:52:56', '2021-05-31 14:58:52'),
(1384, 0, 'fr', '_json', 'Infos', 'Infos', '2021-04-20 15:52:56', '2021-05-31 14:58:52'),
(1385, 0, 'fr', '_json', 'Add Terms and Conditions', 'Ajouter des conditions générales', '2021-04-20 15:52:56', '2021-05-31 14:58:52'),
(1386, 0, 'fr', '_json', 'Unpublish', 'Dépublier', '2021-04-20 15:52:56', '2021-05-31 14:58:52'),
(1387, 0, 'fr', '_json', 'Edit Terms and Conditions', 'Modifier les conditions générales', '2021-04-20 15:52:56', '2021-05-31 14:58:52'),
(1388, 0, 'fr', '_json', 'Terms and Conditions List', 'Terms and Conditions', '2021-04-20 15:52:56', '2021-05-31 14:58:52'),
(1390, 0, 'fr', '_json', 'title', 'titre', '2021-04-20 15:52:56', '2021-05-31 14:58:52'),
(1391, 0, 'fr', '_json', 'reference', 'référence', '2021-04-20 15:52:56', '2021-05-31 14:58:52'),
(1392, 0, 'fr', '_json', 'Unit Price', 'Prix Unitaire', '2021-04-20 15:52:56', '2021-05-31 14:58:52'),
(1393, 0, 'fr', '_json', 'Order Tax', 'Taxe sur les commandes', '2021-04-20 15:52:56', '2021-05-31 14:58:52'),
(1394, 0, 'fr', '_json', 'CHOOSE A TEMPLATE', 'CHOISIR UN MODÈLE', '2021-04-20 15:52:56', '2021-05-31 14:58:52'),
(1395, 0, 'fr', '_json', 'New message', 'Nouveau Message', '2021-04-20 15:52:56', '2021-05-31 14:58:52'),
(1396, 0, 'fr', '_json', 'Recipient', 'Bénéficiaire', '2021-04-20 15:52:57', '2021-05-31 14:58:52'),
(1397, 0, 'fr', '_json', 'Subject', 'Sujet', '2021-04-20 15:52:57', '2021-05-31 14:58:52'),
(1398, 0, 'fr', '_json', 'close', 'fermer', '2021-04-20 15:52:57', '2021-05-31 14:58:52'),
(1399, 0, 'fr', '_json', 'Send Mail', 'Envoyer un courrier', '2021-04-20 15:52:57', '2021-05-31 14:58:52'),
(1401, 0, 'fr', '_json', 'Add newsletter', 'Ajouter une newsletter', '2021-04-20 15:52:57', '2021-05-31 14:58:52'),
(1402, 0, 'fr', '_json', 'Edit newsletter', 'Modification Newsletter', '2021-04-20 15:52:57', '2021-05-31 14:58:52'),
(1404, 0, 'fr', '_json', 'Email List', 'Liste des Email', '2021-04-20 15:52:57', '2021-05-31 14:58:52'),
(1405, 0, 'fr', '_json', 'Add Email', 'Ajouter un Email', '2021-04-20 15:52:57', '2021-05-31 14:58:52'),
(1406, 0, 'fr', '_json', 'Send Email Promotion', 'Envoyer un courriel de promotion', '2021-04-20 15:52:57', '2021-05-31 14:58:52'),
(1407, 0, 'fr', '_json', 'Send Mail to Subscribers', 'Envoyer un courrier', '2021-04-20 15:52:57', '2021-05-31 14:58:52'),
(1408, 0, 'fr', '_json', 'Enter subject of E-mail', 'Entrez l\'objet de l\'e-mail', '2021-04-20 15:52:57', '2021-05-31 14:58:52'),
(1409, 0, 'fr', '_json', 'itinerary', 'itinéraire', '2021-04-20 15:52:57', '2021-05-31 14:58:52'),
(1410, 0, 'fr', '_json', 'Edit  place', 'Modifier l\'offre special', '2021-04-20 15:52:57', '2021-05-31 14:58:52'),
(1411, 0, 'fr', '_json', 'Places List', 'Liste des offers special', '2021-04-20 15:52:57', '2021-05-31 14:58:52'),
(1412, 0, 'fr', '_json', 'Activity Type List', 'Liste des types d\'activités', '2021-04-20 15:52:57', '2021-05-31 14:58:52'),
(1413, 0, 'fr', '_json', 'Posts List', 'Liste des postes', '2021-04-20 15:52:57', '2021-05-31 14:58:52');
INSERT INTO `ltm_translations` (`id`, `status`, `locale`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1414, 0, 'fr', '_json', 'All Categories', 'Toutes catégories', '2021-04-20 15:52:57', '2021-05-31 14:58:52'),
(1415, 0, 'fr', '_json', 'Print', 'Impression', '2021-04-20 15:52:57', '2021-05-31 14:58:52'),
(1416, 0, 'fr', '_json', 'Select supplier', 'Choisir le fournisseur', '2021-04-20 15:52:57', '2021-05-31 14:58:52'),
(1418, 0, 'fr', '_json', 'Wire', 'FIL', '2021-04-20 15:52:57', '2021-05-31 14:58:52'),
(1420, 0, 'fr', '_json', 'Paid Amount', 'Montant payé', '2021-04-20 15:52:58', '2021-05-31 14:58:52'),
(1421, 0, 'fr', '_json', 'Change Amount', 'Changement Montant', '2021-04-20 15:52:58', '2021-05-31 14:58:52'),
(1422, 0, 'fr', '_json', 'Validate', 'Valider', '2021-04-20 15:52:58', '2021-05-31 14:58:52'),
(1423, 0, 'fr', '_json', 'Purchases List', 'Liste des Achats', '2021-04-20 15:52:58', '2021-05-31 14:58:52'),
(1424, 0, 'fr', '_json', 'View details', 'Voir les détails', '2021-04-20 15:52:58', '2021-05-31 14:58:52'),
(1425, 0, 'fr', '_json', 'Complete', 'Terminé', '2021-04-20 15:52:58', '2021-05-31 14:58:52'),
(1426, 0, 'fr', '_json', 'purchase Status', 'statut d\'achat', '2021-04-20 15:52:58', '2021-05-31 14:58:52'),
(1427, 0, 'fr', '_json', 'SubTotal', 'Sous-total', '2021-04-20 15:52:58', '2021-05-31 14:58:52'),
(1428, 0, 'fr', '_json', 'Total Cost', 'Coût total', '2021-04-20 15:52:58', '2021-05-31 14:58:52'),
(1429, 0, 'fr', '_json', 'Total Tax', 'Total des impôts', '2021-04-20 15:52:58', '2021-05-31 14:58:52'),
(1430, 0, 'fr', '_json', 'Document', 'Document', '2021-04-20 15:52:58', '2021-05-31 14:58:52'),
(1431, 0, 'fr', '_json', 'Invoice', 'Facture', '2021-04-20 15:52:58', '2021-05-31 14:58:52'),
(1433, 0, 'fr', '_json', 'Create New Return', 'Créer un avoir', '2021-04-20 15:52:58', '2021-05-31 14:58:52'),
(1434, 0, 'fr', '_json', 'New Return', 'Nouveau avoir', '2021-04-20 15:52:58', '2021-05-31 14:58:52'),
(1435, 0, 'fr', '_json', 'Return Status', 'Status de retour', '2021-04-20 15:52:58', '2021-05-31 14:58:52'),
(1437, 0, 'fr', '_json', 'WIRE', 'FIL', '2021-04-20 15:52:58', '2021-05-31 14:58:52'),
(1438, 0, 'fr', '_json', 'Return Note', 'Note d\'avoir', '2021-04-20 15:52:58', '2021-05-31 14:58:52'),
(1439, 0, 'fr', '_json', 'Returns List', 'Liste des avoirs', '2021-04-20 15:52:58', '2021-05-31 14:58:52'),
(1440, 0, 'fr', '_json', 'Returns', 'Avoir', '2021-04-20 15:52:58', '2021-05-31 14:58:52'),
(1441, 0, 'fr', '_json', 'Add New Return', 'Ajouter un avoir', '2021-04-20 15:52:59', '2021-05-31 14:58:52'),
(1442, 0, 'fr', '_json', 'return Status', 'retourner l\'état', '2021-04-20 15:52:59', '2021-05-31 14:58:52'),
(1443, 0, 'fr', '_json', 'Sales List', 'Liste des ventes', '2021-04-20 15:52:59', '2021-05-31 14:58:52'),
(1444, 0, 'fr', '_json', 'Orders Table', 'Tableau des commandes', '2021-04-20 15:52:59', '2021-05-31 14:58:52'),
(1445, 0, 'fr', '_json', 'Total Price', 'Prix total', '2021-04-20 15:52:59', '2021-05-31 14:58:52'),
(1446, 0, 'fr', '_json', 'Quotation', 'Devis', '2021-04-20 15:52:59', '2021-05-31 14:58:52'),
(1447, 0, 'fr', '_json', 'Return', 'Avoirs', '2021-04-20 15:52:59', '2021-05-31 14:58:52'),
(1448, 0, 'fr', '_json', 'Bank Detail', 'Détail de la Banque', '2021-04-20 15:52:59', '2021-05-31 14:58:52'),
(1449, 0, 'fr', '_json', 'Add Bank Account Details', 'Ajouter les détails du compte bancaire', '2021-04-20 15:52:59', '2021-05-31 14:58:52'),
(1450, 0, 'fr', '_json', 'Account Name', 'Nom du compte', '2021-04-20 15:52:59', '2021-05-31 14:58:52'),
(1451, 0, 'fr', '_json', 'Account Number', 'Numero de compte', '2021-04-20 15:52:59', '2021-05-31 14:58:52'),
(1452, 0, 'fr', '_json', 'Bank', 'Banque', '2021-04-20 15:52:59', '2021-05-31 14:58:52'),
(1453, 0, 'fr', '_json', 'SELECT BANK', 'SELECTIONNER LA BANQUE', '2021-04-20 15:52:59', '2021-05-31 14:58:52'),
(1454, 0, 'fr', '_json', 'Branch', 'Branche', '2021-04-20 15:52:59', '2021-05-31 14:58:52'),
(1455, 0, 'fr', '_json', 'Ifsc Code', 'Code Ifsc', '2021-04-20 15:52:59', '2021-05-31 14:58:52'),
(1456, 0, 'fr', '_json', 'iBAN Code', 'Code IBAN', '2021-04-20 15:52:59', '2021-05-31 14:58:52'),
(1457, 0, 'fr', '_json', 'Bank Details', 'Détails de la banque', '2021-04-20 15:52:59', '2021-05-31 14:58:52'),
(1458, 0, 'fr', '_json', 'Bank Name', 'Nom de la banque', '2021-04-20 15:52:59', '2021-05-31 14:58:52'),
(1459, 0, 'fr', '_json', 'IFSC Code', 'Code IFSC', '2021-04-20 15:52:59', '2021-05-31 14:58:52'),
(1460, 0, 'fr', '_json', 'Airline Markdown', 'Markdown des compagnies aériennes', '2021-04-20 15:52:59', '2021-05-31 14:58:52'),
(1461, 0, 'fr', '_json', 'Add Markdown', 'Ajouter Markdown', '2021-04-20 15:52:59', '2021-05-31 14:58:52'),
(1462, 0, 'fr', '_json', 'Airline', 'Compagnie aérienne', '2021-04-20 15:52:59', '2021-05-31 14:58:52'),
(1464, 0, 'fr', '_json', 'SELECT', 'SÉLECTIONNER', '2021-04-20 15:53:00', '2021-05-31 14:58:52'),
(1465, 0, 'fr', '_json', 'Percentage', 'Pourcentage', '2021-04-20 15:53:00', '2021-05-31 14:58:52'),
(1466, 0, 'fr', '_json', 'Dirham Marocain', 'Dirham Marocain', '2021-04-20 15:53:00', '2021-05-31 14:58:52'),
(1467, 0, 'fr', '_json', 'Airlines Markdown', 'Compagnies aériennes Markdown', '2021-04-20 15:53:00', '2021-05-31 14:58:52'),
(1468, 0, 'fr', '_json', 'Airline Code', 'Code de la compagnie aérienne', '2021-04-20 15:53:00', '2021-05-31 14:58:52'),
(1469, 0, 'fr', '_json', 'Airline Name', 'Nom de la compagnie aérienne', '2021-04-20 15:53:00', '2021-05-31 14:58:52'),
(1470, 0, 'fr', '_json', 'Add Markup', 'Ajouter un balisage', '2021-04-20 15:53:00', '2021-05-31 14:58:52'),
(1471, 0, 'fr', '_json', 'all fields are required', 'tous les champs sont obligatoires', '2021-04-20 15:53:00', '2021-05-31 14:58:52'),
(1472, 0, 'fr', '_json', 'Enter your address to help use serve you better', 'Saisissez votre adresse pour nous aider à mieux vous servir', '2021-04-20 15:53:00', '2021-05-31 14:58:52'),
(1473, 0, 'fr', '_json', 'Edit Your Profile Image', 'Modifier l\'image de votre profil', '2021-04-20 15:53:00', '2021-05-31 14:58:52'),
(1474, 0, 'fr', '_json', 'Enter New Image', 'Entrer une nouvelle image', '2021-04-20 15:53:00', '2021-05-31 14:58:52'),
(1475, 0, 'fr', '_json', 'Gender', 'Sexe', '2021-04-20 15:53:00', '2021-05-31 14:58:52'),
(1476, 0, 'fr', '_json', 'User Type', 'Type d\'utilisateur', '2021-04-20 15:53:00', '2021-05-31 14:58:52'),
(1477, 0, 'fr', '_json', 'Surname (Family name)', 'Nom', '2021-04-20 15:53:00', '2021-05-31 14:58:52'),
(1478, 0, 'fr', '_json', 'First name (Your name)', 'Prénom', '2021-04-20 15:53:00', '2021-05-31 14:58:52'),
(1479, 0, 'fr', '_json', 'Other name', 'Nom utilisateur', '2021-04-20 15:53:00', '2021-05-31 14:58:52'),
(1480, 0, 'fr', '_json', 'Other name (Your other name)', 'Username (Votre nom d\'utilisateur)', '2021-04-20 15:53:00', '2021-05-31 14:58:52'),
(1481, 0, 'fr', '_json', 'address', 'adresse', '2021-04-20 15:53:00', '2021-05-31 14:58:52'),
(1482, 0, 'fr', '_json', 'All Users', 'Tous les utilisateurs', '2021-04-20 15:53:00', '2021-05-31 14:58:52'),
(1483, 0, 'fr', '_json', 'Profile Status', 'Statut du profil', '2021-04-20 15:53:00', '2021-05-31 14:58:52'),
(1484, 0, 'fr', '_json', 'Update User', 'Mise à jour de l\'utilisateur', '2021-04-20 15:53:00', '2021-05-31 14:58:52'),
(1485, 0, 'fr', '_json', 'Super Admin', 'Super Administrateur', '2021-04-20 15:53:00', '2021-05-31 14:58:52'),
(1486, 0, 'fr', '_json', 'Create Slider', 'Créez un slider', '2021-04-20 15:53:01', '2021-05-31 14:58:52'),
(1487, 0, 'fr', '_json', 'Edit Slider', 'Modifier le slider', '2021-04-20 15:53:01', '2021-05-31 14:58:52'),
(1488, 0, 'fr', '_json', 'Sliders List', 'Liste des images Slider', '2021-04-20 15:53:01', '2021-05-31 14:58:52'),
(1489, 0, 'fr', '_json', 'Slider List', 'Liste des images Slider', '2021-04-20 15:53:01', '2021-05-31 14:58:52'),
(1490, 0, 'fr', '_json', 'Add New Slider', 'Ajoute de slider', '2021-04-20 15:53:01', '2021-05-31 14:58:52'),
(1491, 0, 'fr', '_json', 'Image', 'Image', '2021-04-20 15:53:01', '2021-05-31 14:58:52'),
(1492, 0, 'fr', '_json', 'Testimonials List', 'Liste de témoignages', '2021-04-20 15:53:01', '2021-05-31 14:58:52'),
(1493, 0, 'fr', '_json', 'Deal booking', 'Réservation de l\'offre', '2021-04-20 15:53:01', '2021-05-31 14:58:52'),
(1494, 0, 'fr', '_json', 'Existing users, please login', 'Utilisateurs existants, veuillez vous connecter', '2021-04-20 15:53:01', '2021-05-31 14:58:52'),
(1495, 0, 'fr', '_json', 'Sign In', 'Connexion', '2021-04-20 15:53:01', '2021-05-31 14:58:52'),
(1496, 0, 'fr', '_json', 'Forget Password', 'Mot de passe oublié', '2021-04-20 15:53:01', '2021-05-31 14:58:52'),
(1497, 0, 'fr', '_json', 'Not a registered customer ? Register here.', 'Vous n\'êtes pas un client enregistré ? Inscrivez-vous ici.', '2021-04-20 15:53:01', '2021-05-31 14:58:52'),
(1498, 0, 'fr', '_json', 'password_confirmation', 'confirmation_du_mot de passe', '2021-04-20 15:53:01', '2021-05-31 14:58:52'),
(1499, 0, 'fr', '_json', 'Booking Details', 'Détails de la réservation', '2021-04-20 15:53:01', '2021-05-31 14:58:52'),
(1501, 0, 'fr', '_json', 'Use logged in customer details', 'Utiliser les détails du client connecté', '2021-04-20 15:53:01', '2021-05-31 14:58:52'),
(1502, 0, 'fr', '_json', 'CONTINUE', 'CONTINUER', '2021-04-20 15:53:01', '2021-05-31 14:58:52'),
(1503, 0, 'fr', '_json', 'Details', 'Détails', '2021-04-20 15:53:01', '2021-05-31 14:58:52'),
(1504, 0, 'fr', '_json', 'DEAL NAME', 'NOM DE L\'AFFAIRE', '2021-04-20 15:53:01', '2021-05-31 14:58:52'),
(1505, 0, 'fr', '_json', 'FLIGHT', 'Vol', '2021-04-20 15:53:01', '2021-05-31 14:58:52'),
(1506, 0, 'fr', '_json', 'HOTEL', 'HÔTEL', '2021-04-20 15:53:01', '2021-05-31 14:58:52'),
(1507, 0, 'fr', '_json', 'ATTRACTION', 'ATTRACTION', '2021-04-20 15:53:01', '2021-05-31 14:58:52'),
(1508, 0, 'fr', '_json', 'ADULT PRICE', 'Prix d\'Adulte', '2021-04-20 15:53:01', '2021-05-31 14:58:52'),
(1509, 0, 'fr', '_json', 'CHILD PRICE', 'PRIX POUR LES ENFANTS', '2021-04-20 15:53:02', '2021-05-31 14:58:52'),
(1510, 0, 'fr', '_json', 'INFANT PRICE', 'PRIX INFANT', '2021-04-20 15:53:02', '2021-05-31 14:58:52'),
(1511, 0, 'fr', '_json', 'CONTACT NUMBER', 'NUMÉRO DE CONTACT', '2021-04-20 15:53:02', '2021-05-31 14:58:52'),
(1512, 0, 'fr', '_json', 'Need Help', 'Besoin d\'aide', '2021-04-20 15:53:02', '2021-05-31 14:58:52'),
(1513, 0, 'fr', '_json', 'Contact us for assistance', 'Contactez-nous pour obtenir de l\'aide', '2021-04-20 15:53:02', '2021-05-31 14:58:52'),
(1514, 0, 'fr', '_json', 'Price Details', 'Détails des prix', '2021-04-20 15:53:02', '2021-05-31 14:58:52'),
(1515, 0, 'fr', '_json', 'SERVICE FEES', 'FRAIS DE SERVICE', '2021-04-20 15:53:02', '2021-05-31 14:58:52'),
(1516, 0, 'fr', '_json', 'TAXES', 'IMPÔTS', '2021-04-20 15:53:02', '2021-05-31 14:58:52'),
(1517, 0, 'fr', '_json', 'DISCOUNT', 'DISCOUNT', '2021-04-20 15:53:02', '2021-05-31 14:58:52'),
(1518, 0, 'fr', '_json', 'TOTAL PRICE', 'PRIX TOTAL', '2021-04-20 15:53:02', '2021-05-31 14:58:52'),
(1519, 0, 'fr', '_json', 'Need Help? Call us or drop a message. Our agents will be in touch shortly', 'Besoin d\'aide ? Appelez-nous ou envoyez-nous un message. Nos agents vous contacteront sous peu.', '2021-04-20 15:53:02', '2021-05-31 14:58:52'),
(1520, 0, 'fr', '_json', 'Result Found Matching Your Search', 'Résultat trouvé correspondant à votre recherche', '2021-04-20 15:53:02', '2021-05-31 14:58:52'),
(1521, 0, 'fr', '_json', 'Any', 'Quelconque', '2021-04-20 15:53:02', '2021-05-31 14:58:52'),
(1523, 0, 'fr', '_json', 'Select', 'Sélectionnez', '2021-04-20 15:53:02', '2021-05-31 14:58:52'),
(1524, 0, 'fr', '_json', 'Email new booking', 'Envoyer une nouvelle réservation par courriel', '2021-04-20 15:53:02', '2021-05-31 14:58:52'),
(1525, 0, 'fr', '_json', 'You have booking from website', 'Vous avez réservé à partir du site web', '2021-04-20 15:53:02', '2021-05-31 14:58:52'),
(1526, 0, 'fr', '_json', 'Datetime', 'Date-heure', '2021-04-20 15:53:02', '2021-05-31 14:58:52'),
(1527, 0, 'fr', '_json', 'Number of children', 'Nombre d\'enfants', '2021-04-20 15:53:02', '2021-05-31 14:58:52'),
(1528, 0, 'fr', '_json', 'Email from system', 'Email du système', '2021-04-20 15:53:02', '2021-05-31 14:58:52'),
(1529, 0, 'fr', '_json', 'You Have a reservation.', 'Vous avez une réservation.', '2021-04-20 15:53:03', '2021-05-31 14:58:52'),
(1531, 0, 'fr', '_json', 'My Bookings', 'Mes Reservations', '2021-04-20 15:53:03', '2021-05-31 14:58:52'),
(1532, 0, 'fr', '_json', 'Slides', 'Image du Slider', '2021-04-20 15:53:03', '2021-05-31 14:58:52'),
(1533, 0, 'fr', '_json', 'Users List', 'Liste des utilisateurs', '2021-04-20 15:53:03', '2021-05-31 14:58:52'),
(1534, 0, 'fr', '_json', 'Return List', 'Liste des avoirs', '2021-04-20 15:53:03', '2021-05-31 14:58:52'),
(1535, 0, 'fr', '_json', 'Mail to Subscribers', 'Compagne Emailing', '2021-04-20 15:53:03', '2021-05-31 14:58:52'),
(1536, 0, 'fr', '_json', 'The Admin Site is an area which only the administrator​ can access. From here you can manage (delete edit create) places categories cities country manage users review booking...', 'Le site d\'administration est une zone à laquelle seul l\'administrateur peut accéder. De là, vous pouvez gérer (supprimer, modifier, créer) les lieux, les catégories, les villes, les pays, les utilisateurs, les réservations...', '2021-04-22 16:00:43', '2021-05-31 14:58:52'),
(1537, 0, 'fr', '_json', 'set out by this site including our Cookie Use.', 'définis par ce site, y compris notre utilisation des cookies.', '2021-04-22 16:13:44', '2021-05-31 14:58:52'),
(1538, 0, 'en', '_json', 'Other Name', 'Username', '2021-04-22 17:42:46', '2021-05-31 14:58:52'),
(1539, 0, 'en', '_json', 'Other name', 'Username', '2021-04-22 17:42:51', '2021-05-31 14:58:52'),
(1554, 0, 'fr', '_json', 'Go Home', 'Retour vers l\'acceuil', '2021-05-18 08:46:54', '2021-05-31 14:58:52'),
(1561, 0, 'fr', '_json', 'Amount Paid', 'Montant à Payer', '2021-05-18 08:46:54', '2021-05-31 14:58:52'),
(1570, 0, 'fr', '_json', 'Amount', 'Montant', '2021-05-18 08:46:55', '2021-05-31 14:58:52'),
(1572, 0, 'fr', '_json', 'Ticket Status', 'Status du Ticket', '2021-05-18 08:46:55', '2021-05-31 14:58:52'),
(1578, 0, 'fr', '_json', 'Category Type List', 'Liste de type d\'activité', '2021-05-18 08:46:55', '2021-05-31 14:58:52'),
(1579, 0, 'fr', '_json', 'Add Category Type', 'Ajoute type d\'activité', '2021-05-18 08:46:55', '2021-05-31 14:58:52'),
(1580, 0, 'fr', '_json', 'Category type Name', 'Nom de type d\'activité', '2021-05-18 08:46:55', '2021-05-31 14:58:52'),
(1585, 0, 'fr', '_json', 'Add Offer', 'Ajouter une offre', '2021-05-18 08:46:55', '2021-05-31 14:58:52'),
(1586, 0, 'fr', '_json', 'Offer name', 'Nom de l\'offre', '2021-05-18 08:46:55', '2021-05-31 14:58:52'),
(1588, 0, 'fr', '_json', 'Edit Offer', 'Modifier l\'offre', '2021-05-18 08:46:55', '2021-05-31 14:58:52'),
(1589, 0, 'fr', '_json', 'Offer List', 'Liste des offres', '2021-05-18 08:46:55', '2021-05-31 14:58:52'),
(1591, 0, 'fr', '_json', 'Period', 'Durée', '2021-05-18 08:46:55', '2021-05-31 14:58:52'),
(1592, 0, 'fr', '_json', 'Start Date', 'Date d\'arrivée', '2021-05-18 08:46:55', '2021-05-31 14:58:52'),
(1593, 0, 'fr', '_json', 'End Date', 'Date de départ', '2021-05-18 08:46:56', '2021-05-31 14:58:52'),
(1596, 0, 'fr', '_json', 'Create', 'Creation', '2021-05-18 08:46:56', '2021-05-31 14:58:52'),
(1605, 0, 'fr', '_json', 'Category detail', 'Detail d\'activité', '2021-05-18 08:46:56', '2021-05-31 14:58:52'),
(1606, 0, 'fr', '_json', 'Category Type detail', 'Detail de type d\'activité', '2021-05-18 08:46:57', '2021-05-31 14:58:52'),
(1607, 0, 'fr', '_json', 'City detail', 'Detail de la ville', '2021-05-18 08:46:57', '2021-05-31 14:58:52'),
(1610, 0, 'fr', '_json', 'Best Offers', 'Meilleures offres', '2021-05-18 08:46:57', '2021-05-31 14:58:52'),
(1611, 0, 'fr', '_json', 'Offer', 'Offre', '2021-05-18 08:46:57', '2021-05-31 14:58:52'),
(1612, 0, 'fr', '_json', 'Read More', 'Lire plus', '2021-05-18 08:46:57', '2021-05-31 14:58:52'),
(1615, 0, 'fr', '_json', 'Cart', 'Panier', '2021-05-18 08:46:57', '2021-05-31 14:58:52'),
(1619, 0, 'fr', '_json', 'Days', 'Jours', '2021-05-18 08:46:57', '2021-05-31 14:58:52'),
(1621, 0, 'fr', '_json', 'subtotal', 'Sous Total', '2021-05-18 08:46:57', '2021-05-31 14:58:52'),
(1623, 0, 'fr', '_json', 'Special Offers', 'Offre Special', '2021-05-18 08:46:57', '2021-05-31 14:58:52'),
(1624, 0, 'fr', '_json', 'Offers List', 'Liste des offres', '2021-05-18 08:46:57', '2021-05-31 14:58:52'),
(1628, 0, 'fr', '_json', 'From', 'Depuis', '2021-05-19 08:28:41', '2021-05-31 14:58:52'),
(1632, 0, 'fr', '_json', 'Contact Details', 'Details du Contact', '2021-05-19 08:28:42', '2021-05-31 14:58:52'),
(1633, 0, 'fr', '_json', 'User Profile', 'Profil Utilisateur', '2021-05-19 08:28:45', '2021-05-31 14:58:52'),
(1634, 0, 'en', '_json', 'Prix', 'Price', '2021-05-19 08:48:09', '2021-05-31 14:58:52'),
(1635, 0, 'en', '_json', 'Ville', 'City', '2021-05-19 08:55:37', '2021-05-31 14:58:52'),
(1636, 0, 'en', '_json', 'Nuit', 'Night', '2021-05-19 08:56:39', '2021-05-31 14:58:52'),
(1639, 0, 'fr', '_json', 'Offers', 'Offres', '2021-05-19 09:09:21', '2021-05-31 14:58:52'),
(1640, 0, 'fr', '_json', 'Offers Category List', 'Activité des Offres', '2021-05-19 09:09:21', '2021-05-31 14:58:52'),
(1641, 0, 'fr', '_json', 'Offers Category Type List', 'Type d\'activité des Offres', '2021-05-19 09:09:21', '2021-05-31 14:58:52'),
(1642, 0, 'fr', 'Loading', '..', NULL, '2021-05-27 09:06:00', '2021-05-27 09:06:00'),
(1643, 0, 'fr', 'E', 'g. City, Airport', NULL, '2021-05-27 09:06:00', '2021-05-27 09:06:00'),
(1644, 0, 'fr', '_json', 'Golf Tours', NULL, '2021-05-27 09:06:00', '2021-05-27 09:06:00'),
(1645, 0, 'fr', '_json', 'Sign up Using Email', 'Inscription par email', '2021-05-27 09:06:00', '2021-05-31 14:58:52'),
(1646, 0, 'fr', '_json', 'Bad Request', 'Mauvaise requête', '2021-05-27 09:06:00', '2021-05-31 14:58:52'),
(1647, 0, 'fr', '_json', 'Unauthorized Access', NULL, '2021-05-27 09:06:00', '2021-05-27 09:06:00'),
(1648, 0, 'fr', '_json', 'Access Denied/Forbidden !', 'Accès refusé/interdit', '2021-05-27 09:06:00', '2021-05-31 14:58:52'),
(1649, 0, 'fr', '_json', 'Not Found', 'Non trouvé', '2021-05-27 09:06:00', '2021-05-31 14:58:52'),
(1650, 0, 'fr', '_json', 'Page Expired', 'Page expirée', '2021-05-27 09:06:00', '2021-05-31 14:58:52'),
(1651, 0, 'fr', '_json', 'Too Many Requests', 'Trop de requêtes', '2021-05-27 09:06:00', '2021-05-31 14:58:52'),
(1652, 0, 'fr', '_json', 'Internal Server Error', 'Erreur interne du serveur', '2021-05-27 09:06:01', '2021-05-31 14:58:52'),
(1653, 0, 'fr', '_json', 'Service Unavailable', 'Service indisponible', '2021-05-27 09:06:01', '2021-05-31 14:58:52'),
(1654, 0, 'fr', '_json', 'Troubleshooting Error, Looks like something is wrong.', 'Erreur, On dirait que quelque chose ne va pas.', '2021-05-27 09:06:01', '2021-05-31 14:58:52'),
(1655, 0, 'fr', '_json', 'Oh no', NULL, '2021-05-27 09:06:01', '2021-05-27 09:06:01'),
(1656, 0, 'fr', '_json', 'Attempted Bookings', 'Tentatives de réservations', '2021-05-27 09:06:01', '2021-05-31 14:58:52'),
(1657, 0, 'fr', '_json', 'Paid Bookings', 'Réservations payées', '2021-05-27 09:06:01', '2021-05-31 14:58:52'),
(1658, 0, 'fr', '_json', 'Pending/Failed Bookings', 'Réservations en attente/échec', '2021-05-27 09:06:01', '2021-05-31 14:58:52'),
(1659, 0, 'fr', '_json', 'Deal Bookings', NULL, '2021-05-27 09:06:01', '2021-05-27 09:06:01'),
(1660, 0, 'fr', '_json', '(S/N)', NULL, '2021-05-27 09:06:01', '2021-05-27 09:06:01'),
(1661, 0, 'fr', '_json', 'Deal Name', NULL, '2021-05-27 09:06:01', '2021-05-27 09:06:01'),
(1662, 0, 'fr', '_json', 'Date Booked', 'Date de réservation', '2021-05-27 09:06:01', '2021-05-31 14:58:52'),
(1663, 0, 'fr', '_json', 'Reservations Created', 'Réservations effectuées', '2021-05-27 09:06:01', '2021-05-31 14:58:52'),
(1664, 0, 'fr', '_json', 'Issued Ticket', NULL, '2021-05-27 09:06:01', '2021-05-27 09:06:01'),
(1665, 0, 'fr', '_json', 'Cancelled Reservation', 'Réservation annulée', '2021-05-27 09:06:01', '2021-05-31 14:58:52'),
(1666, 0, 'fr', '_json', 'Void Tickets', NULL, '2021-05-27 09:06:01', '2021-05-27 09:06:01'),
(1667, 0, 'fr', '_json', 'Agent Flight Reservations', NULL, '2021-05-27 09:06:01', '2021-05-27 09:06:01'),
(1668, 0, 'fr', '_json', 'PNR', NULL, '2021-05-27 09:06:01', '2021-05-27 09:06:01'),
(1669, 0, 'fr', '_json', 'Agent Name', NULL, '2021-05-27 09:06:01', '2021-05-27 09:06:01'),
(1670, 0, 'fr', '_json', 'Ticket Time Limit', NULL, '2021-05-27 09:06:01', '2021-05-27 09:06:01'),
(1671, 0, 'fr', '_json', 'Created Date', 'Date de création', '2021-05-27 09:06:01', '2021-05-31 14:58:52'),
(1672, 0, 'fr', '_json', 'Customer Flight Reservations', NULL, '2021-05-27 09:06:01', '2021-05-27 09:06:01'),
(1673, 0, 'fr', '_json', 'Flight Reservations', NULL, '2021-05-27 09:06:01', '2021-05-27 09:06:01'),
(1674, 0, 'fr', '_json', 'My Hotel Reservations', NULL, '2021-05-27 09:06:01', '2021-05-27 09:06:01'),
(1675, 0, 'fr', '_json', 'Add Offer Type', 'Ajouter un type d\'offre', '2021-05-27 09:06:01', '2021-05-31 14:58:52'),
(1676, 0, 'fr', '_json', 'Ville', NULL, '2021-05-27 09:06:01', '2021-05-27 09:06:01'),
(1677, 0, 'fr', '_json', '#', NULL, '2021-05-27 09:06:02', '2021-05-27 09:06:02'),
(1678, 0, 'fr', '_json', 'Date d’émission', NULL, '2021-05-27 09:06:02', '2021-05-27 09:06:02'),
(1679, 0, 'fr', '_json', 'To', 'Vers', '2021-05-27 09:06:02', '2021-05-31 14:58:52'),
(1680, 0, 'fr', '_json', 'Service', NULL, '2021-05-27 09:06:02', '2021-05-27 09:06:02'),
(1681, 0, 'fr', '_json', 'Bon pour Accord', NULL, '2021-05-27 09:06:02', '2021-05-27 09:06:02'),
(1682, 0, 'fr', '_json', 'newsletters', NULL, '2021-05-27 09:06:02', '2021-05-27 09:06:02'),
(1683, 0, 'fr', '_json', 'Newsletters', NULL, '2021-05-27 09:06:02', '2021-05-27 09:06:02'),
(1684, 0, 'fr', '_json', 'What the name of offer', 'quel est le nom de l\'offre', '2021-05-27 09:06:02', '2021-05-31 14:58:52'),
(1685, 0, 'fr', '_json', 'Add Package', 'Ajouter un pack', '2021-05-27 09:06:02', '2021-05-31 14:58:52'),
(1686, 0, 'fr', '_json', 'Features', 'Caractéristiques', '2021-05-27 09:06:02', '2021-05-31 14:58:52'),
(1687, 0, 'fr', '_json', 'Conditions', NULL, '2021-05-27 09:06:02', '2021-05-27 09:06:02'),
(1688, 0, 'fr', '_json', 'Capacity', 'Capacité', '2021-05-27 09:06:02', '2021-05-31 14:58:52'),
(1689, 0, 'fr', '_json', 'Edit Package', 'Modifier le pack', '2021-05-27 09:06:02', '2021-05-31 14:58:52'),
(1690, 0, 'fr', '_json', 'Package List', 'Liste des Pack', '2021-05-27 09:06:02', '2021-05-31 14:58:52'),
(1691, 0, 'fr', '_json', 'Min Stay', 'Séjour minimum', '2021-05-27 09:06:02', '2021-05-31 14:58:52'),
(1692, 0, 'fr', '_json', 'Available On', 'Disponible le', '2021-05-27 09:06:02', '2021-05-31 14:58:52'),
(1693, 0, 'fr', '_json', 'Prix', NULL, '2021-05-27 09:06:02', '2021-05-27 09:06:02'),
(1694, 0, 'fr', '_json', 'Trait', NULL, '2021-05-27 09:06:03', '2021-05-27 09:06:03'),
(1695, 0, 'fr', '_json', 'Bon de Commande', NULL, '2021-05-27 09:06:03', '2021-05-27 09:06:03'),
(1696, 0, 'fr', '_json', 'TRAIT', NULL, '2021-05-27 09:06:03', '2021-05-27 09:06:03'),
(1697, 0, 'fr', '_json', 'Type', NULL, '2021-05-27 09:06:03', '2021-05-27 09:06:03'),
(1698, 0, 'fr', '_json', 'Infant', 'bébé', '2021-05-27 09:06:03', '2021-05-31 14:58:52'),
(1699, 0, 'fr', '_json', 'Rentacs Tours - Travel Agency', 'Rentacs Tours - Agence de voyage', '2021-05-27 09:06:03', '2021-05-31 14:58:52'),
(1700, 0, 'fr', '_json', '(Excluding Tax)', '(hors taxes)', '2021-05-27 09:06:03', '2021-05-31 14:58:52'),
(1701, 0, 'fr', '_json', 'Package', 'Pack', '2021-05-27 09:06:04', '2021-05-31 14:58:52'),
(1702, 0, 'fr', '_json', 'Package Summary', 'Resumé du Pack', '2021-05-27 09:06:04', '2021-05-31 14:58:52'),
(1703, 0, 'fr', '_json', 'nights', 'nuits', '2021-05-27 09:06:04', '2021-05-31 14:58:52'),
(1704, 0, 'fr', '_json', 'Make a Booking', 'Faire une réservation', '2021-05-27 09:06:04', '2021-05-31 14:58:52'),
(1705, 0, 'fr', '_json', 'BOOK', 'Réserver', '2021-05-27 09:06:04', '2021-05-31 14:58:52'),
(1706, 0, 'fr', '_json', 'Need Assistance', 'Besoin d\'aide', '2021-05-27 09:06:04', '2021-05-31 14:58:52'),
(1707, 0, 'fr', '_json', 'Need Help? Call us or drop a message. Our agents will be in touch shortly.', 'Besoin d\'aide ? Appelez-nous ou envoyez-nous un message. Nos agents vous contacteront sous peu.', '2021-05-27 09:06:04', '2021-05-31 14:58:52'),
(1708, 0, 'fr', '_json', 'Email Us', 'Contactez Nous', '2021-05-27 09:06:04', '2021-05-31 14:58:52'),
(1709, 0, 'fr', '_json', 'Nuit', 'Nuit', '2021-05-27 09:06:04', '2021-05-31 14:58:52'),
(1710, 0, 'fr', '_json', 'Personne', NULL, '2021-05-27 09:06:04', '2021-05-27 09:06:04'),
(1711, 0, 'fr', '_json', 'Checkout', 'Validation de commande', '2021-05-27 09:06:04', '2021-05-31 14:58:52'),
(1712, 0, 'fr', '_json', 'Quantity', 'Quantité', '2021-05-27 09:06:04', '2021-05-31 14:58:52'),
(1713, 0, 'fr', '_json', 'Bill To Name', 'Nom', '2021-05-27 09:06:04', '2021-05-31 14:58:52'),
(1714, 0, 'fr', '_json', 'Bill To Company', 'Société', '2021-05-27 09:06:04', '2021-05-31 14:58:52'),
(1715, 0, 'fr', '_json', 'Bill To Address', 'Adresse de facturation', '2021-05-27 09:06:04', '2021-05-31 14:58:52'),
(1716, 0, 'fr', '_json', 'Bill To City', 'Ville', '2021-05-27 09:06:04', '2021-05-31 14:58:52'),
(1717, 0, 'fr', '_json', 'Bill To State', 'Etat', '2021-05-27 09:06:04', '2021-05-31 14:58:52'),
(1718, 0, 'fr', '_json', 'Menu', NULL, '2021-05-27 09:06:04', '2021-05-27 09:06:04'),
(1719, 0, 'fr', '_json', 'Special Offers List', 'Liste des offres spéciales', '2021-05-27 09:06:04', '2021-05-31 14:58:52'),
(1720, 0, 'fr', '_json', 'Special Offers Type', 'Type des offres spéciales', '2021-05-27 09:06:04', '2021-05-31 14:58:52'),
(1721, 0, 'fr', '_json', 'Pages Management', 'Gestion des Pages', '2021-05-27 09:06:04', '2021-05-31 14:58:52'),
(1722, 0, 'fr', '_json', 'Termes et Conditions', NULL, '2021-05-27 09:06:04', '2021-05-27 09:06:04'),
(1723, 0, 'fr', '_json', 'Transactions', NULL, '2021-05-27 09:06:04', '2021-05-27 09:06:04'),
(1724, 0, 'fr', 'pagination', 'next', 'Suivant »', '2021-05-27 09:37:31', '2021-05-27 09:37:52'),
(1725, 0, 'fr', 'pagination', 'previous', '« Précédent', '2021-05-27 09:37:48', '2021-05-27 09:37:52'),
(1726, 0, 'fr', 'passwords', 'password', 'Les mots de passe doivent comporter au moins six caractères et correspondre à la confirmation.', '2021-05-27 09:38:45', '2021-05-27 09:39:28'),
(1727, 0, 'fr', 'passwords', 'reset', 'Votre mot de passe a été réinitialisé !', '2021-05-27 09:38:56', '2021-05-27 09:39:28'),
(1728, 0, 'fr', 'passwords', 'sent', 'Nous vous avons envoyé par e-mail le lien de réinitialisation de votre mot de passe !', '2021-05-27 09:39:06', '2021-05-27 09:39:28'),
(1729, 0, 'fr', 'passwords', 'token', 'Ce jeton de réinitialisation de mot de passe est invalide.', '2021-05-27 09:39:15', '2021-05-27 09:39:28'),
(1730, 0, 'fr', 'passwords', 'user', 'We can\'t find a user with that e-mail address.', '2021-05-27 09:39:19', '2021-05-27 09:39:28'),
(1731, 0, 'en', '_json', 'Personne', 'Person', '2021-05-27 09:48:08', '2021-05-31 14:58:52'),
(1732, 0, 'en', '_json', 'Pays', 'Country', '2021-05-27 09:48:29', '2021-05-31 14:58:52'),
(1733, 0, 'fr', '_json', 'Oops!', 'Oups', '2021-05-27 10:06:15', '2021-05-31 14:58:52'),
(1734, 0, 'fr', '_json', 'Last Name', 'Nom', '2021-05-31 08:46:10', '2021-05-31 14:58:52'),
(1735, 0, 'fr', '_json', 'Complete Purchase', 'Achat complet', '2021-05-31 08:46:11', '2021-05-31 14:58:52'),
(1736, 0, 'fr', '_json', 'Special Offer', 'Offre Special', '2021-05-31 08:46:11', '2021-05-31 14:58:52'),
(1737, 0, 'fr', '_json', 'Services', NULL, '2021-05-31 08:46:11', '2021-05-31 08:46:11'),
(1738, 0, 'fr', '_json', 'Your Order Summary', 'Votre detail de commande', '2021-05-31 08:46:11', '2021-05-31 14:58:52'),
(1739, 0, 'fr', '_json', 'TOTAL', NULL, '2021-05-31 08:46:11', '2021-05-31 08:46:11'),
(1740, 0, 'fr', '_json', 'Payment', 'Paiement', '2021-05-31 08:46:11', '2021-05-31 14:58:52'),
(1741, 0, 'fr', '_json', 'Billing Details', 'Detail de facturation', '2021-05-31 08:46:11', '2021-05-31 14:58:52'),
(1742, 0, 'fr', '_json', 'Full Name', 'Nom complet', '2021-05-31 08:46:11', '2021-05-31 14:58:52'),
(1743, 0, 'fr', '_json', 'State', 'Etat', '2021-05-31 08:46:11', '2021-05-31 14:58:52'),
(1744, 0, 'fr', '_json', 'Zip', NULL, '2021-05-31 08:46:11', '2021-05-31 08:46:11'),
(1745, 0, 'fr', '_json', 'Start', 'Debut', '2021-05-31 08:46:11', '2021-05-31 14:58:52'),
(1746, 0, 'fr', '_json', 'Sale Conditions', 'Conditions general de vente', '2021-05-31 08:46:11', '2021-05-31 14:58:52');

-- --------------------------------------------------------

--
-- Structure de la table `markdowns`
--

CREATE TABLE `markdowns` (
  `id` int(10) UNSIGNED NOT NULL,
  `airline_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  `value` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `markdowns`
--

INSERT INTO `markdowns` (`id`, `airline_code`, `type`, `value`, `created_at`, `updated_at`) VALUES
(1, 'AF', 1, 7000, '2021-01-28 09:16:30', '2021-01-28 09:16:30'),
(2, 'BA', 1, 20000, '2021-01-28 09:16:30', '2021-01-28 09:16:30'),
(3, 'BI', 1, 30000, '2021-01-28 09:16:30', '2021-01-28 09:16:30'),
(4, 'EK', 1, 3000, '2021-01-28 09:16:30', '2021-01-28 09:16:30'),
(5, 'TK', 1, 40000, '2021-01-28 09:16:30', '2021-01-28 09:16:30'),
(6, 'LH', 1, 6000, '2021-01-28 09:16:30', '2021-01-28 09:16:30'),
(7, 'Air France', 1, 100, '2021-04-15 13:57:26', '2021-04-15 13:57:26'),
(8, 'Lufthansa', 1, 11, '2021-04-15 13:57:53', '2021-04-15 14:02:01');

-- --------------------------------------------------------

--
-- Structure de la table `markups`
--

CREATE TABLE `markups` (
  `id` int(10) UNSIGNED NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  `flight_markup_type` int(11) NOT NULL DEFAULT 1,
  `flight_markup_value` int(11) NOT NULL DEFAULT 0,
  `hotel_markup_type` int(11) NOT NULL DEFAULT 1,
  `hotel_markup_value` int(11) NOT NULL DEFAULT 0,
  `car_markup_type` int(11) NOT NULL DEFAULT 1,
  `car_markup_value` int(11) NOT NULL DEFAULT 0,
  `package_markup_type` int(11) NOT NULL DEFAULT 1,
  `package_markup_value` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `markups`
--

INSERT INTO `markups` (`id`, `role_id`, `flight_markup_type`, `flight_markup_value`, `hotel_markup_type`, `hotel_markup_value`, `car_markup_type`, `car_markup_value`, `package_markup_type`, `package_markup_value`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 10000, 1, 10000, 1, 10000, 1, 10000, '2021-01-28 09:16:30', '2021-01-28 09:16:30'),
(2, 3, 1, 10000, 1, 10000, 1, 10000, 1, 10000, '2021-01-28 09:16:30', '2021-01-28 09:16:30');

-- --------------------------------------------------------

--
-- Structure de la table `markup_types`
--

CREATE TABLE `markup_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `markup_types`
--

INSERT INTO `markup_types` (`id`, `type`, `created_at`, `updated_at`) VALUES
(1, 'Flight', '2021-01-28 09:16:31', '2021-01-28 09:16:31'),
(2, 'Hotel', '2021-01-28 09:16:31', '2021-01-28 09:16:31'),
(3, 'Car', '2021-01-28 09:16:31', '2021-01-28 09:16:31'),
(4, 'Package', '2021-01-28 09:16:31', '2021-01-28 09:16:31');

-- --------------------------------------------------------

--
-- Structure de la table `markup_value_types`
--

CREATE TABLE `markup_value_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `markup_value_types`
--

INSERT INTO `markup_value_types` (`id`, `type`, `created_at`, `updated_at`) VALUES
(1, 'Dirham Marocain', '2021-01-28 09:16:31', '2021-01-28 09:16:31'),
(2, 'Percentage', '2021-01-28 09:16:31', '2021-01-28 09:16:31');

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(51, '2020_02_26_041322_create_post_translations_table', 1),
(52, '2021_04_05_114424_create_admin_menu_items_table', 0),
(53, '2021_04_05_114424_create_admin_menus_table', 0),
(54, '2021_04_05_114424_create_agency_profiles_table', 0),
(55, '2021_04_05_114424_create_airlines_table', 0),
(56, '2021_04_05_114424_create_airports_table', 0),
(57, '2021_04_05_114424_create_amenities_table', 0),
(58, '2021_04_05_114424_create_amenities_translations_table', 0),
(59, '2021_04_05_114424_create_attractions_table', 0),
(60, '2021_04_05_114424_create_bank_details_table', 0),
(61, '2021_04_05_114424_create_bank_payments_table', 0),
(62, '2021_04_05_114424_create_banks_table', 0),
(63, '2021_04_05_114424_create_bookings_table', 0),
(64, '2021_04_05_114424_create_cabin_types_table', 0),
(65, '2021_04_05_114424_create_car_bookings_table', 0),
(66, '2021_04_05_114424_create_categories_table', 0),
(67, '2021_04_05_114424_create_category_translations_table', 0),
(68, '2021_04_05_114424_create_cities_table', 0),
(69, '2021_04_05_114424_create_city_translations_table', 0),
(70, '2021_04_05_114424_create_comments_table', 0),
(71, '2021_04_05_114424_create_cooperate_customer_profiles_table', 0),
(72, '2021_04_05_114424_create_countries_table', 0),
(73, '2021_04_05_114424_create_customers_table', 0),
(74, '2021_04_05_114424_create_email_subscribers_table', 0),
(75, '2021_04_05_114424_create_flight_bookings_table', 0),
(76, '2021_04_05_114424_create_flight_deals_table', 0),
(77, '2021_04_05_114424_create_galleries_table', 0),
(78, '2021_04_05_114424_create_genders_table', 0),
(79, '2021_04_05_114424_create_good_to_knows_table', 0),
(80, '2021_04_05_114424_create_hotel_bookings_table', 0),
(81, '2021_04_05_114424_create_hotel_deals_table', 0),
(82, '2021_04_05_114424_create_hotels_table', 0),
(83, '2021_04_05_114424_create_languages_table', 0),
(84, '2021_04_05_114424_create_ltm_translations_table', 0),
(85, '2021_04_05_114424_create_markdowns_table', 0),
(86, '2021_04_05_114424_create_markup_types_table', 0),
(87, '2021_04_05_114424_create_markup_value_types_table', 0),
(88, '2021_04_05_114424_create_markups_table', 0),
(89, '2021_04_05_114424_create_notifications_table', 0),
(90, '2021_04_05_114424_create_online_payments_table', 0),
(91, '2021_04_05_114424_create_package_attractions_table', 0),
(92, '2021_04_05_114424_create_package_bookings_table', 0),
(93, '2021_04_05_114424_create_package_categories_table', 0),
(94, '2021_04_05_114424_create_package_flights_table', 0),
(95, '2021_04_05_114424_create_package_hotels_table', 0),
(96, '2021_04_05_114424_create_package_types_table', 0),
(98, '2021_04_05_114424_create_page_translations_table', 0),
(99, '2021_04_05_114424_create_password_resets_table', 0),
(100, '2021_04_05_114424_create_pay_laters_table', 0),
(101, '2021_04_05_114424_create_permission_role_table', 0),
(102, '2021_04_05_114424_create_permissions_table', 0),
(103, '2021_04_05_114424_create_place_translations_table', 0),
(104, '2021_04_05_114424_create_place_type_translations_table', 0),
(105, '2021_04_05_114424_create_place_types_table', 0),
(106, '2021_04_05_114424_create_places_table', 0),
(107, '2021_04_05_114424_create_post_translations_table', 0),
(108, '2021_04_05_114424_create_posts_table', 0),
(109, '2021_04_05_114424_create_profiles_table', 0),
(110, '2021_04_05_114424_create_purchase_details_table', 0),
(111, '2021_04_05_114424_create_purchases_table', 0),
(112, '2021_04_05_114424_create_return_details_table', 0),
(113, '2021_04_05_114424_create_returns_table', 0),
(114, '2021_04_05_114424_create_reviews_table', 0),
(115, '2021_04_05_114424_create_role_user_table', 0),
(116, '2021_04_05_114424_create_roles_table', 0),
(117, '2021_04_05_114424_create_sale_details_table', 0),
(118, '2021_04_05_114424_create_sales_table', 0),
(119, '2021_04_05_114424_create_settings_table', 0),
(120, '2021_04_05_114424_create_sight_seeings_table', 0),
(121, '2021_04_05_114424_create_suppliers_table', 0),
(122, '2021_04_05_114424_create_testimonial_translations_table', 0),
(123, '2021_04_05_114424_create_testimonials_table', 0),
(124, '2021_04_05_114424_create_titles_table', 0),
(125, '2021_04_05_114424_create_travel_packages_table', 0),
(126, '2021_04_05_114424_create_users_table', 0),
(127, '2021_04_05_114424_create_vats_table', 0),
(128, '2021_04_05_114424_create_visa_applications_table', 0),
(129, '2021_04_05_114424_create_vouchers_table', 0),
(130, '2021_04_05_114424_create_wallet_log_types_table', 0),
(131, '2021_04_05_114424_create_wallet_logs_table', 0),
(132, '2021_04_05_114424_create_wallets_table', 0),
(133, '2021_04_05_114424_create_wishlists_table', 0),
(134, '2021_04_05_114428_add_foreign_keys_to_amenities_translations_table', 0),
(135, '2021_04_05_114428_add_foreign_keys_to_city_translations_table', 0),
(136, '2021_04_05_114428_add_foreign_keys_to_customers_table', 0),
(137, '2021_04_05_114428_add_foreign_keys_to_page_translations_table', 0),
(138, '2021_04_05_114428_add_foreign_keys_to_permission_role_table', 0),
(139, '2021_04_05_114428_add_foreign_keys_to_place_translations_table', 0),
(140, '2021_04_05_114428_add_foreign_keys_to_place_type_translations_table', 0),
(141, '2021_04_05_114428_add_foreign_keys_to_post_translations_table', 0),
(142, '2021_04_05_114428_add_foreign_keys_to_purchase_details_table', 0),
(143, '2021_04_05_114428_add_foreign_keys_to_purchases_table', 0),
(144, '2021_04_05_114428_add_foreign_keys_to_return_details_table', 0),
(145, '2021_04_05_114428_add_foreign_keys_to_returns_table', 0),
(146, '2021_04_05_114428_add_foreign_keys_to_role_user_table', 0),
(147, '2021_04_05_114428_add_foreign_keys_to_sale_details_table', 0),
(148, '2021_04_05_114428_add_foreign_keys_to_sales_table', 0),
(149, '2021_04_05_114428_add_foreign_keys_to_users_table', 0),
(150, '2021_04_13_094214_create_newsletters_table', 0),
(151, '2021_04_16_025627_create_faqs_table', 0),
(152, '2021_04_19_104131_create_sliders_table', 0),
(153, '2021_04_20_104131_create_offers_table', 0),
(154, '2021_04_20_114424_create_offer_translations_table', 0),
(155, '2021_04_05_114424_create_category_type_translations_table', 0),
(156, '2021_04_06_114424_create_category_types_table', 0),
(157, '2021_04_06_114424_create_category_translations_table', 0),
(158, '2021_05_06_130604_create_package_features_table', 2),
(159, '2021_05_06_130644_create_package_conditions_table', 2),
(160, '2021_05_06_134208_create_package_rates_table', 2),
(161, '2021_04_05_114424_create_packages_table', 3),
(162, '2021_05_06_293551_add-role-id-to-menu-items-table', 4),
(163, '2021_05_19_095150_create_rate_booking_table', 5);

-- --------------------------------------------------------

--
-- Structure de la table `newsletters`
--

CREATE TABLE `newsletters` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `newsletters`
--

INSERT INTO `newsletters` (`id`, `email`, `created_at`, `updated_at`) VALUES
(1, 'zakarialabib@gmail.com', '2021-04-13 12:04:03', '2021-04-13 12:04:03');

-- --------------------------------------------------------

--
-- Structure de la table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(191) NOT NULL,
  `booking_id` int(191) UNSIGNED DEFAULT NULL,
  `user_id` int(191) DEFAULT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `notifications`
--

INSERT INTO `notifications` (`id`, `booking_id`, `user_id`, `is_read`, `created_at`, `updated_at`) VALUES
(18, 17, NULL, 1, '2021-05-31 09:54:26', '2021-05-31 13:03:06'),
(19, 18, NULL, 1, '2021-05-31 10:41:38', '2021-05-31 13:03:06'),
(20, 19, NULL, 1, '2021-05-31 10:51:22', '2021-05-31 13:03:06'),
(21, 20, NULL, 1, '2021-05-31 11:11:41', '2021-05-31 13:03:06'),
(22, 21, NULL, 1, '2021-05-31 13:06:57', '2021-05-31 13:07:18'),
(23, 22, NULL, 0, '2021-05-31 14:16:23', '2021-05-31 14:16:23');

-- --------------------------------------------------------

--
-- Structure de la table `offers`
--

CREATE TABLE `offers` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `city_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thumb` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gallery` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `itinerary` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT 1,
  `seo_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT=' x';

--
-- Déchargement des données de la table `offers`
--

INSERT INTO `offers` (`id`, `user_id`, `category_id`, `city_id`, `name`, `slug`, `description`, `reference`, `price`, `address`, `thumb`, `gallery`, `itinerary`, `status`, `seo_title`, `seo_description`, `created_at`, `updated_at`) VALUES
(13, 1, 28, 31, NULL, 'blue-medina-gardens', NULL, '0000000001', 0, NULL, '60b65d2ea6407_1622564142.jpg', '[\"60b65d063ed27_1622564102.jpg\"]', '[{\"title\":null,\"description\":null}]', 1, NULL, NULL, '2021-06-01 15:15:42', '2021-06-01 15:15:42');

-- --------------------------------------------------------

--
-- Structure de la table `offer_translations`
--

CREATE TABLE `offer_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `offer_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `offer_translations`
--

INSERT INTO `offer_translations` (`id`, `offer_id`, `locale`, `name`, `description`) VALUES
(7, 8, 'en', 'Hotel du Golf Rotana / Golf Club Rotana', '<p>With an outstanding location overlooking one of the most sought-after golf courses in Marrakech, <strong>H&ocirc;tel du Golf Rotana</strong> is the place to relax and enjoy 5 star luxury and world-class facilities. Nestled at the heart of the stunning <strong>Palmeraie Rotana Resort </strong>is&nbsp;situated in the north of the Marrakech.&nbsp;This design-led property blends modern Moroccan architecture with art deco style and a warm inviting colour scheme to create a cosy and laid-back ambiance. Magnificent views of the fairways at the <strong>Golf Club Rotana</strong> and the stunning Atlas Mountains backdrop are part of this exceptional lifestyle experience.</p>\r\n\r\n<p><strong>All 315 hotel rooms</strong> and suites are modern, spacious and ideal for both leisure and business stays in Marrakech. Expansive floor-to-ceiling windows are a design highlight, flooding each room with glorious Moroccan sunshine and offering guests breath-taking views of the gardens, pool and/or the golf course.</p>\r\n\r\n<p>Guests can choose from the resort&rsquo;s <strong>12 unique dining experiences</strong>, from specialty restaurants serving authentic Moroccan, Italian, Mediterranean and Asian flavours, to casual pool bars and beach lounges, including Nikki Beach Club where inventive fusion cuisine and a party atmosphere await. For convenience, three of these venues - an international restaurant, poolside snack bar and a bar lounge - are located at the <strong>H&ocirc;tel du Golf Rotana</strong> Palmeraie.</p>\r\n\r\n<p>In addition to the 18-hole championship golf course, a wide range of resort facilities are on the hotel&rsquo;s doorstep, including the purpose-built Conference Centre, which caters to all corporate and social occasions in Marrakech. For some well-deserved me time, work out or relax in the fully equipped <strong>Bodylines Fitness &amp; Wellness Club</strong> with indoor swimming pool, Jacuzzi, sauna and steam rooms, or be pampered at <strong>Zen the spa at Rotana</strong>. For a bit of fun guests can also enjoy the resort&#39;s offers bowling, tennis, basketball and a vast entertainment programme designed for all ages and our kids&rsquo; club keeps young guests busy with activities galore.</p>'),
(8, 8, 'fr', 'Hotel du Golf Rotana / Golf Club Rotana', '<p>With an outstanding location overlooking one of the most sought-after golf courses in Marrakech, <strong>H&ocirc;tel du Golf Rotana</strong> is the place to relax and enjoy 5 star luxury and world-class facilities. Nestled at the heart of the stunning <strong>Palmeraie Rotana Resort </strong>is&nbsp;situated in the north of the Marrakech.&nbsp;This design-led property blends modern Moroccan architecture with art deco style and a warm inviting colour scheme to create a cosy and laid-back ambiance. Magnificent views of the fairways at the <strong>Golf Club Rotana</strong> and the stunning Atlas Mountains backdrop are part of this exceptional lifestyle experience.</p>\r\n\r\n<p><strong>All 315 hotel rooms</strong> and suites are modern, spacious and ideal for both leisure and business stays in Marrakech. Expansive floor-to-ceiling windows are a design highlight, flooding each room with glorious Moroccan sunshine and offering guests breath-taking views of the gardens, pool and/or the golf course.</p>\r\n\r\n<p>Guests can choose from the resort&rsquo;s <strong>12 unique dining experiences</strong>, from specialty restaurants serving authentic Moroccan, Italian, Mediterranean and Asian flavours, to casual pool bars and beach lounges, including Nikki Beach Club where inventive fusion cuisine and a party atmosphere await. For convenience, three of these venues - an international restaurant, poolside snack bar and a bar lounge - are located at the <strong>H&ocirc;tel du Golf Rotana</strong> Palmeraie.</p>\r\n\r\n<p>In addition to the 18-hole championship golf course, a wide range of resort facilities are on the hotel&rsquo;s doorstep, including the purpose-built Conference Centre, which caters to all corporate and social occasions in Marrakech. For some well-deserved me time, work out or relax in the fully equipped <strong>Bodylines Fitness &amp; Wellness Club</strong> with indoor swimming pool, Jacuzzi, sauna and steam rooms, or be pampered at <strong>Zen the spa at Rotana</strong>. For a bit of fun guests can also enjoy the resort&#39;s offers bowling, tennis, basketball and a vast entertainment programme designed for all ages and our kids&rsquo; club keeps young guests busy with activities galore.</p>'),
(9, 9, 'en', 'ddd', NULL),
(10, 9, 'fr', 'ddd', NULL),
(11, 10, 'en', 'ddddd', 'ddddd'),
(12, 10, 'fr', 'ddddd', '<p>ddddd</p>'),
(13, 11, 'en', 'ddddd', 'ddddd'),
(14, 11, 'fr', 'ddddd', '<p>ddddd</p>'),
(15, 12, 'en', 'BLUE MEDINA GARDENS', NULL),
(16, 12, 'fr', 'BLUE MEDINA GARDENS', NULL),
(17, 13, 'en', 'BLUE MEDINA GARDENS', NULL),
(18, 13, 'fr', 'BLUE MEDINA GARDENS', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `online_payments`
--

CREATE TABLE `online_payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `reference` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `booking_reference` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` bigint(20) NOT NULL,
  `gateway_id` int(11) NOT NULL,
  `response_code` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `response_description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_status` int(11) NOT NULL,
  `response_full` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `packages`
--

CREATE TABLE `packages` (
  `id` int(10) UNSIGNED NOT NULL,
  `offer_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `period` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `packages`
--

INSERT INTO `packages` (`id`, `offer_id`, `title`, `period`, `start_date`, `end_date`, `created_at`, `updated_at`) VALUES
(3, 13, 'BLUE MEDINA GARDENS PACK 1', 1, '2021-06-01', '2021-06-10', '2021-06-01 15:18:11', '2021-06-01 15:18:11'),
(5, 13, 'BLUE MEDINA GARDENS PACK 2', 1, '2021-06-01', '2021-06-10', '2021-06-01 15:28:17', '2021-06-01 15:28:17'),
(6, 13, 'BLUE MEDINA GARDENS PACK 3', 1, '2021-06-01', '2021-06-10', '2021-06-01 15:29:21', '2021-06-01 15:29:21');

-- --------------------------------------------------------

--
-- Structure de la table `package_attractions`
--

CREATE TABLE `package_attractions` (
  `id` int(10) UNSIGNED NOT NULL,
  `package_id` int(11) DEFAULT NULL,
  `attraction_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `package_attractions`
--

INSERT INTO `package_attractions` (`id`, `package_id`, `attraction_name`, `address`, `created_at`, `updated_at`) VALUES
(1, 1, 'rotana', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `package_bookings`
--

CREATE TABLE `package_bookings` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `package_id` int(11) NOT NULL,
  `reference` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `adults` int(11) NOT NULL,
  `children` int(11) NOT NULL,
  `infants` int(11) NOT NULL,
  `customer_title_id` int(11) NOT NULL,
  `customer_sur_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_other_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_amount` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_status` int(11) NOT NULL,
  `booking_status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `package_categories`
--

CREATE TABLE `package_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `category` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` smallint(6) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `package_categories`
--

INSERT INTO `package_categories` (`id`, `category`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Food & Culinary', 1, '2021-01-28 09:16:31', '2021-01-28 09:16:31'),
(2, 'Fashion & Shopping', 1, '2021-01-28 09:16:31', '2021-01-28 09:16:31'),
(3, 'Music & Festival', 1, '2021-01-28 09:16:31', '2021-01-28 09:16:31'),
(4, 'History & Culture', 1, '2021-01-28 09:16:31', '2021-01-28 09:16:31'),
(5, 'Sports & Nature', 1, '2021-01-28 09:16:31', '2021-01-28 09:16:31'),
(6, 'Entertain & Gamble', 1, '2021-01-28 09:16:31', '2021-01-28 09:16:31'),
(7, 'Health & Beauty', 1, '2021-01-28 09:16:31', '2021-01-28 09:16:31');

-- --------------------------------------------------------

--
-- Structure de la table `package_conditions`
--

CREATE TABLE `package_conditions` (
  `id` int(10) UNSIGNED NOT NULL,
  `package_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `package_conditions`
--

INSERT INTO `package_conditions` (`id`, `package_id`, `title`, `created_at`, `updated_at`) VALUES
(5, 3, 'Hôtel réservé uniquement aux adultes de 16ans et plus. Présentation obligatoire d’une pièce d’identité justifiant l’âge de 16ans et Plus.', '2021-06-01 15:18:11', '2021-06-01 15:18:11'),
(6, 5, 'c', '2021-06-01 15:28:17', '2021-06-01 15:28:17'),
(7, 6, 'c', '2021-06-01 15:29:21', '2021-06-01 15:29:21');

-- --------------------------------------------------------

--
-- Structure de la table `package_features`
--

CREATE TABLE `package_features` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `package_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `package_features`
--

INSERT INTO `package_features` (`id`, `package_id`, `title`, `created_at`, `updated_at`) VALUES
(5, 3, 'Hôtel réservé uniquement aux adultes de 16ans et plus. Présentation obligatoire d’une pièce d’identité justifiant l’âge de 16ans et Plus.', '2021-06-01 15:18:11', '2021-06-01 15:18:11'),
(6, 5, 'c', '2021-06-01 15:28:17', '2021-06-01 15:28:17'),
(7, 6, 'c', '2021-06-01 15:29:21', '2021-06-01 15:29:21');

-- --------------------------------------------------------

--
-- Structure de la table `package_flights`
--

CREATE TABLE `package_flights` (
  `id` int(10) UNSIGNED NOT NULL,
  `package_id` int(11) DEFAULT NULL,
  `from_location` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `to_location` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `airline` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `departure_date_time` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `arrival_date_time` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `package_hotels`
--

CREATE TABLE `package_hotels` (
  `id` int(10) UNSIGNED NOT NULL,
  `package_id` int(11) DEFAULT NULL,
  `hotel_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hotel_star_rating` int(11) DEFAULT NULL,
  `hotel_location` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hotel_info` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gallery_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `package_rates`
--

CREATE TABLE `package_rates` (
  `id` int(10) UNSIGNED NOT NULL,
  `package_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `capacity` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `package_rates`
--

INSERT INTO `package_rates` (`id`, `package_id`, `title`, `start_date`, `end_date`, `price`, `capacity`, `created_at`, `updated_at`) VALUES
(6, 3, 'Chambre double ou Single sans balcon', '2021-06-01', '2021-06-10', 1135.00, 1, '2021-06-01 15:18:11', '2021-06-01 15:18:11'),
(7, 5, 'Chambre double ou Single avec balcon', '2021-06-01', '2021-06-01', 1320.00, 1, '2021-06-01 15:28:17', '2021-06-01 15:28:17'),
(8, 6, 'Chambre double ou Single avec Jacuzzi Sans balcon', '2021-06-01', '2021-06-01', 1560.00, 1, '2021-06-01 15:29:21', '2021-06-01 15:29:21');

-- --------------------------------------------------------

--
-- Structure de la table `package_types`
--

CREATE TABLE `package_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` smallint(6) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `package_types`
--

INSERT INTO `package_types` (`id`, `type`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Flight', 1, '2021-01-28 09:16:31', '2021-01-28 09:16:31'),
(2, 'Hotel', 1, '2021-01-28 09:16:31', '2021-01-28 09:16:31');

-- --------------------------------------------------------

--
-- Structure de la table `page_translations`
--

CREATE TABLE `page_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `page_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `places`
--

CREATE TABLE `places` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `reference` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `place_type` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `price` double DEFAULT NULL,
  `amenities` varchar(255) DEFAULT '',
  `thumb` varchar(255) DEFAULT NULL,
  `gallery` longtext DEFAULT NULL,
  `itinerary` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `booking_type` int(2) DEFAULT NULL,
  `link_bookingcom` varchar(255) DEFAULT NULL,
  `status` int(2) DEFAULT 1,
  `seo_title` varchar(255) DEFAULT NULL,
  `seo_description` varchar(255) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `places`
--

INSERT INTO `places` (`id`, `user_id`, `country_id`, `city_id`, `reference`, `category`, `place_type`, `name`, `slug`, `description`, `price`, `amenities`, `thumb`, `gallery`, `itinerary`, `booking_type`, `link_bookingcom`, `status`, `seo_title`, `seo_description`, `updated_at`, `created_at`) VALUES
(33, NULL, 13, 35, NULL, '[\"22\"]', '[\"34\"]', NULL, 'mazagan-beach-golf-resort', NULL, 1280, '[\"9\",\"8\",\"7\",\"6\"]', '6024f892640ba_1613035666.jpg', '[\"6024f7be7fade_1613035454.jpg\",\"6024f7c0743c1_1613035456.jpg\",\"6024f85689f32_1613035606.jpg\"]', '[{\"question\":\"Day 1\",\"answer\":\"<p>Description<\\/p>\"}]', 1, NULL, 0, 'Hôtel Mazagan Beach & Golf Resort', 'Vivez l’une des plus belles expériences de votre vie à l\'hôtel Mazagan Beach Golf avec Rentacs Tours. Réservez votre prochain séjour dès maintenant.', '2021-03-04 14:38:51', '2021-02-03 09:34:48'),
(34, NULL, 13, 31, NULL, '[\"22\"]', '[\"36\"]', NULL, 'widiane-suites-spa', NULL, 3055, '[\"9\",\"8\"]', '6023e04dd55b5_1612963917.jpg', '[\"6024f58288980_1613034882.jpg\",\"6024f58504521_1613034885.jpg\",\"6024f588a56d1_1613034888.jpg\"]', '[{\"question\":\"Jour 1\",\"answer\":\"<div class=\\\"daily-schedule-body\\\"><div class=\\\"col-md-8 col-sm-8\\\"><p>Vivez un s&eacute;jour exceptionnel &agrave; Widiane Suites &amp; Spa.. Un endroit tout juste magnifique o&ugrave; vous pouvez faire une balade en bateau, une sortie en montagne, ou tout simplement profiter des paysages &agrave; couper le souffle &hellip;<\\/p><p>Il y a tout pour vous faire plaisir et faire plaisir aux enfants. Un cadre magique mais aussi un personnel &agrave; l\'&eacute;coute, des voituriers toujours pr&ecirc;ts &agrave; assurer les liaisons avec le sourire et un service de nettoyage qui prend toutes les mesures d&rsquo;hygi&egrave;ne et toutes les pr&eacute;cautions anti covid.La restauration est sans d&eacute;faut, vous aurez le choix entre 3 entr&eacute;es, plats et desserts&hellip;.<\\/p><p>Une vraie exp&eacute;rience de d&eacute;paysement dans un cadre incroyable aux normes internationales avec vue totale sur le lac Bin El Ouidane&hellip;<\\/p><\\/div><\\/div>\"},{\"question\":\"Jour 2\",\"answer\":\"<div class=\\\"daily-schedule-body\\\"><div class=\\\"col-md-8 col-sm-8\\\"><p>Passez 3 jours en famille de pure d&eacute;tente, dans une chambre spacieuse et moderne avec une vue splendide sur la piscine et le Lac Bin El Ouidane&hellip;Un site vraiment exceptionnel pour vivre 3 jours inoubliables...<\\/p><p>L&rsquo;H&ocirc;tel est &eacute;quip&eacute; de 2 piscines propres constamment entretenues, avec une tr&egrave;s belle vue sur le Lac&hellip; Les repas sont vari&eacute;s et raffin&eacute;s&hellip;<\\/p><p>Le personnel est &agrave; l\'&eacute;coute et les mesures anti-covid sont compl&egrave;tement respect&eacute;es&hellip; Un endroit paradisiaque ou vous pouvez vous d&eacute;connecter du monde ext&eacute;rieur&hellip; Vous n&rsquo;aurez qu&rsquo;une seule envie.. Y retourner!<\\/p><\\/div><\\/div>\"}]', 1, NULL, 0, 'Hôtel Widiane Suites & Spa gfs', 'Dans les contreforts tranquilles du Moyen Atlas, se niche l\'hôtel Widiane Suites & Spa, un concentré d\'essences et de bien-être pour vous accueillir et enri....', '2021-05-18 11:44:22', '2021-02-10 13:31:57'),
(35, NULL, 13, 34, NULL, '[\"22\",\"21\"]', '[\"34\"]', NULL, 'sol-house-taghazout-bay-surf', NULL, 999, '[\"9\",\"8\",\"7\",\"6\"]', '6023e118a7872_1612964120.jpg', '[\"60240945cdd71_1612974405.jpg\",\"6024094ca18dc_1612974412.jpg\"]', NULL, 1, NULL, 1, 'Voyage à Sol House Taghazout Bay', 'Rentacs Tours vous emmène à Sol House Taghazout Bay Surf, un univers assez spéciale situé au bord de la mer à Taghazout, à 18 km d\'Agadir.', '2021-03-04 14:37:06', '2021-02-10 13:35:20'),
(36, NULL, 13, 23, NULL, '[\"13\",\"22\",\"12\",\"21\",\"20\",\"11\"]', '[\"32\"]', NULL, 'dakhla-attitude', NULL, 920, '[\"9\",\"8\",\"7\",\"6\"]', '602e8ff06c81c_1613664240.jpg', '[\"602e90250f964_1613664293.jpg\"]', '{\"6\":{\"question\":\"S\\u00e9jour en Pension Compl\\u00e9te & Transferts A\\u00e9roport\\/H\\u00f4tel\\/A\\u00e9roport\",\"answer\":\"<p>Bungalow double : 1295 DHS\\/ Nuit<br \\/>Bungalow Single: 920 DHS \\/Nuit<\\/p>\"}}', 1, NULL, 1, 'Voyage à DAKHLA', 'Rentacs Tours vous emmène vers la ville de Dakhla pour découvrir ce merveilleux paradis. Loin de tout bruit, découvrez maintenant notre offre de voyage et d\'activités à Dakhla.', '2021-03-04 14:34:45', '2021-02-18 16:04:00'),
(37, NULL, 13, 31, NULL, '[\"22\",\"11\"]', '[\"30\"]', NULL, 'douceur-de-vivre-hivernal-by-kenzi', NULL, 870, '[\"9\",\"8\",\"7\",\"6\"]', '602e92d33e60e_1613664979.jpg', '[\"602e93c79fed7_1613665223.jpg\",\"602e93caad1e8_1613665226.jpg\"]', '{\"6\":{\"question\":\"D\\u00e9part Tardif\",\"answer\":\"<p>Navette au centre-ville 717, horaire selon programme affich&eacute;.<\\/p>\"}}', 1, NULL, 1, 'Hôtel Kenzi - Marrakech', 'Rentacs Tours vous emmène à l\'hôtel KENZI. Réservez maintenant votre séjour dans ce lieu privilégié de classe mondiale.', '2021-03-04 14:21:01', '2021-02-18 16:16:19'),
(38, NULL, 13, 31, NULL, '[\"22\"]', '[\"32\"]', NULL, 'aqua-mirage-marrakech', NULL, 1025, '[\"8\",\"7\",\"6\"]', '6046551d0c0ae_1615222045.jpg', '[\"6046332cd4ea1_1615213356.jpg\"]', '{\"6\":{\"question\":\"Destination 1\",\"answer\":\"<p>destination 1<\\/p>\"},\"1\":{\"question\":\"destination 2\",\"answer\":\"destination 2\"},\"2\":{\"question\":null,\"answer\":null}}', 1, NULL, 1, 'Aqua Mirage Club Marrakech - Hôtel à Marrakech', 'Vous êtes à la recherche d\'un hôtel à Marrakech pour passer une expérience singulière ? Rentacs Tours vous propose Aqua Mirage Club.', '2021-05-18 12:14:23', '2021-03-08 16:39:56'),
(40, NULL, 13, 23, NULL, '[\"22\"]', NULL, NULL, 'hotel-pk25-dakhla', NULL, 999, '[\"22\",\"9\",\"8\",\"7\",\"6\"]', '60b641ebe62e3_1622557163.png', '[\"60b6421da58b6_1622557213.png\"]', '[{\"question\":\"Day 1\",\"answer\":\"desc\"},{\"question\":\"Day 2\",\"answer\":\"desc\"}]', 1, NULL, 1, NULL, NULL, '2021-06-01 14:21:28', '2021-06-01 14:19:24');

-- --------------------------------------------------------

--
-- Structure de la table `place_translations`
--

CREATE TABLE `place_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `place_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `place_translations`
--

INSERT INTO `place_translations` (`id`, `place_id`, `locale`, `name`, `description`) VALUES
(24, 33, 'en', 'Mazagan Beach & Golf Resort', '<div class=\"ie001e\">Hotel details</div>\r\n<p><span class=\"ggV7z kno-desc-sh\" data-ved=\"2ahUKEwjmz-mVwOHuAhUtUBUIHX2wDXAQ200wDHoECAoQAw\">In a modern Moorish-style complex, this upscale beach and golf resort on the Atlantic Ocean lies 104 km from Casablanca Mohammed V International Airport <span class=\"yZlgBd kd-hc\" data-ved=\"2ahUKEwjmz-mVwOHuAhUtUBUIHX2wDXAQ3E0wDHoECAoQBQ\"><span class=\"lnMzfb\"><br /><br />Posh rooms have French balconies, sitting areas and minibars, plus flat-screens and free Wi-Fi; some offer ocean views. Elegant suites add living rooms. Room service is available 24/7.</span><span class=\"lnMzfb\"><br /><br />Airport transfers are complimentary. There are 13 restaurants, in addition to a bar, a nightclub and a casino. Other amenities include an 18-hole golf course and a spa, plus tennis, an outdoor pool with a kids\' section, and a kids\' club. Breakfast is offered.</span></span></span></p>'),
(25, 33, 'fr', 'Mazagan Beach & Golf Resort', '<p><span style=\"font-weight: 400;\">TARIF POUR 2 ADULTES &amp; 2 ENFANTS<br />INCLUANT LE PETIT D&Eacute;JEUNER<br /><br />* ENFANT DE MOINS DE 2 ANS<br />*TAXES DE S&Eacute;JOUR NON COMPRISES</span></p>\r\n<p><span style=\"font-weight: 400;\">Vivez l&rsquo;une des plus belles exp&eacute;riences de votre vie &agrave; l\'h&ocirc;tel Mazagan Beach Golf and Resort.&nbsp;</span></p>\r\n<p><span style=\"font-weight: 400;\">Un service irr&eacute;prochable, une gestion sans faille dans les diff&eacute;rents coins de l\'h&ocirc;tel&hellip; Un personnel tr&egrave;s professionnel, tr&egrave;s sympathique et tr&egrave;s vigilant quant eau respect des r&egrave;gles d\'hygi&egrave;ne, des gestes barri&egrave;re et des pr&eacute;cautions sanitaires contre le CO-VID ..</span></p>\r\n<p><span style=\"font-weight: 400;\">Venez passer un super s&eacute;jour en solo, en couple ou avec vos enfants qui profiteront de la multitude des activit&eacute;s propos&eacute;es: v&eacute;lo, p&egrave;che, tir &agrave; l&rsquo;arc, ruch club, kids club&hellip;&nbsp;</span></p>\r\n<p><span style=\"font-weight: 400;\">Votre s&eacute;jour sera un r&eacute;el plaisir...</span></p>'),
(26, 34, 'en', 'Widiane Suites & Spa', '<p>In the tranquil foothills of the Middle Atlas, there is a hotel Widiane Suites &amp; Spa, a concentration of essences and well-being to welcome you and enrich your senses.</p>\r\n\r\n<p>Combining luxury and refinement, this haven of peace located in Bin El Ouidane, is the dream retreat of nature lovers where time stops to let live the magic of the site in a heavenly and enchanting setting...</p>\r\n\r\n<p>The region of Azilal encompasses a fine variety of mountains and plains. It is connected by highway main road to different cities: Beni Mellal, Marrakesh, Casablanca and Fes.<br />\r\nThe area has a rich cultural and architectural heritage: Zaouias, Kasbahs, fortified villages...It is known for its moussems and weekly souks.</p>'),
(27, 34, 'fr', 'Widiane Suites & Spa', '<p>2 ADULTES &amp; 2 ENFANTS<br />\r\nH&eacute;bergement pour s&eacute;jour de 2 nuits<br />\r\n(Possibilit&eacute; de surclassement &agrave; l&#39;arriv&eacute;e selon disponibilt&eacute;)<br />\r\nH&eacute;bergement gratuit pour Maximum 2 enfants de - 12 ansparatgeant la chambre des parents.<br />\r\nSortie en kayak offerte - 1h</p>\r\n\r\n<p>* Tarifs pour 02 nuits avec petit d&eacute;j<br />\r\n** Hors Taxe de s&eacute;jour 36 MAD par Adulte / nuit</p>\r\n\r\n<p>Dans les contreforts tranquilles du Moyen Atlas, se niche l&#39;h&ocirc;tel Widiane Suites &amp; Spa, un concentr&eacute; d&#39;essences et de bien-&ecirc;tre pour vous accueillir et enrichir vos sens.</p>\r\n\r\n<p>Associant luxe et raffinement, cet havre de paix situ&eacute; &agrave; Bin El Ouidane, est la retraite r&ecirc;v&eacute;e des amoureux de la nature o&ugrave; le temps s&#39;arr&ecirc;te pour laisser vivre la magie du site dans un cadre c&eacute;leste et enchanteur...</p>\r\n\r\n<p>La r&eacute;gion d&#39;Azilal alterne montagnes et plaines. Des axes routiers la relient aux principales villes du pays : Beni Mellal, Marrakech, Casablanca et F&egrave;s.<br />\r\nLa r&eacute;gion dispose en outre d&#39;un riche patrimoine culturel et architectural : Zaouias, Kasbahs, villages fortifi&eacute;es. Elle est connue &agrave; travers ses moussems et ses souks hebdomadaires.</p>'),
(28, 35, 'en', 'Sol House Taghazout Bay Surf', '<p>Offering an outdoor pool and spa centre with massage cabins, hammam and sauna, Sol House Taghazout Bay Surf is set in Taghazout by the beachfront, 18 km from Agadir. The hotel is overlooking the sea. Guests can enjoy a drink at the bar. Free private parking is available on site.</p>\r\n<p>All units are air conditioned and features a 42-inch flat-screen TV with satellite channels and a minibar. The bungalows have a safety deposit box and private balcony with sun beds. Some units include a seating area where you can relax. Private bathrooms are fitted with shower and hairdryer. Sol House Taghazout Bay Surf features free WiFi in all areas.</p>'),
(29, 35, 'fr', 'Sol House Taghazout Bay Surf', '<p>Situ&eacute; en bord de mer &agrave; Taghazout, &agrave; 18 km d\'Agadir, le Sol House Taghazout Bay Surf propose une piscine ext&eacute;rieure, ainsi qu\'un centre de spa avec des cabines de massage, un hammam et un sauna. Vous profiterez d\'une vue sur la mer, d\'un bar et d\'un parking priv&eacute; gratuit sur place.</p>\r\n<p>Les logements disposent de la climatisation, d\'une t&eacute;l&eacute;vision par satellite &agrave; &eacute;cran plat de 107 cm et d\'un minibar. Les bungalows sont dot&eacute;s d\'un coffre-fort et d\'un balcon priv&eacute; avec des chaises longues. Certains logements pr&eacute;sentent un coin salon, id&eacute;al pour vous d&eacute;tendre. Les salles de bains privatives sont pourvues d\'une douche et d\'un s&egrave;che-cheveux. Vous b&eacute;n&eacute;ficierez d\'une connexion Wi-Fi gratuite dans l\'ensemble des locaux.</p>\r\n<p>L\'&eacute;tablissement comporte une r&eacute;ception ouverte 24h/24, des boutiques, un club pour enfants ouvert pendant les vacances et une salle de sport enti&egrave;rement &eacute;quip&eacute;e accessible gratuitement.</p>\r\n<p>L\'h&ocirc;tel poss&egrave;de &eacute;galement des installations de sports nautiques, notamment un kayak et un stand up paddle. Il assure un service de location de voitures. Vous pourrez pratiquer de nombreuses activit&eacute;s dans les environs, telles que le surf, le yoga et la planche &agrave; voile. L\'a&eacute;roport d\'Agadir-Al Massira, le plus proche, est implant&eacute; &agrave; 45 km du Sol House Taghazout Bay Surf.</p>'),
(30, 36, 'en', 'DAKHLA ATTITUDE', '<p>S&eacute;jour en Pension Compl&eacute;te &amp; Transferts A&eacute;roport/H&ocirc;tel/A&eacute;roport<br />Bungalow double : 1295 DHS/ Nuit<br />Bungalow Single: 920 DHS /Nuit<br />&bull; Des Excursions pour Explorer la magnifique Baie de Dakhla sont disponibles &agrave; la demande.<br />&bull; Possibilit&eacute; de louer des Bungalow Triples &amp; Quadruples</p>'),
(31, 36, 'fr', 'DAKHLA ATTITUDE', '<p>S&eacute;jour en Pension Compl&eacute;te &amp; Transferts A&eacute;roport/H&ocirc;tel/A&eacute;roport<br />Bungalow double : 1295 DHS/ Nuit<br />Bungalow Single: 920 DHS /Nuit<br />&bull; Des Excursions pour explorer la magnifique Baie de Dakhla sont disponibles &agrave; la demande.<br />&bull; Possibilit&eacute; de louer des Bungalow Triples &amp; Quadruples</p>'),
(32, 37, 'en', 'Douceur de vivre Hivernal BY KENZI', '<p>Profitez d\'un s&eacute;jour en All Inclusive &agrave; Marrakech:<br />Gratuit&eacute; pour 1 enfant de moins de 5ans<br />Acc&egrave;s &agrave; la piscine chauff&eacute;e<br />Acc&egrave;s &agrave; la salle de sport sous r&eacute;servation &agrave; l\'avance<br /><br />Navette au centre-ville 717, horaire selon programme affich&eacute;.<br />A Partir de 870 DHS par personne en chambre double de luxe<br />en formule ALL INCLUSIVE<br />* Offre Valable jusqu\'au 20 Mars 2021 Hors taxes de s&eacute;jour</p>'),
(33, 37, 'fr', 'Douceur de vivre Hivernal BY KENZI', '<p>Profitez d\'un s&eacute;jour en All Inclusive &agrave; Marrakech:<br />Gratuit&eacute; pour 1 enfant de moins de 5ans<br />Acc&egrave;s &agrave; la piscine chauff&eacute;e<br />Acc&egrave;s &agrave; la salle de sport sous r&eacute;servation &agrave; l\'avance<br /><br />Navette au centre-ville 717, horaire selon programme affich&eacute;.<br />A Partir de 870 DHS par personne en chambre double de luxe<br />en formule ALL INCLUSIVE<br />* Offre Valable jusqu\'au 20 Mars 2021 Hors taxes de s&eacute;jour</p>'),
(35, 38, 'fr', 'Aqua Mirage Marrakech', '<p>Bienvenue &agrave; Aqua Mirage Club, &eacute;lu Meilleure H&ocirc;tel pour familles &agrave; Marrakech pour 4 ann&eacute;es cons&eacute;cutives. Ce lieu s&#39;&eacute;tend sur 20 hectares de nature au pied des fabuleuses montagnes de l&#39;Atlas. Il pr&eacute;sente aussi un point de d&eacute;part id&eacute;al pour explorer les environs de la ville de Marrakech. Avec son personnel professionnel, sa cuisine Marocaine et son &eacute;quipe d&#39;animation, Aqua Mirage est le choix id&eacute;al pour tous les amoureux du plaisir, du calme et de la haute qualit&eacute; du service. Il dispose de plusieurs piscines, un aqua parc, un sauna, un centre de massage et un centre de fitness. Profitez d&#39;un wifi gratuit, une navette centre ville, un club pour enfants, un centre de conf&eacute;rence et beaucoup plus...</p>'),
(38, 40, 'en', 'Hotel PK25 DAKHLA', 'desc'),
(39, 40, 'fr', 'Hotel PK25 DAKHLA', '<p>desc</p>');

-- --------------------------------------------------------

--
-- Structure de la table `place_types`
--

CREATE TABLE `place_types` (
  `id` int(11) UNSIGNED NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `place_type_translations`
--

CREATE TABLE `place_type_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `place_type_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `category` varchar(500) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `thumb` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT 1,
  `type` varchar(10) NOT NULL,
  `seo_title` varchar(255) DEFAULT NULL,
  `seo_description` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `category`, `title`, `slug`, `content`, `thumb`, `status`, `type`, `seo_title`, `seo_description`, `created_at`, `updated_at`) VALUES
(21, 1, NULL, NULL, 'a-propos', NULL, '6025606266e78_1613062242.JPG', 1, 'page', NULL, NULL, '2021-02-10 14:40:49', '2021-02-11 16:51:50'),
(22, 1, '[\"23\"]', NULL, 'les-7-etapes-incontournables-pour-preparer-votre-voyage', NULL, '60250f422116b_1613041474.jpg', 1, 'blog', 'Les 7 étapes incontournables pour préparer votre voyage', 'Préparer son voyage s\'avère une tâche difficile parfois. Découvrez alors les 7 étapes pour préparer efficacement tous vos futurs voyages.', '2021-02-11 10:55:35', '2021-03-04 14:04:56'),
(23, 1, '[\"23\"]', NULL, 'les-meilleurs-destinations-que-vous-devez-visiter-au-maroc', NULL, '602d18ba40bf3_1613568186.jpg', 1, 'blog', 'Les meilleurs destinations que vous devez absolument visiter au Maroc', 'Vous avez envie de savoir les meilleures destinations à visiter au Maroc ? Rentacs Tours vous a choisi une liste des villes les plus merveilleuses à ne pas manquer.', '2021-02-11 10:56:33', '2021-03-04 14:42:13'),
(28, 1, '[\"23\"]', NULL, 'voyage-en-solo-30-astuces-et-conseils-pour-voyager-seul', NULL, '603638b5008f3_1614166197.jpg', 1, 'blog', 'Voyage en Solo: 30 astuces et conseils pour voyager seul', 'Vous aimez voyageur seul et vous voulez avoir des conseils pour profiter au maximum de votre voyage  ? Rentacs Tours vous présente 30 astuces et conseils ...', '2021-02-24 10:54:29', '2021-03-04 14:41:39'),
(30, 1, '[\"23\"]', NULL, 'voyage-a-agadir-les-choses-a-ne-pas-rater-en-2021', NULL, '60363b7e75ed5_1614166910.jpg', 1, 'blog', 'Voyage à Agadir, les choses à ne pas rater en 2021', 'Vous souhaitez visiter la ville d\'Agadir ? Rentacs Tours vous invite à découvrir les principales attractions de cette ville.', '2021-02-24 11:39:18', '2021-04-13 15:32:48');

-- --------------------------------------------------------

--
-- Structure de la table `post_translations`
--

CREATE TABLE `post_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `post_translations`
--

INSERT INTO `post_translations` (`id`, `post_id`, `locale`, `title`, `content`) VALUES
(6, 21, 'en', 'About us', '<p><span style=\"font-weight: 400;\">Gustave Nadaud a dit \"Rester, c&rsquo;est exister. Voyager, c&rsquo;est vivre\".</span></p>\r\n<p>&nbsp;</p>\r\n<p><span style=\"font-weight: 400;\">C&rsquo;est pourquoi l&rsquo;&eacute;quipe Rentacs Tours est d&rsquo;autant plus fi&egrave;re de vivre avec vous, cette nouvelle ann&eacute;e 2021 avec des nouveaut&eacute;s dans sa structure.</span></p>\r\n<p><span style=\"font-weight: 400;\">&nbsp;</span></p>\r\n<p><span style=\"font-weight: 400;\">Durant toutes ces ann&eacute;es d&rsquo;exp&eacute;riences et de savoir-faire, nous avons pu parcourir ensemble de merveilleux endroits, nous avons s&eacute;journ&eacute; dans des lieux paradisiaques et nous avons pu voir avec les yeux d&rsquo;un passionn&eacute; la beaut&eacute; des plus belles destinations du monde.&nbsp;</span></p>\r\n<p><span style=\"font-weight: 400;\">&nbsp;</span></p>\r\n<p><span style=\"font-weight: 400;\">Ainsi, nous voulons faire d&eacute;couvrir &agrave; plus de personnes la beaut&eacute; exceptionnelle du monde auquel nous appartenons et qui donne envie de vivre avec passion et de survivre aux probl&egrave;mes et aux difficult&eacute;s que le monde d&rsquo;aujourd&rsquo;hui conna&icirc;t.</span></p>\r\n<p><span style=\"font-weight: 400;\">&nbsp;</span></p>\r\n<p><span style=\"font-weight: 400;\">C&rsquo;est dans cette optique que Rentacs Tours s&rsquo;&eacute;largit et devient une agence de voyage multi-services accessible, disponible et accueillante, qui s&rsquo;efforce de vous offrir le meilleur confort et l&rsquo;exp&eacute;rience de voyage la plus singuli&egrave;re&nbsp; qui, nous l&rsquo;esp&eacute;rons, r&eacute;pondra &agrave; toutes vos attentes.&nbsp;</span></p>\r\n<p><span style=\"font-weight: 400;\">&nbsp;</span></p>\r\n<p><span style=\"font-weight: 400;\">Fond&eacute;e par deux bikers passionn&eacute;s certifi&eacute;s par HOG Harley-Davidson: Nizar CHAWAD, ancien pr&eacute;sident du HOG Chapter Casablanca, et Mohamed Ali ANOUAR, ancien secr&eacute;taire g&eacute;n&eacute;ral du HOG Chapter Casablanca.&nbsp; La force de Rentacs Tours repose sur la diversit&eacute; des services qu&rsquo;elle propose mais aussi et surtout sur le professionnalisme sans d&eacute;faut de son &eacute;quipe qui b&eacute;n&eacute;ficie des comp&eacute;tences manag&eacute;riales sans faille de monsieur Ali Amrani ayant &agrave; son actif plus de 18 ann&eacute;es d&rsquo;exp&eacute;riences en zones touristiques des USA.</span></p>\r\n<p><span style=\"font-weight: 400;\">&nbsp;</span></p>\r\n<p><span style=\"font-weight: 400;\">Rentacstours aujourd&rsquo;hui, est une extension de savoir-faire, une multitude de services sur mesure allant des voyages organis&eacute;s h&ocirc;tels, h&eacute;bergement, vol aux activit&eacute;s de divertissement et de bien-&ecirc;tre motocycle, golf tour, bivouacs, trekking, surf, yoga .. Nous proposons aussi des services &agrave; l&rsquo;international gr&acirc;ce &agrave; la participation de diff&eacute;rents partenaires qui ont accept&eacute; de prendre part &agrave; cette aventure.</span></p>\r\n<p><span style=\"font-weight: 400;\">&nbsp;</span></p>\r\n<p><span style=\"font-weight: 400;\">Et pour tous les friands et amateurs de circuits &agrave; moto, vous pouvez profiter des offres exclusives et des meilleurs mod&egrave;les de motos Harley Davidson et Yamaha gr&acirc;ce &agrave; notre partenaire Rentacs Motor, repr&eacute;sentant exclusif de Eaglerider au Maroc. Le tout pour vous faire vivre des voyages exceptionnels et des aventures atypiques.&nbsp;</span></p>\r\n<p>&nbsp;</p>\r\n<p><span style=\"font-weight: 400;\">D&eacute;couvrez nos meilleures offres ou contactez-nous maintenant pour organiser votre prochain voyage.</span></p>\r\n<p>&nbsp;</p>'),
(7, 21, 'fr', 'À propos', '<p><span style=\"font-weight: 400;\"><img src=\"/uploads/photos/1/IMG-4763.JPG\" alt=\"\" width=\"100%\" height=\"100%\" /></span></p>\r\n<p><span style=\"font-weight: 400;\">Gustave Nadaud a dit \"Rester, c&rsquo;est exister. Voyager, c&rsquo;est vivre\".</span></p>\r\n<p>&nbsp;</p>\r\n<p><span style=\"font-weight: 400;\">C&rsquo;est pourquoi l&rsquo;&eacute;quipe Rentacs Tours est d&rsquo;autant plus fi&egrave;re de vivre avec vous, cette nouvelle ann&eacute;e 2021 avec des nouveaut&eacute;s dans sa structure.</span></p>\r\n<p><span style=\"font-weight: 400;\">&nbsp;</span></p>\r\n<p><span style=\"font-weight: 400;\">Durant toutes ces ann&eacute;es d&rsquo;exp&eacute;riences et de savoir-faire, nous avons pu parcourir ensemble de merveilleux endroits, nous avons s&eacute;journ&eacute; dans des lieux paradisiaques et nous avons pu voir avec les yeux d&rsquo;un passionn&eacute; la beaut&eacute; des plus belles destinations du monde.&nbsp;</span></p>\r\n<p><span style=\"font-weight: 400;\">&nbsp;</span></p>\r\n<p><span style=\"font-weight: 400;\">Ainsi, nous voulons faire d&eacute;couvrir &agrave; plus de personnes la beaut&eacute; exceptionnelle du monde auquel nous appartenons et qui donne envie de vivre avec passion et de survivre aux probl&egrave;mes et aux difficult&eacute;s que le monde d&rsquo;aujourd&rsquo;hui connaisse.</span></p>\r\n<p><span style=\"font-weight: 400;\">&nbsp;</span></p>\r\n<p><span style=\"font-weight: 400;\">C&rsquo;est dans cette optique que Rentacs Tours s&rsquo;&eacute;largit et devient une agence de voyage multi-services accessible, disponible et accueillante, qui s&rsquo;efforce de vous offrir le meilleur confort et l&rsquo;exp&eacute;rience de voyage la plus singuli&egrave;re&nbsp; qui, nous l&rsquo;esp&eacute;rons, r&eacute;pondra &agrave; toutes vos attentes.&nbsp;</span></p>\r\n<p><span style=\"font-weight: 400;\">&nbsp;</span></p>\r\n<p><span style=\"font-weight: 400;\">Fond&eacute;e par deux bikers passionn&eacute;s certifi&eacute;s par HOG Harley-Davidson: Nizar CHAWAD, ancien pr&eacute;sident du HOG Chapter Casablanca, et Mohamed Ali ANOUAR, ancien secr&eacute;taire g&eacute;n&eacute;ral du HOG Chapter Casablanca.&nbsp; La force de Rentacs Tours repose sur la diversit&eacute; des services qu&rsquo;elle propose mais aussi et surtout sur le professionnalisme sans d&eacute;faut de son &eacute;quipe qui b&eacute;n&eacute;ficie des comp&eacute;tences manag&eacute;riales sans faille de monsieur Ali Amrani ayant &agrave; son actif plus de 18 ann&eacute;es d&rsquo;exp&eacute;riences en zones touristiques des USA.</span></p>\r\n<p><span style=\"font-weight: 400;\">&nbsp;</span></p>\r\n<p><span style=\"font-weight: 400;\">Rentacstours aujourd&rsquo;hui, est une extension de savoir-faire, une multitude de services sur mesure allant des voyages organis&eacute;s h&ocirc;tels, h&eacute;bergement, vol aux activit&eacute;s de divertissement et de bien-&ecirc;tre motocycle, golf tour, bivouacs, trekking, surf, yoga .. Nous proposons aussi des services &agrave; l&rsquo;international gr&acirc;ce &agrave; la participation de diff&eacute;rents partenaires qui ont accept&eacute; de prendre part &agrave; cette aventure.</span></p>\r\n<p><span style=\"font-weight: 400;\">&nbsp;</span></p>\r\n<p><span style=\"font-weight: 400;\">Et pour tous les friands et amateurs de circuits &agrave; moto, vous pouvez profiter des offres exclusives et des meilleurs mod&egrave;les de motos Harley Davidson et Yamaha gr&acirc;ce &agrave; notre partenaire Rentacs Motor, repr&eacute;sentant exclusif de Eaglerider au Maroc. Le tout pour vous faire vivre des voyages exceptionnels et des aventures atypiques.&nbsp;</span></p>\r\n<p>&nbsp;</p>\r\n<p><span style=\"font-weight: 400;\">D&eacute;couvrez nos meilleures offres ou contactez-nous maintenant pour organiser votre prochain voyage.</span></p>\r\n<p>&nbsp;</p>'),
(8, 22, 'en', 'The 7 essential steps to prepare for your trip', '<p><span class=\"VIiyi\" lang=\"en\"><span class=\"JLqJ4b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"auto\" data-phrase-index=\"0\">Now that you have decided to go on a trip, you need to follow some essential steps to plan it the best. Because planning a trip isn\'t always easy, especially if it\'s your first time. In the rest of this article, we will provide you with the right tips to make the most of your next trip with peace of mind. </span></span></p>\r\n<p><span class=\"VIiyi\" lang=\"en\"><span class=\"JLqJ4b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"auto\" data-phrase-index=\"0\">1- Choose your next destination </span></span></p>\r\n<p><span class=\"VIiyi\" lang=\"en\"><span class=\"JLqJ4b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"auto\" data-phrase-index=\"0\">Obviously, isn\'t it? However, the choice still becomes a little difficult, especially when there are several places that one would like to visit. In order to make the best choice, here are some factors to consider when deciding on your next destination: Budget: The money you will have to spend if you choose to go to Norway is certainly not the same if you go to Thailand! Try to calculate all the expected expenses for your trip. Formalities: You must take sufficient time before your planned date of travel to prepare all the entry formalities so that you can organize your trip comfortably without wasting time! </span></span></p>\r\n<p><span class=\"VIiyi\" lang=\"en\"><span class=\"JLqJ4b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"auto\" data-phrase-index=\"0\">Travel period: It is important to research some information about your destination in the chosen period such as the weather, local holidays, demonstrations or any event; to know what awaits you especially on the financial plan (because the prices could increase in the festive periods). </span></span></p>\r\n<p><span class=\"VIiyi\" lang=\"en\"><span class=\"JLqJ4b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"auto\" data-phrase-index=\"0\">Travel Style: Choosing your next destination depends on your travel style; that is, if you would rather take your backpack and embark on an adventure, or if what you are looking for is relaxation at the beach. If you choose to travel solo or if you prefer to travel as a couple or as a family. Choose a destination well suited to your travel preferences. </span></span></p>\r\n<p><span class=\"VIiyi\" lang=\"en\"><span class=\"JLqJ4b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"auto\" data-phrase-index=\"0\">Time available: In order to choose your next destination; you need to take into consideration the travel time you have available. If you don\'t have a lot of time, it doesn\'t make sense to choose a faraway destination or you risk spending a lot of your time on the road! </span></span></p>\r\n<p><span class=\"VIiyi\" lang=\"en\"><span class=\"JLqJ4b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"auto\" data-phrase-index=\"0\">Political situation: It is very important to find out about the political situation of the chosen country before leaving. And to do this, consult the Foreign Affairs site of your country. Do not underestimate the importance of this step because it will influence the quality of your trip. </span></span></p>\r\n<p><span class=\"VIiyi\" lang=\"en\"><span class=\"JLqJ4b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"auto\" data-phrase-index=\"0\">2- Prepare your itinerary It depends largely on your style of travel (An organized or improvised trip / Visiting one or several countries at the same time). </span></span></p>\r\n<p><span class=\"VIiyi\" lang=\"en\"><span class=\"JLqJ4b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"auto\" data-phrase-index=\"0\">So, to identify your itinerary, you need to take these criteria into consideration, and then take a look at the blogs and travel guides available on the internet to get a general idea of ​​the places you could visit. </span></span></p>\r\n<p><span class=\"VIiyi\" lang=\"en\"><span class=\"JLqJ4b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"auto\" data-phrase-index=\"0\">You can also consult the websites of the agencies that offer organized tours to your destination. Remember, your itinerary must absolutely be realistic! And so, for this you need to know the travel time between the places you are going to go and also whether there is a possibility of transportation. </span></span></p>\r\n<p><span class=\"VIiyi\" lang=\"en\"><span class=\"JLqJ4b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"auto\" data-phrase-index=\"0\">3- Reservation of the plane or train ticket Now that you know the duration and dates of your trip, you need to book your ticket. To book your plane or train ticket, use one of the plane or train comparators available on the internet. There are also bus comparators if you need them! These comparators would be very useful for you to find the price that suits you best. </span></span></p>\r\n<p><span class=\"VIiyi\" lang=\"en\"><span class=\"JLqJ4b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"auto\" data-phrase-index=\"0\">4- Take travel insurance It is of great importance to be covered in the event of illnesses and accidents during your trip, because if you ever fall ill or have an accident, you will have to pay a large sum as hospital costs. . To avoid this, check out the travel insurance offers on the internet and book your own. </span></span></p>\r\n<p><span class=\"VIiyi\" lang=\"en\"><span class=\"JLqJ4b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"auto\" data-phrase-index=\"0\">5- Accommodation reservation You will not need to follow this step if you wish to make a reservation on site. Alternatively, if you prefer to book your accommodation in advance, you can opt for one of the online booking sites. </span></span></p>\r\n<p><span class=\"VIiyi\" lang=\"en\"><span class=\"JLqJ4b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"auto\" data-phrase-index=\"0\">You can see reviews from people who have used it before, not to mention that you can - for most sites - cancel your reservation at any time (unless it is longer than 48 hours). </span></span></p>\r\n<p><span class=\"VIiyi\" lang=\"en\"><span class=\"JLqJ4b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"auto\" data-phrase-index=\"0\">6- Car rental If you need a car for your trip, check out a car rental site to get the best deals available with all the car information you\'ll need. 7- Booking of excursions and activities The goal of this step is to help you get the most out of your trip. It also depends on your travel style, your budget and what you plan to do on your trip. </span></span></p>\r\n<p><span class=\"VIiyi\" lang=\"en\"><span class=\"JLqJ4b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"auto\" data-phrase-index=\"0\"> So if you want to book online <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"auto\" data-phrase-index=\"0\">gene;</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"auto\" data-phrase-index=\"1\">you just have to use an internet reservation site.</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"auto\" data-phrase-index=\"2\">This will not only allow you to choose the best price offers available;</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"auto\" data-phrase-index=\"3\">but also to avoid the traps that are sometimes made for tourists.</span> </span></span></p>\r\n<p><span class=\"VIiyi\" lang=\"en\"><span class=\"JLqJ4b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"auto\" data-phrase-index=\"0\"><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"auto\" data-phrase-index=\"5\">However, if you ever find an interesting and affordable activity out there, you should definitely give it a try!</span> </span></span></p>\r\n<p><span class=\"VIiyi\" lang=\"en\"><span class=\"JLqJ4b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"auto\" data-phrase-index=\"0\"><span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"auto\" data-phrase-index=\"7\">Rentacs offers you a multitude of activities you absolutely must try.</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"auto\" data-phrase-index=\"8\">Check out our offers and book the one that suits you the most!</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"auto\" data-phrase-index=\"10\">And There you go!</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"auto\" data-phrase-index=\"11\">Now you are ready to pack your things and head to your next destination!</span> <span class=\"JLqJ4b ChMk0b\" data-language-for-alternatives=\"en\" data-language-to-translate-into=\"auto\" data-phrase-index=\"13\">Have a nice trip!</span>&nbsp;</span> </span></p>'),
(9, 22, 'fr', 'Les 7 étapes incontournables pour préparer votre voyage', '<p><span style=\"font-weight: 400;\">Maintenant que vous avez d&eacute;cid&eacute; de partir en voyage, vous avez besoin de suivre quelques &eacute;tapes incontournables pour le planifier au mieux. Parce qu&rsquo;organiser un voyage n&rsquo;est pas tout le temps facile, surtout si c&rsquo;est la premi&egrave;re fois.&nbsp;</span></p>\r\n<p><span style=\"font-weight: 400;\">Dans la suite de cet article, nous allons vous fournir les bonnes astuces pour profiter pleinement de votre prochain voyage en toute tranquillit&eacute;.</span></p>\r\n<p><strong>1- Choisissez votre prochaine destination</strong></p>\r\n<p><span style=\"font-weight: 400;\">C&rsquo;est &eacute;vident, n&rsquo;est ce pas? Pourtant, le choix devient quand m&ecirc;me un peu difficile, surtout lorsqu&rsquo;il y a plusieurs endroits qu&rsquo;on aimerait visiter.&nbsp;</span></p>\r\n<p><span style=\"font-weight: 400;\">Afin de faire le meilleur choix, voici quelques facteurs &agrave; prendre en consid&eacute;ration pour d&eacute;cider de votre prochaine destination:</span></p>\r\n<ul>\r\n<li aria-level=\"1\"><strong>Budget: </strong><span style=\"font-weight: 400;\">L&rsquo;argent que vous aurez &agrave; d&eacute;penser si vous choisissez de partir en Norv&egrave;ge n&rsquo;est certainement pas le m&ecirc;me si vous partez en Tha&iuml;lande! T&acirc;chez de calculer toutes les d&eacute;penses pr&eacute;vues pour votre voyage.</span></li>\r\n</ul>\r\n<ul>\r\n<li aria-level=\"1\"><strong>Formalit&eacute;s: </strong><span style=\"font-weight: 400;\">Vous devez prendre du temps suffisant avant la date pr&eacute;vue de votre voyage pour pr&eacute;parer toutes les formalit&eacute;s d&rsquo;entr&eacute;e afin de pouvoir organiser votre voyage &agrave; l&rsquo;aise sans perdre du temps!&nbsp;</span></li>\r\n</ul>\r\n<ul>\r\n<li aria-level=\"1\"><strong>P&eacute;riode de voyage: </strong><span style=\"font-weight: 400;\">C&rsquo;est important de chercher quelques informations sur votre destination dans la p&eacute;riode choisie comme la m&eacute;t&eacute;o, les f&ecirc;tes locales, les manifestations ou n&rsquo;importe quel &eacute;v&eacute;nement; pour savoir ce qui vous attend surtout sur le plan financier (parce que les prix pourraient augmenter dans les p&eacute;riodes festives).&nbsp;</span></li>\r\n</ul>\r\n<ul>\r\n<li aria-level=\"1\"><strong>Style de voyage: </strong><span style=\"font-weight: 400;\">Le choix de votre prochaine destination d&eacute;pend de votre style de voyage; c&rsquo;est-&agrave;-dire, si vous pr&eacute;f&eacute;riez prendre votre sac-&agrave;-dos et vous embarquer dans une aventure, ou si ce que vous cherchez plut&ocirc;t est une d&eacute;tente &agrave; la plage.. Si vous choisissez de voyager en solo ou si vous pr&eacute;f&eacute;rez voyager en couple ou en famille.. Optez pour une destination bien adapt&eacute;e &agrave; vos pr&eacute;f&eacute;rences de voyage.</span></li>\r\n</ul>\r\n<ul>\r\n<li aria-level=\"1\"><strong>Temps disponible: </strong><span style=\"font-weight: 400;\">Afin de bien choisir votre prochaine destination; vous devez prendre en consid&eacute;ration le temps de voyage dont vous disposez. Si vous n&rsquo;avez pas beaucoup de temps, cela n&rsquo;a aucun sens de choisir une destination lointaine sinon vous risquez de passer une bonne partie de votre temps en route!</span></li>\r\n</ul>\r\n<ul>\r\n<li aria-level=\"1\"><strong>Situation politique: </strong><span style=\"font-weight: 400;\">C&rsquo;est tr&egrave;s important de vous renseigner sur la situation politique du pays choisi avant d&rsquo;y partir. Et pour ce faire, consultez le site des Affaires &eacute;trang&egrave;res de votre pays.&nbsp;</span></li>\r\n</ul>\r\n<p><span style=\"font-weight: 400;\">Ne sous estimez pas l&rsquo;importance de cette &eacute;tape parce qu&rsquo;elle influencera la qualit&eacute; de votre voyage.</span></p>\r\n<p><img src=\"/uploads/photos/1/tabea-damm-9-xfYKAI6ZI-unsplash.jpg\" alt=\"\" width=\"100%\" height=\"100%\" /></p>\r\n<p><strong>2- Pr&eacute;parez votre itin&eacute;raire</strong></p>\r\n<p><span style=\"font-weight: 400;\">Cela d&eacute;pend largement de votre style de voyage (Un voyage organis&eacute; ou bien improvis&eacute;/ Visiter un seul ou bien plusieurs pays &agrave; la fois). Alors, pour identifier votre itin&eacute;raire, vous devez prendre en consid&eacute;ration ces crit&egrave;res l&agrave;, et puis jetez un coup d\'&oelig;il sur les blogs et les guides de voyage disponibles sur internet pour avoir une id&eacute;e g&eacute;n&eacute;rale sur les endroits que vous pourriez visiter. Vous pouvez aussi consulter les sites des agences qui proposent des tours organis&eacute;s &agrave; votre destination.</span></p>\r\n<p><span style=\"font-weight: 400;\">N&rsquo;oubliez pas que votre itin&eacute;raire doit absolument &ecirc;tre r&eacute;aliste! Et donc, pour cela, vous devez savoir le temps de trajet entre les endroits dont vous allez vous rendre et aussi s&rsquo;il y a une possibilit&eacute; de transport.</span></p>\r\n<p><strong>3- R&eacute;servation du billet d&rsquo;avion ou de train</strong></p>\r\n<p><span style=\"font-weight: 400;\">Maintenant que vous connaissez la dur&eacute;e et les dates de votre voyage, il faut que vous r&eacute;serviez votre billet.</span></p>\r\n<p><span style=\"font-weight: 400;\">Pour r&eacute;server votre billet d&rsquo;avion ou de train, utilisez l&rsquo;un des comparateurs d&rsquo;avion ou de train disponibles sur internet. Il y a aussi des comparateurs de bus si vous en avez besoin!</span></p>\r\n<p><span style=\"font-weight: 400;\">Ces comparateurs vous seraient tr&egrave;s utiles pour trouver le tarif qui vous convient le mieux.&nbsp;</span></p>\r\n<p><strong>4- Prendre une assurance de voyage</strong></p>\r\n<p><span style=\"font-weight: 400;\">Il est d&rsquo;une grande importance d&rsquo;&ecirc;tre couvert en cas de maladies et d&rsquo;accidents pendant votre voyage, parce que si jamais vous tombez malade ou que vous avez un accident, vous serez oblig&eacute; de payer une somme importante comme frais d&rsquo;hospitalisation.</span></p>\r\n<p><span style=\"font-weight: 400;\">Afin d&rsquo;&eacute;viter cela, consultez les offres d&rsquo;assurance voyage sur internet et r&eacute;servez la votre.</span></p>\r\n<p><strong>5- R&eacute;servation d&rsquo;h&eacute;bergement</strong></p>\r\n<p><span style=\"font-weight: 400;\">Vous n&rsquo;aurez pas besoin de suivre cette &eacute;tape si vous souhaitez faire une r&eacute;servation sur place. Sinon, si vous pr&eacute;f&eacute;rez r&eacute;server votre h&eacute;bergement &agrave; l&rsquo;avance, vous pouvez opter pour l&rsquo;un des sites de r&eacute;servation en ligne. Vous pouvez voir les reviews des gens qui l&rsquo;ont d&eacute;j&agrave; utilis&eacute;, sans oublier que vous pouvez -pour la plupart des sites- annuler votre r&eacute;servation &agrave; tout moment (&agrave; moins que cela ne d&eacute;passe 48h).</span></p>\r\n<p><strong>6- Location de voiture</strong></p>\r\n<p><span style=\"font-weight: 400;\">Si vous avez besoin d&rsquo;une voiture pour votre voyage, consultez un site de location de voitures pour obtenir les meilleures offres disponibles avec toutes les informations de voiture dont vous aurez besoin.</span></p>\r\n<p><strong>7- R&eacute;servation des excursions et activit&eacute;s</strong></p>\r\n<p><span style=\"font-weight: 400;\">Le but de cette &eacute;tape est de vous permettre de profiter au mieux de votre voyage. Elle d&eacute;pend aussi de votre style de voyage, de votre budget et de ce que vous pr&eacute;voyez faire dans votre voyage.</span></p>\r\n<p><span style=\"font-weight: 400;\">Alors, si vous souhaitez r&eacute;server en ligne; vous n&rsquo;avez qu&rsquo;&agrave; utiliser un site de r&eacute;servation sur internet. Cela ne va pas seulement vous permettre de choisir les meilleures offres de prix disponibles; mais aussi d&rsquo;&eacute;viter les pi&egrave;ges que l&rsquo;on fait parfois aux touristes.</span></p>\r\n<p><span style=\"font-weight: 400;\">Toutefois, si jamais vous trouvez une activit&eacute; int&eacute;ressante et abordable sur place, vous devriez absolument l&rsquo;essayer!</span></p>\r\n<p><span style=\"font-weight: 400;\">Rentacs vous propose une multitude d&rsquo;activit&eacute;s &agrave; absolument essayer. Consultez nos offres et r&eacute;servez celle qui vous convient le plus!</span></p>\r\n<p><span style=\"font-weight: 400;\">Et voil&agrave;! Maintenant, vous &ecirc;tes pr&ecirc;t pour pr&eacute;parer vos affaires et vous dirigez vers votre prochaine destination!</span></p>\r\n<p><span style=\"font-weight: 400;\">Bon voyage!</span></p>'),
(10, 23, 'en', 'Les meilleurs endroits que vous devez visiter au Maroc', '<p><span style=\"font-weight: 400;\">Juste son nom fait r&ecirc;ver.. Le Maroc! Un pays d&rsquo;Afrique du nord qui allie tradition et modernit&eacute; et se r&eacute;jouit d&rsquo;une richesse naturelle &eacute;poustouflante! Il est aussi tr&egrave;s connu pour </span><strong>l</strong><span style=\"font-weight: 400;\">&rsquo;hospitalit&eacute; et la g&eacute;n&eacute;rosit&eacute; de ses habitants. Plusieurs touristes le consid&egrave;rent comme leur meilleure destination de voyage!&nbsp;</span></p>\r\n<p><span style=\"font-weight: 400;\">Pour </span><strong>une exp&eacute;rience de voyage in&eacute;dite notamment &agrave; moto</strong><span style=\"font-weight: 400;\">, le Maroc vous permet de d&eacute;couvrir de tr&egrave;s beaux paysages qui ne se limitent pas aux montagnes qu&rsquo;offrent g&eacute;n&eacute;ralement les circuits &agrave; moto; mais plus encore! Vous y trouverez aussi des </span><strong>paysages naturels extraordinaires</strong><span style=\"font-weight: 400;\">: des plaines, des for&ecirc;ts, des vall&eacute;es, des d&eacute;serts, des oasis, l&rsquo;oc&eacute;an atlantique, la m&eacute;diterran&eacute;e...etc.</span></p>\r\n<p><span style=\"font-weight: 400;\">Voici des destinations auxquelles vous aurez sans doute envie de revenir encore et encore!&nbsp;</span></p>\r\n<p><span style=\"font-weight: 400;\">Mais tenez-vous bien, ce serait un peu difficile de vous d&eacute;cider; parce que ces destinations sont toutes aussi stup&eacute;fiantes l&rsquo;une que l&rsquo;autre!</span></p>\r\n<p><span style=\"font-weight: 400;\">Allez, on y va?&nbsp;</span></p>\r\n<p><span style=\"font-weight: 400;\">C&rsquo;est parti!</span></p>\r\n<h3><strong>Marrakech, la ville Ocre</strong></h3>\r\n<p><span style=\"font-weight: 400;\">C&rsquo;est </span><strong>la premi&egrave;re ville touristique du Maroc</strong><span style=\"font-weight: 400;\">. Elle a une grande popularit&eacute; aupr&egrave;s des touristes &eacute;trangers; et ils y sont tr&egrave;s nombreux tout au long de l&rsquo;ann&eacute;e. Ce qui est exceptionnel &agrave; propos de cette ville; c&rsquo;est qu&rsquo;il y en a plusieurs endroits &agrave; visiter, et ils sont tous merveilleux!&nbsp;</span></p>\r\n<p><span style=\"font-weight: 400;\">Vous pouvez d&eacute;couvrir ses </span><strong>magnifiques souks populaires</strong><span style=\"font-weight: 400;\">, </span><strong>la fameuse place Jama&acirc; El-Fna</strong><span style=\"font-weight: 400;\"> caract&eacute;ris&eacute;e par son ambiance authentique et chaleureuse, le </span><strong>Jardin Majorelle</strong><span style=\"font-weight: 400;\">, ou encore </span><strong>la palmeraie de la ville rouge</strong><span style=\"font-weight: 400;\">, sans oublier ses b&acirc;timents historiques formidables.</span></p>\r\n<h3><strong>Lac Bin El Ouidane</strong></h3>\r\n<p><span style=\"font-weight: 400;\">Sans m&ecirc;me vous fournir d\'informations sur ce lac, une seule photo sur Google pourrait &eacute;veiller votre int&eacute;r&ecirc;t pour la visiter! Situ&eacute; dans la province d&rsquo;Azilal, le lac Bin El Ouidane est un endroit magnifique que vous allez sans doute adorer.</span></p>\r\n<p><span style=\"font-weight: 400;\">C&rsquo;est un immense lac de 4000 hectares, avec une hauteur de 800 m&egrave;tres; ce qui la rend le plus haut lac dans toute l&rsquo;Afrique! Son immensit&eacute;, la couleur rafra&icirc;chissante de l&rsquo;eau, les terres qui l&rsquo;entourent et les oliviers sont tous des paysages qui font sortir la beaut&eacute; du lac et refl&egrave;tent </span><strong>la splendeur de la nature marocaine</strong><span style=\"font-weight: 400;\">!</span><strong>&nbsp;</strong></p>\r\n<h3><strong>Mazagan</strong></h3>\r\n<p><span style=\"font-weight: 400;\">C&rsquo;est un resort hors pair avec un emplacement id&eacute;al qui donne sur l&rsquo;Oc&eacute;an Atlantique et une for&ecirc;t enchant&eacute;e; o&ugrave; la tradition marocaine et la modernit&eacute; se compl&egrave;tent parfaitement!&nbsp;</span></p>\r\n<p><span style=\"font-weight: 400;\">Que vous cherchiez une exp&eacute;rience romantique avec votre partenaire ou bien des moments impeccables avec votre famille ou amis, Mazagan a pour vous un large panel d&rsquo;activit&eacute;s int&eacute;ressantes qui vont surement rendre votre s&eacute;jour dans la r&eacute;gion inoubliable.</span></p>\r\n<h3><strong>Ksar Ait-ben-Haddou</strong></h3>\r\n<p><span style=\"font-weight: 400;\">Situ&eacute; dans la province de Ouarzazate, Ksar Ait-ben-Haddou est un village fortifi&eacute; et &eacute;difi&eacute; sur le c&ocirc;t&eacute; d&rsquo;une colline; avec des murs d&eacute;fensifs en ocre et caramel qui vous transporteront dans les vieux temps! C&rsquo;est un endroit unique; et ce qui le prouve c&rsquo;est qu&rsquo;il est class&eacute; au patrimoine de l&rsquo;UNESCO.</span></p>\r\n<p><span style=\"font-weight: 400;\">Vous l&rsquo;avez peut-&ecirc;tre d&eacute;j&agrave; vu &agrave; la t&eacute;l&eacute;, il &eacute;tait en effet le lieu de plusieurs tournages tels que Game of Thrones et Gladiator.</span></p>\r\n<h3><strong>Les gorges du Dad&egrave;s</strong><span style=\"font-weight: 400;\">&nbsp;</span></h3>\r\n<p><span style=\"font-weight: 400;\">Un autre endroit qui n&rsquo;est pas moins spectaculaire. Situ&eacute;es dans le sud du Maroc, les gorges du Dad&egrave;s constituent l&rsquo;un des paysages magnifiques qui refl&egrave;tent la beaut&eacute; du sud marocain. La vue domin&eacute;e par les roches est d&eacute;cor&eacute;e par des formations g&eacute;ologiques impeccables; avec des couleurs fabuleuses. &Ccedil;a donne du vertige mais &ccedil;a vaut absolument le coup!<br /></span></p>\r\n<p><span style=\"font-weight: 400;\"><img src=\"/uploads/photos/1/road-from-ouarzazate-to-marrakesh.jpg\" alt=\"\" width=\"100%\" height=\"100%\" /></span></p>\r\n<h3><strong>Merzouga&nbsp;</strong></h3>\r\n<p><span style=\"font-weight: 400;\">Si vous visitez le Maroc sans passer par le Sahara, vous risquez de g&acirc;cher un vrai r&eacute;gal pour vos yeux! C&rsquo;est au sud-est que se trouve le village de Merzouga, un endroit parfait pour d&eacute;couvrir </span><strong>les grandes dunes du Sahara</strong><span style=\"font-weight: 400;\"> dans l&rsquo;immense mer de sable!&nbsp;</span></p>\r\n<h3><strong>Chefchaouen</strong></h3>\r\n<p><span style=\"font-weight: 400;\">Parmi les incontournables &agrave; visiter au Maroc; c&rsquo;est la perle bleue du pays: la ville de Chefchaouen. Elle se trouve dans le nord-est et est caract&eacute;ris&eacute;e par la teinture bleue ciel de ses habitations, ruelles et fa&ccedil;ades. Enti&egrave;rement peinte en bleu ciel, la ville est dot&eacute;e d&rsquo;une simplicit&eacute; charmante et agr&eacute;able. Cela rappelle un peu la Gr&egrave;ce, sauf que c&rsquo;est en bleu ciel! En visitant Chefchaouen, assistez au coucher de soleil pour profiter d&rsquo;un instant fascinant!&nbsp;&nbsp;</span></p>\r\n<h3><strong>F&egrave;s</strong></h3>\r\n<p><span style=\"font-weight: 400;\">Dans la ville de F&egrave;s, vous trouverez une partie jeune, une partie demi-vieille et une autre vieille. Il s&rsquo;y trouve des tr&eacute;sors historiques tels que </span><strong>le palais Alaouite</strong><span style=\"font-weight: 400;\">, </span><strong>l&rsquo;ancien quartier juif</strong><span style=\"font-weight: 400;\">, </span><strong>la mosqu&eacute;e Karaouiyine</strong><span style=\"font-weight: 400;\">, </span><strong>la vieille universit&eacute; du monde arabe</strong><span style=\"font-weight: 400;\">...etc. Elle est tr&egrave;s connue pour sa vieille m&eacute;dina qui est class&eacute;e au patrimoine de l&rsquo;UNESCO et qui fait revivre le pass&eacute;.</span></p>\r\n<h3><strong>Essaouira</strong></h3>\r\n<p><span style=\"font-weight: 400;\">Situ&eacute;e au bord de l&rsquo;Atlantique, Essaouira est </span><strong>une ville touristique</strong><span style=\"font-weight: 400;\"> class&eacute;e au patrimoine de l&rsquo;UNESCO. Elle est dot&eacute;e d&rsquo;une authenticit&eacute; ravissante et d\'une fra&icirc;cheur captivante qui vient de son port. Chaude pendant l&rsquo;&eacute;t&eacute;, elle se r&eacute;jouit des superbes plages dont vous pouvez profiter en cette saison. C&rsquo;est aussi la destination des photographes qui veulent profiter des plus beaux couchers de soleil autour du pays.</span></p>\r\n<h3><strong>Dakhla</strong></h3>\r\n<p><span style=\"font-weight: 400;\">C&rsquo;est une ville de l&rsquo;extr&ecirc;me sud marocain qui allie d&eacute;sert et oc&eacute;an! A Dakhla, vous pouvez faire une excursion dans le d&eacute;sert, profiter </span><strong>des beaux plages</strong><span style=\"font-weight: 400;\"> ou de </span><strong>la source d&rsquo;eaux chaudes Asmaa</strong><span style=\"font-weight: 400;\"> ou encore visiter l&rsquo;un de ses captivants paysages tels que </span><strong>la lagune de Dakhla</strong><span style=\"font-weight: 400;\"> et </span><strong>l&rsquo;&icirc;le de Dragon</strong><span style=\"font-weight: 400;\">.</span></p>\r\n<p><span style=\"font-weight: 400;\">Et voil&agrave;! Vous allez certainement trouver dans l\'un de ces endroits votre prochaine destination id&eacute;ale pour profiter au maximum de votre voyage au Maroc! Mais ce n&rsquo;est pas tout, il y en a absolument d&rsquo;autres lieux aussi beaux que ceux-ci!</span></p>\r\n<p><span style=\"font-weight: 400;\">Alors, d&eacute;cidez de votre prochaine destination et </span><strong>planifiez votre prochain voyage avec nous</strong><span style=\"font-weight: 400;\">.</span></p>'),
(11, 23, 'fr', 'Les meilleurs destinations que vous devez visiter au Maroc', '<p><span style=\"font-weight: 400;\">Juste son nom fait r&ecirc;ver.. Le Maroc! Un pays d&rsquo;Afrique du nord qui allie tradition et modernit&eacute; et se r&eacute;jouit d&rsquo;une richesse naturelle &eacute;poustouflante! Il est aussi tr&egrave;s connu pour </span><strong>l</strong><span style=\"font-weight: 400;\">&rsquo;hospitalit&eacute; et la g&eacute;n&eacute;rosit&eacute; de ses habitants. Plusieurs touristes le consid&egrave;rent comme leur meilleure destination de voyage!&nbsp;</span></p>\r\n<p>Pour une exp&eacute;rience de voyage in&eacute;dite notamment &agrave; moto, le Maroc vous permet de d&eacute;couvrir de tr&egrave;s beaux paysages qui ne se limitent pas aux montagnes qu&rsquo;offrent g&eacute;n&eacute;ralement les circuits &agrave; moto; mais plus encore! Vous y trouverez aussi des paysages naturels extraordinaires: des plaines, des for&ecirc;ts, des vall&eacute;es, des d&eacute;serts, des oasis, l&rsquo;oc&eacute;an atlantique, la m&eacute;diterran&eacute;e...etc.</p>\r\n<p><span style=\"font-weight: 400;\">Voici des destinations auxquelles vous aurez sans doute envie de revenir encore et encore!&nbsp;</span></p>\r\n<p><span style=\"font-weight: 400;\">Mais tenez-vous bien, ce serait un peu difficile de vous d&eacute;cider; parce que ces destinations sont toutes aussi stup&eacute;fiantes l&rsquo;une que l&rsquo;autre!</span></p>\r\n<p><span style=\"font-weight: 400;\">Allez, on y va?&nbsp;</span></p>\r\n<p><span style=\"font-weight: 400;\">C&rsquo;est parti!</span></p>\r\n<h3><strong>Marrakech, la ville Ocre</strong></h3>\r\n<p>C&rsquo;est la premi&egrave;re ville touristique du Maroc. Elle a une grande popularit&eacute; aupr&egrave;s des touristes &eacute;trangers; et ils y sont tr&egrave;s nombreux tout au long de l&rsquo;ann&eacute;e. Ce qui est exceptionnel &agrave; propos de cette ville; c&rsquo;est qu&rsquo;il y en a plusieurs endroits &agrave; visiter, et ils sont tous merveilleux!&nbsp;</p>\r\n<p>Vous pouvez d&eacute;couvrir ses magnifiques souks populaires, la fameuse place Jama&acirc; El-Fna caract&eacute;ris&eacute;e par son ambiance authentique et chaleureuse, le Jardin Majorelle, ou encore la palmeraie de la ville rouge, sans oublier ses b&acirc;timents historiques formidables.</p>\r\n<h3><strong>Lac Bin El Ouidane</strong></h3>\r\n<p><span style=\"font-weight: 400;\">Sans m&ecirc;me vous fournir d\'informations sur ce lac, une seule photo sur Google pourrait &eacute;veiller votre int&eacute;r&ecirc;t pour la visiter! Situ&eacute; dans la province d&rsquo;Azilal, le lac Bin El Ouidane est un endroit magnifique que vous allez sans doute adorer.</span></p>\r\n<p>C&rsquo;est un immense lac de 4000 hectares, avec une hauteur de 800 m&egrave;tres; ce qui la rend le plus haut lac dans toute l&rsquo;Afrique! Son immensit&eacute;, la couleur rafra&icirc;chissante de l&rsquo;eau, les terres qui l&rsquo;entourent et les oliviers sont tous des paysages qui font sortir la beaut&eacute; du lac et refl&egrave;tent la splendeur de la nature marocaine!&nbsp;</p>\r\n<p><img src=\"/uploads/photos/1/102788779_o.jpg\" alt=\"\" width=\"100%\" height=\"100%\" /></p>\r\n<h3><strong>Mazagan</strong></h3>\r\n<p><span style=\"font-weight: 400;\">C&rsquo;est un resort hors pair avec un emplacement id&eacute;al qui donne sur l&rsquo;Oc&eacute;an Atlantique et une for&ecirc;t enchant&eacute;e; o&ugrave; la tradition marocaine et la modernit&eacute; se compl&egrave;tent parfaitement!&nbsp;</span></p>\r\n<p><span style=\"font-weight: 400;\">Que vous cherchiez une exp&eacute;rience romantique avec votre partenaire ou bien des moments impeccables avec votre famille ou amis, Mazagan a pour vous un large panel d&rsquo;activit&eacute;s int&eacute;ressantes qui vont surement rendre votre s&eacute;jour dans la r&eacute;gion inoubliable.</span></p>\r\n<h3><strong>Ksar Ait-ben-Haddou</strong></h3>\r\n<p><span style=\"font-weight: 400;\">Situ&eacute; dans la province de Ouarzazate, Ksar Ait-ben-Haddou est un village fortifi&eacute; et &eacute;difi&eacute; sur le c&ocirc;t&eacute; d&rsquo;une colline; avec des murs d&eacute;fensifs en ocre et caramel qui vous transporteront dans les vieux temps! C&rsquo;est un endroit unique; et ce qui le prouve c&rsquo;est qu&rsquo;il est class&eacute; au patrimoine de l&rsquo;UNESCO.</span></p>\r\n<p><span style=\"font-weight: 400;\">Vous l&rsquo;avez peut-&ecirc;tre d&eacute;j&agrave; vu &agrave; la t&eacute;l&eacute;, il &eacute;tait en effet le lieu de plusieurs tournages tels que Game of Thrones et Gladiator.</span></p>\r\n<p><span style=\"font-weight: 400;\"><img src=\"/uploads/photos/1/ksar+ait-ben-haddou+6.jpg\" alt=\"\" width=\"100%\" height=\"100%\" /></span></p>\r\n<h3><strong>Les gorges du Dad&egrave;s</strong><span style=\"font-weight: 400;\">&nbsp;</span></h3>\r\n<p><span style=\"font-weight: 400;\">Un autre endroit qui n&rsquo;est pas moins spectaculaire. Situ&eacute;es dans le sud du Maroc, les gorges du Dad&egrave;s constituent l&rsquo;un des paysages magnifiques qui refl&egrave;tent la beaut&eacute; du sud marocain. La vue domin&eacute;e par les roches est d&eacute;cor&eacute;e par des formations g&eacute;ologiques impeccables; avec des couleurs fabuleuses. &Ccedil;a donne du vertige mais &ccedil;a vaut absolument le coup!</span></p>\r\n<h3><strong>Merzouga&nbsp;</strong></h3>\r\n<p>Si vous visitez le Maroc sans passer par le Sahara, vous risquez de g&acirc;cher un vrai r&eacute;gal pour vos yeux! C&rsquo;est au sud-est que se trouve le village de Merzouga, un endroit parfait pour d&eacute;couvrir les grandes dunes du Sahara dans l&rsquo;immense mer de sable!&nbsp;</p>\r\n<p><img src=\"/uploads/photos/1/merzouga-water.jpg\" alt=\"\" width=\"100%\" height=\"100%\" /></p>\r\n<h3><strong>Dakhla</strong></h3>\r\n<p>C&rsquo;est une ville de l&rsquo;extr&ecirc;me sud marocain qui allie d&eacute;sert et oc&eacute;an! A Dakhla, vous pouvez faire une excursion dans le d&eacute;sert, profiter des beaux plages ou de la source d&rsquo;eaux chaudes Asmaa ou encore visiter l&rsquo;un de ses captivants paysages tels que la lagune de Dakhla et l&rsquo;&icirc;le de Dragon.</p>\r\n<h3><strong>Chefchaouen</strong></h3>\r\n<p><span style=\"font-weight: 400;\">Parmi les incontournables &agrave; visiter au Maroc; c&rsquo;est la perle bleue du pays: la ville de Chefchaouen. Elle se trouve dans le nord-est et est caract&eacute;ris&eacute;e par la teinture bleue ciel de ses habitations, ruelles et fa&ccedil;ades. Enti&egrave;rement peinte en bleu ciel, la ville est dot&eacute;e d&rsquo;une simplicit&eacute; charmante et agr&eacute;able. Cela rappelle un peu la Gr&egrave;ce, sauf que c&rsquo;est en bleu ciel! En visitant Chefchaouen, assistez au coucher de soleil pour profiter d&rsquo;un instant fascinant!&nbsp;&nbsp;</span></p>\r\n<p><span style=\"font-weight: 400;\"><img src=\"/uploads/photos/1/chefchaouen-house.jpg\" alt=\"\" width=\"100%\" height=\"100%\" /></span></p>\r\n<h3><strong>Essaouira</strong></h3>\r\n<p><span style=\"font-weight: 400;\">Situ&eacute;e au bord de l&rsquo;Atlantique, Essaouira est </span>une ville touristique class&eacute;e au patrimoine de l&rsquo;UNESCO. Elle est dot&eacute;e d&rsquo;une authenticit&eacute; ravissante et d\'une fra&icirc;cheur captivante qui vient de son port. Chaude pendant l&rsquo;&eacute;t&eacute;, elle se r&eacute;jouit des superbes plages dont vous pouvez profiter en cette saison. C&rsquo;est aussi la destination des photographes qui veulent profiter des plus beaux couchers de soleil autour du pays.</p>\r\n<h3><strong>F&egrave;s</strong></h3>\r\n<p>Dans la ville de F&egrave;s, vous trouverez une partie jeune, une partie demi-vieille et une autre vieille. Il s&rsquo;y trouve des tr&eacute;sors historiques tels que le palais Alaouite, l&rsquo;ancien quartier juif, la mosqu&eacute;e Karaouiyine, la vieille universit&eacute; du monde arabe...etc. Elle est tr&egrave;s connue pour sa vieille m&eacute;dina qui est class&eacute;e au patrimoine de l&rsquo;UNESCO et qui fait revivre le pass&eacute;.</p>\r\n<p><img src=\"/uploads/photos/1/fes.jpg\" alt=\"\" width=\"100%\" height=\"100%\" /></p>\r\n<p>Et voil&agrave;! Vous allez certainement trouver dans l\'un de ces endroits votre prochaine destination id&eacute;ale pour profiter au maximum de votre voyage au Maroc! Mais ce n&rsquo;est pas tout, il y en a absolument d&rsquo;autres lieux aussi beaux que ceux-ci!</p>\r\n<p>Alors, d&eacute;cidez de votre prochaine destination et planifiez votre prochain voyage avec nous.</p>');
INSERT INTO `post_translations` (`id`, `post_id`, `locale`, `title`, `content`) VALUES
(18, 28, 'en', 'Voyage en Solo: 30 astuces et conseils pour voyager seul', '<p><span style=\"font-weight: 400;\">&laquo; Un c&oelig;ur solitaire doit &ecirc;tre un c&oelig;ur plein, il est si plein qu&rsquo;il d&eacute;bordera pour se pr&eacute;cipiter, et il est si impatient que quelqu&rsquo;un lui fasse &eacute;cho, le re&ccedil;oive et le comprenne &raquo; Shi Tiesheng.</span></p>\r\n<p><span style=\"font-weight: 400;\">Voyager et prendre le temps de respirer un air nouveau, quelle puret&eacute;! Parcourir les dunes, les sables, les mers et m&ecirc;me les oc&eacute;ans, quel r&eacute;gal pour l&rsquo;&acirc;me! Savez-vous ce qu&rsquo;est r&eacute;ellement voyager ?</span></p>\r\n<p><span style=\"font-weight: 400;\">Voyager c&rsquo;est vivre chaque jour diff&eacute;remment, c&rsquo;est d&eacute;cider de faire quelque chose qui n&rsquo;a rien &agrave; voir avec notre quotidien, et c&rsquo;est d&eacute;cider de d&eacute;couvrir de nouveaux horizons, une nouvelle culture, un nouveau monde et bien s&ucirc;r, c&rsquo;est se r&eacute;galer autrement.</span></p>\r\n<p><span style=\"font-weight: 400;\">&laquo; Les personnes qui peuvent se parler ne se sentiront jamais seules &raquo; Maxwell Marz</span></p>\r\n<p><span style=\"font-weight: 400;\">C&rsquo;est bien de cela dont il est question : &laquo; savoir vivre sans le m&ecirc;me autrui et sans les m&ecirc;mes actions du quotidien qui remplissent notre vie. &raquo;. Voyager c&rsquo;est conna&icirc;tre et comprendre le monde qui nous entoure un peu plus et c&rsquo;est apprendre chaque jour quelque chose d&rsquo;inconnu. Mais comment faire lorsqu&rsquo;on veut voyager ? Comment r&eacute;ussir &agrave; vivre pleinement son voyage en communiquant sans &ecirc;tre accompagn&eacute; par un proche ou une connaissance ? Que faut-il faire, que faut-il dire et surtout comment faut-il se comporter ?</span></p>\r\n<p><span style=\"font-weight: 400;\">Rentacs Tours conna&icirc;t plusieurs rouages pour aider &agrave; mieux vivre votre voyage en solo. Voyager ne consiste pas seulement &agrave; d&eacute;cider de la destination que vous souhaitez visiter, il faut une bonne planification pour que votre voyage r&eacute;ussisse. Pour pouvez d&eacute;couvrir ici quelques &eacute;tapes incontournables pour bien pr&eacute;parer votre voyage. Dans cet article, Rentacs Tours a s&eacute;lectionn&eacute; pour vous 30 astuces que l&rsquo;on a souvent tendance &agrave; oublier mais qui vous aideront &agrave; mieux vivre votre voyage en solo.</span></p>\r\n<ol>\r\n<li style=\"font-weight: 400;\" aria-level=\"1\"><span style=\"font-weight: 400;\">Avoir ses papiers</span></li>\r\n</ol>\r\n<p><span style=\"font-weight: 400;\">Carte d&rsquo;identit&eacute;, passeport, permis de conduire&hellip; Voyager c&rsquo;est d&rsquo;abord pouvoir se pr&eacute;senter, &ecirc;tre identifiable et surtout &ecirc;tre r&eacute;pertori&eacute;. Vous ne pourrez effectuer aucun voyage sans papier. Vous risquerez de ne m&ecirc;me pas traverser le portique de s&eacute;curit&eacute;. Si vous devez faire le trajet en sens inverse &agrave; cause de l&rsquo;oubli d&rsquo;un de vos documents administratifs, vous pourrez rater votre vol et&nbsp; donc perdre en temps et en finance. Ne vous faites pas avoir ! R&eacute;fl&eacute;chissez &agrave; votre destination et pensez TOUJOURS &agrave; prendre d&rsquo;abord vos documents administratifs.</span></p>\r\n<ol>\r\n<li style=\"font-weight: 400;\" aria-level=\"1\"><span style=\"font-weight: 400;\">Savoir se rep&eacute;rer</span></li>\r\n</ol>\r\n<p><span style=\"font-weight: 400;\">Lorsque vous voyagez seul, vous avez doublement conscience des risques que vous prenez et vos sens sont bien plus aiguis&eacute;s. Voyager seul est un excellent moyen de faire travailler votre sens du rep&eacute;rage : comment vous retrouver lorsque vous quittez d&rsquo;un point A &agrave; un point B ; comment revenir &agrave; votre h&ocirc;tel ou maison d&rsquo;h&ocirc;te etc. Il est important de savoir o&ugrave; vous marcher et comment vous marcher, conna&icirc;tre les lieux aux alentours, les noms des caf&eacute;s&hellip;</span></p>\r\n<ol>\r\n<li style=\"font-weight: 400;\" aria-level=\"1\"><span style=\"font-weight: 400;\">Etre ouvert d&rsquo;esprit</span></li>\r\n</ol>\r\n<p><span style=\"font-weight: 400;\">Sachez faire la diff&eacute;rence entre ce que vous voyez et ce qui vous semble politiquement correcte, rebutant ou choquant car les actions pos&eacute;es ont des significations diff&eacute;rentes selon le pays o&ugrave; elles ont lieu.&nbsp;&nbsp;</span></p>\r\n<ol>\r\n<li style=\"font-weight: 400;\" aria-level=\"1\"><span style=\"font-weight: 400;\">Conna&icirc;tre le code vestimentaire du pays h&ocirc;te.</span></li>\r\n</ol>\r\n<p><span style=\"font-weight: 400;\">Il est des pays o&ugrave; le port du short est interdit pour entrer &agrave; l&rsquo;a&eacute;roport, pour se rendre dans certains lieux.&nbsp; Avant de d&eacute;cider de faire votre valise, renseignez vous sur le pays dans lequel vous vous rendez, cela &eacute;vitera des surprises d&eacute;sobligeantes.</span></p>\r\n<ol>\r\n<li style=\"font-weight: 400;\" aria-level=\"1\"><span style=\"font-weight: 400;\">Conna&icirc;tre les r&egrave;gles du pays h&ocirc;te.</span></li>\r\n</ol>\r\n<p><span style=\"font-weight: 400;\">Certains pays ont des r&egrave;gles de biens&eacute;ance, de savoir vivre et bien qu&rsquo;ils soient au courant que le tourisme fait partie de leur politique, ils restent bien moins r&eacute;ceptifs &agrave; ceux qui abusent sous pr&eacute;texte qu&rsquo;ils sont touristes. Effectivement, &ecirc;tre touriste c&rsquo;est se comporter comme un touriste mais avant tout respecter le pays hospitalier.&nbsp; Ex : une personne qui se rend dans un lieu saint mal v&ecirc;tu ou qui d&eacute;cide de cracher par terre peut faire face &agrave; des sanctions.</span></p>\r\n<ol>\r\n<li style=\"font-weight: 400;\" aria-level=\"1\"><span style=\"font-weight: 400;\">Conna&icirc;tre ses droits</span></li>\r\n</ol>\r\n<p><span style=\"font-weight: 400;\">En tant que touriste &eacute;tranger, il est important de conna&icirc;tre ses droits mais surtout de conna&icirc;tre ceux qui s&rsquo;appliquent au pays que nous d&eacute;cidons de d&eacute;couvrir.</span></p>\r\n<ol>\r\n<li style=\"font-weight: 400;\" aria-level=\"1\"><span style=\"font-weight: 400;\">Conna&icirc;tre les us et coutumes dudit pays.</span></li>\r\n</ol>\r\n<p><span style=\"font-weight: 400;\">Visiter un pays c&rsquo;est savoir ce &agrave; quoi l&rsquo;on s&rsquo;expose et c&rsquo;est &eacute;viter d&rsquo;attirer les mauvais regards sur nous. De ce fait, il est important de savoir ce qui est raisonnable ou non aupr&egrave;s des autochtones. Il se pourrait que vous arriviez dans un pays et que vous ne traverserez m&ecirc;me pas la fronti&egrave;re &agrave; cause d&rsquo;un petit d&eacute;tail que vous ignoriez.</span></p>\r\n<ol>\r\n<li style=\"font-weight: 400;\" aria-level=\"1\"><span style=\"font-weight: 400;\">Conna&icirc;tre la langue parl&eacute;e dans le pays et les d&eacute;riv&eacute;es.</span></li>\r\n</ol>\r\n<p><span style=\"font-weight: 400;\">De nos jours, nous n&rsquo;avons plus besoin de parler couramment la langue d&rsquo;un pays quelconque car le digital gr&acirc;ce &agrave; son expansion nous aide bien &agrave; ce niveau. Ceci dit, il est important de savoir quelle langue est parl&eacute;e ainsi que ses d&eacute;riv&eacute;es et en retenir quelques mots fondamentaux afin de ne pas se retrouver l&eacute;ser.</span></p>\r\n<ol>\r\n<li style=\"font-weight: 400;\" aria-level=\"1\"><span style=\"font-weight: 400;\">Avoir un bon GPS et une bonne carte.</span></li>\r\n</ol>\r\n<p><span style=\"font-weight: 400;\">A l&rsquo;&egrave;re du Digital la connexion est de rigueur. Vous pouvez cependant, vous retrouver &agrave; court de batteries dans des zones o&ugrave; la fibre ne passe pas bien sinon pas du tout, &agrave; ce moment il faudrait que vous ayez sur vous une carte manuscrite afin de bien vous orienter.</span></p>\r\n<ol>\r\n<li style=\"font-weight: 400;\" aria-level=\"1\">\r\n<h3><span style=\"font-weight: 400;\">Se renseigner aupr&egrave;s des agences de tourisme sur les endroits &agrave; visiter</span></h3>\r\n</li>\r\n</ol>\r\n<h3><span style=\"font-weight: 400;\">Si vous visitez un pays, apprenez &agrave; vous rendre dans des agences de tourisme car elles poss&egrave;dent des listes v&eacute;rifi&eacute;es et reconnues par l\'&Eacute;tat sur les diff&eacute;rents lieux qu&rsquo;il est possible de visiter en toute s&eacute;curit&eacute;.</span></h3>\r\n<ol>\r\n<li style=\"font-weight: 400;\" aria-level=\"1\">\r\n<h3><span style=\"font-weight: 400;\">Conna&icirc;tre o&ugrave; est situ&eacute;e son ambassade.</span></h3>\r\n</li>\r\n</ol>\r\n<p><span style=\"font-weight: 400;\">Il est tr&egrave;s important de savoir o&ugrave; se situe votre ambassade dans un pays quelle que soit la dur&eacute;e de votre s&eacute;jour car l&rsquo;ambassade repr&eacute;sente pour vous une assurance quant &agrave; votre retour dans votre pays d&rsquo;origine en cas de litige.</span></p>\r\n<ol>\r\n<li style=\"font-weight: 400;\" aria-level=\"1\">\r\n<h3><span style=\"font-weight: 400;\">Savoir quels sont les endroits &agrave; &eacute;viter.</span></h3>\r\n</li>\r\n</ol>\r\n<p><span style=\"font-weight: 400;\">Si vous avez d&eacute;j&agrave; envisag&eacute; d&rsquo;effectuer un voyage, vous vous &ecirc;tes s&ucirc;rement ru&eacute;s sur les avis des internautes et sur les diff&eacute;rents &laquo; on dit &raquo;. Et bien, vous avez raison car quoi de plus naturel que de savoir o&ugrave; nous mettons les pieds ? Si vous avez l&rsquo;habitude de vous laissez guider par le vent, sachez qu&rsquo;il y a des endroits dans chaque pays o&ugrave; il est dangereux de mettre les pieds na&iuml;vement et le fait d&rsquo;&ecirc;tre touriste ne vous exemptera pas.</span></p>\r\n<ol>\r\n<li style=\"font-weight: 400;\" aria-level=\"1\">\r\n<h3><span style=\"font-weight: 400;\">Conna&icirc;tre les appartenances du pays (racisme, religion, tol&eacute;rance).</span></h3>\r\n</li>\r\n</ol>\r\n<p><span style=\"font-weight: 400;\">Il existe des pays o&ugrave; le racisme est pr&eacute;sent mais camoufl&eacute; comme d\'autres o&ugrave; il est clairement perceptible. Il est important d&rsquo;apprendre &agrave; regarder au-del&agrave; de cela mais il est aussi fortement conseill&eacute; de ne pas prendre cela &agrave; la l&eacute;g&egrave;re et de savoir s&rsquo;il est vraiment n&eacute;cessaire de s&rsquo;y rendre. De m&ecirc;me que pour la religion il faut savoir quelles sont leurs croyances et si vous avez le droit de manifester la v&ocirc;tre.</span></p>\r\n<ol>\r\n<li style=\"font-weight: 400;\" aria-level=\"1\"><span style=\"font-weight: 400;\">Avoir des esp&egrave;ces sur soi</span></li>\r\n</ol>\r\n<p><span style=\"font-weight: 400;\">Vous ne pouvez voyager et faire confiance &agrave; votre carte bleue. Ayez des billets de monnaie locales sur vous pour ne pas vous retrouver dans un impr&eacute;vu et ne pas pouvoir g&eacute;rer. Ayez une monnaie passe partout &eacute;galement en cas de d&eacute;part pr&eacute;cipit&eacute;.</span></p>\r\n<ol>\r\n<li style=\"font-weight: 400;\" aria-level=\"1\"><span style=\"font-weight: 400;\">Conna&icirc;tre le commissariat ou l&rsquo;h&ocirc;pital le plus proche.</span></li>\r\n</ol>\r\n<p><span style=\"font-weight: 400;\">Si vous savez o&ugrave; vous &ecirc;tes (h&ocirc;tel), vous devriez savoir quels sont les services les plus pratiques dont vous aurez besoin en cas d&rsquo;urgence, de plaintes ou de forces majeures.</span></p>\r\n<ol>\r\n<li style=\"font-weight: 400;\" aria-level=\"1\"><span style=\"font-weight: 400;\">Conna&icirc;tre ses allergies ou intol&eacute;rances.</span></li>\r\n</ol>\r\n<p><span style=\"font-weight: 400;\">Il est important de faire un test allergologique avant de voyager car le corps humain &eacute;volue et d&eacute;veloppe de nouvelles facettes constamment. Vous pouvez r&eacute;sider dans un pays ou le pollen n&rsquo;existe pas, faire une allergie au pollen en arrivant dans votre pays de visite et ne pas savoir comment r&eacute;agir.</span></p>\r\n<ol>\r\n<li style=\"font-weight: 400;\" aria-level=\"1\"><span style=\"font-weight: 400;\">Pr&eacute;voir une trousse &agrave; pharmacie.</span></li>\r\n</ol>\r\n<p><span style=\"font-weight: 400;\">Si vous voyagez, vous devez pr&eacute;voir une trousse &agrave; pharmacie car vous pourrez &ecirc;tre confront&eacute;s &agrave; une situation improbable et ne pas pouvoir obtenir de l&rsquo;aide de suite (quelqu&rsquo;un pour se rendre en pharmacie ou vous obtenir le m&eacute;dicament ad&eacute;quat dans votre h&ocirc;tel ou en zone retir&eacute;e). Il est pr&eacute;f&eacute;rable de conna&icirc;tre son corps, de savoir o&ugrave; on se rend et de se pr&eacute;parer en condition.</span></p>\r\n<ol>\r\n<li style=\"font-weight: 400;\" aria-level=\"1\"><span style=\"font-weight: 400;\">Avoir des appareils fiables, efficaces et durables en autonomie.</span></li>\r\n</ol>\r\n<p><span style=\"font-weight: 400;\">Voyager c&rsquo;est se pr&eacute;parer en tout et de nos jours un bon voyage c&rsquo;est aussi de bons appareils avec une bonne autonomie pour capturer des moments inoubliables.</span></p>\r\n<ol>\r\n<li style=\"font-weight: 400;\" aria-level=\"1\"><span style=\"font-weight: 400;\">Avoir du savoir vivre</span></li>\r\n</ol>\r\n<p><span style=\"font-weight: 400;\">Lorsque vous voyagez seul, oubliez le &laquo; moi je &raquo; fonctionnez plut&ocirc;t en &laquo; ah oui ? Pourquoi pas ?&raquo; car voyager c&rsquo;est se d&eacute;couvrir et pour le faire, il faut parfois oublier qui nous sommes et comment nous fonctionnons la plupart du temps.</span></p>\r\n<ol>\r\n<li style=\"font-weight: 400;\" aria-level=\"1\"><span style=\"font-weight: 400;\">Savoir tenir sa langue/ prudence</span></li>\r\n</ol>\r\n<p><span style=\"font-weight: 400;\">Si vous voyagez en solo, il faut apprendre &agrave; tenir votre langue. L&rsquo;objectif est de vous amuser faire des rencontres, des d&eacute;couvertes et pas vous retrouver dans des conflits ou incompr&eacute;hensions &agrave; cause de vos dires qui j&rsquo;en suis s&ucirc;re ne partaient pas d&rsquo;une mauvaise intention.</span></p>\r\n<ol>\r\n<li style=\"font-weight: 400;\" aria-level=\"1\"><span style=\"font-weight: 400;\">Savoir respecter l&rsquo;environnement</span></li>\r\n</ol>\r\n<p><span style=\"font-weight: 400;\">Apprenez &agrave; respecter l&rsquo;environnement et vivre au rythme du lieu que vous visitez. Ceci est tr&egrave;s important, cela montrera votre implication pour un environnement durable.</span></p>\r\n<ol>\r\n<li style=\"font-weight: 400;\" aria-level=\"1\"><span style=\"font-weight: 400;\">Avoir ses Vaccins &agrave; jour.</span></li>\r\n</ol>\r\n<p><span style=\"font-weight: 400;\">Renseignez vous sur les maladies qui courent dans le pays o&ugrave; vous allez et mettez &agrave; jour vos vaccins s&rsquo;il y a lieu car ce serait dommage de commencer sinon finir votre s&eacute;jour aux urgences.</span></p>\r\n<ol>\r\n<li style=\"font-weight: 400;\" aria-level=\"1\"><span style=\"font-weight: 400;\">Ma&icirc;triser le droit international</span></li>\r\n</ol>\r\n<p><span style=\"font-weight: 400;\">Ma&icirc;triser le droit international et les &eacute;changes qui lient votre pays d&rsquo;origine &agrave; votre pays de visite pourra vous aider durant vos diff&eacute;rents d&eacute;placements ou autres. Il est tr&egrave;s important de savoir ce que le droit international vous autorise ou pas &agrave; faire.</span></p>\r\n<ol>\r\n<li style=\"font-weight: 400;\" aria-level=\"1\"><span style=\"font-weight: 400;\">Savoir sympathiser</span></li>\r\n</ol>\r\n<p><span style=\"font-weight: 400;\">R&eacute;ussir son voyage solo c&rsquo;est savoir faire de belles rencontres le temps d&rsquo;une vir&eacute;e, d&rsquo;un &eacute;v&egrave;nement ou d&rsquo;un repas.</span></p>\r\n<ol>\r\n<li style=\"font-weight: 400;\" aria-level=\"1\"><span style=\"font-weight: 400;\">Savoir donner des nouvelles &agrave; son entourage</span></li>\r\n</ol>\r\n<p><span style=\"font-weight: 400;\">&Ecirc;tre solitaire ne signifie pas &ecirc;tre imprudent. Lorsque vous faites une activit&eacute;, vous vous d&eacute;placez ou vous quittez la ville source pour des coins plus retir&eacute;s, sachez pr&eacute;venir vos proches, donnez leur de vos nouvelles car on ne sait jamais. &Ecirc;tre joignable c&rsquo;est la base car vous n&rsquo;&ecirc;tes pas seuls.</span></p>\r\n<ol>\r\n<li style=\"font-weight: 400;\" aria-level=\"1\"><span style=\"font-weight: 400;\">Tracer son itin&eacute;raire.</span></li>\r\n</ol>\r\n<p><span style=\"font-weight: 400;\">Afin de ne pas vous perdre et au final ne pas pouvoir tout faire, il est mieux de pr&eacute;parer votre itin&eacute;raire. Savoir par exemple quelles sont les activit&eacute;s qui se situent dans un m&ecirc;me p&eacute;rim&egrave;tre, la faisabilit&eacute;&hellip;</span></p>\r\n<ol>\r\n<li style=\"font-weight: 400;\" aria-level=\"1\"><span style=\"font-weight: 400;\">Savoir s&rsquo;organiser</span></li>\r\n</ol>\r\n<p><span style=\"font-weight: 400;\">L&rsquo;organisation c&rsquo;est la base. Un temps de repos, un temps pour soi, un temps pour s&rsquo;amuser, un temps pour visiter.&nbsp; Gr&acirc;ce &agrave; une bonne organisation, on passe de meilleurs moments.</span></p>\r\n<ol>\r\n<li style=\"font-weight: 400;\" aria-level=\"1\"><span style=\"font-weight: 400;\">Pr&eacute;parer une bonne Playlist</span></li>\r\n</ol>\r\n<p><span style=\"font-weight: 400;\">S&eacute;lectionnez les chansons qui vous font du bien, celles qui vous permettent de dormir et celles qui vous redonnent de l&rsquo;&eacute;nergie. Une bonne playlist c&rsquo;est une meilleure ambiance, une meilleure ouverture et de la bonne humeur.</span></p>\r\n<ol>\r\n<li style=\"font-weight: 400;\" aria-level=\"1\"><span style=\"font-weight: 400;\">Prendre le temps de bien se reposer</span></li>\r\n</ol>\r\n<p><span style=\"font-weight: 400;\">N&rsquo;oubliez pas de vous reposer. Il est important de se reposer pour mieux passer ses activit&eacute;s, tenir la journ&eacute;e ou supporter les humeurs des personnes autour ainsi que les difficult&eacute;s.&nbsp;</span></p>\r\n<p><span style=\"font-weight: 400;\">Soyez vous-m&ecirc;me ! Rentacs vous donne les astuces et les conseils pour ne pas vous retrouver dans des situations d&eacute;sobligeantes mais les bonnes situations les meilleures souvenirs et les rencontres que vous ferez, celles que vous d&eacute;ciderez de faire perdurer, celles en qui vous ferez confiance durant votre p&eacute;riple ne d&eacute;pendra que de vous m&ecirc;me.</span></p>\r\n<p><span style=\"font-weight: 400;\">La meilleure astuce que notre &eacute;quipe puisse vous donner c&rsquo;est de respirer un grand coup, mettre en avant votre personnalit&eacute; et vous laisser guider selon vos aspirations, vos passions et selon ce qui vous fait envie. Soyez vous m&ecirc;me car c&rsquo;est le restant que vous vous d&eacute;couvrirez encore plus, que vous en sortirez grandi et vous pourriez &ecirc;tre &eacute;tonn&eacute; de d&eacute;couvrir en vous des talents, des ma&icirc;trises de soi ou des actions inconnues sinon improbables jusqu\'&agrave; lors.</span></p>\r\n<p><span style=\"font-weight: 400;\">Surtout ne l&rsquo;oubliez pas c&rsquo;est en voyageant seul que l&rsquo;on apprend &agrave; savoir qui nous sommes, ce que nous tol&eacute;rons, ce que nous respectons et jusqu&rsquo;o&ugrave; nous sommes capable de nous d&eacute;passer. Voyagez, voyagez, voyagez car chaque voyage est une nouvelle occasion de se d&eacute;couvrir, de s&rsquo;&eacute;vader et de faire le plein pour l&rsquo;ann&eacute;e en cours, qu&rsquo;il s&rsquo;agisse des cours, du travail ou d&rsquo;une activit&eacute; qui n&eacute;cessite de se d&eacute;penser quotidiennement sans grande possibilit&eacute; d&rsquo;&eacute;panouissement, de d&eacute;couvertes et surtout d&rsquo;a&eacute;ration de l&rsquo;intellect.</span></p>'),
(19, 28, 'fr', 'Voyage en Solo: 30 astuces et conseils pour voyager seul', '<p><span style=\"font-weight: 400;\">&laquo; Un c&oelig;ur solitaire doit &ecirc;tre un c&oelig;ur plein, il est si plein qu&rsquo;il d&eacute;bordera pour se pr&eacute;cipiter, et il est si impatient que quelqu&rsquo;un lui fasse &eacute;cho, le re&ccedil;oive et le comprenne &raquo; Shi Tiesheng.</span></p>\r\n<p><span style=\"font-weight: 400;\">Voyager et prendre le temps de respirer un air nouveau, quelle puret&eacute;! Parcourir les dunes, les sables, les mers et m&ecirc;me les oc&eacute;ans, quel r&eacute;gal pour l&rsquo;&acirc;me! Savez-vous ce qu&rsquo;est r&eacute;ellement voyager ?</span></p>\r\n<p><span style=\"font-weight: 400;\">Voyager c&rsquo;est vivre chaque jour diff&eacute;remment, c&rsquo;est d&eacute;cider de faire quelque chose qui n&rsquo;a rien &agrave; voir avec notre quotidien, et c&rsquo;est d&eacute;cider de d&eacute;couvrir de nouveaux horizons, une nouvelle culture, un nouveau monde et bien s&ucirc;r, c&rsquo;est se r&eacute;galer autrement.</span></p>\r\n<p><span style=\"font-weight: 400;\">&laquo; Les personnes qui peuvent se parler ne se sentiront jamais seules &raquo; Maxwell Marz</span></p>\r\n<p><span style=\"font-weight: 400;\">C&rsquo;est bien de cela dont il est question : &laquo; savoir vivre sans le m&ecirc;me autrui et sans les m&ecirc;mes actions du quotidien qui remplissent notre vie. &raquo;. Voyager c&rsquo;est conna&icirc;tre et comprendre le monde qui nous entoure un peu plus et c&rsquo;est apprendre chaque jour quelque chose d&rsquo;inconnu. Mais comment faire lorsqu&rsquo;on veut voyager ? Comment r&eacute;ussir &agrave; vivre pleinement son voyage en communiquant sans &ecirc;tre accompagn&eacute; par un proche ou une connaissance ? Que faut-il faire, que faut-il dire et surtout comment faut-il se comporter ?</span></p>\r\n<p><span style=\"font-weight: 400;\">Rentacs Tours conna&icirc;t plusieurs rouages pour aider &agrave; mieux vivre votre voyage en solo. Voyager ne consiste pas seulement &agrave; d&eacute;cider de la destination que vous souhaitez visiter, il faut une bonne planification pour que votre voyage r&eacute;ussisse. Pour pouvez d&eacute;couvrir ici quelques &eacute;tapes incontournables pour bien pr&eacute;parer votre voyage. Dans cet article, Rentacs Tours a s&eacute;lectionn&eacute; pour vous 30 astuces que l&rsquo;on a souvent tendance &agrave; oublier mais qui vous aideront &agrave; mieux vivre votre voyage en solo.</span></p>\r\n<h3><strong>1 . Avoir ses papiers</strong></h3>\r\n<p><span style=\"font-weight: 400;\">Carte d&rsquo;identit&eacute;, passeport, permis de conduire&hellip; Voyager c&rsquo;est d&rsquo;abord pouvoir se pr&eacute;senter, &ecirc;tre identifiable et surtout &ecirc;tre r&eacute;pertori&eacute;. Vous ne pourrez effectuer aucun voyage sans papier. Vous risquerez de ne m&ecirc;me pas traverser le portique de s&eacute;curit&eacute;. Si vous devez faire le trajet en sens inverse &agrave; cause de l&rsquo;oubli d&rsquo;un de vos documents administratifs, vous pourrez rater votre vol et&nbsp; donc perdre en temps et en finance. Ne vous faites pas avoir ! R&eacute;fl&eacute;chissez &agrave; votre destination et pensez TOUJOURS &agrave; prendre d&rsquo;abord vos documents administratifs.</span></p>\r\n<h3><strong>2 . Savoir se rep&eacute;rer</strong></h3>\r\n<p><span style=\"font-weight: 400;\">Lorsque vous voyagez seul, vous avez doublement conscience des risques que vous prenez et vos sens sont bien plus aiguis&eacute;s. Voyager seul est un excellent moyen de faire travailler votre sens du rep&eacute;rage : comment vous retrouver lorsque vous quittez d&rsquo;un point A &agrave; un point B ; comment revenir &agrave; votre h&ocirc;tel ou maison d&rsquo;h&ocirc;te etc. Il est important de savoir o&ugrave; vous marcher et comment vous marcher, conna&icirc;tre les lieux aux alentours, les noms des caf&eacute;s&hellip;</span></p>\r\n<h3><strong>3 . Etre ouvert d&rsquo;esprit</strong></h3>\r\n<p><span style=\"font-weight: 400;\">Sachez faire la diff&eacute;rence entre ce que vous voyez et ce qui vous semble politiquement correcte, rebutant ou choquant car les actions pos&eacute;es ont des significations diff&eacute;rentes selon le pays o&ugrave; elles ont lieu.&nbsp;&nbsp;</span></p>\r\n<h3><strong>4 . Conna&icirc;tre le code vestimentaire du pays h&ocirc;te.</strong></h3>\r\n<p><span style=\"font-weight: 400;\">Il est des pays o&ugrave; le port du short est interdit pour entrer &agrave; l&rsquo;a&eacute;roport, pour se rendre dans certains lieux.&nbsp; Avant de d&eacute;cider de faire votre valise, renseignez vous sur le pays dans lequel vous vous rendez, cela &eacute;vitera des surprises d&eacute;sobligeantes.</span></p>\r\n<h3><strong>5 . Conna&icirc;tre les r&egrave;gles du pays h&ocirc;te.</strong></h3>\r\n<p><span style=\"font-weight: 400;\">Certains pays ont des r&egrave;gles de biens&eacute;ance, de savoir vivre et bien qu&rsquo;ils soient au courant que le tourisme fait partie de leur politique, ils restent bien moins r&eacute;ceptifs &agrave; ceux qui abusent sous pr&eacute;texte qu&rsquo;ils sont touristes. Effectivement, &ecirc;tre touriste c&rsquo;est se comporter comme un touriste mais avant tout respecter le pays hospitalier.&nbsp; Ex : une personne qui se rend dans un lieu saint mal v&ecirc;tu ou qui d&eacute;cide de cracher par terre peut faire face &agrave; des sanctions.</span></p>\r\n<h3><strong>6 . Conna&icirc;tre ses droits</strong></h3>\r\n<p><span style=\"font-weight: 400;\">En tant que touriste &eacute;tranger, il est important de conna&icirc;tre ses droits mais surtout de conna&icirc;tre ceux qui s&rsquo;appliquent au pays que nous d&eacute;cidons de d&eacute;couvrir.</span></p>\r\n<h3><strong>7 . Conna&icirc;tre les us et coutumes dudit pays.</strong></h3>\r\n<p><span style=\"font-weight: 400;\">Visiter un pays c&rsquo;est savoir ce &agrave; quoi l&rsquo;on s&rsquo;expose et c&rsquo;est &eacute;viter d&rsquo;attirer les mauvais regards sur nous. De ce fait, il est important de savoir ce qui est raisonnable ou non aupr&egrave;s des autochtones. Il se pourrait que vous arriviez dans un pays et que vous ne traverserez m&ecirc;me pas la fronti&egrave;re &agrave; cause d&rsquo;un petit d&eacute;tail que vous ignoriez.</span></p>\r\n<h3><strong>8 . Conna&icirc;tre la langue parl&eacute;e dans le pays et les d&eacute;riv&eacute;es.</strong></h3>\r\n<p><span style=\"font-weight: 400;\">De nos jours, nous n&rsquo;avons plus besoin de parler couramment la langue d&rsquo;un pays quelconque car le digital gr&acirc;ce &agrave; son expansion nous aide bien &agrave; ce niveau. Ceci dit, il est important de savoir quelle langue est parl&eacute;e ainsi que ses d&eacute;riv&eacute;es et en retenir quelques mots fondamentaux afin de ne pas se retrouver l&eacute;ser.</span></p>\r\n<h3><strong>9 . Avoir un bon GPS et une bonne carte.</strong></h3>\r\n<p><span style=\"font-weight: 400;\">A l&rsquo;&egrave;re du Digital la connexion est de rigueur. Vous pouvez cependant, vous retrouver &agrave; court de batteries dans des zones o&ugrave; la fibre ne passe pas bien sinon pas du tout, &agrave; ce moment il faudrait que vous ayez sur vous une carte manuscrite afin de bien vous orienter.</span></p>\r\n<h3><strong>10 . Se renseigner aupr&egrave;s des agences de tourisme sur les endroits &agrave; visiter</strong></h3>\r\n<p>Si vous visitez un pays, apprenez &agrave; vous rendre dans des agences de tourisme car elles poss&egrave;dent des listes v&eacute;rifi&eacute;es et reconnues par l\'&Eacute;tat sur les diff&eacute;rents lieux qu&rsquo;il est possible de visiter en toute s&eacute;curit&eacute;.</p>\r\n<h3><strong>11 . Conna&icirc;tre o&ugrave; est situ&eacute;e son ambassade.</strong></h3>\r\n<p><span style=\"font-weight: 400;\">Il est tr&egrave;s important de savoir o&ugrave; se situe votre ambassade dans un pays quelle que soit la dur&eacute;e de votre s&eacute;jour car l&rsquo;ambassade repr&eacute;sente pour vous une assurance quant &agrave; votre retour dans votre pays d&rsquo;origine en cas de litige.</span></p>\r\n<h3><strong>12 . Savoir quels sont les endroits &agrave; &eacute;viter.</strong></h3>\r\n<p><span style=\"font-weight: 400;\">Si vous avez d&eacute;j&agrave; envisag&eacute; d&rsquo;effectuer un voyage, vous vous &ecirc;tes s&ucirc;rement ru&eacute;s sur les avis des internautes et sur les diff&eacute;rents &laquo; on dit &raquo;. Et bien, vous avez raison car quoi de plus naturel que de savoir o&ugrave; nous mettons les pieds ? Si vous avez l&rsquo;habitude de vous laissez guider par le vent, sachez qu&rsquo;il y a des endroits dans chaque pays o&ugrave; il est dangereux de mettre les pieds na&iuml;vement et le fait d&rsquo;&ecirc;tre touriste ne vous exemptera pas.</span></p>\r\n<h3><strong>13 . Conna&icirc;tre les appartenances du pays (racisme, religion, tol&eacute;rance).</strong></h3>\r\n<p><span style=\"font-weight: 400;\">Il existe des pays o&ugrave; le racisme est pr&eacute;sent mais camoufl&eacute; comme d\'autres o&ugrave; il est clairement perceptible. Il est important d&rsquo;apprendre &agrave; regarder au-del&agrave; de cela mais il est aussi fortement conseill&eacute; de ne pas prendre cela &agrave; la l&eacute;g&egrave;re et de savoir s&rsquo;il est vraiment n&eacute;cessaire de s&rsquo;y rendre. De m&ecirc;me que pour la religion il faut savoir quelles sont leurs croyances et si vous avez le droit de manifester la v&ocirc;tre.</span></p>\r\n<h3><strong>14 . Avoir des esp&egrave;ces sur soi</strong></h3>\r\n<p><span style=\"font-weight: 400;\">Vous ne pouvez voyager et faire confiance &agrave; votre carte bleue. Ayez des billets de monnaie locales sur vous pour ne pas vous retrouver dans un impr&eacute;vu et ne pas pouvoir g&eacute;rer. Ayez une monnaie passe partout &eacute;galement en cas de d&eacute;part pr&eacute;cipit&eacute;.</span></p>\r\n<h3><strong>15 . Conna&icirc;tre le commissariat ou l&rsquo;h&ocirc;pital le plus proche.</strong></h3>\r\n<p><span style=\"font-weight: 400;\">Si vous savez o&ugrave; vous &ecirc;tes (h&ocirc;tel), vous devriez savoir quels sont les services les plus pratiques dont vous aurez besoin en cas d&rsquo;urgence, de plaintes ou de forces majeures.</span></p>\r\n<h3><strong>16 . Conna&icirc;tre ses allergies ou intol&eacute;rances.</strong></h3>\r\n<p><span style=\"font-weight: 400;\">Il est important de faire un test allergologique avant de voyager car le corps humain &eacute;volue et d&eacute;veloppe de nouvelles facettes constamment. Vous pouvez r&eacute;sider dans un pays ou le pollen n&rsquo;existe pas, faire une allergie au pollen en arrivant dans votre pays de visite et ne pas savoir comment r&eacute;agir.</span></p>\r\n<h3><strong>17 . Pr&eacute;voir une trousse &agrave; pharmacie.</strong></h3>\r\n<p><span style=\"font-weight: 400;\">Si vous voyagez, vous devez pr&eacute;voir une trousse &agrave; pharmacie car vous pourrez &ecirc;tre confront&eacute;s &agrave; une situation improbable et ne pas pouvoir obtenir de l&rsquo;aide de suite (quelqu&rsquo;un pour se rendre en pharmacie ou vous obtenir le m&eacute;dicament ad&eacute;quat dans votre h&ocirc;tel ou en zone retir&eacute;e). Il est pr&eacute;f&eacute;rable de conna&icirc;tre son corps, de savoir o&ugrave; on se rend et de se pr&eacute;parer en condition.</span></p>\r\n<h3><strong>18 . Avoir des appareils fiables, efficaces et durables en autonomie.</strong></h3>\r\n<p><span style=\"font-weight: 400;\">Voyager c&rsquo;est se pr&eacute;parer en tout et de nos jours un bon voyage c&rsquo;est aussi de bons appareils avec une bonne autonomie pour capturer des moments inoubliables.</span></p>\r\n<h3><strong>19 . Avoir du savoir vivre</strong></h3>\r\n<p><span style=\"font-weight: 400;\">Lorsque vous voyagez seul, oubliez le &laquo; moi je &raquo; fonctionnez plut&ocirc;t en &laquo; ah oui ? Pourquoi pas ?&raquo; car voyager c&rsquo;est se d&eacute;couvrir et pour le faire, il faut parfois oublier qui nous sommes et comment nous fonctionnons la plupart du temps.</span></p>\r\n<h3><strong>20 . Savoir tenir sa langue/ prudence</strong></h3>\r\n<p><span style=\"font-weight: 400;\">Si vous voyagez en solo, il faut apprendre &agrave; tenir votre langue. L&rsquo;objectif est de vous amuser faire des rencontres, des d&eacute;couvertes et pas vous retrouver dans des conflits ou incompr&eacute;hensions &agrave; cause de vos dires qui j&rsquo;en suis s&ucirc;re ne partaient pas d&rsquo;une mauvaise intention.</span></p>\r\n<h3><strong>21 . Savoir respecter l&rsquo;environnement</strong></h3>\r\n<p><span style=\"font-weight: 400;\">Apprenez &agrave; respecter l&rsquo;environnement et vivre au rythme du lieu que vous visitez. Ceci est tr&egrave;s important, cela montrera votre implication pour un environnement durable.</span></p>\r\n<h3><strong>22 . Avoir ses Vaccins &agrave; jour.</strong></h3>\r\n<p><span style=\"font-weight: 400;\">Renseignez vous sur les maladies qui courent dans le pays o&ugrave; vous allez et mettez &agrave; jour vos vaccins s&rsquo;il y a lieu car ce serait dommage de commencer sinon finir votre s&eacute;jour aux urgences.</span></p>\r\n<h3><strong>23 . Ma&icirc;triser le droit international</strong></h3>\r\n<p><span style=\"font-weight: 400;\">Ma&icirc;triser le droit international et les &eacute;changes qui lient votre pays d&rsquo;origine &agrave; votre pays de visite pourra vous aider durant vos diff&eacute;rents d&eacute;placements ou autres. Il est tr&egrave;s important de savoir ce que le droit international vous autorise ou pas &agrave; faire.</span></p>\r\n<h3><strong>24 . Savoir sympathiser</strong></h3>\r\n<p><span style=\"font-weight: 400;\">R&eacute;ussir son voyage solo c&rsquo;est savoir faire de belles rencontres le temps d&rsquo;une vir&eacute;e, d&rsquo;un &eacute;v&egrave;nement ou d&rsquo;un repas.</span></p>\r\n<h3><strong>25 . Savoir donner des nouvelles &agrave; son entourage</strong></h3>\r\n<p><span style=\"font-weight: 400;\">&Ecirc;tre solitaire ne signifie pas &ecirc;tre imprudent. Lorsque vous faites une activit&eacute;, vous vous d&eacute;placez ou vous quittez la ville source pour des coins plus retir&eacute;s, sachez pr&eacute;venir vos proches, donnez leur de vos nouvelles car on ne sait jamais. &Ecirc;tre joignable c&rsquo;est la base car vous n&rsquo;&ecirc;tes pas seuls.</span></p>\r\n<h3><strong>26 . Tracer son itin&eacute;raire.</strong></h3>\r\n<p><span style=\"font-weight: 400;\">Afin de ne pas vous perdre et au final ne pas pouvoir tout faire, il est mieux de pr&eacute;parer votre itin&eacute;raire. Savoir par exemple quelles sont les activit&eacute;s qui se situent dans un m&ecirc;me p&eacute;rim&egrave;tre, la faisabilit&eacute;&hellip;</span></p>\r\n<h3><strong>27 . Savoir s&rsquo;organiser</strong></h3>\r\n<p><span style=\"font-weight: 400;\">L&rsquo;organisation c&rsquo;est la base. Un temps de repos, un temps pour soi, un temps pour s&rsquo;amuser, un temps pour visiter.&nbsp; Gr&acirc;ce &agrave; une bonne organisation, on passe de meilleurs moments.</span></p>\r\n<h3><strong>28 . Pr&eacute;parer une bonne Playlist</strong></h3>\r\n<p><span style=\"font-weight: 400;\">S&eacute;lectionnez les chansons qui vous font du bien, celles qui vous permettent de dormir et celles qui vous redonnent de l&rsquo;&eacute;nergie. Une bonne playlist c&rsquo;est une meilleure ambiance, une meilleure ouverture et de la bonne humeur.</span></p>\r\n<h3><strong>29 . Prendre le temps de bien se reposer</strong></h3>\r\n<p><span style=\"font-weight: 400;\">N&rsquo;oubliez pas de vous reposer. Il est important de se reposer pour mieux passer ses activit&eacute;s, tenir la journ&eacute;e ou supporter les humeurs des personnes autour ainsi que les difficult&eacute;s.&nbsp;</span></p>\r\n<p><span style=\"font-weight: 400;\">Soyez vous-m&ecirc;me ! Rentacs vous donne les astuces et les conseils pour ne pas vous retrouver dans des situations d&eacute;sobligeantes mais les bonnes situations les meilleures souvenirs et les rencontres que vous ferez, celles que vous d&eacute;ciderez de faire perdurer, celles en qui vous ferez confiance durant votre p&eacute;riple ne d&eacute;pendra que de vous m&ecirc;me.</span></p>\r\n<p><span style=\"font-weight: 400;\">La meilleure astuce que notre &eacute;quipe puisse vous donner c&rsquo;est de respirer un grand coup, mettre en avant votre personnalit&eacute; et vous laisser guider selon vos aspirations, vos passions et selon ce qui vous fait envie. Soyez vous m&ecirc;me car c&rsquo;est le restant que vous vous d&eacute;couvrirez encore plus, que vous en sortirez grandi et vous pourriez &ecirc;tre &eacute;tonn&eacute; de d&eacute;couvrir en vous des talents, des ma&icirc;trises de soi ou des actions inconnues sinon improbables jusqu\'&agrave; lors.</span></p>\r\n<p><span style=\"font-weight: 400;\">Surtout ne l&rsquo;oubliez pas c&rsquo;est en voyageant seul que l&rsquo;on apprend &agrave; savoir qui nous sommes, ce que nous tol&eacute;rons, ce que nous respectons et jusqu&rsquo;o&ugrave; nous sommes capable de nous d&eacute;passer. Voyagez, voyagez, voyagez car chaque voyage est une nouvelle occasion de se d&eacute;couvrir, de s&rsquo;&eacute;vader et de faire le plein pour l&rsquo;ann&eacute;e en cours, qu&rsquo;il s&rsquo;agisse des cours, du travail ou d&rsquo;une activit&eacute; qui n&eacute;cessite de se d&eacute;penser quotidiennement sans grande possibilit&eacute; d&rsquo;&eacute;panouissement, de d&eacute;couvertes et surtout d&rsquo;a&eacute;ration de l&rsquo;intellect.</span></p>'),
(20, 30, 'en', 'Voyage à Agadir, les choses à ne pas rater en 2021', '<p><span style=\"font-weight: 400;\">Commun&eacute;ment appel&eacute;e la ville touristique, Agadir fait partie des villes les plus visit&eacute;es au Maroc. Qu&rsquo;il s&rsquo;agisse des touristes, des r&eacute;sidents au Maroc, ou encore des autochtones, elle reste incontournable lorsqu&rsquo;il s&rsquo;agit des lieux &agrave; ne pas rater durant son s&eacute;jour dans le royaume. De ce fait, quelles sont les choses &agrave; ne pas rater une fois dans la ville d&rsquo;Agadir qui s&rsquo;&eacute;tend sur pr&egrave;s de 2297km2 ?&nbsp; Rentacs Tours vous propose 5 endroits incontournables &agrave; visiter.</span></p>\r\n<p>&nbsp;</p>\r\n<p><strong>Agadir, les incontournables</strong></p>\r\n<ol>\r\n<li>\r\n<h3><span style=\"font-weight: 400;\">Crocoparc Agadir, Jardin botanique et parc animalier.</span></h3>\r\n</li>\r\n</ol>\r\n<p><span style=\"font-weight: 400;\">Crocoparc par son nom nous conduit tout droit dans le monde des crocodiles du Nil avec plus de 325 pensionnaires. Il fut cr&eacute;&eacute; en Mai 2015 afin de pouvoir admirer la beaut&eacute; des crocodiles mais pas qu&rsquo;eux ; il compte aussi en son sein d&rsquo;autres reptiles tels que : des tortues g&eacute;antes, des pythons g&eacute;ants, des iguanes verts, des anacondas et des ouistitis &agrave; pinceaux blancs. Etendu sur une superficie de 4 hectares, vous ne pourrez sortir de ce parc qu&rsquo;avec une connaissance approfondie sur ces reptiles. On n&rsquo;en ressort qu&rsquo;avec des &eacute;toiles plein les yeux et la t&ecirc;te charg&eacute;e de connaissances. Ainsi, Rentacs Tours vous invite &agrave; vous y rendre par curiosit&eacute; ou par fanatisme pour les reptiles, vous ne serez pas d&eacute;&ccedil;u. Il est situ&eacute; en p&eacute;riph&eacute;rie d\'Agadir, sur la commune de Drargua, le long de la route nationale 8 en direction de Marrakech.</span></p>\r\n<ol start=\"2\">\r\n<li>\r\n<h3><span style=\"font-weight: 400;\">Agadir Camel Wide</span><span style=\"font-weight: 400;\"> <br /></span></h3>\r\n</li>\r\n</ol>\r\n<p><span style=\"font-weight: 400;\">Un incontournable en visitant cette ville est de pouvoir se balader &agrave; dos de chameaux que ce soit sur la plage de sable dor&eacute;e ou en escaladant les collines d&rsquo;Agadir Oufella. Cette balade de deux heures (2) vous permettra d&rsquo;admirer cette ville, de voir de haut ses sites spectaculaires et vous fera d&eacute;couvrir les sentiers anciens vous plongeant ainsi dans les traditions marocaines.</span><span style=\"font-weight: 400;\">&nbsp;</span></p>\r\n<ol start=\"3\">\r\n<li>\r\n<h3><span style=\"font-weight: 400;\">Vall&eacute;e du paradis</span></h3>\r\n</li>\r\n</ol>\r\n<p><span style=\"font-weight: 400;\">La vall&eacute;e du paradis a &eacute;t&eacute; rendue c&eacute;l&egrave;bre par une l&eacute;gende populaire affirmant que l&rsquo;eau de la source qui la parcourt aurait des vertus th&eacute;rapeutiques. De cette vall&eacute;e vous aurez droit &agrave; un paysage magnifique qui vous mettra en extase. Pour la vall&eacute;e du paradis, il faudrait pr&eacute;voir une demi-journ&eacute;e car c&rsquo;est sur une longueur de 30 km que s&rsquo;&eacute;tendent ses diff&eacute;rents paysages.</span></p>\r\n<ol start=\"4\">\r\n<li>\r\n<h3><span style=\"font-weight: 400;\">Agadir, Sahara Trip</span></h3>\r\n</li>\r\n</ol>\r\n<p><span style=\"font-weight: 400;\">Gr&acirc;ce &agrave; cette compagnie, le Sahara n&rsquo;aura plus de secret pour vous. Vous commencerez par d&eacute;couvrir Agadir et vous terminerez au beau milieu du d&eacute;sert du Sahara. Une exp&eacute;rience unique que vous n&rsquo;oublierez jamais. Faites-y un tour afin de pouvoir jouir de leur exp&eacute;rience, des meilleurs endroits &agrave; visiter et &agrave; d&eacute;couvrir afin de ne point vous perdre dans vos recherches d&rsquo;activit&eacute;s &agrave; faire durant votre s&eacute;jour &agrave; Agadir.</span></p>\r\n<ol start=\"5\">\r\n<li>\r\n<h3><span style=\"font-weight: 400;\">Inezgane</span></h3>\r\n</li>\r\n</ol>\r\n<p><span style=\"font-weight: 400;\">Cette petite ville mitoyenne d&rsquo;Agadir, dans la vall&eacute;e du Souss, est un circuit commercial compos&eacute; majoritairement de march&eacute;s. Inezgane est sans aucun doute un excellent endroit pour s&rsquo;acheter des souvenirs, faire de bonnes affaires et d&eacute;couvrir un peu plus la culture marocaine.</span></p>\r\n<p><span style=\"font-weight: 400;\">Vous y trouverez de tout ! Des fruits aux bijoux traditionnels berb&egrave;re en passant par des articles en cuir, nous sommes certains que vous ne pourrez vous y rendre et repartir de l&agrave; sans avoir rempli votre sac d&rsquo;objets souvenirs et fait le plein de babioles qui trouveront une place de choix chez vous, au bureau ou encore dans votre routine quotidienne. En plus de cela, vous pourrez visiter le village d&rsquo;Imouzzer des Ida Outanane qui est principalement habit&eacute; par des Berb&egrave;res.</span></p>\r\n<ol start=\"6\">\r\n<li>\r\n<h3><span style=\"font-weight: 400;\">Douar Imi Ouknari</span></h3>\r\n</li>\r\n</ol>\r\n<p><span style=\"font-weight: 400;\">Douar Imi Ouknari est une petite zone qui se trouve pr&egrave;s d&rsquo;Agadir. Imi Ouknari est une petite plage tr&egrave;s propre et conviviale o&ugrave; vous verrez de petites vagues s&rsquo;&eacute;craser lentement sur la plage.</span></p>\r\n<p><span style=\"font-weight: 400;\">A imi Ouknari,&nbsp; le sable est fin, dor&eacute; et en m&ecirc;me temps l&eacute;ger, tellement qu&rsquo;on se croirait aux Maldives. Elle se trouve sur la route Nationale N1. Vous pourrez s&eacute;journer &agrave; Taghazout ou &agrave; Tamri &agrave; moindre co&ucirc;t (400 pour un appartement de 6 chambres).</span></p>\r\n<ol start=\"7\">\r\n<li>\r\n<h3><span style=\"font-weight: 400;\"> &nbsp; </span> <span style=\"font-weight: 400;\">Agadir Dolphin World</span></h3>\r\n</li>\r\n</ol>\r\n<p><span style=\"font-weight: 400;\">Pour les amoureux des animaux marins, vous pourrez trouver votre plaisir au parc des dauphins. Ces c&eacute;tac&eacute;s &agrave; la forme ovale vous feront l&rsquo;honneur de vous accueillir dans leur monde afin de vous proposer l&rsquo;un des spectacles les plus amusants et attrayants que vous aurez &agrave; voir. Ne vous en privez pas, ils vous attendent sur le front de mer Anza pour vous faire voyager dans le monde marin.</span><span style=\"font-weight: 400;\">&nbsp;</span></p>\r\n<ol start=\"8\">\r\n<li>\r\n<h3><span style=\"font-weight: 400;\"> Sol House Taghazout bay- Surf</span></h3>\r\n</li>\r\n</ol>\r\n<p><span style=\"font-weight: 400;\">Cet h&ocirc;tel situ&eacute; sur la plage de Taghazout au bord de l&rsquo;oc&eacute;an Atlantique avec ses installations luxueuses vous offre le cadre et les modalit&eacute;s pour vous reposer au gr&eacute; du son des vagues mais aussi un espace pour vous amuser en famille et vous adonner &agrave; votre passion de surfeur si vous en&nbsp; &ecirc;tes un bien &eacute;videmment</span></p>\r\n<p><span style=\"font-weight: 400;\">&nbsp;</span></p>\r\n<p><span style=\"font-weight: 400;\">OFFRE &Agrave; NE PAS RATER ! ON VOUS EN DIT PLUS.</span></p>\r\n<p><span style=\"font-weight: 400;\">&nbsp;</span></p>\r\n<p><span style=\"font-weight: 400;\">Rentacs Tours, vous donne la possibilit&eacute; de passer des instants inoubliables gr&acirc;ce &agrave; son &laquo; offre Sol&nbsp; House Taghazout Bay- Surf &raquo;.&nbsp; Si vous r&eacute;servez des maintenant vous aurez droit &agrave; des avantages Sol House jusqu&rsquo;au 31/03/20 &agrave; savoir : Un cours de surf Stand Up Paddle o Kayak gratuit par s&eacute;jour ; un acc&egrave;s au Sauna Gratuit, un acc&egrave;s gratuit &agrave; la salle de Gym Tadenga Surf Village &agrave; tout moment de la journ&eacute;e comme de la nuit et bien s&ucirc;re une remise de 20% sur les activit&eacute;s du Tadenga Surf Village.</span></p>\r\n<p><span style=\"font-weight: 400;\">&nbsp;</span></p>\r\n<p><span style=\"font-weight: 400;\">Gr&acirc;ce &agrave; Rentacs Tours, vous avez des tarifs sp&eacute;ciaux dans le cadre de l&rsquo;offre Sol House Taghazout Bay- Surf. En effet, vous pouvez r&eacute;sider dans notre house&nbsp; Bungalow Double pour seulement 795 DHS/nuit. L&rsquo;offre est valable pour 2 adultes avec petit d&eacute;jeuner offert. Si vous &ecirc;tes en famille, nous vous proposons plut&ocirc;t notre Big House Bungalow &agrave; seulement 990 Dhs/nuit pour 2 adultes et 2 enfants de moins de 12 ans. Pour cette offre aussi le petit d&eacute;jeuner est offert par l&rsquo;h&ocirc;tel.</span></p>\r\n<p><span style=\"font-weight: 400;\">&nbsp;</span></p>\r\n<p><span style=\"font-weight: 400;\">R&eacute;servez d&egrave;s maintenant votre voyage et rendez-vous &agrave; Agadir !</span></p>');
INSERT INTO `post_translations` (`id`, `post_id`, `locale`, `title`, `content`) VALUES
(21, 30, 'fr', 'Voyage à Agadir, les choses à ne pas rater en 2021', '<p><span style=\"font-weight: 400;\">Commun&eacute;ment appel&eacute;e la ville touristique, Agadir fait partie des villes les plus visit&eacute;es au Maroc. Qu&rsquo;il s&rsquo;agisse des touristes, des r&eacute;sidents au Maroc, ou encore des autochtones, elle reste incontournable lorsqu&rsquo;il s&rsquo;agit des lieux &agrave; ne pas rater durant son s&eacute;jour dans le royaume. De ce fait, quelles sont les choses &agrave; ne pas rater une fois dans la ville d&rsquo;Agadir qui s&rsquo;&eacute;tend sur pr&egrave;s de 2297km2 ?&nbsp; Rentacs Tours vous propose 5 endroits incontournables &agrave; visiter.</span></p>\r\n<h2><strong>Agadir, les incontournables</strong></h2>\r\n<ol>\r\n<li>\r\n<h3><strong>Crocoparc Agadir, Jardin botanique et parc animalier.</strong></h3>\r\n</li>\r\n</ol>\r\n<p><span style=\"font-weight: 400;\">Crocoparc par son nom nous conduit tout droit dans le monde des crocodiles du Nil avec plus de 325 pensionnaires. Il fut cr&eacute;&eacute; en Mai 2015 afin de pouvoir admirer la beaut&eacute; des crocodiles mais pas qu&rsquo;eux ; il compte aussi en son sein d&rsquo;autres reptiles tels que : des tortues g&eacute;antes, des pythons g&eacute;ants, des iguanes verts, des anacondas et des ouistitis &agrave; pinceaux blancs. Etendu sur une superficie de 4 hectares, vous ne pourrez sortir de ce parc qu&rsquo;avec une connaissance approfondie sur ces reptiles. On n&rsquo;en ressort qu&rsquo;avec des &eacute;toiles plein les yeux et la t&ecirc;te charg&eacute;e de connaissances. Ainsi, Rentacs Tours vous invite &agrave; vous y rendre par curiosit&eacute; ou par fanatisme pour les reptiles, vous ne serez pas d&eacute;&ccedil;u. Il est situ&eacute; en p&eacute;riph&eacute;rie d\'Agadir, sur la commune de Drargua, le long de la route nationale 8 en direction de Marrakech.</span></p>\r\n<ol start=\"2\">\r\n<li>\r\n<h3><strong>Agadir Camel Wide</strong><span style=\"font-weight: 400;\"> <br /></span></h3>\r\n</li>\r\n</ol>\r\n<p><span style=\"font-weight: 400;\">Un incontournable en visitant cette ville est de pouvoir se balader &agrave; dos de chameaux que ce soit sur la plage de sable dor&eacute;e ou en escaladant les collines d&rsquo;Agadir Oufella. Cette balade de deux heures (2) vous permettra d&rsquo;admirer cette ville, de voir de haut ses sites spectaculaires et vous fera d&eacute;couvrir les sentiers anciens vous plongeant ainsi dans les traditions marocaines.</span><span style=\"font-weight: 400;\">&nbsp;</span></p>\r\n<ol start=\"3\">\r\n<li>\r\n<h3><strong>Vall&eacute;e du paradis</strong></h3>\r\n</li>\r\n</ol>\r\n<p><span style=\"font-weight: 400;\">La vall&eacute;e du paradis a &eacute;t&eacute; rendue c&eacute;l&egrave;bre par une l&eacute;gende populaire affirmant que l&rsquo;eau de la source qui la parcourt aurait des vertus th&eacute;rapeutiques. De cette vall&eacute;e vous aurez droit &agrave; un paysage magnifique qui vous mettra en extase. Pour la vall&eacute;e du paradis, il faudrait pr&eacute;voir une demi-journ&eacute;e car c&rsquo;est sur une longueur de 30 km que s&rsquo;&eacute;tendent ses diff&eacute;rents paysages.</span></p>\r\n<ol start=\"4\">\r\n<li>\r\n<h3><strong>Agadir, Sahara Trip</strong></h3>\r\n</li>\r\n</ol>\r\n<p><span style=\"font-weight: 400;\">Gr&acirc;ce &agrave; cette compagnie, le Sahara n&rsquo;aura plus de secret pour vous. Vous commencerez par d&eacute;couvrir Agadir et vous terminerez au beau milieu du d&eacute;sert du Sahara. Une exp&eacute;rience unique que vous n&rsquo;oublierez jamais. Faites-y un tour afin de pouvoir jouir de leur exp&eacute;rience, des meilleurs endroits &agrave; visiter et &agrave; d&eacute;couvrir afin de ne point vous perdre dans vos recherches d&rsquo;activit&eacute;s &agrave; faire durant votre s&eacute;jour &agrave; Agadir.</span></p>\r\n<ol start=\"5\">\r\n<li>\r\n<h3><strong>Inezgane</strong></h3>\r\n</li>\r\n</ol>\r\n<p><span style=\"font-weight: 400;\">Cette petite ville mitoyenne d&rsquo;Agadir, dans la vall&eacute;e du Souss, est un circuit commercial compos&eacute; majoritairement de march&eacute;s. Inezgane est sans aucun doute un excellent endroit pour s&rsquo;acheter des souvenirs, faire de bonnes affaires et d&eacute;couvrir un peu plus la culture marocaine.</span></p>\r\n<p><span style=\"font-weight: 400;\">Vous y trouverez de tout ! Des fruits aux bijoux traditionnels berb&egrave;re en passant par des articles en cuir, nous sommes certains que vous ne pourrez vous y rendre et repartir de l&agrave; sans avoir rempli votre sac d&rsquo;objets souvenirs et fait le plein de babioles qui trouveront une place de choix chez vous, au bureau ou encore dans votre routine quotidienne. En plus de cela, vous pourrez visiter le village d&rsquo;Imouzzer des Ida Outanane qui est principalement habit&eacute; par des Berb&egrave;res.</span></p>\r\n<ol start=\"6\">\r\n<li>\r\n<h3><strong>Douar Imi Ouknari</strong></h3>\r\n</li>\r\n</ol>\r\n<p><span style=\"font-weight: 400;\">Douar Imi Ouknari est une petite zone qui se trouve pr&egrave;s d&rsquo;Agadir. Imi Ouknari est une petite plage tr&egrave;s propre et conviviale o&ugrave; vous verrez de petites vagues s&rsquo;&eacute;craser lentement sur la plage.</span></p>\r\n<p><span style=\"font-weight: 400;\">A imi Ouknari,&nbsp; le sable est fin, dor&eacute; et en m&ecirc;me temps l&eacute;ger, tellement qu&rsquo;on se croirait aux Maldives. Elle se trouve sur la route Nationale N1. Vous pourrez s&eacute;journer &agrave; Taghazout ou &agrave; Tamri &agrave; moindre co&ucirc;t (400 pour un appartement de 6 chambres).</span></p>\r\n<ol start=\"7\">\r\n<li>\r\n<h3><strong>Agadir Dolphin World</strong></h3>\r\n</li>\r\n</ol>\r\n<p><span style=\"font-weight: 400;\">Pour les amoureux des animaux marins, vous pourrez trouver votre plaisir au parc des dauphins. Ces c&eacute;tac&eacute;s &agrave; la forme ovale vous feront l&rsquo;honneur de vous accueillir dans leur monde afin de vous proposer l&rsquo;un des spectacles les plus amusants et attrayants que vous aurez &agrave; voir. Ne vous en privez pas, ils vous attendent sur le front de mer Anza pour vous faire voyager dans le monde marin.</span><span style=\"font-weight: 400;\">&nbsp;</span></p>\r\n<ol start=\"8\">\r\n<li>\r\n<h3><strong> Sol House Taghazout bay- Surf</strong></h3>\r\n</li>\r\n</ol>\r\n<p><span style=\"font-weight: 400;\">Cet h&ocirc;tel situ&eacute; sur la plage de Taghazout au bord de l&rsquo;oc&eacute;an Atlantique avec ses installations luxueuses vous offre le cadre et les modalit&eacute;s pour vous reposer au gr&eacute; du son des vagues mais aussi un espace pour vous amuser en famille et vous adonner &agrave; votre passion de surfeur si vous en&nbsp; &ecirc;tes un bien &eacute;videmment</span></p>\r\n<p><span style=\"font-weight: 400;\">OFFRE &Agrave; NE PAS RATER ! ON VOUS EN DIT PLUS.</span></p>\r\n<p><span style=\"font-weight: 400;\">Rentacs Tours, vous donne la possibilit&eacute; de passer des instants inoubliables gr&acirc;ce &agrave; son &laquo; offre Sol&nbsp; House Taghazout Bay- Surf &raquo;.&nbsp; Si vous r&eacute;servez des maintenant vous aurez droit &agrave; des avantages Sol House jusqu&rsquo;au 31/03/20 &agrave; savoir : Un cours de surf Stand Up Paddle o Kayak gratuit par s&eacute;jour ; un acc&egrave;s au Sauna Gratuit, un acc&egrave;s gratuit &agrave; la salle de Gym Tadenga Surf Village &agrave; tout moment de la journ&eacute;e comme de la nuit et bien s&ucirc;re une remise de 20% sur les activit&eacute;s du Tadenga Surf Village.</span></p>\r\n<p><span style=\"font-weight: 400;\">Gr&acirc;ce &agrave; Rentacs Tours, vous avez des tarifs sp&eacute;ciaux dans le cadre de l&rsquo;offre Sol House Taghazout Bay- Surf. En effet, vous pouvez r&eacute;sider dans notre house&nbsp; Bungalow Double pour seulement 795 DHS/nuit. L&rsquo;offre est valable pour 2 adultes avec petit d&eacute;jeuner offert. Si vous &ecirc;tes en famille, nous vous proposons plut&ocirc;t notre Big House Bungalow &agrave; seulement 990 Dhs/nuit pour 2 adultes et 2 enfants de moins de 12 ans. Pour cette offre aussi le petit d&eacute;jeuner est offert par l&rsquo;h&ocirc;tel.</span></p>\r\n<p><span style=\"font-weight: 400;\">R&eacute;servez d&egrave;s maintenant votre voyage et rendez-vous &agrave; Agadir !</span></p>');

-- --------------------------------------------------------

--
-- Structure de la table `profiles`
--

CREATE TABLE `profiles` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `title_id` int(11) NOT NULL DEFAULT 1,
  `gender_id` int(11) NOT NULL DEFAULT 1,
  `sur_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `other_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `profiles`
--

INSERT INTO `profiles` (`id`, `user_id`, `title_id`, `gender_id`, `sur_name`, `first_name`, `other_name`, `phone_number`, `address`, `photo`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 'Travel', 'Portal', 'Admin', '09090909090', 'Address', '', '2021-01-28 09:14:55', '2021-02-15 16:39:26'),
(2, 2, 1, 1, 'First', 'Portal', 'Agent', '09090111111', 'Travel portal agent shop at that place', '', '2021-01-28 09:14:55', '2021-01-28 09:14:55'),
(3, 3, 1, 1, 'Client', 'Test', 'Client1', '09090222222', 'First test customer', '', '2021-01-28 09:14:55', '2021-06-01 15:51:32');

-- --------------------------------------------------------

--
-- Structure de la table `purchases`
--

CREATE TABLE `purchases` (
  `id` int(10) UNSIGNED NOT NULL,
  `reference_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `supplier_id` int(11) UNSIGNED NOT NULL,
  `total_qty` double NOT NULL,
  `tax` double NOT NULL,
  `total_tax` double NOT NULL,
  `total_cost` double NOT NULL,
  `grand_total` double NOT NULL,
  `paid_amount` double NOT NULL,
  `status` int(11) NOT NULL,
  `paid_by` int(11) NOT NULL,
  `payment_status` int(11) NOT NULL,
  `document` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `staff_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_locked` int(11) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `purchases`
--

INSERT INTO `purchases` (`id`, `reference_no`, `user_id`, `supplier_id`, `total_qty`, `tax`, `total_tax`, `total_cost`, `grand_total`, `paid_amount`, `status`, `paid_by`, `payment_status`, `document`, `note`, `payment_note`, `staff_note`, `is_locked`, `created_at`, `updated_at`) VALUES
(7, '369', 1, 3, 1, 100, 4995, 10989, 9990, 21978, 1, 1, 1, '369-Absolue_Oleo_Serum_600X600.jpg', NULL, NULL, NULL, 0, '2021-03-09 16:31:44', '2021-04-02 08:55:10');

-- --------------------------------------------------------

--
-- Structure de la table `purchase_details`
--

CREATE TABLE `purchase_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `purchase_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `qty` double NOT NULL DEFAULT 0,
  `price` double NOT NULL DEFAULT 0,
  `total` double NOT NULL DEFAULT 0,
  `updated_at` date DEFAULT NULL,
  `created_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `purchase_details`
--

INSERT INTO `purchase_details` (`id`, `purchase_id`, `name`, `qty`, `price`, `total`, `updated_at`, `created_at`) VALUES
(21, 7, 'merceds', 5, 999, 4995, '2021-03-09', '2021-03-09');

-- --------------------------------------------------------

--
-- Structure de la table `rate_booking`
--

CREATE TABLE `rate_booking` (
  `id` int(10) UNSIGNED NOT NULL,
  `booking_id` int(10) UNSIGNED NOT NULL,
  `rate_id` int(10) UNSIGNED NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `returns`
--

CREATE TABLE `returns` (
  `id` int(10) UNSIGNED NOT NULL,
  `reference_no` varchar(191) NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `customer_id` int(11) UNSIGNED DEFAULT NULL,
  `booking_reference` varchar(255) DEFAULT NULL,
  `total_qty` double NOT NULL,
  `tax` double NOT NULL,
  `total_tax` double NOT NULL,
  `total_cost` double NOT NULL,
  `grand_total` double NOT NULL,
  `paid_amount` double NOT NULL,
  `status` int(11) NOT NULL,
  `paid_by` int(11) NOT NULL,
  `payment_status` int(11) NOT NULL,
  `document` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text DEFAULT NULL,
  `payment_note` text DEFAULT NULL,
  `staff_note` text DEFAULT NULL,
  `is_locked` int(11) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `returns`
--

INSERT INTO `returns` (`id`, `reference_no`, `user_id`, `customer_id`, `booking_reference`, `total_qty`, `tax`, `total_tax`, `total_cost`, `grand_total`, `paid_amount`, `status`, `paid_by`, `payment_status`, `document`, `note`, `payment_note`, `staff_note`, `is_locked`, `created_at`, `updated_at`) VALUES
(2, '25424', 1, 1, NULL, 1, 20, 256, 1280, 1536, 0, 1, 0, 2, '', NULL, NULL, NULL, 0, '2021-04-13 12:40:41', '2021-04-13 12:40:41'),
(3, '000000001', 1, 3, NULL, 1, 0, 0, 999, 999, 999, 1, 1, 3, NULL, NULL, NULL, NULL, 1, '2021-04-14 10:54:49', '2021-04-14 10:54:49'),
(4, '000000001', 1, 3, NULL, 1, 10, 299.7, 2997, 3296.7, 0, 1, 1, 3, NULL, NULL, NULL, NULL, 1, '2021-05-27 10:27:03', '2021-05-27 10:27:03'),
(5, '2105278246534', 1, 3, NULL, 1, 0, 0, 1000, 1000, 0, 1, 1, 3, NULL, NULL, NULL, NULL, 1, '2021-06-01 16:00:45', '2021-06-01 16:00:45');

-- --------------------------------------------------------

--
-- Structure de la table `return_details`
--

CREATE TABLE `return_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `return_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `qty` double NOT NULL DEFAULT 0,
  `price` double NOT NULL DEFAULT 0,
  `total` double NOT NULL DEFAULT 0,
  `updated_at` date DEFAULT NULL,
  `created_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `return_details`
--

INSERT INTO `return_details` (`id`, `return_id`, `name`, `qty`, `price`, `total`, `updated_at`, `created_at`) VALUES
(4, 2, 'Mazagan Beach & Golf Resort', 1, 1280, 1280, '2021-04-13', '2021-04-13'),
(5, 3, 'Sol House Taghazout Bay Surf', 1, 999, 999, '2021-04-14', '2021-04-14'),
(6, 4, 'Sol House Taghazout Bay Surf', 3, 999, 2997, '2021-05-27', '2021-05-27'),
(7, 5, 'okokokok', 10, 100, 1000, '2021-06-01', '2021-06-01');

-- --------------------------------------------------------

--
-- Structure de la table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `place_id` int(11) DEFAULT NULL,
  `score` float DEFAULT NULL,
  `comment` varchar(500) DEFAULT NULL,
  `status` int(2) DEFAULT 1,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `reviews`
--

INSERT INTO `reviews` (`id`, `user_id`, `place_id`, `score`, `comment`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 33, 3, 'avis', 1, '2021-02-15 10:20:56', '2021-02-15 10:20:56');

-- --------------------------------------------------------

--
-- Structure de la table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Admin', 'General control of the entire system', '2021-01-28 09:14:54', '2021-01-28 09:14:54'),
(2, 'agent', 'Agent', 'A customer that books for his/her personal customer', '2021-01-28 09:14:54', '2021-01-28 09:14:54'),
(3, 'customer', 'Customer', 'A registered visitor, customer', '2021-01-28 09:14:54', '2021-01-28 09:14:54'),
(4, 'branch', 'Branch', 'A branch of the portal company', '2021-01-28 09:14:54', '2021-01-28 09:14:54'),
(5, 'cooperate', 'Cooperate Customer', 'A cooperate customer of the portal', '2021-01-28 09:14:54', '2021-01-28 09:14:54');

-- --------------------------------------------------------

--
-- Structure de la table `role_user`
--

CREATE TABLE `role_user` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `role_user`
--

INSERT INTO `role_user` (`user_id`, `role_id`) VALUES
(1, 1),
(2, 2),
(3, 3);

-- --------------------------------------------------------

--
-- Structure de la table `sales`
--

CREATE TABLE `sales` (
  `id` int(10) UNSIGNED NOT NULL,
  `reference_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `booking_reference` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `customer_id` int(11) UNSIGNED NOT NULL,
  `total_qty` double NOT NULL,
  `tax` double NOT NULL,
  `total_tax` double NOT NULL,
  `total_price` double NOT NULL,
  `grand_total` double NOT NULL,
  `status` int(11) NOT NULL,
  `payment_status` int(11) NOT NULL,
  `document` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid_amount` double DEFAULT NULL,
  `paid_by` int(11) NOT NULL,
  `payment_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `staff_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_locked` int(11) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `sale_details`
--

CREATE TABLE `sale_details` (
  `id` int(10) NOT NULL,
  `sale_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `price` double DEFAULT NULL,
  `total` double DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `created_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `val` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` char(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'string',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `settings`
--

INSERT INTO `settings` (`id`, `name`, `val`, `type`, `created_at`, `updated_at`) VALUES
(11, 'app_name', 'Rentacs Tours', 'string', '2019-12-18 06:53:47', '2020-12-18 15:11:50'),
(13, 'logo', '60252ab06d7a8_1613048496.png', 'image', '2019-12-18 06:55:23', '2021-02-11 18:01:36'),
(14, 'email_system', 'info@rentacstours.com', 'string', '2019-12-21 09:18:55', '2021-02-11 18:01:36'),
(15, 'ads_sidebar_banner_link', '//www.getyourguide.com', 'string', '2019-12-21 09:18:55', '2021-04-06 13:28:12'),
(16, 'ads_sidebar_banner_image', '5e02cf9f0538b_1577242527.jpg', 'image', '2019-12-21 09:19:03', '2019-12-25 01:55:27'),
(17, 'home_description', 'Fondée par deux bikers passionnés certifiés par HOG Harley-Davidson: Nizar CHAWAD, ancien président du HOG Chapter Casablanca, et Mohamed Ali ANOUAR, ancien secrétaire général du HOG Chapter Casablanca.  La force de Rentacs Tours repose sur la diversité des services qu’elle propose mais aussi et surtout sur le professionnalisme sans défaut de son équipe qui bénéficie des compétences managériales sans faille de monsieur Ali Amrani ayant à son actif plus de 18 années d’expériences en zones touristiques des USA.', 'string', '2020-06-22 15:09:58', '2021-02-11 18:01:36'),
(18, 'mail_driver', 'smtp', 'string', '2020-06-22 15:09:58', '2020-06-22 15:09:58'),
(19, 'mail_host', 'mail.alphaboost.ma', 'string', '2020-06-22 15:09:58', '2021-04-06 13:28:11'),
(20, 'mail_port', '465', 'string', '2020-06-22 15:09:58', '2020-06-22 15:09:58'),
(21, 'mail_username', 'zlabib@alphaboost.ma', 'string', '2020-06-22 15:09:58', '2021-04-06 13:28:11'),
(22, 'mail_password', 'alphadev2020$', 'string', '2020-06-22 15:09:58', '2021-04-06 13:28:59'),
(23, 'mail_encryption', 'ssl', 'string', '2020-06-22 15:09:58', '2020-06-22 15:09:58'),
(24, 'mail_from_address', 'info@rentacstours.com', 'string', '2020-06-22 15:09:58', '2021-02-11 18:01:36'),
(25, 'mail_from_name', 'Rentacs Tours', 'string', '2020-06-22 15:09:58', '2020-12-18 15:53:23'),
(26, 'facebook_app_id', NULL, 'string', '2020-06-22 15:09:58', '2020-06-22 15:09:58'),
(27, 'facebook_app_secret', NULL, 'string', '2020-06-22 15:09:58', '2020-06-22 15:09:58'),
(28, 'google_app_id', NULL, 'string', '2020-06-22 15:09:58', '2020-06-22 15:09:58'),
(29, 'google_app_secret', NULL, 'string', '2020-06-22 15:09:58', '2020-06-22 15:09:58'),
(30, 'goolge_map_api_key', 'AIzaSyCMDKyZu6-_AiLo5cxl4u_BTzu2sz3-Cfw', 'string', '2020-06-22 15:09:58', '2021-02-10 14:56:53'),
(31, 'style_rtl', '0', 'string', '2020-06-22 15:09:58', '2020-06-22 15:09:58'),
(32, 'template', '01', 'string', '2020-06-22 15:09:58', '2020-12-23 07:41:48'),
(33, 'home_banner', '602e3c048e0bd_1613642756.jpg', 'image', '2020-12-18 08:50:26', '2021-02-18 15:05:56'),
(34, 'social_facebook', '//www.facebook.com/rentacstours', 'string', '2019-12-18 06:53:47', '2021-04-06 13:28:11'),
(35, 'social_youtube', '//www.youtube.com/channel/UCekzMJLctKIYMQfE-9VT3_w', 'string', '2019-12-21 09:18:55', '2021-04-06 13:28:11'),
(36, 'social_instagram', '//www.instagram.com/rentacstours/', 'string', '2019-12-18 06:53:47', '2021-04-06 13:28:11'),
(37, 'social_whatsapp', '#4', 'string', '2019-12-21 09:18:55', '2020-12-19 11:41:33'),
(38, 'home_email', 'info@rentacstours.com', 'string', '2021-01-04 12:16:12', '2021-02-11 18:01:36'),
(39, 'home_adresse', '13, Rue El Kassar 1er Etage Maarif 20100 Casablanca, Maroc', 'string', '2021-01-04 12:16:12', '2021-02-17 17:10:17'),
(40, 'home_phone', '05222-52386', 'string', '2021-01-04 12:16:12', '2021-02-11 18:01:36'),
(41, 'footer_description', 'Hôtels de luxe ou auberges authentiques, Vivez un voyage de rêves dans les plus belles destinations soigneusement sélectionnées par Rentacs Tours.', 'string', '2021-02-09 08:23:39', '2021-02-11 20:53:37'),
(42, 'social_linkedin', '//www.linkedin.com/company/rentacstours/', 'string', '2021-02-09 08:23:39', '2021-04-06 13:28:11'),
(43, 'top_navigation', NULL, 'string', '2021-02-10 16:15:11', '2021-02-11 18:01:36'),
(44, 'google_analytics_js', NULL, 'string', '2021-02-17 15:05:44', '2021-02-17 15:05:44'),
(45, 'facebook_pixel_js', NULL, 'string', '2021-02-17 15:05:44', '2021-02-17 15:05:44');

-- --------------------------------------------------------

--
-- Structure de la table `sight_seeings`
--

CREATE TABLE `sight_seeings` (
  `id` int(10) UNSIGNED NOT NULL,
  `package_id` int(11) NOT NULL,
  `attraction_id` int(11) NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `sliders`
--

CREATE TABLE `sliders` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `sliders`
--

INSERT INTO `sliders` (`id`, `title`, `photo`, `created_at`, `updated_at`) VALUES
(1, 'image 1', 'slide-1622565601.jpg', '2021-06-01 15:40:02', '2021-06-01 15:40:02'),
(2, 'image 2', 'slide-1622566637.jpeg', '2021-06-01 15:56:49', '2021-06-01 15:57:18');

-- --------------------------------------------------------

--
-- Structure de la table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `suppliers`
--

INSERT INTO `suppliers` (`id`, `name`, `company_name`, `tax_number`, `email`, `phone_number`, `address`, `city`, `postal_code`, `country`, `created_at`, `updated_at`) VALUES
(3, 'admin', 'gfsd', '12', 'bebest@mail.com', '0666666666', 'gfsd', 'hgfd', 'hgf', 'hgd', '2021-01-14 13:34:43', '2021-01-19 11:13:53'),
(4, 'gfs', 'gfs', '1', 'z@admin.com', '6', 'casablanca', 'Casablanca', '22222', 'Maroc', '2021-01-15 13:20:31', '2021-01-19 10:48:24'),
(13, 'zakaria labib', 'Alphaboost', '55555', 'zakarialabib@gmail.com', '666', 'gfsd', 'hgfd', 'hgd', 'hgd', '2021-01-19 10:50:00', '2021-01-19 11:39:44'),
(14, 'kkkk', 'gfsd', '6666', 'zakarialabib@g.com', '6666', NULL, NULL, NULL, NULL, '2021-01-29 11:23:33', '2021-01-29 11:37:15'),
(15, 'kkkkk', 'llkk', NULL, NULL, '666666', NULL, NULL, NULL, NULL, '2021-01-29 11:28:45', '2021-01-29 11:37:01');

-- --------------------------------------------------------

--
-- Structure de la table `testimonials`
--

CREATE TABLE `testimonials` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `job_title` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `content` varchar(500) DEFAULT NULL,
  `status` int(11) DEFAULT 1,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `testimonials`
--

INSERT INTO `testimonials` (`id`, `name`, `job_title`, `avatar`, `content`, `status`, `created_at`, `updated_at`) VALUES
(10, NULL, NULL, '5ee19cf5de0ab_1591844085.jpg', NULL, 1, '2020-05-28 15:27:45', '2020-06-11 02:54:45'),
(11, NULL, NULL, '5ee19d9a2b42a_1591844250.jpg', NULL, 1, '2020-05-28 15:41:35', '2020-06-11 02:57:30'),
(12, NULL, NULL, '5ee19e4de3586_1591844429.jpg', NULL, 1, '2020-06-11 03:00:29', '2020-06-11 03:00:29');

-- --------------------------------------------------------

--
-- Structure de la table `testimonial_translations`
--

CREATE TABLE `testimonial_translations` (
  `id` int(11) UNSIGNED NOT NULL,
  `testimonial_id` int(11) DEFAULT NULL,
  `locale` varchar(10) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `job_title` varchar(255) DEFAULT NULL,
  `content` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `testimonial_translations`
--

INSERT INTO `testimonial_translations` (`id`, `testimonial_id`, `locale`, `name`, `job_title`, `content`) VALUES
(3, 10, 'en', 'Kari Granleese', 'CEO Alididi', 'Really useful app to find interesting things to see do, drink and eat in new places. I’ve been using it regularly in my travels over the past few months.'),
(4, 10, 'fr', 'teststs 22222 fr', 'frrr', NULL),
(5, 11, 'en', 'Lorealdonae', 'Travellers', 'I use this app for everything!I’ m a very adventurous person so I love to try new restaurants, hair salons, even nightlife when I’m in different cities!'),
(6, 11, 'fr', 'test 1 fr', NULL, NULL),
(7, 12, 'en', 'Alexkaay', 'Local Guide', 'I adore learning about new as well as old local, especially small independent business\'. And this is just the place for doing so.');

-- --------------------------------------------------------

--
-- Structure de la table `titles`
--

CREATE TABLE `titles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `titles`
--

INSERT INTO `titles` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Mr', '2021-01-28 09:16:31', '2021-01-28 09:16:31'),
(2, 'Mlle', '2021-01-28 09:16:31', '2021-01-28 09:16:31'),
(3, 'Madame', '2021-01-28 09:16:31', '2021-01-28 09:16:31');

-- --------------------------------------------------------

--
-- Structure de la table `travel_packages`
--

CREATE TABLE `travel_packages` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `flight` int(11) NOT NULL,
  `hotel` int(11) NOT NULL,
  `attraction` int(11) NOT NULL,
  `phone_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `information` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `adult_price` bigint(20) NOT NULL,
  `child_price` bigint(20) NOT NULL,
  `infant_price` bigint(20) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `travel_packages`
--

INSERT INTO `travel_packages` (`id`, `category_id`, `name`, `flight`, `hotel`, `attraction`, `phone_number`, `information`, `adult_price`, `child_price`, `infant_price`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Casablanca', 1, 0, 0, '+212638041919', 'Casablancabrief', 999, 499, 399, 1, '2021-01-28 09:30:28', '2021-01-29 13:38:10'),
(2, 3, 'dubi', 0, 0, 1, '+5555555', 'dubidubihsdfgfsd', 666, 111, 111, 1, '2021-01-28 16:14:49', '2021-01-29 13:39:55');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `delete_status` int(11) NOT NULL DEFAULT 0,
  `profile_complete_status` int(11) NOT NULL DEFAULT 0,
  `api_token` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_id` int(10) UNSIGNED DEFAULT NULL,
  `is_admin` int(11) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `delete_status`, `profile_complete_status`, `api_token`, `remember_token`, `customer_id`, `is_admin`, `created_at`, `updated_at`) VALUES
(1, 'admin@admin.com', '$2y$10$D897.afXJqCRq5Ij5X/Ba.VXu.TM96CbjkF8CzFGVz5PA05eOV2cW', 0, 0, '', 'IJ0IJ4jb9zzqVDreFdyAm64MyaNnhsFtj8Ti6a3Y3F0z6CLKl3xFez1xmiYZ', NULL, 1, '2021-01-28 09:14:55', '2021-01-28 09:14:55'),
(2, 'agent@agent.com', '$2y$10$1.KCk1DJuYp4ZaPgLgDE0.t9Ob0zGegdWu11uKR8uT3cFJfT/6oRe', 0, 0, '', '0R82vHJuH2EMedA0yZOMPp53Nify6JwM4Xv6N16YNIHkSenT2GcH3kEj2H57', NULL, 0, '2021-01-28 09:14:55', '2021-01-28 09:14:55'),
(3, 'customer@customer.com', '$2y$10$liBmx5acvAXNb3O6e9tFBOU3bmNwwLlMXpRnM8UyutR9IkH1Cqcr2', 0, 0, '', NULL, NULL, 0, '2021-01-28 09:14:55', '2021-01-28 09:14:55');

-- --------------------------------------------------------

--
-- Structure de la table `vats`
--

CREATE TABLE `vats` (
  `id` int(10) UNSIGNED NOT NULL,
  `flight_vat_type` int(11) NOT NULL DEFAULT 1,
  `flight_vat_value` int(11) NOT NULL DEFAULT 0,
  `hotel_vat_type` int(11) NOT NULL DEFAULT 1,
  `hotel_vat_value` int(11) NOT NULL DEFAULT 0,
  `car_vat_type` int(11) NOT NULL DEFAULT 1,
  `car_vat_value` int(11) NOT NULL DEFAULT 0,
  `package_vat_type` int(11) NOT NULL DEFAULT 1,
  `package_vat_value` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `vats`
--

INSERT INTO `vats` (`id`, `flight_vat_type`, `flight_vat_value`, `hotel_vat_type`, `hotel_vat_value`, `car_vat_type`, `car_vat_value`, `package_vat_type`, `package_vat_value`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 2, 1, 2, 1, 2, 1, '2021-01-28 09:16:30', '2021-01-28 09:16:30');

-- --------------------------------------------------------

--
-- Structure de la table `visa_applications`
--

CREATE TABLE `visa_applications` (
  `id` int(10) UNSIGNED NOT NULL,
  `surname` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `given_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `residence_country` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `destination_country` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ipAddress` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `vouchers`
--

CREATE TABLE `vouchers` (
  `id` int(10) UNSIGNED NOT NULL,
  `amount` int(11) NOT NULL,
  `code` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `vouchers`
--

INSERT INTO `vouchers` (`id`, `amount`, `code`, `status`, `created_at`, `updated_at`) VALUES
(1, 10000, 'C61DY', 1, '2021-01-28 09:16:31', '2021-01-28 09:16:31'),
(2, 67000, 'J6JJT', 1, '2021-01-28 09:16:31', '2021-01-28 09:16:31'),
(3, 34000, 'L6PGJ', 1, '2021-01-28 09:16:31', '2021-01-28 09:16:31'),
(4, 13400, 'AQKYV', 1, '2021-01-28 09:16:31', '2021-01-28 09:16:31');

-- --------------------------------------------------------

--
-- Structure de la table `wallets`
--

CREATE TABLE `wallets` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `balance` bigint(20) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `wallets`
--

INSERT INTO `wallets` (`id`, `user_id`, `balance`, `created_at`, `updated_at`) VALUES
(1, 1, 1000000000, '2021-01-28 09:16:31', '2021-01-28 09:16:31'),
(2, 2, 499950000, '2021-01-28 09:16:31', '2021-01-28 09:40:30'),
(4, 3, 1499, '2021-04-02 13:59:14', '2021-04-14 12:04:32');

-- --------------------------------------------------------

--
-- Structure de la table `wallet_logs`
--

CREATE TABLE `wallet_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `amount` bigint(20) NOT NULL,
  `status` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `wallet_logs`
--

INSERT INTO `wallet_logs` (`id`, `user_id`, `amount`, `status`, `type_id`, `created_at`, `updated_at`) VALUES
(1, 1, 0, 1, 1, '2021-01-28 09:16:31', '2021-01-28 09:16:31'),
(2, 2, 0, 1, 1, '2021-01-28 09:16:31', '2021-01-28 09:16:31'),
(3, 2, 0, 0, 2, '2021-01-28 09:40:29', '2021-01-28 09:40:29'),
(4, 3, 0, 1, 1, '2021-04-14 12:03:20', '2021-04-14 12:03:20'),
(5, 3, 0, 0, 2, '2021-04-14 12:04:10', '2021-04-14 12:04:10');

-- --------------------------------------------------------

--
-- Structure de la table `wallet_log_types`
--

CREATE TABLE `wallet_log_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `wallet_log_types`
--

INSERT INTO `wallet_log_types` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Admin Wallet Credit', '2021-01-28 09:16:31', '2021-01-28 09:16:31'),
(2, 'Admin Wallet Debit', '2021-01-28 09:16:31', '2021-01-28 09:16:31'),
(3, 'User Wallet Credit', '2021-01-28 09:16:31', '2021-01-28 09:16:31'),
(4, 'Hotel Payment Debit', '2021-01-28 09:16:31', '2021-01-28 09:16:31'),
(5, 'Flight Payment Debit', '2021-01-28 09:16:31', '2021-01-28 09:16:31'),
(6, 'Package Payment Debit', '2021-01-28 09:16:31', '2021-01-28 09:16:31'),
(7, 'Other Payment Debit', '2021-01-28 09:16:31', '2021-01-28 09:16:31'),
(8, 'Other Payment Credit', '2021-01-28 09:16:31', '2021-01-28 09:16:31');

-- --------------------------------------------------------

--
-- Structure de la table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `place_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `agency_profiles`
--
ALTER TABLE `agency_profiles`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `airlines`
--
ALTER TABLE `airlines`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `airports`
--
ALTER TABLE `airports`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `amenities`
--
ALTER TABLE `amenities`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `amenities_translations`
--
ALTER TABLE `amenities_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `amenities_translations_amenities_id_locale_unique` (`amenities_id`,`locale`),
  ADD KEY `amenities_translations_locale_index` (`locale`);

--
-- Index pour la table `attractions`
--
ALTER TABLE `attractions`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `banks`
--
ALTER TABLE `banks`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `bank_details`
--
ALTER TABLE `bank_details`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `bank_payments`
--
ALTER TABLE `bank_payments`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id_booking_id` (`user_id`);

--
-- Index pour la table `cabin_types`
--
ALTER TABLE `cabin_types`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `car_bookings`
--
ALTER TABLE `car_bookings`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `category_translations`
--
ALTER TABLE `category_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `category_translations_category_id_locale_unique` (`category_id`,`locale`),
  ADD KEY `category_translations_locale_index` (`locale`);

--
-- Index pour la table `category_types`
--
ALTER TABLE `category_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `foreign_category_type_id` (`category_id`);

--
-- Index pour la table `category_type_translations`
--
ALTER TABLE `category_type_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `category_type_translations_category_type_id_locale_unique` (`category_type_id`,`locale`),
  ADD KEY `category_type_translations_locale_index` (`locale`);

--
-- Index pour la table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `city_translations`
--
ALTER TABLE `city_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `city_translations_city_id_locale_unique` (`city_id`,`locale`),
  ADD KEY `city_translations_locale_index` (`locale`);

--
-- Index pour la table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `cooperate_customer_profiles`
--
ALTER TABLE `cooperate_customer_profiles`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `email_subscribers`
--
ALTER TABLE `email_subscribers`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `flight_bookings`
--
ALTER TABLE `flight_bookings`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `flight_deals`
--
ALTER TABLE `flight_deals`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `galleries`
--
ALTER TABLE `galleries`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `genders`
--
ALTER TABLE `genders`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `good_to_knows`
--
ALTER TABLE `good_to_knows`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `hotels`
--
ALTER TABLE `hotels`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `hotel_bookings`
--
ALTER TABLE `hotel_bookings`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `hotel_deals`
--
ALTER TABLE `hotel_deals`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `ltm_translations`
--
ALTER TABLE `ltm_translations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `markdowns`
--
ALTER TABLE `markdowns`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `markups`
--
ALTER TABLE `markups`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `markup_types`
--
ALTER TABLE `markup_types`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `markup_value_types`
--
ALTER TABLE `markup_value_types`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `newsletters`
--
ALTER TABLE `newsletters`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `offers`
--
ALTER TABLE `offers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `foreing_offer_category_id` (`category_id`),
  ADD KEY `foreign_offer_city_id` (`city_id`);

--
-- Index pour la table `offer_translations`
--
ALTER TABLE `offer_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `offer_translations_offer_id_locale_unique` (`offer_id`,`locale`),
  ADD KEY `offer_translations_locale_index` (`locale`);

--
-- Index pour la table `online_payments`
--
ALTER TABLE `online_payments`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `packages_offer_id_foreign` (`offer_id`);

--
-- Index pour la table `package_attractions`
--
ALTER TABLE `package_attractions`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `package_bookings`
--
ALTER TABLE `package_bookings`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `package_categories`
--
ALTER TABLE `package_categories`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `package_conditions`
--
ALTER TABLE `package_conditions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `package_conditions_package_id_foreign` (`package_id`);

--
-- Index pour la table `package_features`
--
ALTER TABLE `package_features`
  ADD PRIMARY KEY (`id`),
  ADD KEY `package_features_package_id_foreign` (`package_id`);

--
-- Index pour la table `package_flights`
--
ALTER TABLE `package_flights`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `package_hotels`
--
ALTER TABLE `package_hotels`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `package_rates`
--
ALTER TABLE `package_rates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `package_rates_package_id_foreign` (`package_id`);

--
-- Index pour la table `package_types`
--
ALTER TABLE `package_types`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `page_translations`
--
ALTER TABLE `page_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `page_translations_page_id_locale_unique` (`page_id`,`locale`),
  ADD KEY `page_translations_locale_index` (`locale`);

--
-- Index pour la table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Index pour la table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_unique` (`name`);

--
-- Index pour la table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_role_id_foreign` (`role_id`);

--
-- Index pour la table `places`
--
ALTER TABLE `places`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `place_translations`
--
ALTER TABLE `place_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `place_translations_place_id_locale_unique` (`place_id`,`locale`),
  ADD KEY `place_translations_locale_index` (`locale`);

--
-- Index pour la table `place_types`
--
ALTER TABLE `place_types`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `place_type_translations`
--
ALTER TABLE `place_type_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `place_type_translations_place_type_id_locale_unique` (`place_type_id`,`locale`),
  ADD KEY `place_type_translations_locale_index` (`locale`);

--
-- Index pour la table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `post_translations`
--
ALTER TABLE `post_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `post_translations_post_id_locale_unique` (`post_id`,`locale`),
  ADD KEY `post_translations_locale_index` (`locale`);

--
-- Index pour la table `profiles`
--
ALTER TABLE `profiles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Foreign_User_Id` (`user_id`);

--
-- Index pour la table `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Purchase Supplier` (`supplier_id`),
  ADD KEY `Purchase User` (`user_id`);

--
-- Index pour la table `purchase_details`
--
ALTER TABLE `purchase_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Purchase detail fk` (`purchase_id`);

--
-- Index pour la table `rate_booking`
--
ALTER TABLE `rate_booking`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rate_booking_booking_id_foreign` (`booking_id`),
  ADD KEY `rate_booking_rate_id_foreign` (`rate_id`);

--
-- Index pour la table `returns`
--
ALTER TABLE `returns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Return_User_ID` (`user_id`),
  ADD KEY `Foreign_Return_Customer_Id` (`customer_id`);

--
-- Index pour la table `return_details`
--
ALTER TABLE `return_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Return_Details_ID` (`return_id`);

--
-- Index pour la table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Index pour la table `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `role_user_role_id_foreign` (`role_id`);

--
-- Index pour la table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Sale Customer` (`customer_id`),
  ADD KEY `Sale User` (`user_id`);

--
-- Index pour la table `sale_details`
--
ALTER TABLE `sale_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sale_id` (`sale_id`);

--
-- Index pour la table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `sight_seeings`
--
ALTER TABLE `sight_seeings`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `testimonials`
--
ALTER TABLE `testimonials`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `testimonial_translations`
--
ALTER TABLE `testimonial_translations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `titles`
--
ALTER TABLE `titles`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `travel_packages`
--
ALTER TABLE `travel_packages`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `customer_id_user_id` (`customer_id`);

--
-- Index pour la table `vats`
--
ALTER TABLE `vats`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `visa_applications`
--
ALTER TABLE `visa_applications`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `vouchers`
--
ALTER TABLE `vouchers`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `wallets`
--
ALTER TABLE `wallets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Foreing_User_Wallet_ID` (`user_id`);

--
-- Index pour la table `wallet_logs`
--
ALTER TABLE `wallet_logs`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `wallet_log_types`
--
ALTER TABLE `wallet_log_types`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `agency_profiles`
--
ALTER TABLE `agency_profiles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `airlines`
--
ALTER TABLE `airlines`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6392;

--
-- AUTO_INCREMENT pour la table `airports`
--
ALTER TABLE `airports`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10596;

--
-- AUTO_INCREMENT pour la table `amenities`
--
ALTER TABLE `amenities`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT pour la table `amenities_translations`
--
ALTER TABLE `amenities_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT pour la table `attractions`
--
ALTER TABLE `attractions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `banks`
--
ALTER TABLE `banks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `bank_details`
--
ALTER TABLE `bank_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `bank_payments`
--
ALTER TABLE `bank_payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT pour la table `cabin_types`
--
ALTER TABLE `cabin_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `car_bookings`
--
ALTER TABLE `car_bookings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT pour la table `category_translations`
--
ALTER TABLE `category_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT pour la table `category_types`
--
ALTER TABLE `category_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pour la table `category_type_translations`
--
ALTER TABLE `category_type_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT pour la table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT pour la table `city_translations`
--
ALTER TABLE `city_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT pour la table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `cooperate_customer_profiles`
--
ALTER TABLE `cooperate_customer_profiles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT pour la table `email_subscribers`
--
ALTER TABLE `email_subscribers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT pour la table `flight_bookings`
--
ALTER TABLE `flight_bookings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `flight_deals`
--
ALTER TABLE `flight_deals`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `galleries`
--
ALTER TABLE `galleries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `genders`
--
ALTER TABLE `genders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `good_to_knows`
--
ALTER TABLE `good_to_knows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `hotels`
--
ALTER TABLE `hotels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `hotel_bookings`
--
ALTER TABLE `hotel_bookings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `hotel_deals`
--
ALTER TABLE `hotel_deals`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=164;

--
-- AUTO_INCREMENT pour la table `ltm_translations`
--
ALTER TABLE `ltm_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1747;

--
-- AUTO_INCREMENT pour la table `markdowns`
--
ALTER TABLE `markdowns`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `markups`
--
ALTER TABLE `markups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `markup_types`
--
ALTER TABLE `markup_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `markup_value_types`
--
ALTER TABLE `markup_value_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=164;

--
-- AUTO_INCREMENT pour la table `newsletters`
--
ALTER TABLE `newsletters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT pour la table `offers`
--
ALTER TABLE `offers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT pour la table `offer_translations`
--
ALTER TABLE `offer_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT pour la table `online_payments`
--
ALTER TABLE `online_payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `package_attractions`
--
ALTER TABLE `package_attractions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `package_bookings`
--
ALTER TABLE `package_bookings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `package_categories`
--
ALTER TABLE `package_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `package_conditions`
--
ALTER TABLE `package_conditions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `package_features`
--
ALTER TABLE `package_features`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `package_flights`
--
ALTER TABLE `package_flights`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `package_hotels`
--
ALTER TABLE `package_hotels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `package_rates`
--
ALTER TABLE `package_rates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `package_types`
--
ALTER TABLE `package_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `page_translations`
--
ALTER TABLE `page_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `places`
--
ALTER TABLE `places`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT pour la table `place_translations`
--
ALTER TABLE `place_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT pour la table `place_types`
--
ALTER TABLE `place_types`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `place_type_translations`
--
ALTER TABLE `place_type_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT pour la table `post_translations`
--
ALTER TABLE `post_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT pour la table `profiles`
--
ALTER TABLE `profiles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `purchases`
--
ALTER TABLE `purchases`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `purchase_details`
--
ALTER TABLE `purchase_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT pour la table `rate_booking`
--
ALTER TABLE `rate_booking`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT pour la table `returns`
--
ALTER TABLE `returns`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `return_details`
--
ALTER TABLE `return_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `sale_details`
--
ALTER TABLE `sale_details`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT pour la table `sight_seeings`
--
ALTER TABLE `sight_seeings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT pour la table `testimonials`
--
ALTER TABLE `testimonials`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `testimonial_translations`
--
ALTER TABLE `testimonial_translations`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `titles`
--
ALTER TABLE `titles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `travel_packages`
--
ALTER TABLE `travel_packages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT pour la table `vats`
--
ALTER TABLE `vats`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `visa_applications`
--
ALTER TABLE `visa_applications`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `vouchers`
--
ALTER TABLE `vouchers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `wallets`
--
ALTER TABLE `wallets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `wallet_logs`
--
ALTER TABLE `wallet_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `wallet_log_types`
--
ALTER TABLE `wallet_log_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `amenities_translations`
--
ALTER TABLE `amenities_translations`
  ADD CONSTRAINT `amenities_translations_amenities_id_foreign` FOREIGN KEY (`amenities_id`) REFERENCES `amenities` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `user_id_booking_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `category_types`
--
ALTER TABLE `category_types`
  ADD CONSTRAINT `foreign_category_type_id` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON UPDATE CASCADE;

--
-- Contraintes pour la table `city_translations`
--
ALTER TABLE `city_translations`
  ADD CONSTRAINT `city_translations_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `offers`
--
ALTER TABLE `offers`
  ADD CONSTRAINT `foreign_offer_city_id` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `foreing_offer_category_id` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON UPDATE CASCADE;

--
-- Contraintes pour la table `packages`
--
ALTER TABLE `packages`
  ADD CONSTRAINT `packages_offer_id_foreign` FOREIGN KEY (`offer_id`) REFERENCES `offers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `package_conditions`
--
ALTER TABLE `package_conditions`
  ADD CONSTRAINT `package_conditions_package_id_foreign` FOREIGN KEY (`package_id`) REFERENCES `packages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `package_features`
--
ALTER TABLE `package_features`
  ADD CONSTRAINT `package_features_package_id_foreign` FOREIGN KEY (`package_id`) REFERENCES `packages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `package_rates`
--
ALTER TABLE `package_rates`
  ADD CONSTRAINT `package_rates_package_id_foreign` FOREIGN KEY (`package_id`) REFERENCES `packages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `page_translations`
--
ALTER TABLE `page_translations`
  ADD CONSTRAINT `page_translations_page_id_foreign` FOREIGN KEY (`page_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `place_translations`
--
ALTER TABLE `place_translations`
  ADD CONSTRAINT `place_translations_place_id_foreign` FOREIGN KEY (`place_id`) REFERENCES `places` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `place_type_translations`
--
ALTER TABLE `place_type_translations`
  ADD CONSTRAINT `place_type_translations_place_type_id_foreign` FOREIGN KEY (`place_type_id`) REFERENCES `place_types` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `post_translations`
--
ALTER TABLE `post_translations`
  ADD CONSTRAINT `post_translations_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `profiles`
--
ALTER TABLE `profiles`
  ADD CONSTRAINT `Foreign_User_Id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Contraintes pour la table `purchases`
--
ALTER TABLE `purchases`
  ADD CONSTRAINT `Purchase Supplier` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `Purchase User` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `purchase_details`
--
ALTER TABLE `purchase_details`
  ADD CONSTRAINT `Purchase detail fk` FOREIGN KEY (`purchase_id`) REFERENCES `purchases` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `rate_booking`
--
ALTER TABLE `rate_booking`
  ADD CONSTRAINT `rate_booking_booking_id_foreign` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rate_booking_rate_id_foreign` FOREIGN KEY (`rate_id`) REFERENCES `package_rates` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `returns`
--
ALTER TABLE `returns`
  ADD CONSTRAINT `Foreign_Return_Customer_Id` FOREIGN KEY (`customer_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `Return_User_ID` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `return_details`
--
ALTER TABLE `return_details`
  ADD CONSTRAINT `Return_Details_ID` FOREIGN KEY (`return_id`) REFERENCES `returns` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `role_user`
--
ALTER TABLE `role_user`
  ADD CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `Sale Customer` FOREIGN KEY (`customer_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `Sale User` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `sale_details`
--
ALTER TABLE `sale_details`
  ADD CONSTRAINT `sale_id` FOREIGN KEY (`sale_id`) REFERENCES `sales` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `customer_id_user_id` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`user_id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `wallets`
--
ALTER TABLE `wallets`
  ADD CONSTRAINT `Foreing_User_Wallet_ID` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 11, 2020 at 08:41 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `medical`
--

-- --------------------------------------------------------

--
-- Table structure for table `clinics`
--

CREATE TABLE `clinics` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `clinics`
--

INSERT INTO `clinics` (`id`, `name`, `address`, `phone`, `created_at`, `updated_at`) VALUES
(1, 'Health Care Clinic', 'Palestine - Gaza - Al Nasser st', '0592496300', '2020-07-06 08:12:57', '2020-07-06 08:12:57');

-- --------------------------------------------------------

--
-- Table structure for table `doctors`
--

CREATE TABLE `doctors` (
  `id` int(11) UNSIGNED NOT NULL,
  `identity_num` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `clinic_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `doctors`
--

INSERT INTO `doctors` (`id`, `identity_num`, `name`, `username`, `password`, `clinic_id`, `created_at`, `updated_at`) VALUES
(1, '411659800', 'Mohamed Ahmed Yazji', 'moahemd', '12345679', 1, '2020-07-05 08:53:57', '2020-07-06 08:53:57'),
(2, '412267825', 'Khaled Maher Awad', 'khaledmaher098', '120161002', 1, '2020-07-06 08:56:06', '2020-07-06 08:56:06'),
(3, '415623677', 'Hamza Kamal Abo abadah', 'Hamza55', '147147147', 1, '2020-07-06 08:59:14', '2020-07-06 08:59:50'),
(4, '985321457', 'Mohammed Salem Yazouri', 'Mohammed Salem', '123123123', 1, '2020-07-06 08:18:18', '2020-07-06 08:28:18'),
(5, '800348492', 'Khaled Awwad', 'khaled', '123456', 1, '2020-07-10 14:13:47', '2020-07-10 14:13:47');

-- --------------------------------------------------------

--
-- Table structure for table `drugs`
--

CREATE TABLE `drugs` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2019_08_19_000000_create_failed_jobs_table', 1),
(3, '2020_04_30_130051_create_pat_visitings_table', 1),
(4, '2020_04_30_195150_create_patients_table', 1),
(5, '2020_04_30_224233_create_pat_examinations_table', 1),
(6, '2020_04_30_224825_create_drugs_table', 1),
(7, '2020_04_30_225415_create_patient_drug_dozes_table', 1),
(8, '2020_04_30_230617_create_patient_drug_dose_histories_table', 1),
(9, '2020_04_30_231043_create_clinics_table', 1),
(10, '2020_04_30_231354_create_patient_lists_table', 1),
(11, '2014_10_12_100000_create_password_resets_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `identity_num` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birthday` date NOT NULL,
  `gender` enum('male','female') COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`id`, `username`, `password`, `identity_num`, `name`, `birthday`, `gender`, `address`, `mobile`, `created_at`, `updated_at`) VALUES
(1, 'salem', '$2y$10$E/YO87FzQ3iIlZ085zAwXus0nE5IQEVXlDuGv35y44ShQmnwjnzYe', '985321458', 'Mohammed Salem Yazouri', '1975-08-22', 'male', 'Palestine - Gaza - Aljlaa st', '599800571', '2020-07-11 18:06:02', '2020-07-11 18:15:58'),
(2, 'khaled', '$2y$10$ZP8xwziJwT/LvCsdj4YCueifdyydTDm6X0yblj/8eguq2orCvTwQ2', '985321350', 'Khaled Maher Awad', '1975-08-22', 'male', 'Palestine - Gaza - Aljlaa st', '593330576', '2020-07-11 18:06:02', '2020-07-11 18:16:53'),
(3, 'hamza', '123456', '415623677', 'Hamza Kamal Abo abadah', '1970-05-10', 'male', 'Palestine - Gaza - Aljlaa street', '0595381955', '2020-07-11 18:06:02', '2020-07-11 18:06:02');

-- --------------------------------------------------------

--
-- Table structure for table `patient_drug_dose_histories`
--

CREATE TABLE `patient_drug_dose_histories` (
  `id` int(11) NOT NULL,
  `drug_id` int(11) NOT NULL,
  `used_at` date NOT NULL,
  `patinet_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `patient_drug_dozes`
--

CREATE TABLE `patient_drug_dozes` (
  `id` int(11) NOT NULL,
  `patinet_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `drug_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dose` int(11) NOT NULL,
  `number_of_usage` int(11) NOT NULL,
  `notes` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `patient_lists`
--

CREATE TABLE `patient_lists` (
  `patinet_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `doctor_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pat_examinations`
--

CREATE TABLE `pat_examinations` (
  `patinet_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `visit_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pat_visitings`
--

CREATE TABLE `pat_visitings` (
  `visit_id` bigint(20) UNSIGNED NOT NULL,
  `doctor_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `patient_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `visit_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `next_visit_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pat_visitings`
--

INSERT INTO `pat_visitings` (`visit_id`, `doctor_id`, `patient_id`, `visit_at`, `next_visit_at`, `created_at`, `updated_at`) VALUES
(1, '411659800', '412267825', '2020-07-09 05:00:00', '2020-07-13 12:00:00', '2020-07-06 09:30:21', '2020-07-06 09:30:21'),
(2, '411659800', '985321457', '2020-07-11 05:30:00', '2020-07-16 09:00:00', '2020-07-06 09:31:13', '2020-07-06 09:31:13'),
(6, '411659800', '415623677', '2020-07-09 09:00:00', '2020-07-15 11:30:00', '2020-07-06 09:29:28', '2020-07-06 09:29:28');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `clinics`
--
ALTER TABLE `clinics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `identity_num` (`identity_num`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `drugs`
--
ALTER TABLE `drugs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `patients_identity_num_unique` (`identity_num`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `mobile` (`mobile`);

--
-- Indexes for table `patient_drug_dose_histories`
--
ALTER TABLE `patient_drug_dose_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `patient_drug_dozes`
--
ALTER TABLE `patient_drug_dozes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pat_visitings`
--
ALTER TABLE `pat_visitings`
  ADD PRIMARY KEY (`visit_id`),
  ADD KEY `patient_id` (`patient_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `doctors`
--
ALTER TABLE `doctors`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pat_visitings`
--
ALTER TABLE `pat_visitings`
  MODIFY `visit_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

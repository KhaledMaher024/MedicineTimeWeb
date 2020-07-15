-- phpMyAdmin SQL Dump
-- version 4.9.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 15, 2020 at 10:05 PM
-- Server version: 5.7.31
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `effect_med`
--

-- --------------------------------------------------------

--
-- Table structure for table `clinics`
--

CREATE TABLE `clinics` (
  `id` int(11) UNSIGNED NOT NULL,
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
(1, 'Health Care Clinic', 'Palestine - Gaza - Al Nasser st', '0592496300', '2020-07-06 08:12:57', '2020-07-06 08:12:57'),
(2, 'White teeth', 'Palestine - Gaza - Al Nasser st', '0599188775', '2020-07-06 08:12:57', '2020-07-06 08:12:57');

-- --------------------------------------------------------

--
-- Table structure for table `doctors`
--

CREATE TABLE `doctors` (
  `id` int(11) UNSIGNED NOT NULL,
  `clinic_id` int(11) NOT NULL,
  `identity_num` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `doctors`
--

INSERT INTO `doctors` (`id`, `clinic_id`, `identity_num`, `name`, `username`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 1, 411659800, 'Mohamed Ahmed Yazji', 'moahemd', '12345679', NULL, '2020-07-05 08:53:57', '2020-07-06 08:53:57'),
(2, 1, 412267825, 'Khaled Maher Awad', 'khaledmaher098', '120161002', NULL, '2020-07-06 08:56:06', '2020-07-06 08:56:06'),
(3, 1, 415623677, 'Hamza Kamal Abo abadah', 'Hamza55', '147147147', NULL, '2020-07-06 08:59:14', '2020-07-06 08:59:50'),
(4, 1, 985321457, 'Mohammed Salem Yazouri', 'Mohammed Salem', '123123123', NULL, '2020-07-06 08:18:18', '2020-07-06 08:28:18'),
(5, 1, 800348492, 'Khaled Awwad', 'khaled', '123456', NULL, '2020-07-10 14:13:47', '2020-07-10 14:13:47');

-- --------------------------------------------------------

--
-- Table structure for table `doctor_patient`
--

CREATE TABLE `doctor_patient` (
  `id` int(11) UNSIGNED NOT NULL,
  `patient_id` int(11) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `visit_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `doctor_patient`
--

INSERT INTO `doctor_patient` (`id`, `patient_id`, `doctor_id`, `visit_at`) VALUES
(1, 1, 1, '2020-07-14 00:00:00'),
(2, 1, 2, '2020-07-22 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `drugs`
--

CREATE TABLE `drugs` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `drugs`
--

INSERT INTO `drugs` (`id`, `name`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Trophen', 'https://daoyai.com/media/catalog/product/cache/c8e4ed3eb8a914974837efe2ced493f0/t/r/trophen-sterile-eye-dropstrophen-sterile-eye-drops.jpg', '2020-07-11 21:00:00', '2020-07-11 21:00:00'),
(2, 'Panadol', 'https://www.almutawapharmacies.com/pub/media/catalog/product/cache/0ee050c3ffc3555709b9bb6062f4d7e9/1/4/145652.jpg', '2020-07-12 13:23:41', '2020-07-12 13:23:41');

-- --------------------------------------------------------

--
-- Table structure for table `drug_patient`
--

CREATE TABLE `drug_patient` (
  `patient_id` int(11) NOT NULL,
  `drug_id` int(11) NOT NULL,
  `dose` int(11) NOT NULL,
  `number_of_usage` int(11) NOT NULL,
  `notes` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `drug_patient`
--

INSERT INTO `drug_patient` (`patient_id`, `drug_id`, `dose`, `number_of_usage`, `notes`) VALUES
(1, 1, 1, 2, 'After eating'),
(1, 2, 2, 2, 'Nothing');

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
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
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
(11, '2014_10_12_100000_create_password_resets_table', 2),
(12, '2016_06_01_000001_create_oauth_auth_codes_table', 3),
(13, '2016_06_01_000002_create_oauth_access_tokens_table', 3),
(14, '2016_06_01_000003_create_oauth_refresh_tokens_table', 3),
(15, '2016_06_01_000004_create_oauth_clients_table', 3),
(16, '2016_06_01_000005_create_oauth_personal_access_clients_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('07ad1911b1a051d96190529ff4c2a6e5e1d6e96283c535945166fd1c75a304ba0363c1ced6ca202f', 7, 1, 'android', '[]', 0, '2020-07-15 11:28:31', '2020-07-15 11:28:31', '2080-07-15 14:28:31'),
('0d9be44ade1020d5ac259ead948e6b7957ea9cfa6733201c4d6578f6e2e63e3f48aedf3e03441a96', 10, 1, 'android', '[]', 0, '2020-07-15 13:29:36', '2020-07-15 13:29:36', '2080-07-15 16:29:36'),
('10b82c2b3db0e8e55c1afcd20d094cd3845bafe7da61e401de2cb3f4fc38fefea7cb7e9ea8b3db21', 4, 1, 'android', '[]', 0, '2020-07-12 07:55:23', '2020-07-12 07:55:23', '2080-07-12 10:55:23'),
('1818f1d4d8cbda7557d49746e78a31883f9baa38cbd8d0a0747b62c85759a366a3ba349ed5705ef2', 2, 1, 'android', '[]', 0, '2020-07-15 10:12:50', '2020-07-15 10:12:50', '2080-07-15 13:12:50'),
('182cc9fad08e6acb34d49fe36d9938cf4a0f44c67a12ea0161042f174999364003de67f7d3b903d4', 2, 1, 'android', '[]', 0, '2020-07-14 14:53:09', '2020-07-14 14:53:09', '2080-07-14 17:53:09'),
('1a0feb130d42b0dad7b1871cde7e1268c694a3cb15910cfd329f30b440a809e06ce836c7be97bf98', 3, 1, 'android', '[]', 0, '2020-07-15 11:43:40', '2020-07-15 11:43:40', '2080-07-15 14:43:40'),
('1f47463907f965cddfad96678d564d72214c9977adf3e689c20c8fe476ae51e43acb3a4787872e30', 4, 1, 'android', '[]', 0, '2020-07-12 08:01:17', '2020-07-12 08:01:17', '2080-07-12 11:01:17'),
('23d9cdd555249db29a75073b6239fd09e92482521f36540aecc430695b3c273d78625477f8f9e1fd', 2, 1, 'android', '[]', 0, '2020-07-15 10:12:38', '2020-07-15 10:12:38', '2080-07-15 13:12:38'),
('25aada0ae85e0c04cb83afff3096eaf803747865d35d313fcaee1e10175b1f61cb9e01872df32f3b', 4, 1, 'android', '[]', 0, '2020-07-12 08:07:05', '2020-07-12 08:07:05', '2080-07-12 11:07:04'),
('2b281100e0015e1e04940c7f2a6d3be68f0b9131b1514b762bb8b851efedb0b9365514e484f278f5', 3, 1, 'android', '[]', 0, '2020-07-15 10:52:49', '2020-07-15 10:52:49', '2080-07-15 13:52:49'),
('2f66fa3e0636d8c8f694c948cbb0b6603f7661c846fe8b6a6973de9382f80b8b573cc800204b313b', 4, 1, 'android', '[]', 0, '2020-07-12 08:06:51', '2020-07-12 08:06:51', '2080-07-12 11:06:51'),
('386f0be73090293413df12e4dff37cdb8719e1150b58dc47be04c0660a47d0307885b5bd03de6aef', 6, 1, 'android', '[]', 0, '2020-07-15 11:24:47', '2020-07-15 11:24:47', '2080-07-15 14:24:46'),
('3f8ce7315a1f0e545f4ac804bd2c2bf1c209f8a8f5054a5d07ef7e5253bda144a992d011dfeea417', 8, 1, 'android', '[]', 0, '2020-07-15 11:36:34', '2020-07-15 11:36:34', '2080-07-15 14:36:33'),
('4643d6e8fbd0462e30b6ce57b0fab314e0cc7cb21fc115e0a4d990ac1660ada3edbe731f7a92fa28', 4, 1, 'android', '[]', 0, '2020-07-12 07:59:56', '2020-07-12 07:59:56', '2080-07-12 10:59:56'),
('4c100d64d9408675006901948780c9ba920bf7f7ad5aa8a76c6db83a8120413daba92c0bf694051a', 5, 1, 'android', '[]', 0, '2020-07-15 11:21:42', '2020-07-15 11:21:42', '2080-07-15 14:21:42'),
('54c1f4e6243472ad8a51f7c269c88d112949d0783aaaecef5559eb25cbf5b95fc4a40941778b9173', 4, 1, 'android', '[]', 0, '2020-07-12 07:56:16', '2020-07-12 07:56:16', '2080-07-12 10:56:16'),
('5fd1aa504fe2f3dfcdcff722993bff00ee391d552469d248d50ee2b9472c581988482cd3afc8045d', 2, 1, 'android', '[]', 0, '2020-07-14 14:44:20', '2020-07-14 14:44:20', '2080-07-14 17:44:19'),
('6194f22b080b421cd0affad24ca6db447d53d871a5eb437bc6ff5beaabef772e526c812f5f4d4817', 10, 1, 'android', '[]', 0, '2020-07-15 13:31:28', '2020-07-15 13:31:28', '2080-07-15 16:31:28'),
('673649b40ea99adfaee6edc98be8497bb6d8c10a81e7ea8a2a08624a0ddf4031afd8eb46173d4c56', 2, 1, 'android', '[]', 0, '2020-07-13 17:28:20', '2020-07-13 17:28:20', '2080-07-13 20:28:19'),
('6b484766670e1cc034f73774a562fb2249e2c90bb1aaa1ab6dab85e4f861045375719e3a93fb9edf', 4, 1, 'android', '[]', 0, '2020-07-12 08:01:37', '2020-07-12 08:01:37', '2080-07-12 11:01:37'),
('80511fe32df291184d82ddd376ea24901fe2ae2e21741907e8c64c634556090a9c5f0c504f24b295', 2, 1, 'android', '[]', 0, '2020-07-14 14:44:30', '2020-07-14 14:44:30', '2080-07-14 17:44:30'),
('8e407d6eb5b7b8f08fc98c835f61a6f3e73f08afdf150ec2520a455d9dfc9a6ed8a2614c24e87faa', 9, 1, 'android', '[]', 0, '2020-07-15 11:38:34', '2020-07-15 11:38:34', '2080-07-15 14:38:34'),
('8f600105267ff8110fc1dee5b33153dfa6689e3edce07f3d0d4521642995b531b8a59d2e0a833ef2', 4, 1, 'android', '[]', 0, '2020-07-12 07:10:44', '2020-07-12 07:10:44', '2080-07-12 10:10:44'),
('8f7c61f920ef2ef33982ed6eb95fdefd28fc2c7969de9be18a877604d5898b44fe8b1244b6dd09ee', 4, 1, 'android', '[]', 0, '2020-07-12 07:54:19', '2020-07-12 07:54:19', '2080-07-12 10:54:19'),
('8ff32f6adb85391dddf057cc5e84f7a23112fcfeec5283ee146ae60acb9772257d6e84c7d201b252', 4, 1, 'android', '[]', 0, '2020-07-12 07:59:30', '2020-07-12 07:59:30', '2080-07-12 10:59:29'),
('95966353abbab4682cb0b79e133bad981e175297e696ead7a8a813b2aa0ca6a8d9bebce487b162ef', 4, 1, 'android', '[]', 0, '2020-07-12 08:07:37', '2020-07-12 08:07:37', '2080-07-12 11:07:36'),
('9c34f36a660eeb1e13029446a32cbc2b805ef6cce3e628d60077216c2d6f8869ead453d13af75175', 4, 1, 'android', '[]', 0, '2020-07-12 07:11:53', '2020-07-12 07:11:53', '2080-07-12 10:11:52'),
('9c782c863ff5c71bf880c4de538d1c9162720982ccb985b11e1b33226c61af367a436ab643a03086', 4, 1, 'android', '[]', 0, '2020-07-12 08:12:54', '2020-07-12 08:12:54', '2080-07-12 11:12:54'),
('a3beeaaa03c40f1b8ce6ba2c4296a82b7ef97a16d86d34b566e18ffc47db97da89d89b1d603d224a', 2, 1, 'android', '[]', 0, '2020-07-13 17:27:31', '2020-07-13 17:27:31', '2080-07-13 20:27:31'),
('a543214bf6e586e039eb602e9624f481d4c239dfa3a97d509f823a90acdd368bfcea8630991313f4', 2, 1, 'android', '[]', 0, '2020-07-13 17:35:05', '2020-07-13 17:35:05', '2080-07-13 20:35:05'),
('a575ca0624d7f7d971635b0f61a812b7f411b295410ed25c607e8cd34285d019c036a84ee1cd1639', 4, 1, 'android', '[]', 0, '2020-07-12 08:10:42', '2020-07-12 08:10:42', '2080-07-12 11:10:42'),
('abc223fbe2067044720da1edd740d2084fcd67a0364492f33553ccdff84a4ae66e2912040491c090', 1, 1, 'android', '[]', 0, '2020-07-13 11:19:08', '2020-07-13 11:19:08', '2080-07-13 14:19:08'),
('b61acf25bdc1a573d3112b78cd75af2251fdfed7258bc53e9298e133d03049298ad12a1c37c7e6f4', 4, 1, 'android', '[]', 0, '2020-07-12 08:07:21', '2020-07-12 08:07:21', '2080-07-12 11:07:21'),
('c6dc7894407b4f679483590685617aad6430f73df3cff7aac214dde1c61648001a6127dd5b60043f', 4, 1, 'android', '[]', 0, '2020-07-12 07:49:34', '2020-07-12 07:49:34', '2080-07-12 10:49:34'),
('c7f58f6816fdbe4386de96b6213d4517c741d992a637ea80e55fd9a04c46c38f8f45729d2e5e52a9', 2, 1, 'android', '[]', 0, '2020-07-13 17:34:07', '2020-07-13 17:34:07', '2080-07-13 20:34:07'),
('c838c4784ddad6eb92ff5449a01808c2368df38f3a01f6d3b325abe4fa1570dc16bb66a77ef7318e', 4, 1, 'android', '[]', 0, '2020-07-12 07:54:25', '2020-07-12 07:54:25', '2080-07-12 10:54:25'),
('c9e531017ebaa6a55e76016b01099f827121892eab925d3630952e3afce4f8ac9de918da83e77de0', 4, 1, 'android', '[]', 0, '2020-07-15 11:09:25', '2020-07-15 11:09:25', '2080-07-15 14:09:25'),
('ccebc0b12768a403498773bd98de1ec08ae3631ab622d7d144e2e559e7955962beb0fb354c493527', 2, 1, 'android', '[]', 0, '2020-07-14 14:49:38', '2020-07-14 14:49:38', '2080-07-14 17:49:38'),
('cd565befc5ac1c5d2299a8a6ee4bb7b993fcf7eba5ddd3e7c24a0cb3262035baa4ba436cb961ace9', 2, 1, 'android', '[]', 0, '2020-07-14 15:12:52', '2020-07-14 15:12:52', '2080-07-14 18:12:52'),
('d3be92f81ef5a36b0068e0c6b30346504f153f958de50b110ec3042ecb0a7767bdfbefb4a4b75081', 4, 1, 'android', '[]', 0, '2020-07-12 07:59:13', '2020-07-12 07:59:13', '2080-07-12 10:59:12'),
('d5f5f803afa13c174ed8022309f3267e55df5815e6c54d4ce367801fdd77ee2207e0f0c760ce8d86', 2, 1, 'android', '[]', 0, '2020-07-14 14:50:54', '2020-07-14 14:50:54', '2080-07-14 17:50:54'),
('eb868cadc7bd80c66908a59fef05484cc383ab5c9e9f46c740632eb38b6b4af6dc4a5b037d4fe206', 4, 1, 'android', '[]', 0, '2020-07-12 08:00:29', '2020-07-12 08:00:29', '2080-07-12 11:00:28'),
('f5c50e2c7709a0b821fe2d014e7b00f475f77898cf28d7770393e9a631888379c3cb4ddf3eccff5c', 4, 1, 'android', '[]', 0, '2020-07-12 07:56:32', '2020-07-12 07:56:32', '2080-07-12 10:56:32'),
('f75821d97bdb93278805d1b33871731f8f89c8fbdfc057e41f1e25b47c6200e6999278fb96b74e8d', 4, 1, 'android', '[]', 0, '2020-07-12 07:55:01', '2020-07-12 07:55:01', '2080-07-12 10:55:01'),
('fa2e68b63d85273e300a1373a5d78ee4d8f53dae7b5077748f5220279a1129bf3ca3f9caa4f20a72', 8, 1, 'android', '[]', 0, '2020-07-15 11:35:19', '2020-07-15 11:35:19', '2080-07-15 14:35:19');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'Q2CyzvCQqjq5lMp9yC0lnB5XkZECVHnTsNsXHCYH', NULL, 'http://localhost', 1, 0, 0, '2020-07-11 19:01:16', '2020-07-11 19:01:16'),
(2, NULL, 'Laravel Password Grant Client', 'fOdIgi5jlx95cIqtZZ9j0yc0j7lNc8YnQFI0stYf', 'users', 'http://localhost', 0, 1, 0, '2020-07-11 19:01:16', '2020-07-11 19:01:16');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2020-07-11 19:01:16', '2020-07-11 19:01:16');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `identity_num` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` int(11) NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birthdate` date NOT NULL,
  `gender` enum('male','female') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`id`, `identity_num`, `name`, `username`, `password`, `mobile`, `address`, `birthdate`, `gender`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 800348492, 'Mahmood S. Nassar', 'mahmoodnassar', '$2y$10$CCKgzsl1uQ8uDBtvoxCgWutPjZE30xLcPG8ApXa4NCm0gU66g0d22', 598123901, 'Gaza, Ahmad yaseen stree', '1998-05-01', 'male', '2020-07-13 14:18:53', '2020-07-14 14:13:45', NULL),
(2, 403768229, 'Hamza abuabada', 'hamzaabada', '$2y$10$i4Va8GnHnUCPOx9d0Q2.Yu9m8psqljU9L75cDAH16YZR6uURSNIue', 595381955, 'Gaza, Assaftawy, Ahmad yaseen street', '1998-05-01', 'male', '2020-07-13 20:27:31', '2020-07-13 20:27:31', NULL),
(3, 123789456, 'kamal abuabad', 'kamalabuabada', '$2y$10$Nt0oJq6yv1DYELqO7FPT8OUfv.L105OF/F.WA1x4AeDyGDT0rlg/K', 599608381, 'aljala gaza', '2000-07-15', 'male', '2020-07-15 13:52:49', '2020-07-15 13:52:49', NULL),
(4, 258369147, 'ahmad kamal', 'ahmadkamal', '$2y$10$jcDGH70/t7EVGy1/pVUKYOyUMuEaq32UZBW6wUQjnFiVYQ2/YTb/6', 592266345, 'aljala street', '2020-12-01', 'male', '2020-07-15 14:09:25', '2020-07-15 14:09:25', NULL),
(5, 123456214, 'ahmad abuabada', 'ahmad abadah', '$2y$10$YgrZWzulmvSqeNYELZ8Q9O4P9aZ0TdgX4McaJYKywN9mtkkZvM4tm', 591230588, 'aljala street', '2020-07-01', 'male', '2020-07-15 14:21:42', '2020-07-15 14:21:42', NULL),
(6, 147085324, 'ahmad abuabada', 'ahmadabadah', '$2y$10$4kirvrV/7uv29fxyIZUr9OYsY8f/UzEr.M6jrVhBDcI.sIeJm.LmO', 591230577, 'aljala street', '2020-07-01', 'male', '2020-07-15 14:24:46', '2020-07-15 14:24:46', NULL),
(7, 402356987, 'mohammed kamal', 'mhmdkamal', '$2y$10$kQmRawbkFHxbC/RQQG2m0.cDtlPdmIBgue6/6KCWA4I39K6efeqUu', 597014944, 'aljala street', '2020-07-01', 'male', '2020-07-15 14:28:31', '2020-07-15 14:28:31', NULL),
(8, 904234568, 'hedayakamal', 'hedayakamalabada', '$2y$10$smXIstd7WKYI0iyyXKpgzucTXHhqZ0LwvsZL/6PuRBfbwPOmVCE6q', 592583691, 'aljala street', '2019-03-01', 'male', '2020-07-15 14:35:19', '2020-07-15 14:35:19', NULL),
(9, 902345698, 'lila kamal abuabada', 'lilaabada', '$2y$10$MUOkNCkU2QkPzUoI0DZJh.MEhc2OxMlZ827QiMgt26gw5TiLcEW6S', 599860971, 'aljala street', '2020-07-30', 'female', '2020-07-15 14:38:34', '2020-07-15 14:38:34', NULL),
(10, 412267825, 'Khaled Awwad', 'khaled', '$2y$10$BQSSizaMk.4bT5R33fvQguHmvuebgf0KztAS4yqvJWAA2Hqth5ALq', 592496300, 'Gaza, Assaftawy, Ahmad yaseen street', '1998-03-11', 'male', '2020-07-15 16:29:36', '2020-07-15 16:29:36', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `patient_visits`
--

CREATE TABLE `patient_visits` (
  `doctor_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `visit_at` date NOT NULL,
  `next_visit_at` date DEFAULT NULL
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
-- Indexes for table `doctor_patient`
--
ALTER TABLE `doctor_patient`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `patient_id` (`patient_id`,`doctor_id`,`visit_at`);

--
-- Indexes for table `drugs`
--
ALTER TABLE `drugs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `drug_patient`
--
ALTER TABLE `drug_patient`
  ADD KEY `patient_id` (`patient_id`),
  ADD KEY `drug_id` (`drug_id`);

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
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
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
-- Indexes for table `patient_visits`
--
ALTER TABLE `patient_visits`
  ADD KEY `patient_id` (`patient_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `clinics`
--
ALTER TABLE `clinics`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `doctors`
--
ALTER TABLE `doctors`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `doctor_patient`
--
ALTER TABLE `doctor_patient`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `drugs`
--
ALTER TABLE `drugs`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

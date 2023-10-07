-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 07, 2023 at 02:05 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `isifs`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(80) DEFAULT NULL,
  `phone` varchar(25) DEFAULT NULL,
  `admin_role_id` bigint(20) NOT NULL DEFAULT 2,
  `image` varchar(30) NOT NULL DEFAULT 'def.png',
  `email` varchar(80) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(80) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `phone`, `admin_role_id`, `image`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `status`) VALUES
(1, 'admin@admin.com', '01773470176', 1, '2023-10-04-651ce2dc4c66e.png', 'admin@admin.com', NULL, '$2y$10$sP63E2BCcnG/YcYK5c53Je2G/zvUFbw4R6/4ykwIVYNBrvd11AUFa', 'sCv8XCH9aGFdB6mYoNPCytynclJO8t480sVfFBYnnGibpBBnhF9wDkrPiw32', '2023-08-05 16:45:50', '2023-10-04 16:58:20', 1),
(2, 'rakib', '01977722535', 7, '2023-10-05-651dab9134fa7.png', 'kashmirsherwani@gmail.com', NULL, '$2y$10$vTdg1rMyXEghfDx3b3GfK.OQo9/3DOHZzO2ymuu7g.9NKtpPznm5m', NULL, '2023-10-05 07:14:41', '2023-10-05 07:14:41', 1);

-- --------------------------------------------------------

--
-- Table structure for table `admin_roles`
--

CREATE TABLE `admin_roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `module_access` varchar(250) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_roles`
--

INSERT INTO `admin_roles` (`id`, `name`, `module_access`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Master Admin', NULL, 1, NULL, NULL),
(7, 'showroom', '[\"dashboard\",\"order_management\",\"product_management\",\"promotion_management\",\"support_section\",\"report\"]', 1, '2023-10-05 07:11:42', '2023-10-05 07:11:42');

-- --------------------------------------------------------

--
-- Table structure for table `admin_wallets`
--

CREATE TABLE `admin_wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` bigint(20) DEFAULT NULL,
  `inhouse_earning` double NOT NULL DEFAULT 0,
  `withdrawn` double NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `commission_earned` double(8,2) NOT NULL DEFAULT 0.00,
  `delivery_charge_earned` double(8,2) NOT NULL DEFAULT 0.00,
  `pending_amount` double(8,2) NOT NULL DEFAULT 0.00,
  `total_tax_collected` double(8,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_wallets`
--

INSERT INTO `admin_wallets` (`id`, `admin_id`, `inhouse_earning`, `withdrawn`, `created_at`, `updated_at`, `commission_earned`, `delivery_charge_earned`, `pending_amount`, `total_tax_collected`) VALUES
(1, 1, 0, 0, NULL, NULL, 0.00, 0.00, 0.00, 0.00),
(2, 1, 0, 0, '2023-08-05 16:45:50', '2023-08-05 16:45:50', 0.00, 0.00, 0.00, 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `admin_wallet_histories`
--

CREATE TABLE `admin_wallet_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` bigint(20) DEFAULT NULL,
  `amount` double NOT NULL DEFAULT 0,
  `order_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `payment` varchar(191) NOT NULL DEFAULT 'received',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attributes`
--

CREATE TABLE `attributes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attributes`
--

INSERT INTO `attributes` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'color', '2023-10-04 17:03:36', '2023-10-04 17:03:36'),
(2, 'white', '2023-10-05 05:46:38', '2023-10-05 05:46:38'),
(3, 'Golden', '2023-10-05 05:46:47', '2023-10-05 05:46:47'),
(4, 'Black', '2023-10-05 05:46:59', '2023-10-05 05:46:59'),
(5, 'Mehrun', '2023-10-05 05:47:08', '2023-10-05 05:47:08'),
(6, 'Olive', '2023-10-05 05:47:28', '2023-10-05 05:47:28'),
(7, 'Ash', '2023-10-05 05:47:36', '2023-10-05 05:47:36'),
(8, 'Pink', '2023-10-05 05:47:55', '2023-10-05 05:47:55'),
(9, 'Red', '2023-10-05 05:49:03', '2023-10-05 05:49:03'),
(10, 'S-38', '2023-10-05 06:40:54', '2023-10-05 06:41:54'),
(11, 'M-40', '2023-10-05 06:41:02', '2023-10-05 06:42:24'),
(12, 'L-42', '2023-10-05 06:43:29', '2023-10-05 06:43:29'),
(13, 'XL-44', '2023-10-05 06:43:36', '2023-10-05 06:43:36'),
(14, 'XXL-46', '2023-10-05 06:43:59', '2023-10-05 06:43:59'),
(15, 'BABY-20', '2023-10-05 06:45:03', '2023-10-05 06:45:03'),
(16, 'BABY-22', '2023-10-05 06:45:11', '2023-10-05 06:45:11'),
(17, 'BABY-24', '2023-10-05 06:45:21', '2023-10-05 06:45:21'),
(18, 'BABY-26', '2023-10-05 06:45:36', '2023-10-05 06:45:36'),
(19, 'BOYS-28', '2023-10-05 06:45:55', '2023-10-05 06:45:55'),
(20, 'BOYS-30', '2023-10-05 06:46:05', '2023-10-05 06:46:05'),
(21, 'BOYS-32', '2023-10-05 06:46:14', '2023-10-05 06:46:14'),
(22, 'BOYS-34', '2023-10-05 06:46:23', '2023-10-05 06:46:23'),
(23, 'BOYS-36', '2023-10-05 06:46:34', '2023-10-05 06:46:34'),
(24, 'SMALL-38', '2023-10-05 06:46:50', '2023-10-05 06:46:50'),
(25, 'YOUNG-38', '2023-10-05 06:47:04', '2023-10-05 06:47:04');

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `banner_type` varchar(255) NOT NULL,
  `published` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `resource_type` varchar(191) DEFAULT NULL,
  `resource_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `photo`, `banner_type`, `published`, `created_at`, `updated_at`, `url`, `resource_type`, `resource_id`) VALUES
(3, '2023-08-13-64d8b92fbb311.png', 'Footer Banner', 1, '2023-08-06 11:12:03', '2023-08-13 22:06:23', 'https://techwebdit.com/', 'product', 1),
(4, '2023-08-13-64d8b906dd23c.png', 'Popup Banner', 1, '2023-08-06 11:12:19', '2023-08-13 22:05:42', 'https://techwebdit.com/', 'product', 1),
(5, '2023-08-13-64d8b8fedf788.png', 'Main Section Banner', 1, '2023-08-06 11:12:33', '2023-08-13 22:05:34', 'https://techwebdit.com/', 'product', 1),
(6, '2023-08-13-64d8b8f75dabe.png', 'Footer Banner', 1, '2023-08-06 11:13:13', '2023-08-13 22:05:27', 'https://techwebdit.com/', 'product', 1),
(7, '2023-08-13-64d8b8ee49336.png', 'Main Section Banner', 1, '2023-08-06 11:19:06', '2023-08-13 22:05:18', 'https://techwebdit.com/', 'product', 1),
(8, '2023-08-20-64e10577c529a.png', 'Main Banner', 1, '2023-08-06 11:19:17', '2023-08-20 05:10:35', 'https://isfifashion.com/', 'category', 4),
(9, '2023-08-13-64d8b8dbdbaea.png', 'Main Banner', 1, '2023-08-10 03:09:59', '2023-08-13 22:04:59', 'https://techwebdit.com/', 'product', 1),
(10, '2023-08-19-64dfbfcc256f3.png', 'Main Section Banner', 1, '2023-08-10 03:10:37', '2023-08-19 06:00:28', 'https://isfifashion.com/', 'category', 1);

-- --------------------------------------------------------

--
-- Table structure for table `billing_addresses`
--

CREATE TABLE `billing_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `contact_person_name` varchar(191) DEFAULT NULL,
  `address_type` varchar(191) DEFAULT NULL,
  `address` varchar(191) DEFAULT NULL,
  `city` varchar(191) DEFAULT NULL,
  `zip` varchar(191) DEFAULT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `state` varchar(191) DEFAULT NULL,
  `country` varchar(191) DEFAULT NULL,
  `latitude` varchar(191) DEFAULT NULL,
  `longitude` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `image` varchar(50) NOT NULL DEFAULT 'def.png',
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `image`, `status`, `created_at`, `updated_at`) VALUES
(3, 'Polite fashion', 'def.png', 1, '2023-10-05 05:44:32', '2023-10-05 05:44:32'),
(5, 'Kashmir sherwani', 'def.png', 1, '2023-10-05 05:46:09', '2023-10-05 05:46:09');

-- --------------------------------------------------------

--
-- Table structure for table `business_settings`
--

CREATE TABLE `business_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(50) NOT NULL,
  `value` longtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `business_settings`
--

INSERT INTO `business_settings` (`id`, `type`, `value`, `created_at`, `updated_at`) VALUES
(1, 'system_default_currency', '2', '2020-10-11 07:43:44', '2023-08-15 03:09:28'),
(2, 'language', '[{\"id\":\"1\",\"name\":\"english\",\"direction\":\"ltr\",\"code\":\"en\",\"status\":1,\"default\":false},{\"id\":2,\"name\":\"bangla\",\"direction\":\"ltr\",\"code\":\"bd\",\"status\":1,\"default\":true}]', '2020-10-11 07:53:02', '2023-08-26 20:26:45'),
(3, 'mail_config', '{\"status\":0,\"name\":\"demo\",\"host\":\"mail.demo.com\",\"driver\":\"SMTP\",\"port\":\"587\",\"username\":\"info@demo.com\",\"email_id\":\"info@demo.com\",\"encryption\":\"TLS\",\"password\":\"demo\"}', '2020-10-12 10:29:18', '2021-07-06 12:32:01'),
(4, 'cash_on_delivery', '{\"status\":\"1\"}', NULL, '2023-08-28 00:01:57'),
(6, 'ssl_commerz_payment', '{\"status\":\"0\",\"environment\":\"sandbox\",\"store_id\":\"\",\"store_password\":\"\"}', '2020-11-09 08:36:51', '2023-01-10 05:51:56'),
(7, 'paypal', '{\"status\":\"0\",\"environment\":\"sandbox\",\"paypal_client_id\":\"\",\"paypal_secret\":\"\"}', '2020-11-09 08:51:39', '2023-01-10 05:51:56'),
(8, 'stripe', '{\"status\":\"0\",\"api_key\":null,\"published_key\":null}', '2020-11-09 09:01:47', '2021-07-06 12:30:05'),
(10, 'company_phone', '880 1768-737475', NULL, '2020-12-08 14:15:01'),
(11, 'company_name', 'kashmir sherwani', NULL, '2021-02-27 18:11:53'),
(12, 'company_web_logo', '2023-09-28-65156a71aebb1.png', NULL, '2023-09-29 00:58:41'),
(13, 'company_mobile_logo', '2023-09-28-65156aae46c84.png', NULL, '2023-09-29 00:59:42'),
(14, 'terms_condition', '<h1>Terms and Conditions</h1>\r\n\r\n<p>1. INTRODUCTION</p>\r\n\r\n<p>Welcome to Isfifashion also hereby known as &ldquo;we&quot;, &quot;us&quot; or &quot;Isfifashion&quot;. We are an online marketplace and these are the terms and conditions governing your access and use of Isfifashion along with its related sub-domains, sites, mobile app, services and tools (the &quot;Site&quot;). By using the Site, you hereby accept these terms and conditions (including the linked information herein) and represent that you agree to comply with these terms and conditions (the &quot;User Agreement&quot;). This User Agreement is deemed effective upon your use of the Site which signifies your acceptance of these terms. If you do not agree to be bound by this User Agreement please do not access, register with or use this Site. This Site is owned and operated by&nbsp;Isfifashion<strong>Bangladesh Limited, a company incorporated under the Companies Act, 1994, .</strong><br />\r\n<br />\r\nThe Site reserves the right to change, modify, add, or remove portions of these Terms and Conditions at any time without any prior notification. Changes will be effective when posted on the Site with no other notice provided. Please check these Terms and Conditions regularly for updates. Your continued use of the Site following the posting of changes to Terms and Conditions of use constitutes your acceptance of those changes.</p>\r\n\r\n<p><a href=\"https://www.daraz.com.bd/wow/i/bd/help-pages/terms-and-conditions/?spm=a2a0e.11884642.footer_top.5.2f93d82erHndFT&amp;scm=1003.4.icms-zebra-100022982-6850452.OTHER_6502233778_7696023#terms\">Back to Top</a><br />\r\n&nbsp;</p>\r\n\r\n<p>2. CONDITIONS OF USE</p>\r\n\r\n<p>A. YOUR ACCOUNT</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>To access certain services offered by the platform, we may require that you create an account with us or provide personal information to complete the creation of an account. We may at any time in our sole and absolute discretion, invalidate the username and/or password without giving any reason or prior notice and shall not be liable or responsible for any losses suffered by, caused by, arising out of, in connection with or by reason of such request or invalidation.<br />\r\n<br />\r\nYou are responsible for maintaining the confidentiality of your user identification, password, account details and related private information. You agree to accept this responsibility and ensure your account and its related details are maintained securely at all times and all necessary steps are taken to prevent misuse of your account. You should inform us immediately if you have any reason to believe that your password has become known to anyone else, or if the password is being, or is likely to be, used in an unauthorized manner. You agree and acknowledge that any use of the Site and related services offered and/or any access to private information, data or communications using your account and password shall be deemed to be either performed by you or authorized by you as the case may be. You agree to be bound by any access of the Site and/or use of any services offered by the Site (whether such access or use are authorized by you or not). You agree that we shall be entitled (but not obliged) to act upon, rely on or hold you solely responsible and liable in respect thereof as if the same were carried out or transmitted by you. You further agree and acknowledge that you shall be bound by and agree to fully indemnify us against any and all losses arising from the use of or access to the Site through your account.<br />\r\n<br />\r\nPlease ensure that the details you provide us with are correct and complete at all times. You are obligated to update details about your account in real time by accessing your account online. For pieces of information you are not able to update by accessing Your Account on the Site, you must inform us via our customer service communication channels to assist you with these changes. We reserve the right to refuse access to the Site, terminate accounts, remove or edit content at any time without prior notice to you. We may at any time in our sole and absolute discretion, request that you update your Personal Data or forthwith invalidate the account or related details without giving any reason or prior notice and shall not be liable or responsible for any losses suffered by or caused by you or arising out of or in connection with or by reason of such request or invalidation. You hereby agree to change your password from time to time and to keep your account secure and also shall be responsible for the confidentiality of your account and liable for any disclosure or use (whether such use is authorised or not) of the username and/or password.</p>\r\n\r\n<p>&nbsp;</p>', NULL, '2023-08-28 02:38:05'),
(15, 'about_us', '<p>this is about us page. hello and hi from about page description..</p>', NULL, '2021-06-11 01:42:53'),
(16, 'sms_nexmo', '{\"status\":\"0\",\"nexmo_key\":\"custo5cc042f7abf4c\",\"nexmo_secret\":\"custo5cc042f7abf4c@ssl\"}', NULL, NULL),
(17, 'company_email', 'kashmirsherwani@gmail.com', NULL, '2021-03-15 12:29:51'),
(18, 'colors', '{\"primary\":\"#f9ad2b\",\"secondary\":\"#d62c36\"}', '2020-10-11 13:53:02', '2023-09-29 01:04:36'),
(19, 'company_footer_logo', '2023-09-28-65156aae4931f.png', NULL, '2023-09-29 00:59:42'),
(20, 'company_copyright_text', 'CopyRight kashmirsherwani@2023', NULL, '2021-03-15 12:30:47'),
(21, 'download_app_apple_stroe', '{\"status\":\"1\",\"link\":\"scs\"}', NULL, '2023-08-06 01:39:30'),
(22, 'download_app_google_stroe', '{\"status\":\"1\",\"link\":\"https:\\/\\/play.google.com\\/store?hl=en_US&gl=US\"}', NULL, '2020-12-08 12:54:48'),
(23, 'company_fav_icon', '2023-09-28-65156aae4ad89.png', '2020-10-11 13:53:02', '2023-09-29 00:59:42'),
(24, 'fcm_topic', '', NULL, NULL),
(25, 'fcm_project_id', '', NULL, NULL),
(26, 'push_notification_key', 'Put your firebase server key here.', NULL, NULL),
(27, 'order_pending_message', '{\"status\":\"1\",\"message\":\"order pen message\"}', NULL, NULL),
(28, 'order_confirmation_msg', '{\"status\":\"1\",\"message\":\"Order con Message\"}', NULL, NULL),
(29, 'order_processing_message', '{\"status\":\"1\",\"message\":\"Order pro Message\"}', NULL, NULL),
(30, 'out_for_delivery_message', '{\"status\":\"1\",\"message\":\"Order ouut Message\"}', NULL, NULL),
(31, 'order_delivered_message', '{\"status\":\"1\",\"message\":\"Order del Message\"}', NULL, NULL),
(32, 'razor_pay', '{\"status\":\"0\",\"razor_key\":null,\"razor_secret\":null}', NULL, '2021-07-06 12:30:14'),
(33, 'sales_commission', '0', NULL, '2021-06-11 18:13:13'),
(34, 'seller_registration', '1', NULL, '2021-06-04 21:02:48'),
(35, 'pnc_language', '[\"en\",\"bd\"]', NULL, NULL),
(36, 'order_returned_message', '{\"status\":\"1\",\"message\":\"Order hh Message\"}', NULL, NULL),
(37, 'order_failed_message', '{\"status\":null,\"message\":\"Order fa Message\"}', NULL, NULL),
(40, 'delivery_boy_assign_message', '{\"status\":0,\"message\":\"\"}', NULL, NULL),
(41, 'delivery_boy_start_message', '{\"status\":0,\"message\":\"\"}', NULL, NULL),
(42, 'delivery_boy_delivered_message', '{\"status\":0,\"message\":\"\"}', NULL, NULL),
(43, 'terms_and_conditions', '', NULL, NULL),
(44, 'minimum_order_value', '1', NULL, NULL),
(45, 'privacy_policy', '<h1>my privacy policy</h1>\r\n\r\n<p>&amp;</p>\r\n\r\n<h1>Privacy Policy</h1>\r\n\r\n<p>Last updated: August 20, 2023</p>\r\n\r\n<p>This Privacy Policy describes Our policies and procedures on the collection, use and disclosure of Your information when You use the Service and tells You about Your privacy rights and how the law protects You.</p>\r\n\r\n<p>We use Your Personal data to provide and improve the Service. By using the Service, You agree to the collection and use of information in accordance with this Privacy Policy. This Privacy Policy has been created with the help of the <a href=\"https://www.freeprivacypolicy.com/free-privacy-policy-generator/\" target=\"_blank\">Free Privacy Policy Generator</a>.</p>\r\n\r\n<h1>Interpretation and Definitions</h1>\r\n\r\n<h2>Interpretation</h2>\r\n\r\n<p>The words of which the initial letter is capitalized have meanings defined under the following conditions. The following definitions shall have the same meaning regardless of whether they appear in singular or in plural.</p>\r\n\r\n<h2>Definitions</h2>\r\n\r\n<p>For the purposes of this Privacy Policy:</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p><strong>Account</strong> means a unique account created for You to access our Service or parts of our Service.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Affiliate</strong> means an entity that controls, is controlled by or is under common control with a party, where &quot;control&quot; means ownership of 50% or more of the shares, equity interest or other securities entitled to vote for election of directors or other managing authority.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Application</strong> refers to Isfi fashion, the software program provided by the Company.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Company</strong> (referred to as either &quot;the Company&quot;, &quot;We&quot;, &quot;Us&quot; or &quot;Our&quot; in this Agreement) refers to Isfi Fashion E Commerce business, House/Flat#2423, Dakkhin khan, Hazi camp, Airport 1229.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Cookies</strong> are small files that are placed on Your computer, mobile device or any other device by a website, containing the details of Your browsing history on that website among its many uses.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Country</strong> refers to: Bangladesh</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Device</strong> means any device that can access the Service such as a computer, a cellphone or a digital tablet.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Personal Data</strong> is any information that relates to an identified or identifiable individual.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Service</strong> refers to the Application or the Website or both.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Service Provider</strong> means any natural or legal person who processes the data on behalf of the Company. It refers to third-party companies or individuals employed by the Company to facilitate the Service, to provide the Service on behalf of the Company, to perform services related to the Service or to assist the Company in analyzing how the Service is used.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Third-party Social Media Service</strong> refers to any website or any social network website through which a User can log in or create an account to use the Service.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Usage Data</strong> refers to data collected automatically, either generated by the use of the Service or from the Service infrastructure itself (for example, the duration of a page visit).</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Website</strong> refers to Isfi Fashion, accessible from <a href=\"http://isfifashion.com/\" target=\"_blank\">http://isfifashion.com/</a></p>\r\n	</li>\r\n	<li>\r\n	<p><strong>You</strong> means the individual accessing or using the Service, or the company, or other legal entity on behalf of which such individual is accessing or using the Service, as applicable.</p>\r\n	</li>\r\n</ul>\r\n\r\n<h1>Collecting and Using Your Personal Data</h1>\r\n\r\n<h2>Types of Data Collected</h2>\r\n\r\n<h3>Personal Data</h3>\r\n\r\n<p>While using Our Service, We may ask You to provide Us with certain personally identifiable information that can be used to contact or identify You. Personally identifiable information may include, but is not limited to:</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>Email address</p>\r\n	</li>\r\n	<li>\r\n	<p>Phone number</p>\r\n	</li>\r\n	<li>\r\n	<p>Address, State, Province, ZIP/Postal code, City</p>\r\n	</li>\r\n	<li>\r\n	<p>Usage Data</p>\r\n	</li>\r\n</ul>\r\n\r\n<h3>Usage Data</h3>\r\n\r\n<p>Usage Data is collected automatically when using the Service.</p>\r\n\r\n<p>Usage Data may include information such as Your Device&#39;s Internet Protocol address (e.g. IP address), browser type, browser version, the pages of our Service that You visit, the time and date of Your visit, the time spent on those pages, unique device identifiers and other diagnostic data.</p>\r\n\r\n<p>When You access the Service by or through a mobile device, We may collect certain information automatically, including, but not limited to, the type of mobile device You use, Your mobile device unique ID, the IP address of Your mobile device, Your mobile operating system, the type of mobile Internet browser You use, unique device identifiers and other diagnostic data.</p>\r\n\r\n<p>We may also collect information that Your browser sends whenever You visit our Service or when You access the Service by or through a mobile device.</p>\r\n\r\n<h3>Information from Third-Party Social Media Services</h3>\r\n\r\n<p>The Company allows You to create an account and log in to use the Service through the following Third-party Social Media Services:</p>\r\n\r\n<ul>\r\n	<li>Google</li>\r\n	<li>Facebook</li>\r\n	<li>Instagram</li>\r\n	<li>Twitter</li>\r\n	<li>LinkedIn</li>\r\n</ul>\r\n\r\n<p>If You decide to register through or otherwise grant us access to a Third-Party Social Media Service, We may collect Personal data that is already associated with Your Third-Party Social Media Service&#39;s account, such as Your name, Your email address, Your activities or Your contact list associated with that account.</p>\r\n\r\n<p>You may also have the option of sharing additional information with the Company through Your Third-Party Social Media Service&#39;s account. If You choose to provide such information and Personal Data, during registration or otherwise, You are giving the Company permission to use, share, and store it in a manner consistent with this Privacy Policy.</p>\r\n\r\n<h3>Information Collected while Using the Application</h3>\r\n\r\n<p>While using Our Application, in order to provide features of Our Application, We may collect, with Your prior permission:</p>\r\n\r\n<ul>\r\n	<li>Information regarding your location</li>\r\n	<li>Information from your Device&#39;s phone book (contacts list)</li>\r\n	<li>Pictures and other information from your Device&#39;s camera and photo library</li>\r\n</ul>\r\n\r\n<p>We use this information to provide features of Our Service, to improve and customize Our Service. The information may be uploaded to the Company&#39;s servers and/or a Service Provider&#39;s server or it may be simply stored on Your device.</p>\r\n\r\n<p>You can enable or disable access to this information at any time, through Your Device settings.</p>\r\n\r\n<h3>Tracking Technologies and Cookies</h3>\r\n\r\n<p>We use Cookies and similar tracking technologies to track the activity on Our Service and store certain information. Tracking technologies used are beacons, tags, and scripts to collect and track information and to improve and analyze Our Service. The technologies We use may include:</p>\r\n\r\n<ul>\r\n	<li><strong>Cookies or Browser Cookies.</strong> A cookie is a small file placed on Your Device. You can instruct Your browser to refuse all Cookies or to indicate when a Cookie is being sent. However, if You do not accept Cookies, You may not be able to use some parts of our Service. Unless you have adjusted Your browser setting so that it will refuse Cookies, our Service may use Cookies.</li>\r\n	<li><strong>Web Beacons.</strong> Certain sections of our Service and our emails may contain small electronic files known as web beacons (also referred to as clear gifs, pixel tags, and single-pixel gifs) that permit the Company, for example, to count users who have visited those pages or opened an email and for other related website statistics (for example, recording the popularity of a certain section and verifying system and server integrity).</li>\r\n</ul>\r\n\r\n<p>Cookies can be &quot;Persistent&quot; or &quot;Session&quot; Cookies. Persistent Cookies remain on Your personal computer or mobile device when You go offline, while Session Cookies are deleted as soon as You close Your web browser. Learn more about cookies on the <a href=\"https://www.freeprivacypolicy.com/blog/sample-privacy-policy-template/#Use_Of_Cookies_And_Tracking\" target=\"_blank\">Free Privacy Policy website</a> article.</p>\r\n\r\n<p>We use both Session and Persistent Cookies for the purposes set out below:</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p><strong>Necessary / Essential Cookies</strong></p>\r\n\r\n	<p>Type: Session Cookies</p>\r\n\r\n	<p>Administered by: Us</p>\r\n\r\n	<p>Purpose: These Cookies are essential to provide You with services available through the Website and to enable You to use some of its features. They help to authenticate users and prevent fraudulent use of user accounts. Without these Cookies, the services that You have asked for cannot be provided, and We only use these Cookies to provide You with those services.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Cookies Policy / Notice Acceptance Cookies</strong></p>\r\n\r\n	<p>Type: Persistent Cookies</p>\r\n\r\n	<p>Administered by: Us</p>\r\n\r\n	<p>Purpose: These Cookies identify if users have accepted the use of cookies on the Website.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Functionality Cookies</strong></p>\r\n\r\n	<p>Type: Persistent Cookies</p>\r\n\r\n	<p>Administered by: Us</p>\r\n\r\n	<p>Purpose: These Cookies allow us to remember choices You make when You use the Website, such as remembering your login details or language preference. The purpose of these Cookies is to provide You with a more personal experience and to avoid You having to re-enter your preferences every time You use the Website.</p>\r\n	</li>\r\n</ul>\r\n\r\n<p>For more information about the cookies we use and your choices regarding cookies, please visit our Cookies Policy or the Cookies section of our Privacy Policy.</p>\r\n\r\n<h2>Use of Your Personal Data</h2>\r\n\r\n<p>The Company may use Personal Data for the following purposes:</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p><strong>To provide and maintain our Service</strong>, including to monitor the usage of our Service.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>To manage Your Account:</strong> to manage Your registration as a user of the Service. The Personal Data You provide can give You access to different functionalities of the Service that are available to You as a registered user.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>For the performance of a contract:</strong> the development, compliance and undertaking of the purchase contract for the products, items or services You have purchased or of any other contract with Us through the Service.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>To contact You:</strong> To contact You by email, telephone calls, SMS, or other equivalent forms of electronic communication, such as a mobile application&#39;s push notifications regarding updates or informative communications related to the functionalities, products or contracted services, including the security updates, when necessary or reasonable for their implementation.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>To provide You</strong> with news, special offers and general information about other goods, services and events which we offer that are similar to those that you have already purchased or enquired about unless You have opted not to receive such information.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>To manage Your requests:</strong> To attend and manage Your requests to Us.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>For business transfers:</strong> We may use Your information to evaluate or conduct a merger, divestiture, restructuring, reorganization, dissolution, or other sale or transfer of some or all of Our assets, whether as a going concern or as part of bankruptcy, liquidation, or similar proceeding, in which Personal Data held by Us about our Service users is among the assets transferred.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>For other purposes</strong>: We may use Your information for other purposes, such as data analysis, identifying usage trends, determining the effectiveness of our promotional campaigns and to evaluate and improve our Service, products, services, marketing and your experience.</p>\r\n	</li>\r\n</ul>\r\n\r\n<p>We may share Your personal information in the following situations:</p>\r\n\r\n<ul>\r\n	<li><strong>With Service Providers:</strong> We may share Your personal information with Service Providers to monitor and analyze the use of our Service, to contact You.</li>\r\n	<li><strong>For business transfers:</strong> We may share or transfer Your personal information in connection with, or during negotiations of, any merger, sale of Company assets, financing, or acquisition of all or a portion of Our business to another company.</li>\r\n	<li><strong>With Affiliates:</strong> We may share Your information with Our affiliates, in which case we will require those affiliates to honor this Privacy Policy. Affiliates include Our parent company and any other subsidiaries, joint venture partners or other companies that We control or that are under common control with Us.</li>\r\n	<li><strong>With business partners:</strong> We may share Your information with Our business partners to offer You certain products, services or promotions.</li>\r\n	<li><strong>With other users:</strong> when You share personal information or otherwise interact in the public areas with other users, such information may be viewed by all users and may be publicly distributed outside. If You interact with other users or register through a Third-Party Social Media Service, Your contacts on the Third-Party Social Media Service may see Your name, profile, pictures and description of Your activity. Similarly, other users will be able to view descriptions of Your activity, communicate with You and view Your profile.</li>\r\n	<li><strong>With Your consent</strong>: We may disclose Your personal information for any other purpose with Your consent.</li>\r\n</ul>\r\n\r\n<h2>Retention of Your Personal Data</h2>\r\n\r\n<p>The Company will retain Your Personal Data only for as long as is necessary for the purposes set out in this Privacy Policy. We will retain and use Your Personal Data to the extent necessary to comply with our legal obligations (for example, if we are required to retain your data to comply with applicable laws), resolve disputes, and enforce our legal agreements and policies.</p>\r\n\r\n<p>The Company will also retain Usage Data for internal analysis purposes. Usage Data is generally retained for a shorter period of time, except when this data is used to strengthen the security or to improve the functionality of Our Service, or We are legally obligated to retain this data for longer time periods.</p>\r\n\r\n<h2>Transfer of Your Personal Data</h2>\r\n\r\n<p>Your information, including Personal Data, is processed at the Company&#39;s operating offices and in any other places where the parties involved in the processing are located. It means that this information may be transferred to &mdash; and maintained on &mdash; computers located outside of Your state, province, country or other governmental jurisdiction where the data protection laws may differ than those from Your jurisdiction.</p>\r\n\r\n<p>Your consent to this Privacy Policy followed by Your submission of such information represents Your agreement to that transfer.</p>\r\n\r\n<p>The Company will take all steps reasonably necessary to ensure that Your data is treated securely and in accordance with this Privacy Policy and no transfer of Your Personal Data will take place to an organization or a country unless there are adequate controls in place including the security of Your data and other personal information.</p>\r\n\r\n<h2>Delete Your Personal Data</h2>\r\n\r\n<p>You have the right to delete or request that We assist in deleting the Personal Data that We have collected about You.</p>\r\n\r\n<p>Our Service may give You the ability to delete certain information about You from within the Service.</p>\r\n\r\n<p>You may update, amend, or delete Your information at any time by signing in to Your Account, if you have one, and visiting the account settings section that allows you to manage Your personal information. You may also contact Us to request access to, correct, or delete any personal information that You have provided to Us.</p>\r\n\r\n<p>Please note, however, that We may need to retain certain information when we have a legal obligation or lawful basis to do so.</p>\r\n\r\n<h2>Disclosure of Your Personal Data</h2>\r\n\r\n<h3>Business Transactions</h3>\r\n\r\n<p>If the Company is involved in a merger, acquisition or asset sale, Your Personal Data may be transferred. We will provide notice before Your Personal Data is transferred and becomes subject to a different Privacy Policy.</p>\r\n\r\n<h3>Law enforcement</h3>\r\n\r\n<p>Under certain circumstances, the Company may be required to disclose Your Personal Data if required to do so by law or in response to valid requests by public authorities (e.g. a court or a government agency).</p>\r\n\r\n<h3>Other legal requirements</h3>\r\n\r\n<p>The Company may disclose Your Personal Data in the good faith belief that such action is necessary to:</p>\r\n\r\n<ul>\r\n	<li>Comply with a legal obligation</li>\r\n	<li>Protect and defend the rights or property of the Company</li>\r\n	<li>Prevent or investigate possible wrongdoing in connection with the Service</li>\r\n	<li>Protect the personal safety of Users of the Service or the public</li>\r\n	<li>Protect against legal liability</li>\r\n</ul>\r\n\r\n<h2>Security of Your Personal Data</h2>\r\n\r\n<p>The security of Your Personal Data is important to Us, but remember that no method of transmission over the Internet, or method of electronic storage is 100% secure. While We strive to use commercially acceptable means to protect Your Personal Data, We cannot guarantee its absolute security.</p>\r\n\r\n<h1>Children&#39;s Privacy</h1>\r\n\r\n<p>Our Service does not address anyone under the age of 13. We do not knowingly collect personally identifiable information from anyone under the age of 13. If You are a parent or guardian and You are aware that Your child has provided Us with Personal Data, please contact Us. If We become aware that We have collected Personal Data from anyone under the age of 13 without verification of parental consent, We take steps to remove that information from Our servers.</p>\r\n\r\n<p>If We need to rely on consent as a legal basis for processing Your information and Your country requires consent from a parent, We may require Your parent&#39;s consent before We collect and use that information.</p>\r\n\r\n<h1>Links to Other Websites</h1>\r\n\r\n<p>Our Service may contain links to other websites that are not operated by Us. If You click on a third party link, You will be directed to that third party&#39;s site. We strongly advise You to review the Privacy Policy of every site You visit.</p>\r\n\r\n<p>We have no control over and assume no responsibility for the content, privacy policies or practices of any third party sites or services.</p>\r\n\r\n<h1>Changes to this Privacy Policy</h1>\r\n\r\n<p>We may update Our Privacy Policy from time to time. We will notify You of any changes by posting the new Privacy Policy on this page.</p>\r\n\r\n<p>We will let You know via email and/or a prominent notice on Our Service, prior to the change becoming effective and update the &quot;Last updated&quot; date at the top of this Privacy Policy.</p>\r\n\r\n<p>You are advised to review this Privacy Policy periodically for any changes. Changes to this Privacy Policy are effective when they are posted on this page.</p>\r\n\r\n<h1>Contact Us</h1>\r\n\r\n<p>If you have any questions about this Privacy Policy, You can contact us:</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>By email: isfifashion@gmail.com</p>\r\n	</li>\r\n	<li>\r\n	<p>By phone number: 01716160224</p>\r\n	</li>\r\n	<li>\r\n	<p>By mail: House/Flat #2423, Dakkhin khan, Hazi camp, Airport 1229</p>\r\n	</li>\r\n</ul>\r\n\r\n<p>;</p>\r\n\r\n<p>&nbsp;</p>', NULL, '2023-08-21 00:36:09'),
(46, 'paystack', '{\"status\":\"0\",\"publicKey\":null,\"secretKey\":null,\"paymentUrl\":\"https:\\/\\/api.paystack.co\",\"merchantEmail\":null}', NULL, '2021-07-06 12:30:35'),
(47, 'senang_pay', '{\"status\":\"0\",\"secret_key\":null,\"merchant_id\":null}', NULL, '2021-07-06 12:30:23'),
(48, 'currency_model', 'single_currency', NULL, NULL),
(49, 'social_login', '[{\"login_medium\":\"google\",\"client_id\":\"\",\"client_secret\":\"\",\"status\":\"\"},{\"login_medium\":\"facebook\",\"client_id\":\"\",\"client_secret\":\"\",\"status\":\"\"}]', NULL, NULL),
(50, 'digital_payment', '{\"status\":\"1\"}', NULL, NULL),
(51, 'phone_verification', '0', NULL, NULL),
(52, 'email_verification', '0', NULL, NULL),
(53, 'order_verification', '0', NULL, NULL),
(54, 'country_code', 'BD', NULL, NULL),
(55, 'pagination_limit', '10', NULL, NULL),
(56, 'shipping_method', 'sellerwise_shipping', NULL, NULL),
(57, 'paymob_accept', '{\"status\":\"0\",\"api_key\":\"\",\"iframe_id\":\"\",\"integration_id\":\"\",\"hmac\":\"\"}', NULL, NULL),
(58, 'bkash', '{\"status\":\"0\",\"environment\":\"sandbox\",\"api_key\":\"\",\"api_secret\":\"\",\"username\":\"\",\"password\":\"\"}', NULL, '2023-01-10 05:51:56'),
(59, 'forgot_password_verification', 'phone', NULL, NULL),
(60, 'paytabs', '{\"status\":0,\"profile_id\":\"\",\"server_key\":\"\",\"base_url\":\"https:\\/\\/secure-egypt.paytabs.com\\/\"}', NULL, '2021-11-21 03:01:40'),
(61, 'stock_limit', '10', NULL, NULL),
(62, 'flutterwave', '{\"status\":null,\"environment\":\"sandbox\",\"public_key\":null,\"secret_key\":null,\"hash\":null}', NULL, '2023-08-26 19:54:34'),
(63, 'mercadopago', '{\"status\":null,\"environment\":\"sandbox\",\"public_key\":null,\"access_token\":null}', NULL, '2023-08-26 19:54:47'),
(64, 'announcement', '{\"status\":\"0\",\"color\":\"#1b1508\",\"text_color\":\"#f0ac19\",\"announcement\":\"\\u0986\\u099c\\u0995\\u09c7\\u09b0 \\u09a6\\u09bf\\u09a8 \\u0986\\u09ae\\u09be\\u09a6\\u09c7\\u09b0 \\u09b8\\u0995\\u09b2 \\u0995\\u09be\\u09b0\\u09cd\\u09af\\u0995\\u09cd\\u09b0\\u09ae \\u09ac\\u09a8\\u09cd\\u09a7\"}', NULL, NULL),
(65, 'fawry_pay', '{\"status\":0,\"merchant_code\":\"\",\"security_key\":\"\"}', NULL, '2022-01-18 09:46:30'),
(66, 'recaptcha', '{\"status\":0,\"site_key\":\"\",\"secret_key\":\"\"}', NULL, '2022-01-18 09:46:30'),
(67, 'seller_pos', '0', NULL, NULL),
(68, 'liqpay', '{\"status\":0,\"public_key\":\"\",\"private_key\":\"\"}', NULL, NULL),
(69, 'paytm', '{\"status\":0,\"environment\":\"sandbox\",\"paytm_merchant_key\":\"\",\"paytm_merchant_mid\":\"\",\"paytm_merchant_website\":\"\",\"paytm_refund_url\":\"\"}', NULL, '2023-01-10 05:51:56'),
(70, 'refund_day_limit', '0', NULL, NULL),
(71, 'business_mode', 'single', NULL, '2023-08-06 01:39:49'),
(72, 'mail_config_sendgrid', '{\"status\":0,\"name\":\"\",\"host\":\"\",\"driver\":\"\",\"port\":\"\",\"username\":\"\",\"email_id\":\"\",\"encryption\":\"\",\"password\":\"\"}', NULL, NULL),
(73, 'decimal_point_settings', '2', NULL, NULL),
(74, 'shop_address', 'House-01 ,Line-08, Block-A, Section-10, Mirpur Benaroshi palli, Dhaka-1216', NULL, NULL),
(75, 'billing_input_by_customer', '0', NULL, NULL),
(76, 'wallet_status', '0', NULL, NULL),
(77, 'loyalty_point_status', '0', NULL, NULL),
(78, 'wallet_add_refund', '0', NULL, NULL),
(79, 'loyalty_point_exchange_rate', '0', NULL, NULL),
(80, 'loyalty_point_item_purchase_point', '0', NULL, NULL),
(81, 'loyalty_point_minimum_point', '0', NULL, NULL),
(82, 'minimum_order_limit', '1', NULL, NULL),
(83, 'product_brand', '1', NULL, NULL),
(84, 'digital_product', '0', NULL, NULL),
(85, 'delivery_boy_expected_delivery_date_message', '{\"status\":0,\"message\":\"\"}', NULL, NULL),
(86, 'order_canceled', '{\"status\":0,\"message\":\"\"}', NULL, NULL),
(87, 'refund-policy', '<p>Issuance of Refunds</p>\r\n\r\n<ul>\r\n	<li>1. The processing time of your refund depends on the type of refund and the payment method you used.</li>\r\n	<li>2. The refund period / process starts when Isfifashion has processed your refund according to your refund type.</li>\r\n	<li>3. The refund amount covers the item price and shipping fee for your returned product.</li>\r\n</ul>\r\n\r\n<p>Refund Types</p>\r\n\r\n<p>Isfifashion will process your refund according to the following refund types</p>\r\n\r\n<ul>\r\n	<li>1. Refund from returns - Refund is processed once your item is returned to the warehouse and QC is completed (successful). To learn how to return an item, read our Return Policy.</li>\r\n	<li>2. Refunds from cancelled orders - Refund is automatically triggered once cancelation is successfully processed.</li>\r\n	<li>3. Refunds from failed deliveries - Refund process starts when the item has reached the seller. Please take note that this may take more time depending on the area of your shipping address. Screen reader support enabled.</li>\r\n</ul>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<th>Payment Method</th>\r\n			<th>Refund Option</th>\r\n			<th>Refund Time</th>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Debit or Credit Card</p>\r\n			</td>\r\n			<td>\r\n			<p>Debit or Credit Card Payment Reversal</p>\r\n			</td>\r\n			<td>\r\n			<p>10 working days</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Equated Monthly Installments</p>\r\n			</td>\r\n			<td>\r\n			<p>Debit or Credit Card</p>\r\n			</td>\r\n			<td>\r\n			<p>10 working days</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Rocket (Wallet DBBL)</p>\r\n			</td>\r\n			<td>\r\n			<p>Mobile Wallet Reversal / Rocket</p>\r\n			</td>\r\n			<td>\r\n			<p>7 working days</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Nagad</p>\r\n			</td>\r\n			<td>\r\n			<p>Mobile Wallet Reversal / Nagad</p>\r\n			</td>\r\n			<td>\r\n			<p>5 working days</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>DBBL Nexus (Online Banking)</p>\r\n			</td>\r\n			<td>\r\n			<p>Card Payment Reversal (Nexus)</p>\r\n			</td>\r\n			<td>\r\n			<p>7 working days</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>bKash</p>\r\n			</td>\r\n			<td>\r\n			<p>Mobile Wallet Reversal / bKash</p>\r\n			</td>\r\n			<td>\r\n			<p>5 working days</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td rowspan=\"2\">\r\n			<p>Cash on Delivery (COD)</p>\r\n			</td>\r\n			<td>\r\n			<p>Bank Deposit</p>\r\n			</td>\r\n			<td>\r\n			<p>5 working days</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Isfifashion Refund Voucher</p>\r\n			</td>\r\n			<td>\r\n			<p>1 working day</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Isfifashion Voucher</p>\r\n			</td>\r\n			<td>\r\n			<p>Refund Voucher</p>\r\n			</td>\r\n			<td>\r\n			<p>1 working day</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p><strong>Note:</strong>&nbsp;Maximum refund timeline excludes weekends and public holidays.</p>\r\n\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<th>Modes of Refund</th>\r\n			<th>Description</th>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Bank Deposit</p>\r\n			</td>\r\n			<td>\r\n			<p>The bank account details provided must be correct. The account must be active and should hold some balance.</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Debit Card or Credit Card</p>\r\n			</td>\r\n			<td>\r\n			<p>If the refunded amount is not reflecting in your card statement after the refund is completed and you have received a notification by Isfifashion , please contact your personal bank.</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>bKash / Rocket / Nagad Mobile Wallet</p>\r\n			</td>\r\n			<td>\r\n			<p>Similar to bank deposit, the amount will be refunded to the same mobile account details which you inserted at the time of payment.</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Refund Voucher</p>\r\n			</td>\r\n			<td>\r\n			<p>Vouchers will be sent to the customer registered email ID on Isfifashion and can be redeemed against the same email ID.</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p><strong>Important Note:</strong></p>\r\n\r\n<ul>\r\n	<li>1. The Voucher discount code can only be applied once. The leftover amount will not be refunded or used for next purchase even if the value of order is smaller than voucher value.</li>\r\n	<li>2. In case of any refund, the received cash back amount, if any, will be adjusted with the refund amount.</li>\r\n</ul>', NULL, '2023-08-28 02:31:52'),
(88, 'return-policy', '<h3>Returns Policy</h3>\r\n\r\n<ol>\r\n	<li>If your product is damaged, defective, incorrect or incomplete at the time of delivery, please raise a return request on Isfifashion app or website.&nbsp;<strong>Return request must be raised within 7&nbsp;days for </strong>Isfifashion&nbsp;<strong>items&nbsp;from the date of delivery.</strong></li>\r\n	<li>For electronic appliances &amp; mobile phones related issues after usage or after the return policy period, please check if the product is covered under seller warranty or brand warranty. For more information on warranty claims, please view our&nbsp;<a href=\"https://pages.daraz.com.bd/wow/i/bd/help-pages/warranty-policy\">Warranty Policy</a>.</li>\r\n	<li>For selected categories, we accept a change of mind. Please refer to the section below on Return Policy per Category for more information.</li>\r\n</ol>\r\n\r\n<h3>Valid reasons to return an item</h3>\r\n\r\n<ol>\r\n	<li>Delivered product is damaged (i.e. physically destroyed or broken) / defective (e.g. unable to switch on)</li>\r\n	<li>Delivered product is incomplete (i.e. has missing items and/or accessories)</li>\r\n	<li>Delivered product is incorrect (i.e. wrong product/size/colour, fake item, or expired)</li>\r\n	<li>Delivered product is does not match product description or picture (i.e product not as advertised)</li>\r\n	<li>Delivered product does not fit. (i.e. size is unsuitable)</li>\r\n</ol>\r\n\r\n<h3>Conditions for Returns</h3>\r\n\r\n<ol><br />\r\n	<li>The product must be unused, unworn, unwashed and without any flaws. For fashion products, products may be tried on to see if the item fits. This will still be considered as unworn.</li>\r\n	<br />\r\n	<li>The product must include the original tags, user manuals, warranty cards, freebies, invoice and accessories.</li>\r\n	<br />\r\n	<li>The product must be returned in the original and undamaged manufacturer&#39;s packaging/box. If the product was delivered in Isfifashion packaging/box, the same packaging/box should be returned. Do not put tape or stickers directly on the manufacturer&#39;s packaging / box.</li>\r\n	<br />\r\n	<li><strong>NOTE:&nbsp;</strong>It is important to indicate the Order Number and Return Tracking Number on your return package to avoid any inconvenience/delay in your return process.<br />\r\n	While handing over your package to Drop-Off station/ Pickup Agent, please collect the Isfifashion Return Acknowledgment paper and reserve it for future reference.</li>\r\n	<br />\r\n	<br />\r\n	&nbsp;\r\n</ol>\r\n\r\n<p>If your returned item does not meet the above requirements, we reserve the right to reject any request for a refund.</p>\r\n\r\n<p><strong>Note:</strong>&nbsp;If your return request has been rejected, the item will be delivered back to you between 6-8 days. Item will be sent to scrap after three (3) failed delivery attempts and no refund will be given.</p>\r\n\r\n<p>&nbsp;</p>', NULL, '2023-08-28 02:35:35'),
(89, 'cancellation-policy', '', NULL, NULL),
(90, 'shop_banner', '2023-08-14-64da530e1a682.png', NULL, NULL),
(91, 'timezone', 'Asia/Dhaka', NULL, NULL),
(92, 'loader_gif', '2023-09-28-65156aae4c698.png', NULL, NULL),
(93, 'default_location', '{\"lat\":null,\"lng\":null}', NULL, NULL),
(94, 'currency_symbol_position', 'left', '2023-08-10 04:18:35', '2023-08-15 03:42:45'),
(95, 'maintenance_mode', '0', '2023-08-18 04:52:26', '2023-08-21 00:26:03');

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `cart_group_id` varchar(191) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `product_type` varchar(20) NOT NULL DEFAULT 'physical',
  `digital_product_type` varchar(30) DEFAULT NULL,
  `color` varchar(191) DEFAULT NULL,
  `choices` text DEFAULT NULL,
  `variations` text DEFAULT NULL,
  `variant` text DEFAULT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `price` double NOT NULL DEFAULT 1,
  `tax` double NOT NULL DEFAULT 1,
  `discount` double NOT NULL DEFAULT 1,
  `slug` varchar(191) DEFAULT NULL,
  `name` varchar(191) DEFAULT NULL,
  `thumbnail` varchar(191) DEFAULT NULL,
  `seller_id` bigint(20) DEFAULT NULL,
  `seller_is` varchar(191) NOT NULL DEFAULT 'admin',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `shop_info` varchar(191) DEFAULT NULL,
  `shipping_cost` double(8,2) DEFAULT NULL,
  `shipping_type` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cart_shippings`
--

CREATE TABLE `cart_shippings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cart_group_id` varchar(191) DEFAULT NULL,
  `shipping_method_id` bigint(20) DEFAULT NULL,
  `shipping_cost` double(8,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cart_shippings`
--

INSERT INTO `cart_shippings` (`id`, `cart_group_id`, `shipping_method_id`, `shipping_cost`, `created_at`, `updated_at`) VALUES
(3, '5-cAwGL-1692897443', 2, 5.00, '2023-08-25 04:22:45', '2023-08-25 04:22:45'),
(8, '7-m5vsP-1693049283', 9, 150.00, '2023-08-26 22:28:34', '2023-08-26 22:28:34'),
(9, '8-ZT0qI-1693983692', 10, 0.00, '2023-09-06 18:31:35', '2023-09-06 18:31:35'),
(12, '9-AWiH4-1694262054', 9, 120.00, '2023-09-09 22:24:13', '2023-09-09 22:24:13');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `icon` varchar(250) DEFAULT NULL,
  `parent_id` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `home_status` tinyint(1) NOT NULL DEFAULT 0,
  `priority` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `icon`, `parent_id`, `position`, `created_at`, `updated_at`, `home_status`, `priority`) VALUES
(1, 'Pant', 'pant', '2023-08-11-64d6189c47729.png', 0, 0, '2023-08-06 01:29:15', '2023-10-05 17:32:28', 0, 0),
(2, 'Shirt', 'shirt', '2023-08-11-64d6186e3718e.png', 0, 0, '2023-08-06 01:32:45', '2023-10-05 17:32:29', 0, 1),
(3, 'Full Hata shirt', 'full-hata-shirt', NULL, 2, 1, '2023-08-11 09:42:47', '2023-08-11 09:42:47', 0, 1),
(4, 'Three Piece', 'three-piece', '2023-08-14-64d9c99ca3c15.png', 0, 0, '2023-08-14 17:28:44', '2023-08-27 23:48:40', 1, 1),
(5, 'Indian Sherwani', 'indian-sherwani', '2023-10-04-651d5d0dced60.png', 0, 0, '2023-08-20 15:01:59', '2023-10-05 01:39:41', 0, 6),
(6, 'katan', 'katan', NULL, 5, 1, '2023-08-20 15:02:53', '2023-08-20 15:02:53', 0, 7),
(7, 'Haf hta shirt', 'haf-hta-shirt', NULL, 2, 1, '2023-08-20 15:03:47', '2023-08-20 15:03:47', 0, 3),
(8, 'Indiyan Hancah', 'indiyan-hancah', NULL, 4, 1, '2023-08-20 15:04:33', '2023-09-08 22:51:24', 0, 8),
(9, 'T shirt', 't-shirt', NULL, 7, 2, '2023-08-20 15:05:26', '2023-08-20 15:05:26', 0, 9),
(10, 'Indian chicken curry', 'indian-chicken-curry', NULL, 4, 1, '2023-08-27 23:49:35', '2023-08-27 23:49:35', 0, 3),
(11, 'Anaya Hoor', 'anaya-hoor', NULL, 4, 1, '2023-09-08 22:53:20', '2023-09-08 22:53:20', 0, 9),
(12, 'Kashmir sherwani', 'kashmir-sherwani', '2023-10-04-651d5cbf9397b.png', 0, 0, '2023-10-05 01:38:23', '2023-10-05 01:38:59', 1, 2),
(13, 'Indian premium karchupi', 'indian-premium-karchupi', '2023-10-04-651d97f4447e5.png', 0, 0, '2023-10-05 05:51:00', '2023-10-05 05:51:00', 0, 6),
(14, 'Indian Elite sherwani', 'indian-elite-sherwani', '2023-10-04-651d9b2746338.png', 0, 0, '2023-10-05 06:04:39', '2023-10-05 06:04:39', 0, 6),
(15, 'Elite panjabi', 'elite-panjabi', '2023-10-05-651e2bb32f143.png', 0, 0, '2023-10-05 16:21:23', '2023-10-05 16:21:23', 0, 6),
(16, 'Kashmir koti', 'kashmir-koti', '2023-10-05-651e507f0ea67.png', 0, 0, '2023-10-05 18:58:23', '2023-10-06 04:02:55', 0, 6),
(17, 'premium karchupi koti', 'premium-karchupi-koti', '2023-10-05-651e509cdbe01.png', 0, 0, '2023-10-05 18:58:52', '2023-10-05 18:58:52', 0, 6),
(18, 'kashmir Elite indian', 'kashmir-elite-indian', '2023-10-05-651e50bc2e92c.png', 0, 0, '2023-10-05 18:59:24', '2023-10-05 18:59:24', 0, 6),
(19, 'Premium Shaal/Orna', 'premium-shaalorna', '2023-10-05-651e7b2a698ed.png', 0, 0, '2023-10-05 22:00:26', '2023-10-05 22:00:26', 0, 6),
(20, 'Polite special', 'polite-special', NULL, 15, 1, '2023-10-06 05:42:31', '2023-10-06 05:42:31', 0, NULL),
(22, 'Accessories', 'accessories', '2023-10-06-651f833bccdb2.png', 0, 0, '2023-10-06 16:47:07', '2023-10-06 16:47:07', 0, 6),
(23, 'Mala', 'mala', NULL, 22, 1, '2023-10-06 16:49:09', '2023-10-06 16:49:09', 0, NULL),
(24, 'Nagra', 'nagra', NULL, 22, 1, '2023-10-06 16:54:16', '2023-10-06 16:54:16', 0, NULL),
(25, 'Pagri', 'pagri', NULL, 22, 1, '2023-10-06 17:15:34', '2023-10-06 17:15:34', 0, NULL),
(26, 'Fotua', 'fotua', '2023-10-06-651fa58579dac.png', 0, 0, '2023-10-06 19:13:25', '2023-10-06 19:13:25', 0, 6);

-- --------------------------------------------------------

--
-- Table structure for table `category_shipping_costs`
--

CREATE TABLE `category_shipping_costs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) UNSIGNED DEFAULT NULL,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `cost` double(8,2) DEFAULT NULL,
  `multiply_qty` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category_shipping_costs`
--

INSERT INTO `category_shipping_costs` (`id`, `seller_id`, `category_id`, `cost`, `multiply_qty`, `created_at`, `updated_at`) VALUES
(1, 0, 1, 0.00, NULL, '2023-08-06 01:41:21', '2023-08-06 01:41:21'),
(2, 0, 2, 0.00, NULL, '2023-08-06 01:41:21', '2023-08-06 01:41:21'),
(3, 0, 4, 0.00, NULL, '2023-08-15 02:55:39', '2023-08-15 02:55:39'),
(4, 0, 5, 0.00, NULL, '2023-08-26 19:45:00', '2023-08-26 19:45:00');

-- --------------------------------------------------------

--
-- Table structure for table `chattings`
--

CREATE TABLE `chattings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `seller_id` bigint(20) DEFAULT NULL,
  `admin_id` bigint(20) DEFAULT NULL,
  `delivery_man_id` bigint(20) DEFAULT NULL,
  `message` text NOT NULL,
  `sent_by_customer` tinyint(1) NOT NULL DEFAULT 0,
  `sent_by_seller` tinyint(1) NOT NULL DEFAULT 0,
  `sent_by_admin` tinyint(1) DEFAULT NULL,
  `sent_by_delivery_man` tinyint(1) DEFAULT NULL,
  `seen_by_customer` tinyint(1) NOT NULL DEFAULT 1,
  `seen_by_seller` tinyint(1) NOT NULL DEFAULT 1,
  `seen_by_admin` tinyint(1) DEFAULT NULL,
  `seen_by_delivery_man` tinyint(1) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `shop_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `colors`
--

CREATE TABLE `colors` (
  `id` int(11) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `code` varchar(10) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `colors`
--

INSERT INTO `colors` (`id`, `name`, `code`, `created_at`, `updated_at`) VALUES
(1, 'IndianRed', '#CD5C5C', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(2, 'LightCoral', '#F08080', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(3, 'Salmon', '#FA8072', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(4, 'DarkSalmon', '#E9967A', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(5, 'LightSalmon', '#FFA07A', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(6, 'Crimson', '#DC143C', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(7, 'Red', '#FF0000', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(8, 'FireBrick', '#B22222', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(9, 'DarkRed', '#8B0000', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(10, 'Pink', '#FFC0CB', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(11, 'LightPink', '#FFB6C1', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(12, 'HotPink', '#FF69B4', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(13, 'DeepPink', '#FF1493', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(14, 'MediumVioletRed', '#C71585', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(15, 'PaleVioletRed', '#DB7093', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(16, 'LightSalmon', '#FFA07A', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(17, 'Coral', '#FF7F50', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(18, 'Tomato', '#FF6347', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(19, 'OrangeRed', '#FF4500', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(20, 'DarkOrange', '#FF8C00', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(21, 'Orange', '#FFA500', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(22, 'Gold', '#FFD700', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(23, 'Yellow', '#FFFF00', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(24, 'LightYellow', '#FFFFE0', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(25, 'LemonChiffon', '#FFFACD', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(26, 'LightGoldenrodYellow', '#FAFAD2', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(27, 'PapayaWhip', '#FFEFD5', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(28, 'Moccasin', '#FFE4B5', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(29, 'PeachPuff', '#FFDAB9', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(30, 'PaleGoldenrod', '#EEE8AA', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(31, 'Khaki', '#F0E68C', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(32, 'DarkKhaki', '#BDB76B', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(33, 'Lavender', '#E6E6FA', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(34, 'Thistle', '#D8BFD8', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(35, 'Plum', '#DDA0DD', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(36, 'Violet', '#EE82EE', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(37, 'Orchid', '#DA70D6', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(38, 'Fuchsia', '#FF00FF', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(39, 'Magenta', '#FF00FF', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(40, 'MediumOrchid', '#BA55D3', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(41, 'MediumPurple', '#9370DB', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(42, 'Amethyst', '#9966CC', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(43, 'BlueViolet', '#8A2BE2', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(44, 'DarkViolet', '#9400D3', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(45, 'DarkOrchid', '#9932CC', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(46, 'DarkMagenta', '#8B008B', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(47, 'Purple', '#800080', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(48, 'Indigo', '#4B0082', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(49, 'SlateBlue', '#6A5ACD', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(50, 'DarkSlateBlue', '#483D8B', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(51, 'MediumSlateBlue', '#7B68EE', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(52, 'GreenYellow', '#ADFF2F', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(53, 'Chartreuse', '#7FFF00', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(54, 'LawnGreen', '#7CFC00', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(55, 'Lime', '#00FF00', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(56, 'LimeGreen', '#32CD32', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(57, 'PaleGreen', '#98FB98', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(58, 'LightGreen', '#90EE90', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(59, 'MediumSpringGreen', '#00FA9A', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(60, 'SpringGreen', '#00FF7F', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(61, 'MediumSeaGreen', '#3CB371', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(62, 'SeaGreen', '#2E8B57', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(63, 'ForestGreen', '#228B22', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(64, 'Green', '#008000', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(65, 'DarkGreen', '#006400', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(66, 'YellowGreen', '#9ACD32', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(67, 'OliveDrab', '#6B8E23', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(68, 'Olive', '#808000', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(69, 'DarkOliveGreen', '#556B2F', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(70, 'MediumAquamarine', '#66CDAA', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(71, 'DarkSeaGreen', '#8FBC8F', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(72, 'LightSeaGreen', '#20B2AA', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(73, 'DarkCyan', '#008B8B', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(74, 'Teal', '#008080', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(75, 'Aqua', '#00FFFF', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(77, 'LightCyan', '#E0FFFF', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(78, 'PaleTurquoise', '#AFEEEE', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(79, 'Aquamarine', '#7FFFD4', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(80, 'Turquoise', '#40E0D0', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(81, 'MediumTurquoise', '#48D1CC', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(82, 'DarkTurquoise', '#00CED1', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(83, 'CadetBlue', '#5F9EA0', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(84, 'SteelBlue', '#4682B4', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(85, 'LightSteelBlue', '#B0C4DE', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(86, 'PowderBlue', '#B0E0E6', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(87, 'LightBlue', '#ADD8E6', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(88, 'SkyBlue', '#87CEEB', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(89, 'LightSkyBlue', '#87CEFA', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(90, 'DeepSkyBlue', '#00BFFF', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(91, 'DodgerBlue', '#1E90FF', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(92, 'CornflowerBlue', '#6495ED', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(93, 'MediumSlateBlue', '#7B68EE', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(94, 'RoyalBlue', '#4169E1', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(95, 'Blue', '#0000FF', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(96, 'MediumBlue', '#0000CD', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(97, 'DarkBlue', '#00008B', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(98, 'Navy', '#000080', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(99, 'MidnightBlue', '#191970', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(100, 'Cornsilk', '#FFF8DC', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(101, 'BlanchedAlmond', '#FFEBCD', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(102, 'Bisque', '#FFE4C4', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(103, 'NavajoWhite', '#FFDEAD', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(104, 'Wheat', '#F5DEB3', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(105, 'BurlyWood', '#DEB887', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(106, 'Tan', '#D2B48C', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(107, 'RosyBrown', '#BC8F8F', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(108, 'SandyBrown', '#F4A460', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(109, 'Goldenrod', '#DAA520', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(110, 'DarkGoldenrod', '#B8860B', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(111, 'Peru', '#CD853F', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(112, 'Chocolate', '#D2691E', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(113, 'SaddleBrown', '#8B4513', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(114, 'Sienna', '#A0522D', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(115, 'Brown', '#A52A2A', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(116, 'Maroon', '#800000', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(117, 'White', '#FFFFFF', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(118, 'Snow', '#FFFAFA', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(119, 'Honeydew', '#F0FFF0', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(120, 'MintCream', '#F5FFFA', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(121, 'Azure', '#F0FFFF', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(122, 'AliceBlue', '#F0F8FF', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(123, 'GhostWhite', '#F8F8FF', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(124, 'WhiteSmoke', '#F5F5F5', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(125, 'Seashell', '#FFF5EE', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(126, 'Beige', '#F5F5DC', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(127, 'OldLace', '#FDF5E6', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(128, 'FloralWhite', '#FFFAF0', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(129, 'Ivory', '#FFFFF0', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(130, 'AntiqueWhite', '#FAEBD7', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(131, 'Linen', '#FAF0E6', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(132, 'LavenderBlush', '#FFF0F5', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(133, 'MistyRose', '#FFE4E1', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(134, 'Gainsboro', '#DCDCDC', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(135, 'LightGrey', '#D3D3D3', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(136, 'Silver', '#C0C0C0', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(137, 'DarkGray', '#A9A9A9', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(138, 'Gray', '#808080', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(139, 'DimGray', '#696969', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(140, 'LightSlateGray', '#778899', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(141, 'SlateGray', '#708090', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(142, 'DarkSlateGray', '#2F4F4F', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(143, 'Black', '#000000', '2018-11-05 02:12:30', '2018-11-05 02:12:30');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `mobile_number` varchar(191) NOT NULL,
  `subject` varchar(191) NOT NULL,
  `message` text NOT NULL,
  `seen` tinyint(1) NOT NULL DEFAULT 0,
  `feedback` varchar(191) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `reply` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `name`, `email`, `mobile_number`, `subject`, `message`, `seen`, `feedback`, `created_at`, `updated_at`, `reply`) VALUES
(1, 'Harvey Miller', 'harvey.websolution1@gmail.com', '8456404550', 'Question about your websites', 'Hello,\r\n\r\nWe noticed SEO errors on your new website that may impact its visibility on search engines, leading to low visitor traffic. Let\'s schedule a call at your convenience to discuss and easily resolve these issues. If your new business is a priority, please provide your phone number and preferred time to call.\r\n\r\nThank you,\r\nHarvey Miller', 0, '0', '2023-08-09 14:43:29', '2023-08-09 14:43:29', NULL),
(2, 'Catherine Williams', 'stewartgarys158@gmail.com', '5162064782', 'Question about your websites', 'Hi,\r\n\r\nIt\'s me, Catherine.\r\n\r\nCan we talk about how well your website performs, develops, uses social media, and is designed?\r\n\r\nFor a more complete explanation, I\'ll need your phone number and the best time to call you.', 0, '0', '2023-08-09 17:45:27', '2023-08-09 17:45:27', NULL),
(3, 'Md Safir Uddin Titu', 'sutitu630@gmail.com', '+8801773470176', 'Just Cake', 'Just Cake', 1, '0', '2023-08-14 23:11:40', '2023-08-14 23:12:58', NULL),
(4, 'Anna Wilson', 'annawilson.web@gmail.com', '120120120', 'Re: Want more clients and customers? \"isfifashion.com\"', 'Hello there,\r\n\r\n isfifashion.com\r\n\r\nI am a Digital Marketing Consultant and while working on an online project I came across your website and noticed SEO of your website is not to the optimum level. isfifashion.com\r\n\r\nDo you want more targeted visitors on your website?\r\n\r\nWe can place your website on Google’s 1st Page. yahoo, AOL, Bing. Etc.\r\n\r\nIf interested, kindly provide me your name, phone number, and email.\r\n\r\nRegards,\r\nAnna', 1, '0', '2023-08-16 17:11:33', '2023-08-18 07:02:36', NULL),
(5, 'Catherine Williams', 'ericsguzman1@gmail.com', '516-206-4782', 'Question about your websites', 'I\'m Catherine.\r\n\r\nWould you be willing to talk to me about your website\'s design, promotion, social media integration, and overall functionality?\r\n\r\nSo that I can explain things to you in greater detail, I need your phone number and the best time to call you.', 0, '0', '2023-08-18 05:23:00', '2023-08-18 05:23:00', NULL),
(7, 'Josephvof', 'no.reply.MikaelLambert@gmail.com', '83273899441', 'A cutting-edge system of email distribution.', 'Howdy-doody! isfifashion.com \r\n \r\nDid you know that it is possible to send messages legitimately? We offer a legitimate and unique method of sending business proposals through contact forms. Such feedback forms can be located on numerous websites. \r\nWhen such requests are sent, no personal data is used and messages are securely routed to forms designed to receive them and any subsequent appeals. As Communication Forms are seen as important, messages sent through them are unlikely to be marked as spam. \r\nCome and give our service a try – it’s free! \r\nWe can dispatch up to 50,000 messages for you. \r\n \r\nThe cost of sending one million messages is $59. \r\n \r\nThis letter is automatically generated. \r\nPlease use the contact details below to get in touch with us. \r\n \r\nContact us. \r\nTelegram - https://t.me/FeedbackFormEU \r\nSkype  live:feedbackform2019 \r\nWhatsApp  +375259112693 \r\nWhatsApp  https://wa.me/+375259112693 \r\n \r\nWe only use chat for communication.', 0, '0', '2023-09-19 02:22:23', '2023-09-19 02:22:23', NULL),
(8, 'Nishant Sharma', 'nishant.developer22@gmail.com', '1234567890', 'Re: Website Design & development service for isfifashion.com', 'Hope you are doing well!\r\n\r\nI am Nishant,\r\n\r\nI\'m reaching out to see if you are looking for some upgrade, Repair, Re-design, or a complete revamp of your current website. \"www.isfifashion.com\"\r\n\r\nWe have a dedicated team of 45 professional designers and developers with over 8 plus years of experience and we thrive on the idea that design makes a difference.\r\n\r\nShare a brief about your project with your phone number (With Country Code) /Skype and suitable time (Meeting) to talk to you, and get a guaranteed response within 24 hours.\r\n\r\nKinds Regards,\r\nNishant (Web Solution Manager)', 0, '0', '2023-09-27 20:20:01', '2023-09-27 20:20:01', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `added_by` varchar(191) NOT NULL DEFAULT 'admin',
  `coupon_type` varchar(50) DEFAULT NULL,
  `coupon_bearer` varchar(191) NOT NULL DEFAULT 'inhouse',
  `seller_id` bigint(20) DEFAULT NULL COMMENT 'NULL=in-house, 0=all seller',
  `customer_id` bigint(20) DEFAULT NULL COMMENT '0 = all customer',
  `title` varchar(100) DEFAULT NULL,
  `code` varchar(15) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `min_purchase` decimal(8,2) NOT NULL DEFAULT 0.00,
  `max_discount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `discount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `discount_type` varchar(15) NOT NULL DEFAULT 'percentage',
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `limit` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `added_by`, `coupon_type`, `coupon_bearer`, `seller_id`, `customer_id`, `title`, `code`, `start_date`, `expire_date`, `min_purchase`, `max_discount`, `discount`, `discount_type`, `status`, `created_at`, `updated_at`, `limit`) VALUES
(1, 'admin', 'discount_on_purchase', 'inhouse', NULL, 0, 'flash cupon', 'slae10', '2023-08-26', '2023-10-26', 500.00, 50.00, 50.00, 'amount', 1, '2023-08-26 19:43:14', '2023-08-26 19:43:14', 1);

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `symbol` varchar(191) NOT NULL,
  `code` varchar(191) NOT NULL,
  `exchange_rate` varchar(191) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `name`, `symbol`, `code`, `exchange_rate`, `status`, `created_at`, `updated_at`) VALUES
(2, 'BDT', '৳', 'BDT', '1', 1, NULL, '2023-08-15 03:09:07'),
(3, 'Indian Rupi', '₹', 'INR', '60', 0, '2020-10-15 17:23:04', '2023-08-15 03:13:25'),
(4, 'Euro', '€', 'EUR', '100', 0, '2021-05-25 21:00:23', '2023-08-15 03:13:27'),
(5, 'YEN', '¥', 'JPY', '110', 0, '2021-06-10 22:08:31', '2023-08-15 03:13:28'),
(6, 'Ringgit', 'RM', 'MYR', '4.16', 0, '2021-07-03 11:08:33', '2023-08-15 03:13:31'),
(7, 'Rand', 'R', 'ZAR', '14.26', 0, '2021-07-03 11:12:38', '2023-08-15 03:13:32');

-- --------------------------------------------------------

--
-- Table structure for table `customer_wallets`
--

CREATE TABLE `customer_wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `balance` decimal(8,2) NOT NULL DEFAULT 0.00,
  `royality_points` decimal(8,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer_wallet_histories`
--

CREATE TABLE `customer_wallet_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `transaction_amount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `transaction_type` varchar(20) DEFAULT NULL,
  `transaction_method` varchar(30) DEFAULT NULL,
  `transaction_id` varchar(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deal_of_the_days`
--

CREATE TABLE `deal_of_the_days` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(150) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `discount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `discount_type` varchar(12) NOT NULL DEFAULT 'amount',
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deliveryman_notifications`
--

CREATE TABLE `deliveryman_notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `delivery_man_id` bigint(20) NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `description` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deliveryman_wallets`
--

CREATE TABLE `deliveryman_wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `delivery_man_id` bigint(20) NOT NULL,
  `current_balance` decimal(50,2) NOT NULL DEFAULT 0.00,
  `cash_in_hand` decimal(50,2) NOT NULL DEFAULT 0.00,
  `pending_withdraw` decimal(50,2) NOT NULL DEFAULT 0.00,
  `total_withdraw` decimal(50,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_country_codes`
--

CREATE TABLE `delivery_country_codes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `country_code` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_histories`
--

CREATE TABLE `delivery_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `deliveryman_id` bigint(20) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `longitude` varchar(191) DEFAULT NULL,
  `latitude` varchar(191) DEFAULT NULL,
  `location` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_man_transactions`
--

CREATE TABLE `delivery_man_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `delivery_man_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `user_type` varchar(20) NOT NULL,
  `transaction_id` char(36) NOT NULL,
  `debit` decimal(50,2) NOT NULL DEFAULT 0.00,
  `credit` decimal(50,2) NOT NULL DEFAULT 0.00,
  `transaction_type` varchar(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_men`
--

CREATE TABLE `delivery_men` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) DEFAULT NULL,
  `f_name` varchar(100) DEFAULT NULL,
  `l_name` varchar(100) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `country_code` varchar(20) DEFAULT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `identity_number` varchar(30) DEFAULT NULL,
  `identity_type` varchar(50) DEFAULT NULL,
  `identity_image` varchar(191) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `password` varchar(100) NOT NULL,
  `bank_name` varchar(191) DEFAULT NULL,
  `branch` varchar(191) DEFAULT NULL,
  `account_no` varchar(191) DEFAULT NULL,
  `holder_name` varchar(191) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `is_online` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `auth_token` varchar(191) NOT NULL DEFAULT '6yIRXJRRfp78qJsAoKZZ6TTqhzuNJ3TcdvPBmk6n',
  `fcm_token` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_zip_codes`
--

CREATE TABLE `delivery_zip_codes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `zipcode` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `emergency_contacts`
--

CREATE TABLE `emergency_contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `name` varchar(191) NOT NULL,
  `phone` varchar(25) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `emergency_contacts`
--

INSERT INTO `emergency_contacts` (`id`, `user_id`, `name`, `phone`, `status`, `created_at`, `updated_at`) VALUES
(1, 0, 'Farhana Akter', '01716160224', 1, '2023-08-28 00:05:27', '2023-08-28 00:05:27');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `feature_deals`
--

CREATE TABLE `feature_deals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `url` varchar(191) DEFAULT NULL,
  `photo` varchar(191) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `flash_deals`
--

CREATE TABLE `flash_deals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(150) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `featured` tinyint(1) NOT NULL DEFAULT 0,
  `background_color` varchar(255) DEFAULT NULL,
  `text_color` varchar(255) DEFAULT NULL,
  `banner` varchar(100) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `deal_type` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `flash_deals`
--

INSERT INTO `flash_deals` (`id`, `title`, `start_date`, `end_date`, `status`, `featured`, `background_color`, `text_color`, `banner`, `slug`, `created_at`, `updated_at`, `product_id`, `deal_type`) VALUES
(1, 'T- Shirt', '2023-08-20', '2023-08-22', 0, 0, NULL, NULL, 'def.png', 't-shirt', '2023-08-20 15:06:58', '2023-08-20 15:06:58', NULL, 'feature_deal');

-- --------------------------------------------------------

--
-- Table structure for table `flash_deal_products`
--

CREATE TABLE `flash_deal_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `flash_deal_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `discount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `discount_type` varchar(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `help_topics`
--

CREATE TABLE `help_topics` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question` text DEFAULT NULL,
  `answer` text DEFAULT NULL,
  `ranking` int(11) NOT NULL DEFAULT 1,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(191) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `loyalty_point_transactions`
--

CREATE TABLE `loyalty_point_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `transaction_id` char(36) NOT NULL,
  `credit` decimal(24,3) NOT NULL DEFAULT 0.000,
  `debit` decimal(24,3) NOT NULL DEFAULT 0.000,
  `balance` decimal(24,3) NOT NULL DEFAULT 0.000,
  `reference` varchar(191) DEFAULT NULL,
  `transaction_type` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_09_08_105159_create_admins_table', 1),
(5, '2020_09_08_111837_create_admin_roles_table', 1),
(6, '2020_09_16_142451_create_categories_table', 2),
(7, '2020_09_16_181753_create_categories_table', 3),
(8, '2020_09_17_134238_create_brands_table', 4),
(9, '2020_09_17_203054_create_attributes_table', 5),
(10, '2020_09_19_112509_create_coupons_table', 6),
(11, '2020_09_19_161802_create_curriencies_table', 7),
(12, '2020_09_20_114509_create_sellers_table', 8),
(13, '2020_09_23_113454_create_shops_table', 9),
(14, '2020_09_23_115615_create_shops_table', 10),
(15, '2020_09_23_153822_create_shops_table', 11),
(16, '2020_09_21_122817_create_products_table', 12),
(17, '2020_09_22_140800_create_colors_table', 12),
(18, '2020_09_28_175020_create_products_table', 13),
(19, '2020_09_28_180311_create_products_table', 14),
(20, '2020_10_04_105041_create_search_functions_table', 15),
(21, '2020_10_05_150730_create_customers_table', 15),
(22, '2020_10_08_133548_create_wishlists_table', 16),
(23, '2016_06_01_000001_create_oauth_auth_codes_table', 17),
(24, '2016_06_01_000002_create_oauth_access_tokens_table', 17),
(25, '2016_06_01_000003_create_oauth_refresh_tokens_table', 17),
(26, '2016_06_01_000004_create_oauth_clients_table', 17),
(27, '2016_06_01_000005_create_oauth_personal_access_clients_table', 17),
(28, '2020_10_06_133710_create_product_stocks_table', 17),
(29, '2020_10_06_134636_create_flash_deals_table', 17),
(30, '2020_10_06_134719_create_flash_deal_products_table', 17),
(31, '2020_10_08_115439_create_orders_table', 17),
(32, '2020_10_08_115453_create_order_details_table', 17),
(33, '2020_10_08_121135_create_shipping_addresses_table', 17),
(34, '2020_10_10_171722_create_business_settings_table', 17),
(35, '2020_09_19_161802_create_currencies_table', 18),
(36, '2020_10_12_152350_create_reviews_table', 18),
(37, '2020_10_12_161834_create_reviews_table', 19),
(38, '2020_10_12_180510_create_support_tickets_table', 20),
(39, '2020_10_14_140130_create_transactions_table', 21),
(40, '2020_10_14_143553_create_customer_wallets_table', 21),
(41, '2020_10_14_143607_create_customer_wallet_histories_table', 21),
(42, '2020_10_22_142212_create_support_ticket_convs_table', 21),
(43, '2020_10_24_234813_create_banners_table', 22),
(44, '2020_10_27_111557_create_shipping_methods_table', 23),
(45, '2020_10_27_114154_add_url_to_banners_table', 24),
(46, '2020_10_28_170308_add_shipping_id_to_order_details', 25),
(47, '2020_11_02_140528_add_discount_to_order_table', 26),
(48, '2020_11_03_162723_add_column_to_order_details', 27),
(49, '2020_11_08_202351_add_url_to_banners_table', 28),
(50, '2020_11_10_112713_create_help_topic', 29),
(51, '2020_11_10_141513_create_contacts_table', 29),
(52, '2020_11_15_180036_add_address_column_user_table', 30),
(53, '2020_11_18_170209_add_status_column_to_product_table', 31),
(54, '2020_11_19_115453_add_featured_status_product', 32),
(55, '2020_11_21_133302_create_deal_of_the_days_table', 33),
(56, '2020_11_20_172332_add_product_id_to_products', 34),
(57, '2020_11_27_234439_add__state_to_shipping_addresses', 34),
(58, '2020_11_28_091929_create_chattings_table', 35),
(59, '2020_12_02_011815_add_bank_info_to_sellers', 36),
(60, '2020_12_08_193234_create_social_medias_table', 37),
(61, '2020_12_13_122649_shop_id_to_chattings', 37),
(62, '2020_12_14_145116_create_seller_wallet_histories_table', 38),
(63, '2020_12_14_145127_create_seller_wallets_table', 38),
(64, '2020_12_15_174804_create_admin_wallets_table', 39),
(65, '2020_12_15_174821_create_admin_wallet_histories_table', 39),
(66, '2020_12_15_214312_create_feature_deals_table', 40),
(67, '2020_12_17_205712_create_withdraw_requests_table', 41),
(68, '2021_02_22_161510_create_notifications_table', 42),
(69, '2021_02_24_154706_add_deal_type_to_flash_deals', 43),
(70, '2021_03_03_204349_add_cm_firebase_token_to_users', 44),
(71, '2021_04_17_134848_add_column_to_order_details_stock', 45),
(72, '2021_05_12_155401_add_auth_token_seller', 46),
(73, '2021_06_03_104531_ex_rate_update', 47),
(74, '2021_06_03_222413_amount_withdraw_req', 48),
(75, '2021_06_04_154501_seller_wallet_withdraw_bal', 49),
(76, '2021_06_04_195853_product_dis_tax', 50),
(77, '2021_05_27_103505_create_product_translations_table', 51),
(78, '2021_06_17_054551_create_soft_credentials_table', 51),
(79, '2021_06_29_212549_add_active_col_user_table', 52),
(80, '2021_06_30_212619_add_col_to_contact', 53),
(81, '2021_07_01_160828_add_col_daily_needs_products', 54),
(82, '2021_07_04_182331_add_col_seller_sales_commission', 55),
(83, '2021_08_07_190655_add_seo_columns_to_products', 56),
(84, '2021_08_07_205913_add_col_to_category_table', 56),
(85, '2021_08_07_210808_add_col_to_shops_table', 56),
(86, '2021_08_14_205216_change_product_price_col_type', 56),
(87, '2021_08_16_201505_change_order_price_col', 56),
(88, '2021_08_16_201552_change_order_details_price_col', 56),
(89, '2019_09_29_154000_create_payment_cards_table', 57),
(90, '2021_08_17_213934_change_col_type_seller_earning_history', 57),
(91, '2021_08_17_214109_change_col_type_admin_earning_history', 57),
(92, '2021_08_17_214232_change_col_type_admin_wallet', 57),
(93, '2021_08_17_214405_change_col_type_seller_wallet', 57),
(94, '2021_08_22_184834_add_publish_to_products_table', 57),
(95, '2021_09_08_211832_add_social_column_to_users_table', 57),
(96, '2021_09_13_165535_add_col_to_user', 57),
(97, '2021_09_19_061647_add_limit_to_coupons_table', 57),
(98, '2021_09_20_020716_add_coupon_code_to_orders_table', 57),
(99, '2021_09_23_003059_add_gst_to_sellers_table', 57),
(100, '2021_09_28_025411_create_order_transactions_table', 57),
(101, '2021_10_02_185124_create_carts_table', 57),
(102, '2021_10_02_190207_create_cart_shippings_table', 57),
(103, '2021_10_03_194334_add_col_order_table', 57),
(104, '2021_10_03_200536_add_shipping_cost', 57),
(105, '2021_10_04_153201_add_col_to_order_table', 57),
(106, '2021_10_07_172701_add_col_cart_shop_info', 57),
(107, '2021_10_07_184442_create_phone_or_email_verifications_table', 57),
(108, '2021_10_07_185416_add_user_table_email_verified', 57),
(109, '2021_10_11_192739_add_transaction_amount_table', 57),
(110, '2021_10_11_200850_add_order_verification_code', 57),
(111, '2021_10_12_083241_add_col_to_order_transaction', 57),
(112, '2021_10_12_084440_add_seller_id_to_order', 57),
(113, '2021_10_12_102853_change_col_type', 57),
(114, '2021_10_12_110434_add_col_to_admin_wallet', 57),
(115, '2021_10_12_110829_add_col_to_seller_wallet', 57),
(116, '2021_10_13_091801_add_col_to_admin_wallets', 57),
(117, '2021_10_13_092000_add_col_to_seller_wallets_tax', 57),
(118, '2021_10_13_165947_rename_and_remove_col_seller_wallet', 57),
(119, '2021_10_13_170258_rename_and_remove_col_admin_wallet', 57),
(120, '2021_10_14_061603_column_update_order_transaction', 57),
(121, '2021_10_15_103339_remove_col_from_seller_wallet', 57),
(122, '2021_10_15_104419_add_id_col_order_tran', 57),
(123, '2021_10_15_213454_update_string_limit', 57),
(124, '2021_10_16_234037_change_col_type_translation', 57),
(125, '2021_10_16_234329_change_col_type_translation_1', 57),
(126, '2021_10_27_091250_add_shipping_address_in_order', 58),
(127, '2021_01_24_205114_create_paytabs_invoices_table', 59),
(128, '2021_11_20_043814_change_pass_reset_email_col', 59),
(129, '2021_11_25_043109_create_delivery_men_table', 60),
(130, '2021_11_25_062242_add_auth_token_delivery_man', 60),
(131, '2021_11_27_043405_add_deliveryman_in_order_table', 60),
(132, '2021_11_27_051432_create_delivery_histories_table', 60),
(133, '2021_11_27_051512_add_fcm_col_for_delivery_man', 60),
(134, '2021_12_15_123216_add_columns_to_banner', 60),
(135, '2022_01_04_100543_add_order_note_to_orders_table', 60),
(136, '2022_01_10_034952_add_lat_long_to_shipping_addresses_table', 60),
(137, '2022_01_10_045517_create_billing_addresses_table', 60),
(138, '2022_01_11_040755_add_is_billing_to_shipping_addresses_table', 60),
(139, '2022_01_11_053404_add_billing_to_orders_table', 60),
(140, '2022_01_11_234310_add_firebase_toke_to_sellers_table', 60),
(141, '2022_01_16_121801_change_colu_type', 60),
(142, '2022_01_22_101601_change_cart_col_type', 61),
(143, '2022_01_23_031359_add_column_to_orders_table', 61),
(144, '2022_01_28_235054_add_status_to_admins_table', 61),
(145, '2022_02_01_214654_add_pos_status_to_sellers_table', 61),
(146, '2019_12_14_000001_create_personal_access_tokens_table', 62),
(147, '2022_02_11_225355_add_checked_to_orders_table', 62),
(148, '2022_02_14_114359_create_refund_requests_table', 62),
(149, '2022_02_14_115757_add_refund_request_to_order_details_table', 62),
(150, '2022_02_15_092604_add_order_details_id_to_transactions_table', 62),
(151, '2022_02_15_121410_create_refund_transactions_table', 62),
(152, '2022_02_24_091236_add_multiple_column_to_refund_requests_table', 62),
(153, '2022_02_24_103827_create_refund_statuses_table', 62),
(154, '2022_03_01_121420_add_refund_id_to_refund_transactions_table', 62),
(155, '2022_03_10_091943_add_priority_to_categories_table', 63),
(156, '2022_03_13_111914_create_shipping_types_table', 63),
(157, '2022_03_13_121514_create_category_shipping_costs_table', 63),
(158, '2022_03_14_074413_add_four_column_to_products_table', 63),
(159, '2022_03_15_105838_add_shipping_to_carts_table', 63),
(160, '2022_03_16_070327_add_shipping_type_to_orders_table', 63),
(161, '2022_03_17_070200_add_delivery_info_to_orders_table', 63),
(162, '2022_03_18_143339_add_shipping_type_to_carts_table', 63),
(163, '2022_04_06_020313_create_subscriptions_table', 64),
(164, '2022_04_12_233704_change_column_to_products_table', 64),
(165, '2022_04_19_095926_create_jobs_table', 64),
(166, '2022_05_12_104247_create_wallet_transactions_table', 65),
(167, '2022_05_12_104511_add_two_column_to_users_table', 65),
(168, '2022_05_14_063309_create_loyalty_point_transactions_table', 65),
(169, '2022_05_26_044016_add_user_type_to_password_resets_table', 65),
(170, '2022_04_15_235820_add_provider', 66),
(171, '2022_07_21_101659_add_code_to_products_table', 66),
(172, '2022_07_26_103744_add_notification_count_to_notifications_table', 66),
(173, '2022_07_31_031541_add_minimum_order_qty_to_products_table', 66),
(174, '2022_08_11_172839_add_product_type_and_digital_product_type_and_digital_file_ready_to_products', 67),
(175, '2022_08_11_173941_add_product_type_and_digital_product_type_and_digital_file_to_order_details', 67),
(176, '2022_08_20_094225_add_product_type_and_digital_product_type_and_digital_file_ready_to_carts_table', 67),
(177, '2022_10_04_160234_add_banking_columns_to_delivery_men_table', 68),
(178, '2022_10_04_161339_create_deliveryman_wallets_table', 68),
(179, '2022_10_04_184506_add_deliverymanid_column_to_withdraw_requests_table', 68),
(180, '2022_10_11_103011_add_deliverymans_columns_to_chattings_table', 68),
(181, '2022_10_11_144902_add_deliverman_id_cloumn_to_reviews_table', 68),
(182, '2022_10_17_114744_create_order_status_histories_table', 68),
(183, '2022_10_17_120840_create_order_expected_delivery_histories_table', 68),
(184, '2022_10_18_084245_add_deliveryman_charge_and_expected_delivery_date', 68),
(185, '2022_10_18_130938_create_delivery_zip_codes_table', 68),
(186, '2022_10_18_130956_create_delivery_country_codes_table', 68),
(187, '2022_10_20_164712_create_delivery_man_transactions_table', 68),
(188, '2022_10_27_145604_create_emergency_contacts_table', 68),
(189, '2022_10_29_182930_add_is_pause_cause_to_orders_table', 68),
(190, '2022_10_31_150604_add_address_phone_country_code_column_to_delivery_men_table', 68),
(191, '2022_11_05_185726_add_order_id_to_reviews_table', 68),
(192, '2022_11_07_190749_create_deliveryman_notifications_table', 68),
(193, '2022_11_08_132745_change_transaction_note_type_to_withdraw_requests_table', 68),
(194, '2022_11_10_193747_chenge_order_amount_seller_amount_admin_commission_delivery_charge_tax_toorder_transactions_table', 68),
(195, '2022_12_17_035723_few_field_add_to_coupons_table', 69),
(196, '2022_12_26_231606_add_coupon_discount_bearer_and_admin_commission_to_orders', 69),
(197, '2023_01_04_003034_alter_billing_addresses_change_zip', 69),
(198, '2023_01_05_121600_change_id_to_transactions_table', 69),
(199, '2023_10_07_140653_create_supplier_management_table', 70);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `description` varchar(191) DEFAULT NULL,
  `notification_count` int(11) NOT NULL DEFAULT 0,
  `image` varchar(50) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('6840b7d4ed685bf2e0dc593affa0bd3b968065f47cc226d39ab09f1422b5a1d9666601f3f60a79c1', 98, 1, 'LaravelAuthApp', '[]', 1, '2021-07-05 09:25:41', '2021-07-05 09:25:41', '2022-07-05 15:25:41'),
('c42cdd5ae652b8b2cbac4f2f4b496e889e1a803b08672954c8bbe06722b54160e71dce3e02331544', 98, 1, 'LaravelAuthApp', '[]', 1, '2021-07-05 09:24:36', '2021-07-05 09:24:36', '2022-07-05 15:24:36');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `secret` varchar(100) NOT NULL,
  `redirect` text NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `provider` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`, `provider`) VALUES
(1, NULL, '6amtech', 'GEUx5tqkviM6AAQcz4oi1dcm1KtRdJPgw41lj0eI', 'http://localhost', 1, 0, 0, '2020-10-21 18:27:22', '2020-10-21 18:27:22', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2020-10-21 18:27:23', '2020-10-21 18:27:23');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) NOT NULL,
  `access_token_id` varchar(100) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` varchar(15) DEFAULT NULL,
  `customer_type` varchar(10) DEFAULT NULL,
  `payment_status` varchar(15) NOT NULL DEFAULT 'unpaid',
  `order_status` varchar(50) NOT NULL DEFAULT 'pending',
  `payment_method` varchar(100) DEFAULT NULL,
  `transaction_ref` varchar(30) DEFAULT NULL,
  `order_amount` double NOT NULL DEFAULT 0,
  `admin_commission` decimal(8,2) NOT NULL DEFAULT 0.00,
  `is_pause` varchar(20) NOT NULL DEFAULT '0',
  `cause` varchar(191) DEFAULT NULL,
  `shipping_address` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `discount_amount` double NOT NULL DEFAULT 0,
  `discount_type` varchar(30) DEFAULT NULL,
  `coupon_code` varchar(191) DEFAULT NULL,
  `coupon_discount_bearer` varchar(191) NOT NULL DEFAULT 'inhouse',
  `shipping_method_id` bigint(20) NOT NULL DEFAULT 0,
  `shipping_cost` double(8,2) NOT NULL DEFAULT 0.00,
  `order_group_id` varchar(191) NOT NULL DEFAULT 'def-order-group',
  `verification_code` varchar(191) NOT NULL DEFAULT '0',
  `seller_id` bigint(20) DEFAULT NULL,
  `seller_is` varchar(191) DEFAULT NULL,
  `shipping_address_data` text DEFAULT NULL,
  `delivery_man_id` bigint(20) DEFAULT NULL,
  `deliveryman_charge` double NOT NULL DEFAULT 0,
  `expected_delivery_date` date DEFAULT NULL,
  `order_note` text DEFAULT NULL,
  `billing_address` bigint(20) UNSIGNED DEFAULT NULL,
  `billing_address_data` text DEFAULT NULL,
  `order_type` varchar(191) NOT NULL DEFAULT 'default_type',
  `extra_discount` double(8,2) NOT NULL DEFAULT 0.00,
  `extra_discount_type` varchar(191) DEFAULT NULL,
  `checked` tinyint(1) NOT NULL DEFAULT 0,
  `shipping_type` varchar(191) DEFAULT NULL,
  `delivery_type` varchar(191) DEFAULT NULL,
  `delivery_service_name` varchar(191) DEFAULT NULL,
  `third_party_delivery_tracking_id` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `customer_id`, `customer_type`, `payment_status`, `order_status`, `payment_method`, `transaction_ref`, `order_amount`, `admin_commission`, `is_pause`, `cause`, `shipping_address`, `created_at`, `updated_at`, `discount_amount`, `discount_type`, `coupon_code`, `coupon_discount_bearer`, `shipping_method_id`, `shipping_cost`, `order_group_id`, `verification_code`, `seller_id`, `seller_is`, `shipping_address_data`, `delivery_man_id`, `deliveryman_charge`, `expected_delivery_date`, `order_note`, `billing_address`, `billing_address_data`, `order_type`, `extra_discount`, `extra_discount_type`, `checked`, `shipping_type`, `delivery_type`, `delivery_service_name`, `third_party_delivery_tracking_id`) VALUES
(100001, '2', 'customer', 'unpaid', 'out_for_delivery', 'cash_on_delivery', '', 214, 0.00, '0', NULL, '1', '2023-08-11 09:39:45', '2023-08-11 09:41:35', 0, NULL, '0', 'inhouse', 2, 5.00, '7567-tOlbh-1691753985', '240927', 1, 'admin', '{\"id\":1,\"customer_id\":2,\"contact_person_name\":\"mesbaul alom\",\"address_type\":\"home\",\"address\":\"Bashundhara Residential Area,Dhaka\\r\\ndhaka\",\"city\":\"Dhaka\",\"zip\":\"1229\",\"phone\":\"01780882914\",\"created_at\":\"2023-08-11T11:39:41.000000Z\",\"updated_at\":\"2023-08-11T11:39:41.000000Z\",\"state\":null,\"country\":\"Bangladesh\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', NULL, 0, NULL, 'dcd', NULL, NULL, 'default_type', 0.00, NULL, 1, 'order_wise', NULL, NULL, NULL),
(100002, '4', 'customer', 'unpaid', 'pending', 'cash_on_delivery', '', 2695, 0.00, '0', NULL, '2', '2023-08-16 23:40:56', '2023-08-16 23:42:06', 0, NULL, '0', 'inhouse', 2, 5.00, '8185-8G3jg-1692189656', '862054', 1, 'admin', '{\"id\":2,\"customer_id\":0,\"contact_person_name\":\"Md Safir Uddin Titu\",\"address_type\":\"home\",\"address\":\"Village: Durgapur, PS+Post office: Bishwambarpur, District: Sunamganj\",\"city\":\"Sunamganj\",\"zip\":\"3010\",\"phone\":\"+8801773470176\",\"created_at\":\"2023-08-16T12:40:35.000000Z\",\"updated_at\":\"2023-08-16T12:40:35.000000Z\",\"state\":null,\"country\":\"Bangladesh\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', NULL, 0, NULL, NULL, NULL, NULL, 'default_type', 0.00, NULL, 1, 'order_wise', NULL, NULL, NULL),
(100003, '2', 'customer', 'unpaid', 'pending', 'cash_on_delivery', '', 1460, 0.00, '0', NULL, '1', '2023-08-26 19:48:59', '2023-08-26 19:52:24', 0, NULL, '0', 'inhouse', 10, 0.00, '2049-yaOw1-1693039739', '192110', 1, 'admin', '{\"id\":1,\"customer_id\":2,\"contact_person_name\":\"mesbaul alom\",\"address_type\":\"home\",\"address\":\"Bashundhara Residential Area,Dhaka\\r\\ndhaka\",\"city\":\"Dhaka\",\"zip\":\"1229\",\"phone\":\"01780882914\",\"created_at\":\"2023-08-10T22:39:41.000000Z\",\"updated_at\":\"2023-08-10T22:39:41.000000Z\",\"state\":null,\"country\":\"Bangladesh\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', NULL, 0, NULL, 'ff', 1, '{\"id\":1,\"customer_id\":2,\"contact_person_name\":\"mesbaul alom\",\"address_type\":\"home\",\"address\":\"Bashundhara Residential Area,Dhaka\\r\\ndhaka\",\"city\":\"Dhaka\",\"zip\":\"1229\",\"phone\":\"01780882914\",\"created_at\":\"2023-08-10T22:39:41.000000Z\",\"updated_at\":\"2023-08-10T22:39:41.000000Z\",\"state\":null,\"country\":\"Bangladesh\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'order_wise', NULL, NULL, NULL),
(100004, '2', 'customer', 'unpaid', 'pending', 'cash_on_delivery', '', 1530, 0.00, '0', NULL, '1', '2023-08-26 19:49:57', '2023-08-26 19:52:24', 0, NULL, '0', 'inhouse', 2, 70.00, '2740-TuksA-1693039797', '616037', 1, 'admin', '{\"id\":1,\"customer_id\":2,\"contact_person_name\":\"mesbaul alom\",\"address_type\":\"home\",\"address\":\"Bashundhara Residential Area,Dhaka\\r\\ndhaka\",\"city\":\"Dhaka\",\"zip\":\"1229\",\"phone\":\"01780882914\",\"created_at\":\"2023-08-10T22:39:41.000000Z\",\"updated_at\":\"2023-08-10T22:39:41.000000Z\",\"state\":null,\"country\":\"Bangladesh\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', NULL, 0, NULL, NULL, 1, '{\"id\":1,\"customer_id\":2,\"contact_person_name\":\"mesbaul alom\",\"address_type\":\"home\",\"address\":\"Bashundhara Residential Area,Dhaka\\r\\ndhaka\",\"city\":\"Dhaka\",\"zip\":\"1229\",\"phone\":\"01780882914\",\"created_at\":\"2023-08-10T22:39:41.000000Z\",\"updated_at\":\"2023-08-10T22:39:41.000000Z\",\"state\":null,\"country\":\"Bangladesh\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'order_wise', NULL, NULL, NULL),
(100005, '2', 'customer', 'unpaid', 'pending', 'cash_on_delivery', '', 1480, 0.00, '0', NULL, '1', '2023-08-26 19:51:01', '2023-08-26 19:52:24', 50, 'coupon_discount', 'slae10', 'inhouse', 2, 70.00, '4420-YpQsq-1693039861', '294209', 1, 'admin', '{\"id\":1,\"customer_id\":2,\"contact_person_name\":\"mesbaul alom\",\"address_type\":\"home\",\"address\":\"Bashundhara Residential Area,Dhaka\\r\\ndhaka\",\"city\":\"Dhaka\",\"zip\":\"1229\",\"phone\":\"01780882914\",\"created_at\":\"2023-08-10T22:39:41.000000Z\",\"updated_at\":\"2023-08-10T22:39:41.000000Z\",\"state\":null,\"country\":\"Bangladesh\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', NULL, 0, NULL, 'xxvx', 1, '{\"id\":1,\"customer_id\":2,\"contact_person_name\":\"mesbaul alom\",\"address_type\":\"home\",\"address\":\"Bashundhara Residential Area,Dhaka\\r\\ndhaka\",\"city\":\"Dhaka\",\"zip\":\"1229\",\"phone\":\"01780882914\",\"created_at\":\"2023-08-10T22:39:41.000000Z\",\"updated_at\":\"2023-08-10T22:39:41.000000Z\",\"state\":null,\"country\":\"Bangladesh\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'order_wise', NULL, NULL, NULL),
(100006, '7', 'customer', 'unpaid', 'pending', 'cash_on_delivery', '', 1480, 0.00, '0', NULL, '5', '2023-08-26 22:24:36', '2023-08-27 00:52:06', 0, NULL, '0', 'inhouse', 10, 0.00, '7379-oNNnH-1693049076', '243052', 1, 'admin', '{\"id\":5,\"customer_id\":7,\"contact_person_name\":\"Nijum\",\"address_type\":\"home\",\"address\":\"Moriccah\",\"city\":\"cox\'s Bazar \",\"zip\":\"5047\",\"phone\":\"01824234587\",\"created_at\":\"2023-08-26T11:24:34.000000Z\",\"updated_at\":\"2023-08-26T11:24:34.000000Z\",\"state\":null,\"country\":\"Bangladesh\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', NULL, 0, NULL, NULL, NULL, NULL, 'default_type', 0.00, NULL, 1, 'order_wise', NULL, NULL, NULL),
(100007, '4', 'customer', 'unpaid', 'pending', 'cash_on_delivery', '', 5875, 0.00, '0', NULL, '6', '2023-09-09 18:30:31', '2023-09-09 18:31:11', 0, NULL, '0', 'inhouse', 9, 150.00, '6042-0Zzfb-1694248231', '671663', 1, 'admin', '{\"id\":6,\"customer_id\":0,\"contact_person_name\":\"Md Safir Uddin Titu\",\"address_type\":\"permanent\",\"address\":\"Village: Durgapur, PS+Post office: Bishwambarpur, District: Sunamganj\",\"city\":\"Sunamganj\",\"zip\":\"3010\",\"phone\":\"+8801773470176\",\"created_at\":\"2023-09-09T08:30:27.000000Z\",\"updated_at\":\"2023-09-09T08:30:27.000000Z\",\"state\":null,\"country\":\"Bangladesh\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', NULL, 0, NULL, NULL, NULL, NULL, 'default_type', 0.00, NULL, 1, 'order_wise', NULL, NULL, NULL),
(100008, '4', 'customer', 'unpaid', 'pending', 'cash_on_delivery', '', 1920, 0.00, '0', NULL, '7', '2023-09-09 18:58:37', '2023-09-09 18:58:50', 0, NULL, '0', 'inhouse', 9, 120.00, '8723-6jPsZ-1694249917', '463605', 1, 'admin', '{\"id\":7,\"customer_id\":4,\"contact_person_name\":\"Md Safir Uddin Titu\",\"address_type\":\"permanent\",\"address\":\"Village: Durgapur, PS+Post office: Bishwambarpur, District: Sunamganj\",\"city\":\"Sunamganj\",\"zip\":\"3010\",\"phone\":\"+8801773470176\",\"created_at\":\"2023-09-09T08:58:35.000000Z\",\"updated_at\":\"2023-09-09T08:58:35.000000Z\",\"state\":null,\"country\":\"Bangladesh\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', NULL, 0, NULL, NULL, NULL, NULL, 'default_type', 0.00, NULL, 1, 'order_wise', NULL, NULL, NULL),
(100009, '3', 'customer', 'paid', 'delivered', 'cash', NULL, 3600, 0.00, '0', NULL, NULL, '2023-10-04 17:07:55', '2023-10-04 17:07:55', 0, NULL, NULL, 'inhouse', 0, 0.00, 'def-order-group', '0', 1, 'admin', NULL, NULL, 0, NULL, NULL, NULL, NULL, 'POS', 0.00, NULL, 1, NULL, NULL, NULL, NULL),
(100010, '3', 'customer', 'paid', 'delivered', 'cash', NULL, 3250, 0.00, '0', NULL, NULL, '2023-10-05 19:43:40', '2023-10-05 19:43:40', 0, NULL, NULL, 'inhouse', 0, 0.00, 'def-order-group', '0', 1, 'admin', NULL, NULL, 0, NULL, NULL, NULL, NULL, 'POS', 0.00, NULL, 1, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `seller_id` bigint(20) DEFAULT NULL,
  `digital_file_after_sell` varchar(191) DEFAULT NULL,
  `product_details` text DEFAULT NULL,
  `qty` int(11) NOT NULL DEFAULT 0,
  `price` double NOT NULL DEFAULT 0,
  `tax` double NOT NULL DEFAULT 0,
  `discount` double NOT NULL DEFAULT 0,
  `delivery_status` varchar(15) NOT NULL DEFAULT 'pending',
  `payment_status` varchar(15) NOT NULL DEFAULT 'unpaid',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `shipping_method_id` bigint(20) DEFAULT NULL,
  `variant` varchar(255) DEFAULT NULL,
  `variation` varchar(255) DEFAULT NULL,
  `discount_type` varchar(30) DEFAULT NULL,
  `is_stock_decreased` tinyint(1) NOT NULL DEFAULT 1,
  `refund_request` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `seller_id`, `digital_file_after_sell`, `product_details`, `qty`, `price`, `tax`, `discount`, `delivery_status`, `payment_status`, `created_at`, `updated_at`, `shipping_method_id`, `variant`, `variation`, `discount_type`, `is_stock_decreased`, `refund_request`) VALUES
(1, 100001, 2, 1, NULL, '{\"id\":2,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Long Shirt\",\"slug\":\"demo-product-23-j5W2jA\",\"product_type\":\"physical\",\"category_ids\":\"[{\\\"id\\\":\\\"2\\\",\\\"position\\\":1}]\",\"brand_id\":1,\"unit\":\"pc\",\"min_qty\":33,\"refundable\":0,\"digital_product_type\":null,\"digital_file_ready\":null,\"images\":\"[\\\"def.png\\\",\\\"2023-08-11-64d618ec2452b.png\\\"]\",\"thumbnail\":\"2023-08-11-64d618ec24cc0.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":55,\"purchase_price\":59,\"tax\":5,\"tax_type\":\"percent\",\"discount\":10,\"discount_type\":\"percent\",\"current_stock\":100,\"minimum_order_qty\":1,\"details\":\"<p>Long Shirt<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":null,\"updated_at\":\"2023-08-11T11:18:04.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Elate Premium Basmati Rice 5 KG\",\"meta_description\":\"Elate Premium Basmati Rice 5 KG\",\"meta_image\":null,\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"107675\",\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 4, 55, 11, 22, 'pending', 'unpaid', '2023-08-11 09:39:45', '2023-08-11 09:39:45', NULL, '', '[]', 'discount_on_product', 1, 0),
(2, 100002, 3, 1, NULL, '{\"id\":3,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Indian chicken curry dress tree pis\",\"slug\":\"indian-chicken-curry-dress-tree-pis-KSKKlR\",\"product_type\":\"physical\",\"category_ids\":\"[{\\\"id\\\":\\\"4\\\",\\\"position\\\":1}]\",\"brand_id\":1,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"digital_product_type\":null,\"digital_file_ready\":null,\"images\":\"[\\\"2023-08-14-64da1854c7be3.png\\\",\\\"2023-08-14-64da1854cce84.png\\\",\\\"2023-08-14-64da1854d269e.png\\\"]\",\"thumbnail\":\"2023-08-14-64da1854d2794.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":\"0\",\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":1500,\"purchase_price\":1550,\"tax\":0,\"tax_type\":\"percent\",\"discount\":20,\"discount_type\":\"flat\",\"current_stock\":20,\"minimum_order_qty\":\"1\",\"details\":\"<p>Indian chicken curry dress tree pis&nbsp;<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2023-08-14T12:04:36.000000Z\",\"updated_at\":\"2023-08-14T12:15:33.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"New product\",\"meta_description\":\"New\",\"meta_image\":\"def.png\",\"request_status\":\"1\",\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"123456\",\"reviews_count\":\"0\",\"translations\":[],\"reviews\":[]}', 1, 1500, 0, 20, 'pending', 'unpaid', '2023-08-16 23:40:56', '2023-08-16 23:40:56', NULL, '', '[]', 'discount_on_product', 1, 0),
(3, 100002, 5, 1, NULL, '{\"id\":5,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Tree pis\",\"slug\":\"tree-pis-Via9cc\",\"product_type\":\"physical\",\"category_ids\":\"[{\\\"id\\\":\\\"4\\\",\\\"position\\\":1}]\",\"brand_id\":1,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"digital_product_type\":null,\"digital_file_ready\":null,\"images\":\"[\\\"2023-08-14-64da6599cf2cb.png\\\"]\",\"thumbnail\":\"2023-08-14-64da6599d215a.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":\"0\",\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":1200,\"purchase_price\":1400,\"tax\":5,\"tax_type\":\"percent\",\"discount\":50,\"discount_type\":\"flat\",\"current_stock\":10,\"minimum_order_qty\":\"1\",\"details\":\"<p>Tree pis<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2023-08-14T17:34:17.000000Z\",\"updated_at\":\"2023-08-14T17:34:17.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"New product\",\"meta_description\":\"New product\",\"meta_image\":\"def.png\",\"request_status\":\"1\",\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"123458\",\"reviews_count\":\"0\",\"translations\":[],\"reviews\":[]}', 1, 1200, 60, 50, 'pending', 'unpaid', '2023-08-16 23:40:56', '2023-08-16 23:40:56', NULL, '', '[]', 'discount_on_product', 1, 0),
(4, 100003, 4, 1, NULL, '{\"id\":4,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Tree pis\",\"slug\":\"tree-pis-0tgmir\",\"product_type\":\"physical\",\"category_ids\":\"[{\\\"id\\\":\\\"4\\\",\\\"position\\\":1}]\",\"brand_id\":1,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"digital_product_type\":null,\"digital_file_ready\":null,\"images\":\"[\\\"2023-08-14-64da1d7a3b46a.png\\\"]\",\"thumbnail\":\"2023-08-14-64da1d7a3bbc7.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":\"0\",\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":1400,\"purchase_price\":900,\"tax\":5,\"tax_type\":\"percent\",\"discount\":10,\"discount_type\":\"flat\",\"current_stock\":20,\"minimum_order_qty\":\"1\",\"details\":\"<p>Cotton Tree pis&nbsp;<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2023-08-14T12:26:34.000000Z\",\"updated_at\":\"2023-08-20T03:58:21.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"New product, three pies\",\"meta_description\":\"Tree pis , cotton,\",\"meta_image\":\"def.png\",\"request_status\":\"1\",\"denied_note\":null,\"shipping_cost\":120,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"110591\",\"reviews_count\":\"0\",\"translations\":[{\"translationable_type\":\"App\\\\Model\\\\Product\",\"translationable_id\":\"4\",\"locale\":\"bd\",\"key\":\"name\",\"value\":\"Tree pis\",\"id\":1},{\"translationable_type\":\"App\\\\Model\\\\Product\",\"translationable_id\":\"4\",\"locale\":\"bd\",\"key\":\"description\",\"value\":\"<p>Cotton Tree pis&nbsp;<\\/p>\",\"id\":2}],\"reviews\":[]}', 1, 1400, 70, 10, 'pending', 'unpaid', '2023-08-26 19:48:59', '2023-08-26 19:48:59', NULL, '', '[]', 'discount_on_product', 1, 0),
(5, 100004, 4, 1, NULL, '{\"id\":4,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Tree pis\",\"slug\":\"tree-pis-0tgmir\",\"product_type\":\"physical\",\"category_ids\":\"[{\\\"id\\\":\\\"4\\\",\\\"position\\\":1}]\",\"brand_id\":1,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"digital_product_type\":null,\"digital_file_ready\":null,\"images\":\"[\\\"2023-08-14-64da1d7a3b46a.png\\\"]\",\"thumbnail\":\"2023-08-14-64da1d7a3bbc7.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":\"0\",\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":1400,\"purchase_price\":900,\"tax\":5,\"tax_type\":\"percent\",\"discount\":10,\"discount_type\":\"flat\",\"current_stock\":19,\"minimum_order_qty\":\"1\",\"details\":\"<p>Cotton Tree pis&nbsp;<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2023-08-14T12:26:34.000000Z\",\"updated_at\":\"2023-08-26T08:48:59.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"New product, three pies\",\"meta_description\":\"Tree pis , cotton,\",\"meta_image\":\"def.png\",\"request_status\":\"1\",\"denied_note\":null,\"shipping_cost\":120,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"110591\",\"reviews_count\":\"0\",\"translations\":[{\"translationable_type\":\"App\\\\Model\\\\Product\",\"translationable_id\":\"4\",\"locale\":\"bd\",\"key\":\"name\",\"value\":\"Tree pis\",\"id\":1},{\"translationable_type\":\"App\\\\Model\\\\Product\",\"translationable_id\":\"4\",\"locale\":\"bd\",\"key\":\"description\",\"value\":\"<p>Cotton Tree pis&nbsp;<\\/p>\",\"id\":2}],\"reviews\":[]}', 1, 1400, 70, 10, 'pending', 'unpaid', '2023-08-26 19:49:57', '2023-08-26 19:49:57', NULL, '', '[]', 'discount_on_product', 1, 0),
(6, 100005, 4, 1, NULL, '{\"id\":4,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Tree pis\",\"slug\":\"tree-pis-0tgmir\",\"product_type\":\"physical\",\"category_ids\":\"[{\\\"id\\\":\\\"4\\\",\\\"position\\\":1}]\",\"brand_id\":1,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"digital_product_type\":null,\"digital_file_ready\":null,\"images\":\"[\\\"2023-08-14-64da1d7a3b46a.png\\\"]\",\"thumbnail\":\"2023-08-14-64da1d7a3bbc7.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":\"0\",\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":1400,\"purchase_price\":900,\"tax\":5,\"tax_type\":\"percent\",\"discount\":10,\"discount_type\":\"flat\",\"current_stock\":18,\"minimum_order_qty\":\"1\",\"details\":\"<p>Cotton Tree pis&nbsp;<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2023-08-14T12:26:34.000000Z\",\"updated_at\":\"2023-08-26T08:49:57.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"New product, three pies\",\"meta_description\":\"Tree pis , cotton,\",\"meta_image\":\"def.png\",\"request_status\":\"1\",\"denied_note\":null,\"shipping_cost\":120,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"110591\",\"reviews_count\":\"0\",\"translations\":[{\"translationable_type\":\"App\\\\Model\\\\Product\",\"translationable_id\":\"4\",\"locale\":\"bd\",\"key\":\"name\",\"value\":\"Tree pis\",\"id\":1},{\"translationable_type\":\"App\\\\Model\\\\Product\",\"translationable_id\":\"4\",\"locale\":\"bd\",\"key\":\"description\",\"value\":\"<p>Cotton Tree pis&nbsp;<\\/p>\",\"id\":2}],\"reviews\":[]}', 1, 1400, 70, 10, 'pending', 'unpaid', '2023-08-26 19:51:01', '2023-08-26 19:51:01', NULL, '', '[]', 'discount_on_product', 1, 0),
(7, 100006, 3, 1, NULL, '{\"id\":3,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Indian chicken curry dress tree pis\",\"slug\":\"indian-chicken-curry-dress-tree-pis-KSKKlR\",\"product_type\":\"physical\",\"category_ids\":\"[{\\\"id\\\":\\\"4\\\",\\\"position\\\":1}]\",\"brand_id\":1,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"digital_product_type\":null,\"digital_file_ready\":null,\"images\":\"[\\\"2023-08-14-64da1854c7be3.png\\\",\\\"2023-08-14-64da1854cce84.png\\\",\\\"2023-08-14-64da1854d269e.png\\\"]\",\"thumbnail\":\"2023-08-14-64da1854d2794.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":\"0\",\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":1500,\"purchase_price\":1550,\"tax\":0,\"tax_type\":\"percent\",\"discount\":20,\"discount_type\":\"flat\",\"current_stock\":19,\"minimum_order_qty\":\"1\",\"details\":\"<p>Indian chicken curry dress tree pis&nbsp;<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2023-08-14T12:04:36.000000Z\",\"updated_at\":\"2023-08-16T12:40:56.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"New product\",\"meta_description\":\"New\",\"meta_image\":\"def.png\",\"request_status\":\"1\",\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"123456\",\"reviews_count\":\"0\",\"translations\":[],\"reviews\":[]}', 1, 1500, 0, 20, 'pending', 'unpaid', '2023-08-26 22:24:36', '2023-08-26 22:24:36', NULL, '', '[]', 'discount_on_product', 1, 0),
(8, 100007, 4, 1, NULL, '{\"id\":4,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Tree pis\",\"slug\":\"tree-pis-0tgmir\",\"product_type\":\"physical\",\"category_ids\":\"[{\\\"id\\\":\\\"4\\\",\\\"position\\\":1}]\",\"brand_id\":1,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"digital_product_type\":null,\"digital_file_ready\":null,\"images\":\"[\\\"2023-08-14-64da1d7a3b46a.png\\\"]\",\"thumbnail\":\"2023-08-14-64da1d7a3bbc7.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":1400,\"purchase_price\":900,\"tax\":5,\"tax_type\":\"percent\",\"discount\":10,\"discount_type\":\"flat\",\"current_stock\":17,\"minimum_order_qty\":1,\"details\":\"<p>Cotton Tree pis&nbsp;<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2023-08-14T13:26:34.000000Z\",\"updated_at\":\"2023-08-26T10:11:07.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"New product, three pies\",\"meta_description\":\"Tree pis , cotton,\",\"meta_image\":\"def.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":120,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"110591\",\"reviews_count\":0,\"translations\":[{\"translationable_type\":\"App\\\\Model\\\\Product\",\"translationable_id\":4,\"locale\":\"bd\",\"key\":\"name\",\"value\":\"Tree pis\",\"id\":1},{\"translationable_type\":\"App\\\\Model\\\\Product\",\"translationable_id\":4,\"locale\":\"bd\",\"key\":\"description\",\"value\":\"<p>Cotton Tree pis&nbsp;<\\/p>\",\"id\":2}],\"reviews\":[]}', 1, 1400, 70, 10, 'pending', 'unpaid', '2023-09-09 18:30:31', '2023-09-09 18:30:31', NULL, '', '[]', 'discount_on_product', 1, 0),
(9, 100007, 3, 1, NULL, '{\"id\":3,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Indian chicken curry dress tree pis\",\"slug\":\"indian-chicken-curry-dress-tree-pis-KSKKlR\",\"product_type\":\"physical\",\"category_ids\":\"[{\\\"id\\\":\\\"4\\\",\\\"position\\\":1}]\",\"brand_id\":1,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"digital_product_type\":null,\"digital_file_ready\":null,\"images\":\"[\\\"2023-08-14-64da1854c7be3.png\\\",\\\"2023-08-14-64da1854cce84.png\\\",\\\"2023-08-14-64da1854d269e.png\\\"]\",\"thumbnail\":\"2023-08-14-64da1854d2794.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":1500,\"purchase_price\":1550,\"tax\":0,\"tax_type\":\"percent\",\"discount\":20,\"discount_type\":\"percent\",\"current_stock\":18,\"minimum_order_qty\":1,\"details\":\"<p>Indian chicken curry dress tree pis&nbsp;<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2023-08-14T13:04:36.000000Z\",\"updated_at\":\"2023-08-26T16:01:49.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"New product\",\"meta_description\":\"New\",\"meta_image\":\"def.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"123456\",\"reviews_count\":0,\"translations\":[{\"translationable_type\":\"App\\\\Model\\\\Product\",\"translationable_id\":3,\"locale\":\"bd\",\"key\":\"name\",\"value\":\"Indian chicken curry dress tree pis\",\"id\":5},{\"translationable_type\":\"App\\\\Model\\\\Product\",\"translationable_id\":3,\"locale\":\"bd\",\"key\":\"description\",\"value\":\"<p>Indian chicken curry dress tree pis&nbsp;<\\/p>\",\"id\":6}],\"reviews\":[]}', 2, 1500, 0, 40, 'pending', 'unpaid', '2023-09-09 18:30:31', '2023-09-09 18:30:31', NULL, '', '[]', 'discount_on_product', 1, 0),
(10, 100007, 10, 1, NULL, '{\"id\":10,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Indian chicken curry\",\"slug\":\"indian-chicken-curry-qGIIRC\",\"product_type\":\"physical\",\"category_ids\":\"[{\\\"id\\\":\\\"4\\\",\\\"position\\\":1},{\\\"id\\\":\\\"8\\\",\\\"position\\\":2}]\",\"brand_id\":1,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"digital_product_type\":null,\"digital_file_ready\":null,\"images\":\"[\\\"2023-08-27-64eb4564977ba.png\\\",\\\"2023-08-27-64eb45649d91d.png\\\",\\\"2023-08-27-64eb45649d9d3.png\\\"]\",\"thumbnail\":\"2023-08-27-64eb45649dab2.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":1450,\"purchase_price\":980,\"tax\":0,\"tax_type\":\"percent\",\"discount\":10,\"discount_type\":\"percent\",\"current_stock\":10,\"minimum_order_qty\":1,\"details\":\"<p>Indian chicken curry<br \\/>\\r\\n.. \\u2764\\ufe0f2 piece \\u2764\\ufe0f<br \\/>\\r\\nmaterial cotton<br \\/>\\r\\nbody :44.40.<br \\/>\\r\\nlong :43.42<br \\/>\\r\\nsalwar : free size.<br \\/>\\r\\ninner :free size<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2023-08-27T13:45:24.000000Z\",\"updated_at\":\"2023-08-27T13:45:36.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Indian chicken curry\",\"meta_description\":\"Indian chicken curry,  \\u09aa\\u09bf\\u0993\\u09b0 \\u09b8\\u09c1\\u09a4\\u09bf \\u09a5\\u09cd\\u09b0\\u09c0-\\u09aa\\u09bf\\u09b8, \\u09b8\\u09c7\\u09b2\\u09cb\\u09df\\u09be\\u09b0 \\u0995\\u09be\\u09ae\\u09bf\\u099c,\",\"meta_image\":\"2023-08-27-64eb45649dba7.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"113403\",\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 1450, 0, 145, 'pending', 'unpaid', '2023-09-09 18:30:32', '2023-09-09 18:30:32', NULL, '', '[]', 'discount_on_product', 1, 0),
(11, 100008, 12, 1, NULL, '{\"id\":12,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Indian Hanca\",\"slug\":\"indian-hanca-Lrwt25\",\"product_type\":\"physical\",\"category_ids\":\"[{\\\"id\\\":\\\"4\\\",\\\"position\\\":1},{\\\"id\\\":\\\"8\\\",\\\"position\\\":2}]\",\"brand_id\":1,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"digital_product_type\":null,\"digital_file_ready\":null,\"images\":\"[\\\"2023-09-08-64fb1791b484f.png\\\"]\",\"thumbnail\":\"2023-09-08-64fb1791b6d3c.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":2000,\"purchase_price\":12500,\"tax\":0,\"tax_type\":\"percent\",\"discount\":10,\"discount_type\":\"percent\",\"current_stock\":10,\"minimum_order_qty\":1,\"details\":\"<p><strong>Indian Hanca<\\/strong><\\/p>\\r\\n\\r\\n<p>\\u0987\\u09a8\\u09b6\\u09be\\u09b2\\u09cd\\u09b2\\u09be\\u09b9 \\u099c\\u09b2\\u09a6\\u09bf \\u099c\\u09b2\\u09a6\\u09bf \\u0995\\u09b0\\u09c7 \\u0985\\u09b0\\u09cd\\u09a1\\u09be\\u09b0 \\u0995\\u09a8\\u09ab\\u09be\\u09b0\\u09cd\\u09ae \\u0995\\u09b0\\u09c7 \\u09ab\\u09c7\\u09b2\\u09ac\\u09c7\\u09a8\\u0964<\\/p>\\r\\n\\r\\n<p><strong>\\u09ae\\u09cd\\u09af\\u09be\\u099f\\u09c7\\u09b0\\u09bf\\u09af\\u09bc\\u09be\\u09b2<\\/strong><\\/p>\\r\\n\\r\\n<p>\\u0995\\u09be\\u09ae\\u09bf\\u099c : \\u09a1\\u09bf\\u099c\\u09bf\\u099f\\u09be\\u09b2 \\u09aa\\u09bf\\u0993\\u09b0 \\u0995\\u099f\\u09a8 \\u09b2\\u09cb\\u09a8\\u0964<\\/p>\\r\\n\\r\\n<p>\\u09a6\\u09cb\\u09aa\\u09be\\u099f\\u09cd\\u099f\\u09be :\\u09a1\\u09bf\\u099c\\u09bf\\u099f\\u09be\\u09b2 \\u09aa\\u09cd\\u09b0\\u09bf\\u09a8\\u09cd\\u099f\\u09c7\\u09b0 \\u09a6\\u09cb\\u09aa\\u09be\\u099f\\u09cd\\u099f\\u09be \\u0995\\u099f\\u09a8\\u0964<\\/p>\\r\\n\\r\\n<p>\\u099f\\u09cd\\u09b0\\u09be\\u0989\\u099c\\u09be\\u09b0 :\\u0995\\u099f\\u09a8\\u0964<\\/p>\\r\\n\\r\\n<p>\\u0987\\u09a8\\u09b6\\u09be\\u09b2\\u09cd\\u09b2\\u09be\\u09b9 \\u099c\\u09b2\\u09a6\\u09bf \\u099c\\u09b2\\u09a6\\u09bf \\u0995\\u09b0\\u09c7 \\u0985\\u09b0\\u09cd\\u09a1\\u09be\\u09b0 \\u0995\\u09a8\\u09ab\\u09be\\u09b0\\u09cd\\u09ae \\u0995\\u09b0\\u09c7 \\u09ab\\u09c7\\u09b2\\u09ac\\u09c7\\u09a8\\u0964<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2023-09-08T12:46:09.000000Z\",\"updated_at\":\"2023-09-08T12:46:15.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"New product\",\"meta_description\":\"Indian Hanca, New Three piece,\",\"meta_image\":\"2023-09-08-64fb1791b6f62.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"210258\",\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 2000, 0, 200, 'pending', 'unpaid', '2023-09-09 18:58:37', '2023-09-09 18:58:37', NULL, '', '[]', 'discount_on_product', 1, 0),
(12, 100009, 3, 1, NULL, '{\"id\":3,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Indian chicken curry dress tree pis\",\"slug\":\"indian-chicken-curry-dress-tree-pis-KSKKlR\",\"product_type\":\"physical\",\"category_ids\":\"[{\\\"id\\\":\\\"4\\\",\\\"position\\\":1}]\",\"brand_id\":1,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"digital_product_type\":null,\"digital_file_ready\":null,\"images\":\"[\\\"2023-08-14-64da1854c7be3.png\\\",\\\"2023-08-14-64da1854cce84.png\\\",\\\"2023-08-14-64da1854d269e.png\\\"]\",\"thumbnail\":\"2023-08-14-64da1854d2794.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":1500,\"purchase_price\":1550,\"tax\":0,\"tax_type\":\"percent\",\"discount\":20,\"discount_type\":\"percent\",\"current_stock\":16,\"minimum_order_qty\":1,\"details\":\"<p>Indian chicken curry dress tree pis&nbsp;<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2023-08-14T10:04:36.000000Z\",\"updated_at\":\"2023-09-09T05:30:31.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"New product\",\"meta_description\":\"New\",\"meta_image\":\"def.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"123456\",\"reviews_count\":0,\"translations\":[{\"translationable_type\":\"App\\\\Model\\\\Product\",\"translationable_id\":3,\"locale\":\"bd\",\"key\":\"name\",\"value\":\"Indian chicken curry dress tree pis\",\"id\":5},{\"translationable_type\":\"App\\\\Model\\\\Product\",\"translationable_id\":3,\"locale\":\"bd\",\"key\":\"description\",\"value\":\"<p>Indian chicken curry dress tree pis&nbsp;<\\/p>\",\"id\":6}],\"reviews\":[]}', 3, 1500, 0, 900, 'delivered', 'paid', '2023-10-04 17:07:55', '2023-10-04 17:07:55', NULL, '', '[]', 'discount_on_product', 1, 0),
(13, 100010, 34, 1, NULL, '{\"id\":34,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"kashmir kathan koti\",\"slug\":\"kashmir-kathan-koti-PZdYgB\",\"product_type\":\"physical\",\"category_ids\":\"[{\\\"id\\\":\\\"16\\\",\\\"position\\\":1}]\",\"brand_id\":5,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"digital_product_type\":null,\"digital_file_ready\":null,\"images\":\"[\\\"2023-10-05-651e54492073e.png\\\"]\",\"thumbnail\":\"2023-10-05-651e544921430.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#000000\\\",\\\"#FFFAF0\\\",\\\"#FFFACD\\\",\\\"#F08080\\\",\\\"#87CEEB\\\"]\",\"variant_product\":0,\"attributes\":\"[\\\"12\\\",\\\"11\\\",\\\"13\\\",\\\"25\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_12\\\",\\\"title\\\":\\\"L-42\\\",\\\"options\\\":[\\\"10\\\"]},{\\\"name\\\":\\\"choice_11\\\",\\\"title\\\":\\\"M-40\\\",\\\"options\\\":[\\\"10\\\"]},{\\\"name\\\":\\\"choice_13\\\",\\\"title\\\":\\\"XL-44\\\",\\\"options\\\":[\\\"5\\\"]},{\\\"name\\\":\\\"choice_25\\\",\\\"title\\\":\\\"YOUNG-38\\\",\\\"options\\\":[\\\"5\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"Black-10-10-5-5\\\",\\\"price\\\":3250,\\\"sku\\\":\\\"kkk-Black-10-10-5-5\\\",\\\"qty\\\":6},{\\\"type\\\":\\\"FloralWhite-10-10-5-5\\\",\\\"price\\\":3250,\\\"sku\\\":\\\"kkk-FloralWhite-10-10-5-5\\\",\\\"qty\\\":6},{\\\"type\\\":\\\"LemonChiffon-10-10-5-5\\\",\\\"price\\\":3250,\\\"sku\\\":\\\"kkk-LemonChiffon-10-10-5-5\\\",\\\"qty\\\":6},{\\\"type\\\":\\\"LightCoral-10-10-5-5\\\",\\\"price\\\":3250,\\\"sku\\\":\\\"kkk-LightCoral-10-10-5-5\\\",\\\"qty\\\":6},{\\\"type\\\":\\\"SkyBlue-10-10-5-5\\\",\\\"price\\\":3250,\\\"sku\\\":\\\"kkk-SkyBlue-10-10-5-5\\\",\\\"qty\\\":6}]\",\"published\":0,\"unit_price\":3250,\"purchase_price\":1500,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":30,\"minimum_order_qty\":1,\"details\":null,\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2023-10-05T06:14:33.000000Z\",\"updated_at\":\"2023-10-05T06:14:33.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"def.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"157590\",\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 3250, 0, 0, 'delivered', 'paid', '2023-10-05 19:43:40', '2023-10-05 19:43:40', NULL, 'LightCoral-10-10-5-5', '{\"color\":\"LightCoral\",\"L-42\":\"10\",\"M-40\":\"10\",\"XL-44\":\"5\",\"YOUNG-38\":\"5\"}', 'discount_on_product', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `order_expected_delivery_histories`
--

CREATE TABLE `order_expected_delivery_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `user_type` varchar(191) NOT NULL,
  `expected_delivery_date` date NOT NULL,
  `cause` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_status_histories`
--

CREATE TABLE `order_status_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `user_type` varchar(191) NOT NULL,
  `status` varchar(191) NOT NULL,
  `cause` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_status_histories`
--

INSERT INTO `order_status_histories` (`id`, `order_id`, `user_id`, `user_type`, `status`, `cause`, `created_at`, `updated_at`) VALUES
(1, 100001, 2, 'customer', 'pending', NULL, '2023-08-11 09:39:45', '2023-08-11 09:39:45'),
(2, 100001, 0, 'admin', 'confirmed', NULL, '2023-08-11 09:41:19', '2023-08-11 09:41:19'),
(3, 100001, 0, 'admin', 'processing', NULL, '2023-08-11 09:41:28', '2023-08-11 09:41:28'),
(4, 100001, 0, 'admin', 'out_for_delivery', NULL, '2023-08-11 09:41:35', '2023-08-11 09:41:35'),
(5, 100002, 4, 'customer', 'pending', NULL, '2023-08-16 23:40:56', '2023-08-16 23:40:56'),
(6, 100003, 2, 'customer', 'pending', NULL, '2023-08-26 19:48:59', '2023-08-26 19:48:59'),
(7, 100004, 2, 'customer', 'pending', NULL, '2023-08-26 19:49:57', '2023-08-26 19:49:57'),
(8, 100005, 2, 'customer', 'pending', NULL, '2023-08-26 19:51:01', '2023-08-26 19:51:01'),
(9, 100006, 7, 'customer', 'pending', NULL, '2023-08-26 22:24:36', '2023-08-26 22:24:36'),
(10, 100007, 4, 'customer', 'pending', NULL, '2023-09-09 18:30:31', '2023-09-09 18:30:31'),
(11, 100008, 4, 'customer', 'pending', NULL, '2023-09-09 18:58:37', '2023-09-09 18:58:37');

-- --------------------------------------------------------

--
-- Table structure for table `order_transactions`
--

CREATE TABLE `order_transactions` (
  `seller_id` bigint(20) NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `order_amount` decimal(50,2) NOT NULL DEFAULT 0.00,
  `seller_amount` decimal(50,2) NOT NULL DEFAULT 0.00,
  `admin_commission` decimal(50,2) NOT NULL DEFAULT 0.00,
  `received_by` varchar(191) NOT NULL,
  `status` varchar(191) DEFAULT NULL,
  `delivery_charge` decimal(50,2) NOT NULL DEFAULT 0.00,
  `tax` decimal(50,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `seller_is` varchar(191) DEFAULT NULL,
  `delivered_by` varchar(191) NOT NULL DEFAULT 'admin',
  `payment_method` varchar(191) DEFAULT NULL,
  `transaction_id` varchar(191) DEFAULT NULL,
  `id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `identity` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `user_type` varchar(191) NOT NULL DEFAULT 'customer'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`identity`, `token`, `created_at`, `user_type`) VALUES
('+8801773470176', '8543', '2023-09-06 18:13:16', 'customer');

-- --------------------------------------------------------

--
-- Table structure for table `paytabs_invoices`
--

CREATE TABLE `paytabs_invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `result` text NOT NULL,
  `response_code` int(10) UNSIGNED NOT NULL,
  `pt_invoice_id` int(10) UNSIGNED DEFAULT NULL,
  `amount` double(8,2) DEFAULT NULL,
  `currency` varchar(191) DEFAULT NULL,
  `transaction_id` int(10) UNSIGNED DEFAULT NULL,
  `card_brand` varchar(191) DEFAULT NULL,
  `card_first_six_digits` int(10) UNSIGNED DEFAULT NULL,
  `card_last_four_digits` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phone_or_email_verifications`
--

CREATE TABLE `phone_or_email_verifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `phone_or_email` varchar(191) DEFAULT NULL,
  `token` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `added_by` varchar(191) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `name` varchar(80) DEFAULT NULL,
  `slug` varchar(120) DEFAULT NULL,
  `product_type` varchar(20) NOT NULL DEFAULT 'physical',
  `category_ids` varchar(80) DEFAULT NULL,
  `brand_id` bigint(20) DEFAULT NULL,
  `unit` varchar(191) DEFAULT NULL,
  `min_qty` int(11) NOT NULL DEFAULT 1,
  `refundable` tinyint(1) NOT NULL DEFAULT 1,
  `digital_product_type` varchar(30) DEFAULT NULL,
  `digital_file_ready` varchar(191) DEFAULT NULL,
  `images` longtext DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `featured` varchar(255) DEFAULT NULL,
  `flash_deal` varchar(255) DEFAULT NULL,
  `video_provider` varchar(30) DEFAULT NULL,
  `video_url` varchar(150) DEFAULT NULL,
  `colors` varchar(150) DEFAULT NULL,
  `variant_product` tinyint(1) NOT NULL DEFAULT 0,
  `attributes` varchar(255) DEFAULT NULL,
  `choice_options` text DEFAULT NULL,
  `variation` text DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT 0,
  `unit_price` double NOT NULL DEFAULT 0,
  `purchase_price` double NOT NULL DEFAULT 0,
  `tax` varchar(191) NOT NULL DEFAULT '0.00',
  `tax_type` varchar(80) DEFAULT NULL,
  `discount` varchar(191) NOT NULL DEFAULT '0.00',
  `discount_type` varchar(80) DEFAULT NULL,
  `current_stock` int(11) DEFAULT NULL,
  `minimum_order_qty` int(11) NOT NULL DEFAULT 1,
  `details` text DEFAULT NULL,
  `free_shipping` tinyint(1) NOT NULL DEFAULT 0,
  `attachment` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `featured_status` tinyint(1) NOT NULL DEFAULT 1,
  `meta_title` varchar(191) DEFAULT NULL,
  `meta_description` varchar(191) DEFAULT NULL,
  `meta_image` varchar(191) DEFAULT NULL,
  `request_status` tinyint(1) NOT NULL DEFAULT 0,
  `denied_note` varchar(191) DEFAULT NULL,
  `shipping_cost` double(8,2) DEFAULT NULL,
  `multiply_qty` tinyint(1) DEFAULT NULL,
  `temp_shipping_cost` double(8,2) DEFAULT NULL,
  `is_shipping_cost_updated` tinyint(1) DEFAULT NULL,
  `code` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `added_by`, `user_id`, `name`, `slug`, `product_type`, `category_ids`, `brand_id`, `unit`, `min_qty`, `refundable`, `digital_product_type`, `digital_file_ready`, `images`, `thumbnail`, `featured`, `flash_deal`, `video_provider`, `video_url`, `colors`, `variant_product`, `attributes`, `choice_options`, `variation`, `published`, `unit_price`, `purchase_price`, `tax`, `tax_type`, `discount`, `discount_type`, `current_stock`, `minimum_order_qty`, `details`, `free_shipping`, `attachment`, `created_at`, `updated_at`, `status`, `featured_status`, `meta_title`, `meta_description`, `meta_image`, `request_status`, `denied_note`, `shipping_cost`, `multiply_qty`, `temp_shipping_cost`, `is_shipping_cost_updated`, `code`) VALUES
(14, 'admin', 1, 'Kashmir Karim sherwani', 'kashmir-karim-sherwani-MM4Vd1', 'physical', '[{\"id\":\"5\",\"position\":1}]', 5, 'pc', 1, 1, NULL, NULL, '[\"2023-10-05-651da924635b4.png\"]', '2023-10-05-651da9246431c.png', NULL, NULL, 'youtube', NULL, '[\"#800000\"]', 0, '[\"11\",\"13\",\"14\",\"25\"]', '[{\"name\":\"choice_11\",\"title\":\"M-40\",\"options\":[\"2\"]},{\"name\":\"choice_13\",\"title\":\"XL-44\",\"options\":[\"2\"]},{\"name\":\"choice_14\",\"title\":\"XXL-46\",\"options\":[\"2\"]},{\"name\":\"choice_25\",\"title\":\"YOUNG-38\",\"options\":[\"2\"]}]', '[{\"type\":\"Maroon-2-2-2-2\",\"price\":13500,\"sku\":\"KKs-Maroon-2-2-2-2\",\"qty\":8}]', 0, 13500, 3800, '0', 'percent', '0', 'flat', 8, 1, NULL, 0, NULL, '2023-10-05 07:04:20', '2023-10-05 17:43:25', 1, 1, NULL, 'Name-kashmir karim serwani\r\nfabrics- indian kathan\r\nbutton-karchupi\r\nsize- M,L,XL,XXL', 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '151205'),
(15, 'admin', 1, 'kashmir premium sherwani', 'kashmir-premium-sherwani-lC8Hwy', 'physical', '[{\"id\":\"5\",\"position\":1}]', 5, 'pc', 1, 1, NULL, NULL, '[\"2023-10-05-651dadc7ea4ea.png\"]', '2023-10-05-651dadc7eb224.png', NULL, NULL, 'youtube', NULL, '[\"#FFD700\"]', 0, '[\"12\",\"11\",\"13\",\"25\"]', '[{\"name\":\"choice_12\",\"title\":\"L-42\",\"options\":[\"1\"]},{\"name\":\"choice_11\",\"title\":\"M-40\",\"options\":[\"1\"]},{\"name\":\"choice_13\",\"title\":\"XL-44\",\"options\":[\"1\"]},{\"name\":\"choice_25\",\"title\":\"YOUNG-38\",\"options\":[\"1\"]}]', '[{\"type\":\"Gold-1-1-1-1\",\"price\":8500,\"sku\":\"kps-Gold-1-1-1-1\",\"qty\":4}]', 0, 8500, 2700, '0', 'percent', '0', 'flat', 4, 1, NULL, 0, NULL, '2023-10-05 07:24:07', '2023-10-05 17:47:03', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '142936'),
(16, 'admin', 1, 'Premium kashmir karim', 'premium-kashmir-karim-yaAr0y', 'physical', '[{\"id\":\"5\",\"position\":1}]', 5, 'pc', 1, 1, NULL, NULL, '[\"2023-10-05-651db2a0cef46.png\",\"2023-10-05-651db2a0cf74b.png\"]', '2023-10-05-651db2a0cf822.png', NULL, NULL, 'youtube', NULL, '[\"#FFD700\"]', 0, '[\"12\",\"11\",\"13\",\"25\"]', '[{\"name\":\"choice_12\",\"title\":\"L-42\",\"options\":[\"2\"]},{\"name\":\"choice_11\",\"title\":\"M-40\",\"options\":[\"2\"]},{\"name\":\"choice_13\",\"title\":\"XL-44\",\"options\":[\"2\"]},{\"name\":\"choice_25\",\"title\":\"YOUNG-38\",\"options\":[\"2\"]}]', '[{\"type\":\"Gold-2-2-2-2\",\"price\":14500,\"sku\":\"Pkk-Gold-2-2-2-2\",\"qty\":8}]', 0, 14500, 6000, '0', 'percent', '0', 'flat', 8, 1, NULL, 0, NULL, '2023-10-05 07:44:48', '2023-10-05 17:49:27', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '109840'),
(17, 'admin', 1, 'Indian premium mangalam', 'indian-premium-mangalam-AMI9Bn', 'physical', '[{\"id\":\"13\",\"position\":1}]', 5, 'pc', 1, 1, NULL, NULL, '[\"2023-10-05-651e2d5d847f0.png\"]', '2023-10-05-651e2d5d850a4.png', NULL, NULL, 'youtube', NULL, '[\"#DAA520\"]', 0, '[\"12\",\"11\",\"13\",\"25\"]', '[{\"name\":\"choice_12\",\"title\":\"L-42\",\"options\":[\"4\"]},{\"name\":\"choice_11\",\"title\":\"M-40\",\"options\":[\"4\"]},{\"name\":\"choice_13\",\"title\":\"XL-44\",\"options\":[\"1\"]},{\"name\":\"choice_25\",\"title\":\"YOUNG-38\",\"options\":[\"1\"]}]', '[{\"type\":\"Goldenrod-4-4-1-1\",\"price\":4850,\"sku\":\"Ipm-Goldenrod-4-4-1-1\",\"qty\":10}]', 0, 4850, 2500, '0', 'percent', '0', 'flat', 10, 1, NULL, 0, NULL, '2023-10-05 16:28:29', '2023-10-05 20:31:10', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '116954'),
(18, 'admin', 1, 'kashmiry shikuyench', 'kashmiry-shikuyench-EpvnJ6', 'physical', '[{\"id\":\"15\",\"position\":1}]', 5, 'pc', 1, 1, NULL, NULL, '[\"2023-10-05-651e2ff621e53.png\"]', '2023-10-05-651e2ff62268e.png', NULL, NULL, 'youtube', NULL, '[\"#0000FF\",\"#006400\",\"#800000\",\"#6B8E23\"]', 0, '[\"12\",\"11\",\"13\",\"25\"]', '[{\"name\":\"choice_12\",\"title\":\"L-42\",\"options\":[\"6\"]},{\"name\":\"choice_11\",\"title\":\"M-40\",\"options\":[\"6\"]},{\"name\":\"choice_13\",\"title\":\"XL-44\",\"options\":[\"6\"]},{\"name\":\"choice_25\",\"title\":\"YOUNG-38\",\"options\":[\"6\"]}]', '[{\"type\":\"Blue-6-6-6-6\",\"price\":5500,\"sku\":\"ks-Blue-6-6-6-6\",\"qty\":6},{\"type\":\"DarkGreen-6-6-6-6\",\"price\":5500,\"sku\":\"ks-DarkGreen-6-6-6-6\",\"qty\":6},{\"type\":\"Maroon-6-6-6-6\",\"price\":5500,\"sku\":\"ks-Maroon-6-6-6-6\",\"qty\":6},{\"type\":\"OliveDrab-6-6-6-6\",\"price\":5500,\"sku\":\"ks-OliveDrab-6-6-6-6\",\"qty\":6}]', 0, 5500, 2500, '0', 'percent', '0', 'flat', 24, 1, NULL, 0, NULL, '2023-10-05 16:39:34', '2023-10-05 17:45:15', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '140566'),
(19, 'admin', 1, 'premium sily kathan', 'premium-sily-kathan-ai0zcr', 'physical', '[{\"id\":\"15\",\"position\":1}]', 5, 'pc', 1, 1, NULL, NULL, '[\"2023-10-05-651e31e7215c5.png\",\"2023-10-05-651e31e722279.png\"]', '2023-10-05-651e31e722391.png', NULL, NULL, 'youtube', NULL, '[\"#FFEBCD\",\"#8B0000\",\"#FFD700\",\"#FFB6C1\",\"#32CD32\",\"#FFFF00\"]', 0, '[\"12\",\"11\",\"13\",\"25\"]', '[{\"name\":\"choice_12\",\"title\":\"L-42\",\"options\":[\"9\"]},{\"name\":\"choice_11\",\"title\":\"M-40\",\"options\":[\"9\"]},{\"name\":\"choice_13\",\"title\":\"XL-44\",\"options\":[\"9\"]},{\"name\":\"choice_25\",\"title\":\"YOUNG-38\",\"options\":[\"9\"]}]', '[{\"type\":\"BlanchedAlmond-9-9-9-9\",\"price\":3200,\"sku\":\"psk-BlanchedAlmond-9-9-9-9\",\"qty\":6},{\"type\":\"DarkRed-9-9-9-9\",\"price\":3200,\"sku\":\"psk-DarkRed-9-9-9-9\",\"qty\":6},{\"type\":\"Gold-9-9-9-9\",\"price\":3200,\"sku\":\"psk-Gold-9-9-9-9\",\"qty\":6},{\"type\":\"LightPink-9-9-9-9\",\"price\":3200,\"sku\":\"psk-LightPink-9-9-9-9\",\"qty\":6},{\"type\":\"LimeGreen-9-9-9-9\",\"price\":3200,\"sku\":\"psk-LimeGreen-9-9-9-9\",\"qty\":6},{\"type\":\"Yellow-9-9-9-9\",\"price\":3200,\"sku\":\"psk-Yellow-9-9-9-9\",\"qty\":6}]', 0, 3200, 1500, '0', 'percent', '0', 'flat', 36, 1, NULL, 0, NULL, '2023-10-05 16:47:51', '2023-10-05 16:47:51', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '100495'),
(20, 'admin', 1, 'kashmiri mangalam', 'kashmiri-mangalam-V0Y8Al', 'physical', '[{\"id\":\"12\",\"position\":1}]', 5, 'pc', 1, 1, NULL, NULL, '[\"2023-10-05-651e422617e44.png\"]', '2023-10-05-651e422619dd4.png', NULL, NULL, 'youtube', NULL, '[\"#B8860B\"]', 0, '[\"12\",\"11\",\"13\",\"25\"]', '[{\"name\":\"choice_12\",\"title\":\"L-42\",\"options\":[\"2\"]},{\"name\":\"choice_11\",\"title\":\"M-40\",\"options\":[\"2\"]},{\"name\":\"choice_13\",\"title\":\"XL-44\",\"options\":[\"2\"]},{\"name\":\"choice_25\",\"title\":\"YOUNG-38\",\"options\":[\"2\"]}]', '[{\"type\":\"DarkGoldenrod-2-2-2-2\",\"price\":15500,\"sku\":\"km-DarkGoldenrod-2-2-2-2\",\"qty\":8}]', 0, 15500, 5500, '0', 'percent', '0', 'flat', 8, 1, NULL, 0, NULL, '2023-10-05 17:57:10', '2023-10-05 17:57:10', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '119471'),
(21, 'admin', 1, 'Premium kashmir karim', 'premium-kashmir-karim-exuleI', 'physical', '[{\"id\":\"5\",\"position\":1}]', 5, 'pc', 1, 1, NULL, NULL, '[\"2023-10-05-651e433525bf4.png\"]', '2023-10-05-651e433526a3f.png', NULL, NULL, 'youtube', NULL, '[\"#000000\",\"#00008B\"]', 0, '[\"12\",\"11\",\"13\"]', '[{\"name\":\"choice_12\",\"title\":\"L-42\",\"options\":[\"2\"]},{\"name\":\"choice_11\",\"title\":\"M-40\",\"options\":[\"4\"]},{\"name\":\"choice_13\",\"title\":\"XL-44\",\"options\":[\"2\"]}]', '[{\"type\":\"Black-2-4-2\",\"price\":13500,\"sku\":\"Pkk-Black-2-4-2\",\"qty\":4},{\"type\":\"DarkBlue-2-4-2\",\"price\":13500,\"sku\":\"Pkk-DarkBlue-2-4-2\",\"qty\":4}]', 0, 13500, 6000, '0', 'percent', '0', 'flat', 8, 1, NULL, 0, NULL, '2023-10-05 18:01:41', '2023-10-05 18:01:41', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '145432'),
(22, 'admin', 1, 'kashmir daman', 'kashmir-daman-pFvhlY', 'physical', '[{\"id\":\"14\",\"position\":1}]', 5, 'pc', 1, 1, NULL, NULL, '[\"2023-10-05-651e45719f4ab.png\"]', '2023-10-05-651e45719fbfa.png', NULL, NULL, 'youtube', NULL, '[\"#006400\",\"#87CEEB\",\"#FFFF00\"]', 0, '[\"23\",\"12\",\"11\",\"25\"]', '[{\"name\":\"choice_23\",\"title\":\"BOYS-36\",\"options\":[\"5\"]},{\"name\":\"choice_12\",\"title\":\"L-42\",\"options\":[\"4\"]},{\"name\":\"choice_11\",\"title\":\"M-40\",\"options\":[\"5\"]},{\"name\":\"choice_25\",\"title\":\"YOUNG-38\",\"options\":[\"4\"]}]', '[{\"type\":\"DarkGreen-5-4-5-4\",\"price\":19500,\"sku\":\"kd-DarkGreen-5-4-5-4\",\"qty\":6},{\"type\":\"SkyBlue-5-4-5-4\",\"price\":19500,\"sku\":\"kd-SkyBlue-5-4-5-4\",\"qty\":6},{\"type\":\"Yellow-5-4-5-4\",\"price\":19500,\"sku\":\"kd-Yellow-5-4-5-4\",\"qty\":6}]', 0, 19500, 6500, '0', 'percent', '0', 'flat', 18, 1, NULL, 0, NULL, '2023-10-05 18:11:13', '2023-10-05 18:11:13', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '159755'),
(23, 'admin', 1, 'kashmiri somrat', 'kashmiri-somrat-ogr4Zm', 'physical', '[{\"id\":\"14\",\"position\":1}]', 5, 'pc', 1, 1, NULL, NULL, '[\"2023-10-05-651e4999904a8.png\"]', '2023-10-05-651e499990e14.png', NULL, NULL, 'youtube', NULL, '[\"#D2691E\",\"#FFFAF0\",\"#F8F8FF\",\"#FFD700\",\"#87CEFA\",\"#FFE4E1\"]', 0, '[\"12\",\"11\",\"13\",\"25\"]', '[{\"name\":\"choice_12\",\"title\":\"L-42\",\"options\":[\"11\"]},{\"name\":\"choice_11\",\"title\":\"M-40\",\"options\":[\"11\"]},{\"name\":\"choice_13\",\"title\":\"XL-44\",\"options\":[\"11\"]},{\"name\":\"choice_25\",\"title\":\"YOUNG-38\",\"options\":[\"11\"]}]', '[{\"type\":\"Chocolate-11-11-11-11\",\"price\":19500,\"sku\":\"ks-Chocolate-11-11-11-11\",\"qty\":7},{\"type\":\"FloralWhite-11-11-11-11\",\"price\":19500,\"sku\":\"ks-FloralWhite-11-11-11-11\",\"qty\":7},{\"type\":\"GhostWhite-11-11-11-11\",\"price\":19500,\"sku\":\"ks-GhostWhite-11-11-11-11\",\"qty\":7},{\"type\":\"Gold-11-11-11-11\",\"price\":19500,\"sku\":\"ks-Gold-11-11-11-11\",\"qty\":7},{\"type\":\"LightSkyBlue-11-11-11-11\",\"price\":19500,\"sku\":\"ks-LightSkyBlue-11-11-11-11\",\"qty\":7},{\"type\":\"MistyRose-11-11-11-11\",\"price\":19500,\"sku\":\"ks-MistyRose-11-11-11-11\",\"qty\":9}]', 0, 19500, 6500, '0', 'percent', '0', 'flat', 44, 1, NULL, 0, NULL, '2023-10-05 18:28:57', '2023-10-05 18:28:57', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '107922'),
(24, 'admin', 1, 'kashmir Dulhan', 'kashmir-dulhan-bgOPWk', 'physical', '[{\"id\":\"14\",\"position\":1}]', 5, 'pc', 1, 1, NULL, NULL, '[\"2023-10-05-651e4b5131ca8.png\"]', '2023-10-05-651e4b51324f0.png', NULL, NULL, 'youtube', NULL, '[\"#000000\",\"#B8860B\",\"#FFFAF0\",\"#FFE4E1\",\"#87CEEB\"]', 0, '[\"12\",\"11\",\"13\",\"25\"]', '[{\"name\":\"choice_12\",\"title\":\"L-42\",\"options\":[\"12\"]},{\"name\":\"choice_11\",\"title\":\"M-40\",\"options\":[\"12\"]},{\"name\":\"choice_13\",\"title\":\"XL-44\",\"options\":[\"12\"]},{\"name\":\"choice_25\",\"title\":\"YOUNG-38\",\"options\":[\"12\"]}]', '[{\"type\":\"Black-12-12-12-12\",\"price\":23500,\"sku\":\"kD-Black-12-12-12-12\",\"qty\":9},{\"type\":\"DarkGoldenrod-12-12-12-12\",\"price\":23500,\"sku\":\"kD-DarkGoldenrod-12-12-12-12\",\"qty\":9},{\"type\":\"FloralWhite-12-12-12-12\",\"price\":23500,\"sku\":\"kD-FloralWhite-12-12-12-12\",\"qty\":10},{\"type\":\"MistyRose-12-12-12-12\",\"price\":23500,\"sku\":\"kD-MistyRose-12-12-12-12\",\"qty\":10},{\"type\":\"SkyBlue-12-12-12-12\",\"price\":23500,\"sku\":\"kD-SkyBlue-12-12-12-12\",\"qty\":10}]', 0, 23500, 6000, '0', 'percent', '0', 'flat', 48, 1, NULL, 0, NULL, '2023-10-05 18:36:17', '2023-10-05 18:36:17', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '146573'),
(25, 'admin', 1, 'kashmir mohabir', 'kashmir-mohabir-UJjbeX', 'physical', '[{\"id\":\"14\",\"position\":1}]', 5, 'pc', 1, 1, NULL, NULL, '[\"2023-10-05-651e4c75c1ac4.png\"]', '2023-10-05-651e4c75c2318.png', NULL, NULL, 'youtube', NULL, '[\"#F8F8FF\",\"#800000\"]', 0, '[\"12\",\"11\",\"13\",\"25\"]', '[{\"name\":\"choice_12\",\"title\":\"L-42\",\"options\":[\"2\"]},{\"name\":\"choice_11\",\"title\":\"M-40\",\"options\":[\"2\"]},{\"name\":\"choice_13\",\"title\":\"XL-44\",\"options\":[\"2\"]},{\"name\":\"choice_25\",\"title\":\"YOUNG-38\",\"options\":[\"2\"]}]', '[{\"type\":\"GhostWhite-2-2-2-2\",\"price\":18500,\"sku\":\"km-GhostWhite-2-2-2-2\",\"qty\":4},{\"type\":\"Maroon-2-2-2-2\",\"price\":18500,\"sku\":\"km-Maroon-2-2-2-2\",\"qty\":4}]', 0, 18500, 6500, '0', 'percent', '0', 'flat', 8, 1, NULL, 0, NULL, '2023-10-05 18:41:09', '2023-10-05 18:41:09', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '186676'),
(26, 'admin', 1, 'premium mohabir velvet', 'premium-mohabir-velvet-8caWYA', 'physical', '[{\"id\":\"14\",\"position\":1}]', 5, 'pc', 1, 1, NULL, NULL, '[\"2023-10-05-651e4d3a47fcb.png\"]', '2023-10-05-651e4d3a48fdc.png', NULL, NULL, 'youtube', NULL, '[\"#800000\"]', 0, '[\"12\",\"11\",\"13\",\"25\"]', '[{\"name\":\"choice_12\",\"title\":\"L-42\",\"options\":[\"2\"]},{\"name\":\"choice_11\",\"title\":\"M-40\",\"options\":[\"2\"]},{\"name\":\"choice_13\",\"title\":\"XL-44\",\"options\":[\"2\"]},{\"name\":\"choice_25\",\"title\":\"YOUNG-38\",\"options\":[\"4\"]}]', '[{\"type\":\"Maroon-2-2-2-4\",\"price\":21500,\"sku\":\"pmv-Maroon-2-2-2-4\",\"qty\":10}]', 0, 21500, 7000, '0', 'percent', '0', 'flat', 10, 1, NULL, 0, NULL, '2023-10-05 18:44:26', '2023-10-05 18:44:26', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '104342'),
(27, 'admin', 1, 'kashmiri daman', 'kashmiri-daman-bTQwZ0', 'physical', '[{\"id\":\"14\",\"position\":1}]', 5, 'pc', 1, 1, NULL, NULL, '[\"2023-10-05-651e4df328321.png\"]', '2023-10-05-651e4df328c0e.png', NULL, NULL, 'youtube', NULL, '[\"#FFD700\",\"#FFFF00\"]', 0, '[\"12\",\"11\",\"13\",\"25\"]', '[{\"name\":\"choice_12\",\"title\":\"L-42\",\"options\":[\"2\"]},{\"name\":\"choice_11\",\"title\":\"M-40\",\"options\":[\"2\"]},{\"name\":\"choice_13\",\"title\":\"XL-44\",\"options\":[\"2\"]},{\"name\":\"choice_25\",\"title\":\"YOUNG-38\",\"options\":[\"2\"]}]', '[{\"type\":\"Gold-2-2-2-2\",\"price\":18500,\"sku\":\"kd-Gold-2-2-2-2\",\"qty\":4},{\"type\":\"Yellow-2-2-2-2\",\"price\":18500,\"sku\":\"kd-Yellow-2-2-2-2\",\"qty\":4}]', 0, 18500, 6000, '0', 'percent', '0', 'flat', 8, 1, NULL, 0, NULL, '2023-10-05 18:47:31', '2023-10-05 18:47:31', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '122422'),
(28, 'admin', 1, 'kashmir mannobor', 'kashmir-mannobor-jGZ2rE', 'physical', '[{\"id\":\"14\",\"position\":1}]', 5, 'pc', 1, 1, NULL, NULL, '[\"2023-10-05-651e4f0260769.png\"]', '2023-10-05-651e4f0261007.png', NULL, NULL, 'youtube', NULL, '[\"#000000\"]', 0, '[\"12\",\"11\",\"13\",\"25\"]', '[{\"name\":\"choice_12\",\"title\":\"L-42\",\"options\":[\"1\"]},{\"name\":\"choice_11\",\"title\":\"M-40\",\"options\":[\"1\"]},{\"name\":\"choice_13\",\"title\":\"XL-44\",\"options\":[\"1\"]},{\"name\":\"choice_25\",\"title\":\"YOUNG-38\",\"options\":[\"1\"]}]', '[{\"type\":\"Black-1-1-1-1\",\"price\":15500,\"sku\":\"km-Black-1-1-1-1\",\"qty\":4}]', 0, 15500, 6000, '0', 'percent', '0', 'flat', 4, 1, NULL, 0, NULL, '2023-10-05 18:52:02', '2023-10-05 18:52:02', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '123203'),
(29, 'admin', 1, 'kashmir mohabir', 'kashmir-mohabir-S7loRJ', 'physical', '[{\"id\":\"14\",\"position\":1}]', 5, 'pc', 1, 1, NULL, NULL, '[\"2023-10-05-651e4ffa00375.png\"]', '2023-10-05-651e4ffa00b7c.png', NULL, NULL, 'youtube', NULL, '[\"#FFFAF0\",\"#F8F8FF\",\"#FFE4E1\"]', 0, '[\"12\",\"11\",\"13\",\"25\"]', '[{\"name\":\"choice_12\",\"title\":\"L-42\",\"options\":[\"3\"]},{\"name\":\"choice_11\",\"title\":\"M-40\",\"options\":[\"3\"]},{\"name\":\"choice_13\",\"title\":\"XL-44\",\"options\":[\"3\"]},{\"name\":\"choice_25\",\"title\":\"YOUNG-38\",\"options\":[\"3\"]}]', '[{\"type\":\"FloralWhite-3-3-3-3\",\"price\":19500,\"sku\":\"km-FloralWhite-3-3-3-3\",\"qty\":4},{\"type\":\"GhostWhite-3-3-3-3\",\"price\":19500,\"sku\":\"km-GhostWhite-3-3-3-3\",\"qty\":4},{\"type\":\"MistyRose-3-3-3-3\",\"price\":19500,\"sku\":\"km-MistyRose-3-3-3-3\",\"qty\":4}]', 0, 19500, 6500, '0', 'percent', '0', 'flat', 12, 1, NULL, 0, NULL, '2023-10-05 18:56:10', '2023-10-05 18:56:10', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '139252'),
(30, 'admin', 1, 'Indian premium koti', 'indian-premium-koti-prh2RI', 'physical', '[{\"id\":\"17\",\"position\":1}]', 5, 'pc', 1, 1, NULL, NULL, '[\"2023-10-05-651e5181e2c28.png\"]', '2023-10-05-651e5181e39c2.png', NULL, NULL, 'youtube', NULL, '[\"#FFFAF0\"]', 0, '[\"12\",\"11\",\"13\",\"25\"]', '[{\"name\":\"choice_12\",\"title\":\"L-42\",\"options\":[\"2\"]},{\"name\":\"choice_11\",\"title\":\"M-40\",\"options\":[\"2\"]},{\"name\":\"choice_13\",\"title\":\"XL-44\",\"options\":[\"1\"]},{\"name\":\"choice_25\",\"title\":\"YOUNG-38\",\"options\":[\"1\"]}]', '[{\"type\":\"FloralWhite-2-2-1-1\",\"price\":3850,\"sku\":\"Ipk-FloralWhite-2-2-1-1\",\"qty\":6}]', 0, 3850, 1800, '0', 'percent', '0', 'flat', 6, 1, NULL, 0, NULL, '2023-10-05 19:02:41', '2023-10-05 19:02:41', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '166680'),
(31, 'admin', 1, 'kashmir premium koti', 'kashmir-premium-koti-Yd1OEI', 'physical', '[{\"id\":\"17\",\"position\":1}]', 5, 'pc', 1, 1, NULL, NULL, '[\"2023-10-05-651e521473ab4.png\"]', '2023-10-05-651e52147434e.png', NULL, NULL, 'youtube', NULL, '[\"#FFFAF0\"]', 0, '[\"12\",\"11\",\"13\",\"25\"]', '[{\"name\":\"choice_12\",\"title\":\"L-42\",\"options\":[\"2\"]},{\"name\":\"choice_11\",\"title\":\"M-40\",\"options\":[\"2\"]},{\"name\":\"choice_13\",\"title\":\"XL-44\",\"options\":[\"1\"]},{\"name\":\"choice_25\",\"title\":\"YOUNG-38\",\"options\":[\"1\"]}]', '[{\"type\":\"FloralWhite-2-2-1-1\",\"price\":4500,\"sku\":\"kpk-FloralWhite-2-2-1-1\",\"qty\":6}]', 0, 4500, 2000, '0', 'percent', '0', 'flat', 6, 1, NULL, 0, NULL, '2023-10-05 19:05:08', '2023-10-05 19:05:08', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '174965'),
(32, 'admin', 1, 'kashmir daman', 'kashmir-daman-ILBxPZ', 'physical', '[{\"id\":\"16\",\"position\":1}]', 5, 'pc', 1, 1, NULL, NULL, '[\"2023-10-05-651e52bd086dc.png\"]', '2023-10-05-651e52bd09034.png', NULL, NULL, 'youtube', NULL, '[\"#FFD700\",\"#800000\"]', 0, '[\"12\",\"11\",\"13\",\"25\"]', '[{\"name\":\"choice_12\",\"title\":\"L-42\",\"options\":[\"3\"]},{\"name\":\"choice_11\",\"title\":\"M-40\",\"options\":[\"3\"]},{\"name\":\"choice_13\",\"title\":\"XL-44\",\"options\":[\"3\"]},{\"name\":\"choice_25\",\"title\":\"YOUNG-38\",\"options\":[\"3\"]}]', '[{\"type\":\"Gold-3-3-3-3\",\"price\":3850,\"sku\":\"kd-Gold-3-3-3-3\",\"qty\":6},{\"type\":\"Maroon-3-3-3-3\",\"price\":3850,\"sku\":\"kd-Maroon-3-3-3-3\",\"qty\":6}]', 0, 3850, 1800, '0', 'percent', '0', 'flat', 12, 1, NULL, 0, NULL, '2023-10-05 19:07:57', '2023-10-05 19:07:57', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '123263'),
(33, 'admin', 1, 'kashmir mohabir koti', 'kashmir-mohabir-koti-Bi7flF', 'physical', '[{\"id\":\"16\",\"position\":1}]', 5, 'pc', 1, 1, NULL, NULL, '[\"2023-10-05-651e53513f38e.png\"]', '2023-10-05-651e53513fdae.png', NULL, NULL, 'youtube', NULL, '[\"#F5FFFA\"]', 0, '[\"12\",\"11\",\"13\",\"25\"]', '[{\"name\":\"choice_12\",\"title\":\"L-42\",\"options\":[\"1\"]},{\"name\":\"choice_11\",\"title\":\"M-40\",\"options\":[\"2\"]},{\"name\":\"choice_13\",\"title\":\"XL-44\",\"options\":[\"2\"]},{\"name\":\"choice_25\",\"title\":\"YOUNG-38\",\"options\":[\"1\"]}]', '[{\"type\":\"MintCream-1-2-2-1\",\"price\":4650,\"sku\":\"kmk-MintCream-1-2-2-1\",\"qty\":6}]', 0, 4650, 2100, '0', 'percent', '0', 'flat', 6, 1, NULL, 0, NULL, '2023-10-05 19:10:25', '2023-10-05 19:10:25', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '168824'),
(34, 'admin', 1, 'kashmir kathan koti', 'kashmir-kathan-koti-PZdYgB', 'physical', '[{\"id\":\"16\",\"position\":1}]', 5, 'pc', 1, 1, NULL, NULL, '[\"2023-10-05-651e54492073e.png\"]', '2023-10-05-651e544921430.png', NULL, NULL, 'youtube', NULL, '[\"#000000\",\"#FFFAF0\",\"#FFFACD\",\"#F08080\",\"#87CEEB\"]', 0, '[\"12\",\"11\",\"13\",\"25\"]', '[{\"name\":\"choice_12\",\"title\":\"L-42\",\"options\":[\"10\"]},{\"name\":\"choice_11\",\"title\":\"M-40\",\"options\":[\"10\"]},{\"name\":\"choice_13\",\"title\":\"XL-44\",\"options\":[\"5\"]},{\"name\":\"choice_25\",\"title\":\"YOUNG-38\",\"options\":[\"5\"]}]', '[{\"type\":\"Black-10-10-5-5\",\"price\":3250,\"sku\":\"kkk-Black-10-10-5-5\",\"qty\":6},{\"type\":\"FloralWhite-10-10-5-5\",\"price\":3250,\"sku\":\"kkk-FloralWhite-10-10-5-5\",\"qty\":6},{\"type\":\"LemonChiffon-10-10-5-5\",\"price\":3250,\"sku\":\"kkk-LemonChiffon-10-10-5-5\",\"qty\":6},{\"type\":\"LightCoral-10-10-5-5\",\"price\":3250,\"sku\":\"kkk-LightCoral-10-10-5-5\",\"qty\":5},{\"type\":\"SkyBlue-10-10-5-5\",\"price\":3250,\"sku\":\"kkk-SkyBlue-10-10-5-5\",\"qty\":6}]', 0, 3250, 1500, '0', 'percent', '0', 'flat', 29, 1, NULL, 0, NULL, '2023-10-05 19:14:33', '2023-10-05 19:43:40', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '157590'),
(35, 'admin', 1, 'kashmir karim koti', 'kashmir-karim-koti-AnJFjw', 'physical', '[{\"id\":\"16\",\"position\":1}]', 5, 'pc', 1, 1, NULL, NULL, '[\"2023-10-05-651e5510633eb.png\"]', '2023-10-05-651e551063c45.png', NULL, NULL, 'youtube', NULL, '[\"#000000\",\"#87CEEB\"]', 0, '[\"12\",\"11\",\"13\",\"25\"]', '[{\"name\":\"choice_12\",\"title\":\"L-42\",\"options\":[\"4\"]},{\"name\":\"choice_11\",\"title\":\"M-40\",\"options\":[\"4\"]},{\"name\":\"choice_13\",\"title\":\"XL-44\",\"options\":[\"2\"]},{\"name\":\"choice_25\",\"title\":\"YOUNG-38\",\"options\":[\"2\"]}]', '[{\"type\":\"Black-4-4-2-2\",\"price\":4850,\"sku\":\"kkk-Black-4-4-2-2\",\"qty\":6},{\"type\":\"SkyBlue-4-4-2-2\",\"price\":4850,\"sku\":\"kkk-SkyBlue-4-4-2-2\",\"qty\":6}]', 0, 4850, 2850, '0', 'percent', '0', 'flat', 12, 1, NULL, 0, NULL, '2023-10-05 19:17:52', '2023-10-05 20:48:35', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '126455'),
(36, 'admin', 1, 'Bombay Punjabi', 'bombay-punjabi-ucU3e1', 'physical', '[{\"id\":\"13\",\"position\":1}]', 5, 'pc', 1, 1, NULL, NULL, '[\"2023-10-05-651e6fcf35b07.png\"]', '2023-10-05-651e6fcf37613.png', NULL, NULL, 'youtube', NULL, '[\"#00FFFF\"]', 0, 'null', '[]', '[{\"type\":\"Aqua\",\"price\":850,\"sku\":\"BP-Aqua\",\"qty\":6}]', 0, 8500, 3500, '0', 'percent', '0', 'flat', 6, 1, NULL, 0, NULL, '2023-10-05 21:11:59', '2023-10-05 21:11:59', 1, 1, NULL, NULL, '2023-10-05-651e6fcf3777d.png', 1, NULL, 0.00, 0, NULL, NULL, '179896'),
(37, 'admin', 1, 'Bombay Sarfarz', 'bombay-sarfarz-wAwqps', 'physical', '[{\"id\":\"13\",\"position\":1}]', 5, 'pc', 1, 1, NULL, NULL, '[\"2023-10-05-651e72606f077.png\"]', '2023-10-05-651e72606f946.png', NULL, NULL, 'youtube', NULL, '[\"#7FFFD4\"]', 0, 'null', '[]', '[{\"type\":\"Aquamarine\",\"price\":72,\"sku\":\"BS-Aquamarine\",\"qty\":43}]', 0, 7200, 4200, '0', 'percent', '0', 'flat', 43, 1, NULL, 0, NULL, '2023-10-05 21:22:56', '2023-10-05 21:22:56', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '140619'),
(38, 'admin', 1, 'Bombay collar kaj premium', 'bombay-collar-kaj-premium-VqT4o4', 'physical', '[{\"id\":\"15\",\"position\":1}]', 5, 'pc', 1, 1, NULL, NULL, '[\"2023-10-05-651e73ee53b66.png\"]', '2023-10-05-651e73ee54434.png', NULL, NULL, 'youtube', NULL, '[\"#7FFFD4\",\"#F5F5DC\",\"#FFE4C4\"]', 0, 'null', '[]', '[{\"type\":\"Aquamarine\",\"price\":7800,\"sku\":\"Bckp-Aquamarine\",\"qty\":18},{\"type\":\"Beige\",\"price\":7800,\"sku\":\"Bckp-Beige\",\"qty\":0},{\"type\":\"Bisque\",\"price\":7800,\"sku\":\"Bckp-Bisque\",\"qty\":0}]', 0, 7800, 4550, '0', 'percent', '0', 'flat', 18, 1, NULL, 0, NULL, '2023-10-05 21:29:34', '2023-10-05 21:29:34', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '101076'),
(39, 'admin', 1, 'Baby sherwani', 'baby-sherwani-GxudK1', 'physical', '[{\"id\":\"5\",\"position\":1}]', 5, 'pc', 1, 1, NULL, NULL, '[\"2023-10-05-651e74f539fc4.png\"]', '2023-10-05-651e74f53a8e9.png', NULL, NULL, 'youtube', NULL, '[\"#FAEBD7\"]', 0, 'null', '[]', '[{\"type\":\"AntiqueWhite\",\"price\":3550,\"sku\":\"Bs-AntiqueWhite\",\"qty\":16}]', 0, 3550, 2060, '0', 'percent', '0', 'flat', 16, 1, NULL, 0, NULL, '2023-10-05 21:33:57', '2023-10-05 21:33:57', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '137882'),
(40, 'admin', 1, 'Bombay  Baby koti', 'bombay-baby-koti-hfmffc', 'physical', '[{\"id\":\"17\",\"position\":1}]', 5, 'pc', 1, 1, NULL, NULL, '[\"2023-10-05-651e75e7ed9ef.png\"]', '2023-10-05-651e75e7ee3f8.png', NULL, NULL, 'youtube', NULL, '[\"#5F9EA0\"]', 0, 'null', '[]', '[{\"type\":\"CadetBlue\",\"price\":1550,\"sku\":\"BBk-CadetBlue\",\"qty\":6}]', 0, 1550, 775, '0', 'percent', '0', 'flat', 6, 1, NULL, 0, NULL, '2023-10-05 21:37:59', '2023-10-05 21:37:59', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '122987'),
(41, 'admin', 1, 'Bombay Baby Koti', 'bombay-baby-koti-yKmW6I', 'physical', '[{\"id\":\"16\",\"position\":1}]', 5, 'pc', 1, 1, NULL, NULL, '[\"2023-10-05-651e77a9b68dc.png\"]', '2023-10-05-651e77a9b721f.png', NULL, NULL, 'youtube', NULL, '[\"#FAEBD7\"]', 0, 'null', '[]', '[{\"type\":\"AntiqueWhite\",\"price\":2350,\"sku\":\"BBK-AntiqueWhite\",\"qty\":18}]', 0, 2350, 1450, '0', 'percent', '0', 'flat', 18, 1, NULL, 0, NULL, '2023-10-05 21:45:29', '2023-10-05 21:45:29', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '137966'),
(42, 'admin', 1, 'Katan Premium Koti', 'katan-premium-koti-59YF4c', 'physical', '[{\"id\":\"16\",\"position\":1}]', 5, 'pc', 1, 1, NULL, NULL, '[\"2023-10-05-651e78f573221.png\"]', '2023-10-05-651e78f573e33.png', NULL, NULL, 'youtube', NULL, '[\"#5F9EA0\"]', 0, 'null', '[]', '[{\"type\":\"CadetBlue\",\"price\":2850,\"sku\":\"KPK-CadetBlue\",\"qty\":12}]', 0, 2850, 1650, '0', 'percent', '0', 'flat', 12, 1, NULL, 0, NULL, '2023-10-05 21:51:01', '2023-10-05 21:51:01', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '111142'),
(43, 'admin', 1, 'Manglam Premium Shaal', 'manglam-premium-shaal-hjJZnq', 'physical', '[{\"id\":\"19\",\"position\":1}]', 5, 'pc', 1, 1, NULL, NULL, '[\"2023-10-05-651e7b95223e7.png\"]', '2023-10-05-651e7b9522c3c.png', NULL, NULL, 'youtube', NULL, '[\"#F5F5DC\"]', 0, 'null', '[]', '[{\"type\":\"Beige\",\"price\":3500,\"sku\":\"MPS-Beige\",\"qty\":18}]', 0, 3500, 1700, '0', 'percent', '0', 'flat', 18, 1, NULL, 0, NULL, '2023-10-05 22:02:13', '2023-10-05 22:02:13', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '189222'),
(44, 'admin', 1, 'Mangalam baby sherwani', 'mangalam-baby-sherwani-tjjTrw', 'physical', '[{\"id\":\"12\",\"position\":1}]', 5, 'pc', 1, 1, NULL, NULL, '[\"2023-10-05-651e7d763b344.png\"]', '2023-10-05-651e7d763bbc8.png', NULL, NULL, 'youtube', NULL, '[\"#FFEBCD\"]', 0, 'null', '[]', '[{\"type\":\"BlanchedAlmond\",\"price\":2750,\"sku\":\"Mbs-BlanchedAlmond\",\"qty\":6}]', 0, 2750, 1650, '0', 'percent', '0', 'flat', 6, 1, NULL, 0, NULL, '2023-10-05 22:10:14', '2023-10-05 22:10:14', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '129726'),
(45, 'admin', 1, 'Premium Baby Sherwani', 'premium-baby-sherwani-chfFOH', 'physical', '[{\"id\":\"14\",\"position\":1}]', 5, 'pc', 1, 1, NULL, NULL, '[\"2023-10-05-651e7e407b58a.png\"]', '2023-10-05-651e7e407bdea.png', NULL, NULL, 'youtube', NULL, '[\"#A52A2A\"]', 0, 'null', '[]', '[{\"type\":\"Brown\",\"price\":3759,\"sku\":\"PBS-Brown\",\"qty\":6}]', 0, 3759, 1830, '0', 'percent', '0', 'flat', 6, 1, NULL, 0, NULL, '2023-10-05 22:13:36', '2023-10-05 22:13:36', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '153013'),
(46, 'admin', 1, 'Premium kashmir Sherwani', 'premium-kashmir-sherwani-BjyZsw', 'physical', '[{\"id\":\"14\",\"position\":1}]', 5, 'pc', 1, 1, NULL, NULL, '[\"2023-10-05-651e8010f1b00.png\"]', '2023-10-05-651e8010f276d.png', NULL, NULL, 'youtube', NULL, '[\"#FAEBD7\"]', 0, '[\"12\",\"11\",\"13\",\"25\"]', '[{\"name\":\"choice_12\",\"title\":\"L-42\",\"options\":[\"2\"]},{\"name\":\"choice_11\",\"title\":\"M-40\",\"options\":[\"2\"]},{\"name\":\"choice_13\",\"title\":\"XL-44\",\"options\":[\"2\"]},{\"name\":\"choice_25\",\"title\":\"YOUNG-38\",\"options\":[\"2\"]}]', '[{\"type\":\"AntiqueWhite-2-2-2-2\",\"price\":35500,\"sku\":\"PkS-AntiqueWhite-2-2-2-2\",\"qty\":8}]', 0, 35500, 12000, '0', 'percent', '0', 'flat', 8, 1, NULL, 0, NULL, '2023-10-05 22:21:20', '2023-10-05 22:21:20', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '185197'),
(47, 'admin', 1, 'Kasmir Premium Koti', 'kasmir-premium-koti-5F2B1C', 'physical', '[{\"id\":\"16\",\"position\":1}]', 5, 'pc', 1, 1, NULL, NULL, '[\"2023-10-05-651e8354380b0.png\"]', '2023-10-05-651e835438bf5.png', NULL, NULL, 'youtube', NULL, '[\"#5F9EA0\"]', 0, '[\"12\",\"11\",\"13\",\"25\"]', '[{\"name\":\"choice_12\",\"title\":\"L-42\",\"options\":[\"\"]},{\"name\":\"choice_11\",\"title\":\"M-40\",\"options\":[\"\"]},{\"name\":\"choice_13\",\"title\":\"XL-44\",\"options\":[\"\"]},{\"name\":\"choice_25\",\"title\":\"YOUNG-38\",\"options\":[\"\"]}]', '[{\"type\":\"CadetBlue----\",\"price\":0,\"sku\":null,\"qty\":29}]', 0, 4850, 2950, '0', 'percent', '0', 'flat', 29, 1, NULL, 0, NULL, '2023-10-05 22:35:16', '2023-10-05 22:36:25', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '113574'),
(48, 'admin', 1, 'Kashmir Premium Karchupi', 'kashmir-premium-karchupi-FsiPTa', 'physical', '[{\"id\":\"15\",\"position\":1}]', 5, 'pc', 1, 1, NULL, NULL, '[\"2023-10-05-651ea3c1853fb.png\"]', '2023-10-05-651ea3c187d08.png', NULL, NULL, 'youtube', NULL, '[\"#FFEBCD\"]', 0, 'null', '[]', '[{\"type\":\"BlanchedAlmond\",\"price\":5800,\"sku\":\"KPK-BlanchedAlmond\",\"qty\":12}]', 0, 5800, 2800, '0', 'percent', '0', 'flat', 12, 1, NULL, 0, NULL, '2023-10-06 00:53:37', '2023-10-06 00:53:37', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '183773'),
(49, 'admin', 1, 'karim koti BD', 'karim-koti-bd-aSdSOR', 'physical', '[{\"id\":\"16\",\"position\":1}]', 5, 'pc', 1, 1, NULL, NULL, '[\"2023-10-05-651ecf8fdb24e.png\"]', '2023-10-05-651ecf8fde70d.png', NULL, NULL, 'youtube', NULL, '[\"#00008B\"]', 0, 'null', '[]', '[{\"type\":\"DarkBlue\",\"price\":2850,\"sku\":\"kkB-DarkBlue\",\"qty\":12}]', 0, 2850, 750, '0', 'percent', '0', 'flat', 12, 1, NULL, 0, NULL, '2023-10-06 04:00:31', '2023-10-06 04:00:31', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '131987'),
(50, 'admin', 1, 'Polite White Dhuti', 'polite-white-dhuti-HVrOar', 'physical', '[{\"id\":\"15\",\"position\":1},{\"id\":\"20\",\"position\":2}]', 3, 'pc', 1, 1, NULL, NULL, '[\"2023-10-05-651ee8b179bc2.png\"]', '2023-10-05-651ee8b17af04.png', NULL, NULL, 'youtube', NULL, '[\"#FFFAF0\"]', 0, 'null', '[]', '[{\"type\":\"FloralWhite\",\"price\":2500,\"sku\":\"PWD-FloralWhite\",\"qty\":12}]', 0, 2500, 800, '0', 'percent', '0', 'flat', 12, 1, NULL, 0, NULL, '2023-10-06 05:47:45', '2023-10-06 05:47:45', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '156979'),
(51, 'admin', 1, 'Polite Indian Chicken sequ.', 'polite-indian-chicken-sequ-itMJZ1', 'physical', '[{\"id\":\"15\",\"position\":1},{\"id\":\"20\",\"position\":2}]', 3, 'pc', 1, 1, NULL, NULL, '[\"2023-10-05-651ee9bfa9f2b.png\"]', '2023-10-05-651ee9bfaa7cf.png', NULL, NULL, 'youtube', NULL, '[\"#000000\",\"#5F9EA0\",\"#D2691E\",\"#006400\",\"#FFFAF0\"]', 0, 'null', '[]', '[{\"type\":\"Black\",\"price\":8000,\"sku\":\"PICs-Black\",\"qty\":12},{\"type\":\"CadetBlue\",\"price\":8000,\"sku\":\"PICs-CadetBlue\",\"qty\":12},{\"type\":\"Chocolate\",\"price\":8000,\"sku\":\"PICs-Chocolate\",\"qty\":12},{\"type\":\"DarkGreen\",\"price\":8000,\"sku\":\"PICs-DarkGreen\",\"qty\":12},{\"type\":\"FloralWhite\",\"price\":8000,\"sku\":\"PICs-FloralWhite\",\"qty\":12}]', 0, 8000, 1600, '0', 'percent', '0', 'flat', 60, 1, NULL, 0, NULL, '2023-10-06 05:52:15', '2023-10-06 05:52:15', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '109463'),
(52, 'admin', 1, 'Polite Premium IBA', 'polite-premium-iba-aVo9kB', 'physical', '[{\"id\":\"15\",\"position\":1},{\"id\":\"20\",\"position\":2}]', 3, 'pc', 1, 1, NULL, NULL, '[\"2023-10-05-651eeaa82afd0.png\"]', '2023-10-05-651eeaa82bb62.png', NULL, NULL, 'youtube', NULL, '[\"#000000\",\"#0000FF\"]', 0, 'null', '[]', '[{\"type\":\"Black\",\"price\":3200,\"sku\":\"PPI-Black\",\"qty\":12},{\"type\":\"Blue\",\"price\":3200,\"sku\":\"PPI-Blue\",\"qty\":12}]', 0, 3200, 1000, '0', 'percent', '0', 'flat', 24, 1, NULL, 0, NULL, '2023-10-06 05:56:08', '2023-10-06 05:56:08', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '153758'),
(53, 'admin', 1, 'Polite Indian Mesh cotton', 'polite-indian-mesh-cotton-z4PQMa', 'physical', '[{\"id\":\"15\",\"position\":1},{\"id\":\"20\",\"position\":2}]', 3, 'pc', 1, 1, NULL, NULL, '[\"2023-10-05-651eeb645151f.png\"]', '2023-10-05-651eeb6451fe8.png', NULL, NULL, 'youtube', NULL, '[\"#000000\"]', 0, 'null', '[]', '[{\"type\":\"Black\",\"price\":2200,\"sku\":\"PIMc-Black\",\"qty\":12}]', 0, 2200, 800, '0', 'percent', '0', 'flat', 12, 1, NULL, 0, NULL, '2023-10-06 05:59:16', '2023-10-06 05:59:16', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '172382'),
(54, 'admin', 1, 'Polite Premium Digital prnt', 'polite-premium-digital-prnt-kKFv4Y', 'physical', '[{\"id\":\"15\",\"position\":1},{\"id\":\"20\",\"position\":2}]', 3, 'pc', 1, 1, NULL, NULL, '[\"2023-10-05-651eec958178e.png\"]', '2023-10-05-651eec95825b9.png', NULL, NULL, 'youtube', NULL, '[\"#0000FF\",\"#EEE8AA\"]', 0, 'null', '[]', '[{\"type\":\"Blue\",\"price\":1800,\"sku\":\"PPDp-Blue\",\"qty\":12},{\"type\":\"PaleGoldenrod\",\"price\":1800,\"sku\":\"PPDp-PaleGoldenrod\",\"qty\":12}]', 0, 1800, 750, '0', 'percent', '0', 'flat', 24, 1, NULL, 0, NULL, '2023-10-06 06:04:21', '2023-10-06 06:04:21', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '112870'),
(55, 'admin', 1, 'Polite IB Tat cotton', 'polite-ib-tat-cotton-4uWtn9', 'physical', '[{\"id\":\"15\",\"position\":1},{\"id\":\"20\",\"position\":2}]', 3, 'pc', 1, 1, NULL, NULL, '[\"2023-10-05-651eed93e7cbe.png\"]', '2023-10-05-651eed93e89c6.png', NULL, NULL, 'youtube', NULL, '[\"#0000FF\",\"#228B22\",\"#FFA500\"]', 0, 'null', '[]', '[{\"type\":\"Blue\",\"price\":1950,\"sku\":\"PITc-Blue\",\"qty\":12},{\"type\":\"ForestGreen\",\"price\":1950,\"sku\":\"PITc-ForestGreen\",\"qty\":12},{\"type\":\"Orange\",\"price\":1950,\"sku\":\"PITc-Orange\",\"qty\":12}]', 0, 1950, 750, '0', 'percent', '0', 'flat', 36, 1, NULL, 0, NULL, '2023-10-06 06:08:35', '2023-10-06 06:08:35', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '177900'),
(56, 'admin', 1, 'Polite IB Mesh ctn', 'polite-ib-mesh-ctn-3nWGI6', 'physical', '[{\"id\":\"15\",\"position\":1},{\"id\":\"20\",\"position\":2}]', 3, 'pc', 1, 1, NULL, NULL, '[\"2023-10-05-651ef08962177.png\"]', '2023-10-05-651ef089629b4.png', NULL, NULL, 'youtube', NULL, '[\"#FFE4C4\",\"#800000\",\"#808000\",\"#FFFF00\"]', 0, 'null', '[]', '[{\"type\":\"Bisque\",\"price\":2250,\"sku\":\"PIMc-Bisque\",\"qty\":12},{\"type\":\"Maroon\",\"price\":2250,\"sku\":\"PIMc-Maroon\",\"qty\":12},{\"type\":\"Olive\",\"price\":2250,\"sku\":\"PIMc-Olive\",\"qty\":12},{\"type\":\"Yellow\",\"price\":2250,\"sku\":\"PIMc-Yellow\",\"qty\":12}]', 0, 2250, 800, '0', 'percent', '0', 'flat', 48, 1, NULL, 0, NULL, '2023-10-06 06:21:13', '2023-10-06 06:21:13', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '186170'),
(57, 'admin', 1, 'Polite Elite Kashmiri', 'polite-elite-kashmiri-2x8dSj', 'physical', '[{\"id\":\"15\",\"position\":1},{\"id\":\"20\",\"position\":2}]', 3, 'pc', 1, 1, NULL, NULL, '[\"2023-10-05-651ef21f2c158.png\"]', '2023-10-05-651ef21f2c95b.png', NULL, NULL, 'youtube', NULL, '[\"#800000\"]', 0, 'null', '[]', '[{\"type\":\"Maroon\",\"price\":2900,\"sku\":\"PEK-Maroon\",\"qty\":24}]', 0, 2900, 900, '0', 'percent', '0', 'flat', 24, 1, NULL, 0, NULL, '2023-10-06 06:27:59', '2023-10-06 06:27:59', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '178517'),
(58, 'admin', 1, 'Polite IB Raywan Karchupi', 'polite-ib-raywan-karchupi-szwVQZ', 'physical', '[{\"id\":\"15\",\"position\":1},{\"id\":\"20\",\"position\":2}]', 3, 'pc', 1, 1, NULL, NULL, '[\"2023-10-05-651ef2f22f8f5.png\"]', '2023-10-05-651ef2f23018b.png', NULL, NULL, 'youtube', NULL, '[\"#000000\",\"#0000FF\",\"#8B0000\"]', 0, 'null', '[]', '[{\"type\":\"Black\",\"price\":3500,\"sku\":\"PIRK-Black\",\"qty\":24},{\"type\":\"Blue\",\"price\":3500,\"sku\":\"PIRK-Blue\",\"qty\":12},{\"type\":\"DarkRed\",\"price\":3500,\"sku\":\"PIRK-DarkRed\",\"qty\":12}]', 0, 3500, 1200, '0', 'percent', '0', 'flat', 48, 1, NULL, 0, NULL, '2023-10-06 06:31:30', '2023-10-06 06:31:30', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '161674'),
(59, 'admin', 1, 'Polite Jacket Raywen', 'polite-jacket-raywen-Snewse', 'physical', '[{\"id\":\"15\",\"position\":1},{\"id\":\"20\",\"position\":2}]', 3, 'pc', 1, 1, NULL, NULL, '[\"2023-10-05-651ef3fb498ba.png\"]', '2023-10-05-651ef3fb4a44a.png', NULL, NULL, 'youtube', NULL, '[\"#000000\",\"#0000FF\",\"#D2691E\"]', 0, 'null', '[]', '[{\"type\":\"Black\",\"price\":3200,\"sku\":\"PJR-Black\",\"qty\":12},{\"type\":\"Blue\",\"price\":3200,\"sku\":\"PJR-Blue\",\"qty\":12},{\"type\":\"Chocolate\",\"price\":3200,\"sku\":\"PJR-Chocolate\",\"qty\":12}]', 0, 3200, 1000, '0', 'percent', '0', 'flat', 36, 1, NULL, 0, NULL, '2023-10-06 06:35:55', '2023-10-06 06:35:55', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '103134'),
(60, 'admin', 1, 'Polite IB Cotton', 'polite-ib-cotton-tk6Y3U', 'physical', '[{\"id\":\"15\",\"position\":1},{\"id\":\"20\",\"position\":2}]', 3, 'pc', 1, 1, NULL, NULL, '[\"2023-10-05-651ef4d8ecaa8.png\"]', '2023-10-05-651ef4d8ed362.png', NULL, NULL, 'youtube', NULL, '[\"#FFFAF0\",\"#F5FFFA\",\"#808000\"]', 0, 'null', '[]', '[{\"type\":\"FloralWhite\",\"price\":1950,\"sku\":\"-FloralWhite\",\"qty\":12},{\"type\":\"MintCream\",\"price\":1950,\"sku\":\"-MintCream\",\"qty\":12},{\"type\":\"Olive\",\"price\":1950,\"sku\":\"-Olive\",\"qty\":12}]', 0, 1950, 750, '0', 'percent', '0', 'flat', 36, 1, NULL, 0, NULL, '2023-10-06 06:39:36', '2023-10-06 06:39:36', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '145552'),
(61, 'admin', 1, 'Polite IB Sharton', 'polite-ib-sharton-S8wbzT', 'physical', '[{\"id\":\"15\",\"position\":1},{\"id\":\"20\",\"position\":2}]', 3, 'pc', 1, 1, NULL, NULL, '[\"2023-10-05-651ef5a98db19.png\"]', '2023-10-05-651ef5a98e3d8.png', NULL, NULL, 'youtube', NULL, '[\"#B8860B\",\"#8B0000\",\"#008000\"]', 0, 'null', '[]', '[{\"type\":\"DarkGoldenrod\",\"price\":2350,\"sku\":\"PIS-DarkGoldenrod\",\"qty\":12},{\"type\":\"DarkRed\",\"price\":2350,\"sku\":\"PIS-DarkRed\",\"qty\":12},{\"type\":\"Green\",\"price\":2350,\"sku\":\"PIS-Green\",\"qty\":12}]', 0, 2350, 800, '0', 'percent', '0', 'flat', 36, 1, NULL, 0, NULL, '2023-10-06 06:43:05', '2023-10-06 06:43:05', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '152833'),
(62, 'admin', 1, 'Polite Raywen Cotton', 'polite-raywen-cotton-Btesac', 'physical', '[{\"id\":\"15\",\"position\":1},{\"id\":\"20\",\"position\":2}]', 3, 'pc', 1, 1, NULL, NULL, '[\"2023-10-05-651ef697848c5.png\"]', '2023-10-05-651ef69785163.png', NULL, NULL, 'youtube', NULL, '[\"#8FBC8F\",\"#808000\",\"#FFA500\",\"#FFC0CB\",\"#C0C0C0\"]', 0, 'null', '[]', '[{\"type\":\"DarkSeaGreen\",\"price\":2150,\"sku\":\"-DarkSeaGreen\",\"qty\":12},{\"type\":\"Olive\",\"price\":2150,\"sku\":\"-Olive\",\"qty\":12},{\"type\":\"Orange\",\"price\":2150,\"sku\":\"-Orange\",\"qty\":12},{\"type\":\"Pink\",\"price\":2150,\"sku\":\"-Pink\",\"qty\":12},{\"type\":\"Silver\",\"price\":2150,\"sku\":\"-Silver\",\"qty\":12}]', 0, 2150, 800, '0', 'percent', '0', 'flat', 60, 1, NULL, 0, NULL, '2023-10-06 06:47:03', '2023-10-06 06:47:03', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '115121'),
(63, 'admin', 1, 'Polite Premium Rawyen', 'polite-premium-rawyen-oXRP4m', 'physical', '[{\"id\":\"15\",\"position\":1},{\"id\":\"20\",\"position\":2}]', 3, 'pc', 1, 1, NULL, NULL, '[\"2023-10-05-651ef7679f37e.png\"]', '2023-10-05-651ef7679ffae.png', NULL, NULL, 'youtube', NULL, '[\"#000000\"]', 0, 'null', '[]', '[{\"type\":\"Black\",\"price\":2800,\"sku\":\"PPR-Black\",\"qty\":12}]', 0, 2800, 1000, '0', 'percent', '0', 'flat', 12, 1, NULL, 0, NULL, '2023-10-06 06:50:31', '2023-10-06 06:50:31', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '138287'),
(64, 'admin', 1, 'Polite Indian Pesari Cream', 'polite-indian-pesari-cream-YYhSGH', 'physical', '[{\"id\":\"15\",\"position\":1},{\"id\":\"20\",\"position\":2}]', 3, 'pc', 1, 1, NULL, NULL, '[\"2023-10-05-651ef84f8b03b.png\"]', '2023-10-05-651ef84f8b792.png', NULL, NULL, 'youtube', NULL, '[\"#B8860B\"]', 0, 'null', '[]', '[{\"type\":\"DarkGoldenrod\",\"price\":3200,\"sku\":\"PIPC-DarkGoldenrod\",\"qty\":12}]', 0, 3200, 1000, '0', 'percent', '0', 'flat', 12, 1, NULL, 0, NULL, '2023-10-06 06:54:23', '2023-10-06 06:54:23', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '129595'),
(65, 'admin', 1, 'Polite Premium Indian Silly', 'polite-premium-indian-silly-6DlYFg', 'physical', '[{\"id\":\"15\",\"position\":1},{\"id\":\"20\",\"position\":2}]', 3, 'pc', 1, 1, NULL, NULL, '[\"2023-10-05-651ef91759462.png\"]', '2023-10-05-651ef91759d1c.png', NULL, NULL, 'youtube', NULL, '[\"#DEB887\",\"#808000\"]', 0, 'null', '[]', '[{\"type\":\"BurlyWood\",\"price\":3200,\"sku\":\"PPIS-BurlyWood\",\"qty\":12},{\"type\":\"Olive\",\"price\":3200,\"sku\":\"PPIS-Olive\",\"qty\":12}]', 0, 3200, 1000, '0', 'percent', '0', 'flat', 24, 1, NULL, 0, NULL, '2023-10-06 06:57:43', '2023-10-06 06:57:43', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '102347'),
(66, 'admin', 1, 'Polite Peshwari Cotton', 'polite-peshwari-cotton-Ci1x5V', 'physical', '[{\"id\":\"15\",\"position\":1},{\"id\":\"20\",\"position\":2}]', 3, 'pc', 1, 1, NULL, NULL, '[\"2023-10-06-651ef9c919708.png\"]', '2023-10-06-651ef9c91a0de.png', NULL, NULL, 'youtube', NULL, '[\"#228B22\"]', 0, 'null', '[]', '[{\"type\":\"ForestGreen\",\"price\":1800,\"sku\":\"PPC-ForestGreen\",\"qty\":12}]', 0, 1800, 750, '0', 'percent', '0', 'flat', 12, 1, NULL, 0, NULL, '2023-10-06 07:00:41', '2023-10-06 07:00:41', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '185371'),
(67, 'admin', 1, 'Polite Premium Digital Print', 'polite-premium-digital-print-EgY2sV', 'physical', '[{\"id\":\"15\",\"position\":1},{\"id\":\"20\",\"position\":2}]', 3, 'pc', 1, 1, NULL, NULL, '[\"2023-10-06-651efadfa9e0e.png\"]', '2023-10-06-651efadfaa6d1.png', NULL, NULL, 'youtube', NULL, '[\"#000000\",\"#0000FF\",\"#FFC0CB\"]', 0, 'null', '[]', '[{\"type\":\"Black\",\"price\":2350,\"sku\":\"PPDP-Black\",\"qty\":12},{\"type\":\"Blue\",\"price\":2350,\"sku\":\"PPDP-Blue\",\"qty\":12},{\"type\":\"Pink\",\"price\":2350,\"sku\":\"PPDP-Pink\",\"qty\":12}]', 0, 2350, 800, '0', 'percent', '0', 'flat', 36, 1, NULL, 0, NULL, '2023-10-06 07:05:19', '2023-10-06 07:05:19', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '185099'),
(68, 'admin', 1, 'Premium Nagra Indian', 'premium-nagra-indian-JbIEMp', 'physical', '[{\"id\":\"22\",\"position\":1},{\"id\":\"24\",\"position\":2}]', 5, 'pc', 1, 1, NULL, NULL, '[\"2023-10-06-651f856473039.png\"]', '2023-10-06-651f856473981.png', NULL, NULL, 'youtube', NULL, '[\"#800000\"]', 0, 'null', '[]', '[{\"type\":\"Maroon\",\"price\":3200,\"sku\":\"PNI-Maroon\",\"qty\":6}]', 0, 3200, 1200, '0', 'percent', '0', 'flat', 6, 1, NULL, 0, NULL, '2023-10-06 16:56:20', '2023-10-06 18:05:36', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '143657'),
(69, 'admin', 1, 'Indian Chicken Premium', 'indian-chicken-premium-ex8VzV', 'physical', '[{\"id\":\"22\",\"position\":1},{\"id\":\"24\",\"position\":2}]', 5, 'pc', 1, 1, NULL, NULL, '[\"2023-10-06-651f8639c429c.png\"]', '2023-10-06-651f8639c4ace.png', NULL, NULL, 'youtube', NULL, '[\"#8B0000\"]', 0, 'null', '[]', '[{\"type\":\"DarkRed\",\"price\":3250,\"sku\":\"ICP-DarkRed\",\"qty\":3}]', 0, 3250, 1200, '0', 'percent', '0', 'flat', 3, 1, NULL, 0, NULL, '2023-10-06 16:59:53', '2023-10-06 18:03:04', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '116828'),
(70, 'admin', 1, 'Indian Gold premium', 'indian-gold-premium-c9ySKE', 'physical', '[{\"id\":\"22\",\"position\":1},{\"id\":\"24\",\"position\":2}]', 5, 'pc', 1, 1, NULL, NULL, '[\"2023-10-06-651f876c7b3fb.png\"]', '2023-10-06-651f876c7bc74.png', NULL, NULL, 'youtube', NULL, '[\"#FFE4C4\"]', 0, 'null', '[]', '[{\"type\":\"Bisque\",\"price\":3500,\"sku\":\"IGp-Bisque\",\"qty\":6}]', 0, 3500, 1300, '0', 'percent', '0', 'flat', 6, 1, NULL, 0, NULL, '2023-10-06 17:05:00', '2023-10-06 18:03:50', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '111177'),
(71, 'admin', 1, 'Indian Chicken Black', 'indian-chicken-black-21XJUr', 'physical', '[{\"id\":\"22\",\"position\":1},{\"id\":\"24\",\"position\":2}]', 5, 'pc', 1, 1, NULL, NULL, '[\"2023-10-06-651f891f3a33f.png\"]', '2023-10-06-651f891f3ab01.png', NULL, NULL, 'youtube', NULL, '[\"#000000\"]', 0, 'null', '[]', '[{\"type\":\"Black\",\"price\":3150,\"sku\":\"ICB-Black\",\"qty\":6}]', 0, 3150, 1200, '0', 'percent', '0', 'flat', 6, 1, NULL, 0, NULL, '2023-10-06 17:12:15', '2023-10-06 18:00:50', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '136247'),
(72, 'admin', 1, 'Indian Kings Pagri', 'indian-kings-pagri-xkVeGf', 'physical', '[{\"id\":\"22\",\"position\":1},{\"id\":\"25\",\"position\":2}]', 5, 'pc', 1, 1, NULL, NULL, '[\"2023-10-06-651f8b234d08c.png\"]', '2023-10-06-651f8b234d8ca.png', NULL, NULL, 'youtube', NULL, '[\"#000000\"]', 0, 'null', '[]', '[{\"type\":\"Black\",\"price\":2350,\"sku\":\"IKP-Black\",\"qty\":6}]', 0, 2350, 750, '0', 'percent', '0', 'flat', 6, 1, NULL, 0, NULL, '2023-10-06 17:20:51', '2023-10-06 17:20:51', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '160372'),
(73, 'admin', 1, 'kashmir kings', 'kashmir-kings-VX7E19', 'physical', '[{\"id\":\"22\",\"position\":1},{\"id\":\"25\",\"position\":2}]', 5, 'pc', 1, 1, NULL, NULL, '[\"2023-10-06-651f8cab93e33.png\",\"2023-10-06-651f8cab945e7.png\"]', '2023-10-06-651f8cab946bb.png', NULL, NULL, 'youtube', NULL, '[\"#000000\",\"#800000\"]', 0, 'null', '[]', '[{\"type\":\"Black\",\"price\":2400,\"sku\":\"kk-Black\",\"qty\":4},{\"type\":\"Maroon\",\"price\":2400,\"sku\":\"kk-Maroon\",\"qty\":8}]', 0, 2400, 790, '0', 'percent', '0', 'flat', 12, 1, NULL, 0, NULL, '2023-10-06 17:27:23', '2023-10-06 17:27:23', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '106075'),
(74, 'admin', 1, 'King White', 'king-white-gmuvHP', 'physical', '[{\"id\":\"22\",\"position\":1},{\"id\":\"25\",\"position\":2}]', 5, 'pc', 1, 1, NULL, NULL, '[\"2023-10-06-651f8ded9b7ab.png\"]', '2023-10-06-651f8ded9c0bc.png', NULL, NULL, 'youtube', NULL, '[\"#FFFAF0\"]', 0, 'null', '[]', '[{\"type\":\"FloralWhite\",\"price\":2300,\"sku\":\"KW-FloralWhite\",\"qty\":6}]', 0, 2300, 750, '0', 'percent', '0', 'flat', 6, 1, NULL, 0, NULL, '2023-10-06 17:32:45', '2023-10-06 17:32:45', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '120529'),
(75, 'admin', 1, 'Indian King Mala', 'indian-king-mala-nIfqgG', 'physical', '[{\"id\":\"22\",\"position\":1},{\"id\":\"23\",\"position\":2}]', 5, 'pc', 1, 1, NULL, NULL, '[\"2023-10-06-651f91f421077.png\"]', '2023-10-06-651f91f421d5b.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 3150, 850, '0', 'percent', '0', 'flat', 5, 1, NULL, 0, NULL, '2023-10-06 17:49:56', '2023-10-06 17:49:56', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '123030'),
(76, 'admin', 1, 'Indian Royal Mala', 'indian-royal-mala-pxX8vY', 'physical', '[{\"id\":\"22\",\"position\":1},{\"id\":\"23\",\"position\":2}]', 5, 'pc', 1, 1, NULL, NULL, '[\"2023-10-06-651f935822f38.png\",\"2023-10-06-651f9407d4e28.png\"]', '2023-10-06-651f935823a18.png', NULL, NULL, 'youtube', NULL, '[\"#FFB6C1\",\"#800000\"]', 0, 'null', '[]', '[{\"type\":\"LightPink\",\"price\":3150,\"sku\":\"IRM-LightPink\",\"qty\":3},{\"type\":\"Maroon\",\"price\":3150,\"sku\":\"IRM-Maroon\",\"qty\":4}]', 0, 3150, 850, '0', 'percent', '0', 'flat', 7, 1, NULL, 0, NULL, '2023-10-06 17:55:52', '2023-10-06 17:58:47', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '178618'),
(77, 'admin', 1, 'Kashmir King', 'kashmir-king-NVkvtP', 'physical', '[{\"id\":\"22\",\"position\":1},{\"id\":\"23\",\"position\":2}]', 5, 'pc', 1, 1, NULL, NULL, '[\"2023-10-06-651f965340719.png\",\"2023-10-06-651f9653410f5.png\"]', '2023-10-06-651f9653411bf.png', NULL, NULL, 'youtube', NULL, '[\"#8B0000\",\"#800000\"]', 0, 'null', '[]', '[{\"type\":\"DarkRed\",\"price\":3500,\"sku\":\"KK-DarkRed\",\"qty\":6},{\"type\":\"Maroon\",\"price\":3500,\"sku\":\"KK-Maroon\",\"qty\":4}]', 0, 3500, 950, '0', 'percent', '0', 'flat', 10, 1, NULL, 0, NULL, '2023-10-06 18:08:35', '2023-10-06 18:08:35', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '120974'),
(78, 'admin', 1, 'Kashmir Maroon', 'kashmir-maroon-4HSuBe', 'physical', '[{\"id\":\"22\",\"position\":1},{\"id\":\"23\",\"position\":2}]', 5, 'pc', 1, 1, NULL, NULL, '[\"2023-10-06-651f978f77596.png\"]', '2023-10-06-651f978f77d81.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 3000, 700, '0', 'percent', '0', 'flat', 2, 1, NULL, 0, NULL, '2023-10-06 18:13:51', '2023-10-06 18:13:51', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '172851');
INSERT INTO `products` (`id`, `added_by`, `user_id`, `name`, `slug`, `product_type`, `category_ids`, `brand_id`, `unit`, `min_qty`, `refundable`, `digital_product_type`, `digital_file_ready`, `images`, `thumbnail`, `featured`, `flash_deal`, `video_provider`, `video_url`, `colors`, `variant_product`, `attributes`, `choice_options`, `variation`, `published`, `unit_price`, `purchase_price`, `tax`, `tax_type`, `discount`, `discount_type`, `current_stock`, `minimum_order_qty`, `details`, `free_shipping`, `attachment`, `created_at`, `updated_at`, `status`, `featured_status`, `meta_title`, `meta_description`, `meta_image`, `request_status`, `denied_note`, `shipping_cost`, `multiply_qty`, `temp_shipping_cost`, `is_shipping_cost_updated`, `code`) VALUES
(79, 'admin', 1, 'Kashmir Floral', 'kashmir-floral-UkY8f6', 'physical', '[{\"id\":\"22\",\"position\":1},{\"id\":\"24\",\"position\":2}]', 5, 'pc', 1, 1, NULL, NULL, '[\"2023-10-06-651f99663e811.png\",\"2023-10-06-651f99663f0c5.png\"]', '2023-10-06-651f99663f1ab.png', NULL, NULL, 'youtube', NULL, '[\"#000000\",\"#FFFAF0\"]', 0, 'null', '[]', '[{\"type\":\"Black\",\"price\":2800,\"sku\":\"KF-Black\",\"qty\":6},{\"type\":\"FloralWhite\",\"price\":2800,\"sku\":\"KF-FloralWhite\",\"qty\":6}]', 0, 2800, 800, '0', 'percent', '0', 'flat', 12, 1, NULL, 0, NULL, '2023-10-06 18:21:42', '2023-10-06 18:21:42', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '137597'),
(80, 'admin', 1, 'Fotua', 'fotua-aBGor2', 'physical', '[{\"id\":\"26\",\"position\":1}]', 3, 'pc', 1, 1, NULL, NULL, '[\"2023-10-06-651fa64d8f482.png\",\"2023-10-06-651fa64d8fe5e.png\"]', '2023-10-06-651fa64d8ff72.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 650, 350, '0', 'percent', '0', 'flat', 24, 1, NULL, 0, NULL, '2023-10-06 19:16:45', '2023-10-06 19:16:45', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '144292'),
(81, 'admin', 1, 'Jocelyn Prince', 'jocelyn-prince-aHzex3', 'physical', '[{\"id\":\"14\",\"position\":1}]', 5, 'gms', 1, 1, NULL, NULL, '[\"2023-10-07-652137bf7e208.png\",\"2023-10-07-652137bf94111.png\"]', '2023-10-07-652137bf95d87.png', NULL, NULL, 'youtube', 'https://web.whatsapp.com/', '[]', 0, '[\"15\",\"4\",\"5\",\"8\",\"9\"]', '[{\"name\":\"choice_15\",\"title\":\"BABY-20\",\"options\":[\"hgdh\"]},{\"name\":\"choice_4\",\"title\":\"Black\",\"options\":[\"dgjj\"]},{\"name\":\"choice_5\",\"title\":\"Mehrun\",\"options\":[\"djgdj\"]},{\"name\":\"choice_8\",\"title\":\"Pink\",\"options\":[\"jdjhgj\"]},{\"name\":\"choice_9\",\"title\":\"Red\",\"options\":[\"dfgjdfjdfj\"]}]', '[{\"type\":\"hgdh-dgjj-djgdj-jdjhgj-dfgjdfjdfj\",\"price\":814,\"sku\":\"JP-hgdh-dgjj-djgdj-jdjhgj-dfgjdfjdfj\",\"qty\":1}]', 0, 814, 346, '921', 'percent', '59', 'percent', 1, 860, '<p>Lorem ipsum dolor sit amet consectetur adipiscing elit fusce mus facilisi, mauris parturient molestie id facilisis taciti tristique non ligula, lacus sociis aptent est pellentesque pharetra curae consequat hendrerit. Bibendum risus enim ante et interdum volutpat sociosqu, penatibus turpis ligula mattis sed nullam. Leo diam habitant metus scelerisque vel, volutpat consequat nec pulvinar semper sociis, torquent dictumst sagittis pellentesque primis, faucibus ac est convallis.</p>', 0, NULL, '2023-10-07 10:49:35', '2023-10-07 10:49:43', 0, 1, '942', 'Qui excepteur facere', '2023-10-07-652137bf96d7a.png', 1, NULL, 79.00, 0, NULL, NULL, '102408');

-- --------------------------------------------------------

--
-- Table structure for table `product_stocks`
--

CREATE TABLE `product_stocks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `variant` varchar(255) DEFAULT NULL,
  `sku` varchar(255) DEFAULT NULL,
  `price` decimal(8,2) NOT NULL DEFAULT 0.00,
  `qty` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `refund_requests`
--

CREATE TABLE `refund_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_details_id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(191) NOT NULL,
  `amount` double(8,2) NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `refund_reason` longtext NOT NULL,
  `images` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `approved_note` longtext DEFAULT NULL,
  `rejected_note` longtext DEFAULT NULL,
  `payment_info` longtext DEFAULT NULL,
  `change_by` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `refund_statuses`
--

CREATE TABLE `refund_statuses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `refund_request_id` bigint(20) UNSIGNED DEFAULT NULL,
  `change_by` varchar(191) DEFAULT NULL,
  `change_by_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` varchar(191) DEFAULT NULL,
  `message` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `refund_transactions`
--

CREATE TABLE `refund_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `payment_for` varchar(191) DEFAULT NULL,
  `payer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `payment_receiver_id` bigint(20) UNSIGNED DEFAULT NULL,
  `paid_by` varchar(191) DEFAULT NULL,
  `paid_to` varchar(191) DEFAULT NULL,
  `payment_method` varchar(191) DEFAULT NULL,
  `payment_status` varchar(191) DEFAULT NULL,
  `amount` double(8,2) DEFAULT NULL,
  `transaction_type` varchar(191) DEFAULT NULL,
  `order_details_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `refund_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `customer_id` bigint(20) NOT NULL,
  `delivery_man_id` bigint(20) DEFAULT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `comment` mediumtext DEFAULT NULL,
  `attachment` varchar(191) DEFAULT NULL,
  `rating` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 1,
  `is_saved` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `search_functions`
--

CREATE TABLE `search_functions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(150) DEFAULT NULL,
  `url` varchar(250) DEFAULT NULL,
  `visible_for` varchar(191) NOT NULL DEFAULT 'admin',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `search_functions`
--

INSERT INTO `search_functions` (`id`, `key`, `url`, `visible_for`, `created_at`, `updated_at`) VALUES
(1, 'Dashboard', 'admin/dashboard', 'admin', NULL, NULL),
(2, 'Order All', 'admin/orders/list/all', 'admin', NULL, NULL),
(3, 'Order Pending', 'admin/orders/list/pending', 'admin', NULL, NULL),
(4, 'Order Processed', 'admin/orders/list/processed', 'admin', NULL, NULL),
(5, 'Order Delivered', 'admin/orders/list/delivered', 'admin', NULL, NULL),
(6, 'Order Returned', 'admin/orders/list/returned', 'admin', NULL, NULL),
(7, 'Order Failed', 'admin/orders/list/failed', 'admin', NULL, NULL),
(8, 'Brand Add', 'admin/brand/add-new', 'admin', NULL, NULL),
(9, 'Brand List', 'admin/brand/list', 'admin', NULL, NULL),
(10, 'Banner', 'admin/banner/list', 'admin', NULL, NULL),
(11, 'Category', 'admin/category/view', 'admin', NULL, NULL),
(12, 'Sub Category', 'admin/category/sub-category/view', 'admin', NULL, NULL),
(13, 'Sub sub category', 'admin/category/sub-sub-category/view', 'admin', NULL, NULL),
(14, 'Attribute', 'admin/attribute/view', 'admin', NULL, NULL),
(15, 'Product', 'admin/product/list', 'admin', NULL, NULL),
(16, 'Coupon', 'admin/coupon/add-new', 'admin', NULL, NULL),
(17, 'Custom Role', 'admin/custom-role/create', 'admin', NULL, NULL),
(18, 'Employee', 'admin/employee/add-new', 'admin', NULL, NULL),
(19, 'Seller', 'admin/sellers/seller-list', 'admin', NULL, NULL),
(20, 'Contacts', 'admin/contact/list', 'admin', NULL, NULL),
(21, 'Flash Deal', 'admin/deal/flash', 'admin', NULL, NULL),
(22, 'Deal of the day', 'admin/deal/day', 'admin', NULL, NULL),
(23, 'Language', 'admin/business-settings/language', 'admin', NULL, NULL),
(24, 'Mail', 'admin/business-settings/mail', 'admin', NULL, NULL),
(25, 'Shipping method', 'admin/business-settings/shipping-method/add', 'admin', NULL, NULL),
(26, 'Currency', 'admin/currency/view', 'admin', NULL, NULL),
(27, 'Payment method', 'admin/business-settings/payment-method', 'admin', NULL, NULL),
(28, 'SMS Gateway', 'admin/business-settings/sms-gateway', 'admin', NULL, NULL),
(29, 'Support Ticket', 'admin/support-ticket/view', 'admin', NULL, NULL),
(30, 'FAQ', 'admin/helpTopic/list', 'admin', NULL, NULL),
(31, 'About Us', 'admin/business-settings/about-us', 'admin', NULL, NULL),
(32, 'Terms and Conditions', 'admin/business-settings/terms-condition', 'admin', NULL, NULL),
(33, 'Web Config', 'admin/business-settings/web-config', 'admin', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sellers`
--

CREATE TABLE `sellers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `f_name` varchar(30) DEFAULT NULL,
  `l_name` varchar(30) DEFAULT NULL,
  `phone` varchar(25) DEFAULT NULL,
  `image` varchar(30) NOT NULL DEFAULT 'def.png',
  `email` varchar(80) NOT NULL,
  `password` varchar(80) DEFAULT NULL,
  `status` varchar(15) NOT NULL DEFAULT 'pending',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `bank_name` varchar(191) DEFAULT NULL,
  `branch` varchar(191) DEFAULT NULL,
  `account_no` varchar(191) DEFAULT NULL,
  `holder_name` varchar(191) DEFAULT NULL,
  `auth_token` text DEFAULT NULL,
  `sales_commission_percentage` double(8,2) DEFAULT NULL,
  `gst` varchar(191) DEFAULT NULL,
  `cm_firebase_token` varchar(191) DEFAULT NULL,
  `pos_status` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `seller_wallets`
--

CREATE TABLE `seller_wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) DEFAULT NULL,
  `total_earning` double NOT NULL DEFAULT 0,
  `withdrawn` double NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `commission_given` double(8,2) NOT NULL DEFAULT 0.00,
  `pending_withdraw` double(8,2) NOT NULL DEFAULT 0.00,
  `delivery_charge_earned` double(8,2) NOT NULL DEFAULT 0.00,
  `collected_cash` double(8,2) NOT NULL DEFAULT 0.00,
  `total_tax_collected` double(8,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `seller_wallet_histories`
--

CREATE TABLE `seller_wallet_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) DEFAULT NULL,
  `amount` double NOT NULL DEFAULT 0,
  `order_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `payment` varchar(191) NOT NULL DEFAULT 'received',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shipping_addresses`
--

CREATE TABLE `shipping_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` varchar(15) DEFAULT NULL,
  `contact_person_name` varchar(50) DEFAULT NULL,
  `address_type` varchar(20) NOT NULL DEFAULT 'home',
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `zip` varchar(10) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `state` varchar(191) DEFAULT NULL,
  `country` varchar(191) DEFAULT NULL,
  `latitude` varchar(191) DEFAULT NULL,
  `longitude` varchar(191) DEFAULT NULL,
  `is_billing` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shipping_addresses`
--

INSERT INTO `shipping_addresses` (`id`, `customer_id`, `contact_person_name`, `address_type`, `address`, `city`, `zip`, `phone`, `created_at`, `updated_at`, `state`, `country`, `latitude`, `longitude`, `is_billing`) VALUES
(1, '2', 'mesbaul alom', 'home', 'Bashundhara Residential Area,Dhaka\r\ndhaka', 'Dhaka', '1229', '01780882914', '2023-08-11 09:39:41', '2023-08-11 09:39:41', NULL, 'Bangladesh', '', '', 0),
(2, '0', 'Md Safir Uddin Titu', 'home', 'Village: Durgapur, PS+Post office: Bishwambarpur, District: Sunamganj', 'Sunamganj', '3010', '+8801773470176', '2023-08-16 23:40:35', '2023-08-16 23:40:35', NULL, 'Bangladesh', '', '', 0),
(3, '5', 'Mahbub', 'home', 'Coxbazar', 'Coxsbazar', '5047', '01827579461', '2023-08-25 04:25:22', '2023-08-25 04:25:22', NULL, 'Bangladesh', '', '', 0),
(4, '5', 'Mahbub', 'home', 'Cox', 'Cox', '5047', '01827579461', '2023-08-25 04:29:32', '2023-08-25 04:29:32', NULL, 'Bangladesh', '', '', 1),
(5, '7', 'Nijum', 'home', 'Moriccah', 'cox\'s Bazar ', '5047', '01824234587', '2023-08-26 22:24:34', '2023-08-26 22:24:34', NULL, 'Bangladesh', '', '', 0),
(6, '0', 'Md Safir Uddin Titu', 'permanent', 'Village: Durgapur, PS+Post office: Bishwambarpur, District: Sunamganj', 'Sunamganj', '3010', '+8801773470176', '2023-09-09 18:30:27', '2023-09-09 18:30:27', NULL, 'Bangladesh', '', '', 0),
(7, '4', 'Md Safir Uddin Titu', 'permanent', 'Village: Durgapur, PS+Post office: Bishwambarpur, District: Sunamganj', 'Sunamganj', '3010', '+8801773470176', '2023-09-09 18:58:35', '2023-09-09 18:58:35', NULL, 'Bangladesh', '', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `shipping_methods`
--

CREATE TABLE `shipping_methods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `creator_type` varchar(191) NOT NULL DEFAULT 'admin',
  `title` varchar(100) DEFAULT NULL,
  `cost` decimal(8,2) NOT NULL DEFAULT 0.00,
  `duration` varchar(20) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shipping_methods`
--

INSERT INTO `shipping_methods` (`id`, `creator_id`, `creator_type`, `title`, `cost`, `duration`, `status`, `created_at`, `updated_at`) VALUES
(2, 1, 'admin', 'Inside dhaka', 70.00, '1 to 2 Days', 1, '2023-09-09 18:52:28', '2023-09-09 18:52:28'),
(9, 1, 'admin', 'Outside Dhaka', 120.00, '3 to 5 days', 1, '2023-09-09 18:53:00', '2023-09-09 18:53:00'),
(10, 1, 'admin', 'Free Delivery', 0.00, '3 to 5 days', 1, '2023-09-09 18:51:43', '2023-09-09 18:51:43');

-- --------------------------------------------------------

--
-- Table structure for table `shipping_types`
--

CREATE TABLE `shipping_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) UNSIGNED DEFAULT NULL,
  `shipping_type` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shops`
--

CREATE TABLE `shops` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `address` varchar(255) NOT NULL,
  `contact` varchar(25) NOT NULL,
  `image` varchar(30) NOT NULL DEFAULT 'def.png',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `banner` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `social_medias`
--

CREATE TABLE `social_medias` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `link` varchar(100) NOT NULL,
  `icon` varchar(100) DEFAULT NULL,
  `active_status` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `social_medias`
--

INSERT INTO `social_medias` (`id`, `name`, `link`, `icon`, `active_status`, `status`, `created_at`, `updated_at`) VALUES
(1, 'twitter', 'https://techwebdit.com/', 'fa fa-twitter', 1, 1, '2020-12-31 21:18:03', '2023-08-06 11:22:31'),
(2, 'linkedin', 'https://techwebdit.com/', 'fa fa-linkedin', 1, 1, '2021-02-27 16:23:01', '2023-08-06 11:22:36'),
(3, 'google-plus', 'https://techwebdit.com/', 'fa fa-google-plus-square', 1, 1, '2021-02-27 16:23:30', '2023-08-06 11:22:24'),
(4, 'pinterest', 'https://techwebdit.com/', 'fa fa-pinterest', 1, 1, '2021-02-27 16:24:14', '2023-08-06 11:22:19'),
(5, 'instagram', 'https://techwebdit.com/', 'fa fa-instagram', 1, 1, '2021-02-27 16:24:36', '2023-08-06 11:22:13'),
(6, 'facebook', 'facebook.com/isfifashion', 'fa fa-facebook', 1, 1, '2021-02-27 19:19:42', '2023-08-14 22:53:56');

-- --------------------------------------------------------

--
-- Table structure for table `soft_credentials`
--

CREATE TABLE `soft_credentials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(191) DEFAULT NULL,
  `value` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `supplier_management`
--

CREATE TABLE `supplier_management` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `phone` varchar(191) NOT NULL,
  `email` varchar(191) DEFAULT NULL,
  `address` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `supplier_management`
--

INSERT INTO `supplier_management` (`id`, `name`, `phone`, `email`, `address`, `created_at`, `updated_at`) VALUES
(1, 'Nion Roy', '01764366127', 'user@gmail.com', 'Exercitation sunt mo', '2023-10-07 09:10:01', '2023-10-07 09:10:01'),
(2, 'Adara Wilson', '79', 'qewyzu@mailinator.com', 'Sequi quisquam liber', '2023-10-07 09:26:33', '2023-10-07 09:26:33'),
(3, 'Elton Gutierrez', '01764366127', 'xijotuzu@mailinator.com', 'Doloremque similique', '2023-10-07 09:26:43', '2023-10-07 09:43:23'),
(4, 'Lana Walls', '32', 'sepuraviq@mailinator.com', 'Sunt cupiditate dis', '2023-10-07 09:26:52', '2023-10-07 09:26:52'),
(5, 'Emily Morton', '0145697', 'fowafec@mailinator.com', 'Itaque eum pariatur', '2023-10-07 09:27:06', '2023-10-07 09:42:57'),
(6, 'Barrett Kidd', '6', 'lojinizel@mailinator.com', 'At impedit necessit', '2023-10-07 09:27:18', '2023-10-07 09:27:18'),
(7, 'Isadora Brady', '23', 'xyhege@mailinator.com', 'Iure ut consectetur', '2023-10-07 09:27:29', '2023-10-07 09:27:29');

-- --------------------------------------------------------

--
-- Table structure for table `support_tickets`
--

CREATE TABLE `support_tickets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `subject` varchar(150) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `priority` varchar(15) NOT NULL DEFAULT 'low',
  `description` varchar(255) DEFAULT NULL,
  `reply` varchar(255) DEFAULT NULL,
  `status` varchar(15) NOT NULL DEFAULT 'open',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_ticket_convs`
--

CREATE TABLE `support_ticket_convs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `support_ticket_id` bigint(20) DEFAULT NULL,
  `admin_id` bigint(20) DEFAULT NULL,
  `customer_message` varchar(191) DEFAULT NULL,
  `admin_message` varchar(191) DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `payment_for` varchar(100) DEFAULT NULL,
  `payer_id` bigint(20) DEFAULT NULL,
  `payment_receiver_id` bigint(20) DEFAULT NULL,
  `paid_by` varchar(15) DEFAULT NULL,
  `paid_to` varchar(15) DEFAULT NULL,
  `payment_method` varchar(15) DEFAULT NULL,
  `payment_status` varchar(10) NOT NULL DEFAULT 'success',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `amount` double(8,2) NOT NULL DEFAULT 0.00,
  `transaction_type` varchar(191) DEFAULT NULL,
  `order_details_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE `translations` (
  `translationable_type` varchar(191) NOT NULL,
  `translationable_id` bigint(20) UNSIGNED NOT NULL,
  `locale` varchar(191) NOT NULL,
  `key` varchar(191) DEFAULT NULL,
  `value` text DEFAULT NULL,
  `id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `translations`
--

INSERT INTO `translations` (`translationable_type`, `translationable_id`, `locale`, `key`, `value`, `id`) VALUES
('App\\Model\\Product', 15, 'bd', 'name', 'kashmir premium sherwani', 7),
('App\\Model\\Product', 14, 'bd', 'name', 'Kashmir Karim sherwani', 8),
('App\\Model\\Product', 18, 'bd', 'name', 'kashmiry shikuyench', 9),
('App\\Model\\Product', 17, 'bd', 'name', 'Indian premium mangalam', 10),
('App\\Model\\Product', 16, 'bd', 'name', 'Premium kashmir karim', 11),
('App\\Model\\Product', 35, 'bd', 'name', 'kashmir karim koti', 12),
('App\\Model\\Product', 47, 'bd', 'name', 'Kasmir Premium Koti', 13),
('App\\Model\\Product', 70, 'bd', 'name', 'Indian Gold premium', 14),
('App\\Model\\Product', 76, 'bd', 'name', 'Indian Royal Mala', 15),
('App\\Model\\Product', 71, 'bd', 'name', 'Indian Chicken Black', 16),
('App\\Model\\Product', 69, 'bd', 'name', 'Indian Chicken Premium', 17),
('App\\Model\\Product', 68, 'bd', 'name', 'Premium Nagra Indian', 18);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(80) DEFAULT NULL,
  `f_name` varchar(255) DEFAULT NULL,
  `l_name` varchar(255) DEFAULT NULL,
  `phone` varchar(25) NOT NULL,
  `image` varchar(30) NOT NULL DEFAULT 'def.png',
  `email` varchar(80) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(80) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `street_address` varchar(250) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `zip` varchar(20) DEFAULT NULL,
  `house_no` varchar(50) DEFAULT NULL,
  `apartment_no` varchar(50) DEFAULT NULL,
  `cm_firebase_token` varchar(191) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `payment_card_last_four` varchar(191) DEFAULT NULL,
  `payment_card_brand` varchar(191) DEFAULT NULL,
  `payment_card_fawry_token` text DEFAULT NULL,
  `login_medium` varchar(191) DEFAULT NULL,
  `social_id` varchar(191) DEFAULT NULL,
  `is_phone_verified` tinyint(1) NOT NULL DEFAULT 0,
  `temporary_token` varchar(191) DEFAULT NULL,
  `is_email_verified` tinyint(1) NOT NULL DEFAULT 0,
  `wallet_balance` double(8,2) DEFAULT NULL,
  `loyalty_point` double(8,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `f_name`, `l_name`, `phone`, `image`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `street_address`, `country`, `city`, `zip`, `house_no`, `apartment_no`, `cm_firebase_token`, `is_active`, `payment_card_last_four`, `payment_card_brand`, `payment_card_fawry_token`, `login_medium`, `social_id`, `is_phone_verified`, `temporary_token`, `is_email_verified`, `wallet_balance`, `loyalty_point`) VALUES
(0, 'walking customer', 'walking', 'customer', '000000000000', 'def.png', 'walking@customer.com', NULL, '', NULL, NULL, '2022-02-03 03:46:01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(2, NULL, 'titu', 'vai', '8801521119051', 'def.png', 'titu@gmail.com', NULL, '$2y$10$4/h3IhgxWlthMBFbrh4XjeQWXkYTZy9uUj8T84c9N17TIysArysOq', '91DPdYADOCb8L6jYt8wvJB5bPAoP6jUrswtzyWdOYOjWj5RpYZSbovQgTxMC', '2023-08-11 09:37:30', '2023-08-11 09:37:30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(3, NULL, 'Md Safir Uddin', 'Titu', '+8801773470176', 'def.png', 'sutitu630@gmail.com', NULL, '$2y$10$EX62NPqpANrrQHSW8EPFZezNvGcEIbayowHBsLfP3lqgitK91oc66', NULL, '2023-08-14 22:43:27', '2023-08-14 22:43:27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(4, NULL, 'Md Safir Uddin', 'Titu', '01773470176', 'def.png', 'mdrobiul19780@gmail.com', NULL, '$2y$10$m.ojXb29GKgcljvsJpo80uV1FR0vwrlwT03uM5ic4Xgosdj2aIyFW', 'lGsgDT2oPYz7Ddt73HoTfonL3gku1TQZUtpP4oGsEcihDnBBfdHBLeT1uZ0x', '2023-08-16 22:56:36', '2023-08-16 22:56:36', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(5, NULL, 'Mahbub', 'Rahman', '8801827579461', 'def.png', 'mahbub5937@gmail.com', NULL, '$2y$10$XqLsfYzvHKenjG0udtNF1es3SrNIkqEfOyp35x8f6PFU4H3/dBq0G', NULL, '2023-08-25 04:20:50', '2023-08-25 04:20:50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(6, NULL, 'try', 'try', '8801780882915', 'def.png', 'try124@gmail.com', NULL, '$2y$10$ZXWi6SyxrU505l2ZkdqDVu/4bSiG35i37MPOeEGT6GYM/zZd8uGm2', 'F5B9WvgcNYLz9RICvLNlvXEwlvHVYP7Y9KKp0aSEUS4xOfgWC6q2VsgAdkqK', '2023-08-26 20:35:40', '2023-08-26 20:35:40', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(7, NULL, 'Nijum', 'jannat', '8801824234587', 'def.png', 'md.mijan708520@gmail.com', NULL, '$2y$10$3k/KCOSxLevfq7qZJ3IEnOhg55dwrAXr4NQElXPZpHHEAI2oJoCju', NULL, '2023-08-26 22:21:27', '2023-08-26 22:21:27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(8, NULL, 'Robiul', 'Islam', '8801881572062', 'def.png', 'robiul319538@gnail.com', NULL, '$2y$10$F7bsT5ZMRkc96SfpC8PL1O0DCD2QjPCyY7dlPcA.AAeD0Na5hmNIW', 'vRRqzAZ4xnzjuxoEWl401nWmnCvknsSlsE6lWvfoafIzH7eOaa0wxK9OqMAM', '2023-09-06 18:27:57', '2023-09-06 18:27:57', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(9, NULL, 'rafi', 'ahmed', '8801824234586', 'def.png', 'xyz@gmail.com', NULL, '$2y$10$ObLKkvzjj1Wfa/JmQIM5z.ikUKq7gkXdN0jR.5CmiYHH8mzjS1yiW', NULL, '2023-09-09 22:23:36', '2023-09-09 22:23:36', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wallet_transactions`
--

CREATE TABLE `wallet_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `transaction_id` char(36) NOT NULL,
  `credit` decimal(24,3) NOT NULL DEFAULT 0.000,
  `debit` decimal(24,3) NOT NULL DEFAULT 0.000,
  `admin_bonus` decimal(24,3) NOT NULL DEFAULT 0.000,
  `balance` decimal(24,3) NOT NULL DEFAULT 0.000,
  `transaction_type` varchar(191) DEFAULT NULL,
  `reference` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `withdraw_requests`
--

CREATE TABLE `withdraw_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) DEFAULT NULL,
  `delivery_man_id` bigint(20) DEFAULT NULL,
  `admin_id` bigint(20) DEFAULT NULL,
  `amount` varchar(191) NOT NULL DEFAULT '0.00',
  `transaction_note` text DEFAULT NULL,
  `approved` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `admin_roles`
--
ALTER TABLE `admin_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_wallets`
--
ALTER TABLE `admin_wallets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_wallet_histories`
--
ALTER TABLE `admin_wallet_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `billing_addresses`
--
ALTER TABLE `billing_addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `business_settings`
--
ALTER TABLE `business_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart_shippings`
--
ALTER TABLE `cart_shippings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_shipping_costs`
--
ALTER TABLE `category_shipping_costs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chattings`
--
ALTER TABLE `chattings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_wallets`
--
ALTER TABLE `customer_wallets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_wallet_histories`
--
ALTER TABLE `customer_wallet_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deal_of_the_days`
--
ALTER TABLE `deal_of_the_days`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deliveryman_notifications`
--
ALTER TABLE `deliveryman_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deliveryman_wallets`
--
ALTER TABLE `deliveryman_wallets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_country_codes`
--
ALTER TABLE `delivery_country_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_histories`
--
ALTER TABLE `delivery_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_man_transactions`
--
ALTER TABLE `delivery_man_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_men`
--
ALTER TABLE `delivery_men`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_zip_codes`
--
ALTER TABLE `delivery_zip_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `emergency_contacts`
--
ALTER TABLE `emergency_contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `feature_deals`
--
ALTER TABLE `feature_deals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `flash_deals`
--
ALTER TABLE `flash_deals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `flash_deal_products`
--
ALTER TABLE `flash_deal_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `help_topics`
--
ALTER TABLE `help_topics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `loyalty_point_transactions`
--
ALTER TABLE `loyalty_point_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
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
  ADD PRIMARY KEY (`id`);

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_expected_delivery_histories`
--
ALTER TABLE `order_expected_delivery_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_status_histories`
--
ALTER TABLE `order_status_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_transactions`
--
ALTER TABLE `order_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`identity`);

--
-- Indexes for table `paytabs_invoices`
--
ALTER TABLE `paytabs_invoices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `phone_or_email_verifications`
--
ALTER TABLE `phone_or_email_verifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_stocks`
--
ALTER TABLE `product_stocks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `refund_requests`
--
ALTER TABLE `refund_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `refund_statuses`
--
ALTER TABLE `refund_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `refund_transactions`
--
ALTER TABLE `refund_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `search_functions`
--
ALTER TABLE `search_functions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sellers`
--
ALTER TABLE `sellers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sellers_email_unique` (`email`);

--
-- Indexes for table `seller_wallets`
--
ALTER TABLE `seller_wallets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seller_wallet_histories`
--
ALTER TABLE `seller_wallet_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shipping_addresses`
--
ALTER TABLE `shipping_addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shipping_methods`
--
ALTER TABLE `shipping_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shipping_types`
--
ALTER TABLE `shipping_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shops`
--
ALTER TABLE `shops`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `social_medias`
--
ALTER TABLE `social_medias`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `soft_credentials`
--
ALTER TABLE `soft_credentials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `supplier_management`
--
ALTER TABLE `supplier_management`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_tickets`
--
ALTER TABLE `support_tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_ticket_convs`
--
ALTER TABLE `support_ticket_convs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD UNIQUE KEY `transactions_id_unique` (`id`);

--
-- Indexes for table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `translations_translationable_id_index` (`translationable_id`),
  ADD KEY `translations_locale_index` (`locale`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `wallet_transactions`
--
ALTER TABLE `wallet_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdraw_requests`
--
ALTER TABLE `withdraw_requests`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `admin_roles`
--
ALTER TABLE `admin_roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `admin_wallets`
--
ALTER TABLE `admin_wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `admin_wallet_histories`
--
ALTER TABLE `admin_wallet_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `billing_addresses`
--
ALTER TABLE `billing_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `business_settings`
--
ALTER TABLE `business_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `cart_shippings`
--
ALTER TABLE `cart_shippings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `category_shipping_costs`
--
ALTER TABLE `category_shipping_costs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `chattings`
--
ALTER TABLE `chattings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `colors`
--
ALTER TABLE `colors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=144;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `customer_wallets`
--
ALTER TABLE `customer_wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer_wallet_histories`
--
ALTER TABLE `customer_wallet_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deal_of_the_days`
--
ALTER TABLE `deal_of_the_days`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `deliveryman_notifications`
--
ALTER TABLE `deliveryman_notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deliveryman_wallets`
--
ALTER TABLE `deliveryman_wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivery_country_codes`
--
ALTER TABLE `delivery_country_codes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivery_histories`
--
ALTER TABLE `delivery_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivery_man_transactions`
--
ALTER TABLE `delivery_man_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivery_men`
--
ALTER TABLE `delivery_men`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivery_zip_codes`
--
ALTER TABLE `delivery_zip_codes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `emergency_contacts`
--
ALTER TABLE `emergency_contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `feature_deals`
--
ALTER TABLE `feature_deals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `flash_deals`
--
ALTER TABLE `flash_deals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `flash_deal_products`
--
ALTER TABLE `flash_deal_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `help_topics`
--
ALTER TABLE `help_topics`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `loyalty_point_transactions`
--
ALTER TABLE `loyalty_point_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=200;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100011;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `order_expected_delivery_histories`
--
ALTER TABLE `order_expected_delivery_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_status_histories`
--
ALTER TABLE `order_status_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `order_transactions`
--
ALTER TABLE `order_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `paytabs_invoices`
--
ALTER TABLE `paytabs_invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phone_or_email_verifications`
--
ALTER TABLE `phone_or_email_verifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT for table `product_stocks`
--
ALTER TABLE `product_stocks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `refund_requests`
--
ALTER TABLE `refund_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `refund_statuses`
--
ALTER TABLE `refund_statuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `refund_transactions`
--
ALTER TABLE `refund_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `search_functions`
--
ALTER TABLE `search_functions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `sellers`
--
ALTER TABLE `sellers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `seller_wallets`
--
ALTER TABLE `seller_wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `seller_wallet_histories`
--
ALTER TABLE `seller_wallet_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shipping_addresses`
--
ALTER TABLE `shipping_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `shipping_methods`
--
ALTER TABLE `shipping_methods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `shipping_types`
--
ALTER TABLE `shipping_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shops`
--
ALTER TABLE `shops`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `social_medias`
--
ALTER TABLE `social_medias`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `soft_credentials`
--
ALTER TABLE `soft_credentials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `supplier_management`
--
ALTER TABLE `supplier_management`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `support_tickets`
--
ALTER TABLE `support_tickets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_ticket_convs`
--
ALTER TABLE `support_ticket_convs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `wallet_transactions`
--
ALTER TABLE `wallet_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `withdraw_requests`
--
ALTER TABLE `withdraw_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

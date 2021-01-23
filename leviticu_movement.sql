-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 22, 2021 at 05:56 PM
-- Server version: 8.0.23
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
-- Database: `leviticu_movement`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`leviticus`@`localhost` PROCEDURE `Staff_myteam` (IN `v_staffId` INT)  NO SQL
WITH RECURSIVE CTE AS(
SELECT 1 AS Level,`staff_id`, `staff_reporting_staff_id`, `staff_organisation_id`, `staff_username`, `staff_password`, `staff_name`, `staff_address`, `staff_pincode`, `staff_district`, `staff_state`, `staff_country`, `staff_email_address`, `staff_contact_number`, `staff_role`, `staff_organisation_role`, `staff_created_by`, `staff_created_on`, `staff_modified_on`, `staff_modified_by`, `staff_is_active`, `staff_password_modified_on`, `staff_password_modified_by` FROM `staff` WHERE `staff_id`=v_staffId
UNION ALL
    SELECT level+1,S.`staff_id`, S.`staff_reporting_staff_id`, S.`staff_organisation_id`, S.`staff_username`, S.`staff_password`, S.`staff_name`, S.`staff_address`, S.`staff_pincode`, S.`staff_district`, S.`staff_state`, S.`staff_country`, S.`staff_email_address`, S.`staff_contact_number`, S.`staff_role`, S.`staff_organisation_role`, S.`staff_created_by`, S.`staff_created_on`, S.`staff_modified_on`, S.`staff_modified_by`, S.`staff_is_active`, S.`staff_password_modified_on`, S.`staff_password_modified_by` FROM `staff` S INNER JOIN CTE C ON C.`staff_id`=S.`staff_reporting_staff_id` AND S.`staff_id`!=S.`staff_reporting_staff_id` WHERE LEVEL<10
)
SELECT * FROM CTE$$

CREATE DEFINER=`leviticus`@`localhost` PROCEDURE `Staff_org` (IN `v_org` INT)  NO SQL
WITH RECURSIVE CTE AS(
SELECT 1 AS Level,`staff_id`, `staff_reporting_staff_id`, `staff_organisation_id`, `staff_username`, `staff_password`, `staff_name`, `staff_address`, `staff_pincode`, `staff_district`, `staff_state`, `staff_country`, `staff_email_address`, `staff_contact_number`, `staff_role`, `staff_organisation_role`, `staff_created_by`, `staff_created_on`, `staff_modified_on`, `staff_modified_by`, `staff_is_active`, `staff_password_modified_on`, `staff_password_modified_by` FROM `staff` WHERE `staff_id`=`staff_reporting_staff_id` and `staff_organisation_id`=v_org
UNION ALL
    SELECT level+1,S.`staff_id`, S.`staff_reporting_staff_id`, S.`staff_organisation_id`, S.`staff_username`, S.`staff_password`, S.`staff_name`, S.`staff_address`, S.`staff_pincode`, S.`staff_district`, S.`staff_state`, S.`staff_country`, S.`staff_email_address`, S.`staff_contact_number`, S.`staff_role`, S.`staff_organisation_role`, S.`staff_created_by`, S.`staff_created_on`, S.`staff_modified_on`, S.`staff_modified_by`, S.`staff_is_active`, S.`staff_password_modified_on`, S.`staff_password_modified_by` FROM `staff` S INNER JOIN CTE C ON C.`staff_id`=S.`staff_reporting_staff_id` AND S.`staff_id`!=S.`staff_reporting_staff_id` WHERE LEVEL<10
)
SELECT * FROM CTE$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `apis`
--

CREATE TABLE `apis` (
  `api_id` int NOT NULL,
  `api_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `api_staff_id` int NOT NULL,
  `api_is_active` tinyint NOT NULL DEFAULT '1',
  `api_os_id` int NOT NULL,
  `api_device_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `api_last_login` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `api_no_of_ping` bigint NOT NULL,
  `api_firebaseId` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `api_created_on` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `api_created_by` int NOT NULL,
  `api_modified_on` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `api_modified_by` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `apis`
--

INSERT INTO `apis` (`api_id`, `api_key`, `api_staff_id`, `api_is_active`, `api_os_id`, `api_device_id`, `api_last_login`, `api_no_of_ping`, `api_firebaseId`, `api_created_on`, `api_created_by`, `api_modified_on`, `api_modified_by`) VALUES
(1, '4661e74d38e38408bc2ddeee021a7f7fe9ca697401fffde17e1d0d6c44ce2fa2', 47, 1, 1, 'andoid 7.0', '09-11-2020 16:11:57', 20, 'FireBase', '09-11-2020 16:11:57', 47, NULL, NULL),
(2, 'e681b411a12e6a764a18061f0959dc7b4987d17a68e26332ac971b0701ad8a6d', 47, 1, 1, 'andoid 7.0', '09-11-2020 16:14:04', 20, 'FireBase', '09-11-2020 16:14:04', 47, NULL, NULL),
(3, '275f1f2b5b8d37bab81906271cb32f51635e583d9d31ccdab40bec5daa84ab6f', 47, 1, 1, 'andoid 7.0', '09-11-2020 16:14:21', 20, 'FireBase', '09-11-2020 16:14:21', 47, NULL, NULL),
(4, '9a2b8c2ec996c158b84d9d38ef992d5335264bdfc3713382ad3265705dd75d86', 47, 1, 1, 'andoid 7.0', '09-11-2020 16:14:23', 20, 'FireBase', '09-11-2020 16:14:23', 47, NULL, NULL),
(5, 'c54ef51d59ae70bdbe003fb622d0f528903ba4ffd9147c6e28cd17cb1864cb88', 47, 1, 1, 'andoid 7.0', '09-11-2020 16:14:24', 20, 'FireBase', '09-11-2020 16:14:24', 47, NULL, NULL),
(6, '2cfc446027d3d98a038182aab71edfc3055ee99a613db05af397b91e61a8365a', 47, 1, 1, 'andoid 7.0', '09-11-2020 16:14:24', 20, 'FireBase', '09-11-2020 16:14:24', 47, NULL, NULL),
(7, '392c869246054e7df7eb446a8059ab66f2226d9503db5c364815ac82b75f3e0e', 47, 1, 1, 'andoid 7.0', '09-11-2020 16:14:26', 20, 'FireBase', '09-11-2020 16:14:26', 47, NULL, NULL),
(8, 'bcfb875203cb8ae6174c1f8d20e65395b86790d26f03dcc78331daa4d787ef6f', 47, 1, 1, 'andoid 7.0', '09-11-2020 16:14:26', 20, 'FireBase', '09-11-2020 16:14:26', 47, NULL, NULL),
(9, '0e80bc88207e5c759573fd0abb04f5a676c0d4e1e75c5f4dcdc6bfb57bf46fee', 47, 1, 1, 'andoid 7.0', '09-11-2020 16:14:28', 20, 'FireBase', '09-11-2020 16:14:28', 47, NULL, NULL),
(10, '736416b435f3270d95d9d21a990e514dec313cc1036b048141cef7243ddbddd6', 48, 1, 1, 'andoid 7.0', '11-11-2020 07:31:21', 20, 'FireBase', '11-11-2020 07:31:21', 48, NULL, NULL),
(11, '622f47ff4db96a07da847069fd9de89c160e2cd97c9a1449a6d3401c845bea0d', 48, 1, 1, 'andoid 7.0', '11-11-2020 08:09:19', 20, 'FireBase', '11-11-2020 08:09:19', 48, NULL, NULL),
(12, 'e9f7602ddd293e99712571978416a4c10ef6c9e40a027900da28c4b9e71124cf', 48, 1, 1, 'andoid 7.0', '11-11-2020 08:43:23', 20, 'FireBase', '11-11-2020 08:43:23', 48, NULL, NULL),
(13, 'b78f769592eb79c6073f03795ce0d18b366eda185b3326250d193563b71a3401', 48, 1, 1, 'andoid 7.0', '11-11-2020 08:59:00', 20, 'FireBase', '11-11-2020 08:59:00', 48, NULL, NULL),
(14, '69de8ab737eceb32dd43ba48656a92aada6199747888681689949b90cad3b06c', 48, 1, 1, 'andoid 7.0', '11-11-2020 09:04:22', 20, 'FireBase', '11-11-2020 09:04:22', 48, NULL, NULL),
(15, 'a3f66ba6068b3571af447d5fd2bd7b1da03f756dec8cbcaa6d0c9ae3aa930cd9', 48, 1, 1, 'andoid 7.0', '11-11-2020 09:06:45', 20, 'FireBase', '11-11-2020 09:06:45', 48, NULL, NULL),
(16, '85ae67b961863ab04eabfe2e9d0fd8f1f4105c6a05429e23ebcd1be0a26e72fc', 48, 1, 1, 'andoid 7.0', '11-11-2020 09:09:52', 20, 'FireBase', '11-11-2020 09:09:52', 48, NULL, NULL),
(17, '69f73245862ff5cd593a1e4059e5485bfb7f9387ee4cc74597ed1fe40d0fde6c', 48, 1, 1, 'andoid 7.0', '11-11-2020 09:16:09', 20, 'FireBase', '11-11-2020 09:16:09', 48, NULL, NULL),
(18, '64be7f1a18a62a921b51350573fcbe616ea7afed9e289e2178c9b1c321c52053', 48, 1, 1, 'andoid 7.0', '11-11-2020 09:18:53', 20, 'FireBase', '11-11-2020 09:18:53', 48, NULL, NULL),
(19, 'fbdad57c0b62a5620fdfa616a2a06b64d3615c4830b27325972d9c7ddeb7e2c7', 48, 1, 1, 'andoid 7.0', '11-11-2020 09:40:52', 20, 'FireBase', '11-11-2020 09:40:52', 48, NULL, NULL),
(20, '0a04d271af1bbb70ab5097e6165c9beaa09fdb8bb7093d10fff3d9b0067a1072', 48, 1, 1, 'andoid 7.0', '11-11-2020 09:43:41', 20, 'FireBase', '11-11-2020 09:43:41', 48, NULL, NULL),
(21, '259e2a3c183fd5e4e4c5119181026fcd71fc2d66499e90dac694f1e7af0d7812', 48, 1, 1, 'andoid 7.0', '11-11-2020 09:59:38', 20, 'FireBase', '11-11-2020 09:59:38', 48, NULL, NULL),
(22, 'cccff6162fbd087f6ee428bbd84dcfb3e68c76194a0f06a7ce1f3ce340ee02fa', 48, 1, 1, 'andoid 7.0', '11-11-2020 09:59:40', 20, 'FireBase', '11-11-2020 09:59:40', 48, NULL, NULL),
(23, 'de4980314b99b7fcda8d5d9dfda0d5550cccc05f70cdd964f3b0fa0d591d25e0', 48, 1, 1, 'andoid 7.0', '11-11-2020 09:59:45', 20, 'FireBase', '11-11-2020 09:59:45', 48, NULL, NULL),
(24, 'f681e0e60444a5904eceb8e3832889f278ac23c92d00e3e9d3ad161cfefef863', 48, 1, 1, 'andoid 7.0', '11-11-2020 09:59:49', 20, 'FireBase', '11-11-2020 09:59:49', 48, NULL, NULL),
(25, 'a70b7ae25527ee1e1e265fd2c3088425e3679680bd5269b46e63523b41817f4d', 48, 1, 1, 'andoid 7.0', '11-11-2020 09:59:51', 20, 'FireBase', '11-11-2020 09:59:51', 48, NULL, NULL),
(26, '2884bba9ab74129cef1fba154a0917525cd3dfa1688aaeec3178b31cc83b6f0c', 48, 1, 1, 'andoid 7.0', '11-11-2020 10:08:40', 20, 'FireBase', '11-11-2020 10:08:40', 48, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `country_id` int NOT NULL,
  `country_name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `country_shortname` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `country_phonecode` int NOT NULL,
  `country_is_active` tinyint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`country_id`, `country_name`, `country_shortname`, `country_phonecode`, `country_is_active`) VALUES
(1, 'Afghanistan', 'AF', 93, 0),
(2, 'Albania', 'AL', 355, 0),
(3, 'Algeria', 'DZ', 213, 0),
(4, 'American Samoa', 'AS', 1684, 0),
(5, 'Andorra', 'AD', 376, 0),
(6, 'Angola', 'AO', 244, 0),
(7, 'Anguilla', 'AI', 1264, 0),
(8, 'Antarctica', 'AQ', 0, 0),
(9, 'Antigua And Barbuda', 'AG', 1268, 0),
(10, 'Argentina', 'AR', 54, 0),
(11, 'Armenia', 'AM', 374, 0),
(12, 'Aruba', 'AW', 297, 0),
(13, 'Australia', 'AU', 61, 0),
(14, 'Austria', 'AT', 43, 0),
(15, 'Azerbaijan', 'AZ', 994, 0),
(16, 'Bahamas The', 'BS', 1242, 0),
(17, 'Bahrain', 'BH', 973, 0),
(18, 'Bangladesh', 'BD', 880, 0),
(19, 'Barbados', 'BB', 1246, 0),
(20, 'Belarus', 'BY', 375, 0),
(21, 'Belgium', 'BE', 32, 0),
(22, 'Belize', 'BZ', 501, 0),
(23, 'Benin', 'BJ', 229, 0),
(24, 'Bermuda', 'BM', 1441, 0),
(25, 'Bhutan', 'BT', 975, 0),
(26, 'Bolivia', 'BO', 591, 0),
(27, 'Bosnia and Herzegovina', 'BA', 387, 0),
(28, 'Botswana', 'BW', 267, 0),
(29, 'Bouvet Island', 'BV', 0, 0),
(30, 'Brazil', 'BR', 55, 0),
(31, 'British Indian Ocean Territory', 'IO', 246, 0),
(32, 'Brunei', 'BN', 673, 0),
(33, 'Bulgaria', 'BG', 359, 0),
(34, 'Burkina Faso', 'BF', 226, 0),
(35, 'Burundi', 'BI', 257, 0),
(36, 'Cambodia', 'KH', 855, 0),
(37, 'Cameroon', 'CM', 237, 0),
(38, 'Canada', 'CA', 1, 0),
(39, 'Cape Verde', 'CV', 238, 0),
(40, 'Cayman Islands', 'KY', 1345, 0),
(41, 'Central African Republic', 'CF', 236, 0),
(42, 'Chad', 'TD', 235, 0),
(43, 'Chile', 'CL', 56, 0),
(44, 'China', 'CN', 86, 0),
(45, 'Christmas Island', 'CX', 61, 0),
(46, 'Cocos (Keeling) Islands', 'CC', 672, 0),
(47, 'Colombia', 'CO', 57, 0),
(48, 'Comoros', 'KM', 269, 0),
(49, 'Republic Of The Congo', 'CG', 242, 0),
(50, 'Democratic Republic Of The Congo', 'CD', 242, 0),
(51, 'Cook Islands', 'CK', 682, 0),
(52, 'Costa Rica', 'CR', 506, 0),
(53, 'Cote D\'Ivoire (Ivory Coast)', 'CI', 225, 0),
(54, 'Croatia (Hrvatska)', 'HR', 385, 0),
(55, 'Cuba', 'CU', 53, 0),
(56, 'Cyprus', 'CY', 357, 0),
(57, 'Czech Republic', 'CZ', 420, 0),
(58, 'Denmark', 'DK', 45, 0),
(59, 'Djibouti', 'DJ', 253, 0),
(60, 'Dominica', 'DM', 1767, 0),
(61, 'Dominican Republic', 'DO', 1809, 0),
(62, 'East Timor', 'TP', 670, 0),
(63, 'Ecuador', 'EC', 593, 0),
(64, 'Egypt', 'EG', 20, 0),
(65, 'El Salvador', 'SV', 503, 0),
(66, 'Equatorial Guinea', 'GQ', 240, 0),
(67, 'Eritrea', 'ER', 291, 0),
(68, 'Estonia', 'EE', 372, 0),
(69, 'Ethiopia', 'ET', 251, 0),
(70, 'External Territories of Australia', 'XA', 61, 0),
(71, 'Falkland Islands', 'FK', 500, 0),
(72, 'Faroe Islands', 'FO', 298, 0),
(73, 'Fiji Islands', 'FJ', 679, 0),
(74, 'Finland', 'FI', 358, 0),
(75, 'France', 'FR', 33, 0),
(76, 'French Guiana', 'GF', 594, 0),
(77, 'French Polynesia', 'PF', 689, 0),
(78, 'French Southern Territories', 'TF', 0, 0),
(79, 'Gabon', 'GA', 241, 0),
(80, 'Gambia The', 'GM', 220, 0),
(81, 'Georgia', 'GE', 995, 0),
(82, 'Germany', 'DE', 49, 0),
(83, 'Ghana', 'GH', 233, 0),
(84, 'Gibraltar', 'GI', 350, 0),
(85, 'Greece', 'GR', 30, 0),
(86, 'Greenland', 'GL', 299, 0),
(87, 'Grenada', 'GD', 1473, 0),
(88, 'Guadeloupe', 'GP', 590, 0),
(89, 'Guam', 'GU', 1671, 0),
(90, 'Guatemala', 'GT', 502, 0),
(91, 'Guernsey and Alderney', 'XU', 44, 0),
(92, 'Guinea', 'GN', 224, 0),
(93, 'Guinea-Bissau', 'GW', 245, 0),
(94, 'Guyana', 'GY', 592, 0),
(95, 'Haiti', 'HT', 509, 0),
(96, 'Heard and McDonald Islands', 'HM', 0, 0),
(97, 'Honduras', 'HN', 504, 0),
(98, 'Hong Kong S.A.R.', 'HK', 852, 0),
(99, 'Hungary', 'HU', 36, 0),
(100, 'Iceland', 'IS', 354, 0),
(101, 'India', 'IN', 91, 1),
(102, 'Indonesia', 'ID', 62, 0),
(103, 'Iran', 'IR', 98, 0),
(104, 'Iraq', 'IQ', 964, 0),
(105, 'Ireland', 'IE', 353, 0),
(106, 'Israel', 'IL', 972, 1),
(107, 'Italy', 'IT', 39, 0),
(108, 'Jamaica', 'JM', 1876, 0),
(109, 'Japan', 'JP', 81, 0),
(110, 'Jersey', 'XJ', 44, 0),
(111, 'Jordan', 'JO', 962, 0),
(112, 'Kazakhstan', 'KZ', 7, 0),
(113, 'Kenya', 'KE', 254, 0),
(114, 'Kiribati', 'KI', 686, 0),
(115, 'Korea North', 'KP', 850, 0),
(116, 'Korea South', 'KR', 82, 0),
(117, 'Kuwait', 'KW', 965, 0),
(118, 'Kyrgyzstan', 'KG', 996, 0),
(119, 'Laos', 'LA', 856, 0),
(120, 'Latvia', 'LV', 371, 0),
(121, 'Lebanon', 'LB', 961, 0),
(122, 'Lesotho', 'LS', 266, 0),
(123, 'Liberia', 'LR', 231, 0),
(124, 'Libya', 'LY', 218, 0),
(125, 'Liechtenstein', 'LI', 423, 0),
(126, 'Lithuania', 'LT', 370, 0),
(127, 'Luxembourg', 'LU', 352, 0),
(128, 'Macau S.A.R.', 'MO', 853, 0),
(129, 'Macedonia', 'MK', 389, 0),
(130, 'Madagascar', 'MG', 261, 0),
(131, 'Malawi', 'MW', 265, 0),
(132, 'Malaysia', 'MY', 60, 0),
(133, 'Maldives', 'MV', 960, 0),
(134, 'Mali', 'ML', 223, 0),
(135, 'Malta', 'MT', 356, 0),
(136, 'Man (Isle of)', 'XM', 44, 0),
(137, 'Marshall Islands', 'MH', 692, 0),
(138, 'Martinique', 'MQ', 596, 0),
(139, 'Mauritania', 'MR', 222, 0),
(140, 'Mauritius', 'MU', 230, 0),
(141, 'Mayotte', 'YT', 269, 0),
(142, 'Mexico', 'MX', 52, 0),
(143, 'Micronesia', 'FM', 691, 0),
(144, 'Moldova', 'MD', 373, 0),
(145, 'Monaco', 'MC', 377, 0),
(146, 'Mongolia', 'MN', 976, 0),
(147, 'Montserrat', 'MS', 1664, 0),
(148, 'Morocco', 'MA', 212, 0),
(149, 'Mozambique', 'MZ', 258, 0),
(150, 'Myanmar', 'MM', 95, 0),
(151, 'Namibia', 'NA', 264, 0),
(152, 'Nauru', 'NR', 674, 0),
(153, 'Nepal', 'NP', 977, 0),
(154, 'Netherlands Antilles', 'AN', 599, 0),
(155, 'Netherlands The', 'NL', 31, 0),
(156, 'New Caledonia', 'NC', 687, 0),
(157, 'New Zealand', 'NZ', 64, 0),
(158, 'Nicaragua', 'NI', 505, 0),
(159, 'Niger', 'NE', 227, 0),
(160, 'Nigeria', 'NG', 234, 0),
(161, 'Niue', 'NU', 683, 0),
(162, 'Norfolk Island', 'NF', 672, 0),
(163, 'Northern Mariana Islands', 'MP', 1670, 0),
(164, 'Norway', 'NO', 47, 0),
(165, 'Oman', 'OM', 968, 0),
(166, 'Pakistan', 'PK', 92, 0),
(167, 'Palau', 'PW', 680, 0),
(168, 'Palestinian Territory Occupied', 'PS', 970, 0),
(169, 'Panama', 'PA', 507, 0),
(170, 'Papua new Guinea', 'PG', 675, 0),
(171, 'Paraguay', 'PY', 595, 0),
(172, 'Peru', 'PE', 51, 0),
(173, 'Philippines', 'PH', 63, 0),
(174, 'Pitcairn Island', 'PN', 0, 0),
(175, 'Poland', 'PL', 48, 0),
(176, 'Portugal', 'PT', 351, 0),
(177, 'Puerto Rico', 'PR', 1787, 0),
(178, 'Qatar', 'QA', 974, 0),
(179, 'Reunion', 'RE', 262, 0),
(180, 'Romania', 'RO', 40, 0),
(181, 'Russia', 'RU', 70, 0),
(182, 'Rwanda', 'RW', 250, 0),
(183, 'Saint Helena', 'SH', 290, 0),
(184, 'Saint Kitts And Nevis', 'KN', 1869, 0),
(185, 'Saint Lucia', 'LC', 1758, 0),
(186, 'Saint Pierre and Miquelon', 'PM', 508, 0),
(187, 'Saint Vincent And The Grenadines', 'VC', 1784, 0),
(188, 'Samoa', 'WS', 684, 0),
(189, 'San Marino', 'SM', 378, 0),
(190, 'Sao Tome and Principe', 'ST', 239, 0),
(191, 'Saudi Arabia', 'SA', 966, 0),
(192, 'Senegal', 'SN', 221, 0),
(193, 'Serbia', 'RS', 381, 0),
(194, 'Seychelles', 'SC', 248, 0),
(195, 'Sierra Leone', 'SL', 232, 0),
(196, 'Singapore', 'SG', 65, 0),
(197, 'Slovakia', 'SK', 421, 0),
(198, 'Slovenia', 'SI', 386, 0),
(199, 'Smaller Territories of the UK', 'XG', 44, 0),
(200, 'Solomon Islands', 'SB', 677, 0),
(201, 'Somalia', 'SO', 252, 0),
(202, 'South Africa', 'ZA', 27, 0),
(203, 'South Georgia', 'GS', 0, 0),
(204, 'South Sudan', 'SS', 211, 0),
(205, 'Spain', 'ES', 34, 0),
(206, 'Sri Lanka', 'LK', 94, 0),
(207, 'Sudan', 'SD', 249, 0),
(208, 'Suriname', 'SR', 597, 0),
(209, 'Svalbard And Jan Mayen Islands', 'SJ', 47, 0),
(210, 'Swaziland', 'SZ', 268, 0),
(211, 'Sweden', 'SE', 46, 0),
(212, 'Switzerland', 'CH', 41, 0),
(213, 'Syria', 'SY', 963, 0),
(214, 'Taiwan', 'TW', 886, 0),
(215, 'Tajikistan', 'TJ', 992, 0),
(216, 'Tanzania', 'TZ', 255, 0),
(217, 'Thailand', 'TH', 66, 0),
(218, 'Togo', 'TG', 228, 0),
(219, 'Tokelau', 'TK', 690, 0),
(220, 'Tonga', 'TO', 676, 0),
(221, 'Trinidad And Tobago', 'TT', 1868, 0),
(222, 'Tunisia', 'TN', 216, 0),
(223, 'Turkey', 'TR', 90, 0),
(224, 'Turkmenistan', 'TM', 7370, 0),
(225, 'Turks And Caicos Islands', 'TC', 1649, 0),
(226, 'Tuvalu', 'TV', 688, 0),
(227, 'Uganda', 'UG', 256, 0),
(228, 'Ukraine', 'UA', 380, 0),
(229, 'United Arab Emirates', 'AE', 971, 0),
(230, 'United Kingdom', 'GB', 44, 0),
(231, 'United States', 'US', 1, 0),
(232, 'United States Minor Outlying Islands', 'UM', 1, 0),
(233, 'Uruguay', 'UY', 598, 0),
(234, 'Uzbekistan', 'UZ', 998, 0),
(235, 'Vanuatu', 'VU', 678, 0),
(236, 'Vatican City State (Holy See)', 'VA', 39, 0),
(237, 'Venezuela', 'VE', 58, 0),
(238, 'Vietnam', 'VN', 84, 0),
(239, 'Virgin Islands (British)', 'VG', 1284, 0),
(240, 'Virgin Islands (US)', 'VI', 1340, 0),
(241, 'Wallis And Futuna Islands', 'WF', 681, 0),
(242, 'Western Sahara', 'EH', 212, 0),
(243, 'Yemen', 'YE', 967, 0),
(244, 'Yugoslavia', 'YU', 38, 0),
(245, 'Zambia', 'ZM', 260, 0),
(246, 'Zimbabwe', 'ZW', 263, 0);

-- --------------------------------------------------------

--
-- Table structure for table `districts`
--

CREATE TABLE `districts` (
  `district_id` int NOT NULL,
  `district_name` text COLLATE utf8mb4_general_ci NOT NULL,
  `district_state_id` int NOT NULL,
  `district_is_active` tinyint NOT NULL DEFAULT '0',
  `district_created_on` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `district_created_by` int NOT NULL,
  `district_modified_on` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `district_modified_by` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `districts`
--

INSERT INTO `districts` (`district_id`, `district_name`, `district_state_id`, `district_is_active`, `district_created_on`, `district_created_by`, `district_modified_on`, `district_modified_by`) VALUES
(1, 'Kanchipuram', 31, 0, '10-11-2020 17:20:37', 1, '10-11-2020 17:59:48', 1),
(2, 'chennai', 31, 0, '13-11-2020 17:33:45', 51, NULL, NULL),
(3, 'theni', 31, 0, '18-11-2020 17:20:41', 1, NULL, NULL),
(4, 'Nagarjuna Sagar', 2, 1, '24-11-2020 18:19:23', 1, NULL, NULL),
(5, 'Hyderabad', 2, 1, '24-11-2020 18:19:45', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `field_data`
--

CREATE TABLE `field_data` (
  `field_data_id` int NOT NULL,
  `field_data_organistaion_id` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `field_data_created_for` int NOT NULL,
  `field_data_report_from` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `field_data_report_to` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `field_data_district_id` int NOT NULL,
  `field_data_no_of_villages` int DEFAULT NULL,
  `field_data_place` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `field_data_no_of_men_heard_gospel` int DEFAULT NULL,
  `field_data_no_of_women_heard_gospel` int DEFAULT NULL,
  `field_data_no_of_children_heard_gospel` int DEFAULT NULL,
  `field_data_no_of_men_accepted_gospel` int DEFAULT NULL,
  `field_data_no_of_women_accepted_gospel` int DEFAULT NULL,
  `field_data_no_of_children_accepted_gospel` int DEFAULT NULL,
  `field_data_no_of_men_baptized` int DEFAULT NULL,
  `field_data_no_of_women_baptized` int DEFAULT NULL,
  `field_data_no_of_children_baptized` int DEFAULT NULL,
  `field_data_no_of_weekly_group` int DEFAULT NULL,
  `field_data_no_of_men_attended_prayer_group` int DEFAULT NULL,
  `field_data_no_of_women_attended_prayer_group` int DEFAULT NULL,
  `field_data_no_of_children_attended_prayer_group` int DEFAULT NULL,
  `field_data_no_of_churches` int DEFAULT NULL,
  `field_data_no_men_attended_church` int DEFAULT NULL,
  `field_data_no_women_attended_church` int DEFAULT NULL,
  `field_data_no_children_attended_church` int DEFAULT NULL,
  `field_data_no_of_volunteers` int DEFAULT NULL,
  `field_data_no_of_social_work_project` int DEFAULT NULL,
  `field_data_no_of_beneficiaries_social_work_project` int DEFAULT NULL,
  `field_data_no_level1_leaders_trained` int DEFAULT NULL,
  `field_data_no_level2_leaders_trained` int DEFAULT NULL,
  `field_data_no_level3_leaders_trained` int DEFAULT NULL,
  `field_data_photos_shared` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `field_data_prayer_point_reports` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `field_data_praise_point_reports` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `field_data_videos_shared` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `field_data_attachment1` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field_data_attachment2` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field_data_attachment3` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `field_data_modified_on` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `field_data_modified_by` int DEFAULT NULL,
  `field_data_created_by` int NOT NULL,
  `field_data_created_on` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `field_data_location` text COLLATE utf8mb4_general_ci NOT NULL,
  `field_data_prayer_text` text COLLATE utf8mb4_general_ci,
  `field_data_praise_text` text COLLATE utf8mb4_general_ci,
  `field_data_is_active` tinyint NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `field_data`
--

INSERT INTO `field_data` (`field_data_id`, `field_data_organistaion_id`, `field_data_created_for`, `field_data_report_from`, `field_data_report_to`, `field_data_district_id`, `field_data_no_of_villages`, `field_data_place`, `field_data_no_of_men_heard_gospel`, `field_data_no_of_women_heard_gospel`, `field_data_no_of_children_heard_gospel`, `field_data_no_of_men_accepted_gospel`, `field_data_no_of_women_accepted_gospel`, `field_data_no_of_children_accepted_gospel`, `field_data_no_of_men_baptized`, `field_data_no_of_women_baptized`, `field_data_no_of_children_baptized`, `field_data_no_of_weekly_group`, `field_data_no_of_men_attended_prayer_group`, `field_data_no_of_women_attended_prayer_group`, `field_data_no_of_children_attended_prayer_group`, `field_data_no_of_churches`, `field_data_no_men_attended_church`, `field_data_no_women_attended_church`, `field_data_no_children_attended_church`, `field_data_no_of_volunteers`, `field_data_no_of_social_work_project`, `field_data_no_of_beneficiaries_social_work_project`, `field_data_no_level1_leaders_trained`, `field_data_no_level2_leaders_trained`, `field_data_no_level3_leaders_trained`, `field_data_photos_shared`, `field_data_prayer_point_reports`, `field_data_praise_point_reports`, `field_data_videos_shared`, `field_data_attachment1`, `field_data_attachment2`, `field_data_attachment3`, `field_data_modified_on`, `field_data_modified_by`, `field_data_created_by`, `field_data_created_on`, `field_data_location`, `field_data_prayer_text`, `field_data_praise_text`, `field_data_is_active`) VALUES
(19, '9', 3, '2020-11-01', '2020-11-23', 1, 5, 'text', 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 13, 3, 3, 3, 3, 3, 3, 3, 3, 'PhotosShared', 'PrayerPointReports', 'PraisePointReports', 'VideosShared', 'fielddata_attachment1_5fbbab5d3e035.zip', '', '', NULL, NULL, 3, '23-11-2020 18:00:21', 'place', 'text', 'text', 1),
(20, '4', 1, '2020-11-01', '2020-11-30', 1, 1, 'aSJLJSALK', 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 20, '', '', '', '', '', '', '', NULL, NULL, 1, '29-11-2020 21:21:46', 'KJHJKHJK', 'MKHKJ', 'KJKJHKJHJK', 1),
(21, '4', 1, '2020-10-10', '2020-10-31', 1, 10, 'MYSORE', 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, '', '', '', '', '', '', '', NULL, NULL, 1, '29-11-2020 21:23:10', 'HKJHKJHKJ', 'HJKHJKHJK', 'HJKHJKHJKH', 1),
(22, '1', 1, '2020-11-01', '2020-11-30', 4, 1, 'aSJLJSALK', 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 20, '', '', '', '', '', '', '', NULL, NULL, 1, '29-11-2020 21:21:46', 'KJHJKHJK', 'MKHKJ', 'KJKJHKJHJK', 1),
(23, '19', 64, '2020-12-21', '2020-12-31', 1, 10, 'kjkljkl', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '', '', '', '', '', '', '', NULL, NULL, 63, '18-12-2020 17:23:21', 'lkljkljkljlk', 'jkjkljk', 'kjkljkljkl', 1),
(24, '19', 62, '2020-12-14', '2020-12-17', 1, 3, 'Nagarjuna Sagar', 3, 0, 0, 2, 5, 3, 1, 0, 0, 1, 8, 2, 2, 1, 2, 5, 1, 2, 1, 50, 2, 2, 1, '', '', '', '', '', '', '', NULL, NULL, 63, '18-12-2020 17:34:59', 'Nagarjuna Sagar', 'Pray for rain', 'Families', 1),
(25, '19', 1, '2020-12-07', '2020-12-14', 1, 3, 'bajara', 5, 5, 0, 5, 5, 5, 5, 5, 5, 1, 2, 0, 0, 1, 2, 2, 2, 1, 1, 0, 2, 2, 1, '', '', '', '', '', '', '', NULL, NULL, 63, '21-12-2020 16:17:17', 'location', 'prayer point', 'praise point', 1),
(26, '19', 64, '2020-12-01', '2020-12-12', 1, 2, '1', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '', '', '', '', '', '', '', NULL, NULL, 64, '21-12-2020 16:22:09', '1', '1', '1', 1),
(27, '19', 1, '2020-12-21', '2021-01-04', 1, 54, 'Nagarjuna Sagar', 5, 5, 5, 2, 2, 2, 1, 1, 0, 3, 1, 1, 33, 2, 22, 22, 22, 1, 0, 0, 1, 1, 1, '', '', '', '', '', '', '', NULL, NULL, 64, '21-01-2021 14:30:02', 'pray for parents', 'pray for 2021', 'pray for kids', 1),
(28, '19', 1, '2021-01-01', '2021-01-05', 1, 1, 'chennai', 10, 10, 10, 10, 10, 101, 10, 10, 10, 10, 10, 101, 10, 10, 1, 1, 1, 10, 10, 10, 101, 10, 10, '', '', '', '', '', '', '', NULL, NULL, 1, '21-01-2021 15:22:39', 'jkhjkhjkh', 'nkhkhjk', 'jhjkhjkhjk', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `notification_id` int NOT NULL,
  `notification_organisation_id` int NOT NULL,
  `notification_header` text COLLATE utf8mb4_general_ci NOT NULL,
  `notification_body` text COLLATE utf8mb4_general_ci NOT NULL,
  `notification_is_approved` tinyint NOT NULL DEFAULT '0',
  `notification_created_by` int NOT NULL,
  `notification_created_on` varchar(60) COLLATE utf8mb4_general_ci NOT NULL,
  `notification_approved_by` int DEFAULT NULL,
  `notification_approved_on` varchar(60) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`notification_id`, `notification_organisation_id`, `notification_header`, `notification_body`, `notification_is_approved`, `notification_created_by`, `notification_created_on`, `notification_approved_by`, `notification_approved_on`) VALUES
(1, 1, 'Dummy Heading', 'Heading', 1, 1, '11-11-2020 15:48:20', 1, '21-01-2021 15:29:04'),
(2, 16, 'urgent send photos', 'send photos by 10 December', 1, 1, '16-11-2020 16:11:43', 1, '16-11-2020 16:12:02'),
(3, 19, 'test', 'test', 1, 62, '21-12-2020 22:46:51', 1, '21-12-2020 22:47:35');

-- --------------------------------------------------------

--
-- Table structure for table `organisations`
--

CREATE TABLE `organisations` (
  `organisation_id` int NOT NULL,
  `organisation_code` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `organisation_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `organisation_address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `organisation_contact_person` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `organisation_email_address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `organisation_contact_number` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `organisation_is_active` tinyint NOT NULL DEFAULT '0',
  `organisation_created_on` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `organisation_created_by` int DEFAULT NULL,
  `organisation_modified_on` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `organisation_modified_by` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `organisations`
--

INSERT INTO `organisations` (`organisation_id`, `organisation_code`, `organisation_name`, `organisation_address`, `organisation_contact_person`, `organisation_email_address`, `organisation_contact_number`, `organisation_is_active`, `organisation_created_on`, `organisation_created_by`, `organisation_modified_on`, `organisation_modified_by`) VALUES
(4, 'ORD', 'ORG_NAME4', 'Kolkata', 'ARNOLD', 'org4@cci.com', '3545789', 1, '', 0, NULL, NULL),
(9, 'ORI', 'ORG_NAME9', 'Delhi', 'PAUL', 'org9@cci.com', '4556578', 1, '', 0, NULL, NULL),
(19, 'GBBM', 'Global Baptist Banjara Ministries', 'full address, streeet,region,city,pincode', 'Abraham', 'vksmoorthy@gmail.com', '9876543100', 1, '24-11-2020 18:17:46', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `organisation_roles`
--

CREATE TABLE `organisation_roles` (
  `organisation_role_id` int NOT NULL,
  `organisation_role_organisation_id` int NOT NULL,
  `organisation_role_name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `organisation_role_is_active` tinyint NOT NULL DEFAULT '1',
  `organisation_role_modified_on` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `organisation_role_modified_by` int DEFAULT NULL,
  `organisation_role_created_on` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `organisation_role_created_by` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `organisation_roles`
--

INSERT INTO `organisation_roles` (`organisation_role_id`, `organisation_role_organisation_id`, `organisation_role_name`, `organisation_role_is_active`, `organisation_role_modified_on`, `organisation_role_modified_by`, `organisation_role_created_on`, `organisation_role_created_by`) VALUES
(1, 1, 'ORGNAME!1', 1, '18-11-2020 16:39:50', 3, '10-11-2020 18:35:35', 1),
(2, 2, 'ORGNAME!2', 1, '18-11-2020 16:39:30', 3, '10-11-2020 19:13:27', 1),
(3, 10, 'ORGNAME!10', 1, NULL, NULL, '18-11-2020 16:38:48', 3),
(4, 9, 'ORGNAME!9', 1, NULL, NULL, '18-11-2020 16:40:34', 3),
(5, 19, 'GBBMCoordinator', 1, NULL, NULL, '08-12-2020 20:39:42', 1),
(6, 19, 'GBBMSupervisor', 1, NULL, NULL, '08-12-2020 20:39:59', 1),
(7, 19, 'GBBMPastor', 1, NULL, NULL, '08-12-2020 20:43:07', 1),
(8, 19, 'GBBM local pastor', 1, NULL, NULL, '21-01-2021 15:27:19', 62);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `role_Id` int NOT NULL,
  `role_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `role_level` int DEFAULT NULL,
  `role_created_by` int NOT NULL,
  `role_created_on` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `role_modified_on` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `role_modified_by` int DEFAULT NULL,
  `role_is_active` tinyint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`role_Id`, `role_name`, `role_level`, `role_created_by`, `role_created_on`, `role_modified_on`, `role_modified_by`, `role_is_active`) VALUES
(1, 'User', 1, 1, '10-10-2020 11:00:00', NULL, NULL, 1),
(2, 'Admin', 2, 1, '10-10-2020 11:00:00', NULL, NULL, 1),
(3, 'SuperAdmin', 3, 1, '10-10-2020 11:00:00', NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `staff_id` int NOT NULL,
  `staff_organisation_id` int DEFAULT NULL,
  `staff_username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `staff_password` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `staff_role` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `staff_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `staff_address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `staff_pincode` int NOT NULL,
  `staff_district` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `staff_state` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `staff_country` int NOT NULL,
  `staff_email_address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `staff_contact_number` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `staff_reporting_staff_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `staff_organisation_role` int DEFAULT NULL,
  `staff_created_by` int NOT NULL,
  `staff_created_on` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `staff_modified_on` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `staff_modified_by` int DEFAULT NULL,
  `staff_is_active` tinyint NOT NULL DEFAULT '1',
  `staff_password_modified_on` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `staff_password_modified_by` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`staff_id`, `staff_organisation_id`, `staff_username`, `staff_password`, `staff_role`, `staff_name`, `staff_address`, `staff_pincode`, `staff_district`, `staff_state`, `staff_country`, `staff_email_address`, `staff_contact_number`, `staff_reporting_staff_id`, `staff_organisation_role`, `staff_created_by`, `staff_created_on`, `staff_modified_on`, `staff_modified_by`, `staff_is_active`, `staff_password_modified_on`, `staff_password_modified_by`) VALUES
(1, 4, 'johnson', '$2y$10$ecWf8Q9pmmTR9Ns9UPkcUulLamypyVIYsjj5rEUUAWVTFksSlHbPG', '3', 'Moorthy', 'chennai', 0, '3', '1', 18, 'JOANNA@GMAIL.COM', '8989896', '1', 1, 0, '', '23-11-2020 11:37:11', 3, 1, NULL, NULL),
(3, 9, 'sunitha', '$2y$10$WGNvXCxXZxIebUv/smFkfu4yk/reeToyxTHq/5C0ziKQYWNljcfQ2', '3', 'sunitha', 'chennai', 123675, '2', '1', 102, 'tez@s.in', '123', '2', 1, 1, '11-11-2020 16:36:19', '17-11-2020 14:39:39', 3, 1, '13-11-2020 13:01:59', 51),
(62, 19, 'balu', '$2y$10$TcPVjw6jW96qQq7Vbhdyw.qMlJQc4pR.4V4jyGQVLdaWNFcy7ir12', '2', 'Balu', 'govindasami nagar , 5th street, plot no 14, madipakkam\r\nMadipakkam', 600091, '1', '31', 101, 'vksmoorthy@gmail.com', '12345689752', '62', 7, 1, '08-12-2020 20:45:13', '02-01-2021 19:44:28', 62, 1, NULL, NULL),
(63, 19, 'sion', '$2y$10$gZBIN2p1pGRxUoLQCe29YO9/YbWoaCrcwAVylS.JqptlhU6ZIFIPy', '1', 'Sion', 'govindasami nagar , 5th street, plot no 14, madipakkam\r\nMadipakkam', 600091, '1', '31', 101, 'reportssrini@gmail.com', '1234567890', '62', 6, 62, '17-12-2020 23:39:58', NULL, NULL, 1, NULL, NULL),
(64, 19, 'laxman', '$2y$10$cK7Gpt7h69XYSGRmo/T5F.M9kqAZolBVn/.s7QBuR1ofN5vdIFmqK', '1', 'Laxman', 'govindasami nagar , 5th street, plot no 14, madipakkam\r\nMadipakkam', 600091, '1', '31', 101, 'vksmoorthy@yahoo.com', '1212121212', '63', 7, 62, '17-12-2020 23:41:20', NULL, NULL, 1, NULL, NULL),
(65, 19, 'stanley', '$2y$10$WoaT/EJ6B23ulm5Ey6fciuM90yPwN2Gz1Qpry/xWLafW56C79zJNK', '1', 'Stanley', 'govindasami nagar , 5th street, plot no 14, madipakkam\r\nMadipakkam', 600091, '1', '31', 101, 'vksmoorthy@gmail.com', '569871236', '63', 5, 62, '17-12-2020 23:41:57', '31-12-2020 14:48:14', 62, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE `states` (
  `state_id` int UNSIGNED NOT NULL,
  `state_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `state_created_by` int NOT NULL DEFAULT '1',
  `state_created_on` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'N/A',
  `state_modified_on` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'NA',
  `state_modified_by` int NOT NULL DEFAULT '1',
  `state_is_active` tinyint NOT NULL DEFAULT '0',
  `state_country_id` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `states`
--

INSERT INTO `states` (`state_id`, `state_name`, `state_created_by`, `state_created_on`, `state_modified_on`, `state_modified_by`, `state_is_active`, `state_country_id`) VALUES
(1, 'ANDAMAN AND NICOBAR ISLANDS', 0, '', '', 0, 0, 0),
(2, 'ANDHRA PRADESH', 0, '', '', 0, 0, 0),
(3, 'ARUNACHAL PRADESH', 0, '', '', 0, 0, 0),
(4, 'ASSAM', 0, '', '', 0, 0, 0),
(5, 'BIHAR', 0, '', '', 0, 0, 0),
(6, 'CHATTISGARH', 0, '', '', 0, 0, 0),
(7, 'CHANDIGARH', 0, '', '', 0, 0, 0),
(8, 'DAMAN AND DIU', 0, '', '', 0, 0, 0),
(9, 'DELHI', 0, '', '', 0, 0, 0),
(10, 'DADRA AND NAGAR HAVELI', 0, '', '', 0, 0, 0),
(11, 'GOA', 0, '', '', 0, 0, 0),
(12, 'GUJARAT', 0, '', '', 0, 0, 0),
(13, 'HIMACHAL PRADESH', 0, '', '', 0, 0, 0),
(14, 'HARYANA', 0, '', '', 0, 0, 0),
(15, 'JAMMU AND KASHMIR', 0, '', '', 0, 0, 0),
(16, 'JHARKHAND', 0, '', '', 0, 0, 0),
(17, 'KERALA', 0, '', '', 0, 0, 0),
(18, 'KARNATAKA', 0, '', '', 0, 0, 0),
(19, 'LAKSHADWEEP', 0, '', '', 0, 0, 0),
(20, 'MEGHALAYA', 0, '', '', 0, 0, 0),
(21, 'MAHARASHTRA', 0, '', '', 0, 0, 0),
(22, 'MANIPUR', 0, '', '', 0, 0, 0),
(23, 'MADHYA PRADESH', 0, '', '', 0, 0, 0),
(24, 'MIZORAM', 0, '', '', 0, 0, 0),
(25, 'NAGALAND', 0, '', '', 0, 0, 0),
(26, 'ORISSA', 0, '', '', 0, 0, 0),
(27, 'PUNJAB', 0, '', '', 0, 0, 0),
(28, 'PONDICHERRY', 0, '', '', 0, 0, 0),
(29, 'RAJASTHAN', 0, '', '', 0, 0, 0),
(30, 'SIKKIM', 0, '', '', 0, 0, 0),
(31, 'TAMIL NADU', 0, '', '', 0, 0, 0),
(32, 'TRIPURA', 0, '', '', 0, 0, 0),
(33, 'UTTARAKHAND', 0, '', '', 0, 0, 0),
(34, 'UTTAR PRADESH', 0, '', '', 0, 0, 0),
(35, 'WEST BENGAL', 0, '', '', 0, 0, 0),
(36, 'TELANGANA', 0, '', '', 0, 0, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `apis`
--
ALTER TABLE `apis`
  ADD PRIMARY KEY (`api_id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`country_id`);

--
-- Indexes for table `districts`
--
ALTER TABLE `districts`
  ADD PRIMARY KEY (`district_id`);

--
-- Indexes for table `field_data`
--
ALTER TABLE `field_data`
  ADD PRIMARY KEY (`field_data_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`notification_id`);

--
-- Indexes for table `organisations`
--
ALTER TABLE `organisations`
  ADD UNIQUE KEY `OrgId` (`organisation_id`);

--
-- Indexes for table `organisation_roles`
--
ALTER TABLE `organisation_roles`
  ADD PRIMARY KEY (`organisation_role_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`role_Id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`staff_id`),
  ADD UNIQUE KEY `staff_username` (`staff_username`),
  ADD KEY `OrgId` (`staff_organisation_id`);

--
-- Indexes for table `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`state_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `apis`
--
ALTER TABLE `apis`
  MODIFY `api_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `country_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=247;

--
-- AUTO_INCREMENT for table `districts`
--
ALTER TABLE `districts`
  MODIFY `district_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `field_data`
--
ALTER TABLE `field_data`
  MODIFY `field_data_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `notification_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `organisations`
--
ALTER TABLE `organisations`
  MODIFY `organisation_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `organisation_roles`
--
ALTER TABLE `organisation_roles`
  MODIFY `organisation_role_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `role_Id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `staff_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `states`
--
ALTER TABLE `states`
  MODIFY `state_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `staff`
--
ALTER TABLE `staff`
  ADD CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`staff_organisation_id`) REFERENCES `organisations` (`organisation_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

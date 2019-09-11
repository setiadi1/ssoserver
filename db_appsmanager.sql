-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.6-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             10.2.0.5683
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for db_appsmanager
CREATE DATABASE IF NOT EXISTS `db_appsmanager` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `db_appsmanager`;

-- Dumping structure for table db_appsmanager.as_comments
CREATE TABLE IF NOT EXISTS `as_comments` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `posted_by` int(11) NOT NULL,
  `posted_by_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `comment` text COLLATE utf8_unicode_ci NOT NULL,
  `post_time` datetime NOT NULL,
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table db_appsmanager.as_comments: ~0 rows (approximately)
DELETE FROM `as_comments`;
/*!40000 ALTER TABLE `as_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `as_comments` ENABLE KEYS */;

-- Dumping structure for table db_appsmanager.as_login_attempts
CREATE TABLE IF NOT EXISTS `as_login_attempts` (
  `id_login_attempts` int(11) NOT NULL AUTO_INCREMENT,
  `ip_addr` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `attempt_number` int(11) NOT NULL DEFAULT 1,
  `date` date NOT NULL,
  PRIMARY KEY (`id_login_attempts`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table db_appsmanager.as_login_attempts: ~0 rows (approximately)
DELETE FROM `as_login_attempts`;
/*!40000 ALTER TABLE `as_login_attempts` DISABLE KEYS */;
INSERT INTO `as_login_attempts` (`id_login_attempts`, `ip_addr`, `attempt_number`, `date`) VALUES
	(1, '::1', 2, '2019-09-04');
/*!40000 ALTER TABLE `as_login_attempts` ENABLE KEYS */;

-- Dumping structure for table db_appsmanager.as_social_logins
CREATE TABLE IF NOT EXISTS `as_social_logins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `provider` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'email',
  `provider_id` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table db_appsmanager.as_social_logins: ~0 rows (approximately)
DELETE FROM `as_social_logins`;
/*!40000 ALTER TABLE `as_social_logins` DISABLE KEYS */;
/*!40000 ALTER TABLE `as_social_logins` ENABLE KEYS */;

-- Dumping structure for table db_appsmanager.as_users
CREATE TABLE IF NOT EXISTS `as_users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `confirmation_key` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `confirmed` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `password_reset_key` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `password_reset_confirmed` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `password_reset_timestamp` datetime DEFAULT NULL,
  `register_date` date NOT NULL,
  `user_role` int(4) NOT NULL DEFAULT 1,
  `last_login` datetime DEFAULT NULL,
  `banned` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table db_appsmanager.as_users: ~3 rows (approximately)
DELETE FROM `as_users`;
/*!40000 ALTER TABLE `as_users` DISABLE KEYS */;
INSERT INTO `as_users` (`user_id`, `email`, `username`, `password`, `confirmation_key`, `confirmed`, `password_reset_key`, `password_reset_confirmed`, `password_reset_timestamp`, `register_date`, `user_role`, `last_login`, `banned`) VALUES
	(1, 'admin@localhost', 'admin', '$2a$13$7cHKorDQoW6rlMocJowFLOmzvu7rQBUNRmRZbtt81NIWFPXVasO9u', '', 'Y', '', 'N', NULL, '2019-09-04', 3, '2019-09-11 00:46:32', 'N'),
	(8, 'edu.setiadi.my@gmail.com', 'yadi', '$2a$13$7cHKorDQoW6rlMocJowFLOmzvu7rQBUNRmRZbtt81NIWFPXVasO9u', '', 'Y', '', 'N', NULL, '2019-09-06', 1, '2019-09-06 02:17:45', 'Y'),
	(9, 'hanif@gmail.com', 'hanif', '$2a$13$7cHKorDQoW6rlMocJowFLOmzvu7rQBUNRmRZbtt81NIWFPXVasO9u', '', 'Y', '', 'N', NULL, '2019-09-10', 1, NULL, 'N');
/*!40000 ALTER TABLE `as_users` ENABLE KEYS */;

-- Dumping structure for table db_appsmanager.as_user_apps
CREATE TABLE IF NOT EXISTS `as_user_apps` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_id` int(11) DEFAULT NULL,
  `app_info` varchar(50) DEFAULT NULL,
  `secret` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table db_appsmanager.as_user_apps: ~2 rows (approximately)
DELETE FROM `as_user_apps`;
/*!40000 ALTER TABLE `as_user_apps` DISABLE KEYS */;
INSERT INTO `as_user_apps` (`id`, `app_id`, `app_info`, `secret`) VALUES
	(1, 1, 'Ceisa Impor', '8iwzik1bwd'),
	(2, 2, 'Ceisa Ekspor', '7pypoox2pc');
/*!40000 ALTER TABLE `as_user_apps` ENABLE KEYS */;

-- Dumping structure for table db_appsmanager.as_user_details
CREATE TABLE IF NOT EXISTS `as_user_details` (
  `id_user_details` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `first_name` varchar(35) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `last_name` varchar(35) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `phone` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id_user_details`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table db_appsmanager.as_user_details: ~2 rows (approximately)
DELETE FROM `as_user_details`;
/*!40000 ALTER TABLE `as_user_details` DISABLE KEYS */;
INSERT INTO `as_user_details` (`id_user_details`, `user_id`, `first_name`, `last_name`, `phone`, `address`) VALUES
	(1, 1, 'Setiadi', '', '', ''),
	(8, 8, 'Setiadi', 'H.', '081213915089', 'Jakarta'),
	(9, 9, 'Hanif', 'Wicaksana', '12314343', 'Jakarta');
/*!40000 ALTER TABLE `as_user_details` ENABLE KEYS */;

-- Dumping structure for table db_appsmanager.as_user_permissions
CREATE TABLE IF NOT EXISTS `as_user_permissions` (
  `permission_id` int(11) NOT NULL AUTO_INCREMENT,
  `permission` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table db_appsmanager.as_user_permissions: ~0 rows (approximately)
DELETE FROM `as_user_permissions`;
/*!40000 ALTER TABLE `as_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `as_user_permissions` ENABLE KEYS */;

-- Dumping structure for table db_appsmanager.as_user_roles
CREATE TABLE IF NOT EXISTS `as_user_roles` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table db_appsmanager.as_user_roles: ~6 rows (approximately)
DELETE FROM `as_user_roles`;
/*!40000 ALTER TABLE `as_user_roles` DISABLE KEYS */;
INSERT INTO `as_user_roles` (`role_id`, `role`) VALUES
	(1, 'user'),
	(2, 'editor'),
	(3, 'admin'),
	(4, 'pegawai'),
	(5, 'kasi'),
	(6, 'kabid');
/*!40000 ALTER TABLE `as_user_roles` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

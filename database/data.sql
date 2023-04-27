-- --------------------------------------------------------
-- Hôte:                         172.16.47.242
-- Version du serveur:           10.5.18-MariaDB-0+deb11u1 - Debian 11
-- SE du serveur:                debian-linux-gnu
-- HeidiSQL Version:             12.4.0.6659
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Listage de la structure de la base pour data
DROP DATABASE IF EXISTS `data`;
CREATE DATABASE IF NOT EXISTS `data` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `data`;

-- Listage de la structure de la table data. axis
DROP TABLE IF EXISTS `axis`;
CREATE TABLE IF NOT EXISTS `axis` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table data.axis : ~3 rows (environ)
REPLACE INTO `axis` (`id`, `name`) VALUES
	(1, 'Compétences'),
	(2, 'Numérique'),
	(3, 'Réactivité');

-- Listage de la structure de la table data. company
DROP TABLE IF EXISTS `company`;
CREATE TABLE IF NOT EXISTS `company` (
  `id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table data.company : ~0 rows (environ)

-- Listage de la structure de la table data. diagnostic
DROP TABLE IF EXISTS `diagnostic`;
CREATE TABLE IF NOT EXISTS `diagnostic` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `company_id` (`company_id`),
  CONSTRAINT `company_id_fk` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table data.diagnostic : ~0 rows (environ)

-- Listage de la structure de la table data. directus_activity
DROP TABLE IF EXISTS `directus_activity`;
CREATE TABLE IF NOT EXISTS `directus_activity` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `action` varchar(45) NOT NULL,
  `user` char(36) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `ip` varchar(50) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `collection` varchar(64) NOT NULL,
  `item` varchar(255) NOT NULL,
  `comment` text DEFAULT NULL,
  `origin` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `directus_activity_collection_foreign` (`collection`)
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table data.directus_activity : ~41 rows (environ)
REPLACE INTO `directus_activity` (`id`, `action`, `user`, `timestamp`, `ip`, `user_agent`, `collection`, `item`, `comment`, `origin`) VALUES
	(1, 'login', 'e46462a8-368a-4b24-a10f-1a1324671eff', '2023-04-26 08:00:45', '172.19.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0', 'directus_users', 'e46462a8-368a-4b24-a10f-1a1324671eff', NULL, 'http://localhost:8055'),
	(4, 'create', 'e46462a8-368a-4b24-a10f-1a1324671eff', '2023-04-26 08:01:40', '172.19.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0', 'directus_collections', 'axis', NULL, 'http://localhost:8055'),
	(7, 'create', 'e46462a8-368a-4b24-a10f-1a1324671eff', '2023-04-26 08:01:55', '172.19.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0', 'directus_collections', 'company', NULL, 'http://localhost:8055'),
	(10, 'create', 'e46462a8-368a-4b24-a10f-1a1324671eff', '2023-04-26 08:02:00', '172.19.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0', 'directus_collections', 'diagnostic', NULL, 'http://localhost:8055'),
	(13, 'create', 'e46462a8-368a-4b24-a10f-1a1324671eff', '2023-04-26 08:02:04', '172.19.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0', 'directus_collections', 'question', NULL, 'http://localhost:8055'),
	(16, 'create', 'e46462a8-368a-4b24-a10f-1a1324671eff', '2023-04-26 08:02:52', '172.19.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0', 'directus_collections', 'response', NULL, 'http://localhost:8055'),
	(19, 'create', 'e46462a8-368a-4b24-a10f-1a1324671eff', '2023-04-26 08:02:56', '172.19.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0', 'directus_collections', 'response_option', NULL, 'http://localhost:8055'),
	(22, 'login', 'e46462a8-368a-4b24-a10f-1a1324671eff', '2023-04-26 08:22:01', '172.19.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0', 'directus_users', 'e46462a8-368a-4b24-a10f-1a1324671eff', NULL, 'http://localhost:8055'),
	(25, 'create', 'e46462a8-368a-4b24-a10f-1a1324671eff', '2023-04-26 08:25:18', '172.20.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0', 'directus_settings', '1', NULL, 'http://localhost:8055'),
	(28, 'create', 'e46462a8-368a-4b24-a10f-1a1324671eff', '2023-04-26 08:26:24', '172.20.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0', 'directus_permissions', '1', NULL, 'http://localhost:8055'),
	(31, 'create', 'e46462a8-368a-4b24-a10f-1a1324671eff', '2023-04-26 08:26:25', '172.20.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0', 'directus_permissions', '4', NULL, 'http://localhost:8055'),
	(34, 'create', 'e46462a8-368a-4b24-a10f-1a1324671eff', '2023-04-26 08:26:27', '172.20.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0', 'directus_permissions', '7', NULL, 'http://localhost:8055'),
	(37, 'create', 'e46462a8-368a-4b24-a10f-1a1324671eff', '2023-04-26 08:26:29', '172.20.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0', 'directus_permissions', '10', NULL, 'http://localhost:8055'),
	(40, 'create', 'e46462a8-368a-4b24-a10f-1a1324671eff', '2023-04-26 08:26:31', '172.20.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0', 'directus_permissions', '13', NULL, 'http://localhost:8055'),
	(43, 'create', 'e46462a8-368a-4b24-a10f-1a1324671eff', '2023-04-26 08:26:34', '172.20.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0', 'directus_permissions', '16', NULL, 'http://localhost:8055'),
	(46, 'create', 'e46462a8-368a-4b24-a10f-1a1324671eff', '2023-04-26 08:26:36', '172.20.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0', 'directus_permissions', '19', NULL, 'http://localhost:8055'),
	(49, 'create', 'e46462a8-368a-4b24-a10f-1a1324671eff', '2023-04-26 08:26:38', '172.20.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0', 'directus_permissions', '22', NULL, 'http://localhost:8055'),
	(52, 'create', 'e46462a8-368a-4b24-a10f-1a1324671eff', '2023-04-26 08:26:40', '172.20.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0', 'directus_permissions', '25', NULL, 'http://localhost:8055'),
	(55, 'create', 'e46462a8-368a-4b24-a10f-1a1324671eff', '2023-04-26 08:27:28', '172.20.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0', 'directus_permissions', '28', NULL, 'http://localhost:8055'),
	(58, 'create', 'e46462a8-368a-4b24-a10f-1a1324671eff', '2023-04-26 08:27:30', '172.20.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0', 'directus_permissions', '31', NULL, 'http://localhost:8055'),
	(61, 'create', 'e46462a8-368a-4b24-a10f-1a1324671eff', '2023-04-26 08:27:32', '172.20.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0', 'directus_permissions', '34', NULL, 'http://localhost:8055'),
	(64, 'create', 'e46462a8-368a-4b24-a10f-1a1324671eff', '2023-04-26 08:27:35', '172.20.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0', 'directus_permissions', '37', NULL, 'http://localhost:8055'),
	(67, 'create', 'e46462a8-368a-4b24-a10f-1a1324671eff', '2023-04-26 08:27:37', '172.20.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0', 'directus_permissions', '40', NULL, 'http://localhost:8055'),
	(70, 'create', 'e46462a8-368a-4b24-a10f-1a1324671eff', '2023-04-26 08:27:39', '172.20.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0', 'directus_permissions', '43', NULL, 'http://localhost:8055'),
	(73, 'create', 'e46462a8-368a-4b24-a10f-1a1324671eff', '2023-04-26 08:27:41', '172.20.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0', 'directus_permissions', '46', NULL, 'http://localhost:8055'),
	(76, 'create', 'e46462a8-368a-4b24-a10f-1a1324671eff', '2023-04-26 08:27:43', '172.20.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0', 'directus_permissions', '49', NULL, 'http://localhost:8055'),
	(79, 'create', 'e46462a8-368a-4b24-a10f-1a1324671eff', '2023-04-26 08:27:47', '172.20.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0', 'directus_permissions', '52', NULL, 'http://localhost:8055'),
	(82, 'create', 'e46462a8-368a-4b24-a10f-1a1324671eff', '2023-04-26 08:27:49', '172.20.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0', 'directus_permissions', '55', NULL, 'http://localhost:8055'),
	(85, 'create', 'e46462a8-368a-4b24-a10f-1a1324671eff', '2023-04-26 08:27:54', '172.20.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0', 'directus_permissions', '58', NULL, 'http://localhost:8055'),
	(88, 'create', 'e46462a8-368a-4b24-a10f-1a1324671eff', '2023-04-26 08:27:55', '172.20.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0', 'directus_permissions', '61', NULL, 'http://localhost:8055'),
	(91, 'create', 'e46462a8-368a-4b24-a10f-1a1324671eff', '2023-04-26 08:27:57', '172.20.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0', 'directus_permissions', '64', NULL, 'http://localhost:8055'),
	(94, 'create', 'e46462a8-368a-4b24-a10f-1a1324671eff', '2023-04-26 08:27:59', '172.20.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0', 'directus_permissions', '67', NULL, 'http://localhost:8055'),
	(97, 'create', 'e46462a8-368a-4b24-a10f-1a1324671eff', '2023-04-26 08:28:02', '172.20.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0', 'directus_permissions', '70', NULL, 'http://localhost:8055'),
	(100, 'create', 'e46462a8-368a-4b24-a10f-1a1324671eff', '2023-04-26 08:28:04', '172.20.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0', 'directus_permissions', '73', NULL, 'http://localhost:8055'),
	(103, 'create', 'e46462a8-368a-4b24-a10f-1a1324671eff', '2023-04-26 08:28:07', '172.20.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0', 'directus_permissions', '76', NULL, 'http://localhost:8055'),
	(106, 'create', 'e46462a8-368a-4b24-a10f-1a1324671eff', '2023-04-26 08:28:08', '172.20.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0', 'directus_permissions', '79', NULL, 'http://localhost:8055'),
	(109, 'create', 'e46462a8-368a-4b24-a10f-1a1324671eff', '2023-04-26 08:28:10', '172.20.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0', 'directus_permissions', '82', NULL, 'http://localhost:8055'),
	(112, 'create', 'e46462a8-368a-4b24-a10f-1a1324671eff', '2023-04-26 08:28:12', '172.20.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0', 'directus_permissions', '85', NULL, 'http://localhost:8055'),
	(115, 'create', 'e46462a8-368a-4b24-a10f-1a1324671eff', '2023-04-26 08:28:14', '172.20.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0', 'directus_permissions', '88', NULL, 'http://localhost:8055'),
	(118, 'login', 'e46462a8-368a-4b24-a10f-1a1324671eff', '2023-04-26 09:08:43', '172.20.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0', 'directus_users', 'e46462a8-368a-4b24-a10f-1a1324671eff', NULL, 'http://localhost:8055'),
	(121, 'login', 'e46462a8-368a-4b24-a10f-1a1324671eff', '2023-04-26 14:18:36', '172.20.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0', 'directus_users', 'e46462a8-368a-4b24-a10f-1a1324671eff', NULL, 'http://localhost:8055');

-- Listage de la structure de la table data. directus_collections
DROP TABLE IF EXISTS `directus_collections`;
CREATE TABLE IF NOT EXISTS `directus_collections` (
  `collection` varchar(64) NOT NULL,
  `icon` varchar(30) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `display_template` varchar(255) DEFAULT NULL,
  `hidden` tinyint(1) NOT NULL DEFAULT 0,
  `singleton` tinyint(1) NOT NULL DEFAULT 0,
  `translations` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`translations`)),
  `archive_field` varchar(64) DEFAULT NULL,
  `archive_app_filter` tinyint(1) NOT NULL DEFAULT 1,
  `archive_value` varchar(255) DEFAULT NULL,
  `unarchive_value` varchar(255) DEFAULT NULL,
  `sort_field` varchar(64) DEFAULT NULL,
  `accountability` varchar(255) DEFAULT 'all',
  `color` varchar(255) DEFAULT NULL,
  `item_duplication_fields` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`item_duplication_fields`)),
  `sort` int(11) DEFAULT NULL,
  `group` varchar(64) DEFAULT NULL,
  `collapse` varchar(255) NOT NULL DEFAULT 'open',
  PRIMARY KEY (`collection`),
  KEY `directus_collections_group_foreign` (`group`),
  CONSTRAINT `directus_collections_group_foreign` FOREIGN KEY (`group`) REFERENCES `directus_collections` (`collection`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table data.directus_collections : ~6 rows (environ)
REPLACE INTO `directus_collections` (`collection`, `icon`, `note`, `display_template`, `hidden`, `singleton`, `translations`, `archive_field`, `archive_app_filter`, `archive_value`, `unarchive_value`, `sort_field`, `accountability`, `color`, `item_duplication_fields`, `sort`, `group`, `collapse`) VALUES
	('axis', NULL, NULL, NULL, 0, 0, NULL, NULL, 1, NULL, NULL, NULL, 'all', NULL, NULL, NULL, NULL, 'open'),
	('company', NULL, NULL, NULL, 0, 0, NULL, NULL, 1, NULL, NULL, NULL, 'all', NULL, NULL, NULL, NULL, 'open'),
	('diagnostic', NULL, NULL, NULL, 0, 0, NULL, NULL, 1, NULL, NULL, NULL, 'all', NULL, NULL, NULL, NULL, 'open'),
	('question', NULL, NULL, NULL, 0, 0, NULL, NULL, 1, NULL, NULL, NULL, 'all', NULL, NULL, NULL, NULL, 'open'),
	('response', NULL, NULL, NULL, 0, 0, NULL, NULL, 1, NULL, NULL, NULL, 'all', NULL, NULL, NULL, NULL, 'open'),
	('response_option', NULL, NULL, NULL, 0, 0, NULL, NULL, 1, NULL, NULL, NULL, 'all', NULL, NULL, NULL, NULL, 'open');

-- Listage de la structure de la table data. directus_dashboards
DROP TABLE IF EXISTS `directus_dashboards`;
CREATE TABLE IF NOT EXISTS `directus_dashboards` (
  `id` char(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `icon` varchar(30) NOT NULL DEFAULT 'dashboard',
  `note` text DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_created` char(36) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `directus_dashboards_user_created_foreign` (`user_created`),
  CONSTRAINT `directus_dashboards_user_created_foreign` FOREIGN KEY (`user_created`) REFERENCES `directus_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table data.directus_dashboards : ~0 rows (environ)

-- Listage de la structure de la table data. directus_fields
DROP TABLE IF EXISTS `directus_fields`;
CREATE TABLE IF NOT EXISTS `directus_fields` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `collection` varchar(64) NOT NULL,
  `field` varchar(64) NOT NULL,
  `special` varchar(64) DEFAULT NULL,
  `interface` varchar(64) DEFAULT NULL,
  `options` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`options`)),
  `display` varchar(64) DEFAULT NULL,
  `display_options` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`display_options`)),
  `readonly` tinyint(1) NOT NULL DEFAULT 0,
  `hidden` tinyint(1) NOT NULL DEFAULT 0,
  `sort` int(10) unsigned DEFAULT NULL,
  `width` varchar(30) DEFAULT 'full',
  `translations` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`translations`)),
  `note` text DEFAULT NULL,
  `conditions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`conditions`)),
  `required` tinyint(1) DEFAULT 0,
  `group` varchar(64) DEFAULT NULL,
  `validation` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`validation`)),
  `validation_message` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `directus_fields_collection_foreign` (`collection`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table data.directus_fields : ~0 rows (environ)

-- Listage de la structure de la table data. directus_files
DROP TABLE IF EXISTS `directus_files`;
CREATE TABLE IF NOT EXISTS `directus_files` (
  `id` char(36) NOT NULL,
  `storage` varchar(255) NOT NULL,
  `filename_disk` varchar(255) DEFAULT NULL,
  `filename_download` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `folder` char(36) DEFAULT NULL,
  `uploaded_by` char(36) DEFAULT NULL,
  `uploaded_on` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_by` char(36) DEFAULT NULL,
  `modified_on` timestamp NOT NULL DEFAULT current_timestamp(),
  `charset` varchar(50) DEFAULT NULL,
  `filesize` bigint(20) DEFAULT NULL,
  `width` int(10) unsigned DEFAULT NULL,
  `height` int(10) unsigned DEFAULT NULL,
  `duration` int(10) unsigned DEFAULT NULL,
  `embed` varchar(200) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `location` text DEFAULT NULL,
  `tags` text DEFAULT NULL,
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`metadata`)),
  PRIMARY KEY (`id`),
  KEY `directus_files_uploaded_by_foreign` (`uploaded_by`),
  KEY `directus_files_modified_by_foreign` (`modified_by`),
  KEY `directus_files_folder_foreign` (`folder`),
  CONSTRAINT `directus_files_folder_foreign` FOREIGN KEY (`folder`) REFERENCES `directus_folders` (`id`) ON DELETE SET NULL,
  CONSTRAINT `directus_files_modified_by_foreign` FOREIGN KEY (`modified_by`) REFERENCES `directus_users` (`id`),
  CONSTRAINT `directus_files_uploaded_by_foreign` FOREIGN KEY (`uploaded_by`) REFERENCES `directus_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table data.directus_files : ~0 rows (environ)

-- Listage de la structure de la table data. directus_flows
DROP TABLE IF EXISTS `directus_flows`;
CREATE TABLE IF NOT EXISTS `directus_flows` (
  `id` char(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `icon` varchar(30) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'active',
  `trigger` varchar(255) DEFAULT NULL,
  `accountability` varchar(255) DEFAULT 'all',
  `options` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`options`)),
  `operation` char(36) DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_created` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `directus_flows_operation_unique` (`operation`),
  KEY `directus_flows_user_created_foreign` (`user_created`),
  CONSTRAINT `directus_flows_user_created_foreign` FOREIGN KEY (`user_created`) REFERENCES `directus_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table data.directus_flows : ~0 rows (environ)

-- Listage de la structure de la table data. directus_folders
DROP TABLE IF EXISTS `directus_folders`;
CREATE TABLE IF NOT EXISTS `directus_folders` (
  `id` char(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `parent` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `directus_folders_parent_foreign` (`parent`),
  CONSTRAINT `directus_folders_parent_foreign` FOREIGN KEY (`parent`) REFERENCES `directus_folders` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table data.directus_folders : ~0 rows (environ)

-- Listage de la structure de la table data. directus_migrations
DROP TABLE IF EXISTS `directus_migrations`;
CREATE TABLE IF NOT EXISTS `directus_migrations` (
  `version` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table data.directus_migrations : ~63 rows (environ)
REPLACE INTO `directus_migrations` (`version`, `name`, `timestamp`) VALUES
	('20201028A', 'Remove Collection Foreign Keys', '2023-04-26 09:59:54'),
	('20201029A', 'Remove System Relations', '2023-04-26 09:59:54'),
	('20201029B', 'Remove System Collections', '2023-04-26 09:59:54'),
	('20201029C', 'Remove System Fields', '2023-04-26 09:59:54'),
	('20201105A', 'Add Cascade System Relations', '2023-04-26 09:59:57'),
	('20201105B', 'Change Webhook URL Type', '2023-04-26 09:59:57'),
	('20210225A', 'Add Relations Sort Field', '2023-04-26 09:59:57'),
	('20210304A', 'Remove Locked Fields', '2023-04-26 09:59:57'),
	('20210312A', 'Webhooks Collections Text', '2023-04-26 09:59:57'),
	('20210331A', 'Add Refresh Interval', '2023-04-26 09:59:57'),
	('20210415A', 'Make Filesize Nullable', '2023-04-26 09:59:58'),
	('20210416A', 'Add Collections Accountability', '2023-04-26 09:59:58'),
	('20210422A', 'Remove Files Interface', '2023-04-26 09:59:58'),
	('20210506A', 'Rename Interfaces', '2023-04-26 09:59:59'),
	('20210510A', 'Restructure Relations', '2023-04-26 10:00:00'),
	('20210518A', 'Add Foreign Key Constraints', '2023-04-26 10:00:00'),
	('20210519A', 'Add System Fk Triggers', '2023-04-26 10:00:02'),
	('20210521A', 'Add Collections Icon Color', '2023-04-26 10:00:02'),
	('20210525A', 'Add Insights', '2023-04-26 10:00:02'),
	('20210608A', 'Add Deep Clone Config', '2023-04-26 10:00:02'),
	('20210626A', 'Change Filesize Bigint', '2023-04-26 10:00:02'),
	('20210716A', 'Add Conditions to Fields', '2023-04-26 10:00:03'),
	('20210721A', 'Add Default Folder', '2023-04-26 10:00:03'),
	('20210802A', 'Replace Groups', '2023-04-26 10:00:03'),
	('20210803A', 'Add Required to Fields', '2023-04-26 10:00:03'),
	('20210805A', 'Update Groups', '2023-04-26 10:00:03'),
	('20210805B', 'Change Image Metadata Structure', '2023-04-26 10:00:03'),
	('20210811A', 'Add Geometry Config', '2023-04-26 10:00:03'),
	('20210831A', 'Remove Limit Column', '2023-04-26 10:00:03'),
	('20210903A', 'Add Auth Provider', '2023-04-26 10:00:04'),
	('20210907A', 'Webhooks Collections Not Null', '2023-04-26 10:00:04'),
	('20210910A', 'Move Module Setup', '2023-04-26 10:00:04'),
	('20210920A', 'Webhooks URL Not Null', '2023-04-26 10:00:04'),
	('20210924A', 'Add Collection Organization', '2023-04-26 10:00:04'),
	('20210927A', 'Replace Fields Group', '2023-04-26 10:00:05'),
	('20210927B', 'Replace M2M Interface', '2023-04-26 10:00:05'),
	('20210929A', 'Rename Login Action', '2023-04-26 10:00:05'),
	('20211007A', 'Update Presets', '2023-04-26 10:00:05'),
	('20211009A', 'Add Auth Data', '2023-04-26 10:00:05'),
	('20211016A', 'Add Webhook Headers', '2023-04-26 10:00:05'),
	('20211103A', 'Set Unique to User Token', '2023-04-26 10:00:05'),
	('20211103B', 'Update Special Geometry', '2023-04-26 10:00:05'),
	('20211104A', 'Remove Collections Listing', '2023-04-26 10:00:06'),
	('20211118A', 'Add Notifications', '2023-04-26 10:00:06'),
	('20211211A', 'Add Shares', '2023-04-26 10:00:07'),
	('20211230A', 'Add Project Descriptor', '2023-04-26 10:00:07'),
	('20220303A', 'Remove Default Project Color', '2023-04-26 10:00:07'),
	('20220308A', 'Add Bookmark Icon and Color', '2023-04-26 10:00:08'),
	('20220314A', 'Add Translation Strings', '2023-04-26 10:00:08'),
	('20220322A', 'Rename Field Typecast Flags', '2023-04-26 10:00:08'),
	('20220323A', 'Add Field Validation', '2023-04-26 10:00:08'),
	('20220325A', 'Fix Typecast Flags', '2023-04-26 10:00:08'),
	('20220325B', 'Add Default Language', '2023-04-26 10:00:08'),
	('20220402A', 'Remove Default Value Panel Icon', '2023-04-26 10:00:08'),
	('20220429A', 'Add Flows', '2023-04-26 10:00:09'),
	('20220429B', 'Add Color to Insights Icon', '2023-04-26 10:00:10'),
	('20220429C', 'Drop Non Null From IP of Activity', '2023-04-26 10:00:10'),
	('20220429D', 'Drop Non Null From Sender of Notifications', '2023-04-26 10:00:10'),
	('20220614A', 'Rename Hook Trigger to Event', '2023-04-26 10:00:10'),
	('20220801A', 'Update Notifications Timestamp Column', '2023-04-26 10:00:10'),
	('20220802A', 'Add Custom Aspect Ratios', '2023-04-26 10:00:10'),
	('20220826A', 'Add Origin to Accountability', '2023-04-26 10:00:10'),
	('20230401A', 'Update Material Icons', '2023-04-26 10:00:11');

-- Listage de la structure de la table data. directus_notifications
DROP TABLE IF EXISTS `directus_notifications`;
CREATE TABLE IF NOT EXISTS `directus_notifications` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `timestamp` timestamp NULL DEFAULT current_timestamp(),
  `status` varchar(255) DEFAULT 'inbox',
  `recipient` char(36) NOT NULL,
  `sender` char(36) DEFAULT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text DEFAULT NULL,
  `collection` varchar(64) DEFAULT NULL,
  `item` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `directus_notifications_recipient_foreign` (`recipient`),
  KEY `directus_notifications_sender_foreign` (`sender`),
  CONSTRAINT `directus_notifications_recipient_foreign` FOREIGN KEY (`recipient`) REFERENCES `directus_users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `directus_notifications_sender_foreign` FOREIGN KEY (`sender`) REFERENCES `directus_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table data.directus_notifications : ~0 rows (environ)

-- Listage de la structure de la table data. directus_operations
DROP TABLE IF EXISTS `directus_operations`;
CREATE TABLE IF NOT EXISTS `directus_operations` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `key` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `position_x` int(11) NOT NULL,
  `position_y` int(11) NOT NULL,
  `options` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`options`)),
  `resolve` char(36) DEFAULT NULL,
  `reject` char(36) DEFAULT NULL,
  `flow` char(36) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_created` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `directus_operations_resolve_unique` (`resolve`),
  UNIQUE KEY `directus_operations_reject_unique` (`reject`),
  KEY `directus_operations_flow_foreign` (`flow`),
  KEY `directus_operations_user_created_foreign` (`user_created`),
  CONSTRAINT `directus_operations_flow_foreign` FOREIGN KEY (`flow`) REFERENCES `directus_flows` (`id`) ON DELETE CASCADE,
  CONSTRAINT `directus_operations_reject_foreign` FOREIGN KEY (`reject`) REFERENCES `directus_operations` (`id`),
  CONSTRAINT `directus_operations_resolve_foreign` FOREIGN KEY (`resolve`) REFERENCES `directus_operations` (`id`),
  CONSTRAINT `directus_operations_user_created_foreign` FOREIGN KEY (`user_created`) REFERENCES `directus_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table data.directus_operations : ~0 rows (environ)

-- Listage de la structure de la table data. directus_panels
DROP TABLE IF EXISTS `directus_panels`;
CREATE TABLE IF NOT EXISTS `directus_panels` (
  `id` char(36) NOT NULL,
  `dashboard` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `icon` varchar(30) DEFAULT NULL,
  `color` varchar(10) DEFAULT NULL,
  `show_header` tinyint(1) NOT NULL DEFAULT 0,
  `note` text DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `position_x` int(11) NOT NULL,
  `position_y` int(11) NOT NULL,
  `width` int(11) NOT NULL,
  `height` int(11) NOT NULL,
  `options` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`options`)),
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_created` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `directus_panels_dashboard_foreign` (`dashboard`),
  KEY `directus_panels_user_created_foreign` (`user_created`),
  CONSTRAINT `directus_panels_dashboard_foreign` FOREIGN KEY (`dashboard`) REFERENCES `directus_dashboards` (`id`) ON DELETE CASCADE,
  CONSTRAINT `directus_panels_user_created_foreign` FOREIGN KEY (`user_created`) REFERENCES `directus_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table data.directus_panels : ~0 rows (environ)

-- Listage de la structure de la table data. directus_permissions
DROP TABLE IF EXISTS `directus_permissions`;
CREATE TABLE IF NOT EXISTS `directus_permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role` char(36) DEFAULT NULL,
  `collection` varchar(64) NOT NULL,
  `action` varchar(10) NOT NULL,
  `permissions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`permissions`)),
  `validation` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`validation`)),
  `presets` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`presets`)),
  `fields` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `directus_permissions_collection_foreign` (`collection`),
  KEY `directus_permissions_role_foreign` (`role`),
  CONSTRAINT `directus_permissions_role_foreign` FOREIGN KEY (`role`) REFERENCES `directus_roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table data.directus_permissions : ~30 rows (environ)
REPLACE INTO `directus_permissions` (`id`, `role`, `collection`, `action`, `permissions`, `validation`, `presets`, `fields`) VALUES
	(1, NULL, 'axis', 'create', '{}', '{}', NULL, '*'),
	(4, NULL, 'axis', 'read', '{}', '{}', NULL, '*'),
	(7, NULL, 'axis', 'update', '{}', '{}', NULL, '*'),
	(10, NULL, 'axis', 'delete', '{}', '{}', NULL, '*'),
	(13, NULL, 'axis', 'share', '{}', '{}', NULL, '*'),
	(16, NULL, 'company', 'create', '{}', '{}', NULL, '*'),
	(19, NULL, 'company', 'read', '{}', '{}', NULL, '*'),
	(22, NULL, 'company', 'update', '{}', '{}', NULL, '*'),
	(25, NULL, 'company', 'delete', '{}', '{}', NULL, '*'),
	(28, NULL, 'company', 'share', '{}', '{}', NULL, '*'),
	(31, NULL, 'diagnostic', 'create', '{}', '{}', NULL, '*'),
	(34, NULL, 'diagnostic', 'read', '{}', '{}', NULL, '*'),
	(37, NULL, 'diagnostic', 'update', '{}', '{}', NULL, '*'),
	(40, NULL, 'diagnostic', 'delete', '{}', '{}', NULL, '*'),
	(43, NULL, 'diagnostic', 'share', '{}', '{}', NULL, '*'),
	(46, NULL, 'question', 'create', '{}', '{}', NULL, '*'),
	(49, NULL, 'question', 'read', '{}', '{}', NULL, '*'),
	(52, NULL, 'question', 'delete', '{}', '{}', NULL, '*'),
	(55, NULL, 'question', 'share', '{}', '{}', NULL, '*'),
	(58, NULL, 'question', 'update', '{}', '{}', NULL, '*'),
	(61, NULL, 'response', 'create', '{}', '{}', NULL, '*'),
	(64, NULL, 'response', 'read', '{}', '{}', NULL, '*'),
	(67, NULL, 'response', 'update', '{}', '{}', NULL, '*'),
	(70, NULL, 'response', 'delete', '{}', '{}', NULL, '*'),
	(73, NULL, 'response', 'share', '{}', '{}', NULL, '*'),
	(76, NULL, 'response_option', 'create', '{}', '{}', NULL, '*'),
	(79, NULL, 'response_option', 'read', '{}', '{}', NULL, '*'),
	(82, NULL, 'response_option', 'update', '{}', '{}', NULL, '*'),
	(85, NULL, 'response_option', 'delete', '{}', '{}', NULL, '*'),
	(88, NULL, 'response_option', 'share', '{}', '{}', NULL, '*');

-- Listage de la structure de la table data. directus_presets
DROP TABLE IF EXISTS `directus_presets`;
CREATE TABLE IF NOT EXISTS `directus_presets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bookmark` varchar(255) DEFAULT NULL,
  `user` char(36) DEFAULT NULL,
  `role` char(36) DEFAULT NULL,
  `collection` varchar(64) DEFAULT NULL,
  `search` varchar(100) DEFAULT NULL,
  `layout` varchar(100) DEFAULT 'tabular',
  `layout_query` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`layout_query`)),
  `layout_options` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`layout_options`)),
  `refresh_interval` int(11) DEFAULT NULL,
  `filter` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`filter`)),
  `icon` varchar(30) DEFAULT 'bookmark',
  `color` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `directus_presets_collection_foreign` (`collection`),
  KEY `directus_presets_user_foreign` (`user`),
  KEY `directus_presets_role_foreign` (`role`),
  CONSTRAINT `directus_presets_role_foreign` FOREIGN KEY (`role`) REFERENCES `directus_roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `directus_presets_user_foreign` FOREIGN KEY (`user`) REFERENCES `directus_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table data.directus_presets : ~1 rows (environ)
REPLACE INTO `directus_presets` (`id`, `bookmark`, `user`, `role`, `collection`, `search`, `layout`, `layout_query`, `layout_options`, `refresh_interval`, `filter`, `icon`, `color`) VALUES
	(1, NULL, 'e46462a8-368a-4b24-a10f-1a1324671eff', NULL, 'question', NULL, NULL, '{"tabular":{"limit":100,"page":1,"fields":["id","axis_id","question"]}}', '{"tabular":{"widths":{"id":99,"axis_id":106,"question":854}}}', NULL, NULL, 'bookmark', NULL);

-- Listage de la structure de la table data. directus_relations
DROP TABLE IF EXISTS `directus_relations`;
CREATE TABLE IF NOT EXISTS `directus_relations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `many_collection` varchar(64) NOT NULL,
  `many_field` varchar(64) NOT NULL,
  `one_collection` varchar(64) DEFAULT NULL,
  `one_field` varchar(64) DEFAULT NULL,
  `one_collection_field` varchar(64) DEFAULT NULL,
  `one_allowed_collections` text DEFAULT NULL,
  `junction_field` varchar(64) DEFAULT NULL,
  `sort_field` varchar(64) DEFAULT NULL,
  `one_deselect_action` varchar(255) NOT NULL DEFAULT 'nullify',
  PRIMARY KEY (`id`),
  KEY `directus_relations_many_collection_foreign` (`many_collection`),
  KEY `directus_relations_one_collection_foreign` (`one_collection`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table data.directus_relations : ~0 rows (environ)

-- Listage de la structure de la table data. directus_revisions
DROP TABLE IF EXISTS `directus_revisions`;
CREATE TABLE IF NOT EXISTS `directus_revisions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `activity` int(10) unsigned NOT NULL,
  `collection` varchar(64) NOT NULL,
  `item` varchar(255) NOT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`data`)),
  `delta` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`delta`)),
  `parent` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `directus_revisions_collection_foreign` (`collection`),
  KEY `directus_revisions_parent_foreign` (`parent`),
  KEY `directus_revisions_activity_foreign` (`activity`),
  CONSTRAINT `directus_revisions_activity_foreign` FOREIGN KEY (`activity`) REFERENCES `directus_activity` (`id`) ON DELETE CASCADE,
  CONSTRAINT `directus_revisions_parent_foreign` FOREIGN KEY (`parent`) REFERENCES `directus_revisions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table data.directus_revisions : ~37 rows (environ)
REPLACE INTO `directus_revisions` (`id`, `activity`, `collection`, `item`, `data`, `delta`, `parent`) VALUES
	(1, 4, 'directus_collections', 'axis', '{"collection":"axis"}', '{"collection":"axis"}', NULL),
	(4, 7, 'directus_collections', 'company', '{"collection":"company"}', '{"collection":"company"}', NULL),
	(7, 10, 'directus_collections', 'diagnostic', '{"collection":"diagnostic"}', '{"collection":"diagnostic"}', NULL),
	(10, 13, 'directus_collections', 'question', '{"collection":"question"}', '{"collection":"question"}', NULL),
	(13, 16, 'directus_collections', 'response', '{"collection":"response"}', '{"collection":"response"}', NULL),
	(16, 19, 'directus_collections', 'response_option', '{"collection":"response_option"}', '{"collection":"response_option"}', NULL),
	(19, 25, 'directus_settings', '1', '{"module_bar":[{"type":"module","id":"content","enabled":true},{"type":"module","id":"users","enabled":true},{"type":"module","id":"files","enabled":true},{"type":"module","id":"insights","enabled":true},{"type":"link","id":"docs","name":"$t:documentation","url":"https://docs.directus.io","icon":"help","enabled":true},{"type":"module","id":"settings","enabled":true,"locked":true},{"type":"module","id":"api-viewer","enabled":true}]}', '{"module_bar":[{"type":"module","id":"content","enabled":true},{"type":"module","id":"users","enabled":true},{"type":"module","id":"files","enabled":true},{"type":"module","id":"insights","enabled":true},{"type":"link","id":"docs","name":"$t:documentation","url":"https://docs.directus.io","icon":"help","enabled":true},{"type":"module","id":"settings","enabled":true,"locked":true},{"type":"module","id":"api-viewer","enabled":true}]}', NULL),
	(22, 28, 'directus_permissions', '1', '{"role":null,"collection":"axis","action":"create","fields":["*"],"permissions":{},"validation":{}}', '{"role":null,"collection":"axis","action":"create","fields":["*"],"permissions":{},"validation":{}}', NULL),
	(25, 31, 'directus_permissions', '4', '{"role":null,"collection":"axis","action":"read","fields":["*"],"permissions":{},"validation":{}}', '{"role":null,"collection":"axis","action":"read","fields":["*"],"permissions":{},"validation":{}}', NULL),
	(28, 34, 'directus_permissions', '7', '{"role":null,"collection":"axis","action":"update","fields":["*"],"permissions":{},"validation":{}}', '{"role":null,"collection":"axis","action":"update","fields":["*"],"permissions":{},"validation":{}}', NULL),
	(31, 37, 'directus_permissions', '10', '{"role":null,"collection":"axis","action":"delete","fields":["*"],"permissions":{},"validation":{}}', '{"role":null,"collection":"axis","action":"delete","fields":["*"],"permissions":{},"validation":{}}', NULL),
	(34, 40, 'directus_permissions', '13', '{"role":null,"collection":"axis","action":"share","fields":["*"],"permissions":{},"validation":{}}', '{"role":null,"collection":"axis","action":"share","fields":["*"],"permissions":{},"validation":{}}', NULL),
	(37, 43, 'directus_permissions', '16', '{"role":null,"collection":"company","action":"create","fields":["*"],"permissions":{},"validation":{}}', '{"role":null,"collection":"company","action":"create","fields":["*"],"permissions":{},"validation":{}}', NULL),
	(40, 46, 'directus_permissions', '19', '{"role":null,"collection":"company","action":"read","fields":["*"],"permissions":{},"validation":{}}', '{"role":null,"collection":"company","action":"read","fields":["*"],"permissions":{},"validation":{}}', NULL),
	(43, 49, 'directus_permissions', '22', '{"role":null,"collection":"company","action":"update","fields":["*"],"permissions":{},"validation":{}}', '{"role":null,"collection":"company","action":"update","fields":["*"],"permissions":{},"validation":{}}', NULL),
	(46, 52, 'directus_permissions', '25', '{"role":null,"collection":"company","action":"delete","fields":["*"],"permissions":{},"validation":{}}', '{"role":null,"collection":"company","action":"delete","fields":["*"],"permissions":{},"validation":{}}', NULL),
	(49, 55, 'directus_permissions', '28', '{"role":null,"collection":"company","action":"share","fields":["*"],"permissions":{},"validation":{}}', '{"role":null,"collection":"company","action":"share","fields":["*"],"permissions":{},"validation":{}}', NULL),
	(52, 58, 'directus_permissions', '31', '{"role":null,"collection":"diagnostic","action":"create","fields":["*"],"permissions":{},"validation":{}}', '{"role":null,"collection":"diagnostic","action":"create","fields":["*"],"permissions":{},"validation":{}}', NULL),
	(55, 61, 'directus_permissions', '34', '{"role":null,"collection":"diagnostic","action":"read","fields":["*"],"permissions":{},"validation":{}}', '{"role":null,"collection":"diagnostic","action":"read","fields":["*"],"permissions":{},"validation":{}}', NULL),
	(58, 64, 'directus_permissions', '37', '{"role":null,"collection":"diagnostic","action":"update","fields":["*"],"permissions":{},"validation":{}}', '{"role":null,"collection":"diagnostic","action":"update","fields":["*"],"permissions":{},"validation":{}}', NULL),
	(61, 67, 'directus_permissions', '40', '{"role":null,"collection":"diagnostic","action":"delete","fields":["*"],"permissions":{},"validation":{}}', '{"role":null,"collection":"diagnostic","action":"delete","fields":["*"],"permissions":{},"validation":{}}', NULL),
	(64, 70, 'directus_permissions', '43', '{"role":null,"collection":"diagnostic","action":"share","fields":["*"],"permissions":{},"validation":{}}', '{"role":null,"collection":"diagnostic","action":"share","fields":["*"],"permissions":{},"validation":{}}', NULL),
	(67, 73, 'directus_permissions', '46', '{"role":null,"collection":"question","action":"create","fields":["*"],"permissions":{},"validation":{}}', '{"role":null,"collection":"question","action":"create","fields":["*"],"permissions":{},"validation":{}}', NULL),
	(70, 76, 'directus_permissions', '49', '{"role":null,"collection":"question","action":"read","fields":["*"],"permissions":{},"validation":{}}', '{"role":null,"collection":"question","action":"read","fields":["*"],"permissions":{},"validation":{}}', NULL),
	(73, 79, 'directus_permissions', '52', '{"role":null,"collection":"question","action":"delete","fields":["*"],"permissions":{},"validation":{}}', '{"role":null,"collection":"question","action":"delete","fields":["*"],"permissions":{},"validation":{}}', NULL),
	(76, 82, 'directus_permissions', '55', '{"role":null,"collection":"question","action":"share","fields":["*"],"permissions":{},"validation":{}}', '{"role":null,"collection":"question","action":"share","fields":["*"],"permissions":{},"validation":{}}', NULL),
	(79, 85, 'directus_permissions', '58', '{"role":null,"collection":"question","action":"update","fields":["*"],"permissions":{},"validation":{}}', '{"role":null,"collection":"question","action":"update","fields":["*"],"permissions":{},"validation":{}}', NULL),
	(82, 88, 'directus_permissions', '61', '{"role":null,"collection":"response","action":"create","fields":["*"],"permissions":{},"validation":{}}', '{"role":null,"collection":"response","action":"create","fields":["*"],"permissions":{},"validation":{}}', NULL),
	(85, 91, 'directus_permissions', '64', '{"role":null,"collection":"response","action":"read","fields":["*"],"permissions":{},"validation":{}}', '{"role":null,"collection":"response","action":"read","fields":["*"],"permissions":{},"validation":{}}', NULL),
	(88, 94, 'directus_permissions', '67', '{"role":null,"collection":"response","action":"update","fields":["*"],"permissions":{},"validation":{}}', '{"role":null,"collection":"response","action":"update","fields":["*"],"permissions":{},"validation":{}}', NULL),
	(91, 97, 'directus_permissions', '70', '{"role":null,"collection":"response","action":"delete","fields":["*"],"permissions":{},"validation":{}}', '{"role":null,"collection":"response","action":"delete","fields":["*"],"permissions":{},"validation":{}}', NULL),
	(94, 100, 'directus_permissions', '73', '{"role":null,"collection":"response","action":"share","fields":["*"],"permissions":{},"validation":{}}', '{"role":null,"collection":"response","action":"share","fields":["*"],"permissions":{},"validation":{}}', NULL),
	(97, 103, 'directus_permissions', '76', '{"role":null,"collection":"response_option","action":"create","fields":["*"],"permissions":{},"validation":{}}', '{"role":null,"collection":"response_option","action":"create","fields":["*"],"permissions":{},"validation":{}}', NULL),
	(100, 106, 'directus_permissions', '79', '{"role":null,"collection":"response_option","action":"read","fields":["*"],"permissions":{},"validation":{}}', '{"role":null,"collection":"response_option","action":"read","fields":["*"],"permissions":{},"validation":{}}', NULL),
	(103, 109, 'directus_permissions', '82', '{"role":null,"collection":"response_option","action":"update","fields":["*"],"permissions":{},"validation":{}}', '{"role":null,"collection":"response_option","action":"update","fields":["*"],"permissions":{},"validation":{}}', NULL),
	(106, 112, 'directus_permissions', '85', '{"role":null,"collection":"response_option","action":"delete","fields":["*"],"permissions":{},"validation":{}}', '{"role":null,"collection":"response_option","action":"delete","fields":["*"],"permissions":{},"validation":{}}', NULL),
	(109, 115, 'directus_permissions', '88', '{"role":null,"collection":"response_option","action":"share","fields":["*"],"permissions":{},"validation":{}}', '{"role":null,"collection":"response_option","action":"share","fields":["*"],"permissions":{},"validation":{}}', NULL);

-- Listage de la structure de la table data. directus_roles
DROP TABLE IF EXISTS `directus_roles`;
CREATE TABLE IF NOT EXISTS `directus_roles` (
  `id` char(36) NOT NULL,
  `name` varchar(100) NOT NULL,
  `icon` varchar(30) NOT NULL DEFAULT 'supervised_user_circle',
  `description` text DEFAULT NULL,
  `ip_access` text DEFAULT NULL,
  `enforce_tfa` tinyint(1) NOT NULL DEFAULT 0,
  `admin_access` tinyint(1) NOT NULL DEFAULT 0,
  `app_access` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table data.directus_roles : ~1 rows (environ)
REPLACE INTO `directus_roles` (`id`, `name`, `icon`, `description`, `ip_access`, `enforce_tfa`, `admin_access`, `app_access`) VALUES
	('6499a677-fcc6-4c0d-8618-f8cd8f721c56', 'Administrator', 'verified', '$t:admin_description', NULL, 0, 1, 1);

-- Listage de la structure de la table data. directus_sessions
DROP TABLE IF EXISTS `directus_sessions`;
CREATE TABLE IF NOT EXISTS `directus_sessions` (
  `token` varchar(64) NOT NULL,
  `user` char(36) DEFAULT NULL,
  `expires` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ip` varchar(255) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `share` char(36) DEFAULT NULL,
  `origin` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`token`),
  KEY `directus_sessions_user_foreign` (`user`),
  KEY `directus_sessions_share_foreign` (`share`),
  CONSTRAINT `directus_sessions_share_foreign` FOREIGN KEY (`share`) REFERENCES `directus_shares` (`id`) ON DELETE CASCADE,
  CONSTRAINT `directus_sessions_user_foreign` FOREIGN KEY (`user`) REFERENCES `directus_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table data.directus_sessions : ~4 rows (environ)
REPLACE INTO `directus_sessions` (`token`, `user`, `expires`, `ip`, `user_agent`, `share`, `origin`) VALUES
	('72_VpkT0U4cCxc7pWjhCW2L1SW0__jotIKDD-3H83PSNFm8v6u-xhRJsTaK0yRCS', 'e46462a8-368a-4b24-a10f-1a1324671eff', '2023-05-03 14:18:36', '172.20.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0', NULL, 'http://localhost:8055'),
	('FeC5FOrs1VPN9FTfSdInVJ5984-BGlB9LbYmoqcaNrQSklCBemi2_ZQV0aTH6hi9', 'e46462a8-368a-4b24-a10f-1a1324671eff', '2023-05-04 10:34:01', '172.20.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0', NULL, 'http://localhost:8055'),
	('GWEShiX6pEidw-QmpacoTZ6ojEj6Y9DIhilnGCMrsWHpJQmxbsysK-ehY_k_O5Sq', 'e46462a8-368a-4b24-a10f-1a1324671eff', '2023-05-03 08:00:45', '172.19.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0', NULL, 'http://localhost:8055'),
	('Yz-Ji-VnXyUQ1dV5oAcQGcBWvqAdKJ0SsM_q1vFjUxVrgmBzlb-xQScdyHOZsRLf', 'e46462a8-368a-4b24-a10f-1a1324671eff', '2023-05-03 08:25:03', '172.19.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0', NULL, 'http://localhost:8055');

-- Listage de la structure de la table data. directus_settings
DROP TABLE IF EXISTS `directus_settings`;
CREATE TABLE IF NOT EXISTS `directus_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `project_name` varchar(100) NOT NULL DEFAULT 'Directus',
  `project_url` varchar(255) DEFAULT NULL,
  `project_color` varchar(50) DEFAULT NULL,
  `project_logo` char(36) DEFAULT NULL,
  `public_foreground` char(36) DEFAULT NULL,
  `public_background` char(36) DEFAULT NULL,
  `public_note` text DEFAULT NULL,
  `auth_login_attempts` int(10) unsigned DEFAULT 25,
  `auth_password_policy` varchar(100) DEFAULT NULL,
  `storage_asset_transform` varchar(7) DEFAULT 'all',
  `storage_asset_presets` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`storage_asset_presets`)),
  `custom_css` text DEFAULT NULL,
  `storage_default_folder` char(36) DEFAULT NULL,
  `basemaps` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`basemaps`)),
  `mapbox_key` varchar(255) DEFAULT NULL,
  `module_bar` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`module_bar`)),
  `project_descriptor` varchar(100) DEFAULT NULL,
  `translation_strings` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`translation_strings`)),
  `default_language` varchar(255) NOT NULL DEFAULT 'en-US',
  `custom_aspect_ratios` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`custom_aspect_ratios`)),
  PRIMARY KEY (`id`),
  KEY `directus_settings_project_logo_foreign` (`project_logo`),
  KEY `directus_settings_public_foreground_foreign` (`public_foreground`),
  KEY `directus_settings_public_background_foreign` (`public_background`),
  KEY `directus_settings_storage_default_folder_foreign` (`storage_default_folder`),
  CONSTRAINT `directus_settings_project_logo_foreign` FOREIGN KEY (`project_logo`) REFERENCES `directus_files` (`id`),
  CONSTRAINT `directus_settings_public_background_foreign` FOREIGN KEY (`public_background`) REFERENCES `directus_files` (`id`),
  CONSTRAINT `directus_settings_public_foreground_foreign` FOREIGN KEY (`public_foreground`) REFERENCES `directus_files` (`id`),
  CONSTRAINT `directus_settings_storage_default_folder_foreign` FOREIGN KEY (`storage_default_folder`) REFERENCES `directus_folders` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table data.directus_settings : ~1 rows (environ)
REPLACE INTO `directus_settings` (`id`, `project_name`, `project_url`, `project_color`, `project_logo`, `public_foreground`, `public_background`, `public_note`, `auth_login_attempts`, `auth_password_policy`, `storage_asset_transform`, `storage_asset_presets`, `custom_css`, `storage_default_folder`, `basemaps`, `mapbox_key`, `module_bar`, `project_descriptor`, `translation_strings`, `default_language`, `custom_aspect_ratios`) VALUES
	(1, 'Directus', NULL, NULL, NULL, NULL, NULL, NULL, 25, NULL, 'all', NULL, NULL, NULL, NULL, NULL, '[{"type":"module","id":"content","enabled":true},{"type":"module","id":"users","enabled":true},{"type":"module","id":"files","enabled":true},{"type":"module","id":"insights","enabled":true},{"type":"link","id":"docs","name":"$t:documentation","url":"https://docs.directus.io","icon":"help","enabled":true},{"type":"module","id":"settings","enabled":true,"locked":true},{"type":"module","id":"api-viewer","enabled":true}]', NULL, NULL, 'en-US', NULL);

-- Listage de la structure de la table data. directus_shares
DROP TABLE IF EXISTS `directus_shares`;
CREATE TABLE IF NOT EXISTS `directus_shares` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `collection` varchar(64) DEFAULT NULL,
  `item` varchar(255) DEFAULT NULL,
  `role` char(36) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `user_created` char(36) DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `date_start` timestamp NULL DEFAULT NULL,
  `date_end` timestamp NULL DEFAULT NULL,
  `times_used` int(11) DEFAULT 0,
  `max_uses` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `directus_shares_collection_foreign` (`collection`),
  KEY `directus_shares_role_foreign` (`role`),
  KEY `directus_shares_user_created_foreign` (`user_created`),
  CONSTRAINT `directus_shares_collection_foreign` FOREIGN KEY (`collection`) REFERENCES `directus_collections` (`collection`) ON DELETE CASCADE,
  CONSTRAINT `directus_shares_role_foreign` FOREIGN KEY (`role`) REFERENCES `directus_roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `directus_shares_user_created_foreign` FOREIGN KEY (`user_created`) REFERENCES `directus_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table data.directus_shares : ~0 rows (environ)

-- Listage de la structure de la table data. directus_users
DROP TABLE IF EXISTS `directus_users`;
CREATE TABLE IF NOT EXISTS `directus_users` (
  `id` char(36) NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `email` varchar(128) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `tags` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`tags`)),
  `avatar` char(36) DEFAULT NULL,
  `language` varchar(255) DEFAULT NULL,
  `theme` varchar(20) DEFAULT 'auto',
  `tfa_secret` varchar(255) DEFAULT NULL,
  `status` varchar(16) NOT NULL DEFAULT 'active',
  `role` char(36) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `last_access` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `last_page` varchar(255) DEFAULT NULL,
  `provider` varchar(128) NOT NULL DEFAULT 'default',
  `external_identifier` varchar(255) DEFAULT NULL,
  `auth_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`auth_data`)),
  `email_notifications` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `directus_users_external_identifier_unique` (`external_identifier`),
  UNIQUE KEY `directus_users_email_unique` (`email`),
  UNIQUE KEY `directus_users_token_unique` (`token`),
  KEY `directus_users_role_foreign` (`role`),
  CONSTRAINT `directus_users_role_foreign` FOREIGN KEY (`role`) REFERENCES `directus_roles` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table data.directus_users : ~1 rows (environ)
REPLACE INTO `directus_users` (`id`, `first_name`, `last_name`, `email`, `password`, `location`, `title`, `description`, `tags`, `avatar`, `language`, `theme`, `tfa_secret`, `status`, `role`, `token`, `last_access`, `last_page`, `provider`, `external_identifier`, `auth_data`, `email_notifications`) VALUES
	('e46462a8-368a-4b24-a10f-1a1324671eff', 'Admin', 'User', 'admin@email.com', '$argon2id$v=19$m=65536,t=3,p=4$RcFjACjZKFu0fWdr4uTIqA$Nc/VNOA5DW4TGzqZoZuG6TAag+5RZ7h1Uo/klxIBEOI', NULL, NULL, NULL, NULL, NULL, NULL, 'auto', NULL, 'active', '6499a677-fcc6-4c0d-8618-f8cd8f721c56', NULL, '2023-04-27 10:34:01', '/api-viewer', 'default', NULL, NULL, 1);

-- Listage de la structure de la table data. directus_webhooks
DROP TABLE IF EXISTS `directus_webhooks`;
CREATE TABLE IF NOT EXISTS `directus_webhooks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `method` varchar(10) NOT NULL DEFAULT 'POST',
  `url` varchar(255) NOT NULL,
  `status` varchar(10) NOT NULL DEFAULT 'active',
  `data` tinyint(1) NOT NULL DEFAULT 1,
  `actions` varchar(100) NOT NULL,
  `collections` varchar(255) NOT NULL,
  `headers` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`headers`)),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table data.directus_webhooks : ~0 rows (environ)

-- Listage de la structure de la table data. question
DROP TABLE IF EXISTS `question`;
CREATE TABLE IF NOT EXISTS `question` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `axis_id` int(11) NOT NULL,
  `question` varchar(512) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `axis_id_fk` (`axis_id`),
  CONSTRAINT `axis_id_fk` FOREIGN KEY (`axis_id`) REFERENCES `axis` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table data.question : ~40 rows (environ)
REPLACE INTO `question` (`id`, `axis_id`, `question`) VALUES
	(1, 1, 'Formations pour Apprendre à apprendre, changement de paradigme, "être à la page" (au-delà des compétences "justes" nécessaires) ?'),
	(2, 1, 'Le co-développement (outil d\'intelligence collective) existe-t-il dans l\'entreprise ?'),
	(3, 1, 'Les collaborateurs sont-ils amenés à partager leurs compétences et sous quelles formes ?'),
	(4, 1, 'Le mentoring (fonctionnement en binôme) existe-t-il pour assurer le transfert de compétences ?'),
	(5, 1, 'Les managers sont-ils aussi formateurs sur certains sujet pour l\'entreprise entière ?'),
	(6, 1, 'L\'entreprise favorise-t-elle l\'excellence technique ? (Principe 9 du Manifeste Agile) ?'),
	(7, 1, 'Déployez vous les pratiques du \'Faire Agile\', c\'est-à-dire une ou plusieurs des "méthodes" agiles ?'),
	(8, 1, 'Votre entreprise promeut-elle un "état d\'esprit agile" ?'),
	(9, 1, 'Votre entreprise gère-t-elle humainement les compétences ?'),
	(10, 2, 'Votre entreprise dégage t-elle une part de CA  par des produits ou services en ligne ?'),
	(11, 2, 'La mise en place d’outils numériques a-t-elle permis d\'optimiser les coûts, les délais et la qualité ?'),
	(12, 2, 'Comment les outils sont-ils intégrés dans les process de l’entreprise ?'),
	(13, 2, 'Comment partagez-vous les données numériques avec les parties prenantes (clients, fournisseurs,…) ?'),
	(14, 2, 'Mesurez-vous les impacts du numérique sur votre entreprise ?'),
	(15, 2, 'Quel est l’impact du numérique sur la démarche RSE de l’entreprise ?'),
	(16, 2, 'Existe-t-il des freins (stratégiques, financiers,…) à l’ investissement dans les outils numériques ?'),
	(17, 2, 'L’entreprise dispose-t-elle : d’un site internet, d’un compte LinkedIn, d’une page Facebook, d’un compte Twitter,... ?'),
	(18, 2, 'Comment utilisez-vous le numérique dans la relation client ? (nouveau modèle de vente, nouveau modèle d’échanges avec les clients, communauté, story, chat,...)?'),
	(19, 2, 'L’entreprise dispose-t-elle d’un community manager ?'),
	(20, 2, 'Certains de vos collaborateurs sont-ils actifs sur les réseaux sociaux au nom de l’entreprise ?'),
	(21, 2, 'Comment mesurez-vous et exploitez-vous les données issues du site de votre entreprise ?'),
	(22, 2, 'Avez-vous observé chez vos concurrents des pratiques innovantes ?'),
	(23, 2, 'Vos collaborateurs sont-ils équipés de nouveaux équipements numériques de travail (PC portable, tablette, smartphone,…) ?'),
	(24, 2, 'L’arrivée des outils digitaux a-t-elle eu un impact sur les pratiques et la culture de l’entreprise ?'),
	(25, 2, 'Comment vous êtes-vous approprié et comment avez-vous accompagné ces évolutions?'),
	(26, 2, 'Les nouvelles possibilités technologiques ont-elles fait évoluer le modèle d’organisation de l’entreprise et/ou votre management, vers plus de collaboration avec des acteurs internes ou externes ?'),
	(27, 2, 'Mobilisez-vous des outils de veille et mettez-vous en œuvre des modalités de curation et de partage de l’ information ?'),
	(28, 2, 'Les fonctionnalités des outils sont-elles augmentées par la pratique de vos collaborateurs ?'),
	(29, 2, 'Comment accompagnez-vous vos collaborateurs dans la transition numérique ?'),
	(30, 3, 'Valeur supérieure utilisable livrée plus tôt (Fonction principale utilisable dès les premières versions)'),
	(31, 3, 'Réactivité face aux impératifs prépondérants'),
	(32, 3, 'Mesure de la vélocité de l\'équipe (indicateur de suivi du travail d\'une équipe de conception)'),
	(33, 3, 'Les installations techniques et de gestion sont modernes (TIC/ERP/CRM)'),
	(34, 3, 'Les équipes sont en capacité d\'autonomiser une partie de leurs tâches'),
	(35, 3, 'Les équipes s’inscrivent dans un cadre Agile Lean'),
	(36, 3, 'Les mécanismes de livraison et de synchronisation sont matures'),
	(37, 3, 'Les innovations produit tiennent compte de l\'urgence climatique'),
	(38, 3, 'Les processus internes sont remis en cause pour diminuer leur impact environnemental'),
	(39, 3, 'Les parties prenantes sont sélectionnées en fonction de leur éthique vis-à-vis du développement durable'),
	(40, 3, 'Veille stratégique');

-- Listage de la structure de la table data. response
DROP TABLE IF EXISTS `response`;
CREATE TABLE IF NOT EXISTS `response` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `response_option_id` int(10) unsigned DEFAULT NULL,
  `diagnostic_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `response_option_id_fk` (`response_option_id`),
  KEY `diagnostic_id_fk` (`diagnostic_id`),
  CONSTRAINT `diagnostic_id_fk` FOREIGN KEY (`diagnostic_id`) REFERENCES `diagnostic` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `response_option_id_fk` FOREIGN KEY (`response_option_id`) REFERENCES `response_option` (`id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table data.response : ~0 rows (environ)

-- Listage de la structure de la table data. response_option
DROP TABLE IF EXISTS `response_option`;
CREATE TABLE IF NOT EXISTS `response_option` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `question_id` int(10) unsigned NOT NULL,
  `response` varchar(512) NOT NULL DEFAULT '',
  `score` int(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `question_id_pk` (`question_id`),
  CONSTRAINT `question_id_pk` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=363 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table data.response_option : ~120 rows (environ)
REPLACE INTO `response_option` (`id`, `question_id`, `response`, `score`) VALUES
	(1, 1, 'Désintérêt pour l\'amélioration de la compétence des équipes', 0),
	(4, 1, 'Nombreuses formations métiers dans le plan de formation', 1),
	(7, 1, 'Possibilité de choisir et de suivre des formations "annexes" au métier et/ou temps dédié pour de la veille ou de l\'auto-formation', 2),
	(10, 2, 'Pas du tout', 0),
	(13, 2, 'Quelques initiatives', 1),
	(16, 2, 'Démarche instaurée et pratiquée régulièrement', 2),
	(19, 3, 'Aucune initiative', 0),
	(22, 3, 'Capitalisation d\'un certain nombre de savoirs', 1),
	(25, 3, 'Véritable communauté de pratiques mise en place', 2),
	(28, 4, 'Aucune initiative', 0),
	(31, 4, 'Quelques initiatives', 1),
	(34, 4, 'Systématiquement lors d\'une prise de poste', 2),
	(37, 5, 'Non', 0),
	(40, 5, 'Quelques fois', 1),
	(43, 5, 'Quasi systématiquement', 2),
	(46, 6, 'Pas du tout', 0),
	(49, 6, 'Oui un peu', 1),
	(52, 6, 'Oui', 2),
	(55, 7, 'NON, nous les projets sont tous en cycle en V / cascade', 0),
	(58, 7, 'Quelques projets pilotes', 1),
	(61, 7, 'Déploiement systématique d\'une ou plusieurs méthodes', 2),
	(64, 8, 'Non', 0),
	(67, 8, 'Quelques valeurs agiles promues', 1),
	(70, 8, 'Oui', 2),
	(73, 9, 'Non', 0),
	(76, 9, 'Un peu', 1),
	(79, 9, 'Oui', 2),
	(82, 10, 'Moins de 10%', 0),
	(85, 10, 'Oui environ 20%', 1),
	(88, 10, 'Oui environ 30%', 2),
	(91, 11, 'Aucun', 0),
	(94, 11, 'Oui mais pas pour tous les critères', 1),
	(97, 11, 'Oui pour tous les critères ', 2),
	(100, 12, 'Absence d\'outils ou de procédures, manque d\'utilité', 0),
	(103, 12, 'En partie, les outils ne sont pas toujours adaptés à l\'activité et pas toujours rattachés à des procédures, sans entraver ses principales fonctions', 1),
	(106, 12, 'A part entière, il existe des procédures et formations aux outils, ces outils sont intituitifs et adaptés à l\'activité', 2),
	(109, 13, 'En mode novice : au mieux par mail ou via le site internet', 0),
	(112, 13, 'En mode collaboratif : quelques aménagements (type sharepoint, drive) pour des sujets plutôt ponctuels', 1),
	(115, 13, 'En mode avancé : des plateformes dédiées (type extranet, applications) sont intégrées au mode de partage permanent', 2),
	(118, 14, 'Non', 0),
	(121, 14, 'Oui et non on observe sans mesurer', 1),
	(124, 14, 'Oui des outils de mesure sont en place', 2),
	(127, 15, 'Absence de démarche RSE', 0),
	(130, 15, 'C\'est un sujet observé de loin, on traite les questions d\'obligation légales sans aller plus loin', 1),
	(133, 15, 'Le numérique est un sujet totalement rattaché à la démarche RSE', 2),
	(136, 16, 'Oui la statégie de l\'entreprise n\'est pas orientée en faveur du numérique, elle n\'investit pas', 0),
	(139, 16, 'Oui l\'entreprise est plutôt frileuse, on ne dépense que le strict nécessaire pour que les outils fonctionnent sans recherche de performance', 1),
	(142, 16, 'Non des budgets sont alloués et l\'entreprise a bien compris cette nécessité dans sa stratégie', 2),
	(145, 17, 'Non le site/la page réseau sont inexistants ou inactifs', 0),
	(148, 17, 'Oui mais seulement sur le site internet', 1),
	(151, 17, 'Oui la présence de l\'entreprise sur les réseaux est visible, elle correspond au secteur d\'activité', 2),
	(154, 18, 'Absence de plateforme de contact', 0),
	(157, 18, 'Des accès dédiés pour les échanges entre le client et l\'entreprise sont existent, le suivi des contacts n\'est pas optimal', 1),
	(160, 18, 'Plusieurs modes d\'utilisation sont possibles pour échanger avec l\'externe, ils sont performants et adaptés avec l\'activité de l\'entreprise', 2),
	(163, 19, 'Non aucune personne n\'est dédiée ', 0),
	(166, 19, 'Non mais une personne se charge de l\'animation des réseaux sociaux parmi ses autres tâches', 1),
	(169, 19, 'Oui', 2),
	(172, 20, 'Non ou rarement', 0),
	(175, 20, 'Oui sans incitation', 1),
	(178, 20, 'Oui avec des incitations de l\'entreprise pour le faire', 2),
	(181, 21, 'Absence de suivi', 0),
	(184, 21, 'Des indicateurs sont en place mais plutôt de façon passive, ils servent à mesurer ', 1),
	(187, 21, 'Des indicateurs sont mis en place afin de mesurer l\'efficacité et l\'impact du site sur les réseaux, une recherche de performance est en place pour toucher toujours plus et mieux', 2),
	(190, 22, 'Oui ils sont tellement performants et en avance que nous pourrions perdre des marchés', 0),
	(193, 22, 'Oui ils ont quelques belles idées, si seulement on pouvait faire aussi bien qu\'eux', 1),
	(196, 22, 'Oui elles servent comme base de reflexion et de développement pour notre propre entreprise. On peut être rivaliser !', 2),
	(199, 23, 'Les fonctions supports ne sont pas amenées à être équipé pour le travail à distance. L\'entreprise fonctionne majoritairement sur le mode papier.', 0),
	(202, 23, 'Les processus s\'appuient rarement sur la numérisation des données et les outils numériques. Le potentiel ne semble pas pleinement exploité.', 1),
	(205, 23, 'Les processus de travail s\'appuient sur des outils numériques quand ceux-ci sont possibles. L\'ensemble des fonctions de l\'entreprise sont équipées pour pouvoir réaliser le travail à distance quand celui-ci est possible', 2),
	(208, 24, 'Non au contraire, peu de monde y adhère', 0),
	(211, 24, 'Oui dans l\'ensemble toutefois nous rencontrons parfois des contraintes (pratiques, techniques,…)', 1),
	(214, 24, 'Oui gain de temps, facilité, économies et fiabilité', 2),
	(217, 25, 'Absence de communication et d\'accompagnement', 0),
	(220, 25, 'La communication n\'est pas parfaite, les personnes qui peuvent se sentir en difficultés avec les nouvelles pratiques ne sont pas forcémment considérées.', 1),
	(223, 25, 'Tout est en place pour faciliter la compréhension et l\'adhésion aux nouveaux outils/pratiques', 2),
	(226, 26, 'L\'organisation est en silot, absence de projets transversaux et d\'interactions avec les autres sites', 0),
	(229, 26, 'Oui quelques évolutions s\'opèrent pour travailler en inter-service ou avec l\'externe, toutefois le potentiel n\'est pas pleinement exploité', 1),
	(232, 26, 'Oui on sort complétement du mode silot et on favorise le mode projet', 2),
	(235, 27, 'Absence de veille', 0),
	(238, 27, 'Il y a un peu de benchmark toutefois les décisions d\'évolutions sont un peu tardive (quand il n y a plus le choix)', 1),
	(241, 27, 'Oui l\'entreprise est en capacité de mesurer sa performance et de réagir rapidement pour se mettre à jour', 2),
	(244, 28, 'Absence de prise en compte des pratiques terrain', 0),
	(247, 28, 'Oui mais les outils sont vieillissants, il y a des freins pour les faire évoluer', 1),
	(250, 28, 'Oui totalement les outils s\'adaptent au terrain quotidiennement', 2),
	(253, 29, 'Absence d\'accompagnement', 0),
	(256, 29, 'L\'entreprise accompagne en faisant de son mieux pour faire adhérer les autres, il y a parfois quelques blocages. J\'aimerais parfois être moi-même accompagné', 1),
	(259, 29, 'L\'entreprise est pro-active par la promotion des innovations et des outils numériques.', 2),
	(266, 30, 'Pas de phase de validation intermédiaire', 0),
	(269, 30, 'Prototype fonctionnel intermédiaire livré au client', 1),
	(272, 30, 'Principe du MVP respecté : Minimum Viable Product / la version d\'un produit qui permet d\'obtenir un maximum de retours client avec un minimum d\'effort', 2),
	(275, 31, 'Pas de modification possible en cours de conception', 0),
	(278, 31, 'Modifications en cours de conception engendrant alors du retard', 1),
	(281, 31, 'L\'équipe de conception s\'adapte en cas de modification en cours de conception', 2),
	(284, 32, 'Jamais', 0),
	(287, 32, 'Suivi des tâches', 1),
	(290, 32, 'Mesure de la vélocité', 2),
	(293, 33, 'Le système d\'information freine toute tentative de réagir rapidement', 0),
	(296, 33, 'Le système d\'information permet avec quelques difficultés d\'avoir de la réactivité', 1),
	(299, 33, 'En cas de besoin, le système d\'information favorise la réactivité', 2),
	(302, 34, 'Jamais', 0),
	(305, 34, 'On laisse la possibilité de créer quelques macros Excel/VBA', 1),
	(308, 34, 'L\'entreprise équipe et forme ses équipes à la création de site web ou app via des outils no-code', 2),
	(311, 35, 'Pas de démarche Agile/Lean initiée dans l\'entreprise', 0),
	(314, 35, 'Plusieurs concepts Agile/Lean sont mis en œuvre dans l\'entreprise', 1),
	(317, 35, 'Les concepts Agile/Lean sont inscrits dans l\'ADN de l\'entreprise : Satisfaction du client avec des livraisons au plu tôt et régulières, accepter les changements, lisser les activités, collaboration quotidienne avec les parties prenantes, proximité terrain, autonomie des équipes dans la résolution de problèmes, amélioration continue...', 2),
	(320, 36, 'Pas de démarche de tension des flux', 0),
	(323, 36, 'Quelques concepts du juste à temps sont mis en œuvre pour tendre le flux', 1),
	(326, 36, 'Concepts du juste à temps maîtrisés (production rythmée par la demande client, peu d\'en-cours)', 2),
	(329, 37, 'Auxune réflexion sur cet axe', 0),
	(332, 37, 'Des premières initiatives ont été lancées', 1),
	(335, 37, 'Systématiquement', 2),
	(338, 38, 'Auxune réflexion sur cet axe', 0),
	(341, 38, 'Des premières initiatives ont été lancées', 1),
	(344, 38, 'Systématiquement', 2),
	(347, 39, 'Auxune réflexion sur cet axe', 0),
	(350, 39, 'Des premières initiatives ont été lancées', 1),
	(353, 39, 'Systématiquement', 2),
	(356, 40, 'Pas de veille', 0),
	(359, 40, 'La veille stratégique de l\'entreprise permet d\'anticiper les évolutions et les innovations', 1),
	(362, 40, 'La veille stratégique de l\'entreprise permet d\'anticiper les disruptions nécessaires', 2);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

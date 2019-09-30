-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.13 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table essentialmode.mdt_active_users
CREATE TABLE IF NOT EXISTS `mdt_active_users` (
  `user_id` int(11) DEFAULT NULL,
  `server` int(11) DEFAULT NULL,
  `callID` int(11) DEFAULT '0',
  `identifier` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '10-42',
  `department` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `divison` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `logout` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table essentialmode.mdt_active_users: ~1 rows (approximately)
/*!40000 ALTER TABLE `mdt_active_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdt_active_users` ENABLE KEYS */;

-- Dumping structure for table essentialmode.mdt_aop_names
CREATE TABLE IF NOT EXISTS `mdt_aop_names` (
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table essentialmode.mdt_aop_names: ~4 rows (approximately)
/*!40000 ALTER TABLE `mdt_aop_names` DISABLE KEYS */;
INSERT INTO `mdt_aop_names` (`name`) VALUES
	('Statewide'),
	('Blaine County'),
	('Los Santos'),
	('Sandy Shores & Surrounding Area');
/*!40000 ALTER TABLE `mdt_aop_names` ENABLE KEYS */;

-- Dumping structure for table essentialmode.mdt_arrests
CREATE TABLE IF NOT EXISTS `mdt_arrests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `charaterId` int(11) DEFAULT NULL,
  `first` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `last` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `plateId` int(11) DEFAULT NULL,
  `plate` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `description` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `infraction` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `location` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `fine` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `jail` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `date` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `officer` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- Dumping data for table essentialmode.mdt_arrests: ~0 rows (approximately)
/*!40000 ALTER TABLE `mdt_arrests` DISABLE KEYS */;
INSERT INTO `mdt_arrests` (`id`, `charaterId`, `first`, `last`, `plateId`, `plate`, `description`, `infraction`, `location`, `fine`, `jail`, `date`, `officer`) VALUES
	(14, 49, 'Bruton', 'Gaster', 0, '', '', '["Speeding 100+"]', 'Joshua Road', '1000', '0', '08-05-2019 23:28:24', '2B-12 [SAHP]');
/*!40000 ALTER TABLE `mdt_arrests` ENABLE KEYS */;

-- Dumping structure for table essentialmode.mdt_ban
CREATE TABLE IF NOT EXISTS `mdt_ban` (
  `steam` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table essentialmode.mdt_ban: ~0 rows (approximately)
/*!40000 ALTER TABLE `mdt_ban` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdt_ban` ENABLE KEYS */;

-- Dumping structure for table essentialmode.mdt_calls
CREATE TABLE IF NOT EXISTS `mdt_calls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '0',
  `location` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `notes` longtext COLLATE utf8mb4_bin,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table essentialmode.mdt_calls: ~2 rows (approximately)
/*!40000 ALTER TABLE `mdt_calls` DISABLE KEYS */;
INSERT INTO `mdt_calls` (`id`, `type`, `location`, `details`, `notes`) VALUES
	(28, 'Pursuit', 'Joshua Road / Nearest Postal 777', '', NULL);
/*!40000 ALTER TABLE `mdt_calls` ENABLE KEYS */;

-- Dumping structure for table essentialmode.mdt_call_type
CREATE TABLE IF NOT EXISTS `mdt_call_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table essentialmode.mdt_call_type: ~34 rows (approximately)
/*!40000 ALTER TABLE `mdt_call_type` DISABLE KEYS */;
INSERT INTO `mdt_call_type` (`id`, `name`) VALUES
	(1, 'Traffic Stop'),
	(2, 'MVA'),
	(3, 'MVA W/ Injury'),
	(4, 'Abandon Vehicle'),
	(5, 'Robbery'),
	(6, 'Arson'),
	(7, 'Assault'),
	(8, 'Assist Person'),
	(9, 'Attempt to Locate'),
	(10, 'Burglary'),
	(11, 'Dead Body'),
	(12, 'Domestic Disturbance'),
	(13, 'Disturbance'),
	(14, 'Follow Up / Additional Information '),
	(15, 'Hit and Run '),
	(16, 'Hazard'),
	(17, 'Kidnapping'),
	(18, 'Littering / Dumping'),
	(19, 'Missing Person'),
	(20, 'Motorist Assist'),
	(21, 'Noise Complaint'),
	(22, 'Pursuit'),
	(23, 'Search & Rescue\r'),
	(24, 'Shots Fired/Heard'),
	(25, 'Stolen Vehicle '),
	(26, 'Subject Stop'),
	(27, 'Suicide'),
	(28, 'Sex Crime'),
	(29, 'Suspicious Vehicle'),
	(30, 'Suspicious Person'),
	(31, 'Theft'),
	(32, 'Trespassing'),
	(33, 'Welfare Check'),
	(34, 'Drugs');
/*!40000 ALTER TABLE `mdt_call_type` ENABLE KEYS */;

-- Dumping structure for table essentialmode.mdt_characters
CREATE TABLE IF NOT EXISTS `mdt_characters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ownerID` int(11) DEFAULT NULL,
  `first` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '0',
  `last` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '0',
  `dob` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '0',
  `gender` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '0',
  `address` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '0',
  `lic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '[]',
  `med` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '[]',
  `warrant` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '[]',
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table essentialmode.mdt_characters: ~9 rows (approximately)
/*!40000 ALTER TABLE `mdt_characters` DISABLE KEYS */;
INSERT INTO `mdt_characters` (`id`, `ownerID`, `first`, `last`, `dob`, `gender`, `address`, `lic`, `med`, `warrant`) VALUES
	(49, 59, 'Bruton', 'Gaster', '1969-04-20', 'Male', 'Santa Barbara', '[{"id":"1","name":"Driver License","type":"Non-Commercial","status":"Valid"},{"id":"2","name":"Boating License","type":"Boating License","status":"Valid"}]', 'null', 'null'),
	(52, 59, 'Jo', 'Mama', '2019-08-01', 'Male', 'Jo mama', 'null', 'null', '[]');
/*!40000 ALTER TABLE `mdt_characters` ENABLE KEYS */;

-- Dumping structure for table essentialmode.mdt_departments
CREATE TABLE IF NOT EXISTS `mdt_departments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `abbreviation` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `type` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table essentialmode.mdt_departments: ~3 rows (approximately)
/*!40000 ALTER TABLE `mdt_departments` DISABLE KEYS */;
INSERT INTO `mdt_departments` (`id`, `name`, `abbreviation`, `icon`, `type`) VALUES
	(1, 'San Andreas Highway Patrol', 'SAHP', 'SAHP', 'leo'),
	(2, 'Blaine County Sheriffs Office', 'BCSO', 'BCSO', 'leo'),
	(3, 'Los Santos Police Department', 'LSPD', 'LSPD', 'leo'),
	(4, 'Los Santos Fire Department', 'LSFD', 'LSFD', 'ems');
/*!40000 ALTER TABLE `mdt_departments` ENABLE KEYS */;

-- Dumping structure for table essentialmode.mdt_divisions
CREATE TABLE IF NOT EXISTS `mdt_divisions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `departmentID` int(11) NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `abbreviation` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- Dumping data for table essentialmode.mdt_divisions: ~25 rows (approximately)
/*!40000 ALTER TABLE `mdt_divisions` DISABLE KEYS */;
INSERT INTO `mdt_divisions` (`id`, `departmentID`, `name`, `abbreviation`, `icon`) VALUES
	(1, 3, 'Patrol', 'Patrol', 'LSPD'),
	(2, 3, 'K9', 'K9', 'K9'),
	(3, 3, 'Port Authority', 'PA', 'PA'),
	(4, 3, 'Traffic', 'TRAFFIC', 'traffic'),
	(5, 2, 'Patrol', 'Patrol', 'BCSO'),
	(6, 2, 'Traffic', 'TRAFFIC', 'traffic'),
	(7, 2, 'K9', 'K9', 'K9'),
	(8, 3, 'Detective', 'DETECTIVE', 'detective'),
	(9, 2, 'Detective', 'DETECTIVE', 'detective'),
	(10, 3, 'Vinewood', 'VINEWOOD', 'Vinewood'),
	(11, 2, 'Sandy Shores', 'SANDY', 'sandy'),
	(12, 3, 'Narcotics', 'DRUG', 'narcotics'),
	(13, 2, 'Narcotics', 'DRUG', 'narcotics'),
	(14, 1, 'Patrol', 'Patrol', 'SAHP'),
	(15, 1, 'K9', 'K9', 'K9'),
	(16, 3, 'Air', 'AIR', 'heli'),
	(17, 1, 'Air', 'AIR', 'heli'),
	(18, 2, 'Air', 'AIR', 'heli'),
	(19, 1, 'Motor', 'MOTOR', 'motor'),
	(20, 2, 'Motor', 'MOTOR', 'motor'),
	(21, 3, 'Motor', 'MOTOR', 'motor'),
	(22, 1, 'SWAT', 'SWAT', 'SWAT'),
	(23, 2, 'SWAT', 'SWAT', 'SWAT'),
	(24, 3, 'SWAT', 'SWAT', 'SWAT'),
	(25, 1, 'CVE', 'CVE', 'cve'),
	(26, 4, 'Medic', 'MEDIC', 'medic');
/*!40000 ALTER TABLE `mdt_divisions` ENABLE KEYS */;

-- Dumping structure for table essentialmode.mdt_licenses
CREATE TABLE IF NOT EXISTS `mdt_licenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8mb4_bin,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '[]',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '["None", "Valid", "Expired", "Suspended", "Revoked"]',
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table essentialmode.mdt_licenses: ~1 rows (approximately)
/*!40000 ALTER TABLE `mdt_licenses` DISABLE KEYS */;
INSERT INTO `mdt_licenses` (`id`, `name`, `type`, `status`) VALUES
	(1, 'Driver License', '["Non-Commercial", "Motorcycle", "Commercial" ]', '["Valid", "Expired", "Suspended", "Revoked"]'),
	(2, 'Boating License', '["Boating License" ]', '["Valid", "Expired", "Suspended", "Revoked"]');
/*!40000 ALTER TABLE `mdt_licenses` ENABLE KEYS */;

-- Dumping structure for table essentialmode.mdt_penal_category
CREATE TABLE IF NOT EXISTS `mdt_penal_category` (
  `id` int(11) DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table essentialmode.mdt_penal_category: ~4 rows (approximately)
/*!40000 ALTER TABLE `mdt_penal_category` DISABLE KEYS */;
INSERT INTO `mdt_penal_category` (`id`, `name`) VALUES
	(1, 'Property'),
	(2, 'Possession'),
	(3, 'Violent Crimes'),
	(4, 'Traffic');
/*!40000 ALTER TABLE `mdt_penal_category` ENABLE KEYS */;

-- Dumping structure for table essentialmode.mdt_penal_charges
CREATE TABLE IF NOT EXISTS `mdt_penal_charges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cat` int(11) DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `punishment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `fine` int(11) DEFAULT NULL,
  `jail` int(11) DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- Dumping data for table essentialmode.mdt_penal_charges: ~31 rows (approximately)
/*!40000 ALTER TABLE `mdt_penal_charges` DISABLE KEYS */;
INSERT INTO `mdt_penal_charges` (`id`, `cat`, `name`, `type`, `punishment`, `fine`, `jail`) VALUES
	(1, 1, 'Destruction', 'Misdemeanor', '10 Seconds In Jail', 0, 10),
	(2, 1, 'Theft', 'Misdemeanor', '25 Seconds In Jail AND $1,000 Fine', 1000, 25),
	(3, 1, 'Trespassing', 'Misdemeanor', '$1,000 Fine OR 10 Seconds In Jail', 1000, 10),
	(4, 1, 'Burglary', 'Felony', '60 Seconds In Jail ', 0, 60),
	(5, 1, 'Grand  Theft', 'Felony', '60 Seconds In Jail AND $1,000 Fine', 1000, 60),
	(6, 2, 'Possession of Drugs With Intent to Dristribute', 'Felony', '60 Seconds In Jail ', 0, 60),
	(7, 2, 'Drug Paraphernalia', 'Misdemeanor', '30 Seconds In Jail AND $500 Fine', 500, 30),
	(8, 2, 'Simple Possession', 'Misdemeanor', '30 Seconds In Jail AND/OR $1,000 Fine', 1000, 30),
	(10, 2, 'Stolen Weapon', 'Felony', '60 Seconds In Jail ', 0, 60),
	(11, 2, 'Illegal Possession of a Firearm', 'Felony', '60 Seconds In Jail ', 0, 60),
	(12, 2, 'Stolen Property', 'Felony', '60 Seconds In Jail ', 0, 60),
	(13, 2, 'Stolen ID', 'Felony', '60 Seconds In Jail ', 0, 60),
	(14, 2, 'Stolen Vehicle', 'Felony', '60 Seconds In Jail ', 0, 60),
	(15, 3, 'Assault', 'Misdemeanor', '30 Seconds In Jail AND/OR $1,000 Fine', 1000, 30),
	(16, 3, 'Assault W/ A Deadly Weapon', 'Felony', '60 Seconds In Jail ', 0, 60),
	(17, 3, 'Battery', 'Misdemeanor', '30 Seconds In Jail AND/OR $1,000 Fine', 1000, 30),
	(18, 3, 'Grand Theft Auto', 'Felony', '60 Seconds In Jail AND Up To $5,000 Fine', 5000, 60),
	(19, 3, 'Murder', 'Felony', '60+ Seconds In Jail', 0, 60),
	(20, 3, 'Manslaughter', 'Felony', '60+ Seconds In Jail ', 0, 60),
	(21, 4, 'Speeding 10-15', 'Traffic', '$234 Fine', 234, 0),
	(23, 4, 'Speeding 16-25', 'Traffic', '$360 Fine', 360, 0),
	(24, 4, 'Speeding 26+', 'Traffic', '$480 Fine', 480, 0),
	(25, 4, 'Speeding 100+', 'Traffic', '$1000 Fine', 1000, 0),
	(26, 4, 'DUI', 'Felony', '10+ Seconds In Jail AND/OR $400+ Fine', 400, 10),
	(27, 4, 'Reckless Driving', 'Misdemeanor', '20+ Seconds In Jail AND/OR $500+ Fine', 500, 20),
	(28, 4, 'Evading Arrest', 'Felony', '45+ Seconds In Jail AND/OR $1,000+ Fine', 1000, 45),
	(29, 4, 'Distracted Driving', 'Traffic', '$500 Fine', 500, 0),
	(30, 4, 'Driving Without A Helmet', 'Traffic', '$180 Fine', 180, 0),
	(31, 4, 'Failure to Stop', 'Traffic', '$300 Fine', 300, 0),
	(32, 4, 'Failure to Stop at Traffic Signal', 'Traffic', '$500 Fine', 500, 0),
	(33, 4, 'Parking Ticket', 'Traffic', '$50+ Fine', 50, 0);
/*!40000 ALTER TABLE `mdt_penal_charges` ENABLE KEYS */;

-- Dumping structure for table essentialmode.mdt_players
CREATE TABLE IF NOT EXISTS `mdt_players` (
  `id` int(11) DEFAULT NULL,
  `steam` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `name` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `code` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  KEY `steam` (`steam`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table essentialmode.mdt_players: ~0 rows (approximately)
/*!40000 ALTER TABLE `mdt_players` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdt_players` ENABLE KEYS */;

-- Dumping structure for table essentialmode.mdt_server
CREATE TABLE IF NOT EXISTS `mdt_server` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `players` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `uptime` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `aop` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `emergency` int(11) DEFAULT '0',
  `ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '0',
  `port` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '0',
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table essentialmode.mdt_server: ~1 rows (approximately)
/*!40000 ALTER TABLE `mdt_server` DISABLE KEYS */;
INSERT INTO `mdt_server` (`id`, `status`, `players`, `uptime`, `aop`, `emergency`, `ip`, `port`) VALUES
	(1, '2019-08-03 03:35:20', '0', '05h 52m', 'Blaine County', 0, '127.0.0.1', '30122');
/*!40000 ALTER TABLE `mdt_server` ENABLE KEYS */;

-- Dumping structure for table essentialmode.mdt_tickets
CREATE TABLE IF NOT EXISTS `mdt_tickets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `charaterId` int(11) DEFAULT NULL,
  `first` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `last` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `plateId` int(11) DEFAULT NULL,
  `plate` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `description` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `infraction` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `location` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `fine` int(11) DEFAULT NULL,
  `date` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `officer` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `notes` longtext COLLATE utf8mb4_bin,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table essentialmode.mdt_tickets: ~8 rows (approximately)
/*!40000 ALTER TABLE `mdt_tickets` DISABLE KEYS */;
INSERT INTO `mdt_tickets` (`id`, `charaterId`, `first`, `last`, `plateId`, `plate`, `description`, `infraction`, `location`, `fine`, `date`, `officer`, `notes`) VALUES
	(13, 49, 'Bruton', 'Gaster', 0, '811', '', '["Trespassing"]', 'Joshua Road', 1000, '08-05-2019 23:14:44', '2B-12 [SAHP]', NULL),
	(14, 49, 'Bruton', 'Gaster', 0, '', '', '["Theft"]', 'Joshua Road', 1000, '08-05-2019 23:17:39', '2B-12 [SAHP]', NULL),
	(15, 49, 'Bruton', 'Gaster', 0, '2FST4U4', 'Rusty Rebel - White', '["Destruction","Stolen Property"]', 'Joshua Road', 0, '08-17-2019 22:12:30', ' [SAHP]', NULL),
	(16, 49, 'Bruton', 'Gaster', 0, '2FST4U4', 'Rusty Rebel - White', '["Destruction","Stolen Property"]', 'Joshua Road', 0, '08-17-2019 22:12:36', ' [SAHP]', NULL),
	(17, 49, 'Bruton', 'Gaster', 0, '2FST4U', '', '["Stolen Weapon"]', 'Joshua Road', 0, '08-24-2019 13:18:22', '2B-12 [SAHP]', NULL),
	(18, 49, 'Bruton', 'Gaster', 0, '2FST4U4', 'Rusty Rebel - White', '["Assault W/ A Deadly Weapon"]', 'Joshua Road', 0, '08-24-2019 13:21:22', '2B-12 [SAHP]', NULL),
	(20, 49, 'Bruton', 'Gaster', 0, '2FST4U4', 'Rusty Rebel - White', '["Battery"]', 'Joshua Road', 1000, '08-24-2019 13:29:32', '2B-12 [SAHP]', NULL);
/*!40000 ALTER TABLE `mdt_tickets` ENABLE KEYS */;

-- Dumping structure for table essentialmode.mdt_users
CREATE TABLE IF NOT EXISTS `mdt_users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `password` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `name` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `admin` int(11) DEFAULT NULL,
  `steam` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '0',
  `code` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `suspend` int(11) NOT NULL DEFAULT '0',
  `role` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '[]',
  `pass_reset` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table essentialmode.mdt_users: ~2 rows (approximately)
/*!40000 ALTER TABLE `mdt_users` DISABLE KEYS */;
INSERT INTO `mdt_users` (`user_id`, `email`, `password`, `name`, `admin`, `steam`, `code`, `suspend`, `role`, `pass_reset`) VALUES
	(59, 'admin@user.com', '$2y$10$cBcNHETyixD5awlTIzEGZu7Mb8pWMegjOX2G9g1AgXa6D6TvKYBQW', 'Admin', 1, '123456', '(NULL)', 0, '{"4":{"name":"civ","departments":[]},"5":{"name":"leo","departments":{"BCSO":["Patrol","TRAFFIC","K9","DETECTIVE","SANDY","DRUG","AIR","MOTOR","SWAT"],"LSPD":["Patrol","K9","PA","TRAFFIC","DETECTIVE","VINEWOOD","DRUG","AIR","MOTOR","SWAT"],"SAHP":["Patrol","K9","AIR","MOTOR","SWAT","CVE"],"LSFD":["MEDIC"]}},"6":{"name":"dispatch","departments":[]}}', NULL);
/*!40000 ALTER TABLE `mdt_users` ENABLE KEYS */;

-- Dumping structure for table essentialmode.mdt_vehicles
CREATE TABLE IF NOT EXISTS `mdt_vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ownerID` int(11) DEFAULT '0',
  `characterID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `model` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `plate` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `description` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `reg` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `insurance` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `flags` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `save_data` longtext COLLATE utf8mb4_bin,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table essentialmode.mdt_vehicles: ~19 rows (approximately)
/*!40000 ALTER TABLE `mdt_vehicles` DISABLE KEYS */;
INSERT INTO `mdt_vehicles` (`id`, `ownerID`, `characterID`, `model`, `plate`, `description`, `reg`, `insurance`, `flags`, `save_data`) VALUES
	(17, 59, '49', 'Rusty Rebel', '2FST4U4', 'White', 'Valid', 'Valid', 'None', NULL),
	(18, 59, '49', 'Rusty Rebel', '41UIE708', 'White', 'Valid', 'Valid', 'None', NULL),
	(19, 59, '49', 'Asea', '84OJW514', 'White', 'Valid', 'Valid', 'None', NULL),
	(20, 59, '49', 'Asea', '83URN046', 'White', 'Valid', 'Valid', 'None', NULL),
	(21, 59, '49', 'Asea', '84OPT566', 'White', 'Valid', 'Valid', 'None', NULL),
	(22, 59, '49', 'Asea', '28YRB619', 'White', 'Valid', 'Valid', 'None', NULL),
	(24, 59, '49', 'Rusty Rebel', '60GKO585', 'White', 'Expired', 'Valid', 'None', NULL),
	(25, 59, '49', 'Rusty Rebel', '60TFB062', 'White', 'Valid', 'Valid', 'None', NULL),
	(26, 59, '49', 'Rusty Rebel', '69EBC716', 'White', 'Valid', 'Valid', 'None', NULL),
	(27, 59, '49', 'Rusty Rebel', '68ILT547', 'White', 'Valid', 'Valid', 'None', NULL),
	(28, 59, '49', 'Rusty Rebel', '04KJD627', 'White', 'Valid', 'Valid', 'None', NULL),
	(29, 59, '49', 'Rusty Rebel', '26KHF733', 'White', 'Valid', 'Valid', 'None', NULL),
	(30, 59, '49', 'Rusty Rebel', '01YCG884', 'White', 'Valid', 'Valid', 'None', NULL),
	(31, 59, '49', 'Asea', '26ZUL780', 'White', 'Valid', 'Valid', 'None', '{"extras":[10],"windowTint":-1,"custSecondaryColour":[],"mods":{"1":-1,"2":-1,"3":-1,"4":-1,"5":-1,"6":-1,"7":-1,"8":-1,"9":-1,"10":-1,"11":-1,"12":-1,"13":-1,"14":-1,"15":-1,"16":-1,"17":false,"18":false,"19":false,"20":false,"21":false,"22":false,"23":-1,"24":-1,"25":-1,"26":-1,"27":-1,"28":-1,"29":-1,"30":-1,"31":-1,"32":-1,"33":-1,"34":-1,"35":-1,"36":-1,"37":-1,"38":-1,"39":-1,"40":-1,"41":-1,"42":-1,"43":-1,"44":-1,"45":-1,"46":-1,"47":-1,"48":-1,"49":-1,"0":-1},"wheelType":5,"customTyres":false,"model":"-1809822327","primaryColour":29,"smokeColour":[255,255,255],"wheelColour":156,"secondaryColour":34,"neonColour":[255,0,255],"plateType":0,"mod1Colour":[6,-1,-1],"mod2Colour":[6,-1],"pearlColour":28,"neonToggles":[],"custPrimaryColour":[255,255,255],"burstableTyres":1,"livery":-1,"plateText":"26ZUL780"}'),
	(32, 61, '50', 'Rebel', '82BWW391', 'White', 'Valid', 'Valid', 'None', '{"extras":[1,3],"windowTint":-1,"custSecondaryColour":[],"mods":{"1":-1,"2":-1,"3":-1,"4":-1,"5":-1,"6":-1,"7":-1,"8":-1,"9":-1,"10":-1,"11":-1,"12":-1,"13":-1,"14":-1,"15":-1,"16":-1,"17":false,"18":false,"19":false,"20":false,"21":false,"22":false,"23":-1,"24":-1,"25":-1,"26":-1,"27":-1,"28":-1,"29":-1,"30":-1,"31":-1,"32":-1,"33":-1,"34":-1,"35":-1,"36":-1,"37":-1,"38":-1,"39":-1,"40":-1,"41":-1,"42":-1,"43":-1,"44":-1,"45":-1,"46":-1,"47":-1,"48":-1,"49":-1,"0":-1},"wheelType":4,"customTyres":false,"livery":-1,"primaryColour":4,"smokeColour":[255,255,255],"custPrimaryColour":[255,255,255],"model":"-2045594037","neonColour":[255,0,255],"plateType":3,"mod1Colour":[0,0,0],"mod2Colour":[0,0],"pearlColour":111,"neonToggles":[],"plateText":"82BWW391","burstableTyres":1,"secondaryColour":0,"wheelColour":156}'),
	(38, 59, '49', 'fgfd', 'dfgdfg', 'gdfgdf', 'Expired', 'Expired', 'dfgdf', NULL),
	(40, 61, '55', 'Rebel', 'woop', 'White', 'Valid', 'Valid', 'None', '{"extras":[1,3],"windowTint":-1,"custSecondaryColour":[],"mods":{"1":-1,"2":-1,"3":-1,"4":-1,"5":-1,"6":-1,"7":-1,"8":-1,"9":-1,"10":-1,"11":-1,"12":-1,"13":-1,"14":-1,"15":-1,"16":-1,"17":false,"18":false,"19":false,"20":false,"21":false,"22":false,"23":-1,"24":-1,"25":-1,"26":-1,"27":-1,"28":-1,"29":-1,"30":-1,"31":-1,"32":-1,"33":-1,"34":-1,"35":-1,"36":-1,"37":-1,"38":-1,"39":-1,"40":-1,"41":-1,"42":-1,"43":-1,"44":-1,"45":-1,"46":-1,"47":-1,"48":-1,"49":-1,"0":-1},"wheelType":4,"customTyres":false,"livery":-1,"primaryColour":4,"smokeColour":[255,255,255],"custPrimaryColour":[255,255,255],"model":"-2045594037","neonColour":[255,0,255],"plateType":3,"mod1Colour":[0,0,0],"mod2Colour":[0,0],"pearlColour":111,"neonToggles":[],"plateText":"82BWW391","burstableTyres":1,"secondaryColour":0,"wheelColour":156}'),
	(41, 61, '55', 'Rebel', '82BWW391', 'White', 'Valid', 'Valid', 'None', '{"extras":[1,3],"windowTint":-1,"custSecondaryColour":[],"mods":{"1":-1,"2":-1,"3":-1,"4":-1,"5":-1,"6":-1,"7":-1,"8":-1,"9":-1,"10":-1,"11":-1,"12":-1,"13":-1,"14":-1,"15":-1,"16":-1,"17":false,"18":false,"19":false,"20":false,"21":false,"22":false,"23":-1,"24":-1,"25":-1,"26":-1,"27":-1,"28":-1,"29":-1,"30":-1,"31":-1,"32":-1,"33":-1,"34":-1,"35":-1,"36":-1,"37":-1,"38":-1,"39":-1,"40":-1,"41":-1,"42":-1,"43":-1,"44":-1,"45":-1,"46":-1,"47":-1,"48":-1,"49":-1,"0":-1},"wheelType":4,"customTyres":false,"livery":-1,"primaryColour":4,"smokeColour":[255,255,255],"custPrimaryColour":[255,255,255],"model":"-2045594037","neonColour":[255,0,255],"plateType":3,"mod1Colour":[0,0,0],"mod2Colour":[0,0],"pearlColour":111,"neonToggles":[],"plateText":"82BWW391","burstableTyres":1,"secondaryColour":0,"wheelColour":156}'),
	(42, 61, '55', 'Rebel', '82BWW391', 'White', 'Valid', 'Valid', 'None', '{"extras":[1,3],"windowTint":-1,"custSecondaryColour":[],"mods":{"1":-1,"2":-1,"3":-1,"4":-1,"5":-1,"6":-1,"7":-1,"8":-1,"9":-1,"10":-1,"11":-1,"12":-1,"13":-1,"14":-1,"15":-1,"16":-1,"17":false,"18":false,"19":false,"20":false,"21":false,"22":false,"23":-1,"24":-1,"25":-1,"26":-1,"27":-1,"28":-1,"29":-1,"30":-1,"31":-1,"32":-1,"33":-1,"34":-1,"35":-1,"36":-1,"37":-1,"38":-1,"39":-1,"40":-1,"41":-1,"42":-1,"43":-1,"44":-1,"45":-1,"46":-1,"47":-1,"48":-1,"49":-1,"0":-1},"wheelType":4,"customTyres":false,"livery":-1,"primaryColour":4,"smokeColour":[255,255,255],"custPrimaryColour":[255,255,255],"model":"-2045594037","neonColour":[255,0,255],"plateType":3,"mod1Colour":[0,0,0],"mod2Colour":[0,0],"pearlColour":111,"neonToggles":[],"plateText":"82BWW391","burstableTyres":1,"secondaryColour":0,"wheelColour":156}'),
	(43, 61, '55', 'Rebel', '82BWW391', 'White', 'Valid', 'Valid', 'None', '{"extras":[1,3],"windowTint":-1,"custSecondaryColour":[],"mods":{"1":-1,"2":-1,"3":-1,"4":-1,"5":-1,"6":-1,"7":-1,"8":-1,"9":-1,"10":-1,"11":-1,"12":-1,"13":-1,"14":-1,"15":-1,"16":-1,"17":false,"18":false,"19":false,"20":false,"21":false,"22":false,"23":-1,"24":-1,"25":-1,"26":-1,"27":-1,"28":-1,"29":-1,"30":-1,"31":-1,"32":-1,"33":-1,"34":-1,"35":-1,"36":-1,"37":-1,"38":-1,"39":-1,"40":-1,"41":-1,"42":-1,"43":-1,"44":-1,"45":-1,"46":-1,"47":-1,"48":-1,"49":-1,"0":-1},"wheelType":4,"customTyres":false,"livery":-1,"primaryColour":4,"smokeColour":[255,255,255],"custPrimaryColour":[255,255,255],"model":"-2045594037","neonColour":[255,0,255],"plateType":3,"mod1Colour":[0,0,0],"mod2Colour":[0,0],"pearlColour":111,"neonToggles":[],"plateText":"82BWW391","burstableTyres":1,"secondaryColour":0,"wheelColour":156}');
/*!40000 ALTER TABLE `mdt_vehicles` ENABLE KEYS */;

-- Dumping structure for table essentialmode.mdt_warnings
CREATE TABLE IF NOT EXISTS `mdt_warnings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `charaterId` int(11) DEFAULT NULL,
  `first` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `last` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `plateId` int(11) DEFAULT NULL,
  `plate` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `description` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `infraction` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `location` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `date` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `officer` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- Dumping data for table essentialmode.mdt_warnings: ~2 rows (approximately)
/*!40000 ALTER TABLE `mdt_warnings` DISABLE KEYS */;
INSERT INTO `mdt_warnings` (`id`, `charaterId`, `first`, `last`, `plateId`, `plate`, `description`, `infraction`, `location`, `date`, `officer`) VALUES
	(14, 49, 'Bruton', 'Gaster', 0, '2FST4U4', 'Rusty Rebel - White', '["Stolen Weapon"]', 'Joshua Road', '08-24-2019 13:40:18', '2B-12 [SAHP]'),
	(15, 49, 'Bruton', 'Gaster', 0, '2FST4U4', 'Rusty Rebel - White', '["Battery"]', 'Joshua Road', '08-24-2019 13:42:12', '2B-12 [SAHP]');
/*!40000 ALTER TABLE `mdt_warnings` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

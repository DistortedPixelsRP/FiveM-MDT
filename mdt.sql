
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table test.active_users
CREATE TABLE IF NOT EXISTS `active_users` (
  `user_id` int(11) DEFAULT NULL,
  `server` int(11) DEFAULT NULL,
  `callID` int(11) DEFAULT '0',
  `identifier` varchar(50) DEFAULT NULL,
  `status` varchar(255) DEFAULT '10-42',
  `department` varchar(255) DEFAULT NULL,
  `divison` varchar(255) DEFAULT NULL,
  `logout` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table test.active_users: ~0 rows (approximately)
/*!40000 ALTER TABLE `active_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `active_users` ENABLE KEYS */;

-- Dumping structure for table test.aop_names
CREATE TABLE IF NOT EXISTS `aop_names` (
  `name` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table test.aop_names: ~4 rows (approximately)
/*!40000 ALTER TABLE `aop_names` DISABLE KEYS */;
INSERT INTO `aop_names` (`name`) VALUES
	('Statewide'),
	('Blaine County'),
	('Los Santos'),
	('Sandy Shores & Surrounding Area');
/*!40000 ALTER TABLE `aop_names` ENABLE KEYS */;

-- Dumping structure for table test.arrests
CREATE TABLE IF NOT EXISTS `arrests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `charaterId` int(11) DEFAULT NULL,
  `first` varchar(50) DEFAULT NULL,
  `last` varchar(50) DEFAULT NULL,
  `plateId` int(11) DEFAULT NULL,
  `plate` varchar(50) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `infraction` varchar(50) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `fine` varchar(50) DEFAULT NULL,
  `jail` varchar(50) DEFAULT NULL,
  `date` varchar(50) DEFAULT NULL,
  `officer` varchar(50) DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table test.arrests: ~6 rows (approximately)
/*!40000 ALTER TABLE `arrests` DISABLE KEYS */;
/*!40000 ALTER TABLE `arrests` ENABLE KEYS */;

-- Dumping structure for table test.ban
CREATE TABLE IF NOT EXISTS `ban` (
  `steam` text,
  `reason` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table test.ban: ~0 rows (approximately)
/*!40000 ALTER TABLE `ban` DISABLE KEYS */;
/*!40000 ALTER TABLE `ban` ENABLE KEYS */;

-- Dumping structure for table test.calls
CREATE TABLE IF NOT EXISTS `calls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT '0',
  `location` varchar(50) DEFAULT NULL,
  `details` text,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table test.calls: ~2 rows (approximately)
/*!40000 ALTER TABLE `calls` DISABLE KEYS */;
/*!40000 ALTER TABLE `calls` ENABLE KEYS */;

-- Dumping structure for table test.call_type
CREATE TABLE IF NOT EXISTS `call_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table test.call_type: ~34 rows (approximately)
/*!40000 ALTER TABLE `call_type` DISABLE KEYS */;
INSERT INTO `call_type` (`id`, `name`) VALUES
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
/*!40000 ALTER TABLE `call_type` ENABLE KEYS */;

-- Dumping structure for table test.characters
CREATE TABLE IF NOT EXISTS `characters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ownerID` int(11) DEFAULT NULL,
  `first` varchar(50) DEFAULT '0',
  `last` varchar(50) DEFAULT '0',
  `dob` varchar(50) DEFAULT '0',
  `gender` varchar(50) DEFAULT '0',
  `address` varchar(50) DEFAULT '0',
  `lic` varchar(50) DEFAULT '0',
  `weapon` varchar(50) DEFAULT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table test.characters: ~3 rows (approximately)
/*!40000 ALTER TABLE `characters` DISABLE KEYS */;
/*!40000 ALTER TABLE `characters` ENABLE KEYS */;

-- Dumping structure for table test.departments
CREATE TABLE IF NOT EXISTS `departments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `abbreviation` varchar(50) NOT NULL,
  `icon` varchar(50) NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table test.departments: ~3 rows (approximately)
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` (`id`, `name`, `abbreviation`, `icon`) VALUES
	(1, 'San Andreas Highway Patrol', 'SAHP', 'SAHP'),
	(2, 'Blaine County Sheriffs Office', 'BCSO', 'BCSO'),
	(3, 'Los Santos Police Department', 'LSPD', 'LSPD');
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;

-- Dumping structure for table test.divisions
CREATE TABLE IF NOT EXISTS `divisions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `departmentID` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `abbreviation` varchar(50) NOT NULL,
  `icon` varchar(50) NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table test.divisions: ~25 rows (approximately)
/*!40000 ALTER TABLE `divisions` DISABLE KEYS */;
INSERT INTO `divisions` (`id`, `departmentID`, `name`, `abbreviation`, `icon`) VALUES
	(1, 3, 'Patrol', 'Patrol', 'LSPD'),
	(2, 3, 'K9', 'K9', 'K9'),
	(3, 3, 'Port Authority', 'PA', 'PA'),
	(4, 3, 'Traffic', 'TRAFFIC', 'traffic'),
	(5, 2, 'Patrol', ' ', 'BCSO'),
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
	(25, 1, 'CVE', 'CVE', 'cve');
/*!40000 ALTER TABLE `divisions` ENABLE KEYS */;

-- Dumping structure for table test.penal_category
CREATE TABLE IF NOT EXISTS `penal_category` (
  `id` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table test.penal_category: ~4 rows (approximately)
/*!40000 ALTER TABLE `penal_category` DISABLE KEYS */;
INSERT INTO `penal_category` (`id`, `name`) VALUES
	(1, 'Property'),
	(2, 'Possession'),
	(3, 'Violent Crimes'),
	(4, 'Traffic');
/*!40000 ALTER TABLE `penal_category` ENABLE KEYS */;

-- Dumping structure for table test.penal_charges
CREATE TABLE IF NOT EXISTS `penal_charges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cat` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `punishment` text,
  `fine` int(11) DEFAULT NULL,
  `jail` int(11) DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table test.penal_charges: ~0 rows (approximately)
/*!40000 ALTER TABLE `penal_charges` DISABLE KEYS */;
INSERT INTO `penal_charges` (`id`, `cat`, `name`, `type`, `punishment`, `fine`, `jail`) VALUES
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
/*!40000 ALTER TABLE `penal_charges` ENABLE KEYS */;

-- Dumping structure for table test.players
CREATE TABLE IF NOT EXISTS `players` (
  `id` int(11) DEFAULT NULL,
  `steam` char(50) DEFAULT NULL,
  `name` char(50) DEFAULT NULL,
  `code` char(50) DEFAULT NULL,
  KEY `steam` (`steam`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table test.players: ~0 rows (approximately)
/*!40000 ALTER TABLE `players` DISABLE KEYS */;
/*!40000 ALTER TABLE `players` ENABLE KEYS */;

-- Dumping structure for table test.server
CREATE TABLE IF NOT EXISTS `server` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(50) DEFAULT NULL,
  `aop` varchar(50) DEFAULT NULL,
  `emergency` int(11) DEFAULT '0',
  `ip` varchar(50) DEFAULT '0',
  `port` varchar(50) DEFAULT '0',
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table test.server: ~0 rows (approximately)
/*!40000 ALTER TABLE `server` DISABLE KEYS */;
INSERT INTO `server` (`id`, `status`, `aop`, `emergency`, `ip`, `port`) VALUES
	(1, 'offline', 'Sandy Shores & Surrounding Area', 0, 'localhost', '30120');
/*!40000 ALTER TABLE `server` ENABLE KEYS */;

-- Dumping structure for table test.tickets
CREATE TABLE IF NOT EXISTS `tickets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `charaterId` int(11) DEFAULT NULL,
  `first` varchar(50) DEFAULT NULL,
  `last` varchar(50) DEFAULT NULL,
  `plateId` int(11) DEFAULT NULL,
  `plate` varchar(50) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `infraction` text,
  `location` varchar(50) DEFAULT NULL,
  `fine` int(11) DEFAULT NULL,
  `date` varchar(50) DEFAULT NULL,
  `officer` varchar(50) DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table test.tickets: ~0 rows (approximately)
/*!40000 ALTER TABLE `tickets` DISABLE KEYS */;
/*!40000 ALTER TABLE `tickets` ENABLE KEYS */;

-- Dumping structure for table test.users
CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `password` text,
  `name` text,
  `admin` int(11) DEFAULT NULL,
  `steam` varchar(500) DEFAULT '0',
  `code` varchar(50) DEFAULT NULL,
  `suspend` int(11) DEFAULT '0',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=latin1;

-- Dumping data for table test.users: ~0 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Dumping structure for table test.vehicles
CREATE TABLE IF NOT EXISTS `vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ownerID` int(11) DEFAULT '0',
  `characterID` varchar(50) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `plate` varchar(50) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `reg` varchar(50) DEFAULT NULL,
  `insurance` varchar(50) DEFAULT NULL,
  `flags` varchar(50) DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table test.vehicles: ~0 rows (approximately)
/*!40000 ALTER TABLE `vehicles` DISABLE KEYS */;
/*!40000 ALTER TABLE `vehicles` ENABLE KEYS */;

-- Dumping structure for table test.warnings
CREATE TABLE IF NOT EXISTS `warnings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `charaterId` int(11) DEFAULT NULL,
  `first` varchar(50) DEFAULT NULL,
  `last` varchar(50) DEFAULT NULL,
  `plateId` int(11) DEFAULT NULL,
  `plate` varchar(50) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `infraction` text,
  `location` varchar(50) DEFAULT NULL,
  `date` varchar(50) DEFAULT NULL,
  `officer` varchar(50) DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table test.warnings: ~0 rows (approximately)
/*!40000 ALTER TABLE `warnings` DISABLE KEYS */;
/*!40000 ALTER TABLE `warnings` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

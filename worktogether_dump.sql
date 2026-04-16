-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: worktogether
-- ------------------------------------------------------
-- Server version	8.0.40

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `accountant`
--

DROP TABLE IF EXISTS `accountant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accountant` (
  `id` int NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FK_E7681183BF396750` FOREIGN KEY (`id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accountant`
--

LOCK TABLES `accountant` WRITE;
/*!40000 ALTER TABLE `accountant` DISABLE KEYS */;
INSERT INTO `accountant` VALUES (36);
/*!40000 ALTER TABLE `accountant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `administrator`
--

DROP TABLE IF EXISTS `administrator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `administrator` (
  `id` int NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FK_58DF0651BF396750` FOREIGN KEY (`id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrator`
--

LOCK TABLES `administrator` WRITE;
/*!40000 ALTER TABLE `administrator` DISABLE KEYS */;
INSERT INTO `administrator` VALUES (35);
/*!40000 ALTER TABLE `administrator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bay`
--

DROP TABLE IF EXISTS `bay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bay` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL,
  `capacity_unit` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bay`
--

LOCK TABLES `bay` WRITE;
/*!40000 ALTER TABLE `bay` DISABLE KEYS */;
INSERT INTO `bay` VALUES (91,'B001',42),(92,'B002',42),(93,'B003',42),(94,'B004',42),(95,'B005',42),(96,'B006',42),(97,'B007',42),(98,'B008',42),(99,'B009',42),(100,'B010',42),(101,'B011',42),(102,'B012',42),(103,'B013',42),(104,'B014',42),(105,'B015',42),(106,'B016',42),(107,'B017',42),(108,'B018',42),(109,'B019',42),(110,'B020',42),(111,'B021',42),(112,'B022',42),(113,'B023',42),(114,'B024',42),(115,'B025',42),(116,'B026',42),(117,'B027',42),(118,'B028',42),(119,'B029',42),(120,'B030',42);
/*!40000 ALTER TABLE `bay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company` (
  `siret` varchar(14) NOT NULL,
  `company_name` varchar(100) NOT NULL,
  `id` int NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FK_4FBF094FBF396750` FOREIGN KEY (`id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES ('12345678901234','TechCorp SAS',45),('98765432109876','DataSoft SARL',46),('11223344556677','CloudNet SA',47);
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `adress` varchar(200) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `invoice_adress` varchar(200) NOT NULL,
  `id` int NOT NULL,
  `auth_key` varchar(200) NOT NULL,
  `feedback_make` smallint NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FK_81398E09BF396750` FOREIGN KEY (`id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES ('1 rue de la Paix, Paris','0601010101','1 rue de la Paix, Paris',42,'',0),('5 avenue Victor Hugo, Lyon','0602020202','5 avenue Victor Hugo, Lyon',43,'',0),('12 rue du Moulin, Bordeaux','0603030303','12 rue du Moulin, Bordeaux',44,'',0),('1 rue Basse, Nantes','0701010101','1 rue Basse, Nantes',45,'',0),('8 boulevard Haussmann, Paris','0702020202','8 boulevard Haussmann, Paris',46,'',0),('3 rue de la République, Lille','0703030303','3 rue de la République, Lille',47,'',0);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctrine_migration_versions`
--

LOCK TABLES `doctrine_migration_versions` WRITE;
/*!40000 ALTER TABLE `doctrine_migration_versions` DISABLE KEYS */;
INSERT INTO `doctrine_migration_versions` VALUES ('DoctrineMigrations\\Version20260313123752','2026-03-13 12:58:02',544),('DoctrineMigrations\\Version20260313124419','2026-03-13 12:58:03',19),('DoctrineMigrations\\Version20260321163238','2026-03-21 16:32:55',107),('DoctrineMigrations\\Version20260321164154','2026-03-21 16:42:00',214),('DoctrineMigrations\\Version20260324150347','2026-03-24 15:03:51',28);
/*!40000 ALTER TABLE `doctrine_migration_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `intervention`
--

DROP TABLE IF EXISTS `intervention`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `intervention` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(50) NOT NULL,
  `description` longtext NOT NULL,
  `begin_date` datetime NOT NULL,
  `finish_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `intervention`
--

LOCK TABLES `intervention` WRITE;
/*!40000 ALTER TABLE `intervention` DISABLE KEYS */;
INSERT INTO `intervention` VALUES (10,'incident','Panne électrique sur le serveur','2026-02-10 08:00:00','2026-02-10 10:00:00'),(11,'maintenance','Remplacement disque dur défaillant','2026-02-15 09:00:00','2026-02-15 11:00:00'),(12,'upgrade','Mise à jour firmware baie B002','2026-03-01 14:00:00','2026-03-01 16:00:00'),(13,'incident','Surchauffe détectée sur unité U01','2026-03-10 07:00:00','2026-03-10 09:30:00');
/*!40000 ALTER TABLE `intervention` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `intervention_unit`
--

DROP TABLE IF EXISTS `intervention_unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `intervention_unit` (
  `intervention_id` int NOT NULL,
  `unit_id` int NOT NULL,
  PRIMARY KEY (`intervention_id`,`unit_id`),
  KEY `IDX_D30414918EAE3863` (`intervention_id`),
  KEY `IDX_D3041491F8BD700D` (`unit_id`),
  CONSTRAINT `FK_D30414918EAE3863` FOREIGN KEY (`intervention_id`) REFERENCES `intervention` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_D3041491F8BD700D` FOREIGN KEY (`unit_id`) REFERENCES `unit` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `intervention_unit`
--

LOCK TABLES `intervention_unit` WRITE;
/*!40000 ALTER TABLE `intervention_unit` DISABLE KEYS */;
INSERT INTO `intervention_unit` VALUES (10,3781),(11,3782),(12,3823),(13,3781);
/*!40000 ALTER TABLE `intervention_unit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notice`
--

DROP TABLE IF EXISTS `notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notice` (
  `id` int NOT NULL AUTO_INCREMENT,
  `comment` longtext NOT NULL,
  `note` smallint NOT NULL,
  `customer_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_480D45C29395C3F3` (`customer_id`),
  CONSTRAINT `FK_480D45C29395C3F3` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notice`
--

LOCK TABLES `notice` WRITE;
/*!40000 ALTER TABLE `notice` DISABLE KEYS */;
INSERT INTO `notice` VALUES (11,'Service excellent, infrastructure très fiable. Je recommande vivement !',5,42),(12,'Très bon service, équipe réactive. Quelques petites améliorations possibles.',4,43),(13,'Service correct mais les délais de réponse du support pourraient être améliorés.',3,45),(14,'Parfait pour nos besoins, aucune interruption depuis 6 mois. Excellent rapport qualité/prix.',5,46),(15,'Déçu par la qualité du support lors d\'un incident. Temps de résolution trop long.',2,44);
/*!40000 ALTER TABLE `notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offer`
--

DROP TABLE IF EXISTS `offer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `offer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `nb_unit` int NOT NULL,
  `price` int NOT NULL,
  `version` int NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offer`
--

LOCK TABLES `offer` WRITE;
/*!40000 ALTER TABLE `offer` DISABLE KEYS */;
INSERT INTO `offer` VALUES (18,'Offre de base',1,100,1,1,'2026-03-24 11:28:05'),(19,'Offre Start-Up',10,900,2,1,'2026-03-24 11:28:05'),(20,'Offre PME',21,1680,1,1,'2026-03-24 11:28:05'),(21,'Offre Entreprise',42,2940,1,1,'2026-03-24 11:28:05'),(22,'Offre Start-Up',10,800,1,0,'2025-01-01 00:00:00');
/*!40000 ALTER TABLE `offer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `particular`
--

DROP TABLE IF EXISTS `particular`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `particular` (
  `gender` varchar(14) NOT NULL,
  `id` int NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FK_862161CFBF396750` FOREIGN KEY (`id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `particular`
--

LOCK TABLES `particular` WRITE;
/*!40000 ALTER TABLE `particular` DISABLE KEYS */;
INSERT INTO `particular` VALUES ('Monsieur',42),('Madame',43),('Monsieur',44);
/*!40000 ALTER TABLE `particular` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `begin_date` datetime NOT NULL,
  `finish_date` datetime NOT NULL,
  `status` varchar(255) NOT NULL,
  `reservation_offer` int DEFAULT NULL,
  `customer_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_42C849556AA95799` (`reservation_offer`),
  KEY `IDX_42C849559395C3F3` (`customer_id`),
  CONSTRAINT `FK_42C849556AA95799` FOREIGN KEY (`reservation_offer`) REFERENCES `offer` (`id`),
  CONSTRAINT `FK_42C849559395C3F3` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
INSERT INTO `reservation` VALUES (15,'2026-01-01 00:00:00','2026-02-01 00:00:00','Confirmée',18,42),(16,'2026-02-01 00:00:00','2026-03-01 00:00:00','Confirmée',19,43),(17,'2026-03-01 00:00:00','2027-03-01 00:00:00','Confirmée',20,45),(18,'2026-01-15 00:00:00','2026-02-15 00:00:00','Annulée',18,46),(19,'2026-04-01 00:00:00','2027-04-01 00:00:00','En attente',21,44);
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation_unit`
--

DROP TABLE IF EXISTS `reservation_unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation_unit` (
  `reservation_id` int NOT NULL,
  `unit_id` int NOT NULL,
  PRIMARY KEY (`reservation_id`,`unit_id`),
  KEY `IDX_CA82C13BB83297E7` (`reservation_id`),
  KEY `IDX_CA82C13BF8BD700D` (`unit_id`),
  CONSTRAINT `FK_CA82C13BB83297E7` FOREIGN KEY (`reservation_id`) REFERENCES `reservation` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_CA82C13BF8BD700D` FOREIGN KEY (`unit_id`) REFERENCES `unit` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation_unit`
--

LOCK TABLES `reservation_unit` WRITE;
/*!40000 ALTER TABLE `reservation_unit` DISABLE KEYS */;
INSERT INTO `reservation_unit` VALUES (15,3781),(16,3782),(17,3823),(18,3781),(19,3782);
/*!40000 ALTER TABLE `reservation_unit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `support`
--

DROP TABLE IF EXISTS `support`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `support` (
  `id` int NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FK_8004EBA5BF396750` FOREIGN KEY (`id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `support`
--

LOCK TABLES `support` WRITE;
/*!40000 ALTER TABLE `support` DISABLE KEYS */;
INSERT INTO `support` VALUES (37),(38);
/*!40000 ALTER TABLE `support` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `technician`
--

DROP TABLE IF EXISTS `technician`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `technician` (
  `phone` varchar(14) NOT NULL,
  `level` smallint NOT NULL,
  `id` int NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FK_F244E948BF396750` FOREIGN KEY (`id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `technician`
--

LOCK TABLES `technician` WRITE;
/*!40000 ALTER TABLE `technician` DISABLE KEYS */;
INSERT INTO `technician` VALUES ('0611111111',3,39),('0622222222',2,40),('0633333333',1,41);
/*!40000 ALTER TABLE `technician` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket` (
  `id` int NOT NULL AUTO_INCREMENT,
  `subject` varchar(50) NOT NULL,
  `description` longtext NOT NULL,
  `open_date` datetime NOT NULL,
  `close_date` datetime DEFAULT NULL,
  `status` varchar(255) NOT NULL,
  `customer_id` int NOT NULL,
  `assigned_by_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_97A0ADA39395C3F3` (`customer_id`),
  KEY `IDX_97A0ADA36E6F1246` (`assigned_by_id`),
  CONSTRAINT `FK_97A0ADA36E6F1246` FOREIGN KEY (`assigned_by_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_97A0ADA39395C3F3` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
INSERT INTO `ticket` VALUES (11,'Problème de connexion SSH','Impossible de me connecter en SSH à mon serveur depuis hier soir.','2026-03-24 11:28:05',NULL,'Ouvert',42,NULL),(12,'Surchauffe unité U05','L\'unité U05 de la baie B001 affiche une température anormale.','2026-03-24 11:28:05',NULL,'En cours',45,35),(13,'Facturation incorrecte','Ma facture du mois de février ne correspond pas à mon offre souscrite.','2026-03-24 11:28:05','2026-03-15 10:00:00','Résolu',43,35),(14,'Demande d\'extension de contrat','Nous souhaitons passer de l\'offre Start-Up à l\'offre PME.','2026-03-24 11:28:05',NULL,'Ouvert',46,NULL),(15,'Perte de paquets réseau','Nous constatons une perte de paquets importante sur nos unités.','2026-03-24 11:28:05',NULL,'En cours',47,35);
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket_technician`
--

DROP TABLE IF EXISTS `ticket_technician`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket_technician` (
  `ticket_id` int NOT NULL,
  `technician_id` int NOT NULL,
  PRIMARY KEY (`ticket_id`,`technician_id`),
  KEY `IDX_64D77B1C700047D2` (`ticket_id`),
  KEY `IDX_64D77B1CE6C5D496` (`technician_id`),
  CONSTRAINT `FK_64D77B1C700047D2` FOREIGN KEY (`ticket_id`) REFERENCES `ticket` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_64D77B1CE6C5D496` FOREIGN KEY (`technician_id`) REFERENCES `technician` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_technician`
--

LOCK TABLES `ticket_technician` WRITE;
/*!40000 ALTER TABLE `ticket_technician` DISABLE KEYS */;
INSERT INTO `ticket_technician` VALUES (12,39),(13,40),(15,41);
/*!40000 ALTER TABLE `ticket_technician` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unit`
--

DROP TABLE IF EXISTS `unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unit` (
  `id` int NOT NULL AUTO_INCREMENT,
  `position` int NOT NULL,
  `name` varchar(30) NOT NULL,
  `status` varchar(255) NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  `power_consumption` int DEFAULT NULL,
  `temperature` double DEFAULT NULL,
  `network_throughput` double DEFAULT NULL,
  `bay_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_DCBB0C53DF9BA23B` (`bay_id`),
  CONSTRAINT `FK_DCBB0C53DF9BA23B` FOREIGN KEY (`bay_id`) REFERENCES `bay` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5041 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unit`
--

LOCK TABLES `unit` WRITE;
/*!40000 ALTER TABLE `unit` DISABLE KEYS */;
INSERT INTO `unit` VALUES (3781,1,'U01','Occupé',NULL,166,20.7,4,91),(3782,2,'U02','Occupé',NULL,252,20.3,1,91),(3783,3,'U03','Libre',NULL,363,21,8,91),(3784,4,'U04','Libre',NULL,475,25.7,2,91),(3785,5,'U05','Libre',NULL,420,20.5,8,91),(3786,6,'U06','Libre',NULL,373,21.4,7,91),(3787,7,'U07','Libre',NULL,295,20.5,1,91),(3788,8,'U08','Libre',NULL,364,26.1,6,91),(3789,9,'U09','Libre',NULL,224,19.8,3,91),(3790,10,'U10','Libre',NULL,478,24.7,9,91),(3791,11,'U11','Libre',NULL,162,19.9,9,91),(3792,12,'U12','Libre',NULL,168,24.1,4,91),(3793,13,'U13','Libre',NULL,408,18.6,2,91),(3794,14,'U14','Libre',NULL,371,22.9,2,91),(3795,15,'U15','Libre',NULL,299,26.8,1,91),(3796,16,'U16','Libre',NULL,298,26.4,9,91),(3797,17,'U17','Libre',NULL,322,18.8,9,91),(3798,18,'U18','Libre',NULL,266,23.7,5,91),(3799,19,'U19','Libre',NULL,118,22.6,6,91),(3800,20,'U20','Libre',NULL,177,20.1,4,91),(3801,21,'U21','Libre',NULL,126,26.9,3,91),(3802,22,'U22','Libre',NULL,444,26.9,1,91),(3803,23,'U23','Libre',NULL,458,19.2,6,91),(3804,24,'U24','Libre',NULL,287,20.5,2,91),(3805,25,'U25','Libre',NULL,279,22.2,10,91),(3806,26,'U26','Libre',NULL,122,22.8,8,91),(3807,27,'U27','Libre',NULL,208,26.7,10,91),(3808,28,'U28','Libre',NULL,340,25,10,91),(3809,29,'U29','Libre',NULL,398,18.9,6,91),(3810,30,'U30','Libre',NULL,186,23.9,6,91),(3811,31,'U31','Libre',NULL,158,26,10,91),(3812,32,'U32','Libre',NULL,438,24.3,4,91),(3813,33,'U33','Libre',NULL,377,20.1,1,91),(3814,34,'U34','Libre',NULL,418,25.9,7,91),(3815,35,'U35','Libre',NULL,332,26.1,1,91),(3816,36,'U36','Libre',NULL,179,25,4,91),(3817,37,'U37','Libre',NULL,209,23.1,2,91),(3818,38,'U38','Libre',NULL,340,24.4,10,91),(3819,39,'U39','Libre',NULL,424,24.7,1,91),(3820,40,'U40','Libre',NULL,247,21.4,1,91),(3821,41,'U41','Libre',NULL,144,23.1,1,91),(3822,42,'U42','Libre',NULL,351,24.1,3,91),(3823,1,'U01','Occupé',NULL,398,21.1,8,92),(3824,2,'U02','Libre',NULL,337,24.5,5,92),(3825,3,'U03','Libre',NULL,392,25.8,5,92),(3826,4,'U04','Libre',NULL,243,24,8,92),(3827,5,'U05','Libre',NULL,365,21.8,1,92),(3828,6,'U06','Libre',NULL,241,25.1,2,92),(3829,7,'U07','Libre',NULL,321,18.2,9,92),(3830,8,'U08','Libre',NULL,181,25.2,9,92),(3831,9,'U09','Libre',NULL,288,22.7,9,92),(3832,10,'U10','Libre',NULL,312,26.3,7,92),(3833,11,'U11','Libre',NULL,129,22,9,92),(3834,12,'U12','Libre',NULL,306,20.4,2,92),(3835,13,'U13','Libre',NULL,373,20.9,10,92),(3836,14,'U14','Libre',NULL,231,22.5,1,92),(3837,15,'U15','Libre',NULL,123,23.4,3,92),(3838,16,'U16','Libre',NULL,232,21.5,5,92),(3839,17,'U17','Libre',NULL,298,22.3,9,92),(3840,18,'U18','Libre',NULL,115,21.1,2,92),(3841,19,'U19','Libre',NULL,191,21.4,2,92),(3842,20,'U20','Libre',NULL,339,24.1,4,92),(3843,21,'U21','Libre',NULL,199,20.2,2,92),(3844,22,'U22','Libre',NULL,123,18.8,4,92),(3845,23,'U23','Libre',NULL,457,21,5,92),(3846,24,'U24','Libre',NULL,428,19.7,9,92),(3847,25,'U25','Libre',NULL,168,22.3,1,92),(3848,26,'U26','Libre',NULL,460,24,5,92),(3849,27,'U27','Libre',NULL,144,24.1,3,92),(3850,28,'U28','Libre',NULL,194,26.7,4,92),(3851,29,'U29','Libre',NULL,450,21.5,1,92),(3852,30,'U30','Libre',NULL,109,22.6,5,92),(3853,31,'U31','Libre',NULL,422,25.1,9,92),(3854,32,'U32','Libre',NULL,265,18.9,5,92),(3855,33,'U33','Libre',NULL,313,25.9,6,92),(3856,34,'U34','Libre',NULL,119,25,9,92),(3857,35,'U35','Libre',NULL,441,19.3,3,92),(3858,36,'U36','Libre',NULL,103,24.2,1,92),(3859,37,'U37','Libre',NULL,462,25.7,3,92),(3860,38,'U38','Libre',NULL,412,25.8,1,92),(3861,39,'U39','Libre',NULL,329,24.3,10,92),(3862,40,'U40','Libre',NULL,223,18.5,1,92),(3863,41,'U41','Libre',NULL,275,22.2,1,92),(3864,42,'U42','Libre',NULL,316,22.5,2,92),(3865,1,'U01','Libre',NULL,336,23.6,3,93),(3866,2,'U02','Libre',NULL,316,26.1,1,93),(3867,3,'U03','Libre',NULL,336,22,7,93),(3868,4,'U04','Libre',NULL,297,20.5,1,93),(3869,5,'U05','Libre',NULL,454,21,5,93),(3870,6,'U06','Libre',NULL,157,23.5,4,93),(3871,7,'U07','Libre',NULL,112,24.6,1,93),(3872,8,'U08','Libre',NULL,187,21.9,2,93),(3873,9,'U09','Libre',NULL,290,22,6,93),(3874,10,'U10','Libre',NULL,399,21.9,8,93),(3875,11,'U11','Libre',NULL,121,24.2,1,93),(3876,12,'U12','Libre',NULL,454,18.2,4,93),(3877,13,'U13','Libre',NULL,265,26.2,4,93),(3878,14,'U14','Libre',NULL,456,22.1,5,93),(3879,15,'U15','Libre',NULL,449,26.4,6,93),(3880,16,'U16','Libre',NULL,500,20,2,93),(3881,17,'U17','Libre',NULL,329,19,9,93),(3882,18,'U18','Libre',NULL,436,19.6,1,93),(3883,19,'U19','Libre',NULL,103,25,3,93),(3884,20,'U20','Libre',NULL,417,18.2,9,93),(3885,21,'U21','Libre',NULL,267,23.4,8,93),(3886,22,'U22','Libre',NULL,336,24,7,93),(3887,23,'U23','Libre',NULL,323,25,3,93),(3888,24,'U24','Libre',NULL,198,19.5,4,93),(3889,25,'U25','Libre',NULL,498,19.7,6,93),(3890,26,'U26','Libre',NULL,299,21,5,93),(3891,27,'U27','Libre',NULL,206,20.5,2,93),(3892,28,'U28','Libre',NULL,462,20.9,2,93),(3893,29,'U29','Libre',NULL,467,20.9,10,93),(3894,30,'U30','Libre',NULL,376,23.1,6,93),(3895,31,'U31','Libre',NULL,345,26.8,1,93),(3896,32,'U32','Libre',NULL,247,24.1,9,93),(3897,33,'U33','Libre',NULL,162,25.9,9,93),(3898,34,'U34','Libre',NULL,407,25.4,6,93),(3899,35,'U35','Libre',NULL,251,18.4,3,93),(3900,36,'U36','Libre',NULL,333,21.6,10,93),(3901,37,'U37','Libre',NULL,281,18.9,1,93),(3902,38,'U38','Libre',NULL,496,18.6,1,93),(3903,39,'U39','Libre',NULL,218,21.1,7,93),(3904,40,'U40','Libre',NULL,489,18.8,3,93),(3905,41,'U41','Libre',NULL,423,25.8,10,93),(3906,42,'U42','Libre',NULL,301,20.6,2,93),(3907,1,'U01','Libre',NULL,207,25.9,2,94),(3908,2,'U02','Libre',NULL,424,20.9,1,94),(3909,3,'U03','Libre',NULL,160,22.1,1,94),(3910,4,'U04','Libre',NULL,357,22.7,7,94),(3911,5,'U05','Libre',NULL,250,26.8,4,94),(3912,6,'U06','Libre',NULL,170,25.7,10,94),(3913,7,'U07','Libre',NULL,389,18.7,6,94),(3914,8,'U08','Libre',NULL,425,20.4,1,94),(3915,9,'U09','Libre',NULL,383,21.5,9,94),(3916,10,'U10','Libre',NULL,253,25.4,7,94),(3917,11,'U11','Libre',NULL,143,24.2,2,94),(3918,12,'U12','Libre',NULL,347,26.7,8,94),(3919,13,'U13','Libre',NULL,217,18.4,5,94),(3920,14,'U14','Libre',NULL,198,21.7,8,94),(3921,15,'U15','Libre',NULL,211,24.2,4,94),(3922,16,'U16','Libre',NULL,469,19,10,94),(3923,17,'U17','Libre',NULL,360,19.1,3,94),(3924,18,'U18','Libre',NULL,212,22.5,9,94),(3925,19,'U19','Libre',NULL,396,24.8,5,94),(3926,20,'U20','Libre',NULL,131,21.1,8,94),(3927,21,'U21','Libre',NULL,440,19.8,4,94),(3928,22,'U22','Libre',NULL,265,21,4,94),(3929,23,'U23','Libre',NULL,477,20.5,6,94),(3930,24,'U24','Libre',NULL,483,20.5,3,94),(3931,25,'U25','Libre',NULL,164,22,6,94),(3932,26,'U26','Libre',NULL,371,24.3,5,94),(3933,27,'U27','Libre',NULL,132,20.1,1,94),(3934,28,'U28','Libre',NULL,200,24.5,6,94),(3935,29,'U29','Libre',NULL,390,18.2,5,94),(3936,30,'U30','Libre',NULL,385,21,4,94),(3937,31,'U31','Libre',NULL,430,18.3,5,94),(3938,32,'U32','Libre',NULL,324,18.6,3,94),(3939,33,'U33','Libre',NULL,227,21,1,94),(3940,34,'U34','Libre',NULL,369,25.6,7,94),(3941,35,'U35','Libre',NULL,105,18.9,4,94),(3942,36,'U36','Libre',NULL,115,19.8,7,94),(3943,37,'U37','Libre',NULL,294,25.2,3,94),(3944,38,'U38','Libre',NULL,243,18.9,7,94),(3945,39,'U39','Libre',NULL,303,21.6,8,94),(3946,40,'U40','Libre',NULL,353,25.6,4,94),(3947,41,'U41','Libre',NULL,251,20.1,7,94),(3948,42,'U42','Libre',NULL,158,20.7,6,94),(3949,1,'U01','Libre',NULL,263,23.7,2,95),(3950,2,'U02','Libre',NULL,280,25.5,3,95),(3951,3,'U03','Libre',NULL,258,26.8,1,95),(3952,4,'U04','Libre',NULL,368,22.5,1,95),(3953,5,'U05','Libre',NULL,318,22.3,2,95),(3954,6,'U06','Libre',NULL,160,22.7,9,95),(3955,7,'U07','Libre',NULL,478,25.4,8,95),(3956,8,'U08','Libre',NULL,288,20.8,2,95),(3957,9,'U09','Libre',NULL,487,21.7,10,95),(3958,10,'U10','Libre',NULL,499,22.5,7,95),(3959,11,'U11','Libre',NULL,425,22.4,1,95),(3960,12,'U12','Libre',NULL,270,22.6,9,95),(3961,13,'U13','Libre',NULL,344,24.1,2,95),(3962,14,'U14','Libre',NULL,394,26.8,5,95),(3963,15,'U15','Libre',NULL,338,26.1,2,95),(3964,16,'U16','Libre',NULL,421,20.4,4,95),(3965,17,'U17','Libre',NULL,351,21.6,10,95),(3966,18,'U18','Libre',NULL,439,24.4,6,95),(3967,19,'U19','Libre',NULL,119,21.3,10,95),(3968,20,'U20','Libre',NULL,492,26.4,3,95),(3969,21,'U21','Libre',NULL,426,21.9,8,95),(3970,22,'U22','Libre',NULL,224,25.2,4,95),(3971,23,'U23','Libre',NULL,157,22.4,7,95),(3972,24,'U24','Libre',NULL,186,24.3,10,95),(3973,25,'U25','Libre',NULL,348,20.5,3,95),(3974,26,'U26','Libre',NULL,483,19.4,3,95),(3975,27,'U27','Libre',NULL,240,24.4,6,95),(3976,28,'U28','Libre',NULL,398,21.4,10,95),(3977,29,'U29','Libre',NULL,198,20.1,6,95),(3978,30,'U30','Libre',NULL,202,19.3,7,95),(3979,31,'U31','Libre',NULL,466,19.3,1,95),(3980,32,'U32','Libre',NULL,429,25.2,8,95),(3981,33,'U33','Libre',NULL,245,26.1,3,95),(3982,34,'U34','Libre',NULL,227,19.1,7,95),(3983,35,'U35','Libre',NULL,102,19.9,1,95),(3984,36,'U36','Libre',NULL,321,22.8,6,95),(3985,37,'U37','Libre',NULL,302,18.4,9,95),(3986,38,'U38','Libre',NULL,279,18.7,2,95),(3987,39,'U39','Libre',NULL,351,20.8,1,95),(3988,40,'U40','Libre',NULL,488,23.4,8,95),(3989,41,'U41','Libre',NULL,267,20,3,95),(3990,42,'U42','Libre',NULL,326,21.9,5,95),(3991,1,'U01','Libre',NULL,420,20.1,10,96),(3992,2,'U02','Libre',NULL,385,18,8,96),(3993,3,'U03','Libre',NULL,286,25,6,96),(3994,4,'U04','Libre',NULL,374,21.1,5,96),(3995,5,'U05','Libre',NULL,197,20.5,10,96),(3996,6,'U06','Libre',NULL,111,20.9,9,96),(3997,7,'U07','Libre',NULL,415,25.1,7,96),(3998,8,'U08','Libre',NULL,195,21.4,9,96),(3999,9,'U09','Libre',NULL,266,25.3,1,96),(4000,10,'U10','Libre',NULL,417,22.1,1,96),(4001,11,'U11','Libre',NULL,311,26.9,2,96),(4002,12,'U12','Libre',NULL,387,19,5,96),(4003,13,'U13','Libre',NULL,203,23.8,3,96),(4004,14,'U14','Libre',NULL,377,25.8,7,96),(4005,15,'U15','Libre',NULL,102,19.1,10,96),(4006,16,'U16','Libre',NULL,370,20.9,9,96),(4007,17,'U17','Libre',NULL,434,21.4,7,96),(4008,18,'U18','Libre',NULL,413,22.6,2,96),(4009,19,'U19','Libre',NULL,214,24.3,8,96),(4010,20,'U20','Libre',NULL,209,26.2,10,96),(4011,21,'U21','Libre',NULL,359,26.4,1,96),(4012,22,'U22','Libre',NULL,474,18.9,2,96),(4013,23,'U23','Libre',NULL,406,19.8,8,96),(4014,24,'U24','Libre',NULL,125,21.3,2,96),(4015,25,'U25','Libre',NULL,138,24.5,1,96),(4016,26,'U26','Libre',NULL,415,25,4,96),(4017,27,'U27','Libre',NULL,172,20.3,9,96),(4018,28,'U28','Libre',NULL,297,18,9,96),(4019,29,'U29','Libre',NULL,396,20.4,4,96),(4020,30,'U30','Libre',NULL,466,21,4,96),(4021,31,'U31','Libre',NULL,486,18.1,3,96),(4022,32,'U32','Libre',NULL,477,24.8,4,96),(4023,33,'U33','Libre',NULL,168,24.6,8,96),(4024,34,'U34','Libre',NULL,430,26.6,4,96),(4025,35,'U35','Libre',NULL,236,22.2,2,96),(4026,36,'U36','Libre',NULL,196,18.1,10,96),(4027,37,'U37','Libre',NULL,312,23,6,96),(4028,38,'U38','Libre',NULL,273,19.5,1,96),(4029,39,'U39','Libre',NULL,448,19,6,96),(4030,40,'U40','Libre',NULL,252,20.7,7,96),(4031,41,'U41','Libre',NULL,422,20.9,8,96),(4032,42,'U42','Libre',NULL,398,25.3,10,96),(4033,1,'U01','Libre',NULL,133,24.7,10,97),(4034,2,'U02','Libre',NULL,466,22,7,97),(4035,3,'U03','Libre',NULL,329,25.6,7,97),(4036,4,'U04','Libre',NULL,464,23.9,3,97),(4037,5,'U05','Libre',NULL,220,19.4,10,97),(4038,6,'U06','Libre',NULL,399,19.1,5,97),(4039,7,'U07','Libre',NULL,366,19.2,4,97),(4040,8,'U08','Libre',NULL,411,25.9,4,97),(4041,9,'U09','Libre',NULL,177,23.6,2,97),(4042,10,'U10','Libre',NULL,401,19.7,8,97),(4043,11,'U11','Libre',NULL,315,25.2,9,97),(4044,12,'U12','Libre',NULL,376,21.9,3,97),(4045,13,'U13','Libre',NULL,370,25.2,5,97),(4046,14,'U14','Libre',NULL,202,21.2,1,97),(4047,15,'U15','Libre',NULL,423,25.2,3,97),(4048,16,'U16','Libre',NULL,117,19.3,8,97),(4049,17,'U17','Libre',NULL,389,25.5,3,97),(4050,18,'U18','Libre',NULL,349,23,4,97),(4051,19,'U19','Libre',NULL,279,18.2,5,97),(4052,20,'U20','Libre',NULL,160,18.5,2,97),(4053,21,'U21','Libre',NULL,388,24.8,3,97),(4054,22,'U22','Libre',NULL,311,20.6,3,97),(4055,23,'U23','Libre',NULL,178,18.3,7,97),(4056,24,'U24','Libre',NULL,203,21,10,97),(4057,25,'U25','Libre',NULL,181,18.1,6,97),(4058,26,'U26','Libre',NULL,488,22,9,97),(4059,27,'U27','Libre',NULL,216,19.4,10,97),(4060,28,'U28','Libre',NULL,499,20.3,8,97),(4061,29,'U29','Libre',NULL,359,21.9,2,97),(4062,30,'U30','Libre',NULL,313,22.6,7,97),(4063,31,'U31','Libre',NULL,386,26.9,7,97),(4064,32,'U32','Libre',NULL,102,21.5,1,97),(4065,33,'U33','Libre',NULL,462,20.2,9,97),(4066,34,'U34','Libre',NULL,164,23.3,5,97),(4067,35,'U35','Libre',NULL,371,24.2,10,97),(4068,36,'U36','Libre',NULL,430,23.6,1,97),(4069,37,'U37','Libre',NULL,189,19,9,97),(4070,38,'U38','Libre',NULL,434,22.7,9,97),(4071,39,'U39','Libre',NULL,200,21.2,3,97),(4072,40,'U40','Libre',NULL,167,26.6,2,97),(4073,41,'U41','Libre',NULL,407,24.8,10,97),(4074,42,'U42','Libre',NULL,417,22.8,5,97),(4075,1,'U01','Libre',NULL,199,22.7,7,98),(4076,2,'U02','Libre',NULL,441,26.7,1,98),(4077,3,'U03','Libre',NULL,471,23.9,6,98),(4078,4,'U04','Libre',NULL,301,23.7,5,98),(4079,5,'U05','Libre',NULL,229,25.8,6,98),(4080,6,'U06','Libre',NULL,121,20.1,2,98),(4081,7,'U07','Libre',NULL,482,26.4,7,98),(4082,8,'U08','Libre',NULL,408,26.7,5,98),(4083,9,'U09','Libre',NULL,119,18,1,98),(4084,10,'U10','Libre',NULL,119,21.3,1,98),(4085,11,'U11','Libre',NULL,160,20,5,98),(4086,12,'U12','Libre',NULL,167,18.3,9,98),(4087,13,'U13','Libre',NULL,223,22.7,4,98),(4088,14,'U14','Libre',NULL,233,18.1,10,98),(4089,15,'U15','Libre',NULL,496,22.5,10,98),(4090,16,'U16','Libre',NULL,449,21.9,1,98),(4091,17,'U17','Libre',NULL,220,25.7,5,98),(4092,18,'U18','Libre',NULL,411,18.4,2,98),(4093,19,'U19','Libre',NULL,442,22.5,10,98),(4094,20,'U20','Libre',NULL,153,23.1,9,98),(4095,21,'U21','Libre',NULL,451,25.8,5,98),(4096,22,'U22','Libre',NULL,231,24,10,98),(4097,23,'U23','Libre',NULL,374,24.5,3,98),(4098,24,'U24','Libre',NULL,207,20.7,7,98),(4099,25,'U25','Libre',NULL,277,25.3,8,98),(4100,26,'U26','Libre',NULL,150,20.1,10,98),(4101,27,'U27','Libre',NULL,326,24.5,7,98),(4102,28,'U28','Libre',NULL,459,20.1,5,98),(4103,29,'U29','Libre',NULL,174,25.2,6,98),(4104,30,'U30','Libre',NULL,295,18.9,8,98),(4105,31,'U31','Libre',NULL,495,26.5,5,98),(4106,32,'U32','Libre',NULL,373,18,1,98),(4107,33,'U33','Libre',NULL,426,22.9,7,98),(4108,34,'U34','Libre',NULL,108,25.7,9,98),(4109,35,'U35','Libre',NULL,159,20.9,3,98),(4110,36,'U36','Libre',NULL,442,21.7,6,98),(4111,37,'U37','Libre',NULL,203,20.1,7,98),(4112,38,'U38','Libre',NULL,439,23.4,5,98),(4113,39,'U39','Libre',NULL,209,19.6,10,98),(4114,40,'U40','Libre',NULL,390,18.4,10,98),(4115,41,'U41','Libre',NULL,192,23.1,1,98),(4116,42,'U42','Libre',NULL,387,24.7,3,98),(4117,1,'U01','Libre',NULL,483,20.9,9,99),(4118,2,'U02','Libre',NULL,338,21.4,6,99),(4119,3,'U03','Libre',NULL,203,23.2,9,99),(4120,4,'U04','Libre',NULL,274,22.7,7,99),(4121,5,'U05','Libre',NULL,139,22.5,2,99),(4122,6,'U06','Libre',NULL,145,20.8,1,99),(4123,7,'U07','Libre',NULL,136,24.1,5,99),(4124,8,'U08','Libre',NULL,262,22.5,1,99),(4125,9,'U09','Libre',NULL,349,22.3,10,99),(4126,10,'U10','Libre',NULL,283,20,6,99),(4127,11,'U11','Libre',NULL,274,21,3,99),(4128,12,'U12','Libre',NULL,290,22.8,3,99),(4129,13,'U13','Libre',NULL,402,23.2,4,99),(4130,14,'U14','Libre',NULL,241,20.7,3,99),(4131,15,'U15','Libre',NULL,287,19.8,1,99),(4132,16,'U16','Libre',NULL,169,25.2,6,99),(4133,17,'U17','Libre',NULL,156,23.3,4,99),(4134,18,'U18','Libre',NULL,272,18.4,1,99),(4135,19,'U19','Libre',NULL,244,24.7,7,99),(4136,20,'U20','Libre',NULL,120,25.4,9,99),(4137,21,'U21','Libre',NULL,400,23.1,5,99),(4138,22,'U22','Libre',NULL,291,22.3,1,99),(4139,23,'U23','Libre',NULL,415,26.2,7,99),(4140,24,'U24','Libre',NULL,353,18.8,6,99),(4141,25,'U25','Libre',NULL,118,19.4,9,99),(4142,26,'U26','Libre',NULL,409,21.6,7,99),(4143,27,'U27','Libre',NULL,456,26.7,5,99),(4144,28,'U28','Libre',NULL,231,24.9,6,99),(4145,29,'U29','Libre',NULL,100,26.6,8,99),(4146,30,'U30','Libre',NULL,248,23.1,10,99),(4147,31,'U31','Libre',NULL,353,25.7,5,99),(4148,32,'U32','Libre',NULL,388,23.1,5,99),(4149,33,'U33','Libre',NULL,402,26,1,99),(4150,34,'U34','Libre',NULL,290,23.3,7,99),(4151,35,'U35','Libre',NULL,137,23.8,3,99),(4152,36,'U36','Libre',NULL,180,21.1,4,99),(4153,37,'U37','Libre',NULL,439,24,3,99),(4154,38,'U38','Libre',NULL,162,24,5,99),(4155,39,'U39','Libre',NULL,117,23,2,99),(4156,40,'U40','Libre',NULL,176,26.3,2,99),(4157,41,'U41','Libre',NULL,210,19.8,6,99),(4158,42,'U42','Libre',NULL,372,23,8,99),(4159,1,'U01','Libre',NULL,144,25,10,100),(4160,2,'U02','Libre',NULL,422,19.9,2,100),(4161,3,'U03','Libre',NULL,179,22.6,5,100),(4162,4,'U04','Libre',NULL,293,24.8,2,100),(4163,5,'U05','Libre',NULL,238,18,10,100),(4164,6,'U06','Libre',NULL,493,23.5,1,100),(4165,7,'U07','Libre',NULL,194,23.7,8,100),(4166,8,'U08','Libre',NULL,422,20.2,2,100),(4167,9,'U09','Libre',NULL,487,23.2,6,100),(4168,10,'U10','Libre',NULL,269,20.4,2,100),(4169,11,'U11','Libre',NULL,231,24.4,7,100),(4170,12,'U12','Libre',NULL,401,23.4,1,100),(4171,13,'U13','Libre',NULL,387,26.1,10,100),(4172,14,'U14','Libre',NULL,476,22.1,10,100),(4173,15,'U15','Libre',NULL,422,18.8,6,100),(4174,16,'U16','Libre',NULL,447,23.4,5,100),(4175,17,'U17','Libre',NULL,389,21.7,1,100),(4176,18,'U18','Libre',NULL,380,23.9,6,100),(4177,19,'U19','Libre',NULL,207,20.5,8,100),(4178,20,'U20','Libre',NULL,483,26.2,3,100),(4179,21,'U21','Libre',NULL,274,25.4,7,100),(4180,22,'U22','Libre',NULL,482,19.7,9,100),(4181,23,'U23','Libre',NULL,498,25.2,8,100),(4182,24,'U24','Libre',NULL,315,18.9,2,100),(4183,25,'U25','Libre',NULL,197,24.9,9,100),(4184,26,'U26','Libre',NULL,179,20.1,1,100),(4185,27,'U27','Libre',NULL,419,18,2,100),(4186,28,'U28','Libre',NULL,228,21.9,5,100),(4187,29,'U29','Libre',NULL,287,20.8,10,100),(4188,30,'U30','Libre',NULL,394,23.1,8,100),(4189,31,'U31','Libre',NULL,418,18.9,4,100),(4190,32,'U32','Libre',NULL,275,24.8,1,100),(4191,33,'U33','Libre',NULL,225,18.3,5,100),(4192,34,'U34','Libre',NULL,161,24.9,6,100),(4193,35,'U35','Libre',NULL,191,23.5,10,100),(4194,36,'U36','Libre',NULL,260,22.7,8,100),(4195,37,'U37','Libre',NULL,117,20.3,5,100),(4196,38,'U38','Libre',NULL,174,26.8,8,100),(4197,39,'U39','Libre',NULL,286,20.4,10,100),(4198,40,'U40','Libre',NULL,425,22.3,5,100),(4199,41,'U41','Libre',NULL,298,23.3,7,100),(4200,42,'U42','Libre',NULL,356,19.5,6,100),(4201,1,'U01','Libre',NULL,237,22.4,9,101),(4202,2,'U02','Libre',NULL,111,23.4,1,101),(4203,3,'U03','Libre',NULL,327,24.8,9,101),(4204,4,'U04','Libre',NULL,375,22.2,2,101),(4205,5,'U05','Libre',NULL,312,26.9,3,101),(4206,6,'U06','Libre',NULL,337,22.3,10,101),(4207,7,'U07','Libre',NULL,222,24.2,7,101),(4208,8,'U08','Libre',NULL,252,18.1,10,101),(4209,9,'U09','Libre',NULL,406,26,4,101),(4210,10,'U10','Libre',NULL,221,24.9,8,101),(4211,11,'U11','Libre',NULL,205,24.9,1,101),(4212,12,'U12','Libre',NULL,207,22.8,4,101),(4213,13,'U13','Libre',NULL,384,23.9,7,101),(4214,14,'U14','Libre',NULL,181,26.2,10,101),(4215,15,'U15','Libre',NULL,100,18.2,7,101),(4216,16,'U16','Libre',NULL,367,19.2,2,101),(4217,17,'U17','Libre',NULL,214,24.4,4,101),(4218,18,'U18','Libre',NULL,295,22.3,7,101),(4219,19,'U19','Libre',NULL,223,26.6,3,101),(4220,20,'U20','Libre',NULL,210,24.9,5,101),(4221,21,'U21','Libre',NULL,455,20.8,1,101),(4222,22,'U22','Libre',NULL,211,19.3,1,101),(4223,23,'U23','Libre',NULL,277,21.1,9,101),(4224,24,'U24','Libre',NULL,209,25.5,1,101),(4225,25,'U25','Libre',NULL,458,22.2,1,101),(4226,26,'U26','Libre',NULL,442,22.2,2,101),(4227,27,'U27','Libre',NULL,206,25,5,101),(4228,28,'U28','Libre',NULL,103,26.4,6,101),(4229,29,'U29','Libre',NULL,265,25.6,5,101),(4230,30,'U30','Libre',NULL,270,18,2,101),(4231,31,'U31','Libre',NULL,362,21.9,3,101),(4232,32,'U32','Libre',NULL,233,25.1,2,101),(4233,33,'U33','Libre',NULL,379,20.3,3,101),(4234,34,'U34','Libre',NULL,204,21.6,4,101),(4235,35,'U35','Libre',NULL,420,21.5,7,101),(4236,36,'U36','Libre',NULL,181,23,3,101),(4237,37,'U37','Libre',NULL,112,24,5,101),(4238,38,'U38','Libre',NULL,221,20,4,101),(4239,39,'U39','Libre',NULL,276,25,10,101),(4240,40,'U40','Libre',NULL,386,24.7,5,101),(4241,41,'U41','Libre',NULL,119,25.7,4,101),(4242,42,'U42','Libre',NULL,361,23.5,3,101),(4243,1,'U01','Libre',NULL,484,18.3,9,102),(4244,2,'U02','Libre',NULL,152,20.3,10,102),(4245,3,'U03','Libre',NULL,233,20.3,6,102),(4246,4,'U04','Libre',NULL,402,20.9,3,102),(4247,5,'U05','Libre',NULL,362,22.6,7,102),(4248,6,'U06','Libre',NULL,412,24.8,3,102),(4249,7,'U07','Libre',NULL,400,20.2,10,102),(4250,8,'U08','Libre',NULL,195,24.2,9,102),(4251,9,'U09','Libre',NULL,376,24.8,6,102),(4252,10,'U10','Libre',NULL,346,26.8,10,102),(4253,11,'U11','Libre',NULL,302,20.4,7,102),(4254,12,'U12','Libre',NULL,497,19.8,6,102),(4255,13,'U13','Libre',NULL,115,23.8,10,102),(4256,14,'U14','Libre',NULL,110,23.5,5,102),(4257,15,'U15','Libre',NULL,351,23.3,1,102),(4258,16,'U16','Libre',NULL,365,26.9,9,102),(4259,17,'U17','Libre',NULL,484,22.8,5,102),(4260,18,'U18','Libre',NULL,481,26.2,3,102),(4261,19,'U19','Libre',NULL,267,19.7,9,102),(4262,20,'U20','Libre',NULL,261,23.5,6,102),(4263,21,'U21','Libre',NULL,311,18.5,10,102),(4264,22,'U22','Libre',NULL,369,25.4,5,102),(4265,23,'U23','Libre',NULL,256,24,6,102),(4266,24,'U24','Libre',NULL,126,22.4,7,102),(4267,25,'U25','Libre',NULL,380,24.3,5,102),(4268,26,'U26','Libre',NULL,425,22.1,6,102),(4269,27,'U27','Libre',NULL,208,19.2,4,102),(4270,28,'U28','Libre',NULL,226,21.4,6,102),(4271,29,'U29','Libre',NULL,346,20,3,102),(4272,30,'U30','Libre',NULL,343,21.9,2,102),(4273,31,'U31','Libre',NULL,429,21.2,4,102),(4274,32,'U32','Libre',NULL,418,25.3,2,102),(4275,33,'U33','Libre',NULL,196,20,6,102),(4276,34,'U34','Libre',NULL,312,23.3,2,102),(4277,35,'U35','Libre',NULL,126,21.6,7,102),(4278,36,'U36','Libre',NULL,476,22.5,10,102),(4279,37,'U37','Libre',NULL,295,20,1,102),(4280,38,'U38','Libre',NULL,347,25.3,10,102),(4281,39,'U39','Libre',NULL,159,20.3,3,102),(4282,40,'U40','Libre',NULL,359,24.1,2,102),(4283,41,'U41','Libre',NULL,382,24.5,2,102),(4284,42,'U42','Libre',NULL,207,24.7,3,102),(4285,1,'U01','Libre',NULL,463,25.7,8,103),(4286,2,'U02','Libre',NULL,238,22.8,5,103),(4287,3,'U03','Libre',NULL,134,20.4,6,103),(4288,4,'U04','Libre',NULL,124,18.5,3,103),(4289,5,'U05','Libre',NULL,125,22.5,10,103),(4290,6,'U06','Libre',NULL,363,26.1,9,103),(4291,7,'U07','Libre',NULL,304,19.4,3,103),(4292,8,'U08','Libre',NULL,207,18.8,5,103),(4293,9,'U09','Libre',NULL,370,18.2,1,103),(4294,10,'U10','Libre',NULL,211,26.6,3,103),(4295,11,'U11','Libre',NULL,153,20.4,2,103),(4296,12,'U12','Libre',NULL,336,21.4,6,103),(4297,13,'U13','Libre',NULL,270,26.2,3,103),(4298,14,'U14','Libre',NULL,172,20.9,3,103),(4299,15,'U15','Libre',NULL,172,24.5,3,103),(4300,16,'U16','Libre',NULL,117,26.6,9,103),(4301,17,'U17','Libre',NULL,372,23.7,4,103),(4302,18,'U18','Libre',NULL,116,19.3,9,103),(4303,19,'U19','Libre',NULL,365,19.8,3,103),(4304,20,'U20','Libre',NULL,403,21,8,103),(4305,21,'U21','Libre',NULL,334,21.7,7,103),(4306,22,'U22','Libre',NULL,478,25.9,3,103),(4307,23,'U23','Libre',NULL,414,21,5,103),(4308,24,'U24','Libre',NULL,440,24.7,4,103),(4309,25,'U25','Libre',NULL,477,19.9,1,103),(4310,26,'U26','Libre',NULL,256,19,7,103),(4311,27,'U27','Libre',NULL,134,20.6,3,103),(4312,28,'U28','Libre',NULL,137,20.8,7,103),(4313,29,'U29','Libre',NULL,174,26.9,10,103),(4314,30,'U30','Libre',NULL,389,19.4,8,103),(4315,31,'U31','Libre',NULL,411,22.1,3,103),(4316,32,'U32','Libre',NULL,408,26.5,7,103),(4317,33,'U33','Libre',NULL,340,25.5,6,103),(4318,34,'U34','Libre',NULL,337,20.8,10,103),(4319,35,'U35','Libre',NULL,473,24.6,4,103),(4320,36,'U36','Libre',NULL,296,19.2,1,103),(4321,37,'U37','Libre',NULL,221,19.4,3,103),(4322,38,'U38','Libre',NULL,102,18.1,8,103),(4323,39,'U39','Libre',NULL,210,18.8,9,103),(4324,40,'U40','Libre',NULL,232,19.9,2,103),(4325,41,'U41','Libre',NULL,153,19.8,6,103),(4326,42,'U42','Libre',NULL,389,19.7,5,103),(4327,1,'U01','Libre',NULL,117,18.5,4,104),(4328,2,'U02','Libre',NULL,126,26.2,9,104),(4329,3,'U03','Libre',NULL,346,24.6,8,104),(4330,4,'U04','Libre',NULL,468,26.7,3,104),(4331,5,'U05','Libre',NULL,143,25.8,3,104),(4332,6,'U06','Libre',NULL,382,24.1,4,104),(4333,7,'U07','Libre',NULL,429,20.7,9,104),(4334,8,'U08','Libre',NULL,333,26,5,104),(4335,9,'U09','Libre',NULL,357,26.3,1,104),(4336,10,'U10','Libre',NULL,105,20,9,104),(4337,11,'U11','Libre',NULL,335,20.6,8,104),(4338,12,'U12','Libre',NULL,443,19.4,4,104),(4339,13,'U13','Libre',NULL,250,22.4,6,104),(4340,14,'U14','Libre',NULL,291,25.7,7,104),(4341,15,'U15','Libre',NULL,321,21.9,7,104),(4342,16,'U16','Libre',NULL,292,24.6,7,104),(4343,17,'U17','Libre',NULL,206,18.8,1,104),(4344,18,'U18','Libre',NULL,254,19.4,9,104),(4345,19,'U19','Libre',NULL,208,21.8,5,104),(4346,20,'U20','Libre',NULL,337,25,9,104),(4347,21,'U21','Libre',NULL,500,25.7,3,104),(4348,22,'U22','Libre',NULL,383,23.4,9,104),(4349,23,'U23','Libre',NULL,103,19.8,2,104),(4350,24,'U24','Libre',NULL,339,22.2,10,104),(4351,25,'U25','Libre',NULL,283,22.3,7,104),(4352,26,'U26','Libre',NULL,330,26.5,3,104),(4353,27,'U27','Libre',NULL,480,19.3,7,104),(4354,28,'U28','Libre',NULL,126,24.4,3,104),(4355,29,'U29','Libre',NULL,250,21.7,1,104),(4356,30,'U30','Libre',NULL,121,19.7,7,104),(4357,31,'U31','Libre',NULL,471,22.4,9,104),(4358,32,'U32','Libre',NULL,493,18.2,4,104),(4359,33,'U33','Libre',NULL,492,21,9,104),(4360,34,'U34','Libre',NULL,405,18.2,6,104),(4361,35,'U35','Libre',NULL,329,18.1,10,104),(4362,36,'U36','Libre',NULL,278,19.2,1,104),(4363,37,'U37','Libre',NULL,284,21.6,2,104),(4364,38,'U38','Libre',NULL,194,19.8,7,104),(4365,39,'U39','Libre',NULL,166,18.9,6,104),(4366,40,'U40','Libre',NULL,276,25.2,7,104),(4367,41,'U41','Libre',NULL,372,24.3,8,104),(4368,42,'U42','Libre',NULL,430,26.6,4,104),(4369,1,'U01','Libre',NULL,173,19.3,7,105),(4370,2,'U02','Libre',NULL,164,23.2,1,105),(4371,3,'U03','Libre',NULL,250,20.3,2,105),(4372,4,'U04','Libre',NULL,465,23.4,6,105),(4373,5,'U05','Libre',NULL,295,20.6,2,105),(4374,6,'U06','Libre',NULL,253,19.7,7,105),(4375,7,'U07','Libre',NULL,362,20.6,4,105),(4376,8,'U08','Libre',NULL,427,21.2,10,105),(4377,9,'U09','Libre',NULL,387,23.6,4,105),(4378,10,'U10','Libre',NULL,249,20.7,9,105),(4379,11,'U11','Libre',NULL,490,26.5,7,105),(4380,12,'U12','Libre',NULL,160,25,4,105),(4381,13,'U13','Libre',NULL,161,26.6,8,105),(4382,14,'U14','Libre',NULL,203,19.7,2,105),(4383,15,'U15','Libre',NULL,400,18.7,2,105),(4384,16,'U16','Libre',NULL,492,18,1,105),(4385,17,'U17','Libre',NULL,123,20.2,4,105),(4386,18,'U18','Libre',NULL,362,21.7,1,105),(4387,19,'U19','Libre',NULL,375,24.2,1,105),(4388,20,'U20','Libre',NULL,415,21.9,5,105),(4389,21,'U21','Libre',NULL,456,20.6,9,105),(4390,22,'U22','Libre',NULL,492,21.9,2,105),(4391,23,'U23','Libre',NULL,208,21.2,2,105),(4392,24,'U24','Libre',NULL,380,24.3,10,105),(4393,25,'U25','Libre',NULL,403,18.7,7,105),(4394,26,'U26','Libre',NULL,346,22.1,9,105),(4395,27,'U27','Libre',NULL,316,23.7,3,105),(4396,28,'U28','Libre',NULL,150,20.4,9,105),(4397,29,'U29','Libre',NULL,233,18.6,8,105),(4398,30,'U30','Libre',NULL,264,23.8,4,105),(4399,31,'U31','Libre',NULL,137,25.9,4,105),(4400,32,'U32','Libre',NULL,281,20.6,4,105),(4401,33,'U33','Libre',NULL,305,23.4,7,105),(4402,34,'U34','Libre',NULL,422,18.6,3,105),(4403,35,'U35','Libre',NULL,255,22,8,105),(4404,36,'U36','Libre',NULL,118,18.8,3,105),(4405,37,'U37','Libre',NULL,184,21,10,105),(4406,38,'U38','Libre',NULL,271,25.7,2,105),(4407,39,'U39','Libre',NULL,357,26.6,1,105),(4408,40,'U40','Libre',NULL,153,25.1,7,105),(4409,41,'U41','Libre',NULL,171,24.1,9,105),(4410,42,'U42','Libre',NULL,175,21.3,3,105),(4411,1,'U01','Libre',NULL,367,26.2,8,106),(4412,2,'U02','Libre',NULL,345,22.5,1,106),(4413,3,'U03','Libre',NULL,147,18.4,2,106),(4414,4,'U04','Libre',NULL,284,25.7,8,106),(4415,5,'U05','Libre',NULL,118,26.7,9,106),(4416,6,'U06','Libre',NULL,344,19.3,5,106),(4417,7,'U07','Libre',NULL,241,26.4,8,106),(4418,8,'U08','Libre',NULL,309,19.6,6,106),(4419,9,'U09','Libre',NULL,272,20.8,9,106),(4420,10,'U10','Libre',NULL,305,20.9,8,106),(4421,11,'U11','Libre',NULL,163,24.5,5,106),(4422,12,'U12','Libre',NULL,236,22.2,8,106),(4423,13,'U13','Libre',NULL,210,26.5,10,106),(4424,14,'U14','Libre',NULL,297,26.8,10,106),(4425,15,'U15','Libre',NULL,149,26.8,6,106),(4426,16,'U16','Libre',NULL,217,23.7,7,106),(4427,17,'U17','Libre',NULL,283,22.8,10,106),(4428,18,'U18','Libre',NULL,494,24.1,9,106),(4429,19,'U19','Libre',NULL,455,25.2,7,106),(4430,20,'U20','Libre',NULL,288,26.7,3,106),(4431,21,'U21','Libre',NULL,439,19.4,5,106),(4432,22,'U22','Libre',NULL,321,19.8,4,106),(4433,23,'U23','Libre',NULL,247,26.7,6,106),(4434,24,'U24','Libre',NULL,181,24,1,106),(4435,25,'U25','Libre',NULL,112,22.9,9,106),(4436,26,'U26','Libre',NULL,197,23.9,1,106),(4437,27,'U27','Libre',NULL,404,23.7,3,106),(4438,28,'U28','Libre',NULL,461,23.9,5,106),(4439,29,'U29','Libre',NULL,135,21.2,2,106),(4440,30,'U30','Libre',NULL,412,24.6,3,106),(4441,31,'U31','Libre',NULL,362,20.1,2,106),(4442,32,'U32','Libre',NULL,199,26.6,10,106),(4443,33,'U33','Libre',NULL,255,26.4,6,106),(4444,34,'U34','Libre',NULL,242,18.8,9,106),(4445,35,'U35','Libre',NULL,421,25.2,1,106),(4446,36,'U36','Libre',NULL,170,18.6,1,106),(4447,37,'U37','Libre',NULL,466,26.8,1,106),(4448,38,'U38','Libre',NULL,407,18.8,3,106),(4449,39,'U39','Libre',NULL,423,23.7,5,106),(4450,40,'U40','Libre',NULL,431,24.9,2,106),(4451,41,'U41','Libre',NULL,360,18.9,1,106),(4452,42,'U42','Libre',NULL,299,23.5,10,106),(4453,1,'U01','Libre',NULL,426,26.3,2,107),(4454,2,'U02','Libre',NULL,416,20.9,8,107),(4455,3,'U03','Libre',NULL,139,20,2,107),(4456,4,'U04','Libre',NULL,409,19.1,8,107),(4457,5,'U05','Libre',NULL,368,24.1,5,107),(4458,6,'U06','Libre',NULL,229,25.4,2,107),(4459,7,'U07','Libre',NULL,140,23.2,7,107),(4460,8,'U08','Libre',NULL,116,22,6,107),(4461,9,'U09','Libre',NULL,222,24,6,107),(4462,10,'U10','Libre',NULL,412,19.7,2,107),(4463,11,'U11','Libre',NULL,488,25.9,8,107),(4464,12,'U12','Libre',NULL,390,22.3,7,107),(4465,13,'U13','Libre',NULL,355,20.3,2,107),(4466,14,'U14','Libre',NULL,174,23.5,1,107),(4467,15,'U15','Libre',NULL,424,19.4,3,107),(4468,16,'U16','Libre',NULL,380,26.4,9,107),(4469,17,'U17','Libre',NULL,487,21.4,8,107),(4470,18,'U18','Libre',NULL,220,23.3,5,107),(4471,19,'U19','Libre',NULL,369,19.4,5,107),(4472,20,'U20','Libre',NULL,376,23.6,9,107),(4473,21,'U21','Libre',NULL,491,21.4,10,107),(4474,22,'U22','Libre',NULL,492,21.8,9,107),(4475,23,'U23','Libre',NULL,353,20.7,7,107),(4476,24,'U24','Libre',NULL,370,23.9,4,107),(4477,25,'U25','Libre',NULL,174,24.5,8,107),(4478,26,'U26','Libre',NULL,333,26.1,2,107),(4479,27,'U27','Libre',NULL,328,22.4,5,107),(4480,28,'U28','Libre',NULL,238,21.1,5,107),(4481,29,'U29','Libre',NULL,206,23.8,1,107),(4482,30,'U30','Libre',NULL,104,22,1,107),(4483,31,'U31','Libre',NULL,131,21,3,107),(4484,32,'U32','Libre',NULL,197,21.5,8,107),(4485,33,'U33','Libre',NULL,220,24.6,7,107),(4486,34,'U34','Libre',NULL,111,25,1,107),(4487,35,'U35','Libre',NULL,287,21.1,6,107),(4488,36,'U36','Libre',NULL,427,23.6,3,107),(4489,37,'U37','Libre',NULL,128,22.7,1,107),(4490,38,'U38','Libre',NULL,335,23.3,2,107),(4491,39,'U39','Libre',NULL,290,18.8,6,107),(4492,40,'U40','Libre',NULL,312,22.1,7,107),(4493,41,'U41','Libre',NULL,470,23.2,2,107),(4494,42,'U42','Libre',NULL,198,19.9,8,107),(4495,1,'U01','Libre',NULL,328,20.3,8,108),(4496,2,'U02','Libre',NULL,449,25.3,7,108),(4497,3,'U03','Libre',NULL,240,24.9,6,108),(4498,4,'U04','Libre',NULL,160,26.9,7,108),(4499,5,'U05','Libre',NULL,143,24.5,3,108),(4500,6,'U06','Libre',NULL,304,26.8,6,108),(4501,7,'U07','Libre',NULL,287,19.9,7,108),(4502,8,'U08','Libre',NULL,256,25.2,10,108),(4503,9,'U09','Libre',NULL,303,26.7,10,108),(4504,10,'U10','Libre',NULL,196,20.4,4,108),(4505,11,'U11','Libre',NULL,459,19.8,8,108),(4506,12,'U12','Libre',NULL,428,19.3,10,108),(4507,13,'U13','Libre',NULL,482,20.8,4,108),(4508,14,'U14','Libre',NULL,192,18.6,4,108),(4509,15,'U15','Libre',NULL,448,23.2,10,108),(4510,16,'U16','Libre',NULL,416,21.4,6,108),(4511,17,'U17','Libre',NULL,221,24.2,8,108),(4512,18,'U18','Libre',NULL,447,21.1,4,108),(4513,19,'U19','Libre',NULL,465,21.4,7,108),(4514,20,'U20','Libre',NULL,289,23.4,6,108),(4515,21,'U21','Libre',NULL,460,23.2,3,108),(4516,22,'U22','Libre',NULL,217,19.4,1,108),(4517,23,'U23','Libre',NULL,499,22.9,8,108),(4518,24,'U24','Libre',NULL,447,20.8,10,108),(4519,25,'U25','Libre',NULL,320,23,8,108),(4520,26,'U26','Libre',NULL,374,18.4,2,108),(4521,27,'U27','Libre',NULL,262,22.7,4,108),(4522,28,'U28','Libre',NULL,481,21.1,3,108),(4523,29,'U29','Libre',NULL,399,25.1,8,108),(4524,30,'U30','Libre',NULL,453,23.4,8,108),(4525,31,'U31','Libre',NULL,120,21,8,108),(4526,32,'U32','Libre',NULL,219,22.6,10,108),(4527,33,'U33','Libre',NULL,175,24.3,2,108),(4528,34,'U34','Libre',NULL,469,19.9,2,108),(4529,35,'U35','Libre',NULL,477,21,1,108),(4530,36,'U36','Libre',NULL,199,26.3,5,108),(4531,37,'U37','Libre',NULL,267,24.9,9,108),(4532,38,'U38','Libre',NULL,311,19.3,6,108),(4533,39,'U39','Libre',NULL,459,24.8,7,108),(4534,40,'U40','Libre',NULL,351,21.3,5,108),(4535,41,'U41','Libre',NULL,416,18,9,108),(4536,42,'U42','Libre',NULL,363,21.7,10,108),(4537,1,'U01','Libre',NULL,494,25.3,9,109),(4538,2,'U02','Libre',NULL,184,26.4,2,109),(4539,3,'U03','Libre',NULL,449,26.9,7,109),(4540,4,'U04','Libre',NULL,271,26.2,2,109),(4541,5,'U05','Libre',NULL,455,24.1,8,109),(4542,6,'U06','Libre',NULL,392,24.2,7,109),(4543,7,'U07','Libre',NULL,376,22.9,9,109),(4544,8,'U08','Libre',NULL,451,24.9,7,109),(4545,9,'U09','Libre',NULL,155,21.5,3,109),(4546,10,'U10','Libre',NULL,493,25.7,10,109),(4547,11,'U11','Libre',NULL,112,26.1,5,109),(4548,12,'U12','Libre',NULL,176,19.8,9,109),(4549,13,'U13','Libre',NULL,242,21.6,1,109),(4550,14,'U14','Libre',NULL,323,18.7,4,109),(4551,15,'U15','Libre',NULL,188,21.1,5,109),(4552,16,'U16','Libre',NULL,201,24.7,6,109),(4553,17,'U17','Libre',NULL,180,26.9,10,109),(4554,18,'U18','Libre',NULL,391,23.5,6,109),(4555,19,'U19','Libre',NULL,400,23.2,1,109),(4556,20,'U20','Libre',NULL,305,21.3,7,109),(4557,21,'U21','Libre',NULL,379,26.8,2,109),(4558,22,'U22','Libre',NULL,318,25.4,2,109),(4559,23,'U23','Libre',NULL,232,26.4,6,109),(4560,24,'U24','Libre',NULL,442,20.7,2,109),(4561,25,'U25','Libre',NULL,392,25.8,2,109),(4562,26,'U26','Libre',NULL,232,25,5,109),(4563,27,'U27','Libre',NULL,473,22.2,4,109),(4564,28,'U28','Libre',NULL,126,25.9,1,109),(4565,29,'U29','Libre',NULL,346,26.4,4,109),(4566,30,'U30','Libre',NULL,216,25,6,109),(4567,31,'U31','Libre',NULL,281,22,9,109),(4568,32,'U32','Libre',NULL,282,18.9,8,109),(4569,33,'U33','Libre',NULL,311,21.5,1,109),(4570,34,'U34','Libre',NULL,160,19.6,3,109),(4571,35,'U35','Libre',NULL,468,22.2,10,109),(4572,36,'U36','Libre',NULL,195,19.9,8,109),(4573,37,'U37','Libre',NULL,487,25.2,10,109),(4574,38,'U38','Libre',NULL,252,20.8,9,109),(4575,39,'U39','Libre',NULL,270,23,4,109),(4576,40,'U40','Libre',NULL,258,24.5,10,109),(4577,41,'U41','Libre',NULL,225,22.7,5,109),(4578,42,'U42','Libre',NULL,406,21.2,5,109),(4579,1,'U01','Libre',NULL,364,19.3,5,110),(4580,2,'U02','Libre',NULL,247,18.2,6,110),(4581,3,'U03','Libre',NULL,481,24.6,5,110),(4582,4,'U04','Libre',NULL,168,20.5,10,110),(4583,5,'U05','Libre',NULL,147,26.7,7,110),(4584,6,'U06','Libre',NULL,226,26.6,1,110),(4585,7,'U07','Libre',NULL,112,20.7,1,110),(4586,8,'U08','Libre',NULL,159,20.1,7,110),(4587,9,'U09','Libre',NULL,247,21.5,5,110),(4588,10,'U10','Libre',NULL,222,21.1,2,110),(4589,11,'U11','Libre',NULL,417,26.8,5,110),(4590,12,'U12','Libre',NULL,368,22.7,2,110),(4591,13,'U13','Libre',NULL,495,22,10,110),(4592,14,'U14','Libre',NULL,251,25.9,8,110),(4593,15,'U15','Libre',NULL,205,19.2,5,110),(4594,16,'U16','Libre',NULL,336,22.8,5,110),(4595,17,'U17','Libre',NULL,215,18.8,2,110),(4596,18,'U18','Libre',NULL,288,18.5,2,110),(4597,19,'U19','Libre',NULL,223,21.4,5,110),(4598,20,'U20','Libre',NULL,120,24.6,10,110),(4599,21,'U21','Libre',NULL,162,21.3,10,110),(4600,22,'U22','Libre',NULL,475,22.1,5,110),(4601,23,'U23','Libre',NULL,337,19.6,4,110),(4602,24,'U24','Libre',NULL,203,26.1,7,110),(4603,25,'U25','Libre',NULL,148,21.2,7,110),(4604,26,'U26','Libre',NULL,317,18,1,110),(4605,27,'U27','Libre',NULL,274,24.2,1,110),(4606,28,'U28','Libre',NULL,274,18,6,110),(4607,29,'U29','Libre',NULL,388,19.6,10,110),(4608,30,'U30','Libre',NULL,374,24.3,7,110),(4609,31,'U31','Libre',NULL,467,23.1,10,110),(4610,32,'U32','Libre',NULL,371,21.7,7,110),(4611,33,'U33','Libre',NULL,149,22.2,3,110),(4612,34,'U34','Libre',NULL,423,21.9,2,110),(4613,35,'U35','Libre',NULL,377,22.7,8,110),(4614,36,'U36','Libre',NULL,374,25.3,7,110),(4615,37,'U37','Libre',NULL,364,20.2,9,110),(4616,38,'U38','Libre',NULL,129,20.1,5,110),(4617,39,'U39','Libre',NULL,474,20.7,10,110),(4618,40,'U40','Libre',NULL,245,26,3,110),(4619,41,'U41','Libre',NULL,468,25.9,3,110),(4620,42,'U42','Libre',NULL,324,21.5,3,110),(4621,1,'U01','Libre',NULL,339,20.6,3,111),(4622,2,'U02','Libre',NULL,141,21.3,10,111),(4623,3,'U03','Libre',NULL,329,22.7,9,111),(4624,4,'U04','Libre',NULL,407,25.6,9,111),(4625,5,'U05','Libre',NULL,297,23.6,8,111),(4626,6,'U06','Libre',NULL,118,22,2,111),(4627,7,'U07','Libre',NULL,345,21.6,2,111),(4628,8,'U08','Libre',NULL,487,25.6,6,111),(4629,9,'U09','Libre',NULL,415,21.5,2,111),(4630,10,'U10','Libre',NULL,143,21.2,3,111),(4631,11,'U11','Libre',NULL,372,21.3,1,111),(4632,12,'U12','Libre',NULL,364,24.1,10,111),(4633,13,'U13','Libre',NULL,160,21.3,6,111),(4634,14,'U14','Libre',NULL,424,18.7,8,111),(4635,15,'U15','Libre',NULL,178,24.7,2,111),(4636,16,'U16','Libre',NULL,246,21.8,9,111),(4637,17,'U17','Libre',NULL,493,20,10,111),(4638,18,'U18','Libre',NULL,437,20,9,111),(4639,19,'U19','Libre',NULL,227,23.1,4,111),(4640,20,'U20','Libre',NULL,231,20.6,8,111),(4641,21,'U21','Libre',NULL,140,26.8,7,111),(4642,22,'U22','Libre',NULL,170,20.5,4,111),(4643,23,'U23','Libre',NULL,464,18.2,1,111),(4644,24,'U24','Libre',NULL,482,20.8,4,111),(4645,25,'U25','Libre',NULL,165,26.3,3,111),(4646,26,'U26','Libre',NULL,133,21.8,4,111),(4647,27,'U27','Libre',NULL,128,23.2,1,111),(4648,28,'U28','Libre',NULL,493,23.9,8,111),(4649,29,'U29','Libre',NULL,440,25.6,3,111),(4650,30,'U30','Libre',NULL,340,21.6,7,111),(4651,31,'U31','Libre',NULL,464,26.8,6,111),(4652,32,'U32','Libre',NULL,344,19.7,1,111),(4653,33,'U33','Libre',NULL,290,20.4,2,111),(4654,34,'U34','Libre',NULL,173,22.9,5,111),(4655,35,'U35','Libre',NULL,249,20.4,6,111),(4656,36,'U36','Libre',NULL,333,20.9,1,111),(4657,37,'U37','Libre',NULL,314,22.2,7,111),(4658,38,'U38','Libre',NULL,232,18.7,2,111),(4659,39,'U39','Libre',NULL,171,18.6,2,111),(4660,40,'U40','Libre',NULL,228,26.8,4,111),(4661,41,'U41','Libre',NULL,341,20.3,7,111),(4662,42,'U42','Libre',NULL,101,21.1,6,111),(4663,1,'U01','Libre',NULL,333,19.9,2,112),(4664,2,'U02','Libre',NULL,454,26.9,7,112),(4665,3,'U03','Libre',NULL,490,24.7,7,112),(4666,4,'U04','Libre',NULL,139,19.1,3,112),(4667,5,'U05','Libre',NULL,132,26.4,1,112),(4668,6,'U06','Libre',NULL,443,18.1,8,112),(4669,7,'U07','Libre',NULL,462,26.4,5,112),(4670,8,'U08','Libre',NULL,200,23.6,7,112),(4671,9,'U09','Libre',NULL,475,19.4,9,112),(4672,10,'U10','Libre',NULL,126,22.7,4,112),(4673,11,'U11','Libre',NULL,458,26.2,3,112),(4674,12,'U12','Libre',NULL,468,26.9,6,112),(4675,13,'U13','Libre',NULL,214,25.6,7,112),(4676,14,'U14','Libre',NULL,257,22,7,112),(4677,15,'U15','Libre',NULL,365,20.9,9,112),(4678,16,'U16','Libre',NULL,175,26.6,10,112),(4679,17,'U17','Libre',NULL,363,21.1,3,112),(4680,18,'U18','Libre',NULL,181,21.3,7,112),(4681,19,'U19','Libre',NULL,391,20.7,10,112),(4682,20,'U20','Libre',NULL,356,18.2,9,112),(4683,21,'U21','Libre',NULL,396,19.6,1,112),(4684,22,'U22','Libre',NULL,301,21.7,8,112),(4685,23,'U23','Libre',NULL,437,25.7,9,112),(4686,24,'U24','Libre',NULL,246,26.6,7,112),(4687,25,'U25','Libre',NULL,406,21.5,3,112),(4688,26,'U26','Libre',NULL,223,24.5,5,112),(4689,27,'U27','Libre',NULL,451,23.2,3,112),(4690,28,'U28','Libre',NULL,361,23.4,9,112),(4691,29,'U29','Libre',NULL,169,22.7,4,112),(4692,30,'U30','Libre',NULL,109,22.5,3,112),(4693,31,'U31','Libre',NULL,248,23,3,112),(4694,32,'U32','Libre',NULL,123,24.9,3,112),(4695,33,'U33','Libre',NULL,121,24.8,1,112),(4696,34,'U34','Libre',NULL,185,25.3,3,112),(4697,35,'U35','Libre',NULL,315,24.2,2,112),(4698,36,'U36','Libre',NULL,473,26.9,5,112),(4699,37,'U37','Libre',NULL,154,18.1,5,112),(4700,38,'U38','Libre',NULL,230,19.3,6,112),(4701,39,'U39','Libre',NULL,440,26.1,6,112),(4702,40,'U40','Libre',NULL,371,25,7,112),(4703,41,'U41','Libre',NULL,197,25.1,2,112),(4704,42,'U42','Libre',NULL,442,24.4,10,112),(4705,1,'U01','Libre',NULL,462,18.9,5,113),(4706,2,'U02','Libre',NULL,406,24.9,9,113),(4707,3,'U03','Libre',NULL,304,23.5,8,113),(4708,4,'U04','Libre',NULL,180,19.4,7,113),(4709,5,'U05','Libre',NULL,382,21.7,5,113),(4710,6,'U06','Libre',NULL,419,21.5,1,113),(4711,7,'U07','Libre',NULL,448,19.2,8,113),(4712,8,'U08','Libre',NULL,338,18.3,2,113),(4713,9,'U09','Libre',NULL,209,25.4,6,113),(4714,10,'U10','Libre',NULL,190,25.9,10,113),(4715,11,'U11','Libre',NULL,385,19.5,2,113),(4716,12,'U12','Libre',NULL,295,23.8,9,113),(4717,13,'U13','Libre',NULL,431,22.5,6,113),(4718,14,'U14','Libre',NULL,322,20.5,9,113),(4719,15,'U15','Libre',NULL,215,18.6,3,113),(4720,16,'U16','Libre',NULL,124,18.3,4,113),(4721,17,'U17','Libre',NULL,466,26.4,5,113),(4722,18,'U18','Libre',NULL,318,18.8,4,113),(4723,19,'U19','Libre',NULL,137,22.6,5,113),(4724,20,'U20','Libre',NULL,205,26.2,9,113),(4725,21,'U21','Libre',NULL,350,22.8,10,113),(4726,22,'U22','Libre',NULL,349,26.9,10,113),(4727,23,'U23','Libre',NULL,125,25.3,9,113),(4728,24,'U24','Libre',NULL,220,20,5,113),(4729,25,'U25','Libre',NULL,352,21.5,1,113),(4730,26,'U26','Libre',NULL,177,20.6,3,113),(4731,27,'U27','Libre',NULL,153,18.7,3,113),(4732,28,'U28','Libre',NULL,429,22.3,1,113),(4733,29,'U29','Libre',NULL,273,20.5,1,113),(4734,30,'U30','Libre',NULL,224,19.8,1,113),(4735,31,'U31','Libre',NULL,167,18.2,10,113),(4736,32,'U32','Libre',NULL,271,24.3,4,113),(4737,33,'U33','Libre',NULL,404,18.7,3,113),(4738,34,'U34','Libre',NULL,326,19.6,1,113),(4739,35,'U35','Libre',NULL,400,19.5,3,113),(4740,36,'U36','Libre',NULL,453,21.5,3,113),(4741,37,'U37','Libre',NULL,374,25.5,7,113),(4742,38,'U38','Libre',NULL,430,25.1,8,113),(4743,39,'U39','Libre',NULL,120,25.2,8,113),(4744,40,'U40','Libre',NULL,369,21.1,2,113),(4745,41,'U41','Libre',NULL,464,26.1,5,113),(4746,42,'U42','Libre',NULL,199,26.3,8,113),(4747,1,'U01','Libre',NULL,401,23.9,4,114),(4748,2,'U02','Libre',NULL,414,19.2,7,114),(4749,3,'U03','Libre',NULL,442,18,4,114),(4750,4,'U04','Libre',NULL,251,26.2,6,114),(4751,5,'U05','Libre',NULL,230,26.6,3,114),(4752,6,'U06','Libre',NULL,222,20.1,5,114),(4753,7,'U07','Libre',NULL,346,19.6,2,114),(4754,8,'U08','Libre',NULL,294,25.4,6,114),(4755,9,'U09','Libre',NULL,288,22.3,3,114),(4756,10,'U10','Libre',NULL,290,20.2,2,114),(4757,11,'U11','Libre',NULL,219,18.5,8,114),(4758,12,'U12','Libre',NULL,328,20.8,10,114),(4759,13,'U13','Libre',NULL,414,25.6,5,114),(4760,14,'U14','Libre',NULL,211,18.1,3,114),(4761,15,'U15','Libre',NULL,111,25.4,6,114),(4762,16,'U16','Libre',NULL,475,23.3,5,114),(4763,17,'U17','Libre',NULL,126,26.1,5,114),(4764,18,'U18','Libre',NULL,192,25.4,7,114),(4765,19,'U19','Libre',NULL,403,20.4,6,114),(4766,20,'U20','Libre',NULL,357,26.1,4,114),(4767,21,'U21','Libre',NULL,497,25.3,2,114),(4768,22,'U22','Libre',NULL,425,18.2,2,114),(4769,23,'U23','Libre',NULL,447,23.3,4,114),(4770,24,'U24','Libre',NULL,364,20.8,9,114),(4771,25,'U25','Libre',NULL,328,20.5,1,114),(4772,26,'U26','Libre',NULL,313,24.4,1,114),(4773,27,'U27','Libre',NULL,113,24,9,114),(4774,28,'U28','Libre',NULL,209,24.4,8,114),(4775,29,'U29','Libre',NULL,216,23.4,9,114),(4776,30,'U30','Libre',NULL,350,26.4,1,114),(4777,31,'U31','Libre',NULL,394,23.4,5,114),(4778,32,'U32','Libre',NULL,162,21.6,9,114),(4779,33,'U33','Libre',NULL,205,21.2,2,114),(4780,34,'U34','Libre',NULL,195,25.1,3,114),(4781,35,'U35','Libre',NULL,470,26.4,1,114),(4782,36,'U36','Libre',NULL,309,24.1,1,114),(4783,37,'U37','Libre',NULL,189,24.4,8,114),(4784,38,'U38','Libre',NULL,350,22.9,1,114),(4785,39,'U39','Libre',NULL,125,26.9,7,114),(4786,40,'U40','Libre',NULL,207,24.6,4,114),(4787,41,'U41','Libre',NULL,308,22.6,8,114),(4788,42,'U42','Libre',NULL,491,26.6,10,114),(4789,1,'U01','Libre',NULL,178,20.6,2,115),(4790,2,'U02','Libre',NULL,161,24.5,5,115),(4791,3,'U03','Libre',NULL,423,20.7,9,115),(4792,4,'U04','Libre',NULL,152,22.4,5,115),(4793,5,'U05','Libre',NULL,462,23.7,6,115),(4794,6,'U06','Libre',NULL,302,24.8,9,115),(4795,7,'U07','Libre',NULL,132,20.6,3,115),(4796,8,'U08','Libre',NULL,240,18.5,10,115),(4797,9,'U09','Libre',NULL,105,22.6,7,115),(4798,10,'U10','Libre',NULL,417,19.7,5,115),(4799,11,'U11','Libre',NULL,196,21.1,7,115),(4800,12,'U12','Libre',NULL,277,22.2,7,115),(4801,13,'U13','Libre',NULL,228,21.5,8,115),(4802,14,'U14','Libre',NULL,442,22.1,5,115),(4803,15,'U15','Libre',NULL,423,20.5,2,115),(4804,16,'U16','Libre',NULL,229,21.9,5,115),(4805,17,'U17','Libre',NULL,121,26.6,7,115),(4806,18,'U18','Libre',NULL,389,19.3,7,115),(4807,19,'U19','Libre',NULL,492,22.9,10,115),(4808,20,'U20','Libre',NULL,474,20,10,115),(4809,21,'U21','Libre',NULL,193,20.6,10,115),(4810,22,'U22','Libre',NULL,335,25.5,2,115),(4811,23,'U23','Libre',NULL,463,23.8,2,115),(4812,24,'U24','Libre',NULL,312,18.5,9,115),(4813,25,'U25','Libre',NULL,135,21.6,6,115),(4814,26,'U26','Libre',NULL,497,19.3,9,115),(4815,27,'U27','Libre',NULL,472,20,6,115),(4816,28,'U28','Libre',NULL,269,26.1,9,115),(4817,29,'U29','Libre',NULL,192,26.4,3,115),(4818,30,'U30','Libre',NULL,494,26.2,2,115),(4819,31,'U31','Libre',NULL,284,24.3,4,115),(4820,32,'U32','Libre',NULL,182,23.2,6,115),(4821,33,'U33','Libre',NULL,207,25.2,9,115),(4822,34,'U34','Libre',NULL,378,24.6,2,115),(4823,35,'U35','Libre',NULL,194,18.5,10,115),(4824,36,'U36','Libre',NULL,500,26.5,4,115),(4825,37,'U37','Libre',NULL,325,20.4,3,115),(4826,38,'U38','Libre',NULL,268,23.6,2,115),(4827,39,'U39','Libre',NULL,206,23.5,7,115),(4828,40,'U40','Libre',NULL,380,19.1,8,115),(4829,41,'U41','Libre',NULL,306,19.8,4,115),(4830,42,'U42','Libre',NULL,152,22.2,2,115),(4831,1,'U01','Libre',NULL,271,22.6,8,116),(4832,2,'U02','Libre',NULL,362,18.9,3,116),(4833,3,'U03','Libre',NULL,187,24.8,5,116),(4834,4,'U04','Libre',NULL,459,21.1,7,116),(4835,5,'U05','Libre',NULL,443,25.3,5,116),(4836,6,'U06','Libre',NULL,132,26.2,10,116),(4837,7,'U07','Libre',NULL,259,22.4,1,116),(4838,8,'U08','Libre',NULL,434,25,7,116),(4839,9,'U09','Libre',NULL,495,24.5,9,116),(4840,10,'U10','Libre',NULL,275,25.8,8,116),(4841,11,'U11','Libre',NULL,194,18.2,10,116),(4842,12,'U12','Libre',NULL,137,20.7,3,116),(4843,13,'U13','Libre',NULL,200,26.1,1,116),(4844,14,'U14','Libre',NULL,268,25,3,116),(4845,15,'U15','Libre',NULL,225,26.8,3,116),(4846,16,'U16','Libre',NULL,486,24.9,2,116),(4847,17,'U17','Libre',NULL,430,23.6,1,116),(4848,18,'U18','Libre',NULL,267,22.7,9,116),(4849,19,'U19','Libre',NULL,395,22.6,10,116),(4850,20,'U20','Libre',NULL,349,26.9,4,116),(4851,21,'U21','Libre',NULL,286,22.3,3,116),(4852,22,'U22','Libre',NULL,464,21.5,8,116),(4853,23,'U23','Libre',NULL,407,24.5,6,116),(4854,24,'U24','Libre',NULL,185,22.7,8,116),(4855,25,'U25','Libre',NULL,141,26.2,7,116),(4856,26,'U26','Libre',NULL,376,18.3,4,116),(4857,27,'U27','Libre',NULL,211,23.6,8,116),(4858,28,'U28','Libre',NULL,160,21.5,6,116),(4859,29,'U29','Libre',NULL,117,21,2,116),(4860,30,'U30','Libre',NULL,133,19.5,9,116),(4861,31,'U31','Libre',NULL,197,26.6,1,116),(4862,32,'U32','Libre',NULL,460,18.1,9,116),(4863,33,'U33','Libre',NULL,199,18.2,4,116),(4864,34,'U34','Libre',NULL,291,24.8,3,116),(4865,35,'U35','Libre',NULL,370,25.6,3,116),(4866,36,'U36','Libre',NULL,493,24.5,2,116),(4867,37,'U37','Libre',NULL,225,19.1,4,116),(4868,38,'U38','Libre',NULL,451,26.9,9,116),(4869,39,'U39','Libre',NULL,170,20.9,7,116),(4870,40,'U40','Libre',NULL,368,18.4,6,116),(4871,41,'U41','Libre',NULL,393,26.5,4,116),(4872,42,'U42','Libre',NULL,105,26,8,116),(4873,1,'U01','Libre',NULL,114,25.1,7,117),(4874,2,'U02','Libre',NULL,101,26.9,9,117),(4875,3,'U03','Libre',NULL,212,18.4,8,117),(4876,4,'U04','Libre',NULL,233,19.1,4,117),(4877,5,'U05','Libre',NULL,135,26.8,8,117),(4878,6,'U06','Libre',NULL,189,21.5,2,117),(4879,7,'U07','Libre',NULL,355,20.4,4,117),(4880,8,'U08','Libre',NULL,326,21.7,8,117),(4881,9,'U09','Libre',NULL,387,26.2,3,117),(4882,10,'U10','Libre',NULL,337,18,5,117),(4883,11,'U11','Libre',NULL,155,21.3,7,117),(4884,12,'U12','Libre',NULL,219,23.1,5,117),(4885,13,'U13','Libre',NULL,338,22.1,7,117),(4886,14,'U14','Libre',NULL,260,26.6,3,117),(4887,15,'U15','Libre',NULL,268,25.6,8,117),(4888,16,'U16','Libre',NULL,433,21.4,7,117),(4889,17,'U17','Libre',NULL,153,22.9,4,117),(4890,18,'U18','Libre',NULL,280,19.6,5,117),(4891,19,'U19','Libre',NULL,134,21.4,9,117),(4892,20,'U20','Libre',NULL,475,24.1,1,117),(4893,21,'U21','Libre',NULL,234,19.3,3,117),(4894,22,'U22','Libre',NULL,129,26.1,9,117),(4895,23,'U23','Libre',NULL,242,19.6,5,117),(4896,24,'U24','Libre',NULL,184,20.7,8,117),(4897,25,'U25','Libre',NULL,250,18.4,8,117),(4898,26,'U26','Libre',NULL,132,23.7,7,117),(4899,27,'U27','Libre',NULL,431,18.8,8,117),(4900,28,'U28','Libre',NULL,189,20.7,8,117),(4901,29,'U29','Libre',NULL,374,23.9,6,117),(4902,30,'U30','Libre',NULL,186,18.1,2,117),(4903,31,'U31','Libre',NULL,220,23.1,8,117),(4904,32,'U32','Libre',NULL,268,21.8,6,117),(4905,33,'U33','Libre',NULL,367,24.8,8,117),(4906,34,'U34','Libre',NULL,400,19.3,6,117),(4907,35,'U35','Libre',NULL,357,26.4,5,117),(4908,36,'U36','Libre',NULL,357,23.4,9,117),(4909,37,'U37','Libre',NULL,175,22.4,7,117),(4910,38,'U38','Libre',NULL,285,22.2,10,117),(4911,39,'U39','Libre',NULL,494,20.1,2,117),(4912,40,'U40','Libre',NULL,249,20.1,8,117),(4913,41,'U41','Libre',NULL,433,26.1,5,117),(4914,42,'U42','Libre',NULL,495,24.6,6,117),(4915,1,'U01','Libre',NULL,183,18.8,3,118),(4916,2,'U02','Libre',NULL,200,26.2,8,118),(4917,3,'U03','Libre',NULL,262,23.8,8,118),(4918,4,'U04','Libre',NULL,434,18,4,118),(4919,5,'U05','Libre',NULL,246,22.1,3,118),(4920,6,'U06','Libre',NULL,151,20.3,8,118),(4921,7,'U07','Libre',NULL,354,22.8,1,118),(4922,8,'U08','Libre',NULL,250,26.2,9,118),(4923,9,'U09','Libre',NULL,293,23.2,7,118),(4924,10,'U10','Libre',NULL,298,24.8,5,118),(4925,11,'U11','Libre',NULL,363,20.5,8,118),(4926,12,'U12','Libre',NULL,154,18.7,4,118),(4927,13,'U13','Libre',NULL,157,19.6,2,118),(4928,14,'U14','Libre',NULL,256,20.7,2,118),(4929,15,'U15','Libre',NULL,362,18.9,10,118),(4930,16,'U16','Libre',NULL,128,22.4,7,118),(4931,17,'U17','Libre',NULL,361,23.8,4,118),(4932,18,'U18','Libre',NULL,167,19.5,6,118),(4933,19,'U19','Libre',NULL,468,18.4,10,118),(4934,20,'U20','Libre',NULL,228,22,2,118),(4935,21,'U21','Libre',NULL,463,24,6,118),(4936,22,'U22','Libre',NULL,358,21.2,5,118),(4937,23,'U23','Libre',NULL,492,26,10,118),(4938,24,'U24','Libre',NULL,317,25.3,7,118),(4939,25,'U25','Libre',NULL,460,18.7,9,118),(4940,26,'U26','Libre',NULL,355,20.7,8,118),(4941,27,'U27','Libre',NULL,220,24.7,9,118),(4942,28,'U28','Libre',NULL,400,21.2,7,118),(4943,29,'U29','Libre',NULL,257,24.8,6,118),(4944,30,'U30','Libre',NULL,219,23.7,1,118),(4945,31,'U31','Libre',NULL,403,20.7,9,118),(4946,32,'U32','Libre',NULL,373,19.5,3,118),(4947,33,'U33','Libre',NULL,441,19.5,3,118),(4948,34,'U34','Libre',NULL,373,24.1,2,118),(4949,35,'U35','Libre',NULL,163,23.3,6,118),(4950,36,'U36','Libre',NULL,448,20.1,9,118),(4951,37,'U37','Libre',NULL,394,18.5,9,118),(4952,38,'U38','Libre',NULL,226,23.5,8,118),(4953,39,'U39','Libre',NULL,214,23.2,1,118),(4954,40,'U40','Libre',NULL,295,18.2,1,118),(4955,41,'U41','Libre',NULL,228,20.7,2,118),(4956,42,'U42','Libre',NULL,462,20.4,6,118),(4957,1,'U01','Libre',NULL,269,22.9,1,119),(4958,2,'U02','Libre',NULL,393,26.3,2,119),(4959,3,'U03','Libre',NULL,478,18.6,6,119),(4960,4,'U04','Libre',NULL,484,22.5,8,119),(4961,5,'U05','Libre',NULL,334,26.9,3,119),(4962,6,'U06','Libre',NULL,461,20.6,4,119),(4963,7,'U07','Libre',NULL,132,23.5,2,119),(4964,8,'U08','Libre',NULL,399,18.4,2,119),(4965,9,'U09','Libre',NULL,244,26.6,5,119),(4966,10,'U10','Libre',NULL,468,25,6,119),(4967,11,'U11','Libre',NULL,312,20.9,5,119),(4968,12,'U12','Libre',NULL,231,24.6,8,119),(4969,13,'U13','Libre',NULL,280,21.1,8,119),(4970,14,'U14','Libre',NULL,497,21.5,7,119),(4971,15,'U15','Libre',NULL,144,22.4,3,119),(4972,16,'U16','Libre',NULL,312,18.6,5,119),(4973,17,'U17','Libre',NULL,444,21.4,6,119),(4974,18,'U18','Libre',NULL,490,25.2,8,119),(4975,19,'U19','Libre',NULL,356,23.8,4,119),(4976,20,'U20','Libre',NULL,467,24.9,7,119),(4977,21,'U21','Libre',NULL,478,25.9,10,119),(4978,22,'U22','Libre',NULL,102,24.3,7,119),(4979,23,'U23','Libre',NULL,288,22.4,5,119),(4980,24,'U24','Libre',NULL,394,25.6,3,119),(4981,25,'U25','Libre',NULL,284,22.4,8,119),(4982,26,'U26','Libre',NULL,317,20.3,3,119),(4983,27,'U27','Libre',NULL,158,23,8,119),(4984,28,'U28','Libre',NULL,374,20.6,4,119),(4985,29,'U29','Libre',NULL,248,25.3,6,119),(4986,30,'U30','Libre',NULL,355,23.3,2,119),(4987,31,'U31','Libre',NULL,496,18.6,9,119),(4988,32,'U32','Libre',NULL,309,21.6,2,119),(4989,33,'U33','Libre',NULL,406,22.8,2,119),(4990,34,'U34','Libre',NULL,354,19,6,119),(4991,35,'U35','Libre',NULL,169,22,8,119),(4992,36,'U36','Libre',NULL,146,25.8,10,119),(4993,37,'U37','Libre',NULL,388,21.5,5,119),(4994,38,'U38','Libre',NULL,408,23.1,2,119),(4995,39,'U39','Libre',NULL,220,23.7,4,119),(4996,40,'U40','Libre',NULL,389,18.6,10,119),(4997,41,'U41','Libre',NULL,102,26.1,2,119),(4998,42,'U42','Libre',NULL,268,21.5,5,119),(4999,1,'U01','Libre',NULL,351,26.4,8,120),(5000,2,'U02','Libre',NULL,167,23.6,8,120),(5001,3,'U03','Libre',NULL,498,25.4,10,120),(5002,4,'U04','Libre',NULL,409,24.1,1,120),(5003,5,'U05','Libre',NULL,457,24.8,6,120),(5004,6,'U06','Libre',NULL,107,22.3,5,120),(5005,7,'U07','Libre',NULL,133,21,7,120),(5006,8,'U08','Libre',NULL,168,18.6,6,120),(5007,9,'U09','Libre',NULL,234,23,6,120),(5008,10,'U10','Libre',NULL,198,18.4,3,120),(5009,11,'U11','Libre',NULL,453,21.2,4,120),(5010,12,'U12','Libre',NULL,209,20,6,120),(5011,13,'U13','Libre',NULL,124,20.4,10,120),(5012,14,'U14','Libre',NULL,163,22.8,6,120),(5013,15,'U15','Libre',NULL,104,22.7,1,120),(5014,16,'U16','Libre',NULL,451,26.2,10,120),(5015,17,'U17','Libre',NULL,104,24.4,7,120),(5016,18,'U18','Libre',NULL,317,26.2,4,120),(5017,19,'U19','Libre',NULL,296,26.8,4,120),(5018,20,'U20','Libre',NULL,372,18.3,3,120),(5019,21,'U21','Libre',NULL,480,18.1,9,120),(5020,22,'U22','Libre',NULL,449,21.1,9,120),(5021,23,'U23','Libre',NULL,477,18.1,5,120),(5022,24,'U24','Libre',NULL,350,23,3,120),(5023,25,'U25','Libre',NULL,185,18.3,7,120),(5024,26,'U26','Libre',NULL,261,26.6,2,120),(5025,27,'U27','Libre',NULL,421,21.6,4,120),(5026,28,'U28','Libre',NULL,425,25.2,8,120),(5027,29,'U29','Libre',NULL,214,23,3,120),(5028,30,'U30','Libre',NULL,128,23.6,10,120),(5029,31,'U31','Libre',NULL,465,22.8,7,120),(5030,32,'U32','Libre',NULL,382,26.2,8,120),(5031,33,'U33','Libre',NULL,427,23.2,9,120),(5032,34,'U34','Libre',NULL,490,23.7,9,120),(5033,35,'U35','Libre',NULL,371,22.2,1,120),(5034,36,'U36','Libre',NULL,436,22.8,6,120),(5035,37,'U37','Libre',NULL,463,19.3,7,120),(5036,38,'U38','Libre',NULL,491,26.5,10,120),(5037,39,'U39','Libre',NULL,172,19.7,10,120),(5038,40,'U40','Libre',NULL,422,26,10,120),(5039,41,'U41','Libre',NULL,373,25.7,3,120),(5040,42,'U42','Libre',NULL,173,23.3,4,120);
/*!40000 ALTER TABLE `unit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `roles` longtext NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `discr` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (35,'admin@test.fr','ROLE_ADMIN','Sophie','Martin','$2y$13$UOZyv5h2hch5pECijO4kee1r/fuWCUjOhWTk2BuyzVmFbpDwVHfny','admin'),(36,'accountant@test.fr','ROLE_ACCOUNTANT','Pierre','Dupont','$2y$13$6Ln0Irsj./aQW4UMz2waW.q/tHl7ouc7uGMhY5XMCTKjXx/1z4Bzm','accountant'),(37,'support@test.fr','ROLE_SUPPORT','Marie','Leblanc','$2y$13$FLKyqSqup8rU2nWCps1Vt.VVY57Ie9DrMrGzVLh5IcBekz3JYVeJO','support'),(38,'support2@test.fr','ROLE_SUPPORT','Thomas','Bernard','$2y$13$aSyZLkud2rl/8MX/CuHjuefb7yo79bskTAqKZJ7B9yMsGhVmdo0uq','support'),(39,'tech1@test.fr','ROLE_TECHNICIAN','Lucas','Moreau','$2y$13$6TVUVP5IbohNRUjBchJ7N.//M6sNUC793fdUJDnyaW7Sfx2nUBjz2','technician'),(40,'tech2@test.fr','ROLE_TECHNICIAN','Emma','Petit','$2y$13$d5bGG/ing9wLjDU7J6aqEu2cKhp2m0vFbWQTCVwnqAHhJe3pK6wIa','technician'),(41,'tech3@test.fr','ROLE_TECHNICIAN','Nathan','Simon','$2y$13$2D5W4QANC44ts4B64WJxJ.7678s5GZIoqGPYLdsIjUNn.gVCAhbzK','technician'),(42,'particular@test.fr','ROLE_CUSTOMER','Jean','Durand','$2y$13$RE4zc0WuQ7Gf5XCkvSpIse3J9WDSaIBHDvCJ/L8naZ.Q2a4NHNjpu','particular'),(43,'particular2@test.fr','ROLE_CUSTOMER','Claire','Fontaine','$2y$13$tnA/DR50KiNWw8EojXkmnOM/APS2uWWMLbop79OpMxQFSE3HaWmNW','particular'),(44,'particular3@test.fr','ROLE_CUSTOMER','Antoine','Garnier','$2y$13$C9VQzCWfl/bmfVKQmZkvpegla.ocw53lexuqiqp5Iv6bKn2YFVxA6','particular'),(45,'company@test.fr','ROLE_CUSTOMER','Marc','Leroy','$2y$13$CBrpg.08P.KHw0coLd.Wr.5TdW4levNEw9mO7ddaF4afQSe1eRCLm','company'),(46,'company2@test.fr','ROLE_CUSTOMER','Julie','Morin','$2y$13$lWmeVpkueYKn6s72icOslOnFSImXyRiNPzKahh0ZZTZf4nZJbaiAK','company'),(47,'company3@test.fr','ROLE_CUSTOMER','Kevin','Blanc','$2y$13$EXZCqEBAhHpQb9Z8pHt2s.Mor5TiiU1rmkNapSKxlOUMUyxcPalua','company');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-06 23:41:15

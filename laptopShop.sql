-- MySQL dump 10.13  Distrib 8.0.28, for Linux (x86_64)
--
-- Host: localhost    Database: laptopShop
-- ------------------------------------------------------
-- Server version	8.0.28-0ubuntu0.20.04.3

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account_account`
--

DROP TABLE IF EXISTS `account_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_account` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `username` varchar(30) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `address` varchar(500) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `last_login` datetime(6) NOT NULL,
  `is_admin` tinyint(1) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_account`
--

LOCK TABLES `account_account` WRITE;
/*!40000 ALTER TABLE `account_account` DISABLE KEYS */;
INSERT INTO `account_account` VALUES (1,'pbkdf2_sha256$260000$URj5G4g1FO9Fmt41sEYI4P$IcPFEbZZLiG1edMIkrIz0qDfEprEFwckxehd1bJC9co=','admin','admin@gmail.com','09090909','','2022-02-26 05:58:33.513729','2022-02-26 06:00:37.610967',1,1,1,1);
/*!40000 ALTER TABLE `account_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add account',6,'add_account'),(22,'Can change account',6,'change_account'),(23,'Can delete account',6,'delete_account'),(24,'Can view account',6,'view_account'),(25,'Can add order',7,'add_order'),(26,'Can change order',7,'change_order'),(27,'Can delete order',7,'delete_order'),(28,'Can view order',7,'view_order'),(29,'Can add cart',8,'add_cart'),(30,'Can change cart',8,'change_cart'),(31,'Can delete cart',8,'delete_cart'),(32,'Can view cart',8,'view_cart'),(33,'Can add discount',9,'add_discount'),(34,'Can change discount',9,'change_discount'),(35,'Can delete discount',9,'delete_discount'),(36,'Can view discount',9,'view_discount'),(37,'Can add cart item',10,'add_cartitem'),(38,'Can change cart item',10,'change_cartitem'),(39,'Can delete cart item',10,'delete_cartitem'),(40,'Can view cart item',10,'view_cartitem'),(41,'Can add inventory',11,'add_inventory'),(42,'Can change inventory',11,'change_inventory'),(43,'Can delete inventory',11,'delete_inventory'),(44,'Can view inventory',11,'view_inventory'),(45,'Can add category',12,'add_category'),(46,'Can change category',12,'change_category'),(47,'Can delete category',12,'delete_category'),(48,'Can view category',12,'view_category'),(49,'Can add image',13,'add_image'),(50,'Can change image',13,'change_image'),(51,'Can delete image',13,'delete_image'),(52,'Can view image',13,'view_image'),(53,'Can add product',14,'add_product'),(54,'Can change product',14,'change_product'),(55,'Can delete product',14,'delete_product'),(56,'Can view product',14,'view_product'),(57,'Can add order item',15,'add_orderitem'),(58,'Can change order item',15,'change_orderitem'),(59,'Can delete order item',15,'delete_orderitem'),(60,'Can view order item',15,'view_orderitem');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_account_account_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_account_account_id` FOREIGN KEY (`user_id`) REFERENCES `account_account` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2022-02-26 06:01:52.741881','1','Discount object (1)',1,'[{\"added\": {}}]',9,1),(2,'2022-02-26 06:02:41.635640','2','Discount object (2)',1,'[{\"added\": {}}]',9,1),(3,'2022-02-26 06:07:08.374967','1','Category object (1)',1,'[{\"added\": {}}]',12,1),(4,'2022-02-26 06:07:11.220927','2','Category object (2)',1,'[{\"added\": {}}]',12,1),(5,'2022-02-26 06:07:13.541372','3','Category object (3)',1,'[{\"added\": {}}]',12,1),(6,'2022-02-26 06:07:15.852322','4','Category object (4)',1,'[{\"added\": {}}]',12,1),(7,'2022-02-26 06:07:18.425100','5','Category object (5)',1,'[{\"added\": {}}]',12,1),(8,'2022-02-26 06:07:20.874015','6','Category object (6)',1,'[{\"added\": {}}]',12,1),(9,'2022-02-26 06:07:23.144277','7','Category object (7)',1,'[{\"added\": {}}]',12,1),(10,'2022-02-26 06:09:58.871367','1','Product object (1)',1,'[{\"added\": {}}]',14,1),(11,'2022-02-26 06:11:11.548169','1','Inventory object (1)',1,'[{\"added\": {}}]',11,1),(12,'2022-02-26 06:11:39.170601','1','Image object (1)',1,'[{\"added\": {}}]',13,1),(13,'2022-02-26 07:43:29.511983','1','Order object (1)',1,'[{\"added\": {}}]',7,1),(14,'2022-02-26 07:44:16.621390','1','OrderItem object (1)',1,'[{\"added\": {}}]',15,1),(15,'2022-02-26 09:15:03.127086','1','Product object (1)',3,'',10,1),(16,'2022-02-26 09:15:10.053016','1','admin',3,'',8,1),(17,'2022-03-02 08:05:44.946520','3','Discount object (3)',1,'[{\"added\": {}}]',9,1),(18,'2022-03-02 08:06:13.460664','4','Discount object (4)',1,'[{\"added\": {}}]',9,1),(19,'2022-03-02 08:06:33.790650','5','Discount object (5)',1,'[{\"added\": {}}]',9,1),(20,'2022-03-02 08:08:55.103143','8','Category object (8)',1,'[{\"added\": {}}]',12,1),(21,'2022-03-02 08:09:30.415137','8','Category object (8)',3,'',12,1),(22,'2022-03-02 08:09:45.283320','5','Product object (5)',1,'[{\"added\": {}}]',14,1),(23,'2022-03-02 08:10:47.352334','6','Product object (6)',1,'[{\"added\": {}}]',14,1),(24,'2022-03-02 08:11:36.446877','7','Product object (7)',1,'[{\"added\": {}}]',14,1),(25,'2022-03-02 08:12:41.685773','8','Product object (8)',1,'[{\"added\": {}}]',14,1),(26,'2022-03-02 08:13:40.660897','9','Product object (9)',1,'[{\"added\": {}}]',14,1),(27,'2022-03-02 08:14:34.028739','10','Product object (10)',1,'[{\"added\": {}}]',14,1),(28,'2022-03-02 08:16:01.608117','11','Product object (11)',1,'[{\"added\": {}}]',14,1),(29,'2022-03-02 08:20:26.218320','12','Product object (12)',1,'[{\"added\": {}}]',14,1),(30,'2022-03-02 08:21:42.128415','13','Product object (13)',1,'[{\"added\": {}}]',14,1),(31,'2022-03-02 08:22:29.672122','14','Product object (14)',1,'[{\"added\": {}}]',14,1),(32,'2022-03-02 08:23:28.640812','15','Product object (15)',1,'[{\"added\": {}}]',14,1),(33,'2022-03-02 08:24:30.610132','16','Product object (16)',1,'[{\"added\": {}}]',14,1),(34,'2022-03-02 08:27:09.717443','17','Product object (17)',1,'[{\"added\": {}}]',14,1),(35,'2022-03-02 08:28:26.544314','18','Product object (18)',1,'[{\"added\": {}}]',14,1),(36,'2022-03-02 08:29:41.144493','19','Product object (19)',1,'[{\"added\": {}}]',14,1),(37,'2022-03-02 08:31:11.845847','20','Product object (20)',1,'[{\"added\": {}}]',14,1),(38,'2022-03-02 08:32:26.042938','21','Product object (21)',1,'[{\"added\": {}}]',14,1),(39,'2022-03-02 08:33:39.286533','22','Product object (22)',1,'[{\"added\": {}}]',14,1),(40,'2022-03-02 08:34:43.806492','23','Product object (23)',1,'[{\"added\": {}}]',14,1),(41,'2022-03-02 08:37:16.031385','24','Product object (24)',1,'[{\"added\": {}}]',14,1),(42,'2022-03-02 08:38:41.818663','25','Product object (25)',1,'[{\"added\": {}}]',14,1),(43,'2022-03-02 08:39:21.913080','26','Product object (26)',1,'[{\"added\": {}}]',14,1),(44,'2022-03-02 08:40:07.549685','27','Product object (27)',1,'[{\"added\": {}}]',14,1),(45,'2022-03-02 08:42:20.878308','28','Product object (28)',1,'[{\"added\": {}}]',14,1),(46,'2022-03-02 08:43:28.499598','29','Product object (29)',1,'[{\"added\": {}}]',14,1),(47,'2022-03-02 08:44:10.828439','30','Product object (30)',1,'[{\"added\": {}}]',14,1),(48,'2022-03-02 08:45:01.797128','31','Product object (31)',1,'[{\"added\": {}}]',14,1),(49,'2022-03-02 08:46:22.283811','32','Product object (32)',1,'[{\"added\": {}}]',14,1),(50,'2022-03-02 08:47:12.785477','33','Product object (33)',1,'[{\"added\": {}}]',14,1),(51,'2022-03-02 08:48:18.843040','34','Product object (34)',1,'[{\"added\": {}}]',14,1),(52,'2022-03-02 08:50:34.969835','35','Product object (35)',1,'[{\"added\": {}}]',14,1),(53,'2022-03-02 08:51:27.907625','36','Product object (36)',1,'[{\"added\": {}}]',14,1),(54,'2022-03-02 08:52:07.543304','37','Product object (37)',1,'[{\"added\": {}}]',14,1),(55,'2022-03-02 08:52:49.867086','38','Product object (38)',1,'[{\"added\": {}}]',14,1),(56,'2022-03-02 08:56:11.569588','39','Product object (39)',1,'[{\"added\": {}}]',14,1),(57,'2022-03-02 08:58:10.662053','40','Product object (40)',1,'[{\"added\": {}}]',14,1),(58,'2022-03-02 09:00:32.429143','41','Product object (41)',1,'[{\"added\": {}}]',14,1),(59,'2022-03-02 09:02:34.797762','42','Product object (42)',1,'[{\"added\": {}}]',14,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (6,'account','account'),(1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(5,'sessions','session'),(8,'store','cart'),(10,'store','cartitem'),(12,'store','category'),(9,'store','discount'),(13,'store','image'),(11,'store','inventory'),(7,'store','order'),(15,'store','orderitem'),(14,'store','product');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'account','0001_initial','2022-02-26 05:54:02.088604'),(2,'account','0002_remove_account_image','2022-02-26 05:54:04.102045'),(3,'contenttypes','0001_initial','2022-02-26 05:54:05.525560'),(4,'admin','0001_initial','2022-02-26 05:54:09.988671'),(5,'admin','0002_logentry_remove_auto_add','2022-02-26 05:54:10.107193'),(6,'admin','0003_logentry_add_action_flag_choices','2022-02-26 05:54:10.216449'),(7,'contenttypes','0002_remove_content_type_name','2022-02-26 05:54:13.387538'),(8,'auth','0001_initial','2022-02-26 05:54:22.654258'),(9,'auth','0002_alter_permission_name_max_length','2022-02-26 05:54:25.340878'),(10,'auth','0003_alter_user_email_max_length','2022-02-26 05:54:25.583063'),(11,'auth','0004_alter_user_username_opts','2022-02-26 05:54:25.837930'),(12,'auth','0005_alter_user_last_login_null','2022-02-26 05:54:25.953962'),(13,'auth','0006_require_contenttypes_0002','2022-02-26 05:54:26.192206'),(14,'auth','0007_alter_validators_add_error_messages','2022-02-26 05:54:26.442971'),(15,'auth','0008_alter_user_username_max_length','2022-02-26 05:54:26.554586'),(16,'auth','0009_alter_user_last_name_max_length','2022-02-26 05:54:26.749801'),(17,'auth','0010_alter_group_name_max_length','2022-02-26 05:54:27.286514'),(18,'auth','0011_update_proxy_permissions','2022-02-26 05:54:27.426965'),(19,'auth','0012_alter_user_first_name_max_length','2022-02-26 05:54:27.609187'),(20,'sessions','0001_initial','2022-02-26 05:54:29.756951'),(21,'store','0001_initial','2022-02-26 05:55:02.718849'),(22,'store','0002_auto_20220226_0550','2022-02-26 05:57:57.847090'),(23,'store','0003_alter_inventory_product_id','2022-02-26 06:41:05.807777');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('yvgexvnnrxqwxerovwnsmeoxln694xu3','.eJxVjMsOwiAQAP-FsyFsaXl49O43kF0WpGpoUtqT8d-VpAe9zkzmJQLuWwl7S2uYWZwFiNMvI4yPVLvgO9bbIuNSt3Um2RN52CavC6fn5Wj_BgVb6Vu25JHZQnKgHXNyNJkIZlSKBg0OGElbayZg7T3wFzrKQ3Y6jypm8f4A44Y3zg:1nNq8D:Hm2oa-iZ2t1vT2tT7YKZoro8FShc97cxfpTaaciuDwc','2022-03-12 06:00:37.722447');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_cart`
--

DROP TABLE IF EXISTS `store_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store_cart` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `total` int NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `user_id_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id_id` (`user_id_id`),
  CONSTRAINT `store_cart_user_id_id_9e1fc0e0_fk_account_account_id` FOREIGN KEY (`user_id_id`) REFERENCES `account_account` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_cart`
--

LOCK TABLES `store_cart` WRITE;
/*!40000 ALTER TABLE `store_cart` DISABLE KEYS */;
INSERT INTO `store_cart` VALUES (5,42381000,'2022-03-02 09:24:14.781951',1);
/*!40000 ALTER TABLE `store_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_cartitem`
--

DROP TABLE IF EXISTS `store_cartitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store_cartitem` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL,
  `cart_id_id` bigint NOT NULL,
  `product_id_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `store_cartitem_cart_id_id_5ddbc6e4_fk_store_cart_id` (`cart_id_id`),
  KEY `store_cartitem_product_id_id_b6408ba4_fk_store_product_id` (`product_id_id`),
  CONSTRAINT `store_cartitem_cart_id_id_5ddbc6e4_fk_store_cart_id` FOREIGN KEY (`cart_id_id`) REFERENCES `store_cart` (`id`),
  CONSTRAINT `store_cartitem_product_id_id_b6408ba4_fk_store_product_id` FOREIGN KEY (`product_id_id`) REFERENCES `store_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_cartitem`
--

LOCK TABLES `store_cartitem` WRITE;
/*!40000 ALTER TABLE `store_cartitem` DISABLE KEYS */;
INSERT INTO `store_cartitem` VALUES (7,2,5,1),(8,1,5,25);
/*!40000 ALTER TABLE `store_cartitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_category`
--

DROP TABLE IF EXISTS `store_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_category`
--

LOCK TABLES `store_category` WRITE;
/*!40000 ALTER TABLE `store_category` DISABLE KEYS */;
INSERT INTO `store_category` VALUES (1,'Dell'),(2,'Asus'),(3,'HP'),(4,'Lenovo'),(5,'Apple'),(6,'Razer'),(7,'Acer');
/*!40000 ALTER TABLE `store_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_discount`
--

DROP TABLE IF EXISTS `store_discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store_discount` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `desc` longtext NOT NULL,
  `discount_percent` int NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_discount`
--

LOCK TABLES `store_discount` WRITE;
/*!40000 ALTER TABLE `store_discount` DISABLE KEYS */;
INSERT INTO `store_discount` VALUES (1,'HNY2022','Happy new year 2022',30,1,'2022-02-26 06:01:52.738922','2022-02-26 06:01:52.739074'),(2,'DC50','Discount 50%',50,1,'2022-02-26 06:02:41.630529','2022-02-26 06:02:41.630732'),(3,'C35','Happy Christmas',35,1,'2022-03-02 08:05:44.945356','2022-03-02 08:05:44.945400'),(4,'MOS20','Month of sales',20,1,'2022-03-02 08:06:13.454311','2022-03-02 08:06:13.454454'),(5,'DOB','Date of birth',10,1,'2022-03-02 08:06:33.785792','2022-03-02 08:06:33.786012');
/*!40000 ALTER TABLE `store_discount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_image`
--

DROP TABLE IF EXISTS `store_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store_image` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `path` varchar(100) NOT NULL,
  `main_image` tinyint(1) NOT NULL,
  `product_id_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `store_image_product_id_id_42e8703f_fk_store_product_id` (`product_id_id`),
  CONSTRAINT `store_image_product_id_id_42e8703f_fk_store_product_id` FOREIGN KEY (`product_id_id`) REFERENCES `store_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_image`
--

LOCK TABLES `store_image` WRITE;
/*!40000 ALTER TABLE `store_image` DISABLE KEYS */;
INSERT INTO `store_image` VALUES (1,'Screenshot_from_2022-02-18_13-48-07.png',1,1),(2,'1.png',0,1),(5,'Screenshot from 2022-02-28 08-03-28.png',1,4),(6,'Screenshot from 2022-02-18 13-48-07.png',0,4),(7,'img2.jpg',1,5),(8,'img1.jpg',0,5),(9,'img2.jpg',1,6),(10,'img3.jpg',0,6),(11,'img3.jpg',1,7),(12,'img4.jpg',0,7),(13,'img5.jpeg',1,8),(14,'img4.jpg',0,8),(15,'img6.jpg',1,9),(16,'img7.jpg',0,9),(17,'img8.jpeg',1,10),(18,'img1.jpg',0,10),(19,'img1.jpg',1,11),(20,'img2.jpg',0,11),(21,'img2.jpg',1,12),(22,'img3.jpg',0,12),(23,'img3.jpg',1,13),(24,'img4.jpg',0,13),(25,'img5.jpeg',1,14),(26,'img6.jpg',0,14),(27,'img6.jpg',1,15),(28,'img7.jpg',0,15),(29,'img7.jpg',1,16),(30,'img8.jpeg',0,16),(31,'img1.jpg',1,17),(32,'img3.jpg',0,17),(33,'img8.jpeg',1,18),(34,'img2.jpg',0,18),(35,'img2.jpg',1,19),(36,'img4.jpg',0,19),(37,'img4.jpg',1,20),(38,'img6.jpg',0,20),(39,'img6.jpg',1,21),(40,'img7.jpg',0,21),(41,'img7.jpg',1,22),(42,'img8.jpeg',0,22),(43,'img2.jpg',1,23),(44,'img1.jpg',0,23),(45,'img7.jpg',1,25),(46,'img6.jpg',0,25),(47,'img3.jpg',1,24),(48,'img2.jpg',0,24),(49,'img1.jpg',1,26),(50,'img3.jpg',0,26),(51,'img5.jpeg',1,27),(52,'img6.jpg',0,27),(53,'img6.jpg',1,28),(54,'img2.jpg',0,28),(55,'img8.jpeg',1,29),(56,'img2.jpg',0,29),(57,'img3.jpg',1,30),(58,'img2.jpg',0,30),(59,'img7.jpg',1,32),(60,'img2.jpg',0,32),(61,'img1.jpg',1,31),(62,'img5.jpeg',0,31),(63,'img7.jpg',1,33),(64,'img3.jpg',0,33),(65,'img4.jpg',1,34),(66,'img6.jpg',0,34),(67,'img2.jpg',1,35),(68,'img5.jpeg',0,35),(69,'img2.jpg',1,36),(70,'img5.jpeg',0,36),(71,'img1.jpg',1,37),(72,'img8.jpeg',0,37),(73,'img4.jpg',1,38),(74,'img1.jpg',0,38),(75,'img4.jpg',1,39),(76,'img6.jpg',0,39),(77,'img7.jpg',1,41),(78,'img1.jpg',0,41),(79,'img1.jpg',1,42),(80,'img8.jpeg',0,42),(81,'img7.jpg',1,40),(82,'img5.jpeg',0,40);
/*!40000 ALTER TABLE `store_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_inventory`
--

DROP TABLE IF EXISTS `store_inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store_inventory` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
  `product_id_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `store_inventory_product_id_id_84a9d47e_uniq` (`product_id_id`),
  CONSTRAINT `store_inventory_product_id_id_84a9d47e_fk_store_product_id` FOREIGN KEY (`product_id_id`) REFERENCES `store_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_inventory`
--

LOCK TABLES `store_inventory` WRITE;
/*!40000 ALTER TABLE `store_inventory` DISABLE KEYS */;
INSERT INTO `store_inventory` VALUES (1,100,'2022-02-26 06:11:11.546742','2022-03-01 13:08:47.660565',NULL,1),(4,4,'2022-03-01 13:24:36.424107','2022-03-01 13:24:36.424359',NULL,4),(5,50,'2022-03-02 09:12:19.129518','2022-03-02 09:12:19.129769',NULL,5),(6,50,'2022-03-02 09:12:35.700245','2022-03-02 09:12:35.700456',NULL,6),(7,50,'2022-03-02 09:12:50.057501','2022-03-02 09:12:50.057546',NULL,7),(8,50,'2022-03-02 09:13:08.427395','2022-03-02 09:13:08.427563',NULL,8),(9,50,'2022-03-02 09:13:39.117703','2022-03-02 09:13:39.117917',NULL,9),(10,50,'2022-03-02 09:14:03.677059','2022-03-02 09:14:03.677205',NULL,10),(11,50,'2022-03-02 09:14:19.924146','2022-03-02 09:14:19.924284',NULL,11),(12,50,'2022-03-02 09:14:32.664039','2022-03-02 09:14:32.664106',NULL,12),(13,50,'2022-03-02 09:14:48.101012','2022-03-02 09:14:48.101172',NULL,13),(14,50,'2022-03-02 09:15:01.841918','2022-03-02 09:15:01.842118',NULL,14),(15,5,'2022-03-02 09:15:16.257611','2022-03-02 09:15:16.257884',NULL,15),(16,50,'2022-03-02 09:15:29.172063','2022-03-02 09:15:29.172248',NULL,16),(17,50,'2022-03-02 09:15:43.294525','2022-03-02 09:15:43.294648',NULL,17),(18,50,'2022-03-02 09:15:57.390198','2022-03-02 09:15:57.390399',NULL,18),(19,50,'2022-03-02 09:16:24.242538','2022-03-02 09:16:24.242776',NULL,19),(20,50,'2022-03-02 09:16:50.252601','2022-03-02 09:16:50.252693',NULL,20),(21,50,'2022-03-02 09:17:45.304995','2022-03-02 09:17:45.305057',NULL,21),(22,50,'2022-03-02 09:18:03.105904','2022-03-02 09:18:03.106105',NULL,22),(23,50,'2022-03-02 09:18:20.285819','2022-03-02 09:18:20.286046',NULL,23),(24,50,'2022-03-02 09:18:32.933206','2022-03-02 09:18:32.933417',NULL,25),(25,50,'2022-03-02 09:18:49.638879','2022-03-02 09:18:49.639078',NULL,24),(26,50,'2022-03-02 09:19:05.641327','2022-03-02 09:19:05.641702',NULL,26),(27,50,'2022-03-02 09:19:19.219858','2022-03-02 09:19:19.219951',NULL,27),(28,2,'2022-03-02 09:19:33.227842','2022-03-02 09:19:33.228063',NULL,28),(29,50,'2022-03-02 09:19:47.455703','2022-03-02 09:19:47.455853',NULL,29),(30,50,'2022-03-02 09:20:04.845569','2022-03-02 09:20:04.845687',NULL,30),(31,50,'2022-03-02 09:20:17.854871','2022-03-02 09:20:17.855105',NULL,32),(32,5,'2022-03-02 09:20:32.704162','2022-03-02 09:20:32.704402',NULL,31),(33,50,'2022-03-02 09:20:46.965246','2022-03-02 09:20:46.965403',NULL,33),(34,50,'2022-03-02 09:20:58.758600','2022-03-02 09:20:58.758746',NULL,34),(35,50,'2022-03-02 09:21:12.854185','2022-03-02 09:21:12.854372',NULL,35),(36,50,'2022-03-02 09:21:25.157436','2022-03-02 09:21:25.157535',NULL,36),(37,50,'2022-03-02 09:21:39.472343','2022-03-02 09:21:39.472546',NULL,37),(38,50,'2022-03-02 09:21:52.785321','2022-03-02 09:21:52.785466',NULL,38),(39,59,'2022-03-02 09:22:07.582308','2022-03-02 09:22:07.582458',NULL,39),(40,56,'2022-03-02 09:22:22.058360','2022-03-02 09:22:22.058714',NULL,41),(41,50,'2022-03-02 09:22:38.818231','2022-03-02 09:22:38.818379',NULL,42),(42,56,'2022-03-02 09:22:53.639386','2022-03-02 09:22:53.639584',NULL,40);
/*!40000 ALTER TABLE `store_inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_order`
--

DROP TABLE IF EXISTS `store_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store_order` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `total` int NOT NULL,
  `status` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
  `user_id_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `store_order_user_id_id_8dbed127_fk_account_account_id` (`user_id_id`),
  CONSTRAINT `store_order_user_id_id_8dbed127_fk_account_account_id` FOREIGN KEY (`user_id_id`) REFERENCES `account_account` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_order`
--

LOCK TABLES `store_order` WRITE;
/*!40000 ALTER TABLE `store_order` DISABLE KEYS */;
INSERT INTO `store_order` VALUES (1,18900000,'Chờ xác nhận','Nghệ An','2022-02-26 07:43:29.127516','2022-03-01 09:38:29.825770',NULL,1),(2,26460000,'Hoàn thành','Nghệ An','2022-03-01 03:12:25.172924','2022-03-01 03:12:25.172964',NULL,1),(3,13230000,'Đã hủy','Lào Cai','2022-03-01 03:14:56.711135','2022-03-01 03:19:51.702214',NULL,1);
/*!40000 ALTER TABLE `store_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_orderitem`
--

DROP TABLE IF EXISTS `store_orderitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store_orderitem` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL,
  `price` int NOT NULL,
  `order_id_id` bigint NOT NULL,
  `product_id_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `store_orderitem_order_id_id_d17ddd16_fk_store_order_id` (`order_id_id`),
  KEY `store_orderitem_product_id_id_775f38bb_fk_store_product_id` (`product_id_id`),
  CONSTRAINT `store_orderitem_order_id_id_d17ddd16_fk_store_order_id` FOREIGN KEY (`order_id_id`) REFERENCES `store_order` (`id`),
  CONSTRAINT `store_orderitem_product_id_id_775f38bb_fk_store_product_id` FOREIGN KEY (`product_id_id`) REFERENCES `store_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_orderitem`
--

LOCK TABLES `store_orderitem` WRITE;
/*!40000 ALTER TABLE `store_orderitem` DISABLE KEYS */;
INSERT INTO `store_orderitem` VALUES (1,1,12500000,1,1),(2,2,567000000,2,1),(3,1,567000000,3,1);
/*!40000 ALTER TABLE `store_orderitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_product`
--

DROP TABLE IF EXISTS `store_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store_product` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `desc` longtext NOT NULL,
  `CPU` varchar(100) NOT NULL,
  `RAM` varchar(50) NOT NULL,
  `Card` varchar(50) NOT NULL,
  `Screen` varchar(50) NOT NULL,
  `price` int NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
  `category_id_id` bigint NOT NULL,
  `discount_id_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `store_product_category_id_id_25b26124_fk_store_category_id` (`category_id_id`),
  KEY `store_product_discount_id_id_a519ac59_fk_store_discount_id` (`discount_id_id`),
  CONSTRAINT `store_product_category_id_id_25b26124_fk_store_category_id` FOREIGN KEY (`category_id_id`) REFERENCES `store_category` (`id`),
  CONSTRAINT `store_product_discount_id_id_a519ac59_fk_store_discount_id` FOREIGN KEY (`discount_id_id`) REFERENCES `store_discount` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_product`
--

LOCK TABLES `store_product` WRITE;
/*!40000 ALTER TABLE `store_product` DISABLE KEYS */;
INSERT INTO `store_product` VALUES (1,'Asus Zenbook Q408UG- AMD Ryzen 5','Asus pro','AMD Ryzen 5 5500U','RAM 8GB LPDDR4','Card rời Geforce MX350 2GB.','Full HD IPS chuẩn',18900000,'2022-02-26 06:09:58.799951','2022-03-01 13:08:47.528137',NULL,5,1),(4,'New Pro','Vip','AMD Ryzen 5 5500U','RAM 8GB LPDDR4','Card rời Geforce MX350 2GB.','Full HD IPS chuẩn',100000,'2022-03-01 13:24:36.229516','2022-03-01 13:24:36.229554',NULL,1,2),(5,'Laptop Dell Vostro 15 5515 R1505A - AMD Ryzen 5','Laptop Dell Vostro chip AMD series 5000 mạnh mẽ, card radeon vega 7 mạnh mẽ xử lý tốt các tác vụ đồ họa 2D, chơi game nhẹ nhàng. Pin trâu, giá ổn, bền bỉ','AMD R5 5500U','8GB DDR4','AMD Radeon Vega 7','15.6 Inch Full HD',17690000,'2022-03-02 08:09:45.280988','2022-03-02 09:12:18.977575',NULL,1,3),(6,'Laptop Lenovo Thinkbook 15 G3 ACL 21A400CHVN - AMD Ryzen 3','Laptop Lenovo thinkbook AMD Ryzen 3, đáp ứng mọi nhu cầu thiết kế đồ họa 2D, edit video, chỉnh sửa ảnh, game nhẹ.\r\nBền bỉ, chắc chắn, thiết kế đẹp','AMD Ryzen 3-5300U','RAM 8GB DDR4','AMD Radeon Graphics','15.6 Inch Full HD',15490000,'2022-03-02 08:10:47.348611','2022-03-02 09:12:35.489840',NULL,4,4),(7,'Laptop Dell Inspiron 15 3511 5101BLK - Intel Core i5','Laptop Dell Core i5 Inspiron thiết kế sang trọng mỏng nhẹ, cấu hình cao đáp ứng tốt mọi nhu cầu làm việc học tập, chỉnh sửa ảnh, game nhẹ. Cao cấp, siêu bền bỉ','Intel Core i5 1135G7','RAM 8GB DDR4','Card Intel® Iris Xe Graphics','15.6 Inch Full HD Cảm ứng',16590000,'2022-03-02 08:11:36.442764','2022-03-02 09:12:49.950903',NULL,1,1),(8,'Laptop Lenovo Thinkpad T470 - Intel Core i5','Laptop Lenovo Thinkpad T470 i5 bền bỉ, cấu hình đáp ứng mọi nhu cầu làm việc học tập','Intel Core i5 6300U','RAM 8GB','Card Intel HD Graphics','14 Inch Full HD',10990000,'2022-03-02 08:12:41.683708','2022-03-02 09:13:08.316033',NULL,4,5),(9,'[Mới 100% Full Box] Laptop Asus Zenbook Q408UG- AMD Ryzen 5','Laptop văn phòng cao cấp, sang trọng, mỏng nhẹ chỉ khoảng 1.15kg. Card rời Geforce MX350 2GB. Màn hình Full HD IPS chuẩn. Bảo hành 12 tháng.','AMD Ryzen 5 5500U','RAM 8GB LPDDR4','Card rời Geforce MX450 2GB','14 Inch Full HD 100% sRGB',17990000,'2022-03-02 08:13:40.659018','2022-03-02 09:13:38.926643',NULL,2,2),(10,'Laptop Cũ Lenovo Thinkpad X1 Carbon Gen 5 - Intel Core i5','Laptop Lenovo Thinkpad X1 Carbon Gen 5 siêu cao cấp, mỏng nhẹ, siêu bền với cấu hình khỏe đáp ứng mọi nhu cầu làm việc. Màn gần 100% sRGB siêu đẹp, chuẩn màu','Intel Core i5-6200U','RAM 8GB LPDDR3','Card Intel HD Graphics','14 Inch Full HD',14790000,'2022-03-02 08:14:34.026457','2022-03-02 09:14:03.530468',NULL,4,4),(11,'Laptop HP Notebook 14s cr2005tu - Intel Core i5','Laptop cũ HP core i5 thời trang mỏng nhẹ, cấu hình cao đáp ứng mọi nhu cầu làm việc học tập.\r\nMàn Full HD sáng đẹp sắc nét. Giá cực tốt','Intel Core i5-10210U','RAM 8GB DDR4','Intel UHD Graphics','14 Inch Full HD',13990000,'2022-03-02 08:16:01.606852','2022-03-02 09:14:19.606915',NULL,3,1),(12,'Lenovo Thinkpad E14 Gen 2 ITU 20TA00ABVA - Intel Core i5','Laptop Lenovo Thinkpad cấu hình cao, siêu bền bỉ, mỏng nhẹ, trải nghiệm sử dụng cực thích. Làm tốt các tác vụ đồ họa, chơi game nhẹ, các tác vụ phức tạp, màn hình IPS sáng đẹp','Intel Core i5-1135G7','8GB DDR4','Intel® Iris Xe Graphics','14 Inch Full HD IPS',19390000,'2022-03-02 08:20:26.212094','2022-03-02 09:14:32.589979',NULL,4,1),(13,'Laptop Lenovo Ideapad Yoga 6 13ALC6 82ND00BDVN - AMD Ryzen 7','Laptop Lenovo Ideapad Yoga 6 cấu hình cao\r\nThiết kế cao cấp bền chắc, sang trọng\r\nXoay gập 360 linh hoạt\r\nBảo hành cực dài 36 tháng Lenovo','AMD Ryzen 7 5700U','8GB DDR4','AMD Radeon Graphics','13 FHD Touch 300 nits 100% sRGB',26290000,'2022-03-02 08:21:42.127163','2022-03-02 09:14:47.975175',NULL,4,5),(14,'[Mới 100% Full Box] Laptop Acer Swift X SFX16-51G-516Q NX.AYKSV.002 - Intel Core i5','Laptop Acer Swift X cao cấp sang trọng, cấu hình cao, màn hình 16 inch kích thước lớn. Phù hợp với creator, người sáng tạo nội dung','Intel Core i5-11320H','16GB LPDDR4','Nvidia RTX 3050 4GB','16 inch Full HD',26290000,'2022-03-02 08:22:29.668360','2022-03-02 09:15:01.583665',NULL,7,1),(15,'[Mới 100% Full Box] Laptop Acer Aspire 7 A715-42G-R4ST / R4XX - AMD Ryzen 5 5500U','Laptop gaming Acer Aspire 7 Ryzen 5500U giá rẻ, cấu hình tốt\r\nChip Ryzen 5 đời 5, card rời GTX 1650 4GB\r\nR4ST - Win 10, R4XX - Win 11','AMD R5-5500U','RAM 8GB DDR4','Nvidia GTX 1650 4GB','15.6 Inch Full HD',17490000,'2022-03-02 08:23:28.639615','2022-03-02 09:15:16.009534',NULL,7,5),(16,'Laptop Acer Nitro 5 Eagle AN515-57-536Q- Intel Core i5 11400H GTX 1650','Laptop Acer Nitro 5 Eagle Mạnh Mẽ RẺ NHẤT THỊ TRƯỜNG\r\nCấu hình Intel Core i5 11400H, Card đồ họa GTX 1650 chiến mượt mọi game\r\nBảo hành 12 tháng Laptop88','Intel Core i5 - 11400H','8GB DDR4','Nvidia Geforce GTX 1650 4GB','15.6 inch Full HD 144hz',19590000,'2022-03-02 08:24:30.608010','2022-03-02 09:15:29.044705',NULL,7,1),(17,'Razer Blade Stealth 13 (2021)','Razer Blade Stealth 13 đánh giá là một chiếc Ultrabook Gaming có hiệu năng mạnh mẽ. Nó có thể cân mọi thể loại game cũng như các phần mềm đồ họa nặng. Bên cạnh đó là thiết kế nhỏ gọn, hiện đại với viền màn hình sắc nét. Mang đến trải nghiệm vô cùng tuyệt vời.','11th Gen Intel® Core™ i7-1165G7 Quad-Core Processor','16GB dual-channel','NVIDIA® GeForce GTX 1650 Ti Max-Q (4GB GDDR6 VRAM)','13.3\" Full HD Matte 120Hz',49999000,'2022-03-02 08:27:09.715721','2022-03-02 09:15:43.178515',NULL,6,4),(18,'Razer Blade 14 AMD','Razer Blade 14 AMD là cái tên được nhắc đến nhiều nhất hiện nay trong cuộc đua giữa các ông lớn trong dòng sản phẩm laptop gaming. Tuy mới ra mắt không lâu, nhưng Razer 14 lại nhận được rất nhiều đánh giá tích cực về thiết kế và hiệu suất vô cùng mạnh mẽ.','AMD Ryzen™ 9 5900HX (3.3GHz, Up to 4.6GHz, 8 Core)','16GB DDR4 2933Mhz','NVIDIA® GeForce RTX™ 3060 (6GB VRAM)','14-inch FHD 144Hz, 1920 x 1080',49990000,'2022-03-02 08:28:26.543177','2022-03-02 09:15:57.299201',NULL,6,5),(19,'Razer Blade 17','Razer Blade 17 (2021) là một trong những chiếc laptop gaming cao cấp đang được săn đón nhất ở thời điểm hiện tai. Khôn chỉ sở hữu thiết kế đẹp mắt với nhiều tính năng ưu việt hơn hẳn các đối thủ. Giúp nó trở thành một trong những quái thú chiến game cực đỉnh dành cho các game thủ','2.3GHz 8-core Intel i7-11800H processor','16GB DDR4 3200MHz dual-channel memory','NVIDIA® GeForce® RTX 3060 (6GB DDR6 VRAM)','17.3″ FHD 360Hz, 100% sRGB, 6mm bezels',59990000,'2022-03-02 08:29:41.143261','2022-03-02 09:16:24.026530',NULL,6,1),(20,'65999000','Razer Blade 15 là một trong những con “quái thú” trong làng gaming khiến nhiều anh em ao ước. Nó sở hữu card đồ hoạ RTX 3060 cho khả năng chiến game mạnh mẽ. Bên cạnh đó, nó còn cân tốt mọi phần mềm đồ hoạ 2D, 3D. Ngoài ra, màn hình với độ phân giải cao QHD mang đến cho người dùng trải nghiệm vô cùng tuyệt vời khi chơi game.','Intel® Core™ i7-11800H 8 Cores','16GB DDR4 3200MHz dual-channel memory','NVIDIA® GeForce® RTX 3060 (6GB DDR6 VRAM)','15.6\" QHD 240Hz, 100% DCI-P3, G-Sync, 2.5ms',65999000,'2022-03-02 08:31:11.844205','2022-03-02 09:16:50.112667',NULL,6,5),(21,'Razer Blade 15 Base','Razer Blade 15 Base 2021 được chính thức ra mắt vào đầu năm 2021. Với việc trang bị con chip Intel thế hệ thứ 10 cùng card đồ họa GeForce RTX™ 3060, Blade 15 Base 2021 được hứa hẹn là một trong những con “quái thú gaming” có thể chiến tốt mọi tựa game','10th Gen Intel® Core™ i7-10750H 6 Core','16GB dual-channel DDR4-2933MHz','NVIDIA® GeForce RTX™ 3060 (6GB DDR6 VRAM)','15.6\" Full HD 144Hz, 100% sRGB, 4.9 mm bezel',50000000,'2022-03-02 08:32:26.039584','2022-03-02 09:17:45.087443',NULL,6,1),(22,'Razer Blade 15 (2019)','Nhắc đến Razer là dòng Laptop Gaming số 1 thế giới bới thiết kế tối giản nhưng cực kỳ sang trọng. Tiếp tục nối tiếp thành công của những model cũ năm nay Razer đã cho ra mắt Razer Blade 2019 tinh chỉnh lại thiết kế và nâng cấp cấu hình được rất nhiều các game thủ đón chờ','Intel® Core™ i7-9750H','16GB DDR4-2666MHz','NVIDIA GTX 1660Ti 6GB GDDR6','15.6\" FHD (1920 x 1080) 60Hz',31990000,'2022-03-02 08:33:39.285467','2022-03-02 09:18:02.951768',NULL,6,3),(23,'Razer Blade 15 (2018)','Những thông tin đánh giá tổng quan về Razer Blade 15 2018\r\nHiện nay nhu cầu sử dụng laptop xách tay ngày càng tăng lên. Do đó, kéo theo sự ra đời của rất nhiều dòng máy tính khác nhau. Tuy nhiên, để tìm được thiết kế laptop phù hợp với công việc và giải trí thì là điều không hề đơn giản. Bạn nên tham khảo nhiều nguồn thông tin để lựa chọn được chiếc laptop phù hợp với mình nhất','ntel Core i7-8750H 2.20 GHz, 9 MB SmartCache Cache, Upto 4.10 GHz','16GB DDR4 2667MHz Max 32GB','Nvidia GTX 1070 Max Q 8GB','15.6 inch FHD (1920x1080), IPS Anti-Glare, 144Hz,',31499000,'2022-03-02 08:34:43.805240','2022-03-02 09:18:20.188346',NULL,6,1),(24,'Laptop Dell Inspiron 3515 R1505S - AMD Ryzen 5','Laptop Dell Inspiron 3515 hiệu năng cao, chip AMD mạnh mẽ làm việc, chơi game, đồ họa mượt mà.\r\nMàn hình 15.6 inch Full HD đáp ứng nhu cầu làm việc thuận tiện\r\nMàu bạc sang trọng','R5 - 3500U','8GB DDR4','AMD Radeon Vega','15.6 Inch Full HD',15290000,'2022-03-02 08:37:16.029110','2022-03-02 09:18:49.514582',NULL,1,1),(25,'Laptop Dell Inspiron 14 5415 R1505S - AMD Ryzen 5','Laptop Dell siêu bền, sang trọng, pin trâu, cấu hình khỏe, đáp ứng tốt mọi nhu cầu học tập, làm việc, chơi game giải trí','AMD Ryzen 5 5500U','RAM 8GB DDR4','Card AMD Vega 7','14 Inch Full HD',17690000,'2022-03-02 08:38:41.817599','2022-03-02 09:18:32.754125',NULL,1,5),(26,'Laptop Dell Inspiron 3501 - Intel Core i5','Laptop Dell siêu bền bỉ, thương hiệu uy tín, cấu hình cao với card rời MX 330 đáp ứng được mọi nhu cầu làm việc, giải trí nặng, làm đồ họa 2D','Intel Core i5-1135G7','RAM 8GB DDR4','NVIDIA GeForce MX330','15.6 Inch Full HD',17990000,'2022-03-02 08:39:21.911069','2022-03-02 09:19:05.375706',NULL,1,1),(27,'Laptop Dell Vostro 15 5515 R1505A - AMD Ryzen 5','Laptop Dell Vostro chip AMD series 5000 mạnh mẽ, card radeon vega 7 mạnh mẽ xử lý tốt các tác vụ đồ họa 2D, chơi game nhẹ nhàng. Pin trâu, giá ổn, bền bỉ','AMD R5 5500U','8GB DDR4','AMD Radeon Vega 7','15.6 Inch Full HD',17690000,'2022-03-02 08:40:07.547122','2022-03-02 09:19:19.028868',NULL,1,1),(28,'Laptop Asus Vivobook X515EA-EJ1046W - Intel Core i5','Laptop văn phòng mỏng nhẹ, thời trang\r\nChip i5 đời 11, màn hình Full HD\r\nBảo hành 24 tháng chính hãng Asus','Intel Core i5 1135G7','RAM 8GB DDR4','Card Intel® Iris Xe Graphics','15.6 Inch Full HD',16490000,'2022-03-02 08:42:20.876624','2022-03-02 09:19:33.135148',NULL,2,1),(29,'Laptop Laptop ASUS TUF Gaming 2021 FX506HCB-HN1138W - Intel Core i5','Laptop gaming Asus TUF 2021 cấu hình khủng, Intel Core i5 gen 11 mạnh mẽ, RTX 3050 4GB, màn 144hz quẩy game cực sung. Bảo hành chính hãng Asus Việt Nam','Intel Core i5-11400H','RAM 8GB DDR4','Card Nvidia RTX 3050 4GB','15.6 Inch Full HD 144Hz',22990000,'2022-03-02 08:43:28.497755','2022-03-02 09:19:47.325940',NULL,2,5),(30,'Laptop Asus FL8850UA 90NB0U12-M01790 - AMD Ryzen 7','Laptop Asus mỏng nhẹ, cấu hình cao. Chip Ryzen 7 5700U mới nhất cực khỏe. Văn phòng mượt, đồ họa tốt, game khỏe. Nâng cấp tốt','AMD Ryzen 7 5700U','RAM 8GB DDR4','Card AMD Radeon Vega','15.6 Inch Full HD',17590000,'2022-03-02 08:44:10.826785','2022-03-02 09:20:04.697919',NULL,2,1),(31,'Laptop Asus TUF Gaming F15 FX506LH-HN188W - Intel Core i5','Laptop Asus TUF Gaming F15 thiết kế mới lạ cực đẹp mắt\r\nCấu hình tốt trong tầm giá 20 triệu. Màn 144hz','Intel Core i5 10300H','8GB DDR4','Nvidia GTX 1650 4GB','15.6 Inch Full HD 144Hz',19490000,'2022-03-02 08:45:01.795778','2022-03-02 09:20:32.552417',NULL,2,3),(32,'Laptop Asus Zenbook Q408UG- AMD Ryzen 5','Laptop văn phòng cao cấp, sang trọng, mỏng nhẹ chỉ khoảng 1.15kg. Card rời Geforce MX350 2GB. Màn hình Full HD IPS chuẩn. Bảo hành 12 tháng.','AMD Ryzen 5 5500U','RAM 8GB LPDDR4','Card rời Geforce MX450 2GB','14 Inch Full HD 100% sRGB',17990000,'2022-03-02 08:46:22.280526','2022-03-02 09:20:17.667429',NULL,2,5),(33,'Laptop Asus Vivobook A515EA-L12033W - Intel Core i5','Laptop Asus Vivobook mỏng nhẹ, thời trang\r\nCấu hình mới nhất đáp ứng mọi nhu cầu làm việc học tập\r\nMàn Full HD sáng đẹp, bảo hành chính hãng','Intel Core i5-1135G7','8GB DDR4','Intel® Iris Xe Graphics','15.6 Inch Full HD OLED',18690000,'2022-03-02 08:47:12.784126','2022-03-02 09:20:46.765100',NULL,2,1),(34,'Laptop Lenovo Ideapad Gaming 3 15IHU6 82K100LUUS','Lenovo Ideapad Gaming 3 cấu hình cao, giá cực rẻ\r\nBuild máy bền chắc, card rời GTX 1650 chiến game mượt mà\r\nBảo hành 12 tháng','Intel Core i5-11300H','RAM 8GB DDR4','Nvidia GTX 1650 4GB','15.6 Inch Full HD',18990000,'2022-03-02 08:48:18.841235','2022-03-02 09:20:58.553415',NULL,4,1),(35,'Laptop HP Pavilion','Laptop HP thời trang, bền bỉ\r\nChip Intel đời 11, màn hình Full HD\r\nBảo hành 12 tháng chính hãng HP','Intel Core i5 1135G7','RAM 8GB DDR4','Card Intel® Iris Xe Graphics','15.6 Inch Full HD',17990000,'2022-03-02 08:50:34.967509','2022-03-02 09:21:12.648261',NULL,3,1),(36,'Laptop HP','Laptop HP Core i5 mượt mà bền bỉ, đáp ứng tốt mọi nhu cầu làm việc học tập\r\nThiết kế mỏng nhẹ, màu bạc sang trọng cao cấp','Intel Core i5 1135G7','RAM 8GB DDR4','Card Intel® Iris Xe Graphics','15.6 Inch Full HD',15290000,'2022-03-02 08:51:27.904308','2022-03-02 09:21:25.003827',NULL,3,1),(37,'Laptop HP VICTUS 16 2021','Laptop gaming HP VICTUS đời mới lịch lãm, hiện đại, cấu hình khỏe, khả năng nâng cấp tốt. Chip R5 5600H, card rời RTX 3050Ti, màn hình 16.1 inch 144Hz','AMD R5 - 5600H','RAM 8GB DDR4','Nvidia RTX 3050Ti 4GB','16.1 Inch Full HD 144Hz',22990000,'2022-03-02 08:52:07.540684','2022-03-02 09:21:39.303019',NULL,3,1),(38,'Laptop HP 250 G8 - Intel Core i3','Laptop HP 250 G8 intel core i3 mỏng nhẹ sang trọng.\r\nCấu hình đủ đáp ứng mọi nhu cầu làm việc học tập. Màn 15.6 Inch lớn\r\nGiá rẻ nhất thị trường','Intel Core i3-1005G1','RAM 4GB DDR4','Intel UHD Graphics','15.6 Inch HD',10990000,'2022-03-02 08:52:49.865949','2022-03-02 09:21:52.698535',NULL,3,1),(39,'MacBook Pro 2021 14 inch Apple M1 PRO','Sản phẩm chính hãng mới 100% nguyên seal. Phụ kiện chính hãng gồm: hộp trùng imei, sạc, cable, sách hướng dẫn','Apple M1 PRO chip with 8-core','16GB','14-core GPU','14.2-inch (diagonal) Liquid Retina XDR display;',56900000,'2022-03-02 08:56:11.566245','2022-03-02 09:22:07.298865',NULL,5,1),(40,'MacBook Pro 2020 13 inch (MYD82/MYDA2) Apple M1','Sản phẩm được kiểm tra kĩ lưỡng qua quy trình test cẩn thận 20 bước, đảm bảo hoạt động ổn định trước khi đến tay người dùng','Apple M1 chip with 8-core CPU','8GB','8-core GPU','13-inch Retina display with True Tone',26900000,'2022-03-02 08:58:10.659502','2022-03-02 09:22:53.416789',NULL,5,1),(41,'MacBook Pro 2018 15 inch (MR932/MR962) Core i7','Sản phẩm được kiểm tra kĩ lưỡng qua quy trình test cẩn thận 20 bước, đảm bảo hoạt động ổn định trước khi đến tay người dùng','2.2GHz 6-core 8th Intel Core i7','16GB','Radeon Pro 555X with 4GB of GDDR5 memory','15.4 inch, Retina ( 2880 x 1800 pixels)',31500000,'2022-03-02 09:00:32.426941','2022-03-02 09:22:21.804443',NULL,5,1),(42,'Laptop Acer Aspire 3','Laptop văn phòng thời trang, cấu hình tốt\r\nCard rời GeForce MX330 2GB, màn hình FHD\r\nBảo hành 12 tháng chính hãng Acer','Intel Core i5 1035G1','RAM 8GB DDR4','Card rời GeForce MX330 2GB','15.6 Inch Full HD',15690000,'2022-03-02 09:02:34.707626','2022-03-02 09:22:38.643747',NULL,7,5);
/*!40000 ALTER TABLE `store_product` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-02 16:36:08

-- MySQL dump 10.13  Distrib 5.5.46, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: skin_development
-- ------------------------------------------------------
-- Server version	5.5.46-0ubuntu0.14.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `billing_addresses`
--

DROP TABLE IF EXISTS `billing_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `billing_addresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8_unicode_ci,
  `country` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pincode` int(11) DEFAULT NULL,
  `mobile` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_billing_addresses_on_country_id` (`country_id`) USING BTREE,
  CONSTRAINT `fk_rails_a7348a3a93` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billing_addresses`
--

LOCK TABLES `billing_addresses` WRITE;
/*!40000 ALTER TABLE `billing_addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `billing_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brands`
--

DROP TABLE IF EXISTS `brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brands` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `store_sub_category_id` int(11) DEFAULT NULL,
  `sub_device_id` int(11) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `store_category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_rails_4d5743b44d` (`store_sub_category_id`) USING BTREE,
  KEY `fk_rails_96b8c3bde8` (`sub_device_id`) USING BTREE,
  KEY `index_brands_on_store_category_id` (`store_category_id`),
  CONSTRAINT `fk_rails_4d5743b44d` FOREIGN KEY (`store_sub_category_id`) REFERENCES `store_sub_categories` (`id`),
  CONSTRAINT `fk_rails_6f56cc3de4` FOREIGN KEY (`store_category_id`) REFERENCES `store_categories` (`id`),
  CONSTRAINT `fk_rails_96b8c3bde8` FOREIGN KEY (`sub_device_id`) REFERENCES `sub_devices` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brands`
--

LOCK TABLES `brands` WRITE;
/*!40000 ALTER TABLE `brands` DISABLE KEYS */;
INSERT INTO `brands` VALUES (1,'Jason Markk',1,1,1,'2015-11-19 12:34:16','2015-12-04 07:12:18',1),(2,'Evutec',2,1,1,'2015-11-19 12:34:30','2015-12-04 07:12:44',1),(3,'UAG',12,2,1,'2015-11-19 12:34:45','2015-12-04 07:12:59',2),(4,'Casemate',1,1,1,'2015-11-19 12:46:56','2015-12-04 07:13:11',1),(5,'Life proof',1,2,1,'2015-11-19 12:47:14','2015-12-04 07:13:23',1),(6,'Otter box',2,1,1,'2015-11-19 12:47:27','2015-12-04 07:13:17',1),(7,'Poler Stuff',1,1,1,'2015-11-19 12:47:48','2015-12-04 07:13:40',1),(8,'Sprayground',1,1,1,'2015-11-19 12:48:01','2015-12-04 07:13:47',1);
/*!40000 ALTER TABLE `brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `case_types`
--

DROP TABLE IF EXISTS `case_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `case_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `case_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `product_image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_case_types_on_case_id` (`case_id`),
  CONSTRAINT `fk_rails_84139afc9c` FOREIGN KEY (`case_id`) REFERENCES `cases` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `case_types`
--

LOCK TABLES `case_types` WRITE;
/*!40000 ALTER TABLE `case_types` DISABLE KEYS */;
INSERT INTO `case_types` VALUES (1,2,'Frosty White','classic_snap1.jpg',NULL,1,'2015-11-26 07:21:22','2015-11-26 07:21:22');
/*!40000 ALTER TABLE `case_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cases`
--

DROP TABLE IF EXISTS `cases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sub_device_id` int(11) DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `layout_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `long_description` text COLLATE utf8_unicode_ci,
  `device_id` int(11) DEFAULT NULL,
  `product_image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_cases_on_sub_device_id` (`sub_device_id`) USING BTREE,
  KEY `index_cases_on_device_id` (`device_id`),
  CONSTRAINT `fk_rails_ceae458fb1` FOREIGN KEY (`device_id`) REFERENCES `devices` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cases`
--

LOCK TABLES `cases` WRITE;
/*!40000 ALTER TABLE `cases` DISABLE KEYS */;
INSERT INTO `cases` VALUES (1,'New Standard',1,'new_standard.jpg','New Standard Cases','',1,'2015-11-18 09:47:05','2015-11-25 08:56:07','',NULL,NULL),(2,'Wood',1,'classic_snap.jpg','Wood Cases','',1,'2015-11-18 09:50:16','2015-11-25 06:42:58','',NULL,NULL),(3,'Blackplate',2,'new_standard.jpg','Blackplate Cases','',1,'2015-11-18 09:50:43','2015-11-25 06:36:13','',NULL,NULL);
/*!40000 ALTER TABLE `cases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cases_layouts`
--

DROP TABLE IF EXISTS `cases_layouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cases_layouts` (
  `case_id` int(11) DEFAULT NULL,
  `layout_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cases_layouts`
--

LOCK TABLES `cases_layouts` WRITE;
/*!40000 ALTER TABLE `cases_layouts` DISABLE KEYS */;
INSERT INTO `cases_layouts` VALUES (3,1),(1,1),(1,2);
/*!40000 ALTER TABLE `cases_layouts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `countries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (1,'India','+91','2015-11-17 11:28:14','2015-11-17 11:28:14'),(2,'China','+42','2015-11-17 11:28:27','2015-11-17 11:28:27');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currencies`
--

DROP TABLE IF EXISTS `currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currencies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currencies`
--

LOCK TABLES `currencies` WRITE;
/*!40000 ALTER TABLE `currencies` DISABLE KEYS */;
INSERT INTO `currencies` VALUES (1,'AUD (A$)','2015-11-17 12:57:50','2015-11-17 12:57:50'),(2,'BRL (R$)','2015-11-17 12:58:18','2015-11-17 12:58:18'),(3,'CAD ($)','2015-11-17 12:58:23','2015-11-17 12:58:23'),(4,'CHF (CHF)','2015-11-17 12:58:27','2015-11-17 12:58:27'),(5,'CNY (¥)','2015-11-17 12:58:32','2015-11-17 12:58:32'),(6,'DKK (kr)','2015-11-17 12:58:36','2015-11-17 12:58:36'),(7,'EUR (€)','2015-11-17 12:58:41','2015-11-17 12:58:41'),(8,'GBP (£)','2015-11-17 12:58:47','2015-11-17 12:58:47'),(9,'HKD ($)','2015-11-17 12:58:51','2015-11-17 12:58:51'),(10,'JPY (¥)','2015-11-17 12:58:55','2015-11-17 12:58:55'),(11,'KRW (₩)','2015-11-17 12:59:00','2015-11-17 12:59:00'),(12,'MXN ($)','2015-11-17 12:59:21','2015-11-17 12:59:21'),(13,'NOK (kr)','2015-11-17 12:59:25','2015-11-17 12:59:25'),(14,'NZD ($)','2015-11-17 12:59:29','2015-11-17 12:59:29'),(15,'RUB (руб)','2015-11-17 12:59:34','2015-11-17 12:59:34'),(16,'SAR (﷼)','2015-11-17 12:59:39','2015-11-17 12:59:39'),(17,'SEK (kr)','2015-11-17 12:59:45','2015-11-17 12:59:45'),(18,'SGD (S$)','2015-11-17 12:59:50','2015-11-17 12:59:50'),(19,'TWD (NT$)','2015-11-17 13:00:09','2015-11-17 13:00:09'),(20,'USD ($)','2015-11-17 13:00:17','2015-11-17 13:00:17');
/*!40000 ALTER TABLE `currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devices`
--

DROP TABLE IF EXISTS `devices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devices`
--

LOCK TABLES `devices` WRITE;
/*!40000 ALTER TABLE `devices` DISABLE KEYS */;
INSERT INTO `devices` VALUES (1,'iphone','2015-11-17 13:00:48','2015-11-17 13:00:48'),(2,'Apple Watch','2015-11-17 13:00:54','2015-11-17 13:00:54'),(3,'Ipad/Ipod','2015-11-17 13:01:01','2015-11-17 13:01:01'),(4,'Macbook','2015-11-17 13:01:07','2015-11-17 13:01:07'),(5,'Android','2015-11-17 13:01:12','2015-11-17 13:01:12');
/*!40000 ALTER TABLE `devices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faq_categories`
--

DROP TABLE IF EXISTS `faq_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faq_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faq_categories`
--

LOCK TABLES `faq_categories` WRITE;
/*!40000 ALTER TABLE `faq_categories` DISABLE KEYS */;
INSERT INTO `faq_categories` VALUES (1,'Products',1,'2015-11-17 13:01:38','2015-11-17 13:01:38'),(2,'BILLING',1,'2015-11-17 13:01:42','2015-11-17 13:01:42'),(3,'WARRANTY',1,'2015-11-17 13:01:46','2015-11-17 13:01:46'),(4,'RETURNS & EXCHANGES',1,'2015-11-17 13:01:50','2015-11-17 13:01:50');
/*!40000 ALTER TABLE `faq_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faqs`
--

DROP TABLE IF EXISTS `faqs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faqs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `faq_category_id` int(11) DEFAULT NULL,
  `question` text COLLATE utf8_unicode_ci,
  `answer` text COLLATE utf8_unicode_ci,
  `is_active` tinyint(1) DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_faqs_on_faq_category_id` (`faq_category_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faqs`
--

LOCK TABLES `faqs` WRITE;
/*!40000 ALTER TABLE `faqs` DISABLE KEYS */;
INSERT INTO `faqs` VALUES (1,1,'Are your phone cases hard or soft?','Lorem ipsum dolor sit amet, consectetur.',1,'2015-11-17 13:02:18','2015-11-17 13:02:18'),(2,1,'Which cases should I purchase if I am looking for something that is more protective?','Ans. Lorem ipsum dolor sit amet, consectetur',1,'2015-11-17 13:02:34','2015-11-17 13:02:34'),(3,2,'How can I pay for my order?','Lorem ipsum dolor sit amet, consectetur',1,'2015-11-17 13:02:51','2015-11-17 13:02:51');
/*!40000 ALTER TABLE `faqs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `home_sliders`
--

DROP TABLE IF EXISTS `home_sliders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `home_sliders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subtitle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `link` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `home_sliders`
--

LOCK TABLES `home_sliders` WRITE;
/*!40000 ALTER TABLE `home_sliders` DISABLE KEYS */;
INSERT INTO `home_sliders` VALUES (1,'iphone-background.jpg','Make Your Skin','Skin','make','2015-11-17 13:03:43','2015-11-17 13:03:43'),(2,'iphone-background-2.jpg','Make Your Skin1','Skin1','','2015-11-17 13:04:01','2015-11-17 13:04:01');
/*!40000 ALTER TABLE `home_sliders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `layouts`
--

DROP TABLE IF EXISTS `layouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `layouts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `device_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_layouts_on_device_id` (`device_id`),
  CONSTRAINT `fk_rails_1c1a60f705` FOREIGN KEY (`device_id`) REFERENCES `devices` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `layouts`
--

LOCK TABLES `layouts` WRITE;
/*!40000 ALTER TABLE `layouts` DISABLE KEYS */;
INSERT INTO `layouts` VALUES (1,'Grid 2 layer','make_layout01.png',1,'2015-12-02 07:00:45','2015-12-02 07:00:56',NULL),(2,'Grid 3 layer','make_layout02.png',0,'2015-12-02 08:49:53','2015-12-02 08:49:53',NULL);
/*!40000 ALTER TABLE `layouts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `make_mobile_pages`
--

DROP TABLE IF EXISTS `make_mobile_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `make_mobile_pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `app_icon` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dowanload_button_text` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `background` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `make_mobile_pages`
--

LOCK TABLES `make_mobile_pages` WRITE;
/*!40000 ALTER TABLE `make_mobile_pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `make_mobile_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newsletters`
--

DROP TABLE IF EXISTS `newsletters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `newsletters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newsletters`
--

LOCK TABLES `newsletters` WRITE;
/*!40000 ALTER TABLE `newsletters` DISABLE KEYS */;
/*!40000 ALTER TABLE `newsletters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_colors`
--

DROP TABLE IF EXISTS `product_colors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_colors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `store_sub_category_id` int(11) DEFAULT NULL,
  `store_category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_product_colors_on_store_sub_category_id` (`store_sub_category_id`),
  KEY `index_product_colors_on_store_category_id` (`store_category_id`),
  CONSTRAINT `fk_rails_3193720255` FOREIGN KEY (`store_category_id`) REFERENCES `store_categories` (`id`),
  CONSTRAINT `fk_rails_533c8e2126` FOREIGN KEY (`store_sub_category_id`) REFERENCES `store_sub_categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_colors`
--

LOCK TABLES `product_colors` WRITE;
/*!40000 ALTER TABLE `product_colors` DISABLE KEYS */;
INSERT INTO `product_colors` VALUES (1,'Green','127d2b','2015-11-19 12:01:12','2015-12-04 07:09:47',1,1),(2,'Red','ed2b2b','2015-11-19 12:01:37','2015-12-04 07:09:53',1,1),(3,'Yellow','f7eb00','2015-11-20 04:24:36','2015-12-04 07:09:59',2,2);
/*!40000 ALTER TABLE `product_colors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_images`
--

DROP TABLE IF EXISTS `product_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_product_images_on_product_id` (`product_id`) USING BTREE,
  CONSTRAINT `fk_rails_1c991d3be6` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_images`
--

LOCK TABLES `product_images` WRITE;
/*!40000 ALTER TABLE `product_images` DISABLE KEYS */;
INSERT INTO `product_images` VALUES (1,'case1.jpg','2015-11-18 11:26:27','2015-11-18 12:57:51',1),(2,'case2.jpg','2015-11-18 11:28:49','2015-11-18 12:58:05',2);
/*!40000 ALTER TABLE `product_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_variations`
--

DROP TABLE IF EXISTS `product_variations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_variations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `product_color_id` int(11) DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_product_variations_on_product_id` (`product_id`),
  KEY `index_product_variations_on_product_color_id` (`product_color_id`),
  CONSTRAINT `fk_rails_8cdbcfa6d7` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `fk_rails_f6e89f35fd` FOREIGN KEY (`product_color_id`) REFERENCES `product_colors` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_variations`
--

LOCK TABLES `product_variations` WRITE;
/*!40000 ALTER TABLE `product_variations` DISABLE KEYS */;
INSERT INTO `product_variations` VALUES (1,'case1.jpg',1,2,1,'2015-11-19 13:01:32','2015-11-19 13:01:32'),(2,'case2.jpg',1,1,1,'2015-11-19 13:01:55','2015-11-19 13:01:55'),(3,'case2.jpg',2,1,1,'2015-11-19 13:02:09','2015-11-19 13:02:09');
/*!40000 ALTER TABLE `product_variations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `store_sub_category_id` int(11) DEFAULT NULL,
  `sub_device_id` int(11) DEFAULT NULL,
  `case_id` int(11) DEFAULT NULL,
  `layout_id` int(11) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `is_active` tinyint(1) DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `tag` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `device_id` int(11) DEFAULT NULL,
  `store_category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_products_on_brand_id` (`brand_id`) USING BTREE,
  KEY `index_products_on_case_id` (`case_id`) USING BTREE,
  KEY `index_products_on_layout_id` (`layout_id`) USING BTREE,
  KEY `index_products_on_store_sub_category_id` (`store_sub_category_id`) USING BTREE,
  KEY `index_products_on_sub_device_id` (`sub_device_id`) USING BTREE,
  KEY `index_products_on_user_id` (`user_id`) USING BTREE,
  KEY `index_products_on_device_id` (`device_id`),
  KEY `index_products_on_store_category_id` (`store_category_id`),
  CONSTRAINT `fk_rails_4b4e7b228d` FOREIGN KEY (`store_sub_category_id`) REFERENCES `store_sub_categories` (`id`),
  CONSTRAINT `fk_rails_5ee4ebc4aa` FOREIGN KEY (`sub_device_id`) REFERENCES `sub_devices` (`id`),
  CONSTRAINT `fk_rails_73c7295a85` FOREIGN KEY (`case_id`) REFERENCES `cases` (`id`),
  CONSTRAINT `fk_rails_8efc91522f` FOREIGN KEY (`device_id`) REFERENCES `devices` (`id`),
  CONSTRAINT `fk_rails_dee2631783` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_rails_dfde64b252` FOREIGN KEY (`store_category_id`) REFERENCES `store_categories` (`id`),
  CONSTRAINT `fk_rails_f3b4d49caa` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`),
  CONSTRAINT `fk_rails_ffaf88b6b2` FOREIGN KEY (`layout_id`) REFERENCES `layouts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Product1',1,1,1,1,NULL,1,1245,'test product.',1,'2015-11-18 11:26:08','2015-12-04 06:51:14','iphone, rubber case',1,1),(2,'Android product',1,2,2,2,NULL,2,8000,'',1,'2015-11-18 11:28:39','2015-12-04 06:51:37','android',5,1);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20151006092610'),('20151012045935'),('20151013054637'),('20151015093255'),('20151022040725'),('20151023085052'),('20151023085814'),('20151023091406'),('20151023091538'),('20151023093436'),('20151027052106'),('20151027121535'),('20151029112227'),('20151029112256'),('20151029112402'),('20151029112451'),('20151102100040'),('20151102100319'),('20151102113617'),('20151103045547'),('20151105063313'),('20151105064150'),('20151105091900'),('20151105124922'),('20151105125110'),('20151105125714'),('20151105125942'),('20151107045906'),('20151107050147'),('20151116114615'),('20151117030724'),('20151117031045'),('20151118092720'),('20151119113421'),('20151119113625'),('20151120042148'),('20151124063017'),('20151124071211'),('20151125053220'),('20151125053243'),('20151125061141'),('20151126052357'),('20151130045700'),('20151201102904'),('20151202061926'),('20151204064831'),('20151204065427'),('20151204065911'),('20151207113546'),('20151208051001');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipping_addresses`
--

DROP TABLE IF EXISTS `shipping_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shipping_addresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pincode` int(11) DEFAULT NULL,
  `mobile` bigint(20) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `country_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_shipping_addresses_on_country_id` (`country_id`) USING BTREE,
  KEY `index_shipping_addresses_on_user_id` (`user_id`) USING BTREE,
  CONSTRAINT `fk_rails_9d2af0e543` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`),
  CONSTRAINT `fk_rails_bbbd7e8713` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipping_addresses`
--

LOCK TABLES `shipping_addresses` WRITE;
/*!40000 ALTER TABLE `shipping_addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `shipping_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_categories`
--

DROP TABLE IF EXISTS `store_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_categories`
--

LOCK TABLES `store_categories` WRITE;
/*!40000 ALTER TABLE `store_categories` DISABLE KEYS */;
INSERT INTO `store_categories` VALUES (1,'Collection',1,'2015-11-18 07:16:48','2015-11-18 07:16:48'),(2,'Category',1,'2015-11-18 07:16:54','2015-11-18 07:16:54'),(3,'Featured Artist',1,'2015-11-18 07:17:01','2015-11-18 07:17:01');
/*!40000 ALTER TABLE `store_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_sub_categories`
--

DROP TABLE IF EXISTS `store_sub_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store_sub_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `store_category_id` int(11) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_store_sub_categories_on_store_category_id` (`store_category_id`) USING BTREE,
  CONSTRAINT `fk_rails_8a2526b8d5` FOREIGN KEY (`store_category_id`) REFERENCES `store_categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_sub_categories`
--

LOCK TABLES `store_sub_categories` WRITE;
/*!40000 ALTER TABLE `store_sub_categories` DISABLE KEYS */;
INSERT INTO `store_sub_categories` VALUES (1,'New Standard',1,1,'2015-11-18 07:17:20','2015-11-18 07:28:42'),(2,'Top 100 Designs',1,1,'2015-11-18 07:17:28','2015-11-18 07:28:52'),(3,'Mother of Pearl',1,1,'2015-11-18 07:17:36','2015-11-18 07:29:08'),(4,'Xskin Band',1,1,'2015-11-18 07:17:43','2015-11-18 07:29:30'),(5,'Summer Vibes',1,1,'2015-11-18 07:17:50','2015-11-18 07:29:51'),(6,'Macbook Sleeve',1,1,'2015-11-18 07:17:56','2015-11-18 07:30:11'),(7,'Metaluxe',1,1,'2015-11-18 07:18:03','2015-11-18 07:30:29'),(8,'Hex',2,1,'2015-11-18 07:18:11','2015-11-18 07:30:46'),(9,'Sprayground',2,1,'2015-11-18 07:18:20','2015-11-18 07:30:55'),(10,'Pkg',2,1,'2015-11-18 07:18:29','2015-11-18 07:31:08'),(11,'Poler Stuff',2,1,'2015-11-18 11:30:28','2015-11-18 11:30:28'),(12,'Agent18',2,1,'2015-11-18 11:30:39','2015-11-18 11:30:39'),(13,'Otter Box',2,1,'2015-11-18 11:30:51','2015-11-18 11:30:51'),(14,'Life Proof',2,1,'2015-11-18 11:31:03','2015-11-18 11:31:03'),(15,'Casemate',2,1,'2015-11-18 11:31:13','2015-11-18 11:31:13'),(16,'Uag',2,1,'2015-11-18 11:31:20','2015-11-18 11:31:20'),(17,'Evutec',2,1,'2015-11-18 11:31:28','2015-11-18 11:31:28'),(18,'Jason Mark',2,1,'2015-11-18 11:31:40','2015-11-18 11:31:40'),(19,'Monika Strigel',3,1,'2015-11-18 11:31:56','2015-11-18 11:31:56'),(20,'Girly Trend',3,1,'2015-11-18 11:32:06','2015-11-18 11:32:06'),(21,'Girly Road',3,1,'2015-11-18 11:32:14','2015-11-18 11:32:14'),(22,'Budi Kwan',3,1,'2015-11-18 11:32:27','2015-11-18 11:32:27');
/*!40000 ALTER TABLE `store_sub_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sub_devices`
--

DROP TABLE IF EXISTS `sub_devices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sub_devices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `device_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `price` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_sub_devices_on_device_id` (`device_id`) USING BTREE,
  CONSTRAINT `fk_rails_33f724b715` FOREIGN KEY (`device_id`) REFERENCES `devices` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub_devices`
--

LOCK TABLES `sub_devices` WRITE;
/*!40000 ALTER TABLE `sub_devices` DISABLE KEYS */;
INSERT INTO `sub_devices` VALUES (1,'iPhone 6S',1,'2015-11-18 07:18:58','2015-11-18 07:18:58',NULL),(2,'Samsung',5,'2015-11-18 07:19:07','2015-11-18 07:19:07',NULL);
/*!40000 ALTER TABLE `sub_devices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_meta`
--

DROP TABLE IF EXISTS `user_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_meta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `currency` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_user_meta_on_user_id` (`user_id`) USING BTREE,
  CONSTRAINT `fk_rails_962c0e48c2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_meta`
--

LOCK TABLES `user_meta` WRITE;
/*!40000 ALTER TABLE `user_meta` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) NOT NULL DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `provider` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin` tinyint(1) DEFAULT '0',
  `email2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `referral_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `affiliate_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_email` (`email`) USING BTREE,
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'robin_garg@esferasoft.com','$2a$10$V5NwcWp7NyFi1vy5gLyjBeG6.I/gAMvXRnffExXeonPjVZVdf8JXu',NULL,NULL,NULL,36,'2015-12-08 05:00:57','2015-12-08 03:54:03','192.168.1.13','192.168.1.34','2015-11-17 10:49:33','2015-12-08 05:00:57','','','Robin',1,'','123ert',NULL),(2,'kapil@gmail.com','$2a$10$0go9FTWXwkiYnDNievN6LeCi2i7.P7/42bGGAn2pOOzrIxyGbYj3G',NULL,NULL,NULL,1,'2015-11-26 05:25:58','2015-11-26 05:25:58','192.168.1.34','192.168.1.34','2015-11-26 05:25:58','2015-11-26 05:25:58',NULL,NULL,NULL,0,NULL,'f4f8605f28e0',NULL),(3,'robin@gmail.com','$2a$10$weBd8YmKul5fcfqCmOg0ouMx/m/mjcSvFtt.hW/ZVB.typO/gED6y',NULL,NULL,NULL,1,'2015-11-26 05:37:17','2015-11-26 05:37:17','192.168.1.34','192.168.1.34','2015-11-26 05:37:17','2015-11-26 05:37:17',NULL,NULL,NULL,0,NULL,'4e498d',NULL),(4,'rishu@gmail.com','$2a$10$9cVppPR6UF9C2t5.y2kLG.WKDnZnatJRIDalATmaei7S7iZMCUKnK',NULL,NULL,NULL,1,'2015-11-26 05:50:31','2015-11-26 05:50:31','192.168.1.34','192.168.1.34','2015-11-26 05:50:30','2015-11-26 05:50:31',NULL,NULL,NULL,0,NULL,'b579cb',NULL),(5,'vipin@gmail.com','$2a$10$AIGm318U.ZvmipbEiyrxmOzn6UGzUIW3Wz6j4mfgY3egRFYKOmcdW',NULL,NULL,NULL,1,'2015-11-26 05:53:44','2015-11-26 05:53:44','192.168.1.34','192.168.1.34','2015-11-26 05:53:44','2015-11-26 05:53:44',NULL,NULL,NULL,0,NULL,'26d954',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlists`
--

DROP TABLE IF EXISTS `wishlists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wishlists` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `product_variation_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_wishlists_on_user_id` (`user_id`),
  KEY `index_wishlists_on_product_id` (`product_id`),
  KEY `index_wishlists_on_product_variation_id` (`product_variation_id`),
  CONSTRAINT `fk_rails_f8d69c5ba5` FOREIGN KEY (`product_variation_id`) REFERENCES `product_variations` (`id`),
  CONSTRAINT `fk_rails_4224d8f53b` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `fk_rails_eb66139660` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlists`
--

LOCK TABLES `wishlists` WRITE;
/*!40000 ALTER TABLE `wishlists` DISABLE KEYS */;
INSERT INTO `wishlists` VALUES (7,1,1,'2015-12-08 05:14:37','2015-12-08 05:14:37',1),(9,1,2,'2015-12-08 05:15:58','2015-12-08 05:15:58',3);
/*!40000 ALTER TABLE `wishlists` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-12-08 12:00:47

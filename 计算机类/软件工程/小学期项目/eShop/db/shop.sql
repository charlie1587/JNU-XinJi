-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: shop
-- ------------------------------------------------------
-- Server version	8.0.25

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
-- Table structure for table `lxy_admin`
--

DROP TABLE IF EXISTS `lxy_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lxy_admin` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `adminuser` varchar(50) NOT NULL DEFAULT '',
  `adminpass` char(32) NOT NULL DEFAULT '',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `login_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `login_ip` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lxy_admin`
--

LOCK TABLES `lxy_admin` WRITE;
/*!40000 ALTER TABLE `lxy_admin` DISABLE KEYS */;
INSERT INTO `lxy_admin` VALUES (1,'admin','202cb962ac59075b964b07152d234b70','2019-01-23 20:21:03','2022-06-18 13:57:08',2130706433);
/*!40000 ALTER TABLE `lxy_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lxy_cart`
--

DROP TABLE IF EXISTS `lxy_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lxy_cart` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `quantity` int unsigned NOT NULL DEFAULT '0',
  `products` text,
  `uid` int unsigned NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lxy_cart`
--

LOCK TABLES `lxy_cart` WRITE;
/*!40000 ALTER TABLE `lxy_cart` DISABLE KEYS */;
INSERT INTO `lxy_cart` VALUES (2,21700.00,3,'{\"3\":{\"quantity\":2,\"product\":{\"id\":\"3\",\"name\":\"Macbook Pro\",\"price\":\"8800.00\",\"code\":\"88888888\",\"description\":\"Macbook Pro\"}},\"4\":{\"quantity\":1,\"product\":{\"id\":\"4\",\"name\":\"\\u534e\\u4e3a\\u624b\\u673a\",\"price\":\"4100.00\",\"code\":\"929868123123123\",\"description\":\"\\u5546\\u54c1\\u63cf\\u8ff0\\uff1a\\r\\n\\r\\n\\u8fd9\\u662f\\u534e\\u4e3a\\u624b\\u673a\"}}}',5,'2019-01-24 10:53:24');
/*!40000 ALTER TABLE `lxy_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lxy_order`
--

DROP TABLE IF EXISTS `lxy_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lxy_order` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `quantity` int unsigned NOT NULL DEFAULT '0',
  `products` text,
  `uid` int unsigned NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lxy_order`
--

LOCK TABLES `lxy_order` WRITE;
/*!40000 ALTER TABLE `lxy_order` DISABLE KEYS */;
INSERT INTO `lxy_order` VALUES (1,17600.00,2,'{\"3\":{\"quantity\":2,\"product\":{\"id\":\"3\",\"name\":\"Macbook Pro\",\"price\":\"8800.00\",\"code\":\"88888888\",\"description\":\"Macbook Pro\"}}}',5,'2019-01-24 12:46:33');
/*!40000 ALTER TABLE `lxy_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lxy_product`
--

DROP TABLE IF EXISTS `lxy_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lxy_product` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL DEFAULT '',
  `code` varchar(100) NOT NULL DEFAULT '',
  `description` text,
  `stock` int unsigned NOT NULL DEFAULT '0',
  `price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lxy_product`
--

LOCK TABLES `lxy_product` WRITE;
/*!40000 ALTER TABLE `lxy_product` DISABLE KEYS */;
INSERT INTO `lxy_product` VALUES (3,'Macbook Pro','88888888','Macbook Pro',99,8800.00,'2019-01-24 00:19:28'),(4,'华为手机','929868123123123','商品描述：\r\n\r\n这是华为手机',99,4100.00,'2019-01-24 00:31:28');
/*!40000 ALTER TABLE `lxy_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lxy_user`
--

DROP TABLE IF EXISTS `lxy_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lxy_user` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL DEFAULT '',
  `password` char(32) NOT NULL DEFAULT '',
  `name` varchar(100) NOT NULL DEFAULT '',
  `age` tinyint unsigned NOT NULL DEFAULT '0',
  `email` varchar(100) NOT NULL DEFAULT '',
  `phone` varchar(20) NOT NULL DEFAULT '',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lxy_user`
--

LOCK TABLES `lxy_user` WRITE;
/*!40000 ALTER TABLE `lxy_user` DISABLE KEYS */;
INSERT INTO `lxy_user` VALUES (3,'zhangsan','4297f44b13955235245b2497399d7a93','张三',28,'13912345678@qq.com','13912345678','2019-01-23 23:54:34'),(4,'wangwu','4297f44b13955235245b2497399d7a93','',0,'wangwu@imooc.com','','2019-01-24 09:21:45'),(5,'zhaoliu','4297f44b13955235245b2497399d7a93','',0,'zhaoliu@imooc.com','','2019-01-24 09:35:05');
/*!40000 ALTER TABLE `lxy_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-18 14:02:45

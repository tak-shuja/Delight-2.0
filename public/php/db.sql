-- MariaDB dump 10.19  Distrib 10.6.16-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: delight
-- ------------------------------------------------------
-- Server version	10.6.16-MariaDB-cll-lve

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` text NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `customers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (9,'KMR_WLNT_1',1),(10,'KMR_WLNT_1',1),(11,'KASH_SAF',1),(12,'KMR_PSTA',1),(13,'RST_CASH',1),(14,'KMR_ALMND_1',10),(15,'KMR_ALMND_1',7),(16,'KMR_WLNT_1',11);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone_1` varchar(255) NOT NULL,
  `phone_2` varchar(255) NOT NULL,
  `address_1` varchar(255) NOT NULL,
  `address_2` varchar(255) NOT NULL,
  `pincode` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone_1` (`phone_1`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'shuja','pass','info@mail.com','9900665544','9900665544','House0, Street0, Lane0','House1, Street1, Lane1','000000'),(2,'A','Aaaaaaaa','danish@gmail.com','9866544444','Dryyy','Ghfgh','Gghh','190006'),(5,'Abbbb','sadjklsajdljka','jlkasjd@jkljs.cjk','jklasdj','sjdfjdslkjfk','jlkjsdfjsdfk','jkjdsfkj','189098765'),(6,'username','password','main@mail.com','78967896789','678967896789','hajskdj,sadkasd','aslkjdsajkdj','190287'),(7,'Rizwan','Soil@123','abcs@mail.com','9906001122','9906012345','SKUAST','SKUAST','190025'),(8,'aadil','tral','tral@aatankwadi.com','56789','56789','Nala Supara','Shaitan Gali, Kabristan Mehal','65438920'),(9,'Iqbal khan ','Iqbal786','120iqbalkhan@gmail.com','9596722327','','HMT ','','00000001'),(10,'Kartik','123','shujatak@proton.me','136289','152739','Asgh','Abc','1223456'),(11,'ahmad','pass','ahmad@mail.com','000','000','home','home','000999');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_name` text NOT NULL,
  `item_desc` text NOT NULL,
  `price` text NOT NULL,
  `code` text NOT NULL,
  `paths` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`paths`)),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (1,'Kashmiri Almonds','Our Kashmiri almonds are a true indulgence with their distinct crunchiness and rich, buttery flavor. They are an excellent source of vitamin E, healthy fats, and protein, providing you with an energy boost and supporting heart health. Whether enjoyed on their own or added to your favorite recipes, these premium almonds promise a delightful and nutritious treat.\r\nNutritional value per 100 gram\r\nCalories: 579 kcal\r\nFat: 49.42 grams\r\nSaturated fat: 3.731 grams\r\nMonounsaturated fat: 30.889 grams\r\nPolyunsaturated fat: 12.070 grams\r\nCarbohydrates: 21.69 grams\r\nDietary fiber: 12.2 grams\r\nSugars: 3.89 grams\r\nProtein: 21.15 grams\r\nVitamins:\r\nVitamin E: 26.19 milligrams\r\nRiboflavin (Vitamin B2): 1.014 milligrams\r\nNiacin (Vitamin B3): 3.618 milligrams\r\nVitamin B6: 0.143 milligrams\r\nFolate (Vitamin B9): 50 micrograms\r\nMinerals:\r\nCalcium: 264 milligrams\r\nIron: 3.71 milligrams\r\nMagnesium: 268 milligrams\r\nPhosphorus: 484 milligrams\r\nPotassium: 733 milligrams\r\nZinc: 3.12 milligrams\r\nCopper: 0.996 milligrams\r\nManganese: 2.285 milligrams.','3500','KMR_ALMND_1','[\"uploads/kash_almond_1.png\", \"uploads/kash_almond_2.png\", \"uploads/kash_almond_1 (copy).png\"]'),(3,'Kashmiri Walnuts','Immerse yourself in the earthy and nutty taste of our Kashmiri walnuts. Known for their high omega-3 fatty acid content, these walnuts contribute to improved brain function and cardiovascular health. Sourced from the lush forests of Kashmir, our walnuts are carefully processed to preserve their natural goodness and ensure unmatched quality.\r\nNutritional value per 100 gram\r\nCalories: 654 kcal\r\nFat: 65.21 grams\r\nSaturated fat: 6.126 grams\r\nMonounsaturated fat: 8.933 grams\r\nPolyunsaturated fat: 47.174 grams\r\nCarbohydrates: 13.71 grams\r\nDietary fiber: 6.7 grams\r\nSugars: 2.61 grams\r\nProtein: 15.23 grams\r\nVitamin E: 0.7 milligrams\r\nRiboflavin (Vitamin B2): 0.15 milligrams\r\nNiacin (Vitamin B3): 1.125 milligrams\r\nVitamin B6: 0.573 milligrams\r\nFolate (Vitamin B9): 98 micrograms\r\nMinerals:\r\nCalcium: 98 milligrams\r\nIron: 2.91 milligrams\r\nMagnesium: 158 milligrams\r\nPhosphorus: 346 milligrams\r\nPotassium: 441 milligrams\r\nZinc: 3.09 milligrams\r\nCopper: 1.2 milligrams\r\nManganese: 3.414 milligrams','4000','KMR_WLNT_1','[\"uploads/Kashmiri_walnut_1.png\", \"uploads/kashmiri_walnut_2.png\", \"uploads/img.jpeg\"]'),(4,'Saffron','Kashmiri Saffron','993993','KASH_SAF','[\"uploads/saffron_1.jpeg\", \"uploads/saffron_2.jpeg\", \"uploads/saffron_3.jpeg\"]'),(5,'Pistachio','High Quality Pistachios Direct From The Garden.','450','KMR_PSTA','[\"uploads/pista.png\", \"uploads/pista (copy).png\", \"uploads/pista2.png\"]'),(6,'Pistachio','High Quality Pistachios Direct From The Garden.','450','KMR_PSTA','[\"uploads/pista.png\", \"uploads/pista (copy).png\", \"uploads/pista2.png\"]'),(7,'Apricots','Experience the goodness of sun-drenched Kashmiri apricots, bursting with a delightful sweet-tart flavor. Our dried apricots are naturally rich in dietary fiber, vitamin A, potassium, and antioxidants, supporting digestive health and boosting immunity. From snacking to baking, these dried apricots add a touch of natural sweetness to your daily routine.','4500','KMR_APRI','[\"uploads/Apri2.png\", \"uploads/Arpi0.png\", \"uploads/Apri1.png\"]'),(8,'Dried Figs','Treat yourself to the luscious taste and chewy texture of our dried figs. Sourced from the finest orchards in Kashmir, these figs are a treasure trove of dietary fiber, calcium, potassium, and antioxidants. Enhance your diet with these exquisite dried figs and experience the magic they bring to your palate.','8755','DRD_FGS','[\"uploads/fig0.png\", \"uploads/fig1.png\", \"uploads/fig2.png\"]'),(9,'Raisins','Handpicked from juicy grapes and carefully sun-dried, our Kashmiri raisins are bursting with natural sweetness and tang. These raisins are an excellent source of energy, iron, potassium, and antioxidants, making them a perfect addition to your daily snacking routine or culinary creations.','6599','RSN','[\"uploads/raisin2.png\", \"uploads/raisin0.png\", \"uploads/raisin1.png\"]'),(10,'Roasted Cashews','Our roasted Kashmiri cashews are a true delight with their enhanced flavor and satisfying crunch. Carefully roasted to perfection, these cashews are packed with healthy fats, protein, and essential minerals, making them a wholesome and delectable snack option.','7999','RST_CASH','[\"uploads/cashew0.png\", \"uploads/cashew1.png\", \"uploads/cashew2.png\"]');
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` text NOT NULL,
  `password` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlist`
--

DROP TABLE IF EXISTS `wishlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wishlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_code` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlist`
--

LOCK TABLES `wishlist` WRITE;
/*!40000 ALTER TABLE `wishlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `wishlist` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-12 22:53:15

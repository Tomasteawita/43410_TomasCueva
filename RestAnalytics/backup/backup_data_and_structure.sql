-- MySQL dump 10.13  Distrib 8.0.33, for Linux (x86_64)
--
-- Host: localhost    Database: RestAnalytics
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `administratives`
--

DROP TABLE IF EXISTS `administratives`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `administratives` (
  `id` int NOT NULL AUTO_INCREMENT,
  `DNI` int NOT NULL,
  `name_administrative` varchar(75) DEFAULT NULL,
  `last_name` varchar(75) NOT NULL,
  `email` varchar(120) NOT NULL,
  `password` varchar(120) NOT NULL,
  `id_restaurant` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_restaurant` (`id_restaurant`),
  CONSTRAINT `administratives_ibfk_1` FOREIGN KEY (`id_restaurant`) REFERENCES `restaurants` (`id`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administratives`
--

LOCK TABLES `administratives` WRITE;
/*!40000 ALTER TABLE `administratives` DISABLE KEYS */;
INSERT INTO `administratives` VALUES (1,12345678,'Rodrigo','López','rodrigo@example.com','KX8YtZ5Q7a',9),(2,23456789,'Valentina','Fernández','valentina@example.com','T2jF9P4D6s',1),(3,34567890,'Federico','Martínez','federico@example.com','M3rK7iG1V8',7),(4,45678901,'Camila','Herrera','camila@example.com','E9sF6H2J1c',3),(5,56789012,'Lucas','Gómez','lucas@example.com','B5vR9A3K8t',1),(6,67890123,'Sofía','Rodríguez','sofia@example.com','R6G9E2T5Y3',2),(7,78901234,'Martín','Castro','martin@example.com','F3H7N4K2T6',2),(8,89012345,'Carolina','Morales','carolina@example.com','Y8J4W7N6D2',2),(9,90123456,'Nicolás','Sánchez','nicolas@example.com','Q1W5Z7X9V3',5),(10,1234567,'Victoria','González','victoria@example.com','L5K9N3J7H4',3),(11,12345678,'Juan Cruz','Medina','juan@example.com','X7T2V4B1A9',7),(12,23456789,'Valeria','Peralta','valeria@example.com','A3E8R5G7C2',1),(13,34567890,'Agustín','Acosta','agustin@example.com','D4K6V1T7L9',4),(14,45678901,'Martina','Ríos','martina@example.com','U2Y4R7E9H3',4),(15,56789012,'Santiago','Vargas','santiago@example.com','H7N3T2W5D4',6),(16,67890123,'Florencia','Romero','florencia@example.com','S4D9G6H2L1',1),(17,78901234,'Julián','López','julian@example.com','N9B5T7R1M2',10),(18,89012345,'Lucía','Morales','lucia@example.com','P8W3Y6Q9I5',2),(19,90123456,'Bruno','Fernández','bruno@example.com','V6C1X8Z3Q7',5),(20,1234567,'Valentina','Díaz','valentina.diaz@example.com','I5H',4);
/*!40000 ALTER TABLE `administratives` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `DNI` int NOT NULL,
  `name_customer` varchar(75) DEFAULT NULL,
  `last_name` varchar(75) NOT NULL,
  `email` varchar(120) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,0,NULL,'',''),(2,0,NULL,'',''),(3,0,NULL,'',''),(4,0,NULL,'',''),(5,0,NULL,'',''),(6,0,NULL,'',''),(7,0,NULL,'',''),(8,0,NULL,'',''),(9,0,NULL,'',''),(10,0,NULL,'',''),(11,0,NULL,'',''),(12,0,NULL,'',''),(13,0,NULL,'',''),(14,0,NULL,'',''),(15,0,NULL,'',''),(16,0,NULL,'',''),(17,0,NULL,'',''),(18,0,NULL,'',''),(19,0,NULL,'',''),(20,0,NULL,'','');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dishes`
--

DROP TABLE IF EXISTS `dishes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dishes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name_dish` varchar(75) NOT NULL,
  `description_dish` varchar(255) DEFAULT NULL,
  `category` varchar(75) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `id_restaurant` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_restaurant` (`id_restaurant`),
  CONSTRAINT `dishes_ibfk_1` FOREIGN KEY (`id_restaurant`) REFERENCES `restaurants` (`id`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dishes`
--

LOCK TABLES `dishes` WRITE;
/*!40000 ALTER TABLE `dishes` DISABLE KEYS */;
INSERT INTO `dishes` VALUES (1,'Classic Burger','Deliciosa hamburguesa clásica con carne jugosa, pan suave, lechuga, tomate y queso.','Hamburguesa',9.99,1),(2,'Cheeseburger Supreme','Hamburguesa con doble carne, queso fundido, tocino crujiente y salsa especial.','Hamburguesa',12.99,1),(3,'Spicy Chicken Sandwich','Sándwich de pollo picante con lechuga, tomate y mayonesa de chipotle.','Sándwich',10.99,1),(4,'Vegetarian Deluxe','Burger vegetariana con una sabrosa mezcla de verduras, queso y aderezo especial.','Hamburguesa',9.99,1),(5,'Eggs Benedict','Huevos pochados sobre muffin inglés con lonchas de jamón cubiertos de salsa holandesa.','Desayuno',11.99,2),(6,'French Toast','Tostadas francesas esponjosas servidas con jarabe de arce y mantequilla.','Desayuno',8.99,2),(7,'Cobb Salad','Ensalada clásica con pollo a la parrilla, aguacate, huevo, tomate y aderezo de queso azul.','Ensalada',10.99,2),(8,'Caramel Macchiato','Café espresso con leche caliente y espuma de leche, endulzado con caramelo.','Café',4.99,3),(9,'Croissant de jamón y queso','Croissant horneado con jamón y queso fundido.','Desayuno',3.99,3),(10,'Chocolate Chip Muffin','Muffin de chocolate con chispas, perfecto para acompañar el café.','Postre',2.99,3),(11,'Taco al Pastor','Taco mexicano con carne de cerdo marinada, piña, cebolla y cilantro.','Taco',3.50,4),(12,'Taco de Barbacoa','Taco de carne de res jugosa y tierna cocinada a fuego lento, con cebolla y cilantro.','Taco',3.50,4),(13,'Quesadilla de Pollo','Quesadilla de tortilla de harina con pollo a la parrilla, queso fundido y guacamole.','Plato Principal',9.99,4),(14,'Margherita Pizza','Pizza clásica italiana con salsa de tomate, mozzarella fresca y albahaca.','Pizza',12.99,5),(15,'Pepperoni Lovers','Pizza con salsa de tomate, queso mozzarella y abundante pepperoni.','Pizza',14.99,5),(16,'Hawaiian Delight','Pizza con jamón, piña, salsa de tomate y queso mozzarella.','Pizza',13.99,5),(17,'Hot Wings','Alitas de pollo picantes servidas con salsa de tu elección y bastones de apio.','Aperitivo',8.99,6),(18,'Crispy Chicken Tenders','Tiras de pollo crujientes servidas con papas fritas y salsa de mostaza y miel.','Plato Principal',10.99,6),(19,'Chicken Caesar Wrap','Wrap de pollo a la parrilla, lechuga, tomate, queso parmesano y aderezo Caesar.','Sándwich',9.99,6),(20,'Double Cheeseburger','Hamburguesa doble con queso cheddar fundido, pepinillos y salsa especial.','Hamburguesa',11.99,7),(21,'Bacon Mushroom Melt','Hamburguesa con tocino crujiente, champiñones salteados y queso suizo fundido.','Hamburguesa',12.99,7),(22,'Avocado Turkey Burger','Hamburguesa de pavo jugosa con aguacate, lechuga, tomate y mayonesa.','Hamburguesa',10.99,7),(23,'Sashimi Deluxe','Selección de pescado crudo fresco en finas lonchas, servido con salsa de soja y wasabi.','Sushi',18.99,8),(24,'California Roll','Roll clásico de sushi con cangrejo de imitación, aguacate y pepino.','Sushi',9.99,8),(25,'Dragon Roll','Roll de sushi con langostinos tempura, aguacate y salsa de anguila.','Sushi',14.99,8),(26,'Spaghetti Bolognese','Spaghetti con salsa de carne a la boloñesa y queso parmesano rallado.','Pasta',11.99,9),(27,'Lasagna Classica','Lasaña casera con capas de pasta, carne, salsa de tomate y queso gratinado.','Pasta',13.99,9),(28,'Gnocchi al Pesto','Gnocchi caseros con salsa de pesto fresco, piñones y queso parmesano.','Pasta',12.99,9),(29,'Roasted Chicken','Pollo asado jugoso acompañado de puré de papas y vegetales asados.','Plato Principal',13.99,10),(30,'Honey Mustard Chicken','Pechuga de pollo a la parrilla con salsa de mostaza y miel, servida con arroz.','Plato Principal',12.99,10),(31,'Chicken Caesar Salad','Ensalada César con pollo a la parrilla, lechuga romana, queso parmesano y aderezo Caesar.','Ensalada',10.99,10),(32,'BBQ Bacon Burger','Hamburguesa con salsa BBQ, tocino crujiente, cebolla a la parrilla y queso cheddar.','Hamburguesa',11.99,1),(33,'Mushroom Swiss Burger','Hamburguesa con champiñones salteados, queso suizo y salsa especial.','Hamburguesa',12.99,1),(34,'Chicken Avocado Wrap','Wrap de pollo a la parrilla, aguacate, lechuga, tomate y aderezo de cilantro.','Sándwich',9.99,1),(35,'Onion Rings','Aros de cebolla crujientes y dorados, acompañados de salsa BBQ.','Acompañamiento',4.99,1),(36,'Avocado Toast','Tostada de pan de centeno con aguacate, huevo pochado y semillas de chía.','Desayuno',9.99,2),(37,'Greek Salad','Ensalada griega con pepino, tomate, aceitunas kalamata, queso feta y aderezo de limón.','Ensalada',10.99,2),(38,'Spinach and Feta Omelette','Omelette de espinacas y queso feta, servido con pan tostado.','Desayuno',8.99,2),(39,'Blueberry Pancakes','Panqueques esponjosos con arándanos frescos y jarabe de arce.','Desayuno',7.99,2),(40,'Iced Caramel Latte','Latte helado con café espresso, leche, caramelo y hielo.','Café',5.99,3),(41,'Bagel with Lox','Bagel tostado con salmón ahumado, queso crema, rodajas de pepino y eneldo.','Desayuno',9.99,3),(42,'Red Velvet Cupcake','Cupcake de terciopelo rojo con crema de queso y decoración de chocolate.','Postre',3.99,3),(43,'Affogato','Café espresso servido sobre una bola de helado de vainilla.','Postre',6.99,3),(44,'Carnitas Burrito','Burrito relleno de carne de cerdo deshebrada, frijoles, arroz y salsa verde.','Plato Principal',10.99,4),(45,'Chorizo Tacos','Tacos de chorizo picante con cebolla, cilantro y salsa de tomate asada.','Taco',4.50,4),(46,'Guacamole and Chips','Delicioso guacamole casero con totopos de maíz recién hechos.','Aperitivo',6.99,4),(47,'Mexican Street Corn','Elote asado a la parrilla con mayonesa, queso fresco y chile en polvo.','Aperitivo',5.99,4),(48,'Caprese Salad','Ensalada caprese con tomates, mozzarella fresca, albahaca y aceite de oliva.','Ensalada',9.99,5),(49,'Meat Lover\'s Pizza','Pizza con salsa de tomate, pepperoni, salchicha, tocino y jamón.','Pizza',14.99,5),(50,'Vegetarian Pizza','Pizza con salsa de tomate, mozzarella, champiñones, pimientos y aceitunas.','Pizza',12.99,5),(51,'Garlic Bread','Pan de ajo horneado con mantequilla de ajo y espolvoreado con perejil.','Aperitivo',4.99,5),(52,'BBQ Chicken Wings','Alitas de pollo bañadas en salsa BBQ y servidas con bastones de zanahoria y apio.','Aperitivo',8.99,6),(53,'Crispy Chicken Salad','Ensalada con pollo crujiente, lechuga mixta, tomate, pepino y aderezo ranch.','Ensalada',9.99,6),(54,'Spicy Chicken Sandwich','Sándwich de pollo picante con queso pepper jack, jalapeños y salsa de chipotle.','Sándwich',10.99,6),(55,'Sweet Potato Fries','Bastones de camote crujientes servidos con alioli de cilantro.','Acompañamiento',5.99,6),(56,'Mushroom Swiss Burger','Hamburguesa con champiñones salteados, queso suizo y salsa especial.','Hamburguesa',12.99,7),(57,'Bacon Cheese Fries','Papas fritas cubiertas con queso cheddar fundido y tocino crujiente.','Acompañamiento',6.99,7),(58,'Onion Rings','Aros de cebolla crujientes y dorados, acompañados de salsa de chipotle.','Acompañamiento',4.99,7),(59,'Oreo Milkshake','Batido cremoso de helado de vainilla con trozos de galleta Oreo.','Bebida',6.99,7),(60,'Rainbow Roll','Roll de sushi con pescado variado, aguacate y salsa de anguila.','Sushi',15.99,8),(61,'Tempura Shrimp Roll','Roll de sushi con camarones tempura, aguacate y salsa de anguila.','Sushi',13.99,8),(62,'Spicy Tuna Roll','Roll de sushi picante con atún, aguacate y pepino.','Sushi',11.99,8),(63,'Miso Soup','Sopa de miso tradicional con tofu, algas y cebollín.','Sopa',3.99,8),(64,'Fettuccine Alfredo','Fettuccine con salsa cremosa de queso parmesano.','Pasta',12.99,9),(65,'Chicken Parmesan','Pechuga de pollo empanizada con salsa marinara y queso derretido, servida sobre espaguetis.','Plato Principal',14.99,9),(66,'Caprese Salad','Ensalada caprese con tomates frescos, mozzarella y hojas de albahaca.','Ensalada',9.99,9),(67,'Tiramisu','Postre italiano clásico hecho con bizcochos, café, crema de mascarpone y cacao.','Postre',7.99,9),(68,'BBQ Chicken Wings','Alitas de pollo bañadas en salsa BBQ y servidas con bastones de apio y zanahoria.','Aperitivo',8.99,10),(69,'Grilled Chicken Caesar Salad','Ensalada César con pollo a la parrilla, lechuga romana, crutones y aderezo Caesar.','Ensalada',10.99,10),(70,'Chicken Quesadilla','Quesadilla de pollo con queso cheddar derretido, cebolla y pimientos.','Plato Principal',9.99,10),(71,'Key Lime Pie','Tarta de lima con una base de galleta y crema de lima.','Postre',6.99,10);
/*!40000 ALTER TABLE `dishes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dishes_per_sale`
--

DROP TABLE IF EXISTS `dishes_per_sale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dishes_per_sale` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_dish` int NOT NULL,
  `id_sale` int NOT NULL,
  `quantity` tinyint unsigned DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `id_dish` (`id_dish`),
  KEY `id_sale` (`id_sale`),
  CONSTRAINT `dishes_per_sale_ibfk_1` FOREIGN KEY (`id_dish`) REFERENCES `dishes` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `dishes_per_sale_ibfk_2` FOREIGN KEY (`id_sale`) REFERENCES `sales` (`id`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dishes_per_sale`
--

LOCK TABLES `dishes_per_sale` WRITE;
/*!40000 ALTER TABLE `dishes_per_sale` DISABLE KEYS */;
INSERT INTO `dishes_per_sale` VALUES (1,3,1,2),(2,17,1,1),(3,46,2,1),(4,38,2,1),(5,19,3,3),(6,22,3,3),(7,18,4,1),(8,43,4,1),(9,39,5,3),(10,44,5,1),(11,8,6,3),(12,48,6,2),(13,10,7,3),(14,67,7,1),(15,46,8,3),(16,41,8,3),(17,42,9,3),(18,50,9,1),(19,64,10,3),(20,31,10,3),(21,42,11,3),(22,56,11,1),(23,15,12,1),(24,11,12,3),(25,43,13,3),(26,18,13,3),(27,7,14,2),(28,30,14,3),(29,70,15,3),(30,39,15,1),(31,49,16,2),(32,42,16,3),(33,50,17,1),(34,22,17,2),(35,58,18,3),(36,18,18,2),(37,32,19,1),(38,46,19,1),(39,20,20,1),(40,66,20,3),(41,12,21,1),(42,48,21,2),(43,24,22,3),(44,45,22,3),(45,7,23,3),(46,22,23,1),(47,30,24,2),(48,50,24,2),(49,53,25,1),(50,8,25,3),(51,35,26,1),(52,15,26,2),(53,47,27,3),(54,11,27,3),(55,53,28,3),(56,61,28,1),(57,29,29,2),(58,28,29,1),(59,64,30,3),(60,24,30,2),(61,19,31,1),(62,3,31,2),(63,20,32,1),(64,67,32,1),(65,54,33,1),(66,66,33,3),(67,20,34,3),(68,18,34,1),(69,21,35,3),(70,64,35,3),(71,38,36,1),(72,23,36,1),(73,34,37,1),(74,33,37,3),(75,68,38,2),(76,34,38,2),(77,44,39,3),(78,63,39,1),(79,57,40,1),(80,18,40,3),(81,45,41,2),(82,55,41,3),(83,28,42,3),(84,70,42,3),(85,64,43,2),(86,39,43,1),(87,35,44,3),(88,19,44,1),(89,38,45,2),(90,37,45,2),(91,22,46,1),(92,70,46,2),(93,38,47,3),(94,69,47,3),(95,50,48,2),(96,41,48,1),(97,33,49,1),(98,13,49,1),(99,38,50,3);
/*!40000 ALTER TABLE `dishes_per_sale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurants`
--

DROP TABLE IF EXISTS `restaurants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurants` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name_restaurant` varchar(75) NOT NULL,
  `direction` varchar(75) NOT NULL,
  `CEO` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurants`
--

LOCK TABLES `restaurants` WRITE;
/*!40000 ALTER TABLE `restaurants` DISABLE KEYS */;
INSERT INTO `restaurants` VALUES (1,'McQueen\'s Burgers','Calle Rivadavia 123','Martin Peralta\r'),(2,'Suburban Café','Avenida San Martín 456','Matias Gomez\r'),(3,'Coffee Kingdom','Calle 7 789','Malena Soto\r'),(4,'Taco Emporium','Avenida 13 234','Martia Gimenez\r'),(5,'Pizzalicious','Calle 47 567','Tomas Cueva\r'),(6,'The Spicy Chicken Hut','Avenida 60 890','Juan jorge Serrano\r'),(7,'The Burger Tree','Calle 8 1234','Leon Giorgiano\r'),(8,'Sushi Oasis','Avenida 1 567','Santino Vergelin\r'),(9,'The Pasta Factory','Calle 54 890','Luca Bouser\r'),(10,'Chicken Palace','Avenida 19 234','Carlos Arlberto Cueva');
/*!40000 ALTER TABLE `restaurants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales`
--

DROP TABLE IF EXISTS `sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` timestamp NOT NULL,
  `type_consumption` enum('delivery','restaurant') NOT NULL,
  `id_restaurant` int NOT NULL,
  `id_customer` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_restaurant` (`id_restaurant`),
  KEY `id_customer` (`id_customer`),
  CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`id_restaurant`) REFERENCES `restaurants` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `sales_ibfk_2` FOREIGN KEY (`id_customer`) REFERENCES `customers` (`id`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales`
--

LOCK TABLES `sales` WRITE;
/*!40000 ALTER TABLE `sales` DISABLE KEYS */;
INSERT INTO `sales` VALUES (1,'2023-06-13 15:01:56','delivery',7,3),(2,'2023-06-13 15:00:56','restaurant',2,19),(3,'2023-06-13 14:59:56','restaurant',5,17),(4,'2023-06-13 14:58:56','delivery',5,1),(5,'2023-06-13 14:57:56','delivery',10,19),(6,'2023-06-13 14:56:56','delivery',4,20),(7,'2023-06-13 14:55:56','delivery',1,6),(8,'2023-06-13 14:54:56','restaurant',8,7),(9,'2023-06-13 14:53:56','delivery',8,17),(10,'2023-06-13 14:52:56','restaurant',4,8),(11,'2023-06-13 14:51:56','restaurant',4,11),(12,'2023-06-13 14:50:56','delivery',2,4),(13,'2023-06-13 14:49:56','restaurant',6,10),(14,'2023-06-13 14:48:56','restaurant',1,6),(15,'2023-06-13 14:47:56','delivery',10,16),(16,'2023-06-13 14:46:56','restaurant',6,10),(17,'2023-06-13 14:45:56','delivery',9,7),(18,'2023-06-13 14:44:56','delivery',9,10),(19,'2023-06-13 14:43:56','delivery',3,8),(20,'2023-06-13 14:42:56','restaurant',1,1),(21,'2023-06-13 14:41:56','restaurant',3,20),(22,'2023-06-13 14:40:56','restaurant',1,3),(23,'2023-06-13 14:39:56','delivery',3,17),(24,'2023-06-13 14:38:56','delivery',3,8),(25,'2023-06-13 14:37:56','delivery',1,15),(26,'2023-06-13 14:36:56','delivery',7,7),(27,'2023-06-13 14:35:56','restaurant',6,5),(28,'2023-06-13 14:34:56','delivery',1,18),(29,'2023-06-13 14:33:56','delivery',1,10),(30,'2023-06-13 14:32:56','delivery',9,14),(31,'2023-06-13 14:31:56','restaurant',10,19),(32,'2023-06-13 14:30:56','restaurant',2,4),(33,'2023-06-13 14:29:56','delivery',4,10),(34,'2023-06-13 14:28:56','delivery',9,17),(35,'2023-06-13 14:27:56','delivery',10,9),(36,'2023-06-13 14:26:56','delivery',8,15),(37,'2023-06-13 14:25:56','restaurant',1,10),(38,'2023-06-13 14:24:56','restaurant',7,4),(39,'2023-06-13 14:23:56','restaurant',6,5),(40,'2023-06-13 14:22:56','restaurant',8,5),(41,'2023-06-13 14:21:56','delivery',10,16),(42,'2023-06-13 14:20:56','restaurant',8,13),(43,'2023-06-13 14:19:56','delivery',6,18),(44,'2023-06-13 14:18:56','restaurant',5,7),(45,'2023-06-13 14:17:56','restaurant',9,6),(46,'2023-06-13 14:16:56','restaurant',2,15),(47,'2023-06-13 14:15:56','delivery',3,18),(48,'2023-06-13 14:14:56','delivery',1,18),(49,'2023-06-13 14:13:56','restaurant',3,2),(50,'2023-06-13 14:12:56','restaurant',3,12);
/*!40000 ALTER TABLE `sales` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-19  9:29:27

-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: homework_2
-- ------------------------------------------------------
-- Server version	9.2.0

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
-- Table structure for table `ingredients`
--

DROP TABLE IF EXISTS `ingredients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingredients` (
  `ingredient_id` int NOT NULL,
  `ingredient_name` varchar(50) NOT NULL,
  `ingredient_fact` longtext NOT NULL,
  PRIMARY KEY (`ingredient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredients`
--

LOCK TABLES `ingredients` WRITE;
/*!40000 ALTER TABLE `ingredients` DISABLE KEYS */;
INSERT INTO `ingredients` VALUES (1,'Ground Beef','The trick to cooking ground beef well is to not move it around a lot until it\'s finished cooking and nicely browned.'),(2,'Hamburger Bun','A hamburger bun can have around 120–140 calories.'),(3,'Cheese','There are more than 1,800 different types of cheese in the world.'),(4,'Salt','Evidence of salt processing dates back to around 6,000 BC in Romania.'),(5,'Pepper','People in ancient India began using pepper for food at least 2,000 years ago.'),(6,'Chicken Breast','Chickens are descendants of dinosaurs.'),(7,'Olive Oil','Olive oil originated in the eastern Mediterranean region, where olive trees were first cultivated between 8,000 and 6,000 years ago.'),(8,'Garlic Powder','Garlic powder originated in ancient civilizations in Central Asia, Egypt, and Rome.'),(9,'Lemon Juice','Lemons and lemon juice originated in Asia.'),(10,'Cooked Rice','The origin of rice is debated, with some evidence suggesting it originated in China and other evidence suggesting it originated in India.'),(11,'Parsley','Parsley is native to the eastern Mediterranean.'),(12,'Onions','Onions have been cultivated for over 5,000 years and were even used as currency in ancient Egypt.'),(13,'Carrots','Carrots were originally purple or yellow until Dutch farmers selectively bred the orange variety in the 17th century.'),(14,'Minced Garlic','Garlic originated in Central Asia and has been a key ingredient in cuisines from Italy to China for centuries.'),(15,'Tomatoes','Tomatoes were first domesticated by the Aztecs and introduced to Europe in the 16th century.'),(16,'Tomato Paste','Tomato paste was first industrialized in Italy, where it became a staple in many classic pasta sauces.'),(17,'Oregano','Oregano’s name comes from the Greek words meaning \"joy of the mountains,\" as it grows wild in Mediterranean hills.'),(18,'Basil','Basil is believed to have originated in India and was once considered sacred in various cultures.'),(19,'Eggs','Chickens were domesticated for their eggs over 7,000 years ago, likely in Southeast Asia.'),(20,'Milk','The earliest evidence of dairy farming dates back to 6,500 BC in what is now Turkey.'),(21,'Flour','The oldest evidence of flour production dates back 32,000 years, found in prehistoric grinding stones in Europe.'),(22,'Paprika','Paprika originated in Central America and was brought to Europe by Spanish explorers in the 16th century.'),(23,'Butter','Butter has been made since 2,000 BC, with ancient civilizations using it both as food and for religious rituals.'),(24,'Sugar','Sugarcane was first domesticated in Southeast Asia over 4,000 years ago, and sugar refining spread through India and the Middle East.'),(25,'Baking Powder','Baking powder was invented in the 19th century as a convenient leavening agent, revolutionizing baking.'),(26,'Vanilla Extract','Vanilla beans come from orchids native to Mexico, where the Aztecs used them to flavor chocolate.');
/*!40000 ALTER TABLE `ingredients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipe_ingredients`
--

DROP TABLE IF EXISTS `recipe_ingredients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipe_ingredients` (
  `recipe_id` int NOT NULL,
  `ingredient_id` int NOT NULL,
  PRIMARY KEY (`recipe_id`,`ingredient_id`),
  KEY `ingredient_id_idx` (`ingredient_id`),
  CONSTRAINT `ingredient_id` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredients` (`ingredient_id`),
  CONSTRAINT `recipe_id` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`recipe_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipe_ingredients`
--

LOCK TABLES `recipe_ingredients` WRITE;
/*!40000 ALTER TABLE `recipe_ingredients` DISABLE KEYS */;
INSERT INTO `recipe_ingredients` VALUES (1,1),(52,1),(1,2),(55,2),(1,3),(52,3),(1,4),(52,4),(53,4),(54,4),(55,4),(56,4),(1,5),(52,5),(53,5),(54,5),(55,5),(53,6),(54,6),(55,6),(53,7),(53,8),(54,8),(55,8),(53,9),(53,10),(53,11),(52,13),(52,14),(52,15),(52,16),(52,17),(52,18),(55,19),(56,19),(55,20),(56,20),(55,21),(56,21),(55,22),(54,23),(56,23),(56,24),(56,25),(56,26);
/*!40000 ALTER TABLE `recipe_ingredients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipe_steps`
--

DROP TABLE IF EXISTS `recipe_steps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipe_steps` (
  `recipe_id` int NOT NULL,
  `step_number` int NOT NULL,
  `step_description` longtext NOT NULL,
  KEY `recipe_id_idx` (`recipe_id`),
  KEY `recipe_id` (`recipe_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipe_steps`
--

LOCK TABLES `recipe_steps` WRITE;
/*!40000 ALTER TABLE `recipe_steps` DISABLE KEYS */;
INSERT INTO `recipe_steps` VALUES (1,1,'Divide the ground beef into 4 equal portions and shape them into round patties. Press a slight indent in the center of each patty.'),(1,2,'Season both sides of the patties with salt and pepper.'),(1,3,'Heat a skillet or grill over medium-high heat and cook the patties for 4-5 minutes on each side.'),(1,4,'Toast the hamburger buns in a separate pan or on the grill for 1-2 minutes until golden brown.'),(1,5,'Assemble the burger by placing the cooked patty on the bottom half of the bun, then add cheese and any other toppings.'),(1,6,'Serve the burger hot with your favorite sides.'),(4,1,'Heat olive oil in a pan and sauté chopped onion, carrot, and celery until softened.'),(4,2,'Add minced garlic and cook for another 2 minutes.'),(4,3,'Add ground beef and cook until browned.'),(4,4,'Pour in red wine (optional) and simmer for 2 minutes.'),(4,5,'Add crushed tomatoes, tomato paste, oregano, basil, salt, and pepper. Simmer for 30 minutes.'),(4,6,'Meanwhile, cook spaghetti according to package instructions.'),(4,7,'Serve spaghetti with Bolognese sauce on top, garnished with Parmesan and fresh basil.'),(52,1,'Heat olive oil in a pan and sauté chopped onion and carrot until softened.'),(52,2,'Add minced garlic and cook for another 2 minutes.'),(52,3,'Add ground beef and cook until browned.'),(52,4,'Add crushed tomatoes, tomato paste, oregano, basil, salt, and pepper. Simmer for 30 minutes.'),(52,5,'Meanwhile, cook spaghetti according to package instructions.'),(52,6,'Serve spaghetti with Bolognese sauce on top, garnished with Parmesan and fresh basil.'),(53,1,'Preheat grill to medium-high heat.'),(53,2,'Rub chicken breasts with olive oil, garlic powder, salt, black pepper, and lemon juice.'),(53,3,'Place chicken on the grill and cook for 6-8 minutes per side, until fully cooked.'),(53,4,'Let the chicken rest for a few minutes, then slice it.'),(53,5,'Serve with steamed rice and garnish with parsley.'),(54,1,'Preheat the oven to 400°F (200°C) for baking, or heat oil to 375°F (190°C) for frying.'),(54,2,'Coat the chicken wings with salt, pepper, and garlic powder.'),(54,3,'For Baking: Arrange wings on a baking sheet and bake for 35-40 minutes, flipping halfway through.'),(54,4,'For Frying: Fry wings for 8-10 minutes until golden brown.'),(54,5,'In a separate bowl, mix melted butter, and garlic powder.'),(54,6,'Toss cooked wings in your choice of sauce.'),(55,1,'Flatten the chicken breast to an even thickness.'),(55,2,'In a bowl, whisk the egg and milk together.'),(55,3,'In another bowl, mix flour, salt, pepper, garlic powder, and paprika.'),(55,4,'Dip the chicken in the egg mixture, then coat it with the flour mixture.'),(55,5,'Heat oil in a pan and fry the chicken until golden brown and cooked through.'),(55,6,'Toast the burger bun until lightly crispy.'),(55,7,'Assemble the sandwich and enjoy!'),(56,1,'In a medium bowl, whisk together the flour, sugar, baking powder, and salt.'),(56,2,'In another bowl, whisk together the milk, egg, melted butter, and vanilla extract.'),(56,3,'Pour the wet ingredients into the dry ingredients and stir until just combined (lumps are okay).'),(56,4,'Heat a non-stick skillet over medium heat and lightly grease it with butter or oil.'),(56,5,'Pour 1/4 cup of batter onto the skillet for each pancake. Cook until bubbles form on the surface, then flip and cook until golden brown on the other side.'),(56,6,'Serve warm with syrup, butter, or your favorite toppings.');
/*!40000 ALTER TABLE `recipe_steps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipes`
--

DROP TABLE IF EXISTS `recipes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipes` (
  `recipe_id` int NOT NULL AUTO_INCREMENT,
  `recipe_name` varchar(100) NOT NULL,
  `recipe_description` longtext NOT NULL,
  `recipe_image` longtext NOT NULL,
  `protein_type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`recipe_id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipes`
--

LOCK TABLES `recipes` WRITE;
/*!40000 ALTER TABLE `recipes` DISABLE KEYS */;
INSERT INTO `recipes` VALUES (1,'Hamburger','A classic all-American recipe for mouthwatering burgers that can be cooked on the grill, on the stovetop, as thick 1/3 pound patties, or as ultra-thin griddle patties.','https://www.aspicyperspective.com/wp-content/uploads/2020/05/Best-Hamburger-Patty-Recipe-14.jpg','Beef'),(52,'Spaghetti Bolognese','A classic Italian pasta dish with a rich, meaty sauce made from ground beef, tomatoes, and herbs.\r\n','https://images.ctfassets.net/uexfe9h31g3m/6QtnhruEFi8qgEyYAICkyS/ab01e9b1da656f35dd1a721c810162a0/Spaghetti_bolognese_4x3_V2_LOW_RES.jpg?w=1024&h=768&fm=webp&fit=thumb&q=90 ','Beef'),(53,'Grilled Chicken and Rice','A healthy and flavorful grilled chicken served with steamed rice.\r\n','https://i0.wp.com/deliciousasitlooks.com/wp-content/uploads/2015/09/IMG_2571-moroccan-chicken.jpg?w=735&ssl=1','Chicken'),(54,'Chicken Wings','Chicken Wings are crispy, flavorful wings coated in your choice of sauce, perfect for snacking with a side of ranch or blue cheese dressing.\r\n','https://easychickenrecipes.com/wp-content/uploads/2023/08/buffalo-wings-recipe-2.jpg','Chicken'),(55,'Chicken Sandwich','A crispy, juicy chicken sandwich with your choice of toppings on a toasted bun.\r\n','https://cdn.apartmenttherapy.info/image/upload/f_auto,q_auto:eco,c_fill,g_auto,w_1220,h_915/k%2FPhoto%2FRecipe%20Ramp%20Up%2F2022-05-Fried-Chicken-Sandwich%2Fchicken-sandwich-4','Chicken'),(56,'Pancakes','Fluffy and delicious pancakes perfect for a quick breakfast.\r\n','https://www.allrecipes.com/thmb/zOTS1txlUKFMKJYr2qDkwtvjNzM=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/Good-Old-Fashioned-Pancakes-by-angela-2000-5bdefa16ad58418c93658f1d04924708.jpg','Grains');
/*!40000 ALTER TABLE `recipes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-27  0:49:50

-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: fabrikam_bookstore
-- ------------------------------------------------------
-- Server version	5.7.17-log

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
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `books` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `isbn` varchar(100) DEFAULT NULL,
  `title` varchar(200) DEFAULT NULL,
  `author` varchar(200) DEFAULT NULL,
  `publisher` varchar(200) DEFAULT NULL,
  `image` varchar(45) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=150 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (1,'9458271366739','My experiments with Truth','Mahatma M.K.Gandhi','Classic Publishing Inc.','image02',3.30,'2017-02-23 21:37:11','2017-02-23 21:37:11'),(2,'1810353354131','Far from the Madding Crowd','Thomas Hardy','Classic Publishing Inc.','image03',19.25,'2017-02-23 21:37:11','2017-02-23 21:37:11'),(3,'4889763076008','Geetanjali','Rabindra Nath Tagore','Classic Publishing Inc.','image01',17.22,'2017-02-23 21:37:11','2017-02-23 21:37:11'),(4,'3335132035333','One Day in the Life of Ivan Denisovitch','Alexander Solzhenitsyn','Classic Publishing Inc.','image02',9.11,'2017-02-23 21:37:11','2017-02-23 21:37:11'),(5,'2236129400064','The Merchant of venice','William shakespeare','Classic Publishing Inc.','image03',65.92,'2017-02-23 21:37:11','2017-02-23 21:37:11'),(6,'8699604215980','The Moon and Six pense','Somerset Maughan','Classic Publishing Inc.','image01',25.35,'2017-02-23 21:37:11','2017-02-23 21:37:11'),(7,'8710246863381','Pilgrim\'s Progress from this world to that which is to come','John Bunyan','Classic Publishing Inc.','image02',46.64,'2017-02-23 21:37:11','2017-02-23 21:37:11'),(8,'4137074196967','A Tale of Two Cities','Charles Dickens','Classic Publishing Inc.','image03',25.35,'2017-02-23 21:37:11','2017-02-23 21:37:11'),(9,'7739673249611','Utopia','Sir Thomas Moor','Classic Publishing Inc.','image01',18.24,'2017-02-23 21:37:11','2017-02-23 21:37:11'),(10,'6461291794673','Origin of species','charles Darwin','Classic Publishing Inc.','image02',7.80,'2017-02-23 21:37:11','2017-02-23 21:37:11'),(11,'7371386899587','David Copperfield','Charles Dickens','Classic Publishing Inc.','image03',46.64,'2017-02-23 21:37:11','2017-02-23 21:37:11'),(12,'8088189180257','A passage to India','E.M.Forster','Classic Publishing Inc.','image01',63.89,'2017-02-23 21:37:11','2017-02-23 21:37:11'),(13,'7691885467932','Gulliver\'s Travels','Jonathan Swift','Classic Publishing Inc.','image02',35.49,'2017-02-23 21:37:11','2017-02-23 21:37:11'),(14,'4416305136496','Discovery of India','Pandit Jawaharlal Nehru','Classic Publishing Inc.','image03',32.45,'2017-02-23 21:37:11','2017-02-23 21:37:11'),(15,'5558543779770','The Vicar of Wakefield','Oliver Goldsmith','Classic Publishing Inc.','image01',22.30,'2017-02-23 21:37:11','2017-02-23 21:37:11'),(16,'2330076757483','The Decline and Fall of the Roman Empire','Edward Gibbon','Classic Publishing Inc.','image02',45.63,'2017-02-23 21:37:11','2017-02-23 21:37:11'),(17,'3480409537620','The Lady of the Last Minstrel','Sir Walter Scott','Classic Publishing Inc.','image03',66.93,'2017-02-23 21:37:11','2017-02-23 21:37:11'),(18,'9585684963443','Pride and Prejudice','Jane Austen','Classic Publishing Inc.','image01',31.43,'2017-02-23 21:37:11','2017-02-23 21:37:11'),(19,'4647685610187','Time Machine','H.G. Wells','Classic Publishing Inc.','image02',36.50,'2017-02-23 21:37:11','2017-02-23 21:37:11'),(20,'3834578712971','Arthashastra','Kautilya','Classic Publishing Inc.','image03',60.84,'2017-02-23 21:37:11','2017-02-23 21:37:11'),(21,'2928297652578','Le Contract Social','Jean Jacques Rousseau','Classic Publishing Inc.','image01',52.73,'2017-02-23 21:37:11','2017-02-23 21:37:11'),(22,'3663713497911','Avigyan Sakuntalam','Kalidas','Classic Publishing Inc.','image02',20.27,'2017-02-23 21:37:11','2017-02-23 21:37:11'),(23,'5186412306598','Anand Math','Bankimchandra Chattopadhyay','Classic Publishing Inc.','image03',11.14,'2017-02-23 21:37:11','2017-02-23 21:37:11'),(24,'9381694025117','Mein Kampf','Adolf Hitler','Classic Publishing Inc.','image01',24.33,'2017-02-23 21:37:11','2017-02-23 21:37:11'),(25,'7338271934040','Ain-i-Akbari','Abul Fazal','Classic Publishing Inc.','image02',8.10,'2017-02-23 21:37:11','2017-02-23 21:37:11'),(26,'9133135335204','Akbar-Nama','Abul Fazal','Classic Publishing Inc.','image03',34.47,'2017-02-23 21:37:11','2017-02-23 21:37:11'),(27,'2271406174161','Shakuntala','Kalidas','Classic Publishing Inc.','image01',40.56,'2017-02-23 21:37:11','2017-02-23 21:37:11'),(28,'5622819875544','War and peace','Leo Tolstoy','Classic Publishing Inc.','image02',69.97,'2017-02-23 21:37:11','2017-02-23 21:37:11'),(29,'7992958924974','A Dangerous place','D.P. Moynihan','Classic Publishing Inc.','image03',61.87,'2017-02-23 21:37:11','2017-02-23 21:37:11'),(30,'1704883673227','Raghuvamsa','Kalidas','Classic Publishing Inc.','image01',21.29,'2017-02-23 21:37:11','2017-02-23 21:37:11'),(31,'7831073179628','Adventures of Sherlock Holmes','Arthur Conan Doyle','Classic Publishing Inc.','image02',17.23,'2017-02-23 21:37:12','2017-02-23 21:37:12'),(32,'5025465502161','Adventures of Tom Saweyer','Mark Twain','Classic Publishing Inc.','image03',35.49,'2017-02-23 21:37:12','2017-02-23 21:37:12'),(33,'7099243619218','Agni Veena','Kazi Nasrul Islam','Classic Publishing Inc.','image01',21.28,'2017-02-23 21:37:12','2017-02-23 21:37:12'),(34,'9057039948438','Alice in Wonderland','Lewis Carrol','Classic Publishing Inc.','image02',69.98,'2017-02-23 21:37:12','2017-02-23 21:37:12'),(35,'1592305118660','Ancient Mariner','Coleridge','Classic Publishing Inc.','image03',32.45,'2017-02-23 21:37:12','2017-02-23 21:37:12'),(36,'8132579673492','Animal Farm','George Orwell','Classic Publishing Inc.','image01',67.95,'2017-02-23 21:37:12','2017-02-23 21:37:12'),(37,'8846002742878','Anna Karenina','Tolstoy','Classic Publishing Inc.','image02',14.18,'2017-02-23 21:37:12','2017-02-23 21:37:12'),(38,'2707269160553','Antony and Cleopatra','Shakespeare','Classic Publishing Inc.','image03',63.89,'2017-02-23 21:37:12','2017-02-23 21:37:12'),(39,'4166151366228','Arms and the Man','G.B.Shaw','Classic Publishing Inc.','image01',3.30,'2017-02-23 21:37:12','2017-02-23 21:37:12'),(40,'2256064666844','Around the World in eighty days','Jules Verne','Classic Publishing Inc.','image02',29.40,'2017-02-23 21:37:12','2017-02-23 21:37:12'),(41,'9688331428646','Baburnama','Babur','Classic Publishing Inc.','image03',4.40,'2017-02-23 21:37:12','2017-02-23 21:37:12'),(42,'6690597679889','Ben Hur','Lewis Wallace','Classic Publishing Inc.','image01',52.73,'2017-02-23 21:37:12','2017-02-23 21:37:12'),(43,'9302722979058','Bhagwat Gita','Ved Vyas','Classic Publishing Inc.','image02',16.21,'2017-02-23 21:37:12','2017-02-23 21:37:12'),(44,'4261028284635','Bisarjan','R.N.Tagore','Classic Publishing Inc.','image03',56.80,'2017-02-23 21:37:12','2017-02-23 21:37:12'),(45,'2082843051241','Canterbury Tales','Chaucer','Classic Publishing Inc.','image01',16.22,'2017-02-23 21:37:12','2017-02-23 21:37:12'),(46,'7295103051199','Chitra','R.N.Tagore','Classic Publishing Inc.','image02',16.22,'2017-02-23 21:37:12','2017-02-23 21:37:12'),(47,'7340441659432','Count of Monte Cristo','Alexander Dumas','Classic Publishing Inc.','image03',6.70,'2017-02-23 21:37:12','2017-02-23 21:37:12'),(48,'1232271789285','Crime and Punishment','Dostoevsky','Classic Publishing Inc.','image01',7.80,'2017-02-23 21:37:12','2017-02-23 21:37:12'),(49,'3245616719166','Das Kapital','Karl Marx','Classic Publishing Inc.','image02',44.62,'2017-02-23 21:37:12','2017-02-23 21:37:12'),(50,'6176401986873','Divine Comedy','Dante','Classic Publishing Inc.','image03',8.10,'2017-02-23 21:37:12','2017-02-23 21:37:12'),(51,'3419297550123','Dr.Jekyll and Mr.Hyde','Stevenson','Classic Publishing Inc.','image01',51.71,'2017-02-23 21:37:12','2017-02-23 21:37:12'),(52,'4272412519549','Don Quixote','Cervantes','Classic Publishing Inc.','image02',12.16,'2017-02-23 21:37:12','2017-02-23 21:37:12'),(53,'1384209446697','Dr.Zhivago','Boris Pasternak','Classic Publishing Inc.','image03',65.92,'2017-02-23 21:37:12','2017-02-23 21:37:12'),(54,'9340687695428','For whom the Bell Tolls','Ernest Hemingway','Classic Publishing Inc.','image01',52.73,'2017-02-23 21:37:12','2017-02-23 21:37:12'),(55,'5224643455041','Forsyte Saga','John Galsworthy','Classic Publishing Inc.','image02',19.26,'2017-02-23 21:37:12','2017-02-23 21:37:12'),(56,'6905677868827','Freedom at Midnight','Dominique Lapierre','Classic Publishing Inc.','image03',53.75,'2017-02-23 21:37:12','2017-02-23 21:37:12'),(57,'6623932158643','Gathering Storm','Winston Churchill','Classic Publishing Inc.','image01',10.12,'2017-02-23 21:37:12','2017-02-23 21:37:12'),(58,'5508059050889','Geet Govind','Jaya Dev','Classic Publishing Inc.','image02',62.88,'2017-02-23 21:37:12','2017-02-23 21:37:12'),(59,'5996851212403','Gora','R.N. Tagore','Classic Publishing Inc.','image03',2.20,'2017-02-23 21:37:12','2017-02-23 21:37:12'),(60,'3102985175970','Hamlet','Shakespeare','Classic Publishing Inc.','image01',33.45,'2017-02-23 21:37:12','2017-02-23 21:37:12'),(61,'7539318041818','Harsha Charit','Bana Bhatt','Classic Publishing Inc.','image02',55.77,'2017-02-23 21:37:12','2017-02-23 21:37:12'),(62,'4198546987835','Hunchback of Notre Dame','Victor Hugo','Classic Publishing Inc.','image03',46.65,'2017-02-23 21:37:12','2017-02-23 21:37:12'),(63,'6144115271991','Hungry Stones','R.N.Tagore','Classic Publishing Inc.','image01',33.46,'2017-02-23 21:37:12','2017-02-23 21:37:12'),(64,'7145909576383','Illiad','Homer','Classic Publishing Inc.','image02',66.94,'2017-02-23 21:37:12','2017-02-23 21:37:12'),(65,'8630208615044','Invisible Man','H.G.Wells','Classic Publishing Inc.','image03',59.83,'2017-02-23 21:37:12','2017-02-23 21:37:12'),(66,'3457022508537','Ivanhoe','Walter Scott','Classic Publishing Inc.','image01',12.16,'2017-02-23 21:37:12','2017-02-23 21:37:12'),(67,'2100046672149','Jungle Book','Rudyard Kipling','Classic Publishing Inc.','image02',44.62,'2017-02-23 21:37:12','2017-02-23 21:37:12'),(68,'8634845519492','Kadambari','Bana Bhatt','Classic Publishing Inc.','image03',35.49,'2017-02-23 21:37:12','2017-02-23 21:37:12'),(69,'3935101128947','Kidnapped','R.L.Stevenson','Classic Publishing Inc.','image01',2.10,'2017-02-23 21:37:12','2017-02-23 21:37:12'),(70,'7425954106277','King Lear','Shakespeare','Classic Publishing Inc.','image02',24.34,'2017-02-23 21:37:12','2017-02-23 21:37:12'),(71,'3484055125716','Kumar Sambhav','Kalidas','Classic Publishing Inc.','image03',32.45,'2017-02-23 21:37:12','2017-02-23 21:37:12'),(72,'1884251488177','Last Days of Pompeii','Bulwar Lytton','Classic Publishing Inc.','image01',4.50,'2017-02-23 21:37:12','2017-02-23 21:37:12'),(73,'6530634708326','Les Miserable','Victor Hugo','Classic Publishing Inc.','image02',29.40,'2017-02-23 21:37:12','2017-02-23 21:37:12'),(74,'3502722054454','Life Divine','Shri Aurobindo','Classic Publishing Inc.','image03',9.11,'2017-02-23 21:37:12','2017-02-23 21:37:12'),(75,'4146228395435','Mahabharata','Vyas','Classic Publishing Inc.','image01',57.81,'2017-02-23 21:37:13','2017-02-23 21:37:13'),(76,'6237689972688','Man and Superman','G.B.Shaw','Classic Publishing Inc.','image02',69.98,'2017-02-23 21:37:13','2017-02-23 21:37:13'),(77,'4360981629963','Meghdut','Kalidas','Classic Publishing Inc.','image03',5.60,'2017-02-23 21:37:13','2017-02-23 21:37:13'),(78,'2036504021961','Mother','Maxim Gorky','Classic Publishing Inc.','image01',24.33,'2017-02-23 21:37:13','2017-02-23 21:37:13'),(79,'8409962084987','Odyssey','Homer','Classic Publishing Inc.','image02',9.11,'2017-02-23 21:37:13','2017-02-23 21:37:13'),(80,'1154278882840','Oliver Twist','Charles Dickens','Classic Publishing Inc.','image03',61.86,'2017-02-23 21:37:13','2017-02-23 21:37:13'),(81,'2903794786883','Othello','Shakespeare','Classic Publishing Inc.','image01',30.41,'2017-02-23 21:37:13','2017-02-23 21:37:13'),(82,'2150245495987','Panchatantra','Vishnu Sharma','Classic Publishing Inc.','image02',35.49,'2017-02-23 21:37:13','2017-02-23 21:37:13'),(83,'3488314267489','Paradise lost','John Milton','Classic Publishing Inc.','image03',26.35,'2017-02-23 21:37:13','2017-02-23 21:37:13'),(84,'2927658049212','Pickwick Papers','Charles Dickens','Classic Publishing Inc.','image01',55.77,'2017-02-23 21:37:13','2017-02-23 21:37:13'),(85,'8285576123102','Plague','Albert Camus','Classic Publishing Inc.','image02',40.56,'2017-02-23 21:37:13','2017-02-23 21:37:13'),(86,'4669771771189','The Post Office','R.N.Tagore','Classic Publishing Inc.','image03',7.80,'2017-02-23 21:37:13','2017-02-23 21:37:13'),(87,'4752376055462','Principia','Issac Newton','Classic Publishing Inc.','image01',39.55,'2017-02-23 21:37:13','2017-02-23 21:37:13'),(88,'7758555923788','Ramayana','Valmiki','Classic Publishing Inc.','image02',38.54,'2017-02-23 21:37:13','2017-02-23 21:37:13'),(89,'4943497604508','Robinson Crusoe','Daniel Defoe','Classic Publishing Inc.','image03',51.72,'2017-02-23 21:37:13','2017-02-23 21:37:13'),(90,'4686627249831','Shah Nama','Firdausi','Classic Publishing Inc.','image01',48.68,'2017-02-23 21:37:13','2017-02-23 21:37:13'),(91,'2619758625959','Shape of things to come','H.G.Wells','Classic Publishing Inc.','image02',59.83,'2017-02-23 21:37:13','2017-02-23 21:37:13'),(92,'4449063691987','Three Musketeers','Alexander Dumas','Classic Publishing Inc.','image03',21.29,'2017-02-23 21:37:13','2017-02-23 21:37:13'),(93,'6710399059260','The Tempest','Shakespeare','Classic Publishing Inc.','image01',62.88,'2017-02-23 21:37:13','2017-02-23 21:37:13'),(94,'2174286190257','Tom Sawyer','Mark Twain','Classic Publishing Inc.','image02',40.56,'2017-02-23 21:37:13','2017-02-23 21:37:13'),(95,'4716746625025','Treasure Island','R.L.Stevenson','Classic Publishing Inc.','image03',44.61,'2017-02-23 21:37:13','2017-02-23 21:37:13'),(96,'6600904440810','Ulysses','James Joyce','Classic Publishing Inc.','image01',27.37,'2017-02-23 21:37:13','2017-02-23 21:37:13'),(97,'1657583519008','Uncle Tom\'s Cabin','Mrs.Harriet Stowe','Classic Publishing Inc.','image02',20.27,'2017-02-23 21:37:13','2017-02-23 21:37:13'),(98,'3267933402674','Waste Land','T.S.Eliot','Classic Publishing Inc.','image03',19.26,'2017-02-23 21:37:13','2017-02-23 21:37:13'),(99,'5630809669590','Nineteen Eighty-four','George Orwell','Classic Publishing Inc.','image01',67.95,'2017-02-23 21:37:13','2017-02-23 21:37:13'),(100,'8625811653815','Sunny Days','Sunil Gavaskar','Classic Publishing Inc.','image02',6.60,'2017-02-23 21:37:13','2017-02-23 21:37:13'),(101,'6306176379048','Faust','Goethe','Classic Publishing Inc.','image03',42.59,'2017-02-23 21:37:13','2017-02-23 21:37:13'),(102,'8705586139938','Arabian Nights','Sir Richard Burton','Classic Publishing Inc.','image01',40.56,'2017-02-23 21:37:13','2017-02-23 21:37:13'),(103,'7297151771448','The City of Joy','Dominique Lapierre','Classic Publishing Inc.','image02',7.80,'2017-02-23 21:37:13','2017-02-23 21:37:13'),(104,'5819643724000','The One Day Wonders','Sunil Gavaskar','Classic Publishing Inc.','image03',21.29,'2017-02-23 21:37:13','2017-02-23 21:37:13'),(105,'3803456861156','Silas Marner','George Eliot','Classic Publishing Inc.','image01',45.64,'2017-02-23 21:37:13','2017-02-23 21:37:13'),(106,'2646157173056','Bachelor of Arts','R.K.Narayan','Classic Publishing Inc.','image02',48.67,'2017-02-23 21:37:13','2017-02-23 21:37:13'),(107,'7741777811222','China Passage','John Kenneth Galbraith','Classic Publishing Inc.','image03',53.74,'2017-02-23 21:37:13','2017-02-23 21:37:13'),(108,'7881478503353','A Suitable Boy','Vikram Seth','Classic Publishing Inc.','image01',58.82,'2017-02-23 21:37:13','2017-02-23 21:37:13'),(109,'6305569299992','A Voice For Freedom','Nayantara Saigal','Classic Publishing Inc.','image02',64.91,'2017-02-23 21:37:13','2017-02-23 21:37:13'),(110,'8986943482351','A Week with Gandhi','Louis Fisher','Classic Publishing Inc.','image03',20.27,'2017-02-23 21:37:13','2017-02-23 21:37:13'),(111,'3655797349974','A Woman\'s Life','Guy de Maupassaut','Classic Publishing Inc.','image01',49.69,'2017-02-23 21:37:13','2017-02-23 21:37:13'),(112,'5698538136681','Age of Reason','Jean Paul Sartre','Classic Publishing Inc.','image02',55.78,'2017-02-23 21:37:13','2017-02-23 21:37:13'),(113,'7098088077013','Asian Drama','Gunnar Myrdal','Classic Publishing Inc.','image03',55.77,'2017-02-23 21:37:13','2017-02-23 21:37:13'),(114,'5953682329562','The Bubble','Mulk Raj Anand','Classic Publishing Inc.','image01',11.14,'2017-02-23 21:37:13','2017-02-23 21:37:13'),(115,'1310291500197','Ben Hur','Lewis Wallace','Classic Publishing Inc.','image02',4.50,'2017-02-23 21:37:13','2017-02-23 21:37:13'),(116,'6500173656941','The Castle','Franz Kalka','Classic Publishing Inc.','image03',21.29,'2017-02-23 21:37:13','2017-02-23 21:37:13'),(117,'1821343831456','Chandalika','Rabindra Nath Tagore','Classic Publishing Inc.','image01',22.30,'2017-02-23 21:37:13','2017-02-23 21:37:13'),(118,'4327567222777','The Class','Erich Byron','Classic Publishing Inc.','image02',48.68,'2017-02-23 21:37:14','2017-02-23 21:37:14'),(119,'8860314564391','The Clown','Heinrich Boll','Classic Publishing Inc.','image03',28.39,'2017-02-23 21:37:14','2017-02-23 21:37:14'),(120,'5071547954965','Comedy of Errors','William Shakespeare','Classic Publishing Inc.','image01',54.76,'2017-02-23 21:37:14','2017-02-23 21:37:14'),(121,'8704646453073','Communist Manifesto','Karl Marx','Classic Publishing Inc.','image02',42.59,'2017-02-23 21:37:14','2017-02-23 21:37:14'),(122,'4341471859471','Confessions','Jean Jacques Rousseau','Classic Publishing Inc.','image03',7.90,'2017-02-23 21:37:14','2017-02-23 21:37:14'),(123,'4802467914983','The Court Dancer','Rabindra Nath Tagore','Classic Publishing Inc.','image01',54.76,'2017-02-23 21:37:14','2017-02-23 21:37:14'),(124,'9248473879114','Death of a City','Amrita Pritam','Classic Publishing Inc.','image02',23.31,'2017-02-23 21:37:14','2017-02-23 21:37:14'),(125,'5917305480316','Decline and Fall of the Roman','Edward Gibbon Empire','Classic Publishing Inc.','image03',35.49,'2017-02-23 21:37:14','2017-02-23 21:37:14'),(126,'9034982544839','Essays of Gita','Sir Aurobindo Ghosh','Classic Publishing Inc.','image01',12.16,'2017-02-23 21:37:14','2017-02-23 21:37:14'),(127,'5173842428916','French Revolution','Thomas Carlyle','Classic Publishing Inc.','image02',12.15,'2017-02-23 21:37:14','2017-02-23 21:37:14'),(128,'5467458518068','Ganadevata','Tara Shankar Bandopadhyaya','Classic Publishing Inc.','image03',58.82,'2017-02-23 21:37:14','2017-02-23 21:37:14'),(129,'8785965429428','Glimpses of World History','Jawaharlal Nehru','Classic Publishing Inc.','image01',35.48,'2017-02-23 21:37:14','2017-02-23 21:37:14'),(130,'7545315065736','The Godfather','Mario Puzo','Classic Publishing Inc.','image02',32.44,'2017-02-23 21:37:14','2017-02-23 21:37:14'),(131,'5691217564790','Grammar of Politics','Harold T.Laski','Classic Publishing Inc.','image03',51.72,'2017-02-23 21:37:14','2017-02-23 21:37:14'),(132,'2204168227288','Guide','R.K.Narayan','Classic Publishing Inc.','image01',56.79,'2017-02-23 21:37:14','2017-02-23 21:37:14'),(133,'6405684352370','Hindu View of Life','Dr.S.Radha Krishnan','Classic Publishing Inc.','image02',26.36,'2017-02-23 21:37:14','2017-02-23 21:37:14'),(134,'9784131542282','Hungry Stones','Rabindra Nath Tagore','Classic Publishing Inc.','image03',5.50,'2017-02-23 21:37:14','2017-02-23 21:37:14'),(135,'4848093614902','India Divided','Dr.Rajendra Prasad','Classic Publishing Inc.','image01',21.28,'2017-02-23 21:37:14','2017-02-23 21:37:14'),(136,'4198208646944','Jurassik Park','Michael Crichton','Classic Publishing Inc.','image02',59.84,'2017-02-23 21:37:14','2017-02-23 21:37:14'),(137,'4853074835650','Kidnapped','Robert Louis Stevenson','Classic Publishing Inc.','image03',30.42,'2017-02-23 21:37:14','2017-02-23 21:37:14'),(138,'7668651654599','Richard Nixon','Leaders','Classic Publishing Inc.','image01',6.60,'2017-02-23 21:37:14','2017-02-23 21:37:14'),(139,'9124192299167','Mahatma Gandhi','Romain Rolland','Classic Publishing Inc.','image02',11.14,'2017-02-23 21:37:14','2017-02-23 21:37:14'),(140,'6750538950045','The Masters','C.P.Shaw','Classic Publishing Inc.','image03',61.87,'2017-02-23 21:37:14','2017-02-23 21:37:14'),(141,'6927983959966','My Truth','Indira Gandhi','Classic Publishing Inc.','image01',23.32,'2017-02-23 21:37:14','2017-02-23 21:37:14'),(142,'6870897552107','Old Man and the Sea','Earnest Hemingway','Classic Publishing Inc.','image02',51.72,'2017-02-23 21:37:14','2017-02-23 21:37:14'),(143,'2564096623795','The Other Side of Midnight','Sindye Sheldon','Classic Publishing Inc.','image03',44.61,'2017-02-23 21:37:14','2017-02-23 21:37:14'),(144,'5956535233267','Pride and Prejudice','Jane Austen','Classic Publishing Inc.','image01',33.46,'2017-02-23 21:37:14','2017-02-23 21:37:14'),(145,'2141939899856','Shape of Things to Come','H.G.Wells','Classic Publishing Inc.','image02',69.97,'2017-02-23 21:37:14','2017-02-23 21:37:14'),(146,'6921201600389','Sons and Lovers','D.H.Lawrence','Classic Publishing Inc.','image03',5.60,'2017-02-23 21:37:14','2017-02-23 21:37:14'),(147,'7350965614973','Treasure Island','R.L.Stevenson','Classic Publishing Inc.','image01',36.50,'2017-02-23 21:37:14','2017-02-23 21:37:14'),(148,'1867827840809','Valley of Dolls','Jacqueline Susann','Classic Publishing Inc.','image02',53.75,'2017-02-23 21:37:14','2017-02-23 21:37:14'),(149,'1975105801170','Wealth of Nations','Adam Smith','Classic Publishing Inc.','image03',37.52,'2017-02-23 21:37:14','2017-02-23 21:37:14');
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `creditcards`
--

DROP TABLE IF EXISTS `creditcards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `creditcards` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `cardno` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `billingaddress` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `expdate` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cardno_unique` (`cardno`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `creditcards_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `creditcards`
--

LOCK TABLES `creditcards` WRITE;
/*!40000 ALTER TABLE `creditcards` DISABLE KEYS */;
/*!40000 ALTER TABLE `creditcards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderdetails`
--

DROP TABLE IF EXISTS `orderdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orderdetails` (
  `lineitemid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned NOT NULL,
  `bookid` int(11) NOT NULL,
  `lineitemprice` decimal(13,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`lineitemid`),
  KEY `order_id` (`order_id`),
  KEY `bookid` (`bookid`),
  CONSTRAINT `orderdetails_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`orderid`),
  CONSTRAINT `orderdetails_ibfk_2` FOREIGN KEY (`bookid`) REFERENCES `books` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderdetails`
--

LOCK TABLES `orderdetails` WRITE;
/*!40000 ALTER TABLE `orderdetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `orderdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `orderid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `total` decimal(13,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`orderid`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-02-23 16:38:51

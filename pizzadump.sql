-- MySQL dump 10.16  Distrib 10.1.16-MariaDB, for Win32 (AMD64)
--
-- Host: localhost    Database: pizzadb
-- ------------------------------------------------------
-- Server version	10.1.16-MariaDB

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
-- Table structure for table `alembic_version`
--

DROP TABLE IF EXISTS `alembic_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alembic_version` (
  `version_num` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alembic_version`
--

LOCK TABLES `alembic_version` WRITE;
/*!40000 ALTER TABLE `alembic_version` DISABLE KEYS */;
INSERT INTO `alembic_version` VALUES ('e01d859aba69');
/*!40000 ALTER TABLE `alembic_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL,
  `country_id` int(11) NOT NULL,
  `state_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `country_id` (`country_id`),
  KEY `state_id` (`state_id`),
  KEY `ix_cities_name` (`name`),
  CONSTRAINT `cities_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`),
  CONSTRAINT `cities_ibfk_2` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` VALUES (1,'Birmingham',1,1),(2,'Montgomery',1,1),(3,'Mobile',1,1),(4,'Huntsville',1,1),(5,'Tuscaloosa',1,1),(6,'Hoover',1,1),(7,'Dothan',1,1),(8,'Auburn',1,1),(9,'Decatur',1,1),(10,'Madison',1,1),(11,'Florence',1,1),(12,'Phenix City',1,1),(13,'Gadsden',1,1),(14,'Prattville',1,1),(15,'Vestavia Hills',1,1),(16,'Alabaster',1,1),(17,'Opelika',1,1),(18,'Enterprise',1,1),(19,'Bessemer',1,1),(20,'Homewood',1,1),(21,'Anchorage',1,2),(22,'Juneau',1,2),(23,'Fairbanks',1,2),(24,'Badger',1,2),(25,'Knik-Fairview',1,2),(26,'College',1,2),(27,'Tanaina',1,2),(28,'Wasilla',1,2),(29,'Lakes',1,2),(30,'Sitka',1,2),(31,'Ketchikan',1,2),(32,'Kalifornsky',1,2),(33,'Kenai',1,2),(34,'Meadow Lakes',1,2),(35,'Palmer',1,2),(36,'Bethel',1,2),(37,'Steele Creek',1,2),(38,'Kodiak',1,2),(39,'Sterling',1,2),(40,'Gateway',1,2),(41,'Phoenix',1,3),(42,'Tucson',1,3),(43,'Mesa',1,3),(44,'Chandler',1,3),(45,'Gilbert',1,3),(46,'Glendale',1,3),(47,'Scottsdale',1,3),(48,'Tempe',1,3),(49,'Peoria',1,3),(50,'Surprise',1,3),(51,'Yuma',1,3),(52,'San Tan Valley',1,3),(53,'Avondale',1,3),(54,'Goodyear',1,3),(55,'Flagstaff',1,3),(56,'Casas Adobes',1,3),(57,'Buckeye',1,3),(58,'Lake Havasu City',1,3),(59,'Casa Grande',1,3),(60,'Catalina Foothills',1,3),(61,'Little Rock',1,4),(62,'Fort Smith',1,4),(63,'Fayetteville',1,4),(64,'Springdale',1,4),(65,'Jonesboro',1,4),(66,'North Little Rock',1,4),(67,'Conway',1,4),(68,'	Rogers',1,4),(69,'Pine Bluff',1,4),(70,'Bentonville',1,4),(71,'Hot Springs',1,4),(72,'Benton',1,4),(73,'Sherwood',1,4),(74,'Texarkana',1,4),(75,'Russellville',1,4),(76,'Jacksonville',1,4),(77,'Bella Vista',1,4),(78,'Paragould',1,4),(79,'Cabot',1,4),(80,'West Memphis',1,4),(81,'Los Angeles',1,5),(82,'San Diego',1,5),(83,'San Jose',1,5),(84,'San Francisco',1,5),(85,'Fresno',1,5),(86,'Sacramento',1,5),(87,'Long Beach',1,5),(88,'Oakland',1,5),(89,'Bakersfield',1,5),(90,'Anaheim',1,5),(91,'Santa Ana',1,5),(92,'Riverside',1,5),(93,'Stockton',1,5),(94,'Chula Vista',1,5),(95,'Irvine',1,5),(96,'Fremont',1,5),(97,'San Bernardino',1,5),(98,'Modesto',1,5),(99,'Fontana',1,5),(100,'Oxnard',1,5),(101,'Denver',1,6),(102,'Colorado Springs',1,6),(103,'Aurora',1,6),(104,'Fort Collins',1,6),(105,'Lakewood',1,6),(106,'Thornton',1,6),(107,'Arvada',1,6),(108,'Westminster',1,6),(109,'Centennial',1,6),(110,'Pueblo',1,6),(111,'Boulder',1,6),(112,'Highlands Ranch',1,6),(113,'Greeley',1,6),(114,'Longmont',1,6),(115,'Loveland',1,6),(116,'Broomfield',1,6),(117,'Grand Junction',1,6),(118,'Castle Rock',1,6),(119,'Commerce City',1,6),(120,'	Parker',1,6),(121,'Bridgeport',1,7),(122,'New Haven',1,7),(123,'Stamford',1,7),(124,'Hartford',1,7),(125,'Waterbury',1,7),(126,'Norwalk',1,7),(127,'Danbury',1,7),(128,'New Britain',1,7),(129,'West Hartford',1,7),(130,'Greenwich',1,7),(131,'Boulder',1,7),(132,'Fairfield',1,7),(133,'Hamden',1,7),(134,'Bristol',1,7),(135,'Meriden',1,7),(136,'Manchester',1,7),(137,'West Haven',1,7),(138,'Milford',1,7),(139,'Stratford',1,7),(140,'East Hartford',1,7),(141,'Wilmington',1,8),(142,'Dover',1,8),(143,'Newark',1,8),(144,'Middletown',1,8),(145,'Bear',1,8),(146,'Glasgow',1,8),(147,'Brookside',1,8),(148,'Hockessin',1,8),(149,'Smyrna',1,8),(150,'Pike Creek Valley',1,8),(151,'Milford',1,8),(152,'Claymont',1,8),(153,'Pike Creek',1,8),(154,'Wilmington Manor',1,8),(155,'North Star',1,8),(156,'Seaford',1,8),(157,'Georgetown',1,8),(158,'Edgemoor',1,8),(159,'Elsmere',1,8),(160,'New Castle',1,8),(161,'Jacksonville',1,9),(162,'Miami',1,9),(163,'Tampa',1,9),(164,'Orlando',1,9),(165,'St.Petersburg',1,9),(166,'Hialeah',1,9),(167,'Tallahassee',1,9),(168,'Port St. Lucie',1,9),(169,'Fort Lauderdale',1,9),(170,'Cape Coral',1,9),(171,'Pembroke Pines',1,9),(172,'Hollywood',1,9),(173,'Miramar',1,9),(174,'Gainesville',1,9),(175,'Coral Springs',1,9),(176,'Miami Gardens',1,9),(177,'Clearwater',1,9),(178,'Lehigh Acres',1,9),(179,'Brandon',1,9),(180,'Palm Bay',1,9),(181,'Atlanta',1,10),(182,'Columbus',1,10),(183,'Augusta-Richmond',1,10),(184,'	Macon-Bibb County',1,10),(185,'Savannah',1,10),(186,'Athens-Clarke',1,10),(187,'Sandy Springs',1,10),(188,'Roswell',1,10),(189,'Johns Creek',1,10),(190,'Albany',1,10),(191,'Warner Robins',1,10),(192,'Alpharetta',1,10),(193,'Marietta',1,10),(194,'Smyrna',1,10),(195,'Valdosta',1,10),(196,'Brookhaven',1,10),(197,'Dunwoody',1,10),(198,'Peachtree Corners',1,10),(199,'Mableton',1,10),(200,'Gainesville',1,10),(201,'Urban Honolulu',1,11),(202,'East Honolulu',1,11),(203,'Pearl City',1,11),(204,'Hilo',1,11),(205,'Waipahu',1,11),(206,'Kailua CDP',1,11),(207,'Kaneohe',1,11),(208,'Kahului',1,11),(209,'Mililani Town',1,11),(210,'Ewa Gentry',1,11),(211,'Kihei',1,11),(212,'Mililani Mauka',1,11),(213,'Schofield Barracks',1,11),(214,'Makakilo',1,11),(215,'Kapolei',1,11),(216,'Wahiawa',1,11),(217,'Wailuku',1,11),(218,'Halawa',1,11),(219,'Ewa Beach',1,11),(220,'Royal Kunia',1,11),(221,'Boise City',1,12),(222,'Meridian',1,12),(223,'Nampa',1,12),(224,'Idaho Falls',1,12),(225,'Pocatello',1,12),(226,'Caldwell',1,12),(227,'Coeur d\'Alene',1,12),(228,'Twin Falls',1,12),(229,'Lewiston',1,12),(230,'Post Falls',1,12),(231,'Rexburg',1,12),(232,'Moscow',1,12),(233,'Eagle',1,12),(234,'Kuna',1,12),(235,'Ammon',1,12),(236,'Chubbuck',1,12),(237,'Hayden',1,12),(238,'Mountain Home',1,12),(239,'	Blackfoot',1,12),(240,'Garden City',1,12),(241,'Chicago',1,13),(242,'Aurora',1,13),(243,'Rockford',1,13),(244,'Joliet',1,13),(245,'Naperville',1,13),(246,'Springfield',1,13),(247,'Peoria',1,13),(248,'Elgin',1,13),(249,'Waukegan',1,13),(250,'Champaign',1,13),(251,'Cicero',1,13),(252,'Bloomington',1,13),(253,'Arlington Heights',1,13),(254,'Evanston',1,13),(255,'Schaumburg',1,13),(256,'Bolingbrook',1,13),(257,'Decatur',1,13),(258,'Palatine',1,13),(259,'Skokie',1,13),(260,'Des Plaines',1,13),(261,'Indianapolis',1,14),(262,'Fort Wayne',1,14),(263,'Evansville',1,14),(264,'South Bend',1,14),(265,'Carmel',1,14),(266,'Fishers',1,14),(267,'Bloomington',1,14),(268,'Hammond',1,14),(269,'Gary',1,14),(270,'Lafayette',1,14),(271,'Muncie',1,14),(272,'Terre Haute',1,14),(273,'Noblesville',1,14),(274,'Kokomo',1,14),(275,'Greenwood',1,14),(276,'Anderson',1,14),(277,'Elkhart',1,14),(278,'Mishawaka',1,14),(279,'Lawrence',1,14),(280,'Jeffersonville',1,14),(281,'Des Moines',1,15),(282,'Cedar Rapids',1,15),(283,'Davenport',1,15),(284,'Sioux City',1,15),(285,'Iowa City',1,15),(286,'Waterloo',1,15),(287,'Ames',1,15),(288,'West Des Moines',1,15),(289,'Council Bluffs',1,15),(290,'Dubuque',1,15),(291,'Ankeny',1,15),(292,'Urbandale',1,15),(293,'Cedar Falls',1,15),(294,'Marion',1,15),(295,'Bettendorf',1,15),(296,'Marshalltown',1,15),(297,'Mason City',1,15),(298,'Clinton',1,15),(299,'Burlington',1,15),(300,'Fort Dodge',1,15),(301,'Wichita',1,16),(302,'Overland Park',1,16),(303,'Kansas City',1,16),(304,'Olathe',1,16),(305,'Topeka',1,16),(306,'Lawrence',1,16),(307,'Shawnee',1,16),(308,'Manhattan',1,16),(309,'Lenexa',1,16),(310,'Salina',1,16),(311,'Hutchinson',1,16),(312,'Leavenworth',1,16),(313,'Leawood',1,16),(314,'Dodge City',1,16),(315,'Garden City',1,16),(316,'Emporia',1,16),(317,'Junction City',1,16),(318,'Derby',1,16),(319,'Prairie Village',1,16),(320,'Hays',1,16),(321,'Louisville',1,17),(322,'Lexington-Fayette',1,17),(323,'Bowling Green',1,17),(324,'Owensboro',1,17),(325,'Covington',1,17),(326,'Richmond',1,17),(327,'Georgetown',1,17),(328,'Florence',1,17),(329,'Hopkinsville',1,17),(330,'Nicholasville',1,17),(331,'Elizabethtown',1,17),(332,'Henderson',1,17),(333,'Frankfort',1,17),(334,'Jeffersontown',1,17),(335,'Independence',1,17),(336,'Paducah',1,17),(337,'Radcliff',1,17),(338,'Ashland',1,17),(339,'Madisonville',1,17),(340,'Murray',1,17),(341,'New Orleans',1,18),(342,'Baton Rouge',1,18),(343,'Shreveport',1,18),(344,'Metairie',1,18),(345,'Lafayette',1,18),(346,'Lake Charles',1,18),(347,'Bossier City',1,18),(348,'Kenner',1,18),(349,'Monroe',1,18),(350,'Alexandria',1,18),(351,'Houma',1,18),(352,'Marrero',1,18),(353,'New Iberia',1,18),(354,'Prairieville',1,18),(355,'Laplace',1,18),(356,'Central',1,18),(357,'Slidell',1,18),(358,'Terrytown',1,18),(359,'Ruston',1,18),(360,'Chalmette',1,18),(361,'Portland',1,19),(362,'Lewiston',1,19),(363,'Bangor',1,19),(364,'South Portland',1,19),(365,'Auburn',1,19),(366,'Biddeford',1,19),(367,'Sanford',1,19),(368,'Brunswick',1,19),(369,'Scarborough',1,19),(370,'Saco',1,19),(371,'Augusta',1,19),(372,'Westbrook',1,19),(373,'Windham',1,19),(374,'Gorham',1,19),(375,'Waterville',1,19),(376,'York',1,19),(377,'Falmouth',1,19),(378,'Kennebunk',1,19),(379,'Orono',1,19),(380,'Standish',1,19),(381,'Baltimore',1,20),(382,'Columbia',1,20),(383,'Germantown',1,20),(384,'Silver Spring',1,20),(385,'Waldorf',1,20),(386,'Frederick',1,20),(387,'Glen Burnie',1,20),(388,'Ellicott City',1,20),(389,'Gaithersburg',1,20),(390,'Rockville',1,20),(391,'Dundalk',1,20),(392,'Bethesda',1,20),(393,'Bowie',1,20),(394,'Towson',1,20),(395,'Aspen Hill',1,20),(396,'Wheaton',1,20),(397,'North Bethesda',1,20),(398,'Severn',1,20),(399,'Bel Air South',1,20),(400,'Potomac',1,20),(401,'Boston',1,21),(402,'Worcester',1,21),(403,'Springfield',1,21),(404,'Lowell',1,21),(405,'Cambridge',1,21),(406,'Brockton',1,21),(407,'New Bedford',1,21),(408,'Quincy',1,21),(409,'Lynn',1,21),(410,'Newton',1,21),(411,'Fall River',1,21),(412,'Somerville',1,21),(413,'Lawrence',1,21),(414,'Framingham',1,21),(415,'Waltham',1,21),(416,'Haverhill',1,21),(417,'Malden',1,21),(418,'Brookline',1,21),(419,'Plymouth',1,21),(420,'Medford',1,21),(421,'Detroit',1,22),(422,'Grand Rapids',1,22),(423,'Warren',1,22),(424,'Sterling Heights',1,22),(425,'Ann Arbor',1,22),(426,'Lansing',1,22),(427,'Flint',1,22),(428,'Dearborn',1,22),(429,'Livonia',1,22),(430,'Troy',1,22),(431,'Westland',1,22),(432,'Farmington Hills',1,22),(433,'Kalamazoo',1,22),(434,'Wyoming',1,22),(435,'Rochester Hills',1,22),(436,'Southfield',1,22),(437,'Taylor',1,22),(438,'Pontiac',1,22),(439,'St. Clair Shores',1,22),(440,'Royal Oak',1,22),(441,'Minneapolis',1,23),(442,'St. Paul',1,23),(443,'Rochester',1,23),(444,'Bloomington',1,23),(445,'Duluth',1,23),(446,'Brooklyn Park',1,23),(447,'Plymouth',1,23),(448,'Maple Grove',1,23),(449,'Woodbury',1,23),(450,'St. Cloud',1,23),(451,'Eagan',1,23),(452,'Eden Prairie',1,23),(453,'Coon Rapids',1,23),(454,'Blaine',1,23),(455,'Burnsville',1,23),(456,'Lakeville',1,23),(457,'Minnetonka',1,23),(458,'Apple Valley',1,23),(459,'Edina',1,23),(460,'St. Louis Park',1,23),(461,'Jackson',1,24),(462,'Gulfport',1,24),(463,'Southaven',1,24),(464,'Hattiesburg',1,24),(465,'Biloxi',1,24),(466,'Meridian',1,24),(467,'Olive Branch',1,24),(468,'Tupelo',1,24),(469,'Greenville',1,24),(470,'Horn Lake',1,24),(471,'Pearl',1,24),(472,'Madison',1,24),(473,'Starkville',1,24),(474,'Clinton',1,24),(475,'Ridgeland',1,24),(476,'Brandon',1,24),(477,'Columbus',1,24),(478,'Vicksburg',1,24),(479,'Oxford',1,24),(480,'Pascagoula',1,24),(481,'Kansas City',1,25),(482,'St. Louis',1,25),(483,'Springfield',1,25),(484,'Columbia',1,25),(485,'Independence',1,25),(486,'Lee\'s Summit',1,25),(487,'O\'Fallon',1,25),(488,'St. Joseph',1,25),(489,'St. Charles',1,25),(490,'St. Peters',1,25),(491,'Blue Springs',1,25),(492,'Florissant',1,25),(493,'Joplin',1,25),(494,'Chesterfield',1,25),(495,'Jefferson City',1,25),(496,'Cape Girardeau',1,25),(497,'Oakville',1,25),(498,'Wildwood',1,25),(499,'Wentzville',1,25),(500,'University City',1,25),(501,'Billings',1,26),(502,'Missoula',1,26),(503,'Great Falls',1,26),(504,'Bozeman',1,26),(505,'Butte-Silver Bow',1,26),(506,'Helena',1,26),(507,'Kalispell',1,26),(508,'Havre',1,26),(509,'Anaconda-Deer Lodge',1,26),(510,'Miles City',1,26),(511,'Helena Valley West Centra',1,26),(512,'Belgrade',1,26),(513,'Lockwood',1,26),(514,'Helena Valley Southeast',1,26),(515,'Livingston',1,26),(516,'Whitefish',1,26),(517,'Evergreen',1,26),(518,'Laurel',1,26),(519,'Sidney',1,26),(520,'Lewistown',1,26),(521,'Omaha',1,27),(522,'Lincoln',1,27),(523,'Bellevues',1,27),(524,'Grand Island',1,27),(525,'Kearney',1,27),(526,'Fremont',1,27),(527,'Hastings',1,27),(528,'Norfolk',1,27),(529,'North Platte',1,27),(530,'Columbus',1,27),(531,'Papillion',1,27),(532,'La Vista',1,27),(533,'Scottsbluff',1,27),(534,'South Sioux City',1,27),(535,'Beatrice',1,27),(536,'Chalco',1,27),(537,'Lexington',1,27),(538,'Alliance',1,27),(539,'Gering',1,27),(540,'Blair',1,27),(541,'Las Vegas',1,28),(542,'Henderson',1,28),(543,'Reno',1,28),(544,'North Las Vegas',1,28),(545,'Paradise',1,28),(546,'Sunrise Manor',1,28),(547,'Spring Valley',1,28),(548,'Enterprise',1,28),(549,'Sparks',1,28),(550,'Carson City',1,28),(551,'Whitney',1,28),(552,'Pahrump',1,28),(553,'Winchester',1,28),(554,'Summerlin South',1,28),(555,'Elko',1,28),(556,'Sun Valley',1,28),(557,'Fernley',1,28),(558,'Mesquite',1,28),(559,'Spanish Springs',1,28),(560,'Boulder City',1,28),(561,'Manchester',1,29),(562,'Nashua',1,29),(563,'Concord',1,29),(564,'Derry',1,29),(565,'Dover',1,29),(566,'Rochester',1,29),(567,'Salem',1,29),(568,'Merrimack',1,29),(569,'Londonderry',1,29),(570,'Hudson',1,29),(571,'Keene',1,29),(572,'Bedford',1,29),(573,'Portsmouth',1,29),(574,'Goffstown',1,29),(575,'Durham',1,29),(576,'Laconia',1,29),(577,'Milford',1,29),(578,'Hampton',1,29),(579,'Exeter',1,29),(580,'Windham',1,29),(581,'Newark',1,30),(582,'Jersey City',1,30),(583,'Paterson',1,30),(584,'Elizabeth',1,30),(585,'Edison',1,30),(586,'Woodbridge',1,30),(587,'Lakewood',1,30),(588,'Toms River',1,30),(589,'Hamilton township',1,30),(590,'Clifton',1,30),(591,'Trenton',1,30),(592,'Camden',1,30),(593,'Brick',1,30),(594,'Cherry Hill',1,30),(595,'Passaic',1,30),(596,'Union City',1,30),(597,'Old Bridge',1,30),(598,'Bayonne',1,30),(599,'Franklin township',1,30),(600,'Middletown',1,30),(601,'Albuquerque',1,31),(602,'Las Cruces',1,31),(603,'Rio Rancho',1,31),(604,'Santa Fe',1,31),(605,'Roswell',1,31),(606,'Farmington',1,31),(607,'South Valley',1,31),(608,'Clovis',1,31),(609,'Hobbs',1,31),(610,'Alamogordo',1,31),(611,'Carlsbad',1,31),(612,'Gallup',1,31),(613,'Sunland Park',1,31),(614,'Los Lunas',1,31),(615,'Deming',1,31),(616,'Chaparral',1,31),(617,'Las Vegas',1,31),(618,'Artesia',1,31),(619,'Portales',1,31),(620,'Los Alamos',1,31),(621,'New York',1,32),(622,'Hempstead',1,32),(623,'Brookhaven',1,32),(624,'Islip',1,32),(625,'Oyster Bay',1,32),(626,'Buffalo',1,32),(627,'North Hempstead',1,32),(628,'Babylon',1,32),(629,'Rochester',1,32),(630,'Huntington',1,32),(631,'Yonkers',1,32),(632,'Syracuse',1,32),(633,'Ramapo',1,32),(634,'Amherst',1,32),(635,'Smithtown',1,32),(636,'Albany',1,32),(637,'Greece',1,32),(638,'Greenburgh',1,32),(639,'Cheektowaga',1,32),(640,'Clarkstown',1,32),(641,'Charlotte',1,33),(642,'Raleigh',1,33),(643,'Greensboro',1,33),(644,'Durham',1,33),(645,'Winston-Salem',1,33),(646,'Fayetteville',1,33),(647,'Cary',1,33),(648,'Wilmington',1,33),(649,'High Point',1,33),(650,'Greenville',1,33),(651,'Asheville',1,33),(652,'Concord',1,33),(653,'Gastonia',1,33),(654,'Jacksonville',1,33),(655,'Chapel Hill',1,33),(656,'Rocky Mount',1,33),(657,'Huntersville',1,33),(658,'Burlington',1,33),(659,'Wilson',1,33),(660,'Kannapolis',1,33),(661,'Fargo',1,34),(662,'Bismarck',1,34),(663,'Grand Forks',1,34),(664,'Minot',1,34),(665,'West Fargo',1,34),(666,'Williston',1,34),(667,'Dickinson',1,34),(668,'Mandan',1,34),(669,'Jamestown',1,34),(670,'Wahpeton',1,34),(671,'Devils Lake',1,34),(672,'Watford City',1,34),(673,'Valley City',1,34),(674,'Minot AFB',1,34),(675,'Grafton',1,34),(676,'Lincoln',1,34),(677,'Beulah',1,34),(678,'Rugby',1,34),(679,'Stanley',1,34),(680,'Grand Forks AFB',1,34),(681,'Columbus',1,35),(682,'Cleveland',1,35),(683,'Cincinnati',1,35),(684,'Toledo',1,35),(685,'Akron',1,35),(686,'Dayton',1,35),(687,'Parma',1,35),(688,'Canton',1,35),(689,'Youngstown',1,35),(690,'Lorain',1,35),(691,'Hamilton',1,35),(692,'Springfield',1,35),(693,'Kettering',1,35),(694,'Elyria',1,35),(695,'Lakewood',1,35),(696,'Cuyahoga Falls',1,35),(697,'Middletown',1,35),(698,'Newark',1,35),(699,'Euclid',1,35),(700,'Mentor',1,35),(701,'Oklahoma City',1,36),(702,'Tulsa',1,36),(703,'Norman',1,36),(704,'Broken Arrow',1,36),(705,'Lawton',1,36),(706,'Edmond',1,36),(707,'Moore',1,36),(708,'Midwest City',1,36),(709,'Enid',1,36),(710,'Stillwater',1,36),(711,'Muskogee',1,36),(712,'Bartlesville',1,36),(713,'Owasso',1,36),(714,'Shawnee',1,36),(715,'Yukon',1,36),(716,'Ardmore',1,36),(717,'Ponca City',1,36),(718,'Bixby',1,36),(719,'Duncan',1,36),(720,'Del City',1,36),(721,'Portland',1,37),(722,'Salem',1,37),(723,'Eugene',1,37),(724,'Gresham',1,37),(725,'Hillsboro',1,37),(726,'Beaverton',1,37),(727,'Bend',1,37),(728,'Medford',1,37),(729,'Springfield',1,37),(730,'Corvallis',1,37),(731,'Aloha',1,37),(732,'Albany',1,37),(733,'Tigard',1,37),(734,'Lake Oswego',1,37),(735,'Keizer',1,37),(736,'Grants Pass',1,37),(737,'Oregon City',1,37),(738,'McMinnville',1,37),(739,'Redmond',1,37),(740,'Tualatin',1,37),(741,'Philadelphia',1,38),(742,'Pittsburgh',1,38),(743,'Allentown',1,38),(744,'Erie',1,38),(745,'Reading city',1,38),(746,'Upper Darby',1,38),(747,'Scranton',1,38),(748,'Bensalem',1,38),(749,'Lancaster city',1,38),(750,'Lower Merion',1,38),(751,'Abington',1,38),(752,'Bethlehem city',1,38),(753,'Bristol township',1,38),(754,'Millcreek township',1,38),(755,'Harrisburg',1,38),(756,'Haverford',1,38),(757,'Lower Paxton',1,38),(758,'Middletown',1,38),(759,'Altoona',1,38),(760,'York',1,38),(761,'Providence',1,39),(762,'Warwick',1,39),(763,'Cranston',1,39),(764,'Pawtucket',1,39),(765,'East Providence',1,39),(766,'Woonsocket',1,39),(767,'Coventry',1,39),(768,'Cumberland',1,39),(769,'North Providence',1,39),(770,'South Kingstown',1,39),(771,'Johnston',1,39),(772,'West Warwick',1,39),(773,'North Kingstown',1,39),(774,'Newport',1,39),(775,'Westerly',1,39),(776,'Bristol',1,39),(777,'Lincoln',1,39),(778,'Smithfield',1,39),(779,'Central Falls',1,39),(780,'Portsmouth',1,39),(781,'Columbia',1,40),(782,'Charleston',1,40),(783,'North Charleston',1,40),(784,'Mount Pleasant',1,40),(785,'Rock Hill',1,40),(786,'Greenville',1,40),(787,'Summerville',1,40),(788,'Sumter',1,40),(789,'Goose Creek',1,40),(790,'Hilton Head Island',1,40),(791,'Florence',1,40),(792,'Spartanburg',1,40),(793,'Myrtle Beach',1,40),(794,'Aiken',1,40),(795,'Greer',1,40),(796,'Anderson',1,40),(797,'Mauldin',1,40),(798,'Greenwood',1,40),(799,'North Augusta',1,40),(800,'Taylors',1,40),(801,'Sioux Falls',1,41),(802,'Rapid City',1,41),(803,'Aberdeen',1,41),(804,'Brookings',1,41),(805,'Watertown',1,41),(806,'Mitchell',1,41),(807,'Yankton',1,41),(808,'Pierre',1,41),(809,'Huron',1,41),(810,'Spearfish',1,41),(811,'Vermillion',1,41),(812,'Brandon',1,41),(813,'Box Elder',1,41),(814,'Rapid Valley',1,41),(815,'Madison',1,41),(816,'Sturgis',1,41),(817,'Belle Fourche',1,41),(818,'Harrisburg',1,41),(819,'Tea',1,41),(820,'Dell Rapids',1,41),(821,'Nashville-Davidson',1,42),(822,'Memphis',1,42),(823,'Knoxville',1,42),(824,'Chattanooga',1,42),(825,'Clarksville',1,42),(826,'Murfreesboro',1,42),(827,'Franklin',1,42),(828,'Jackson',1,42),(829,'Johnson City',1,42),(830,'Bartlett',1,42),(831,'Hendersonville',1,42),(832,'Kingsport',1,42),(833,'Collierville',1,42),(834,'Smyrna',1,42),(835,'Cleveland',1,42),(836,'Brentwood',1,42),(837,'Germantown',1,42),(838,'Columbia',1,42),(839,'Spring Hill',1,42),(840,'La Vergne',1,42),(841,'Houston',1,43),(842,'San Antonio',1,43),(843,'Dallas',1,43),(844,'Austin',1,43),(845,'Fort Worth',1,43),(846,'El Paso',1,43),(847,'Arlington',1,43),(848,'Corpus Christi',1,43),(849,'Plano',1,43),(850,'Laredo',1,43),(851,'Lubbock',1,43),(852,'Garland',1,43),(853,'Irving',1,43),(854,'Amarillo',1,43),(855,'Grand Prairie',1,43),(856,'Brownsville',1,43),(857,'McKinney',1,43),(858,'Frisco',1,43),(859,'Pasadena',1,43),(860,'Mesquite',1,43),(861,'Salt Lake City',1,44),(862,'West Valley City',1,44),(863,'Provo',1,44),(864,'West Jordan',1,44),(865,'Orem',1,44),(866,'Sandy',1,44),(867,'Ogden',1,44),(868,'St. George',1,44),(869,'Layton',1,44),(870,'South Jordan',1,44),(871,'Taylorsville',1,44),(872,'Millcreek',1,44),(873,'Lehi',1,44),(874,'Logan',1,44),(875,'Murray',1,44),(876,'Draper',1,44),(877,'Bountiful',1,44),(878,'Riverton',1,44),(879,'Pleasant Grove',1,44),(880,'Roy',1,44),(881,'Burlington',1,45),(882,'Essex',1,45),(883,'South Burlington',1,45),(884,'Colchester',1,45),(885,'Rutland city',1,45),(886,'Bennington',1,45),(887,'Brattleboro',1,45),(888,'Milton',1,45),(889,'Essex Junction',1,45),(890,'Hartford',1,45),(891,'Williston',1,45),(892,'Springfield',1,45),(893,'Barre city',1,45),(894,'Middlebury',1,45),(895,'Barre',1,45),(896,'Shelburne',1,45),(897,'Montpelier',1,45),(898,'St. Johnsbury',1,45),(899,'Winooski',1,45),(900,'St. Albans city',1,45),(901,'Virginia Beach',1,46),(902,'Norfolk',1,46),(903,'Chesapeake',1,46),(904,'Arlington',1,46),(905,'Richmond',1,46),(906,'Newport News',1,46),(907,'Alexandria',1,46),(908,'Hampton',1,46),(909,'Roanoke',1,46),(910,'Portsmouth',1,46),(911,'Suffolk',1,46),(912,'Lynchburg',1,46),(913,'Centreville',1,46),(914,'Dale City',1,46),(915,'Reston',1,46),(916,'Harrisonburg',1,46),(917,'Leesburg',1,46),(918,'Ashburn',1,46),(919,'McLean',1,46),(920,'Tuckahoe',1,46),(921,'Seattle',1,47),(922,'Spokane',1,47),(923,'Tacoma',1,47),(924,'Vancouver',1,47),(925,'Bellevue',1,47),(926,'Kent',1,47),(927,'Everett',1,47),(928,'Renton',1,47),(929,'Federal Way',1,47),(930,'Spokane Valley',1,47),(931,'Yakima',1,47),(932,'Kirkland',1,47),(933,'Bellingham',1,47),(934,'Kennewick',1,47),(935,'Auburn',1,47),(936,'Pasco',1,47),(937,'Marysville',1,47),(938,'Redmond',1,47),(939,'Lakewood',1,47),(940,'South Hill',1,47),(941,'Charleston',1,48),(942,'Huntington',1,48),(943,'Parkersburg',1,48),(944,'Morgantown',1,48),(945,'Wheeling',1,48),(946,'Weirton',1,48),(947,'Fairmont',1,48),(948,'Martinsburg',1,48),(949,'Beckley',1,48),(950,'Clarksburg',1,48),(951,'Teays Valley',1,48),(952,'South Charleston',1,48),(953,'St. Albans',1,48),(954,'Vienna',1,48),(955,'Cross Lanes',1,48),(956,'Bluefield',1,48),(957,'Cheat Lake',1,48),(958,'Moundsville',1,48),(959,'Bridgeport',1,48),(960,'Oak Hilll',1,48),(961,'Milwaukee',1,49),(962,'Madison',1,49),(963,'Green Bay',1,49),(964,'Kenosha',1,49),(965,'Racine',1,49),(966,'Appleton',1,49),(967,'Waukesha',1,49),(968,'Eau Claire',1,49),(969,'Oshkosh',1,49),(970,'Janesville',1,49),(971,'West Allis',1,49),(972,'La Crosse',1,49),(973,'Sheboygan',1,49),(974,'Wauwatosa',1,49),(975,'Fond du Lac',1,49),(976,'New Berlin',1,49),(977,'Wausau',1,49),(978,'Brookfield',1,49),(979,'Greenfield',1,49),(980,'Beloit',1,49),(981,'Cheyenne',1,50),(982,'Casper',1,50),(983,'Gillette',1,50),(984,'Laramie',1,50),(985,'Rock Springs',1,50),(986,'Sheridan',1,50),(987,'Green River',1,50),(988,'Evanston',1,50),(989,'Riverton',1,50),(990,'Jackson',1,50),(991,'Cody',1,50),(992,'Rawlins',1,50),(993,'Lander',1,50),(994,'Torrington',1,50),(995,'Douglas',1,50),(996,'Powell',1,50),(997,'Ranchettes',1,50),(998,'Worland',1,50),(999,'Buffalo',1,50),(1000,'South Greeley',1,50);
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `countries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_countries_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (4,'Canada'),(2,'Italy'),(3,'Mexico'),(5,'United Kingdom'),(1,'USA');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurants`
--

DROP TABLE IF EXISTS `restaurants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `restaurants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  `city_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `state_id` int(11) DEFAULT NULL,
  `address` varchar(150) NOT NULL,
  `url` varchar(520) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `city_id` (`city_id`),
  KEY `country_id` (`country_id`),
  KEY `state_id` (`state_id`),
  KEY `ix_restaurants_name` (`name`),
  CONSTRAINT `restaurants_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`),
  CONSTRAINT `restaurants_ibfk_2` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`),
  CONSTRAINT `restaurants_ibfk_3` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurants`
--

LOCK TABLES `restaurants` WRITE;
/*!40000 ALTER TABLE `restaurants` DISABLE KEYS */;
/*!40000 ALTER TABLE `restaurants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reviews` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` varchar(280) NOT NULL,
  `user` varchar(30) NOT NULL,
  `restaurant_id` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `restaurant_id` (`restaurant_id`),
  CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `states`
--

DROP TABLE IF EXISTS `states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `states` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_states_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `states`
--

LOCK TABLES `states` WRITE;
/*!40000 ALTER TABLE `states` DISABLE KEYS */;
INSERT INTO `states` VALUES (1,'Alabama'),(2,'Alaska'),(3,'Arizona'),(4,'Arkansas'),(5,'California'),(6,'Colorado'),(7,'Connecticut'),(8,'Delaware'),(9,'Florida'),(10,'Georgia'),(11,'Hawaii'),(12,'Idaho'),(13,'Illinois'),(14,'Indiana'),(15,'Iowa'),(16,'Kansas'),(17,'Kentucky'),(18,'Louisiana'),(19,'Maine'),(20,'Maryland'),(21,'Massachusetts'),(22,'Michigan'),(23,'Minnesota'),(24,'Mississippi'),(25,'Missouri'),(26,'Montana'),(27,'Nebraska'),(28,'Nevada'),(29,'New Hampshire'),(30,'New Jersey'),(31,'New Mexico'),(32,'New York'),(33,'North Carolina'),(34,'North Dakota'),(35,'Ohio'),(36,'Oklahoma'),(37,'Oregon'),(38,'Pennsylvania'),(39,'Rhode Island'),(40,'South Carolina'),(41,'South Dakota'),(42,'Tennessee'),(43,'Texas'),(44,'Utah'),(45,'Vermont'),(46,'Virginia'),(47,'Washington'),(48,'West Virginia'),(49,'Wisconsin'),(50,'Wyoming');
/*!40000 ALTER TABLE `states` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-01-08  2:32:11

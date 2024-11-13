CREATE DATABASE  IF NOT EXISTS `news` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `news`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: news
-- ------------------------------------------------------
-- Server version	8.0.35

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
-- Table structure for table `articles`
--

DROP TABLE IF EXISTS `articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `articles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `author_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('revision','borrador','publicado') COLLATE utf8mb4_unicode_ci NOT NULL,
  `headline` tinyint DEFAULT '0',
  `creation_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `publish_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `category_id` int NOT NULL,
  `creator_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_category_id` (`category_id`),
  KEY `fk_creator_id` (`creator_id`) /*!80000 INVISIBLE */,
  CONSTRAINT `fk_category_id` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  CONSTRAINT `fk_creator_id` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articles`
--

LOCK TABLES `articles` WRITE;
/*!40000 ALTER TABLE `articles` DISABLE KEYS */;
INSERT INTO `articles` VALUES (28,'Marisa Gutiérrez','Prueba update modificación','Prueba update','Prueba update','','borrador',1,'2023-01-15 09:30:00','2023-01-20 12:00:00',18,7),(29,'Marisa Gutiérrez','IA en la medicina moderna','Avances y aplicaciones de la IA en la salud','La Inteligencia Artificial ha revolucionado la medicina moderna...','','borrador',1,'2023-02-10 11:45:00','2023-02-15 10:00:00',4,7),(30,'Laura García','Viajes inolvidables por Asia','Descubre los destinos más increíbles de Asia','Asia es un continente lleno de historia, cultura y paisajes impresionantes...','','revision',1,'2023-03-05 14:20:00','2023-03-10 08:30:00',5,9),(31,'Laura García','El impacto del cambio climático','Consecuencias y medidas frente al cambio climático','El cambio climático es una realidad que afecta a nuestro planeta en diferentes formas...','','revision',1,'2023-04-20 10:00:00','2023-04-25 15:45:00',3,9),(32,'Pedro Martínez','La influencia de la música en el cerebro','Efectos y beneficios de la música en nuestro cerebro','La música tiene un impacto significativo en nuestras emociones y comportamientos...','','publicado',0,'2023-05-30 08:55:00','2023-06-05 09:30:00',2,10),(34,'Marisa Gutiérrez','Globalización ','Globalización ','<p>La globalización es un fenómeno complejo que ha transformado radicalmente la interacción entre países. Desde la Revolución Industrial hasta la era de la información, este proceso ha sido impulsado por avances tecnológicos, flujos comerciales y la interconexión de culturas. En la actualidad, la globalización se manifiesta en diversos aspectos, desde la economía hasta la cultura, redefiniendo la forma en que el mundo funciona y las naciones interactúan entre sí.</p>','','borrador',0,'2023-12-11 17:49:30','2023-12-11 17:49:30',41,NULL),(35,'Marisa Gutiérrez','Nominaciones Globos de Oro 2024','J. A. Bayona competirá en mejor película de habla no inglesa','<p>Para España la alegría de la mañana ha llegado con la nominación de <a href=\"https://elpais.com/cultura/cine/2023-09-10/la-sociedad-de-la-nieve-de-j-a-bayona-convence-en-el-cierre-del-festival-de-venecia.html\" rel=\"noopener noreferrer\" target=\"_blank\"><em>La sociedad de la nieve</em>, la película de J. A. Bayona </a>producida por Netflix que llegará a los cines el 15 de diciembre y a la plataforma el 4 de enero, en la categoría de mejor película de habla no inglesa. Con una poderosa campaña de promoción en Hollywood, donde ya ha habido varios pases de la película sobre el desastre de aviación en Los Andes y encuentros con el director, actores y con los supervivientes. Con este primer paso, la de Bayona también se presenta como firme candidata a los Oscar, tanto a película internacional como en premios técnicos, categorías que no existen en los Globos de Oro. En estos galardones competirá contra <em>Anatomía de una caída </em>(francesa; que también entra en la categoría principal de mejor película de drama y en actriz protagonista de drama con Sandra Hüller)<em>, Vidas pasadas </em>(EE UU, en inglés y coreano; también están nominadas su directora, Celine Song, y su actriz principal, Greta Lee), <em>La zona de interés </em>(EE UU-Reino Unido, en alemán y polaco), <em>Fallen Leaves </em>(Finlandia) y contra<em> Yo, capitán </em>(Italia).</p>','','borrador',0,'2023-12-11 22:59:37','2023-12-11 22:59:37',2,7),(36,'Marisa Gutiérrez','Bob Dylan en Japón','El mítico y controvertido LP en directo ‘At Budokan’ reaparece 45 años más tarde en su versión íntegra, con dos horas y media de grabaciones inéditas hasta ahora','<p>El mítico y controvertido LP en directo ‘At Budokan’ reaparece 45 años más tarde en su versión íntegra, con dos horas y media de grabaciones inéditas hasta ahora. El dylanismo es una religión casi inabarcable que sale extraordinariamente cara, pero al menos aporta numerosos argumentos para creer en la salvación.</p>','','publicado',0,'2023-12-11 23:15:38','2023-12-11 23:15:38',2,7),(37,'Marisa Gutiérrez','Erri de Luca traza un Nápoles sin belleza','El escritor italiano retrata en ‘Napátrida’ un fresco de su ciudad sin monumentos ni iglesias, con olor a polvo de yeso y una vida densa de “cuidados intensivos”','<p>El escritor italiano retrata en ‘Napátrida’ un fresco de su ciudad sin monumentos ni iglesias, con olor a polvo de yeso y una vida densa de “cuidados intensivos”. Hay ciudades tan literarias que, aunque no las visitemos, las conocemos como un territorio propio, íntimo y familiar, porque la literatura y el cine han hecho tanto por ellos que ninguna agencia de viajes podrá jamás superar la oferta de la evocación.</p>','','borrador',0,'2023-12-11 23:22:49','2023-12-11 23:22:49',2,7),(38,'Marisa Gutiérrez','¿Se podrá igualar la inteligencia humana?','Las posibilidades de la inteligencia artificial hoy son tan extraordinarias como impredecibles y no dejan de retar a las biológicas Inteligencia artificial','<p>El desarrollo y las nuevas posibilidades que nos ofrece cada día <a href=\"https://elpais.com/noticias/inteligencia-artificial/\" rel=\"noopener noreferrer\" target=\"_blank\">la inteligencia artificial</a> no dejan de sorprendernos. Entre lo más relevante hoy para <a href=\"https://www.google.com/search?q=materia+gris+el+pais&amp;rlz=1C1GCEA_enES1073ES1074&amp;oq=materia+gri&amp;gs_lcrp=EgZjaHJvbWUqDggAEEUYJxg7GIAEGIoFMg4IABBFGCcYOxiABBiKBTIGCAEQRRhAMgYIAhBFGDkyCggDEAAYsQMYgAQyDAgEEAAYFBiHAhiABDIHCAUQABiABDIGCAYQRRg8MgYIBxBFGDzSAQgxODI4ajBqNKgCALACAA&amp;sourceid=chrome&amp;ie=UTF-8\" rel=\"noopener noreferrer\" target=\"_blank\"><em>Materia gris</em></a><em> </em>podemos destacar la creación de algoritmos capaces de rastrear neuroimágenes y datos genéticos y fisiológicos de numerosos individuos de los que extraer marcadores biológicos capaces de predecir con acierto el curso de enfermedades neurológicas y mentales <a href=\"https://doi.org/10.1038/d41586-023-03482-9\" rel=\"noopener noreferrer\" target=\"_blank\">como la del alzhéimer</a>. Sin duda, es algo que puede ayudar a concebir o perfeccionar tratamientos para combatir la neurodegeneración o su progreso.</p>','','publicado',0,'2023-12-11 23:36:59','2023-12-11 23:36:59',4,7),(48,'Paco Rabán','Las pensiones no contributivas subirán un 6,9% y las de viudedad crecerán un 14,1% en 2024','Elma Saiz anuncia que el Ingreso Mínimo Vital se revalorizará un 6,9% el próximo año','<p>Las pensiones no contributivas subirán un 6,9% el próximo año, según ha desvelado <a href=\"https://elpais.com/espana/2023-11-20/elma-saiz-una-nueva-ministra-de-seguridad-social-y-politicas-migratorias-con-gran-disposicion-al-dialogo.html\" rel=\"noopener noreferrer\" target=\"_blank\">la ministra de Seguridad Social, Elma Saiz</a>, este martes, a través de la red social X (antigua Twitter). Las pensiones <a href=\"https://elpais.com/noticias/pensiones/\" rel=\"noopener noreferrer\" target=\"_blank\">de viudedad</a> con cargas familiares se incrementarán un 14,1% en 2024, lo que representa una subida de 127 euros al mes. Así, esta prestación pasará de los 12.682 euros anuales en 14 pagas (906 euros al mes) actuales a 14.457 euros (1.033 euros mensuales) el próximo ejercicio. Estas pensiones —que cuentan con las cuantías más bajas de todo el catálogo asistencial— no serán las únicas que se modifiquen al alza el año que viene. Las mínimas también crecerán entre un 5% y un 7%, mientras que el Ingreso Mínimo Vital (IMV) se revalorizará un 6,9%. Las pensiones contributivas, las que perciben la mayoría de los jubilados, subirán un 3,8%, que es la tasa de crecimiento de la inflación media entre los meses de diciembre de 2022 y noviembre de 2023.</p>','','publicado',0,'2023-12-12 15:45:57','2023-12-12 15:45:57',5,11),(49,'Pedro Martínez','\'Robot Dreams\', de Pablo Berger, premio a la mejor película de animación europea','El filme español coproducido con Francia ha sido distinguido por la la Academia del Cine Europeo.','<p>El filme español <a href=\"https://www.publico.es/culturas/pablo-berger-abre-cofre-emociones-robot-dreams.html#analytics-noticia:contenido-enlace\" rel=\"noopener noreferrer\" target=\"_blank\"><em>Robot Dreams</em>, de Pablo Berger</a>, coproducido con Francia, fue distinguido este sábado en Berlín con el premio a la mejor película de animación de la Academia del Cine Europeo (EFA).</p><p>Berger agradeció a la academia el premio y recordó las palabras del \"gran\" Guillermo del Toro según el cual<strong> \"la animación no es un género\".</strong> \"No voy a parar hasta que la industria nos trate como iguales\", dijo, y dedicó el galardón a \"la creativa y vibrante industria del cine de animación española\".</p><p>Recordó que esta es su cuarta película, pero la primera de animación, y aseguró que <strong>no será la última</strong>, al tiempo que animó a todos los creadores a explorar las \"interminables\" oportunidades de este cine. Aseguró que no estaría donde está, sobre el escenario, sin sus productores, dijo sentirse \"muy feliz\" y afirmó que \"la sonrisa en la cara\" no se le borrará en mucho tiempo.</p>','','publicado',0,'2023-12-12 19:54:58','2023-12-12 19:54:58',2,10),(50,'Marisa Gutiérrez','Los Veintisiete acuerdan su posición sobre la Ley para una Industria de Cero Emisiones Netas','La propuesta final de la norma empezará a ser negociada la semana que viene con la Eurocámara ','<p>Los Estados de la UE han logrado este jueves en Bruselas aprobar su posición negociadora sobre la propuesta de Ley para una Industria Cero Emisiones Netas (NZIA, por sus siglas en inglés), lo que permitirá comenzar rápidamente —la semana próxima— las negociaciones finales con la Eurocámara para acordar un texto legislativo común. Con este reglamento, Bruselas busca impulsar la competitividad de la industria europea frente a <a href=\"https://elpais.com/internacional/2022-08-12/biden-logra-la-aprobacion-definitiva-del-congreso-para-su-ley-economica-estrella.html\" rel=\"noopener noreferrer\" target=\"_blank\">la política de subsidios verdes de la Ley de Reducción de la Inflación (IRA) de Estados Unidos</a>.</p><p>“La nueva norma es fundamental para reforzar la autonomía estratégica de Europa, nos encamina en el objetivo de la reindustrialización y nos ayuda a avanzar en la transición energética para estar a la vanguardia de la neutralidad climática”, ha celebrado el ministro de Industria y Turismo, Jordi Hereu, al término del Consejo de Competitividad en el que se ha dado el visto bueno al texto propuesto para la normativa que, según el español, favorecerá también a las pequeñas y medianas empresas, que podrán “participar y beneficiarse de las políticas verdes” europeas.</p>','','publicado',0,'2023-12-13 23:27:41','2023-12-13 23:27:41',37,7),(55,'Marisa Gutiérrez','Único para la aceptación del slug','Prueba','La cocina sueca es conocida por su diversidad y sabores intensos...','unico-para-la-aceptacion-del-slug','borrador',0,'2023-12-15 10:43:51','2023-12-15 10:43:51',5,17);
/*!40000 ALTER TABLE `articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `articles_has_images`
--

DROP TABLE IF EXISTS `articles_has_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `articles_has_images` (
  `id` int NOT NULL AUTO_INCREMENT,
  `image_id` int NOT NULL,
  `article_id` int NOT NULL,
  `caption` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_article_id` (`article_id`),
  KEY `fk_image_id` (`image_id`),
  CONSTRAINT `fk_article_id` FOREIGN KEY (`article_id`) REFERENCES `articles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_image_id` FOREIGN KEY (`image_id`) REFERENCES `images` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articles_has_images`
--

LOCK TABLES `articles_has_images` WRITE;
/*!40000 ALTER TABLE `articles_has_images` DISABLE KEYS */;
INSERT INTO `articles_has_images` VALUES (1,1,28,'Pie de foto 1.'),(2,2,29,'Pie de foto 2.'),(3,3,30,'Pie de foto 3.'),(4,4,31,'Pie de foto 4.'),(5,5,32,'Pie de foto 5.'),(6,6,34,'Pie de foto 6.'),(7,7,35,'Pie de foto 7.'),(8,8,36,'Pie de foto 8.'),(9,9,37,'Pie de foto 9.'),(10,10,38,'Pie de foto 10.'),(11,14,38,'Pie de foto prueba'),(12,20,48,'La ministra de Seguridad Social, Elma Saiz, este martes durante una entrevista con la agencia Efe, en Madrid.'),(13,21,49,'Una imagen de la película \'Robot Dreams\'.'),(14,22,50,'Granja eólica en Villafranca del Cid, Castellón.'),(18,26,55,'Prueba caption');
/*!40000 ALTER TABLE `articles_has_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  CONSTRAINT `fk_parent_id` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Internacional','Noticias globales',NULL),(2,'Cultura','Arte y entretenimiento',NULL),(3,'Ciencia y Medioambiente','Temas científicos y ecológicos',NULL),(4,'Tecnología','Avances tecnológicos',NULL),(5,'Estilos de vida','Aspectos cotidianos y personales',NULL),(6,'Economía','Gestión de recursos y actividades financieras',NULL),(7,'Política','Cuestiones de gobierno y gestión social',NULL),(8,'Opinión','Interpretaciones subjetivas de realidad',NULL),(9,'Sociedad','Exploración de dinámicas sociales',NULL),(10,'Deportes','Análisis de eventos deportivos',NULL),(11,'Europa','Internacional',1),(12,'América','Internacional',1),(13,'Asia','Internacional',1),(14,'África','Internacional',1),(15,'Oceanía','Internacional',1),(16,'Mercados','Economía',6),(17,'Bolsa','Economía',6),(18,'Negocios','Economía',6),(19,'Vivienda','Economía',6),(20,'Actualidad','Política',7),(21,'Elecciones','Política',7),(22,'Programas','Política',7),(23,'Encuestas','Política',7),(24,'Editoriales','Opinión',8),(25,'Columnas','Opinión',8),(26,'Cartas a la dirección','Opinión',8),(27,'Cine','Cultura',2),(28,'Música','Cultura',2),(29,'Teatro','Cultura',2),(30,'Videojuegos','Cultura',2),(31,'Literatura','Cultura',2),(32,'Educación','Sociedad',9),(33,'Igualdad','Sociedad',9),(34,'Consumo','Sociedad',9),(35,'Religión','Sociedad',9),(36,'Sucesos','Sociedad',9),(37,'Cambio climático','Ciencia y medioambiente',3),(38,'Meteorología','Ciencia y medioambiente',3),(39,'Medicina','Ciencia y medioambiente',3),(40,'Biología','Ciencia y medioambiente',3),(41,'Medioambiente','Ciencia y medioambiente',3),(42,'Física, química y matemáticas','Ciencia y medioambiente',3),(43,'Inteligencia artificial','Tecnología',4),(44,'Ciberseguridad','Tecnología',4),(45,'Apps y dispositivos','Tecnología',4),(46,'Empresas e innovación','Tecnología',4),(47,'Fútbol','Deportes',10),(48,'Baloncesto','Deportes',10),(49,'Motor','Deportes',10),(50,'Ciclismo','Deportes',10),(51,'Natación','Deportes',10),(52,'Tenis','Deportes',10),(53,'Juegos Olímpicos','Deportes',10),(54,'Otros deportes','Deportes',10),(55,'Gente','Estilos de vida',5),(56,'Gastronomía','Estilos de vida',5),(57,'Moda','Estilos de vida',5),(58,'Viajes','Estilos de vida',5),(59,'Hábitos saludables','Estilos de vida',5);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `images` (
  `id` int NOT NULL AUTO_INCREMENT,
  `url` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `source` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
INSERT INTO `images` VALUES (1,'prueba_update','prueba_update'),(2,'https://estaticos-cdn.prensaiberica.es/clip/21097915-85cd-483c-907a-3ee8d586be88_21-9-aspect-ratio_default_0_x710y479.jpg','Sitio Ejemplo 2'),(3,'https://img2.rtve.es/i/?w=1600&i=1701527614883.jpg','Sitio Ejemplo 3'),(4,'https://image.ondacero.es/clipping/cmsimages01/2022/04/07/2DB72682-A4F7-4A74-9F53-3994E6D7C270/sanchez-feijoo-saludan-antes-reunion-moncloa_98.jpg?crop=1080,608,x0,y0&width=1900&height=1069&optimize=high&format=webply','Sitio Ejemplo 4'),(5,'https://imagenes.elpais.com/resizer/2NybCuCQBkH-BhPUNKp8fmxKjJI=/1200x0/filters:focal(1743x616:1753x626)/cloudfront-eu-central-1.images.arcpublishing.com/prisa/DQSNIF2YCBGPRESBY4RSX6M36Y.jpg','Sitio Ejemplo 5'),(6,'https://www.monedaunica.net/wp-content/uploads/2020/12/recuperacion-de-la-globalizacion.jpg','Moneda Única'),(7,'https://www.publico.es/uploads/2023/12/11/65772cc52a50b.jpeg','El País'),(8,'https://imagenes.elpais.com/resizer/IQRwsQCnDLh6KR0IYguhs3O0UZg=/1200x0/filters:focal(2100x765:2110x775)/cloudfront-eu-central-1.images.arcpublishing.com/prisa/WYVJRLMGXJCX3ORURW2KKYDV2I.jpg','Koh Hasebe/Shinko Music (Getty Images)'),(9,'https://imagenes.elpais.com/resizer/DGd9uGxyAjmUi8isWWT01qfLC9E=/1200x0/cloudfront-eu-central-1.images.arcpublishing.com/prisa/MBQ2XJ4X4ZCJPNFV2UUH5DIBFU.jpg','Lorenzo Pesce'),(10,'https://imagenes.elpais.com/resizer/CrRov443-NesxPBdBiSTteTOK0Q=/1200x0/filters:focal(4016x2215:4026x2225)/cloudfront-eu-central-1.images.arcpublishing.com/prisa/XES3FIFULBHYPMHG4T6UKX7CXA.jpg','KanawatTH (Getty Images/iStockphoto)'),(11,'https://imagenes.elpais.com/resizer/8fx2_TRefQ9uYIkidHOHTbLwFbk=/1200x0/filters:focal(2713x2115:2723x2125)/cloudfront-eu-central-1.images.arcpublishing.com/prisa/PWMCWO7252G4D3NMJLNKMD32FA.jpg','J.J. Guillén (EFE)'),(12,'https://imagenes.elpais.com/resizer/8fx2_TRefQ9uYIkidHOHTbLwFbk=/1200x0/filters:focal(2713x2115:2723x2125)/cloudfront-eu-central-1.images.arcpublishing.com/prisa/PWMCWO7252G4D3NMJLNKMD32FA.jpg','J.J. Guillén (EFE)'),(13,'https://imagenes.elpais.com/resizer/8fx2_TRefQ9uYIkidHOHTbLwFbk=/1200x0/filters:focal(2713x2115:2723x2125)/cloudfront-eu-central-1.images.arcpublishing.com/prisa/PWMCWO7252G4D3NMJLNKMD32FA.jpg','J.J. Guillén (EFE)'),(14,'https://imagenes.elpais.com/resizer/8fx2_TRefQ9uYIkidHOHTbLwFbk=/1200x0/filters:focal(2713x2115:2723x2125)/cloudfront-eu-central-1.images.arcpublishing.com/prisa/PWMCWO7252G4D3NMJLNKMD32FA.jpg','J.J. Guillén (EFE)'),(20,'https://imagenes.elpais.com/resizer/8fx2_TRefQ9uYIkidHOHTbLwFbk=/1200x0/filters:focal(2713x2115:2723x2125)/cloudfront-eu-central-1.images.arcpublishing.com/prisa/PWMCWO7252G4D3NMJLNKMD32FA.jpg','J.J. Guillén (EFE)'),(21,'https://www.publico.es/files/article_main//files/crop/uploads/2023/11/27/6564df27dd627.r_1702156096958.0-0-1014-674.jpeg','ARCADIA MOTION PICTURES'),(22,'https://imagenes.elpais.com/resizer/CoeWqr--mRZXqsWkzdQNOkzeYak=/980x0/cloudfront-eu-central-1.images.arcpublishing.com/prisa/M3JN5BFADJBHXL5BWHHFB7437I.jpg','Ángel García (Bloomberg)'),(23,'https://imagenes.elpais.com/resizer/eEvaEiuvNHBc2fKkJSw7QWO2eCw=/828x466/cloudfront-eu-central-1.images.arcpublishing.com/prisa/6YEZNVCW2FFVVHB4W5E6JNED6A.jpg','El País'),(24,'https://imagenes.elpais.com/resizer/lyZyULv7RFaubggIHI8YHUReZbQ=/828x466/filters:focal(1349x645:1359x655)/cloudfront-eu-central-1.images.arcpublishing.com/prisa/TXQGXAE2HBCBZI2J4TS7IS2DWI.jpg','El País'),(25,'https://imagenes.elpais.com/resizer/lyZyULv7RFaubggIHI8YHUReZbQ=/828x466/filters:focal(1349x645:1359x655)/cloudfront-eu-central-1.images.arcpublishing.com/prisa/TXQGXAE2HBCBZI2J4TS7IS2DWI.jpg','El País'),(26,'https://imagenes.elpais.com/resizer/lyZyULv7RFaubggIHI8YHUReZbQ=/828x466/filters:focal(1349x645:1359x655)/cloudfront-eu-central-1.images.arcpublishing.com/prisa/TXQGXAE2HBCBZI2J4TS7IS2DWI.jpg','El País'),(27,'https://imagenes.elpais.com/resizer/fSAAPySQUXRYixji7__3v1MY7QE=/1200x0/filters:focal(3694x540:3704x550)/cloudfront-eu-central-1.images.arcpublishing.com/prisa/IZJQPXGJUVH6NJKOKVMJF5KVAY.jpg','Villar López (EFE)'),(28,'imagen','fuente'),(29,'imagen','fuente'),(30,'imagen','fuente'),(31,'imagen','fuente');
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(70) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('editor','redactor') COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_of_birth` date NOT NULL,
  `phone` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (6,'Juan Perez','juanpe','juan@guirre.com','$2a$08$/xJl73jtmDoChyX62VPiKusFb1HZdfvPd2pe9BryWvn.HFiSetMwC','editor','1990-05-13','1234567890','https://this-person-does-not-exist.com/img/avatar-genf0296200420ff19c87f2600f1baa087e.jpg'),(7,'Marisa Gutiérrez','marisagu','marisa@guirre.com','12345','redactor','1985-07-24','1234532890','https://this-person-does-not-exist.com/img/avatar-gen1128e20f4adfbda8503c1b5788910a3e.jpg'),(8,'Carlos Rodríguez','carlosrod','carlosrod@guirre.com','$2a$08$8iJZuNtWIgRiZVipyPJsnuiYJUsHpFE82T12hlf2.eiaU5g1mfoDS','editor','1989-02-14','7854532890','https://this-person-does-not-exist.com/img/avatar-gen111a3a9182f84c1cb5336a5313b25602.jpg'),(9,'Laura García','lauragar','lauragar@guirre.com','$2a$08$8MU4TaZv332HfHB9C548JeZmuLkdgX2N16OiQ5rqgbhIWGstP3EXe','redactor','1982-10-05','7836832890','https://this-person-does-not-exist.com/img/avatar-gen110cde1a4796cbfd8e6fd4ff40a58186.jpg'),(10,'Pedro Martínez','pedromar','pedromar@guirre.com','$2a$08$9ZjbCs.tyjR8qHa32z1R7Ooz0J/4z8mFh4EUks9SREdN7c3zGtofO','redactor','1984-10-10','1256832890','https://this-person-does-not-exist.com/img/avatar-gen5aad6e3fa8058f69ed085f8c981e2184.jpg'),(11,'Paco Rabán','pacorra','pacorra@guirre.com','$2a$08$nb5Xx3crP2.l5wpE.MLwkeIHMF.6Np3vYK4clL9F/EMu1dPGkLaHa','redactor','1987-10-27','7856832890',NULL),(12,'Valeria Ros','valeros','valeros@guirre.com','$2a$08$PhYF1wzxfPANzB8/tpamv.Km3HSFYLhHym5bSPf8ZF40Ate83Jw5S','redactor','1994-12-12','654652651',NULL),(13,'Valentino Neutro','valeneu','valeneu@guirre.com','$2a$08$dDlt5AmaJamX1/3g6Gx3suRT.2j4/m76UlgwNpNfWRz1RR0GtA3H6','redactor','1986-10-15','658412514',NULL),(14,'Antonio Angular','angular16','angular@guirre.com','$2a$08$Vcl3JwrHwJRjck3A7fg8..S4z8L5Ofa5Arl8jsfYqTwNGbZ85bGcq','redactor','1966-02-24','654985214',NULL),(15,'Mercedes Cano','merceditas','mercecano','$2a$08$sllhgmGFwKim2836aj70kuar.KTpQFidAgPOud6YS/5FcQBUT2842','redactor','1962-11-08','958746215',NULL),(17,'Marisa Gutiérrez','marisagut','marisagu@guirre.com','$2a$08$Xd.nDbmELYEKq6VaPDprie8sYBIvxit0dxqPtbg1mKwdRVq1Xj4H2','redactor','1985-07-24','1234532890',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_has_articles`
--

DROP TABLE IF EXISTS `users_has_articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_has_articles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `articles_id` int NOT NULL,
  `assignment_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `finish_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `comments` tinytext COLLATE utf8mb4_unicode_ci,
  `actual_status` enum('revision','borrador','publicado') COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_id` (`user_id`) /*!80000 INVISIBLE */,
  KEY `fk_articles_id` (`articles_id`),
  CONSTRAINT `fk_articles_id` FOREIGN KEY (`articles_id`) REFERENCES `articles` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_has_articles`
--

LOCK TABLES `users_has_articles` WRITE;
/*!40000 ALTER TABLE `users_has_articles` DISABLE KEYS */;
INSERT INTO `users_has_articles` VALUES (1,7,28,'2023-02-10 08:30:00','2023-02-25 08:30:00','Comentario prueba.','borrador'),(2,9,31,'2023-01-15 08:30:00','2023-01-17 08:30:00','Comentario prueba.','borrador'),(3,6,31,'2023-01-17 08:30:00','2023-01-19 08:30:00','Comentario prueba.','revision'),(4,6,31,'2023-01-19 08:30:00','2023-01-19 08:30:00','Comentario prueba.','publicado'),(5,8,32,'2023-01-04 08:30:00','2023-01-10 08:30:00','Comentario prueba.','publicado'),(6,7,29,'2023-01-25 08:30:00','2023-03-20 08:30:00','Comentario prueba.','borrador'),(7,8,30,'2023-01-15 08:30:00','2023-01-18 08:30:00','Comentario prueba.','revision'),(8,7,34,'2023-12-11 19:00:00','2023-12-12 19:00:00','Comentario prueba.','borrador'),(9,7,35,'2023-12-11 19:00:00','2023-12-12 19:00:00','Comentario prueba.','borrador'),(10,7,36,'2023-12-11 19:00:00','2023-12-12 19:00:00','Comentario prueba.','borrador'),(11,7,37,'2023-12-11 19:00:00','2023-12-12 19:00:00','Comentario prueba.','borrador'),(12,7,38,'2023-12-11 19:00:00','2023-12-12 19:00:00','Comentario prueba.','borrador'),(13,7,50,'2023-12-13 22:27:41','2023-12-13 22:27:41',NULL,'borrador'),(14,6,28,'2023-12-14 14:17:05','2023-12-14 14:17:05',NULL,'borrador'),(15,8,28,'2023-12-14 14:19:57','2023-12-14 14:19:57',NULL,'borrador'),(16,6,28,'2023-12-14 14:20:52','2023-12-14 14:20:52','Comentario desde el formulario. Asigno a Juan.','borrador'),(17,6,31,'2023-12-14 16:15:52','2023-12-14 16:15:52','Asigno a Juan','borrador'),(18,8,31,'2023-12-14 16:19:31','2023-12-14 16:19:31','Asigno a Carlos.','borrador'),(19,8,31,'2023-12-14 16:20:13','2023-12-14 16:20:13','Asigno a Carlos.','revision'),(20,9,32,'2023-12-14 16:24:07','2023-12-14 16:24:07','Listo para publicar.','publicado'),(21,8,32,'2023-12-14 16:28:19','2023-12-14 16:28:19',NULL,'publicado'),(25,17,55,'2023-12-15 09:43:51','2023-12-15 09:43:51',NULL,'borrador');
/*!40000 ALTER TABLE `users_has_articles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-15 11:01:04

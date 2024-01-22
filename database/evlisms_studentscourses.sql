-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: evlisms
-- ------------------------------------------------------
-- Server version	8.2.0

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
-- Table structure for table `studentscourses`
--

DROP TABLE IF EXISTS `studentscourses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `studentscourses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `duration` int DEFAULT NULL,
  `startdate` date DEFAULT NULL,
  `enddate` date DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `details` json DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `students_studentsid` int DEFAULT NULL,
  `courses_coursesid` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `studentscourses_courses_coursesid_students_studentsid_unique` (`students_studentsid`,`courses_coursesid`),
  KEY `courses_coursesid` (`courses_coursesid`),
  CONSTRAINT `studentscourses_ibfk_1` FOREIGN KEY (`students_studentsid`) REFERENCES `students` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `studentscourses_ibfk_2` FOREIGN KEY (`courses_coursesid`) REFERENCES `courses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studentscourses`
--

LOCK TABLES `studentscourses` WRITE;
/*!40000 ALTER TABLE `studentscourses` DISABLE KEYS */;
INSERT INTO `studentscourses` VALUES (1,'d6afa82d-10c3-4856-9393-49b8006e48c5',1,'2024-01-08','2024-02-02',134,'[{\"uuid\": 89.60398936864199, \"price\": 133.6, \"regir\": 33.4, \"priceid\": 13, \"coursesid\": 13, \"finaldate\": \"2024-02-02\", \"startdate\": \"2024-01-08\", \"laduration\": \"1\", \"lecurrency\": \"USD\", \"lecoursename\": \"INTENSIVE GENERAL ENGLISH \", \"lesubcoursename\": \"INTENSIVE GENERAL ENGLISH - 1 MONTH\", \"registrationname\": \"Registration Fee\", \"coursedescription\": \"INTENSIVE GENERAL ENGLISH - 1 MONTH\"}]','2024-01-16 00:37:09','2024-01-16 00:37:09',1,13);
/*!40000 ALTER TABLE `studentscourses` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-17  5:44:27

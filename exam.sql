-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 192.168.44.200    Database: exam
-- ------------------------------------------------------
-- Server version	5.7.18-0ubuntu0.16.04.1

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
-- Table structure for table `tbl_exam_choice`
--

DROP TABLE IF EXISTS `tbl_exam_choice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_exam_choice` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) DEFAULT NULL,
  `correct` tinyint(4) DEFAULT NULL,
  `subject_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FKA24982C03F8D0CE4` (`subject_id`),
  CONSTRAINT `FKA24982C03F8D0CE4` FOREIGN KEY (`subject_id`) REFERENCES `tbl_exam_subject` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_exam_choice`
--

LOCK TABLES `tbl_exam_choice` WRITE;
/*!40000 ALTER TABLE `tbl_exam_choice` DISABLE KEYS */;
INSERT INTO `tbl_exam_choice` VALUES (1,'byte',0,3),(2,'short',0,3),(3,'int',0,3),(4,'long',1,3),(5,'脚本语言',1,4),(6,'解释性语言',1,4),(7,'顺序执行',1,4),(8,'编译语言',0,4),(9,'1',11,1),(10,'2',2,2),(11,'1',1,133),(12,'zxx',1,134);
/*!40000 ALTER TABLE `tbl_exam_choice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_exam_epartment`
--

DROP TABLE IF EXISTS `tbl_exam_epartment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_exam_epartment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_exam_epartment`
--

LOCK TABLES `tbl_exam_epartment` WRITE;
/*!40000 ALTER TABLE `tbl_exam_epartment` DISABLE KEYS */;
INSERT INTO `tbl_exam_epartment` VALUES (1,'WebUI'),(2,'JavaEE'),(3,'大数据'),(4,'Android'),(5,'PHP'),(6,'IOS');
/*!40000 ALTER TABLE `tbl_exam_epartment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_exam_paper`
--

DROP TABLE IF EXISTS `tbl_exam_paper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_exam_paper` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `answerQuestionTime` double DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `totalPoints` int(11) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `department_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK92534C8DF2C32590` (`department_id`),
  KEY `FK92534C8D5CC62F70` (`user_id`),
  CONSTRAINT `FK92534C8D5CC62F70` FOREIGN KEY (`user_id`) REFERENCES `tbl_exam_user` (`id`),
  CONSTRAINT `FK92534C8DF2C32590` FOREIGN KEY (`department_id`) REFERENCES `tbl_exam_epartment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_exam_paper`
--

LOCK TABLES `tbl_exam_paper` WRITE;
/*!40000 ALTER TABLE `tbl_exam_paper` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_exam_paper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_exam_papersubject`
--

DROP TABLE IF EXISTS `tbl_exam_papersubject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_exam_papersubject` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `score` int(11) DEFAULT NULL,
  `examPaper_id` bigint(20) DEFAULT NULL,
  `subject_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK5B4F3FFF3F8D0CE4` (`subject_id`),
  KEY `FK5B4F3FFF9D52EAA4` (`examPaper_id`),
  CONSTRAINT `FK5B4F3FFF3F8D0CE4` FOREIGN KEY (`subject_id`) REFERENCES `tbl_exam_subject` (`id`),
  CONSTRAINT `FK5B4F3FFF9D52EAA4` FOREIGN KEY (`examPaper_id`) REFERENCES `tbl_exam_paper` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_exam_papersubject`
--

LOCK TABLES `tbl_exam_papersubject` WRITE;
/*!40000 ALTER TABLE `tbl_exam_papersubject` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_exam_papersubject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_exam_subject`
--

DROP TABLE IF EXISTS `tbl_exam_subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_exam_subject` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `analysis` varchar(255) DEFAULT NULL,
  `answer` varchar(255) DEFAULT NULL,
  `checkState` varchar(255) DEFAULT NULL,
  `stem` varchar(255) DEFAULT NULL,
  `uploadTime` datetime DEFAULT NULL,
  `department_id` bigint(20) DEFAULT NULL,
  `subjectLevel_id` bigint(20) DEFAULT NULL,
  `subjectType_id` bigint(20) DEFAULT NULL,
  `topic_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FKAC2D3EDD9E4D9C4` (`subjectType_id`),
  KEY `FKAC2D3EDF2C32590` (`department_id`),
  KEY `FKAC2D3ED5CC62F70` (`user_id`),
  KEY `FKAC2D3EDB797230` (`subjectLevel_id`),
  KEY `FKAC2D3ED12BE0C84` (`topic_id`),
  CONSTRAINT `FKAC2D3ED12BE0C84` FOREIGN KEY (`topic_id`) REFERENCES `tbl_exam_topic` (`id`),
  CONSTRAINT `FKAC2D3ED5CC62F70` FOREIGN KEY (`user_id`) REFERENCES `tbl_exam_user` (`id`),
  CONSTRAINT `FKAC2D3EDB797230` FOREIGN KEY (`subjectLevel_id`) REFERENCES `tbl_exam_subjectlevel` (`id`),
  CONSTRAINT `FKAC2D3EDD9E4D9C4` FOREIGN KEY (`subjectType_id`) REFERENCES `tbl_exam_subjecttype` (`id`),
  CONSTRAINT `FKAC2D3EDF2C32590` FOREIGN KEY (`department_id`) REFERENCES `tbl_exam_epartment` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_exam_subject`
--

LOCK TABLES `tbl_exam_subject` WRITE;
/*!40000 ALTER TABLE `tbl_exam_subject` DISABLE KEYS */;
INSERT INTO `tbl_exam_subject` VALUES (1,'8种基本数据类型','byte,short,int,long,float,double,char,boolean','审核通过','Java中的基本数据类型有哪些','2017-01-13 09:24:52',1,1,3,1,NULL),(2,'长整型占8个字节','','未通过','下面哪种数据类型占8个字节','2017-01-13 09:31:51',2,1,1,6,NULL),(3,'8种数据类型','byte,short,int,long,float,double,char,boolean','审核通过','java中数据类型有哪些','2017-10-10 00:00:00',1,1,1,1,NULL),(4,'4种','脚本语言,顺序执行,解释性语言,编译语言','审核通过','javascript语言具有什么特点？','2017-10-10 00:00:00',1,1,2,1,NULL),(5,'miaoshu描述','111,222,333,444','审核通过','题目信息',NULL,1,1,1,1,NULL),(6,'11','11','审核通过','11',NULL,1,1,1,1,NULL),(98,'','[\"1\",\"1\",\"1\",\"1\"]','未审核','',NULL,1,1,1,1,NULL),(99,'','[\"1\",\"1\",\"1\",\"1\"]','未审核','',NULL,1,1,1,1,NULL),(100,'','[\"1\",\"1\",\"1\",\"1\"]','未审核','',NULL,1,1,1,1,NULL),(101,'','[\"1\",\"2\",\"333\",\"4\"]','未审核','',NULL,1,1,1,1,NULL),(102,'','[\"a\",\"b\",\"c\",\"d\"]','未审核','',NULL,1,1,1,1,NULL),(103,'','[\"a\",\"b\",\"c\",\"d\"]','未审核','',NULL,1,1,1,1,NULL),(104,'','[\"z\",\"x\",\"c\",\"v\"]','未审核','',NULL,1,1,1,1,NULL),(105,'','[\"1\",\"1\",\"1\",\"1\"]','未审核','',NULL,1,1,1,1,NULL),(106,'','[\"1\",\"1\",\"1\",\"1\"]','未审核','',NULL,1,1,1,1,NULL),(107,'','[\"1\",\"2\",\"3\",\"4\"]','未审核','',NULL,1,1,1,1,NULL),(108,'','[\"1\",\"2\",\"3\",\"4\"]','未审核','',NULL,1,1,1,1,NULL),(109,'','[\"1\",\"1\",\"1\",\"1\"]','未审核','',NULL,1,1,1,1,NULL),(110,'','[\"1\",\"1\",\"1\",\"1\"]','未审核','',NULL,1,1,1,1,NULL),(111,'','[\"z\",\"z\",\"x\",\"z\"]','未审核','',NULL,1,1,1,1,NULL),(112,'','[\"z\",\"z\",\"x\",\"z\"]','未审核','',NULL,1,1,1,1,NULL),(113,'','[\"mm\",\"bb\",\"jj\",\"kk\"]','未审核','',NULL,1,1,1,1,NULL),(114,'','[\"mm\",\"bb\",\"jj\",\"kk\"]','未审核','',NULL,1,1,1,1,NULL),(115,'','[\"\",\"\",\"\",\"\"]','未审核','',NULL,1,1,1,1,NULL),(116,'','[\"\",\"\",\"\",\"\"]','未审核','',NULL,1,1,1,1,NULL),(117,'','[\"xx\",\"bb\",\"nn\",\"vv\"]','未审核','',NULL,1,1,1,1,NULL),(118,'','[\"xx\",\"bb\",\"nn\",\"vv\"]','未审核','',NULL,1,1,1,1,NULL),(119,'','[\"xx\",\"bb\",\"nn\",\"vv\"]','未审核','',NULL,1,1,1,1,NULL),(120,'','[\"zzz\",\"   擦擦擦\",\"  嘻嘻嘻\",\"顶顶顶顶\"]','未审核','',NULL,1,1,1,1,NULL),(121,'','[\"zzz\",\"   擦擦擦\",\"  嘻嘻嘻\",\"顶顶顶顶\"]','未审核','',NULL,1,1,1,1,NULL),(122,'','[\"1\",\"2\",\"4\",\"3\"]','未审核','',NULL,1,1,1,1,NULL),(123,'','[\"1\",\"1\",\"1\",\"1\"]','未审核','',NULL,1,1,1,1,NULL),(124,'','[\"1\",\"1\",\"1\",\"1\"]','未审核','',NULL,1,1,1,1,NULL),(125,'','[\"1\",\"1\",\"1\",\"1\"]','未审核','',NULL,1,1,1,1,NULL),(126,'','[\"1\",\"c\",\"v\",\"b\"]','未审核','',NULL,1,1,1,1,NULL),(127,'','[\"n\",\"b\",\"j\",\"k\"]','未审核','',NULL,1,1,1,1,NULL),(128,'','[\"v\",\"g\",\"t\",\"e\"]','未审核','',NULL,1,1,1,1,NULL),(129,'','[\"v\",\"g\",\"t\",\"e\"]','未审核','',NULL,1,1,1,1,NULL),(130,'','[\"1\",\"1\",\"1\",\"1\"]','未审核','',NULL,1,1,1,1,NULL),(131,'','[\"1\",\"1\",\"1\",\"1\"]','未审核','',NULL,1,1,1,1,NULL),(132,'','[\"1\",\"1\",\"1\",\"1\"]','未审核','',NULL,1,1,1,1,NULL),(133,'','[\"1\",\"1\",\"1\",\"1\"]','未审核','',NULL,1,1,1,1,NULL),(134,'zxx','[\"zxx\",\"zxx\",\"zxx\",\"zxx\"]','未审核','zxx',NULL,1,1,1,1,NULL);
/*!40000 ALTER TABLE `tbl_exam_subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_exam_subjectlevel`
--

DROP TABLE IF EXISTS `tbl_exam_subjectlevel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_exam_subjectlevel` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `realName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_exam_subjectlevel`
--

LOCK TABLES `tbl_exam_subjectlevel` WRITE;
/*!40000 ALTER TABLE `tbl_exam_subjectlevel` DISABLE KEYS */;
INSERT INTO `tbl_exam_subjectlevel` VALUES (1,'easy','简单'),(2,'medium','中等'),(3,'difficult','难');
/*!40000 ALTER TABLE `tbl_exam_subjectlevel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_exam_subjecttype`
--

DROP TABLE IF EXISTS `tbl_exam_subjecttype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_exam_subjecttype` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `realName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_exam_subjecttype`
--

LOCK TABLES `tbl_exam_subjecttype` WRITE;
/*!40000 ALTER TABLE `tbl_exam_subjecttype` DISABLE KEYS */;
INSERT INTO `tbl_exam_subjecttype` VALUES (1,'radio','单选题'),(2,'check','复选题'),(3,'question','简答题');
/*!40000 ALTER TABLE `tbl_exam_subjecttype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_exam_topic`
--

DROP TABLE IF EXISTS `tbl_exam_topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_exam_topic` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `department_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK92920830F2C32590` (`department_id`),
  CONSTRAINT `FK92920830F2C32590` FOREIGN KEY (`department_id`) REFERENCES `tbl_exam_epartment` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_exam_topic`
--

LOCK TABLES `tbl_exam_topic` WRITE;
/*!40000 ALTER TABLE `tbl_exam_topic` DISABLE KEYS */;
INSERT INTO `tbl_exam_topic` VALUES (1,'HTML',1),(2,'JavaScript',1),(3,'CSS',1),(4,'jQuery',1),(5,'Bootstrap',1),(6,'CoreJava',2),(7,'XML',2),(8,'Servlet/JSP',2);
/*!40000 ALTER TABLE `tbl_exam_topic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_exam_user`
--

DROP TABLE IF EXISTS `tbl_exam_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_exam_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `age` int(11) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `department_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK7857CCAAF2C32590` (`department_id`),
  CONSTRAINT `FK7857CCAAF2C32590` FOREIGN KEY (`department_id`) REFERENCES `tbl_exam_epartment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_exam_user`
--

LOCK TABLES `tbl_exam_user` WRITE;
/*!40000 ALTER TABLE `tbl_exam_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_exam_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'exam'
--

--
-- Dumping routines for database 'exam'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-27 18:51:05

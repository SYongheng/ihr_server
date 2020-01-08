-- MySQL dump 10.13  Distrib 5.5.40, for Win64 (x86)
--
-- Host: localhost    Database: ihr
-- ------------------------------------------------------
-- Server version	5.5.40

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
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '部门编号',
  `name` varchar(32) DEFAULT NULL COMMENT '部门名称',
  `parentId` int(11) DEFAULT NULL COMMENT '父部门编号',
  `depPath` varchar(255) DEFAULT NULL COMMENT '部门路径',
  `enabled` tinyint(1) DEFAULT '1' COMMENT '启用状态',
  `isParent` tinyint(1) DEFAULT '0' COMMENT '是否存在子部门',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'股东会',-1,'.1',1,1),(2,'董事会',1,'.1.2',1,0),(3,'总办',1,'.1.3',1,1),(4,'研发部',3,'.1.3.4',1,0),(5,'测试部',3,'.1.3.5',1,0),(6,'设计部',3,'.1.3.6',1,0),(7,'策划部',3,'.1.3.7',1,0),(8,'运营部',3,'.1.3.8',1,0),(9,'编辑部',3,'.1.3.9',1,0),(10,'市场部',3,'.1.3.10',1,0),(11,'客服部',3,'.1.3.11',1,0),(12,'离职',1,'.1.12',1,0);
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '员工编号',
  `name` varchar(10) DEFAULT NULL COMMENT '员工姓名',
  `gender` char(4) DEFAULT NULL COMMENT '性别',
  `birthday` date DEFAULT NULL COMMENT '出生日期',
  `idCard` char(18) DEFAULT NULL COMMENT '身份证号',
  `wedlock` enum('已婚','未婚','离异') DEFAULT NULL COMMENT '婚姻状况',
  `nationId` int(8) DEFAULT NULL COMMENT '民族',
  `nativePlace` varchar(20) DEFAULT NULL COMMENT '籍贯',
  `politicId` int(8) DEFAULT NULL COMMENT '政治面貌编号',
  `email` varchar(20) DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(11) DEFAULT NULL COMMENT '电话号码',
  `address` varchar(64) DEFAULT NULL COMMENT '联系地址',
  `departmentId` int(11) DEFAULT NULL COMMENT '部门编号',
  `jobLevelId` int(11) DEFAULT NULL COMMENT '职称编号',
  `posId` int(11) DEFAULT NULL COMMENT '职位编号',
  `engageForm` enum('劳动合同','劳务合同') DEFAULT NULL COMMENT '聘用形式',
  `tiptopDegree` enum('博士','硕士','本科','大专','高中','初中','小学','其他') DEFAULT NULL COMMENT '最高学历',
  `specialty` varchar(32) DEFAULT NULL COMMENT '所属专业',
  `school` varchar(32) DEFAULT NULL COMMENT '毕业院校',
  `beginDate` date DEFAULT NULL COMMENT '入职日期',
  `workState` enum('在职','离职') DEFAULT '在职' COMMENT '在职状态',
  `workID` char(8) DEFAULT NULL COMMENT '工号',
  `contractTerm` double DEFAULT NULL COMMENT '合同期限',
  `conversionTime` date DEFAULT NULL COMMENT '转正日期',
  `notWorkDate` date DEFAULT NULL COMMENT '离职日期',
  `beginContract` date DEFAULT NULL COMMENT '合同起始日期',
  `endContract` date DEFAULT NULL COMMENT '合同终止日期',
  `workAge` int(11) DEFAULT NULL COMMENT '工龄',
  PRIMARY KEY (`id`),
  KEY `departmentId` (`departmentId`),
  KEY `jobId` (`jobLevelId`),
  KEY `dutyId` (`posId`),
  KEY `nationId` (`nationId`),
  KEY `politicId` (`politicId`),
  KEY `workID_key` (`workID`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`departmentId`) REFERENCES `department` (`id`),
  CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`jobLevelId`) REFERENCES `joblevel` (`id`),
  CONSTRAINT `employee_ibfk_3` FOREIGN KEY (`posId`) REFERENCES `position` (`id`),
  CONSTRAINT `employee_ibfk_4` FOREIGN KEY (`nationId`) REFERENCES `nation` (`id`),
  CONSTRAINT `employee_ibfk_5` FOREIGN KEY (`politicId`) REFERENCES `politicsstatus` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'林俊杰','男','1990-01-01','610122199001011256','已婚',1,'广东深圳',1,'laowang@qq.com','18565558897','广东省深圳市南山区',5,2,11,'劳务合同','本科','信息管理与信息系统','深圳大学','2018-01-01','在职','00000001',2,'2018-04-01',NULL,'2018-01-01','2020-01-01',NULL),(2,'田馥甄','女','1989-02-01','421288198902011234','已婚',1,'海南海口',1,'chenjing@qq.com','18795556693','海南省海口市美兰区',4,4,10,'劳动合同','高中','市场营销','武汉大学','2015-06-09','在职','00000002',3,'2015-09-10',NULL,'2015-06-09','2018-06-08',NULL),(3,'吴亦凡','男','1993-03-04','610122199303041456','未婚',1,'陕西西安',1,'zhao@qq.com','15698887795','陕西省西安市莲湖区',6,6,4,'劳动合同','博士','电子工程','哈尔滨理工大学','2018-01-01','在职','00000003',3.5,'2018-04-01',NULL,'2018-01-01','2021-07-14',NULL),(4,'张艺兴','男','1990-01-03','610122199001031456','已婚',1,'陕西西安',3,'zhao@qq.com','15612347795','陕西省西安市莲湖区',4,1,10,'劳动合同','高中','电子工程','哈尔滨理工大学','2018-01-01','在职','00000004',3.5,'2018-04-01',NULL,'2018-01-01','2021-07-14',NULL),(5,'詹宗汉','男','1991-02-05','610122199102058952','已婚',1,'广东茂名',3,'yaosen@qq.com','14785559936','广东省茂名市电白区',4,1,10,'劳动合同','硕士','室内装修设计','西北大学','2017-01-02','在职','00000005',7,'2017-04-02',NULL,'2017-01-02','2024-01-17',NULL),(6,'云星','女','1993-01-05','610122199301054789','已婚',1,'陕西西安',3,'yunxing@qq.com','15644442252','陕西西安新城区',4,6,10,'劳务合同','硕士','通信工程','西安电子科技学校','2018-01-01','在职','00000006',5.25,'2018-04-01',NULL,'2018-01-01','2023-04-13',NULL),(7,'崔洪铭','男','1993-11-11','610122199311111234','已婚',1,'广东茂名',3,'jiaxuming@qq.com','15644441234','广东省茂名市电白区',4,1,10,'劳务合同','初中','通信工程','西北大学','2018-01-01','在职','00000007',5.25,'2018-04-01',NULL,'2018-01-01','2023-04-13',NULL),(8,'苏用恒','男','1991-02-01','610144199102014569','已婚',1,'广东湛江',3,'zhangliming@qq.com','18979994478','广东省湛江市遂溪县',4,1,10,'劳动合同','本科','软件工程','东莞理工学院','2018-01-01','在职','00000008',7,'2018-04-01',NULL,'2018-01-01','2025-01-30',NULL),(9,'林泽荣','男','1992-07-01','610144199207017895','已婚',1,'广东汕头',3,'xuelei@qq.com','15648887741','广东省汕头市',4,1,10,'劳动合同','本科','软件工程','东莞理工学院','2018-01-01','在职','00000009',6,'2018-04-01',NULL,'2018-01-01','2024-01-17',NULL),(10,'张洁','女','1990-10-09','420177199010093652','未婚',1,'海南美兰',1,'zhangjie@qq.com','13695557742','海口市美兰区',4,5,10,'劳动合同','本科','软件工程','东莞理工学院','2018-01-01','在职','00000010',1,'2018-01-31',NULL,'2018-01-01','2019-01-01',NULL),(11,'田亮','男','1990-01-01','610122199001011256','已婚',1,'广东深圳',1,'laowang@qq.com','18565558897','广东省深圳市南山区',4,1,10,'劳务合同','本科','信息管理与信息系统','深圳大学','2018-01-01','在职','00000011',2,'2018-04-01',NULL,'2018-01-01','2020-01-01',NULL),(12,'邓紫棋','女','1989-02-01','421288198902011234','已婚',1,'海南海口',1,'chenjing@qq.com','18795556693','海南省海口市美兰区',5,2,11,'劳动合同','高中','市场营销','武汉大学','2015-06-09','在职','00000012',3,'2015-09-10',NULL,'2015-06-09','2018-06-08',NULL),(13,'马飞','男','1993-03-04','610122199303041456','未婚',1,'陕西西安',1,'zhao@qq.com','15698887795','陕西省西安市莲湖区',5,2,11,'劳动合同','博士','电子工程','哈尔滨理工大学','2018-01-01','在职','00000013',3.5,'2018-04-01',NULL,'2018-01-01','2021-07-14',NULL),(14,'周杰伦','男','1990-01-03','610122199001031456','已婚',1,'陕西西安',3,'zhao@qq.com','15612347795','陕西省西安市莲湖区',5,2,11,'劳动合同','高中','电子工程','哈尔滨理工大学','2018-01-01','在职','00000014',3.5,'2018-04-01',NULL,'2018-01-01','2021-07-14',NULL),(15,'周一面','男','1991-02-05','610122199102058952','已婚',1,'广东茂名',3,'yaosen@qq.com','14785559936','广东省茂名市电白区',5,2,11,'劳动合同','硕士','室内装修设计','西北大学','2017-01-02','在职','00000015',7,'2017-04-02',NULL,'2017-01-02','2024-01-17',NULL),(16,'陈乐一','女','1993-01-05','610122199301054789','已婚',1,'陕西西安',3,'yunxing@qq.com','15644442252','陕西西安新城区',5,2,11,'劳务合同','硕士','通信工程','西安电子科技学校','2018-01-01','在职','00000016',5.25,'2018-04-01',NULL,'2018-01-01','2023-04-13',NULL),(17,'陈冠希','男','1993-11-11','610122199311111234','已婚',1,'广东茂名',3,'jiaxuming@qq.com','15644441234','广东省茂名市电白区',5,2,11,'劳务合同','初中','通信工程','西北大学','2018-01-01','在职','00000017',5.25,'2018-04-01',NULL,'2018-01-01','2023-04-13',NULL),(18,'周兴中','男','1991-02-01','610144199102014569','已婚',1,'广东湛江',3,'zhangliming@qq.com','18979994478','广东省湛江市遂溪县',5,2,11,'劳动合同','本科','软件工程','东莞理工学院','2018-01-01','在职','00000018',7,'2018-04-01',NULL,'2018-01-01','2025-01-30',NULL),(19,'许观毅','男','1992-07-01','610144199207017895','已婚',1,'广东汕头',3,'xuelei@qq.com','15648887741','广东省汕头市',5,2,11,'劳动合同','本科','软件工程','东莞理工学院','2018-01-01','在职','00000019',6,'2018-04-01',NULL,'2018-01-01','2024-01-17',NULL),(20,'陈莲','女','1990-10-09','420177199010093652','未婚',1,'海南美兰',1,'zhangjie@qq.com','13695557742','海口市美兰区',5,2,11,'劳动合同','本科','软件工程','东莞理工学院','2018-01-01','在职','00000020',1,'2018-01-31',NULL,'2018-01-01','2019-01-01',NULL),(21,'马宏宇','男','1990-01-01','610122199001011256','已婚',1,'广东深圳',1,'laowang@qq.com','18565558897','广东省深圳市南山区',6,3,12,'劳务合同','本科','信息管理与信息系统','深圳大学','2018-01-01','在职','00000021',2,'2018-04-01',NULL,'2018-01-01','2020-01-01',NULL),(22,'邓紫棋','女','1989-02-01','421288198902011234','已婚',1,'海南海口',1,'chenjing@qq.com','18795556693','海南省海口市美兰区',6,3,12,'劳动合同','高中','市场营销','武汉大学','2015-06-09','在职','00000022',3,'2015-09-10',NULL,'2015-06-09','2018-06-08',NULL),(23,'黄强辉','男','1993-03-04','610122199303041456','未婚',1,'陕西西安',1,'zhao@qq.com','15698887795','陕西省西安市莲湖区',4,2,2,'劳动合同','博士','电子工程','哈尔滨理工大学','2018-01-01','在职','00000023',3.5,'2018-04-01',NULL,'2018-01-01','2021-07-14',NULL),(24,'卢本伟','男','1990-01-03','610122199001031456','已婚',1,'陕西西安',3,'zhao@qq.com','15612347795','陕西省西安市莲湖区',6,3,12,'劳动合同','高中','电子工程','哈尔滨理工大学','2018-01-01','在职','00000024',3.5,'2018-04-01',NULL,'2018-01-01','2021-07-14',NULL),(25,'皮西蒙','男','1991-02-05','610122199102058952','已婚',1,'广东茂名',3,'yaosen@qq.com','14785559936','广东省茂名市电白区',6,3,12,'劳动合同','硕士','室内装修设计','西北大学','2017-01-02','在职','00000025',7,'2017-04-02',NULL,'2017-01-02','2024-01-17',NULL),(26,'赵丽颖','女','1993-01-05','610122199301054789','已婚',1,'陕西西安',3,'yunxing@qq.com','15644442252','陕西西安新城区',6,3,12,'劳务合同','硕士','通信工程','西安电子科技学校','2018-01-01','在职','00000026',5.25,'2018-04-01',NULL,'2018-01-01','2023-04-13',NULL),(27,'周鸿祎','男','1993-11-11','610122199311111234','已婚',1,'广东茂名',3,'jiaxuming@qq.com','15644441234','广东省茂名市电白区',6,3,12,'劳务合同','初中','通信工程','西北大学','2018-01-01','在职','00000027',5.25,'2018-04-01',NULL,'2018-01-01','2023-04-13',NULL),(28,'马化腾','男','1991-02-01','610144199102014569','已婚',1,'广东湛江',3,'zhangliming@qq.com','18979994478','广东省湛江市遂溪县',6,3,12,'劳动合同','本科','软件工程','东莞理工学院','2018-01-01','在职','00000028',7,'2018-04-01',NULL,'2018-01-01','2025-01-30',NULL),(29,'高尚德','男','1992-07-01','610144199207017895','已婚',1,'广东汕头',3,'xuelei@qq.com','15648887741','广东省汕头市',6,3,12,'劳动合同','本科','软件工程','东莞理工学院','2018-01-01','在职','00000029',6,'2018-04-01',NULL,'2018-01-01','2024-01-17',NULL),(30,'孙慧','女','1990-10-09','420177199010093652','未婚',1,'海南美兰',1,'zhangjie@qq.com','13695557742','海口市美兰区',6,3,12,'劳动合同','本科','软件工程','东莞理工学院','2018-01-01','在职','00000030',1,'2018-01-31',NULL,'2018-01-01','2019-01-01',NULL),(31,'张志远','男','1990-01-01','610122199001011256','已婚',1,'广东深圳',1,'laowang@qq.com','18565558897','广东省深圳市南山区',7,5,13,'劳务合同','本科','信息管理与信息系统','深圳大学','2018-01-01','在职','00000031',2,'2018-04-01',NULL,'2018-01-01','2020-01-01',NULL),(32,'王祖贤','女','1989-02-01','421288198902011234','已婚',1,'海南海口',1,'chenjing@qq.com','18795556693','海南省海口市美兰区',7,5,13,'劳动合同','高中','市场营销','武汉大学','2015-06-09','在职','00000032',3,'2015-09-10',NULL,'2015-06-09','2018-06-08',NULL),(33,'吕文达','男','1993-03-04','610122199303041456','未婚',1,'陕西西安',1,'zhao@qq.com','15698887795','陕西省西安市莲湖区',7,5,13,'劳动合同','博士','电子工程','哈尔滨理工大学','2018-01-01','在职','00000033',3.5,'2018-04-01',NULL,'2018-01-01','2021-07-14',NULL),(34,'罗元发','男','1990-01-03','610122199001031456','已婚',1,'陕西西安',3,'zhao@qq.com','15612347795','陕西省西安市莲湖区',7,5,13,'劳动合同','高中','电子工程','哈尔滨理工大学','2018-01-01','在职','00000034',3.5,'2018-04-01',NULL,'2018-01-01','2021-07-14',NULL),(35,'李开富','男','1991-02-05','610122199102058952','已婚',1,'广东茂名',3,'yaosen@qq.com','14785559936','广东省茂名市电白区',7,5,13,'劳动合同','硕士','室内装修设计','西北大学','2017-01-02','在职','00000035',7,'2017-04-02',NULL,'2017-01-02','2024-01-17',NULL),(36,'李兰','女','1993-01-05','610122199301054789','已婚',1,'陕西西安',3,'yunxing@qq.com','15644442252','陕西西安新城区',7,5,13,'劳务合同','硕士','通信工程','西安电子科技学校','2018-01-01','在职','00000036',5.25,'2018-04-01',NULL,'2018-01-01','2023-04-13',NULL),(37,'李厚福','男','1993-11-11','610122199311111234','已婚',1,'广东茂名',3,'jiaxuming@qq.com','15644441234','广东省茂名市电白区',7,5,13,'劳务合同','初中','通信工程','西北大学','2018-01-01','在职','00000037',5.25,'2018-04-01',NULL,'2018-01-01','2023-04-13',NULL),(38,'刘造时','男','1991-02-01','610144199102014569','已婚',1,'广东湛江',3,'zhangliming@qq.com','18979994478','广东省湛江市遂溪县',7,5,13,'劳动合同','本科','软件工程','东莞理工学院','2018-01-01','在职','00000038',7,'2018-04-01',NULL,'2018-01-01','2025-01-30',NULL),(39,'刘长胜','男','1992-07-01','610144199207017895','已婚',1,'广东汕头',3,'xuelei@qq.com','15648887741','广东省汕头市',7,5,13,'劳动合同','本科','软件工程','东莞理工学院','2018-01-01','在职','00000039',6,'2018-04-01',NULL,'2018-01-01','2024-01-17',NULL),(40,'孙蕙','女','1990-10-09','420177199010093652','未婚',1,'海南美兰',1,'zhangjie@qq.com','13695557742','海口市美兰区',7,5,13,'劳动合同','本科','软件工程','东莞理工学院','2018-01-01','在职','00000040',1,'2018-01-31',NULL,'2018-01-01','2019-01-01',NULL),(41,'周卓浩','男','1990-01-01','610122199001011256','已婚',1,'广东深圳',1,'laowang@qq.com','18565558897','广东省深圳市南山区',8,6,14,'劳务合同','本科','信息管理与信息系统','深圳大学','2018-01-01','在职','00000041',2,'2018-04-01',NULL,'2018-01-01','2020-01-01',NULL),(42,'林青霞','女','1989-02-01','421288198902011234','已婚',1,'海南海口',1,'chenjing@qq.com','18795556693','海南省海口市美兰区',8,6,14,'劳动合同','高中','市场营销','武汉大学','2015-06-09','在职','00000042',3,'2015-09-10',NULL,'2015-06-09','2020-08-01',NULL),(43,'周星驰','男','1993-03-04','610122199303041456','未婚',1,'陕西西安',1,'zhao@qq.com','15698887795','陕西省西安市莲湖区',8,6,14,'劳动合同','博士','电子工程','哈尔滨理工大学','2018-01-01','在职','00000043',3.5,'2018-04-01',NULL,'2018-01-01','2021-07-14',NULL),(44,'何颖升','男','1990-01-03','610122199001031456','已婚',1,'陕西西安',3,'zhao@qq.com','15612347795','陕西省西安市莲湖区',8,6,14,'劳动合同','高中','电子工程','哈尔滨理工大学','2018-01-01','在职','00000044',3.5,'2018-04-01',NULL,'2018-01-01','2021-07-14',NULL),(45,'宁古薄','男','1991-02-05','610122199102058952','已婚',1,'广东茂名',3,'yaosen@qq.com','14785559936','广东省茂名市电白区',8,6,14,'劳动合同','硕士','室内装修设计','西北大学','2017-01-02','在职','00000045',7,'2017-04-02',NULL,'2017-01-02','2024-01-17',NULL),(46,'池慕营','女','1993-01-05','610122199301054789','已婚',1,'陕西西安',3,'yunxing@qq.com','15644442252','陕西西安新城区',8,6,14,'劳务合同','硕士','通信工程','西安电子科技学校','2018-01-01','在职','00000046',5.25,'2018-04-01',NULL,'2018-01-01','2023-04-13',NULL),(47,'朱付流','男','1993-11-11','610122199311111234','已婚',1,'广东茂名',3,'jiaxuming@qq.com','15644441234','广东省茂名市电白区',8,6,14,'劳务合同','初中','通信工程','西北大学','2018-01-01','在职','00000047',5.25,'2018-04-01',NULL,'2018-01-01','2023-04-13',NULL),(48,'张淮森','男','1991-02-01','610144199102014569','已婚',1,'广东湛江',3,'zhangliming@qq.com','18979994478','广东省湛江市遂溪县',8,6,14,'劳动合同','本科','软件工程','东莞理工学院','2018-01-01','在职','00000048',7,'2018-04-01',NULL,'2018-01-01','2025-01-30',NULL),(49,'周易缘','男','1992-07-01','610144199207017895','已婚',1,'广东汕头',3,'xuelei@qq.com','15648887741','广东省汕头市',8,6,14,'劳动合同','本科','软件工程','东莞理工学院','2018-01-01','在职','00000049',6,'2018-04-01',NULL,'2018-01-01','2024-01-17',NULL),(50,'梁澄静','女','1990-10-09','420177199010093652','未婚',1,'海南美兰',1,'zhangjie@qq.com','13695557742','海口市美兰区',8,6,14,'劳动合同','本科','软件工程','东莞理工学院','2018-01-01','在职','00000050',1,'2018-01-31',NULL,'2018-01-01','2019-01-01',NULL),(51,'李宏伟','男','1990-01-01','610122199001011256','已婚',1,'广东深圳',1,'laowang@qq.com','18565558897','广东省深圳市南山区',9,7,15,'劳务合同','本科','信息管理与信息系统','深圳大学','2018-01-01','在职','00000051',2,'2018-04-01',NULL,'2018-01-01','2020-01-01',NULL),(52,'李曼诗','女','1989-02-01','421288198902011234','已婚',1,'海南海口',1,'chenjing@qq.com','18795556693','海南省海口市美兰区',9,7,15,'劳动合同','高中','市场营销','武汉大学','2015-06-09','在职','00000052',3,'2015-09-10',NULL,'2015-06-09','2018-06-08',NULL),(53,'唐智腾','男','1993-03-04','610122199303041456','未婚',1,'陕西西安',1,'zhao@qq.com','15698887795','陕西省西安市莲湖区',9,7,15,'劳动合同','博士','电子工程','哈尔滨理工大学','2018-01-01','在职','00000053',3.5,'2018-04-01',NULL,'2018-01-01','2021-07-14',NULL),(54,'苏翔晖','男','1990-01-03','610122199001031456','已婚',1,'陕西西安',3,'zhao@qq.com','15612347795','陕西省西安市莲湖区',9,7,15,'劳动合同','高中','电子工程','哈尔滨理工大学','2018-01-01','在职','00000054',3.5,'2018-04-01',NULL,'2018-01-01','2021-07-14',NULL),(55,'王嘉斌','男','1991-02-05','610122199102058952','已婚',1,'广东茂名',3,'yaosen@qq.com','14785559936','广东省茂名市电白区',9,7,15,'劳动合同','硕士','室内装修设计','西北大学','2017-01-02','在职','00000055',7,'2017-04-02',NULL,'2017-01-02','2024-01-17',NULL),(56,'邓清文','女','1993-01-05','610122199301054789','已婚',1,'陕西西安',3,'yunxing@qq.com','15644442252','陕西西安新城区',9,7,15,'劳务合同','硕士','通信工程','西安电子科技学校','2018-01-01','在职','00000056',5.25,'2018-04-01',NULL,'2018-01-01','2023-04-13',NULL),(57,'余川','男','1993-11-11','610122199311111234','已婚',1,'广东茂名',3,'jiaxuming@qq.com','15644441234','广东省茂名市电白区',9,7,15,'劳务合同','初中','通信工程','西北大学','2018-01-01','在职','00000057',5.25,'2018-04-01',NULL,'2018-01-01','2023-04-13',NULL),(58,'吴中华','男','1991-02-01','610144199102014569','已婚',1,'广东湛江',3,'zhangliming@qq.com','18979994478','广东省湛江市遂溪县',9,7,15,'劳动合同','本科','软件工程','东莞理工学院','2018-01-01','在职','00000058',7,'2018-04-01',NULL,'2018-01-01','2025-01-30',NULL),(59,'刘榕榆','男','1992-07-01','610144199207017895','已婚',1,'广东汕头',3,'xuelei@qq.com','15648887741','广东省汕头市',9,7,15,'劳动合同','本科','软件工程','东莞理工学院','2018-01-01','在职','00000059',6,'2018-04-01',NULL,'2018-01-01','2024-01-17',NULL),(60,'缪娟萍','女','1990-10-09','420177199010093652','未婚',1,'海南美兰',1,'zhangjie@qq.com','13695557742','海口市美兰区',9,7,15,'劳动合同','本科','软件工程','东莞理工学院','2018-01-01','在职','00000060',1,'2018-01-31',NULL,'2018-01-01','2019-01-01',NULL);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employeeremove`
--

DROP TABLE IF EXISTS `employeeremove`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employeeremove` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eid` int(11) DEFAULT NULL,
  `sourceDepId` int(11) DEFAULT NULL COMMENT '原部门',
  `sourceJobId` int(11) DEFAULT NULL COMMENT '原职称',
  `sourcePosId` int(11) DEFAULT NULL COMMENT '原职位',
  `targetDepId` int(11) DEFAULT NULL COMMENT '目标部门',
  `targetJobId` int(11) DEFAULT NULL COMMENT '目标职称',
  `targetPosId` int(11) DEFAULT NULL COMMENT '目标职位',
  `removeDate` date DEFAULT NULL COMMENT '调动日期',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `pid` (`eid`),
  CONSTRAINT `employeeremove_ibfk_1` FOREIGN KEY (`eid`) REFERENCES `employee` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employeeremove`
--

LOCK TABLES `employeeremove` WRITE;
/*!40000 ALTER TABLE `employeeremove` DISABLE KEYS */;
INSERT INTO `employeeremove` VALUES (1,1,4,1,10,5,2,11,'2019-02-05','调动去测试部比较好'),(2,3,4,1,10,6,6,4,'2019-01-29','从底层干起'),(3,11,5,2,11,4,1,10,'2019-02-06','研发部缺个背锅的'),(4,23,6,3,12,4,2,2,'2019-03-19','去研发部感受一下996的恐怖吧'),(5,2,4,1,10,4,4,10,'2019-01-22','犯错降职称'),(6,6,4,1,10,4,6,10,'2019-02-26','教授职称人数过多'),(7,10,4,1,10,4,5,10,'2019-03-25','技术不过关');
/*!40000 ALTER TABLE `employeeremove` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employeerp`
--

DROP TABLE IF EXISTS `employeerp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employeerp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eid` int(11) DEFAULT NULL COMMENT '员工编号',
  `rpDate` date DEFAULT NULL COMMENT '奖罚日期',
  `rpPoint` int(11) DEFAULT NULL COMMENT '奖罚分',
  `rpType` tinyint(1) DEFAULT NULL COMMENT '奖罚类别，0：罚，1：奖',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `pid` (`eid`),
  CONSTRAINT `employeerp_ibfk_1` FOREIGN KEY (`eid`) REFERENCES `employee` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employeerp`
--

LOCK TABLES `employeerp` WRITE;
/*!40000 ALTER TABLE `employeerp` DISABLE KEYS */;
INSERT INTO `employeerp` VALUES (1,8,'2019-01-01',100,1,'工作努力'),(2,8,'2019-01-05',100,1,'工作刻苦'),(3,8,'2019-02-01',100,1,'工作认真'),(4,8,'2019-03-01',100,1,'效率高'),(5,8,'2019-04-01',100,1,'我想加就加'),(6,8,'2019-04-01',100,1,'知识就是力量'),(7,8,'2019-05-01',100,1,'刻苦加班'),(8,8,'2019-03-01',100,1,'没事就加班'),(9,8,'2019-02-01',100,1,'九九六冲鸭'),(10,8,'2019-01-01',100,1,'想不到理由奖励自己了'),(11,8,'2019-01-06',100,1,'那就不想了'),(12,8,'2019-03-01',90,0,'偶尔罚罚自己'),(13,8,'2019-02-01',80,0,'不可以太突出');
/*!40000 ALTER TABLE `employeerp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empsalary`
--

DROP TABLE IF EXISTS `empsalary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empsalary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eid` int(11) DEFAULT NULL,
  `sid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `eid` (`eid`),
  KEY `empsalary_ibfk_2` (`sid`),
  CONSTRAINT `empsalary_ibfk_1` FOREIGN KEY (`eid`) REFERENCES `employee` (`id`),
  CONSTRAINT `empsalary_ibfk_2` FOREIGN KEY (`sid`) REFERENCES `salary` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empsalary`
--

LOCK TABLES `empsalary` WRITE;
/*!40000 ALTER TABLE `empsalary` DISABLE KEYS */;
INSERT INTO `empsalary` VALUES (2,2,1),(4,4,1),(5,5,1),(6,6,1),(7,7,1),(8,8,1),(9,9,1),(10,10,1),(13,12,2),(14,13,2),(15,14,2),(16,15,2),(17,16,2),(18,17,2),(19,18,2),(20,19,2),(21,20,2),(22,22,3),(23,21,3),(25,24,3),(26,25,3),(27,26,3),(28,27,3),(29,28,3),(30,29,3),(31,30,3),(32,31,4),(33,32,4),(34,33,4),(35,34,4),(36,35,4),(37,36,4),(38,37,4),(39,38,4),(40,39,4),(41,40,4),(42,41,5),(43,42,5),(44,43,5),(45,44,5),(46,45,5),(47,46,5),(48,47,5),(49,48,5),(50,49,5),(51,50,5),(52,1,2),(53,3,3),(54,11,1),(55,23,1),(56,52,6),(57,51,6),(58,53,6),(59,54,6),(60,55,6),(61,56,6),(62,57,6),(63,58,6),(64,59,6),(65,60,6);
/*!40000 ALTER TABLE `empsalary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hr`
--

DROP TABLE IF EXISTS `hr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hr` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '人事经理编号',
  `name` varchar(32) DEFAULT '您还未设置姓名哦！' COMMENT '姓名',
  `phone` char(11) DEFAULT NULL COMMENT '手机号码',
  `telephone` varchar(16) DEFAULT NULL COMMENT '住宅电话',
  `address` varchar(64) DEFAULT NULL COMMENT '联系地址',
  `enabled` tinyint(1) DEFAULT '1' COMMENT '启用状态',
  `username` varchar(255) DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `userface` varchar(255) DEFAULT '/hrCenter/image/default_userface.jpg' COMMENT '用户头像路径',
  `remark` varchar(255) DEFAULT '该用户太懒，还没设置备注' COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hr`
--

LOCK TABLES `hr` WRITE;
/*!40000 ALTER TABLE `hr` DISABLE KEYS */;
INSERT INTO `hr` VALUES (1,'系统管理员','13433611935','0754-82521122','奥利给省奥利给市',1,'admin','$2a$10$UWmALT9KLFGI2vxAMwKWJOQeRGl/4G3O8MnUWXp23h0nykFUsKW3e','/hrCenter/image/1-1576892338607-0.jpg','奥利给'),(2,'苏用恒','13433635079',NULL,'广东省湛江市',1,'syh','$2a$10$7sCI52wB.RJZ3g3gitZzQ.X7EYnPr3GLlyus2oQZy91PDG8aGohhe','/hrCenter/image/default_userface.jpg','该用户太懒，还没设置备注'),(3,'林泽荣',NULL,NULL,'广东省汕头市',1,'lzr','$2a$10$pZlx.XhXiLelhN7EXdXUiuDgV9I/Y/dOQeKstAFnWkpQ7WtCU.ebS','/hrCenter/image/default_userface.jpg','该用户太懒，还没设置备注'),(4,'詹宗汉',NULL,NULL,'广东省茂名市',1,'zzh','$2a$10$BSCx/4p3e.dA2Pcqefdcke8eZPTeQuOA0KoLokk.zdN4s7KLo6l0m','/hrCenter/image/default_userface.jpg','该用户太懒，还没设置备注'),(5,'崔洪铭',NULL,NULL,'广东省茂名市',1,'chm','$2a$10$/D/WqlPTXKM/HtCUUKvNqelgSWMm6tXhybOtmD5C0T1l7xrIr7BDa','/hrCenter/image/default_userface.jpg','该用户太懒，还没设置备注'),(6,'许可翔',NULL,NULL,'广东省深圳市',1,'xkx','$2a$10$yDocgsd.2TeR3neDEkjynuLUyziEtCkO6GT62qwtkO4eo3BIqFDBu','/hrCenter/image/default_userface.jpg','该用户太懒，还没设置备注');
/*!40000 ALTER TABLE `hr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hr_role`
--

DROP TABLE IF EXISTS `hr_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hr_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hrid` int(11) DEFAULT NULL,
  `rid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`),
  KEY `hr_role_ibfk_1` (`hrid`),
  CONSTRAINT `hr_role_ibfk_1` FOREIGN KEY (`hrid`) REFERENCES `hr` (`id`) ON DELETE CASCADE,
  CONSTRAINT `hr_role_ibfk_2` FOREIGN KEY (`rid`) REFERENCES `role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hr_role`
--

LOCK TABLES `hr_role` WRITE;
/*!40000 ALTER TABLE `hr_role` DISABLE KEYS */;
INSERT INTO `hr_role` VALUES (1,1,1);
/*!40000 ALTER TABLE `hr_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `joblevel`
--

DROP TABLE IF EXISTS `joblevel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `joblevel` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '职称编号',
  `name` varchar(32) DEFAULT NULL COMMENT '职称名称',
  `titleLevel` enum('正高级','副高级','中级','初级','员级') DEFAULT NULL COMMENT '职称等级',
  `createDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `enabled` tinyint(1) DEFAULT '1' COMMENT '启用状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `joblevel`
--

LOCK TABLES `joblevel` WRITE;
/*!40000 ALTER TABLE `joblevel` DISABLE KEYS */;
INSERT INTO `joblevel` VALUES (1,'教授','正高级','2018-01-11 13:19:14',1),(2,'副教授','副高级','2018-01-11 13:19:20',1),(3,'讲师','中级','2018-01-11 14:42:12',1),(4,'助教','初级','2018-01-11 13:35:39',1),(5,'初级工程师','初级','2018-01-14 08:18:50',1),(6,'中级工程师','中级','2018-01-14 08:19:00',1),(7,'高级工程师','副高级','2018-01-14 08:19:14',1),(8,'骨灰级工程师','正高级','2018-01-14 08:19:24',1);
/*!40000 ALTER TABLE `joblevel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(64) DEFAULT NULL,
  `path` varchar(64) DEFAULT NULL,
  `component` varchar(64) DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `iconCls` varchar(64) DEFAULT NULL,
  `keepAlive` tinyint(1) DEFAULT NULL,
  `requireAuth` tinyint(1) DEFAULT NULL,
  `parentId` int(11) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `parentId` (`parentId`),
  CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`parentId`) REFERENCES `menu` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'/',NULL,NULL,'所有',NULL,NULL,NULL,NULL,1),(2,'/','/home','Home','员工资料','fa fa-user-circle-o',NULL,1,1,1),(3,'/','/home','Home','人事管理','fa fa-address-card-o',NULL,1,1,1),(4,'/','/home','Home','薪资管理','fa fa-money',NULL,1,1,1),(5,'/','/home','Home','统计管理','fa fa-bar-chart',NULL,1,1,1),(6,'/','/home','Home','系统管理','fa fa-windows',NULL,1,1,1),(7,'/employee/basic/**','/emp/basic','EmpBasic','基本资料',NULL,NULL,1,2,1),(8,'/personnel/rp/**','/per/rp','PerRp','员工奖惩',NULL,NULL,1,3,1),(9,'/personnel/remove/**','/per/mv','PerMv','员工调动',NULL,NULL,1,3,1),(10,'/salary/sob/**','/sal/sob','SalSob','薪资账套管理',NULL,NULL,1,4,1),(11,'/salary/sobcfg/**','/sal/sobcfg','SalSobCfg','员工账套设置',NULL,NULL,1,4,1),(12,'/salary/waiting/**','/sal/waiting','SalWaiting','待发薪资管理',NULL,NULL,1,4,1),(13,'/salary/history/**','/sal/history','SalHistory','历史薪资查询',NULL,NULL,1,4,1),(14,'/statistics/salary/**','/sta/salary','StaSalary','员工薪资统计',NULL,NULL,1,5,1),(15,'/statistics/score/**','/sta/score','StaScore','员工积分统计',NULL,NULL,1,5,1),(16,'/statistics/record/**','/sta/record','StaRecord','人事调动统计',NULL,NULL,1,5,1),(17,'/system/basic/**','/sys/basic','SysBasic','基础信息设置',NULL,NULL,1,6,1),(18,'/system/hr/**','/sys/hr','SysHr','操作员管理',NULL,NULL,1,6,1),(19,'/system/data/**','/sys/data','SysData','备份恢复数据库',NULL,NULL,1,6,1);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_role`
--

DROP TABLE IF EXISTS `menu_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) DEFAULT NULL,
  `rid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mid` (`mid`),
  KEY `rid` (`rid`),
  CONSTRAINT `menu_role_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `menu` (`id`),
  CONSTRAINT `menu_role_ibfk_2` FOREIGN KEY (`rid`) REFERENCES `role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_role`
--

LOCK TABLES `menu_role` WRITE;
/*!40000 ALTER TABLE `menu_role` DISABLE KEYS */;
INSERT INTO `menu_role` VALUES (1,1,1),(2,2,1),(3,3,1),(4,4,1),(5,5,1),(6,6,1),(7,7,1),(8,8,1),(9,9,1),(10,10,1),(11,11,1),(12,12,1),(13,13,1),(14,14,1),(15,15,1),(16,16,1),(17,17,1),(18,18,1),(19,19,1),(20,7,2),(21,8,2),(22,9,2),(23,10,2),(24,11,2),(25,12,2),(26,13,2),(27,14,2),(28,15,2),(29,16,2),(30,7,3),(31,8,3),(32,9,3);
/*!40000 ALTER TABLE `menu_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `msgcontent`
--

DROP TABLE IF EXISTS `msgcontent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `msgcontent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `createDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `msgcontent`
--

LOCK TABLES `msgcontent` WRITE;
/*!40000 ALTER TABLE `msgcontent` DISABLE KEYS */;
/*!40000 ALTER TABLE `msgcontent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nation`
--

DROP TABLE IF EXISTS `nation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nation`
--

LOCK TABLES `nation` WRITE;
/*!40000 ALTER TABLE `nation` DISABLE KEYS */;
INSERT INTO `nation` VALUES (1,'汉族'),(2,'蒙古族'),(3,'回族'),(4,'藏族'),(5,'维吾尔族'),(6,'苗族'),(7,'彝族'),(8,'壮族'),(9,'布依族'),(10,'朝鲜族'),(11,'满族'),(12,'侗族'),(13,'瑶族'),(14,'白族'),(15,'土家族'),(16,'哈尼族'),(17,'哈萨克族'),(18,'傣族'),(19,'黎族'),(20,'傈僳族'),(21,'佤族'),(22,'畲族'),(23,'高山族'),(24,'拉祜族'),(25,'水族'),(26,'东乡族'),(27,'纳西族'),(28,'景颇族'),(29,'柯尔克孜族'),(30,'土族'),(31,'达斡尔族'),(32,'仫佬族'),(33,'羌族'),(34,'布朗族'),(35,'撒拉族'),(36,'毛难族'),(37,'仡佬族'),(38,'锡伯族'),(39,'阿昌族'),(40,'普米族'),(41,'塔吉克族'),(42,'怒族'),(43,'乌孜别克族'),(44,'俄罗斯族'),(45,'鄂温克族'),(46,'崩龙族'),(47,'保安族'),(48,'裕固族'),(49,'京族'),(50,'塔塔尔族'),(51,'独龙族'),(52,'鄂伦春族'),(53,'赫哲族'),(54,'门巴族'),(55,'珞巴族'),(56,'基诺族');
/*!40000 ALTER TABLE `nation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `politicsstatus`
--

DROP TABLE IF EXISTS `politicsstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `politicsstatus` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '政治面貌编号',
  `name` varchar(32) DEFAULT NULL COMMENT '政治面貌名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `politicsstatus`
--

LOCK TABLES `politicsstatus` WRITE;
/*!40000 ALTER TABLE `politicsstatus` DISABLE KEYS */;
INSERT INTO `politicsstatus` VALUES (1,'中共党员'),(2,'中共预备党员'),(3,'共青团员'),(4,'民革党员'),(5,'民盟盟员'),(6,'民建会员'),(7,'民进会员'),(8,'农工党党员'),(9,'致公党党员'),(10,'九三学社社员'),(11,'台盟盟员'),(12,'无党派人士'),(13,'群众');
/*!40000 ALTER TABLE `politicsstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `position`
--

DROP TABLE IF EXISTS `position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `position` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL COMMENT '职位',
  `createDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `enabled` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `position`
--

LOCK TABLES `position` WRITE;
/*!40000 ALTER TABLE `position` DISABLE KEYS */;
INSERT INTO `position` VALUES (1,'总经理','2018-01-11 13:13:42',1),(2,'研发部经理','2018-01-11 13:13:48',1),(3,'测试部经理','2018-01-11 13:13:48',1),(4,'设计部经理','2018-01-11 13:13:48',1),(5,'策划部经理','2018-01-11 13:13:48',1),(6,'运营部经理','2018-01-11 13:13:48',1),(7,'编辑部经理','2018-01-11 13:13:48',1),(8,'市场部经理','2018-01-11 13:13:48',1),(9,'客服部经理','2018-01-11 13:13:48',1),(10,'研发工程师','2018-01-11 13:13:56',1),(11,'测试工程师','2018-01-11 13:35:07',1),(12,'设计工程师','2018-01-14 08:07:11',1),(13,'策划员','2018-01-14 08:11:41',1),(14,'运营工程师','2018-01-11 13:13:56',1),(15,'编辑','2018-01-11 13:35:07',1),(16,'市场调查员','2018-01-14 08:07:11',1),(17,'客服','2018-01-14 08:11:41',1);
/*!40000 ALTER TABLE `position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `nameZh` varchar(64) DEFAULT NULL COMMENT '角色名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'ROLE_admin','系统管理员'),(2,'ROLE_manager','人事经理'),(3,'ROLE_operator','操作员');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salary`
--

DROP TABLE IF EXISTS `salary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salary` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '薪资编号',
  `name` varchar(32) DEFAULT NULL COMMENT '工资账套名字',
  `basicSalary` float(11,2) DEFAULT NULL COMMENT '基本工资',
  `bonus` float(11,2) DEFAULT NULL COMMENT '奖金',
  `lunchSalary` float(11,2) DEFAULT NULL COMMENT '午餐补助',
  `trafficSalary` float(11,2) DEFAULT NULL COMMENT '交通补助',
  `pensionBase` float(11,2) DEFAULT NULL COMMENT '养老金基数',
  `pensionPer` float(11,2) DEFAULT NULL COMMENT '养老金比率',
  `medicalBase` float(11,2) DEFAULT NULL COMMENT '医疗基数',
  `medicalPer` float(11,2) DEFAULT NULL COMMENT '医疗保险比率',
  `accumulationFundBase` float(11,2) DEFAULT NULL COMMENT '公积金基数',
  `accumulationFundPer` float(11,2) DEFAULT NULL COMMENT '公积金比率',
  `allSalary` float(11,2) DEFAULT NULL COMMENT '基础账套总薪资',
  `createDate` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salary`
--

LOCK TABLES `salary` WRITE;
/*!40000 ALTER TABLE `salary` DISABLE KEYS */;
INSERT INTO `salary` VALUES (1,'研发部薪资账套',8000.00,2000.00,100.00,100.00,2000.00,0.08,2000.00,0.08,2000.00,0.08,9720.00,'2020-01-02 16:00:00'),(2,'测试部薪资账套',12000.00,2000.00,800.00,1000.00,4000.00,0.07,4000.00,0.07,4000.00,0.07,14960.00,'2019-12-31 16:00:00'),(3,'设计部工资账套',10000.00,3000.00,800.00,500.00,4000.00,0.07,4000.00,0.07,4000.00,0.07,13460.00,'2019-12-31 16:00:00'),(4,'策划部薪资账套',9000.00,1000.00,800.00,800.00,2000.00,0.07,2000.00,0.07,2000.00,0.07,11180.00,'2019-12-31 16:00:00'),(5,'运营部薪资账套',10000.00,1500.00,800.00,600.00,2000.00,0.07,2000.00,0.07,2000.00,0.07,12480.00,'2019-12-31 16:00:00'),(6,'编辑部薪资账套',12000.00,2000.00,800.00,600.00,2000.00,0.07,2000.00,0.07,2000.00,0.07,14980.00,'2019-12-31 16:00:00'),(7,'市场部薪资账套',8000.00,4000.00,800.00,800.00,4000.00,0.07,4000.00,0.07,4000.00,0.07,12760.00,'2019-12-31 16:00:00'),(8,'客服部薪资账套',8000.00,3000.00,800.00,600.00,4000.00,0.07,4000.00,0.07,4000.00,0.07,11560.00,'2019-12-31 16:00:00');
/*!40000 ALTER TABLE `salary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salarysum`
--

DROP TABLE IF EXISTS `salarysum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salarysum` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '总工资编号',
  `eid` int(11) DEFAULT NULL COMMENT '员工编号',
  `basicSalary` float(11,2) DEFAULT NULL COMMENT '基础账套总薪资',
  `titleLevelCommission` float(11,2) DEFAULT NULL COMMENT '职称等级提成',
  `rpCommission` float(11,2) DEFAULT NULL COMMENT '奖惩提成',
  `allSalary` float(11,2) DEFAULT NULL COMMENT '应发薪资',
  `createDate` date DEFAULT NULL COMMENT '生成时间',
  `status` tinyint(1) DEFAULT NULL COMMENT '薪资状态：0：待发；1：已发',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salarysum`
--

LOCK TABLES `salarysum` WRITE;
/*!40000 ALTER TABLE `salarysum` DISABLE KEYS */;
INSERT INTO `salarysum` VALUES (1,2,17880.00,3000.00,0.00,20880.00,'2019-01-01',0),(2,4,17880.00,3000.00,0.00,20880.00,'2019-01-01',0),(3,5,17880.00,3000.00,0.00,20880.00,'2019-01-01',0),(4,6,17880.00,3000.00,0.00,20880.00,'2019-01-01',0),(5,7,17880.00,3000.00,0.00,20880.00,'2019-01-01',0),(6,8,17880.00,3000.00,400.00,21280.00,'2019-01-01',0),(7,9,17880.00,3000.00,0.00,20880.00,'2019-01-01',0),(8,10,17880.00,3000.00,0.00,20880.00,'2019-01-01',0),(9,11,17880.00,3000.00,0.00,20880.00,'2019-01-01',0),(10,23,17880.00,2500.00,0.00,20380.00,'2019-01-01',0),(11,1,14960.00,2500.00,0.00,17460.00,'2019-01-01',0),(12,12,14960.00,2500.00,0.00,17460.00,'2019-01-01',0),(13,13,14960.00,2500.00,0.00,17460.00,'2019-01-01',0),(14,14,14960.00,2500.00,0.00,17460.00,'2019-01-01',0),(15,15,14960.00,2500.00,0.00,17460.00,'2019-01-01',0),(16,16,14960.00,2500.00,0.00,17460.00,'2019-01-01',0),(17,17,14960.00,2500.00,0.00,17460.00,'2019-01-01',0),(18,18,14960.00,2500.00,0.00,17460.00,'2019-01-01',0),(19,19,14960.00,2500.00,0.00,17460.00,'2019-01-01',0),(20,20,14960.00,2500.00,0.00,17460.00,'2019-01-01',0),(21,3,13460.00,2000.00,0.00,15460.00,'2019-01-01',0),(22,21,13460.00,2000.00,0.00,15460.00,'2019-01-01',0),(23,22,13460.00,2000.00,0.00,15460.00,'2019-01-01',0),(24,24,13460.00,2000.00,0.00,15460.00,'2019-01-01',0),(25,25,13460.00,2000.00,0.00,15460.00,'2019-01-01',0),(26,26,13460.00,2000.00,0.00,15460.00,'2019-01-01',0),(27,27,13460.00,2000.00,0.00,15460.00,'2019-01-01',0),(28,28,13460.00,2000.00,0.00,15460.00,'2019-01-01',0),(29,29,13460.00,2000.00,0.00,15460.00,'2019-01-01',0),(30,30,13460.00,2000.00,0.00,15460.00,'2019-01-01',0),(31,31,11180.00,1000.00,0.00,12180.00,'2019-01-01',0),(32,32,11180.00,1000.00,0.00,12180.00,'2019-01-01',0),(33,33,11180.00,1000.00,0.00,12180.00,'2019-01-01',0),(34,34,11180.00,1000.00,0.00,12180.00,'2019-01-01',0),(35,35,11180.00,1000.00,0.00,12180.00,'2019-01-01',0),(36,36,11180.00,1000.00,0.00,12180.00,'2019-01-01',0),(37,37,11180.00,1000.00,0.00,12180.00,'2019-01-01',0),(38,38,11180.00,1000.00,0.00,12180.00,'2019-01-01',0),(39,39,11180.00,1000.00,0.00,12180.00,'2019-01-01',0),(40,40,11180.00,1000.00,0.00,12180.00,'2019-01-01',0),(41,2,17880.00,2800.00,0.00,20680.00,'2019-02-01',0),(42,4,17880.00,2800.00,0.00,20680.00,'2019-02-01',0),(43,5,17880.00,2800.00,0.00,20680.00,'2019-02-01',0),(44,6,17880.00,2800.00,0.00,20680.00,'2019-02-01',0),(45,7,17880.00,2800.00,0.00,20680.00,'2019-02-01',0),(46,8,17880.00,2800.00,240.00,20920.00,'2019-02-01',0),(47,9,17880.00,2800.00,0.00,20680.00,'2019-02-01',0),(48,10,17880.00,2800.00,0.00,20680.00,'2019-02-01',0),(49,11,17880.00,2800.00,0.00,20680.00,'2019-02-01',0),(50,23,17880.00,2300.00,0.00,20180.00,'2019-02-01',0),(51,2,17880.00,4000.00,0.00,21880.00,'2019-03-01',0),(52,4,17880.00,4000.00,0.00,21880.00,'2019-03-01',0),(53,5,17880.00,4000.00,0.00,21880.00,'2019-03-01',0),(54,6,17880.00,4000.00,0.00,21880.00,'2019-03-01',0),(55,7,17880.00,4000.00,0.00,21880.00,'2019-03-01',0),(56,8,17880.00,4000.00,110.00,21990.00,'2019-03-01',0),(57,9,17880.00,4000.00,0.00,21880.00,'2019-03-01',0),(58,10,17880.00,4000.00,0.00,21880.00,'2019-03-01',0),(59,11,17880.00,4000.00,0.00,21880.00,'2019-03-01',0),(60,23,17880.00,3500.00,0.00,21380.00,'2019-03-01',0),(61,2,23580.00,1500.00,0.00,25080.00,'2019-05-01',0),(62,4,23580.00,3000.00,0.00,26580.00,'2019-05-01',0),(63,5,23580.00,3000.00,0.00,26580.00,'2019-05-01',0),(64,6,23580.00,2000.00,0.00,25580.00,'2019-05-01',0),(65,7,23580.00,3000.00,0.00,26580.00,'2019-05-01',0),(66,8,23580.00,3000.00,200.00,26780.00,'2019-05-01',0),(67,9,23580.00,3000.00,0.00,26580.00,'2019-05-01',0),(68,10,23580.00,1500.00,0.00,25080.00,'2019-05-01',0),(69,11,23580.00,3000.00,0.00,26580.00,'2019-05-01',0),(70,23,23580.00,2500.00,0.00,26080.00,'2019-05-01',0),(71,2,23580.00,150.00,0.00,23730.00,'2020-04-01',0),(72,4,23580.00,300.00,0.00,23880.00,'2020-04-01',0),(73,5,23580.00,300.00,0.00,23880.00,'2020-04-01',0),(74,6,23580.00,200.00,0.00,23780.00,'2020-04-01',0),(75,7,23580.00,300.00,0.00,23880.00,'2020-04-01',0),(76,8,23580.00,300.00,0.00,23880.00,'2020-04-01',0),(77,9,23580.00,300.00,0.00,23880.00,'2020-04-01',0),(78,10,23580.00,150.00,0.00,23730.00,'2020-04-01',0),(79,11,23580.00,300.00,0.00,23880.00,'2020-04-01',0),(80,23,23580.00,250.00,0.00,23830.00,'2020-04-01',0),(81,2,9720.00,150.00,0.00,9870.00,'2019-04-01',0),(82,4,9720.00,300.00,0.00,10020.00,'2019-04-01',0),(83,5,9720.00,300.00,0.00,10020.00,'2019-04-01',0),(84,6,9720.00,200.00,0.00,9920.00,'2019-04-01',0),(85,7,9720.00,300.00,0.00,10020.00,'2019-04-01',0),(86,8,9720.00,300.00,200.00,10220.00,'2019-04-01',0),(87,9,9720.00,300.00,0.00,10020.00,'2019-04-01',0),(88,10,9720.00,150.00,0.00,9870.00,'2019-04-01',0),(89,11,9720.00,300.00,0.00,10020.00,'2019-04-01',0),(90,23,9720.00,250.00,0.00,9970.00,'2019-04-01',0),(91,2,9720.00,1400.00,0.00,11120.00,'2019-06-01',0),(92,4,9720.00,2000.00,0.00,11720.00,'2019-06-01',0),(93,5,9720.00,2000.00,0.00,11720.00,'2019-06-01',0),(94,6,9720.00,1600.00,0.00,11320.00,'2019-06-01',0),(95,7,9720.00,2000.00,0.00,11720.00,'2019-06-01',0),(96,8,9720.00,2000.00,0.00,11720.00,'2019-06-01',0),(97,9,9720.00,2000.00,0.00,11720.00,'2019-06-01',0),(98,10,9720.00,1400.00,0.00,11120.00,'2019-06-01',0),(99,11,9720.00,2000.00,0.00,11720.00,'2019-06-01',0),(100,23,9720.00,1800.00,0.00,11520.00,'2019-06-01',0);
/*!40000 ALTER TABLE `salarysum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sqlfile`
--

DROP TABLE IF EXISTS `sqlfile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sqlfile` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '数据库备份编号',
  `name` varchar(255) DEFAULT NULL COMMENT '备份名称',
  `url` varchar(255) DEFAULT NULL COMMENT '备份路径',
  `createDate` date DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sqlfile`
--

LOCK TABLES `sqlfile` WRITE;
/*!40000 ALTER TABLE `sqlfile` DISABLE KEYS */;
INSERT INTO `sqlfile` VALUES (1,'ihr-sql-2020-01-03 14:10:32','ihr-sql-1578031832980.sql','2020-01-03'),(2,'ihr-sql-2020-01-03 14:35:15','ihr-sql-1578033315692.sql','2020-01-03');
/*!40000 ALTER TABLE `sqlfile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sysmsg`
--

DROP TABLE IF EXISTS `sysmsg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sysmsg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) DEFAULT NULL COMMENT '消息id',
  `type` int(11) DEFAULT '0' COMMENT '0表示群发消息',
  `hrid` int(11) DEFAULT NULL COMMENT '这条消息是给谁的',
  `state` int(11) DEFAULT '0' COMMENT '0 未读 1 已读',
  PRIMARY KEY (`id`),
  KEY `hrid` (`hrid`),
  KEY `sysmsg_ibfk_1` (`mid`),
  CONSTRAINT `sysmsg_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `msgcontent` (`id`),
  CONSTRAINT `sysmsg_ibfk_2` FOREIGN KEY (`hrid`) REFERENCES `hr` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sysmsg`
--

LOCK TABLES `sysmsg` WRITE;
/*!40000 ALTER TABLE `sysmsg` DISABLE KEYS */;
/*!40000 ALTER TABLE `sysmsg` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-01-03 14:35:18

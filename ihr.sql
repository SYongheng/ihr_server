/*
Navicat MySQL Data Transfer

Source Server         : MySQL
Source Server Version : 50540
Source Host           : localhost:3306
Source Database       : ihr

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2020-01-04 23:58:06
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `department`
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '部门编号',
  `name` varchar(32) DEFAULT NULL COMMENT '部门名称',
  `parentId` int(11) DEFAULT NULL COMMENT '父部门编号',
  `depPath` varchar(255) DEFAULT NULL COMMENT '部门路径',
  `enabled` tinyint(1) DEFAULT '1' COMMENT '启用状态',
  `isParent` tinyint(1) DEFAULT '0' COMMENT '是否存在子部门',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES ('1', '股东会', '-1', '.1', '1', '1');
INSERT INTO `department` VALUES ('2', '董事会', '1', '.1.2', '1', '0');
INSERT INTO `department` VALUES ('3', '总办', '1', '.1.3', '1', '1');
INSERT INTO `department` VALUES ('4', '研发部', '3', '.1.3.4', '1', '0');
INSERT INTO `department` VALUES ('5', '测试部', '3', '.1.3.5', '1', '0');
INSERT INTO `department` VALUES ('6', '设计部', '3', '.1.3.6', '1', '0');
INSERT INTO `department` VALUES ('7', '策划部', '3', '.1.3.7', '1', '0');
INSERT INTO `department` VALUES ('8', '运营部', '3', '.1.3.8', '1', '0');
INSERT INTO `department` VALUES ('9', '编辑部', '3', '.1.3.9', '1', '0');
INSERT INTO `department` VALUES ('10', '市场部', '3', '.1.3.10', '1', '0');
INSERT INTO `department` VALUES ('11', '客服部', '3', '.1.3.11', '1', '0');
INSERT INTO `department` VALUES ('12', '离职', '1', '.1.12', '1', '0');

-- ----------------------------
-- Table structure for `employee`
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
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
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES ('1', '林俊杰', '男', '1990-01-01', '610122199001011256', '已婚', '1', '广东深圳', '1', 'laowang@qq.com', '18565558897', '广东省深圳市南山区', '5', '2', '11', '劳务合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职', '00000001', '2', '2018-04-01', null, '2018-01-01', '2020-01-01', null);
INSERT INTO `employee` VALUES ('2', '田馥甄', '女', '1989-02-01', '421288198902011234', '已婚', '1', '海南海口', '1', 'chenjing@qq.com', '18795556693', '海南省海口市美兰区', '4', '4', '10', '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职', '00000002', '3', '2015-09-10', null, '2015-06-09', '2018-06-08', null);
INSERT INTO `employee` VALUES ('3', '吴亦凡', '男', '1993-03-04', '610122199303041456', '未婚', '1', '陕西西安', '1', 'zhao@qq.com', '15698887795', '陕西省西安市莲湖区', '6', '6', '4', '劳动合同', '博士', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000003', '3.5', '2018-04-01', null, '2018-01-01', '2021-07-14', null);
INSERT INTO `employee` VALUES ('4', '张艺兴', '男', '1990-01-03', '610122199001031456', '已婚', '1', '陕西西安', '3', 'zhao@qq.com', '15612347795', '陕西省西安市莲湖区', '4', '1', '10', '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000004', '3.5', '2018-04-01', null, '2018-01-01', '2021-07-14', null);
INSERT INTO `employee` VALUES ('5', '詹宗汉', '男', '1991-02-05', '610122199102058952', '已婚', '1', '广东茂名', '3', 'yaosen@qq.com', '14785559936', '广东省茂名市电白区', '4', '1', '10', '劳动合同', '硕士', '室内装修设计', '西北大学', '2017-01-02', '在职', '00000005', '7', '2017-04-02', null, '2017-01-02', '2024-01-17', null);
INSERT INTO `employee` VALUES ('6', '云星', '女', '1993-01-05', '610122199301054789', '已婚', '1', '陕西西安', '3', 'yunxing@qq.com', '15644442252', '陕西西安新城区', '4', '6', '10', '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职', '00000006', '5.25', '2018-04-01', null, '2018-01-01', '2023-04-13', null);
INSERT INTO `employee` VALUES ('7', '崔洪铭', '男', '1993-11-11', '610122199311111234', '已婚', '1', '广东茂名', '3', 'jiaxuming@qq.com', '15644441234', '广东省茂名市电白区', '4', '1', '10', '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职', '00000007', '5.25', '2018-04-01', null, '2018-01-01', '2023-04-13', null);
INSERT INTO `employee` VALUES ('8', '苏用恒', '男', '1991-02-01', '610144199102014569', '已婚', '1', '广东湛江', '3', 'zhangliming@qq.com', '18979994478', '广东省湛江市遂溪县', '4', '1', '10', '劳动合同', '本科', '软件工程', '东莞理工学院', '2018-01-01', '在职', '00000008', '7', '2018-04-01', null, '2018-01-01', '2025-01-30', null);
INSERT INTO `employee` VALUES ('9', '林泽荣', '男', '1992-07-01', '610144199207017895', '已婚', '1', '广东汕头', '3', 'xuelei@qq.com', '15648887741', '广东省汕头市', '4', '1', '10', '劳动合同', '本科', '软件工程', '东莞理工学院', '2018-01-01', '在职', '00000009', '6', '2018-04-01', null, '2018-01-01', '2024-01-17', null);
INSERT INTO `employee` VALUES ('10', '张洁', '女', '1990-10-09', '420177199010093652', '未婚', '1', '海南美兰', '1', 'zhangjie@qq.com', '13695557742', '海口市美兰区', '4', '5', '10', '劳动合同', '本科', '软件工程', '东莞理工学院', '2018-01-01', '在职', '00000010', '1', '2018-01-31', null, '2018-01-01', '2019-01-01', null);
INSERT INTO `employee` VALUES ('11', '田亮', '男', '1990-01-01', '610122199001011256', '已婚', '1', '广东深圳', '1', 'laowang@qq.com', '18565558897', '广东省深圳市南山区', '4', '1', '10', '劳务合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职', '00000011', '2', '2018-04-01', null, '2018-01-01', '2020-01-01', null);
INSERT INTO `employee` VALUES ('12', '邓紫棋', '女', '1989-02-01', '421288198902011234', '已婚', '1', '海南海口', '1', 'chenjing@qq.com', '18795556693', '海南省海口市美兰区', '5', '2', '11', '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职', '00000012', '3', '2015-09-10', null, '2015-06-09', '2018-06-08', null);
INSERT INTO `employee` VALUES ('13', '马飞', '男', '1993-03-04', '610122199303041456', '未婚', '1', '陕西西安', '1', 'zhao@qq.com', '15698887795', '陕西省西安市莲湖区', '5', '2', '11', '劳动合同', '博士', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000013', '3.5', '2018-04-01', null, '2018-01-01', '2021-07-14', null);
INSERT INTO `employee` VALUES ('14', '周杰伦', '男', '1990-01-03', '610122199001031456', '已婚', '1', '陕西西安', '3', 'zhao@qq.com', '15612347795', '陕西省西安市莲湖区', '5', '2', '11', '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000014', '3.5', '2018-04-01', null, '2018-01-01', '2021-07-14', null);
INSERT INTO `employee` VALUES ('15', '周一面', '男', '1991-02-05', '610122199102058952', '已婚', '1', '广东茂名', '3', 'yaosen@qq.com', '14785559936', '广东省茂名市电白区', '5', '2', '11', '劳动合同', '硕士', '室内装修设计', '西北大学', '2017-01-02', '在职', '00000015', '7', '2017-04-02', null, '2017-01-02', '2024-01-17', null);
INSERT INTO `employee` VALUES ('16', '陈乐一', '女', '1993-01-05', '610122199301054789', '已婚', '1', '陕西西安', '3', 'yunxing@qq.com', '15644442252', '陕西西安新城区', '5', '2', '11', '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职', '00000016', '5.25', '2018-04-01', null, '2018-01-01', '2023-04-13', null);
INSERT INTO `employee` VALUES ('17', '陈冠希', '男', '1993-11-11', '610122199311111234', '已婚', '1', '广东茂名', '3', 'jiaxuming@qq.com', '15644441234', '广东省茂名市电白区', '5', '2', '11', '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职', '00000017', '5.25', '2018-04-01', null, '2018-01-01', '2023-04-13', null);
INSERT INTO `employee` VALUES ('18', '周兴中', '男', '1991-02-01', '610144199102014569', '已婚', '1', '广东湛江', '3', 'zhangliming@qq.com', '18979994478', '广东省湛江市遂溪县', '5', '2', '11', '劳动合同', '本科', '软件工程', '东莞理工学院', '2018-01-01', '在职', '00000018', '7', '2018-04-01', null, '2018-01-01', '2025-01-30', null);
INSERT INTO `employee` VALUES ('19', '许观毅', '男', '1992-07-01', '610144199207017895', '已婚', '1', '广东汕头', '3', 'xuelei@qq.com', '15648887741', '广东省汕头市', '5', '2', '11', '劳动合同', '本科', '软件工程', '东莞理工学院', '2018-01-01', '在职', '00000019', '6', '2018-04-01', null, '2018-01-01', '2024-01-17', null);
INSERT INTO `employee` VALUES ('20', '陈莲', '女', '1990-10-09', '420177199010093652', '未婚', '1', '海南美兰', '1', 'zhangjie@qq.com', '13695557742', '海口市美兰区', '5', '2', '11', '劳动合同', '本科', '软件工程', '东莞理工学院', '2018-01-01', '在职', '00000020', '1', '2018-01-31', null, '2018-01-01', '2019-01-01', null);
INSERT INTO `employee` VALUES ('21', '马宏宇', '男', '1990-01-01', '610122199001011256', '已婚', '1', '广东深圳', '1', 'laowang@qq.com', '18565558897', '广东省深圳市南山区', '6', '3', '12', '劳务合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职', '00000021', '2', '2018-04-01', null, '2018-01-01', '2020-01-01', null);
INSERT INTO `employee` VALUES ('22', '邓红棋', '女', '1989-02-01', '421288198902011234', '已婚', '1', '海南海口', '1', 'chenjing@qq.com', '18795556693', '海南省海口市美兰区', '6', '3', '12', '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职', '00000022', '3', '2015-09-10', null, '2015-06-09', '2018-06-08', null);
INSERT INTO `employee` VALUES ('23', '黄强辉', '男', '1993-03-04', '610122199303041456', '未婚', '1', '陕西西安', '1', 'zhao@qq.com', '15698887795', '陕西省西安市莲湖区', '4', '2', '2', '劳动合同', '博士', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000023', '3.5', '2018-04-01', null, '2018-01-01', '2021-07-14', null);
INSERT INTO `employee` VALUES ('24', '卢本伟', '男', '1990-01-03', '610122199001031456', '已婚', '1', '陕西西安', '3', 'zhao@qq.com', '15612347795', '陕西省西安市莲湖区', '6', '3', '12', '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000024', '3.5', '2018-04-01', null, '2018-01-01', '2021-07-14', null);
INSERT INTO `employee` VALUES ('25', '皮西蒙', '男', '1991-02-05', '610122199102058952', '已婚', '1', '广东茂名', '3', 'yaosen@qq.com', '14785559936', '广东省茂名市电白区', '6', '3', '12', '劳动合同', '硕士', '室内装修设计', '西北大学', '2017-01-02', '在职', '00000025', '7', '2017-04-02', null, '2017-01-02', '2024-01-17', null);
INSERT INTO `employee` VALUES ('26', '赵丽颖', '女', '1993-01-05', '610122199301054789', '已婚', '1', '陕西西安', '3', 'yunxing@qq.com', '15644442252', '陕西西安新城区', '6', '3', '12', '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职', '00000026', '5.25', '2018-04-01', null, '2018-01-01', '2023-04-13', null);
INSERT INTO `employee` VALUES ('27', '周鸿祎', '男', '1993-11-11', '610122199311111234', '已婚', '1', '广东茂名', '3', 'jiaxuming@qq.com', '15644441234', '广东省茂名市电白区', '6', '3', '12', '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职', '00000027', '5.25', '2018-04-01', null, '2018-01-01', '2023-04-13', null);
INSERT INTO `employee` VALUES ('28', '马化腾', '男', '1991-02-01', '610144199102014569', '已婚', '1', '广东湛江', '3', 'zhangliming@qq.com', '18979994478', '广东省湛江市遂溪县', '6', '3', '12', '劳动合同', '本科', '软件工程', '东莞理工学院', '2018-01-01', '在职', '00000028', '7', '2018-04-01', null, '2018-01-01', '2025-01-30', null);
INSERT INTO `employee` VALUES ('29', '高尚德', '男', '1992-07-01', '610144199207017895', '已婚', '1', '广东汕头', '3', 'xuelei@qq.com', '15648887741', '广东省汕头市', '6', '3', '12', '劳动合同', '本科', '软件工程', '东莞理工学院', '2018-01-01', '在职', '00000029', '6', '2018-04-01', null, '2018-01-01', '2024-01-17', null);
INSERT INTO `employee` VALUES ('30', '孙慧', '女', '1990-10-09', '420177199010093652', '未婚', '1', '海南美兰', '1', 'zhangjie@qq.com', '13695557742', '海口市美兰区', '6', '3', '12', '劳动合同', '本科', '软件工程', '东莞理工学院', '2018-01-01', '在职', '00000030', '1', '2018-01-31', null, '2018-01-01', '2019-01-01', null);
INSERT INTO `employee` VALUES ('31', '张志远', '男', '1990-01-01', '610122199001011256', '已婚', '1', '广东深圳', '1', 'laowang@qq.com', '18565558897', '广东省深圳市南山区', '7', '5', '13', '劳务合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职', '00000031', '2', '2018-04-01', null, '2018-01-01', '2020-01-01', null);
INSERT INTO `employee` VALUES ('32', '王祖贤', '女', '1989-02-01', '421288198902011234', '已婚', '1', '海南海口', '1', 'chenjing@qq.com', '18795556693', '海南省海口市美兰区', '7', '5', '13', '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职', '00000032', '3', '2015-09-10', null, '2015-06-09', '2018-06-08', null);
INSERT INTO `employee` VALUES ('33', '吕文达', '男', '1993-03-04', '610122199303041456', '未婚', '1', '陕西西安', '1', 'zhao@qq.com', '15698887795', '陕西省西安市莲湖区', '7', '5', '13', '劳动合同', '博士', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000033', '3.5', '2018-04-01', null, '2018-01-01', '2021-07-14', null);
INSERT INTO `employee` VALUES ('34', '罗元发', '男', '1990-01-03', '610122199001031456', '已婚', '1', '陕西西安', '3', 'zhao@qq.com', '15612347795', '陕西省西安市莲湖区', '7', '5', '13', '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000034', '3.5', '2018-04-01', null, '2018-01-01', '2021-07-14', null);
INSERT INTO `employee` VALUES ('35', '李开富', '男', '1991-02-05', '610122199102058952', '已婚', '1', '广东茂名', '3', 'yaosen@qq.com', '14785559936', '广东省茂名市电白区', '7', '5', '13', '劳动合同', '硕士', '室内装修设计', '西北大学', '2017-01-02', '在职', '00000035', '7', '2017-04-02', null, '2017-01-02', '2024-01-17', null);
INSERT INTO `employee` VALUES ('36', '李兰', '女', '1993-01-05', '610122199301054789', '已婚', '1', '陕西西安', '3', 'yunxing@qq.com', '15644442252', '陕西西安新城区', '7', '5', '13', '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职', '00000036', '5.25', '2018-04-01', null, '2018-01-01', '2023-04-13', null);
INSERT INTO `employee` VALUES ('37', '李厚福', '男', '1993-11-11', '610122199311111234', '已婚', '1', '广东茂名', '3', 'jiaxuming@qq.com', '15644441234', '广东省茂名市电白区', '7', '5', '13', '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职', '00000037', '5.25', '2018-04-01', null, '2018-01-01', '2023-04-13', null);
INSERT INTO `employee` VALUES ('38', '刘造时', '男', '1991-02-01', '610144199102014569', '已婚', '1', '广东湛江', '3', 'zhangliming@qq.com', '18979994478', '广东省湛江市遂溪县', '7', '5', '13', '劳动合同', '本科', '软件工程', '东莞理工学院', '2018-01-01', '在职', '00000038', '7', '2018-04-01', null, '2018-01-01', '2025-01-30', null);
INSERT INTO `employee` VALUES ('39', '刘长胜', '男', '1992-07-01', '610144199207017895', '已婚', '1', '广东汕头', '3', 'xuelei@qq.com', '15648887741', '广东省汕头市', '7', '5', '13', '劳动合同', '本科', '软件工程', '东莞理工学院', '2018-01-01', '在职', '00000039', '6', '2018-04-01', null, '2018-01-01', '2024-01-17', null);
INSERT INTO `employee` VALUES ('40', '孙蕙', '女', '1990-10-09', '420177199010093652', '未婚', '1', '海南美兰', '1', 'zhangjie@qq.com', '13695557742', '海口市美兰区', '7', '5', '13', '劳动合同', '本科', '软件工程', '东莞理工学院', '2018-01-01', '在职', '00000040', '1', '2018-01-31', null, '2018-01-01', '2019-01-01', null);
INSERT INTO `employee` VALUES ('41', '周卓浩', '男', '1990-01-01', '610122199001011256', '已婚', '1', '广东深圳', '1', 'laowang@qq.com', '18565558897', '广东省深圳市南山区', '8', '6', '14', '劳务合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职', '00000041', '2', '2018-04-01', null, '2018-01-01', '2020-01-01', null);
INSERT INTO `employee` VALUES ('42', '林青霞', '女', '1989-02-01', '421288198902011234', '已婚', '1', '海南海口', '1', 'chenjing@qq.com', '18795556693', '海南省海口市美兰区', '8', '6', '14', '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职', '00000042', '3', '2015-09-10', null, '2015-06-09', '2020-08-01', null);
INSERT INTO `employee` VALUES ('43', '周星驰', '男', '1993-03-04', '610122199303041456', '未婚', '1', '陕西西安', '1', 'zhao@qq.com', '15698887795', '陕西省西安市莲湖区', '8', '6', '14', '劳动合同', '博士', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000043', '3.5', '2018-04-01', null, '2018-01-01', '2021-07-14', null);
INSERT INTO `employee` VALUES ('44', '何颖升', '男', '1990-01-03', '610122199001031456', '已婚', '1', '陕西西安', '3', 'zhao@qq.com', '15612347795', '陕西省西安市莲湖区', '8', '6', '14', '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000044', '3.5', '2018-04-01', null, '2018-01-01', '2021-07-14', null);
INSERT INTO `employee` VALUES ('45', '宁古薄', '男', '1991-02-05', '610122199102058952', '已婚', '1', '广东茂名', '3', 'yaosen@qq.com', '14785559936', '广东省茂名市电白区', '8', '6', '14', '劳动合同', '硕士', '室内装修设计', '西北大学', '2017-01-02', '在职', '00000045', '7', '2017-04-02', null, '2017-01-02', '2024-01-17', null);
INSERT INTO `employee` VALUES ('46', '池慕营', '女', '1993-01-05', '610122199301054789', '已婚', '1', '陕西西安', '3', 'yunxing@qq.com', '15644442252', '陕西西安新城区', '8', '6', '14', '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职', '00000046', '5.25', '2018-04-01', null, '2018-01-01', '2023-04-13', null);
INSERT INTO `employee` VALUES ('47', '朱付流', '男', '1993-11-11', '610122199311111234', '已婚', '1', '广东茂名', '3', 'jiaxuming@qq.com', '15644441234', '广东省茂名市电白区', '8', '6', '14', '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职', '00000047', '5.25', '2018-04-01', null, '2018-01-01', '2023-04-13', null);
INSERT INTO `employee` VALUES ('48', '张淮森', '男', '1991-02-01', '610144199102014569', '已婚', '1', '广东湛江', '3', 'zhangliming@qq.com', '18979994478', '广东省湛江市遂溪县', '8', '6', '14', '劳动合同', '本科', '软件工程', '东莞理工学院', '2018-01-01', '在职', '00000048', '7', '2018-04-01', null, '2018-01-01', '2025-01-30', null);
INSERT INTO `employee` VALUES ('49', '周易缘', '男', '1992-07-01', '610144199207017895', '已婚', '1', '广东汕头', '3', 'xuelei@qq.com', '15648887741', '广东省汕头市', '8', '6', '14', '劳动合同', '本科', '软件工程', '东莞理工学院', '2018-01-01', '在职', '00000049', '6', '2018-04-01', null, '2018-01-01', '2024-01-17', null);
INSERT INTO `employee` VALUES ('50', '梁澄静', '女', '1990-10-09', '420177199010093652', '未婚', '1', '海南美兰', '1', 'zhangjie@qq.com', '13695557742', '海口市美兰区', '8', '6', '14', '劳动合同', '本科', '软件工程', '东莞理工学院', '2018-01-01', '在职', '00000050', '1', '2018-01-31', null, '2018-01-01', '2019-01-01', null);
INSERT INTO `employee` VALUES ('51', '李宏伟', '男', '1990-01-01', '610122199001011256', '已婚', '1', '广东深圳', '1', 'laowang@qq.com', '18565558897', '广东省深圳市南山区', '9', '7', '15', '劳务合同', '本科', '信息管理与信息系统', '深圳大学', '2018-01-01', '在职', '00000051', '2', '2018-04-01', null, '2018-01-01', '2020-01-01', null);
INSERT INTO `employee` VALUES ('52', '李曼诗', '女', '1989-02-01', '421288198902011234', '已婚', '1', '海南海口', '1', 'chenjing@qq.com', '18795556693', '海南省海口市美兰区', '9', '7', '15', '劳动合同', '高中', '市场营销', '武汉大学', '2015-06-09', '在职', '00000052', '3', '2015-09-10', null, '2015-06-09', '2018-06-08', null);
INSERT INTO `employee` VALUES ('53', '唐智腾', '男', '1993-03-04', '610122199303041456', '未婚', '1', '陕西西安', '1', 'zhao@qq.com', '15698887795', '陕西省西安市莲湖区', '9', '7', '15', '劳动合同', '博士', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000053', '3.5', '2018-04-01', null, '2018-01-01', '2021-07-14', null);
INSERT INTO `employee` VALUES ('54', '苏翔晖', '男', '1990-01-03', '610122199001031456', '已婚', '1', '陕西西安', '3', 'zhao@qq.com', '15612347795', '陕西省西安市莲湖区', '9', '7', '15', '劳动合同', '高中', '电子工程', '哈尔滨理工大学', '2018-01-01', '在职', '00000054', '3.5', '2018-04-01', null, '2018-01-01', '2021-07-14', null);
INSERT INTO `employee` VALUES ('55', '王嘉斌', '男', '1991-02-05', '610122199102058952', '已婚', '1', '广东茂名', '3', 'yaosen@qq.com', '14785559936', '广东省茂名市电白区', '9', '7', '15', '劳动合同', '硕士', '室内装修设计', '西北大学', '2017-01-02', '在职', '00000055', '7', '2017-04-02', null, '2017-01-02', '2024-01-17', null);
INSERT INTO `employee` VALUES ('56', '邓清文', '女', '1993-01-05', '610122199301054789', '已婚', '1', '陕西西安', '3', 'yunxing@qq.com', '15644442252', '陕西西安新城区', '9', '7', '15', '劳务合同', '硕士', '通信工程', '西安电子科技学校', '2018-01-01', '在职', '00000056', '5.25', '2018-04-01', null, '2018-01-01', '2023-04-13', null);
INSERT INTO `employee` VALUES ('57', '余川', '男', '1993-11-11', '610122199311111234', '已婚', '1', '广东茂名', '3', 'jiaxuming@qq.com', '15644441234', '广东省茂名市电白区', '9', '7', '15', '劳务合同', '初中', '通信工程', '西北大学', '2018-01-01', '在职', '00000057', '5.25', '2018-04-01', null, '2018-01-01', '2023-04-13', null);
INSERT INTO `employee` VALUES ('58', '吴中华', '男', '1991-02-01', '610144199102014569', '已婚', '1', '广东湛江', '3', 'zhangliming@qq.com', '18979994478', '广东省湛江市遂溪县', '9', '7', '15', '劳动合同', '本科', '软件工程', '东莞理工学院', '2018-01-01', '在职', '00000058', '7', '2018-04-01', null, '2018-01-01', '2025-01-30', null);
INSERT INTO `employee` VALUES ('59', '刘榕榆', '男', '1992-07-01', '610144199207017895', '已婚', '1', '广东汕头', '3', 'xuelei@qq.com', '15648887741', '广东省汕头市', '9', '7', '15', '劳动合同', '本科', '软件工程', '东莞理工学院', '2018-01-01', '在职', '00000059', '6', '2018-04-01', null, '2018-01-01', '2024-01-17', null);
INSERT INTO `employee` VALUES ('60', '缪娟萍', '女', '1990-10-09', '420177199010093652', '未婚', '1', '海南美兰', '1', 'zhangjie@qq.com', '13695557742', '海口市美兰区', '9', '7', '15', '劳动合同', '本科', '软件工程', '东莞理工学院', '2018-01-01', '在职', '00000060', '1', '2018-01-31', null, '2018-01-01', '2019-01-01', null);
INSERT INTO `employee` VALUES ('61', '许可翔', '男', '2019-12-31', '770226199811191250', '已婚', '1', '广东揭阳', '5', '15625702836@163.com', '13534152363', '我', '4', '5', '2', '劳动合同', '本科', '软件工程', '冬瓜理工', '2020-01-29', '在职', '00000061', '0', '2020-01-13', null, '2020-01-06', '2020-01-27', null);

-- ----------------------------
-- Table structure for `employeeremove`
-- ----------------------------
DROP TABLE IF EXISTS `employeeremove`;
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

-- ----------------------------
-- Records of employeeremove
-- ----------------------------
INSERT INTO `employeeremove` VALUES ('1', '1', '4', '1', '10', '5', '2', '11', '2019-02-05', '调动去测试部比较好');
INSERT INTO `employeeremove` VALUES ('2', '3', '4', '1', '10', '6', '6', '4', '2019-01-29', '从底层干起');
INSERT INTO `employeeremove` VALUES ('3', '11', '5', '2', '11', '4', '1', '10', '2019-02-06', '研发部缺个背锅的');
INSERT INTO `employeeremove` VALUES ('4', '23', '6', '3', '12', '4', '2', '2', '2019-03-19', '去研发部感受一下996的恐怖吧');
INSERT INTO `employeeremove` VALUES ('5', '2', '4', '1', '10', '4', '4', '10', '2019-01-22', '犯错降职称');
INSERT INTO `employeeremove` VALUES ('6', '6', '4', '1', '10', '4', '6', '10', '2019-02-26', '教授职称人数过多');
INSERT INTO `employeeremove` VALUES ('7', '10', '4', '1', '10', '4', '5', '10', '2019-03-25', '技术不过关');

-- ----------------------------
-- Table structure for `employeerp`
-- ----------------------------
DROP TABLE IF EXISTS `employeerp`;
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
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of employeerp
-- ----------------------------
INSERT INTO `employeerp` VALUES ('1', '8', '2019-01-01', '100', '1', '工作努力');
INSERT INTO `employeerp` VALUES ('2', '8', '2019-01-05', '100', '1', '工作刻苦');
INSERT INTO `employeerp` VALUES ('3', '8', '2019-02-01', '100', '1', '工作认真');
INSERT INTO `employeerp` VALUES ('4', '8', '2019-03-01', '100', '1', '效率高');
INSERT INTO `employeerp` VALUES ('5', '8', '2019-04-01', '100', '1', '我想加就加');
INSERT INTO `employeerp` VALUES ('6', '8', '2019-04-01', '100', '1', '知识就是力量');
INSERT INTO `employeerp` VALUES ('7', '8', '2019-05-01', '100', '1', '刻苦加班');
INSERT INTO `employeerp` VALUES ('8', '8', '2019-03-01', '100', '1', '没事就加班');
INSERT INTO `employeerp` VALUES ('9', '8', '2019-02-01', '100', '1', '九九六冲鸭');
INSERT INTO `employeerp` VALUES ('10', '8', '2019-01-01', '100', '1', '想不到理由奖励自己了');
INSERT INTO `employeerp` VALUES ('11', '8', '2019-01-06', '100', '1', '那就不想了');
INSERT INTO `employeerp` VALUES ('12', '8', '2019-03-01', '90', '0', '偶尔罚罚自己');
INSERT INTO `employeerp` VALUES ('13', '8', '2019-02-01', '80', '0', '不可以太突出');
INSERT INTO `employeerp` VALUES ('14', '5', '2020-01-01', '300', '1', '元旦快乐');
INSERT INTO `employeerp` VALUES ('15', '5', '2020-01-02', '800', '1', '新年第二天快乐');
INSERT INTO `employeerp` VALUES ('16', '5', '2019-12-31', '300', '0', '给爷爬');
INSERT INTO `employeerp` VALUES ('17', '3', '2019-07-12', '600', '1', '帮我把手机充电充好了');
INSERT INTO `employeerp` VALUES ('18', '3', '2020-01-01', '800', '0', '元旦就电到我了\n');
INSERT INTO `employeerp` VALUES ('19', '7', '2020-01-01', '2000', '1', '元旦加班加到头晕');
INSERT INTO `employeerp` VALUES ('20', '9', '2020-01-01', '800', '1', '奖励下吧');
INSERT INTO `employeerp` VALUES ('21', '14', '2020-01-02', '600', '1', '小周驻唱一天了，奖励下');
INSERT INTO `employeerp` VALUES ('22', '24', '2019-12-21', '300', '1', '给阿姨倒杯卡布奇诺');
INSERT INTO `employeerp` VALUES ('23', '28', '2020-01-03', '600', '1', '小马家的cf挺好玩的');
INSERT INTO `employeerp` VALUES ('24', '7', '2020-01-04', '400', '0', '旷工');
INSERT INTO `employeerp` VALUES ('25', '7', '2020-01-05', '200', '1', '加班加班');
INSERT INTO `employeerp` VALUES ('26', '5', '2019-12-20', '600', '1', '加班加班');
INSERT INTO `employeerp` VALUES ('27', '28', '2019-12-04', '400', '0', '让我玩游戏');
INSERT INTO `employeerp` VALUES ('28', '14', '2019-12-19', '200', '1', '小周唱歌好听');
INSERT INTO `employeerp` VALUES ('29', '9', '2019-12-25', '400', '1', '奖励一杯牛奶');
INSERT INTO `employeerp` VALUES ('30', '9', '2019-12-26', '200', '0', '上班开小差');
INSERT INTO `employeerp` VALUES ('31', '61', '2020-01-03', '3', '0', '丢雷楼某');
INSERT INTO `employeerp` VALUES ('32', '61', '2020-01-03', '2000000', '1', '带薪拉屎');
INSERT INTO `employeerp` VALUES ('33', '61', '2020-01-03', '100', '1', '一天上班25个小时');

-- ----------------------------
-- Table structure for `empsalary`
-- ----------------------------
DROP TABLE IF EXISTS `empsalary`;
CREATE TABLE `empsalary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eid` int(11) DEFAULT NULL,
  `sid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `eid` (`eid`),
  KEY `empsalary_ibfk_2` (`sid`),
  CONSTRAINT `empsalary_ibfk_1` FOREIGN KEY (`eid`) REFERENCES `employee` (`id`),
  CONSTRAINT `empsalary_ibfk_2` FOREIGN KEY (`sid`) REFERENCES `salary` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of empsalary
-- ----------------------------
INSERT INTO `empsalary` VALUES ('2', '2', '1');
INSERT INTO `empsalary` VALUES ('4', '4', '1');
INSERT INTO `empsalary` VALUES ('5', '5', '1');
INSERT INTO `empsalary` VALUES ('6', '6', '1');
INSERT INTO `empsalary` VALUES ('7', '7', '1');
INSERT INTO `empsalary` VALUES ('8', '8', '1');
INSERT INTO `empsalary` VALUES ('9', '9', '1');
INSERT INTO `empsalary` VALUES ('10', '10', '1');
INSERT INTO `empsalary` VALUES ('13', '12', '2');
INSERT INTO `empsalary` VALUES ('14', '13', '2');
INSERT INTO `empsalary` VALUES ('15', '14', '2');
INSERT INTO `empsalary` VALUES ('16', '15', '2');
INSERT INTO `empsalary` VALUES ('17', '16', '2');
INSERT INTO `empsalary` VALUES ('18', '17', '2');
INSERT INTO `empsalary` VALUES ('19', '18', '2');
INSERT INTO `empsalary` VALUES ('20', '19', '2');
INSERT INTO `empsalary` VALUES ('21', '20', '2');
INSERT INTO `empsalary` VALUES ('22', '22', '3');
INSERT INTO `empsalary` VALUES ('23', '21', '3');
INSERT INTO `empsalary` VALUES ('25', '24', '3');
INSERT INTO `empsalary` VALUES ('26', '25', '3');
INSERT INTO `empsalary` VALUES ('27', '26', '3');
INSERT INTO `empsalary` VALUES ('28', '27', '3');
INSERT INTO `empsalary` VALUES ('29', '28', '3');
INSERT INTO `empsalary` VALUES ('30', '29', '3');
INSERT INTO `empsalary` VALUES ('31', '30', '3');
INSERT INTO `empsalary` VALUES ('32', '31', '4');
INSERT INTO `empsalary` VALUES ('33', '32', '4');
INSERT INTO `empsalary` VALUES ('34', '33', '4');
INSERT INTO `empsalary` VALUES ('35', '34', '4');
INSERT INTO `empsalary` VALUES ('36', '35', '4');
INSERT INTO `empsalary` VALUES ('37', '36', '4');
INSERT INTO `empsalary` VALUES ('38', '37', '4');
INSERT INTO `empsalary` VALUES ('39', '38', '4');
INSERT INTO `empsalary` VALUES ('40', '39', '4');
INSERT INTO `empsalary` VALUES ('41', '40', '4');
INSERT INTO `empsalary` VALUES ('42', '41', '5');
INSERT INTO `empsalary` VALUES ('43', '42', '5');
INSERT INTO `empsalary` VALUES ('44', '43', '5');
INSERT INTO `empsalary` VALUES ('45', '44', '5');
INSERT INTO `empsalary` VALUES ('46', '45', '5');
INSERT INTO `empsalary` VALUES ('47', '46', '5');
INSERT INTO `empsalary` VALUES ('48', '47', '5');
INSERT INTO `empsalary` VALUES ('49', '48', '5');
INSERT INTO `empsalary` VALUES ('50', '49', '5');
INSERT INTO `empsalary` VALUES ('51', '50', '5');
INSERT INTO `empsalary` VALUES ('52', '1', '2');
INSERT INTO `empsalary` VALUES ('53', '3', '3');
INSERT INTO `empsalary` VALUES ('54', '11', '1');
INSERT INTO `empsalary` VALUES ('55', '23', '1');
INSERT INTO `empsalary` VALUES ('56', '52', '6');
INSERT INTO `empsalary` VALUES ('57', '51', '6');
INSERT INTO `empsalary` VALUES ('58', '53', '6');
INSERT INTO `empsalary` VALUES ('59', '54', '6');
INSERT INTO `empsalary` VALUES ('60', '55', '6');
INSERT INTO `empsalary` VALUES ('61', '56', '6');
INSERT INTO `empsalary` VALUES ('62', '57', '6');
INSERT INTO `empsalary` VALUES ('63', '58', '6');
INSERT INTO `empsalary` VALUES ('64', '59', '6');
INSERT INTO `empsalary` VALUES ('65', '60', '6');
INSERT INTO `empsalary` VALUES ('66', '61', '1');

-- ----------------------------
-- Table structure for `hr`
-- ----------------------------
DROP TABLE IF EXISTS `hr`;
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

-- ----------------------------
-- Records of hr
-- ----------------------------
INSERT INTO `hr` VALUES ('1', '系统管理员', '13433611935', '0754-82521122', '奥利给省奥利给市奥利给区奥利给镇奥利给街', '1', 'admin', '$2a$10$UWmALT9KLFGI2vxAMwKWJOQeRGl/4G3O8MnUWXp23h0nykFUsKW3e', '/hrCenter/image/1-1576892338607-0.jpg', '奥利给');
INSERT INTO `hr` VALUES ('2', '苏用恒', '13433635079', null, '广东省湛江市', '1', 'syh', '$2a$10$7sCI52wB.RJZ3g3gitZzQ.X7EYnPr3GLlyus2oQZy91PDG8aGohhe', '/hrCenter/image/2-1578034886474-syh.jpg', '该用户太懒，还没设置备注');
INSERT INTO `hr` VALUES ('3', '林泽荣', '13433611935', '0754-82521123', '广东省汕头市', '1', 'lzr', '$2a$10$pZlx.XhXiLelhN7EXdXUiuDgV9I/Y/dOQeKstAFnWkpQ7WtCU.ebS', '/hrCenter/image/3-1578034684042-lzr.jpg', '啊荣的备注');
INSERT INTO `hr` VALUES ('4', '詹宗汉', null, null, '广东省茂名市', '1', 'zzh', '$2a$10$BSCx/4p3e.dA2Pcqefdcke8eZPTeQuOA0KoLokk.zdN4s7KLo6l0m', '/hrCenter/image/4-1578035202379-zzh.jpg', '该用户太懒，还没设置备注');
INSERT INTO `hr` VALUES ('5', '崔洪铭', null, null, '广东省茂名市', '1', 'chm', '$2a$10$/D/WqlPTXKM/HtCUUKvNqelgSWMm6tXhybOtmD5C0T1l7xrIr7BDa', '/hrCenter/image/default_userface.jpg', '该用户太懒，还没设置备注');
INSERT INTO `hr` VALUES ('6', '许可翔', null, null, '广东省深圳市', '1', 'xkx', '$2a$10$yDocgsd.2TeR3neDEkjynuLUyziEtCkO6GT62qwtkO4eo3BIqFDBu', '/hrCenter/image/default_userface.jpg', '该用户太懒，还没设置备注');

-- ----------------------------
-- Table structure for `hr_role`
-- ----------------------------
DROP TABLE IF EXISTS `hr_role`;
CREATE TABLE `hr_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hrid` int(11) DEFAULT NULL,
  `rid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`),
  KEY `hr_role_ibfk_1` (`hrid`),
  CONSTRAINT `hr_role_ibfk_1` FOREIGN KEY (`hrid`) REFERENCES `hr` (`id`) ON DELETE CASCADE,
  CONSTRAINT `hr_role_ibfk_2` FOREIGN KEY (`rid`) REFERENCES `role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hr_role
-- ----------------------------
INSERT INTO `hr_role` VALUES ('1', '1', '1');
INSERT INTO `hr_role` VALUES ('2', '2', '1');
INSERT INTO `hr_role` VALUES ('3', '3', '1');
INSERT INTO `hr_role` VALUES ('4', '4', '2');
INSERT INTO `hr_role` VALUES ('5', '5', '2');
INSERT INTO `hr_role` VALUES ('6', '6', '2');

-- ----------------------------
-- Table structure for `joblevel`
-- ----------------------------
DROP TABLE IF EXISTS `joblevel`;
CREATE TABLE `joblevel` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '职称编号',
  `name` varchar(32) DEFAULT NULL COMMENT '职称名称',
  `titleLevel` enum('正高级','副高级','中级','初级','员级') DEFAULT NULL COMMENT '职称等级',
  `createDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `enabled` tinyint(1) DEFAULT '1' COMMENT '启用状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of joblevel
-- ----------------------------
INSERT INTO `joblevel` VALUES ('1', '教授', '正高级', '2018-01-11 21:19:14', '1');
INSERT INTO `joblevel` VALUES ('2', '副教授', '副高级', '2018-01-11 21:19:20', '1');
INSERT INTO `joblevel` VALUES ('3', '讲师', '中级', '2018-01-11 22:42:12', '1');
INSERT INTO `joblevel` VALUES ('4', '助教', '初级', '2018-01-11 21:35:39', '1');
INSERT INTO `joblevel` VALUES ('5', '初级工程师', '初级', '2018-01-14 16:18:50', '1');
INSERT INTO `joblevel` VALUES ('6', '中级工程师', '中级', '2018-01-14 16:19:00', '1');
INSERT INTO `joblevel` VALUES ('7', '高级工程师', '副高级', '2018-01-14 16:19:14', '1');
INSERT INTO `joblevel` VALUES ('8', '骨灰级工程师', '正高级', '2018-01-14 16:19:24', '1');

-- ----------------------------
-- Table structure for `menu`
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
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

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('1', '/', null, null, '所有', null, null, null, null, '1');
INSERT INTO `menu` VALUES ('2', '/', '/home', 'Home', '员工资料', 'fa fa-user-circle-o', null, '1', '1', '1');
INSERT INTO `menu` VALUES ('3', '/', '/home', 'Home', '人事管理', 'fa fa-address-card-o', null, '1', '1', '1');
INSERT INTO `menu` VALUES ('4', '/', '/home', 'Home', '薪资管理', 'fa fa-money', null, '1', '1', '1');
INSERT INTO `menu` VALUES ('5', '/', '/home', 'Home', '统计管理', 'fa fa-bar-chart', null, '1', '1', '1');
INSERT INTO `menu` VALUES ('6', '/', '/home', 'Home', '系统管理', 'fa fa-windows', null, '1', '1', '1');
INSERT INTO `menu` VALUES ('7', '/employee/basic/**', '/emp/basic', 'EmpBasic', '基本资料', null, null, '1', '2', '1');
INSERT INTO `menu` VALUES ('8', '/personnel/rp/**', '/per/rp', 'PerRp', '员工奖惩', null, null, '1', '3', '1');
INSERT INTO `menu` VALUES ('9', '/personnel/remove/**', '/per/mv', 'PerMv', '员工调动', null, null, '1', '3', '1');
INSERT INTO `menu` VALUES ('10', '/salary/sob/**', '/sal/sob', 'SalSob', '薪资账套管理', null, null, '1', '4', '1');
INSERT INTO `menu` VALUES ('11', '/salary/sobcfg/**', '/sal/sobcfg', 'SalSobCfg', '员工账套设置', null, null, '1', '4', '1');
INSERT INTO `menu` VALUES ('12', '/salary/waiting/**', '/sal/waiting', 'SalWaiting', '待发薪资管理', null, null, '1', '4', '1');
INSERT INTO `menu` VALUES ('13', '/salary/history/**', '/sal/history', 'SalHistory', '历史薪资查询', null, null, '1', '4', '1');
INSERT INTO `menu` VALUES ('14', '/statistics/salary/**', '/sta/salary', 'StaSalary', '员工薪资统计', null, null, '1', '5', '1');
INSERT INTO `menu` VALUES ('15', '/statistics/score/**', '/sta/score', 'StaScore', '员工积分统计', null, null, '1', '5', '1');
INSERT INTO `menu` VALUES ('16', '/statistics/record/**', '/sta/record', 'StaRecord', '人事调动统计', null, null, '1', '5', '1');
INSERT INTO `menu` VALUES ('17', '/system/basic/**', '/sys/basic', 'SysBasic', '基础信息设置', null, null, '1', '6', '1');
INSERT INTO `menu` VALUES ('18', '/system/hr/**', '/sys/hr', 'SysHr', '操作员管理', null, null, '1', '6', '1');
INSERT INTO `menu` VALUES ('19', '/system/data/**', '/sys/data', 'SysData', '备份恢复数据库', null, null, '1', '6', '1');

-- ----------------------------
-- Table structure for `menu_role`
-- ----------------------------
DROP TABLE IF EXISTS `menu_role`;
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

-- ----------------------------
-- Records of menu_role
-- ----------------------------
INSERT INTO `menu_role` VALUES ('1', '1', '1');
INSERT INTO `menu_role` VALUES ('2', '2', '1');
INSERT INTO `menu_role` VALUES ('3', '3', '1');
INSERT INTO `menu_role` VALUES ('4', '4', '1');
INSERT INTO `menu_role` VALUES ('5', '5', '1');
INSERT INTO `menu_role` VALUES ('6', '6', '1');
INSERT INTO `menu_role` VALUES ('7', '7', '1');
INSERT INTO `menu_role` VALUES ('8', '8', '1');
INSERT INTO `menu_role` VALUES ('9', '9', '1');
INSERT INTO `menu_role` VALUES ('10', '10', '1');
INSERT INTO `menu_role` VALUES ('11', '11', '1');
INSERT INTO `menu_role` VALUES ('12', '12', '1');
INSERT INTO `menu_role` VALUES ('13', '13', '1');
INSERT INTO `menu_role` VALUES ('14', '14', '1');
INSERT INTO `menu_role` VALUES ('15', '15', '1');
INSERT INTO `menu_role` VALUES ('16', '16', '1');
INSERT INTO `menu_role` VALUES ('17', '17', '1');
INSERT INTO `menu_role` VALUES ('18', '18', '1');
INSERT INTO `menu_role` VALUES ('19', '19', '1');
INSERT INTO `menu_role` VALUES ('20', '7', '2');
INSERT INTO `menu_role` VALUES ('21', '8', '2');
INSERT INTO `menu_role` VALUES ('22', '9', '2');
INSERT INTO `menu_role` VALUES ('23', '10', '2');
INSERT INTO `menu_role` VALUES ('24', '11', '2');
INSERT INTO `menu_role` VALUES ('25', '12', '2');
INSERT INTO `menu_role` VALUES ('26', '13', '2');
INSERT INTO `menu_role` VALUES ('27', '14', '2');
INSERT INTO `menu_role` VALUES ('28', '15', '2');
INSERT INTO `menu_role` VALUES ('29', '16', '2');
INSERT INTO `menu_role` VALUES ('30', '7', '3');
INSERT INTO `menu_role` VALUES ('31', '8', '3');
INSERT INTO `menu_role` VALUES ('32', '9', '3');

-- ----------------------------
-- Table structure for `msgcontent`
-- ----------------------------
DROP TABLE IF EXISTS `msgcontent`;
CREATE TABLE `msgcontent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `createDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of msgcontent
-- ----------------------------

-- ----------------------------
-- Table structure for `nation`
-- ----------------------------
DROP TABLE IF EXISTS `nation`;
CREATE TABLE `nation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nation
-- ----------------------------
INSERT INTO `nation` VALUES ('1', '汉族');
INSERT INTO `nation` VALUES ('2', '蒙古族');
INSERT INTO `nation` VALUES ('3', '回族');
INSERT INTO `nation` VALUES ('4', '藏族');
INSERT INTO `nation` VALUES ('5', '维吾尔族');
INSERT INTO `nation` VALUES ('6', '苗族');
INSERT INTO `nation` VALUES ('7', '彝族');
INSERT INTO `nation` VALUES ('8', '壮族');
INSERT INTO `nation` VALUES ('9', '布依族');
INSERT INTO `nation` VALUES ('10', '朝鲜族');
INSERT INTO `nation` VALUES ('11', '满族');
INSERT INTO `nation` VALUES ('12', '侗族');
INSERT INTO `nation` VALUES ('13', '瑶族');
INSERT INTO `nation` VALUES ('14', '白族');
INSERT INTO `nation` VALUES ('15', '土家族');
INSERT INTO `nation` VALUES ('16', '哈尼族');
INSERT INTO `nation` VALUES ('17', '哈萨克族');
INSERT INTO `nation` VALUES ('18', '傣族');
INSERT INTO `nation` VALUES ('19', '黎族');
INSERT INTO `nation` VALUES ('20', '傈僳族');
INSERT INTO `nation` VALUES ('21', '佤族');
INSERT INTO `nation` VALUES ('22', '畲族');
INSERT INTO `nation` VALUES ('23', '高山族');
INSERT INTO `nation` VALUES ('24', '拉祜族');
INSERT INTO `nation` VALUES ('25', '水族');
INSERT INTO `nation` VALUES ('26', '东乡族');
INSERT INTO `nation` VALUES ('27', '纳西族');
INSERT INTO `nation` VALUES ('28', '景颇族');
INSERT INTO `nation` VALUES ('29', '柯尔克孜族');
INSERT INTO `nation` VALUES ('30', '土族');
INSERT INTO `nation` VALUES ('31', '达斡尔族');
INSERT INTO `nation` VALUES ('32', '仫佬族');
INSERT INTO `nation` VALUES ('33', '羌族');
INSERT INTO `nation` VALUES ('34', '布朗族');
INSERT INTO `nation` VALUES ('35', '撒拉族');
INSERT INTO `nation` VALUES ('36', '毛难族');
INSERT INTO `nation` VALUES ('37', '仡佬族');
INSERT INTO `nation` VALUES ('38', '锡伯族');
INSERT INTO `nation` VALUES ('39', '阿昌族');
INSERT INTO `nation` VALUES ('40', '普米族');
INSERT INTO `nation` VALUES ('41', '塔吉克族');
INSERT INTO `nation` VALUES ('42', '怒族');
INSERT INTO `nation` VALUES ('43', '乌孜别克族');
INSERT INTO `nation` VALUES ('44', '俄罗斯族');
INSERT INTO `nation` VALUES ('45', '鄂温克族');
INSERT INTO `nation` VALUES ('46', '崩龙族');
INSERT INTO `nation` VALUES ('47', '保安族');
INSERT INTO `nation` VALUES ('48', '裕固族');
INSERT INTO `nation` VALUES ('49', '京族');
INSERT INTO `nation` VALUES ('50', '塔塔尔族');
INSERT INTO `nation` VALUES ('51', '独龙族');
INSERT INTO `nation` VALUES ('52', '鄂伦春族');
INSERT INTO `nation` VALUES ('53', '赫哲族');
INSERT INTO `nation` VALUES ('54', '门巴族');
INSERT INTO `nation` VALUES ('55', '珞巴族');
INSERT INTO `nation` VALUES ('56', '基诺族');

-- ----------------------------
-- Table structure for `politicsstatus`
-- ----------------------------
DROP TABLE IF EXISTS `politicsstatus`;
CREATE TABLE `politicsstatus` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '政治面貌编号',
  `name` varchar(32) DEFAULT NULL COMMENT '政治面貌名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of politicsstatus
-- ----------------------------
INSERT INTO `politicsstatus` VALUES ('1', '中共党员');
INSERT INTO `politicsstatus` VALUES ('2', '中共预备党员');
INSERT INTO `politicsstatus` VALUES ('3', '共青团员');
INSERT INTO `politicsstatus` VALUES ('4', '民革党员');
INSERT INTO `politicsstatus` VALUES ('5', '民盟盟员');
INSERT INTO `politicsstatus` VALUES ('6', '民建会员');
INSERT INTO `politicsstatus` VALUES ('7', '民进会员');
INSERT INTO `politicsstatus` VALUES ('8', '农工党党员');
INSERT INTO `politicsstatus` VALUES ('9', '致公党党员');
INSERT INTO `politicsstatus` VALUES ('10', '九三学社社员');
INSERT INTO `politicsstatus` VALUES ('11', '台盟盟员');
INSERT INTO `politicsstatus` VALUES ('12', '无党派人士');
INSERT INTO `politicsstatus` VALUES ('13', '群众');

-- ----------------------------
-- Table structure for `position`
-- ----------------------------
DROP TABLE IF EXISTS `position`;
CREATE TABLE `position` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL COMMENT '职位',
  `createDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `enabled` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of position
-- ----------------------------
INSERT INTO `position` VALUES ('1', '总经理', '2018-01-11 21:13:42', '1');
INSERT INTO `position` VALUES ('2', '研发部经理', '2018-01-11 21:13:48', '1');
INSERT INTO `position` VALUES ('3', '测试部经理', '2018-01-11 21:13:48', '1');
INSERT INTO `position` VALUES ('4', '设计部经理', '2018-01-11 21:13:48', '1');
INSERT INTO `position` VALUES ('5', '策划部经理', '2018-01-11 21:13:48', '1');
INSERT INTO `position` VALUES ('6', '运营部经理', '2018-01-11 21:13:48', '1');
INSERT INTO `position` VALUES ('7', '编辑部经理', '2018-01-11 21:13:48', '1');
INSERT INTO `position` VALUES ('8', '市场部经理', '2018-01-11 21:13:48', '1');
INSERT INTO `position` VALUES ('9', '客服部经理', '2018-01-11 21:13:48', '1');
INSERT INTO `position` VALUES ('10', '研发工程师', '2018-01-11 21:13:56', '1');
INSERT INTO `position` VALUES ('11', '测试工程师', '2018-01-11 21:35:07', '1');
INSERT INTO `position` VALUES ('12', '设计工程师', '2018-01-14 16:07:11', '1');
INSERT INTO `position` VALUES ('13', '策划员', '2018-01-14 16:11:41', '1');
INSERT INTO `position` VALUES ('14', '运营工程师', '2018-01-11 21:13:56', '1');
INSERT INTO `position` VALUES ('15', '编辑', '2018-01-11 21:35:07', '1');
INSERT INTO `position` VALUES ('16', '市场调查员', '2018-01-14 16:07:11', '1');
INSERT INTO `position` VALUES ('17', '客服', '2018-01-14 16:11:41', '1');

-- ----------------------------
-- Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `nameZh` varchar(64) DEFAULT NULL COMMENT '角色名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', 'ROLE_admin', '系统管理员');
INSERT INTO `role` VALUES ('2', 'ROLE_manager', '人事经理');
INSERT INTO `role` VALUES ('3', 'ROLE_operator', '操作员');

-- ----------------------------
-- Table structure for `salary`
-- ----------------------------
DROP TABLE IF EXISTS `salary`;
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

-- ----------------------------
-- Records of salary
-- ----------------------------
INSERT INTO `salary` VALUES ('1', '研发部薪资账套', '8000.00', '2000.00', '100.00', '100.00', '2000.00', '0.08', '2000.00', '0.08', '2000.00', '0.08', '9720.00', '2020-01-03 00:00:00');
INSERT INTO `salary` VALUES ('2', '测试部薪资账套', '12000.00', '2000.00', '800.00', '1000.00', '4000.00', '0.07', '4000.00', '0.07', '4000.00', '0.07', '14960.00', '2020-01-01 00:00:00');
INSERT INTO `salary` VALUES ('3', '设计部工资账套', '10000.00', '3000.00', '800.00', '500.00', '4000.00', '0.07', '4000.00', '0.07', '4000.00', '0.07', '13460.00', '2020-01-01 00:00:00');
INSERT INTO `salary` VALUES ('4', '策划部薪资账套', '9000.00', '1000.00', '800.00', '800.00', '2000.00', '0.07', '2000.00', '0.07', '2000.00', '0.07', '11180.00', '2020-01-01 00:00:00');
INSERT INTO `salary` VALUES ('5', '运营部薪资账套', '10000.00', '1500.00', '800.00', '600.00', '2000.00', '0.07', '2000.00', '0.07', '2000.00', '0.07', '12480.00', '2020-01-01 00:00:00');
INSERT INTO `salary` VALUES ('6', '编辑部薪资账套', '12000.00', '2000.00', '800.00', '600.00', '2000.00', '0.07', '2000.00', '0.07', '2000.00', '0.07', '14980.00', '2020-01-01 00:00:00');
INSERT INTO `salary` VALUES ('7', '市场部薪资账套', '8000.00', '4000.00', '800.00', '800.00', '4000.00', '0.07', '4000.00', '0.07', '4000.00', '0.07', '12760.00', '2020-01-01 00:00:00');
INSERT INTO `salary` VALUES ('8', '客服部薪资账套', '8000.00', '3000.00', '800.00', '600.00', '4000.00', '0.07', '4000.00', '0.07', '4000.00', '0.07', '11560.00', '2020-01-01 00:00:00');

-- ----------------------------
-- Table structure for `salarysum`
-- ----------------------------
DROP TABLE IF EXISTS `salarysum`;
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

-- ----------------------------
-- Records of salarysum
-- ----------------------------
INSERT INTO `salarysum` VALUES ('1', '2', '17880.00', '3000.00', '0.00', '20880.00', '2019-01-01', '0');
INSERT INTO `salarysum` VALUES ('2', '4', '17880.00', '3000.00', '0.00', '20880.00', '2019-01-01', '0');
INSERT INTO `salarysum` VALUES ('3', '5', '17880.00', '3000.00', '0.00', '20880.00', '2019-01-01', '0');
INSERT INTO `salarysum` VALUES ('4', '6', '17880.00', '3000.00', '0.00', '20880.00', '2019-01-01', '0');
INSERT INTO `salarysum` VALUES ('5', '7', '17880.00', '3000.00', '0.00', '20880.00', '2019-01-01', '0');
INSERT INTO `salarysum` VALUES ('6', '8', '17880.00', '3000.00', '400.00', '21280.00', '2019-01-01', '0');
INSERT INTO `salarysum` VALUES ('7', '9', '17880.00', '3000.00', '0.00', '20880.00', '2019-01-01', '0');
INSERT INTO `salarysum` VALUES ('8', '10', '17880.00', '3000.00', '0.00', '20880.00', '2019-01-01', '0');
INSERT INTO `salarysum` VALUES ('9', '11', '17880.00', '3000.00', '0.00', '20880.00', '2019-01-01', '0');
INSERT INTO `salarysum` VALUES ('10', '23', '17880.00', '2500.00', '0.00', '20380.00', '2019-01-01', '0');
INSERT INTO `salarysum` VALUES ('11', '1', '14960.00', '2500.00', '0.00', '17460.00', '2019-01-01', '0');
INSERT INTO `salarysum` VALUES ('12', '12', '14960.00', '2500.00', '0.00', '17460.00', '2019-01-01', '0');
INSERT INTO `salarysum` VALUES ('13', '13', '14960.00', '2500.00', '0.00', '17460.00', '2019-01-01', '0');
INSERT INTO `salarysum` VALUES ('14', '14', '14960.00', '2500.00', '0.00', '17460.00', '2019-01-01', '0');
INSERT INTO `salarysum` VALUES ('15', '15', '14960.00', '2500.00', '0.00', '17460.00', '2019-01-01', '0');
INSERT INTO `salarysum` VALUES ('16', '16', '14960.00', '2500.00', '0.00', '17460.00', '2019-01-01', '0');
INSERT INTO `salarysum` VALUES ('17', '17', '14960.00', '2500.00', '0.00', '17460.00', '2019-01-01', '0');
INSERT INTO `salarysum` VALUES ('18', '18', '14960.00', '2500.00', '0.00', '17460.00', '2019-01-01', '0');
INSERT INTO `salarysum` VALUES ('19', '19', '14960.00', '2500.00', '0.00', '17460.00', '2019-01-01', '0');
INSERT INTO `salarysum` VALUES ('20', '20', '14960.00', '2500.00', '0.00', '17460.00', '2019-01-01', '0');
INSERT INTO `salarysum` VALUES ('21', '3', '13460.00', '2000.00', '0.00', '15460.00', '2019-01-01', '0');
INSERT INTO `salarysum` VALUES ('22', '21', '13460.00', '2000.00', '0.00', '15460.00', '2019-01-01', '0');
INSERT INTO `salarysum` VALUES ('23', '22', '13460.00', '2000.00', '0.00', '15460.00', '2019-01-01', '0');
INSERT INTO `salarysum` VALUES ('24', '24', '13460.00', '2000.00', '0.00', '15460.00', '2019-01-01', '0');
INSERT INTO `salarysum` VALUES ('25', '25', '13460.00', '2000.00', '0.00', '15460.00', '2019-01-01', '0');
INSERT INTO `salarysum` VALUES ('26', '26', '13460.00', '2000.00', '0.00', '15460.00', '2019-01-01', '0');
INSERT INTO `salarysum` VALUES ('27', '27', '13460.00', '2000.00', '0.00', '15460.00', '2019-01-01', '0');
INSERT INTO `salarysum` VALUES ('28', '28', '13460.00', '2000.00', '0.00', '15460.00', '2019-01-01', '0');
INSERT INTO `salarysum` VALUES ('29', '29', '13460.00', '2000.00', '0.00', '15460.00', '2019-01-01', '0');
INSERT INTO `salarysum` VALUES ('30', '30', '13460.00', '2000.00', '0.00', '15460.00', '2019-01-01', '0');
INSERT INTO `salarysum` VALUES ('31', '31', '11180.00', '1000.00', '0.00', '12180.00', '2019-01-01', '0');
INSERT INTO `salarysum` VALUES ('32', '32', '11180.00', '1000.00', '0.00', '12180.00', '2019-01-01', '0');
INSERT INTO `salarysum` VALUES ('33', '33', '11180.00', '1000.00', '0.00', '12180.00', '2019-01-01', '0');
INSERT INTO `salarysum` VALUES ('34', '34', '11180.00', '1000.00', '0.00', '12180.00', '2019-01-01', '0');
INSERT INTO `salarysum` VALUES ('35', '35', '11180.00', '1000.00', '0.00', '12180.00', '2019-01-01', '0');
INSERT INTO `salarysum` VALUES ('36', '36', '11180.00', '1000.00', '0.00', '12180.00', '2019-01-01', '0');
INSERT INTO `salarysum` VALUES ('37', '37', '11180.00', '1000.00', '0.00', '12180.00', '2019-01-01', '0');
INSERT INTO `salarysum` VALUES ('38', '38', '11180.00', '1000.00', '0.00', '12180.00', '2019-01-01', '0');
INSERT INTO `salarysum` VALUES ('39', '39', '11180.00', '1000.00', '0.00', '12180.00', '2019-01-01', '0');
INSERT INTO `salarysum` VALUES ('40', '40', '11180.00', '1000.00', '0.00', '12180.00', '2019-01-01', '0');
INSERT INTO `salarysum` VALUES ('41', '2', '17880.00', '2800.00', '0.00', '20680.00', '2019-02-01', '0');
INSERT INTO `salarysum` VALUES ('42', '4', '17880.00', '2800.00', '0.00', '20680.00', '2019-02-01', '0');
INSERT INTO `salarysum` VALUES ('43', '5', '17880.00', '2800.00', '0.00', '20680.00', '2019-02-01', '0');
INSERT INTO `salarysum` VALUES ('44', '6', '17880.00', '2800.00', '0.00', '20680.00', '2019-02-01', '0');
INSERT INTO `salarysum` VALUES ('45', '7', '17880.00', '2800.00', '0.00', '20680.00', '2019-02-01', '0');
INSERT INTO `salarysum` VALUES ('46', '8', '17880.00', '2800.00', '240.00', '20920.00', '2019-02-01', '0');
INSERT INTO `salarysum` VALUES ('47', '9', '17880.00', '2800.00', '0.00', '20680.00', '2019-02-01', '0');
INSERT INTO `salarysum` VALUES ('48', '10', '17880.00', '2800.00', '0.00', '20680.00', '2019-02-01', '0');
INSERT INTO `salarysum` VALUES ('49', '11', '17880.00', '2800.00', '0.00', '20680.00', '2019-02-01', '0');
INSERT INTO `salarysum` VALUES ('50', '23', '17880.00', '2300.00', '0.00', '20180.00', '2019-02-01', '0');
INSERT INTO `salarysum` VALUES ('51', '2', '17880.00', '4000.00', '0.00', '21880.00', '2019-03-01', '0');
INSERT INTO `salarysum` VALUES ('52', '4', '17880.00', '4000.00', '0.00', '21880.00', '2019-03-01', '0');
INSERT INTO `salarysum` VALUES ('53', '5', '17880.00', '4000.00', '0.00', '21880.00', '2019-03-01', '0');
INSERT INTO `salarysum` VALUES ('54', '6', '17880.00', '4000.00', '0.00', '21880.00', '2019-03-01', '0');
INSERT INTO `salarysum` VALUES ('55', '7', '17880.00', '4000.00', '0.00', '21880.00', '2019-03-01', '0');
INSERT INTO `salarysum` VALUES ('56', '8', '17880.00', '4000.00', '110.00', '21990.00', '2019-03-01', '0');
INSERT INTO `salarysum` VALUES ('57', '9', '17880.00', '4000.00', '0.00', '21880.00', '2019-03-01', '0');
INSERT INTO `salarysum` VALUES ('58', '10', '17880.00', '4000.00', '0.00', '21880.00', '2019-03-01', '0');
INSERT INTO `salarysum` VALUES ('59', '11', '17880.00', '4000.00', '0.00', '21880.00', '2019-03-01', '0');
INSERT INTO `salarysum` VALUES ('60', '23', '17880.00', '3500.00', '0.00', '21380.00', '2019-03-01', '0');
INSERT INTO `salarysum` VALUES ('61', '2', '23580.00', '1500.00', '0.00', '25080.00', '2019-05-01', '0');
INSERT INTO `salarysum` VALUES ('62', '4', '23580.00', '3000.00', '0.00', '26580.00', '2019-05-01', '0');
INSERT INTO `salarysum` VALUES ('63', '5', '23580.00', '3000.00', '0.00', '26580.00', '2019-05-01', '0');
INSERT INTO `salarysum` VALUES ('64', '6', '23580.00', '2000.00', '0.00', '25580.00', '2019-05-01', '0');
INSERT INTO `salarysum` VALUES ('65', '7', '23580.00', '3000.00', '0.00', '26580.00', '2019-05-01', '0');
INSERT INTO `salarysum` VALUES ('66', '8', '23580.00', '3000.00', '200.00', '26780.00', '2019-05-01', '0');
INSERT INTO `salarysum` VALUES ('67', '9', '23580.00', '3000.00', '0.00', '26580.00', '2019-05-01', '0');
INSERT INTO `salarysum` VALUES ('68', '10', '23580.00', '1500.00', '0.00', '25080.00', '2019-05-01', '0');
INSERT INTO `salarysum` VALUES ('69', '11', '23580.00', '3000.00', '0.00', '26580.00', '2019-05-01', '0');
INSERT INTO `salarysum` VALUES ('70', '23', '23580.00', '2500.00', '0.00', '26080.00', '2019-05-01', '0');
INSERT INTO `salarysum` VALUES ('71', '2', '23580.00', '150.00', '0.00', '23730.00', '2020-04-01', '0');
INSERT INTO `salarysum` VALUES ('72', '4', '23580.00', '300.00', '0.00', '23880.00', '2020-04-01', '0');
INSERT INTO `salarysum` VALUES ('73', '5', '23580.00', '300.00', '0.00', '23880.00', '2020-04-01', '0');
INSERT INTO `salarysum` VALUES ('74', '6', '23580.00', '200.00', '0.00', '23780.00', '2020-04-01', '0');
INSERT INTO `salarysum` VALUES ('75', '7', '23580.00', '300.00', '0.00', '23880.00', '2020-04-01', '0');
INSERT INTO `salarysum` VALUES ('76', '8', '23580.00', '300.00', '0.00', '23880.00', '2020-04-01', '0');
INSERT INTO `salarysum` VALUES ('77', '9', '23580.00', '300.00', '0.00', '23880.00', '2020-04-01', '0');
INSERT INTO `salarysum` VALUES ('78', '10', '23580.00', '150.00', '0.00', '23730.00', '2020-04-01', '0');
INSERT INTO `salarysum` VALUES ('79', '11', '23580.00', '300.00', '0.00', '23880.00', '2020-04-01', '0');
INSERT INTO `salarysum` VALUES ('80', '23', '23580.00', '250.00', '0.00', '23830.00', '2020-04-01', '0');
INSERT INTO `salarysum` VALUES ('81', '2', '9720.00', '150.00', '0.00', '9870.00', '2019-04-01', '0');
INSERT INTO `salarysum` VALUES ('82', '4', '9720.00', '300.00', '0.00', '10020.00', '2019-04-01', '0');
INSERT INTO `salarysum` VALUES ('83', '5', '9720.00', '300.00', '0.00', '10020.00', '2019-04-01', '0');
INSERT INTO `salarysum` VALUES ('84', '6', '9720.00', '200.00', '0.00', '9920.00', '2019-04-01', '0');
INSERT INTO `salarysum` VALUES ('85', '7', '9720.00', '300.00', '0.00', '10020.00', '2019-04-01', '0');
INSERT INTO `salarysum` VALUES ('86', '8', '9720.00', '300.00', '200.00', '10220.00', '2019-04-01', '0');
INSERT INTO `salarysum` VALUES ('87', '9', '9720.00', '300.00', '0.00', '10020.00', '2019-04-01', '0');
INSERT INTO `salarysum` VALUES ('88', '10', '9720.00', '150.00', '0.00', '9870.00', '2019-04-01', '0');
INSERT INTO `salarysum` VALUES ('89', '11', '9720.00', '300.00', '0.00', '10020.00', '2019-04-01', '0');
INSERT INTO `salarysum` VALUES ('90', '23', '9720.00', '250.00', '0.00', '9970.00', '2019-04-01', '0');
INSERT INTO `salarysum` VALUES ('91', '2', '9720.00', '1400.00', '0.00', '11120.00', '2019-06-01', '0');
INSERT INTO `salarysum` VALUES ('92', '4', '9720.00', '2000.00', '0.00', '11720.00', '2019-06-01', '0');
INSERT INTO `salarysum` VALUES ('93', '5', '9720.00', '2000.00', '0.00', '11720.00', '2019-06-01', '0');
INSERT INTO `salarysum` VALUES ('94', '6', '9720.00', '1600.00', '0.00', '11320.00', '2019-06-01', '0');
INSERT INTO `salarysum` VALUES ('95', '7', '9720.00', '2000.00', '0.00', '11720.00', '2019-06-01', '0');
INSERT INTO `salarysum` VALUES ('96', '8', '9720.00', '2000.00', '0.00', '11720.00', '2019-06-01', '0');
INSERT INTO `salarysum` VALUES ('97', '9', '9720.00', '2000.00', '0.00', '11720.00', '2019-06-01', '0');
INSERT INTO `salarysum` VALUES ('98', '10', '9720.00', '1400.00', '0.00', '11120.00', '2019-06-01', '0');
INSERT INTO `salarysum` VALUES ('99', '11', '9720.00', '2000.00', '0.00', '11720.00', '2019-06-01', '0');
INSERT INTO `salarysum` VALUES ('100', '23', '9720.00', '1800.00', '0.00', '11520.00', '2019-06-01', '0');

-- ----------------------------
-- Table structure for `sqlfile`
-- ----------------------------
DROP TABLE IF EXISTS `sqlfile`;
CREATE TABLE `sqlfile` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '数据库备份编号',
  `name` varchar(255) DEFAULT NULL COMMENT '备份名称',
  `url` varchar(255) DEFAULT NULL COMMENT '备份路径',
  `createDate` date DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sqlfile
-- ----------------------------
INSERT INTO `sqlfile` VALUES ('1', 'ihr-sql-2020-01-03 14:10:32', 'ihr-sql-1578031832980.sql', '2020-01-03');
INSERT INTO `sqlfile` VALUES ('2', 'ihr-sql-2020-01-03 14:35:15', 'ihr-sql-1578033315692.sql', '2020-01-03');
INSERT INTO `sqlfile` VALUES ('3', 'ihr-sql-2020-01-03 14:45:07', 'ihr-sql-1578033907432.sql', '2020-01-03');
INSERT INTO `sqlfile` VALUES ('4', 'ihr-sql-2020-01-03 14:58:31', 'ihr-sql-1578034711698.sql', '2020-01-03');

-- ----------------------------
-- Table structure for `sysmsg`
-- ----------------------------
DROP TABLE IF EXISTS `sysmsg`;
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

-- ----------------------------
-- Records of sysmsg
-- ----------------------------

-- ----------------------------
-- Procedure structure for `addDep`
-- ----------------------------
DROP PROCEDURE IF EXISTS `addDep`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addDep`(in depName varchar(32),in parentId int,in enabled boolean,out result int,out result2 int)
begin
  declare did int;
  declare pDepPath varchar(64);
  insert into department set name=depName,parentId=parentId,enabled=enabled;
  select row_count() into result;
  select last_insert_id() into did;
  set result2=did;
  select depPath into pDepPath from department where id=parentId;
  update department set depPath=concat(pDepPath,'.',did) where id=did;
  update department set isParent=true where id=parentId;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `deleteDep`
-- ----------------------------
DROP PROCEDURE IF EXISTS `deleteDep`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteDep`(in did int,out result int)
begin
  declare ecount int;
  declare pid int;
  declare pcount int;
  select count(*) into ecount from employee where departmentId=did;
  if ecount>0 then set result=-1;
  else 
  select parentId into pid from department where id=did;
  delete from department where id=did and isParent=false;
  select row_count() into result;
  select count(*) into pcount from department where parentId=pid;
  if pcount=0 then update department set isParent=false where id=pid;
  end if;
  end if;
end
;;
DELIMITER ;

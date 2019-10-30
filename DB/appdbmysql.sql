-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: localhost    Database: appdb
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `member` (
  `Member_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Member_Num` varchar(50) DEFAULT NULL,
  `Member_Name` varchar(50) DEFAULT NULL,
  `Member_Phone` int(11) NOT NULL,
  `Member_Sex` varchar(50) DEFAULT NULL,
  `Member_Birthday` datetime DEFAULT NULL,
  `Member_Photo` varchar(200) DEFAULT NULL,
  `Member_UserID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Member_Introduce` longtext,
  `Member_FilePath` varchar(200) DEFAULT NULL,
  `Member_CreateTime` datetime NOT NULL,
  PRIMARY KEY (`Member_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES ('9A604AA2-9AE6-4A2F-8DDB-D9E0289EAD9E','1','测试会员',131231,'男','2018-04-25 00:00:00','/Content/UpFile/51446921-6121-4a53-b5f3-4ef26c1f82e0.jpg','A7EAE7AB-0DE4-4026-8DA9-6529F8A1C3E2','<p><img src=\"/Admin/lib/nUeditor/upload/image/20180802/6366881296663732469581226.jpg\" alt=\"p_big3.jpg\"/></p>','/Content/UpFile/fc0ef283-b8c1-4fcf-851c-51141a2be661.txt','2018-04-25 23:00:07'),('9F722F6F-24D9-4CCF-A387-CD3E939EDF4C','2','test',23213,'男','2018-08-20 00:00:00',NULL,NULL,'<p>12313撒旦发射点</p>',NULL,'2018-08-20 10:46:20');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_function`
--

DROP TABLE IF EXISTS `sys_function`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sys_function` (
  `Function_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'ID',
  `Function_Num` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '编号',
  `Function_Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '功能名称',
  `Function_ByName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '功能英文名',
  `Function_CreateTime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`Function_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='管理后台功能表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_function`
--

LOCK TABLES `sys_function` WRITE;
/*!40000 ALTER TABLE `sys_function` DISABLE KEYS */;
INSERT INTO `sys_function` VALUES ('2401F4D0-60B0-4E2E-903F-84C603373572','70','导出','GetExcel','2017-02-09 16:34:14'),('383E7EE2-7690-46AC-9230-65155C84AA30','50','保存','Save','2017-04-22 13:51:53'),('9C388461-2704-4C5E-A729-72C17E9018E1','40','删除','Delete','2016-06-20 13:40:52'),('BFFEFB1C-8988-4DDF-B4AC-81C2B30E80CD','20','添加','Add','2016-06-20 13:40:37'),('C9518758-B2E1-4F51-B517-5282E273889C','10','能否拥有该菜单','Have','2016-06-20 13:40:30'),('E7EF2A05-8317-41C3-B588-99519FE88BF9','30','修改','Edit','2016-06-20 13:40:43'),('F27ECB0A-197D-47B1-B243-59A8C71302BF','60','检索','Search','2017-02-16 17:06:23');
/*!40000 ALTER TABLE `sys_function` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_menu`
--

DROP TABLE IF EXISTS `sys_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sys_menu` (
  `Menu_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'ID',
  `Menu_Num` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '编号',
  `Menu_Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '菜单名称',
  `Menu_Url` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '地址',
  `Menu_Icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '菜单图标',
  `Menu_ParentID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '父级ID',
  `Menu_IsShow` int(11) DEFAULT NULL COMMENT '是否显示（1:是 2：否）',
  `Menu_CreateTime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`Menu_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='管理后台菜单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` VALUES ('1EC76C4C-B9B3-4517-9854-F08CD11D653D','A','基础信息',NULL,'fa fa-cubes',NULL,1,'2018-04-25 21:18:09'),('38D864FF-F6E7-43AF-8C5C-8BBCF9FA586D','Z-100','用户管理','/Admin/User/Index',NULL,'9591F249-1471-44F7-86B5-6FDAE8B93888',1,'2018-03-10 12:18:04'),('4CE21A81-1CAE-44D2-B29E-07058FF04B3E','Z-160','代码创建','/Admin/CreateCode/Index',NULL,'9591F249-1471-44F7-86B5-6FDAE8B93888',1,'2018-03-10 12:17:33'),('60AE9382-31AB-4276-A379-D3876E9BB783','Z-110','角色管理','/Admin/Role/Index',NULL,'9591F249-1471-44F7-86B5-6FDAE8B93888',1,'2018-03-10 12:18:55'),('7C34C2FD-98ED-4655-AA04-BB00B915A751','A-100','会员管理','/Admin/Member/Index?id=1',NULL,'1EC76C4C-B9B3-4517-9854-F08CD11D653D',1,'2018-04-25 21:36:29'),('9591F249-1471-44F7-86B5-6FDAE8B93888','Z','系统管理',NULL,'fa fa-desktop',NULL,1,'2018-03-10 12:16:39'),('BD024F3A-99A7-4407-861C-A016F243F222','Z-140','角色功能','/Admin/RoleFunction/Index',NULL,'9591F249-1471-44F7-86B5-6FDAE8B93888',1,'2018-03-10 12:18:47'),('D721FC55-2174-40EB-BB37-5C54A158525A','Z-120','功能管理','/Admin/Function/Index',NULL,'9591F249-1471-44F7-86B5-6FDAE8B93888',1,'2018-03-10 12:18:21'),('E5D4DA6B-AAB0-4AAA-982F-43673E8152C0','Z-130','菜单功能','/Admin/MenuFunction/Index',NULL,'9591F249-1471-44F7-86B5-6FDAE8B93888',1,'2018-03-10 12:18:34'),('F35D64AE-ECB7-4D06-ACFB-D91595966D9E','Z-150','修改密码','/Admin/ChangePwd/Index',NULL,'9591F249-1471-44F7-86B5-6FDAE8B93888',1,'2018-03-10 12:17:04');
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_menufunction`
--

DROP TABLE IF EXISTS `sys_menufunction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sys_menufunction` (
  `MenuFunction_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'ID',
  `MenuFunction_MenuID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '菜单ID',
  `MenuFunction_FunctionID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '功能ID',
  `MenuFunction_CreateTime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`MenuFunction_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='管理后台菜单功能绑定表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menufunction`
--

LOCK TABLES `sys_menufunction` WRITE;
/*!40000 ALTER TABLE `sys_menufunction` DISABLE KEYS */;
INSERT INTO `sys_menufunction` VALUES ('07C2FE76-789A-4D8F-BCE4-86CCC0402911','E5D4DA6B-AAB0-4AAA-982F-43673E8152C0','E7EF2A05-8317-41C3-B588-99519FE88BF9','2019-01-09 19:05:41'),('0E413B56-6A4C-4C0D-A9D4-0825FE718000','60AE9382-31AB-4276-A379-D3876E9BB783','E7EF2A05-8317-41C3-B588-99519FE88BF9','2019-01-10 10:53:10'),('10C6101E-D148-4D4C-8CAD-14CE82B217DB','7C34C2FD-98ED-4655-AA04-BB00B915A751','2401F4D0-60B0-4E2E-903F-84C603373572','2019-01-08 17:31:13'),('1D946995-6EB5-4B79-9B37-A8E982A53C57','7C34C2FD-98ED-4655-AA04-BB00B915A751','F27ECB0A-197D-47B1-B243-59A8C71302BF','2019-01-08 17:31:13'),('202074C0-EEA0-4CA0-880B-EB4A63AB259F','BD024F3A-99A7-4407-861C-A016F243F222','E7EF2A05-8317-41C3-B588-99519FE88BF9','2019-01-09 19:06:12'),('22F42CCB-C207-471A-B53F-ACBFBC8A5EB9','38D864FF-F6E7-43AF-8C5C-8BBCF9FA586D','C9518758-B2E1-4F51-B517-5282E273889C','2019-01-09 19:07:21'),('2D8D27B1-E7D7-4A51-A32D-D12EFBC15AE9','9591F249-1471-44F7-86B5-6FDAE8B93888','C9518758-B2E1-4F51-B517-5282E273889C','2019-01-08 18:04:12'),('4FF46A79-DE87-4E71-A7A8-2122D495193E','D721FC55-2174-40EB-BB37-5C54A158525A','383E7EE2-7690-46AC-9230-65155C84AA30','2019-01-09 19:05:53'),('5ACE268B-B027-41A4-AAF7-D4F2E61311C9','7C34C2FD-98ED-4655-AA04-BB00B915A751','C9518758-B2E1-4F51-B517-5282E273889C','2019-01-08 17:31:13'),('61F0E9AF-9597-4E47-80FB-7DD9C2552F0E','4CE21A81-1CAE-44D2-B29E-07058FF04B3E','383E7EE2-7690-46AC-9230-65155C84AA30','2019-01-09 19:06:29'),('749729EB-978E-4966-9A36-57F8D2A05270','D721FC55-2174-40EB-BB37-5C54A158525A','F27ECB0A-197D-47B1-B243-59A8C71302BF','2019-01-09 19:05:53'),('7781D4CC-F8AF-4B1E-B19E-64AF640B8F1C','D721FC55-2174-40EB-BB37-5C54A158525A','E7EF2A05-8317-41C3-B588-99519FE88BF9','2019-01-09 19:05:53'),('7861B618-0B12-4A56-ABDA-A5E8D17AC5D7','2FF9BB67-AA42-48CF-80C9-6D1CFB6B1EAD','BFFEFB1C-8988-4DDF-B4AC-81C2B30E80CD','2018-06-28 11:30:10'),('7B35A10A-6A54-43C0-986F-0F8FE5A8917D','7C34C2FD-98ED-4655-AA04-BB00B915A751','E7EF2A05-8317-41C3-B588-99519FE88BF9','2019-01-08 17:31:13'),('836FCEC0-F9B7-4F5E-8ED9-2D17EBF710D0','BD024F3A-99A7-4407-861C-A016F243F222','BFFEFB1C-8988-4DDF-B4AC-81C2B30E80CD','2019-01-09 19:06:12'),('847AE3DF-CEE2-4466-A32D-5FDA36C060AD','BD024F3A-99A7-4407-861C-A016F243F222','F27ECB0A-197D-47B1-B243-59A8C71302BF','2019-01-09 19:06:12'),('8551A032-F979-40AA-8C98-D77551871247','7C34C2FD-98ED-4655-AA04-BB00B915A751','383E7EE2-7690-46AC-9230-65155C84AA30','2019-01-08 17:31:13'),('8A94AC55-20F1-4030-9E6E-252F1D81AB05','60AE9382-31AB-4276-A379-D3876E9BB783','9C388461-2704-4C5E-A729-72C17E9018E1','2019-01-10 10:53:10'),('8D4E954E-AA6B-41D6-8985-CD28766F29F8','1EC76C4C-B9B3-4517-9854-F08CD11D653D','C9518758-B2E1-4F51-B517-5282E273889C','2019-01-08 18:04:08'),('8F7A00EB-C608-4477-9702-5CA20FE097E8','60AE9382-31AB-4276-A379-D3876E9BB783','383E7EE2-7690-46AC-9230-65155C84AA30','2019-01-10 10:53:10'),('943AE56B-C321-4D57-86F1-9F3BBA7FB824','38D864FF-F6E7-43AF-8C5C-8BBCF9FA586D','BFFEFB1C-8988-4DDF-B4AC-81C2B30E80CD','2019-01-09 19:07:21'),('979542E7-98E0-439C-B110-4E9817C13B90','D721FC55-2174-40EB-BB37-5C54A158525A','C9518758-B2E1-4F51-B517-5282E273889C','2019-01-09 19:05:53'),('985006AA-A95D-440E-9928-4DCC55084E74','D721FC55-2174-40EB-BB37-5C54A158525A','BFFEFB1C-8988-4DDF-B4AC-81C2B30E80CD','2019-01-09 19:05:53'),('99C0708E-A4AF-4A7E-B8C5-5B120BDE85CC','E5D4DA6B-AAB0-4AAA-982F-43673E8152C0','C9518758-B2E1-4F51-B517-5282E273889C','2019-01-09 19:05:40'),('9C377900-351E-404C-AA7B-08E5120B976A','BD024F3A-99A7-4407-861C-A016F243F222','9C388461-2704-4C5E-A729-72C17E9018E1','2019-01-09 19:06:12'),('9D685529-9601-4454-931A-016DBCBFAC54','38D864FF-F6E7-43AF-8C5C-8BBCF9FA586D','E7EF2A05-8317-41C3-B588-99519FE88BF9','2019-01-09 19:07:21'),('9E874B1E-D908-40C3-A0C2-3A78C1EEA5CF','4CE21A81-1CAE-44D2-B29E-07058FF04B3E','C9518758-B2E1-4F51-B517-5282E273889C','2019-01-09 19:06:29'),('A1F6E01A-65D7-4B68-9254-C31FD52EFA97','38D864FF-F6E7-43AF-8C5C-8BBCF9FA586D','9C388461-2704-4C5E-A729-72C17E9018E1','2019-01-09 19:07:21'),('B2D60366-7726-429A-BB6C-781EF131AA53','E5D4DA6B-AAB0-4AAA-982F-43673E8152C0','383E7EE2-7690-46AC-9230-65155C84AA30','2019-01-09 19:05:41'),('B4D748B7-F21E-4D9B-8E74-E54F059AAAD8','D721FC55-2174-40EB-BB37-5C54A158525A','9C388461-2704-4C5E-A729-72C17E9018E1','2019-01-09 19:05:53'),('BB14769D-4760-4341-9FAF-9FA82EEADA65','2FF9BB67-AA42-48CF-80C9-6D1CFB6B1EAD','E7EF2A05-8317-41C3-B588-99519FE88BF9','2018-06-28 11:30:10'),('BEE43B2C-0AED-4751-B184-026F1474F2CC','E5D4DA6B-AAB0-4AAA-982F-43673E8152C0','BFFEFB1C-8988-4DDF-B4AC-81C2B30E80CD','2019-01-09 19:05:41'),('BF4C8454-C6B0-4826-9275-77676E2503CE','60AE9382-31AB-4276-A379-D3876E9BB783','F27ECB0A-197D-47B1-B243-59A8C71302BF','2019-01-10 10:53:10'),('C00522B9-AF7D-4424-9FAB-AF920206B1BF','7C34C2FD-98ED-4655-AA04-BB00B915A751','9C388461-2704-4C5E-A729-72C17E9018E1','2019-01-08 17:31:13'),('C2D0FD0F-77CB-4964-929A-428D27A3F8D8','E5D4DA6B-AAB0-4AAA-982F-43673E8152C0','F27ECB0A-197D-47B1-B243-59A8C71302BF','2019-01-09 19:05:41'),('C3C5A9BA-7928-4465-85E2-8FD44931C353','F35D64AE-ECB7-4D06-ACFB-D91595966D9E','C9518758-B2E1-4F51-B517-5282E273889C','2019-01-09 19:06:21'),('CCC73748-BA19-488E-9137-FF59CE6A481A','60AE9382-31AB-4276-A379-D3876E9BB783','C9518758-B2E1-4F51-B517-5282E273889C','2019-01-10 10:53:10'),('DE247CD3-0CA6-4724-B3F5-84B8B095E7DA','E5D4DA6B-AAB0-4AAA-982F-43673E8152C0','9C388461-2704-4C5E-A729-72C17E9018E1','2019-01-09 19:05:41'),('E8F73A45-F06A-4748-A27F-EFBFB2AD9414','F35D64AE-ECB7-4D06-ACFB-D91595966D9E','383E7EE2-7690-46AC-9230-65155C84AA30','2019-01-09 19:06:21'),('EAE82607-9D18-48DD-A168-EDE9DAB9CC20','38D864FF-F6E7-43AF-8C5C-8BBCF9FA586D','383E7EE2-7690-46AC-9230-65155C84AA30','2019-01-09 19:07:21'),('EDEF6B11-C46E-4B92-9355-C07277B2E20A','60AE9382-31AB-4276-A379-D3876E9BB783','BFFEFB1C-8988-4DDF-B4AC-81C2B30E80CD','2019-01-10 10:53:10'),('F2CDD648-0223-4399-9F44-23D6AEF084B1','BD024F3A-99A7-4407-861C-A016F243F222','383E7EE2-7690-46AC-9230-65155C84AA30','2019-01-09 19:06:12'),('F7F7A920-C512-48C0-ACB4-8430DB8829F3','7C34C2FD-98ED-4655-AA04-BB00B915A751','BFFEFB1C-8988-4DDF-B4AC-81C2B30E80CD','2019-01-08 17:31:13'),('FA2E367D-5307-4A49-A15E-079D74D1B4F8','38D864FF-F6E7-43AF-8C5C-8BBCF9FA586D','F27ECB0A-197D-47B1-B243-59A8C71302BF','2019-01-09 19:07:21'),('FF85BB1D-72C1-4D62-8503-6622FF6A14CC','BD024F3A-99A7-4407-861C-A016F243F222','C9518758-B2E1-4F51-B517-5282E273889C','2019-01-09 19:06:12');
/*!40000 ALTER TABLE `sys_menufunction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_number`
--

DROP TABLE IF EXISTS `sys_number`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sys_number` (
  `Number_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Number_Num` varchar(50) DEFAULT NULL,
  `Number_DataBase` varchar(50) DEFAULT NULL,
  `Number_TableName` varchar(50) DEFAULT NULL,
  `Number_NumField` varchar(50) DEFAULT NULL,
  `Number_CreateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`Number_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_number`
--

LOCK TABLES `sys_number` WRITE;
/*!40000 ALTER TABLE `sys_number` DISABLE KEYS */;
INSERT INTO `sys_number` VALUES ('B5FCC999-85B9-4DCE-A3FC-64B43EF82F68','1',NULL,'Member','Member_Num','2018-04-25 23:00:04');
/*!40000 ALTER TABLE `sys_number` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sys_role` (
  `Role_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'ID',
  `Role_Num` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '编号',
  `Role_Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '角色名',
  `Role_Remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '备注',
  `Role_IsDelete` int(11) DEFAULT NULL COMMENT '是否可删除（1：是 2：否）',
  `Role_CreateTime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`Role_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='管理后台权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` VALUES ('18FA4771-6F58-46A3-80D2-6F0F5E9972E3','0001','超级管理员','拥有所有权限',2,'2016-06-20 10:20:10'),('40FF1844-C099-4061-98E0-CD6E544FCFD3','0002','普通用户',NULL,1,'2016-07-06 17:59:21');
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_rolemenufunction`
--

DROP TABLE IF EXISTS `sys_rolemenufunction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sys_rolemenufunction` (
  `RoleMenuFunction_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'ID',
  `RoleMenuFunction_RoleID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '角色ID',
  `RoleMenuFunction_FunctionID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '功能ID',
  `RoleMenuFunction_MenuID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '菜单ID',
  `RoleMenuFunction_CreateTime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`RoleMenuFunction_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='管理后台权限菜单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_rolemenufunction`
--

LOCK TABLES `sys_rolemenufunction` WRITE;
/*!40000 ALTER TABLE `sys_rolemenufunction` DISABLE KEYS */;
INSERT INTO `sys_rolemenufunction` VALUES ('032ccecd-2086-45d7-80c6-75e6008506e8','40FF1844-C099-4061-98E0-CD6E544FCFD3','F27ECB0A-197D-47B1-B243-59A8C71302BF','D721FC55-2174-40EB-BB37-5C54A158525A','2019-01-10 17:29:17'),('0b3f6e5f-5d60-48d3-ae9f-d3ed75d01d89','40FF1844-C099-4061-98E0-CD6E544FCFD3','E7EF2A05-8317-41C3-B588-99519FE88BF9','38D864FF-F6E7-43AF-8C5C-8BBCF9FA586D','2019-01-10 17:29:17'),('19cfd086-ce46-4eb9-9b5b-2c7aa6f439e7','40FF1844-C099-4061-98E0-CD6E544FCFD3','383E7EE2-7690-46AC-9230-65155C84AA30','E5D4DA6B-AAB0-4AAA-982F-43673E8152C0','2019-01-10 17:29:17'),('1a0a22ee-e70b-45b3-83c7-237189d8c6f0','40FF1844-C099-4061-98E0-CD6E544FCFD3','9C388461-2704-4C5E-A729-72C17E9018E1','7C34C2FD-98ED-4655-AA04-BB00B915A751','2019-01-10 17:29:17'),('1b5ec958-fcf8-480b-8caf-ee6a69b2c3e9','40FF1844-C099-4061-98E0-CD6E544FCFD3','BFFEFB1C-8988-4DDF-B4AC-81C2B30E80CD','7C34C2FD-98ED-4655-AA04-BB00B915A751','2019-01-10 17:29:17'),('1be0506a-87af-4004-a4ca-a0b31a80f6ed','40FF1844-C099-4061-98E0-CD6E544FCFD3','BFFEFB1C-8988-4DDF-B4AC-81C2B30E80CD','E5D4DA6B-AAB0-4AAA-982F-43673E8152C0','2019-01-10 17:29:17'),('1fec98b2-8d84-41fb-9c3d-782784478d5c','40FF1844-C099-4061-98E0-CD6E544FCFD3','E7EF2A05-8317-41C3-B588-99519FE88BF9','60AE9382-31AB-4276-A379-D3876E9BB783','2019-01-10 17:29:17'),('22c0cf43-0a32-4d2a-bd43-564c5064f3ba','40FF1844-C099-4061-98E0-CD6E544FCFD3','BFFEFB1C-8988-4DDF-B4AC-81C2B30E80CD','D721FC55-2174-40EB-BB37-5C54A158525A','2019-01-10 17:29:17'),('230ac952-abe9-4e42-b50c-96d2909b92af','40FF1844-C099-4061-98E0-CD6E544FCFD3','C9518758-B2E1-4F51-B517-5282E273889C','E5D4DA6B-AAB0-4AAA-982F-43673E8152C0','2019-01-10 17:29:17'),('293cac65-49c7-4923-9eae-08bd3bc76db8','40FF1844-C099-4061-98E0-CD6E544FCFD3','C9518758-B2E1-4F51-B517-5282E273889C','7C34C2FD-98ED-4655-AA04-BB00B915A751','2019-01-10 17:29:17'),('2b6746bf-14e8-4d50-b151-5bd5c0cbc023','40FF1844-C099-4061-98E0-CD6E544FCFD3','C9518758-B2E1-4F51-B517-5282E273889C','60AE9382-31AB-4276-A379-D3876E9BB783','2019-01-10 17:29:17'),('3646da8e-3abb-413c-8a09-312c68856907','40FF1844-C099-4061-98E0-CD6E544FCFD3','C9518758-B2E1-4F51-B517-5282E273889C','D721FC55-2174-40EB-BB37-5C54A158525A','2019-01-10 17:29:17'),('36bcd5d7-d00d-49e1-b402-298e5d8480ce','40FF1844-C099-4061-98E0-CD6E544FCFD3','E7EF2A05-8317-41C3-B588-99519FE88BF9','E5D4DA6B-AAB0-4AAA-982F-43673E8152C0','2019-01-10 17:29:17'),('3c97b03d-537e-410c-a763-258e4c9e8e34','40FF1844-C099-4061-98E0-CD6E544FCFD3','F27ECB0A-197D-47B1-B243-59A8C71302BF','7C34C2FD-98ED-4655-AA04-BB00B915A751','2019-01-10 17:29:17'),('54c4ad96-eca5-4db4-bc13-e27ad08c8539','40FF1844-C099-4061-98E0-CD6E544FCFD3','C9518758-B2E1-4F51-B517-5282E273889C','4CE21A81-1CAE-44D2-B29E-07058FF04B3E','2019-01-10 17:29:17'),('6f4855fd-6f3f-4800-90da-c5ca050e31e1','40FF1844-C099-4061-98E0-CD6E544FCFD3','9C388461-2704-4C5E-A729-72C17E9018E1','D721FC55-2174-40EB-BB37-5C54A158525A','2019-01-10 17:29:17'),('700d3e6b-9193-49dc-b7ed-fd2a61066589','40FF1844-C099-4061-98E0-CD6E544FCFD3','383E7EE2-7690-46AC-9230-65155C84AA30','D721FC55-2174-40EB-BB37-5C54A158525A','2019-01-10 17:29:17'),('7a73dbed-bdd5-4bcd-b72e-833accb7e34c','40FF1844-C099-4061-98E0-CD6E544FCFD3','383E7EE2-7690-46AC-9230-65155C84AA30','4CE21A81-1CAE-44D2-B29E-07058FF04B3E','2019-01-10 17:29:17'),('7c6efdc8-5504-4194-a406-b0fff7f48546','40FF1844-C099-4061-98E0-CD6E544FCFD3','E7EF2A05-8317-41C3-B588-99519FE88BF9','D721FC55-2174-40EB-BB37-5C54A158525A','2019-01-10 17:29:17'),('7cece3ab-47a3-40af-b6d9-4b98dfe5c869','40FF1844-C099-4061-98E0-CD6E544FCFD3','383E7EE2-7690-46AC-9230-65155C84AA30','60AE9382-31AB-4276-A379-D3876E9BB783','2019-01-10 17:29:17'),('8010337d-28bb-4bc7-9180-487cdcdb9032','40FF1844-C099-4061-98E0-CD6E544FCFD3','9C388461-2704-4C5E-A729-72C17E9018E1','E5D4DA6B-AAB0-4AAA-982F-43673E8152C0','2019-01-10 17:29:17'),('806ae0d5-86ac-46b9-aca7-78af34091367','40FF1844-C099-4061-98E0-CD6E544FCFD3','E7EF2A05-8317-41C3-B588-99519FE88BF9','7C34C2FD-98ED-4655-AA04-BB00B915A751','2019-01-10 17:29:17'),('81bad5fa-6d57-478f-99f9-f6e482c52365','40FF1844-C099-4061-98E0-CD6E544FCFD3','C9518758-B2E1-4F51-B517-5282E273889C','38D864FF-F6E7-43AF-8C5C-8BBCF9FA586D','2019-01-10 17:29:17'),('8254fa69-aac1-4e09-9e2f-0326c58b9d48','40FF1844-C099-4061-98E0-CD6E544FCFD3','9C388461-2704-4C5E-A729-72C17E9018E1','38D864FF-F6E7-43AF-8C5C-8BBCF9FA586D','2019-01-10 17:29:17'),('86208a38-abe9-4ba6-8298-f985f8987bf0','40FF1844-C099-4061-98E0-CD6E544FCFD3','F27ECB0A-197D-47B1-B243-59A8C71302BF','38D864FF-F6E7-43AF-8C5C-8BBCF9FA586D','2019-01-10 17:29:17'),('88494dce-2c34-4b54-a1fb-359da6ab045d','40FF1844-C099-4061-98E0-CD6E544FCFD3','C9518758-B2E1-4F51-B517-5282E273889C','F35D64AE-ECB7-4D06-ACFB-D91595966D9E','2019-01-10 17:29:17'),('98c15e0c-b237-4636-a9db-942b9c8acda5','40FF1844-C099-4061-98E0-CD6E544FCFD3','BFFEFB1C-8988-4DDF-B4AC-81C2B30E80CD','BD024F3A-99A7-4407-861C-A016F243F222','2019-01-10 17:29:17'),('a7a6e3bf-b768-4188-85cd-6dee6a6db9f4','40FF1844-C099-4061-98E0-CD6E544FCFD3','2401F4D0-60B0-4E2E-903F-84C603373572','7C34C2FD-98ED-4655-AA04-BB00B915A751','2019-01-10 17:29:17'),('c19d2745-0043-4931-a617-240211b47f6e','40FF1844-C099-4061-98E0-CD6E544FCFD3','383E7EE2-7690-46AC-9230-65155C84AA30','7C34C2FD-98ED-4655-AA04-BB00B915A751','2019-01-10 17:29:17'),('c5e67129-9167-4be8-bce4-d746c8fa9b5b','40FF1844-C099-4061-98E0-CD6E544FCFD3','383E7EE2-7690-46AC-9230-65155C84AA30','BD024F3A-99A7-4407-861C-A016F243F222','2019-01-10 17:29:17'),('cbd9ec90-12f8-4b21-b076-52cde84aa04e','40FF1844-C099-4061-98E0-CD6E544FCFD3','F27ECB0A-197D-47B1-B243-59A8C71302BF','E5D4DA6B-AAB0-4AAA-982F-43673E8152C0','2019-01-10 17:29:17'),('d0715a02-7c35-4b9c-9900-cd0343297b67','40FF1844-C099-4061-98E0-CD6E544FCFD3','9C388461-2704-4C5E-A729-72C17E9018E1','60AE9382-31AB-4276-A379-D3876E9BB783','2019-01-10 17:29:17'),('d1588d4a-7284-4f6b-92d4-8aa400b09148','40FF1844-C099-4061-98E0-CD6E544FCFD3','383E7EE2-7690-46AC-9230-65155C84AA30','38D864FF-F6E7-43AF-8C5C-8BBCF9FA586D','2019-01-10 17:29:17'),('daee7b78-aa07-4eb9-96e1-c639a9adc9b3','40FF1844-C099-4061-98E0-CD6E544FCFD3','BFFEFB1C-8988-4DDF-B4AC-81C2B30E80CD','38D864FF-F6E7-43AF-8C5C-8BBCF9FA586D','2019-01-10 17:29:17'),('db84d08d-e081-4d34-bcac-8253067dd1e2','40FF1844-C099-4061-98E0-CD6E544FCFD3','9C388461-2704-4C5E-A729-72C17E9018E1','BD024F3A-99A7-4407-861C-A016F243F222','2019-01-10 17:29:17'),('dcb9d86b-a2bf-48bb-8e4e-d66463a82617','40FF1844-C099-4061-98E0-CD6E544FCFD3','F27ECB0A-197D-47B1-B243-59A8C71302BF','BD024F3A-99A7-4407-861C-A016F243F222','2019-01-10 17:29:17'),('e4385ee4-1210-4e5d-b8ec-d00f1f12cc4f','40FF1844-C099-4061-98E0-CD6E544FCFD3','E7EF2A05-8317-41C3-B588-99519FE88BF9','BD024F3A-99A7-4407-861C-A016F243F222','2019-01-10 17:29:17'),('ea84c3e7-6dc3-4509-84dd-4e185110a2f0','40FF1844-C099-4061-98E0-CD6E544FCFD3','BFFEFB1C-8988-4DDF-B4AC-81C2B30E80CD','60AE9382-31AB-4276-A379-D3876E9BB783','2019-01-10 17:29:17'),('ecd5d839-1090-4348-b642-5843d00184d5','40FF1844-C099-4061-98E0-CD6E544FCFD3','F27ECB0A-197D-47B1-B243-59A8C71302BF','60AE9382-31AB-4276-A379-D3876E9BB783','2019-01-10 17:29:17'),('f0331b57-7fda-46a9-a4d5-74d793de0ef6','40FF1844-C099-4061-98E0-CD6E544FCFD3','383E7EE2-7690-46AC-9230-65155C84AA30','F35D64AE-ECB7-4D06-ACFB-D91595966D9E','2019-01-10 17:29:17'),('fc37dd7e-b91f-4148-ba29-b7ac545b30b9','40FF1844-C099-4061-98E0-CD6E544FCFD3','C9518758-B2E1-4F51-B517-5282E273889C','BD024F3A-99A7-4407-861C-A016F243F222','2019-01-10 17:29:17');
/*!40000 ALTER TABLE `sys_rolemenufunction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sys_user` (
  `User_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'ID',
  `User_Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '用户名称',
  `User_LoginName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '登陆名',
  `User_Pwd` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '登陆密码',
  `User_Email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '邮件',
  `User_IsDelete` int(11) DEFAULT NULL COMMENT '是否可删除（1：是 2：否）',
  `User_CreateTime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`User_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='管理后台用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES ('0198459E-2034-4533-B843-5D227AD20740','管理员','admin','123','adinnet@adinnet.cn',2,'2017-04-06 19:55:53'),('A7EAE7AB-0DE4-4026-8DA9-6529F8A1C3E2','普通用户','user','123','111',1,'2018-03-10 12:21:15');
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_userrole`
--

DROP TABLE IF EXISTS `sys_userrole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sys_userrole` (
  `UserRole_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'ID',
  `UserRole_UserID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '用户ID',
  `UserRole_RoleID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '角色ID',
  `UserRole_CreateTime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`UserRole_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='管理后台用户权限绑定表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_userrole`
--

LOCK TABLES `sys_userrole` WRITE;
/*!40000 ALTER TABLE `sys_userrole` DISABLE KEYS */;
INSERT INTO `sys_userrole` VALUES ('A0A38126-5C92-4881-94AD-D00D646C53FC','A7EAE7AB-0DE4-4026-8DA9-6529F8A1C3E2','40FF1844-C099-4061-98E0-CD6E544FCFD3','2018-12-25 18:07:55'),('AAD12748-CF95-4A43-8E7F-FAFC9BFB329B','0198459E-2034-4533-B843-5D227AD20740','18FA4771-6F58-46A3-80D2-6F0F5E9972E3','2018-08-02 16:19:09');
/*!40000 ALTER TABLE `sys_userrole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `view_sys_user_role`
--

DROP TABLE IF EXISTS `view_sys_user_role`;
/*!50001 DROP VIEW IF EXISTS `view_sys_user_role`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `view_sys_user_role` AS SELECT 
 1 AS `User_ID`,
 1 AS `User_Name`,
 1 AS `User_LoginName`,
 1 AS `User_Pwd`,
 1 AS `User_Email`,
 1 AS `User_IsDelete`,
 1 AS `User_CreateTime`,
 1 AS `Role_Name`,
 1 AS `Role_Remark`,
 1 AS `UserRole_UserID`,
 1 AS `UserRole_RoleID`,
 1 AS `UserRole_ID`,
 1 AS `Role_Num`,
 1 AS `Role_ID`,
 1 AS `Role_IsDelete`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `view_sys_user_role`
--

/*!50001 DROP VIEW IF EXISTS `view_sys_user_role`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_sys_user_role` AS select `sys_user`.`User_ID` AS `User_ID`,`sys_user`.`User_Name` AS `User_Name`,`sys_user`.`User_LoginName` AS `User_LoginName`,`sys_user`.`User_Pwd` AS `User_Pwd`,`sys_user`.`User_Email` AS `User_Email`,`sys_user`.`User_IsDelete` AS `User_IsDelete`,`sys_user`.`User_CreateTime` AS `User_CreateTime`,`sys_role`.`Role_Name` AS `Role_Name`,`sys_role`.`Role_Remark` AS `Role_Remark`,`sys_userrole`.`UserRole_UserID` AS `UserRole_UserID`,`sys_userrole`.`UserRole_RoleID` AS `UserRole_RoleID`,`sys_userrole`.`UserRole_ID` AS `UserRole_ID`,`sys_role`.`Role_Num` AS `Role_Num`,`sys_role`.`Role_ID` AS `Role_ID`,`sys_role`.`Role_IsDelete` AS `Role_IsDelete` from (`sys_user` left join (`sys_userrole` left join `sys_role` on((`sys_role`.`Role_ID` = `sys_userrole`.`UserRole_RoleID`))) on((`sys_userrole`.`UserRole_UserID` = `sys_user`.`User_ID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-01-11 10:42:01

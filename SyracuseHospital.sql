/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50157
Source Host           : localhost:3306
Source Database       : tjsqyygl

Target Server Type    : MYSQL
Target Server Version : 50157
File Encoding         : 65001

Date: 2016-09-25 20:18:02
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `bl`
-- ----------------------------
DROP TABLE IF EXISTS `bl`;
CREATE TABLE `bl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `blno` varchar(255) DEFAULT NULL,
  `keshi` varchar(255) DEFAULT NULL,
  `isyb` varchar(255) DEFAULT NULL,
  `bingr` varchar(255) DEFAULT NULL,
  `sfid` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `birth` varchar(255) DEFAULT NULL,
  `jwbs` varchar(255) DEFAULT NULL,
  `zs` varchar(255) DEFAULT NULL,
  `zdjg` varchar(255) DEFAULT NULL,
  `uname` varchar(255) DEFAULT NULL,
  `savetime` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bl
-- ----------------------------
INSERT INTO `bl` VALUES ('11', '201512271820000001', 'Internal Medicine Department', 'Yes', 'Zhang San', '420983199311214719', 'Male', '2015-12-16', 'None', 'Fever', 'Fever', 'test18', '2016-09-27 21:13:00');
INSERT INTO `bl` VALUES ('12', '201512272112040003', 'Surgical Department', 'No', '', '', '', '', '', '', '', '', '2016-09-27 21:13:00');
INSERT INTO `bl` VALUES ('13', '201512272112470005', 'Internal Medicine Department', 'Yes', 'Li Si', '400000000000000000000', 'Female', '2015-11-10', 'None', 'Cold', 'Cold', 'test18', '2016-09-27 21:13:00');
INSERT INTO `bl` VALUES ('14', '20160925190300', 'Traditional Chinese Medicine Department', 'Yes', 'Zhang Sanfeng', '123123123123123123', 'Male', '2016-08-31', 'None', 'Itching', 'Eczema', 'doctor', '2016-09-25 19:03:06');
INSERT INTO `bl` VALUES ('15', '20160925201400', 'Otolaryngology Department', 'Yes', 'Li Li', '222333111222333111', 'Female', '2016-08-28', 'None', 'Soar throat', 'Cold', 'D001', '2016-09-25 20:14:28');

-- ----------------------------
-- Table structure for `kucun`
-- ----------------------------
DROP TABLE IF EXISTS `kucun`;
CREATE TABLE `kucun` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `yaopin` varchar(255) DEFAULT NULL,
  `rkdate` varchar(255) DEFAULT NULL,
  `tnum` varchar(255) DEFAULT NULL,
  `pichi` varchar(255) DEFAULT NULL,
  `totprice` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kucun
-- ----------------------------
INSERT INTO `kucun` VALUES ('1', 'Qingkailing', '2016-09-27', '32', 'pt001', '1000');
INSERT INTO `kucun` VALUES ('4', 'Aminophenazone', '2016-09-27', '100', 'pt100', '2000');
INSERT INTO `kucun` VALUES ('5', 'Aspirin', '2016-09-27', '30', 'pt102', '600');
INSERT INTO `kucun` VALUES ('6', 'WhiteAndBlack', '2016-09-25', '100', '1', '1200');
INSERT INTO `kucun` VALUES ('7', 'Ibuprofen', '2016-09-25', '10', '123', '380');

-- ----------------------------
-- Table structure for `log`
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log` (
  `id` tinyint(11) NOT NULL AUTO_INCREMENT,
  `userid` tinyint(11) NOT NULL COMMENT 'Operators id',
  `tname` varchar(255) DEFAULT NULL COMMENT 'Operators name',
  `blno` varchar(255) DEFAULT NULL COMMENT 'Related history number',
  `savetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Creation time',
  `sfid` varchar(255) DEFAULT NULL COMMENT 'Related user ssn',
  `oper` varchar(256) DEFAULT NULL COMMENT 'Related action',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of log
-- ----------------------------
INSERT INTO `log` VALUES ('1', '1', 'Hu Xiao', null, '2018-04-18 11:14:33', null, 'Login');
INSERT INTO `log` VALUES ('2', '9', 'Zhang Lao', '201511011101010', '2018-04-18 11:42:11', '40432424234234', 'Update');
INSERT INTO `log` VALUES ('3', '9', 'Zhang Lao', '', '2018-04-18 14:50:36', '', 'Login');
INSERT INTO `log` VALUES ('4', '1', 'Hu Xiao', '', '2018-04-18 14:56:35', '', 'Login');
INSERT INTO `log` VALUES ('5', '9', 'Zhang Lao', '', '2018-04-18 16:08:29', '', 'Login');
INSERT INTO `log` VALUES ('6', '9', 'Zhang Lao', '', '2018-04-18 16:15:48', '', 'Login');
INSERT INTO `log` VALUES ('7', '1', 'Hu Xiao', '', '2018-04-18 16:16:23', '', 'Login');
INSERT INTO `log` VALUES ('8', '9', 'Zhang Lao', '', '2018-04-18 16:18:58', '', 'Login');
INSERT INTO `log` VALUES ('9', '9', 'Zhang Lao', '', '2018-04-18 16:27:20', '', 'Login');
INSERT INTO `log` VALUES ('10', '9', 'Zhang Lao', '', '2018-04-18 16:30:33', '', 'Login');
INSERT INTO `log` VALUES ('11', '1', 'Hu Xiao', '', '2018-04-18 16:33:42', '', 'Login');
INSERT INTO `log` VALUES ('12', '9', 'Zhang Lao', '', '2018-04-18 16:37:53', '', 'Login');
INSERT INTO `log` VALUES ('13', '10', 'Li Lao', '', '2018-04-18 16:38:27', '', 'Login');
INSERT INTO `log` VALUES ('14', '9', 'Zhang Lao', '', '2018-04-18 16:40:09', '', 'Login');
INSERT INTO `log` VALUES ('15', '8', 'Wang Lao', '', '2018-04-18 16:50:31', '', 'Login');
INSERT INTO `log` VALUES ('16', '1', 'Hu Xiao', '', '2018-04-18 22:54:40', '', 'Login');
INSERT INTO `log` VALUES ('17', '10', 'Li Lao', '', '2018-04-18 22:55:52', '', 'Login');
INSERT INTO `log` VALUES ('18', '9', 'Zhang Lao', '', '2018-04-18 22:56:29', '', 'Login');
INSERT INTO `log` VALUES ('19', '10', 'Li Lao', '', '2018-04-19 22:58:53', '', 'Login');
INSERT INTO `log` VALUES ('20', '10', 'Li Lao', '', '2018-04-19 23:39:45', '', 'Login');
INSERT INTO `log` VALUES ('21', '10', 'Li Lao', '', '2018-04-19 23:53:09', '', 'Login');
INSERT INTO `log` VALUES ('22', '10', 'Li Lao', '', '2018-04-19 20:00:31', '', 'Login');
INSERT INTO `log` VALUES ('23', '10', 'Li Lao', '', '2018-04-20 20:02:17', '', 'Login');
INSERT INTO `log` VALUES ('24', '1', 'Hu Xiao', '', '2018-04-21 12:30:57', '', 'Login');
INSERT INTO `log` VALUES ('25', '1', 'Hu Xiao', '', '2018-04-21 12:52:44', '', 'Login');
INSERT INTO `log` VALUES ('26', '1', 'Hu Xiao', '', '2018-04-21 12:57:38', '', 'Login');
INSERT INTO `log` VALUES ('27', '1', 'admin', '', '2018-04-21 14:11:45', '', 'Login');
INSERT INTO `log` VALUES ('28', '1', 'admin', '', '2018-04-21 23:53:35', '', 'Login');
INSERT INTO `log` VALUES ('29', '1', 'admin', '', '2018-04-22 16:27:35', '', 'Login');
INSERT INTO `log` VALUES ('30', '1', 'admin', '', '2018-04-22 16:27:36', '', 'Login');
INSERT INTO `log` VALUES ('31', '1', 'admin', '', '2018-04-22 16:29:45', '', 'Login');
INSERT INTO `log` VALUES ('32', '15', 'Wei Zhang', '', '2018-04-22 16:29:58', '', 'Login');
INSERT INTO `log` VALUES ('33', '1', 'admin', '', '2018-04-22 17:00:38', '', 'Login');
INSERT INTO `log` VALUES ('34', '1', 'admin', '', '2018-04-22 17:01:13', '', 'Login');
INSERT INTO `log` VALUES ('35', '15', 'Wei Zhang', '', '2018-04-22 17:52:20', '', 'Login');
INSERT INTO `log` VALUES ('36', '18', 'Liu Lao', '', '2018-04-22 18:04:10', '', 'Login');
INSERT INTO `log` VALUES ('38', '1', 'admin', '', '2018-04-22 18:09:11', '', 'Login');
INSERT INTO `log` VALUES ('39', '15', 'Wei Zhang', '', '2018-04-22 18:19:42', '', 'Login');
INSERT INTO `log` VALUES ('40', '15', 'test12', '201512271820000001', '2018-04-22 18:20:11', '', 'Create Health History');
INSERT INTO `log` VALUES ('41', '1', 'admin', '', '2018-04-22 18:20:32', '', 'Login');
INSERT INTO `log` VALUES ('42', '1', 'admin', '', '2018-04-22 18:21:14', '', 'Login');
INSERT INTO `log` VALUES ('43', '18', 'Liu Lao', '', '2018-04-22 18:21:28', '', 'Login');
INSERT INTO `log` VALUES ('45', '18', 'test18', '201512271820000001', '2018-04-22 18:25:41', '', 'Create Prescription');
INSERT INTO `log` VALUES ('46', '1', 'admin', '', '2018-04-22 18:25:53', '', 'Login');
INSERT INTO `log` VALUES ('47', '1', 'admin', '', '2018-04-22 19:30:36', '', 'Login');
INSERT INTO `log` VALUES ('48', '15', 'Wei Zhang', '', '2018-04-22 19:31:02', '', 'Login');
INSERT INTO `log` VALUES ('49', '15', 'Wei Zhang', '', '2018-04-22 21:11:54', '', 'Login');
INSERT INTO `log` VALUES ('50', '15', 'test12', '201512272112040003', '2018-04-22 21:12:22', '', 'Create Health History');
INSERT INTO `log` VALUES ('51', '15', 'test12', '201512272112470005', '2018-04-22 21:13:00', '', 'Create Health History');
INSERT INTO `log` VALUES ('52', '18', 'Liu Lao', '', '2018-04-22 21:18:55', '', 'Login');
INSERT INTO `log` VALUES ('53', '18', 'test18', '201512272112470005', '2018-04-22 21:19:48', '400000000000000000000', 'Update Health History');
INSERT INTO `log` VALUES ('54', '1', 'admin', '', '2018-04-22 21:20:47', '', 'Login');
INSERT INTO `log` VALUES ('55', '8', 'Wang Lao', '', '2018-04-22 21:23:46', '', 'Login');
INSERT INTO `log` VALUES ('56', '8', 'K001', '', '2018-04-22 21:34:52', '', 'Medicine Into Warehouse');
INSERT INTO `log` VALUES ('57', '1', 'admin', '', '2018-04-27 13:50:08', '', 'Login');
INSERT INTO `log` VALUES ('58', '1', 'admin', '', '2018-04-27 13:53:15', '', 'Login');
INSERT INTO `log` VALUES ('59', '9', 'Zhang Lao', '', '2018-04-27 14:53:11', '', 'Login');
INSERT INTO `log` VALUES ('60', '1', 'admin', '', '2018-04-27 15:24:29', '', 'Login');
INSERT INTO `log` VALUES ('61', '10', 'Li Lao', '', '2018-04-27 15:38:43', '', 'Login');
INSERT INTO `log` VALUES ('62', '8', 'Wang Lao', '', '2018-04-27 15:39:13', '', 'Login');
INSERT INTO `log` VALUES ('63', '1', 'admin', '', '2018-04-27 18:38:07', '', 'Login');
INSERT INTO `log` VALUES ('64', '9', 'Zhang Lao', '', '2018-04-27 18:39:05', '', 'Login');
INSERT INTO `log` VALUES ('65', '8', 'Wang Lao', '', '2018-04-27 18:40:32', '', 'Login');
INSERT INTO `log` VALUES ('66', '1', 'admin', '', '2018-04-28 19:00:31', '', 'Login');
INSERT INTO `log` VALUES ('67', '12', 'Suan Da', '', '2018-04-28 19:00:58', '', 'Login');
INSERT INTO `log` VALUES ('68', '10', 'Li Lao', '', '2018-04-28 19:02:31', '', 'Login');
INSERT INTO `log` VALUES ('69', '1', 'admin', '', '2018-04-28 19:03:31', '', 'Login');
INSERT INTO `log` VALUES ('70', '21', 'Yifei Liu', '', '2018-04-28 19:04:28', '', 'Login');
INSERT INTO `log` VALUES ('71', '10', 'Li Lao', '', '2018-04-28 19:07:13', '', 'Login');
INSERT INTO `log` VALUES ('72', '10', 'Li Lao', '', '2018-04-28 19:38:04', '', 'Login');
INSERT INTO `log` VALUES ('73', '10', 'Li Lao', '', '2018-04-28 19:45:53', '', 'Login');
INSERT INTO `log` VALUES ('74', '10', 'Li Lao', '', '2018-04-28 19:51:45', '', 'Login');
INSERT INTO `log` VALUES ('75', '10', 'Li Lao', '', '2018-04-28 19:52:42', '', 'Login');
INSERT INTO `log` VALUES ('76', '10', 'Li Lao', '', '2018-04-28 19:55:41', '', 'Login');
INSERT INTO `log` VALUES ('77', '8', 'Wang Lao', '', '2018-04-28 19:57:05', '', 'Login');
INSERT INTO `log` VALUES ('78', '1', 'admin', '', '2018-04-28 20:11:39', '', 'Login');
INSERT INTO `log` VALUES ('79', '8', 'Wang Lao', '', '2018-04-28 20:12:38', '', 'Login');
INSERT INTO `log` VALUES ('80', '10', 'Li Lao', '', '2018-04-28 20:14:01', '', 'Login');
INSERT INTO `log` VALUES ('81', '9', 'Zhang Lao', '', '2018-04-28 20:14:48', '', 'Login');
INSERT INTO `log` VALUES ('82', '10', 'Li Lao', '', '2018-04-28 20:15:44', '', 'Login');
INSERT INTO `log` VALUES ('83', '9', 'Zhang Lao', '', '2018-04-28 20:16:08', '', 'Login');
INSERT INTO `log` VALUES ('84', '10', 'Li Lao', '', '2018-04-28 20:16:40', '', 'Login');

-- ----------------------------
-- Table structure for `shoufei`
-- ----------------------------
DROP TABLE IF EXISTS `shoufei`;
CREATE TABLE `shoufei` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `blno` varchar(255) DEFAULT NULL,
  `yaopinxx` varchar(255) DEFAULT NULL,
  `totprice` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shoufei
-- ----------------------------
INSERT INTO `shoufei` VALUES ('2', '201304131639550007', 'Aminophenazone - Unit Price:15 - Qty:1 ~ Qingkailing - Unit Price:11 - Qty:2', '37', 'Medicine is taken');
INSERT INTO `shoufei` VALUES ('4', '201512271820000001', 'Qingkailing - Unit Price:11 - Qty:2 ~ Qingkailing - Unit Price:11 - Qty:4', '66', 'Medicine is taken');
INSERT INTO `shoufei` VALUES ('5', '20160925190300', 'Ibuprofen - Unit Price:36 - Qty:1', '36', 'Medicine is taken');
INSERT INTO `shoufei` VALUES ('6', '20160925201400', 'WhiteAndBlack - Unit Price:10 - Qty:1', '10', 'Medicine is taken');

-- ----------------------------
-- Table structure for `sysuser`
-- ----------------------------
DROP TABLE IF EXISTS `sysuser`;
CREATE TABLE `sysuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(255) DEFAULT NULL,
  `upass` varchar(255) DEFAULT NULL,
  `utype` varchar(255) DEFAULT NULL,
  `tname` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `addrs` varchar(255) DEFAULT NULL,
  `filename` varchar(255) DEFAULT 'no.jpg',
  `savetime` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sysuser
-- ----------------------------
INSERT INTO `sysuser` VALUES ('1', 'admin', '123456', 'Administrator', 'admin', 'Male', '13733422488', '131313@qq.com', '1312312312', 'no.jpg', '2016-09-25 19:04:17');
INSERT INTO `sysuser` VALUES ('8', 'K001', '123456', 'Warehouse Keeper', 'Wang Lao', 'Female', '02911111111', '123@123.com', 'Building 3', 'no.jpg', '2016-09-25 19:04:17');
INSERT INTO `sysuser` VALUES ('9', 'D001', '123456', 'Doctor', 'Zhang Lao', 'Female', '02911111111', '132@123.com', 'Shandong Jinan Friendship', 'no.jpg', '2016-09-25 19:04:17');
INSERT INTO `sysuser` VALUES ('10', 'C001', '123456', 'Reception', 'Li Lao', 'Female', '02911111111', '1d23@qq.com', 'Shenzhen', 'no.jpg', '2016-09-25 19:04:17');
INSERT INTO `sysuser` VALUES ('12', 'test', '123456', 'Doctor', 'Suan Da', 'Female', '111000001010', '54543534', '3131231231', 'no.jpg', '2016-09-25 19:04:17');
INSERT INTO `sysuser` VALUES ('20', 'Test', '123456', 'Administrator', 'Name', 'Male', '13132131', '3123123@qq.com', 'Shenzhen', 'no.jpg', '2016-09-25 19:04:17');
INSERT INTO `sysuser` VALUES ('21', 'doctor', '123456', 'Doctor', 'Yifei Liu', 'Female', '88881234', 'lyf@qq.com', 'Shanghai', 'no.jpg', '2016-09-25 19:04:17');
INSERT INTO `sysuser` VALUES ('22', 'C002', '123456', 'Reception', 'Toll Collector', 'Male', '68123123', 'c003@qq.com', 'Our hospital', '', '2016-09-25 20:12:14');

-- ----------------------------
-- Table structure for `yaopin`
-- ----------------------------
DROP TABLE IF EXISTS `yaopin`;
CREATE TABLE `yaopin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `yname` varchar(255) DEFAULT NULL,
  `factory` varchar(255) DEFAULT NULL,
  `syz` varchar(255) DEFAULT NULL,
  `jj` varchar(255) DEFAULT NULL,
  `price` varchar(255) DEFAULT NULL,
  `isyb` varchar(255) DEFAULT NULL,
  `ybprice` varchar(255) DEFAULT NULL,
  `bei` varchar(255) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yaopin
-- ----------------------------
INSERT INTO `yaopin` VALUES ('3', 'Qingkailing', 'HarbinMed', 'Internal heat.', 'None', '12', 'Yes', '11', 'ok', '201304131609050001.jpg');
INSERT INTO `yaopin` VALUES ('4', 'Aminophenazone', 'Wahaha', 'Colds, fever, headache, neuralgia and rheumatism.', 'Aminopyrine, caffeine, chlorpheniramine maleate allergies', '20', 'Yes', '15', 'oral. One tablet at a time, three times a day or as directed by a doctor ----- for colds, fever, 800 headaches, neuralgia and rheumatism', '201511281255130002.jpg');
INSERT INTO `yaopin` VALUES ('5', 'Aspirin', 'HarbinMed', 'fever, pain and rheumatoid arthritis', 'Non-steroidal anti-inflammatory drug allergy', '35', 'No', '35', 'Antipyretic, analgesic, daily body surface area of ​​1.5g/m2, divided into 4 to 6 times orally, or each time according to body weight 5-10mg/kg, or 60mg each time per year, if necessary, 4 to 6 hours 1 time .', '');
INSERT INTO `yaopin` VALUES ('6', 'WhiteAndBlack', 'HarbinMed', 'Cold', 'Pregnant woman disabled', '12', 'Yes', '10', 'Take white tablets during the day; eat black tablets at night.', '201512272129580007.jpg');
INSERT INTO `yaopin` VALUES ('7', 'Ibuprofen', 'Yangtze', 'Dizziness', 'Pregnant woman disabled', '38', 'Yes', '36', 'Once a day, one at a time.', '201512272129580007.jpg');

-- ----------------------------
-- Table structure for `yongyao`
-- ----------------------------
DROP TABLE IF EXISTS `yongyao`;
CREATE TABLE `yongyao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `blno` varchar(255) DEFAULT NULL,
  `yaoping` varchar(255) DEFAULT NULL,
  `num` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yongyao
-- ----------------------------
INSERT INTO `yongyao` VALUES ('13', '201512271820000001', 'Qingkailing - Unit Price:11', '2', 'Medicine is taken');
INSERT INTO `yongyao` VALUES ('14', '201512271820000001', 'Qingkailing - Unit Price:11', '4', 'Medicine is taken');
INSERT INTO `yongyao` VALUES ('15', '20160925190300', 'Ibuprofen - Unit Price:36', '1', 'Medicine is taken');
INSERT INTO `yongyao` VALUES ('16', '20160925201400', 'WhiteAndBlack - Unit Price:10', '1', 'Medicine is taken');

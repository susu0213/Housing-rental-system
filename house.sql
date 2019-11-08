/*
Navicat MySQL Data Transfer

Source Server         : zhupengdou
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : house

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2019-01-19 13:39:06
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `bargain`
-- ----------------------------
DROP TABLE IF EXISTS `bargain`;
CREATE TABLE `bargain` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `custom_name` varchar(40) DEFAULT NULL COMMENT '租客姓名',
  `custom_tel` varchar(40) DEFAULT NULL COMMENT '租客电话',
  `lord_name` varchar(40) DEFAULT NULL COMMENT '房东姓名',
  `lord_tel` varchar(40) DEFAULT NULL COMMENT '房东电话',
  `house_id` int(40) DEFAULT NULL COMMENT '小区名称',
  `admin_name` varchar(40) DEFAULT NULL COMMENT '审核的管理员姓名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bargain
-- ----------------------------
INSERT INTO `bargain` VALUES ('1', '1', '1', '1', '1', '1', '1');
INSERT INTO `bargain` VALUES ('36', '22', '22', '11', '1212212', '71', 'admin');

-- ----------------------------
-- Table structure for `collect`
-- ----------------------------
DROP TABLE IF EXISTS `collect`;
CREATE TABLE `collect` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `house_id` int(30) DEFAULT NULL,
  `user_name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of collect
-- ----------------------------
INSERT INTO `collect` VALUES ('1', '1', '1');
INSERT INTO `collect` VALUES ('2', '71', '22');

-- ----------------------------
-- Table structure for `house`
-- ----------------------------
DROP TABLE IF EXISTS `house`;
CREATE TABLE `house` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `house_name` varchar(40) DEFAULT NULL COMMENT '小区名称',
  `house_address` varchar(40) DEFAULT NULL COMMENT '地址',
  `house_money` varchar(40) DEFAULT NULL COMMENT '租金',
  `house_area` varchar(40) DEFAULT NULL COMMENT '面积',
  `house_type` varchar(40) DEFAULT NULL COMMENT '户型',
  `house_lord` varchar(40) DEFAULT NULL COMMENT '联系人',
  `house_tel` varchar(40) DEFAULT NULL COMMENT '联系电话',
  `house_admin` varchar(40) DEFAULT NULL COMMENT '审核管理员',
  `house_custom` varchar(40) DEFAULT NULL COMMENT '求租人',
  `status` varchar(10) DEFAULT NULL,
  `house_image` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of house
-- ----------------------------
INSERT INTO `house` VALUES ('1', '你好', '1', '1', '1', '1', '1', '12', '1', '1', '1', '1');
INSERT INTO `house` VALUES ('71', '流星花园', '流星花园', '123', '120', '三室两厅', '11', '1212212', 'admin', '22', '1', '2.png');
INSERT INTO `house` VALUES ('72', '花园小区', '花园小区', '111', '110', '三室两厅', '11', '11111', 'admin', null, null, '13.png');
INSERT INTO `house` VALUES ('73', '房子', '花园小区', '234', '222', '花园小区', '11', '12323', 'admin', null, null, '12.png');
INSERT INTO `house` VALUES ('74', '小区', '小区', '小区', '121', '两室两厅', '22', '1212423', 'admin', null, null, '14.png');

-- ----------------------------
-- Table structure for `message`
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `id` int(40) NOT NULL AUTO_INCREMENT,
  `user_message` text,
  `admin_message` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES ('1', '租房便宜了', '价格便宜，期待您下次光临');

-- ----------------------------
-- Table structure for `reason`
-- ----------------------------
DROP TABLE IF EXISTS `reason`;
CREATE TABLE `reason` (
  `id` int(40) NOT NULL AUTO_INCREMENT,
  `reason` varchar(100) DEFAULT NULL,
  `house_id` int(40) DEFAULT NULL,
  `type` varchar(40) DEFAULT NULL,
  `lord` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of reason
-- ----------------------------
INSERT INTO `reason` VALUES ('1', '1', '1', '1', '1');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `account` varchar(40) DEFAULT NULL COMMENT '用户名',
  `password` varchar(40) DEFAULT NULL COMMENT '密码',
  `address` varchar(40) DEFAULT NULL COMMENT '地址',
  `tel` varchar(40) DEFAULT NULL COMMENT '电话',
  `email` varchar(40) DEFAULT NULL COMMENT '邮箱',
  `type` int(2) DEFAULT '1' COMMENT '用户类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', '123456', '', '', '', '2');
INSERT INTO `user` VALUES ('27', '11', '11', '11', '11', '11', '1');
INSERT INTO `user` VALUES ('28', '22', '22', '22', '22', '22', '1');

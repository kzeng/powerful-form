/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50714
Source Host           : localhost:3306
Source Database       : adv

Target Server Type    : MYSQL
Target Server Version : 50714
File Encoding         : 65001

Date: 2017-06-23 22:42:20
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES ('3', 'title#3', 'content of title#3', '1');
INSERT INTO `article` VALUES ('2', 'test#2', 'content of test#2', '1');
INSERT INTO `article` VALUES ('4', 'xxxxxxxxxxx', 'demodemo', '1');
INSERT INTO `article` VALUES ('5', 'qq', '', '0');
INSERT INTO `article` VALUES ('6', 'qq', '', '1');

-- ----------------------------
-- Table structure for customer_pform
-- ----------------------------
DROP TABLE IF EXISTS `customer_pform`;
CREATE TABLE `customer_pform` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pform_uid` varchar(64) NOT NULL,
  `pform_field_id` int(11) NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customer_pform
-- ----------------------------

-- ----------------------------
-- Table structure for migration
-- ----------------------------
DROP TABLE IF EXISTS `migration`;
CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of migration
-- ----------------------------
INSERT INTO `migration` VALUES ('m000000_000000_base', '1497943471');
INSERT INTO `migration` VALUES ('m130524_201442_init', '1497943474');

-- ----------------------------
-- Table structure for pform
-- ----------------------------
DROP TABLE IF EXISTS `pform`;
CREATE TABLE `pform` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `uid` varchar(64) NOT NULL COMMENT '唯一编码',
  `title` varchar(255) NOT NULL COMMENT '表单名称',
  `created_at` int(11) NOT NULL COMMENT '创建时间',
  `updated_at` int(11) NOT NULL COMMENT '更新时间',
  `user_id` int(11) NOT NULL COMMENT '创建者',
  `description` varchar(512) NOT NULL COMMENT '简要描述',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户表单';

-- ----------------------------
-- Records of pform
-- ----------------------------
INSERT INTO `pform` VALUES ('1', '594cd9feac29c', '预约报名', '1498208766', '1498220722', '1', '本周报名有优惠');

-- ----------------------------
-- Table structure for pform_field
-- ----------------------------
DROP TABLE IF EXISTS `pform_field`;
CREATE TABLE `pform_field` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '字段ID',
  `title` varchar(32) NOT NULL COMMENT '字段名称',
  `type` int(11) NOT NULL COMMENT '类型',
  `value` varchar(255) NOT NULL COMMENT '取值范围',
  `placeholder` varchar(255) NOT NULL COMMENT '提示语',
  `sort` int(11) NOT NULL DEFAULT '255' COMMENT '排序',
  `pform_uid` varchar(64) NOT NULL COMMENT '用户表单ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='用户表单字段表';

-- ----------------------------
-- Records of pform_field
-- ----------------------------
INSERT INTO `pform_field` VALUES ('1', '姓名', '1', '', '请填写姓名', '1', '594cd9feac29c');
INSERT INTO `pform_field` VALUES ('2', '手机号码', '2', '', '填写您的手机，以便收到报名通知', '2', '594cd9feac29c');
INSERT INTO `pform_field` VALUES ('3', '电子邮箱', '3', '', '', '3', '594cd9feac29c');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `password_reset_token` (`password_reset_token`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'zengkai', 'OIOpupw6FRM_4fWanwqH2CR1YlwzupH5', '$2y$13$xsQLUL1pgZmitZ5XEGXXMeQvgce4eDtObx0S5VmnBQYe30EBKgbYK', null, 'zengkai001@qq.com', '10', '1497943588', '1497943588');

/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50714
Source Host           : localhost:3306
Source Database       : adv

Target Server Type    : MYSQL
Target Server Version : 50714
File Encoding         : 65001

Date: 2017-06-25 17:43:07
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
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customer_pform
-- ----------------------------
INSERT INTO `customer_pform` VALUES ('7', '594cd9feac29c', '3', 'zengkai001@qq.com');
INSERT INTO `customer_pform` VALUES ('5', '594cd9feac29c', '1', 'zengkai');
INSERT INTO `customer_pform` VALUES ('6', '594cd9feac29c', '2', '13545296480');
INSERT INTO `customer_pform` VALUES ('8', '594f699775d88', '4', '李四');
INSERT INTO `customer_pform` VALUES ('9', '594f699775d88', '6', '13545888888');
INSERT INTO `customer_pform` VALUES ('10', '594f699775d88', '7', '');

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
  `description` varchar(512) DEFAULT NULL COMMENT '简要描述',
  `detail` text,
  `form_img_url` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='用户表单';

-- ----------------------------
-- Records of pform
-- ----------------------------
INSERT INTO `pform` VALUES ('1', '594cd9feac29c', '预约报名', '1498208766', '1498314540', '1', '本周报名有优惠', '', '/adv/backend/web/uploads/20170624142900-594e772c3b4e2.jpg');
INSERT INTO `pform` VALUES ('3', '594e763b8a4a4', 'demo form', '1498314299', '1498314299', '1', 'this is a demo', '', '/adv/backend/web/uploads/20170624142459-594e763b8439c.jpg');
INSERT INTO `pform` VALUES ('4', '594f699775d88', '课程报名', '1498376599', '1498379814', '3', '暑假奥数培训开始火热报名了！', '', '/adv/backend/web/uploads/20170625074319-594f69976b55a.jpg');

-- ----------------------------
-- Table structure for pform_field
-- ----------------------------
DROP TABLE IF EXISTS `pform_field`;
CREATE TABLE `pform_field` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '字段ID',
  `title` varchar(32) NOT NULL COMMENT '字段名称',
  `type` int(11) NOT NULL COMMENT '类型',
  `value` varchar(255) NOT NULL COMMENT '取值范围',
  `placeholder` varchar(255) DEFAULT NULL COMMENT '提示语',
  `sort` int(11) DEFAULT '255' COMMENT '排序',
  `pform_uid` varchar(64) NOT NULL COMMENT '用户表单ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='用户表单字段表';

-- ----------------------------
-- Records of pform_field
-- ----------------------------
INSERT INTO `pform_field` VALUES ('1', '姓名', '1', '', '请填写姓名', '1', '594cd9feac29c');
INSERT INTO `pform_field` VALUES ('2', '手机号码', '2', '', '填写您的手机，以便收到报名通知', '2', '594cd9feac29c');
INSERT INTO `pform_field` VALUES ('3', '电子邮箱', '3', '', '', '3', '594cd9feac29c');
INSERT INTO `pform_field` VALUES ('4', '姓名', '1', '', '', '1', '594f699775d88');
INSERT INTO `pform_field` VALUES ('6', '手机号码', '2', '', '', null, '594f699775d88');
INSERT INTO `pform_field` VALUES ('7', '备注', '1', '', '填点您想说的话吧', null, '594f699775d88');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'zengkai', 'OIOpupw6FRM_4fWanwqH2CR1YlwzupH5', '$2y$13$xsQLUL1pgZmitZ5XEGXXMeQvgce4eDtObx0S5VmnBQYe30EBKgbYK', null, 'zengkai001@qq.com', '10', '1497943588', '1497943588');
INSERT INTO `user` VALUES ('2', 'zengkai001', 'W5UHj71cDOpwvxl6VsYvi3m5cIcGKimn', '$2y$13$3bc24gx5OlW5HXOWq80U0u7.D5/8fosKV7SpzxnX.swQCzjbmTVUO', null, 'zengkai001@163.com', '10', '1498358618', '1498358618');
INSERT INTO `user` VALUES ('3', 'demo', 'c_owpDYwb_PKbU6a98QwSpRo_sjEd0bO', '$2y$13$R7SLg6Tf0Ea8pjFN.06b5OAKkyHdJZ6PkGZP3EeBAZHGjZQqRTFQW', null, 'demo@163.com', '10', '1498364856', '1498364856');

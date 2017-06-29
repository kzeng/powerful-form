/*
Navicat MySQL Data Transfer

Source Server         : mitoto.cn
Source Server Version : 50623
Source Host           : mitoto.cn:3306
Source Database       : pfdb

Target Server Type    : MYSQL
Target Server Version : 50623
File Encoding         : 65001

Date: 2017-06-29 13:48:58
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
-- Table structure for customer_pform
-- ----------------------------
DROP TABLE IF EXISTS `customer_pform`;
CREATE TABLE `customer_pform` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pform_uid` varchar(64) NOT NULL,
  `pform_field_id` int(11) NOT NULL,
  `value` varchar(255) NOT NULL,
  `customer_pform_uid` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COMMENT='用户表单';

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
) ENGINE=MyISAM AUTO_INCREMENT=59 DEFAULT CHARSET=utf8 COMMENT='用户表单字段表';

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
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

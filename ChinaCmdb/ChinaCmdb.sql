/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50553
Source Host           : 127.0.0.1:3306
Source Database       : ChinaCmdb

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2017-06-12 23:37:41
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('2', 'Can change log entry', '1', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete log entry', '1', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('4', 'Can add permission', '2', 'add_permission');
INSERT INTO `auth_permission` VALUES ('5', 'Can change permission', '2', 'change_permission');
INSERT INTO `auth_permission` VALUES ('6', 'Can delete permission', '2', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('7', 'Can add group', '3', 'add_group');
INSERT INTO `auth_permission` VALUES ('8', 'Can change group', '3', 'change_group');
INSERT INTO `auth_permission` VALUES ('9', 'Can delete group', '3', 'delete_group');
INSERT INTO `auth_permission` VALUES ('10', 'Can add user', '4', 'add_user');
INSERT INTO `auth_permission` VALUES ('11', 'Can change user', '4', 'change_user');
INSERT INTO `auth_permission` VALUES ('12', 'Can delete user', '4', 'delete_user');
INSERT INTO `auth_permission` VALUES ('13', 'Can add content type', '5', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('14', 'Can change content type', '5', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete content type', '5', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('16', 'Can add session', '6', 'add_session');
INSERT INTO `auth_permission` VALUES ('17', 'Can change session', '6', 'change_session');
INSERT INTO `auth_permission` VALUES ('18', 'Can delete session', '6', 'delete_session');
INSERT INTO `auth_permission` VALUES ('19', 'Can add disk', '7', 'add_disk');
INSERT INTO `auth_permission` VALUES ('20', 'Can change disk', '7', 'change_disk');
INSERT INTO `auth_permission` VALUES ('21', 'Can delete disk', '7', 'delete_disk');
INSERT INTO `auth_permission` VALUES ('22', 'Can add aadmin info', '8', 'add_aadmininfo');
INSERT INTO `auth_permission` VALUES ('23', 'Can change aadmin info', '8', 'change_aadmininfo');
INSERT INTO `auth_permission` VALUES ('24', 'Can delete aadmin info', '8', 'delete_aadmininfo');
INSERT INTO `auth_permission` VALUES ('25', 'Can add memory', '9', 'add_memory');
INSERT INTO `auth_permission` VALUES ('26', 'Can change memory', '9', 'change_memory');
INSERT INTO `auth_permission` VALUES ('27', 'Can delete memory', '9', 'delete_memory');
INSERT INTO `auth_permission` VALUES ('28', 'Can add service', '10', 'add_service');
INSERT INTO `auth_permission` VALUES ('29', 'Can change service', '10', 'change_service');
INSERT INTO `auth_permission` VALUES ('30', 'Can delete service', '10', 'delete_service');
INSERT INTO `auth_permission` VALUES ('31', 'Can add user profile', '11', 'add_userprofile');
INSERT INTO `auth_permission` VALUES ('32', 'Can change user profile', '11', 'change_userprofile');
INSERT INTO `auth_permission` VALUES ('33', 'Can delete user profile', '11', 'delete_userprofile');
INSERT INTO `auth_permission` VALUES ('34', 'Can add idc', '12', 'add_idc');
INSERT INTO `auth_permission` VALUES ('35', 'Can change idc', '12', 'change_idc');
INSERT INTO `auth_permission` VALUES ('36', 'Can delete idc', '12', 'delete_idc');
INSERT INTO `auth_permission` VALUES ('37', 'Can add nic', '13', 'add_nic');
INSERT INTO `auth_permission` VALUES ('38', 'Can change nic', '13', 'change_nic');
INSERT INTO `auth_permission` VALUES ('39', 'Can delete nic', '13', 'delete_nic');
INSERT INTO `auth_permission` VALUES ('40', 'Can add asset record', '14', 'add_assetrecord');
INSERT INTO `auth_permission` VALUES ('41', 'Can change asset record', '14', 'change_assetrecord');
INSERT INTO `auth_permission` VALUES ('42', 'Can delete asset record', '14', 'delete_assetrecord');
INSERT INTO `auth_permission` VALUES ('43', 'Can add user group', '15', 'add_usergroup');
INSERT INTO `auth_permission` VALUES ('44', 'Can change user group', '15', 'change_usergroup');
INSERT INTO `auth_permission` VALUES ('45', 'Can delete user group', '15', 'delete_usergroup');
INSERT INTO `auth_permission` VALUES ('46', 'Can add project', '16', 'add_project');
INSERT INTO `auth_permission` VALUES ('47', 'Can change project', '16', 'change_project');
INSERT INTO `auth_permission` VALUES ('48', 'Can delete project', '16', 'delete_project');
INSERT INTO `auth_permission` VALUES ('49', 'Can add network device', '17', 'add_networkdevice');
INSERT INTO `auth_permission` VALUES ('50', 'Can change network device', '17', 'change_networkdevice');
INSERT INTO `auth_permission` VALUES ('51', 'Can delete network device', '17', 'delete_networkdevice');
INSERT INTO `auth_permission` VALUES ('52', 'Can add custom tag', '18', 'add_customtag');
INSERT INTO `auth_permission` VALUES ('53', 'Can change custom tag', '18', 'change_customtag');
INSERT INTO `auth_permission` VALUES ('54', 'Can delete custom tag', '18', 'delete_customtag');
INSERT INTO `auth_permission` VALUES ('55', 'Can add assets', '19', 'add_assets');
INSERT INTO `auth_permission` VALUES ('56', 'Can change assets', '19', 'change_assets');
INSERT INTO `auth_permission` VALUES ('57', 'Can delete assets', '19', 'delete_assets');
INSERT INTO `auth_permission` VALUES ('58', 'Can add error log', '20', 'add_errorlog');
INSERT INTO `auth_permission` VALUES ('59', 'Can change error log', '20', 'change_errorlog');
INSERT INTO `auth_permission` VALUES ('60', 'Can delete error log', '20', 'delete_errorlog');
INSERT INTO `auth_permission` VALUES ('61', 'Can add hosts', '21', 'add_hosts');
INSERT INTO `auth_permission` VALUES ('62', 'Can change hosts', '21', 'change_hosts');
INSERT INTO `auth_permission` VALUES ('63', 'Can delete hosts', '21', 'delete_hosts');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES ('1', 'pbkdf2_sha256$30000$EAxzh2wTiYUl$ZseWgowRbDIpoye6Yz8m7nElF0AYlCTSH08Vh74Y3DY=', '2017-06-12 15:29:54', '1', 'admin', '', '', '', '1', '1', '2017-06-11 08:21:15');

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for cmdb_aadmininfo
-- ----------------------------
DROP TABLE IF EXISTS `cmdb_aadmininfo`;
CREATE TABLE `cmdb_aadmininfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(32) NOT NULL,
  `admin_type` smallint(5) unsigned NOT NULL,
  `create_time` datetime NOT NULL,
  `modify_time` datetime NOT NULL,
  `name_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_id` (`name_id`),
  CONSTRAINT `cmdb_aadmininfo_name_id_191d5fa2_fk_cmdb_userprofile_id` FOREIGN KEY (`name_id`) REFERENCES `cmdb_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cmdb_aadmininfo
-- ----------------------------

-- ----------------------------
-- Table structure for cmdb_assetrecord
-- ----------------------------
DROP TABLE IF EXISTS `cmdb_assetrecord`;
CREATE TABLE `cmdb_assetrecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` longtext NOT NULL,
  `modify_time` datetime NOT NULL,
  `asset_obj_id` int(11) NOT NULL,
  `creator_id` int(11),
  PRIMARY KEY (`id`),
  KEY `cmdb_assetrecord_ac7d9b9f` (`asset_obj_id`),
  KEY `cmdb_assetrecord_3700153c` (`creator_id`),
  CONSTRAINT `cmdb_assetrecord_asset_obj_id_b343a988_fk_cmdb_assets_id` FOREIGN KEY (`asset_obj_id`) REFERENCES `cmdb_assets` (`id`),
  CONSTRAINT `cmdb_assetrecord_creator_id_90632009_fk_cmdb_userprofile_id` FOREIGN KEY (`creator_id`) REFERENCES `cmdb_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cmdb_assetrecord
-- ----------------------------

-- ----------------------------
-- Table structure for cmdb_assets
-- ----------------------------
DROP TABLE IF EXISTS `cmdb_assets`;
CREATE TABLE `cmdb_assets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `device_type_id` smallint(5) unsigned NOT NULL,
  `device_status_id` smallint(5) unsigned NOT NULL,
  `cabinet_num` varchar(32) NOT NULL,
  `cabinet_order` varchar(32) NOT NULL,
  `create_time` datetime NOT NULL,
  `modify_time` datetime NOT NULL,
  `notes` longtext,
  `Project_id` int(11),
  `idc_id` int(11),
  PRIMARY KEY (`id`),
  KEY `cmdb_assets_c6ca4204` (`Project_id`),
  KEY `cmdb_assets_0869e37a` (`idc_id`),
  CONSTRAINT `cmdb_assets_idc_id_5a44f590_fk_cmdb_idc_id` FOREIGN KEY (`idc_id`) REFERENCES `cmdb_idc` (`id`),
  CONSTRAINT `cmdb_assets_Project_id_a42ef085_fk_cmdb_project_id` FOREIGN KEY (`Project_id`) REFERENCES `cmdb_project` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cmdb_assets
-- ----------------------------
INSERT INTO `cmdb_assets` VALUES ('1', '1', '1', 'b5', '01', '2017-06-11 08:50:38', '2017-06-11 08:50:38', '', '1', '1');
INSERT INTO `cmdb_assets` VALUES ('2', '1', '1', '05', '07', '2017-06-11 09:03:41', '2017-06-11 09:03:41', '', '1', '1');
INSERT INTO `cmdb_assets` VALUES ('3', '1', '1', 'c8', '03', '2017-06-12 14:14:17', '2017-06-12 14:14:17', '', '1', '1');
INSERT INTO `cmdb_assets` VALUES ('4', '0', '0', 'e5', '10', '2017-06-12 15:35:08', '2017-06-12 15:35:08', '', '1', '1');

-- ----------------------------
-- Table structure for cmdb_customtag
-- ----------------------------
DROP TABLE IF EXISTS `cmdb_customtag`;
CREATE TABLE `cmdb_customtag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `create_time` datetime NOT NULL,
  `modify_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cmdb_customtag
-- ----------------------------
INSERT INTO `cmdb_customtag` VALUES ('1', 'web', '2017-06-11 08:51:56', '2017-06-11 08:51:56');

-- ----------------------------
-- Table structure for cmdb_disk
-- ----------------------------
DROP TABLE IF EXISTS `cmdb_disk`;
CREATE TABLE `cmdb_disk` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `capacity` double NOT NULL,
  `pd_type` varchar(32) NOT NULL,
  `slot` varchar(16) NOT NULL,
  `model` varchar(16) NOT NULL,
  `manfacturer_id` smallint(5) unsigned NOT NULL,
  `assets_tag` varchar(32) NOT NULL,
  `sn` varchar(32) NOT NULL,
  `buy_date` date DEFAULT NULL,
  `warranty_date` date DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `modify_time` datetime NOT NULL,
  `server_obj_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `assets_tag` (`assets_tag`),
  UNIQUE KEY `sn` (`sn`),
  UNIQUE KEY `server_obj_id` (`server_obj_id`),
  CONSTRAINT `cmdb_disk_server_obj_id_6b63ee8c_fk_cmdb_hosts_id` FOREIGN KEY (`server_obj_id`) REFERENCES `cmdb_hosts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cmdb_disk
-- ----------------------------
INSERT INTO `cmdb_disk` VALUES ('4', '300', 'sas', '02', 'dell300', '1', '35sdgsg234532534', '3251235345345', '2017-06-11', '2017-06-11', '2017-06-11 09:15:38', '2017-06-11 09:15:38', '1');
INSERT INTO `cmdb_disk` VALUES ('5', '500', 'sas', '08', 'dell500', '1', 'asdsad', 'sadsad', '2017-06-12', '2017-06-12', '2017-06-12 14:00:51', '2017-06-12 14:00:51', '2');

-- ----------------------------
-- Table structure for cmdb_errorlog
-- ----------------------------
DROP TABLE IF EXISTS `cmdb_errorlog`;
CREATE TABLE `cmdb_errorlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(16) NOT NULL,
  `content` longtext NOT NULL,
  `modify_time` datetime NOT NULL,
  `asset_obj_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cmdb_errorlog_asset_obj_id_3aa194cf_fk_cmdb_assets_id` (`asset_obj_id`),
  CONSTRAINT `cmdb_errorlog_asset_obj_id_3aa194cf_fk_cmdb_assets_id` FOREIGN KEY (`asset_obj_id`) REFERENCES `cmdb_assets` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cmdb_errorlog
-- ----------------------------

-- ----------------------------
-- Table structure for cmdb_hosts
-- ----------------------------
DROP TABLE IF EXISTS `cmdb_hosts`;
CREATE TABLE `cmdb_hosts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hostname` varchar(32) NOT NULL,
  `manage_ip` char(39) DEFAULT NULL,
  `os_platform` smallint(5) unsigned NOT NULL,
  `os_version` varchar(16) NOT NULL,
  `cpu_model` varchar(16) DEFAULT NULL,
  `cpu_physical_count` int(11) DEFAULT NULL,
  `cpu_count` int(11) DEFAULT NULL,
  `model` varchar(16) DEFAULT NULL,
  `manfacturer_id` smallint(5) unsigned NOT NULL,
  `assets_tag` varchar(32) NOT NULL,
  `sn` varchar(32) NOT NULL,
  `buy_date` date DEFAULT NULL,
  `warranty_date` date DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `modify_time` datetime NOT NULL,
  `asset_obj_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hostname` (`hostname`),
  UNIQUE KEY `assets_tag` (`assets_tag`),
  UNIQUE KEY `sn` (`sn`),
  UNIQUE KEY `asset_obj_id` (`asset_obj_id`),
  CONSTRAINT `cmdb_hosts_asset_obj_id_e9c984a2_fk_cmdb_assets_id` FOREIGN KEY (`asset_obj_id`) REFERENCES `cmdb_assets` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cmdb_hosts
-- ----------------------------
INSERT INTO `cmdb_hosts` VALUES ('1', 'NR_169_90', '10.168.169.93', '1', '6.5-2.7', 'xero-e5', '2', '24', 'R610', '1', 'df9453454', 'sne232423424', '2015-10-21', '2017-06-11', '2017-06-11 08:53:39', '2017-06-11 08:53:39', '1');
INSERT INTO `cmdb_hosts` VALUES ('2', 'NR_170_100', '10.168.170.100', '1', '7-3.1', 'xero-e5', '2', '24', 'R710', '1', 'dfsgfsdgdfgfg', 'sgsfdgsdfgf', '2017-06-11', '2017-06-11', '2017-06-11 09:03:50', '2017-06-11 09:03:50', '2');
INSERT INTO `cmdb_hosts` VALUES ('3', 'NR_169_190', '10.168.169.190', '1', 'a', '', null, null, '', '1', '', 'sss', '2017-06-12', '2017-06-12', '2017-06-12 14:16:51', '2017-06-12 14:16:51', '3');

-- ----------------------------
-- Table structure for cmdb_hosts_custom_tag
-- ----------------------------
DROP TABLE IF EXISTS `cmdb_hosts_custom_tag`;
CREATE TABLE `cmdb_hosts_custom_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hosts_id` int(11) NOT NULL,
  `customtag_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cmdb_hosts_custom_tag_hosts_id_f7399f9c_uniq` (`hosts_id`,`customtag_id`),
  KEY `cmdb_hosts_custom_tag_customtag_id_e99dd103_fk_cmdb_customtag_id` (`customtag_id`),
  CONSTRAINT `cmdb_hosts_custom_tag_customtag_id_e99dd103_fk_cmdb_customtag_id` FOREIGN KEY (`customtag_id`) REFERENCES `cmdb_customtag` (`id`),
  CONSTRAINT `cmdb_hosts_custom_tag_hosts_id_749c615b_fk_cmdb_hosts_id` FOREIGN KEY (`hosts_id`) REFERENCES `cmdb_hosts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cmdb_hosts_custom_tag
-- ----------------------------
INSERT INTO `cmdb_hosts_custom_tag` VALUES ('1', '1', '1');
INSERT INTO `cmdb_hosts_custom_tag` VALUES ('2', '2', '1');
INSERT INTO `cmdb_hosts_custom_tag` VALUES ('3', '3', '1');

-- ----------------------------
-- Table structure for cmdb_hosts_service
-- ----------------------------
DROP TABLE IF EXISTS `cmdb_hosts_service`;
CREATE TABLE `cmdb_hosts_service` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hosts_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cmdb_hosts_service_hosts_id_cc9b5553_uniq` (`hosts_id`,`service_id`),
  KEY `cmdb_hosts_service_service_id_fd1109b0_fk_cmdb_service_id` (`service_id`),
  CONSTRAINT `cmdb_hosts_service_hosts_id_40185eaa_fk_cmdb_hosts_id` FOREIGN KEY (`hosts_id`) REFERENCES `cmdb_hosts` (`id`),
  CONSTRAINT `cmdb_hosts_service_service_id_fd1109b0_fk_cmdb_service_id` FOREIGN KEY (`service_id`) REFERENCES `cmdb_service` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cmdb_hosts_service
-- ----------------------------
INSERT INTO `cmdb_hosts_service` VALUES ('1', '1', '1');
INSERT INTO `cmdb_hosts_service` VALUES ('2', '2', '1');
INSERT INTO `cmdb_hosts_service` VALUES ('3', '2', '2');
INSERT INTO `cmdb_hosts_service` VALUES ('4', '3', '3');

-- ----------------------------
-- Table structure for cmdb_idc
-- ----------------------------
DROP TABLE IF EXISTS `cmdb_idc`;
CREATE TABLE `cmdb_idc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `phone` varchar(32) NOT NULL,
  `linkman` varchar(32) NOT NULL,
  `operator` int(11),
  `type` int(11),
  `bandwidth` varchar(64) NOT NULL,
  `floor` int(11) NOT NULL,
  `address` varchar(128) NOT NULL,
  `create_time` datetime NOT NULL,
  `modify_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cmdb_idc
-- ----------------------------
INSERT INTO `cmdb_idc` VALUES ('1', '上地软件园机房', '010-86453433', '客服', '4', '2', '40G', '1', '北京市海淀区上地五街100号', '2017-06-11 08:50:30', '2017-06-11 08:50:30');

-- ----------------------------
-- Table structure for cmdb_memory
-- ----------------------------
DROP TABLE IF EXISTS `cmdb_memory`;
CREATE TABLE `cmdb_memory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `model` varchar(16) NOT NULL,
  `capacity` double DEFAULT NULL,
  `slot` varchar(16) NOT NULL,
  `manfacturer_id` smallint(5) unsigned NOT NULL,
  `assets_tag` varchar(32) NOT NULL,
  `sn` varchar(32) NOT NULL,
  `buy_date` date DEFAULT NULL,
  `warranty_date` date DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `modify_time` datetime NOT NULL,
  `server_obj_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `assets_tag` (`assets_tag`),
  UNIQUE KEY `sn` (`sn`),
  UNIQUE KEY `server_obj_id` (`server_obj_id`),
  CONSTRAINT `cmdb_memory_server_obj_id_481e90cc_fk_cmdb_hosts_id` FOREIGN KEY (`server_obj_id`) REFERENCES `cmdb_hosts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cmdb_memory
-- ----------------------------
INSERT INTO `cmdb_memory` VALUES ('1', 'ddr3-1600', '8', '01', '1', 'nf300043', 'sae33333333333', '2016-09-22', '2017-06-11', '2017-06-11 08:53:56', '2017-06-11 08:53:56', '1');
INSERT INTO `cmdb_memory` VALUES ('6', 'ddr4-2100', '33', '05', '1', '', 'sdfasdfdsf', '2017-06-12', '2017-06-12', '2017-06-12 14:08:19', '2017-06-12 14:08:19', '2');
INSERT INTO `cmdb_memory` VALUES ('7', 'dell300', '8', '05', '1', 'fff', 'sdsfff', '2017-06-12', '2017-06-12', '2017-06-12 14:17:51', '2017-06-12 14:17:51', '3');

-- ----------------------------
-- Table structure for cmdb_networkdevice
-- ----------------------------
DROP TABLE IF EXISTS `cmdb_networkdevice`;
CREATE TABLE `cmdb_networkdevice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vlan_ip` char(39) DEFAULT NULL,
  `intranet_ip` char(39) DEFAULT NULL,
  `manage_ip` char(39) DEFAULT NULL,
  `port_num` smallint(5) unsigned DEFAULT NULL,
  `model` varchar(16) DEFAULT NULL,
  `manfacturer_id` smallint(5) unsigned NOT NULL,
  `assets_tag` varchar(32) NOT NULL,
  `sn` varchar(32) NOT NULL,
  `buy_date` date DEFAULT NULL,
  `warranty_date` date DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `modify_time` datetime NOT NULL,
  `asset_obj_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `assets_tag` (`assets_tag`),
  UNIQUE KEY `sn` (`sn`),
  UNIQUE KEY `asset_obj_id` (`asset_obj_id`),
  CONSTRAINT `cmdb_networkdevice_asset_obj_id_7046c985_fk_cmdb_assets_id` FOREIGN KEY (`asset_obj_id`) REFERENCES `cmdb_assets` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cmdb_networkdevice
-- ----------------------------

-- ----------------------------
-- Table structure for cmdb_networkdevice_custom_tag
-- ----------------------------
DROP TABLE IF EXISTS `cmdb_networkdevice_custom_tag`;
CREATE TABLE `cmdb_networkdevice_custom_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `networkdevice_id` int(11) NOT NULL,
  `customtag_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cmdb_networkdevice_custom_tag_networkdevice_id_0639deb1_uniq` (`networkdevice_id`,`customtag_id`),
  KEY `cmdb_networkdevice_cu_customtag_id_fab313e4_fk_cmdb_customtag_id` (`customtag_id`),
  CONSTRAINT `cmdb_networkdevice_cu_customtag_id_fab313e4_fk_cmdb_customtag_id` FOREIGN KEY (`customtag_id`) REFERENCES `cmdb_customtag` (`id`),
  CONSTRAINT `cmdb_networkd_networkdevice_id_bbd92336_fk_cmdb_networkdevice_id` FOREIGN KEY (`networkdevice_id`) REFERENCES `cmdb_networkdevice` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cmdb_networkdevice_custom_tag
-- ----------------------------

-- ----------------------------
-- Table structure for cmdb_nic
-- ----------------------------
DROP TABLE IF EXISTS `cmdb_nic`;
CREATE TABLE `cmdb_nic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `hwaddr` varchar(32) NOT NULL,
  `netmask` varchar(32) NOT NULL,
  `ipaddrs` char(39) NOT NULL,
  `model` varchar(16) NOT NULL,
  `create_time` datetime NOT NULL,
  `modify_time` datetime NOT NULL,
  `server_obj_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `server_obj_id` (`server_obj_id`),
  CONSTRAINT `cmdb_nic_server_obj_id_70f0730f_fk_cmdb_hosts_id` FOREIGN KEY (`server_obj_id`) REFERENCES `cmdb_hosts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cmdb_nic
-- ----------------------------
INSERT INTO `cmdb_nic` VALUES ('1', 'eth0', 'dfasdfasdfasdf', 'sasdfasdfa', '192.168.30.5', 'Inter345', '2017-06-11 09:16:51', '2017-06-11 09:16:51', '1');
INSERT INTO `cmdb_nic` VALUES ('3', 'em1', 'sfsadfasdfasdfasd', '225.225.225.0', '10.168.169.90', 'Inter345', '2017-06-12 14:09:00', '2017-06-12 14:09:00', '2');

-- ----------------------------
-- Table structure for cmdb_project
-- ----------------------------
DROP TABLE IF EXISTS `cmdb_project`;
CREATE TABLE `cmdb_project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `description` longtext NOT NULL,
  `create_time` datetime NOT NULL,
  `modify_time` datetime NOT NULL,
  `head_id` int(11) NOT NULL,
  `manager_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `cmdb_project_d7ad277a` (`head_id`),
  KEY `cmdb_project_8784215c` (`manager_id`),
  CONSTRAINT `cmdb_project_head_id_f7a35780_fk_cmdb_usergroup_id` FOREIGN KEY (`head_id`) REFERENCES `cmdb_usergroup` (`id`),
  CONSTRAINT `cmdb_project_manager_id_b3ecdf8f_fk_cmdb_usergroup_id` FOREIGN KEY (`manager_id`) REFERENCES `cmdb_usergroup` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cmdb_project
-- ----------------------------
INSERT INTO `cmdb_project` VALUES ('1', '中华云一期', '中华云一期承接国际台内容聚合系统', '2017-06-11 08:46:58', '2017-06-11 08:46:58', '1', '2');

-- ----------------------------
-- Table structure for cmdb_service
-- ----------------------------
DROP TABLE IF EXISTS `cmdb_service`;
CREATE TABLE `cmdb_service` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `version` varchar(16) NOT NULL,
  `port` int(10) unsigned DEFAULT NULL,
  `path` varchar(32) NOT NULL,
  `cmd` varchar(32) NOT NULL,
  `create_time` datetime NOT NULL,
  `modify_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `version` (`version`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cmdb_service
-- ----------------------------
INSERT INTO `cmdb_service` VALUES ('1', 'Nginx', '2.1', '80', '/user/local/nginx', '/user/local/nginx/sbin/nginx -s', '2017-06-11 08:51:31', '2017-06-11 08:51:31');
INSERT INTO `cmdb_service` VALUES ('2', 'php', '5.7', '80', '/user/local/php', 'ls', '2017-06-11 08:54:35', '2017-06-11 08:54:35');
INSERT INTO `cmdb_service` VALUES ('3', 'haproxy', '2.5', '80', '/user/local/haproxy', '/etc/init.d/haproxy reload', '2017-06-11 08:55:31', '2017-06-11 08:55:31');

-- ----------------------------
-- Table structure for cmdb_usergroup
-- ----------------------------
DROP TABLE IF EXISTS `cmdb_usergroup`;
CREATE TABLE `cmdb_usergroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `group_info` longtext,
  `create_time` datetime NOT NULL,
  `modify_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cmdb_usergroup
-- ----------------------------
INSERT INTO `cmdb_usergroup` VALUES ('1', '中华云一期项目组', '', '2017-06-11 08:25:11', '2017-06-11 08:25:11');
INSERT INTO `cmdb_usergroup` VALUES ('2', '运维组', '', '2017-06-11 08:46:25', '2017-06-11 08:46:25');

-- ----------------------------
-- Table structure for cmdb_usergroup_users
-- ----------------------------
DROP TABLE IF EXISTS `cmdb_usergroup_users`;
CREATE TABLE `cmdb_usergroup_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usergroup_id` int(11) NOT NULL,
  `userprofile_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cmdb_usergroup_users_usergroup_id_cfd18320_uniq` (`usergroup_id`,`userprofile_id`),
  KEY `cmdb_usergroup_us_userprofile_id_f6d96e9d_fk_cmdb_userprofile_id` (`userprofile_id`),
  CONSTRAINT `cmdb_usergroup_users_usergroup_id_33c54d4b_fk_cmdb_usergroup_id` FOREIGN KEY (`usergroup_id`) REFERENCES `cmdb_usergroup` (`id`),
  CONSTRAINT `cmdb_usergroup_us_userprofile_id_f6d96e9d_fk_cmdb_userprofile_id` FOREIGN KEY (`userprofile_id`) REFERENCES `cmdb_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cmdb_usergroup_users
-- ----------------------------
INSERT INTO `cmdb_usergroup_users` VALUES ('1', '1', '1');
INSERT INTO `cmdb_usergroup_users` VALUES ('2', '1', '2');
INSERT INTO `cmdb_usergroup_users` VALUES ('3', '2', '3');
INSERT INTO `cmdb_usergroup_users` VALUES ('4', '2', '4');

-- ----------------------------
-- Table structure for cmdb_userprofile
-- ----------------------------
DROP TABLE IF EXISTS `cmdb_userprofile`;
CREATE TABLE `cmdb_userprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `duties` smallint(5) unsigned NOT NULL,
  `sector` smallint(5) unsigned NOT NULL,
  `phone` varchar(16) NOT NULL,
  `wechat` varchar(32) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `email` varchar(254) NOT NULL,
  `create_time` datetime NOT NULL,
  `modify_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `mobile` (`mobile`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cmdb_userprofile
-- ----------------------------
INSERT INTO `cmdb_userprofile` VALUES ('1', '李鹏飞', '7', '3', '', 'lipengfei', '187434324356', 'pengfei.li@bj.china.com', '2017-06-11 08:24:26', '2017-06-11 08:24:26');
INSERT INTO `cmdb_userprofile` VALUES ('2', '狂野', '7', '3', '', 'kuanfye', '15763564453', 'kuangye@bj.china.com', '2017-06-11 08:25:04', '2017-06-11 08:25:04');
INSERT INTO `cmdb_userprofile` VALUES ('3', '占美亮', '2', '1', '', 'zhanmeiliang', '18801003759', 'meiliang.zhan@bj.china.com', '2017-06-11 08:45:46', '2017-06-11 08:45:46');
INSERT INTO `cmdb_userprofile` VALUES ('4', '郑行涛', '2', '1', '', 'hangtao.zheng', '1358566746', 'hangtao.zheng@bj.china.com', '2017-06-11 08:46:23', '2017-06-11 08:46:23');

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
INSERT INTO `django_admin_log` VALUES ('1', '2017-06-11 08:24:26', '1', '李鹏飞', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('2', '2017-06-11 08:25:04', '2', '狂野', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('3', '2017-06-11 08:25:11', '1', '中华云一期项目组', '1', '[{\"added\": {}}]', '15', '1');
INSERT INTO `django_admin_log` VALUES ('4', '2017-06-11 08:45:46', '3', '占美亮', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('5', '2017-06-11 08:46:23', '4', '郑行涛', '1', '[{\"added\": {}}]', '11', '1');
INSERT INTO `django_admin_log` VALUES ('6', '2017-06-11 08:46:25', '2', '运维组', '1', '[{\"added\": {}}]', '15', '1');
INSERT INTO `django_admin_log` VALUES ('7', '2017-06-11 08:46:58', '1', '中华云一期', '1', '[{\"added\": {}}]', '16', '1');
INSERT INTO `django_admin_log` VALUES ('8', '2017-06-11 08:50:30', '1', '上地软件园机房', '1', '[{\"added\": {}}]', '12', '1');
INSERT INTO `django_admin_log` VALUES ('9', '2017-06-11 08:50:38', '1', '上地软件园机房-b5-01', '1', '[{\"added\": {}}]', '19', '1');
INSERT INTO `django_admin_log` VALUES ('10', '2017-06-11 08:51:31', '1', 'Nginx', '1', '[{\"added\": {}}]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('11', '2017-06-11 08:51:56', '1', 'web', '1', '[{\"added\": {}}]', '18', '1');
INSERT INTO `django_admin_log` VALUES ('12', '2017-06-11 08:53:39', '1', 'NR_169_90', '1', '[{\"added\": {}}]', '21', '1');
INSERT INTO `django_admin_log` VALUES ('13', '2017-06-11 08:53:56', '1', 'NR_169_90-8.0-01', '1', '[{\"added\": {}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('14', '2017-06-11 08:54:35', '2', 'php', '1', '[{\"added\": {}}]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('15', '2017-06-11 08:55:31', '3', 'haproxy', '1', '[{\"added\": {}}]', '10', '1');
INSERT INTO `django_admin_log` VALUES ('16', '2017-06-11 09:03:41', '2', '上地软件园机房-05-07', '1', '[{\"added\": {}}]', '19', '1');
INSERT INTO `django_admin_log` VALUES ('17', '2017-06-11 09:03:50', '2', 'NR_170_100', '1', '[{\"added\": {}}]', '21', '1');
INSERT INTO `django_admin_log` VALUES ('18', '2017-06-11 09:15:38', '4', 'NR_169_90-300.0-02', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('19', '2017-06-11 09:16:51', '1', 'NR_169_90-eth0-192.168.30.5', '1', '[{\"added\": {}}]', '13', '1');
INSERT INTO `django_admin_log` VALUES ('20', '2017-06-12 14:00:51', '5', 'NR_170_100-500.0-08', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('21', '2017-06-12 14:08:19', '6', 'NR_170_100-05', '1', '[{\"added\": {}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('22', '2017-06-12 14:09:00', '3', 'NR_170_100-em1-10.168.169.90', '1', '[{\"added\": {}}]', '13', '1');
INSERT INTO `django_admin_log` VALUES ('23', '2017-06-12 14:14:17', '3', '上地软件园机房-c8-03', '1', '[{\"added\": {}}]', '19', '1');
INSERT INTO `django_admin_log` VALUES ('24', '2017-06-12 14:16:51', '3', 'NR_169_190', '1', '[{\"added\": {}}]', '21', '1');
INSERT INTO `django_admin_log` VALUES ('25', '2017-06-12 14:17:51', '7', 'NR_169_190-05', '1', '[{\"added\": {}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('26', '2017-06-12 15:35:08', '4', '上地软件园机房-服务器-e5-10', '1', '[{\"added\": {}}]', '19', '1');

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('4', 'auth', 'user');
INSERT INTO `django_content_type` VALUES ('8', 'cmdb', 'aadmininfo');
INSERT INTO `django_content_type` VALUES ('14', 'cmdb', 'assetrecord');
INSERT INTO `django_content_type` VALUES ('19', 'cmdb', 'assets');
INSERT INTO `django_content_type` VALUES ('18', 'cmdb', 'customtag');
INSERT INTO `django_content_type` VALUES ('7', 'cmdb', 'disk');
INSERT INTO `django_content_type` VALUES ('20', 'cmdb', 'errorlog');
INSERT INTO `django_content_type` VALUES ('21', 'cmdb', 'hosts');
INSERT INTO `django_content_type` VALUES ('12', 'cmdb', 'idc');
INSERT INTO `django_content_type` VALUES ('9', 'cmdb', 'memory');
INSERT INTO `django_content_type` VALUES ('17', 'cmdb', 'networkdevice');
INSERT INTO `django_content_type` VALUES ('13', 'cmdb', 'nic');
INSERT INTO `django_content_type` VALUES ('16', 'cmdb', 'project');
INSERT INTO `django_content_type` VALUES ('10', 'cmdb', 'service');
INSERT INTO `django_content_type` VALUES ('15', 'cmdb', 'usergroup');
INSERT INTO `django_content_type` VALUES ('11', 'cmdb', 'userprofile');
INSERT INTO `django_content_type` VALUES ('5', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('6', 'sessions', 'session');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2017-06-11 08:19:49');
INSERT INTO `django_migrations` VALUES ('2', 'auth', '0001_initial', '2017-06-11 08:19:49');
INSERT INTO `django_migrations` VALUES ('3', 'admin', '0001_initial', '2017-06-11 08:19:49');
INSERT INTO `django_migrations` VALUES ('4', 'admin', '0002_logentry_remove_auto_add', '2017-06-11 08:19:49');
INSERT INTO `django_migrations` VALUES ('5', 'contenttypes', '0002_remove_content_type_name', '2017-06-11 08:19:49');
INSERT INTO `django_migrations` VALUES ('6', 'auth', '0002_alter_permission_name_max_length', '2017-06-11 08:19:49');
INSERT INTO `django_migrations` VALUES ('7', 'auth', '0003_alter_user_email_max_length', '2017-06-11 08:19:49');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0004_alter_user_username_opts', '2017-06-11 08:19:50');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0005_alter_user_last_login_null', '2017-06-11 08:19:50');
INSERT INTO `django_migrations` VALUES ('10', 'auth', '0006_require_contenttypes_0002', '2017-06-11 08:19:50');
INSERT INTO `django_migrations` VALUES ('11', 'auth', '0007_alter_validators_add_error_messages', '2017-06-11 08:19:50');
INSERT INTO `django_migrations` VALUES ('12', 'auth', '0008_alter_user_username_max_length', '2017-06-11 08:19:50');
INSERT INTO `django_migrations` VALUES ('13', 'cmdb', '0001_initial', '2017-06-11 08:19:51');
INSERT INTO `django_migrations` VALUES ('14', 'sessions', '0001_initial', '2017-06-11 08:19:51');
INSERT INTO `django_migrations` VALUES ('15', 'cmdb', '0002_auto_20170611_1653', '2017-06-11 08:53:30');
INSERT INTO `django_migrations` VALUES ('16', 'cmdb', '0003_auto_20170612_2308', '2017-06-12 15:08:09');
INSERT INTO `django_migrations` VALUES ('17', 'cmdb', '0004_auto_20170612_2309', '2017-06-12 15:09:56');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('bgnaggosgzyif2evk7eqc832dxfimyo1', 'NTQ0NmM1NmNhNzgzZjE2OTQ3MmJkNGRhYjIwMTViMGVjZjRiNDIzMTp7Il9hdXRoX3VzZXJfaGFzaCI6IjY0NTcyMzk0NTZlNWI3ZTFlYzMwZmQzOWFmNzRiMDJlYTM0NmI3YTgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2017-06-26 15:29:54');
INSERT INTO `django_session` VALUES ('lii4pqok0u46gikdquwhlke81v4cvovn', 'MzQ5MzYxMzE4MWVhNTMzZTkzYmM4NTQzNmY0ZGNmOTMzYTgzNzY0NDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNjQ1NzIzOTQ1NmU1YjdlMWVjMzBmZDM5YWY3NGIwMmVhMzQ2YjdhOCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2017-06-25 08:21:43');
INSERT INTO `django_session` VALUES ('wso62akdysqutn51ejp5obekedag8sho', 'MzQ5MzYxMzE4MWVhNTMzZTkzYmM4NTQzNmY0ZGNmOTMzYTgzNzY0NDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNjQ1NzIzOTQ1NmU1YjdlMWVjMzBmZDM5YWY3NGIwMmVhMzQ2YjdhOCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2017-06-26 12:41:53');

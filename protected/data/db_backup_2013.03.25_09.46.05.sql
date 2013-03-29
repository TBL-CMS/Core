-- -------------------------------------------
SET AUTOCOMMIT=0;
START TRANSACTION;
SET SQL_QUOTE_SHOW_CREATE = 1;
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
-- -------------------------------------------
-- -------------------------------------------
-- START BACKUP
-- -------------------------------------------
-- -------------------------------------------
-- TABLE cms_blocks
-- -------------------------------------------
DROP TABLE IF EXISTS cms_blocks;
CREATE TABLE IF NOT EXISTS `cms_blocks` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `body` longtext,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT NULL,
  `parentId` int(10) DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name_deleted` (`name`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE cms_blog
-- -------------------------------------------
DROP TABLE IF EXISTS cms_blog;
CREATE TABLE IF NOT EXISTS `cms_blog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(70) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `metaDescription` varchar(160) DEFAULT NULL,
  `tags` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `slug` varchar(70) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `modified` timestamp NULL DEFAULT NULL,
  `date_start` timestamp NULL DEFAULT NULL,
  `type` varchar(25) NOT NULL DEFAULT '0',
  `parentId` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL,
  `author_id` int(11) NOT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE cms_comment
-- -------------------------------------------
DROP TABLE IF EXISTS cms_comment;
CREATE TABLE IF NOT EXISTS `cms_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(128) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `author` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `blog_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE cms_content_media
-- -------------------------------------------
DROP TABLE IF EXISTS cms_content_media;
CREATE TABLE IF NOT EXISTS `cms_content_media` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `content_id` int(11) DEFAULT NULL,
  `media_id` int(11) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `tag` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE cms_lookup
-- -------------------------------------------
DROP TABLE IF EXISTS cms_lookup;
CREATE TABLE IF NOT EXISTS `cms_lookup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `code` int(11) NOT NULL,
  `type` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `position` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE cms_media
-- -------------------------------------------
DROP TABLE IF EXISTS cms_media;
CREATE TABLE IF NOT EXISTS `cms_media` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `filename` varchar(255) NOT NULL,
  `source` varchar(255) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `extension` varchar(50) NOT NULL,
  `mimeType` varchar(255) NOT NULL,
  `byteSize` int(10) unsigned NOT NULL,
  `published` tinyint(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE cms_page
-- -------------------------------------------
DROP TABLE IF EXISTS cms_page;
CREATE TABLE IF NOT EXISTS `cms_page` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(70) NOT NULL DEFAULT '',
  `heading` varchar(70) DEFAULT NULL,
  `body` longtext,
  `metaDescription` varchar(160) DEFAULT NULL,
  `tags` text,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT NULL,
  `level` varchar(25) NOT NULL DEFAULT 'page',
  `parentId` int(10) NOT NULL DEFAULT '0',
  `type` tinyint(4) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name_deleted` (`name`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE cms_settings
-- -------------------------------------------
DROP TABLE IF EXISTS cms_settings;
CREATE TABLE IF NOT EXISTS `cms_settings` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `define` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE cms_tag
-- -------------------------------------------
DROP TABLE IF EXISTS cms_tag;
CREATE TABLE IF NOT EXISTS `cms_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `frequency` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE cms_user
-- -------------------------------------------
DROP TABLE IF EXISTS cms_user;
CREATE TABLE IF NOT EXISTS `cms_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `firstname` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastname` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `modified` timestamp NULL DEFAULT NULL,
  `level` tinyint(128) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `activkey` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -------------------------------------------
-- TABLE DATA cms_lookup
-- -------------------------------------------
INSERT INTO `cms_lookup` (`id`,`name`,`code`,`type`,`position`) VALUES
('1','Draft','1','PostStatus','1');
INSERT INTO `cms_lookup` (`id`,`name`,`code`,`type`,`position`) VALUES
('2','Published','2','PostStatus','2');
INSERT INTO `cms_lookup` (`id`,`name`,`code`,`type`,`position`) VALUES
('3','Archived','3','PostStatus','3');
INSERT INTO `cms_lookup` (`id`,`name`,`code`,`type`,`position`) VALUES
('4','Pending Approval','1','CommentStatus','1');
INSERT INTO `cms_lookup` (`id`,`name`,`code`,`type`,`position`) VALUES
('5','Approved','2','CommentStatus','2');
INSERT INTO `cms_lookup` (`id`,`name`,`code`,`type`,`position`) VALUES
('6','Yes','1','MediaStatus','1');
INSERT INTO `cms_lookup` (`id`,`name`,`code`,`type`,`position`) VALUES
('7','No','0','MediaStatus','2');
INSERT INTO `cms_lookup` (`id`,`name`,`code`,`type`,`position`) VALUES
('8','Draft','1','PageStatus','1');
INSERT INTO `cms_lookup` (`id`,`name`,`code`,`type`,`position`) VALUES
('9','Published','2','PageStatus','2');
INSERT INTO `cms_lookup` (`id`,`name`,`code`,`type`,`position`) VALUES
('10','Archived','3','PageStatus','3');
INSERT INTO `cms_lookup` (`id`,`name`,`code`,`type`,`position`) VALUES
('11','Yes','1','BlockStatus','1');
INSERT INTO `cms_lookup` (`id`,`name`,`code`,`type`,`position`) VALUES
('12','No','0','BlockStatus','2');
INSERT INTO `cms_lookup` (`id`,`name`,`code`,`type`,`position`) VALUES
('13','User','2','UserLevel','1');
INSERT INTO `cms_lookup` (`id`,`name`,`code`,`type`,`position`) VALUES
('14','Admin','1','UserLevel','2');
INSERT INTO `cms_lookup` (`id`,`name`,`code`,`type`,`position`) VALUES
('15','Inactive','1','UserStatus','1');
INSERT INTO `cms_lookup` (`id`,`name`,`code`,`type`,`position`) VALUES
('16','Active','2','UserStatus','2');
INSERT INTO `cms_lookup` (`id`,`name`,`code`,`type`,`position`) VALUES
('17','Banned','3','UserStatus','3');
INSERT INTO `cms_lookup` (`id`,`name`,`code`,`type`,`position`) VALUES
('18','Cms','1','PageType','1');
INSERT INTO `cms_lookup` (`id`,`name`,`code`,`type`,`position`) VALUES
('19','Non Cms','2','PageType','2');



-- -------------------------------------------
-- TABLE DATA cms_settings
-- -------------------------------------------
INSERT INTO `cms_settings` (`id`,`define`,`value`) VALUES
('1','site_name','BroomeCMS');
INSERT INTO `cms_settings` (`id`,`define`,`value`) VALUES
('2','home_meta_description','example description');
INSERT INTO `cms_settings` (`id`,`define`,`value`) VALUES
('3','home_meta_keywords','example, keyowords');
INSERT INTO `cms_settings` (`id`,`define`,`value`) VALUES
('4','admin_email','admin@admin.com');
INSERT INTO `cms_settings` (`id`,`define`,`value`) VALUES
('5','twitter','abctwitter');
INSERT INTO `cms_settings` (`id`,`define`,`value`) VALUES
('6','facebook','');
INSERT INTO `cms_settings` (`id`,`define`,`value`) VALUES
('7','youtube','');
INSERT INTO `cms_settings` (`id`,`define`,`value`) VALUES
('8','myspace','');
INSERT INTO `cms_settings` (`id`,`define`,`value`) VALUES
('9','soundcloud','');
INSERT INTO `cms_settings` (`id`,`define`,`value`) VALUES
('10','pintrest','');
INSERT INTO `cms_settings` (`id`,`define`,`value`) VALUES
('11','telephone','');
INSERT INTO `cms_settings` (`id`,`define`,`value`) VALUES
('12','address','');
INSERT INTO `cms_settings` (`id`,`define`,`value`) VALUES
('13','mobile','');
INSERT INTO `cms_settings` (`id`,`define`,`value`) VALUES
('14','fax','');



-- -------------------------------------------
-- TABLE DATA cms_user
-- -------------------------------------------
INSERT INTO `cms_user` (`id`,`username`,`password`,`email`,`firstname`,`lastname`,`created`,`modified`,`level`,`status`,`activkey`) VALUES
('1','demo','$2a$10$JTJf6/XqC94rrOtzuF397OHa4mbmZrVTBOQCmYD9U.obZRUut4BoC','webmaster@example.com','','','2013-03-01 12:21:41','2013-03-01 12:21:41','2','2','');
INSERT INTO `cms_user` (`id`,`username`,`password`,`email`,`firstname`,`lastname`,`created`,`modified`,`level`,`status`,`activkey`) VALUES
('2','admin','$2a$10$TaMCcwXsT.JsDlIWztuOo.xDJ9uSH5hfqad.Ui5YxNgtQYV1wrG8.','parminder@tblmarketing.com','','','2013-03-21 17:18:53','2013-03-21 17:21:59','1','2','');



-- -------------------------------------------
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
COMMIT;
-- -------------------------------------------
-- -------------------------------------------
-- END BACKUP
-- -------------------------------------------
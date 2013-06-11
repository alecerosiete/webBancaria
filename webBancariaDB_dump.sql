-- MySQL dump 10.13  Distrib 5.5.28, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: caja
-- ------------------------------------------------------
-- Server version	5.5.28-0ubuntu0.12.10.2

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
-- Table structure for table `jos_banner`
--

DROP TABLE IF EXISTS `jos_banner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_banner` (
  `bid` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL DEFAULT '0',
  `type` varchar(30) NOT NULL DEFAULT 'banner',
  `name` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) NOT NULL DEFAULT '',
  `imptotal` int(11) NOT NULL DEFAULT '0',
  `impmade` int(11) NOT NULL DEFAULT '0',
  `clicks` int(11) NOT NULL DEFAULT '0',
  `imageurl` varchar(100) NOT NULL DEFAULT '',
  `clickurl` varchar(200) NOT NULL DEFAULT '',
  `date` datetime DEFAULT NULL,
  `showBanner` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `editor` varchar(50) DEFAULT NULL,
  `custombannercode` text,
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `sticky` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `tags` text NOT NULL,
  `params` text NOT NULL,
  PRIMARY KEY (`bid`),
  KEY `viewbanner` (`showBanner`),
  KEY `idx_banner_catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_banner`
--

LOCK TABLES `jos_banner` WRITE;
/*!40000 ALTER TABLE `jos_banner` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_banner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_bannerclient`
--

DROP TABLE IF EXISTS `jos_bannerclient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_bannerclient` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `contact` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `extrainfo` text NOT NULL,
  `checked_out` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out_time` time DEFAULT NULL,
  `editor` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_bannerclient`
--

LOCK TABLES `jos_bannerclient` WRITE;
/*!40000 ALTER TABLE `jos_bannerclient` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_bannerclient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_bannertrack`
--

DROP TABLE IF EXISTS `jos_bannertrack`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_bannertrack` (
  `track_date` date NOT NULL,
  `track_type` int(10) unsigned NOT NULL,
  `banner_id` int(10) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_bannertrack`
--

LOCK TABLES `jos_bannertrack` WRITE;
/*!40000 ALTER TABLE `jos_bannertrack` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_bannertrack` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_categories`
--

DROP TABLE IF EXISTS `jos_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) NOT NULL DEFAULT '',
  `image` varchar(255) NOT NULL DEFAULT '',
  `section` varchar(50) NOT NULL DEFAULT '',
  `image_position` varchar(30) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `editor` varchar(50) DEFAULT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  `access` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `count` int(11) NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cat_idx` (`section`,`published`,`access`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_categories`
--

LOCK TABLES `jos_categories` WRITE;
/*!40000 ALTER TABLE `jos_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_components`
--

DROP TABLE IF EXISTS `jos_components`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_components` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `link` varchar(255) NOT NULL DEFAULT '',
  `menuid` int(11) unsigned NOT NULL DEFAULT '0',
  `parent` int(11) unsigned NOT NULL DEFAULT '0',
  `admin_menu_link` varchar(255) NOT NULL DEFAULT '',
  `admin_menu_alt` varchar(255) NOT NULL DEFAULT '',
  `option` varchar(50) NOT NULL DEFAULT '',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `admin_menu_img` varchar(255) NOT NULL DEFAULT '',
  `iscore` tinyint(4) NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `parent_option` (`parent`,`option`(32))
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_components`
--

LOCK TABLES `jos_components` WRITE;
/*!40000 ALTER TABLE `jos_components` DISABLE KEYS */;
INSERT INTO `jos_components` VALUES (1,'Banners','',0,0,'','Banner Management','com_banners',0,'js/ThemeOffice/component.png',0,'track_impressions=0\ntrack_clicks=0\ntag_prefix=\n\n',1),(2,'Banners','',0,1,'option=com_banners','Active Banners','com_banners',1,'js/ThemeOffice/edit.png',0,'',1),(3,'Clients','',0,1,'option=com_banners&c=client','Manage Clients','com_banners',2,'js/ThemeOffice/categories.png',0,'',1),(4,'Web Links','option=com_weblinks',0,0,'','Manage Weblinks','com_weblinks',0,'js/ThemeOffice/component.png',0,'show_comp_description=1\ncomp_description=\nshow_link_hits=1\nshow_link_description=1\nshow_other_cats=1\nshow_headings=1\nshow_page_title=1\nlink_target=0\nlink_icons=\n\n',1),(5,'Links','',0,4,'option=com_weblinks','View existing weblinks','com_weblinks',1,'js/ThemeOffice/edit.png',0,'',1),(6,'Categories','',0,4,'option=com_categories&section=com_weblinks','Manage weblink categories','',2,'js/ThemeOffice/categories.png',0,'',1),(7,'Contacts','option=com_contact',0,0,'','Edit contact details','com_contact',0,'js/ThemeOffice/component.png',1,'contact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_fax=\nicon_misc=\nshow_headings=1\nshow_position=1\nshow_email=0\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nbannedEmail=\nbannedSubject=\nbannedText=\nsession=1\ncustomReply=0\n\n',1),(8,'Contacts','',0,7,'option=com_contact','Edit contact details','com_contact',0,'js/ThemeOffice/edit.png',1,'',1),(9,'Categories','',0,7,'option=com_categories&section=com_contact_details','Manage contact categories','',2,'js/ThemeOffice/categories.png',1,'contact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_fax=\nicon_misc=\nshow_headings=1\nshow_position=1\nshow_email=0\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nbannedEmail=\nbannedSubject=\nbannedText=\nsession=1\ncustomReply=0\n\n',1),(10,'Polls','option=com_poll',0,0,'option=com_poll','Manage Polls','com_poll',0,'js/ThemeOffice/component.png',0,'',1),(11,'News Feeds','option=com_newsfeeds',0,0,'','News Feeds Management','com_newsfeeds',0,'js/ThemeOffice/component.png',0,'',1),(12,'Feeds','',0,11,'option=com_newsfeeds','Manage News Feeds','com_newsfeeds',1,'js/ThemeOffice/edit.png',0,'show_headings=1\nshow_name=1\nshow_articles=1\nshow_link=1\nshow_cat_description=1\nshow_cat_items=1\nshow_feed_image=1\nshow_feed_description=1\nshow_item_description=1\nfeed_word_count=0\n\n',1),(13,'Categories','',0,11,'option=com_categories&section=com_newsfeeds','Manage Categories','',2,'js/ThemeOffice/categories.png',0,'',1),(14,'User','option=com_user',0,0,'','','com_user',0,'',1,'',1),(15,'Search','option=com_search',0,0,'option=com_search','Search Statistics','com_search',0,'js/ThemeOffice/component.png',1,'enabled=0\n\n',1),(16,'Categories','',0,1,'option=com_categories&section=com_banner','Categories','',3,'',1,'',1),(17,'Wrapper','option=com_wrapper',0,0,'','Wrapper','com_wrapper',0,'',1,'',1),(18,'Mail To','',0,0,'','','com_mailto',0,'',1,'',1),(19,'Media Manager','',0,0,'option=com_media','Media Manager','com_media',0,'',1,'upload_extensions=bmp,csv,doc,epg,gif,ico,jpg,odg,odp,ods,odt,pdf,png,ppt,swf,txt,xcf,xls,BMP,CSV,DOC,EPG,GIF,ICO,JPG,ODG,ODP,ODS,ODT,PDF,PNG,PPT,SWF,TXT,XCF,XLS\nupload_maxsize=10000000\nfile_path=images\nimage_path=images/stories\nrestrict_uploads=1\nallowed_media_usergroup=3\ncheck_mime=1\nimage_extensions=bmp,gif,jpg,png\nignore_extensions=\nupload_mime=image/jpeg,image/gif,image/png,image/bmp,application/x-shockwave-flash,application/msword,application/excel,application/pdf,application/powerpoint,text/plain,application/x-zip\nupload_mime_illegal=text/html\nenable_flash=0\n\n',1),(20,'Articles','option=com_content',0,0,'','','com_content',0,'',1,'show_noauth=0\nshow_title=1\nlink_titles=0\nshow_intro=1\nshow_section=0\nlink_section=0\nshow_category=0\nlink_category=0\nshow_author=1\nshow_create_date=1\nshow_modify_date=1\nshow_item_navigation=0\nshow_readmore=1\nshow_vote=0\nshow_icons=1\nshow_pdf_icon=1\nshow_print_icon=1\nshow_email_icon=1\nshow_hits=1\nfeed_summary=0\n\n',1),(21,'Configuration Manager','',0,0,'','Configuration','com_config',0,'',1,'',1),(22,'Installation Manager','',0,0,'','Installer','com_installer',0,'',1,'',1),(23,'Language Manager','',0,0,'','Languages','com_languages',0,'',1,'administrator=en-GB\nsite=en-GB',1),(24,'Mass mail','',0,0,'','Mass Mail','com_massmail',0,'',1,'mailSubjectPrefix=\nmailBodySuffix=\n\n',1),(25,'Menu Editor','',0,0,'','Menu Editor','com_menus',0,'',1,'',1),(27,'Messaging','',0,0,'','Messages','com_messages',0,'',1,'',1),(28,'Modules Manager','',0,0,'','Modules','com_modules',0,'',1,'',1),(29,'Plugin Manager','',0,0,'','Plugins','com_plugins',0,'',1,'',1),(30,'Template Manager','',0,0,'','Templates','com_templates',0,'',1,'',1),(31,'User Manager','',0,0,'','Users','com_users',0,'',1,'allowUserRegistration=1\nnew_usertype=Registered\nuseractivation=1\nfrontend_userparams=1\n\n',1),(32,'Cache Manager','',0,0,'','Cache','com_cache',0,'',1,'',1),(33,'Control Panel','',0,0,'','Control Panel','com_cpanel',0,'',1,'',1),(34,'Zoo','option=com_zoo',0,0,'option=com_zoo','Zoo','com_zoo',0,'components/com_zoo/assets/images/zoo_16.png',0,'',1);
/*!40000 ALTER TABLE `jos_components` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_contact_details`
--

DROP TABLE IF EXISTS `jos_contact_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_contact_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) NOT NULL DEFAULT '',
  `con_position` varchar(255) DEFAULT NULL,
  `address` text,
  `suburb` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `postcode` varchar(100) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `misc` mediumtext,
  `image` varchar(255) DEFAULT NULL,
  `imagepos` varchar(20) DEFAULT NULL,
  `email_to` varchar(255) DEFAULT NULL,
  `default_con` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `published` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `catid` int(11) NOT NULL DEFAULT '0',
  `access` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `mobile` varchar(255) NOT NULL DEFAULT '',
  `webpage` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_contact_details`
--

LOCK TABLES `jos_contact_details` WRITE;
/*!40000 ALTER TABLE `jos_contact_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_contact_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_content`
--

DROP TABLE IF EXISTS `jos_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_content` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) NOT NULL DEFAULT '',
  `title_alias` varchar(255) NOT NULL DEFAULT '',
  `introtext` mediumtext NOT NULL,
  `fulltext` mediumtext NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `sectionid` int(11) unsigned NOT NULL DEFAULT '0',
  `mask` int(11) unsigned NOT NULL DEFAULT '0',
  `catid` int(11) unsigned NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `images` text NOT NULL,
  `urls` text NOT NULL,
  `attribs` text NOT NULL,
  `version` int(11) unsigned NOT NULL DEFAULT '1',
  `parentid` int(11) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `access` int(11) unsigned NOT NULL DEFAULT '0',
  `hits` int(11) unsigned NOT NULL DEFAULT '0',
  `metadata` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_section` (`sectionid`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`state`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_content`
--

LOCK TABLES `jos_content` WRITE;
/*!40000 ALTER TABLE `jos_content` DISABLE KEYS */;
INSERT INTO `jos_content` VALUES (1,'Mapa','mapa','','<p>{mosmap lightbox=\'1\'|lbxwidth=\'600px\'|lbxheight=\'600px\'|show=\'1\'|align=\'none\'}</p>','',1,0,0,0,'2012-11-27 12:36:01',62,'','2012-11-27 13:19:29',62,0,'0000-00-00 00:00:00','2012-11-27 12:36:01','0000-00-00 00:00:00','','','show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=',29,0,1,'','',0,39,'robots=\nauthor=');
/*!40000 ALTER TABLE `jos_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_content_frontpage`
--

DROP TABLE IF EXISTS `jos_content_frontpage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_content_frontpage` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`content_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_content_frontpage`
--

LOCK TABLES `jos_content_frontpage` WRITE;
/*!40000 ALTER TABLE `jos_content_frontpage` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_content_frontpage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_content_rating`
--

DROP TABLE IF EXISTS `jos_content_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_content_rating` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `rating_sum` int(11) unsigned NOT NULL DEFAULT '0',
  `rating_count` int(11) unsigned NOT NULL DEFAULT '0',
  `lastip` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`content_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_content_rating`
--

LOCK TABLES `jos_content_rating` WRITE;
/*!40000 ALTER TABLE `jos_content_rating` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_content_rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_core_acl_aro`
--

DROP TABLE IF EXISTS `jos_core_acl_aro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_core_acl_aro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `section_value` varchar(240) NOT NULL DEFAULT '0',
  `value` varchar(240) NOT NULL DEFAULT '',
  `order_value` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `hidden` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `jos_section_value_value_aro` (`section_value`(100),`value`(100)),
  KEY `jos_gacl_hidden_aro` (`hidden`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_core_acl_aro`
--

LOCK TABLES `jos_core_acl_aro` WRITE;
/*!40000 ALTER TABLE `jos_core_acl_aro` DISABLE KEYS */;
INSERT INTO `jos_core_acl_aro` VALUES (10,'users','62',0,'Administrator',0);
/*!40000 ALTER TABLE `jos_core_acl_aro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_core_acl_aro_groups`
--

DROP TABLE IF EXISTS `jos_core_acl_aro_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_core_acl_aro_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `lft` int(11) NOT NULL DEFAULT '0',
  `rgt` int(11) NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `jos_gacl_parent_id_aro_groups` (`parent_id`),
  KEY `jos_gacl_lft_rgt_aro_groups` (`lft`,`rgt`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_core_acl_aro_groups`
--

LOCK TABLES `jos_core_acl_aro_groups` WRITE;
/*!40000 ALTER TABLE `jos_core_acl_aro_groups` DISABLE KEYS */;
INSERT INTO `jos_core_acl_aro_groups` VALUES (17,0,'ROOT',1,22,'ROOT'),(28,17,'USERS',2,21,'USERS'),(29,28,'Public Frontend',3,12,'Public Frontend'),(18,29,'Registered',4,11,'Registered'),(19,18,'Author',5,10,'Author'),(20,19,'Editor',6,9,'Editor'),(21,20,'Publisher',7,8,'Publisher'),(30,28,'Public Backend',13,20,'Public Backend'),(23,30,'Manager',14,19,'Manager'),(24,23,'Administrator',15,18,'Administrator'),(25,24,'Super Administrator',16,17,'Super Administrator');
/*!40000 ALTER TABLE `jos_core_acl_aro_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_core_acl_aro_map`
--

DROP TABLE IF EXISTS `jos_core_acl_aro_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_core_acl_aro_map` (
  `acl_id` int(11) NOT NULL DEFAULT '0',
  `section_value` varchar(230) NOT NULL DEFAULT '0',
  `value` varchar(100) NOT NULL,
  PRIMARY KEY (`acl_id`,`section_value`,`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_core_acl_aro_map`
--

LOCK TABLES `jos_core_acl_aro_map` WRITE;
/*!40000 ALTER TABLE `jos_core_acl_aro_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_core_acl_aro_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_core_acl_aro_sections`
--

DROP TABLE IF EXISTS `jos_core_acl_aro_sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_core_acl_aro_sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` varchar(230) NOT NULL DEFAULT '',
  `order_value` int(11) NOT NULL DEFAULT '0',
  `name` varchar(230) NOT NULL DEFAULT '',
  `hidden` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `jos_gacl_value_aro_sections` (`value`),
  KEY `jos_gacl_hidden_aro_sections` (`hidden`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_core_acl_aro_sections`
--

LOCK TABLES `jos_core_acl_aro_sections` WRITE;
/*!40000 ALTER TABLE `jos_core_acl_aro_sections` DISABLE KEYS */;
INSERT INTO `jos_core_acl_aro_sections` VALUES (10,'users',1,'Users',0);
/*!40000 ALTER TABLE `jos_core_acl_aro_sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_core_acl_groups_aro_map`
--

DROP TABLE IF EXISTS `jos_core_acl_groups_aro_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_core_acl_groups_aro_map` (
  `group_id` int(11) NOT NULL DEFAULT '0',
  `section_value` varchar(240) NOT NULL DEFAULT '',
  `aro_id` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `group_id_aro_id_groups_aro_map` (`group_id`,`section_value`,`aro_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_core_acl_groups_aro_map`
--

LOCK TABLES `jos_core_acl_groups_aro_map` WRITE;
/*!40000 ALTER TABLE `jos_core_acl_groups_aro_map` DISABLE KEYS */;
INSERT INTO `jos_core_acl_groups_aro_map` VALUES (25,'',10);
/*!40000 ALTER TABLE `jos_core_acl_groups_aro_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_core_log_items`
--

DROP TABLE IF EXISTS `jos_core_log_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_core_log_items` (
  `time_stamp` date NOT NULL DEFAULT '0000-00-00',
  `item_table` varchar(50) NOT NULL DEFAULT '',
  `item_id` int(11) unsigned NOT NULL DEFAULT '0',
  `hits` int(11) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_core_log_items`
--

LOCK TABLES `jos_core_log_items` WRITE;
/*!40000 ALTER TABLE `jos_core_log_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_core_log_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_core_log_searches`
--

DROP TABLE IF EXISTS `jos_core_log_searches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_core_log_searches` (
  `search_term` varchar(128) NOT NULL DEFAULT '',
  `hits` int(11) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_core_log_searches`
--

LOCK TABLES `jos_core_log_searches` WRITE;
/*!40000 ALTER TABLE `jos_core_log_searches` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_core_log_searches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_groups`
--

DROP TABLE IF EXISTS `jos_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_groups` (
  `id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_groups`
--

LOCK TABLES `jos_groups` WRITE;
/*!40000 ALTER TABLE `jos_groups` DISABLE KEYS */;
INSERT INTO `jos_groups` VALUES (0,'Public'),(1,'Registered'),(2,'Special');
/*!40000 ALTER TABLE `jos_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_menu`
--

DROP TABLE IF EXISTS `jos_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menutype` varchar(75) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `alias` varchar(255) NOT NULL DEFAULT '',
  `link` text,
  `type` varchar(50) NOT NULL DEFAULT '',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `parent` int(11) unsigned NOT NULL DEFAULT '0',
  `componentid` int(11) unsigned NOT NULL DEFAULT '0',
  `sublevel` int(11) DEFAULT '0',
  `ordering` int(11) DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `pollid` int(11) NOT NULL DEFAULT '0',
  `browserNav` tinyint(4) DEFAULT '0',
  `access` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `utaccess` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  `lft` int(11) unsigned NOT NULL DEFAULT '0',
  `rgt` int(11) unsigned NOT NULL DEFAULT '0',
  `home` int(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `componentid` (`componentid`,`menutype`,`published`,`access`),
  KEY `menutype` (`menutype`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_menu`
--

LOCK TABLES `jos_menu` WRITE;
/*!40000 ALTER TABLE `jos_menu` DISABLE KEYS */;
INSERT INTO `jos_menu` VALUES (1,'mainmenu','Home','home','index.php?option=com_content&view=frontpage','component',-2,0,20,0,1,0,'0000-00-00 00:00:00',0,0,0,3,'num_leading_articles=1\nnum_intro_articles=4\nnum_columns=2\nnum_links=4\norderby_pri=\norderby_sec=front\nshow_pagination=2\nshow_pagination_results=1\nshow_feed_link=1\nshow_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n',0,0,0),(2,'mainmenu','Blog','blog','index.php?option=com_zoo&view=frontpage','component',-2,0,34,0,0,0,'0000-00-00 00:00:00',0,0,0,0,'application=1\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n',0,0,0),(3,'mainmenu','Inmuebles','inmuebles','index.php?option=com_zoo&view=frontpage','component',1,0,34,0,7,0,'0000-00-00 00:00:00',0,0,0,0,'application=3\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n',0,0,1),(4,'mainmenu','Download','download','index.php?option=com_zoo&view=frontpage','component',-2,0,34,0,0,0,'0000-00-00 00:00:00',0,0,0,0,'application=4\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n',0,0,0),(5,'mainmenu','Business','business','index.php?option=com_zoo&view=frontpage','component',-2,0,34,0,0,0,'0000-00-00 00:00:00',0,0,0,0,'application=5\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n',0,0,0),(6,'mainmenu','Movie','movie','index.php?option=com_zoo&view=frontpage','component',-2,0,34,0,0,0,'0000-00-00 00:00:00',0,0,0,0,'application=2\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n',0,0,0),(7,'mainmenu','Cookbook','cookbook','index.php?option=com_zoo&view=frontpage','component',-2,0,34,0,0,0,'0000-00-00 00:00:00',0,0,0,0,'application=6\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n',0,0,0),(8,'mainmenu','Page','page','index.php?option=com_zoo&view=item','component',-2,0,34,0,0,0,'0000-00-00 00:00:00',0,0,0,0,'application=8\nitem_id=177\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n',0,0,0),(9,'mainmenu','Documentation','documentation','index.php?option=com_zoo&view=frontpage','component',-2,0,34,0,0,0,'0000-00-00 00:00:00',0,0,0,0,'application=10\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n',0,0,0),(10,'mainmenu','Mapa','mapa','index.php?option=com_content&view=article&id=1','component',-2,0,20,0,0,0,'0000-00-00 00:00:00',0,0,0,0,'show_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n',0,0,0),(11,'mainmenu','Capital y Area Metropolitana','ciudad-capital-y-area-metropolitana','index.php?option=com_zoo&view=category','component',1,3,34,1,1,0,'0000-00-00 00:00:00',0,0,0,0,'application=3\ncategory=17\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n',0,0,0),(12,'mainmenu','Ciudades del Interior','ciudades-del-interior','index.php?option=com_zoo&view=category','component',1,3,34,1,2,0,'0000-00-00 00:00:00',0,0,0,0,'application=3\ncategory=18\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n',0,0,0),(13,'mainmenu','Adjudicados s/ Acta de Remate','categoria-3','index.php?option=com_zoo&view=category','component',1,3,34,1,3,0,'0000-00-00 00:00:00',0,0,0,0,'application=3\ncategory=19\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n',0,0,0),(14,'mainmenu','Inicio','inicio','http://www.cajabancaria.gov.py/v2/','url',1,0,0,0,1,0,'0000-00-00 00:00:00',0,0,0,0,'menu_image=-1\n\n',0,0,0),(15,'mainmenu','Nosotros','nosotros','#','url',1,0,0,0,2,0,'0000-00-00 00:00:00',0,0,0,0,'menu_image=-1\n\n',0,0,0),(16,'mainmenu','Organigramaa','organigramaa','http://www.cajabancaria.gov.py/v2/index.php?option=com_content&view=article&id=85&Itemid=86','url',1,15,0,1,1,0,'0000-00-00 00:00:00',0,0,0,0,'menu_image=-1\n\n',0,0,0),(17,'mainmenu','Breve Reseña Historica','2012-12-01-17-02-25','#','url',1,15,0,1,2,0,'0000-00-00 00:00:00',0,0,0,0,'menu_image=-1\n\n',0,0,0),(18,'mainmenu','Suseciva Autoridades','suseciva-autoridades','http://www.cajabancaria.gov.py/v2/index.php?option=com_content&view=article&id=45&Itemid=66','url',1,17,0,2,1,0,'0000-00-00 00:00:00',0,0,0,0,'menu_image=-1\n\n',0,0,0),(19,'mainmenu','Acta Fundacional','acta-fundacional','http://www.cajabancaria.gov.py/v2/index.php?option=com_content&view=article&id=45&Itemid=66','url',1,17,0,2,2,0,'0000-00-00 00:00:00',0,0,0,0,'menu_image=-1\n\n',0,0,0),(20,'mainmenu','Autoridades del Consejo','autoridades-del-consejo','http://www.cajabancaria.gov.py/v2/index.php?option=com_content&view=article&id=59&Itemid=67','url',1,15,0,1,3,0,'0000-00-00 00:00:00',0,0,0,0,'menu_image=-1\n\n',0,0,0),(21,'mainmenu','Marco Legal','marco-legal','http://www.cajabancaria.gov.py/v2/index.php?option=com_content&view=article&id=59&Itemid=67','url',1,15,0,1,4,0,'0000-00-00 00:00:00',0,0,0,0,'menu_image=-1\n\n',0,0,0),(22,'mainmenu','Memoria y Balances','memoria-y-balances','http://www.cajabancaria.gov.py/v2/index.php?option=com_content&view=article&id=117&Itemid=80','url',1,0,0,0,3,0,'0000-00-00 00:00:00',0,0,0,0,'menu_image=-1\n\n',0,0,0),(23,'mainmenu','Informe de Gestión','2012-12-01-17-05-08','#','url',1,0,0,0,4,0,'0000-00-00 00:00:00',0,0,0,0,'menu_image=-1\n\n',0,0,0),(24,'mainmenu','Resumen Ejecutivo','resumen-ejecutivo','http://www.cajabancaria.gov.py/v2/index.php?option=com_content&view=article&id=139&Itemid=58','url',1,23,0,1,1,0,'0000-00-00 00:00:00',0,0,0,0,'menu_image=-1\n\n',0,0,0),(25,'mainmenu','Afiliados','afiliados','http://www.cajabancaria.gov.py/v2/index.php?option=com_content&view=article&id=44&Itemid=54','url',1,0,0,0,5,0,'0000-00-00 00:00:00',0,0,0,0,'menu_image=-1\n\n',0,0,0),(26,'mainmenu','Noticias','noticias','#','url',1,0,0,0,6,0,'0000-00-00 00:00:00',0,0,0,0,'menu_image=-1\n\n',0,0,0),(27,'mainmenu','Noticias de Interes','noticias-de-interes','http://www.cajabancaria.gov.py/v2/index.php?option=com_content&view=article&id=77&Itemid=104','url',1,26,0,1,1,0,'0000-00-00 00:00:00',0,0,0,0,'menu_image=-1\n\n',0,0,0),(28,'mainmenu','Revista Caja Bancaria','revista-caja-bancaria','http://www.cajabancaria.gov.py/v2/index.php?option=com_content&view=article&id=77&Itemid=104','url',1,26,0,1,2,0,'0000-00-00 00:00:00',0,0,0,0,'menu_image=-1\n\n',0,0,0),(29,'mainmenu','Relacionados a la Caja','relacionados-a-la-caja','http://www.cajabancaria.gov.py/v2/index.php?option=com_wrapper&view=wrapper&Itemid=101','url',1,26,0,1,3,0,'0000-00-00 00:00:00',0,0,0,0,'menu_image=-1\n\n',0,0,0),(30,'mainmenu','ABC Color','abc-color','http://www.cajabancaria.gov.py/v2/index.php?option=com_wrapper&view=wrapper&Itemid=101','url',1,29,0,2,1,0,'0000-00-00 00:00:00',0,0,0,0,'menu_image=-1\n\n',0,0,0),(31,'mainmenu','Ultima Hora','ultima-hora','http://www.cajabancaria.gov.py/v2/index.php?option=com_wrapper&view=wrapper&Itemid=102','url',1,29,0,2,2,0,'0000-00-00 00:00:00',0,0,0,0,'menu_image=-1\n\n',0,0,0),(32,'mainmenu','La Nación','2012-12-01-17-14-22','http://www.cajabancaria.gov.py/v2/index.php?option=com_wrapper&view=wrapper&Itemid=103','url',1,29,0,2,3,0,'0000-00-00 00:00:00',0,0,0,0,'menu_image=-1\n\n',0,0,0);
/*!40000 ALTER TABLE `jos_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_menu_types`
--

DROP TABLE IF EXISTS `jos_menu_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_menu_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menutype` varchar(75) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `menutype` (`menutype`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_menu_types`
--

LOCK TABLES `jos_menu_types` WRITE;
/*!40000 ALTER TABLE `jos_menu_types` DISABLE KEYS */;
INSERT INTO `jos_menu_types` VALUES (1,'mainmenu','Main Menu','The main menu for the site');
/*!40000 ALTER TABLE `jos_menu_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_messages`
--

DROP TABLE IF EXISTS `jos_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_messages` (
  `message_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id_from` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id_to` int(10) unsigned NOT NULL DEFAULT '0',
  `folder_id` int(10) unsigned NOT NULL DEFAULT '0',
  `date_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `state` int(11) NOT NULL DEFAULT '0',
  `priority` int(1) unsigned NOT NULL DEFAULT '0',
  `subject` text NOT NULL,
  `message` text NOT NULL,
  PRIMARY KEY (`message_id`),
  KEY `useridto_state` (`user_id_to`,`state`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_messages`
--

LOCK TABLES `jos_messages` WRITE;
/*!40000 ALTER TABLE `jos_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_messages_cfg`
--

DROP TABLE IF EXISTS `jos_messages_cfg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_messages_cfg` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cfg_name` varchar(100) NOT NULL DEFAULT '',
  `cfg_value` varchar(255) NOT NULL DEFAULT '',
  UNIQUE KEY `idx_user_var_name` (`user_id`,`cfg_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_messages_cfg`
--

LOCK TABLES `jos_messages_cfg` WRITE;
/*!40000 ALTER TABLE `jos_messages_cfg` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_messages_cfg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_migration_backlinks`
--

DROP TABLE IF EXISTS `jos_migration_backlinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_migration_backlinks` (
  `itemid` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `url` text NOT NULL,
  `sefurl` text NOT NULL,
  `newurl` text NOT NULL,
  PRIMARY KEY (`itemid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_migration_backlinks`
--

LOCK TABLES `jos_migration_backlinks` WRITE;
/*!40000 ALTER TABLE `jos_migration_backlinks` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_migration_backlinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_modules`
--

DROP TABLE IF EXISTS `jos_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `content` text NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  `position` varchar(50) DEFAULT NULL,
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `module` varchar(50) DEFAULT NULL,
  `numnews` int(11) NOT NULL DEFAULT '0',
  `access` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `showtitle` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `params` text NOT NULL,
  `iscore` tinyint(4) NOT NULL DEFAULT '0',
  `client_id` tinyint(4) NOT NULL DEFAULT '0',
  `control` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `published` (`published`,`access`),
  KEY `newsfeeds` (`module`,`published`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_modules`
--

LOCK TABLES `jos_modules` WRITE;
/*!40000 ALTER TABLE `jos_modules` DISABLE KEYS */;
INSERT INTO `jos_modules` VALUES (1,'Main Menu','',0,'user3',0,'0000-00-00 00:00:00',0,'mod_mainmenu',0,0,1,'menutype=mainmenu\nmenu_style=list\nstartLevel=0\nendLevel=0\nshowAllChildren=0\nwindow_open=\nshow_whitespace=0\ncache=1\ntag_id=\nclass_sfx=\nmoduleclass_sfx=_menu\nmaxdepth=10\nmenu_images=0\nmenu_images_align=0\nmenu_images_link=0\nexpand_menu=0\nactivate_parent=0\nfull_active_id=0\nindent_image=0\nindent_image1=\nindent_image2=\nindent_image3=\nindent_image4=\nindent_image5=\nindent_image6=\nspacer=\nend_spacer=\n\n',1,0,''),(2,'Login','',1,'login',0,'0000-00-00 00:00:00',1,'mod_login',0,0,1,'',1,1,''),(3,'Popular','',3,'cpanel',0,'0000-00-00 00:00:00',1,'mod_popular',0,2,1,'',0,1,''),(4,'Recent added Articles','',4,'cpanel',0,'0000-00-00 00:00:00',1,'mod_latest',0,2,1,'ordering=c_dsc\nuser_id=0\ncache=0\n\n',0,1,''),(5,'Menu Stats','',5,'cpanel',0,'0000-00-00 00:00:00',1,'mod_stats',0,2,1,'',0,1,''),(6,'Unread Messages','',1,'header',0,'0000-00-00 00:00:00',1,'mod_unread',0,2,1,'',1,1,''),(7,'Online Users','',2,'header',0,'0000-00-00 00:00:00',1,'mod_online',0,2,1,'',1,1,''),(8,'Toolbar','',1,'toolbar',0,'0000-00-00 00:00:00',1,'mod_toolbar',0,2,1,'',1,1,''),(9,'Quick Icons','',1,'icon',0,'0000-00-00 00:00:00',1,'mod_quickicon',0,2,1,'',1,1,''),(10,'Logged in Users','',2,'cpanel',0,'0000-00-00 00:00:00',1,'mod_logged',0,2,1,'',0,1,''),(11,'Footer','',0,'footer',0,'0000-00-00 00:00:00',1,'mod_footer',0,0,1,'',1,1,''),(12,'Admin Menu','',1,'menu',0,'0000-00-00 00:00:00',1,'mod_menu',0,2,1,'',0,1,''),(13,'Admin SubMenu','',1,'submenu',0,'0000-00-00 00:00:00',1,'mod_submenu',0,2,1,'',0,1,''),(14,'User Status','',1,'status',0,'0000-00-00 00:00:00',1,'mod_status',0,2,1,'',0,1,''),(15,'Title','',1,'title',0,'0000-00-00 00:00:00',1,'mod_title',0,2,1,'',0,1,''),(16,'Favorite Meals','',4,'right',0,'0000-00-00 00:00:00',1,'mod_zooitem',0,0,1,'theme=list-v\napplication=6\nmode=types\ncategory=\ntype=recipe\nitem_id=\nsubcategories=1\nmedia_position=left\ncount=4\norder=hits\nmenu_item=7\nmoduleclass_sfx=\n\n',0,0,''),(17,'ZOO Comment','',1,'footer',0,'0000-00-00 00:00:00',1,'mod_zoocomment',0,0,0,'theme=bubble-angled-h\napplication=1\ncategory=\nsubcategories=0\ncount=4\nshow_avatar=1\navatar_size=40\nshow_author=1\nshow_meta=1\nmoduleclass_sfx=\n\n',0,0,''),(18,'Tag Cloud','',1,'right',0,'0000-00-00 00:00:00',1,'mod_zootag',0,0,1,'theme=cloud\napplication=3\ncount=20\norder=ocount\nmenu_item=\nmoduleclass_sfx=\n\n',0,0,''),(19,'Latest Comments','',3,'right',0,'0000-00-00 00:00:00',1,'mod_zoocomment',0,0,1,'theme=bubble-angled-vl\napplication=1\ncategory=\nsubcategories=0\ncount=4\nshow_avatar=1\navatar_size=40\nshow_author=0\nshow_meta=1\nmoduleclass_sfx=\n\n',0,0,''),(20,'Blog Authors','',5,'right',0,'0000-00-00 00:00:00',1,'mod_zooitem',0,0,1,'theme=list-v\napplication=1\nmode=types\ncategory=\ntype=author\nitem_id=\nsubcategories=1\nmedia_position=left\ncount=4\norder=alpha\nmenu_item=2\nmoduleclass_sfx=\n\n',0,0,''),(21,'Latest Tutorials','',6,'right',0,'0000-00-00 00:00:00',1,'mod_zooitem',0,0,1,'theme=list-v\napplication=10\nmode=types\ncategory=\ntype=page\nitem_id=\nsubcategories=1\nmedia_position=left\ncount=4\norder=rdate\nmenu_item=9\nmoduleclass_sfx=\n\n',0,0,''),(22,'Favorite Movies','',7,'right',0,'0000-00-00 00:00:00',1,'mod_zooitem',0,0,1,'theme=list-v\napplication=2\nmode=types\ncategory=\ntype=movie\nitem_id=\nsubcategories=1\nmedia_position=left\ncount=4\norder=hits\nmenu_item=6\nmoduleclass_sfx=\n\n',0,0,''),(23,'Random Companies','',8,'right',0,'0000-00-00 00:00:00',1,'mod_zooitem',0,0,1,'theme=list-v\napplication=5\nmode=types\ncategory=\ntype=company\nitem_id=\nsubcategories=1\nmedia_position=left\ncount=4\norder=random\nmenu_item=5\nmoduleclass_sfx=\n\n',0,0,''),(24,'ZOO Category','',0,'user1',0,'0000-00-00 00:00:00',0,'mod_zoocategory',0,0,1,'theme=flatlist\napplication=3\ncategory=\ndepth=0\nmenu_item=2\nmoduleclass_sfx=\n\n',0,0,''),(25,'ZOO Accordion','',1,'left',0,'0000-00-00 00:00:00',0,'mod_zooaccordion',0,0,1,'media_position=left\ncount=4\n',0,0,''),(26,'ZOO Carousel','',2,'left',0,'0000-00-00 00:00:00',0,'mod_zoocarousel',0,0,1,'layout=default\nmedia_position=left\ncount=4\n',0,0,''),(27,'ZOO Drawer','',3,'left',0,'0000-00-00 00:00:00',0,'mod_zoodrawer',0,0,1,'media_position=left\ncount=4\n',0,0,''),(28,'ZOO Maps','',4,'left',0,'0000-00-00 00:00:00',0,'mod_zoomaps',0,0,1,'layout=default\nmedia_position=middle\napplication=3\nmode=categories\ncategory=\ntype=automobile\nsubcategories=0\ncount=20\nmenu_item=\nmoduleclass_sfx=\ngoogle_api_key=\nlocation=-25.293534,-57.598121\nmarker_onload=1\nmarker_popup=0\nmarker_text=\nmain_icon=red-dot\nother_icon=blue-dot\nzoom_level=13\nmap_controls=2\nscroll_wheel_zoom=1\nmap_type=0\ntype_controls=1\noverview_controls=1\ngeocode_cache=1\ndirections=1\ndirections_dest_update=0\nlocale=en\nmodule_width=500\nmodule_height=400\n\n',0,0,''),(29,'ZOO Scroller','',5,'left',0,'0000-00-00 00:00:00',0,'mod_zooscroller',0,0,1,'media_position=left\ncount=4\n',0,0,''),(30,'ZOO Slider','',6,'left',0,'0000-00-00 00:00:00',0,'mod_zooslider',0,0,1,'media_position=left\ncount=4\n',0,0,''),(31,'Observaciones','<p>El Consejo de Administración podrá negociar el valor de venta de un inmueble determinado, teniendo en cuenta el tiempo de su publicación, numero de interesados, etc. La negociación de venta del bien por un valor inferior al valor de publicación, deberá ser como mínimo luego de tres meses de su publicación inicial y hasta un valor acordado que no sea inferior al valor de venta rápida del inmueble, según tasación actualizada.</p>\r\n<p>Los inmuebles publicados son ofrecidos en las condiciones en que se encuentran, por lo tanto corren por cuenta del/ de la Comprador/a el pago de los tributos y servicios básicos reclamados que afecten al inmueble, tales como: agua potable, energía eléctrica, alumbrado publico, servicios de telefonía, recolección de residuos sólidos, etc. así como el pago del impuesto inmobiliario y tasas municipales.</p>',0,'user8',0,'0000-00-00 00:00:00',1,'mod_custom',0,0,1,'moduleclass_sfx=\n\n',0,0,'');
/*!40000 ALTER TABLE `jos_modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_modules_menu`
--

DROP TABLE IF EXISTS `jos_modules_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_modules_menu` (
  `moduleid` int(11) NOT NULL DEFAULT '0',
  `menuid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`moduleid`,`menuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_modules_menu`
--

LOCK TABLES `jos_modules_menu` WRITE;
/*!40000 ALTER TABLE `jos_modules_menu` DISABLE KEYS */;
INSERT INTO `jos_modules_menu` VALUES (1,0),(16,2),(17,2),(18,2),(19,2),(20,2),(21,2),(22,2),(23,2),(24,0),(25,0),(26,0),(27,0),(28,0),(29,0),(30,0),(31,0);
/*!40000 ALTER TABLE `jos_modules_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_newsfeeds`
--

DROP TABLE IF EXISTS `jos_newsfeeds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_newsfeeds` (
  `catid` int(11) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `alias` varchar(255) NOT NULL DEFAULT '',
  `link` text NOT NULL,
  `filename` varchar(200) DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `numarticles` int(11) unsigned NOT NULL DEFAULT '1',
  `cache_time` int(11) unsigned NOT NULL DEFAULT '3600',
  `checked_out` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `rtl` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `published` (`published`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_newsfeeds`
--

LOCK TABLES `jos_newsfeeds` WRITE;
/*!40000 ALTER TABLE `jos_newsfeeds` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_newsfeeds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_plugins`
--

DROP TABLE IF EXISTS `jos_plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_plugins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `element` varchar(100) NOT NULL DEFAULT '',
  `folder` varchar(100) NOT NULL DEFAULT '',
  `access` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `published` tinyint(3) NOT NULL DEFAULT '0',
  `iscore` tinyint(3) NOT NULL DEFAULT '0',
  `client_id` tinyint(3) NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_folder` (`published`,`client_id`,`access`,`folder`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_plugins`
--

LOCK TABLES `jos_plugins` WRITE;
/*!40000 ALTER TABLE `jos_plugins` DISABLE KEYS */;
INSERT INTO `jos_plugins` VALUES (1,'Authentication - Joomla','joomla','authentication',0,1,1,1,0,0,'0000-00-00 00:00:00',''),(2,'Authentication - LDAP','ldap','authentication',0,2,0,1,0,0,'0000-00-00 00:00:00','host=\nport=389\nuse_ldapV3=0\nnegotiate_tls=0\nno_referrals=0\nauth_method=bind\nbase_dn=\nsearch_string=\nusers_dn=\nusername=\npassword=\nldap_fullname=fullName\nldap_email=mail\nldap_uid=uid\n\n'),(3,'Authentication - GMail','gmail','authentication',0,4,0,0,0,0,'0000-00-00 00:00:00',''),(4,'Authentication - OpenID','openid','authentication',0,3,0,0,0,0,'0000-00-00 00:00:00',''),(5,'User - Joomla!','joomla','user',0,0,1,0,0,0,'0000-00-00 00:00:00','autoregister=1\n\n'),(6,'Search - Content','content','search',0,1,1,1,0,0,'0000-00-00 00:00:00','search_limit=50\nsearch_content=1\nsearch_uncategorised=1\nsearch_archived=1\n\n'),(7,'Search - Contacts','contacts','search',0,3,1,1,0,0,'0000-00-00 00:00:00','search_limit=50\n\n'),(8,'Search - Categories','categories','search',0,4,1,0,0,0,'0000-00-00 00:00:00','search_limit=50\n\n'),(9,'Search - Sections','sections','search',0,5,1,0,0,0,'0000-00-00 00:00:00','search_limit=50\n\n'),(10,'Search - Newsfeeds','newsfeeds','search',0,6,1,0,0,0,'0000-00-00 00:00:00','search_limit=50\n\n'),(11,'Search - Weblinks','weblinks','search',0,2,1,1,0,0,'0000-00-00 00:00:00','search_limit=50\n\n'),(12,'Content - Pagebreak','pagebreak','content',0,10000,1,1,0,0,'0000-00-00 00:00:00','enabled=1\ntitle=1\nmultipage_toc=1\nshowall=1\n\n'),(13,'Content - Rating','vote','content',0,4,1,1,0,0,'0000-00-00 00:00:00',''),(14,'Content - Email Cloaking','emailcloak','content',0,5,1,0,0,0,'0000-00-00 00:00:00','mode=1\n\n'),(15,'Content - Code Hightlighter (GeSHi)','geshi','content',0,5,0,0,0,0,'0000-00-00 00:00:00',''),(16,'Content - Load Module','loadmodule','content',0,6,1,0,0,0,'0000-00-00 00:00:00','enabled=1\nstyle=0\n\n'),(17,'Content - Page Navigation','pagenavigation','content',0,2,1,1,0,0,'0000-00-00 00:00:00','position=1\n\n'),(18,'Editor - No Editor','none','editors',0,0,1,1,0,0,'0000-00-00 00:00:00',''),(19,'Editor - TinyMCE','tinymce','editors',0,0,1,1,0,0,'0000-00-00 00:00:00','mode=advanced\nskin=0\ncompressed=0\ncleanup_startup=0\ncleanup_save=2\nentity_encoding=raw\nlang_mode=0\nlang_code=en\ntext_direction=ltr\ncontent_css=1\ncontent_css_custom=\nrelative_urls=1\nnewlines=0\ninvalid_elements=applet\nextended_elements=\ntoolbar=top\ntoolbar_align=left\nhtml_height=550\nhtml_width=750\nelement_path=1\nfonts=1\npaste=1\nsearchreplace=1\ninsertdate=1\nformat_date=%Y-%m-%d\ninserttime=1\nformat_time=%H:%M:%S\ncolors=1\ntable=1\nsmilies=1\nmedia=1\nhr=1\ndirectionality=1\nfullscreen=1\nstyle=1\nlayer=1\nxhtmlxtras=1\nvisualchars=1\nnonbreaking=1\ntemplate=0\nadvimage=1\nadvlink=1\nautosave=1\ncontextmenu=1\ninlinepopups=1\nsafari=1\ncustom_plugin=\ncustom_button=\n\n'),(20,'Editor - XStandard Lite 2.0','xstandard','editors',0,0,0,1,0,0,'0000-00-00 00:00:00',''),(21,'Editor Button - Image','image','editors-xtd',0,0,1,0,0,0,'0000-00-00 00:00:00',''),(22,'Editor Button - Pagebreak','pagebreak','editors-xtd',0,0,1,0,0,0,'0000-00-00 00:00:00',''),(23,'Editor Button - Readmore','readmore','editors-xtd',0,0,1,0,0,0,'0000-00-00 00:00:00',''),(24,'XML-RPC - Joomla','joomla','xmlrpc',0,7,0,1,0,0,'0000-00-00 00:00:00',''),(25,'XML-RPC - Blogger API','blogger','xmlrpc',0,7,0,1,0,0,'0000-00-00 00:00:00','catid=1\nsectionid=0\n\n'),(27,'System - SEF','sef','system',0,1,1,0,0,0,'0000-00-00 00:00:00',''),(28,'System - Debug','debug','system',0,2,1,0,0,0,'0000-00-00 00:00:00','queries=1\nmemory=1\nlangauge=1\n\n'),(29,'System - Legacy','legacy','system',0,3,1,1,0,0,'0000-00-00 00:00:00','route=0\n\n'),(30,'System - Cache','cache','system',0,4,0,1,0,0,'0000-00-00 00:00:00','browsercache=0\ncachetime=15\n\n'),(31,'System - Log','log','system',0,5,0,1,0,0,'0000-00-00 00:00:00',''),(32,'System - Remember Me','remember','system',0,6,1,1,0,0,'0000-00-00 00:00:00',''),(33,'System - Backlink','backlink','system',0,7,0,1,0,0,'0000-00-00 00:00:00',''),(34,'ZOO Search','zoosearch','search',0,0,0,0,0,0,'0000-00-00 00:00:00','search_limit=50\n'),(35,'Google Maps','plugin_googlemap2','content',0,0,0,0,0,0,'0000-00-00 00:00:00','publ=1\ndebug=0\nGoogle_API_key=\nGoogle_Multi_API_key=\nwidth=100%\nheight=400px\nlat=52.075581\nlon=4.541513\nzoom=10\nzoomType=Large\nzoomNew=0\nzoomWheel=0\nmapType=Normal\nshowMaptype=1\noverview=0\nmarker=1\ndir=0\ntxtdir=Directions:\ntxtgetdir=Get Directions\ntxtfrom=From here\ntxtto=To here\ntxtdiraddr=Address:\ngotoaddr=0\ntxtaddr=Address: ##\nerraddr=Address ## not found!\nalign=center\nlangtype=site\nlang=\n\n'),(36,'Google Maps','plugin_googlemap2','system',0,0,1,0,0,0,'0000-00-00 00:00:00','publ=1\ndebug=1\nplugincode=mosmap\nbrackets={\nGoogle_API_version=3.x\nshow=1\nmapclass=\nmapcss=/* For img in the map remove borders, shadow, no margin and no max-width\\n*/\\n.map img {\\n    border: 0px;\\n    box-shadow: 0px;\\n    margin: 0px;\\n    max-width: none !important;\\n}\\n\\n/* Make sure the directions are below the map\\n*/\\n.directions {\\n    clear: left;\\n}\\n\\n/* Solve problems in chrome with the show of the direction steps in full width\\n*/\\n.adp-placemark {\\n    width : 100%\\n}\nloadmootools=1\ntimeinterval=500\nGoogle_API_key=\nGoogle_Multi_API_key=\nurlsetting=Joomla\ngooglewebsite=maps.google.com.py\ngoogleindexing=1\nstyledmap=\nwidth=400\nheight=450\nlat=\nlon=\ncenterlat=\ncenterlon=\naddress=\nzoom=10\ncorzoom=0\nminzoom=0\nmaxzoom=19\ncontroltype=UI\nzoomType=3D-large\nsvcontrol=1\nrotation=1\nzoomnew=0\nzoomWheel=0\nkeyboard=0\nmapType=Normal\nshowmaptype=1\nshowNormalMaptype=1\nshowSatelliteMaptype=1\nshowHybridMaptype=1\nshowTerrainMaptype=1\nshowEarthMaptype=1\nshowscale=0\noverview=0\novzoom=-3\nnavlabel=0\ndragging=1\nmarker=1\nicon=\niconwidth=\niconheight=\niconanchorx=\niconanchory=\niconshadow=\niconshadowwidth=\niconshadowheight=\niconinfoanchorx=\niconinfoanchory=\nicontransparent=\niconimagemap=\ndir=0\ndirtype=D\navoidhighways=0\ndiroptimize=0\ndiralternatives=0\nshowdir=1\nanimdir=0\nanimspeed=1\nanimautostart=0\nanimunit=kilometers\nformspeed=0\nformdirtype=0\nformaddress=0\nformdir=0\nlanganim=en;The requested panorama could not be displayed\\|Could not generate a route for the current start and end addresses\\|Street View coverage is not available for this route\\|You have reached your destination\\|miles\\|miles\\|ft\\|kilometers\\|kilometer\\|meters\\|In\\|You will reach your destination\\|Stop\\|Drive\\|Press Drive to follow your route\\|Route\\|Speed\\|Fast\\|Medium\\|Slow\ntraffic=0\ntransit=0\nbicycle=0\npanoramio=none\npanotype=none\npanoorder=popularity\npanomax=50\nyoutube=none\nwiki=none\nadsmanager=0\nmaxads=3\nlocalsearch=0\nadsense=\nchannel=\ngooglebar=0\nsearchlist=inline\nsearchtarget=_blank\nsearchzoompan=1\ntxtdir=Directions:\ntxtgetdir=Get Directions\ntxtfrom=From here\ntxtto=To here\ntxtdiraddr=Address:\ntxt_driving=\ntxt_avhighways=\ntxt_walking=\ntxt_bicycle=\ntxt_transit=\ntxt_optimize=\ntxt_alternatives=\ndirdefault=0\ngotoaddr=0\ngotoaddrzoom=0\ntxtaddr=Address: ##\nerraddr=Address ## not found!\nclientgeotype=google\nautocompl=both\nalign=center\nlangtype=site\nlang=\nlightbox=0\ntxtlightbox=Mostrar mapa\nlbxcaption=\nlbxwidth=500\nlbxheight=700\nlbxcenterlat=\nlbxcenterlon=\nlbxzoom=\neffect=horizontal\nkmlrenderer=google\nkmlsidebar=none\nkmlsbwidth=200\nkmlfoldersopen=0\nkmlhide=0\nkmlscale=0\nkmlopenmethod=click\nkmlsbsort=none\nkmllightbox=0\nkmlmessshow=0\nkmlclickablemarkers=1\nkmlzoommarkers=0\nkmlopendivmarkers=\nkmlcontentlinkmarkers=0\nkmllinkablemarkers=0\nkmllinktarget=_self\nkmllinkmethod=dblclick\nkmlmarkerlabel=100\nkmlmarkerlabelclass=\nkmlpolylabel=100\nkmlpolylabelclass=\nproxy=1\nsv=none\nsvwidth=100%\nsvheight=300\nsvyaw=0\nsvpitch=0\nsvzoom=\nsvautorotate=0\nsvaddress=1\nearthtimeout=100\nearthborders=1\nearthbuildings=0\nearthroads=0\nearthterrain=0\nmaxcluster=\ngridsize=\nminmarkerscluster=\nmaxlinesinfocluster=\nclusterinfowindow=click\nclusterzoom=dblclick\nclustermarkerzoom=16\ntilelayer=\ntileopacity=1\ntilebounds=\ntileminzoom=0\ntilemaxzoom=19\ntilemethod=\nlatitudeid=\nlatitudedesc=1\nlatitudecoord=0\nlatitudeform=0\nimageurl=\nimagex=\nimagey=\nimagexyunits=pixels\nimagewidth=\nimageheight=\nimageanchorx=\nimageanchory=\nimageanchorunits=pixels\nweather=0\nweathercloud=0\nweatherinfo=1\nweathertempunit=celsius\nweatherwindunit=km\ntwittername=\ntwittertweets=15\ntwittericon=/media/plugin_googlemap2/site/Twitter/twitter_map_icon.png\ntwitterline=#ff0000ff\ntwitterlinewidth=4\ntwitterstartloc=0,0,0\n\n');
/*!40000 ALTER TABLE `jos_plugins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_poll_data`
--

DROP TABLE IF EXISTS `jos_poll_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_poll_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pollid` int(11) NOT NULL DEFAULT '0',
  `text` text NOT NULL,
  `hits` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `pollid` (`pollid`,`text`(1))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_poll_data`
--

LOCK TABLES `jos_poll_data` WRITE;
/*!40000 ALTER TABLE `jos_poll_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_poll_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_poll_date`
--

DROP TABLE IF EXISTS `jos_poll_date`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_poll_date` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `vote_id` int(11) NOT NULL DEFAULT '0',
  `poll_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `poll_id` (`poll_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_poll_date`
--

LOCK TABLES `jos_poll_date` WRITE;
/*!40000 ALTER TABLE `jos_poll_date` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_poll_date` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_poll_menu`
--

DROP TABLE IF EXISTS `jos_poll_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_poll_menu` (
  `pollid` int(11) NOT NULL DEFAULT '0',
  `menuid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`pollid`,`menuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_poll_menu`
--

LOCK TABLES `jos_poll_menu` WRITE;
/*!40000 ALTER TABLE `jos_poll_menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_poll_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_polls`
--

DROP TABLE IF EXISTS `jos_polls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_polls` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) NOT NULL DEFAULT '',
  `voters` int(9) NOT NULL DEFAULT '0',
  `checked_out` int(11) NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `access` int(11) NOT NULL DEFAULT '0',
  `lag` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_polls`
--

LOCK TABLES `jos_polls` WRITE;
/*!40000 ALTER TABLE `jos_polls` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_polls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_sections`
--

DROP TABLE IF EXISTS `jos_sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) NOT NULL DEFAULT '',
  `image` text NOT NULL,
  `scope` varchar(50) NOT NULL DEFAULT '',
  `image_position` varchar(30) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `access` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `count` int(11) NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_scope` (`scope`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_sections`
--

LOCK TABLES `jos_sections` WRITE;
/*!40000 ALTER TABLE `jos_sections` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_session`
--

DROP TABLE IF EXISTS `jos_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_session` (
  `username` varchar(150) DEFAULT '',
  `time` varchar(14) DEFAULT '',
  `session_id` varchar(200) NOT NULL DEFAULT '0',
  `guest` tinyint(4) DEFAULT '1',
  `userid` int(11) DEFAULT '0',
  `usertype` varchar(50) DEFAULT '',
  `gid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `client_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `data` longtext,
  PRIMARY KEY (`session_id`(64)),
  KEY `whosonline` (`guest`,`usertype`),
  KEY `userid` (`userid`),
  KEY `time` (`time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_session`
--

LOCK TABLES `jos_session` WRITE;
/*!40000 ALTER TABLE `jos_session` DISABLE KEYS */;
INSERT INTO `jos_session` VALUES ('','1370921301','4ko15ir776pphrvba4okhibed2',1,0,'',0,0,'__default|a:7:{s:15:\"session.counter\";i:1;s:19:\"session.timer.start\";i:1370921301;s:18:\"session.timer.last\";i:1370921301;s:17:\"session.timer.now\";i:1370921301;s:22:\"session.client.browser\";s:137:\"Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.11 (KHTML, like Gecko) Ubuntu/12.10 Chromium/23.0.1271.64 Chrome/23.0.1271.64 Safari/537.11\";s:8:\"registry\";O:9:\"JRegistry\":3:{s:17:\"_defaultNameSpace\";s:7:\"session\";s:9:\"_registry\";a:1:{s:7:\"session\";a:1:{s:4:\"data\";O:8:\"stdClass\":0:{}}}s:7:\"_errors\";a:0:{}}s:4:\"user\";O:5:\"JUser\":20:{s:2:\"id\";i:0;s:4:\"name\";N;s:8:\"username\";N;s:5:\"email\";N;s:8:\"password\";N;s:14:\"password_clear\";s:0:\"\";s:8:\"usertype\";N;s:5:\"block\";N;s:9:\"sendEmail\";i:0;s:3:\"gid\";i:0;s:12:\"registerDate\";N;s:13:\"lastvisitDate\";N;s:10:\"activation\";N;s:6:\"params\";N;s:3:\"aid\";i:0;s:5:\"guest\";i:1;s:7:\"_params\";O:10:\"JParameter\":7:{s:4:\"_raw\";s:0:\"\";s:4:\"_xml\";N;s:9:\"_elements\";a:0:{}s:12:\"_elementPath\";a:1:{i:0;s:59:\"/var/www_old/joomla/libraries/joomla/html/parameter/element\";}s:17:\"_defaultNameSpace\";s:8:\"_default\";s:9:\"_registry\";a:1:{s:8:\"_default\";a:1:{s:4:\"data\";O:8:\"stdClass\":0:{}}}s:7:\"_errors\";a:0:{}}s:9:\"_errorMsg\";N;s:7:\"_errors\";a:0:{}s:10:\"superadmin\";b:0;}}'),('admin','1370921395','1b944d5221a20464f74db288d6aa8695',0,62,'Super Administrator',25,1,'__default|a:8:{s:15:\"session.counter\";i:8;s:19:\"session.timer.start\";i:1370921330;s:18:\"session.timer.last\";i:1370921393;s:17:\"session.timer.now\";i:1370921395;s:22:\"session.client.browser\";s:137:\"Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.11 (KHTML, like Gecko) Ubuntu/12.10 Chromium/23.0.1271.64 Chrome/23.0.1271.64 Safari/537.11\";s:8:\"registry\";O:9:\"JRegistry\":3:{s:17:\"_defaultNameSpace\";s:7:\"session\";s:9:\"_registry\";a:2:{s:7:\"session\";a:1:{s:4:\"data\";O:8:\"stdClass\":0:{}}s:11:\"application\";a:1:{s:4:\"data\";O:8:\"stdClass\":1:{s:4:\"lang\";s:0:\"\";}}}s:7:\"_errors\";a:0:{}}s:4:\"user\";O:5:\"JUser\":20:{s:2:\"id\";s:2:\"62\";s:4:\"name\";s:13:\"Administrator\";s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:22:\"alecerosiete@gmail.com\";s:8:\"password\";s:65:\"ca3f00c30a9ff399d6cd151feb8d6b7a:1fn6LLS0ESzqxk4bnhgsEtY8j39G7g6Z\";s:14:\"password_clear\";s:0:\"\";s:8:\"usertype\";s:19:\"Super Administrator\";s:5:\"block\";s:1:\"0\";s:9:\"sendEmail\";s:1:\"1\";s:3:\"gid\";s:2:\"25\";s:12:\"registerDate\";s:19:\"2012-11-27 05:08:34\";s:13:\"lastvisitDate\";s:19:\"2012-12-01 22:54:14\";s:10:\"activation\";s:0:\"\";s:6:\"params\";s:0:\"\";s:3:\"aid\";i:2;s:5:\"guest\";i:0;s:7:\"_params\";O:10:\"JParameter\":7:{s:4:\"_raw\";s:0:\"\";s:4:\"_xml\";N;s:9:\"_elements\";a:0:{}s:12:\"_elementPath\";a:1:{i:0;s:59:\"/var/www_old/joomla/libraries/joomla/html/parameter/element\";}s:17:\"_defaultNameSpace\";s:8:\"_default\";s:9:\"_registry\";a:1:{s:8:\"_default\";a:1:{s:4:\"data\";O:8:\"stdClass\":0:{}}}s:7:\"_errors\";a:0:{}}s:9:\"_errorMsg\";N;s:7:\"_errors\";a:0:{}s:10:\"superadmin\";b:1;}s:13:\"session.token\";s:32:\"e2615977e18fd8d0135dba8d5ff14918\";}');
/*!40000 ALTER TABLE `jos_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_stats_agents`
--

DROP TABLE IF EXISTS `jos_stats_agents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_stats_agents` (
  `agent` varchar(255) NOT NULL DEFAULT '',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `hits` int(11) unsigned NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_stats_agents`
--

LOCK TABLES `jos_stats_agents` WRITE;
/*!40000 ALTER TABLE `jos_stats_agents` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_stats_agents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_templates_menu`
--

DROP TABLE IF EXISTS `jos_templates_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_templates_menu` (
  `template` varchar(255) NOT NULL DEFAULT '',
  `menuid` int(11) NOT NULL DEFAULT '0',
  `client_id` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`menuid`,`client_id`,`template`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_templates_menu`
--

LOCK TABLES `jos_templates_menu` WRITE;
/*!40000 ALTER TABLE `jos_templates_menu` DISABLE KEYS */;
INSERT INTO `jos_templates_menu` VALUES ('rt_equinox_j15',0,0),('khepri',0,1);
/*!40000 ALTER TABLE `jos_templates_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_users`
--

DROP TABLE IF EXISTS `jos_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `username` varchar(150) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(100) NOT NULL DEFAULT '',
  `usertype` varchar(25) NOT NULL DEFAULT '',
  `block` tinyint(4) NOT NULL DEFAULT '0',
  `sendEmail` tinyint(4) DEFAULT '0',
  `gid` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `registerDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `lastvisitDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `activation` varchar(100) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `usertype` (`usertype`),
  KEY `idx_name` (`name`),
  KEY `gid_block` (`gid`,`block`),
  KEY `username` (`username`),
  KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_users`
--

LOCK TABLES `jos_users` WRITE;
/*!40000 ALTER TABLE `jos_users` DISABLE KEYS */;
INSERT INTO `jos_users` VALUES (62,'Administrator','admin','alecerosiete@gmail.com','ca3f00c30a9ff399d6cd151feb8d6b7a:1fn6LLS0ESzqxk4bnhgsEtY8j39G7g6Z','Super Administrator',0,1,25,'2012-11-27 05:08:34','2013-06-11 03:29:04','','');
/*!40000 ALTER TABLE `jos_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_weblinks`
--

DROP TABLE IF EXISTS `jos_weblinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_weblinks` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `catid` int(11) NOT NULL DEFAULT '0',
  `sid` int(11) NOT NULL DEFAULT '0',
  `title` varchar(250) NOT NULL DEFAULT '',
  `alias` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(250) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `hits` int(11) NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `approved` tinyint(1) NOT NULL DEFAULT '1',
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `catid` (`catid`,`published`,`archived`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_weblinks`
--

LOCK TABLES `jos_weblinks` WRITE;
/*!40000 ALTER TABLE `jos_weblinks` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_weblinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_zoo_application`
--

DROP TABLE IF EXISTS `jos_zoo_application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_zoo_application` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `application_group` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `params` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_zoo_application`
--

LOCK TABLES `jos_zoo_application` WRITE;
/*!40000 ALTER TABLE `jos_zoo_application` DISABLE KEYS */;
INSERT INTO `jos_zoo_application` VALUES (3,'Inmuebles','product','<p>De conformidad con el Articulo N°52 de la Ley 2856/06 y a las reglamentaciones vigentes, la Caja de Jubilaciones de Empleados de Bancos y Afines, pone a conocimiento de los interesados el listado de inmuebles disponibles para la venta directa. Mayores informaciones: Oficina de la Entidad, Humaita N° 377 entre Chile y Alberdi, Gerencia Comercial y de Servicios -División de Bienes Inmobiliarios, Teléfonos: 443322 - 492051/3 (Internos 133 - 150 - 223 - 255)</p>','{\"template\":\"default\",\"global.config.items_per_page\":\"9\",\"global.config.item_order\":\"alpha\",\"global.config.alpha_index\":\"3\",\"global.config.show_feed_link\":\"0\",\"global.config.feed_title\":\"\",\"global.config.alternate_feed_link\":\"\",\"global.template.show_alpha_index\":\"0\",\"global.template.show_title\":\"1\",\"global.template.show_description\":\"1\",\"global.template.show_image\":\"1\",\"global.template.alignment\":\"left\",\"global.template.categories_cols\":\"1\",\"global.template.show_categories_titles\":\"1\",\"global.template.show_categories_item_count\":\"1\",\"global.template.show_categories_descriptions\":\"1\",\"global.template.show_categories_images\":\"1\",\"global.template.show_sub_categories\":\"1\",\"global.template.show_sub_categories_item_count\":\"1\",\"global.template.items_cols\":\"2\",\"global.template.items_media_alignment\":\"left\",\"global.template.item_media_alignment\":\"right\",\"global.comments.enable_comments\":\"0\",\"global.comments.require_name_and_mail\":\"0\",\"global.comments.registered_users_only\":\"0\",\"global.comments.approved\":\"0\",\"global.comments.time_between_user_posts\":\"120\",\"global.comments.avatar\":\"1\",\"global.comments.order\":\"ASC\",\"global.comments.max_depth\":\"5\",\"global.comments.facebook_enable\":\"0\",\"global.comments.facebook_api_key\":\"\",\"global.comments.facebook_api_secret\":\"\",\"global.comments.twitter_enable\":\"0\",\"global.comments.twitter_consumer_key\":\"\",\"global.comments.twitter_consumer_secret\":\"\",\"global.comments.akismet_enable\":\"0\",\"global.comments.akismet_api_key\":\"\",\"global.comments.mollom_enable\":\"0\",\"global.comments.mollom_public_key\":\"\",\"global.comments.mollom_private_key\":\"\",\"global.comments.blacklist\":\"\",\"content.title\":\"Gerencia Comercial y de Servicios\",\"content.image\":\"images\\/stories\\/demo\\/product\\/frontpage.jpg\",\"content.image_width\":\"\",\"content.image_height\":\"\",\"content.categories_title\":\"Divisi\\u00f3n Bienes Inmobiliarios\",\"content.items_title\":\"fxghsg\",\"config.items_per_page\":\"9\",\"config.item_order\":\"alpha\",\"config.show_feed_link\":\"0\",\"config.feed_title\":\"\",\"config.alternate_feed_link\":\"\",\"template.show_alpha_index\":\"0\",\"template.show_title\":\"1\",\"template.show_description\":\"1\",\"template.show_image\":\"1\",\"template.alignment\":\"center\",\"template.categories_cols\":\"3\",\"template.show_categories_titles\":\"1\",\"template.show_categories_item_count\":\"1\",\"template.show_categories_descriptions\":\"1\",\"template.show_categories_images\":\"1\",\"template.show_sub_categories\":\"1\",\"template.show_sub_categories_item_count\":\"0\",\"template.items_cols\":\"2\",\"template.items_media_alignment\":\"left\"}');
/*!40000 ALTER TABLE `jos_zoo_application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_zoo_category`
--

DROP TABLE IF EXISTS `jos_zoo_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_zoo_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `application_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `parent` int(11) NOT NULL,
  `ordering` int(11) NOT NULL,
  `published` tinyint(1) NOT NULL,
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ALIAS_INDEX` (`alias`)
) ENGINE=MyISAM AUTO_INCREMENT=175 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_zoo_category`
--

LOCK TABLES `jos_zoo_category` WRITE;
/*!40000 ALTER TABLE `jos_zoo_category` DISABLE KEYS */;
INSERT INTO `jos_zoo_category` VALUES (17,3,'Capital y Area Metropolitana','ciudad-capital-y-area-metropolitana','',0,1,1,'{\"content.teaser_description\":\"Titulados a favor de la Caja\",\"content.teaser_image\":\"\",\"content.teaser_image_width\":\"\",\"content.teaser_image_height\":\"\",\"content.image\":\"\",\"content.image_width\":\"\",\"content.image_height\":\"\",\"content.categories_title\":\"Ciudad Capital y Area Metropolitana\",\"content.items_title\":\"Titulados a favor de la Caja\",\"template.show_title\":\"1\"}'),(18,3,'Ciudades del Interior','ciudades-del-interior','',0,2,1,'{\"content.teaser_description\":\"Titulados a favor de la Caja\",\"content.teaser_image\":\"\",\"content.teaser_image_width\":\"\",\"content.teaser_image_height\":\"\",\"content.image\":\"\",\"content.image_width\":\"\",\"content.image_height\":\"\",\"content.categories_title\":\"Titulados a favor de la Caja\",\"content.items_title\":\"Titulados a favor de la Caja\"}'),(19,3,'Capital y Area Motropolitana','adjudicados-s-acta-de-remate','',0,3,1,'{\"content.teaser_description\":\"Adjudicado sobre acta de Remate\",\"content.teaser_image\":\"\",\"content.teaser_image_width\":\"\",\"content.teaser_image_height\":\"\",\"content.image\":\"\",\"content.image_width\":\"\",\"content.image_height\":\"\",\"content.categories_title\":\"\",\"content.items_title\":\"Titulados a favor de la Caja\"}');
/*!40000 ALTER TABLE `jos_zoo_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_zoo_category_item`
--

DROP TABLE IF EXISTS `jos_zoo_category_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_zoo_category_item` (
  `category_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`item_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_zoo_category_item`
--

LOCK TABLES `jos_zoo_category_item` WRITE;
/*!40000 ALTER TABLE `jos_zoo_category_item` DISABLE KEYS */;
INSERT INTO `jos_zoo_category_item` VALUES (17,235),(17,236),(17,241),(18,237),(18,238),(18,239),(19,240);
/*!40000 ALTER TABLE `jos_zoo_category_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_zoo_comment`
--

DROP TABLE IF EXISTS `jos_zoo_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_zoo_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `user_type` varchar(255) NOT NULL,
  `author` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `ip` varchar(255) NOT NULL,
  `created` datetime NOT NULL,
  `content` text NOT NULL,
  `state` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_zoo_comment`
--

LOCK TABLES `jos_zoo_comment` WRITE;
/*!40000 ALTER TABLE `jos_zoo_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_zoo_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_zoo_item`
--

DROP TABLE IF EXISTS `jos_zoo_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_zoo_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `application_id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `modified_by` int(11) NOT NULL,
  `publish_up` datetime NOT NULL,
  `publish_down` datetime NOT NULL,
  `priority` int(11) NOT NULL,
  `hits` int(11) NOT NULL,
  `state` tinyint(3) NOT NULL,
  `access` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_by_alias` varchar(255) NOT NULL,
  `searchable` int(11) NOT NULL,
  `elements` text NOT NULL,
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ALIAS_INDEX` (`alias`),
  KEY `PUBLISH_INDEX` (`publish_up`,`publish_down`),
  KEY `STATE_INDEX` (`state`),
  KEY `ACCESS_INDEX` (`access`),
  KEY `CREATED_BY_INDEX` (`created_by`),
  KEY `NAME_INDEX` (`name`),
  FULLTEXT KEY `SEARCH_FULLTEXT` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=242 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_zoo_item`
--

LOCK TABLES `jos_zoo_item` WRITE;
/*!40000 ALTER TABLE `jos_zoo_item` DISABLE KEYS */;
INSERT INTO `jos_zoo_item` VALUES (236,3,'inmuebles','Capitan Aranda c/ Gobernador Irala','capitan-aranda-c-gobernador-irala','2012-12-01 18:07:12','2012-12-01 22:59:16',62,'2012-12-01 18:07:12','0000-00-00 00:00:00',0,8,1,0,62,'',1,'<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<elements><text identifier=\"0197b3be-604b-4389-912b-371c2a17d446\">\n  <value><![CDATA[Inmuble en Cap. Aranda c/ Gobernador Irala]]></value>\n</text><text identifier=\"a03c38fe-ca03-448b-ba77-cf5d97d31435\">\n  <value><![CDATA[M. 31.264-U-A01]]></value>\n</text><text identifier=\"a2685a7a-c516-44f2-8a2e-4245ba5d4892\">\n  <value><![CDATA[10-0292-05]]></value>\n</text><text identifier=\"2ef9218c-3064-4ee5-ad1a-d7bf76e7858d\">\n  <value><![CDATA[La Encarnación]]></value>\n</text><text identifier=\"ab43d8fd-5373-4c63-8df4-0509dcb80b22\">\n  <value><![CDATA[Cap. Aranda c/ Gobernador Irala]]></value>\n</text><text identifier=\"1857189c-b868-452b-a1e0-b681d30f32bc\">\n  <value><![CDATA[333.00]]></value>\n</text><checkbox identifier=\"eaa02273-2d3f-426b-99f2-096d92157851\">\n  <option><![CDATA[edificado]]></option>\n</checkbox><text identifier=\"3b7c7305-e232-4a93-84db-0f5a4a87fe31\">\n  <value><![CDATA[237.450.000]]></value>\n</text><checkbox identifier=\"4c53de36-b876-4f5f-9aae-45c8d0e9da85\">\n  <option><![CDATA[ocupantes-a-desalojar]]></option>\n</checkbox><textarea identifier=\"beab45eb-b32a-4766-822d-b3fb72b5b1d4\">\n  <value><![CDATA[<p>{mosmap width=\'100%\'|height=\'180px\'|lat=\'-25.292625|lon=\'-57.660545\'|zoom=\'15\'|zoomType=\'Large\'|zoomNew=\'1\' |mapType=\'Roadmap\'|showMaptype=\'1\'|overview=\'1\'|}</p>]]></value>\n</textarea><textarea identifier=\"83ba7366-d126-40f0-923e-3e7a94f0e773\">\n  <value><![CDATA[<p>{mosmap width=\'400px\'|height=\'500px\'|lat=\'-25.292625|lon=\'-57.660545\'|zoom=\'15\'|zoomType=\'Large\'|zoomNew=\'1\' |mapType=\'Roadmap\'|showMaptype=\'1\'|overview=\'1\'|}</p>]]></value>\n</textarea>\n</elements>','{\"config.enable_comments\":\"1\",\"metadata.description\":\"\",\"metadata.keywords\":\"\",\"metadata.robots\":\"\",\"metadata.author\":\"\"}'),(237,3,'inmuebles','Aregua','aregua','2012-12-01 18:25:57','2012-12-01 23:03:30',62,'2012-12-01 18:25:57','0000-00-00 00:00:00',0,2,1,0,62,'',1,'<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<elements><text identifier=\"0197b3be-604b-4389-912b-371c2a17d446\">\n  <value><![CDATA[Inmueble en Aregua, a 200 mts. de la Avda, Isla Valle]]></value>\n</text><text identifier=\"a03c38fe-ca03-448b-ba77-cf5d97d31435\">\n  <value><![CDATA[11.202]]></value>\n</text><text identifier=\"a2685a7a-c516-44f2-8a2e-4245ba5d4892\">\n  <value><![CDATA[27-2675-01 al 10]]></value>\n</text><text identifier=\"2ef9218c-3064-4ee5-ad1a-d7bf76e7858d\">\n  <value><![CDATA[Areguá]]></value>\n</text><text identifier=\"ab43d8fd-5373-4c63-8df4-0509dcb80b22\">\n  <value><![CDATA[Calle N° 5, aproximadamente a 200 mts. de la Av. Isla Valle]]></value>\n</text><text identifier=\"1857189c-b868-452b-a1e0-b681d30f32bc\">\n  <value><![CDATA[3600.5760]]></value>\n</text><checkbox identifier=\"eaa02273-2d3f-426b-99f2-096d92157851\">\n  <option><![CDATA[balio]]></option>\n</checkbox><text identifier=\"3b7c7305-e232-4a93-84db-0f5a4a87fe31\">\n  <value><![CDATA[79.200.000]]></value>\n</text><checkbox identifier=\"4c53de36-b876-4f5f-9aae-45c8d0e9da85\"/><textarea identifier=\"beab45eb-b32a-4766-822d-b3fb72b5b1d4\">\n  <value><![CDATA[<p>{mosmap width=\'100%\'|height=\'180px\'|lat=\'-25.285524\'|lon=\'-57.390718\'|zoom=\'11\'|zoomType=\'Large\'|zoomNew=\'1\' |mapType=\'Roadmap\'|showMaptype=\'1\'|overview=\'1\'|}</p>]]></value>\n</textarea><textarea identifier=\"83ba7366-d126-40f0-923e-3e7a94f0e773\">\n  <value><![CDATA[<p>{mosmap width=\'400\'|height=\'550px\'|lat=\'-25.297786\'|lon=\'-57.411661\'|zoom=\'13\'|zoomType=\'Large\'|zoomNew=\'1\' |mapType=\'Roadmap\'|showMaptype=\'1\'|overview=\'1\'|}</p>]]></value>\n</textarea>\n</elements>','{\"config.enable_comments\":\"1\",\"metadata.description\":\"\",\"metadata.keywords\":\"\",\"metadata.robots\":\"\",\"metadata.author\":\"\"}'),(238,3,'inmuebles','Fraccion Playas de Aregua','fraccion-playas-de-aregua','2012-12-01 18:48:25','2012-12-01 21:30:20',62,'2012-12-01 18:48:25','0000-00-00 00:00:00',0,5,1,0,62,'',1,'<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<elements><text identifier=\"0197b3be-604b-4389-912b-371c2a17d446\">\n  <value><![CDATA[Inmbueble en la fracción Playas de Areguá]]></value>\n</text><text identifier=\"a03c38fe-ca03-448b-ba77-cf5d97d31435\">\n  <value><![CDATA[9.438]]></value>\n</text><text identifier=\"a2685a7a-c516-44f2-8a2e-4245ba5d4892\">\n  <value><![CDATA[27-0351-22]]></value>\n</text><text identifier=\"2ef9218c-3064-4ee5-ad1a-d7bf76e7858d\">\n  <value><![CDATA[Areguá]]></value>\n</text><text identifier=\"ab43d8fd-5373-4c63-8df4-0509dcb80b22\">\n  <value><![CDATA[Fracción \"Playas de Areguá\"]]></value>\n</text><text identifier=\"1857189c-b868-452b-a1e0-b681d30f32bc\">\n  <value><![CDATA[504.00]]></value>\n</text><checkbox identifier=\"eaa02273-2d3f-426b-99f2-096d92157851\">\n  <option><![CDATA[edificado]]></option>\n</checkbox><text identifier=\"3b7c7305-e232-4a93-84db-0f5a4a87fe31\">\n  <value><![CDATA[43.680.000]]></value>\n</text><checkbox identifier=\"4c53de36-b876-4f5f-9aae-45c8d0e9da85\">\n  <option><![CDATA[con-oferte-recibida]]></option>\n</checkbox><textarea identifier=\"beab45eb-b32a-4766-822d-b3fb72b5b1d4\">\n  <value><![CDATA[<p>{mosmap width=\'100%\'|height=\'180px\'|lat=\'-25.302597\'|lon=\'-57.374926\'|zoom=\'13\'|zoomType=\'Large\'|zoomNew=\'1\' |mapType=\'Roadmap\'|showMaptype=\'1\'|overview=\'1\'|}</p>]]></value>\n</textarea><textarea identifier=\"83ba7366-d126-40f0-923e-3e7a94f0e773\">\n  <value><![CDATA[<p>{mosmap  width=\'400px\'|height=\'550px\'|lat=\'-25.302597\'|lon=\'-57.374926\'|zoom=\'13\'|zoomType=\'Large\'|zoomNew=\'1\'  |mapType=\'Roadmap\'|showMaptype=\'1\'|overview=\'1\'|}</p>]]></value>\n</textarea>\n</elements>','{\"config.enable_comments\":\"1\",\"metadata.description\":\"\",\"metadata.keywords\":\"\",\"metadata.robots\":\"\",\"metadata.author\":\"\"}'),(239,3,'inmuebles','Valle Pucú - Areguá','valle-pucu---aregua','2012-12-01 21:33:08','2012-12-01 21:40:11',62,'2012-12-01 21:33:08','0000-00-00 00:00:00',0,2,1,0,62,'',1,'<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<elements><text identifier=\"0197b3be-604b-4389-912b-371c2a17d446\">\n  <value><![CDATA[Inmuble de 734.1408 m2]]></value>\n</text><text identifier=\"a03c38fe-ca03-448b-ba77-cf5d97d31435\">\n  <value><![CDATA[2.635]]></value>\n</text><text identifier=\"a2685a7a-c516-44f2-8a2e-4245ba5d4892\">\n  <value><![CDATA[P. N° 3.016]]></value>\n</text><text identifier=\"2ef9218c-3064-4ee5-ad1a-d7bf76e7858d\">\n  <value><![CDATA[Areguá]]></value>\n</text><text identifier=\"ab43d8fd-5373-4c63-8df4-0509dcb80b22\">\n  <value><![CDATA[A 200 mts. de la Calle Humaitá. Lugar \"Valle Pucú\"]]></value>\n</text><text identifier=\"1857189c-b868-452b-a1e0-b681d30f32bc\">\n  <value><![CDATA[734.1408]]></value>\n</text><checkbox identifier=\"eaa02273-2d3f-426b-99f2-096d92157851\">\n  <option><![CDATA[edificado]]></option>\n</checkbox><text identifier=\"3b7c7305-e232-4a93-84db-0f5a4a87fe31\">\n  <value><![CDATA[57.432.816]]></value>\n</text><checkbox identifier=\"4c53de36-b876-4f5f-9aae-45c8d0e9da85\">\n  <option><![CDATA[es-propietario-a-desalojar]]></option>\n</checkbox><textarea identifier=\"beab45eb-b32a-4766-822d-b3fb72b5b1d4\">\n  <value><![CDATA[<p>{mosmap width=\'100%\'|height=\'180px\'|lat=\'-25.293906\'|lon=\'-57.433803\'|zoom=\'13\'|zoomType=\'Large\'|zoomNew=\'1\' |mapType=\'Roadmap\'|showMaptype=\'1\'|overview=\'1\'|}</p>]]></value>\n</textarea><textarea identifier=\"83ba7366-d126-40f0-923e-3e7a94f0e773\">\n  <value><![CDATA[<p>{mosmap width=\'400px\'|height=\'550px\'|lat=\'-25.293906\'|lon=\'-57.433803\'|zoom=\'13\'|zoomType=\'Large\'|zoomNew=\'1\' |mapType=\'Roadmap\'|showMaptype=\'1\'|overview=\'1\'|}</p>]]></value>\n</textarea>\n</elements>','{\"metadata.description\":\"\",\"metadata.keywords\":\"\",\"metadata.robots\":\"\",\"metadata.author\":\"\",\"config.enable_comments\":\"1\"}'),(240,3,'inmuebles','Avda. Chian Kai Shek c/ 15 de Agosto - Asunción','avda-chian-kai-shek-c-15-de-agosto---asuncion','2012-12-01 21:41:07','2012-12-01 21:48:37',62,'2012-12-01 21:41:07','0000-00-00 00:00:00',0,1,1,0,62,'',1,'<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<elements><text identifier=\"0197b3be-604b-4389-912b-371c2a17d446\">\n  <value><![CDATA[Inmuble en La Encarnacion de 294.96 m2]]></value>\n</text><text identifier=\"a03c38fe-ca03-448b-ba77-cf5d97d31435\">\n  <value><![CDATA[4583]]></value>\n</text><text identifier=\"a2685a7a-c516-44f2-8a2e-4245ba5d4892\">\n  <value><![CDATA[10-0623-03]]></value>\n</text><text identifier=\"2ef9218c-3064-4ee5-ad1a-d7bf76e7858d\">\n  <value><![CDATA[La Encarnación]]></value>\n</text><text identifier=\"ab43d8fd-5373-4c63-8df4-0509dcb80b22\">\n  <value><![CDATA[Avda. Chian Kai Shek(Dr. Ignacio A, Pane) c/ 15 de Agosto y 14 de Mayo]]></value>\n</text><text identifier=\"1857189c-b868-452b-a1e0-b681d30f32bc\">\n  <value><![CDATA[294.96]]></value>\n</text><checkbox identifier=\"eaa02273-2d3f-426b-99f2-096d92157851\">\n  <option><![CDATA[edificado]]></option>\n</checkbox><text identifier=\"3b7c7305-e232-4a93-84db-0f5a4a87fe31\">\n  <value><![CDATA[160.384.000]]></value>\n</text><checkbox identifier=\"4c53de36-b876-4f5f-9aae-45c8d0e9da85\">\n  <option><![CDATA[ocupantes-a-desalojar]]></option>\n</checkbox><textarea identifier=\"beab45eb-b32a-4766-822d-b3fb72b5b1d4\">\n  <value><![CDATA[<p>{mosmap width=\'100%\'|height=\'180px\'|lat=\'-25.300114\'|lon=\'-57.650549\'|zoom=\'15\'|zoomType=\'Large\'|zoomNew=\'1\' |mapType=\'Roadmap\'|showMaptype=\'1\'|overview=\'1\'|}</p>]]></value>\n</textarea><textarea identifier=\"83ba7366-d126-40f0-923e-3e7a94f0e773\">\n  <value><![CDATA[<p>{mosmap width=\'400px\'|height=\'550px\'|lat=\'-25.300114\'|lon=\'-57.650549\'|zoom=\'15\'|zoomType=\'Large\'|zoomNew=\'1\' |mapType=\'Roadmap\'|showMaptype=\'1\'|overview=\'1\'|}</p>]]></value>\n</textarea>\n</elements>','{\"config.enable_comments\":\"1\",\"metadata.description\":\"\",\"metadata.keywords\":\"\",\"metadata.robots\":\"\",\"metadata.author\":\"\"}'),(241,3,'inmuebles','Peru c/ Lomas Valentinas','peru-c-lomas-valentinas','2012-12-01 21:48:43','2012-12-01 23:01:18',62,'2012-12-01 21:48:43','0000-00-00 00:00:00',0,1,1,0,62,'',1,'<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<elements><text identifier=\"0197b3be-604b-4389-912b-371c2a17d446\">\n  <value><![CDATA[Inmueble en San Roque, Asuncion. Superficie de 210.00 m2]]></value>\n</text><text identifier=\"a03c38fe-ca03-448b-ba77-cf5d97d31435\">\n  <value><![CDATA[4.542]]></value>\n</text><text identifier=\"a2685a7a-c516-44f2-8a2e-4245ba5d4892\">\n  <value><![CDATA[12-0233-40]]></value>\n</text><text identifier=\"2ef9218c-3064-4ee5-ad1a-d7bf76e7858d\">\n  <value><![CDATA[San Roque]]></value>\n</text><text identifier=\"ab43d8fd-5373-4c63-8df4-0509dcb80b22\">\n  <value><![CDATA[Peru c/ Lomas Valentinas]]></value>\n</text><text identifier=\"1857189c-b868-452b-a1e0-b681d30f32bc\">\n  <value><![CDATA[210.00]]></value>\n</text><checkbox identifier=\"eaa02273-2d3f-426b-99f2-096d92157851\">\n  <option><![CDATA[edificado]]></option>\n</checkbox><text identifier=\"3b7c7305-e232-4a93-84db-0f5a4a87fe31\">\n  <value><![CDATA[180.360.000]]></value>\n</text><checkbox identifier=\"4c53de36-b876-4f5f-9aae-45c8d0e9da85\">\n  <option><![CDATA[con-juicio-de-ocupacion]]></option>\n</checkbox><textarea identifier=\"beab45eb-b32a-4766-822d-b3fb72b5b1d4\">\n  <value><![CDATA[<p>{mosmap width=\'100%\'|height=\'180px\'|lat=\'-25.300579\'|lon=\'-57.627589\'|zoom=\'14\'|zoomType=\'Large\'|zoomNew=\'1\' |mapType=\'Roadmap\'|showMaptype=\'1\'|overview=\'1\'|}</p>]]></value>\n</textarea><textarea identifier=\"83ba7366-d126-40f0-923e-3e7a94f0e773\">\n  <value><![CDATA[<p>{mosmap width=\'400px\'|height=\'550px\'|lat=\'-25.300579\'|lon=\'-57.627589\'|zoom=\'15\'|zoomType=\'Large\'|zoomNew=\'1\' |mapType=\'Roadmap\'|showMaptype=\'1\'|overview=\'1\'|}</p>]]></value>\n</textarea>\n</elements>','{\"config.enable_comments\":\"1\",\"metadata.description\":\"\",\"metadata.keywords\":\"\",\"metadata.robots\":\"\",\"metadata.author\":\"\",\"template.item_media_alignment\":\"right\"}'),(235,3,'inmuebles','Comandante Gamarra c/ Miranda','comandante-gamarra-c-miranda','2012-11-27 14:01:18','2012-12-01 23:00:15',62,'2012-11-27 06:10:44','0000-00-00 00:00:00',0,53,1,0,62,'',1,'<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<elements><text identifier=\"0197b3be-604b-4389-912b-371c2a17d446\">\n  <value><![CDATA[Inmuble en La Encarnacion, Asunción. Con 346.0040 m2]]></value>\n</text><text identifier=\"a03c38fe-ca03-448b-ba77-cf5d97d31435\">\n  <value><![CDATA[M. 17.692]]></value>\n</text><text identifier=\"a2685a7a-c516-44f2-8a2e-4245ba5d4892\">\n  <value><![CDATA[10-0145-12]]></value>\n</text><text identifier=\"2ef9218c-3064-4ee5-ad1a-d7bf76e7858d\">\n  <value><![CDATA[La Encarnación]]></value>\n</text><text identifier=\"ab43d8fd-5373-4c63-8df4-0509dcb80b22\">\n  <value><![CDATA[Comandante Gamarra c/ Dr. Miranda y Lagerenza]]></value>\n</text><text identifier=\"1857189c-b868-452b-a1e0-b681d30f32bc\">\n  <value><![CDATA[346.0040]]></value>\n</text><checkbox identifier=\"eaa02273-2d3f-426b-99f2-096d92157851\">\n  <option><![CDATA[edificado]]></option>\n</checkbox><text identifier=\"3b7c7305-e232-4a93-84db-0f5a4a87fe31\">\n  <value/>\n</text><checkbox identifier=\"4c53de36-b876-4f5f-9aae-45c8d0e9da85\">\n  <option><![CDATA[es-propietario-a-desalojar]]></option>\n  <option><![CDATA[ocupantes-a-desalojar]]></option>\n</checkbox><textarea identifier=\"beab45eb-b32a-4766-822d-b3fb72b5b1d4\">\n  <value><![CDATA[<p>{mosmap width=\'100%\'|height=\'180px\'|lat=\'-25.282342|lon=\'-57.651962\'|zoom=\'15\'|zoomType=\'Large\'|zoomNew=\'1\' |mapType=\'Roadmap\'|showMaptype=\'1\'|overview=\'1\'|}</p>]]></value>\n</textarea><textarea identifier=\"83ba7366-d126-40f0-923e-3e7a94f0e773\">\n  <value><![CDATA[<p>{mosmap lightbox=\'0\' width=\'400px\'|height=\'500px\'|lat=\'-25.282342|lon=\'-57.651962\'|zoom=\'15\'|zoomType=\'Large\'|zoomNew=\'1\' |mapType=\'Roadmap\'|showMaptype=\'1\'|overview=\'1\'|}</p>]]></value>\n</textarea>\n</elements>','{\"config.enable_comments\":\"1\",\"metadata.description\":\"\",\"metadata.keywords\":\"\",\"metadata.robots\":\"\",\"metadata.author\":\"\"}');
/*!40000 ALTER TABLE `jos_zoo_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_zoo_rating`
--

DROP TABLE IF EXISTS `jos_zoo_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_zoo_rating` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) DEFAULT NULL,
  `element_id` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `value` tinyint(4) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_zoo_rating`
--

LOCK TABLES `jos_zoo_rating` WRITE;
/*!40000 ALTER TABLE `jos_zoo_rating` DISABLE KEYS */;
/*!40000 ALTER TABLE `jos_zoo_rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_zoo_search_index`
--

DROP TABLE IF EXISTS `jos_zoo_search_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_zoo_search_index` (
  `item_id` int(11) NOT NULL,
  `element_id` varchar(255) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`item_id`,`element_id`),
  FULLTEXT KEY `SEARCH_FULLTEXT` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_zoo_search_index`
--

LOCK TABLES `jos_zoo_search_index` WRITE;
/*!40000 ALTER TABLE `jos_zoo_search_index` DISABLE KEYS */;
INSERT INTO `jos_zoo_search_index` VALUES (236,'0197b3be-604b-4389-912b-371c2a17d446','Inmuble en Cap. Aranda c/ Gobernador Irala'),(236,'a03c38fe-ca03-448b-ba77-cf5d97d31435','M. 31.264-U-A01'),(236,'a2685a7a-c516-44f2-8a2e-4245ba5d4892','10-0292-05'),(236,'2ef9218c-3064-4ee5-ad1a-d7bf76e7858d','La Encarnación'),(236,'ab43d8fd-5373-4c63-8df4-0509dcb80b22','Cap. Aranda c/ Gobernador Irala'),(236,'1857189c-b868-452b-a1e0-b681d30f32bc','333.00'),(236,'eaa02273-2d3f-426b-99f2-096d92157851','Edificado'),(236,'3b7c7305-e232-4a93-84db-0f5a4a87fe31','237.450.000'),(236,'4c53de36-b876-4f5f-9aae-45c8d0e9da85','Ocupantes a desalojar<br>'),(236,'beab45eb-b32a-4766-822d-b3fb72b5b1d4','{mosmap width=\'100%\'|height=\'180px\'|lat=\'-25.292625|lon=\'-57.660545\'|zoom=\'15\'|zoomType=\'Large\'|zoomNew=\'1\' |mapType=\'Roadmap\'|showMaptype=\'1\'|overview=\'1\'|}'),(236,'83ba7366-d126-40f0-923e-3e7a94f0e773','{mosmap width=\'400px\'|height=\'500px\'|lat=\'-25.292625|lon=\'-57.660545\'|zoom=\'15\'|zoomType=\'Large\'|zoomNew=\'1\' |mapType=\'Roadmap\'|showMaptype=\'1\'|overview=\'1\'|}'),(237,'0197b3be-604b-4389-912b-371c2a17d446','Inmueble en Aregua, a 200 mts. de la Avda, Isla Valle'),(237,'a03c38fe-ca03-448b-ba77-cf5d97d31435','11.202'),(237,'a2685a7a-c516-44f2-8a2e-4245ba5d4892','27-2675-01 al 10'),(237,'2ef9218c-3064-4ee5-ad1a-d7bf76e7858d','Areguá'),(237,'ab43d8fd-5373-4c63-8df4-0509dcb80b22','Calle N° 5, aproximadamente a 200 mts. de la Av. Isla Valle'),(237,'1857189c-b868-452b-a1e0-b681d30f32bc','3600.5760'),(237,'eaa02273-2d3f-426b-99f2-096d92157851','Baldio'),(237,'3b7c7305-e232-4a93-84db-0f5a4a87fe31','79.200.000'),(237,'beab45eb-b32a-4766-822d-b3fb72b5b1d4','{mosmap width=\'100%\'|height=\'180px\'|lat=\'-25.285524\'|lon=\'-57.390718\'|zoom=\'11\'|zoomType=\'Large\'|zoomNew=\'1\' |mapType=\'Roadmap\'|showMaptype=\'1\'|overview=\'1\'|}'),(237,'83ba7366-d126-40f0-923e-3e7a94f0e773','{mosmap width=\'400\'|height=\'550px\'|lat=\'-25.297786\'|lon=\'-57.411661\'|zoom=\'13\'|zoomType=\'Large\'|zoomNew=\'1\' |mapType=\'Roadmap\'|showMaptype=\'1\'|overview=\'1\'|}'),(238,'0197b3be-604b-4389-912b-371c2a17d446','Inmbueble en la fracción Playas de Areguá'),(238,'a03c38fe-ca03-448b-ba77-cf5d97d31435','9.438'),(238,'a2685a7a-c516-44f2-8a2e-4245ba5d4892','27-0351-22'),(238,'2ef9218c-3064-4ee5-ad1a-d7bf76e7858d','Areguá'),(238,'ab43d8fd-5373-4c63-8df4-0509dcb80b22','Fracción \"Playas de Areguá\"'),(238,'1857189c-b868-452b-a1e0-b681d30f32bc','504.00'),(238,'eaa02273-2d3f-426b-99f2-096d92157851','Edificado'),(238,'3b7c7305-e232-4a93-84db-0f5a4a87fe31','43.680.000'),(238,'4c53de36-b876-4f5f-9aae-45c8d0e9da85','Con oferta recibida<br>'),(238,'beab45eb-b32a-4766-822d-b3fb72b5b1d4','{mosmap width=\'100%\'|height=\'180px\'|lat=\'-25.302597\'|lon=\'-57.374926\'|zoom=\'13\'|zoomType=\'Large\'|zoomNew=\'1\' |mapType=\'Roadmap\'|showMaptype=\'1\'|overview=\'1\'|}'),(238,'83ba7366-d126-40f0-923e-3e7a94f0e773','{mosmap  width=\'400px\'|height=\'550px\'|lat=\'-25.302597\'|lon=\'-57.374926\'|zoom=\'13\'|zoomType=\'Large\'|zoomNew=\'1\'  |mapType=\'Roadmap\'|showMaptype=\'1\'|overview=\'1\'|}'),(239,'0197b3be-604b-4389-912b-371c2a17d446','Inmuble de 734.1408 m2'),(239,'a03c38fe-ca03-448b-ba77-cf5d97d31435','2.635'),(239,'a2685a7a-c516-44f2-8a2e-4245ba5d4892','P. N° 3.016'),(239,'2ef9218c-3064-4ee5-ad1a-d7bf76e7858d','Areguá'),(239,'ab43d8fd-5373-4c63-8df4-0509dcb80b22','A 200 mts. de la Calle Humaitá. Lugar \"Valle Pucú\"'),(239,'1857189c-b868-452b-a1e0-b681d30f32bc','734.1408'),(239,'eaa02273-2d3f-426b-99f2-096d92157851','Edificado'),(239,'3b7c7305-e232-4a93-84db-0f5a4a87fe31','57.432.816'),(239,'4c53de36-b876-4f5f-9aae-45c8d0e9da85','Ex propietario a desalojar<br>'),(239,'beab45eb-b32a-4766-822d-b3fb72b5b1d4','{mosmap width=\'100%\'|height=\'180px\'|lat=\'-25.293906\'|lon=\'-57.433803\'|zoom=\'13\'|zoomType=\'Large\'|zoomNew=\'1\' |mapType=\'Roadmap\'|showMaptype=\'1\'|overview=\'1\'|}'),(239,'83ba7366-d126-40f0-923e-3e7a94f0e773','{mosmap width=\'400px\'|height=\'550px\'|lat=\'-25.293906\'|lon=\'-57.433803\'|zoom=\'13\'|zoomType=\'Large\'|zoomNew=\'1\' |mapType=\'Roadmap\'|showMaptype=\'1\'|overview=\'1\'|}'),(240,'0197b3be-604b-4389-912b-371c2a17d446','Inmuble en La Encarnacion de 294.96 m2'),(240,'a03c38fe-ca03-448b-ba77-cf5d97d31435','4583'),(240,'a2685a7a-c516-44f2-8a2e-4245ba5d4892','10-0623-03'),(240,'2ef9218c-3064-4ee5-ad1a-d7bf76e7858d','La Encarnación'),(240,'ab43d8fd-5373-4c63-8df4-0509dcb80b22','Avda. Chian Kai Shek(Dr. Ignacio A, Pane) c/ 15 de Agosto y 14 de Mayo'),(240,'1857189c-b868-452b-a1e0-b681d30f32bc','294.96'),(240,'eaa02273-2d3f-426b-99f2-096d92157851','Edificado'),(240,'3b7c7305-e232-4a93-84db-0f5a4a87fe31','160.384.000'),(240,'4c53de36-b876-4f5f-9aae-45c8d0e9da85','Ocupantes a desalojar<br>'),(240,'beab45eb-b32a-4766-822d-b3fb72b5b1d4','{mosmap width=\'100%\'|height=\'180px\'|lat=\'-25.300114\'|lon=\'-57.650549\'|zoom=\'15\'|zoomType=\'Large\'|zoomNew=\'1\' |mapType=\'Roadmap\'|showMaptype=\'1\'|overview=\'1\'|}'),(240,'83ba7366-d126-40f0-923e-3e7a94f0e773','{mosmap width=\'400px\'|height=\'550px\'|lat=\'-25.300114\'|lon=\'-57.650549\'|zoom=\'15\'|zoomType=\'Large\'|zoomNew=\'1\' |mapType=\'Roadmap\'|showMaptype=\'1\'|overview=\'1\'|}'),(241,'0197b3be-604b-4389-912b-371c2a17d446','Inmueble en San Roque, Asuncion. Superficie de 210.00 m2'),(241,'a03c38fe-ca03-448b-ba77-cf5d97d31435','4.542'),(241,'a2685a7a-c516-44f2-8a2e-4245ba5d4892','12-0233-40'),(241,'2ef9218c-3064-4ee5-ad1a-d7bf76e7858d','San Roque'),(241,'ab43d8fd-5373-4c63-8df4-0509dcb80b22','Peru c/ Lomas Valentinas'),(241,'1857189c-b868-452b-a1e0-b681d30f32bc','210.00'),(241,'eaa02273-2d3f-426b-99f2-096d92157851','Edificado'),(241,'3b7c7305-e232-4a93-84db-0f5a4a87fe31','180.360.000'),(241,'4c53de36-b876-4f5f-9aae-45c8d0e9da85','Con juicio de ocupación<br>'),(241,'beab45eb-b32a-4766-822d-b3fb72b5b1d4','{mosmap width=\'100%\'|height=\'180px\'|lat=\'-25.300579\'|lon=\'-57.627589\'|zoom=\'14\'|zoomType=\'Large\'|zoomNew=\'1\' |mapType=\'Roadmap\'|showMaptype=\'1\'|overview=\'1\'|}'),(241,'83ba7366-d126-40f0-923e-3e7a94f0e773','{mosmap width=\'400px\'|height=\'550px\'|lat=\'-25.300579\'|lon=\'-57.627589\'|zoom=\'15\'|zoomType=\'Large\'|zoomNew=\'1\' |mapType=\'Roadmap\'|showMaptype=\'1\'|overview=\'1\'|}'),(235,'83ba7366-d126-40f0-923e-3e7a94f0e773','{mosmap lightbox=\'0\' width=\'400px\'|height=\'500px\'|lat=\'-25.282342|lon=\'-57.651962\'|zoom=\'15\'|zoomType=\'Large\'|zoomNew=\'1\' |mapType=\'Roadmap\'|showMaptype=\'1\'|overview=\'1\'|}'),(235,'4c53de36-b876-4f5f-9aae-45c8d0e9da85','Ex propietario a desalojar<br>\nOcupantes a desalojar<br>'),(235,'beab45eb-b32a-4766-822d-b3fb72b5b1d4','{mosmap width=\'100%\'|height=\'180px\'|lat=\'-25.282342|lon=\'-57.651962\'|zoom=\'15\'|zoomType=\'Large\'|zoomNew=\'1\' |mapType=\'Roadmap\'|showMaptype=\'1\'|overview=\'1\'|}'),(235,'0197b3be-604b-4389-912b-371c2a17d446','Inmuble en La Encarnacion, Asunción. Con 346.0040 m2'),(235,'a03c38fe-ca03-448b-ba77-cf5d97d31435','M. 17.692'),(235,'a2685a7a-c516-44f2-8a2e-4245ba5d4892','10-0145-12'),(235,'2ef9218c-3064-4ee5-ad1a-d7bf76e7858d','La Encarnación'),(235,'ab43d8fd-5373-4c63-8df4-0509dcb80b22','Comandante Gamarra c/ Dr. Miranda y Lagerenza'),(235,'1857189c-b868-452b-a1e0-b681d30f32bc','346.0040'),(235,'eaa02273-2d3f-426b-99f2-096d92157851','Edificado');
/*!40000 ALTER TABLE `jos_zoo_search_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jos_zoo_tag`
--

DROP TABLE IF EXISTS `jos_zoo_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jos_zoo_tag` (
  `item_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`item_id`,`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jos_zoo_tag`
--

LOCK TABLES `jos_zoo_tag` WRITE;
/*!40000 ALTER TABLE `jos_zoo_tag` DISABLE KEYS */;
INSERT INTO `jos_zoo_tag` VALUES (1,'iPhone'),(1,'Wallpaper'),(2,'Free'),(2,'Icons'),(3,'Movies'),(3,'Wallpaper'),(5,'HDR'),(5,'Photography'),(6,'CMS'),(6,'Drupal'),(6,'Joomla'),(6,'Open Source'),(6,'Wordpress'),(7,'Wallpaper'),(8,'Retro'),(8,'Showcase'),(9,'Blockbuster'),(9,'Overlength'),(9,'Peter Jackson'),(9,'Won Oscar'),(11,'Blockbuster'),(11,'Overlength'),(11,'Peter Jackson'),(11,'Won Oscar'),(12,'Blockbuster'),(12,'Overlength'),(12,'Peter Jackson'),(12,'Won Oscar'),(13,'Love Story'),(15,'Restricted'),(16,'Blockbuster'),(16,'Overlength'),(16,'Won Oscar'),(18,'Won Oscar'),(19,'Pixar'),(19,'Suitable for children'),(19,'Won Oscar'),(20,'Blockbuster'),(20,'Overlength'),(20,'Peter Jackson'),(20,'Won Oscar'),(22,'Johnny Depp'),(23,'Pixar'),(23,'Suitable for children'),(23,'Won Oscar'),(25,'Won Oscar'),(28,'Blockbuster'),(28,'Won Oscar'),(29,'Pixar'),(29,'Suitable for children'),(29,'Won Oscar'),(30,'Love Story'),(31,'Blockbuster'),(32,'Blockbuster'),(33,'Johnny Depp'),(34,'Restricted'),(35,'Restricted'),(37,'Suitable for children'),(39,'Restricted'),(40,'Restricted'),(43,'Blockbuster'),(43,'Johnny Depp'),(43,'Overlength'),(43,'Won Oscar'),(44,'Blockbuster'),(44,'Johnny Depp'),(44,'Overlength'),(45,'Blockbuster'),(45,'Johnny Depp'),(45,'Overlength'),(49,'Love Story'),(50,'Luxury'),(51,'Luxury'),(52,'Luxury'),(53,'PHP'),(55,'MySQL'),(56,'Javascript'),(57,'CSS'),(57,'HMTL'),(58,'Java'),(59,'MySQL'),(60,'Actionscript'),(60,'Flash'),(61,'MySQL'),(62,'Canon'),(62,'Pink'),(62,'Silver'),(63,'Pink'),(64,'Blue'),(64,'Samsung'),(65,'Casio'),(65,'Pink'),(66,'Silver'),(67,'Green'),(68,'Black'),(68,'Casio'),(69,'Red'),(69,'Sony'),(70,'Beige'),(70,'Canon'),(71,'Canon'),(71,'Silver'),(72,'Samsung'),(72,'Silver'),(73,'Blue'),(73,'Samsung'),(74,'Pink'),(74,'Samsung'),(75,'Pink'),(75,'Samsung'),(76,'Silver'),(77,'Black'),(77,'Samsung'),(78,'Black'),(78,'Samsung'),(80,'Black'),(80,'Sony'),(81,'Black'),(81,'Sony'),(82,'Black'),(82,'Samsung'),(83,'Black'),(83,'Nokia'),(93,'Luxury'),(119,'Pink'),(119,'Samsung'),(144,'Casio'),(145,'Casio'),(147,'Luxury'),(148,'Luxury'),(159,'Delicious'),(160,'Cold'),(160,'Delicious'),(161,'Delicious'),(162,'Grilled'),(163,'Delicious'),(163,'Grilled'),(164,'Delicious'),(165,'Delicious'),(166,'Delicious'),(167,'Delicious'),(168,'Delicious'),(169,'Cold'),(169,'Delicious'),(170,'Delicious'),(171,'Delicious'),(173,'Delicious'),(174,'Delicious'),(175,'Delicious'),(178,'Joomla'),(178,'MySQL 4.1'),(178,'PHP 5.3'),(179,'Beginner'),(180,'Beginner'),(181,'Beginner'),(182,'Joomla'),(182,'MySQL 4.1'),(182,'PHP 5.3'),(183,'Joomla'),(184,'Joomla'),(184,'Options'),(185,'Joomla'),(186,'CSS'),(186,'Joomla'),(186,'Template'),(187,'Joomla'),(187,'Options'),(188,'CSS'),(188,'Joomla'),(188,'Template'),(189,'Joomla'),(190,'Joomla'),(190,'MySQL 4.1'),(190,'PHP 5.3'),(191,'Joomla'),(192,'Joomla'),(193,'Joomla'),(193,'Options'),(193,'Template'),(194,'CSS'),(194,'Joomla'),(194,'Template'),(195,'Joomla'),(196,'Joomla'),(196,'MySQL 4.1'),(197,'Joomla'),(197,'MySQL 4.1'),(197,'PHP 5.3'),(198,'CMS'),(198,'Free'),(198,'Joomla'),(198,'Movies'),(198,'Open Source'),(199,'MySQL 3.23'),(199,'PHP 5.2'),(199,'Wordpress'),(200,'MySQL 3.23'),(200,'Wordpress'),(201,'Wordpress'),(202,'PHP'),(202,'Templating'),(202,'Wordpress'),(203,'Parameters'),(203,'Templating'),(203,'Wordpress'),(204,'Wordpress'),(205,'Wordpress'),(206,'MySQL 3.23'),(206,'PHP 5.2'),(206,'Wordpress'),(207,'Wordpress'),(208,'PHP'),(208,'Templating'),(208,'Wordpress'),(209,'Parameters'),(209,'Wordpress'),(210,'PHP'),(210,'Templating'),(210,'Wordpress'),(211,'Wordpress'),(212,'Parameters'),(212,'Wordpress'),(213,'Wordpress'),(214,'MySQL 3.23'),(214,'PHP 5.2'),(214,'Wordpress'),(215,'MySQL 3.23'),(215,'PHP 5.2'),(215,'Wordpress'),(216,'Drupal'),(216,'MySQL 5.0'),(216,'PHP 4.3.10'),(217,'Drupal'),(217,'MySQL 5.0'),(218,'Drupal'),(219,'Drupal'),(219,'HTML'),(219,'Themes'),(220,'Configuration'),(220,'Drupal'),(220,'Themes'),(221,'Drupal'),(222,'Drupal'),(223,'Drupal'),(223,'MySQL 5.0'),(223,'PHP 4.3.10'),(224,'Drupal'),(225,'Drupal'),(225,'HTML'),(225,'Themes'),(226,'Configuration'),(226,'Drupal'),(227,'Drupal'),(227,'HTML'),(227,'Themes'),(228,'Drupal'),(229,'Configuration'),(229,'Drupal'),(230,'Drupal'),(231,'Drupal'),(231,'MySQL 5.0'),(231,'PHP 4.3.10'),(232,'Drupal'),(232,'MySQL 5.0'),(232,'PHP 4.3.10');
/*!40000 ALTER TABLE `jos_zoo_tag` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-06-10 23:47:04

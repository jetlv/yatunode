# SQL Manager 2010 for MySQL 4.5.0.9
# ---------------------------------------
# Host     : localhost
# Port     : 3306
# Database : yatu


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

SET FOREIGN_KEY_CHECKS=0;

DROP DATABASE IF EXISTS `yatu`;

CREATE DATABASE `yatu`
    CHARACTER SET 'utf8'
    COLLATE 'utf8_general_ci';

USE `yatu`;

#
# Structure for the `yatu_images` table : 
#

DROP TABLE IF EXISTS `yatu_images`;

CREATE TABLE `yatu_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(500) NOT NULL DEFAULT '图片素材' COMMENT '图片的名称，描述这个图片',
  `path` varchar(500) NOT NULL COMMENT '图片的路径，用于在项目中操作',
  `height` int(11) DEFAULT '0' COMMENT '图片高度',
  `width` int(11) DEFAULT '0' COMMENT '图片宽度',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '图片状态，默认0正常，其他待定',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

#
# Structure for the `yatu_location` table : 
#

DROP TABLE IF EXISTS `yatu_location`;

CREATE TABLE `yatu_location` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(500) DEFAULT NULL COMMENT '位置描述',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '位置的状态，默认0为正常，其他待定',
  `imageidlist` varchar(50) DEFAULT NULL COMMENT '当前位置图片的list',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

#
# Structure for the `yatu_menu` table : 
#

DROP TABLE IF EXISTS `yatu_menu`;

CREATE TABLE `yatu_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ename` varchar(500) DEFAULT NULL COMMENT '英语名称',
  `cname` varchar(500) DEFAULT NULL COMMENT '中文名称',
  `location` int(11) DEFAULT NULL COMMENT '从左到右的位置',
  `href` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

#
# Structure for the `yatu_text` table : 
#

DROP TABLE IF EXISTS `yatu_text`;

CREATE TABLE `yatu_text` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` int(11) DEFAULT NULL COMMENT '编码，用于标记',
  `content` longtext COMMENT '文字内容',
  `description` varchar(500) DEFAULT NULL COMMENT '说明这是什么文字',
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

#
# Structure for the `yatu_videos` table : 
#

DROP TABLE IF EXISTS `yatu_videos`;

CREATE TABLE `yatu_videos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(500) DEFAULT '视频素材' COMMENT '视频的名称，描述这个视频',
  `path` varchar(500) NOT NULL DEFAULT 'http://' COMMENT '视频地址，一般为优酷外链',
  `type` varchar(100) DEFAULT NULL COMMENT '视频类别',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

#
# Data for the `yatu_images` table  (LIMIT 0,500)
#

INSERT INTO `yatu_images` (`id`, `name`, `path`, `height`, `width`, `status`) VALUES 
  (1,'1-左1-1','images/gall_1.jpg',0,0,0),
  (2,'1-左1-2','images/gall_1.jpg',0,0,0),
  (3,'1-左1-3','images/gall_1.jpg',0,0,0),
  (4,'1-右上-1','images/gall_1.jpg',0,0,0),
  (5,'1-右上-2','images/gall_1.jpg',0,0,0),
  (6,'1-右上-3','images/gall_1.jpg',0,0,0),
  (7,'1-右下-1','images/gall_1.jpg',0,0,0),
  (8,'1-右下-2','images/gall_1.jpg',0,0,0),
  (9,'1-右下-3','images/gall_1.jpg',0,0,0),
  (10,'2-左上-1','images/gall_1.jpg',0,0,0),
  (11,'2-左上-2','images/gall_1.jpg',0,0,0),
  (12,'2-左上-3','images/gall_1.jpg',0,0,0),
  (13,'2-左下-1','images/gall_1.jpg',0,0,0),
  (14,'2-左下-2','images/gall_1.jpg',0,0,0),
  (15,'2-左下-3','images/gall_1.jpg',0,0,0),
  (16,'2-右-1','images/gall_1.jpg',0,0,0),
  (17,'2-右-2','images/gall_1.jpg',0,0,0),
  (18,'2-右-3','images/gall_1.jpg',0,0,0);
COMMIT;

#
# Data for the `yatu_location` table  (LIMIT 0,500)
#

INSERT INTO `yatu_location` (`id`, `name`, `status`, `imageidlist`) VALUES 
  (1,'firstline_left',0,'1,2,3'),
  (2,'firstline_right_top',0,'4,5,6'),
  (3,'firstline_right_bottom',0,'7,8,9'),
  (4,'secondline_left_top',0,'10,11,12'),
  (5,'secondline_left_bottom',0,'13,14,15'),
  (6,'secondline_right',0,'16,17,18');
COMMIT;

#
# Data for the `yatu_menu` table  (LIMIT 0,500)
#

INSERT INTO `yatu_menu` (`id`, `ename`, `cname`, `location`, `href`) VALUES 
  (1,'Home','首页',1,'/'),
  (2,'AboutUS','关于我们',2,'/about'),
  (3,'Gallery','相簿',3,'/'),
  (4,'Portfolio','作品集',4,'/'),
  (5,'ContactUS','联系我们',5,'#footer');
COMMIT;

#
# Data for the `yatu_text` table  (LIMIT 0,500)
#

INSERT INTO `yatu_text` (`id`, `code`, `content`, `description`) VALUES 
  (1,1,'我们是面向国内一流的后期交流团队，以帮助个人或企业赢得品牌宣传，为其提供简单、直接、系统的营销广告服务。','首页中部文字内容'),
  (2,2,'2013年改编成都大学生兰巧“口吃哥”励志故事，拍摄微电影《阳光下的声命\r\n\r\n2014年四川天宇盛劳务公司宣传片拍摄制作\r\n\r\n2014年高新区和平小学形象宣传片制作\r\n\r\n2014-2015年感动武侯十大人物微电影短片拍摄\r\n\r\n2015璀璨人生最炫T台秀人物专题拍摄\r\n\r\n2015锦江区宣传部“三严三实”公益短片拍摄\r\n\r\n2015武侯区总工会暑期公益托管拍摄\r\n\r\n“2015成都榜样”20部系列人物微记录片拍摄制作\r\n\r\n第四届四川省道德模范成都好人四部微电影监制拍摄制作\r\n\r\n1受成都宣传部文明办委托拍摄《我们的节日》2015中秋特别节目《约定》\r\n\r\n1拍摄2015五一劳动节特别节目《十一双手》，此公益短片荣获省市和中央文明公益短片大赛大奖\r\n\r\n12015安七炫“铜雀台”之夜专题片拍摄','首页中下方文字内容');
COMMIT;

#
# Data for the `yatu_videos` table  (LIMIT 0,500)
#

INSERT INTO `yatu_videos` (`id`, `name`, `path`, `type`) VALUES 
  (1,'Shining all the time 亚图文化婚礼定制','http://player.youku.com/player.php/sid/XMTQ5NTQ2MjY2OA==/v.swf','婚礼');
COMMIT;



/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
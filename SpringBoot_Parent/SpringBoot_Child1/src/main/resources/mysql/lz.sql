/*
SQLyog Ultimate v9.20 
MySQL - 5.7.23 : Database - lz
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`lz` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `lz`;

/*Table structure for table `t_excep_log` */

DROP TABLE IF EXISTS `t_excep_log`;

CREATE TABLE `t_excep_log` (
  `id` char(32) NOT NULL,
  `name` char(100) DEFAULT NULL,
  `exception_desc` char(100) DEFAULT NULL,
  `exception_business` char(100) DEFAULT NULL,
  `exception_info` varchar(5000) DEFAULT NULL,
  `create_time` char(32) DEFAULT NULL,
  `exception_target` char(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_excep_log` */

insert  into `t_excep_log`(`id`,`name`,`exception_desc`,`exception_business`,`exception_info`,`create_time`,`exception_target`) values ('20160615174936314hn22F9y9','admin','添加用户信息失败','用户管理','org.springframework.dao.DuplicateKeyException: \r\n### Error updating database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException: Duplicate entry \'123\' for key \'NewIndex1\'\r\n### The error may involve lz.dao.UserMapper.insertSelective-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO t_user  (id, name, pwd, create_time, phone, email, status) VALUES (?, ?, ?, ?, ?, ?, ?)\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException: Duplicate entry \'123\' for key \'NewIndex1\'\n; SQL []; Duplicate entry \'123\' for key \'NewIndex1\'; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException: Duplicate entry \'123\' for key \'NewIndex1\'','2016-06-15 17:49:36','/userController/add'),('20160615180408660r6894023','admin','修改用户信息失败','用户管理','java.lang.IndexOutOfBoundsException: Index: 0, Size: 0','2016-06-15 18:04:08','/userController/edit');

/*Table structure for table `t_message` */

DROP TABLE IF EXISTS `t_message`;

CREATE TABLE `t_message` (
  `id` char(32) NOT NULL,
  `message_type` char(2) DEFAULT NULL COMMENT '1-系统通知消息，2-提醒用户消息',
  `message_head` char(200) DEFAULT NULL,
  `message_content` varchar(4000) DEFAULT NULL,
  `message_status` char(2) DEFAULT NULL COMMENT '1-已经保存，2-已发布，3-已销毁',
  `created_user` char(32) DEFAULT NULL,
  `create_time` char(32) DEFAULT NULL,
  `receiver` char(32) DEFAULT NULL COMMENT '存放接受消息的人，如果为null表示发送给所有人',
  `publish_time` char(32) DEFAULT NULL,
  `destory_time` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_message` */

insert  into `t_message`(`id`,`message_type`,`message_head`,`message_content`,`message_status`,`created_user`,`create_time`,`receiver`,`publish_time`,`destory_time`) values ('20160725182401194Fc7Z633S','1','好消息','周四晚上聚会，','2','admin','2016-07-25 18:24:01',NULL,'2016-07-25 18:26:46',NULL),('20160725182413400oq0ox84o','1','坏消息','老虎吃人了','2','admin','2016-07-25 18:24:13',NULL,'2016-07-25 18:26:43',NULL),('201607251824322934vjy518X','2','修改密码成功','恭喜您的密码在2016-07-25 18:24:32时间修改成功','2',NULL,'2016-07-25 18:24:32','admin','2016-07-25 18:24:32',NULL),('20190827133707105F3V21797','1','哈哈','测试消息','3','admin','2019-08-27 13:37:07',NULL,'2019-08-27 13:37:13','2019-08-27 13:42:05');

/*Table structure for table `t_message_user` */

DROP TABLE IF EXISTS `t_message_user`;

CREATE TABLE `t_message_user` (
  `id` char(32) NOT NULL,
  `user_id` char(32) DEFAULT NULL,
  `message_id` char(32) DEFAULT NULL,
  `message_type` char(2) DEFAULT NULL COMMENT '0,未读，1，已读',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_message_user` */

insert  into `t_message_user`(`id`,`user_id`,`message_id`,`message_type`) values ('201607251824324020wu050i7','20160517152713539860D8N4Z','201607251824322934vjy518X','1'),('20160725182643324Ff4t0c7a','20160517152713539860D8N4Z','20160725182413400oq0ox84o','1'),('2016072518264334229x6607E','20160623170019926sN7871m2','20160725182413400oq0ox84o','0'),('20160725182646676368131o4','20160517152713539860D8N4Z','20160725182401194Fc7Z633S','1'),('20160725182646707r7G12Yi4','20160623170019926sN7871m2','20160725182401194Fc7Z633S','1'),('2019082713381379619r5GI89','20160531180432208kGNSji1q','20190827133707105F3V21797','1'),('201908271338192533K1647P4','20160531180432208kGNSji1q','20160725182413400oq0ox84o','1'),('20190827133823004X9UJYQiO','20160531180432208kGNSji1q','20160725182401194Fc7Z633S','1');

/*Table structure for table `t_oper_log` */

DROP TABLE IF EXISTS `t_oper_log`;

CREATE TABLE `t_oper_log` (
  `id` char(32) NOT NULL,
  `name` char(100) DEFAULT NULL,
  `log_business` char(100) DEFAULT NULL,
  `log_desc` char(100) DEFAULT NULL,
  `create_time` char(32) DEFAULT NULL,
  `oper_ip` char(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_oper_log` */

insert  into `t_oper_log`(`id`,`name`,`log_business`,`log_desc`,`create_time`,`oper_ip`) values ('20160623165755597x4Ac3Pc7','admin','操作日志','批量删除系统操作日志信息','2016-06-23 16:57:55','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('2016062316592468885b9Wl4K','admin','登录','退出系统','2016-06-23 16:59:24','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('201606231700097233Ocq340W','zhangsan','注册','注册成功','2016-06-23 17:00:09','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('2016062317002003296N6gas3','maqi','注册','注册成功','2016-06-23 17:00:20','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('201606231700310490G61c19P','maqi','登录','登录成功','2016-06-23 17:00:31','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('20160623170036464B6q7J5LK','maqi','登录','登录成功','2016-06-23 17:00:36','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('201606231701136234As4P30T','maqi','登录','退出系统','2016-06-23 17:01:13','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('20160623170119304d6GPX269','admin','登录','登录成功','2016-06-23 17:01:19','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('201606231705114620vOvWmP8','admin','登录','退出系统','2016-06-23 17:05:11','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('201606231705298880zk9ZR0n','maqi','登录','登录成功','2016-06-23 17:05:29','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('20160624102245035WhMgNK9L','admin','登录','登录成功','2016-06-24 10:22:45','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('201606301553059277O230R4r','admin','登录','登录成功','2016-06-30 15:53:05','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('20160630155359128Xy15A1H2','admin','参数管理','修改系统参数信息','2016-06-30 15:53:59','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('20160630155624696Vv565524','admin','登录','登录成功','2016-06-30 15:56:24','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('20160719115435280B580Wh83','admin','登录','登录成功','2016-07-19 11:54:35','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('20160719115440240Vp57ojl5','admin','登录','登录成功','2016-07-19 11:54:40','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('201607211641315146h0532S9','admin','登录','登录成功','2016-07-21 16:41:31','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('20160721164136527t7w3G62B','admin','登录','登录成功','2016-07-21 16:41:36','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('20160721164221175Kx4Fp648','admin','资源管理','保存资源信息','2016-07-21 16:42:21','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('20160721164233696Hue701dw','admin','角色管理','角色授权','2016-07-21 16:42:33','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('201607211653028344U54Gt8F','admin','登录','登录成功','2016-07-21 16:53:02','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('20160721175324345hQsv1h7z','admin','登录','登录成功','2016-07-21 17:53:24','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('20160721181444283E2M2p457','admin','登录','登录成功','2016-07-21 18:14:44','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('2016072118255642222d3k66l','admin','登录','登录成功','2016-07-21 18:25:56','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('201607211833318647uc51X5L','admin','登录','登录成功','2016-07-21 18:33:31','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('201607211850338684n5jZ48M','admin','登录','登录成功','2016-07-21 18:50:33','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('20160722103644637r4j3ZFZ0','admin','登录','登录成功','2016-07-22 10:36:44','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('201607221439447221l9a5665','admin','登录','登录成功','2016-07-22 14:39:44','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('2016072215401094830gI5504','admin','登录','登录成功','2016-07-22 15:40:10','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('2016072215411706205JV81N5','admin','资源管理','保存资源信息','2016-07-22 15:41:17','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('20160722154202392a6JR624t','admin','资源管理','修改资源信息','2016-07-22 15:42:02','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('20160722154222433fJ2100eN','admin','角色管理','角色授权','2016-07-22 15:42:22','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('2016072215542185666371344','admin','登录','登录成功','2016-07-22 15:54:21','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('201607221559371157QR27J82','admin','参数管理','添加系统参数信息','2016-07-22 15:59:37','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('20160722163900132dR156P1U','admin','登录','登录成功','2016-07-22 16:39:00','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('201607221647480539387jiP9','admin','参数管理','删除系统参数信息','2016-07-22 16:47:48','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('201607221647536499RaHFw70','admin','参数管理','添加系统参数信息','2016-07-22 16:47:53','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('20160722165858414D9SaK6J5','admin','参数管理','发布消息','2016-07-22 16:58:58','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('20160722165920685H77daIG3','admin','参数管理','发布消息','2016-07-22 16:59:20','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('20160722170119951ue787c83','admin','参数管理','发布消息','2016-07-22 17:01:19','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('2016072217030928355UG0XQ3','admin','登录','登录成功','2016-07-22 17:03:09','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('20160722170637968M90B79Jq','admin','参数管理','发布消息','2016-07-22 17:06:37','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('2016072217064318793c11D52','admin','参数管理','发布消息','2016-07-22 17:06:43','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('20160722171449382zW2T4268','admin','参数管理','添加系统参数信息','2016-07-22 17:14:49','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('20160722172726570i3383T1v','admin','登录','登录成功','2016-07-22 17:27:26','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('2016072217294464381v79eeM','admin','参数管理','发布消息','2016-07-22 17:29:44','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('2016072217295439513NE0U91','admin','参数管理','发布消息','2016-07-22 17:29:54','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('2016072217302321275e99R4z','admin','参数管理','销毁消息','2016-07-22 17:30:23','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('20160722173031189AJGP5CH8','admin','参数管理','发布消息','2016-07-22 17:30:31','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('20160722173045144QMIR80M5','admin','参数管理','添加系统参数信息','2016-07-22 17:30:45','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('2016072217341305050C0J32I','admin','参数管理','发布消息','2016-07-22 17:34:13','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('20160722173435415rzfl2495','admin','参数管理','删除系统参数信息','2016-07-22 17:34:35','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('201607221734389765d0pxmjU','admin','参数管理','销毁消息','2016-07-22 17:34:38','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('20160722173442004A9r11840','admin','参数管理','删除系统参数信息','2016-07-22 17:34:42','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('20160722173444612y21nI077','admin','参数管理','销毁消息','2016-07-22 17:34:44','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('2016072217344546249XH3X1s','admin','参数管理','销毁消息','2016-07-22 17:34:45','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('201607221734478652p6228vu','admin','参数管理','删除系统参数信息','2016-07-22 17:34:47','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('20160722173954790V5tN61N8','admin','参数管理','添加系统参数信息','2016-07-22 17:39:54','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('20160722174001217Do119h3j','admin','参数管理','修改系统参数信息','2016-07-22 17:40:01','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('201607221740057659L4x49wq','admin','参数管理','修改系统参数信息','2016-07-22 17:40:05','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('20160722182118084YQdzD717','admin','登录','登录成功','2016-07-22 18:21:18','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('201607221821275737g664u8r','admin','参数管理','发布消息','2016-07-22 18:21:27','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('20160722182559903c2vkijE5','admin','参数管理','销毁消息','2016-07-22 18:25:59','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('2016072218260859902hDe23B','admin','参数管理','删除系统参数信息','2016-07-22 18:26:08','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('201607221828268776BD47r80','admin','登录','登录成功','2016-07-22 18:28:26','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('20160722183007367Q7O00803','admin','登录','登录成功','2016-07-22 18:30:07','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('20160722183053028Lbh8Feh3','admin','参数管理','添加系统参数信息','2016-07-22 18:30:53','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('201607221830595451940wfW1','admin','参数管理','删除系统参数信息','2016-07-22 18:30:59','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('20160722183100417dwka8Mp6','admin','参数管理','删除系统参数信息','2016-07-22 18:31:00','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('20160722183123019Vi5dS6T0','admin','参数管理','添加系统参数信息','2016-07-22 18:31:23','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('20160722183135529EbeC95b6','admin','参数管理','发布消息','2016-07-22 18:31:35','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('2016072218331505081q69l5T','admin','参数管理','销毁消息','2016-07-22 18:33:15','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('20160722183319174OW21R6fi','admin','参数管理','删除系统参数信息','2016-07-22 18:33:19','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('201607221834162551A6dsH84','laosan','登录','登录成功','2016-07-22 18:34:16','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('20160722183433938Bb5H6NVZ','admin','参数管理','添加系统参数信息','2016-07-22 18:34:33','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('2016072218343802807D52M8d','admin','参数管理','发布消息','2016-07-22 18:34:38','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('2016072218365109760Y17Scg','admin','登录','登录成功','2016-07-22 18:36:51','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('20160722185032742Js8WYvXP','admin','参数管理','添加系统参数信息','2016-07-22 18:50:32','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('2016072218503877589g3134I','admin','参数管理','发布消息','2016-07-22 18:50:38','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('2016072218515593531RT8F25','admin','参数管理','添加系统参数信息','2016-07-22 18:51:55','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('20160722185200004drk0SgTn','admin','参数管理','发布消息','2016-07-22 18:52:00','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('201607221853255997kdwW545','admin','参数管理','添加系统参数信息','2016-07-22 18:53:25','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('20160722185329522ht4YO9nJ','admin','参数管理','发布消息','2016-07-22 18:53:29','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('20160722185357443743nj1ro','admin','参数管理','添加系统参数信息','2016-07-22 18:53:57','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('20160722185401019Jg4l39IL','admin','参数管理','发布消息','2016-07-22 18:54:01','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('20160722185752376529riX2j','admin','参数管理','添加系统参数信息','2016-07-22 18:57:52','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('2016072218580432412G725ss','admin','参数管理','发布消息','2016-07-22 18:58:04','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('2016072219015397846f9Ll9R','admin','参数管理','添加系统参数信息','2016-07-22 19:01:53','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('2016072219015985476i5a20k','admin','参数管理','发布消息','2016-07-22 19:01:59','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('20160722190316330go9b304Q','laosan','登录','登录成功','2016-07-22 19:03:16','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('2016072219032773121k52A44','admin','参数管理','添加系统参数信息','2016-07-22 19:03:27','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('20160722190331573lS3u9O47','admin','参数管理','发布消息','2016-07-22 19:03:31','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('20160722190503921492h5c90','admin','参数管理','添加系统参数信息','2016-07-22 19:05:03','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('20160722190528029374876R4','admin','参数管理','销毁消息','2016-07-22 19:05:28','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('20160725142304806k4199kr0','admin','登录','登录成功','2016-07-25 14:23:04','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('20160725142313125V83A0iFb','admin','参数管理','删除系统参数信息','2016-07-25 14:23:13','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('2016072514231662454Mc5B5R','admin','参数管理','删除系统参数信息','2016-07-25 14:23:16','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('20160725142317608KH706ox8','admin','参数管理','删除系统参数信息','2016-07-25 14:23:17','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('2016072514232324766SD0491','admin','参数管理','销毁消息','2016-07-25 14:23:23','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('2016072514232408775G1Rw3V','admin','参数管理','销毁消息','2016-07-25 14:23:24','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('20160725142327985p1P52TDw','admin','参数管理','删除系统参数信息','2016-07-25 14:23:27','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('201607251423290898h003w83','admin','参数管理','删除系统参数信息','2016-07-25 14:23:29','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('20160725142332100scXF0096','admin','参数管理','销毁消息','2016-07-25 14:23:32','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('20160725142333098Td4e0S9D','admin','参数管理','销毁消息','2016-07-25 14:23:33','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('20160725142336580shy44Gk8','admin','参数管理','删除系统参数信息','2016-07-25 14:23:36','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('20160725142339767L0o4H499','admin','参数管理','销毁消息','2016-07-25 14:23:39','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('20160725142342692DS93G92W','admin','参数管理','删除系统参数信息','2016-07-25 14:23:42','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('2016072514234568700X6N1b6','admin','参数管理','销毁消息','2016-07-25 14:23:45','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('20160725142348885Dhw5w18E','admin','参数管理','删除系统参数信息','2016-07-25 14:23:48','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('201607251423515129pSe94X4','admin','参数管理','销毁消息','2016-07-25 14:23:51','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('20160725142354163L1ig0u95','admin','参数管理','删除系统参数信息','2016-07-25 14:23:54','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('201607251423570848N3Ny7u1','admin','参数管理','销毁消息','2016-07-25 14:23:57','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('20160725142400445948FObjq','admin','参数管理','删除系统参数信息','2016-07-25 14:24:00','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('201607251424032190d9Q8862','admin','参数管理','销毁消息','2016-07-25 14:24:03','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('201607251424065046rTR202l','admin','参数管理','删除系统参数信息','2016-07-25 14:24:06','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('20160725143631842z2825t7Y','admin','参数管理','添加系统参数信息','2016-07-25 14:36:31','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('20160725144328417rarYs909','admin','参数管理','发布消息','2016-07-25 14:43:28','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('20160725144419439uW4O48k8','admin','参数管理','添加系统参数信息','2016-07-25 14:44:19','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('201607251444421264N175D51','admin','参数管理','添加系统参数信息','2016-07-25 14:44:42','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('20160725145104995S5nV94EU','admin','参数管理','添加系统参数信息','2016-07-25 14:51:04','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('20160725145351073479NnO6W','admin','参数管理','发布消息','2016-07-25 14:53:51','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('20160725145357807bs6E5G0I','admin','参数管理','发布消息','2016-07-25 14:53:57','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('20160725145408302TT7i2698','admin','参数管理','发布消息','2016-07-25 14:54:08','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('20160725145529159H7446v11','admin','参数管理','销毁消息','2016-07-25 14:55:29','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('201607251456443894CAGCZ1L','admin','资源管理','保存资源信息','2016-07-25 14:56:44','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('201607251456587567W4hAc21','admin','资源管理','修改资源信息','2016-07-25 14:56:58','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('20160725145711933Y768A381','admin','角色管理','角色授权','2016-07-25 14:57:11','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('201607251531275999l5KB570','admin','登录','登录成功','2016-07-25 15:31:27','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('2016072515512666199101Z2u','admin','登录','登录成功','2016-07-25 15:51:26','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('201607251607186146UE3N845','admin','登录','登录成功','2016-07-25 16:07:18','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('20160725163144060s2Uckoc1','admin','个人中心','修改密码成功','2016-07-25 16:31:44','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('20160725163259962hgUuA681','admin','个人中心','修改密码成功','2016-07-25 16:32:59','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('20160725164610701n0GRq7N3','admin','个人中心','修改密码成功','2016-07-25 16:46:10','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('20160725165156421F9155z9f','admin','个人中心','修改密码成功','2016-07-25 16:51:56','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('2016072516534674202H0S62z','admin','个人中心','修改密码成功','2016-07-25 16:53:46','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('201607251823469204KNR7Y6B','admin','登录','登录成功','2016-07-25 18:23:46','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('20160725182401240N697fq9Y','admin','消息管理','添加系统通知消息','2016-07-25 18:24:01','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('20160725182413447GEZMDim8','admin','消息管理','添加系统通知消息','2016-07-25 18:24:13','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('2016072518243241800Z67TR3','admin','个人中心','修改密码成功','2016-07-25 18:24:32','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('2016072518250277100u1616O','maqi','登录','登录成功','2016-07-25 18:25:02','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('20160725182513473zXU9V6O9','admin','角色管理','角色授权','2016-07-25 18:25:13','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('20160725182643367695xPcip','admin','消息管理','发布系统通知消息','2016-07-25 18:26:43','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('20160725182646741hd83gC50','admin','消息管理','发布系统通知消息','2016-07-25 18:26:46','客户端ip：0:0:0:0:0:0:0:1---服务端ip：0:0:0:0:0:0:0:1'),('201908271334448116o5JA116','admin','登录','登录成功','2019-08-27 13:34:44','客户端ip：127.0.0.1---服务端ip：127.0.0.1'),('20190827133454021Ph49p939','admin','登录','登录成功','2019-08-27 13:34:54','客户端ip：127.0.0.1---服务端ip：127.0.0.1'),('2019082713345903467QQ7K5R','admin','登录','登录成功','2019-08-27 13:34:59','客户端ip：127.0.0.1---服务端ip：127.0.0.1'),('20190827133502933Yqj613o7','admin','登录','登录成功','2019-08-27 13:35:02','客户端ip：127.0.0.1---服务端ip：127.0.0.1'),('20190827133503738ghq8XG3B','admin','登录','登录成功','2019-08-27 13:35:03','客户端ip：127.0.0.1---服务端ip：127.0.0.1'),('20190827133503955GIE91k1H','admin','登录','登录成功','2019-08-27 13:35:03','客户端ip：127.0.0.1---服务端ip：127.0.0.1'),('20190827133504148U4VptHnh','admin','登录','登录成功','2019-08-27 13:35:04','客户端ip：127.0.0.1---服务端ip：127.0.0.1'),('20190827133532067Ga640115','admin','登录','登录成功','2019-08-27 13:35:32','客户端ip：127.0.0.1---服务端ip：127.0.0.1'),('20190827133707143qZr9l89g','admin','消息管理','添加系统通知消息','2019-08-27 13:37:07','客户端ip：127.0.0.1---服务端ip：127.0.0.1'),('20190827133714039H9172DbF','admin','消息管理','发布系统通知消息','2019-08-27 13:37:14','客户端ip：127.0.0.1---服务端ip：127.0.0.1'),('20190827133722676429jO5p4','admin','登录','退出系统','2019-08-27 13:37:22','客户端ip：127.0.0.1---服务端ip：127.0.0.1'),('20190827133755463XH2Q7A69','zhangsan','登录','登录成功','2019-08-27 13:37:55','客户端ip：127.0.0.1---服务端ip：127.0.0.1'),('20190827133854547a57i7443','zhangsan','个人中心','修改信息成功','2019-08-27 13:38:54','客户端ip：127.0.0.1---服务端ip：127.0.0.1'),('201908271338562062rJ62Qh3','zhangsan','个人中心','修改信息成功','2019-08-27 13:38:56','客户端ip：127.0.0.1---服务端ip：127.0.0.1'),('201908271339151975y68778F','zhangsan','登录','退出系统','2019-08-27 13:39:15','客户端ip：127.0.0.1---服务端ip：127.0.0.1'),('20190827133918017j79rY2d2','admin','登录','登录成功','2019-08-27 13:39:18','客户端ip：127.0.0.1---服务端ip：127.0.0.1'),('20190827134205230C92c8ZS1','admin','消息管理','销毁系统通知消息','2019-08-27 13:42:05','客户端ip：127.0.0.1---服务端ip：127.0.0.1'),('201908271342132677M928I5y','admin','登录','退出系统','2019-08-27 13:42:13','客户端ip：127.0.0.1---服务端ip：127.0.0.1'),('20190827134216384HNAKhUk4','zhangsan','登录','登录成功','2019-08-27 13:42:16','客户端ip：127.0.0.1---服务端ip：127.0.0.1'),('2019082713424020185L4505R','zhangsan','登录','退出系统','2019-08-27 13:42:40','客户端ip：127.0.0.1---服务端ip：127.0.0.1'),('201908271342431867c133809','admin','登录','登录成功','2019-08-27 13:42:43','客户端ip：127.0.0.1---服务端ip：127.0.0.1'),('20190827134247000NI997r38','admin','登录','退出系统','2019-08-27 13:42:47','客户端ip：127.0.0.1---服务端ip：127.0.0.1'),('20190827135011103yc5cxdKS','admin','找回密码','找回密码成功','2019-08-27 13:50:11','客户端ip：127.0.0.1---服务端ip：127.0.0.1'),('20190827135022874XD9bKz37','admin','登录','登录成功','2019-08-27 13:50:22','客户端ip：127.0.0.1---服务端ip：127.0.0.1'),('20190827135447814993MnR6X','admin','登录','登录成功','2019-08-27 13:54:47','客户端ip：127.0.0.1---服务端ip：127.0.0.1'),('20190827141343984J4a92752','admin','登录','登录成功','2019-08-27 14:13:43','客户端ip：127.0.0.1---服务端ip：127.0.0.1'),('201908271418071207RT0Q43n','admin','登录','退出系统','2019-08-27 14:18:07','客户端ip：127.0.0.1---服务端ip：127.0.0.1'),('20190827141816892OAp977r1','admin','登录','登录成功','2019-08-27 14:18:16','客户端ip：127.0.0.1---服务端ip：127.0.0.1'),('201908271421081714n9ALSUA','admin','登录','登录成功','2019-08-27 14:21:08','客户端ip：127.0.0.1---服务端ip：127.0.0.1'),('20190827142145783pgO63g67','admin','资源管理','修改资源信息','2019-08-27 14:21:45','客户端ip：127.0.0.1---服务端ip：127.0.0.1');

/*Table structure for table `t_param` */

DROP TABLE IF EXISTS `t_param`;

CREATE TABLE `t_param` (
  `id` char(32) NOT NULL,
  `param_key` char(32) NOT NULL,
  `param_value` char(255) NOT NULL,
  `create_time` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `param_key` (`param_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_param` */

insert  into `t_param`(`id`,`param_key`,`param_value`,`create_time`) values ('2016051715260530456RZMv2l','noFilterUrl','/index.jsp;/loginController;/druid','2016-05-17 15:26:04'),('20160531172450285Bmu2G0vY','defaultRole','REGISTER_ROLE','2016-05-31 17:24:50');

/*Table structure for table `t_resource` */

DROP TABLE IF EXISTS `t_resource`;

CREATE TABLE `t_resource` (
  `id` char(32) NOT NULL,
  `resource_name` char(255) DEFAULT NULL,
  `resource_url` char(255) DEFAULT NULL,
  `pid` char(32) DEFAULT '0',
  `remark` char(255) DEFAULT NULL,
  `icons` char(255) DEFAULT NULL,
  `create_time` char(32) DEFAULT NULL,
  `update_time` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_resource` */

insert  into `t_resource`(`id`,`resource_name`,`resource_url`,`pid`,`remark`,`icons`,`create_time`,`update_time`) values ('20160517153008071G3u6M20O','权限管理','#','0','权限管理一级菜单','glyphicon glyphicon-plus','2016-05-17 15:30:08',NULL),('201605171530191709c8g2O59','系统管理','#','0','系统管理一级菜单','glyphicon glyphicon-plus','2016-05-17 15:30:19','2016-05-18 17:52:57'),('201605171530469947J7iP1TV','资源管理','/resourceController/resourceIndex','20160517153008071G3u6M20O','资源管理二级菜单','glyphicon glyphicon-share-alt','2016-05-17 15:30:46',NULL),('20160517153056336902Xr15B','用户管理','/userController/userIndex','20160517153008071G3u6M20O','用户管理系统二级菜单','glyphicon glyphicon-user','2016-05-17 15:30:56',NULL),('2016051715310481119qnJQ4L','角色管理','/roleController/roleIndex','20160517153008071G3u6M20O','角色管理二级菜单','glyphicon glyphicon-th','2016-05-17 15:31:04',NULL),('201605171531138142nQ01TcV','系统参数','/paramController/paramIndex','201605171530191709c8g2O59','系统参数二级菜单','glyphicon glyphicon-user','2016-05-17 15:31:13','2016-05-17 22:22:57'),('20160517153132190Y3P10v5z','操作日志','/operLogController/operLogIndex','201605171530191709c8g2O59','操作日志','glyphicon glyphicon-th-large','2016-05-17 15:31:32','2016-06-02 13:35:52'),('201605311806487706rIBB65x','个人中心','#','0','个人中心一级菜单','glyphicon glyphicon-user','2016-05-31 18:06:48','2016-05-31 18:07:28'),('2016053118081576383uA4y9J','修改密码','/personInfoController/setPasswordPage','201605311806487706rIBB65x','修改登录密码','glyphicon glyphicon-th-large','2016-05-31 18:08:15','2016-06-15 16:03:29'),('20160531180844264V4M1W57V','个人信息','/personInfoController/setPersonInfoPage','201605311806487706rIBB65x','修改个人信息','glyphicon glyphicon-th-large','2016-05-31 18:08:44','2016-06-15 16:03:19'),('201605311809562776Wj5j141','操作日志','/operLogController/personOperLogIndex','201605311806487706rIBB65x','个人操作日志','glyphicon glyphicon-th-large','2016-05-31 18:09:56','2016-06-15 15:44:17'),('20160602154939829e24ONu26','异常日志','/excepLogController/excepLogIndex','201605171530191709c8g2O59','异常日志','glyphicon glyphicon-th-large','2016-06-02 15:49:39','2016-06-02 17:13:43'),('20160721164221132IRmDsuG4','websocket','/bootstrapController/webSocket','201605311806487706rIBB65x','','','2016-07-21 16:42:21',NULL),('2016072215411702821NK33ei','消息管理','/messageController/messageIndex','201605171530191709c8g2O59','消息管理二级功能','glyphicon glyphicon-th-large','2016-07-22 15:41:17','2016-07-22 15:42:02'),('2016072514564434102b606lM','个人消息','/messageController/personMessageIndex','20160517153008071G3u6M20O','个人消息','glyphicon glyphicon-th-large','2016-07-25 14:56:44','2019-08-27 14:21:45');

/*Table structure for table `t_role` */

DROP TABLE IF EXISTS `t_role`;

CREATE TABLE `t_role` (
  `id` char(32) NOT NULL,
  `role_name` char(255) DEFAULT NULL,
  `remark` char(255) DEFAULT NULL,
  `create_time` char(32) DEFAULT NULL,
  `update_time` char(32) DEFAULT NULL,
  `role_type` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_role` */

insert  into `t_role`(`id`,`role_name`,`remark`,`create_time`,`update_time`,`role_type`) values ('20160517152849015M282DK9p','超级管理员','管理所用的功能模块','2016-05-17 15:28:49','2016-06-01 10:37:35','ADMIN_ROLE'),('20160517152900966VkWF63rF','普通管理员','管理自己所拥有的功能模块','2016-05-17 15:29:00','2016-06-01 10:38:44','MANAGER_ROLE'),('20160517152919681dEW94785','普通用户','主要是普通注册用户所能处理的功能','2016-05-17 15:29:19','2016-06-01 10:37:53','REGISTER_ROLE'),('20160517180042536C4932M6g','会员用户','能处理额外的会员功能','2016-05-17 15:29:12','2016-06-01 10:38:29','MEMBER_ROLE');

/*Table structure for table `t_role_resource` */

DROP TABLE IF EXISTS `t_role_resource`;

CREATE TABLE `t_role_resource` (
  `id` char(32) NOT NULL,
  `resource_id` char(32) DEFAULT NULL,
  `role_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_role_resource` */

insert  into `t_role_resource`(`id`,`resource_id`,`role_id`) values ('2016051718005790172vLScG7','20160517153008071G3u6M20O','20160517180042536C4932M6g'),('201605171800579023OnZu7u9','201605171530469947J7iP1TV','20160517180042536C4932M6g'),('20160517180057903D65149ZZ','20160517153056336902Xr15B','20160517180042536C4932M6g'),('2016051718005790409QwcAp7','201605171530191709c8g2O59','20160517180042536C4932M6g'),('20160517180057904p29F7S82','2016051715310481119qnJQ4L','20160517180042536C4932M6g'),('20160517180057905VddC3Kvx','20160517153132190Y3P10v5z','20160517180042536C4932M6g'),('20160517211029405xfC4DnR0','20160517153008071G3u6M20O','20160517152900966VkWF63rF'),('201605172110294537z88ll1I','201605171530469947J7iP1TV','20160517152900966VkWF63rF'),('20160517211029457644MVH0o','20160517153056336902Xr15B','20160517152900966VkWF63rF'),('201605172110294577OpP8g6x','2016051715310481119qnJQ4L','20160517152900966VkWF63rF'),('2016051721102946143A492fK','201605171530191709c8g2O59','20160517152900966VkWF63rF'),('20160517211029461Sue4F2C8','201605171531138142nQ01TcV','20160517152900966VkWF63rF'),('20160517211029465ml2s8291','20160517153132190Y3P10v5z','20160517152900966VkWF63rF'),('20160517211029465ZrQL3MH2','201605171531236116170u9zH','20160517152900966VkWF63rF'),('20160725145711877MgG8l1M0','20160517153008071G3u6M20O','20160517152849015M282DK9p'),('20160725145711878XsohE3Y5','201605171530469947J7iP1TV','20160517152849015M282DK9p'),('201607251457118796uhB6SG9','20160517153056336902Xr15B','20160517152849015M282DK9p'),('20160725145711880anGP4b22','201605171530191709c8g2O59','20160517152849015M282DK9p'),('20160725145711880k09812j1','2016051715310481119qnJQ4L','20160517152849015M282DK9p'),('20160725145711897EOux3669','201605171531138142nQ01TcV','20160517152849015M282DK9p'),('201607251457118998C5Dw399','20160517153132190Y3P10v5z','20160517152849015M282DK9p'),('201607251457119006uG3s81Z','20160602154939829e24ONu26','20160517152849015M282DK9p'),('201607251457119011ajO8977','201605311806487706rIBB65x','20160517152849015M282DK9p'),('2016072514571190135C254Eb','2016072215411702821NK33ei','20160517152849015M282DK9p'),('20160725145711902W2o7OG8e','2016053118081576383uA4y9J','20160517152849015M282DK9p'),('20160725145711903qUhP09z0','20160531180844264V4M1W57V','20160517152849015M282DK9p'),('201607251457119042c134416','2016072514564434102b606lM','20160517152849015M282DK9p'),('201607251457119044UQbPBqv','201605311809562776Wj5j141','20160517152849015M282DK9p'),('201607251825134101LOfG687','201605311806487706rIBB65x','20160517152919681dEW94785'),('201607251825134103M5693E6','2016072514564434102b606lM','20160517152919681dEW94785'),('20160725182513410aD296CD6','201605311809562776Wj5j141','20160517152919681dEW94785'),('20160725182513410pC0N09gd','2016053118081576383uA4y9J','20160517152919681dEW94785'),('20160725182513410xkL188uy','20160531180844264V4M1W57V','20160517152919681dEW94785');

/*Table structure for table `t_security` */

DROP TABLE IF EXISTS `t_security`;

CREATE TABLE `t_security` (
  `id` char(32) NOT NULL,
  `phone` char(11) DEFAULT NULL,
  `security_code` char(16) DEFAULT NULL,
  `type` char(100) DEFAULT NULL,
  `create_time` char(32) DEFAULT NULL,
  `email` char(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_security` */

insert  into `t_security`(`id`,`phone`,`security_code`,`type`,`create_time`,`email`) values ('20160601113633115HM6A9J4M','13333333333','943959','securityCodePhone','2016-06-01 14:49:54',NULL),('20160601150049105S90PvNlD','13333333331','130298','securityCodePhone','2016-06-01 15:14:40',NULL),('201606011502086768953eKD0','13333333332','345048','securityCodePhone','2016-06-01 15:02:08',NULL),('20160601150218608U9h56V6L','12311111111','219057','securityCodePhone','2016-06-01 15:03:26',NULL),('20160602125846892pp18Xpnn','12341111111','371997','securityCodePhone','2016-06-02 13:00:27',NULL),('201606231700024080P42033G','12345111111','148792','securityCodePhone','2016-06-23 17:00:02',NULL),('20190827134933038fio12KC6','13146214134','531946','securityCodePhone','2019-08-27 13:49:33',NULL);

/*Table structure for table `t_user` */

DROP TABLE IF EXISTS `t_user`;

CREATE TABLE `t_user` (
  `id` char(32) NOT NULL,
  `name` char(100) NOT NULL,
  `pwd` char(100) DEFAULT NULL,
  `create_time` char(32) DEFAULT NULL,
  `update_time` char(32) DEFAULT NULL,
  `phone` char(11) DEFAULT NULL,
  `email` char(100) DEFAULT NULL,
  `status` char(1) DEFAULT NULL COMMENT '0：停用，1：启用',
  PRIMARY KEY (`id`),
  UNIQUE KEY `NewIndex1` (`name`),
  KEY `NewIndex2` (`phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_user` */

insert  into `t_user`(`id`,`name`,`pwd`,`create_time`,`update_time`,`phone`,`email`,`status`) values ('0980933','赵三梅2','123234','1121','232231','138347451','32341@qq.com',NULL),('09882226','赵三梅1','12341','1111','2331','138347451','32341@qq.com','1'),('0988776','赵三梅','1234','111','233','13834745','3234@qq.com','1'),('20160517152713539860D8N4Z','admin','123456','2016-05-17 15:27:13','2016-06-15 17:48:39','13146214134','13146214134@163.com','1'),('20160531175938575n8M0xy1E','laosan','laosan','2016-05-31 17:59:38',NULL,'11111111111',NULL,'1'),('20160531180432208kGNSji1q','zhangsan','123456','2016-05-31 18:04:32','2019-08-27 13:38:56','12222222222','1765@qq.com','1'),('20160601124918893nD0zW2Es','1','123','2016-06-01 12:49:18',NULL,'13333333333',NULL,'1'),('201606011500539399Sao4r6s','12345','1234','2016-06-01 15:00:53','2016-06-15 18:16:04','13333333332','','1'),('20160601150340716160695L3','124','123','2016-06-01 15:03:40',NULL,'12311111111',NULL,'1'),('2016060212585293254780YW1','测试切面','1234','2016-06-02 12:58:52',NULL,'12341111111',NULL,'1'),('20160615175441338010b19H5','1234','123456','2016-06-15 17:54:41',NULL,'','','1'),('20160623170019926sN7871m2','maqi','123456','2016-06-23 17:00:19',NULL,'12345111111',NULL,'1');

/*Table structure for table `t_user_role` */

DROP TABLE IF EXISTS `t_user_role`;

CREATE TABLE `t_user_role` (
  `id` char(32) NOT NULL,
  `role_id` char(32) DEFAULT NULL,
  `user_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_user_role` */

insert  into `t_user_role`(`id`,`role_id`,`user_id`) values ('20160517215856292N5jwL64Z','20160517152849015M282DK9p','20160517152713539860D8N4Z'),('20160531175938597Fy4O7071','20160517152919681dEW94785','20160531175938575n8M0xy1E'),('20160531180432276nW05eosm','20160517152919681dEW94785','20160531180432208kGNSji1q'),('20160601124918901Sb74HX21','20160517152919681dEW94785','20160601124918893nD0zW2Es'),('20160601150340720SD83bZqZ','20160517152919681dEW94785','20160601150340716160695L3'),('2016060212585294114619Z45','20160517152919681dEW94785','2016060212585293254780YW1'),('20160615175441338uS49MI3b','20160517152849015M282DK9p','20160615175441338010b19H5'),('20160615181604407d1neTyO6','20160517152919681dEW94785','201606011500539399Sao4r6s'),('20160623170019938x8iMP1o3','20160517152919681dEW94785','20160623170019926sN7871m2');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

SET FOREIGN_KEY_CHECKS=0;

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'userID',
  `name` varchar(32) DEFAULT NULL COMMENT '姓名',
  `phone` char(11) DEFAULT NULL COMMENT '手机号码',
  `telephone` varchar(16) DEFAULT NULL COMMENT '住宅电话',
  `address` varchar(64) DEFAULT NULL COMMENT '联系地址',
  `enabled` tinyint(1) DEFAULT '1',
  `username` varchar(255) DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `userface` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
INSERT INTO `user` VALUES ('1', '系统管理员', '18568887789', '029-82881234', '深圳南山', '1', 'admin', '$2a$10$ySG2lkvjFHY5O0./CPIE1OI8VJsuKYEzOYzqIa7AJR6sEgSzUFOAm', 'http://bpic.588ku.com/element_pic/01/40/00/64573ce2edc0728.jpg', null);

DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `name_zh` varchar(64) DEFAULT NULL COMMENT '角色名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`),
  KEY `user_role_ibfk_1` (`user_id`),
  CONSTRAINT `user_role_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_role_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
INSERT INTO `user_role` VALUES ('1', '1', '6');

INSERT INTO `role` VALUES ('1', 'ROLE_manager', '部门经理');
INSERT INTO `role` VALUES ('2', 'ROLE_personnel', '人事专员');
INSERT INTO `role` VALUES ('3', 'ROLE_recruiter', '招聘主管');
INSERT INTO `role` VALUES ('4', 'ROLE_train', '培训主管');
INSERT INTO `role` VALUES ('5', 'ROLE_performance', '薪酬绩效主管');
INSERT INTO `role` VALUES ('6', 'ROLE_admin', '系统管理员');
INSERT INTO `role` VALUES ('13', 'ROLE_test2', '测试角色2');
INSERT INTO `role` VALUES ('14', 'ROLE_test1', '测试角色1');

DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(64) DEFAULT NULL,
  `path` varchar(64) DEFAULT NULL,
  `component` varchar(64) DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `icon_cls` varchar(64) DEFAULT NULL,
  `keep_alive` tinyint(1) DEFAULT NULL,
  `require_auth` tinyint(1) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `menu` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

INSERT INTO `menu` VALUES ('1', '/', '/home', 'Home', '员工资料', 'fa fa-user-circle-o', null, '1', null, '1');
INSERT INTO `menu` VALUES ('2', '/', '/home', 'Home', '人事管理', 'fa fa-address-card-o', null, '1', null, '1');
INSERT INTO `menu` VALUES ('3', '/', '/home', 'Home', '薪资管理', 'fa fa-money', null, '1', null, '1');
INSERT INTO `menu` VALUES ('4', '/', '/home', 'Home', '统计管理', 'fa fa-bar-chart', null, '1', null, '1');
INSERT INTO `menu` VALUES ('5', '/', '/home', 'Home', '系统管理', 'fa fa-windows', null, '1', null, '1');

INSERT INTO `menu` VALUES (7, '/system/log/**', '/sys/log', 'SysLog', '操作日志管理', null, null, '1', '5', '1');

DROP TABLE IF EXISTS `menu_role`;
CREATE TABLE `menu_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_id` (`menu_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `menu_role_ibfk_1` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`),
  CONSTRAINT `menu_role_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `menu_role`(`menu_id`,`role_id`) VALUES ('1', '6');
INSERT INTO `menu_role`(`menu_id`,`role_id`) VALUES ('2', '6');
INSERT INTO `menu_role`(`menu_id`,`role_id`) VALUES ('3', '6');
INSERT INTO `menu_role`(`menu_id`,`role_id`) VALUES ('4', '6');
INSERT INTO `menu_role`(`menu_id`,`role_id`) VALUES ('5', '6');

SET FOREIGN_KEY_CHECKS=1;

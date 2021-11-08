/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 80026
Source Host           : localhost:3306
Source Database       : run

Target Server Type    : MYSQL
Target Server Version : 80026
File Encoding         : 65001

Date: 2021-11-08 19:41:42
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `gender` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `age` int DEFAULT NULL,
  `province` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `phone` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `email` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'ADMIN', 'Female', '25', 'ON', '32493879', 'amy@gmail.com', 'admin', 'admin');
INSERT INTO `user` VALUES ('2', 'KIM', 'Female', '56', 'MB', '11213246', 'kim@gmail.com', null, null);
INSERT INTO `user` VALUES ('3', 'CICI', 'Female', '29', 'BC', '28747181', 'cici@gmail.com', null, null);
INSERT INTO `user` VALUES ('4', 'LOUIS', 'Female', '22', 'ON', '76678678', 'louis@gmail.com', null, null);
INSERT INTO `user` VALUES ('5', 'MIA', 'Female', '42', 'BC', '76678678', 'mia@gmail.com', null, null);
INSERT INTO `user` VALUES ('6', 'KIKI', 'Female', '38', 'ON', '32324323', 'kiki@gmail.com', null, null);
INSERT INTO `user` VALUES ('7', 'KIMI', 'Female', '23', 'MB', '17367125', 'kimi@gmail.com', null, null);
INSERT INTO `user` VALUES ('8', 'LUNA', 'Female', '20', 'AB', '32132328', 'luna@gmail.com', null, null);
INSERT INTO `user` VALUES ('9', 'MOON', 'Female', '40', 'BC', '92547182', 'moon@gmail.com', null, null);
INSERT INTO `user` VALUES ('10', 'VIVIAN', 'Female', '32', 'ON', '32312742', 'vivian@gmail.com', null, null);
INSERT INTO `user` VALUES ('11', 'EMMA', 'Female', '21', 'MB', '81938519', 'emma@gmail.com', null, null);
INSERT INTO `user` VALUES ('12', 'POULA', 'Female', '25', 'BC', '21323289', 'poula@gmail.com', null, null);
INSERT INTO `user` VALUES ('13', 'SIENNA', 'Female', '61', 'MB', '57721663', 'sienna@gmail.com', null, null);
INSERT INTO `user` VALUES ('14', 'ZED', 'Female', '35', 'ON', '57684727', 'zed@gmail.com', null, null);
INSERT INTO `user` VALUES ('15', 'LILY', 'Female', '47', 'AB', '37248374', 'lily@gmail.com', null, null);
INSERT INTO `user` VALUES ('31', 'COCO', 'Female', '37', 'YT', '164593462', 'coco@gmail.com', null, null);

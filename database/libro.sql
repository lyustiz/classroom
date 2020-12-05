/*
Navicat MySQL Data Transfer

Source Server         : desdecasa
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : classroom

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2020-11-30 11:46:55
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for libro
-- ----------------------------
DROP TABLE IF EXISTS `libro`;
CREATE TABLE `libro` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_libro` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `id_materia` int(11) NOT NULL,
  `id_grado` int(11) NOT NULL,
  `tx_descripcion` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_portada` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_observaciones` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of libro
-- ----------------------------
INSERT INTO `libro` VALUES ('1', 'Ciencias Sociales', '19', '4', 'Libro de Primer Grado de Ciencias Sociales', null, null, '1', '1', '2020-10-05 18:57:33', '2020-10-05 23:11:47');
INSERT INTO `libro` VALUES ('2', 'Matematica', '14', '4', 'Libro matematica', null, null, '1', '1', '2020-10-07 23:04:51', '2020-10-07 23:04:51');
INSERT INTO `libro` VALUES ('3', 'Lengua Castellana', '15', '4', 'LIbro Lengua Castellana', null, null, '1', '1', '2020-10-07 23:05:16', '2020-10-07 23:23:22');
INSERT INTO `libro` VALUES ('4', 'Ciencias Naturales', '7', '4', 'Libro Ciencias Naturales', null, null, '0', '0', null, null);

-- ----------------------------
-- Table structure for pagina
-- ----------------------------
DROP TABLE IF EXISTS `pagina`;
CREATE TABLE `pagina` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_pagina` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_libro` int(11) NOT NULL,
  `id_tema` int(11) NOT NULL,
  `nu_pagina` int(11) NOT NULL,
  `tx_path` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tx_observaciones` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of pagina
-- ----------------------------
INSERT INTO `pagina` VALUES ('1', 'pag1', '1', '1', '1', 'CS_G1_001.jpg', null, '1', '1', '2020-10-06 14:33:01', '2020-10-06 14:33:01');
INSERT INTO `pagina` VALUES ('2', 'pag2', '1', '1', '2', 'CS_G1_002.jpg', null, '1', '1', '2020-10-06 15:23:19', '2020-10-07 20:34:54');
INSERT INTO `pagina` VALUES ('3', 'pag3', '1', '1', '3', 'CS_G1_003.jpg', null, '1', '1', '2020-10-07 20:34:41', '2020-10-07 20:37:12');
INSERT INTO `pagina` VALUES ('4', 'pag4', '1', '1', '4', 'CS_G1_004.jpg', null, '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('5', null, '1', '1', '5', 'CS_G1_005.jpg', null, '1', '1', null, null);
INSERT INTO `pagina` VALUES ('6', null, '1', '1', '6', 'CS_G1_006.jpg', null, '1', '1', null, null);
INSERT INTO `pagina` VALUES ('7', null, '1', '1', '7', 'CS_G1_007.jpg', null, '1', '1', null, null);
INSERT INTO `pagina` VALUES ('8', null, '1', '1', '8', 'CS_G1_008.jpg', null, '1', '1', null, null);
INSERT INTO `pagina` VALUES ('9', null, '1', '1', '9', 'CS_G1_009.jpg', null, '1', '1', null, null);
INSERT INTO `pagina` VALUES ('10', null, '1', '1', '10', 'CS_G1_010.jpg', null, '1', '1', null, null);

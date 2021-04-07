/*
Navicat MySQL Data Transfer

Source Server         : desdecasa
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : classroom

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2021-04-06 17:12:00
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tarea
-- ----------------------------
DROP TABLE IF EXISTS `tarea`;
CREATE TABLE `tarea` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_tarea` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tx_descripcion` varchar(3000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_tipo_tarea` int(11) unsigned DEFAULT NULL,
  `id_grado` int(11) unsigned NOT NULL,
  `id_materia` int(11) unsigned NOT NULL,
  `id_tema` int(11) unsigned NOT NULL,
  `nu_peso` decimal(11,2) DEFAULT NULL,
  `tx_observaciones` varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `id_status` int(11) unsigned NOT NULL,
  `id_usuario` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tarea_tipo_tarea` (`id_tipo_tarea`),
  KEY `fk_tarea_grado` (`id_grado`),
  KEY `fk_tarea_materia` (`id_materia`),
  KEY `fk_tarea_tema` (`id_tema`),
  KEY `fk_tarea_status` (`id_status`),
  KEY `fk_tarea_usuario` (`id_usuario`),
  CONSTRAINT `fk_tarea_grado` FOREIGN KEY (`id_grado`) REFERENCES `grado` (`id`),
  CONSTRAINT `fk_tarea_materia` FOREIGN KEY (`id_materia`) REFERENCES `materia` (`id`),
  CONSTRAINT `fk_tarea_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`),
  CONSTRAINT `fk_tarea_tema` FOREIGN KEY (`id_tema`) REFERENCES `tema` (`id`),
  CONSTRAINT `fk_tarea_tipo_tarea` FOREIGN KEY (`id_tipo_tarea`) REFERENCES `tipo_tarea` (`id`),
  CONSTRAINT `fk_tarea_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

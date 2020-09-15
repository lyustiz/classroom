/*
Navicat MySQL Data Transfer

Source Server         : desdecasa
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : classroom

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2020-09-14 23:06:39
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for actividad
-- ----------------------------
DROP TABLE IF EXISTS `actividad`;
CREATE TABLE `actividad` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_actividad` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `id_horario` int(11) NOT NULL,
  `id_materia` int(11) NOT NULL,
  `id_docente` int(11) NOT NULL,
  `id_dia_semana` int(11) NOT NULL,
  `id_aula` int(11) NOT NULL,
  `hh_inicio` time NOT NULL,
  `hh_fin` time NOT NULL,
  `id_carga_horaria` int(11) NOT NULL,
  `nu_carga_horaria` int(2) NOT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of actividad
-- ----------------------------
INSERT INTO `actividad` VALUES ('44', 'F1OyO4izU43hWlFSxExhsT5aCZawYznqdPqyJKN5ZTZabGHr9be3MvRP7zZLWkUs', '1', '15', '2', '1', '4', '08:00:00', '08:45:00', '2', '2', null, '1', '1', '2020-05-23 10:52:21', '2020-05-25 14:50:32');
INSERT INTO `actividad` VALUES ('45', 'F1OyO4izU43hWlFSxExhsT5aCZawYznqdPqyJKN5ZTZabGHr9be3MvRP7zZLWkUs', '1', '15', '2', '1', '4', '08:00:00', '08:45:00', '3', '0', null, '1', '1', '2020-05-23 10:52:22', '2020-05-25 14:50:32');
INSERT INTO `actividad` VALUES ('48', 'up8nKX8pLNiPiwO9fzVx0pbCUDRVyOLH9mHUbcDpJAC4Dec3QODtSmj42bcsAlJt', '1', '15', '1', '2', '4', '10:15:00', '11:00:00', '5', '1', null, '1', '1', '2020-05-25 14:53:35', '2020-05-25 15:13:05');
INSERT INTO `actividad` VALUES ('49', '0o5VcAZoEtHK3x0yC94JyBPMZ6vtaqy6tsPcuXpmgQ7cMFTQS2gJcdNA0fPZmITI', '1', '7', '2', '5', '3', '13:00:00', '13:45:00', '7', '2', null, '1', '1', '2020-05-25 14:54:48', '2020-05-25 14:54:48');
INSERT INTO `actividad` VALUES ('50', '0o5VcAZoEtHK3x0yC94JyBPMZ6vtaqy6tsPcuXpmgQ7cMFTQS2gJcdNA0fPZmITI', '1', '7', '2', '5', '3', '13:00:00', '13:45:00', '8', '0', null, '1', '1', '2020-05-25 14:54:48', '2020-05-25 14:54:48');
INSERT INTO `actividad` VALUES ('51', 'n9hedWv6Mj355TrIyXaVJH9njUwOhK5aqrhMBQGIOtRdutIyYst1WTVfoQACmIjB', '1', '14', '2', '1', '3', '10:15:00', '11:00:00', '5', '1', null, '1', '1', '2020-05-25 14:55:06', '2020-05-25 14:55:06');
INSERT INTO `actividad` VALUES ('52', 'cDYnkhntwsCGbzwWQRPpi684cTezxKYEEnOhZihdnREr1D8iN2txKOPgeTCsHDL6', '1', '7', '1', '1', '2', '13:00:00', '13:45:00', '7', '2', null, '1', '1', '2020-05-25 14:55:26', '2020-05-25 14:55:26');
INSERT INTO `actividad` VALUES ('53', 'cDYnkhntwsCGbzwWQRPpi684cTezxKYEEnOhZihdnREr1D8iN2txKOPgeTCsHDL6', '1', '7', '1', '1', '2', '13:00:00', '13:45:00', '8', '0', null, '1', '1', '2020-05-25 14:55:26', '2020-05-25 14:55:26');
INSERT INTO `actividad` VALUES ('55', 'fK0BaY15P1lrg2mSNR7KwxpWstOGPhj0khykzAxC5ly1QtUPoP40rQKLvHfHhUWX', '1', '15', '2', '5', '1', '08:00:00', '08:45:00', '2', '2', null, '1', '1', '2020-05-25 14:56:22', '2020-05-25 14:56:22');
INSERT INTO `actividad` VALUES ('56', 'fK0BaY15P1lrg2mSNR7KwxpWstOGPhj0khykzAxC5ly1QtUPoP40rQKLvHfHhUWX', '1', '15', '2', '5', '1', '08:00:00', '08:45:00', '3', '0', null, '1', '1', '2020-05-25 14:56:22', '2020-05-25 14:56:22');
INSERT INTO `actividad` VALUES ('57', 'ha4XwWijkI6fq2jEAIvvCdBTm4HzPbIayvbNm6XDzisN73CPJulhVSb11TpIxmPY', '1', '17', '1', '2', '1', '08:00:00', '08:45:00', '2', '2', null, '1', '1', '2020-05-25 14:56:48', '2020-05-25 14:56:48');
INSERT INTO `actividad` VALUES ('58', 'ha4XwWijkI6fq2jEAIvvCdBTm4HzPbIayvbNm6XDzisN73CPJulhVSb11TpIxmPY', '1', '17', '1', '2', '1', '08:00:00', '08:45:00', '3', '0', null, '1', '1', '2020-05-25 14:56:49', '2020-05-25 14:56:49');
INSERT INTO `actividad` VALUES ('59', 'TrqGovPPR8QY3DDcUI1UMfi2oOrJbCuAngJiCuwNLsE0EFbrwWNM39O2suXKVs2v', '1', '19', '1', '3', '2', '08:00:00', '08:45:00', '2', '2', null, '1', '1', '2020-05-25 14:57:18', '2020-05-25 14:57:18');
INSERT INTO `actividad` VALUES ('60', 'TrqGovPPR8QY3DDcUI1UMfi2oOrJbCuAngJiCuwNLsE0EFbrwWNM39O2suXKVs2v', '1', '19', '1', '3', '2', '08:00:00', '08:45:00', '3', '0', null, '1', '1', '2020-05-25 14:57:18', '2020-05-25 14:57:18');
INSERT INTO `actividad` VALUES ('61', 'jIuXgrjFVbYkl9ZchQ35HzWFhUH5PWSXm2AROfGNK6x3t8Gp5qa3y0ROAMtl0ytM', '1', '19', '2', '4', '2', '08:00:00', '08:45:00', '2', '2', null, '1', '1', '2020-05-25 14:57:43', '2020-05-25 14:57:43');
INSERT INTO `actividad` VALUES ('62', 'jIuXgrjFVbYkl9ZchQ35HzWFhUH5PWSXm2AROfGNK6x3t8Gp5qa3y0ROAMtl0ytM', '1', '19', '2', '4', '2', '08:00:00', '08:45:00', '3', '0', null, '1', '1', '2020-05-25 14:57:43', '2020-05-25 14:57:43');
INSERT INTO `actividad` VALUES ('63', 'AFR4Gkq51ADxbK9bfqndQZPcBG7t2fQk3bsuBkBt2McMWRsH3JFXUN1LgU4cU5fe', '1', '7', '1', '3', '3', '13:00:00', '13:45:00', '7', '2', null, '1', '1', '2020-05-25 15:09:22', '2020-05-25 15:09:22');
INSERT INTO `actividad` VALUES ('64', 'AFR4Gkq51ADxbK9bfqndQZPcBG7t2fQk3bsuBkBt2McMWRsH3JFXUN1LgU4cU5fe', '1', '7', '1', '3', '3', '13:00:00', '13:45:00', '8', '0', null, '1', '1', '2020-05-25 15:09:22', '2020-05-25 15:09:22');
INSERT INTO `actividad` VALUES ('65', 'mi61RETJYwRcmvWilHINOeIup5dCUw2vK2iyOPujwlWAeR3F24l5rUfrPVZifyCm', '1', '14', '1', '4', '2', '13:00:00', '13:45:00', '7', '2', null, '1', '1', '2020-05-25 15:09:36', '2020-05-25 15:09:36');
INSERT INTO `actividad` VALUES ('66', 'mi61RETJYwRcmvWilHINOeIup5dCUw2vK2iyOPujwlWAeR3F24l5rUfrPVZifyCm', '1', '14', '1', '4', '2', '13:00:00', '13:45:00', '8', '0', null, '1', '1', '2020-05-25 15:09:37', '2020-05-25 15:09:37');
INSERT INTO `actividad` VALUES ('67', 'h88StzD0htSa1Sa1uI9LNdXIK10BvqrsmTAIkC1wwJvBazTckaLZjwEvEQ1Sfptq', '1', '15', '1', '2', '1', '13:00:00', '13:45:00', '7', '2', null, '1', '1', '2020-05-25 15:12:52', '2020-05-25 15:12:52');
INSERT INTO `actividad` VALUES ('68', 'h88StzD0htSa1Sa1uI9LNdXIK10BvqrsmTAIkC1wwJvBazTckaLZjwEvEQ1Sfptq', '1', '15', '1', '2', '1', '13:00:00', '13:45:00', '8', '0', null, '1', '1', '2020-05-25 15:12:52', '2020-05-25 15:12:52');
INSERT INTO `actividad` VALUES ('71', 'kYT0iM33jbFGrej8e3fQDi5IkD3lS0vlYbE2b4plCUe4EpHKiIhDEmGgNn98sZLo', '1', '14', '1', '3', '1', '10:15:00', '11:00:00', '5', '1', null, '1', '1', '2020-06-11 23:47:18', '2020-06-11 23:47:18');
INSERT INTO `actividad` VALUES ('72', 'b85wgmMc4rePd3NMlOZrWmzhh2AdIUBHAWLv11WJNNH7UKcfpwTlo7ur0yztcDSP', '1', '15', '2', '4', '3', '10:15:00', '11:00:00', '5', '2', null, '1', '1', '2020-06-22 23:48:21', '2020-06-22 23:48:21');
INSERT INTO `actividad` VALUES ('73', 'b85wgmMc4rePd3NMlOZrWmzhh2AdIUBHAWLv11WJNNH7UKcfpwTlo7ur0yztcDSP', '1', '15', '2', '4', '3', '10:15:00', '11:00:00', '7', '0', null, '1', '1', '2020-06-22 23:48:21', '2020-06-22 23:48:21');

-- ----------------------------
-- Table structure for actividad_carga_horaria
-- ----------------------------
DROP TABLE IF EXISTS `actividad_carga_horaria`;
CREATE TABLE `actividad_carga_horaria` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_actividad` int(11) NOT NULL,
  `id_carga_horaria` int(11) NOT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of actividad_carga_horaria
-- ----------------------------
INSERT INTO `actividad_carga_horaria` VALUES ('1', '1', '1', null, '1', '1', null, null);
INSERT INTO `actividad_carga_horaria` VALUES ('2', '1', '2', null, '1', '1', null, null);

-- ----------------------------
-- Table structure for agenda
-- ----------------------------
DROP TABLE IF EXISTS `agenda`;
CREATE TABLE `agenda` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_agenda` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_calendario` int(11) NOT NULL,
  `id_tipo_agenda` int(11) NOT NULL,
  `id_tipo_actividad` int(11) NOT NULL,
  `fe_agenda` date NOT NULL,
  `hh_inicio` time NOT NULL,
  `hh_fin` time NOT NULL,
  `id_origen` int(11) NOT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of agenda
-- ----------------------------
INSERT INTO `agenda` VALUES ('2', 'Reunion Quincenal', '1', '3', '1', '2020-07-18', '08:01:00', '08:30:00', '0', 'Cambio de Planes de Evaluacion Nueva Normalidad', '1', '1', '2020-06-19 20:39:49', '2020-06-19 20:39:49');
INSERT INTO `agenda` VALUES ('3', 'Taller Evaluaciones en Linea', '1', '3', '4', '2020-07-19', '10:55:00', '15:30:00', '0', 'Desarrollo de Planes de Evaluacion en Linea y Generacion de Tareas', '1', '1', '2020-06-19 20:59:40', '2020-06-25 22:22:57');
INSERT INTO `agenda` VALUES ('4', 'Celebracion Dia del Estudiante', '1', '6', '5', '2020-07-19', '08:00:00', '10:00:00', '0', 'Descripcion completa de alguna actividad para indicar infomacion importante.', '1', '1', '2020-06-19 21:01:55', '2020-06-25 22:19:53');
INSERT INTO `agenda` VALUES ('5', 'Prueba', '1', '5', '5', '2020-07-15', '00:00:00', '00:59:00', '0', 'Actividad Prueba', '1', '1', '2020-06-19 21:05:59', '2020-06-22 19:43:38');
INSERT INTO `agenda` VALUES ('7', 'Inicio de Clases', '1', '1', '8', '2020-07-01', '00:01:00', '00:01:00', '0', 'Inicio del año escolar', '1', '1', '2020-06-19 21:24:16', '2020-06-19 21:24:16');
INSERT INTO `agenda` VALUES ('8', 'Fin Periodo I', '1', '2', '9', '2020-07-30', '00:01:00', '00:00:00', '0', 'Fin primer periodo', '1', '1', '2020-06-19 21:25:34', '2020-06-19 21:25:34');
INSERT INTO `agenda` VALUES ('11', 'Campeonato de Futbol', '1', '4', '6', '2020-07-04', '08:00:00', '07:00:00', '0', 'Campeonato Interescolar Distrital', '1', '1', '2020-06-20 11:28:11', '2020-06-22 19:31:16');
INSERT INTO `agenda` VALUES ('13', 'yeryerye', '1', '1', '8', '2020-07-05', '00:10:00', '05:00:00', '0', 'hfghfhfhfhfg', '1', '1', '2020-06-25 03:07:57', '2020-06-25 03:08:06');
INSERT INTO `agenda` VALUES ('14', 'dgshghsdf', '1', '4', '2', '2020-08-04', '00:36:00', '00:30:00', '0', 'hdffhdf', '1', '1', '2020-08-18 17:51:11', '2020-08-18 17:51:11');
INSERT INTO `agenda` VALUES ('15', 'eeqeqe', '1', '1', '1', '2020-09-09', '06:06:00', '07:05:00', '0', 'eeq', '1', '1', '2020-09-02 21:27:57', '2020-09-02 21:27:57');
INSERT INTO `agenda` VALUES ('16', 'Reunion', '1', '1', '1', '2020-09-10', '02:09:00', '01:09:00', '0', 'fdfsf', '1', '2', '2020-09-05 14:13:58', '2020-09-05 14:13:58');

-- ----------------------------
-- Table structure for alumno
-- ----------------------------
DROP TABLE IF EXISTS `alumno`;
CREATE TABLE `alumno` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_apellido` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nb_apellido2` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nb_nombre` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nb_nombre2` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_tipo_documento` int(11) NOT NULL,
  `tx_documento` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tx_sexo` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fe_nacimiento` date NOT NULL,
  `tx_nacionalidad` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `tx_lugar_nacimiento` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_direccion` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_departamento` int(11) NOT NULL,
  `id_ciudad` int(11) NOT NULL,
  `tx_email` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_telefono` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_telefono2` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_telefono3` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of alumno
-- ----------------------------
INSERT INTO `alumno` VALUES ('1', 'Yustiz', 'Tovar', 'Jean', 'Pierre', '1', '31122290', 'M', '2007-06-22', 'Venezolano', 'Caracas', 'Calle 3 con 4', '76', '76', 'jyustiz@gmailcom', '04129098862', '04129098862', '04129098862', null, '1', '1', '2020-05-17 04:47:28', '2020-05-17 05:37:15');
INSERT INTO `alumno` VALUES ('2', 'Tovar', 'Gonzalez', 'Luisa', 'Milagro', '1', '41241412', 'F', '2005-05-11', 'Colombiana', 'Cali', 'Calle 21', '76', '76', 'luisat02@gmail.com', '04262880693', '04262880693', '04262880693', null, '1', '1', '2020-05-17 05:40:18', '2020-07-31 01:53:18');
INSERT INTO `alumno` VALUES ('10', 'Calderon', 'Cameron', 'Diana', 'Myra', '1', '50287012', 'F', '2016-02-03', 'Colombia', 'DC', 'Ap #112-5015 Lectus Rd.', '76', '76', 'neque@Fuscedolor.org', '16960513 7828', '16910522 4019', '16880710 9999', null, '1', '1', '2021-02-10 00:00:00', '2020-07-18 22:20:04');
INSERT INTO `alumno` VALUES ('11', 'Ruiz', 'Potter', 'Hollee', 'Raven', '1', '42840101', 'M', '2009-02-04', 'Colombia', 'BOL', '687-3289 Tristique St.', '76', '76', 'pulvinar@Fuscealiquetmagna.org', '16711201 6089', '16751022 7551', '16710527 6310', null, '1', '1', '2019-10-17 00:00:00', '2020-07-21 01:46:41');
INSERT INTO `alumno` VALUES ('12', 'Blankenship', 'Berger', 'Beau', 'Yoshio', '1', '49436977', 'M', '2010-02-03', 'Colombia', 'Bolívar', '852-4930 Ultricies Av.', '76', '76', 'pede.malesuada.vel@Maecenasiac', '16010417 7993', '16221120 0502', '16261109 9991', null, '1', '1', '2020-07-07 00:00:00', '2020-07-21 01:45:55');
INSERT INTO `alumno` VALUES ('13', 'Gomez', 'Kerr', 'Lester', 'Rebekah', '1', '45761228', 'M', '2019-08-05', 'Colombia', 'SUC', 'Ap #918-5722 Eu, Street', '76', '76', 'magna.a@dictummagnaUt.com', '16210214 6848', '16930718 1454', '16730629 6760', null, '1', '1', '2020-03-06 00:00:00', '2020-07-09 13:39:30');
INSERT INTO `alumno` VALUES ('14', 'Holloway', 'Gates', 'Acton', 'Jolie', '1', '6478002', 'M', '2019-11-07', 'Colombia', 'Cauca', '1817 Sed, Av.', '76', '76', 'consequat.enim.diam@sitamet.ca', '16761130 8680', '16530228 6611', '16700221 2780', null, '1', '1', '2020-05-01 00:00:00', '2020-07-09 13:38:17');
INSERT INTO `alumno` VALUES ('15', 'Castillo', 'Short', 'Tallulah', 'Hillary', '1', '30030229', 'F', '2020-05-18', 'Colombia', 'VAU', 'Ap #689-4446 Placerat. St.', '76', '76', 'quis.pede@tinciduntDonecvitae.', '16170726 2604', '16930428 2818', '16460617 4425', null, '1', '1', '2020-12-12 00:00:00', '2020-07-09 13:37:56');
INSERT INTO `alumno` VALUES ('16', 'Potts', 'Hill', 'Kevin', 'Stephanie', '1', '20703652', 'M', '2020-04-07', 'Colombia', 'Quindío', '747-6481 Phasellus Street', '76', '76', 'risus.at.fringilla@Donecest.co', '16010309 7929', '16900825 9146', '16340409 5766', null, '1', '1', '2020-12-05 00:00:00', '2020-07-09 13:37:23');
INSERT INTO `alumno` VALUES ('17', 'Watson', 'Sharp', 'Tobias', 'Kay', '1', '21760888', 'F', '2021-01-27', 'Colombia', 'VID', 'Ap #791-8701 Nulla St.', '76', '76', 'velit.egestas.lacinia@In.edu', '16860304 8086', '16401214 5720', '16740115 2462', null, '1', '1', '2019-07-15 00:00:00', '2020-03-01 00:00:00');
INSERT INTO `alumno` VALUES ('18', 'Williamson', 'Lane', 'Bianca', 'Donovan', '1', '33920932', 'M', '2021-04-04', 'Colombia', 'Amazonas', '673-5848 Nunc Ave', '76', '76', 'feugiat.non@auctorvelit.org', '16240801 4955', '16491122 2075', '16831001 4512', null, '1', '1', '2020-04-19 00:00:00', '2020-08-13 00:00:00');
INSERT INTO `alumno` VALUES ('19', 'Stone', 'Graves', 'Britanney', 'Alec', '1', '11107991', 'F', '2020-07-01', 'Colombia', 'RIS', 'Ap #427-9167 Nibh. Street', '76', '76', 'amet@fermentumarcuVestibulum.c', '16900410 5806', '16630412 1301', '16740129 4280', null, '1', '1', '2020-01-29 00:00:00', '2020-07-09 13:36:45');
INSERT INTO `alumno` VALUES ('20', 'Clemons', 'Jordan', 'Destiny', 'Brent', '2', '50961169', 'F', '2020-01-16', 'Colombia', 'MET', 'P.O. Box 180, 1439 Leo Rd.', '76', '76', 'facilisis.non.bibendum@vitae.e', '16000405 9762', '16161224 0430', '16771114 0728', null, '1', '1', '2021-03-31 00:00:00', '2020-07-09 13:36:00');
INSERT INTO `alumno` VALUES ('21', 'Clemons', 'Vang', 'Thomas', 'Aretha', '2', '37010033', 'M', '2019-12-22', 'Colombia', 'BOL', '631-6518 Pharetra, Road', '76', '76', 'Phasellus@Fusce.co.uk', '16370930 2198', '16990526 6541', '16461202 0802', null, '1', '1', '2021-06-20 00:00:00', '2020-08-23 00:00:00');
INSERT INTO `alumno` VALUES ('22', 'Craig', 'Mccoy', 'Cullen', 'Damon', '2', '32491714', 'M', '2020-06-09', 'Colombia', 'Valle del Cauca', '631-683 Donec Street', '76', '76', 'justo.eu.arcu@egetmassaSuspend', '16780402 9655', '16490601 2374', '16590826 3550', null, '1', '1', '2019-08-14 00:00:00', '2019-08-01 00:00:00');
INSERT INTO `alumno` VALUES ('23', 'Rich', 'Nieves', 'Sthephany', 'Lysandra', '2', '10625067', 'F', '2020-07-01', 'Colombia', 'Huila', '106-7552 Aliquet Rd.', '76', '76', 'dapibus.ligula@eudoloregestas.', '16100405 8358', '16091119 4439', '16021004 4293', null, '1', '1', '2021-05-17 00:00:00', '2020-07-16 00:43:08');
INSERT INTO `alumno` VALUES ('24', 'Larson', 'Jarvis', 'Odessa', 'Colby', '2', '11720016', 'M', '2019-11-09', 'Colombia', 'GUA', '359-9736 Adipiscing Rd.', '76', '76', 'ipsum@vulputate.org', '16760401 5094', '16850611 1734', '16810303 6607', null, '1', '1', '2020-04-12 00:00:00', '2021-03-04 00:00:00');
INSERT INTO `alumno` VALUES ('25', 'Downs', 'Gay', 'Jasmine', 'Jaquelyn', '2', '46000387', 'F', '2020-08-06', 'Colombia', 'CAS', '621-7557 Enim. Rd.', '76', '76', 'Aliquam@consequatdolorvitae.or', '16801017 4020', '16550902 8634', '16100426 2265', null, '1', '1', '2021-02-13 00:00:00', '2020-05-24 00:00:00');
INSERT INTO `alumno` VALUES ('26', 'Hood', 'Rice', 'Felicia', 'Octavius', '2', '14437570', 'M', '2020-02-08', 'Colombia', 'Caquetá', '122-5678 Quam Street', '76', '76', 'in.faucibus.orci@pellentesquea', '16531029 0076', '16960808 7160', '16661107 3054', null, '1', '1', '2020-05-06 00:00:00', '2021-02-25 00:00:00');
INSERT INTO `alumno` VALUES ('27', 'Moss', 'Brady', 'Otto', 'Ferdinand', '2', '30381941', 'F', '2020-01-16', 'Colombia', 'Casanare', 'Ap #574-5304 Molestie Street', '76', '76', 'a.enim.Suspendisse@ategestas.c', '16291127 8345', '16060812 4020', '16441022 8334', null, '1', '1', '2019-12-19 00:00:00', '2020-04-05 00:00:00');
INSERT INTO `alumno` VALUES ('28', 'Campos', 'Mayer', 'Hashim', 'Yeo', '2', '48583697', 'M', '2019-08-25', 'Colombia', 'VAU', 'P.O. Box 414, 7683 Duis St.', '76', '76', 'diam.vel.arcu@arcuNunc.edu', '16390927 5350', '16660304 5417', '16941118 4980', null, '1', '1', '2020-12-20 00:00:00', '2021-03-12 00:00:00');
INSERT INTO `alumno` VALUES ('29', 'Dominguez', 'House', 'Cassandra', 'Darryl', '2', '21721652', 'M', '2021-05-29', 'Colombia', 'COR', 'P.O. Box 350, 3326 A Rd.', '76', '76', 'iaculis.lacus.pede@Maecenasmal', '16870429 2005', '16140811 8386', '16910530 2732', null, '1', '1', '2019-10-22 00:00:00', '2020-01-14 00:00:00');
INSERT INTO `alumno` VALUES ('30', 'Best', 'Montoya', 'Amber', 'Mariko', '1', '26287706', 'M', '2020-10-16', 'Colombia', 'HUI', '724-8966 Mi Av.', '76', '76', 'per.conubia@tristiquepellentes', '16760726 1661', '16910628 0952', '16700706 2156', null, '1', '1', '2019-08-19 00:00:00', '2020-10-11 00:00:00');
INSERT INTO `alumno` VALUES ('31', 'Cox', 'Valdez', 'Yvonne', 'Adam', '1', '33440190', 'F', '2019-09-23', 'Colombia', 'SUC', 'Ap #586-2524 Ac St.', '76', '76', 'mauris.sagittis.placerat@Namte', '16720813 6759', '16820327 7499', '16950320 3805', null, '1', '1', '2021-03-13 00:00:00', '2020-10-17 00:00:00');
INSERT INTO `alumno` VALUES ('32', 'Pope', 'Armstrong', 'Morgan', 'Chloe', '1', '28439135', 'M', '2020-01-30', 'Colombia', 'CES', '668-9430 Accumsan Street', '76', '76', 'magna.Duis@nullaatsem.com', '16140704 7859', '16071117 8319', '16190403 8807', null, '1', '1', '2019-08-26 00:00:00', '2020-07-12 00:00:00');
INSERT INTO `alumno` VALUES ('33', 'Ellis', 'Maddox', 'Ashton', 'Linda', '1', '19399175', 'M', '2020-03-09', 'Colombia', 'NSA', 'Ap #684-7613 Nulla Road', '76', '76', 'Curabitur.ut.odio@diam.org', '16820629 1299', '16740926 2990', '16240106 5087', null, '1', '1', '2020-12-23 00:00:00', '2019-10-13 00:00:00');
INSERT INTO `alumno` VALUES ('34', 'Crane', 'Humphrey', 'Autumn', 'Maya', '1', '42036628', 'F', '2020-10-06', 'Colombia', 'MAG', 'P.O. Box 429, 7430 Tellus Rd.', '76', '76', 'Maecenas.malesuada@luctusetult', '16011021 5944', '16020627 5935', '16951219 3609', null, '1', '1', '2020-04-13 00:00:00', '2020-12-20 00:00:00');
INSERT INTO `alumno` VALUES ('35', 'Carrillo', 'Daugherty', 'Norman', 'Nelle', '1', '43563551', 'M', '2020-01-11', 'Colombia', 'Tolima', 'Ap #396-5805 Sed Rd.', '76', '76', 'vitae.risus@purusmaurisa.com', '16280310 3213', '16400412 5813', '16701224 6885', null, '1', '1', '2020-06-06 00:00:00', '2019-09-25 00:00:00');
INSERT INTO `alumno` VALUES ('36', 'Vang', 'Olsen', 'Kaseem', 'Anastasia', '1', '24931828', 'M', '2020-12-16', 'Colombia', 'Atlántico', '5549 Montes, St.', '76', '76', 'fringilla.ornare@elit.net', '16590617 6333', '16920725 6836', '16200825 4068', null, '1', '1', '2020-05-29 00:00:00', '2019-08-18 00:00:00');
INSERT INTO `alumno` VALUES ('37', 'Phillips', 'Valenzuela', 'Ruby', 'Kelly', '1', '27207527', 'F', '2021-06-10', 'Colombia', 'CAQ', 'P.O. Box 635, 3598 Ornare. Road', '76', '76', 'purus.Maecenas@mus.co.uk', '16781220 0801', '16380114 8200', '16830607 2037', null, '1', '1', '2020-07-01 00:00:00', '2021-02-27 00:00:00');
INSERT INTO `alumno` VALUES ('38', 'Mcknight', 'Morse', 'Shafira', 'Brenda', '1', '7515069', 'M', '2019-09-11', 'Colombia', 'CUN', '642-8124 Curabitur Street', '76', '76', 'Morbi@malesuadamalesuada.edu', '16430508 4057', '16961128 8938', '16180725 8049', null, '1', '1', '2021-05-24 00:00:00', '2020-12-08 00:00:00');
INSERT INTO `alumno` VALUES ('39', 'Lucas', 'Cross', 'Roth', 'Samson', '1', '23682337', 'M', '2020-04-15', 'Colombia', 'Chocó', 'P.O. Box 993, 4573 Elit, Ave', '76', '76', 'vitae.purus@montesnasceturridi', '16460329 0273', '16901110 4487', '16990101 9084', null, '1', '1', '2020-08-24 00:00:00', '2021-02-01 00:00:00');
INSERT INTO `alumno` VALUES ('40', 'Welch', 'Abbott', 'Cooper', 'Joan', '2', '17304443', 'F', '2021-06-17', 'Colombia', 'Putumayo', 'Ap #842-1053 Consequat Av.', '76', '76', 'Cras@arcuVestibulum.ca', '16180919 2543', '16700821 7221', '16380904 0052', null, '1', '1', '2019-09-30 00:00:00', '2020-04-30 00:00:00');
INSERT INTO `alumno` VALUES ('41', 'Valenzuela', 'Gibson', 'Keegan', 'Stephanie', '2', '5479648', 'M', '2020-10-28', 'Colombia', 'Distrito Capital', '8299 Aliquet Ave', '76', '76', 'nulla.ante@eutellusPhasellus.c', '16070516 7286', '16680123 3252', '16120228 8443', null, '1', '1', '2019-08-03 00:00:00', '2021-02-21 00:00:00');
INSERT INTO `alumno` VALUES ('42', 'Morrison', 'Patel', 'Alden', 'Bert', '2', '10703161', 'M', '2020-08-28', 'Colombia', 'VAU', '8048 Magna. Ave', '76', '76', 'rutrum@estmollis.net', '16450906 1513', '16500723 8818', '16120101 6324', null, '1', '1', '2020-09-14 00:00:00', '2020-02-11 00:00:00');
INSERT INTO `alumno` VALUES ('43', 'Stein', 'Coleman', 'Gary', 'Giacomo', '2', '50515319', 'F', '2020-12-23', 'Colombia', 'CAS', '9832 Convallis St.', '76', '76', 'Pellentesque.habitant.morbi@fe', '16090803 4218', '16470322 3430', '16770303 3832', null, '1', '1', '2019-08-30 00:00:00', '2019-09-16 00:00:00');
INSERT INTO `alumno` VALUES ('44', 'Burt', 'Valentine', 'Aline', 'Maile', '2', '43171221', 'M', '2020-10-08', 'Colombia', 'CAL', '5190 Urna. Road', '76', '76', 'mi.Duis@maurissagittis.edu', '16660214 9152', '16921219 5847', '16400223 6943', null, '1', '1', '2020-12-30 00:00:00', '2019-09-13 00:00:00');
INSERT INTO `alumno` VALUES ('45', 'Bartlett', 'Jefferson', 'Kimberly', 'Desiree', '2', '10308498', 'M', '2020-02-04', 'Colombia', 'Valle del Cauca', '2390 Vivamus St.', '76', '76', 'ut.mi@ligulatortordictum.com', '16160826 6902', '16791010 4632', '16920413 0802', null, '1', '1', '2021-05-16 00:00:00', '2020-12-23 00:00:00');
INSERT INTO `alumno` VALUES ('46', 'Oneal', 'Fowler', 'Hedwig', 'Bianca', '2', '32806149', 'M', '2020-08-22', 'Colombia', 'SAN', 'P.O. Box 288, 9663 A, Rd.', '76', '76', 'a.facilisis.non@dictumeu.edu', '16350816 4005', '16700624 0845', '16890109 5003', null, '1', '1', '2020-10-09 00:00:00', '2020-01-17 00:00:00');
INSERT INTO `alumno` VALUES ('47', 'Cummings', 'Mcguire', 'Olympia', 'Ralph', '2', '9836345', 'M', '2019-08-22', 'Colombia', 'Guainía', 'P.O. Box 419, 8846 Donec St.', '76', '76', 'sodales.Mauris@necante.edu', '16770414 0149', '16270326 7001', '16370313 5891', null, '1', '1', '2020-04-30 00:00:00', '2019-10-03 00:00:00');
INSERT INTO `alumno` VALUES ('48', 'May', 'Burris', 'Paloma', 'Cheryl', '2', '25545123', 'M', '2019-09-07', 'Colombia', 'Norte de Santander', '2112 Cursus Street', '76', '76', 'enim.nisl@eros.org', '16120230 9173', '16551230 4733', '16591015 4797', null, '1', '1', '2021-04-09 00:00:00', '2019-10-07 00:00:00');
INSERT INTO `alumno` VALUES ('49', 'Riley', 'Pate', 'Bruce', 'Abdul', '2', '39591335', 'M', '2020-12-29', 'Colombia', 'Sucre', '293-2427 Mauris Rd.', '76', '76', 'pede.malesuada@nullavulputate.', '16800811 0739', '16630930 2724', '16430330 2642', null, '1', '1', '2020-07-21 00:00:00', '2019-11-01 00:00:00');
INSERT INTO `alumno` VALUES ('50', 'Knight', 'Finley', 'Finn', 'Demetria', '1', '12013185', 'M', '2019-10-10', 'Colombia', 'VID', '3388 Orci. Road', '76', '76', 'placerat@orciadipiscing.ca', '16450110 6084', '16410112 3943', '16430414 9083', null, '1', '1', '2021-01-17 00:00:00', '2019-12-21 00:00:00');
INSERT INTO `alumno` VALUES ('51', 'Coffey', 'Frost', 'Nehru', 'Reece', '1', '30406432', 'F', '2019-10-16', 'Colombia', 'Sucre', '9723 In, Rd.', '76', '76', 'Sed.auctor.odio@Nullam.com', '16640111 4340', '16890927 2455', '16680621 4794', null, '1', '1', '2021-03-08 00:00:00', '2020-08-30 00:00:00');
INSERT INTO `alumno` VALUES ('52', 'Saunders', 'Pennington', 'Cairo', 'Marsden', '1', '27049234', 'F', '2019-07-10', 'Colombia', 'Cundinamarca', 'Ap #646-2143 Mollis Ave', '76', '76', 'ullamcorper@Nulladignissim.co.', '16260528 2843', '16100919 1402', '16911104 2660', null, '1', '1', '2020-05-11 00:00:00', '2021-06-22 00:00:00');
INSERT INTO `alumno` VALUES ('53', 'Prince', 'Hammond', 'Maite', 'Charde', '1', '10516712', 'M', '2021-02-20', 'Colombia', 'Boyacá', '4520 Vivamus Av.', '76', '76', 'orci.in.consequat@ipsumcursusv', '16490726 3778', '16580915 2480', '16010727 3013', null, '1', '1', '2020-09-09 00:00:00', '2021-01-30 00:00:00');
INSERT INTO `alumno` VALUES ('54', 'Frye', 'Ford', 'Blossom', 'Larissa', '1', '29445941', 'M', '2020-12-28', 'Colombia', 'MET', 'P.O. Box 574, 4906 Luctus. Rd.', '76', '76', 'montes.nascetur@sapienCras.net', '16170322 5183', '16920219 6250', '16440715 8882', null, '1', '1', '2020-07-26 00:00:00', '2020-02-18 00:00:00');
INSERT INTO `alumno` VALUES ('55', 'Gillespie', 'Hubbard', 'Kirsten', 'Todd', '1', '22062309', 'F', '2020-09-08', 'Colombia', 'HUI', '810-4688 Nulla. Rd.', '76', '76', 'ultricies.dignissim.lacus@Sed.', '16870614 5581', '16260513 6023', '16211026 5127', null, '1', '1', '2020-12-21 00:00:00', '2021-03-01 00:00:00');
INSERT INTO `alumno` VALUES ('56', 'Reynolds', 'Peters', 'Barrett', 'Jamal', '1', '41240424', 'F', '2020-01-07', 'Colombia', 'Atlántico', 'Ap #627-4138 Aliquam, Avenue', '76', '76', 'interdum.Curabitur@natoque.co.', '16530102 5440', '16990910 3617', '16400802 2644', null, '1', '1', '2019-10-01 00:00:00', '2021-02-18 00:00:00');
INSERT INTO `alumno` VALUES ('57', 'Berry', 'Cline', 'Benedict', 'Quinn', '1', '11533469', 'F', '2020-07-15', 'Colombia', 'DC', 'Ap #338-4296 Quis St.', '76', '76', 'ac.risus@viverra.co.uk', '16940425 6027', '16020607 9360', '16450330 2053', null, '1', '1', '2020-05-29 00:00:00', '2021-03-24 00:00:00');
INSERT INTO `alumno` VALUES ('58', 'Perkins', 'Francis', 'Gail', 'Guy', '1', '29505534', 'M', '2020-01-30', 'Colombia', 'Amazonas', '1959 Cum Road', '76', '76', 'ligula@etultrices.com', '16960725 8721', '16331012 5178', '16540728 7068', null, '1', '1', '2019-10-02 00:00:00', '2020-10-26 00:00:00');
INSERT INTO `alumno` VALUES ('59', 'Horne', 'Osborn', 'Amy', 'Kylynn', '1', '13301131', 'M', '2020-03-06', 'Colombia', 'Vichada', 'P.O. Box 426, 9458 Tempor Road', '76', '76', 'Donec.tempor.est@NuncmaurisMor', '16020911 7423', '16671005 8279', '16980510 5583', null, '1', '1', '2020-05-04 00:00:00', '2021-05-18 00:00:00');
INSERT INTO `alumno` VALUES ('60', 'Cleveland', 'Copeland', 'Rajah', 'Louis', '2', '30952672', 'M', '2020-06-25', 'Colombia', 'CAL', '8957 Pede St.', '76', '76', 'habitant.morbi@lobortismauris.', '16301012 4372', '16340210 7407', '16081209 0207', null, '1', '1', '2019-12-02 00:00:00', '2019-10-10 00:00:00');
INSERT INTO `alumno` VALUES ('61', 'Sherman', 'Porter', 'Kane', 'Hanna', '2', '38042330', 'M', '2021-03-09', 'Colombia', 'NAR', '6751 Rhoncus. Rd.', '76', '76', 'massa.Mauris.vestibulum@non.co', '16040604 0964', '16850101 4586', '16720305 3876', null, '1', '1', '2020-09-03 00:00:00', '2020-07-14 00:00:00');
INSERT INTO `alumno` VALUES ('62', 'Workman', 'Vaughan', 'Erica', 'Dean', '2', '9697487', 'F', '2019-08-08', 'Colombia', 'Caquetá', 'P.O. Box 301, 1705 Semper, St.', '76', '76', 'suscipit.nonummy.Fusce@consect', '16261207 3037', '16721017 8856', '16910918 1520', null, '1', '1', '2019-10-01 00:00:00', '2019-07-28 00:00:00');
INSERT INTO `alumno` VALUES ('63', 'Burris', 'Morrow', 'Hope', 'Lareina', '2', '37821368', 'F', '2020-04-18', 'Colombia', 'Norte de Santander', '5227 Nullam Rd.', '76', '76', 'pede.nonummy.ut@rutrum.net', '16350423 9595', '16611121 2111', '16490720 3857', null, '1', '1', '2020-03-13 00:00:00', '2020-08-21 00:00:00');
INSERT INTO `alumno` VALUES ('64', 'Sutton', 'Rush', 'Imani', 'Nerea', '2', '27451826', 'F', '2021-05-21', 'Colombia', 'RIS', 'P.O. Box 976, 7240 Risus. Street', '76', '76', 'Donec.non.justo@sapienCrasdolo', '16910505 4002', '16110716 2776', '16991125 5769', null, '1', '1', '2021-03-03 00:00:00', '2020-04-30 00:00:00');
INSERT INTO `alumno` VALUES ('65', 'Mendoza', 'Ingram', 'Dorothy', 'Quinn', '2', '47153339', 'M', '2020-08-11', 'Colombia', 'La Guajira', '664-1073 Dis St.', '76', '76', 'mattis.velit@aenim.ca', '16191017 9728', '16691116 5238', '16190512 1172', null, '1', '1', '2021-01-26 00:00:00', '2020-03-09 00:00:00');
INSERT INTO `alumno` VALUES ('66', 'Hubbard', 'Pacheco', 'Kimberly', 'Joelle', '2', '17650092', 'F', '2020-05-16', 'Colombia', 'La Guajira', '9489 Vel Street', '76', '76', 'Nulla@Suspendissealiquet.org', '16970415 8030', '16000922 0807', '16400723 0149', null, '1', '1', '2020-12-03 00:00:00', '2020-06-18 00:00:00');
INSERT INTO `alumno` VALUES ('67', 'Holder', 'Serrano', 'Colt', 'Eleanor', '2', '6756583', 'F', '2020-08-09', 'Colombia', 'Quindío', 'P.O. Box 499, 6202 Quis St.', '76', '76', 'eu.tellus@laoreetposuereenim.o', '16210717 6378', '16871113 2970', '16500508 1921', null, '1', '1', '2021-01-23 00:00:00', '2020-08-19 00:00:00');
INSERT INTO `alumno` VALUES ('68', 'Battle', 'Walton', 'Tatyana', 'Cecilia', '2', '35226785', 'M', '2020-05-09', 'Colombia', 'SUC', 'Ap #658-465 Consectetuer St.', '76', '76', 'Integer.tincidunt@Nulla.ca', '16640517 3748', '16330723 1104', '16360907 5969', null, '1', '1', '2020-12-16 00:00:00', '2020-11-24 00:00:00');
INSERT INTO `alumno` VALUES ('69', 'Waters', 'Small', 'India', 'Theodore', '2', '16925705', 'F', '2019-11-03', 'Colombia', 'Guaviare', '9756 Cursus Ave', '76', '76', 'Suspendisse@Aliquam.edu', '16791113 6500', '16920908 9516', '16010721 6327', null, '1', '1', '2021-01-02 00:00:00', '2020-10-14 00:00:00');
INSERT INTO `alumno` VALUES ('70', 'Lindsay', 'Noble', 'Stella', 'Xaviera', '1', '42453924', 'M', '2021-06-05', 'Colombia', 'Arauca', '822-1465 Purus. St.', '76', '76', 'enim.Etiam@atiaculis.com', '16330727 6794', '16120830 5399', '16000901 0802', null, '1', '1', '2020-09-03 00:00:00', '2020-06-28 00:00:00');
INSERT INTO `alumno` VALUES ('71', 'Parks', 'Jenkins', 'Holly', 'Clarke', '1', '21708132', 'F', '2020-10-20', 'Colombia', 'Nariño', '257-7371 Lobortis Street', '76', '76', 'pede.Nunc@Lorem.net', '16380327 3923', '16441028 9559', '16590620 9795', null, '1', '1', '2020-07-16 00:00:00', '2020-08-05 00:00:00');
INSERT INTO `alumno` VALUES ('72', 'Weaver', 'Rutledge', 'Isaac', 'Garrison', '1', '16046030', 'M', '2020-08-19', 'Colombia', 'San Andrés y Providencia', 'P.O. Box 549, 3170 Pellentesque, Rd.', '76', '76', 'nulla.Integer.vulputate@metus.', '16820601 7496', '16311106 5474', '16600224 9925', null, '1', '1', '2020-07-09 00:00:00', '2020-08-10 00:00:00');
INSERT INTO `alumno` VALUES ('73', 'Mejia', 'Rogers', 'Sheila', 'Clementine', '1', '24101764', 'F', '2019-09-09', 'Colombia', 'GUV', 'Ap #893-5064 Fringilla Ave', '76', '76', 'dis.parturient@scelerisquenequ', '16440421 8846', '16241227 7994', '16950310 5034', null, '1', '1', '2020-11-19 00:00:00', '2021-05-09 00:00:00');
INSERT INTO `alumno` VALUES ('74', 'Beasley', 'Grant', 'Pearl', 'TaShya', '1', '7398340', 'F', '2020-06-15', 'Colombia', 'Magdalena', '1579 Pellentesque, Street', '76', '76', 'ornare.lectus@sagittissemper.c', '16420605 8341', '16111018 5475', '16070923 0890', null, '1', '1', '2021-04-23 00:00:00', '2020-11-11 00:00:00');
INSERT INTO `alumno` VALUES ('75', 'Logan', 'Macias', 'Yvonne', 'Lacey', '1', '17982038', 'F', '2020-01-12', 'Colombia', 'BOL', '4250 Nunc Av.', '76', '76', 'ut.aliquam@necenim.ca', '16871219 4458', '16821227 7456', '16850419 6034', null, '1', '1', '2019-11-30 00:00:00', '2019-08-11 00:00:00');
INSERT INTO `alumno` VALUES ('76', 'Mckenzie', 'Solomon', 'Micah', 'Jasmine', '1', '35644080', 'M', '2019-08-02', 'Colombia', 'Huila', 'Ap #509-8120 Augue Avenue', '76', '76', 'a.odio@faucibus.edu', '16900226 6667', '16830209 1957', '16160219 7798', null, '1', '1', '2020-08-17 00:00:00', '2020-09-24 00:00:00');
INSERT INTO `alumno` VALUES ('77', 'Richardson', 'Ruiz', 'Micah', 'Kasper', '1', '24942606', 'F', '2020-02-04', 'Colombia', 'LAG', 'P.O. Box 402, 616 Interdum. Rd.', '76', '76', 'diam.lorem.auctor@justoeu.co.u', '16920430 0082', '16270826 6081', '16540710 0428', null, '1', '1', '2020-11-06 00:00:00', '2020-08-07 00:00:00');
INSERT INTO `alumno` VALUES ('78', 'Jones', 'Mccarthy', 'Steel', 'Aquila', '1', '13071130', 'M', '2021-05-10', 'Colombia', 'VAC', '629-2226 Aenean Rd.', '76', '76', 'vel.pede.blandit@diamProindolo', '16310710 4212', '16850619 8178', '16851106 9422', null, '1', '1', '2020-08-24 00:00:00', '2021-04-13 00:00:00');
INSERT INTO `alumno` VALUES ('79', 'Dalton', 'Conway', 'Zane', 'Kylan', '1', '34157110', 'M', '2020-03-14', 'Colombia', 'Quindío', '683-1060 Convallis Rd.', '76', '76', 'parturient.montes@consectetuer', '16320428 7787', '16510811 2953', '16000718 7586', null, '1', '1', '2021-02-20 00:00:00', '2019-07-21 00:00:00');
INSERT INTO `alumno` VALUES ('80', 'Cantrell', 'Whitney', 'Ryder', 'Carla', '2', '7555315', 'F', '2020-01-07', 'Colombia', 'ANT', '332-6593 Ante Street', '76', '76', 'Curae@estNuncullamcorper.org', '16550519 1873', '16720114 0287', '16100710 7640', null, '1', '1', '2020-08-21 00:00:00', '2020-06-16 00:00:00');
INSERT INTO `alumno` VALUES ('81', 'Carey', 'Strong', 'Tanner', 'Unity', '2', '29755411', 'M', '2020-09-02', 'Colombia', 'Distrito Capital', 'Ap #691-596 Adipiscing Avenue', '76', '76', 'nec.mollis@inconsequat.co.uk', '16370506 4743', '16141128 3029', '16651109 1735', null, '1', '1', '2020-11-16 00:00:00', '2020-08-27 00:00:00');
INSERT INTO `alumno` VALUES ('82', 'Tyler', 'Andrews', 'Germane', 'Tamara', '2', '15229388', 'M', '2019-08-18', 'Colombia', 'Vichada', 'P.O. Box 861, 6786 Nibh Road', '76', '76', 'suscipit.est@dapibus.edu', '16891215 4526', '16091113 7024', '16160603 3635', null, '1', '1', '2020-02-29 00:00:00', '2019-09-04 00:00:00');
INSERT INTO `alumno` VALUES ('83', 'Mosley', 'Reese', 'Hayfa', 'Kato', '2', '36677891', 'F', '2021-04-28', 'Colombia', 'Chocó', '544-2383 Facilisis Avenue', '76', '76', 'Sed@Aenean.net', '16540921 2098', '16990625 8240', '16490204 9834', null, '1', '1', '2020-01-22 00:00:00', '2020-01-10 00:00:00');
INSERT INTO `alumno` VALUES ('84', 'Delaney', 'Nielsen', 'Adena', 'Nigel', '2', '25418971', 'M', '2021-01-04', 'Colombia', 'VID', 'Ap #447-7268 Nec Av.', '76', '76', 'magna.tellus@morbitristiquesen', '16651220 7736', '16940609 9805', '16040406 1665', null, '1', '1', '2020-05-04 00:00:00', '2019-10-16 00:00:00');
INSERT INTO `alumno` VALUES ('85', 'Phelps', 'Pennington', 'Jael', 'Brenna', '2', '44071402', 'F', '2021-05-31', 'Colombia', 'ATL', '890-724 Orci Ave', '76', '76', 'accumsan.convallis@Aliquamgrav', '16980905 5651', '16820820 3169', '16561001 9696', null, '1', '1', '2020-11-10 00:00:00', '2021-06-26 00:00:00');
INSERT INTO `alumno` VALUES ('86', 'Finley', 'Silva', 'Ulla', 'Steven', '2', '27670996', 'F', '2020-08-11', 'Colombia', 'NSA', 'Ap #235-7670 Sed Road', '76', '76', 'elit.pretium.et@dolortempusnon', '16071208 0555', '16150617 1089', '16270226 5030', null, '1', '1', '2021-03-29 00:00:00', '2021-03-28 00:00:00');
INSERT INTO `alumno` VALUES ('87', 'Armstrong', 'Morgan', 'Rafael', 'Deacon', '2', '11839084', 'F', '2019-11-14', 'Colombia', 'VAC', 'P.O. Box 216, 144 Natoque Rd.', '76', '76', 'Suspendisse.sagittis@Proin.org', '16600213 7427', '16061230 3750', '16031005 5728', null, '1', '1', '2019-10-05 00:00:00', '2020-05-24 00:00:00');
INSERT INTO `alumno` VALUES ('88', 'Howard', 'Douglas', 'Norman', 'Julie', '2', '35246627', 'M', '2019-11-13', 'Colombia', 'SUC', '6295 Auctor Rd.', '76', '76', 'tempus@nascetur.edu', '16031013 5090', '16141106 3991', '16080824 9007', null, '1', '1', '2020-11-02 00:00:00', '2020-04-03 00:00:00');
INSERT INTO `alumno` VALUES ('89', 'Blevins', 'Holland', 'Garrison', 'Ray', '2', '45687550', 'F', '2021-01-08', 'Colombia', 'Caldas', 'P.O. Box 265, 6069 Penatibus Road', '76', '76', 'velit.Pellentesque@Loremipsum.', '16410818 6828', '16161203 8669', '16600322 7474', null, '1', '1', '2020-09-24 00:00:00', '2020-11-29 00:00:00');
INSERT INTO `alumno` VALUES ('90', 'Burns', 'Maxwell', 'Carolyn', 'Mikayla', '1', '28957779', 'F', '2019-11-29', 'Colombia', 'CAU', '4057 Rutrum Rd.', '76', '76', 'eros@acturpis.net', '16570625 8091', '16980420 7018', '16131125 7354', null, '1', '1', '2020-06-11 00:00:00', '2021-04-30 00:00:00');
INSERT INTO `alumno` VALUES ('91', 'Marquez', 'Blanchard', 'Arsenio', 'Michael', '1', '7349132', 'M', '2020-03-26', 'Colombia', 'Vaupés', '267-2080 Erat, Ave', '76', '76', 'eu.placerat@lectus.ca', '16200913 3360', '16500117 7004', '16500312 9458', null, '1', '1', '2020-12-05 00:00:00', '2020-08-27 00:00:00');
INSERT INTO `alumno` VALUES ('92', 'Leblanc', 'Gonzales', 'Rogan', 'Chaney', '1', '35066001', 'M', '2019-09-16', 'Colombia', 'NSA', 'P.O. Box 242, 1692 Vel St.', '76', '76', 'malesuada.vel@felis.edu', '16440921 7165', '16320812 4705', '16661115 1553', null, '1', '1', '2020-06-18 00:00:00', '2019-12-16 00:00:00');
INSERT INTO `alumno` VALUES ('93', 'Noble', 'Barker', 'Vivian', 'Isaac', '1', '11835793', 'M', '2020-08-01', 'Colombia', 'Caldas', '206-7564 Est Street', '76', '76', 'aliquam.enim.nec@inceptos.com', '16860827 7664', '16311207 4939', '16380130 5115', null, '1', '1', '2019-09-16 00:00:00', '2019-07-22 00:00:00');
INSERT INTO `alumno` VALUES ('94', 'Collier', 'Cross', 'Vielka', 'Rhona', '1', '18110659', 'M', '2020-10-27', 'Colombia', 'Bolívar', '511-4881 Vitae Ave', '76', '76', 'sodales.Mauris@Loremipsumdolor', '16290330 0172', '16531203 4233', '16310526 2814', null, '1', '1', '2020-12-28 00:00:00', '2019-12-28 00:00:00');
INSERT INTO `alumno` VALUES ('95', 'Beach', 'Barber', 'Breanna', 'Alyssa', '1', '30513362', 'F', '2021-04-16', 'Colombia', 'GUV', 'P.O. Box 239, 547 Nam Rd.', '76', '76', 'natoque.penatibus.et@luctusvul', '16920501 6075', '16630604 9880', '16441023 7699', null, '1', '1', '2020-09-03 00:00:00', '2020-06-26 00:00:00');
INSERT INTO `alumno` VALUES ('96', 'Stafford', 'Torres', 'Rose', 'Hayley', '1', '16024957', 'M', '2020-08-27', 'Colombia', 'Distrito Capital', 'P.O. Box 848, 1226 Lorem. Rd.', '76', '76', 'non.quam.Pellentesque@Vivamuse', '16561117 7972', '16690428 3477', '16380325 0533', null, '1', '1', '2019-12-25 00:00:00', '2020-06-20 00:00:00');
INSERT INTO `alumno` VALUES ('97', 'Tucker', 'Hayden', 'Tad', 'Elmo', '1', '32876947', 'M', '2020-11-07', 'Colombia', 'CES', '419-3949 Aptent Av.', '76', '76', 'ac@dui.co.uk', '16130305 5923', '16540222 2979', '16420405 5422', null, '1', '1', '2020-10-01 00:00:00', '2020-04-05 00:00:00');
INSERT INTO `alumno` VALUES ('98', 'Sheppard', 'Cooke', 'Gage', 'Lacy', '1', '29734042', 'M', '2019-11-08', 'Colombia', 'MET', '402-773 Tempor Avenue', '76', '76', 'eu.tempor@Namligulaelit.edu', '16450821 6472', '16551006 5427', '16800609 3812', null, '1', '1', '2021-03-31 00:00:00', '2019-12-03 00:00:00');
INSERT INTO `alumno` VALUES ('99', 'Walter', 'Bauer', 'Darryl', 'Rhiannon', '1', '44267588', 'F', '2020-03-06', 'Colombia', 'Santander', 'Ap #256-8662 Orci St.', '76', '76', 'rutrum.eu@Nulla.co.uk', '16701114 8801', '16800430 7743', '16311202 0890', null, '1', '1', '2020-09-25 00:00:00', '2021-01-04 00:00:00');
INSERT INTO `alumno` VALUES ('100', 'Morin', 'Briggs', 'Mia', 'Reece', '2', '22580597', 'M', '2021-02-28', 'Colombia', 'Cauca', '391-501 Porttitor Street', '76', '76', 'gravida.mauris@Morbi.net', '16140901 6316', '16300109 6100', '16930514 8000', null, '1', '1', '2020-02-11 00:00:00', '2019-10-14 00:00:00');
INSERT INTO `alumno` VALUES ('101', 'Pena', 'Farmer', 'Miranda', 'Cheyenne', '2', '38686674', 'M', '2021-02-20', 'Colombia', 'Atlántico', 'P.O. Box 116, 3294 Amet Av.', '76', '76', 'tincidunt.nunc@nunc.edu', '16600525 7818', '16170612 9333', '16451022 1791', null, '1', '1', '2021-05-06 00:00:00', '2020-03-13 00:00:00');
INSERT INTO `alumno` VALUES ('102', 'Neal', 'Hensley', 'Kimberly', 'Wayne', '2', '42591517', 'F', '2019-07-14', 'Colombia', 'Caldas', 'Ap #957-1079 Suspendisse Ave', '76', '76', 'augue.ac.ipsum@nequesed.org', '16181121 0846', '16770413 7285', '16421219 0203', null, '1', '1', '2019-10-31 00:00:00', '2020-06-13 00:00:00');
INSERT INTO `alumno` VALUES ('103', 'Allen', 'Cline', 'Hu', 'Jonas', '2', '39744371', 'M', '2020-11-22', 'Colombia', 'Chocó', '741-3480 Ut St.', '76', '76', 'amet@anunc.org', '16100317 7480', '16240226 8086', '16830806 8991', null, '1', '1', '2020-05-13 00:00:00', '2020-01-30 00:00:00');
INSERT INTO `alumno` VALUES ('104', 'Sears', 'Ware', 'Olympia', 'Marshall', '2', '25819508', 'M', '2020-02-10', 'Colombia', 'ARA', 'Ap #533-9876 Nullam Rd.', '76', '76', 'nec.ante@nonluctussit.org', '16560726 9924', '16610505 6870', '16760714 3182', null, '1', '1', '2019-08-26 00:00:00', '2020-08-09 00:00:00');
INSERT INTO `alumno` VALUES ('105', 'Ashley', 'Bond', 'Dora', 'Myra', '2', '17675094', 'F', '2020-09-13', 'Colombia', 'Cauca', '5570 Quam, Ave', '76', '76', 'Nulla@massaMauris.org', '16581201 7217', '16590903 1477', '16830804 3549', null, '1', '1', '2021-06-12 00:00:00', '2020-01-30 00:00:00');
INSERT INTO `alumno` VALUES ('106', 'Thornton', 'Sweet', 'Rafael', 'Cody', '2', '32309198', 'M', '2020-08-07', 'Colombia', 'MAG', 'Ap #358-852 Sed Ave', '76', '76', 'et@In.net', '16440821 8545', '16041118 4948', '16830607 1567', null, '1', '1', '2020-11-01 00:00:00', '2020-11-05 00:00:00');
INSERT INTO `alumno` VALUES ('107', 'Andrews', 'Hill', 'Zoe', 'Maryam', '2', '34339843', 'M', '2020-11-02', 'Colombia', 'PUT', '735-5726 Tristique Rd.', '76', '76', 'lacinia.mattis@ac.edu', '16910112 4973', '16130928 4071', '16040103 2990', null, '1', '1', '2019-10-06 00:00:00', '2021-01-11 00:00:00');
INSERT INTO `alumno` VALUES ('108', 'Rollins', 'Miles', 'Kaitlin', 'Penelope', '2', '44726169', 'M', '2021-02-26', 'Colombia', 'CES', '9949 Magnis Rd.', '76', '76', 'Nunc.commodo@quislectus.edu', '16341026 4927', '16791230 1707', '16710419 4191', null, '1', '1', '2019-07-29 00:00:00', '2020-11-11 00:00:00');
INSERT INTO `alumno` VALUES ('109', 'Keller', 'Witt', 'Kelsey', 'Jasmine', '2', '25264831', 'F', '2020-03-18', 'Colombia', 'Sucre', '5426 Luctus Road', '76', '76', 'ultricies.ligula.Nullam@elitph', '16290813 4303', '16881203 9223', '16670503 0960', null, '1', '1', '2020-09-23 00:00:00', '2020-10-28 00:00:00');
INSERT INTO `alumno` VALUES ('112', 'chavez', 'gonzalez', 'cecili', 'cristina', '1', '123444444', 'F', '2002-02-08', 'Colombiana', 'Cali', 'Calle 23 con 2', '76', '76', 'cecilio@gmail.com', '342424242423', '34244222', '535355', null, '1', '1', '2020-08-21 03:24:19', '2020-08-21 03:24:19');
INSERT INTO `alumno` VALUES ('113', 'zzzzzzzzz', 'zzzzzzzz', 'zzzz', 'zzzz', '1', 'zzzzzzzz', 'M', '2019-02-06', 'zzz', 'zzz', 'zzzz', '17', '76', 'lghgfaf@gmail.com', 'sss', 'sssss', 'sss', 'sss', '1', '1', '2020-09-02 11:14:55', '2020-09-02 11:14:55');
INSERT INTO `alumno` VALUES ('114', 'zzzzzzzzz', 'zzzzzzzz', 'zzzz', 'zzzz', '1', 'zzzzzzzz', 'M', '2019-02-06', 'zzz', 'zzz', 'zzzz', '17', '76', 'lghgfaf@gmail.com', 'sss', 'sssss', 'sss', 'sss', '1', '1', '2020-09-02 11:16:21', '2020-09-02 11:16:21');
INSERT INTO `alumno` VALUES ('115', 'zzzzzzzzz', 'zzzzzzzz', 'zzzz', 'zzzz', '1', 'zzzzzzzz', 'M', '2019-02-06', 'zzz', 'zzz', 'zzzz', '17', '76', 'lghgfaf@gmail.com', 'sss', 'sssss', 'sss', 'sss', '1', '1', '2020-09-02 11:17:22', '2020-09-02 11:17:22');
INSERT INTO `alumno` VALUES ('116', 'zzzzzzzzz', 'zzzzzzzz', 'zzzz', 'zzzz', '1', 'zzzzzzzz', 'M', '2019-02-06', 'zzz', 'zzz', 'zzzz', '17', '76', 'lghgfaf@gmail.com', 'sss', 'sssss', 'sss', 'sss', '1', '1', '2020-09-02 11:18:46', '2020-09-02 11:18:46');
INSERT INTO `alumno` VALUES ('117', 'zzzzzzzzz', 'zzzzzzzz', 'zzzz', 'zzzz', '1', 'zzzzzzzz', 'M', '2019-02-06', 'zzz', 'zzz', 'zzzz', '17', '76', 'lghgfaf@gmail.com', 'sss', 'sssss', 'sss', 'sss', '1', '1', '2020-09-02 11:19:09', '2020-09-02 11:19:09');
INSERT INTO `alumno` VALUES ('118', 'mastrollani', 'azuaje', 'jean', 'piero', '1', '5432543', 'M', '2013-02-06', 'colombiana', 'cali', 'fdffsdfs', '5', '76', 'li@gmail.com', '6346636', '6346346436', null, null, '1', '1', '2020-09-03 00:53:17', '2020-09-03 00:53:17');

-- ----------------------------
-- Table structure for alumno_materia
-- ----------------------------
DROP TABLE IF EXISTS `alumno_materia`;
CREATE TABLE `alumno_materia` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_calendario` int(11) NOT NULL,
  `id_alumno` int(11) NOT NULL,
  `id_grado` int(11) NOT NULL,
  `id_materia` int(11) NOT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=210 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of alumno_materia
-- ----------------------------
INSERT INTO `alumno_materia` VALUES ('165', '1', '15', '4', '14', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('167', '1', '23', '4', '14', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('168', '1', '2', '4', '14', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('169', '1', '17', '4', '14', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('170', '1', '1', '4', '14', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('173', '1', '23', '4', '7', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('174', '1', '2', '4', '7', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('175', '1', '17', '4', '7', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('177', '1', '15', '4', '19', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('178', '1', '16', '4', '19', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('179', '1', '23', '4', '19', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('180', '1', '2', '4', '19', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('181', '1', '17', '4', '19', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('182', '1', '1', '4', '19', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('183', '1', '15', '4', '17', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('185', '1', '23', '4', '17', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('186', '1', '2', '4', '17', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('187', '1', '17', '4', '17', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('188', '1', '1', '4', '17', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('189', '1', '15', '4', '15', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('191', '1', '23', '4', '15', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('192', '1', '2', '4', '15', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('193', '1', '17', '4', '15', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('194', '1', '1', '4', '15', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('197', '1', '16', '4', '7', null, '1', '1', '2020-07-21 00:59:28', '2020-07-21 00:59:28');
INSERT INTO `alumno_materia` VALUES ('199', '1', '15', '4', '7', null, '1', '1', '2020-07-21 01:00:53', '2020-07-21 01:00:53');
INSERT INTO `alumno_materia` VALUES ('200', '1', '16', '4', '15', null, '1', '1', '2020-07-21 19:50:26', '2020-07-21 19:50:26');
INSERT INTO `alumno_materia` VALUES ('201', '1', '16', '4', '14', null, '1', '1', '2020-08-06 19:12:02', '2020-08-06 19:12:02');
INSERT INTO `alumno_materia` VALUES ('203', '1', '1', '4', '7', null, '1', '1', '2020-08-17 23:57:01', '2020-08-17 23:57:01');
INSERT INTO `alumno_materia` VALUES ('204', '1', '24', '4', '14', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('205', '1', '24', '4', '15', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('206', '1', '24', '4', '19', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('207', '1', '24', '4', '7', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('208', '1', '24', '4', '17', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('209', '1', '24', '4', '16', null, '1', '1', null, null);

-- ----------------------------
-- Table structure for alumno_pariente
-- ----------------------------
DROP TABLE IF EXISTS `alumno_pariente`;
CREATE TABLE `alumno_pariente` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_alumno` int(11) NOT NULL,
  `id_pariente` int(11) NOT NULL,
  `bo_acudiente` tinyint(1) NOT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of alumno_pariente
-- ----------------------------
INSERT INTO `alumno_pariente` VALUES ('10', '1', '2', '1', null, '1', '1', '2020-07-25 18:53:44', '2020-07-25 18:53:44');
INSERT INTO `alumno_pariente` VALUES ('11', '2', '1', '1', null, '1', '1', '2020-07-25 18:59:33', '2020-07-25 18:59:33');
INSERT INTO `alumno_pariente` VALUES ('12', '2', '2', '1', null, '1', '1', '2020-07-25 18:59:42', '2020-07-25 18:59:42');
INSERT INTO `alumno_pariente` VALUES ('24', '80', '6', '1', null, '1', '1', '2020-07-27 15:45:41', '2020-07-27 15:45:41');
INSERT INTO `alumno_pariente` VALUES ('26', '1', '1', '1', null, '1', '1', '2020-07-29 01:54:45', '2020-07-29 01:54:45');
INSERT INTO `alumno_pariente` VALUES ('28', '15', '1', '1', null, '1', '1', '2020-07-31 03:55:00', '2020-07-31 03:55:00');
INSERT INTO `alumno_pariente` VALUES ('29', '17', '1', '1', null, '1', '1', '2020-07-31 03:56:35', '2020-07-31 03:56:35');
INSERT INTO `alumno_pariente` VALUES ('32', '17', '7', '1', null, '1', '1', '2020-09-03 01:16:09', '2020-09-03 01:16:09');

-- ----------------------------
-- Table structure for archivo
-- ----------------------------
DROP TABLE IF EXISTS `archivo`;
CREATE TABLE `archivo` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_archivo` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `id_tipo_archivo` int(11) NOT NULL,
  `tx_origen_id` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tx_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tx_mimetype` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of archivo
-- ----------------------------
INSERT INTO `archivo` VALUES ('18', 'Archivo Prueba', '1', '21', '1593453680_es-cv-143.pptx', 'PowerPoint', 'Descripcion Prueba', '1', '1', '2020-06-29 18:01:20', '2020-06-29 18:01:20');
INSERT INTO `archivo` VALUES ('24', 'Libro Prueba', '8', '1', '1593648672_DAO Readme.txt', 'Texto', 'Descripcion del Libro', '1', '1', '2020-07-02 00:11:12', '2020-07-02 02:25:02');
INSERT INTO `archivo` VALUES ('25', 'Libro Texto 1 Grado', '8', '1', '1593656676_Integra-Sociales.pdf', 'PDF', 'Integra Sociales', '1', '1', '2020-07-02 02:24:36', '2020-07-02 02:24:36');
INSERT INTO `archivo` VALUES ('26', 'Prueba', '8', '1', '1593797727_cotizar.xlsx', 'Excel', 'Prueba Observaciones', '1', '1', '2020-07-03 17:35:27', '2020-07-03 17:35:27');
INSERT INTO `archivo` VALUES ('28', 'hhdf', '2', '10', '1594049722_DAO Readme.txt', 'Texto', 'hdfhdhd', '1', '1', '2020-07-06 15:35:22', '2020-07-06 15:35:22');
INSERT INTO `archivo` VALUES ('29', 'virtualin', '10', '3', '1596209029_Presentamos a Virtualin Plataforma Escolar2.mp4', 'Video', 'prueba', '1', '1', '2020-07-31 15:23:49', '2020-07-31 15:23:49');
INSERT INTO `archivo` VALUES ('30', 'Guia', '2', '26', '1599410641_001 Sumas de 1 digito para primer grado fácil.pdf', 'PDF', 'Guia', '1', '1', '2020-09-06 16:44:01', '2020-09-06 16:44:01');
INSERT INTO `archivo` VALUES ('31', 'Tarea 2', '11', '26', '1599508370_001 Sumas de 1 digito para primer grado fácil.pdf', 'PDF', null, '1', '1', '2020-09-07 19:52:50', '2020-09-07 19:52:50');
INSERT INTO `archivo` VALUES ('33', 'tarea 3', '11', '32', '1599568865_Documento sin título (1).pdf', 'PDF', null, '1', '1', '2020-09-08 12:41:05', '2020-09-08 12:41:05');

-- ----------------------------
-- Table structure for area_estudio
-- ----------------------------
DROP TABLE IF EXISTS `area_estudio`;
CREATE TABLE `area_estudio` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_area_estudio` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tx_color` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of area_estudio
-- ----------------------------
INSERT INTO `area_estudio` VALUES ('1', 'Ciencias Sociales', 'purple', null, '1', '1', '2020-05-16 06:02:50', '2020-05-16 06:02:50');
INSERT INTO `area_estudio` VALUES ('2', 'Ciencias Básicas', 'indigo', null, '1', '1', '2020-05-16 06:03:42', '2020-05-16 06:03:42');
INSERT INTO `area_estudio` VALUES ('3', 'Ciencias Aplicadas', 'teal', null, '1', '1', '2020-05-16 06:09:28', '2020-05-16 06:09:28');
INSERT INTO `area_estudio` VALUES ('4', 'Humanidades', 'blue-grey', null, '1', '1', '2020-05-16 06:10:31', '2020-05-23 05:44:20');
INSERT INTO `area_estudio` VALUES ('5', 'Matemáticas', 'amber', null, '1', '1', '2020-05-16 06:06:05', '2020-05-16 06:06:05');
INSERT INTO `area_estudio` VALUES ('6', 'Idiomas', 'deep-orange', null, '1', '1', '2020-05-16 15:49:35', '2020-05-16 15:49:35');
INSERT INTO `area_estudio` VALUES ('7', 'Educación Religiosa y Moral', 'pink', null, '1', '1', '2020-05-16 16:14:57', '2020-05-22 21:40:39');
INSERT INTO `area_estudio` VALUES ('8', 'Educación Física y Deporte', 'brown', null, '1', '1', '2020-05-16 16:15:28', '2020-05-16 16:15:28');
INSERT INTO `area_estudio` VALUES ('9', 'Educación Estética y Artistica', 'deep-purple', null, '1', '1', '2020-05-16 16:32:18', '2020-05-16 16:32:33');

-- ----------------------------
-- Table structure for asistente
-- ----------------------------
DROP TABLE IF EXISTS `asistente`;
CREATE TABLE `asistente` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_asistente` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_menu` int(11) NOT NULL,
  `tx_descripcion` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_color` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nu_orden` int(11) NOT NULL,
  `tx_grupo` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_observaciones` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of asistente
-- ----------------------------
INSERT INTO `asistente` VALUES ('1', 'Institucion', '7', 'Se define la informacion principal de la institucion que incluye logo, informacion  de contacto, ubiacion y directiva', 'deep-orange', '1', 'secretaria', 'Descripcion de la funcionalidad, observaciones y advertencias', '1', '1', '2020-09-02 00:09:03', '2020-09-02 15:04:45');
INSERT INTO `asistente` VALUES ('2', 'Tipo Colegio', '8', 'Descripcion de la tarea de especial cuidado para el funcionamiento del sistema\'', 'deep-orange', '3', 'secretaria', 'Descripcion de la funcionalidad, observaciones y advertencias', '1', '1', '2020-09-02 01:26:22', '2020-09-02 12:11:51');
INSERT INTO `asistente` VALUES ('3', 'Cargos', '9', 'Descripcion de la tarea de especial cuidado para el funcionamiento del sistema\'', 'deep-orange', '2', 'secretaria', 'Descripcion de la funcionalidad, observaciones y advertencias', '1', '1', '2020-09-02 01:32:11', '2020-09-02 12:11:51');
INSERT INTO `asistente` VALUES ('4', 'Tipo Directiva', '10', 'Descripcion de la tarea de especial cuidado para el funcionamiento del sistema\'', 'deep-orange', '4', 'secretaria', 'Descripcion de la funcionalidad, observaciones y advertencias', '1', '1', '2020-09-02 12:43:15', '2020-09-02 12:43:15');
INSERT INTO `asistente` VALUES ('5', 'Directiva', '11', 'Descripcion de la tarea de especial cuidado para el funcionamiento del sistema\'', 'deep-orange', '5', 'secretaria', 'Descripcion de la funcionalidad, observaciones y advertencias', '1', '1', '2020-09-02 12:43:44', '2020-09-02 12:43:44');
INSERT INTO `asistente` VALUES ('6', 'Empleados', '14', 'Descripcion de la tarea de especial cuidado para el funcionamiento del sistema\'', 'deep-orange', '6', 'secretaria', 'Descripcion de la funcionalidad, observaciones y advertencias', '1', '1', '2020-09-02 12:44:21', '2020-09-02 12:44:21');
INSERT INTO `asistente` VALUES ('7', 'Estructura', '12', 'Descripcion de la tarea de especial cuidado para el funcionamiento del sistema\'', 'deep-orange', '7', 'secretaria', 'Descripcion de la funcionalidad, observaciones y advertencias', '1', '1', '2020-09-02 12:44:36', '2020-09-02 12:44:36');
INSERT INTO `asistente` VALUES ('8', 'Aulas', '13', 'Descripcion de la tarea de especial cuidado para el funcionamiento del sistema\'', 'deep-orange', '8', 'secretaria', 'Descripcion de la funcionalidad, observaciones y advertencias', '1', '1', '2020-09-02 12:44:54', '2020-09-02 12:44:54');
INSERT INTO `asistente` VALUES ('9', 'Calendario', '15', 'Descripcion de la tarea de especial cuidado para el funcionamiento del sistema\'', 'teal', '9', 'secretaria', 'Descripcion de la funcionalidad, observaciones y advertencias', '1', '1', '2020-09-02 12:45:10', '2020-09-02 12:45:10');
INSERT INTO `asistente` VALUES ('10', 'Periodos', '16', 'Descripcion de la tarea de especial cuidado para el funcionamiento del sistema\'', 'teal', '10', 'secretaria', 'Descripcion de la funcionalidad, observaciones y advertencias', '1', '1', '2020-09-02 12:45:25', '2020-09-02 12:45:25');
INSERT INTO `asistente` VALUES ('11', 'Turnos', '21', 'Descripcion de la tarea de especial cuidado para el funcionamiento del sistema\'', 'teal', '11', 'secretaria', 'Descripcion de la funcionalidad, observaciones y advertencias', '1', '1', '2020-09-02 12:45:38', '2020-09-02 12:45:38');
INSERT INTO `asistente` VALUES ('12', 'Horas Academicas', '22', 'Descripcion de la tarea de especial cuidado para el funcionamiento del sistema\'', 'teal', '12', 'secretaria', 'Descripcion de la funcionalidad, observaciones y advertencias', '1', '1', '2020-09-02 12:45:51', '2020-09-02 12:45:51');
INSERT INTO `asistente` VALUES ('13', 'Carga Horaria', '23', 'Descripcion de la tarea de especial cuidado para el funcionamiento del sistema\'', 'teal', '13', 'secretaria', 'Descripcion de la funcionalidad, observaciones y advertencias', '1', '1', '2020-09-02 12:46:33', '2020-09-02 12:46:33');
INSERT INTO `asistente` VALUES ('14', 'Areas de Estudio', '27', 'Descripcion de la tarea de especial cuidado para el funcionamiento del sistema\'', 'cyan', '14', 'secretaria', 'Descripcion de la funcionalidad, observaciones y advertencias', '1', '1', '2020-09-02 12:46:47', '2020-09-02 12:46:47');
INSERT INTO `asistente` VALUES ('15', 'Materias', '28', 'Descripcion de la tarea de especial cuidado para el funcionamiento del sistema\'', 'cyan', '15', 'secretaria', 'Descripcion de la funcionalidad, observaciones y advertencias', '1', '1', '2020-09-02 12:47:03', '2020-09-02 12:47:03');
INSERT INTO `asistente` VALUES ('16', 'Niveles', '24', 'Descripcion de la tarea de especial cuidado para el funcionamiento del sistema\'', 'cyan', '16', 'secretaria', 'Descripcion de la funcionalidad, observaciones y advertencias', '1', '1', '2020-09-02 12:47:30', '2020-09-02 12:47:30');
INSERT INTO `asistente` VALUES ('17', 'Grados', '25', 'Descripcion de la tarea de especial cuidado para el funcionamiento del sistema\'', 'cyan', '17', 'secretaria', 'Descripcion de la funcionalidad, observaciones y advertencias', '1', '1', '2020-09-02 12:47:55', '2020-09-02 12:47:55');
INSERT INTO `asistente` VALUES ('18', 'Grupos', '26', 'Descripcion de la tarea de especial cuidado para el funcionamiento del sistema\'', 'cyan', '18', 'secretaria', 'Descripcion de la funcionalidad, observaciones y advertencias', '1', '1', '2020-09-02 12:48:08', '2020-09-02 12:48:08');
INSERT INTO `asistente` VALUES ('19', 'Docente', '37', 'Descripcion de la tarea de especial cuidado para el funcionamiento del sistema\'', 'pink', '19', 'secretaria', 'Descripcion de la funcionalidad, observaciones y advertencias', '1', '1', '2020-09-02 12:48:30', '2020-09-02 12:48:30');
INSERT INTO `asistente` VALUES ('20', 'Tipo Evaluacion', '33', 'Descripcion de la tarea de especial cuidado para el funcionamiento del sistema\'', 'purple', '20', 'secretaria', 'Descripcion de la funcionalidad, observaciones y advertencias', '1', '1', '2020-09-02 12:48:57', '2020-09-02 12:48:57');
INSERT INTO `asistente` VALUES ('21', 'Plan Evaluacion', '35', 'Descripcion de la tarea de especial cuidado para el funcionamiento del sistema\'', 'purple', '21', 'secretaria', 'Descripcion de la funcionalidad, observaciones y advertencias', '1', '1', '2020-09-02 12:49:11', '2020-09-02 12:49:11');
INSERT INTO `asistente` VALUES ('22', 'Horario', '36', 'Descripcion de la tarea de especial cuidado para el funcionamiento del sistema\'', 'purple', '22', 'secretaria', 'Descripcion de la funcionalidad, observaciones y advertencias', '1', '1', '2020-09-02 12:49:29', '2020-09-02 12:49:29');
INSERT INTO `asistente` VALUES ('23', 'Grupo Calificaciones', '30', 'Descripcion de la tarea de especial cuidado para el funcionamiento del sistema\'', 'purple', '23', 'secretaria', 'Descripcion de la funcionalidad, observaciones y advertencias', '1', '1', '2020-09-02 12:50:05', '2020-09-02 12:50:05');
INSERT INTO `asistente` VALUES ('24', 'Nivel Calificaciones', '31', 'Descripcion de la tarea de especial cuidado para el funcionamiento del sistema\'', 'purple', '24', 'secretaria', 'Descripcion de la funcionalidad, observaciones y advertencias', '1', '1', '2020-09-02 12:50:43', '2020-09-02 12:50:43');
INSERT INTO `asistente` VALUES ('25', 'Calificacion', '32', 'Descripcion de la tarea de especial cuidado para el funcionamiento del sistema\'', 'purple', '25', 'secretaria', 'Descripcion de la funcionalidad, observaciones y advertencias', '1', '1', '2020-09-02 12:50:57', '2020-09-02 12:50:57');
INSERT INTO `asistente` VALUES ('26', 'Condicion Alumno', '38', 'Descripcion de la tarea de especial cuidado para el funcionamiento del sistema\'', 'pink', '26', 'secretaria', 'Descripcion de la funcionalidad, observaciones y advertencias', '1', '1', '2020-09-02 12:51:14', '2020-09-02 12:51:14');
INSERT INTO `asistente` VALUES ('27', 'Alumnos', '39', 'Descripcion de la tarea de especial cuidado para el funcionamiento del sistema\'', 'pink', '27', 'secretaria', 'Descripcion de la funcionalidad, observaciones y advertencias', '1', '1', '2020-09-02 12:56:02', '2020-09-02 12:56:02');
INSERT INTO `asistente` VALUES ('28', 'Acudiente', '40', 'Descripcion de la tarea de especial cuidado para el funcionamiento del sistema\'', 'pink', '28', 'secretaria', 'Descripcion de la funcionalidad, observaciones y advertencias', '1', '1', '2020-09-02 12:56:18', '2020-09-02 12:56:18');
INSERT INTO `asistente` VALUES ('29', 'Feriados', '17', 'Descripcion de la tarea de especial cuidado para el funcionamiento del sistema\'', 'teal', '29', 'secretaria', 'Descripcion de la funcionalidad, observaciones y advertencias', '1', '1', '2020-09-02 12:56:43', '2020-09-02 12:56:43');
INSERT INTO `asistente` VALUES ('30', 'Tipo Agenda', '18', 'Descripcion de la tarea de especial cuidado para el funcionamiento del sistema\'', 'teal', '30', 'secretaria', 'Descripcion de la funcionalidad, observaciones y advertencias', '1', '1', '2020-09-02 12:57:00', '2020-09-02 12:57:00');
INSERT INTO `asistente` VALUES ('31', 'Tipo Actividad', '19', 'Descripcion de la tarea de especial cuidado para el funcionamiento del sistema\'', 'teal', '31', 'secretaria', 'Descripcion de la funcionalidad, observaciones y advertencias', '1', '1', '2020-09-02 12:57:29', '2020-09-02 12:57:29');
INSERT INTO `asistente` VALUES ('32', 'Agenda', '20', 'Descripcion de la tarea de especial cuidado para el funcionamiento del sistema\'', 'teal', '32', 'secretaria', 'Descripcion de la funcionalidad, observaciones y advertencias', '1', '1', '2020-09-02 12:57:43', '2020-09-02 12:57:43');
INSERT INTO `asistente` VALUES ('33', 'Bandeja Docente', '3', 'Calendario de actividades semanales, calendario de actividades del colegio, panel de funcionalidades', 'indigo', '1', 'docente', 'Descripcion de la funcionalidad, observaciones y advertencias', '1', '1', '2020-09-02 12:59:32', '2020-09-02 12:59:32');
INSERT INTO `asistente` VALUES ('34', 'Bandeja Alumno', '4', 'Calendario de actividades semanales, calendario de actividades del colegio, panel de funcionalidades', 'amber', '1', 'alumno', 'Descripcion de la funcionalidad, observaciones y advertencias', '1', '1', '2020-09-02 13:00:59', '2020-09-02 13:01:20');
INSERT INTO `asistente` VALUES ('35', 'Bandeja Acudiente', '5', 'Calendario de actividades semanales, calendario de actividades del colegio, panel de funcionalidades', 'light-green', '1', 'acudiente', 'Descripcion de la funcionalidad, observaciones y advertencias', '1', '1', '2020-09-02 13:02:14', '2020-09-02 13:02:14');

-- ----------------------------
-- Table structure for asistente_detalle
-- ----------------------------
DROP TABLE IF EXISTS `asistente_detalle`;
CREATE TABLE `asistente_detalle` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tx_descripcion` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipo_detalle` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nu_orden` int(11) NOT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of asistente_detalle
-- ----------------------------

-- ----------------------------
-- Table structure for aula
-- ----------------------------
DROP TABLE IF EXISTS `aula`;
CREATE TABLE `aula` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_aula` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `id_estructura` int(11) NOT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of aula
-- ----------------------------
INSERT INTO `aula` VALUES ('1', 'Aula 133', '2', null, '1', '1', '2020-05-13 06:04:56', '2020-05-13 06:14:05');
INSERT INTO `aula` VALUES ('2', 'Aula 215', '3', null, '1', '1', '2020-05-13 06:13:48', '2020-05-13 06:13:48');
INSERT INTO `aula` VALUES ('3', 'Aula 310', '4', null, '1', '1', '2020-05-13 06:14:23', '2020-05-13 06:14:23');
INSERT INTO `aula` VALUES ('4', 'Laboratorio de Fisica', '6', null, '1', '1', '2020-05-13 06:14:46', '2020-05-13 18:47:07');
INSERT INTO `aula` VALUES ('5', 'Salon Computadoras', '5', null, '1', '1', '2020-05-13 06:16:45', '2020-05-13 06:26:22');
INSERT INTO `aula` VALUES ('6', 'Aula 111', '9', null, '1', '1', '2020-06-10 20:12:46', '2020-06-10 20:12:46');

-- ----------------------------
-- Table structure for barrio
-- ----------------------------
DROP TABLE IF EXISTS `barrio`;
CREATE TABLE `barrio` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `co_barrio` int(11) NOT NULL,
  `nb_barrio` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_comuna` int(11) NOT NULL,
  `tx_latitud` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_longitud` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `barrio_co_barrio_unique` (`co_barrio`)
) ENGINE=InnoDB AUTO_INCREMENT=391 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of barrio
-- ----------------------------
INSERT INTO `barrio` VALUES ('1', '1', 'Barrio Alto Aguacatal', '1', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('2', '2', 'Barrio Bajo Aguacatal', '1', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('3', '3', 'Barrio la Legua', '1', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('4', '4', 'Barrio Palmas I', '1', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('5', '5', 'Barrio Palmas II', '1', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('6', '6', 'Barrio Terrón Colorado I', '1', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('7', '7', 'Barrio Terrón Colorado II', '1', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('8', '8', 'Barrio Villa del Mar', '1', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('9', '9', 'El Barrio Bajo Palermo', '1', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('10', '10', 'El barrio Vista hermosa', '1', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('11', '11', 'Urbanización Aguacatal', '1', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('12', '12', 'Altos de Menga', '2', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('13', '13', 'Arboledas', '2', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('14', '14', 'Área Libre-Parque del Amor', '2', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('15', '15', 'Arroyohondo', '2', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('16', '16', 'Brisas de los Álamos', '2', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('17', '17', 'Centenario', '2', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('18', '18', 'Chipichape', '2', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('19', '19', 'Ciudad los Álamos', '2', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('20', '20', 'Dapa', '2', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('21', '21', 'El Bosque', '2', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('22', '22', 'Granada', '2', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('23', '23', 'Juanambú', '2', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('24', '24', 'La Campiña', '2', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('25', '25', 'La Flora', '2', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('26', '26', 'La Paz', '2', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('27', '27', 'Menga', '2', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('28', '28', 'Normandía', '2', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('29', '29', 'Pacará', '2', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('30', '30', 'Prados del Norte', '2', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('31', '31', 'San Vicente', '2', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('32', '32', 'Santa Mónica', '2', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('33', '33', 'Santa Rita', '2', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('34', '34', 'Santa Teresita', '2', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('35', '35', 'Sect Altos Normandía-Bataclán', '2', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('36', '36', 'Urbanización La Flora', '2', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('37', '37', 'Urbanización La Merced', '2', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('38', '38', 'Versalles', '2', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('39', '39', 'Vipasa', '2', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('40', '40', 'Acueducto San Antonio.', '3', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('41', '41', 'El Calvario.', '3', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('42', '42', 'El Hoyo.', '3', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('43', '43', 'El Nacional.', '3', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('44', '44', 'El Peñón.', '3', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('45', '45', 'El Piloto.', '3', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('46', '46', 'La Merced.', '3', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('47', '47', 'Los Libertadores.', '3', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('48', '48', 'Navarro-La Chanca.', '3', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('49', '49', 'San Antonio.', '3', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('50', '50', 'San Cayetano.', '3', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('51', '51', 'San Juan Bosco.', '3', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('52', '52', 'San Nicolás.', '3', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('53', '53', 'San Pascual.', '3', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('54', '54', 'San Pedro.', '3', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('55', '55', 'Santa Rosa.', '3', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('56', '56', 'Bolivariano', '4', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('57', '57', 'Bueno Madrid', '4', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('58', '58', 'Calima', '4', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('59', '59', 'Evaristo García', '4', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('60', '60', 'Fátima', '4', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('61', '61', 'Flora Industrial', '4', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('62', '62', 'Guillermo Valencia', '4', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('63', '63', 'Ignacio Rengifo', '4', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('64', '64', 'Industria de Licores', '4', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('65', '65', 'Jorge Isaacs', '4', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('66', '66', 'La Alianza', '4', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('67', '67', 'La Esmeralda', '4', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('68', '68', 'La Isla', '4', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('69', '69', 'Las Delicias', '4', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('70', '70', 'Manzanares', '4', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('71', '71', 'Marco Fidel Suárez', '4', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('72', '72', 'Olaya Herrera', '4', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('73', '73', 'Popular', '4', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('74', '74', 'Porvenir', '4', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('75', '75', 'Salomia', '4', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('76', '76', 'Santander', '4', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('77', '77', 'Sultana-Berlín-San Francisco', '4', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('78', '78', 'Bajo Salomia', '5', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('79', '79', 'Barrio Residencial el Bosque', '5', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('80', '80', 'Brisas de los Andes', '5', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('81', '81', 'Brisas del Guabito', '5', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('82', '82', 'Chiminangos 1.ª Etapa', '5', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('83', '83', 'Chiminangos 2.ª Etapa', '5', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('84', '84', 'El Sena', '5', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('85', '85', 'La Rivera II', '5', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('86', '86', 'Los Andes', '5', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('87', '87', 'Los Guayacanes', '5', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('88', '88', 'Metropolitano del Norte', '5', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('89', '89', 'Palmeras del norte', '5', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('90', '90', 'Paseo de los Almendros', '5', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('91', '91', 'Plazas Verdes', '5', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('92', '92', 'Santa Bárbara', '5', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('93', '93', 'Torres de Comfandi', '5', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('94', '94', 'Urbanización Barranquilla', '5', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('95', '95', 'Villa del Prado', '5', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('96', '96', 'Villa del Sol', '5', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('97', '97', 'Villas de Veracruz', '5', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('98', '98', 'Álamos', '6', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('99', '99', 'Calimio', '6', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('100', '100', 'FloraliaI', '6', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('101', '101', 'FloraliaI Sector II', '6', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('102', '102', 'FloraliaIA', '6', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('103', '103', 'FloraliaII', '6', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('104', '104', 'FloraliaIII', '6', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('105', '105', 'Fonaviemcali', '6', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('106', '106', 'Jorge Eliécer Gaitán', '6', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('107', '107', 'La Rivera I', '6', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('108', '108', 'Los Alcázares I', '6', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('109', '109', 'Los Alcázares II', '6', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('110', '110', 'Los Guadales', '6', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('111', '111', 'oasis de comfandi', '6', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('112', '112', 'Paso del Comercio', '6', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('113', '113', 'PetecuyI etapa', '6', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('114', '114', 'PetecuyII etapa', '6', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('115', '115', 'PetecuyIII etapa', '6', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('116', '116', 'popular', '6', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('117', '117', 'San Luís I', '6', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('118', '118', 'San Luís II', '6', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('119', '119', 'Alfonzo López 1.ª Etapa.', '7', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('120', '120', 'Alfonzo López 2.ª Etapa.', '7', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('121', '121', 'Alfonzo López 3.ª Etapa.', '7', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('122', '122', 'Andrés Sanin.', '7', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('123', '123', 'Base Aérea.', '7', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('124', '124', 'El Vivero', '7', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('125', '125', 'Fepicol.', '7', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('126', '126', 'La Playa.', '7', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('127', '127', 'Las Ceibas.', '7', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('128', '128', 'Las Veraneras.', '7', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('129', '129', 'Los Pinos.', '7', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('130', '130', 'Puerto Mallarino.', '7', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('131', '131', 'Puerto Nuevo.', '7', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('132', '132', 'San Marino.', '7', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('133', '133', 'Siete de Agosto.', '7', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('134', '134', 'Atanasio Girardot', '8', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('135', '135', 'Benjamín Herrera', '8', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('136', '136', 'Chapinero', '8', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('137', '137', 'El trébol', '8', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('138', '138', 'El troncal', '8', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('139', '139', 'Industrial', '8', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('140', '140', 'La Base', '8', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('141', '141', 'La Floresta', '8', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('142', '142', 'La Nueva Base', '8', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('143', '143', 'Las Américas', '8', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('144', '144', 'Municipal', '8', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('145', '145', 'Primitivo Crespo', '8', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('146', '146', 'Rafael Uribe Uribe', '8', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('147', '147', 'Saavedra Galindo', '8', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('148', '148', 'Santa Fe', '8', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('149', '149', 'Santa Mónica Popular', '8', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('150', '150', 'Simón Bolívar', '8', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('151', '151', 'Urbanización La Base', '8', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('152', '152', 'Villacolombia', '8', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('153', '153', 'Alameda', '9', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('154', '154', 'Aranjuez', '9', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('155', '155', 'Belalcázar', '9', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('156', '156', 'Bretaña', '9', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('157', '157', 'Guayaquil', '9', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('158', '158', 'Junín', '9', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('159', '159', 'Manuel María Buenaventura', '9', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('160', '160', 'Obrero', '9', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('161', '161', 'Santa Mónica Belalcázar', '9', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('162', '162', 'Sector La Luna', '9', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('163', '163', 'Sucre', '9', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('164', '164', 'Colseguros Andes', '10', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('165', '165', 'Cristóbal Colon', '10', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('166', '166', 'Departamental', '10', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('167', '167', 'El Dorado', '10', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('168', '168', 'Guabal', '10', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('169', '169', 'Jorge Zawadsky', '10', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('170', '170', 'La Libertad', '10', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('171', '171', 'La Selva', '10', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('172', '172', 'Las Acacias', '10', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('173', '173', 'Las Granjas', '10', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('174', '174', 'Olímpico', '10', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('175', '175', 'Panamericano', '10', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('176', '176', 'Pasamacho', '10', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('177', '177', 'San Cristóbal', '10', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('178', '178', 'San Judas Tadeo 1', '10', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('179', '179', 'San Judas Tadeo 2', '10', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('180', '180', 'Santa Elena', '10', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('181', '181', 'Santo Domingo', '10', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('182', '182', '20 de julio', '11', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('183', '183', 'Agua blanca', '11', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('184', '184', 'Ciudad Modelo', '11', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('185', '185', 'El jardín', '11', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('186', '186', 'El prado', '11', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('187', '187', 'El recuerdo', '11', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('188', '188', 'José Holguín Garcés', '11', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('189', '189', 'JoseMaría Córdoba', '11', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('190', '190', 'La Esperanza', '11', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('191', '191', 'La Fortaleza', '11', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('192', '192', 'La Independencia', '11', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('193', '193', 'La Primavera', '11', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('194', '194', 'León XIII', '11', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('195', '195', 'Los Conquistadores', '11', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('196', '196', 'Los Sauces', '11', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('197', '197', 'Maracaibo', '11', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('198', '198', 'Prados de Oriente', '11', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('199', '199', 'San Benito', '11', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('200', '200', 'San Carlos', '11', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('201', '201', 'San Pedro Claver', '11', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('202', '202', 'Urbanización Boyacá', '11', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('203', '203', 'Villa del Sur', '11', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('204', '204', 'villa nueva', '11', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('205', '205', 'Alfonso Barberena', '12', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('206', '206', 'Asturias', '12', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('207', '207', 'Bello Horizonte', '12', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('208', '208', 'Doce de Octubre', '12', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('209', '209', 'Eduardo Santos', '12', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('210', '210', 'El Paraíso', '12', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('211', '211', 'FenalcoKennedy', '12', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('212', '212', 'Julio Rincon', '12', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('213', '213', 'Nueva Floresta', '12', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('214', '214', 'Rodeo', '12', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('215', '215', 'Sindical', '12', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('216', '216', 'Villanueva', '12', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('217', '217', 'Calipso', '13', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('218', '218', 'Charco Azul', '13', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('219', '219', 'El Diamante', '13', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('220', '220', 'El Poblado I', '13', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('221', '221', 'El Poblado II', '13', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('222', '222', 'El Pondaje', '13', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('223', '223', 'El Vergel', '13', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('224', '224', 'La Paz', '13', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('225', '225', 'Lleras Restrepo', '13', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('226', '226', 'Lleras-Cinta larga', '13', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('227', '227', 'Los Comuneros II', '13', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('228', '228', 'Los Lagos I', '13', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('229', '229', 'Los Lagos II', '13', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('230', '230', 'Los Robles', '13', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('231', '231', 'Marroquín III', '13', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('232', '232', 'Nuevo Horizonte', '13', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('233', '233', 'Omar Torrijos', '13', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('234', '234', 'Ricardo Balcázar', '13', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('235', '235', 'Rodrigo Lara Bonilla', '13', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('236', '236', 'Sector Asprosocial–Diamante', '13', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('237', '237', 'Sector Laguna del Pondaje', '13', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('238', '238', 'Ulpiano Lloreda', '13', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('239', '239', 'Villa Blanca', '13', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('240', '240', 'Villa del Lago', '13', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('241', '241', 'Yira Castro', '13', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('242', '242', 'Alfonso Bonilla Aragon', '14', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('243', '243', 'Alirio Mora Beltrán', '14', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('244', '244', 'José Manuel Marroquín 1', '14', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('245', '245', 'José Manuel Marroquín 2', '14', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('246', '246', 'Las Orquídeas', '14', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('247', '247', 'Manuela Beltrán', '14', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('248', '248', 'Naranjos 1', '14', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('249', '249', 'Naranjos 2', '14', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('250', '250', 'Promociones Populares', '14', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('251', '251', 'Puertas del Sol', '14', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('252', '252', 'Bajos de Ciudad Córdob', '15', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('253', '253', 'Ciudad Córdoba', '15', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('254', '254', 'Comuneros I', '15', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('255', '255', 'Laureano Gómez', '15', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('256', '256', 'Mojica', '15', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('257', '257', 'Retiro', '15', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('258', '258', 'Vallado', '15', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('259', '259', 'Antonio Nariño', '16', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('260', '260', 'Brisas del Limonar', '16', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('261', '261', 'Ciudad 2000', '16', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('262', '262', 'La Alborada', '16', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('263', '263', 'Mariano Ramos', '16', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('264', '264', 'Republica de Israel', '16', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('265', '265', 'Unión de Vivienda Popular', '16', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('266', '266', 'Bosques del Limonar', '17', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('267', '267', 'Caney', '17', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('268', '268', 'Cañaverales', '17', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('269', '269', 'Ciudad Campestre', '17', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('270', '270', 'Ciudad Capri', '17', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('271', '271', 'Ciudad Universitaria', '17', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('272', '272', 'Ciudadela Comfandi', '17', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('273', '273', 'Ciudadela Paso ancho', '17', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('274', '274', 'Club Campestre', '17', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('275', '275', 'El Gran Limonar –Cataya', '17', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('276', '276', 'El Ingenio', '17', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('277', '277', 'El Limonar', '17', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('278', '278', 'La Hacienda', '17', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('279', '279', 'La Playa', '17', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('280', '280', 'La Selva', '17', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('281', '281', 'Las Quintas de don Simón', '17', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('282', '282', 'Las Vegas', '17', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('283', '283', 'Lili', '17', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('284', '284', 'Los Portales', '17', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('285', '285', 'Los Samanes', '17', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('286', '286', 'Mayapan', '17', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('287', '287', 'Nuevo Rey', '17', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('288', '288', 'Parcelaciones Pance', '17', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('289', '289', 'Prados del Limonar', '17', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('290', '290', 'Primero de Mayo', '17', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('291', '291', 'Santa Anita', '17', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('292', '292', 'Unicentro', '17', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('293', '293', 'Urbanización Ciudad Jardín', '17', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('294', '294', 'Urbanización Rio Lili', '17', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('295', '295', 'Urbanización San Joaquín', '17', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('296', '296', 'Alférez Real', '18', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('297', '297', 'Alto Nápoles', '18', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('298', '298', 'Buenos Aires', '18', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('299', '299', 'Caldas', '18', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('300', '300', 'Colinas del Sur', '18', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('301', '301', 'Cuarteles de Nápoles', '18', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('302', '302', 'El Jordán', '18', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('303', '303', 'Farallones', '18', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('304', '304', 'Francisco Eladio Ramírez', '18', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('305', '305', 'Horizontes', '18', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('306', '306', 'Los Chorros', '18', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('307', '307', 'Lourdes', '18', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('308', '308', 'Mario Correa Rengifo', '18', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('309', '309', 'Meléndez', '18', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('310', '310', 'Nápoles', '18', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('311', '311', 'Prados del Sur', '18', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('312', '312', 'Sector Alto Jordán', '18', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('313', '313', 'Bellavista', '19', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('314', '314', 'Cambulos', '19', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('315', '315', 'Camino Real Los Fundadores', '19', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('316', '316', 'Cañaveralejo', '19', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('317', '317', 'Champagnat', '19', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('318', '318', 'Cristales', '19', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('319', '319', 'Cuarto de Legua', '19', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('320', '320', 'El Cedro', '19', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('321', '321', 'El Lido', '19', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('322', '322', 'El Mortiñal', '19', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('323', '323', 'Eucarístico', '19', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('324', '324', 'Galindo', '19', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('325', '325', 'Guadalupe', '19', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('326', '326', 'La Cascada', '19', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('327', '327', 'Miraflores', '19', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('328', '328', 'Nuevo Tequendama', '19', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('329', '329', 'Pampa Linda', '19', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('330', '330', 'Plaza de Toros', '19', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('331', '331', 'Refugio', '19', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('332', '332', 'San Fernando Nuevo', '19', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('333', '333', 'San Fernando Viejo', '19', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('334', '334', 'Santa Bárbara', '19', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('335', '335', 'Santa Isabel', '19', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('336', '336', 'Sector Altos de Santa Isabel', '19', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('337', '337', 'Sector Bosque Municipal', '19', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('338', '338', 'Sector CañaveralejoGuadalupe', '19', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('339', '339', 'Sector la Patria Cañaveral', '19', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('340', '340', 'Tejares', '19', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('341', '341', 'Tres de Julio', '19', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('342', '342', 'Unidad Dep. Alberto Galindo', '19', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('343', '343', 'Unidad Panamericana', '19', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('344', '344', 'Unidad Residencial El Coliseo', '19', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('345', '345', 'Unidad Res. Santiago de Cali', '19', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('346', '346', 'Urbanización Colseguros', '19', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('347', '347', 'Urbanización Militar', '19', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('348', '348', 'Urbanización Nueva Granada', '19', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('349', '349', 'Urbanización Tequendama', '19', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('350', '350', 'Belén', '20', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('351', '351', 'Belisario Caicedo', '20', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('352', '352', 'Brisas de Mayo', '20', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('353', '353', 'Cementerio Carabineros', '20', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('354', '354', 'Cortijo', '20', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('355', '355', 'La Sultana', '20', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('356', '356', 'Lleras Camargo', '20', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('357', '357', 'Pueblo Joven', '20', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('358', '358', 'Siloe', '20', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('359', '359', 'Tierra Blanca', '20', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('360', '360', 'Urbanización Cañaveralejo', '20', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('361', '361', 'Urbanización Cortij', '20', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('362', '362', 'Urbanización Venezuela.', '20', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('363', '363', 'Venezuela', '20', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('364', '364', 'Calimio Desepaz', '21', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('365', '365', 'Ciudad Talanga', '21', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('366', '366', 'Ciudadela del Rio-CVC', '21', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('367', '367', 'Compartir', '21', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('368', '368', 'DesepazInvicali', '21', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('369', '369', 'Las Dalias', '21', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('370', '370', 'Las Garzas', '21', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('371', '371', 'Los Lideres', '21', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('372', '372', 'Pizamos 1', '21', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('373', '373', 'Pizamos 2', '21', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('374', '374', 'PizamosIII', '21', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('375', '375', 'Plantan Tto Puerto Mallarino', '21', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('376', '376', 'Potrero Grande', '21', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('377', '377', 'Remanso', '21', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('378', '378', 'Santa Clara', '21', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('379', '379', 'Valle Grande', '21', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('380', '380', 'Villa Luz', '21', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('381', '381', 'Villa mercedes I', '21', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('382', '382', 'Ciudad Campestre', '22', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('383', '383', 'Condominio Miramontes', '22', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('384', '384', 'Haciendas de Alferez', '22', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('385', '385', 'Jardín de Pance', '22', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('386', '386', 'Jockey Club', '22', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('387', '387', 'Reamansode Ciudad jardin', '22', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('388', '388', 'Urbanización ciudad Jardín', '22', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('389', '389', 'Urbanización Rio Lili', '22', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `barrio` VALUES ('390', '390', 'Verdanza', '22', '', '', null, '1', '1', '2020-02-02 00:00:00', '2020-02-02 00:00:00');

-- ----------------------------
-- Table structure for calendario
-- ----------------------------
DROP TABLE IF EXISTS `calendario`;
CREATE TABLE `calendario` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_calendario` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `aa_escolar` int(11) NOT NULL,
  `fe_inicio` date DEFAULT NULL,
  `fe_fin` date DEFAULT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of calendario
-- ----------------------------
INSERT INTO `calendario` VALUES ('1', '2019-2020', '2019', '2019-10-17', '2020-07-27', null, '2', '1', '2020-05-09 11:41:33', '2020-06-10 21:05:17');
INSERT INTO `calendario` VALUES ('2', '2020-2021', '2020', '2020-10-14', '2021-07-13', null, '1', '1', '2020-06-10 21:06:08', '2020-06-10 21:08:59');

-- ----------------------------
-- Table structure for calificacion
-- ----------------------------
DROP TABLE IF EXISTS `calificacion`;
CREATE TABLE `calificacion` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_calificacion` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nu_calificacion` decimal(8,2) DEFAULT NULL,
  `co_calificacion` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bo_aprobado` int(11) NOT NULL,
  `nu_orden` int(11) NOT NULL,
  `id_grupo_calificacion` int(11) NOT NULL,
  `id_tipo_calificacion` int(11) NOT NULL,
  `id_nivel_calificacion` int(11) NOT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of calificacion
-- ----------------------------
INSERT INTO `calificacion` VALUES ('1', 'F', '1.00', 'DE', '0', '1', '1', '1', '1', null, '1', '1', '2020-05-12 20:41:37', '2020-05-13 03:10:49');
INSERT INTO `calificacion` VALUES ('2', 'F', '2.00', 'DE', '0', '2', '1', '1', '1', null, '1', '1', '2020-05-13 01:47:57', '2020-05-13 03:34:07');
INSERT INTO `calificacion` VALUES ('3', 'F', '3.00', 'DE', '0', '3', '1', '1', '1', null, '1', '1', '2020-05-13 01:53:07', '2020-05-13 03:34:16');
INSERT INTO `calificacion` VALUES ('4', 'F', '4.00', 'DE', '0', '4', '1', '1', '1', null, '1', '1', '2020-05-13 01:55:15', '2020-05-13 03:34:47');
INSERT INTO `calificacion` VALUES ('5', 'F', '5.00', 'DE', '0', '5', '1', '1', '1', null, '1', '1', '2020-05-13 01:57:28', '2020-05-13 03:35:08');
INSERT INTO `calificacion` VALUES ('6', 'F', '6.00', 'DE', '0', '6', '1', '1', '1', null, '1', '1', '2020-05-13 01:58:23', '2020-05-13 03:35:15');
INSERT INTO `calificacion` VALUES ('7', 'F', '7.00', 'DE', '0', '7', '1', '1', '1', null, '1', '1', '2020-05-13 01:59:26', '2020-05-13 03:35:24');
INSERT INTO `calificacion` VALUES ('8', 'F', '8.00', 'DE', '0', '8', '1', '1', '1', null, '1', '1', '2020-05-13 01:59:52', '2020-05-13 03:35:39');
INSERT INTO `calificacion` VALUES ('9', 'D-', '10.00', 'RE', '1', '10', '1', '1', '3', null, '1', '1', '2020-05-13 02:01:03', '2020-05-13 03:36:58');
INSERT INTO `calificacion` VALUES ('10', 'D-', '11.00', 'RE', '1', '11', '1', '1', '3', null, '1', '1', '2020-05-13 02:25:46', '2020-05-13 03:37:09');
INSERT INTO `calificacion` VALUES ('11', 'D', '12.00', 'RE', '1', '12', '1', '1', '3', null, '1', '1', '2020-05-13 02:32:17', '2020-05-13 03:36:25');
INSERT INTO `calificacion` VALUES ('12', 'D+', '9.00', 'DE', '0', '9', '1', '1', '3', null, '1', '1', '2020-05-13 02:36:42', '2020-05-13 03:35:46');
INSERT INTO `calificacion` VALUES ('13', 'C-', '13.00', 'RE', '1', '13', '1', '1', '3', null, '1', '1', '2020-05-13 03:01:49', '2020-05-13 03:58:16');
INSERT INTO `calificacion` VALUES ('14', 'C', '14.00', 'RE', '1', '14', '1', '1', '3', null, '1', '1', '2020-05-13 03:02:37', '2020-05-13 03:40:53');
INSERT INTO `calificacion` VALUES ('15', 'C+', '15.00', 'BU', '1', '15', '1', '1', '4', null, '1', '1', '2020-05-13 03:04:12', '2020-05-13 03:40:42');
INSERT INTO `calificacion` VALUES ('16', 'B-', '16.00', 'BU', '1', '16', '1', '1', '4', null, '1', '1', '2020-05-13 03:04:57', '2020-05-13 03:37:44');
INSERT INTO `calificacion` VALUES ('17', 'B', '17.00', 'SO', '1', '17', '1', '1', '5', null, '1', '1', '2020-05-13 03:05:35', '2020-05-13 03:37:34');
INSERT INTO `calificacion` VALUES ('18', 'B+', '18.00', 'SO', '1', '18', '1', '1', '5', null, '1', '1', '2020-05-13 03:07:08', '2020-05-13 03:07:08');
INSERT INTO `calificacion` VALUES ('19', 'A-', '19.00', 'EX', '1', '19', '1', '1', '6', null, '1', '1', '2020-05-13 03:09:44', '2020-05-13 03:09:44');
INSERT INTO `calificacion` VALUES ('20', 'A', '20.00', 'EX', '1', '20', '1', '1', '6', null, '1', '1', '2020-05-13 03:10:18', '2020-05-13 03:10:18');

-- ----------------------------
-- Table structure for carga_horaria
-- ----------------------------
DROP TABLE IF EXISTS `carga_horaria`;
CREATE TABLE `carga_horaria` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_carga_horaria` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_hora_academica` int(11) NOT NULL DEFAULT 1,
  `nu_orden` int(11) NOT NULL,
  `hh_inicio` time NOT NULL,
  `hh_fin` time NOT NULL,
  `id_turno` int(11) NOT NULL,
  `bo_receso` tinyint(1) NOT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of carga_horaria
-- ----------------------------
INSERT INTO `carga_horaria` VALUES ('1', 'DIR. GRUPO', '1', '1', '07:00:00', '07:45:00', '1', '1', null, '1', '1', '2020-05-10 03:06:24', '2020-05-20 06:37:54');
INSERT INTO `carga_horaria` VALUES ('2', 'Hora 1', '1', '2', '08:00:00', '08:45:00', '1', '0', null, '1', '1', '2020-05-10 04:01:07', '2020-05-20 06:42:08');
INSERT INTO `carga_horaria` VALUES ('3', 'Hora 2', '1', '3', '08:45:00', '09:30:00', '1', '0', null, '1', '1', '2020-05-10 04:02:03', '2020-05-20 11:20:14');
INSERT INTO `carga_horaria` VALUES ('4', 'DESCANSO', '1', '4', '09:30:00', '10:15:00', '1', '1', null, '1', '1', '2020-05-10 04:04:47', '2020-05-20 06:38:12');
INSERT INTO `carga_horaria` VALUES ('5', 'Hora 3', '1', '5', '10:15:00', '11:00:00', '1', '0', null, '1', '1', '2020-05-10 04:06:09', '2020-05-20 11:20:24');
INSERT INTO `carga_horaria` VALUES ('6', 'ALMUERZO', '1', '6', '11:00:00', '11:45:00', '1', '1', null, '1', '1', '2020-05-10 04:07:48', '2020-05-20 06:38:26');
INSERT INTO `carga_horaria` VALUES ('7', 'Hora 4', '1', '7', '13:00:00', '13:45:00', '2', '0', null, '1', '1', '2020-05-10 04:09:36', '2020-05-20 11:20:31');
INSERT INTO `carga_horaria` VALUES ('8', 'Hora 5', '1', '8', '13:45:00', '14:30:00', '2', '0', null, '1', '1', '2020-05-10 04:10:09', '2020-06-26 22:56:11');

-- ----------------------------
-- Table structure for cargo
-- ----------------------------
DROP TABLE IF EXISTS `cargo`;
CREATE TABLE `cargo` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_cargo` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of cargo
-- ----------------------------
INSERT INTO `cargo` VALUES ('1', 'Director', null, '1', '1', '2020-05-09 14:09:04', '2020-05-09 14:09:04');
INSERT INTO `cargo` VALUES ('2', 'Subdirector', null, '1', '1', '2020-05-09 14:09:18', '2020-05-09 14:09:18');
INSERT INTO `cargo` VALUES ('3', 'Secretario', null, '1', '1', '2020-05-09 14:11:46', '2020-05-09 14:11:46');
INSERT INTO `cargo` VALUES ('4', 'Docente', null, '1', '1', '2020-05-16 00:18:43', '2020-05-16 00:18:43');

-- ----------------------------
-- Table structure for ciudad
-- ----------------------------
DROP TABLE IF EXISTS `ciudad`;
CREATE TABLE `ciudad` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `co_ciudad` int(11) NOT NULL,
  `nb_ciudad` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_departamento` int(11) NOT NULL,
  `tx_latitud` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_longitud` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ciudad_co_ciudad_unique` (`co_ciudad`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of ciudad
-- ----------------------------
INSERT INTO `ciudad` VALUES ('76', '76001', 'Cali', '76', '3.3950619', '-76.5957047', '', '1', '1', '2020-04-10 02:40:58', null);

-- ----------------------------
-- Table structure for clase
-- ----------------------------
DROP TABLE IF EXISTS `clase`;
CREATE TABLE `clase` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_grado_materia` int(11) NOT NULL,
  `id_grupo` int(11) NOT NULL,
  `id_profesor` int(11) NOT NULL,
  `fe_clase` date NOT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of clase
-- ----------------------------

-- ----------------------------
-- Table structure for colegio
-- ----------------------------
DROP TABLE IF EXISTS `colegio`;
CREATE TABLE `colegio` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_colegio` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tx_codigo` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_tipo_colegio` int(11) NOT NULL,
  `id_calendario` int(11) NOT NULL,
  `id_jornada` int(11) NOT NULL,
  `id_departamento` int(11) DEFAULT NULL,
  `id_ciudad` int(11) DEFAULT NULL,
  `id_zona` int(11) DEFAULT NULL,
  `id_comuna` int(11) DEFAULT NULL,
  `id_barrio` int(11) DEFAULT NULL,
  `tx_direccion` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_telefono` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nu_estudiantes` int(11) DEFAULT NULL,
  `tx_logo` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nu_latitud` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nu_longitud` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of colegio
-- ----------------------------
INSERT INTO `colegio` VALUES ('1', 'San Ignacio', '202000001', '1', '1', '1', '5', '76', '2', '2', '3', 'Calle 23 con calle 22', '4314124', '500', null, null, null, null, '1', '1', '2020-06-03 18:21:50', '2020-07-21 19:46:19');

-- ----------------------------
-- Table structure for comuna
-- ----------------------------
DROP TABLE IF EXISTS `comuna`;
CREATE TABLE `comuna` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `co_comuna` int(11) NOT NULL,
  `nb_comuna` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_zona` int(11) NOT NULL,
  `tx_latitud` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_longitud` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `comuna_co_comuna_unique` (`co_comuna`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of comuna
-- ----------------------------
INSERT INTO `comuna` VALUES ('1', '1', 'Comuna 1', '1', '3.452904', '-76.565703', null, '1', '1', null, null);
INSERT INTO `comuna` VALUES ('2', '2', 'Comuna 2', '1', '3.476199', '-76.528061', null, '1', '1', null, null);
INSERT INTO `comuna` VALUES ('3', '3', 'Comuna 3', '1', '3.447175', '-76.536789', null, '1', '1', null, null);
INSERT INTO `comuna` VALUES ('4', '4', 'Comuna 4', '2', '3.470139', '-76.510075', null, '1', '1', null, null);
INSERT INTO `comuna` VALUES ('5', '5', 'Comuna 5', '2', '3.473208', '-76.494829', null, '1', '1', null, null);
INSERT INTO `comuna` VALUES ('6', '6', 'Comuna 6', '2', '3.484017', '-76.485714', null, '1', '1', null, null);
INSERT INTO `comuna` VALUES ('7', '7', 'Comuna 7', '2', '3.447147', '-76.486708', null, '1', '1', null, null);
INSERT INTO `comuna` VALUES ('8', '8', 'Comuna 8', '2', '3.446542', '-76.506492', null, '1', '1', null, null);
INSERT INTO `comuna` VALUES ('9', '9', 'Comuna 9', '1', '3.436488', '-76.522997', null, '1', '1', null, null);
INSERT INTO `comuna` VALUES ('10', '10', 'Comuna 10', '5', '3.407796', '-76.528026', null, '1', '1', null, null);
INSERT INTO `comuna` VALUES ('11', '11', 'Comuna 11', '4', '3.427384', '-76.515301', null, '1', '1', null, null);
INSERT INTO `comuna` VALUES ('12', '12', 'Comuna 12', '4', '3.433679', '-76.50239', null, '1', '1', null, null);
INSERT INTO `comuna` VALUES ('13', '13', 'Comuna 13', '3', '3.441777', '-76.485438', null, '1', '1', null, null);
INSERT INTO `comuna` VALUES ('14', '14', 'Comuna 14', '3', '3.420235', '-76.47186', null, '1', '1', null, null);
INSERT INTO `comuna` VALUES ('15', '15', 'Comuna 15', '3', '3.411713', '-76.496695', null, '1', '1', null, null);
INSERT INTO `comuna` VALUES ('16', '16', 'Comuna 16', '4', '3.40474', '-76.516458', null, '1', '1', null, null);
INSERT INTO `comuna` VALUES ('17', '17', 'Comuna 17', '5', '3.380512', '-76.521043', null, '1', '1', null, null);
INSERT INTO `comuna` VALUES ('18', '18', 'Comuna 18', '5', '3.37676', '-76.542731', null, '1', '1', null, null);
INSERT INTO `comuna` VALUES ('19', '19', 'Comuna 19', '5', '3.41745', '-76.55076', null, '1', '1', null, null);
INSERT INTO `comuna` VALUES ('20', '20', 'Comuna 20', '5', '3.413092', '-76.557423', null, '1', '1', null, null);
INSERT INTO `comuna` VALUES ('21', '21', 'Comuna 21', '3', '3.409215', '-76.468148', null, '1', '1', null, null);
INSERT INTO `comuna` VALUES ('22', '22', 'Comuna 22', '5', '3.359197', '-76.53823', null, '1', '1', null, null);

-- ----------------------------
-- Table structure for configuracion
-- ----------------------------
DROP TABLE IF EXISTS `configuracion`;
CREATE TABLE `configuracion` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_colegio` int(11) NOT NULL,
  `nb_configuracion` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_valor` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_modulo` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of configuracion
-- ----------------------------
INSERT INTO `configuracion` VALUES ('1', '1', 'Tipo Calificacion', '1', 'tipo_calificacion', 'Tipo de calificacion para los boletines', '1', '1', null, null);
INSERT INTO `configuracion` VALUES ('2', '1', 'Mensualidad', '200', 'pago', 'Monto de pago mensual', '1', '1', null, null);

-- ----------------------------
-- Table structure for contacto
-- ----------------------------
DROP TABLE IF EXISTS `contacto`;
CREATE TABLE `contacto` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_tipo_contacto` int(10) unsigned NOT NULL,
  `id_origen` int(10) unsigned NOT NULL,
  `tx_email` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tx_sitio_web` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_facebook` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_twitter` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_instagram` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_youtube` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(10) unsigned NOT NULL,
  `id_usuario` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of contacto
-- ----------------------------
INSERT INTO `contacto` VALUES ('1', '1', '1', 'lyustiz@gmail.com', null, null, null, null, null, null, '1', '1', '2020-06-04 13:30:41', '2020-06-04 13:30:41');

-- ----------------------------
-- Table structure for departamento
-- ----------------------------
DROP TABLE IF EXISTS `departamento`;
CREATE TABLE `departamento` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `co_departamento` int(11) NOT NULL,
  `nb_departamento` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_pais` int(11) NOT NULL,
  `tx_latitud` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_longitud` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `departamento_co_departamento_unique` (`co_departamento`),
  UNIQUE KEY `departamento_nb_departamento_unique` (`nb_departamento`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of departamento
-- ----------------------------
INSERT INTO `departamento` VALUES ('5', '5', 'ANTIOQUIA', '57', null, null, null, '1', '1', '2020-04-10 00:00:00', null);
INSERT INTO `departamento` VALUES ('8', '8', 'ATLÁNTICO', '57', null, null, null, '1', '1', '2020-04-10 00:00:00', null);
INSERT INTO `departamento` VALUES ('11', '11', 'BOGOTÁ, D.C.', '57', null, null, null, '1', '1', '2020-04-10 00:00:00', null);
INSERT INTO `departamento` VALUES ('13', '13', 'BOLÍVAR', '57', null, null, null, '1', '1', '2020-04-10 00:00:00', null);
INSERT INTO `departamento` VALUES ('15', '15', 'BOYACÁ', '57', null, null, null, '1', '1', '2020-04-10 00:00:00', null);
INSERT INTO `departamento` VALUES ('17', '17', 'CALDAS', '57', null, null, null, '1', '1', '2020-04-10 00:00:00', null);
INSERT INTO `departamento` VALUES ('18', '18', 'CAQUETÁ', '57', null, null, null, '1', '1', '2020-04-10 00:00:00', null);
INSERT INTO `departamento` VALUES ('19', '19', 'CAUCA', '57', null, null, null, '1', '1', '2020-04-10 00:00:00', null);
INSERT INTO `departamento` VALUES ('20', '20', 'CESAR', '57', null, null, null, '1', '1', '2020-04-10 00:00:00', null);
INSERT INTO `departamento` VALUES ('23', '23', 'CÓRDOBA', '57', null, null, null, '1', '1', '2020-04-10 00:00:00', null);
INSERT INTO `departamento` VALUES ('25', '25', 'CUNDINAMARCA', '57', null, null, null, '1', '1', '2020-04-10 00:00:00', null);
INSERT INTO `departamento` VALUES ('27', '27', 'CHOCÓ', '57', null, null, null, '1', '1', '2020-04-10 00:00:00', null);
INSERT INTO `departamento` VALUES ('41', '41', 'HUILA', '57', null, null, null, '1', '1', '2020-04-10 00:00:00', null);
INSERT INTO `departamento` VALUES ('44', '44', 'LA GUAJIRA', '57', null, null, null, '1', '1', '2020-04-10 00:00:00', null);
INSERT INTO `departamento` VALUES ('47', '47', 'MAGDALENA', '57', null, null, null, '1', '1', '2020-04-10 00:00:00', null);
INSERT INTO `departamento` VALUES ('50', '50', 'META', '57', null, null, null, '1', '1', '2020-04-10 00:00:00', null);
INSERT INTO `departamento` VALUES ('52', '52', 'NARIÑO', '57', null, null, null, '1', '1', '2020-04-10 00:00:00', null);
INSERT INTO `departamento` VALUES ('54', '54', 'NORTE DE SANTANDER', '57', null, null, null, '1', '1', '2020-04-10 00:00:00', null);
INSERT INTO `departamento` VALUES ('63', '63', 'QUINDÍO', '57', null, null, null, '1', '1', '2020-04-10 00:00:00', null);
INSERT INTO `departamento` VALUES ('66', '66', 'RISARALDA', '57', null, null, null, '1', '1', '2020-04-10 00:00:00', null);
INSERT INTO `departamento` VALUES ('68', '68', 'SANTANDER', '57', null, null, null, '1', '1', '2020-04-10 00:00:00', null);
INSERT INTO `departamento` VALUES ('70', '70', 'SUCRE', '57', null, null, null, '1', '1', '2020-04-10 00:00:00', null);
INSERT INTO `departamento` VALUES ('73', '73', 'TOLIMA', '57', null, null, null, '1', '1', '2020-04-10 00:00:00', null);
INSERT INTO `departamento` VALUES ('76', '76', 'VALLE DEL CAUCA', '57', null, null, null, '1', '1', '2020-04-10 00:00:00', null);
INSERT INTO `departamento` VALUES ('81', '81', 'ARAUCA', '57', null, null, null, '1', '1', '2020-04-10 00:00:00', null);
INSERT INTO `departamento` VALUES ('85', '85', 'CASANARE', '57', null, null, null, '1', '1', '2020-04-10 00:00:00', null);
INSERT INTO `departamento` VALUES ('86', '86', 'PUTUMAYO', '57', null, null, null, '1', '1', '2020-04-10 00:00:00', null);
INSERT INTO `departamento` VALUES ('88', '88', 'ARCHIPIÉLAGO DE SAN ANDRÉ', '57', null, null, null, '1', '1', '2020-04-10 00:00:00', null);
INSERT INTO `departamento` VALUES ('91', '91', 'AMAZONAS', '57', null, null, null, '1', '1', '2020-04-10 00:00:00', null);
INSERT INTO `departamento` VALUES ('94', '94', 'GUAINÍA', '57', null, null, null, '1', '1', '2020-04-10 00:00:00', null);
INSERT INTO `departamento` VALUES ('95', '95', 'GUAVIARE', '57', null, null, null, '1', '1', '2020-04-10 00:00:00', null);
INSERT INTO `departamento` VALUES ('97', '97', 'VAUPÉS', '57', null, null, null, '1', '1', '2020-04-10 00:00:00', null);
INSERT INTO `departamento` VALUES ('99', '99', 'VICHADA', '57', null, null, null, '1', '1', '2020-04-10 00:00:00', null);

-- ----------------------------
-- Table structure for detalle_horario
-- ----------------------------
DROP TABLE IF EXISTS `detalle_horario`;
CREATE TABLE `detalle_horario` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `co_detalle_horario` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_horario` int(11) NOT NULL,
  `id_materia` int(11) NOT NULL,
  `id_docente` int(11) NOT NULL,
  `id_dia_semana` int(11) NOT NULL,
  `id_aula` int(11) NOT NULL,
  `hh_inicio` time NOT NULL,
  `hh_fin` time NOT NULL,
  `id_carga_horaria` int(11) NOT NULL,
  `id_hora_academica` int(11) NOT NULL,
  `nu_carga_horaria` int(11) NOT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of detalle_horario
-- ----------------------------
INSERT INTO `detalle_horario` VALUES ('1', 'oVmJvgpZzpbkPN8xMrHTuktHWgpKNp0oA1EBZBNGbgjGpQZVIGMmriuiORpnCWSd', '2', '19', '2', '1', '2', '08:00:00', '08:45:00', '2', '1', '2', null, '1', '1', '2020-06-24 18:58:57', '2020-06-25 02:38:11');
INSERT INTO `detalle_horario` VALUES ('2', 'oVmJvgpZzpbkPN8xMrHTuktHWgpKNp0oA1EBZBNGbgjGpQZVIGMmriuiORpnCWSd', '2', '19', '2', '1', '2', '08:00:00', '08:45:00', '3', '1', '0', null, '1', '1', '2020-06-24 18:58:57', '2020-06-25 02:38:11');
INSERT INTO `detalle_horario` VALUES ('3', 'iG0XFXGK9lHyHXf6xRWyRi1qJYYQePB8vnnCWGXkMXBwragjkWUNG2ZJPaSQWviW', '2', '15', '1', '2', '3', '08:00:00', '08:45:00', '2', '1', '1', null, '1', '1', '2020-06-25 02:19:37', '2020-06-25 02:19:37');
INSERT INTO `detalle_horario` VALUES ('4', 'esuSbT2nbmiDjgptYT8EgUMeUsKJYoOlGoqMpVJamXcxcUwlRrjV9hVFqrSCudN7', '2', '7', '1', '3', '2', '08:00:00', '08:45:00', '2', '1', '2', null, '1', '1', '2020-06-25 02:41:47', '2020-06-25 02:51:40');
INSERT INTO `detalle_horario` VALUES ('5', 'esuSbT2nbmiDjgptYT8EgUMeUsKJYoOlGoqMpVJamXcxcUwlRrjV9hVFqrSCudN7', '2', '7', '1', '3', '2', '08:00:00', '08:45:00', '3', '1', '0', null, '1', '1', '2020-06-25 02:41:47', '2020-06-25 02:51:40');
INSERT INTO `detalle_horario` VALUES ('6', 'OGFufkkihSaS0zKh8ZEIpdG6Oc5iRqmPPP9a4Lju69Lwj9n0V0PWAeLj4pdZI4pC', '2', '17', '1', '3', '5', '13:00:00', '13:45:00', '7', '1', '1', null, '1', '1', '2020-06-25 02:42:05', '2020-06-25 02:42:05');
INSERT INTO `detalle_horario` VALUES ('19', 'hsQHEchsDeD9q3cMgfyZu2AbpUoPz4mwOIPKN27QPhXgAIT2oSsgiWVNjhxd28Ov', '1', '14', '1', '1', '2', '10:15:00', '11:00:00', '5', '1', '1', null, '1', '1', '2020-06-26 14:49:36', '2020-06-26 14:49:36');
INSERT INTO `detalle_horario` VALUES ('20', 'Mz9ga0kS4pwrvPDo1TGdwB3SodYsO3INz6RvPB1A7g54T8sDkd62c25fAXXmSL1e', '1', '14', '2', '4', '2', '10:15:00', '11:00:00', '5', '1', '1', null, '1', '1', '2020-06-26 14:50:19', '2020-06-26 14:50:19');
INSERT INTO `detalle_horario` VALUES ('31', 'IeAOjixIVQfS3RxBaGChuec4IlGUDTRYlw6GpkxfJqrYVdjSgtUCAAjgPJb1K1XC', '1', '15', '1', '2', '2', '10:15:00', '11:00:00', '5', '1', '1', null, '1', '1', '2020-06-26 14:55:03', '2020-06-26 14:55:03');
INSERT INTO `detalle_horario` VALUES ('32', 'lMeRoTI8L1Ziz7tRwDizQ6C9vRvSElJosuN3WEaVvt8E03cLszxnKUtwQSDbFUw6', '1', '7', '2', '3', '3', '10:15:00', '11:00:00', '5', '1', '1', null, '1', '1', '2020-06-26 14:57:11', '2020-06-26 14:57:11');
INSERT INTO `detalle_horario` VALUES ('33', 'brOQPUgEUZI7bzOBqetoPK7TB5hw9g7eF0Id3YfKxV63xBBQ1gIiDuRvJARbHVNx', '1', '17', '1', '5', '1', '10:15:00', '11:00:00', '5', '1', '1', null, '1', '1', '2020-06-26 14:57:31', '2020-06-26 14:57:31');
INSERT INTO `detalle_horario` VALUES ('34', 'rI124Xpgsju96jMeY4aTn4q4XQiFinhmNxw5I1OmObOBsvPCTlMeLo0j892kY7w5', '1', '15', '2', '1', '1', '08:00:00', '08:45:00', '2', '1', '2', null, '1', '1', '2020-06-26 22:44:17', '2020-06-26 22:44:17');
INSERT INTO `detalle_horario` VALUES ('35', 'rI124Xpgsju96jMeY4aTn4q4XQiFinhmNxw5I1OmObOBsvPCTlMeLo0j892kY7w5', '1', '15', '2', '1', '1', '08:45:00', '09:30:00', '3', '1', '0', null, '1', '1', '2020-06-26 22:44:17', '2020-06-26 22:44:17');
INSERT INTO `detalle_horario` VALUES ('36', 'JQ32w8FSl3RMN7ouK0q5MdszOhsDcHQk3W1OESJhk4kg8Vj3uPEuDU9fmGqslXLT', '1', '7', '1', '2', '1', '08:00:00', '08:45:00', '2', '1', '2', null, '1', '1', '2020-06-26 22:51:11', '2020-06-26 22:51:11');
INSERT INTO `detalle_horario` VALUES ('37', 'JQ32w8FSl3RMN7ouK0q5MdszOhsDcHQk3W1OESJhk4kg8Vj3uPEuDU9fmGqslXLT', '1', '7', '1', '2', '1', '08:45:00', '09:30:00', '3', '1', '0', null, '1', '1', '2020-06-26 22:51:11', '2020-06-26 22:51:11');
INSERT INTO `detalle_horario` VALUES ('38', '3ZaCDszwQy5c18sZ2n895JOobgBgtJGKaIWCrBRzg9qjTL1n6o2FXsnY95Q8Dtnl', '1', '15', '2', '3', '2', '08:00:00', '08:45:00', '2', '1', '2', null, '1', '1', '2020-06-26 22:51:35', '2020-06-26 22:51:35');
INSERT INTO `detalle_horario` VALUES ('39', '3ZaCDszwQy5c18sZ2n895JOobgBgtJGKaIWCrBRzg9qjTL1n6o2FXsnY95Q8Dtnl', '1', '15', '2', '3', '2', '08:45:00', '09:30:00', '3', '1', '0', null, '1', '1', '2020-06-26 22:51:35', '2020-06-26 22:51:35');
INSERT INTO `detalle_horario` VALUES ('40', 'vpZBbZlbjn34HILaY0OuzR4bfxmSV4vYY9AZhyhljk4uvsSORnA0eccJgQ0xkmoJ', '1', '17', '2', '4', '1', '08:00:00', '08:45:00', '2', '1', '2', null, '1', '1', '2020-06-26 22:51:56', '2020-06-26 22:51:56');
INSERT INTO `detalle_horario` VALUES ('41', 'vpZBbZlbjn34HILaY0OuzR4bfxmSV4vYY9AZhyhljk4uvsSORnA0eccJgQ0xkmoJ', '1', '17', '2', '4', '1', '08:45:00', '09:30:00', '3', '1', '0', null, '1', '1', '2020-06-26 22:51:56', '2020-06-26 22:51:56');
INSERT INTO `detalle_horario` VALUES ('42', 'dC9swAOnzIxnep2wXtTLcuQSYTQuvsT0Cb63Ou0PgFn03XgekEMI9fikwPC8RVs0', '1', '15', '1', '5', '1', '08:00:00', '08:45:00', '2', '1', '2', null, '1', '1', '2020-06-26 22:52:26', '2020-06-26 22:52:26');
INSERT INTO `detalle_horario` VALUES ('43', 'dC9swAOnzIxnep2wXtTLcuQSYTQuvsT0Cb63Ou0PgFn03XgekEMI9fikwPC8RVs0', '1', '15', '1', '5', '1', '08:45:00', '09:30:00', '3', '1', '0', null, '1', '1', '2020-06-26 22:52:26', '2020-06-26 22:52:26');
INSERT INTO `detalle_horario` VALUES ('44', 'u0tujEmCeT7B9Yrwa8Rg5fzSonk7mDoZPrGEqZSqODUff8kNM4kpanS6XgZZ4OxR', '1', '14', '2', '1', '1', '13:00:00', '13:45:00', '7', '1', '2', null, '1', '1', '2020-06-26 22:52:43', '2020-06-26 22:52:43');
INSERT INTO `detalle_horario` VALUES ('45', 'u0tujEmCeT7B9Yrwa8Rg5fzSonk7mDoZPrGEqZSqODUff8kNM4kpanS6XgZZ4OxR', '1', '14', '2', '1', '1', '13:45:00', '14:30:00', '8', '1', '0', null, '1', '1', '2020-06-26 22:52:43', '2020-06-26 22:52:43');
INSERT INTO `detalle_horario` VALUES ('46', 'fpaqEbZtmzcf3K6fsuayChgP4PiQzwEECZ7AXZVlzY7b5VTyKc2awd1ibb2GN8Eg', '1', '7', '1', '2', '1', '13:00:00', '13:45:00', '7', '1', '2', null, '1', '1', '2020-06-26 22:53:02', '2020-06-26 22:53:02');
INSERT INTO `detalle_horario` VALUES ('47', 'fpaqEbZtmzcf3K6fsuayChgP4PiQzwEECZ7AXZVlzY7b5VTyKc2awd1ibb2GN8Eg', '1', '7', '1', '2', '1', '13:45:00', '14:30:00', '8', '1', '0', null, '1', '1', '2020-06-26 22:53:02', '2020-06-26 22:53:02');
INSERT INTO `detalle_horario` VALUES ('48', 'CHUSoiQAMc3MhyUvor6pJzPqugxcIIClIbSP61F3S2RyM1MJebyigOdt0B4ScLfL', '1', '15', '2', '3', '3', '13:00:00', '13:45:00', '7', '1', '2', null, '1', '1', '2020-06-26 22:53:23', '2020-06-26 22:53:23');
INSERT INTO `detalle_horario` VALUES ('49', 'CHUSoiQAMc3MhyUvor6pJzPqugxcIIClIbSP61F3S2RyM1MJebyigOdt0B4ScLfL', '1', '15', '2', '3', '3', '13:45:00', '14:30:00', '8', '1', '0', null, '1', '1', '2020-06-26 22:53:23', '2020-06-26 22:53:23');
INSERT INTO `detalle_horario` VALUES ('50', 'bnUj7pwCN2yX3HQiupB0r5yasCx7qtXiiyrfbedyB47EL1mH8LnuBxN2RwjSXvKy', '1', '14', '2', '4', '2', '13:00:00', '13:45:00', '7', '1', '2', null, '1', '1', '2020-06-26 22:53:39', '2020-06-26 22:53:39');
INSERT INTO `detalle_horario` VALUES ('51', 'bnUj7pwCN2yX3HQiupB0r5yasCx7qtXiiyrfbedyB47EL1mH8LnuBxN2RwjSXvKy', '1', '14', '2', '4', '2', '13:45:00', '14:30:00', '8', '1', '0', null, '1', '1', '2020-06-26 22:53:39', '2020-06-26 22:53:39');
INSERT INTO `detalle_horario` VALUES ('52', 'nFjy2q7xGsnI6cgMsmDukVllZn6muNf9iQcsOC1EU0dyoOjLmJ1OEYh4kC9CWGmn', '1', '7', '2', '5', '1', '13:00:00', '13:45:00', '7', '1', '2', null, '1', '1', '2020-06-26 22:53:54', '2020-06-26 22:53:54');
INSERT INTO `detalle_horario` VALUES ('53', 'nFjy2q7xGsnI6cgMsmDukVllZn6muNf9iQcsOC1EU0dyoOjLmJ1OEYh4kC9CWGmn', '1', '7', '2', '5', '1', '13:45:00', '14:30:00', '8', '1', '0', null, '1', '1', '2020-06-26 22:53:54', '2020-06-26 22:53:54');
INSERT INTO `detalle_horario` VALUES ('54', 'PcKGqcVKFfnsdH1IuV8IX95eUpwQ7V9pdGF61yrrQHb6v9VzE9daNYlI0b491o7B', '2', '14', '1', '2', '6', '08:45:00', '09:30:00', '3', '1', '1', null, '1', '1', '2020-07-02 03:25:01', '2020-07-02 03:25:01');
INSERT INTO `detalle_horario` VALUES ('55', '0BayjUDgEPFJxcWwMo21f61o136VzX82zVC40wYiKZKvOJ9UkAyHMnN5Muj9VHMg', '2', '7', '1', '4', '1', '08:00:00', '08:45:00', '2', '1', '2', null, '1', '1', '2020-08-17 18:21:56', '2020-08-17 18:21:56');
INSERT INTO `detalle_horario` VALUES ('56', '0BayjUDgEPFJxcWwMo21f61o136VzX82zVC40wYiKZKvOJ9UkAyHMnN5Muj9VHMg', '2', '7', '1', '4', '1', '08:45:00', '09:30:00', '3', '1', '0', null, '1', '1', '2020-08-17 18:21:57', '2020-08-17 18:21:57');

-- ----------------------------
-- Table structure for directiva
-- ----------------------------
DROP TABLE IF EXISTS `directiva`;
CREATE TABLE `directiva` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_colegio` int(11) NOT NULL,
  `id_cargo` int(11) NOT NULL,
  `nb_directiva` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_tipo_directiva` int(11) NOT NULL,
  `tx_documento` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of directiva
-- ----------------------------
INSERT INTO `directiva` VALUES ('1', '1', '1', 'Jose Rizzo', '1', '3654656', null, '1', '1', '2020-05-09 20:39:07', '2020-05-09 20:39:07');
INSERT INTO `directiva` VALUES ('2', '1', '2', 'Luis Yustiz', '1', '2342424', null, '1', '1', '2020-05-09 20:44:46', '2020-05-31 02:41:40');

-- ----------------------------
-- Table structure for docente
-- ----------------------------
DROP TABLE IF EXISTS `docente`;
CREATE TABLE `docente` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_apellido` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nb_apellido2` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nb_nombre` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nb_nombre2` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_tipo_documento` int(11) NOT NULL,
  `tx_documento` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_estado_civil` int(11) NOT NULL,
  `tx_sexo` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fe_nacimiento` date NOT NULL,
  `tx_nacionalidad` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_lugar_nacimiento` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_direccion` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_departamento` int(11) NOT NULL,
  `id_ciudad` int(11) NOT NULL,
  `tx_email` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_telefono` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_telefono_movil` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of docente
-- ----------------------------
INSERT INTO `docente` VALUES ('1', 'Luis', 'Daniel', 'Yustiz', 'Azuaje', '1', '13479149', '2', 'M', '1979-08-11', null, 'Caracas - Venezuela', 'Casa 23-9', '5', '76', 'lyustiz@gmail.com', '04129098862', '04129098862', null, '1', '1', '2020-05-16 04:51:17', '2020-05-16 04:51:17');
INSERT INTO `docente` VALUES ('2', 'Perez', 'Gonzalez', 'Jose', 'Gregorio', '1', '12113213', '1', 'M', '2020-05-06', null, 'Cali', 'Av 3', '76', '76', 'dghsgf@gmail.com', '04129098862', '04129098862', null, '1', '1', '2020-05-20 02:13:33', '2020-06-13 13:22:48');
INSERT INTO `docente` VALUES ('10', 'Ryan', 'Melendez', 'Cameron', 'Nehru', '1', '38374419', '1', 'F', '2019-11-05', null, 'ANT', 'P.O. Box 703, 1002 Nam Avenue', '1', '1', 'massa@non.ca', '032-216-7443', '072-681-8326', null, '1', '1', '2020-09-04 00:00:00', '2020-07-16 00:54:47');
INSERT INTO `docente` VALUES ('11', 'Pierce', 'Allen', 'Ciara', 'Ira', '1', '15474580', '1', 'F', '2020-06-03', null, 'Antioquia', 'Ap #190-5495 Velit Ave', '1', '1', 'ornare.libero@ac.ca', '048-818-7389', '024-075-2456', null, '1', '1', '2019-12-31 00:00:00', '2020-07-09 22:03:36');
INSERT INTO `docente` VALUES ('12', 'Hopper', 'Colon', 'Kylan', 'Kirestin', '1', '44375508', '1', 'M', '2020-06-05', null, 'Bolívar', 'P.O. Box 948, 3033 Luctus Avenue', '1', '1', 'Donec@Aliquam.com', '048-944-3101', '021-285-0874', null, '1', '1', '2020-03-02 00:00:00', '2020-04-21 00:00:00');
INSERT INTO `docente` VALUES ('13', 'Bentley', 'Petty', 'Uriel', 'Bree', '1', '22016206', '1', 'F', '2011-02-01', null, 'ATL', '385-8625 Egestas St.', '1', '1', 'id.erat.Etiam@dui.net', '073-302-5914', '088-926-9201', null, '1', '1', '2020-09-29 00:00:00', '2020-07-17 23:50:27');
INSERT INTO `docente` VALUES ('14', 'Fitzgerald', 'Lowery', 'Mercedes', 'Ian', '1', '17962283', '1', 'M', '2019-08-16', null, 'Antioquia', '749-1308 Lacus. St.', '1', '1', 'Phasellus.nulla@etmagnis.edu', '045-329-3636', '008-263-1355', null, '1', '1', '2020-12-24 00:00:00', '2020-11-19 00:00:00');
INSERT INTO `docente` VALUES ('15', 'Hewitt', 'Holcomb', 'Kevin', 'Merrill', '1', '29806838', '1', 'M', '2020-05-16', null, 'Antioquia', '132-2340 Malesuada Rd.', '1', '1', 'Sed.auctor@etlibero.co.uk', '096-873-1583', '099-241-6965', null, '1', '1', '2021-03-05 00:00:00', '2019-07-29 00:00:00');
INSERT INTO `docente` VALUES ('16', 'Spencer', 'Alford', 'Philip', 'Flynn', '1', '24965318', '1', 'M', '2020-05-12', null, 'Atlántico', '797-6538 Phasellus Rd.', '1', '1', 'blandit.mattis.Cras@leoVivamus', '047-972-4260', '041-527-3462', null, '1', '1', '2021-03-14 00:00:00', '2021-03-25 00:00:00');
INSERT INTO `docente` VALUES ('17', 'Finley', 'Summers', 'Wendy', 'Rose', '1', '13788021', '1', 'M', '2019-12-10', null, 'Bolívar', 'Ap #315-7993 Nascetur Road', '1', '1', 'mollis@dis.edu', '009-956-8254', '070-219-2770', null, '1', '1', '2019-11-21 00:00:00', '2019-12-02 00:00:00');
INSERT INTO `docente` VALUES ('18', 'Molina', 'Baxter', 'Kieran', 'Rana', '1', '40302683', '1', 'M', '2019-08-27', null, 'Atlántico', 'Ap #964-924 Enim. St.', '1', '1', 'ligula@utaliquam.edu', '015-874-7465', '098-595-2435', null, '1', '1', '2021-01-12 00:00:00', '2020-02-28 00:00:00');
INSERT INTO `docente` VALUES ('19', 'Merrill', 'Mercer', 'Olga', 'Tucker', '1', '15668350', '1', 'M', '2020-10-05', null, 'Antioquia', 'Ap #409-1991 Cursus Av.', '1', '1', 'amet@nulla.com', '025-646-6876', '057-436-8281', null, '1', '1', '2019-09-29 00:00:00', '2020-04-11 00:00:00');
INSERT INTO `docente` VALUES ('20', 'Manning', 'Stone', 'Helen', 'Emmanuel', '2', '25423242', '2', 'F', '2019-11-21', null, 'Antioquia', '8974 In, Rd.', '2', '2', 'Lorem@antedictum.org', '010-939-5940', '012-314-5848', null, '1', '1', '2020-05-22 00:00:00', '2020-03-25 00:00:00');
INSERT INTO `docente` VALUES ('21', 'Abbott', 'Powers', 'Kalia', 'Meredith', '2', '38515267', '2', 'F', '2020-08-19', null, 'BOL', 'Ap #364-4721 Montes, Av.', '2', '2', 'pede.blandit@ipsumCurabitur.ed', '062-156-2830', '060-023-0476', null, '1', '1', '2020-07-07 00:00:00', '2019-08-29 00:00:00');
INSERT INTO `docente` VALUES ('22', 'White', 'Morrison', 'Joan', 'Preston', '2', '25218386', '2', 'F', '2021-02-03', null, 'Antioquia', '6762 Vestibulum, Ave', '2', '2', 'consectetuer@luctusipsum.co.uk', '057-081-8792', '079-472-4872', null, '1', '1', '2019-10-19 00:00:00', '2020-04-11 00:00:00');
INSERT INTO `docente` VALUES ('23', 'Brewer', 'Santos', 'Travis', 'Mariko', '2', '31917575', '2', 'F', '2019-12-23', null, 'Bolívar', '1679 Ligula. Street', '2', '2', 'libero.Morbi.accumsan@duiFusce', '040-987-8957', '002-438-4237', null, '1', '1', '2020-08-09 00:00:00', '2020-12-31 00:00:00');
INSERT INTO `docente` VALUES ('24', 'Santana', 'Boyle', 'Melanie', 'Jelani', '2', '24853791', '2', 'F', '2019-11-14', null, 'ANT', '7725 Sem Av.', '2', '2', 'Nam.interdum.enim@orciinconseq', '026-473-0385', '041-010-3842', null, '1', '1', '2020-06-24 00:00:00', '2021-03-22 00:00:00');
INSERT INTO `docente` VALUES ('25', 'Wilkerson', 'Ray', 'Paula', 'Carl', '2', '39076736', '2', 'F', '2021-04-09', null, 'Antioquia', '7008 Ut Street', '2', '2', 'non.lacinia.at@vel.org', '053-973-0085', '011-705-8133', null, '1', '1', '2020-02-16 00:00:00', '2019-07-23 00:00:00');
INSERT INTO `docente` VALUES ('26', 'Byers', 'Miller', 'Kaitlin', 'Stephanie', '2', '16259210', '2', 'F', '2019-08-22', null, 'VAC', '305-1284 Nunc, Avenue', '2', '2', 'a.auctor@tinciduntorciquis.co.', '030-345-6635', '075-622-5776', null, '1', '1', '2020-01-10 00:00:00', '2019-07-19 00:00:00');
INSERT INTO `docente` VALUES ('27', 'Terrell', 'Sharp', 'Virginia', 'Scarlett', '2', '26244579', '2', 'F', '2020-05-04', null, 'Antioquia', '953-857 Per Rd.', '2', '2', 'Phasellus.in.felis@neque.net', '000-722-9130', '087-421-2397', null, '1', '1', '2019-08-07 00:00:00', '2021-02-14 00:00:00');
INSERT INTO `docente` VALUES ('28', 'Bishop', 'Sweeney', 'Lester', 'Gage', '2', '31814735', '2', 'F', '2020-05-18', null, 'ANT', '794-7416 Diam. St.', '2', '2', 'ipsum.dolor@massarutrum.net', '012-937-9640', '024-250-1794', null, '1', '1', '2020-01-09 00:00:00', '2020-04-08 00:00:00');
INSERT INTO `docente` VALUES ('29', 'Puckett', 'Mclaughlin', 'Hakeem', 'Angelica', '2', '9962097', '2', 'F', '2019-08-11', null, 'BOL', '8317 At Avenue', '2', '2', 'auctor.nunc@amet.org', '098-568-3249', '037-683-1090', null, '1', '1', '2020-05-11 00:00:00', '2021-04-29 00:00:00');
INSERT INTO `docente` VALUES ('30', 'Walsh', 'Perry', 'Maggie', 'Grant', '1', '48062535', '3', 'M', '2020-07-30', null, 'Antioquia', '2775 Morbi Avenue', '1', '1', 'mi.tempor.lorem@etultrices.com', '015-818-4101', '033-283-7997', null, '1', '1', '2019-12-07 00:00:00', '2020-03-18 00:00:00');
INSERT INTO `docente` VALUES ('31', 'Bowen', 'Greene', 'Yvette', 'Raja', '1', '8514020', '3', 'M', '2020-09-12', null, 'Amazonas', 'P.O. Box 440, 9492 Ornare, Street', '1', '1', 'ullamcorper.magna.Sed@Seddictu', '002-512-4926', '034-400-9525', null, '1', '1', '2020-06-26 00:00:00', '2019-08-01 00:00:00');
INSERT INTO `docente` VALUES ('32', 'Mckee', 'Yang', 'Stuart', 'Kylynn', '1', '45302496', '3', 'M', '2021-05-14', null, 'Atlántico', 'P.O. Box 404, 2466 Sed Road', '1', '1', 'Vivamus@Sedmalesuadaaugue.com', '083-120-2429', '036-269-4045', null, '1', '1', '2020-02-11 00:00:00', '2021-05-02 00:00:00');
INSERT INTO `docente` VALUES ('33', 'Spears', 'Shelton', 'Vernon', 'Grace', '1', '29848255', '3', 'M', '2020-09-30', null, 'Antioquia', 'P.O. Box 158, 9076 Nisi Street', '1', '1', 'feugiat.placerat.velit@enim.ne', '093-360-1761', '058-162-6593', null, '1', '1', '2019-11-23 00:00:00', '2021-04-28 00:00:00');
INSERT INTO `docente` VALUES ('34', 'Montoya', 'Koch', 'Kylie', 'Geoffrey', '1', '12630953', '3', 'M', '2020-11-17', null, 'Bolívar', '142-934 Sed Road', '1', '1', 'ac@auctor.net', '004-024-6754', '079-198-0400', null, '1', '1', '2020-12-27 00:00:00', '2019-11-04 00:00:00');
INSERT INTO `docente` VALUES ('35', 'Castillo', 'Lang', 'Marshall', 'Kerry', '1', '44701502', '3', 'M', '2021-05-17', null, 'AMA', 'Ap #566-2034 Natoque St.', '1', '1', 'orci@vulputatelacus.net', '095-530-7934', '085-701-0392', null, '1', '1', '2020-10-28 00:00:00', '2021-03-12 00:00:00');
INSERT INTO `docente` VALUES ('36', 'Vargas', 'Boyle', 'Cleo', 'Astra', '1', '11441027', '3', 'M', '2021-04-04', null, 'AMA', '694-1126 Blandit Road', '1', '1', 'a.enim@ullamcorper.org', '083-087-7023', '068-465-9834', null, '1', '1', '2021-07-06 00:00:00', '2019-12-17 00:00:00');
INSERT INTO `docente` VALUES ('37', 'Russell', 'Norton', 'Anthony', 'Hedy', '1', '25107071', '3', 'M', '2020-04-28', null, 'ANT', 'Ap #327-104 Duis St.', '1', '1', 'nunc.sit@libero.com', '065-512-9701', '019-736-6231', null, '1', '1', '2020-12-03 00:00:00', '2020-07-23 00:00:00');
INSERT INTO `docente` VALUES ('38', 'Brennan', 'Oneil', 'Hanae', 'Lois', '1', '31601658', '3', 'M', '2020-08-02', null, 'ATL', '291-2272 Felis. St.', '1', '1', 'Donec@nonlobortis.org', '093-322-3230', '080-007-0375', null, '1', '1', '2021-04-14 00:00:00', '2020-06-26 00:00:00');
INSERT INTO `docente` VALUES ('39', 'Garcia', 'Bowers', 'Lilah', 'Yoshio', '1', '6205368', '3', 'M', '2020-08-05', null, 'ATL', '617-7505 Iaculis St.', '1', '1', 'Duis@euismodmauris.net', '073-287-0236', '041-919-7429', null, '1', '1', '2021-04-25 00:00:00', '2020-09-16 00:00:00');
INSERT INTO `docente` VALUES ('40', 'Merrill', 'Clarke', 'Honorato', 'Tatum', '2', '35097221', '4', 'F', '2019-09-05', null, 'ANT', 'Ap #600-9916 Luctus, Ave', '2', '2', 'parturient.montes.nascetur@ide', '017-460-8304', '044-638-0596', null, '1', '1', '2020-03-14 00:00:00', '2019-10-24 00:00:00');
INSERT INTO `docente` VALUES ('41', 'Leonard', 'Langley', 'Clare', 'Jarrod', '2', '17257535', '4', 'F', '2020-02-18', null, 'Antioquia', '6087 Pede Avenue', '2', '2', 'justo@loremvitaeodio.co.uk', '044-327-0088', '048-353-6002', null, '1', '1', '2020-08-14 00:00:00', '2020-05-25 00:00:00');
INSERT INTO `docente` VALUES ('42', 'Barnes', 'Hicks', 'Lucian', 'Zachery', '2', '35432176', '4', 'F', '2019-07-13', null, 'MET', 'P.O. Box 104, 3006 Gravida Av.', '2', '2', 'nonummy.ultricies@euismodestar', '048-580-7802', '027-877-7946', null, '1', '1', '2020-12-16 00:00:00', '2021-01-06 00:00:00');
INSERT INTO `docente` VALUES ('43', 'Hudson', 'Wheeler', 'Sara', 'Justin', '2', '43672769', '4', 'F', '2019-12-29', null, 'Atlántico', 'P.O. Box 902, 3532 Vitae Av.', '2', '2', 'lorem@idnuncinterdum.com', '037-370-0581', '016-098-2161', null, '1', '1', '2021-03-14 00:00:00', '2020-01-24 00:00:00');
INSERT INTO `docente` VALUES ('44', 'Duran', 'Knowles', 'Leigh', 'Leigh', '2', '18222759', '4', 'F', '2019-12-17', null, 'Antioquia', 'Ap #675-420 Sit Road', '2', '2', 'amet.ornare@ornare.ca', '081-023-5738', '069-814-8720', null, '1', '1', '2020-01-14 00:00:00', '2019-07-26 00:00:00');
INSERT INTO `docente` VALUES ('45', 'Hicks', 'Rosales', 'Penelope', 'Wing', '2', '19973220', '4', 'F', '2021-04-02', null, 'Atlántico', '749-3329 Nunc Road', '2', '2', 'Aliquam.erat@lobortis.edu', '004-571-3101', '019-866-9579', null, '1', '1', '2020-08-15 00:00:00', '2021-04-20 00:00:00');
INSERT INTO `docente` VALUES ('46', 'Hanson', 'Palmer', 'Omar', 'Quail', '2', '44501674', '4', 'F', '2020-07-01', null, 'ANT', '185-7155 Auctor Rd.', '2', '2', 'ante.iaculis@lacinia.org', '076-430-3379', '076-287-4847', null, '1', '1', '2020-12-31 00:00:00', '2019-09-21 00:00:00');
INSERT INTO `docente` VALUES ('47', 'Mckinney', 'Ashley', 'Xantha', 'Alea', '2', '47836380', '4', 'F', '2020-05-07', null, 'Bolívar', '7672 Et Rd.', '2', '2', 'massa@sit.edu', '043-763-1356', '054-520-9093', null, '1', '1', '2020-05-30 00:00:00', '2020-10-07 00:00:00');
INSERT INTO `docente` VALUES ('48', 'Miller', 'Jones', 'Upton', 'Kermit', '2', '40718661', '4', 'F', '2021-03-27', null, 'Chocó', '397-2580 Diam Rd.', '2', '2', 'quis.arcu@in.edu', '040-906-7048', '006-870-5104', null, '1', '1', '2020-09-07 00:00:00', '2019-09-22 00:00:00');
INSERT INTO `docente` VALUES ('49', 'Sykes', 'Mckenzie', 'Nayda', 'Keelie', '2', '23289808', '4', 'F', '2019-07-18', null, 'ATL', 'Ap #602-4072 Ultrices, Road', '2', '2', 'ut@acsem.ca', '057-507-2925', '060-164-8839', null, '1', '1', '2019-09-30 00:00:00', '2020-12-21 00:00:00');
INSERT INTO `docente` VALUES ('50', 'Mccarty', 'Mcleod', 'Hermione', 'Kennan', '1', '14206259', '1', 'M', '2020-08-10', null, 'Atlántico', '4003 Turpis Rd.', '1', '1', 'tellus.lorem@eratEtiamvestibul', '069-444-1405', '060-063-2737', null, '1', '1', '2020-09-17 00:00:00', '2020-05-28 00:00:00');
INSERT INTO `docente` VALUES ('51', 'Craft', 'Boyle', 'Finn', 'Tyrone', '1', '27775834', '1', 'M', '2020-03-22', null, 'Bolívar', '125-255 Non Rd.', '1', '1', 'mollis.Phasellus@elementumat.c', '044-183-4652', '092-534-0760', null, '1', '1', '2019-11-12 00:00:00', '2021-04-30 00:00:00');
INSERT INTO `docente` VALUES ('52', 'Beard', 'Hardin', 'Natalie', 'Oleg', '1', '24581031', '1', 'M', '2020-05-10', null, 'Antioquia', '1067 Et Ave', '1', '1', 'dictum@eget.ca', '070-032-9520', '016-608-1516', null, '1', '1', '2019-11-29 00:00:00', '2019-12-08 00:00:00');
INSERT INTO `docente` VALUES ('53', 'Thornton', 'Howe', 'Sylvester', 'Kirestin', '1', '30804886', '1', 'M', '2019-10-15', null, 'Antioquia', 'Ap #527-322 Lacinia Av.', '1', '1', 'lacus.Mauris@sodalespurusin.or', '016-562-9274', '091-468-9287', null, '1', '1', '2021-01-23 00:00:00', '2021-01-07 00:00:00');
INSERT INTO `docente` VALUES ('54', 'Skinner', 'Mcbride', 'Olympia', 'Keely', '1', '40063044', '1', 'M', '2020-01-09', null, 'Antioquia', 'Ap #407-8232 Feugiat. Rd.', '1', '1', 'mauris.Integer.sem@acipsumPhas', '095-530-9210', '028-103-4533', null, '1', '1', '2020-02-29 00:00:00', '2021-03-12 00:00:00');
INSERT INTO `docente` VALUES ('55', 'Chandler', 'Norris', 'Kameko', 'Daria', '1', '36913515', '1', 'M', '2020-11-06', null, 'BOL', 'Ap #378-6470 Suscipit Av.', '1', '1', 'Quisque@convallis.ca', '076-229-2628', '063-052-4508', null, '1', '1', '2021-05-03 00:00:00', '2021-01-18 00:00:00');
INSERT INTO `docente` VALUES ('56', 'Morales', 'Ferrell', 'Wendy', 'Faith', '1', '20842686', '1', 'M', '2020-09-20', null, 'ATL', 'P.O. Box 984, 7816 Dolor St.', '1', '1', 'luctus.Curabitur.egestas@purus', '026-753-0212', '075-471-9914', null, '1', '1', '2020-02-28 00:00:00', '2020-11-22 00:00:00');
INSERT INTO `docente` VALUES ('57', 'Oneal', 'Daniels', 'Wyatt', 'Scarlett', '1', '24941511', '1', 'M', '2021-03-05', null, 'ANT', 'P.O. Box 489, 8566 Fermentum Street', '1', '1', 'eu@interdumlibero.com', '008-920-1721', '084-660-2286', null, '1', '1', '2020-08-19 00:00:00', '2019-08-12 00:00:00');
INSERT INTO `docente` VALUES ('58', 'Gonzales', 'Perez', 'Marsden', 'Aaron', '1', '43879451', '1', 'M', '2019-10-25', null, 'BOL', 'Ap #378-5753 Quis Road', '1', '1', 'dolor.egestas@mattis.net', '066-088-4720', '038-249-8219', null, '1', '1', '2021-03-31 00:00:00', '2019-12-27 00:00:00');
INSERT INTO `docente` VALUES ('59', 'Snow', 'Potter', 'Whilemina', 'Palmer', '1', '7453399', '1', 'M', '2019-12-14', null, 'ANT', '530-4363 Vivamus Avenue', '1', '1', 'amet@dolorelit.org', '043-756-0571', '011-847-0361', null, '1', '1', '2020-06-15 00:00:00', '2020-12-08 00:00:00');
INSERT INTO `docente` VALUES ('60', 'Butler', 'Leach', 'Indira', 'Aline', '2', '28137650', '2', 'F', '2021-01-14', null, 'Antioquia', 'Ap #292-6671 Egestas Road', '2', '2', 'Morbi@etipsum.net', '007-957-6209', '099-937-7398', null, '1', '1', '2021-05-12 00:00:00', '2020-02-22 00:00:00');
INSERT INTO `docente` VALUES ('61', 'Mckenzie', 'Black', 'Linda', 'Zephania', '2', '29713491', '2', 'F', '2021-01-21', null, 'Atlántico', 'P.O. Box 821, 4173 Fusce Ave', '2', '2', 'Nunc.ut@porttitorerosnec.co.uk', '068-520-6110', '013-421-5501', null, '1', '1', '2021-07-05 00:00:00', '2021-02-02 00:00:00');
INSERT INTO `docente` VALUES ('62', 'Schmidt', 'Barry', 'Lionel', 'Savannah', '2', '34593731', '2', 'F', '2019-12-24', null, 'Putumayo', '1516 Felis Ave', '2', '2', 'ridiculus.mus.Donec@rutrumnonh', '043-271-8435', '071-046-0821', null, '1', '1', '2019-12-03 00:00:00', '2020-05-14 00:00:00');
INSERT INTO `docente` VALUES ('63', 'Downs', 'Spence', 'David', 'Sloane', '2', '19156385', '2', 'F', '2020-05-05', null, 'QUI', '884-9087 Placerat, Rd.', '2', '2', 'amet@metus.org', '013-357-6703', '069-023-9261', null, '1', '1', '2020-05-30 00:00:00', '2021-03-13 00:00:00');
INSERT INTO `docente` VALUES ('64', 'Hahn', 'Mcintosh', 'Stacey', 'Hyacinth', '2', '49028308', '2', 'F', '2019-12-17', null, 'ANT', '318-3614 Nibh Avenue', '2', '2', 'Pellentesque.ut.ipsum@loremtri', '062-332-5196', '090-529-3573', null, '1', '1', '2019-08-06 00:00:00', '2021-05-11 00:00:00');
INSERT INTO `docente` VALUES ('65', 'Fitzpatrick', 'Shaw', 'Simon', 'Dante', '2', '30982321', '2', 'F', '2020-09-10', null, 'Bolívar', 'Ap #444-1549 Rhoncus. Road', '2', '2', 'interdum.Sed.auctor@est.com', '026-115-2666', '075-275-2202', null, '1', '1', '2019-08-16 00:00:00', '2020-01-10 00:00:00');
INSERT INTO `docente` VALUES ('66', 'Lancaster', 'Mcmahon', 'Kane', 'Galvin', '2', '12015851', '2', 'F', '2020-02-06', null, 'Atlántico', 'Ap #808-9891 Malesuada Street', '2', '2', 'ornare.egestas@dapibusquam.net', '098-216-1293', '026-213-2911', null, '1', '1', '2020-03-18 00:00:00', '2019-07-13 00:00:00');
INSERT INTO `docente` VALUES ('67', 'Boone', 'Poole', 'Kiara', 'Richard', '2', '18752566', '2', 'F', '2020-09-03', null, 'Antioquia', 'Ap #524-6834 Fusce Avenue', '2', '2', 'id.libero@orcilacus.net', '071-717-2957', '044-358-2183', null, '1', '1', '2019-08-22 00:00:00', '2020-11-30 00:00:00');
INSERT INTO `docente` VALUES ('68', 'Keller', 'Shaffer', 'Kylie', 'Serena', '2', '40089307', '2', 'F', '2020-03-03', null, 'ANT', 'P.O. Box 447, 3850 Lorem Rd.', '2', '2', 'quam@ultriciesadipiscing.edu', '057-192-6826', '005-114-7269', null, '1', '1', '2019-10-17 00:00:00', '2020-12-16 00:00:00');
INSERT INTO `docente` VALUES ('69', 'Mcintyre', 'Thompson', 'Jackson', 'Ralph', '2', '17047747', '2', 'F', '2020-04-11', null, 'ANT', 'P.O. Box 472, 6055 Aenean Road', '2', '2', 'tellus.lorem@ascelerisque.edu', '065-545-0131', '020-619-1610', null, '1', '1', '2020-05-05 00:00:00', '2020-09-20 00:00:00');
INSERT INTO `docente` VALUES ('70', 'Spence', 'Bond', 'Nathan', 'George', '1', '14313480', '3', 'M', '2020-10-23', null, 'ATL', 'Ap #188-4105 Eu, Rd.', '1', '1', 'sed.dui@loremluctus.com', '048-254-6744', '077-043-8119', null, '1', '1', '2019-10-26 00:00:00', '2019-08-27 00:00:00');
INSERT INTO `docente` VALUES ('71', 'Hensley', 'Vaughan', 'Zenia', 'Lee', '1', '35713772', '3', 'M', '2020-05-20', null, 'Arauca', '8952 Enim Rd.', '1', '1', 'justo.faucibus.lectus@egetmagn', '080-022-5064', '007-100-5730', null, '1', '1', '2020-08-02 00:00:00', '2020-01-25 00:00:00');
INSERT INTO `docente` VALUES ('72', 'Robbins', 'Suarez', 'Kameko', 'Steven', '1', '6866914', '3', 'M', '2021-06-27', null, 'Antioquia', '7381 Urna Avenue', '1', '1', 'magna.a@Quisquetinciduntpede.c', '043-563-6064', '097-265-5124', null, '1', '1', '2020-04-14 00:00:00', '2020-10-02 00:00:00');
INSERT INTO `docente` VALUES ('73', 'Vaughn', 'Bradshaw', 'Ella', 'Erin', '1', '31711641', '3', 'M', '2021-01-14', null, 'ANT', '634 Penatibus Rd.', '1', '1', 'Etiam@semconsequatnec.ca', '068-481-4106', '096-441-3189', null, '1', '1', '2019-09-26 00:00:00', '2021-01-19 00:00:00');
INSERT INTO `docente` VALUES ('74', 'Compton', 'Langley', 'Declan', 'Larissa', '1', '24848085', '3', 'M', '2020-02-22', null, 'Atlántico', '4334 Dui. Ave', '1', '1', 'urna.Nullam.lobortis@urnaet.co', '017-986-5650', '007-051-5035', null, '1', '1', '2020-12-07 00:00:00', '2020-04-16 00:00:00');
INSERT INTO `docente` VALUES ('75', 'Ray', 'Houston', 'Penelope', 'Jonah', '1', '45062226', '3', 'M', '2020-12-09', null, 'VAC', 'P.O. Box 104, 8537 Felis. Rd.', '1', '1', 'odio@dictum.org', '019-924-1367', '090-454-2491', null, '1', '1', '2021-04-19 00:00:00', '2021-05-10 00:00:00');
INSERT INTO `docente` VALUES ('76', 'Brennan', 'Jefferson', 'Willa', 'Darius', '1', '27687952', '3', 'M', '2019-09-29', null, 'Antioquia', 'Ap #840-6578 Nec Ave', '1', '1', 'dapibus.ligula.Aliquam@maurisb', '011-980-2770', '036-837-2865', null, '1', '1', '2020-10-17 00:00:00', '2020-01-08 00:00:00');
INSERT INTO `docente` VALUES ('77', 'Brewer', 'Lane', 'Jonas', 'Ali', '1', '50233162', '3', 'M', '2019-07-25', null, 'Atlántico', 'Ap #946-9451 Posuere Road', '1', '1', 'ut.aliquam.iaculis@Inornaresag', '072-283-3129', '053-213-9323', null, '1', '1', '2019-09-12 00:00:00', '2020-12-12 00:00:00');
INSERT INTO `docente` VALUES ('78', 'Yates', 'Barrett', 'Harriet', 'Barry', '1', '10681062', '3', 'M', '2020-12-06', null, 'BOL', '284-4754 Nec Avenue', '1', '1', 'orci.adipiscing@magnisdispartu', '017-633-8442', '026-637-2615', null, '1', '1', '2020-08-01 00:00:00', '2020-01-22 00:00:00');
INSERT INTO `docente` VALUES ('79', 'Shaffer', 'Myers', 'Dorothy', 'Octavia', '1', '48111032', '3', 'M', '2020-07-29', null, 'ANT', '771-4477 Sodales Road', '1', '1', 'Cras.lorem.lorem@convallisconv', '011-817-8273', '027-260-7593', null, '1', '1', '2021-02-28 00:00:00', '2019-11-06 00:00:00');
INSERT INTO `docente` VALUES ('80', 'Odom', 'Chen', 'Thomas', 'Fallon', '2', '37988536', '4', 'F', '2021-02-08', null, 'ATL', 'P.O. Box 173, 9396 Dignissim St.', '2', '2', 'urna.Nunc@justo.ca', '013-152-3207', '082-808-4837', null, '1', '1', '2020-05-22 00:00:00', '2019-09-01 00:00:00');
INSERT INTO `docente` VALUES ('81', 'Gilliam', 'Bean', 'Paul', 'Myra', '2', '10886323', '4', 'F', '2021-03-15', null, 'Antioquia', 'P.O. Box 745, 3507 Proin St.', '2', '2', 'Donec@liberonec.edu', '030-284-5688', '038-652-8071', null, '1', '1', '2019-08-23 00:00:00', '2020-11-03 00:00:00');
INSERT INTO `docente` VALUES ('82', 'Larsen', 'Perez', 'Michael', 'Keelie', '2', '33728145', '4', 'F', '2020-09-08', null, 'BOL', 'Ap #567-8758 Congue St.', '2', '2', 'sem@Integermollis.com', '060-873-9587', '074-047-9048', null, '1', '1', '2019-12-29 00:00:00', '2020-12-03 00:00:00');
INSERT INTO `docente` VALUES ('83', 'Leonard', 'Johnston', 'Francesca', 'Rebecca', '2', '8069075', '4', 'F', '2020-12-02', null, 'ANT', '4156 Pellentesque. Av.', '2', '2', 'nec@Morbiquisurna.org', '064-303-5423', '079-269-2387', null, '1', '1', '2020-12-06 00:00:00', '2020-11-04 00:00:00');
INSERT INTO `docente` VALUES ('84', 'Whitley', 'Kim', 'Matthew', 'Britanney', '2', '42426972', '4', 'F', '2020-05-26', null, 'ATL', '9789 Dolor. Av.', '2', '2', 'ipsum@ut.ca', '000-104-1196', '048-268-2005', null, '1', '1', '2019-11-24 00:00:00', '2021-03-19 00:00:00');
INSERT INTO `docente` VALUES ('85', 'Foster', 'Leach', 'Malachi', 'Vance', '2', '21053635', '4', 'F', '2020-10-03', null, 'Bolívar', '898-7390 Ultricies Rd.', '2', '2', 'egestas.urna.justo@lobortisult', '023-379-0324', '044-773-3102', null, '1', '1', '2020-08-06 00:00:00', '2020-08-15 00:00:00');
INSERT INTO `docente` VALUES ('86', 'Black', 'Burch', 'Hanna', 'Dillon', '2', '41179155', '4', 'F', '2020-04-24', null, 'Antioquia', '184-2054 Class Av.', '2', '2', 'Nunc.commodo.auctor@nonummy.or', '095-737-0421', '099-888-8044', null, '1', '1', '2020-10-28 00:00:00', '2020-03-28 00:00:00');
INSERT INTO `docente` VALUES ('87', 'Summers', 'Haynes', 'Adele', 'Allegra', '2', '27333663', '4', 'F', '2021-05-18', null, 'ANT', 'Ap #843-8121 Fusce St.', '2', '2', 'in@Phasellus.ca', '054-515-7320', '021-287-0301', null, '1', '1', '2020-12-01 00:00:00', '2020-04-09 00:00:00');
INSERT INTO `docente` VALUES ('88', 'Contreras', 'Chavez', 'Jasmine', 'Yetta', '2', '33349805', '4', 'F', '2019-07-27', null, 'BOL', '1562 Eu St.', '2', '2', 'ut.nisi@nullaatsem.com', '056-788-1000', '083-168-2943', null, '1', '1', '2020-05-23 00:00:00', '2020-10-16 00:00:00');
INSERT INTO `docente` VALUES ('89', 'Floyd', 'Middleton', 'Mariko', 'Maggy', '2', '14840330', '4', 'F', '2019-09-28', null, 'Antioquia', 'P.O. Box 833, 388 Metus. Rd.', '2', '2', 'lobortis.nisi@quisarcu.org', '070-131-4487', '008-113-9960', null, '1', '1', '2021-04-30 00:00:00', '2020-07-11 00:00:00');
INSERT INTO `docente` VALUES ('90', 'Warren', 'Mills', 'Damon', 'Sandra', '1', '26251288', '1', 'M', '2019-09-29', null, 'ANT', '8567 Est Av.', '1', '1', 'sapien@MaurismagnaDuis.com', '006-665-4767', '041-985-2130', null, '1', '1', '2020-12-01 00:00:00', '2020-10-23 00:00:00');
INSERT INTO `docente` VALUES ('91', 'Weber', 'Spears', 'Micah', 'Yardley', '1', '33865227', '1', 'M', '2020-01-25', null, 'ATL', '632-3476 Pede. Avenue', '1', '1', 'ante@antedictum.net', '027-639-2688', '099-925-8892', null, '1', '1', '2020-08-18 00:00:00', '2020-11-01 00:00:00');
INSERT INTO `docente` VALUES ('92', 'Hutchinson', 'Howell', 'Erica', 'Gareth', '1', '25928106', '1', 'M', '2021-02-16', null, 'Antioquia', 'P.O. Box 849, 9229 Luctus. Ave', '1', '1', 'justo.Praesent@massalobortis.e', '073-730-5247', '083-522-0101', null, '1', '1', '2020-06-11 00:00:00', '2019-08-14 00:00:00');
INSERT INTO `docente` VALUES ('93', 'Torres', 'Huber', 'Dahlia', 'Rachel', '1', '6583626', '1', 'M', '2020-05-04', null, 'ANT', 'P.O. Box 842, 8694 Sed Road', '1', '1', 'Proin@Quisque.com', '006-199-2048', '024-596-2703', null, '1', '1', '2019-11-10 00:00:00', '2021-02-19 00:00:00');
INSERT INTO `docente` VALUES ('94', 'Richards', 'Hicks', 'Carter', 'Lareina', '1', '38465800', '1', 'M', '2019-10-07', null, 'Bolívar', 'P.O. Box 908, 3801 Interdum Av.', '1', '1', 'nisi.a@rutrumjustoPraesent.com', '041-810-2362', '011-646-7675', null, '1', '1', '2021-04-24 00:00:00', '2021-03-17 00:00:00');
INSERT INTO `docente` VALUES ('95', 'Ellison', 'Newman', 'Ila', 'Daria', '1', '19260419', '1', 'M', '2020-01-04', null, 'ANT', '9503 Phasellus Rd.', '1', '1', 'vestibulum.lorem.sit@Suspendis', '007-053-5780', '047-152-6654', null, '1', '1', '2020-10-26 00:00:00', '2020-06-23 00:00:00');
INSERT INTO `docente` VALUES ('96', 'Moreno', 'Hampton', 'Iris', 'Alan', '1', '29883746', '1', 'M', '2019-08-30', null, 'Magdalena', 'Ap #110-8031 Donec Rd.', '1', '1', 'magna.Phasellus.dolor@egestas.', '082-038-3462', '078-016-7896', null, '1', '1', '2020-07-02 00:00:00', '2021-05-21 00:00:00');
INSERT INTO `docente` VALUES ('97', 'Adkins', 'Rodriguez', 'Cara', 'Halee', '1', '31899634', '1', 'M', '2021-04-16', null, 'Bolívar', 'Ap #876-724 Augue Street', '1', '1', 'tempus.eu@sitamet.ca', '023-629-3030', '080-622-8239', null, '1', '1', '2020-02-10 00:00:00', '2020-09-26 00:00:00');
INSERT INTO `docente` VALUES ('98', 'Cain', 'Herrera', 'Jared', 'Quyn', '1', '21782260', '1', 'M', '2020-01-19', null, 'RIS', 'Ap #591-129 Nunc St.', '1', '1', 'Ut@ligulaNullam.ca', '096-428-7538', '004-424-2625', null, '1', '1', '2019-10-19 00:00:00', '2021-03-16 00:00:00');
INSERT INTO `docente` VALUES ('99', 'Tyler', 'Zimmerman', 'Pamela', 'Flynn', '1', '44383465', '1', 'M', '2019-07-17', null, 'Bolívar', 'P.O. Box 909, 914 Eu Rd.', '1', '1', 'ante.bibendum.ullamcorper@vehi', '078-537-2104', '071-285-0543', null, '1', '1', '2019-07-31 00:00:00', '2021-04-11 00:00:00');
INSERT INTO `docente` VALUES ('100', 'Meyer', 'Tran', 'Ahmed', 'Hermione', '2', '13629517', '2', 'F', '2019-08-28', null, 'ATL', '9462 Eros Road', '2', '2', 'sollicitudin.orci.sem@mi.com', '073-301-9094', '012-666-0263', null, '1', '1', '2019-07-24 00:00:00', '2021-05-17 00:00:00');
INSERT INTO `docente` VALUES ('101', 'Hampton', 'Mclaughlin', 'Zia', 'Leonard', '2', '24877465', '2', 'F', '2021-01-18', null, 'ANT', '547-6458 Aliquet Rd.', '2', '2', 'eleifend.non@vehicula.org', '065-889-7236', '039-265-2277', null, '1', '1', '2019-09-18 00:00:00', '2020-12-30 00:00:00');
INSERT INTO `docente` VALUES ('102', 'Jensen', 'Wilder', 'Patrick', 'Wang', '2', '29476216', '2', 'F', '2021-05-10', null, 'BOL', 'P.O. Box 544, 132 Enim. St.', '2', '2', 'arcu.ac@erat.net', '048-342-2997', '064-527-6945', null, '1', '1', '2021-04-02 00:00:00', '2020-05-27 00:00:00');
INSERT INTO `docente` VALUES ('103', 'Cole', 'Goodwin', 'Fulton', 'Georgia', '2', '37592860', '2', 'F', '2020-08-19', null, 'Antioquia', '662-7925 Etiam Avenue', '2', '2', 'sollicitudin.orci.sem@Aliquam.', '097-024-9745', '057-591-3427', null, '1', '1', '2021-04-02 00:00:00', '2019-07-24 00:00:00');
INSERT INTO `docente` VALUES ('104', 'Melendez', 'Sykes', 'Brielle', 'Dalton', '2', '42702851', '2', 'F', '2020-02-08', null, 'Antioquia', 'P.O. Box 637, 743 Leo, Av.', '2', '2', 'Duis.a@nibhAliquam.co.uk', '032-642-0719', '065-356-7526', null, '1', '1', '2019-12-22 00:00:00', '2021-06-12 00:00:00');
INSERT INTO `docente` VALUES ('105', 'Robles', 'Mckenzie', 'Lavinia', 'Cara', '2', '9587814', '2', 'F', '2020-06-05', null, 'Antioquia', 'P.O. Box 346, 1255 A St.', '2', '2', 'adipiscing@montesnasceturridic', '094-376-8677', '051-057-8905', null, '1', '1', '2020-12-23 00:00:00', '2021-03-31 00:00:00');
INSERT INTO `docente` VALUES ('106', 'Olsen', 'Moon', 'Shad', 'Jocelyn', '2', '19855856', '2', 'F', '2020-01-12', null, 'ANT', '866-7551 Magna St.', '2', '2', 'aliquet.Phasellus.fermentum@Ae', '098-793-7165', '033-424-6480', null, '1', '1', '2021-02-04 00:00:00', '2020-07-25 00:00:00');
INSERT INTO `docente` VALUES ('107', 'Boyer', 'Dodson', 'Hanae', 'Isaiah', '2', '14804580', '2', 'F', '2021-03-10', null, 'Antioquia', '744-649 Magna. St.', '2', '2', 'augue.porttitor.interdum@nunc.', '051-228-0629', '093-937-5956', null, '1', '1', '2020-11-21 00:00:00', '2019-11-18 00:00:00');
INSERT INTO `docente` VALUES ('108', 'Gordon', 'Blair', 'Sloane', 'Todd', '2', '6895643', '2', 'F', '2019-12-14', null, 'ANT', 'P.O. Box 590, 1720 Euismod Rd.', '2', '2', 'massa@sitametdapibus.co.uk', '073-839-1449', '022-159-4798', null, '1', '1', '2021-03-10 00:00:00', '2020-04-25 00:00:00');
INSERT INTO `docente` VALUES ('109', 'Nelson', 'Winters', 'Brittany', 'Janna', '2', '26478558', '2', 'F', '2019-10-22', null, 'BOL', 'P.O. Box 798, 989 In Rd.', '2', '2', 'tempus.risus@accumsan.co.uk', '047-429-6365', '022-427-6871', null, '1', '1', '2019-12-28 00:00:00', '2020-02-15 00:00:00');
INSERT INTO `docente` VALUES ('110', 'fsadfasdf', 'sdfsdf', 'sadfsdfsadf', 'dfsadfasdf', '1', '24234242', '1', 'M', '2019-07-03', null, '34242', '4234243', '5', '76', 'ldfsff@gmail.com', '2342424', '23423', null, '1', '1', '2020-08-21 03:41:51', '2020-08-21 03:41:51');
INSERT INTO `docente` VALUES ('111', 'aaaaaa', 'aaaa', 'aaa', 'aaa', '1', 'ssss', '1', 'M', '2020-05-04', null, 'sss', 'ssss', '5', '76', '3y4st5z@g0a53.cOM', '333333', '3333', null, '1', '1', '2020-09-02 11:07:40', '2020-09-02 11:07:40');
INSERT INTO `docente` VALUES ('112', 'mastro', 'aaa', 'luis', 'jose', '1', '1223333', '1', 'M', '2019-02-06', 'dssdgs', 'ggsdgsdg', 'gsgsdg', '11', '76', 'lyustiz@sdjhjkshjdfks', '5435345', '5345353', 'fggdgdg', '1', '1', '2020-09-03 01:02:47', '2020-09-03 01:02:47');

-- ----------------------------
-- Table structure for docente_grupo
-- ----------------------------
DROP TABLE IF EXISTS `docente_grupo`;
CREATE TABLE `docente_grupo` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_docente` int(11) NOT NULL,
  `id_grupo` int(11) NOT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of docente_grupo
-- ----------------------------
INSERT INTO `docente_grupo` VALUES ('7', '1', '1', null, '1', '1', '2020-07-06 18:10:46', '2020-07-06 18:10:46');
INSERT INTO `docente_grupo` VALUES ('8', '2', '2', null, '1', '1', '2020-07-06 19:29:21', '2020-07-06 19:29:21');
INSERT INTO `docente_grupo` VALUES ('9', '1', '3', null, '1', '1', '2020-07-06 19:30:02', '2020-07-06 19:30:02');

-- ----------------------------
-- Table structure for docente_materia
-- ----------------------------
DROP TABLE IF EXISTS `docente_materia`;
CREATE TABLE `docente_materia` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_docente` int(11) NOT NULL,
  `id_materia` int(11) NOT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of docente_materia
-- ----------------------------
INSERT INTO `docente_materia` VALUES ('2', '2', '13', null, '1', '1', '2020-06-11 21:15:51', '2020-06-11 21:15:51');
INSERT INTO `docente_materia` VALUES ('4', '2', '10', null, '1', '1', '2020-06-11 22:09:02', '2020-06-11 22:09:02');
INSERT INTO `docente_materia` VALUES ('24', '1', '3', null, '1', '1', '2020-06-13 13:07:02', '2020-06-13 13:07:02');
INSERT INTO `docente_materia` VALUES ('25', '1', '4', null, '1', '1', '2020-06-13 13:07:09', '2020-06-13 13:07:09');
INSERT INTO `docente_materia` VALUES ('26', '1', '1', null, '1', '1', '2020-06-13 13:09:04', '2020-06-13 13:09:04');
INSERT INTO `docente_materia` VALUES ('27', '10', '19', null, '1', '1', '2020-07-09 22:06:39', '2020-07-09 22:06:39');
INSERT INTO `docente_materia` VALUES ('28', '16', '20', null, '1', '1', '2020-07-09 22:06:51', '2020-07-09 22:06:51');
INSERT INTO `docente_materia` VALUES ('29', '12', '7', null, '1', '1', '2020-07-09 22:07:13', '2020-07-09 22:07:13');
INSERT INTO `docente_materia` VALUES ('30', '13', '11', null, '1', '1', '2020-07-09 22:14:50', '2020-07-09 22:14:50');
INSERT INTO `docente_materia` VALUES ('31', '12', '8', null, '1', '1', '2020-07-09 22:15:00', '2020-07-09 22:15:00');
INSERT INTO `docente_materia` VALUES ('32', '14', '13', null, '1', '1', '2020-07-09 22:15:09', '2020-07-09 22:15:09');
INSERT INTO `docente_materia` VALUES ('33', '14', '14', null, '1', '1', '2020-07-09 22:15:20', '2020-07-09 22:15:20');
INSERT INTO `docente_materia` VALUES ('34', '14', '12', null, '1', '1', '2020-07-09 22:15:28', '2020-07-09 22:15:28');
INSERT INTO `docente_materia` VALUES ('35', '11', '16', null, '1', '1', '2020-07-09 22:15:42', '2020-07-09 22:15:42');
INSERT INTO `docente_materia` VALUES ('36', '11', '15', null, '1', '1', '2020-07-09 22:15:47', '2020-07-09 22:15:47');
INSERT INTO `docente_materia` VALUES ('37', '1', '7', null, '1', '1', '2020-07-09 22:48:21', '2020-07-09 22:48:21');
INSERT INTO `docente_materia` VALUES ('38', '1', '19', null, '1', '1', '2020-07-09 22:48:25', '2020-07-09 22:48:25');
INSERT INTO `docente_materia` VALUES ('39', '1', '20', null, '1', '1', '2020-07-09 22:48:30', '2020-07-09 22:48:30');
INSERT INTO `docente_materia` VALUES ('40', '13', '17', null, '1', '1', '2020-07-10 01:16:04', '2020-07-10 01:16:04');
INSERT INTO `docente_materia` VALUES ('41', '1', '14', null, '1', '1', '2020-07-14 02:40:50', '2020-07-14 02:40:50');
INSERT INTO `docente_materia` VALUES ('42', '1', '17', null, '1', '1', '2020-07-14 02:40:59', '2020-07-14 02:40:59');

-- ----------------------------
-- Table structure for documento
-- ----------------------------
DROP TABLE IF EXISTS `documento`;
CREATE TABLE `documento` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_tipo_documento` int(11) NOT NULL,
  `nb_documento` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_archivo` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of documento
-- ----------------------------

-- ----------------------------
-- Table structure for empleado
-- ----------------------------
DROP TABLE IF EXISTS `empleado`;
CREATE TABLE `empleado` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_apellido` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nb_apellido2` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nb_nombre` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nb_nombre2` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_tipo_documento` int(11) NOT NULL,
  `tx_documento` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_estado_civil` int(11) NOT NULL,
  `tx_sexo` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fe_nacimiento` date NOT NULL,
  `tx_lugar_nacimiento` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_direccion` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_departamento` int(11) NOT NULL,
  `id_ciudad` int(11) NOT NULL,
  `tx_email` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_telefono` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_telefono_movil` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_cargo` int(11) NOT NULL,
  `bo_profesor` tinyint(1) DEFAULT 0,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of empleado
-- ----------------------------
INSERT INTO `empleado` VALUES ('1', 'Medina', 'Romero', 'Juan', 'Carlos', '1', '4534535345', '1', 'M', '1972-02-09', 'Cali', 'Calle 46 con 42', '76', '76', 'lyustiz@gmail.com', '02340009988', '02340009988', '3', '1', null, '1', '1', '2020-05-14 00:05:09', '2020-05-16 01:50:26');
INSERT INTO `empleado` VALUES ('10', 'Holmes', 'Velez', 'Grant', 'Oprah', '1', '16317983', '1', 'M', '2021-01-04', 'ATL', '798-1556 Nullam St.', '1', '1', 'Nunc.ac.sem@inaliquet.net', '023-008-5289', '036-663-5987', '3', '0', null, '1', '1', '2020-06-23 00:00:00', '2020-03-08 00:00:00');
INSERT INTO `empleado` VALUES ('11', 'Orr', 'Guerra', 'Cally', 'Henry', '1', '37876346', '1', 'M', '2019-08-29', 'ANT', '1290 Molestie Street', '1', '1', 'libero.est.congue@quam.com', '005-709-8152', '069-917-4561', '3', '0', null, '1', '1', '2021-02-09 00:00:00', '2021-05-12 00:00:00');
INSERT INTO `empleado` VALUES ('12', 'Robles', 'Hogan', 'Illiana', 'Shaeleigh', '1', '14666366', '1', 'M', '2020-09-26', 'ATL', '9203 Aliquam St.', '1', '1', 'dolor.dapibus.gravida@nonsolli', '017-068-4525', '055-761-8666', '4', '0', null, '1', '1', '2019-08-09 00:00:00', '2021-03-24 00:00:00');
INSERT INTO `empleado` VALUES ('13', 'Carroll', 'Wright', 'Isaac', 'Robert', '1', '39719901', '1', 'M', '2021-02-03', 'ANT', 'Ap #453-8112 Ut St.', '1', '1', 'rutrum@elementumpurusaccumsan.', '094-781-8882', '068-213-2544', '4', '0', null, '1', '1', '2020-11-27 00:00:00', '2019-08-01 00:00:00');
INSERT INTO `empleado` VALUES ('14', 'Waller', 'Collier', 'Preston', 'Raven', '1', '8630062', '1', 'M', '2019-11-17', 'Sucre', '810-4329 Facilisis Rd.', '1', '1', 'commodo@scelerisquenequesed.ed', '023-655-7916', '054-659-2726', '3', '0', null, '1', '1', '2021-01-13 00:00:00', '2020-11-19 00:00:00');
INSERT INTO `empleado` VALUES ('15', 'Holloway', 'Lewis', 'Arden', 'Lacy', '1', '9381973', '1', 'M', '2021-06-04', 'Antioquia', 'P.O. Box 916, 4514 Auctor St.', '1', '1', 'Nulla.semper.tellus@blandit.co', '062-244-2969', '078-293-7365', '3', '1', null, '1', '1', '2021-05-20 00:00:00', '2021-01-20 00:00:00');
INSERT INTO `empleado` VALUES ('16', 'Chapman', 'Britt', 'Keelie', 'Cody', '1', '12001103', '1', 'M', '2021-02-07', 'RIS', 'Ap #366-6886 Vitae, Street', '1', '1', 'non.luctus.sit@mollisnoncursus', '047-372-0906', '035-364-6680', '4', '1', null, '1', '1', '2020-11-01 00:00:00', '2020-07-26 00:00:00');
INSERT INTO `empleado` VALUES ('17', 'Hines', 'Wilkins', 'Reece', 'Adam', '1', '42613643', '1', 'M', '2020-01-02', 'ANT', 'Ap #686-7201 Urna. Rd.', '1', '1', 'est.Nunc@necluctusfelis.ca', '070-636-8295', '076-942-7468', '4', '1', null, '1', '1', '2019-08-01 00:00:00', '2020-02-04 00:00:00');
INSERT INTO `empleado` VALUES ('18', 'Lindsay', 'Spears', 'Veda', 'Nola', '1', '26217054', '1', 'M', '2020-07-21', 'Atlántico', '709-1783 Ut Avenue', '1', '1', 'malesuada@atvelit.co.uk', '066-360-2345', '090-937-2595', '3', '1', null, '1', '1', '2020-02-14 00:00:00', '2019-09-08 00:00:00');
INSERT INTO `empleado` VALUES ('19', 'Maynard', 'Mack', 'Lewis', 'Shay', '1', '44035690', '1', 'M', '2019-10-07', 'Bolívar', '3877 Nam St.', '1', '1', 'scelerisque@necurnaet.net', '012-543-6354', '030-496-0255', '3', '0', null, '1', '1', '2020-10-18 00:00:00', '2020-06-22 00:00:00');
INSERT INTO `empleado` VALUES ('20', 'Kennedy', 'Hardin', 'Laura', 'Channing', '2', '7728950', '2', 'F', '2020-08-19', 'Antioquia', '7609 Aliquam St.', '2', '2', 'a.auctor.non@dui.org', '065-150-2665', '014-647-6866', '4', '1', null, '1', '1', '2021-06-05 00:00:00', '2020-12-30 00:00:00');
INSERT INTO `empleado` VALUES ('21', 'Valentine', 'Taylor', 'Cynthia', 'Audra', '2', '23402716', '2', 'F', '2021-03-21', 'ANT', '2416 Suspendisse St.', '2', '2', 'nec@lacusCrasinterdum.org', '024-225-8181', '012-420-6626', '4', '0', null, '1', '1', '2020-11-28 00:00:00', '2020-09-24 00:00:00');
INSERT INTO `empleado` VALUES ('22', 'Joyce', 'Berger', 'Denise', 'Samuel', '2', '5240409', '2', 'F', '2021-01-10', 'ANT', 'P.O. Box 160, 3362 Semper Rd.', '2', '2', 'Donec@elit.net', '006-839-1341', '067-915-3724', '3', '0', null, '1', '1', '2020-05-08 00:00:00', '2020-12-12 00:00:00');
INSERT INTO `empleado` VALUES ('23', 'Lyons', 'Freeman', 'Tanner', 'Francis', '2', '20856503', '2', 'F', '2020-02-18', 'Atlántico', '9043 Pellentesque Av.', '2', '2', 'velit@tincidunt.ca', '095-200-1165', '067-514-8454', '3', '0', null, '1', '1', '2019-07-14 00:00:00', '2019-08-02 00:00:00');
INSERT INTO `empleado` VALUES ('24', 'Lopez', 'Johns', 'Blaine', 'Quyn', '2', '16467867', '2', 'F', '2020-08-01', 'Antioquia', '915-9698 Sagittis. St.', '2', '2', 'at.auctor.ullamcorper@felispur', '063-885-7620', '059-756-2550', '4', '0', null, '1', '1', '2021-02-23 00:00:00', '2019-07-20 00:00:00');
INSERT INTO `empleado` VALUES ('25', 'Giles', 'Wyatt', 'Kato', 'Harrison', '2', '36032357', '2', 'F', '2021-01-21', 'Bolívar', '2320 Nonummy Road', '2', '2', 'ante@Sedet.edu', '045-035-7620', '091-480-5868', '4', '1', null, '1', '1', '2021-05-03 00:00:00', '2019-09-25 00:00:00');
INSERT INTO `empleado` VALUES ('26', 'Patrick', 'Middleton', 'Ciaran', 'Signe', '2', '21214812', '2', 'F', '2021-01-20', 'CAQ', 'Ap #223-3285 Dapibus Avenue', '2', '2', 'Cras.eu.tellus@tellusAenean.co', '023-361-3728', '006-409-6035', '3', '0', null, '1', '1', '2021-07-01 00:00:00', '2020-03-28 00:00:00');
INSERT INTO `empleado` VALUES ('27', 'Hebert', 'Chaney', 'Abra', 'Margaret', '2', '15652605', '2', 'F', '2020-04-18', 'Antioquia', 'Ap #747-4621 Elit St.', '2', '2', 'nec.cursus@seddictum.edu', '033-315-5850', '046-251-8218', '3', '1', null, '1', '1', '2020-02-03 00:00:00', '2021-03-17 00:00:00');
INSERT INTO `empleado` VALUES ('28', 'Waters', 'Duran', 'Oprah', 'Lane', '2', '32846443', '2', 'F', '2020-07-07', 'ANT', '856-6485 Venenatis Rd.', '2', '2', 'pharetra@Suspendissecommodo.or', '076-811-1673', '005-236-5951', '4', '1', null, '1', '1', '2019-07-29 00:00:00', '2020-02-09 00:00:00');
INSERT INTO `empleado` VALUES ('29', 'Coffey', 'Stein', 'Jessamine', 'Harper', '2', '34692530', '2', 'F', '2021-04-13', 'Atlántico', 'P.O. Box 145, 1403 Pede Avenue', '2', '2', 'Curabitur@Quisquepurussapien.c', '032-207-3138', '011-782-4921', '4', '0', null, '1', '1', '2019-07-22 00:00:00', '2019-07-08 00:00:00');
INSERT INTO `empleado` VALUES ('30', 'Hull', 'Riggs', 'Martin', 'Macy', '1', '35577203', '3', 'M', '2020-01-26', 'ANT', 'Ap #566-7476 Nec, St.', '1', '1', 'placerat.orci.lacus@vitaeeratV', '064-310-4181', '062-569-6920', '3', '1', null, '1', '1', '2021-01-12 00:00:00', '2021-01-13 00:00:00');
INSERT INTO `empleado` VALUES ('31', 'West', 'Jennings', 'Teegan', 'Amir', '1', '16916006', '3', 'M', '2021-01-26', 'ANT', '7356 Arcu. Ave', '1', '1', 'eget.varius@convallisdolor.ca', '013-077-1215', '029-260-8158', '3', '1', null, '1', '1', '2019-09-25 00:00:00', '2019-10-27 00:00:00');
INSERT INTO `empleado` VALUES ('32', 'Perry', 'Huffman', 'Josephine', 'Ali', '1', '15031003', '3', 'M', '2019-09-18', 'ANT', '3609 Condimentum Street', '1', '1', 'nulla.magna.malesuada@ligulaco', '095-324-2292', '069-660-9280', '4', '0', null, '1', '1', '2020-05-17 00:00:00', '2020-11-03 00:00:00');
INSERT INTO `empleado` VALUES ('33', 'Murray', 'Mitchell', 'Rhona', 'Zephania', '1', '23655662', '3', 'M', '2019-12-19', 'Antioquia', '604-8964 Enim Ave', '1', '1', 'gravida@ametconsectetuer.ca', '011-971-4491', '054-971-5731', '4', '1', null, '1', '1', '2020-04-19 00:00:00', '2019-11-21 00:00:00');
INSERT INTO `empleado` VALUES ('34', 'Hancock', 'Ramirez', 'Felicia', 'Daphne', '1', '16662030', '3', 'M', '2019-08-12', 'Antioquia', 'P.O. Box 166, 7441 Orci. Avenue', '1', '1', 'interdum.feugiat@amet.org', '056-918-2930', '040-728-9626', '3', '0', null, '1', '1', '2021-04-22 00:00:00', '2019-10-20 00:00:00');
INSERT INTO `empleado` VALUES ('35', 'Gross', 'Burch', 'Cairo', 'Caldwell', '1', '28151091', '3', 'M', '2019-08-21', 'ANT', '750-8776 Libero. Avenue', '1', '1', 'interdum@tortor.edu', '013-374-5762', '022-929-4157', '3', '0', null, '1', '1', '2019-09-05 00:00:00', '2021-06-13 00:00:00');
INSERT INTO `empleado` VALUES ('36', 'Houston', 'Haney', 'Freya', 'Blossom', '1', '14902361', '3', 'M', '2019-09-16', 'BOL', '9751 Ut, Road', '1', '1', 'Nam.consequat.dolor@Etiamimper', '042-009-1067', '011-911-9294', '4', '1', null, '1', '1', '2020-07-29 00:00:00', '2021-04-19 00:00:00');
INSERT INTO `empleado` VALUES ('37', 'Bean', 'Rosales', 'Cullen', 'Constance', '1', '35566312', '3', 'M', '2019-12-08', 'Antioquia', '8638 Tempor Ave', '1', '1', 'neque.Nullam.ut@in.net', '019-191-8739', '067-668-4753', '4', '0', null, '1', '1', '2021-01-05 00:00:00', '2021-06-15 00:00:00');
INSERT INTO `empleado` VALUES ('38', 'Hatfield', 'Cote', 'Melanie', 'Uma', '1', '6180223', '3', 'M', '2020-06-26', 'ATL', 'P.O. Box 502, 7727 Dolor. Ave', '1', '1', 'consequat.nec@tellusAeneaneges', '000-381-0673', '057-190-5126', '3', '1', null, '1', '1', '2021-07-03 00:00:00', '2020-01-02 00:00:00');
INSERT INTO `empleado` VALUES ('39', 'Camacho', 'Hughes', 'Kristen', 'Charissa', '1', '47650661', '3', 'M', '2019-09-19', 'Bolívar', 'Ap #768-5451 Mauris Av.', '1', '1', 'Donec.est@rhoncus.net', '001-550-9943', '011-188-2437', '3', '1', null, '1', '1', '2020-06-15 00:00:00', '2019-12-05 00:00:00');
INSERT INTO `empleado` VALUES ('40', 'Berry', 'Franklin', 'Mira', 'Chaim', '2', '41627531', '4', 'F', '2019-09-24', 'ANT', 'P.O. Box 129, 4787 Tristique Avenue', '2', '2', 'interdum.ligula.eu@nunc.com', '007-119-6351', '056-638-5918', '4', '1', null, '1', '1', '2019-09-21 00:00:00', '2021-05-21 00:00:00');
INSERT INTO `empleado` VALUES ('41', 'Phillips', 'Martin', 'Alan', 'Chelsea', '2', '11471214', '4', 'F', '2020-08-04', 'BOL', '563-4365 Tempus Av.', '2', '2', 'mi.ac@vitae.co.uk', '024-860-8291', '063-579-0616', '4', '0', null, '1', '1', '2020-03-05 00:00:00', '2020-02-02 00:00:00');
INSERT INTO `empleado` VALUES ('42', 'Guerra', 'Robbins', 'Porter', 'Deacon', '2', '10687723', '4', 'F', '2020-11-26', 'Antioquia', 'P.O. Box 438, 2821 Neque. Road', '2', '2', 'porttitor@rhoncusid.org', '036-487-4294', '006-244-3418', '3', '0', null, '1', '1', '2021-01-04 00:00:00', '2020-09-10 00:00:00');
INSERT INTO `empleado` VALUES ('43', 'Meadows', 'Bernard', 'Donovan', 'Sylvia', '2', '42520030', '4', 'F', '2020-12-20', 'BOL', '177-7596 Duis Road', '2', '2', 'lacus@ridiculusmusDonec.net', '025-459-5322', '085-013-2378', '3', '1', null, '1', '1', '2020-02-13 00:00:00', '2020-11-12 00:00:00');
INSERT INTO `empleado` VALUES ('44', 'Rivera', 'Macdonald', 'Callum', 'Steel', '2', '32545519', '4', 'F', '2021-04-06', 'Guainía', 'P.O. Box 490, 7355 Turpis Rd.', '2', '2', 'eu.tellus.Phasellus@vitaemauri', '047-289-9547', '015-938-2410', '4', '0', null, '1', '1', '2019-10-27 00:00:00', '2021-02-18 00:00:00');
INSERT INTO `empleado` VALUES ('45', 'Carver', 'Gibbs', 'Lydia', 'Lunea', '2', '44355741', '4', 'F', '2020-05-27', 'ANT', 'Ap #626-6275 Aenean Street', '2', '2', 'ullamcorper.eu.euismod@Lorem.n', '088-705-4742', '098-270-7371', '4', '0', null, '1', '1', '2021-03-02 00:00:00', '2020-05-03 00:00:00');
INSERT INTO `empleado` VALUES ('46', 'Barrera', 'Blackburn', 'Orli', 'India', '2', '14497072', '4', 'F', '2019-11-28', 'ANT', '163 Id Avenue', '2', '2', 'Vivamus.molestie.dapibus@neclu', '053-542-5308', '055-207-9843', '3', '0', null, '1', '1', '2019-12-12 00:00:00', '2021-02-03 00:00:00');
INSERT INTO `empleado` VALUES ('47', 'Solomon', 'Pierce', 'Cara', 'Dillon', '2', '25895648', '4', 'F', '2021-02-24', 'Antioquia', 'P.O. Box 521, 7179 Libero Ave', '2', '2', 'vehicula.et@sitametconsectetue', '047-038-4018', '055-995-7427', '3', '0', null, '1', '1', '2021-03-08 00:00:00', '2020-04-05 00:00:00');
INSERT INTO `empleado` VALUES ('48', 'Pena', 'Johnson', 'Amena', 'Kirby', '2', '12126312', '4', 'F', '2020-07-07', 'ANT', 'Ap #672-5560 Arcu. St.', '2', '2', 'a.dui@musDonec.com', '026-555-3277', '017-948-5642', '4', '1', null, '1', '1', '2020-01-11 00:00:00', '2020-09-30 00:00:00');
INSERT INTO `empleado` VALUES ('49', 'Cooke', 'Mitchell', 'Hiroko', 'Branden', '2', '41253847', '4', 'F', '2020-02-01', 'HUI', 'Ap #248-4473 Phasellus Rd.', '2', '2', 'tellus@loremloremluctus.co.uk', '000-990-7635', '099-560-5895', '4', '1', null, '1', '1', '2020-05-26 00:00:00', '2019-07-08 00:00:00');
INSERT INTO `empleado` VALUES ('50', 'Cameron', 'Bright', 'Zenia', 'Kareem', '1', '29484299', '1', 'M', '2020-08-26', 'BOL', 'Ap #648-9129 Proin Rd.', '1', '1', 'risus.varius@Sed.net', '049-000-8004', '004-814-0503', '3', '1', null, '1', '1', '2020-04-29 00:00:00', '2021-01-06 00:00:00');
INSERT INTO `empleado` VALUES ('51', 'Fleming', 'Dennis', 'Maggy', 'Harriet', '1', '19850495', '1', 'M', '2020-02-23', 'ANT', 'Ap #740-5739 Feugiat Street', '1', '1', 'dui@auguemalesuadamalesuada.ca', '024-061-8722', '099-035-3204', '3', '0', null, '1', '1', '2019-11-07 00:00:00', '2021-04-02 00:00:00');
INSERT INTO `empleado` VALUES ('52', 'House', 'Kaufman', 'Otto', 'Gloria', '1', '21169831', '1', 'M', '2019-07-15', 'BOL', 'P.O. Box 897, 8358 A, Ave', '1', '1', 'adipiscing.elit.Etiam@auctorqu', '014-517-1582', '058-740-9194', '4', '1', null, '1', '1', '2020-02-17 00:00:00', '2021-05-13 00:00:00');
INSERT INTO `empleado` VALUES ('53', 'Melton', 'Clemons', 'Lamar', 'Donna', '1', '31425600', '1', 'M', '2020-03-12', 'Atlántico', '285-2778 Cursus Rd.', '1', '1', 'imperdiet.ullamcorper.Duis@vul', '007-843-6926', '067-368-4746', '4', '0', null, '1', '1', '2020-10-14 00:00:00', '2021-05-27 00:00:00');
INSERT INTO `empleado` VALUES ('54', 'Page', 'Summers', 'Hamilton', 'Cara', '1', '45077833', '1', 'M', '2021-05-06', 'San Andrés y Providencia', 'P.O. Box 332, 2593 Vivamus Avenue', '1', '1', 'Praesent.luctus@tellusidnunc.c', '058-957-4634', '062-219-8458', '3', '1', null, '1', '1', '2020-01-31 00:00:00', '2020-01-25 00:00:00');
INSERT INTO `empleado` VALUES ('55', 'Roach', 'Hinton', 'Ignatius', 'Lee', '1', '40047436', '1', 'M', '2019-09-17', 'ANT', '910-402 Dolor St.', '1', '1', 'molestie@nec.ca', '058-951-7726', '036-719-0365', '3', '0', null, '1', '1', '2021-02-07 00:00:00', '2021-04-20 00:00:00');
INSERT INTO `empleado` VALUES ('56', 'Moses', 'Mitchell', 'Althea', 'Kieran', '1', '40268268', '1', 'M', '2019-10-08', 'NAR', 'P.O. Box 173, 8885 Nunc. St.', '1', '1', 'lectus.convallis@Quisquetincid', '043-148-0746', '060-188-0824', '4', '1', null, '1', '1', '2020-08-11 00:00:00', '2019-10-30 00:00:00');
INSERT INTO `empleado` VALUES ('57', 'Farrell', 'Baird', 'Aaron', 'Cyrus', '1', '25416239', '1', 'M', '2020-10-27', 'Atlántico', '611-2151 Faucibus Rd.', '1', '1', 'ut.pellentesque@Lorem.com', '005-726-6995', '097-886-9167', '4', '1', null, '1', '1', '2020-03-06 00:00:00', '2020-06-01 00:00:00');
INSERT INTO `empleado` VALUES ('58', 'Horne', 'Odom', 'Linda', 'Mohammad', '1', '45789060', '1', 'M', '2019-08-13', 'Bolívar', 'P.O. Box 360, 7999 Nec Street', '1', '1', 'Donec.felis@nonlaciniaat.ca', '061-227-7434', '021-904-0323', '3', '0', null, '1', '1', '2021-06-21 00:00:00', '2020-11-21 00:00:00');
INSERT INTO `empleado` VALUES ('59', 'Mack', 'Bishop', 'Lisandra', 'Mechelle', '1', '20840482', '1', 'M', '2020-02-28', 'ANT', '3043 Inceptos Road', '1', '1', 'mattis.Integer.eu@nuncullamcor', '067-623-4124', '033-932-3898', '3', '1', null, '1', '1', '2020-03-28 00:00:00', '2020-10-06 00:00:00');
INSERT INTO `empleado` VALUES ('60', 'Moss', 'Villarreal', 'Ivy', 'Leslie', '2', '47952920', '2', 'F', '2021-05-16', 'Atlántico', '335-6409 Bibendum Street', '2', '2', 'nunc.ac.mattis@egetipsumSuspen', '085-608-7946', '034-758-1457', '4', '0', null, '1', '1', '2019-10-19 00:00:00', '2020-06-08 00:00:00');
INSERT INTO `empleado` VALUES ('61', 'Case', 'Weber', 'Vanna', 'Callum', '2', '44015950', '2', 'F', '2021-05-05', 'ANT', '882-3489 Sem. Av.', '2', '2', 'erat.volutpat.Nulla@consectetu', '047-996-7191', '005-874-7365', '4', '0', null, '1', '1', '2020-08-03 00:00:00', '2019-09-16 00:00:00');
INSERT INTO `empleado` VALUES ('62', 'Guy', 'Patterson', 'Nash', 'Derek', '2', '9828559', '2', 'F', '2021-06-29', 'Antioquia', 'Ap #978-9675 Nulla Rd.', '2', '2', 'penatibus@odiovelest.ca', '090-221-6345', '099-959-1938', '3', '1', null, '1', '1', '2021-01-07 00:00:00', '2020-07-14 00:00:00');
INSERT INTO `empleado` VALUES ('63', 'Weber', 'Murphy', 'Kelsie', 'Dylan', '2', '35221489', '2', 'F', '2019-11-03', 'ATL', 'Ap #597-1108 In Avenue', '2', '2', 'gravida@loremegetmollis.com', '035-518-9171', '079-141-2618', '3', '1', null, '1', '1', '2021-06-06 00:00:00', '2020-05-01 00:00:00');
INSERT INTO `empleado` VALUES ('64', 'Hodge', 'Holloway', 'Kaye', 'Paula', '2', '31758900', '2', 'F', '2019-12-18', 'ANT', 'P.O. Box 534, 6461 Laoreet, Street', '2', '2', 'sem@sedconsequat.edu', '029-242-4540', '014-346-7535', '4', '1', null, '1', '1', '2020-12-24 00:00:00', '2019-12-04 00:00:00');
INSERT INTO `empleado` VALUES ('65', 'Conway', 'Davidson', 'Sarah', 'Ruth', '2', '50471291', '2', 'F', '2020-08-06', 'ANT', 'Ap #208-492 Ut Rd.', '2', '2', 'Aliquam.erat.volutpat@morbitri', '053-470-5184', '069-584-1816', '4', '1', null, '1', '1', '2020-08-05 00:00:00', '2020-08-14 00:00:00');
INSERT INTO `empleado` VALUES ('66', 'Hogan', 'Cooke', 'Mollie', 'Tamekah', '2', '16188857', '2', 'F', '2020-04-22', 'ANT', '8800 Duis Rd.', '2', '2', 'nisi.sem.semper@Integereu.net', '069-081-9256', '067-370-1407', '3', '0', null, '1', '1', '2021-02-18 00:00:00', '2020-06-07 00:00:00');
INSERT INTO `empleado` VALUES ('67', 'Ramirez', 'Collins', 'Abel', 'Gay', '2', '32098671', '2', 'F', '2020-11-24', 'Antioquia', 'P.O. Box 724, 192 Sed Av.', '2', '2', 'ullamcorper.magna.Sed@sceleris', '084-938-9348', '069-847-5081', '3', '1', null, '1', '1', '2020-07-29 00:00:00', '2020-07-28 00:00:00');
INSERT INTO `empleado` VALUES ('68', 'Mayo', 'Mcintyre', 'Herman', 'Zelenia', '2', '48374559', '2', 'F', '2021-03-21', 'ANT', 'Ap #258-3235 Risus. Street', '2', '2', 'non.justo.Proin@egettinciduntd', '098-703-3212', '082-682-9484', '4', '0', null, '1', '1', '2019-08-06 00:00:00', '2020-12-13 00:00:00');
INSERT INTO `empleado` VALUES ('69', 'Clay', 'Newton', 'Fay', 'Kylee', '2', '48289272', '2', 'F', '2020-11-15', 'Atlántico', 'P.O. Box 685, 6278 Aliquet Av.', '2', '2', 'lorem.sit@nonegestas.edu', '070-566-1929', '021-841-7500', '4', '1', null, '1', '1', '2020-08-07 00:00:00', '2020-03-04 00:00:00');
INSERT INTO `empleado` VALUES ('70', 'Booth', 'Hoover', 'Basil', 'Anjolie', '1', '34786808', '3', 'M', '2020-06-25', 'Santander', 'Ap #879-8626 Id, Av.', '1', '1', 'lorem.semper.auctor@mus.org', '019-173-0700', '067-803-8632', '3', '1', null, '1', '1', '2021-01-11 00:00:00', '2019-10-17 00:00:00');
INSERT INTO `empleado` VALUES ('71', 'Haley', 'Whitaker', 'Kuame', 'Tatum', '1', '10579789', '3', 'M', '2020-07-04', 'CAS', '8054 Magna Rd.', '1', '1', 'ac.metus@odiosemper.co.uk', '075-981-3946', '008-149-6590', '3', '0', null, '1', '1', '2019-10-15 00:00:00', '2021-04-16 00:00:00');
INSERT INTO `empleado` VALUES ('72', 'Tate', 'Williams', 'Colin', 'Amos', '1', '6436355', '3', 'M', '2020-10-06', 'Atlántico', '488 Dui. St.', '1', '1', 'arcu@tellusjustosit.org', '060-545-8402', '074-634-8905', '4', '1', null, '1', '1', '2019-11-27 00:00:00', '2021-01-03 00:00:00');
INSERT INTO `empleado` VALUES ('73', 'Neal', 'Dotson', 'Molly', 'Geraldine', '1', '40351087', '3', 'M', '2020-12-26', 'GUA', '4341 Ornare, Avenue', '1', '1', 'ipsum.leo@Sedetlibero.edu', '003-954-6690', '087-043-8894', '4', '0', null, '1', '1', '2019-09-12 00:00:00', '2021-06-20 00:00:00');
INSERT INTO `empleado` VALUES ('74', 'Sparks', 'Rasmussen', 'Cassady', 'Rafael', '1', '27498740', '3', 'M', '2019-10-03', 'ATL', '767-7297 Tristique Avenue', '1', '1', 'id.libero.Donec@sedliberoProin', '010-166-6608', '000-339-4898', '3', '1', null, '1', '1', '2021-05-31 00:00:00', '2021-02-20 00:00:00');
INSERT INTO `empleado` VALUES ('75', 'Obrien', 'Nash', 'Emerson', 'Quamar', '1', '30245195', '3', 'M', '2019-07-12', 'ANT', 'P.O. Box 820, 7927 Gravida Street', '1', '1', 'felis.adipiscing.fringilla@etm', '055-598-8132', '077-032-2325', '3', '1', null, '1', '1', '2020-05-24 00:00:00', '2020-03-25 00:00:00');
INSERT INTO `empleado` VALUES ('76', 'Marquez', 'Sherman', 'Cameron', 'Ashton', '1', '39769397', '3', 'M', '2019-12-11', 'ANT', 'Ap #714-8998 Et St.', '1', '1', 'sodales.at.velit@enimnon.edu', '010-795-1258', '073-408-7276', '4', '0', null, '1', '1', '2020-02-05 00:00:00', '2020-05-30 00:00:00');
INSERT INTO `empleado` VALUES ('77', 'Lewis', 'Monroe', 'Kenneth', 'Erich', '1', '16973932', '3', 'M', '2020-01-11', 'Atlántico', '787-2936 Nunc, Avenue', '1', '1', 'scelerisque.dui@accumsanneque.', '037-335-8211', '035-246-9632', '4', '0', null, '1', '1', '2021-05-14 00:00:00', '2020-11-25 00:00:00');
INSERT INTO `empleado` VALUES ('78', 'Mueller', 'Irwin', 'Courtney', 'Adara', '1', '36231510', '3', 'M', '2020-03-16', 'Atlántico', 'P.O. Box 545, 4154 Elit Road', '1', '1', 'orci.consectetuer.euismod@temp', '062-303-4205', '088-198-2224', '3', '0', null, '1', '1', '2019-08-11 00:00:00', '2021-06-26 00:00:00');
INSERT INTO `empleado` VALUES ('79', 'Stafford', 'Eaton', 'Imelda', 'Rhiannon', '1', '34480385', '3', 'M', '2020-04-05', 'Antioquia', 'P.O. Box 421, 8664 In Rd.', '1', '1', 'bibendum.Donec@dui.net', '074-892-4277', '044-600-1937', '3', '0', null, '1', '1', '2019-07-08 00:00:00', '2020-11-13 00:00:00');
INSERT INTO `empleado` VALUES ('80', 'Allison', 'Francis', 'Colette', 'Seth', '2', '40005226', '4', 'F', '2020-07-04', 'Antioquia', 'Ap #893-9488 Dui. Av.', '2', '2', 'mi.eleifend.egestas@Crassed.co', '086-771-9221', '090-546-5793', '4', '0', null, '1', '1', '2021-04-10 00:00:00', '2020-07-28 00:00:00');
INSERT INTO `empleado` VALUES ('81', 'Ramsey', 'Brady', 'Kibo', 'Illiana', '2', '33018099', '4', 'F', '2020-01-08', 'Bolívar', 'P.O. Box 770, 7304 Lorem Street', '2', '2', 'ipsum@mauris.co.uk', '097-112-2910', '074-073-4192', '4', '0', null, '1', '1', '2019-07-14 00:00:00', '2020-04-28 00:00:00');
INSERT INTO `empleado` VALUES ('82', 'Waters', 'Rivas', 'Doris', 'Eugenia', '2', '16149060', '4', 'F', '2020-03-20', 'ANT', 'P.O. Box 882, 5733 Aliquet St.', '2', '2', 'vel.lectus@euturpis.co.uk', '098-517-5308', '004-272-6609', '3', '1', null, '1', '1', '2020-12-22 00:00:00', '2019-11-14 00:00:00');
INSERT INTO `empleado` VALUES ('83', 'Peterson', 'Bullock', 'Petra', 'Phyllis', '2', '21006132', '4', 'F', '2019-09-23', 'Antioquia', '6975 Metus. St.', '2', '2', 'metus.sit@habitantmorbitristiq', '041-613-8170', '089-310-0839', '3', '1', null, '1', '1', '2019-12-14 00:00:00', '2020-03-03 00:00:00');
INSERT INTO `empleado` VALUES ('84', 'Kerr', 'Tyson', 'Josephine', 'Fulton', '2', '35725935', '4', 'F', '2019-10-25', 'ANT', '6349 Nulla. Rd.', '2', '2', 'diam.dictum@semper.edu', '079-552-6176', '017-429-5901', '4', '1', null, '1', '1', '2019-12-02 00:00:00', '2020-06-10 00:00:00');
INSERT INTO `empleado` VALUES ('85', 'Holmes', 'Cruz', 'Mercedes', 'Cara', '2', '12179641', '4', 'F', '2019-12-26', 'ANT', 'P.O. Box 558, 3295 Erat Ave', '2', '2', 'Cras@risusvarius.net', '037-190-9385', '055-154-2060', '4', '1', null, '1', '1', '2021-02-08 00:00:00', '2019-10-26 00:00:00');
INSERT INTO `empleado` VALUES ('86', 'Bray', 'Gregory', 'Pascale', 'Cameron', '2', '34588832', '4', 'F', '2020-11-15', 'ANT', 'P.O. Box 273, 3914 In Street', '2', '2', 'lacinia.at@Integer.net', '022-678-6918', '093-763-2867', '3', '1', null, '1', '1', '2019-08-19 00:00:00', '2019-07-11 00:00:00');
INSERT INTO `empleado` VALUES ('87', 'Macdonald', 'Heath', 'Latifah', 'Dacey', '2', '20760919', '4', 'F', '2020-04-07', 'Antioquia', 'P.O. Box 792, 1272 Magna. Avenue', '2', '2', 'metus.sit@mauris.co.uk', '087-381-9054', '006-078-9160', '3', '1', null, '1', '1', '2019-10-08 00:00:00', '2019-08-06 00:00:00');
INSERT INTO `empleado` VALUES ('88', 'Fisher', 'Woods', 'Alea', 'Eden', '2', '18087838', '4', 'F', '2021-02-26', 'Bolívar', 'P.O. Box 294, 9921 Enim. Avenue', '2', '2', 'odio.auctor.vitae@adipiscingla', '061-335-9393', '008-072-7243', '4', '1', null, '1', '1', '2021-05-06 00:00:00', '2021-03-18 00:00:00');
INSERT INTO `empleado` VALUES ('89', 'Hall', 'Fleming', 'Yoshi', 'Virginia', '2', '28483091', '4', 'F', '2019-12-11', 'Antioquia', 'Ap #962-9262 Condimentum. St.', '2', '2', 'auctor.velit@hendreritidante.c', '051-011-0012', '052-328-7740', '4', '1', null, '1', '1', '2020-06-20 00:00:00', '2020-09-26 00:00:00');
INSERT INTO `empleado` VALUES ('90', 'Underwood', 'Salinas', 'Joseph', 'Cheryl', '1', '45361988', '1', 'M', '2021-01-14', 'Antioquia', '813 Scelerisque Rd.', '1', '1', 'faucibus.Morbi.vehicula@non.ne', '018-401-9311', '075-934-5109', '3', '1', null, '1', '1', '2019-11-10 00:00:00', '2020-10-01 00:00:00');
INSERT INTO `empleado` VALUES ('91', 'Kerr', 'Curtis', 'Ursa', 'Charles', '1', '25379214', '1', 'M', '2021-04-06', 'Antioquia', '1918 Ipsum. Av.', '1', '1', 'montes.nascetur.ridiculus@Null', '089-802-0309', '019-301-1815', '3', '1', null, '1', '1', '2020-01-23 00:00:00', '2021-03-08 00:00:00');
INSERT INTO `empleado` VALUES ('92', 'Rivers', 'Vincent', 'Wayne', 'Lynn', '1', '34495507', '1', 'M', '2019-07-30', 'ANT', '134-5756 Placerat, Rd.', '1', '1', 'interdum.feugiat.Sed@orci.co.u', '068-118-2640', '045-375-8607', '4', '0', null, '1', '1', '2019-10-21 00:00:00', '2020-05-20 00:00:00');
INSERT INTO `empleado` VALUES ('93', 'Sullivan', 'Mathis', 'Cruz', 'Magee', '1', '25649550', '1', 'M', '2020-08-28', 'BOL', 'P.O. Box 129, 8926 Dictum Road', '1', '1', 'Sed.pharetra@aodio.ca', '068-368-0995', '026-865-6593', '4', '0', null, '1', '1', '2021-05-12 00:00:00', '2021-06-02 00:00:00');
INSERT INTO `empleado` VALUES ('94', 'Gay', 'Santiago', 'Eric', 'Hiroko', '1', '26884968', '1', 'M', '2020-01-20', 'CAQ', 'P.O. Box 305, 2905 Malesuada St.', '1', '1', 'cursus.non@Integerin.net', '079-201-6007', '027-218-7759', '3', '1', null, '1', '1', '2021-01-15 00:00:00', '2020-03-31 00:00:00');
INSERT INTO `empleado` VALUES ('95', 'Dennis', 'Andrews', 'Daniel', 'Charity', '1', '12776184', '1', 'M', '2020-12-15', 'ATL', 'Ap #693-9916 Vel Rd.', '1', '1', 'tellus.id@temporlorem.net', '000-645-0059', '007-691-8419', '3', '0', null, '1', '1', '2020-09-19 00:00:00', '2021-01-15 00:00:00');
INSERT INTO `empleado` VALUES ('96', 'Watson', 'Bennett', 'Frances', 'Mohammad', '1', '7799231', '1', 'M', '2021-02-16', 'ATL', 'Ap #119-5123 Auctor Street', '1', '1', 'Ut.semper@duiin.co.uk', '014-660-0565', '079-059-1779', '4', '1', null, '1', '1', '2021-05-11 00:00:00', '2020-11-26 00:00:00');
INSERT INTO `empleado` VALUES ('97', 'Landry', 'Riley', 'Amery', 'Gareth', '1', '5086113', '1', 'M', '2019-08-03', 'ANT', '497-666 Et Av.', '1', '1', 'penatibus.et.magnis@augueportt', '037-953-6032', '094-855-0289', '4', '0', null, '1', '1', '2019-09-09 00:00:00', '2019-11-11 00:00:00');
INSERT INTO `empleado` VALUES ('98', 'James', 'Hamilton', 'Keely', 'Mira', '1', '38426166', '1', 'M', '2020-04-20', 'GUA', '469-4057 Mauris St.', '1', '1', 'leo@etnunc.com', '079-998-3579', '065-262-2788', '3', '1', null, '1', '1', '2020-10-09 00:00:00', '2020-06-14 00:00:00');
INSERT INTO `empleado` VALUES ('99', 'Rutledge', 'Riley', 'Colleen', 'Chaim', '1', '36455290', '1', 'M', '2020-01-12', 'Antioquia', 'P.O. Box 783, 2445 Nullam Street', '1', '1', 'magna@molestietortornibh.net', '085-673-0117', '016-084-8110', '3', '0', null, '1', '1', '2021-05-28 00:00:00', '2021-01-22 00:00:00');
INSERT INTO `empleado` VALUES ('100', 'Mccall', 'Underwood', 'Gil', 'Jena', '2', '31670646', '2', 'F', '2019-10-16', 'Atlántico', '793-4962 Lacinia Rd.', '2', '2', 'eget.metus.eu@lectus.edu', '044-813-1808', '001-046-6998', '4', '1', null, '1', '1', '2020-03-15 00:00:00', '2020-12-24 00:00:00');
INSERT INTO `empleado` VALUES ('101', 'Wilkins', 'Levy', 'Chancellor', 'Hector', '2', '18585514', '2', 'F', '2020-10-28', 'ANT', 'Ap #823-4286 Rhoncus. Street', '2', '2', 'Fusce.dolor@fringillamilacinia', '055-099-1615', '015-050-3343', '4', '0', null, '1', '1', '2021-01-22 00:00:00', '2019-08-13 00:00:00');
INSERT INTO `empleado` VALUES ('102', 'Webb', 'Swanson', 'Conan', 'Steel', '2', '42272763', '2', 'F', '2020-07-24', 'ANT', 'Ap #258-9169 Eleifend St.', '2', '2', 'faucibus@necimperdietnec.org', '037-080-5528', '019-765-0484', '3', '0', null, '1', '1', '2021-05-29 00:00:00', '2021-01-01 00:00:00');
INSERT INTO `empleado` VALUES ('103', 'Mills', 'Hood', 'Price', 'Amir', '2', '48080907', '2', 'F', '2019-08-29', 'Antioquia', '465-6980 Pharetra Ave', '2', '2', 'senectus.et.netus@sitametconse', '044-508-6339', '078-975-9806', '3', '0', null, '1', '1', '2021-05-11 00:00:00', '2020-08-02 00:00:00');
INSERT INTO `empleado` VALUES ('104', 'Goff', 'Floyd', 'Meredith', 'Harrison', '2', '11389513', '2', 'F', '2020-01-20', 'COR', '605-1952 Nec, St.', '2', '2', 'dolor@enimNuncut.net', '027-139-5274', '052-135-2361', '4', '0', null, '1', '1', '2021-03-24 00:00:00', '2020-05-12 00:00:00');
INSERT INTO `empleado` VALUES ('105', 'Hendrix', 'Bird', 'Zena', 'Lucy', '2', '28970702', '2', 'F', '2021-05-09', 'ATL', 'Ap #663-3674 A, St.', '2', '2', 'lectus@vitaealiquam.edu', '087-548-7164', '001-530-3452', '4', '1', null, '1', '1', '2021-01-08 00:00:00', '2020-10-19 00:00:00');
INSERT INTO `empleado` VALUES ('106', 'Woodward', 'Burke', 'Raja', 'Nichole', '2', '12836837', '2', 'F', '2021-05-28', 'Antioquia', '248 Tincidunt St.', '2', '2', 'lacus.Mauris.non@massaMauris.o', '054-846-1136', '051-373-4779', '3', '0', null, '1', '1', '2020-04-19 00:00:00', '2019-08-01 00:00:00');
INSERT INTO `empleado` VALUES ('107', 'Holt', 'Singleton', 'Kirsten', 'Hayley', '2', '40554310', '2', 'F', '2020-01-10', 'Antioquia', 'P.O. Box 960, 7886 Facilisis Street', '2', '2', 'Phasellus@vitae.com', '014-571-8199', '079-001-2013', '3', '0', null, '1', '1', '2021-04-25 00:00:00', '2019-10-25 00:00:00');
INSERT INTO `empleado` VALUES ('108', 'Garcia', 'Colon', 'Macey', 'Adrienne', '2', '34621455', '2', 'F', '2021-05-15', 'Antioquia', 'Ap #809-4567 Eu Rd.', '2', '2', 'consequat@parturientmontesnasc', '090-077-2300', '004-467-4346', '4', '0', null, '1', '1', '2019-12-28 00:00:00', '2021-06-18 00:00:00');
INSERT INTO `empleado` VALUES ('109', 'Walton', 'Dunlap', 'Britanney', 'Fulton', '2', '40428858', '2', 'F', '2021-02-25', 'ATL', '923-7410 Luctus Avenue', '2', '2', 'auctor.quis@vitaesodalesnisi.n', '080-858-1994', '038-607-7429', '4', '1', null, '1', '1', '2020-04-21 00:00:00', '2021-03-31 00:00:00');

-- ----------------------------
-- Table structure for estado_civil
-- ----------------------------
DROP TABLE IF EXISTS `estado_civil`;
CREATE TABLE `estado_civil` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_estado_civil` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of estado_civil
-- ----------------------------
INSERT INTO `estado_civil` VALUES ('1', 'Soltero (a)', null, '1', '1', null, null);
INSERT INTO `estado_civil` VALUES ('2', 'Casado(a)', null, '1', '1', null, null);
INSERT INTO `estado_civil` VALUES ('3', 'Divorciado(a)', null, '1', '1', null, null);
INSERT INTO `estado_civil` VALUES ('4', 'Viudo(a)', null, '1', '1', null, null);

-- ----------------------------
-- Table structure for estructura
-- ----------------------------
DROP TABLE IF EXISTS `estructura`;
CREATE TABLE `estructura` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_estructura` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_colegio` int(11) NOT NULL,
  `id_padre` int(11) DEFAULT NULL,
  `tx_path` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of estructura
-- ----------------------------
INSERT INTO `estructura` VALUES ('1', 'Colegio', '1', '0', 'Colegio', null, '1', '1', '2020-05-13 05:10:58', '2020-05-13 05:10:58');
INSERT INTO `estructura` VALUES ('2', 'Piso 1', '1', '1', 'Colegio>Piso 1', null, '1', '1', '2020-05-13 05:46:27', '2020-05-13 05:46:27');
INSERT INTO `estructura` VALUES ('3', 'Piso 2', '1', '1', 'Colegio>Piso 2', null, '1', '1', '2020-05-13 05:48:02', '2020-05-13 05:48:02');
INSERT INTO `estructura` VALUES ('4', 'Piso 3', '1', '1', 'Colegio>Piso 3', null, '1', '1', '2020-05-13 05:48:20', '2020-05-13 05:48:20');
INSERT INTO `estructura` VALUES ('5', 'Edificio \"A\"', '1', '1', 'Colegio>Edificio \"A\"', null, '1', '1', '2020-05-13 05:48:49', '2020-05-13 05:49:05');
INSERT INTO `estructura` VALUES ('6', 'Edificio \"B\"', '1', '1', 'Colegio>Edificio \"B\"', null, '1', '1', '2020-05-13 05:49:31', '2020-05-13 05:49:31');
INSERT INTO `estructura` VALUES ('9', 'Piso A1', '1', '5', 'Colegio>Edificio \"A\">Piso A1', null, '1', '1', '2020-06-10 20:06:17', '2020-06-10 20:06:17');

-- ----------------------------
-- Table structure for evaluacion
-- ----------------------------
DROP TABLE IF EXISTS `evaluacion`;
CREATE TABLE `evaluacion` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_plan_evaluacion` int(11) NOT NULL,
  `id_tipo_evaluacion` int(11) NOT NULL,
  `id_evaluacion_metodo` int(11) DEFAULT NULL,
  `nu_peso` int(11) DEFAULT NULL,
  `fe_planificada` date NOT NULL,
  `fe_evaluacion` date DEFAULT NULL,
  `hh_inicio` time DEFAULT NULL,
  `hh_fin` time DEFAULT NULL,
  `tx_tema` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `tx_observaciones` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of evaluacion
-- ----------------------------
INSERT INTO `evaluacion` VALUES ('10', '2', '1', '1', '10', '2020-07-27', '2020-09-07', null, null, 'Historia de Colombia', null, '10', '1', '2020-05-28 01:14:26', '2020-09-07 15:07:43');
INSERT INTO `evaluacion` VALUES ('11', '2', '1', '1', '10', '2020-07-27', '2020-09-07', null, null, 'Historia del Arte', null, '10', '1', '2020-05-28 01:15:17', '2020-09-07 15:07:58');
INSERT INTO `evaluacion` VALUES ('12', '2', '8', '2', '25', '2020-07-28', '2020-09-07', null, null, 'Historia Universal', null, '10', '1', '2020-05-28 01:15:45', '2020-09-07 15:08:19');
INSERT INTO `evaluacion` VALUES ('13', '2', '5', '3', '20', '2020-07-28', '2020-09-07', null, null, 'N/A', null, '11', '1', '2020-05-28 01:16:31', '2020-09-11 22:43:27');
INSERT INTO `evaluacion` VALUES ('14', '2', '4', '3', '30', '2020-07-28', '2020-07-28', null, null, 'Historia Contemporanea', null, '10', '1', '2020-05-28 01:17:40', '2020-09-08 01:44:04');
INSERT INTO `evaluacion` VALUES ('16', '2', '6', '2', '5', '2020-07-28', '2020-10-27', null, null, 'N/A', null, '11', '1', '2020-05-28 01:28:06', '2020-09-12 14:14:20');
INSERT INTO `evaluacion` VALUES ('21', '6', '1', '0', '30', '2020-07-29', null, null, null, 'Epoca Colonial', null, '9', '1', '2020-06-29 18:00:07', '2020-06-29 18:00:07');
INSERT INTO `evaluacion` VALUES ('22', '6', '4', '0', '30', '2020-07-30', null, null, null, 'La Gran Colombia', null, '9', '1', '2020-06-29 18:00:43', '2020-06-29 18:00:43');
INSERT INTO `evaluacion` VALUES ('23', '6', '1', '0', '20', '2020-07-07', null, null, null, 'ddddd', null, '9', '1', '2020-07-06 15:31:31', '2020-07-16 06:01:57');
INSERT INTO `evaluacion` VALUES ('24', '62', '1', '1', '20', '2020-08-22', '2020-08-22', null, null, 'Prueba de Suma y restas', null, '11', '1', '2020-08-15 20:43:32', '2020-09-12 15:09:53');
INSERT INTO `evaluacion` VALUES ('25', '59', '1', '1', '12', '2020-08-11', '2020-08-19', null, null, 'prueba', null, '10', '1', '2020-08-18 18:34:53', '2020-08-20 01:20:34');
INSERT INTO `evaluacion` VALUES ('26', '57', '1', '2', '45', '2020-08-18', '2020-08-19', '01:10:00', '18:30:00', 'sgdsg', null, '10', '1', '2020-08-18 19:48:51', '2020-08-19 13:26:56');
INSERT INTO `evaluacion` VALUES ('27', '60', '1', null, '10', '2020-09-09', null, null, null, 'prueba multiplicacion', '', '9', '1', '2020-09-09 18:52:13', '2020-09-09 18:52:13');
INSERT INTO `evaluacion` VALUES ('28', '62', '1', '1', '20', '2020-09-20', '2020-09-20', null, null, 'multiplicacion', null, '10', '1', '2020-09-09 18:53:08', '2020-09-09 19:50:16');

-- ----------------------------
-- Table structure for evaluacion_alumno
-- ----------------------------
DROP TABLE IF EXISTS `evaluacion_alumno`;
CREATE TABLE `evaluacion_alumno` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_evaluacion` int(11) NOT NULL,
  `id_alumno` int(11) NOT NULL,
  `nu_calificacion` decimal(4,2) DEFAULT NULL,
  `id_calificacion` int(11) DEFAULT NULL,
  `tx_observaciones` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of evaluacion_alumno
-- ----------------------------
INSERT INTO `evaluacion_alumno` VALUES ('1', '26', '15', '12.00', null, 'no estudio', '1', '1', '2020-08-20 00:16:30', '2020-08-20 00:27:20');
INSERT INTO `evaluacion_alumno` VALUES ('2', '26', '16', '20.00', null, null, '1', '1', '2020-08-20 00:25:28', '2020-08-20 00:25:51');
INSERT INTO `evaluacion_alumno` VALUES ('3', '26', '23', '20.00', null, null, '1', '1', '2020-08-20 00:25:37', '2020-08-20 00:25:44');
INSERT INTO `evaluacion_alumno` VALUES ('4', '26', '2', '15.00', null, null, '1', '1', '2020-08-20 00:26:04', '2020-08-20 00:26:04');
INSERT INTO `evaluacion_alumno` VALUES ('5', '26', '17', '15.00', null, null, '1', '1', '2020-08-20 00:26:16', '2020-08-20 00:26:16');
INSERT INTO `evaluacion_alumno` VALUES ('6', '26', '1', '12.00', null, null, '1', '1', '2020-08-20 00:26:22', '2020-08-20 00:26:22');
INSERT INTO `evaluacion_alumno` VALUES ('8', '10', '1', null, null, null, '1', '1', null, null);
INSERT INTO `evaluacion_alumno` VALUES ('9', '10', '2', null, null, null, '1', '1', null, null);
INSERT INTO `evaluacion_alumno` VALUES ('10', '10', '15', null, null, null, '1', '1', null, null);
INSERT INTO `evaluacion_alumno` VALUES ('11', '10', '16', null, null, null, '1', '1', null, null);
INSERT INTO `evaluacion_alumno` VALUES ('12', '10', '17', null, null, null, '1', '1', null, null);
INSERT INTO `evaluacion_alumno` VALUES ('13', '10', '23', null, null, null, '1', '1', null, null);
INSERT INTO `evaluacion_alumno` VALUES ('14', '11', '1', null, null, null, '1', '1', null, null);
INSERT INTO `evaluacion_alumno` VALUES ('15', '11', '2', null, null, null, '1', '1', null, null);
INSERT INTO `evaluacion_alumno` VALUES ('16', '11', '15', null, null, null, '1', '1', null, null);
INSERT INTO `evaluacion_alumno` VALUES ('17', '11', '16', null, null, null, '1', '1', null, null);
INSERT INTO `evaluacion_alumno` VALUES ('18', '11', '17', null, null, null, '1', '1', null, null);
INSERT INTO `evaluacion_alumno` VALUES ('19', '11', '23', null, null, null, '1', '1', null, null);
INSERT INTO `evaluacion_alumno` VALUES ('20', '12', '1', '5.00', '20', null, '1', '1', null, '2020-09-12 15:34:28');
INSERT INTO `evaluacion_alumno` VALUES ('21', '12', '2', '2.50', '9', null, '1', '1', null, '2020-09-08 00:59:08');
INSERT INTO `evaluacion_alumno` VALUES ('22', '12', '15', '34.00', null, null, '1', '1', null, '2020-09-07 18:12:54');
INSERT INTO `evaluacion_alumno` VALUES ('23', '12', '16', null, null, null, '1', '1', null, null);
INSERT INTO `evaluacion_alumno` VALUES ('24', '12', '17', null, null, null, '1', '1', null, null);
INSERT INTO `evaluacion_alumno` VALUES ('25', '12', '23', null, null, null, '1', '1', null, null);
INSERT INTO `evaluacion_alumno` VALUES ('26', '13', '1', '1.00', '5', 'gk', '1', '1', null, '2020-09-07 23:39:36');
INSERT INTO `evaluacion_alumno` VALUES ('27', '13', '2', '2.00', '9', 'sggs', '1', '1', null, '2020-09-07 23:14:55');
INSERT INTO `evaluacion_alumno` VALUES ('28', '13', '15', '3.60', '18', '333', '1', '1', null, '2020-09-07 23:15:04');
INSERT INTO `evaluacion_alumno` VALUES ('29', '13', '16', '3.80', '19', null, '1', '1', null, '2020-09-07 23:15:14');
INSERT INTO `evaluacion_alumno` VALUES ('30', '13', '17', '4.00', '20', null, '1', '1', null, '2020-09-07 23:15:26');
INSERT INTO `evaluacion_alumno` VALUES ('31', '13', '23', '2.80', '14', null, '1', '1', null, '2020-09-07 23:15:37');
INSERT INTO `evaluacion_alumno` VALUES ('32', '14', '1', '6.00', '20', null, '1', '1', null, '2020-09-12 15:35:08');
INSERT INTO `evaluacion_alumno` VALUES ('33', '14', '2', '0.60', '2', 'No subio el archivo', '1', '1', null, '2020-09-09 12:05:24');
INSERT INTO `evaluacion_alumno` VALUES ('34', '14', '15', null, null, null, '1', '1', null, null);
INSERT INTO `evaluacion_alumno` VALUES ('35', '14', '16', null, null, null, '1', '1', null, null);
INSERT INTO `evaluacion_alumno` VALUES ('36', '14', '17', null, null, null, '1', '1', null, null);
INSERT INTO `evaluacion_alumno` VALUES ('37', '14', '23', null, null, null, '1', '1', null, null);
INSERT INTO `evaluacion_alumno` VALUES ('38', '16', '1', '1.00', '20', null, '1', '1', null, '2020-09-08 13:19:22');
INSERT INTO `evaluacion_alumno` VALUES ('39', '16', '2', '0.20', '4', null, '1', '1', null, '2020-09-12 14:13:28');
INSERT INTO `evaluacion_alumno` VALUES ('40', '16', '15', '0.25', '5', null, '1', '1', null, '2020-09-12 14:13:53');
INSERT INTO `evaluacion_alumno` VALUES ('41', '16', '16', '0.30', '6', null, '1', '1', null, '2020-09-12 14:14:00');
INSERT INTO `evaluacion_alumno` VALUES ('42', '16', '17', '0.30', '6', null, '1', '1', null, '2020-09-12 14:14:07');
INSERT INTO `evaluacion_alumno` VALUES ('43', '16', '23', '0.30', '6', null, '1', '1', null, '2020-09-12 14:14:14');
INSERT INTO `evaluacion_alumno` VALUES ('44', '24', '1', '3.20', '3', null, '1', '1', null, '2020-09-12 14:19:21');
INSERT INTO `evaluacion_alumno` VALUES ('45', '24', '2', '0.20', '1', null, '1', '1', null, '2020-09-12 14:19:20');
INSERT INTO `evaluacion_alumno` VALUES ('46', '24', '15', '0.20', '1', null, '1', '1', null, '2020-09-12 14:19:20');
INSERT INTO `evaluacion_alumno` VALUES ('47', '24', '16', '0.20', '1', null, '1', '1', null, '2020-09-12 14:19:21');
INSERT INTO `evaluacion_alumno` VALUES ('48', '24', '17', '0.20', '1', null, '1', '1', null, '2020-09-12 14:19:20');
INSERT INTO `evaluacion_alumno` VALUES ('49', '24', '23', '0.20', '1', null, '1', '1', null, '2020-09-12 14:19:20');
INSERT INTO `evaluacion_alumno` VALUES ('50', '28', '1', '3.80', '4', null, '1', '1', null, '2020-09-11 19:36:33');
INSERT INTO `evaluacion_alumno` VALUES ('51', '28', '2', null, null, null, '1', '1', null, null);
INSERT INTO `evaluacion_alumno` VALUES ('52', '28', '15', null, null, null, '1', '1', null, null);
INSERT INTO `evaluacion_alumno` VALUES ('53', '28', '16', null, null, null, '1', '1', null, null);
INSERT INTO `evaluacion_alumno` VALUES ('54', '28', '17', '0.20', '1', null, '1', '1', null, '2020-09-11 19:36:33');
INSERT INTO `evaluacion_alumno` VALUES ('55', '28', '23', null, null, null, '1', '1', null, null);

-- ----------------------------
-- Table structure for evaluacion_metodo
-- ----------------------------
DROP TABLE IF EXISTS `evaluacion_metodo`;
CREATE TABLE `evaluacion_metodo` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_evaluacion_metodo` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tx_icono` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tx_color` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of evaluacion_metodo
-- ----------------------------
INSERT INTO `evaluacion_metodo` VALUES ('1', 'Prueba en Linea', 'mdi-order-bool-descending', 'pink', 'Mediante prueba en linea', '1', '1', '2020-08-18 15:37:51', '2020-08-18 15:54:29');
INSERT INTO `evaluacion_metodo` VALUES ('2', 'Nota Directa', 'mdi-square-edit-outline', 'teal', 'Nota del Docente', '1', '1', '2020-08-18 15:42:30', '2020-08-18 16:16:39');
INSERT INTO `evaluacion_metodo` VALUES ('3', 'Documento', 'mdi-clipboard-file-outline', 'blue', 'Archivo del alumno', '1', '1', '2020-08-18 15:43:42', '2020-08-18 16:12:34');

-- ----------------------------
-- Table structure for feriado
-- ----------------------------
DROP TABLE IF EXISTS `feriado`;
CREATE TABLE `feriado` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_feriado` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_tipo_feriado` int(11) NOT NULL,
  `fe_feriado` date NOT NULL,
  `aa_feriado` int(5) NOT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of feriado
-- ----------------------------
INSERT INTO `feriado` VALUES ('1', 'Año Nuevo', '1', '2020-01-01', '2020', null, '1', '1', '2020-06-15 21:49:00', '2020-06-15 21:49:00');
INSERT INTO `feriado` VALUES ('2', 'Reyes Magos', '1', '2020-01-06', '2020', null, '1', '1', '2020-06-16 02:15:27', '2020-06-16 02:15:27');
INSERT INTO `feriado` VALUES ('3', 'Día del Trabajo', '1', '2020-05-05', '2020', null, '1', '1', '2020-06-16 02:16:57', '2020-06-16 02:16:57');
INSERT INTO `feriado` VALUES ('4', 'Grito de Independencia', '1', '2020-06-20', '2020', null, '1', '1', '2020-06-16 02:18:49', '2020-06-16 02:18:49');
INSERT INTO `feriado` VALUES ('5', 'Batalla de Boyacá', '1', '2020-08-07', '2020', null, '1', '1', '2020-06-16 02:23:12', '2020-06-16 02:23:12');
INSERT INTO `feriado` VALUES ('6', 'Inmaculada Concepción de la Virgen', '1', '2020-12-08', '2020', null, '1', '1', '2020-06-16 02:25:06', '2020-06-16 02:25:06');
INSERT INTO `feriado` VALUES ('7', 'Navidad', '1', '2020-12-24', '2020', null, '1', '1', '2020-06-16 02:25:56', '2020-06-16 02:25:56');
INSERT INTO `feriado` VALUES ('8', 'Día de San José', '2', '2020-01-23', '2020', null, '1', '1', '2020-06-16 02:38:21', '2020-06-16 02:38:21');

-- ----------------------------
-- Table structure for foto
-- ----------------------------
DROP TABLE IF EXISTS `foto`;
CREATE TABLE `foto` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_foto` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tx_src` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_tipo_foto` int(11) NOT NULL,
  `id_origen` int(11) NOT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of foto
-- ----------------------------
INSERT INTO `foto` VALUES ('23', 'alumno id: 2', '1594256255_2.jpg', '2', '2', null, '1', '1', '2020-07-09 00:57:35', '2020-07-09 00:57:35');
INSERT INTO `foto` VALUES ('24', 'colegio id: 1', '1594256404_1.jpg', '1', '1', null, '1', '1', '2020-07-09 01:00:04', '2020-07-09 01:00:04');
INSERT INTO `foto` VALUES ('25', 'alumno id: 62', '1594257759_62.jpg', '2', '62', null, '1', '1', '2020-07-09 01:22:39', '2020-07-09 01:22:39');
INSERT INTO `foto` VALUES ('26', 'alumno id: 40', '1594258022_40.jpg', '2', '40', null, '1', '1', '2020-07-09 01:27:02', '2020-07-09 01:27:02');
INSERT INTO `foto` VALUES ('29', 'alumno id: 1', '1594261278_1.jpg', '2', '1', null, '1', '1', '2020-07-09 02:21:18', '2020-07-09 02:21:18');
INSERT INTO `foto` VALUES ('32', 'docente id: 1', '1594312119_1.jpg', '3', '1', null, '1', '1', '2020-07-09 16:28:39', '2020-07-09 16:28:39');
INSERT INTO `foto` VALUES ('36', 'alumno id: 10', '1594855697_10.jpg', '2', '10', null, '1', '1', '2020-07-15 23:28:17', '2020-07-15 23:28:17');
INSERT INTO `foto` VALUES ('37', 'alumno id: 12', '1594855766_12.jpg', '2', '12', null, '1', '1', '2020-07-15 23:29:26', '2020-07-15 23:29:26');
INSERT INTO `foto` VALUES ('38', 'alumno id: 13', '1594856049_13.jpg', '2', '13', null, '1', '1', '2020-07-15 23:34:09', '2020-07-15 23:34:09');
INSERT INTO `foto` VALUES ('39', 'alumno id: 14', '1594856438_14.jpg', '2', '14', null, '1', '1', '2020-07-15 23:40:38', '2020-07-15 23:40:38');
INSERT INTO `foto` VALUES ('43', 'alumno id: 16', '1594857017_16.jpg', '2', '16', null, '1', '1', '2020-07-15 23:50:17', '2020-07-15 23:50:17');
INSERT INTO `foto` VALUES ('45', 'alumno id: 17', '1594857230_17.jpg', '2', '17', null, '1', '1', '2020-07-15 23:53:50', '2020-07-15 23:53:50');
INSERT INTO `foto` VALUES ('47', 'alumno id: 11', '1594859602_11.jpg', '2', '11', null, '1', '1', '2020-07-16 00:33:22', '2020-07-16 00:33:22');
INSERT INTO `foto` VALUES ('48', 'alumno id: 18', '1594859659_18.jpg', '2', '18', null, '1', '1', '2020-07-16 00:34:19', '2020-07-16 00:34:19');
INSERT INTO `foto` VALUES ('49', 'alumno id: 19', '1594859841_19.jpg', '2', '19', null, '1', '1', '2020-07-16 00:37:21', '2020-07-16 00:37:21');
INSERT INTO `foto` VALUES ('50', 'alumno id: 20', '1594859865_20.jpg', '2', '20', null, '1', '1', '2020-07-16 00:37:45', '2020-07-16 00:37:45');
INSERT INTO `foto` VALUES ('51', 'alumno id: 21', '1594859884_21.jpg', '2', '21', null, '1', '1', '2020-07-16 00:38:04', '2020-07-16 00:38:04');
INSERT INTO `foto` VALUES ('52', 'alumno id: 22', '1594859909_22.jpg', '2', '22', null, '1', '1', '2020-07-16 00:38:29', '2020-07-16 00:38:29');
INSERT INTO `foto` VALUES ('53', 'alumno id: 23', '1594859937_23.jpg', '2', '23', null, '1', '1', '2020-07-16 00:38:57', '2020-07-16 00:38:57');
INSERT INTO `foto` VALUES ('54', 'alumno id: 24', '1594860083_24.jpg', '2', '24', null, '1', '1', '2020-07-16 00:41:23', '2020-07-16 00:41:23');
INSERT INTO `foto` VALUES ('55', 'docente id: 11', '1594860771_11.jpg', '3', '11', null, '1', '1', '2020-07-16 00:52:51', '2020-07-16 00:52:51');
INSERT INTO `foto` VALUES ('57', 'docente id: 10', '1594860913_10.jpg', '3', '10', null, '1', '1', '2020-07-16 00:55:13', '2020-07-16 00:55:13');
INSERT INTO `foto` VALUES ('58', 'docente id: 2', '1594860945_2.jpg', '3', '2', null, '1', '1', '2020-07-16 00:55:45', '2020-07-16 00:55:45');
INSERT INTO `foto` VALUES ('60', 'alumno id: 1', '1594946193_1.jpg', '2', '1', null, '1', '1', '2020-07-17 00:36:33', '2020-07-17 00:36:33');
INSERT INTO `foto` VALUES ('68', 'docente id: 12', '1595028689_12.jpg', '3', '12', null, '1', '1', '2020-07-17 23:31:29', '2020-07-17 23:31:29');
INSERT INTO `foto` VALUES ('69', 'cuenta id: 1', '1595028721_1.jpg', '4', '1', null, '1', '1', '2020-07-17 23:32:01', '2020-07-17 23:32:01');
INSERT INTO `foto` VALUES ('70', 'docente id: 13', '1595029842_13.jpg', '3', '13', null, '1', '1', '2020-07-17 23:50:42', '2020-07-17 23:50:42');
INSERT INTO `foto` VALUES ('71', 'pariente id: 1', '1595721572_1.jpg', '5', '1', null, '1', '1', '2020-07-25 23:59:32', '2020-07-25 23:59:32');
INSERT INTO `foto` VALUES ('72', 'pariente id: 2', '1595721589_2.jpg', '5', '2', null, '1', '1', '2020-07-25 23:59:49', '2020-07-25 23:59:49');
INSERT INTO `foto` VALUES ('73', 'pariente id: 6', '1595721712_6.jpg', '5', '6', null, '1', '1', '2020-07-26 00:01:52', '2020-07-26 00:01:52');
INSERT INTO `foto` VALUES ('74', 'alumno id: 25', '1595870532_25.jpg', '2', '25', null, '1', '1', '2020-07-27 17:22:13', '2020-07-27 17:22:13');
INSERT INTO `foto` VALUES ('76', 'alumno id: 15', '1596170462_15.jpg', '2', '15', null, '1', '1', '2020-07-31 04:41:02', '2020-07-31 04:41:02');
INSERT INTO `foto` VALUES ('77', 'docente id: 14', '1597773906_14.jpg', '3', '14', null, '1', '1', '2020-08-18 18:05:06', '2020-08-18 18:05:06');
INSERT INTO `foto` VALUES ('78', 'cuenta id: 2', '1599229382_2.jpg', '4', '2', null, '1', '2', '2020-09-04 14:23:03', '2020-09-04 14:23:03');

-- ----------------------------
-- Table structure for grado
-- ----------------------------
DROP TABLE IF EXISTS `grado`;
CREATE TABLE `grado` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_grado` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nu_grado` int(11) NOT NULL,
  `id_nivel` int(11) NOT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of grado
-- ----------------------------
INSERT INTO `grado` VALUES ('1', 'Pre-jardin', '1', '1', null, '1', '1', '2020-05-11 18:43:48', '2020-05-16 07:50:07');
INSERT INTO `grado` VALUES ('2', 'Jardin', '2', '1', null, '1', '1', '2020-05-11 18:44:18', '2020-05-16 07:50:14');
INSERT INTO `grado` VALUES ('3', 'Transicion', '3', '1', null, '1', '1', '2020-05-11 18:58:15', '2020-05-16 07:50:22');
INSERT INTO `grado` VALUES ('4', 'Grado 1º', '1', '2', null, '1', '1', '2020-05-11 19:01:49', '2020-05-16 07:48:35');
INSERT INTO `grado` VALUES ('5', 'Grado 2º', '2', '2', null, '1', '1', '2020-05-11 19:03:26', '2020-05-16 07:48:42');
INSERT INTO `grado` VALUES ('6', 'Grado 3º', '3', '2', null, '1', '1', '2020-05-11 19:03:50', '2020-05-16 07:48:49');
INSERT INTO `grado` VALUES ('7', 'Grado 4º', '4', '2', null, '1', '1', '2020-05-11 19:06:38', '2020-05-16 07:48:55');
INSERT INTO `grado` VALUES ('8', 'Grado 5º', '5', '2', null, '1', '1', '2020-05-11 19:47:09', '2020-05-16 07:49:03');
INSERT INTO `grado` VALUES ('9', 'Grado 6º', '6', '3', null, '1', '1', '2020-05-11 19:47:43', '2020-05-16 07:49:18');
INSERT INTO `grado` VALUES ('10', 'Grado 7º', '7', '3', null, '1', '1', '2020-05-11 19:48:23', '2020-05-16 07:49:25');
INSERT INTO `grado` VALUES ('11', 'Grado 8º', '8', '3', null, '1', '1', '2020-05-11 19:48:44', '2020-05-16 07:49:36');
INSERT INTO `grado` VALUES ('12', 'Grado 9º', '8', '3', null, '1', '1', '2020-05-11 19:49:05', '2020-05-16 07:49:44');
INSERT INTO `grado` VALUES ('13', 'Grado 10', '10', '3', null, '1', '1', '2020-05-11 19:49:24', '2020-05-16 07:49:50');
INSERT INTO `grado` VALUES ('14', 'Grado 11º', '11', '3', null, '1', '1', '2020-05-11 19:49:52', '2020-05-16 07:49:57');

-- ----------------------------
-- Table structure for grado_alumno
-- ----------------------------
DROP TABLE IF EXISTS `grado_alumno`;
CREATE TABLE `grado_alumno` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_grado` int(11) NOT NULL,
  `id_alumno` int(11) NOT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of grado_alumno
-- ----------------------------
INSERT INTO `grado_alumno` VALUES ('1', '4', '1', null, '1', '1', '2020-05-25 19:23:02', '2020-05-25 19:23:02');
INSERT INTO `grado_alumno` VALUES ('3', '4', '2', null, '1', '1', '2020-05-25 19:29:27', '2020-05-25 19:29:27');
INSERT INTO `grado_alumno` VALUES ('4', '5', '10', null, '1', '1', '2020-07-08 14:36:43', '2020-07-08 14:57:26');
INSERT INTO `grado_alumno` VALUES ('5', '6', '11', null, '1', '1', '2020-07-08 14:39:28', '2020-07-08 14:45:09');

-- ----------------------------
-- Table structure for grado_materia
-- ----------------------------
DROP TABLE IF EXISTS `grado_materia`;
CREATE TABLE `grado_materia` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_grado` int(11) NOT NULL,
  `id_materia` int(11) NOT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of grado_materia
-- ----------------------------
INSERT INTO `grado_materia` VALUES ('1', '4', '14', null, '1', '1', '2020-05-16 15:13:59', '2020-05-16 15:13:59');
INSERT INTO `grado_materia` VALUES ('2', '4', '15', null, '1', '1', '2020-05-16 15:53:59', '2020-05-16 15:53:59');
INSERT INTO `grado_materia` VALUES ('3', '4', '19', null, '1', '1', '2020-05-16 18:32:00', '2020-05-16 18:32:00');
INSERT INTO `grado_materia` VALUES ('4', '4', '7', null, '1', '1', '2020-05-16 18:32:18', '2020-05-16 18:32:18');
INSERT INTO `grado_materia` VALUES ('5', '4', '17', null, '1', '1', '2020-05-16 18:32:43', '2020-05-16 18:32:43');
INSERT INTO `grado_materia` VALUES ('6', '1', '14', null, '1', '1', '2020-07-13 19:49:53', '2020-07-13 19:49:53');
INSERT INTO `grado_materia` VALUES ('7', '4', '16', null, '1', '1', '2020-08-18 18:00:57', '2020-08-18 18:00:57');
INSERT INTO `grado_materia` VALUES ('8', '1', '11', null, '1', '1', '2020-09-03 13:01:00', '2020-09-03 13:01:00');

-- ----------------------------
-- Table structure for grupo
-- ----------------------------
DROP TABLE IF EXISTS `grupo`;
CREATE TABLE `grupo` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_grupo` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_grado` int(11) NOT NULL,
  `id_turno` int(11) NOT NULL,
  `id_calendario` int(11) NOT NULL,
  `id_docente` int(11) DEFAULT NULL,
  `nu_orden` int(11) NOT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of grupo
-- ----------------------------
INSERT INTO `grupo` VALUES ('1', 'Grupo 1ºA', '4', '1', '1', '1', '1', null, '1', '1', '2020-05-16 19:19:15', '2020-05-16 20:13:15');
INSERT INTO `grupo` VALUES ('2', 'Grupo 1ºB', '4', '1', '1', '2', '2', null, '1', '1', '2020-05-16 19:58:29', '2020-05-20 02:14:11');
INSERT INTO `grupo` VALUES ('3', 'Grupo 1ºC', '4', '2', '1', '2', '3', null, '1', '1', '2020-05-16 20:10:17', '2020-05-20 02:14:23');
INSERT INTO `grupo` VALUES ('4', 'Grupo 1ºD', '4', '2', '1', '1', '4', null, '1', '1', '2020-05-16 20:10:44', '2020-05-16 20:13:32');
INSERT INTO `grupo` VALUES ('5', 'J Unico', '2', '1', '1', '1', '1', null, '1', '1', '2020-07-09 13:16:37', '2020-07-09 13:29:37');
INSERT INTO `grupo` VALUES ('6', 'PJ Unico', '1', '1', '1', '13', '1', null, '1', '1', '2020-07-09 13:17:39', '2020-07-09 13:29:26');
INSERT INTO `grupo` VALUES ('7', 'T Unico', '3', '1', '1', '23', '1', null, '1', '1', '2020-07-09 13:18:32', '2020-07-09 13:29:47');
INSERT INTO `grupo` VALUES ('8', 'Grupo 2ºA', '5', '1', '1', '32', '1', null, '1', '1', '2020-07-09 13:19:20', '2020-07-09 13:20:30');
INSERT INTO `grupo` VALUES ('9', 'Grupo 2ºB', '5', '2', '1', '47', '2', null, '1', '1', '2020-07-09 13:20:03', '2020-07-09 13:21:01');
INSERT INTO `grupo` VALUES ('10', 'Grupo 3ºA', '6', '1', '1', '67', '1', null, '1', '1', '2020-07-09 13:22:21', '2020-07-09 13:27:01');
INSERT INTO `grupo` VALUES ('11', 'Grupo 3ºB', '6', '1', '1', '75', '2', null, '1', '1', '2020-07-09 13:22:53', '2020-07-09 13:27:09');
INSERT INTO `grupo` VALUES ('12', 'Grupo 4ºA', '7', '1', '1', '84', '1', null, '1', '1', '2020-07-09 13:23:34', '2020-07-09 13:23:34');
INSERT INTO `grupo` VALUES ('13', 'Grupo 4ºB', '7', '2', '1', '98', '2', null, '1', '1', '2020-07-09 13:24:00', '2020-07-09 13:24:00');
INSERT INTO `grupo` VALUES ('14', 'Grupo 5ºA', '8', '1', '1', '104', '1', null, '1', '1', '2020-07-09 13:24:27', '2020-07-09 13:24:27');
INSERT INTO `grupo` VALUES ('15', 'Grupo 5ºB', '8', '2', '1', '109', '2', null, '1', '1', '2020-07-09 13:24:54', '2020-07-09 13:24:54');
INSERT INTO `grupo` VALUES ('16', 'Grupo 6ºA', '9', '1', '1', '107', '1', null, '1', '1', '2020-07-09 13:25:24', '2020-07-09 13:25:24');
INSERT INTO `grupo` VALUES ('17', 'Grupo 6ºB', '9', '2', '1', '105', '2', null, '1', '1', '2020-07-09 13:25:56', '2020-07-09 13:26:49');
INSERT INTO `grupo` VALUES ('18', 'Grupo 6ºA', '9', '1', '2', '1', '1', null, '1', '1', '2020-07-18 00:29:08', '2020-07-18 00:29:08');
INSERT INTO `grupo` VALUES ('19', 'Grupo 6ºA', '9', '1', '2', '1', '1', null, '1', '1', '2020-07-18 00:29:20', '2020-07-18 00:29:20');
INSERT INTO `grupo` VALUES ('20', 'Grupo 6ºA', '9', '1', '2', '1', '1', null, '1', '1', '2020-07-18 00:30:19', '2020-07-18 00:30:19');

-- ----------------------------
-- Table structure for grupo_alumno
-- ----------------------------
DROP TABLE IF EXISTS `grupo_alumno`;
CREATE TABLE `grupo_alumno` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_grupo` int(11) NOT NULL,
  `id_alumno` int(11) NOT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of grupo_alumno
-- ----------------------------
INSERT INTO `grupo_alumno` VALUES ('1', '1', '1', null, '1', '1', '2020-05-25 17:31:19', '2020-05-25 17:31:19');
INSERT INTO `grupo_alumno` VALUES ('7', '1', '2', null, '1', '1', '2020-05-25 18:58:24', '2020-05-25 18:58:24');

-- ----------------------------
-- Table structure for grupo_calificacion
-- ----------------------------
DROP TABLE IF EXISTS `grupo_calificacion`;
CREATE TABLE `grupo_calificacion` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_grupo_calificacion` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of grupo_calificacion
-- ----------------------------
INSERT INTO `grupo_calificacion` VALUES ('1', 'General', 'Calificaciones Generales', '1', '1', '2020-05-12 06:42:30', '2020-05-12 06:52:29');
INSERT INTO `grupo_calificacion` VALUES ('2', 'Preescolar', 'Calificaciones para Preescolar', '1', '1', '2020-05-12 06:43:05', '2020-05-12 06:53:48');
INSERT INTO `grupo_calificacion` VALUES ('3', 'Basica', null, '1', '1', '2020-05-12 06:43:48', '2020-05-12 06:43:48');
INSERT INTO `grupo_calificacion` VALUES ('4', 'Bachillerato', null, '1', '1', '2020-05-12 06:44:04', '2020-05-12 06:44:04');

-- ----------------------------
-- Table structure for grupo_materia
-- ----------------------------
DROP TABLE IF EXISTS `grupo_materia`;
CREATE TABLE `grupo_materia` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_grupo` int(11) NOT NULL,
  `id_materia` int(11) NOT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of grupo_materia
-- ----------------------------
INSERT INTO `grupo_materia` VALUES ('1', '1', '7', null, '1', '1', '2020-07-19 01:01:00', '2020-07-19 01:01:00');
INSERT INTO `grupo_materia` VALUES ('2', '1', '19', null, '1', '1', '2020-07-19 01:08:26', '2020-07-19 01:08:26');
INSERT INTO `grupo_materia` VALUES ('3', '1', '17', null, '1', '1', '2020-07-19 01:08:43', '2020-07-19 01:08:43');
INSERT INTO `grupo_materia` VALUES ('4', '1', '15', null, '1', '1', '2020-07-19 01:08:46', '2020-07-19 01:08:46');
INSERT INTO `grupo_materia` VALUES ('5', '1', '14', null, '1', '1', '2020-07-19 01:08:48', '2020-07-19 01:08:48');

-- ----------------------------
-- Table structure for horario
-- ----------------------------
DROP TABLE IF EXISTS `horario`;
CREATE TABLE `horario` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_horario` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_grupo` int(11) NOT NULL,
  `id_hora_academica` int(11) NOT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of horario
-- ----------------------------
INSERT INTO `horario` VALUES ('1', 'H1G1A', '1', '1', null, '1', '1', '2020-05-20 12:27:49', '2020-05-20 12:27:49');
INSERT INTO `horario` VALUES ('2', 'H1GB1', '2', '1', null, '1', '1', '2020-06-22 23:16:07', '2020-06-22 23:16:18');

-- ----------------------------
-- Table structure for hora_academica
-- ----------------------------
DROP TABLE IF EXISTS `hora_academica`;
CREATE TABLE `hora_academica` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_hora_academica` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_nivel` int(11) NOT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of hora_academica
-- ----------------------------
INSERT INTO `hora_academica` VALUES ('1', 'Primero a Sexto Grado', '2', null, '1', '1', null, null);

-- ----------------------------
-- Table structure for inasistencia
-- ----------------------------
DROP TABLE IF EXISTS `inasistencia`;
CREATE TABLE `inasistencia` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_estudiante` int(11) NOT NULL,
  `id_grado_materia` int(11) NOT NULL,
  `id_grupo` int(11) NOT NULL,
  `fe_inasistencia` date NOT NULL,
  `bo_justificado` tinyint(1) NOT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of inasistencia
-- ----------------------------

-- ----------------------------
-- Table structure for incidencia
-- ----------------------------
DROP TABLE IF EXISTS `incidencia`;
CREATE TABLE `incidencia` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_alumno` int(11) NOT NULL,
  `fe_incidencia` date NOT NULL,
  `id_tipo_falta` int(11) NOT NULL,
  `tx_descripcion` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_tipo_sancion` int(11) NOT NULL,
  `tx_sancion` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of incidencia
-- ----------------------------
INSERT INTO `incidencia` VALUES ('1', '1', '2020-07-30', '1', 'Pelea en el Comedor', '1', 'Se solicita a los padres reunion', null, '1', '1', '2020-07-30 23:21:33', '2020-07-30 23:21:33');
INSERT INTO `incidencia` VALUES ('2', '1', '2020-07-31', '2', 'Pelea en el Comedor', '2', 'Suspendido durante 3 dias', null, '1', '1', '2020-07-30 23:53:54', '2020-07-30 23:53:54');
INSERT INTO `incidencia` VALUES ('3', '24', '2020-08-18', '2', 'Peleo en el patio de recreo', '2', '1 dia de suspension', null, '1', '1', '2020-08-18 22:17:17', '2020-08-18 22:17:17');
INSERT INTO `incidencia` VALUES ('4', '103', '2020-09-02', '2', 'rgeger', '4', 'gerge', 'gege', '1', '1', '2020-09-04 12:36:11', '2020-09-04 12:36:11');

-- ----------------------------
-- Table structure for jornada
-- ----------------------------
DROP TABLE IF EXISTS `jornada`;
CREATE TABLE `jornada` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_jornada` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of jornada
-- ----------------------------
INSERT INTO `jornada` VALUES ('1', 'Lunes a Viernes de 7:00am a 5:00pm', null, '1', '1', '2020-05-09 09:39:04', '2020-05-09 09:39:04');
INSERT INTO `jornada` VALUES ('2', 'Sabado y Dominago de 7:00am a 5:00pm', null, '1', '1', '2020-05-09 09:40:48', '2020-05-09 09:40:48');

-- ----------------------------
-- Table structure for materia
-- ----------------------------
DROP TABLE IF EXISTS `materia`;
CREATE TABLE `materia` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_materia` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `co_materia` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_area_estudio` int(11) NOT NULL,
  `tx_icono` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of materia
-- ----------------------------
INSERT INTO `materia` VALUES ('1', 'Geografía de Colombia', 'GEOCOL', '1', null, null, '1', '1', '2020-05-16 06:18:56', '2020-05-16 07:32:16');
INSERT INTO `materia` VALUES ('2', 'Historia de Colombia', 'HISCOL', '1', null, null, '1', '1', '2020-05-16 06:36:18', '2020-05-16 06:36:18');
INSERT INTO `materia` VALUES ('3', 'Geografía de América', 'GEOAME', '1', null, null, '1', '1', '2020-05-16 07:32:58', '2020-05-16 07:32:58');
INSERT INTO `materia` VALUES ('4', 'Historia de América', 'HISAME', '1', null, null, '1', '1', '2020-05-16 07:33:34', '2020-05-16 07:33:34');
INSERT INTO `materia` VALUES ('5', 'Geografía Universal', 'GEOUNI', '1', null, null, '1', '1', '2020-05-16 07:33:57', '2020-05-16 07:35:34');
INSERT INTO `materia` VALUES ('6', 'Historia universal', 'HISUNI', '1', null, null, '1', '1', '2020-05-16 07:35:16', '2020-05-16 07:35:16');
INSERT INTO `materia` VALUES ('7', 'Ciencias naturales', 'CIENAT', '2', null, null, '1', '1', '2020-05-16 07:38:22', '2020-05-16 07:38:22');
INSERT INTO `materia` VALUES ('8', 'Biología', 'BIO001', '2', null, null, '1', '1', '2020-05-16 07:39:36', '2020-05-16 07:44:03');
INSERT INTO `materia` VALUES ('9', 'Física', 'FIS001', '2', null, null, '1', '1', '2020-05-16 07:39:56', '2020-05-16 07:44:15');
INSERT INTO `materia` VALUES ('10', 'Química', 'QUIM01', '2', null, null, '1', '1', '2020-05-16 07:40:12', '2020-05-16 07:44:35');
INSERT INTO `materia` VALUES ('11', 'Álgebra', 'ALG001', '5', null, null, '1', '1', '2020-05-16 07:40:51', '2020-05-16 07:43:37');
INSERT INTO `materia` VALUES ('12', 'Trigonometría', 'TRIG01', '5', null, null, '1', '1', '2020-05-16 07:41:09', '2020-05-16 07:43:47');
INSERT INTO `materia` VALUES ('13', 'Cálculo básico', 'CALBAS', '5', null, null, '1', '1', '2020-05-16 07:41:28', '2020-05-16 07:41:28');
INSERT INTO `materia` VALUES ('14', 'Matemática', 'MAT001', '5', null, null, '1', '1', '2020-05-16 07:41:54', '2020-05-16 07:43:55');
INSERT INTO `materia` VALUES ('15', 'Lengua Castellana', 'LENCAS', '6', null, null, '1', '1', '2020-05-16 15:51:48', '2020-05-16 17:15:24');
INSERT INTO `materia` VALUES ('16', 'Ingles', 'ING001', '6', null, null, '1', '1', '2020-05-16 15:52:21', '2020-05-16 15:52:21');
INSERT INTO `materia` VALUES ('17', 'Educacion Fisica', 'EDUFIS', '8', null, null, '1', '1', '2020-05-16 18:08:10', '2020-05-16 18:08:10');
INSERT INTO `materia` VALUES ('18', 'Educacion Artistica', 'ART001', '9', null, null, '1', '1', '2020-05-16 18:09:19', '2020-05-16 18:26:20');
INSERT INTO `materia` VALUES ('19', 'Ciencias Sociales', 'CIESOC', '1', null, null, '1', '1', '2020-05-16 18:30:50', '2020-05-16 18:30:50');
INSERT INTO `materia` VALUES ('20', 'Ciencias Naturales', 'CIENAT', '2', null, null, '1', '1', '2020-05-16 18:31:07', '2020-05-16 18:31:31');

-- ----------------------------
-- Table structure for matricula
-- ----------------------------
DROP TABLE IF EXISTS `matricula`;
CREATE TABLE `matricula` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_calendario` int(11) NOT NULL,
  `id_alumno` int(11) NOT NULL,
  `id_grado` int(11) NOT NULL,
  `id_grupo` int(11) DEFAULT NULL,
  `fe_matricula` date NOT NULL,
  `id_tipo_condicion` int(11) NOT NULL,
  `id_colegio_origen` int(11) DEFAULT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of matricula
-- ----------------------------
INSERT INTO `matricula` VALUES ('1', '1', '1', '4', '1', '2020-07-08', '2', null, null, '1', '1', '2020-07-08 16:07:06', '2020-07-21 00:16:04');
INSERT INTO `matricula` VALUES ('2', '1', '2', '4', '1', '2020-07-08', '1', null, null, '1', '1', '2020-07-08 16:58:20', '2020-07-08 16:58:23');
INSERT INTO `matricula` VALUES ('3', '1', '10', '4', '3', '2020-07-09', '1', null, null, '1', '1', '2020-07-08 23:14:31', '2020-07-08 23:33:42');
INSERT INTO `matricula` VALUES ('4', '1', '11', '4', '3', '2020-07-08', '1', null, null, '1', '1', '2020-07-08 23:36:02', '2020-07-08 23:36:02');
INSERT INTO `matricula` VALUES ('5', '1', '12', '4', '3', '2020-07-08', '1', null, null, '1', '1', '2020-07-09 02:44:20', '2020-07-09 02:44:20');
INSERT INTO `matricula` VALUES ('6', '1', '13', '4', '2', '2020-07-08', '1', null, null, '1', '1', '2020-07-09 02:44:44', '2020-07-09 02:44:44');
INSERT INTO `matricula` VALUES ('7', '1', '14', '4', '2', '2020-07-08', '1', null, null, '1', '1', '2020-07-09 02:45:09', '2020-07-09 02:45:09');
INSERT INTO `matricula` VALUES ('8', '1', '15', '4', '1', '2020-07-08', '1', null, null, '1', '1', '2020-07-09 02:45:33', '2020-07-09 02:45:33');
INSERT INTO `matricula` VALUES ('9', '1', '16', '4', '1', '2020-07-08', '1', null, null, '1', '1', '2020-07-09 02:45:59', '2020-07-09 02:45:59');
INSERT INTO `matricula` VALUES ('10', '1', '17', '4', '1', '2020-07-08', '1', null, null, '1', '1', '2020-07-09 02:46:29', '2020-07-09 02:46:29');
INSERT INTO `matricula` VALUES ('11', '1', '18', '9', '16', '2020-07-09', '1', null, null, '1', '1', '2020-07-09 13:31:08', '2020-07-09 13:31:08');
INSERT INTO `matricula` VALUES ('12', '1', '19', '7', '13', '2020-07-09', '1', null, null, '1', '1', '2020-07-09 13:31:45', '2020-07-09 13:31:45');
INSERT INTO `matricula` VALUES ('13', '1', '20', '6', '11', '2020-07-09', '1', null, null, '1', '1', '2020-07-09 13:33:54', '2020-07-09 13:33:54');
INSERT INTO `matricula` VALUES ('14', '1', '21', '9', '17', '2020-07-09', '1', null, null, '1', '1', '2020-07-09 13:34:48', '2020-07-09 13:34:48');
INSERT INTO `matricula` VALUES ('15', '1', '22', '8', '14', '2020-07-09', '2', null, null, '1', '1', '2020-07-09 13:35:32', '2020-07-09 13:35:32');
INSERT INTO `matricula` VALUES ('30', '1', '23', '4', '1', '2020-07-15', '1', null, null, '1', '1', '2020-07-15 16:17:22', '2020-07-15 16:17:22');
INSERT INTO `matricula` VALUES ('34', '1', '38', '4', '2', '2020-07-15', '1', null, null, '1', '1', '2020-07-15 16:36:04', '2020-07-15 16:36:04');
INSERT INTO `matricula` VALUES ('35', '1', '24', '4', '2', '2020-08-18', '1', null, null, '1', '1', '2020-08-18 22:16:00', '2020-08-18 22:16:00');

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_menu` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_modulo` int(11) DEFAULT NULL,
  `tx_ruta` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tx_path` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tx_icono` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tx_color` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_target` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bo_visible` tinyint(1) NOT NULL,
  `nu_orden` int(11) NOT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('1', 'Welcome', '8', 'welcome', '/', 'mdi-home', 'black', 'Welcome', '0', '1', 'Pagina Entrada', '1', '0', null, null);
INSERT INTO `menu` VALUES ('2', 'Home', '3', 'home', '/home', 'mdi-view-dashboard', 'brown', 'Home', '1', '2', 'Home Secretaria', '1', '1', null, '2020-09-02 15:08:33');
INSERT INTO `menu` VALUES ('3', 'Bandeja Docente', '2', 'bandeja-docente', 'bandeja-docente', 'mdi-tray-full', 'indigo', 'BandejaDocente', '1', '3', null, '1', '1', null, '2020-09-01 23:55:38');
INSERT INTO `menu` VALUES ('4', 'Bandeja Alumno', '5', 'bandeja-alumno', 'bandeja-alumno', 'mdi-tray-full', 'amber', 'BandejaAlumno', '1', '4', null, '1', '1', null, '2020-09-01 14:24:14');
INSERT INTO `menu` VALUES ('5', 'Bandeja Acudiente', '4', 'bandeja-acudiente', 'bandeja-acudiente', 'mdi-tray-full', 'light-green', 'BandejaAcudiente', '1', '5', null, '1', '1', null, '2020-09-01 14:25:17');
INSERT INTO `menu` VALUES ('6', 'Configuracion General', '3', 'admin-dashboard', 'admin/', 'mdi-cog', 'brown', 'BandejaAdmin', '1', '6', null, '1', '1', null, '2020-09-01 23:54:30');
INSERT INTO `menu` VALUES ('7', 'Institucion', '3', 'colegio', 'admin/colegio', 'mdi-store', 'deep-orange', 'AppColegio', '1', '7', null, '1', '1', null, '2020-09-01 14:41:31');
INSERT INTO `menu` VALUES ('8', 'Tipo Colegio', '3', 'tipoColegio', 'admin/tipoColegio', 'mdi-bookmark-multiple', 'deep-orange', 'TipoColegio', '1', '8', null, '1', '1', null, '2020-09-01 15:27:12');
INSERT INTO `menu` VALUES ('9', 'Cargos', '3', 'cargo', 'admin/cargos', 'mdi-account-group-outline', 'deep-orange', 'Cargos', '1', '9', null, '1', '1', null, '2020-09-01 14:41:48');
INSERT INTO `menu` VALUES ('10', 'Tipo Directiva', '3', 'tipo-directiva', 'admin/tipoDirectiva', 'mdi-account-group-outline', 'deep-orange', 'TipoDirectiva', '1', '10', null, '1', '1', null, '2020-09-01 14:42:00');
INSERT INTO `menu` VALUES ('11', 'Directiva', '3', 'directiva', 'admin/directiva', 'mdi-account-group', 'deep-orange', 'Directiva', '1', '11', null, '1', '1', null, '2020-09-01 14:42:11');
INSERT INTO `menu` VALUES ('12', 'Estructura', '3', 'estructura', 'admin/estructura', 'mdi-floor-plan', 'deep-orange', 'Estructura', '1', '12', null, '1', '1', null, '2020-09-01 14:42:57');
INSERT INTO `menu` VALUES ('13', 'Aulas', '3', 'aula', 'admin/aula', 'mdi-chair-school', 'deep-orange', 'Aula', '1', '13', null, '1', '1', null, '2020-09-01 14:43:40');
INSERT INTO `menu` VALUES ('14', 'Empleados', '3', 'empleado', 'admin/empleado', 'mdi-badge-account', 'deep-orange', 'Empleado', '1', '14', null, '1', '1', null, '2020-09-01 14:42:29');
INSERT INTO `menu` VALUES ('15', 'Calendario', '3', 'calendario', 'admin/calendario', 'mdi-calendar-blank', 'teal', 'Calendario', '1', '15', null, '1', '1', null, '2020-09-01 14:45:35');
INSERT INTO `menu` VALUES ('16', 'Periodos', '3', 'periodo', 'admin/periodo', 'mdi-calendar-weekend', 'teal', 'Periodo', '1', '16', null, '1', '1', null, '2020-09-01 14:45:47');
INSERT INTO `menu` VALUES ('17', 'Feriados', '3', 'feriado', 'admin/feriado', 'mdi-calendar-star', 'teal', 'Feriado', '1', '17', null, '1', '1', null, '2020-09-01 14:45:57');
INSERT INTO `menu` VALUES ('18', 'Tipo Agenda', '3', 'tipo-agenda', 'admin/tipo-agenda', 'mdi-clipboard-text-multiple', 'teal', 'TipoAgenda', '1', '18', null, '1', '1', null, '2020-09-01 15:54:58');
INSERT INTO `menu` VALUES ('19', 'Tipo Actividad', '3', 'tipo-actividad', 'admin/tipo-actividad', 'mdi-clipboard-text-multiple', 'teal', 'TipoActividad', '1', '19', null, '1', '1', null, '2020-09-01 15:55:09');
INSERT INTO `menu` VALUES ('20', 'Agenda', '3', 'agenda', 'admin/agenda', 'mdi-clipboard-text', 'teal', 'Agenda', '1', '20', null, '1', '1', null, '2020-09-01 15:55:20');
INSERT INTO `menu` VALUES ('21', 'Turnos', '3', 'turno', 'admin/turno', 'mdi-timelapse', 'teal', 'Turno', '1', '21', null, '1', '1', null, '2020-09-01 14:46:55');
INSERT INTO `menu` VALUES ('22', 'Horas Academicas', '3', 'hora-academica', 'admin/hora-academica', 'mdi-clock', 'teal', 'HoraAcademica', '1', '22', null, '1', '1', null, '2020-09-01 14:46:19');
INSERT INTO `menu` VALUES ('23', 'Carga Horaria', '3', 'carga-horaria', 'admin/carga-horaria', 'mdi-clock', 'teal', 'CargaHoraria', '1', '23', null, '1', '1', null, '2020-09-01 14:46:30');
INSERT INTO `menu` VALUES ('24', 'Niveles', '3', 'nivel', 'admin/nivel', 'mdi-stairs-up', 'cyan', 'Nivel', '1', '24', null, '1', '1', null, '2020-09-01 14:48:29');
INSERT INTO `menu` VALUES ('25', 'Grados', '3', 'grado', 'admin/grado', 'mdi-numeric', 'cyan', 'Grado', '1', '25', null, '1', '1', null, '2020-09-01 14:48:39');
INSERT INTO `menu` VALUES ('26', 'Grupos', '3', 'grupo', 'admin/grupo', 'mdi-alphabetical-variant', 'cyan', 'Grupo', '1', '26', null, '1', '1', null, '2020-09-01 14:48:49');
INSERT INTO `menu` VALUES ('27', 'Areas de Estudio', '3', 'area-estudio', 'admin/area-estudio', 'mdi-file-cad', 'cyan', 'AreaEstudio', '1', '27', null, '1', '1', null, '2020-09-01 14:47:42');
INSERT INTO `menu` VALUES ('28', 'Materias', '3', 'materia', 'admin/materia', 'mdi-bookshelf', 'cyan', 'Materia', '1', '28', null, '1', '1', null, '2020-09-01 14:47:51');
INSERT INTO `menu` VALUES ('29', 'Grado Materias', '3', 'grado-materia', 'admin/grado-materia', 'mdi-square-root', 'cyan', 'GradoMateria', '1', '29', null, '2', '1', null, '2020-09-01 15:10:29');
INSERT INTO `menu` VALUES ('30', 'Grupo Calificaciones', '3', 'grupo-calificacion', 'admin/grupo-calificacion', 'mdi-check-box-multiple-outline', 'purple', 'GrupoCalificacion', '1', '30', null, '1', '1', null, '2020-09-01 15:10:17');
INSERT INTO `menu` VALUES ('31', 'Nivel Calificaciones', '3', 'nivel-calificacion', 'admin/nivel-calificacion', 'mdi-check-box-multiple-outline', 'purple', 'NivelCalificacion', '1', '31', null, '1', '1', null, '2020-09-01 15:10:45');
INSERT INTO `menu` VALUES ('32', 'Calificacion', '3', 'calificacion', 'admin/calificacion', 'mdi-check-box-outline', 'purple', 'Calificacion', '1', '32', null, '1', '1', null, '2020-09-01 15:25:59');
INSERT INTO `menu` VALUES ('33', 'Tipo Evaluacion', '3', 'tipo-evaluacion', 'admin/tipo-evaluacion', 'mdi-clipboard-check-multiple-outline', 'purple', 'TipoEvaluacion', '1', '33', null, '1', '1', null, '2020-09-01 15:26:10');
INSERT INTO `menu` VALUES ('34', 'Metodo Evaluacion', '3', 'metodo-evaluacion', 'admin/metodo-evaluacion', 'mdi-clipboard-check-multiple-outline', 'purple', 'MetodoEvaluacion', '1', '34', null, '1', '1', null, '2020-09-01 15:26:21');
INSERT INTO `menu` VALUES ('35', 'Plan Evaluacion', '3', 'plan-evaluacion', 'admin/plan-evaluacion', 'mdi-table-clock', 'purple', 'AppPlanEvaluacion', '1', '35', null, '1', '1', null, '2020-09-01 15:26:35');
INSERT INTO `menu` VALUES ('36', 'Horario', '3', 'horario', 'admin/horario', 'mdi-calendar-multiselect', 'purple', 'Horario', '1', '36', null, '1', '1', null, '2020-09-01 15:27:58');
INSERT INTO `menu` VALUES ('37', 'Docente', '3', 'docente', 'admin/docente', 'mdi-account-tie', 'pink', 'Docente', '1', '37', null, '1', '1', null, '2020-09-01 23:44:21');
INSERT INTO `menu` VALUES ('38', 'Condicion Alumno', '3', 'tipo-condicion', 'admin/tipo-condicion', 'mdi-school-outline', 'pink', 'TipoCondicion', '1', '38', null, '1', '1', null, '2020-09-01 23:46:27');
INSERT INTO `menu` VALUES ('39', 'Alumnos', '3', 'alumno', 'admin/alumno', 'mdi-school', 'pink', 'Alumno', '1', '39', null, '1', '1', null, '2020-09-01 23:46:38');
INSERT INTO `menu` VALUES ('40', 'Acudiente', '3', 'pariente', 'admin/pariente', 'mdi-human-male-child', 'pink', 'Pariente', '1', '40', null, '1', '1', null, '2020-09-01 23:46:52');
INSERT INTO `menu` VALUES ('41', 'Tipo Faltas', '3', 'tipo-falta', 'admin/tipo-falta', 'mdi-account-alert-outline', 'pink', 'TipoFalta', '1', '41', null, '1', '1', null, '2020-09-01 23:47:04');
INSERT INTO `menu` VALUES ('42', 'Tipo Sancion', '3', 'tipo-sancion', 'admin/tipo-sancion', 'mdi-gavel', 'pink', 'TipoSancion', '1', '42', null, '1', '1', null, '2020-09-01 23:47:20');
INSERT INTO `menu` VALUES ('43', 'Asistencia', '3', 'Inasistencia', 'admin/inasistencia', 'mdi-account-check', 'indigo', 'Inasistencia', '1', '43', null, '1', '1', null, '2020-09-01 23:56:06');
INSERT INTO `menu` VALUES ('44', 'Parentesco', '3', 'parentesco', 'admin/parentesco', 'mdi-account-supervisor-circle', 'pink', 'Parentesco', '1', '44', null, '1', '1', null, '2020-09-01 23:47:46');
INSERT INTO `menu` VALUES ('45', 'Estado Civil', '3', 'estado-civil', 'admin/estado-civil', 'mdi-ring', 'pink', 'EstadoCivil', '1', '45', null, '1', '1', null, '2020-09-01 23:47:57');
INSERT INTO `menu` VALUES ('46', 'Tipo Telefono', '3', 'tipoTelefono', 'admin/tipoTelefono', 'mdi-phone-log', 'brown', 'TipoTelefono', '1', '46', null, '1', '1', null, '2020-09-01 23:48:21');
INSERT INTO `menu` VALUES ('47', 'Pais', '3', 'pais', 'admin/pais', 'mdi-earth', 'blue', 'Pais', '1', '47', null, '1', '1', null, '2020-09-01 23:56:33');
INSERT INTO `menu` VALUES ('48', 'Departamento', '3', 'departamento', 'admin/departamento', 'mdi-map-search', 'blue', 'Departamento', '1', '48', null, '1', '1', null, '2020-09-01 23:56:51');
INSERT INTO `menu` VALUES ('49', 'Ciudad', '3', 'ciudad', 'admin/ciudad', 'mdi-city-variant', 'blue', 'Ciudad', '1', '49', null, '1', '1', null, '2020-09-01 23:57:02');
INSERT INTO `menu` VALUES ('50', 'Zona', '3', 'zona', 'admin/zona', 'mdi-select-marker', 'blue', 'Zona', '1', '50', null, '1', '1', null, '2020-09-01 23:57:12');
INSERT INTO `menu` VALUES ('51', 'Comuna', '3', 'comuna', 'admin/comuna', 'mdi-map-marker-radius', 'blue', 'Comuna', '1', '51', null, '1', '1', null, '2020-09-01 23:57:56');
INSERT INTO `menu` VALUES ('52', 'Usuario', '3', 'usuario', 'admin/usuario', 'mdi-account', 'blue', 'Usuario', '1', '52', null, '1', '1', null, '2020-09-01 23:58:14');
INSERT INTO `menu` VALUES ('53', 'Modulo', '3', 'modulo', 'admin/modulo', 'mdi-account-details-outline', 'brown', 'Modulo', '1', '53', null, '1', '1', null, '2020-09-01 23:48:46');
INSERT INTO `menu` VALUES ('54', 'Menu', '3', 'menu', 'admin/menu', 'mdi-account-details', 'brown', 'Menu', '1', '54', null, '1', '1', null, '2020-09-01 23:48:58');
INSERT INTO `menu` VALUES ('55', 'Tipo Usuario', '3', 'tipoUsuario', 'admin/tipoUsuario', 'mdi-book-account', 'brown', 'TipoUsuario', '1', '55', null, '1', '1', null, '2020-09-01 23:49:11');
INSERT INTO `menu` VALUES ('56', 'Perfil', '3', 'perfil', 'admin/perfil', 'mdi-account-lock-outline', 'brown', 'Perfil', '1', '56', null, '1', '1', null, '2020-09-01 23:49:22');
INSERT INTO `menu` VALUES ('57', 'Usuario Perfil', '3', 'usuario-perfil', 'admin/usuario-perfil', 'mdi-account-lock-outline', 'blue', 'UsuarioPerfil', '1', '57', null, '1', '1', null, '2020-09-01 23:58:31');
INSERT INTO `menu` VALUES ('58', 'Permiso', '3', 'permiso', 'admin/permiso', 'mdi-account-lock', 'blue', 'Permiso', '1', '58', null, '1', '1', null, '2020-09-01 23:59:07');
INSERT INTO `menu` VALUES ('59', 'Documento', '3', 'documento', 'admin/documento', 'mdi-card-account-details', 'blue', 'Documento', '1', '59', null, '1', '1', null, '2020-09-01 23:59:18');
INSERT INTO `menu` VALUES ('60', 'Foto', '3', 'foto', 'admin/foto', 'mdi-image', 'blue', 'Foto', '1', '60', null, '1', '1', null, '2020-09-01 23:59:29');
INSERT INTO `menu` VALUES ('61', 'Pago', '3', 'pago', 'admin/pago', 'mdi-credit-card-settings', 'blue', 'Pago', '1', '61', null, '1', '1', null, '2020-09-01 23:59:40');
INSERT INTO `menu` VALUES ('62', 'Tipo Contacto', '3', 'tipo-contacto', 'admin/tipo-contacto', 'mdi-contacts', 'brown', 'TipoContacto', '1', '62', null, '1', '0', null, null);
INSERT INTO `menu` VALUES ('63', 'Contacto', '3', 'contacto', 'admin/contacto', 'mdi-contacts', 'blue', 'Contacto', '1', '63', null, '1', '1', null, '2020-09-01 23:59:56');
INSERT INTO `menu` VALUES ('64', 'Status', '3', 'status', 'admin/status', 'mdi-playlist-check', 'brown', 'Status', '1', '64', null, '1', '0', null, null);
INSERT INTO `menu` VALUES ('65', 'Suscripcion', '3', 'suscripcion', 'admin/suscripcion', 'mdi-file-document-edit', 'blue', 'Suscripcion', '1', '65', null, '1', '1', null, '2020-09-02 00:00:09');
INSERT INTO `menu` VALUES ('66', 'Telefono', '3', 'telefono', 'admin/telefono', 'mdi-phone', 'blue', 'Telefono', '1', '66', null, '1', '1', null, '2020-09-02 00:00:29');
INSERT INTO `menu` VALUES ('67', 'Tipo Foto', '3', 'tipoFoto', 'admin/tipoFoto', 'mdi-image-album', 'brown', 'TipoFoto', '1', '67', null, '1', '0', null, null);
INSERT INTO `menu` VALUES ('68', 'Tipo Pago', '3', 'tipoPago', 'admin/tipoPago', 'mdi-credit-card-multiple', 'brown', 'TipoPago', '1', '68', null, '1', '0', null, null);
INSERT INTO `menu` VALUES ('69', 'Tipo Documento', '3', 'tipo-documento', 'admin/tipo-documento', 'mdi-card-account-details', 'brown', 'TipoDocumento', '1', '69', null, '1', '0', null, null);
INSERT INTO `menu` VALUES ('70', 'Tipo Archivo', '3', 'tipo-archivo', 'admin/tipo-archivo', 'mdi-file-multiple', 'brown', 'TipoArchivo', '1', '70', null, '1', '0', null, null);
INSERT INTO `menu` VALUES ('71', 'Archivo', '3', 'archivo', 'admin/archivo', 'mdi-file', 'blue', 'Archivo', '1', '71', null, '1', '1', null, '2020-09-02 00:00:41');
INSERT INTO `menu` VALUES ('72', 'Tipo Recurso', '3', 'tipo-recurso', 'admin/tipo-recurso', 'mdi-book-open-page-variant', 'brown', 'TipoRecurso', '1', '72', null, '1', '0', null, null);
INSERT INTO `menu` VALUES ('73', 'Recurso', '3', 'recurso', 'admin/recurso', 'mdi-book-open-page-variant', 'blue', 'Recurso', '1', '73', null, '1', '1', null, '2020-09-02 00:00:51');
INSERT INTO `menu` VALUES ('74', 'Tipo Destinatario', '3', 'tipo-destinatario', 'admin/tipo-destinatario', 'mdi-account-question', 'brown', 'TipoDestinatario', '1', '74', null, '1', '0', null, null);
INSERT INTO `menu` VALUES ('75', 'Prioridad', '3', 'tipo-prioridad', 'admin/tipo-prioridad', 'mdi-alert', 'brown', 'TipoPrioridad', '1', '75', null, '1', '0', null, null);
INSERT INTO `menu` VALUES ('76', 'Tipo Notificacion', '3', 'tipo-notificacion', 'admin/tipo-notificacion', 'mdi-bell-outline', 'brown', 'TipoNotificacion', '1', '76', null, '1', '0', null, null);
INSERT INTO `menu` VALUES ('77', 'Notificaciones', '3', 'notificacion', 'admin/notificacion', 'mdi-bell', 'blue', 'Notificacion', '1', '77', null, '1', '1', null, '2020-09-02 00:01:07');
INSERT INTO `menu` VALUES ('78', 'Tipo Preguntas', '3', 'tipo-pregunta', 'admin/tipo-pregunta', 'mdi-order-bool-descending-variant', 'cyan', 'TipoPregunta', '1', '78', null, '1', '1', null, '2020-09-02 00:01:21');
INSERT INTO `menu` VALUES ('79', 'Prueba', '3', 'prueba', 'admin/prueba', 'mdi-order-bool-descending-variant', 'cyan', 'Prueba', '1', '79', null, '1', '1', null, '2020-09-02 00:01:32');
INSERT INTO `menu` VALUES ('80', 'Pregunta', '3', 'pregunta', 'admin/pregunta', 'mdi-order-bool-descending-variant', 'cyan', 'Pregunta', '1', '80', null, '1', '1', null, '2020-09-02 00:01:42');
INSERT INTO `menu` VALUES ('81', 'Respuesta', '3', 'respuesta', 'admin/respuesta', 'mdi-order-bool-descending-variant', 'cyan', 'Respuesta', '1', '81', null, '1', '1', null, '2020-09-02 00:01:53');
INSERT INTO `menu` VALUES ('82', 'Prueba Alumno', '3', 'prueba-alumno', 'admin/prueba-alumno', 'mdi-order-bool-descending-variant', 'cyan', 'PruebaAlumno', '1', '82', null, '1', '1', null, '2020-09-02 00:02:04');
INSERT INTO `menu` VALUES ('83', 'Respuesta Alumno', '3', 'respuesta-alumno', 'admin/respuesta-alumno', 'mdi-order-bool-descending-variant', 'cyan', 'RespuestaAlumno', '1', '83', null, '1', '1', null, '2020-09-02 00:02:15');
INSERT INTO `menu` VALUES ('84', 'Personalizacion', '2', 'configuracion', 'admin/configuracion', 'mdi-cogs', 'brown', 'Configuracion', '1', '84', null, '1', '1', null, '2020-09-01 14:23:22');
INSERT INTO `menu` VALUES ('85', 'Clase Docente', '3', 'meet-docente', 'admin/meet-docente', 'mdi-google-classroom', 'black', 'MeetDocente', '1', '85', null, '1', '0', null, null);
INSERT INTO `menu` VALUES ('86', 'Clase Alumno', '3', 'meet-alumno', 'admin/meet-alumno', 'mdi-google-classroom', 'black', 'MeetAlumno', '1', '86', null, '1', '0', null, null);
INSERT INTO `menu` VALUES ('87', 'Reporte', '3', 'reporte', 'admin/reporte', 'mdi-table-large', 'blue', 'AppReporte', '1', '87', null, '1', '1', null, '2020-09-02 00:02:50');
INSERT INTO `menu` VALUES ('88', 'Generador', '2', 'crud', '/crud', 'mdi-factory', 'black', 'Crud', '1', '88', null, '1', '1', null, '2020-09-01 14:21:53');
INSERT INTO `menu` VALUES ('89', 'Login', '8', 'login', '/login', 'mdi-account-key', 'black', 'Login', '0', '89', null, '1', '1', null, '2020-09-01 13:55:18');
INSERT INTO `menu` VALUES ('90', 'Not Found', '8', 'notfound', '*', 'mdi-monitor-off', 'black', 'PageNotFound', '0', '1000', 'Pagina no Encontrada', '1', '1', null, '2020-09-01 13:54:16');

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=181 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES ('44', '2016_06_01_000001_create_oauth_auth_codes_table', '1');
INSERT INTO `migrations` VALUES ('45', '2016_06_01_000002_create_oauth_access_tokens_table', '1');
INSERT INTO `migrations` VALUES ('46', '2016_06_01_000003_create_oauth_refresh_tokens_table', '1');
INSERT INTO `migrations` VALUES ('47', '2016_06_01_000004_create_oauth_clients_table', '1');
INSERT INTO `migrations` VALUES ('48', '2016_06_01_000005_create_oauth_personal_access_clients_table', '1');
INSERT INTO `migrations` VALUES ('49', '2018_08_08_100000_create_telescope_entries_table', '1');
INSERT INTO `migrations` VALUES ('50', '2020_04_02_024140_create_tipo_usuario_table', '1');
INSERT INTO `migrations` VALUES ('51', '2020_04_02_024141_create_usuario_table', '1');
INSERT INTO `migrations` VALUES ('52', '2020_04_02_024254_create_status_table', '1');
INSERT INTO `migrations` VALUES ('53', '2020_04_02_024410_create_pais_table', '1');
INSERT INTO `migrations` VALUES ('54', '2020_04_02_024420_create_departamento_table', '1');
INSERT INTO `migrations` VALUES ('55', '2020_04_02_024433_create_ciudad_table', '1');
INSERT INTO `migrations` VALUES ('56', '2020_04_02_024449_create_zona_table', '1');
INSERT INTO `migrations` VALUES ('57', '2020_04_02_024501_create_comuna_table', '1');
INSERT INTO `migrations` VALUES ('58', '2020_04_02_024512_create_barrio_table', '1');
INSERT INTO `migrations` VALUES ('60', '2020_04_02_024549_create_tipo_pago_table', '1');
INSERT INTO `migrations` VALUES ('61', '2020_04_02_024604_create_tipo_telefono_table', '1');
INSERT INTO `migrations` VALUES ('62', '2020_04_02_024706_create_telefono_table', '1');
INSERT INTO `migrations` VALUES ('63', '2020_04_02_024734_create_contacto_table', '1');
INSERT INTO `migrations` VALUES ('64', '2020_04_02_024750_create_foto_table', '1');
INSERT INTO `migrations` VALUES ('65', '2020_04_02_024807_create_pago_table', '1');
INSERT INTO `migrations` VALUES ('66', '2020_04_02_024823_create_subcripcion_table', '1');
INSERT INTO `migrations` VALUES ('67', '2020_05_03_234930_create_tipo_colegio_table', '1');
INSERT INTO `migrations` VALUES ('68', '2020_05_03_235100_create_colegio_table', '1');
INSERT INTO `migrations` VALUES ('69', '2020_05_03_235136_create_tipo_directiva_table', '1');
INSERT INTO `migrations` VALUES ('70', '2020_05_03_235156_create_nivel_table', '1');
INSERT INTO `migrations` VALUES ('71', '2020_05_03_235302_create_parentesco_table', '1');
INSERT INTO `migrations` VALUES ('72', '2020_05_03_235334_create_directiva_table', '1');
INSERT INTO `migrations` VALUES ('73', '2020_05_03_235349_create_calendario_table', '1');
INSERT INTO `migrations` VALUES ('74', '2020_05_03_235404_create_periodo_table', '1');
INSERT INTO `migrations` VALUES ('75', '2020_05_03_235419_create_profesor_table', '1');
INSERT INTO `migrations` VALUES ('81', '2020_05_03_235534_create_clase_table', '1');
INSERT INTO `migrations` VALUES ('82', '2020_05_03_235551_create_inasistencia_table', '1');
INSERT INTO `migrations` VALUES ('84', '2020_05_03_235622_create_profesor_materia_table', '1');
INSERT INTO `migrations` VALUES ('85', '2020_05_03_235638_create_documento_table', '1');
INSERT INTO `migrations` VALUES ('86', '2020_05_04_000105_create_suscripcion_table', '1');
INSERT INTO `migrations` VALUES ('87', '2020_05_03_234931_create_jornadas_table', '2');
INSERT INTO `migrations` VALUES ('88', '2020_05_03_234931_create_jornada_table', '3');
INSERT INTO `migrations` VALUES ('89', '2020_05_03_234932_create_cargo_table', '4');
INSERT INTO `migrations` VALUES ('90', '2020_05_03_234933_create_turno_table', '5');
INSERT INTO `migrations` VALUES ('92', '2020_05_03_235157_create_grado_table', '7');
INSERT INTO `migrations` VALUES ('93', '2020_04_02_024605_create_tipo_calificacion_table', '8');
INSERT INTO `migrations` VALUES ('94', '2020_04_02_024606_create_grupo_calificacion_table', '9');
INSERT INTO `migrations` VALUES ('95', '2020_05_03_235518_create_calificacion_table', '10');
INSERT INTO `migrations` VALUES ('96', '2020_04_02_024607_create_nivel_calificacion_table', '11');
INSERT INTO `migrations` VALUES ('98', '2020_04_02_024608_create_ubicacion_table', '12');
INSERT INTO `migrations` VALUES ('99', '2020_04_02_024608_create_estructura_table', '13');
INSERT INTO `migrations` VALUES ('100', '2020_04_02_024609_create_aula_table', '14');
INSERT INTO `migrations` VALUES ('102', '2020_05_13_065939_create_empleado_table', '15');
INSERT INTO `migrations` VALUES ('103', '2020_04_02_024610_create_estado_civil_table', '16');
INSERT INTO `migrations` VALUES ('104', '2020_04_02_024610_create_tipo_documento_table', '17');
INSERT INTO `migrations` VALUES ('105', '2020_05_16_023759_create_docente_table', '18');
INSERT INTO `migrations` VALUES ('106', '2020_05_03_235421_create_grupo_materia_table', '19');
INSERT INTO `migrations` VALUES ('107', '2020_05_03_235422_create_materia_table', '20');
INSERT INTO `migrations` VALUES ('108', '2020_05_03_235421_create_area_estudio_table', '21');
INSERT INTO `migrations` VALUES ('109', '2020_05_03_235448_create_grado_materia_table', '22');
INSERT INTO `migrations` VALUES ('110', '2020_05_03_235433_create_grupo_table', '23');
INSERT INTO `migrations` VALUES ('111', '2020_05_03_235503_create_alumno_table', '24');
INSERT INTO `migrations` VALUES ('113', '2020_05_03_234935_create_carga_horaria_table', '25');
INSERT INTO `migrations` VALUES ('114', '2020_05_03_234934_create_hora_academica_table', '26');
INSERT INTO `migrations` VALUES ('115', '2020_05_03_235449_create_horario_table', '27');
INSERT INTO `migrations` VALUES ('116', '2020_05_03_235450_create_actividad_table', '28');
INSERT INTO `migrations` VALUES ('117', '2020_05_03_235451_create_actividad_carga_horaria_table', '29');
INSERT INTO `migrations` VALUES ('118', '2020_05_03_235504_create_grupo_alumno_table', '30');
INSERT INTO `migrations` VALUES ('119', '2020_05_25_152510_create_configuracion_table', '31');
INSERT INTO `migrations` VALUES ('120', '2020_05_03_235503_create_grado_alumno_table', '32');
INSERT INTO `migrations` VALUES ('121', '2020_05_03_235607_create_pariente_table', '33');
INSERT INTO `migrations` VALUES ('122', '2020_05_25_222022_create_tipo_evaluacion_table', '34');
INSERT INTO `migrations` VALUES ('125', '2020_05_25_231120_create_plan_evaluacion_table', '35');
INSERT INTO `migrations` VALUES ('126', '2020_05_26_163329_create_detalle_evaluacion_table', '36');
INSERT INTO `migrations` VALUES ('127', '2020_05_28_194114_create_tipo_archivo_table', '37');
INSERT INTO `migrations` VALUES ('128', '2020_05_28_194144_create_archivo_table', '38');
INSERT INTO `migrations` VALUES ('129', '2020_04_02_024537_create_tipo_foto_table', '39');
INSERT INTO `migrations` VALUES ('130', '2020_04_02_024538_create_tipo_contacto_table', '40');
INSERT INTO `migrations` VALUES ('132', '2020_06_06_142507_create_menu_table', '42');
INSERT INTO `migrations` VALUES ('133', '2020_06_06_142546_create_perfil_table', '43');
INSERT INTO `migrations` VALUES ('134', '2020_06_06_142638_create_permiso_table', '44');
INSERT INTO `migrations` VALUES ('135', '2020_06_06_142623_create_usuario_perfil_table', '45');
INSERT INTO `migrations` VALUES ('136', '2020_06_06_142506_create_modulo_table', '46');
INSERT INTO `migrations` VALUES ('137', '2020_06_10_231903_create_docente_materia_table', '47');
INSERT INTO `migrations` VALUES ('139', '2020_06_13_150324_create_docente_grupo_table', '48');
INSERT INTO `migrations` VALUES ('142', '2020_06_15_182729_create_tipo_feriado_table', '50');
INSERT INTO `migrations` VALUES ('144', '2020_06_15_161057_create_feriado_table', '51');
INSERT INTO `migrations` VALUES ('145', '2020_06_16_192450_create_tipo_agenda_table', '52');
INSERT INTO `migrations` VALUES ('146', '2020_06_16_204219_create_agenda_table', '53');
INSERT INTO `migrations` VALUES ('147', '2020_06_19_010443_create_tipo_actividad_table', '54');
INSERT INTO `migrations` VALUES ('149', '2020_05_03_235450_create_detalle_horario_table', '55');
INSERT INTO `migrations` VALUES ('151', '2020_06_29_160801_create_evaluacion_alumno_table', '57');
INSERT INTO `migrations` VALUES ('152', '2020_05_26_163329_create_plan_detalle_table', '58');
INSERT INTO `migrations` VALUES ('153', '2020_07_01_214038_create_tipo_recurso_table', '59');
INSERT INTO `migrations` VALUES ('154', '2020_07_01_214039_create_recurso_table', '60');
INSERT INTO `migrations` VALUES ('155', '2020_06_29_160629_create_evaluacion_table', '61');
INSERT INTO `migrations` VALUES ('157', '2020_07_08_154448_create_tipo_condicion_table', '62');
INSERT INTO `migrations` VALUES ('158', '2020_07_08_154826_create_matricula_table', '63');
INSERT INTO `migrations` VALUES ('159', '2020_07_14_232518_create_alumno_materia_table', '64');
INSERT INTO `migrations` VALUES ('160', '2020_07_17_231332_create_grupo_materia_table', '65');
INSERT INTO `migrations` VALUES ('161', '2020_07_21_233954_create_tipo_notificacion_table', '66');
INSERT INTO `migrations` VALUES ('162', '2020_07_21_234012_create_tipo_prioridad_table', '67');
INSERT INTO `migrations` VALUES ('163', '2020_07_21_234032_create_tipo_destinatario_table', '68');
INSERT INTO `migrations` VALUES ('164', '2020_07_21_234033_create_notificacion_table', '69');
INSERT INTO `migrations` VALUES ('165', '2020_07_24_183139_create_alumno_pariente_table', '70');
INSERT INTO `migrations` VALUES ('166', '2020_07_30_203715_create_tipo_falta_table', '71');
INSERT INTO `migrations` VALUES ('167', '2020_07_30_203729_create_tipo_sancion_table', '72');
INSERT INTO `migrations` VALUES ('168', '2020_07_30_203730_create_incidencia_table', '73');
INSERT INTO `migrations` VALUES ('169', '2020_08_02_013844_create_tipo_pregunta_table', '74');
INSERT INTO `migrations` VALUES ('170', '2020_08_02_013918_create_prueba_table', '75');
INSERT INTO `migrations` VALUES ('171', '2020_08_02_013950_create_prueba_alumno_table', '76');
INSERT INTO `migrations` VALUES ('172', '2020_08_02_013937_create_pregunta_table', '77');
INSERT INTO `migrations` VALUES ('173', '2020_08_02_014007_create_respuesta_alumno_table', '78');
INSERT INTO `migrations` VALUES ('175', '2020_08_02_013938_create_respuesta_table', '79');
INSERT INTO `migrations` VALUES ('176', '2020_06_29_160628_create_evaluacion_metodo_table', '80');
INSERT INTO `migrations` VALUES ('177', '2020_09_01_151514_create_asistente_table', '81');
INSERT INTO `migrations` VALUES ('178', '2020_09_01_151554_create_asistente_detalle_table', '82');
INSERT INTO `migrations` VALUES ('179', '2020_09_04_212003_create_notifications_table', '83');

-- ----------------------------
-- Table structure for modulo
-- ----------------------------
DROP TABLE IF EXISTS `modulo`;
CREATE TABLE `modulo` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_modulo` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tx_grupo` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nu_orden` int(11) DEFAULT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of modulo
-- ----------------------------
INSERT INTO `modulo` VALUES ('1', 'Bandeja Docente', 'ppal', '4', null, '1', '1', '2020-06-06 18:42:15', '2020-06-06 19:00:25');
INSERT INTO `modulo` VALUES ('2', 'Administrador', 'ppal', '1', null, '1', '1', '2020-06-06 18:54:40', '2020-08-21 03:50:09');
INSERT INTO `modulo` VALUES ('3', 'Secretaria', 'ppal', '2', null, '1', '1', '2020-06-06 18:55:09', '2020-08-21 03:50:20');
INSERT INTO `modulo` VALUES ('4', 'Bandeja Acudiente', 'ppal', '3', null, '1', '1', '2020-06-06 18:58:36', '2020-06-06 19:01:08');
INSERT INTO `modulo` VALUES ('5', 'Bandeja Alumno', 'ppal', '5', null, '1', '1', '2020-06-06 18:59:25', '2020-08-21 03:49:41');
INSERT INTO `modulo` VALUES ('6', 'Bandeja Empleado', 'ppal', '6', null, '1', '1', '2020-06-06 19:00:01', '2020-06-06 19:00:01');
INSERT INTO `modulo` VALUES ('7', 'Gestion Usuario', 'ppal', '7', null, '1', '1', null, null);
INSERT INTO `modulo` VALUES ('8', 'General', 'ppal', '8', null, '1', '1', null, null);

-- ----------------------------
-- Table structure for nivel
-- ----------------------------
DROP TABLE IF EXISTS `nivel`;
CREATE TABLE `nivel` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_nivel` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of nivel
-- ----------------------------
INSERT INTO `nivel` VALUES ('1', 'Preescolar', null, '1', '1', '2020-05-08 19:05:25', '2020-05-11 18:57:44');
INSERT INTO `nivel` VALUES ('2', 'Primaria', null, '1', '1', '2020-05-08 19:05:36', '2020-05-08 19:05:36');
INSERT INTO `nivel` VALUES ('3', 'Bachiller', null, '1', '1', '2020-05-08 19:05:47', '2020-05-08 19:05:47');

-- ----------------------------
-- Table structure for nivel_calificacion
-- ----------------------------
DROP TABLE IF EXISTS `nivel_calificacion`;
CREATE TABLE `nivel_calificacion` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_nivel_calificacion` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of nivel_calificacion
-- ----------------------------
INSERT INTO `nivel_calificacion` VALUES ('1', 'Deficiente', null, '1', '1', '2020-05-12 08:35:09', '2020-05-13 02:54:04');
INSERT INTO `nivel_calificacion` VALUES ('2', 'Insuficiente', null, '1', '1', '2020-05-12 08:35:21', '2020-05-12 08:35:21');
INSERT INTO `nivel_calificacion` VALUES ('3', 'Regular', null, '1', '1', '2020-05-12 08:35:34', '2020-05-13 02:54:24');
INSERT INTO `nivel_calificacion` VALUES ('4', 'Bueno', null, '1', '1', '2020-05-12 08:35:51', '2020-05-12 08:35:51');
INSERT INTO `nivel_calificacion` VALUES ('5', 'Sobresaliente', null, '1', '1', '2020-05-12 08:36:06', '2020-05-13 02:55:12');
INSERT INTO `nivel_calificacion` VALUES ('6', 'Excelente', null, '1', '1', '2020-05-12 08:36:23', '2020-05-13 02:55:28');

-- ----------------------------
-- Table structure for notificacion
-- ----------------------------
DROP TABLE IF EXISTS `notificacion`;
CREATE TABLE `notificacion` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `co_notificacion` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_tipo_destinatario` int(11) NOT NULL,
  `id_destinatario` int(11) NOT NULL,
  `tx_asunto` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tx_mensaje` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tx_lugar` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_tipo_notificacion` int(11) NOT NULL,
  `id_tipo_prioridad` int(11) unsigned NOT NULL,
  `fe_notificacion` date NOT NULL,
  `hh_inicio` time DEFAULT NULL,
  `hh_fin` time DEFAULT NULL,
  `fe_lectura` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of notificacion
-- ----------------------------
INSERT INTO `notificacion` VALUES ('1', 'NIdXCDB1W4Ab6Lb5', '3', '1', 'djfgjj', 'fjfg', 'jgfj', '1', '1', '2020-07-15', null, null, null, null, '1', '1', '2020-07-24 16:21:03', '2020-07-24 16:21:03');
INSERT INTO `notificacion` VALUES ('2', 'POzM0XUBmzvCdZaE', '3', '1', 'Inicio de Clases', 'Inicio del año escolar', 'N/A', '2', '1', '2020-07-01', '00:01:00', '00:01:00', null, null, '1', '1', '2020-07-24 17:58:59', '2020-07-24 17:58:59');
INSERT INTO `notificacion` VALUES ('3', 'tfh1kITy1oKSswil', '4', '1', 'yeryerye', 'hfghfhfhfhfg', 'N/A', '2', '1', '2020-07-05', '00:10:00', '05:00:00', null, null, '1', '1', '2020-07-31 22:22:23', '2020-07-31 22:22:23');
INSERT INTO `notificacion` VALUES ('4', 'ujeDGVOt9NZLyGk1', '2', '1', 'dgsdgs', 'gsdgsgsgs', 'dgsdgsg', '1', '1', '2020-08-12', null, null, null, null, '1', '1', '2020-08-12 14:18:52', '2020-08-12 14:18:52');
INSERT INTO `notificacion` VALUES ('5', '6S4j4bttAg4T6Xls', '3', '1', 'Inicio de Clases', 'Inicio del año escolar', 'N/A', '2', '1', '2020-07-01', '00:01:00', '00:01:00', null, null, '1', '1', '2020-08-18 02:37:24', '2020-08-18 02:37:24');
INSERT INTO `notificacion` VALUES ('6', 'MBk31IgE9DC8Jq78', '4', '1', 'dgshghsdf', 'hdffhdf', 'N/A', '2', '1', '2020-08-04', '00:36:00', '00:30:00', null, null, '1', '1', '2020-08-18 21:45:06', '2020-08-18 21:45:06');
INSERT INTO `notificacion` VALUES ('7', 'JzlyuNMKqDxX3vRz', '3', '1', 'Prueba', 'Actividad Prueba', 'N/A', '2', '1', '2020-07-15', '00:00:00', '00:59:00', null, null, '1', '1', '2020-08-18 21:50:45', '2020-08-18 21:50:45');
INSERT INTO `notificacion` VALUES ('8', 'TkNSj74e3gfISjaw', '2', '12', 'sgssd', 'tdgs', 'gsdg', '1', '1', '2020-08-19', null, null, null, null, '1', '1', '2020-08-19 19:11:27', '2020-08-19 19:11:27');
INSERT INTO `notificacion` VALUES ('9', 'xyRlkHgdLlPJpliI', '4', '1', 'Inicio de Clases', 'Inicio del año escolar', 'N/A', '2', '1', '2020-07-01', '00:01:00', '00:01:00', null, null, '1', '1', '2020-08-19 19:14:51', '2020-08-19 19:14:51');
INSERT INTO `notificacion` VALUES ('10', 'IQS-VTH-R8V-J4T', '3', '1', 'eeqeqe', 'eeq', 'N/A', '2', '1', '2020-09-09', '06:06:00', '07:05:00', null, null, '1', '1', '2020-09-05 02:00:12', '2020-09-05 02:00:12');
INSERT INTO `notificacion` VALUES ('11', '7NY-BB1-FSP-5NP', '3', '1', 'eeqeqe', 'eeq', 'N/A', '2', '1', '2020-09-09', '06:06:00', '07:05:00', null, null, '1', '2', '2020-09-05 02:06:17', '2020-09-05 02:06:17');
INSERT INTO `notificacion` VALUES ('14', 'JHT-4YS-1YG-YUG', '3', '2', 'eeqeqe', 'eeq', 'N/A', '2', '1', '2020-09-09', '06:06:00', '07:05:00', '2020-09-05 18:12:32', null, '1', '2', '2020-09-05 14:12:08', '2020-09-05 18:12:32');
INSERT INTO `notificacion` VALUES ('16', 'QAM-8NB-4WE-CIP', '3', '2', 'Reunion', 'fdfsf', 'N/A', '2', '1', '2020-09-10', '02:09:00', '01:09:00', '2020-09-05 18:06:00', null, '1', '2', '2020-09-05 14:14:19', '2020-09-05 18:06:00');
INSERT INTO `notificacion` VALUES ('17', '0JV-PN3-FL6-WAP', '3', '2', 'Reunion', 'fdfsf', 'N/A', '2', '1', '2020-09-10', '02:09:00', '01:09:00', '2020-09-05 18:07:27', null, '1', '2', '2020-09-05 14:14:25', '2020-09-05 18:07:27');
INSERT INTO `notificacion` VALUES ('18', '2U6-AH8-OWD-YTJ', '3', '2', 'Reunion', 'fdfsf', 'N/A', '2', '1', '2020-09-10', '02:09:00', '01:09:00', '2020-09-05 18:13:12', null, '1', '2', '2020-09-05 18:12:57', '2020-09-05 18:13:12');
INSERT INTO `notificacion` VALUES ('20', 'QNH-YDR-JUL-GJW', '3', '2', 'Reunion', 'fdfsf', 'N/A', '2', '1', '2020-09-10', '02:09:00', '01:09:00', '2020-09-05 18:27:52', null, '1', '2', '2020-09-05 18:27:35', '2020-09-05 18:27:52');
INSERT INTO `notificacion` VALUES ('21', '6A0-TB6-GID-TMX', '3', '1', 'reunion', 'faltas actividades', 'n/a', '1', '3', '2020-09-05', null, null, null, null, '1', '1', '2020-09-05 18:31:10', '2020-09-05 18:31:10');
INSERT INTO `notificacion` VALUES ('22', 'WIL-CDA-ZWK-7YN', '4', '1', 'eeqeqe', 'eeq', 'N/A', '2', '1', '2020-09-09', '06:06:00', '07:05:00', null, null, '1', '1', '2020-09-12 17:26:31', '2020-09-12 17:26:31');

-- ----------------------------
-- Table structure for oauth_access_tokens
-- ----------------------------
DROP TABLE IF EXISTS `oauth_access_tokens`;
CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `client_id` bigint(20) unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of oauth_access_tokens
-- ----------------------------

-- ----------------------------
-- Table structure for oauth_auth_codes
-- ----------------------------
DROP TABLE IF EXISTS `oauth_auth_codes`;
CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `client_id` bigint(20) unsigned NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_auth_codes_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of oauth_auth_codes
-- ----------------------------

-- ----------------------------
-- Table structure for oauth_clients
-- ----------------------------
DROP TABLE IF EXISTS `oauth_clients`;
CREATE TABLE `oauth_clients` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of oauth_clients
-- ----------------------------

-- ----------------------------
-- Table structure for oauth_personal_access_clients
-- ----------------------------
DROP TABLE IF EXISTS `oauth_personal_access_clients`;
CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of oauth_personal_access_clients
-- ----------------------------

-- ----------------------------
-- Table structure for oauth_refresh_tokens
-- ----------------------------
DROP TABLE IF EXISTS `oauth_refresh_tokens`;
CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of oauth_refresh_tokens
-- ----------------------------

-- ----------------------------
-- Table structure for pago
-- ----------------------------
DROP TABLE IF EXISTS `pago`;
CREATE TABLE `pago` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_subcripcion` int(11) NOT NULL,
  `mo_pago` decimal(9,2) NOT NULL,
  `id_tipo_pago` int(11) NOT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of pago
-- ----------------------------

-- ----------------------------
-- Table structure for pais
-- ----------------------------
DROP TABLE IF EXISTS `pais`;
CREATE TABLE `pais` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_pais` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `co_pais` int(11) NOT NULL,
  `tx_iso` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pais_nb_pais_unique` (`nb_pais`),
  UNIQUE KEY `pais_co_pais_unique` (`co_pais`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of pais
-- ----------------------------
INSERT INTO `pais` VALUES ('57', 'Colombia', '57', 'COL', null, '1', '1', '2020-05-08 18:21:00', '2020-05-08 18:21:00');

-- ----------------------------
-- Table structure for parentesco
-- ----------------------------
DROP TABLE IF EXISTS `parentesco`;
CREATE TABLE `parentesco` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_parentesco` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of parentesco
-- ----------------------------
INSERT INTO `parentesco` VALUES ('1', 'Padre', null, '1', '1', '2020-05-07 17:36:37', '2020-05-08 20:32:55');
INSERT INTO `parentesco` VALUES ('2', 'Madre', null, '1', '1', '2020-05-07 17:38:22', '2020-05-08 20:33:02');
INSERT INTO `parentesco` VALUES ('3', 'Hermano/a', null, '1', '1', '2020-05-07 17:39:09', '2020-05-08 20:33:21');
INSERT INTO `parentesco` VALUES ('4', 'Tio/a', null, '1', '1', '2020-05-07 17:39:34', '2020-05-08 20:33:34');

-- ----------------------------
-- Table structure for pariente
-- ----------------------------
DROP TABLE IF EXISTS `pariente`;
CREATE TABLE `pariente` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_apellido` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nb_apellido2` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nb_nombre` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nb_nombre2` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_tipo_documento` int(11) NOT NULL,
  `tx_documento` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_sexo` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fe_nacimiento` date NOT NULL,
  `tx_nacionalidad` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tx_lugar_nacimiento` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_parentesco` int(11) NOT NULL,
  `id_estado_civil` int(11) NOT NULL,
  `tx_empresa` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_cargo` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_ocupacion` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_telefono` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_telefono2` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_telefono3` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of pariente
-- ----------------------------
INSERT INTO `pariente` VALUES ('1', 'Yustiz', 'Yustiz', 'Hector', 'Ramon', '0', '4195948', 'M', '1950-02-16', 'Venezolano', null, '1', '0', 'sin empresa', 'sin cargo', 'chofer', '5352354', '5345234', '5345325', '0', null, '1', '1', '2020-05-25 19:40:07', '2020-07-25 23:47:49');
INSERT INTO `pariente` VALUES ('2', 'Azuaje', 'Azuaje', 'Sonia', 'Coromoto', '0', '242324', 'F', '1952-02-06', 'Colombiana', null, '2', '0', 'n/a', 'n/a', 'Ama de Casa', '5345353', '534534535', '3453453', '0', null, '1', '1', '2020-07-24 23:46:42', '2020-07-25 19:49:37');
INSERT INTO `pariente` VALUES ('6', 'Perez', 'Perez', 'Jose', 'Daniel', '0', '44242423', 'M', '1987-02-18', 'ven', null, '1', '0', 'erewrw', 'dsdvsdv', 'vsdvsd', '3424', '242342', '42342', '0', null, '1', '1', '2020-07-25 20:05:25', '2020-07-27 15:47:16');
INSERT INTO `pariente` VALUES ('7', 'rodriguez', 'jose', 'jose', 'luis', '1', '55345353', 'M', '2013-05-08', 'gdfgd', 'gdfgdfg', '1', '1', 'gdgd', 'dgdgd', 'gdfggdgf', '54345', '345345', null, 'lfsfsdf@gmail.com', '345', '1', '1', '2020-09-03 01:13:27', '2020-09-03 01:16:44');

-- ----------------------------
-- Table structure for perfil
-- ----------------------------
DROP TABLE IF EXISTS `perfil`;
CREATE TABLE `perfil` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_perfil` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tx_icono` varchar(35) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of perfil
-- ----------------------------
INSERT INTO `perfil` VALUES ('1', 'secretaria', 'mdi-chair-rolling', null, '1', '1', '2020-06-06 19:02:17', '2020-06-06 19:02:17');
INSERT INTO `perfil` VALUES ('2', 'docente', 'mdi-account-tie', null, '1', '1', '2020-06-06 19:02:39', '2020-06-06 19:02:39');
INSERT INTO `perfil` VALUES ('3', 'alumno', 'mdi-school', null, '1', '1', '2020-06-06 19:02:50', '2020-06-06 19:03:36');
INSERT INTO `perfil` VALUES ('4', 'acudiente', 'mdi-human-male-child', null, '1', '1', '2020-06-06 19:03:04', '2020-06-06 19:03:41');
INSERT INTO `perfil` VALUES ('5', 'empleado', 'mdi-badge-account', null, '1', '1', null, null);
INSERT INTO `perfil` VALUES ('6', 'administrador global', null, null, '2', '1', '2020-09-02 15:27:23', '2020-09-02 15:27:23');
INSERT INTO `perfil` VALUES ('7', 'administrador colegio', null, null, '2', '1', '2020-09-02 15:28:15', '2020-09-02 15:28:15');

-- ----------------------------
-- Table structure for periodo
-- ----------------------------
DROP TABLE IF EXISTS `periodo`;
CREATE TABLE `periodo` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_periodo` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `nu_periodo` int(11) NOT NULL,
  `id_calendario` int(11) NOT NULL,
  `fe_inicio` date NOT NULL,
  `fe_fin` date NOT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of periodo
-- ----------------------------
INSERT INTO `periodo` VALUES ('1', '1er PERÍODO', '1', '1', '2019-08-26', '2019-11-19', null, '1', '1', '2020-05-12 03:27:45', '2020-09-05 22:30:13');
INSERT INTO `periodo` VALUES ('2', '2do PERÍODO', '2', '1', '2019-11-25', '2020-03-06', null, '2', '1', '2020-05-12 03:28:52', '2020-09-05 22:03:38');
INSERT INTO `periodo` VALUES ('3', '3er PERÍODO', '3', '1', '2020-03-09', '2020-06-12', null, '2', '1', '2020-05-12 03:29:58', '2020-09-05 22:30:13');

-- ----------------------------
-- Table structure for permiso
-- ----------------------------
DROP TABLE IF EXISTS `permiso`;
CREATE TABLE `permiso` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_menu` int(11) NOT NULL,
  `id_perfil` int(11) NOT NULL,
  `bo_select` tinyint(1) NOT NULL,
  `bo_insert` tinyint(1) NOT NULL,
  `bo_update` tinyint(1) NOT NULL,
  `bo_delete` tinyint(1) NOT NULL,
  `bo_admin` tinyint(1) NOT NULL,
  `bo_default` tinyint(1) NOT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of permiso
-- ----------------------------
INSERT INTO `permiso` VALUES ('1', '2', '1', '1', '0', '1', '0', '1', '0', null, '1', '1', '2020-08-31 23:16:26', '2020-08-31 23:16:26');
INSERT INTO `permiso` VALUES ('2', '6', '1', '1', '0', '1', '0', '1', '0', null, '1', '1', '2020-08-31 23:18:14', '2020-08-31 23:18:14');

-- ----------------------------
-- Table structure for plan_detalle
-- ----------------------------
DROP TABLE IF EXISTS `plan_detalle`;
CREATE TABLE `plan_detalle` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_plan_evaluacion` int(11) NOT NULL,
  `id_tipo_evaluacion` int(11) NOT NULL,
  `nu_peso` int(11) DEFAULT NULL,
  `fe_evaluacion` date DEFAULT NULL,
  `tx_tema` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of plan_detalle
-- ----------------------------
INSERT INTO `plan_detalle` VALUES ('10', '2', '1', '10', '2020-05-27', 'Historia de Colombia', null, '1', '1', '2020-05-28 01:14:26', '2020-05-28 01:18:20');
INSERT INTO `plan_detalle` VALUES ('11', '2', '1', '10', '2020-05-19', 'Historia del Arte', null, '1', '1', '2020-05-28 01:15:17', '2020-05-28 01:18:25');
INSERT INTO `plan_detalle` VALUES ('12', '2', '8', '25', '2020-05-28', 'Historia Universal', null, '1', '1', '2020-05-28 01:15:45', '2020-05-28 01:23:55');
INSERT INTO `plan_detalle` VALUES ('13', '2', '5', '20', '2020-05-05', 'N/A', null, '1', '1', '2020-05-28 01:16:31', '2020-05-28 14:37:34');
INSERT INTO `plan_detalle` VALUES ('14', '2', '4', '30', '2020-05-13', 'Historia Contemporanea', null, '1', '1', '2020-05-28 01:17:40', '2020-05-28 15:13:16');
INSERT INTO `plan_detalle` VALUES ('16', '2', '6', '5', '2020-05-28', 'N/A', null, '1', '1', '2020-05-28 01:28:06', '2020-05-28 14:37:41');
INSERT INTO `plan_detalle` VALUES ('21', '6', '1', '30', '2020-06-29', 'Epoca Colonial', null, '1', '1', '2020-06-29 18:00:07', '2020-06-29 18:00:07');
INSERT INTO `plan_detalle` VALUES ('22', '6', '4', '30', '2020-06-30', 'La Gran Colombia', null, '1', '1', '2020-06-29 18:00:43', '2020-06-29 18:00:43');

-- ----------------------------
-- Table structure for plan_evaluacion
-- ----------------------------
DROP TABLE IF EXISTS `plan_evaluacion`;
CREATE TABLE `plan_evaluacion` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_grupo` int(11) NOT NULL,
  `id_periodo` int(11) NOT NULL,
  `id_materia` int(11) NOT NULL,
  `id_docente` int(11) DEFAULT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of plan_evaluacion
-- ----------------------------
INSERT INTO `plan_evaluacion` VALUES ('2', '1', '1', '7', '1', null, '1', '1', '2020-05-26 21:32:02', '2020-09-06 16:43:09');
INSERT INTO `plan_evaluacion` VALUES ('6', '2', '1', '19', '1', 'rwrrrwrw', '1', '1', '2020-06-29 17:59:15', '2020-06-29 17:59:15');
INSERT INTO `plan_evaluacion` VALUES ('7', '1', '1', '19', '10', null, '1', '1', '2020-07-10 23:02:54', '2020-07-10 23:02:54');
INSERT INTO `plan_evaluacion` VALUES ('8', '1', '1', '17', '13', null, '1', '1', '2020-07-10 23:07:27', '2020-07-10 23:07:27');
INSERT INTO `plan_evaluacion` VALUES ('52', '6', '1', '14', '14', null, '2', '1', '2020-07-13 20:09:21', '2020-07-13 20:09:21');
INSERT INTO `plan_evaluacion` VALUES ('53', '6', '2', '14', '14', null, '2', '1', '2020-07-13 20:15:34', '2020-07-13 20:15:34');
INSERT INTO `plan_evaluacion` VALUES ('54', '1', '2', '7', '1', null, '2', '1', '2020-07-13 20:16:40', '2020-07-13 20:16:40');
INSERT INTO `plan_evaluacion` VALUES ('55', '2', '1', '7', '12', null, '2', '1', '2020-07-13 20:17:57', '2020-07-13 20:17:57');
INSERT INTO `plan_evaluacion` VALUES ('56', '1', '2', '19', '1', null, '2', '1', '2020-07-13 20:19:37', '2020-07-13 20:19:48');
INSERT INTO `plan_evaluacion` VALUES ('59', '2', '1', '17', '1', null, '2', '1', '2020-07-14 02:42:05', '2020-07-14 02:42:05');
INSERT INTO `plan_evaluacion` VALUES ('60', '2', '1', '14', '1', null, '2', '1', '2020-07-14 02:42:13', '2020-07-14 02:42:13');
INSERT INTO `plan_evaluacion` VALUES ('61', '1', '1', '15', '11', null, '1', '1', '2020-07-16 00:45:43', '2020-07-16 00:45:43');
INSERT INTO `plan_evaluacion` VALUES ('62', '1', '1', '14', '1', null, '1', '1', '2020-07-30 13:09:11', '2020-07-30 13:09:11');
INSERT INTO `plan_evaluacion` VALUES ('63', '1', '1', '16', '11', null, '2', '1', '2020-09-08 00:56:35', '2020-09-08 00:56:35');

-- ----------------------------
-- Table structure for pregunta
-- ----------------------------
DROP TABLE IF EXISTS `pregunta`;
CREATE TABLE `pregunta` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_pregunta` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_prueba` int(11) NOT NULL,
  `id_tipo_pregunta` int(11) NOT NULL,
  `bo_opcional` tinyint(1) NOT NULL,
  `nu_valor` decimal(8,2) NOT NULL,
  `nu_orden` int(11) NOT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of pregunta
-- ----------------------------
INSERT INTO `pregunta` VALUES ('1', 'Cuanto es 1+1?', '1', '2', '0', '3.00', '1', 'Acuerdate de la clase 1', '1', '1', '2020-08-03 17:57:02', '2020-08-12 14:15:59');
INSERT INTO `pregunta` VALUES ('2', 'Cuanto es 2+2', '1', '3', '0', '3.00', '3', null, '1', '1', '2020-08-03 19:07:36', '2020-08-04 19:29:39');
INSERT INTO `pregunta` VALUES ('3', 'Que significa el Factor cero (0)?', '1', '1', '0', '4.00', '4', null, '1', '1', '2020-08-03 19:09:42', '2020-08-08 22:18:39');
INSERT INTO `pregunta` VALUES ('5', 'Elementos de la Suma', '1', '3', '0', '4.00', '5', null, '1', '1', '2020-08-04 00:42:24', '2020-08-08 22:18:40');
INSERT INTO `pregunta` VALUES ('6', 'Describa el elemento neutro', '1', '1', '0', '4.00', '2', 'Clase 1 sumas y restas', '1', '1', '2020-08-04 02:48:59', '2020-08-04 19:29:39');
INSERT INTO `pregunta` VALUES ('8', 'Indique suma 6+2', '1', '2', '0', '2.00', '6', 'gere', '1', '1', '2020-08-04 18:29:13', '2020-08-08 22:18:50');
INSERT INTO `pregunta` VALUES ('49', 'Cuanto es 1+1?', '2', '2', '0', '3.00', '1', null, '1', '1', '2020-08-05 17:52:50', '2020-08-05 17:52:50');
INSERT INTO `pregunta` VALUES ('50', 'Cuanto es 2+2', '2', '3', '0', '3.00', '3', null, '1', '1', '2020-08-05 17:52:50', '2020-08-05 17:52:50');
INSERT INTO `pregunta` VALUES ('51', 'Elementos de la Suma', '2', '3', '0', '4.00', '5', null, '1', '1', '2020-08-05 17:52:51', '2020-08-05 17:52:51');
INSERT INTO `pregunta` VALUES ('52', 'Indique suma 6+2', '2', '2', '0', '2.00', '6', 'gere', '1', '1', '2020-08-05 17:52:51', '2020-08-05 17:52:51');
INSERT INTO `pregunta` VALUES ('53', 'Cuanto es 1+1?', '3', '2', '0', '3.00', '1', null, '1', '1', '2020-08-08 22:15:51', '2020-08-08 22:15:51');
INSERT INTO `pregunta` VALUES ('54', 'Describa el elemento neutro', '3', '1', '0', '4.00', '2', 'Clase 1 sumas y restas', '1', '1', '2020-08-08 22:15:51', '2020-08-08 22:15:51');
INSERT INTO `pregunta` VALUES ('55', 'Cuanto es 2+2', '3', '3', '0', '3.00', '3', null, '1', '1', '2020-08-08 22:15:51', '2020-08-08 22:15:51');
INSERT INTO `pregunta` VALUES ('56', 'Que significa el Factor cero (0)?', '3', '1', '0', '4.00', '4', null, '1', '1', '2020-08-08 22:15:52', '2020-08-08 22:15:52');
INSERT INTO `pregunta` VALUES ('57', 'Elementos de la Suma', '3', '3', '0', '4.00', '5', null, '1', '1', '2020-08-08 22:15:52', '2020-08-08 22:15:52');
INSERT INTO `pregunta` VALUES ('58', 'Indique suma 6+2', '3', '2', '0', '2.00', '6', 'gere', '1', '1', '2020-08-08 22:15:52', '2020-08-08 22:15:52');
INSERT INTO `pregunta` VALUES ('59', 'Cuanto es 1+1?', '4', '2', '0', '3.00', '1', null, '1', '1', '2020-08-08 22:16:05', '2020-08-08 22:16:05');
INSERT INTO `pregunta` VALUES ('60', 'Describa el elemento neutro', '4', '1', '0', '4.00', '4', 'Clase 1 sumas y restas', '1', '1', '2020-08-08 22:16:05', '2020-08-14 03:55:53');
INSERT INTO `pregunta` VALUES ('61', 'Cuanto es 2+2', '4', '3', '0', '3.00', '6', null, '1', '1', '2020-08-08 22:16:06', '2020-08-14 03:55:53');
INSERT INTO `pregunta` VALUES ('62', 'Que significa el Factor cero (0)?', '4', '1', '0', '4.00', '7', null, '1', '1', '2020-08-08 22:16:06', '2020-08-14 03:55:53');
INSERT INTO `pregunta` VALUES ('63', 'Elementos de la Suma', '4', '3', '0', '4.00', '8', null, '1', '1', '2020-08-08 22:16:06', '2020-08-14 03:55:53');
INSERT INTO `pregunta` VALUES ('64', 'Indique suma 6+2', '4', '2', '0', '2.00', '10', 'gere', '1', '1', '2020-08-08 22:16:07', '2020-08-14 03:55:53');
INSERT INTO `pregunta` VALUES ('69', 'Cuanto es 1+1?', '4', '2', '0', '3.00', '2', 'Acuerdate de la clase 1', '1', '1', '2020-08-14 03:55:35', '2020-08-14 03:55:53');
INSERT INTO `pregunta` VALUES ('70', 'Describa el elemento neutro', '4', '1', '0', '4.00', '3', 'Clase 1 sumas y restas', '1', '1', '2020-08-14 03:55:36', '2020-08-14 03:55:53');
INSERT INTO `pregunta` VALUES ('71', 'Cuanto es 2+2', '4', '3', '0', '3.00', '5', null, '1', '1', '2020-08-14 03:55:36', '2020-08-14 03:55:53');
INSERT INTO `pregunta` VALUES ('73', 'Elementos de la Suma', '4', '3', '0', '4.00', '9', null, '1', '1', '2020-08-14 03:55:37', '2020-08-14 03:55:53');
INSERT INTO `pregunta` VALUES ('74', 'Indique suma 6+2', '4', '2', '0', '2.00', '11', 'gere', '1', '1', '2020-08-14 03:55:37', '2020-08-14 03:55:53');
INSERT INTO `pregunta` VALUES ('75', 'Cuanto es 1+1?', '5', '2', '0', '3.00', '1', 'Acuerdate de la clase 1', '1', '1', '2020-08-15 02:57:48', '2020-08-15 02:57:48');
INSERT INTO `pregunta` VALUES ('76', 'Describa el elemento neutro', '5', '1', '0', '4.00', '2', 'Clase 1 sumas y restas', '1', '1', '2020-08-15 02:57:48', '2020-08-15 02:57:48');
INSERT INTO `pregunta` VALUES ('77', 'Cuanto es 2+2', '5', '3', '0', '3.00', '3', null, '1', '1', '2020-08-15 02:57:48', '2020-08-15 02:57:48');
INSERT INTO `pregunta` VALUES ('78', 'Que significa el Factor cero (0)?', '5', '1', '0', '4.00', '4', null, '1', '1', '2020-08-15 02:57:49', '2020-08-15 02:57:49');
INSERT INTO `pregunta` VALUES ('79', 'Elementos de la Suma', '5', '3', '0', '4.00', '5', null, '1', '1', '2020-08-15 02:57:49', '2020-08-15 02:57:49');
INSERT INTO `pregunta` VALUES ('80', 'Indique suma 6+2', '5', '2', '0', '2.00', '6', 'gere', '1', '1', '2020-08-15 02:57:49', '2020-08-15 02:57:49');
INSERT INTO `pregunta` VALUES ('81', 'Cuanto es 1+1?', '6', '2', '0', '3.00', '1', 'Acuerdate de la clase 1', '1', '1', '2020-08-18 21:55:44', '2020-08-18 21:55:44');
INSERT INTO `pregunta` VALUES ('82', 'Describa el elemento neutro', '6', '1', '0', '4.00', '2', 'Clase 1 sumas y restas', '1', '1', '2020-08-18 21:55:45', '2020-08-18 21:55:45');
INSERT INTO `pregunta` VALUES ('83', 'Cuanto es 2+2', '6', '3', '0', '3.00', '3', null, '1', '1', '2020-08-18 21:55:45', '2020-08-18 21:55:45');
INSERT INTO `pregunta` VALUES ('84', 'Que significa el Factor cero (0)?', '6', '1', '0', '4.00', '4', null, '1', '1', '2020-08-18 21:55:45', '2020-08-18 21:55:45');
INSERT INTO `pregunta` VALUES ('85', 'Elementos de la Suma', '6', '3', '0', '4.00', '5', null, '1', '1', '2020-08-18 21:55:45', '2020-08-18 21:55:45');
INSERT INTO `pregunta` VALUES ('86', 'Indique suma 6+2', '6', '2', '0', '2.00', '6', 'gere', '1', '1', '2020-08-18 21:55:46', '2020-08-18 21:55:46');
INSERT INTO `pregunta` VALUES ('87', 'comio o no', '6', '3', '0', '5.00', '7', null, '1', '1', '2020-08-18 21:56:35', '2020-08-18 21:56:35');
INSERT INTO `pregunta` VALUES ('88', 'cuanto es 1 +1', '7', '2', '0', '5.00', '1', 'clase de sumas y restas', '1', '1', '2020-08-19 18:49:27', '2020-08-19 18:49:27');
INSERT INTO `pregunta` VALUES ('89', 'diga cual es el elemento neotri', '7', '1', '0', '5.00', '2', null, '1', '1', '2020-08-19 18:50:48', '2020-08-19 18:51:07');
INSERT INTO `pregunta` VALUES ('90', 'elemntos de la suma', '7', '3', '0', '4.00', '3', null, '1', '1', '2020-08-19 18:51:33', '2020-08-19 18:51:33');
INSERT INTO `pregunta` VALUES ('91', 'Indique suma 6+2', '7', '2', '0', '2.00', '6', 'gere', '1', '1', '2020-08-19 18:53:10', '2020-08-19 18:53:10');
INSERT INTO `pregunta` VALUES ('92', 'Cuanto es 1+1?', '8', '2', '0', '3.00', '1', 'Acuerdate de la clase 1', '1', '1', '2020-09-09 12:23:00', '2020-09-09 12:23:00');
INSERT INTO `pregunta` VALUES ('93', 'Describa el elemento neutro', '8', '1', '0', '4.00', '2', 'Clase 1 sumas y restas', '1', '1', '2020-09-09 12:23:00', '2020-09-09 12:23:00');
INSERT INTO `pregunta` VALUES ('94', 'Cuanto es 2+2', '8', '3', '0', '3.00', '3', null, '1', '1', '2020-09-09 12:23:00', '2020-09-09 12:23:00');
INSERT INTO `pregunta` VALUES ('95', 'Que significa el Factor cero (0)?', '8', '1', '0', '4.00', '4', null, '1', '1', '2020-09-09 12:23:01', '2020-09-09 12:23:01');
INSERT INTO `pregunta` VALUES ('96', 'Elementos de la Suma', '8', '3', '0', '4.00', '5', null, '1', '1', '2020-09-09 12:23:01', '2020-09-09 12:23:01');
INSERT INTO `pregunta` VALUES ('97', 'Indique suma 6+2', '8', '2', '0', '2.00', '6', 'gere', '1', '1', '2020-09-09 12:23:01', '2020-09-09 12:23:01');

-- ----------------------------
-- Table structure for prueba
-- ----------------------------
DROP TABLE IF EXISTS `prueba`;
CREATE TABLE `prueba` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_prueba` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_grado` int(11) NOT NULL,
  `id_grupo` int(11) DEFAULT NULL,
  `id_materia` int(11) NOT NULL,
  `id_docente` int(11) NOT NULL,
  `id_evaluacion` int(11) DEFAULT NULL,
  `bo_ver_resultado` tinyint(1) NOT NULL,
  `nu_minutos` int(11) DEFAULT NULL,
  `fe_prueba` date DEFAULT NULL,
  `hh_inicio` time DEFAULT NULL,
  `hh_fin` time DEFAULT NULL,
  `nu_valor_total` decimal(11,2) DEFAULT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of prueba
-- ----------------------------
INSERT INTO `prueba` VALUES ('1', 'Prueba de Matematicas 1 Grado Seccion 1', '4', '1', '14', '1', '1', '1', '5', '2020-08-07', '22:37:07', '22:42:07', '20.00', null, '8', '1', '2020-08-03 13:18:52', '2020-08-15 19:50:40');
INSERT INTO `prueba` VALUES ('2', 'prueba 2 grado 1', '4', '1', '14', '1', '1', '1', '5', null, null, null, null, null, '4', '1', '2020-08-05 14:00:05', '2020-08-08 19:22:24');
INSERT INTO `prueba` VALUES ('3', 'Prueba 3', '4', '1', '14', '1', '1', '0', null, null, null, null, null, null, '4', '1', '2020-08-06 00:23:18', '2020-08-14 03:56:58');
INSERT INTO `prueba` VALUES ('4', 'prueba 4', '4', '1', '14', '1', '28', '0', null, null, null, null, null, null, '4', '1', '2020-08-06 01:00:45', '2020-09-11 19:19:03');
INSERT INTO `prueba` VALUES ('5', 'Recuperacion', '4', '1', '14', '1', '1', '0', '15', '2020-08-15', '20:54:23', '21:09:23', '20.00', null, '8', '1', '2020-08-15 02:57:25', '2020-08-15 21:06:38');
INSERT INTO `prueba` VALUES ('6', 'prueb ajean', '4', '1', '14', '1', '24', '0', '5', '2020-08-18', '21:59:58', '22:04:58', '25.00', null, '8', '1', '2020-08-18 21:55:29', '2020-08-18 22:06:26');
INSERT INTO `prueba` VALUES ('7', 'Prueba Matematica 1', '4', '1', '14', '1', '24', '0', '10', '2020-08-19', '18:59:59', '19:09:59', '16.00', null, '8', '1', '2020-08-19 18:47:57', '2020-09-12 14:19:21');
INSERT INTO `prueba` VALUES ('8', 'asignacion', '4', '1', '14', '1', '28', '0', '15', '2020-09-11', '19:25:08', '19:40:08', '20.00', null, '8', '1', '2020-09-09 12:19:19', '2020-09-11 19:36:33');

-- ----------------------------
-- Table structure for prueba_alumno
-- ----------------------------
DROP TABLE IF EXISTS `prueba_alumno`;
CREATE TABLE `prueba_alumno` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_prueba` int(11) NOT NULL,
  `id_alumno` int(11) NOT NULL,
  `fe_prueba` date DEFAULT NULL,
  `hh_inicio` time DEFAULT NULL,
  `hh_fin` time DEFAULT NULL,
  `nu_calificacion` decimal(11,2) DEFAULT NULL,
  `id_calificacion` int(11) DEFAULT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of prueba_alumno
-- ----------------------------
INSERT INTO `prueba_alumno` VALUES ('54', '1', '23', null, null, null, '0.00', null, null, '7', '1', '2020-08-07 00:14:49', '2020-08-15 19:50:30');
INSERT INTO `prueba_alumno` VALUES ('55', '1', '2', null, null, null, '0.00', null, null, '7', '1', '2020-08-07 00:14:50', '2020-08-15 19:50:26');
INSERT INTO `prueba_alumno` VALUES ('56', '1', '17', null, null, null, '0.00', null, null, '7', '1', '2020-08-07 00:14:50', '2020-08-15 19:50:22');
INSERT INTO `prueba_alumno` VALUES ('57', '1', '1', '2020-08-15', '16:18:00', '17:37:08', '12.66', null, null, '7', '1', '2020-08-07 00:14:50', '2020-08-15 18:32:06');
INSERT INTO `prueba_alumno` VALUES ('58', '1', '16', null, null, null, '0.00', null, null, '7', '1', '2020-08-07 00:14:50', '2020-08-15 19:50:16');
INSERT INTO `prueba_alumno` VALUES ('59', '1', '15', null, null, null, '0.00', null, null, '7', '1', '2020-08-07 00:57:42', '2020-08-15 19:47:44');
INSERT INTO `prueba_alumno` VALUES ('60', '2', '15', null, null, null, null, null, null, '1', '1', '2020-08-08 13:24:34', '2020-08-08 13:24:34');
INSERT INTO `prueba_alumno` VALUES ('61', '2', '23', null, null, null, null, null, null, '1', '1', '2020-08-08 13:24:34', '2020-08-08 13:24:34');
INSERT INTO `prueba_alumno` VALUES ('62', '2', '2', null, null, null, null, null, null, '1', '1', '2020-08-08 13:24:34', '2020-08-08 13:24:34');
INSERT INTO `prueba_alumno` VALUES ('63', '2', '17', null, null, null, null, null, null, '1', '1', '2020-08-08 13:24:34', '2020-08-08 13:24:34');
INSERT INTO `prueba_alumno` VALUES ('64', '2', '1', null, null, null, null, null, null, '1', '1', '2020-08-08 13:24:34', '2020-08-08 13:24:34');
INSERT INTO `prueba_alumno` VALUES ('65', '2', '16', null, null, null, null, null, null, '1', '1', '2020-08-08 13:24:34', '2020-08-08 13:24:34');
INSERT INTO `prueba_alumno` VALUES ('67', '3', '23', null, null, null, null, null, null, '1', '1', '2020-08-14 03:57:09', '2020-08-14 03:57:09');
INSERT INTO `prueba_alumno` VALUES ('68', '3', '2', null, null, null, null, null, null, '1', '1', '2020-08-14 03:57:09', '2020-08-14 03:57:09');
INSERT INTO `prueba_alumno` VALUES ('69', '3', '17', null, null, null, null, null, null, '1', '1', '2020-08-14 03:57:09', '2020-08-14 03:57:09');
INSERT INTO `prueba_alumno` VALUES ('70', '3', '1', null, null, null, null, null, null, '1', '1', '2020-08-14 03:57:09', '2020-08-14 03:57:09');
INSERT INTO `prueba_alumno` VALUES ('71', '3', '16', null, null, null, null, null, null, '1', '1', '2020-08-14 03:57:09', '2020-08-14 03:57:09');
INSERT INTO `prueba_alumno` VALUES ('72', '3', '15', null, null, null, null, null, null, '1', '1', '2020-08-14 03:57:23', '2020-08-14 03:57:23');
INSERT INTO `prueba_alumno` VALUES ('73', '5', '15', null, null, null, '0.00', null, null, '7', '1', '2020-08-15 20:53:35', '2020-08-15 21:06:25');
INSERT INTO `prueba_alumno` VALUES ('74', '5', '23', null, null, null, '0.00', null, null, '7', '1', '2020-08-15 20:53:39', '2020-08-15 21:04:24');
INSERT INTO `prueba_alumno` VALUES ('75', '5', '2', null, null, null, '0.00', null, null, '7', '1', '2020-08-15 20:53:40', '2020-08-15 21:06:30');
INSERT INTO `prueba_alumno` VALUES ('76', '5', '17', null, null, null, '0.00', null, null, '7', '1', '2020-08-15 20:53:42', '2020-08-15 21:06:12');
INSERT INTO `prueba_alumno` VALUES ('77', '5', '1', '2020-08-15', '20:56:44', '21:02:43', '12.99', null, null, '7', '1', '2020-08-15 20:53:43', '2020-08-15 21:04:18');
INSERT INTO `prueba_alumno` VALUES ('78', '5', '16', null, null, null, '0.00', null, null, '7', '1', '2020-08-15 20:53:44', '2020-08-15 21:06:21');
INSERT INTO `prueba_alumno` VALUES ('79', '6', '1', '2020-08-18', '22:00:27', '22:02:49', '9.49', null, null, '7', '1', '2020-08-18 21:58:06', '2020-08-18 22:05:30');
INSERT INTO `prueba_alumno` VALUES ('80', '7', '15', null, null, null, '0.00', '1', null, '7', '1', '2020-08-19 18:57:04', '2020-09-12 14:18:39');
INSERT INTO `prueba_alumno` VALUES ('81', '7', '23', null, null, null, '0.00', '1', null, '7', '1', '2020-08-19 18:57:04', '2020-09-12 14:18:53');
INSERT INTO `prueba_alumno` VALUES ('82', '7', '2', null, null, null, '0.00', '1', null, '7', '1', '2020-08-19 18:57:04', '2020-09-12 14:18:59');
INSERT INTO `prueba_alumno` VALUES ('83', '7', '17', null, null, null, '0.00', '1', null, '7', '1', '2020-08-19 18:57:04', '2020-09-12 14:19:04');
INSERT INTO `prueba_alumno` VALUES ('84', '7', '1', '2020-08-19', '19:00:32', '19:02:15', '16.00', '16', null, '7', '1', '2020-08-19 18:57:04', '2020-09-12 14:19:12');
INSERT INTO `prueba_alumno` VALUES ('85', '7', '16', null, null, null, '0.00', '1', null, '7', '1', '2020-08-19 18:57:04', '2020-09-12 14:18:48');
INSERT INTO `prueba_alumno` VALUES ('98', '8', '1', '2020-09-11', '19:25:40', '19:26:59', '18.66', '19', null, '7', '1', null, '2020-09-11 19:27:55');
INSERT INTO `prueba_alumno` VALUES ('99', '8', '17', null, null, null, '0.00', '1', null, '7', '1', null, '2020-09-11 19:28:23');
INSERT INTO `prueba_alumno` VALUES ('106', '4', '2', null, null, null, null, null, null, '1', '1', null, null);
INSERT INTO `prueba_alumno` VALUES ('107', '4', '15', null, null, null, null, null, null, '1', '1', null, null);
INSERT INTO `prueba_alumno` VALUES ('108', '4', '16', null, null, null, null, null, null, '1', '1', null, null);
INSERT INTO `prueba_alumno` VALUES ('109', '4', '23', null, null, null, null, null, null, '1', '1', null, null);

-- ----------------------------
-- Table structure for recurso
-- ----------------------------
DROP TABLE IF EXISTS `recurso`;
CREATE TABLE `recurso` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_tipo_recurso` int(11) NOT NULL,
  `id_grado` int(11) NOT NULL,
  `id_grupo` int(11) NOT NULL,
  `tx_observaciones` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of recurso
-- ----------------------------
INSERT INTO `recurso` VALUES ('1', '1', '4', '1', null, '1', '1', '2020-07-01 22:10:53', '2020-07-01 22:10:53');
INSERT INTO `recurso` VALUES ('2', '2', '4', '1', null, '1', '1', '2020-07-01 22:56:41', '2020-07-01 22:56:41');
INSERT INTO `recurso` VALUES ('3', '3', '4', '1', null, '1', '1', '2020-07-01 22:56:56', '2020-07-01 22:56:56');

-- ----------------------------
-- Table structure for respuesta
-- ----------------------------
DROP TABLE IF EXISTS `respuesta`;
CREATE TABLE `respuesta` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_respuesta` varchar(600) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_pregunta` int(11) NOT NULL,
  `bo_correcta` tinyint(1) NOT NULL,
  `nu_valor` decimal(8,2) DEFAULT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=181 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of respuesta
-- ----------------------------
INSERT INTO `respuesta` VALUES ('1', 'Es 2', '2', '1', null, null, '1', '1', '2020-08-04 17:51:49', '2020-08-04 17:58:53');
INSERT INTO `respuesta` VALUES ('2', 'es 3', '2', '0', null, null, '1', '1', '2020-08-04 17:52:16', '2020-08-04 17:52:16');
INSERT INTO `respuesta` VALUES ('3', 'es 4', '2', '1', null, null, '1', '1', '2020-08-04 17:52:24', '2020-08-04 20:01:33');
INSERT INTO `respuesta` VALUES ('4', 'Ninguna de las Anteriores', '2', '0', null, null, '1', '1', '2020-08-04 17:52:38', '2020-08-04 17:52:38');
INSERT INTO `respuesta` VALUES ('5', 'respuesta 2', '1', '0', null, null, '1', '1', '2020-08-04 19:51:02', '2020-08-14 03:53:54');
INSERT INTO `respuesta` VALUES ('6', 'respuesta 3', '1', '0', null, null, '1', '1', '2020-08-04 19:51:10', '2020-08-14 03:53:54');
INSERT INTO `respuesta` VALUES ('7', 'respuesta 4', '1', '1', null, null, '1', '1', '2020-08-04 19:51:16', '2020-08-14 03:53:54');
INSERT INTO `respuesta` VALUES ('8', 'Respuesta 5', '1', '0', null, null, '1', '1', '2020-08-04 21:39:59', '2020-08-14 03:53:54');
INSERT INTO `respuesta` VALUES ('12', 'Sumandos', '5', '1', null, null, '1', '1', '2020-08-04 22:22:05', '2020-08-04 22:22:05');
INSERT INTO `respuesta` VALUES ('13', 'Signo', '5', '1', null, null, '1', '1', '2020-08-04 22:22:15', '2020-08-04 22:22:15');
INSERT INTO `respuesta` VALUES ('14', 'Total', '5', '1', null, null, '1', '1', '2020-08-04 22:22:26', '2020-08-04 22:22:26');
INSERT INTO `respuesta` VALUES ('15', 'Sustraendo', '5', '0', null, null, '1', '1', '2020-08-04 22:22:41', '2020-08-04 22:22:41');
INSERT INTO `respuesta` VALUES ('16', 'respuesta 9', '8', '0', null, null, '1', '1', '2020-08-04 22:23:23', '2020-08-04 22:23:41');
INSERT INTO `respuesta` VALUES ('17', 'respuesta 8', '8', '1', null, null, '1', '1', '2020-08-04 22:23:42', '2020-08-04 22:23:42');
INSERT INTO `respuesta` VALUES ('18', 'Respuesta 7', '8', '0', null, null, '1', '1', '2020-08-04 22:24:00', '2020-08-04 22:24:00');
INSERT INTO `respuesta` VALUES ('49', 'respuesta 2', '49', '0', null, null, '1', '1', '2020-08-05 17:52:50', '2020-08-05 17:52:50');
INSERT INTO `respuesta` VALUES ('50', 'respuesta 3', '49', '0', null, null, '1', '1', '2020-08-05 17:52:50', '2020-08-05 17:52:50');
INSERT INTO `respuesta` VALUES ('51', 'respuesta 4', '49', '0', null, null, '1', '1', '2020-08-05 17:52:50', '2020-08-05 17:52:50');
INSERT INTO `respuesta` VALUES ('52', 'Respuesta 5', '49', '1', null, null, '1', '1', '2020-08-05 17:52:50', '2020-08-05 17:52:50');
INSERT INTO `respuesta` VALUES ('53', 'Es 2', '50', '1', null, null, '1', '1', '2020-08-05 17:52:50', '2020-08-05 17:52:50');
INSERT INTO `respuesta` VALUES ('54', 'es 3', '50', '0', null, null, '1', '1', '2020-08-05 17:52:51', '2020-08-05 17:52:51');
INSERT INTO `respuesta` VALUES ('55', 'es 4', '50', '1', null, null, '1', '1', '2020-08-05 17:52:51', '2020-08-05 17:52:51');
INSERT INTO `respuesta` VALUES ('56', 'Ninguna de las Anteriores', '50', '0', null, null, '1', '1', '2020-08-05 17:52:51', '2020-08-05 17:52:51');
INSERT INTO `respuesta` VALUES ('57', 'Sumandos', '51', '1', null, null, '1', '1', '2020-08-05 17:52:51', '2020-08-05 17:52:51');
INSERT INTO `respuesta` VALUES ('58', 'Signo', '51', '1', null, null, '1', '1', '2020-08-05 17:52:51', '2020-08-05 17:52:51');
INSERT INTO `respuesta` VALUES ('59', 'Total', '51', '1', null, null, '1', '1', '2020-08-05 17:52:51', '2020-08-05 17:52:51');
INSERT INTO `respuesta` VALUES ('60', 'Sustraendo', '51', '0', null, null, '1', '1', '2020-08-05 17:52:51', '2020-08-05 17:52:51');
INSERT INTO `respuesta` VALUES ('61', 'respuesta 9', '52', '0', null, null, '1', '1', '2020-08-05 17:52:51', '2020-08-05 17:52:51');
INSERT INTO `respuesta` VALUES ('62', 'respuesta 8', '52', '1', null, null, '1', '1', '2020-08-05 17:52:51', '2020-08-05 17:52:51');
INSERT INTO `respuesta` VALUES ('63', 'Respuesta 7', '52', '0', null, null, '1', '1', '2020-08-05 17:52:51', '2020-08-05 17:52:51');
INSERT INTO `respuesta` VALUES ('64', 'respuesta 2', '53', '0', null, null, '1', '1', '2020-08-08 22:15:51', '2020-08-08 22:15:51');
INSERT INTO `respuesta` VALUES ('65', 'respuesta 3', '53', '0', null, null, '1', '1', '2020-08-08 22:15:51', '2020-08-08 22:15:51');
INSERT INTO `respuesta` VALUES ('66', 'respuesta 4', '53', '0', null, null, '1', '1', '2020-08-08 22:15:51', '2020-08-08 22:15:51');
INSERT INTO `respuesta` VALUES ('67', 'Respuesta 5', '53', '1', null, null, '1', '1', '2020-08-08 22:15:51', '2020-08-08 22:15:51');
INSERT INTO `respuesta` VALUES ('68', 'Es 2', '55', '1', null, null, '1', '1', '2020-08-08 22:15:51', '2020-08-08 22:15:51');
INSERT INTO `respuesta` VALUES ('69', 'es 3', '55', '0', null, null, '1', '1', '2020-08-08 22:15:51', '2020-08-08 22:15:51');
INSERT INTO `respuesta` VALUES ('70', 'es 4', '55', '1', null, null, '1', '1', '2020-08-08 22:15:52', '2020-08-08 22:15:52');
INSERT INTO `respuesta` VALUES ('71', 'Ninguna de las Anteriores', '55', '0', null, null, '1', '1', '2020-08-08 22:15:52', '2020-08-08 22:15:52');
INSERT INTO `respuesta` VALUES ('72', 'Sumandos', '57', '1', null, null, '1', '1', '2020-08-08 22:15:52', '2020-08-08 22:15:52');
INSERT INTO `respuesta` VALUES ('73', 'Signo', '57', '1', null, null, '1', '1', '2020-08-08 22:15:52', '2020-08-08 22:15:52');
INSERT INTO `respuesta` VALUES ('74', 'Total', '57', '1', null, null, '1', '1', '2020-08-08 22:15:52', '2020-08-08 22:15:52');
INSERT INTO `respuesta` VALUES ('75', 'Sustraendo', '57', '0', null, null, '1', '1', '2020-08-08 22:15:52', '2020-08-08 22:15:52');
INSERT INTO `respuesta` VALUES ('76', 'respuesta 9', '58', '0', null, null, '1', '1', '2020-08-08 22:15:53', '2020-08-08 22:15:53');
INSERT INTO `respuesta` VALUES ('77', 'respuesta 8', '58', '1', null, null, '1', '1', '2020-08-08 22:15:53', '2020-08-08 22:15:53');
INSERT INTO `respuesta` VALUES ('78', 'Respuesta 7', '58', '0', null, null, '1', '1', '2020-08-08 22:15:53', '2020-08-08 22:15:53');
INSERT INTO `respuesta` VALUES ('79', 'respuesta 2', '59', '0', null, null, '1', '1', '2020-08-08 22:16:05', '2020-08-08 22:16:05');
INSERT INTO `respuesta` VALUES ('80', 'respuesta 3', '59', '0', null, null, '1', '1', '2020-08-08 22:16:05', '2020-08-08 22:16:05');
INSERT INTO `respuesta` VALUES ('81', 'respuesta 4', '59', '0', null, null, '1', '1', '2020-08-08 22:16:05', '2020-08-08 22:16:05');
INSERT INTO `respuesta` VALUES ('82', 'Respuesta 5', '59', '1', null, null, '1', '1', '2020-08-08 22:16:05', '2020-08-08 22:16:05');
INSERT INTO `respuesta` VALUES ('83', 'Es 2', '61', '1', null, null, '1', '1', '2020-08-08 22:16:06', '2020-08-08 22:16:06');
INSERT INTO `respuesta` VALUES ('84', 'es 3', '61', '0', null, null, '1', '1', '2020-08-08 22:16:06', '2020-08-08 22:16:06');
INSERT INTO `respuesta` VALUES ('85', 'es 4', '61', '1', null, null, '1', '1', '2020-08-08 22:16:06', '2020-08-08 22:16:06');
INSERT INTO `respuesta` VALUES ('86', 'Ninguna de las Anteriores', '61', '0', null, null, '1', '1', '2020-08-08 22:16:06', '2020-08-08 22:16:06');
INSERT INTO `respuesta` VALUES ('87', 'Sumandos', '63', '1', null, null, '1', '1', '2020-08-08 22:16:07', '2020-08-08 22:16:07');
INSERT INTO `respuesta` VALUES ('88', 'Signo', '63', '1', null, null, '1', '1', '2020-08-08 22:16:07', '2020-08-08 22:16:07');
INSERT INTO `respuesta` VALUES ('89', 'Total', '63', '1', null, null, '1', '1', '2020-08-08 22:16:07', '2020-08-08 22:16:07');
INSERT INTO `respuesta` VALUES ('90', 'Sustraendo', '63', '0', null, null, '1', '1', '2020-08-08 22:16:07', '2020-08-08 22:16:07');
INSERT INTO `respuesta` VALUES ('91', 'respuesta 9', '64', '0', null, null, '1', '1', '2020-08-08 22:16:07', '2020-08-08 22:16:07');
INSERT INTO `respuesta` VALUES ('92', 'respuesta 8', '64', '1', null, null, '1', '1', '2020-08-08 22:16:07', '2020-08-08 22:16:07');
INSERT INTO `respuesta` VALUES ('93', 'Respuesta 7', '64', '0', null, null, '1', '1', '2020-08-08 22:16:07', '2020-08-08 22:16:07');
INSERT INTO `respuesta` VALUES ('94', 'respuesta 2', '65', '0', null, null, '1', '1', '2020-08-08 22:17:45', '2020-08-08 22:17:45');
INSERT INTO `respuesta` VALUES ('95', 'respuesta 3', '65', '0', null, null, '1', '1', '2020-08-08 22:17:46', '2020-08-08 22:17:46');
INSERT INTO `respuesta` VALUES ('96', 'respuesta 4', '65', '0', null, null, '1', '1', '2020-08-08 22:17:46', '2020-08-08 22:17:46');
INSERT INTO `respuesta` VALUES ('97', 'Respuesta 5', '65', '1', null, null, '1', '1', '2020-08-08 22:17:46', '2020-08-08 22:17:46');
INSERT INTO `respuesta` VALUES ('98', 'Es 2', '66', '1', null, null, '1', '1', '2020-08-08 22:17:46', '2020-08-08 22:17:46');
INSERT INTO `respuesta` VALUES ('99', 'es 3', '66', '0', null, null, '1', '1', '2020-08-08 22:17:46', '2020-08-08 22:17:46');
INSERT INTO `respuesta` VALUES ('100', 'es 4', '66', '1', null, null, '1', '1', '2020-08-08 22:17:46', '2020-08-08 22:17:46');
INSERT INTO `respuesta` VALUES ('101', 'Ninguna de las Anteriores', '66', '0', null, null, '1', '1', '2020-08-08 22:17:46', '2020-08-08 22:17:46');
INSERT INTO `respuesta` VALUES ('102', 'Sumandos', '67', '1', null, null, '1', '1', '2020-08-08 22:17:46', '2020-08-08 22:17:46');
INSERT INTO `respuesta` VALUES ('103', 'Signo', '67', '1', null, null, '1', '1', '2020-08-08 22:17:46', '2020-08-08 22:17:46');
INSERT INTO `respuesta` VALUES ('104', 'Total', '67', '1', null, null, '1', '1', '2020-08-08 22:17:47', '2020-08-08 22:17:47');
INSERT INTO `respuesta` VALUES ('105', 'Sustraendo', '67', '0', null, null, '1', '1', '2020-08-08 22:17:47', '2020-08-08 22:17:47');
INSERT INTO `respuesta` VALUES ('106', 'respuesta 9', '68', '0', null, null, '1', '1', '2020-08-08 22:17:47', '2020-08-08 22:17:47');
INSERT INTO `respuesta` VALUES ('107', 'respuesta 8', '68', '1', null, null, '1', '1', '2020-08-08 22:17:47', '2020-08-08 22:17:47');
INSERT INTO `respuesta` VALUES ('108', 'Respuesta 7', '68', '0', null, null, '1', '1', '2020-08-08 22:17:47', '2020-08-08 22:17:47');
INSERT INTO `respuesta` VALUES ('109', 'respuesta 2', '69', '0', null, null, '1', '1', '2020-08-14 03:55:35', '2020-08-14 03:55:35');
INSERT INTO `respuesta` VALUES ('110', 'respuesta 3', '69', '0', null, null, '1', '1', '2020-08-14 03:55:36', '2020-08-14 03:55:36');
INSERT INTO `respuesta` VALUES ('111', 'respuesta 4', '69', '1', null, null, '1', '1', '2020-08-14 03:55:36', '2020-08-14 03:55:36');
INSERT INTO `respuesta` VALUES ('112', 'Respuesta 5', '69', '0', null, null, '1', '1', '2020-08-14 03:55:36', '2020-08-14 03:55:36');
INSERT INTO `respuesta` VALUES ('113', 'Es 2', '71', '1', null, null, '1', '1', '2020-08-14 03:55:36', '2020-08-14 03:55:36');
INSERT INTO `respuesta` VALUES ('114', 'es 3', '71', '0', null, null, '1', '1', '2020-08-14 03:55:36', '2020-08-14 03:55:36');
INSERT INTO `respuesta` VALUES ('115', 'es 4', '71', '1', null, null, '1', '1', '2020-08-14 03:55:36', '2020-08-14 03:55:36');
INSERT INTO `respuesta` VALUES ('116', 'Ninguna de las Anteriores', '71', '0', null, null, '1', '1', '2020-08-14 03:55:37', '2020-08-14 03:55:37');
INSERT INTO `respuesta` VALUES ('117', 'Sumandos', '73', '1', null, null, '1', '1', '2020-08-14 03:55:37', '2020-08-14 03:55:37');
INSERT INTO `respuesta` VALUES ('118', 'Signo', '73', '1', null, null, '1', '1', '2020-08-14 03:55:37', '2020-08-14 03:55:37');
INSERT INTO `respuesta` VALUES ('119', 'Total', '73', '1', null, null, '1', '1', '2020-08-14 03:55:37', '2020-08-14 03:55:37');
INSERT INTO `respuesta` VALUES ('120', 'Sustraendo', '73', '0', null, null, '1', '1', '2020-08-14 03:55:37', '2020-08-14 03:55:37');
INSERT INTO `respuesta` VALUES ('121', 'respuesta 9', '74', '0', null, null, '1', '1', '2020-08-14 03:55:38', '2020-08-14 03:55:38');
INSERT INTO `respuesta` VALUES ('122', 'respuesta 8', '74', '1', null, null, '1', '1', '2020-08-14 03:55:38', '2020-08-14 03:55:38');
INSERT INTO `respuesta` VALUES ('123', 'Respuesta 7', '74', '0', null, null, '1', '1', '2020-08-14 03:55:38', '2020-08-14 03:55:38');
INSERT INTO `respuesta` VALUES ('124', 'respuesta 2', '75', '0', null, null, '1', '1', '2020-08-15 02:57:48', '2020-08-15 02:57:48');
INSERT INTO `respuesta` VALUES ('125', 'respuesta 3', '75', '0', null, null, '1', '1', '2020-08-15 02:57:48', '2020-08-15 02:57:48');
INSERT INTO `respuesta` VALUES ('126', 'respuesta 4', '75', '1', null, null, '1', '1', '2020-08-15 02:57:48', '2020-08-15 02:57:48');
INSERT INTO `respuesta` VALUES ('127', 'Respuesta 5', '75', '0', null, null, '1', '1', '2020-08-15 02:57:48', '2020-08-15 02:57:48');
INSERT INTO `respuesta` VALUES ('128', 'Es 2', '77', '1', null, null, '1', '1', '2020-08-15 02:57:48', '2020-08-15 02:57:48');
INSERT INTO `respuesta` VALUES ('129', 'es 3', '77', '0', null, null, '1', '1', '2020-08-15 02:57:48', '2020-08-15 02:57:48');
INSERT INTO `respuesta` VALUES ('130', 'es 4', '77', '1', null, null, '1', '1', '2020-08-15 02:57:49', '2020-08-15 02:57:49');
INSERT INTO `respuesta` VALUES ('131', 'Ninguna de las Anteriores', '77', '0', null, null, '1', '1', '2020-08-15 02:57:49', '2020-08-15 02:57:49');
INSERT INTO `respuesta` VALUES ('132', 'Sumandos', '79', '1', null, null, '1', '1', '2020-08-15 02:57:49', '2020-08-15 02:57:49');
INSERT INTO `respuesta` VALUES ('133', 'Signo', '79', '1', null, null, '1', '1', '2020-08-15 02:57:49', '2020-08-15 02:57:49');
INSERT INTO `respuesta` VALUES ('134', 'Total', '79', '1', null, null, '1', '1', '2020-08-15 02:57:49', '2020-08-15 02:57:49');
INSERT INTO `respuesta` VALUES ('135', 'Sustraendo', '79', '0', null, null, '1', '1', '2020-08-15 02:57:49', '2020-08-15 02:57:49');
INSERT INTO `respuesta` VALUES ('136', 'respuesta 9', '80', '0', null, null, '1', '1', '2020-08-15 02:57:50', '2020-08-15 02:57:50');
INSERT INTO `respuesta` VALUES ('137', 'respuesta 8', '80', '1', null, null, '1', '1', '2020-08-15 02:57:50', '2020-08-15 02:57:50');
INSERT INTO `respuesta` VALUES ('138', 'Respuesta 7', '80', '0', null, null, '1', '1', '2020-08-15 02:57:50', '2020-08-15 02:57:50');
INSERT INTO `respuesta` VALUES ('139', 'respuesta 2', '81', '0', null, null, '1', '1', '2020-08-18 21:55:44', '2020-08-18 21:55:44');
INSERT INTO `respuesta` VALUES ('140', 'respuesta 3', '81', '0', null, null, '1', '1', '2020-08-18 21:55:44', '2020-08-18 21:55:44');
INSERT INTO `respuesta` VALUES ('141', 'respuesta 4', '81', '1', null, null, '1', '1', '2020-08-18 21:55:44', '2020-08-18 21:55:44');
INSERT INTO `respuesta` VALUES ('142', 'Respuesta 5', '81', '0', null, null, '1', '1', '2020-08-18 21:55:45', '2020-08-18 21:55:45');
INSERT INTO `respuesta` VALUES ('143', 'Es 2', '83', '1', null, null, '1', '1', '2020-08-18 21:55:45', '2020-08-18 21:55:45');
INSERT INTO `respuesta` VALUES ('144', 'es 3', '83', '0', null, null, '1', '1', '2020-08-18 21:55:45', '2020-08-18 21:55:45');
INSERT INTO `respuesta` VALUES ('145', 'es 4', '83', '1', null, null, '1', '1', '2020-08-18 21:55:45', '2020-08-18 21:55:45');
INSERT INTO `respuesta` VALUES ('146', 'Ninguna de las Anteriores', '83', '0', null, null, '1', '1', '2020-08-18 21:55:45', '2020-08-18 21:55:45');
INSERT INTO `respuesta` VALUES ('147', 'Sumandos', '85', '1', null, null, '1', '1', '2020-08-18 21:55:45', '2020-08-18 21:55:45');
INSERT INTO `respuesta` VALUES ('148', 'Signo', '85', '1', null, null, '1', '1', '2020-08-18 21:55:46', '2020-08-18 21:55:46');
INSERT INTO `respuesta` VALUES ('149', 'Total', '85', '1', null, null, '1', '1', '2020-08-18 21:55:46', '2020-08-18 21:55:46');
INSERT INTO `respuesta` VALUES ('150', 'Sustraendo', '85', '0', null, null, '1', '1', '2020-08-18 21:55:46', '2020-08-18 21:55:46');
INSERT INTO `respuesta` VALUES ('151', 'respuesta 9', '86', '0', null, null, '1', '1', '2020-08-18 21:55:46', '2020-08-18 21:55:46');
INSERT INTO `respuesta` VALUES ('152', 'respuesta 8', '86', '1', null, null, '1', '1', '2020-08-18 21:55:46', '2020-08-18 21:55:46');
INSERT INTO `respuesta` VALUES ('153', 'Respuesta 7', '86', '0', null, null, '1', '1', '2020-08-18 21:55:46', '2020-08-18 21:55:46');
INSERT INTO `respuesta` VALUES ('154', 'Ayer', '87', '1', null, null, '1', '1', '2020-08-18 21:56:50', '2020-08-18 21:56:50');
INSERT INTO `respuesta` VALUES ('155', 'Mañana', '87', '0', null, null, '1', '1', '2020-08-18 21:56:59', '2020-08-18 21:56:59');
INSERT INTO `respuesta` VALUES ('156', 'Hoy', '87', '1', null, null, '1', '1', '2020-08-18 21:57:09', '2020-08-18 21:57:09');
INSERT INTO `respuesta` VALUES ('157', 'es 1', '88', '0', null, null, '1', '1', '2020-08-19 18:49:44', '2020-08-19 18:49:52');
INSERT INTO `respuesta` VALUES ('158', 'es 2', '88', '1', null, null, '1', '1', '2020-08-19 18:49:52', '2020-08-19 18:49:52');
INSERT INTO `respuesta` VALUES ('159', 'es 10', '88', '0', null, null, '1', '1', '2020-08-19 18:50:05', '2020-08-19 18:50:05');
INSERT INTO `respuesta` VALUES ('160', 'sumandos', '90', '1', null, null, '1', '1', '2020-08-19 18:51:58', '2020-08-19 18:51:58');
INSERT INTO `respuesta` VALUES ('161', 'signo', '90', '1', null, null, '1', '1', '2020-08-19 18:52:07', '2020-08-19 18:52:07');
INSERT INTO `respuesta` VALUES ('162', 'sustraendo', '90', '0', null, null, '1', '1', '2020-08-19 18:52:16', '2020-08-19 18:52:16');
INSERT INTO `respuesta` VALUES ('163', 'respuesta 9', '91', '0', null, null, '1', '1', '2020-08-19 18:53:10', '2020-08-19 18:53:10');
INSERT INTO `respuesta` VALUES ('164', 'respuesta 8', '91', '1', null, null, '1', '1', '2020-08-19 18:53:10', '2020-08-19 18:53:10');
INSERT INTO `respuesta` VALUES ('165', 'Respuesta 7', '91', '0', null, null, '1', '1', '2020-08-19 18:53:10', '2020-08-19 18:53:10');
INSERT INTO `respuesta` VALUES ('166', 'respuesta 2', '92', '0', null, null, '1', '1', '2020-09-09 12:23:00', '2020-09-09 12:23:00');
INSERT INTO `respuesta` VALUES ('167', 'respuesta 3', '92', '0', null, null, '1', '1', '2020-09-09 12:23:00', '2020-09-09 12:23:00');
INSERT INTO `respuesta` VALUES ('168', 'respuesta 4', '92', '1', null, null, '1', '1', '2020-09-09 12:23:00', '2020-09-09 12:23:00');
INSERT INTO `respuesta` VALUES ('169', 'Respuesta 5', '92', '0', null, null, '1', '1', '2020-09-09 12:23:00', '2020-09-09 12:23:00');
INSERT INTO `respuesta` VALUES ('170', 'Es 2', '94', '1', null, null, '1', '1', '2020-09-09 12:23:00', '2020-09-09 12:23:00');
INSERT INTO `respuesta` VALUES ('171', 'es 3', '94', '0', null, null, '1', '1', '2020-09-09 12:23:00', '2020-09-09 12:23:00');
INSERT INTO `respuesta` VALUES ('172', 'es 4', '94', '1', null, null, '1', '1', '2020-09-09 12:23:00', '2020-09-09 12:23:00');
INSERT INTO `respuesta` VALUES ('173', 'Ninguna de las Anteriores', '94', '0', null, null, '1', '1', '2020-09-09 12:23:01', '2020-09-09 12:23:01');
INSERT INTO `respuesta` VALUES ('174', 'Sumandos', '96', '1', null, null, '1', '1', '2020-09-09 12:23:01', '2020-09-09 12:23:01');
INSERT INTO `respuesta` VALUES ('175', 'Signo', '96', '1', null, null, '1', '1', '2020-09-09 12:23:01', '2020-09-09 12:23:01');
INSERT INTO `respuesta` VALUES ('176', 'Total', '96', '1', null, null, '1', '1', '2020-09-09 12:23:01', '2020-09-09 12:23:01');
INSERT INTO `respuesta` VALUES ('177', 'Sustraendo', '96', '0', null, null, '1', '1', '2020-09-09 12:23:01', '2020-09-09 12:23:01');
INSERT INTO `respuesta` VALUES ('178', 'respuesta 9', '97', '0', null, null, '1', '1', '2020-09-09 12:23:01', '2020-09-09 12:23:01');
INSERT INTO `respuesta` VALUES ('179', 'respuesta 8', '97', '1', null, null, '1', '1', '2020-09-09 12:23:01', '2020-09-09 12:23:01');
INSERT INTO `respuesta` VALUES ('180', 'Respuesta 7', '97', '0', null, null, '1', '1', '2020-09-09 12:23:01', '2020-09-09 12:23:01');

-- ----------------------------
-- Table structure for respuesta_alumno
-- ----------------------------
DROP TABLE IF EXISTS `respuesta_alumno`;
CREATE TABLE `respuesta_alumno` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_prueba` int(11) NOT NULL,
  `id_pregunta` int(11) NOT NULL,
  `id_respuesta` int(11) DEFAULT NULL,
  `id_alumno` int(11) NOT NULL,
  `tx_respuesta` varchar(600) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bo_correcta` tinyint(1) NOT NULL,
  `nu_valor` double(8,2) DEFAULT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of respuesta_alumno
-- ----------------------------
INSERT INTO `respuesta_alumno` VALUES ('26', '1', '1', '5', '1', null, '0', '0.00', null, '1', '1', '2020-08-12 17:32:47', '2020-08-15 15:48:13');
INSERT INTO `respuesta_alumno` VALUES ('27', '1', '6', null, '1', 'La suma de cualquier número más cero (0) es igual al mismo número.', '0', '3.00', null, '1', '1', '2020-08-12 17:32:53', '2020-08-15 18:32:06');
INSERT INTO `respuesta_alumno` VALUES ('29', '1', '3', null, '1', 'Cualquier número multiplicado por cero da como producto cero. Cualquier número multiplicado por cero da como producto cero. Cualquier número multiplicado por cero da como producto cero.', '0', '4.00', null, '1', '1', '2020-08-12 17:33:07', '2020-08-15 02:42:36');
INSERT INTO `respuesta_alumno` VALUES ('31', '1', '8', '16', '1', null, '0', '0.00', null, '1', '1', '2020-08-12 17:33:29', '2020-08-12 17:33:29');
INSERT INTO `respuesta_alumno` VALUES ('41', '1', '2', '1', '1', null, '1', '1.50', null, '1', '1', null, null);
INSERT INTO `respuesta_alumno` VALUES ('42', '1', '2', '2', '1', null, '0', '0.00', null, '1', '1', null, null);
INSERT INTO `respuesta_alumno` VALUES ('43', '1', '2', '3', '1', null, '1', '1.50', null, '1', '1', null, null);
INSERT INTO `respuesta_alumno` VALUES ('44', '1', '5', '12', '1', null, '1', '1.33', null, '1', '1', null, null);
INSERT INTO `respuesta_alumno` VALUES ('45', '1', '5', '14', '1', null, '1', '1.33', null, '1', '1', null, null);
INSERT INTO `respuesta_alumno` VALUES ('46', '5', '75', '124', '1', null, '0', '0.00', null, '1', '1', '2020-08-15 20:57:01', '2020-08-15 20:57:01');
INSERT INTO `respuesta_alumno` VALUES ('47', '5', '76', null, '1', 'elemento neutro', '0', '1.00', null, '1', '1', '2020-08-15 20:57:13', '2020-08-15 21:04:18');
INSERT INTO `respuesta_alumno` VALUES ('48', '5', '77', '128', '1', null, '1', '1.50', null, '1', '1', null, null);
INSERT INTO `respuesta_alumno` VALUES ('49', '5', '77', '130', '1', null, '1', '1.50', null, '1', '1', null, null);
INSERT INTO `respuesta_alumno` VALUES ('50', '5', '78', null, '1', 'multiplica por 0', '0', '3.00', null, '1', '1', '2020-08-15 20:57:36', '2020-08-15 21:04:18');
INSERT INTO `respuesta_alumno` VALUES ('51', '5', '79', '132', '1', null, '1', '1.33', null, '1', '1', null, null);
INSERT INTO `respuesta_alumno` VALUES ('52', '5', '79', '133', '1', null, '1', '1.33', null, '1', '1', null, null);
INSERT INTO `respuesta_alumno` VALUES ('53', '5', '79', '134', '1', null, '1', '1.33', null, '1', '1', null, null);
INSERT INTO `respuesta_alumno` VALUES ('54', '5', '80', '137', '1', null, '1', '2.00', null, '1', '1', '2020-08-15 20:57:50', '2020-08-15 20:57:50');
INSERT INTO `respuesta_alumno` VALUES ('55', '6', '81', '139', '1', null, '0', '0.00', null, '1', '1', '2020-08-18 22:00:47', '2020-08-18 22:00:47');
INSERT INTO `respuesta_alumno` VALUES ('56', '6', '82', null, '1', 'sumo por 0 da cero', '0', '2.00', null, '1', '1', '2020-08-18 22:01:01', '2020-08-18 22:05:30');
INSERT INTO `respuesta_alumno` VALUES ('58', '6', '84', null, '1', 'jsbdjkbsdk', '0', '0.00', null, '1', '1', '2020-08-18 22:01:45', '2020-08-18 22:05:30');
INSERT INTO `respuesta_alumno` VALUES ('59', '6', '85', '147', '1', null, '1', '1.33', null, '1', '1', null, null);
INSERT INTO `respuesta_alumno` VALUES ('60', '6', '85', '148', '1', null, '1', '1.33', null, '1', '1', null, null);
INSERT INTO `respuesta_alumno` VALUES ('61', '6', '85', '149', '1', null, '1', '1.33', null, '1', '1', null, null);
INSERT INTO `respuesta_alumno` VALUES ('62', '6', '86', '152', '1', null, '1', '2.00', null, '1', '1', '2020-08-18 22:02:03', '2020-08-18 22:02:03');
INSERT INTO `respuesta_alumno` VALUES ('63', '6', '87', '155', '1', null, '0', '0.00', null, '1', '1', null, null);
INSERT INTO `respuesta_alumno` VALUES ('64', '6', '83', '144', '1', null, '0', '0.00', null, '1', '1', null, null);
INSERT INTO `respuesta_alumno` VALUES ('65', '6', '83', '145', '1', null, '1', '1.50', null, '1', '1', null, null);
INSERT INTO `respuesta_alumno` VALUES ('66', '7', '88', '158', '1', null, '1', '5.00', null, '1', '1', '2020-08-19 19:00:46', '2020-08-19 19:00:46');
INSERT INTO `respuesta_alumno` VALUES ('67', '7', '89', null, '1', 'jsdhjshfjsdhfskhjdh', '0', '5.00', null, '1', '1', '2020-08-19 19:01:08', '2020-08-19 19:04:18');
INSERT INTO `respuesta_alumno` VALUES ('68', '7', '90', '160', '1', null, '1', '2.00', null, '1', '1', null, null);
INSERT INTO `respuesta_alumno` VALUES ('69', '7', '90', '161', '1', null, '1', '2.00', null, '1', '1', null, null);
INSERT INTO `respuesta_alumno` VALUES ('70', '7', '91', '164', '1', null, '1', '2.00', null, '1', '1', '2020-08-19 19:01:38', '2020-08-19 19:01:38');
INSERT INTO `respuesta_alumno` VALUES ('71', '8', '92', '168', '1', null, '1', '3.00', null, '1', '1', '2020-09-11 19:26:20', '2020-09-11 19:26:20');
INSERT INTO `respuesta_alumno` VALUES ('72', '8', '93', null, '1', '5yyr', '0', '4.00', null, '1', '1', '2020-09-11 19:26:25', '2020-09-11 19:27:55');
INSERT INTO `respuesta_alumno` VALUES ('73', '8', '94', '170', '1', null, '1', '1.50', null, '1', '1', null, null);
INSERT INTO `respuesta_alumno` VALUES ('74', '8', '94', '172', '1', null, '1', '1.50', null, '1', '1', null, null);
INSERT INTO `respuesta_alumno` VALUES ('75', '8', '95', null, '1', 'gsgsg', '0', '4.00', null, '1', '1', '2020-09-11 19:26:37', '2020-09-11 19:27:55');
INSERT INTO `respuesta_alumno` VALUES ('76', '8', '96', '174', '1', null, '1', '1.33', null, '1', '1', null, null);
INSERT INTO `respuesta_alumno` VALUES ('77', '8', '96', '175', '1', null, '1', '1.33', null, '1', '1', null, null);
INSERT INTO `respuesta_alumno` VALUES ('78', '8', '97', '179', '1', null, '1', '2.00', null, '1', '1', '2020-09-11 19:26:51', '2020-09-11 19:26:51');

-- ----------------------------
-- Table structure for status
-- ----------------------------
DROP TABLE IF EXISTS `status`;
CREATE TABLE `status` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nb_secundario` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `co_status` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `co_grupo` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_icono` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `tx_color` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `id_padre` int(11) DEFAULT NULL,
  `tx_observaciones` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bo_activo` tinyint(1) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `status_nb_status_unique` (`nb_status`,`co_grupo`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of status
-- ----------------------------
INSERT INTO `status` VALUES ('1', 'activo', 'active', 'ACT', 'GRAL', null, null, null, null, '1', '1', '2020-05-07 03:00:28', null);
INSERT INTO `status` VALUES ('2', 'inactivo', 'inactive', 'INA', 'GRAL', null, null, null, null, '1', '1', '2020-05-07 03:01:01', null);
INSERT INTO `status` VALUES ('3', 'pendiente', 'pending', 'PEN', 'PRUEBA', 'mdi-progress-alert', 'amber', null, null, '1', '1', null, null);
INSERT INTO `status` VALUES ('4', 'asignada', 'assigned', 'ASI', 'PRUEBA', 'mdi-text-box-check', 'info', null, null, '1', '1', null, null);
INSERT INTO `status` VALUES ('5', 'en ejecucion', 'running', 'EEJE', 'PRUEBA', 'mdi-cog-clockwise', 'red', null, null, '1', '1', null, null);
INSERT INTO `status` VALUES ('6', 'ejecutada', 'ejecuted', 'EJE', 'PRUEBA', 'mdi-check-all', 'success', null, null, '1', '1', null, null);
INSERT INTO `status` VALUES ('7', 'evaluada', 'evaluated', 'EVA', 'PRUEBA', '', '', null, null, '1', '1', null, null);
INSERT INTO `status` VALUES ('8', 'cerrada', 'closed', 'CER', 'PRUEBA', '', '', null, null, '1', '1', null, null);
INSERT INTO `status` VALUES ('9', 'planificada', 'planned', 'PLA', 'EVALUACION', 'mdi-alpha-p-circle-outline', 'info', null, null, '1', '1', null, null);
INSERT INTO `status` VALUES ('10', 'asignada', 'assigned', 'AGE', 'EVALUACION', 'mdi-alpha-a-circle-outline', 'amber', null, null, '1', '1', null, null);
INSERT INTO `status` VALUES ('11', 'evaluada', 'evaluated', 'EVA', 'EVALUACION', 'mdi-alpha-e-circle-outline', 'success', null, null, '1', '1', null, null);

-- ----------------------------
-- Table structure for suscripcion
-- ----------------------------
DROP TABLE IF EXISTS `suscripcion`;
CREATE TABLE `suscripcion` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_colegio` int(11) NOT NULL,
  `aa_lectivo` int(11) NOT NULL,
  `mo_cobro` decimal(9,2) NOT NULL,
  `mo_pagado` decimal(9,2) NOT NULL,
  `mo_saldo` decimal(9,2) NOT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of suscripcion
-- ----------------------------

-- ----------------------------
-- Table structure for telefono
-- ----------------------------
DROP TABLE IF EXISTS `telefono`;
CREATE TABLE `telefono` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tx_telefono` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_tipo_telefono` int(11) NOT NULL,
  `id_entidad` int(11) NOT NULL,
  `bo_whatsapp` tinyint(1) NOT NULL DEFAULT 0,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of telefono
-- ----------------------------

-- ----------------------------
-- Table structure for telescope_entries
-- ----------------------------
DROP TABLE IF EXISTS `telescope_entries`;
CREATE TABLE `telescope_entries` (
  `sequence` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `family_hash` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `should_display_on_index` tinyint(1) NOT NULL DEFAULT 1,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`sequence`),
  UNIQUE KEY `telescope_entries_uuid_unique` (`uuid`),
  KEY `telescope_entries_batch_id_index` (`batch_id`),
  KEY `telescope_entries_type_should_display_on_index_index` (`type`,`should_display_on_index`),
  KEY `telescope_entries_family_hash_index` (`family_hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of telescope_entries
-- ----------------------------

-- ----------------------------
-- Table structure for telescope_entries_tags
-- ----------------------------
DROP TABLE IF EXISTS `telescope_entries_tags`;
CREATE TABLE `telescope_entries_tags` (
  `entry_uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tag` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  KEY `telescope_entries_tags_entry_uuid_tag_index` (`entry_uuid`,`tag`),
  KEY `telescope_entries_tags_tag_index` (`tag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of telescope_entries_tags
-- ----------------------------

-- ----------------------------
-- Table structure for telescope_monitoring
-- ----------------------------
DROP TABLE IF EXISTS `telescope_monitoring`;
CREATE TABLE `telescope_monitoring` (
  `tag` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of telescope_monitoring
-- ----------------------------

-- ----------------------------
-- Table structure for tipo_actividad
-- ----------------------------
DROP TABLE IF EXISTS `tipo_actividad`;
CREATE TABLE `tipo_actividad` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_tipo_actividad` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tx_icono` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of tipo_actividad
-- ----------------------------
INSERT INTO `tipo_actividad` VALUES ('1', 'Reunion de Docentes', 'mdi-account-group', null, '1', '1', '2020-06-19 02:23:46', '2020-06-19 03:00:03');
INSERT INTO `tipo_actividad` VALUES ('2', 'Reunion de Padres', 'mdi-human-male-child', null, '1', '1', '2020-06-19 02:59:44', '2020-06-19 02:59:44');
INSERT INTO `tipo_actividad` VALUES ('3', 'Reunion Secrertaria', 'mdi-chair-rolling', null, '1', '1', '2020-06-19 03:06:30', '2020-06-19 03:06:30');
INSERT INTO `tipo_actividad` VALUES ('4', 'Taller', 'mdi-charity', null, '1', '1', '2020-06-19 03:08:05', '2020-06-19 03:08:05');
INSERT INTO `tipo_actividad` VALUES ('5', 'Celebracion', 'mdi-party-popper', null, '1', '1', '2020-06-19 03:11:22', '2020-06-19 10:22:50');
INSERT INTO `tipo_actividad` VALUES ('6', 'Actividades Deportivas', 'mdi-soccer', null, '1', '1', '2020-06-19 03:22:38', '2020-06-19 20:57:18');
INSERT INTO `tipo_actividad` VALUES ('7', 'Paseos', 'mdi-bus-side', null, '1', '1', '2020-06-19 03:23:06', '2020-06-20 11:29:43');
INSERT INTO `tipo_actividad` VALUES ('8', 'Inicio FIn Año escolar', 'mdi-flag-checkered', null, '1', '1', '2020-06-19 10:18:37', '2020-06-19 10:18:37');
INSERT INTO `tipo_actividad` VALUES ('9', 'Inicio FIn Periodo', 'mdi-flag-triangle', null, '1', '1', '2020-06-19 10:21:01', '2020-06-19 10:21:01');

-- ----------------------------
-- Table structure for tipo_agenda
-- ----------------------------
DROP TABLE IF EXISTS `tipo_agenda`;
CREATE TABLE `tipo_agenda` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_tipo_agenda` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tx_color` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of tipo_agenda
-- ----------------------------
INSERT INTO `tipo_agenda` VALUES ('1', 'General', 'red', null, '1', '1', '2020-06-16 20:04:28', '2020-06-19 03:43:28');
INSERT INTO `tipo_agenda` VALUES ('2', 'Secretaria', 'purple', null, '1', '1', '2020-06-16 20:04:39', '2020-06-19 03:43:45');
INSERT INTO `tipo_agenda` VALUES ('3', 'Docentes', 'teal', null, '1', '1', '2020-06-16 20:04:55', '2020-06-19 03:43:55');
INSERT INTO `tipo_agenda` VALUES ('4', 'Alumnos', 'amber', null, '1', '1', '2020-06-16 20:05:11', '2020-06-19 03:44:03');
INSERT INTO `tipo_agenda` VALUES ('5', 'Grado', 'deep-purple', null, '1', '1', '2020-06-16 20:05:21', '2020-06-19 03:44:13');
INSERT INTO `tipo_agenda` VALUES ('6', 'Grupos', 'cyan', null, '1', '1', '2020-06-16 20:05:31', '2020-06-19 03:45:07');
INSERT INTO `tipo_agenda` VALUES ('7', 'Acudientes', 'light-green', null, '1', '1', '2020-06-16 20:09:07', '2020-06-19 03:44:38');

-- ----------------------------
-- Table structure for tipo_archivo
-- ----------------------------
DROP TABLE IF EXISTS `tipo_archivo`;
CREATE TABLE `tipo_archivo` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_tipo_archivo` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tx_origen` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tx_storage` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tx_base_path` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_grupo` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of tipo_archivo
-- ----------------------------
INSERT INTO `tipo_archivo` VALUES ('1', 'Detalle Plan', 'detalle_plan', 'detallePlan', '/storage/detallePlan/', 'academico', null, '1', '1', '2020-05-28 20:46:24', '2020-06-29 17:21:57');
INSERT INTO `tipo_archivo` VALUES ('2', 'Evaluacion', 'evaluacion', 'evaluacion', '/storage/evaluacion/', 'evaluacion', null, '1', '1', '2020-05-28 20:49:19', '2020-07-09 16:07:19');
INSERT INTO `tipo_archivo` VALUES ('3', 'Grado', 'grado', 'grado', '/storage/grado/', 'grado', null, '1', '1', '2020-05-28 20:50:10', '2020-07-09 16:07:29');
INSERT INTO `tipo_archivo` VALUES ('4', 'Grupo', 'grupo', 'grupo', '/storage/grupo/', 'grupo', null, '1', '1', '2020-05-28 20:50:38', '2020-07-09 16:07:39');
INSERT INTO `tipo_archivo` VALUES ('5', 'Alumno', 'alumno', 'alumno', '/storage/alumno/', 'alumno', null, '1', '1', '2020-05-28 20:51:53', '2020-07-09 16:07:52');
INSERT INTO `tipo_archivo` VALUES ('6', 'Docente', 'docente', 'docente', '/storage/docente/', 'docente', null, '1', '1', '2020-05-28 20:52:20', '2020-07-09 16:08:28');
INSERT INTO `tipo_archivo` VALUES ('7', 'Colegio', 'colegio', 'colegio', '/storage/colegio/', 'colegio', null, '1', '1', '2020-05-28 20:53:31', '2020-05-28 20:53:31');
INSERT INTO `tipo_archivo` VALUES ('8', 'Libro', 'recurso', 'libro', '/storage/recurso/libro/', 'libro', null, '1', '1', '2020-07-01 22:27:25', '2020-07-09 16:08:51');
INSERT INTO `tipo_archivo` VALUES ('9', 'Video', 'recurso', 'video', '/storage/recurso/video/', 'video', null, '1', '1', '2020-07-01 22:29:19', '2020-07-09 16:09:02');
INSERT INTO `tipo_archivo` VALUES ('10', 'Guias', 'recurso', 'guia', '/storage/recurso/guia/', 'guia', null, '1', '1', '2020-07-01 22:30:27', '2020-07-09 16:09:12');
INSERT INTO `tipo_archivo` VALUES ('11', 'Tarea', 'evaluacion_alumno', 'tarea', '/storage/tarea/', 'tarea', null, '1', '1', '2020-09-07 09:30:13', '2020-09-07 09:30:16');

-- ----------------------------
-- Table structure for tipo_calificacion
-- ----------------------------
DROP TABLE IF EXISTS `tipo_calificacion`;
CREATE TABLE `tipo_calificacion` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_tipo_calificacion` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of tipo_calificacion
-- ----------------------------
INSERT INTO `tipo_calificacion` VALUES ('1', 'Numerica (Real)', null, '1', '1', null, null);
INSERT INTO `tipo_calificacion` VALUES ('2', 'Numerica (Entero)', null, '1', '1', null, null);
INSERT INTO `tipo_calificacion` VALUES ('3', 'Porcentaje', null, '1', '1', null, null);
INSERT INTO `tipo_calificacion` VALUES ('4', 'Letra', null, '1', '1', null, null);

-- ----------------------------
-- Table structure for tipo_colegio
-- ----------------------------
DROP TABLE IF EXISTS `tipo_colegio`;
CREATE TABLE `tipo_colegio` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_tipo_colegio` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of tipo_colegio
-- ----------------------------
INSERT INTO `tipo_colegio` VALUES ('1', 'Privado', null, '1', '1', '2020-05-08 18:29:15', '2020-05-08 18:29:15');
INSERT INTO `tipo_colegio` VALUES ('2', 'Publico', null, '1', '1', '2020-05-08 18:29:42', '2020-05-08 18:29:42');

-- ----------------------------
-- Table structure for tipo_condicion
-- ----------------------------
DROP TABLE IF EXISTS `tipo_condicion`;
CREATE TABLE `tipo_condicion` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_tipo_condicion` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tx_icono` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of tipo_condicion
-- ----------------------------
INSERT INTO `tipo_condicion` VALUES ('1', 'Regular', 'mdi-alpha-r-circle', null, '1', '1', '2020-07-08 16:06:52', '2020-07-08 16:06:52');
INSERT INTO `tipo_condicion` VALUES ('2', 'Repitiente', 'mdi-backup-restore', null, '1', '1', '2020-07-08 16:09:31', '2020-07-08 16:09:31');
INSERT INTO `tipo_condicion` VALUES ('3', 'No Matriculado', 'mdi-alphabetical-variant-off', null, '1', '1', '2020-07-08 16:18:51', '2020-07-08 16:18:51');

-- ----------------------------
-- Table structure for tipo_contacto
-- ----------------------------
DROP TABLE IF EXISTS `tipo_contacto`;
CREATE TABLE `tipo_contacto` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_tipo_contacto` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of tipo_contacto
-- ----------------------------
INSERT INTO `tipo_contacto` VALUES ('1', 'Colegio', 'Contacto del colegio', '1', '1', '2020-06-03 21:48:31', '2020-06-03 21:48:58');

-- ----------------------------
-- Table structure for tipo_destinatario
-- ----------------------------
DROP TABLE IF EXISTS `tipo_destinatario`;
CREATE TABLE `tipo_destinatario` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_tipo_destinatario` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tx_origen` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tx_icono` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tx_color` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of tipo_destinatario
-- ----------------------------
INSERT INTO `tipo_destinatario` VALUES ('1', 'Administrador', 'empleado', 'mdi-account-group', 'red', null, '1', '1', '2020-07-22 20:58:22', '2020-07-22 20:58:22');
INSERT INTO `tipo_destinatario` VALUES ('2', 'Docente', 'docente', 'mdi-account-tie', 'purple', null, '1', '1', '2020-07-22 21:00:11', '2020-07-22 21:00:11');
INSERT INTO `tipo_destinatario` VALUES ('3', 'Alumno', 'alumno', 'mdi-school', 'blue', null, '1', '1', '2020-07-22 21:00:51', '2020-07-22 21:00:51');
INSERT INTO `tipo_destinatario` VALUES ('4', 'Acudiente', 'pariente', 'mdi-human-male-child', 'teal', null, '1', '1', '2020-07-22 21:04:17', '2020-07-22 21:04:17');
INSERT INTO `tipo_destinatario` VALUES ('5', 'Empleado', 'empleado', 'mdi-chair-rolling', 'indigo', null, '1', '1', '2020-07-22 21:05:49', '2020-07-22 21:05:49');
INSERT INTO `tipo_destinatario` VALUES ('99', 'General', '*', '', '', null, '0', '0', null, null);

-- ----------------------------
-- Table structure for tipo_directiva
-- ----------------------------
DROP TABLE IF EXISTS `tipo_directiva`;
CREATE TABLE `tipo_directiva` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_tipo_directiva` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of tipo_directiva
-- ----------------------------
INSERT INTO `tipo_directiva` VALUES ('1', 'Junta Directiva', null, '1', '1', '2020-05-08 19:02:22', '2020-05-08 19:02:22');
INSERT INTO `tipo_directiva` VALUES ('2', 'Asociacion de Padres', null, '1', '1', '2020-05-08 19:02:44', '2020-05-08 19:02:44');
INSERT INTO `tipo_directiva` VALUES ('3', 'Administrativo', null, '1', '1', '2020-05-08 19:03:04', '2020-05-08 19:03:04');
INSERT INTO `tipo_directiva` VALUES ('4', 'Otros', null, '1', '1', '2020-05-08 19:03:14', '2020-05-08 19:03:14');

-- ----------------------------
-- Table structure for tipo_documento
-- ----------------------------
DROP TABLE IF EXISTS `tipo_documento`;
CREATE TABLE `tipo_documento` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_tipo_documento` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tx_icono` varchar(35) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_path` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_grupo` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of tipo_documento
-- ----------------------------
INSERT INTO `tipo_documento` VALUES ('1', 'Cedula', null, null, 'ID', null, '1', '1', null, null);
INSERT INTO `tipo_documento` VALUES ('2', 'Pasaporte', null, null, 'ID', null, '1', '1', null, null);

-- ----------------------------
-- Table structure for tipo_evaluacion
-- ----------------------------
DROP TABLE IF EXISTS `tipo_evaluacion`;
CREATE TABLE `tipo_evaluacion` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_tipo_evaluacion` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of tipo_evaluacion
-- ----------------------------
INSERT INTO `tipo_evaluacion` VALUES ('1', 'Prueba en Linea', 'Exclusiva Pruebas en Linea', '1', '1', '2020-05-25 22:43:23', '2020-09-06 18:05:20');
INSERT INTO `tipo_evaluacion` VALUES ('2', 'Prueba Escrita', null, '1', '1', '2020-05-25 22:43:39', '2020-05-25 22:43:39');
INSERT INTO `tipo_evaluacion` VALUES ('3', 'Disciplina', null, '1', '1', '2020-05-25 22:44:01', '2020-05-25 22:44:01');
INSERT INTO `tipo_evaluacion` VALUES ('4', 'Taller', null, '1', '1', '2020-05-25 22:44:27', '2020-05-25 22:44:27');
INSERT INTO `tipo_evaluacion` VALUES ('5', 'Tareas', null, '1', '1', '2020-05-25 22:44:37', '2020-05-25 22:44:37');
INSERT INTO `tipo_evaluacion` VALUES ('6', 'Puntualidad', null, '1', '1', '2020-05-25 22:44:47', '2020-05-25 22:44:47');
INSERT INTO `tipo_evaluacion` VALUES ('8', 'Exposicion', null, '1', '1', '2020-05-25 22:45:58', '2020-05-25 22:45:58');

-- ----------------------------
-- Table structure for tipo_falta
-- ----------------------------
DROP TABLE IF EXISTS `tipo_falta`;
CREATE TABLE `tipo_falta` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_tipo_falta` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tx_icono` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tx_color` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of tipo_falta
-- ----------------------------
INSERT INTO `tipo_falta` VALUES ('1', 'Leve', 'mdi-alert-box', 'amber', null, '1', '1', '2020-07-30 21:38:48', '2020-07-30 21:44:12');
INSERT INTO `tipo_falta` VALUES ('2', 'Mediana', 'mdi-alert-octagon', 'deep-orange', null, '1', '1', '2020-07-30 21:41:03', '2020-07-30 21:41:03');
INSERT INTO `tipo_falta` VALUES ('3', 'Grave', 'mdi-alert-decagram', 'red', null, '1', '1', '2020-07-30 21:41:27', '2020-07-30 21:41:27');

-- ----------------------------
-- Table structure for tipo_feriado
-- ----------------------------
DROP TABLE IF EXISTS `tipo_feriado`;
CREATE TABLE `tipo_feriado` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_tipo_feriado` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of tipo_feriado
-- ----------------------------
INSERT INTO `tipo_feriado` VALUES ('1', 'Fijo', null, '1', '1', '2020-06-15 14:29:55', null);
INSERT INTO `tipo_feriado` VALUES ('2', 'Variable', null, '1', '1', '2020-06-15 14:30:53', null);

-- ----------------------------
-- Table structure for tipo_foto
-- ----------------------------
DROP TABLE IF EXISTS `tipo_foto`;
CREATE TABLE `tipo_foto` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_tipo_foto` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tx_origen` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tx_storage` varchar(35) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_base_path` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tx_grupo` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of tipo_foto
-- ----------------------------
INSERT INTO `tipo_foto` VALUES ('1', 'Colegio', 'colegio', 'foto', '/storage/foto/colegio/', 'colegio', null, '1', '1', '2020-06-02 00:37:58', '2020-07-09 00:08:33');
INSERT INTO `tipo_foto` VALUES ('2', 'Alumno', 'alumno', 'foto', '/storage/foto/alumno/', 'alumno', null, '1', '1', '2020-07-09 00:03:51', '2020-07-09 00:08:10');
INSERT INTO `tipo_foto` VALUES ('3', 'Docente', 'docente', 'foto', '/storage/foto/docente/', 'docente', null, '1', '1', '2020-07-09 16:02:40', '2020-07-09 16:02:53');
INSERT INTO `tipo_foto` VALUES ('4', 'Cuenta', 'cuenta', 'foto', '/storage/foto/cuenta/', 'cuenta', null, '1', '1', '2020-07-16 00:58:08', '2020-07-16 00:58:26');
INSERT INTO `tipo_foto` VALUES ('5', 'Acudiente', 'pariente', 'foto', '/storage/foto/pariente/', 'pariente', null, '1', '1', '2020-07-25 23:52:25', '2020-07-25 23:53:11');

-- ----------------------------
-- Table structure for tipo_notificacion
-- ----------------------------
DROP TABLE IF EXISTS `tipo_notificacion`;
CREATE TABLE `tipo_notificacion` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_tipo_notificacion` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tx_icono` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_color` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of tipo_notificacion
-- ----------------------------
INSERT INTO `tipo_notificacion` VALUES ('1', 'Reunion', 'mdi-account-multiple', 'purple', null, '1', '1', '2020-07-22 21:08:14', '2020-07-22 21:08:14');
INSERT INTO `tipo_notificacion` VALUES ('2', 'Recordatorio', 'mdi-account-clock', 'deep-orange', null, '1', '1', '2020-07-22 21:11:01', '2020-07-22 21:11:01');
INSERT INTO `tipo_notificacion` VALUES ('3', 'Evento', 'mdi-calendar-clock', 'teal', null, '1', '1', '2020-07-22 21:12:37', '2020-07-22 21:12:37');

-- ----------------------------
-- Table structure for tipo_pago
-- ----------------------------
DROP TABLE IF EXISTS `tipo_pago`;
CREATE TABLE `tipo_pago` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_tipo_pago` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_comercio` int(11) NOT NULL,
  `tx_icono` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of tipo_pago
-- ----------------------------

-- ----------------------------
-- Table structure for tipo_pregunta
-- ----------------------------
DROP TABLE IF EXISTS `tipo_pregunta`;
CREATE TABLE `tipo_pregunta` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_tipo_pregunta` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tx_icono` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tx_color` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of tipo_pregunta
-- ----------------------------
INSERT INTO `tipo_pregunta` VALUES ('1', 'Desarrollo', 'mdi-text-box-outline', 'deep-orange', 'Desarrolle su respuesta', '1', '1', '2020-08-02 20:26:01', '2020-08-18 17:49:38');
INSERT INTO `tipo_pregunta` VALUES ('2', 'Seleccion Simple', 'mdi-check', 'purple', 'Debe seleccionarse solo una (1) respuesta correcta', '1', '1', '2020-08-02 20:27:56', '2020-08-04 21:17:54');
INSERT INTO `tipo_pregunta` VALUES ('3', 'Seleccion Multiple', 'mdi-check-all', 'blue', 'Pueden seleccionarse mas de una (1+) respuesta válida', '1', '1', '2020-08-02 20:28:29', '2020-08-04 21:07:03');

-- ----------------------------
-- Table structure for tipo_prioridad
-- ----------------------------
DROP TABLE IF EXISTS `tipo_prioridad`;
CREATE TABLE `tipo_prioridad` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_tipo_prioridad` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tx_icono` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_color` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of tipo_prioridad
-- ----------------------------
INSERT INTO `tipo_prioridad` VALUES ('1', 'Normal', 'mdi-alert-circle', 'cyan', null, '1', '1', '2020-07-22 20:16:36', '2020-07-22 20:16:36');
INSERT INTO `tipo_prioridad` VALUES ('2', 'Media', 'mdi-alert-box', 'amber', null, '1', '1', '2020-07-22 20:23:47', '2020-07-22 20:23:47');
INSERT INTO `tipo_prioridad` VALUES ('3', 'Urgente', 'mdi-alert', 'red', null, '1', '1', '2020-07-22 20:24:42', '2020-07-22 20:24:52');

-- ----------------------------
-- Table structure for tipo_recurso
-- ----------------------------
DROP TABLE IF EXISTS `tipo_recurso`;
CREATE TABLE `tipo_recurso` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_tipo_recurso` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_tipo_archivo` int(11) NOT NULL,
  `tx_icono` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tx_color` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of tipo_recurso
-- ----------------------------
INSERT INTO `tipo_recurso` VALUES ('1', 'Libros', '8', 'mdi-book-multiple', 'purple', null, '1', '1', '2020-07-01 22:03:34', '2020-07-22 21:17:10');
INSERT INTO `tipo_recurso` VALUES ('2', 'Videos', '9', 'mdi-play-box-multiple', 'red', null, '1', '1', '2020-07-01 22:04:27', '2020-07-01 22:04:27');
INSERT INTO `tipo_recurso` VALUES ('3', 'Guias', '10', 'mdi-clipboard-multiple', 'amber', null, '1', '1', '2020-07-01 22:05:05', '2020-07-22 23:26:52');

-- ----------------------------
-- Table structure for tipo_sancion
-- ----------------------------
DROP TABLE IF EXISTS `tipo_sancion`;
CREATE TABLE `tipo_sancion` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_tipo_sancion` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of tipo_sancion
-- ----------------------------
INSERT INTO `tipo_sancion` VALUES ('1', 'Llamado de Atencion', null, '1', '1', '2020-07-30 21:44:59', '2020-07-30 21:45:43');
INSERT INTO `tipo_sancion` VALUES ('2', 'Suspension', null, '1', '1', '2020-07-30 21:45:34', '2020-07-30 21:45:34');
INSERT INTO `tipo_sancion` VALUES ('3', 'Expulsion', null, '1', '1', '2020-07-30 21:46:06', '2020-07-30 21:46:06');
INSERT INTO `tipo_sancion` VALUES ('4', 'Sancion Pecuniaria', null, '1', '1', '2020-07-30 21:51:48', '2020-07-30 21:51:59');
INSERT INTO `tipo_sancion` VALUES ('5', 'Restriccion de Actividades Extraescolares', null, '1', '1', '2020-07-30 21:53:13', '2020-07-30 21:53:13');
INSERT INTO `tipo_sancion` VALUES ('6', 'Cambio de Grupo', null, '1', '1', '2020-07-30 21:54:08', '2020-07-30 21:54:08');

-- ----------------------------
-- Table structure for tipo_telefono
-- ----------------------------
DROP TABLE IF EXISTS `tipo_telefono`;
CREATE TABLE `tipo_telefono` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_tipo_telefono` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tx_icono` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of tipo_telefono
-- ----------------------------
INSERT INTO `tipo_telefono` VALUES ('1', 'Fijo/Local', 'mdi-phone-classic', null, '1', '1', '2020-05-08 19:12:42', '2020-05-08 19:12:42');
INSERT INTO `tipo_telefono` VALUES ('2', 'Movil/Celular', 'mdi-cellphone-android', null, '1', '1', '2020-05-08 20:06:19', '2020-05-08 20:06:19');
INSERT INTO `tipo_telefono` VALUES ('3', 'Fax', 'mdi-printer', null, '1', '1', '2020-05-08 20:06:55', '2020-05-08 20:06:55');

-- ----------------------------
-- Table structure for tipo_usuario
-- ----------------------------
DROP TABLE IF EXISTS `tipo_usuario`;
CREATE TABLE `tipo_usuario` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_tipo_usuario` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tx_tabla` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_perfil` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of tipo_usuario
-- ----------------------------
INSERT INTO `tipo_usuario` VALUES ('1', 'administrador', 'empleado', '1', null, '1', '1', '2020-05-08 20:28:23', '2020-07-24 01:20:50');
INSERT INTO `tipo_usuario` VALUES ('2', 'docente', 'docente', '2', null, '1', '1', '2020-05-08 20:29:14', '2020-07-24 01:20:58');
INSERT INTO `tipo_usuario` VALUES ('3', 'alumno', 'alumno', '3', null, '1', '1', '2020-05-08 20:29:37', '2020-07-24 01:21:04');
INSERT INTO `tipo_usuario` VALUES ('4', 'acudiente', 'pariente', '4', null, '1', '1', '2020-05-08 20:29:57', '2020-07-24 01:21:14');
INSERT INTO `tipo_usuario` VALUES ('5', 'empleado', 'empleado', '5', null, '1', '1', '2020-07-24 00:48:05', '2020-07-24 01:21:30');

-- ----------------------------
-- Table structure for turno
-- ----------------------------
DROP TABLE IF EXISTS `turno`;
CREATE TABLE `turno` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_turno` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of turno
-- ----------------------------
INSERT INTO `turno` VALUES ('1', 'Mañana', null, '1', '1', '2020-05-09 22:49:11', '2020-05-09 22:49:11');
INSERT INTO `turno` VALUES ('2', 'Tarde', null, '1', '1', '2020-05-09 22:49:22', '2020-05-09 22:49:22');
INSERT INTO `turno` VALUES ('3', 'Sabatino', null, '1', '1', '2020-05-20 03:33:10', '2020-05-20 03:33:10');

-- ----------------------------
-- Table structure for ubicacion
-- ----------------------------
DROP TABLE IF EXISTS `ubicacion`;
CREATE TABLE `ubicacion` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_ubicacion` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_colegio` int(11) NOT NULL,
  `id_padre` int(11) DEFAULT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of ubicacion
-- ----------------------------

-- ----------------------------
-- Table structure for usuario
-- ----------------------------
DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_colegio` int(11) NOT NULL,
  `nb_nombres` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `nb_usuario` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tx_email` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tx_foto` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_tipo_usuario` int(10) unsigned NOT NULL,
  `id_origen` int(10) NOT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `verification` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `api_token` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(10) unsigned NOT NULL,
  `id_usuario` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `usuario_nb_usuario_unique` (`nb_usuario`),
  UNIQUE KEY `usuario_id_origen_unique` (`id_tipo_usuario`,`id_origen`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=315 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of usuario
-- ----------------------------
INSERT INTO `usuario` VALUES ('1', '1', 'Administrador', 'admin', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'lyustiz@gmail.com', '', '1', '1', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `usuario` VALUES ('2', '1', 'jean yustiz', 'jyustiz', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'jyustiz@gmail.com', null, '3', '1', null, 'riR8aTSe', null, null, null, '1', '2', '2020-08-21 00:56:14', '2020-09-04 19:37:07');
INSERT INTO `usuario` VALUES ('3', '1', 'luisa tovar', 'ltovar', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'luisat02@gmail.com', null, '3', '2', null, 'PALIJ7aj', null, null, null, '1', '1', '2020-08-21 00:56:33', '2020-08-21 00:56:33');
INSERT INTO `usuario` VALUES ('4', '1', 'diana calderon', 'dcalderon', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'neque@Fuscedolor.org', null, '3', '10', null, 'nddZYKaf', null, null, null, '1', '1', '2020-08-21 00:56:33', '2020-08-21 00:56:33');
INSERT INTO `usuario` VALUES ('5', '1', 'hollee ruiz', 'hruiz', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'pulvinar@Fuscealiquetmagna.org', null, '3', '11', null, 'LFpNq9AJ', null, null, null, '1', '1', '2020-08-21 00:56:34', '2020-08-21 00:56:34');
INSERT INTO `usuario` VALUES ('6', '1', 'beau blankenship', 'bblankenship', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'pede.malesuada.vel@Maecenasiac', null, '3', '12', null, 'zu0PWHkc', null, null, null, '1', '1', '2020-08-21 00:56:34', '2020-08-21 00:56:34');
INSERT INTO `usuario` VALUES ('7', '1', 'lester gomez', 'lgomez', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'magna.a@dictummagnaUt.com', null, '3', '13', null, 'OmM2072N', null, null, null, '1', '1', '2020-08-21 00:56:35', '2020-08-21 00:56:35');
INSERT INTO `usuario` VALUES ('8', '1', 'acton holloway', 'aholloway', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'consequat.enim.diam@sitamet.ca', null, '3', '14', null, '0USrnzzk', null, null, null, '1', '1', '2020-08-21 00:56:35', '2020-08-21 00:56:35');
INSERT INTO `usuario` VALUES ('9', '1', 'tallulah castillo', 'tcastillo', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'quis.pede@tinciduntDonecvitae.', null, '3', '15', null, 'YYLVHtXL', null, null, null, '1', '1', '2020-08-21 00:56:36', '2020-08-21 00:56:36');
INSERT INTO `usuario` VALUES ('10', '1', 'kevin potts', 'kpotts', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'risus.at.fringilla@Donecest.co', null, '3', '16', null, 'V3ApziQt', null, null, null, '1', '1', '2020-08-21 00:56:36', '2020-08-21 00:56:36');
INSERT INTO `usuario` VALUES ('11', '1', 'tobias watson', 'twatson', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'velit.egestas.lacinia@In.edu', null, '3', '17', null, 'VoNhbnAE', null, null, null, '1', '1', '2020-08-21 00:56:37', '2020-08-21 00:56:37');
INSERT INTO `usuario` VALUES ('12', '1', 'bianca williamson', 'bwilliamson', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'feugiat.non@auctorvelit.org', null, '3', '18', null, '2lgCG2qQ', null, null, null, '1', '1', '2020-08-21 00:56:38', '2020-08-21 00:56:38');
INSERT INTO `usuario` VALUES ('13', '1', 'britanney stone', 'bstone', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'amet@fermentumarcuVestibulum.c', null, '3', '19', null, 'MpAAcU8W', null, null, null, '1', '1', '2020-08-21 00:56:38', '2020-08-21 00:56:38');
INSERT INTO `usuario` VALUES ('14', '1', 'destiny clemons', 'dclemons', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'facilisis.non.bibendum@vitae.e', null, '3', '20', null, 'ahybRLGs', null, null, null, '1', '1', '2020-08-21 00:56:39', '2020-08-21 00:56:39');
INSERT INTO `usuario` VALUES ('15', '1', 'thomas clemons', 'tclemons', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'Phasellus@Fusce.co.uk', null, '3', '21', null, 'XngCjOA3', null, null, null, '1', '1', '2020-08-21 00:56:39', '2020-08-21 00:56:39');
INSERT INTO `usuario` VALUES ('16', '1', 'cullen craig', 'ccraig', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'justo.eu.arcu@egetmassaSuspend', null, '3', '22', null, 'LcEI1ncg', null, null, null, '1', '1', '2020-08-21 00:56:40', '2020-08-21 00:56:40');
INSERT INTO `usuario` VALUES ('17', '1', 'sthephany rich', 'srich', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'dapibus.ligula@eudoloregestas.', null, '3', '23', null, 'EqP3zTEl', null, null, null, '1', '1', '2020-08-21 00:56:40', '2020-08-21 00:56:40');
INSERT INTO `usuario` VALUES ('18', '1', 'odessa larson', 'olarson', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'ipsum@vulputate.org', null, '3', '24', null, 'Krg8tT2w', null, null, null, '1', '1', '2020-08-21 00:56:41', '2020-08-21 00:56:41');
INSERT INTO `usuario` VALUES ('19', '1', 'jasmine downs', 'jdowns', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'Aliquam@consequatdolorvitae.or', null, '3', '25', null, 'ia3EMS7I', null, null, null, '1', '1', '2020-08-21 00:56:41', '2020-08-21 00:56:41');
INSERT INTO `usuario` VALUES ('20', '1', 'felicia hood', 'fhood', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'in.faucibus.orci@pellentesquea', null, '3', '26', null, '14o48MnU', null, null, null, '1', '1', '2020-08-21 00:56:41', '2020-08-21 00:56:41');
INSERT INTO `usuario` VALUES ('21', '1', 'otto moss', 'omoss', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'a.enim.Suspendisse@ategestas.c', null, '3', '27', null, 'lnMAuKIe', null, null, null, '1', '1', '2020-08-21 00:56:42', '2020-08-21 00:56:42');
INSERT INTO `usuario` VALUES ('22', '1', 'hashim campos', 'hcampos', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'diam.vel.arcu@arcuNunc.edu', null, '3', '28', null, 'vhOPY8lB', null, null, null, '1', '1', '2020-08-21 00:56:42', '2020-08-21 00:56:42');
INSERT INTO `usuario` VALUES ('23', '1', 'cassandra dominguez', 'cdominguez', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'iaculis.lacus.pede@Maecenasmal', null, '3', '29', null, 'frrnQpa0', null, null, null, '1', '1', '2020-08-21 00:56:43', '2020-08-21 00:56:43');
INSERT INTO `usuario` VALUES ('24', '1', 'amber best', 'abest', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'per.conubia@tristiquepellentes', null, '3', '30', null, 'zJH3mOhi', null, null, null, '1', '1', '2020-08-21 00:56:43', '2020-08-21 00:56:43');
INSERT INTO `usuario` VALUES ('25', '1', 'yvonne cox', 'ycox', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'mauris.sagittis.placerat@Namte', null, '3', '31', null, 'p8lc1Ykz', null, null, null, '1', '1', '2020-08-21 00:56:44', '2020-08-21 00:56:44');
INSERT INTO `usuario` VALUES ('26', '1', 'morgan pope', 'mpope', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'magna.Duis@nullaatsem.com', null, '3', '32', null, '9VVfKe0z', null, null, null, '1', '1', '2020-08-21 00:56:44', '2020-08-21 00:56:44');
INSERT INTO `usuario` VALUES ('27', '1', 'ashton ellis', 'aellis', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'Curabitur.ut.odio@diam.org', null, '3', '33', null, '5N42XVrh', null, null, null, '1', '1', '2020-08-21 00:56:45', '2020-08-21 00:56:45');
INSERT INTO `usuario` VALUES ('28', '1', 'autumn crane', 'acrane', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'Maecenas.malesuada@luctusetult', null, '3', '34', null, 't0yyeETu', null, null, null, '1', '1', '2020-08-21 00:56:45', '2020-08-21 00:56:45');
INSERT INTO `usuario` VALUES ('29', '1', 'norman carrillo', 'ncarrillo', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'vitae.risus@purusmaurisa.com', null, '3', '35', null, 'q7tQXT7w', null, null, null, '1', '1', '2020-08-21 00:56:46', '2020-08-21 00:56:46');
INSERT INTO `usuario` VALUES ('30', '1', 'kaseem vang', 'kvang', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'fringilla.ornare@elit.net', null, '3', '36', null, 'osFhxGFY', null, null, null, '1', '1', '2020-08-21 00:56:46', '2020-08-21 00:56:46');
INSERT INTO `usuario` VALUES ('31', '1', 'ruby phillips', 'rphillips', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'purus.Maecenas@mus.co.uk', null, '3', '37', null, 'n9N9nRBY', null, null, null, '1', '1', '2020-08-21 00:56:47', '2020-08-21 00:56:47');
INSERT INTO `usuario` VALUES ('32', '1', 'shafira mcknight', 'smcknight', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'Morbi@malesuadamalesuada.edu', null, '3', '38', null, 'FTgDLwCU', null, null, null, '1', '1', '2020-08-21 00:56:47', '2020-08-21 00:56:47');
INSERT INTO `usuario` VALUES ('33', '1', 'roth lucas', 'rlucas', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'vitae.purus@montesnasceturridi', null, '3', '39', null, 'SEcCJCzU', null, null, null, '1', '1', '2020-08-21 00:56:48', '2020-08-21 00:56:48');
INSERT INTO `usuario` VALUES ('34', '1', 'cooper welch', 'cwelch', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'Cras@arcuVestibulum.ca', null, '3', '40', null, '0mulgLqJ', null, null, null, '1', '1', '2020-08-21 00:56:48', '2020-08-21 00:56:48');
INSERT INTO `usuario` VALUES ('35', '1', 'keegan valenzuela', 'kvalenzuela', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'nulla.ante@eutellusPhasellus.c', null, '3', '41', null, 'CGyIr9Sd', null, null, null, '1', '1', '2020-08-21 00:56:49', '2020-08-21 00:56:49');
INSERT INTO `usuario` VALUES ('36', '1', 'alden morrison', 'amorrison', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'rutrum@estmollis.net', null, '3', '42', null, 'dRX5Nx0K', null, null, null, '1', '1', '2020-08-21 00:56:49', '2020-08-21 00:56:49');
INSERT INTO `usuario` VALUES ('37', '1', 'gary stein', 'gstein', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'Pellentesque.habitant.morbi@fe', null, '3', '43', null, '130K3p5I', null, null, null, '1', '1', '2020-08-21 00:56:49', '2020-08-21 00:56:49');
INSERT INTO `usuario` VALUES ('38', '1', 'aline burt', 'aburt', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'mi.Duis@maurissagittis.edu', null, '3', '44', null, 'sYE9jLOP', null, null, null, '1', '1', '2020-08-21 00:56:50', '2020-08-21 00:56:50');
INSERT INTO `usuario` VALUES ('39', '1', 'kimberly bartlett', 'kbartlett', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'ut.mi@ligulatortordictum.com', null, '3', '45', null, 'lEF4fueP', null, null, null, '1', '1', '2020-08-21 00:56:50', '2020-08-21 00:56:50');
INSERT INTO `usuario` VALUES ('40', '1', 'hedwig oneal', 'honeal', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'a.facilisis.non@dictumeu.edu', null, '3', '46', null, 'QA7gmiLI', null, null, null, '1', '1', '2020-08-21 00:56:51', '2020-08-21 00:56:51');
INSERT INTO `usuario` VALUES ('41', '1', 'olympia cummings', 'ocummings', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'sodales.Mauris@necante.edu', null, '3', '47', null, 'CviqYgjv', null, null, null, '1', '1', '2020-08-21 00:56:51', '2020-08-21 00:56:51');
INSERT INTO `usuario` VALUES ('42', '1', 'paloma may', 'pmay', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'enim.nisl@eros.org', null, '3', '48', null, 'om4IP2Fq', null, null, null, '1', '1', '2020-08-21 00:56:52', '2020-08-21 00:56:52');
INSERT INTO `usuario` VALUES ('43', '1', 'bruce riley', 'briley', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'pede.malesuada@nullavulputate.', null, '3', '49', null, 'B4qAQ0TP', null, null, null, '1', '1', '2020-08-21 00:56:52', '2020-08-21 00:56:52');
INSERT INTO `usuario` VALUES ('44', '1', 'finn knight', 'fknight', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'placerat@orciadipiscing.ca', null, '3', '50', null, '4PWXGbtI', null, null, null, '1', '1', '2020-08-21 00:56:52', '2020-08-21 00:56:52');
INSERT INTO `usuario` VALUES ('45', '1', 'nehru coffey', 'ncoffey', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'Sed.auctor.odio@Nullam.com', null, '3', '51', null, 'ZspijkgR', null, null, null, '1', '1', '2020-08-21 00:56:53', '2020-08-21 00:56:53');
INSERT INTO `usuario` VALUES ('46', '1', 'cairo saunders', 'csaunders', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'ullamcorper@Nulladignissim.co.', null, '3', '52', null, 'U4MUl9Ox', null, null, null, '1', '1', '2020-08-21 00:56:53', '2020-08-21 00:56:53');
INSERT INTO `usuario` VALUES ('47', '1', 'maite prince', 'mprince', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'orci.in.consequat@ipsumcursusv', null, '3', '53', null, 'Ouu3XC1t', null, null, null, '1', '1', '2020-08-21 00:56:54', '2020-08-21 00:56:54');
INSERT INTO `usuario` VALUES ('48', '1', 'blossom frye', 'bfrye', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'montes.nascetur@sapienCras.net', null, '3', '54', null, 'gLlES2pL', null, null, null, '1', '1', '2020-08-21 00:56:54', '2020-08-21 00:56:54');
INSERT INTO `usuario` VALUES ('49', '1', 'kirsten gillespie', 'kgillespie', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'ultricies.dignissim.lacus@Sed.', null, '3', '55', null, 'oxlECXPP', null, null, null, '1', '1', '2020-08-21 00:56:54', '2020-08-21 00:56:54');
INSERT INTO `usuario` VALUES ('50', '1', 'barrett reynolds', 'breynolds', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'interdum.Curabitur@natoque.co.', null, '3', '56', null, 'AKRefDju', null, null, null, '1', '1', '2020-08-21 00:56:55', '2020-08-21 00:56:55');
INSERT INTO `usuario` VALUES ('51', '1', 'benedict berry', 'bberry', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'ac.risus@viverra.co.uk', null, '3', '57', null, 'rPJPb5Zz', null, null, null, '1', '1', '2020-08-21 00:56:55', '2020-08-21 00:56:55');
INSERT INTO `usuario` VALUES ('52', '1', 'gail perkins', 'gperkins', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'ligula@etultrices.com', null, '3', '58', null, '2d6tadWK', null, null, null, '1', '1', '2020-08-21 00:56:56', '2020-08-21 00:56:56');
INSERT INTO `usuario` VALUES ('53', '1', 'amy horne', 'ahorne', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'Donec.tempor.est@NuncmaurisMor', null, '3', '59', null, 'GNnrWkrD', null, null, null, '1', '1', '2020-08-21 00:56:56', '2020-08-21 00:56:56');
INSERT INTO `usuario` VALUES ('54', '1', 'rajah cleveland', 'rcleveland', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'habitant.morbi@lobortismauris.', null, '3', '60', null, '7MowcdQm', null, null, null, '1', '1', '2020-08-21 00:56:57', '2020-08-21 00:56:57');
INSERT INTO `usuario` VALUES ('55', '1', 'kane sherman', 'ksherman', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'massa.Mauris.vestibulum@non.co', null, '3', '61', null, 'sd9qR2Ya', null, null, null, '1', '1', '2020-08-21 00:56:57', '2020-08-21 00:56:57');
INSERT INTO `usuario` VALUES ('56', '1', 'erica workman', 'eworkman', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'suscipit.nonummy.Fusce@consect', null, '3', '62', null, 'yzsQqUEM', null, null, null, '1', '1', '2020-08-21 00:56:58', '2020-08-21 00:56:58');
INSERT INTO `usuario` VALUES ('57', '1', 'hope burris', 'hburris', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'pede.nonummy.ut@rutrum.net', null, '3', '63', null, 'Rp9RkBE5', null, null, null, '1', '1', '2020-08-21 00:56:58', '2020-08-21 00:56:58');
INSERT INTO `usuario` VALUES ('58', '1', 'imani sutton', 'isutton', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'Donec.non.justo@sapienCrasdolo', null, '3', '64', null, 'usYdGy0x', null, null, null, '1', '1', '2020-08-21 00:56:58', '2020-08-21 00:56:58');
INSERT INTO `usuario` VALUES ('59', '1', 'dorothy mendoza', 'dmendoza', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'mattis.velit@aenim.ca', null, '3', '65', null, 'FQKo770n', null, null, null, '1', '1', '2020-08-21 00:56:59', '2020-08-21 00:56:59');
INSERT INTO `usuario` VALUES ('60', '1', 'kimberly hubbard', 'khubbard', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'Nulla@Suspendissealiquet.org', null, '3', '66', null, '1q7oPbBI', null, null, null, '1', '1', '2020-08-21 00:56:59', '2020-08-21 00:56:59');
INSERT INTO `usuario` VALUES ('61', '1', 'colt holder', 'cholder', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'eu.tellus@laoreetposuereenim.o', null, '3', '67', null, '4yzRcHZl', null, null, null, '1', '1', '2020-08-21 00:57:00', '2020-08-21 00:57:00');
INSERT INTO `usuario` VALUES ('62', '1', 'tatyana battle', 'tbattle', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'Integer.tincidunt@Nulla.ca', null, '3', '68', null, 'X4v0EpIW', null, null, null, '1', '1', '2020-08-21 00:57:00', '2020-08-21 00:57:00');
INSERT INTO `usuario` VALUES ('63', '1', 'india waters', 'iwaters', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'Suspendisse@Aliquam.edu', null, '3', '69', null, '2Zsb0iQl', null, null, null, '1', '1', '2020-08-21 00:57:00', '2020-08-21 00:57:00');
INSERT INTO `usuario` VALUES ('64', '1', 'stella lindsay', 'slindsay', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'enim.Etiam@atiaculis.com', null, '3', '70', null, 'lGGoZl6u', null, null, null, '1', '1', '2020-08-21 00:57:01', '2020-08-21 00:57:01');
INSERT INTO `usuario` VALUES ('65', '1', 'holly parks', 'hparks', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'pede.Nunc@Lorem.net', null, '3', '71', null, 'nnwCLUgc', null, null, null, '1', '1', '2020-08-21 00:57:01', '2020-08-21 00:57:01');
INSERT INTO `usuario` VALUES ('66', '1', 'isaac weaver', 'iweaver', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'nulla.Integer.vulputate@metus.', null, '3', '72', null, 'wfI41X3Q', null, null, null, '1', '1', '2020-08-21 00:57:02', '2020-08-21 00:57:02');
INSERT INTO `usuario` VALUES ('67', '1', 'sheila mejia', 'smejia', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'dis.parturient@scelerisquenequ', null, '3', '73', null, 'plOOlW0x', null, null, null, '1', '1', '2020-08-21 00:57:02', '2020-08-21 00:57:02');
INSERT INTO `usuario` VALUES ('68', '1', 'pearl beasley', 'pbeasley', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'ornare.lectus@sagittissemper.c', null, '3', '74', null, 'HqbnoKIH', null, null, null, '1', '1', '2020-08-21 00:57:03', '2020-08-21 00:57:03');
INSERT INTO `usuario` VALUES ('69', '1', 'yvonne logan', 'ylogan', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'ut.aliquam@necenim.ca', null, '3', '75', null, 'UM2yAz0v', null, null, null, '1', '1', '2020-08-21 00:57:03', '2020-08-21 00:57:03');
INSERT INTO `usuario` VALUES ('70', '1', 'micah mckenzie', 'mmckenzie', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'a.odio@faucibus.edu', null, '3', '76', null, 'FT8U1Djl', null, null, null, '1', '1', '2020-08-21 00:57:04', '2020-08-21 00:57:04');
INSERT INTO `usuario` VALUES ('71', '1', 'micah richardson', 'mrichardson', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'diam.lorem.auctor@justoeu.co.u', null, '3', '77', null, 'aiaEyU6V', null, null, null, '1', '1', '2020-08-21 00:57:04', '2020-08-21 00:57:04');
INSERT INTO `usuario` VALUES ('72', '1', 'steel jones', 'sjones', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'vel.pede.blandit@diamProindolo', null, '3', '78', null, 'mrtln3TV', null, null, null, '1', '1', '2020-08-21 00:57:04', '2020-08-21 00:57:04');
INSERT INTO `usuario` VALUES ('73', '1', 'zane dalton', 'zdalton', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'parturient.montes@consectetuer', null, '3', '79', null, 'qY76GHum', null, null, null, '1', '1', '2020-08-21 00:57:05', '2020-08-21 00:57:05');
INSERT INTO `usuario` VALUES ('74', '1', 'ryder cantrell', 'rcantrell', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'Curae@estNuncullamcorper.org', null, '3', '80', null, 'jT7sNQVr', null, null, null, '1', '1', '2020-08-21 00:57:05', '2020-08-21 00:57:05');
INSERT INTO `usuario` VALUES ('75', '1', 'tanner carey', 'tcarey', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'nec.mollis@inconsequat.co.uk', null, '3', '81', null, 'wCLmZV0X', null, null, null, '1', '1', '2020-08-21 00:57:06', '2020-08-21 00:57:06');
INSERT INTO `usuario` VALUES ('76', '1', 'germane tyler', 'gtyler', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'suscipit.est@dapibus.edu', null, '3', '82', null, 'LqGtyQy9', null, null, null, '1', '1', '2020-08-21 00:57:06', '2020-08-21 00:57:06');
INSERT INTO `usuario` VALUES ('77', '1', 'hayfa mosley', 'hmosley', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'Sed@Aenean.net', null, '3', '83', null, 'JTdDGPXy', null, null, null, '1', '1', '2020-08-21 00:57:07', '2020-08-21 00:57:07');
INSERT INTO `usuario` VALUES ('78', '1', 'adena delaney', 'adelaney', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'magna.tellus@morbitristiquesen', null, '3', '84', null, 'liCxaeoo', null, null, null, '1', '1', '2020-08-21 00:57:08', '2020-08-21 00:57:08');
INSERT INTO `usuario` VALUES ('79', '1', 'jael phelps', 'jphelps', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'accumsan.convallis@Aliquamgrav', null, '3', '85', null, 'VyLXL0hN', null, null, null, '1', '1', '2020-08-21 00:57:08', '2020-08-21 00:57:08');
INSERT INTO `usuario` VALUES ('80', '1', 'ulla finley', 'ufinley', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'elit.pretium.et@dolortempusnon', null, '3', '86', null, 'JwJc8IY7', null, null, null, '1', '1', '2020-08-21 00:57:08', '2020-08-21 00:57:08');
INSERT INTO `usuario` VALUES ('81', '1', 'rafael armstrong', 'rarmstrong', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'Suspendisse.sagittis@Proin.org', null, '3', '87', null, 'x4TaZZag', null, null, null, '1', '1', '2020-08-21 00:57:09', '2020-08-21 00:57:09');
INSERT INTO `usuario` VALUES ('82', '1', 'norman howard', 'nhoward', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'tempus@nascetur.edu', null, '3', '88', null, '0N95WN83', null, null, null, '1', '1', '2020-08-21 00:57:09', '2020-08-21 00:57:09');
INSERT INTO `usuario` VALUES ('83', '1', 'garrison blevins', 'gblevins', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'velit.Pellentesque@Loremipsum.', null, '3', '89', null, 'gdrO2Wpp', null, null, null, '1', '1', '2020-08-21 00:57:10', '2020-08-21 00:57:10');
INSERT INTO `usuario` VALUES ('84', '1', 'carolyn burns', 'cburns', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'eros@acturpis.net', null, '3', '90', null, 'UCvXZPuA', null, null, null, '1', '1', '2020-08-21 00:57:10', '2020-08-21 00:57:10');
INSERT INTO `usuario` VALUES ('85', '1', 'arsenio marquez', 'amarquez', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'eu.placerat@lectus.ca', null, '3', '91', null, 'gulGzxFN', null, null, null, '1', '1', '2020-08-21 00:57:11', '2020-08-21 00:57:11');
INSERT INTO `usuario` VALUES ('86', '1', 'rogan leblanc', 'rleblanc', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'malesuada.vel@felis.edu', null, '3', '92', null, 'qPvkpOqI', null, null, null, '1', '1', '2020-08-21 00:57:11', '2020-08-21 00:57:11');
INSERT INTO `usuario` VALUES ('87', '1', 'vivian noble', 'vnoble', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'aliquam.enim.nec@inceptos.com', null, '3', '93', null, 'CEW1uXsm', null, null, null, '1', '1', '2020-08-21 00:57:12', '2020-08-21 00:57:12');
INSERT INTO `usuario` VALUES ('88', '1', 'vielka collier', 'vcollier', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'sodales.Mauris@Loremipsumdolor', null, '3', '94', null, 'KQPxXzNs', null, null, null, '1', '1', '2020-08-21 00:57:12', '2020-08-21 00:57:12');
INSERT INTO `usuario` VALUES ('89', '1', 'breanna beach', 'bbeach', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'natoque.penatibus.et@luctusvul', null, '3', '95', null, 'oIlShlhr', null, null, null, '1', '1', '2020-08-21 00:57:13', '2020-08-21 00:57:13');
INSERT INTO `usuario` VALUES ('90', '1', 'rose stafford', 'rstafford', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'non.quam.Pellentesque@Vivamuse', null, '3', '96', null, 'z4AbEx7l', null, null, null, '1', '1', '2020-08-21 00:57:13', '2020-08-21 00:57:13');
INSERT INTO `usuario` VALUES ('91', '1', 'tad tucker', 'ttucker', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'ac@dui.co.uk', null, '3', '97', null, 'SEgo1L1g', null, null, null, '1', '1', '2020-08-21 00:57:14', '2020-08-21 00:57:14');
INSERT INTO `usuario` VALUES ('92', '1', 'gage sheppard', 'gsheppard', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'eu.tempor@Namligulaelit.edu', null, '3', '98', null, 'jbfoSaEL', null, null, null, '1', '1', '2020-08-21 00:57:14', '2020-08-21 00:57:14');
INSERT INTO `usuario` VALUES ('93', '1', 'darryl walter', 'dwalter', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'rutrum.eu@Nulla.co.uk', null, '3', '99', null, 'R3Zwx7Hl', null, null, null, '1', '1', '2020-08-21 00:57:15', '2020-08-21 00:57:15');
INSERT INTO `usuario` VALUES ('94', '1', 'mia morin', 'mmorin', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'gravida.mauris@Morbi.net', null, '3', '100', null, 'rSfVWFTP', null, null, null, '1', '1', '2020-08-21 00:57:15', '2020-08-21 00:57:15');
INSERT INTO `usuario` VALUES ('95', '1', 'miranda pena', 'mpena', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'tincidunt.nunc@nunc.edu', null, '3', '101', null, 'SPDihRF0', null, null, null, '1', '1', '2020-08-21 00:57:16', '2020-08-21 00:57:16');
INSERT INTO `usuario` VALUES ('96', '1', 'kimberly neal', 'kneal', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'augue.ac.ipsum@nequesed.org', null, '3', '102', null, 'r8d0WkIB', null, null, null, '1', '1', '2020-08-21 00:57:16', '2020-08-21 00:57:16');
INSERT INTO `usuario` VALUES ('97', '1', 'hu allen', 'hallen', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'amet@anunc.org', null, '3', '103', null, 'U1ZU3LRc', null, null, null, '1', '1', '2020-08-21 00:57:17', '2020-08-21 00:57:17');
INSERT INTO `usuario` VALUES ('98', '1', 'olympia sears', 'osears', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'nec.ante@nonluctussit.org', null, '3', '104', null, '6mAVXstA', null, null, null, '1', '1', '2020-08-21 00:57:17', '2020-08-21 00:57:17');
INSERT INTO `usuario` VALUES ('99', '1', 'dora ashley', 'dashley', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'Nulla@massaMauris.org', null, '3', '105', null, 'aIQRS6Y2', null, null, null, '1', '1', '2020-08-21 00:57:18', '2020-08-21 00:57:18');
INSERT INTO `usuario` VALUES ('100', '1', 'rafael thornton', 'rthornton', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'et@In.net', null, '3', '106', null, 'CkI6s6ty', null, null, null, '1', '1', '2020-08-21 00:57:18', '2020-08-21 00:57:18');
INSERT INTO `usuario` VALUES ('101', '1', 'zoe andrews', 'zandrews', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'lacinia.mattis@ac.edu', null, '3', '107', null, 'C42PbiMl', null, null, null, '1', '1', '2020-08-21 00:57:18', '2020-08-21 00:57:18');
INSERT INTO `usuario` VALUES ('102', '1', 'kaitlin rollins', 'krollins', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'Nunc.commodo@quislectus.edu', null, '3', '108', null, 'Y0IRfEOr', null, null, null, '1', '1', '2020-08-21 00:57:19', '2020-08-21 00:57:19');
INSERT INTO `usuario` VALUES ('103', '1', 'kelsey keller', 'kkeller', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'ultricies.ligula.Nullam@elitph', null, '3', '109', null, 'zxhr2mhc', null, null, null, '1', '1', '2020-08-21 00:57:20', '2020-08-21 00:57:20');
INSERT INTO `usuario` VALUES ('104', '1', 'yustiz luis', 'yluis', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'lyustiz@gmail.com', null, '2', '1', null, '9lRfdaVW', null, null, null, '1', '1', '2020-08-21 01:04:42', '2020-08-21 01:04:42');
INSERT INTO `usuario` VALUES ('105', '1', 'jose perez', 'jperez', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'dghsgf@gmail.com', null, '2', '2', null, '4rZHVT5h', null, null, null, '1', '1', '2020-08-21 01:04:43', '2020-08-21 01:04:43');
INSERT INTO `usuario` VALUES ('106', '1', 'cameron ryan', 'cryan', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'massa@non.ca', null, '2', '10', null, 'RGpz6QkJ', null, null, null, '1', '1', '2020-08-21 01:04:43', '2020-08-21 01:04:43');
INSERT INTO `usuario` VALUES ('107', '1', 'ciara pierce', 'cpierce', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'ornare.libero@ac.ca', null, '2', '11', null, 'xqFMcArf', null, null, null, '1', '1', '2020-08-21 01:04:44', '2020-08-21 01:04:44');
INSERT INTO `usuario` VALUES ('108', '1', 'kylan hopper', 'khopper', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'Donec@Aliquam.com', null, '2', '12', null, 'kjqLpenO', null, null, null, '1', '1', '2020-08-21 01:04:44', '2020-08-21 01:04:44');
INSERT INTO `usuario` VALUES ('109', '1', 'uriel bentley', 'ubentley', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'id.erat.Etiam@dui.net', null, '2', '13', null, 'pCVZJIdL', null, null, null, '1', '1', '2020-08-21 01:04:44', '2020-08-21 01:04:44');
INSERT INTO `usuario` VALUES ('110', '1', 'mercedes fitzgerald', 'mfitzgerald', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'Phasellus.nulla@etmagnis.edu', null, '2', '14', null, 'RPc4SJeV', null, null, null, '1', '1', '2020-08-21 01:04:45', '2020-08-21 01:04:45');
INSERT INTO `usuario` VALUES ('111', '1', 'kevin hewitt', 'khewitt', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'Sed.auctor@etlibero.co.uk', null, '2', '15', null, 'hcjapka2', null, null, null, '1', '1', '2020-08-21 01:04:45', '2020-08-21 01:04:45');
INSERT INTO `usuario` VALUES ('112', '1', 'philip spencer', 'pspencer', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'blandit.mattis.Cras@leoVivamus', null, '2', '16', null, 'NPKtPUnr', null, null, null, '1', '1', '2020-08-21 01:04:46', '2020-08-21 01:04:46');
INSERT INTO `usuario` VALUES ('113', '1', 'wendy finley', 'wfinley', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'mollis@dis.edu', null, '2', '17', null, '9SyqGCsE', null, null, null, '1', '1', '2020-08-21 01:04:46', '2020-08-21 01:04:46');
INSERT INTO `usuario` VALUES ('114', '1', 'kieran molina', 'kmolina', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'ligula@utaliquam.edu', null, '2', '18', null, 'dCOF2yQ1', null, null, null, '1', '1', '2020-08-21 01:04:47', '2020-08-21 01:04:47');
INSERT INTO `usuario` VALUES ('115', '1', 'olga merrill', 'omerrill', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'amet@nulla.com', null, '2', '19', null, 'ZnQ5lYpt', null, null, null, '1', '1', '2020-08-21 01:04:47', '2020-08-21 01:04:47');
INSERT INTO `usuario` VALUES ('116', '1', 'helen manning', 'hmanning', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'Lorem@antedictum.org', null, '2', '20', null, 'ZbAW7tMB', null, null, null, '1', '1', '2020-08-21 01:04:48', '2020-08-21 01:04:48');
INSERT INTO `usuario` VALUES ('117', '1', 'kalia abbott', 'kabbott', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'pede.blandit@ipsumCurabitur.ed', null, '2', '21', null, 'kw9Qip2Z', null, null, null, '1', '1', '2020-08-21 01:04:48', '2020-08-21 01:04:48');
INSERT INTO `usuario` VALUES ('118', '1', 'joan white', 'jwhite', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'consectetuer@luctusipsum.co.uk', null, '2', '22', null, 'IQTbqvt4', null, null, null, '1', '1', '2020-08-21 01:04:49', '2020-08-21 01:04:49');
INSERT INTO `usuario` VALUES ('119', '1', 'travis brewer', 'tbrewer', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'libero.Morbi.accumsan@duiFusce', null, '2', '23', null, '7N1q6fPr', null, null, null, '1', '1', '2020-08-21 01:04:49', '2020-08-21 01:04:49');
INSERT INTO `usuario` VALUES ('120', '1', 'melanie santana', 'msantana', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'Nam.interdum.enim@orciinconseq', null, '2', '24', null, '3hDsvWNY', null, null, null, '1', '1', '2020-08-21 01:04:49', '2020-08-21 01:04:49');
INSERT INTO `usuario` VALUES ('121', '1', 'paula wilkerson', 'pwilkerson', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'non.lacinia.at@vel.org', null, '2', '25', null, 'JMjCFtBO', null, null, null, '1', '1', '2020-08-21 01:04:50', '2020-08-21 01:04:50');
INSERT INTO `usuario` VALUES ('122', '1', 'kaitlin byers', 'kbyers', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'a.auctor@tinciduntorciquis.co.', null, '2', '26', null, 'YWaF6D1W', null, null, null, '1', '1', '2020-08-21 01:04:51', '2020-08-21 01:04:51');
INSERT INTO `usuario` VALUES ('123', '1', 'virginia terrell', 'vterrell', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'Phasellus.in.felis@neque.net', null, '2', '27', null, 'XvE3oBKX', null, null, null, '1', '1', '2020-08-21 01:04:51', '2020-08-21 01:04:51');
INSERT INTO `usuario` VALUES ('124', '1', 'lester bishop', 'lbishop', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'ipsum.dolor@massarutrum.net', null, '2', '28', null, 'l4XuZFT7', null, null, null, '1', '1', '2020-08-21 01:04:52', '2020-08-21 01:04:52');
INSERT INTO `usuario` VALUES ('125', '1', 'hakeem puckett', 'hpuckett', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'auctor.nunc@amet.org', null, '2', '29', null, 'w2Bvrwls', null, null, null, '1', '1', '2020-08-21 01:04:52', '2020-08-21 01:04:52');
INSERT INTO `usuario` VALUES ('126', '1', 'maggie walsh', 'mwalsh', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'mi.tempor.lorem@etultrices.com', null, '2', '30', null, '6uBAsldm', null, null, null, '1', '1', '2020-08-21 01:04:53', '2020-08-21 01:04:53');
INSERT INTO `usuario` VALUES ('127', '1', 'yvette bowen', 'ybowen', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'ullamcorper.magna.Sed@Seddictu', null, '2', '31', null, 'Z57bLEiF', null, null, null, '1', '1', '2020-08-21 01:04:53', '2020-08-21 01:04:53');
INSERT INTO `usuario` VALUES ('128', '1', 'stuart mckee', 'smckee', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'Vivamus@Sedmalesuadaaugue.com', null, '2', '32', null, '940AhfdS', null, null, null, '1', '1', '2020-08-21 01:04:53', '2020-08-21 01:04:53');
INSERT INTO `usuario` VALUES ('129', '1', 'vernon spears', 'vspears', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'feugiat.placerat.velit@enim.ne', null, '2', '33', null, 'gWv7oaQK', null, null, null, '1', '1', '2020-08-21 01:04:54', '2020-08-21 01:04:54');
INSERT INTO `usuario` VALUES ('130', '1', 'kylie montoya', 'kmontoya', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'ac@auctor.net', null, '2', '34', null, '2KD27ewg', null, null, null, '1', '1', '2020-08-21 01:04:54', '2020-08-21 01:04:54');
INSERT INTO `usuario` VALUES ('131', '1', 'marshall castillo', 'mcastillo', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'orci@vulputatelacus.net', null, '2', '35', null, 'WQUQj5QM', null, null, null, '1', '1', '2020-08-21 01:04:55', '2020-08-21 01:04:55');
INSERT INTO `usuario` VALUES ('132', '1', 'cleo vargas', 'cvargas', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'a.enim@ullamcorper.org', null, '2', '36', null, 'URiw6iqU', null, null, null, '1', '1', '2020-08-21 01:04:55', '2020-08-21 01:04:55');
INSERT INTO `usuario` VALUES ('133', '1', 'anthony russell', 'arussell', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'nunc.sit@libero.com', null, '2', '37', null, '9VSRNDHT', null, null, null, '1', '1', '2020-08-21 01:04:56', '2020-08-21 01:04:56');
INSERT INTO `usuario` VALUES ('134', '1', 'hanae brennan', 'hbrennan', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'Donec@nonlobortis.org', null, '2', '38', null, 'X7SCBpdW', null, null, null, '1', '1', '2020-08-21 01:04:56', '2020-08-21 01:04:56');
INSERT INTO `usuario` VALUES ('135', '1', 'lilah garcia', 'lgarcia', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'Duis@euismodmauris.net', null, '2', '39', null, 'tk9nzY9x', null, null, null, '1', '1', '2020-08-21 01:04:57', '2020-08-21 01:04:57');
INSERT INTO `usuario` VALUES ('136', '1', 'honorato merrill', 'hmerrill', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'parturient.montes.nascetur@ide', null, '2', '40', null, 'Z29sGxYt', null, null, null, '1', '1', '2020-08-21 01:04:57', '2020-08-21 01:04:57');
INSERT INTO `usuario` VALUES ('137', '1', 'clare leonard', 'cleonard', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'justo@loremvitaeodio.co.uk', null, '2', '41', null, 'I4Sokd5L', null, null, null, '1', '1', '2020-08-21 01:04:58', '2020-08-21 01:04:58');
INSERT INTO `usuario` VALUES ('138', '1', 'lucian barnes', 'lbarnes', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'nonummy.ultricies@euismodestar', null, '2', '42', null, 'kH1mPNgP', null, null, null, '1', '1', '2020-08-21 01:04:58', '2020-08-21 01:04:58');
INSERT INTO `usuario` VALUES ('139', '1', 'sara hudson', 'shudson', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'lorem@idnuncinterdum.com', null, '2', '43', null, 'zzyZYSSJ', null, null, null, '1', '1', '2020-08-21 01:04:59', '2020-08-21 01:04:59');
INSERT INTO `usuario` VALUES ('140', '1', 'leigh duran', 'lduran', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'amet.ornare@ornare.ca', null, '2', '44', null, 'yGbgqe4a', null, null, null, '1', '1', '2020-08-21 01:04:59', '2020-08-21 01:04:59');
INSERT INTO `usuario` VALUES ('141', '1', 'penelope hicks', 'phicks', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'Aliquam.erat@lobortis.edu', null, '2', '45', null, '8XvnWXGb', null, null, null, '1', '1', '2020-08-21 01:05:00', '2020-08-21 01:05:00');
INSERT INTO `usuario` VALUES ('142', '1', 'omar hanson', 'ohanson', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'ante.iaculis@lacinia.org', null, '2', '46', null, '7EKv3dyg', null, null, null, '1', '1', '2020-08-21 01:05:00', '2020-08-21 01:05:00');
INSERT INTO `usuario` VALUES ('143', '1', 'xantha mckinney', 'xmckinney', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'massa@sit.edu', null, '2', '47', null, 'sxQP3jL0', null, null, null, '1', '1', '2020-08-21 01:05:01', '2020-08-21 01:05:01');
INSERT INTO `usuario` VALUES ('144', '1', 'upton miller', 'umiller', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'quis.arcu@in.edu', null, '2', '48', null, 'DJAu7PHJ', null, null, null, '1', '1', '2020-08-21 01:05:01', '2020-08-21 01:05:01');
INSERT INTO `usuario` VALUES ('145', '1', 'nayda sykes', 'nsykes', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'ut@acsem.ca', null, '2', '49', null, '88EUYrbD', null, null, null, '1', '1', '2020-08-21 01:05:02', '2020-08-21 01:05:02');
INSERT INTO `usuario` VALUES ('146', '1', 'hermione mccarty', 'hmccarty', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'tellus.lorem@eratEtiamvestibul', null, '2', '50', null, 'gLYIe4xm', null, null, null, '1', '1', '2020-08-21 01:05:02', '2020-08-21 01:05:02');
INSERT INTO `usuario` VALUES ('147', '1', 'finn craft', 'fcraft', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'mollis.Phasellus@elementumat.c', null, '2', '51', null, 'EoyTq00U', null, null, null, '1', '1', '2020-08-21 01:05:03', '2020-08-21 01:05:03');
INSERT INTO `usuario` VALUES ('148', '1', 'natalie beard', 'nbeard', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'dictum@eget.ca', null, '2', '52', null, 'rUM7cBtk', null, null, null, '1', '1', '2020-08-21 01:05:03', '2020-08-21 01:05:03');
INSERT INTO `usuario` VALUES ('149', '1', 'sylvester thornton', 'sthornton', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'lacus.Mauris@sodalespurusin.or', null, '2', '53', null, 'mfcPgtG9', null, null, null, '1', '1', '2020-08-21 01:05:04', '2020-08-21 01:05:04');
INSERT INTO `usuario` VALUES ('150', '1', 'olympia skinner', 'oskinner', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'mauris.Integer.sem@acipsumPhas', null, '2', '54', null, 'Xb2orKDk', null, null, null, '1', '1', '2020-08-21 01:05:04', '2020-08-21 01:05:04');
INSERT INTO `usuario` VALUES ('151', '1', 'kameko chandler', 'kchandler', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'Quisque@convallis.ca', null, '2', '55', null, 'cnL8UcVa', null, null, null, '1', '1', '2020-08-21 01:05:05', '2020-08-21 01:05:05');
INSERT INTO `usuario` VALUES ('152', '1', 'wendy morales', 'wmorales', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'luctus.Curabitur.egestas@purus', null, '2', '56', null, 'cxBpYQyH', null, null, null, '1', '1', '2020-08-21 01:05:05', '2020-08-21 01:05:05');
INSERT INTO `usuario` VALUES ('153', '1', 'wyatt oneal', 'woneal', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'eu@interdumlibero.com', null, '2', '57', null, 'ZxQn9xpE', null, null, null, '1', '1', '2020-08-21 01:05:06', '2020-08-21 01:05:06');
INSERT INTO `usuario` VALUES ('154', '1', 'marsden gonzales', 'mgonzales', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'dolor.egestas@mattis.net', null, '2', '58', null, 'oR8TCJrM', null, null, null, '1', '1', '2020-08-21 01:05:06', '2020-08-21 01:05:06');
INSERT INTO `usuario` VALUES ('155', '1', 'whilemina snow', 'wsnow', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'amet@dolorelit.org', null, '2', '59', null, 'YsL6fiBs', null, null, null, '1', '1', '2020-08-21 01:05:07', '2020-08-21 01:05:07');
INSERT INTO `usuario` VALUES ('156', '1', 'indira butler', 'ibutler', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'Morbi@etipsum.net', null, '2', '60', null, 'V2lMplJa', null, null, null, '1', '1', '2020-08-21 01:05:07', '2020-08-21 01:05:07');
INSERT INTO `usuario` VALUES ('157', '1', 'linda mckenzie', 'lmckenzie', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'Nunc.ut@porttitorerosnec.co.uk', null, '2', '61', null, '1RCPnu5f', null, null, null, '1', '1', '2020-08-21 01:05:08', '2020-08-21 01:05:08');
INSERT INTO `usuario` VALUES ('158', '1', 'lionel schmidt', 'lschmidt', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'ridiculus.mus.Donec@rutrumnonh', null, '2', '62', null, 'MKjaGAZ6', null, null, null, '1', '1', '2020-08-21 01:05:08', '2020-08-21 01:05:08');
INSERT INTO `usuario` VALUES ('159', '1', 'david downs', 'ddowns', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'amet@metus.org', null, '2', '63', null, 'jWDJmBPO', null, null, null, '1', '1', '2020-08-21 01:05:09', '2020-08-21 01:05:09');
INSERT INTO `usuario` VALUES ('160', '1', 'stacey hahn', 'shahn', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'Pellentesque.ut.ipsum@loremtri', null, '2', '64', null, 'w2eXfbil', null, null, null, '1', '1', '2020-08-21 01:05:09', '2020-08-21 01:05:09');
INSERT INTO `usuario` VALUES ('161', '1', 'simon fitzpatrick', 'sfitzpatrick', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'interdum.Sed.auctor@est.com', null, '2', '65', null, 'oDybxnAs', null, null, null, '1', '1', '2020-08-21 01:05:10', '2020-08-21 01:05:10');
INSERT INTO `usuario` VALUES ('162', '1', 'kane lancaster', 'klancaster', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'ornare.egestas@dapibusquam.net', null, '2', '66', null, 'bWEuo4Ph', null, null, null, '1', '1', '2020-08-21 01:05:10', '2020-08-21 01:05:10');
INSERT INTO `usuario` VALUES ('163', '1', 'kiara boone', 'kboone', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'id.libero@orcilacus.net', null, '2', '67', null, 'Na1vVpWJ', null, null, null, '1', '1', '2020-08-21 01:05:11', '2020-08-21 01:05:11');
INSERT INTO `usuario` VALUES ('164', '1', 'kylie keller', 'kskeller', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'quam@ultriciesadipiscing.edu', null, '2', '68', null, 'jW0SuiKA', null, null, null, '1', '1', '2020-08-21 01:05:11', '2020-08-21 01:05:11');
INSERT INTO `usuario` VALUES ('165', '1', 'jackson mcintyre', 'jmcintyre', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'tellus.lorem@ascelerisque.edu', null, '2', '69', null, '9bxhOwUM', null, null, null, '1', '1', '2020-08-21 01:05:12', '2020-08-21 01:05:12');
INSERT INTO `usuario` VALUES ('166', '1', 'nathan spence', 'nspence', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'sed.dui@loremluctus.com', null, '2', '70', null, 'fPJ0TaNz', null, null, null, '1', '1', '2020-08-21 01:05:12', '2020-08-21 01:05:12');
INSERT INTO `usuario` VALUES ('167', '1', 'zenia hensley', 'zhensley', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'justo.faucibus.lectus@egetmagn', null, '2', '71', null, 'FQD5cqiC', null, null, null, '1', '1', '2020-08-21 01:05:13', '2020-08-21 01:05:13');
INSERT INTO `usuario` VALUES ('168', '1', 'kameko robbins', 'krobbins', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'magna.a@Quisquetinciduntpede.c', null, '2', '72', null, 'P7FcFzPV', null, null, null, '1', '1', '2020-08-21 01:05:13', '2020-08-21 01:05:13');
INSERT INTO `usuario` VALUES ('169', '1', 'ella vaughn', 'evaughn', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'Etiam@semconsequatnec.ca', null, '2', '73', null, '3tF07NMX', null, null, null, '1', '1', '2020-08-21 01:05:14', '2020-08-21 01:05:14');
INSERT INTO `usuario` VALUES ('170', '1', 'declan compton', 'dcompton', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'urna.Nullam.lobortis@urnaet.co', null, '2', '74', null, 'Vm7z1xgc', null, null, null, '1', '1', '2020-08-21 01:05:14', '2020-08-21 01:05:14');
INSERT INTO `usuario` VALUES ('171', '1', 'penelope ray', 'pray', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'odio@dictum.org', null, '2', '75', null, 'OC6scjPZ', null, null, null, '1', '1', '2020-08-21 01:05:15', '2020-08-21 01:05:15');
INSERT INTO `usuario` VALUES ('172', '1', 'willa brennan', 'wbrennan', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'dapibus.ligula.Aliquam@maurisb', null, '2', '76', null, '32OZa6WK', null, null, null, '1', '1', '2020-08-21 01:05:15', '2020-08-21 01:05:15');
INSERT INTO `usuario` VALUES ('173', '1', 'jonas brewer', 'jbrewer', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'ut.aliquam.iaculis@Inornaresag', null, '2', '77', null, 'f3uTP55t', null, null, null, '1', '1', '2020-08-21 01:05:16', '2020-08-21 01:05:16');
INSERT INTO `usuario` VALUES ('174', '1', 'harriet yates', 'hyates', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'orci.adipiscing@magnisdispartu', null, '2', '78', null, 'PivX8DOh', null, null, null, '1', '1', '2020-08-21 01:05:16', '2020-08-21 01:05:16');
INSERT INTO `usuario` VALUES ('175', '1', 'dorothy shaffer', 'dshaffer', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'Cras.lorem.lorem@convallisconv', null, '2', '79', null, 'zg1d2V92', null, null, null, '1', '1', '2020-08-21 01:05:17', '2020-08-21 01:05:17');
INSERT INTO `usuario` VALUES ('176', '1', 'thomas odom', 'todom', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'urna.Nunc@justo.ca', null, '2', '80', null, 'S4B74K1H', null, null, null, '1', '1', '2020-08-21 01:05:17', '2020-08-21 01:05:17');
INSERT INTO `usuario` VALUES ('177', '1', 'paul gilliam', 'pgilliam', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'Donec@liberonec.edu', null, '2', '81', null, '59ZKepkk', null, null, null, '1', '1', '2020-08-21 01:05:18', '2020-08-21 01:05:18');
INSERT INTO `usuario` VALUES ('178', '1', 'michael larsen', 'mlarsen', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'sem@Integermollis.com', null, '2', '82', null, 'A9t3mzFQ', null, null, null, '1', '1', '2020-08-21 01:05:18', '2020-08-21 01:05:18');
INSERT INTO `usuario` VALUES ('179', '1', 'francesca leonard', 'fleonard', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'nec@Morbiquisurna.org', null, '2', '83', null, 'ePiWhsdL', null, null, null, '1', '1', '2020-08-21 01:05:19', '2020-08-21 01:05:19');
INSERT INTO `usuario` VALUES ('180', '1', 'matthew whitley', 'mwhitley', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'ipsum@ut.ca', null, '2', '84', null, '6ghnN0wy', null, null, null, '1', '1', '2020-08-21 01:05:19', '2020-08-21 01:05:19');
INSERT INTO `usuario` VALUES ('181', '1', 'malachi foster', 'mfoster', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'egestas.urna.justo@lobortisult', null, '2', '85', null, 'NFdMBC5x', null, null, null, '1', '1', '2020-08-21 01:05:19', '2020-08-21 01:05:19');
INSERT INTO `usuario` VALUES ('182', '1', 'hanna black', 'hblack', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'Nunc.commodo.auctor@nonummy.or', null, '2', '86', null, '4z2i4oY3', null, null, null, '1', '1', '2020-08-21 01:05:20', '2020-08-21 01:05:20');
INSERT INTO `usuario` VALUES ('183', '1', 'adele summers', 'asummers', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'in@Phasellus.ca', null, '2', '87', null, 'AtadzuU7', null, null, null, '1', '1', '2020-08-21 01:05:20', '2020-08-21 01:05:20');
INSERT INTO `usuario` VALUES ('184', '1', 'jasmine contreras', 'jcontreras', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'ut.nisi@nullaatsem.com', null, '2', '88', null, 'Mdvw5NWE', null, null, null, '1', '1', '2020-08-21 01:05:21', '2020-08-21 01:05:21');
INSERT INTO `usuario` VALUES ('185', '1', 'mariko floyd', 'mfloyd', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'lobortis.nisi@quisarcu.org', null, '2', '89', null, 'iNaOiHW6', null, null, null, '1', '1', '2020-08-21 01:05:21', '2020-08-21 01:05:21');
INSERT INTO `usuario` VALUES ('186', '1', 'damon warren', 'dwarren', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'sapien@MaurismagnaDuis.com', null, '2', '90', null, 'AA40Ga1j', null, null, null, '1', '1', '2020-08-21 01:05:22', '2020-08-21 01:05:22');
INSERT INTO `usuario` VALUES ('187', '1', 'micah weber', 'mweber', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'ante@antedictum.net', null, '2', '91', null, 'F94k1DSy', null, null, null, '1', '1', '2020-08-21 01:05:22', '2020-08-21 01:05:22');
INSERT INTO `usuario` VALUES ('188', '1', 'erica hutchinson', 'ehutchinson', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'justo.Praesent@massalobortis.e', null, '2', '92', null, 'DuNsaRJ0', null, null, null, '1', '1', '2020-08-21 01:05:23', '2020-08-21 01:05:23');
INSERT INTO `usuario` VALUES ('189', '1', 'dahlia torres', 'dtorres', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'Proin@Quisque.com', null, '2', '93', null, '4DAanCog', null, null, null, '1', '1', '2020-08-21 01:05:23', '2020-08-21 01:05:23');
INSERT INTO `usuario` VALUES ('190', '1', 'carter richards', 'crichards', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'nisi.a@rutrumjustoPraesent.com', null, '2', '94', null, 'x8rxS2j6', null, null, null, '1', '1', '2020-08-21 01:05:24', '2020-08-21 01:05:24');
INSERT INTO `usuario` VALUES ('191', '1', 'ila ellison', 'iellison', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'vestibulum.lorem.sit@Suspendis', null, '2', '95', null, 'UKlNJIJ1', null, null, null, '1', '1', '2020-08-21 01:05:24', '2020-08-21 01:05:24');
INSERT INTO `usuario` VALUES ('192', '1', 'iris moreno', 'imoreno', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'magna.Phasellus.dolor@egestas.', null, '2', '96', null, 'Vwzrw5zw', null, null, null, '1', '1', '2020-08-21 01:05:25', '2020-08-21 01:05:25');
INSERT INTO `usuario` VALUES ('193', '1', 'cara adkins', 'cadkins', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'tempus.eu@sitamet.ca', null, '2', '97', null, 'u7VBv0By', null, null, null, '1', '1', '2020-08-21 01:05:25', '2020-08-21 01:05:25');
INSERT INTO `usuario` VALUES ('194', '1', 'jared cain', 'jcain', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'Ut@ligulaNullam.ca', null, '2', '98', null, 'PRYGywYw', null, null, null, '1', '1', '2020-08-21 01:05:26', '2020-08-21 01:05:26');
INSERT INTO `usuario` VALUES ('195', '1', 'pamela tyler', 'ptyler', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'ante.bibendum.ullamcorper@vehi', null, '2', '99', null, 'PeaafiQ0', null, null, null, '1', '1', '2020-08-21 01:05:26', '2020-08-21 01:05:26');
INSERT INTO `usuario` VALUES ('196', '1', 'ahmed meyer', 'ameyer', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'sollicitudin.orci.sem@mi.com', null, '2', '100', null, 'SCew7ftv', null, null, null, '1', '1', '2020-08-21 01:05:27', '2020-08-21 01:05:27');
INSERT INTO `usuario` VALUES ('197', '1', 'zia hampton', 'zhampton', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'eleifend.non@vehicula.org', null, '2', '101', null, 'CRPBDCzM', null, null, null, '1', '1', '2020-08-21 01:05:27', '2020-08-21 01:05:27');
INSERT INTO `usuario` VALUES ('198', '1', 'patrick jensen', 'pjensen', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'arcu.ac@erat.net', null, '2', '102', null, 'SKJJs0Il', null, null, null, '1', '1', '2020-08-21 01:05:28', '2020-08-21 01:05:28');
INSERT INTO `usuario` VALUES ('199', '1', 'fulton cole', 'fcole', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'sollicitudin.orci.sem@Aliquam.', null, '2', '103', null, 'dZ8d6Y4s', null, null, null, '1', '1', '2020-08-21 01:05:28', '2020-08-21 01:05:28');
INSERT INTO `usuario` VALUES ('200', '1', 'brielle melendez', 'bmelendez', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'Duis.a@nibhAliquam.co.uk', null, '2', '104', null, '6LQifIBM', null, null, null, '1', '1', '2020-08-21 01:05:29', '2020-08-21 01:05:29');
INSERT INTO `usuario` VALUES ('201', '1', 'lavinia robles', 'lrobles', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'adipiscing@montesnasceturridic', null, '2', '105', null, '20IKZygK', null, null, null, '1', '1', '2020-08-21 01:05:29', '2020-08-21 01:05:29');
INSERT INTO `usuario` VALUES ('202', '1', 'shad olsen', 'solsen', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'aliquet.Phasellus.fermentum@Ae', null, '2', '106', null, 'tR9tiobF', null, null, null, '1', '1', '2020-08-21 01:05:30', '2020-08-21 01:05:30');
INSERT INTO `usuario` VALUES ('203', '1', 'hanae boyer', 'hboyer', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'augue.porttitor.interdum@nunc.', null, '2', '107', null, 'Q4REWW6h', null, null, null, '1', '1', '2020-08-21 01:05:30', '2020-08-21 01:05:30');
INSERT INTO `usuario` VALUES ('204', '1', 'sloane gordon', 'sgordon', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'massa@sitametdapibus.co.uk', null, '2', '108', null, '79WSIjBG', null, null, null, '1', '1', '2020-08-21 01:05:30', '2020-08-21 01:05:30');
INSERT INTO `usuario` VALUES ('205', '1', 'brittany nelson', 'bnelson', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'tempus.risus@accumsan.co.uk', null, '2', '109', null, 'unfSQ894', null, null, null, '1', '1', '2020-08-21 01:05:31', '2020-08-21 01:05:31');
INSERT INTO `usuario` VALUES ('206', '1', 'juan medina', 'jmedina', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'lyustiz@gmail.com', null, '4', '1', null, 'tH8uFv3C', null, null, null, '1', '1', '2020-08-21 01:48:32', '2020-08-21 01:48:32');
INSERT INTO `usuario` VALUES ('207', '1', 'grant holmes', 'gholmes', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'Nunc.ac.sem@inaliquet.net', null, '4', '10', null, 'Z1Rl2DSC', null, null, null, '1', '1', '2020-08-21 01:48:32', '2020-08-21 01:48:32');
INSERT INTO `usuario` VALUES ('208', '1', 'cally orr', 'corr', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'libero.est.congue@quam.com', null, '4', '11', null, '2owHR4XY', null, null, null, '1', '1', '2020-08-21 01:48:33', '2020-08-21 01:48:33');
INSERT INTO `usuario` VALUES ('209', '1', 'illiana robles', 'irobles', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'dolor.dapibus.gravida@nonsolli', null, '4', '12', null, 'hElFhD9e', null, null, null, '1', '1', '2020-08-21 01:48:33', '2020-08-21 01:48:33');
INSERT INTO `usuario` VALUES ('210', '1', 'isaac carroll', 'icarroll', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'rutrum@elementumpurusaccumsan.', null, '4', '13', null, '9ciMi6FH', null, null, null, '1', '1', '2020-08-21 01:48:34', '2020-08-21 01:48:34');
INSERT INTO `usuario` VALUES ('211', '1', 'preston waller', 'pwaller', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'commodo@scelerisquenequesed.ed', null, '4', '14', null, '0MrzzeU2', null, null, null, '1', '1', '2020-08-21 01:48:34', '2020-08-21 01:48:34');
INSERT INTO `usuario` VALUES ('212', '1', 'arden holloway', 'alholloway', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'Nulla.semper.tellus@blandit.co', null, '4', '15', null, 'vgfrqwvd', null, null, null, '1', '1', '2020-08-21 01:48:35', '2020-08-21 01:48:35');
INSERT INTO `usuario` VALUES ('213', '1', 'keelie chapman', 'kchapman', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'non.luctus.sit@mollisnoncursus', null, '4', '16', null, '5PVy3C3r', null, null, null, '1', '1', '2020-08-21 01:48:35', '2020-08-21 01:48:35');
INSERT INTO `usuario` VALUES ('214', '1', 'reece hines', 'rhines', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'est.Nunc@necluctusfelis.ca', null, '4', '17', null, 'ydinGVae', null, null, null, '1', '1', '2020-08-21 01:48:35', '2020-08-21 01:48:35');
INSERT INTO `usuario` VALUES ('215', '1', 'veda lindsay', 'vlindsay', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'malesuada@atvelit.co.uk', null, '4', '18', null, 'RnyCn6DG', null, null, null, '1', '1', '2020-08-21 01:48:36', '2020-08-21 01:48:36');
INSERT INTO `usuario` VALUES ('216', '1', 'lewis maynard', 'lmaynard', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'scelerisque@necurnaet.net', null, '4', '19', null, 'MldxadWS', null, null, null, '1', '1', '2020-08-21 01:48:36', '2020-08-21 01:48:36');
INSERT INTO `usuario` VALUES ('217', '1', 'laura kennedy', 'lkennedy', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'a.auctor.non@dui.org', null, '4', '20', null, 'miKLUwu2', null, null, null, '1', '1', '2020-08-21 01:48:37', '2020-08-21 01:48:37');
INSERT INTO `usuario` VALUES ('218', '1', 'cynthia valentine', 'cvalentine', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'nec@lacusCrasinterdum.org', null, '4', '21', null, 'OzNO3ugg', null, null, null, '1', '1', '2020-08-21 01:48:37', '2020-08-21 01:48:37');
INSERT INTO `usuario` VALUES ('219', '1', 'denise joyce', 'djoyce', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'Donec@elit.net', null, '4', '22', null, 'JT8iTFx3', null, null, null, '1', '1', '2020-08-21 01:48:38', '2020-08-21 01:48:38');
INSERT INTO `usuario` VALUES ('220', '1', 'tanner lyons', 'tlyons', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'velit@tincidunt.ca', null, '4', '23', null, 'IkKmRJVp', null, null, null, '1', '1', '2020-08-21 01:48:38', '2020-08-21 01:48:38');
INSERT INTO `usuario` VALUES ('221', '1', 'blaine lopez', 'blopez', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'at.auctor.ullamcorper@felispur', null, '4', '24', null, 'cWDMgtKU', null, null, null, '1', '1', '2020-08-21 01:48:39', '2020-08-21 01:48:39');
INSERT INTO `usuario` VALUES ('222', '1', 'kato giles', 'kgiles', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'ante@Sedet.edu', null, '4', '25', null, 'ESqr4lH7', null, null, null, '1', '1', '2020-08-21 01:48:39', '2020-08-21 01:48:39');
INSERT INTO `usuario` VALUES ('223', '1', 'ciaran patrick', 'cpatrick', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'Cras.eu.tellus@tellusAenean.co', null, '4', '26', null, '5Ad8cZ97', null, null, null, '1', '1', '2020-08-21 01:48:40', '2020-08-21 01:48:40');
INSERT INTO `usuario` VALUES ('224', '1', 'abra hebert', 'ahebert', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'nec.cursus@seddictum.edu', null, '4', '27', null, '5k4C9DeC', null, null, null, '1', '1', '2020-08-21 01:48:40', '2020-08-21 01:48:40');
INSERT INTO `usuario` VALUES ('225', '1', 'oprah waters', 'owaters', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'pharetra@Suspendissecommodo.or', null, '4', '28', null, 'DdAU7yD2', null, null, null, '1', '1', '2020-08-21 01:48:41', '2020-08-21 01:48:41');
INSERT INTO `usuario` VALUES ('226', '1', 'jessamine coffey', 'jcoffey', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'Curabitur@Quisquepurussapien.c', null, '4', '29', null, 'Bi7gHX03', null, null, null, '1', '1', '2020-08-21 01:48:41', '2020-08-21 01:48:41');
INSERT INTO `usuario` VALUES ('227', '1', 'martin hull', 'mhull', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'placerat.orci.lacus@vitaeeratV', null, '4', '30', null, 'CeqFXaWt', null, null, null, '1', '1', '2020-08-21 01:48:41', '2020-08-21 01:48:41');
INSERT INTO `usuario` VALUES ('228', '1', 'teegan west', 'twest', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'eget.varius@convallisdolor.ca', null, '4', '31', null, '84SOYNGN', null, null, null, '1', '1', '2020-08-21 01:48:42', '2020-08-21 01:48:42');
INSERT INTO `usuario` VALUES ('229', '1', 'josephine perry', 'jperry', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'nulla.magna.malesuada@ligulaco', null, '4', '32', null, '6hMgmbon', null, null, null, '1', '1', '2020-08-21 01:48:42', '2020-08-21 01:48:42');
INSERT INTO `usuario` VALUES ('230', '1', 'rhona murray', 'rmurray', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'gravida@ametconsectetuer.ca', null, '4', '33', null, 'lcI5DsA4', null, null, null, '1', '1', '2020-08-21 01:48:43', '2020-08-21 01:48:43');
INSERT INTO `usuario` VALUES ('231', '1', 'felicia hancock', 'fhancock', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'interdum.feugiat@amet.org', null, '4', '34', null, 'SUlolW35', null, null, null, '1', '1', '2020-08-21 01:48:43', '2020-08-21 01:48:43');
INSERT INTO `usuario` VALUES ('232', '1', 'cairo gross', 'cgross', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'interdum@tortor.edu', null, '4', '35', null, 'YTJXQUym', null, null, null, '1', '1', '2020-08-21 01:48:44', '2020-08-21 01:48:44');
INSERT INTO `usuario` VALUES ('233', '1', 'freya houston', 'fhouston', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'Nam.consequat.dolor@Etiamimper', null, '4', '36', null, 'Y0f65UPt', null, null, null, '1', '1', '2020-08-21 01:48:44', '2020-08-21 01:48:44');
INSERT INTO `usuario` VALUES ('234', '1', 'cullen bean', 'cbean', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'neque.Nullam.ut@in.net', null, '4', '37', null, 'VE3hjKYZ', null, null, null, '1', '1', '2020-08-21 01:48:45', '2020-08-21 01:48:45');
INSERT INTO `usuario` VALUES ('235', '1', 'melanie hatfield', 'mhatfield', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'consequat.nec@tellusAeneaneges', null, '4', '38', null, '67gFkBlV', null, null, null, '1', '1', '2020-08-21 01:48:45', '2020-08-21 01:48:45');
INSERT INTO `usuario` VALUES ('236', '1', 'kristen camacho', 'kcamacho', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'Donec.est@rhoncus.net', null, '4', '39', null, '5fwXFHBy', null, null, null, '1', '1', '2020-08-21 01:48:46', '2020-08-21 01:48:46');
INSERT INTO `usuario` VALUES ('237', '1', 'mira berry', 'mberry', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'interdum.ligula.eu@nunc.com', null, '4', '40', null, 'iPp4DBCs', null, null, null, '1', '1', '2020-08-21 01:48:46', '2020-08-21 01:48:46');
INSERT INTO `usuario` VALUES ('238', '1', 'alan phillips', 'aphillips', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'mi.ac@vitae.co.uk', null, '4', '41', null, 'hjuJaomv', null, null, null, '1', '1', '2020-08-21 01:48:47', '2020-08-21 01:48:47');
INSERT INTO `usuario` VALUES ('239', '1', 'porter guerra', 'pguerra', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'porttitor@rhoncusid.org', null, '4', '42', null, 'KunrVeYO', null, null, null, '1', '1', '2020-08-21 01:48:47', '2020-08-21 01:48:47');
INSERT INTO `usuario` VALUES ('240', '1', 'donovan meadows', 'dmeadows', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'lacus@ridiculusmusDonec.net', null, '4', '43', null, 'lzBsnp1d', null, null, null, '1', '1', '2020-08-21 01:48:48', '2020-08-21 01:48:48');
INSERT INTO `usuario` VALUES ('241', '1', 'callum rivera', 'crivera', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'eu.tellus.Phasellus@vitaemauri', null, '4', '44', null, 'VQSkzbO6', null, null, null, '1', '1', '2020-08-21 01:48:48', '2020-08-21 01:48:48');
INSERT INTO `usuario` VALUES ('242', '1', 'lydia carver', 'lcarver', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'ullamcorper.eu.euismod@Lorem.n', null, '4', '45', null, 'vIj8raxq', null, null, null, '1', '1', '2020-08-21 01:48:49', '2020-08-21 01:48:49');
INSERT INTO `usuario` VALUES ('243', '1', 'orli barrera', 'obarrera', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'Vivamus.molestie.dapibus@neclu', null, '4', '46', null, 'BSrEqGVN', null, null, null, '1', '1', '2020-08-21 01:48:49', '2020-08-21 01:48:49');
INSERT INTO `usuario` VALUES ('244', '1', 'cara solomon', 'csolomon', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'vehicula.et@sitametconsectetue', null, '4', '47', null, 'bpriD2rs', null, null, null, '1', '1', '2020-08-21 01:48:49', '2020-08-21 01:48:49');
INSERT INTO `usuario` VALUES ('245', '1', 'amena pena', 'apena', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'a.dui@musDonec.com', null, '4', '48', null, 'KqrIDGit', null, null, null, '1', '1', '2020-08-21 01:48:50', '2020-08-21 01:48:50');
INSERT INTO `usuario` VALUES ('246', '1', 'hiroko cooke', 'hcooke', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'tellus@loremloremluctus.co.uk', null, '4', '49', null, 'KtjPbbgb', null, null, null, '1', '1', '2020-08-21 01:48:50', '2020-08-21 01:48:50');
INSERT INTO `usuario` VALUES ('247', '1', 'zenia cameron', 'zcameron', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'risus.varius@Sed.net', null, '4', '50', null, 'itBOJq5G', null, null, null, '1', '1', '2020-08-21 01:48:51', '2020-08-21 01:48:51');
INSERT INTO `usuario` VALUES ('248', '1', 'maggy fleming', 'mfleming', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'dui@auguemalesuadamalesuada.ca', null, '4', '51', null, 'oCUeXdnJ', null, null, null, '1', '1', '2020-08-21 01:48:51', '2020-08-21 01:48:51');
INSERT INTO `usuario` VALUES ('249', '1', 'otto house', 'ohouse', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'adipiscing.elit.Etiam@auctorqu', null, '4', '52', null, 'bJ4rb5r1', null, null, null, '1', '1', '2020-08-21 01:48:52', '2020-08-21 01:48:52');
INSERT INTO `usuario` VALUES ('250', '1', 'lamar melton', 'lmelton', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'imperdiet.ullamcorper.Duis@vul', null, '4', '53', null, 'RbfVUYjJ', null, null, null, '1', '1', '2020-08-21 01:48:52', '2020-08-21 01:48:52');
INSERT INTO `usuario` VALUES ('251', '1', 'hamilton page', 'hpage', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'Praesent.luctus@tellusidnunc.c', null, '4', '54', null, 't4PVYSi6', null, null, null, '1', '1', '2020-08-21 01:48:53', '2020-08-21 01:48:53');
INSERT INTO `usuario` VALUES ('252', '1', 'ignatius roach', 'iroach', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'molestie@nec.ca', null, '4', '55', null, 'OizXwKLr', null, null, null, '1', '1', '2020-08-21 01:48:53', '2020-08-21 01:48:53');
INSERT INTO `usuario` VALUES ('253', '1', 'althea moses', 'amoses', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'lectus.convallis@Quisquetincid', null, '4', '56', null, 'QGELfWYm', null, null, null, '1', '1', '2020-08-21 01:48:54', '2020-08-21 01:48:54');
INSERT INTO `usuario` VALUES ('254', '1', 'aaron farrell', 'afarrell', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'ut.pellentesque@Lorem.com', null, '4', '57', null, 'NpV8vDsz', null, null, null, '1', '1', '2020-08-21 01:48:54', '2020-08-21 01:48:54');
INSERT INTO `usuario` VALUES ('255', '1', 'linda horne', 'lhorne', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'Donec.felis@nonlaciniaat.ca', null, '4', '58', null, 'PHqAaMId', null, null, null, '1', '1', '2020-08-21 01:48:55', '2020-08-21 01:48:55');
INSERT INTO `usuario` VALUES ('256', '1', 'lisandra mack', 'lmack', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'mattis.Integer.eu@nuncullamcor', null, '4', '59', null, 'A8xRCdIb', null, null, null, '1', '1', '2020-08-21 01:48:55', '2020-08-21 01:48:55');
INSERT INTO `usuario` VALUES ('257', '1', 'ivy moss', 'imoss', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'nunc.ac.mattis@egetipsumSuspen', null, '4', '60', null, 'SARmfsRA', null, null, null, '1', '1', '2020-08-21 01:48:56', '2020-08-21 01:48:56');
INSERT INTO `usuario` VALUES ('258', '1', 'vanna case', 'vcase', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'erat.volutpat.Nulla@consectetu', null, '4', '61', null, 'yoIQ0IeS', null, null, null, '1', '1', '2020-08-21 01:48:57', '2020-08-21 01:48:57');
INSERT INTO `usuario` VALUES ('259', '1', 'nash guy', 'nguy', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'penatibus@odiovelest.ca', null, '4', '62', null, 'HtxCcYiz', null, null, null, '1', '1', '2020-08-21 01:48:57', '2020-08-21 01:48:57');
INSERT INTO `usuario` VALUES ('260', '1', 'kelsie weber', 'kweber', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'gravida@loremegetmollis.com', null, '4', '63', null, 'fhdBok3O', null, null, null, '1', '1', '2020-08-21 01:48:58', '2020-08-21 01:48:58');
INSERT INTO `usuario` VALUES ('261', '1', 'kaye hodge', 'khodge', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'sem@sedconsequat.edu', null, '4', '64', null, 'oPiqFqXT', null, null, null, '1', '1', '2020-08-21 01:48:58', '2020-08-21 01:48:58');
INSERT INTO `usuario` VALUES ('262', '1', 'sarah conway', 'sconway', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'Aliquam.erat.volutpat@morbitri', null, '4', '65', null, '3BKAEYOa', null, null, null, '1', '1', '2020-08-21 01:48:58', '2020-08-21 01:48:58');
INSERT INTO `usuario` VALUES ('263', '1', 'mollie hogan', 'mhogan', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'nisi.sem.semper@Integereu.net', null, '4', '66', null, '9Jfqkng9', null, null, null, '1', '1', '2020-08-21 01:48:59', '2020-08-21 01:48:59');
INSERT INTO `usuario` VALUES ('264', '1', 'abel ramirez', 'aramirez', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'ullamcorper.magna.Sed@sceleris', null, '4', '67', null, 'ozOzKac4', null, null, null, '1', '1', '2020-08-21 01:48:59', '2020-08-21 01:48:59');
INSERT INTO `usuario` VALUES ('265', '1', 'herman mayo', 'hmayo', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'non.justo.Proin@egettinciduntd', null, '4', '68', null, '6sFac5j6', null, null, null, '1', '1', '2020-08-21 01:49:00', '2020-08-21 01:49:00');
INSERT INTO `usuario` VALUES ('266', '1', 'fay clay', 'fclay', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'lorem.sit@nonegestas.edu', null, '4', '69', null, '08sPatQV', null, null, null, '1', '1', '2020-08-21 01:49:00', '2020-08-21 01:49:00');
INSERT INTO `usuario` VALUES ('267', '1', 'basil booth', 'bbooth', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'lorem.semper.auctor@mus.org', null, '4', '70', null, 'xo41YOP8', null, null, null, '1', '1', '2020-08-21 01:49:01', '2020-08-21 01:49:01');
INSERT INTO `usuario` VALUES ('268', '1', 'kuame haley', 'khaley', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'ac.metus@odiosemper.co.uk', null, '4', '71', null, 'KR9nn5yF', null, null, null, '1', '1', '2020-08-21 01:49:01', '2020-08-21 01:49:01');
INSERT INTO `usuario` VALUES ('269', '1', 'colin tate', 'ctate', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'arcu@tellusjustosit.org', null, '4', '72', null, 'FgKEsTBO', null, null, null, '1', '1', '2020-08-21 01:49:02', '2020-08-21 01:49:02');
INSERT INTO `usuario` VALUES ('270', '1', 'molly neal', 'mneal', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'ipsum.leo@Sedetlibero.edu', null, '4', '73', null, 'Q8C0dmMH', null, null, null, '1', '1', '2020-08-21 01:49:02', '2020-08-21 01:49:02');
INSERT INTO `usuario` VALUES ('271', '1', 'cassady sparks', 'csparks', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'id.libero.Donec@sedliberoProin', null, '4', '74', null, 'rEUs7BWm', null, null, null, '1', '1', '2020-08-21 01:49:03', '2020-08-21 01:49:03');
INSERT INTO `usuario` VALUES ('272', '1', 'emerson obrien', 'eobrien', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'felis.adipiscing.fringilla@etm', null, '4', '75', null, 'BzeVmqOb', null, null, null, '1', '1', '2020-08-21 01:49:04', '2020-08-21 01:49:04');
INSERT INTO `usuario` VALUES ('273', '1', 'cameron marquez', 'cmarquez', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'sodales.at.velit@enimnon.edu', null, '4', '76', null, 'GkTtIpyl', null, null, null, '1', '1', '2020-08-21 01:49:04', '2020-08-21 01:49:04');
INSERT INTO `usuario` VALUES ('274', '1', 'kenneth lewis', 'klewis', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'scelerisque.dui@accumsanneque.', null, '4', '77', null, 'oe2hIaP3', null, null, null, '1', '1', '2020-08-21 01:49:05', '2020-08-21 01:49:05');
INSERT INTO `usuario` VALUES ('275', '1', 'courtney mueller', 'cmueller', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'orci.consectetuer.euismod@temp', null, '4', '78', null, 'TKCroNfX', null, null, null, '1', '1', '2020-08-21 01:49:05', '2020-08-21 01:49:05');
INSERT INTO `usuario` VALUES ('276', '1', 'imelda stafford', 'istafford', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'bibendum.Donec@dui.net', null, '4', '79', null, '6UVC09UT', null, null, null, '1', '1', '2020-08-21 01:49:05', '2020-08-21 01:49:05');
INSERT INTO `usuario` VALUES ('277', '1', 'colette allison', 'callison', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'mi.eleifend.egestas@Crassed.co', null, '4', '80', null, 'H6CrvvrJ', null, null, null, '1', '1', '2020-08-21 01:49:06', '2020-08-21 01:49:06');
INSERT INTO `usuario` VALUES ('278', '1', 'kibo ramsey', 'kramsey', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'ipsum@mauris.co.uk', null, '4', '81', null, 'VBS1lZgM', null, null, null, '1', '1', '2020-08-21 01:49:06', '2020-08-21 01:49:06');
INSERT INTO `usuario` VALUES ('279', '1', 'doris waters', 'dwaters', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'vel.lectus@euturpis.co.uk', null, '4', '82', null, 'XqoSZ0y1', null, null, null, '1', '1', '2020-08-21 01:49:07', '2020-08-21 01:49:07');
INSERT INTO `usuario` VALUES ('280', '1', 'petra peterson', 'ppeterson', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'metus.sit@habitantmorbitristiq', null, '4', '83', null, 'yuavxSDT', null, null, null, '1', '1', '2020-08-21 01:49:07', '2020-08-21 01:49:07');
INSERT INTO `usuario` VALUES ('281', '1', 'josephine kerr', 'jkerr', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'diam.dictum@semper.edu', null, '4', '84', null, '2LgUq0xR', null, null, null, '1', '1', '2020-08-21 01:49:08', '2020-08-21 01:49:08');
INSERT INTO `usuario` VALUES ('282', '1', 'mercedes holmes', 'mholmes', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'Cras@risusvarius.net', null, '4', '85', null, '4oQ6Dp4L', null, null, null, '1', '1', '2020-08-21 01:49:08', '2020-08-21 01:49:08');
INSERT INTO `usuario` VALUES ('283', '1', 'pascale bray', 'pbray', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'lacinia.at@Integer.net', null, '4', '86', null, 'TVYfj25f', null, null, null, '1', '1', '2020-08-21 01:49:09', '2020-08-21 01:49:09');
INSERT INTO `usuario` VALUES ('284', '1', 'latifah macdonald', 'lmacdonald', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'metus.sit@mauris.co.uk', null, '4', '87', null, 'tdTvn4sh', null, null, null, '1', '1', '2020-08-21 01:49:09', '2020-08-21 01:49:09');
INSERT INTO `usuario` VALUES ('285', '1', 'alea fisher', 'afisher', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'odio.auctor.vitae@adipiscingla', null, '4', '88', null, 'u67QUEAe', null, null, null, '1', '1', '2020-08-21 01:49:10', '2020-08-21 01:49:10');
INSERT INTO `usuario` VALUES ('286', '1', 'yoshi hall', 'yhall', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'auctor.velit@hendreritidante.c', null, '4', '89', null, 'MfPchVkD', null, null, null, '1', '1', '2020-08-21 01:49:10', '2020-08-21 01:49:10');
INSERT INTO `usuario` VALUES ('287', '1', 'joseph underwood', 'junderwood', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'faucibus.Morbi.vehicula@non.ne', null, '4', '90', null, 'LGyx2rkp', null, null, null, '1', '1', '2020-08-21 01:49:11', '2020-08-21 01:49:11');
INSERT INTO `usuario` VALUES ('288', '1', 'ursa kerr', 'ukerr', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'montes.nascetur.ridiculus@Null', null, '4', '91', null, '7WXEuLmw', null, null, null, '1', '1', '2020-08-21 01:49:12', '2020-08-21 01:49:12');
INSERT INTO `usuario` VALUES ('289', '1', 'wayne rivers', 'wrivers', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'interdum.feugiat.Sed@orci.co.u', null, '4', '92', null, 'VA2dUagm', null, null, null, '1', '1', '2020-08-21 01:49:12', '2020-08-21 01:49:12');
INSERT INTO `usuario` VALUES ('290', '1', 'cruz sullivan', 'csullivan', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'Sed.pharetra@aodio.ca', null, '4', '93', null, 'f9XCTXb4', null, null, null, '1', '1', '2020-08-21 01:49:12', '2020-08-21 01:49:12');
INSERT INTO `usuario` VALUES ('291', '1', 'eric gay', 'egay', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'cursus.non@Integerin.net', null, '4', '94', null, '86bzOjUU', null, null, null, '1', '1', '2020-08-21 01:49:13', '2020-08-21 01:49:13');
INSERT INTO `usuario` VALUES ('292', '1', 'daniel dennis', 'ddennis', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'tellus.id@temporlorem.net', null, '4', '95', null, 'XjcMKlYU', null, null, null, '1', '1', '2020-08-21 01:49:13', '2020-08-21 01:49:13');
INSERT INTO `usuario` VALUES ('293', '1', 'frances watson', 'fwatson', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'Ut.semper@duiin.co.uk', null, '4', '96', null, '9EIeClts', null, null, null, '1', '1', '2020-08-21 01:49:14', '2020-08-21 01:49:14');
INSERT INTO `usuario` VALUES ('294', '1', 'amery landry', 'alandry', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'penatibus.et.magnis@augueportt', null, '4', '97', null, 'KwKDz8jU', null, null, null, '1', '1', '2020-08-21 01:49:14', '2020-08-21 01:49:14');
INSERT INTO `usuario` VALUES ('295', '1', 'keely james', 'kjames', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'leo@etnunc.com', null, '4', '98', null, 't4c8zIWa', null, null, null, '1', '1', '2020-08-21 01:49:15', '2020-08-21 01:49:15');
INSERT INTO `usuario` VALUES ('296', '1', 'colleen rutledge', 'crutledge', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'magna@molestietortornibh.net', null, '4', '99', null, 'qqDb0jJw', null, null, null, '1', '1', '2020-08-21 01:49:15', '2020-08-21 01:49:15');
INSERT INTO `usuario` VALUES ('297', '1', 'gil mccall', 'gmccall', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'eget.metus.eu@lectus.edu', null, '4', '100', null, 'prgY4FZH', null, null, null, '1', '1', '2020-08-21 01:49:16', '2020-08-21 01:49:16');
INSERT INTO `usuario` VALUES ('298', '1', 'chancellor wilkins', 'cwilkins', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'Fusce.dolor@fringillamilacinia', null, '4', '101', null, '36bjPVMv', null, null, null, '1', '1', '2020-08-21 01:49:16', '2020-08-21 01:49:16');
INSERT INTO `usuario` VALUES ('299', '1', 'conan webb', 'cwebb', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'faucibus@necimperdietnec.org', null, '4', '102', null, 'auvNvh8E', null, null, null, '1', '1', '2020-08-21 01:49:17', '2020-08-21 01:49:17');
INSERT INTO `usuario` VALUES ('300', '1', 'price mills', 'pmills', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'senectus.et.netus@sitametconse', null, '4', '103', null, 'FDTAZ4Li', null, null, null, '1', '1', '2020-08-21 01:49:17', '2020-08-21 01:49:17');
INSERT INTO `usuario` VALUES ('301', '1', 'meredith goff', 'mgoff', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'dolor@enimNuncut.net', null, '4', '104', null, 'rw3muPat', null, null, null, '1', '1', '2020-08-21 01:49:18', '2020-08-21 01:49:18');
INSERT INTO `usuario` VALUES ('302', '1', 'zena hendrix', 'zhendrix', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'lectus@vitaealiquam.edu', null, '4', '105', null, 'DaK8KAjn', null, null, null, '1', '1', '2020-08-21 01:49:18', '2020-08-21 01:49:18');
INSERT INTO `usuario` VALUES ('303', '1', 'raja woodward', 'rwoodward', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'lacus.Mauris.non@massaMauris.o', null, '4', '106', null, '5ROODCkI', null, null, null, '1', '1', '2020-08-21 01:49:19', '2020-08-21 01:49:19');
INSERT INTO `usuario` VALUES ('304', '1', 'kirsten holt', 'kholt', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'Phasellus@vitae.com', null, '4', '107', null, 'gbDdt1nN', null, null, null, '1', '1', '2020-08-21 01:49:19', '2020-08-21 01:49:19');
INSERT INTO `usuario` VALUES ('305', '1', 'macey garcia', 'mgarcia', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'consequat@parturientmontesnasc', null, '4', '108', null, '8lylFVz9', null, null, null, '1', '1', '2020-08-21 01:49:19', '2020-08-21 01:49:19');
INSERT INTO `usuario` VALUES ('307', '1', 'britanney walton', 'bwalton', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'auctor.quis@vitaesodalesnisi.n', null, '4', '109', null, 'LCrR9wcI', null, null, null, '1', '1', '2020-08-21 03:02:52', '2020-08-21 03:02:52');
INSERT INTO `usuario` VALUES ('308', '1', 'cecili chavez', 'cchavez', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'cecilio@gmail.com', null, '3', '112', null, 'ZvCnas1i', null, null, null, '1', '1', '2020-08-21 03:24:20', '2020-08-21 03:24:20');
INSERT INTO `usuario` VALUES ('309', '1', 'sadfsdfsadf fsadfasdf', 'sfsadfasdf', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'ldfsff@gmail.com', null, '2', '110', null, 'zOKZZDje', null, null, null, '1', '1', '2020-08-21 03:41:52', '2020-08-21 03:41:52');
INSERT INTO `usuario` VALUES ('311', '1', 'zzzz zzzzzzzzz', 'zzzzzzzzzz', '$2y$10$/CJKpoxHa/YcdYY1djt30uZwzmVp1.6vg3eaqRnjeptUL2vOjrgbC', 'lghgfaf@gmail.com', null, '3', '117', null, '3ACpyp6p', null, null, null, '1', '1', '2020-09-02 11:19:09', '2020-09-02 11:19:09');
INSERT INTO `usuario` VALUES ('312', '1', 'jean mastrollani', 'jmastrollani', '$2y$10$I0rXjL34gmyCiNoNihSmdekvEYqG/oMelZDiI/tIsBq.4542aFSBC', 'li@gmail.com', null, '3', '118', null, 'taovQePx', null, null, null, '1', '1', '2020-09-03 00:53:18', '2020-09-03 00:53:18');
INSERT INTO `usuario` VALUES ('313', '1', 'luis mastro', 'lmastro', '$2y$10$STxE4avkG1qcN4FsD.clx.GiT71R/jWFgSuNH9xhEjNp43MueQBwy', 'lyustiz@sdjhjkshjdfks', null, '2', '112', null, 'yjdnLxIv', null, null, null, '1', '1', '2020-09-03 01:02:47', '2020-09-03 01:02:47');
INSERT INTO `usuario` VALUES ('314', '1', 'jose rodriguez', 'jrodriguez', '$2y$10$QbWasyskGIZVYG2amTYQg.vt30pZ93d3xM5oDzNz7FOYJrmn69oMS', 'lfsfsdf@gmail.com', null, '4', '7', null, 'TAiBKWWu', null, null, null, '1', '1', '2020-09-03 01:13:28', '2020-09-03 01:13:28');

-- ----------------------------
-- Table structure for usuario_perfil
-- ----------------------------
DROP TABLE IF EXISTS `usuario_perfil`;
CREATE TABLE `usuario_perfil` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `id_perfil` int(11) NOT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `id_usuario_ed` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=319 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of usuario_perfil
-- ----------------------------
INSERT INTO `usuario_perfil` VALUES ('1', '1', '1', null, '1', '1', '2020-06-06 20:31:13', '2020-06-06 20:31:13');
INSERT INTO `usuario_perfil` VALUES ('2', '1', '2', null, '1', '1', '2020-06-06 20:31:23', '2020-06-06 20:31:23');
INSERT INTO `usuario_perfil` VALUES ('3', '1', '3', null, '1', '1', '2020-06-06 20:31:35', '2020-06-06 20:31:35');
INSERT INTO `usuario_perfil` VALUES ('5', '1', '4', null, '1', '1', '2020-07-24 18:15:27', '2020-07-24 18:15:27');
INSERT INTO `usuario_perfil` VALUES ('6', '3', '3', null, '1', '1', '2020-08-21 00:56:33', '2020-08-21 00:56:33');
INSERT INTO `usuario_perfil` VALUES ('7', '4', '3', null, '1', '1', '2020-08-21 00:56:33', '2020-08-21 00:56:33');
INSERT INTO `usuario_perfil` VALUES ('8', '5', '3', null, '1', '1', '2020-08-21 00:56:34', '2020-08-21 00:56:34');
INSERT INTO `usuario_perfil` VALUES ('9', '6', '3', null, '1', '1', '2020-08-21 00:56:34', '2020-08-21 00:56:34');
INSERT INTO `usuario_perfil` VALUES ('10', '7', '3', null, '1', '1', '2020-08-21 00:56:35', '2020-08-21 00:56:35');
INSERT INTO `usuario_perfil` VALUES ('11', '8', '3', null, '1', '1', '2020-08-21 00:56:35', '2020-08-21 00:56:35');
INSERT INTO `usuario_perfil` VALUES ('12', '9', '3', null, '1', '1', '2020-08-21 00:56:36', '2020-08-21 00:56:36');
INSERT INTO `usuario_perfil` VALUES ('13', '10', '3', null, '1', '1', '2020-08-21 00:56:36', '2020-08-21 00:56:36');
INSERT INTO `usuario_perfil` VALUES ('14', '11', '3', null, '1', '1', '2020-08-21 00:56:37', '2020-08-21 00:56:37');
INSERT INTO `usuario_perfil` VALUES ('15', '12', '3', null, '1', '1', '2020-08-21 00:56:38', '2020-08-21 00:56:38');
INSERT INTO `usuario_perfil` VALUES ('16', '13', '3', null, '1', '1', '2020-08-21 00:56:38', '2020-08-21 00:56:38');
INSERT INTO `usuario_perfil` VALUES ('17', '14', '3', null, '1', '1', '2020-08-21 00:56:39', '2020-08-21 00:56:39');
INSERT INTO `usuario_perfil` VALUES ('18', '15', '3', null, '1', '1', '2020-08-21 00:56:39', '2020-08-21 00:56:39');
INSERT INTO `usuario_perfil` VALUES ('19', '16', '3', null, '1', '1', '2020-08-21 00:56:40', '2020-08-21 00:56:40');
INSERT INTO `usuario_perfil` VALUES ('20', '17', '3', null, '1', '1', '2020-08-21 00:56:40', '2020-08-21 00:56:40');
INSERT INTO `usuario_perfil` VALUES ('21', '18', '3', null, '1', '1', '2020-08-21 00:56:41', '2020-08-21 00:56:41');
INSERT INTO `usuario_perfil` VALUES ('22', '19', '3', null, '1', '1', '2020-08-21 00:56:41', '2020-08-21 00:56:41');
INSERT INTO `usuario_perfil` VALUES ('23', '20', '3', null, '1', '1', '2020-08-21 00:56:41', '2020-08-21 00:56:41');
INSERT INTO `usuario_perfil` VALUES ('24', '21', '3', null, '1', '1', '2020-08-21 00:56:42', '2020-08-21 00:56:42');
INSERT INTO `usuario_perfil` VALUES ('25', '22', '3', null, '1', '1', '2020-08-21 00:56:42', '2020-08-21 00:56:42');
INSERT INTO `usuario_perfil` VALUES ('26', '23', '3', null, '1', '1', '2020-08-21 00:56:43', '2020-08-21 00:56:43');
INSERT INTO `usuario_perfil` VALUES ('27', '24', '3', null, '1', '1', '2020-08-21 00:56:43', '2020-08-21 00:56:43');
INSERT INTO `usuario_perfil` VALUES ('28', '25', '3', null, '1', '1', '2020-08-21 00:56:44', '2020-08-21 00:56:44');
INSERT INTO `usuario_perfil` VALUES ('29', '26', '3', null, '1', '1', '2020-08-21 00:56:44', '2020-08-21 00:56:44');
INSERT INTO `usuario_perfil` VALUES ('30', '27', '3', null, '1', '1', '2020-08-21 00:56:45', '2020-08-21 00:56:45');
INSERT INTO `usuario_perfil` VALUES ('31', '28', '3', null, '1', '1', '2020-08-21 00:56:45', '2020-08-21 00:56:45');
INSERT INTO `usuario_perfil` VALUES ('32', '29', '3', null, '1', '1', '2020-08-21 00:56:46', '2020-08-21 00:56:46');
INSERT INTO `usuario_perfil` VALUES ('33', '30', '3', null, '1', '1', '2020-08-21 00:56:46', '2020-08-21 00:56:46');
INSERT INTO `usuario_perfil` VALUES ('34', '31', '3', null, '1', '1', '2020-08-21 00:56:47', '2020-08-21 00:56:47');
INSERT INTO `usuario_perfil` VALUES ('35', '32', '3', null, '1', '1', '2020-08-21 00:56:47', '2020-08-21 00:56:47');
INSERT INTO `usuario_perfil` VALUES ('36', '33', '3', null, '1', '1', '2020-08-21 00:56:48', '2020-08-21 00:56:48');
INSERT INTO `usuario_perfil` VALUES ('37', '34', '3', null, '1', '1', '2020-08-21 00:56:48', '2020-08-21 00:56:48');
INSERT INTO `usuario_perfil` VALUES ('38', '35', '3', null, '1', '1', '2020-08-21 00:56:49', '2020-08-21 00:56:49');
INSERT INTO `usuario_perfil` VALUES ('39', '36', '3', null, '1', '1', '2020-08-21 00:56:49', '2020-08-21 00:56:49');
INSERT INTO `usuario_perfil` VALUES ('40', '37', '3', null, '1', '1', '2020-08-21 00:56:49', '2020-08-21 00:56:49');
INSERT INTO `usuario_perfil` VALUES ('41', '38', '3', null, '1', '1', '2020-08-21 00:56:50', '2020-08-21 00:56:50');
INSERT INTO `usuario_perfil` VALUES ('42', '39', '3', null, '1', '1', '2020-08-21 00:56:50', '2020-08-21 00:56:50');
INSERT INTO `usuario_perfil` VALUES ('43', '40', '3', null, '1', '1', '2020-08-21 00:56:51', '2020-08-21 00:56:51');
INSERT INTO `usuario_perfil` VALUES ('44', '41', '3', null, '1', '1', '2020-08-21 00:56:51', '2020-08-21 00:56:51');
INSERT INTO `usuario_perfil` VALUES ('45', '42', '3', null, '1', '1', '2020-08-21 00:56:52', '2020-08-21 00:56:52');
INSERT INTO `usuario_perfil` VALUES ('46', '43', '3', null, '1', '1', '2020-08-21 00:56:52', '2020-08-21 00:56:52');
INSERT INTO `usuario_perfil` VALUES ('47', '44', '3', null, '1', '1', '2020-08-21 00:56:52', '2020-08-21 00:56:52');
INSERT INTO `usuario_perfil` VALUES ('48', '45', '3', null, '1', '1', '2020-08-21 00:56:53', '2020-08-21 00:56:53');
INSERT INTO `usuario_perfil` VALUES ('49', '46', '3', null, '1', '1', '2020-08-21 00:56:53', '2020-08-21 00:56:53');
INSERT INTO `usuario_perfil` VALUES ('50', '47', '3', null, '1', '1', '2020-08-21 00:56:54', '2020-08-21 00:56:54');
INSERT INTO `usuario_perfil` VALUES ('51', '48', '3', null, '1', '1', '2020-08-21 00:56:54', '2020-08-21 00:56:54');
INSERT INTO `usuario_perfil` VALUES ('52', '49', '3', null, '1', '1', '2020-08-21 00:56:55', '2020-08-21 00:56:55');
INSERT INTO `usuario_perfil` VALUES ('53', '50', '3', null, '1', '1', '2020-08-21 00:56:55', '2020-08-21 00:56:55');
INSERT INTO `usuario_perfil` VALUES ('54', '51', '3', null, '1', '1', '2020-08-21 00:56:55', '2020-08-21 00:56:55');
INSERT INTO `usuario_perfil` VALUES ('55', '52', '3', null, '1', '1', '2020-08-21 00:56:56', '2020-08-21 00:56:56');
INSERT INTO `usuario_perfil` VALUES ('56', '53', '3', null, '1', '1', '2020-08-21 00:56:56', '2020-08-21 00:56:56');
INSERT INTO `usuario_perfil` VALUES ('57', '54', '3', null, '1', '1', '2020-08-21 00:56:57', '2020-08-21 00:56:57');
INSERT INTO `usuario_perfil` VALUES ('58', '55', '3', null, '1', '1', '2020-08-21 00:56:57', '2020-08-21 00:56:57');
INSERT INTO `usuario_perfil` VALUES ('59', '56', '3', null, '1', '1', '2020-08-21 00:56:58', '2020-08-21 00:56:58');
INSERT INTO `usuario_perfil` VALUES ('60', '57', '3', null, '1', '1', '2020-08-21 00:56:58', '2020-08-21 00:56:58');
INSERT INTO `usuario_perfil` VALUES ('61', '58', '3', null, '1', '1', '2020-08-21 00:56:58', '2020-08-21 00:56:58');
INSERT INTO `usuario_perfil` VALUES ('62', '59', '3', null, '1', '1', '2020-08-21 00:56:59', '2020-08-21 00:56:59');
INSERT INTO `usuario_perfil` VALUES ('63', '60', '3', null, '1', '1', '2020-08-21 00:56:59', '2020-08-21 00:56:59');
INSERT INTO `usuario_perfil` VALUES ('64', '61', '3', null, '1', '1', '2020-08-21 00:57:00', '2020-08-21 00:57:00');
INSERT INTO `usuario_perfil` VALUES ('65', '62', '3', null, '1', '1', '2020-08-21 00:57:00', '2020-08-21 00:57:00');
INSERT INTO `usuario_perfil` VALUES ('66', '63', '3', null, '1', '1', '2020-08-21 00:57:00', '2020-08-21 00:57:00');
INSERT INTO `usuario_perfil` VALUES ('67', '64', '3', null, '1', '1', '2020-08-21 00:57:01', '2020-08-21 00:57:01');
INSERT INTO `usuario_perfil` VALUES ('68', '65', '3', null, '1', '1', '2020-08-21 00:57:01', '2020-08-21 00:57:01');
INSERT INTO `usuario_perfil` VALUES ('69', '66', '3', null, '1', '1', '2020-08-21 00:57:02', '2020-08-21 00:57:02');
INSERT INTO `usuario_perfil` VALUES ('70', '67', '3', null, '1', '1', '2020-08-21 00:57:02', '2020-08-21 00:57:02');
INSERT INTO `usuario_perfil` VALUES ('71', '68', '3', null, '1', '1', '2020-08-21 00:57:03', '2020-08-21 00:57:03');
INSERT INTO `usuario_perfil` VALUES ('72', '69', '3', null, '1', '1', '2020-08-21 00:57:03', '2020-08-21 00:57:03');
INSERT INTO `usuario_perfil` VALUES ('73', '70', '3', null, '1', '1', '2020-08-21 00:57:04', '2020-08-21 00:57:04');
INSERT INTO `usuario_perfil` VALUES ('74', '71', '3', null, '1', '1', '2020-08-21 00:57:04', '2020-08-21 00:57:04');
INSERT INTO `usuario_perfil` VALUES ('75', '72', '3', null, '1', '1', '2020-08-21 00:57:05', '2020-08-21 00:57:05');
INSERT INTO `usuario_perfil` VALUES ('76', '73', '3', null, '1', '1', '2020-08-21 00:57:05', '2020-08-21 00:57:05');
INSERT INTO `usuario_perfil` VALUES ('77', '74', '3', null, '1', '1', '2020-08-21 00:57:05', '2020-08-21 00:57:05');
INSERT INTO `usuario_perfil` VALUES ('78', '75', '3', null, '1', '1', '2020-08-21 00:57:06', '2020-08-21 00:57:06');
INSERT INTO `usuario_perfil` VALUES ('79', '76', '3', null, '1', '1', '2020-08-21 00:57:07', '2020-08-21 00:57:07');
INSERT INTO `usuario_perfil` VALUES ('80', '77', '3', null, '1', '1', '2020-08-21 00:57:07', '2020-08-21 00:57:07');
INSERT INTO `usuario_perfil` VALUES ('81', '78', '3', null, '1', '1', '2020-08-21 00:57:08', '2020-08-21 00:57:08');
INSERT INTO `usuario_perfil` VALUES ('82', '79', '3', null, '1', '1', '2020-08-21 00:57:08', '2020-08-21 00:57:08');
INSERT INTO `usuario_perfil` VALUES ('83', '80', '3', null, '1', '1', '2020-08-21 00:57:08', '2020-08-21 00:57:08');
INSERT INTO `usuario_perfil` VALUES ('84', '81', '3', null, '1', '1', '2020-08-21 00:57:09', '2020-08-21 00:57:09');
INSERT INTO `usuario_perfil` VALUES ('85', '82', '3', null, '1', '1', '2020-08-21 00:57:09', '2020-08-21 00:57:09');
INSERT INTO `usuario_perfil` VALUES ('86', '83', '3', null, '1', '1', '2020-08-21 00:57:10', '2020-08-21 00:57:10');
INSERT INTO `usuario_perfil` VALUES ('87', '84', '3', null, '1', '1', '2020-08-21 00:57:10', '2020-08-21 00:57:10');
INSERT INTO `usuario_perfil` VALUES ('88', '85', '3', null, '1', '1', '2020-08-21 00:57:11', '2020-08-21 00:57:11');
INSERT INTO `usuario_perfil` VALUES ('89', '86', '3', null, '1', '1', '2020-08-21 00:57:11', '2020-08-21 00:57:11');
INSERT INTO `usuario_perfil` VALUES ('90', '87', '3', null, '1', '1', '2020-08-21 00:57:12', '2020-08-21 00:57:12');
INSERT INTO `usuario_perfil` VALUES ('91', '88', '3', null, '1', '1', '2020-08-21 00:57:12', '2020-08-21 00:57:12');
INSERT INTO `usuario_perfil` VALUES ('92', '89', '3', null, '1', '1', '2020-08-21 00:57:13', '2020-08-21 00:57:13');
INSERT INTO `usuario_perfil` VALUES ('93', '90', '3', null, '1', '1', '2020-08-21 00:57:13', '2020-08-21 00:57:13');
INSERT INTO `usuario_perfil` VALUES ('94', '91', '3', null, '1', '1', '2020-08-21 00:57:14', '2020-08-21 00:57:14');
INSERT INTO `usuario_perfil` VALUES ('95', '92', '3', null, '1', '1', '2020-08-21 00:57:14', '2020-08-21 00:57:14');
INSERT INTO `usuario_perfil` VALUES ('96', '93', '3', null, '1', '1', '2020-08-21 00:57:15', '2020-08-21 00:57:15');
INSERT INTO `usuario_perfil` VALUES ('97', '94', '3', null, '1', '1', '2020-08-21 00:57:15', '2020-08-21 00:57:15');
INSERT INTO `usuario_perfil` VALUES ('98', '95', '3', null, '1', '1', '2020-08-21 00:57:16', '2020-08-21 00:57:16');
INSERT INTO `usuario_perfil` VALUES ('99', '96', '3', null, '1', '1', '2020-08-21 00:57:16', '2020-08-21 00:57:16');
INSERT INTO `usuario_perfil` VALUES ('100', '97', '3', null, '1', '1', '2020-08-21 00:57:17', '2020-08-21 00:57:17');
INSERT INTO `usuario_perfil` VALUES ('101', '98', '3', null, '1', '1', '2020-08-21 00:57:17', '2020-08-21 00:57:17');
INSERT INTO `usuario_perfil` VALUES ('102', '99', '3', null, '1', '1', '2020-08-21 00:57:18', '2020-08-21 00:57:18');
INSERT INTO `usuario_perfil` VALUES ('103', '100', '3', null, '1', '1', '2020-08-21 00:57:18', '2020-08-21 00:57:18');
INSERT INTO `usuario_perfil` VALUES ('104', '101', '3', null, '1', '1', '2020-08-21 00:57:19', '2020-08-21 00:57:19');
INSERT INTO `usuario_perfil` VALUES ('105', '102', '3', null, '1', '1', '2020-08-21 00:57:19', '2020-08-21 00:57:19');
INSERT INTO `usuario_perfil` VALUES ('106', '103', '3', null, '1', '1', '2020-08-21 00:57:20', '2020-08-21 00:57:20');
INSERT INTO `usuario_perfil` VALUES ('107', '104', '2', null, '1', '1', '2020-08-21 01:04:42', '2020-08-21 01:04:42');
INSERT INTO `usuario_perfil` VALUES ('108', '105', '2', null, '1', '1', '2020-08-21 01:04:43', '2020-08-21 01:04:43');
INSERT INTO `usuario_perfil` VALUES ('109', '106', '2', null, '1', '1', '2020-08-21 01:04:43', '2020-08-21 01:04:43');
INSERT INTO `usuario_perfil` VALUES ('110', '107', '2', null, '1', '1', '2020-08-21 01:04:44', '2020-08-21 01:04:44');
INSERT INTO `usuario_perfil` VALUES ('111', '108', '2', null, '1', '1', '2020-08-21 01:04:44', '2020-08-21 01:04:44');
INSERT INTO `usuario_perfil` VALUES ('112', '109', '2', null, '1', '1', '2020-08-21 01:04:44', '2020-08-21 01:04:44');
INSERT INTO `usuario_perfil` VALUES ('113', '110', '2', null, '1', '1', '2020-08-21 01:04:45', '2020-08-21 01:04:45');
INSERT INTO `usuario_perfil` VALUES ('114', '111', '2', null, '1', '1', '2020-08-21 01:04:45', '2020-08-21 01:04:45');
INSERT INTO `usuario_perfil` VALUES ('115', '112', '2', null, '1', '1', '2020-08-21 01:04:46', '2020-08-21 01:04:46');
INSERT INTO `usuario_perfil` VALUES ('116', '113', '2', null, '1', '1', '2020-08-21 01:04:46', '2020-08-21 01:04:46');
INSERT INTO `usuario_perfil` VALUES ('117', '114', '2', null, '1', '1', '2020-08-21 01:04:47', '2020-08-21 01:04:47');
INSERT INTO `usuario_perfil` VALUES ('118', '115', '2', null, '1', '1', '2020-08-21 01:04:47', '2020-08-21 01:04:47');
INSERT INTO `usuario_perfil` VALUES ('119', '116', '2', null, '1', '1', '2020-08-21 01:04:48', '2020-08-21 01:04:48');
INSERT INTO `usuario_perfil` VALUES ('120', '117', '2', null, '1', '1', '2020-08-21 01:04:48', '2020-08-21 01:04:48');
INSERT INTO `usuario_perfil` VALUES ('121', '118', '2', null, '1', '1', '2020-08-21 01:04:49', '2020-08-21 01:04:49');
INSERT INTO `usuario_perfil` VALUES ('122', '119', '2', null, '1', '1', '2020-08-21 01:04:49', '2020-08-21 01:04:49');
INSERT INTO `usuario_perfil` VALUES ('123', '120', '2', null, '1', '1', '2020-08-21 01:04:50', '2020-08-21 01:04:50');
INSERT INTO `usuario_perfil` VALUES ('124', '121', '2', null, '1', '1', '2020-08-21 01:04:50', '2020-08-21 01:04:50');
INSERT INTO `usuario_perfil` VALUES ('125', '122', '2', null, '1', '1', '2020-08-21 01:04:51', '2020-08-21 01:04:51');
INSERT INTO `usuario_perfil` VALUES ('126', '123', '2', null, '1', '1', '2020-08-21 01:04:51', '2020-08-21 01:04:51');
INSERT INTO `usuario_perfil` VALUES ('127', '124', '2', null, '1', '1', '2020-08-21 01:04:52', '2020-08-21 01:04:52');
INSERT INTO `usuario_perfil` VALUES ('128', '125', '2', null, '1', '1', '2020-08-21 01:04:52', '2020-08-21 01:04:52');
INSERT INTO `usuario_perfil` VALUES ('129', '126', '2', null, '1', '1', '2020-08-21 01:04:53', '2020-08-21 01:04:53');
INSERT INTO `usuario_perfil` VALUES ('130', '127', '2', null, '1', '1', '2020-08-21 01:04:53', '2020-08-21 01:04:53');
INSERT INTO `usuario_perfil` VALUES ('131', '128', '2', null, '1', '1', '2020-08-21 01:04:54', '2020-08-21 01:04:54');
INSERT INTO `usuario_perfil` VALUES ('132', '129', '2', null, '1', '1', '2020-08-21 01:04:54', '2020-08-21 01:04:54');
INSERT INTO `usuario_perfil` VALUES ('133', '130', '2', null, '1', '1', '2020-08-21 01:04:55', '2020-08-21 01:04:55');
INSERT INTO `usuario_perfil` VALUES ('134', '131', '2', null, '1', '1', '2020-08-21 01:04:55', '2020-08-21 01:04:55');
INSERT INTO `usuario_perfil` VALUES ('135', '132', '2', null, '1', '1', '2020-08-21 01:04:55', '2020-08-21 01:04:55');
INSERT INTO `usuario_perfil` VALUES ('136', '133', '2', null, '1', '1', '2020-08-21 01:04:56', '2020-08-21 01:04:56');
INSERT INTO `usuario_perfil` VALUES ('137', '134', '2', null, '1', '1', '2020-08-21 01:04:56', '2020-08-21 01:04:56');
INSERT INTO `usuario_perfil` VALUES ('138', '135', '2', null, '1', '1', '2020-08-21 01:04:57', '2020-08-21 01:04:57');
INSERT INTO `usuario_perfil` VALUES ('139', '136', '2', null, '1', '1', '2020-08-21 01:04:57', '2020-08-21 01:04:57');
INSERT INTO `usuario_perfil` VALUES ('140', '137', '2', null, '1', '1', '2020-08-21 01:04:58', '2020-08-21 01:04:58');
INSERT INTO `usuario_perfil` VALUES ('141', '138', '2', null, '1', '1', '2020-08-21 01:04:58', '2020-08-21 01:04:58');
INSERT INTO `usuario_perfil` VALUES ('142', '139', '2', null, '1', '1', '2020-08-21 01:04:59', '2020-08-21 01:04:59');
INSERT INTO `usuario_perfil` VALUES ('143', '140', '2', null, '1', '1', '2020-08-21 01:04:59', '2020-08-21 01:04:59');
INSERT INTO `usuario_perfil` VALUES ('144', '141', '2', null, '1', '1', '2020-08-21 01:05:00', '2020-08-21 01:05:00');
INSERT INTO `usuario_perfil` VALUES ('145', '142', '2', null, '1', '1', '2020-08-21 01:05:00', '2020-08-21 01:05:00');
INSERT INTO `usuario_perfil` VALUES ('146', '143', '2', null, '1', '1', '2020-08-21 01:05:01', '2020-08-21 01:05:01');
INSERT INTO `usuario_perfil` VALUES ('147', '144', '2', null, '1', '1', '2020-08-21 01:05:01', '2020-08-21 01:05:01');
INSERT INTO `usuario_perfil` VALUES ('148', '145', '2', null, '1', '1', '2020-08-21 01:05:02', '2020-08-21 01:05:02');
INSERT INTO `usuario_perfil` VALUES ('149', '146', '2', null, '1', '1', '2020-08-21 01:05:02', '2020-08-21 01:05:02');
INSERT INTO `usuario_perfil` VALUES ('150', '147', '2', null, '1', '1', '2020-08-21 01:05:03', '2020-08-21 01:05:03');
INSERT INTO `usuario_perfil` VALUES ('151', '148', '2', null, '1', '1', '2020-08-21 01:05:03', '2020-08-21 01:05:03');
INSERT INTO `usuario_perfil` VALUES ('152', '149', '2', null, '1', '1', '2020-08-21 01:05:04', '2020-08-21 01:05:04');
INSERT INTO `usuario_perfil` VALUES ('153', '150', '2', null, '1', '1', '2020-08-21 01:05:04', '2020-08-21 01:05:04');
INSERT INTO `usuario_perfil` VALUES ('154', '151', '2', null, '1', '1', '2020-08-21 01:05:05', '2020-08-21 01:05:05');
INSERT INTO `usuario_perfil` VALUES ('155', '152', '2', null, '1', '1', '2020-08-21 01:05:05', '2020-08-21 01:05:05');
INSERT INTO `usuario_perfil` VALUES ('156', '153', '2', null, '1', '1', '2020-08-21 01:05:06', '2020-08-21 01:05:06');
INSERT INTO `usuario_perfil` VALUES ('157', '154', '2', null, '1', '1', '2020-08-21 01:05:06', '2020-08-21 01:05:06');
INSERT INTO `usuario_perfil` VALUES ('158', '155', '2', null, '1', '1', '2020-08-21 01:05:07', '2020-08-21 01:05:07');
INSERT INTO `usuario_perfil` VALUES ('159', '156', '2', null, '1', '1', '2020-08-21 01:05:07', '2020-08-21 01:05:07');
INSERT INTO `usuario_perfil` VALUES ('160', '157', '2', null, '1', '1', '2020-08-21 01:05:08', '2020-08-21 01:05:08');
INSERT INTO `usuario_perfil` VALUES ('161', '158', '2', null, '1', '1', '2020-08-21 01:05:08', '2020-08-21 01:05:08');
INSERT INTO `usuario_perfil` VALUES ('162', '159', '2', null, '1', '1', '2020-08-21 01:05:09', '2020-08-21 01:05:09');
INSERT INTO `usuario_perfil` VALUES ('163', '160', '2', null, '1', '1', '2020-08-21 01:05:09', '2020-08-21 01:05:09');
INSERT INTO `usuario_perfil` VALUES ('164', '161', '2', null, '1', '1', '2020-08-21 01:05:10', '2020-08-21 01:05:10');
INSERT INTO `usuario_perfil` VALUES ('165', '162', '2', null, '1', '1', '2020-08-21 01:05:10', '2020-08-21 01:05:10');
INSERT INTO `usuario_perfil` VALUES ('166', '163', '2', null, '1', '1', '2020-08-21 01:05:11', '2020-08-21 01:05:11');
INSERT INTO `usuario_perfil` VALUES ('167', '164', '2', null, '1', '1', '2020-08-21 01:05:11', '2020-08-21 01:05:11');
INSERT INTO `usuario_perfil` VALUES ('168', '165', '2', null, '1', '1', '2020-08-21 01:05:12', '2020-08-21 01:05:12');
INSERT INTO `usuario_perfil` VALUES ('169', '166', '2', null, '1', '1', '2020-08-21 01:05:12', '2020-08-21 01:05:12');
INSERT INTO `usuario_perfil` VALUES ('170', '167', '2', null, '1', '1', '2020-08-21 01:05:13', '2020-08-21 01:05:13');
INSERT INTO `usuario_perfil` VALUES ('171', '168', '2', null, '1', '1', '2020-08-21 01:05:13', '2020-08-21 01:05:13');
INSERT INTO `usuario_perfil` VALUES ('172', '169', '2', null, '1', '1', '2020-08-21 01:05:14', '2020-08-21 01:05:14');
INSERT INTO `usuario_perfil` VALUES ('173', '170', '2', null, '1', '1', '2020-08-21 01:05:14', '2020-08-21 01:05:14');
INSERT INTO `usuario_perfil` VALUES ('174', '171', '2', null, '1', '1', '2020-08-21 01:05:15', '2020-08-21 01:05:15');
INSERT INTO `usuario_perfil` VALUES ('175', '172', '2', null, '1', '1', '2020-08-21 01:05:15', '2020-08-21 01:05:15');
INSERT INTO `usuario_perfil` VALUES ('176', '173', '2', null, '1', '1', '2020-08-21 01:05:16', '2020-08-21 01:05:16');
INSERT INTO `usuario_perfil` VALUES ('177', '174', '2', null, '1', '1', '2020-08-21 01:05:16', '2020-08-21 01:05:16');
INSERT INTO `usuario_perfil` VALUES ('178', '175', '2', null, '1', '1', '2020-08-21 01:05:17', '2020-08-21 01:05:17');
INSERT INTO `usuario_perfil` VALUES ('179', '176', '2', null, '1', '1', '2020-08-21 01:05:17', '2020-08-21 01:05:17');
INSERT INTO `usuario_perfil` VALUES ('180', '177', '2', null, '1', '1', '2020-08-21 01:05:18', '2020-08-21 01:05:18');
INSERT INTO `usuario_perfil` VALUES ('181', '178', '2', null, '1', '1', '2020-08-21 01:05:18', '2020-08-21 01:05:18');
INSERT INTO `usuario_perfil` VALUES ('182', '179', '2', null, '1', '1', '2020-08-21 01:05:19', '2020-08-21 01:05:19');
INSERT INTO `usuario_perfil` VALUES ('183', '180', '2', null, '1', '1', '2020-08-21 01:05:19', '2020-08-21 01:05:19');
INSERT INTO `usuario_perfil` VALUES ('184', '181', '2', null, '1', '1', '2020-08-21 01:05:20', '2020-08-21 01:05:20');
INSERT INTO `usuario_perfil` VALUES ('185', '182', '2', null, '1', '1', '2020-08-21 01:05:20', '2020-08-21 01:05:20');
INSERT INTO `usuario_perfil` VALUES ('186', '183', '2', null, '1', '1', '2020-08-21 01:05:20', '2020-08-21 01:05:20');
INSERT INTO `usuario_perfil` VALUES ('187', '184', '2', null, '1', '1', '2020-08-21 01:05:21', '2020-08-21 01:05:21');
INSERT INTO `usuario_perfil` VALUES ('188', '185', '2', null, '1', '1', '2020-08-21 01:05:21', '2020-08-21 01:05:21');
INSERT INTO `usuario_perfil` VALUES ('189', '186', '2', null, '1', '1', '2020-08-21 01:05:22', '2020-08-21 01:05:22');
INSERT INTO `usuario_perfil` VALUES ('190', '187', '2', null, '1', '1', '2020-08-21 01:05:22', '2020-08-21 01:05:22');
INSERT INTO `usuario_perfil` VALUES ('191', '188', '2', null, '1', '1', '2020-08-21 01:05:23', '2020-08-21 01:05:23');
INSERT INTO `usuario_perfil` VALUES ('192', '189', '2', null, '1', '1', '2020-08-21 01:05:23', '2020-08-21 01:05:23');
INSERT INTO `usuario_perfil` VALUES ('193', '190', '2', null, '1', '1', '2020-08-21 01:05:24', '2020-08-21 01:05:24');
INSERT INTO `usuario_perfil` VALUES ('194', '191', '2', null, '1', '1', '2020-08-21 01:05:24', '2020-08-21 01:05:24');
INSERT INTO `usuario_perfil` VALUES ('195', '192', '2', null, '1', '1', '2020-08-21 01:05:25', '2020-08-21 01:05:25');
INSERT INTO `usuario_perfil` VALUES ('196', '193', '2', null, '1', '1', '2020-08-21 01:05:25', '2020-08-21 01:05:25');
INSERT INTO `usuario_perfil` VALUES ('197', '194', '2', null, '1', '1', '2020-08-21 01:05:26', '2020-08-21 01:05:26');
INSERT INTO `usuario_perfil` VALUES ('198', '195', '2', null, '1', '1', '2020-08-21 01:05:26', '2020-08-21 01:05:26');
INSERT INTO `usuario_perfil` VALUES ('199', '196', '2', null, '1', '1', '2020-08-21 01:05:27', '2020-08-21 01:05:27');
INSERT INTO `usuario_perfil` VALUES ('200', '197', '2', null, '1', '1', '2020-08-21 01:05:27', '2020-08-21 01:05:27');
INSERT INTO `usuario_perfil` VALUES ('201', '198', '2', null, '1', '1', '2020-08-21 01:05:28', '2020-08-21 01:05:28');
INSERT INTO `usuario_perfil` VALUES ('202', '199', '2', null, '1', '1', '2020-08-21 01:05:28', '2020-08-21 01:05:28');
INSERT INTO `usuario_perfil` VALUES ('203', '200', '2', null, '1', '1', '2020-08-21 01:05:29', '2020-08-21 01:05:29');
INSERT INTO `usuario_perfil` VALUES ('204', '201', '2', null, '1', '1', '2020-08-21 01:05:29', '2020-08-21 01:05:29');
INSERT INTO `usuario_perfil` VALUES ('205', '202', '2', null, '1', '1', '2020-08-21 01:05:30', '2020-08-21 01:05:30');
INSERT INTO `usuario_perfil` VALUES ('206', '203', '2', null, '1', '1', '2020-08-21 01:05:30', '2020-08-21 01:05:30');
INSERT INTO `usuario_perfil` VALUES ('207', '204', '2', null, '1', '1', '2020-08-21 01:05:31', '2020-08-21 01:05:31');
INSERT INTO `usuario_perfil` VALUES ('208', '205', '2', null, '1', '1', '2020-08-21 01:05:31', '2020-08-21 01:05:31');
INSERT INTO `usuario_perfil` VALUES ('209', '206', '1', null, '1', '1', '2020-08-21 01:48:32', '2020-08-21 01:48:32');
INSERT INTO `usuario_perfil` VALUES ('210', '207', '1', null, '1', '1', '2020-08-21 01:48:32', '2020-08-21 01:48:32');
INSERT INTO `usuario_perfil` VALUES ('211', '208', '1', null, '1', '1', '2020-08-21 01:48:33', '2020-08-21 01:48:33');
INSERT INTO `usuario_perfil` VALUES ('212', '209', '1', null, '1', '1', '2020-08-21 01:48:33', '2020-08-21 01:48:33');
INSERT INTO `usuario_perfil` VALUES ('213', '210', '1', null, '1', '1', '2020-08-21 01:48:34', '2020-08-21 01:48:34');
INSERT INTO `usuario_perfil` VALUES ('214', '211', '1', null, '1', '1', '2020-08-21 01:48:34', '2020-08-21 01:48:34');
INSERT INTO `usuario_perfil` VALUES ('215', '212', '1', null, '1', '1', '2020-08-21 01:48:35', '2020-08-21 01:48:35');
INSERT INTO `usuario_perfil` VALUES ('216', '213', '1', null, '1', '1', '2020-08-21 01:48:35', '2020-08-21 01:48:35');
INSERT INTO `usuario_perfil` VALUES ('217', '214', '1', null, '1', '1', '2020-08-21 01:48:36', '2020-08-21 01:48:36');
INSERT INTO `usuario_perfil` VALUES ('218', '215', '1', null, '1', '1', '2020-08-21 01:48:36', '2020-08-21 01:48:36');
INSERT INTO `usuario_perfil` VALUES ('219', '216', '1', null, '1', '1', '2020-08-21 01:48:36', '2020-08-21 01:48:36');
INSERT INTO `usuario_perfil` VALUES ('220', '217', '1', null, '1', '1', '2020-08-21 01:48:37', '2020-08-21 01:48:37');
INSERT INTO `usuario_perfil` VALUES ('221', '218', '1', null, '1', '1', '2020-08-21 01:48:37', '2020-08-21 01:48:37');
INSERT INTO `usuario_perfil` VALUES ('222', '219', '1', null, '1', '1', '2020-08-21 01:48:38', '2020-08-21 01:48:38');
INSERT INTO `usuario_perfil` VALUES ('223', '220', '1', null, '1', '1', '2020-08-21 01:48:38', '2020-08-21 01:48:38');
INSERT INTO `usuario_perfil` VALUES ('224', '221', '1', null, '1', '1', '2020-08-21 01:48:39', '2020-08-21 01:48:39');
INSERT INTO `usuario_perfil` VALUES ('225', '222', '1', null, '1', '1', '2020-08-21 01:48:39', '2020-08-21 01:48:39');
INSERT INTO `usuario_perfil` VALUES ('226', '223', '1', null, '1', '1', '2020-08-21 01:48:40', '2020-08-21 01:48:40');
INSERT INTO `usuario_perfil` VALUES ('227', '224', '1', null, '1', '1', '2020-08-21 01:48:40', '2020-08-21 01:48:40');
INSERT INTO `usuario_perfil` VALUES ('228', '225', '1', null, '1', '1', '2020-08-21 01:48:41', '2020-08-21 01:48:41');
INSERT INTO `usuario_perfil` VALUES ('229', '226', '1', null, '1', '1', '2020-08-21 01:48:41', '2020-08-21 01:48:41');
INSERT INTO `usuario_perfil` VALUES ('230', '227', '1', null, '1', '1', '2020-08-21 01:48:42', '2020-08-21 01:48:42');
INSERT INTO `usuario_perfil` VALUES ('231', '228', '1', null, '1', '1', '2020-08-21 01:48:42', '2020-08-21 01:48:42');
INSERT INTO `usuario_perfil` VALUES ('232', '229', '1', null, '1', '1', '2020-08-21 01:48:42', '2020-08-21 01:48:42');
INSERT INTO `usuario_perfil` VALUES ('233', '230', '1', null, '1', '1', '2020-08-21 01:48:43', '2020-08-21 01:48:43');
INSERT INTO `usuario_perfil` VALUES ('234', '231', '1', null, '1', '1', '2020-08-21 01:48:43', '2020-08-21 01:48:43');
INSERT INTO `usuario_perfil` VALUES ('235', '232', '1', null, '1', '1', '2020-08-21 01:48:44', '2020-08-21 01:48:44');
INSERT INTO `usuario_perfil` VALUES ('236', '233', '1', null, '1', '1', '2020-08-21 01:48:44', '2020-08-21 01:48:44');
INSERT INTO `usuario_perfil` VALUES ('237', '234', '1', null, '1', '1', '2020-08-21 01:48:45', '2020-08-21 01:48:45');
INSERT INTO `usuario_perfil` VALUES ('238', '235', '1', null, '1', '1', '2020-08-21 01:48:45', '2020-08-21 01:48:45');
INSERT INTO `usuario_perfil` VALUES ('239', '236', '1', null, '1', '1', '2020-08-21 01:48:46', '2020-08-21 01:48:46');
INSERT INTO `usuario_perfil` VALUES ('240', '237', '1', null, '1', '1', '2020-08-21 01:48:46', '2020-08-21 01:48:46');
INSERT INTO `usuario_perfil` VALUES ('241', '238', '1', null, '1', '1', '2020-08-21 01:48:47', '2020-08-21 01:48:47');
INSERT INTO `usuario_perfil` VALUES ('242', '239', '1', null, '1', '1', '2020-08-21 01:48:47', '2020-08-21 01:48:47');
INSERT INTO `usuario_perfil` VALUES ('243', '240', '1', null, '1', '1', '2020-08-21 01:48:48', '2020-08-21 01:48:48');
INSERT INTO `usuario_perfil` VALUES ('244', '241', '1', null, '1', '1', '2020-08-21 01:48:48', '2020-08-21 01:48:48');
INSERT INTO `usuario_perfil` VALUES ('245', '242', '1', null, '1', '1', '2020-08-21 01:48:49', '2020-08-21 01:48:49');
INSERT INTO `usuario_perfil` VALUES ('246', '243', '1', null, '1', '1', '2020-08-21 01:48:49', '2020-08-21 01:48:49');
INSERT INTO `usuario_perfil` VALUES ('247', '244', '1', null, '1', '1', '2020-08-21 01:48:50', '2020-08-21 01:48:50');
INSERT INTO `usuario_perfil` VALUES ('248', '245', '1', null, '1', '1', '2020-08-21 01:48:50', '2020-08-21 01:48:50');
INSERT INTO `usuario_perfil` VALUES ('249', '246', '1', null, '1', '1', '2020-08-21 01:48:51', '2020-08-21 01:48:51');
INSERT INTO `usuario_perfil` VALUES ('250', '247', '1', null, '1', '1', '2020-08-21 01:48:51', '2020-08-21 01:48:51');
INSERT INTO `usuario_perfil` VALUES ('251', '248', '1', null, '1', '1', '2020-08-21 01:48:51', '2020-08-21 01:48:51');
INSERT INTO `usuario_perfil` VALUES ('252', '249', '1', null, '1', '1', '2020-08-21 01:48:52', '2020-08-21 01:48:52');
INSERT INTO `usuario_perfil` VALUES ('253', '250', '1', null, '1', '1', '2020-08-21 01:48:52', '2020-08-21 01:48:52');
INSERT INTO `usuario_perfil` VALUES ('254', '251', '1', null, '1', '1', '2020-08-21 01:48:53', '2020-08-21 01:48:53');
INSERT INTO `usuario_perfil` VALUES ('255', '252', '1', null, '1', '1', '2020-08-21 01:48:53', '2020-08-21 01:48:53');
INSERT INTO `usuario_perfil` VALUES ('256', '253', '1', null, '1', '1', '2020-08-21 01:48:54', '2020-08-21 01:48:54');
INSERT INTO `usuario_perfil` VALUES ('257', '254', '1', null, '1', '1', '2020-08-21 01:48:54', '2020-08-21 01:48:54');
INSERT INTO `usuario_perfil` VALUES ('258', '255', '1', null, '1', '1', '2020-08-21 01:48:55', '2020-08-21 01:48:55');
INSERT INTO `usuario_perfil` VALUES ('259', '256', '1', null, '1', '1', '2020-08-21 01:48:55', '2020-08-21 01:48:55');
INSERT INTO `usuario_perfil` VALUES ('260', '257', '1', null, '1', '1', '2020-08-21 01:48:56', '2020-08-21 01:48:56');
INSERT INTO `usuario_perfil` VALUES ('261', '258', '1', null, '1', '1', '2020-08-21 01:48:57', '2020-08-21 01:48:57');
INSERT INTO `usuario_perfil` VALUES ('262', '259', '1', null, '1', '1', '2020-08-21 01:48:57', '2020-08-21 01:48:57');
INSERT INTO `usuario_perfil` VALUES ('263', '260', '1', null, '1', '1', '2020-08-21 01:48:58', '2020-08-21 01:48:58');
INSERT INTO `usuario_perfil` VALUES ('264', '261', '1', null, '1', '1', '2020-08-21 01:48:58', '2020-08-21 01:48:58');
INSERT INTO `usuario_perfil` VALUES ('265', '262', '1', null, '1', '1', '2020-08-21 01:48:59', '2020-08-21 01:48:59');
INSERT INTO `usuario_perfil` VALUES ('266', '263', '1', null, '1', '1', '2020-08-21 01:48:59', '2020-08-21 01:48:59');
INSERT INTO `usuario_perfil` VALUES ('267', '264', '1', null, '1', '1', '2020-08-21 01:48:59', '2020-08-21 01:48:59');
INSERT INTO `usuario_perfil` VALUES ('268', '265', '1', null, '1', '1', '2020-08-21 01:49:00', '2020-08-21 01:49:00');
INSERT INTO `usuario_perfil` VALUES ('269', '266', '1', null, '1', '1', '2020-08-21 01:49:00', '2020-08-21 01:49:00');
INSERT INTO `usuario_perfil` VALUES ('270', '267', '1', null, '1', '1', '2020-08-21 01:49:01', '2020-08-21 01:49:01');
INSERT INTO `usuario_perfil` VALUES ('271', '268', '1', null, '1', '1', '2020-08-21 01:49:02', '2020-08-21 01:49:02');
INSERT INTO `usuario_perfil` VALUES ('272', '269', '1', null, '1', '1', '2020-08-21 01:49:02', '2020-08-21 01:49:02');
INSERT INTO `usuario_perfil` VALUES ('273', '270', '1', null, '1', '1', '2020-08-21 01:49:03', '2020-08-21 01:49:03');
INSERT INTO `usuario_perfil` VALUES ('274', '271', '1', null, '1', '1', '2020-08-21 01:49:03', '2020-08-21 01:49:03');
INSERT INTO `usuario_perfil` VALUES ('275', '272', '1', null, '1', '1', '2020-08-21 01:49:04', '2020-08-21 01:49:04');
INSERT INTO `usuario_perfil` VALUES ('276', '273', '1', null, '1', '1', '2020-08-21 01:49:04', '2020-08-21 01:49:04');
INSERT INTO `usuario_perfil` VALUES ('277', '274', '1', null, '1', '1', '2020-08-21 01:49:05', '2020-08-21 01:49:05');
INSERT INTO `usuario_perfil` VALUES ('278', '275', '1', null, '1', '1', '2020-08-21 01:49:05', '2020-08-21 01:49:05');
INSERT INTO `usuario_perfil` VALUES ('279', '276', '1', null, '1', '1', '2020-08-21 01:49:05', '2020-08-21 01:49:05');
INSERT INTO `usuario_perfil` VALUES ('280', '277', '1', null, '1', '1', '2020-08-21 01:49:06', '2020-08-21 01:49:06');
INSERT INTO `usuario_perfil` VALUES ('281', '278', '1', null, '1', '1', '2020-08-21 01:49:06', '2020-08-21 01:49:06');
INSERT INTO `usuario_perfil` VALUES ('282', '279', '1', null, '1', '1', '2020-08-21 01:49:07', '2020-08-21 01:49:07');
INSERT INTO `usuario_perfil` VALUES ('283', '280', '1', null, '1', '1', '2020-08-21 01:49:07', '2020-08-21 01:49:07');
INSERT INTO `usuario_perfil` VALUES ('284', '281', '1', null, '1', '1', '2020-08-21 01:49:08', '2020-08-21 01:49:08');
INSERT INTO `usuario_perfil` VALUES ('285', '282', '1', null, '1', '1', '2020-08-21 01:49:09', '2020-08-21 01:49:09');
INSERT INTO `usuario_perfil` VALUES ('286', '283', '1', null, '1', '1', '2020-08-21 01:49:09', '2020-08-21 01:49:09');
INSERT INTO `usuario_perfil` VALUES ('287', '284', '1', null, '1', '1', '2020-08-21 01:49:10', '2020-08-21 01:49:10');
INSERT INTO `usuario_perfil` VALUES ('288', '285', '1', null, '1', '1', '2020-08-21 01:49:10', '2020-08-21 01:49:10');
INSERT INTO `usuario_perfil` VALUES ('289', '286', '1', null, '1', '1', '2020-08-21 01:49:11', '2020-08-21 01:49:11');
INSERT INTO `usuario_perfil` VALUES ('290', '287', '1', null, '1', '1', '2020-08-21 01:49:11', '2020-08-21 01:49:11');
INSERT INTO `usuario_perfil` VALUES ('291', '288', '1', null, '1', '1', '2020-08-21 01:49:12', '2020-08-21 01:49:12');
INSERT INTO `usuario_perfil` VALUES ('292', '289', '1', null, '1', '1', '2020-08-21 01:49:12', '2020-08-21 01:49:12');
INSERT INTO `usuario_perfil` VALUES ('293', '290', '1', null, '1', '1', '2020-08-21 01:49:13', '2020-08-21 01:49:13');
INSERT INTO `usuario_perfil` VALUES ('294', '291', '1', null, '1', '1', '2020-08-21 01:49:13', '2020-08-21 01:49:13');
INSERT INTO `usuario_perfil` VALUES ('295', '292', '1', null, '1', '1', '2020-08-21 01:49:14', '2020-08-21 01:49:14');
INSERT INTO `usuario_perfil` VALUES ('296', '293', '1', null, '1', '1', '2020-08-21 01:49:14', '2020-08-21 01:49:14');
INSERT INTO `usuario_perfil` VALUES ('297', '294', '1', null, '1', '1', '2020-08-21 01:49:14', '2020-08-21 01:49:14');
INSERT INTO `usuario_perfil` VALUES ('298', '295', '1', null, '1', '1', '2020-08-21 01:49:15', '2020-08-21 01:49:15');
INSERT INTO `usuario_perfil` VALUES ('299', '296', '1', null, '1', '1', '2020-08-21 01:49:15', '2020-08-21 01:49:15');
INSERT INTO `usuario_perfil` VALUES ('300', '297', '1', null, '1', '1', '2020-08-21 01:49:16', '2020-08-21 01:49:16');
INSERT INTO `usuario_perfil` VALUES ('301', '298', '1', null, '1', '1', '2020-08-21 01:49:16', '2020-08-21 01:49:16');
INSERT INTO `usuario_perfil` VALUES ('302', '299', '1', null, '1', '1', '2020-08-21 01:49:17', '2020-08-21 01:49:17');
INSERT INTO `usuario_perfil` VALUES ('303', '300', '1', null, '1', '1', '2020-08-21 01:49:17', '2020-08-21 01:49:17');
INSERT INTO `usuario_perfil` VALUES ('304', '301', '1', null, '1', '1', '2020-08-21 01:49:18', '2020-08-21 01:49:18');
INSERT INTO `usuario_perfil` VALUES ('305', '302', '1', null, '1', '1', '2020-08-21 01:49:18', '2020-08-21 01:49:18');
INSERT INTO `usuario_perfil` VALUES ('306', '303', '1', null, '1', '1', '2020-08-21 01:49:19', '2020-08-21 01:49:19');
INSERT INTO `usuario_perfil` VALUES ('307', '304', '1', null, '1', '1', '2020-08-21 01:49:19', '2020-08-21 01:49:19');
INSERT INTO `usuario_perfil` VALUES ('308', '305', '1', null, '1', '1', '2020-08-21 01:49:19', '2020-08-21 01:49:19');
INSERT INTO `usuario_perfil` VALUES ('309', '306', '1', null, '1', '1', '2020-08-21 01:49:20', '2020-08-21 01:49:20');
INSERT INTO `usuario_perfil` VALUES ('310', '307', '1', null, '1', '1', '2020-08-21 03:02:52', '2020-08-21 03:02:52');
INSERT INTO `usuario_perfil` VALUES ('311', '308', '1', null, '1', '1', '2020-08-21 03:24:20', '2020-08-21 03:24:20');
INSERT INTO `usuario_perfil` VALUES ('312', '309', '1', null, '1', '1', '2020-08-21 03:41:52', '2020-08-21 03:41:52');
INSERT INTO `usuario_perfil` VALUES ('313', '2', '3', null, '1', '1', '2020-08-21 00:41:06', '2020-08-21 00:41:08');
INSERT INTO `usuario_perfil` VALUES ('314', '310', '1', null, '1', '1', '2020-09-02 11:07:42', '2020-09-02 11:07:42');
INSERT INTO `usuario_perfil` VALUES ('315', '311', '3', null, '1', '1', '2020-09-02 11:19:09', '2020-09-02 11:19:09');
INSERT INTO `usuario_perfil` VALUES ('316', '312', '3', null, '1', '1', '2020-09-03 00:53:18', '2020-09-03 00:53:18');
INSERT INTO `usuario_perfil` VALUES ('317', '313', '2', null, '1', '1', '2020-09-03 01:02:47', '2020-09-03 01:02:47');
INSERT INTO `usuario_perfil` VALUES ('318', '314', '4', null, '1', '1', '2020-09-03 01:13:28', '2020-09-03 01:13:28');

-- ----------------------------
-- Table structure for zona
-- ----------------------------
DROP TABLE IF EXISTS `zona`;
CREATE TABLE `zona` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `co_zona` int(11) NOT NULL,
  `nb_zona` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_ciudad` int(11) NOT NULL,
  `tx_latitud` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_longitud` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `zona_co_zona_unique` (`co_zona`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of zona
-- ----------------------------
INSERT INTO `zona` VALUES ('1', '7600101', 'Nor–Occidental', '76001', null, null, null, '1', '1', null, null);
INSERT INTO `zona` VALUES ('2', '7600102', 'Nor–Oriente', '76001', null, null, null, '1', '1', null, null);
INSERT INTO `zona` VALUES ('3', '7600103', 'Dtto. Agua Blanca', '76001', null, null, null, '1', '1', null, null);
INSERT INTO `zona` VALUES ('4', '7600104', 'Oriente', '76001', null, null, null, '1', '1', null, null);
INSERT INTO `zona` VALUES ('5', '7600105', 'Sur', '76001', null, null, null, '1', '1', null, null);
INSERT INTO `zona` VALUES ('6', '7600106', 'Rural', '76001', null, null, null, '1', '1', null, null);
INSERT INTO `zona` VALUES ('7', '7600199', 'Todo Cali', '76001', null, null, null, '1', '1', null, null);

-- ----------------------------
-- View structure for vw_alumno
-- ----------------------------
DROP VIEW IF EXISTS `vw_alumno`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `vw_alumno` AS SELECT
CONCAT(alumno.nb_apellido,' ', alumno.nb_apellido2,' ',alumno.nb_nombre,' ',alumno.nb_nombre2) AS nb_nombre,
alumno.tx_sexo,
alumno.fe_nacimiento,
alumno.id_tipo_documento,
tipo_documento.nb_tipo_documento,
alumno.tx_documento,
alumno.tx_lugar_nacimiento,
alumno.tx_nacionalidad,
alumno.tx_direccion,
alumno.id_departamento,
departamento.nb_departamento,
alumno.id_ciudad,
ciudad.nb_ciudad,
alumno.tx_email,
alumno.tx_telefono,
alumno.tx_telefono2,
alumno.tx_telefono3,
`status`.nb_status,
alumno.id_status
FROM
alumno
INNER JOIN `status` ON alumno.id_status = `status`.id
LEFT JOIN departamento ON alumno.id_departamento = departamento.id
INNER JOIN tipo_documento ON alumno.id_tipo_documento = tipo_documento.id
INNER JOIN ciudad ON alumno.id_ciudad = ciudad.id
WHERE
alumno.id_usuario = 1
ORDER BY CONCAT(alumno.nb_apellido,' ', alumno.nb_apellido2,' ',alumno.nb_nombre,' ',alumno.nb_nombre2) ASC ;

-- ----------------------------
-- View structure for vw_alumno_acudiente
-- ----------------------------
DROP VIEW IF EXISTS `vw_alumno_acudiente`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `vw_alumno_acudiente` AS SELECT
alumno_pariente.id_alumno,
CONCAT(alumno.nb_apellido,' ', alumno.nb_apellido2,' ',alumno.nb_nombre,' ',alumno.nb_nombre2) AS nb_alumno,
alumno.tx_documento tx_doc_alumno,
alumno_pariente.id_pariente id_acudiente,
CONCAT(pariente.nb_apellido,' ', pariente.nb_apellido2,' ',pariente.nb_nombre,' ',pariente.nb_nombre2) AS nb_acudiente,
pariente.tx_documento tx_doc_acudiente,
pariente.id_parentesco,
parentesco.nb_parentesco
FROM
alumno_pariente
INNER JOIN alumno ON alumno_pariente.id_alumno = alumno.id
INNER JOIN pariente ON alumno_pariente.id_pariente = pariente.id
INNER JOIN parentesco ON pariente.id_parentesco = parentesco.id
ORDER BY CONCAT(alumno.nb_apellido,' ', alumno.nb_apellido2,' ',alumno.nb_nombre,' ',alumno.nb_nombre2) ASC ;

-- ----------------------------
-- View structure for vw_alumno_matricula
-- ----------------------------
DROP VIEW IF EXISTS `vw_alumno_matricula`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `vw_alumno_matricula` AS SELECT
CONCAT(
		alumno.nb_apellido,
		' ',
		alumno.nb_apellido2,
		' ',
		alumno.nb_nombre,
		' ',
		alumno.nb_nombre2
	) AS nb_nombre,
alumno.tx_sexo,
alumno.fe_nacimiento,
alumno.id_tipo_documento,
tipo_documento.nb_tipo_documento,
alumno.tx_documento,
alumno.tx_lugar_nacimiento,
alumno.tx_nacionalidad,
alumno.tx_direccion,
alumno.tx_email,
alumno.tx_telefono,
alumno.tx_telefono2,
alumno.tx_telefono3,
`status`.nb_status,
matricula.fe_matricula,
grupo.nb_grupo,
grupo.id id_grupo,
grado.id id_grado,
grado.nb_grado,
tipo_condicion.id id_tipo_condicion,
tipo_condicion.nb_tipo_condicion,
calendario.id id_calendario,
calendario.nb_calendario
FROM
	alumno
INNER JOIN `status` ON alumno.id_status = `status`.id
INNER JOIN tipo_documento ON alumno.id_tipo_documento = tipo_documento.id
INNER JOIN matricula ON matricula.id_alumno = alumno.id
INNER JOIN grado ON matricula.id_grado = grado.id
INNER JOIN grupo ON grupo.id_grado = grado.id
AND matricula.id_grupo = grupo.id
INNER JOIN tipo_condicion ON matricula.id_tipo_condicion = tipo_condicion.id
INNER JOIN calendario ON matricula.id_calendario = calendario.id
WHERE
	alumno.id_usuario = 1
AND calendario.id = (select id_calendario from colegio where id = 1)
ORDER BY
	CONCAT(
		alumno.nb_apellido,
		' ',
		alumno.nb_apellido2,
		' ',
		alumno.nb_nombre,
		' ',
		alumno.nb_nombre2
	) ASC ;

-- ----------------------------
-- View structure for vw_alumno_sin_matricula
-- ----------------------------
DROP VIEW IF EXISTS `vw_alumno_sin_matricula`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `vw_alumno_sin_matricula` AS SELECT
	CONCAT(
		alumno.nb_apellido,
		' ',
		alumno.nb_apellido2,
		' ',
		alumno.nb_nombre,
		' ',
		alumno.nb_nombre2
	) AS nb_nombre,
	alumno.tx_sexo,
	alumno.fe_nacimiento,
	alumno.id_tipo_documento,
	tipo_documento.nb_tipo_documento,
	alumno.tx_documento,
	alumno.tx_lugar_nacimiento,
	alumno.tx_nacionalidad,
	alumno.tx_direccion,
	alumno.id_departamento,
	departamento.nb_departamento,
	alumno.id_ciudad,
	ciudad.nb_ciudad,
	alumno.tx_email,
	alumno.tx_telefono,
	alumno.tx_telefono2,
	alumno.tx_telefono3,
	`status`.nb_status,
	alumno.id_status
FROM
	alumno
INNER JOIN `status` ON alumno.id_status = `status`.id
LEFT JOIN departamento ON alumno.id_departamento = departamento.id
INNER JOIN tipo_documento ON alumno.id_tipo_documento = tipo_documento.id
INNER JOIN ciudad ON alumno.id_ciudad = ciudad.id
WHERE
	alumno.id NOT IN (
		SELECT
			id_alumno
		FROM
			matricula
		WHERE
			id_calendario = (
				SELECT
					id_calendario
				FROM
					colegio
				WHERE
					id = 1
			)
	)
ORDER BY
	CONCAT(
		alumno.nb_apellido,
		' ',
		alumno.nb_apellido2,
		' ',
		alumno.nb_nombre,
		' ',
		alumno.nb_nombre2
	) ASC ;

-- ----------------------------
-- View structure for vw_docente
-- ----------------------------
DROP VIEW IF EXISTS `vw_docente`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost`  VIEW `vw_docente` AS SELECT
docente.id,
docente.nb_apellido,
docente.nb_apellido2,
docente.nb_nombre,
docente.nb_nombre2,
docente.id_tipo_documento,
docente.tx_documento,
docente.id_estado_civil,
docente.tx_sexo,
docente.fe_nacimiento,
docente.tx_nacionalidad,
docente.tx_lugar_nacimiento,
docente.tx_direccion,
docente.id_departamento,
docente.id_ciudad,
docente.tx_email,
docente.tx_telefono,
docente.tx_telefono_movil,
estado_civil.nb_estado_civil,
tipo_documento.nb_tipo_documento,
departamento.co_departamento,
ciudad.nb_ciudad
FROM
docente
INNER JOIN estado_civil ON docente.id_estado_civil = estado_civil.id
INNER JOIN tipo_documento ON docente.id_tipo_documento = tipo_documento.id
INNER JOIN departamento ON docente.id_departamento = departamento.id
INNER JOIN ciudad ON docente.id_ciudad = ciudad.id ;

-- ----------------------------
-- View structure for vw_grado_materia
-- ----------------------------
DROP VIEW IF EXISTS `vw_grado_materia`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost`  VIEW `vw_grado_materia` AS SELECT
grado.id,
grado.nb_grado,
grado.nu_grado,
grado_materia.id_grado,
materia.nb_materia,
grado_materia.id_materia,
materia.co_materia,
materia.id_area_estudio,
area_estudio.nb_area_estudio
FROM
grado
INNER JOIN grado_materia ON grado_materia.id_grado = grado.id
INNER JOIN materia ON grado_materia.id_materia = materia.id
INNER JOIN area_estudio ON materia.id_area_estudio = area_estudio.id ;

-- ----------------------------
-- View structure for vw_grupo
-- ----------------------------
DROP VIEW IF EXISTS `vw_grupo`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost`  VIEW `vw_grupo` AS SELECT
grupo.nb_grupo,
grupo.nu_orden nu_orden_grupo,
grupo.id_grado,
grado.nb_grado,
grado.nu_grado nu_orden_grado,
grado.id_nivel,
nivel.nb_nivel,
grupo.id_calendario,
calendario.nb_calendario,
grupo.id_turno,
turno.nb_turno,
grupo.id_docente,
CONCAT(docente.nb_nombre, ' ' ,docente.nb_apellido2, ' ', docente.nb_apellido, ' ', docente.nb_nombre2) nb_docente
FROM
grupo
INNER JOIN grado ON grupo.id_grado = grado.id
INNER JOIN nivel ON grado.id_nivel = nivel.id
INNER JOIN calendario ON grupo.id_calendario = calendario.id
INNER JOIN docente ON grupo.id_docente = docente.id
INNER JOIN turno ON grupo.id_turno = turno.id
WHERE calendario.id = (SELECT id_calendario from colegio where id = 1) ;

-- ----------------------------
-- View structure for vw_grupo_materia
-- ----------------------------
DROP VIEW IF EXISTS `vw_grupo_materia`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost`  VIEW `vw_grupo_materia` AS SELECT
grupo_materia.id_grupo,
grupo.nb_grupo,
grupo.nu_orden,
grupo_materia.id_materia,
materia.nb_materia,
materia.co_materia,
materia.id_area_estudio,
area_estudio.nb_area_estudio,
grupo.id_calendario,
calendario.nb_calendario
FROM
grupo_materia
INNER JOIN materia ON grupo_materia.id_materia = materia.id 
INNER JOIN grupo ON grupo_materia.id_grupo = grupo.id 
INNER JOIN area_estudio ON materia.id_area_estudio = area_estudio.id 
INNER JOIN calendario ON grupo.id_calendario = calendario.id ;

-- ----------------------------
-- View structure for vw_materia
-- ----------------------------
DROP VIEW IF EXISTS `vw_materia`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost`  VIEW `vw_materia` AS SELECT
materia.nb_materia,
materia.co_materia,
materia.id_area_estudio,
area_estudio.nb_area_estudio
FROM
materia ,
area_estudio ;

-- ----------------------------
-- View structure for vw_usuario
-- ----------------------------
DROP VIEW IF EXISTS `vw_usuario`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost`  VIEW `vw_usuario` AS SELECT
	usuario.nb_nombres,
	usuario.nb_usuario,
	usuario.tx_email,
	usuario.id_tipo_usuario,
	tipo_usuario.nb_tipo_usuario,
	usuario.id_status,
	`status`.nb_status
FROM
	usuario
INNER JOIN tipo_usuario ON usuario.id_tipo_usuario = tipo_usuario.id
INNER JOIN `status` ON usuario.id_status = `status`.id ;

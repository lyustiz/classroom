/*
Navicat MySQL Data Transfer

Source Server         : desdecasa
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : classroom

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2021-04-07 22:25:29
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for actividad
-- ----------------------------
DROP TABLE IF EXISTS `actividad`;
CREATE TABLE `actividad` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nb_actividad` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `id_tema` int(11) unsigned NOT NULL,
  `tx_descripcion` varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) unsigned NOT NULL,
  `id_usuario` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_actividad_tema` (`id_tema`),
  KEY `fk_actividad_status` (`id_status`),
  KEY `fk_actividad_usuario` (`id_usuario`),
  CONSTRAINT `fk_actividad_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`),
  CONSTRAINT `fk_actividad_tema` FOREIGN KEY (`id_tema`) REFERENCES `tema` (`id`),
  CONSTRAINT `fk_actividad_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of actividad
-- ----------------------------

-- ----------------------------
-- Table structure for actividad_pregunta
-- ----------------------------
DROP TABLE IF EXISTS `actividad_pregunta`;
CREATE TABLE `actividad_pregunta` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_pregunta` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nb_descripcion` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_actividad` int(11) unsigned NOT NULL,
  `id_tipo_pregunta` int(11) unsigned NOT NULL,
  `bo_opcional` tinyint(1) NOT NULL DEFAULT 0,
  `nu_valor` decimal(8,2) NOT NULL DEFAULT 0.00,
  `nu_orden` int(11) NOT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) unsigned NOT NULL,
  `id_usuario` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_actividad_pregunta_actividad` (`id_actividad`),
  KEY `fk_actividad_pregunta_tipo_pregunta` (`id_tipo_pregunta`),
  KEY `fk_actividad_pregunta_status` (`id_status`),
  KEY `fk_actividad_pregunta_usuario` (`id_usuario`),
  CONSTRAINT `fk_actividad_pregunta_actividad` FOREIGN KEY (`id_actividad`) REFERENCES `actividad` (`id`),
  CONSTRAINT `fk_actividad_pregunta_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`),
  CONSTRAINT `fk_actividad_pregunta_tipo_pregunta` FOREIGN KEY (`id_tipo_pregunta`) REFERENCES `tipo_pregunta` (`id`),
  CONSTRAINT `fk_actividad_pregunta_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of actividad_pregunta
-- ----------------------------

-- ----------------------------
-- Table structure for actividad_respuesta
-- ----------------------------
DROP TABLE IF EXISTS `actividad_respuesta`;
CREATE TABLE `actividad_respuesta` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_respuesta` varchar(600) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_actividad_pregunta` int(11) unsigned NOT NULL,
  `bo_correcta` tinyint(1) NOT NULL,
  `nu_valor` decimal(8,2) DEFAULT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) unsigned NOT NULL,
  `id_usuario` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_actividad_respuesta_actividad_pregunta` (`id_actividad_pregunta`),
  KEY `fk_actividad_respuesta_status` (`id_status`),
  KEY `fk_actividad_respuesta_usuario` (`id_usuario`),
  CONSTRAINT `fk_actividad_respuesta_actividad_pregunta` FOREIGN KEY (`id_actividad_pregunta`) REFERENCES `actividad_pregunta` (`id`),
  CONSTRAINT `fk_actividad_respuesta_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`),
  CONSTRAINT `fk_actividad_respuesta_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of actividad_respuesta
-- ----------------------------

-- ----------------------------
-- Table structure for agenda
-- ----------------------------
DROP TABLE IF EXISTS `agenda`;
CREATE TABLE `agenda` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_agenda` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_calendario` int(11) unsigned NOT NULL,
  `id_tipo_agenda` int(11) unsigned NOT NULL,
  `id_agenda_actividad` int(11) unsigned NOT NULL,
  `fe_agenda` date NOT NULL,
  `hh_inicio` time NOT NULL,
  `hh_fin` time NOT NULL,
  `id_origen` int(11) unsigned NOT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) unsigned NOT NULL,
  `id_usuario` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_agenda_calendario` (`id_calendario`),
  KEY `fk_agenda_tipo_agenda` (`id_tipo_agenda`),
  KEY `fk_agenda_agenda_actividad` (`id_agenda_actividad`),
  KEY `fk_agenda_status` (`id_status`),
  KEY `fk_agenda_usuario` (`id_usuario`),
  CONSTRAINT `fk_agenda_agenda_actividad` FOREIGN KEY (`id_agenda_actividad`) REFERENCES `agenda_actividad` (`id`),
  CONSTRAINT `fk_agenda_calendario` FOREIGN KEY (`id_calendario`) REFERENCES `calendario` (`id`),
  CONSTRAINT `fk_agenda_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`),
  CONSTRAINT `fk_agenda_tipo_agenda` FOREIGN KEY (`id_tipo_agenda`) REFERENCES `tipo_agenda` (`id`),
  CONSTRAINT `fk_agenda_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of agenda
-- ----------------------------

-- ----------------------------
-- Table structure for agenda_actividad
-- ----------------------------
DROP TABLE IF EXISTS `agenda_actividad`;
CREATE TABLE `agenda_actividad` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_agenda_actividad` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tx_icono` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tx_color` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) unsigned NOT NULL,
  `id_usuario` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_agenda_actividad_status` (`id_status`),
  KEY `fk_agenda_actividad_usuario` (`id_usuario`),
  CONSTRAINT `fk_agenda_actividad_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`),
  CONSTRAINT `fk_agenda_actividad_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of agenda_actividad
-- ----------------------------
INSERT INTO `agenda_actividad` VALUES ('1', 'Deporte', 'mdi-volleyball', 'amber', null, '1', '1', '2021-04-07 03:11:55', '2021-04-07 03:12:09');

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
  `id_tipo_documento` int(11) unsigned NOT NULL,
  `tx_documento` varchar(12) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_sexo` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fe_nacimiento` date DEFAULT NULL,
  `tx_nacionalidad` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `tx_lugar_nacimiento` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_direccion` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_departamento` int(11) unsigned NOT NULL,
  `id_ciudad` int(11) unsigned NOT NULL,
  `tx_email` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_telefono` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_telefono2` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_telefono3` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) unsigned NOT NULL,
  `id_usuario` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_alumno_tipo_documento` (`id_tipo_documento`),
  KEY `fk_alumno_departamento` (`id_departamento`),
  KEY `fk_alumno_ciudad` (`id_ciudad`),
  KEY `fk_alumno_status` (`id_status`),
  KEY `fk_alumno_usuario` (`id_usuario`),
  CONSTRAINT `fk_alumno_ciudad` FOREIGN KEY (`id_ciudad`) REFERENCES `ciudad` (`id`),
  CONSTRAINT `fk_alumno_departamento` FOREIGN KEY (`id_departamento`) REFERENCES `departamento` (`id`),
  CONSTRAINT `fk_alumno_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`),
  CONSTRAINT `fk_alumno_tipo_documento` FOREIGN KEY (`id_tipo_documento`) REFERENCES `tipo_documento` (`id`),
  CONSTRAINT `fk_alumno_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=778 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of alumno
-- ----------------------------
INSERT INTO `alumno` VALUES ('1', 'Yustiz', 'Tovar', 'Jean', 'Pierre', '1', '31122290', 'M', '2007-06-22', 'Venezolano', 'Caracas', 'Calle 3 con 4', '76', '1004', 'jyustiz@gmailcom', '04129098862', '04129098862', '04129098862', null, '1', '1', '2020-05-17 04:47:28', '2021-04-07 18:11:36');
INSERT INTO `alumno` VALUES ('500', 'Hernandez ', 'Arrieta', 'Sofia ', 'Carolina', '1', '1043458377', 'F', null, 'Colombiano', null, null, '47', '682', 'anyisarrieta17@gmail.com', '3042425981', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('501', 'Arrieta ', 'Rodriguez', 'Elizabeth', '', '1', '1082571371', 'F', null, 'Colombiano', null, null, '47', '682', 'anyisarrieta17@gmail.com', '3042425981', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('502', 'Anaya', 'Zapata', 'Laura', 'Daniela', '1', '1082067956', 'F', null, 'Colombiano', null, null, '47', '682', 'danielanaya@autlook.es', '3015581084', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('503', 'Lopez ', 'Ferias', 'Miller ', 'Andres', '1', '1046711858', 'M', null, 'Colombiano', null, null, '47', '682', 'allo.lopez@hotmail.com', '3504414016', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('504', 'Caballero ', 'Gomez', 'Omer ', 'Camilo', '1', '1082571335', 'M', null, 'Colombiano', null, null, '47', '682', 'sandragomezbobadillo92@gmail.c', '3113179587', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('505', 'Mercado ', 'Buelvas', 'Luis ', 'Jose', '1', '1082067895', 'M', null, 'Colombiano', null, null, '47', '682', 'wen3135464713@gmail.com', '3225863245', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('506', 'Alfaro', 'Barrios', 'Joel ', 'David', '1', '1082571498', 'M', null, 'Colombiano', null, null, '47', '682', 'alfarojoeldavid@gmail.com', '3127416159', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('507', 'Medina', 'Serrano', 'Santiago ', 'Andres', '1', '1082571481', 'M', null, 'Colombiano', null, null, '47', '682', 'serranomoscotemarlenejudith@gm', '3138255211', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('508', 'Ospino ', 'Charris', 'Danna ', 'Lucia', '1', '1082571320', 'F', null, 'Colombiano', null, null, '47', '682', 'javierospino71@gmail.com', '3002037568', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('509', 'Tetay', 'Valencia', 'Samuel', 'Yesith', '1', '1220214795', 'M', null, 'Colombiano', null, null, '47', '682', 'danielavalente_18@hotmail.com', '3202248285', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('510', 'Jimenez', 'Marenco', 'Tomas ', 'Jose', '1', '1082571283', 'M', null, 'Colombiano', null, null, '47', '682', 'luzangelamarquezmarenco@hotmai', '3016287112', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('511', 'Altamar ', 'Hernandez', 'Sergio', 'David', '1', '1082571319', 'M', null, 'Colombiano', null, null, '47', '682', 'ih6503481@gmail.com', '3125552714', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('512', 'Caparroso ', 'Cortina', 'Valeska', 'Sofia', '1', '1082571495', 'F', null, 'Colombiano', null, null, '47', '682', 'eduarcaparroso681@hotmail.com', '3205106277', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('513', 'Diaz ', 'Ospino', 'Juan ', 'David', '1', '1082067771', 'M', null, 'Colombiano', null, null, '47', '682', 'liliadiazospino@gmail.com', '3145091672', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('514', 'Jimenez ', 'Salcedo', 'Juan', 'David', '1', '1082571431', 'M', null, 'Colombiano', null, null, '47', '682', 'johanasalcedo1520@gmail.com', '3168288338', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('515', 'Bustamante ', 'Ordoñez', 'Angel ', 'David', '1', '1063491254', 'M', null, 'Colombiano', null, null, '47', '682', 'betsyordones1@gmail.com', '3166967554', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('516', 'Castilla ', 'Sierra', 'Maria ', 'Celinda', '1', '1082067787', 'F', null, 'Colombiano', null, null, '47', '682', 'kasie@hotmail.com', '3122595990', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('517', 'Barrios ', 'Muñoz', 'Emanuel ', 'Andres', '1', '1082570814', 'M', null, 'Colombiano', null, null, '47', '682', 'emanuelandresba@gmail.com', '3168698957', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('518', 'Ortega ', 'Vega', 'Tifany ', 'Maibeth', '1', '1082570822', 'F', null, 'Colombiano', null, null, '47', '682', 'greysizquierdoortega2110@gmail', '3107066827', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('519', 'Ramos ', 'Montero', 'Juan ', 'Miguel', '1', '1082570660', 'M', null, 'Colombiano', null, null, '47', '682', 'juanramosmontero858@gmail.com', '3016336961', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('520', 'Jimenez ', 'Salcedo', 'Jimy De Jesus', '', '1', '1082570940', 'M', null, 'Colombiano', null, null, '47', '682', 'yimmyjimenez827@gmail.com', '3102045064', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('521', 'Mattos ', 'Andrades', 'Stiven De Jesus', '', '1', '1082065514', 'M', null, 'Colombiano', null, null, '47', '682', 'stivenmattos15@gmail.com', '3016133826', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('522', 'Cerpa ', 'Payares', 'Tays Del Carmen', '', '1', '1082570571', 'F', null, 'Colombiano', null, null, '47', '682', 'thaiscerpa1@gmail.com', '3007486779', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('523', 'Ordonez', 'Lima', 'Camilo ', 'Amith', '1', '1082570632', 'M', null, 'Colombiano', null, null, '47', '682', 'camilohernandez17789@gmail.com', '3043507364', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('524', 'Borrero ', 'Miranda', 'Leonel ', 'David', '1', '1081915246', 'M', null, 'Colombiano', null, null, '47', '682', 'etimiranda@hotmail.com', '3042886717', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('525', 'Gomez ', 'Arrieta', 'Maria ', 'Lucia', '1', '1082065964', 'F', null, 'Colombiano', null, null, '47', '682', 'yaquelineester44@gmail.com', '3046196468', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('526', 'Ortega ', 'Hernadez', 'Daniela ', 'Valentina', '1', '1082065415', 'F', null, 'Colombiano', null, null, '47', '682', 'greysizquierdoortega2110@gmail', '3107066827', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('527', 'Roncallo ', 'Polo', 'Milagros', '', '1', '1082570759', 'F', null, 'Colombiano', null, null, '47', '682', 'roncallomilagro@gmail.com', '3002780391', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('528', 'Sanchez ', 'Cantillo', 'Valery', 'Nicolle', '1', '1082066057', 'F', null, 'Colombiano', null, null, '47', '682', 'cantillomar1990@gmail.com', '3023802712', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('529', 'Anaya ', 'Padilla', 'Maria ', 'Fernanda', '1', '1082790971', 'F', null, 'Colombiano', null, null, '47', '682', 'mariafernandaanayapadilla@gmai', '3226268087', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('530', 'Ortiz ', 'Andrades', 'Oscar', 'Andres', '1', '1082570565', 'M', null, 'Colombiano', null, null, '47', '682', 'ortizaoscarandres@gmail.com', '3218116398', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('531', 'Moscote ', 'Roncallo', 'Anthony ', 'Fabian', '1', '1082570614', 'M', null, 'Colombiano', null, null, '47', '682', 'moscoteanthony@gmail.com', '3043466820', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('532', 'Moscote', 'Hernandez', 'Yaris', 'Lorena', '1', '1082570786', 'F', null, 'Colombiano', null, null, '47', '682', 'moscoteashley@gmail.com', '3108764020', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('533', 'Lopez ', 'Mercado', 'Paula ', 'Andrea', '1', '1082570209', 'F', null, 'Colombiano', null, null, '47', '682', 'paolopez@gmail.com', '3003792066', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('534', 'Romero', 'Jimenez', 'Milagro De Jesus', '', '1', '1082570524', 'F', null, 'Colombiano', null, null, '47', '682', 'mijeroji@gmail.com', '3134713833', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('535', 'Anaya ', 'Padilla', 'Maria ', 'Luisa', '1', '1082065342', 'F', null, 'Colombiano', null, null, '47', '682', 'anayapadillamarialuisa@gmail.c', '3226268087', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('536', 'Berrio ', 'Sandoval', 'Camilo ', 'Andres', '1', '1082067824', 'M', null, 'Colombiano', null, null, '47', '682', 'camiloberriosandoval@gmail.com', '3117574674', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('537', 'Olivera ', 'Gonzales ', 'Linda ', 'Marcela', '1', '1143248757', 'F', null, 'Colombiano', null, null, '47', '682', 'sheylaluzney123@gmail.com', '3043493983', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('538', 'Iglesia ', 'Caro', 'Emili ', 'Yiseth', '1', '1083569837', 'F', null, 'Colombiano', null, null, '47', '661', 'evilithcaro85@gmail. Com', '3024089531', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('539', 'Marin ', 'Cantillo', 'Katherin ', 'Marcela', '1', '1083568226', 'F', null, 'Colombiano', null, null, '47', '661', 'Dainercantillo28@gmail. Com', '3226034370', '3243709377', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('540', 'Gamez', 'Leon', 'Andrea ', 'Camila', '1', '108945322', 'F', null, 'Colombiano', null, null, '47', '661', 'landis1980@hotmail.com', '3122603393', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('541', 'Quiroga', 'Oses', 'Jesus', 'David', '1', '1030181166', 'M', null, 'Colombiano', null, null, '47', '661', 'Lidiaosses76@gmail.com', '3135202608', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('542', 'Viloria ', 'Toscano', 'Anelith', '', '1', '1080434847', 'F', null, 'Colombiano', null, null, '47', '661', 'yesicatoscano08@gmail.com', '3178247206', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('543', 'Beltran ', 'Llanos', 'Angel ', 'Samuel', '1', '1176963350', 'M', null, 'Colombiano', null, null, '47', '661', 'eloisasofiaahrroa@gmail.com', '3012454773', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('544', 'Camargo ', 'Lobo', 'Takianis ', 'Jhoanna', '1', '1043160333', 'F', null, 'Colombiano', null, null, '47', '661', 'takianiscamargo@gmail .com', '3042701755', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('545', 'Duque ', 'Nuñez', 'Maria ', 'Jose', '1', '1080435630', 'F', null, 'Colombiano', null, null, '47', '661', 'nayetsynuyezgranados@gmail.com', '31448129322', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('546', 'Martinez ', 'Guzman', 'Joselin ', 'Paola', '1', '1016069280', 'F', null, 'Colombiano', null, null, '47', '661', 'josrlinmartinez guzman08@gmail', '3042569821', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('547', 'Montaño', 'Arango', 'Samuel ', 'David', '1', '1083571808', 'M', null, 'Colombiano', null, null, '47', '661', 'samuelmontaño529@gmail', '3046631625', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('548', 'Puerto ', 'Polo', 'Ana ', 'Sofia', '1', '1176864123', 'F', null, 'Colombiano', null, null, '47', '661', 'anadofiapuertopolo@outlook.es', '3059174061', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('549', 'Avila ', 'Payares', 'Maria', 'Jose', '1', '1139433930', 'F', null, 'Colombiano', null, null, '47', '661', 'sindrypaola@gmail.com', '3225234224', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('550', 'Acosta ', 'Castillo', 'Wendy', 'Vanessa', '1', '1176964464', 'F', null, 'Colombiano', null, null, '47', '661', 'yuliethpaola2709@gmail.com', '30236443833', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('551', 'Contreras ', 'Polo', 'Silvana ', 'Maria', '1', '1221963100', 'F', null, 'Colombiano', null, null, '47', '661', 'daysilvacontreras@gmail.com', '3147664752', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('552', 'Gonzalez ', 'Herrera', 'Jose ', 'Miguel', '1', '1176963519', 'M', null, 'Colombiano', null, null, '47', '661', 'nellyherreraeloasis@gmail.com', '301259857', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('553', 'Manga ', 'Jimenez', 'Anderson', 'David', '1', '1083565844', 'M', null, 'Colombiano', null, null, '47', '661', 'jimenezmayerlis3@gmail.com', '3202680081', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('554', 'Morelo ', 'Granados', 'Valeria ', 'Sofia', '1', '1080434731', 'F', null, 'Colombiano', null, null, '47', '661', 'lunazullyare@gmail.com', '3002783125', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('555', 'Moreno ', 'Ariza', 'Julian', '', '1', '1011219443', 'M', null, 'Colombiano', null, null, '47', '661', 'lizariza2020@gmail.com', '3219915953', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('556', 'Miranda ', 'Velasquez', 'Yiceth ', 'Carolina', '1', '1176964986', 'F', null, 'Colombiano', null, null, '47', '661', 'merlisvelasquez2016@gmail.com', '3007435016', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('557', 'Yance ', 'Casas', 'Paul', 'Paul', '1', '1083571061', 'M', null, 'Colombiano', null, null, '47', '661', 'kurielpa2016', '3204536445', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('558', 'Beltran ', 'Llanos', 'Hasmeth', 'David', '1', '1004163836', 'M', null, 'Colombiano', null, null, '47', '661', 'karinacn.2006@gmail.com', '3146786688', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('559', 'Cantillo ', 'Navarro', 'Danna ', 'Marcela', '1', '1080427960', 'F', null, 'Colombiano', null, null, '47', '661', 'dannanavarrocantillo@gmail.com', '3008716805', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('560', 'Cantillo ', 'Manota', 'Dainer ', 'Alfonso', '1', '1803460828', 'M', null, 'Colombiano', null, null, '47', '661', 'dainerorozco4@gmail.com', '3017425432', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('561', 'Escobar ', 'Fontalvo', 'Mateo', '', '1', '1080426306', 'M', null, 'Colombiano', null, null, '47', '661', 'mateoestibenescobarfontalvo@gm', '3044620941', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('562', 'Fontalvo ', 'Orozco', 'Luis ', 'Mario', '1', '1004378676', 'M', null, 'Colombiano', null, null, '47', '661', 'fontalvoluismario50@gmail.com', '3023364877', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('563', 'Guerrero', 'Donado', 'Dilan', '', '1', '1083460996', 'M', null, 'Colombiano', null, null, '47', '661', 'dilandonadofre8@gmail.com', '3044485604', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('564', 'Iglesia ', 'Caro', 'José ', 'María', '1', '1080426412', 'M', null, 'Colombiano', null, null, '47', '661', 'iglesiajose998@gmail.com', '3022688582', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('565', 'Mejía ', 'Melendez', 'Kelly', 'Valeria', '1', '1080423280', 'F', null, 'Colombiano', null, null, '47', '661', 'mejiamelendezk@gmail.com', '3012095728', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('566', 'Rada ', 'Monsalvo', 'Duberlin ', 'Maria', '1', '1080421035', 'F', null, 'Colombiano', null, null, '47', '661', 'duberlinramo@gmail.com', '3043473067', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('567', 'Suárez', 'De La Cruz', 'Deis ', 'David', '1', '1080426200', 'M', null, 'Colombiano', null, null, '47', '661', 'deissuarez30@gmail.com', '3022617094', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('568', 'Torres Ahumada', 'Ahumada', 'Valentina', 'De Jesus', '1', '1004163887', 'F', null, 'Colombiano', null, null, '47', '661', 'valentinatahu@gmail.com', '3043487352', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('569', 'Aguilar Fernandez', 'Fernandez', 'Maria', 'Fernanda', '1', '1083463645', 'F', null, 'Colombiano', null, null, '47', '661', 'aguilarmariaf6@hotmail.com', '3142843040', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('570', 'Aguilar Fernandez', 'Fernandez', 'Mitchel ', 'Dayana', '1', '1083464636', 'F', null, 'Colombiano', null, null, '47', '661', 'aguilarmichelf6@outlook.com', '3142843040', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('571', 'Berdugo Estrada', 'Estrada', 'Kemel ', 'David', '1', '1080422431', 'M', null, 'Colombiano', null, null, '47', '661', 'berdugokemel9@hotmail.com', '3222126339', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('572', 'Cavadia Mozo', 'Mozo', 'Miguel', 'David', '1', '1081796517', 'M', null, 'Colombiano', null, null, '47', '661', 'cavadiamiguel9@hotmail.com', '3116248721', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('573', 'Garcia Torres', 'Torres', 'Maithe', 'Alejandra', '1', '1044604479', 'F', null, 'Colombiano', null, null, '47', '661', 'garciamaithe9@hotmail.com', '3148656422', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('574', 'Gonzalez Gutierrez', 'Gutierrez', 'Maria', 'Alejandra', '1', '1080438272', 'F', null, 'Colombiano', null, null, '47', '661', 'gonzalezmaria877@hotmail.com', '3002993547', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('575', 'Guette Castro', 'Castro', 'Julian ', 'David', '1', '1083467163', 'M', null, 'Colombiano', null, null, '47', '661', 'guettejulian@outlook.com', '3002993547', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('576', 'Martinez Caro', 'Caro', 'Richard', 'David', '1', '1121533886', 'M', null, 'Colombiano', null, null, '47', '661', 'rm7691889@gmail.com', '3013046144', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('577', 'Montenegro Toro', 'Toro', 'Jefferson ', 'Raul', '1', '1069587853', 'M', null, 'Colombiano', null, null, '47', '661', 'jrmt2408@gmail.com', '3015235529', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('578', 'Orozco Ramirez', 'Ramirez', 'Juan ', 'Santiago', '1', '10804266011', 'M', null, 'Colombiano', null, null, '47', '661', 'yanirisramirez82@gmail.com', '3006655619', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('579', 'Villamil Castro', 'Castro', 'Andrea', 'Carolina', '1', '1080424428', 'F', null, 'Colombiano', null, null, '47', '661', 'Andreavillamil2005@gmail.com', '3046548605', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('580', 'Cadena Gutierrez', 'Gutierrez', 'Luis', 'Fernando Rep.', '1', '1083458308', 'M', null, 'Colombiano', null, null, '47', '661', 'lisethgutu@hotmail.com', '3002013470', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('581', 'Arrieta ', 'Arrieta', 'Genesis', 'Sharick', '1', '1083567314', 'F', null, 'Colombiano', null, null, '47', '661', 'gdearrieta26@gmail.com', '30024116050', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('582', 'Arevalo', 'Anchila', 'Reyvi', 'Arturo', '1', '1083567137', 'M', null, 'Colombiano', null, null, '47', '661', 'duniaarevaloanchila@gmail.com', '3042000235', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('583', 'Boneth', 'Polo', 'Valentina', 'Michel', '1', '1080434451', 'F', null, 'Colombiano', null, null, '47', '661', 'gabyrojas1808@gmail.com', '3023370118', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('584', 'Contreras ', 'Polo', 'Dayanis', 'Marcela', '1', '10083566997', 'F', null, 'Colombiano', null, null, '47', '661', 'dayisilvacontrera@gmail.com', '3175831088', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('585', 'Jimenez', 'Torres', 'Jonathan', 'David ', '1', '1083554120', 'M', null, 'Colombiano', null, null, '47', '661', 'milagrostoncelnoriega@gmail.co', '3042570466', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('586', 'Jimeno', 'Marmol', 'Brayan', 'Camilo', '1', '1080431286', 'M', null, 'Colombiano', null, null, '47', '661', 'noderlyjimenosalas@gmail.com', '3043437585', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('587', 'Polo', 'Montenegro', 'Cesar', 'David', '1', '1080435303', 'M', null, 'Colombiano', null, null, '47', '661', 'dayisilvacontrera@gmail.com', '3175831088', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('588', 'Sierra', 'Varela', 'Juan', 'David ', '1', '1080430576', 'M', null, 'Colombiano', null, null, '47', '661', 'juandavidsierravalera@gmail.co', '3043611844', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('589', 'Maz', 'Trujillo', 'Dylan', 'Andres', '1', '1083000579', 'M', null, 'Colombiano', null, null, '47', '661', 'mary.trujillo@hotmail.com', '3008499400', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('590', 'Marin ', 'Ramirez', 'Keiner ', 'Alejandro', '1', '1083461295', 'M', null, 'Colombiano', null, null, '47', '661', 'marinkeiner9@hotmail.com', '3022649269', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('591', 'Mora', 'Centeno', 'Yoimar', 'Santiago', '1', '1080432610', 'M', null, 'Colombiano', null, null, '47', '661', 'morayoimar9@outlook.com', '3043849968', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('592', 'Muñoz', 'Hernandez', 'Gisela ', 'Carolina', '1', '1080427210', 'F', null, 'Colombiano', null, null, '47', '661', 'munozyisela9@hotmail.com', '3016363747', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('593', 'Niebles', 'Charris', 'Camila ', 'Andrea', '1', '1084727023', 'F', null, 'Colombiano', null, null, '47', '661', 'nieblescamila9@hotmail.com', '3012490066', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('594', 'Romero', 'Ospina', 'Sergio ', 'Andres', '1', '1083552858', 'M', null, 'Colombiano', null, null, '47', '661', 'romerosergio9@hotmail.com', '3003067097', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('595', 'Salas', 'Ramirez', 'David', 'Daniel', '1', '1004162740', 'M', null, 'Colombiano', null, null, '47', '661', 'salasd5736@gmail.com', '3145411908', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('596', 'Villanueva', 'Castrillo', 'Juan', 'David', '1', '10890423254', 'M', null, 'Colombiano', null, null, '47', '661', 'villanuevajuan4240@gmail.com', '3145421949', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('597', 'Zuñiga', 'Julio', 'Jazbleidi', 'Dianeth', '1', '1083464780', 'F', null, 'Colombiano', null, null, '47', '661', 'zunigajasbleidis@hotmail.com', '3015862855', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('598', 'Marquez', 'Charris', 'Osnuaider', '', '1', '10840426193', 'M', null, 'Colombiano', null, null, '47', '661', 'marquezosnuaider9@hotmail.com', '3143278378', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('599', 'Angulo', 'Martinez', 'Maria ', 'Gabriela', '1', '1066882893', 'F', null, 'Colombiano', null, null, '47', '661', 'ma.gabrielle2020@gmail.com', '3042371765', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('600', 'Amador', 'Gutierrez', 'Joel ', 'David', '1', '1083558410', 'M', null, 'Colombiano', null, null, '47', '661', 'gutierrezcantillosindypaola@gm', '3014775518', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('601', 'Meriño', 'Acosta', 'Angely', 'Nicol', '1', '1221965501', 'F', null, 'Colombiano', null, null, '47', '661', 'angely290893@gmail.com', '3017292485', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('602', 'De La Rosa', 'Ramirez', 'Mery', 'Yeis', '1', '1080436096', 'F', null, 'Colombiano', null, null, '47', '661', 'meriyeisdelarosa@gmail.com', '3205579554', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('603', 'Espinosa', 'Garces', 'Estefany', '', '1', '0', 'F', null, 'Colombiano', null, null, '47', '661', 'Ola105158@gimail.com', '', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('604', 'De Haz', '', 'Juana', '', '1', '0', 'F', null, 'Colombiano', null, null, '47', '661', 'javierjofran11@gimail.com', '', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('605', 'Arévalo', '', 'Alvis', '', '1', '0', 'F', null, 'Colombiano', null, null, '47', '661', 'alvenis.arevalo.0701@gimail.co', '', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('606', 'Melendez', 'Arevalo', 'Sebastian', 'Andres', '1', '1068430646', 'M', null, 'Colombiano', null, null, '47', '661', 'marypili1116@hotmail.com', '3135853227', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('607', 'Angulo', 'De La Rosa', 'Linda ', 'Maria', '1', '1083459511', 'F', null, 'Colombiano', null, null, '47', '661', 'lindaangulodlr@outlook.es', '', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('608', 'Montero', 'Luquez', 'Maria', 'Alejandra', '1', '1083457601', 'F', null, 'Colombiano', null, null, '47', '661', 'delfinaluquez1986@gmail.com', '', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('609', 'Gomez ', 'Hernandez', 'Michell', 'Dayana', '1', '1083461500', 'F', null, 'Colombiano', null, null, '47', '661', 'Michellyyanelis@gmail.com', '', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('610', 'Polo', 'Luna', 'Naciris', 'Carolina', '1', '1080424406', 'F', null, 'Colombiano', null, null, '47', '661', 'Polonaciris@gmail.com', '', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('611', 'Araujo', 'Mejia', 'Johan', 'Andres', '1', '1080425175', 'M', null, 'Colombiano', null, null, '47', '661', 'rosirisrobin1972@hotmail.com', '', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('612', 'Granados ', 'Castro', 'Cristian', '', '1', '1082912361', 'M', null, 'Colombiano', null, null, '47', '657', 'mariluzc.6970@gmail.com', '3244012168', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('613', 'Daza ', 'Gonzales', 'Kelly ', 'Venessa', '1', '1084731691', 'F', null, 'Colombiano', null, null, '47', '657', 'dazagonzalezkellyvanessa@gmail', '3024069519', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('614', 'Jacobs ', 'Cervantes', 'Jairo ', 'Alberto', '1', '1082894657', 'M', null, 'Colombiano', null, null, '47', '657', 'jacobsjairo35@gmail.com', '3015321139', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('615', 'Polo ', 'Mozo', 'Maria ', 'Fernanda', '1', '1084734929', 'F', null, 'Colombiano', null, null, '47', '657', 'mafepolo2006@gmail.com', '3208876635', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('616', 'Lopez ', 'Hernandez', 'Juan ', 'David', '1', '1084730748', 'M', null, 'Colombiano', null, null, '47', '657', 'jl354067@gmail.com', '3016875133', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('617', 'Sotelo ', 'Porras', 'Andres ', 'Felipe', '1', '1043591191', 'M', null, 'Colombiano', null, null, '47', '657', 'spandresfelipe@gmail.com', '3244011038', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('618', 'Santos ', 'Alvarez', 'Ana ', 'Lucia', '1', '1084737662', 'F', null, 'Colombiano', null, null, '47', '657', 'analuciasantosalvarez@gmail.co', '3215583881', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('619', 'Sarmiento ', 'Oyaga', 'Jhojan ', 'David', '1', '1082907712', 'M', null, 'Colombiano', null, null, '47', '657', 'nerissarmiento19@gmail.com', '3012264621', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('620', 'Escorcia ', 'Hernandez', 'Dayana ', 'Marcela', '1', '1084731428', 'F', null, 'Colombiano', null, null, '47', '657', 'escorciadayana16@gmail.com', '3046245368', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('621', 'Gonzalez ', 'Beltran', 'Carolina ', 'Patricia', '1', '1084731230', 'F', null, 'Colombiano', null, null, '47', '657', 'cpgonbel06@gmail.com', '3114199940', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('622', 'Cantillo ', 'Hernandez', 'Stevin David', 'David', '1', '1084733241', 'M', null, 'Colombiano', null, null, '47', '657', 'narlishesterhernandezvillalobo', '3045444704', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('623', 'Arias ', 'Ovalles', 'Fernanda ', 'Carolina', '1', '1084733379', 'F', null, 'Colombiano', null, null, '47', '657', 'fernandacaro1410@gmail.com', '3135442826', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('624', 'Jimenez ', 'Monsalvo', 'Sebastian', '', '1', '1084732099', 'M', null, 'Colombiano', null, null, '47', '657', 'jimenezmonsalvo@gmail.com', '3005292792', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('625', 'Hermocilla ', 'Castro', 'Shadia', 'Pamela', '1', '1084732432', 'F', null, 'Colombiano', null, null, '47', '657', 'shadiapamelahermocillacastro@g', '3014079872', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('626', 'Beltran ', 'Dominguez', 'Valerie', 'Mishell', '1', '1084733026', 'F', null, 'Colombiano', null, null, '47', '657', 'vabeldo2006@gmail.com', '3148633416', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('627', 'Aguilar ', 'Mancilla', 'Alan ', 'David', '1', '1082895987', 'M', null, 'Colombiano', null, null, '47', '657', 'mancillanelly1982@gmail.com', '3004146681', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('628', 'Torres', 'Mendoza', 'Madeleyn', '', '1', '1084733165', 'F', null, 'Colombiano', null, null, '47', '657', 'torresmadeleyn9@gmail.com', '3217149803', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('629', 'Vanegas', 'Torres', 'Yahileth ', 'Paola', '1', '1084735119', 'F', null, 'Colombiano', null, null, '47', '657', 'yailethvanegas2019.05@gmail.co', '3014240416', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('630', 'Coneo ', 'Carabali', 'Sharol', 'Yulieth', '1', '1084733255', 'F', null, 'Colombiano', null, null, '47', '657', 'coneosharol@gmail.com', '3146601573', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('631', 'Ahumada ', 'Mendoza', 'Duvan', '', '1', '1084732234', 'M', null, 'Colombiano', null, null, '47', '657', 'ahumadaduban@gmail.com', '3044796087', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('632', 'Salcedo', 'Pertuz', 'Elias ', 'Yesid', '1', '1084734638', 'M', null, 'Colombiano', null, null, '47', '657', 'ricardojuniorsalcedo@gmail.com', '3043318808', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('633', 'Romero ', 'Baleta', 'Andrea', 'Camila', '1', '1084731354', 'F', null, 'Colombiano', null, null, '47', '657', 'gissellebarleta@hotmail.com', '3126710598', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('634', 'Garay ', 'Castellar', 'Ignacio ', 'Alejandro', '1', '1084734993', 'M', null, 'Colombiano', null, null, '47', '657', 'ignaciogaray002@gmail.com', '3054243278', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('635', 'Torres ', 'Vega', 'Kener', 'David', '1', '1084737951', 'M', null, 'Colombiano', null, null, '47', '657', 'tkener9@gmail.com', '3015872754', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('636', 'Loaiza ', 'Tabares', 'Luisa ', 'Maria', '1', '1087550171', 'F', null, 'Colombiano', null, null, '47', '657', 'Lloaiza781@gmail.com', '3217036803', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('637', 'Morales ', 'Castro', 'Blas ', 'Antonio', '1', '1082406751', 'M', null, 'Colombiano', null, null, '47', '657', 'yaleniscastro392@gmail.com', '3206941075', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('638', 'Ledesma ', 'Mendoza', 'Linda ', 'Lucia', '1', '1084739587', 'F', null, 'Colombiano', null, null, '47', '657', 'rosamendiza1975@gmail.com', '3107209674', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('639', 'Melo', 'Buelvas', 'Enuar ', 'David', '1', '1084737807', 'M', null, 'Colombiano', null, null, '47', '657', 'sandrybuelvas@hotmail.com', '3205126617', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('640', 'Arias ', 'Ovalles', 'Esteban', '', '1', '1084737586', 'M', null, 'Colombiano', null, null, '47', '657', 'ariasovallesesteban@gmail.com', '3107307647', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('641', 'Cantillo ', 'Mazzilli', 'Samuel ', 'Habid', '1', '1084736857', 'M', null, 'Colombiano', null, null, '47', '657', 'nayocantillo@gmail.com', '3156967103', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('642', 'Herrera ', 'Segura', 'Natalia', '', '1', '1081804343', 'F', null, 'Colombiano', null, null, '47', '657', 'marlenenl@outlook.com', '3148059313', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('643', 'Polo ', 'Garizabal', 'Dilan ', 'Steven', '1', '1020758797', 'M', null, 'Colombiano', null, null, '47', '657', 'marthagarizabal@gmail.com', '3003199467', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('644', 'Morales ', 'Gomez', 'Laurieth', 'Paola', '1', '1084732417', 'F', null, 'Colombiano', null, null, '47', '657', 'laumogo1804mc@gmail.com', '3003149858', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('645', 'Garcia ', 'Romero', 'Mateo', 'Santos', '1', '1084737831', 'M', null, 'Colombiano', null, null, '47', '657', 'licethromero21@gmail.com', '3016990199', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('646', 'Truyol ', 'Ramos', 'Valentina', '', '1', '1084738535', 'F', null, 'Colombiano', null, null, '47', '657', 'valutruyol@gmail.com', '3042931394', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('647', 'Cervantes ', 'Mugno', 'Ana', 'Isabel', '1', '1082246230', 'F', null, 'Colombiano', null, null, '47', '657', 'anaisabelcervantesmugno@gmail.', '3016629710', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('648', 'Acosta', 'Dorado', 'Valery ', 'Paola', '1', '1081808055', 'F', null, 'Colombiano', null, null, '47', '657', 'adalysdorado1@gmail.com', '3046206793', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('649', 'Caraballo ', 'Jaraba', 'Adrian ', 'De Jesus', '1', '1084736261', 'M', null, 'Colombiano', null, null, '47', '657', 'caraballoadrian177@gmail.com', '3008259491', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('650', 'Guerra ', 'Castro', 'Jovani ', 'Jose', '1', '1084736575', 'M', null, 'Colombiano', null, null, '47', '657', 'jhonatanguerracastro@gmail.com', '3206944884', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('651', 'Garcia ', 'Barrios', 'Santiago ', 'Jose', '1', '1065130385', 'M', null, 'Colombiano', null, null, '47', '657', 'radajudith2689@gmail.com', '3014550525', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('652', 'Gutierrez', 'Ramirez', 'Jeimmy', 'Valentina', '1', '1084743784', 'F', null, 'Colombiano', null, null, '47', '657', 'mercedes0281mji@gmail.com', '3013680681', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('653', 'Jimenez', 'Rodriguez', 'Abrahan', '', '1', '0', 'M', null, 'Venezolana', null, null, '47', '657', 'nerlinda@outlook.es', '3003375794', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('654', 'Martinez', 'Acevedo', 'Juan', 'Carlos', '1', '1084742082', 'M', null, 'Colombiano', null, null, '47', '657', 'yarleidisacevedo7@gmail.com', '3005230360', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('655', 'Cantillo ', 'Ahumada', 'Cristina', 'Isabel', '1', '1084740581', 'F', null, 'Colombiano', null, null, '47', '657', 'tilsoncantillo10@gmail.com', '3218765657', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('656', 'Garcia', 'Villalba', 'Ashlee', 'Giselle', '1', '1084742525', 'F', null, 'Colombiano', null, null, '47', '657', 'arilijohanna19@gmail.com', '3015512902', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('657', 'Gutierrez', 'Ramirez', 'Isabella', '', '1', '1084786548', 'F', null, 'Colombiano', null, null, '47', '657', 'mercedes0281mji@gmail.com', '3013680681', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('658', 'Alvarez', 'Silva', 'Cristian ', 'Camilo', '1', '1151185183', 'M', null, 'Colombiano', null, null, '47', '655', 'iedmamey.edu@gmail.com', '3153464645', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('659', 'Bedolla', 'Suarez', 'Diana', 'Mayerlis', '1', '0', 'F', null, 'Colombiano', null, null, '47', '655', 'iedmamey.edu@gmail.com', '3153464645', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('660', 'Charris', 'Sanchez', 'Emily', '', '1', '1082988358', 'F', null, 'Colombiano', null, null, '47', '655', 'iedmamey.edu@gmail.com', '3153464645', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('661', 'Chiquillo', 'Perez', 'Osnaider', '', '1', '1082924226', 'M', null, 'Colombiano', null, null, '47', '655', 'iedmamey.edu@gmail.com', '3153464645', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('662', 'Duran', '', 'Johana', 'Patricia', '1', '1082976145', 'F', null, 'Colombiano', null, null, '47', '655', 'iedmamey.edu@gmail.com', '3153464645', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('663', 'Lozano', 'Dingula', 'Marcos', '', '1', '0', 'M', null, 'Colombiano', null, null, '47', '655', 'iedmamey.edu@gmail.com', '3153464645', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('664', 'Lozano', 'Dingula', 'Ziana', '', '1', '1151185149', 'F', null, 'Colombiano', null, null, '47', '655', 'iedmamey.edu@gmail.com', '3153464645', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('665', 'Luna', 'Perez', 'Kevin', 'Rafael', '1', '1082986852', 'M', null, 'Colombiano', null, null, '47', '655', 'iedmamey.edu@gmail.com', '3153464645', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('666', 'Medina', 'Sanchez', 'Adriana', 'Lucia', '1', '1082972373', 'F', null, 'Colombiano', null, null, '47', '655', 'iedmamey.edu@gmail.com', '3153464645', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('667', 'Paez', 'Cosme', 'Melany', 'Dayana', '1', '1052188009', 'F', null, 'Colombiano', null, null, '47', '655', 'iedmamey.edu@gmail.com', '3153464645', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('668', 'Palacios', 'Santos', 'Luis', 'Santiago', '1', '1082988014', 'M', null, 'Colombiano', null, null, '47', '655', 'iedmamey.edu@gmail.com', '3153464645', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('669', 'Pedroza', 'Cosme', 'Andrys', 'Yalithza', '1', '1082988669', 'F', null, 'Colombiano', null, null, '47', '655', 'iedmamey.edu@gmail.com', '3153464645', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('670', 'Pinto', 'Dingula', 'Mariano', '', '1', '1151185119', 'M', null, 'Colombiano', null, null, '47', '655', 'iedmamey.edu@gmail.com', '3153464645', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('671', 'Pinto', 'Dingula', 'Zalemako', '', '1', '1148947681', 'M', null, 'Colombiano', null, null, '47', '655', 'iedmamey.edu@gmail.com', '3153464645', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('672', 'Pinto', 'Dingula', 'Zialekan', '', '1', '1151185122', 'M', null, 'Colombiano', null, null, '47', '655', 'iedmamey.edu@gmail.com', '3153464645', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('673', 'Ramirez', 'Ramirez', 'Yerlis', '', '1', '1082978006', '', null, 'Colombiano', null, null, '47', '655', 'iedmamey.edu@gmail.com', '3153464645', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('674', 'Suarez', 'Gutierrez', 'Tania', 'Michel', '1', '1082990969', 'F', null, 'Colombiano', null, null, '47', '655', 'iedmamey.edu@gmail.com', '3153464645', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('675', 'Vargas', 'Patiño', 'Marlon', '', '1', '1180689846', 'M', null, 'Colombiano', null, null, '47', '655', 'iedmamey.edu@gmail.com', '3153464645', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('676', 'Castro', 'Guerra', 'Fabian', 'Stiven', '1', '1082875591', 'M', null, 'Colombiano', null, null, '47', '655', 'iedmamey.edu@gmail.com', '3153464645', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('677', 'Blanco', 'Santana', 'Jeyderzon', '', '1', '1082862690', 'M', null, 'Colombiano', null, null, '47', '655', 'iedmamey.edu@gmail.com', '3153464645', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('678', 'De Armas', 'Rios', 'Johan', 'Antonio', '1', '1134329993', 'M', null, 'Colombiano', null, null, '47', '655', 'iedmamey.edu@gmail.com', '3153464645', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('679', 'Flores', 'Serrano', 'Brayan', 'Estevan', '1', '1082876785', 'M', null, 'Colombiano', null, null, '47', '655', 'iedmamey.edu@gmail.com', '3153464645', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('680', 'Garcia', 'Patiño', 'Adriana', '', '1', '1082343584', 'F', null, 'Colombiano', null, null, '47', '655', 'iedmamey.edu@gmail.com', '3153464645', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('681', 'Garcia', 'Patiño', 'Gina', 'Patricia', '1', '1082885050', 'F', null, 'Colombiano', null, null, '47', '655', 'iedmamey.edu@gmail.com', '3153464645', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('682', 'Giraldo', 'Suarez', 'Paola', 'Gisel', '1', '1082902066', 'F', null, 'Colombiano', null, null, '47', '655', 'iedmamey.edu@gmail.com', '3153464645', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('683', 'Gutierrez', 'Ospino', 'Mary ', 'Luna', '1', '1082877260', 'F', null, 'Colombiano', null, null, '47', '655', 'iedmamey.edu@gmail.com', '3153464645', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('684', 'Higuita', 'Vila', 'Saray', 'Patricia', '1', '1082883620', 'F', null, 'Colombiano', null, null, '47', '655', 'iedmamey.edu@gmail.com', '3153464645', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('685', 'Lambraño', 'Miranda', 'Jesus ', 'Enrique', '1', '1045753424', 'M', null, 'Colombiano', null, null, '47', '655', 'iedmamey.edu@gmail.com', '3153464645', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('686', 'Lara', 'Perez', 'Esleider', '', '1', '1047042629', 'M', null, 'Colombiano', null, null, '47', '655', 'iedmamey.edu@gmail.com', '3153464645', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('687', 'Lara', 'Reyes', 'Jhoan', 'Esteban', '1', '1082884724', 'M', null, 'Colombiano', null, null, '47', '655', 'iedmamey.edu@gmail.com', '3153464645', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('688', 'Leones', 'Gallego', 'Skarleth', 'Sharith', '1', '1082897228', 'F', null, 'Colombiano', null, null, '47', '655', 'iedmamey.edu@gmail.com', '3153464645', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('689', 'Lopez', 'Delgado', 'Maritza', 'Luz', '1', '1182877260', 'F', null, 'Colombiano', null, null, '47', '655', 'iedmamey.edu@gmail.com', '3153464645', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('690', 'Lora', 'Ramirez', 'Sol', 'Angel', '1', '1082901078', 'F', null, 'Colombiano', null, null, '47', '655', 'iedmamey.edu@gmail.com', '3153464645', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('691', 'Rada', 'Iturriago', 'Yeraldine', '', '1', '1082912868', 'F', null, 'Colombiano', null, null, '47', '655', 'iedmamey.edu@gmail.com', '3153464645', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('692', 'Reyes', 'Hidalgo', 'Edwin', 'Jose', '1', '32309704', 'M', null, 'Colombiano', null, null, '47', '655', 'iedmamey.edu@gmail.com', '3153464645', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('693', 'Rios', 'Aparicio', 'Camilo', 'Andres', '1', '1082936580', 'M', null, 'Colombiano', null, null, '47', '655', 'iedmamey.edu@gmail.com', '3153464645', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('694', 'Tapias', 'Blanco', 'Yuli', 'Andrea', '1', '1082872705', 'F', null, 'Colombiano', null, null, '47', '655', 'iedmamey.edu@gmail.com', '3153464645', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('695', 'Murillo', 'Serrano', 'Diana', 'Marcela ', '1', '0', 'F', null, 'Colombiano', null, null, '47', '655', 'iedmamey.edu@gmail.com', '3153464645', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('696', 'Castelbondo', 'Soto', 'Tania', '', '1', '1182341276', 'F', null, 'Colombiano', null, null, '47', '655', 'iedmamey.edu@gmail.com', '3153464645', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('697', 'Barragan', 'Rodriguez', 'Luis', 'Sebastian', '1', ' 1082914005', 'M', null, 'Colombiano', null, null, '47', '655', 'iedmamey.edu@gmail.com', '3153464645', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('698', 'Castelbondo', 'Soto', 'Yoiner', '', '1', '1151185050', 'M', null, 'Colombiano', null, null, '47', '655', 'iedmamey.edu@gmail.com', '3153464645', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('699', 'Gallego', 'Saltarin', 'Luis', 'Alberto', '1', '1082975504', 'M', null, 'Colombiano', null, null, '47', '655', 'iedmamey.edu@gmail.com', '3153464645', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('700', 'Pertuz', 'Caro', 'Yarih', 'Dayana', '1', '1151185068', 'F', null, 'Colombiano', null, null, '47', '655', 'iedmamey.edu@gmail.com', '3153464645', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('701', 'Lozano', 'Dingula', 'Jose', 'Andres', '1', '0', 'M', null, 'Colombiano', null, null, '47', '655', 'iedmamey.edu@gmail.com', '3153464645', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('702', 'Castillo', 'Castro', 'Michel', 'Yaneth', '1', '13003307', 'F', null, 'Colombiano', null, null, '47', '655', 'iedmamey.edu@gmail.com', '3153464645', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('703', 'Llanos', 'Agudelo', 'Luis', 'Ferney', '1', '1082941000', 'M', null, 'Colombiano', null, null, '47', '655', 'iedmamey.edu@gmail.com', '3153464645', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('704', 'Lozano', 'Dingula', 'Eliaser', '', '1', '0', 'M', null, 'Colombiano', null, null, '47', '655', 'iedmamey.edu@gmail.com', '3153464645', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('705', 'Lozano', 'Dingula', 'Manawi', '', '1', '1151185162', '', null, 'Colombiano', null, null, '47', '655', 'iedmamey.edu@gmail.com', '3153464645', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('706', 'Lozano', 'Dingula', 'Jones', '', '1', '1151185158', 'M', null, 'Colombiano', null, null, '47', '655', 'iedmamey.edu@gmail.com', '3153464645', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('707', 'Lozano', 'Dingula', 'Roberto', '', '1', '1151185161', 'M', null, 'Colombiano', null, null, '47', '655', 'iedmamey.edu@gmail.com', '3153464645', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('708', 'Meneses', 'Fonseca', 'Didier', 'Jose', '1', '1082945247', 'M', null, 'Colombiano', null, null, '47', '655', 'iedmamey.edu@gmail.com', '3153464645', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('709', 'Cuellar', 'Contreras', 'Yenifer', 'Oriana', '1', '1120748314', 'F', null, 'Colombiano', null, null, '47', '655', 'iedmamey.edu@gmail.com', '3153464645', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('710', 'Moscote', '', 'Uriel ', '', '1', '1148702035', 'M', null, 'Colombiano', null, null, '47', '655', 'iedmamey.edu@gmail.com', '3153464645', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('711', 'Anaya ', 'Contreras', 'María', 'Danice', '1', '1020803790', 'F', null, 'Colombiano', null, null, '47', '672', 'yucontre01@gmail.com', '3003777450', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('712', 'Pino', 'Vega', 'Sharith ', 'Isabel', '1', '1081922383', 'F', null, 'Colombiano', null, null, '47', '672', 'emivega73@gmail.com', '3003859728', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('713', 'Santos ', 'Bobadillo', 'Yanelis', 'Elena', '1', '1080572351', 'F', null, 'Colombiano', null, null, '47', '672', 'saumethjaimeguillermo75@gmail.', '3227271951', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('714', 'Saumeth ', 'Mendoza', 'Dulce  ', 'Maria', '1', '1081923821', 'F', null, 'Colombiano', null, null, '47', '672', 'menzadalgiza36@gmail.com', '3123829711', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('715', 'Diaz', 'Ocampo', 'Valery', 'Sofia', '1', '1048079848', 'F', null, 'Colombiano', null, null, '47', '672', 'vivianocampo13@gmail.com', '3155369492', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('716', 'Molina', 'Palencia', 'Pedro', 'Miguel', '1', '1081923212', 'M', null, 'Colombiano', null, null, '47', '672', 'cipago2@hotmail.com', '3023617452', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('717', 'Bermudez ', 'Torres', 'Liz ', 'Joeska', '1', '53639584', 'F', null, 'Colombiano', null, null, '47', '672', 'lizjoeskaberdugotorres@gmail.c', '3003104243', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('718', 'Molina', 'Pineda', 'Karla ', 'Sofia', '1', '52281822', 'F', null, 'Colombiano', null, null, '47', '672', 'amayapinedaluisafernanda@gmail', '3127439666', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('719', 'Mugno', 'Herrera', 'Javier ', 'Eduardo', '1', '1080572574', 'M', null, 'Colombiano', null, null, '47', '672', 'alexis26jul@hotmail.com', '3045761034', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('720', 'Menco', 'Jaraba', 'Laura ', 'Vanessa', '1', '1201227419', 'F', null, 'Colombiano', null, null, '47', '672', 'laurayossua1gmail.com ', '3205221685', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('721', 'Castillo', 'Oliveras', 'William', 'Andres', '1', '1042861145', 'M', null, 'Colombiano', null, null, '47', '672', 'yulisoliveras1986@gmail.com', '3146617385', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('722', 'Gamarra', 'Gutierrez', 'María ', 'Isabel', '1', '1081924346', 'F', null, 'Colombiano', null, null, '47', '672', 'gamarra46@gmail.com', '3106627795', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('723', 'Ramirez', 'Torres', 'Felix ', 'Javier', '1', '1081919324', 'M', null, 'Colombiano', null, null, '47', '672', 'ramireztorresluisalberto4@gmai', '3122277043', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('724', 'Viña ', 'Zambrano', 'Kaner', 'Jesus', '1', '1067726401', 'M', null, 'Colombiano', null, null, '47', '672', 'luzsierraf@hotmail.com', '3127987463', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('725', 'Simanca', 'Saumeth', 'Andrea ', 'Sofia', '1', '1080573018', 'F', null, 'Colombiano', null, null, '47', '672', 'kathesaumeth@gmail.com', '3134889035', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('726', 'Guerra', 'Barandica', 'Helena ', 'Sofia', '1', '1081925400', 'F', null, 'Colombiano', null, null, '47', '672', 'yanithyaneth@hotmail.com', '3023614842', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('727', 'Coronel', 'Visbal', 'Carlos ', 'Daniel', '1', '1080573420', 'M', null, 'Colombiano', null, null, '47', '672', 'carlosdanielcoronelvisbal@gmai', '3002230818', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('728', 'Vizcaino', 'Reyes', 'Isabella', '', '1', '1140878026', 'F', null, 'Colombiano', null, null, '47', '672', 'saredi0912@gmail.com', '3012508630', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('729', 'Marbello', 'Barandica', 'Gabriela', '', '1', '1081919826', 'F', null, 'Colombiano', null, null, '47', '672', 'gabrielamarbello@gmail.com', '3135165952', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('730', 'Pallares', 'Acosta', 'Jeylee ', 'Sophia', '1', '1080573669', 'F', null, 'Colombiano', null, null, '47', '672', 'jeylee2112@gmail.com', '3002738463', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('731', 'Castro', 'Jhonson', 'Maibelin De Los Ángeles', '', '1', '1081919422', 'F', null, 'Colombiano', null, null, '47', '672', 'odiliajhonson20@gmail.com', '3113097070', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('732', 'Castro ', 'Jhonson', 'María', 'Alejandra', '1', '1081910025', 'F', null, 'Colombiano', null, null, '47', '672', 'odiliajhonson20@gmail.com', '3113097070', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('733', 'Ferrer ', 'Saumeth', 'María ', 'Fernanda', '1', '1080570586', 'F', null, 'Colombiano', null, null, '47', '672', 'mariasaumeth0302@gmail.com', '3006529783', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('734', 'Castro ', 'Barandica', 'Leidis ', 'Milena', '1', '1081994112', 'F', null, 'Colombiano', null, null, '47', '672', 'danithbarandica.m@gmail.com', '3014472612', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('735', 'Pascuales', 'Castro', 'Danna ', 'Sofia', '1', '1081911814', 'F', null, 'Colombiano', null, null, '47', '672', 'castroeucaris20@gmail.com', '3016889110', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('736', 'García ', 'Vides', 'Saith ', 'Jose', '1', '1080572741', 'M', null, 'Colombiano', null, null, '47', '672', 'marlysgarcía@gmail.com', '3023210453', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('737', 'Paredes', 'Rodriguez', 'Jainer', 'Elia', '1', '1081917256', 'M', null, 'Colombiano', null, null, '47', '672', 'sugerodriguez14@gmail.com', '3013635391', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('738', 'Campo', 'Aguilar', 'Sharick', 'Alexandra', '1', '1082887257', 'F', null, 'Colombiano', null, null, '47', '655', 'sazasha0302@gmail.com', '3017480549', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('739', 'Carroll', 'Altafulla', 'Valeria', 'Johana', '1', '1084451280', 'F', null, 'Colombiano', null, null, '47', '655', 'Valeriaaltafulla36@gmail.com', '3022257754', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('740', 'Coronado', 'Niño', 'Neiledis', 'Jhaniela', '1', '1082898367', 'F', null, 'Colombiano', null, null, '47', '655', 'nejhaconi_06@hotmail.com', '3135414839', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('741', 'Coronado', 'Rodriguez', 'Diana', 'Carolina', '1', '1082993248', 'F', null, 'Colombiano', null, null, '47', '655', 'dianacarolinad383@gmail.com', '3006294847', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('742', 'Daza', 'Romero', 'Andrea', 'Camila', '1', '1082878428', 'F', null, 'Colombiano', null, null, '47', '655', 'andrea5cadaro@gmail.com', '3002508590', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('743', 'De La Hoz', 'Arias', 'Heidy', 'Michell', '1', '1082898546', 'F', null, 'Colombiano', null, null, '47', '655', 'delaozsalas@Gmail.com', '3059238024', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('744', 'De Leon', 'Moreno', 'Ana', 'Karina', '1', '1082883178', 'F', null, 'Colombiano', null, null, '47', '655', 'Betsy121783@gmail.com', '3007028930', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('745', 'Escorcia', 'Garcia', 'Oreana Del Pilar', '', '1', '1082889006', 'F', null, 'Colombiano', null, null, '47', '655', 'oreana.2006@gmail.com', '3042569534', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('746', 'Estrada', 'Rondano', 'Marihan', '', '1', '1082893892', 'F', null, 'Colombiano', null, null, '47', '655', 'Jpaolarori@gmail.com', '3168744874', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('747', 'Fernandez', 'Mendoza', 'Isabela', 'Gisell', '1', '1082882841', 'F', null, 'Colombiano', null, null, '47', '655', 'Isabellafernandez1208@gmil.com', '3045425299', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('748', 'Henriquez', 'De La Hoz', 'Greilys', 'Geraldine', '1', '1082891324', 'F', null, 'Colombiano', null, null, '47', '655', 'greilyd@gmail.com', '3003163011', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('749', 'Huertas', 'Zapata', 'Estefany', '', '1', '1117500649', 'F', null, 'Colombiano', null, null, '47', '655', 'estefanyhuertasz04@gmail.com', '3003467335', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('750', 'Ibañez', 'Polo', 'Betsy', 'Liliana', '1', '1082882105', 'F', null, 'Colombiano', null, null, '47', '655', 'melabetsyp@gmail.com', '3016981784', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('751', 'Lagos', 'Melendez', 'Stefany', 'Sofia', '1', '1082885130', 'F', null, 'Colombiano', null, null, '47', '655', 'stefanysofialagosmelendez@gmai', '3046055932', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('752', 'Larrota', 'Arrieta', 'Mariangel', '', '1', '1082875469', 'F', null, 'Colombiano', null, null, '47', '655', 'yeleinis1997@gmail.com', '3215089561', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('753', 'Leyva', 'Perez', 'Jennifer', 'Alejandra', '1', '1082881763', 'F', null, 'Colombiano', null, null, '47', '655', 'Jenyaleja@icloud.com', '3166075926', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('754', 'Lobato', 'Sales', 'Juliana', 'Marcela', '1', '1082885343', 'F', null, 'Colombiano', null, null, '47', '655', 'julianalobato07@gmail.com', '3002957683', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('755', 'Martinez', 'Jimenez', 'Yenizareth', '', '1', '1082881520', 'F', null, 'Colombiano', null, null, '47', '655', 'martinezyenizareth@gmail.com', '3158026662', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('756', 'Mojica', 'Llerena', 'Karolayne', 'Marcela', '1', '1082674654', 'F', null, 'Colombiano', null, null, '47', '655', 'Llerekaro@gmail.com', '3137450631', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('757', 'Moreno', 'Polanco', 'Melanie', 'Sofia', '1', '1082891269', 'F', null, 'Colombiano', null, null, '47', '655', 'Melaniesofi0412@gmail.com', '320439571', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('758', 'Ortiz ', 'Granados', 'Sharon', 'Michel', '1', '1082900775', 'F', null, 'Colombiano', null, null, '47', '655', 'michellgranadoscarrillo@gmail.', '3218710208', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('759', 'Pabon', 'Duran', 'Diocelina', '', '1', '1082886902', 'F', null, 'Colombiano', null, null, '47', '655', 'dpabonduran@gmail.com', '3216637568', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('760', 'Quintana', 'Torres', 'Silvia', 'Juliana', '1', '1082873726', 'F', null, 'Colombiano', null, null, '47', '655', 'Silviaquintanatorres28@gmail.c', '3044537367', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('761', 'Ramirez', 'Urieles', 'Axcelly', 'Jhoana', '1', '1082898624', 'F', null, 'Colombiano', null, null, '47', '655', 'axcellyr@gmail.com', '3014440583', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('762', 'Restrepo', 'Ortiz', 'Keyla', 'Susana', '1', '1084054285', 'F', null, 'Colombiano', null, null, '47', '655', 'krestrepoortiz@gmail.com', '3045232679', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('763', 'Rodriguez', 'Angulo', 'Angelina', 'Vanessa', '1', '1082886158', 'F', null, 'Colombiano', null, null, '47', '655', 'angelinavanessa10@gmail.com', '3006580538', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('764', 'Rosado', 'Cabarcas', 'Laura ', 'Victoria', '1', '1084451814', 'F', null, 'Colombiano', null, null, '47', '655', 'laurarosadoc6@gmail.com', '3226123260', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('765', 'Salazar', 'Escorcia', 'Valentina', 'Isabel', '1', '1082888840', 'F', null, 'Colombiano', null, null, '47', '655', 'Estudiante7valentinasalem@gmai', '‪3225470324‬', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('766', 'Salazar', 'Roman', 'Camila', 'Isabel', '1', '1082893316', 'F', null, 'Colombiano', null, null, '47', '655', 'camilaisabelsalazar@gmail.com', '3137527564', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('767', 'Salcedo', 'Rodriguez', 'Danna ', 'Lucia', '1', '1042250902', 'F', null, 'Colombiano', null, null, '47', '655', 'danna3448@gmail.com', '3113580536', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('768', 'Sanchez', 'Vargas', 'Andrea', 'Carolina', '1', '1082854279', 'F', null, 'Colombiano', null, null, '47', '655', 'magdav420@gmail.com', '3006294847', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('769', 'Sotomayor', 'Rodriguez', 'Valentina', '', '1', '1065127378', 'F', null, 'Colombiano', null, null, '47', '655', 'valentinaro675@gmail.com', '3005170689', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('770', 'Toledo', 'Palomino', 'Emily', 'Daniela', '1', '1082881618', 'F', null, 'Colombiano', null, null, '47', '655', 'emily102507@hotmail.com', '3505140762', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('771', 'Tovar', 'De La Cruz ', 'Yeiris', 'Paola', '1', '1082876127', 'F', null, 'Colombiano', null, null, '47', '655', 'yeyantobb@gmail.com', '3016305080', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('772', 'Vesga', 'Fernandez ', 'Valeria', '', '1', '1082885184', 'F', null, 'Colombiano', null, null, '47', '655', 'valeriavesgafernandez19@gmail.', '3208667509', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('773', 'Castillo', 'Guerrero', 'Wendy', 'Katherine', '1', '1138074721', 'F', null, 'Colombiano', null, null, '47', '655', 'wendycastillo807@gmail.com', '3015024616', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('774', 'Sanchez', 'Martinez', 'Paula', 'Andrea', '1', '1082903542', 'F', null, 'Colombiano', null, null, '47', '655', 'sanmartinezfernandez@gmail.com', '3128064825', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('775', 'Ternera', 'Araujo', 'Valery', 'Michel', '1', '1082890257', 'F', null, 'Colombiano', null, null, '47', '655', 'valeryternera28@gmial.com', '3016563781', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('776', 'Suarez', 'Cantilo', 'Mariana De Los Angeles', '', '1', '1081888563', 'F', null, 'Colombiano', null, null, '47', '655', 'marianasuarez.30.mari@gmail.co', '3046465937', '', null, null, '1', '1', null, null);
INSERT INTO `alumno` VALUES ('777', 'Guerrero', 'Borja', 'Mariana', 'Dailyn', '1', '1082856920', 'F', null, 'Colombiano', null, null, '47', '655', 'mg3820192@gmail.com', '3045561221', '', null, null, '1', '1', null, null);

-- ----------------------------
-- Table structure for alumno_materia
-- ----------------------------
DROP TABLE IF EXISTS `alumno_materia`;
CREATE TABLE `alumno_materia` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_calendario` int(11) unsigned NOT NULL,
  `id_alumno` int(11) unsigned NOT NULL,
  `id_grado` int(11) unsigned NOT NULL,
  `id_materia` int(11) unsigned NOT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) unsigned NOT NULL,
  `id_usuario` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_alumno_materia_calendario` (`id_calendario`),
  KEY `fk_alumno_materia_alumno` (`id_alumno`),
  KEY `fk_alumno_materia_grado` (`id_grado`),
  KEY `fk_alumno_materia_materia` (`id_materia`),
  KEY `fk_alumno_materia_status` (`id_status`),
  KEY `fk_alumno_materia_usuario` (`id_usuario`),
  CONSTRAINT `fk_alumno_materia_alumno` FOREIGN KEY (`id_alumno`) REFERENCES `alumno` (`id`),
  CONSTRAINT `fk_alumno_materia_calendario` FOREIGN KEY (`id_calendario`) REFERENCES `calendario` (`id`),
  CONSTRAINT `fk_alumno_materia_grado` FOREIGN KEY (`id_grado`) REFERENCES `grado` (`id`),
  CONSTRAINT `fk_alumno_materia_materia` FOREIGN KEY (`id_materia`) REFERENCES `materia` (`id`),
  CONSTRAINT `fk_alumno_materia_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`),
  CONSTRAINT `fk_alumno_materia_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1391 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of alumno_materia
-- ----------------------------
INSERT INTO `alumno_materia` VALUES ('1', '1', '500', '7', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('2', '1', '500', '7', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('3', '1', '500', '7', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('4', '1', '500', '7', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('5', '1', '500', '7', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('6', '1', '501', '7', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('7', '1', '501', '7', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('8', '1', '501', '7', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('9', '1', '501', '7', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('10', '1', '501', '7', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('11', '1', '502', '7', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('12', '1', '502', '7', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('13', '1', '502', '7', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('14', '1', '502', '7', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('15', '1', '502', '7', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('16', '1', '503', '7', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('17', '1', '503', '7', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('18', '1', '503', '7', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('19', '1', '503', '7', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('20', '1', '503', '7', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('21', '1', '504', '7', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('22', '1', '504', '7', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('23', '1', '504', '7', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('24', '1', '504', '7', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('25', '1', '504', '7', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('26', '1', '505', '7', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('27', '1', '505', '7', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('28', '1', '505', '7', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('29', '1', '505', '7', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('30', '1', '505', '7', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('31', '1', '506', '7', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('32', '1', '506', '7', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('33', '1', '506', '7', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('34', '1', '506', '7', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('35', '1', '506', '7', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('36', '1', '507', '7', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('37', '1', '507', '7', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('38', '1', '507', '7', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('39', '1', '507', '7', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('40', '1', '507', '7', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('41', '1', '508', '7', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('42', '1', '508', '7', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('43', '1', '508', '7', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('44', '1', '508', '7', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('45', '1', '508', '7', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('46', '1', '509', '7', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('47', '1', '509', '7', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('48', '1', '509', '7', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('49', '1', '509', '7', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('50', '1', '509', '7', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('51', '1', '510', '7', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('52', '1', '510', '7', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('53', '1', '510', '7', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('54', '1', '510', '7', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('55', '1', '510', '7', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('56', '1', '511', '7', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('57', '1', '511', '7', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('58', '1', '511', '7', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('59', '1', '511', '7', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('60', '1', '511', '7', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('61', '1', '512', '7', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('62', '1', '512', '7', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('63', '1', '512', '7', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('64', '1', '512', '7', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('65', '1', '512', '7', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('66', '1', '513', '7', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('67', '1', '513', '7', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('68', '1', '513', '7', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('69', '1', '513', '7', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('70', '1', '513', '7', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('71', '1', '514', '7', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('72', '1', '514', '7', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('73', '1', '514', '7', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('74', '1', '514', '7', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('75', '1', '514', '7', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('76', '1', '515', '7', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('77', '1', '515', '7', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('78', '1', '515', '7', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('79', '1', '515', '7', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('80', '1', '515', '7', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('81', '1', '516', '7', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('82', '1', '516', '7', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('83', '1', '516', '7', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('84', '1', '516', '7', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('85', '1', '516', '7', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('86', '1', '517', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('87', '1', '517', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('88', '1', '517', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('89', '1', '517', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('90', '1', '517', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('91', '1', '518', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('92', '1', '518', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('93', '1', '518', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('94', '1', '518', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('95', '1', '518', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('96', '1', '519', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('97', '1', '519', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('98', '1', '519', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('99', '1', '519', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('100', '1', '519', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('101', '1', '520', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('102', '1', '520', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('103', '1', '520', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('104', '1', '520', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('105', '1', '520', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('106', '1', '521', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('107', '1', '521', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('108', '1', '521', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('109', '1', '521', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('110', '1', '521', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('111', '1', '522', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('112', '1', '522', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('113', '1', '522', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('114', '1', '522', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('115', '1', '522', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('116', '1', '523', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('117', '1', '523', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('118', '1', '523', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('119', '1', '523', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('120', '1', '523', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('121', '1', '524', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('122', '1', '524', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('123', '1', '524', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('124', '1', '524', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('125', '1', '524', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('126', '1', '525', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('127', '1', '525', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('128', '1', '525', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('129', '1', '525', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('130', '1', '525', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('131', '1', '526', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('132', '1', '526', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('133', '1', '526', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('134', '1', '526', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('135', '1', '526', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('136', '1', '527', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('137', '1', '527', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('138', '1', '527', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('139', '1', '527', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('140', '1', '527', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('141', '1', '528', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('142', '1', '528', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('143', '1', '528', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('144', '1', '528', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('145', '1', '528', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('146', '1', '529', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('147', '1', '529', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('148', '1', '529', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('149', '1', '529', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('150', '1', '529', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('151', '1', '530', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('152', '1', '530', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('153', '1', '530', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('154', '1', '530', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('155', '1', '530', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('156', '1', '531', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('157', '1', '531', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('158', '1', '531', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('159', '1', '531', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('160', '1', '531', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('161', '1', '532', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('162', '1', '532', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('163', '1', '532', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('164', '1', '532', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('165', '1', '532', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('166', '1', '533', '14', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('167', '1', '533', '14', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('168', '1', '533', '14', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('169', '1', '533', '14', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('170', '1', '533', '14', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('171', '1', '534', '13', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('172', '1', '534', '13', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('173', '1', '534', '13', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('174', '1', '534', '13', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('175', '1', '534', '13', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('176', '1', '535', '13', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('177', '1', '535', '13', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('178', '1', '535', '13', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('179', '1', '535', '13', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('180', '1', '535', '13', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('181', '1', '536', '7', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('182', '1', '536', '7', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('183', '1', '536', '7', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('184', '1', '536', '7', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('185', '1', '536', '7', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('186', '1', '537', '7', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('187', '1', '537', '7', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('188', '1', '537', '7', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('189', '1', '537', '7', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('190', '1', '537', '7', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('191', '1', '538', '7', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('192', '1', '538', '7', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('193', '1', '538', '7', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('194', '1', '538', '7', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('195', '1', '538', '7', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('196', '1', '539', '7', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('197', '1', '539', '7', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('198', '1', '539', '7', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('199', '1', '539', '7', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('200', '1', '539', '7', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('201', '1', '540', '7', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('202', '1', '540', '7', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('203', '1', '540', '7', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('204', '1', '540', '7', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('205', '1', '540', '7', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('206', '1', '541', '7', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('207', '1', '541', '7', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('208', '1', '541', '7', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('209', '1', '541', '7', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('210', '1', '541', '7', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('211', '1', '542', '7', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('212', '1', '542', '7', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('213', '1', '542', '7', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('214', '1', '542', '7', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('215', '1', '542', '7', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('216', '1', '543', '7', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('217', '1', '543', '7', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('218', '1', '543', '7', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('219', '1', '543', '7', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('220', '1', '543', '7', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('221', '1', '544', '7', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('222', '1', '544', '7', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('223', '1', '544', '7', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('224', '1', '544', '7', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('225', '1', '544', '7', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('226', '1', '545', '7', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('227', '1', '545', '7', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('228', '1', '545', '7', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('229', '1', '545', '7', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('230', '1', '545', '7', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('231', '1', '546', '7', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('232', '1', '546', '7', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('233', '1', '546', '7', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('234', '1', '546', '7', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('235', '1', '546', '7', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('236', '1', '547', '7', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('237', '1', '547', '7', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('238', '1', '547', '7', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('239', '1', '547', '7', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('240', '1', '547', '7', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('241', '1', '548', '7', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('242', '1', '548', '7', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('243', '1', '548', '7', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('244', '1', '548', '7', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('245', '1', '548', '7', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('246', '1', '549', '7', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('247', '1', '549', '7', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('248', '1', '549', '7', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('249', '1', '549', '7', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('250', '1', '549', '7', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('251', '1', '550', '7', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('252', '1', '550', '7', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('253', '1', '550', '7', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('254', '1', '550', '7', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('255', '1', '550', '7', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('256', '1', '551', '7', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('257', '1', '551', '7', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('258', '1', '551', '7', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('259', '1', '551', '7', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('260', '1', '551', '7', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('261', '1', '552', '7', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('262', '1', '552', '7', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('263', '1', '552', '7', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('264', '1', '552', '7', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('265', '1', '552', '7', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('266', '1', '553', '7', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('267', '1', '553', '7', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('268', '1', '553', '7', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('269', '1', '553', '7', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('270', '1', '553', '7', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('271', '1', '554', '7', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('272', '1', '554', '7', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('273', '1', '554', '7', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('274', '1', '554', '7', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('275', '1', '554', '7', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('276', '1', '555', '7', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('277', '1', '555', '7', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('278', '1', '555', '7', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('279', '1', '555', '7', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('280', '1', '555', '7', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('281', '1', '556', '7', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('282', '1', '556', '7', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('283', '1', '556', '7', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('284', '1', '556', '7', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('285', '1', '556', '7', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('286', '1', '557', '7', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('287', '1', '557', '7', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('288', '1', '557', '7', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('289', '1', '557', '7', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('290', '1', '557', '7', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('291', '1', '558', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('292', '1', '558', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('293', '1', '558', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('294', '1', '558', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('295', '1', '558', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('296', '1', '559', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('297', '1', '559', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('298', '1', '559', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('299', '1', '559', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('300', '1', '559', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('301', '1', '560', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('302', '1', '560', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('303', '1', '560', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('304', '1', '560', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('305', '1', '560', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('306', '1', '561', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('307', '1', '561', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('308', '1', '561', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('309', '1', '561', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('310', '1', '561', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('311', '1', '562', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('312', '1', '562', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('313', '1', '562', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('314', '1', '562', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('315', '1', '562', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('316', '1', '563', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('317', '1', '563', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('318', '1', '563', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('319', '1', '563', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('320', '1', '563', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('321', '1', '564', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('322', '1', '564', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('323', '1', '564', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('324', '1', '564', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('325', '1', '564', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('326', '1', '565', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('327', '1', '565', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('328', '1', '565', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('329', '1', '565', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('330', '1', '565', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('331', '1', '566', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('332', '1', '566', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('333', '1', '566', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('334', '1', '566', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('335', '1', '566', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('336', '1', '567', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('337', '1', '567', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('338', '1', '567', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('339', '1', '567', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('340', '1', '567', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('341', '1', '568', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('342', '1', '568', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('343', '1', '568', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('344', '1', '568', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('345', '1', '568', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('346', '1', '569', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('347', '1', '569', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('348', '1', '569', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('349', '1', '569', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('350', '1', '569', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('351', '1', '570', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('352', '1', '570', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('353', '1', '570', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('354', '1', '570', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('355', '1', '570', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('356', '1', '571', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('357', '1', '571', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('358', '1', '571', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('359', '1', '571', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('360', '1', '571', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('361', '1', '572', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('362', '1', '572', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('363', '1', '572', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('364', '1', '572', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('365', '1', '572', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('366', '1', '573', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('367', '1', '573', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('368', '1', '573', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('369', '1', '573', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('370', '1', '573', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('371', '1', '574', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('372', '1', '574', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('373', '1', '574', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('374', '1', '574', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('375', '1', '574', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('376', '1', '575', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('377', '1', '575', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('378', '1', '575', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('379', '1', '575', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('380', '1', '575', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('381', '1', '576', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('382', '1', '576', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('383', '1', '576', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('384', '1', '576', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('385', '1', '576', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('386', '1', '577', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('387', '1', '577', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('388', '1', '577', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('389', '1', '577', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('390', '1', '577', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('391', '1', '578', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('392', '1', '578', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('393', '1', '578', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('394', '1', '578', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('395', '1', '578', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('396', '1', '579', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('397', '1', '579', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('398', '1', '579', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('399', '1', '579', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('400', '1', '579', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('401', '1', '580', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('402', '1', '580', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('403', '1', '580', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('404', '1', '580', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('405', '1', '580', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('406', '1', '581', '8', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('407', '1', '581', '8', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('408', '1', '581', '8', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('409', '1', '581', '8', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('410', '1', '581', '8', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('411', '1', '582', '8', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('412', '1', '582', '8', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('413', '1', '582', '8', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('414', '1', '582', '8', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('415', '1', '582', '8', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('416', '1', '583', '8', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('417', '1', '583', '8', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('418', '1', '583', '8', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('419', '1', '583', '8', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('420', '1', '583', '8', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('421', '1', '584', '8', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('422', '1', '584', '8', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('423', '1', '584', '8', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('424', '1', '584', '8', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('425', '1', '584', '8', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('426', '1', '585', '8', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('427', '1', '585', '8', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('428', '1', '585', '8', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('429', '1', '585', '8', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('430', '1', '585', '8', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('431', '1', '586', '8', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('432', '1', '586', '8', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('433', '1', '586', '8', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('434', '1', '586', '8', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('435', '1', '586', '8', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('436', '1', '587', '8', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('437', '1', '587', '8', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('438', '1', '587', '8', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('439', '1', '587', '8', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('440', '1', '587', '8', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('441', '1', '588', '8', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('442', '1', '588', '8', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('443', '1', '588', '8', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('444', '1', '588', '8', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('445', '1', '588', '8', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('446', '1', '589', '8', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('447', '1', '589', '8', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('448', '1', '589', '8', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('449', '1', '589', '8', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('450', '1', '589', '8', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('451', '1', '590', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('452', '1', '590', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('453', '1', '590', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('454', '1', '590', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('455', '1', '590', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('456', '1', '591', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('457', '1', '591', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('458', '1', '591', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('459', '1', '591', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('460', '1', '591', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('461', '1', '592', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('462', '1', '592', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('463', '1', '592', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('464', '1', '592', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('465', '1', '592', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('466', '1', '593', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('467', '1', '593', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('468', '1', '593', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('469', '1', '593', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('470', '1', '593', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('471', '1', '594', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('472', '1', '594', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('473', '1', '594', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('474', '1', '594', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('475', '1', '594', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('476', '1', '595', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('477', '1', '595', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('478', '1', '595', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('479', '1', '595', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('480', '1', '595', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('481', '1', '596', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('482', '1', '596', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('483', '1', '596', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('484', '1', '596', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('485', '1', '596', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('486', '1', '597', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('487', '1', '597', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('488', '1', '597', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('489', '1', '597', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('490', '1', '597', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('491', '1', '598', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('492', '1', '598', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('493', '1', '598', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('494', '1', '598', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('495', '1', '598', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('496', '1', '599', '11', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('497', '1', '599', '11', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('498', '1', '599', '11', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('499', '1', '599', '11', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('500', '1', '599', '11', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('501', '1', '600', '11', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('502', '1', '600', '11', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('503', '1', '600', '11', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('504', '1', '600', '11', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('505', '1', '600', '11', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('506', '1', '601', '11', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('507', '1', '601', '11', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('508', '1', '601', '11', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('509', '1', '601', '11', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('510', '1', '601', '11', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('511', '1', '602', '11', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('512', '1', '602', '11', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('513', '1', '602', '11', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('514', '1', '602', '11', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('515', '1', '602', '11', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('516', '1', '603', '11', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('517', '1', '603', '11', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('518', '1', '603', '11', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('519', '1', '603', '11', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('520', '1', '603', '11', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('521', '1', '604', '11', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('522', '1', '604', '11', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('523', '1', '604', '11', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('524', '1', '604', '11', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('525', '1', '604', '11', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('526', '1', '605', '11', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('527', '1', '605', '11', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('528', '1', '605', '11', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('529', '1', '605', '11', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('530', '1', '605', '11', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('531', '1', '606', '8', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('532', '1', '606', '8', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('533', '1', '606', '8', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('534', '1', '606', '8', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('535', '1', '606', '8', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('536', '1', '607', '13', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('537', '1', '607', '13', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('538', '1', '607', '13', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('539', '1', '607', '13', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('540', '1', '607', '13', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('541', '1', '608', '13', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('542', '1', '608', '13', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('543', '1', '608', '13', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('544', '1', '608', '13', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('545', '1', '608', '13', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('546', '1', '609', '13', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('547', '1', '609', '13', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('548', '1', '609', '13', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('549', '1', '609', '13', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('550', '1', '609', '13', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('551', '1', '610', '13', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('552', '1', '610', '13', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('553', '1', '610', '13', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('554', '1', '610', '13', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('555', '1', '610', '13', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('556', '1', '611', '13', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('557', '1', '611', '13', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('558', '1', '611', '13', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('559', '1', '611', '13', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('560', '1', '611', '13', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('561', '1', '612', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('562', '1', '612', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('563', '1', '612', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('564', '1', '612', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('565', '1', '612', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('566', '1', '613', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('567', '1', '613', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('568', '1', '613', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('569', '1', '613', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('570', '1', '613', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('571', '1', '614', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('572', '1', '614', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('573', '1', '614', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('574', '1', '614', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('575', '1', '614', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('576', '1', '615', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('577', '1', '615', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('578', '1', '615', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('579', '1', '615', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('580', '1', '615', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('581', '1', '616', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('582', '1', '616', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('583', '1', '616', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('584', '1', '616', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('585', '1', '616', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('586', '1', '617', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('587', '1', '617', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('588', '1', '617', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('589', '1', '617', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('590', '1', '617', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('591', '1', '618', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('592', '1', '618', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('593', '1', '618', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('594', '1', '618', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('595', '1', '618', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('596', '1', '619', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('597', '1', '619', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('598', '1', '619', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('599', '1', '619', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('600', '1', '619', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('601', '1', '620', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('602', '1', '620', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('603', '1', '620', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('604', '1', '620', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('605', '1', '620', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('606', '1', '621', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('607', '1', '621', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('608', '1', '621', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('609', '1', '621', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('610', '1', '621', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('611', '1', '622', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('612', '1', '622', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('613', '1', '622', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('614', '1', '622', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('615', '1', '622', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('616', '1', '623', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('617', '1', '623', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('618', '1', '623', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('619', '1', '623', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('620', '1', '623', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('621', '1', '624', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('622', '1', '624', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('623', '1', '624', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('624', '1', '624', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('625', '1', '624', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('626', '1', '625', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('627', '1', '625', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('628', '1', '625', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('629', '1', '625', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('630', '1', '625', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('631', '1', '626', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('632', '1', '626', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('633', '1', '626', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('634', '1', '626', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('635', '1', '626', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('636', '1', '627', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('637', '1', '627', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('638', '1', '627', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('639', '1', '627', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('640', '1', '627', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('641', '1', '628', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('642', '1', '628', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('643', '1', '628', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('644', '1', '628', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('645', '1', '628', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('646', '1', '629', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('647', '1', '629', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('648', '1', '629', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('649', '1', '629', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('650', '1', '629', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('651', '1', '630', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('652', '1', '630', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('653', '1', '630', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('654', '1', '630', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('655', '1', '630', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('656', '1', '631', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('657', '1', '631', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('658', '1', '631', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('659', '1', '631', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('660', '1', '631', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('661', '1', '632', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('662', '1', '632', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('663', '1', '632', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('664', '1', '632', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('665', '1', '632', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('666', '1', '633', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('667', '1', '633', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('668', '1', '633', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('669', '1', '633', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('670', '1', '633', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('671', '1', '634', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('672', '1', '634', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('673', '1', '634', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('674', '1', '634', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('675', '1', '634', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('676', '1', '635', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('677', '1', '635', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('678', '1', '635', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('679', '1', '635', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('680', '1', '635', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('681', '1', '636', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('682', '1', '636', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('683', '1', '636', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('684', '1', '636', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('685', '1', '636', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('686', '1', '637', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('687', '1', '637', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('688', '1', '637', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('689', '1', '637', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('690', '1', '637', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('691', '1', '638', '10', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('692', '1', '638', '10', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('693', '1', '638', '10', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('694', '1', '638', '10', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('695', '1', '638', '10', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('696', '1', '639', '10', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('697', '1', '639', '10', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('698', '1', '639', '10', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('699', '1', '639', '10', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('700', '1', '639', '10', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('701', '1', '640', '10', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('702', '1', '640', '10', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('703', '1', '640', '10', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('704', '1', '640', '10', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('705', '1', '640', '10', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('706', '1', '641', '10', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('707', '1', '641', '10', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('708', '1', '641', '10', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('709', '1', '641', '10', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('710', '1', '641', '10', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('711', '1', '642', '10', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('712', '1', '642', '10', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('713', '1', '642', '10', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('714', '1', '642', '10', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('715', '1', '642', '10', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('716', '1', '643', '10', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('717', '1', '643', '10', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('718', '1', '643', '10', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('719', '1', '643', '10', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('720', '1', '643', '10', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('721', '1', '644', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('722', '1', '644', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('723', '1', '644', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('724', '1', '644', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('725', '1', '644', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('726', '1', '645', '10', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('727', '1', '645', '10', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('728', '1', '645', '10', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('729', '1', '645', '10', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('730', '1', '645', '10', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('731', '1', '646', '10', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('732', '1', '646', '10', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('733', '1', '646', '10', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('734', '1', '646', '10', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('735', '1', '646', '10', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('736', '1', '647', '10', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('737', '1', '647', '10', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('738', '1', '647', '10', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('739', '1', '647', '10', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('740', '1', '647', '10', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('741', '1', '648', '10', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('742', '1', '648', '10', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('743', '1', '648', '10', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('744', '1', '648', '10', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('745', '1', '648', '10', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('746', '1', '649', '10', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('747', '1', '649', '10', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('748', '1', '649', '10', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('749', '1', '649', '10', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('750', '1', '649', '10', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('751', '1', '650', '10', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('752', '1', '650', '10', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('753', '1', '650', '10', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('754', '1', '650', '10', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('755', '1', '650', '10', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('756', '1', '651', '10', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('757', '1', '651', '10', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('758', '1', '651', '10', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('759', '1', '651', '10', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('760', '1', '651', '10', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('761', '1', '652', '7', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('762', '1', '652', '7', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('763', '1', '652', '7', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('764', '1', '652', '7', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('765', '1', '652', '7', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('766', '1', '653', '7', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('767', '1', '653', '7', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('768', '1', '653', '7', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('769', '1', '653', '7', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('770', '1', '653', '7', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('771', '1', '654', '7', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('772', '1', '654', '7', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('773', '1', '654', '7', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('774', '1', '654', '7', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('775', '1', '654', '7', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('776', '1', '655', '7', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('777', '1', '655', '7', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('778', '1', '655', '7', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('779', '1', '655', '7', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('780', '1', '655', '7', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('781', '1', '656', '7', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('782', '1', '656', '7', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('783', '1', '656', '7', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('784', '1', '656', '7', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('785', '1', '656', '7', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('786', '1', '657', '7', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('787', '1', '657', '7', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('788', '1', '657', '7', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('789', '1', '657', '7', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('790', '1', '657', '7', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('791', '1', '658', '7', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('792', '1', '658', '7', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('793', '1', '658', '7', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('794', '1', '658', '7', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('795', '1', '658', '7', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('796', '1', '659', '7', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('797', '1', '659', '7', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('798', '1', '659', '7', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('799', '1', '659', '7', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('800', '1', '659', '7', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('801', '1', '660', '7', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('802', '1', '660', '7', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('803', '1', '660', '7', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('804', '1', '660', '7', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('805', '1', '660', '7', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('806', '1', '661', '7', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('807', '1', '661', '7', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('808', '1', '661', '7', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('809', '1', '661', '7', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('810', '1', '661', '7', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('811', '1', '662', '7', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('812', '1', '662', '7', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('813', '1', '662', '7', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('814', '1', '662', '7', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('815', '1', '662', '7', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('816', '1', '663', '7', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('817', '1', '663', '7', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('818', '1', '663', '7', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('819', '1', '663', '7', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('820', '1', '663', '7', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('821', '1', '664', '7', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('822', '1', '664', '7', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('823', '1', '664', '7', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('824', '1', '664', '7', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('825', '1', '664', '7', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('826', '1', '665', '7', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('827', '1', '665', '7', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('828', '1', '665', '7', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('829', '1', '665', '7', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('830', '1', '665', '7', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('831', '1', '666', '7', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('832', '1', '666', '7', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('833', '1', '666', '7', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('834', '1', '666', '7', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('835', '1', '666', '7', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('836', '1', '667', '7', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('837', '1', '667', '7', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('838', '1', '667', '7', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('839', '1', '667', '7', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('840', '1', '667', '7', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('841', '1', '668', '7', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('842', '1', '668', '7', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('843', '1', '668', '7', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('844', '1', '668', '7', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('845', '1', '668', '7', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('846', '1', '669', '7', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('847', '1', '669', '7', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('848', '1', '669', '7', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('849', '1', '669', '7', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('850', '1', '669', '7', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('851', '1', '670', '7', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('852', '1', '670', '7', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('853', '1', '670', '7', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('854', '1', '670', '7', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('855', '1', '670', '7', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('856', '1', '671', '7', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('857', '1', '671', '7', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('858', '1', '671', '7', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('859', '1', '671', '7', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('860', '1', '671', '7', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('861', '1', '672', '7', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('862', '1', '672', '7', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('863', '1', '672', '7', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('864', '1', '672', '7', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('865', '1', '672', '7', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('866', '1', '673', '7', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('867', '1', '673', '7', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('868', '1', '673', '7', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('869', '1', '673', '7', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('870', '1', '673', '7', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('871', '1', '674', '7', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('872', '1', '674', '7', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('873', '1', '674', '7', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('874', '1', '674', '7', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('875', '1', '674', '7', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('876', '1', '675', '7', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('877', '1', '675', '7', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('878', '1', '675', '7', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('879', '1', '675', '7', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('880', '1', '675', '7', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('881', '1', '676', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('882', '1', '676', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('883', '1', '676', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('884', '1', '676', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('885', '1', '676', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('886', '1', '677', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('887', '1', '677', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('888', '1', '677', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('889', '1', '677', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('890', '1', '677', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('891', '1', '678', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('892', '1', '678', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('893', '1', '678', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('894', '1', '678', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('895', '1', '678', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('896', '1', '679', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('897', '1', '679', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('898', '1', '679', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('899', '1', '679', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('900', '1', '679', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('901', '1', '680', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('902', '1', '680', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('903', '1', '680', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('904', '1', '680', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('905', '1', '680', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('906', '1', '681', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('907', '1', '681', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('908', '1', '681', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('909', '1', '681', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('910', '1', '681', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('911', '1', '682', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('912', '1', '682', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('913', '1', '682', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('914', '1', '682', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('915', '1', '682', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('916', '1', '683', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('917', '1', '683', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('918', '1', '683', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('919', '1', '683', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('920', '1', '683', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('921', '1', '684', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('922', '1', '684', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('923', '1', '684', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('924', '1', '684', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('925', '1', '684', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('926', '1', '685', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('927', '1', '685', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('928', '1', '685', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('929', '1', '685', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('930', '1', '685', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('931', '1', '686', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('932', '1', '686', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('933', '1', '686', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('934', '1', '686', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('935', '1', '686', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('936', '1', '687', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('937', '1', '687', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('938', '1', '687', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('939', '1', '687', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('940', '1', '687', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('941', '1', '688', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('942', '1', '688', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('943', '1', '688', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('944', '1', '688', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('945', '1', '688', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('946', '1', '689', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('947', '1', '689', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('948', '1', '689', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('949', '1', '689', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('950', '1', '689', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('951', '1', '690', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('952', '1', '690', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('953', '1', '690', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('954', '1', '690', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('955', '1', '690', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('956', '1', '691', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('957', '1', '691', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('958', '1', '691', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('959', '1', '691', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('960', '1', '691', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('961', '1', '692', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('962', '1', '692', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('963', '1', '692', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('964', '1', '692', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('965', '1', '692', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('966', '1', '693', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('967', '1', '693', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('968', '1', '693', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('969', '1', '693', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('970', '1', '693', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('971', '1', '694', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('972', '1', '694', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('973', '1', '694', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('974', '1', '694', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('975', '1', '694', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('976', '1', '695', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('977', '1', '695', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('978', '1', '695', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('979', '1', '695', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('980', '1', '695', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('981', '1', '696', '7', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('982', '1', '696', '7', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('983', '1', '696', '7', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('984', '1', '696', '7', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('985', '1', '696', '7', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('986', '1', '697', '7', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('987', '1', '697', '7', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('988', '1', '697', '7', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('989', '1', '697', '7', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('990', '1', '697', '7', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('991', '1', '698', '7', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('992', '1', '698', '7', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('993', '1', '698', '7', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('994', '1', '698', '7', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('995', '1', '698', '7', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('996', '1', '699', '7', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('997', '1', '699', '7', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('998', '1', '699', '7', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('999', '1', '699', '7', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1000', '1', '699', '7', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1001', '1', '700', '7', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1002', '1', '700', '7', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1003', '1', '700', '7', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1004', '1', '700', '7', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1005', '1', '700', '7', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1006', '1', '701', '7', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1007', '1', '701', '7', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1008', '1', '701', '7', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1009', '1', '701', '7', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1010', '1', '701', '7', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1011', '1', '702', '7', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1012', '1', '702', '7', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1013', '1', '702', '7', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1014', '1', '702', '7', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1015', '1', '702', '7', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1016', '1', '703', '7', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1017', '1', '703', '7', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1018', '1', '703', '7', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1019', '1', '703', '7', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1020', '1', '703', '7', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1021', '1', '704', '7', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1022', '1', '704', '7', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1023', '1', '704', '7', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1024', '1', '704', '7', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1025', '1', '704', '7', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1026', '1', '705', '7', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1027', '1', '705', '7', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1028', '1', '705', '7', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1029', '1', '705', '7', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1030', '1', '705', '7', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1031', '1', '706', '7', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1032', '1', '706', '7', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1033', '1', '706', '7', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1034', '1', '706', '7', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1035', '1', '706', '7', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1036', '1', '707', '7', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1037', '1', '707', '7', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1038', '1', '707', '7', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1039', '1', '707', '7', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1040', '1', '707', '7', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1041', '1', '708', '7', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1042', '1', '708', '7', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1043', '1', '708', '7', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1044', '1', '708', '7', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1045', '1', '708', '7', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1046', '1', '709', '7', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1047', '1', '709', '7', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1048', '1', '709', '7', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1049', '1', '709', '7', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1050', '1', '709', '7', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1051', '1', '710', '7', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1052', '1', '710', '7', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1053', '1', '710', '7', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1054', '1', '710', '7', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1055', '1', '710', '7', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1056', '1', '711', '7', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1057', '1', '711', '7', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1058', '1', '711', '7', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1059', '1', '711', '7', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1060', '1', '711', '7', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1061', '1', '712', '7', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1062', '1', '712', '7', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1063', '1', '712', '7', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1064', '1', '712', '7', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1065', '1', '712', '7', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1066', '1', '713', '7', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1067', '1', '713', '7', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1068', '1', '713', '7', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1069', '1', '713', '7', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1070', '1', '713', '7', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1071', '1', '714', '7', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1072', '1', '714', '7', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1073', '1', '714', '7', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1074', '1', '714', '7', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1075', '1', '714', '7', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1076', '1', '715', '6', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1077', '1', '715', '6', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1078', '1', '715', '6', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1079', '1', '715', '6', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1080', '1', '715', '6', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1081', '1', '716', '8', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1082', '1', '716', '8', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1083', '1', '716', '8', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1084', '1', '716', '8', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1085', '1', '716', '8', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1086', '1', '717', '7', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1087', '1', '717', '7', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1088', '1', '717', '7', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1089', '1', '717', '7', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1090', '1', '717', '7', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1091', '1', '718', '7', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1092', '1', '718', '7', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1093', '1', '718', '7', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1094', '1', '718', '7', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1095', '1', '718', '7', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1096', '1', '719', '7', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1097', '1', '719', '7', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1098', '1', '719', '7', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1099', '1', '719', '7', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1100', '1', '719', '7', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1101', '1', '720', '7', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1102', '1', '720', '7', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1103', '1', '720', '7', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1104', '1', '720', '7', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1105', '1', '720', '7', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1106', '1', '721', '7', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1107', '1', '721', '7', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1108', '1', '721', '7', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1109', '1', '721', '7', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1110', '1', '721', '7', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1111', '1', '722', '7', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1112', '1', '722', '7', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1113', '1', '722', '7', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1114', '1', '722', '7', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1115', '1', '722', '7', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1116', '1', '723', '7', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1117', '1', '723', '7', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1118', '1', '723', '7', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1119', '1', '723', '7', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1120', '1', '723', '7', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1121', '1', '724', '7', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1122', '1', '724', '7', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1123', '1', '724', '7', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1124', '1', '724', '7', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1125', '1', '724', '7', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1126', '1', '725', '6', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1127', '1', '725', '6', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1128', '1', '725', '6', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1129', '1', '725', '6', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1130', '1', '725', '6', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1131', '1', '726', '6', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1132', '1', '726', '6', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1133', '1', '726', '6', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1134', '1', '726', '6', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1135', '1', '726', '6', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1136', '1', '727', '6', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1137', '1', '727', '6', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1138', '1', '727', '6', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1139', '1', '727', '6', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1140', '1', '727', '6', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1141', '1', '728', '6', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1142', '1', '728', '6', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1143', '1', '728', '6', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1144', '1', '728', '6', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1145', '1', '728', '6', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1146', '1', '729', '8', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1147', '1', '729', '8', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1148', '1', '729', '8', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1149', '1', '729', '8', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1150', '1', '729', '8', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1151', '1', '730', '6', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1152', '1', '730', '6', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1153', '1', '730', '6', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1154', '1', '730', '6', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1155', '1', '730', '6', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1156', '1', '731', '10', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1157', '1', '731', '10', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1158', '1', '731', '10', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1159', '1', '731', '10', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1160', '1', '731', '10', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1161', '1', '732', '11', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1162', '1', '732', '11', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1163', '1', '732', '11', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1164', '1', '732', '11', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1165', '1', '732', '11', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1166', '1', '733', '13', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1167', '1', '733', '13', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1168', '1', '733', '13', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1169', '1', '733', '13', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1170', '1', '733', '13', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1171', '1', '734', '6', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1172', '1', '734', '6', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1173', '1', '734', '6', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1174', '1', '734', '6', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1175', '1', '734', '6', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1176', '1', '735', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1177', '1', '735', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1178', '1', '735', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1179', '1', '735', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1180', '1', '735', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1181', '1', '736', '7', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1182', '1', '736', '7', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1183', '1', '736', '7', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1184', '1', '736', '7', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1185', '1', '736', '7', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1186', '1', '737', '7', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1187', '1', '737', '7', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1188', '1', '737', '7', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1189', '1', '737', '7', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1190', '1', '737', '7', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1191', '1', '738', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1192', '1', '738', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1193', '1', '738', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1194', '1', '738', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1195', '1', '738', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1196', '1', '739', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1197', '1', '739', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1198', '1', '739', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1199', '1', '739', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1200', '1', '739', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1201', '1', '740', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1202', '1', '740', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1203', '1', '740', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1204', '1', '740', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1205', '1', '740', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1206', '1', '741', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1207', '1', '741', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1208', '1', '741', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1209', '1', '741', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1210', '1', '741', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1211', '1', '742', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1212', '1', '742', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1213', '1', '742', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1214', '1', '742', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1215', '1', '742', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1216', '1', '743', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1217', '1', '743', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1218', '1', '743', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1219', '1', '743', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1220', '1', '743', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1221', '1', '744', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1222', '1', '744', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1223', '1', '744', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1224', '1', '744', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1225', '1', '744', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1226', '1', '745', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1227', '1', '745', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1228', '1', '745', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1229', '1', '745', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1230', '1', '745', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1231', '1', '746', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1232', '1', '746', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1233', '1', '746', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1234', '1', '746', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1235', '1', '746', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1236', '1', '747', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1237', '1', '747', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1238', '1', '747', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1239', '1', '747', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1240', '1', '747', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1241', '1', '748', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1242', '1', '748', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1243', '1', '748', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1244', '1', '748', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1245', '1', '748', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1246', '1', '749', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1247', '1', '749', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1248', '1', '749', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1249', '1', '749', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1250', '1', '749', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1251', '1', '750', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1252', '1', '750', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1253', '1', '750', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1254', '1', '750', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1255', '1', '750', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1256', '1', '751', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1257', '1', '751', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1258', '1', '751', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1259', '1', '751', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1260', '1', '751', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1261', '1', '752', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1262', '1', '752', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1263', '1', '752', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1264', '1', '752', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1265', '1', '752', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1266', '1', '753', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1267', '1', '753', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1268', '1', '753', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1269', '1', '753', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1270', '1', '753', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1271', '1', '754', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1272', '1', '754', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1273', '1', '754', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1274', '1', '754', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1275', '1', '754', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1276', '1', '755', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1277', '1', '755', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1278', '1', '755', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1279', '1', '755', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1280', '1', '755', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1281', '1', '756', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1282', '1', '756', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1283', '1', '756', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1284', '1', '756', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1285', '1', '756', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1286', '1', '757', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1287', '1', '757', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1288', '1', '757', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1289', '1', '757', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1290', '1', '757', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1291', '1', '758', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1292', '1', '758', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1293', '1', '758', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1294', '1', '758', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1295', '1', '758', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1296', '1', '759', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1297', '1', '759', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1298', '1', '759', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1299', '1', '759', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1300', '1', '759', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1301', '1', '760', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1302', '1', '760', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1303', '1', '760', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1304', '1', '760', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1305', '1', '760', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1306', '1', '761', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1307', '1', '761', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1308', '1', '761', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1309', '1', '761', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1310', '1', '761', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1311', '1', '762', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1312', '1', '762', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1313', '1', '762', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1314', '1', '762', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1315', '1', '762', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1316', '1', '763', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1317', '1', '763', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1318', '1', '763', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1319', '1', '763', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1320', '1', '763', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1321', '1', '764', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1322', '1', '764', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1323', '1', '764', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1324', '1', '764', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1325', '1', '764', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1326', '1', '765', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1327', '1', '765', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1328', '1', '765', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1329', '1', '765', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1330', '1', '765', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1331', '1', '766', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1332', '1', '766', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1333', '1', '766', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1334', '1', '766', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1335', '1', '766', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1336', '1', '767', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1337', '1', '767', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1338', '1', '767', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1339', '1', '767', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1340', '1', '767', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1341', '1', '768', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1342', '1', '768', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1343', '1', '768', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1344', '1', '768', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1345', '1', '768', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1346', '1', '769', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1347', '1', '769', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1348', '1', '769', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1349', '1', '769', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1350', '1', '769', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1351', '1', '770', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1352', '1', '770', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1353', '1', '770', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1354', '1', '770', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1355', '1', '770', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1356', '1', '771', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1357', '1', '771', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1358', '1', '771', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1359', '1', '771', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1360', '1', '771', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1361', '1', '772', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1362', '1', '772', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1363', '1', '772', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1364', '1', '772', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1365', '1', '772', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1366', '1', '773', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1367', '1', '773', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1368', '1', '773', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1369', '1', '773', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1370', '1', '773', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1371', '1', '774', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1372', '1', '774', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1373', '1', '774', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1374', '1', '774', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1375', '1', '774', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1376', '1', '775', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1377', '1', '775', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1378', '1', '775', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1379', '1', '775', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1380', '1', '775', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1381', '1', '776', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1382', '1', '776', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1383', '1', '776', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1384', '1', '776', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1385', '1', '776', '12', '5', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1386', '1', '777', '12', '1', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1387', '1', '777', '12', '2', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1388', '1', '777', '12', '3', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1389', '1', '777', '12', '4', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('1390', '1', '777', '12', '5', null, '1', '1', null, null);

-- ----------------------------
-- Table structure for alumno_pariente
-- ----------------------------
DROP TABLE IF EXISTS `alumno_pariente`;
CREATE TABLE `alumno_pariente` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_alumno` int(11) unsigned NOT NULL,
  `id_pariente` int(11) unsigned NOT NULL,
  `bo_acudiente` tinyint(1) NOT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) unsigned NOT NULL,
  `id_usuario` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_alumno_pariente_alumno` (`id_alumno`),
  KEY `fk_alumno_pariente_pariente` (`id_pariente`),
  KEY `fk_alumno_pariente_status` (`id_status`),
  KEY `fk_alumno_pariente_usuario` (`id_usuario`),
  CONSTRAINT `fk_alumno_pariente_alumno` FOREIGN KEY (`id_alumno`) REFERENCES `alumno` (`id`),
  CONSTRAINT `fk_alumno_pariente_pariente` FOREIGN KEY (`id_pariente`) REFERENCES `pariente` (`id`),
  CONSTRAINT `fk_alumno_pariente_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`),
  CONSTRAINT `fk_alumno_pariente_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of alumno_pariente
-- ----------------------------
INSERT INTO `alumno_pariente` VALUES ('10', '1', '1', '1', null, '1', '1', '2020-07-25 18:53:44', '2020-07-25 18:53:44');

-- ----------------------------
-- Table structure for archivo
-- ----------------------------
DROP TABLE IF EXISTS `archivo`;
CREATE TABLE `archivo` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_archivo` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `id_tipo_archivo` int(11) unsigned NOT NULL,
  `tx_origen_id` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tx_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tx_mimetype` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) unsigned NOT NULL,
  `id_usuario` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_archivo_tipo_archivo` (`id_tipo_archivo`),
  KEY `fk_archivo_status` (`id_status`),
  KEY `fk_archivo_usuario` (`id_usuario`),
  CONSTRAINT `fk_archivo_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`),
  CONSTRAINT `fk_archivo_tipo_archivo` FOREIGN KEY (`id_tipo_archivo`) REFERENCES `tipo_archivo` (`id`),
  CONSTRAINT `fk_archivo_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of archivo
-- ----------------------------
INSERT INTO `archivo` VALUES ('1', 'fuendamentos', '8', '1', 'fundamentos_macroeconomia.mp3', 'Audio', null, '1', '1', '2021-04-06 17:44:27', '2021-04-06 17:44:27');
INSERT INTO `archivo` VALUES ('2', 'lectura', '10', '2', 'grado 3_Los cambios en los niños_Causas de la rebeldía en los niños.pdf', 'PDF', null, '1', '1', '2021-04-06 17:45:26', '2021-04-06 17:45:26');
INSERT INTO `archivo` VALUES ('4', 'fsafs', '11', '1', '1617734796_alumnos.txt', 'Texto', 'fafaf', '1', '1', '2021-04-06 18:46:36', '2021-04-06 18:46:36');
INSERT INTO `archivo` VALUES ('5', 'ag', '13', '3', '1617746686_clase (3).png', 'Image', 'gdag', '1', '1', '2021-04-06 22:04:46', '2021-04-06 22:04:46');

-- ----------------------------
-- Table structure for area_estudio
-- ----------------------------
DROP TABLE IF EXISTS `area_estudio`;
CREATE TABLE `area_estudio` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_area_estudio` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tx_color` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) unsigned NOT NULL,
  `id_usuario` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_area_estudio_status` (`id_status`),
  KEY `fk_area_estudio_usuario` (`id_usuario`),
  CONSTRAINT `fk_area_estudio_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`),
  CONSTRAINT `fk_area_estudio_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of area_estudio
-- ----------------------------
INSERT INTO `area_estudio` VALUES ('2', 'Colegios Amigos del Turismo', 'purple', null, '1', '1', '2021-03-12 01:27:11', '2021-04-07 20:40:46');
INSERT INTO `area_estudio` VALUES ('3', 'Educación Continua', 'teal', null, '1', '1', '2021-03-12 01:27:30', '2021-03-12 01:27:40');
INSERT INTO `area_estudio` VALUES ('4', 'Consultoría', 'cyan', null, '1', '1', '2021-03-12 01:27:56', '2021-03-12 01:27:56');
INSERT INTO `area_estudio` VALUES ('5', 'Turismo Académico', 'amber', null, '1', '1', '2021-03-12 01:28:18', '2021-04-07 20:41:01');
INSERT INTO `area_estudio` VALUES ('6', 'Curso Internación Opción de Grado', 'deep-orange', null, '1', '1', '2021-03-12 01:28:46', '2021-03-12 01:29:39');

-- ----------------------------
-- Table structure for asistencia
-- ----------------------------
DROP TABLE IF EXISTS `asistencia`;
CREATE TABLE `asistencia` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_clase` int(11) unsigned NOT NULL,
  `id_alumno` int(11) unsigned NOT NULL,
  `fe_asistencia` timestamp NULL DEFAULT NULL,
  `bo_asistencia` tinyint(1) NOT NULL DEFAULT 0,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) unsigned NOT NULL,
  `id_usuario` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_asistencia_clase` (`id_clase`),
  KEY `fk_asistencia_alumno` (`id_alumno`),
  KEY `fk_asistencia_status` (`id_status`),
  KEY `fk_asistencia_usuario` (`id_usuario`),
  CONSTRAINT `fk_asistencia_alumno` FOREIGN KEY (`id_alumno`) REFERENCES `alumno` (`id`),
  CONSTRAINT `fk_asistencia_clase` FOREIGN KEY (`id_clase`) REFERENCES `clase` (`id`),
  CONSTRAINT `fk_asistencia_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`),
  CONSTRAINT `fk_asistencia_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of asistencia
-- ----------------------------
INSERT INTO `asistencia` VALUES ('1', '6', '1', null, '0', null, '1', '1', '2021-04-02 17:08:04', null);
INSERT INTO `asistencia` VALUES ('2', '7', '1', null, '0', null, '1', '1', '2021-04-02 17:32:58', null);
INSERT INTO `asistencia` VALUES ('3', '8', '1', null, '0', null, '1', '1', '2021-04-02 17:35:36', null);
INSERT INTO `asistencia` VALUES ('4', '9', '1', null, '0', null, '1', '1', '2021-04-06 15:26:20', null);
INSERT INTO `asistencia` VALUES ('5', '10', '1', '2021-04-06 22:51:35', '1', null, '1', '1', '2021-04-06 22:51:27', '2021-04-06 22:51:35');

-- ----------------------------
-- Table structure for asistente
-- ----------------------------
DROP TABLE IF EXISTS `asistente`;
CREATE TABLE `asistente` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_asistente` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_menu` int(11) unsigned NOT NULL,
  `tx_descripcion` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_color` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nu_orden` int(11) NOT NULL,
  `tx_grupo` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_observaciones` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `id_status` int(11) unsigned NOT NULL,
  `id_usuario` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_asistente_menu` (`id_menu`),
  KEY `fk_asistente_status` (`id_status`),
  KEY `fk_asistente_usuario` (`id_usuario`),
  CONSTRAINT `fk_asistente_menu` FOREIGN KEY (`id_menu`) REFERENCES `menu` (`id`),
  CONSTRAINT `fk_asistente_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`),
  CONSTRAINT `fk_asistente_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of asistente
-- ----------------------------
INSERT INTO `asistente` VALUES ('1', 'Institucion', '7', 'Se define la informacion principal de la institución que incluye logo, informacion  de contacto, ubicación y directiva.El logo sera el que aparezca en los reportes.', 'deep-orange', '1', 'secretaria', 'Debe cargarse la información completa para la correcta generación de los reportes. \nDebe generar con antelación lo cargos y tipo directiva para.', '1', '1', '2020-09-02 00:09:03', '2021-01-17 14:43:47');
INSERT INTO `asistente` VALUES ('2', 'Tipo Colegio', '8', 'Indica la categoría del colegio privado o publico', 'deep-orange', '3', 'secretaria', 'Información requerida para algunos reportes', '1', '1', '2020-09-02 01:26:22', '2021-02-01 13:40:29');
INSERT INTO `asistente` VALUES ('3', 'Cargos', '9', 'Cargos de la platilla de cargos del colegio tanto para la directiva como de los empleados.', 'deep-orange', '2', 'secretaria', 'Esta información alimentara los selectores de cargos en la carga de empleados y directivas.', '1', '1', '2020-09-02 01:32:11', '2020-12-10 16:22:02');
INSERT INTO `asistente` VALUES ('4', 'Tipo Directiva', '10', 'Tipos de directiva con que cuente la institución', 'deep-orange', '4', 'secretaria', 'Información para alimentar selectores en pantalla de carga de directiva', '1', '1', '2020-09-02 12:43:15', '2020-12-10 16:26:07');
INSERT INTO `asistente` VALUES ('6', 'Empleados', '14', 'Carga de la datos básicos del empleado así como la ubicación.  Cada vez que se genera un empleado se genera un usuario con perfil secretaria.', 'deep-orange', '5', 'secretaria', 'El correo es obligatorio ya que es usado para creación del usuario y envió de las notificaciones.', '1', '1', '2020-09-02 12:44:21', '2021-01-17 14:44:54');
INSERT INTO `asistente` VALUES ('7', 'Estructura', '12', 'Se configura los edificios y/o sectores de la institución de forma jerárquica, donde se ubican las aulas de clase.', 'deep-orange', '6', 'secretaria', 'Permite al personal administrativo-docente-alumno ubicar facilmete las aulas, se emplea en horarios y asignaciones de aulas', '1', '1', '2020-09-02 12:44:36', '2020-12-10 19:27:09');
INSERT INTO `asistente` VALUES ('8', 'Aulas', '13', 'Se indica las aulas, laboratorios, talleres u otras instalaciones  donde se imparten clases según la estructura del edificio.', 'deep-orange', '7', 'secretaria', 'Permite la asignación de clase y los horarios. Permite la fácil ubicación ya que describe en que estructura de la Institución se encuentra ubicada', '1', '1', '2020-09-02 12:44:54', '2021-01-17 14:46:36');
INSERT INTO `asistente` VALUES ('9', 'Calendario', '15', 'Permite crear, editar, activar/desactivar el calendario de clases.', 'teal', '8', 'secretaria', 'Solo puede haber un calendario activo, esto limita las fechas asignable en todas las actividades. Asimismo, muestra solo los grupos creados para ese calendario', '1', '1', '2020-09-02 12:45:10', '2021-01-20 18:05:19');
INSERT INTO `asistente` VALUES ('10', 'Periodos', '16', 'Permite administrar los periodos o lapsos en que se divide al calendario escolar.', 'teal', '9', 'secretaria', 'Solo puede haber un periodo activo. afecta las actividades y planes de evaluaciones que pueden cargarse', '1', '1', '2020-09-02 12:45:25', '2021-01-20 18:05:55');
INSERT INTO `asistente` VALUES ('11', 'Turnos', '21', 'Definición de los diferentes turnos con que trabaja la institución', 'teal', '10', 'secretaria', 'Afecta la información de reportes y horario de clases', '1', '1', '2020-09-02 12:45:38', '2021-01-20 18:06:20');
INSERT INTO `asistente` VALUES ('12', 'Horas Academicas', '22', 'Define las horas de clases y de receso y la carga horaria (horas de clase)', 'teal', '11', 'secretaria', 'Afecta los horarios de clase', '1', '1', '2020-09-02 12:45:51', '2021-01-17 14:53:34');
INSERT INTO `asistente` VALUES ('14', 'Areas de Estudio', '27', 'Departamentos o grupos de materias con que cuenta la institución', 'cyan', '13', 'secretaria', 'Se define los colores que serán los que identifiquen en Virtualin a la materias asignadas.', '1', '1', '2020-09-02 12:46:47', '2021-01-17 14:58:10');
INSERT INTO `asistente` VALUES ('15', 'Materias', '28', 'Se definen  las materia que se imparten en la institución. Agrupadas por Area de Estudio.', 'cyan', '14', 'secretaria', 'Para los libros con que cuenta el sistema debe existir la materia para el mismo.', '1', '1', '2020-09-02 12:47:03', '2021-01-17 15:03:55');
INSERT INTO `asistente` VALUES ('16', 'Niveles', '24', 'Define los Niveles educativos que la institución maneja', 'cyan', '15', 'secretaria', 'Requerido para la creación de los Grados', '1', '1', '2020-09-02 12:47:30', '2021-01-17 15:05:02');
INSERT INTO `asistente` VALUES ('17', 'Grados', '25', 'Define los grados que maneja la institucion', 'cyan', '16', 'secretaria', 'Luego de crear los Grados, se deben asignar las materia a los grados para la asignación de las materias a grupos y alumnos sean de forma automática.', '1', '1', '2020-09-02 12:47:55', '2021-01-27 22:19:08');
INSERT INTO `asistente` VALUES ('18', 'Grupos', '26', 'Descripcion de la tarea de especial cuidado para el funcionamiento del sistema\'', 'cyan', '17', 'secretaria', 'Descripcion de la funcionalidad, observaciones y advertencias', '1', '1', '2020-09-02 12:48:08', '2021-01-16 20:29:07');
INSERT INTO `asistente` VALUES ('19', 'Docente', '37', 'Información de los docentes con que cuenta la Institución. \n- Permite cargar la foto del mismo. \n- Se asignan las materias que impartirá el docente', 'teal', '12', 'secretaria', 'Las materia asignadas permiten su asignación al plan de evaluación y en consecuencia al grupo.', '1', '1', '2020-09-02 12:48:30', '2021-01-17 14:56:46');
INSERT INTO `asistente` VALUES ('21', 'Plan Evaluacion', '35', 'Asignación del docente y la activación del Plan Evaluación según el Periodo y Materia. Permite carga del Plan de evaluación si existe imposibilidad por parte del docente.', 'purple', '19', 'secretaria', 'Los estudiantes solo podrán ver las actividades de los planes de evaluación activos. La responsabilidad de la carga del Plan de Evaluación es del docente el cual poseerá un modulo en su bandeja para tal fin.', '1', '1', '2020-09-02 12:49:11', '2021-02-01 20:32:18');
INSERT INTO `asistente` VALUES ('22', 'Horario', '36', 'Se definen los horarios de clase de los Grupos de alumnos, aquí se asigna la hora, día, materia, docente y aula de cada clase.', 'purple', '20', 'secretaria', 'El sistema valida la disponibilidad del docente y del aula de clases. los alumnos y docentes verán reflejado dicho horario en su bandeja.', '1', '1', '2020-09-02 12:49:29', '2021-02-01 20:32:18');
INSERT INTO `asistente` VALUES ('24', 'Nivel Calificaciones', '31', 'Define los niveles de juicio valorativo de las calificaciones', 'purple', '21', 'secretaria', 'Ejemplo: Desempeño Bajo,  Desempeño Superior, etc.', '1', '1', '2020-09-02 12:50:43', '2021-02-01 20:32:18');
INSERT INTO `asistente` VALUES ('25', 'Calificacion', '32', 'Definición de los grupos de calificaciones para cada nivel educativo. Asimismo, se definen los rangos de notas, el nivel, letra y aprobación de la calificación.', 'purple', '22', 'secretaria', 'Debe respetar el orden de los rangos para evitar errores del calculo.', '1', '1', '2020-09-02 12:50:57', '2021-02-01 20:32:18');
INSERT INTO `asistente` VALUES ('26', 'Condicion Alumno', '38', 'Definición de las condiciones en que el alumno esta inscrito en la institución.', 'pink', '27', 'secretaria', '.', '1', '1', '2020-09-02 12:51:14', '2021-02-01 20:32:19');
INSERT INTO `asistente` VALUES ('27', 'Alumnos', '39', 'Permite la carga de los datos generales del alumno,  foto, inscripción, asignación de materias acudientes y faltas y sanciones.', 'pink', '28', 'secretaria', '- la asignación de materia sera de forma automática si el grupo ya posee materias asignadas de lo contrario debera asignase mediante esta pantalla ya sea asignación de materia al alumno o asignación por el grupo.', '1', '1', '2020-09-02 12:56:02', '2021-02-01 20:32:19');
INSERT INTO `asistente` VALUES ('28', 'Acudiente', '40', 'Definición de los datos de los acudientes, foto y alumnos a los cuales representa.', 'pink', '29', 'secretaria', 'Se debe tener especial cuidado con el correo ya que se crear de forma automática el usuario.\nLa asignacion del alumno puede realizar igualmente desde el modulo de alumnos.', '1', '1', '2020-09-02 12:56:18', '2021-02-01 20:31:34');
INSERT INTO `asistente` VALUES ('29', 'Feriados', '17', 'Definición de los días feriados que puedan afectar  las Clases', 'purple', '23', 'secretaria', 'Los feriados fijos no se comprobara el año, al contrario que los variables que requieren carga anual donde se indique el año', '1', '1', '2020-09-02 12:56:43', '2021-02-01 20:32:18');
INSERT INTO `asistente` VALUES ('30', 'Tipo Agenda', '18', 'Definición de los diferente grupos de asignación para la agendas de Actividades.', 'purple', '24', 'secretaria', '.', '1', '1', '2020-09-02 12:57:00', '2021-02-01 20:32:18');
INSERT INTO `asistente` VALUES ('31', 'Tipo Actividad', '19', 'Definición de los tipos de actividades que se podrán cargar la agenda', 'purple', '25', 'secretaria', 'Los tipo de actividades se identificaran con un icono y color en los calendarios.', '1', '1', '2020-09-02 12:57:29', '2021-02-01 20:32:18');
INSERT INTO `asistente` VALUES ('32', 'Agenda', '20', 'Se asignan las actividades anuales según el grupo y el tipo de actividad.', 'purple', '26', 'secretaria', 'La asignación de la actividad envía una notificación al grupo asignado.', '1', '1', '2020-09-02 12:57:43', '2021-02-01 20:32:18');
INSERT INTO `asistente` VALUES ('33', 'Bandeja Docente', '3', 'Calendario de actividades semanales, calendario de actividades del colegio, panel de funcionalidades', 'indigo', '1', 'docente', 'Descripcion de la funcionalidad, observaciones y advertencias', '1', '1', '2020-09-02 12:59:32', '2020-09-02 12:59:32');
INSERT INTO `asistente` VALUES ('34', 'Bandeja Alumno', '4', 'Calendario de actividades semanales, calendario de actividades del colegio, panel de funcionalidades', 'amber', '1', 'alumno', 'Descripcion de la funcionalidad, observaciones y advertencias', '1', '1', '2020-09-02 13:00:59', '2020-09-02 13:01:20');
INSERT INTO `asistente` VALUES ('35', 'Bandeja Acudiente', '5', 'Calendario de actividades semanales, calendario de actividades del colegio, panel de funcionalidades', 'light-green', '1', 'acudiente', 'Descripcion de la funcionalidad, observaciones y advertencias', '1', '1', '2020-09-02 13:02:14', '2020-09-02 13:02:14');
INSERT INTO `asistente` VALUES ('36', 'Tema', '91', 'Carga de  la plantilla de temas para la carga de contenido de los alumnos', 'purple', '18', 'secretaria', 'Deben asignarse al plan de evaluación correspondiente. para que los contenido puedan asignarse a los alumnos', '1', '1', '2021-02-01 20:31:34', '2021-02-01 20:32:39');

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
  `id_status` int(11) unsigned NOT NULL,
  `id_usuario` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_asistente_detalle_status` (`id_status`),
  KEY `fk_asistente_detalle_usuario` (`id_usuario`),
  CONSTRAINT `fk_asistente_detalle_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`),
  CONSTRAINT `fk_asistente_detalle_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
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
  `id_estructura` int(11) unsigned NOT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) unsigned NOT NULL,
  `id_usuario` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_aula_estructura` (`id_estructura`),
  KEY `fk_aula_status` (`id_status`),
  KEY `fk_aula_usuario` (`id_usuario`),
  CONSTRAINT `fk_aula_estructura` FOREIGN KEY (`id_estructura`) REFERENCES `estructura` (`id`),
  CONSTRAINT `fk_aula_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`),
  CONSTRAINT `fk_aula_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of aula
-- ----------------------------
INSERT INTO `aula` VALUES ('1', 'Aula Virtual 1', '1', null, '1', '1', '2021-03-12 00:34:52', '2021-03-12 00:34:52');
INSERT INTO `aula` VALUES ('2', 'Aula Virtual 2', '1', null, '1', '1', '2021-03-12 00:35:11', '2021-03-12 00:35:11');
INSERT INTO `aula` VALUES ('3', 'Aula Virtual 3', '1', null, '1', '1', '2021-03-12 00:41:06', '2021-03-12 00:41:06');

-- ----------------------------
-- Table structure for barrio
-- ----------------------------
DROP TABLE IF EXISTS `barrio`;
CREATE TABLE `barrio` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `co_barrio` int(11) NOT NULL,
  `nb_barrio` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_comuna` int(11) unsigned NOT NULL,
  `tx_latitud` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_longitud` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) unsigned NOT NULL,
  `id_usuario` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `barrio_co_barrio_unique` (`co_barrio`),
  KEY `fk_barrio_comuna` (`id_comuna`),
  KEY `fk_barrio_status` (`id_status`),
  KEY `fk_barrio_usuario` (`id_usuario`),
  CONSTRAINT `fk_barrio_comuna` FOREIGN KEY (`id_comuna`) REFERENCES `comuna` (`id`),
  CONSTRAINT `fk_barrio_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`),
  CONSTRAINT `fk_barrio_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
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
  `id_status` int(11) unsigned NOT NULL,
  `id_usuario` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_calendario_status` (`id_status`),
  KEY `fk_calendario_usuario` (`id_usuario`),
  CONSTRAINT `fk_calendario_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`),
  CONSTRAINT `fk_calendario_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of calendario
-- ----------------------------
INSERT INTO `calendario` VALUES ('1', 'Calendario 2021', '2021', '2021-04-05', '2021-12-17', null, '1', '1', '2021-03-12 00:42:55', '2021-04-07 00:39:14');
INSERT INTO `calendario` VALUES ('2', 'Calendario 2022', '2022', '2022-03-28', '2022-12-23', null, '2', '1', '2021-03-12 00:44:00', '2021-04-07 00:39:14');

-- ----------------------------
-- Table structure for calificacion
-- ----------------------------
DROP TABLE IF EXISTS `calificacion`;
CREATE TABLE `calificacion` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_calificacion` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nu_desde` float(8,2) DEFAULT NULL,
  `nu_hasta` float(8,2) DEFAULT NULL,
  `co_calificacion` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bo_aprobado` int(11) NOT NULL,
  `nu_orden` int(11) NOT NULL,
  `id_grupo_calificacion` int(11) unsigned NOT NULL,
  `id_tipo_calificacion` int(11) unsigned NOT NULL,
  `id_nivel_calificacion` int(11) unsigned NOT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) unsigned NOT NULL,
  `id_usuario` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_calificacion_grupo_calificacion` (`id_grupo_calificacion`),
  KEY `fk_calificacion_tipo_calificacion` (`id_tipo_calificacion`),
  KEY `fk_calificacion_nivel_calificacion` (`id_nivel_calificacion`),
  KEY `fk_calificacion_status` (`id_status`),
  KEY `fk_calificacion_usuario` (`id_usuario`),
  CONSTRAINT `fk_calificacion_grupo_calificacion` FOREIGN KEY (`id_grupo_calificacion`) REFERENCES `grupo_calificacion` (`id`),
  CONSTRAINT `fk_calificacion_nivel_calificacion` FOREIGN KEY (`id_nivel_calificacion`) REFERENCES `nivel_calificacion` (`id`),
  CONSTRAINT `fk_calificacion_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`),
  CONSTRAINT `fk_calificacion_tipo_calificacion` FOREIGN KEY (`id_tipo_calificacion`) REFERENCES `tipo_calificacion` (`id`),
  CONSTRAINT `fk_calificacion_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of calificacion
-- ----------------------------
INSERT INTO `calificacion` VALUES ('1', 'D', '1.00', '2.90', 'BJ', '0', '1', '1', '1', '1', null, '1', '1', '2020-09-19 17:52:02', '2020-11-05 20:57:17');
INSERT INTO `calificacion` VALUES ('2', 'C', '3.00', '3.90', 'BS', '1', '2', '1', '1', '2', null, '1', '1', '2020-09-19 17:54:56', '2020-09-19 17:55:15');
INSERT INTO `calificacion` VALUES ('3', 'B', '4.00', '4.60', 'AL', '1', '3', '1', '1', '3', null, '1', '1', '2020-09-19 17:56:24', '2020-09-19 17:56:42');
INSERT INTO `calificacion` VALUES ('4', 'A', '4.70', '5.00', 'SP', '1', '4', '1', '1', '4', null, '1', '1', '2020-09-19 17:57:51', '2020-09-19 17:57:51');

-- ----------------------------
-- Table structure for carga_horaria
-- ----------------------------
DROP TABLE IF EXISTS `carga_horaria`;
CREATE TABLE `carga_horaria` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_carga_horaria` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_hora_academica` int(11) unsigned NOT NULL,
  `nu_orden` int(11) NOT NULL,
  `hh_inicio` time NOT NULL,
  `hh_fin` time NOT NULL,
  `id_turno` int(11) unsigned NOT NULL,
  `bo_receso` tinyint(1) NOT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) unsigned NOT NULL,
  `id_usuario` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_carga_horaria_hora_academica` (`id_hora_academica`),
  KEY `fk_carga_horaria_turno` (`id_turno`),
  KEY `fk_carga_horaria_status` (`id_status`),
  KEY `fk_carga_horaria_usuario` (`id_usuario`),
  CONSTRAINT `fk_carga_horaria_hora_academica` FOREIGN KEY (`id_hora_academica`) REFERENCES `hora_academica` (`id`),
  CONSTRAINT `fk_carga_horaria_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`),
  CONSTRAINT `fk_carga_horaria_turno` FOREIGN KEY (`id_turno`) REFERENCES `turno` (`id`),
  CONSTRAINT `fk_carga_horaria_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of carga_horaria
-- ----------------------------
INSERT INTO `carga_horaria` VALUES ('1', 'DIR. GRUPO', '1', '1', '07:00:00', '07:45:00', '1', '1', null, '1', '1', '2020-05-10 10:06:24', '2020-09-21 21:22:36');
INSERT INTO `carga_horaria` VALUES ('2', 'Hora 1', '1', '2', '08:00:00', '08:45:00', '1', '0', null, '1', '1', '2020-05-10 11:01:07', '2020-05-20 13:42:08');
INSERT INTO `carga_horaria` VALUES ('3', 'Hora 2', '1', '3', '08:45:00', '09:30:00', '1', '0', null, '1', '1', '2020-05-10 11:02:03', '2020-05-20 18:20:14');
INSERT INTO `carga_horaria` VALUES ('4', 'DESCANSO', '1', '4', '09:30:00', '10:15:00', '1', '1', null, '1', '1', '2020-05-10 11:04:47', '2020-05-20 13:38:12');
INSERT INTO `carga_horaria` VALUES ('5', 'Hora 3', '1', '5', '10:15:00', '11:00:00', '1', '0', null, '1', '1', '2020-05-10 11:06:09', '2020-05-20 18:20:24');
INSERT INTO `carga_horaria` VALUES ('6', 'ALMUERZO', '1', '6', '11:00:00', '11:45:00', '1', '1', null, '1', '1', '2020-05-10 11:07:48', '2020-05-20 13:38:26');
INSERT INTO `carga_horaria` VALUES ('10', 'Hora 1', '3', '1', '13:00:00', '14:00:00', '2', '0', null, '1', '1', '2021-03-12 01:10:55', '2021-03-12 01:10:55');
INSERT INTO `carga_horaria` VALUES ('11', 'Hora 2', '3', '2', '14:00:00', '15:00:00', '2', '0', null, '1', '1', '2021-03-12 01:11:50', '2021-03-12 01:11:50');
INSERT INTO `carga_horaria` VALUES ('12', 'Receso', '3', '3', '15:00:00', '16:00:00', '2', '1', null, '1', '1', '2021-03-12 01:12:35', '2021-03-12 01:12:35');
INSERT INTO `carga_horaria` VALUES ('13', 'Hora 3', '3', '4', '16:00:00', '17:00:00', '2', '0', null, '1', '1', '2021-03-12 01:13:38', '2021-03-12 01:13:38');
INSERT INTO `carga_horaria` VALUES ('14', 'Hora 1', '4', '1', '18:00:00', '19:00:00', '3', '0', null, '1', '1', '2021-03-12 01:16:35', '2021-03-12 01:16:35');
INSERT INTO `carga_horaria` VALUES ('15', 'Hora 2', '4', '2', '19:00:00', '20:00:00', '3', '0', null, '1', '1', '2021-03-12 01:17:10', '2021-03-12 01:17:10');
INSERT INTO `carga_horaria` VALUES ('16', 'Hora 1', '5', '1', '08:00:00', '09:00:00', '4', '0', null, '1', '1', '2021-03-12 01:19:25', '2021-03-12 01:19:25');
INSERT INTO `carga_horaria` VALUES ('17', 'Descanso', '5', '2', '09:00:00', '10:00:00', '4', '1', null, '1', '1', '2021-03-12 01:24:41', '2021-03-12 01:24:41');
INSERT INTO `carga_horaria` VALUES ('18', 'Hora 2', '5', '3', '10:00:00', '11:00:00', '4', '0', null, '1', '1', '2021-03-12 01:25:17', '2021-03-12 01:25:17');

-- ----------------------------
-- Table structure for cargo
-- ----------------------------
DROP TABLE IF EXISTS `cargo`;
CREATE TABLE `cargo` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_cargo` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) unsigned NOT NULL,
  `id_usuario` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cargo_status` (`id_status`),
  KEY `fk_cargo_usuario` (`id_usuario`),
  CONSTRAINT `fk_cargo_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`),
  CONSTRAINT `fk_cargo_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of cargo
-- ----------------------------
INSERT INTO `cargo` VALUES ('1', 'Director', null, '1', '1', '2020-05-09 14:09:04', '2020-05-09 14:09:04');
INSERT INTO `cargo` VALUES ('2', 'Subdirector', null, '1', '1', '2020-05-09 14:09:18', '2020-05-09 14:09:18');
INSERT INTO `cargo` VALUES ('3', 'Secretario', null, '1', '1', '2020-05-09 14:11:46', '2020-05-09 14:11:46');
INSERT INTO `cargo` VALUES ('4', 'Docente', null, '2', '1', '2020-05-16 00:18:43', '2020-05-16 00:18:43');

-- ----------------------------
-- Table structure for certificado
-- ----------------------------
DROP TABLE IF EXISTS `certificado`;
CREATE TABLE `certificado` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_plan_evaluacion` int(11) unsigned NOT NULL,
  `id_grupo` int(11) unsigned NOT NULL,
  `id_materia` int(11) unsigned NOT NULL,
  `tx_linea1` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_linea2` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_linea3` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_path` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `tx_observaciones` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `id_status` int(11) unsigned NOT NULL,
  `id_usuario` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_certificado_plan_evaluacion` (`id_plan_evaluacion`),
  KEY `fk_certificado_grupo` (`id_grupo`),
  KEY `fk_certificado_materia` (`id_materia`),
  KEY `fk_certificado_status` (`id_status`),
  KEY `fk_certificado_usuario` (`id_usuario`),
  CONSTRAINT `fk_certificado_grupo` FOREIGN KEY (`id_grupo`) REFERENCES `grupo` (`id`),
  CONSTRAINT `fk_certificado_materia` FOREIGN KEY (`id_materia`) REFERENCES `materia` (`id`),
  CONSTRAINT `fk_certificado_plan_evaluacion` FOREIGN KEY (`id_plan_evaluacion`) REFERENCES `plan_evaluacion` (`id`),
  CONSTRAINT `fk_certificado_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`),
  CONSTRAINT `fk_certificado_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of certificado
-- ----------------------------

-- ----------------------------
-- Table structure for certificado_alumno
-- ----------------------------
DROP TABLE IF EXISTS `certificado_alumno`;
CREATE TABLE `certificado_alumno` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_certificado` int(11) unsigned NOT NULL,
  `id_alumno` int(11) unsigned NOT NULL,
  `fe_aprobacion` date DEFAULT NULL,
  `tx_codigo` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_observaciones` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `id_status` int(11) unsigned NOT NULL,
  `id_usuario` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_certificado_alumno_certificado` (`id_certificado`),
  KEY `fk_certificado_alumno_alumno` (`id_alumno`),
  KEY `fk_certificado_alumno_status` (`id_status`),
  KEY `fk_certificado_alumno_usuario` (`id_usuario`),
  CONSTRAINT `fk_certificado_alumno_alumno` FOREIGN KEY (`id_alumno`) REFERENCES `alumno` (`id`),
  CONSTRAINT `fk_certificado_alumno_certificado` FOREIGN KEY (`id_certificado`) REFERENCES `certificado` (`id`),
  CONSTRAINT `fk_certificado_alumno_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`),
  CONSTRAINT `fk_certificado_alumno_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of certificado_alumno
-- ----------------------------

-- ----------------------------
-- Table structure for certificado_plantilla
-- ----------------------------
DROP TABLE IF EXISTS `certificado_plantilla`;
CREATE TABLE `certificado_plantilla` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tx_linea1` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_linea2` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_linea3` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_path` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_observaciones` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `id_status` int(11) unsigned NOT NULL,
  `id_usuario` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_certificado_plantilla_status` (`id_status`),
  KEY `fk_certificado_plantilla_usuario` (`id_usuario`),
  CONSTRAINT `fk_certificado_plantilla_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`),
  CONSTRAINT `fk_certificado_plantilla_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of certificado_plantilla
-- ----------------------------
INSERT INTO `certificado_plantilla` VALUES ('1', 'Certifica que:', 'Aprobó el curso de:', '19 horas Teoría y Practica', null, '', '1', '1', '2021-03-15 17:38:38', '2021-03-15 17:38:44');

-- ----------------------------
-- Table structure for ciudad
-- ----------------------------
DROP TABLE IF EXISTS `ciudad`;
CREATE TABLE `ciudad` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `co_ciudad` int(11) NOT NULL,
  `nb_ciudad` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_departamento` int(11) unsigned NOT NULL,
  `tx_latitud` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_longitud` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) unsigned NOT NULL,
  `id_usuario` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ciudad_co_ciudad_unique` (`co_ciudad`,`id_departamento`) USING BTREE,
  KEY `fk_ciudad_departamento` (`id_departamento`),
  KEY `fk_ciudad_status` (`id_status`),
  KEY `fk_ciudad_usuario` (`id_usuario`),
  CONSTRAINT `fk_ciudad_departamento` FOREIGN KEY (`id_departamento`) REFERENCES `departamento` (`id`),
  CONSTRAINT `fk_ciudad_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`),
  CONSTRAINT `fk_ciudad_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1121 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of ciudad
-- ----------------------------
INSERT INTO `ciudad` VALUES ('1', '1', 'Medellin', '5', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('2', '2', 'Abejorral', '5', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('3', '4', 'Abriaqui', '5', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('4', '21', 'Alejandria', '5', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('5', '30', 'Amaga', '5', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('6', '31', 'Amalfi', '5', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('7', '34', 'Andes', '5', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('8', '36', 'Angelopolis', '5', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('9', '38', 'Angostura', '5', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('10', '40', 'Anori', '5', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('11', '42', 'Santafe de Antioquia', '5', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('12', '44', 'Anza', '5', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('13', '45', 'Apartado', '5', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('14', '51', 'Arboletes', '5', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('15', '55', 'Argelia', '5', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('16', '59', 'Armenia', '5', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('17', '79', 'Barbosa', '5', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('18', '86', 'Belmira', '5', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('19', '88', 'Bello', '5', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('20', '91', 'Betania', '5', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('21', '93', 'Betulia', '5', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('22', '101', 'Ciudad Bolivar', '5', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('23', '107', 'Briceño', '5', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('24', '113', 'Buritica', '5', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('25', '120', 'Caceres', '5', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('26', '125', 'Caicedo', '5', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('27', '129', 'Caldas', '5', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('28', '134', 'Campamento', '5', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('29', '138', 'Cañasgordas', '5', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('30', '142', 'Caracoli', '5', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('31', '145', 'Caramanta', '5', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('32', '147', 'Carepa', '5', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('33', '148', 'El Carmen de Viboral', '5', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('34', '150', 'Carolina', '5', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('35', '154', 'Caucasia', '5', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('36', '172', 'Chigorodo', '5', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('37', '190', 'Cisneros', '5', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('38', '197', 'Cocorna', '5', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('39', '206', 'Concepcion', '5', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('40', '209', 'Concordia', '5', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('41', '212', 'Copacabana', '5', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('42', '234', 'Dabeiba', '5', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('43', '237', 'Don Matias', '5', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('44', '240', 'Ebejico', '5', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('45', '250', 'El Bagre', '5', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('46', '264', 'Entrerrios', '5', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('47', '266', 'Envigado', '5', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('48', '282', 'Fredonia', '5', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('49', '284', 'Frontino', '5', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('50', '306', 'Giraldo', '5', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('51', '308', 'Girardota', '5', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('52', '310', 'Gomez Plata', '5', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('53', '313', 'Granada', '5', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('54', '315', 'Guadalupe', '5', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('55', '318', 'Guarne', '5', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('56', '321', 'Guatape', '5', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('57', '347', 'Heliconia', '5', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('58', '353', 'Hispania', '5', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('59', '360', 'Itagui', '5', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('60', '361', 'Ituango', '5', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('61', '364', 'Jardin', '5', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('62', '368', 'Jerico', '5', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('63', '376', 'La Ceja', '5', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('64', '380', 'La Estrella', '5', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('65', '390', 'La Pintada', '5', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('66', '400', 'La Union', '5', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('67', '411', 'Liborina', '5', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('68', '425', 'Maceo', '5', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('69', '440', 'Marinilla', '5', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('70', '467', 'Montebello', '5', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('71', '475', 'Murindo', '5', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('72', '480', 'Mutata', '5', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('73', '483', 'Nariño', '5', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('74', '490', 'Necocli', '5', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('75', '495', 'Nechi', '5', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('76', '501', 'Olaya', '5', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('77', '541', 'Peðol', '5', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('78', '543', 'Peque', '5', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('79', '576', 'Pueblorrico', '5', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('80', '579', 'Puerto Berrio', '5', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('81', '585', 'Puerto Nare', '5', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('82', '591', 'Puerto Triunfo', '5', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('83', '604', 'Remedios', '5', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('84', '607', 'Retiro', '5', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('85', '615', 'Rionegro', '5', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('86', '628', 'Sabanalarga', '5', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('87', '631', 'Sabaneta', '5', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('88', '642', 'Salgar', '5', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('89', '647', 'San Andres de Cuerquia', '5', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('90', '649', 'San Carlos', '5', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('91', '652', 'San Francisco', '5', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('92', '656', 'San Jeronimo', '5', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('93', '658', 'San Jose de La Montaña', '5', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('94', '659', 'San Juan de Uraba', '5', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('95', '660', 'San Luis', '5', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('96', '664', 'San Pedro', '5', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('97', '665', 'San Pedro de Uraba', '5', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('98', '667', 'San Rafael', '5', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('99', '670', 'San Roque', '5', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('100', '674', 'San Vicente', '5', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('101', '679', 'Santa Barbara', '5', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('102', '686', 'Santa Rosa de Osos', '5', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('103', '690', 'Santo Domingo', '5', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('104', '697', 'El Santuario', '5', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('105', '736', 'Segovia', '5', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('106', '756', 'Sonson', '5', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('107', '761', 'Sopetran', '5', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('108', '789', 'Tamesis', '5', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('109', '790', 'Taraza', '5', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('110', '792', 'Tarso', '5', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('111', '809', 'Titiribi', '5', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('112', '819', 'Toledo', '5', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('113', '837', 'Turbo', '5', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('114', '842', 'Uramita', '5', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('115', '847', 'Urrao', '5', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('116', '854', 'Valdivia', '5', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('117', '856', 'Valparaiso', '5', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('118', '858', 'Vegachi', '5', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('119', '861', 'Venecia', '5', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('120', '873', 'Vigia Del Fuerte', '5', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('121', '885', 'Yali', '5', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('122', '887', 'Yarumal', '5', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('123', '890', 'Yolombo', '5', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('124', '893', 'Yondo', '5', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('125', '895', 'Zaragoza', '5', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('126', '1', 'Barranquilla', '8', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('127', '78', 'Baranoa', '8', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('128', '137', 'Campo de La Cruz', '8', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('129', '141', 'Candelaria', '8', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('130', '296', 'Galapa', '8', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('131', '372', 'Juan de Acosta', '8', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('132', '421', 'Luruaco', '8', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('133', '433', 'Malambo', '8', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('134', '436', 'Manati', '8', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('135', '520', 'Palmar de Varela', '8', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('136', '549', 'Piojo', '8', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('137', '558', 'Polonuevo', '8', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('138', '560', 'Ponedera', '8', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('139', '573', 'Puerto Colombia', '8', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('140', '606', 'Repelon', '8', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('141', '634', 'Sabanagrande', '8', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('142', '638', 'Sabanalarga', '8', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('143', '675', 'Santa Lucia', '8', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('144', '685', 'Santo Tomas', '8', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('145', '758', 'Soledad', '8', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('146', '770', 'Suan', '8', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('147', '832', 'Tubara', '8', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('148', '849', 'Usiacuri', '8', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('149', '1', 'Bogota, D.C.', '11', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('150', '1', 'Cartagena', '13', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('151', '6', 'Achi', '13', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('152', '30', 'Altos Del Rosario', '13', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('153', '42', 'Arenal', '13', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('154', '52', 'Arjona', '13', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('155', '62', 'Arroyohondo', '13', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('156', '74', 'Barranco de Loba', '13', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('157', '140', 'Calamar', '13', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('158', '160', 'Cantagallo', '13', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('159', '188', 'Cicuco', '13', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('160', '212', 'Cordoba', '13', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('161', '222', 'Clemencia', '13', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('162', '244', 'El Carmen de Bolivar', '13', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('163', '248', 'El Guamo', '13', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('164', '268', 'El Peñon', '13', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('165', '300', 'Hatillo de Loba', '13', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('166', '430', 'Magangue', '13', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('167', '433', 'Mahates', '13', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('168', '440', 'Margarita', '13', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('169', '442', 'Maria La Baja', '13', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('170', '458', 'Montecristo', '13', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('171', '468', 'Mompos', '13', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('172', '490', 'Norosi', '13', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('173', '473', 'Morales', '13', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('174', '549', 'Pinillos', '13', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('175', '580', 'Regidor', '13', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('176', '600', 'Rio Viejo', '13', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('177', '620', 'San Cristobal', '13', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('178', '647', 'San Estanislao', '13', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('179', '650', 'San Fernando', '13', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('180', '654', 'San Jacinto', '13', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('181', '655', 'San Jacinto Del Cauca', '13', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('182', '657', 'San Juan Nepomuceno', '13', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('183', '667', 'San Martin de Loba', '13', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('184', '670', 'San Pablo', '13', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('185', '673', 'Santa Catalina', '13', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('186', '683', 'Santa Rosa', '13', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('187', '688', 'Santa Rosa Del Sur', '13', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('188', '744', 'Simiti', '13', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('189', '760', 'Soplaviento', '13', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('190', '780', 'Talaigua Nuevo', '13', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('191', '810', 'Tiquisio', '13', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('192', '836', 'Turbaco', '13', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('193', '838', 'Turbana', '13', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('194', '873', 'Villanueva', '13', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('195', '894', 'Zambrano', '13', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('196', '1', 'Tunja', '15', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('197', '22', 'Almeida', '15', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('198', '47', 'Aquitania', '15', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('199', '51', 'Arcabuco', '15', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('200', '87', 'Belen', '15', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('201', '90', 'Berbeo', '15', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('202', '92', 'Beteitiva', '15', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('203', '97', 'Boavita', '15', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('204', '104', 'Boyaca', '15', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('205', '106', 'Briceño', '15', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('206', '109', 'Buenavista', '15', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('207', '114', 'Busbanza', '15', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('208', '131', 'Caldas', '15', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('209', '135', 'Campohermoso', '15', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('210', '162', 'Cerinza', '15', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('211', '172', 'Chinavita', '15', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('212', '176', 'Chiquinquira', '15', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('213', '180', 'Chiscas', '15', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('214', '183', 'Chita', '15', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('215', '185', 'Chitaraque', '15', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('216', '187', 'Chivata', '15', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('217', '189', 'Cienega', '15', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('218', '204', 'Combita', '15', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('219', '212', 'Coper', '15', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('220', '215', 'Corrales', '15', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('221', '218', 'Covarachia', '15', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('222', '223', 'Cubara', '15', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('223', '224', 'Cucaita', '15', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('224', '226', 'Cuitiva', '15', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('225', '232', 'Chiquiza', '15', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('226', '236', 'Chivor', '15', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('227', '238', 'Duitama', '15', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('228', '244', 'El Cocuy', '15', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('229', '248', 'El Espino', '15', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('230', '272', 'Firavitoba', '15', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('231', '276', 'Floresta', '15', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('232', '293', 'Gachantiva', '15', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('233', '296', 'Gameza', '15', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('234', '299', 'Garagoa', '15', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('235', '317', 'Guacamayas', '15', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('236', '322', 'Guateque', '15', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('237', '325', 'Guayata', '15', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('238', '332', 'Gsican', '15', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('239', '362', 'Iza', '15', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('240', '367', 'Jenesano', '15', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('241', '368', 'Jerico', '15', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('242', '377', 'Labranzagrande', '15', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('243', '380', 'La Capilla', '15', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('244', '401', 'La Victoria', '15', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('245', '403', 'La Uvita', '15', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('246', '407', 'Villa de Leyva', '15', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('247', '425', 'Macanal', '15', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('248', '442', 'Maripi', '15', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('249', '455', 'Miraflores', '15', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('250', '464', 'Mongua', '15', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('251', '466', 'Mongui', '15', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('252', '469', 'Moniquira', '15', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('253', '476', 'Motavita', '15', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('254', '480', 'Muzo', '15', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('255', '491', 'Nobsa', '15', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('256', '494', 'Nuevo Colon', '15', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('257', '500', 'Oicata', '15', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('258', '507', 'Otanche', '15', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('259', '511', 'Pachavita', '15', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('260', '514', 'Paez', '15', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('261', '516', 'Paipa', '15', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('262', '518', 'Pajarito', '15', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('263', '522', 'Panqueba', '15', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('264', '531', 'Pauna', '15', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('265', '533', 'Paya', '15', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('266', '537', 'Paz de Rio', '15', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('267', '542', 'Pesca', '15', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('268', '550', 'Pisba', '15', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('269', '572', 'Puerto Boyaca', '15', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('270', '580', 'Quipama', '15', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('271', '599', 'Ramiriqui', '15', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('272', '600', 'Raquira', '15', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('273', '621', 'Rondon', '15', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('274', '632', 'Saboya', '15', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('275', '638', 'Sachica', '15', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('276', '646', 'Samaca', '15', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('277', '660', 'San Eduardo', '15', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('278', '664', 'San Jose de Pare', '15', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('279', '667', 'San Luis de Gaceno', '15', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('280', '673', 'San Mateo', '15', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('281', '676', 'San Miguel de Sema', '15', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('282', '681', 'San Pablo de Borbur', '15', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('283', '686', 'Santana', '15', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('284', '690', 'Santa Maria', '15', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('285', '693', 'Santa Rosa de Viterbo', '15', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('286', '696', 'Santa Sofia', '15', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('287', '720', 'Sativanorte', '15', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('288', '723', 'Sativasur', '15', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('289', '740', 'Siachoque', '15', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('290', '753', 'Soata', '15', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('291', '755', 'Socota', '15', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('292', '757', 'Socha', '15', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('293', '759', 'Sogamoso', '15', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('294', '761', 'Somondoco', '15', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('295', '762', 'Sora', '15', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('296', '763', 'Sotaquira', '15', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('297', '764', 'Soraca', '15', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('298', '774', 'Susacon', '15', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('299', '776', 'Sutamarchan', '15', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('300', '778', 'Sutatenza', '15', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('301', '790', 'Tasco', '15', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('302', '798', 'Tenza', '15', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('303', '804', 'Tibana', '15', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('304', '806', 'Tibasosa', '15', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('305', '808', 'Tinjaca', '15', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('306', '810', 'Tipacoque', '15', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('307', '814', 'Toca', '15', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('308', '816', 'Togsi', '15', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('309', '820', 'Topaga', '15', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('310', '822', 'Tota', '15', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('311', '832', 'Tunungua', '15', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('312', '835', 'Turmeque', '15', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('313', '837', 'Tuta', '15', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('314', '839', 'Tutaza', '15', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('315', '842', 'Umbita', '15', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('316', '861', 'Ventaquemada', '15', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('317', '879', 'Viracacha', '15', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('318', '897', 'Zetaquira', '15', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('319', '1', 'Manizales', '17', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('320', '13', 'Aguadas', '17', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('321', '42', 'Anserma', '17', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('322', '50', 'Aranzazu', '17', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('323', '88', 'Belalcazar', '17', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('324', '174', 'Chinchina', '17', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('325', '272', 'Filadelfia', '17', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('326', '380', 'La Dorada', '17', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('327', '388', 'La Merced', '17', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('328', '433', 'Manzanares', '17', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('329', '442', 'Marmato', '17', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('330', '444', 'Marquetalia', '17', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('331', '446', 'Marulanda', '17', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('332', '486', 'Neira', '17', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('333', '495', 'Norcasia', '17', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('334', '513', 'Pacora', '17', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('335', '524', 'Palestina', '17', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('336', '541', 'Pensilvania', '17', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('337', '614', 'Riosucio', '17', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('338', '616', 'Risaralda', '17', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('339', '653', 'Salamina', '17', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('340', '662', 'Samana', '17', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('341', '665', 'San Jose', '17', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('342', '777', 'Supia', '17', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('343', '867', 'Victoria', '17', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('344', '873', 'Villamaria', '17', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('345', '877', 'Viterbo', '17', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('346', '1', 'Florencia', '18', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('347', '29', 'Albania', '18', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('348', '94', 'Belen de Los Andaquies', '18', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('349', '150', 'Cartagena Del Chaira', '18', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('350', '205', 'Curillo', '18', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('351', '247', 'El Doncello', '18', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('352', '256', 'El Paujil', '18', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('353', '410', 'La Montañita', '18', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('354', '460', 'Milan', '18', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('355', '479', 'Morelia', '18', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('356', '592', 'Puerto Rico', '18', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('357', '610', 'San Jose Del Fragua', '18', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('358', '753', 'San Vicente Del Caguan', '18', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('359', '756', 'Solano', '18', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('360', '785', 'Solita', '18', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('361', '860', 'Valparaiso', '18', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('362', '1', 'Popayan', '19', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('363', '22', 'Almaguer', '19', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('364', '50', 'Argelia', '19', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('365', '75', 'Balboa', '19', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('366', '100', 'Bolivar', '19', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('367', '110', 'Buenos Aires', '19', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('368', '130', 'Cajibio', '19', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('369', '137', 'Caldono', '19', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('370', '142', 'Caloto', '19', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('371', '212', 'Corinto', '19', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('372', '256', 'El Tambo', '19', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('373', '290', 'Florencia', '19', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('374', '300', 'Guachene', '19', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('375', '318', 'Guapi', '19', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('376', '355', 'Inza', '19', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('377', '364', 'Jambalo', '19', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('378', '392', 'La Sierra', '19', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('379', '397', 'La Vega', '19', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('380', '418', 'Lopez', '19', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('381', '450', 'Mercaderes', '19', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('382', '455', 'Miranda', '19', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('383', '473', 'Morales', '19', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('384', '513', 'Padilla', '19', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('385', '517', 'Paez', '19', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('386', '532', 'Patia', '19', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('387', '533', 'Piamonte', '19', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('388', '548', 'Piendamo', '19', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('389', '573', 'Puerto Tejada', '19', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('390', '585', 'Purace', '19', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('391', '622', 'Rosas', '19', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('392', '693', 'San Sebastian', '19', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('393', '698', 'Santander de Quilichao', '19', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('394', '701', 'Santa Rosa', '19', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('395', '743', 'Silvia', '19', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('396', '760', 'Sotara', '19', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('397', '780', 'Suarez', '19', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('398', '785', 'Sucre', '19', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('399', '807', 'Timbio', '19', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('400', '809', 'Timbiqui', '19', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('401', '821', 'Toribio', '19', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('402', '824', 'Totoro', '19', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('403', '845', 'Villa Rica', '19', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('404', '1', 'Valledupar', '20', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('405', '11', 'Aguachica', '20', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('406', '13', 'Agustin Codazzi', '20', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('407', '32', 'Astrea', '20', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('408', '45', 'Becerril', '20', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('409', '60', 'Bosconia', '20', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('410', '175', 'Chimichagua', '20', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('411', '178', 'Chiriguana', '20', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('412', '228', 'Curumani', '20', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('413', '238', 'El Copey', '20', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('414', '250', 'El Paso', '20', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('415', '295', 'Gamarra', '20', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('416', '310', 'Gonzalez', '20', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('417', '383', 'La Gloria', '20', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('418', '400', 'La Jagua de Ibirico', '20', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('419', '443', 'Manaure', '20', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('420', '517', 'Pailitas', '20', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('421', '550', 'Pelaya', '20', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('422', '570', 'Pueblo Bello', '20', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('423', '614', 'Rio de Oro', '20', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('424', '621', 'La Paz', '20', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('425', '710', 'San Alberto', '20', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('426', '750', 'San Diego', '20', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('427', '770', 'San Martin', '20', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('428', '787', 'Tamalameque', '20', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('429', '1', 'Monteria', '23', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('430', '68', 'Ayapel', '23', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('431', '79', 'Buenavista', '23', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('432', '90', 'Canalete', '23', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('433', '162', 'Cerete', '23', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('434', '168', 'Chima', '23', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('435', '182', 'Chinu', '23', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('436', '189', 'Cienaga de Oro', '23', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('437', '300', 'Cotorra', '23', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('438', '350', 'La Apartada', '23', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('439', '417', 'Lorica', '23', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('440', '419', 'Los Cordobas', '23', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('441', '464', 'Momil', '23', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('442', '466', 'Montelibano', '23', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('443', '500', 'Moñitos', '23', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('444', '555', 'Planeta Rica', '23', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('445', '570', 'Pueblo Nuevo', '23', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('446', '574', 'Puerto Escondido', '23', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('447', '580', 'Puerto Libertador', '23', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('448', '586', 'Purisima', '23', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('449', '660', 'Sahagun', '23', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('450', '670', 'San Andres Sotavento', '23', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('451', '672', 'San Antero', '23', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('452', '675', 'San Bernardo Del Viento', '23', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('453', '678', 'San Carlos', '23', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('454', '686', 'San Pelayo', '23', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('455', '807', 'Tierralta', '23', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('456', '855', 'Valencia', '23', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('457', '1', 'Agua de Dios', '25', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('458', '19', 'Alban', '25', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('459', '35', 'Anapoima', '25', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('460', '40', 'Anolaima', '25', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('461', '53', 'Arbelaez', '25', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('462', '86', 'Beltran', '25', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('463', '95', 'Bituima', '25', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('464', '99', 'Bojaca', '25', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('465', '120', 'Cabrera', '25', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('466', '123', 'Cachipay', '25', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('467', '126', 'Cajica', '25', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('468', '148', 'Caparrapi', '25', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('469', '151', 'Caqueza', '25', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('470', '154', 'Carmen de Carupa', '25', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('471', '168', 'Chaguani', '25', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('472', '175', 'Chia', '25', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('473', '178', 'Chipaque', '25', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('474', '181', 'Choachi', '25', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('475', '183', 'Choconta', '25', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('476', '200', 'Cogua', '25', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('477', '214', 'Cota', '25', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('478', '224', 'Cucunuba', '25', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('479', '245', 'El Colegio', '25', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('480', '258', 'El Peñon', '25', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('481', '260', 'El Rosal', '25', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('482', '269', 'Facatativa', '25', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('483', '279', 'Fomeque', '25', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('484', '281', 'Fosca', '25', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('485', '286', 'Funza', '25', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('486', '288', 'Fuquene', '25', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('487', '290', 'Fusagasuga', '25', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('488', '293', 'Gachala', '25', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('489', '295', 'Gachancipa', '25', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('490', '297', 'Gacheta', '25', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('491', '299', 'Gama', '25', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('492', '307', 'Girardot', '25', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('493', '312', 'Granada', '25', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('494', '317', 'Guacheta', '25', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('495', '320', 'Guaduas', '25', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('496', '322', 'Guasca', '25', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('497', '324', 'Guataqui', '25', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('498', '326', 'Guatavita', '25', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('499', '328', 'Guayabal de Siquima', '25', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('500', '335', 'Guayabetal', '25', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('501', '339', 'Gutierrez', '25', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('502', '368', 'Jerusalen', '25', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('503', '372', 'Junin', '25', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('504', '377', 'La Calera', '25', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('505', '386', 'La Mesa', '25', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('506', '394', 'La Palma', '25', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('507', '398', 'La Peña', '25', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('508', '402', 'La Vega', '25', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('509', '407', 'Lenguazaque', '25', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('510', '426', 'Macheta', '25', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('511', '430', 'Madrid', '25', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('512', '436', 'Manta', '25', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('513', '438', 'Medina', '25', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('514', '473', 'Mosquera', '25', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('515', '483', 'Nariño', '25', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('516', '486', 'Nemocon', '25', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('517', '488', 'Nilo', '25', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('518', '489', 'Nimaima', '25', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('519', '491', 'Nocaima', '25', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('520', '506', 'Venecia', '25', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('521', '513', 'Pacho', '25', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('522', '518', 'Paime', '25', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('523', '524', 'Pandi', '25', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('524', '530', 'Paratebueno', '25', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('525', '535', 'Pasca', '25', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('526', '572', 'Puerto Salgar', '25', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('527', '580', 'Puli', '25', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('528', '592', 'Quebradanegra', '25', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('529', '594', 'Quetame', '25', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('530', '596', 'Quipile', '25', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('531', '599', 'Apulo', '25', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('532', '612', 'Ricaurte', '25', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('533', '645', 'San Antonio Del Tequendama', '25', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('534', '649', 'San Bernardo', '25', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('535', '653', 'San Cayetano', '25', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('536', '658', 'San Francisco', '25', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('537', '662', 'San Juan de Rio Seco', '25', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('538', '718', 'Sasaima', '25', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('539', '736', 'Sesquile', '25', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('540', '740', 'Sibate', '25', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('541', '743', 'Silvania', '25', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('542', '745', 'Simijaca', '25', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('543', '754', 'Soacha', '25', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('544', '758', 'Sopo', '25', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('545', '769', 'Subachoque', '25', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('546', '772', 'Suesca', '25', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('547', '777', 'Supata', '25', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('548', '779', 'Susa', '25', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('549', '781', 'Sutatausa', '25', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('550', '785', 'Tabio', '25', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('551', '793', 'Tausa', '25', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('552', '797', 'Tena', '25', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('553', '799', 'Tenjo', '25', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('554', '805', 'Tibacuy', '25', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('555', '807', 'Tibirita', '25', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('556', '815', 'Tocaima', '25', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('557', '817', 'Tocancipa', '25', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('558', '823', 'Topaipi', '25', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('559', '839', 'Ubala', '25', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('560', '841', 'Ubaque', '25', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('561', '843', 'Villa de San Diego de Ubate', '25', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('562', '845', 'Une', '25', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('563', '851', 'Utica', '25', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('564', '862', 'Vergara', '25', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('565', '867', 'Viani', '25', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('566', '871', 'Villagomez', '25', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('567', '873', 'Villapinzon', '25', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('568', '875', 'Villeta', '25', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('569', '878', 'Viota', '25', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('570', '885', 'Yacopi', '25', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('571', '898', 'Zipacon', '25', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('572', '899', 'Zipaquira', '25', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('573', '1', 'Quibdo', '27', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('574', '6', 'Acandi', '27', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('575', '25', 'Alto Baudo', '27', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('576', '50', 'Atrato', '27', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('577', '73', 'Bagado', '27', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('578', '75', 'Bahia Solano', '27', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('579', '77', 'Bajo Baudo', '27', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('580', '99', 'Bojaya', '27', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('581', '135', 'El Canton Del San Pablo', '27', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('582', '150', 'Carmen Del Darien', '27', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('583', '160', 'Certegui', '27', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('584', '205', 'Condoto', '27', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('585', '245', 'El Carmen de Atrato', '27', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('586', '250', 'El Litoral Del San Juan', '27', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('587', '361', 'Istmina', '27', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('588', '372', 'Jurado', '27', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('589', '413', 'Lloro', '27', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('590', '425', 'Medio Atrato', '27', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('591', '430', 'Medio Baudo', '27', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('592', '450', 'Medio San Juan', '27', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('593', '491', 'Novita', '27', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('594', '495', 'Nuqui', '27', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('595', '580', 'Rio Iro', '27', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('596', '600', 'Rio Quito', '27', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('597', '615', 'Riosucio', '27', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('598', '660', 'San Jose Del Palmar', '27', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('599', '745', 'Sipi', '27', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('600', '787', 'Tado', '27', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('601', '800', 'Unguia', '27', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('602', '810', 'Union Panamericana', '27', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('603', '1', 'Neiva', '41', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('604', '6', 'Acevedo', '41', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('605', '13', 'Agrado', '41', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('606', '16', 'Aipe', '41', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('607', '20', 'Algeciras', '41', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('608', '26', 'Altamira', '41', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('609', '78', 'Baraya', '41', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('610', '132', 'Campoalegre', '41', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('611', '206', 'Colombia', '41', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('612', '244', 'Elias', '41', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('613', '298', 'Garzon', '41', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('614', '306', 'Gigante', '41', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('615', '319', 'Guadalupe', '41', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('616', '349', 'Hobo', '41', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('617', '357', 'Iquira', '41', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('618', '359', 'Isnos', '41', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('619', '378', 'La Argentina', '41', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('620', '396', 'La Plata', '41', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('621', '483', 'Nataga', '41', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('622', '503', 'Oporapa', '41', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('623', '518', 'Paicol', '41', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('624', '524', 'Palermo', '41', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('625', '530', 'Palestina', '41', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('626', '548', 'Pital', '41', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('627', '551', 'Pitalito', '41', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('628', '615', 'Rivera', '41', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('629', '660', 'Saladoblanco', '41', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('630', '668', 'San Agustin', '41', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('631', '676', 'Santa Maria', '41', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('632', '770', 'Suaza', '41', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('633', '791', 'Tarqui', '41', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('634', '797', 'Tesalia', '41', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('635', '799', 'Tello', '41', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('636', '801', 'Teruel', '41', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('637', '807', 'Timana', '41', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('638', '872', 'Villavieja', '41', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('639', '885', 'Yaguara', '41', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('640', '1', 'Riohacha', '44', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('641', '35', 'Albania', '44', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('642', '78', 'Barrancas', '44', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('643', '90', 'Dibulla', '44', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('644', '98', 'Distraccion', '44', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('645', '110', 'El Molino', '44', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('646', '279', 'Fonseca', '44', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('647', '378', 'Hatonuevo', '44', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('648', '420', 'La Jagua Del Pilar', '44', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('649', '430', 'Maicao', '44', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('650', '560', 'Manaure', '44', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('651', '650', 'San Juan Del Cesar', '44', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('652', '847', 'Uribia', '44', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('653', '855', 'Urumita', '44', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('654', '874', 'Villanueva', '44', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('655', '1', 'Santa Marta', '47', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('656', '30', 'Algarrobo', '47', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('657', '53', 'Aracataca', '47', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('658', '58', 'Ariguani', '47', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('659', '161', 'Cerro San Antonio', '47', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('660', '170', 'Chibolo', '47', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('661', '189', 'Cienaga', '47', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('662', '205', 'Concordia', '47', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('663', '245', 'El Banco', '47', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('664', '258', 'El Piñon', '47', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('665', '268', 'El Reten', '47', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('666', '288', 'Fundacion', '47', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('667', '318', 'Guamal', '47', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('668', '460', 'Nueva Granada', '47', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('669', '541', 'Pedraza', '47', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('670', '545', 'Pijiño Del Carmen', '47', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('671', '551', 'Pivijay', '47', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('672', '555', 'Plato', '47', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('673', '570', 'Puebloviejo', '47', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('674', '605', 'Remolino', '47', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('675', '660', 'Sabanas de San Angel', '47', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('676', '675', 'Salamina', '47', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('677', '692', 'San Sebastian de Buenavista', '47', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('678', '703', 'San Zenon', '47', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('679', '707', 'Santa Ana', '47', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('680', '720', 'Santa Barbara de Pinto', '47', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('681', '745', 'Sitionuevo', '47', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('682', '798', 'Tenerife', '47', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('683', '960', 'Zapayan', '47', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('684', '980', 'Zona Bananera', '47', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('685', '1', 'Villavicencio', '50', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('686', '6', 'Acacias', '50', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('687', '110', 'Barranca de Upia', '50', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('688', '124', 'Cabuyaro', '50', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('689', '150', 'Castilla La Nueva', '50', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('690', '223', 'Cubarral', '50', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('691', '226', 'Cumaral', '50', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('692', '245', 'El Calvario', '50', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('693', '251', 'El Castillo', '50', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('694', '270', 'El Dorado', '50', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('695', '287', 'Fuente de Oro', '50', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('696', '313', 'Granada', '50', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('697', '318', 'Guamal', '50', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('698', '325', 'Mapiripan', '50', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('699', '330', 'Mesetas', '50', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('700', '350', 'La Macarena', '50', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('701', '370', 'Uribe', '50', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('702', '400', 'Lejanias', '50', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('703', '450', 'Puerto Concordia', '50', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('704', '568', 'Puerto Gaitan', '50', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('705', '573', 'Puerto Lopez', '50', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('706', '577', 'Puerto Lleras', '50', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('707', '590', 'Puerto Rico', '50', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('708', '606', 'Restrepo', '50', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('709', '680', 'San Carlos de Guaroa', '50', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('710', '683', 'San Juan de Arama', '50', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('711', '686', 'San Juanito', '50', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('712', '689', 'San Martin', '50', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('713', '711', 'Vistahermosa', '50', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('714', '1', 'Pasto', '52', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('715', '19', 'Alban', '52', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('716', '22', 'Aldana', '52', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('717', '36', 'Ancuya', '52', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('718', '51', 'Arboleda', '52', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('719', '79', 'Barbacoas', '52', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('720', '83', 'Belen', '52', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('721', '110', 'Buesaco', '52', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('722', '203', 'Colon', '52', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('723', '207', 'Consaca', '52', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('724', '210', 'Contadero', '52', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('725', '215', 'Cordoba', '52', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('726', '224', 'Cuaspud', '52', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('727', '227', 'Cumbal', '52', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('728', '233', 'Cumbitara', '52', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('729', '240', 'Chachagsi', '52', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('730', '250', 'El Charco', '52', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('731', '254', 'El Peñol', '52', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('732', '256', 'El Rosario', '52', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('733', '258', 'El Tablon de Gomez', '52', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('734', '260', 'El Tambo', '52', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('735', '287', 'Funes', '52', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('736', '317', 'Guachucal', '52', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('737', '320', 'Guaitarilla', '52', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('738', '323', 'Gualmatan', '52', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('739', '352', 'Iles', '52', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('740', '354', 'Imues', '52', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('741', '356', 'Ipiales', '52', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('742', '378', 'La Cruz', '52', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('743', '381', 'La Florida', '52', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('744', '385', 'La Llanada', '52', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('745', '390', 'La Tola', '52', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('746', '399', 'La Union', '52', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('747', '405', 'Leiva', '52', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('748', '411', 'Linares', '52', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('749', '418', 'Los Andes', '52', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('750', '427', 'Magsi', '52', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('751', '435', 'Mallama', '52', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('752', '473', 'Mosquera', '52', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('753', '480', 'Nariño', '52', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('754', '490', 'Olaya Herrera', '52', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('755', '506', 'Ospina', '52', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('756', '520', 'Francisco Pizarro', '52', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('757', '540', 'Policarpa', '52', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('758', '560', 'Potosi', '52', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('759', '565', 'Providencia', '52', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('760', '573', 'Puerres', '52', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('761', '585', 'Pupiales', '52', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('762', '612', 'Ricaurte', '52', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('763', '621', 'Roberto Payan', '52', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('764', '678', 'Samaniego', '52', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('765', '683', 'Sandona', '52', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('766', '685', 'San Bernardo', '52', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('767', '687', 'San Lorenzo', '52', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('768', '693', 'San Pablo', '52', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('769', '694', 'San Pedro de Cartago', '52', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('770', '696', 'Santa Barbara', '52', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('771', '699', 'Santacruz', '52', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('772', '720', 'Sapuyes', '52', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('773', '786', 'Taminango', '52', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('774', '788', 'Tangua', '52', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('775', '835', 'San Andres de Tumaco', '52', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('776', '838', 'Tuquerres', '52', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('777', '885', 'Yacuanquer', '52', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('778', '1', 'Cucuta', '54', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('779', '3', 'Abrego', '54', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('780', '51', 'Arboledas', '54', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('781', '99', 'Bochalema', '54', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('782', '109', 'Bucarasica', '54', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('783', '125', 'Cacota', '54', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('784', '128', 'Cachira', '54', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('785', '172', 'Chinacota', '54', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('786', '174', 'Chitaga', '54', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('787', '206', 'Convencion', '54', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('788', '223', 'Cucutilla', '54', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('789', '239', 'Durania', '54', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('790', '245', 'El Carmen', '54', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('791', '250', 'El Tarra', '54', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('792', '261', 'El Zulia', '54', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('793', '313', 'Gramalote', '54', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('794', '344', 'Hacari', '54', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('795', '347', 'Herran', '54', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('796', '377', 'Labateca', '54', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('797', '385', 'La Esperanza', '54', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('798', '398', 'La Playa', '54', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('799', '405', 'Los Patios', '54', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('800', '418', 'Lourdes', '54', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('801', '480', 'Mutiscua', '54', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('802', '498', 'Ocaña', '54', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('803', '518', 'Pamplona', '54', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('804', '520', 'Pamplonita', '54', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('805', '553', 'Puerto Santander', '54', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('806', '599', 'Ragonvalia', '54', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('807', '660', 'Salazar', '54', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('808', '670', 'San Calixto', '54', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('809', '673', 'San Cayetano', '54', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('810', '680', 'Santiago', '54', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('811', '720', 'Sardinata', '54', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('812', '743', 'Silos', '54', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('813', '800', 'Teorama', '54', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('814', '810', 'Tibu', '54', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('815', '820', 'Toledo', '54', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('816', '871', 'Villa Caro', '54', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('817', '874', 'Villa Del Rosario', '54', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('818', '1', 'Armenia', '63', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('819', '111', 'Buenavista', '63', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('820', '130', 'Calarca', '63', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('821', '190', 'Circasia', '63', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('822', '212', 'Cordoba', '63', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('823', '272', 'Filandia', '63', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('824', '302', 'Genova', '63', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('825', '401', 'La Tebaida', '63', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('826', '470', 'Montenegro', '63', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('827', '548', 'Pijao', '63', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('828', '594', 'Quimbaya', '63', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('829', '690', 'Salento', '63', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('830', '1', 'Pereira', '66', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('831', '45', 'Apia', '66', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('832', '75', 'Balboa', '66', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('833', '88', 'Belen de Umbria', '66', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('834', '170', 'Dosquebradas', '66', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('835', '318', 'Guatica', '66', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('836', '383', 'La Celia', '66', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('837', '400', 'La Virginia', '66', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('838', '440', 'Marsella', '66', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('839', '456', 'Mistrato', '66', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('840', '572', 'Pueblo Rico', '66', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('841', '594', 'Quinchia', '66', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('842', '682', 'Santa Rosa de Cabal', '66', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('843', '687', 'Santuario', '66', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('844', '1', 'Bucaramanga', '68', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('845', '13', 'Aguada', '68', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('846', '20', 'Albania', '68', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('847', '51', 'Aratoca', '68', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('848', '77', 'Barbosa', '68', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('849', '79', 'Barichara', '68', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('850', '81', 'Barrancabermeja', '68', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('851', '92', 'Betulia', '68', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('852', '101', 'Bolivar', '68', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('853', '121', 'Cabrera', '68', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('854', '132', 'California', '68', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('855', '147', 'Capitanejo', '68', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('856', '152', 'Carcasi', '68', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('857', '160', 'Cepita', '68', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('858', '162', 'Cerrito', '68', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('859', '167', 'Charala', '68', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('860', '169', 'Charta', '68', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('861', '176', 'Chima', '68', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('862', '179', 'Chipata', '68', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('863', '190', 'Cimitarra', '68', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('864', '207', 'Concepcion', '68', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('865', '209', 'Confines', '68', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('866', '211', 'Contratacion', '68', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('867', '217', 'Coromoro', '68', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('868', '229', 'Curiti', '68', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('869', '235', 'El Carmen de Chucuri', '68', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('870', '245', 'El Guacamayo', '68', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('871', '250', 'El Peñon', '68', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('872', '255', 'El Playon', '68', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('873', '264', 'Encino', '68', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('874', '266', 'Enciso', '68', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('875', '271', 'Florian', '68', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('876', '276', 'Floridablanca', '68', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('877', '296', 'Galan', '68', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('878', '298', 'Gambita', '68', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('879', '307', 'Giron', '68', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('880', '318', 'Guaca', '68', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('881', '320', 'Guadalupe', '68', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('882', '322', 'Guapota', '68', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('883', '324', 'Guavata', '68', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('884', '327', 'Gsepsa', '68', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('885', '344', 'Hato', '68', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('886', '368', 'Jesus Maria', '68', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('887', '370', 'Jordan', '68', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('888', '377', 'La Belleza', '68', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('889', '385', 'Landazuri', '68', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('890', '397', 'La Paz', '68', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('891', '406', 'Lebrija', '68', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('892', '418', 'Los Santos', '68', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('893', '425', 'Macaravita', '68', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('894', '432', 'Malaga', '68', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('895', '444', 'Matanza', '68', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('896', '464', 'Mogotes', '68', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('897', '468', 'Molagavita', '68', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('898', '498', 'Ocamonte', '68', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('899', '500', 'Oiba', '68', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('900', '502', 'Onzaga', '68', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('901', '522', 'Palmar', '68', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('902', '524', 'Palmas Del Socorro', '68', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('903', '533', 'Paramo', '68', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('904', '547', 'Piedecuesta', '68', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('905', '549', 'Pinchote', '68', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('906', '572', 'Puente Nacional', '68', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('907', '573', 'Puerto Parra', '68', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('908', '575', 'Puerto Wilches', '68', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('909', '615', 'Rionegro', '68', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('910', '655', 'Sabana de Torres', '68', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('911', '669', 'San Andres', '68', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('912', '673', 'San Benito', '68', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('913', '679', 'San Gil', '68', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('914', '682', 'San Joaquin', '68', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('915', '684', 'San Jose de Miranda', '68', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('916', '686', 'San Miguel', '68', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('917', '689', 'San Vicente de Chucuri', '68', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('918', '705', 'Santa Barbara', '68', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('919', '720', 'Santa Helena Del Opon', '68', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('920', '745', 'Simacota', '68', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('921', '755', 'Socorro', '68', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('922', '770', 'Suaita', '68', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('923', '773', 'Sucre', '68', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('924', '780', 'Surata', '68', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('925', '820', 'Tona', '68', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('926', '855', 'Valle de San Jose', '68', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('927', '861', 'Velez', '68', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('928', '867', 'Vetas', '68', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('929', '872', 'Villanueva', '68', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('930', '895', 'Zapatoca', '68', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('931', '1', 'Sincelejo', '70', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('932', '110', 'Buenavista', '70', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('933', '124', 'Caimito', '70', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('934', '204', 'Coloso', '70', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('935', '215', 'Corozal', '70', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('936', '221', 'Coveñas', '70', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('937', '230', 'Chalan', '70', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('938', '233', 'El Roble', '70', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('939', '235', 'Galeras', '70', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('940', '265', 'Guaranda', '70', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('941', '400', 'La Union', '70', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('942', '418', 'Los Palmitos', '70', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('943', '429', 'Majagual', '70', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('944', '473', 'Morroa', '70', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('945', '508', 'Ovejas', '70', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('946', '523', 'Palmito', '70', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('947', '670', 'Sampues', '70', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('948', '678', 'San Benito Abad', '70', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('949', '702', 'San Juan de Betulia', '70', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('950', '708', 'San Marcos', '70', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('951', '713', 'San Onofre', '70', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('952', '717', 'San Pedro', '70', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('953', '742', 'San Luis de Since', '70', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('954', '771', 'Sucre', '70', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('955', '820', 'Santiago de Tolu', '70', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('956', '823', 'Tolu Viejo', '70', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('957', '1', 'Ibague', '73', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('958', '24', 'Alpujarra', '73', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('959', '26', 'Alvarado', '73', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('960', '30', 'Ambalema', '73', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('961', '43', 'Anzoategui', '73', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('962', '55', 'Armero', '73', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('963', '67', 'Ataco', '73', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('964', '124', 'Cajamarca', '73', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('965', '148', 'Carmen de Apicala', '73', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('966', '152', 'Casabianca', '73', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('967', '168', 'Chaparral', '73', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('968', '200', 'Coello', '73', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('969', '217', 'Coyaima', '73', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('970', '226', 'Cunday', '73', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('971', '236', 'Dolores', '73', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('972', '268', 'Espinal', '73', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('973', '270', 'Falan', '73', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('974', '275', 'Flandes', '73', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('975', '283', 'Fresno', '73', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('976', '319', 'Guamo', '73', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('977', '347', 'Herveo', '73', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('978', '349', 'Honda', '73', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('979', '352', 'Icononzo', '73', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('980', '408', 'Lerida', '73', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('981', '411', 'Libano', '73', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('982', '443', 'Mariquita', '73', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('983', '449', 'Melgar', '73', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('984', '461', 'Murillo', '73', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('985', '483', 'Natagaima', '73', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('986', '504', 'Ortega', '73', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('987', '520', 'Palocabildo', '73', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('988', '547', 'Piedras', '73', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('989', '555', 'Planadas', '73', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('990', '563', 'Prado', '73', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('991', '585', 'Purificacion', '73', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('992', '616', 'Rioblanco', '73', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('993', '622', 'Roncesvalles', '73', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('994', '624', 'Rovira', '73', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('995', '671', 'Saldaña', '73', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('996', '675', 'San Antonio', '73', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('997', '678', 'San Luis', '73', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('998', '686', 'Santa Isabel', '73', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('999', '770', 'Suarez', '73', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('1000', '854', 'Valle de San Juan', '73', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('1001', '861', 'Venadillo', '73', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('1002', '870', 'Villahermosa', '73', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('1003', '873', 'Villarrica', '73', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('1004', '1', 'Cali', '76', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('1005', '20', 'Alcala', '76', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('1006', '36', 'Andalucia', '76', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('1007', '41', 'Ansermanuevo', '76', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('1008', '54', 'Argelia', '76', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('1009', '100', 'Bolivar', '76', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('1010', '109', 'Buenaventura', '76', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('1011', '111', 'Guadalajara de Buga', '76', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('1012', '113', 'Bugalagrande', '76', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('1013', '122', 'Caicedonia', '76', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('1014', '126', 'Calima', '76', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('1015', '130', 'Candelaria', '76', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('1016', '147', 'Cartago', '76', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('1017', '233', 'Dagua', '76', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('1018', '243', 'El Aguila', '76', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('1019', '246', 'El Cairo', '76', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('1020', '248', 'El Cerrito', '76', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('1021', '250', 'El Dovio', '76', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('1022', '275', 'Florida', '76', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('1023', '306', 'Ginebra', '76', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('1024', '318', 'Guacari', '76', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('1025', '364', 'Jamundi', '76', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('1026', '377', 'La Cumbre', '76', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('1027', '400', 'La Union', '76', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('1028', '403', 'La Victoria', '76', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('1029', '497', 'Obando', '76', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('1030', '520', 'Palmira', '76', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('1031', '563', 'Pradera', '76', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('1032', '606', 'Restrepo', '76', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('1033', '616', 'Riofrio', '76', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('1034', '622', 'Roldanillo', '76', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('1035', '670', 'San Pedro', '76', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('1036', '736', 'Sevilla', '76', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('1037', '823', 'Toro', '76', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('1038', '828', 'Trujillo', '76', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('1039', '834', 'Tulua', '76', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('1040', '845', 'Ulloa', '76', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('1041', '863', 'Versalles', '76', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('1042', '869', 'Vijes', '76', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('1043', '890', 'Yotoco', '76', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('1044', '892', 'Yumbo', '76', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('1045', '895', 'Zarzal', '76', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('1046', '1', 'Arauca', '81', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('1047', '65', 'Arauquita', '81', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('1048', '220', 'Cravo Norte', '81', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('1049', '300', 'Fortul', '81', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('1050', '591', 'Puerto Rondon', '81', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('1051', '736', 'Saravena', '81', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('1052', '794', 'Tame', '81', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('1053', '1', 'Yopal', '85', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('1054', '10', 'Aguazul', '85', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('1055', '15', 'Chameza', '85', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('1056', '125', 'Hato Corozal', '85', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('1057', '136', 'La Salina', '85', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('1058', '139', 'Mani', '85', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('1059', '162', 'Monterrey', '85', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('1060', '225', 'Nunchia', '85', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('1061', '230', 'Orocue', '85', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('1062', '250', 'Paz de Ariporo', '85', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('1063', '263', 'Pore', '85', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('1064', '279', 'Recetor', '85', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('1065', '300', 'Sabanalarga', '85', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('1066', '315', 'Sacama', '85', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('1067', '325', 'San Luis de Palenque', '85', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('1068', '400', 'Tamara', '85', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('1069', '410', 'Tauramena', '85', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('1070', '430', 'Trinidad', '85', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('1071', '440', 'Villanueva', '85', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('1072', '1', 'Mocoa', '86', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('1073', '219', 'Colon', '86', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('1074', '320', 'Orito', '86', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('1075', '568', 'Puerto Asis', '86', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('1076', '569', 'Puerto Caicedo', '86', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('1077', '571', 'Puerto Guzman', '86', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('1078', '573', 'Leguizamo', '86', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('1079', '749', 'Sibundoy', '86', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('1080', '755', 'San Francisco', '86', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('1081', '757', 'San Miguel', '86', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('1082', '760', 'Santiago', '86', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('1083', '865', 'Valle Del Guamuez', '86', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('1084', '885', 'Villagarzon', '86', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('1085', '1', 'San Andres', '88', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('1086', '564', 'Providencia', '88', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('1087', '1', 'Leticia', '91', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('1088', '263', 'El Encanto', '91', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('1089', '405', 'La Chorrera', '91', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('1090', '407', 'La Pedrera', '91', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('1091', '430', 'La Victoria', '91', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('1092', '460', 'Miriti - Parana', '91', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('1093', '530', 'Puerto Alegria', '91', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('1094', '536', 'Puerto Arica', '91', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('1095', '540', 'Puerto Nariño', '91', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('1096', '669', 'Puerto Santander', '91', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('1097', '798', 'Tarapaca', '91', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('1098', '1', 'Inirida', '94', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('1099', '343', 'Barranco Minas', '94', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('1100', '663', 'Mapiripana', '94', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('1101', '883', 'San Felipe', '94', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('1102', '884', 'Puerto Colombia', '94', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('1103', '885', 'La Guadalupe', '94', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('1104', '886', 'Cacahual', '94', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('1105', '887', 'Pana Pana', '94', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('1106', '888', 'Morichal', '94', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('1107', '1', 'San Jose Del Guaviare', '95', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('1108', '15', 'Calamar', '95', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('1109', '25', 'El Retorno', '95', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('1110', '200', 'Miraflores', '95', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('1111', '1', 'Mitu', '97', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('1112', '161', 'Caruru', '97', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('1113', '511', 'Pacoa', '97', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('1114', '666', 'Taraira', '97', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('1115', '777', 'Papunaua', '97', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('1116', '889', 'Yavarate', '97', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('1117', '1', 'Puerto Carreño', '99', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('1118', '524', 'La Primavera', '99', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('1119', '624', 'Santa Rosalia', '99', null, null, null, '1', '1', null, null);
INSERT INTO `ciudad` VALUES ('1120', '773', 'Cumaribo', '99', null, null, null, '1', '1', null, null);

-- ----------------------------
-- Table structure for clase
-- ----------------------------
DROP TABLE IF EXISTS `clase`;
CREATE TABLE `clase` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_grado` int(11) unsigned NOT NULL,
  `id_grupo` int(11) unsigned NOT NULL,
  `id_materia` int(11) unsigned NOT NULL,
  `id_docente` int(11) unsigned NOT NULL,
  `fe_clase` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fe_completada` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) unsigned NOT NULL,
  `id_usuario` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_clase_grado` (`id_grado`),
  KEY `fk_clase_grupo` (`id_grupo`),
  KEY `fk_clase_materia` (`id_materia`),
  KEY `fk_clase_docente` (`id_docente`),
  KEY `fk_clase_status` (`id_status`),
  KEY `fk_clase_usuario` (`id_usuario`),
  CONSTRAINT `fk_clase_docente` FOREIGN KEY (`id_docente`) REFERENCES `docente` (`id`),
  CONSTRAINT `fk_clase_grado` FOREIGN KEY (`id_grado`) REFERENCES `grado` (`id`),
  CONSTRAINT `fk_clase_grupo` FOREIGN KEY (`id_grupo`) REFERENCES `grupo` (`id`),
  CONSTRAINT `fk_clase_materia` FOREIGN KEY (`id_materia`) REFERENCES `materia` (`id`),
  CONSTRAINT `fk_clase_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`),
  CONSTRAINT `fk_clase_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of clase
-- ----------------------------
INSERT INTO `clase` VALUES ('6', '4', '1', '1', '1', '2021-04-02 13:32:45', '2021-04-02 17:32:45', null, '1', '1', '2021-04-02 17:08:04', '2021-04-02 17:32:45');
INSERT INTO `clase` VALUES ('7', '4', '1', '1', '1', '2021-04-02 13:35:27', '2021-04-02 17:35:27', null, '1', '1', '2021-04-02 17:32:58', '2021-04-02 17:35:27');
INSERT INTO `clase` VALUES ('8', '4', '1', '1', '1', '2021-04-06 11:25:59', '2021-04-06 15:25:59', null, '1', '1', '2021-04-02 17:35:36', '2021-04-06 15:25:59');
INSERT INTO `clase` VALUES ('9', '4', '1', '1', '1', '2021-04-06 18:51:14', '2021-04-06 22:51:14', null, '1', '1', '2021-04-06 15:26:20', '2021-04-06 22:51:14');
INSERT INTO `clase` VALUES ('10', '4', '1', '4', '1', '2021-04-06 18:53:12', '2021-04-06 22:53:12', null, '1', '1', '2021-04-06 22:51:27', '2021-04-06 22:53:12');

-- ----------------------------
-- Table structure for colegio
-- ----------------------------
DROP TABLE IF EXISTS `colegio`;
CREATE TABLE `colegio` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_colegio` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tx_codigo` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_tipo_colegio` int(11) unsigned NOT NULL,
  `id_calendario` int(11) unsigned NOT NULL,
  `id_jornada` int(11) unsigned NOT NULL,
  `id_departamento` int(11) unsigned NOT NULL,
  `id_ciudad` int(11) unsigned NOT NULL,
  `id_zona` int(11) unsigned NOT NULL,
  `id_comuna` int(11) unsigned NOT NULL,
  `id_barrio` int(11) unsigned NOT NULL,
  `tx_direccion` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_telefono` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nu_estudiantes` int(11) DEFAULT NULL,
  `tx_logo` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nu_latitud` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nu_longitud` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) unsigned NOT NULL,
  `id_usuario` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_colegio_tipo_colegio` (`id_tipo_colegio`),
  KEY `fk_colegio_calendario` (`id_calendario`),
  KEY `fk_colegio_jornada` (`id_jornada`),
  KEY `fk_colegio_departamento` (`id_departamento`),
  KEY `fk_colegio_ciudad` (`id_ciudad`),
  KEY `fk_colegio_zona` (`id_zona`),
  KEY `fk_colegio_comuna` (`id_comuna`),
  KEY `fk_colegio_barrio` (`id_barrio`),
  KEY `fk_colegio_status` (`id_status`),
  KEY `fk_colegio_usuario` (`id_usuario`),
  CONSTRAINT `fk_colegio_barrio` FOREIGN KEY (`id_barrio`) REFERENCES `barrio` (`id`),
  CONSTRAINT `fk_colegio_calendario` FOREIGN KEY (`id_calendario`) REFERENCES `calendario` (`id`),
  CONSTRAINT `fk_colegio_ciudad` FOREIGN KEY (`id_ciudad`) REFERENCES `ciudad` (`id`),
  CONSTRAINT `fk_colegio_comuna` FOREIGN KEY (`id_comuna`) REFERENCES `comuna` (`id`),
  CONSTRAINT `fk_colegio_departamento` FOREIGN KEY (`id_departamento`) REFERENCES `departamento` (`id`),
  CONSTRAINT `fk_colegio_jornada` FOREIGN KEY (`id_jornada`) REFERENCES `jornada` (`id`),
  CONSTRAINT `fk_colegio_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`),
  CONSTRAINT `fk_colegio_tipo_colegio` FOREIGN KEY (`id_tipo_colegio`) REFERENCES `tipo_colegio` (`id`),
  CONSTRAINT `fk_colegio_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`),
  CONSTRAINT `fk_colegio_zona` FOREIGN KEY (`id_zona`) REFERENCES `zona` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of colegio
-- ----------------------------
INSERT INTO `colegio` VALUES ('1', 'Ingles Turismo', '202000001', '1', '1', '1', '5', '76', '2', '2', '3', 'Calle 23 con calle 22', '4314124', '800', null, null, null, null, '1', '1', '2020-06-03 18:21:50', '2021-03-12 00:33:00');

-- ----------------------------
-- Table structure for comuna
-- ----------------------------
DROP TABLE IF EXISTS `comuna`;
CREATE TABLE `comuna` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `co_comuna` int(11) NOT NULL,
  `nb_comuna` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_zona` int(11) unsigned NOT NULL,
  `tx_latitud` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_longitud` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) unsigned NOT NULL,
  `id_usuario` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `comuna_co_comuna_unique` (`co_comuna`),
  KEY `fk_comuna_zona` (`id_zona`),
  KEY `fk_comuna_status` (`id_status`),
  KEY `fk_comuna_usuario` (`id_usuario`),
  CONSTRAINT `fk_comuna_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`),
  CONSTRAINT `fk_comuna_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`),
  CONSTRAINT `fk_comuna_zona` FOREIGN KEY (`id_zona`) REFERENCES `zona` (`id`)
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
  `id_colegio` int(11) unsigned NOT NULL,
  `nb_configuracion` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_valor` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_modulo` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) unsigned NOT NULL,
  `id_usuario` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_configuracion_colegio` (`id_colegio`),
  KEY `fk_configuracion_status` (`id_status`),
  KEY `fk_configuracion_usuario` (`id_usuario`),
  CONSTRAINT `fk_configuracion_colegio` FOREIGN KEY (`id_colegio`) REFERENCES `colegio` (`id`),
  CONSTRAINT `fk_configuracion_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`),
  CONSTRAINT `fk_configuracion_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
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
  `id_tipo_contacto` int(11) unsigned NOT NULL,
  `id_origen` int(11) unsigned NOT NULL,
  `tx_email` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tx_sitio_web` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_facebook` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_twitter` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_instagram` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_youtube` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) unsigned NOT NULL,
  `id_usuario` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_contacto_tipo_contacto` (`id_tipo_contacto`),
  KEY `fk_contacto_status` (`id_status`),
  KEY `fk_contacto_usuario` (`id_usuario`),
  CONSTRAINT `fk_contacto_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`),
  CONSTRAINT `fk_contacto_tipo_contacto` FOREIGN KEY (`id_tipo_contacto`) REFERENCES `tipo_contacto` (`id`),
  CONSTRAINT `fk_contacto_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of contacto
-- ----------------------------
INSERT INTO `contacto` VALUES ('1', '1', '1', 'lyustiz@gmail.com', null, null, null, null, null, null, '1', '1', '2020-06-04 13:30:41', '2020-06-04 13:30:41');

-- ----------------------------
-- Table structure for contenidos
-- ----------------------------
DROP TABLE IF EXISTS `contenidos`;
CREATE TABLE `contenidos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_tipo_evaluacion` int(11) unsigned NOT NULL,
  `id_origen` int(11) unsigned NOT NULL,
  `tx_origen` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `id_materia` int(11) unsigned NOT NULL,
  `id_tema` int(11) unsigned NOT NULL,
  `tx_observaciones` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `id_status` int(11) unsigned NOT NULL,
  `id_usuario` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_contenidos_tipo_evaluacion` (`id_tipo_evaluacion`),
  KEY `fk_contenidos_materia` (`id_materia`),
  KEY `fk_contenidos_tema` (`id_tema`),
  KEY `fk_contenidos_status` (`id_status`),
  KEY `fk_contenidos_usuario` (`id_usuario`),
  CONSTRAINT `fk_contenidos_materia` FOREIGN KEY (`id_materia`) REFERENCES `materia` (`id`),
  CONSTRAINT `fk_contenidos_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`),
  CONSTRAINT `fk_contenidos_tema` FOREIGN KEY (`id_tema`) REFERENCES `tema` (`id`),
  CONSTRAINT `fk_contenidos_tipo_evaluacion` FOREIGN KEY (`id_tipo_evaluacion`) REFERENCES `tipo_evaluacion` (`id`),
  CONSTRAINT `fk_contenidos_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of contenidos
-- ----------------------------

-- ----------------------------
-- Table structure for departamento
-- ----------------------------
DROP TABLE IF EXISTS `departamento`;
CREATE TABLE `departamento` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `co_departamento` int(11) NOT NULL,
  `nb_departamento` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_pais` int(11) unsigned NOT NULL,
  `tx_latitud` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_longitud` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) unsigned NOT NULL,
  `id_usuario` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `departamento_co_departamento_unique` (`co_departamento`),
  UNIQUE KEY `departamento_nb_departamento_unique` (`nb_departamento`),
  KEY `fk_departamento_pais` (`id_pais`),
  KEY `fk_departamento_status` (`id_status`),
  KEY `fk_departamento_usuario` (`id_usuario`),
  CONSTRAINT `fk_departamento_pais` FOREIGN KEY (`id_pais`) REFERENCES `pais` (`id`),
  CONSTRAINT `fk_departamento_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`),
  CONSTRAINT `fk_departamento_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
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
  `id_horario` int(11) unsigned NOT NULL,
  `id_materia` int(11) unsigned NOT NULL,
  `id_docente` int(11) unsigned NOT NULL,
  `id_dia_semana` int(11) unsigned NOT NULL,
  `id_aula` int(11) unsigned NOT NULL,
  `hh_inicio` time NOT NULL,
  `hh_fin` time NOT NULL,
  `id_carga_horaria` int(11) unsigned NOT NULL,
  `id_hora_academica` int(11) unsigned NOT NULL,
  `nu_carga_horaria` int(11) NOT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) unsigned NOT NULL,
  `id_usuario` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_detalle_horario_horario` (`id_horario`),
  KEY `fk_detalle_horario_materia` (`id_materia`),
  KEY `fk_detalle_horario_docente` (`id_docente`),
  KEY `fk_detalle_horario_aula` (`id_aula`),
  KEY `fk_detalle_horario_carga_horaria` (`id_carga_horaria`),
  KEY `fk_detalle_horario_hora_academica` (`id_hora_academica`),
  KEY `fk_detalle_horario_status` (`id_status`),
  KEY `fk_detalle_horario_usuario` (`id_usuario`),
  CONSTRAINT `fk_detalle_horario_aula` FOREIGN KEY (`id_aula`) REFERENCES `aula` (`id`),
  CONSTRAINT `fk_detalle_horario_carga_horaria` FOREIGN KEY (`id_carga_horaria`) REFERENCES `carga_horaria` (`id`),
  CONSTRAINT `fk_detalle_horario_docente` FOREIGN KEY (`id_docente`) REFERENCES `docente` (`id`),
  CONSTRAINT `fk_detalle_horario_hora_academica` FOREIGN KEY (`id_hora_academica`) REFERENCES `hora_academica` (`id`),
  CONSTRAINT `fk_detalle_horario_horario` FOREIGN KEY (`id_horario`) REFERENCES `horario` (`id`),
  CONSTRAINT `fk_detalle_horario_materia` FOREIGN KEY (`id_materia`) REFERENCES `materia` (`id`),
  CONSTRAINT `fk_detalle_horario_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`),
  CONSTRAINT `fk_detalle_horario_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of detalle_horario
-- ----------------------------
INSERT INTO `detalle_horario` VALUES ('1', 'H1M1D1S1I08:00F08:45', '1', '1', '1', '1', '1', '08:00:00', '08:45:00', '2', '1', '2', null, '1', '1', '2021-03-12 12:00:42', '2021-03-12 12:00:42');
INSERT INTO `detalle_horario` VALUES ('2', 'H1M1D1S1I08:00F08:45', '1', '1', '1', '1', '1', '08:45:00', '09:30:00', '3', '1', '0', null, '1', '1', '2021-03-12 12:00:42', '2021-03-12 12:00:42');
INSERT INTO `detalle_horario` VALUES ('3', 'H1M1D1S1I10:15F11:00', '1', '1', '1', '1', '1', '10:15:00', '11:00:00', '5', '1', '1', null, '1', '1', '2021-03-12 12:00:59', '2021-03-12 12:00:59');
INSERT INTO `detalle_horario` VALUES ('4', 'H1M1D1S4I08:00F08:45', '1', '1', '1', '4', '1', '08:00:00', '08:45:00', '2', '1', '1', null, '1', '1', '2021-03-12 12:01:29', '2021-03-12 12:01:29');

-- ----------------------------
-- Table structure for directiva
-- ----------------------------
DROP TABLE IF EXISTS `directiva`;
CREATE TABLE `directiva` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_colegio` int(11) unsigned NOT NULL,
  `id_cargo` int(11) unsigned NOT NULL,
  `nb_directiva` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_tipo_directiva` int(11) unsigned NOT NULL,
  `tx_documento` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) unsigned NOT NULL,
  `id_usuario` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_directiva_colegio` (`id_colegio`),
  KEY `fk_directiva_cargo` (`id_cargo`),
  KEY `fk_directiva_tipo_directiva` (`id_tipo_directiva`),
  KEY `fk_directiva_status` (`id_status`),
  KEY `fk_directiva_usuario` (`id_usuario`),
  CONSTRAINT `fk_directiva_cargo` FOREIGN KEY (`id_cargo`) REFERENCES `cargo` (`id`),
  CONSTRAINT `fk_directiva_colegio` FOREIGN KEY (`id_colegio`) REFERENCES `colegio` (`id`),
  CONSTRAINT `fk_directiva_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`),
  CONSTRAINT `fk_directiva_tipo_directiva` FOREIGN KEY (`id_tipo_directiva`) REFERENCES `tipo_directiva` (`id`),
  CONSTRAINT `fk_directiva_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of directiva
-- ----------------------------

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
  `id_tipo_documento` int(11) unsigned NOT NULL,
  `tx_documento` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_estado_civil` int(11) unsigned NOT NULL,
  `tx_sexo` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fe_nacimiento` date NOT NULL,
  `tx_nacionalidad` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_lugar_nacimiento` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_direccion` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_departamento` int(11) unsigned NOT NULL,
  `id_ciudad` int(11) unsigned NOT NULL,
  `tx_email` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_telefono` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_telefono_movil` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) unsigned NOT NULL,
  `id_usuario` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_docente_tipo_documento` (`id_tipo_documento`),
  KEY `fk_docente_estado_civil` (`id_estado_civil`),
  KEY `fk_docente_departamento` (`id_departamento`),
  KEY `fk_docente_ciudad` (`id_ciudad`),
  KEY `fk_docente_status` (`id_status`),
  KEY `fk_docente_usuario` (`id_usuario`),
  CONSTRAINT `fk_docente_ciudad` FOREIGN KEY (`id_ciudad`) REFERENCES `ciudad` (`id`),
  CONSTRAINT `fk_docente_departamento` FOREIGN KEY (`id_departamento`) REFERENCES `departamento` (`id`),
  CONSTRAINT `fk_docente_estado_civil` FOREIGN KEY (`id_estado_civil`) REFERENCES `estado_civil` (`id`),
  CONSTRAINT `fk_docente_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`),
  CONSTRAINT `fk_docente_tipo_documento` FOREIGN KEY (`id_tipo_documento`) REFERENCES `tipo_documento` (`id`),
  CONSTRAINT `fk_docente_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of docente
-- ----------------------------
INSERT INTO `docente` VALUES ('1', 'Luis', 'Daniel', 'Yustiz', 'Azuaje', '1', '13479149', '2', 'M', '1979-08-11', 'Colombiano', 'Caracas - Venezuela', 'Casa 23-9', '5', '1', 'lyustiz@gmail.com', '04129098862', '04129098862', null, '1', '1', '2020-05-16 04:51:17', '2021-04-07 17:59:35');
INSERT INTO `docente` VALUES ('118', 'Tellez', 'Mora', 'Mauricio', 'jose', '1', '16087829', '1', 'M', '1999-02-10', 'Venezolano', 'Caracas', 'C2-12 El Silencio Capitolio', '5', '1', 'lyustiz@gmail.com', '+582124534920', '+582124534920', null, '1', '1', '2021-04-07 18:31:00', '2021-04-07 18:31:00');

-- ----------------------------
-- Table structure for docente_grupo
-- ----------------------------
DROP TABLE IF EXISTS `docente_grupo`;
CREATE TABLE `docente_grupo` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_docente` int(11) unsigned NOT NULL,
  `id_grupo` int(11) unsigned NOT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) unsigned NOT NULL,
  `id_usuario` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_docente_grupo_docente` (`id_docente`),
  KEY `fk_docente_grupo_grupo` (`id_grupo`),
  KEY `fk_docente_grupo_status` (`id_status`),
  KEY `fk_docente_grupo_usuario` (`id_usuario`),
  CONSTRAINT `fk_docente_grupo_docente` FOREIGN KEY (`id_docente`) REFERENCES `docente` (`id`),
  CONSTRAINT `fk_docente_grupo_grupo` FOREIGN KEY (`id_grupo`) REFERENCES `grupo` (`id`),
  CONSTRAINT `fk_docente_grupo_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`),
  CONSTRAINT `fk_docente_grupo_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of docente_grupo
-- ----------------------------

-- ----------------------------
-- Table structure for docente_materia
-- ----------------------------
DROP TABLE IF EXISTS `docente_materia`;
CREATE TABLE `docente_materia` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_docente` int(11) unsigned NOT NULL,
  `id_materia` int(11) unsigned NOT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) unsigned NOT NULL,
  `id_usuario` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_docente_materia_docente` (`id_docente`),
  KEY `fk_docente_materia_materia` (`id_materia`),
  KEY `fk_docente_materia_status` (`id_status`),
  KEY `fk_docente_materia_usuario` (`id_usuario`),
  CONSTRAINT `fk_docente_materia_docente` FOREIGN KEY (`id_docente`) REFERENCES `docente` (`id`),
  CONSTRAINT `fk_docente_materia_materia` FOREIGN KEY (`id_materia`) REFERENCES `materia` (`id`),
  CONSTRAINT `fk_docente_materia_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`),
  CONSTRAINT `fk_docente_materia_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of docente_materia
-- ----------------------------
INSERT INTO `docente_materia` VALUES ('1', '1', '1', null, '1', '1', '2021-03-12 02:03:51', '2021-03-12 02:03:51');
INSERT INTO `docente_materia` VALUES ('5', '1', '2', null, '1', '1', '2021-03-12 12:23:19', '2021-03-12 12:23:19');
INSERT INTO `docente_materia` VALUES ('6', '1', '3', null, '1', '1', '2021-03-12 12:23:38', '2021-03-12 12:23:38');
INSERT INTO `docente_materia` VALUES ('7', '1', '5', null, '1', '1', '2021-03-12 12:23:49', '2021-03-12 12:23:49');
INSERT INTO `docente_materia` VALUES ('10', '1', '4', null, '1', '1', '2021-03-12 12:29:10', '2021-03-12 12:29:10');

-- ----------------------------
-- Table structure for documento
-- ----------------------------
DROP TABLE IF EXISTS `documento`;
CREATE TABLE `documento` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_tipo_documento` int(11) unsigned NOT NULL,
  `nb_documento` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_archivo` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) unsigned NOT NULL,
  `id_usuario` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_documento_tipo_documento` (`id_tipo_documento`),
  KEY `fk_documento_status` (`id_status`),
  KEY `fk_documento_usuario` (`id_usuario`),
  CONSTRAINT `fk_documento_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`),
  CONSTRAINT `fk_documento_tipo_documento` FOREIGN KEY (`id_tipo_documento`) REFERENCES `tipo_documento` (`id`),
  CONSTRAINT `fk_documento_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
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
  `id_tipo_documento` int(11) unsigned NOT NULL,
  `tx_documento` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_estado_civil` int(11) unsigned NOT NULL,
  `tx_sexo` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fe_nacimiento` date NOT NULL,
  `tx_lugar_nacimiento` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_direccion` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_departamento` int(11) unsigned NOT NULL,
  `id_ciudad` int(11) unsigned NOT NULL,
  `tx_email` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_telefono` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_telefono_movil` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_cargo` int(11) unsigned NOT NULL,
  `bo_profesor` tinyint(1) DEFAULT 0,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) unsigned NOT NULL,
  `id_usuario` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_empleado_tipo_documento` (`id_tipo_documento`),
  KEY `fk_empleado_estado_civil` (`id_estado_civil`),
  KEY `fk_empleado_departamento` (`id_departamento`),
  KEY `fk_empleado_ciudad` (`id_ciudad`),
  KEY `fk_empleado_cargo` (`id_cargo`),
  KEY `fk_empleado_status` (`id_status`),
  KEY `fk_empleado_usuario` (`id_usuario`),
  CONSTRAINT `fk_empleado_cargo` FOREIGN KEY (`id_cargo`) REFERENCES `cargo` (`id`),
  CONSTRAINT `fk_empleado_ciudad` FOREIGN KEY (`id_ciudad`) REFERENCES `ciudad` (`id`),
  CONSTRAINT `fk_empleado_departamento` FOREIGN KEY (`id_departamento`) REFERENCES `departamento` (`id`),
  CONSTRAINT `fk_empleado_estado_civil` FOREIGN KEY (`id_estado_civil`) REFERENCES `estado_civil` (`id`),
  CONSTRAINT `fk_empleado_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`),
  CONSTRAINT `fk_empleado_tipo_documento` FOREIGN KEY (`id_tipo_documento`) REFERENCES `tipo_documento` (`id`),
  CONSTRAINT `fk_empleado_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of empleado
-- ----------------------------
INSERT INTO `empleado` VALUES ('1', 'Medina', 'Romero', 'Juan', 'Carlos', '1', '4534535345', '1', 'M', '1972-02-09', 'Cali', 'Calle 46 con 42', '76', '76', 'lyustiz@gmail.com', '02340009988', '02340009988', '3', '1', null, '1', '1', '2020-05-14 00:05:09', '2020-05-16 01:50:26');

-- ----------------------------
-- Table structure for enlace
-- ----------------------------
DROP TABLE IF EXISTS `enlace`;
CREATE TABLE `enlace` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_enlace` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `id_tipo_enlace` int(11) unsigned NOT NULL,
  `id_tema` int(11) unsigned NOT NULL,
  `tx_descripcion` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `tx_url` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) unsigned NOT NULL,
  `id_usuario` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_enlace_tipo_enlace` (`id_tipo_enlace`),
  KEY `fk_enlace_tema` (`id_tema`),
  KEY `fk_enlace_status` (`id_status`),
  KEY `fk_enlace_usuario` (`id_usuario`),
  CONSTRAINT `fk_enlace_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`),
  CONSTRAINT `fk_enlace_tema` FOREIGN KEY (`id_tema`) REFERENCES `tema` (`id`),
  CONSTRAINT `fk_enlace_tipo_enlace` FOREIGN KEY (`id_tipo_enlace`) REFERENCES `tipo_enlace` (`id`),
  CONSTRAINT `fk_enlace_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of enlace
-- ----------------------------

-- ----------------------------
-- Table structure for estado_civil
-- ----------------------------
DROP TABLE IF EXISTS `estado_civil`;
CREATE TABLE `estado_civil` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_estado_civil` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) unsigned NOT NULL,
  `id_usuario` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_estado_civil_status` (`id_status`),
  KEY `fk_estado_civil_usuario` (`id_usuario`),
  CONSTRAINT `fk_estado_civil_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`),
  CONSTRAINT `fk_estado_civil_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
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
  `id_colegio` int(11) unsigned NOT NULL,
  `id_padre` int(11) unsigned NOT NULL,
  `tx_path` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) unsigned NOT NULL,
  `id_usuario` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_estructura_colegio` (`id_colegio`),
  KEY `fk_estructura_status` (`id_status`),
  KEY `fk_estructura_usuario` (`id_usuario`),
  CONSTRAINT `fk_estructura_colegio` FOREIGN KEY (`id_colegio`) REFERENCES `colegio` (`id`),
  CONSTRAINT `fk_estructura_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`),
  CONSTRAINT `fk_estructura_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of estructura
-- ----------------------------
INSERT INTO `estructura` VALUES ('1', 'Colegio', '1', '0', 'Colegio', null, '1', '1', '2020-05-13 05:10:58', '2020-05-13 05:10:58');

-- ----------------------------
-- Table structure for evaluacion
-- ----------------------------
DROP TABLE IF EXISTS `evaluacion`;
CREATE TABLE `evaluacion` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_plan_evaluacion` int(11) unsigned NOT NULL,
  `id_plan_detalle` int(11) unsigned NOT NULL,
  `id_tipo_evaluacion` int(11) unsigned NOT NULL,
  `tx_clase` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_origen` int(11) unsigned NOT NULL,
  `tx_origen` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `id_grupo` int(11) unsigned NOT NULL,
  `id_materia` int(11) unsigned NOT NULL,
  `id_tema` int(11) unsigned NOT NULL,
  `nu_peso` int(11) DEFAULT NULL,
  `fe_inicio` date NOT NULL,
  `fe_fin` date DEFAULT NULL,
  `hh_inicio` time NOT NULL,
  `hh_fin` time DEFAULT NULL,
  `nu_minutos` int(11) NOT NULL,
  `tx_observaciones` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `id_status` int(11) unsigned NOT NULL,
  `id_usuario` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_evaluacion_plan_evaluacion` (`id_plan_evaluacion`),
  KEY `fk_evaluacion_plan_detalle` (`id_plan_detalle`),
  KEY `fk_evaluacion_tipo_evaluacion` (`id_tipo_evaluacion`),
  KEY `fk_evaluacion_grupo` (`id_grupo`),
  KEY `fk_evaluacion_materia` (`id_materia`),
  KEY `fk_evaluacion_tema` (`id_tema`),
  KEY `fk_evaluacion_status` (`id_status`),
  KEY `fk_evaluacion_usuario` (`id_usuario`),
  CONSTRAINT `fk_evaluacion_grupo` FOREIGN KEY (`id_grupo`) REFERENCES `grupo` (`id`),
  CONSTRAINT `fk_evaluacion_materia` FOREIGN KEY (`id_materia`) REFERENCES `materia` (`id`),
  CONSTRAINT `fk_evaluacion_plan_detalle` FOREIGN KEY (`id_plan_detalle`) REFERENCES `plan_detalle` (`id`),
  CONSTRAINT `fk_evaluacion_plan_evaluacion` FOREIGN KEY (`id_plan_evaluacion`) REFERENCES `plan_evaluacion` (`id`),
  CONSTRAINT `fk_evaluacion_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`),
  CONSTRAINT `fk_evaluacion_tema` FOREIGN KEY (`id_tema`) REFERENCES `tema` (`id`),
  CONSTRAINT `fk_evaluacion_tipo_evaluacion` FOREIGN KEY (`id_tipo_evaluacion`) REFERENCES `tipo_evaluacion` (`id`),
  CONSTRAINT `fk_evaluacion_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of evaluacion
-- ----------------------------

-- ----------------------------
-- Table structure for evaluacion_alumno
-- ----------------------------
DROP TABLE IF EXISTS `evaluacion_alumno`;
CREATE TABLE `evaluacion_alumno` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_evaluacion` int(11) unsigned NOT NULL,
  `id_plan_evaluacion` int(11) unsigned NOT NULL,
  `id_alumno` int(11) unsigned NOT NULL,
  `fe_evaluacion` date DEFAULT NULL,
  `hh_inicio` time DEFAULT NULL,
  `hh_fin` time DEFAULT NULL,
  `nu_calificacion` decimal(4,2) DEFAULT NULL,
  `id_calificacion` int(11) unsigned DEFAULT NULL,
  `fe_acceso` date DEFAULT NULL,
  `nu_acceso` int(11) DEFAULT 0,
  `tx_observaciones` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) unsigned NOT NULL,
  `id_usuario` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_evaluacion_alumno_evaluacion` (`id_evaluacion`),
  KEY `fk_evaluacion_alumno_plan_evaluacion` (`id_plan_evaluacion`),
  KEY `fk_evaluacion_alumno_alumno` (`id_alumno`),
  KEY `fk_evaluacion_alumno_calificacion` (`id_calificacion`),
  KEY `fk_evaluacion_alumno_status` (`id_status`),
  KEY `fk_evaluacion_alumno_usuario` (`id_usuario`),
  CONSTRAINT `fk_evaluacion_alumno_alumno` FOREIGN KEY (`id_alumno`) REFERENCES `alumno` (`id`),
  CONSTRAINT `fk_evaluacion_alumno_calificacion` FOREIGN KEY (`id_calificacion`) REFERENCES `calificacion` (`id`),
  CONSTRAINT `fk_evaluacion_alumno_evaluacion` FOREIGN KEY (`id_evaluacion`) REFERENCES `evaluacion` (`id`),
  CONSTRAINT `fk_evaluacion_alumno_plan_evaluacion` FOREIGN KEY (`id_plan_evaluacion`) REFERENCES `plan_evaluacion` (`id`),
  CONSTRAINT `fk_evaluacion_alumno_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`),
  CONSTRAINT `fk_evaluacion_alumno_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of evaluacion_alumno
-- ----------------------------

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
  `id_status` int(11) unsigned NOT NULL,
  `id_usuario` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_evaluacion_metodo_status` (`id_status`),
  KEY `fk_evaluacion_metodo_usuario` (`id_usuario`),
  CONSTRAINT `fk_evaluacion_metodo_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`),
  CONSTRAINT `fk_evaluacion_metodo_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
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
  `id_tipo_feriado` int(11) unsigned NOT NULL,
  `fe_feriado` date NOT NULL,
  `aa_feriado` int(5) NOT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) unsigned NOT NULL,
  `id_usuario` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_feriado_tipo_feriado` (`id_tipo_feriado`),
  KEY `fk_feriado_status` (`id_status`),
  KEY `fk_feriado_usuario` (`id_usuario`),
  CONSTRAINT `fk_feriado_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`),
  CONSTRAINT `fk_feriado_tipo_feriado` FOREIGN KEY (`id_tipo_feriado`) REFERENCES `tipo_feriado` (`id`),
  CONSTRAINT `fk_feriado_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `id_tipo_foto` int(11) unsigned NOT NULL,
  `id_origen` int(11) unsigned NOT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) unsigned NOT NULL,
  `id_usuario` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_foto_tipo_foto` (`id_tipo_foto`),
  KEY `fk_foto_status` (`id_status`),
  KEY `fk_foto_usuario` (`id_usuario`),
  CONSTRAINT `fk_foto_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`),
  CONSTRAINT `fk_foto_tipo_foto` FOREIGN KEY (`id_tipo_foto`) REFERENCES `tipo_foto` (`id`),
  CONSTRAINT `fk_foto_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=211 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of foto
-- ----------------------------
INSERT INTO `foto` VALUES ('29', 'alumno id: 1', '1594261278_1.jpg', '2', '1', null, '1', '1', '2020-07-09 02:21:18', '2020-07-09 02:21:18');
INSERT INTO `foto` VALUES ('32', 'docente id: 1', '1594312119_1.jpg', '3', '1', null, '1', '1', '2020-07-09 16:28:39', '2020-07-09 16:28:39');
INSERT INTO `foto` VALUES ('60', 'alumno id: 1', '1594946193_1.jpg', '2', '1', null, '1', '1', '2020-07-17 00:36:33', '2020-07-17 00:36:33');
INSERT INTO `foto` VALUES ('71', 'pariente id: 1', '1595721572_1.jpg', '5', '1', null, '1', '1', '2020-07-25 23:59:32', '2020-07-25 23:59:32');
INSERT INTO `foto` VALUES ('136', 'cuenta id: 1', '1604884778_1.jpg', '4', '1', null, '1', '1', '2020-11-09 01:19:38', '2020-11-09 01:19:38');
INSERT INTO `foto` VALUES ('204', 'empleado id: 1', '1612299816_1.jpg', '8', '1', null, '1', '1', '2021-02-02 21:03:36', '2021-02-02 21:03:36');
INSERT INTO `foto` VALUES ('207', 'colegio id: 1', '1617729371_1.jpg', '1', '1', null, '1', '1', '2021-04-06 17:16:11', '2021-04-06 17:16:11');
INSERT INTO `foto` VALUES ('209', 'pregunta id: 1', '1617731807_1.jpg', '7', '1', null, '1', '1', '2021-04-06 17:56:47', '2021-04-06 17:56:47');
INSERT INTO `foto` VALUES ('210', 'docente id: 118', '1617820287_118.jpg', '3', '118', null, '1', '1', '2021-04-07 18:31:27', '2021-04-07 18:31:27');

-- ----------------------------
-- Table structure for grado
-- ----------------------------
DROP TABLE IF EXISTS `grado`;
CREATE TABLE `grado` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_grado` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nu_grado` int(11) NOT NULL,
  `id_nivel` int(11) unsigned NOT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) unsigned NOT NULL,
  `id_usuario` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_grado_nivel` (`id_nivel`),
  KEY `fk_grado_status` (`id_status`),
  KEY `fk_grado_usuario` (`id_usuario`),
  CONSTRAINT `fk_grado_nivel` FOREIGN KEY (`id_nivel`) REFERENCES `nivel` (`id`),
  CONSTRAINT `fk_grado_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`),
  CONSTRAINT `fk_grado_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of grado
-- ----------------------------
INSERT INTO `grado` VALUES ('1', 'Pre-jardin', '1', '1', null, '1', '1', '2020-05-11 18:43:48', '2020-05-16 07:50:07');
INSERT INTO `grado` VALUES ('2', 'Jardin', '2', '1', null, '1', '1', '2020-05-11 18:44:18', '2020-05-16 07:50:14');
INSERT INTO `grado` VALUES ('3', 'Transicion', '3', '1', null, '1', '1', '2020-05-11 18:58:15', '2020-05-16 07:50:22');
INSERT INTO `grado` VALUES ('4', 'Grado 1º', '1', '2', 'G1', '1', '1', '2020-05-11 19:01:49', '2020-05-16 07:48:35');
INSERT INTO `grado` VALUES ('5', 'Grado 2º', '2', '2', 'G2', '1', '1', '2020-05-11 19:03:26', '2020-05-16 07:48:42');
INSERT INTO `grado` VALUES ('6', 'Grado 3º', '3', '2', 'G3', '1', '1', '2020-05-11 19:03:50', '2020-05-16 07:48:49');
INSERT INTO `grado` VALUES ('7', 'Grado 4º', '4', '2', 'G4', '1', '1', '2020-05-11 19:06:38', '2020-05-16 07:48:55');
INSERT INTO `grado` VALUES ('8', 'Grado 5º', '5', '2', 'G5', '1', '1', '2020-05-11 19:47:09', '2020-05-16 07:49:03');
INSERT INTO `grado` VALUES ('9', 'Grado 6º', '6', '3', 'G6', '1', '1', '2020-05-11 19:47:43', '2020-05-16 07:49:18');
INSERT INTO `grado` VALUES ('10', 'Grado 7º', '7', '3', 'G7', '1', '1', '2020-05-11 19:48:23', '2020-05-16 07:49:25');
INSERT INTO `grado` VALUES ('11', 'Grado 8º', '8', '3', 'G8', '1', '1', '2020-05-11 19:48:44', '2020-05-16 07:49:36');
INSERT INTO `grado` VALUES ('12', 'Grado 9º', '9', '3', 'G9', '1', '1', '2020-05-11 19:49:05', '2020-11-10 15:57:11');
INSERT INTO `grado` VALUES ('13', 'Grado 10', '10', '3', 'G10', '1', '1', '2020-05-11 19:49:24', '2020-05-16 07:49:50');
INSERT INTO `grado` VALUES ('14', 'Grado 11º', '11', '3', 'G11', '1', '1', '2020-05-11 19:49:52', '2020-05-16 07:49:57');

-- ----------------------------
-- Table structure for grado_materia
-- ----------------------------
DROP TABLE IF EXISTS `grado_materia`;
CREATE TABLE `grado_materia` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_grado` int(11) unsigned NOT NULL,
  `id_materia` int(11) unsigned NOT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) unsigned NOT NULL,
  `id_usuario` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_grado_materia_grado` (`id_grado`),
  KEY `fk_grado_materia_materia` (`id_materia`),
  KEY `fk_grado_materia_status` (`id_status`),
  KEY `fk_grado_materia_usuario` (`id_usuario`),
  CONSTRAINT `fk_grado_materia_grado` FOREIGN KEY (`id_grado`) REFERENCES `grado` (`id`),
  CONSTRAINT `fk_grado_materia_materia` FOREIGN KEY (`id_materia`) REFERENCES `materia` (`id`),
  CONSTRAINT `fk_grado_materia_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`),
  CONSTRAINT `fk_grado_materia_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of grado_materia
-- ----------------------------
INSERT INTO `grado_materia` VALUES ('1', '6', '1', null, '1', '1', '2021-03-12 01:53:00', '2021-03-12 01:53:00');
INSERT INTO `grado_materia` VALUES ('2', '7', '1', null, '1', '1', '2021-03-12 01:53:07', '2021-03-12 01:53:07');
INSERT INTO `grado_materia` VALUES ('3', '8', '1', null, '1', '1', '2021-03-12 01:53:09', '2021-03-12 01:53:09');
INSERT INTO `grado_materia` VALUES ('5', '9', '1', '', '1', '1', '2021-03-12 01:53:00', '2021-03-12 01:53:00');
INSERT INTO `grado_materia` VALUES ('6', '10', '1', '', '1', '1', '2021-03-12 01:53:07', '2021-03-12 01:53:07');
INSERT INTO `grado_materia` VALUES ('7', '11', '1', '', '1', '1', '2021-03-12 01:53:09', '2021-03-12 01:53:09');
INSERT INTO `grado_materia` VALUES ('8', '12', '1', '', '1', '1', '2021-03-12 01:53:00', '2021-03-12 01:53:00');
INSERT INTO `grado_materia` VALUES ('9', '13', '1', '', '1', '1', '2021-03-12 01:53:07', '2021-03-12 01:53:07');
INSERT INTO `grado_materia` VALUES ('10', '14', '1', '', '1', '1', '2021-03-12 01:53:09', '2021-03-12 01:53:09');
INSERT INTO `grado_materia` VALUES ('11', '6', '2', '', '1', '1', '2021-03-12 01:53:00', '2021-03-12 01:53:00');
INSERT INTO `grado_materia` VALUES ('12', '7', '2', '', '1', '1', '2021-03-12 01:53:07', '2021-03-12 01:53:07');
INSERT INTO `grado_materia` VALUES ('13', '8', '2', '', '1', '1', '2021-03-12 01:53:09', '2021-03-12 01:53:09');
INSERT INTO `grado_materia` VALUES ('14', '9', '2', '', '1', '1', '2021-03-12 01:53:00', '2021-03-12 01:53:00');
INSERT INTO `grado_materia` VALUES ('15', '10', '2', '', '1', '1', '2021-03-12 01:53:07', '2021-03-12 01:53:07');
INSERT INTO `grado_materia` VALUES ('16', '11', '2', '', '1', '1', '2021-03-12 01:53:09', '2021-03-12 01:53:09');
INSERT INTO `grado_materia` VALUES ('17', '12', '2', '', '1', '1', '2021-03-12 01:53:00', '2021-03-12 01:53:00');
INSERT INTO `grado_materia` VALUES ('18', '13', '2', '', '1', '1', '2021-03-12 01:53:07', '2021-03-12 01:53:07');
INSERT INTO `grado_materia` VALUES ('19', '14', '2', '', '1', '1', '2021-03-12 01:53:09', '2021-03-12 01:53:09');
INSERT INTO `grado_materia` VALUES ('20', '6', '3', '', '1', '1', '2021-03-12 01:53:00', '2021-03-12 01:53:00');
INSERT INTO `grado_materia` VALUES ('21', '7', '3', '', '1', '1', '2021-03-12 01:53:07', '2021-03-12 01:53:07');
INSERT INTO `grado_materia` VALUES ('22', '8', '3', '', '1', '1', '2021-03-12 01:53:00', '2021-03-12 01:53:00');
INSERT INTO `grado_materia` VALUES ('23', '9', '3', '', '1', '1', '2021-03-12 01:53:09', '2021-03-12 01:53:09');
INSERT INTO `grado_materia` VALUES ('24', '10', '3', '', '1', '1', '2021-03-12 01:53:07', '2021-03-12 01:53:07');
INSERT INTO `grado_materia` VALUES ('25', '11', '3', '', '1', '1', '2021-03-12 01:53:09', '2021-03-12 01:53:09');
INSERT INTO `grado_materia` VALUES ('26', '12', '3', '', '1', '1', '2021-03-12 01:53:07', '2021-03-12 01:53:07');
INSERT INTO `grado_materia` VALUES ('27', '13', '3', '', '1', '1', '2021-03-12 01:53:09', '2021-03-12 01:53:09');
INSERT INTO `grado_materia` VALUES ('28', '14', '3', '', '1', '1', '2021-03-12 01:53:00', '2021-03-12 01:53:00');
INSERT INTO `grado_materia` VALUES ('29', '6', '4', '', '1', '1', '2021-03-12 01:53:07', '2021-03-12 01:53:07');
INSERT INTO `grado_materia` VALUES ('30', '7', '4', '', '1', '1', '2021-03-12 01:53:09', '2021-03-12 01:53:09');
INSERT INTO `grado_materia` VALUES ('31', '8', '4', '', '1', '1', '2021-03-12 01:53:00', '2021-03-12 01:53:00');
INSERT INTO `grado_materia` VALUES ('32', '9', '4', '', '1', '1', '2021-03-12 01:53:07', '2021-03-12 01:53:07');
INSERT INTO `grado_materia` VALUES ('33', '10', '4', '', '1', '1', '2021-03-12 01:53:00', '2021-03-12 01:53:00');
INSERT INTO `grado_materia` VALUES ('34', '11', '4', '', '1', '1', '2021-03-12 01:53:09', '2021-03-12 01:53:09');
INSERT INTO `grado_materia` VALUES ('35', '12', '4', '', '1', '1', '2021-03-12 01:53:07', '2021-03-12 01:53:07');
INSERT INTO `grado_materia` VALUES ('36', '13', '4', '', '1', '1', '2021-03-12 01:53:09', '2021-03-12 01:53:09');

-- ----------------------------
-- Table structure for grupo
-- ----------------------------
DROP TABLE IF EXISTS `grupo`;
CREATE TABLE `grupo` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_grupo` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `id_grado` int(11) unsigned NOT NULL,
  `id_turno` int(11) unsigned NOT NULL,
  `id_calendario` int(11) unsigned NOT NULL,
  `id_docente` int(11) unsigned NOT NULL,
  `nu_orden` int(11) NOT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) unsigned NOT NULL,
  `id_usuario` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_grupo_grado` (`id_grado`),
  KEY `fk_grupo_turno` (`id_turno`),
  KEY `fk_grupo_calendario` (`id_calendario`),
  KEY `fk_grupo_docente` (`id_docente`),
  KEY `fk_grupo_status` (`id_status`),
  KEY `fk_grupo_usuario` (`id_usuario`),
  CONSTRAINT `fk_grupo_calendario` FOREIGN KEY (`id_calendario`) REFERENCES `calendario` (`id`),
  CONSTRAINT `fk_grupo_docente` FOREIGN KEY (`id_docente`) REFERENCES `docente` (`id`),
  CONSTRAINT `fk_grupo_grado` FOREIGN KEY (`id_grado`) REFERENCES `grado` (`id`),
  CONSTRAINT `fk_grupo_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`),
  CONSTRAINT `fk_grupo_turno` FOREIGN KEY (`id_turno`) REFERENCES `turno` (`id`),
  CONSTRAINT `fk_grupo_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of grupo
-- ----------------------------
INSERT INTO `grupo` VALUES ('1', 'Simon Bolivar 3°', '6', '1', '1', '1', '1', '', '1', '1', '2021-04-07 01:51:46', '2021-04-07 01:51:46');
INSERT INTO `grupo` VALUES ('2', 'Simon Bolivar 4°', '7', '1', '1', '1', '2', '', '1', '1', '2021-04-07 01:51:46', '2021-04-07 01:51:46');
INSERT INTO `grupo` VALUES ('3', 'Simon Bolivar 5°', '8', '1', '1', '1', '3', '', '1', '1', '2021-04-07 01:51:46', '2021-04-07 01:51:46');
INSERT INTO `grupo` VALUES ('4', 'Simon Bolivar 6°', '9', '1', '1', '1', '4', '', '1', '1', '2021-04-07 01:51:46', '2021-04-07 01:51:46');
INSERT INTO `grupo` VALUES ('5', 'Simon Bolivar 7°', '10', '1', '1', '1', '5', '', '1', '1', '2021-04-07 01:51:46', '2021-04-07 01:51:46');
INSERT INTO `grupo` VALUES ('6', 'Simon Bolivar 8°', '11', '1', '1', '1', '6', '', '1', '1', '2021-04-07 01:51:46', '2021-04-07 01:51:46');
INSERT INTO `grupo` VALUES ('7', 'Simon Bolivar 9°', '12', '1', '1', '1', '7', '', '1', '1', '2021-04-07 01:51:46', '2021-04-07 01:51:46');
INSERT INTO `grupo` VALUES ('8', 'Simon Bolivar 10°', '13', '1', '1', '1', '8', '', '1', '1', '2021-04-07 01:51:46', '2021-04-07 01:51:46');
INSERT INTO `grupo` VALUES ('9', 'Simon Bolivar 11°', '14', '1', '1', '1', '9', '', '1', '1', '2021-04-07 01:51:46', '2021-04-07 01:51:46');
INSERT INTO `grupo` VALUES ('10', 'IET en Turismo 12 de Octubre  3°', '6', '1', '1', '1', '1', null, '1', '1', '2021-04-07 01:51:46', '2021-04-07 23:28:29');
INSERT INTO `grupo` VALUES ('11', 'IET en Turismo 12 de Octubre  4°', '7', '1', '1', '1', '2', '', '1', '1', '2021-04-07 01:51:46', '2021-04-07 01:51:46');
INSERT INTO `grupo` VALUES ('12', 'IET en Turismo 12 de Octubre  5°', '8', '1', '1', '1', '3', '', '1', '1', '2021-04-07 01:51:46', '2021-04-07 01:51:46');
INSERT INTO `grupo` VALUES ('13', 'IET en Turismo 12 de Octubre  6°', '9', '1', '1', '1', '4', '', '1', '1', '2021-04-07 01:51:46', '2021-04-07 01:51:46');
INSERT INTO `grupo` VALUES ('14', 'IET en Turismo 12 de Octubre  7°', '10', '1', '1', '1', '5', '', '1', '1', '2021-04-07 01:51:46', '2021-04-07 01:51:46');
INSERT INTO `grupo` VALUES ('15', 'IET en Turismo 12 de Octubre  8°', '11', '1', '1', '1', '6', '', '1', '1', '2021-04-07 01:51:46', '2021-04-07 01:51:46');
INSERT INTO `grupo` VALUES ('16', 'IET en Turismo 12 de Octubre  9°', '12', '1', '1', '1', '7', '', '1', '1', '2021-04-07 01:51:46', '2021-04-07 01:51:46');
INSERT INTO `grupo` VALUES ('17', 'IET en Turismo 12 de Octubre  10°', '13', '1', '1', '1', '8', '', '1', '1', '2021-04-07 01:51:46', '2021-04-07 01:51:46');
INSERT INTO `grupo` VALUES ('18', 'IET en Turismo 12 de Octubre  11°', '14', '1', '1', '1', '9', '', '1', '1', '2021-04-07 01:51:46', '2021-04-07 01:51:46');
INSERT INTO `grupo` VALUES ('19', 'Gabriel García Márquez de A. 3°', '6', '1', '1', '1', '1', '', '1', '1', '2021-04-07 01:51:46', '2021-04-07 01:51:46');
INSERT INTO `grupo` VALUES ('20', 'Gabriel García Márquez de A. 4°', '7', '1', '1', '1', '2', '', '1', '1', '2021-04-07 01:51:46', '2021-04-07 01:51:46');
INSERT INTO `grupo` VALUES ('21', 'Gabriel García Márquez de A. 5°', '8', '1', '1', '1', '3', '', '1', '1', '2021-04-07 01:51:46', '2021-04-07 01:51:46');
INSERT INTO `grupo` VALUES ('22', 'Gabriel García Márquez de A. 6°', '9', '1', '1', '1', '4', '', '1', '1', '2021-04-07 01:51:46', '2021-04-07 01:51:46');
INSERT INTO `grupo` VALUES ('23', 'Gabriel García Márquez de A. 7°', '10', '1', '1', '1', '5', '', '1', '1', '2021-04-07 01:51:46', '2021-04-07 01:51:46');
INSERT INTO `grupo` VALUES ('24', 'Gabriel García Márquez de A. 8°', '11', '1', '1', '1', '6', '', '1', '1', '2021-04-07 01:51:46', '2021-04-07 01:51:46');
INSERT INTO `grupo` VALUES ('25', 'Gabriel García Márquez de A. 9°', '12', '1', '1', '1', '7', '', '1', '1', '2021-04-07 01:51:46', '2021-04-07 01:51:46');
INSERT INTO `grupo` VALUES ('26', 'Gabriel García Márquez de A. 10°', '13', '1', '1', '1', '8', '', '1', '1', '2021-04-07 01:51:46', '2021-04-07 01:51:46');
INSERT INTO `grupo` VALUES ('27', 'Gabriel García Márquez de A. 11°', '14', '1', '1', '1', '9', '', '1', '1', '2021-04-07 01:51:46', '2021-04-07 01:51:46');
INSERT INTO `grupo` VALUES ('28', 'IED El Mamey 3°', '6', '1', '1', '1', '1', null, '1', '1', '2021-04-07 01:51:46', '2021-04-07 23:27:35');
INSERT INTO `grupo` VALUES ('29', 'IED El Mamey 4°', '7', '1', '1', '1', '2', '', '1', '1', '2021-04-07 01:51:46', '2021-04-07 01:51:46');
INSERT INTO `grupo` VALUES ('30', 'IED El Mamey 5°', '8', '1', '1', '1', '3', '', '1', '1', '2021-04-07 01:51:46', '2021-04-07 01:51:46');
INSERT INTO `grupo` VALUES ('31', 'IED El Mamey 6°', '9', '1', '1', '1', '4', '', '1', '1', '2021-04-07 01:51:46', '2021-04-07 01:51:46');
INSERT INTO `grupo` VALUES ('32', 'IED El Mamey 7°', '10', '1', '1', '1', '5', '', '1', '1', '2021-04-07 01:51:46', '2021-04-07 01:51:46');
INSERT INTO `grupo` VALUES ('33', 'IED El Mamey 8°', '11', '1', '1', '1', '6', '', '1', '1', '2021-04-07 01:51:46', '2021-04-07 01:51:46');
INSERT INTO `grupo` VALUES ('34', 'IED El Mamey 9°', '12', '1', '1', '1', '7', '', '1', '1', '2021-04-07 01:51:46', '2021-04-07 01:51:46');
INSERT INTO `grupo` VALUES ('35', 'IED El Mamey 10°', '13', '1', '1', '1', '8', '', '1', '1', '2021-04-07 01:51:46', '2021-04-07 01:51:46');
INSERT INTO `grupo` VALUES ('36', 'IED El Mamey 11°', '14', '1', '1', '1', '9', '', '1', '1', '2021-04-07 01:51:46', '2021-04-07 01:51:46');
INSERT INTO `grupo` VALUES ('37', 'María Alfaro de Ospino 3°', '6', '1', '1', '1', '1', '', '1', '1', '2021-04-07 01:51:46', '2021-04-07 01:51:46');
INSERT INTO `grupo` VALUES ('38', 'María Alfaro de Ospino 4°', '7', '1', '1', '1', '2', '', '1', '1', '2021-04-07 01:51:46', '2021-04-07 01:51:46');
INSERT INTO `grupo` VALUES ('39', 'María Alfaro de Ospino 5°', '8', '1', '1', '1', '3', '', '1', '1', '2021-04-07 01:51:46', '2021-04-07 01:51:46');
INSERT INTO `grupo` VALUES ('40', 'María Alfaro de Ospino 6°', '9', '1', '1', '1', '4', '', '1', '1', '2021-04-07 01:51:46', '2021-04-07 01:51:46');
INSERT INTO `grupo` VALUES ('41', 'María Alfaro de Ospino 7°', '10', '1', '1', '1', '5', '', '1', '1', '2021-04-07 01:51:46', '2021-04-07 01:51:46');
INSERT INTO `grupo` VALUES ('42', 'María Alfaro de Ospino 8°', '11', '1', '1', '1', '6', '', '1', '1', '2021-04-07 01:51:46', '2021-04-07 01:51:46');
INSERT INTO `grupo` VALUES ('43', 'María Alfaro de Ospino 9°', '12', '1', '1', '1', '7', '', '1', '1', '2021-04-07 01:51:46', '2021-04-07 01:51:46');
INSERT INTO `grupo` VALUES ('44', 'María Alfaro de Ospino 10°', '13', '1', '1', '1', '8', '', '1', '1', '2021-04-07 01:51:46', '2021-04-07 01:51:46');
INSERT INTO `grupo` VALUES ('45', 'María Alfaro de Ospino 11°', '14', '1', '1', '1', '9', '', '1', '1', '2021-04-07 01:51:46', '2021-04-07 01:51:46');
INSERT INTO `grupo` VALUES ('46', 'IED Laura Vicuña 3°', '6', '1', '1', '1', '1', '', '1', '1', '2021-04-07 01:51:46', '2021-04-07 01:51:46');
INSERT INTO `grupo` VALUES ('47', 'IED Laura Vicuña 4°', '7', '1', '1', '1', '2', '', '1', '1', '2021-04-07 01:51:46', '2021-04-07 01:51:46');
INSERT INTO `grupo` VALUES ('48', 'IED Laura Vicuña 5°', '8', '1', '1', '1', '3', '', '1', '1', '2021-04-07 01:51:46', '2021-04-07 01:51:46');
INSERT INTO `grupo` VALUES ('49', 'IED Laura Vicuña 6°', '9', '1', '1', '1', '4', '', '1', '1', '2021-04-07 01:51:46', '2021-04-07 01:51:46');
INSERT INTO `grupo` VALUES ('50', 'IED Laura Vicuña 7°', '10', '1', '1', '1', '5', '', '1', '1', '2021-04-07 01:51:46', '2021-04-07 01:51:46');
INSERT INTO `grupo` VALUES ('51', 'IED Laura Vicuña 8°', '11', '1', '1', '1', '6', '', '1', '1', '2021-04-07 01:51:46', '2021-04-07 01:51:46');
INSERT INTO `grupo` VALUES ('52', 'IED Laura Vicuña 9°', '12', '1', '1', '1', '7', '', '1', '1', '2021-04-07 01:51:46', '2021-04-07 01:51:46');
INSERT INTO `grupo` VALUES ('53', 'IED Laura Vicuña 10°', '13', '1', '1', '1', '8', '', '1', '1', '2021-04-07 01:51:46', '2021-04-07 01:51:46');
INSERT INTO `grupo` VALUES ('54', 'IED Laura Vicuña 11°', '14', '1', '1', '1', '9', '', '1', '1', '2021-04-07 01:51:46', '2021-04-07 01:51:46');

-- ----------------------------
-- Table structure for grupo_calificacion
-- ----------------------------
DROP TABLE IF EXISTS `grupo_calificacion`;
CREATE TABLE `grupo_calificacion` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_grupo_calificacion` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) unsigned NOT NULL,
  `id_usuario` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_grupo_calificacion_status` (`id_status`),
  KEY `fk_grupo_calificacion_usuario` (`id_usuario`),
  CONSTRAINT `fk_grupo_calificacion_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`),
  CONSTRAINT `fk_grupo_calificacion_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of grupo_calificacion
-- ----------------------------
INSERT INTO `grupo_calificacion` VALUES ('1', 'General', 'Calificaciones Generales', '1', '1', '2020-05-12 06:42:30', '2020-05-12 06:52:29');

-- ----------------------------
-- Table structure for grupo_materia
-- ----------------------------
DROP TABLE IF EXISTS `grupo_materia`;
CREATE TABLE `grupo_materia` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_grupo` int(11) unsigned NOT NULL,
  `id_materia` int(11) unsigned NOT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) unsigned NOT NULL,
  `id_usuario` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_grupo_materia_grupo` (`id_grupo`),
  KEY `fk_grupo_materia_materia` (`id_materia`),
  KEY `fk_grupo_materia_status` (`id_status`),
  KEY `fk_grupo_materia_usuario` (`id_usuario`),
  CONSTRAINT `fk_grupo_materia_grupo` FOREIGN KEY (`id_grupo`) REFERENCES `grupo` (`id`),
  CONSTRAINT `fk_grupo_materia_materia` FOREIGN KEY (`id_materia`) REFERENCES `materia` (`id`),
  CONSTRAINT `fk_grupo_materia_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`),
  CONSTRAINT `fk_grupo_materia_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=325 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of grupo_materia
-- ----------------------------
INSERT INTO `grupo_materia` VALUES ('1', '1', '1', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('2', '2', '1', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('3', '3', '1', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('4', '4', '1', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('5', '5', '1', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('6', '6', '1', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('7', '7', '1', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('8', '8', '1', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('9', '9', '1', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('10', '10', '1', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('11', '11', '1', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('12', '12', '1', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('13', '13', '1', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('14', '14', '1', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('15', '15', '1', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('16', '16', '1', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('17', '17', '1', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('18', '18', '1', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('19', '19', '1', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('20', '20', '1', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('21', '21', '1', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('22', '22', '1', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('23', '23', '1', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('24', '24', '1', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('25', '25', '1', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('26', '26', '1', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('27', '27', '1', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('28', '28', '1', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('29', '29', '1', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('30', '30', '1', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('31', '31', '1', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('32', '32', '1', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('33', '33', '1', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('34', '34', '1', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('35', '35', '1', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('36', '36', '1', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('37', '37', '1', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('38', '38', '1', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('39', '39', '1', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('40', '40', '1', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('41', '41', '1', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('42', '42', '1', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('43', '43', '1', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('44', '44', '1', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('45', '45', '1', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('46', '46', '1', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('47', '47', '1', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('48', '48', '1', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('49', '49', '1', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('50', '50', '1', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('51', '51', '1', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('52', '52', '1', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('53', '53', '1', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('54', '54', '1', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('55', '1', '2', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('56', '2', '2', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('57', '3', '2', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('58', '4', '2', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('59', '5', '2', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('60', '6', '2', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('61', '7', '2', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('62', '8', '2', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('63', '9', '2', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('64', '10', '2', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('65', '11', '2', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('66', '12', '2', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('67', '13', '2', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('68', '14', '2', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('69', '15', '2', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('70', '16', '2', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('71', '17', '2', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('72', '18', '2', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('73', '19', '2', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('74', '20', '2', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('75', '21', '2', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('76', '22', '2', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('77', '23', '2', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('78', '24', '2', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('79', '25', '2', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('80', '26', '2', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('81', '27', '2', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('82', '28', '2', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('83', '29', '2', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('84', '30', '2', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('85', '31', '2', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('86', '32', '2', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('87', '33', '2', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('88', '34', '2', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('89', '35', '2', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('90', '36', '2', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('91', '37', '2', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('92', '38', '2', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('93', '39', '2', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('94', '40', '2', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('95', '41', '2', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('96', '42', '2', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('97', '43', '2', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('98', '44', '2', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('99', '45', '2', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('100', '46', '2', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('101', '47', '2', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('102', '48', '2', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('103', '49', '2', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('104', '50', '2', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('105', '51', '2', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('106', '52', '2', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('107', '53', '2', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('108', '54', '2', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('109', '1', '3', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('110', '2', '3', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('111', '3', '3', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('112', '4', '3', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('113', '5', '3', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('114', '6', '3', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('115', '7', '3', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('116', '8', '3', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('117', '9', '3', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('118', '10', '3', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('119', '11', '3', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('120', '12', '3', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('121', '13', '3', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('122', '14', '3', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('123', '15', '3', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('124', '16', '3', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('125', '17', '3', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('126', '18', '3', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('127', '19', '3', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('128', '20', '3', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('129', '21', '3', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('130', '22', '3', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('131', '23', '3', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('132', '24', '3', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('133', '25', '3', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('134', '26', '3', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('135', '27', '3', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('136', '28', '3', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('137', '29', '3', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('138', '30', '3', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('139', '31', '3', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('140', '32', '3', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('141', '33', '3', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('142', '34', '3', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('143', '35', '3', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('144', '36', '3', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('145', '37', '3', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('146', '38', '3', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('147', '39', '3', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('148', '40', '3', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('149', '41', '3', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('150', '42', '3', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('151', '43', '3', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('152', '44', '3', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('153', '45', '3', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('154', '46', '3', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('155', '47', '3', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('156', '48', '3', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('157', '49', '3', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('158', '50', '3', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('159', '51', '3', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('160', '52', '3', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('161', '53', '3', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('162', '54', '3', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('163', '1', '4', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('164', '2', '4', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('165', '3', '4', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('166', '4', '4', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('167', '5', '4', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('168', '6', '4', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('169', '7', '4', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('170', '8', '4', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('171', '9', '4', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('172', '10', '4', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('173', '11', '4', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('174', '12', '4', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('175', '13', '4', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('176', '14', '4', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('177', '15', '4', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('178', '16', '4', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('179', '17', '4', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('180', '18', '4', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('181', '19', '4', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('182', '20', '4', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('183', '21', '4', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('184', '22', '4', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('185', '23', '4', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('186', '24', '4', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('187', '25', '4', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('188', '26', '4', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('189', '27', '4', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('190', '28', '4', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('191', '29', '4', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('192', '30', '4', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('193', '31', '4', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('194', '32', '4', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('195', '33', '4', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('196', '34', '4', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('197', '35', '4', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('198', '36', '4', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('199', '37', '4', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('200', '38', '4', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('201', '39', '4', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('202', '40', '4', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('203', '41', '4', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('204', '42', '4', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('205', '43', '4', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('206', '44', '4', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('207', '45', '4', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('208', '46', '4', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('209', '47', '4', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('210', '48', '4', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('211', '49', '4', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('212', '50', '4', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('213', '51', '4', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('214', '52', '4', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('215', '53', '4', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('216', '54', '4', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('271', '1', '5', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('272', '2', '5', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('273', '3', '5', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('274', '4', '5', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('275', '5', '5', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('276', '6', '5', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('277', '7', '5', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('278', '8', '5', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('279', '9', '5', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('280', '10', '5', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('281', '11', '5', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('282', '12', '5', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('283', '13', '5', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('284', '14', '5', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('285', '15', '5', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('286', '16', '5', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('287', '17', '5', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('288', '18', '5', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('289', '19', '5', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('290', '20', '5', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('291', '21', '5', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('292', '22', '5', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('293', '23', '5', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('294', '24', '5', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('295', '25', '5', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('296', '26', '5', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('297', '27', '5', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('298', '28', '5', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('299', '29', '5', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('300', '30', '5', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('301', '31', '5', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('302', '32', '5', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('303', '33', '5', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('304', '34', '5', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('305', '35', '5', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('306', '36', '5', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('307', '37', '5', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('308', '38', '5', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('309', '39', '5', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('310', '40', '5', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('311', '41', '5', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('312', '42', '5', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('313', '43', '5', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('314', '44', '5', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('315', '45', '5', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('316', '46', '5', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('317', '47', '5', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('318', '48', '5', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('319', '49', '5', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('320', '50', '5', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('321', '51', '5', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('322', '52', '5', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('323', '53', '5', '', '1', '1', '2021-04-07 19:42:11', null);
INSERT INTO `grupo_materia` VALUES ('324', '54', '5', '', '1', '1', '2021-04-07 19:42:11', null);

-- ----------------------------
-- Table structure for horario
-- ----------------------------
DROP TABLE IF EXISTS `horario`;
CREATE TABLE `horario` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_horario` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_grupo` int(11) unsigned NOT NULL,
  `id_hora_academica` int(11) unsigned NOT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) unsigned NOT NULL,
  `id_usuario` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_horario_grupo` (`id_grupo`),
  KEY `fk_horario_hora_academica` (`id_hora_academica`),
  KEY `fk_horario_status` (`id_status`),
  KEY `fk_horario_usuario` (`id_usuario`),
  CONSTRAINT `fk_horario_grupo` FOREIGN KEY (`id_grupo`) REFERENCES `grupo` (`id`),
  CONSTRAINT `fk_horario_hora_academica` FOREIGN KEY (`id_hora_academica`) REFERENCES `hora_academica` (`id`),
  CONSTRAINT `fk_horario_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`),
  CONSTRAINT `fk_horario_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of horario
-- ----------------------------
INSERT INTO `horario` VALUES ('1', 'HCA1', '1', '1', null, '1', '1', '2021-03-12 02:51:37', '2021-03-12 02:51:37');

-- ----------------------------
-- Table structure for hora_academica
-- ----------------------------
DROP TABLE IF EXISTS `hora_academica`;
CREATE TABLE `hora_academica` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_hora_academica` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_nivel` int(11) unsigned NOT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) unsigned NOT NULL,
  `id_usuario` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_hora_academica_status` (`id_status`),
  KEY `fk_hora_academica_usuario` (`id_usuario`),
  CONSTRAINT `fk_hora_academica_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`),
  CONSTRAINT `fk_hora_academica_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of hora_academica
-- ----------------------------
INSERT INTO `hora_academica` VALUES ('1', 'Mañana', '0', null, '1', '1', null, '2021-03-12 01:09:18');
INSERT INTO `hora_academica` VALUES ('3', 'Tarde', '0', null, '1', '1', '2021-03-12 01:09:36', '2021-03-12 01:09:36');
INSERT INTO `hora_academica` VALUES ('4', 'Noche', '0', null, '1', '1', '2021-03-12 01:14:21', '2021-03-12 01:14:21');
INSERT INTO `hora_academica` VALUES ('5', 'Sabatino', '0', null, '1', '1', '2021-03-12 01:17:50', '2021-03-12 01:17:50');

-- ----------------------------
-- Table structure for incidencia
-- ----------------------------
DROP TABLE IF EXISTS `incidencia`;
CREATE TABLE `incidencia` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_alumno` int(11) unsigned NOT NULL,
  `fe_incidencia` date NOT NULL,
  `id_tipo_falta` int(11) unsigned NOT NULL,
  `tx_descripcion` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_tipo_sancion` int(11) unsigned NOT NULL,
  `tx_sancion` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) unsigned NOT NULL,
  `id_usuario` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_incidencia_alumno` (`id_alumno`),
  KEY `fk_incidencia_tipo_falta` (`id_tipo_falta`),
  KEY `fk_incidencia_tipo_sancion` (`id_tipo_sancion`),
  KEY `fk_incidencia_status` (`id_status`),
  KEY `fk_incidencia_usuario` (`id_usuario`),
  CONSTRAINT `fk_incidencia_alumno` FOREIGN KEY (`id_alumno`) REFERENCES `alumno` (`id`),
  CONSTRAINT `fk_incidencia_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`),
  CONSTRAINT `fk_incidencia_tipo_falta` FOREIGN KEY (`id_tipo_falta`) REFERENCES `tipo_falta` (`id`),
  CONSTRAINT `fk_incidencia_tipo_sancion` FOREIGN KEY (`id_tipo_sancion`) REFERENCES `tipo_sancion` (`id`),
  CONSTRAINT `fk_incidencia_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of incidencia
-- ----------------------------

-- ----------------------------
-- Table structure for jobs
-- ----------------------------
DROP TABLE IF EXISTS `jobs`;
CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of jobs
-- ----------------------------

-- ----------------------------
-- Table structure for jornada
-- ----------------------------
DROP TABLE IF EXISTS `jornada`;
CREATE TABLE `jornada` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_jornada` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) unsigned NOT NULL,
  `id_usuario` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_jornada_status` (`id_status`),
  KEY `fk_jornada_usuario` (`id_usuario`),
  CONSTRAINT `fk_jornada_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`),
  CONSTRAINT `fk_jornada_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of jornada
-- ----------------------------
INSERT INTO `jornada` VALUES ('1', 'Lunes a Viernes de 7:00am a 5:00pm', null, '1', '1', '2020-05-09 09:39:04', '2020-05-09 09:39:04');
INSERT INTO `jornada` VALUES ('2', 'Sabado y Dominago de 7:00am a 5:00pm', null, '1', '1', '2020-05-09 09:40:48', '2020-05-09 09:40:48');

-- ----------------------------
-- Table structure for libro
-- ----------------------------
DROP TABLE IF EXISTS `libro`;
CREATE TABLE `libro` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_libro` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `id_materia` int(11) unsigned NOT NULL,
  `id_grado` int(11) unsigned NOT NULL,
  `tx_descripcion` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_portada` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_observaciones` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) unsigned NOT NULL,
  `id_usuario` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_libro_materia` (`id_materia`),
  KEY `fk_libro_grado` (`id_grado`),
  KEY `fk_libro_status` (`id_status`),
  KEY `fk_libro_usuario` (`id_usuario`),
  CONSTRAINT `fk_libro_grado` FOREIGN KEY (`id_grado`) REFERENCES `grado` (`id`),
  CONSTRAINT `fk_libro_materia` FOREIGN KEY (`id_materia`) REFERENCES `materia` (`id`),
  CONSTRAINT `fk_libro_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`),
  CONSTRAINT `fk_libro_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of libro
-- ----------------------------
INSERT INTO `libro` VALUES ('1', 'Ciencias Sociales', '1', '4', 'Libro de Primer Grado de Ciencias Sociales', '', '', '1', '1', '2020-10-05 18:57:33', '2020-10-05 23:11:47');
INSERT INTO `libro` VALUES ('2', 'Matematica', '2', '4', 'Libro matematica', '', '', '1', '1', '2020-10-07 23:04:51', '2020-10-07 23:04:51');
INSERT INTO `libro` VALUES ('3', 'Lengua Castellana', '3', '4', 'LIbro Lengua Castellana', '', '', '1', '1', '2020-10-07 23:05:16', '2020-10-07 23:23:22');
INSERT INTO `libro` VALUES ('4', 'Ciencias Naturales', '4', '4', 'Libro Ciencias Naturales', '', '', '1', '1', '2020-10-07 23:05:16', '2020-10-07 23:23:22');

-- ----------------------------
-- Table structure for materia
-- ----------------------------
DROP TABLE IF EXISTS `materia`;
CREATE TABLE `materia` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_materia` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `co_materia` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_area_estudio` int(11) unsigned NOT NULL,
  `tx_icono` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) unsigned NOT NULL,
  `id_usuario` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_materia_area_estudio` (`id_area_estudio`),
  KEY `fk_materia_status` (`id_status`),
  KEY `fk_materia_usuario` (`id_usuario`),
  CONSTRAINT `fk_materia_area_estudio` FOREIGN KEY (`id_area_estudio`) REFERENCES `area_estudio` (`id`),
  CONSTRAINT `fk_materia_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`),
  CONSTRAINT `fk_materia_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of materia
-- ----------------------------
INSERT INTO `materia` VALUES ('1', 'Bilingüismo Social', 'BS01', '2', null, null, '1', '1', '2021-03-12 01:34:33', '2021-04-07 20:40:14');
INSERT INTO `materia` VALUES ('2', 'Dis. e Innov. Productos Turísticos', 'DIPT', '3', null, null, '1', '1', '2021-03-12 01:36:40', '2021-04-07 20:42:40');
INSERT INTO `materia` VALUES ('3', 'Fortalecimiento Empresarial', 'FE01', '5', null, null, '1', '1', '2021-03-12 01:38:03', '2021-04-07 20:42:49');
INSERT INTO `materia` VALUES ('4', 'Inmersión Ingles', 'II01', '4', null, null, '1', '1', '2021-03-12 01:38:55', '2021-04-07 20:42:56');
INSERT INTO `materia` VALUES ('5', 'Turismo Científico', 'TC01', '5', null, null, '1', '1', '2021-03-12 01:39:41', '2021-03-12 01:39:41');

-- ----------------------------
-- Table structure for matricula
-- ----------------------------
DROP TABLE IF EXISTS `matricula`;
CREATE TABLE `matricula` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_calendario` int(11) unsigned NOT NULL,
  `id_alumno` int(11) unsigned NOT NULL,
  `id_grado` int(11) unsigned NOT NULL,
  `id_grupo` int(11) unsigned NOT NULL,
  `fe_matricula` date NOT NULL,
  `id_tipo_condicion` int(11) unsigned NOT NULL,
  `id_colegio_origen` int(11) unsigned DEFAULT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) unsigned NOT NULL,
  `id_usuario` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_matricula_calendario` (`id_calendario`),
  KEY `fk_matricula_alumno` (`id_alumno`),
  KEY `fk_matricula_grado` (`id_grado`),
  KEY `fk_matricula_grupo` (`id_grupo`),
  KEY `fk_matricula_tipo_condicion` (`id_tipo_condicion`),
  KEY `fk_matricula_status` (`id_status`),
  KEY `fk_matricula_usuario` (`id_usuario`),
  CONSTRAINT `fk_matricula_alumno` FOREIGN KEY (`id_alumno`) REFERENCES `alumno` (`id`),
  CONSTRAINT `fk_matricula_calendario` FOREIGN KEY (`id_calendario`) REFERENCES `calendario` (`id`),
  CONSTRAINT `fk_matricula_grado` FOREIGN KEY (`id_grado`) REFERENCES `grado` (`id`),
  CONSTRAINT `fk_matricula_grupo` FOREIGN KEY (`id_grupo`) REFERENCES `grupo` (`id`),
  CONSTRAINT `fk_matricula_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`),
  CONSTRAINT `fk_matricula_tipo_condicion` FOREIGN KEY (`id_tipo_condicion`) REFERENCES `tipo_condicion` (`id`),
  CONSTRAINT `fk_matricula_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=279 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of matricula
-- ----------------------------
INSERT INTO `matricula` VALUES ('1', '1', '500', '7', '2', '2021-04-07', '1', null, 'SIMON BOLIVAR', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('2', '1', '501', '7', '2', '2021-04-07', '1', null, 'SIMON BOLIVAR', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('3', '1', '502', '7', '2', '2021-04-07', '1', null, 'SIMON BOLIVAR', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('4', '1', '503', '7', '2', '2021-04-07', '1', null, 'SIMON BOLIVAR', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('5', '1', '504', '7', '2', '2021-04-07', '1', null, 'SIMON BOLIVAR', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('6', '1', '505', '7', '2', '2021-04-07', '1', null, 'SIMON BOLIVAR', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('7', '1', '506', '7', '2', '2021-04-07', '1', null, 'SIMON BOLIVAR', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('8', '1', '507', '7', '2', '2021-04-07', '1', null, 'SIMON BOLIVAR', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('9', '1', '508', '7', '2', '2021-04-07', '1', null, 'SIMON BOLIVAR', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('10', '1', '509', '7', '2', '2021-04-07', '1', null, 'SIMON BOLIVAR', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('11', '1', '510', '7', '2', '2021-04-07', '1', null, 'SIMON BOLIVAR', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('12', '1', '511', '7', '2', '2021-04-07', '1', null, 'SIMON BOLIVAR', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('13', '1', '512', '7', '2', '2021-04-07', '1', null, 'SIMON BOLIVAR', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('14', '1', '513', '7', '2', '2021-04-07', '1', null, 'SIMON BOLIVAR', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('15', '1', '514', '7', '2', '2021-04-07', '1', null, 'SIMON BOLIVAR', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('16', '1', '515', '7', '2', '2021-04-07', '1', null, 'SIMON BOLIVAR', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('17', '1', '516', '7', '2', '2021-04-07', '1', null, 'SIMON BOLIVAR', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('18', '1', '517', '12', '7', '2021-04-07', '1', null, 'SIMON BOLIVAR', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('19', '1', '518', '12', '7', '2021-04-07', '1', null, 'SIMON BOLIVAR', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('20', '1', '519', '12', '7', '2021-04-07', '1', null, 'SIMON BOLIVAR', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('21', '1', '520', '12', '7', '2021-04-07', '1', null, 'SIMON BOLIVAR', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('22', '1', '521', '12', '7', '2021-04-07', '1', null, 'SIMON BOLIVAR', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('23', '1', '522', '12', '7', '2021-04-07', '1', null, 'SIMON BOLIVAR', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('24', '1', '523', '12', '7', '2021-04-07', '1', null, 'SIMON BOLIVAR', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('25', '1', '524', '12', '7', '2021-04-07', '1', null, 'SIMON BOLIVAR', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('26', '1', '525', '12', '7', '2021-04-07', '1', null, 'SIMON BOLIVAR', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('27', '1', '526', '12', '7', '2021-04-07', '1', null, 'SIMON BOLIVAR', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('28', '1', '527', '12', '7', '2021-04-07', '1', null, 'SIMON BOLIVAR', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('29', '1', '528', '12', '7', '2021-04-07', '1', null, 'SIMON BOLIVAR', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('30', '1', '529', '12', '7', '2021-04-07', '1', null, 'SIMON BOLIVAR', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('31', '1', '530', '12', '7', '2021-04-07', '1', null, 'SIMON BOLIVAR', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('32', '1', '531', '12', '7', '2021-04-07', '1', null, 'SIMON BOLIVAR', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('33', '1', '532', '12', '7', '2021-04-07', '1', null, 'SIMON BOLIVAR', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('34', '1', '533', '14', '9', '2021-04-07', '1', null, 'SIMON BOLIVAR', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('35', '1', '534', '13', '8', '2021-04-07', '1', null, 'SIMON BOLIVAR', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('36', '1', '535', '13', '8', '2021-04-07', '1', null, 'SIMON BOLIVAR', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('37', '1', '536', '7', '2', '2021-04-07', '1', null, 'SIMON BOLIVAR', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('38', '1', '537', '7', '2', '2021-04-07', '1', null, 'SIMON BOLIVAR', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('39', '1', '538', '7', '11', '2021-04-07', '1', null, 'I.E. TECNICO EN TURISMO 12 DE OCTUBRE ', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('40', '1', '539', '7', '11', '2021-04-07', '1', null, 'I.E. TECNICO EN TURISMO 12 DE OCTUBRE ', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('41', '1', '540', '7', '11', '2021-04-07', '1', null, 'I.E. TECNICO EN TURISMO 12 DE OCTUBRE ', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('42', '1', '541', '7', '11', '2021-04-07', '1', null, 'I.E. TECNICO EN TURISMO 12 DE OCTUBRE ', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('43', '1', '542', '7', '11', '2021-04-07', '1', null, 'I.E. TECNICO EN TURISMO 12 DE OCTUBRE ', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('44', '1', '543', '7', '11', '2021-04-07', '1', null, 'I.E. TECNICO EN TURISMO 12 DE OCTUBRE ', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('45', '1', '544', '7', '11', '2021-04-07', '1', null, 'I.E. TECNICO EN TURISMO 12 DE OCTUBRE ', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('46', '1', '545', '7', '11', '2021-04-07', '1', null, 'I.E. TECNICO EN TURISMO 12 DE OCTUBRE ', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('47', '1', '546', '7', '11', '2021-04-07', '1', null, 'I.E. TECNICO EN TURISMO 12 DE OCTUBRE ', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('48', '1', '547', '7', '11', '2021-04-07', '1', null, 'I.E. TECNICO EN TURISMO 12 DE OCTUBRE ', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('49', '1', '548', '7', '11', '2021-04-07', '1', null, 'I.E. TECNICO EN TURISMO 12 DE OCTUBRE ', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('50', '1', '549', '7', '11', '2021-04-07', '1', null, 'I.E. TECNICO EN TURISMO 12 DE OCTUBRE ', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('51', '1', '550', '7', '11', '2021-04-07', '1', null, 'I.E. TECNICO EN TURISMO 12 DE OCTUBRE ', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('52', '1', '551', '7', '11', '2021-04-07', '1', null, 'I.E. TECNICO EN TURISMO 12 DE OCTUBRE ', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('53', '1', '552', '7', '11', '2021-04-07', '1', null, 'I.E. TECNICO EN TURISMO 12 DE OCTUBRE ', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('54', '1', '553', '7', '11', '2021-04-07', '1', null, 'I.E. TECNICO EN TURISMO 12 DE OCTUBRE ', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('55', '1', '554', '7', '11', '2021-04-07', '1', null, 'I.E. TECNICO EN TURISMO 12 DE OCTUBRE ', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('56', '1', '555', '7', '11', '2021-04-07', '1', null, 'I.E. TECNICO EN TURISMO 12 DE OCTUBRE ', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('57', '1', '556', '7', '11', '2021-04-07', '1', null, 'I.E. TECNICO EN TURISMO 12 DE OCTUBRE ', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('58', '1', '557', '7', '11', '2021-04-07', '1', null, 'I.E. TECNICO EN TURISMO 12 DE OCTUBRE ', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('59', '1', '558', '12', '16', '2021-04-07', '1', null, 'I.E. TECNICO EN TURISMO 12 DE OCTUBRE ', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('60', '1', '559', '12', '16', '2021-04-07', '1', null, 'I.E. TECNICO EN TURISMO 12 DE OCTUBRE ', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('61', '1', '560', '12', '16', '2021-04-07', '1', null, 'I.E. TECNICO EN TURISMO 12 DE OCTUBRE ', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('62', '1', '561', '12', '16', '2021-04-07', '1', null, 'I.E. TECNICO EN TURISMO 12 DE OCTUBRE ', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('63', '1', '562', '12', '16', '2021-04-07', '1', null, 'I.E. TECNICO EN TURISMO 12 DE OCTUBRE ', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('64', '1', '563', '12', '16', '2021-04-07', '1', null, 'I.E. TECNICO EN TURISMO 12 DE OCTUBRE ', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('65', '1', '564', '12', '16', '2021-04-07', '1', null, 'I.E. TECNICO EN TURISMO 12 DE OCTUBRE ', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('66', '1', '565', '12', '16', '2021-04-07', '1', null, 'I.E. TECNICO EN TURISMO 12 DE OCTUBRE ', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('67', '1', '566', '12', '16', '2021-04-07', '1', null, 'I.E. TECNICO EN TURISMO 12 DE OCTUBRE ', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('68', '1', '567', '12', '16', '2021-04-07', '1', null, 'I.E. TECNICO EN TURISMO 12 DE OCTUBRE ', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('69', '1', '568', '12', '16', '2021-04-07', '1', null, 'I.E. TECNICO EN TURISMO 12 DE OCTUBRE ', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('70', '1', '569', '12', '16', '2021-04-07', '1', null, 'I.E. TECNICO EN TURISMO 12 DE OCTUBRE ', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('71', '1', '570', '12', '16', '2021-04-07', '1', null, 'I.E. TECNICO EN TURISMO 12 DE OCTUBRE ', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('72', '1', '571', '12', '16', '2021-04-07', '1', null, 'I.E. TECNICO EN TURISMO 12 DE OCTUBRE ', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('73', '1', '572', '12', '16', '2021-04-07', '1', null, 'I.E. TECNICO EN TURISMO 12 DE OCTUBRE ', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('74', '1', '573', '12', '16', '2021-04-07', '1', null, 'I.E. TECNICO EN TURISMO 12 DE OCTUBRE ', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('75', '1', '574', '12', '16', '2021-04-07', '1', null, 'I.E. TECNICO EN TURISMO 12 DE OCTUBRE ', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('76', '1', '575', '12', '16', '2021-04-07', '1', null, 'I.E. TECNICO EN TURISMO 12 DE OCTUBRE ', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('77', '1', '576', '12', '16', '2021-04-07', '1', null, 'I.E. TECNICO EN TURISMO 12 DE OCTUBRE ', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('78', '1', '577', '12', '16', '2021-04-07', '1', null, 'I.E. TECNICO EN TURISMO 12 DE OCTUBRE ', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('79', '1', '578', '12', '16', '2021-04-07', '1', null, 'I.E. TECNICO EN TURISMO 12 DE OCTUBRE ', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('80', '1', '579', '12', '16', '2021-04-07', '1', null, 'I.E. TECNICO EN TURISMO 12 DE OCTUBRE ', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('81', '1', '580', '12', '16', '2021-04-07', '1', null, 'I.E. TECNICO EN TURISMO 12 DE OCTUBRE ', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('82', '1', '581', '8', '12', '2021-04-07', '1', null, 'I.E. TECNICO EN TURISMO 12 DE OCTUBRE ', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('83', '1', '582', '8', '12', '2021-04-07', '1', null, 'I.E. TECNICO EN TURISMO 12 DE OCTUBRE ', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('84', '1', '583', '8', '12', '2021-04-07', '1', null, 'I.E. TECNICO EN TURISMO 12 DE OCTUBRE ', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('85', '1', '584', '8', '12', '2021-04-07', '1', null, 'I.E. TECNICO EN TURISMO 12 DE OCTUBRE ', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('86', '1', '585', '8', '12', '2021-04-07', '1', null, 'I.E. TECNICO EN TURISMO 12 DE OCTUBRE ', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('87', '1', '586', '8', '12', '2021-04-07', '1', null, 'I.E. TECNICO EN TURISMO 12 DE OCTUBRE ', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('88', '1', '587', '8', '12', '2021-04-07', '1', null, 'I.E. TECNICO EN TURISMO 12 DE OCTUBRE ', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('89', '1', '588', '8', '12', '2021-04-07', '1', null, 'I.E. TECNICO EN TURISMO 12 DE OCTUBRE ', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('90', '1', '589', '8', '12', '2021-04-07', '1', null, 'I.E. TECNICO EN TURISMO 12 DE OCTUBRE ', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('91', '1', '590', '12', '16', '2021-04-07', '1', null, 'I.E. TECNICO EN TURISMO 12 DE OCTUBRE ', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('92', '1', '591', '12', '16', '2021-04-07', '1', null, 'I.E. TECNICO EN TURISMO 12 DE OCTUBRE ', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('93', '1', '592', '12', '16', '2021-04-07', '1', null, 'I.E. TECNICO EN TURISMO 12 DE OCTUBRE ', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('94', '1', '593', '12', '16', '2021-04-07', '1', null, 'I.E. TECNICO EN TURISMO 12 DE OCTUBRE ', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('95', '1', '594', '12', '16', '2021-04-07', '1', null, 'I.E. TECNICO EN TURISMO 12 DE OCTUBRE ', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('96', '1', '595', '12', '16', '2021-04-07', '1', null, 'I.E. TECNICO EN TURISMO 12 DE OCTUBRE ', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('97', '1', '596', '12', '16', '2021-04-07', '1', null, 'I.E. TECNICO EN TURISMO 12 DE OCTUBRE ', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('98', '1', '597', '12', '16', '2021-04-07', '1', null, 'I.E. TECNICO EN TURISMO 12 DE OCTUBRE ', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('99', '1', '598', '12', '16', '2021-04-07', '1', null, 'I.E. TECNICO EN TURISMO 12 DE OCTUBRE ', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('100', '1', '599', '11', '15', '2021-04-07', '1', null, 'I.E. TECNICO EN TURISMO 12 DE OCTUBRE ', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('101', '1', '600', '11', '15', '2021-04-07', '1', null, 'I.E. TECNICO EN TURISMO 12 DE OCTUBRE ', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('102', '1', '601', '11', '15', '2021-04-07', '1', null, 'I.E. TECNICO EN TURISMO 12 DE OCTUBRE ', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('103', '1', '602', '11', '15', '2021-04-07', '1', null, 'I.E. TECNICO EN TURISMO 12 DE OCTUBRE ', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('104', '1', '603', '11', '15', '2021-04-07', '1', null, 'I.E. TECNICO EN TURISMO 12 DE OCTUBRE ', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('105', '1', '604', '11', '15', '2021-04-07', '1', null, 'I.E. TECNICO EN TURISMO 12 DE OCTUBRE ', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('106', '1', '605', '11', '15', '2021-04-07', '1', null, 'I.E. TECNICO EN TURISMO 12 DE OCTUBRE ', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('107', '1', '606', '8', '12', '2021-04-07', '1', null, 'I.E. TECNICO EN TURISMO 12 DE OCTUBRE ', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('108', '1', '607', '13', '17', '2021-04-07', '1', null, 'I.E. TECNICO EN TURISMO 12 DE OCTUBRE ', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('109', '1', '608', '13', '17', '2021-04-07', '1', null, 'I.E. TECNICO EN TURISMO 12 DE OCTUBRE ', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('110', '1', '609', '13', '17', '2021-04-07', '1', null, 'I.E. TECNICO EN TURISMO 12 DE OCTUBRE ', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('111', '1', '610', '13', '17', '2021-04-07', '1', null, 'I.E. TECNICO EN TURISMO 12 DE OCTUBRE ', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('112', '1', '611', '13', '17', '2021-04-07', '1', null, 'I.E. TECNICO EN TURISMO 12 DE OCTUBRE ', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('113', '1', '612', '12', '25', '2021-04-07', '1', null, 'GABRIEL GARCÍA MÁRQUEZ DE ARACATACA', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('114', '1', '613', '12', '25', '2021-04-07', '1', null, 'GABRIEL GARCÍA MÁRQUEZ DE ARACATACA', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('115', '1', '614', '12', '25', '2021-04-07', '1', null, 'GABRIEL GARCÍA MÁRQUEZ DE ARACATACA', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('116', '1', '615', '12', '25', '2021-04-07', '1', null, 'GABRIEL GARCÍA MÁRQUEZ DE ARACATACA', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('117', '1', '616', '12', '25', '2021-04-07', '1', null, 'GABRIEL GARCÍA MÁRQUEZ DE ARACATACA', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('118', '1', '617', '12', '25', '2021-04-07', '1', null, 'GABRIEL GARCÍA MÁRQUEZ DE ARACATACA', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('119', '1', '618', '12', '25', '2021-04-07', '1', null, 'GABRIEL GARCÍA MÁRQUEZ DE ARACATACA', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('120', '1', '619', '12', '25', '2021-04-07', '1', null, 'GABRIEL GARCÍA MÁRQUEZ DE ARACATACA', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('121', '1', '620', '12', '25', '2021-04-07', '1', null, 'GABRIEL GARCÍA MÁRQUEZ DE ARACATACA', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('122', '1', '621', '12', '25', '2021-04-07', '1', null, 'GABRIEL GARCÍA MÁRQUEZ DE ARACATACA', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('123', '1', '622', '12', '25', '2021-04-07', '1', null, 'GABRIEL GARCÍA MÁRQUEZ DE ARACATACA', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('124', '1', '623', '12', '25', '2021-04-07', '1', null, 'GABRIEL GARCÍA MÁRQUEZ DE ARACATACA', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('125', '1', '624', '12', '25', '2021-04-07', '1', null, 'GABRIEL GARCÍA MÁRQUEZ DE ARACATACA', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('126', '1', '625', '12', '25', '2021-04-07', '1', null, 'GABRIEL GARCÍA MÁRQUEZ DE ARACATACA', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('127', '1', '626', '12', '25', '2021-04-07', '1', null, 'GABRIEL GARCÍA MÁRQUEZ DE ARACATACA', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('128', '1', '627', '12', '25', '2021-04-07', '1', null, 'GABRIEL GARCÍA MÁRQUEZ DE ARACATACA', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('129', '1', '628', '12', '25', '2021-04-07', '1', null, 'GABRIEL GARCÍA MÁRQUEZ DE ARACATACA', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('130', '1', '629', '12', '25', '2021-04-07', '1', null, 'GABRIEL GARCÍA MÁRQUEZ DE ARACATACA', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('131', '1', '630', '12', '25', '2021-04-07', '1', null, 'GABRIEL GARCÍA MÁRQUEZ DE ARACATACA', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('132', '1', '631', '12', '25', '2021-04-07', '1', null, 'GABRIEL GARCÍA MÁRQUEZ DE ARACATACA', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('133', '1', '632', '12', '25', '2021-04-07', '1', null, 'GABRIEL GARCÍA MÁRQUEZ DE ARACATACA', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('134', '1', '633', '12', '25', '2021-04-07', '1', null, 'GABRIEL GARCÍA MÁRQUEZ DE ARACATACA', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('135', '1', '634', '12', '25', '2021-04-07', '1', null, 'GABRIEL GARCÍA MÁRQUEZ DE ARACATACA', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('136', '1', '635', '12', '25', '2021-04-07', '1', null, 'GABRIEL GARCÍA MÁRQUEZ DE ARACATACA', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('137', '1', '636', '12', '25', '2021-04-07', '1', null, 'GABRIEL GARCÍA MÁRQUEZ DE ARACATACA', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('138', '1', '637', '12', '25', '2021-04-07', '1', null, 'GABRIEL GARCÍA MÁRQUEZ DE ARACATACA', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('139', '1', '638', '10', '23', '2021-04-07', '1', null, 'GABRIEL GARCÍA MÁRQUEZ DE ARACATACA', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('140', '1', '639', '10', '23', '2021-04-07', '1', null, 'GABRIEL GARCÍA MÁRQUEZ DE ARACATACA', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('141', '1', '640', '10', '23', '2021-04-07', '1', null, 'GABRIEL GARCÍA MÁRQUEZ DE ARACATACA', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('142', '1', '641', '10', '23', '2021-04-07', '1', null, 'GABRIEL GARCÍA MÁRQUEZ DE ARACATACA', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('143', '1', '642', '10', '23', '2021-04-07', '1', null, 'GABRIEL GARCÍA MÁRQUEZ DE ARACATACA', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('144', '1', '643', '10', '23', '2021-04-07', '1', null, 'GABRIEL GARCÍA MÁRQUEZ DE ARACATACA', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('145', '1', '644', '12', '23', '2021-04-07', '1', null, 'GABRIEL GARCÍA MÁRQUEZ DE ARACATACA', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('146', '1', '645', '10', '23', '2021-04-07', '1', null, 'GABRIEL GARCÍA MÁRQUEZ DE ARACATACA', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('147', '1', '646', '10', '23', '2021-04-07', '1', null, 'GABRIEL GARCÍA MÁRQUEZ DE ARACATACA', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('148', '1', '647', '10', '23', '2021-04-07', '1', null, 'GABRIEL GARCÍA MÁRQUEZ DE ARACATACA', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('149', '1', '648', '10', '23', '2021-04-07', '1', null, 'GABRIEL GARCÍA MÁRQUEZ DE ARACATACA', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('150', '1', '649', '10', '23', '2021-04-07', '1', null, 'GABRIEL GARCÍA MÁRQUEZ DE ARACATACA', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('151', '1', '650', '10', '23', '2021-04-07', '1', null, 'GABRIEL GARCÍA MÁRQUEZ DE ARACATACA', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('152', '1', '651', '10', '23', '2021-04-07', '1', null, 'GABRIEL GARCÍA MÁRQUEZ DE ARACATACA', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('153', '1', '652', '7', '20', '2021-04-07', '1', null, 'GABRIEL GARCÍA MÁRQUEZ DE ARACATACA', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('154', '1', '653', '7', '20', '2021-04-07', '1', null, 'GABRIEL GARCÍA MÁRQUEZ DE ARACATACA', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('155', '1', '654', '7', '20', '2021-04-07', '1', null, 'GABRIEL GARCÍA MÁRQUEZ DE ARACATACA', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('156', '1', '655', '7', '20', '2021-04-07', '1', null, 'GABRIEL GARCÍA MÁRQUEZ DE ARACATACA', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('157', '1', '656', '7', '20', '2021-04-07', '1', null, 'GABRIEL GARCÍA MÁRQUEZ DE ARACATACA', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('158', '1', '657', '7', '20', '2021-04-07', '1', null, 'GABRIEL GARCÍA MÁRQUEZ DE ARACATACA', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('159', '1', '658', '7', '29', '2021-04-07', '1', null, 'INSTITUCION ETNOEDUCATIVA DISTRITAL INTERCULTURAL EL MAMEY', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('160', '1', '659', '7', '29', '2021-04-07', '1', null, 'INSTITUCION ETNOEDUCATIVA DISTRITAL INTERCULTURAL EL MAMEY', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('161', '1', '660', '7', '29', '2021-04-07', '1', null, 'INSTITUCION ETNOEDUCATIVA DISTRITAL INTERCULTURAL EL MAMEY', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('162', '1', '661', '7', '29', '2021-04-07', '1', null, 'INSTITUCION ETNOEDUCATIVA DISTRITAL INTERCULTURAL EL MAMEY', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('163', '1', '662', '7', '29', '2021-04-07', '1', null, 'INSTITUCION ETNOEDUCATIVA DISTRITAL INTERCULTURAL EL MAMEY', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('164', '1', '663', '7', '29', '2021-04-07', '1', null, 'INSTITUCION ETNOEDUCATIVA DISTRITAL INTERCULTURAL EL MAMEY', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('165', '1', '664', '7', '29', '2021-04-07', '1', null, 'INSTITUCION ETNOEDUCATIVA DISTRITAL INTERCULTURAL EL MAMEY', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('166', '1', '665', '7', '29', '2021-04-07', '1', null, 'INSTITUCION ETNOEDUCATIVA DISTRITAL INTERCULTURAL EL MAMEY', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('167', '1', '666', '7', '29', '2021-04-07', '1', null, 'INSTITUCION ETNOEDUCATIVA DISTRITAL INTERCULTURAL EL MAMEY', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('168', '1', '667', '7', '29', '2021-04-07', '1', null, 'INSTITUCION ETNOEDUCATIVA DISTRITAL INTERCULTURAL EL MAMEY', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('169', '1', '668', '7', '29', '2021-04-07', '1', null, 'INSTITUCION ETNOEDUCATIVA DISTRITAL INTERCULTURAL EL MAMEY', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('170', '1', '669', '7', '29', '2021-04-07', '1', null, 'INSTITUCION ETNOEDUCATIVA DISTRITAL INTERCULTURAL EL MAMEY', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('171', '1', '670', '7', '29', '2021-04-07', '1', null, 'INSTITUCION ETNOEDUCATIVA DISTRITAL INTERCULTURAL EL MAMEY', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('172', '1', '671', '7', '29', '2021-04-07', '1', null, 'INSTITUCION ETNOEDUCATIVA DISTRITAL INTERCULTURAL EL MAMEY', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('173', '1', '672', '7', '29', '2021-04-07', '1', null, 'INSTITUCION ETNOEDUCATIVA DISTRITAL INTERCULTURAL EL MAMEY', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('174', '1', '673', '7', '29', '2021-04-07', '1', null, 'INSTITUCION ETNOEDUCATIVA DISTRITAL INTERCULTURAL EL MAMEY', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('175', '1', '674', '7', '29', '2021-04-07', '1', null, 'INSTITUCION ETNOEDUCATIVA DISTRITAL INTERCULTURAL EL MAMEY', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('176', '1', '675', '7', '29', '2021-04-07', '1', null, 'INSTITUCION ETNOEDUCATIVA DISTRITAL INTERCULTURAL EL MAMEY', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('177', '1', '676', '12', '34', '2021-04-07', '1', null, 'INSTITUCION ETNOEDUCATIVA DISTRITAL INTERCULTURAL EL MAMEY', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('178', '1', '677', '12', '34', '2021-04-07', '1', null, 'INSTITUCION ETNOEDUCATIVA DISTRITAL INTERCULTURAL EL MAMEY', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('179', '1', '678', '12', '34', '2021-04-07', '1', null, 'INSTITUCION ETNOEDUCATIVA DISTRITAL INTERCULTURAL EL MAMEY', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('180', '1', '679', '12', '34', '2021-04-07', '1', null, 'INSTITUCION ETNOEDUCATIVA DISTRITAL INTERCULTURAL EL MAMEY', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('181', '1', '680', '12', '34', '2021-04-07', '1', null, 'INSTITUCION ETNOEDUCATIVA DISTRITAL INTERCULTURAL EL MAMEY', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('182', '1', '681', '12', '34', '2021-04-07', '1', null, 'INSTITUCION ETNOEDUCATIVA DISTRITAL INTERCULTURAL EL MAMEY', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('183', '1', '682', '12', '34', '2021-04-07', '1', null, 'INSTITUCION ETNOEDUCATIVA DISTRITAL INTERCULTURAL EL MAMEY', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('184', '1', '683', '12', '34', '2021-04-07', '1', null, 'INSTITUCION ETNOEDUCATIVA DISTRITAL INTERCULTURAL EL MAMEY', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('185', '1', '684', '12', '34', '2021-04-07', '1', null, 'INSTITUCION ETNOEDUCATIVA DISTRITAL INTERCULTURAL EL MAMEY', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('186', '1', '685', '12', '34', '2021-04-07', '1', null, 'INSTITUCION ETNOEDUCATIVA DISTRITAL INTERCULTURAL EL MAMEY', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('187', '1', '686', '12', '34', '2021-04-07', '1', null, 'INSTITUCION ETNOEDUCATIVA DISTRITAL INTERCULTURAL EL MAMEY', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('188', '1', '687', '12', '34', '2021-04-07', '1', null, 'INSTITUCION ETNOEDUCATIVA DISTRITAL INTERCULTURAL EL MAMEY', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('189', '1', '688', '12', '34', '2021-04-07', '1', null, 'INSTITUCION ETNOEDUCATIVA DISTRITAL INTERCULTURAL EL MAMEY', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('190', '1', '689', '12', '34', '2021-04-07', '1', null, 'INSTITUCION ETNOEDUCATIVA DISTRITAL INTERCULTURAL EL MAMEY', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('191', '1', '690', '12', '34', '2021-04-07', '1', null, 'INSTITUCION ETNOEDUCATIVA DISTRITAL INTERCULTURAL EL MAMEY', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('192', '1', '691', '12', '34', '2021-04-07', '1', null, 'INSTITUCION ETNOEDUCATIVA DISTRITAL INTERCULTURAL EL MAMEY', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('193', '1', '692', '12', '34', '2021-04-07', '1', null, 'INSTITUCION ETNOEDUCATIVA DISTRITAL INTERCULTURAL EL MAMEY', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('194', '1', '693', '12', '34', '2021-04-07', '1', null, 'INSTITUCION ETNOEDUCATIVA DISTRITAL INTERCULTURAL EL MAMEY', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('195', '1', '694', '12', '34', '2021-04-07', '1', null, 'INSTITUCION ETNOEDUCATIVA DISTRITAL INTERCULTURAL EL MAMEY', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('196', '1', '695', '12', '34', '2021-04-07', '1', null, 'INSTITUCION ETNOEDUCATIVA DISTRITAL INTERCULTURAL EL MAMEY', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('197', '1', '696', '7', '29', '2021-04-07', '1', null, 'INSTITUCION ETNOEDUCATIVA DISTRITAL INTERCULTURAL EL MAMEY', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('198', '1', '697', '7', '29', '2021-04-07', '1', null, 'INSTITUCION ETNOEDUCATIVA DISTRITAL INTERCULTURAL EL MAMEY', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('199', '1', '698', '7', '29', '2021-04-07', '1', null, 'INSTITUCION ETNOEDUCATIVA DISTRITAL INTERCULTURAL EL MAMEY', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('200', '1', '699', '7', '29', '2021-04-07', '1', null, 'INSTITUCION ETNOEDUCATIVA DISTRITAL INTERCULTURAL EL MAMEY', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('201', '1', '700', '7', '29', '2021-04-07', '1', null, 'INSTITUCION ETNOEDUCATIVA DISTRITAL INTERCULTURAL EL MAMEY', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('202', '1', '701', '7', '29', '2021-04-07', '1', null, 'INSTITUCION ETNOEDUCATIVA DISTRITAL INTERCULTURAL EL MAMEY', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('203', '1', '702', '7', '29', '2021-04-07', '1', null, 'INSTITUCION ETNOEDUCATIVA DISTRITAL INTERCULTURAL EL MAMEY', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('204', '1', '703', '7', '29', '2021-04-07', '1', null, 'INSTITUCION ETNOEDUCATIVA DISTRITAL INTERCULTURAL EL MAMEY', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('205', '1', '704', '7', '29', '2021-04-07', '1', null, 'INSTITUCION ETNOEDUCATIVA DISTRITAL INTERCULTURAL EL MAMEY', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('206', '1', '705', '7', '29', '2021-04-07', '1', null, 'INSTITUCION ETNOEDUCATIVA DISTRITAL INTERCULTURAL EL MAMEY', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('207', '1', '706', '7', '29', '2021-04-07', '1', null, 'INSTITUCION ETNOEDUCATIVA DISTRITAL INTERCULTURAL EL MAMEY', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('208', '1', '707', '7', '29', '2021-04-07', '1', null, 'INSTITUCION ETNOEDUCATIVA DISTRITAL INTERCULTURAL EL MAMEY', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('209', '1', '708', '7', '29', '2021-04-07', '1', null, 'INSTITUCION ETNOEDUCATIVA DISTRITAL INTERCULTURAL EL MAMEY', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('210', '1', '709', '7', '29', '2021-04-07', '1', null, 'INSTITUCION ETNOEDUCATIVA DISTRITAL INTERCULTURAL EL MAMEY', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('211', '1', '710', '7', '29', '2021-04-07', '1', null, 'INSTITUCION ETNOEDUCATIVA DISTRITAL INTERCULTURAL EL MAMEY', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('212', '1', '711', '7', '38', '2021-04-07', '1', null, 'MARÍA  ALFARO DE OSPINO', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('213', '1', '712', '7', '38', '2021-04-07', '1', null, 'MARÍA  ALFARO DE OSPINO', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('214', '1', '713', '7', '38', '2021-04-07', '1', null, 'MARÍA  ALFARO DE OSPINO', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('215', '1', '714', '7', '38', '2021-04-07', '1', null, 'MARÍA  ALFARO DE OSPINO', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('216', '1', '715', '6', '37', '2021-04-07', '1', null, 'MARÍA  ALFARO DE OSPINO', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('217', '1', '716', '8', '39', '2021-04-07', '1', null, 'MARÍA  ALFARO DE OSPINO', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('218', '1', '717', '7', '38', '2021-04-07', '1', null, 'MARÍA  ALFARO DE OSPINO', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('219', '1', '718', '7', '38', '2021-04-07', '1', null, 'MARÍA  ALFARO DE OSPINO', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('220', '1', '719', '7', '38', '2021-04-07', '1', null, 'MARÍA  ALFARO DE OSPINO', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('221', '1', '720', '7', '38', '2021-04-07', '1', null, 'MARÍA  ALFARO DE OSPINO', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('222', '1', '721', '7', '38', '2021-04-07', '1', null, 'MARÍA  ALFARO DE OSPINO', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('223', '1', '722', '7', '38', '2021-04-07', '1', null, 'MARÍA  ALFARO DE OSPINO', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('224', '1', '723', '7', '38', '2021-04-07', '1', null, 'MARÍA  ALFARO DE OSPINO', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('225', '1', '724', '7', '38', '2021-04-07', '1', null, 'MARÍA  ALFARO DE OSPINO', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('226', '1', '725', '6', '37', '2021-04-07', '1', null, 'MARÍA  ALFARO DE OSPINO', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('227', '1', '726', '6', '37', '2021-04-07', '1', null, 'MARÍA  ALFARO DE OSPINO', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('228', '1', '727', '6', '37', '2021-04-07', '1', null, 'MARÍA  ALFARO DE OSPINO', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('229', '1', '728', '6', '37', '2021-04-07', '1', null, 'MARÍA  ALFARO DE OSPINO', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('230', '1', '729', '8', '39', '2021-04-07', '1', null, 'MARÍA  ALFARO DE OSPINO', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('231', '1', '730', '6', '37', '2021-04-07', '1', null, 'MARÍA  ALFARO DE OSPINO', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('232', '1', '731', '10', '41', '2021-04-07', '1', null, 'MARÍA  ALFARO DE OSPINO', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('233', '1', '732', '11', '42', '2021-04-07', '1', null, 'MARÍA  ALFARO DE OSPINO', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('234', '1', '733', '13', '44', '2021-04-07', '1', null, 'MARÍA  ALFARO DE OSPINO', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('235', '1', '734', '6', '37', '2021-04-07', '1', null, 'MARÍA  ALFARO DE OSPINO', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('236', '1', '735', '12', '43', '2021-04-07', '1', null, 'MARÍA  ALFARO DE OSPINO', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('237', '1', '736', '7', '38', '2021-04-07', '1', null, 'MARÍA  ALFARO DE OSPINO', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('238', '1', '737', '7', '38', '2021-04-07', '1', null, 'MARÍA  ALFARO DE OSPINO', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('239', '1', '738', '12', '52', '2021-04-07', '1', null, 'IED LAURA VICUÑA', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('240', '1', '739', '12', '52', '2021-04-07', '1', null, 'IED LAURA VICUÑA', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('241', '1', '740', '12', '52', '2021-04-07', '1', null, 'IED LAURA VICUÑA', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('242', '1', '741', '12', '52', '2021-04-07', '1', null, 'IED LAURA VICUÑA', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('243', '1', '742', '12', '52', '2021-04-07', '1', null, 'IED LAURA VICUÑA', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('244', '1', '743', '12', '52', '2021-04-07', '1', null, 'IED LAURA VICUÑA', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('245', '1', '744', '12', '52', '2021-04-07', '1', null, 'IED LAURA VICUÑA', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('246', '1', '745', '12', '52', '2021-04-07', '1', null, 'IED LAURA VICUÑA', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('247', '1', '746', '12', '52', '2021-04-07', '1', null, 'IED LAURA VICUÑA', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('248', '1', '747', '12', '52', '2021-04-07', '1', null, 'IED LAURA VICUÑA', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('249', '1', '748', '12', '52', '2021-04-07', '1', null, 'IED LAURA VICUÑA', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('250', '1', '749', '12', '52', '2021-04-07', '1', null, 'IED LAURA VICUÑA', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('251', '1', '750', '12', '52', '2021-04-07', '1', null, 'IED LAURA VICUÑA', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('252', '1', '751', '12', '52', '2021-04-07', '1', null, 'IED LAURA VICUÑA', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('253', '1', '752', '12', '52', '2021-04-07', '1', null, 'IED LAURA VICUÑA', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('254', '1', '753', '12', '52', '2021-04-07', '1', null, 'IED LAURA VICUÑA', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('255', '1', '754', '12', '52', '2021-04-07', '1', null, 'IED LAURA VICUÑA', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('256', '1', '755', '12', '52', '2021-04-07', '1', null, 'IED LAURA VICUÑA', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('257', '1', '756', '12', '52', '2021-04-07', '1', null, 'IED LAURA VICUÑA', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('258', '1', '757', '12', '52', '2021-04-07', '1', null, 'IED LAURA VICUÑA', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('259', '1', '758', '12', '52', '2021-04-07', '1', null, 'IED LAURA VICUÑA', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('260', '1', '759', '12', '52', '2021-04-07', '1', null, 'IED LAURA VICUÑA', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('261', '1', '760', '12', '52', '2021-04-07', '1', null, 'IED LAURA VICUÑA', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('262', '1', '761', '12', '52', '2021-04-07', '1', null, 'IED LAURA VICUÑA', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('263', '1', '762', '12', '52', '2021-04-07', '1', null, 'IED LAURA VICUÑA', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('264', '1', '763', '12', '52', '2021-04-07', '1', null, 'IED LAURA VICUÑA', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('265', '1', '764', '12', '52', '2021-04-07', '1', null, 'IED LAURA VICUÑA', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('266', '1', '765', '12', '52', '2021-04-07', '1', null, 'IED LAURA VICUÑA', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('267', '1', '766', '12', '52', '2021-04-07', '1', null, 'IED LAURA VICUÑA', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('268', '1', '767', '12', '52', '2021-04-07', '1', null, 'IED LAURA VICUÑA', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('269', '1', '768', '12', '52', '2021-04-07', '1', null, 'IED LAURA VICUÑA', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('270', '1', '769', '12', '52', '2021-04-07', '1', null, 'IED LAURA VICUÑA', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('271', '1', '770', '12', '52', '2021-04-07', '1', null, 'IED LAURA VICUÑA', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('272', '1', '771', '12', '52', '2021-04-07', '1', null, 'IED LAURA VICUÑA', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('273', '1', '772', '12', '52', '2021-04-07', '1', null, 'IED LAURA VICUÑA', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('274', '1', '773', '12', '52', '2021-04-07', '1', null, 'IED LAURA VICUÑA', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('275', '1', '774', '12', '52', '2021-04-07', '1', null, 'IED LAURA VICUÑA', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('276', '1', '775', '12', '52', '2021-04-07', '1', null, 'IED LAURA VICUÑA', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('277', '1', '776', '12', '52', '2021-04-07', '1', null, 'IED LAURA VICUÑA', '1', '1', null, null);
INSERT INTO `matricula` VALUES ('278', '1', '777', '12', '52', '2021-04-07', '1', null, 'IED LAURA VICUÑA', '1', '1', null, null);

-- ----------------------------
-- Table structure for mensaje
-- ----------------------------
DROP TABLE IF EXISTS `mensaje`;
CREATE TABLE `mensaje` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `co_mensaje` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_tipo_destinatario` int(11) unsigned NOT NULL,
  `id_destinatario` int(11) unsigned NOT NULL,
  `tx_asunto` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tx_mensaje` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tx_lugar` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_tipo_mensaje` int(11) unsigned NOT NULL,
  `id_tipo_prioridad` int(11) unsigned NOT NULL,
  `fe_mensaje` date NOT NULL,
  `hh_inicio` time DEFAULT NULL,
  `hh_fin` time DEFAULT NULL,
  `id_origen` int(11) unsigned DEFAULT NULL,
  `fe_lectura` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) unsigned NOT NULL,
  `id_usuario` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_mensaje_tipo_destinatario` (`id_tipo_destinatario`),
  KEY `fk_mensaje_destinatario` (`id_destinatario`),
  KEY `fk_mensaje_tipo_mensaje` (`id_tipo_mensaje`),
  KEY `fk_mensaje_tipo_prioridad` (`id_tipo_prioridad`),
  KEY `fk_mensaje_status` (`id_status`),
  KEY `fk_mensaje_usuario` (`id_usuario`),
  CONSTRAINT `fk_mensaje_destinatario` FOREIGN KEY (`id_destinatario`) REFERENCES `usuario` (`id`),
  CONSTRAINT `fk_mensaje_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`),
  CONSTRAINT `fk_mensaje_tipo_destinatario` FOREIGN KEY (`id_tipo_destinatario`) REFERENCES `tipo_destinatario` (`id`),
  CONSTRAINT `fk_mensaje_tipo_mensaje` FOREIGN KEY (`id_tipo_mensaje`) REFERENCES `tipo_mensaje` (`id`),
  CONSTRAINT `fk_mensaje_tipo_prioridad` FOREIGN KEY (`id_tipo_prioridad`) REFERENCES `tipo_prioridad` (`id`),
  CONSTRAINT `fk_mensaje_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of mensaje
-- ----------------------------
INSERT INTO `mensaje` VALUES ('1', 'I6S-QIU-XZW-NXJ', '3', '1', 'sdgsdg', 'gdgs', 'gsggs', '1', '1', '2021-04-06', null, null, null, null, null, '1', '1', '2021-04-06 22:50:53', '2021-04-06 22:50:53');
INSERT INTO `mensaje` VALUES ('2', '7MX-UZC-8XR-6LM', '3', '1', 'gdgd', 'gg', 'gdg', '1', '1', '2021-04-06', null, null, null, null, null, '1', '1', '2021-04-06 22:51:49', '2021-04-06 22:51:49');

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_menu` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_modulo` int(11) unsigned NOT NULL,
  `tx_ruta` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tx_path` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tx_icono` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tx_color` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_target` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bo_visible` tinyint(1) NOT NULL,
  `nu_orden` int(11) NOT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) unsigned NOT NULL,
  `id_usuario` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_menu_modulo` (`id_modulo`),
  KEY `fk_menu_status` (`id_status`),
  KEY `fk_menu_usuario` (`id_usuario`),
  CONSTRAINT `fk_menu_modulo` FOREIGN KEY (`id_modulo`) REFERENCES `modulo` (`id`),
  CONSTRAINT `fk_menu_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`),
  CONSTRAINT `fk_menu_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('1', 'Welcome', '8', 'welcome', '/', 'mdi-home', 'black', 'Welcome', '0', '1', 'Pagina Entrada', '1', '1', '2020-09-02 15:08:33', '2020-09-02 15:08:33');
INSERT INTO `menu` VALUES ('2', 'Home', '3', 'home', '/home', 'mdi-view-dashboard', 'brown', 'Home', '1', '2', 'Home Secretaria', '1', '1', '2020-09-02 15:08:33', '2020-09-02 15:08:33');
INSERT INTO `menu` VALUES ('3', 'Bandeja Docente', '2', 'bandeja-docente', 'bandeja-docente', 'mdi-tray-full', 'indigo', 'BandejaDocente', '1', '3', null, '1', '1', '2020-09-02 15:08:33', '2020-09-02 15:08:33');
INSERT INTO `menu` VALUES ('4', 'Bandeja Alumno', '5', 'bandeja-alumno', 'bandeja-alumno', 'mdi-tray-full', 'amber', 'BandejaAlumno', '1', '4', null, '1', '1', '2020-09-02 15:08:33', '2020-09-02 15:08:33');
INSERT INTO `menu` VALUES ('5', 'Bandeja Acudiente', '4', 'bandeja-acudiente', 'bandeja-acudiente', 'mdi-tray-full', 'light-green', 'BandejaAcudiente', '1', '5', null, '1', '1', '2020-09-02 15:08:33', '2020-09-02 15:08:33');
INSERT INTO `menu` VALUES ('6', 'Configuracion General', '3', 'admin-dashboard', 'admin/', 'mdi-cog', 'brown', 'BandejaAdmin', '1', '6', null, '1', '1', '2020-09-02 15:08:33', '2020-09-02 15:08:33');
INSERT INTO `menu` VALUES ('7', 'Institucion', '3', 'colegio', 'admin/colegio', 'mdi-store', 'orange', 'AppColegio', '1', '7', null, '1', '1', '2020-09-02 15:08:33', '2020-09-02 15:08:33');
INSERT INTO `menu` VALUES ('8', 'Tipo Colegio', '3', 'tipoColegio', 'admin/tipoColegio', 'mdi-bookmark-multiple', 'orange', 'TipoColegio', '1', '9', null, '1', '1', '2020-09-02 15:08:33', '2020-09-02 15:08:33');
INSERT INTO `menu` VALUES ('9', 'Cargos', '3', 'cargo', 'admin/cargos', 'mdi-account-group-outline', 'orange', 'Cargos', '1', '8', null, '1', '1', '2020-09-02 15:08:33', '2020-09-02 15:08:33');
INSERT INTO `menu` VALUES ('10', 'Tipo Directiva', '3', 'tipo-directiva', 'admin/tipoDirectiva', 'mdi-account-group-outline', 'orange', 'TipoDirectiva', '1', '10', null, '1', '1', '2020-09-02 15:08:33', '2020-09-02 15:08:33');
INSERT INTO `menu` VALUES ('11', 'Directiva', '3', 'directiva', 'admin/directiva', 'mdi-account-group', 'orange', 'Directiva', '1', '11', null, '1', '1', '2020-09-02 15:08:33', '2020-09-02 15:08:33');
INSERT INTO `menu` VALUES ('12', 'Estructura', '3', 'estructura', 'admin/estructura', 'mdi-floor-plan', 'orange', 'Estructura', '1', '13', null, '1', '1', '2020-09-02 15:08:33', '2020-09-02 15:08:33');
INSERT INTO `menu` VALUES ('13', 'Aulas', '3', 'aula', 'admin/aula', 'mdi-chair-school', 'orange', 'Aula', '1', '14', null, '1', '1', '2020-09-02 15:08:33', '2020-09-02 15:08:33');
INSERT INTO `menu` VALUES ('14', 'Empleados', '3', 'empleado', 'admin/empleado', 'mdi-badge-account', 'orange', 'Empleado', '1', '12', null, '1', '1', '2020-09-02 15:08:33', '2020-09-02 15:08:33');
INSERT INTO `menu` VALUES ('15', 'Calendario', '3', 'calendario', 'admin/calendario', 'mdi-calendar-blank', 'teal', 'Calendario', '1', '15', null, '1', '1', '2020-09-02 15:08:33', '2020-09-02 15:08:33');
INSERT INTO `menu` VALUES ('16', 'Periodos', '3', 'periodo', 'admin/periodo', 'mdi-calendar-weekend', 'teal', 'Periodo', '1', '16', null, '1', '1', '2020-09-02 15:08:33', '2020-09-02 15:08:33');
INSERT INTO `menu` VALUES ('17', 'Feriados', '3', 'feriado', 'admin/feriado', 'mdi-calendar-star', 'purple', 'Feriado', '1', '29', null, '1', '1', '2020-09-02 15:08:33', '2020-09-02 15:08:33');
INSERT INTO `menu` VALUES ('18', 'Tipo Agenda', '3', 'tipo-agenda', 'admin/tipo-agenda', 'mdi-clipboard-text-multiple', 'purple', 'TipoAgenda', '1', '30', null, '1', '1', '2020-09-02 15:08:33', '2020-09-02 15:08:33');
INSERT INTO `menu` VALUES ('19', 'Tipo Actividad', '3', 'tipo-actividad', 'admin/tipo-actividad', 'mdi-clipboard-text-multiple', 'purple', 'TipoActividad', '1', '31', null, '1', '1', '2020-09-02 15:08:33', '2020-09-02 15:08:33');
INSERT INTO `menu` VALUES ('20', 'Agenda', '3', 'agenda', 'admin/agenda', 'mdi-clipboard-text', 'purple', 'Agenda', '1', '32', null, '1', '1', '2020-09-02 15:08:33', '2020-09-02 15:08:33');
INSERT INTO `menu` VALUES ('21', 'Turnos', '3', 'turno', 'admin/turno', 'mdi-timelapse', 'teal', 'Turno', '1', '17', null, '1', '1', '2020-09-02 15:08:33', '2020-09-02 15:08:33');
INSERT INTO `menu` VALUES ('22', 'Horas Academicas', '3', 'hora-academica', 'admin/hora-academica', 'mdi-clock', 'teal', 'HoraAcademica', '1', '18', null, '1', '1', '2020-09-02 15:08:33', '2020-09-02 15:08:33');
INSERT INTO `menu` VALUES ('24', 'Niveles', '3', 'nivel', 'admin/nivel', 'mdi-stairs-up', 'teal', 'Nivel', '1', '22', null, '1', '1', '2020-09-02 15:08:33', '2020-09-02 15:08:33');
INSERT INTO `menu` VALUES ('25', 'Grados', '3', 'grado', 'admin/grado', 'mdi-numeric', 'teal', 'Grado', '1', '23', null, '1', '1', '2020-09-02 15:08:33', '2020-09-02 15:08:33');
INSERT INTO `menu` VALUES ('26', 'Grupos', '3', 'grupo', 'admin/grupo', 'mdi-alphabetical-variant', 'teal', 'Grupo', '1', '24', null, '1', '1', '2020-09-02 15:08:33', '2020-09-02 15:08:33');
INSERT INTO `menu` VALUES ('27', 'Areas de Estudio', '3', 'area-estudio', 'admin/area-estudio', 'mdi-file-cad', 'teal', 'AreaEstudio', '1', '19', null, '1', '1', '2020-09-02 15:08:33', '2020-09-02 15:08:33');
INSERT INTO `menu` VALUES ('28', 'Materias', '3', 'materia', 'admin/materia', 'mdi-bookshelf', 'teal', 'Materia', '1', '20', null, '1', '1', '2020-09-02 15:08:33', '2020-09-02 15:08:33');
INSERT INTO `menu` VALUES ('29', 'Grado Materias', '3', 'grado-materia', 'admin/grado-materia', 'mdi-square-root', 'brown', 'GradoMateria', '2', '999', null, '2', '1', '2020-09-02 15:08:33', '2020-09-02 15:08:33');
INSERT INTO `menu` VALUES ('31', 'Nivel Calificaciones', '3', 'nivel-calificacion', 'admin/nivel-calificacion', 'mdi-check-box-multiple-outline', 'teal', 'NivelCalificacion', '1', '25', null, '1', '1', '2020-09-02 15:08:33', '2020-09-02 15:08:33');
INSERT INTO `menu` VALUES ('32', 'Calificacion', '3', 'calificacion', 'admin/calificacion', 'mdi-check-box-outline', 'teal', 'Calificacion', '1', '26', null, '1', '1', '2020-09-02 15:08:33', '2020-09-02 15:08:33');
INSERT INTO `menu` VALUES ('33', 'Tipo Evaluacion', '3', 'tipo-evaluacion', 'admin/tipo-evaluacion', 'mdi-clipboard-check-multiple-outline', 'brown', 'TipoEvaluacion', '1', '55', null, '1', '1', '2020-09-02 15:08:33', '2020-09-02 15:08:33');
INSERT INTO `menu` VALUES ('35', 'Plan Evaluacion', '3', 'plan-evaluacion', 'admin/plan-evaluacion', 'mdi-table-clock', 'purple', 'AppPlanEvaluacion', '1', '27', null, '1', '1', '2020-09-02 15:08:33', '2020-09-02 15:08:33');
INSERT INTO `menu` VALUES ('36', 'Horario', '3', 'horario', 'admin/horario', 'mdi-calendar-multiselect', 'purple', 'Horario', '1', '28', null, '1', '1', '2020-09-02 15:08:33', '2020-09-02 15:08:33');
INSERT INTO `menu` VALUES ('37', 'Docente', '3', 'docente', 'admin/docente', 'mdi-account-tie', 'teal', 'Docente', '1', '21', null, '1', '1', '2020-09-02 15:08:33', '2020-09-02 15:08:33');
INSERT INTO `menu` VALUES ('38', 'Condicion Alumno', '3', 'tipo-condicion', 'admin/tipo-condicion', 'mdi-school-outline', 'red', 'TipoCondicion', '1', '33', null, '1', '1', '2020-09-02 15:08:33', '2020-09-02 15:08:33');
INSERT INTO `menu` VALUES ('39', 'Alumnos', '3', 'alumno', 'admin/alumno', 'mdi-school', 'red', 'Alumno', '1', '34', null, '1', '1', '2020-09-02 15:08:33', '2020-09-02 15:08:33');
INSERT INTO `menu` VALUES ('40', 'Acudiente', '3', 'pariente', 'admin/pariente', 'mdi-human-male-child', 'red', 'Pariente', '1', '35', null, '1', '1', '2020-09-02 15:08:33', '2020-09-02 15:08:33');
INSERT INTO `menu` VALUES ('41', 'Tipo Faltas', '3', 'tipo-falta', 'admin/tipo-falta', 'mdi-account-alert-outline', 'deep-purple', 'TipoFalta', '1', '48', null, '1', '1', '2020-09-02 15:08:33', '2020-09-02 15:08:33');
INSERT INTO `menu` VALUES ('42', 'Tipo Sancion', '3', 'tipo-sancion', 'admin/tipo-sancion', 'mdi-gavel', 'deep-purple', 'TipoSancion', '1', '49', null, '1', '1', '2020-09-02 15:08:33', '2020-09-02 15:08:33');
INSERT INTO `menu` VALUES ('43', 'Asistente', '3', 'asistente', 'admin/asistente', 'mdi-head-cog', 'deep-purple', 'Asistente', '1', '75', null, '1', '1', '2020-09-02 15:08:33', '2020-09-02 15:08:33');
INSERT INTO `menu` VALUES ('44', 'Parentesco', '3', 'parentesco', 'admin/parentesco', 'mdi-account-supervisor-circle', 'brown', 'Parentesco', '1', '56', null, '1', '1', '2020-09-02 15:08:33', '2020-09-02 15:08:33');
INSERT INTO `menu` VALUES ('45', 'Estado Civil', '3', 'estado-civil', 'admin/estado-civil', 'mdi-ring', 'brown', 'EstadoCivil', '1', '57', null, '1', '1', '2020-09-02 15:08:33', '2020-09-02 15:08:33');
INSERT INTO `menu` VALUES ('46', 'Tipo Telefono', '3', 'tipoTelefono', 'admin/tipoTelefono', 'mdi-phone-log', 'brown', 'TipoTelefono', '1', '998', null, '2', '1', '2020-09-02 15:08:33', '2020-09-02 15:08:33');
INSERT INTO `menu` VALUES ('47', 'Pais', '3', 'pais', 'admin/pais', 'mdi-earth', 'deep-purple', 'Pais', '1', '50', null, '1', '1', '2020-09-02 15:08:33', '2020-09-02 15:08:33');
INSERT INTO `menu` VALUES ('48', 'Departamento', '3', 'departamento', 'admin/departamento', 'mdi-map-search', 'deep-purple', 'Departamento', '1', '51', null, '1', '1', '2020-09-02 15:08:33', '2020-09-02 15:08:33');
INSERT INTO `menu` VALUES ('49', 'Ciudad', '3', 'ciudad', 'admin/ciudad', 'mdi-city-variant', 'deep-purple', 'Ciudad', '1', '52', null, '1', '1', '2020-09-02 15:08:33', '2020-09-02 15:08:33');
INSERT INTO `menu` VALUES ('50', 'Zona', '3', 'zona', 'admin/zona', 'mdi-select-marker', 'deep-purple', 'Zona', '1', '53', null, '1', '1', '2020-09-02 15:08:33', '2020-09-02 15:08:33');
INSERT INTO `menu` VALUES ('51', 'Comuna', '3', 'comuna', 'admin/comuna', 'mdi-map-marker-radius', 'deep-purple', 'Comuna', '1', '54', null, '1', '1', '2020-09-02 15:08:33', '2020-09-02 15:08:33');
INSERT INTO `menu` VALUES ('52', 'Usuario', '3', 'usuario', 'admin/usuario', 'mdi-account', 'green', 'Usuario', '1', '36', null, '1', '1', '2020-09-02 15:08:33', '2020-09-02 15:08:33');
INSERT INTO `menu` VALUES ('53', 'Modulo', '3', 'modulo', 'admin/modulo', 'mdi-account-details-outline', 'brown', 'Modulo', '1', '58', null, '1', '1', '2020-09-02 15:08:33', '2020-09-02 15:08:33');
INSERT INTO `menu` VALUES ('54', 'Menu', '3', 'menu', 'admin/menu', 'mdi-account-details', 'brown', 'Menu', '1', '59', null, '1', '1', '2020-09-02 15:08:33', '2020-09-02 15:08:33');
INSERT INTO `menu` VALUES ('55', 'Tipo Usuario', '3', 'tipoUsuario', 'admin/tipoUsuario', 'mdi-book-account', 'brown', 'TipoUsuario', '1', '60', null, '1', '1', '2020-09-02 15:08:33', '2020-09-02 15:08:33');
INSERT INTO `menu` VALUES ('56', 'Perfil', '3', 'perfil', 'admin/perfil', 'mdi-account-lock-outline', 'brown', 'Perfil', '1', '38', null, '1', '1', '2020-09-02 15:08:33', '2020-09-02 15:08:33');
INSERT INTO `menu` VALUES ('57', 'Usuario Perfil', '3', 'usuario-perfil', 'admin/usuario-perfil', 'mdi-account-lock-outline', 'green', 'UsuarioPerfil', '1', '39', null, '1', '1', '2020-09-02 15:08:33', '2020-09-02 15:08:33');
INSERT INTO `menu` VALUES ('58', 'Permiso', '3', 'permiso', 'admin/permiso', 'mdi-account-lock', 'green', 'Permiso', '1', '40', null, '1', '1', '2020-09-02 15:08:33', '2020-09-02 15:08:33');
INSERT INTO `menu` VALUES ('59', 'Documento', '3', 'documento', 'admin/documento', 'mdi-card-account-details', 'brown', 'Documento', '1', '62', null, '1', '1', '2020-09-02 15:08:33', '2020-09-02 15:08:33');
INSERT INTO `menu` VALUES ('60', 'Foto', '3', 'foto', 'admin/foto', 'mdi-image', 'brown', 'Foto', '1', '64', null, '1', '1', '2020-09-02 15:08:33', '2020-09-02 15:08:33');
INSERT INTO `menu` VALUES ('61', 'Pago', '3', 'pago', 'admin/pago', 'mdi-credit-card-settings', 'brown', 'Pago', '1', '995', null, '1', '1', '2020-09-02 15:08:33', '2020-09-02 15:08:33');
INSERT INTO `menu` VALUES ('62', 'Tipo Contacto', '3', 'tipo-contacto', 'admin/tipo-contacto', 'mdi-contacts', 'brown', 'TipoContacto', '1', '997', null, '2', '1', '2020-09-02 15:08:33', '2020-09-02 15:08:33');
INSERT INTO `menu` VALUES ('63', 'Contacto', '3', 'contacto', 'admin/contacto', 'mdi-contacts', 'brown', 'Contacto', '1', '996', null, '1', '1', '2020-09-02 15:08:33', '2020-09-02 15:08:33');
INSERT INTO `menu` VALUES ('64', 'Status', '3', 'status', 'admin/status', 'mdi-playlist-check', 'brown', 'Status', '1', '65', null, '1', '1', '2020-09-02 15:08:33', '2020-09-02 15:08:33');
INSERT INTO `menu` VALUES ('65', 'Suscripcion', '3', 'suscripcion', 'admin/suscripcion', 'mdi-file-document-edit', 'brown', 'Suscripcion', '1', '65', null, '1', '1', '2020-09-02 15:08:33', '2020-09-02 15:08:33');
INSERT INTO `menu` VALUES ('66', 'Telefono', '3', 'telefono', 'admin/telefono', 'mdi-phone', 'brown', 'Telefono', '1', '66', null, '1', '1', '2020-09-02 15:08:33', '2020-09-02 15:08:33');
INSERT INTO `menu` VALUES ('67', 'Tipo Foto', '3', 'tipoFoto', 'admin/tipoFoto', 'mdi-image-album', 'brown', 'TipoFoto', '1', '63', null, '1', '1', '2020-09-02 15:08:33', '2020-09-02 15:08:33');
INSERT INTO `menu` VALUES ('68', 'Tipo Pago', '3', 'tipoPago', 'admin/tipoPago', 'mdi-credit-card-multiple', 'brown', 'TipoPago', '1', '68', null, '1', '1', '2020-09-02 15:08:33', '2020-09-02 15:08:33');
INSERT INTO `menu` VALUES ('69', 'Tipo Documento', '3', 'tipo-documento', 'admin/tipo-documento', 'mdi-card-account-details', 'brown', 'TipoDocumento', '1', '61', null, '1', '1', '2020-09-02 15:08:33', '2020-09-02 15:08:33');
INSERT INTO `menu` VALUES ('70', 'Tipo Archivo', '3', 'tipo-archivo', 'admin/tipo-archivo', 'mdi-file-multiple', 'brown', 'TipoArchivo', '1', '66', null, '1', '1', '2020-09-02 15:08:33', '2020-09-02 15:08:33');
INSERT INTO `menu` VALUES ('71', 'Archivo', '3', 'archivo', 'admin/archivo', 'mdi-file', 'brown', 'Archivo', '1', '67', null, '1', '1', '2020-09-02 15:08:33', '2020-09-02 15:08:33');
INSERT INTO `menu` VALUES ('72', 'Tipo Recurso', '3', 'tipo-recurso', 'admin/tipo-recurso', 'mdi-book-open-page-variant', 'brown', 'TipoRecurso', '1', '68', null, '1', '1', '2020-09-02 15:08:33', '2020-09-02 15:08:33');
INSERT INTO `menu` VALUES ('73', 'Recurso', '3', 'recurso', 'admin/recurso', 'mdi-book-open-page-variant', 'brown', 'Recurso', '1', '69', null, '1', '1', '2020-09-02 15:08:33', '2020-09-02 15:08:33');
INSERT INTO `menu` VALUES ('74', 'Tipo Destinatario', '3', 'tipo-destinatario', 'admin/tipo-destinatario', 'mdi-account-question', 'brown', 'TipoDestinatario', '1', '70', null, '1', '1', '2020-09-02 15:08:33', '2020-09-02 15:08:33');
INSERT INTO `menu` VALUES ('75', 'Prioridad', '3', 'tipo-prioridad', 'admin/tipo-prioridad', 'mdi-alert', 'brown', 'TipoPrioridad', '1', '71', null, '1', '1', '2020-09-02 15:08:33', '2020-09-02 15:08:33');
INSERT INTO `menu` VALUES ('76', 'Tipo Notificacion', '3', 'tipo-notificacion', 'admin/tipo-notificacion', 'mdi-bell-outline', 'deep-purple', 'TipoNotificacion', '1', '72', null, '1', '1', '2020-09-02 15:08:33', '2020-09-02 15:08:33');
INSERT INTO `menu` VALUES ('77', 'Notificaciones', '3', 'notificacion', 'admin/notificacion', 'mdi-bell', 'deep-purple', 'Notificacion', '1', '73', null, '1', '1', '2020-09-02 15:08:33', '2020-09-02 15:08:33');
INSERT INTO `menu` VALUES ('78', 'Tipo Preguntas', '3', 'tipo-pregunta', 'admin/tipo-pregunta', 'mdi-order-bool-descending-variant', 'brown', 'TipoPregunta', '1', '43', null, '1', '1', '2020-09-02 15:08:33', '2020-09-02 15:08:33');
INSERT INTO `menu` VALUES ('79', 'Prueba', '3', 'prueba', 'admin/prueba', 'mdi-order-bool-descending-variant', 'deep-purple', 'Prueba', '1', '42', null, '1', '1', '2020-09-02 15:08:33', '2020-09-02 15:08:33');
INSERT INTO `menu` VALUES ('80', 'Pregunta', '3', 'pregunta', 'admin/pregunta', 'mdi-order-bool-descending-variant', 'deep-purple', 'Pregunta', '1', '44', null, '1', '1', '2020-09-02 15:08:33', '2020-09-02 15:08:33');
INSERT INTO `menu` VALUES ('81', 'Respuesta', '3', 'respuesta', 'admin/respuesta', 'mdi-order-bool-descending-variant', 'deep-purple', 'Respuesta', '1', '45', null, '1', '1', '2020-09-02 15:08:33', '2020-09-02 15:08:33');
INSERT INTO `menu` VALUES ('82', 'Prueba Alumno', '3', 'prueba-alumno', 'admin/prueba-alumno', 'mdi-order-bool-descending-variant', 'deep-purple', 'PruebaAlumno', '1', '46', null, '1', '1', '2020-09-02 15:08:33', '2020-09-02 15:08:33');
INSERT INTO `menu` VALUES ('83', 'Respuesta Alumno', '3', 'respuesta-alumno', 'admin/respuesta-alumno', 'mdi-order-bool-descending-variant', 'deep-purple', 'RespuestaAlumno', '1', '47', null, '1', '1', '2020-09-02 15:08:33', '2020-09-02 15:08:33');
INSERT INTO `menu` VALUES ('84', 'Configuracion', '2', 'configuracion', 'admin/configuracion', 'mdi-cogs', 'brown', 'Configuracion', '1', '84', null, '1', '1', '2020-09-02 15:08:33', '2020-09-02 15:08:33');
INSERT INTO `menu` VALUES ('85', 'Clase Docente', '3', 'meet-docente', 'admin/meet-docente', 'mdi-google-classroom', 'black', 'MeetDocente', '1', '85', null, '1', '1', '2020-09-02 15:08:33', '2020-09-02 15:08:33');
INSERT INTO `menu` VALUES ('86', 'Clase Alumno', '3', 'meet-alumno', 'admin/meet-alumno', 'mdi-google-classroom', 'black', 'MeetAlumno', '1', '86', null, '1', '1', '2020-09-02 15:08:33', '2020-09-02 15:08:33');
INSERT INTO `menu` VALUES ('87', 'Reporte', '3', 'reporte', 'admin/reporte', 'mdi-table-large', 'black', 'AppReporte', '1', '87', null, '1', '1', '2020-09-02 15:08:33', '2020-09-02 15:08:33');
INSERT INTO `menu` VALUES ('88', 'Generador', '2', 'crud', '/crud', 'mdi-factory', 'black', 'Crud', '1', '88', null, '1', '1', '2020-09-02 15:08:33', '2020-09-02 15:08:33');
INSERT INTO `menu` VALUES ('89', 'Login', '8', 'login', '/login', 'mdi-account-key', 'black', 'Login', '1', '89', null, '1', '1', '2020-09-02 15:08:33', '2020-09-02 15:08:33');
INSERT INTO `menu` VALUES ('90', 'Not Found', '8', 'notfound', '*', 'mdi-monitor-off', 'black', 'PageNotFound', '1', '1000', 'Pagina no Encontrada', '1', '1', '2020-09-02 15:08:33', '2020-09-02 15:08:33');
INSERT INTO `menu` VALUES ('91', 'Tema', '3', 'tema', 'admin/tema', 'mdi-card-text', 'purple', 'Tema', '1', '27', null, '1', '1', '2020-09-02 15:08:33', '2020-09-02 15:08:33');
INSERT INTO `menu` VALUES ('92', 'Mensaje', '3', 'mensaje', 'admin/mensaje', 'mdi-email', 'deep-purple', 'Mensaje', '1', '74', null, '1', '1', '2020-09-02 15:08:33', '2020-09-02 15:08:33');
INSERT INTO `menu` VALUES ('93', 'Tipo Enlace', '3', 'tipo-enlace', 'admin/tipo-enlace', 'mdi-link-variant-plus', 'brow', 'TipoEnlace', '1', '76', null, '1', '1', '2020-09-02 15:08:33', '2020-09-02 15:08:33');
INSERT INTO `menu` VALUES ('94', 'Enlace', '3', 'enlace', 'admin/enlace', 'mdi-link-variant', 'deep-purple', 'Enlace', '1', '77', null, '1', '1', '2020-09-02 15:08:33', '2020-09-02 15:08:33');
INSERT INTO `menu` VALUES ('95', 'Libro', '3', 'libro', 'admin/libro', 'mdi-book', 'brow', 'Libro', '1', '78', null, '1', '1', '2020-09-02 15:08:33', '2020-09-02 15:08:33');
INSERT INTO `menu` VALUES ('96', 'Pagina', '3', 'pagina', 'admin/pagina', 'mdi-file-document', 'brow', 'Pagina', '1', '79', null, '1', '1', '2020-09-02 15:08:33', '2020-09-02 15:08:33');
INSERT INTO `menu` VALUES ('97', 'Actividad', '3', 'actividad', 'admin/actividad', 'mdi-rocket', 'deep-purple', 'Actividad', '1', '80', null, '1', '1', '2020-09-02 15:08:33', '2020-09-02 15:08:33');
INSERT INTO `menu` VALUES ('98', 'Tipo Tarea', '3', 'tipo-tarea', 'admin/tipo-tarea', 'mdi-notebook-multiple', 'deep-purple', 'TipoTarea', '1', '42', null, '1', '1', '2020-09-02 15:08:33', '2020-09-02 15:08:33');

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=183 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
INSERT INTO `migrations` VALUES ('181', '2020_11_26_232639_create_jobs_table', '84');
INSERT INTO `migrations` VALUES ('182', '0000_00_00_000000_create_websockets_statistics_entries_table', '85');

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
  `id_status` int(11) unsigned NOT NULL,
  `id_usuario` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_modulo_status` (`id_status`),
  KEY `fk_modulo_usuario` (`id_usuario`),
  CONSTRAINT `fk_modulo_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`),
  CONSTRAINT `fk_modulo_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of modulo
-- ----------------------------
INSERT INTO `modulo` VALUES ('1', 'Bandeja Docente', 'ppal', '4', null, '1', '1', '2020-06-06 18:42:15', '2020-06-06 18:42:15');
INSERT INTO `modulo` VALUES ('2', 'Administrador', 'ppal', '1', null, '1', '1', '2020-06-06 18:42:15', '2020-06-06 18:42:15');
INSERT INTO `modulo` VALUES ('3', 'Secretaria', 'ppal', '2', null, '1', '1', '2020-06-06 18:42:15', '2020-06-06 18:42:15');
INSERT INTO `modulo` VALUES ('4', 'Bandeja Acudiente', 'ppal', '3', null, '1', '1', '2020-06-06 18:42:15', '2020-06-06 18:42:15');
INSERT INTO `modulo` VALUES ('5', 'Bandeja Alumno', 'ppal', '5', null, '1', '1', '2020-06-06 18:42:15', '2020-06-06 18:42:15');
INSERT INTO `modulo` VALUES ('6', 'Bandeja Empleado', 'ppal', '6', null, '1', '1', '2020-06-06 18:42:15', '2020-06-06 18:42:15');
INSERT INTO `modulo` VALUES ('7', 'Gestion Usuario', 'ppal', '7', null, '1', '1', '2020-06-06 18:42:15', '2020-06-06 18:42:15');
INSERT INTO `modulo` VALUES ('8', 'General', 'ppal', '8', null, '1', '1', '2020-06-06 18:42:15', '2020-06-06 18:42:15');

-- ----------------------------
-- Table structure for multimedia
-- ----------------------------
DROP TABLE IF EXISTS `multimedia`;
CREATE TABLE `multimedia` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_tipo_recurso` int(11) unsigned NOT NULL,
  `id_grado` int(11) unsigned NOT NULL,
  `id_grupo` int(11) unsigned NOT NULL,
  `tx_observaciones` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) unsigned NOT NULL,
  `id_usuario` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_multimedia_tipo_recurso` (`id_tipo_recurso`),
  KEY `fk_multimedia_grado` (`id_grado`),
  KEY `fk_multimedia_grupo` (`id_grupo`),
  KEY `fk_multimedia_status` (`id_status`),
  KEY `fk_multimedia_usuario` (`id_usuario`),
  CONSTRAINT `fk_multimedia_grado` FOREIGN KEY (`id_grado`) REFERENCES `grado` (`id`),
  CONSTRAINT `fk_multimedia_grupo` FOREIGN KEY (`id_grupo`) REFERENCES `grupo` (`id`),
  CONSTRAINT `fk_multimedia_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`),
  CONSTRAINT `fk_multimedia_tipo_recurso` FOREIGN KEY (`id_tipo_recurso`) REFERENCES `tipo_recurso` (`id`),
  CONSTRAINT `fk_multimedia_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of multimedia
-- ----------------------------

-- ----------------------------
-- Table structure for nivel
-- ----------------------------
DROP TABLE IF EXISTS `nivel`;
CREATE TABLE `nivel` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_nivel` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) unsigned NOT NULL,
  `id_usuario` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_nivel_status` (`id_status`),
  KEY `fk_nivel_usuario` (`id_usuario`),
  CONSTRAINT `fk_nivel_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`),
  CONSTRAINT `fk_nivel_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of nivel
-- ----------------------------
INSERT INTO `nivel` VALUES ('1', 'Preescolar', null, '1', '1', '2020-05-08 19:05:25', '2020-05-11 18:57:44');
INSERT INTO `nivel` VALUES ('2', 'Primaria', null, '1', '1', '2020-05-08 19:05:36', '2020-05-08 19:05:36');
INSERT INTO `nivel` VALUES ('3', 'Bachiller', null, '1', '1', '2020-05-08 19:05:47', '2020-05-08 19:05:47');
INSERT INTO `nivel` VALUES ('4', 'Educación Media', null, '1', '1', '2021-03-12 01:47:23', '2021-03-12 01:47:23');
INSERT INTO `nivel` VALUES ('5', 'Educación Superior', null, '1', '1', '2021-03-12 01:47:41', '2021-03-12 01:47:41');

-- ----------------------------
-- Table structure for nivel_calificacion
-- ----------------------------
DROP TABLE IF EXISTS `nivel_calificacion`;
CREATE TABLE `nivel_calificacion` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_nivel_calificacion` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) unsigned NOT NULL,
  `id_usuario` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_nivel_calificacion_status` (`id_status`),
  KEY `fk_nivel_calificacion_usuario` (`id_usuario`),
  CONSTRAINT `fk_nivel_calificacion_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`),
  CONSTRAINT `fk_nivel_calificacion_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of nivel_calificacion
-- ----------------------------
INSERT INTO `nivel_calificacion` VALUES ('1', 'Desempeño Bajo', null, '1', '1', '2020-09-19 17:34:07', '2020-09-19 17:34:07');
INSERT INTO `nivel_calificacion` VALUES ('2', 'Desempeño Básico', null, '1', '1', '2020-09-19 17:34:23', '2020-09-19 17:34:23');
INSERT INTO `nivel_calificacion` VALUES ('3', 'Desempeño Alto', null, '1', '1', '2020-09-19 17:34:43', '2020-09-19 17:34:43');
INSERT INTO `nivel_calificacion` VALUES ('4', 'Desempeño Superior', null, '1', '1', '2020-09-19 17:40:20', '2020-09-19 17:40:20');

-- ----------------------------
-- Table structure for notificacion
-- ----------------------------
DROP TABLE IF EXISTS `notificacion`;
CREATE TABLE `notificacion` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_tipo_destinatario` int(11) unsigned NOT NULL,
  `id_destinatario` int(11) unsigned NOT NULL,
  `tx_mensaje` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_tipo_notificacion` int(11) unsigned NOT NULL,
  `fe_notificacion` date NOT NULL,
  `fe_lectura` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `id_status` int(11) unsigned NOT NULL,
  `id_usuario` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_notificacion_tipo_destinatario` (`id_tipo_destinatario`),
  KEY `fk_notificacion_destinatario` (`id_destinatario`),
  KEY `fk_notificacion_tipo_notificacion` (`id_tipo_notificacion`),
  KEY `fk_notificacion_status` (`id_status`),
  KEY `fk_notificacion_usuario` (`id_usuario`),
  CONSTRAINT `fk_notificacion_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`),
  CONSTRAINT `fk_notificacion_tipo_destinatario` FOREIGN KEY (`id_tipo_destinatario`) REFERENCES `tipo_destinatario` (`id`),
  CONSTRAINT `fk_notificacion_tipo_notificacion` FOREIGN KEY (`id_tipo_notificacion`) REFERENCES `tipo_notificacion` (`id`),
  CONSTRAINT `fk_notificacion_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of notificacion
-- ----------------------------
INSERT INTO `notificacion` VALUES ('1', '3', '1', 'Inicio de Clase Materia: Bilingüismo Social', '5', '2021-04-02', null, '1', '1', '2021-04-02 17:08:04', '2021-04-02 17:08:04');
INSERT INTO `notificacion` VALUES ('2', '3', '1', 'Inicio de Clase Materia: Bilingüismo Social', '5', '2021-04-02', null, '1', '1', '2021-04-02 17:32:59', '2021-04-02 17:32:59');
INSERT INTO `notificacion` VALUES ('3', '3', '1', 'Inicio de Clase Materia: Bilingüismo Social', '5', '2021-04-02', null, '1', '1', '2021-04-02 17:35:36', '2021-04-02 17:35:36');
INSERT INTO `notificacion` VALUES ('4', '3', '1', 'Inicio de Clase Materia: Bilingüismo Social', '5', '2021-04-06', null, '1', '1', '2021-04-06 15:26:20', '2021-04-06 15:26:20');
INSERT INTO `notificacion` VALUES ('5', '3', '1', 'Nuevo Cuestionario  Materia: Bilingüismo Social', '7', '2021-04-06', null, '1', '1', '2021-04-06 19:17:11', '2021-04-06 19:17:11');
INSERT INTO `notificacion` VALUES ('6', '3', '1', 'Nuevo Cuestionario  Materia: Bilingüismo Social', '7', '2021-04-06', null, '1', '1', '2021-04-06 19:18:02', '2021-04-06 19:18:02');
INSERT INTO `notificacion` VALUES ('7', '3', '1', 'Nueva Tarea Materia: Bilingüismo Social ', '8', '2021-04-06', null, '1', '1', '2021-04-06 20:36:01', '2021-04-06 20:36:01');
INSERT INTO `notificacion` VALUES ('9', '3', '0', 'Nueva Tarea Materia: Bilingüismo Social ', '8', '2021-04-06', null, '1', '1', '2021-04-06 20:38:15', '2021-04-06 20:38:15');
INSERT INTO `notificacion` VALUES ('10', '3', '0', 'Nueva Tarea Materia: Bilingüismo Social ', '8', '2021-04-06', null, '1', '1', '2021-04-06 20:38:41', '2021-04-06 20:38:41');
INSERT INTO `notificacion` VALUES ('11', '3', '0', 'Nueva Tarea Materia: Bilingüismo Social ', '8', '2021-04-06', null, '1', '1', '2021-04-06 20:42:21', '2021-04-06 20:42:21');
INSERT INTO `notificacion` VALUES ('12', '3', '0', 'Nueva Tarea Materia: Bilingüismo Social ', '8', '2021-04-06', null, '1', '1', '2021-04-06 20:42:58', '2021-04-06 20:42:58');
INSERT INTO `notificacion` VALUES ('13', '3', '0', 'Nueva Tarea Materia: Bilingüismo Social ', '8', '2021-04-06', null, '1', '1', '2021-04-06 21:51:25', '2021-04-06 21:51:25');
INSERT INTO `notificacion` VALUES ('14', '3', '0', 'Nueva Tarea Materia: Bilingüismo Social ', '8', '2021-04-06', null, '1', '1', '2021-04-06 21:51:36', '2021-04-06 21:51:36');
INSERT INTO `notificacion` VALUES ('15', '3', '1', 'Inicio de Clase Materia: Inmersión Ingles', '5', '2021-04-06', null, '1', '1', '2021-04-06 22:51:27', '2021-04-06 22:51:27');
INSERT INTO `notificacion` VALUES ('16', '4', '1', 'Se ha levantado una sancional al alumno Yustiz T. Jean P.', '4', '2021-04-06', null, '1', '1', '2021-04-06 22:52:10', '2021-04-06 22:52:10');
INSERT INTO `notificacion` VALUES ('17', '4', '1', 'Se ha levantado una sancional al alumno Yustiz T. Jean P.', '4', '2021-04-06', null, '1', '1', '2021-04-06 22:52:33', '2021-04-06 22:52:33');
INSERT INTO `notificacion` VALUES ('18', '3', '1', 'fdfsfsdf', '9', '2021-04-06', null, '1', '1', '2021-04-06 00:00:00', null);

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
-- Table structure for pagina
-- ----------------------------
DROP TABLE IF EXISTS `pagina`;
CREATE TABLE `pagina` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_pagina` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_libro` int(11) unsigned NOT NULL,
  `id_tema` int(11) unsigned NOT NULL,
  `nu_pagina` int(11) NOT NULL,
  `tx_path` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tx_observaciones` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) unsigned NOT NULL,
  `id_usuario` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pagina_libro` (`id_libro`),
  KEY `fk_pagina_tema` (`id_tema`),
  KEY `fk_pagina_status` (`id_status`),
  KEY `fk_pagina_usuario` (`id_usuario`),
  CONSTRAINT `fk_pagina_libro` FOREIGN KEY (`id_libro`) REFERENCES `libro` (`id`),
  CONSTRAINT `fk_pagina_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`),
  CONSTRAINT `fk_pagina_tema` FOREIGN KEY (`id_tema`) REFERENCES `tema` (`id`),
  CONSTRAINT `fk_pagina_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=227 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of pagina
-- ----------------------------
INSERT INTO `pagina` VALUES ('1', 'pagina1', '1', '1', '1', 'CS_G1_001.jpg', '', '1', '1', '2020-10-06 14:33:01', '2020-10-06 14:33:01');
INSERT INTO `pagina` VALUES ('2', 'pagina2', '1', '1', '2', 'CS_G1_002.jpg', '', '1', '1', '2020-10-06 15:23:19', '2020-10-07 20:34:54');
INSERT INTO `pagina` VALUES ('3', 'pagina3', '1', '1', '3', 'CS_G1_003.jpg', '', '1', '1', '2020-10-07 20:34:41', '2020-10-07 20:37:12');
INSERT INTO `pagina` VALUES ('4', 'pagina4', '1', '1', '4', 'CS_G1_004.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('5', 'pagina5', '1', '1', '5', 'CS_G1_005.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('6', 'pagina6', '1', '1', '6', 'CS_G1_006.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('7', 'pagina7', '1', '1', '7', 'CS_G1_007.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('8', 'pagina8', '1', '1', '8', 'CS_G1_008.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('9', 'pagina9', '1', '1', '9', 'CS_G1_009.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('10', 'pagina10', '1', '1', '10', 'CS_G1_010.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('11', 'pagina1', '2', '1', '1', 'MT_G1_001.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('12', 'pagina2', '2', '1', '2', 'MT_G1_002.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('13', 'pagina3', '2', '1', '3', 'MT_G1_003.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('14', 'pagina4', '2', '1', '4', 'MT_G1_004.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('15', 'pagina1', '3', '1', '1', 'LG_G1_001.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('16', 'pagina2', '3', '1', '2', 'LG_G1_002.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('17', 'pagina3', '3', '1', '3', 'LG_G1_003.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('18', 'pagina4', '3', '1', '4', 'LG_G1_004.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('19', 'pagina1', '4', '1', '1', 'CN_G1_001.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('20', 'pagina2', '4', '1', '2', 'CN_G1_002.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('21', 'pagina3', '4', '1', '3', 'CN_G1_003.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');

-- ----------------------------
-- Table structure for pago
-- ----------------------------
DROP TABLE IF EXISTS `pago`;
CREATE TABLE `pago` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_suscripcion` int(11) unsigned NOT NULL,
  `mo_pago` decimal(9,2) NOT NULL,
  `id_tipo_pago` int(11) unsigned NOT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) unsigned NOT NULL,
  `id_usuario` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pago_suscripcion` (`id_suscripcion`),
  KEY `fk_pago_tipo_pago` (`id_tipo_pago`),
  KEY `fk_pago_status` (`id_status`),
  KEY `fk_pago_usuario` (`id_usuario`),
  CONSTRAINT `fk_pago_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`),
  CONSTRAINT `fk_pago_suscripcion` FOREIGN KEY (`id_suscripcion`) REFERENCES `suscripcion` (`id`),
  CONSTRAINT `fk_pago_tipo_pago` FOREIGN KEY (`id_tipo_pago`) REFERENCES `tipo_pago` (`id`),
  CONSTRAINT `fk_pago_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
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
  `id_status` int(11) unsigned NOT NULL,
  `id_usuario` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pais_nb_pais_unique` (`nb_pais`),
  UNIQUE KEY `pais_co_pais_unique` (`co_pais`),
  KEY `fk_pais_status` (`id_status`),
  KEY `fk_pais_usuario` (`id_usuario`),
  CONSTRAINT `fk_pais_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`),
  CONSTRAINT `fk_pais_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
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
  `id_status` int(11) unsigned NOT NULL,
  `id_usuario` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_parentesco_status` (`id_status`),
  KEY `fk_parentesco_usuario` (`id_usuario`),
  CONSTRAINT `fk_parentesco_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`),
  CONSTRAINT `fk_parentesco_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
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
  `id_tipo_documento` int(11) unsigned NOT NULL,
  `tx_documento` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT '1',
  `tx_sexo` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fe_nacimiento` date NOT NULL,
  `tx_nacionalidad` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tx_lugar_nacimiento` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_parentesco` int(11) unsigned NOT NULL,
  `id_estado_civil` int(11) unsigned NOT NULL DEFAULT 1,
  `tx_empresa` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_cargo` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_ocupacion` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_telefono` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_telefono2` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_telefono3` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) unsigned NOT NULL,
  `id_usuario` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pariente_parentesco` (`id_parentesco`),
  KEY `fk_pariente_estado_civil` (`id_estado_civil`),
  KEY `fk_pariente_status` (`id_status`),
  KEY `fk_pariente_usuario` (`id_usuario`),
  CONSTRAINT `fk_pariente_estado_civil` FOREIGN KEY (`id_estado_civil`) REFERENCES `estado_civil` (`id`),
  CONSTRAINT `fk_pariente_parentesco` FOREIGN KEY (`id_parentesco`) REFERENCES `parentesco` (`id`),
  CONSTRAINT `fk_pariente_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`),
  CONSTRAINT `fk_pariente_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of pariente
-- ----------------------------
INSERT INTO `pariente` VALUES ('1', 'Yustiz', 'Yustiz', 'Hector', 'Ramon', '0', '4195948', 'M', '1950-02-16', 'Venezolano', null, '1', '1', 'sin empresa', 'sin cargo', 'chofer', '5352354', '5345234', '5345325', '0', null, '1', '1', '2020-05-25 19:40:07', '2020-07-25 23:47:49');

-- ----------------------------
-- Table structure for perfil
-- ----------------------------
DROP TABLE IF EXISTS `perfil`;
CREATE TABLE `perfil` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_perfil` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tx_icono` varchar(35) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) unsigned NOT NULL,
  `id_usuario` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_perfil_status` (`id_status`),
  KEY `fk_perfil_usuario` (`id_usuario`),
  CONSTRAINT `fk_perfil_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`),
  CONSTRAINT `fk_perfil_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of perfil
-- ----------------------------
INSERT INTO `perfil` VALUES ('1', 'secretaria', 'mdi-chair-rolling', null, '1', '1', '2020-06-06 19:02:17', '2020-06-06 19:02:17');
INSERT INTO `perfil` VALUES ('2', 'docente', 'mdi-account-tie', null, '1', '1', '2020-06-06 19:02:39', '2020-06-06 19:02:39');
INSERT INTO `perfil` VALUES ('3', 'alumno', 'mdi-school', null, '1', '1', '2020-06-06 19:02:50', '2020-06-06 19:03:36');
INSERT INTO `perfil` VALUES ('4', 'acudiente', 'mdi-human-male-child', null, '1', '1', '2020-06-06 19:03:04', '2020-06-06 19:03:41');
INSERT INTO `perfil` VALUES ('5', 'empleado', 'mdi-badge-account', null, '1', '1', null, null);
INSERT INTO `perfil` VALUES ('6', 'administrador', null, null, '2', '1', '2020-09-02 15:27:23', '2020-09-27 14:48:27');
INSERT INTO `perfil` VALUES ('7', 'administrador colegio', null, null, '2', '1', '2020-09-02 15:28:15', '2020-09-02 15:28:15');

-- ----------------------------
-- Table structure for periodo
-- ----------------------------
DROP TABLE IF EXISTS `periodo`;
CREATE TABLE `periodo` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_periodo` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `nu_periodo` int(11) NOT NULL,
  `id_calendario` int(11) unsigned NOT NULL,
  `fe_inicio` date NOT NULL,
  `fe_fin` date NOT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) unsigned NOT NULL,
  `id_usuario` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_periodo_calendario` (`id_calendario`),
  KEY `fk_periodo_status` (`id_status`),
  KEY `fk_periodo_usuario` (`id_usuario`),
  CONSTRAINT `fk_periodo_calendario` FOREIGN KEY (`id_calendario`) REFERENCES `calendario` (`id`),
  CONSTRAINT `fk_periodo_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`),
  CONSTRAINT `fk_periodo_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of periodo
-- ----------------------------
INSERT INTO `periodo` VALUES ('1', '2021 I', '1', '1', '2021-03-11', '2021-05-01', null, '1', '1', '2021-03-12 00:45:36', '2021-04-07 00:40:50');
INSERT INTO `periodo` VALUES ('2', '2021 II', '2', '1', '2021-05-02', '2021-07-01', null, '2', '1', '2021-03-12 00:46:11', '2021-03-12 01:00:18');
INSERT INTO `periodo` VALUES ('3', '2021 III', '3', '1', '2021-07-02', '2021-09-01', null, '2', '1', '2021-03-12 00:46:48', '2021-03-12 01:00:45');
INSERT INTO `periodo` VALUES ('4', '2021 IV', '4', '1', '2021-09-02', '2021-11-30', null, '2', '1', '2021-03-12 00:47:47', '2021-03-12 01:01:10');
INSERT INTO `periodo` VALUES ('5', '2022 I', '1', '2', '2022-01-01', '2022-03-01', null, '2', '1', '2021-03-12 00:56:15', '2021-03-12 00:56:56');
INSERT INTO `periodo` VALUES ('6', '2022 II', '2', '2', '2022-03-02', '2022-06-01', null, '2', '1', '2021-03-12 00:56:56', '2021-03-12 00:58:02');
INSERT INTO `periodo` VALUES ('7', '2022 III', '3', '2', '2022-06-02', '2022-09-01', null, '2', '1', '2021-03-12 00:58:01', '2021-03-12 00:58:36');
INSERT INTO `periodo` VALUES ('8', '2022 IV', '4', '2', '2022-09-02', '2022-12-01', null, '2', '1', '2021-03-12 00:58:36', '2021-04-07 00:40:50');

-- ----------------------------
-- Table structure for permiso
-- ----------------------------
DROP TABLE IF EXISTS `permiso`;
CREATE TABLE `permiso` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_menu` int(11) unsigned NOT NULL,
  `id_perfil` int(11) unsigned NOT NULL,
  `bo_select` tinyint(1) NOT NULL,
  `bo_insert` tinyint(1) NOT NULL,
  `bo_update` tinyint(1) NOT NULL,
  `bo_delete` tinyint(1) NOT NULL,
  `bo_admin` tinyint(1) NOT NULL,
  `bo_default` tinyint(1) NOT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) unsigned NOT NULL,
  `id_usuario` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_permiso_menu` (`id_menu`),
  KEY `fk_permiso_perfil` (`id_perfil`),
  KEY `fk_permiso_status` (`id_status`),
  KEY `fk_permiso_usuario` (`id_usuario`),
  CONSTRAINT `fk_permiso_menu` FOREIGN KEY (`id_menu`) REFERENCES `menu` (`id`),
  CONSTRAINT `fk_permiso_perfil` FOREIGN KEY (`id_perfil`) REFERENCES `perfil` (`id`),
  CONSTRAINT `fk_permiso_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`),
  CONSTRAINT `fk_permiso_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
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
  `id_plan_evaluacion` int(11) unsigned NOT NULL,
  `tx_origen` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_origen` int(11) unsigned NOT NULL,
  `nu_peso` int(11) DEFAULT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) unsigned NOT NULL,
  `id_usuario` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_plan_detalle_plan_evaluacion` (`id_plan_evaluacion`),
  KEY `fk_plan_detalle_status` (`id_status`),
  KEY `fk_plan_detalle_usuario` (`id_usuario`),
  CONSTRAINT `fk_plan_detalle_plan_evaluacion` FOREIGN KEY (`id_plan_evaluacion`) REFERENCES `plan_evaluacion` (`id`),
  CONSTRAINT `fk_plan_detalle_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`),
  CONSTRAINT `fk_plan_detalle_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of plan_detalle
-- ----------------------------

-- ----------------------------
-- Table structure for plan_evaluacion
-- ----------------------------
DROP TABLE IF EXISTS `plan_evaluacion`;
CREATE TABLE `plan_evaluacion` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_grupo` int(11) unsigned NOT NULL,
  `id_periodo` int(11) unsigned NOT NULL,
  `id_materia` int(11) unsigned NOT NULL,
  `id_docente` int(11) unsigned NOT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) unsigned NOT NULL,
  `id_usuario` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_plan_evaluacion_grupo` (`id_grupo`),
  KEY `fk_plan_evaluacion_periodo` (`id_periodo`),
  KEY `fk_plan_evaluacion_materia` (`id_materia`),
  KEY `fk_plan_evaluacion_docente` (`id_docente`),
  KEY `fk_plan_evaluacion_status` (`id_status`),
  KEY `fk_plan_evaluacion_usuario` (`id_usuario`),
  CONSTRAINT `fk_plan_evaluacion_docente` FOREIGN KEY (`id_docente`) REFERENCES `docente` (`id`),
  CONSTRAINT `fk_plan_evaluacion_grupo` FOREIGN KEY (`id_grupo`) REFERENCES `grupo` (`id`),
  CONSTRAINT `fk_plan_evaluacion_materia` FOREIGN KEY (`id_materia`) REFERENCES `materia` (`id`),
  CONSTRAINT `fk_plan_evaluacion_periodo` FOREIGN KEY (`id_periodo`) REFERENCES `periodo` (`id`),
  CONSTRAINT `fk_plan_evaluacion_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`),
  CONSTRAINT `fk_plan_evaluacion_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of plan_evaluacion
-- ----------------------------

-- ----------------------------
-- Table structure for plan_plantilla
-- ----------------------------
DROP TABLE IF EXISTS `plan_plantilla`;
CREATE TABLE `plan_plantilla` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tx_origen` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_origen` int(11) unsigned NOT NULL,
  `nu_peso` int(11) DEFAULT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) unsigned NOT NULL,
  `id_usuario` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_plan_plantilla_status` (`id_status`),
  KEY `fk_plan_plantilla_usuario` (`id_usuario`),
  CONSTRAINT `fk_plan_plantilla_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`),
  CONSTRAINT `fk_plan_plantilla_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of plan_plantilla
-- ----------------------------
INSERT INTO `plan_plantilla` VALUES ('1', 'tipo_evaluacion', '1', '30', null, '1', '1', null, null);
INSERT INTO `plan_plantilla` VALUES ('2', 'tipo_evaluacion', '2', '30', null, '1', '1', null, null);
INSERT INTO `plan_plantilla` VALUES ('3', 'tipo_evaluacion', '3', '10', null, '1', '1', null, null);
INSERT INTO `plan_plantilla` VALUES ('4', 'tipo_evaluacion', '4', '5', null, '1', '1', null, null);
INSERT INTO `plan_plantilla` VALUES ('5', 'tipo_evaluacion', '5', '5', null, '1', '1', null, null);
INSERT INTO `plan_plantilla` VALUES ('6', 'tipo_evaluacion', '6', '5', null, '1', '1', null, null);
INSERT INTO `plan_plantilla` VALUES ('7', 'tipo_evaluacion', '7', '5', null, '1', '1', null, null);
INSERT INTO `plan_plantilla` VALUES ('8', 'tipo_evaluacion', '8', '10', null, '1', '1', null, null);

-- ----------------------------
-- Table structure for plan_tema
-- ----------------------------
DROP TABLE IF EXISTS `plan_tema`;
CREATE TABLE `plan_tema` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_plan_evaluacion` int(11) unsigned NOT NULL,
  `id_grupo` int(11) unsigned NOT NULL,
  `id_tema` int(11) unsigned NOT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) unsigned NOT NULL,
  `id_usuario` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_plan_tema_plan_evaluacion` (`id_plan_evaluacion`),
  KEY `fk_plan_tema_grupo` (`id_grupo`),
  KEY `fk_plan_tema_tema` (`id_tema`),
  KEY `fk_plan_tema_status` (`id_status`),
  KEY `fk_plan_tema_usuario` (`id_usuario`),
  CONSTRAINT `fk_plan_tema_grupo` FOREIGN KEY (`id_grupo`) REFERENCES `grupo` (`id`),
  CONSTRAINT `fk_plan_tema_plan_evaluacion` FOREIGN KEY (`id_plan_evaluacion`) REFERENCES `plan_evaluacion` (`id`),
  CONSTRAINT `fk_plan_tema_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`),
  CONSTRAINT `fk_plan_tema_tema` FOREIGN KEY (`id_tema`) REFERENCES `tema` (`id`),
  CONSTRAINT `fk_plan_tema_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of plan_tema
-- ----------------------------

-- ----------------------------
-- Table structure for pregunta
-- ----------------------------
DROP TABLE IF EXISTS `pregunta`;
CREATE TABLE `pregunta` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_pregunta` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_prueba` int(11) unsigned NOT NULL,
  `id_tipo_pregunta` int(11) unsigned NOT NULL,
  `bo_opcional` tinyint(1) NOT NULL,
  `nu_valor` decimal(8,2) NOT NULL,
  `nu_orden` int(11) NOT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) unsigned NOT NULL,
  `id_usuario` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pregunta_prueba` (`id_prueba`),
  KEY `fk_pregunta_tipo_pregunta` (`id_tipo_pregunta`),
  KEY `fk_pregunta_status` (`id_status`),
  KEY `fk_pregunta_usuario` (`id_usuario`),
  CONSTRAINT `fk_pregunta_prueba` FOREIGN KEY (`id_prueba`) REFERENCES `prueba` (`id`),
  CONSTRAINT `fk_pregunta_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`),
  CONSTRAINT `fk_pregunta_tipo_pregunta` FOREIGN KEY (`id_tipo_pregunta`) REFERENCES `tipo_pregunta` (`id`),
  CONSTRAINT `fk_pregunta_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of pregunta
-- ----------------------------

-- ----------------------------
-- Table structure for prueba
-- ----------------------------
DROP TABLE IF EXISTS `prueba`;
CREATE TABLE `prueba` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_prueba` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_grado` int(11) unsigned NOT NULL,
  `id_materia` int(11) unsigned NOT NULL,
  `id_tema` int(11) unsigned NOT NULL,
  `bo_ver_resultado` tinyint(1) NOT NULL DEFAULT 0,
  `nu_minutos` int(11) DEFAULT NULL,
  `nu_peso` decimal(11,2) DEFAULT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) unsigned NOT NULL,
  `id_usuario` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_prueba_grado` (`id_grado`),
  KEY `fk_prueba_materia` (`id_materia`),
  KEY `fk_prueba_tema` (`id_tema`),
  KEY `fk_prueba_status` (`id_status`),
  KEY `fk_prueba_usuario` (`id_usuario`),
  CONSTRAINT `fk_prueba_grado` FOREIGN KEY (`id_grado`) REFERENCES `grado` (`id`),
  CONSTRAINT `fk_prueba_materia` FOREIGN KEY (`id_materia`) REFERENCES `materia` (`id`),
  CONSTRAINT `fk_prueba_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`),
  CONSTRAINT `fk_prueba_tema` FOREIGN KEY (`id_tema`) REFERENCES `tema` (`id`),
  CONSTRAINT `fk_prueba_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of prueba
-- ----------------------------

-- ----------------------------
-- Table structure for prueba_alumno
-- ----------------------------
DROP TABLE IF EXISTS `prueba_alumno`;
CREATE TABLE `prueba_alumno` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_prueba` int(11) unsigned NOT NULL,
  `id_alumno` int(11) unsigned NOT NULL,
  `fe_prueba` date DEFAULT NULL,
  `hh_inicio` time DEFAULT NULL,
  `hh_fin` time DEFAULT NULL,
  `nu_calificacion` decimal(11,2) DEFAULT NULL,
  `id_calificacion` int(11) unsigned NOT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) unsigned NOT NULL,
  `id_usuario` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_prueba_alumno_prueba` (`id_prueba`),
  KEY `fk_prueba_alumno_alumno` (`id_alumno`),
  KEY `fk_prueba_alumno_calificacion` (`id_calificacion`),
  KEY `fk_prueba_alumno_status` (`id_status`),
  KEY `fk_prueba_alumno_usuario` (`id_usuario`),
  CONSTRAINT `fk_prueba_alumno_alumno` FOREIGN KEY (`id_alumno`) REFERENCES `alumno` (`id`),
  CONSTRAINT `fk_prueba_alumno_calificacion` FOREIGN KEY (`id_calificacion`) REFERENCES `calificacion` (`id`),
  CONSTRAINT `fk_prueba_alumno_prueba` FOREIGN KEY (`id_prueba`) REFERENCES `prueba` (`id`),
  CONSTRAINT `fk_prueba_alumno_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`),
  CONSTRAINT `fk_prueba_alumno_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of prueba_alumno
-- ----------------------------

-- ----------------------------
-- Table structure for rasgo
-- ----------------------------
DROP TABLE IF EXISTS `rasgo`;
CREATE TABLE `rasgo` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_rasgo` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'mdi-human',
  `tx_icono` varchar(35) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tx_color` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'blue',
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) unsigned NOT NULL,
  `id_usuario` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_rasgo_status` (`id_status`),
  KEY `fk_rasgo_usuario` (`id_usuario`),
  CONSTRAINT `fk_rasgo_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`),
  CONSTRAINT `fk_rasgo_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of rasgo
-- ----------------------------
INSERT INTO `rasgo` VALUES ('1', 'Puntualidad', 'mdi-account-clock', 'indigo', null, '1', '1', '2020-11-14 22:51:51', null);
INSERT INTO `rasgo` VALUES ('2', 'Responsabilidad', 'mdi-handshake', 'purple', null, '1', '1', '2020-11-14 22:52:24', null);
INSERT INTO `rasgo` VALUES ('3', 'Asistencia', 'mdi-account-check', 'green', null, '1', '1', '2020-11-14 22:52:20', null);
INSERT INTO `rasgo` VALUES ('4', 'Participacion', 'mdi-hand', 'orange', '', '1', '1', '2020-11-14 22:52:38', null);

-- ----------------------------
-- Table structure for recurso
-- ----------------------------
DROP TABLE IF EXISTS `recurso`;
CREATE TABLE `recurso` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_tipo_recurso` int(11) unsigned NOT NULL,
  `id_grado` int(11) unsigned NOT NULL,
  `id_tema` int(11) unsigned NOT NULL,
  `tx_observaciones` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) unsigned NOT NULL,
  `id_usuario` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_recurso_tipo_recurso` (`id_tipo_recurso`),
  KEY `fk_recurso_grado` (`id_grado`),
  KEY `fk_recurso_tema` (`id_tema`),
  KEY `fk_recurso_status` (`id_status`),
  KEY `fk_recurso_usuario` (`id_usuario`),
  CONSTRAINT `fk_recurso_grado` FOREIGN KEY (`id_grado`) REFERENCES `grado` (`id`),
  CONSTRAINT `fk_recurso_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`),
  CONSTRAINT `fk_recurso_tema` FOREIGN KEY (`id_tema`) REFERENCES `tema` (`id`),
  CONSTRAINT `fk_recurso_tipo_recurso` FOREIGN KEY (`id_tipo_recurso`) REFERENCES `tipo_recurso` (`id`),
  CONSTRAINT `fk_recurso_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of recurso
-- ----------------------------

-- ----------------------------
-- Table structure for respuesta
-- ----------------------------
DROP TABLE IF EXISTS `respuesta`;
CREATE TABLE `respuesta` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_respuesta` varchar(600) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_pregunta` int(11) unsigned NOT NULL,
  `bo_correcta` tinyint(1) NOT NULL,
  `nu_valor` decimal(8,2) DEFAULT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) unsigned NOT NULL,
  `id_usuario` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_respuesta_pregunta` (`id_pregunta`),
  KEY `fk_respuesta_status` (`id_status`),
  KEY `fk_respuesta_usuario` (`id_usuario`),
  CONSTRAINT `fk_respuesta_pregunta` FOREIGN KEY (`id_pregunta`) REFERENCES `pregunta` (`id`),
  CONSTRAINT `fk_respuesta_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`),
  CONSTRAINT `fk_respuesta_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of respuesta
-- ----------------------------

-- ----------------------------
-- Table structure for respuesta_alumno
-- ----------------------------
DROP TABLE IF EXISTS `respuesta_alumno`;
CREATE TABLE `respuesta_alumno` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_prueba` int(11) unsigned NOT NULL,
  `id_evaluacion_alumno` int(11) unsigned NOT NULL,
  `id_pregunta` int(11) unsigned NOT NULL,
  `id_respuesta` int(11) unsigned DEFAULT NULL,
  `id_alumno` int(11) unsigned NOT NULL,
  `tx_respuesta` varchar(600) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bo_correcta` tinyint(1) NOT NULL,
  `nu_valor` double(8,2) DEFAULT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) unsigned NOT NULL,
  `id_usuario` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_respuesta_alumno_prueba` (`id_prueba`),
  KEY `fk_respuesta_alumno_evaluacion_alumno` (`id_evaluacion_alumno`),
  KEY `fk_respuesta_alumno_pregunta` (`id_pregunta`),
  KEY `fk_respuesta_alumno_respuesta` (`id_respuesta`),
  KEY `fk_respuesta_alumno_alumno` (`id_alumno`),
  KEY `fk_respuesta_alumno_status` (`id_status`),
  KEY `fk_respuesta_alumno_usuario` (`id_usuario`),
  CONSTRAINT `fk_respuesta_alumno_alumno` FOREIGN KEY (`id_alumno`) REFERENCES `alumno` (`id`),
  CONSTRAINT `fk_respuesta_alumno_evaluacion_alumno` FOREIGN KEY (`id_evaluacion_alumno`) REFERENCES `evaluacion_alumno` (`id`),
  CONSTRAINT `fk_respuesta_alumno_pregunta` FOREIGN KEY (`id_pregunta`) REFERENCES `pregunta` (`id`),
  CONSTRAINT `fk_respuesta_alumno_prueba` FOREIGN KEY (`id_prueba`) REFERENCES `prueba` (`id`),
  CONSTRAINT `fk_respuesta_alumno_respuesta` FOREIGN KEY (`id_respuesta`) REFERENCES `respuesta` (`id`),
  CONSTRAINT `fk_respuesta_alumno_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`),
  CONSTRAINT `fk_respuesta_alumno_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of respuesta_alumno
-- ----------------------------

-- ----------------------------
-- Table structure for status
-- ----------------------------
DROP TABLE IF EXISTS `status`;
CREATE TABLE `status` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nb_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nb_secundario` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `co_status` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `co_grupo` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_icono` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `tx_color` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `id_padre` int(11) unsigned NOT NULL,
  `tx_observaciones` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bo_activo` tinyint(1) NOT NULL,
  `id_usuario` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `status_nb_status_unique` (`nb_status`,`co_grupo`) USING BTREE,
  KEY `idx_status_id` (`id`) USING BTREE,
  KEY `fk_status_usuario` (`id_usuario`),
  CONSTRAINT `fk_status_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of status
-- ----------------------------
INSERT INTO `status` VALUES ('1', 'activo', 'active', 'ACT', 'GRAL', null, 'success', '0', null, '1', '1', '2020-05-07 03:00:28', null);
INSERT INTO `status` VALUES ('2', 'inactivo', 'inactive', 'INA', 'GRAL', null, 'red', '0', null, '1', '1', '2020-05-07 03:01:01', null);
INSERT INTO `status` VALUES ('3', 'asignada', 'assigned', 'ASI', 'EVALUACION', 'mdi-text-box-check', 'amber', '0', null, '1', '1', null, null);
INSERT INTO `status` VALUES ('4', 'en ejecucion', 'running', 'EEJE', 'EVALUACION', 'mdi-text-box-check', 'orange', '0', null, '1', '1', null, null);
INSERT INTO `status` VALUES ('5', 'ejecutada', 'executed', 'EJE', 'EVALUACION', 'mdi-cog-clockwise', 'info', '0', null, '1', '1', null, null);
INSERT INTO `status` VALUES ('6', 'evaluada', 'evaluated', 'EVA', 'EVALUACION', 'mdi-check-all', 'success', '0', null, '1', '1', null, null);
INSERT INTO `status` VALUES ('7', 'cerradas', 'closed', 'CER', 'EVALUACION', 'mdi-close', 'red', '0', null, '1', '1', null, null);
INSERT INTO `status` VALUES ('99', 'eliminada', 'eliminated', 'ELI', 'HIDDEN', '', '', '0', null, '1', '1', '2020-11-09 15:15:39', null);

-- ----------------------------
-- Table structure for suscripcion
-- ----------------------------
DROP TABLE IF EXISTS `suscripcion`;
CREATE TABLE `suscripcion` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_colegio` int(11) unsigned NOT NULL,
  `aa_lectivo` int(11) NOT NULL,
  `mo_cobro` decimal(9,2) NOT NULL,
  `mo_pagado` decimal(9,2) NOT NULL,
  `mo_saldo` decimal(9,2) NOT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) unsigned NOT NULL,
  `id_usuario` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_suscripcion_colegio` (`id_colegio`),
  KEY `fk_suscripcion_status` (`id_status`),
  KEY `fk_suscripcion_usuario` (`id_usuario`),
  CONSTRAINT `fk_suscripcion_colegio` FOREIGN KEY (`id_colegio`) REFERENCES `colegio` (`id`),
  CONSTRAINT `fk_suscripcion_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`),
  CONSTRAINT `fk_suscripcion_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of suscripcion
-- ----------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of tarea
-- ----------------------------

-- ----------------------------
-- Table structure for telefono
-- ----------------------------
DROP TABLE IF EXISTS `telefono`;
CREATE TABLE `telefono` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tx_telefono` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_tipo_telefono` int(11) unsigned NOT NULL,
  `id_entidad` int(11) unsigned NOT NULL,
  `bo_whatsapp` tinyint(1) NOT NULL DEFAULT 0,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) unsigned NOT NULL,
  `id_usuario` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_telefono_tipo_telefono` (`id_tipo_telefono`),
  KEY `fk_telefono_status` (`id_status`),
  KEY `fk_telefono_usuario` (`id_usuario`),
  CONSTRAINT `fk_telefono_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`),
  CONSTRAINT `fk_telefono_tipo_telefono` FOREIGN KEY (`id_tipo_telefono`) REFERENCES `tipo_telefono` (`id`),
  CONSTRAINT `fk_telefono_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of telescope_entries
-- ----------------------------
INSERT INTO `telescope_entries` VALUES ('1', '932478dd-ce3b-474f-94dc-6378a28b89b6', '932478dd-d9f4-45d3-9d5a-7e2451ce1e93', null, '1', 'view', '{\"name\":\"app\",\"path\":\"\\\\resources\\\\views\\/app.blade.php\",\"data\":[],\"hostname\":\"lyustiz-PC\"}', '2021-04-08 02:22:39');
INSERT INTO `telescope_entries` VALUES ('2', '932478dd-d543-4543-99ab-74b433b4a7fc', '932478dd-d9f4-45d3-9d5a-7e2451ce1e93', null, '1', 'view', '{\"name\":\"layouts.main\",\"path\":\"\\\\resources\\\\views\\/layouts\\/main.blade.php\",\"data\":[],\"hostname\":\"lyustiz-PC\"}', '2021-04-08 02:22:39');
INSERT INTO `telescope_entries` VALUES ('3', '932478dd-d8c8-4460-8df3-7b9c2df180ca', '932478dd-d9f4-45d3-9d5a-7e2451ce1e93', null, '1', 'request', '{\"ip_address\":\"127.0.0.1\",\"uri\":\"\\/images\\/list.svg\",\"method\":\"GET\",\"controller_action\":\"\\\\Illuminate\\\\Routing\\\\ViewController\",\"middleware\":[\"web\"],\"headers\":{\"host\":\"127.0.0.1:8000\",\"connection\":\"keep-alive\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/89.0.4389.114 Safari\\/537.36\",\"accept\":\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\",\"sec-gpc\":\"1\",\"sec-fetch-site\":\"same-origin\",\"sec-fetch-mode\":\"no-cors\",\"sec-fetch-dest\":\"image\",\"referer\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/\",\"accept-encoding\":\"gzip, deflate, br\",\"accept-language\":\"es-419,es;q=0.9,en-US;q=0.8,en;q=0.7\",\"cookie\":\"path_inicio=control_visitas\\/C_registroVisita; nombre=undefined; cedula=undefined; id_sistema=1; XSRF-TOKEN=eyJpdiI6IjVpa2U1NXFKUFhrYkx0dVRLbGdCSGc9PSIsInZhbHVlIjoiTzhpdTkyVVptR0pTV3FqT2JYMyswUEFkakEybS9xNlVvN0ZzYmlqdEllSDBYU1UwNUppWmxpWGVBYTV4VUpRMVcxT3BmM2NXcTQwWUgzUGxQVi9EeCtjZzNzOVNsZDB3ekpuVW1hYW5qYVlibklKemdlQlJsOGdKekJUYS9QZVMiLCJtYWMiOiI3Zjc4NGIxNmFjYTU1Y2MxNGE5Zjk2ZDNhMTlhYjc1YjljMjlmNWQ3NDI3NDIyNTI0NWE1YWNhZWIxNWM4MjE2In0%3D; virtualin_session=eyJpdiI6ImYvQmo2Q1RaaU9adkF3dXZuUVF3RlE9PSIsInZhbHVlIjoiODlSTG16VXFya2pOUWdVeHFnNVV2amZYV0pDaTR0RjdlYjdSSWNRWDg1Q3VsUGZJSSt6OFJlSDVTOXZINW5wT0RuUXM1K3gwWVBKVlBxRDVRdHMwcU1lK3k3dmViWW1EZkpzeEttKzJUWVIxek5SY3dMZUZWV2JSRlV6WDVNengiLCJtYWMiOiI5NDQ0YWI5MDg3NmIxYzQwNTU0MDJhZWE0NTRmM2I2NDU0NDUwN2RjNGJjNWE5MzQ4MWU2ZDZkZTQ4MGJkZGU3In0%3D\"},\"payload\":[],\"session\":{\"_token\":\"muxOc6B6d2Hu2eD7RGgsJQINtPzcsegCkPdfAxxB\",\"_previous\":{\"url\":\"http:\\/\\/127.0.0.1:8000\\/images\\/list.svg\"},\"_flash\":{\"old\":[],\"new\":[]}},\"response_status\":200,\"response\":{\"view\":\"E:\\\\TRABAJO\\\\classrrom\\\\APP\\\\resources\\\\views\\/app.blade.php\",\"data\":[]},\"duration\":1013,\"memory\":14,\"hostname\":\"lyustiz-PC\"}', '2021-04-08 02:22:39');
INSERT INTO `telescope_entries` VALUES ('4', '932478e7-136a-4859-944d-2d35265febfc', '932478e7-1f86-48b1-af4a-aaa428233cd6', null, '1', 'view', '{\"name\":\"app\",\"path\":\"\\\\resources\\\\views\\/app.blade.php\",\"data\":[],\"hostname\":\"lyustiz-PC\"}', '2021-04-08 02:22:45');
INSERT INTO `telescope_entries` VALUES ('5', '932478e7-1a0e-4bfe-8d8d-e933892b3929', '932478e7-1f86-48b1-af4a-aaa428233cd6', null, '1', 'view', '{\"name\":\"layouts.main\",\"path\":\"\\\\resources\\\\views\\/layouts\\/main.blade.php\",\"data\":[],\"hostname\":\"lyustiz-PC\"}', '2021-04-08 02:22:45');
INSERT INTO `telescope_entries` VALUES ('6', '932478e7-1df6-471c-8558-f4ca91b85cc8', '932478e7-1f86-48b1-af4a-aaa428233cd6', null, '1', 'request', '{\"ip_address\":\"127.0.0.1\",\"uri\":\"\\/images\\/list.svg\",\"method\":\"GET\",\"controller_action\":\"\\\\Illuminate\\\\Routing\\\\ViewController\",\"middleware\":[\"web\"],\"headers\":{\"host\":\"127.0.0.1:8000\",\"connection\":\"keep-alive\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/89.0.4389.114 Safari\\/537.36\",\"accept\":\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\",\"sec-gpc\":\"1\",\"sec-fetch-site\":\"same-origin\",\"sec-fetch-mode\":\"no-cors\",\"sec-fetch-dest\":\"image\",\"referer\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/usuario\",\"accept-encoding\":\"gzip, deflate, br\",\"accept-language\":\"es-419,es;q=0.9,en-US;q=0.8,en;q=0.7\",\"cookie\":\"path_inicio=control_visitas\\/C_registroVisita; nombre=undefined; cedula=undefined; id_sistema=1; XSRF-TOKEN=eyJpdiI6IktCaytmL3lUNFlBOUdHWVhjNWV4VVE9PSIsInZhbHVlIjoic0g3N256WkpEbDdqTmdpVFFrd0E5S2laVVcyOWdnRFJZOHpiN1dDbXFONDZqSENZMFV0ZWdudnBNbHFxUUF2cXBIMnZCa2JpZkpvbGI5UUlJY2Q2NU02RGQwZmNON0xGOGpsNjFwaGFObHZWbUYxbnhJb3V0S2JKcEkyUFZvS2wiLCJtYWMiOiIwZTVjYWQ2ZTJlYTk4OWEzOTgxYjNiZTZiYzVjOGM4YzgwYWM1NTIyMjY0OWI3YzMxYTYyZmMwZDAzOGZiYmU2In0%3D; virtualin_session=eyJpdiI6IkNqUUtXQU13SzAxQS90VytzbDhLRmc9PSIsInZhbHVlIjoibkJBVkNlZi9kVXpxM3pEYmRKVGh6YmdUcTE5Q1JsbDV5Z2VjSXlvRXgzaU5saWFGWEpWSGZTMlZROVZwc1JYNWVWR2IxdVkzT2R2VHc5ZStRVzViRDJmR0RTYXhhOFFLMjVDbkx1b21XemE0UUx4MHovUFVobjlHWGF0aXhmNFQiLCJtYWMiOiI1OTU2MWU3NjkwZjE2NTVlYWUwNzc3YzhhN2IyZmVlYjhhMjg1OGE5MGFmYTU4MjM2ZTA4NmU1M2QzYWMwMTA4In0%3D\"},\"payload\":[],\"session\":{\"_token\":\"muxOc6B6d2Hu2eD7RGgsJQINtPzcsegCkPdfAxxB\",\"_previous\":{\"url\":\"http:\\/\\/127.0.0.1:8000\\/images\\/list.svg\"},\"_flash\":{\"old\":[],\"new\":[]}},\"response_status\":200,\"response\":{\"view\":\"E:\\\\TRABAJO\\\\classrrom\\\\APP\\\\resources\\\\views\\/app.blade.php\",\"data\":[]},\"duration\":909,\"memory\":8,\"hostname\":\"lyustiz-PC\"}', '2021-04-08 02:22:45');
INSERT INTO `telescope_entries` VALUES ('7', '932478e8-567b-4c6e-b136-4cd36b6f651e', '932478e9-2fae-4822-b0f4-20a67716b9a8', null, '1', 'cache', '{\"type\":\"missed\",\"key\":\"5c785c036466adea360111aa28563bfd556b5fba\",\"hostname\":\"lyustiz-PC\"}', '2021-04-08 02:22:46');
INSERT INTO `telescope_entries` VALUES ('8', '932478e8-603f-405a-a282-4a22e89b9042', '932478e9-2fae-4822-b0f4-20a67716b9a8', null, '1', 'cache', '{\"type\":\"missed\",\"key\":\"5c785c036466adea360111aa28563bfd556b5fba:timer\",\"hostname\":\"lyustiz-PC\"}', '2021-04-08 02:22:46');
INSERT INTO `telescope_entries` VALUES ('9', '932478e8-6297-42b5-9c80-f3cd1f8621c5', '932478e9-2fae-4822-b0f4-20a67716b9a8', null, '1', 'cache', '{\"type\":\"set\",\"key\":\"5c785c036466adea360111aa28563bfd556b5fba:timer\",\"value\":1617848626,\"expiration\":60,\"hostname\":\"lyustiz-PC\"}', '2021-04-08 02:22:46');
INSERT INTO `telescope_entries` VALUES ('10', '932478e8-635f-4a6c-900b-d7bba838b0ef', '932478e9-2fae-4822-b0f4-20a67716b9a8', null, '1', 'cache', '{\"type\":\"missed\",\"key\":\"5c785c036466adea360111aa28563bfd556b5fba\",\"hostname\":\"lyustiz-PC\"}', '2021-04-08 02:22:46');
INSERT INTO `telescope_entries` VALUES ('11', '932478e8-6553-4054-aa87-980a74551111', '932478e9-2fae-4822-b0f4-20a67716b9a8', null, '1', 'cache', '{\"type\":\"set\",\"key\":\"5c785c036466adea360111aa28563bfd556b5fba\",\"value\":0,\"expiration\":60,\"hostname\":\"lyustiz-PC\"}', '2021-04-08 02:22:46');
INSERT INTO `telescope_entries` VALUES ('12', '932478e8-ac08-46c2-9479-8aafa895e316', '932478e9-2fae-4822-b0f4-20a67716b9a8', null, '1', 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from `usuario`\",\"time\":\"159.01\",\"slow\":true,\"file\":\"E:\\\\TRABAJO\\\\classrrom\\\\APP\\\\app\\\\Http\\\\Controllers\\\\UsuarioController.php\",\"line\":33,\"hash\":\"3e0a866344609419fb1fdb781cc565e4\",\"hostname\":\"lyustiz-PC\"}', '2021-04-08 02:22:46');
INSERT INTO `telescope_entries` VALUES ('13', '932478e8-dd41-461d-b73a-9bd5a69a437f', '932478e9-2fae-4822-b0f4-20a67716b9a8', null, '1', 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `perfil`.*, `usuario_perfil`.`id_usuario` as `pivot_id_usuario`, `usuario_perfil`.`id_perfil` as `pivot_id_perfil` from `perfil` inner join `usuario_perfil` on `perfil`.`id` = `usuario_perfil`.`id_perfil` where `usuario_perfil`.`id_usuario` in (1, 2, 3, 4, 5, 325, 400, 401, 402, 403, 404, 405, 406, 407, 408, 409, 410, 411, 412, 413, 414, 415, 416, 417, 418, 419, 420, 421, 422, 423, 424, 425, 426, 427, 428, 429, 430, 431, 432, 433, 434, 435, 436, 437, 438, 439, 440, 441, 442, 443, 444, 445, 446, 447, 448, 449, 450, 451, 452, 453, 454, 455, 456, 457, 458, 459, 460, 461, 462, 463, 464, 465, 466, 467, 468, 469, 470, 471, 472, 473, 474, 475, 476, 477, 478, 479, 480, 481, 482, 483, 484, 485, 486, 487, 488, 489, 490, 491, 492, 493, 494, 495, 496, 497, 498, 499, 500, 501, 502, 503, 504, 505, 506, 507, 508, 509, 510, 511, 512, 513, 514, 515, 516, 517, 518, 519, 520, 521, 522, 523, 524, 525, 526, 527, 528, 529, 530, 531, 532, 533, 534, 535, 536, 537, 538, 539, 540, 541, 542, 543, 544, 545, 546, 547, 548, 549, 550, 551, 552, 553, 554, 555, 556, 557, 558, 559, 560, 561, 562, 563, 564, 565, 566, 567, 568, 569, 570, 571, 572, 573, 574, 575, 576, 577, 578, 579, 580, 581, 582, 583, 584, 585, 586, 587, 588, 589, 590, 591, 592, 593, 594, 595, 596, 597, 598, 599, 600, 601, 602, 603, 604, 605, 606, 607, 608, 609, 610, 611, 612, 613, 614, 615, 616, 617, 618, 619, 620, 621, 622, 623, 624, 625, 626, 627, 628, 629, 630, 631, 632, 633, 634, 635, 636, 637, 638, 639, 640, 641, 642, 643, 644, 645, 646, 647, 648, 649, 650, 651, 652, 653, 654, 655, 656, 657, 658, 659, 660, 661, 662, 663, 664, 665, 666, 667, 668, 669, 670, 671, 672, 673, 674, 675, 676, 677)\",\"time\":\"45.00\",\"slow\":false,\"file\":\"E:\\\\TRABAJO\\\\classrrom\\\\APP\\\\app\\\\Http\\\\Controllers\\\\UsuarioController.php\",\"line\":33,\"hash\":\"b9b76b306ab10d53e434b90977ef18b9\",\"hostname\":\"lyustiz-PC\"}', '2021-04-08 02:22:46');
INSERT INTO `telescope_entries` VALUES ('14', '932478e9-0005-4892-bb44-96e1ebe57f65', '932478e9-2fae-4822-b0f4-20a67716b9a8', null, '1', 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `id`, `tx_src`, `id_tipo_foto`, `id_origen` from `foto` where `id_tipo_foto` = 4 and `foto`.`id_origen` in (1, 2, 3, 4, 5, 325, 400, 401, 402, 403, 404, 405, 406, 407, 408, 409, 410, 411, 412, 413, 414, 415, 416, 417, 418, 419, 420, 421, 422, 423, 424, 425, 426, 427, 428, 429, 430, 431, 432, 433, 434, 435, 436, 437, 438, 439, 440, 441, 442, 443, 444, 445, 446, 447, 448, 449, 450, 451, 452, 453, 454, 455, 456, 457, 458, 459, 460, 461, 462, 463, 464, 465, 466, 467, 468, 469, 470, 471, 472, 473, 474, 475, 476, 477, 478, 479, 480, 481, 482, 483, 484, 485, 486, 487, 488, 489, 490, 491, 492, 493, 494, 495, 496, 497, 498, 499, 500, 501, 502, 503, 504, 505, 506, 507, 508, 509, 510, 511, 512, 513, 514, 515, 516, 517, 518, 519, 520, 521, 522, 523, 524, 525, 526, 527, 528, 529, 530, 531, 532, 533, 534, 535, 536, 537, 538, 539, 540, 541, 542, 543, 544, 545, 546, 547, 548, 549, 550, 551, 552, 553, 554, 555, 556, 557, 558, 559, 560, 561, 562, 563, 564, 565, 566, 567, 568, 569, 570, 571, 572, 573, 574, 575, 576, 577, 578, 579, 580, 581, 582, 583, 584, 585, 586, 587, 588, 589, 590, 591, 592, 593, 594, 595, 596, 597, 598, 599, 600, 601, 602, 603, 604, 605, 606, 607, 608, 609, 610, 611, 612, 613, 614, 615, 616, 617, 618, 619, 620, 621, 622, 623, 624, 625, 626, 627, 628, 629, 630, 631, 632, 633, 634, 635, 636, 637, 638, 639, 640, 641, 642, 643, 644, 645, 646, 647, 648, 649, 650, 651, 652, 653, 654, 655, 656, 657, 658, 659, 660, 661, 662, 663, 664, 665, 666, 667, 668, 669, 670, 671, 672, 673, 674, 675, 676, 677)\",\"time\":\"19.00\",\"slow\":false,\"file\":\"E:\\\\TRABAJO\\\\classrrom\\\\APP\\\\app\\\\Http\\\\Controllers\\\\UsuarioController.php\",\"line\":33,\"hash\":\"6adc60d135a7c409ef7ce80b443b3f87\",\"hostname\":\"lyustiz-PC\"}', '2021-04-08 02:22:46');
INSERT INTO `telescope_entries` VALUES ('15', '932478e9-0a92-44d2-a6ca-0e7cac8316d3', '932478e9-2fae-4822-b0f4-20a67716b9a8', null, '1', 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `id`, `tx_base_path` from `tipo_foto` where `tipo_foto`.`id` in (4)\",\"time\":\"21.00\",\"slow\":false,\"file\":\"E:\\\\TRABAJO\\\\classrrom\\\\APP\\\\app\\\\Http\\\\Controllers\\\\UsuarioController.php\",\"line\":33,\"hash\":\"92aed007181147937a5003a1a03d44db\",\"hostname\":\"lyustiz-PC\"}', '2021-04-08 02:22:46');
INSERT INTO `telescope_entries` VALUES ('16', '932478e9-290a-4146-9504-8cd7b19aedcd', '932478e9-2fae-4822-b0f4-20a67716b9a8', null, '1', 'cache', '{\"type\":\"hit\",\"key\":\"5c785c036466adea360111aa28563bfd556b5fba\",\"value\":1,\"hostname\":\"lyustiz-PC\"}', '2021-04-08 02:22:46');
INSERT INTO `telescope_entries` VALUES ('17', '932478e9-2ee6-41be-9b52-ff1bf90bc24d', '932478e9-2fae-4822-b0f4-20a67716b9a8', null, '1', 'request', '{\"ip_address\":\"127.0.0.1\",\"uri\":\"\\/api\\/v1\\/usuario\",\"method\":\"GET\",\"controller_action\":\"App\\\\Http\\\\Controllers\\\\UsuarioController@index\",\"middleware\":[\"api\"],\"headers\":{\"host\":\"127.0.0.1:8000\",\"connection\":\"keep-alive\",\"accept\":\"application\\/json, text\\/plain, *\\/*\",\"x-xsrf-token\":\"eyJpdiI6IktCaytmL3lUNFlBOUdHWVhjNWV4VVE9PSIsInZhbHVlIjoic0g3N256WkpEbDdqTmdpVFFrd0E5S2laVVcyOWdnRFJZOHpiN1dDbXFONDZqSENZMFV0ZWdudnBNbHFxUUF2cXBIMnZCa2JpZkpvbGI5UUlJY2Q2NU02RGQwZmNON0xGOGpsNjFwaGFObHZWbUYxbnhJb3V0S2JKcEkyUFZvS2wiLCJtYWMiOiIwZTVjYWQ2ZTJlYTk4OWEzOTgxYjNiZTZiYzVjOGM4YzgwYWM1NTIyMjY0OWI3YzMxYTYyZmMwZDAzOGZiYmU2In0=\",\"x-csrf-token\":\"muxOc6B6d2Hu2eD7RGgsJQINtPzcsegCkPdfAxxB\",\"x-requested-with\":\"XMLHttpRequest\",\"authorization\":\"********\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/89.0.4389.114 Safari\\/537.36\",\"sec-gpc\":\"1\",\"sec-fetch-site\":\"same-origin\",\"sec-fetch-mode\":\"cors\",\"sec-fetch-dest\":\"empty\",\"referer\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/usuario\",\"accept-encoding\":\"gzip, deflate, br\",\"accept-language\":\"es-419,es;q=0.9,en-US;q=0.8,en;q=0.7\",\"cookie\":\"path_inicio=control_visitas\\/C_registroVisita; nombre=undefined; cedula=undefined; id_sistema=1; XSRF-TOKEN=eyJpdiI6IktCaytmL3lUNFlBOUdHWVhjNWV4VVE9PSIsInZhbHVlIjoic0g3N256WkpEbDdqTmdpVFFrd0E5S2laVVcyOWdnRFJZOHpiN1dDbXFONDZqSENZMFV0ZWdudnBNbHFxUUF2cXBIMnZCa2JpZkpvbGI5UUlJY2Q2NU02RGQwZmNON0xGOGpsNjFwaGFObHZWbUYxbnhJb3V0S2JKcEkyUFZvS2wiLCJtYWMiOiIwZTVjYWQ2ZTJlYTk4OWEzOTgxYjNiZTZiYzVjOGM4YzgwYWM1NTIyMjY0OWI3YzMxYTYyZmMwZDAzOGZiYmU2In0%3D; virtualin_session=eyJpdiI6IkNqUUtXQU13SzAxQS90VytzbDhLRmc9PSIsInZhbHVlIjoibkJBVkNlZi9kVXpxM3pEYmRKVGh6YmdUcTE5Q1JsbDV5Z2VjSXlvRXgzaU5saWFGWEpWSGZTMlZROVZwc1JYNWVWR2IxdVkzT2R2VHc5ZStRVzViRDJmR0RTYXhhOFFLMjVDbkx1b21XemE0UUx4MHovUFVobjlHWGF0aXhmNFQiLCJtYWMiOiI1OTU2MWU3NjkwZjE2NTVlYWUwNzc3YzhhN2IyZmVlYjhhMjg1OGE5MGFmYTU4MjM2ZTA4NmU1M2QzYWMwMTA4In0%3D\"},\"payload\":[],\"session\":[],\"response_status\":200,\"response\":\"Purged By Telescope\",\"duration\":1279,\"memory\":10,\"hostname\":\"lyustiz-PC\"}', '2021-04-08 02:22:46');
INSERT INTO `telescope_entries` VALUES ('18', '93247922-0043-4d6d-95f4-c1e58666c4ef', '93247922-c2ce-464b-914d-c4f3274ede18', null, '1', 'cache', '{\"type\":\"hit\",\"key\":\"5c785c036466adea360111aa28563bfd556b5fba\",\"value\":1,\"hostname\":\"lyustiz-PC\"}', '2021-04-08 02:23:23');
INSERT INTO `telescope_entries` VALUES ('19', '93247922-0877-4c44-b2da-ad2a0fc95ca1', '93247922-c2ce-464b-914d-c4f3274ede18', null, '1', 'cache', '{\"type\":\"hit\",\"key\":\"5c785c036466adea360111aa28563bfd556b5fba:timer\",\"value\":1617848626,\"hostname\":\"lyustiz-PC\"}', '2021-04-08 02:23:23');
INSERT INTO `telescope_entries` VALUES ('20', '93247922-093f-4cb1-8c51-effa2ea027e1', '93247922-c2ce-464b-914d-c4f3274ede18', null, '1', 'cache', '{\"type\":\"hit\",\"key\":\"5c785c036466adea360111aa28563bfd556b5fba\",\"value\":1,\"hostname\":\"lyustiz-PC\"}', '2021-04-08 02:23:23');
INSERT INTO `telescope_entries` VALUES ('21', '93247922-ba9a-499f-ad76-d7d1e19f16a8', '93247922-c2ce-464b-914d-c4f3274ede18', null, '1', 'query', '{\"connection\":\"mysqlviews\",\"bindings\":[],\"sql\":\"select distinct `id_tipo_usuario`, `nb_tipo_usuario` from `vw_usuario`\",\"time\":\"40.00\",\"slow\":false,\"file\":\"E:\\\\TRABAJO\\\\classrrom\\\\APP\\\\app\\\\Models\\\\Reportes\\\\ReporteModel.php\",\"line\":71,\"hash\":\"95cf3dd933febb834d285819a86f39d6\",\"hostname\":\"lyustiz-PC\"}', '2021-04-08 02:23:24');
INSERT INTO `telescope_entries` VALUES ('22', '93247922-bc8e-4d7f-9742-4d0a04f230df', '93247922-c2ce-464b-914d-c4f3274ede18', null, '1', 'query', '{\"connection\":\"mysqlviews\",\"bindings\":[],\"sql\":\"select distinct `id_status`, `nb_status` from `vw_usuario`\",\"time\":\"3.00\",\"slow\":false,\"file\":\"E:\\\\TRABAJO\\\\classrrom\\\\APP\\\\app\\\\Models\\\\Reportes\\\\ReporteModel.php\",\"line\":71,\"hash\":\"a56a5c26c981ac24703a482d4c10e671\",\"hostname\":\"lyustiz-PC\"}', '2021-04-08 02:23:24');
INSERT INTO `telescope_entries` VALUES ('23', '93247922-c13e-4c21-8483-e65c4d73dd89', '93247922-c2ce-464b-914d-c4f3274ede18', null, '1', 'cache', '{\"type\":\"hit\",\"key\":\"5c785c036466adea360111aa28563bfd556b5fba\",\"value\":2,\"hostname\":\"lyustiz-PC\"}', '2021-04-08 02:23:24');
INSERT INTO `telescope_entries` VALUES ('24', '93247922-c206-4bc8-8bc0-c2dd11f94b88', '93247922-c2ce-464b-914d-c4f3274ede18', null, '1', 'request', '{\"ip_address\":\"127.0.0.1\",\"uri\":\"\\/api\\/v1\\/reporte\\/generate\",\"method\":\"POST\",\"controller_action\":\"App\\\\Http\\\\Controllers\\\\Reportes\\\\ReporteController@generate\",\"middleware\":[\"api\"],\"headers\":{\"host\":\"127.0.0.1:8000\",\"connection\":\"keep-alive\",\"content-length\":\"109\",\"accept\":\"application\\/json, text\\/plain, *\\/*\",\"x-xsrf-token\":\"eyJpdiI6IjlMV3I1d2ozL3ZwaDJYemNDeHlCV2c9PSIsInZhbHVlIjoiNzNURmRsUzZ5ZXJUUmZCZEVEbW4ySXc1OWFjWUtEaGVYMmxFWXdMZ29iRkhiV1JhNW8xVHhpM1JqZFkrVVlObGM0ZGxZR0U2R2Q0aVVBSmF1d0M5RDZQZ2doVm1yOEtyaWllOXdKYmYzdTVHdGFraXRic0FMdFRCU05SMUxMTEEiLCJtYWMiOiIwMzQ0ZDYxYjAxNzc2ZjYyMWI3Yjk3NDc2MDYzYjNiMDg4YTk0ZGI1ZTE5NmNmMTE1ZjYwMmFiN2Y0MGIwYjk4In0=\",\"x-csrf-token\":\"muxOc6B6d2Hu2eD7RGgsJQINtPzcsegCkPdfAxxB\",\"x-requested-with\":\"XMLHttpRequest\",\"authorization\":\"********\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/89.0.4389.114 Safari\\/537.36\",\"content-type\":\"application\\/json;charset=UTF-8\",\"sec-gpc\":\"1\",\"origin\":\"http:\\/\\/127.0.0.1:8000\",\"sec-fetch-site\":\"same-origin\",\"sec-fetch-mode\":\"cors\",\"sec-fetch-dest\":\"empty\",\"referer\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/usuario\",\"accept-encoding\":\"gzip, deflate, br\",\"accept-language\":\"es-419,es;q=0.9,en-US;q=0.8,en;q=0.7\",\"cookie\":\"path_inicio=control_visitas\\/C_registroVisita; nombre=undefined; cedula=undefined; id_sistema=1; XSRF-TOKEN=eyJpdiI6IjlMV3I1d2ozL3ZwaDJYemNDeHlCV2c9PSIsInZhbHVlIjoiNzNURmRsUzZ5ZXJUUmZCZEVEbW4ySXc1OWFjWUtEaGVYMmxFWXdMZ29iRkhiV1JhNW8xVHhpM1JqZFkrVVlObGM0ZGxZR0U2R2Q0aVVBSmF1d0M5RDZQZ2doVm1yOEtyaWllOXdKYmYzdTVHdGFraXRic0FMdFRCU05SMUxMTEEiLCJtYWMiOiIwMzQ0ZDYxYjAxNzc2ZjYyMWI3Yjk3NDc2MDYzYjNiMDg4YTk0ZGI1ZTE5NmNmMTE1ZjYwMmFiN2Y0MGIwYjk4In0%3D; virtualin_session=eyJpdiI6Ill2eDFkQ05EVEp0RlRoYllmK3liS0E9PSIsInZhbHVlIjoiWWswZ0tOY3hobUcvRTB2Ny9nNGVGUHRzVmZsZ1J6RjgxUTFLUFMxcE9CMWd0d3pmOHg4aG9FVUJoRGppSUZ3bmg5SEVOcmZGZUhuVDhEbUlOTVdTYWhoVUNMbFp3ZDlOaHVnVTFTNEl5bEVvZUo3d0M5NlJZdzlJSTdQMmd1c04iLCJtYWMiOiIxZTc5MDNlYWM3MzI0OGMzOWUyYmMxNTJlNzRjODgxYzFhNDkyMTY2NWUzMjZiN2Y4OTdiNzAwMzIxMDcxMDAwIn0%3D\"},\"payload\":{\"campos\":[],\"filtros\":[],\"dateSets\":[],\"tableName\":\"vw_usuario\",\"hiddenCols\":[],\"showCols\":[],\"nameCols\":[]},\"session\":[],\"response_status\":200,\"response\":{\"fields\":[{\"name\":\"Nombres\",\"value\":\"nb_nombres|Nombres\"},{\"name\":\"Usuario\",\"value\":\"nb_usuario|Usuario\"},{\"name\":\"Email\",\"value\":\"tx_email|Email\"},{\"name\":\"Tipo Usuario\",\"value\":\"nb_tipo_usuario|Tipo Usuario\"},{\"name\":\"Status\",\"value\":\"nb_status|Status\"}],\"table\":\"vw_usuario\",\"filters\":[{\"fieldId\":\"id_tipo_usuario\",\"label\":\"Tipo Usuario\",\"items\":[{\"name\":\"administrador\",\"value\":\"1\"},{\"name\":\"docente\",\"value\":\"2\"},{\"name\":\"alumno\",\"value\":\"3\"},{\"name\":\"acudiente\",\"value\":\"4\"},{\"name\":\"empleado\",\"value\":\"5\"}]},{\"fieldId\":\"id_status\",\"label\":\"Status\",\"items\":[{\"name\":\"activo\",\"value\":\"1\"}]}],\"dateset\":[]},\"duration\":1925,\"memory\":4,\"hostname\":\"lyustiz-PC\"}', '2021-04-08 02:23:24');
INSERT INTO `telescope_entries` VALUES ('25', '9324792e-3d41-4bdd-b43d-da9ca5e6286d', '9324792e-5d49-4e5f-a007-65e6340abe04', null, '1', 'cache', '{\"type\":\"hit\",\"key\":\"5c785c036466adea360111aa28563bfd556b5fba\",\"value\":2,\"hostname\":\"lyustiz-PC\"}', '2021-04-08 02:23:31');
INSERT INTO `telescope_entries` VALUES ('26', '9324792e-431d-4318-b2ec-5af0d173e135', '9324792e-5d49-4e5f-a007-65e6340abe04', null, '1', 'cache', '{\"type\":\"hit\",\"key\":\"5c785c036466adea360111aa28563bfd556b5fba:timer\",\"value\":1617848626,\"hostname\":\"lyustiz-PC\"}', '2021-04-08 02:23:31');
INSERT INTO `telescope_entries` VALUES ('27', '9324792e-4381-4602-b824-e7123eadf533', '9324792e-5d49-4e5f-a007-65e6340abe04', null, '1', 'cache', '{\"type\":\"hit\",\"key\":\"5c785c036466adea360111aa28563bfd556b5fba\",\"value\":2,\"hostname\":\"lyustiz-PC\"}', '2021-04-08 02:23:31');
INSERT INTO `telescope_entries` VALUES ('28', '9324792e-56a5-4854-88ae-3dc02b1e10a5', '9324792e-5d49-4e5f-a007-65e6340abe04', null, '1', 'query', '{\"connection\":\"mysqlviews\",\"bindings\":[],\"sql\":\"select distinct `nb_nombres`, `nb_usuario`, `tx_email`, `nb_tipo_usuario` from `vw_usuario`\",\"time\":\"17.00\",\"slow\":false,\"file\":\"E:\\\\TRABAJO\\\\classrrom\\\\APP\\\\app\\\\Models\\\\Reportes\\\\ReporteModel.php\",\"line\":71,\"hash\":\"38b857866f76eeff5b78b27b8bbc0ba8\",\"hostname\":\"lyustiz-PC\"}', '2021-04-08 02:23:31');
INSERT INTO `telescope_entries` VALUES ('29', '9324792e-5a8d-4bdb-9f3d-86d34f7e48b5', '9324792e-5d49-4e5f-a007-65e6340abe04', null, '1', 'cache', '{\"type\":\"hit\",\"key\":\"5c785c036466adea360111aa28563bfd556b5fba\",\"value\":3,\"hostname\":\"lyustiz-PC\"}', '2021-04-08 02:23:31');
INSERT INTO `telescope_entries` VALUES ('30', '9324792e-5ce5-405b-b2ad-19c91150108e', '9324792e-5d49-4e5f-a007-65e6340abe04', null, '1', 'request', '{\"ip_address\":\"127.0.0.1\",\"uri\":\"\\/api\\/v1\\/reporte\\/execute\",\"method\":\"POST\",\"controller_action\":\"App\\\\Http\\\\Controllers\\\\Reportes\\\\ReporteController@execute\",\"middleware\":[\"api\"],\"headers\":{\"host\":\"127.0.0.1:8000\",\"connection\":\"keep-alive\",\"content-length\":\"237\",\"accept\":\"application\\/json, text\\/plain, *\\/*\",\"x-xsrf-token\":\"eyJpdiI6IjlMV3I1d2ozL3ZwaDJYemNDeHlCV2c9PSIsInZhbHVlIjoiNzNURmRsUzZ5ZXJUUmZCZEVEbW4ySXc1OWFjWUtEaGVYMmxFWXdMZ29iRkhiV1JhNW8xVHhpM1JqZFkrVVlObGM0ZGxZR0U2R2Q0aVVBSmF1d0M5RDZQZ2doVm1yOEtyaWllOXdKYmYzdTVHdGFraXRic0FMdFRCU05SMUxMTEEiLCJtYWMiOiIwMzQ0ZDYxYjAxNzc2ZjYyMWI3Yjk3NDc2MDYzYjNiMDg4YTk0ZGI1ZTE5NmNmMTE1ZjYwMmFiN2Y0MGIwYjk4In0=\",\"x-csrf-token\":\"muxOc6B6d2Hu2eD7RGgsJQINtPzcsegCkPdfAxxB\",\"x-requested-with\":\"XMLHttpRequest\",\"authorization\":\"********\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/89.0.4389.114 Safari\\/537.36\",\"content-type\":\"application\\/json;charset=UTF-8\",\"sec-gpc\":\"1\",\"origin\":\"http:\\/\\/127.0.0.1:8000\",\"sec-fetch-site\":\"same-origin\",\"sec-fetch-mode\":\"cors\",\"sec-fetch-dest\":\"empty\",\"referer\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/usuario\",\"accept-encoding\":\"gzip, deflate, br\",\"accept-language\":\"es-419,es;q=0.9,en-US;q=0.8,en;q=0.7\",\"cookie\":\"path_inicio=control_visitas\\/C_registroVisita; nombre=undefined; cedula=undefined; id_sistema=1; XSRF-TOKEN=eyJpdiI6IjlMV3I1d2ozL3ZwaDJYemNDeHlCV2c9PSIsInZhbHVlIjoiNzNURmRsUzZ5ZXJUUmZCZEVEbW4ySXc1OWFjWUtEaGVYMmxFWXdMZ29iRkhiV1JhNW8xVHhpM1JqZFkrVVlObGM0ZGxZR0U2R2Q0aVVBSmF1d0M5RDZQZ2doVm1yOEtyaWllOXdKYmYzdTVHdGFraXRic0FMdFRCU05SMUxMTEEiLCJtYWMiOiIwMzQ0ZDYxYjAxNzc2ZjYyMWI3Yjk3NDc2MDYzYjNiMDg4YTk0ZGI1ZTE5NmNmMTE1ZjYwMmFiN2Y0MGIwYjk4In0%3D; virtualin_session=eyJpdiI6Ill2eDFkQ05EVEp0RlRoYllmK3liS0E9PSIsInZhbHVlIjoiWWswZ0tOY3hobUcvRTB2Ny9nNGVGUHRzVmZsZ1J6RjgxUTFLUFMxcE9CMWd0d3pmOHg4aG9FVUJoRGppSUZ3bmg5SEVOcmZGZUhuVDhEbUlOTVdTYWhoVUNMbFp3ZDlOaHVnVTFTNEl5bEVvZUo3d0M5NlJZdzlJSTdQMmd1c04iLCJtYWMiOiIxZTc5MDNlYWM3MzI0OGMzOWUyYmMxNTJlNzRjODgxYzFhNDkyMTY2NWUzMjZiN2Y4OTdiNzAwMzIxMDcxMDAwIn0%3D\"},\"payload\":{\"campos\":[\"nb_nombres|Nombres\",\"nb_usuario|Usuario\",\"tx_email|Email\",\"nb_tipo_usuario|Tipo Usuario\"],\"filtros\":[{\"id_tipo_usuario\":[]},{\"id_status\":[]}],\"dateSets\":[],\"tableName\":\"vw_usuario\",\"hiddenCols\":[],\"showCols\":[],\"nameCols\":[]},\"session\":[],\"response_status\":200,\"response\":{\"data\":[{\"nb_nombres\":\"Administrador\",\"nb_usuario\":\"admin\",\"tx_email\":\"lyustiz@gmail.com\",\"nb_tipo_usuario\":\"administrador\"},{\"nb_nombres\":\"yustiz luis\",\"nb_usuario\":\"yluis\",\"tx_email\":\"lyustiz@gmail.com\",\"nb_tipo_usuario\":\"docente\"},{\"nb_nombres\":\"mauricio tellez\",\"nb_usuario\":\"mtellez\",\"tx_email\":\"lyustiz@gmail.com\",\"nb_tipo_usuario\":\"docente\"},{\"nb_nombres\":\"jean yustiz\",\"nb_usuario\":\"jyustiz\",\"tx_email\":\"jyustiz@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"sofia hernandez\",\"nb_usuario\":\"shernandez\",\"tx_email\":\"anyisarrieta17@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"elizabeth arrieta\",\"nb_usuario\":\"earrieta\",\"tx_email\":\"anyisarrieta17@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"laura anaya\",\"nb_usuario\":\"lanaya\",\"tx_email\":\"danielanaya@autlook.es\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"miller lopez\",\"nb_usuario\":\"mlopez\",\"tx_email\":\"allo.lopez@hotmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"omer caballero\",\"nb_usuario\":\"ocaballero\",\"tx_email\":\"sandragomezbobadillo92@gmail.c\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"luis mercado\",\"nb_usuario\":\"lmercado\",\"tx_email\":\"wen3135464713@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"joel alfaro\",\"nb_usuario\":\"jalfaro\",\"tx_email\":\"alfarojoeldavid@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"santiago medina\",\"nb_usuario\":\"smedina\",\"tx_email\":\"serranomoscotemarlenejudith@gm\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"danna ospino\",\"nb_usuario\":\"dospino\",\"tx_email\":\"javierospino71@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"samuel tetay\",\"nb_usuario\":\"stetay\",\"tx_email\":\"danielavalente_18@hotmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"tomas jimenez\",\"nb_usuario\":\"tjimenez\",\"tx_email\":\"luzangelamarquezmarenco@hotmai\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"sergio altamar\",\"nb_usuario\":\"saltamar\",\"tx_email\":\"ih6503481@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"valeska caparroso\",\"nb_usuario\":\"vcaparroso\",\"tx_email\":\"eduarcaparroso681@hotmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"juan diaz\",\"nb_usuario\":\"jdiaz\",\"tx_email\":\"liliadiazospino@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"juan jimenez\",\"nb_usuario\":\"jjimenez\",\"tx_email\":\"johanasalcedo1520@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"angel bustamante\",\"nb_usuario\":\"abustamante\",\"tx_email\":\"betsyordones1@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"maria castilla\",\"nb_usuario\":\"mcastilla\",\"tx_email\":\"kasie@hotmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"emanuel barrios\",\"nb_usuario\":\"ebarrios\",\"tx_email\":\"emanuelandresba@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"tifany ortega\",\"nb_usuario\":\"tortega\",\"tx_email\":\"greysizquierdoortega2110@gmail\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"juan ramos\",\"nb_usuario\":\"jramos\",\"tx_email\":\"juanramosmontero858@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"jimydejesus jimenez\",\"nb_usuario\":\"jjimenezs\",\"tx_email\":\"yimmyjimenez827@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"stivendejesus mattos\",\"nb_usuario\":\"smattos\",\"tx_email\":\"stivenmattos15@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"taysdelcarmen cerpa\",\"nb_usuario\":\"tcerpa\",\"tx_email\":\"thaiscerpa1@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"camilo ordonez\",\"nb_usuario\":\"cordonez\",\"tx_email\":\"camilohernandez17789@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"leonel borrero\",\"nb_usuario\":\"lborrero\",\"tx_email\":\"etimiranda@hotmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"maria gomez\",\"nb_usuario\":\"mgomez\",\"tx_email\":\"yaquelineester44@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"daniela ortega\",\"nb_usuario\":\"dortega\",\"tx_email\":\"greysizquierdoortega2110@gmail\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"milagros roncallo\",\"nb_usuario\":\"mroncallo\",\"tx_email\":\"roncallomilagro@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"valery sanchez\",\"nb_usuario\":\"vsanchez\",\"tx_email\":\"cantillomar1990@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"maria anaya\",\"nb_usuario\":\"manaya\",\"tx_email\":\"mariafernandaanayapadilla@gmai\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"oscar ortiz\",\"nb_usuario\":\"oortiz\",\"tx_email\":\"ortizaoscarandres@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"anthony moscote\",\"nb_usuario\":\"amoscote\",\"tx_email\":\"moscoteanthony@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"yaris moscote\",\"nb_usuario\":\"ymoscote\",\"tx_email\":\"moscoteashley@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"paula lopez\",\"nb_usuario\":\"plopez\",\"tx_email\":\"paolopez@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"milagrodejesus romero\",\"nb_usuario\":\"mromero\",\"tx_email\":\"mijeroji@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"maria anaya\",\"nb_usuario\":\"mlanaya\",\"tx_email\":\"anayapadillamarialuisa@gmail.c\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"camilo berrio\",\"nb_usuario\":\"cberrio\",\"tx_email\":\"camiloberriosandoval@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"linda olivera\",\"nb_usuario\":\"lolivera\",\"tx_email\":\"sheylaluzney123@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"emili iglesia\",\"nb_usuario\":\"eiglesia\",\"tx_email\":\"evilithcaro85@gmail. Com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"katherin marin\",\"nb_usuario\":\"kmarin\",\"tx_email\":\"Dainercantillo28@gmail. Com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"andrea gamez\",\"nb_usuario\":\"agamez\",\"tx_email\":\"landis1980@hotmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"jesus quiroga\",\"nb_usuario\":\"jquiroga\",\"tx_email\":\"Lidiaosses76@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"anelith viloria\",\"nb_usuario\":\"aviloria\",\"tx_email\":\"yesicatoscano08@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"angel beltran\",\"nb_usuario\":\"abeltran\",\"tx_email\":\"eloisasofiaahrroa@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"takianis camargo\",\"nb_usuario\":\"tcamargo\",\"tx_email\":\"takianiscamargo@gmail .com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"maria duque\",\"nb_usuario\":\"mduque\",\"tx_email\":\"nayetsynuyezgranados@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"joselin martinez\",\"nb_usuario\":\"jmartinez\",\"tx_email\":\"josrlinmartinez guzman08@gmail\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"samuel montano\",\"nb_usuario\":\"smontano\",\"tx_email\":\"samuelmonta\\u00f1o529@gmail\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"ana puerto\",\"nb_usuario\":\"apuerto\",\"tx_email\":\"anadofiapuertopolo@outlook.es\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"maria avila\",\"nb_usuario\":\"mavila\",\"tx_email\":\"sindrypaola@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"wendy acosta\",\"nb_usuario\":\"wacosta\",\"tx_email\":\"yuliethpaola2709@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"silvana contreras\",\"nb_usuario\":\"scontreras\",\"tx_email\":\"daysilvacontreras@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"jose gonzalez\",\"nb_usuario\":\"jgonzalez\",\"tx_email\":\"nellyherreraeloasis@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"anderson manga\",\"nb_usuario\":\"amanga\",\"tx_email\":\"jimenezmayerlis3@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"valeria morelo\",\"nb_usuario\":\"vmorelo\",\"tx_email\":\"lunazullyare@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"julian moreno\",\"nb_usuario\":\"jmoreno\",\"tx_email\":\"lizariza2020@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"yiceth miranda\",\"nb_usuario\":\"ymiranda\",\"tx_email\":\"merlisvelasquez2016@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"paul yance\",\"nb_usuario\":\"pyance\",\"tx_email\":\"kurielpa2016\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"hasmeth beltran\",\"nb_usuario\":\"hbeltran\",\"tx_email\":\"karinacn.2006@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"danna cantillo\",\"nb_usuario\":\"dcantillo\",\"tx_email\":\"dannanavarrocantillo@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"dainer cantillo\",\"nb_usuario\":\"dacantillo\",\"tx_email\":\"dainerorozco4@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"mateo escobar\",\"nb_usuario\":\"mescobar\",\"tx_email\":\"mateoestibenescobarfontalvo@gm\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"luis fontalvo\",\"nb_usuario\":\"lfontalvo\",\"tx_email\":\"fontalvoluismario50@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"dilan guerrero\",\"nb_usuario\":\"dguerrero\",\"tx_email\":\"dilandonadofre8@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"jose iglesia\",\"nb_usuario\":\"jiglesia\",\"tx_email\":\"iglesiajose998@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"kelly mejia\",\"nb_usuario\":\"kmejia\",\"tx_email\":\"mejiamelendezk@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"duberlin rada\",\"nb_usuario\":\"drada\",\"tx_email\":\"duberlinramo@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"deis suarez\",\"nb_usuario\":\"dsuarez\",\"tx_email\":\"deissuarez30@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"valentina torresahumada\",\"nb_usuario\":\"vtorresahumada\",\"tx_email\":\"valentinatahu@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"maria aguilarfernandez\",\"nb_usuario\":\"maguilarfernandez\",\"tx_email\":\"aguilarmariaf6@hotmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"mitchel aguilarfernandez\",\"nb_usuario\":\"mdaguilarfernandez\",\"tx_email\":\"aguilarmichelf6@outlook.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"kemel berdugoestrada\",\"nb_usuario\":\"kberdugoestrada\",\"tx_email\":\"berdugokemel9@hotmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"miguel cavadiamozo\",\"nb_usuario\":\"mcavadiamozo\",\"tx_email\":\"cavadiamiguel9@hotmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"maithe garciatorres\",\"nb_usuario\":\"mgarciatorres\",\"tx_email\":\"garciamaithe9@hotmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"maria gonzalezgutierrez\",\"nb_usuario\":\"mgonzalezgutierrez\",\"tx_email\":\"gonzalezmaria877@hotmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"julian guettecastro\",\"nb_usuario\":\"jguettecastro\",\"tx_email\":\"guettejulian@outlook.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"richard martinezcaro\",\"nb_usuario\":\"rmartinezcaro\",\"tx_email\":\"rm7691889@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"jefferson montenegrotoro\",\"nb_usuario\":\"jmontenegrotoro\",\"tx_email\":\"jrmt2408@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"juan orozcoramirez\",\"nb_usuario\":\"jorozcoramirez\",\"tx_email\":\"yanirisramirez82@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"andrea villamilcastro\",\"nb_usuario\":\"avillamilcastro\",\"tx_email\":\"Andreavillamil2005@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"luis cadenagutierrez\",\"nb_usuario\":\"lcadenagutierrez\",\"tx_email\":\"lisethgutu@hotmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"genesis arrieta\",\"nb_usuario\":\"garrieta\",\"tx_email\":\"gdearrieta26@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"reyvi arevalo\",\"nb_usuario\":\"rarevalo\",\"tx_email\":\"duniaarevaloanchila@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"valentina boneth\",\"nb_usuario\":\"vboneth\",\"tx_email\":\"gabyrojas1808@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"dayanis contreras\",\"nb_usuario\":\"dcontreras\",\"tx_email\":\"dayisilvacontrera@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"jonathan jimenez\",\"nb_usuario\":\"jdjimenez\",\"tx_email\":\"milagrostoncelnoriega@gmail.co\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"brayan jimeno\",\"nb_usuario\":\"bjimeno\",\"tx_email\":\"noderlyjimenosalas@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"cesar polo\",\"nb_usuario\":\"cpolo\",\"tx_email\":\"dayisilvacontrera@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"juan sierra\",\"nb_usuario\":\"jsierra\",\"tx_email\":\"juandavidsierravalera@gmail.co\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"dylan maz\",\"nb_usuario\":\"dmaz\",\"tx_email\":\"mary.trujillo@hotmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"keiner marin\",\"nb_usuario\":\"kamarin\",\"tx_email\":\"marinkeiner9@hotmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"yoimar mora\",\"nb_usuario\":\"ymora\",\"tx_email\":\"morayoimar9@outlook.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"gisela munoz\",\"nb_usuario\":\"gmunoz\",\"tx_email\":\"munozyisela9@hotmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"camila niebles\",\"nb_usuario\":\"cniebles\",\"tx_email\":\"nieblescamila9@hotmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"sergio romero\",\"nb_usuario\":\"sromero\",\"tx_email\":\"romerosergio9@hotmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"david salas\",\"nb_usuario\":\"dsalas\",\"tx_email\":\"salasd5736@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"juan villanueva\",\"nb_usuario\":\"jvillanueva\",\"tx_email\":\"villanuevajuan4240@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"jazbleidi zuniga\",\"nb_usuario\":\"jzuniga\",\"tx_email\":\"zunigajasbleidis@hotmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"osnuaider marquez\",\"nb_usuario\":\"omarquez\",\"tx_email\":\"marquezosnuaider9@hotmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"maria angulo\",\"nb_usuario\":\"mangulo\",\"tx_email\":\"ma.gabrielle2020@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"joel amador\",\"nb_usuario\":\"jamador\",\"tx_email\":\"gutierrezcantillosindypaola@gm\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"angely merino\",\"nb_usuario\":\"amerino\",\"tx_email\":\"angely290893@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"mery delarosa\",\"nb_usuario\":\"mdelarosa\",\"tx_email\":\"meriyeisdelarosa@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"estefany espinosa\",\"nb_usuario\":\"eespinosa\",\"tx_email\":\"Ola105158@gimail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"juana dehaz\",\"nb_usuario\":\"jdehaz\",\"tx_email\":\"javierjofran11@gimail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"alvis arevalo\",\"nb_usuario\":\"aarevalo\",\"tx_email\":\"alvenis.arevalo.0701@gimail.co\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"sebastian melendez\",\"nb_usuario\":\"smelendez\",\"tx_email\":\"marypili1116@hotmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"linda angulo\",\"nb_usuario\":\"langulo\",\"tx_email\":\"lindaangulodlr@outlook.es\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"maria montero\",\"nb_usuario\":\"mmontero\",\"tx_email\":\"delfinaluquez1986@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"michell gomez\",\"nb_usuario\":\"mdgomez\",\"tx_email\":\"Michellyyanelis@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"naciris polo\",\"nb_usuario\":\"npolo\",\"tx_email\":\"Polonaciris@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"johan araujo\",\"nb_usuario\":\"jaraujo\",\"tx_email\":\"rosirisrobin1972@hotmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"cristian granados\",\"nb_usuario\":\"cgranados\",\"tx_email\":\"mariluzc.6970@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"kelly daza\",\"nb_usuario\":\"kdaza\",\"tx_email\":\"dazagonzalezkellyvanessa@gmail\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"jairo jacobs\",\"nb_usuario\":\"jjacobs\",\"tx_email\":\"jacobsjairo35@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"maria polo\",\"nb_usuario\":\"mpolo\",\"tx_email\":\"mafepolo2006@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"juan lopez\",\"nb_usuario\":\"jlopez\",\"tx_email\":\"jl354067@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"andres sotelo\",\"nb_usuario\":\"asotelo\",\"tx_email\":\"spandresfelipe@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"ana santos\",\"nb_usuario\":\"asantos\",\"tx_email\":\"analuciasantosalvarez@gmail.co\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"jhojan sarmiento\",\"nb_usuario\":\"jsarmiento\",\"tx_email\":\"nerissarmiento19@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"dayana escorcia\",\"nb_usuario\":\"descorcia\",\"tx_email\":\"escorciadayana16@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"carolina gonzalez\",\"nb_usuario\":\"cgonzalez\",\"tx_email\":\"cpgonbel06@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"stevindavid cantillo\",\"nb_usuario\":\"scantillo\",\"tx_email\":\"narlishesterhernandezvillalobo\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"fernanda arias\",\"nb_usuario\":\"farias\",\"tx_email\":\"fernandacaro1410@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"sebastian jimenez\",\"nb_usuario\":\"sjimenez\",\"tx_email\":\"jimenezmonsalvo@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"shadia hermocilla\",\"nb_usuario\":\"shermocilla\",\"tx_email\":\"shadiapamelahermocillacastro@g\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"valerie beltran\",\"nb_usuario\":\"vbeltran\",\"tx_email\":\"vabeldo2006@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"alan aguilar\",\"nb_usuario\":\"aaguilar\",\"tx_email\":\"mancillanelly1982@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"madeleyn torres\",\"nb_usuario\":\"mtorres\",\"tx_email\":\"torresmadeleyn9@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"yahileth vanegas\",\"nb_usuario\":\"yvanegas\",\"tx_email\":\"yailethvanegas2019.05@gmail.co\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"sharol coneo\",\"nb_usuario\":\"sconeo\",\"tx_email\":\"coneosharol@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"duvan ahumada\",\"nb_usuario\":\"dahumada\",\"tx_email\":\"ahumadaduban@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"elias salcedo\",\"nb_usuario\":\"esalcedo\",\"tx_email\":\"ricardojuniorsalcedo@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"andrea romero\",\"nb_usuario\":\"aromero\",\"tx_email\":\"gissellebarleta@hotmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"ignacio garay\",\"nb_usuario\":\"igaray\",\"tx_email\":\"ignaciogaray002@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"kener torres\",\"nb_usuario\":\"ktorres\",\"tx_email\":\"tkener9@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"luisa loaiza\",\"nb_usuario\":\"lloaiza\",\"tx_email\":\"Lloaiza781@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"blas morales\",\"nb_usuario\":\"bmorales\",\"tx_email\":\"yaleniscastro392@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"linda ledesma\",\"nb_usuario\":\"lledesma\",\"tx_email\":\"rosamendiza1975@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"enuar melo\",\"nb_usuario\":\"emelo\",\"tx_email\":\"sandrybuelvas@hotmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"esteban arias\",\"nb_usuario\":\"earias\",\"tx_email\":\"ariasovallesesteban@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"samuel cantillo\",\"nb_usuario\":\"shcantillo\",\"tx_email\":\"nayocantillo@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"natalia herrera\",\"nb_usuario\":\"nherrera\",\"tx_email\":\"marlenenl@outlook.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"dilan polo\",\"nb_usuario\":\"dpolo\",\"tx_email\":\"marthagarizabal@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"laurieth morales\",\"nb_usuario\":\"lmorales\",\"tx_email\":\"laumogo1804mc@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"mateo garcia\",\"nb_usuario\":\"mgarcia\",\"tx_email\":\"licethromero21@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"valentina truyol\",\"nb_usuario\":\"vtruyol\",\"tx_email\":\"valutruyol@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"ana cervantes\",\"nb_usuario\":\"acervantes\",\"tx_email\":\"anaisabelcervantesmugno@gmail.\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"valery acosta\",\"nb_usuario\":\"vacosta\",\"tx_email\":\"adalysdorado1@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"adrian caraballo\",\"nb_usuario\":\"acaraballo\",\"tx_email\":\"caraballoadrian177@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"jovani guerra\",\"nb_usuario\":\"jguerra\",\"tx_email\":\"jhonatanguerracastro@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"santiago garcia\",\"nb_usuario\":\"sgarcia\",\"tx_email\":\"radajudith2689@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"jeimmy gutierrez\",\"nb_usuario\":\"jgutierrez\",\"tx_email\":\"mercedes0281mji@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"abrahan jimenez\",\"nb_usuario\":\"ajimenez\",\"tx_email\":\"nerlinda@outlook.es\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"juan martinez\",\"nb_usuario\":\"jcmartinez\",\"tx_email\":\"yarleidisacevedo7@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"cristina cantillo\",\"nb_usuario\":\"ccantillo\",\"tx_email\":\"tilsoncantillo10@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"ashlee garcia\",\"nb_usuario\":\"agarcia\",\"tx_email\":\"arilijohanna19@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"isabella gutierrez\",\"nb_usuario\":\"igutierrez\",\"tx_email\":\"mercedes0281mji@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"cristian alvarez\",\"nb_usuario\":\"calvarez\",\"tx_email\":\"iedmamey.edu@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"diana bedolla\",\"nb_usuario\":\"dbedolla\",\"tx_email\":\"iedmamey.edu@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"emily charris\",\"nb_usuario\":\"echarris\",\"tx_email\":\"iedmamey.edu@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"osnaider chiquillo\",\"nb_usuario\":\"ochiquillo\",\"tx_email\":\"iedmamey.edu@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"johana duran\",\"nb_usuario\":\"jduran\",\"tx_email\":\"iedmamey.edu@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"marcos lozano\",\"nb_usuario\":\"mlozano\",\"tx_email\":\"iedmamey.edu@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"ziana lozano\",\"nb_usuario\":\"zlozano\",\"tx_email\":\"iedmamey.edu@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"kevin luna\",\"nb_usuario\":\"kluna\",\"tx_email\":\"iedmamey.edu@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"adriana medina\",\"nb_usuario\":\"amedina\",\"tx_email\":\"iedmamey.edu@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"melany paez\",\"nb_usuario\":\"mpaez\",\"tx_email\":\"iedmamey.edu@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"luis palacios\",\"nb_usuario\":\"lpalacios\",\"tx_email\":\"iedmamey.edu@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"andrys pedroza\",\"nb_usuario\":\"apedroza\",\"tx_email\":\"iedmamey.edu@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"mariano pinto\",\"nb_usuario\":\"mpinto\",\"tx_email\":\"iedmamey.edu@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"zalemako pinto\",\"nb_usuario\":\"zpinto\",\"tx_email\":\"iedmamey.edu@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"zialekan pinto\",\"nb_usuario\":\"zpintod\",\"tx_email\":\"iedmamey.edu@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"yerlis ramirez\",\"nb_usuario\":\"yramirez\",\"tx_email\":\"iedmamey.edu@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"tania suarez\",\"nb_usuario\":\"tsuarez\",\"tx_email\":\"iedmamey.edu@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"marlon vargas\",\"nb_usuario\":\"mvargas\",\"tx_email\":\"iedmamey.edu@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"fabian castro\",\"nb_usuario\":\"fcastro\",\"tx_email\":\"iedmamey.edu@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"jeyderzon blanco\",\"nb_usuario\":\"jblanco\",\"tx_email\":\"iedmamey.edu@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"johan dearmas\",\"nb_usuario\":\"jdearmas\",\"tx_email\":\"iedmamey.edu@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"brayan flores\",\"nb_usuario\":\"bflores\",\"tx_email\":\"iedmamey.edu@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"adriana garcia\",\"nb_usuario\":\"agarciap\",\"tx_email\":\"iedmamey.edu@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"gina garcia\",\"nb_usuario\":\"ggarcia\",\"tx_email\":\"iedmamey.edu@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"paola giraldo\",\"nb_usuario\":\"pgiraldo\",\"tx_email\":\"iedmamey.edu@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"mary gutierrez\",\"nb_usuario\":\"mgutierrez\",\"tx_email\":\"iedmamey.edu@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"saray higuita\",\"nb_usuario\":\"shiguita\",\"tx_email\":\"iedmamey.edu@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"jesus lambrano\",\"nb_usuario\":\"jlambrano\",\"tx_email\":\"iedmamey.edu@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"esleider lara\",\"nb_usuario\":\"elara\",\"tx_email\":\"iedmamey.edu@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"jhoan lara\",\"nb_usuario\":\"jlara\",\"tx_email\":\"iedmamey.edu@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"skarleth leones\",\"nb_usuario\":\"sleones\",\"tx_email\":\"iedmamey.edu@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"maritza lopez\",\"nb_usuario\":\"mllopez\",\"tx_email\":\"iedmamey.edu@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"sol lora\",\"nb_usuario\":\"slora\",\"tx_email\":\"iedmamey.edu@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"yeraldine rada\",\"nb_usuario\":\"yrada\",\"tx_email\":\"iedmamey.edu@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"edwin reyes\",\"nb_usuario\":\"ereyes\",\"tx_email\":\"iedmamey.edu@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"camilo rios\",\"nb_usuario\":\"crios\",\"tx_email\":\"iedmamey.edu@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"yuli tapias\",\"nb_usuario\":\"ytapias\",\"tx_email\":\"iedmamey.edu@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"diana murillo\",\"nb_usuario\":\"dmurillo\",\"tx_email\":\"iedmamey.edu@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"tania castelbondo\",\"nb_usuario\":\"tcastelbondo\",\"tx_email\":\"iedmamey.edu@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"luis barragan\",\"nb_usuario\":\"lbarragan\",\"tx_email\":\"iedmamey.edu@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"yoiner castelbondo\",\"nb_usuario\":\"ycastelbondo\",\"tx_email\":\"iedmamey.edu@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"luis gallego\",\"nb_usuario\":\"lgallego\",\"tx_email\":\"iedmamey.edu@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"yarih pertuz\",\"nb_usuario\":\"ypertuz\",\"tx_email\":\"iedmamey.edu@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"jose lozano\",\"nb_usuario\":\"jlozano\",\"tx_email\":\"iedmamey.edu@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"michel castillo\",\"nb_usuario\":\"mcastillo\",\"tx_email\":\"iedmamey.edu@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"luis llanos\",\"nb_usuario\":\"lllanos\",\"tx_email\":\"iedmamey.edu@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"eliaser lozano\",\"nb_usuario\":\"elozano\",\"tx_email\":\"iedmamey.edu@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"manawi lozano\",\"nb_usuario\":\"mlozanod\",\"tx_email\":\"iedmamey.edu@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"jones lozano\",\"nb_usuario\":\"jlozanod\",\"tx_email\":\"iedmamey.edu@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"roberto lozano\",\"nb_usuario\":\"rlozano\",\"tx_email\":\"iedmamey.edu@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"didier meneses\",\"nb_usuario\":\"dmeneses\",\"tx_email\":\"iedmamey.edu@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"yenifer cuellar\",\"nb_usuario\":\"ycuellar\",\"tx_email\":\"iedmamey.edu@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"uriel moscote\",\"nb_usuario\":\"umoscote\",\"tx_email\":\"iedmamey.edu@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"maria anaya\",\"nb_usuario\":\"mdanaya\",\"tx_email\":\"yucontre01@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"sharith pino\",\"nb_usuario\":\"spino\",\"tx_email\":\"emivega73@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"yanelis santos\",\"nb_usuario\":\"ysantos\",\"tx_email\":\"saumethjaimeguillermo75@gmail.\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"dulce saumeth\",\"nb_usuario\":\"dsaumeth\",\"tx_email\":\"menzadalgiza36@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"valery diaz\",\"nb_usuario\":\"vdiaz\",\"tx_email\":\"vivianocampo13@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"pedro molina\",\"nb_usuario\":\"pmolina\",\"tx_email\":\"cipago2@hotmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"liz bermudez\",\"nb_usuario\":\"lbermudez\",\"tx_email\":\"lizjoeskaberdugotorres@gmail.c\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"karla molina\",\"nb_usuario\":\"kmolina\",\"tx_email\":\"amayapinedaluisafernanda@gmail\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"javier mugno\",\"nb_usuario\":\"jmugno\",\"tx_email\":\"alexis26jul@hotmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"laura menco\",\"nb_usuario\":\"lmenco\",\"tx_email\":\"laurayossua1gmail.com \",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"william castillo\",\"nb_usuario\":\"wcastillo\",\"tx_email\":\"yulisoliveras1986@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"maria gamarra\",\"nb_usuario\":\"mgamarra\",\"tx_email\":\"gamarra46@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"felix ramirez\",\"nb_usuario\":\"framirez\",\"tx_email\":\"ramireztorresluisalberto4@gmai\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"kaner vina\",\"nb_usuario\":\"kvina\",\"tx_email\":\"luzsierraf@hotmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"andrea simanca\",\"nb_usuario\":\"asimanca\",\"tx_email\":\"kathesaumeth@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"helena guerra\",\"nb_usuario\":\"hguerra\",\"tx_email\":\"yanithyaneth@hotmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"carlos coronel\",\"nb_usuario\":\"ccoronel\",\"tx_email\":\"carlosdanielcoronelvisbal@gmai\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"isabella vizcaino\",\"nb_usuario\":\"ivizcaino\",\"tx_email\":\"saredi0912@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"gabriela marbello\",\"nb_usuario\":\"gmarbello\",\"tx_email\":\"gabrielamarbello@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"jeylee pallares\",\"nb_usuario\":\"jpallares\",\"tx_email\":\"jeylee2112@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"maibelindelosangeles castro\",\"nb_usuario\":\"mcastro\",\"tx_email\":\"odiliajhonson20@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"maria castro\",\"nb_usuario\":\"macastro\",\"tx_email\":\"odiliajhonson20@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"maria ferrer\",\"nb_usuario\":\"mferrer\",\"tx_email\":\"mariasaumeth0302@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"leidis castro\",\"nb_usuario\":\"lcastro\",\"tx_email\":\"danithbarandica.m@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"danna pascuales\",\"nb_usuario\":\"dpascuales\",\"tx_email\":\"castroeucaris20@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"saith garcia\",\"nb_usuario\":\"sjgarcia\",\"tx_email\":\"marlysgarc\\u00eda@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"jainer paredes\",\"nb_usuario\":\"jparedes\",\"tx_email\":\"sugerodriguez14@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"sharick campo\",\"nb_usuario\":\"scampo\",\"tx_email\":\"sazasha0302@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"valeria carroll\",\"nb_usuario\":\"vcarroll\",\"tx_email\":\"Valeriaaltafulla36@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"neiledis coronado\",\"nb_usuario\":\"ncoronado\",\"tx_email\":\"nejhaconi_06@hotmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"diana coronado\",\"nb_usuario\":\"dcoronado\",\"tx_email\":\"dianacarolinad383@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"andrea daza\",\"nb_usuario\":\"adaza\",\"tx_email\":\"andrea5cadaro@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"heidy delahoz\",\"nb_usuario\":\"hdelahoz\",\"tx_email\":\"delaozsalas@Gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"ana deleon\",\"nb_usuario\":\"adeleon\",\"tx_email\":\"Betsy121783@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"oreanadelpilar escorcia\",\"nb_usuario\":\"oescorcia\",\"tx_email\":\"oreana.2006@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"marihan estrada\",\"nb_usuario\":\"mestrada\",\"tx_email\":\"Jpaolarori@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"isabela fernandez\",\"nb_usuario\":\"ifernandez\",\"tx_email\":\"Isabellafernandez1208@gmil.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"greilys henriquez\",\"nb_usuario\":\"ghenriquez\",\"tx_email\":\"greilyd@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"estefany huertas\",\"nb_usuario\":\"ehuertas\",\"tx_email\":\"estefanyhuertasz04@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"betsy ibanez\",\"nb_usuario\":\"bibanez\",\"tx_email\":\"melabetsyp@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"stefany lagos\",\"nb_usuario\":\"slagos\",\"tx_email\":\"stefanysofialagosmelendez@gmai\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"mariangel larrota\",\"nb_usuario\":\"mlarrota\",\"tx_email\":\"yeleinis1997@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"jennifer leyva\",\"nb_usuario\":\"jleyva\",\"tx_email\":\"Jenyaleja@icloud.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"juliana lobato\",\"nb_usuario\":\"jlobato\",\"tx_email\":\"julianalobato07@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"yenizareth martinez\",\"nb_usuario\":\"ymartinez\",\"tx_email\":\"martinezyenizareth@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"karolayne mojica\",\"nb_usuario\":\"kmojica\",\"tx_email\":\"Llerekaro@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"melanie moreno\",\"nb_usuario\":\"mmoreno\",\"tx_email\":\"Melaniesofi0412@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"sharon ortiz\",\"nb_usuario\":\"sortiz\",\"tx_email\":\"michellgranadoscarrillo@gmail.\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"diocelina pabon\",\"nb_usuario\":\"dpabon\",\"tx_email\":\"dpabonduran@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"silvia quintana\",\"nb_usuario\":\"squintana\",\"tx_email\":\"Silviaquintanatorres28@gmail.c\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"axcelly ramirez\",\"nb_usuario\":\"aramirez\",\"tx_email\":\"axcellyr@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"keyla restrepo\",\"nb_usuario\":\"krestrepo\",\"tx_email\":\"krestrepoortiz@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"angelina rodriguez\",\"nb_usuario\":\"arodriguez\",\"tx_email\":\"angelinavanessa10@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"laura rosado\",\"nb_usuario\":\"lrosado\",\"tx_email\":\"laurarosadoc6@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"valentina salazar\",\"nb_usuario\":\"vsalazar\",\"tx_email\":\"Estudiante7valentinasalem@gmai\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"camila salazar\",\"nb_usuario\":\"csalazar\",\"tx_email\":\"camilaisabelsalazar@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"danna salcedo\",\"nb_usuario\":\"dsalcedo\",\"tx_email\":\"danna3448@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"andrea sanchez\",\"nb_usuario\":\"asanchez\",\"tx_email\":\"magdav420@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"valentina sotomayor\",\"nb_usuario\":\"vsotomayor\",\"tx_email\":\"valentinaro675@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"emily toledo\",\"nb_usuario\":\"etoledo\",\"tx_email\":\"emily102507@hotmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"yeiris tovar\",\"nb_usuario\":\"ytovar\",\"tx_email\":\"yeyantobb@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"valeria vesga\",\"nb_usuario\":\"vvesga\",\"tx_email\":\"valeriavesgafernandez19@gmail.\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"wendy castillo\",\"nb_usuario\":\"wkcastillo\",\"tx_email\":\"wendycastillo807@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"paula sanchez\",\"nb_usuario\":\"psanchez\",\"tx_email\":\"sanmartinezfernandez@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"valery ternera\",\"nb_usuario\":\"vternera\",\"tx_email\":\"valeryternera28@gmial.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"marianadelosangeles suarez\",\"nb_usuario\":\"msuarez\",\"tx_email\":\"marianasuarez.30.mari@gmail.co\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"mariana guerrero\",\"nb_usuario\":\"mguerrero\",\"tx_email\":\"mg3820192@gmail.com\",\"nb_tipo_usuario\":\"alumno\"},{\"nb_nombres\":\"yustiz hector\",\"nb_usuario\":\"yhector\",\"tx_email\":\"lyustiz@gmail.com\",\"nb_tipo_usuario\":\"acudiente\"},{\"nb_nombres\":\"juan medina\",\"nb_usuario\":\"jmedina\",\"tx_email\":\"lyustiz@gmail.com\",\"nb_tipo_usuario\":\"empleado\"}],\"headers\":[{\"text\":\"Nombres\",\"value\":\"nb_nombres\"},{\"text\":\"Usuario\",\"value\":\"nb_usuario\"},{\"text\":\"Email\",\"value\":\"tx_email\"},{\"text\":\"Tipo Usuario\",\"value\":\"nb_tipo_usuario\"}]},\"duration\":916,\"memory\":4,\"hostname\":\"lyustiz-PC\"}', '2021-04-08 02:23:31');

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
INSERT INTO `telescope_entries_tags` VALUES ('932478e8-ac08-46c2-9479-8aafa895e316', 'slow');

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
-- Table structure for tema
-- ----------------------------
DROP TABLE IF EXISTS `tema`;
CREATE TABLE `tema` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_tema` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `nu_tema` int(11) NOT NULL,
  `tx_descripcion` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `id_materia` int(11) unsigned NOT NULL,
  `id_grado` int(11) unsigned NOT NULL,
  `nu_nivel` int(11) DEFAULT NULL,
  `nu_peso` int(11) DEFAULT NULL,
  `id_status` int(11) unsigned NOT NULL,
  `id_usuario` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tema_materia` (`id_materia`),
  KEY `fk_tema_grado` (`id_grado`),
  KEY `fk_tema_status` (`id_status`),
  KEY `fk_tema_usuario` (`id_usuario`),
  CONSTRAINT `fk_tema_grado` FOREIGN KEY (`id_grado`) REFERENCES `grado` (`id`),
  CONSTRAINT `fk_tema_materia` FOREIGN KEY (`id_materia`) REFERENCES `materia` (`id`),
  CONSTRAINT `fk_tema_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`),
  CONSTRAINT `fk_tema_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of tema
-- ----------------------------
INSERT INTO `tema` VALUES ('0', '-', '0', '', '1', '1', '1', '1', '2', '1', '2021-03-12 02:02:49', '2021-03-12 02:02:49');
INSERT INTO `tema` VALUES ('1', 'Ingles A1', '1', 'Ingles A1', '1', '4', '1', '1', '1', '1', '2021-03-12 01:59:53', '2021-03-12 01:59:53');
INSERT INTO `tema` VALUES ('2', 'Ingles A2', '2', '', '1', '4', '1', '1', '1', '1', '2021-03-12 02:00:20', '2021-03-12 02:00:20');
INSERT INTO `tema` VALUES ('3', 'Ingles B1', '3', null, '1', '4', '1', '1', '1', '1', '2021-03-12 02:01:38', '2021-03-12 02:01:50');
INSERT INTO `tema` VALUES ('4', 'Ingles B2', '4', '', '1', '4', '1', '1', '1', '1', '2021-03-12 02:02:09', '2021-03-12 02:02:09');
INSERT INTO `tema` VALUES ('5', 'Ingles C1', '5', '', '1', '4', '1', '1', '1', '1', '2021-03-12 02:02:33', '2021-03-12 02:02:33');
INSERT INTO `tema` VALUES ('6', 'Ingles C2', '6', '', '1', '4', '1', '1', '1', '1', '2021-03-12 02:02:49', '2021-03-12 02:02:49');

-- ----------------------------
-- Table structure for tipo_agenda
-- ----------------------------
DROP TABLE IF EXISTS `tipo_agenda`;
CREATE TABLE `tipo_agenda` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_tipo_agenda` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tx_color` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) unsigned NOT NULL,
  `id_usuario` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tipo_agenda_status` (`id_status`),
  KEY `fk_tipo_agenda_usuario` (`id_usuario`),
  CONSTRAINT `fk_tipo_agenda_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`),
  CONSTRAINT `fk_tipo_agenda_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `id_status` int(11) unsigned NOT NULL,
  `id_usuario` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tipo_archivo_status` (`id_status`),
  KEY `fk_tipo_archivo_usuario` (`id_usuario`),
  CONSTRAINT `fk_tipo_archivo_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`),
  CONSTRAINT `fk_tipo_archivo_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
INSERT INTO `tipo_archivo` VALUES ('8', 'Recurso-Audio', 'recurso', 'recurso-audio', '/storage/recurso/audio/', 'audio', null, '1', '1', '2020-07-01 22:27:25', '2020-07-09 16:08:51');
INSERT INTO `tipo_archivo` VALUES ('9', 'Recurso-Video', 'recurso', 'recurso-video', '/storage/recurso/video/', 'video', null, '1', '1', '2020-07-01 22:29:19', '2020-07-09 16:09:02');
INSERT INTO `tipo_archivo` VALUES ('10', 'Recurso-Guias', 'recurso', 'recurso-guia', '/storage/recurso/guia/', 'guia', null, '1', '1', '2020-07-01 22:30:27', '2020-07-09 16:09:12');
INSERT INTO `tipo_archivo` VALUES ('11', 'Tarea', 'tarea', 'tarea', '/storage/tarea/', 'tarea', null, '1', '1', '2020-09-07 09:30:13', '2020-09-07 09:30:16');
INSERT INTO `tipo_archivo` VALUES ('12', 'Libro', 'libro', 'libro', '/storage/libro/', 'libro', null, '1', '1', '2020-10-06 09:52:31', '2020-10-06 09:52:35');
INSERT INTO `tipo_archivo` VALUES ('13', 'Tarea-Alumno', 'evaluacion_alumno', 'tarea-alumno', '/storage/tarea/alumno/', 'tarea', null, '1', '1', '2020-11-13 21:52:59', '2020-11-13 21:53:05');

-- ----------------------------
-- Table structure for tipo_calificacion
-- ----------------------------
DROP TABLE IF EXISTS `tipo_calificacion`;
CREATE TABLE `tipo_calificacion` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_tipo_calificacion` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) unsigned NOT NULL,
  `id_usuario` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tipo_calificacion_status` (`id_status`),
  KEY `fk_tipo_calificacion_usuario` (`id_usuario`),
  CONSTRAINT `fk_tipo_calificacion_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`),
  CONSTRAINT `fk_tipo_calificacion_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
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
  `id_status` int(11) unsigned NOT NULL,
  `id_usuario` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tipo_colegio_status` (`id_status`),
  KEY `fk_tipo_colegio_usuario` (`id_usuario`),
  CONSTRAINT `fk_tipo_colegio_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`),
  CONSTRAINT `fk_tipo_colegio_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `id_status` int(11) unsigned NOT NULL,
  `id_usuario` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tipo_condicion_status` (`id_status`),
  KEY `fk_tipo_condicion_usuario` (`id_usuario`),
  CONSTRAINT `fk_tipo_condicion_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`),
  CONSTRAINT `fk_tipo_condicion_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `id_status` int(11) unsigned NOT NULL,
  `id_usuario` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tipo_contacto_status` (`id_status`),
  KEY `fk_tipo_contacto_usuario` (`id_usuario`),
  CONSTRAINT `fk_tipo_contacto_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`),
  CONSTRAINT `fk_tipo_contacto_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
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
  `id_status` int(11) unsigned NOT NULL,
  `id_usuario` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tipo_destinatario_status` (`id_status`),
  KEY `fk_tipo_destinatario_usuario` (`id_usuario`),
  CONSTRAINT `fk_tipo_destinatario_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`),
  CONSTRAINT `fk_tipo_destinatario_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of tipo_destinatario
-- ----------------------------
INSERT INTO `tipo_destinatario` VALUES ('1', 'Administrador', 'empleado', 'mdi-account-group', 'red', null, '1', '1', '2020-07-22 20:58:22', '2020-07-22 20:58:22');
INSERT INTO `tipo_destinatario` VALUES ('2', 'Docente', 'docente', 'mdi-account-tie', 'purple', null, '1', '1', '2020-07-22 21:00:11', '2020-07-22 21:00:11');
INSERT INTO `tipo_destinatario` VALUES ('3', 'Alumno', 'alumno', 'mdi-school', 'blue', null, '1', '1', '2020-07-22 21:00:51', '2020-07-22 21:00:51');
INSERT INTO `tipo_destinatario` VALUES ('4', 'Acudiente', 'pariente', 'mdi-human-male-child', 'teal', null, '1', '1', '2020-07-22 21:04:17', '2020-07-22 21:04:17');
INSERT INTO `tipo_destinatario` VALUES ('5', 'Empleado', 'empleado', 'mdi-chair-rolling', 'indigo', null, '1', '1', '2020-07-22 21:05:49', '2020-07-22 21:05:49');
INSERT INTO `tipo_destinatario` VALUES ('99', 'General', '*', '', '', null, '1', '1', null, null);

-- ----------------------------
-- Table structure for tipo_directiva
-- ----------------------------
DROP TABLE IF EXISTS `tipo_directiva`;
CREATE TABLE `tipo_directiva` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_tipo_directiva` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) unsigned NOT NULL,
  `id_usuario` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tipo_directiva_status` (`id_status`),
  KEY `fk_tipo_directiva_usuario` (`id_usuario`),
  CONSTRAINT `fk_tipo_directiva_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`),
  CONSTRAINT `fk_tipo_directiva_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of tipo_directiva
-- ----------------------------
INSERT INTO `tipo_directiva` VALUES ('1', 'Junta Directiva', null, '1', '1', '2020-05-08 19:02:22', '2020-05-08 19:02:22');
INSERT INTO `tipo_directiva` VALUES ('2', 'Asociacion de Padres', null, '1', '1', '2020-05-08 19:02:44', '2020-05-08 19:02:44');
INSERT INTO `tipo_directiva` VALUES ('3', 'Administrativo', null, '1', '1', '2020-05-08 19:03:04', '2020-05-08 19:03:04');

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
  `id_status` int(11) unsigned NOT NULL,
  `id_usuario` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tipo_documento_status` (`id_status`),
  KEY `fk_tipo_documento_usuario` (`id_usuario`),
  CONSTRAINT `fk_tipo_documento_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`),
  CONSTRAINT `fk_tipo_documento_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of tipo_documento
-- ----------------------------
INSERT INTO `tipo_documento` VALUES ('1', 'Cedula', null, null, 'ID', null, '1', '1', null, null);
INSERT INTO `tipo_documento` VALUES ('2', 'Pasaporte', null, null, 'ID', null, '1', '1', null, null);

-- ----------------------------
-- Table structure for tipo_enlace
-- ----------------------------
DROP TABLE IF EXISTS `tipo_enlace`;
CREATE TABLE `tipo_enlace` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_tipo_enlace` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tx_icono` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tx_color` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) unsigned NOT NULL,
  `id_usuario` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tipo_enlace_status` (`id_status`),
  KEY `fk_tipo_enlace_usuario` (`id_usuario`),
  CONSTRAINT `fk_tipo_enlace_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`),
  CONSTRAINT `fk_tipo_enlace_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of tipo_enlace
-- ----------------------------
INSERT INTO `tipo_enlace` VALUES ('1', 'Web', 'mdi-earth', 'blue', null, '1', '1', '2020-10-10 19:17:12', '2020-10-10 19:17:12');
INSERT INTO `tipo_enlace` VALUES ('2', 'YouTube', 'mdi-play-box', 'red', null, '1', '1', '2020-10-10 19:20:19', '2020-10-10 19:20:19');

-- ----------------------------
-- Table structure for tipo_evaluacion
-- ----------------------------
DROP TABLE IF EXISTS `tipo_evaluacion`;
CREATE TABLE `tipo_evaluacion` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_tipo_evaluacion` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tx_icono` varchar(35) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `tx_color` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_origen` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tx_clase` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_criterio` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nu_criterio` decimal(11,0) DEFAULT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) unsigned NOT NULL,
  `id_usuario` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tipo_evaluacion_status` (`id_status`),
  KEY `fk_tipo_evaluacion_usuario` (`id_usuario`),
  CONSTRAINT `fk_tipo_evaluacion_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`),
  CONSTRAINT `fk_tipo_evaluacion_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of tipo_evaluacion
-- ----------------------------
INSERT INTO `tipo_evaluacion` VALUES ('1', 'Cuestionario', 'mdi-order-bool-descending-variant', 'teal', 'prueba', 'evaluacion', 'completar', null, '', '1', '1', '2020-05-25 22:43:23', '2020-09-06 18:05:20');
INSERT INTO `tipo_evaluacion` VALUES ('2', 'Tarea', 'mdi-notebook', 'deep-purple', 'tarea', 'evaluacion', 'tiempo', '10', null, '1', '1', '2020-05-25 22:43:39', '2020-05-25 22:43:39');
INSERT INTO `tipo_evaluacion` VALUES ('3', 'Actividad', 'mdi-rocket-launch', 'amber', 'actividad', 'asignacion', 'completar', null, null, '1', '1', '2020-05-25 22:44:01', '2020-05-25 22:44:01');
INSERT INTO `tipo_evaluacion` VALUES ('4', 'Video', 'mdi-play-box-multiple', 'red', 'enlace', 'asignacion', 'tiempo', '10', null, '1', '1', '2020-05-25 22:44:27', '2020-05-25 22:44:27');
INSERT INTO `tipo_evaluacion` VALUES ('5', 'Audio', 'mdi-music-box-multiple', 'orange', 'recurso', 'asignacion', 'tiempo', '10', null, '1', '1', '2020-05-25 22:44:37', '2020-05-25 22:44:37');
INSERT INTO `tipo_evaluacion` VALUES ('6', 'Enlace', 'mdi-earth', 'blue', 'enlace', 'asignacion', 'tiempo', '10', null, '1', '1', '2021-01-22 13:13:15', '2021-01-22 13:13:18');
INSERT INTO `tipo_evaluacion` VALUES ('7', 'Lectura', 'mdi-library', 'purple', 'recurso', 'asignacion', 'tiempo', '10', null, '1', '1', '2020-05-25 22:44:37', '2020-05-25 22:44:37');
INSERT INTO `tipo_evaluacion` VALUES ('8', 'Rasgos', 'mdi-human-male-height-variant', 'pink', 'rasgo', 'rasgo', 'evaluacion', null, null, '1', '1', null, null);

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
  `id_status` int(11) unsigned NOT NULL,
  `id_usuario` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tipo_falta_status` (`id_status`),
  KEY `fk_tipo_falta_usuario` (`id_usuario`),
  CONSTRAINT `fk_tipo_falta_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`),
  CONSTRAINT `fk_tipo_falta_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
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
  `id_status` int(11) unsigned NOT NULL,
  `id_usuario` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tipo_feriado_status` (`id_status`),
  KEY `fk_tipo_feriado_usuario` (`id_usuario`),
  CONSTRAINT `fk_tipo_feriado_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`),
  CONSTRAINT `fk_tipo_feriado_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
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
  `id_status` int(11) unsigned NOT NULL,
  `id_usuario` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tipo_foto_status` (`id_status`),
  KEY `fk_tipo_foto_usuario` (`id_usuario`),
  CONSTRAINT `fk_tipo_foto_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`),
  CONSTRAINT `fk_tipo_foto_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of tipo_foto
-- ----------------------------
INSERT INTO `tipo_foto` VALUES ('1', 'Colegio', 'colegio', 'foto', '/storage/foto/colegio/', 'colegio', null, '1', '1', '2020-06-02 00:37:58', '2020-07-09 00:08:33');
INSERT INTO `tipo_foto` VALUES ('2', 'Alumno', 'alumno', 'foto', '/storage/foto/alumno/', 'alumno', null, '1', '1', '2020-07-09 00:03:51', '2020-07-09 00:08:10');
INSERT INTO `tipo_foto` VALUES ('3', 'Docente', 'docente', 'foto', '/storage/foto/docente/', 'docente', null, '1', '1', '2020-07-09 16:02:40', '2020-07-09 16:02:53');
INSERT INTO `tipo_foto` VALUES ('4', 'Cuenta', 'cuenta', 'foto', '/storage/foto/cuenta/', 'cuenta', null, '1', '1', '2020-07-16 00:58:08', '2020-07-16 00:58:26');
INSERT INTO `tipo_foto` VALUES ('5', 'Acudiente', 'pariente', 'foto', '/storage/foto/pariente/', 'pariente', null, '1', '1', '2020-07-25 23:52:25', '2020-07-25 23:53:11');
INSERT INTO `tipo_foto` VALUES ('6', 'Actividad', 'actividad', 'foto', '/storage/foto/actividad/', 'actividad', null, '1', '1', '2020-10-30 12:40:31', '2020-10-30 12:40:34');
INSERT INTO `tipo_foto` VALUES ('7', 'Pregunta', 'pregunta', 'foto', '/storage/foto/pregunta/', 'pregunta', null, '1', '1', '2020-10-31 10:31:38', '2020-10-31 10:31:42');
INSERT INTO `tipo_foto` VALUES ('8', 'Empleado', 'empleado', 'foto', '/storage/foto/empleado/', 'empleado', null, '1', '1', '2020-06-02 00:37:58', '2020-06-02 00:37:58');
INSERT INTO `tipo_foto` VALUES ('9', 'Certificado', 'certificado', 'foto', '/storage/foto/certificado/', 'certificado', null, '1', '1', '2020-06-02 00:37:58', '2020-06-02 00:37:58');

-- ----------------------------
-- Table structure for tipo_mensaje
-- ----------------------------
DROP TABLE IF EXISTS `tipo_mensaje`;
CREATE TABLE `tipo_mensaje` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_tipo_mensaje` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tx_icono` varchar(35) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `tx_color` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) unsigned NOT NULL,
  `id_usuario` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tipo_mensaje_status` (`id_status`),
  KEY `fk_tipo_mensaje_usuario` (`id_usuario`),
  CONSTRAINT `fk_tipo_mensaje_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`),
  CONSTRAINT `fk_tipo_mensaje_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of tipo_mensaje
-- ----------------------------
INSERT INTO `tipo_mensaje` VALUES ('1', 'Informacion', 'mdi-account-voice', 'cyan', null, '1', '1', '2020-07-22 21:08:14', '2020-09-28 13:38:19');
INSERT INTO `tipo_mensaje` VALUES ('2', 'Reunion', 'mdi-account-multiple', 'deep-orange', null, '1', '1', '2020-07-22 21:11:01', '2020-09-28 13:09:26');

-- ----------------------------
-- Table structure for tipo_notificacion
-- ----------------------------
DROP TABLE IF EXISTS `tipo_notificacion`;
CREATE TABLE `tipo_notificacion` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_tipo_notificacion` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tx_icono` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `tx_color` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) unsigned NOT NULL,
  `id_usuario` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tipo_notificacion_status` (`id_status`),
  KEY `fk_tipo_notificacion_usuario` (`id_usuario`),
  CONSTRAINT `fk_tipo_notificacion_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`),
  CONSTRAINT `fk_tipo_notificacion_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of tipo_notificacion
-- ----------------------------
INSERT INTO `tipo_notificacion` VALUES ('1', 'Reunion', 'mdi-account-multiple', 'red', 'Nueva Reunion', '1', '1', '2020-07-22 21:08:14', '2020-07-22 21:08:14');
INSERT INTO `tipo_notificacion` VALUES ('2', 'Recordatorio', 'mdi-account-clock', 'orange', 'Nuevo Recordatorio', '1', '1', '2020-07-22 21:11:01', '2020-07-22 21:11:01');
INSERT INTO `tipo_notificacion` VALUES ('3', 'Evento', 'mdi-calendar-clock', 'purple', 'Se ha cargado un nuevo evento', '1', '1', '2020-07-22 21:12:37', '2020-07-22 21:12:37');
INSERT INTO `tipo_notificacion` VALUES ('4', 'Sancion', 'mdi-gavel', 'red', 'Se ha levantado una sancional al alumno {{alumno}}', '1', '1', '2020-09-26 14:30:32', '2020-09-26 14:30:32');
INSERT INTO `tipo_notificacion` VALUES ('5', 'Clase', 'mdi-google-classroom', 'blue', 'Inicio de Clase Materia: {{materia}}', '1', '1', '2020-11-10 18:20:17', '2020-11-10 18:20:21');
INSERT INTO `tipo_notificacion` VALUES ('6', 'Asignacion', 'mdi-clipboard-check', 'amber', 'Nueva Asignacion - Tipo: {{tipo}},  Materia: {{materia}} ', '1', '1', '2020-11-10 18:22:03', '2020-11-10 18:22:08');
INSERT INTO `tipo_notificacion` VALUES ('7', 'Evaluacion', 'mdi-clipboard-check', 'teal', 'Nuevo Cuestionario  Materia: {{materia}}', '1', '1', '2020-11-10 18:27:21', '2021-02-04 18:35:49');
INSERT INTO `tipo_notificacion` VALUES ('8', 'Tarea', 'mdi-notebook', 'indigo', 'Nueva Tarea Materia: {{materia}} ', '1', '1', '2020-11-10 18:27:26', '2020-11-10 18:27:31');
INSERT INTO `tipo_notificacion` VALUES ('9', 'Informacion', 'mdi-message-bulleted', 'info', 'Informacion', '1', '1', '2020-11-27 20:55:24', '2020-11-27 20:55:27');
INSERT INTO `tipo_notificacion` VALUES ('10', 'Reporte Evaluacion', 'mdi-clipboard-alert', 'warning', 'Reporte a la Evluacion: {{evaluacion}}', '1', '1', '2021-02-04 13:49:24', '2021-02-04 13:49:24');

-- ----------------------------
-- Table structure for tipo_pago
-- ----------------------------
DROP TABLE IF EXISTS `tipo_pago`;
CREATE TABLE `tipo_pago` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_tipo_pago` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_comercio` int(11) unsigned NOT NULL,
  `tx_icono` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) unsigned NOT NULL,
  `id_usuario` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tipo_pago_status` (`id_status`),
  KEY `fk_tipo_pago_usuario` (`id_usuario`),
  CONSTRAINT `fk_tipo_pago_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`),
  CONSTRAINT `fk_tipo_pago_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
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
  `tx_icono` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tx_color` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) unsigned NOT NULL,
  `id_usuario` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tipo_pregunta_status` (`id_status`),
  KEY `fk_tipo_pregunta_usuario` (`id_usuario`),
  CONSTRAINT `fk_tipo_pregunta_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`),
  CONSTRAINT `fk_tipo_pregunta_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of tipo_pregunta
-- ----------------------------
INSERT INTO `tipo_pregunta` VALUES ('1', 'Desarrollo', 'mdi-text-box-outline', 'info', 'Desarrolle su respuesta', '1', '1', '2020-08-02 20:26:01', '2020-08-18 17:49:38');
INSERT INTO `tipo_pregunta` VALUES ('2', 'Seleccion Simple', 'mdi-checkbox-marked-outline', 'blue', 'Debe seleccionarse solo una (1) respuesta correcta', '1', '1', '2020-08-02 20:27:56', '2020-08-04 21:17:54');
INSERT INTO `tipo_pregunta` VALUES ('3', 'Seleccion Multiple', 'mdi-checkbox-multiple-marked-outline', 'deep-purple', 'Pueden seleccionarse mas de una (1+) respuesta válida', '1', '1', '2020-08-02 20:28:29', '2020-08-04 21:07:03');

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
  `id_status` int(11) unsigned NOT NULL,
  `id_usuario` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tipo_prioridad_status` (`id_status`),
  KEY `fk_tipo_prioridad_usuario` (`id_usuario`),
  CONSTRAINT `fk_tipo_prioridad_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`),
  CONSTRAINT `fk_tipo_prioridad_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
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
  `id_tipo_archivo` int(11) unsigned NOT NULL,
  `tx_icono` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tx_color` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) unsigned NOT NULL,
  `id_usuario` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tipo_recurso_tipo_archivo` (`id_tipo_archivo`),
  KEY `fk_tipo_recurso_status` (`id_status`),
  KEY `fk_tipo_recurso_usuario` (`id_usuario`),
  CONSTRAINT `fk_tipo_recurso_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`),
  CONSTRAINT `fk_tipo_recurso_tipo_archivo` FOREIGN KEY (`id_tipo_archivo`) REFERENCES `tipo_archivo` (`id`),
  CONSTRAINT `fk_tipo_recurso_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of tipo_recurso
-- ----------------------------
INSERT INTO `tipo_recurso` VALUES ('1', 'Audio', '8', 'mdi-book-multiple', 'purple', null, '1', '1', '2020-07-01 22:03:34', '2020-07-22 21:17:10');
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
  `id_status` int(11) unsigned NOT NULL,
  `id_usuario` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tipo_sancion_status` (`id_status`),
  KEY `fk_tipo_sancion_usuario` (`id_usuario`),
  CONSTRAINT `fk_tipo_sancion_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`),
  CONSTRAINT `fk_tipo_sancion_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
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
-- Table structure for tipo_tarea
-- ----------------------------
DROP TABLE IF EXISTS `tipo_tarea`;
CREATE TABLE `tipo_tarea` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_tipo_tarea` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tx_icono` varchar(35) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_color` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) unsigned NOT NULL,
  `id_usuario` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tipo_tarea_status` (`id_status`),
  KEY `fk_tipo_tarea_usuario` (`id_usuario`),
  CONSTRAINT `fk_tipo_tarea_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`),
  CONSTRAINT `fk_tipo_tarea_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of tipo_tarea
-- ----------------------------
INSERT INTO `tipo_tarea` VALUES ('1', 'Cuadro Comparativo', null, null, null, '1', '1', '2020-11-13 08:38:26', '2021-02-02 23:38:38');
INSERT INTO `tipo_tarea` VALUES ('2', 'Mapa Mental', '', null, null, '1', '1', '2020-11-13 08:39:55', '2020-11-13 08:39:58');
INSERT INTO `tipo_tarea` VALUES ('3', 'Taller', '', null, null, '1', '1', '2020-11-13 08:40:40', '2020-11-13 08:40:44');
INSERT INTO `tipo_tarea` VALUES ('4', 'Resumen', '', null, null, '1', '1', '2020-11-13 08:41:19', '2020-11-13 08:41:22');
INSERT INTO `tipo_tarea` VALUES ('5', 'Triptico', '', null, null, '1', '1', '2020-11-13 08:43:50', '2020-11-13 08:43:56');

-- ----------------------------
-- Table structure for tipo_telefono
-- ----------------------------
DROP TABLE IF EXISTS `tipo_telefono`;
CREATE TABLE `tipo_telefono` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_tipo_telefono` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tx_icono` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) unsigned NOT NULL,
  `id_usuario` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tipo_telefono_status` (`id_status`),
  KEY `fk_tipo_telefono_usuario` (`id_usuario`),
  CONSTRAINT `fk_tipo_telefono_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`),
  CONSTRAINT `fk_tipo_telefono_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of tipo_telefono
-- ----------------------------
INSERT INTO `tipo_telefono` VALUES ('1', 'Fijo/Local', 'mdi-phone-classic', null, '1', '1', '2020-05-08 19:12:42', '2020-05-08 19:12:42');
INSERT INTO `tipo_telefono` VALUES ('2', 'Movil/Celular', 'mdi-cellphone-android', null, '1', '1', '2020-05-08 20:06:19', '2020-05-08 20:06:19');
INSERT INTO `tipo_telefono` VALUES ('3', 'Fax', 'mdi-printer', null, '1', '1', '2020-05-08 20:06:55', '2020-05-08 20:06:55');

-- ----------------------------
-- Table structure for tipo_tema
-- ----------------------------
DROP TABLE IF EXISTS `tipo_tema`;
CREATE TABLE `tipo_tema` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_tipo_tema` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tx_icono` varchar(35) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tx_color` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) unsigned NOT NULL,
  `id_usuario` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tipo_tema_status` (`id_status`),
  KEY `fk_tipo_tema_usuario` (`id_usuario`),
  CONSTRAINT `fk_tipo_tema_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`),
  CONSTRAINT `fk_tipo_tema_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of tipo_tema
-- ----------------------------
INSERT INTO `tipo_tema` VALUES ('6', 'Cuadro Comparativo', '', null, null, '1', '1', '2020-11-13 01:35:34', '2020-11-13 01:35:37');

-- ----------------------------
-- Table structure for tipo_usuario
-- ----------------------------
DROP TABLE IF EXISTS `tipo_usuario`;
CREATE TABLE `tipo_usuario` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_tipo_usuario` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tx_tabla` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_perfil` int(11) unsigned NOT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) unsigned NOT NULL,
  `id_usuario` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tipo_usuario_perfil` (`id_perfil`),
  KEY `fk_tipo_usuario_status` (`id_status`),
  KEY `fk_tipo_usuario_usuario` (`id_usuario`),
  CONSTRAINT `fk_tipo_usuario_perfil` FOREIGN KEY (`id_perfil`) REFERENCES `perfil` (`id`),
  CONSTRAINT `fk_tipo_usuario_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`),
  CONSTRAINT `fk_tipo_usuario_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
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
  `id_status` int(11) unsigned NOT NULL,
  `id_usuario` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_turno_status` (`id_status`),
  KEY `fk_turno_usuario` (`id_usuario`),
  CONSTRAINT `fk_turno_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`),
  CONSTRAINT `fk_turno_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of turno
-- ----------------------------
INSERT INTO `turno` VALUES ('1', 'Mañana', null, '1', '1', '2020-05-09 22:49:11', '2020-05-09 22:49:11');
INSERT INTO `turno` VALUES ('2', 'Tarde', null, '1', '1', '2020-05-09 22:49:22', '2020-05-09 22:49:22');
INSERT INTO `turno` VALUES ('3', 'Noche', null, '1', '1', '2020-05-20 03:33:10', '2021-03-12 01:05:20');
INSERT INTO `turno` VALUES ('4', 'Sabatino', null, '1', '1', '2021-03-12 01:05:04', '2021-03-12 01:05:04');

-- ----------------------------
-- Table structure for ubicacion
-- ----------------------------
DROP TABLE IF EXISTS `ubicacion`;
CREATE TABLE `ubicacion` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_ubicacion` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_colegio` int(11) unsigned NOT NULL,
  `id_padre` int(11) unsigned NOT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) unsigned NOT NULL,
  `id_usuario` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ubicacion_colegio` (`id_colegio`),
  KEY `fk_ubicacion_status` (`id_status`),
  KEY `fk_ubicacion_usuario` (`id_usuario`),
  CONSTRAINT `fk_ubicacion_colegio` FOREIGN KEY (`id_colegio`) REFERENCES `colegio` (`id`),
  CONSTRAINT `fk_ubicacion_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`),
  CONSTRAINT `fk_ubicacion_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
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
  `id_colegio` int(11) unsigned NOT NULL,
  `nb_nombres` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `nb_usuario` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tx_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tx_foto` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_tipo_usuario` int(11) unsigned NOT NULL,
  `id_origen` int(11) unsigned NOT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `verification` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `api_token` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) unsigned NOT NULL,
  `id_usuario` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `usuario_nb_usuario_unique` (`nb_usuario`),
  UNIQUE KEY `usuario_id_origen_unique` (`id_tipo_usuario`,`id_origen`) USING BTREE,
  KEY `fk_usuario_colegio` (`id_colegio`),
  KEY `fk_usuario_status` (`id_status`),
  KEY `fk_usuario_usuario` (`id_usuario`),
  CONSTRAINT `fk_usuario_colegio` FOREIGN KEY (`id_colegio`) REFERENCES `colegio` (`id`),
  CONSTRAINT `fk_usuario_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`),
  CONSTRAINT `fk_usuario_tipo_usuario` FOREIGN KEY (`id_tipo_usuario`) REFERENCES `tipo_usuario` (`id`),
  CONSTRAINT `fk_usuario_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=678 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of usuario
-- ----------------------------
INSERT INTO `usuario` VALUES ('1', '1', 'Administrador', 'admin', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'lyustiz@gmail.com', '', '1', '1', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `usuario` VALUES ('2', '1', 'jean yustiz', 'jyustiz', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'jyustiz@gmail.com', null, '3', '1', null, 'riR8aTSe', null, null, null, '1', '1', '2020-08-21 00:56:14', '2021-01-27 16:21:51');
INSERT INTO `usuario` VALUES ('3', '1', 'yustiz luis', 'yluis', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'lyustiz@gmail.com', null, '2', '1', null, '9lRfdaVW', null, null, null, '1', '1', '2020-08-21 01:04:42', '2020-08-21 01:04:42');
INSERT INTO `usuario` VALUES ('4', '1', 'juan medina', 'jmedina', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'lyustiz@gmail.com', null, '5', '1', null, 'tH8uFv3C', null, null, null, '1', '1', '2020-08-21 01:48:32', '2020-08-21 01:48:32');
INSERT INTO `usuario` VALUES ('5', '1', 'yustiz hector', 'yhector', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'lyustiz@gmail.com', null, '4', '1', null, null, null, null, null, '1', '1', '2021-04-01 15:14:08', null);
INSERT INTO `usuario` VALUES ('325', '1', 'mauricio tellez', 'mtellez', '$2y$10$CD3YSlxvpOKh8v1dmcxmLe5iKXYDTonY9kGcEJ2Qcww4t.o4zqe5a', 'lyustiz@gmail.com', null, '2', '118', null, 'B0fhXHyf', null, null, null, '1', '1', '2021-04-07 18:31:00', '2021-04-07 19:09:30');
INSERT INTO `usuario` VALUES ('400', '1', 'sofia hernandez', 'shernandez', '$2y$10$kC5n7/piDq68EQqNvYJUuuEtwesuX9LRHSaadciIUYw4n4Ix7Ypte', 'anyisarrieta17@gmail.com', null, '3', '500', null, 'bd9z9Dh1', null, null, null, '1', '1', '2021-04-08 02:13:30', '2021-04-08 02:13:30');
INSERT INTO `usuario` VALUES ('401', '1', 'elizabeth arrieta', 'earrieta', '$2y$10$nAIBQa3fwHqyf.XsWmv3tOlB7UspWVKRciFtrc7CwBFmiOZSL92vi', 'anyisarrieta17@gmail.com', null, '3', '501', null, 'dyClTScL', null, null, null, '1', '1', '2021-04-08 02:13:31', '2021-04-08 02:13:31');
INSERT INTO `usuario` VALUES ('402', '1', 'laura anaya', 'lanaya', '$2y$10$aKYhfelxGGzSV.a0lJ8X/uUqQszZf69B1o45AGahB/TWjl5jDpg0m', 'danielanaya@autlook.es', null, '3', '502', null, 'HyNWxKUQ', null, null, null, '1', '1', '2021-04-08 02:13:31', '2021-04-08 02:13:31');
INSERT INTO `usuario` VALUES ('403', '1', 'miller lopez', 'mlopez', '$2y$10$EY1xbqZxFmW5T9wXOTL5/O9nA3.HbWKv9.oXIqZG9JunZDyKZTFt2', 'allo.lopez@hotmail.com', null, '3', '503', null, 'kESrxtci', null, null, null, '1', '1', '2021-04-08 02:13:32', '2021-04-08 02:13:32');
INSERT INTO `usuario` VALUES ('404', '1', 'omer caballero', 'ocaballero', '$2y$10$dgAqI458WjRC3ZILDEYnHORu1EnH6506OmWraaMzFPr5Km6K.Zq/u', 'sandragomezbobadillo92@gmail.c', null, '3', '504', null, 'qwhfyyKw', null, null, null, '1', '1', '2021-04-08 02:13:32', '2021-04-08 02:13:32');
INSERT INTO `usuario` VALUES ('405', '1', 'luis mercado', 'lmercado', '$2y$10$gvZO47c2MLWsoCJe0rxIMeA8Ed6Kxr3pS.Q2duB6DMUS4mmVyCKYi', 'wen3135464713@gmail.com', null, '3', '505', null, 'Swbe30RM', null, null, null, '1', '1', '2021-04-08 02:13:33', '2021-04-08 02:13:33');
INSERT INTO `usuario` VALUES ('406', '1', 'joel alfaro', 'jalfaro', '$2y$10$tgKRe0uJi/nyQRdRmeRbA.sbnLGcNGkyzCPOPasj60lfVCQQgKXke', 'alfarojoeldavid@gmail.com', null, '3', '506', null, 'pWOCXl7D', null, null, null, '1', '1', '2021-04-08 02:13:33', '2021-04-08 02:13:33');
INSERT INTO `usuario` VALUES ('407', '1', 'santiago medina', 'smedina', '$2y$10$HsRe3iXOyVh5C2UywFoTR.UH08LiDfh9Q5mnTLN0LAMxshYteQMMm', 'serranomoscotemarlenejudith@gm', null, '3', '507', null, 'qLxLFRK0', null, null, null, '1', '1', '2021-04-08 02:13:34', '2021-04-08 02:13:34');
INSERT INTO `usuario` VALUES ('408', '1', 'danna ospino', 'dospino', '$2y$10$QA0EEij43P63wRDzUXcz9up7EBVJKWpwLiiA3HOhLnwi5QlshoqEq', 'javierospino71@gmail.com', null, '3', '508', null, 'UST9LifE', null, null, null, '1', '1', '2021-04-08 02:13:34', '2021-04-08 02:13:34');
INSERT INTO `usuario` VALUES ('409', '1', 'samuel tetay', 'stetay', '$2y$10$bmYoswHxwzF0DCVQyy0XluMsbQfBkbuoDoFZRjbNEexXZP0.7CtnW', 'danielavalente_18@hotmail.com', null, '3', '509', null, 'myZFVuGE', null, null, null, '1', '1', '2021-04-08 02:13:35', '2021-04-08 02:13:35');
INSERT INTO `usuario` VALUES ('410', '1', 'tomas jimenez', 'tjimenez', '$2y$10$anSd4A0V34m0AG/5Fj7i7e7Qw9ouezMugmf8TuiZdUF9HH6tp.0xO', 'luzangelamarquezmarenco@hotmai', null, '3', '510', null, 'f0JzoSLE', null, null, null, '1', '1', '2021-04-08 02:13:35', '2021-04-08 02:13:35');
INSERT INTO `usuario` VALUES ('411', '1', 'sergio altamar', 'saltamar', '$2y$10$MpOt0I5zJz58.N.vK3LQtuOGMRQjAaSL7BJZByRzYzPkeygFzEhOW', 'ih6503481@gmail.com', null, '3', '511', null, 'HuMDsudt', null, null, null, '1', '1', '2021-04-08 02:13:35', '2021-04-08 02:13:35');
INSERT INTO `usuario` VALUES ('412', '1', 'valeska caparroso', 'vcaparroso', '$2y$10$FhUKDiq4VQKNmO74cgNKlui5TDxFppWuGfaHztS1UjNCRWps3uhPW', 'eduarcaparroso681@hotmail.com', null, '3', '512', null, 'HNrkvQoU', null, null, null, '1', '1', '2021-04-08 02:13:36', '2021-04-08 02:13:36');
INSERT INTO `usuario` VALUES ('413', '1', 'juan diaz', 'jdiaz', '$2y$10$SQ4XJZlrhJohL2Jq9QXGp.ZUbdAF.fKCQti7ariwKcomIu1b/69LS', 'liliadiazospino@gmail.com', null, '3', '513', null, '9yjGRXb6', null, null, null, '1', '1', '2021-04-08 02:13:36', '2021-04-08 02:13:36');
INSERT INTO `usuario` VALUES ('414', '1', 'juan jimenez', 'jjimenez', '$2y$10$r4W6CPVgtprILEkSohfmlemXq0VtBMx5yf9wMa93p4dVE9EatVusq', 'johanasalcedo1520@gmail.com', null, '3', '514', null, 'kQ8sBOOI', null, null, null, '1', '1', '2021-04-08 02:13:37', '2021-04-08 02:13:37');
INSERT INTO `usuario` VALUES ('415', '1', 'angel bustamante', 'abustamante', '$2y$10$SqoMfyzsZtFACpxiRjrHmuUd5pKWuMx3YZhOLfbHL2GLKnYrdunXq', 'betsyordones1@gmail.com', null, '3', '515', null, 'dmzovqdq', null, null, null, '1', '1', '2021-04-08 02:13:37', '2021-04-08 02:13:37');
INSERT INTO `usuario` VALUES ('416', '1', 'maria castilla', 'mcastilla', '$2y$10$zbsalruTl1VUnMzFKYfK3uNArL.nBsacfaLsnP84qjzQlDN78ZqxO', 'kasie@hotmail.com', null, '3', '516', null, 'jSNlr1aF', null, null, null, '1', '1', '2021-04-08 02:13:38', '2021-04-08 02:13:38');
INSERT INTO `usuario` VALUES ('417', '1', 'emanuel barrios', 'ebarrios', '$2y$10$JA8bm.8L5bDyb8G4Qsx2tuS43skU0up7TMDY/OmR5pJtFbJgpfodS', 'emanuelandresba@gmail.com', null, '3', '517', null, 'g5rVVw8b', null, null, null, '1', '1', '2021-04-08 02:13:38', '2021-04-08 02:13:38');
INSERT INTO `usuario` VALUES ('418', '1', 'tifany ortega', 'tortega', '$2y$10$YWnv6ibx.WGEJr8GAoCnmu7tlGB3zF42xjQBydyawsQm6UNSiJ36G', 'greysizquierdoortega2110@gmail', null, '3', '518', null, 'qpr2W2xQ', null, null, null, '1', '1', '2021-04-08 02:13:39', '2021-04-08 02:13:39');
INSERT INTO `usuario` VALUES ('419', '1', 'juan ramos', 'jramos', '$2y$10$OvgdD3aLl6Bj3qm9bUM7Fe.NDlD9XgmlaMa.msJ9Vr9nhs3vo3HFC', 'juanramosmontero858@gmail.com', null, '3', '519', null, 'YNVAhoOT', null, null, null, '1', '1', '2021-04-08 02:13:39', '2021-04-08 02:13:39');
INSERT INTO `usuario` VALUES ('420', '1', 'jimydejesus jimenez', 'jjimenezs', '$2y$10$9HD6FNcREJShJDQ3N2i2qusoZ4pBYrGZXLplyUKLQHaTTtFZ3E6gS', 'yimmyjimenez827@gmail.com', null, '3', '520', null, 'xG6ecQ2G', null, null, null, '1', '1', '2021-04-08 02:13:40', '2021-04-08 02:13:40');
INSERT INTO `usuario` VALUES ('421', '1', 'stivendejesus mattos', 'smattos', '$2y$10$ius47BVIQJJG.btK3nrHNOrdZPmktNs.o6Rji5IH9dlGtrNRAXHEm', 'stivenmattos15@gmail.com', null, '3', '521', null, 'N9JyYRXK', null, null, null, '1', '1', '2021-04-08 02:13:40', '2021-04-08 02:13:40');
INSERT INTO `usuario` VALUES ('422', '1', 'taysdelcarmen cerpa', 'tcerpa', '$2y$10$ssQvrLvODqefIcXJZZX1xOF2nJpdbmx/A6ai/YKF6baM/j82Zj3Ei', 'thaiscerpa1@gmail.com', null, '3', '522', null, '0OupfiEL', null, null, null, '1', '1', '2021-04-08 02:13:41', '2021-04-08 02:13:41');
INSERT INTO `usuario` VALUES ('423', '1', 'camilo ordonez', 'cordonez', '$2y$10$.sRG8tqe0svkAo6DzfP9yuqbCxRCsQu10uUmDCgvcU9/r0i2yexVi', 'camilohernandez17789@gmail.com', null, '3', '523', null, 'L4S0gZwA', null, null, null, '1', '1', '2021-04-08 02:13:41', '2021-04-08 02:13:41');
INSERT INTO `usuario` VALUES ('424', '1', 'leonel borrero', 'lborrero', '$2y$10$nNhPq1b2414nMQAB6DnZ1.hmJgfQ1w0SyiyElZAl/UUOr3gGl9MPK', 'etimiranda@hotmail.com', null, '3', '524', null, 'Prj24cO4', null, null, null, '1', '1', '2021-04-08 02:13:42', '2021-04-08 02:13:42');
INSERT INTO `usuario` VALUES ('425', '1', 'maria gomez', 'mgomez', '$2y$10$ZMYBZxMvNpkAaWGlTRvNR.HxpGjqKrcvMdiroopOdDOO7BooVmyqe', 'yaquelineester44@gmail.com', null, '3', '525', null, '7imRX8jQ', null, null, null, '1', '1', '2021-04-08 02:13:42', '2021-04-08 02:13:42');
INSERT INTO `usuario` VALUES ('426', '1', 'daniela ortega', 'dortega', '$2y$10$OXhPv1Exdg/rA77pOCax8e2ApJWrIXQfiAZ3hhDUyv4CdnQqyQ0A.', 'greysizquierdoortega2110@gmail', null, '3', '526', null, 'GR5hl9pz', null, null, null, '1', '1', '2021-04-08 02:13:43', '2021-04-08 02:13:43');
INSERT INTO `usuario` VALUES ('427', '1', 'milagros roncallo', 'mroncallo', '$2y$10$npEPvthA4cbFmv89Ci46reULo1GzfxjmN0YsPv8Cj/Ot4azQ8B0Qq', 'roncallomilagro@gmail.com', null, '3', '527', null, 'B9TCE4C8', null, null, null, '1', '1', '2021-04-08 02:13:44', '2021-04-08 02:13:44');
INSERT INTO `usuario` VALUES ('428', '1', 'valery sanchez', 'vsanchez', '$2y$10$zzaQLEuy3NGK74QRQSUBGuEx5NojOMggm51xvHqCyvmde9QXc6SLK', 'cantillomar1990@gmail.com', null, '3', '528', null, 'hNInHST6', null, null, null, '1', '1', '2021-04-08 02:13:44', '2021-04-08 02:13:44');
INSERT INTO `usuario` VALUES ('429', '1', 'maria anaya', 'manaya', '$2y$10$tI7pioR5YXkxCoY24DFwhOXD2IjnuWpfLAo2MtyFEcwvAh6goHQRe', 'mariafernandaanayapadilla@gmai', null, '3', '529', null, 'FPzngFq4', null, null, null, '1', '1', '2021-04-08 02:13:45', '2021-04-08 02:13:45');
INSERT INTO `usuario` VALUES ('430', '1', 'oscar ortiz', 'oortiz', '$2y$10$hXN570OSkDfhvv.s7UB1VeUUlBrSztzy0dSHWkxlVpVEziuvYspyu', 'ortizaoscarandres@gmail.com', null, '3', '530', null, 'nUb0pkd8', null, null, null, '1', '1', '2021-04-08 02:13:45', '2021-04-08 02:13:45');
INSERT INTO `usuario` VALUES ('431', '1', 'anthony moscote', 'amoscote', '$2y$10$rL2xj7AsEBKKx2XQdtjqRucqg/yDUZDqxY7/e0jL6RvPrEo3u8xKS', 'moscoteanthony@gmail.com', null, '3', '531', null, 'ADmDZSwS', null, null, null, '1', '1', '2021-04-08 02:13:46', '2021-04-08 02:13:46');
INSERT INTO `usuario` VALUES ('432', '1', 'yaris moscote', 'ymoscote', '$2y$10$tEaHn1Eyz1qlIWfGe1fXp..C.xyDoCS20T.rpJQrd7XpXlav4Rxa6', 'moscoteashley@gmail.com', null, '3', '532', null, 'H2Jj63KS', null, null, null, '1', '1', '2021-04-08 02:13:46', '2021-04-08 02:13:46');
INSERT INTO `usuario` VALUES ('433', '1', 'paula lopez', 'plopez', '$2y$10$CAF/8O7OtfPSLDiJR9qwD.8FuwbewXNdkJIa3GVeToCuIHj2buNE6', 'paolopez@gmail.com', null, '3', '533', null, '0hKULews', null, null, null, '1', '1', '2021-04-08 02:13:46', '2021-04-08 02:13:46');
INSERT INTO `usuario` VALUES ('434', '1', 'milagrodejesus romero', 'mromero', '$2y$10$YZqPYGovIe8PmRzJ0cF3hON4EUpQKVcDWYF.KfS75Egdl.GFihke2', 'mijeroji@gmail.com', null, '3', '534', null, 'IAHRx8ma', null, null, null, '1', '1', '2021-04-08 02:13:47', '2021-04-08 02:13:47');
INSERT INTO `usuario` VALUES ('435', '1', 'maria anaya', 'mlanaya', '$2y$10$a/g2rFruEAtkLY.QFkikNuLPqHDRLgn0v5kh80nKZYAK85jF5fcd.', 'anayapadillamarialuisa@gmail.c', null, '3', '535', null, 'ui6fEMsk', null, null, null, '1', '1', '2021-04-08 02:13:47', '2021-04-08 02:13:47');
INSERT INTO `usuario` VALUES ('436', '1', 'camilo berrio', 'cberrio', '$2y$10$Ni2nsfH516LHl92IZuJOTOvL6GPQRO4PVlGeSI7wBRDIoBlGaIxcq', 'camiloberriosandoval@gmail.com', null, '3', '536', null, 'Z3APuoBg', null, null, null, '1', '1', '2021-04-08 02:13:48', '2021-04-08 02:13:48');
INSERT INTO `usuario` VALUES ('437', '1', 'linda olivera', 'lolivera', '$2y$10$7bOf0q7oR9qQb7Myq90FZuqQrQ2FoIXlvqe7RB.DMCtiilCxBfAr.', 'sheylaluzney123@gmail.com', null, '3', '537', null, 'ZwfN8JHC', null, null, null, '1', '1', '2021-04-08 02:13:48', '2021-04-08 02:13:48');
INSERT INTO `usuario` VALUES ('438', '1', 'emili iglesia', 'eiglesia', '$2y$10$lfGqpps171ZukUhUECrL4urSTWNXN4tfCSUJcxAY3x/sMD/kpD/TO', 'evilithcaro85@gmail. Com', null, '3', '538', null, 'eEEi2iQL', null, null, null, '1', '1', '2021-04-08 02:13:49', '2021-04-08 02:13:49');
INSERT INTO `usuario` VALUES ('439', '1', 'katherin marin', 'kmarin', '$2y$10$TXXfaGAqDdaSo0mVYqtA9OiyN.rpPqpG5bRByL2vg5Q3HO1w0G4gC', 'Dainercantillo28@gmail. Com', null, '3', '539', null, 'ip2WFLc0', null, null, null, '1', '1', '2021-04-08 02:13:49', '2021-04-08 02:13:49');
INSERT INTO `usuario` VALUES ('440', '1', 'andrea gamez', 'agamez', '$2y$10$gCdUumdNz2PsKLrrmrz1buem4N1C8oSAYiZGonzYYWQmYg2Du0/22', 'landis1980@hotmail.com', null, '3', '540', null, 'rh5cN7eK', null, null, null, '1', '1', '2021-04-08 02:13:50', '2021-04-08 02:13:50');
INSERT INTO `usuario` VALUES ('441', '1', 'jesus quiroga', 'jquiroga', '$2y$10$AQcJ628wJPhOAj.f/yP/geig5mJ59I5Th.CzdX5x5OVvR1IF1rFc2', 'Lidiaosses76@gmail.com', null, '3', '541', null, 'vQmumif3', null, null, null, '1', '1', '2021-04-08 02:13:50', '2021-04-08 02:13:50');
INSERT INTO `usuario` VALUES ('442', '1', 'anelith viloria', 'aviloria', '$2y$10$kQRdyhDKMW9DiKR6NPbBgOQuIFR0bAFbNzOVlrIl7dGpcRAy.4OH2', 'yesicatoscano08@gmail.com', null, '3', '542', null, 'dKWKj10s', null, null, null, '1', '1', '2021-04-08 02:13:50', '2021-04-08 02:13:50');
INSERT INTO `usuario` VALUES ('443', '1', 'angel beltran', 'abeltran', '$2y$10$9knJZ.BXv7JMnu6x9dN7BuR7wLC7yZP6jbZOO3ucX/WLS8APLQ6Ve', 'eloisasofiaahrroa@gmail.com', null, '3', '543', null, 'pCKY28nk', null, null, null, '1', '1', '2021-04-08 02:13:51', '2021-04-08 02:13:51');
INSERT INTO `usuario` VALUES ('444', '1', 'takianis camargo', 'tcamargo', '$2y$10$IoLy7LCOzM5sacgWk01RzefPM6wyFZLmSPLYJ0xWpmr3PsL3ciYi6', 'takianiscamargo@gmail .com', null, '3', '544', null, 'vIAwlkhS', null, null, null, '1', '1', '2021-04-08 02:13:51', '2021-04-08 02:13:51');
INSERT INTO `usuario` VALUES ('445', '1', 'maria duque', 'mduque', '$2y$10$Z0fFpaVUETmmEgc3sXp1zOSnvvc3yszf7eH4LmRyexx8/TDGTC6JK', 'nayetsynuyezgranados@gmail.com', null, '3', '545', null, 'bbBV1DEd', null, null, null, '1', '1', '2021-04-08 02:13:52', '2021-04-08 02:13:52');
INSERT INTO `usuario` VALUES ('446', '1', 'joselin martinez', 'jmartinez', '$2y$10$LJOLEgMkT1GRP2Q7h2ZhD.AeyYbqb.2iwKFUaooynz9JtVmrbwnIm', 'josrlinmartinez guzman08@gmail', null, '3', '546', null, 'zTr1GV3H', null, null, null, '1', '1', '2021-04-08 02:13:52', '2021-04-08 02:13:52');
INSERT INTO `usuario` VALUES ('447', '1', 'samuel montano', 'smontano', '$2y$10$p4FQEyiKgDBMLbeUnkEDuOP1OP.hSz0WOKpA8w.HOqs0A05g89sme', 'samuelmontaño529@gmail', null, '3', '547', null, '6T4McXP6', null, null, null, '1', '1', '2021-04-08 02:13:53', '2021-04-08 02:13:53');
INSERT INTO `usuario` VALUES ('448', '1', 'ana puerto', 'apuerto', '$2y$10$xrla8IGJgsWhF2Tu4I6TW.s83D57JDr1M2kBMIzsQORLt0S5pPxuS', 'anadofiapuertopolo@outlook.es', null, '3', '548', null, 'XmqPMGrq', null, null, null, '1', '1', '2021-04-08 02:13:53', '2021-04-08 02:13:53');
INSERT INTO `usuario` VALUES ('449', '1', 'maria avila', 'mavila', '$2y$10$winVZkVYGxMGtAGfykZ5SuDU.a96mvEzT17PcTHvNn5iRgqNd0wq6', 'sindrypaola@gmail.com', null, '3', '549', null, '0oXKUNzD', null, null, null, '1', '1', '2021-04-08 02:13:53', '2021-04-08 02:13:53');
INSERT INTO `usuario` VALUES ('450', '1', 'wendy acosta', 'wacosta', '$2y$10$rf/TDWTXaYiimJIl7x3vL.iSz0Awe6wPMTrPbFgmUbTspYITYh.ra', 'yuliethpaola2709@gmail.com', null, '3', '550', null, 'Wa69IJxn', null, null, null, '1', '1', '2021-04-08 02:13:54', '2021-04-08 02:13:54');
INSERT INTO `usuario` VALUES ('451', '1', 'silvana contreras', 'scontreras', '$2y$10$hgOa2P8Dr/1yz5OAtb432.Yy/7RH58mrb3aezkxrdD89YvYW0cLVW', 'daysilvacontreras@gmail.com', null, '3', '551', null, 'QSGVigIL', null, null, null, '1', '1', '2021-04-08 02:13:54', '2021-04-08 02:13:54');
INSERT INTO `usuario` VALUES ('452', '1', 'jose gonzalez', 'jgonzalez', '$2y$10$d/6f/oj5mzXdz8MELl5u0.0wzlHqZvBsIHX7lmjaxSsCztQGP8If.', 'nellyherreraeloasis@gmail.com', null, '3', '552', null, 'dnOBgyc8', null, null, null, '1', '1', '2021-04-08 02:13:55', '2021-04-08 02:13:55');
INSERT INTO `usuario` VALUES ('453', '1', 'anderson manga', 'amanga', '$2y$10$2xi3kgdAiBQXcZGpH9nUkuix4cXsehfTq/0z4fKzHgVRbuCxu6LRq', 'jimenezmayerlis3@gmail.com', null, '3', '553', null, 'HiEZCguj', null, null, null, '1', '1', '2021-04-08 02:13:55', '2021-04-08 02:13:55');
INSERT INTO `usuario` VALUES ('454', '1', 'valeria morelo', 'vmorelo', '$2y$10$6Ndn9DNqhN1FZA66rYMkg.FFo7cnML5og8mE5uzQqkivT7Lnmywla', 'lunazullyare@gmail.com', null, '3', '554', null, 'wuZlsk6Z', null, null, null, '1', '1', '2021-04-08 02:13:56', '2021-04-08 02:13:56');
INSERT INTO `usuario` VALUES ('455', '1', 'julian moreno', 'jmoreno', '$2y$10$oxZJqu6E8m4cvCbEMCtbiO2fX7ox4AG0lgVwq9N6TwHGFYil.AGQW', 'lizariza2020@gmail.com', null, '3', '555', null, 'el0X6ee3', null, null, null, '1', '1', '2021-04-08 02:13:57', '2021-04-08 02:13:57');
INSERT INTO `usuario` VALUES ('456', '1', 'yiceth miranda', 'ymiranda', '$2y$10$/z0sLuqEcy.TSuxhdtIsieeA9Avuoz78lrMmD7WxhZFv8jqBrR2AC', 'merlisvelasquez2016@gmail.com', null, '3', '556', null, 'rJmbNkue', null, null, null, '1', '1', '2021-04-08 02:13:57', '2021-04-08 02:13:57');
INSERT INTO `usuario` VALUES ('457', '1', 'paul yance', 'pyance', '$2y$10$O2wnkVcOkEcC6.1aPUbtyu9ZbeOJHZVOer4SZ5TzGeZgJckLBReSm', 'kurielpa2016', null, '3', '557', null, 'c1CGw7OM', null, null, null, '1', '1', '2021-04-08 02:13:58', '2021-04-08 02:13:58');
INSERT INTO `usuario` VALUES ('458', '1', 'hasmeth beltran', 'hbeltran', '$2y$10$IO2ECu7ButCyA8oAqWNCFurtPttYOIeKpIfeQEeZNZRAGmYP13q.W', 'karinacn.2006@gmail.com', null, '3', '558', null, 'qnShu7Tj', null, null, null, '1', '1', '2021-04-08 02:13:58', '2021-04-08 02:13:58');
INSERT INTO `usuario` VALUES ('459', '1', 'danna cantillo', 'dcantillo', '$2y$10$Q9J6kxBIwqwQtC9uDv9JUuzmpMl.CMOJtlEIJ7qcuE5A4JZY92nJq', 'dannanavarrocantillo@gmail.com', null, '3', '559', null, 'O2VUwcWT', null, null, null, '1', '1', '2021-04-08 02:13:59', '2021-04-08 02:13:59');
INSERT INTO `usuario` VALUES ('460', '1', 'dainer cantillo', 'dacantillo', '$2y$10$2ReNhsCUUxEncz70jItGruaQwAn8b4MIr3ovRuff1diwQmeJytqMa', 'dainerorozco4@gmail.com', null, '3', '560', null, 'BANdipjP', null, null, null, '1', '1', '2021-04-08 02:13:59', '2021-04-08 02:13:59');
INSERT INTO `usuario` VALUES ('461', '1', 'mateo escobar', 'mescobar', '$2y$10$YfTSmPFcs5e8P7.00qU1..CpMRxFE3xw.tXHmswtsfUZZWPayf13W', 'mateoestibenescobarfontalvo@gm', null, '3', '561', null, 'N95TTluF', null, null, null, '1', '1', '2021-04-08 02:14:00', '2021-04-08 02:14:00');
INSERT INTO `usuario` VALUES ('462', '1', 'luis fontalvo', 'lfontalvo', '$2y$10$ftUeSYDNN4CQsN1IJQ0mYecd3d2aVNOCarNVWk5o7s3R.h1RNA/c6', 'fontalvoluismario50@gmail.com', null, '3', '562', null, '2HjZjldc', null, null, null, '1', '1', '2021-04-08 02:14:00', '2021-04-08 02:14:00');
INSERT INTO `usuario` VALUES ('463', '1', 'dilan guerrero', 'dguerrero', '$2y$10$EZZd.cmmsaR2NBjvXJc7xuIs7PUJ96dbkoOtA6NmzcvzTJbY8X5GS', 'dilandonadofre8@gmail.com', null, '3', '563', null, '0BqtuNJf', null, null, null, '1', '1', '2021-04-08 02:14:01', '2021-04-08 02:14:01');
INSERT INTO `usuario` VALUES ('464', '1', 'jose iglesia', 'jiglesia', '$2y$10$yRDZwLEDnluqGkSLp25FkOClCXtKUT5VtUAlwttkmuulnDIUgRZae', 'iglesiajose998@gmail.com', null, '3', '564', null, 'eEY8z7AM', null, null, null, '1', '1', '2021-04-08 02:14:01', '2021-04-08 02:14:01');
INSERT INTO `usuario` VALUES ('465', '1', 'kelly mejia', 'kmejia', '$2y$10$xKZ6zXhrKCdB0AxGwwh1TOLffLPGKFGSCu1rsWlgEu6KMPTOrm3vu', 'mejiamelendezk@gmail.com', null, '3', '565', null, 'mBeIvRRg', null, null, null, '1', '1', '2021-04-08 02:14:02', '2021-04-08 02:14:02');
INSERT INTO `usuario` VALUES ('466', '1', 'duberlin rada', 'drada', '$2y$10$dd/A1PftevEqWE9oR19M6uUtZgOcETcN.CZyDe3Qc4dRpCD3EjFBO', 'duberlinramo@gmail.com', null, '3', '566', null, 'cHc37SH6', null, null, null, '1', '1', '2021-04-08 02:14:02', '2021-04-08 02:14:02');
INSERT INTO `usuario` VALUES ('467', '1', 'deis suarez', 'dsuarez', '$2y$10$wzJktKGtMfNzCQ0h9KmoiO0E8wJKVuT1eyyr4ogUzTCcyNJxQom2a', 'deissuarez30@gmail.com', null, '3', '567', null, 'Ulg31NLy', null, null, null, '1', '1', '2021-04-08 02:14:03', '2021-04-08 02:14:03');
INSERT INTO `usuario` VALUES ('468', '1', 'valentina torresahumada', 'vtorresahumada', '$2y$10$gM1L099G5v1fWIDu99ZO5uR86q3/vRzPy6EXMF84k3UNVYLK/sAES', 'valentinatahu@gmail.com', null, '3', '568', null, 'vsLFK3fc', null, null, null, '1', '1', '2021-04-08 02:14:03', '2021-04-08 02:14:03');
INSERT INTO `usuario` VALUES ('469', '1', 'maria aguilarfernandez', 'maguilarfernandez', '$2y$10$JxwvUJzCOQDPdVSxYxCEKuova.tGx7pSR9PHs3FuOoVPVw2F/1W26', 'aguilarmariaf6@hotmail.com', null, '3', '569', null, '0fQTbZfx', null, null, null, '1', '1', '2021-04-08 02:14:04', '2021-04-08 02:14:04');
INSERT INTO `usuario` VALUES ('470', '1', 'mitchel aguilarfernandez', 'mdaguilarfernandez', '$2y$10$XvELisMl6Tdf3e/efM/xAeakQzMn5CLrtSKfXFLKvcKZFh/FOQ0SO', 'aguilarmichelf6@outlook.com', null, '3', '570', null, 'Q8T96ly9', null, null, null, '1', '1', '2021-04-08 02:14:04', '2021-04-08 02:14:04');
INSERT INTO `usuario` VALUES ('471', '1', 'kemel berdugoestrada', 'kberdugoestrada', '$2y$10$5wUXTLqLoz5fm1VULCmkle22Iz2HfgCA5m6TLfoxxfTJDK.nb9H5i', 'berdugokemel9@hotmail.com', null, '3', '571', null, 'XdTdysXK', null, null, null, '1', '1', '2021-04-08 02:14:05', '2021-04-08 02:14:05');
INSERT INTO `usuario` VALUES ('472', '1', 'miguel cavadiamozo', 'mcavadiamozo', '$2y$10$63.PdsjYcycgssKbciS1C.9zcfKzSqBqXYr3DwXsh4BuhStufldEm', 'cavadiamiguel9@hotmail.com', null, '3', '572', null, 'fsPs7EL9', null, null, null, '1', '1', '2021-04-08 02:14:06', '2021-04-08 02:14:06');
INSERT INTO `usuario` VALUES ('473', '1', 'maithe garciatorres', 'mgarciatorres', '$2y$10$gRUsgZLid7vCCUyZFTX1GOynIRiMjclAxoiHEevmGekvODKGYstQm', 'garciamaithe9@hotmail.com', null, '3', '573', null, '8ppX84Jd', null, null, null, '1', '1', '2021-04-08 02:14:06', '2021-04-08 02:14:06');
INSERT INTO `usuario` VALUES ('474', '1', 'maria gonzalezgutierrez', 'mgonzalezgutierrez', '$2y$10$jSoC0gQ6P0ARlC0x37DvfOqX2ZMw0pUc0z/4li6H4uQGi60X0xsSi', 'gonzalezmaria877@hotmail.com', null, '3', '574', null, 'jRw1XaFe', null, null, null, '1', '1', '2021-04-08 02:14:06', '2021-04-08 02:14:06');
INSERT INTO `usuario` VALUES ('475', '1', 'julian guettecastro', 'jguettecastro', '$2y$10$9h95W4pVvj5x8MGL13ebx.6HIJ4O3atMC1kkKN2/oavYe2YgZ31zW', 'guettejulian@outlook.com', null, '3', '575', null, 'nl9HQTgc', null, null, null, '1', '1', '2021-04-08 02:14:07', '2021-04-08 02:14:07');
INSERT INTO `usuario` VALUES ('476', '1', 'richard martinezcaro', 'rmartinezcaro', '$2y$10$JHQ95LUH1Tqw9ySI3dqMFO5f0/Ks3y2wXdNsa3Woeiu6SjnRU3MHq', 'rm7691889@gmail.com', null, '3', '576', null, 'i1qDyLEc', null, null, null, '1', '1', '2021-04-08 02:14:08', '2021-04-08 02:14:08');
INSERT INTO `usuario` VALUES ('477', '1', 'jefferson montenegrotoro', 'jmontenegrotoro', '$2y$10$J5dI0Re8jNQ.YBTeuvPDsOOTdDJGq0mYJ0w1mnDr40ggfwZXTpPGG', 'jrmt2408@gmail.com', null, '3', '577', null, '5gRw7z2f', null, null, null, '1', '1', '2021-04-08 02:14:08', '2021-04-08 02:14:08');
INSERT INTO `usuario` VALUES ('478', '1', 'juan orozcoramirez', 'jorozcoramirez', '$2y$10$n.H1KZAQFhUC4EFw3YaMfe50FpmcwQazAsu9tD.6mTo1Yru0O8.mC', 'yanirisramirez82@gmail.com', null, '3', '578', null, 'XQ95B2bi', null, null, null, '1', '1', '2021-04-08 02:14:09', '2021-04-08 02:14:09');
INSERT INTO `usuario` VALUES ('479', '1', 'andrea villamilcastro', 'avillamilcastro', '$2y$10$Nx0YFCMsDuWJRqU1pUhMOuXpiL66Kju/chhL/kT8Exmf3CcwELge2', 'Andreavillamil2005@gmail.com', null, '3', '579', null, 'ctQVPHXb', null, null, null, '1', '1', '2021-04-08 02:14:09', '2021-04-08 02:14:09');
INSERT INTO `usuario` VALUES ('480', '1', 'luis cadenagutierrez', 'lcadenagutierrez', '$2y$10$OaZMjfMg1OBpSjZCaaV6vegbj5PlnMuuVY8FpevOf5jijKawPoD1C', 'lisethgutu@hotmail.com', null, '3', '580', null, '6aR4fOh0', null, null, null, '1', '1', '2021-04-08 02:14:10', '2021-04-08 02:14:10');
INSERT INTO `usuario` VALUES ('481', '1', 'genesis arrieta', 'garrieta', '$2y$10$2X/qDNNxaC1.DACyZWoi7.WKDl7jgOxfeIEsi12X4rsfddA7fwBaO', 'gdearrieta26@gmail.com', null, '3', '581', null, 'rCE2WDhM', null, null, null, '1', '1', '2021-04-08 02:14:10', '2021-04-08 02:14:10');
INSERT INTO `usuario` VALUES ('482', '1', 'reyvi arevalo', 'rarevalo', '$2y$10$a81ElDV/Y9kTdOL0itz5heFVIQt3.knGlPvkK5c0MQQ7AE8h3MWKO', 'duniaarevaloanchila@gmail.com', null, '3', '582', null, 'gp78ATPR', null, null, null, '1', '1', '2021-04-08 02:14:11', '2021-04-08 02:14:11');
INSERT INTO `usuario` VALUES ('483', '1', 'valentina boneth', 'vboneth', '$2y$10$qYA5uuaFKKlWso1lezJmJ.0L0eu/CVZ7zr5PGUdBq9GQwGAypJ96q', 'gabyrojas1808@gmail.com', null, '3', '583', null, 'CcLibVAc', null, null, null, '1', '1', '2021-04-08 02:14:11', '2021-04-08 02:14:11');
INSERT INTO `usuario` VALUES ('484', '1', 'dayanis contreras', 'dcontreras', '$2y$10$Yq8GO.xFRzMvxCGU5FNHL.cnCAliiKcUOfbBb9EcE53DuTs6VDYGq', 'dayisilvacontrera@gmail.com', null, '3', '584', null, 'cQlLd76p', null, null, null, '1', '1', '2021-04-08 02:14:12', '2021-04-08 02:14:12');
INSERT INTO `usuario` VALUES ('485', '1', 'jonathan jimenez', 'jdjimenez', '$2y$10$asJYZlUacZO/iPnMikHhtONhVinrfOoXK6xQsWQa1irhCdIlNf4y.', 'milagrostoncelnoriega@gmail.co', null, '3', '585', null, 'Rdf1pD1F', null, null, null, '1', '1', '2021-04-08 02:14:12', '2021-04-08 02:14:12');
INSERT INTO `usuario` VALUES ('486', '1', 'brayan jimeno', 'bjimeno', '$2y$10$9LKlOsWEnTsVqqqNTRMQHuBK29vFitWk7WF7Lz5m07ATA7z8Tt6Mq', 'noderlyjimenosalas@gmail.com', null, '3', '586', null, 'uoP3zIAa', null, null, null, '1', '1', '2021-04-08 02:14:13', '2021-04-08 02:14:13');
INSERT INTO `usuario` VALUES ('487', '1', 'cesar polo', 'cpolo', '$2y$10$k/eoy8jX2Z931lc7ztrh7.kjnaO7rJ1YXgIABKEhJsCeRl30uVmju', 'dayisilvacontrera@gmail.com', null, '3', '587', null, 'TVsloC9e', null, null, null, '1', '1', '2021-04-08 02:14:13', '2021-04-08 02:14:13');
INSERT INTO `usuario` VALUES ('488', '1', 'juan sierra', 'jsierra', '$2y$10$Ujoz/Ya5CdlonKmcMC5zteZlkFWQeacCfIoZOJ25cDNyXEaOIP9sy', 'juandavidsierravalera@gmail.co', null, '3', '588', null, 'LwqEdJ6b', null, null, null, '1', '1', '2021-04-08 02:14:14', '2021-04-08 02:14:14');
INSERT INTO `usuario` VALUES ('489', '1', 'dylan maz', 'dmaz', '$2y$10$dED7P7yw/rsMbPb8ABa6M.5TYL9HNRhi6SLME2Wl/lg2H39O5pO0a', 'mary.trujillo@hotmail.com', null, '3', '589', null, 'mHiz8erC', null, null, null, '1', '1', '2021-04-08 02:14:15', '2021-04-08 02:14:15');
INSERT INTO `usuario` VALUES ('490', '1', 'keiner marin', 'kamarin', '$2y$10$NU9Nt3XWXK2/XUgaGlIpLOrWWSByTDOaCnm1YFj3.rcLZ1R4cK8XC', 'marinkeiner9@hotmail.com', null, '3', '590', null, 'JGtccmZn', null, null, null, '1', '1', '2021-04-08 02:14:16', '2021-04-08 02:14:16');
INSERT INTO `usuario` VALUES ('491', '1', 'yoimar mora', 'ymora', '$2y$10$xk.DrQK03ZDk3L9Gc4ur0.ElC7E1KYBwy.m8PPT/v3TgsNZ7EHYYO', 'morayoimar9@outlook.com', null, '3', '591', null, '9YXv9Y2J', null, null, null, '1', '1', '2021-04-08 02:14:16', '2021-04-08 02:14:16');
INSERT INTO `usuario` VALUES ('492', '1', 'gisela munoz', 'gmunoz', '$2y$10$rD3B.ZntxtoDxWEK8Aazuu97bZYK0RPN7wsraOIucIw5Spxsyppgu', 'munozyisela9@hotmail.com', null, '3', '592', null, '182wWV6F', null, null, null, '1', '1', '2021-04-08 02:14:17', '2021-04-08 02:14:17');
INSERT INTO `usuario` VALUES ('493', '1', 'camila niebles', 'cniebles', '$2y$10$uOzUHgEboigtczQypCFxf.hE3x1rXLGD6UfRLRlctJwl1410rBCkq', 'nieblescamila9@hotmail.com', null, '3', '593', null, '2dbKivJc', null, null, null, '1', '1', '2021-04-08 02:14:17', '2021-04-08 02:14:17');
INSERT INTO `usuario` VALUES ('494', '1', 'sergio romero', 'sromero', '$2y$10$7frxEFNCx6Qek2deNByhie7PD.jAP8JT.hp.T6r.9RQwR5KIPZUQu', 'romerosergio9@hotmail.com', null, '3', '594', null, 'x9iIDHDj', null, null, null, '1', '1', '2021-04-08 02:14:18', '2021-04-08 02:14:18');
INSERT INTO `usuario` VALUES ('495', '1', 'david salas', 'dsalas', '$2y$10$rtBBvlGZjVs00Gfhbmy8a.hg7ygSCg9LZZQrgyse600Fdszn79QHa', 'salasd5736@gmail.com', null, '3', '595', null, 'jAXW7JyP', null, null, null, '1', '1', '2021-04-08 02:14:18', '2021-04-08 02:14:18');
INSERT INTO `usuario` VALUES ('496', '1', 'juan villanueva', 'jvillanueva', '$2y$10$42cmemGdxlyz.M/tlPWZuOi8VvHv6xDpGDnsnNzzcl8Dyyhp4rVdW', 'villanuevajuan4240@gmail.com', null, '3', '596', null, 'yCChQJqa', null, null, null, '1', '1', '2021-04-08 02:14:19', '2021-04-08 02:14:19');
INSERT INTO `usuario` VALUES ('497', '1', 'jazbleidi zuniga', 'jzuniga', '$2y$10$hoL8tbZQIGZLSuFYJ1m.nO.XN0QAY52yBHx2bUFAfNKtXGDjZmGWC', 'zunigajasbleidis@hotmail.com', null, '3', '597', null, '3ZEetO6y', null, null, null, '1', '1', '2021-04-08 02:14:19', '2021-04-08 02:14:19');
INSERT INTO `usuario` VALUES ('498', '1', 'osnuaider marquez', 'omarquez', '$2y$10$lIEoisv6toHNdMc29hye..jCZQR0IYJvJnFy2HgJx7OkERuIq.aVa', 'marquezosnuaider9@hotmail.com', null, '3', '598', null, 'iYZxuBdo', null, null, null, '1', '1', '2021-04-08 02:14:20', '2021-04-08 02:14:20');
INSERT INTO `usuario` VALUES ('499', '1', 'maria angulo', 'mangulo', '$2y$10$zZSKYNSgPbgnLNPxD4dld.MUOjuYJQQbU2NhfdNW7Z6sKetp5lr9q', 'ma.gabrielle2020@gmail.com', null, '3', '599', null, 'YgOaDW0C', null, null, null, '1', '1', '2021-04-08 02:14:20', '2021-04-08 02:14:20');
INSERT INTO `usuario` VALUES ('500', '1', 'joel amador', 'jamador', '$2y$10$0QeY9oPgEJ7QfpMeMM1cweIZ9GDJdfvMQPJiNTRrJPfzr0RQtIXEe', 'gutierrezcantillosindypaola@gm', null, '3', '600', null, 'nlxeyBkA', null, null, null, '1', '1', '2021-04-08 02:14:21', '2021-04-08 02:14:21');
INSERT INTO `usuario` VALUES ('501', '1', 'angely merino', 'amerino', '$2y$10$8HKncFD3KzdIDYmqKbX/GeBNyOaojSzcOOFfIdpTjDsPCCltN/u/G', 'angely290893@gmail.com', null, '3', '601', null, 'fe4YsgCR', null, null, null, '1', '1', '2021-04-08 02:14:21', '2021-04-08 02:14:21');
INSERT INTO `usuario` VALUES ('502', '1', 'mery delarosa', 'mdelarosa', '$2y$10$4FHBBRi/TrbMyf1DvSlWA.hH/wBHd5SoJ6CbAjFmQemjd9vV6qORW', 'meriyeisdelarosa@gmail.com', null, '3', '602', null, 'nteh7BwW', null, null, null, '1', '1', '2021-04-08 02:14:22', '2021-04-08 02:14:22');
INSERT INTO `usuario` VALUES ('503', '1', 'estefany espinosa', 'eespinosa', '$2y$10$ieSojvg5jmxkYQ6Tvh2fou6m.LvKNk2uUQJaKNrmvZHzd1gBIeboe', 'Ola105158@gimail.com', null, '3', '603', null, 'gq28VFsa', null, null, null, '1', '1', '2021-04-08 02:14:22', '2021-04-08 02:14:22');
INSERT INTO `usuario` VALUES ('504', '1', 'juana dehaz', 'jdehaz', '$2y$10$WOWVS9CLQF9OQErz.L4ttOb9KJ/9S8XTLVRUXYvV5gPtXgzv2b9iu', 'javierjofran11@gimail.com', null, '3', '604', null, 'xtSxyC2p', null, null, null, '1', '1', '2021-04-08 02:14:23', '2021-04-08 02:14:23');
INSERT INTO `usuario` VALUES ('505', '1', 'alvis arevalo', 'aarevalo', '$2y$10$AuITt8Oo4ptG4.t/iHjs.OYJwvVTx0866cri6SO7UqqgGF/XSuyDy', 'alvenis.arevalo.0701@gimail.co', null, '3', '605', null, 'h5eHrcrV', null, null, null, '1', '1', '2021-04-08 02:14:23', '2021-04-08 02:14:23');
INSERT INTO `usuario` VALUES ('506', '1', 'sebastian melendez', 'smelendez', '$2y$10$kmPL6ozffeJoMZK1HCRZxOfKaPsRyCS7lj/b4W9Ftx12lODjP7aRa', 'marypili1116@hotmail.com', null, '3', '606', null, 'YNlAsG0d', null, null, null, '1', '1', '2021-04-08 02:14:24', '2021-04-08 02:14:24');
INSERT INTO `usuario` VALUES ('507', '1', 'linda angulo', 'langulo', '$2y$10$8zu3/UJpdQM54kvM3hfdKOzAmLJpgnsROIh2REFMxWuJJ3VncgvHq', 'lindaangulodlr@outlook.es', null, '3', '607', null, 'XiBn0Dec', null, null, null, '1', '1', '2021-04-08 02:14:24', '2021-04-08 02:14:24');
INSERT INTO `usuario` VALUES ('508', '1', 'maria montero', 'mmontero', '$2y$10$72xkJH/eEQNtvIYNorsmh.JsepG0Y5wkSbv6tYeeTEKLXSUklnEm2', 'delfinaluquez1986@gmail.com', null, '3', '608', null, 'cGfEACgs', null, null, null, '1', '1', '2021-04-08 02:14:25', '2021-04-08 02:14:25');
INSERT INTO `usuario` VALUES ('509', '1', 'michell gomez', 'mdgomez', '$2y$10$2bK2K5amH0sfyRqBcYPslOGUh051GkzDfsXvTkhapIV8aGf.WeQFq', 'Michellyyanelis@gmail.com', null, '3', '609', null, 'YIlKDj6i', null, null, null, '1', '1', '2021-04-08 02:14:25', '2021-04-08 02:14:25');
INSERT INTO `usuario` VALUES ('510', '1', 'naciris polo', 'npolo', '$2y$10$7E38G4l0Cp6mMLymurhznemcYhsHMuApLfBxGxIwB2oZKQOZsMpa.', 'Polonaciris@gmail.com', null, '3', '610', null, 'fmCCqnPn', null, null, null, '1', '1', '2021-04-08 02:14:26', '2021-04-08 02:14:26');
INSERT INTO `usuario` VALUES ('511', '1', 'johan araujo', 'jaraujo', '$2y$10$I8hWWj9EtuoaJlA/XiK8Ou1yaabC6ZSzM850OM1uE9pcCDNxGkYv6', 'rosirisrobin1972@hotmail.com', null, '3', '611', null, 'vUpanzBs', null, null, null, '1', '1', '2021-04-08 02:14:26', '2021-04-08 02:14:26');
INSERT INTO `usuario` VALUES ('512', '1', 'cristian granados', 'cgranados', '$2y$10$LPVvrMNflRwAF2wdZxSVIOnHrkendFWgOW35U5KkNCtTZBOdH0X22', 'mariluzc.6970@gmail.com', null, '3', '612', null, 'mQq1N7cQ', null, null, null, '1', '1', '2021-04-08 02:14:27', '2021-04-08 02:14:27');
INSERT INTO `usuario` VALUES ('513', '1', 'kelly daza', 'kdaza', '$2y$10$sC2W1c03i69lJPxYcBTZa.VsShWb8vJvQc6ZAeGpSLjB57jL0YcTO', 'dazagonzalezkellyvanessa@gmail', null, '3', '613', null, '9eYPR5Ad', null, null, null, '1', '1', '2021-04-08 02:14:27', '2021-04-08 02:14:27');
INSERT INTO `usuario` VALUES ('514', '1', 'jairo jacobs', 'jjacobs', '$2y$10$MDbJPzA9CGvwUdzWomJAKOnXF3tV7/rgj4pCgLsb26iYpkQjtesdy', 'jacobsjairo35@gmail.com', null, '3', '614', null, '3VvJz1Ar', null, null, null, '1', '1', '2021-04-08 02:14:28', '2021-04-08 02:14:28');
INSERT INTO `usuario` VALUES ('515', '1', 'maria polo', 'mpolo', '$2y$10$Bsj4hk0U4NxcZjE9d61ze.LWljVmdDS007OdT2qaUQSQmPs9yyTUy', 'mafepolo2006@gmail.com', null, '3', '615', null, 'AHfAFpO7', null, null, null, '1', '1', '2021-04-08 02:14:50', '2021-04-08 02:14:50');
INSERT INTO `usuario` VALUES ('516', '1', 'juan lopez', 'jlopez', '$2y$10$BYST8Pt.aWtQQal9wYaPROzt/aUlWSQvH8anWrcLI9d0HXxZls8km', 'jl354067@gmail.com', null, '3', '616', null, '5f4iY0BK', null, null, null, '1', '1', '2021-04-08 02:14:50', '2021-04-08 02:14:50');
INSERT INTO `usuario` VALUES ('517', '1', 'andres sotelo', 'asotelo', '$2y$10$LOiYhzlfisv451QJSnxQhu2bNFbIuStyKZr9j.B/oLQXCs/s0FX7O', 'spandresfelipe@gmail.com', null, '3', '617', null, 'CHHkPpEY', null, null, null, '1', '1', '2021-04-08 02:14:51', '2021-04-08 02:14:51');
INSERT INTO `usuario` VALUES ('518', '1', 'ana santos', 'asantos', '$2y$10$JKW/FJYkRBvtpM7Ien8rqehfi39J5n.UiqOW.RSyVkauDVUzFFChe', 'analuciasantosalvarez@gmail.co', null, '3', '618', null, 'JnKEuepr', null, null, null, '1', '1', '2021-04-08 02:14:51', '2021-04-08 02:14:51');
INSERT INTO `usuario` VALUES ('519', '1', 'jhojan sarmiento', 'jsarmiento', '$2y$10$nVen//avAxmoqFjrukzXu.j2vQf355RU/FNn6I7AYiIxiaZfxlneK', 'nerissarmiento19@gmail.com', null, '3', '619', null, 'l5OOsx0S', null, null, null, '1', '1', '2021-04-08 02:14:52', '2021-04-08 02:14:52');
INSERT INTO `usuario` VALUES ('520', '1', 'dayana escorcia', 'descorcia', '$2y$10$G8yZb7AzFZY4U5PJdSyBIuxrJyprZgCTngYj7SVH5M0LeaP4tD8cG', 'escorciadayana16@gmail.com', null, '3', '620', null, 'i14NBJTl', null, null, null, '1', '1', '2021-04-08 02:14:52', '2021-04-08 02:14:52');
INSERT INTO `usuario` VALUES ('521', '1', 'carolina gonzalez', 'cgonzalez', '$2y$10$0VUsGqYfjktjwlFwlhGV1.2cTIK.UeziIAtrp.ptvBdgp/xs4aYpe', 'cpgonbel06@gmail.com', null, '3', '621', null, 'roRxWYvB', null, null, null, '1', '1', '2021-04-08 02:14:53', '2021-04-08 02:14:53');
INSERT INTO `usuario` VALUES ('522', '1', 'stevindavid cantillo', 'scantillo', '$2y$10$XhjMxY4sVSN77EIQUKmB4uROsjIKnReFSCMS14qb124/FATTdpkoG', 'narlishesterhernandezvillalobo', null, '3', '622', null, 'iDfxhAvM', null, null, null, '1', '1', '2021-04-08 02:14:53', '2021-04-08 02:14:53');
INSERT INTO `usuario` VALUES ('523', '1', 'fernanda arias', 'farias', '$2y$10$vNI63xezqdOwENjL99gOIuRuTchPpugFIo81/lABk/SiKrgbUXNau', 'fernandacaro1410@gmail.com', null, '3', '623', null, 'wF8OP6wY', null, null, null, '1', '1', '2021-04-08 02:14:54', '2021-04-08 02:14:54');
INSERT INTO `usuario` VALUES ('524', '1', 'sebastian jimenez', 'sjimenez', '$2y$10$M.krT1o1ZMbojphd.ngEmeU7ppGpzse1xZ4JQIPesUGy8PN21lODi', 'jimenezmonsalvo@gmail.com', null, '3', '624', null, 'gsvGD0q7', null, null, null, '1', '1', '2021-04-08 02:14:54', '2021-04-08 02:14:54');
INSERT INTO `usuario` VALUES ('525', '1', 'shadia hermocilla', 'shermocilla', '$2y$10$12VSkm4a8D7b73YCE9yIWOj4nZCdUs/q2u/0DYOU5WmXTuk5NDAf.', 'shadiapamelahermocillacastro@g', null, '3', '625', null, 'FDerVeOO', null, null, null, '1', '1', '2021-04-08 02:14:55', '2021-04-08 02:14:55');
INSERT INTO `usuario` VALUES ('526', '1', 'valerie beltran', 'vbeltran', '$2y$10$EHzo5VSYaW5vc3N3hCZATOwMXqYAvTkDOcf0roPSKpWQq9kKW2V.6', 'vabeldo2006@gmail.com', null, '3', '626', null, 'e35FQMWY', null, null, null, '1', '1', '2021-04-08 02:14:55', '2021-04-08 02:14:55');
INSERT INTO `usuario` VALUES ('527', '1', 'alan aguilar', 'aaguilar', '$2y$10$LP/92PYnTVf2t.rlkg69k.WPpw6qIdJHFIVC13E4T05O3.ubmrik6', 'mancillanelly1982@gmail.com', null, '3', '627', null, 'UTORglQs', null, null, null, '1', '1', '2021-04-08 02:14:56', '2021-04-08 02:14:56');
INSERT INTO `usuario` VALUES ('528', '1', 'madeleyn torres', 'mtorres', '$2y$10$Rv0nPZIG3GRyb6JLDnSvreH1VgXBFAizwcwdQfVtBe1f0SEdGCKGC', 'torresmadeleyn9@gmail.com', null, '3', '628', null, 'wTmGVhPh', null, null, null, '1', '1', '2021-04-08 02:14:56', '2021-04-08 02:14:56');
INSERT INTO `usuario` VALUES ('529', '1', 'yahileth vanegas', 'yvanegas', '$2y$10$3d4TVnmqqSnlMjL6wnO2UuEI1zJUu.iUTjTnvpTLDsjlcRiQs5ELW', 'yailethvanegas2019.05@gmail.co', null, '3', '629', null, 'y62KGjA4', null, null, null, '1', '1', '2021-04-08 02:14:57', '2021-04-08 02:14:57');
INSERT INTO `usuario` VALUES ('530', '1', 'sharol coneo', 'sconeo', '$2y$10$3Pcqe43hFW/wgDME228oEe9NteiT8vMlhDDSV/.7rcpxBmiEzHasK', 'coneosharol@gmail.com', null, '3', '630', null, 'gLFLen0n', null, null, null, '1', '1', '2021-04-08 02:14:57', '2021-04-08 02:14:57');
INSERT INTO `usuario` VALUES ('531', '1', 'duvan ahumada', 'dahumada', '$2y$10$Gb6SO/VIRuYZ4zq8cvQoceruHL.TpMIzpHW/9kpPFoedzwge/iPFe', 'ahumadaduban@gmail.com', null, '3', '631', null, 'prB88YhS', null, null, null, '1', '1', '2021-04-08 02:14:58', '2021-04-08 02:14:58');
INSERT INTO `usuario` VALUES ('532', '1', 'elias salcedo', 'esalcedo', '$2y$10$KpKqMu/AJFDlgx3wN/yOreS3rY69RBflxtpmgbQ8LMpDawmV9uZdy', 'ricardojuniorsalcedo@gmail.com', null, '3', '632', null, 'd557LPLb', null, null, null, '1', '1', '2021-04-08 02:14:58', '2021-04-08 02:14:58');
INSERT INTO `usuario` VALUES ('533', '1', 'andrea romero', 'aromero', '$2y$10$hksnDdTdyHRuB66Eq1QZl.nektaCobs/YA3n8zXl8toBWinC1udfG', 'gissellebarleta@hotmail.com', null, '3', '633', null, 'zSJvmXSv', null, null, null, '1', '1', '2021-04-08 02:14:59', '2021-04-08 02:14:59');
INSERT INTO `usuario` VALUES ('534', '1', 'ignacio garay', 'igaray', '$2y$10$JNJkuOKWZKKg/UsqDG1i1.FJ0MPenyusd2D4gcRgzZXqM2hZQmjee', 'ignaciogaray002@gmail.com', null, '3', '634', null, 'AguyHlso', null, null, null, '1', '1', '2021-04-08 02:14:59', '2021-04-08 02:14:59');
INSERT INTO `usuario` VALUES ('535', '1', 'kener torres', 'ktorres', '$2y$10$mGWNS7MbDw3xqH94mKUsxOW.r7TZCisCiGU0OhqV.P7YS/7mjdrrO', 'tkener9@gmail.com', null, '3', '635', null, '5JmBQKWI', null, null, null, '1', '1', '2021-04-08 02:15:00', '2021-04-08 02:15:00');
INSERT INTO `usuario` VALUES ('536', '1', 'luisa loaiza', 'lloaiza', '$2y$10$p90yj96nPQbLpn7.bULyEup3JZCszXLCfgkPVnfj5Jt08zHgfmpZq', 'Lloaiza781@gmail.com', null, '3', '636', null, 'cnNSwfLC', null, null, null, '1', '1', '2021-04-08 02:15:00', '2021-04-08 02:15:00');
INSERT INTO `usuario` VALUES ('537', '1', 'blas morales', 'bmorales', '$2y$10$IhXQXef2Dkji3p7L6OmU4.sNY5ZDMrNcbr2zEl.xtM0FKsbkJ4dbu', 'yaleniscastro392@gmail.com', null, '3', '637', null, '6RqkLVSf', null, null, null, '1', '1', '2021-04-08 02:15:01', '2021-04-08 02:15:01');
INSERT INTO `usuario` VALUES ('538', '1', 'linda ledesma', 'lledesma', '$2y$10$VmxngrL9iI4TZyhhIjmfDOSmFXAmvEpZjSi5EIXWf4nxthCjpRyHq', 'rosamendiza1975@gmail.com', null, '3', '638', null, 'Eke4CZhg', null, null, null, '1', '1', '2021-04-08 02:15:01', '2021-04-08 02:15:01');
INSERT INTO `usuario` VALUES ('539', '1', 'enuar melo', 'emelo', '$2y$10$RHVD1NcMsnLvFWhMmOmt/e6nFL9dm1F7QWFKh0oYnoaaTzyrVxbmS', 'sandrybuelvas@hotmail.com', null, '3', '639', null, '8bv7WqWT', null, null, null, '1', '1', '2021-04-08 02:15:02', '2021-04-08 02:15:02');
INSERT INTO `usuario` VALUES ('540', '1', 'esteban arias', 'earias', '$2y$10$GYJKHwHvIIbRdlSepkoOpOnFD05vehHgSXFBYiN6Cn9rN2ebDq.Fi', 'ariasovallesesteban@gmail.com', null, '3', '640', null, 'ivrT8Pxi', null, null, null, '1', '1', '2021-04-08 02:15:02', '2021-04-08 02:15:02');
INSERT INTO `usuario` VALUES ('541', '1', 'samuel cantillo', 'shcantillo', '$2y$10$p/5TM0bW342IBm8we8BeDenAskY170TWMq5D0JgblWfTDErXFe7HC', 'nayocantillo@gmail.com', null, '3', '641', null, '100iWlZU', null, null, null, '1', '1', '2021-04-08 02:15:03', '2021-04-08 02:15:03');
INSERT INTO `usuario` VALUES ('542', '1', 'natalia herrera', 'nherrera', '$2y$10$4M87MfGfUnUM2R4HCVs5xeC3DM/DTC5net0zuCT7XgKiMXuCSVJKO', 'marlenenl@outlook.com', null, '3', '642', null, 'QQZqd57I', null, null, null, '1', '1', '2021-04-08 02:15:04', '2021-04-08 02:15:04');
INSERT INTO `usuario` VALUES ('543', '1', 'dilan polo', 'dpolo', '$2y$10$oyuhHaOp4iKoaIy0MQ8cne/zg1hjKAesJovkDv11/7SO70K4rnP0.', 'marthagarizabal@gmail.com', null, '3', '643', null, 'YkVN0ZZJ', null, null, null, '1', '1', '2021-04-08 02:15:04', '2021-04-08 02:15:04');
INSERT INTO `usuario` VALUES ('544', '1', 'laurieth morales', 'lmorales', '$2y$10$r8soOGUKXBbBR/vwq.YWI.AqWZpV1D13dX.esLY8XQwf77P5HsO5y', 'laumogo1804mc@gmail.com', null, '3', '644', null, 'XGqWC5P0', null, null, null, '1', '1', '2021-04-08 02:15:05', '2021-04-08 02:15:05');
INSERT INTO `usuario` VALUES ('545', '1', 'mateo garcia', 'mgarcia', '$2y$10$XlKidRPCfxmw3JekUbwQBOJxpzcsNmr.pzvD./w3xivgSvPC/.KNW', 'licethromero21@gmail.com', null, '3', '645', null, 'HpHo2d9i', null, null, null, '1', '1', '2021-04-08 02:15:05', '2021-04-08 02:15:05');
INSERT INTO `usuario` VALUES ('546', '1', 'valentina truyol', 'vtruyol', '$2y$10$LLMzT5qQcxEQu8MX8gt7CeYVl2AhMPcN3qK.CgtcO8wqf6gheW9ZK', 'valutruyol@gmail.com', null, '3', '646', null, 'wuEjCTn2', null, null, null, '1', '1', '2021-04-08 02:15:06', '2021-04-08 02:15:06');
INSERT INTO `usuario` VALUES ('547', '1', 'ana cervantes', 'acervantes', '$2y$10$X/.TnzfnG8wybSGGODTyx.rbr/1vjyIFrl7yo73OU59vOwpeQzsK.', 'anaisabelcervantesmugno@gmail.', null, '3', '647', null, 'QseImM75', null, null, null, '1', '1', '2021-04-08 02:15:06', '2021-04-08 02:15:06');
INSERT INTO `usuario` VALUES ('548', '1', 'valery acosta', 'vacosta', '$2y$10$Gux4RKrDeirWo2BC8n9UgewYSI1k0DOHxH/q.2GClC48cY8qfIA5O', 'adalysdorado1@gmail.com', null, '3', '648', null, 'oSZ7Cpgf', null, null, null, '1', '1', '2021-04-08 02:15:07', '2021-04-08 02:15:07');
INSERT INTO `usuario` VALUES ('549', '1', 'adrian caraballo', 'acaraballo', '$2y$10$A20i6PWGSNC.NMvHU8zhH.wzXznFaNCmXV02bwYR7lOPtpSfVYRqi', 'caraballoadrian177@gmail.com', null, '3', '649', null, 'NK3A9JMh', null, null, null, '1', '1', '2021-04-08 02:15:07', '2021-04-08 02:15:07');
INSERT INTO `usuario` VALUES ('550', '1', 'jovani guerra', 'jguerra', '$2y$10$rEl2YQTrBwjLQMJeO63Rse4DYj6VvCy9qpG4qdwe0j1.l08g16EMS', 'jhonatanguerracastro@gmail.com', null, '3', '650', null, 'HWj5qKWq', null, null, null, '1', '1', '2021-04-08 02:15:08', '2021-04-08 02:15:08');
INSERT INTO `usuario` VALUES ('551', '1', 'santiago garcia', 'sgarcia', '$2y$10$kbaXQs7QgOYluXzPwAyZ1e1BCbIEmwo.kXzREPZmColkE4ddj/0iC', 'radajudith2689@gmail.com', null, '3', '651', null, 'a7faDtQI', null, null, null, '1', '1', '2021-04-08 02:15:08', '2021-04-08 02:15:08');
INSERT INTO `usuario` VALUES ('552', '1', 'jeimmy gutierrez', 'jgutierrez', '$2y$10$B3jCpY5W.1E2GW.6hsieHuyyaWbtmWI7NoyIA./mRiwGCZB24f3dm', 'mercedes0281mji@gmail.com', null, '3', '652', null, 'iEyvfnvt', null, null, null, '1', '1', '2021-04-08 02:15:09', '2021-04-08 02:15:09');
INSERT INTO `usuario` VALUES ('553', '1', 'abrahan jimenez', 'ajimenez', '$2y$10$KUlAfXOgXxiSxawx6I90oesAh9kQOUxvkS0jqSnXu1eqdnNOyoMLW', 'nerlinda@outlook.es', null, '3', '653', null, 'pE1BqBVy', null, null, null, '1', '1', '2021-04-08 02:15:09', '2021-04-08 02:15:09');
INSERT INTO `usuario` VALUES ('554', '1', 'juan martinez', 'jcmartinez', '$2y$10$FGYIPnWKk0st0DlMeLQ/.e7XKIvMBvo25XpcVj9M6zit.P36Y8A7O', 'yarleidisacevedo7@gmail.com', null, '3', '654', null, 'uiIKqfNJ', null, null, null, '1', '1', '2021-04-08 02:15:10', '2021-04-08 02:15:10');
INSERT INTO `usuario` VALUES ('555', '1', 'cristina cantillo', 'ccantillo', '$2y$10$dYxsZwbOrqF124V4isxqs.e7FQT9n.2XrsXkUrt6svtAObx0xUrym', 'tilsoncantillo10@gmail.com', null, '3', '655', null, 'UCmQ43oQ', null, null, null, '1', '1', '2021-04-08 02:15:10', '2021-04-08 02:15:10');
INSERT INTO `usuario` VALUES ('556', '1', 'ashlee garcia', 'agarcia', '$2y$10$B9Uv0eRSB444uYhpXGRV...wKEsIcLWhxY9eAW52WnapZiTNXoR6y', 'arilijohanna19@gmail.com', null, '3', '656', null, 'VEzDRszU', null, null, null, '1', '1', '2021-04-08 02:15:11', '2021-04-08 02:15:11');
INSERT INTO `usuario` VALUES ('557', '1', 'isabella gutierrez', 'igutierrez', '$2y$10$Mu6g1e3ZzxJTXb2xxibw5O9L1IImDsjKfvx27gKXdtz.977Em9aJ2', 'mercedes0281mji@gmail.com', null, '3', '657', null, 'rc7Yc1an', null, null, null, '1', '1', '2021-04-08 02:15:12', '2021-04-08 02:15:12');
INSERT INTO `usuario` VALUES ('558', '1', 'cristian alvarez', 'calvarez', '$2y$10$cNjn0o2uW3Pw5BrjGm8gEO7QMXEwDQhshJ.kkjc8DUI4ZI65R5pLS', 'iedmamey.edu@gmail.com', null, '3', '658', null, 'rY8J7yUV', null, null, null, '1', '1', '2021-04-08 02:15:12', '2021-04-08 02:15:12');
INSERT INTO `usuario` VALUES ('559', '1', 'diana bedolla', 'dbedolla', '$2y$10$No0YvHMr7wa.QxlOes0g5OYfa7SEc6phLeJS12bcRJQsruzAaTOXm', 'iedmamey.edu@gmail.com', null, '3', '659', null, 'W1MRlre0', null, null, null, '1', '1', '2021-04-08 02:15:12', '2021-04-08 02:15:12');
INSERT INTO `usuario` VALUES ('560', '1', 'emily charris', 'echarris', '$2y$10$bZpXgNcfJMIN5iLM9X7DLOLzerv79qsYyOQh4eG3LC2uIzg2Q.p1K', 'iedmamey.edu@gmail.com', null, '3', '660', null, '94L7ft9S', null, null, null, '1', '1', '2021-04-08 02:15:13', '2021-04-08 02:15:13');
INSERT INTO `usuario` VALUES ('561', '1', 'osnaider chiquillo', 'ochiquillo', '$2y$10$9dbxS7EFBtFl0bH.d9l82eAdfkrw/WG4tPfgZjRengFoP6rAKpIJS', 'iedmamey.edu@gmail.com', null, '3', '661', null, '888fBdov', null, null, null, '1', '1', '2021-04-08 02:15:13', '2021-04-08 02:15:13');
INSERT INTO `usuario` VALUES ('562', '1', 'johana duran', 'jduran', '$2y$10$U3lC9pUmvIqcmenLMR.mR.uvB12B7tt0AvBIfWS6JgJ1QYmpz.iBS', 'iedmamey.edu@gmail.com', null, '3', '662', null, 'g6YeIp7U', null, null, null, '1', '1', '2021-04-08 02:15:14', '2021-04-08 02:15:14');
INSERT INTO `usuario` VALUES ('563', '1', 'marcos lozano', 'mlozano', '$2y$10$HB.vwfWUloLMzzrJ1nxO.e.HbVau3xz.5g8EO94Mrv/DBrlrBcRJe', 'iedmamey.edu@gmail.com', null, '3', '663', null, 'ldSkCsMB', null, null, null, '1', '1', '2021-04-08 02:15:14', '2021-04-08 02:15:14');
INSERT INTO `usuario` VALUES ('564', '1', 'ziana lozano', 'zlozano', '$2y$10$aYXMfpktZAbleYHZFmfEuuZQtSqoFzsqHsFHUZvTdGmwimah26BrC', 'iedmamey.edu@gmail.com', null, '3', '664', null, 'sX9vKBSV', null, null, null, '1', '1', '2021-04-08 02:15:15', '2021-04-08 02:15:15');
INSERT INTO `usuario` VALUES ('565', '1', 'kevin luna', 'kluna', '$2y$10$nvGjdRvOAvG/WdupuZwYuuf859e/Ihv3Pr/SRDVJwlfpb69TEccbO', 'iedmamey.edu@gmail.com', null, '3', '665', null, 'md7wrH3b', null, null, null, '1', '1', '2021-04-08 02:15:15', '2021-04-08 02:15:15');
INSERT INTO `usuario` VALUES ('566', '1', 'adriana medina', 'amedina', '$2y$10$RW4qUVl9W/aBMNp0MwFepe7wx9OBqjS.RtTXt0ocynTCNHYIUlY4e', 'iedmamey.edu@gmail.com', null, '3', '666', null, 'Bof0mLub', null, null, null, '1', '1', '2021-04-08 02:15:16', '2021-04-08 02:15:16');
INSERT INTO `usuario` VALUES ('567', '1', 'melany paez', 'mpaez', '$2y$10$lTgT4DeApUrzD1Lf7ezWPe2Z9/TafM93iS0LUrdMnLrXFBf1HIlYy', 'iedmamey.edu@gmail.com', null, '3', '667', null, 'fM6VyP6n', null, null, null, '1', '1', '2021-04-08 02:15:16', '2021-04-08 02:15:16');
INSERT INTO `usuario` VALUES ('568', '1', 'luis palacios', 'lpalacios', '$2y$10$1FrUR/xW1/KGtx.hi.51YulZLvDTyeKBFSb3I6H343EM3C1cYSlEa', 'iedmamey.edu@gmail.com', null, '3', '668', null, 'LHB5eSdW', null, null, null, '1', '1', '2021-04-08 02:15:17', '2021-04-08 02:15:17');
INSERT INTO `usuario` VALUES ('569', '1', 'andrys pedroza', 'apedroza', '$2y$10$Kgulcj5walp4U3N.hPhJHusbIIotz8SztrErRYkRRnW.KupVPVAZW', 'iedmamey.edu@gmail.com', null, '3', '669', null, 'bL03lkgW', null, null, null, '1', '1', '2021-04-08 02:15:18', '2021-04-08 02:15:18');
INSERT INTO `usuario` VALUES ('570', '1', 'mariano pinto', 'mpinto', '$2y$10$SqxzB/Lol7aV3edTi6FbUu9kxzxBI4ezyaKXO9A5UdO93SqPyT37m', 'iedmamey.edu@gmail.com', null, '3', '670', null, 'gDZbVLcN', null, null, null, '1', '1', '2021-04-08 02:15:18', '2021-04-08 02:15:18');
INSERT INTO `usuario` VALUES ('571', '1', 'zalemako pinto', 'zpinto', '$2y$10$QvZ/YBKapbJrQ96P5ByhceUCk5bEnGQn9F50zjR2eRcteQcbn7f.a', 'iedmamey.edu@gmail.com', null, '3', '671', null, 'zTkliwNx', null, null, null, '1', '1', '2021-04-08 02:15:19', '2021-04-08 02:15:19');
INSERT INTO `usuario` VALUES ('572', '1', 'zialekan pinto', 'zpintod', '$2y$10$zb/iM4XdZ0zAWITh2rFQcOwfy0wyhhBLWu6sN0eTzXCpA9TTm1OrS', 'iedmamey.edu@gmail.com', null, '3', '672', null, 'ut0gaAJH', null, null, null, '1', '1', '2021-04-08 02:15:19', '2021-04-08 02:15:19');
INSERT INTO `usuario` VALUES ('573', '1', 'yerlis ramirez', 'yramirez', '$2y$10$t5ycE3miF.02D/4e77fYCeBFYaIt3RM2y0e6ZiIQhe/44t2yqKP..', 'iedmamey.edu@gmail.com', null, '3', '673', null, 'otDcgsV0', null, null, null, '1', '1', '2021-04-08 02:15:20', '2021-04-08 02:15:20');
INSERT INTO `usuario` VALUES ('574', '1', 'tania suarez', 'tsuarez', '$2y$10$0MmiBw7TNBrYiykS.BrN7exPeBmhqs6s6j27luHFroyGkBYbmUn0O', 'iedmamey.edu@gmail.com', null, '3', '674', null, 'QHeyuVJv', null, null, null, '1', '1', '2021-04-08 02:15:20', '2021-04-08 02:15:20');
INSERT INTO `usuario` VALUES ('575', '1', 'marlon vargas', 'mvargas', '$2y$10$EBdveMCU4vwCJAbU2rBrHO.De.zFMDaeMK8FY5smo8BbgFmK47b2W', 'iedmamey.edu@gmail.com', null, '3', '675', null, 'bfB8xTuS', null, null, null, '1', '1', '2021-04-08 02:15:21', '2021-04-08 02:15:21');
INSERT INTO `usuario` VALUES ('576', '1', 'fabian castro', 'fcastro', '$2y$10$6XFPPN06nwofvGNoK7fFmu57kIG.8uC8qRtgGak95qF.LISWW7Mqa', 'iedmamey.edu@gmail.com', null, '3', '676', null, 'QfOTzBpw', null, null, null, '1', '1', '2021-04-08 02:15:21', '2021-04-08 02:15:21');
INSERT INTO `usuario` VALUES ('577', '1', 'jeyderzon blanco', 'jblanco', '$2y$10$cVFV3CLyCPEWd0FaIDiHWu38jN60c41LN5jzXnXLsez7K8BhdKaEK', 'iedmamey.edu@gmail.com', null, '3', '677', null, 'NBBV2Goo', null, null, null, '1', '1', '2021-04-08 02:15:22', '2021-04-08 02:15:22');
INSERT INTO `usuario` VALUES ('578', '1', 'johan dearmas', 'jdearmas', '$2y$10$KNXwtXnjwncG64.IdwkSheaoovjz2LJSX.VgLH7FG/VyLt84ED3Am', 'iedmamey.edu@gmail.com', null, '3', '678', null, 'zljOpU15', null, null, null, '1', '1', '2021-04-08 02:15:22', '2021-04-08 02:15:22');
INSERT INTO `usuario` VALUES ('579', '1', 'brayan flores', 'bflores', '$2y$10$0RSSTq6nNVJF2zO0u7uDsuL9zgjHaVb0X2KC46zsKmbmL7PPcjm92', 'iedmamey.edu@gmail.com', null, '3', '679', null, 'b3x3bNq9', null, null, null, '1', '1', '2021-04-08 02:15:23', '2021-04-08 02:15:23');
INSERT INTO `usuario` VALUES ('580', '1', 'adriana garcia', 'agarciap', '$2y$10$O/21PZt6zJPv.iHm4Lu/aeUvuP4sFm4KPFFhxs8553qHuZEU/aYx.', 'iedmamey.edu@gmail.com', null, '3', '680', null, 'tWQw84oj', null, null, null, '1', '1', '2021-04-08 02:15:23', '2021-04-08 02:15:23');
INSERT INTO `usuario` VALUES ('581', '1', 'gina garcia', 'ggarcia', '$2y$10$vZvVOgf5vzVUnBLCAKi.deS3GQA2Oofc6OlcXeJ3fXnuIDhl3GTvm', 'iedmamey.edu@gmail.com', null, '3', '681', null, 'Nl9lvgIo', null, null, null, '1', '1', '2021-04-08 02:15:24', '2021-04-08 02:15:24');
INSERT INTO `usuario` VALUES ('582', '1', 'paola giraldo', 'pgiraldo', '$2y$10$RKB3S5qrWTDuVAEstXLxX.F.PE22JRc19KB4MY5ct1zGHukLZannC', 'iedmamey.edu@gmail.com', null, '3', '682', null, 'QLHVGY9u', null, null, null, '1', '1', '2021-04-08 02:15:25', '2021-04-08 02:15:25');
INSERT INTO `usuario` VALUES ('583', '1', 'mary gutierrez', 'mgutierrez', '$2y$10$Fnt5D2Q5d/Ms0sSpgKSuced9QyB6wRiwbZVwWjH68D.sQb53Fd.Ca', 'iedmamey.edu@gmail.com', null, '3', '683', null, 'iibpoU1J', null, null, null, '1', '1', '2021-04-08 02:15:25', '2021-04-08 02:15:25');
INSERT INTO `usuario` VALUES ('584', '1', 'saray higuita', 'shiguita', '$2y$10$jYexxTkgku5PPYHky62hdOCCgYpNuH4GciIF6Lg7uvJEYxSJ4lNMq', 'iedmamey.edu@gmail.com', null, '3', '684', null, 'ewzTLzge', null, null, null, '1', '1', '2021-04-08 02:15:26', '2021-04-08 02:15:26');
INSERT INTO `usuario` VALUES ('585', '1', 'jesus lambrano', 'jlambrano', '$2y$10$fGDM5GOvs9u6vjOMX/IYLuQI5e.cnbJxMDHlMmABwuJ54xTazuXXy', 'iedmamey.edu@gmail.com', null, '3', '685', null, 'X84lV2Fu', null, null, null, '1', '1', '2021-04-08 02:15:26', '2021-04-08 02:15:26');
INSERT INTO `usuario` VALUES ('586', '1', 'esleider lara', 'elara', '$2y$10$xSprAT4jbZa38KS/JZHHqOU4P8nKqr5muElwBP8ZNvrX7x/VcRD0i', 'iedmamey.edu@gmail.com', null, '3', '686', null, 'qzxqWqEv', null, null, null, '1', '1', '2021-04-08 02:15:27', '2021-04-08 02:15:27');
INSERT INTO `usuario` VALUES ('587', '1', 'jhoan lara', 'jlara', '$2y$10$4iSBayLuOxUP7nOsQvsLTep5MdCvcC2VGLm7pLEyAlfAGelXnT4AK', 'iedmamey.edu@gmail.com', null, '3', '687', null, 'bsyXsIRk', null, null, null, '1', '1', '2021-04-08 02:15:28', '2021-04-08 02:15:28');
INSERT INTO `usuario` VALUES ('588', '1', 'skarleth leones', 'sleones', '$2y$10$Ggq01E17Za9eyCROX77ocOdg9kA2c.K/3Twwt43/pOVMmXK0YzIhe', 'iedmamey.edu@gmail.com', null, '3', '688', null, 'Ul4AXjnP', null, null, null, '1', '1', '2021-04-08 02:15:28', '2021-04-08 02:15:28');
INSERT INTO `usuario` VALUES ('589', '1', 'maritza lopez', 'mllopez', '$2y$10$p2TFrSS8sjHE6xd8GJntuu8bLq7gGvW.5ixsPmr/rYAym497Hvdqe', 'iedmamey.edu@gmail.com', null, '3', '689', null, 'kj9Eb8TP', null, null, null, '1', '1', '2021-04-08 02:15:29', '2021-04-08 02:15:29');
INSERT INTO `usuario` VALUES ('590', '1', 'sol lora', 'slora', '$2y$10$eNmYYFup6WtB5bPH5RYk9OVPhIFXog6PoEnvrDXvAPgmfGpdDWNfK', 'iedmamey.edu@gmail.com', null, '3', '690', null, 'SqREpjFE', null, null, null, '1', '1', '2021-04-08 02:15:29', '2021-04-08 02:15:29');
INSERT INTO `usuario` VALUES ('591', '1', 'yeraldine rada', 'yrada', '$2y$10$GGGgfPoGeu.NN1GvY8Yg1OATEoiI6OflCNPZ7J7iXzKKrcCePqwxG', 'iedmamey.edu@gmail.com', null, '3', '691', null, 'zwLtHP9G', null, null, null, '1', '1', '2021-04-08 02:15:30', '2021-04-08 02:15:30');
INSERT INTO `usuario` VALUES ('592', '1', 'edwin reyes', 'ereyes', '$2y$10$Vm7IrsGBSms2A3pZBehyJOLRfOH3VmLiqqvHrAFNR1xvtM4Y/oDJS', 'iedmamey.edu@gmail.com', null, '3', '692', null, 'AyCI9LvQ', null, null, null, '1', '1', '2021-04-08 02:15:30', '2021-04-08 02:15:30');
INSERT INTO `usuario` VALUES ('593', '1', 'camilo rios', 'crios', '$2y$10$4o2GoV5Z5AqZic9t0/7xiexSP3UqdF3X0u8nnG16zL7gIMCw1G906', 'iedmamey.edu@gmail.com', null, '3', '693', null, 'bVJHZvMs', null, null, null, '1', '1', '2021-04-08 02:15:31', '2021-04-08 02:15:31');
INSERT INTO `usuario` VALUES ('594', '1', 'yuli tapias', 'ytapias', '$2y$10$y1YvEE7.NbBqi5MnyTMkw.NGTs6gu5z2NsXh5yvwYllgMM6gXpzTC', 'iedmamey.edu@gmail.com', null, '3', '694', null, 'gbs5cOvk', null, null, null, '1', '1', '2021-04-08 02:15:31', '2021-04-08 02:15:31');
INSERT INTO `usuario` VALUES ('595', '1', 'diana murillo', 'dmurillo', '$2y$10$k37/XtcYDsg0UpKs.QGmS..iSX6MgboiGMLtHrbTizL2sa/kLCFda', 'iedmamey.edu@gmail.com', null, '3', '695', null, 'n8vE69Zw', null, null, null, '1', '1', '2021-04-08 02:15:32', '2021-04-08 02:15:32');
INSERT INTO `usuario` VALUES ('596', '1', 'tania castelbondo', 'tcastelbondo', '$2y$10$JukR/ftqrLQ/LFOU4zz6w.lE2PqZPUQ/X9cAeTIn4vguqjS6E5j96', 'iedmamey.edu@gmail.com', null, '3', '696', null, 'er7MGk5D', null, null, null, '1', '1', '2021-04-08 02:15:32', '2021-04-08 02:15:32');
INSERT INTO `usuario` VALUES ('597', '1', 'luis barragan', 'lbarragan', '$2y$10$Ze7Wphsyu8xGkldJtFZfCujl8D63oiZGUsK4Ukxi5Rardq5a.Voz6', 'iedmamey.edu@gmail.com', null, '3', '697', null, 'uHSXJPKu', null, null, null, '1', '1', '2021-04-08 02:15:33', '2021-04-08 02:15:33');
INSERT INTO `usuario` VALUES ('598', '1', 'yoiner castelbondo', 'ycastelbondo', '$2y$10$aa32JkeYWicSeVXpbpxzzO2gW.hilUz.XaAggaVBC0yxKP43rOvtq', 'iedmamey.edu@gmail.com', null, '3', '698', null, '4NgZpPTs', null, null, null, '1', '1', '2021-04-08 02:15:33', '2021-04-08 02:15:33');
INSERT INTO `usuario` VALUES ('599', '1', 'luis gallego', 'lgallego', '$2y$10$lD6TDVXC4JHMyNKSExVCkOitKOikxS6OJjTgD.htA4aWcPaNlRmt2', 'iedmamey.edu@gmail.com', null, '3', '699', null, 'qrE44ioh', null, null, null, '1', '1', '2021-04-08 02:15:34', '2021-04-08 02:15:34');
INSERT INTO `usuario` VALUES ('600', '1', 'yarih pertuz', 'ypertuz', '$2y$10$r0XWkUpeykh7NzfF1ho4K.RLWccdRk56YyHuBbe53zN84LY6ap9pG', 'iedmamey.edu@gmail.com', null, '3', '700', null, 'cWAbHPf1', null, null, null, '1', '1', '2021-04-08 02:15:35', '2021-04-08 02:15:35');
INSERT INTO `usuario` VALUES ('601', '1', 'jose lozano', 'jlozano', '$2y$10$sfIbDfJ8ROkHPoea5phyzusSnQpDGyNhjvabggEOYmUaxKPyKr1IK', 'iedmamey.edu@gmail.com', null, '3', '701', null, 'OwMVNG1p', null, null, null, '1', '1', '2021-04-08 02:15:35', '2021-04-08 02:15:35');
INSERT INTO `usuario` VALUES ('602', '1', 'michel castillo', 'mcastillo', '$2y$10$SiKeEkpIFDiO6Ax6.0ptieARH90a7BK8JNHTGagzD.VI7FLdnv8ha', 'iedmamey.edu@gmail.com', null, '3', '702', null, '23TIoSvn', null, null, null, '1', '1', '2021-04-08 02:15:36', '2021-04-08 02:15:36');
INSERT INTO `usuario` VALUES ('603', '1', 'luis llanos', 'lllanos', '$2y$10$Tz24YsGxb5G/.0pR/cY8n.BTkeXWO8tYeMwVIUkM13mXD53JHS7QW', 'iedmamey.edu@gmail.com', null, '3', '703', null, 'ccASuZfH', null, null, null, '1', '1', '2021-04-08 02:15:36', '2021-04-08 02:15:36');
INSERT INTO `usuario` VALUES ('604', '1', 'eliaser lozano', 'elozano', '$2y$10$NW13MLd86RXGCoMK1MeMzuvnFg9BGaS93/1aezfuNRkBey9dDUMDO', 'iedmamey.edu@gmail.com', null, '3', '704', null, 'X23vxYxV', null, null, null, '1', '1', '2021-04-08 02:15:36', '2021-04-08 02:15:36');
INSERT INTO `usuario` VALUES ('605', '1', 'manawi lozano', 'mlozanod', '$2y$10$y4VFCL.Gc.i4iD9nIqtzWeQiKydtnvqXYgw6a3ys63mgwKgUQvywS', 'iedmamey.edu@gmail.com', null, '3', '705', null, '5i6dnJhO', null, null, null, '1', '1', '2021-04-08 02:15:37', '2021-04-08 02:15:37');
INSERT INTO `usuario` VALUES ('606', '1', 'jones lozano', 'jlozanod', '$2y$10$8E8.kuiHmgvGR4PLfqWTLuB2cp286N7ZEzsCwTl68x96tnHBcGrgy', 'iedmamey.edu@gmail.com', null, '3', '706', null, 'OYt6KXbw', null, null, null, '1', '1', '2021-04-08 02:15:37', '2021-04-08 02:15:37');
INSERT INTO `usuario` VALUES ('607', '1', 'roberto lozano', 'rlozano', '$2y$10$Xw.ms1X4Cs/5oGUUP4cWK.9bfdSYHI6FKhUG.12Ma8YQogHnDU2Uq', 'iedmamey.edu@gmail.com', null, '3', '707', null, 'RP3spciK', null, null, null, '1', '1', '2021-04-08 02:15:38', '2021-04-08 02:15:38');
INSERT INTO `usuario` VALUES ('608', '1', 'didier meneses', 'dmeneses', '$2y$10$9aQypt06V3jP2fMB4t61uOAYAxniUp.cTxn2/t/u6RiXyDUK6OyFO', 'iedmamey.edu@gmail.com', null, '3', '708', null, 'I8UEYO7v', null, null, null, '1', '1', '2021-04-08 02:15:39', '2021-04-08 02:15:39');
INSERT INTO `usuario` VALUES ('609', '1', 'yenifer cuellar', 'ycuellar', '$2y$10$ODPYw.YXWCQ4X.oSOzwQu.asQb/fRSBDavVznzyUfujBmpD5Gb62a', 'iedmamey.edu@gmail.com', null, '3', '709', null, 'a3GlKzcV', null, null, null, '1', '1', '2021-04-08 02:15:39', '2021-04-08 02:15:39');
INSERT INTO `usuario` VALUES ('610', '1', 'uriel moscote', 'umoscote', '$2y$10$F9Zf0/taTbc/CjVkhPbyVO62uKvPAce0NitpW7Xx.UyQnvxTpyUJK', 'iedmamey.edu@gmail.com', null, '3', '710', null, 'scDAPPxu', null, null, null, '1', '1', '2021-04-08 02:15:40', '2021-04-08 02:15:40');
INSERT INTO `usuario` VALUES ('611', '1', 'maria anaya', 'mdanaya', '$2y$10$tcWGBh70nijv/OWotU6kQeNfFy5vPBbB45dqcUtJIcaK/zkcmIJZW', 'yucontre01@gmail.com', null, '3', '711', null, 'G1H8091H', null, null, null, '1', '1', '2021-04-08 02:15:40', '2021-04-08 02:15:40');
INSERT INTO `usuario` VALUES ('612', '1', 'sharith pino', 'spino', '$2y$10$4J3NpxFOEiqrj00eF8CpsuA2gSsf5ENpZKndPfmlWfLGtLXB8lMl6', 'emivega73@gmail.com', null, '3', '712', null, '7OgNzzt3', null, null, null, '1', '1', '2021-04-08 02:15:41', '2021-04-08 02:15:41');
INSERT INTO `usuario` VALUES ('613', '1', 'yanelis santos', 'ysantos', '$2y$10$dYOId2cu8VUjtWEwiIbbM.V7L./YZEdWx9MwL.fiFbSyBcR03Y7Wa', 'saumethjaimeguillermo75@gmail.', null, '3', '713', null, 'TgQC5Lok', null, null, null, '1', '1', '2021-04-08 02:15:41', '2021-04-08 02:15:41');
INSERT INTO `usuario` VALUES ('614', '1', 'dulce saumeth', 'dsaumeth', '$2y$10$03dnH.4WWt.4y/Yh9r7gneUVfuXBxx2fekCtSyrRhvuigDzW4nn9C', 'menzadalgiza36@gmail.com', null, '3', '714', null, 'e3P4RSGU', null, null, null, '1', '1', '2021-04-08 02:15:42', '2021-04-08 02:15:42');
INSERT INTO `usuario` VALUES ('615', '1', 'valery diaz', 'vdiaz', '$2y$10$s82neakmM/CRPqGgpSLUK.TfbOyptZIl0S91Ew.K99YCE0ROjRlkm', 'vivianocampo13@gmail.com', null, '3', '715', null, 'YGgFE14D', null, null, null, '1', '1', '2021-04-08 02:15:42', '2021-04-08 02:15:42');
INSERT INTO `usuario` VALUES ('616', '1', 'pedro molina', 'pmolina', '$2y$10$rAfVcskTO7gSdWPcx8Eci.yTJ9kZdVyJD5spn7IWpDmO1xcJ0EeHG', 'cipago2@hotmail.com', null, '3', '716', null, 'xijcY3Z6', null, null, null, '1', '1', '2021-04-08 02:15:43', '2021-04-08 02:15:43');
INSERT INTO `usuario` VALUES ('617', '1', 'liz bermudez', 'lbermudez', '$2y$10$ZgQKKToGWgauKaFXf/VBXOg34iIWdSHsx03Y8N6EcepwUH.9HZbTC', 'lizjoeskaberdugotorres@gmail.c', null, '3', '717', null, 'SzsmghcM', null, null, null, '1', '1', '2021-04-08 02:15:44', '2021-04-08 02:15:44');
INSERT INTO `usuario` VALUES ('618', '1', 'karla molina', 'kmolina', '$2y$10$iby.L8z1A10ufK05CUL5kOr4TfGw/1kbVeqO2/Tc9kOVSZfpVK4Tu', 'amayapinedaluisafernanda@gmail', null, '3', '718', null, '19TAW3J8', null, null, null, '1', '1', '2021-04-08 02:15:44', '2021-04-08 02:15:44');
INSERT INTO `usuario` VALUES ('619', '1', 'javier mugno', 'jmugno', '$2y$10$OF3CBMFKJwDeqh.agI2Ut.EZqqCAwPJWn2tl.iUSvEl..cbWQktKu', 'alexis26jul@hotmail.com', null, '3', '719', null, 'Zntc6uCn', null, null, null, '1', '1', '2021-04-08 02:15:45', '2021-04-08 02:15:45');
INSERT INTO `usuario` VALUES ('620', '1', 'laura menco', 'lmenco', '$2y$10$9U.gqpoM/lSFYhobGYQKJ.SjOjP3/xYplM4UGpqMpRAOSEcw6yvtK', 'laurayossua1gmail.com ', null, '3', '720', null, '8YPJPTnD', null, null, null, '1', '1', '2021-04-08 02:15:45', '2021-04-08 02:15:45');
INSERT INTO `usuario` VALUES ('621', '1', 'william castillo', 'wcastillo', '$2y$10$a4saTptFwhxxNmR718olmOP9VLs/NQg2xo4Gy4UAZ1ZoyELWsFVdG', 'yulisoliveras1986@gmail.com', null, '3', '721', null, 'yEfkFyF4', null, null, null, '1', '1', '2021-04-08 02:15:46', '2021-04-08 02:15:46');
INSERT INTO `usuario` VALUES ('622', '1', 'maria gamarra', 'mgamarra', '$2y$10$i5/G1yM1Ywza0VR8wTEBr.AZ0L6yV05Ldl5qhgdR3cZ6BHCl5EFxi', 'gamarra46@gmail.com', null, '3', '722', null, '3bED2NMe', null, null, null, '1', '1', '2021-04-08 02:15:46', '2021-04-08 02:15:46');
INSERT INTO `usuario` VALUES ('623', '1', 'felix ramirez', 'framirez', '$2y$10$KV1Jf3dmebySW9.8YuGWB.3HhTJ9r4pbx6I8QdAuNwVw/vlKA2Ve.', 'ramireztorresluisalberto4@gmai', null, '3', '723', null, 'Eb8jaJGf', null, null, null, '1', '1', '2021-04-08 02:15:47', '2021-04-08 02:15:47');
INSERT INTO `usuario` VALUES ('624', '1', 'kaner vina', 'kvina', '$2y$10$6k9QY6oGqun8PqCWPWeUiOQfp/MqePaHftthIxKNcFMjUfWbTWCy.', 'luzsierraf@hotmail.com', null, '3', '724', null, 'ZrZy4cWL', null, null, null, '1', '1', '2021-04-08 02:15:47', '2021-04-08 02:15:47');
INSERT INTO `usuario` VALUES ('625', '1', 'andrea simanca', 'asimanca', '$2y$10$llXjocLEXzG6CLKCwJ1kyOG1RGm1z6Jc4gvSkOPBDCdqt0YFZDBE2', 'kathesaumeth@gmail.com', null, '3', '725', null, 'CZzsLrWn', null, null, null, '1', '1', '2021-04-08 02:15:48', '2021-04-08 02:15:48');
INSERT INTO `usuario` VALUES ('626', '1', 'helena guerra', 'hguerra', '$2y$10$iJUY9IfvhfgLzImwV6R.de89U8bY3MvbkX0DwclgrgxMRikSgsr56', 'yanithyaneth@hotmail.com', null, '3', '726', null, '9PJ3ug7S', null, null, null, '1', '1', '2021-04-08 02:15:48', '2021-04-08 02:15:48');
INSERT INTO `usuario` VALUES ('627', '1', 'carlos coronel', 'ccoronel', '$2y$10$YYeW5k68YacHdZiHKKcQ/e6yGBqET6ixX1p5dJ81A.INJN0X05tdu', 'carlosdanielcoronelvisbal@gmai', null, '3', '727', null, 'xVKzh7NH', null, null, null, '1', '1', '2021-04-08 02:16:07', '2021-04-08 02:16:07');
INSERT INTO `usuario` VALUES ('628', '1', 'isabella vizcaino', 'ivizcaino', '$2y$10$ziYGYRGWCwawdlA9R0aurOGyHYqwqyoKzXxgJz/PzzsTO7agd62Oi', 'saredi0912@gmail.com', null, '3', '728', null, 'WTZTCiFu', null, null, null, '1', '1', '2021-04-08 02:16:08', '2021-04-08 02:16:08');
INSERT INTO `usuario` VALUES ('629', '1', 'gabriela marbello', 'gmarbello', '$2y$10$xRbT7UopaIBi.qian6D8/.2gHEXd8H2HwzNhePR03flndiLBMG3zi', 'gabrielamarbello@gmail.com', null, '3', '729', null, 'cjvl1Gg0', null, null, null, '1', '1', '2021-04-08 02:16:08', '2021-04-08 02:16:08');
INSERT INTO `usuario` VALUES ('630', '1', 'jeylee pallares', 'jpallares', '$2y$10$4dW6vObqmgTDz7XosSu9j.D9CAfJNEugzmAqXhzmZEWornJ668Gk.', 'jeylee2112@gmail.com', null, '3', '730', null, 'Mw4Fcb5M', null, null, null, '1', '1', '2021-04-08 02:16:09', '2021-04-08 02:16:09');
INSERT INTO `usuario` VALUES ('631', '1', 'maibelindelosangeles castro', 'mcastro', '$2y$10$8TzIH6Wtjywmq3tEkHPyW.2iJv2mZ67vZ4KU5d3JtLV8ps2SJLAUO', 'odiliajhonson20@gmail.com', null, '3', '731', null, 'mNquCTS8', null, null, null, '1', '1', '2021-04-08 02:16:09', '2021-04-08 02:16:09');
INSERT INTO `usuario` VALUES ('632', '1', 'maria castro', 'macastro', '$2y$10$/ny2SmRpaN6TZysd7StdEOGrns/WsAgqGUO4wQ/lC4joGTvkqjUua', 'odiliajhonson20@gmail.com', null, '3', '732', null, 'WnD7Hyne', null, null, null, '1', '1', '2021-04-08 02:16:10', '2021-04-08 02:16:10');
INSERT INTO `usuario` VALUES ('633', '1', 'maria ferrer', 'mferrer', '$2y$10$WBIWLqmn0qUbyM4vCnR6Au8YX3Mkbw4q1qmVDzlpS/WcZlTtFajnu', 'mariasaumeth0302@gmail.com', null, '3', '733', null, '9wx23J1I', null, null, null, '1', '1', '2021-04-08 02:16:11', '2021-04-08 02:16:11');
INSERT INTO `usuario` VALUES ('634', '1', 'leidis castro', 'lcastro', '$2y$10$6dv94JtWQhiqdbc76BV5s.qDur5PQ4Pr8NNmsuJ.xTntyZ4Xz2yEu', 'danithbarandica.m@gmail.com', null, '3', '734', null, 'PDZLzohc', null, null, null, '1', '1', '2021-04-08 02:16:11', '2021-04-08 02:16:11');
INSERT INTO `usuario` VALUES ('635', '1', 'danna pascuales', 'dpascuales', '$2y$10$u3zJ8m67S3Y0no00RyrH5uMMqHbc9HOSFXgiuSa6sHzKcHOWogoq6', 'castroeucaris20@gmail.com', null, '3', '735', null, 'oymuRWoe', null, null, null, '1', '1', '2021-04-08 02:16:12', '2021-04-08 02:16:12');
INSERT INTO `usuario` VALUES ('636', '1', 'saith garcia', 'sjgarcia', '$2y$10$8Zn1gmSGBWU9km9kln5.8enUgqyMTxn7AIichAgAxnJCtlN3jW3wS', 'marlysgarcía@gmail.com', null, '3', '736', null, 'rpCN7Zz7', null, null, null, '1', '1', '2021-04-08 02:16:12', '2021-04-08 02:16:12');
INSERT INTO `usuario` VALUES ('637', '1', 'jainer paredes', 'jparedes', '$2y$10$.wBRMcfDh7ghvZam6A8IB.ronkveExEQOkHE6CfhcZqdCiN.Vg27C', 'sugerodriguez14@gmail.com', null, '3', '737', null, 'ptkslAbT', null, null, null, '1', '1', '2021-04-08 02:16:13', '2021-04-08 02:16:13');
INSERT INTO `usuario` VALUES ('638', '1', 'sharick campo', 'scampo', '$2y$10$AQS42fdWuLdJa.Z9sUmrkuBwCN4dmbbIHxdGMYUp7XgLOOXe.J/Qa', 'sazasha0302@gmail.com', null, '3', '738', null, '2GB6g7ln', null, null, null, '1', '1', '2021-04-08 02:16:13', '2021-04-08 02:16:13');
INSERT INTO `usuario` VALUES ('639', '1', 'valeria carroll', 'vcarroll', '$2y$10$c9sYAmpsizAFq8qAczQXtOmQlzP47A3m106YqnUQhvsJCH5fCuyFW', 'Valeriaaltafulla36@gmail.com', null, '3', '739', null, 'Dixk26HN', null, null, null, '1', '1', '2021-04-08 02:16:14', '2021-04-08 02:16:14');
INSERT INTO `usuario` VALUES ('640', '1', 'neiledis coronado', 'ncoronado', '$2y$10$iuhmlJAowCOGuVXTm7hqout6Yk6jFOVFk.Dqt5nOFFmj9X07jmTbO', 'nejhaconi_06@hotmail.com', null, '3', '740', null, 'LVjF0DYt', null, null, null, '1', '1', '2021-04-08 02:16:14', '2021-04-08 02:16:14');
INSERT INTO `usuario` VALUES ('641', '1', 'diana coronado', 'dcoronado', '$2y$10$W5N6qEkiX5ZJbGYppfMCZec/9SJwWOh65UEh/f4/N4Q5akkjyZBpa', 'dianacarolinad383@gmail.com', null, '3', '741', null, 'oFsa5IUh', null, null, null, '1', '1', '2021-04-08 02:16:15', '2021-04-08 02:16:15');
INSERT INTO `usuario` VALUES ('642', '1', 'andrea daza', 'adaza', '$2y$10$Zhp8uPyi10TALxKj.XJc0.61vAzAmaQgQb40.aYlXkZV4QkRlsAb6', 'andrea5cadaro@gmail.com', null, '3', '742', null, 'vgq2tE7D', null, null, null, '1', '1', '2021-04-08 02:16:15', '2021-04-08 02:16:15');
INSERT INTO `usuario` VALUES ('643', '1', 'heidy delahoz', 'hdelahoz', '$2y$10$QKytMwl.Lu7TPBibMNvrPO3d5oc/H7oQ7OmYxXQe4643mPWbrl7pi', 'delaozsalas@Gmail.com', null, '3', '743', null, 'tOlJXGJX', null, null, null, '1', '1', '2021-04-08 02:16:16', '2021-04-08 02:16:16');
INSERT INTO `usuario` VALUES ('644', '1', 'ana deleon', 'adeleon', '$2y$10$yT.rAN8iAiQRsj2hqtgCnOnAdEYg2VY9Vk9LK53zeSWZW0eHUhnpi', 'Betsy121783@gmail.com', null, '3', '744', null, 'DrV31Psq', null, null, null, '1', '1', '2021-04-08 02:16:16', '2021-04-08 02:16:16');
INSERT INTO `usuario` VALUES ('645', '1', 'oreanadelpilar escorcia', 'oescorcia', '$2y$10$ZBdz/nOIW7cKCmYbs6bSEeVfizAkmmHcSH0JasWDzLcO8UslXuk4a', 'oreana.2006@gmail.com', null, '3', '745', null, '7HvuIv0i', null, null, null, '1', '1', '2021-04-08 02:16:18', '2021-04-08 02:16:18');
INSERT INTO `usuario` VALUES ('646', '1', 'marihan estrada', 'mestrada', '$2y$10$yel/p1GrxnYSIYs4mTiANOhn/e7WO8iiAMNkIWyUv1sw3jCy69d3.', 'Jpaolarori@gmail.com', null, '3', '746', null, 'JCwPlbxu', null, null, null, '1', '1', '2021-04-08 02:16:18', '2021-04-08 02:16:18');
INSERT INTO `usuario` VALUES ('647', '1', 'isabela fernandez', 'ifernandez', '$2y$10$YwdE0OYKNQaZbC/tVfDYTeqzYB.fxHD82ZGDF0RaX4cuKAK4S2tjK', 'Isabellafernandez1208@gmil.com', null, '3', '747', null, 'DAlOOWfe', null, null, null, '1', '1', '2021-04-08 02:16:19', '2021-04-08 02:16:19');
INSERT INTO `usuario` VALUES ('648', '1', 'greilys henriquez', 'ghenriquez', '$2y$10$dgRwMvGNyyR8IJmfnVZOqekmdapA7869/IkYjZmY0j1TF44cdNnM2', 'greilyd@gmail.com', null, '3', '748', null, 'ngRgNh3F', null, null, null, '1', '1', '2021-04-08 02:16:19', '2021-04-08 02:16:19');
INSERT INTO `usuario` VALUES ('649', '1', 'estefany huertas', 'ehuertas', '$2y$10$ld25Kf9gxee3KmPyfTH3T.lkLgOfCZz72/jc0yr1J0bo6nqdoeIqm', 'estefanyhuertasz04@gmail.com', null, '3', '749', null, 'dc4errK9', null, null, null, '1', '1', '2021-04-08 02:16:20', '2021-04-08 02:16:20');
INSERT INTO `usuario` VALUES ('650', '1', 'betsy ibanez', 'bibanez', '$2y$10$TlMyk2RuHws01ncdiD3Oqu4AfSWUbm//fh8vWttDVaeIjpJcuj1sS', 'melabetsyp@gmail.com', null, '3', '750', null, '3ouN3kAw', null, null, null, '1', '1', '2021-04-08 02:16:20', '2021-04-08 02:16:20');
INSERT INTO `usuario` VALUES ('651', '1', 'stefany lagos', 'slagos', '$2y$10$6Mm0RHxzyOCWwNkCa3tIWeM/KyFdlETSdSZaKgbfex4PIAwNUaAo6', 'stefanysofialagosmelendez@gmai', null, '3', '751', null, 'K3fRhwWp', null, null, null, '1', '1', '2021-04-08 02:16:21', '2021-04-08 02:16:21');
INSERT INTO `usuario` VALUES ('652', '1', 'mariangel larrota', 'mlarrota', '$2y$10$Rne4X9B/MSyEyWkWjiyOUuK93ASCFDTRdaKyanFgDk7kn.hg1PHm6', 'yeleinis1997@gmail.com', null, '3', '752', null, 'sQdUUoWq', null, null, null, '1', '1', '2021-04-08 02:16:21', '2021-04-08 02:16:21');
INSERT INTO `usuario` VALUES ('653', '1', 'jennifer leyva', 'jleyva', '$2y$10$poTy7anpfPk3An9j4XlHuuMJGqhQF9b9GcNS51NHA8E9aVGa8ZuVC', 'Jenyaleja@icloud.com', null, '3', '753', null, '0f0y7UPx', null, null, null, '1', '1', '2021-04-08 02:16:22', '2021-04-08 02:16:22');
INSERT INTO `usuario` VALUES ('654', '1', 'juliana lobato', 'jlobato', '$2y$10$Nxg24GiWQJlMhfZKYwo1JupnRQp9ocO5WySm0OGwhv4cfuqt79Y.6', 'julianalobato07@gmail.com', null, '3', '754', null, 'fVHHPIAU', null, null, null, '1', '1', '2021-04-08 02:16:22', '2021-04-08 02:16:22');
INSERT INTO `usuario` VALUES ('655', '1', 'yenizareth martinez', 'ymartinez', '$2y$10$XddiRY8ftjAY9PPg9LknM.PlUPIAZI9eLJy9xGpKi3Xp5E1ZFtoO2', 'martinezyenizareth@gmail.com', null, '3', '755', null, 'hF7zkkOz', null, null, null, '1', '1', '2021-04-08 02:16:23', '2021-04-08 02:16:23');
INSERT INTO `usuario` VALUES ('656', '1', 'karolayne mojica', 'kmojica', '$2y$10$iY88G6x8F7HBECGZz4bnJ.5/SnGXe20SUPghLWV1b/zvxiJBAoAMW', 'Llerekaro@gmail.com', null, '3', '756', null, 'yoRett7E', null, null, null, '1', '1', '2021-04-08 02:16:23', '2021-04-08 02:16:23');
INSERT INTO `usuario` VALUES ('657', '1', 'melanie moreno', 'mmoreno', '$2y$10$eOGYr7EK2BDsmKn0/8FQsubRTX7OOLkXagh/GNNb5AoNJKpvfsPSm', 'Melaniesofi0412@gmail.com', null, '3', '757', null, '2ImZIESi', null, null, null, '1', '1', '2021-04-08 02:16:24', '2021-04-08 02:16:24');
INSERT INTO `usuario` VALUES ('658', '1', 'sharon ortiz', 'sortiz', '$2y$10$Dh1G7.7z/TaaUe/sDHg5X.Ivs2Kovqp5MWbkGRPkETL0NrlGiAu.6', 'michellgranadoscarrillo@gmail.', null, '3', '758', null, 'OawMlPgp', null, null, null, '1', '1', '2021-04-08 02:16:24', '2021-04-08 02:16:24');
INSERT INTO `usuario` VALUES ('659', '1', 'diocelina pabon', 'dpabon', '$2y$10$Kkl7Y8yJzElpF1kHMC/I/OOga3n5tsBrKJ.GUyBv6JV/Y5Q8Ww4FC', 'dpabonduran@gmail.com', null, '3', '759', null, '3FQkhzSO', null, null, null, '1', '1', '2021-04-08 02:16:25', '2021-04-08 02:16:25');
INSERT INTO `usuario` VALUES ('660', '1', 'silvia quintana', 'squintana', '$2y$10$UVh5W/7OXCz1.ucedzHk.OT0AC9ugw2CeNvnkDGNrnq.DUrf.pRRe', 'Silviaquintanatorres28@gmail.c', null, '3', '760', null, 'ThreKERr', null, null, null, '1', '1', '2021-04-08 02:16:25', '2021-04-08 02:16:25');
INSERT INTO `usuario` VALUES ('661', '1', 'axcelly ramirez', 'aramirez', '$2y$10$i29PfxyMtnnTeDx.k6kAEO1ZV49H4UNIVEccO/Pq17zH80SL2l59O', 'axcellyr@gmail.com', null, '3', '761', null, 'JeZx19a4', null, null, null, '1', '1', '2021-04-08 02:16:26', '2021-04-08 02:16:26');
INSERT INTO `usuario` VALUES ('662', '1', 'keyla restrepo', 'krestrepo', '$2y$10$XTCk5J32BTAs90JGv4FLI.LjPL6tDyWq8ev18oLzUPQB23ertLKKm', 'krestrepoortiz@gmail.com', null, '3', '762', null, '63BsnjZP', null, null, null, '1', '1', '2021-04-08 02:16:26', '2021-04-08 02:16:26');
INSERT INTO `usuario` VALUES ('663', '1', 'angelina rodriguez', 'arodriguez', '$2y$10$Wdsyrnr9XR18iP7HVofbPeOPJq.GgWwU0vVB7KH1El7IaZdjMczuK', 'angelinavanessa10@gmail.com', null, '3', '763', null, 'cxBJFPBU', null, null, null, '1', '1', '2021-04-08 02:16:27', '2021-04-08 02:16:27');
INSERT INTO `usuario` VALUES ('664', '1', 'laura rosado', 'lrosado', '$2y$10$c6fIIgSvg4MwEH.uXKAHX.zy6fYFxEtNKg4jHACcFpWZPc3GX.vHS', 'laurarosadoc6@gmail.com', null, '3', '764', null, 'jBrpKh7g', null, null, null, '1', '1', '2021-04-08 02:16:28', '2021-04-08 02:16:28');
INSERT INTO `usuario` VALUES ('665', '1', 'valentina salazar', 'vsalazar', '$2y$10$TH.O9Hs1bDKsnz5sKUJn0.43ZPyS538pFp1f.WzEvAyfm9oWHHLxu', 'Estudiante7valentinasalem@gmai', null, '3', '765', null, 'TLCVNBoG', null, null, null, '1', '1', '2021-04-08 02:16:28', '2021-04-08 02:16:28');
INSERT INTO `usuario` VALUES ('666', '1', 'camila salazar', 'csalazar', '$2y$10$ud2T/g9K3w2r0wNKovKM1e0sLi5lD.WRSeAdaI6ZROaMRdLJOBh2C', 'camilaisabelsalazar@gmail.com', null, '3', '766', null, 'nBQZJu7n', null, null, null, '1', '1', '2021-04-08 02:16:28', '2021-04-08 02:16:28');
INSERT INTO `usuario` VALUES ('667', '1', 'danna salcedo', 'dsalcedo', '$2y$10$.tUwCPoy9btQNqFYMRJQuO9q.22inWuXnRpPdyllY.UeJfBQWMOra', 'danna3448@gmail.com', null, '3', '767', null, 'jlLBPCam', null, null, null, '1', '1', '2021-04-08 02:16:29', '2021-04-08 02:16:29');
INSERT INTO `usuario` VALUES ('668', '1', 'andrea sanchez', 'asanchez', '$2y$10$UmgfzMT0DmsRUBFhrYKtc.GDsJXvkIu6wFpjePwBH8wPBXrHmiUsm', 'magdav420@gmail.com', null, '3', '768', null, 'KuCCdkzS', null, null, null, '1', '1', '2021-04-08 02:16:29', '2021-04-08 02:16:29');
INSERT INTO `usuario` VALUES ('669', '1', 'valentina sotomayor', 'vsotomayor', '$2y$10$rf6dYRM4HEfE7r46.uhGBenubwPmFYgtRhNovrtePSjHtIGA5YiL.', 'valentinaro675@gmail.com', null, '3', '769', null, 'bS4bSUWu', null, null, null, '1', '1', '2021-04-08 02:16:30', '2021-04-08 02:16:30');
INSERT INTO `usuario` VALUES ('670', '1', 'emily toledo', 'etoledo', '$2y$10$/xwQLsGLr4Aj0DZIgy5Va.5lSJahqT2Zp5bTAqbjl9WFLpjQQ7.1e', 'emily102507@hotmail.com', null, '3', '770', null, 'oOm0AQnb', null, null, null, '1', '1', '2021-04-08 02:16:31', '2021-04-08 02:16:31');
INSERT INTO `usuario` VALUES ('671', '1', 'yeiris tovar', 'ytovar', '$2y$10$nqRnQph9R5g.RTQwDAoZ3.jfqLElIxQseEfGhGzcRBU9sLnNLktfC', 'yeyantobb@gmail.com', null, '3', '771', null, 'Ujdthru2', null, null, null, '1', '1', '2021-04-08 02:16:31', '2021-04-08 02:16:31');
INSERT INTO `usuario` VALUES ('672', '1', 'valeria vesga', 'vvesga', '$2y$10$F1/Oiu14XRkFS0yPr2BIL.CagUU9YUrxFrFUwqlRSkOwCFdzMsTfG', 'valeriavesgafernandez19@gmail.', null, '3', '772', null, 'orSNK6Kn', null, null, null, '1', '1', '2021-04-08 02:16:32', '2021-04-08 02:16:32');
INSERT INTO `usuario` VALUES ('673', '1', 'wendy castillo', 'wkcastillo', '$2y$10$nquAez0LhdK3QCF8XD.rGeyEkmT5tg2o98kdFbWzfNDsUHi49rSVS', 'wendycastillo807@gmail.com', null, '3', '773', null, 'lbqhfQyw', null, null, null, '1', '1', '2021-04-08 02:16:32', '2021-04-08 02:16:32');
INSERT INTO `usuario` VALUES ('674', '1', 'paula sanchez', 'psanchez', '$2y$10$UOCCoOdwf.57XtFPVsZMHui4HULYz2gvHF3L/lKXgzCgDmXbKg.ga', 'sanmartinezfernandez@gmail.com', null, '3', '774', null, 'eV5VaY6W', null, null, null, '1', '1', '2021-04-08 02:16:33', '2021-04-08 02:16:33');
INSERT INTO `usuario` VALUES ('675', '1', 'valery ternera', 'vternera', '$2y$10$A/jiRIkMZ/mIK6zO.BNSC.4XlEoPcgC5rlxbtQ/8kQ3P8BaGhEAJ.', 'valeryternera28@gmial.com', null, '3', '775', null, 'ZdUzpKJy', null, null, null, '1', '1', '2021-04-08 02:16:33', '2021-04-08 02:16:33');
INSERT INTO `usuario` VALUES ('676', '1', 'marianadelosangeles suarez', 'msuarez', '$2y$10$Io/ljAdMZAZRr1o.U/sJveRoczg3G5rzV307IiLMRRX6d9va9KmHu', 'marianasuarez.30.mari@gmail.co', null, '3', '776', null, 'm5goReds', null, null, null, '1', '1', '2021-04-08 02:16:34', '2021-04-08 02:16:34');
INSERT INTO `usuario` VALUES ('677', '1', 'mariana guerrero', 'mguerrero', '$2y$10$.sHl7MSxL14r/Zb58VBMV.Ck7H8EIswwrkqwyU0hx5taVMuWLXI7u', 'mg3820192@gmail.com', null, '3', '777', null, 'FnQZnnYm', null, null, null, '1', '1', '2021-04-08 02:16:34', '2021-04-08 02:16:34');

-- ----------------------------
-- Table structure for usuario_perfil
-- ----------------------------
DROP TABLE IF EXISTS `usuario_perfil`;
CREATE TABLE `usuario_perfil` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) unsigned NOT NULL,
  `id_perfil` int(11) unsigned NOT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) unsigned NOT NULL,
  `id_usuario_ed` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_usuario_perfil_perfil` (`id_perfil`),
  KEY `fk_usuario_perfil_status` (`id_status`),
  KEY `fk_usuario_perfil_usuario_ed` (`id_usuario_ed`),
  CONSTRAINT `fk_usuario_perfil_perfil` FOREIGN KEY (`id_perfil`) REFERENCES `perfil` (`id`),
  CONSTRAINT `fk_usuario_perfil_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`),
  CONSTRAINT `fk_usuario_perfil_usuario_ed` FOREIGN KEY (`id_usuario_ed`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=679 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of usuario_perfil
-- ----------------------------
INSERT INTO `usuario_perfil` VALUES ('1', '1', '1', null, '1', '1', '2020-06-06 20:31:13', '2020-06-06 20:31:13');
INSERT INTO `usuario_perfil` VALUES ('2', '1', '2', null, '1', '1', '2020-06-06 20:31:23', '2020-06-06 20:31:23');
INSERT INTO `usuario_perfil` VALUES ('3', '1', '3', null, '1', '1', '2020-06-06 20:31:35', '2020-06-06 20:31:35');
INSERT INTO `usuario_perfil` VALUES ('5', '1', '4', null, '1', '1', '2020-07-24 18:15:27', '2020-07-24 18:15:27');
INSERT INTO `usuario_perfil` VALUES ('104', '3', '2', null, '1', '1', '2020-08-21 00:57:19', '2020-08-21 00:57:19');
INSERT INTO `usuario_perfil` VALUES ('206', '4', '5', null, '1', '1', '2020-08-21 01:48:32', '2020-08-21 01:48:32');
INSERT INTO `usuario_perfil` VALUES ('313', '5', '4', null, '1', '1', '2020-08-21 00:41:06', '2021-04-01 21:39:36');
INSERT INTO `usuario_perfil` VALUES ('331', '2', '3', null, '1', '1', '2021-04-07 12:34:38', '2021-04-07 12:34:42');
INSERT INTO `usuario_perfil` VALUES ('332', '325', '2', null, '1', '1', '2021-04-07 18:31:02', '2021-04-07 18:31:02');
INSERT INTO `usuario_perfil` VALUES ('400', '400', '3', null, '1', '1', '2021-04-08 02:13:30', '2021-04-08 02:13:30');
INSERT INTO `usuario_perfil` VALUES ('401', '401', '3', null, '1', '1', '2021-04-08 02:13:31', '2021-04-08 02:13:31');
INSERT INTO `usuario_perfil` VALUES ('402', '402', '3', null, '1', '1', '2021-04-08 02:13:32', '2021-04-08 02:13:32');
INSERT INTO `usuario_perfil` VALUES ('403', '403', '3', null, '1', '1', '2021-04-08 02:13:32', '2021-04-08 02:13:32');
INSERT INTO `usuario_perfil` VALUES ('404', '404', '3', null, '1', '1', '2021-04-08 02:13:32', '2021-04-08 02:13:32');
INSERT INTO `usuario_perfil` VALUES ('405', '405', '3', null, '1', '1', '2021-04-08 02:13:33', '2021-04-08 02:13:33');
INSERT INTO `usuario_perfil` VALUES ('406', '406', '3', null, '1', '1', '2021-04-08 02:13:33', '2021-04-08 02:13:33');
INSERT INTO `usuario_perfil` VALUES ('407', '407', '3', null, '1', '1', '2021-04-08 02:13:34', '2021-04-08 02:13:34');
INSERT INTO `usuario_perfil` VALUES ('408', '408', '3', null, '1', '1', '2021-04-08 02:13:34', '2021-04-08 02:13:34');
INSERT INTO `usuario_perfil` VALUES ('409', '409', '3', null, '1', '1', '2021-04-08 02:13:35', '2021-04-08 02:13:35');
INSERT INTO `usuario_perfil` VALUES ('410', '410', '3', null, '1', '1', '2021-04-08 02:13:35', '2021-04-08 02:13:35');
INSERT INTO `usuario_perfil` VALUES ('411', '411', '3', null, '1', '1', '2021-04-08 02:13:36', '2021-04-08 02:13:36');
INSERT INTO `usuario_perfil` VALUES ('412', '412', '3', null, '1', '1', '2021-04-08 02:13:36', '2021-04-08 02:13:36');
INSERT INTO `usuario_perfil` VALUES ('413', '413', '3', null, '1', '1', '2021-04-08 02:13:37', '2021-04-08 02:13:37');
INSERT INTO `usuario_perfil` VALUES ('414', '414', '3', null, '1', '1', '2021-04-08 02:13:37', '2021-04-08 02:13:37');
INSERT INTO `usuario_perfil` VALUES ('415', '415', '3', null, '1', '1', '2021-04-08 02:13:37', '2021-04-08 02:13:37');
INSERT INTO `usuario_perfil` VALUES ('416', '416', '3', null, '1', '1', '2021-04-08 02:13:38', '2021-04-08 02:13:38');
INSERT INTO `usuario_perfil` VALUES ('417', '417', '3', null, '1', '1', '2021-04-08 02:13:38', '2021-04-08 02:13:38');
INSERT INTO `usuario_perfil` VALUES ('418', '418', '3', null, '1', '1', '2021-04-08 02:13:39', '2021-04-08 02:13:39');
INSERT INTO `usuario_perfil` VALUES ('419', '419', '3', null, '1', '1', '2021-04-08 02:13:39', '2021-04-08 02:13:39');
INSERT INTO `usuario_perfil` VALUES ('420', '420', '3', null, '1', '1', '2021-04-08 02:13:40', '2021-04-08 02:13:40');
INSERT INTO `usuario_perfil` VALUES ('421', '421', '3', null, '1', '1', '2021-04-08 02:13:40', '2021-04-08 02:13:40');
INSERT INTO `usuario_perfil` VALUES ('422', '422', '3', null, '1', '1', '2021-04-08 02:13:41', '2021-04-08 02:13:41');
INSERT INTO `usuario_perfil` VALUES ('423', '423', '3', null, '1', '1', '2021-04-08 02:13:41', '2021-04-08 02:13:41');
INSERT INTO `usuario_perfil` VALUES ('424', '424', '3', null, '1', '1', '2021-04-08 02:13:42', '2021-04-08 02:13:42');
INSERT INTO `usuario_perfil` VALUES ('425', '425', '3', null, '1', '1', '2021-04-08 02:13:43', '2021-04-08 02:13:43');
INSERT INTO `usuario_perfil` VALUES ('426', '426', '3', null, '1', '1', '2021-04-08 02:13:43', '2021-04-08 02:13:43');
INSERT INTO `usuario_perfil` VALUES ('427', '427', '3', null, '1', '1', '2021-04-08 02:13:44', '2021-04-08 02:13:44');
INSERT INTO `usuario_perfil` VALUES ('428', '428', '3', null, '1', '1', '2021-04-08 02:13:44', '2021-04-08 02:13:44');
INSERT INTO `usuario_perfil` VALUES ('429', '429', '3', null, '1', '1', '2021-04-08 02:13:45', '2021-04-08 02:13:45');
INSERT INTO `usuario_perfil` VALUES ('430', '430', '3', null, '1', '1', '2021-04-08 02:13:45', '2021-04-08 02:13:45');
INSERT INTO `usuario_perfil` VALUES ('431', '431', '3', null, '1', '1', '2021-04-08 02:13:46', '2021-04-08 02:13:46');
INSERT INTO `usuario_perfil` VALUES ('432', '432', '3', null, '1', '1', '2021-04-08 02:13:46', '2021-04-08 02:13:46');
INSERT INTO `usuario_perfil` VALUES ('433', '433', '3', null, '1', '1', '2021-04-08 02:13:46', '2021-04-08 02:13:46');
INSERT INTO `usuario_perfil` VALUES ('434', '434', '3', null, '1', '1', '2021-04-08 02:13:47', '2021-04-08 02:13:47');
INSERT INTO `usuario_perfil` VALUES ('435', '435', '3', null, '1', '1', '2021-04-08 02:13:47', '2021-04-08 02:13:47');
INSERT INTO `usuario_perfil` VALUES ('436', '436', '3', null, '1', '1', '2021-04-08 02:13:48', '2021-04-08 02:13:48');
INSERT INTO `usuario_perfil` VALUES ('437', '437', '3', null, '1', '1', '2021-04-08 02:13:48', '2021-04-08 02:13:48');
INSERT INTO `usuario_perfil` VALUES ('438', '438', '3', null, '1', '1', '2021-04-08 02:13:49', '2021-04-08 02:13:49');
INSERT INTO `usuario_perfil` VALUES ('439', '439', '3', null, '1', '1', '2021-04-08 02:13:49', '2021-04-08 02:13:49');
INSERT INTO `usuario_perfil` VALUES ('440', '440', '3', null, '1', '1', '2021-04-08 02:13:50', '2021-04-08 02:13:50');
INSERT INTO `usuario_perfil` VALUES ('441', '441', '3', null, '1', '1', '2021-04-08 02:13:50', '2021-04-08 02:13:50');
INSERT INTO `usuario_perfil` VALUES ('442', '442', '3', null, '1', '1', '2021-04-08 02:13:50', '2021-04-08 02:13:50');
INSERT INTO `usuario_perfil` VALUES ('443', '443', '3', null, '1', '1', '2021-04-08 02:13:51', '2021-04-08 02:13:51');
INSERT INTO `usuario_perfil` VALUES ('444', '444', '3', null, '1', '1', '2021-04-08 02:13:51', '2021-04-08 02:13:51');
INSERT INTO `usuario_perfil` VALUES ('445', '445', '3', null, '1', '1', '2021-04-08 02:13:52', '2021-04-08 02:13:52');
INSERT INTO `usuario_perfil` VALUES ('446', '446', '3', null, '1', '1', '2021-04-08 02:13:52', '2021-04-08 02:13:52');
INSERT INTO `usuario_perfil` VALUES ('447', '447', '3', null, '1', '1', '2021-04-08 02:13:53', '2021-04-08 02:13:53');
INSERT INTO `usuario_perfil` VALUES ('448', '448', '3', null, '1', '1', '2021-04-08 02:13:53', '2021-04-08 02:13:53');
INSERT INTO `usuario_perfil` VALUES ('449', '449', '3', null, '1', '1', '2021-04-08 02:13:54', '2021-04-08 02:13:54');
INSERT INTO `usuario_perfil` VALUES ('450', '450', '3', null, '1', '1', '2021-04-08 02:13:54', '2021-04-08 02:13:54');
INSERT INTO `usuario_perfil` VALUES ('451', '451', '3', null, '1', '1', '2021-04-08 02:13:54', '2021-04-08 02:13:54');
INSERT INTO `usuario_perfil` VALUES ('452', '452', '3', null, '1', '1', '2021-04-08 02:13:55', '2021-04-08 02:13:55');
INSERT INTO `usuario_perfil` VALUES ('453', '453', '3', null, '1', '1', '2021-04-08 02:13:56', '2021-04-08 02:13:56');
INSERT INTO `usuario_perfil` VALUES ('454', '454', '3', null, '1', '1', '2021-04-08 02:13:56', '2021-04-08 02:13:56');
INSERT INTO `usuario_perfil` VALUES ('455', '455', '3', null, '1', '1', '2021-04-08 02:13:57', '2021-04-08 02:13:57');
INSERT INTO `usuario_perfil` VALUES ('456', '456', '3', null, '1', '1', '2021-04-08 02:13:57', '2021-04-08 02:13:57');
INSERT INTO `usuario_perfil` VALUES ('457', '457', '3', null, '1', '1', '2021-04-08 02:13:58', '2021-04-08 02:13:58');
INSERT INTO `usuario_perfil` VALUES ('458', '458', '3', null, '1', '1', '2021-04-08 02:13:58', '2021-04-08 02:13:58');
INSERT INTO `usuario_perfil` VALUES ('459', '459', '3', null, '1', '1', '2021-04-08 02:13:59', '2021-04-08 02:13:59');
INSERT INTO `usuario_perfil` VALUES ('460', '460', '3', null, '1', '1', '2021-04-08 02:13:59', '2021-04-08 02:13:59');
INSERT INTO `usuario_perfil` VALUES ('461', '461', '3', null, '1', '1', '2021-04-08 02:14:00', '2021-04-08 02:14:00');
INSERT INTO `usuario_perfil` VALUES ('462', '462', '3', null, '1', '1', '2021-04-08 02:14:00', '2021-04-08 02:14:00');
INSERT INTO `usuario_perfil` VALUES ('463', '463', '3', null, '1', '1', '2021-04-08 02:14:01', '2021-04-08 02:14:01');
INSERT INTO `usuario_perfil` VALUES ('464', '464', '3', null, '1', '1', '2021-04-08 02:14:01', '2021-04-08 02:14:01');
INSERT INTO `usuario_perfil` VALUES ('465', '465', '3', null, '1', '1', '2021-04-08 02:14:02', '2021-04-08 02:14:02');
INSERT INTO `usuario_perfil` VALUES ('466', '466', '3', null, '1', '1', '2021-04-08 02:14:02', '2021-04-08 02:14:02');
INSERT INTO `usuario_perfil` VALUES ('467', '467', '3', null, '1', '1', '2021-04-08 02:14:03', '2021-04-08 02:14:03');
INSERT INTO `usuario_perfil` VALUES ('468', '468', '3', null, '1', '1', '2021-04-08 02:14:04', '2021-04-08 02:14:04');
INSERT INTO `usuario_perfil` VALUES ('469', '469', '3', null, '1', '1', '2021-04-08 02:14:04', '2021-04-08 02:14:04');
INSERT INTO `usuario_perfil` VALUES ('470', '470', '3', null, '1', '1', '2021-04-08 02:14:05', '2021-04-08 02:14:05');
INSERT INTO `usuario_perfil` VALUES ('471', '471', '3', null, '1', '1', '2021-04-08 02:14:05', '2021-04-08 02:14:05');
INSERT INTO `usuario_perfil` VALUES ('472', '472', '3', null, '1', '1', '2021-04-08 02:14:06', '2021-04-08 02:14:06');
INSERT INTO `usuario_perfil` VALUES ('473', '473', '3', null, '1', '1', '2021-04-08 02:14:06', '2021-04-08 02:14:06');
INSERT INTO `usuario_perfil` VALUES ('474', '474', '3', null, '1', '1', '2021-04-08 02:14:07', '2021-04-08 02:14:07');
INSERT INTO `usuario_perfil` VALUES ('475', '475', '3', null, '1', '1', '2021-04-08 02:14:07', '2021-04-08 02:14:07');
INSERT INTO `usuario_perfil` VALUES ('476', '476', '3', null, '1', '1', '2021-04-08 02:14:08', '2021-04-08 02:14:08');
INSERT INTO `usuario_perfil` VALUES ('477', '477', '3', null, '1', '1', '2021-04-08 02:14:08', '2021-04-08 02:14:08');
INSERT INTO `usuario_perfil` VALUES ('478', '478', '3', null, '1', '1', '2021-04-08 02:14:09', '2021-04-08 02:14:09');
INSERT INTO `usuario_perfil` VALUES ('479', '479', '3', null, '1', '1', '2021-04-08 02:14:09', '2021-04-08 02:14:09');
INSERT INTO `usuario_perfil` VALUES ('480', '480', '3', null, '1', '1', '2021-04-08 02:14:10', '2021-04-08 02:14:10');
INSERT INTO `usuario_perfil` VALUES ('481', '481', '3', null, '1', '1', '2021-04-08 02:14:10', '2021-04-08 02:14:10');
INSERT INTO `usuario_perfil` VALUES ('482', '482', '3', null, '1', '1', '2021-04-08 02:14:11', '2021-04-08 02:14:11');
INSERT INTO `usuario_perfil` VALUES ('483', '483', '3', null, '1', '1', '2021-04-08 02:14:11', '2021-04-08 02:14:11');
INSERT INTO `usuario_perfil` VALUES ('484', '484', '3', null, '1', '1', '2021-04-08 02:14:12', '2021-04-08 02:14:12');
INSERT INTO `usuario_perfil` VALUES ('485', '485', '3', null, '1', '1', '2021-04-08 02:14:13', '2021-04-08 02:14:13');
INSERT INTO `usuario_perfil` VALUES ('486', '486', '3', null, '1', '1', '2021-04-08 02:14:13', '2021-04-08 02:14:13');
INSERT INTO `usuario_perfil` VALUES ('487', '487', '3', null, '1', '1', '2021-04-08 02:14:14', '2021-04-08 02:14:14');
INSERT INTO `usuario_perfil` VALUES ('488', '488', '3', null, '1', '1', '2021-04-08 02:14:14', '2021-04-08 02:14:14');
INSERT INTO `usuario_perfil` VALUES ('489', '489', '3', null, '1', '1', '2021-04-08 02:14:15', '2021-04-08 02:14:15');
INSERT INTO `usuario_perfil` VALUES ('490', '490', '3', null, '1', '1', '2021-04-08 02:14:16', '2021-04-08 02:14:16');
INSERT INTO `usuario_perfil` VALUES ('491', '491', '3', null, '1', '1', '2021-04-08 02:14:16', '2021-04-08 02:14:16');
INSERT INTO `usuario_perfil` VALUES ('492', '492', '3', null, '1', '1', '2021-04-08 02:14:17', '2021-04-08 02:14:17');
INSERT INTO `usuario_perfil` VALUES ('493', '493', '3', null, '1', '1', '2021-04-08 02:14:17', '2021-04-08 02:14:17');
INSERT INTO `usuario_perfil` VALUES ('494', '494', '3', null, '1', '1', '2021-04-08 02:14:18', '2021-04-08 02:14:18');
INSERT INTO `usuario_perfil` VALUES ('495', '495', '3', null, '1', '1', '2021-04-08 02:14:18', '2021-04-08 02:14:18');
INSERT INTO `usuario_perfil` VALUES ('496', '496', '3', null, '1', '1', '2021-04-08 02:14:19', '2021-04-08 02:14:19');
INSERT INTO `usuario_perfil` VALUES ('497', '497', '3', null, '1', '1', '2021-04-08 02:14:19', '2021-04-08 02:14:19');
INSERT INTO `usuario_perfil` VALUES ('498', '498', '3', null, '1', '1', '2021-04-08 02:14:20', '2021-04-08 02:14:20');
INSERT INTO `usuario_perfil` VALUES ('499', '499', '3', null, '1', '1', '2021-04-08 02:14:20', '2021-04-08 02:14:20');
INSERT INTO `usuario_perfil` VALUES ('500', '500', '3', null, '1', '1', '2021-04-08 02:14:21', '2021-04-08 02:14:21');
INSERT INTO `usuario_perfil` VALUES ('501', '501', '3', null, '1', '1', '2021-04-08 02:14:21', '2021-04-08 02:14:21');
INSERT INTO `usuario_perfil` VALUES ('502', '502', '3', null, '1', '1', '2021-04-08 02:14:22', '2021-04-08 02:14:22');
INSERT INTO `usuario_perfil` VALUES ('503', '503', '3', null, '1', '1', '2021-04-08 02:14:22', '2021-04-08 02:14:22');
INSERT INTO `usuario_perfil` VALUES ('504', '504', '3', null, '1', '1', '2021-04-08 02:14:23', '2021-04-08 02:14:23');
INSERT INTO `usuario_perfil` VALUES ('505', '505', '3', null, '1', '1', '2021-04-08 02:14:23', '2021-04-08 02:14:23');
INSERT INTO `usuario_perfil` VALUES ('506', '506', '3', null, '1', '1', '2021-04-08 02:14:24', '2021-04-08 02:14:24');
INSERT INTO `usuario_perfil` VALUES ('507', '507', '3', null, '1', '1', '2021-04-08 02:14:24', '2021-04-08 02:14:24');
INSERT INTO `usuario_perfil` VALUES ('508', '508', '3', null, '1', '1', '2021-04-08 02:14:25', '2021-04-08 02:14:25');
INSERT INTO `usuario_perfil` VALUES ('509', '509', '3', null, '1', '1', '2021-04-08 02:14:25', '2021-04-08 02:14:25');
INSERT INTO `usuario_perfil` VALUES ('510', '510', '3', null, '1', '1', '2021-04-08 02:14:26', '2021-04-08 02:14:26');
INSERT INTO `usuario_perfil` VALUES ('511', '511', '3', null, '1', '1', '2021-04-08 02:14:26', '2021-04-08 02:14:26');
INSERT INTO `usuario_perfil` VALUES ('512', '512', '3', null, '1', '1', '2021-04-08 02:14:27', '2021-04-08 02:14:27');
INSERT INTO `usuario_perfil` VALUES ('513', '513', '3', null, '1', '1', '2021-04-08 02:14:28', '2021-04-08 02:14:28');
INSERT INTO `usuario_perfil` VALUES ('514', '514', '3', null, '1', '1', '2021-04-08 02:14:28', '2021-04-08 02:14:28');
INSERT INTO `usuario_perfil` VALUES ('515', '515', '3', null, '1', '1', '2021-04-08 02:14:50', '2021-04-08 02:14:50');
INSERT INTO `usuario_perfil` VALUES ('516', '516', '3', null, '1', '1', '2021-04-08 02:14:50', '2021-04-08 02:14:50');
INSERT INTO `usuario_perfil` VALUES ('517', '517', '3', null, '1', '1', '2021-04-08 02:14:51', '2021-04-08 02:14:51');
INSERT INTO `usuario_perfil` VALUES ('518', '518', '3', null, '1', '1', '2021-04-08 02:14:51', '2021-04-08 02:14:51');
INSERT INTO `usuario_perfil` VALUES ('519', '519', '3', null, '1', '1', '2021-04-08 02:14:52', '2021-04-08 02:14:52');
INSERT INTO `usuario_perfil` VALUES ('520', '520', '3', null, '1', '1', '2021-04-08 02:14:52', '2021-04-08 02:14:52');
INSERT INTO `usuario_perfil` VALUES ('521', '521', '3', null, '1', '1', '2021-04-08 02:14:53', '2021-04-08 02:14:53');
INSERT INTO `usuario_perfil` VALUES ('522', '522', '3', null, '1', '1', '2021-04-08 02:14:53', '2021-04-08 02:14:53');
INSERT INTO `usuario_perfil` VALUES ('523', '523', '3', null, '1', '1', '2021-04-08 02:14:54', '2021-04-08 02:14:54');
INSERT INTO `usuario_perfil` VALUES ('524', '524', '3', null, '1', '1', '2021-04-08 02:14:54', '2021-04-08 02:14:54');
INSERT INTO `usuario_perfil` VALUES ('525', '525', '3', null, '1', '1', '2021-04-08 02:14:55', '2021-04-08 02:14:55');
INSERT INTO `usuario_perfil` VALUES ('526', '526', '3', null, '1', '1', '2021-04-08 02:14:55', '2021-04-08 02:14:55');
INSERT INTO `usuario_perfil` VALUES ('527', '527', '3', null, '1', '1', '2021-04-08 02:14:56', '2021-04-08 02:14:56');
INSERT INTO `usuario_perfil` VALUES ('528', '528', '3', null, '1', '1', '2021-04-08 02:14:56', '2021-04-08 02:14:56');
INSERT INTO `usuario_perfil` VALUES ('529', '529', '3', null, '1', '1', '2021-04-08 02:14:57', '2021-04-08 02:14:57');
INSERT INTO `usuario_perfil` VALUES ('530', '530', '3', null, '1', '1', '2021-04-08 02:14:57', '2021-04-08 02:14:57');
INSERT INTO `usuario_perfil` VALUES ('531', '531', '3', null, '1', '1', '2021-04-08 02:14:58', '2021-04-08 02:14:58');
INSERT INTO `usuario_perfil` VALUES ('532', '532', '3', null, '1', '1', '2021-04-08 02:14:58', '2021-04-08 02:14:58');
INSERT INTO `usuario_perfil` VALUES ('533', '533', '3', null, '1', '1', '2021-04-08 02:14:59', '2021-04-08 02:14:59');
INSERT INTO `usuario_perfil` VALUES ('534', '534', '3', null, '1', '1', '2021-04-08 02:15:00', '2021-04-08 02:15:00');
INSERT INTO `usuario_perfil` VALUES ('535', '535', '3', null, '1', '1', '2021-04-08 02:15:00', '2021-04-08 02:15:00');
INSERT INTO `usuario_perfil` VALUES ('536', '536', '3', null, '1', '1', '2021-04-08 02:15:00', '2021-04-08 02:15:00');
INSERT INTO `usuario_perfil` VALUES ('537', '537', '3', null, '1', '1', '2021-04-08 02:15:01', '2021-04-08 02:15:01');
INSERT INTO `usuario_perfil` VALUES ('538', '538', '3', null, '1', '1', '2021-04-08 02:15:02', '2021-04-08 02:15:02');
INSERT INTO `usuario_perfil` VALUES ('539', '539', '3', null, '1', '1', '2021-04-08 02:15:02', '2021-04-08 02:15:02');
INSERT INTO `usuario_perfil` VALUES ('540', '540', '3', null, '1', '1', '2021-04-08 02:15:03', '2021-04-08 02:15:03');
INSERT INTO `usuario_perfil` VALUES ('541', '541', '3', null, '1', '1', '2021-04-08 02:15:03', '2021-04-08 02:15:03');
INSERT INTO `usuario_perfil` VALUES ('542', '542', '3', null, '1', '1', '2021-04-08 02:15:04', '2021-04-08 02:15:04');
INSERT INTO `usuario_perfil` VALUES ('543', '543', '3', null, '1', '1', '2021-04-08 02:15:04', '2021-04-08 02:15:04');
INSERT INTO `usuario_perfil` VALUES ('544', '544', '3', null, '1', '1', '2021-04-08 02:15:05', '2021-04-08 02:15:05');
INSERT INTO `usuario_perfil` VALUES ('545', '545', '3', null, '1', '1', '2021-04-08 02:15:05', '2021-04-08 02:15:05');
INSERT INTO `usuario_perfil` VALUES ('546', '546', '3', null, '1', '1', '2021-04-08 02:15:06', '2021-04-08 02:15:06');
INSERT INTO `usuario_perfil` VALUES ('547', '547', '3', null, '1', '1', '2021-04-08 02:15:06', '2021-04-08 02:15:06');
INSERT INTO `usuario_perfil` VALUES ('548', '548', '3', null, '1', '1', '2021-04-08 02:15:07', '2021-04-08 02:15:07');
INSERT INTO `usuario_perfil` VALUES ('549', '549', '3', null, '1', '1', '2021-04-08 02:15:07', '2021-04-08 02:15:07');
INSERT INTO `usuario_perfil` VALUES ('550', '550', '3', null, '1', '1', '2021-04-08 02:15:08', '2021-04-08 02:15:08');
INSERT INTO `usuario_perfil` VALUES ('551', '551', '3', null, '1', '1', '2021-04-08 02:15:09', '2021-04-08 02:15:09');
INSERT INTO `usuario_perfil` VALUES ('552', '552', '3', null, '1', '1', '2021-04-08 02:15:09', '2021-04-08 02:15:09');
INSERT INTO `usuario_perfil` VALUES ('553', '553', '3', null, '1', '1', '2021-04-08 02:15:10', '2021-04-08 02:15:10');
INSERT INTO `usuario_perfil` VALUES ('554', '554', '3', null, '1', '1', '2021-04-08 02:15:10', '2021-04-08 02:15:10');
INSERT INTO `usuario_perfil` VALUES ('555', '555', '3', null, '1', '1', '2021-04-08 02:15:11', '2021-04-08 02:15:11');
INSERT INTO `usuario_perfil` VALUES ('556', '556', '3', null, '1', '1', '2021-04-08 02:15:11', '2021-04-08 02:15:11');
INSERT INTO `usuario_perfil` VALUES ('557', '557', '3', null, '1', '1', '2021-04-08 02:15:12', '2021-04-08 02:15:12');
INSERT INTO `usuario_perfil` VALUES ('558', '558', '3', null, '1', '1', '2021-04-08 02:15:12', '2021-04-08 02:15:12');
INSERT INTO `usuario_perfil` VALUES ('559', '559', '3', null, '1', '1', '2021-04-08 02:15:13', '2021-04-08 02:15:13');
INSERT INTO `usuario_perfil` VALUES ('560', '560', '3', null, '1', '1', '2021-04-08 02:15:13', '2021-04-08 02:15:13');
INSERT INTO `usuario_perfil` VALUES ('561', '561', '3', null, '1', '1', '2021-04-08 02:15:13', '2021-04-08 02:15:13');
INSERT INTO `usuario_perfil` VALUES ('562', '562', '3', null, '1', '1', '2021-04-08 02:15:14', '2021-04-08 02:15:14');
INSERT INTO `usuario_perfil` VALUES ('563', '563', '3', null, '1', '1', '2021-04-08 02:15:14', '2021-04-08 02:15:14');
INSERT INTO `usuario_perfil` VALUES ('564', '564', '3', null, '1', '1', '2021-04-08 02:15:15', '2021-04-08 02:15:15');
INSERT INTO `usuario_perfil` VALUES ('565', '565', '3', null, '1', '1', '2021-04-08 02:15:15', '2021-04-08 02:15:15');
INSERT INTO `usuario_perfil` VALUES ('566', '566', '3', null, '1', '1', '2021-04-08 02:15:16', '2021-04-08 02:15:16');
INSERT INTO `usuario_perfil` VALUES ('567', '567', '3', null, '1', '1', '2021-04-08 02:15:16', '2021-04-08 02:15:16');
INSERT INTO `usuario_perfil` VALUES ('568', '568', '3', null, '1', '1', '2021-04-08 02:15:17', '2021-04-08 02:15:17');
INSERT INTO `usuario_perfil` VALUES ('569', '569', '3', null, '1', '1', '2021-04-08 02:15:18', '2021-04-08 02:15:18');
INSERT INTO `usuario_perfil` VALUES ('570', '570', '3', null, '1', '1', '2021-04-08 02:15:18', '2021-04-08 02:15:18');
INSERT INTO `usuario_perfil` VALUES ('571', '571', '3', null, '1', '1', '2021-04-08 02:15:19', '2021-04-08 02:15:19');
INSERT INTO `usuario_perfil` VALUES ('572', '572', '3', null, '1', '1', '2021-04-08 02:15:19', '2021-04-08 02:15:19');
INSERT INTO `usuario_perfil` VALUES ('573', '573', '3', null, '1', '1', '2021-04-08 02:15:20', '2021-04-08 02:15:20');
INSERT INTO `usuario_perfil` VALUES ('574', '574', '3', null, '1', '1', '2021-04-08 02:15:20', '2021-04-08 02:15:20');
INSERT INTO `usuario_perfil` VALUES ('575', '575', '3', null, '1', '1', '2021-04-08 02:15:21', '2021-04-08 02:15:21');
INSERT INTO `usuario_perfil` VALUES ('576', '576', '3', null, '1', '1', '2021-04-08 02:15:21', '2021-04-08 02:15:21');
INSERT INTO `usuario_perfil` VALUES ('577', '577', '3', null, '1', '1', '2021-04-08 02:15:22', '2021-04-08 02:15:22');
INSERT INTO `usuario_perfil` VALUES ('578', '578', '3', null, '1', '1', '2021-04-08 02:15:22', '2021-04-08 02:15:22');
INSERT INTO `usuario_perfil` VALUES ('579', '579', '3', null, '1', '1', '2021-04-08 02:15:23', '2021-04-08 02:15:23');
INSERT INTO `usuario_perfil` VALUES ('580', '580', '3', null, '1', '1', '2021-04-08 02:15:24', '2021-04-08 02:15:24');
INSERT INTO `usuario_perfil` VALUES ('581', '581', '3', null, '1', '1', '2021-04-08 02:15:24', '2021-04-08 02:15:24');
INSERT INTO `usuario_perfil` VALUES ('582', '582', '3', null, '1', '1', '2021-04-08 02:15:25', '2021-04-08 02:15:25');
INSERT INTO `usuario_perfil` VALUES ('583', '583', '3', null, '1', '1', '2021-04-08 02:15:26', '2021-04-08 02:15:26');
INSERT INTO `usuario_perfil` VALUES ('584', '584', '3', null, '1', '1', '2021-04-08 02:15:26', '2021-04-08 02:15:26');
INSERT INTO `usuario_perfil` VALUES ('585', '585', '3', null, '1', '1', '2021-04-08 02:15:27', '2021-04-08 02:15:27');
INSERT INTO `usuario_perfil` VALUES ('586', '586', '3', null, '1', '1', '2021-04-08 02:15:27', '2021-04-08 02:15:27');
INSERT INTO `usuario_perfil` VALUES ('587', '587', '3', null, '1', '1', '2021-04-08 02:15:28', '2021-04-08 02:15:28');
INSERT INTO `usuario_perfil` VALUES ('588', '588', '3', null, '1', '1', '2021-04-08 02:15:28', '2021-04-08 02:15:28');
INSERT INTO `usuario_perfil` VALUES ('589', '589', '3', null, '1', '1', '2021-04-08 02:15:29', '2021-04-08 02:15:29');
INSERT INTO `usuario_perfil` VALUES ('590', '590', '3', null, '1', '1', '2021-04-08 02:15:29', '2021-04-08 02:15:29');
INSERT INTO `usuario_perfil` VALUES ('591', '591', '3', null, '1', '1', '2021-04-08 02:15:30', '2021-04-08 02:15:30');
INSERT INTO `usuario_perfil` VALUES ('592', '592', '3', null, '1', '1', '2021-04-08 02:15:30', '2021-04-08 02:15:30');
INSERT INTO `usuario_perfil` VALUES ('593', '593', '3', null, '1', '1', '2021-04-08 02:15:31', '2021-04-08 02:15:31');
INSERT INTO `usuario_perfil` VALUES ('594', '594', '3', null, '1', '1', '2021-04-08 02:15:31', '2021-04-08 02:15:31');
INSERT INTO `usuario_perfil` VALUES ('595', '595', '3', null, '1', '1', '2021-04-08 02:15:32', '2021-04-08 02:15:32');
INSERT INTO `usuario_perfil` VALUES ('596', '596', '3', null, '1', '1', '2021-04-08 02:15:32', '2021-04-08 02:15:32');
INSERT INTO `usuario_perfil` VALUES ('597', '597', '3', null, '1', '1', '2021-04-08 02:15:33', '2021-04-08 02:15:33');
INSERT INTO `usuario_perfil` VALUES ('598', '598', '3', null, '1', '1', '2021-04-08 02:15:33', '2021-04-08 02:15:33');
INSERT INTO `usuario_perfil` VALUES ('599', '599', '3', null, '1', '1', '2021-04-08 02:15:34', '2021-04-08 02:15:34');
INSERT INTO `usuario_perfil` VALUES ('600', '600', '3', null, '1', '1', '2021-04-08 02:15:35', '2021-04-08 02:15:35');
INSERT INTO `usuario_perfil` VALUES ('601', '601', '3', null, '1', '1', '2021-04-08 02:15:35', '2021-04-08 02:15:35');
INSERT INTO `usuario_perfil` VALUES ('602', '602', '3', null, '1', '1', '2021-04-08 02:15:36', '2021-04-08 02:15:36');
INSERT INTO `usuario_perfil` VALUES ('603', '603', '3', null, '1', '1', '2021-04-08 02:15:36', '2021-04-08 02:15:36');
INSERT INTO `usuario_perfil` VALUES ('604', '604', '3', null, '1', '1', '2021-04-08 02:15:37', '2021-04-08 02:15:37');
INSERT INTO `usuario_perfil` VALUES ('605', '605', '3', null, '1', '1', '2021-04-08 02:15:37', '2021-04-08 02:15:37');
INSERT INTO `usuario_perfil` VALUES ('606', '606', '3', null, '1', '1', '2021-04-08 02:15:38', '2021-04-08 02:15:38');
INSERT INTO `usuario_perfil` VALUES ('607', '607', '3', null, '1', '1', '2021-04-08 02:15:38', '2021-04-08 02:15:38');
INSERT INTO `usuario_perfil` VALUES ('608', '608', '3', null, '1', '1', '2021-04-08 02:15:39', '2021-04-08 02:15:39');
INSERT INTO `usuario_perfil` VALUES ('609', '609', '3', null, '1', '1', '2021-04-08 02:15:39', '2021-04-08 02:15:39');
INSERT INTO `usuario_perfil` VALUES ('610', '610', '3', null, '1', '1', '2021-04-08 02:15:40', '2021-04-08 02:15:40');
INSERT INTO `usuario_perfil` VALUES ('611', '611', '3', null, '1', '1', '2021-04-08 02:15:40', '2021-04-08 02:15:40');
INSERT INTO `usuario_perfil` VALUES ('612', '612', '3', null, '1', '1', '2021-04-08 02:15:41', '2021-04-08 02:15:41');
INSERT INTO `usuario_perfil` VALUES ('613', '613', '3', null, '1', '1', '2021-04-08 02:15:41', '2021-04-08 02:15:41');
INSERT INTO `usuario_perfil` VALUES ('614', '614', '3', null, '1', '1', '2021-04-08 02:15:42', '2021-04-08 02:15:42');
INSERT INTO `usuario_perfil` VALUES ('615', '615', '3', null, '1', '1', '2021-04-08 02:15:43', '2021-04-08 02:15:43');
INSERT INTO `usuario_perfil` VALUES ('616', '616', '3', null, '1', '1', '2021-04-08 02:15:43', '2021-04-08 02:15:43');
INSERT INTO `usuario_perfil` VALUES ('617', '617', '3', null, '1', '1', '2021-04-08 02:15:44', '2021-04-08 02:15:44');
INSERT INTO `usuario_perfil` VALUES ('618', '618', '3', null, '1', '1', '2021-04-08 02:15:44', '2021-04-08 02:15:44');
INSERT INTO `usuario_perfil` VALUES ('619', '619', '3', null, '1', '1', '2021-04-08 02:15:45', '2021-04-08 02:15:45');
INSERT INTO `usuario_perfil` VALUES ('620', '620', '3', null, '1', '1', '2021-04-08 02:15:45', '2021-04-08 02:15:45');
INSERT INTO `usuario_perfil` VALUES ('621', '621', '3', null, '1', '1', '2021-04-08 02:15:46', '2021-04-08 02:15:46');
INSERT INTO `usuario_perfil` VALUES ('622', '622', '3', null, '1', '1', '2021-04-08 02:15:46', '2021-04-08 02:15:46');
INSERT INTO `usuario_perfil` VALUES ('623', '623', '3', null, '1', '1', '2021-04-08 02:15:47', '2021-04-08 02:15:47');
INSERT INTO `usuario_perfil` VALUES ('624', '624', '3', null, '1', '1', '2021-04-08 02:15:47', '2021-04-08 02:15:47');
INSERT INTO `usuario_perfil` VALUES ('625', '625', '3', null, '1', '1', '2021-04-08 02:15:48', '2021-04-08 02:15:48');
INSERT INTO `usuario_perfil` VALUES ('626', '627', '3', null, '1', '1', '2021-04-08 02:16:07', '2021-04-08 02:16:07');
INSERT INTO `usuario_perfil` VALUES ('627', '628', '3', null, '1', '1', '2021-04-08 02:16:08', '2021-04-08 02:16:08');
INSERT INTO `usuario_perfil` VALUES ('628', '629', '3', null, '1', '1', '2021-04-08 02:16:08', '2021-04-08 02:16:08');
INSERT INTO `usuario_perfil` VALUES ('629', '630', '3', null, '1', '1', '2021-04-08 02:16:09', '2021-04-08 02:16:09');
INSERT INTO `usuario_perfil` VALUES ('630', '631', '3', null, '1', '1', '2021-04-08 02:16:10', '2021-04-08 02:16:10');
INSERT INTO `usuario_perfil` VALUES ('631', '632', '3', null, '1', '1', '2021-04-08 02:16:10', '2021-04-08 02:16:10');
INSERT INTO `usuario_perfil` VALUES ('632', '633', '3', null, '1', '1', '2021-04-08 02:16:11', '2021-04-08 02:16:11');
INSERT INTO `usuario_perfil` VALUES ('633', '634', '3', null, '1', '1', '2021-04-08 02:16:11', '2021-04-08 02:16:11');
INSERT INTO `usuario_perfil` VALUES ('634', '635', '3', null, '1', '1', '2021-04-08 02:16:12', '2021-04-08 02:16:12');
INSERT INTO `usuario_perfil` VALUES ('635', '636', '3', null, '1', '1', '2021-04-08 02:16:12', '2021-04-08 02:16:12');
INSERT INTO `usuario_perfil` VALUES ('636', '637', '3', null, '1', '1', '2021-04-08 02:16:13', '2021-04-08 02:16:13');
INSERT INTO `usuario_perfil` VALUES ('637', '638', '3', null, '1', '1', '2021-04-08 02:16:14', '2021-04-08 02:16:14');
INSERT INTO `usuario_perfil` VALUES ('638', '639', '3', null, '1', '1', '2021-04-08 02:16:14', '2021-04-08 02:16:14');
INSERT INTO `usuario_perfil` VALUES ('639', '640', '3', null, '1', '1', '2021-04-08 02:16:14', '2021-04-08 02:16:14');
INSERT INTO `usuario_perfil` VALUES ('640', '641', '3', null, '1', '1', '2021-04-08 02:16:15', '2021-04-08 02:16:15');
INSERT INTO `usuario_perfil` VALUES ('641', '642', '3', null, '1', '1', '2021-04-08 02:16:16', '2021-04-08 02:16:16');
INSERT INTO `usuario_perfil` VALUES ('642', '643', '3', null, '1', '1', '2021-04-08 02:16:16', '2021-04-08 02:16:16');
INSERT INTO `usuario_perfil` VALUES ('643', '644', '3', null, '1', '1', '2021-04-08 02:16:17', '2021-04-08 02:16:17');
INSERT INTO `usuario_perfil` VALUES ('644', '645', '3', null, '1', '1', '2021-04-08 02:16:18', '2021-04-08 02:16:18');
INSERT INTO `usuario_perfil` VALUES ('645', '646', '3', null, '1', '1', '2021-04-08 02:16:18', '2021-04-08 02:16:18');
INSERT INTO `usuario_perfil` VALUES ('646', '647', '3', null, '1', '1', '2021-04-08 02:16:19', '2021-04-08 02:16:19');
INSERT INTO `usuario_perfil` VALUES ('647', '648', '3', null, '1', '1', '2021-04-08 02:16:19', '2021-04-08 02:16:19');
INSERT INTO `usuario_perfil` VALUES ('648', '649', '3', null, '1', '1', '2021-04-08 02:16:20', '2021-04-08 02:16:20');
INSERT INTO `usuario_perfil` VALUES ('649', '650', '3', null, '1', '1', '2021-04-08 02:16:21', '2021-04-08 02:16:21');
INSERT INTO `usuario_perfil` VALUES ('650', '651', '3', null, '1', '1', '2021-04-08 02:16:21', '2021-04-08 02:16:21');
INSERT INTO `usuario_perfil` VALUES ('651', '652', '3', null, '1', '1', '2021-04-08 02:16:21', '2021-04-08 02:16:21');
INSERT INTO `usuario_perfil` VALUES ('652', '653', '3', null, '1', '1', '2021-04-08 02:16:22', '2021-04-08 02:16:22');
INSERT INTO `usuario_perfil` VALUES ('653', '654', '3', null, '1', '1', '2021-04-08 02:16:22', '2021-04-08 02:16:22');
INSERT INTO `usuario_perfil` VALUES ('654', '655', '3', null, '1', '1', '2021-04-08 02:16:23', '2021-04-08 02:16:23');
INSERT INTO `usuario_perfil` VALUES ('655', '656', '3', null, '1', '1', '2021-04-08 02:16:23', '2021-04-08 02:16:23');
INSERT INTO `usuario_perfil` VALUES ('656', '657', '3', null, '1', '1', '2021-04-08 02:16:24', '2021-04-08 02:16:24');
INSERT INTO `usuario_perfil` VALUES ('657', '658', '3', null, '1', '1', '2021-04-08 02:16:24', '2021-04-08 02:16:24');
INSERT INTO `usuario_perfil` VALUES ('658', '659', '3', null, '1', '1', '2021-04-08 02:16:25', '2021-04-08 02:16:25');
INSERT INTO `usuario_perfil` VALUES ('659', '660', '3', null, '1', '1', '2021-04-08 02:16:25', '2021-04-08 02:16:25');
INSERT INTO `usuario_perfil` VALUES ('660', '661', '3', null, '1', '1', '2021-04-08 02:16:26', '2021-04-08 02:16:26');
INSERT INTO `usuario_perfil` VALUES ('661', '662', '3', null, '1', '1', '2021-04-08 02:16:27', '2021-04-08 02:16:27');
INSERT INTO `usuario_perfil` VALUES ('662', '663', '3', null, '1', '1', '2021-04-08 02:16:27', '2021-04-08 02:16:27');
INSERT INTO `usuario_perfil` VALUES ('663', '664', '3', null, '1', '1', '2021-04-08 02:16:28', '2021-04-08 02:16:28');
INSERT INTO `usuario_perfil` VALUES ('664', '665', '3', null, '1', '1', '2021-04-08 02:16:28', '2021-04-08 02:16:28');
INSERT INTO `usuario_perfil` VALUES ('665', '666', '3', null, '1', '1', '2021-04-08 02:16:29', '2021-04-08 02:16:29');
INSERT INTO `usuario_perfil` VALUES ('666', '667', '3', null, '1', '1', '2021-04-08 02:16:29', '2021-04-08 02:16:29');
INSERT INTO `usuario_perfil` VALUES ('667', '668', '3', null, '1', '1', '2021-04-08 02:16:30', '2021-04-08 02:16:30');
INSERT INTO `usuario_perfil` VALUES ('668', '669', '3', null, '1', '1', '2021-04-08 02:16:30', '2021-04-08 02:16:30');
INSERT INTO `usuario_perfil` VALUES ('669', '670', '3', null, '1', '1', '2021-04-08 02:16:31', '2021-04-08 02:16:31');
INSERT INTO `usuario_perfil` VALUES ('670', '671', '3', null, '1', '1', '2021-04-08 02:16:31', '2021-04-08 02:16:31');
INSERT INTO `usuario_perfil` VALUES ('671', '672', '3', null, '1', '1', '2021-04-08 02:16:32', '2021-04-08 02:16:32');
INSERT INTO `usuario_perfil` VALUES ('672', '673', '3', null, '1', '1', '2021-04-08 02:16:32', '2021-04-08 02:16:32');
INSERT INTO `usuario_perfil` VALUES ('673', '674', '3', null, '1', '1', '2021-04-08 02:16:33', '2021-04-08 02:16:33');
INSERT INTO `usuario_perfil` VALUES ('674', '675', '3', null, '1', '1', '2021-04-08 02:16:33', '2021-04-08 02:16:33');
INSERT INTO `usuario_perfil` VALUES ('675', '676', '3', null, '1', '1', '2021-04-08 02:16:34', '2021-04-08 02:16:34');
INSERT INTO `usuario_perfil` VALUES ('676', '677', '3', null, '1', '1', '2021-04-08 02:16:34', '2021-04-08 02:16:34');
INSERT INTO `usuario_perfil` VALUES ('678', '626', '3', null, '1', '1', '2021-04-07 22:19:53', '2021-04-07 22:19:55');

-- ----------------------------
-- Table structure for websockets_statistics_entries
-- ----------------------------
DROP TABLE IF EXISTS `websockets_statistics_entries`;
CREATE TABLE `websockets_statistics_entries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `app_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `peak_connection_count` int(11) NOT NULL,
  `websocket_message_count` int(11) NOT NULL,
  `api_message_count` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=235 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of websockets_statistics_entries
-- ----------------------------
INSERT INTO `websockets_statistics_entries` VALUES ('1', '1056882', '1', '0', '0', '2021-04-02 15:45:56', '2021-04-02 15:45:56');
INSERT INTO `websockets_statistics_entries` VALUES ('2', '1056882', '1', '9', '1', '2021-04-02 15:46:56', '2021-04-02 15:46:56');
INSERT INTO `websockets_statistics_entries` VALUES ('3', '1056882', '1', '3', '1', '2021-04-02 15:47:56', '2021-04-02 15:47:56');
INSERT INTO `websockets_statistics_entries` VALUES ('4', '1056882', '1', '2', '1', '2021-04-02 15:48:56', '2021-04-02 15:48:56');
INSERT INTO `websockets_statistics_entries` VALUES ('5', '1056882', '0', '2', '1', '2021-04-02 15:49:56', '2021-04-02 15:49:56');
INSERT INTO `websockets_statistics_entries` VALUES ('6', '1056882', '0', '2', '1', '2021-04-02 15:50:56', '2021-04-02 15:50:56');
INSERT INTO `websockets_statistics_entries` VALUES ('7', '1056882', '0', '2', '1', '2021-04-02 15:51:56', '2021-04-02 15:51:56');
INSERT INTO `websockets_statistics_entries` VALUES ('8', '1056882', '0', '2', '1', '2021-04-02 15:52:56', '2021-04-02 15:52:56');
INSERT INTO `websockets_statistics_entries` VALUES ('9', '1056882', '1', '10', '1', '2021-04-02 15:53:56', '2021-04-02 15:53:56');
INSERT INTO `websockets_statistics_entries` VALUES ('10', '1056882', '0', '2', '1', '2021-04-02 15:54:56', '2021-04-02 15:54:56');
INSERT INTO `websockets_statistics_entries` VALUES ('11', '1056882', '0', '2', '1', '2021-04-02 15:55:56', '2021-04-02 15:55:56');
INSERT INTO `websockets_statistics_entries` VALUES ('12', '1056882', '0', '2', '1', '2021-04-02 15:56:56', '2021-04-02 15:56:56');
INSERT INTO `websockets_statistics_entries` VALUES ('13', '1056882', '0', '2', '1', '2021-04-02 15:57:56', '2021-04-02 15:57:56');
INSERT INTO `websockets_statistics_entries` VALUES ('14', '1056882', '0', '2', '1', '2021-04-02 15:58:56', '2021-04-02 15:58:56');
INSERT INTO `websockets_statistics_entries` VALUES ('15', '1056882', '0', '2', '1', '2021-04-02 15:59:56', '2021-04-02 15:59:56');
INSERT INTO `websockets_statistics_entries` VALUES ('16', '1056882', '0', '2', '1', '2021-04-02 16:00:56', '2021-04-02 16:00:56');
INSERT INTO `websockets_statistics_entries` VALUES ('17', '1056882', '0', '2', '1', '2021-04-02 16:01:56', '2021-04-02 16:01:56');
INSERT INTO `websockets_statistics_entries` VALUES ('18', '1056882', '0', '2', '1', '2021-04-02 16:02:56', '2021-04-02 16:02:56');
INSERT INTO `websockets_statistics_entries` VALUES ('19', '1056882', '0', '2', '1', '2021-04-02 16:03:56', '2021-04-02 16:03:56');
INSERT INTO `websockets_statistics_entries` VALUES ('20', '1056882', '0', '2', '1', '2021-04-02 16:04:56', '2021-04-02 16:04:56');
INSERT INTO `websockets_statistics_entries` VALUES ('21', '1056882', '0', '2', '1', '2021-04-02 16:05:56', '2021-04-02 16:05:56');
INSERT INTO `websockets_statistics_entries` VALUES ('22', '1056882', '0', '2', '1', '2021-04-02 16:06:56', '2021-04-02 16:06:56');
INSERT INTO `websockets_statistics_entries` VALUES ('23', '1056882', '0', '2', '1', '2021-04-02 16:07:56', '2021-04-02 16:07:56');
INSERT INTO `websockets_statistics_entries` VALUES ('24', '1056882', '0', '2', '1', '2021-04-02 16:08:56', '2021-04-02 16:08:56');
INSERT INTO `websockets_statistics_entries` VALUES ('25', '1056882', '0', '1', '1', '2021-04-02 16:09:56', '2021-04-02 16:09:56');
INSERT INTO `websockets_statistics_entries` VALUES ('26', '1056882', '0', '2', '1', '2021-04-02 16:10:56', '2021-04-02 16:10:56');
INSERT INTO `websockets_statistics_entries` VALUES ('27', '1056882', '0', '2', '1', '2021-04-02 16:11:56', '2021-04-02 16:11:56');
INSERT INTO `websockets_statistics_entries` VALUES ('28', '1056882', '0', '2', '1', '2021-04-02 16:12:56', '2021-04-02 16:12:56');
INSERT INTO `websockets_statistics_entries` VALUES ('29', '1056882', '0', '2', '1', '2021-04-02 16:13:56', '2021-04-02 16:13:56');
INSERT INTO `websockets_statistics_entries` VALUES ('30', '1056882', '0', '2', '1', '2021-04-02 16:14:56', '2021-04-02 16:14:56');
INSERT INTO `websockets_statistics_entries` VALUES ('31', '1056882', '0', '2', '1', '2021-04-02 16:15:56', '2021-04-02 16:15:56');
INSERT INTO `websockets_statistics_entries` VALUES ('32', '1056882', '0', '2', '1', '2021-04-02 16:16:56', '2021-04-02 16:16:56');
INSERT INTO `websockets_statistics_entries` VALUES ('33', '1056882', '0', '2', '1', '2021-04-02 16:17:56', '2021-04-02 16:17:56');
INSERT INTO `websockets_statistics_entries` VALUES ('34', '1056882', '0', '2', '1', '2021-04-02 16:18:56', '2021-04-02 16:18:56');
INSERT INTO `websockets_statistics_entries` VALUES ('35', '1056882', '0', '2', '1', '2021-04-02 16:19:56', '2021-04-02 16:19:56');
INSERT INTO `websockets_statistics_entries` VALUES ('36', '1056882', '0', '2', '1', '2021-04-02 16:20:56', '2021-04-02 16:20:56');
INSERT INTO `websockets_statistics_entries` VALUES ('37', '1056882', '0', '2', '1', '2021-04-02 16:21:56', '2021-04-02 16:21:56');
INSERT INTO `websockets_statistics_entries` VALUES ('38', '1056882', '0', '2', '1', '2021-04-02 16:22:56', '2021-04-02 16:22:56');
INSERT INTO `websockets_statistics_entries` VALUES ('39', '1056882', '1', '0', '0', '2021-04-02 16:44:56', '2021-04-02 16:44:56');
INSERT INTO `websockets_statistics_entries` VALUES ('40', '1056882', '0', '1', '1', '2021-04-02 16:45:57', '2021-04-02 16:45:57');
INSERT INTO `websockets_statistics_entries` VALUES ('41', '1056882', '0', '2', '1', '2021-04-02 16:46:56', '2021-04-02 16:46:56');
INSERT INTO `websockets_statistics_entries` VALUES ('42', '1056882', '0', '2', '1', '2021-04-02 16:47:56', '2021-04-02 16:47:56');
INSERT INTO `websockets_statistics_entries` VALUES ('43', '1056882', '0', '2', '1', '2021-04-02 16:48:56', '2021-04-02 16:48:56');
INSERT INTO `websockets_statistics_entries` VALUES ('44', '1056882', '0', '2', '1', '2021-04-02 16:49:56', '2021-04-02 16:49:56');
INSERT INTO `websockets_statistics_entries` VALUES ('45', '1056882', '0', '2', '1', '2021-04-02 16:50:56', '2021-04-02 16:50:56');
INSERT INTO `websockets_statistics_entries` VALUES ('46', '1056882', '0', '1', '1', '2021-04-02 16:51:56', '2021-04-02 16:51:56');
INSERT INTO `websockets_statistics_entries` VALUES ('47', '1056882', '0', '2', '1', '2021-04-02 16:52:56', '2021-04-02 16:52:56');
INSERT INTO `websockets_statistics_entries` VALUES ('48', '1056882', '0', '2', '1', '2021-04-02 16:53:56', '2021-04-02 16:53:56');
INSERT INTO `websockets_statistics_entries` VALUES ('49', '1056882', '0', '3', '1', '2021-04-02 16:54:56', '2021-04-02 16:54:56');
INSERT INTO `websockets_statistics_entries` VALUES ('50', '1056882', '2', '4', '1', '2021-04-02 16:55:56', '2021-04-02 16:55:56');
INSERT INTO `websockets_statistics_entries` VALUES ('51', '1056882', '2', '4', '1', '2021-04-02 16:56:56', '2021-04-02 16:56:56');
INSERT INTO `websockets_statistics_entries` VALUES ('52', '1056882', '2', '4', '1', '2021-04-02 16:57:56', '2021-04-02 16:57:56');
INSERT INTO `websockets_statistics_entries` VALUES ('53', '1056882', '2', '3', '1', '2021-04-02 16:58:56', '2021-04-02 16:58:56');
INSERT INTO `websockets_statistics_entries` VALUES ('54', '1056882', '2', '4', '1', '2021-04-02 16:59:56', '2021-04-02 16:59:56');
INSERT INTO `websockets_statistics_entries` VALUES ('55', '1056882', '2', '4', '1', '2021-04-02 17:00:56', '2021-04-02 17:00:56');
INSERT INTO `websockets_statistics_entries` VALUES ('56', '1056882', '2', '4', '1', '2021-04-02 17:01:56', '2021-04-02 17:01:56');
INSERT INTO `websockets_statistics_entries` VALUES ('57', '1056882', '2', '1', '1', '2021-04-02 17:02:56', '2021-04-02 17:02:56');
INSERT INTO `websockets_statistics_entries` VALUES ('58', '1056882', '0', '5', '1', '2021-04-02 17:03:56', '2021-04-02 17:03:56');
INSERT INTO `websockets_statistics_entries` VALUES ('59', '1056882', '2', '4', '1', '2021-04-02 17:04:56', '2021-04-02 17:04:56');
INSERT INTO `websockets_statistics_entries` VALUES ('60', '1056882', '1', '4', '1', '2021-04-02 17:05:56', '2021-04-02 17:05:56');
INSERT INTO `websockets_statistics_entries` VALUES ('61', '1056882', '1', '3', '1', '2021-04-02 17:06:56', '2021-04-02 17:06:56');
INSERT INTO `websockets_statistics_entries` VALUES ('62', '1056882', '1', '4', '1', '2021-04-02 17:07:56', '2021-04-02 17:07:56');
INSERT INTO `websockets_statistics_entries` VALUES ('63', '1056882', '2', '4', '1', '2021-04-02 17:08:56', '2021-04-02 17:08:56');
INSERT INTO `websockets_statistics_entries` VALUES ('64', '1056882', '2', '11', '1', '2021-04-02 17:09:56', '2021-04-02 17:09:56');
INSERT INTO `websockets_statistics_entries` VALUES ('65', '1056882', '2', '3', '1', '2021-04-02 17:10:56', '2021-04-02 17:10:56');
INSERT INTO `websockets_statistics_entries` VALUES ('66', '1056882', '2', '2', '2', '2021-04-02 17:11:56', '2021-04-02 17:11:56');
INSERT INTO `websockets_statistics_entries` VALUES ('67', '1056882', '2', '3', '2', '2021-04-02 17:12:56', '2021-04-02 17:12:56');
INSERT INTO `websockets_statistics_entries` VALUES ('68', '1056882', '2', '3', '1', '2021-04-02 17:13:56', '2021-04-02 17:13:56');
INSERT INTO `websockets_statistics_entries` VALUES ('69', '1056882', '2', '3', '1', '2021-04-02 17:14:56', '2021-04-02 17:14:56');
INSERT INTO `websockets_statistics_entries` VALUES ('70', '1056882', '2', '2', '1', '2021-04-02 17:15:56', '2021-04-02 17:15:56');
INSERT INTO `websockets_statistics_entries` VALUES ('71', '1056882', '2', '12', '0', '2021-04-02 17:17:41', '2021-04-02 17:17:41');
INSERT INTO `websockets_statistics_entries` VALUES ('72', '1056882', '2', '9', '2', '2021-04-02 17:18:41', '2021-04-02 17:18:41');
INSERT INTO `websockets_statistics_entries` VALUES ('73', '1056882', '2', '8', '0', '2021-04-02 17:20:52', '2021-04-02 17:20:52');
INSERT INTO `websockets_statistics_entries` VALUES ('74', '1056882', '2', '5', '2', '2021-04-02 17:21:50', '2021-04-02 17:21:50');
INSERT INTO `websockets_statistics_entries` VALUES ('75', '1056882', '2', '3', '1', '2021-04-02 17:22:50', '2021-04-02 17:22:50');
INSERT INTO `websockets_statistics_entries` VALUES ('76', '1056882', '2', '3', '1', '2021-04-02 17:23:50', '2021-04-02 17:23:50');
INSERT INTO `websockets_statistics_entries` VALUES ('77', '1056882', '2', '3', '1', '2021-04-02 17:24:50', '2021-04-02 17:24:50');
INSERT INTO `websockets_statistics_entries` VALUES ('78', '1056882', '2', '2', '1', '2021-04-02 17:25:50', '2021-04-02 17:25:50');
INSERT INTO `websockets_statistics_entries` VALUES ('79', '1056882', '2', '3', '1', '2021-04-02 17:26:50', '2021-04-02 17:26:50');
INSERT INTO `websockets_statistics_entries` VALUES ('80', '1056882', '2', '4', '1', '2021-04-02 17:27:52', '2021-04-02 17:27:52');
INSERT INTO `websockets_statistics_entries` VALUES ('81', '1056882', '2', '3', '1', '2021-04-02 17:28:50', '2021-04-02 17:28:50');
INSERT INTO `websockets_statistics_entries` VALUES ('82', '1056882', '2', '2', '1', '2021-04-02 17:29:50', '2021-04-02 17:29:50');
INSERT INTO `websockets_statistics_entries` VALUES ('83', '1056882', '2', '3', '1', '2021-04-02 17:30:50', '2021-04-02 17:30:50');
INSERT INTO `websockets_statistics_entries` VALUES ('84', '1056882', '2', '3', '3', '2021-04-02 17:31:50', '2021-04-02 17:31:50');
INSERT INTO `websockets_statistics_entries` VALUES ('85', '1056882', '2', '2', '2', '2021-04-02 17:32:50', '2021-04-02 17:32:50');
INSERT INTO `websockets_statistics_entries` VALUES ('86', '1056882', '2', '3', '1', '2021-04-02 17:33:50', '2021-04-02 17:33:50');
INSERT INTO `websockets_statistics_entries` VALUES ('87', '1056882', '2', '11', '0', '2021-04-02 17:35:06', '2021-04-02 17:35:06');
INSERT INTO `websockets_statistics_entries` VALUES ('88', '1056882', '2', '3', '2', '2021-04-02 17:36:06', '2021-04-02 17:36:06');
INSERT INTO `websockets_statistics_entries` VALUES ('89', '1056882', '2', '3', '1', '2021-04-02 17:37:06', '2021-04-02 17:37:06');
INSERT INTO `websockets_statistics_entries` VALUES ('90', '1056882', '2', '3', '1', '2021-04-02 17:38:06', '2021-04-02 17:38:06');
INSERT INTO `websockets_statistics_entries` VALUES ('91', '1056882', '2', '11', '0', '2021-04-02 17:40:07', '2021-04-02 17:40:07');
INSERT INTO `websockets_statistics_entries` VALUES ('92', '1056882', '2', '3', '1', '2021-04-02 17:41:07', '2021-04-02 17:41:07');
INSERT INTO `websockets_statistics_entries` VALUES ('93', '1056882', '2', '3', '1', '2021-04-02 17:42:07', '2021-04-02 17:42:07');
INSERT INTO `websockets_statistics_entries` VALUES ('94', '1056882', '2', '3', '1', '2021-04-02 17:43:07', '2021-04-02 17:43:07');
INSERT INTO `websockets_statistics_entries` VALUES ('95', '1056882', '2', '3', '1', '2021-04-02 17:44:07', '2021-04-02 17:44:07');
INSERT INTO `websockets_statistics_entries` VALUES ('96', '1056882', '2', '3', '1', '2021-04-02 17:45:07', '2021-04-02 17:45:07');
INSERT INTO `websockets_statistics_entries` VALUES ('97', '1056882', '2', '3', '1', '2021-04-02 17:46:07', '2021-04-02 17:46:07');
INSERT INTO `websockets_statistics_entries` VALUES ('98', '1056882', '2', '9', '2', '2021-04-02 17:47:07', '2021-04-02 17:47:07');
INSERT INTO `websockets_statistics_entries` VALUES ('99', '1056882', '2', '3', '1', '2021-04-02 17:48:07', '2021-04-02 17:48:07');
INSERT INTO `websockets_statistics_entries` VALUES ('100', '1056882', '2', '1', '3', '2021-04-02 17:49:07', '2021-04-02 17:49:07');
INSERT INTO `websockets_statistics_entries` VALUES ('101', '1056882', '2', '3', '1', '2021-04-02 17:50:07', '2021-04-02 17:50:07');
INSERT INTO `websockets_statistics_entries` VALUES ('102', '1056882', '2', '3', '1', '2021-04-02 17:51:07', '2021-04-02 17:51:07');
INSERT INTO `websockets_statistics_entries` VALUES ('103', '1056882', '2', '3', '1', '2021-04-02 17:52:07', '2021-04-02 17:52:07');
INSERT INTO `websockets_statistics_entries` VALUES ('104', '1056882', '2', '3', '1', '2021-04-02 17:53:07', '2021-04-02 17:53:07');
INSERT INTO `websockets_statistics_entries` VALUES ('105', '1056882', '2', '3', '1', '2021-04-02 17:54:07', '2021-04-02 17:54:07');
INSERT INTO `websockets_statistics_entries` VALUES ('106', '1056882', '2', '3', '1', '2021-04-02 17:55:07', '2021-04-02 17:55:07');
INSERT INTO `websockets_statistics_entries` VALUES ('107', '1056882', '2', '3', '1', '2021-04-02 17:56:07', '2021-04-02 17:56:07');
INSERT INTO `websockets_statistics_entries` VALUES ('108', '1056882', '2', '3', '1', '2021-04-02 17:57:07', '2021-04-02 17:57:07');
INSERT INTO `websockets_statistics_entries` VALUES ('109', '1056882', '2', '4', '1', '2021-04-02 17:58:07', '2021-04-02 17:58:07');
INSERT INTO `websockets_statistics_entries` VALUES ('110', '1056882', '2', '9', '1', '2021-04-02 17:59:40', '2021-04-02 17:59:40');
INSERT INTO `websockets_statistics_entries` VALUES ('111', '1056882', '2', '3', '1', '2021-04-02 18:00:40', '2021-04-02 18:00:40');
INSERT INTO `websockets_statistics_entries` VALUES ('112', '1056882', '2', '11', '1', '2021-04-02 18:01:40', '2021-04-02 18:01:40');
INSERT INTO `websockets_statistics_entries` VALUES ('113', '1056882', '2', '3', '1', '2021-04-02 18:02:40', '2021-04-02 18:02:40');
INSERT INTO `websockets_statistics_entries` VALUES ('114', '1056882', '2', '3', '1', '2021-04-02 18:03:40', '2021-04-02 18:03:40');
INSERT INTO `websockets_statistics_entries` VALUES ('115', '1056882', '2', '3', '1', '2021-04-02 18:04:40', '2021-04-02 18:04:40');
INSERT INTO `websockets_statistics_entries` VALUES ('116', '1056882', '2', '3', '1', '2021-04-02 18:05:40', '2021-04-02 18:05:40');
INSERT INTO `websockets_statistics_entries` VALUES ('117', '1056882', '2', '3', '1', '2021-04-02 18:06:40', '2021-04-02 18:06:40');
INSERT INTO `websockets_statistics_entries` VALUES ('118', '1056882', '2', '3', '1', '2021-04-02 18:07:40', '2021-04-02 18:07:40');
INSERT INTO `websockets_statistics_entries` VALUES ('119', '1056882', '2', '3', '1', '2021-04-02 18:08:40', '2021-04-02 18:08:40');
INSERT INTO `websockets_statistics_entries` VALUES ('120', '1056882', '2', '3', '1', '2021-04-02 18:09:40', '2021-04-02 18:09:40');
INSERT INTO `websockets_statistics_entries` VALUES ('121', '1056882', '2', '2', '1', '2021-04-02 18:10:40', '2021-04-02 18:10:40');
INSERT INTO `websockets_statistics_entries` VALUES ('122', '1056882', '1', '2', '1', '2021-04-02 18:11:40', '2021-04-02 18:11:40');
INSERT INTO `websockets_statistics_entries` VALUES ('123', '1056882', '1', '3', '1', '2021-04-02 18:12:40', '2021-04-02 18:12:40');
INSERT INTO `websockets_statistics_entries` VALUES ('124', '1056882', '1', '2', '1', '2021-04-02 18:13:40', '2021-04-02 18:13:40');
INSERT INTO `websockets_statistics_entries` VALUES ('125', '1056882', '2', '1', '1', '2021-04-02 18:14:40', '2021-04-02 18:14:40');
INSERT INTO `websockets_statistics_entries` VALUES ('126', '1056882', '2', '0', '1', '2021-04-02 18:15:40', '2021-04-02 18:15:40');
INSERT INTO `websockets_statistics_entries` VALUES ('127', '1056882', '2', '0', '1', '2021-04-02 18:16:40', '2021-04-02 18:16:40');
INSERT INTO `websockets_statistics_entries` VALUES ('128', '1056882', '2', '0', '1', '2021-04-02 18:17:40', '2021-04-02 18:17:40');
INSERT INTO `websockets_statistics_entries` VALUES ('129', '1056882', '1', '3', '1', '2021-04-02 18:18:40', '2021-04-02 18:18:40');
INSERT INTO `websockets_statistics_entries` VALUES ('130', '1056882', '1', '3', '1', '2021-04-02 18:19:40', '2021-04-02 18:19:40');
INSERT INTO `websockets_statistics_entries` VALUES ('131', '1056882', '1', '3', '1', '2021-04-02 18:20:40', '2021-04-02 18:20:40');
INSERT INTO `websockets_statistics_entries` VALUES ('132', '1056882', '1', '3', '1', '2021-04-02 18:21:40', '2021-04-02 18:21:40');
INSERT INTO `websockets_statistics_entries` VALUES ('133', '1056882', '1', '3', '1', '2021-04-02 18:22:40', '2021-04-02 18:22:40');
INSERT INTO `websockets_statistics_entries` VALUES ('134', '1056882', '1', '3', '1', '2021-04-02 18:23:40', '2021-04-02 18:23:40');
INSERT INTO `websockets_statistics_entries` VALUES ('135', '1056882', '1', '3', '1', '2021-04-02 18:24:40', '2021-04-02 18:24:40');
INSERT INTO `websockets_statistics_entries` VALUES ('136', '1056882', '1', '3', '1', '2021-04-02 18:25:40', '2021-04-02 18:25:40');
INSERT INTO `websockets_statistics_entries` VALUES ('137', '1056882', '1', '3', '1', '2021-04-02 18:26:40', '2021-04-02 18:26:40');
INSERT INTO `websockets_statistics_entries` VALUES ('138', '1056882', '1', '3', '1', '2021-04-02 18:27:40', '2021-04-02 18:27:40');
INSERT INTO `websockets_statistics_entries` VALUES ('139', '1056882', '1', '3', '1', '2021-04-02 18:28:40', '2021-04-02 18:28:40');
INSERT INTO `websockets_statistics_entries` VALUES ('140', '1056882', '1', '3', '1', '2021-04-02 18:29:40', '2021-04-02 18:29:40');
INSERT INTO `websockets_statistics_entries` VALUES ('141', '1056882', '1', '3', '1', '2021-04-02 18:30:40', '2021-04-02 18:30:40');
INSERT INTO `websockets_statistics_entries` VALUES ('142', '1056882', '1', '3', '1', '2021-04-02 18:31:40', '2021-04-02 18:31:40');
INSERT INTO `websockets_statistics_entries` VALUES ('143', '1056882', '1', '3', '1', '2021-04-02 18:32:40', '2021-04-02 18:32:40');
INSERT INTO `websockets_statistics_entries` VALUES ('144', '1056882', '1', '3', '1', '2021-04-02 18:33:40', '2021-04-02 18:33:40');
INSERT INTO `websockets_statistics_entries` VALUES ('145', '1056882', '1', '3', '1', '2021-04-02 18:34:40', '2021-04-02 18:34:40');
INSERT INTO `websockets_statistics_entries` VALUES ('146', '1056882', '1', '3', '1', '2021-04-02 18:35:40', '2021-04-02 18:35:40');
INSERT INTO `websockets_statistics_entries` VALUES ('147', '1056882', '1', '3', '1', '2021-04-02 18:36:40', '2021-04-02 18:36:40');
INSERT INTO `websockets_statistics_entries` VALUES ('148', '1056882', '1', '3', '1', '2021-04-02 18:37:40', '2021-04-02 18:37:40');
INSERT INTO `websockets_statistics_entries` VALUES ('149', '1056882', '1', '3', '1', '2021-04-02 18:38:40', '2021-04-02 18:38:40');
INSERT INTO `websockets_statistics_entries` VALUES ('150', '1056882', '1', '3', '1', '2021-04-02 18:39:40', '2021-04-02 18:39:40');
INSERT INTO `websockets_statistics_entries` VALUES ('151', '1056882', '1', '3', '1', '2021-04-02 18:40:40', '2021-04-02 18:40:40');
INSERT INTO `websockets_statistics_entries` VALUES ('152', '1056882', '1', '3', '1', '2021-04-02 18:41:40', '2021-04-02 18:41:40');
INSERT INTO `websockets_statistics_entries` VALUES ('153', '1056882', '1', '3', '1', '2021-04-02 18:42:40', '2021-04-02 18:42:40');
INSERT INTO `websockets_statistics_entries` VALUES ('154', '1056882', '1', '3', '1', '2021-04-02 18:43:40', '2021-04-02 18:43:40');
INSERT INTO `websockets_statistics_entries` VALUES ('155', '1056882', '1', '3', '1', '2021-04-02 18:44:40', '2021-04-02 18:44:40');
INSERT INTO `websockets_statistics_entries` VALUES ('156', '1056882', '1', '3', '1', '2021-04-02 18:45:40', '2021-04-02 18:45:40');
INSERT INTO `websockets_statistics_entries` VALUES ('157', '1056882', '1', '3', '1', '2021-04-02 18:46:40', '2021-04-02 18:46:40');
INSERT INTO `websockets_statistics_entries` VALUES ('158', '1056882', '1', '3', '1', '2021-04-02 18:47:40', '2021-04-02 18:47:40');
INSERT INTO `websockets_statistics_entries` VALUES ('159', '1056882', '1', '3', '1', '2021-04-02 18:48:40', '2021-04-02 18:48:40');
INSERT INTO `websockets_statistics_entries` VALUES ('160', '1056882', '1', '3', '1', '2021-04-02 18:49:40', '2021-04-02 18:49:40');
INSERT INTO `websockets_statistics_entries` VALUES ('161', '1056882', '1', '3', '1', '2021-04-02 18:50:40', '2021-04-02 18:50:40');
INSERT INTO `websockets_statistics_entries` VALUES ('162', '1056882', '1', '3', '1', '2021-04-02 18:51:40', '2021-04-02 18:51:40');
INSERT INTO `websockets_statistics_entries` VALUES ('163', '1056882', '1', '3', '1', '2021-04-02 18:52:40', '2021-04-02 18:52:40');
INSERT INTO `websockets_statistics_entries` VALUES ('164', '1056882', '1', '2', '1', '2021-04-02 18:53:40', '2021-04-02 18:53:40');
INSERT INTO `websockets_statistics_entries` VALUES ('165', '1056882', '1', '3', '1', '2021-04-02 18:54:40', '2021-04-02 18:54:40');
INSERT INTO `websockets_statistics_entries` VALUES ('166', '1056882', '1', '3', '1', '2021-04-02 18:55:40', '2021-04-02 18:55:40');
INSERT INTO `websockets_statistics_entries` VALUES ('167', '1056882', '1', '3', '1', '2021-04-02 18:56:40', '2021-04-02 18:56:40');
INSERT INTO `websockets_statistics_entries` VALUES ('168', '1056882', '1', '3', '1', '2021-04-02 18:57:40', '2021-04-02 18:57:40');
INSERT INTO `websockets_statistics_entries` VALUES ('169', '1056882', '1', '3', '1', '2021-04-02 18:58:40', '2021-04-02 18:58:40');
INSERT INTO `websockets_statistics_entries` VALUES ('170', '1056882', '3', '5', '2', '2021-04-02 18:59:40', '2021-04-02 18:59:40');
INSERT INTO `websockets_statistics_entries` VALUES ('171', '1056882', '3', '4', '3', '2021-04-02 19:00:40', '2021-04-02 19:00:40');
INSERT INTO `websockets_statistics_entries` VALUES ('172', '1056882', '3', '5', '1', '2021-04-02 19:01:40', '2021-04-02 19:01:40');
INSERT INTO `websockets_statistics_entries` VALUES ('173', '1056882', '3', '5', '1', '2021-04-02 19:02:40', '2021-04-02 19:02:40');
INSERT INTO `websockets_statistics_entries` VALUES ('174', '1056882', '3', '5', '1', '2021-04-02 19:03:40', '2021-04-02 19:03:40');
INSERT INTO `websockets_statistics_entries` VALUES ('175', '1056882', '3', '5', '1', '2021-04-02 19:04:40', '2021-04-02 19:04:40');
INSERT INTO `websockets_statistics_entries` VALUES ('176', '1056882', '3', '5', '1', '2021-04-02 19:05:40', '2021-04-02 19:05:40');
INSERT INTO `websockets_statistics_entries` VALUES ('177', '1056882', '3', '5', '1', '2021-04-02 19:06:40', '2021-04-02 19:06:40');
INSERT INTO `websockets_statistics_entries` VALUES ('178', '1056882', '3', '5', '1', '2021-04-02 19:07:40', '2021-04-02 19:07:40');
INSERT INTO `websockets_statistics_entries` VALUES ('179', '1056882', '3', '5', '1', '2021-04-02 19:08:40', '2021-04-02 19:08:40');
INSERT INTO `websockets_statistics_entries` VALUES ('180', '1056882', '3', '4', '1', '2021-04-02 19:09:40', '2021-04-02 19:09:40');
INSERT INTO `websockets_statistics_entries` VALUES ('181', '1056882', '3', '5', '1', '2021-04-02 19:10:40', '2021-04-02 19:10:40');
INSERT INTO `websockets_statistics_entries` VALUES ('182', '1056882', '3', '5', '1', '2021-04-02 19:11:40', '2021-04-02 19:11:40');
INSERT INTO `websockets_statistics_entries` VALUES ('183', '1056882', '3', '5', '1', '2021-04-02 19:12:40', '2021-04-02 19:12:40');
INSERT INTO `websockets_statistics_entries` VALUES ('184', '1056882', '3', '5', '1', '2021-04-02 19:13:40', '2021-04-02 19:13:40');
INSERT INTO `websockets_statistics_entries` VALUES ('185', '1056882', '3', '5', '1', '2021-04-02 19:14:40', '2021-04-02 19:14:40');
INSERT INTO `websockets_statistics_entries` VALUES ('186', '1056882', '3', '5', '1', '2021-04-02 19:15:40', '2021-04-02 19:15:40');
INSERT INTO `websockets_statistics_entries` VALUES ('187', '1056882', '3', '5', '1', '2021-04-02 19:16:40', '2021-04-02 19:16:40');
INSERT INTO `websockets_statistics_entries` VALUES ('188', '1056882', '3', '5', '1', '2021-04-02 19:17:40', '2021-04-02 19:17:40');
INSERT INTO `websockets_statistics_entries` VALUES ('189', '1056882', '3', '5', '1', '2021-04-02 19:18:40', '2021-04-02 19:18:40');
INSERT INTO `websockets_statistics_entries` VALUES ('190', '1056882', '3', '5', '1', '2021-04-02 19:19:40', '2021-04-02 19:19:40');
INSERT INTO `websockets_statistics_entries` VALUES ('191', '1056882', '3', '5', '1', '2021-04-02 19:20:40', '2021-04-02 19:20:40');
INSERT INTO `websockets_statistics_entries` VALUES ('192', '1056882', '3', '5', '1', '2021-04-02 19:21:40', '2021-04-02 19:21:40');
INSERT INTO `websockets_statistics_entries` VALUES ('193', '1056882', '3', '5', '1', '2021-04-02 19:22:40', '2021-04-02 19:22:40');
INSERT INTO `websockets_statistics_entries` VALUES ('194', '1056882', '3', '5', '1', '2021-04-02 19:23:40', '2021-04-02 19:23:40');
INSERT INTO `websockets_statistics_entries` VALUES ('195', '1056882', '3', '5', '1', '2021-04-02 19:24:40', '2021-04-02 19:24:40');
INSERT INTO `websockets_statistics_entries` VALUES ('196', '1056882', '3', '4', '1', '2021-04-02 19:25:40', '2021-04-02 19:25:40');
INSERT INTO `websockets_statistics_entries` VALUES ('197', '1056882', '3', '5', '1', '2021-04-02 19:26:40', '2021-04-02 19:26:40');
INSERT INTO `websockets_statistics_entries` VALUES ('198', '1056882', '3', '5', '1', '2021-04-02 19:27:40', '2021-04-02 19:27:40');
INSERT INTO `websockets_statistics_entries` VALUES ('199', '1056882', '3', '5', '1', '2021-04-02 19:28:40', '2021-04-02 19:28:40');
INSERT INTO `websockets_statistics_entries` VALUES ('200', '1056882', '3', '5', '1', '2021-04-02 19:29:40', '2021-04-02 19:29:40');
INSERT INTO `websockets_statistics_entries` VALUES ('201', '1056882', '3', '5', '1', '2021-04-02 19:30:40', '2021-04-02 19:30:40');
INSERT INTO `websockets_statistics_entries` VALUES ('202', '1056882', '3', '5', '1', '2021-04-02 19:31:40', '2021-04-02 19:31:40');
INSERT INTO `websockets_statistics_entries` VALUES ('203', '1056882', '3', '5', '1', '2021-04-02 19:32:40', '2021-04-02 19:32:40');
INSERT INTO `websockets_statistics_entries` VALUES ('204', '1056882', '3', '5', '1', '2021-04-02 19:33:40', '2021-04-02 19:33:40');
INSERT INTO `websockets_statistics_entries` VALUES ('205', '1056882', '3', '5', '1', '2021-04-02 19:34:40', '2021-04-02 19:34:40');
INSERT INTO `websockets_statistics_entries` VALUES ('206', '1056882', '3', '5', '1', '2021-04-02 19:35:40', '2021-04-02 19:35:40');
INSERT INTO `websockets_statistics_entries` VALUES ('207', '1056882', '1', '4', '0', '2021-04-02 19:37:21', '2021-04-02 19:37:21');
INSERT INTO `websockets_statistics_entries` VALUES ('208', '1056882', '1', '2', '1', '2021-04-02 19:38:21', '2021-04-02 19:38:21');
INSERT INTO `websockets_statistics_entries` VALUES ('209', '1056882', '3', '19', '1', '2021-04-02 19:39:21', '2021-04-02 19:39:21');
INSERT INTO `websockets_statistics_entries` VALUES ('210', '1056882', '2', '6', '0', '2021-04-06 15:22:45', '2021-04-06 15:22:45');
INSERT INTO `websockets_statistics_entries` VALUES ('211', '1056882', '2', '6', '1', '2021-04-06 15:23:41', '2021-04-06 15:23:41');
INSERT INTO `websockets_statistics_entries` VALUES ('212', '1056882', '2', '3', '1', '2021-04-06 15:24:42', '2021-04-06 15:24:42');
INSERT INTO `websockets_statistics_entries` VALUES ('213', '1056882', '2', '3', '2', '2021-04-06 15:25:42', '2021-04-06 15:25:42');
INSERT INTO `websockets_statistics_entries` VALUES ('214', '1056882', '2', '3', '1', '2021-04-06 15:26:42', '2021-04-06 15:26:42');
INSERT INTO `websockets_statistics_entries` VALUES ('215', '1056882', '2', '2', '2', '2021-04-06 15:27:42', '2021-04-06 15:27:42');
INSERT INTO `websockets_statistics_entries` VALUES ('216', '1056882', '2', '3', '1', '2021-04-06 15:28:42', '2021-04-06 15:28:42');
INSERT INTO `websockets_statistics_entries` VALUES ('217', '1056882', '2', '3', '1', '2021-04-06 15:29:42', '2021-04-06 15:29:42');
INSERT INTO `websockets_statistics_entries` VALUES ('218', '1056882', '2', '3', '1', '2021-04-06 15:30:41', '2021-04-06 15:30:41');
INSERT INTO `websockets_statistics_entries` VALUES ('219', '1056882', '2', '3', '1', '2021-04-06 15:31:42', '2021-04-06 15:31:42');
INSERT INTO `websockets_statistics_entries` VALUES ('220', '1056882', '2', '3', '1', '2021-04-06 15:32:42', '2021-04-06 15:32:42');
INSERT INTO `websockets_statistics_entries` VALUES ('221', '1056882', '2', '3', '1', '2021-04-06 15:33:42', '2021-04-06 15:33:42');
INSERT INTO `websockets_statistics_entries` VALUES ('222', '1056882', '2', '3', '1', '2021-04-06 15:34:42', '2021-04-06 15:34:42');
INSERT INTO `websockets_statistics_entries` VALUES ('223', '1056882', '2', '3', '1', '2021-04-06 15:35:42', '2021-04-06 15:35:42');
INSERT INTO `websockets_statistics_entries` VALUES ('224', '1056882', '2', '3', '1', '2021-04-06 15:36:42', '2021-04-06 15:36:42');
INSERT INTO `websockets_statistics_entries` VALUES ('225', '1056882', '2', '3', '1', '2021-04-06 15:37:42', '2021-04-06 15:37:42');
INSERT INTO `websockets_statistics_entries` VALUES ('226', '1056882', '2', '3', '1', '2021-04-06 15:38:42', '2021-04-06 15:38:42');
INSERT INTO `websockets_statistics_entries` VALUES ('227', '1056882', '2', '3', '1', '2021-04-06 15:39:42', '2021-04-06 15:39:42');
INSERT INTO `websockets_statistics_entries` VALUES ('228', '1056882', '2', '2', '2', '2021-04-06 15:40:42', '2021-04-06 15:40:42');
INSERT INTO `websockets_statistics_entries` VALUES ('229', '1056882', '2', '3', '1', '2021-04-06 15:41:42', '2021-04-06 15:41:42');
INSERT INTO `websockets_statistics_entries` VALUES ('230', '1056882', '2', '3', '1', '2021-04-06 15:42:42', '2021-04-06 15:42:42');
INSERT INTO `websockets_statistics_entries` VALUES ('231', '1056882', '2', '3', '1', '2021-04-06 15:43:42', '2021-04-06 15:43:42');
INSERT INTO `websockets_statistics_entries` VALUES ('232', '1056882', '2', '3', '1', '2021-04-06 15:44:42', '2021-04-06 15:44:42');
INSERT INTO `websockets_statistics_entries` VALUES ('233', '1056882', '2', '3', '1', '2021-04-06 15:45:42', '2021-04-06 15:45:42');
INSERT INTO `websockets_statistics_entries` VALUES ('234', '1056882', '2', '3', '1', '2021-04-06 15:46:42', '2021-04-06 15:46:42');

-- ----------------------------
-- Table structure for zona
-- ----------------------------
DROP TABLE IF EXISTS `zona`;
CREATE TABLE `zona` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `co_zona` int(11) NOT NULL,
  `nb_zona` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_ciudad` int(11) unsigned NOT NULL,
  `tx_latitud` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_longitud` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) unsigned NOT NULL,
  `id_usuario` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `zona_co_zona_unique` (`co_zona`),
  KEY `fk_zona_ciudad` (`id_ciudad`),
  KEY `fk_zona_status` (`id_status`),
  KEY `fk_zona_usuario` (`id_usuario`),
  CONSTRAINT `fk_zona_ciudad` FOREIGN KEY (`id_ciudad`) REFERENCES `ciudad` (`id`),
  CONSTRAINT `fk_zona_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`),
  CONSTRAINT `fk_zona_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of zona
-- ----------------------------
INSERT INTO `zona` VALUES ('1', '7600101', 'Nor–Occidental', '1004', null, null, null, '1', '1', null, null);
INSERT INTO `zona` VALUES ('2', '7600102', 'Nor–Oriente', '1004', null, null, null, '1', '1', null, null);
INSERT INTO `zona` VALUES ('3', '7600103', 'Dtto. Agua Blanca', '1004', null, null, null, '1', '1', null, null);
INSERT INTO `zona` VALUES ('4', '7600104', 'Oriente', '1004', null, null, null, '1', '1', null, null);
INSERT INTO `zona` VALUES ('5', '7600105', 'Sur', '1004', null, null, null, '1', '1', null, null);
INSERT INTO `zona` VALUES ('6', '7600106', 'Rural', '1004', null, null, null, '1', '1', null, null);
INSERT INTO `zona` VALUES ('7', '7600199', 'Todo Cali', '1004', null, null, null, '1', '1', null, null);

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
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `vw_docente` AS SELECT
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
departamento.nb_departamento,
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
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `vw_grado_materia` AS SELECT
grado.id,
grado.nb_grado,
grado.nu_grado nu_orden,
grado_materia.id_grado,
materia.nb_materia,
grado_materia.id_materia,
materia.co_materia co_codigo,
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
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `vw_grupo_materia` AS SELECT
grupo_materia.id_grupo,
grupo.nb_grupo,
grupo.nu_orden nu_orden,
grupo_materia.id_materia,
materia.nb_materia,
materia.co_materia co_codigo_materia,
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

-- ----------------------------
-- View structure for vw_usuario_perfil
-- ----------------------------
DROP VIEW IF EXISTS `vw_usuario_perfil`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost`  VIEW `vw_usuario_perfil` AS SELECT
	`usuario`.`nb_nombres` AS `nb_nombres`,
	`usuario`.`nb_usuario` AS `nb_usuario`,
	`usuario`.`tx_email` AS `tx_email`,
	`usuario`.`id_status` AS `id_status`,
	`status`.`nb_status` AS `nb_status`,
	(
		SELECT
			'X'
		FROM
			`usuario_perfil` `upe`
		WHERE
			`upe`.`id_usuario` = `usuario`.`id`
		AND `upe`.`id_perfil` = 1
	) AS `es_secretaria`,
	(
		SELECT
			'X'
		FROM
			`usuario_perfil` `upe`
		WHERE
			`upe`.`id_usuario` = `usuario`.`id`
		AND `upe`.`id_perfil` = 2
	) AS `es_docente`,
	(
		SELECT
			'X'
		FROM
			`usuario_perfil` `upe`
		WHERE
			`upe`.`id_usuario` = `usuario`.`id`
		AND `upe`.`id_perfil` = 3
	) AS `es_alumno`,
	(
		SELECT
			'X'
		FROM
			`usuario_perfil` `upe`
		WHERE
			`upe`.`id_usuario` = `usuario`.`id`
		AND `upe`.`id_perfil` = 4
	) AS `es_acudiente`,
	(
		SELECT
			'X'
		FROM
			`usuario_perfil` `upe`
		WHERE
			`upe`.`id_usuario` = `usuario`.`id`
		AND `upe`.`id_perfil` = 4
	) AS `es_empleado`,
	(
		SELECT
			'X'
		FROM
			`usuario_perfil` `upe`
		WHERE
			`upe`.`id_usuario` = `usuario`.`id`
		AND `upe`.`id_perfil` = 4
	) AS `es_admin`
FROM
	(
		(
			`usuario`
			JOIN `tipo_usuario` ON (
				`usuario`.`id_tipo_usuario` = `tipo_usuario`.`id`
			)
		)
		JOIN `status` ON (
			`usuario`.`id_status` = `status`.`id`
		)
	) ;

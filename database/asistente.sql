/*
Navicat MySQL Data Transfer

Source Server         : desdecasa
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : presentacion

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2021-01-20 14:00:55
*/

SET FOREIGN_KEY_CHECKS=0;

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
INSERT INTO `asistente` VALUES ('1', 'Institucion', '7', 'Se define la informacion principal de la institución que incluye logo, informacion  de contacto, ubicación y directiva.El logo sera el que aparezca en los reportes.', 'deep-orange', '1', 'secretaria', 'Debe cargarse la información completa para la correcta generación de los reportes. \nDebe generar con antelación lo cargos y tipo directiva para.', '1', '1', '2020-09-02 00:09:03', '2021-01-17 14:43:47');
INSERT INTO `asistente` VALUES ('2', 'Tipo Colegio', '8', 'Indica la categoría del colegio privado o publico', 'deep-orange', '3', 'secretaria', 'Información requerida para algunos reportes', '1', '1', '2020-09-02 01:26:22', '2020-12-10 16:22:02');
INSERT INTO `asistente` VALUES ('3', 'Cargos', '9', 'Cargos de la platilla de cargos del colegio tanto para la directiva como de los empleados.', 'deep-orange', '2', 'secretaria', 'Esta información alimentara los selectores de cargos en la carga de empleados y directivas.', '1', '1', '2020-09-02 01:32:11', '2020-12-10 16:22:02');
INSERT INTO `asistente` VALUES ('4', 'Tipo Directiva', '10', 'Tipos de directiva con que cuente la institución', 'deep-orange', '4', 'secretaria', 'Información para alimentar selectores en pantalla de carga de directiva', '1', '1', '2020-09-02 12:43:15', '2020-12-10 16:26:07');
INSERT INTO `asistente` VALUES ('6', 'Empleados', '14', 'Carga de la datos básicos del empleado así como la ubicación.  Cada vez que se genera un empleado se genera un usuario con perfil secretaria.', 'deep-orange', '5', 'secretaria', 'El correo es obligatorio ya que es usado para creación del usuario y envió de las notificaciones.', '1', '1', '2020-09-02 12:44:21', '2021-01-17 14:44:54');
INSERT INTO `asistente` VALUES ('7', 'Estructura', '12', 'Se configura los edificios y/o sectores de la institución de forma jerárquica, donde se ubican las aulas de clase.', 'deep-orange', '6', 'secretaria', 'Permite al personal administrativo-docente-alumno ubicar facilmete las aulas, se emplea en horarios y asignaciones de aulas', '1', '1', '2020-09-02 12:44:36', '2020-12-10 19:27:09');
INSERT INTO `asistente` VALUES ('8', 'Aulas', '13', 'Se indica las aulas, laboratorios, talleres u otras instalaciones  donde se imparten clases según la estructura del edificio.', 'deep-orange', '7', 'secretaria', 'Permite la asignación de clase y los horarios. Permite la fácil ubicación ya que describe en que estructura de la Institución se encuentra ubicada', '1', '1', '2020-09-02 12:44:54', '2021-01-17 14:46:36');
INSERT INTO `asistente` VALUES ('9', 'Calendario', '15', 'Se crea, edita, activa/desactiva el calendario de clases.', 'teal', '8', 'secretaria', 'Solo puede haber un calendario activo, esto limita las fechas asignable en todas las actividades. Asimismo, muestra solo los grupos creados para ese calendario', '1', '1', '2020-09-02 12:45:10', '2020-12-10 19:30:39');
INSERT INTO `asistente` VALUES ('10', 'Periodos', '16', 'Se configuran los periodos o lapsos en que se divide al calendario escolar.', 'teal', '9', 'secretaria', 'Solo puede haber un periodo activo. afecta las actividades y planes de evaluaciones que pueden cargarse', '1', '1', '2020-09-02 12:45:25', '2020-12-10 19:38:06');
INSERT INTO `asistente` VALUES ('11', 'Turnos', '21', 'Define los diferentes turnos con que trabaja la institucion', 'teal', '10', 'secretaria', 'Afecta la información de reportes y horario de clases', '1', '1', '2020-09-02 12:45:38', '2021-01-17 14:48:36');
INSERT INTO `asistente` VALUES ('12', 'Horas Academicas', '22', 'Define las horas de clases y de receso y la carga horaria (horas de clase)', 'teal', '11', 'secretaria', 'Afecta los horarios de clase', '1', '1', '2020-09-02 12:45:51', '2021-01-17 14:53:34');
INSERT INTO `asistente` VALUES ('14', 'Areas de Estudio', '27', 'Departamentos o grupos de materias con que cuenta la institución', 'cyan', '13', 'secretaria', 'Se define los colores que serán los que identifiquen en Virtualin a la materias asignadas.', '1', '1', '2020-09-02 12:46:47', '2021-01-17 14:58:10');
INSERT INTO `asistente` VALUES ('15', 'Materias', '28', 'Se definen  las materia que se imparten en la institución. Agrupadas por Area de Estudio.', 'cyan', '14', 'secretaria', 'Para los libros con que cuenta el sistema debe existir la materia para el mismo.', '1', '1', '2020-09-02 12:47:03', '2021-01-17 15:03:55');
INSERT INTO `asistente` VALUES ('16', 'Niveles', '24', 'Define los Niveles educativos que la institución maneja', 'cyan', '15', 'secretaria', 'Requerido para la creación de los Grados', '1', '1', '2020-09-02 12:47:30', '2021-01-17 15:05:02');
INSERT INTO `asistente` VALUES ('17', 'Grados', '25', 'Define los grados que maneja la institucion', 'cyan', '16', 'secretaria', 'Descripcion de la funcionalidad, observaciones y advertencias', '1', '1', '2020-09-02 12:47:55', '2021-01-17 15:07:02');
INSERT INTO `asistente` VALUES ('18', 'Grupos', '26', 'Descripcion de la tarea de especial cuidado para el funcionamiento del sistema\'', 'cyan', '17', 'secretaria', 'Descripcion de la funcionalidad, observaciones y advertencias', '1', '1', '2020-09-02 12:48:08', '2021-01-16 20:29:07');
INSERT INTO `asistente` VALUES ('19', 'Docente', '37', 'Información de los docentes con que cuenta la Institución. \n- Permite cargar la foto del mismo. \n- Se asignan las materias que impartirá el docente', 'teal', '12', 'secretaria', 'Las materia asignadas permiten su asignación al plan de evaluación y en consecuencia al grupo.', '1', '1', '2020-09-02 12:48:30', '2021-01-17 14:56:46');
INSERT INTO `asistente` VALUES ('21', 'Plan Evaluacion', '35', 'Descripcion de la tarea de especial cuidado para el funcionamiento del sistema\'', 'purple', '18', 'secretaria', 'Descripcion de la funcionalidad, observaciones y advertencias', '1', '1', '2020-09-02 12:49:11', '2021-01-16 20:32:17');
INSERT INTO `asistente` VALUES ('22', 'Horario', '36', 'Descripcion de la tarea de especial cuidado para el funcionamiento del sistema\'', 'purple', '19', 'secretaria', 'Descripcion de la funcionalidad, observaciones y advertencias', '1', '1', '2020-09-02 12:49:29', '2021-01-16 20:32:17');
INSERT INTO `asistente` VALUES ('24', 'Nivel Calificaciones', '31', 'Descripcion de la tarea de especial cuidado para el funcionamiento del sistema\'', 'purple', '20', 'secretaria', 'Descripcion de la funcionalidad, observaciones y advertencias', '1', '1', '2020-09-02 12:50:43', '2021-01-16 20:32:17');
INSERT INTO `asistente` VALUES ('25', 'Calificacion', '32', 'Descripcion de la tarea de especial cuidado para el funcionamiento del sistema\'', 'purple', '21', 'secretaria', 'Descripcion de la funcionalidad, observaciones y advertencias', '1', '1', '2020-09-02 12:50:57', '2021-01-16 20:32:17');
INSERT INTO `asistente` VALUES ('26', 'Condicion Alumno', '38', 'Descripcion de la tarea de especial cuidado para el funcionamiento del sistema\'', 'pink', '26', 'secretaria', 'Descripcion de la funcionalidad, observaciones y advertencias', '1', '1', '2020-09-02 12:51:14', '2021-01-16 20:32:17');
INSERT INTO `asistente` VALUES ('27', 'Alumnos', '39', 'Descripcion de la tarea de especial cuidado para el funcionamiento del sistema\'', 'pink', '27', 'secretaria', 'Descripcion de la funcionalidad, observaciones y advertencias', '1', '1', '2020-09-02 12:56:02', '2021-01-16 20:32:17');
INSERT INTO `asistente` VALUES ('28', 'Acudiente', '40', 'Descripcion de la tarea de especial cuidado para el funcionamiento del sistema\'', 'pink', '28', 'secretaria', 'Descripcion de la funcionalidad, observaciones y advertencias', '1', '1', '2020-09-02 12:56:18', '2021-01-16 20:32:18');
INSERT INTO `asistente` VALUES ('29', 'Feriados', '17', 'Descripcion de la tarea de especial cuidado para el funcionamiento del sistema\'', 'purple', '22', 'secretaria', 'Descripcion de la funcionalidad, observaciones y advertencias', '1', '1', '2020-09-02 12:56:43', '2021-01-16 20:32:17');
INSERT INTO `asistente` VALUES ('30', 'Tipo Agenda', '18', 'Descripcion de la tarea de especial cuidado para el funcionamiento del sistema\'', 'purple', '23', 'secretaria', 'Descripcion de la funcionalidad, observaciones y advertencias', '1', '1', '2020-09-02 12:57:00', '2021-01-16 20:32:17');
INSERT INTO `asistente` VALUES ('31', 'Tipo Actividad', '19', 'Descripcion de la tarea de especial cuidado para el funcionamiento del sistema\'', 'purple', '24', 'secretaria', 'Descripcion de la funcionalidad, observaciones y advertencias', '1', '1', '2020-09-02 12:57:29', '2021-01-16 20:32:17');
INSERT INTO `asistente` VALUES ('32', 'Agenda', '20', 'Descripcion de la tarea de especial cuidado para el funcionamiento del sistema\'', 'purple', '25', 'secretaria', 'Descripcion de la funcionalidad, observaciones y advertencias', '1', '1', '2020-09-02 12:57:43', '2021-01-16 20:32:17');
INSERT INTO `asistente` VALUES ('33', 'Bandeja Docente', '3', 'Calendario de actividades semanales, calendario de actividades del colegio, panel de funcionalidades', 'indigo', '1', 'docente', 'Descripcion de la funcionalidad, observaciones y advertencias', '1', '1', '2020-09-02 12:59:32', '2020-09-02 12:59:32');
INSERT INTO `asistente` VALUES ('34', 'Bandeja Alumno', '4', 'Calendario de actividades semanales, calendario de actividades del colegio, panel de funcionalidades', 'amber', '1', 'alumno', 'Descripcion de la funcionalidad, observaciones y advertencias', '1', '1', '2020-09-02 13:00:59', '2020-09-02 13:01:20');
INSERT INTO `asistente` VALUES ('35', 'Bandeja Acudiente', '5', 'Calendario de actividades semanales, calendario de actividades del colegio, panel de funcionalidades', 'light-green', '1', 'acudiente', 'Descripcion de la funcionalidad, observaciones y advertencias', '1', '1', '2020-09-02 13:02:14', '2020-09-02 13:02:14');

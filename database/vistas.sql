-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-09-2020 a las 17:13:33
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.3.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `classroom`
--

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_alumno`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vw_alumno` (
`nb_nombre` varchar(123)
,`tx_sexo` varchar(1)
,`fe_nacimiento` date
,`id_tipo_documento` int(11)
,`nb_tipo_documento` varchar(20)
,`tx_documento` varchar(12)
,`tx_lugar_nacimiento` varchar(30)
,`tx_nacionalidad` varchar(30)
,`tx_direccion` varchar(80)
,`id_departamento` int(11)
,`nb_departamento` varchar(30)
,`id_ciudad` int(11)
,`nb_ciudad` varchar(30)
,`tx_email` varchar(30)
,`tx_telefono` varchar(15)
,`tx_telefono2` varchar(15)
,`tx_telefono3` varchar(15)
,`nb_status` varchar(20)
,`id_status` int(11)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_alumno_acudiente`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vw_alumno_acudiente` (
`id_alumno` int(11)
,`nb_alumno` varchar(123)
,`tx_doc_alumno` varchar(12)
,`id_acudiente` int(11)
,`nb_acudiente` varchar(123)
,`tx_doc_acudiente` varchar(30)
,`id_parentesco` int(11)
,`nb_parentesco` varchar(20)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_alumno_matricula`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vw_alumno_matricula` (
`nb_nombre` varchar(123)
,`tx_sexo` varchar(1)
,`fe_nacimiento` date
,`id_tipo_documento` int(11)
,`nb_tipo_documento` varchar(20)
,`tx_documento` varchar(12)
,`tx_lugar_nacimiento` varchar(30)
,`tx_nacionalidad` varchar(30)
,`tx_direccion` varchar(80)
,`tx_email` varchar(30)
,`tx_telefono` varchar(15)
,`tx_telefono2` varchar(15)
,`tx_telefono3` varchar(15)
,`nb_status` varchar(20)
,`fe_matricula` date
,`nb_grupo` varchar(30)
,`id_grupo` int(10) unsigned
,`id_grado` int(10) unsigned
,`nb_grado` varchar(30)
,`id_tipo_condicion` int(10) unsigned
,`nb_tipo_condicion` varchar(30)
,`id_calendario` int(10) unsigned
,`nb_calendario` varchar(30)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_alumno_sin_matricula`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vw_alumno_sin_matricula` (
`nb_nombre` varchar(123)
,`tx_sexo` varchar(1)
,`fe_nacimiento` date
,`id_tipo_documento` int(11)
,`nb_tipo_documento` varchar(20)
,`tx_documento` varchar(12)
,`tx_lugar_nacimiento` varchar(30)
,`tx_nacionalidad` varchar(30)
,`tx_direccion` varchar(80)
,`id_departamento` int(11)
,`nb_departamento` varchar(30)
,`id_ciudad` int(11)
,`nb_ciudad` varchar(30)
,`tx_email` varchar(30)
,`tx_telefono` varchar(15)
,`tx_telefono2` varchar(15)
,`tx_telefono3` varchar(15)
,`nb_status` varchar(20)
,`id_status` int(11)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_docente`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vw_docente` (
`id` int(10) unsigned
,`nb_apellido` varchar(30)
,`nb_apellido2` varchar(30)
,`nb_nombre` varchar(30)
,`nb_nombre2` varchar(30)
,`id_tipo_documento` int(11)
,`tx_documento` varchar(12)
,`id_estado_civil` int(11)
,`tx_sexo` varchar(1)
,`fe_nacimiento` date
,`tx_nacionalidad` varchar(30)
,`tx_lugar_nacimiento` varchar(30)
,`tx_direccion` varchar(80)
,`id_departamento` int(11)
,`id_ciudad` int(11)
,`tx_email` varchar(30)
,`tx_telefono` varchar(15)
,`tx_telefono_movil` varchar(15)
,`nb_estado_civil` varchar(30)
,`nb_tipo_documento` varchar(20)
,`nb_departamento` varchar(30)
,`nb_ciudad` varchar(30)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_grado_materia`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vw_grado_materia` (
`id` int(10) unsigned
,`nb_grado` varchar(30)
,`nu_orden` int(11)
,`id_grado` int(11)
,`nb_materia` varchar(40)
,`id_materia` int(11)
,`co_codigo` varchar(20)
,`id_area_estudio` int(11)
,`nb_area_estudio` varchar(50)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_grupo`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vw_grupo` (
`nb_grupo` varchar(30)
,`nu_orden_grupo` int(11)
,`id_grado` int(11)
,`nb_grado` varchar(30)
,`nu_orden_grado` int(11)
,`id_nivel` int(11)
,`nb_nivel` varchar(20)
,`id_calendario` int(11)
,`nb_calendario` varchar(30)
,`id_turno` int(11)
,`nb_turno` varchar(30)
,`id_docente` int(11)
,`nb_docente` varchar(123)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_grupo_materia`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vw_grupo_materia` (
`id_grupo` int(11)
,`nb_grupo` varchar(30)
,`nu_orden` int(11)
,`id_materia` int(11)
,`nb_materia` varchar(40)
,`co_codigo_materia` varchar(20)
,`id_area_estudio` int(11)
,`nb_area_estudio` varchar(50)
,`id_calendario` int(11)
,`nb_calendario` varchar(30)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_materia`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vw_materia` (
`nb_materia` varchar(40)
,`co_materia` varchar(20)
,`id_area_estudio` int(11)
,`nb_area_estudio` varchar(50)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_usuario`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vw_usuario` (
`nb_nombres` varchar(80)
,`nb_usuario` varchar(50)
,`tx_email` varchar(80)
,`id_tipo_usuario` int(10) unsigned
,`nb_tipo_usuario` varchar(20)
,`id_status` int(10) unsigned
,`nb_status` varchar(20)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vw_usuario_perfil`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vw_usuario_perfil` (
`nb_nombres` varchar(80)
,`nb_usuario` varchar(50)
,`tx_email` varchar(80)
,`id_status` int(10) unsigned
,`nb_status` varchar(20)
,`id_secretaria` int(1)
,`nb_secretaria` varchar(2)
,`id_docente` int(1)
,`bo_docente` varchar(2)
,`id_alumno` int(1)
,`bo_alumno` varchar(2)
,`id_acudiente` int(1)
,`bo_acudiente` varchar(2)
,`id_empleado` int(1)
,`bo_empleado` varchar(2)
,`id_admin` int(1)
,`bo_admin` varchar(2)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_alumno`
--
DROP TABLE IF EXISTS `vw_alumno`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_alumno`  AS  select concat(`alumno`.`nb_apellido`,' ',`alumno`.`nb_apellido2`,' ',`alumno`.`nb_nombre`,' ',`alumno`.`nb_nombre2`) AS `nb_nombre`,`alumno`.`tx_sexo` AS `tx_sexo`,`alumno`.`fe_nacimiento` AS `fe_nacimiento`,`alumno`.`id_tipo_documento` AS `id_tipo_documento`,`tipo_documento`.`nb_tipo_documento` AS `nb_tipo_documento`,`alumno`.`tx_documento` AS `tx_documento`,`alumno`.`tx_lugar_nacimiento` AS `tx_lugar_nacimiento`,`alumno`.`tx_nacionalidad` AS `tx_nacionalidad`,`alumno`.`tx_direccion` AS `tx_direccion`,`alumno`.`id_departamento` AS `id_departamento`,`departamento`.`nb_departamento` AS `nb_departamento`,`alumno`.`id_ciudad` AS `id_ciudad`,`ciudad`.`nb_ciudad` AS `nb_ciudad`,`alumno`.`tx_email` AS `tx_email`,`alumno`.`tx_telefono` AS `tx_telefono`,`alumno`.`tx_telefono2` AS `tx_telefono2`,`alumno`.`tx_telefono3` AS `tx_telefono3`,`status`.`nb_status` AS `nb_status`,`alumno`.`id_status` AS `id_status` from ((((`alumno` join `status` on(`alumno`.`id_status` = `status`.`id`)) left join `departamento` on(`alumno`.`id_departamento` = `departamento`.`id`)) join `tipo_documento` on(`alumno`.`id_tipo_documento` = `tipo_documento`.`id`)) join `ciudad` on(`alumno`.`id_ciudad` = `ciudad`.`id`)) where `alumno`.`id_usuario` = 1 order by concat(`alumno`.`nb_apellido`,' ',`alumno`.`nb_apellido2`,' ',`alumno`.`nb_nombre`,' ',`alumno`.`nb_nombre2`) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_alumno_acudiente`
--
DROP TABLE IF EXISTS `vw_alumno_acudiente`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_alumno_acudiente`  AS  select `alumno_pariente`.`id_alumno` AS `id_alumno`,concat(`alumno`.`nb_apellido`,' ',`alumno`.`nb_apellido2`,' ',`alumno`.`nb_nombre`,' ',`alumno`.`nb_nombre2`) AS `nb_alumno`,`alumno`.`tx_documento` AS `tx_doc_alumno`,`alumno_pariente`.`id_pariente` AS `id_acudiente`,concat(`pariente`.`nb_apellido`,' ',`pariente`.`nb_apellido2`,' ',`pariente`.`nb_nombre`,' ',`pariente`.`nb_nombre2`) AS `nb_acudiente`,`pariente`.`tx_documento` AS `tx_doc_acudiente`,`pariente`.`id_parentesco` AS `id_parentesco`,`parentesco`.`nb_parentesco` AS `nb_parentesco` from (((`alumno_pariente` join `alumno` on(`alumno_pariente`.`id_alumno` = `alumno`.`id`)) join `pariente` on(`alumno_pariente`.`id_pariente` = `pariente`.`id`)) join `parentesco` on(`pariente`.`id_parentesco` = `parentesco`.`id`)) order by concat(`alumno`.`nb_apellido`,' ',`alumno`.`nb_apellido2`,' ',`alumno`.`nb_nombre`,' ',`alumno`.`nb_nombre2`) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_alumno_matricula`
--
DROP TABLE IF EXISTS `vw_alumno_matricula`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_alumno_matricula`  AS  select concat(`alumno`.`nb_apellido`,' ',`alumno`.`nb_apellido2`,' ',`alumno`.`nb_nombre`,' ',`alumno`.`nb_nombre2`) AS `nb_nombre`,`alumno`.`tx_sexo` AS `tx_sexo`,`alumno`.`fe_nacimiento` AS `fe_nacimiento`,`alumno`.`id_tipo_documento` AS `id_tipo_documento`,`tipo_documento`.`nb_tipo_documento` AS `nb_tipo_documento`,`alumno`.`tx_documento` AS `tx_documento`,`alumno`.`tx_lugar_nacimiento` AS `tx_lugar_nacimiento`,`alumno`.`tx_nacionalidad` AS `tx_nacionalidad`,`alumno`.`tx_direccion` AS `tx_direccion`,`alumno`.`tx_email` AS `tx_email`,`alumno`.`tx_telefono` AS `tx_telefono`,`alumno`.`tx_telefono2` AS `tx_telefono2`,`alumno`.`tx_telefono3` AS `tx_telefono3`,`status`.`nb_status` AS `nb_status`,`matricula`.`fe_matricula` AS `fe_matricula`,`grupo`.`nb_grupo` AS `nb_grupo`,`grupo`.`id` AS `id_grupo`,`grado`.`id` AS `id_grado`,`grado`.`nb_grado` AS `nb_grado`,`tipo_condicion`.`id` AS `id_tipo_condicion`,`tipo_condicion`.`nb_tipo_condicion` AS `nb_tipo_condicion`,`calendario`.`id` AS `id_calendario`,`calendario`.`nb_calendario` AS `nb_calendario` from (((((((`alumno` join `status` on(`alumno`.`id_status` = `status`.`id`)) join `tipo_documento` on(`alumno`.`id_tipo_documento` = `tipo_documento`.`id`)) join `matricula` on(`matricula`.`id_alumno` = `alumno`.`id`)) join `grado` on(`matricula`.`id_grado` = `grado`.`id`)) join `grupo` on(`grupo`.`id_grado` = `grado`.`id` and `matricula`.`id_grupo` = `grupo`.`id`)) join `tipo_condicion` on(`matricula`.`id_tipo_condicion` = `tipo_condicion`.`id`)) join `calendario` on(`matricula`.`id_calendario` = `calendario`.`id`)) where `alumno`.`id_usuario` = 1 and `calendario`.`id` = (select `colegio`.`id_calendario` from `colegio` where `colegio`.`id` = 1) order by concat(`alumno`.`nb_apellido`,' ',`alumno`.`nb_apellido2`,' ',`alumno`.`nb_nombre`,' ',`alumno`.`nb_nombre2`) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_alumno_sin_matricula`
--
DROP TABLE IF EXISTS `vw_alumno_sin_matricula`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_alumno_sin_matricula`  AS  select concat(`alumno`.`nb_apellido`,' ',`alumno`.`nb_apellido2`,' ',`alumno`.`nb_nombre`,' ',`alumno`.`nb_nombre2`) AS `nb_nombre`,`alumno`.`tx_sexo` AS `tx_sexo`,`alumno`.`fe_nacimiento` AS `fe_nacimiento`,`alumno`.`id_tipo_documento` AS `id_tipo_documento`,`tipo_documento`.`nb_tipo_documento` AS `nb_tipo_documento`,`alumno`.`tx_documento` AS `tx_documento`,`alumno`.`tx_lugar_nacimiento` AS `tx_lugar_nacimiento`,`alumno`.`tx_nacionalidad` AS `tx_nacionalidad`,`alumno`.`tx_direccion` AS `tx_direccion`,`alumno`.`id_departamento` AS `id_departamento`,`departamento`.`nb_departamento` AS `nb_departamento`,`alumno`.`id_ciudad` AS `id_ciudad`,`ciudad`.`nb_ciudad` AS `nb_ciudad`,`alumno`.`tx_email` AS `tx_email`,`alumno`.`tx_telefono` AS `tx_telefono`,`alumno`.`tx_telefono2` AS `tx_telefono2`,`alumno`.`tx_telefono3` AS `tx_telefono3`,`status`.`nb_status` AS `nb_status`,`alumno`.`id_status` AS `id_status` from ((((`alumno` join `status` on(`alumno`.`id_status` = `status`.`id`)) left join `departamento` on(`alumno`.`id_departamento` = `departamento`.`id`)) join `tipo_documento` on(`alumno`.`id_tipo_documento` = `tipo_documento`.`id`)) join `ciudad` on(`alumno`.`id_ciudad` = `ciudad`.`id`)) where !(`alumno`.`id` in (select `matricula`.`id_alumno` from `matricula` where `matricula`.`id_calendario` = (select `colegio`.`id_calendario` from `colegio` where `colegio`.`id` = 1))) order by concat(`alumno`.`nb_apellido`,' ',`alumno`.`nb_apellido2`,' ',`alumno`.`nb_nombre`,' ',`alumno`.`nb_nombre2`) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_docente`
--
DROP TABLE IF EXISTS `vw_docente`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_docente`  AS  select `docente`.`id` AS `id`,`docente`.`nb_apellido` AS `nb_apellido`,`docente`.`nb_apellido2` AS `nb_apellido2`,`docente`.`nb_nombre` AS `nb_nombre`,`docente`.`nb_nombre2` AS `nb_nombre2`,`docente`.`id_tipo_documento` AS `id_tipo_documento`,`docente`.`tx_documento` AS `tx_documento`,`docente`.`id_estado_civil` AS `id_estado_civil`,`docente`.`tx_sexo` AS `tx_sexo`,`docente`.`fe_nacimiento` AS `fe_nacimiento`,`docente`.`tx_nacionalidad` AS `tx_nacionalidad`,`docente`.`tx_lugar_nacimiento` AS `tx_lugar_nacimiento`,`docente`.`tx_direccion` AS `tx_direccion`,`docente`.`id_departamento` AS `id_departamento`,`docente`.`id_ciudad` AS `id_ciudad`,`docente`.`tx_email` AS `tx_email`,`docente`.`tx_telefono` AS `tx_telefono`,`docente`.`tx_telefono_movil` AS `tx_telefono_movil`,`estado_civil`.`nb_estado_civil` AS `nb_estado_civil`,`tipo_documento`.`nb_tipo_documento` AS `nb_tipo_documento`,`departamento`.`nb_departamento` AS `nb_departamento`,`ciudad`.`nb_ciudad` AS `nb_ciudad` from ((((`docente` join `estado_civil` on(`docente`.`id_estado_civil` = `estado_civil`.`id`)) join `tipo_documento` on(`docente`.`id_tipo_documento` = `tipo_documento`.`id`)) join `departamento` on(`docente`.`id_departamento` = `departamento`.`id`)) join `ciudad` on(`docente`.`id_ciudad` = `ciudad`.`id`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_grado_materia`
--
DROP TABLE IF EXISTS `vw_grado_materia`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_grado_materia`  AS  select `grado`.`id` AS `id`,`grado`.`nb_grado` AS `nb_grado`,`grado`.`nu_grado` AS `nu_orden`,`grado_materia`.`id_grado` AS `id_grado`,`materia`.`nb_materia` AS `nb_materia`,`grado_materia`.`id_materia` AS `id_materia`,`materia`.`co_materia` AS `co_codigo`,`materia`.`id_area_estudio` AS `id_area_estudio`,`area_estudio`.`nb_area_estudio` AS `nb_area_estudio` from (((`grado` join `grado_materia` on(`grado_materia`.`id_grado` = `grado`.`id`)) join `materia` on(`grado_materia`.`id_materia` = `materia`.`id`)) join `area_estudio` on(`materia`.`id_area_estudio` = `area_estudio`.`id`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_grupo`
--
DROP TABLE IF EXISTS `vw_grupo`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_grupo`  AS  select `grupo`.`nb_grupo` AS `nb_grupo`,`grupo`.`nu_orden` AS `nu_orden_grupo`,`grupo`.`id_grado` AS `id_grado`,`grado`.`nb_grado` AS `nb_grado`,`grado`.`nu_grado` AS `nu_orden_grado`,`grado`.`id_nivel` AS `id_nivel`,`nivel`.`nb_nivel` AS `nb_nivel`,`grupo`.`id_calendario` AS `id_calendario`,`calendario`.`nb_calendario` AS `nb_calendario`,`grupo`.`id_turno` AS `id_turno`,`turno`.`nb_turno` AS `nb_turno`,`grupo`.`id_docente` AS `id_docente`,concat(`docente`.`nb_nombre`,' ',`docente`.`nb_apellido2`,' ',`docente`.`nb_apellido`,' ',`docente`.`nb_nombre2`) AS `nb_docente` from (((((`grupo` join `grado` on(`grupo`.`id_grado` = `grado`.`id`)) join `nivel` on(`grado`.`id_nivel` = `nivel`.`id`)) join `calendario` on(`grupo`.`id_calendario` = `calendario`.`id`)) join `docente` on(`grupo`.`id_docente` = `docente`.`id`)) join `turno` on(`grupo`.`id_turno` = `turno`.`id`)) where `calendario`.`id` = (select `colegio`.`id_calendario` from `colegio` where `colegio`.`id` = 1) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_grupo_materia`
--
DROP TABLE IF EXISTS `vw_grupo_materia`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_grupo_materia`  AS  select `grupo_materia`.`id_grupo` AS `id_grupo`,`grupo`.`nb_grupo` AS `nb_grupo`,`grupo`.`nu_orden` AS `nu_orden`,`grupo_materia`.`id_materia` AS `id_materia`,`materia`.`nb_materia` AS `nb_materia`,`materia`.`co_materia` AS `co_codigo_materia`,`materia`.`id_area_estudio` AS `id_area_estudio`,`area_estudio`.`nb_area_estudio` AS `nb_area_estudio`,`grupo`.`id_calendario` AS `id_calendario`,`calendario`.`nb_calendario` AS `nb_calendario` from ((((`grupo_materia` join `materia` on(`grupo_materia`.`id_materia` = `materia`.`id`)) join `grupo` on(`grupo_materia`.`id_grupo` = `grupo`.`id`)) join `area_estudio` on(`materia`.`id_area_estudio` = `area_estudio`.`id`)) join `calendario` on(`grupo`.`id_calendario` = `calendario`.`id`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_materia`
--
DROP TABLE IF EXISTS `vw_materia`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_materia`  AS  select `materia`.`nb_materia` AS `nb_materia`,`materia`.`co_materia` AS `co_materia`,`materia`.`id_area_estudio` AS `id_area_estudio`,`area_estudio`.`nb_area_estudio` AS `nb_area_estudio` from (`materia` join `area_estudio`) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_usuario`
--
DROP TABLE IF EXISTS `vw_usuario`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_usuario`  AS  select `usuario`.`nb_nombres` AS `nb_nombres`,`usuario`.`nb_usuario` AS `nb_usuario`,`usuario`.`tx_email` AS `tx_email`,`usuario`.`id_tipo_usuario` AS `id_tipo_usuario`,`tipo_usuario`.`nb_tipo_usuario` AS `nb_tipo_usuario`,`usuario`.`id_status` AS `id_status`,`status`.`nb_status` AS `nb_status` from ((`usuario` join `tipo_usuario` on(`usuario`.`id_tipo_usuario` = `tipo_usuario`.`id`)) join `status` on(`usuario`.`id_status` = `status`.`id`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vw_usuario_perfil`
--
DROP TABLE IF EXISTS `vw_usuario_perfil`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_usuario_perfil`  AS  select `usuario`.`nb_nombres` AS `nb_nombres`,`usuario`.`nb_usuario` AS `nb_usuario`,`usuario`.`tx_email` AS `tx_email`,`usuario`.`id_status` AS `id_status`,`status`.`nb_status` AS `nb_status`,(select 1 from `usuario_perfil` `upe` where `upe`.`id_usuario` = `usuario`.`id` and `upe`.`id_perfil` = 1) AS `id_secretaria`,(select 'SI' from `usuario_perfil` `upe` where `upe`.`id_usuario` = `usuario`.`id` and `upe`.`id_perfil` = 1) AS `nb_secretaria`,(select 1 from `usuario_perfil` `upe` where `upe`.`id_usuario` = `usuario`.`id` and `upe`.`id_perfil` = 2) AS `id_docente`,(select 'SI' from `usuario_perfil` `upe` where `upe`.`id_usuario` = `usuario`.`id` and `upe`.`id_perfil` = 2) AS `bo_docente`,(select 1 from `usuario_perfil` `upe` where `upe`.`id_usuario` = `usuario`.`id` and `upe`.`id_perfil` = 3) AS `id_alumno`,(select 'SI' from `usuario_perfil` `upe` where `upe`.`id_usuario` = `usuario`.`id` and `upe`.`id_perfil` = 3) AS `bo_alumno`,(select 1 from `usuario_perfil` `upe` where `upe`.`id_usuario` = `usuario`.`id` and `upe`.`id_perfil` = 4) AS `id_acudiente`,(select 'SI' from `usuario_perfil` `upe` where `upe`.`id_usuario` = `usuario`.`id` and `upe`.`id_perfil` = 4) AS `bo_acudiente`,(select 1 from `usuario_perfil` `upe` where `upe`.`id_usuario` = `usuario`.`id` and `upe`.`id_perfil` = 4) AS `id_empleado`,(select 'SI' from `usuario_perfil` `upe` where `upe`.`id_usuario` = `usuario`.`id` and `upe`.`id_perfil` = 4) AS `bo_empleado`,(select 1 from `usuario_perfil` `upe` where `upe`.`id_usuario` = `usuario`.`id` and `upe`.`id_perfil` = 4) AS `id_admin`,(select 'SI' from `usuario_perfil` `upe` where `upe`.`id_usuario` = `usuario`.`id` and `upe`.`id_perfil` = 4) AS `bo_admin` from ((`usuario` join `tipo_usuario` on(`usuario`.`id_tipo_usuario` = `tipo_usuario`.`id`)) join `status` on(`usuario`.`id_status` = `status`.`id`)) ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

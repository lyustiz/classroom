/*
Navicat MySQL Data Transfer

Source Server         : desdecasa
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : classroom

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2020-12-06 01:27:38
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for accion_pagina
-- ----------------------------
DROP TABLE IF EXISTS `accion_pagina`;
CREATE TABLE `accion_pagina` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_accion_pagina` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `id_pagina` int(11) NOT NULL,
  `id_recurso` int(11) NOT NULL,
  `id_tipo_accion` int(11) NOT NULL,
  `tx_x_posicion` varchar(35) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `tx_y_posicion` varchar(35) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of accion_pagina
-- ----------------------------

-- ----------------------------
-- Table structure for accion_tema
-- ----------------------------
DROP TABLE IF EXISTS `accion_tema`;
CREATE TABLE `accion_tema` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_accion_tema` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `id_tema` int(11) NOT NULL,
  `id_recurso` int(11) NOT NULL,
  `id_tipo_accion` int(11) NOT NULL,
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of accion_tema
-- ----------------------------

-- ----------------------------
-- Table structure for actividad
-- ----------------------------
DROP TABLE IF EXISTS `actividad`;
CREATE TABLE `actividad` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_actividad` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `id_tema` int(11) NOT NULL,
  `tx_descripcion` varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of actividad
-- ----------------------------
INSERT INTO `actividad` VALUES ('18', 'Mi medio ambiente', '74', 'Todos los seres vivos tienen un lugar para vivir y desarrollarse. Por ejemplo, tú tienes un lugar determinado para vivir y estableces diferentes tipos de relaciones con los organismos y elementos que te rodean.\nEl conocimiento de las relaciones que se dan entre los seres vivos y su ambiente viene de tiempos remotos. Los seres humanos primitivos manifestaron este interés. Ellos, al depender de la caza, la pesca y la recolección de frutas, necesitaban observar cuidadosamente su entorno. Las pinturas rupestres son una manifestación del conocimiento que el ser humano primitivo tenía acerca de los animales de su medio. Algunas pinturas describen en forma detallada a los animales de cuya caza el ser humano dependía. El dominio de ciertas especies por medio de la domesticación es otra manifestación del conocimiento del ser humano sobre su entorno.', null, '1', '1', '2020-11-26 17:47:26', '2020-11-26 17:47:26');
INSERT INTO `actividad` VALUES ('20', 'El ecosistema', '74', 'El ecosistema es el conjunto de seres vivos de un lugar, el ambiente que lo rodea\ny las relaciones que se establecen entre ellos. Al observar cualquier ecosistema encontramos diversidad de plantas, animales y condiciones del lugar como el aire, el suelo y la humedad. Por ejemplo, en el ejercicio anterior describiste los elementos que conforman el lugar donde vives y las relaciones que se dan entre esos elementos, es decir, describiste un ecosistema. Podemos definir entonces el ecosistema como el lugar donde se establecen relaciones entre los seres vivos y los seres no vivos.', null, '1', '1', '2020-11-26 17:47:26', '2020-11-26 17:47:26');
INSERT INTO `actividad` VALUES ('39', 'Solidos', '57', 'Un solidos es materia que tiene forma y tamaño propio, los solidos ocupan espacio y tienen masa. Las partículas en la materia sólida están muy juntas y muy ordenadas.\nEl volumen de los sólidos no puede comprimirse. Las partículas están tan próximas las unas de las otras, que no pueden acercarse más. Esto explica que no pueda comprimirse la materia sólida. La forma: las partículas de la materia sólida están tan unidas entre sí y con tanta fuerza que es muy difícil separarlas. Para poder separar la materia sólida necesitaré una fuerza externa como por ejemplo, golpear con un martillo', null, '1', '1', '2020-11-26 17:47:26', '2020-12-05 23:01:13');
INSERT INTO `actividad` VALUES ('40', 'Liquidos', '57', 'La materia en estado liquido, como el agua que bebemos ,no tiene forma propia,  si no que se adapta a la del recipiente que la contiene,pero mantiene su volumen. Los líquidos no se pueden comprimir y su volumen es constante, pero al aumentar la temperatura se incrementa la movilidad de las partículas, aumenta la distancia que las separa, produciéndose una cierta dilatación.', null, '1', '1', '2020-11-26 17:47:26', '2020-11-26 17:47:26');
INSERT INTO `actividad` VALUES ('41', 'Hablemos de los alimentos', '58', 'Los alimentos son esenciales para vivir. Los necesitamos para crecer, levantarnos por la mañana y estar sanos, por ello es tan importante alimentarse bien. Esta alimentación ha de ser variada y proporcional. La alimentación debe tomarse muy en serio ya que de ella dependemos para estar sanos y poder vivir muchos años.', null, '1', '1', '2020-11-26 17:47:26', '2020-11-26 17:47:26');
INSERT INTO `actividad` VALUES ('42', 'Los alimentos según su origen', '58', 'Los alimentos son todo aquello que comemos y bebemos. Es importante para nuestro cuerpo alimentarse varias veces al día, por eso si dejamos de hacerlo, sentiremos sed o hambre. Los alimentos permiten desarrollarnos físicamente, mantener nuestro cuerpo sano, mantener el calor del cuerpo, sustituir sustancias gastadas o estropeadas por otras nuevas y movernos, estudiar, hablar…', null, '1', '1', '2020-11-26 17:47:26', '2020-11-26 17:47:26');
INSERT INTO `actividad` VALUES ('43', 'Los cambios en la mujer', '60', 'Estos son los cambios que van experimentando las niñas a lo largo de la pubertad:\n\nLos senos se les empiezan a desarrollar y se les redondean las caderas.\nSe inicia la aceleración de su ritmo de crecimiento en estatura.\nEl vello púbico les empieza aparecer, generalmente entre 6 y 12 meses después de que se inicie el desarrollo de los senos.\nEl útero y la vagina, así como los labios y el clítoris, aumentan de tamaño.\nEl vello púbico ya está bien establecido y los senos les crecen más.\nEl ritmo de crecimiento en estatura alcanza su pico máximo cuando hace en torno a 2 años que se ha iniciado la pubertad.\nLa menstruación empieza casi siempre después de que hayan alcanzado su pico máximo en estatura (la edad promedio son los 12,5 años)', null, '1', '1', '2020-11-26 17:47:26', '2020-11-26 17:47:26');
INSERT INTO `actividad` VALUES ('44', 'Los cambios en el hombre', '60', 'Los niños empiezan a presentar los primeros cambios físicos de la pubertad cuando tienen entre 10 y 16 años de edad. Tienden a crecer más deprisa entre los 12 y los 15 años. En los niños, el estirón ocurre, como promedio, unos 2 años después que en las niñas. Cuando cumplen 16 años, la mayoría de los muchachos ya han dejado de crecer, pero sus músculos se seguirán desarrollando.\n\nOtros cambios propios de la pubertad en los muchachos son los siguientes:\n\nEl pene y los testículos aumentan de tamaño.\nAparece el vello púbico, seguido de vello axilar y facial.\nLa voz se les oscurece o vuelve más grave, a veces se les puede quebrar la voz.\nLa nuez, o cartílago de la laringe, les aumenta de tamaño.\nSus testículos empiezan a fabricar esperma.', null, '1', '1', '2020-11-26 17:47:26', '2020-11-26 17:47:26');
INSERT INTO `actividad` VALUES ('45', '¿Qué es un elemento y qué es un compuesto?', '62', 'Un elemento es un material compuesto de un simple tipo de átomo, un compuesto es una sustancia formada por dos o más elementos que se combinan químicamente', null, '1', '1', '2020-11-26 17:47:26', '2020-11-26 17:47:26');
INSERT INTO `actividad` VALUES ('46', '¿Qué es una mezcla?', '62', 'una mezcla es la combinación de sustancias, iguales o no, que pueden ser separadas por métodos físicos', null, '1', '1', '2020-11-26 17:47:26', '2020-11-26 17:47:26');
INSERT INTO `actividad` VALUES ('47', '¿De dónde proviene la energía?', '64', 'Aquí en la Tierra la principal fuente de energía es el sol. Esta energía que nos llega del Sol, se puede aprovechar de diversas maneras. La acción directa de los rayos del Sol sobre la atmósfera crea diferencias de temperaturas que originan los vientos, las olas y la lluvia. Todas éstas son fuentes de energía directa del Sol, y se denominan: eólica (cuando proviene del viento), hidráulica (cuando proviene del agua), solar térmica (cuando se aprovecha el calor de los rayos que provienen del Sol), y solar fotovoltaica (cuando se transforma la luz solar en electricidad).', null, '1', '1', '2020-11-26 17:47:26', '2020-11-26 17:47:26');
INSERT INTO `actividad` VALUES ('48', '¿Podemos crear energía?', '64', 'si se logra utilizando fuentes renovables como el sol, el agua, la tierra, el viento y los desperdicios orgánicos. De esta manera, contribuyen a disminuir la contaminación, conservar los recursos naturales, son sostenibles y ofrecen una mejor calidad de vida a sus habitantes.', null, '1', '1', '2020-11-26 17:47:26', '2020-11-26 17:47:26');
INSERT INTO `actividad` VALUES ('51', 'El átomo', '68', 'El átomo es la partícula más pequeña de un cuerpo que conserva las propiedades de éste. La materia está constituida por átomos los cuales pueden unirse para formar moléculas; por ejemplo, una molécula de agua está formada por dos átomos de hidrógeno y uno de oxígeno. Es decir, las moléculas de todas las sustancias están constituidas por átomos.\nPero, conocer la estructura del átomo ha sido una inquietud del ser humano a través de la historia; los científicos han realizado muchos estudios y experimentos y plantearon diversas teorías para tratar de comprender y describir la naturaleza del átomo.', null, '1', '1', '2020-11-26 17:47:26', '2020-11-26 17:47:26');
INSERT INTO `actividad` VALUES ('52', 'Masa atómica y masa molecular', '68', 'Masa atómica\nDebido al tamaño extremadamente diminuto de los átomos, es imposible determinar su masa individual en una balanza. Los átomos son tan pequeños que para expresar su masa en gramos se recurre a fracciones de la unidad que tienen demasiados ceros a la derecha después de la coma. Por ejemplo, un átomo de carbono 12 tiene una masa real de 0.00000000000000000000002 g. Para evitar esta situación y facilitar el manejo de los valores de las masas atómicas, se estableció una unidad de masa, mucho más pequeña que el gramo y se le dio el nombre de unidad de masa atómica (uma), que se define como la doceava parte de la masa de un átomo de carbono 12. Es decir que el átomo de carbono tiene una masa de 12 uma. En esta escala, por ejemplo, la masa atómica del hidrógeno es 1 uma y del oxígeno 16 uma.', null, '1', '1', '2020-11-26 17:47:26', '2020-11-26 17:47:26');
INSERT INTO `actividad` VALUES ('53', 'Reproducción celular', '70', 'Todos los organismos, desde el más simple como la ameba, hasta los más complejos (caballos, plantas, seres humanos), tienen necesidades que deben satisfacer como seres biofísicos y de este modo pueden asegurar su existencia y sobrevivir. Para responder a las exigencias tanto del medio interno como del medio externo, los seres vivos cuentan con diferentes tipos de estructuras que les ayudan a desempeñar sus funciones y a adoptar comportamientos.', null, '1', '1', '2020-11-26 17:47:26', '2020-11-26 17:47:26');
INSERT INTO `actividad` VALUES ('54', 'Reproducción asexual y sexual', '70', 'Todos los organismos vivos presentan como característica común producir descendientes, lo que hacen a través de un proceso llamado reproducción.\nEl objetivo fundamental de la reproducción es la duplicación autocontrolada de las estructuras y funciones de dichos seres vivos. Sin embargo, no solo para eso se lleva a cabo\nla reproducción. También se realiza cuando los organismos desean reparar tejidos dañados o formar órganos nuevos. La reproducción puede ser sexual cuando tiene por objeto formar células sexuales (conocidas como gametos) tanto masculinas como femeninas mediante el proceso de la meiosis. Este proceso se lleva a cabo en los órganos sexuales, tales como los testículos, ovarios de las hembras, los ovarios de las flores, estambres y otros tipos de estructuras especializadas en otras plantas y otros animales. Y la reproducción también puede ser asexual, que sucede de manera rápida y no requiere la presencia de gametos.', null, '1', '1', '2020-11-26 17:47:26', '2020-11-26 17:47:26');
INSERT INTO `actividad` VALUES ('55', 'Regulación del Ph', '72', 'El pH es la relación entre iones de hidrógeno (H+) y iones hidróxilo (OH-) en una solución. Se dice que el pH es ácido cuando los iones H+ se encuentran en mayor proporción que los iones OH- ; que el pH es básico o alcalino cuando ocurre lo contrario, es decir, que los iones OH- se encuentran en mayor proporción, y que el pH es neutro cuando los dos tipos de iones se encuentran en proporciones iguales en la solución.', null, '1', '1', '2020-11-26 17:47:26', '2020-11-26 17:47:26');
INSERT INTO `actividad` VALUES ('56', 'Sustancias amortiguadoras', '72', 'Como decíamos anteriormente, el pH es una característica de tipo químico que presentan las sustancias; muchos de los procesos biológicos se realizan a un pH determinado y su alteración puede ocasionar traumatismos en un organismo; por lo tanto, los cuerpos tienen sustancias tampón o sustancias amortiguadoras cuya función es regular el pH; cuando este se vuelve ácido las sustancias amortiguadoras lo elevan y si está muy básico, se encargan de disminuirlo.\n\nExisten varios mecanismos íntimamente ligados a la regulación del pH, que son los sistemas buffer de los líquidos corporales, procesos mediante los cuales los riñones y los pulmones llevan a cabo sus funciones. Los sistemas buffer Son sustancias que tienen la función de aceptar o liberar átomos o moléculas y que permiten estabilizar el pH interno en un organismo. Algunas sustancias que el organismo utiliza para regular el pH son: el ión bicarbonato, el ión fosfato, la hemoglobina y los sistemas combinados, como cuando intervienen el ión fosfato y la hemoglobina al mismo tiempo.', null, '1', '1', '2020-11-26 17:47:26', '2020-11-26 17:47:26');
INSERT INTO `actividad` VALUES ('57', 'Este soy yo', '2', 'No solo los rasgos físicos te definen, también tus gustos y tu forma de ser es algo que te hace diferente a los demás, en la manera de cómo te comportas o reaccionas a las cosas. Hay personas muy calladas, otras muy alegres, a algunas les cuesta trabajo hacer amigos y a otras les resulta muy fácil, algunas se enojan más fácilmente, y otras son muy amables y cariñosas.\nPuede ser que coincidas en gustos con otras personas, pero siempre hay algo que los diferencia. Saber que te gusta y que no te gusta hacer, te permite conocerte a ti mismo.', null, '1', '1', null, null);
INSERT INTO `actividad` VALUES ('58', 'Organizaciones sociales', '3', 'La familia es el grupo de personas que comparte un mismo hogar, unidos por el cariño y por lazos de parentesco. En nuestra familia aprendemos valores y crecemos con buenos ejemplos.\nLa familia constituye la unidad básica de la sociedad, la familia es un conjunto de personas unidas por vínculos afectivos de parentesco, por matrimonio o adopción que viven junto en armonía.', null, '1', '1', null, null);
INSERT INTO `actividad` VALUES ('59', 'El paisaje geográfico', '41', 'Un paisaje geográfico es el área visible y natural de un territorio cualquiera. Está conformado por el terreno junto con todas sus formas, sus características naturales y sus atributos. Un buen paisaje suele integrarse de manera armoniosa con cualquier estructura creada por el hombre que esté presente en su extensión.', null, '1', '1', null, null);
INSERT INTO `actividad` VALUES ('60', 'El clima y el paisaje', '41', 'El paisaje es un factor decisivo en el clima de muchas regiones. La altitud refresca la temperatura y enfría las masas de aire, debido al mencionado gradiente adiabático térmico vertical negativo.', null, '1', '1', null, null);
INSERT INTO `actividad` VALUES ('61', 'Las expresiones de la cultura', '43', 'Las expresiones culturales tradicionales son también denominadas expresiones de folclor, pues representan todo lo que identifica a una sociedad con las raíces de sus antepasados. Incluyen los nombres de las personas y las expresiones musicales, artísticas y bailes, así como ceremonias o incluso la arquitectura de los edificios de un país.\n\nEstas expresiones representan las características culturales y sociales de una nación o sociedad, lo que las convierte en patrimonio cultural. Si bien en algunos casos el término se usa para definir tradiciones pertenecientes a culturas indígenas o civilizaciones antiguas, es más comúnmente acuñado para referirse al folclor de cada país.', null, '1', '1', null, null);
INSERT INTO `actividad` VALUES ('62', 'Mitos, costumbres y tradiciones', '43', 'Los mitos son relatos tradicionales de acontecimientos asombrosos, cuyos protagonistas son seres sobrenaturales o extraordinarios, tales como dioses, semidioses, héroes o monstruos. \n\nLas costumbres de un país, de una región o de una comunidad son muy importantes, a través de ellas podemos aprender acerca de hábitos, prácticas y actividades de un grupo social. \n\nLas tradiciones son legados o herencias de nuestros antepasados que se han conservado a lo largo del tiempo porque son aprendidas de generación en generación al ser consideradas valiosas para preservar la pertenencia y el vínculo a una comunidad.', null, '1', '1', null, null);
INSERT INTO `actividad` VALUES ('63', 'Las regiones naturales de Colombia', '45', 'Las regiones naturales son cada una de las zonas geográficas de un país o continente, que cuentan con características similares en cuanto a relieve, clima, vegetación y clases de suelo.\n\nColombia cuenta con seis regiones naturales que se definen por las características del relieve, la distancia al mar, el promedio de lluvias y las condiciones del suelo. Esas regiones son: amazonia, andina, Caribe, Insular, Pacífica y orinoquía.', null, '1', '1', null, null);
INSERT INTO `actividad` VALUES ('64', 'Las regiones naturales del mundo', '45', '8 regiones naturales del mundo\nLas regiones naturales se clasifican en sabana, bosque, desierto, tundra, praderas o pastizales, selva, región ecuatorial y región mediterránea.\n\nSe conoce como región natural, aquel espacio que presenta características físicas muy peculiares, las cuales, lo definen conforme a la fauna, flora, clima y el propio ecosistema presente.\n\nEs de apreciar, que cada región natural presenta sus aspectos bien definidos, que lo permiten distinguirse unos de otros, haciendo de estos, unos espacios naturales con características propias:\n\nRegión ecuatorial.\nDe pastizales tropicales sabana. \nRegión de bosque tropical caducifolio.\nDesiertos Tropicales.\nRegión mediterránea.\nRegión del margen este tipo de China\nDesiertos de latitud media tierras de estepa\nMárgenes orientales o tipo St Lawrence.', null, '1', '1', null, null);
INSERT INTO `actividad` VALUES ('65', 'El trabajo', '47', 'Como trabajo denominamos al conjunto de actividades que son realizadas con el objetivo de alcanzar una meta, solucionar un problema o producir bienes y servicios para atender las necesidades humanas.\n\nCon el paso del tiempo, el uso de la palabra se amplió para referirse a una actividad que causara dolor físico y se asoció al trabajo en el campo, pero su uso se extendió a otras actividades humanas.\n\nGracias al trabajo el ser humano comienza a conquistar su propio espacio, así como el respeto y la consideración de los demás, lo cual además contribuye a su autoestima, satisfacción personal y realización profesional, sin contar con el aporte que hace a la sociedad.\n\nEl significado de trabajo tiene enfoques en diversas áreas, como la economía, la física, la filosofía, etc.', null, '1', '1', null, null);
INSERT INTO `actividad` VALUES ('66', 'El dinero y el intercambio económico', '47', 'El dinero juega un papel fundamental en las economías basadas en el intercambio a través de los mercados. Si se piensa en la enorme cantidad de intercambios comerciales que se realizan diariamente, se aprecia de inmediato la utilidad del dinero para que estas transacciones se hagan de manera satisfactoria.\n\nEl dinero es todo medio de cambio generalmente aceptado por la sociedad\n\nEl dinero, por tanto, es aquello que utilizamos para realizar pagos, cuando compramos, y cobros, cuando vendemos. Pero, ¿y si no existiera el dinero? En ese caso nos veríamos obligados a intercambiar unos bienes por otros, es decir, a practicar el trueque.', null, '1', '1', null, null);

-- ----------------------------
-- Table structure for actividad_grupo
-- ----------------------------
DROP TABLE IF EXISTS `actividad_grupo`;
CREATE TABLE `actividad_grupo` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_actividad` int(11) NOT NULL,
  `id_grupo` int(11) NOT NULL,
  `fe_inicio` date NOT NULL,
  `fe_fin` date DEFAULT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of actividad_grupo
-- ----------------------------

-- ----------------------------
-- Table structure for actividad_pregunta
-- ----------------------------
DROP TABLE IF EXISTS `actividad_pregunta`;
CREATE TABLE `actividad_pregunta` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_pregunta` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nb_descripcion` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_actividad` int(11) NOT NULL,
  `id_tipo_pregunta` int(11) NOT NULL,
  `bo_opcional` tinyint(1) NOT NULL DEFAULT 0,
  `nu_valor` decimal(8,2) NOT NULL DEFAULT 0.00,
  `nu_orden` int(11) NOT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=136 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of actividad_pregunta
-- ----------------------------
INSERT INTO `actividad_pregunta` VALUES ('103', 'Pepín se pregunta: “si tengo $5,000 ¿alcanzo a pagar la deuda?”.', 'Pepín intenta dar solución a su problema:\r\nTiene una deuda de $8,000 (ocho mil pesos) y para pagarla, sólo cuenta con $5,000 (cinco mil pesos).', '1', '3', '0', '0.00', '0', null, '1', '1', '2020-10-27 14:48:18', '2020-10-29 17:18:03');
INSERT INTO `actividad_pregunta` VALUES ('104', 'Indica cuál de los siguientes números es entero (E) y cuál decimal (D):', 'gergeete', '1', '2', '0', '0.00', '0', null, '1', '1', '2020-10-27 15:09:02', '2020-10-29 14:04:40');
INSERT INTO `actividad_pregunta` VALUES ('110', '¿Cuales de los siguente son los sentidos?', 'Por  ejemplo, pueden reconocer  las  orejas como responsables de  la audición,  pero  no  el  oído  y  la  boca  como  responsable  del  gusto pero  no  la  lengua.', '5', '3', '0', '0.00', '0', null, '1', '1', '2020-10-29 20:56:01', '2020-10-30 17:58:32');
INSERT INTO `actividad_pregunta` VALUES ('111', 'pregunta 1', 'descrip', '2', '3', '0', '0.00', '0', null, '1', '1', '2020-11-05 20:23:21', '2020-11-05 20:25:04');
INSERT INTO `actividad_pregunta` VALUES ('112', 'rwerwr', 'wrwr', '17', '3', '0', '0.00', '0', null, '1', '1', '2020-11-16 18:30:07', '2020-11-16 18:30:07');
INSERT INTO `actividad_pregunta` VALUES ('113', 'El medio ambiente es?', null, '18', '2', '0', '0.00', '0', null, '1', '1', '2020-11-26 17:49:17', '2020-11-26 17:49:17');
INSERT INTO `actividad_pregunta` VALUES ('114', 'La interacción de una comunidad de organismos con su ambiente.', null, '20', '2', '0', '0.00', '0', null, '1', '1', '2020-11-26 17:56:15', '2020-11-26 17:56:15');
INSERT INTO `actividad_pregunta` VALUES ('115', 'Un estado físico de la materia es:', null, '39', '2', '0', '0.00', '0', null, '1', '1', '2020-12-05 22:57:27', '2020-12-05 22:57:27');
INSERT INTO `actividad_pregunta` VALUES ('116', 'Una característica interna de los líquidos es:', null, '40', '2', '0', '0.00', '0', null, '1', '1', '2020-12-05 23:02:04', '2020-12-05 23:02:04');
INSERT INTO `actividad_pregunta` VALUES ('117', '¿De que están compuestos todos los alimentos?', null, '41', '2', '0', '0.00', '0', null, '1', '1', '2020-12-06 00:04:10', '2020-12-06 00:04:10');
INSERT INTO `actividad_pregunta` VALUES ('118', '¿Los huevos según su origen pertenecen a ?', null, '42', '2', '0', '0.00', '0', null, '1', '1', '2020-12-06 00:06:54', '2020-12-06 00:06:54');
INSERT INTO `actividad_pregunta` VALUES ('119', 'La vida de una persona comienza', null, '43', '2', '0', '0.00', '0', null, '1', '1', '2020-12-06 00:10:41', '2020-12-06 00:10:41');
INSERT INTO `actividad_pregunta` VALUES ('120', 'Todos los seres vivos', null, '44', '2', '0', '0.00', '0', null, '1', '1', '2020-12-06 00:13:37', '2020-12-06 00:13:37');
INSERT INTO `actividad_pregunta` VALUES ('121', 'Identifica si la siguiente imagen corresponde a un elemento o a un compuesto', null, '45', '2', '0', '0.00', '0', null, '1', '1', '2020-12-06 01:51:16', '2020-12-06 01:59:21');
INSERT INTO `actividad_pregunta` VALUES ('122', '¿Cómo clasificas el agua de mar?', null, '46', '2', '0', '0.00', '0', null, '1', '1', '2020-12-06 02:00:46', '2020-12-06 02:00:46');
INSERT INTO `actividad_pregunta` VALUES ('123', '¿A qué se denomina energía?', null, '47', '2', '0', '0.00', '0', null, '1', '1', '2020-12-06 02:23:14', '2020-12-06 02:23:14');
INSERT INTO `actividad_pregunta` VALUES ('124', 'Todo proceso que ocurre en el universo implica', null, '48', '2', '0', '0.00', '0', null, '1', '1', '2020-12-06 02:32:21', '2020-12-06 02:32:21');
INSERT INTO `actividad_pregunta` VALUES ('126', 'Según el modelo de Rutherford, en el núcleo hay:', null, '51', '2', '0', '0.00', '0', null, '1', '1', '2020-12-06 03:14:56', '2020-12-06 03:14:56');
INSERT INTO `actividad_pregunta` VALUES ('127', '¿Cuántas partículas están presentes en un mol de partículas?', null, '52', '2', '0', '0.00', '0', null, '1', '1', '2020-12-06 03:17:29', '2020-12-06 03:17:29');
INSERT INTO `actividad_pregunta` VALUES ('128', 'Proceso vital por el cual se perpetúa la vida y se conservan las especies se llaman:', null, '53', '2', '0', '0.00', '0', null, '1', '1', '2020-12-06 03:39:40', '2020-12-06 03:39:40');
INSERT INTO `actividad_pregunta` VALUES ('129', 'La reproducción sucede solo cuando existe una pareja de una especie.', null, '54', '2', '0', '0.00', '0', null, '1', '1', '2020-12-06 03:42:33', '2020-12-06 03:42:33');
INSERT INTO `actividad_pregunta` VALUES ('130', 'El rango de menos de 7 a cero corresponde a sustancias con caracter', null, '55', '2', '0', '0.00', '0', null, '1', '1', '2020-12-06 03:58:04', '2020-12-06 03:58:04');
INSERT INTO `actividad_pregunta` VALUES ('131', 'un ejemplo de solución amortiguadora es', null, '56', '2', '0', '0.00', '0', null, '1', '1', '2020-12-06 04:00:35', '2020-12-06 04:00:35');
INSERT INTO `actividad_pregunta` VALUES ('132', 'Son mis características físicas', null, '57', '3', '0', '0.00', '0', null, '1', '1', '2020-12-06 05:01:14', '2020-12-06 05:04:40');
INSERT INTO `actividad_pregunta` VALUES ('133', '¿ Cuál es la primera organización social a la que pertenecemos?', null, '58', '2', '0', '0.00', '0', null, '1', '1', '2020-12-06 05:10:31', '2020-12-06 05:10:31');
INSERT INTO `actividad_pregunta` VALUES ('134', 'Es la ciencia que estudia el paisaje geográfico', null, '59', '2', '0', '0.00', '0', null, '1', '1', '2020-12-06 05:18:37', '2020-12-06 05:18:37');
INSERT INTO `actividad_pregunta` VALUES ('135', 'Aquellas condiciones atmosféricas permanentes de un lugar que caracterizan su paisaje son:', null, '60', '2', '0', '0.00', '0', null, '1', '1', '2020-12-06 05:21:53', '2020-12-06 05:21:53');

-- ----------------------------
-- Table structure for actividad_respuesta
-- ----------------------------
DROP TABLE IF EXISTS `actividad_respuesta`;
CREATE TABLE `actividad_respuesta` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_respuesta` varchar(600) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_actividad_pregunta` int(11) NOT NULL,
  `bo_correcta` tinyint(1) NOT NULL,
  `nu_valor` decimal(8,2) DEFAULT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=299 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of actividad_respuesta
-- ----------------------------
INSERT INTO `actividad_respuesta` VALUES ('185', 'Respuesta 1', '103', '0', null, null, '1', '1', '2020-10-29 00:00:45', '2020-10-29 16:37:17');
INSERT INTO `actividad_respuesta` VALUES ('186', 'Respuesta 2', '103', '0', null, null, '1', '1', '2020-10-29 00:20:30', '2020-10-29 16:38:17');
INSERT INTO `actividad_respuesta` VALUES ('187', 'Respuesta 1', '104', '0', null, null, '1', '1', '2020-10-29 13:03:28', '2020-10-29 17:17:07');
INSERT INTO `actividad_respuesta` VALUES ('193', 'Respuesta 3', '103', '1', null, null, '1', '1', '2020-10-29 13:56:14', '2020-10-29 17:16:55');
INSERT INTO `actividad_respuesta` VALUES ('205', 'Respuesta 2', '104', '1', null, null, '1', '1', '2020-10-29 17:08:53', '2020-10-29 17:17:14');
INSERT INTO `actividad_respuesta` VALUES ('210', 'Oido', '110', '1', null, null, '1', '1', '2020-10-29 20:56:11', '2020-10-31 13:38:12');
INSERT INTO `actividad_respuesta` VALUES ('211', 'Vista', '110', '1', null, null, '1', '1', '2020-10-29 20:56:16', '2020-10-30 17:58:56');
INSERT INTO `actividad_respuesta` VALUES ('212', 'Tacto', '110', '1', null, null, '1', '1', '2020-10-29 20:56:22', '2020-10-30 17:59:34');
INSERT INTO `actividad_respuesta` VALUES ('213', 'Gusto', '110', '1', null, null, '1', '1', '2020-10-30 17:59:16', '2020-10-30 17:59:16');
INSERT INTO `actividad_respuesta` VALUES ('214', 'Corazon', '110', '0', null, null, '1', '1', '2020-10-30 17:59:54', '2020-10-30 17:59:59');
INSERT INTO `actividad_respuesta` VALUES ('215', 'respuesta 1', '111', '1', null, null, '1', '1', '2020-11-05 20:23:37', '2020-11-05 20:23:37');
INSERT INTO `actividad_respuesta` VALUES ('216', 'respuesta 2', '111', '1', null, null, '1', '1', '2020-11-05 20:23:44', '2020-11-05 20:25:07');
INSERT INTO `actividad_respuesta` VALUES ('218', '64363', '112', '0', null, null, '1', '1', '2020-11-16 18:32:56', '2020-11-16 18:32:56');
INSERT INTO `actividad_respuesta` VALUES ('219', 'gdfgdgdfg', '112', '1', null, null, '1', '1', '2020-11-16 18:33:26', '2020-11-16 18:33:29');
INSERT INTO `actividad_respuesta` VALUES ('220', 'Un lugar alejado', '113', '0', null, null, '1', '1', '2020-11-26 17:49:39', '2020-11-26 17:50:23');
INSERT INTO `actividad_respuesta` VALUES ('221', 'Un lugar en el medio de la ciudad', '113', '0', null, null, '1', '1', '2020-11-26 17:50:08', '2020-11-26 17:50:23');
INSERT INTO `actividad_respuesta` VALUES ('222', 'El medio que nos rodea, puede ser en espacio cerrado o abierto', '113', '1', null, null, '1', '1', '2020-11-26 17:50:23', '2020-11-26 17:50:23');
INSERT INTO `actividad_respuesta` VALUES ('223', 'Un Ecosistema', '114', '1', null, null, '1', '1', '2020-11-26 17:57:03', '2020-11-26 17:57:27');
INSERT INTO `actividad_respuesta` VALUES ('224', 'Los Factores Bióticos', '114', '0', null, null, '1', '1', '2020-11-26 17:57:12', '2020-11-26 17:57:27');
INSERT INTO `actividad_respuesta` VALUES ('225', 'La cadena alimentaria', '114', '0', null, null, '1', '1', '2020-11-26 17:57:21', '2020-11-26 17:57:27');
INSERT INTO `actividad_respuesta` VALUES ('226', 'Solido', '115', '1', null, null, '1', '1', '2020-12-05 22:57:50', '2020-12-05 22:57:50');
INSERT INTO `actividad_respuesta` VALUES ('227', 'Fución.', '115', '0', null, null, '1', '1', '2020-12-05 22:58:01', '2020-12-05 22:58:01');
INSERT INTO `actividad_respuesta` VALUES ('228', 'Vaporización.', '115', '0', null, null, '1', '1', '2020-12-05 22:58:10', '2020-12-05 22:58:10');
INSERT INTO `actividad_respuesta` VALUES ('229', 'Masa constante', '116', '1', null, null, '1', '1', '2020-12-05 23:02:19', '2020-12-05 23:03:06');
INSERT INTO `actividad_respuesta` VALUES ('230', 'Espacios intermusculares menores que en los sólidos', '116', '0', null, null, '1', '1', '2020-12-05 23:02:36', '2020-12-05 23:03:06');
INSERT INTO `actividad_respuesta` VALUES ('231', 'No posen volumen definido', '116', '0', null, null, '1', '1', '2020-12-05 23:02:55', '2020-12-05 23:03:06');
INSERT INTO `actividad_respuesta` VALUES ('232', 'Por azucares.', '117', '0', null, null, '1', '1', '2020-12-06 00:04:28', '2020-12-06 00:05:09');
INSERT INTO `actividad_respuesta` VALUES ('233', 'Por nutrientes', '117', '1', null, null, '1', '1', '2020-12-06 00:04:39', '2020-12-06 00:05:09');
INSERT INTO `actividad_respuesta` VALUES ('234', 'Por almidón.', '117', '0', null, null, '1', '1', '2020-12-06 00:04:54', '2020-12-06 00:05:09');
INSERT INTO `actividad_respuesta` VALUES ('235', 'Por grasas.', '117', '0', null, null, '1', '1', '2020-12-06 00:05:05', '2020-12-06 00:05:09');
INSERT INTO `actividad_respuesta` VALUES ('236', 'Origen animal.', '118', '1', null, null, '1', '1', '2020-12-06 00:07:07', '2020-12-06 00:08:50');
INSERT INTO `actividad_respuesta` VALUES ('237', 'Origen mineral.', '118', '0', null, null, '1', '1', '2020-12-06 00:07:17', '2020-12-06 00:08:49');
INSERT INTO `actividad_respuesta` VALUES ('238', 'Origen vegetal.', '118', '0', null, null, '1', '1', '2020-12-06 00:08:37', '2020-12-06 00:08:49');
INSERT INTO `actividad_respuesta` VALUES ('239', 'Origen proteico.', '118', '0', null, null, '1', '1', '2020-12-06 00:08:46', '2020-12-06 00:08:49');
INSERT INTO `actividad_respuesta` VALUES ('240', 'En la fecundación', '119', '1', null, null, '1', '1', '2020-12-06 00:10:52', '2020-12-06 00:11:24');
INSERT INTO `actividad_respuesta` VALUES ('241', 'Cuando nacemos', '119', '0', null, null, '1', '1', '2020-12-06 00:11:00', '2020-12-06 00:11:24');
INSERT INTO `actividad_respuesta` VALUES ('242', 'Cuando tenemos 5 años', '119', '0', null, null, '1', '1', '2020-12-06 00:11:09', '2020-12-06 00:11:24');
INSERT INTO `actividad_respuesta` VALUES ('244', 'Cuando somos adultos', '119', '0', null, null, '1', '1', '2020-12-06 00:12:25', '2020-12-06 00:12:25');
INSERT INTO `actividad_respuesta` VALUES ('245', 'Nacen, crecen, se reproducen y mueren', '120', '1', null, null, '1', '1', '2020-12-06 00:13:48', '2020-12-06 00:14:21');
INSERT INTO `actividad_respuesta` VALUES ('246', 'Nacen, nadan, corren, juegan', '120', '0', null, null, '1', '1', '2020-12-06 00:13:56', '2020-12-06 00:14:21');
INSERT INTO `actividad_respuesta` VALUES ('247', 'Se bañan, crecen, cantan, duermen', '120', '0', null, null, '1', '1', '2020-12-06 00:14:06', '2020-12-06 00:14:21');
INSERT INTO `actividad_respuesta` VALUES ('248', 'Se reproducen, mueren, viajan, respiran bajo el agua', '120', '0', null, null, '1', '1', '2020-12-06 00:14:17', '2020-12-06 00:14:21');
INSERT INTO `actividad_respuesta` VALUES ('249', 'elemento', '121', '0', null, null, '1', '1', '2020-12-06 01:57:45', '2020-12-06 01:58:02');
INSERT INTO `actividad_respuesta` VALUES ('250', 'compuesto', '121', '1', null, null, '1', '1', '2020-12-06 01:57:54', '2020-12-06 01:58:02');
INSERT INTO `actividad_respuesta` VALUES ('251', 'Elemento', '122', '0', null, null, '1', '1', '2020-12-06 02:00:59', '2020-12-06 02:01:31');
INSERT INTO `actividad_respuesta` VALUES ('252', 'Compuesto', '122', '0', null, null, '1', '1', '2020-12-06 02:01:08', '2020-12-06 02:01:31');
INSERT INTO `actividad_respuesta` VALUES ('253', 'Mezcla homogénea', '122', '1', null, null, '1', '1', '2020-12-06 02:01:16', '2020-12-06 02:01:31');
INSERT INTO `actividad_respuesta` VALUES ('254', 'Mezcla heterogénea', '122', '0', null, null, '1', '1', '2020-12-06 02:01:23', '2020-12-06 02:01:31');
INSERT INTO `actividad_respuesta` VALUES ('255', 'Al ejercicio que hacemos en las mañanas.', '123', '0', null, null, '1', '1', '2020-12-06 02:23:31', '2020-12-06 02:24:35');
INSERT INTO `actividad_respuesta` VALUES ('256', 'Cuando jugamos en el patio de la escuela.', '123', '0', null, null, '1', '1', '2020-12-06 02:24:03', '2020-12-06 02:24:35');
INSERT INTO `actividad_respuesta` VALUES ('257', 'Es una propiedad de la materia que permite hacer cambios en la materia.', '123', '1', null, null, '1', '1', '2020-12-06 02:24:15', '2020-12-06 02:24:35');
INSERT INTO `actividad_respuesta` VALUES ('258', 'Es una propiedad de la materia que no le permite realizar cambios en ella.', '123', '0', null, null, '1', '1', '2020-12-06 02:24:31', '2020-12-06 02:24:35');
INSERT INTO `actividad_respuesta` VALUES ('259', 'Vida', '124', '0', null, null, '1', '1', '2020-12-06 02:32:35', '2020-12-06 02:33:05');
INSERT INTO `actividad_respuesta` VALUES ('260', 'Energía y transformación.', '124', '1', null, null, '1', '1', '2020-12-06 02:32:43', '2020-12-06 02:33:05');
INSERT INTO `actividad_respuesta` VALUES ('261', 'muerte', '124', '0', null, null, '1', '1', '2020-12-06 02:32:50', '2020-12-06 02:33:05');
INSERT INTO `actividad_respuesta` VALUES ('262', 'Convivencia', '124', '0', null, null, '1', '1', '2020-12-06 02:32:58', '2020-12-06 02:33:05');
INSERT INTO `actividad_respuesta` VALUES ('263', 'Protones y electrones', '126', '0', null, null, '1', '1', '2020-12-06 03:15:10', '2020-12-06 03:15:31');
INSERT INTO `actividad_respuesta` VALUES ('264', 'Protones y neutrones', '126', '1', null, null, '1', '1', '2020-12-06 03:15:18', '2020-12-06 03:15:31');
INSERT INTO `actividad_respuesta` VALUES ('265', 'Protones, solamente', '126', '0', null, null, '1', '1', '2020-12-06 03:15:26', '2020-12-06 03:15:31');
INSERT INTO `actividad_respuesta` VALUES ('266', '6.022 6 x 10^20', '127', '0', null, null, '1', '1', '2020-12-06 03:17:42', '2020-12-06 03:18:15');
INSERT INTO `actividad_respuesta` VALUES ('267', '6.022 6 x 10^21', '127', '0', null, null, '1', '1', '2020-12-06 03:17:50', '2020-12-06 03:18:15');
INSERT INTO `actividad_respuesta` VALUES ('268', '6.022 6 x 10^22', '127', '0', null, null, '1', '1', '2020-12-06 03:18:02', '2020-12-06 03:18:15');
INSERT INTO `actividad_respuesta` VALUES ('269', '6.022 6 x 10^23', '127', '1', null, null, '1', '1', '2020-12-06 03:18:10', '2020-12-06 03:18:15');
INSERT INTO `actividad_respuesta` VALUES ('270', 'Respiración.', '128', '0', null, null, '1', '1', '2020-12-06 03:39:53', '2020-12-06 03:40:54');
INSERT INTO `actividad_respuesta` VALUES ('271', 'Digestión.', '128', '0', null, null, '1', '1', '2020-12-06 03:40:02', '2020-12-06 03:40:54');
INSERT INTO `actividad_respuesta` VALUES ('272', 'Circulación.', '128', '1', null, null, '1', '1', '2020-12-06 03:40:11', '2020-12-06 03:40:54');
INSERT INTO `actividad_respuesta` VALUES ('273', 'Reproducción', '128', '0', null, null, '1', '1', '2020-12-06 03:40:18', '2020-12-06 03:40:54');
INSERT INTO `actividad_respuesta` VALUES ('274', 'VERDADERO', '129', '0', null, null, '1', '1', '2020-12-06 03:42:55', '2020-12-06 03:43:09');
INSERT INTO `actividad_respuesta` VALUES ('275', 'FALSO', '129', '1', null, null, '1', '1', '2020-12-06 03:43:03', '2020-12-06 03:43:09');
INSERT INTO `actividad_respuesta` VALUES ('276', 'básico', '130', '0', null, null, '1', '1', '2020-12-06 03:58:15', '2020-12-06 03:58:40');
INSERT INTO `actividad_respuesta` VALUES ('277', 'ácido', '130', '1', null, null, '1', '1', '2020-12-06 03:58:22', '2020-12-06 03:58:40');
INSERT INTO `actividad_respuesta` VALUES ('278', 'salado', '130', '0', null, null, '1', '1', '2020-12-06 03:58:28', '2020-12-06 03:58:40');
INSERT INTO `actividad_respuesta` VALUES ('279', 'redox', '130', '0', null, null, '1', '1', '2020-12-06 03:58:35', '2020-12-06 03:58:40');
INSERT INTO `actividad_respuesta` VALUES ('280', 'Sangre', '131', '1', null, null, '1', '1', '2020-12-06 04:01:07', '2020-12-06 04:01:35');
INSERT INTO `actividad_respuesta` VALUES ('281', 'Agua', '131', '0', null, null, '1', '1', '2020-12-06 04:01:14', '2020-12-06 04:01:35');
INSERT INTO `actividad_respuesta` VALUES ('282', 'HCl', '131', '0', null, null, '1', '1', '2020-12-06 04:01:21', '2020-12-06 04:01:35');
INSERT INTO `actividad_respuesta` VALUES ('283', 'NaOH', '131', '0', null, null, '1', '1', '2020-12-06 04:01:29', '2020-12-06 04:01:35');
INSERT INTO `actividad_respuesta` VALUES ('284', 'Color de mis ojos', '132', '1', null, null, '1', '1', '2020-12-06 05:01:25', '2020-12-06 05:04:43');
INSERT INTO `actividad_respuesta` VALUES ('285', 'Color de mi piel', '132', '1', null, null, '1', '1', '2020-12-06 05:01:32', '2020-12-06 05:04:32');
INSERT INTO `actividad_respuesta` VALUES ('286', 'Color del cabello', '132', '1', null, null, '1', '1', '2020-12-06 05:01:40', '2020-12-06 05:04:45');
INSERT INTO `actividad_respuesta` VALUES ('287', 'Colegio/Escuela', '133', '0', null, null, '1', '1', '2020-12-06 05:10:43', '2020-12-06 05:11:12');
INSERT INTO `actividad_respuesta` VALUES ('288', 'Barrio', '133', '0', null, null, '1', '1', '2020-12-06 05:10:52', '2020-12-06 05:11:12');
INSERT INTO `actividad_respuesta` VALUES ('289', 'Municipio', '133', '0', null, null, '1', '1', '2020-12-06 05:11:00', '2020-12-06 05:11:12');
INSERT INTO `actividad_respuesta` VALUES ('290', 'Familia', '133', '1', null, null, '1', '1', '2020-12-06 05:11:08', '2020-12-06 05:11:12');
INSERT INTO `actividad_respuesta` VALUES ('291', 'Cartografía', '134', '0', null, null, '1', '1', '2020-12-06 05:18:49', '2020-12-06 05:19:14');
INSERT INTO `actividad_respuesta` VALUES ('292', 'Geografía', '134', '1', null, null, '1', '1', '2020-12-06 05:18:55', '2020-12-06 05:19:14');
INSERT INTO `actividad_respuesta` VALUES ('293', 'Proyecciones', '134', '0', null, null, '1', '1', '2020-12-06 05:19:01', '2020-12-06 05:19:14');
INSERT INTO `actividad_respuesta` VALUES ('294', 'Xilografía', '134', '0', null, null, '1', '1', '2020-12-06 05:19:10', '2020-12-06 05:19:14');
INSERT INTO `actividad_respuesta` VALUES ('295', 'A. estado de tiempo', '135', '0', null, null, '1', '1', '2020-12-06 05:22:07', '2020-12-06 05:22:41');
INSERT INTO `actividad_respuesta` VALUES ('296', 'clima', '135', '1', null, null, '1', '1', '2020-12-06 05:22:16', '2020-12-06 05:22:41');
INSERT INTO `actividad_respuesta` VALUES ('297', 'precipitaciones', '135', '0', null, null, '1', '1', '2020-12-06 05:22:23', '2020-12-06 05:22:41');
INSERT INTO `actividad_respuesta` VALUES ('298', 'humedad', '135', '0', null, null, '1', '1', '2020-12-06 05:22:36', '2020-12-06 05:22:41');

-- ----------------------------
-- Table structure for agenda
-- ----------------------------
DROP TABLE IF EXISTS `agenda`;
CREATE TABLE `agenda` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_agenda` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_calendario` int(11) NOT NULL,
  `id_tipo_agenda` int(11) NOT NULL,
  `id_agenda_actividad` int(11) NOT NULL,
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
INSERT INTO `agenda` VALUES ('2', 'Reunion Quincenal', '1', '3', '1', '2020-11-18', '08:01:00', '08:30:00', '0', 'Cambio de Planes de Evaluacion Nueva Normalidad', '1', '1', '2020-06-19 20:39:49', '2020-06-19 20:39:49');
INSERT INTO `agenda` VALUES ('3', 'Taller Evaluaciones en Linea', '1', '3', '4', '2020-11-19', '10:55:00', '15:30:00', '0', 'Desarrollo de Planes de Evaluacion en Linea y Generacion de Tareas', '1', '1', '2020-06-19 20:59:40', '2020-06-25 22:22:57');
INSERT INTO `agenda` VALUES ('4', 'Celebracion Dia del Estudiante', '2', '6', '5', '2020-11-19', '08:00:00', '10:00:00', '0', 'Descripcion completa de alguna actividad para indicar infomacion importante.', '1', '1', '2020-06-19 21:01:55', '2020-11-10 21:43:13');
INSERT INTO `agenda` VALUES ('5', 'Prueba', '1', '5', '5', '2020-11-15', '00:00:00', '00:59:00', '0', 'Actividad Prueba', '1', '1', '2020-06-19 21:05:59', '2020-06-22 19:43:38');
INSERT INTO `agenda` VALUES ('7', 'Inicio de Clases', '1', '1', '8', '2020-11-01', '00:01:00', '00:01:00', '0', 'Inicio del año escolar', '1', '1', '2020-06-19 21:24:16', '2020-06-19 21:24:16');
INSERT INTO `agenda` VALUES ('8', 'Fin Periodo I', '1', '2', '9', '2020-11-30', '00:01:00', '00:00:00', '0', 'Fin primer periodo', '1', '1', '2020-06-19 21:25:34', '2020-06-19 21:25:34');
INSERT INTO `agenda` VALUES ('11', 'Campeonato de Futbol', '1', '4', '6', '2020-11-04', '08:00:00', '07:00:00', '0', 'Campeonato Interescolar Distrital', '1', '1', '2020-06-20 11:28:11', '2020-06-22 19:31:16');
INSERT INTO `agenda` VALUES ('13', 'Inicio 2 Periodo', '2', '1', '9', '2020-11-05', '00:10:00', '05:00:00', '0', null, '1', '1', '2020-06-25 03:07:57', '2020-11-10 21:52:45');
INSERT INTO `agenda` VALUES ('14', 'Taller Convivencia', '2', '7', '4', '2020-11-04', '00:36:00', '00:30:00', '0', 'Taller con el Prof. Jose Azuaje', '1', '1', '2020-08-18 17:51:11', '2020-11-10 21:35:55');
INSERT INTO `agenda` VALUES ('15', 'eeqeqe', '1', '1', '1', '2020-11-09', '06:06:00', '07:05:00', '0', 'eeq', '1', '1', '2020-09-02 21:27:57', '2020-09-02 21:27:57');
INSERT INTO `agenda` VALUES ('16', 'Reunion', '1', '1', '1', '2020-11-10', '02:09:00', '01:09:00', '0', 'fdfsf', '1', '2', '2020-09-05 14:13:58', '2020-09-05 14:13:58');

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
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of agenda_actividad
-- ----------------------------
INSERT INTO `agenda_actividad` VALUES ('1', 'Reunion de Docentes', 'mdi-account-group', null, null, '1', '1', '2020-06-19 02:23:46', '2020-06-19 03:00:03');
INSERT INTO `agenda_actividad` VALUES ('2', 'Reunion de Padres', 'mdi-human-male-child', null, null, '1', '1', '2020-06-19 02:59:44', '2020-06-19 02:59:44');
INSERT INTO `agenda_actividad` VALUES ('3', 'Reunion Secrertaria', 'mdi-chair-rolling', null, null, '1', '1', '2020-06-19 03:06:30', '2020-06-19 03:06:30');
INSERT INTO `agenda_actividad` VALUES ('4', 'Taller', 'mdi-charity', null, null, '1', '1', '2020-06-19 03:08:05', '2020-06-19 03:08:05');
INSERT INTO `agenda_actividad` VALUES ('5', 'Celebracion', 'mdi-party-popper', null, null, '1', '1', '2020-06-19 03:11:22', '2020-06-19 10:22:50');
INSERT INTO `agenda_actividad` VALUES ('6', 'Actividades Deportivas', 'mdi-soccer', null, null, '1', '1', '2020-06-19 03:22:38', '2020-06-19 20:57:18');
INSERT INTO `agenda_actividad` VALUES ('7', 'Paseos', 'mdi-bus-side', null, null, '1', '1', '2020-06-19 03:23:06', '2020-06-20 11:29:43');
INSERT INTO `agenda_actividad` VALUES ('8', 'Inicio Fin Año escolar', 'mdi-flag-checkered', null, null, '1', '1', '2020-06-19 10:18:37', '2020-11-10 20:32:54');
INSERT INTO `agenda_actividad` VALUES ('9', 'Inicio FIn Periodo', 'mdi-flag-triangle', null, null, '1', '1', '2020-06-19 10:21:01', '2020-06-19 10:21:01');

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
INSERT INTO `alumno` VALUES ('45', 'Bartlett', 'Jefferson', 'Kimberly', 'Desiree', '2', '10308498', 'F', '2020-02-04', 'Colombia', 'Valle del Cauca', '2390 Vivamus St.', '76', '76', 'ut.mi@ligulatortordictum.com', '16160826 6902', '16791010 4632', '16920413 0802', null, '1', '1', '2021-05-16 00:00:00', '2020-11-10 16:14:00');
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
INSERT INTO `alumno` VALUES ('87', 'Armstrong', 'Morgan', 'Rafael', 'Deacon', '2', '11839084', 'M', '2019-11-14', 'Colombia', 'VAC', 'P.O. Box 216, 144 Natoque Rd.', '76', '76', 'Suspendisse.sagittis@Proin.org', '16600213 7427', '16061230 3750', '16031005 5728', null, '1', '1', '2019-10-05 00:00:00', '2020-11-10 16:12:52');
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
INSERT INTO `alumno` VALUES ('103', 'Allen', 'Cline', 'Hu', 'Jonas', '2', '39744371', 'F', '2015-02-04', 'Colombia', 'Chocó', '741-3480 Ut St.', '76', '76', 'amet@anunc.org', '16100317 7480', '16240226 8086', '16830806 8991', null, '1', '1', '2020-05-13 00:00:00', '2020-11-09 01:23:47');
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
) ENGINE=InnoDB AUTO_INCREMENT=234 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
INSERT INTO `alumno_materia` VALUES ('210', '2', '103', '8', '19', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('211', '2', '103', '8', '7', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('212', '2', '103', '8', '14', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('213', '2', '103', '8', '15', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('214', '2', '107', '9', '15', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('215', '2', '107', '9', '14', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('216', '2', '107', '9', '19', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('217', '2', '107', '9', '7', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('218', '2', '87', '10', '15', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('219', '2', '87', '10', '14', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('220', '2', '87', '10', '7', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('221', '2', '87', '10', '19', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('222', '2', '105', '11', '15', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('223', '2', '105', '11', '14', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('224', '2', '105', '11', '7', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('225', '2', '105', '11', '19', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('226', '2', '45', '11', '15', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('227', '2', '45', '11', '14', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('228', '2', '45', '11', '7', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('229', '2', '45', '11', '19', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('230', '2', '45', '12', '7', null, '1', '1', '2020-11-10 16:11:20', '2020-11-10 16:11:20');
INSERT INTO `alumno_materia` VALUES ('231', '2', '45', '12', '19', null, '1', '1', '2020-11-10 16:11:23', '2020-11-10 16:11:23');
INSERT INTO `alumno_materia` VALUES ('232', '2', '45', '12', '15', null, '1', '1', '2020-11-10 16:11:25', '2020-11-10 16:11:25');
INSERT INTO `alumno_materia` VALUES ('233', '2', '45', '12', '14', null, '1', '1', '2020-11-10 16:11:28', '2020-11-10 16:11:28');

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
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
INSERT INTO `alumno_pariente` VALUES ('33', '29', '1', '1', null, '1', '1', '2020-11-09 01:27:34', '2020-11-09 01:27:34');

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
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of archivo
-- ----------------------------
INSERT INTO `archivo` VALUES ('18', 'Archivo Prueba', '1', '21', '1593453680_es-cv-143.pptx', 'PowerPoint', 'Descripcion Prueba', '1', '1', '2020-06-29 18:01:20', '2020-06-29 18:01:20');
INSERT INTO `archivo` VALUES ('24', 'Audio Macro', '8', '1', '1593648672_DAO Readme.txt', 'Texto', 'Descripcion del Libro', '1', '1', '2020-07-02 00:11:12', '2020-12-05 03:20:31');
INSERT INTO `archivo` VALUES ('25', 'Libro Texto 1 Grado', '8', '1', '1593656676_Integra-Sociales.pdf', 'PDF', 'Integra Sociales', '1', '1', '2020-07-02 02:24:36', '2020-07-02 02:24:36');
INSERT INTO `archivo` VALUES ('26', 'Prueba', '8', '1', '1593797727_cotizar.xlsx', 'Excel', 'Prueba Observaciones', '1', '1', '2020-07-03 17:35:27', '2020-07-03 17:35:27');
INSERT INTO `archivo` VALUES ('28', 'hhdf', '2', '10', '1594049722_DAO Readme.txt', 'Texto', 'hdfhdhd', '1', '1', '2020-07-06 15:35:22', '2020-07-06 15:35:22');
INSERT INTO `archivo` VALUES ('29', 'Macroeconomia', '10', '3', 'macroeconomia.pdf', 'Video', 'prueba', '1', '1', '2020-07-31 15:23:49', '2020-10-27 05:29:48');
INSERT INTO `archivo` VALUES ('30', 'Guia', '2', '26', '1599410641_001 Sumas de 1 digito para primer grado fácil.pdf', 'PDF', 'Guia', '1', '1', '2020-09-06 16:44:01', '2020-09-06 16:44:01');
INSERT INTO `archivo` VALUES ('31', 'Tarea 2', '11', '26', '1599508370_001 Sumas de 1 digito para primer grado fácil.pdf', 'PDF', null, '1', '1', '2020-09-07 19:52:50', '2020-09-07 19:52:50');
INSERT INTO `archivo` VALUES ('33', 'tarea 3', '11', '32', '1599568865_Documento sin título (1).pdf', 'PDF', null, '1', '1', '2020-09-08 12:41:05', '2020-09-08 12:41:05');
INSERT INTO `archivo` VALUES ('38', 'Macroeconomia', '8', '9', 'fundamentos_macroeconomia.mp3', 'Audio', 'Observaciones', '1', '1', '2020-10-20 02:46:26', '2020-10-27 05:02:14');
INSERT INTO `archivo` VALUES ('39', 'prueba 2', '8', '10', 'fundamentos_macroeconomia.mp3', 'Audio', null, '1', '1', '2020-10-20 02:55:06', '2020-10-20 02:55:06');
INSERT INTO `archivo` VALUES ('40', 'prueba 3', '8', '11', 'fundamentos_macroeconomia.mp3', 'Audio', 'yeyey', '1', '1', '2020-10-20 02:58:03', '2020-10-20 02:58:03');
INSERT INTO `archivo` VALUES ('41', 'procedimiento', '10', '12', 'llamado.pdf', 'PDF', null, '1', '1', '2020-10-20 03:51:26', '2020-10-20 03:51:26');
INSERT INTO `archivo` VALUES ('42', 'Los Sentidos', '8', '13', 'fundamentos_macroeconomia.mp3', 'Audio', null, '1', '1', '2020-10-27 02:04:09', '2020-10-27 02:04:09');
INSERT INTO `archivo` VALUES ('43', 'Fundamentos', '8', '14', 'fundamentos_macroeconomia.mp3', 'Audio', null, '1', '1', '2020-10-27 05:01:26', '2020-10-27 05:01:41');
INSERT INTO `archivo` VALUES ('44', 'Sumas Restas Facil', '10', '15', '001 Sumas de 1 digito para primer grado fácil.pdf', 'PDF', null, '1', '1', '2020-10-27 05:30:53', '2020-10-27 05:30:53');
INSERT INTO `archivo` VALUES ('45', 'Sumas Facil', '10', '16', '001 Sumas de 1 digito para primer grado fácil.pdf', 'PDF', null, '1', '1', '2020-10-27 13:10:41', '2020-10-27 13:10:41');
INSERT INTO `archivo` VALUES ('46', 'Los Cinco Sentidos', '10', '17', 'CUADERNO_ACTIVIDADES_LOS_CINCO_SENTIDOS.pdf', 'PDF', null, '1', '1', '2020-10-31 13:49:54', '2020-10-31 13:49:54');
INSERT INTO `archivo` VALUES ('47', 'Los Sentidos', '8', '18', 'fundamentos_macroeconomia.mp3', 'Audio', null, '1', '1', '2020-11-05 16:16:14', '2020-11-05 16:20:09');
INSERT INTO `archivo` VALUES ('48', 'Los sentidos', '10', '19', 'losSentidos.pdf', 'PDF', null, '1', '1', '2020-11-08 23:09:29', '2020-11-08 23:09:29');
INSERT INTO `archivo` VALUES ('49', 'Guia', '1', '1', '1605293775_15505108.ppt', 'PowerPoint', 'rwerwr', '1', '1', '2020-11-13 18:56:15', '2020-11-13 18:56:37');
INSERT INTO `archivo` VALUES ('51', 'Guia de la Tarea', '11', '1', '1605302163_2017_MATR_MATRICULA Y LIST ultimo (v2).pdf', 'PDF', 'twtwet', '1', '1', '2020-11-13 21:16:03', '2020-11-14 14:42:36');
INSERT INTO `archivo` VALUES ('52', 'Calendario', '11', '1', '1605365668_Calendario Escolar 2019-2020.pdf', 'PDF', null, '1', '1', '2020-11-14 14:54:28', '2020-11-14 14:54:28');
INSERT INTO `archivo` VALUES ('56', 'tarea', '13', '60', '1605372237_Calendario Escolar 2019-2020.xlsx', 'Excel', null, '1', '1', '2020-11-14 16:43:57', '2020-11-14 16:43:57');
INSERT INTO `archivo` VALUES ('57', 'Significado de Estados de la materia', '10', '20', 'grado1_los solidos_Significado de Estados de la materia.pdf', 'PDF', null, '1', '1', '2020-12-06 00:34:03', '2020-12-06 00:34:03');
INSERT INTO `archivo` VALUES ('58', 'Propiedades de la materia', '10', '21', 'grado1_los liquidos_Propiedades de la materia.pdf', 'PDF', null, '1', '1', '2020-12-06 00:34:34', '2020-12-06 00:34:34');
INSERT INTO `archivo` VALUES ('59', 'Origen de la alimentación humana', '10', '22', 'grado 2_Hablemos de los alimentos_Origen de la alimentación humana.pdf', 'PDF', null, '1', '1', '2020-12-06 01:13:54', '2020-12-06 01:13:54');
INSERT INTO `archivo` VALUES ('60', 'Alimentos y tipos de alimentos', '10', '23', 'grado 2_Los alimentos segun su origen_Alimentos y tipos de alimentos.pdf', 'PDF', null, '1', '1', '2020-12-06 01:14:11', '2020-12-06 01:14:11');
INSERT INTO `archivo` VALUES ('61', 'Cambios emocionales en la preadolescencia', '10', '24', 'grado 3_Los cambios en la mujer_Cambios emocionales en la preadolescencia.pdf', 'PDF', null, '1', '1', '2020-12-06 01:47:19', '2020-12-06 01:47:19');
INSERT INTO `archivo` VALUES ('62', 'Causas de la rebeldía en los niños', '10', '25', 'grado 3_Los cambios en los niños_Causas de la rebeldía en los niños.pdf', 'PDF', null, '1', '1', '2020-12-06 01:47:57', '2020-12-06 01:47:57');
INSERT INTO `archivo` VALUES ('63', 'Sustancias puras', '10', '26', 'grado 4_que es un elemento y que es un compuesto_Sustancias puras.pdf', 'PDF', null, '1', '1', '2020-12-06 01:49:35', '2020-12-06 01:49:35');
INSERT INTO `archivo` VALUES ('64', 'Tipos de mezclas', '10', '27', 'grado 4_que es una mezcla_Tipos de mezclas.pdf', 'PDF', null, '1', '1', '2020-12-06 01:49:56', '2020-12-06 01:49:56');
INSERT INTO `archivo` VALUES ('65', 'Energía solar', '10', '28', 'grado 5_de donde proviene la energia_Energía solar.pdf', 'PDF', null, '1', '1', '2020-12-06 02:21:54', '2020-12-06 02:21:54');
INSERT INTO `archivo` VALUES ('66', 'Energías renovables', '10', '29', 'grado 5_Podemos crear energia_Energías renovables.pdf', 'PDF', null, '1', '1', '2020-12-06 02:22:14', '2020-12-06 02:22:14');
INSERT INTO `archivo` VALUES ('67', 'La Meiosis', '8', '30', 'grado-8-ciclo-celular.mp3', 'Audio', null, '1', '1', '2020-12-06 04:16:55', '2020-12-06 04:16:55');
INSERT INTO `archivo` VALUES ('68', 'Crecemos y cambiamos', '10', '31', 'Grado 1_Este soy yo_Crecemos y cambiamos.pdf', 'PDF', null, '1', '1', '2020-12-06 05:00:38', '2020-12-06 05:00:38');
INSERT INTO `archivo` VALUES ('69', 'La familia en un país diverso ¿qué y cómo?', '10', '32', 'Grado 1_Organizaciones sociales_La familia en un país diverso.pdf', 'PDF', null, '1', '1', '2020-12-06 05:09:21', '2020-12-06 05:09:21');
INSERT INTO `archivo` VALUES ('70', 'El paisaje geográfico', '10', '33', 'Grado 2_El paisaje geográfico_El paisaje geografico.pdf', 'PDF', null, '1', '1', '2020-12-06 05:16:07', '2020-12-06 05:16:07');
INSERT INTO `archivo` VALUES ('71', '¿Cuáles son los climas de Colombia?', '10', '34', 'Grado 2_El clima y el Paisaje_Cuáles son los climas de Colombia.pdf', 'PDF', null, '1', '1', '2020-12-06 05:16:45', '2020-12-06 05:16:45');

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
INSERT INTO `area_estudio` VALUES ('9', 'Educación Estética y Artistica', 'blue', null, '1', '1', '2020-05-16 16:32:18', '2020-09-20 14:18:48');

-- ----------------------------
-- Table structure for asignacion
-- ----------------------------
DROP TABLE IF EXISTS `asignacion`;
CREATE TABLE `asignacion` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_grupo` int(11) NOT NULL,
  `id_tipo_asignacion` int(11) NOT NULL,
  `id_materia` int(11) NOT NULL,
  `id_tema` int(11) NOT NULL,
  `id_origen` int(11) NOT NULL,
  `tx_origen` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fe_inicio` date NOT NULL,
  `fe_fin` date DEFAULT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of asignacion
-- ----------------------------

-- ----------------------------
-- Table structure for asignacion_alumno
-- ----------------------------
DROP TABLE IF EXISTS `asignacion_alumno`;
CREATE TABLE `asignacion_alumno` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_asignacion` int(11) NOT NULL,
  `id_alumno` int(11) NOT NULL,
  `fe_completado` timestamp NULL DEFAULT NULL,
  `nu_calificacion` int(11) DEFAULT NULL,
  `id_calificacion` int(11) DEFAULT NULL,
  `fe_acceso` timestamp NULL DEFAULT NULL,
  `nu_accesos` int(11) DEFAULT 0,
  `nu_minutos` int(11) DEFAULT 0,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of asignacion_alumno
-- ----------------------------

-- ----------------------------
-- Table structure for asistencia
-- ----------------------------
DROP TABLE IF EXISTS `asistencia`;
CREATE TABLE `asistencia` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_clase` int(11) NOT NULL,
  `id_alumno` int(11) NOT NULL,
  `fe_asistencia` timestamp NULL DEFAULT NULL,
  `bo_asistencia` tinyint(1) NOT NULL DEFAULT 0,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=206 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of asistencia
-- ----------------------------
INSERT INTO `asistencia` VALUES ('116', '1', '1', '2020-11-01 13:40:27', '1', null, '1', '1', null, null);
INSERT INTO `asistencia` VALUES ('117', '1', '2', '2020-11-01 13:40:27', '0', null, '1', '1', null, null);
INSERT INTO `asistencia` VALUES ('118', '1', '15', '2020-11-01 13:40:27', '0', null, '1', '1', null, null);
INSERT INTO `asistencia` VALUES ('119', '1', '16', '2020-11-01 13:40:27', '0', null, '1', '1', null, null);
INSERT INTO `asistencia` VALUES ('120', '1', '17', '2020-11-01 13:40:27', '0', null, '1', '1', null, null);
INSERT INTO `asistencia` VALUES ('121', '1', '23', '2020-11-01 13:40:27', '0', null, '1', '1', null, null);
INSERT INTO `asistencia` VALUES ('122', '2', '1', '2020-11-01 13:40:52', '1', null, '1', '1', null, null);
INSERT INTO `asistencia` VALUES ('123', '2', '2', '2020-11-01 13:40:52', '1', null, '1', '1', null, null);
INSERT INTO `asistencia` VALUES ('124', '2', '15', '2020-11-01 13:40:52', '0', null, '1', '1', null, null);
INSERT INTO `asistencia` VALUES ('125', '2', '16', '2020-11-01 13:40:52', '0', null, '1', '1', null, null);
INSERT INTO `asistencia` VALUES ('126', '2', '17', '2020-11-01 13:40:52', '0', null, '1', '1', null, null);
INSERT INTO `asistencia` VALUES ('127', '2', '23', '2020-11-01 13:40:52', '1', null, '1', '1', null, null);
INSERT INTO `asistencia` VALUES ('128', '3', '1', '2020-11-01 13:41:13', '0', null, '1', '1', null, null);
INSERT INTO `asistencia` VALUES ('129', '3', '2', '2020-11-01 13:41:13', '1', null, '1', '1', null, null);
INSERT INTO `asistencia` VALUES ('130', '3', '15', '2020-11-01 13:41:13', '1', null, '1', '1', null, null);
INSERT INTO `asistencia` VALUES ('131', '3', '16', '2020-11-01 13:41:13', '1', null, '1', '1', null, null);
INSERT INTO `asistencia` VALUES ('132', '3', '17', '2020-11-01 13:41:13', '1', null, '1', '1', null, null);
INSERT INTO `asistencia` VALUES ('133', '3', '23', '2020-11-01 13:41:13', '0', null, '1', '1', null, null);
INSERT INTO `asistencia` VALUES ('134', '4', '1', '2020-11-01 13:41:29', '0', null, '1', '1', null, null);
INSERT INTO `asistencia` VALUES ('135', '4', '2', '2020-11-01 13:41:29', '1', null, '1', '1', null, null);
INSERT INTO `asistencia` VALUES ('136', '4', '15', '2020-11-01 13:41:29', '1', null, '1', '1', null, null);
INSERT INTO `asistencia` VALUES ('137', '4', '16', '2020-11-01 13:41:29', '1', null, '1', '1', null, null);
INSERT INTO `asistencia` VALUES ('138', '4', '17', '2020-11-01 13:41:29', '1', null, '1', '1', null, null);
INSERT INTO `asistencia` VALUES ('139', '4', '23', '2020-11-01 13:41:29', '1', null, '1', '1', null, null);
INSERT INTO `asistencia` VALUES ('140', '8', '1', '2020-11-02 00:49:34', '1', null, '1', '1', null, '2020-11-02 00:49:34');
INSERT INTO `asistencia` VALUES ('141', '8', '2', '2020-11-02 00:49:37', '1', null, '1', '1', null, '2020-11-02 00:49:37');
INSERT INTO `asistencia` VALUES ('142', '8', '15', '2020-11-02 01:20:06', '1', null, '1', '1', null, '2020-11-02 01:20:06');
INSERT INTO `asistencia` VALUES ('143', '8', '16', '2020-11-02 01:20:07', '1', null, '1', '1', null, '2020-11-02 01:20:07');
INSERT INTO `asistencia` VALUES ('144', '8', '17', '2020-11-02 01:20:10', '1', null, '1', '1', null, '2020-11-02 01:20:10');
INSERT INTO `asistencia` VALUES ('145', '8', '23', '2020-11-02 01:20:11', '1', null, '1', '1', null, '2020-11-02 01:20:11');
INSERT INTO `asistencia` VALUES ('146', '9', '1', '2020-11-06 23:39:20', '0', null, '1', '1', null, '2020-11-06 23:39:20');
INSERT INTO `asistencia` VALUES ('147', '9', '2', '2020-11-06 23:36:48', '1', null, '1', '1', null, '2020-11-06 23:36:48');
INSERT INTO `asistencia` VALUES ('148', '9', '15', '2020-11-06 23:36:50', '1', null, '1', '1', null, '2020-11-06 23:36:50');
INSERT INTO `asistencia` VALUES ('149', '9', '16', '2020-11-06 23:51:02', '1', null, '1', '1', null, '2020-11-06 23:51:02');
INSERT INTO `asistencia` VALUES ('150', '9', '17', '2020-11-06 23:36:54', '1', null, '1', '1', null, '2020-11-06 23:36:54');
INSERT INTO `asistencia` VALUES ('151', '9', '23', '2020-11-06 23:36:55', '1', null, '1', '1', null, '2020-11-06 23:36:55');
INSERT INTO `asistencia` VALUES ('152', '10', '1', '2020-11-09 00:45:36', '1', null, '1', '1', null, '2020-11-09 00:45:36');
INSERT INTO `asistencia` VALUES ('153', '10', '2', '2020-11-09 00:45:34', '1', null, '1', '1', null, '2020-11-09 00:45:34');
INSERT INTO `asistencia` VALUES ('154', '10', '15', '2020-11-09 00:45:38', '1', null, '1', '1', null, '2020-11-09 00:45:38');
INSERT INTO `asistencia` VALUES ('155', '10', '16', '2020-11-09 00:45:40', '1', null, '1', '1', null, '2020-11-09 00:45:40');
INSERT INTO `asistencia` VALUES ('156', '10', '17', '2020-11-09 00:45:41', '1', null, '1', '1', null, '2020-11-09 00:45:41');
INSERT INTO `asistencia` VALUES ('157', '10', '23', '2020-11-09 00:46:00', '0', null, '1', '1', null, '2020-11-09 00:46:00');
INSERT INTO `asistencia` VALUES ('158', '11', '1', '2020-11-09 01:10:56', '1', null, '1', '1', null, '2020-11-09 01:10:56');
INSERT INTO `asistencia` VALUES ('159', '11', '2', '2020-11-09 01:10:58', '1', null, '1', '1', null, '2020-11-09 01:10:58');
INSERT INTO `asistencia` VALUES ('160', '11', '15', '2020-11-09 01:11:00', '1', null, '1', '1', null, '2020-11-09 01:11:00');
INSERT INTO `asistencia` VALUES ('161', '11', '16', '2020-11-09 01:11:01', '1', null, '1', '1', null, '2020-11-09 01:11:01');
INSERT INTO `asistencia` VALUES ('162', '11', '17', null, '0', null, '1', '1', null, null);
INSERT INTO `asistencia` VALUES ('163', '11', '23', '2020-11-09 01:11:02', '1', null, '1', '1', null, '2020-11-09 01:11:02');
INSERT INTO `asistencia` VALUES ('164', '12', '1', '2020-11-09 21:56:38', '1', null, '1', '1', null, '2020-11-09 21:56:38');
INSERT INTO `asistencia` VALUES ('165', '12', '2', '2020-11-09 21:56:42', '1', null, '1', '1', null, '2020-11-09 21:56:42');
INSERT INTO `asistencia` VALUES ('166', '12', '15', '2020-11-09 21:56:44', '1', null, '1', '1', null, '2020-11-09 21:56:44');
INSERT INTO `asistencia` VALUES ('167', '12', '16', null, '0', null, '1', '1', null, null);
INSERT INTO `asistencia` VALUES ('168', '12', '17', null, '0', null, '1', '1', null, null);
INSERT INTO `asistencia` VALUES ('169', '12', '23', null, '0', null, '1', '1', null, null);
INSERT INTO `asistencia` VALUES ('170', '13', '1', null, '0', null, '1', '1', null, null);
INSERT INTO `asistencia` VALUES ('171', '13', '2', null, '0', null, '1', '1', null, null);
INSERT INTO `asistencia` VALUES ('172', '13', '15', null, '0', null, '1', '1', null, null);
INSERT INTO `asistencia` VALUES ('173', '13', '16', null, '0', null, '1', '1', null, null);
INSERT INTO `asistencia` VALUES ('174', '13', '17', null, '0', null, '1', '1', null, null);
INSERT INTO `asistencia` VALUES ('175', '13', '23', null, '0', null, '1', '1', null, null);
INSERT INTO `asistencia` VALUES ('176', '14', '1', '2020-11-09 21:58:04', '1', null, '1', '1', null, '2020-11-09 21:58:04');
INSERT INTO `asistencia` VALUES ('177', '14', '2', '2020-11-09 21:58:05', '1', null, '1', '1', null, '2020-11-09 21:58:05');
INSERT INTO `asistencia` VALUES ('178', '14', '15', '2020-11-09 21:58:07', '1', null, '1', '1', null, '2020-11-09 21:58:07');
INSERT INTO `asistencia` VALUES ('179', '14', '16', '2020-11-09 21:58:08', '1', null, '1', '1', null, '2020-11-09 21:58:08');
INSERT INTO `asistencia` VALUES ('180', '14', '17', null, '0', null, '1', '1', null, null);
INSERT INTO `asistencia` VALUES ('181', '14', '23', null, '0', null, '1', '1', null, null);
INSERT INTO `asistencia` VALUES ('182', '15', '1', '2020-11-11 16:20:03', '1', null, '1', '1', null, '2020-11-11 16:20:03');
INSERT INTO `asistencia` VALUES ('183', '15', '2', '2020-11-11 16:20:04', '1', null, '1', '1', null, '2020-11-11 16:20:04');
INSERT INTO `asistencia` VALUES ('184', '15', '15', '2020-11-11 16:20:06', '1', null, '1', '1', null, '2020-11-11 16:20:06');
INSERT INTO `asistencia` VALUES ('185', '15', '16', '2020-11-11 16:20:07', '1', null, '1', '1', null, '2020-11-11 16:20:07');
INSERT INTO `asistencia` VALUES ('186', '15', '17', null, '0', null, '1', '1', null, null);
INSERT INTO `asistencia` VALUES ('187', '15', '23', null, '0', null, '1', '1', null, null);
INSERT INTO `asistencia` VALUES ('188', '16', '1', null, '0', null, '1', '1', null, null);
INSERT INTO `asistencia` VALUES ('189', '16', '2', null, '0', null, '1', '1', null, null);
INSERT INTO `asistencia` VALUES ('190', '16', '15', null, '0', null, '1', '1', null, null);
INSERT INTO `asistencia` VALUES ('191', '16', '16', null, '0', null, '1', '1', null, null);
INSERT INTO `asistencia` VALUES ('192', '16', '17', null, '0', null, '1', '1', null, null);
INSERT INTO `asistencia` VALUES ('193', '16', '23', null, '0', null, '1', '1', null, null);
INSERT INTO `asistencia` VALUES ('194', '17', '1', '2020-11-12 16:40:26', '1', null, '1', '1', null, '2020-11-12 16:40:26');
INSERT INTO `asistencia` VALUES ('195', '17', '2', '2020-11-12 16:40:25', '1', null, '1', '1', null, '2020-11-12 16:40:25');
INSERT INTO `asistencia` VALUES ('196', '17', '15', '2020-11-12 16:40:24', '1', null, '1', '1', null, '2020-11-12 16:40:24');
INSERT INTO `asistencia` VALUES ('197', '17', '16', '2020-11-12 16:40:30', '1', null, '1', '1', null, '2020-11-12 16:40:30');
INSERT INTO `asistencia` VALUES ('198', '17', '17', '2020-11-12 16:40:29', '1', null, '1', '1', null, '2020-11-12 16:40:29');
INSERT INTO `asistencia` VALUES ('199', '17', '23', null, '0', null, '1', '1', null, null);
INSERT INTO `asistencia` VALUES ('200', '18', '1', '2020-11-28 02:16:44', '1', null, '1', '1', '2020-11-28 00:40:30', '2020-11-28 02:16:44');
INSERT INTO `asistencia` VALUES ('201', '18', '2', '2020-11-28 02:16:45', '1', null, '1', '1', '2020-11-28 00:40:30', '2020-11-28 02:16:45');
INSERT INTO `asistencia` VALUES ('202', '18', '15', '2020-11-28 02:16:46', '1', null, '1', '1', '2020-11-28 00:40:30', '2020-11-28 02:16:46');
INSERT INTO `asistencia` VALUES ('203', '18', '16', '2020-11-28 02:47:31', '1', null, '1', '1', '2020-11-28 00:40:30', '2020-11-28 02:47:31');
INSERT INTO `asistencia` VALUES ('204', '18', '17', null, '0', null, '1', '1', '2020-11-28 00:40:30', null);
INSERT INTO `asistencia` VALUES ('205', '18', '23', '2020-11-28 02:16:48', '1', null, '1', '1', '2020-11-28 00:40:30', '2020-11-28 02:16:48');

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
INSERT INTO `asistente` VALUES ('6', 'Empleados', '14', 'Descripcion de la tarea de especial cuidado para el funcionamiento del sistema\'', 'deep-orange', '5', 'secretaria', 'Descripcion de la funcionalidad, observaciones y advertencias', '1', '1', '2020-09-02 12:44:21', '2020-09-22 13:59:59');
INSERT INTO `asistente` VALUES ('7', 'Estructura', '12', 'Descripcion de la tarea de especial cuidado para el funcionamiento del sistema\'', 'deep-orange', '6', 'secretaria', 'Descripcion de la funcionalidad, observaciones y advertencias', '1', '1', '2020-09-02 12:44:36', '2020-09-22 13:59:59');
INSERT INTO `asistente` VALUES ('8', 'Aulas', '13', 'Descripcion de la tarea de especial cuidado para el funcionamiento del sistema\'', 'deep-orange', '7', 'secretaria', 'Descripcion de la funcionalidad, observaciones y advertencias', '1', '1', '2020-09-02 12:44:54', '2020-09-22 13:59:59');
INSERT INTO `asistente` VALUES ('9', 'Calendario', '15', 'Descripcion de la tarea de especial cuidado para el funcionamiento del sistema\'', 'teal', '8', 'secretaria', 'Descripcion de la funcionalidad, observaciones y advertencias', '1', '1', '2020-09-02 12:45:10', '2020-09-22 13:59:59');
INSERT INTO `asistente` VALUES ('10', 'Periodos', '16', 'Descripcion de la tarea de especial cuidado para el funcionamiento del sistema\'', 'teal', '9', 'secretaria', 'Descripcion de la funcionalidad, observaciones y advertencias', '1', '1', '2020-09-02 12:45:25', '2020-09-22 13:59:59');
INSERT INTO `asistente` VALUES ('11', 'Turnos', '21', 'Descripcion de la tarea de especial cuidado para el funcionamiento del sistema\'', 'teal', '10', 'secretaria', 'Descripcion de la funcionalidad, observaciones y advertencias', '1', '1', '2020-09-02 12:45:38', '2020-09-22 13:59:59');
INSERT INTO `asistente` VALUES ('12', 'Horas Academicas', '22', 'Descripcion de la tarea de especial cuidado para el funcionamiento del sistema\'', 'teal', '11', 'secretaria', 'Descripcion de la funcionalidad, observaciones y advertencias', '1', '1', '2020-09-02 12:45:51', '2020-09-22 13:59:59');
INSERT INTO `asistente` VALUES ('14', 'Areas de Estudio', '27', 'Descripcion de la tarea de especial cuidado para el funcionamiento del sistema\'', 'cyan', '12', 'secretaria', 'Descripcion de la funcionalidad, observaciones y advertencias', '1', '1', '2020-09-02 12:46:47', '2020-09-22 13:59:59');
INSERT INTO `asistente` VALUES ('15', 'Materias', '28', 'Descripcion de la tarea de especial cuidado para el funcionamiento del sistema\'', 'cyan', '13', 'secretaria', 'Descripcion de la funcionalidad, observaciones y advertencias', '1', '1', '2020-09-02 12:47:03', '2020-09-22 13:59:59');
INSERT INTO `asistente` VALUES ('16', 'Niveles', '24', 'Descripcion de la tarea de especial cuidado para el funcionamiento del sistema\'', 'cyan', '14', 'secretaria', 'Descripcion de la funcionalidad, observaciones y advertencias', '1', '1', '2020-09-02 12:47:30', '2020-09-22 13:59:59');
INSERT INTO `asistente` VALUES ('17', 'Grados', '25', 'Descripcion de la tarea de especial cuidado para el funcionamiento del sistema\'', 'cyan', '15', 'secretaria', 'Descripcion de la funcionalidad, observaciones y advertencias', '1', '1', '2020-09-02 12:47:55', '2020-09-22 13:59:59');
INSERT INTO `asistente` VALUES ('18', 'Grupos', '26', 'Descripcion de la tarea de especial cuidado para el funcionamiento del sistema\'', 'cyan', '16', 'secretaria', 'Descripcion de la funcionalidad, observaciones y advertencias', '1', '1', '2020-09-02 12:48:08', '2020-09-22 13:59:59');
INSERT INTO `asistente` VALUES ('19', 'Docente', '37', 'Descripcion de la tarea de especial cuidado para el funcionamiento del sistema\'', 'pink', '17', 'secretaria', 'Descripcion de la funcionalidad, observaciones y advertencias', '1', '1', '2020-09-02 12:48:30', '2020-09-22 14:00:00');
INSERT INTO `asistente` VALUES ('20', 'Tipo Evaluacion', '33', 'Descripcion de la tarea de especial cuidado para el funcionamiento del sistema\'', 'purple', '18', 'secretaria', 'Descripcion de la funcionalidad, observaciones y advertencias', '1', '1', '2020-09-02 12:48:57', '2020-09-22 14:00:00');
INSERT INTO `asistente` VALUES ('21', 'Plan Evaluacion', '35', 'Descripcion de la tarea de especial cuidado para el funcionamiento del sistema\'', 'purple', '19', 'secretaria', 'Descripcion de la funcionalidad, observaciones y advertencias', '1', '1', '2020-09-02 12:49:11', '2020-09-22 14:00:00');
INSERT INTO `asistente` VALUES ('22', 'Horario', '36', 'Descripcion de la tarea de especial cuidado para el funcionamiento del sistema\'', 'purple', '20', 'secretaria', 'Descripcion de la funcionalidad, observaciones y advertencias', '1', '1', '2020-09-02 12:49:29', '2020-09-22 14:00:00');
INSERT INTO `asistente` VALUES ('24', 'Nivel Calificaciones', '31', 'Descripcion de la tarea de especial cuidado para el funcionamiento del sistema\'', 'purple', '21', 'secretaria', 'Descripcion de la funcionalidad, observaciones y advertencias', '1', '1', '2020-09-02 12:50:43', '2020-09-22 14:00:00');
INSERT INTO `asistente` VALUES ('25', 'Calificacion', '32', 'Descripcion de la tarea de especial cuidado para el funcionamiento del sistema\'', 'purple', '22', 'secretaria', 'Descripcion de la funcionalidad, observaciones y advertencias', '1', '1', '2020-09-02 12:50:57', '2020-09-22 14:00:00');
INSERT INTO `asistente` VALUES ('26', 'Condicion Alumno', '38', 'Descripcion de la tarea de especial cuidado para el funcionamiento del sistema\'', 'pink', '23', 'secretaria', 'Descripcion de la funcionalidad, observaciones y advertencias', '1', '1', '2020-09-02 12:51:14', '2020-09-22 14:00:00');
INSERT INTO `asistente` VALUES ('27', 'Alumnos', '39', 'Descripcion de la tarea de especial cuidado para el funcionamiento del sistema\'', 'pink', '24', 'secretaria', 'Descripcion de la funcionalidad, observaciones y advertencias', '1', '1', '2020-09-02 12:56:02', '2020-09-22 14:00:00');
INSERT INTO `asistente` VALUES ('28', 'Acudiente', '40', 'Descripcion de la tarea de especial cuidado para el funcionamiento del sistema\'', 'pink', '25', 'secretaria', 'Descripcion de la funcionalidad, observaciones y advertencias', '1', '1', '2020-09-02 12:56:18', '2020-09-22 14:00:00');
INSERT INTO `asistente` VALUES ('29', 'Feriados', '17', 'Descripcion de la tarea de especial cuidado para el funcionamiento del sistema\'', 'teal', '26', 'secretaria', 'Descripcion de la funcionalidad, observaciones y advertencias', '1', '1', '2020-09-02 12:56:43', '2020-09-22 14:00:00');
INSERT INTO `asistente` VALUES ('30', 'Tipo Agenda', '18', 'Descripcion de la tarea de especial cuidado para el funcionamiento del sistema\'', 'teal', '27', 'secretaria', 'Descripcion de la funcionalidad, observaciones y advertencias', '1', '1', '2020-09-02 12:57:00', '2020-09-22 14:00:00');
INSERT INTO `asistente` VALUES ('31', 'Tipo Actividad', '19', 'Descripcion de la tarea de especial cuidado para el funcionamiento del sistema\'', 'teal', '28', 'secretaria', 'Descripcion de la funcionalidad, observaciones y advertencias', '1', '1', '2020-09-02 12:57:29', '2020-09-22 14:00:00');
INSERT INTO `asistente` VALUES ('32', 'Agenda', '20', 'Descripcion de la tarea de especial cuidado para el funcionamiento del sistema\'', 'teal', '29', 'secretaria', 'Descripcion de la funcionalidad, observaciones y advertencias', '1', '1', '2020-09-02 12:57:43', '2020-09-22 14:00:00');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of calendario
-- ----------------------------
INSERT INTO `calendario` VALUES ('1', '2019-2020', '2019', '2019-10-17', '2020-07-27', null, '0', '1', '2020-05-09 11:41:33', '2020-11-10 18:54:18');
INSERT INTO `calendario` VALUES ('2', '2020-2021', '2020', '2020-10-14', '2021-07-13', null, '1', '1', '2020-06-10 21:06:08', '2020-11-10 18:54:27');

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
  `id_grupo_calificacion` int(11) NOT NULL,
  `id_tipo_calificacion` int(11) NOT NULL,
  `id_nivel_calificacion` int(11) NOT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of carga_horaria
-- ----------------------------
INSERT INTO `carga_horaria` VALUES ('1', 'DIR. GRUPO', '1', '1', '07:00:00', '07:45:00', '1', '1', null, '1', '1', '2020-05-10 03:06:24', '2020-09-21 14:22:36');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of cargo
-- ----------------------------
INSERT INTO `cargo` VALUES ('1', 'Director', null, '1', '1', '2020-05-09 14:09:04', '2020-05-09 14:09:04');
INSERT INTO `cargo` VALUES ('2', 'Subdirector', null, '1', '1', '2020-05-09 14:09:18', '2020-05-09 14:09:18');
INSERT INTO `cargo` VALUES ('3', 'Secretario', null, '1', '1', '2020-05-09 14:11:46', '2020-05-09 14:11:46');
INSERT INTO `cargo` VALUES ('4', 'Docente', null, '2', '1', '2020-05-16 00:18:43', '2020-05-16 00:18:43');

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
  UNIQUE KEY `ciudad_co_ciudad_unique` (`co_ciudad`,`id_departamento`) USING BTREE
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
  `id_grado` int(11) NOT NULL,
  `id_grupo` int(11) NOT NULL,
  `id_materia` int(11) NOT NULL,
  `id_docente` int(11) NOT NULL,
  `fe_clase` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fe_completada` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of clase
-- ----------------------------
INSERT INTO `clase` VALUES ('1', '4', '1', '7', '1', '2020-11-01 10:37:07', '2020-11-01 10:37:04', null, '1', '1', '2020-11-01 02:05:31', '2020-11-01 02:05:31');
INSERT INTO `clase` VALUES ('2', '4', '1', '19', '1', '2020-11-01 10:37:10', '2020-11-01 10:37:07', null, '1', '1', '2020-11-01 02:40:25', '2020-11-01 02:40:25');
INSERT INTO `clase` VALUES ('3', '4', '1', '19', '1', '2020-11-01 11:02:24', '2020-11-01 10:37:11', null, '1', '1', '2020-11-01 02:45:38', '2020-11-01 02:45:38');
INSERT INTO `clase` VALUES ('4', '4', '1', '7', '1', '2020-11-01 21:18:49', '2020-11-01 21:18:49', 'ninguna', '1', '1', '2020-11-01 13:39:34', '2020-11-02 01:18:49');
INSERT INTO `clase` VALUES ('8', '4', '1', '7', '1', '2020-11-01 21:19:46', '2020-11-01 21:19:46', 'finalizar', '1', '1', '2020-11-02 00:11:13', '2020-11-02 01:19:46');
INSERT INTO `clase` VALUES ('9', '4', '1', '7', '1', '2020-11-06 19:44:46', '2020-11-06 23:44:46', null, '1', '1', '2020-11-06 23:36:31', '2020-11-06 23:44:46');
INSERT INTO `clase` VALUES ('10', '4', '1', '7', '1', '2020-11-08 20:46:13', '2020-11-09 00:46:13', null, '1', '1', '2020-11-09 00:45:25', '2020-11-09 00:46:13');
INSERT INTO `clase` VALUES ('11', '4', '1', '17', '1', '2020-11-08 21:11:23', '2020-11-09 01:11:23', null, '1', '1', '2020-11-09 01:10:36', '2020-11-09 01:11:23');
INSERT INTO `clase` VALUES ('12', '4', '1', '7', '1', '2020-11-09 10:39:13', '2020-11-09 14:39:13', null, '1', '1', '2020-11-09 14:32:53', '2020-11-09 14:39:13');
INSERT INTO `clase` VALUES ('13', '4', '1', '7', '1', '2020-11-09 17:57:46', '2020-11-09 21:57:46', null, '1', '1', '2020-11-09 21:55:59', '2020-11-09 21:57:46');
INSERT INTO `clase` VALUES ('14', '4', '1', '7', '1', '2020-11-09 17:59:06', '2020-11-09 21:59:06', 'sejggfdjksdf', '1', '1', '2020-11-09 21:56:14', '2020-11-09 21:59:06');
INSERT INTO `clase` VALUES ('15', '4', '1', '7', '1', '2020-11-11 12:20:41', '2020-11-11 16:20:41', 'tetwe', '1', '1', '2020-11-11 16:18:59', '2020-11-11 16:20:41');
INSERT INTO `clase` VALUES ('16', '4', '1', '7', '1', '2020-11-12 12:39:45', '2020-11-12 16:39:45', null, '1', '1', '2020-11-12 16:38:38', '2020-11-12 16:39:45');
INSERT INTO `clase` VALUES ('17', '4', '1', '19', '1', '2020-11-12 12:40:36', '2020-11-12 16:40:36', null, '1', '1', '2020-11-12 16:39:57', '2020-11-12 16:40:36');
INSERT INTO `clase` VALUES ('18', '4', '1', '7', '1', '2020-11-27 22:16:36', '2020-11-28 02:16:36', null, '1', '1', '2020-11-28 00:40:30', '2020-11-28 02:16:36');

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
INSERT INTO `colegio` VALUES ('1', 'San Ignacio', '202000001', '1', '2', '1', '5', '76', '2', '2', '3', 'Calle 23 con calle 22', '4314124', '500', null, null, null, null, '1', '1', '2020-06-03 18:21:50', '2020-09-22 13:53:15');

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
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of detalle_horario
-- ----------------------------
INSERT INTO `detalle_horario` VALUES ('1', 'oVmJvgpZzpbkPN8xMrHTuktHWgpKNp0oA1EBZBNGbgjGpQZVIGMmriuiORpnCWSd', '2', '19', '2', '1', '2', '08:00:00', '08:45:00', '2', '1', '2', null, '1', '1', '2020-06-24 18:58:57', '2020-06-25 02:38:11');
INSERT INTO `detalle_horario` VALUES ('2', 'oVmJvgpZzpbkPN8xMrHTuktHWgpKNp0oA1EBZBNGbgjGpQZVIGMmriuiORpnCWSd', '2', '19', '2', '1', '2', '08:00:00', '08:45:00', '3', '1', '0', null, '1', '1', '2020-06-24 18:58:57', '2020-06-25 02:38:11');
INSERT INTO `detalle_horario` VALUES ('3', 'iG0XFXGK9lHyHXf6xRWyRi1qJYYQePB8vnnCWGXkMXBwragjkWUNG2ZJPaSQWviW', '2', '15', '1', '2', '3', '08:00:00', '08:45:00', '2', '1', '1', null, '1', '1', '2020-06-25 02:19:37', '2020-06-25 02:19:37');
INSERT INTO `detalle_horario` VALUES ('6', 'OGFufkkihSaS0zKh8ZEIpdG6Oc5iRqmPPP9a4Lju69Lwj9n0V0PWAeLj4pdZI4pC', '2', '17', '1', '3', '5', '13:00:00', '13:45:00', '7', '1', '1', null, '1', '1', '2020-06-25 02:42:05', '2020-06-25 02:42:05');
INSERT INTO `detalle_horario` VALUES ('54', 'PcKGqcVKFfnsdH1IuV8IX95eUpwQ7V9pdGF61yrrQHb6v9VzE9daNYlI0b491o7B', '2', '14', '1', '2', '6', '08:45:00', '09:30:00', '3', '1', '1', null, '1', '1', '2020-07-02 03:25:01', '2020-07-02 03:25:01');
INSERT INTO `detalle_horario` VALUES ('57', 'HO2MA7DO12DI5IN08:00FI08:45', '2', '7', '13', '5', '1', '08:00:00', '08:45:00', '2', '1', '1', null, '1', '1', '2020-09-22 23:44:40', '2020-09-23 19:17:31');
INSERT INTO `detalle_horario` VALUES ('58', 'HO2MA7DO12DI5IN08:45FI09:30', '2', '7', '13', '5', '1', '08:45:00', '09:30:00', '3', '1', '1', null, '1', '1', '2020-09-22 23:45:12', '2020-09-23 19:17:44');
INSERT INTO `detalle_horario` VALUES ('61', 'H2M17D13S5I13:00F13:45', '2', '17', '13', '5', '1', '13:00:00', '13:45:00', '7', '1', '2', null, '1', '1', '2020-09-22 23:47:59', '2020-09-22 23:47:59');
INSERT INTO `detalle_horario` VALUES ('62', 'H2M17D13S5I13:00F13:45', '2', '17', '13', '5', '1', '13:45:00', '14:30:00', '8', '1', '0', null, '1', '1', '2020-09-22 23:48:00', '2020-09-22 23:48:00');
INSERT INTO `detalle_horario` VALUES ('63', 'H2M14D14S1I10:15F11:00', '2', '14', '14', '1', '1', '10:15:00', '11:00:00', '5', '1', '1', null, '1', '1', '2020-09-23 15:39:50', '2020-09-23 15:39:50');
INSERT INTO `detalle_horario` VALUES ('64', 'H2M7D12S2I13:00F13:45', '2', '7', '12', '2', '5', '13:00:00', '13:45:00', '7', '1', '1', null, '1', '1', '2020-09-23 18:54:30', '2020-09-23 18:54:30');
INSERT INTO `detalle_horario` VALUES ('65', 'H1M7D12S1I08:00F08:45', '1', '7', '12', '1', '1', '08:00:00', '08:45:00', '2', '1', '2', null, '1', '1', '2020-09-23 19:21:28', '2020-09-23 19:21:28');
INSERT INTO `detalle_horario` VALUES ('66', 'H1M7D12S1I08:00F08:45', '1', '7', '12', '1', '1', '08:45:00', '09:30:00', '3', '1', '0', null, '1', '1', '2020-09-23 19:21:28', '2020-09-23 19:21:28');
INSERT INTO `detalle_horario` VALUES ('69', 'H1M16D11S1I10:15F11:00', '1', '16', '11', '1', '2', '10:15:00', '11:00:00', '5', '1', '1', null, '1', '1', '2020-09-23 19:22:24', '2020-09-23 19:22:24');
INSERT INTO `detalle_horario` VALUES ('70', 'H1M15D11S1I13:00F13:45', '1', '15', '11', '1', '6', '13:00:00', '13:45:00', '7', '1', '2', null, '1', '1', '2020-09-23 19:22:50', '2020-09-23 19:22:50');
INSERT INTO `detalle_horario` VALUES ('71', 'H1M15D11S1I13:00F13:45', '1', '15', '11', '1', '6', '13:45:00', '14:30:00', '8', '1', '0', null, '1', '1', '2020-09-23 19:22:50', '2020-09-23 19:22:50');
INSERT INTO `detalle_horario` VALUES ('72', 'H1M19D10S2I08:00F08:45', '1', '19', '10', '2', '2', '08:00:00', '08:45:00', '2', '1', '2', null, '1', '1', '2020-09-23 19:23:06', '2020-09-23 19:23:06');
INSERT INTO `detalle_horario` VALUES ('73', 'H1M19D10S2I08:00F08:45', '1', '19', '10', '2', '2', '08:45:00', '09:30:00', '3', '1', '0', null, '1', '1', '2020-09-23 19:23:07', '2020-09-23 19:23:07');
INSERT INTO `detalle_horario` VALUES ('77', 'H1M17D1S2I10:15F11:00', '1', '17', '1', '2', '4', '10:15:00', '11:00:00', '5', '1', '1', null, '1', '1', '2020-09-23 19:24:20', '2020-09-23 19:24:20');
INSERT INTO `detalle_horario` VALUES ('78', 'H1M17D1S2I13:00F13:45', '1', '17', '1', '2', '1', '13:00:00', '13:45:00', '7', '1', '2', null, '1', '1', '2020-09-23 19:24:37', '2020-09-23 19:24:37');
INSERT INTO `detalle_horario` VALUES ('79', 'H1M17D1S2I13:00F13:45', '1', '17', '1', '2', '1', '13:45:00', '14:30:00', '8', '1', '0', null, '1', '1', '2020-09-23 19:24:37', '2020-09-23 19:24:37');
INSERT INTO `detalle_horario` VALUES ('80', 'H1M7D12S3I08:00F08:45', '1', '7', '12', '3', '1', '08:00:00', '08:45:00', '2', '1', '2', null, '1', '1', '2020-09-23 19:24:52', '2020-09-23 19:24:52');
INSERT INTO `detalle_horario` VALUES ('81', 'H1M7D12S3I08:00F08:45', '1', '7', '12', '3', '1', '08:45:00', '09:30:00', '3', '1', '0', null, '1', '1', '2020-09-23 19:24:52', '2020-09-23 19:24:52');
INSERT INTO `detalle_horario` VALUES ('82', 'H1M19D10S3I10:15F11:00', '1', '19', '10', '3', '2', '10:15:00', '11:00:00', '5', '1', '1', null, '1', '1', '2020-09-23 19:25:35', '2020-09-23 19:25:35');
INSERT INTO `detalle_horario` VALUES ('83', 'H1M14D14S3I13:00F13:45', '1', '14', '14', '3', '2', '13:00:00', '13:45:00', '7', '1', '2', null, '1', '1', '2020-09-23 19:25:58', '2020-09-23 19:25:58');
INSERT INTO `detalle_horario` VALUES ('84', 'H1M14D14S3I13:00F13:45', '1', '14', '14', '3', '2', '13:45:00', '14:30:00', '8', '1', '0', null, '1', '1', '2020-09-23 19:25:58', '2020-09-23 19:25:58');
INSERT INTO `detalle_horario` VALUES ('85', 'H1M14D14S4I08:00F08:45', '1', '14', '14', '4', '4', '08:00:00', '08:45:00', '2', '1', '2', null, '1', '1', '2020-09-23 19:26:12', '2020-09-23 19:26:12');
INSERT INTO `detalle_horario` VALUES ('86', 'H1M14D14S4I08:00F08:45', '1', '14', '14', '4', '4', '08:45:00', '09:30:00', '3', '1', '0', null, '1', '1', '2020-09-23 19:26:12', '2020-09-23 19:26:12');
INSERT INTO `detalle_horario` VALUES ('89', 'H1M16D11S4I10:15F11:00', '1', '16', '11', '4', '3', '10:15:00', '11:00:00', '5', '1', '1', null, '1', '1', '2020-09-23 19:26:50', '2020-09-23 19:26:50');
INSERT INTO `detalle_horario` VALUES ('90', 'H1M19D10S4I13:00F13:45', '1', '19', '10', '4', '5', '13:00:00', '13:45:00', '7', '1', '2', null, '1', '1', '2020-09-23 19:27:13', '2020-09-23 19:27:13');
INSERT INTO `detalle_horario` VALUES ('91', 'H1M19D10S4I13:00F13:45', '1', '19', '10', '4', '5', '13:45:00', '14:30:00', '8', '1', '0', null, '1', '1', '2020-09-23 19:27:14', '2020-09-23 19:27:14');
INSERT INTO `detalle_horario` VALUES ('92', 'H1M15D11S5I08:00F08:45', '1', '15', '11', '5', '6', '08:00:00', '08:45:00', '2', '1', '2', null, '1', '1', '2020-09-23 19:27:28', '2020-09-23 19:27:28');
INSERT INTO `detalle_horario` VALUES ('93', 'H1M15D11S5I08:00F08:45', '1', '15', '11', '5', '6', '08:45:00', '09:30:00', '3', '1', '0', null, '1', '1', '2020-09-23 19:27:28', '2020-09-23 19:27:28');
INSERT INTO `detalle_horario` VALUES ('94', 'H1M7D12S5I10:15F11:00', '1', '7', '12', '5', '3', '10:15:00', '11:00:00', '5', '1', '1', null, '1', '1', '2020-09-23 19:27:40', '2020-09-23 19:27:40');
INSERT INTO `detalle_horario` VALUES ('95', 'H1M14D14S5I13:00F13:45', '1', '14', '14', '5', '4', '13:00:00', '13:45:00', '7', '1', '2', null, '1', '1', '2020-09-23 19:28:10', '2020-09-23 19:28:10');
INSERT INTO `detalle_horario` VALUES ('96', 'H1M14D14S5I13:00F13:45', '1', '14', '14', '5', '4', '13:45:00', '14:30:00', '8', '1', '0', null, '1', '1', '2020-09-23 19:28:10', '2020-09-23 19:28:10');
INSERT INTO `detalle_horario` VALUES ('97', 'H2M19D1S5I10:15F11:00', '2', '19', '1', '5', '4', '10:15:00', '11:00:00', '5', '1', '1', null, '1', '1', '2020-09-23 19:40:52', '2020-09-23 19:40:52');
INSERT INTO `detalle_horario` VALUES ('98', 'H2M19D10S5I10:15F11:00', '2', '19', '10', '5', '5', '10:15:00', '11:00:00', '5', '1', '1', null, '1', '1', '2020-09-23 19:41:05', '2020-09-23 19:41:05');
INSERT INTO `detalle_horario` VALUES ('99', 'H2M16D11S3I08:00F08:45', '2', '16', '11', '3', '6', '08:00:00', '08:45:00', '2', '1', '2', null, '1', '1', '2020-09-23 19:42:27', '2020-09-23 19:42:27');
INSERT INTO `detalle_horario` VALUES ('100', 'H2M16D11S3I08:00F08:45', '2', '16', '11', '3', '6', '08:45:00', '09:30:00', '3', '1', '0', null, '1', '1', '2020-09-23 19:42:27', '2020-09-23 19:42:27');

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
INSERT INTO `docente_materia` VALUES ('39', '1', '15', null, '1', '1', '2020-07-09 22:48:30', '2020-07-09 22:48:30');
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
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for enlace
-- ----------------------------
DROP TABLE IF EXISTS `enlace`;
CREATE TABLE `enlace` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_enlace` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `id_tipo_enlace` int(11) NOT NULL,
  `id_tema` int(11) NOT NULL,
  `tx_descripcion` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `tx_url` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of enlace
-- ----------------------------
INSERT INTO `enlace` VALUES ('35', 'Ciencia Express: La célula', '2', '70', '', 'https://www.youtube.com/embed/tM2wEWk0-GQ', null, '1', '1', '2020-11-16 12:25:57', '2020-11-16 12:28:13');
INSERT INTO `enlace` VALUES ('36', 'Tejidos animales', '2', '70', '', 'https://www.youtube.com/watch?v=9pvSA-23FYs&feature=youtu.be', null, '1', '1', '2020-11-16 12:29:31', '2020-11-16 12:29:31');
INSERT INTO `enlace` VALUES ('37', 'Niveles de organización de los seres vivos | Biología', '2', '72', '', 'https://www.youtube.com/watch?v=B2ab1nk2xt4&feature=youtu.be', null, '1', '1', '2020-11-16 16:39:01', '2020-11-16 16:39:01');
INSERT INTO `enlace` VALUES ('38', 'Ácidos nucleicos: ADN y ARN', '2', '72', '', 'https://www.youtube.com/watch?v=gHXMh_GPgcE&feature=youtu.be', null, '1', '1', '2020-11-16 16:39:47', '2020-11-16 16:40:33');
INSERT INTO `enlace` VALUES ('39', 'Significado de Estado sólido', '1', '57', '', 'https://www.significados.com/estado-solido/', null, '1', '1', null, null);
INSERT INTO `enlace` VALUES ('40', 'Significado de Estado líquido', '1', '57', '', 'https://www.significados.com/estado-liquido/', null, '1', '1', null, null);
INSERT INTO `enlace` VALUES ('41', 'Definición de alimentos ', '1', '58', '', 'https://www.definicion.de/alimento/', null, '1', '1', null, null);
INSERT INTO `enlace` VALUES ('42', 'Cómo se clasifican los alimentos: los 7 grupos', '1', '58', '', 'https://www.lifeder.com/clasificacion-alimentos/', null, '1', '1', null, null);
INSERT INTO `enlace` VALUES ('43', 'La pubertad en las niñas', '1', '60', '', 'https://www.ausonia.es/es-es/informate/la-adolescencia/la-pubertad-en-las-ninas', null, '1', '1', null, null);
INSERT INTO `enlace` VALUES ('44', 'Afrontar (sin miedo) la crisis de la pubertad en niños de 9 a 12 años', '1', '60', '', 'https://www.guiainfantil.com/adolescencia/cambios-psicologicos/afrontar-sin-miedo-la-crisis-de-la-pubertad-en-ninos-de-9-a-12-anos/', null, '1', '1', null, null);
INSERT INTO `enlace` VALUES ('45', 'Elemento químico', '1', '62', '', 'https://www.ecured.cu/Elemento_qu%C3%Admico', null, '1', '1', null, null);
INSERT INTO `enlace` VALUES ('46', 'Mezclas', '1', '62', '', 'https://www.ecured.cu/Mezclas', null, '1', '1', null, null);
INSERT INTO `enlace` VALUES ('47', '¿Qué es la energía solar y cómo funciona?', '1', '64', '', 'https://www.enel.pe/es/sostenibilidad/que-es-la-energia-solar-y-como-funciona.html', null, '1', '1', null, null);
INSERT INTO `enlace` VALUES ('48', '¿Qué es la energía eólica y cómo funciona?', '1', '64', '', 'https://www.enel.pe/es/sostenibilidad/que-es-la-energia-eolica-y-como-funciona.html', null, '1', '1', null, null);
INSERT INTO `enlace` VALUES ('49', 'Medio ambiente, panorama general', '1', '74', '', 'https://www.bancomundial.org/es/topic/environment/overview', null, '1', '1', null, null);
INSERT INTO `enlace` VALUES ('50', 'Conceptos de Ecosistemas', '1', '74', '', 'https://concepto.de/ecosistemas/', null, '1', '1', null, null);
INSERT INTO `enlace` VALUES ('51', '¿Qué es el Átomo?', '1', '68', '', 'https://www.geoenciclopedia.com/que-es-el-atomo/', null, '1', '1', null, null);
INSERT INTO `enlace` VALUES ('52', 'Masa Atómica', '1', '68', '', 'https://www.significados.com/masa-atomica/', null, '1', '1', null, null);
INSERT INTO `enlace` VALUES ('53', 'Concepto de reproducción celular', '1', '70', '¿Qué es la reproducción celular, la meiosis, la mitosis y sus fases?. Además, su importancia para la', 'https://concepto.de/reproduccion-celular/', null, '1', '1', null, null);
INSERT INTO `enlace` VALUES ('54', 'Reproducción asexual y sexual', '1', '70', '', 'https://www.abc.com.py/edicion-impresa/suplementos/escolar/la-reproduccion-sexual-y-asexual-446378.html', null, '1', '1', null, null);
INSERT INTO `enlace` VALUES ('55', '¿Qué es el pH?', '1', '72', '', 'https://culturacientifica.com/2019/11/28/que-es-el-ph/', null, '1', '1', null, null);
INSERT INTO `enlace` VALUES ('56', 'Soluciones Amortiguadoras: Características, Preparación, Ejemplos', '1', '72', '', 'https://www.lifeder.com/soluciones-amortiguadoras-buffers/', null, '1', '1', null, null);
INSERT INTO `enlace` VALUES ('57', 'Estados de la materia. Estado Solido', '2', '57', '', 'https://www.youtube.com/watch?v=YeV-d0K5oPY', null, '1', '1', null, null);
INSERT INTO `enlace` VALUES ('58', 'Cambios de estado de la materia', '2', '57', '', 'https://www.youtube.com/watch?v=aS7Tgj1oAy5', null, '1', '1', null, null);
INSERT INTO `enlace` VALUES ('59', 'Los alimentos', '2', '58', '', 'https://www.youtube.com/watch?v=EbZhQbyJgvQ', null, '1', '1', null, null);
INSERT INTO `enlace` VALUES ('60', 'CLASIFICACIÓN DE LOS ALIMENTOS SEGÚN SU FUNCIÓN /APRENDE EN CASA', '2', '58', '', 'https://www.youtube.com/watch?v=oSgqvE_1pRM', null, '1', '1', null, null);
INSERT INTO `enlace` VALUES ('61', 'Las niñas y la nueva pubertad', '2', '60', '', 'https://www.youtube.com/watch?v=1Istr8enXV8', null, '1', '1', null, null);
INSERT INTO `enlace` VALUES ('62', 'Etapas de la adolescencia', '2', '60', '', 'https://www.youtube.com/watch?v=dZiJp76DLe4', null, '1', '1', null, null);
INSERT INTO `enlace` VALUES ('63', 'Química: Los elementos químicos', '2', '62', '', 'https://www.youtube.com/watch?v=xe1VYxUY7Ys', null, '1', '1', null, null);
INSERT INTO `enlace` VALUES ('64', 'Mezclas homogéneas y heterogéneas', '2', '62', '', 'https://www.youtube.com/watch?v=gtgZPr3QhvA', null, '1', '1', null, null);
INSERT INTO `enlace` VALUES ('65', '¿Qué es la energía solar?', '2', '64', '', 'https://www.youtube.com/watch?v=5cVpl1WGmJA', null, '1', '1', null, null);
INSERT INTO `enlace` VALUES ('66', 'Las energías renovables', '2', '64', '', 'https://www.youtube.com/watch?v=4eEri5RivV8', null, '1', '1', null, null);
INSERT INTO `enlace` VALUES ('67', 'Calentamiento global, causas y concecuencias\n', '2', '74', '', 'https://www.youtube.com/watch?v=umAGi80FsPM', null, '1', '1', null, null);
INSERT INTO `enlace` VALUES ('68', 'Definición y tipos de ecosistemas', '2', '74', '¿Sabías que el estudio de los ecosistemas nos ayuda a describir cualquier rincón del planeta?', 'https://www.youtube.com/watch?v=3LeeVif_qSQ', null, '1', '1', null, null);
INSERT INTO `enlace` VALUES ('69', 'Estructura del átomo', '2', '68', 'Estructura del átomo explicado gráficamente.', 'https://www.youtube.com/watch?v=P_IpfoU_4qM', null, '1', '1', null, null);
INSERT INTO `enlace` VALUES ('70', 'Diferencia entre masa atómica, molecular y molar', '2', '68', 'Vídeo que enseña la diferencia entre masa atómica, molecular y molar', 'https://www.youtube.com/watch?v=KEJlFQRZh44', null, '1', '1', null, null);
INSERT INTO `enlace` VALUES ('71', 'La reproducción celular', '2', '70', 'La célula está viva porqué cumple con los procesos de la vida. Se reproduce, se alimenta y también m', 'https://www.youtube.com/watch?v=edInUsufUsc', null, '1', '1', null, null);
INSERT INTO `enlace` VALUES ('72', '', '2', '70', '', 'https://www.youtube.com/watch?v=rlohDJzwhZo', null, '1', '1', null, null);
INSERT INTO `enlace` VALUES ('73', 'Escalas de pH y pOH', '2', '72', '', 'https://www.youtube.com/watch?v=lcFX76W3QLs', null, '1', '1', null, null);
INSERT INTO `enlace` VALUES ('74', 'Soluciones amortiguadoras (buffer o tampón)', '2', '72', '', 'https://www.youtube.com/watch?v=_Rh3vYWCccM', null, '1', '1', null, null);
INSERT INTO `enlace` VALUES ('75', 'Yo sé cuidar mi cuerpo', '1', '2', '', 'https://securitasaldia.com.pe/yo-se-cuidar-mi-cuerpo/', null, '1', '1', null, null);
INSERT INTO `enlace` VALUES ('76', 'Importancia de la familia', '1', '3', '', 'https://importancias.com/familia/', null, '1', '1', null, null);
INSERT INTO `enlace` VALUES ('77', 'Paisaje geográfico', '1', '41', '', 'https://www.ecured.cu/Paisaje_geogr%C3%A1fico#:~:text=Concepto%3A,humano%2C%20presenta%20sus%20propias%20caracter%C3%ADsticas.&text=Es%20decir%20puede', null, '1', '1', null, null);
INSERT INTO `enlace` VALUES ('78', 'Como influye el clima en el paisaje', '1', '41', '', 'http://descubriendoelpaisaje.blogspot.com/2012/05/nuestro-planeta-posee-una-inmensa.html', null, '1', '1', null, null);
INSERT INTO `enlace` VALUES ('79', 'Cultura de Colombia', '1', '43', '', 'https://www.donquijote.org/es/cultura-colombiana/', null, '1', '1', null, null);
INSERT INTO `enlace` VALUES ('80', 'Colombia, un país de mitos y personajes fantásticos', '1', '43', '', 'https://www.colombia.co/cultura-colombiana/colombia-un-pais-de-mitos-y-personajes-fantasticos/', null, '1', '1', null, null);
INSERT INTO `enlace` VALUES ('81', 'Regiones en Colombia', '1', '45', '', 'https://encolombia.com/educacion-cultura/geografia/colombiana/colombia/regiones-en-colombia/', null, '1', '1', null, null);
INSERT INTO `enlace` VALUES ('82', 'Regiones naturales del mundo y características principales', '1', '45', '', 'https://www.noticiasvigo.es/regiones-naturales-del-mundo-y-caracteristicas-principales/', null, '1', '1', null, null);
INSERT INTO `enlace` VALUES ('83', 'Tipos de trabajos', '1', '47', '', 'https://www.tipos.co/tipos-de-trabajos/', null, '1', '1', null, null);
INSERT INTO `enlace` VALUES ('84', 'El medio de intercambio: El dinero', '1', '47', '', 'https://pablomartinscarpini.com/2019/08/24/el-medio-de-intercambio-el-dinero/', null, '1', '1', null, null);
INSERT INTO `enlace` VALUES ('85', '', '0', '0', '', '', null, '0', '0', null, null);
INSERT INTO `enlace` VALUES ('86', '', '0', '0', '', '', null, '0', '0', null, null);
INSERT INTO `enlace` VALUES ('87', 'Quién soy yo', '2', '2', '', 'https://www.youtube.com/watch?v=LZ2O3cShf_w', null, '1', '1', null, null);
INSERT INTO `enlace` VALUES ('88', 'La familia', '2', '3', '', 'https://www.youtube.com/watch?v=9p6DjK7NMTI', null, '1', '1', null, null);
INSERT INTO `enlace` VALUES ('89', 'El paisaje', '2', '41', '', 'https://youtu.be/LxgKYT8oDTo?t=19', null, '1', '1', null, null);
INSERT INTO `enlace` VALUES ('90', 'La influencia del clima en el paisaje', '2', '41', '', 'https://youtu.be/mnpwBISQ_10', null, '1', '1', null, null);
INSERT INTO `enlace` VALUES ('91', '¿Qué es la CULTURA?', '2', '43', '', 'https://www.youtube.com/watch?v=RpngVL4_jFY', null, '1', '1', null, null);
INSERT INTO `enlace` VALUES ('92', 'Mitos y leyendas', '2', '43', '', 'https://www.youtube.com/watch?v=sAQnrOhQt8M', null, '1', '1', null, null);
INSERT INTO `enlace` VALUES ('93', 'Regiones Naturales de Colombia', '2', '45', '', 'https://www.youtube.com/watch?v=SM-Mp1t9JuU', null, '1', '1', null, null);
INSERT INTO `enlace` VALUES ('94', 'Regiones Naturales del Mundo', '2', '45', '', 'https://www.youtube.com/watch?v=Bl7n36JMcEo', null, '1', '1', null, null);
INSERT INTO `enlace` VALUES ('95', 'El trabajo y su clasificación El sector primario, secundario y terciario', '2', '47', '', 'https://www.youtube.com/watch?v=5ns5zI7nL5I', null, '1', '1', null, null);
INSERT INTO `enlace` VALUES ('96', 'Qué es el dinero, funciones y tipos', '2', '47', '', 'https://www.youtube.com/watch?v=ZYcrw_62eXY', null, '1', '1', null, null);

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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `id_tipo_evaluacion` int(11) NOT NULL,
  `id_origen` int(11) DEFAULT NULL,
  `tx_origen` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `id_grupo` int(11) NOT NULL,
  `id_materia` int(11) DEFAULT NULL,
  `id_tema` int(11) DEFAULT NULL,
  `nu_peso` int(11) DEFAULT NULL,
  `fe_inicio` date NOT NULL,
  `fe_fin` date DEFAULT NULL,
  `hh_inicio` time NOT NULL,
  `hh_fin` time DEFAULT NULL,
  `nu_minutos` int(11) NOT NULL,
  `tx_observaciones` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of evaluacion
-- ----------------------------
INSERT INTO `evaluacion` VALUES ('9', '2', '9', 'prueba', '1', '7', '1', null, '0000-00-00', null, '00:00:00', null, '0', '', '0', '0', null, null);

-- ----------------------------
-- Table structure for evaluacion_alumno
-- ----------------------------
DROP TABLE IF EXISTS `evaluacion_alumno`;
CREATE TABLE `evaluacion_alumno` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_evaluacion` int(11) NOT NULL,
  `id_alumno` int(11) NOT NULL,
  `fe_evaluacion` date DEFAULT NULL,
  `hh_inicio` time DEFAULT NULL,
  `hh_fin` time DEFAULT NULL,
  `nu_calificacion` decimal(4,2) DEFAULT NULL,
  `id_calificacion` int(11) DEFAULT NULL,
  `tx_observaciones` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of evaluacion_alumno
-- ----------------------------

-- ----------------------------
-- Table structure for evaluacion_copy
-- ----------------------------
DROP TABLE IF EXISTS `evaluacion_copy`;
CREATE TABLE `evaluacion_copy` (
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
-- Records of evaluacion_copy
-- ----------------------------
INSERT INTO `evaluacion_copy` VALUES ('10', '2', '1', '1', '10', '2020-07-27', '2020-10-14', null, null, 'Historia de Colombia', null, '10', '1', '2020-05-28 01:14:26', '2020-09-07 15:07:43');
INSERT INTO `evaluacion_copy` VALUES ('11', '2', '1', '1', '10', '2020-07-27', '2020-10-22', null, null, 'Historia del Arte', null, '10', '1', '2020-05-28 01:15:17', '2020-09-07 15:07:58');
INSERT INTO `evaluacion_copy` VALUES ('12', '2', '8', '2', '25', '2020-07-28', '2020-10-07', null, null, 'Historia Universal', null, '10', '1', '2020-05-28 01:15:45', '2020-09-07 15:08:19');
INSERT INTO `evaluacion_copy` VALUES ('13', '2', '5', '3', '20', '2020-07-28', '2020-10-15', null, null, 'N/A', null, '11', '1', '2020-05-28 01:16:31', '2020-09-11 22:43:27');
INSERT INTO `evaluacion_copy` VALUES ('14', '2', '4', '3', '30', '2020-07-28', '2020-07-29', null, null, 'Historia Contemporanea', null, '10', '1', '2020-05-28 01:17:40', '2020-09-08 01:44:04');
INSERT INTO `evaluacion_copy` VALUES ('16', '2', '6', '2', '5', '2020-07-28', '2020-10-27', null, null, 'N/A', null, '11', '1', '2020-05-28 01:28:06', '2020-09-12 14:14:20');
INSERT INTO `evaluacion_copy` VALUES ('21', '6', '1', '0', '30', '2020-07-29', '2020-10-08', null, null, 'Epoca Colonial', null, '9', '1', '2020-06-29 18:00:07', '2020-06-29 18:00:07');
INSERT INTO `evaluacion_copy` VALUES ('22', '6', '4', '0', '30', '2020-07-30', '2020-10-11', null, null, 'La Gran Colombia', null, '9', '1', '2020-06-29 18:00:43', '2020-06-29 18:00:43');
INSERT INTO `evaluacion_copy` VALUES ('23', '6', '1', '0', '20', '2020-07-27', '2020-10-05', null, null, 'ddddd', null, '9', '1', '2020-07-06 15:31:31', '2020-07-16 06:01:57');
INSERT INTO `evaluacion_copy` VALUES ('24', '62', '1', '1', '20', '2020-08-22', '2020-10-22', null, null, 'Prueba de Suma y restas', null, '11', '1', '2020-08-15 20:43:32', '2020-09-12 15:09:53');
INSERT INTO `evaluacion_copy` VALUES ('25', '59', '1', '1', '12', '2020-08-11', '2020-10-19', null, null, 'prueba', null, '10', '1', '2020-08-18 18:34:53', '2020-08-20 01:20:34');
INSERT INTO `evaluacion_copy` VALUES ('26', '57', '1', '2', '45', '2020-08-18', '2020-10-19', '01:10:00', '18:30:00', 'sgdsg', null, '10', '1', '2020-08-18 19:48:51', '2020-08-19 13:26:56');
INSERT INTO `evaluacion_copy` VALUES ('27', '60', '1', null, '10', '2020-09-09', '2020-10-03', null, null, 'prueba multiplicacion', '', '9', '1', '2020-09-09 18:52:13', '2020-09-09 18:52:13');
INSERT INTO `evaluacion_copy` VALUES ('28', '62', '1', '1', '20', '2020-09-20', '2020-10-20', null, null, 'multiplicacion', null, '10', '1', '2020-09-09 18:53:08', '2020-09-09 19:50:16');

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
) ENGINE=InnoDB AUTO_INCREMENT=192 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of foto
-- ----------------------------
INSERT INTO `foto` VALUES ('23', 'alumno id: 2', '1594256255_2.jpg', '2', '2', null, '1', '1', '2020-07-09 00:57:35', '2020-07-09 00:57:35');
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
INSERT INTO `foto` VALUES ('70', 'docente id: 13', '1595029842_13.jpg', '3', '13', null, '1', '1', '2020-07-17 23:50:42', '2020-07-17 23:50:42');
INSERT INTO `foto` VALUES ('71', 'pariente id: 1', '1595721572_1.jpg', '5', '1', null, '1', '1', '2020-07-25 23:59:32', '2020-07-25 23:59:32');
INSERT INTO `foto` VALUES ('72', 'pariente id: 2', '1595721589_2.jpg', '5', '2', null, '1', '1', '2020-07-25 23:59:49', '2020-07-25 23:59:49');
INSERT INTO `foto` VALUES ('73', 'pariente id: 6', '1595721712_6.jpg', '5', '6', null, '1', '1', '2020-07-26 00:01:52', '2020-07-26 00:01:52');
INSERT INTO `foto` VALUES ('74', 'alumno id: 25', '1595870532_25.jpg', '2', '25', null, '1', '1', '2020-07-27 17:22:13', '2020-07-27 17:22:13');
INSERT INTO `foto` VALUES ('76', 'alumno id: 15', '1596170462_15.jpg', '2', '15', null, '1', '1', '2020-07-31 04:41:02', '2020-07-31 04:41:02');
INSERT INTO `foto` VALUES ('77', 'docente id: 14', '1597773906_14.jpg', '3', '14', null, '1', '1', '2020-08-18 18:05:06', '2020-08-18 18:05:06');
INSERT INTO `foto` VALUES ('78', 'cuenta id: 2', '1599229382_2.jpg', '4', '2', null, '1', '2', '2020-09-04 14:23:03', '2020-09-04 14:23:03');
INSERT INTO `foto` VALUES ('83', 'colegio id: 100', '1603829257_100.jpg', '1', '100', null, '1', '1', '2020-10-27 20:07:37', '2020-10-27 20:07:37');
INSERT INTO `foto` VALUES ('122', 'actividad id: 5', '1604152501_5.jpg', '6', '5', null, '1', '1', '2020-10-31 13:55:01', '2020-10-31 13:55:01');
INSERT INTO `foto` VALUES ('123', 'pregunta id: 98', '1604854203_98.jpg', '7', '98', null, '1', '1', '2020-11-08 16:50:03', '2020-11-08 16:50:03');
INSERT INTO `foto` VALUES ('124', 'pregunta id: 98', '1604855295_98.jpg', '7', '98', null, '1', '1', '2020-11-08 17:08:15', '2020-11-08 17:08:15');
INSERT INTO `foto` VALUES ('125', 'pregunta id: 98', '1604855339_98.jpg', '7', '98', null, '1', '1', '2020-11-08 17:08:59', '2020-11-08 17:08:59');
INSERT INTO `foto` VALUES ('126', 'pregunta id: 98', '1604855445_98.jpg', '7', '98', null, '1', '1', '2020-11-08 17:10:45', '2020-11-08 17:10:45');
INSERT INTO `foto` VALUES ('133', 'pregunta id: 103', '1604864650_103.jpg', '7', '103', null, '1', '1', '2020-11-08 19:44:10', '2020-11-08 19:44:10');
INSERT INTO `foto` VALUES ('136', 'cuenta id: 1', '1604884778_1.jpg', '4', '1', null, '1', '1', '2020-11-09 01:19:38', '2020-11-09 01:19:38');
INSERT INTO `foto` VALUES ('138', 'alumno id: 107', '1605024753_107.jpg', '2', '107', null, '1', '1', '2020-11-10 16:12:34', '2020-11-10 16:12:34');
INSERT INTO `foto` VALUES ('139', 'alumno id: 87', '1605024802_87.jpg', '2', '87', null, '1', '1', '2020-11-10 16:13:22', '2020-11-10 16:13:22');
INSERT INTO `foto` VALUES ('140', 'alumno id: 105', '1605024828_105.jpg', '2', '105', null, '1', '1', '2020-11-10 16:13:48', '2020-11-10 16:13:48');
INSERT INTO `foto` VALUES ('141', 'alumno id: 45', '1605024863_45.jpg', '2', '45', null, '1', '1', '2020-11-10 16:14:23', '2020-11-10 16:14:23');
INSERT INTO `foto` VALUES ('142', 'alumno id: 103', '1605024907_103.jpg', '2', '103', null, '1', '1', '2020-11-10 16:15:07', '2020-11-10 16:15:07');
INSERT INTO `foto` VALUES ('143', 'colegio id: 1', '1605026559_1.jpg', '1', '1', null, '1', '1', '2020-11-10 16:42:39', '2020-11-10 16:42:39');
INSERT INTO `foto` VALUES ('146', 'pregunta id: 104', '1605097972_104.jpg', '7', '104', null, '1', '1', '2020-11-11 12:32:52', '2020-11-11 12:32:52');
INSERT INTO `foto` VALUES ('151', 'actividad id: 20', '1606431555_20.jpg', '6', '20', null, '1', '1', '2020-11-26 22:59:15', '2020-11-26 22:59:15');
INSERT INTO `foto` VALUES ('156', 'actividad id: 39', '1607209261_39.jpg', '6', '39', null, '1', '1', '2020-12-05 23:01:01', '2020-12-05 23:01:01');
INSERT INTO `foto` VALUES ('159', 'actividad id: 40', '1607209579_40.jpg', '6', '40', null, '1', '1', '2020-12-05 23:06:19', '2020-12-05 23:06:19');
INSERT INTO `foto` VALUES ('160', 'actividad id: 41', '1607213032_41.jpg', '6', '41', null, '1', '1', '2020-12-06 00:03:52', '2020-12-06 00:03:52');
INSERT INTO `foto` VALUES ('162', 'actividad id: 42', '1607213197_42.jpg', '6', '42', null, '1', '1', '2020-12-06 00:06:37', '2020-12-06 00:06:37');
INSERT INTO `foto` VALUES ('163', 'actividad id: 43', '1607213430_43.jpg', '6', '43', null, '1', '1', '2020-12-06 00:10:30', '2020-12-06 00:10:30');
INSERT INTO `foto` VALUES ('164', 'actividad id: 44', '1607213601_44.jpg', '6', '44', null, '1', '1', '2020-12-06 00:13:21', '2020-12-06 00:13:21');
INSERT INTO `foto` VALUES ('165', 'pregunta id: 140', '1607218507_140.jpg', '7', '140', null, '1', '1', '2020-12-06 01:35:07', '2020-12-06 01:35:07');
INSERT INTO `foto` VALUES ('167', 'actividad id: 45', '1607219934_45.jpg', '6', '45', null, '1', '1', '2020-12-06 01:58:54', '2020-12-06 01:58:54');
INSERT INTO `foto` VALUES ('169', 'actividad id: 46', '1607220173_46.jpg', '6', '46', null, '1', '1', '2020-12-06 02:02:53', '2020-12-06 02:02:53');
INSERT INTO `foto` VALUES ('171', 'actividad id: 47', '1607221606_47.jpg', '6', '47', null, '1', '1', '2020-12-06 02:26:46', '2020-12-06 02:26:46');
INSERT INTO `foto` VALUES ('175', 'actividad id: 48', '1607222147_48.jpg', '6', '48', null, '1', '1', '2020-12-06 02:35:47', '2020-12-06 02:35:47');
INSERT INTO `foto` VALUES ('176', 'actividad id: 18', '1607223751_18.jpg', '6', '18', null, '1', '1', '2020-12-06 03:02:31', '2020-12-06 03:02:31');
INSERT INTO `foto` VALUES ('179', 'actividad id: 51', '1607224605_51.jpg', '6', '51', null, '1', '1', '2020-12-06 03:16:45', '2020-12-06 03:16:45');
INSERT INTO `foto` VALUES ('180', 'actividad id: 52', '1607224631_52.jpg', '6', '52', null, '1', '1', '2020-12-06 03:17:11', '2020-12-06 03:17:11');
INSERT INTO `foto` VALUES ('181', 'pregunta id: 166', '1607225464_166.jpg', '7', '166', null, '1', '1', '2020-12-06 03:31:04', '2020-12-06 03:31:04');
INSERT INTO `foto` VALUES ('182', 'pregunta id: 149', '1607225762_149.jpg', '7', '149', null, '1', '1', '2020-12-06 03:36:02', '2020-12-06 03:36:02');
INSERT INTO `foto` VALUES ('183', 'actividad id: 53', '1607226092_53.jpg', '6', '53', null, '1', '1', '2020-12-06 03:41:32', '2020-12-06 03:41:32');
INSERT INTO `foto` VALUES ('184', 'actividad id: 54', '1607226133_54.jpg', '6', '54', null, '1', '1', '2020-12-06 03:42:13', '2020-12-06 03:42:13');
INSERT INTO `foto` VALUES ('185', 'actividad id: 55', '1607227167_55.jpg', '6', '55', null, '1', '1', '2020-12-06 03:59:27', '2020-12-06 03:59:27');
INSERT INTO `foto` VALUES ('186', 'actividad id: 56', '1607227213_56.jpg', '6', '56', null, '1', '1', '2020-12-06 04:00:13', '2020-12-06 04:00:13');
INSERT INTO `foto` VALUES ('187', 'actividad id: 57', '1607231047_57.jpg', '6', '57', null, '1', '1', '2020-12-06 05:04:07', '2020-12-06 05:04:07');
INSERT INTO `foto` VALUES ('188', 'actividad id: 58', '1607231405_58.jpg', '6', '58', null, '1', '1', '2020-12-06 05:10:05', '2020-12-06 05:10:05');
INSERT INTO `foto` VALUES ('190', 'actividad id: 59', '1607232073_59.jpg', '6', '59', null, '1', '1', '2020-12-06 05:21:13', '2020-12-06 05:21:13');
INSERT INTO `foto` VALUES ('191', 'actividad id: 60', '1607232098_60.jpg', '6', '60', null, '1', '1', '2020-12-06 05:21:38', '2020-12-06 05:21:38');

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
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
INSERT INTO `grado_materia` VALUES ('27', '1', '18', null, '1', '1', '2020-09-21 20:02:05', '2020-09-21 20:02:05');
INSERT INTO `grado_materia` VALUES ('28', '8', '19', null, '1', '1', '2020-10-26 15:42:07', '2020-10-26 15:42:07');
INSERT INTO `grado_materia` VALUES ('29', '8', '7', null, '1', '1', '2020-10-26 15:42:24', '2020-10-26 15:42:24');
INSERT INTO `grado_materia` VALUES ('30', '8', '14', null, '1', '1', '2020-10-26 15:42:36', '2020-10-26 15:42:36');
INSERT INTO `grado_materia` VALUES ('31', '8', '15', null, '1', '1', '2020-10-26 15:42:50', '2020-10-26 15:42:50');
INSERT INTO `grado_materia` VALUES ('32', '5', '14', null, '1', '1', '2020-10-26 15:46:12', '2020-10-26 15:46:12');
INSERT INTO `grado_materia` VALUES ('33', '5', '15', null, '1', '1', '2020-10-26 15:51:07', '2020-10-26 15:51:07');
INSERT INTO `grado_materia` VALUES ('34', '9', '15', null, '1', '1', '2020-11-10 15:53:22', '2020-11-10 15:53:22');
INSERT INTO `grado_materia` VALUES ('35', '9', '14', null, '1', '1', '2020-11-10 15:54:01', '2020-11-10 15:54:01');
INSERT INTO `grado_materia` VALUES ('36', '9', '19', null, '1', '1', '2020-11-10 15:54:21', '2020-11-10 15:54:21');
INSERT INTO `grado_materia` VALUES ('37', '9', '7', null, '1', '1', '2020-11-10 15:54:30', '2020-11-10 15:54:30');
INSERT INTO `grado_materia` VALUES ('38', '10', '15', null, '1', '1', '2020-11-10 15:54:40', '2020-11-10 15:54:40');
INSERT INTO `grado_materia` VALUES ('39', '10', '14', null, '1', '1', '2020-11-10 15:54:49', '2020-11-10 15:54:49');
INSERT INTO `grado_materia` VALUES ('40', '10', '7', null, '1', '1', '2020-11-10 15:54:59', '2020-11-10 15:54:59');
INSERT INTO `grado_materia` VALUES ('41', '10', '19', null, '1', '1', '2020-11-10 15:55:10', '2020-11-10 15:55:10');
INSERT INTO `grado_materia` VALUES ('42', '11', '15', null, '1', '1', '2020-11-10 15:55:27', '2020-11-10 15:55:27');
INSERT INTO `grado_materia` VALUES ('43', '11', '14', null, '1', '1', '2020-11-10 15:55:36', '2020-11-10 15:55:36');
INSERT INTO `grado_materia` VALUES ('44', '11', '7', null, '1', '1', '2020-11-10 15:55:58', '2020-11-10 15:55:58');
INSERT INTO `grado_materia` VALUES ('45', '11', '19', null, '1', '1', '2020-11-10 15:56:05', '2020-11-10 15:56:05');
INSERT INTO `grado_materia` VALUES ('46', '12', '7', null, '1', '1', '2020-11-10 15:56:14', '2020-11-10 15:56:14');
INSERT INTO `grado_materia` VALUES ('47', '12', '19', null, '1', '1', '2020-11-10 15:56:22', '2020-11-10 15:56:22');
INSERT INTO `grado_materia` VALUES ('48', '12', '14', null, '1', '1', '2020-11-10 15:56:31', '2020-11-10 15:56:31');
INSERT INTO `grado_materia` VALUES ('49', '12', '15', null, '1', '1', '2020-11-10 15:56:40', '2020-11-10 15:56:40');
INSERT INTO `grado_materia` VALUES ('57', '6', '7', null, '1', '1', '2020-12-05 23:52:55', '2020-12-05 23:52:55');
INSERT INTO `grado_materia` VALUES ('58', '5', '7', null, '1', '1', '2020-12-05 23:53:08', '2020-12-05 23:53:08');
INSERT INTO `grado_materia` VALUES ('59', '5', '19', null, '1', '1', '2020-12-05 23:53:12', '2020-12-05 23:53:12');
INSERT INTO `grado_materia` VALUES ('60', '6', '19', null, '1', '1', '2020-12-05 23:53:25', '2020-12-05 23:53:25');
INSERT INTO `grado_materia` VALUES ('61', '7', '7', null, '1', '1', '2020-12-05 23:53:35', '2020-12-05 23:53:35');
INSERT INTO `grado_materia` VALUES ('62', '7', '19', null, '1', '1', '2020-12-05 23:53:59', '2020-12-05 23:53:59');
INSERT INTO `grado_materia` VALUES ('63', '13', '7', null, '1', '1', '2020-12-05 23:54:39', '2020-12-05 23:54:39');
INSERT INTO `grado_materia` VALUES ('64', '13', '19', null, '1', '1', '2020-12-05 23:54:42', '2020-12-05 23:54:42');
INSERT INTO `grado_materia` VALUES ('65', '14', '7', null, '1', '1', '2020-12-05 23:55:00', '2020-12-05 23:55:00');
INSERT INTO `grado_materia` VALUES ('66', '14', '19', null, '1', '1', '2020-12-05 23:55:04', '2020-12-05 23:55:04');

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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of grupo
-- ----------------------------
INSERT INTO `grupo` VALUES ('1', 'Grupo 1ºA', '4', '1', '2', '1', '1', null, '1', '1', '2020-05-16 19:19:15', '2020-09-22 13:50:39');
INSERT INTO `grupo` VALUES ('2', 'Grupo 1ºB', '4', '1', '2', '2', '2', null, '1', '1', '2020-05-16 19:58:29', '2020-09-22 13:50:47');
INSERT INTO `grupo` VALUES ('3', 'Grupo 1ºC', '4', '2', '2', '2', '3', null, '1', '1', '2020-05-16 20:10:17', '2020-09-22 13:50:56');
INSERT INTO `grupo` VALUES ('4', 'Grupo 1ºD', '4', '2', '2', '1', '4', null, '1', '1', '2020-05-16 20:10:44', '2020-09-22 13:51:12');
INSERT INTO `grupo` VALUES ('5', 'J Unico', '2', '1', '2', '1', '1', null, '1', '1', '2020-07-09 13:16:37', '2020-09-22 13:50:19');
INSERT INTO `grupo` VALUES ('6', 'PJ Unico', '1', '1', '2', '13', '1', null, '1', '1', '2020-07-09 13:17:39', '2020-09-22 13:50:00');
INSERT INTO `grupo` VALUES ('7', 'T Unico', '3', '1', '2', '23', '1', null, '1', '1', '2020-07-09 13:18:32', '2020-09-22 13:50:29');
INSERT INTO `grupo` VALUES ('8', 'Grupo 2ºA', '5', '1', '2', '32', '1', null, '1', '1', '2020-07-09 13:19:20', '2020-09-22 13:51:29');
INSERT INTO `grupo` VALUES ('9', 'Grupo 2ºB', '5', '2', '2', '47', '2', null, '1', '1', '2020-07-09 13:20:03', '2020-09-22 13:51:21');
INSERT INTO `grupo` VALUES ('10', 'Grupo 3ºA', '6', '1', '2', '67', '1', null, '1', '1', '2020-07-09 13:22:21', '2020-09-22 13:51:47');
INSERT INTO `grupo` VALUES ('11', 'Grupo 3ºB', '6', '1', '2', '75', '2', null, '1', '1', '2020-07-09 13:22:53', '2020-09-22 13:51:39');
INSERT INTO `grupo` VALUES ('12', 'Grupo 4ºA', '7', '1', '2', '84', '1', null, '1', '1', '2020-07-09 13:23:34', '2020-09-22 13:52:04');
INSERT INTO `grupo` VALUES ('13', 'Grupo 4ºB', '7', '2', '2', '98', '2', null, '1', '1', '2020-07-09 13:24:00', '2020-09-22 13:51:55');
INSERT INTO `grupo` VALUES ('14', 'Grupo 5ºA', '8', '1', '2', '104', '1', null, '1', '1', '2020-07-09 13:24:27', '2020-09-22 13:52:14');
INSERT INTO `grupo` VALUES ('15', 'Grupo 5ºB', '8', '2', '2', '109', '2', null, '1', '1', '2020-07-09 13:24:54', '2020-09-22 13:52:24');
INSERT INTO `grupo` VALUES ('17', 'Grupo 6ºB', '9', '2', '2', '105', '2', null, '1', '1', '2020-07-09 13:25:56', '2020-11-10 15:35:37');
INSERT INTO `grupo` VALUES ('19', 'Grupo 6ºA', '9', '1', '2', '1', '1', null, '1', '1', '2020-07-18 00:29:20', '2020-07-18 00:29:20');
INSERT INTO `grupo` VALUES ('21', 'Grupo 7ºA', '10', '1', '2', '2', '1', null, '1', '1', '2020-11-10 15:39:18', '2020-11-10 15:39:18');
INSERT INTO `grupo` VALUES ('22', 'Grupo 7ºB', '10', '2', '2', '12', '2', null, '1', '1', '2020-11-10 15:46:49', '2020-11-10 15:46:49');
INSERT INTO `grupo` VALUES ('23', 'Grupo 8ºA', '11', '1', '2', '12', '1', null, '1', '1', '2020-11-10 15:47:45', '2020-11-10 15:47:45');
INSERT INTO `grupo` VALUES ('24', 'Grupo 8ºB', '11', '2', '2', '10', '2', null, '1', '1', '2020-11-10 15:48:13', '2020-11-10 15:48:13');
INSERT INTO `grupo` VALUES ('25', 'Grupo 9ºA', '12', '1', '2', '13', '1', null, '1', '1', '2020-11-10 15:52:06', '2020-11-10 15:52:06');
INSERT INTO `grupo` VALUES ('26', 'Grupo 9ºB', '12', '2', '2', '24', '2', null, '1', '1', '2020-11-10 15:52:31', '2020-11-10 15:52:31');
INSERT INTO `grupo` VALUES ('27', 'Grupo 10ºA', '13', '1', '2', '1', '1', null, '1', '1', '2020-12-05 23:57:54', '2020-12-05 23:57:54');
INSERT INTO `grupo` VALUES ('28', 'Grupo 11ºA', '14', '1', '2', '2', '1', null, '1', '1', '2020-12-05 23:58:22', '2020-12-05 23:58:22');

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
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of grupo_materia
-- ----------------------------
INSERT INTO `grupo_materia` VALUES ('1', '1', '7', null, '1', '1', '2020-07-19 01:01:00', '2020-07-19 01:01:00');
INSERT INTO `grupo_materia` VALUES ('2', '1', '19', null, '1', '1', '2020-07-19 01:08:26', '2020-07-19 01:08:26');
INSERT INTO `grupo_materia` VALUES ('3', '1', '17', null, '1', '1', '2020-07-19 01:08:43', '2020-07-19 01:08:43');
INSERT INTO `grupo_materia` VALUES ('4', '1', '15', null, '1', '1', '2020-07-19 01:08:46', '2020-07-19 01:08:46');
INSERT INTO `grupo_materia` VALUES ('5', '1', '14', null, '1', '1', '2020-07-19 01:08:48', '2020-07-19 01:08:48');
INSERT INTO `grupo_materia` VALUES ('7', '6', '18', null, '1', '1', '2020-09-21 21:04:37', '2020-09-21 21:04:37');
INSERT INTO `grupo_materia` VALUES ('8', '6', '14', null, '1', '1', '2020-09-21 21:05:26', '2020-09-21 21:05:26');
INSERT INTO `grupo_materia` VALUES ('9', '14', '7', null, '1', '1', '2020-10-26 15:44:28', '2020-10-26 15:44:28');
INSERT INTO `grupo_materia` VALUES ('10', '14', '19', null, '1', '1', '2020-10-26 15:44:31', '2020-10-26 15:44:31');
INSERT INTO `grupo_materia` VALUES ('11', '14', '15', null, '1', '1', '2020-10-26 15:44:34', '2020-10-26 15:44:34');
INSERT INTO `grupo_materia` VALUES ('12', '14', '14', null, '1', '1', '2020-10-26 15:44:36', '2020-10-26 15:44:36');
INSERT INTO `grupo_materia` VALUES ('13', '15', '7', null, '1', '1', '2020-11-10 15:59:10', '2020-11-10 15:59:10');
INSERT INTO `grupo_materia` VALUES ('14', '15', '19', null, '1', '1', '2020-11-10 15:59:13', '2020-11-10 15:59:13');
INSERT INTO `grupo_materia` VALUES ('15', '15', '15', null, '1', '1', '2020-11-10 15:59:15', '2020-11-10 15:59:15');
INSERT INTO `grupo_materia` VALUES ('16', '15', '14', null, '1', '1', '2020-11-10 15:59:18', '2020-11-10 15:59:18');
INSERT INTO `grupo_materia` VALUES ('17', '17', '7', null, '1', '1', '2020-11-10 15:59:29', '2020-11-10 15:59:29');
INSERT INTO `grupo_materia` VALUES ('18', '17', '19', null, '1', '1', '2020-11-10 15:59:32', '2020-11-10 15:59:32');
INSERT INTO `grupo_materia` VALUES ('19', '17', '15', null, '1', '1', '2020-11-10 15:59:34', '2020-11-10 15:59:34');
INSERT INTO `grupo_materia` VALUES ('20', '17', '14', null, '1', '1', '2020-11-10 15:59:37', '2020-11-10 15:59:37');
INSERT INTO `grupo_materia` VALUES ('21', '19', '7', null, '1', '1', '2020-11-10 15:59:48', '2020-11-10 15:59:48');
INSERT INTO `grupo_materia` VALUES ('22', '19', '19', null, '1', '1', '2020-11-10 15:59:50', '2020-11-10 15:59:50');
INSERT INTO `grupo_materia` VALUES ('23', '19', '15', null, '1', '1', '2020-11-10 15:59:53', '2020-11-10 15:59:53');
INSERT INTO `grupo_materia` VALUES ('24', '19', '14', null, '1', '1', '2020-11-10 15:59:55', '2020-11-10 15:59:55');
INSERT INTO `grupo_materia` VALUES ('25', '22', '7', null, '1', '1', '2020-11-10 16:00:06', '2020-11-10 16:00:06');
INSERT INTO `grupo_materia` VALUES ('26', '22', '19', null, '1', '1', '2020-11-10 16:00:09', '2020-11-10 16:00:09');
INSERT INTO `grupo_materia` VALUES ('27', '22', '15', null, '1', '1', '2020-11-10 16:00:12', '2020-11-10 16:00:12');
INSERT INTO `grupo_materia` VALUES ('28', '22', '14', null, '1', '1', '2020-11-10 16:00:14', '2020-11-10 16:00:14');
INSERT INTO `grupo_materia` VALUES ('29', '21', '7', null, '1', '1', '2020-11-10 16:00:24', '2020-11-10 16:00:24');
INSERT INTO `grupo_materia` VALUES ('30', '21', '19', null, '1', '1', '2020-11-10 16:00:27', '2020-11-10 16:00:27');
INSERT INTO `grupo_materia` VALUES ('31', '21', '15', null, '1', '1', '2020-11-10 16:00:29', '2020-11-10 16:00:29');
INSERT INTO `grupo_materia` VALUES ('32', '21', '14', null, '1', '1', '2020-11-10 16:00:32', '2020-11-10 16:00:32');
INSERT INTO `grupo_materia` VALUES ('33', '23', '7', null, '1', '1', '2020-11-10 16:00:42', '2020-11-10 16:00:42');
INSERT INTO `grupo_materia` VALUES ('34', '23', '19', null, '1', '1', '2020-11-10 16:00:45', '2020-11-10 16:00:45');
INSERT INTO `grupo_materia` VALUES ('35', '23', '15', null, '1', '1', '2020-11-10 16:00:47', '2020-11-10 16:00:47');
INSERT INTO `grupo_materia` VALUES ('36', '23', '14', null, '1', '1', '2020-11-10 16:00:50', '2020-11-10 16:00:50');
INSERT INTO `grupo_materia` VALUES ('37', '24', '7', null, '1', '1', '2020-11-10 16:00:59', '2020-11-10 16:00:59');
INSERT INTO `grupo_materia` VALUES ('38', '24', '19', null, '1', '1', '2020-11-10 16:01:02', '2020-11-10 16:01:02');
INSERT INTO `grupo_materia` VALUES ('39', '24', '15', null, '1', '1', '2020-11-10 16:01:04', '2020-11-10 16:01:04');
INSERT INTO `grupo_materia` VALUES ('40', '24', '14', null, '1', '1', '2020-11-10 16:01:07', '2020-11-10 16:01:07');
INSERT INTO `grupo_materia` VALUES ('41', '25', '7', null, '1', '1', '2020-11-10 16:01:18', '2020-11-10 16:01:18');
INSERT INTO `grupo_materia` VALUES ('42', '25', '19', null, '1', '1', '2020-11-10 16:01:21', '2020-11-10 16:01:21');
INSERT INTO `grupo_materia` VALUES ('43', '25', '15', null, '1', '1', '2020-11-10 16:01:23', '2020-11-10 16:01:23');
INSERT INTO `grupo_materia` VALUES ('44', '25', '14', null, '1', '1', '2020-11-10 16:01:26', '2020-11-10 16:01:26');
INSERT INTO `grupo_materia` VALUES ('45', '26', '7', null, '1', '1', '2020-11-10 16:01:34', '2020-11-10 16:01:34');
INSERT INTO `grupo_materia` VALUES ('46', '26', '19', null, '1', '1', '2020-11-10 16:01:36', '2020-11-10 16:01:36');
INSERT INTO `grupo_materia` VALUES ('47', '26', '15', null, '1', '1', '2020-11-10 16:01:38', '2020-11-10 16:01:38');
INSERT INTO `grupo_materia` VALUES ('48', '26', '14', null, '1', '1', '2020-11-10 16:01:41', '2020-11-10 16:01:41');
INSERT INTO `grupo_materia` VALUES ('49', '8', '7', null, '1', '1', '2020-12-05 23:55:38', '2020-12-05 23:55:38');
INSERT INTO `grupo_materia` VALUES ('50', '8', '19', null, '1', '1', '2020-12-05 23:55:41', '2020-12-05 23:55:41');
INSERT INTO `grupo_materia` VALUES ('51', '10', '7', null, '1', '1', '2020-12-05 23:56:10', '2020-12-05 23:56:10');
INSERT INTO `grupo_materia` VALUES ('52', '10', '19', null, '1', '1', '2020-12-05 23:56:13', '2020-12-05 23:56:13');
INSERT INTO `grupo_materia` VALUES ('53', '12', '7', null, '1', '1', '2020-12-05 23:56:29', '2020-12-05 23:56:29');
INSERT INTO `grupo_materia` VALUES ('54', '12', '19', null, '1', '1', '2020-12-05 23:56:32', '2020-12-05 23:56:32');
INSERT INTO `grupo_materia` VALUES ('55', '27', '7', null, '1', '1', null, null);
INSERT INTO `grupo_materia` VALUES ('56', '27', '19', null, '1', '1', null, null);
INSERT INTO `grupo_materia` VALUES ('57', '28', '7', null, '1', '1', null, null);
INSERT INTO `grupo_materia` VALUES ('58', '28', '19', null, '1', '1', null, null);

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of hora_academica
-- ----------------------------
INSERT INTO `hora_academica` VALUES ('1', 'General', '0', null, '1', '1', null, '2020-09-21 14:15:56');

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of incidencia
-- ----------------------------
INSERT INTO `incidencia` VALUES ('1', '1', '2020-07-30', '1', 'Pelea en el Comedor', '1', 'Se solicita a los padres reunion', null, '1', '1', '2020-07-30 23:21:33', '2020-07-30 23:21:33');
INSERT INTO `incidencia` VALUES ('2', '1', '2020-07-31', '2', 'Pelea en el Comedor', '2', 'Suspendido durante 3 dias', null, '1', '1', '2020-07-30 23:53:54', '2020-07-30 23:53:54');
INSERT INTO `incidencia` VALUES ('3', '24', '2020-08-18', '2', 'Peleo en el patio de recreo', '2', '1 dia de suspension', null, '1', '1', '2020-08-18 22:17:17', '2020-08-18 22:17:17');
INSERT INTO `incidencia` VALUES ('4', '103', '2020-09-02', '2', 'rgeger', '4', 'gerge', 'gege', '1', '1', '2020-09-04 12:36:11', '2020-09-04 12:36:11');
INSERT INTO `incidencia` VALUES ('5', '103', '2020-11-26', '1', 'fdsfsfsf', '1', 'fdsfsd', null, '1', '1', '2020-11-27 01:19:10', '2020-11-27 01:19:10');
INSERT INTO `incidencia` VALUES ('8', '1', '2020-11-27', '1', 'pelea', '1', '1er llamado de atencion', null, '1', '1', '2020-11-27 14:51:13', '2020-11-27 14:51:13');

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
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of libro
-- ----------------------------
INSERT INTO `libro` VALUES ('1', 'Ciencias Sociales', '19', '4', 'Libro de Primer Grado de Ciencias Sociales', '', '', '1', '1', '2020-10-05 18:57:33', '2020-10-05 23:11:47');
INSERT INTO `libro` VALUES ('2', 'Matematica', '14', '4', 'Libro matematica', '', '', '1', '1', '2020-10-07 23:04:51', '2020-10-07 23:04:51');
INSERT INTO `libro` VALUES ('3', 'Lengua Castellana', '15', '4', 'LIbro Lengua Castellana', '', '', '1', '1', '2020-10-07 23:05:16', '2020-10-07 23:23:22');
INSERT INTO `libro` VALUES ('4', 'Ciencias Naturales', '7', '4', 'Libro Ciencias Naturales', '', '', '1', '1', '2020-10-07 23:05:16', '2020-10-07 23:23:22');
INSERT INTO `libro` VALUES ('5', 'Ciencias Sociales', '19', '5', 'Libro de Primer Grado de Ciencias Sociales', '', '', '1', '1', '2020-10-05 18:57:33', '2020-10-05 23:11:47');
INSERT INTO `libro` VALUES ('6', 'Matematica', '14', '5', 'Libro matematica', '', '', '1', '1', '2020-10-07 23:04:51', '2020-10-07 23:04:51');
INSERT INTO `libro` VALUES ('7', 'Lengua Castellana', '15', '5', 'LIbro Lengua Castellana', '', '', '1', '1', '2020-10-07 23:05:16', '2020-10-07 23:23:22');
INSERT INTO `libro` VALUES ('8', 'Ciencias Naturales', '7', '5', 'Libro Ciencias Naturales', '', '', '1', '1', '2020-10-07 23:05:16', '2020-10-07 23:23:22');
INSERT INTO `libro` VALUES ('9', 'Ciencias Sociales', '19', '6', 'Libro de Primer Grado de Ciencias Sociales', '', '', '1', '1', '2020-10-05 18:57:33', '2020-10-05 23:11:47');
INSERT INTO `libro` VALUES ('10', 'Matematica', '14', '6', 'Libro matematica', '', '', '1', '1', '2020-10-07 23:04:51', '2020-10-07 23:04:51');
INSERT INTO `libro` VALUES ('11', 'Lengua Castellana', '15', '6', 'LIbro Lengua Castellana', '', '', '1', '1', '2020-10-07 23:05:16', '2020-10-07 23:23:22');
INSERT INTO `libro` VALUES ('12', 'Ciencias Naturales', '7', '6', 'Libro Ciencias Naturales', '', '', '1', '1', '2020-10-07 23:05:16', '2020-10-07 23:23:22');
INSERT INTO `libro` VALUES ('13', 'Ciencias Sociales', '19', '7', 'Libro de Primer Grado de Ciencias Sociales', '', '', '1', '1', '2020-10-05 18:57:33', '2020-10-05 23:11:47');
INSERT INTO `libro` VALUES ('14', 'Matematica', '14', '7', 'Libro matematica', '', '', '1', '1', '2020-10-07 23:04:51', '2020-10-07 23:04:51');
INSERT INTO `libro` VALUES ('15', 'Lengua Castellana', '15', '7', 'LIbro Lengua Castellana', '', '', '1', '1', '2020-10-07 23:05:16', '2020-10-07 23:23:22');
INSERT INTO `libro` VALUES ('16', 'Ciencias Naturales', '7', '7', 'Libro Ciencias Naturales', '', '', '1', '1', '2020-10-07 23:05:16', '2020-10-07 23:23:22');
INSERT INTO `libro` VALUES ('17', 'Ciencias Sociales', '19', '8', 'Libro de Primer Grado de Ciencias Sociales', '', '', '1', '1', '2020-10-05 18:57:33', '2020-10-05 23:11:47');
INSERT INTO `libro` VALUES ('18', 'Matematica', '14', '8', 'Libro matematica', '', '', '1', '1', '2020-10-07 23:04:51', '2020-10-07 23:04:51');
INSERT INTO `libro` VALUES ('19', 'Lengua Castellana', '15', '8', 'LIbro Lengua Castellana', '', '', '1', '1', '2020-10-07 23:05:16', '2020-10-07 23:23:22');
INSERT INTO `libro` VALUES ('20', 'Ciencias Naturales', '7', '8', 'Libro Ciencias Naturales', '', '', '1', '1', '2020-10-07 23:05:16', '2020-10-07 23:23:22');
INSERT INTO `libro` VALUES ('21', 'Ciencias Sociales', '19', '9', 'Libro de Primer Grado de Ciencias Sociales', '', '', '1', '1', '2020-10-05 18:57:33', '2020-10-05 23:11:47');
INSERT INTO `libro` VALUES ('22', 'Matematica', '14', '9', 'Libro matematica', '', '', '1', '1', '2020-10-07 23:04:51', '2020-10-07 23:04:51');
INSERT INTO `libro` VALUES ('23', 'Lengua Castellana', '15', '9', 'LIbro Lengua Castellana', '', '', '1', '1', '2020-10-07 23:05:16', '2020-10-07 23:23:22');
INSERT INTO `libro` VALUES ('24', 'Ciencias Naturales', '7', '9', 'Libro Ciencias Naturales', '', '', '1', '1', '2020-10-07 23:05:16', '2020-10-07 23:23:22');
INSERT INTO `libro` VALUES ('25', 'Ciencias Sociales', '19', '10', 'Libro de Primer Grado de Ciencias Sociales', '', '', '1', '1', '2020-10-05 18:57:33', '2020-10-05 23:11:47');
INSERT INTO `libro` VALUES ('26', 'Matematica', '14', '10', 'Libro matematica', '', '', '1', '1', '2020-10-07 23:04:51', '2020-10-07 23:04:51');
INSERT INTO `libro` VALUES ('27', 'Lengua Castellana', '15', '10', 'LIbro Lengua Castellana', '', '', '1', '1', '2020-10-07 23:05:16', '2020-10-07 23:23:22');
INSERT INTO `libro` VALUES ('28', 'Ciencias Naturales', '7', '10', 'Libro Ciencias Naturales', '', '', '1', '1', '2020-10-07 23:05:16', '2020-10-07 23:23:22');
INSERT INTO `libro` VALUES ('29', 'Ciencias Sociales', '19', '11', 'Libro de Primer Grado de Ciencias Sociales', '', '', '1', '1', '2020-10-05 18:57:33', '2020-10-05 23:11:47');
INSERT INTO `libro` VALUES ('30', 'Matematica', '14', '11', 'Libro matematica', '', '', '1', '1', '2020-10-07 23:04:51', '2020-10-07 23:04:51');
INSERT INTO `libro` VALUES ('31', 'Lengua Castellana', '15', '11', 'LIbro Lengua Castellana', '', '', '1', '1', '2020-10-07 23:05:16', '2020-10-07 23:23:22');
INSERT INTO `libro` VALUES ('32', 'Ciencias Naturales', '7', '11', 'Libro Ciencias Naturales', '', '', '1', '1', '2020-10-07 23:05:16', '2020-10-07 23:23:22');
INSERT INTO `libro` VALUES ('33', 'Ciencias Sociales', '19', '12', 'Libro de Primer Grado de Ciencias Sociales', '', '', '1', '1', '2020-10-05 18:57:33', '2020-10-05 23:11:47');
INSERT INTO `libro` VALUES ('34', 'Matematica', '14', '12', 'Libro matematica', '', '', '1', '1', '2020-10-07 23:04:51', '2020-10-07 23:04:51');
INSERT INTO `libro` VALUES ('35', 'Lengua Castellana', '15', '12', 'LIbro Lengua Castellana', '', '', '1', '1', '2020-10-07 23:05:16', '2020-10-07 23:23:22');
INSERT INTO `libro` VALUES ('36', 'Ciencias Naturales', '7', '12', 'Libro Ciencias Naturales', '', '', '1', '1', '2020-10-07 23:05:16', '2020-10-07 23:23:22');
INSERT INTO `libro` VALUES ('37', '', '0', '0', '', '', '', '0', '0', null, null);
INSERT INTO `libro` VALUES ('38', '', '0', '0', '', '', '', '0', '0', null, null);
INSERT INTO `libro` VALUES ('39', '', '0', '0', '', '', '', '0', '0', null, null);
INSERT INTO `libro` VALUES ('40', '', '0', '0', '', '', '', '0', '0', null, null);

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
INSERT INTO `materia` VALUES ('6', 'Historia Universal', 'HISUNI', '1', null, null, '1', '1', '2020-05-16 07:35:16', '2020-05-16 07:35:16');
INSERT INTO `materia` VALUES ('7', 'Ciencias Naturales', 'CIENAT', '2', null, 'CN', '1', '1', '2020-05-16 07:38:22', '2020-05-16 07:38:22');
INSERT INTO `materia` VALUES ('8', 'Biología', 'BIO001', '2', null, null, '1', '1', '2020-05-16 07:39:36', '2020-05-16 07:44:03');
INSERT INTO `materia` VALUES ('9', 'Física', 'FIS001', '2', null, null, '1', '1', '2020-05-16 07:39:56', '2020-05-16 07:44:15');
INSERT INTO `materia` VALUES ('10', 'Química', 'QUIM01', '2', null, null, '1', '1', '2020-05-16 07:40:12', '2020-05-16 07:44:35');
INSERT INTO `materia` VALUES ('11', 'Álgebra', 'ALG001', '5', null, null, '1', '1', '2020-05-16 07:40:51', '2020-05-16 07:43:37');
INSERT INTO `materia` VALUES ('12', 'Trigonometría', 'TRIG01', '5', null, null, '1', '1', '2020-05-16 07:41:09', '2020-05-16 07:43:47');
INSERT INTO `materia` VALUES ('13', 'Cálculo básico', 'CALBAS', '5', null, null, '1', '1', '2020-05-16 07:41:28', '2020-05-16 07:41:28');
INSERT INTO `materia` VALUES ('14', 'Matemática', 'MAT001', '5', null, 'MT', '1', '1', '2020-05-16 07:41:54', '2020-05-16 07:43:55');
INSERT INTO `materia` VALUES ('15', 'Lengua Castellana', 'LENCAS', '6', null, 'LG', '1', '1', '2020-05-16 15:51:48', '2020-05-16 17:15:24');
INSERT INTO `materia` VALUES ('16', 'Ingles', 'ING001', '6', null, null, '1', '1', '2020-05-16 15:52:21', '2020-05-16 15:52:21');
INSERT INTO `materia` VALUES ('17', 'Educacion Fisica', 'EDUFIS', '8', null, null, '1', '1', '2020-05-16 18:08:10', '2020-05-16 18:08:10');
INSERT INTO `materia` VALUES ('18', 'Educacion Artistica', 'ART001', '9', null, null, '1', '1', '2020-05-16 18:09:19', '2020-05-16 18:26:20');
INSERT INTO `materia` VALUES ('19', 'Ciencias Sociales', 'CIESOC', '1', null, 'CS', '1', '1', '2020-05-16 18:30:50', '2020-05-16 18:30:50');

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
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
INSERT INTO `matricula` VALUES ('36', '2', '103', '8', '14', '2020-11-08', '1', null, null, '1', '1', '2020-11-09 01:21:16', '2020-11-09 01:21:16');
INSERT INTO `matricula` VALUES ('37', '2', '107', '9', '19', '2020-11-10', '1', null, null, '1', '1', '2020-11-10 16:08:40', '2020-11-10 16:08:40');
INSERT INTO `matricula` VALUES ('38', '2', '87', '10', '21', '2020-11-10', '1', null, null, '1', '1', '2020-11-10 16:09:40', '2020-11-10 16:09:40');
INSERT INTO `matricula` VALUES ('39', '2', '105', '11', '23', '2020-11-10', '1', null, null, '1', '1', '2020-11-10 16:10:03', '2020-11-10 16:10:03');
INSERT INTO `matricula` VALUES ('40', '2', '45', '12', '25', '2020-11-10', '1', null, null, '1', '1', '2020-11-10 16:10:27', '2020-11-10 16:11:02');

-- ----------------------------
-- Table structure for mensaje
-- ----------------------------
DROP TABLE IF EXISTS `mensaje`;
CREATE TABLE `mensaje` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `co_mensaje` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_tipo_destinatario` int(11) NOT NULL,
  `id_destinatario` int(11) NOT NULL,
  `tx_asunto` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tx_mensaje` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tx_lugar` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_tipo_mensaje` int(11) NOT NULL,
  `id_tipo_prioridad` int(11) unsigned NOT NULL,
  `fe_mensaje` date NOT NULL,
  `hh_inicio` time DEFAULT NULL,
  `hh_fin` time DEFAULT NULL,
  `id_origen` int(11) DEFAULT NULL,
  `fe_lectura` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of mensaje
-- ----------------------------
INSERT INTO `mensaje` VALUES ('1', 'WAC-TQC-03R-MTV', '3', '2', 'tertet', 'etete', 'tete', '1', '1', '2020-09-02', null, null, null, '2020-09-29 19:21:36', null, '1', '1', '2020-09-28 13:46:01', '2020-09-29 19:21:36');
INSERT INTO `mensaje` VALUES ('2', 'ECD-MF1-R6V-JEU', '1', '1', 'RP: tertet', 'dfgd', null, '1', '1', '2020-09-02', '00:05:00', '00:03:00', null, '2020-10-27 21:03:27', null, '1', '2', '2020-09-29 19:24:07', '2020-10-27 21:03:27');

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
INSERT INTO `menu` VALUES ('24', 'Niveles', '3', 'nivel', 'admin/nivel', 'mdi-stairs-up', 'cyan', 'Nivel', '1', '24', null, '1', '1', null, '2020-09-01 14:48:29');
INSERT INTO `menu` VALUES ('25', 'Grados', '3', 'grado', 'admin/grado', 'mdi-numeric', 'cyan', 'Grado', '1', '25', null, '1', '1', null, '2020-09-01 14:48:39');
INSERT INTO `menu` VALUES ('26', 'Grupos', '3', 'grupo', 'admin/grupo', 'mdi-alphabetical-variant', 'cyan', 'Grupo', '1', '26', null, '1', '1', null, '2020-09-01 14:48:49');
INSERT INTO `menu` VALUES ('27', 'Areas de Estudio', '3', 'area-estudio', 'admin/area-estudio', 'mdi-file-cad', 'cyan', 'AreaEstudio', '1', '27', null, '1', '1', null, '2020-09-01 14:47:42');
INSERT INTO `menu` VALUES ('28', 'Materias', '3', 'materia', 'admin/materia', 'mdi-bookshelf', 'cyan', 'Materia', '1', '28', null, '1', '1', null, '2020-09-01 14:47:51');
INSERT INTO `menu` VALUES ('29', 'Grado Materias', '3', 'grado-materia', 'admin/grado-materia', 'mdi-square-root', 'cyan', 'GradoMateria', '1', '29', null, '2', '1', null, '2020-09-01 15:10:29');
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
) ENGINE=InnoDB AUTO_INCREMENT=182 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for multimedia
-- ----------------------------
DROP TABLE IF EXISTS `multimedia`;
CREATE TABLE `multimedia` (
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `id_tipo_destinatario` int(11) NOT NULL,
  `id_destinatario` int(11) NOT NULL,
  `tx_mensaje` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_tipo_notificacion` int(11) NOT NULL,
  `fe_notificacion` date NOT NULL,
  `fe_lectura` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of notificacion
-- ----------------------------
INSERT INTO `notificacion` VALUES ('1', '3', '1', 'fjfg', '1', '2020-07-15', null, '1', '1', '2020-07-24 16:21:03', '2020-07-24 16:21:03');
INSERT INTO `notificacion` VALUES ('2', '3', '1', 'Inicio del año escolar', '2', '2020-07-01', '2020-11-28 00:03:49', '1', '1', '2020-07-24 17:58:59', '2020-11-28 00:03:49');
INSERT INTO `notificacion` VALUES ('3', '4', '1', 'hfghfhfhfhfg', '2', '2020-07-05', '2020-11-27 14:25:51', '1', '1', '2020-07-31 22:22:23', '2020-11-27 14:25:51');
INSERT INTO `notificacion` VALUES ('4', '2', '1', 'gsdgsgsgs', '1', '2020-08-12', '2020-11-28 00:51:19', '1', '1', '2020-08-12 14:18:52', '2020-11-28 00:51:19');
INSERT INTO `notificacion` VALUES ('5', '3', '1', 'Inicio del año escolar', '2', '2020-07-01', null, '1', '1', '2020-08-18 02:37:24', '2020-08-18 02:37:24');
INSERT INTO `notificacion` VALUES ('6', '4', '1', 'hdffhdf', '2', '2020-08-04', '2020-11-27 14:25:47', '1', '1', '2020-08-18 21:45:06', '2020-11-27 14:25:47');
INSERT INTO `notificacion` VALUES ('7', '3', '1', 'Actividad Prueba', '2', '2020-07-15', '2020-11-28 00:03:46', '1', '1', '2020-08-18 21:50:45', '2020-11-28 00:03:46');
INSERT INTO `notificacion` VALUES ('8', '2', '12', 'tdgs', '1', '2020-08-19', null, '1', '1', '2020-08-19 19:11:27', '2020-08-19 19:11:27');
INSERT INTO `notificacion` VALUES ('9', '4', '1', 'Inicio del año escolar', '2', '2020-07-01', '2020-11-27 14:25:33', '1', '1', '2020-08-19 19:14:51', '2020-11-27 14:25:33');
INSERT INTO `notificacion` VALUES ('10', '3', '1', 'eeq', '2', '2020-09-09', '2020-11-27 22:24:31', '1', '1', '2020-09-05 02:00:12', '2020-11-27 22:24:31');
INSERT INTO `notificacion` VALUES ('11', '3', '1', 'eeq', '2', '2020-09-09', '2020-11-27 18:32:02', '1', '2', '2020-09-05 02:06:17', '2020-11-27 18:32:02');
INSERT INTO `notificacion` VALUES ('14', '3', '2', 'eeq', '2', '2020-09-09', '2020-09-05 18:12:32', '1', '2', '2020-09-05 14:12:08', '2020-09-05 18:12:32');
INSERT INTO `notificacion` VALUES ('16', '3', '2', 'fdfsf', '2', '2020-09-10', '2020-09-05 18:06:00', '1', '2', '2020-09-05 14:14:19', '2020-09-05 18:06:00');
INSERT INTO `notificacion` VALUES ('17', '3', '2', 'fdfsf', '2', '2020-09-10', '2020-09-05 18:07:27', '1', '2', '2020-09-05 14:14:25', '2020-09-05 18:07:27');
INSERT INTO `notificacion` VALUES ('18', '3', '2', 'fdfsf', '2', '2020-09-10', '2020-09-05 18:13:12', '1', '2', '2020-09-05 18:12:57', '2020-09-05 18:13:12');
INSERT INTO `notificacion` VALUES ('20', '3', '2', 'fdfsf', '2', '2020-09-10', '2020-09-05 18:27:52', '1', '2', '2020-09-05 18:27:35', '2020-09-05 18:27:52');
INSERT INTO `notificacion` VALUES ('21', '3', '1', 'faltas actividades', '1', '2020-09-05', '2020-11-27 18:31:56', '1', '1', '2020-09-05 18:31:10', '2020-11-27 18:31:56');
INSERT INTO `notificacion` VALUES ('22', '4', '1', 'eeq', '2', '2020-09-09', '2020-11-27 14:23:59', '1', '1', '2020-09-12 17:26:31', '2020-11-27 14:23:59');
INSERT INTO `notificacion` VALUES ('23', '4', '2', 'Se ha levantado una sancional al alumno Yustiz T. Jean P.', '4', '2020-11-27', null, '1', '1', '2020-11-27 02:31:25', '2020-11-27 02:31:25');
INSERT INTO `notificacion` VALUES ('24', '4', '2', 'Se ha levantado una sancional al alumno Yustiz T. Jean P.', '4', '2020-11-27', null, '1', '1', '2020-11-27 02:32:19', '2020-11-27 02:32:19');
INSERT INTO `notificacion` VALUES ('25', '4', '2', 'Se ha levantado una sancional al alumno Yustiz T. Jean P.', '4', '2020-11-27', null, '1', '1', '2020-11-27 02:36:08', '2020-11-27 02:36:08');
INSERT INTO `notificacion` VALUES ('26', '4', '2', 'Se ha levantado una sancional al alumno Yustiz T. Jean P.', '4', '2020-11-27', null, '1', '1', '2020-11-27 13:10:53', '2020-11-27 13:10:53');
INSERT INTO `notificacion` VALUES ('27', '4', '1', 'Se ha levantado una sancional al alumno Yustiz T. Jean P.', '4', '2020-11-27', '2020-11-27 14:22:29', '1', '1', '2020-11-27 13:10:53', '2020-11-27 14:22:29');
INSERT INTO `notificacion` VALUES ('28', '4', '2', 'Se ha levantado una sancional al alumno Yustiz T. Jean P.', '4', '2020-11-27', null, '1', '1', '2020-11-27 14:51:13', '2020-11-27 14:51:13');
INSERT INTO `notificacion` VALUES ('29', '4', '1', 'Se ha levantado una sancional al alumno Yustiz T. Jean P.', '4', '2020-11-27', '2020-11-27 15:21:14', '1', '1', '2020-11-27 14:51:14', '2020-11-27 15:21:14');
INSERT INTO `notificacion` VALUES ('30', '3', '1', 'Nuevo Cuestionario  Materia: Ciencias Naturales ', '7', '2020-11-27', null, '1', '1', '2020-11-27 18:28:27', '2020-11-27 18:28:27');
INSERT INTO `notificacion` VALUES ('31', '3', '2', 'Nuevo Cuestionario  Materia: Ciencias Naturales ', '7', '2020-11-27', null, '1', '1', '2020-11-27 18:28:28', '2020-11-27 18:28:28');
INSERT INTO `notificacion` VALUES ('32', '3', '15', 'Nuevo Cuestionario  Materia: Ciencias Naturales ', '7', '2020-11-27', null, '1', '1', '2020-11-27 18:28:28', '2020-11-27 18:28:28');
INSERT INTO `notificacion` VALUES ('33', '3', '16', 'Nuevo Cuestionario  Materia: Ciencias Naturales ', '7', '2020-11-27', null, '1', '1', '2020-11-27 18:28:28', '2020-11-27 18:28:28');
INSERT INTO `notificacion` VALUES ('34', '3', '17', 'Nuevo Cuestionario  Materia: Ciencias Naturales ', '7', '2020-11-27', null, '1', '1', '2020-11-27 18:28:28', '2020-11-27 18:28:28');
INSERT INTO `notificacion` VALUES ('35', '3', '23', 'Nuevo Cuestionario  Materia: Ciencias Naturales ', '7', '2020-11-27', null, '1', '1', '2020-11-27 18:28:28', '2020-11-27 18:28:28');
INSERT INTO `notificacion` VALUES ('36', '3', '1', 'Nuevo Cuestionario  Materia: Ciencias Naturales ', '7', '2020-11-27', null, '1', '1', '2020-11-27 18:28:59', '2020-11-27 18:28:59');
INSERT INTO `notificacion` VALUES ('37', '3', '2', 'Nuevo Cuestionario  Materia: Ciencias Naturales ', '7', '2020-11-27', null, '1', '1', '2020-11-27 18:28:59', '2020-11-27 18:28:59');
INSERT INTO `notificacion` VALUES ('38', '3', '15', 'Nuevo Cuestionario  Materia: Ciencias Naturales ', '7', '2020-11-27', null, '1', '1', '2020-11-27 18:28:59', '2020-11-27 18:28:59');
INSERT INTO `notificacion` VALUES ('39', '3', '16', 'Nuevo Cuestionario  Materia: Ciencias Naturales ', '7', '2020-11-27', null, '1', '1', '2020-11-27 18:29:00', '2020-11-27 18:29:00');
INSERT INTO `notificacion` VALUES ('40', '3', '17', 'Nuevo Cuestionario  Materia: Ciencias Naturales ', '7', '2020-11-27', null, '1', '1', '2020-11-27 18:29:00', '2020-11-27 18:29:00');
INSERT INTO `notificacion` VALUES ('41', '3', '23', 'Nuevo Cuestionario  Materia: Ciencias Naturales ', '7', '2020-11-27', null, '1', '1', '2020-11-27 18:29:00', '2020-11-27 18:29:00');
INSERT INTO `notificacion` VALUES ('42', '3', '1', 'Se ha Cargado un nueva Tarea', '8', '2020-11-27', '2020-11-28 00:03:37', '1', '1', '2020-11-27 18:33:10', '2020-11-28 00:03:37');
INSERT INTO `notificacion` VALUES ('43', '3', '2', 'Se ha Cargado un nueva Tarea', '8', '2020-11-27', null, '1', '1', '2020-11-27 18:33:11', '2020-11-27 18:33:11');
INSERT INTO `notificacion` VALUES ('44', '3', '15', 'Se ha Cargado un nueva Tarea', '8', '2020-11-27', null, '1', '1', '2020-11-27 18:33:11', '2020-11-27 18:33:11');
INSERT INTO `notificacion` VALUES ('45', '3', '16', 'Se ha Cargado un nueva Tarea', '8', '2020-11-27', null, '1', '1', '2020-11-27 18:33:11', '2020-11-27 18:33:11');
INSERT INTO `notificacion` VALUES ('46', '3', '17', 'Se ha Cargado un nueva Tarea', '8', '2020-11-27', null, '1', '1', '2020-11-27 18:33:11', '2020-11-27 18:33:11');
INSERT INTO `notificacion` VALUES ('47', '3', '23', 'Se ha Cargado un nueva Tarea', '8', '2020-11-27', null, '1', '1', '2020-11-27 18:33:11', '2020-11-27 18:33:11');
INSERT INTO `notificacion` VALUES ('48', '3', '15', 'Se ha Cargado un nueva Tarea', '8', '2020-11-27', null, '1', '1', '2020-11-27 18:37:10', '2020-11-27 18:37:10');
INSERT INTO `notificacion` VALUES ('49', '3', '16', 'Se ha Cargado un nueva Tarea', '8', '2020-11-27', null, '1', '1', '2020-11-27 18:37:11', '2020-11-27 18:37:11');
INSERT INTO `notificacion` VALUES ('50', '3', '23', 'Se ha Cargado un nueva Tarea', '8', '2020-11-27', null, '1', '1', '2020-11-27 18:37:11', '2020-11-27 18:37:11');
INSERT INTO `notificacion` VALUES ('51', '3', '2', 'Se ha Cargado un nueva Tarea', '8', '2020-11-27', null, '1', '1', '2020-11-27 18:37:11', '2020-11-27 18:37:11');
INSERT INTO `notificacion` VALUES ('52', '3', '17', 'Se ha Cargado un nueva Tarea', '8', '2020-11-27', null, '1', '1', '2020-11-27 18:37:11', '2020-11-27 18:37:11');
INSERT INTO `notificacion` VALUES ('53', '3', '1', 'Se ha Cargado un nueva Tarea', '8', '2020-11-27', null, '1', '1', '2020-11-27 18:37:11', '2020-11-27 18:37:11');
INSERT INTO `notificacion` VALUES ('54', '3', '15', 'Nuevo Tarea Materia: Ciencias Naturales ', '8', '2020-11-27', null, '1', '1', '2020-11-27 22:07:14', '2020-11-27 22:07:14');
INSERT INTO `notificacion` VALUES ('55', '3', '16', 'Nuevo Tarea Materia: Ciencias Naturales ', '8', '2020-11-27', null, '1', '1', '2020-11-27 22:07:14', '2020-11-27 22:07:14');
INSERT INTO `notificacion` VALUES ('56', '3', '23', 'Nuevo Tarea Materia: Ciencias Naturales ', '8', '2020-11-27', null, '1', '1', '2020-11-27 22:07:14', '2020-11-27 22:07:14');
INSERT INTO `notificacion` VALUES ('57', '3', '2', 'Nuevo Tarea Materia: Ciencias Naturales ', '8', '2020-11-27', null, '1', '1', '2020-11-27 22:07:14', '2020-11-27 22:07:14');
INSERT INTO `notificacion` VALUES ('58', '3', '17', 'Nuevo Tarea Materia: Ciencias Naturales ', '8', '2020-11-27', null, '1', '1', '2020-11-27 22:07:14', '2020-11-27 22:07:14');
INSERT INTO `notificacion` VALUES ('59', '3', '1', 'Nuevo Tarea Materia: Ciencias Naturales ', '8', '2020-11-27', '2020-11-28 00:07:56', '1', '1', '2020-11-27 22:07:14', '2020-11-28 00:07:56');
INSERT INTO `notificacion` VALUES ('60', '3', '1', 'Nueva Asignacion enlace  Materia: Ciencias Sociales ', '6', '2020-11-27', '2020-11-28 00:07:40', '1', '1', '2020-11-27 23:55:03', '2020-11-28 00:07:40');
INSERT INTO `notificacion` VALUES ('61', '3', '2', 'Nueva Asignacion enlace  Materia: Ciencias Sociales ', '6', '2020-11-27', null, '1', '1', '2020-11-27 23:55:03', '2020-11-27 23:55:03');
INSERT INTO `notificacion` VALUES ('62', '3', '15', 'Nueva Asignacion enlace  Materia: Ciencias Sociales ', '6', '2020-11-27', null, '1', '1', '2020-11-27 23:55:03', '2020-11-27 23:55:03');
INSERT INTO `notificacion` VALUES ('63', '3', '16', 'Nueva Asignacion enlace  Materia: Ciencias Sociales ', '6', '2020-11-27', null, '1', '1', '2020-11-27 23:55:03', '2020-11-27 23:55:03');
INSERT INTO `notificacion` VALUES ('64', '3', '17', 'Nueva Asignacion enlace  Materia: Ciencias Sociales ', '6', '2020-11-27', null, '1', '1', '2020-11-27 23:55:03', '2020-11-27 23:55:03');
INSERT INTO `notificacion` VALUES ('65', '3', '23', 'Nueva Asignacion enlace  Materia: Ciencias Sociales ', '6', '2020-11-27', null, '1', '1', '2020-11-27 23:55:03', '2020-11-27 23:55:03');
INSERT INTO `notificacion` VALUES ('66', '3', '1', 'Nueva Asignacion - Tipo: recurso,  Materia: Ciencias Sociales ', '6', '2020-11-27', '2020-11-28 00:03:09', '1', '1', '2020-11-27 23:56:42', '2020-11-28 00:03:09');
INSERT INTO `notificacion` VALUES ('67', '3', '2', 'Nueva Asignacion - Tipo: recurso,  Materia: Ciencias Sociales ', '6', '2020-11-27', null, '1', '1', '2020-11-27 23:56:42', '2020-11-27 23:56:42');
INSERT INTO `notificacion` VALUES ('68', '3', '15', 'Nueva Asignacion - Tipo: recurso,  Materia: Ciencias Sociales ', '6', '2020-11-27', null, '1', '1', '2020-11-27 23:56:42', '2020-11-27 23:56:42');
INSERT INTO `notificacion` VALUES ('69', '3', '16', 'Nueva Asignacion - Tipo: recurso,  Materia: Ciencias Sociales ', '6', '2020-11-27', null, '1', '1', '2020-11-27 23:56:42', '2020-11-27 23:56:42');
INSERT INTO `notificacion` VALUES ('70', '3', '17', 'Nueva Asignacion - Tipo: recurso,  Materia: Ciencias Sociales ', '6', '2020-11-27', null, '1', '1', '2020-11-27 23:56:42', '2020-11-27 23:56:42');
INSERT INTO `notificacion` VALUES ('71', '3', '23', 'Nueva Asignacion - Tipo: recurso,  Materia: Ciencias Sociales ', '6', '2020-11-27', null, '1', '1', '2020-11-27 23:56:42', '2020-11-27 23:56:42');
INSERT INTO `notificacion` VALUES ('72', '3', '1', 'Nueva Asignacion - Tipo: audio,  Materia: Ciencias Sociales ', '6', '2020-11-27', '2020-11-28 00:02:46', '1', '1', '2020-11-27 23:59:45', '2020-11-28 00:02:46');
INSERT INTO `notificacion` VALUES ('73', '3', '2', 'Nueva Asignacion - Tipo: audio,  Materia: Ciencias Sociales ', '6', '2020-11-27', null, '1', '1', '2020-11-27 23:59:45', '2020-11-27 23:59:45');
INSERT INTO `notificacion` VALUES ('74', '3', '15', 'Nueva Asignacion - Tipo: audio,  Materia: Ciencias Sociales ', '6', '2020-11-27', null, '1', '1', '2020-11-27 23:59:45', '2020-11-27 23:59:45');
INSERT INTO `notificacion` VALUES ('75', '3', '16', 'Nueva Asignacion - Tipo: audio,  Materia: Ciencias Sociales ', '6', '2020-11-27', null, '1', '1', '2020-11-27 23:59:45', '2020-11-27 23:59:45');
INSERT INTO `notificacion` VALUES ('76', '3', '17', 'Nueva Asignacion - Tipo: audio,  Materia: Ciencias Sociales ', '6', '2020-11-27', null, '1', '1', '2020-11-27 23:59:45', '2020-11-27 23:59:45');
INSERT INTO `notificacion` VALUES ('77', '3', '23', 'Nueva Asignacion - Tipo: audio,  Materia: Ciencias Sociales ', '6', '2020-11-27', null, '1', '1', '2020-11-27 23:59:45', '2020-11-27 23:59:45');
INSERT INTO `notificacion` VALUES ('78', '3', '1', 'Inicio de Clase Materia: Ciencias Naturales', '5', '2020-11-28', null, '1', '1', '2020-11-28 00:40:31', '2020-11-28 00:40:31');
INSERT INTO `notificacion` VALUES ('79', '3', '2', 'Inicio de Clase Materia: Ciencias Naturales', '5', '2020-11-28', null, '1', '1', '2020-11-28 00:40:31', '2020-11-28 00:40:31');
INSERT INTO `notificacion` VALUES ('80', '3', '15', 'Inicio de Clase Materia: Ciencias Naturales', '5', '2020-11-28', null, '1', '1', '2020-11-28 00:40:31', '2020-11-28 00:40:31');
INSERT INTO `notificacion` VALUES ('81', '3', '16', 'Inicio de Clase Materia: Ciencias Naturales', '5', '2020-11-28', null, '1', '1', '2020-11-28 00:40:31', '2020-11-28 00:40:31');
INSERT INTO `notificacion` VALUES ('82', '3', '17', 'Inicio de Clase Materia: Ciencias Naturales', '5', '2020-11-28', null, '1', '1', '2020-11-28 00:40:31', '2020-11-28 00:40:31');
INSERT INTO `notificacion` VALUES ('83', '3', '23', 'Inicio de Clase Materia: Ciencias Naturales', '5', '2020-11-28', null, '1', '1', '2020-11-28 00:40:31', '2020-11-28 00:40:31');
INSERT INTO `notificacion` VALUES ('84', '3', '1', 'codigo  Meet 123456', '9', '2020-11-28', null, '1', '1', '2020-11-28 00:00:00', null);
INSERT INTO `notificacion` VALUES ('85', '3', '2', 'codigo  Meet 123456', '9', '2020-11-28', null, '1', '1', '2020-11-28 00:00:00', null);
INSERT INTO `notificacion` VALUES ('86', '3', '15', 'codigo  Meet 123456', '9', '2020-11-28', null, '1', '1', '2020-11-28 00:00:00', null);
INSERT INTO `notificacion` VALUES ('87', '3', '16', 'codigo  Meet 123456', '9', '2020-11-28', null, '1', '1', '2020-11-28 00:00:00', null);
INSERT INTO `notificacion` VALUES ('88', '3', '17', 'codigo  Meet 123456', '9', '2020-11-28', null, '1', '1', '2020-11-28 00:00:00', null);
INSERT INTO `notificacion` VALUES ('89', '3', '23', 'codigo  Meet 123456', '9', '2020-11-28', null, '1', '1', '2020-11-28 00:00:00', null);
INSERT INTO `notificacion` VALUES ('90', '1', '1', 'Fin primer periodo', '2', '2020-11-28', '2020-11-28 03:10:10', '1', '1', '2020-11-28 03:09:51', '2020-11-28 03:10:10');
INSERT INTO `notificacion` VALUES ('91', '1', '1', 'fdfsf', '2', '2020-11-28', '2020-11-28 03:11:19', '1', '1', '2020-11-28 03:11:05', '2020-11-28 03:11:19');
INSERT INTO `notificacion` VALUES ('92', '1', '1', 'Desarrollo de Planes de Evaluacion en Linea y Generacion de Tareas', '2', '2020-11-28', '2020-11-28 03:13:30', '1', '1', '2020-11-28 03:13:21', '2020-11-28 03:13:30');

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
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of pagina
-- ----------------------------
INSERT INTO `pagina` VALUES ('1', 'pagina1', '1', '40', '1', 'CS_G1_001.jpg', '', '1', '1', '2020-10-06 14:33:01', '2020-10-06 14:33:01');
INSERT INTO `pagina` VALUES ('2', 'pagina2', '1', '40', '2', 'CS_G1_002.jpg', '', '1', '1', '2020-10-06 15:23:19', '2020-10-07 20:34:54');
INSERT INTO `pagina` VALUES ('3', 'pagina3', '1', '40', '3', 'CS_G1_003.jpg', '', '1', '1', '2020-10-07 20:34:41', '2020-10-07 20:37:12');
INSERT INTO `pagina` VALUES ('4', 'pagina4', '1', '40', '4', 'CS_G1_004.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('5', 'pagina5', '1', '40', '5', 'CS_G1_005.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('6', 'pagina6', '1', '40', '6', 'CS_G1_006.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('7', 'pagina7', '1', '40', '7', 'CS_G1_007.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('8', 'pagina8', '1', '40', '8', 'CS_G1_008.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('9', 'pagina9', '1', '40', '9', 'CS_G1_009.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('10', 'pagina10', '1', '40', '10', 'CS_G1_010.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('11', 'pagina1', '2', '4', '1', 'MT_G1_001.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('12', 'pagina2', '2', '4', '2', 'MT_G1_002.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('13', 'pagina3', '2', '4', '3', 'MT_G1_003.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('14', 'pagina4', '2', '4', '4', 'MT_G1_004.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('15', 'pagina1', '3', '22', '1', 'LG_G1_001.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('16', 'pagina2', '3', '22', '2', 'LG_G1_002.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('17', 'pagina3', '3', '22', '3', 'LG_G1_003.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('18', 'pagina4', '3', '22', '4', 'LG_G1_004.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('19', 'pagina1', '4', '57', '1', 'CN_G1_001.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('20', 'pagina2', '4', '57', '2', 'CN_G1_002.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('21', 'pagina3', '4', '57', '3', 'CN_G1_003.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('23', 'pagina1', '5', '41', '1', 'CS_G2_001.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('24', 'pagina2', '5', '41', '2', 'CS_G2_002.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('25', 'pagina3', '5', '41', '3', 'CS_G2_003.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('26', 'pagina4', '5', '41', '4', 'CS_G2_004.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('27', 'pagina1', '6', '6', '1', 'MT_G2_001.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('28', 'pagina2', '6', '6', '2', 'MT_G2_002.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('29', 'pagina3', '6', '6', '3', 'MT_G2_003.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('30', 'pagina4', '6', '6', '4', 'MT_G2_004.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('31', 'pagina1', '7', '24', '1', 'LG_G2_001.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('32', 'pagina2', '7', '24', '2', 'LG_G2_002.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('33', 'pagina3', '7', '24', '3', 'LG_G2_003.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('34', 'pagina4', '7', '24', '4', 'LG_G2_004.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('35', 'pagina1', '8', '58', '1', 'CN_G2_001.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('36', 'pagina2', '8', '58', '2', 'CN_G2_002.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('37', 'pagina3', '8', '58', '3', 'CN_G2_003.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('38', 'pagina4', '8', '58', '4', 'CN_G2_004.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('39', 'pagina1', '9', '43', '1', 'CS_G3_001.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('40', 'pagina2', '9', '43', '2', 'CS_G3_002.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('41', 'pagina3', '9', '43', '3', 'CS_G3_003.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('42', 'pagina4', '9', '43', '4', 'CS_G3_004.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('43', 'pagina1', '10', '8', '1', 'MT_G3_001.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('44', 'pagina2', '10', '8', '2', 'MT_G3_002.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('45', 'pagina3', '10', '8', '3', 'MT_G3_003.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('46', 'pagina4', '10', '8', '4', 'MT_G3_004.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('47', 'pagina1', '11', '26', '1', 'LG_G3_001.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('48', 'pagina2', '11', '26', '2', 'LG_G3_002.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('49', 'pagina3', '11', '26', '3', 'LG_G3_003.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('50', 'pagina4', '11', '26', '4', 'LG_G3_004.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('51', 'pagina1', '12', '60', '1', 'CN_G3_001.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('52', 'pagina2', '12', '60', '2', 'CN_G3_002.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('53', 'pagina3', '12', '60', '3', 'CN_G3_003.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('54', 'pagina4', '12', '60', '4', 'CN_G3_004.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('55', 'pagina1', '13', '45', '1', 'CS_G4_001.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('56', 'pagina2', '13', '45', '2', 'CS_G4_002.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('57', 'pagina3', '13', '45', '3', 'CS_G4_003.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('58', 'pagina4', '13', '45', '4', 'CS_G4_004.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('59', 'pagina1', '14', '10', '1', 'MT_G4_001.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('60', 'pagina2', '14', '10', '2', 'MT_G4_002.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('61', 'pagina3', '14', '10', '3', 'MT_G4_003.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('62', 'pagina4', '14', '10', '4', 'MT_G4_004.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('63', 'pagina1', '15', '28', '1', 'LG_G4_001.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('64', 'pagina2', '15', '28', '2', 'LG_G4_002.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('65', 'pagina3', '15', '28', '3', 'LG_G4_003.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('66', 'pagina4', '15', '28', '4', 'LG_G4_004.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('67', 'pagina1', '16', '62', '1', 'CN_G4_001.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('68', 'pagina2', '16', '62', '2', 'CN_G4_002.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('69', 'pagina3', '16', '62', '3', 'CN_G4_003.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('70', 'pagina4', '16', '62', '4', 'CN_G4_004.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('71', 'pagina1', '17', '47', '1', 'CS_G5_001.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('72', 'pagina2', '17', '47', '2', 'CS_G5_002.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('73', 'pagina3', '17', '47', '3', 'CS_G5_003.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('74', 'pagina4', '17', '47', '4', 'CS_G5_004.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('75', 'pagina1', '18', '12', '1', 'MT_G5_001.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('76', 'pagina2', '18', '12', '2', 'MT_G5_002.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('77', 'pagina3', '18', '12', '3', 'MT_G5_003.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('78', 'pagina4', '18', '12', '4', 'MT_G5_004.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('79', 'pagina1', '19', '30', '1', 'LG_G5_001.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('80', 'pagina2', '19', '30', '2', 'LG_G5_002.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('81', 'pagina3', '19', '30', '3', 'LG_G5_003.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('82', 'pagina4', '19', '30', '4', 'LG_G5_004.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('83', 'pagina1', '20', '64', '1', 'CN_G5_001.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('84', 'pagina2', '20', '64', '2', 'CN_G5_002.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('85', 'pagina3', '20', '64', '3', 'CN_G5_003.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('86', 'pagina4', '20', '64', '4', 'CN_G5_004.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('87', 'pagina1', '21', '49', '1', 'CS_G6_001.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('88', 'pagina2', '21', '49', '2', 'CS_G6_002.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('89', 'pagina3', '21', '49', '3', 'CS_G6_003.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('90', 'pagina4', '21', '49', '4', 'CS_G6_004.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('91', 'pagina1', '22', '14', '1', 'MT_G6_001.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('92', 'pagina2', '22', '14', '2', 'MT_G6_002.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('93', 'pagina3', '22', '14', '3', 'MT_G6_003.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('94', 'pagina4', '22', '14', '4', 'MT_G6_004.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('95', 'pagina1', '23', '32', '1', 'LG_G6_001.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('96', 'pagina2', '23', '32', '2', 'LG_G6_002.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('97', 'pagina3', '23', '32', '3', 'LG_G6_003.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('98', 'pagina4', '23', '32', '4', 'LG_G6_004.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('99', 'pagina1', '24', '66', '1', 'CN_G6_001.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('100', 'pagina2', '24', '66', '2', 'CN_G6_002.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('101', 'pagina3', '24', '66', '3', 'CN_G6_003.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('102', 'pagina4', '24', '66', '4', 'CN_G6_004.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('103', 'pagina1', '25', '51', '1', 'CS_G7_001.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('104', 'pagina2', '25', '51', '2', 'CS_G7_002.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('105', 'pagina3', '25', '51', '3', 'CS_G7_003.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('106', 'pagina4', '25', '51', '4', 'CS_G7_004.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('107', 'pagina1', '26', '16', '1', 'MT_G7_001.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('108', 'pagina2', '26', '16', '2', 'MT_G7_002.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('109', 'pagina3', '26', '16', '3', 'MT_G7_003.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('110', 'pagina4', '26', '16', '4', 'MT_G7_004.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('111', 'pagina1', '27', '34', '1', 'LG_G7_001.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('112', 'pagina2', '27', '34', '2', 'LG_G7_002.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('113', 'pagina3', '27', '34', '3', 'LG_G7_003.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('114', 'pagina4', '27', '34', '4', 'LG_G7_004.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('115', 'pagina1', '28', '68', '1', 'CN_G7_001.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('116', 'pagina2', '28', '68', '2', 'CN_G7_002.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('117', 'pagina3', '28', '68', '3', 'CN_G7_003.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('118', 'pagina4', '28', '68', '4', 'CN_G7_004.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('119', 'pagina1', '29', '53', '1', 'CS_G8_001.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('120', 'pagina2', '29', '53', '2', 'CS_G8_002.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('121', 'pagina3', '29', '53', '3', 'CS_G8_003.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('122', 'pagina4', '29', '53', '4', 'CS_G8_004.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('123', 'pagina1', '30', '18', '1', 'MT_G8_001.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('124', 'pagina2', '30', '18', '2', 'MT_G8_002.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('125', 'pagina3', '30', '18', '3', 'MT_G8_003.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('126', 'pagina4', '30', '18', '4', 'MT_G8_004.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('127', 'pagina1', '31', '36', '1', 'LG_G8_001.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('128', 'pagina2', '31', '36', '2', 'LG_G8_002.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('129', 'pagina3', '31', '36', '3', 'LG_G8_003.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('130', 'pagina4', '31', '36', '4', 'LG_G8_004.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('131', 'pagina1', '32', '70', '1', 'CN_G8_001.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('132', 'pagina2', '32', '70', '2', 'CN_G8_002.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('133', 'pagina3', '32', '70', '3', 'CN_G8_003.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('134', 'pagina4', '32', '70', '4', 'CN_G8_004.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('135', 'pagina1', '33', '55', '1', 'CS_G9_001.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('136', 'pagina2', '33', '55', '2', 'CS_G9_002.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('137', 'pagina3', '33', '55', '3', 'CS_G9_003.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('138', 'pagina4', '33', '55', '4', 'CS_G9_004.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('139', 'pagina1', '34', '20', '1', 'MT_G9_001.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('140', 'pagina2', '34', '20', '2', 'MT_G9_002.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('141', 'pagina3', '34', '20', '3', 'MT_G9_003.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('142', 'pagina4', '34', '20', '4', 'MT_G9_004.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('143', 'pagina1', '35', '38', '1', 'LG_G9_001.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('144', 'pagina2', '35', '38', '2', 'LG_G9_002.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('145', 'pagina3', '35', '38', '3', 'LG_G9_003.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('146', 'pagina4', '35', '38', '4', 'LG_G9_004.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('147', 'pagina1', '36', '72', '1', 'CN_G9_001.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('148', 'pagina2', '36', '72', '2', 'CN_G9_002.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('149', 'pagina3', '36', '72', '3', 'CN_G9_003.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('150', 'pagina4', '36', '72', '4', 'CN_G9_004.jpg', '', '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');

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
INSERT INTO `periodo` VALUES ('1', '1er PERÍODO', '1', '1', '2019-08-26', '2019-11-19', null, '1', '1', '2020-05-12 03:27:45', '2020-11-02 01:58:37');
INSERT INTO `periodo` VALUES ('2', '2do PERÍODO', '2', '1', '2019-11-25', '2020-03-06', null, '2', '1', '2020-05-12 03:28:52', '2020-11-02 01:58:38');
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
  `tx_origen` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_origen` int(11) NOT NULL,
  `nu_peso` int(11) DEFAULT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=214 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of plan_detalle
-- ----------------------------
INSERT INTO `plan_detalle` VALUES ('10', '7', 'tipo_evaluacion', '1', '25', null, '1', '1', '2020-05-28 01:14:26', '2020-12-03 23:35:57');
INSERT INTO `plan_detalle` VALUES ('11', '7', 'tipo_evaluacion', '2', '25', null, '1', '1', '2020-05-28 01:15:17', '2020-12-03 23:35:57');
INSERT INTO `plan_detalle` VALUES ('12', '7', 'tipo_asignacion', '1', '10', null, '1', '1', '2020-05-28 01:15:45', '2020-05-28 01:23:55');
INSERT INTO `plan_detalle` VALUES ('13', '7', 'tipo_asignacion', '2', '5', null, '1', '1', '2020-05-28 01:16:31', '2020-12-03 23:28:33');
INSERT INTO `plan_detalle` VALUES ('14', '7', 'tipo_asignacion', '3', '5', null, '1', '1', '2020-05-28 01:17:40', '2020-12-03 23:28:33');
INSERT INTO `plan_detalle` VALUES ('16', '7', 'tipo_asignacion', '4', '5', null, '1', '1', '2020-05-28 01:28:06', '2020-05-28 14:37:41');
INSERT INTO `plan_detalle` VALUES ('21', '7', 'tipo_asignacion', '5', '5', null, '1', '1', '2020-06-29 18:00:07', '2020-06-29 18:00:07');
INSERT INTO `plan_detalle` VALUES ('22', '7', 'rasgo', '1', '5', null, '1', '1', '2020-06-29 18:00:43', '2020-12-03 23:35:57');
INSERT INTO `plan_detalle` VALUES ('23', '7', 'rasgo', '2', '5', null, '1', '1', '0000-00-00 00:00:00', '2020-12-03 23:35:57');
INSERT INTO `plan_detalle` VALUES ('24', '7', 'rasgo', '3', '5', null, '1', '1', null, '2020-12-03 23:35:57');
INSERT INTO `plan_detalle` VALUES ('25', '7', 'rasgo', '4', '5', null, '1', '1', null, null);
INSERT INTO `plan_detalle` VALUES ('27', '83', 'tipo_evaluacion', '1', '25', null, '1', '1', '2020-12-04 01:18:40', null);
INSERT INTO `plan_detalle` VALUES ('28', '83', 'tipo_evaluacion', '2', '25', null, '1', '1', '2020-12-04 01:18:40', null);
INSERT INTO `plan_detalle` VALUES ('29', '83', 'tipo_asignacion', '1', '10', null, '1', '1', '2020-12-04 01:18:40', null);
INSERT INTO `plan_detalle` VALUES ('30', '83', 'tipo_asignacion', '2', '5', null, '1', '1', '2020-12-04 01:18:40', null);
INSERT INTO `plan_detalle` VALUES ('31', '83', 'tipo_asignacion', '3', '5', null, '1', '1', '2020-12-04 01:18:40', null);
INSERT INTO `plan_detalle` VALUES ('32', '83', 'tipo_asignacion', '4', '5', null, '1', '1', '2020-12-04 01:18:40', null);
INSERT INTO `plan_detalle` VALUES ('33', '83', 'tipo_asignacion', '5', '5', null, '1', '1', '2020-12-04 01:18:40', null);
INSERT INTO `plan_detalle` VALUES ('34', '83', 'rasgo', '1', '5', null, '1', '1', '2020-12-04 01:18:40', null);
INSERT INTO `plan_detalle` VALUES ('35', '83', 'rasgo', '2', '5', null, '1', '1', '2020-12-04 01:18:40', null);
INSERT INTO `plan_detalle` VALUES ('36', '83', 'rasgo', '3', '5', null, '1', '1', '2020-12-04 01:18:40', null);
INSERT INTO `plan_detalle` VALUES ('37', '83', 'rasgo', '4', '5', null, '1', '1', '2020-12-04 01:18:40', null);
INSERT INTO `plan_detalle` VALUES ('38', '55', 'tipo_evaluacion', '1', '25', null, '1', '1', '2020-07-13 20:17:57', null);
INSERT INTO `plan_detalle` VALUES ('39', '55', 'tipo_evaluacion', '2', '25', null, '1', '1', '2020-07-13 20:17:57', null);
INSERT INTO `plan_detalle` VALUES ('40', '55', 'tipo_asignacion', '1', '10', null, '1', '1', '2020-07-13 20:17:57', null);
INSERT INTO `plan_detalle` VALUES ('41', '55', 'tipo_asignacion', '2', '5', null, '1', '1', '2020-07-13 20:17:57', null);
INSERT INTO `plan_detalle` VALUES ('42', '55', 'tipo_asignacion', '3', '5', null, '1', '1', '2020-07-13 20:17:57', null);
INSERT INTO `plan_detalle` VALUES ('43', '55', 'tipo_asignacion', '4', '5', null, '1', '1', '2020-07-13 20:17:57', null);
INSERT INTO `plan_detalle` VALUES ('44', '55', 'tipo_asignacion', '5', '5', null, '1', '1', '2020-07-13 20:17:57', null);
INSERT INTO `plan_detalle` VALUES ('45', '55', 'rasgo', '1', '5', null, '1', '1', '2020-07-13 20:17:57', null);
INSERT INTO `plan_detalle` VALUES ('46', '55', 'rasgo', '2', '5', null, '1', '1', '2020-07-13 20:17:57', null);
INSERT INTO `plan_detalle` VALUES ('47', '55', 'rasgo', '3', '5', null, '1', '1', '2020-07-13 20:17:57', null);
INSERT INTO `plan_detalle` VALUES ('48', '55', 'rasgo', '4', '5', null, '1', '1', '2020-07-13 20:17:57', null);
INSERT INTO `plan_detalle` VALUES ('49', '2', 'tipo_evaluacion', '1', '25', null, '1', '1', '2020-05-26 21:32:02', null);
INSERT INTO `plan_detalle` VALUES ('50', '2', 'tipo_evaluacion', '2', '25', null, '1', '1', '2020-05-26 21:32:02', null);
INSERT INTO `plan_detalle` VALUES ('51', '2', 'tipo_asignacion', '1', '10', null, '1', '1', '2020-05-26 21:32:02', null);
INSERT INTO `plan_detalle` VALUES ('52', '2', 'tipo_asignacion', '2', '5', null, '1', '1', '2020-05-26 21:32:02', null);
INSERT INTO `plan_detalle` VALUES ('53', '2', 'tipo_asignacion', '3', '5', null, '1', '1', '2020-05-26 21:32:02', null);
INSERT INTO `plan_detalle` VALUES ('54', '2', 'tipo_asignacion', '4', '5', null, '1', '1', '2020-05-26 21:32:02', null);
INSERT INTO `plan_detalle` VALUES ('55', '2', 'tipo_asignacion', '5', '5', null, '1', '1', '2020-05-26 21:32:02', null);
INSERT INTO `plan_detalle` VALUES ('56', '2', 'rasgo', '1', '5', null, '1', '1', '2020-05-26 21:32:02', null);
INSERT INTO `plan_detalle` VALUES ('57', '2', 'rasgo', '2', '5', null, '1', '1', '2020-05-26 21:32:02', null);
INSERT INTO `plan_detalle` VALUES ('58', '2', 'rasgo', '3', '5', null, '1', '1', '2020-05-26 21:32:02', null);
INSERT INTO `plan_detalle` VALUES ('59', '2', 'rasgo', '4', '5', null, '1', '1', '2020-05-26 21:32:02', null);
INSERT INTO `plan_detalle` VALUES ('60', '8', 'tipo_evaluacion', '1', '25', null, '1', '1', '2020-07-10 23:07:27', null);
INSERT INTO `plan_detalle` VALUES ('61', '8', 'tipo_evaluacion', '2', '25', null, '1', '1', '2020-07-10 23:07:27', null);
INSERT INTO `plan_detalle` VALUES ('62', '8', 'tipo_asignacion', '1', '10', null, '1', '1', '2020-07-10 23:07:27', null);
INSERT INTO `plan_detalle` VALUES ('63', '8', 'tipo_asignacion', '2', '5', null, '1', '1', '2020-07-10 23:07:27', null);
INSERT INTO `plan_detalle` VALUES ('64', '8', 'tipo_asignacion', '3', '5', null, '1', '1', '2020-07-10 23:07:27', null);
INSERT INTO `plan_detalle` VALUES ('65', '8', 'tipo_asignacion', '4', '5', null, '1', '1', '2020-07-10 23:07:27', null);
INSERT INTO `plan_detalle` VALUES ('66', '8', 'tipo_asignacion', '5', '5', null, '1', '1', '2020-07-10 23:07:27', null);
INSERT INTO `plan_detalle` VALUES ('67', '8', 'rasgo', '1', '5', null, '1', '1', '2020-07-10 23:07:27', null);
INSERT INTO `plan_detalle` VALUES ('68', '8', 'rasgo', '2', '5', null, '1', '1', '2020-07-10 23:07:27', null);
INSERT INTO `plan_detalle` VALUES ('69', '8', 'rasgo', '3', '5', null, '1', '1', '2020-07-10 23:07:27', null);
INSERT INTO `plan_detalle` VALUES ('70', '8', 'rasgo', '4', '5', null, '1', '1', '2020-07-10 23:07:27', null);
INSERT INTO `plan_detalle` VALUES ('71', '61', 'tipo_evaluacion', '1', '25', null, '1', '1', '2020-07-16 00:45:43', null);
INSERT INTO `plan_detalle` VALUES ('72', '61', 'tipo_evaluacion', '2', '25', null, '1', '1', '2020-07-16 00:45:43', null);
INSERT INTO `plan_detalle` VALUES ('73', '61', 'tipo_asignacion', '1', '10', null, '1', '1', '2020-07-16 00:45:43', null);
INSERT INTO `plan_detalle` VALUES ('74', '61', 'tipo_asignacion', '2', '5', null, '1', '1', '2020-07-16 00:45:43', null);
INSERT INTO `plan_detalle` VALUES ('75', '61', 'tipo_asignacion', '3', '5', null, '1', '1', '2020-07-16 00:45:43', null);
INSERT INTO `plan_detalle` VALUES ('76', '61', 'tipo_asignacion', '4', '5', null, '1', '1', '2020-07-16 00:45:43', null);
INSERT INTO `plan_detalle` VALUES ('77', '61', 'tipo_asignacion', '5', '5', null, '1', '1', '2020-07-16 00:45:43', null);
INSERT INTO `plan_detalle` VALUES ('78', '61', 'rasgo', '1', '5', null, '1', '1', '2020-07-16 00:45:43', null);
INSERT INTO `plan_detalle` VALUES ('79', '61', 'rasgo', '2', '5', null, '1', '1', '2020-07-16 00:45:43', null);
INSERT INTO `plan_detalle` VALUES ('80', '61', 'rasgo', '3', '5', null, '1', '1', '2020-07-16 00:45:43', null);
INSERT INTO `plan_detalle` VALUES ('81', '61', 'rasgo', '4', '5', null, '1', '1', '2020-07-16 00:45:43', null);
INSERT INTO `plan_detalle` VALUES ('82', '85', 'tipo_evaluacion', '1', '25', null, '1', '1', '2020-12-05 23:51:53', null);
INSERT INTO `plan_detalle` VALUES ('83', '85', 'tipo_evaluacion', '2', '25', null, '1', '1', '2020-12-05 23:51:53', null);
INSERT INTO `plan_detalle` VALUES ('84', '85', 'tipo_asignacion', '1', '10', null, '1', '1', '2020-12-05 23:51:53', null);
INSERT INTO `plan_detalle` VALUES ('85', '85', 'tipo_asignacion', '2', '5', null, '1', '1', '2020-12-05 23:51:53', null);
INSERT INTO `plan_detalle` VALUES ('86', '85', 'tipo_asignacion', '3', '5', null, '1', '1', '2020-12-05 23:51:53', null);
INSERT INTO `plan_detalle` VALUES ('87', '85', 'tipo_asignacion', '4', '5', null, '1', '1', '2020-12-05 23:51:53', null);
INSERT INTO `plan_detalle` VALUES ('88', '85', 'tipo_asignacion', '5', '5', null, '1', '1', '2020-12-05 23:51:53', null);
INSERT INTO `plan_detalle` VALUES ('89', '85', 'rasgo', '1', '5', null, '1', '1', '2020-12-05 23:51:53', null);
INSERT INTO `plan_detalle` VALUES ('90', '85', 'rasgo', '2', '5', null, '1', '1', '2020-12-05 23:51:53', null);
INSERT INTO `plan_detalle` VALUES ('91', '85', 'rasgo', '3', '5', null, '1', '1', '2020-12-05 23:51:53', null);
INSERT INTO `plan_detalle` VALUES ('92', '85', 'rasgo', '4', '5', null, '1', '1', '2020-12-05 23:51:53', null);
INSERT INTO `plan_detalle` VALUES ('93', '86', 'tipo_evaluacion', '1', '25', null, '1', '1', '2020-12-05 23:51:54', null);
INSERT INTO `plan_detalle` VALUES ('94', '86', 'tipo_evaluacion', '2', '25', null, '1', '1', '2020-12-05 23:51:54', null);
INSERT INTO `plan_detalle` VALUES ('95', '86', 'tipo_asignacion', '1', '10', null, '1', '1', '2020-12-05 23:51:54', null);
INSERT INTO `plan_detalle` VALUES ('96', '86', 'tipo_asignacion', '2', '5', null, '1', '1', '2020-12-05 23:51:54', null);
INSERT INTO `plan_detalle` VALUES ('97', '86', 'tipo_asignacion', '3', '5', null, '1', '1', '2020-12-05 23:51:54', null);
INSERT INTO `plan_detalle` VALUES ('98', '86', 'tipo_asignacion', '4', '5', null, '1', '1', '2020-12-05 23:51:54', null);
INSERT INTO `plan_detalle` VALUES ('99', '86', 'tipo_asignacion', '5', '5', null, '1', '1', '2020-12-05 23:51:54', null);
INSERT INTO `plan_detalle` VALUES ('100', '86', 'rasgo', '1', '5', null, '1', '1', '2020-12-05 23:51:54', null);
INSERT INTO `plan_detalle` VALUES ('101', '86', 'rasgo', '2', '5', null, '1', '1', '2020-12-05 23:51:54', null);
INSERT INTO `plan_detalle` VALUES ('102', '86', 'rasgo', '3', '5', null, '1', '1', '2020-12-05 23:51:54', null);
INSERT INTO `plan_detalle` VALUES ('103', '86', 'rasgo', '4', '5', null, '1', '1', '2020-12-05 23:51:54', null);
INSERT INTO `plan_detalle` VALUES ('104', '87', 'tipo_evaluacion', '1', '25', null, '1', '1', '2020-12-05 23:59:06', null);
INSERT INTO `plan_detalle` VALUES ('105', '87', 'tipo_evaluacion', '2', '25', null, '1', '1', '2020-12-05 23:59:06', null);
INSERT INTO `plan_detalle` VALUES ('106', '87', 'tipo_asignacion', '1', '10', null, '1', '1', '2020-12-05 23:59:06', null);
INSERT INTO `plan_detalle` VALUES ('107', '87', 'tipo_asignacion', '2', '5', null, '1', '1', '2020-12-05 23:59:06', null);
INSERT INTO `plan_detalle` VALUES ('108', '87', 'tipo_asignacion', '3', '5', null, '1', '1', '2020-12-05 23:59:06', null);
INSERT INTO `plan_detalle` VALUES ('109', '87', 'tipo_asignacion', '4', '5', null, '1', '1', '2020-12-05 23:59:06', null);
INSERT INTO `plan_detalle` VALUES ('110', '87', 'tipo_asignacion', '5', '5', null, '1', '1', '2020-12-05 23:59:06', null);
INSERT INTO `plan_detalle` VALUES ('111', '87', 'rasgo', '1', '5', null, '1', '1', '2020-12-05 23:59:06', null);
INSERT INTO `plan_detalle` VALUES ('112', '87', 'rasgo', '2', '5', null, '1', '1', '2020-12-05 23:59:06', null);
INSERT INTO `plan_detalle` VALUES ('113', '87', 'rasgo', '3', '5', null, '1', '1', '2020-12-05 23:59:06', null);
INSERT INTO `plan_detalle` VALUES ('114', '87', 'rasgo', '4', '5', null, '1', '1', '2020-12-05 23:59:06', null);
INSERT INTO `plan_detalle` VALUES ('115', '88', 'tipo_evaluacion', '1', '25', null, '1', '1', '2020-12-05 23:59:11', null);
INSERT INTO `plan_detalle` VALUES ('116', '88', 'tipo_evaluacion', '2', '25', null, '1', '1', '2020-12-05 23:59:11', null);
INSERT INTO `plan_detalle` VALUES ('117', '88', 'tipo_asignacion', '1', '10', null, '1', '1', '2020-12-05 23:59:11', null);
INSERT INTO `plan_detalle` VALUES ('118', '88', 'tipo_asignacion', '2', '5', null, '1', '1', '2020-12-05 23:59:11', null);
INSERT INTO `plan_detalle` VALUES ('119', '88', 'tipo_asignacion', '3', '5', null, '1', '1', '2020-12-05 23:59:11', null);
INSERT INTO `plan_detalle` VALUES ('120', '88', 'tipo_asignacion', '4', '5', null, '1', '1', '2020-12-05 23:59:11', null);
INSERT INTO `plan_detalle` VALUES ('121', '88', 'tipo_asignacion', '5', '5', null, '1', '1', '2020-12-05 23:59:11', null);
INSERT INTO `plan_detalle` VALUES ('122', '88', 'rasgo', '1', '5', null, '1', '1', '2020-12-05 23:59:11', null);
INSERT INTO `plan_detalle` VALUES ('123', '88', 'rasgo', '2', '5', null, '1', '1', '2020-12-05 23:59:11', null);
INSERT INTO `plan_detalle` VALUES ('124', '88', 'rasgo', '3', '5', null, '1', '1', '2020-12-05 23:59:11', null);
INSERT INTO `plan_detalle` VALUES ('125', '88', 'rasgo', '4', '5', null, '1', '1', '2020-12-05 23:59:11', null);
INSERT INTO `plan_detalle` VALUES ('126', '89', 'tipo_evaluacion', '1', '25', null, '1', '1', '2020-12-05 23:59:23', null);
INSERT INTO `plan_detalle` VALUES ('127', '89', 'tipo_evaluacion', '2', '25', null, '1', '1', '2020-12-05 23:59:23', null);
INSERT INTO `plan_detalle` VALUES ('128', '89', 'tipo_asignacion', '1', '10', null, '1', '1', '2020-12-05 23:59:23', null);
INSERT INTO `plan_detalle` VALUES ('129', '89', 'tipo_asignacion', '2', '5', null, '1', '1', '2020-12-05 23:59:23', null);
INSERT INTO `plan_detalle` VALUES ('130', '89', 'tipo_asignacion', '3', '5', null, '1', '1', '2020-12-05 23:59:23', null);
INSERT INTO `plan_detalle` VALUES ('131', '89', 'tipo_asignacion', '4', '5', null, '1', '1', '2020-12-05 23:59:23', null);
INSERT INTO `plan_detalle` VALUES ('132', '89', 'tipo_asignacion', '5', '5', null, '1', '1', '2020-12-05 23:59:23', null);
INSERT INTO `plan_detalle` VALUES ('133', '89', 'rasgo', '1', '5', null, '1', '1', '2020-12-05 23:59:23', null);
INSERT INTO `plan_detalle` VALUES ('134', '89', 'rasgo', '2', '5', null, '1', '1', '2020-12-05 23:59:23', null);
INSERT INTO `plan_detalle` VALUES ('135', '89', 'rasgo', '3', '5', null, '1', '1', '2020-12-05 23:59:23', null);
INSERT INTO `plan_detalle` VALUES ('136', '89', 'rasgo', '4', '5', null, '1', '1', '2020-12-05 23:59:23', null);
INSERT INTO `plan_detalle` VALUES ('137', '90', 'tipo_evaluacion', '1', '25', null, '1', '1', '2020-12-05 23:59:29', null);
INSERT INTO `plan_detalle` VALUES ('138', '90', 'tipo_evaluacion', '2', '25', null, '1', '1', '2020-12-05 23:59:29', null);
INSERT INTO `plan_detalle` VALUES ('139', '90', 'tipo_asignacion', '1', '10', null, '1', '1', '2020-12-05 23:59:29', null);
INSERT INTO `plan_detalle` VALUES ('140', '90', 'tipo_asignacion', '2', '5', null, '1', '1', '2020-12-05 23:59:29', null);
INSERT INTO `plan_detalle` VALUES ('141', '90', 'tipo_asignacion', '3', '5', null, '1', '1', '2020-12-05 23:59:29', null);
INSERT INTO `plan_detalle` VALUES ('142', '90', 'tipo_asignacion', '4', '5', null, '1', '1', '2020-12-05 23:59:29', null);
INSERT INTO `plan_detalle` VALUES ('143', '90', 'tipo_asignacion', '5', '5', null, '1', '1', '2020-12-05 23:59:29', null);
INSERT INTO `plan_detalle` VALUES ('144', '90', 'rasgo', '1', '5', null, '1', '1', '2020-12-05 23:59:29', null);
INSERT INTO `plan_detalle` VALUES ('145', '90', 'rasgo', '2', '5', null, '1', '1', '2020-12-05 23:59:29', null);
INSERT INTO `plan_detalle` VALUES ('146', '90', 'rasgo', '3', '5', null, '1', '1', '2020-12-05 23:59:29', null);
INSERT INTO `plan_detalle` VALUES ('147', '90', 'rasgo', '4', '5', null, '1', '1', '2020-12-05 23:59:29', null);
INSERT INTO `plan_detalle` VALUES ('148', '91', 'tipo_evaluacion', '1', '25', null, '1', '1', '2020-12-05 23:59:39', null);
INSERT INTO `plan_detalle` VALUES ('149', '91', 'tipo_evaluacion', '2', '25', null, '1', '1', '2020-12-05 23:59:39', null);
INSERT INTO `plan_detalle` VALUES ('150', '91', 'tipo_asignacion', '1', '10', null, '1', '1', '2020-12-05 23:59:39', null);
INSERT INTO `plan_detalle` VALUES ('151', '91', 'tipo_asignacion', '2', '5', null, '1', '1', '2020-12-05 23:59:39', null);
INSERT INTO `plan_detalle` VALUES ('152', '91', 'tipo_asignacion', '3', '5', null, '1', '1', '2020-12-05 23:59:39', null);
INSERT INTO `plan_detalle` VALUES ('153', '91', 'tipo_asignacion', '4', '5', null, '1', '1', '2020-12-05 23:59:39', null);
INSERT INTO `plan_detalle` VALUES ('154', '91', 'tipo_asignacion', '5', '5', null, '1', '1', '2020-12-05 23:59:39', null);
INSERT INTO `plan_detalle` VALUES ('155', '91', 'rasgo', '1', '5', null, '1', '1', '2020-12-05 23:59:39', null);
INSERT INTO `plan_detalle` VALUES ('156', '91', 'rasgo', '2', '5', null, '1', '1', '2020-12-05 23:59:39', null);
INSERT INTO `plan_detalle` VALUES ('157', '91', 'rasgo', '3', '5', null, '1', '1', '2020-12-05 23:59:39', null);
INSERT INTO `plan_detalle` VALUES ('158', '91', 'rasgo', '4', '5', null, '1', '1', '2020-12-05 23:59:39', null);
INSERT INTO `plan_detalle` VALUES ('159', '92', 'tipo_evaluacion', '1', '25', null, '1', '1', '2020-12-05 23:59:45', null);
INSERT INTO `plan_detalle` VALUES ('160', '92', 'tipo_evaluacion', '2', '25', null, '1', '1', '2020-12-05 23:59:45', null);
INSERT INTO `plan_detalle` VALUES ('161', '92', 'tipo_asignacion', '1', '10', null, '1', '1', '2020-12-05 23:59:45', null);
INSERT INTO `plan_detalle` VALUES ('162', '92', 'tipo_asignacion', '2', '5', null, '1', '1', '2020-12-05 23:59:45', null);
INSERT INTO `plan_detalle` VALUES ('163', '92', 'tipo_asignacion', '3', '5', null, '1', '1', '2020-12-05 23:59:45', null);
INSERT INTO `plan_detalle` VALUES ('164', '92', 'tipo_asignacion', '4', '5', null, '1', '1', '2020-12-05 23:59:45', null);
INSERT INTO `plan_detalle` VALUES ('165', '92', 'tipo_asignacion', '5', '5', null, '1', '1', '2020-12-05 23:59:45', null);
INSERT INTO `plan_detalle` VALUES ('166', '92', 'rasgo', '1', '5', null, '1', '1', '2020-12-05 23:59:45', null);
INSERT INTO `plan_detalle` VALUES ('167', '92', 'rasgo', '2', '5', null, '1', '1', '2020-12-05 23:59:45', null);
INSERT INTO `plan_detalle` VALUES ('168', '92', 'rasgo', '3', '5', null, '1', '1', '2020-12-05 23:59:45', null);
INSERT INTO `plan_detalle` VALUES ('169', '92', 'rasgo', '4', '5', null, '1', '1', '2020-12-05 23:59:45', null);
INSERT INTO `plan_detalle` VALUES ('170', '93', 'tipo_evaluacion', '1', '25', null, '1', '1', '2020-12-06 00:00:27', null);
INSERT INTO `plan_detalle` VALUES ('171', '93', 'tipo_evaluacion', '2', '25', null, '1', '1', '2020-12-06 00:00:27', null);
INSERT INTO `plan_detalle` VALUES ('172', '93', 'tipo_asignacion', '1', '10', null, '1', '1', '2020-12-06 00:00:27', null);
INSERT INTO `plan_detalle` VALUES ('173', '93', 'tipo_asignacion', '2', '5', null, '1', '1', '2020-12-06 00:00:27', null);
INSERT INTO `plan_detalle` VALUES ('174', '93', 'tipo_asignacion', '3', '5', null, '1', '1', '2020-12-06 00:00:27', null);
INSERT INTO `plan_detalle` VALUES ('175', '93', 'tipo_asignacion', '4', '5', null, '1', '1', '2020-12-06 00:00:27', null);
INSERT INTO `plan_detalle` VALUES ('176', '93', 'tipo_asignacion', '5', '5', null, '1', '1', '2020-12-06 00:00:27', null);
INSERT INTO `plan_detalle` VALUES ('177', '93', 'rasgo', '1', '5', null, '1', '1', '2020-12-06 00:00:27', null);
INSERT INTO `plan_detalle` VALUES ('178', '93', 'rasgo', '2', '5', null, '1', '1', '2020-12-06 00:00:27', null);
INSERT INTO `plan_detalle` VALUES ('179', '93', 'rasgo', '3', '5', null, '1', '1', '2020-12-06 00:00:27', null);
INSERT INTO `plan_detalle` VALUES ('180', '93', 'rasgo', '4', '5', null, '1', '1', '2020-12-06 00:00:27', null);
INSERT INTO `plan_detalle` VALUES ('181', '94', 'tipo_evaluacion', '1', '25', null, '1', '1', '2020-12-06 00:00:33', null);
INSERT INTO `plan_detalle` VALUES ('182', '94', 'tipo_evaluacion', '2', '25', null, '1', '1', '2020-12-06 00:00:33', null);
INSERT INTO `plan_detalle` VALUES ('183', '94', 'tipo_asignacion', '1', '10', null, '1', '1', '2020-12-06 00:00:33', null);
INSERT INTO `plan_detalle` VALUES ('184', '94', 'tipo_asignacion', '2', '5', null, '1', '1', '2020-12-06 00:00:33', null);
INSERT INTO `plan_detalle` VALUES ('185', '94', 'tipo_asignacion', '3', '5', null, '1', '1', '2020-12-06 00:00:33', null);
INSERT INTO `plan_detalle` VALUES ('186', '94', 'tipo_asignacion', '4', '5', null, '1', '1', '2020-12-06 00:00:33', null);
INSERT INTO `plan_detalle` VALUES ('187', '94', 'tipo_asignacion', '5', '5', null, '1', '1', '2020-12-06 00:00:33', null);
INSERT INTO `plan_detalle` VALUES ('188', '94', 'rasgo', '1', '5', null, '1', '1', '2020-12-06 00:00:33', null);
INSERT INTO `plan_detalle` VALUES ('189', '94', 'rasgo', '2', '5', null, '1', '1', '2020-12-06 00:00:33', null);
INSERT INTO `plan_detalle` VALUES ('190', '94', 'rasgo', '3', '5', null, '1', '1', '2020-12-06 00:00:33', null);
INSERT INTO `plan_detalle` VALUES ('191', '94', 'rasgo', '4', '5', null, '1', '1', '2020-12-06 00:00:33', null);
INSERT INTO `plan_detalle` VALUES ('192', '95', 'tipo_evaluacion', '1', '25', null, '1', '1', '2020-12-06 00:00:43', null);
INSERT INTO `plan_detalle` VALUES ('193', '95', 'tipo_evaluacion', '2', '25', null, '1', '1', '2020-12-06 00:00:43', null);
INSERT INTO `plan_detalle` VALUES ('194', '95', 'tipo_asignacion', '1', '10', null, '1', '1', '2020-12-06 00:00:43', null);
INSERT INTO `plan_detalle` VALUES ('195', '95', 'tipo_asignacion', '2', '5', null, '1', '1', '2020-12-06 00:00:43', null);
INSERT INTO `plan_detalle` VALUES ('196', '95', 'tipo_asignacion', '3', '5', null, '1', '1', '2020-12-06 00:00:43', null);
INSERT INTO `plan_detalle` VALUES ('197', '95', 'tipo_asignacion', '4', '5', null, '1', '1', '2020-12-06 00:00:43', null);
INSERT INTO `plan_detalle` VALUES ('198', '95', 'tipo_asignacion', '5', '5', null, '1', '1', '2020-12-06 00:00:43', null);
INSERT INTO `plan_detalle` VALUES ('199', '95', 'rasgo', '1', '5', null, '1', '1', '2020-12-06 00:00:43', null);
INSERT INTO `plan_detalle` VALUES ('200', '95', 'rasgo', '2', '5', null, '1', '1', '2020-12-06 00:00:43', null);
INSERT INTO `plan_detalle` VALUES ('201', '95', 'rasgo', '3', '5', null, '1', '1', '2020-12-06 00:00:43', null);
INSERT INTO `plan_detalle` VALUES ('202', '95', 'rasgo', '4', '5', null, '1', '1', '2020-12-06 00:00:43', null);
INSERT INTO `plan_detalle` VALUES ('203', '96', 'tipo_evaluacion', '1', '25', null, '1', '1', '2020-12-06 00:00:50', null);
INSERT INTO `plan_detalle` VALUES ('204', '96', 'tipo_evaluacion', '2', '25', null, '1', '1', '2020-12-06 00:00:50', null);
INSERT INTO `plan_detalle` VALUES ('205', '96', 'tipo_asignacion', '1', '10', null, '1', '1', '2020-12-06 00:00:50', null);
INSERT INTO `plan_detalle` VALUES ('206', '96', 'tipo_asignacion', '2', '5', null, '1', '1', '2020-12-06 00:00:50', null);
INSERT INTO `plan_detalle` VALUES ('207', '96', 'tipo_asignacion', '3', '5', null, '1', '1', '2020-12-06 00:00:50', null);
INSERT INTO `plan_detalle` VALUES ('208', '96', 'tipo_asignacion', '4', '5', null, '1', '1', '2020-12-06 00:00:50', null);
INSERT INTO `plan_detalle` VALUES ('209', '96', 'tipo_asignacion', '5', '5', null, '1', '1', '2020-12-06 00:00:50', null);
INSERT INTO `plan_detalle` VALUES ('210', '96', 'rasgo', '1', '5', null, '1', '1', '2020-12-06 00:00:50', null);
INSERT INTO `plan_detalle` VALUES ('211', '96', 'rasgo', '2', '5', null, '1', '1', '2020-12-06 00:00:50', null);
INSERT INTO `plan_detalle` VALUES ('212', '96', 'rasgo', '3', '5', null, '1', '1', '2020-12-06 00:00:50', null);
INSERT INTO `plan_detalle` VALUES ('213', '96', 'rasgo', '4', '5', null, '1', '1', '2020-12-06 00:00:50', null);

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
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of plan_evaluacion
-- ----------------------------
INSERT INTO `plan_evaluacion` VALUES ('2', '1', '1', '7', '1', null, '1', '1', '2020-05-26 21:32:02', '2020-12-04 01:34:12');
INSERT INTO `plan_evaluacion` VALUES ('6', '1', '2', '19', '1', 'rwrrrwrw', '1', '1', '2020-06-29 17:59:15', '2020-06-29 17:59:15');
INSERT INTO `plan_evaluacion` VALUES ('7', '1', '1', '19', '10', null, '1', '1', '2020-07-10 23:02:54', '2020-07-10 23:02:54');
INSERT INTO `plan_evaluacion` VALUES ('8', '1', '1', '17', '13', null, '1', '1', '2020-07-10 23:07:27', '2020-12-04 01:34:23');
INSERT INTO `plan_evaluacion` VALUES ('52', '6', '1', '14', '14', null, '2', '1', '2020-07-13 20:09:21', '2020-07-13 20:09:21');
INSERT INTO `plan_evaluacion` VALUES ('53', '6', '2', '14', '14', null, '2', '1', '2020-07-13 20:15:34', '2020-07-13 20:15:34');
INSERT INTO `plan_evaluacion` VALUES ('54', '1', '2', '7', '1', null, '2', '1', '2020-07-13 20:16:40', '2020-07-13 20:16:40');
INSERT INTO `plan_evaluacion` VALUES ('55', '2', '1', '7', '12', null, '2', '1', '2020-07-13 20:17:57', '2020-12-04 01:31:01');
INSERT INTO `plan_evaluacion` VALUES ('56', '1', '2', '19', '1', null, '2', '1', '2020-07-13 20:19:37', '2020-07-13 20:19:48');
INSERT INTO `plan_evaluacion` VALUES ('59', '2', '1', '17', '13', null, '2', '1', '2020-07-14 02:42:05', '2020-11-10 16:02:30');
INSERT INTO `plan_evaluacion` VALUES ('60', '2', '1', '14', '14', null, '2', '1', '2020-07-14 02:42:13', '2020-11-10 16:06:02');
INSERT INTO `plan_evaluacion` VALUES ('61', '1', '1', '15', '11', null, '1', '1', '2020-07-16 00:45:43', '2020-12-04 01:34:38');
INSERT INTO `plan_evaluacion` VALUES ('62', '1', '1', '14', '1', null, '1', '1', '2020-07-30 13:09:11', '2020-07-30 13:09:11');
INSERT INTO `plan_evaluacion` VALUES ('63', '1', '1', '16', '11', null, '2', '1', '2020-09-08 00:56:35', '2020-09-08 00:56:35');
INSERT INTO `plan_evaluacion` VALUES ('64', '14', '1', '7', '1', null, '2', '1', '2020-10-26 16:11:16', '2020-10-26 16:11:16');
INSERT INTO `plan_evaluacion` VALUES ('65', '14', '1', '19', '1', null, '2', '1', '2020-10-26 16:11:22', '2020-10-26 16:11:22');
INSERT INTO `plan_evaluacion` VALUES ('66', '14', '1', '15', '1', null, '2', '1', '2020-10-26 16:11:27', '2020-11-16 12:17:32');
INSERT INTO `plan_evaluacion` VALUES ('67', '14', '1', '14', '1', null, '2', '1', '2020-10-26 16:11:33', '2020-10-26 16:11:33');
INSERT INTO `plan_evaluacion` VALUES ('68', '19', '1', '7', '1', null, '2', '1', '2020-11-10 16:02:54', '2020-11-10 16:02:54');
INSERT INTO `plan_evaluacion` VALUES ('69', '19', '1', '19', '1', null, '2', '1', '2020-11-10 16:03:02', '2020-11-10 16:03:02');
INSERT INTO `plan_evaluacion` VALUES ('70', '19', '1', '15', '11', null, '2', '1', '2020-11-10 16:03:08', '2020-11-10 16:03:08');
INSERT INTO `plan_evaluacion` VALUES ('71', '19', '1', '14', '1', null, '2', '1', '2020-11-10 16:03:14', '2020-11-10 16:03:14');
INSERT INTO `plan_evaluacion` VALUES ('72', '21', '1', '7', '1', null, '2', '1', '2020-11-10 16:03:24', '2020-11-10 16:03:24');
INSERT INTO `plan_evaluacion` VALUES ('73', '21', '1', '19', '1', null, '2', '1', '2020-11-10 16:03:34', '2020-11-10 16:03:34');
INSERT INTO `plan_evaluacion` VALUES ('74', '21', '1', '14', '1', null, '2', '1', '2020-11-10 16:03:41', '2020-11-10 16:03:41');
INSERT INTO `plan_evaluacion` VALUES ('75', '23', '1', '7', '1', null, '2', '1', '2020-11-10 16:04:19', '2020-11-10 16:04:19');
INSERT INTO `plan_evaluacion` VALUES ('76', '23', '1', '19', '1', null, '2', '1', '2020-11-10 16:04:25', '2020-11-10 16:04:25');
INSERT INTO `plan_evaluacion` VALUES ('77', '23', '1', '14', '1', null, '2', '1', '2020-11-10 16:04:30', '2020-11-10 16:04:30');
INSERT INTO `plan_evaluacion` VALUES ('78', '25', '1', '7', '1', null, '2', '1', '2020-11-10 16:04:42', '2020-11-10 16:04:42');
INSERT INTO `plan_evaluacion` VALUES ('79', '25', '1', '19', '1', null, '2', '1', '2020-11-10 16:04:49', '2020-11-10 16:04:49');
INSERT INTO `plan_evaluacion` VALUES ('80', '25', '1', '14', '1', null, '2', '1', '2020-11-10 16:04:55', '2020-11-10 16:04:55');
INSERT INTO `plan_evaluacion` VALUES ('81', '17', '1', '7', '1', null, '2', '1', '2020-12-04 00:07:00', '2020-12-04 00:10:04');
INSERT INTO `plan_evaluacion` VALUES ('82', '17', '1', '19', '1', null, '2', '1', '2020-12-04 00:10:20', '2020-12-04 00:10:20');
INSERT INTO `plan_evaluacion` VALUES ('83', '3', '1', '7', '1', null, '2', '1', '2020-12-04 01:18:40', '2020-12-04 01:22:39');
INSERT INTO `plan_evaluacion` VALUES ('84', '2', '1', '19', '10', null, '2', '1', '2020-12-04 01:27:32', '2020-12-04 01:28:38');
INSERT INTO `plan_evaluacion` VALUES ('85', '8', '1', '15', '11', null, '2', '1', '2020-12-05 23:51:53', '2020-12-05 23:51:53');
INSERT INTO `plan_evaluacion` VALUES ('86', '8', '1', '15', '1', null, '2', '1', '2020-12-05 23:51:54', '2020-12-05 23:51:54');
INSERT INTO `plan_evaluacion` VALUES ('87', '8', '1', '7', '1', null, '2', '1', '2020-12-05 23:59:06', '2020-12-05 23:59:06');
INSERT INTO `plan_evaluacion` VALUES ('88', '8', '1', '19', '1', null, '2', '1', '2020-12-05 23:59:11', '2020-12-05 23:59:11');
INSERT INTO `plan_evaluacion` VALUES ('89', '10', '1', '7', '1', null, '2', '1', '2020-12-05 23:59:23', '2020-12-05 23:59:23');
INSERT INTO `plan_evaluacion` VALUES ('90', '10', '1', '19', '1', null, '2', '1', '2020-12-05 23:59:29', '2020-12-05 23:59:29');
INSERT INTO `plan_evaluacion` VALUES ('91', '12', '1', '7', '1', null, '2', '1', '2020-12-05 23:59:39', '2020-12-05 23:59:39');
INSERT INTO `plan_evaluacion` VALUES ('92', '12', '1', '19', '1', null, '2', '1', '2020-12-05 23:59:45', '2020-12-05 23:59:45');
INSERT INTO `plan_evaluacion` VALUES ('93', '27', '1', '7', '1', null, '2', '1', '2020-12-06 00:00:27', '2020-12-06 00:00:27');
INSERT INTO `plan_evaluacion` VALUES ('94', '27', '1', '19', '1', null, '2', '1', '2020-12-06 00:00:33', '2020-12-06 00:00:33');
INSERT INTO `plan_evaluacion` VALUES ('95', '28', '1', '7', '1', null, '2', '1', '2020-12-06 00:00:43', '2020-12-06 00:00:43');
INSERT INTO `plan_evaluacion` VALUES ('96', '28', '1', '19', '1', null, '2', '1', '2020-12-06 00:00:50', '2020-12-06 00:00:50');

-- ----------------------------
-- Table structure for plan_plantilla
-- ----------------------------
DROP TABLE IF EXISTS `plan_plantilla`;
CREATE TABLE `plan_plantilla` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tx_origen` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_origen` int(11) DEFAULT NULL,
  `nu_peso` int(11) DEFAULT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of plan_plantilla
-- ----------------------------
INSERT INTO `plan_plantilla` VALUES ('1', 'tipo_evaluacion', '1', '25', null, '1', '1', null, null);
INSERT INTO `plan_plantilla` VALUES ('2', 'tipo_evaluacion', '2', '25', null, '1', '1', null, null);
INSERT INTO `plan_plantilla` VALUES ('3', 'tipo_asignacion', '1', '10', null, '1', '1', null, null);
INSERT INTO `plan_plantilla` VALUES ('4', 'tipo_asignacion', '2', '5', null, '1', '1', null, null);
INSERT INTO `plan_plantilla` VALUES ('5', 'tipo_asignacion', '3', '5', null, '1', '1', null, null);
INSERT INTO `plan_plantilla` VALUES ('6', 'tipo_asignacion', '4', '5', null, '1', '1', null, null);
INSERT INTO `plan_plantilla` VALUES ('7', 'tipo_asignacion', '5', '5', null, '1', '1', null, null);
INSERT INTO `plan_plantilla` VALUES ('8', 'rasgo', '1', '5', null, '1', '1', null, null);
INSERT INTO `plan_plantilla` VALUES ('9', 'rasgo', '2', '5', null, '1', '1', null, null);
INSERT INTO `plan_plantilla` VALUES ('10', 'rasgo', '3', '5', null, '1', '1', null, null);
INSERT INTO `plan_plantilla` VALUES ('11', 'rasgo', '4', '5', null, '1', '1', null, null);

-- ----------------------------
-- Table structure for plan_tema
-- ----------------------------
DROP TABLE IF EXISTS `plan_tema`;
CREATE TABLE `plan_tema` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_plan_evaluacion` int(11) NOT NULL,
  `id_grupo` int(11) NOT NULL,
  `id_tema` int(11) NOT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of plan_tema
-- ----------------------------
INSERT INTO `plan_tema` VALUES ('60', '7', '1', '1', null, '1', '1', null, null);
INSERT INTO `plan_tema` VALUES ('61', '7', '1', '2', null, '1', '1', null, null);
INSERT INTO `plan_tema` VALUES ('62', '7', '1', '3', null, '1', '1', null, null);
INSERT INTO `plan_tema` VALUES ('63', '2', '1', '57', null, '1', '1', null, null);
INSERT INTO `plan_tema` VALUES ('64', '83', '3', '57', null, '1', '1', null, null);

-- ----------------------------
-- Table structure for pregunta
-- ----------------------------
DROP TABLE IF EXISTS `pregunta`;
CREATE TABLE `pregunta` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_pregunta` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=188 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of pregunta
-- ----------------------------
INSERT INTO `pregunta` VALUES ('1', 'Cuanto es 1+1?', '1', '2', '0', '3.00', '1', 'Acuerdate de la clase 1', '1', '1', '2020-08-03 17:57:02', '2020-08-12 14:15:59');
INSERT INTO `pregunta` VALUES ('2', 'Cuanto es 2+2', '1', '3', '0', '3.00', '3', null, '1', '1', '2020-08-03 19:07:36', '2020-08-04 19:29:39');
INSERT INTO `pregunta` VALUES ('3', 'Que significa el Factor cero (0)?', '1', '1', '0', '4.00', '4', null, '1', '1', '2020-08-03 19:09:42', '2020-08-08 22:18:39');
INSERT INTO `pregunta` VALUES ('5', 'Elementos de la Suma', '1', '3', '0', '4.00', '5', null, '1', '1', '2020-08-04 00:42:24', '2020-08-08 22:18:40');
INSERT INTO `pregunta` VALUES ('6', 'Describa el elemento neutro', '1', '1', '0', '4.00', '2', 'Clase 1 sumas y restas', '1', '1', '2020-08-04 02:48:59', '2020-08-04 19:29:39');
INSERT INTO `pregunta` VALUES ('8', 'Indique suma 6+2', '1', '2', '0', '2.00', '6', 'gere', '1', '1', '2020-08-04 18:29:13', '2020-08-08 22:18:50');
INSERT INTO `pregunta` VALUES ('105', 'Se considera como uno de los autores de la teoría celular:', '14', '2', '0', '2.00', '1', null, '1', '1', '2020-11-16 12:31:50', '2020-11-16 12:31:50');
INSERT INTO `pregunta` VALUES ('106', 'Un organismo procariótico se caracteriza por carecer de:', '14', '2', '0', '2.00', '2', null, '1', '1', '2020-11-16 12:38:18', '2020-11-16 12:38:18');
INSERT INTO `pregunta` VALUES ('107', 'La circulación intracelular se realiza a través de:', '14', '2', '0', '2.00', '3', null, '1', '1', '2020-11-16 12:47:37', '2020-11-16 12:47:37');
INSERT INTO `pregunta` VALUES ('108', 'La digestión tanto intracelular como extracelular es realizada por:', '14', '2', '0', '2.00', '4', null, '1', '1', '2020-11-16 12:56:26', '2020-11-16 12:56:26');
INSERT INTO `pregunta` VALUES ('109', '¿Cuál de las siguientes estructuras no es propia de la célula animal?', '14', '2', '0', '2.00', '5', null, '1', '1', '2020-11-16 13:00:06', '2020-11-16 13:26:19');
INSERT INTO `pregunta` VALUES ('110', 'En la pared celular de los vegetales  existe:', '14', '2', '0', '2.00', '6', null, '1', '1', '2020-11-16 13:00:28', '2020-11-16 13:00:28');
INSERT INTO `pregunta` VALUES ('111', 'La principal función de la membrana plasmática es:', '14', '2', '0', '2.00', '7', null, '1', '1', '2020-11-16 13:00:44', '2020-11-16 13:00:44');
INSERT INTO `pregunta` VALUES ('112', 'Son organoides celulares sin membrana:', '14', '2', '0', '2.00', '8', null, '1', '1', '2020-11-16 13:00:56', '2020-11-16 13:00:56');
INSERT INTO `pregunta` VALUES ('113', 'El ADN puede estar contenido en las siguientes estructuras celulares, excepto:', '14', '2', '0', '2.00', '9', null, '1', '1', '2020-11-16 13:01:14', '2020-11-16 13:01:14');
INSERT INTO `pregunta` VALUES ('114', 'Los organismos del Reino Monera y Reino Plantae tienen en común:', '14', '2', '0', '2.00', '10', null, '1', '1', '2020-11-16 13:01:30', '2020-11-16 13:01:30');
INSERT INTO `pregunta` VALUES ('115', '¿Qué es la replicación del ADN?', '15', '2', '0', '2.00', '1', null, '1', '1', '2020-11-16 16:52:14', '2020-11-16 16:52:14');
INSERT INTO `pregunta` VALUES ('116', 'La base complementaria de la Citosina (C) es', '15', '2', '0', '2.00', '2', null, '1', '1', '2020-11-16 16:52:39', '2020-11-16 16:52:39');
INSERT INTO `pregunta` VALUES ('117', '¿Qué es el proceso de TRANSCRIPCIÓN?', '15', '2', '0', '2.00', '3', null, '1', '1', '2020-11-16 16:52:55', '2020-11-16 16:52:55');
INSERT INTO `pregunta` VALUES ('118', 'Un nucleótido es:', '15', '2', '0', '2.00', '4', null, '1', '1', '2020-11-16 16:53:11', '2020-11-16 16:53:11');
INSERT INTO `pregunta` VALUES ('119', 'De las siguientes bases nitrogenadas, ¿cuál no forma parte del ADN?', '15', '2', '0', '2.00', '5', null, '1', '1', '2020-11-16 16:53:32', '2020-11-16 16:53:32');
INSERT INTO `pregunta` VALUES ('120', '¿Cuáles son las bases nitrogenadas qué forman parte de la molécula de ADN?', '15', '2', '0', '2.00', '6', null, '1', '1', '2020-11-16 16:53:48', '2020-11-16 16:53:48');
INSERT INTO `pregunta` VALUES ('121', 'Los nucleótidos tienen una estructura similar, están formados por la unión de tres moléculas que son: una molécula de ácido fosfórico, una pentosa (azúcar) y una base', '15', '2', '0', '2.00', '7', null, '1', '1', '2020-11-16 16:53:59', '2020-11-16 17:12:54');
INSERT INTO `pregunta` VALUES ('122', 'La base complementaria de la Adenina (A) es...', '15', '2', '0', '2.00', '8', null, '1', '1', '2020-11-16 16:54:18', '2020-11-16 16:54:18');
INSERT INTO `pregunta` VALUES ('123', 'Los componentes de los nucleótidos son : (Indicar la respuesta que da el orden correcto)', '15', '2', '0', '2.00', '9', null, '1', '1', '2020-11-16 16:54:36', '2020-11-16 16:54:36');
INSERT INTO `pregunta` VALUES ('124', 'En el ADN bicatenario se cumple la siguiente norma:', '15', '2', '0', '2.00', '10', null, '1', '1', '2020-11-16 16:54:52', '2020-11-16 16:54:52');
INSERT INTO `pregunta` VALUES ('127', '¿Que es Macroeconomia?', '13', '1', '0', '2.00', '1', null, '1', '1', '2020-11-16 22:34:05', '2020-11-16 22:34:05');
INSERT INTO `pregunta` VALUES ('128', 'Los objetos tiene diferentes cualidades como:', '17', '3', '0', '4.00', '1', null, '1', '1', '2020-12-06 00:45:06', '2020-12-06 00:45:21');
INSERT INTO `pregunta` VALUES ('129', '¿En qué estado la forma permanece constante?', '17', '2', '0', '4.00', '2', null, '1', '1', '2020-12-06 00:46:54', '2020-12-06 00:46:54');
INSERT INTO `pregunta` VALUES ('130', 'Una característica interna de los sólidos es:', '17', '2', '0', '4.00', '3', null, '1', '1', '2020-12-06 00:50:05', '2020-12-06 00:50:05');
INSERT INTO `pregunta` VALUES ('131', 'Una característica interna de los líquidos es:', '18', '2', '0', '4.00', '1', null, '1', '1', '2020-12-06 00:52:51', '2020-12-06 00:52:51');
INSERT INTO `pregunta` VALUES ('132', 'Si una sustancia pasó del estado sólido a líquido, a este proceso se le llama:', '18', '2', '0', '4.00', '2', null, '1', '1', '2020-12-06 01:03:24', '2020-12-06 01:03:24');
INSERT INTO `pregunta` VALUES ('133', '¿qué es la materia?', '18', '2', '0', '4.00', '3', null, '1', '1', '2020-12-06 01:04:53', '2020-12-06 01:04:53');
INSERT INTO `pregunta` VALUES ('134', '¿Quien es el especialista en el estudio de los alimentos?', '19', '2', '0', '4.00', '1', null, '1', '1', '2020-12-06 01:17:11', '2020-12-06 01:17:11');
INSERT INTO `pregunta` VALUES ('135', '¿De que están compuestos todos los alimentos?', '19', '2', '0', '4.00', '2', null, '1', '1', '2020-12-06 01:20:13', '2020-12-06 01:20:13');
INSERT INTO `pregunta` VALUES ('136', '¿La vitamina C se encuentra en?', '19', '2', '0', '4.00', '3', null, '1', '1', '2020-12-06 01:23:07', '2020-12-06 01:23:07');
INSERT INTO `pregunta` VALUES ('137', '¿Según su función los alimentos constructores son ricos en?', '20', '2', '0', '4.00', '1', null, '1', '1', '2020-12-06 01:26:11', '2020-12-06 01:26:11');
INSERT INTO `pregunta` VALUES ('138', '¿La leche y el yogur según su función pertenecen a?', '20', '2', '0', '4.00', '2', null, '1', '1', '2020-12-06 01:28:59', '2020-12-06 01:28:59');
INSERT INTO `pregunta` VALUES ('139', 'Si Jesús se come un chocolate, ¿que tipo de alimento es según su función?', '20', '2', '0', '4.00', '3', null, '1', '1', '2020-12-06 01:30:02', '2020-12-06 01:31:09');
INSERT INTO `pregunta` VALUES ('140', 'Los cambios que van experimentando las personas a lo largo de sus vidas se suelen describir en etapas. ¿Qué etapa representa el dibujo?', '21', '2', '0', '4.00', '1', null, '1', '1', '2020-12-06 01:34:21', '2020-12-06 01:34:21');
INSERT INTO `pregunta` VALUES ('141', 'Es el periodo de transición entre la niñez y la adultez.', '21', '2', '0', '4.00', '2', null, '1', '1', '2020-12-06 01:38:13', '2020-12-06 01:38:13');
INSERT INTO `pregunta` VALUES ('142', 'Fase de la adolecencia que va entre los 11 y 15 años.', '21', '2', '0', '4.00', '3', null, '1', '1', '2020-12-06 01:39:05', '2020-12-06 01:39:05');
INSERT INTO `pregunta` VALUES ('143', 'Aparecen vellos públicos.', '22', '2', '0', '4.00', '1', null, '1', '1', '2020-12-06 01:40:41', '2020-12-06 01:40:41');
INSERT INTO `pregunta` VALUES ('144', '¿Cómo es la personalidad de un adolescente a los 14 años?', '22', '2', '0', '4.00', '2', null, '1', '1', '2020-12-06 01:41:37', '2020-12-06 01:41:37');
INSERT INTO `pregunta` VALUES ('145', 'Cuando comienza a relacionarse con los demás. ¿ A que aspecto se refiere ?', '22', '2', '0', '4.00', '3', null, '1', '1', '2020-12-06 01:42:34', '2020-12-06 01:42:34');
INSERT INTO `pregunta` VALUES ('146', 'El hidrógeno es', '23', '2', '0', '4.00', '1', null, '1', '1', '2020-12-06 02:04:09', '2020-12-06 02:04:31');
INSERT INTO `pregunta` VALUES ('147', 'La sal común es', '23', '2', '0', '4.00', '2', null, '1', '1', '2020-12-06 02:05:40', '2020-12-06 02:05:40');
INSERT INTO `pregunta` VALUES ('148', 'El oxígeno atmosférico se considera', '23', '2', '0', '4.00', '3', null, '1', '1', '2020-12-06 02:06:55', '2020-12-06 02:06:55');
INSERT INTO `pregunta` VALUES ('149', 'La representación aquí mostrada es de', '24', '2', '0', '4.00', '1', null, '1', '1', '2020-12-06 02:16:51', '2020-12-06 02:16:51');
INSERT INTO `pregunta` VALUES ('150', 'Una mezcla homogénea es aquella', '24', '2', '0', '4.00', '2', null, '1', '1', '2020-12-06 02:17:41', '2020-12-06 02:17:41');
INSERT INTO `pregunta` VALUES ('151', 'Una aleación es', '24', '2', '0', '4.00', '3', null, '1', '1', '2020-12-06 02:18:50', '2020-12-06 02:18:50');
INSERT INTO `pregunta` VALUES ('152', 'Las fuentes de energía que nos ofrece la naturaleza son', '25', '2', '0', '4.00', '1', null, '1', '1', '2020-12-06 02:39:12', '2020-12-06 02:39:12');
INSERT INTO `pregunta` VALUES ('153', 'Las fuentes de energía no renovables son las qué', '25', '2', '0', '4.00', '2', null, '1', '1', '2020-12-06 02:40:17', '2020-12-06 02:40:17');
INSERT INTO `pregunta` VALUES ('154', 'Las fuentes de energía renovables son las qué', '25', '2', '0', '4.00', '3', null, '1', '1', '2020-12-06 02:41:22', '2020-12-06 02:41:22');
INSERT INTO `pregunta` VALUES ('155', 'Algunas fuentes de energías renovables son', '26', '2', '0', '4.00', '1', null, '1', '1', '2020-12-06 02:46:55', '2020-12-06 02:46:55');
INSERT INTO `pregunta` VALUES ('156', 'Energía que se emite a través de placas solares', '26', '2', '0', '4.00', '2', null, '1', '1', '2020-12-06 02:54:19', '2020-12-06 02:54:19');
INSERT INTO `pregunta` VALUES ('157', 'Los recursos de los cuales se puede extraer energía se llaman', '26', '2', '0', '4.00', '3', null, '1', '1', '2020-12-06 02:55:34', '2020-12-06 02:55:34');
INSERT INTO `pregunta` VALUES ('158', 'Un elemento orgánico es', '27', '2', '0', '4.00', '1', null, '1', '1', '2020-12-06 03:03:27', '2020-12-06 03:03:27');
INSERT INTO `pregunta` VALUES ('159', 'Las catástrofes naturales', '27', '2', '0', '4.00', '2', null, '1', '1', '2020-12-06 03:04:35', '2020-12-06 03:04:35');
INSERT INTO `pregunta` VALUES ('160', 'Es uno de los principales problemas ambientales que afecta a Colombia.', '27', '2', '0', '4.00', '3', null, '1', '1', '2020-12-06 03:05:44', '2020-12-06 03:05:44');
INSERT INTO `pregunta` VALUES ('161', 'los seres vivos que afectan a otros seres vivos en un ecosistema', '28', '2', '0', '4.00', '1', null, '1', '1', '2020-12-06 03:08:39', '2020-12-06 03:08:39');
INSERT INTO `pregunta` VALUES ('162', 'los componentes que determinan el ambiente. Por ejemplo el agua, la temperatura, la luz(el sol), la humedad, el oxígeno y los nutrientes.', '28', '2', '0', '4.00', '2', null, '1', '1', '2020-12-06 03:09:46', '2020-12-06 03:09:46');
INSERT INTO `pregunta` VALUES ('163', 'El prefijo bio significa', '28', '2', '0', '4.00', '3', null, '1', '1', '2020-12-06 03:11:37', '2020-12-06 03:11:37');
INSERT INTO `pregunta` VALUES ('164', 'La unidad más pequeña de la materia se\ndenomina:', '29', '2', '0', '4.00', '1', null, '1', '1', '2020-12-06 03:19:28', '2020-12-06 03:19:28');
INSERT INTO `pregunta` VALUES ('165', 'Los elementos se representan por letras, la primera en mayúscula y la segunda y y tercera en minúscula esta definición pertenece a:', '29', '2', '0', '4.00', '2', null, '1', '1', '2020-12-06 03:20:29', '2020-12-06 03:20:29');
INSERT INTO `pregunta` VALUES ('166', 'La parte central del átomo se llama:', '29', '2', '0', '4.00', '3', null, '1', '1', '2020-12-06 03:21:46', '2020-12-06 03:21:46');
INSERT INTO `pregunta` VALUES ('167', 'Se expresa como la masa en gramos de 1 mol de entidades elementales (átomos, iones o moléculas) de una sustancia.', '30', '2', '0', '4.00', '1', null, '1', '1', '2020-12-06 03:23:19', '2020-12-06 03:23:19');
INSERT INTO `pregunta` VALUES ('168', 'Cuando escuchas la palabra mol, ¿con cuál de los siguientes ejemplos lo relacionas?', '30', '2', '0', '4.00', '2', null, '1', '1', '2020-12-06 03:24:15', '2020-12-06 03:24:15');
INSERT INTO `pregunta` VALUES ('169', 'Mezcla homogénea de dos o más sustancias:', '30', '2', '0', '4.00', '3', null, '1', '1', '2020-12-06 03:27:06', '2020-12-06 03:27:06');
INSERT INTO `pregunta` VALUES ('170', 'Las plantas que poseen flores se originan por reproducción sexual. En este proceso siempre intervienen dos componentes: uno masculino y otro femenino, usted diría que este proceso ocurre exactamente cuándo:', '31', '2', '0', '4.00', '1', null, '1', '1', '2020-12-06 03:46:52', '2020-12-06 03:46:52');
INSERT INTO `pregunta` VALUES ('171', 'La diferencia más relevante entre el tipo de reproducción de aves y mamíferos es que:', '31', '2', '0', '4.00', '2', null, '1', '1', '2020-12-06 03:48:02', '2020-12-06 03:48:02');
INSERT INTO `pregunta` VALUES ('172', 'En la reproducción de los musgos las esporas caen al suelo y forman los gametofitos en cuyos ápices se forman los gametos masculinos y los gametos femeninos. Estos gametos son:', '31', '2', '0', '4.00', '3', null, '1', '1', '2020-12-06 03:49:12', '2020-12-06 03:49:12');
INSERT INTO `pregunta` VALUES ('173', '¿Qué es la reproducción?', '32', '2', '0', '4.00', '1', null, '1', '1', '2020-12-06 03:51:53', '2020-12-06 03:51:53');
INSERT INTO `pregunta` VALUES ('174', '¿Cuántos tipos de reproducción existen y cuáles son?', '32', '2', '0', '4.00', '2', null, '1', '1', '2020-12-06 03:54:39', '2020-12-06 03:54:39');
INSERT INTO `pregunta` VALUES ('175', '¿cuál es la célula sexual masculina?', '32', '2', '0', '4.00', '3', null, '1', '1', '2020-12-06 03:55:48', '2020-12-06 03:55:48');
INSERT INTO `pregunta` VALUES ('176', 'Bicarbonato de sodio es una sustancia:', '33', '2', '0', '4.00', '1', null, '1', '1', '2020-12-06 04:02:43', '2020-12-06 04:02:43');
INSERT INTO `pregunta` VALUES ('177', 'Se define como Ph', '33', '2', '0', '4.00', '2', null, '1', '1', '2020-12-06 04:03:36', '2020-12-06 04:03:36');
INSERT INTO `pregunta` VALUES ('178', 'significado de pH', '33', '2', '0', '4.00', '3', null, '1', '1', '2020-12-06 04:04:41', '2020-12-06 04:04:41');
INSERT INTO `pregunta` VALUES ('179', 'Un pH igual a 7 es:', '34', '2', '0', '4.00', '1', null, '1', '1', '2020-12-06 04:08:17', '2020-12-06 04:08:17');
INSERT INTO `pregunta` VALUES ('180', 'la capacidad reguladora es:', '34', '2', '0', '4.00', '2', null, '1', '1', '2020-12-06 04:09:29', '2020-12-06 04:09:29');
INSERT INTO `pregunta` VALUES ('181', 'Una medida de la acidez o basicidad de una solución es:', '34', '2', '0', '4.00', '3', null, '1', '1', '2020-12-06 04:10:37', '2020-12-06 04:10:37');
INSERT INTO `pregunta` VALUES ('182', 'En el mundo no hay otra persona como yo', '37', '2', '0', '4.00', '1', null, '1', '1', '2020-12-06 05:05:30', '2020-12-06 05:05:30');
INSERT INTO `pregunta` VALUES ('183', 'Soy importante porque', '37', '2', '0', '4.00', '2', null, '1', '1', '2020-12-06 05:06:16', '2020-12-06 05:06:16');
INSERT INTO `pregunta` VALUES ('184', 'Me gusta llamar la atenciòn.', '37', '2', '0', '4.00', '3', null, '1', '1', '2020-12-06 05:07:04', '2020-12-06 05:07:04');
INSERT INTO `pregunta` VALUES ('185', 'Las organizaciones sociales son:', '38', '2', '0', '4.00', '1', null, '1', '1', '2020-12-06 05:12:02', '2020-12-06 05:12:02');
INSERT INTO `pregunta` VALUES ('186', '¿Cuales son las instituciones sociales?', '38', '2', '0', '4.00', '2', null, '1', '1', '2020-12-06 05:13:10', '2020-12-06 05:13:10');
INSERT INTO `pregunta` VALUES ('187', 'Un grupo grande de personas juntas en un lugar', '38', '2', '0', '4.00', '3', null, '1', '1', '2020-12-06 05:14:08', '2020-12-06 05:14:08');

-- ----------------------------
-- Table structure for prueba
-- ----------------------------
DROP TABLE IF EXISTS `prueba`;
CREATE TABLE `prueba` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_prueba` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_grado` int(11) NOT NULL,
  `id_materia` int(11) NOT NULL,
  `id_tema` int(11) NOT NULL,
  `bo_ver_resultado` tinyint(1) NOT NULL DEFAULT 0,
  `nu_minutos` int(11) DEFAULT NULL,
  `nu_peso` decimal(11,2) DEFAULT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of prueba
-- ----------------------------
INSERT INTO `prueba` VALUES ('1', 'Prueba de Matematicas 1 Grado Seccion 1', '4', '14', '4', '1', '5', '20.00', null, '2', '1', '2020-08-03 13:18:52', '2020-08-15 19:50:40');
INSERT INTO `prueba` VALUES ('14', 'La Célula', '8', '7', '70', '1', '5', '20.00', null, '2', '1', '2020-11-16 12:30:33', '2020-11-16 22:19:43');
INSERT INTO `prueba` VALUES ('15', 'El ADN', '8', '7', '70', '1', '5', '20.00', null, '2', '1', '2020-11-16 16:51:44', '2020-11-16 22:20:37');
INSERT INTO `prueba` VALUES ('17', 'Los solidos', '4', '7', '57', '1', '10', '12.00', null, '1', '1', null, '2020-12-06 00:50:05');
INSERT INTO `prueba` VALUES ('18', 'Los liquidos', '4', '7', '57', '1', '10', '12.00', null, '1', '1', null, '2020-12-06 01:04:53');
INSERT INTO `prueba` VALUES ('19', 'Hablemos de los alimentos', '5', '7', '58', '1', '10', '12.00', null, '1', '1', null, '2020-12-06 01:23:07');
INSERT INTO `prueba` VALUES ('20', 'Los alimentos según su origen', '5', '7', '58', '1', '10', '12.00', null, '1', '1', null, '2020-12-06 01:31:09');
INSERT INTO `prueba` VALUES ('21', 'Cambios en el ser humano', '6', '7', '60', '1', '10', '12.00', null, '1', '1', null, '2020-12-06 01:39:05');
INSERT INTO `prueba` VALUES ('22', 'Los cambios en el hombre', '6', '7', '60', '1', '10', '12.00', null, '1', '1', null, '2020-12-06 01:42:35');
INSERT INTO `prueba` VALUES ('23', '¿Qué es un elemento y qué es un compuesto?', '7', '7', '62', '1', '10', '12.00', null, '1', '1', null, '2020-12-06 02:06:55');
INSERT INTO `prueba` VALUES ('24', '¿Qué es una mezcla?', '7', '7', '62', '1', '10', '12.00', null, '1', '1', null, '2020-12-06 02:18:50');
INSERT INTO `prueba` VALUES ('25', '¿De dónde proviene la energía?', '8', '7', '64', '1', '10', '12.00', null, '1', '1', null, '2020-12-06 02:41:22');
INSERT INTO `prueba` VALUES ('26', '¿Podemos crear energía?', '8', '7', '64', '1', '10', '12.00', null, '1', '1', null, '2020-12-06 02:55:34');
INSERT INTO `prueba` VALUES ('27', 'El medio ambiente', '9', '7', '74', '1', '10', '12.00', null, '1', '1', null, '2020-12-06 03:05:45');
INSERT INTO `prueba` VALUES ('28', 'El ecosistema', '9', '7', '74', '1', '10', '12.00', null, '1', '1', null, '2020-12-06 03:11:37');
INSERT INTO `prueba` VALUES ('29', 'El Átomo', '10', '7', '68', '1', '10', '12.00', null, '1', '1', null, '2020-12-06 03:21:46');
INSERT INTO `prueba` VALUES ('30', 'Masa atómica y masa molecular', '10', '7', '68', '1', '10', '12.00', null, '1', '1', null, '2020-12-06 03:27:06');
INSERT INTO `prueba` VALUES ('31', 'Reproducción celular', '11', '7', '70', '1', '10', '12.00', null, '1', '1', null, '2020-12-06 03:49:12');
INSERT INTO `prueba` VALUES ('32', 'Reproducción asexual y sexual', '11', '7', '70', '1', '10', '12.00', null, '1', '1', null, '2020-12-06 03:55:48');
INSERT INTO `prueba` VALUES ('33', 'Regulación del Ph', '12', '7', '72', '1', '10', '12.00', null, '1', '1', null, '2020-12-06 04:04:41');
INSERT INTO `prueba` VALUES ('34', 'Sustancias amortiguadoras', '12', '7', '72', '1', '10', '12.00', null, '1', '1', null, '2020-12-06 04:10:37');
INSERT INTO `prueba` VALUES ('37', 'Este soy yo', '4', '19', '2', '1', '5', '12.00', null, '1', '1', null, '2020-12-06 05:07:04');
INSERT INTO `prueba` VALUES ('38', 'Organizaciones sociales', '4', '19', '3', '1', '5', '12.00', null, '1', '1', null, '2020-12-06 05:14:08');
INSERT INTO `prueba` VALUES ('39', 'El paisaje geográfico', '5', '19', '41', '1', '5', '12.00', null, '1', '1', null, null);
INSERT INTO `prueba` VALUES ('40', 'El clima y el paisaje', '5', '19', '41', '1', '5', '12.00', null, '1', '1', null, null);
INSERT INTO `prueba` VALUES ('41', 'Las expresiones de la cultura', '6', '19', '43', '1', '5', '12.00', null, '1', '1', null, null);
INSERT INTO `prueba` VALUES ('42', 'Mitos, costumbres y tradiciones', '6', '19', '43', '1', '5', '12.00', null, '1', '1', null, null);
INSERT INTO `prueba` VALUES ('43', 'Las regiones naturales de Colombia', '7', '19', '45', '1', '5', '12.00', null, '1', '1', null, null);
INSERT INTO `prueba` VALUES ('44', 'Las regiones naturales del mundo', '7', '19', '45', '1', '5', '12.00', null, '1', '1', null, null);
INSERT INTO `prueba` VALUES ('45', 'El trabajo', '8', '19', '47', '1', '5', '12.00', null, '1', '1', null, null);
INSERT INTO `prueba` VALUES ('46', 'El dinero y el intercambio económico', '8', '19', '47', '1', '5', '12.00', null, '1', '1', null, null);
INSERT INTO `prueba` VALUES ('47', '', '0', '0', '0', '0', null, null, null, '0', '0', null, null);
INSERT INTO `prueba` VALUES ('48', '', '0', '0', '0', '0', null, null, null, '0', '0', null, null);

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
  `nb_rasgo` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tx_icono` varchar(35) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `tx_color` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of rasgo
-- ----------------------------
INSERT INTO `rasgo` VALUES ('1', 'puntualidad', 'mdi-account-clock', 'blue', null, '1', '1', '2020-11-14 22:51:51', null);
INSERT INTO `rasgo` VALUES ('2', 'responsabilidad', 'mdi-handshake', 'purple', null, '1', '1', '2020-11-14 22:52:24', null);
INSERT INTO `rasgo` VALUES ('3', 'asistencia', 'mdi-account-check', 'green', null, '1', '1', '2020-11-14 22:52:20', null);
INSERT INTO `rasgo` VALUES ('4', 'participacion', 'mdi-hand', 'orange', '', '1', '1', '2020-11-14 22:52:38', null);

-- ----------------------------
-- Table structure for recurso
-- ----------------------------
DROP TABLE IF EXISTS `recurso`;
CREATE TABLE `recurso` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_tipo_recurso` int(11) NOT NULL,
  `id_grado` int(11) NOT NULL,
  `id_tema` int(11) NOT NULL,
  `tx_observaciones` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of recurso
-- ----------------------------
INSERT INTO `recurso` VALUES ('20', '3', '4', '57', null, '1', '1', '2020-12-06 00:34:03', '2020-12-06 00:34:03');
INSERT INTO `recurso` VALUES ('21', '3', '4', '57', null, '1', '1', '2020-12-06 00:34:34', '2020-12-06 00:34:34');
INSERT INTO `recurso` VALUES ('22', '3', '5', '58', null, '1', '1', '2020-12-06 01:13:54', '2020-12-06 01:13:54');
INSERT INTO `recurso` VALUES ('23', '3', '5', '58', null, '1', '1', '2020-12-06 01:14:11', '2020-12-06 01:14:11');
INSERT INTO `recurso` VALUES ('24', '3', '6', '60', null, '1', '1', '2020-12-06 01:47:19', '2020-12-06 01:47:19');
INSERT INTO `recurso` VALUES ('25', '3', '6', '60', null, '1', '1', '2020-12-06 01:47:57', '2020-12-06 01:47:57');
INSERT INTO `recurso` VALUES ('26', '3', '7', '62', null, '1', '1', '2020-12-06 01:49:35', '2020-12-06 01:49:35');
INSERT INTO `recurso` VALUES ('27', '3', '7', '62', null, '1', '1', '2020-12-06 01:49:56', '2020-12-06 01:49:56');
INSERT INTO `recurso` VALUES ('28', '3', '8', '64', null, '1', '1', '2020-12-06 02:21:54', '2020-12-06 02:21:54');
INSERT INTO `recurso` VALUES ('29', '3', '8', '64', null, '1', '1', '2020-12-06 02:22:14', '2020-12-06 02:22:14');
INSERT INTO `recurso` VALUES ('30', '1', '11', '70', null, '1', '1', '2020-12-06 04:16:55', '2020-12-06 04:16:55');
INSERT INTO `recurso` VALUES ('31', '3', '4', '2', null, '1', '1', '2020-12-06 05:00:38', '2020-12-06 05:00:38');
INSERT INTO `recurso` VALUES ('32', '3', '4', '3', null, '1', '1', '2020-12-06 05:09:21', '2020-12-06 05:09:21');
INSERT INTO `recurso` VALUES ('33', '3', '5', '41', null, '1', '1', '2020-12-06 05:16:07', '2020-12-06 05:16:07');
INSERT INTO `recurso` VALUES ('34', '3', '5', '41', null, '1', '1', '2020-12-06 05:16:45', '2020-12-06 05:16:45');

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
) ENGINE=InnoDB AUTO_INCREMENT=491 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
INSERT INTO `respuesta` VALUES ('186', 'Janssen', '105', '0', null, null, '1', '1', '2020-11-16 12:32:22', '2020-11-16 12:32:33');
INSERT INTO `respuesta` VALUES ('187', 'Hooke', '105', '1', null, null, '1', '1', '2020-11-16 12:32:33', '2020-11-16 12:32:33');
INSERT INTO `respuesta` VALUES ('188', 'Leewenhoek', '105', '0', null, null, '1', '1', '2020-11-16 12:32:44', '2020-11-16 12:32:44');
INSERT INTO `respuesta` VALUES ('189', 'Virchow', '105', '0', null, null, '1', '1', '2020-11-16 12:32:52', '2020-11-16 12:32:52');
INSERT INTO `respuesta` VALUES ('190', 'Plasmalema', '106', '0', null, null, '1', '1', '2020-11-16 12:38:32', '2020-11-16 12:46:46');
INSERT INTO `respuesta` VALUES ('191', 'Citoplasma', '106', '1', null, null, '1', '1', '2020-11-16 12:45:54', '2020-11-16 12:46:46');
INSERT INTO `respuesta` VALUES ('192', 'Carioteca', '106', '0', null, null, '1', '1', '2020-11-16 12:46:01', '2020-11-16 12:46:46');
INSERT INTO `respuesta` VALUES ('193', 'Ribosomas', '106', '0', null, null, '1', '1', '2020-11-16 12:46:08', '2020-11-16 12:46:46');
INSERT INTO `respuesta` VALUES ('194', 'El retículo endoplasmático', '107', '1', null, null, '1', '1', '2020-11-16 12:50:29', '2020-11-16 12:51:12');
INSERT INTO `respuesta` VALUES ('195', 'Los ribosomas', '107', '0', null, null, '1', '1', '2020-11-16 12:50:40', '2020-11-16 12:51:12');
INSERT INTO `respuesta` VALUES ('196', 'Los centrosomas', '107', '0', null, null, '1', '1', '2020-11-16 12:50:49', '2020-11-16 12:51:12');
INSERT INTO `respuesta` VALUES ('197', 'Los dictiosomas', '107', '0', null, null, '1', '1', '2020-11-16 12:50:58', '2020-11-16 12:51:12');
INSERT INTO `respuesta` VALUES ('198', 'R. endoplasmático  rugoso', '108', '0', null, null, '1', '1', '2020-11-16 12:58:25', '2020-11-16 12:59:01');
INSERT INTO `respuesta` VALUES ('199', 'R. endoplasmático liso', '108', '0', null, null, '1', '1', '2020-11-16 12:58:35', '2020-11-16 12:59:01');
INSERT INTO `respuesta` VALUES ('200', 'Peroxisoma', '108', '0', null, null, '1', '1', '2020-11-16 12:58:42', '2020-11-16 12:59:01');
INSERT INTO `respuesta` VALUES ('201', 'Lisosomas', '108', '1', null, null, '1', '1', '2020-11-16 12:58:51', '2020-11-16 12:59:01');
INSERT INTO `respuesta` VALUES ('202', 'Ribosomas', '109', '0', null, null, '1', '1', '2020-11-16 13:02:30', '2020-11-16 13:15:48');
INSERT INTO `respuesta` VALUES ('203', 'Centrosoma', '109', '0', null, null, '1', '1', '2020-11-16 13:02:38', '2020-11-16 13:15:48');
INSERT INTO `respuesta` VALUES ('204', 'Centriolos', '109', '0', null, null, '1', '1', '2020-11-16 13:02:45', '2020-11-16 13:15:48');
INSERT INTO `respuesta` VALUES ('205', 'Glioxisoma', '109', '1', null, null, '1', '1', '2020-11-16 13:02:52', '2020-11-16 13:15:48');
INSERT INTO `respuesta` VALUES ('206', 'Quitina', '110', '0', null, null, '1', '1', '2020-11-16 13:03:08', '2020-11-16 13:16:03');
INSERT INTO `respuesta` VALUES ('207', 'Queratina', '110', '0', null, null, '1', '1', '2020-11-16 13:03:15', '2020-11-16 13:16:03');
INSERT INTO `respuesta` VALUES ('208', 'Celulosa', '110', '1', null, null, '1', '1', '2020-11-16 13:03:21', '2020-11-16 13:16:03');
INSERT INTO `respuesta` VALUES ('209', 'Peptidoglucano', '110', '0', null, null, '1', '1', '2020-11-16 13:03:28', '2020-11-16 13:16:03');
INSERT INTO `respuesta` VALUES ('210', 'Protección', '111', '0', null, null, '1', '1', '2020-11-16 13:03:44', '2020-11-16 13:16:37');
INSERT INTO `respuesta` VALUES ('211', 'Transporte de sustancias', '111', '1', null, null, '1', '1', '2020-11-16 13:03:57', '2020-11-16 13:16:37');
INSERT INTO `respuesta` VALUES ('212', 'Compartamentalización', '111', '0', null, null, '1', '1', '2020-11-16 13:04:23', '2020-11-16 13:16:37');
INSERT INTO `respuesta` VALUES ('213', 'Da forma celular', '111', '0', null, null, '1', '1', '2020-11-16 13:04:31', '2020-11-16 13:16:37');
INSERT INTO `respuesta` VALUES ('214', 'Cromosomas, carioplasma, núcleo', '112', '0', null, null, '1', '1', '2020-11-16 13:05:10', '2020-11-16 13:16:59');
INSERT INTO `respuesta` VALUES ('215', 'Golgisoma, lisosoma, gránulos de cromatina', '112', '0', null, null, '1', '1', '2020-11-16 13:05:21', '2020-11-16 13:16:59');
INSERT INTO `respuesta` VALUES ('216', 'Centro celular, ribosoma, citoesqueleto', '112', '1', null, null, '1', '1', '2020-11-16 13:05:30', '2020-11-16 13:16:59');
INSERT INTO `respuesta` VALUES ('217', 'Ribosoma, nucleolo, vesículas de secreción', '112', '0', null, null, '1', '1', '2020-11-16 13:05:37', '2020-11-16 13:16:59');
INSERT INTO `respuesta` VALUES ('218', 'Cromatina', '113', '0', null, null, '1', '1', '2020-11-16 13:05:51', '2020-11-16 13:17:16');
INSERT INTO `respuesta` VALUES ('219', 'Mitocrondria', '113', '0', null, null, '1', '1', '2020-11-16 13:05:59', '2020-11-16 13:17:16');
INSERT INTO `respuesta` VALUES ('220', 'Cromosomas', '113', '0', null, null, '1', '1', '2020-11-16 13:06:05', '2020-11-16 13:17:16');
INSERT INTO `respuesta` VALUES ('221', 'Vacuola', '113', '1', null, null, '1', '1', '2020-11-16 13:06:18', '2020-11-16 13:17:17');
INSERT INTO `respuesta` VALUES ('222', 'Núcleo', '114', '0', null, null, '1', '1', '2020-11-16 13:06:43', '2020-11-16 13:17:32');
INSERT INTO `respuesta` VALUES ('223', 'Membrana celular', '114', '0', null, null, '1', '1', '2020-11-16 13:06:49', '2020-11-16 13:17:32');
INSERT INTO `respuesta` VALUES ('224', 'Cloroplastos', '114', '0', null, null, '1', '1', '2020-11-16 13:06:56', '2020-11-16 13:17:32');
INSERT INTO `respuesta` VALUES ('225', 'Pared celular', '114', '1', null, null, '1', '1', '2020-11-16 13:07:07', '2020-11-16 13:17:32');
INSERT INTO `respuesta` VALUES ('226', 'El proceso de síntesis de proteínas', '115', '0', null, null, '1', '1', '2020-11-16 16:58:25', '2020-11-16 17:23:13');
INSERT INTO `respuesta` VALUES ('227', 'Es el proceso de Transcripción o formación una copia de ARN', '115', '0', null, null, '1', '1', '2020-11-16 16:58:33', '2020-11-16 17:23:13');
INSERT INTO `respuesta` VALUES ('228', 'El proceso por el cual el ADN se duplica', '115', '1', null, null, '1', '1', '2020-11-16 16:58:45', '2020-11-16 17:23:13');
INSERT INTO `respuesta` VALUES ('229', 'El proceso de síntesis de ARN', '115', '0', null, null, '1', '1', '2020-11-16 16:59:01', '2020-11-16 17:23:13');
INSERT INTO `respuesta` VALUES ('230', 'Guanina (G)', '116', '1', null, null, '1', '1', '2020-11-16 17:00:38', '2020-11-16 17:23:22');
INSERT INTO `respuesta` VALUES ('231', 'Timina (T)', '116', '0', null, null, '1', '1', '2020-11-16 17:00:46', '2020-11-16 17:23:22');
INSERT INTO `respuesta` VALUES ('232', 'Uracilo (U)', '116', '0', null, null, '1', '1', '2020-11-16 17:00:55', '2020-11-16 17:23:22');
INSERT INTO `respuesta` VALUES ('233', 'Adenina (A)', '116', '0', null, null, '1', '1', '2020-11-16 17:01:02', '2020-11-16 17:23:22');
INSERT INTO `respuesta` VALUES ('234', 'Es el proceso de duplicación del ADN', '117', '0', null, null, '1', '1', '2020-11-16 17:01:17', '2020-11-16 17:23:37');
INSERT INTO `respuesta` VALUES ('235', 'Es el proceso de síntesis de ARN', '117', '1', null, null, '1', '1', '2020-11-16 17:01:24', '2020-11-16 17:23:37');
INSERT INTO `respuesta` VALUES ('236', 'Es el proceso de construcción de proteínas', '117', '0', null, null, '1', '1', '2020-11-16 17:01:31', '2020-11-16 17:23:37');
INSERT INTO `respuesta` VALUES ('237', 'Es el proceso de síntesis de una molécula de ARN transferente o de transferencia', '117', '0', null, null, '1', '1', '2020-11-16 17:01:41', '2020-11-16 17:23:37');
INSERT INTO `respuesta` VALUES ('238', 'Cada una de las bases nitrogenadas de los ácidos nucléicos', '118', '0', null, null, '1', '1', '2020-11-16 17:01:56', '2020-11-16 17:23:47');
INSERT INTO `respuesta` VALUES ('239', 'El monómero que forma los ácidos nucléicos', '118', '1', null, null, '1', '1', '2020-11-16 17:02:04', '2020-11-16 17:23:47');
INSERT INTO `respuesta` VALUES ('240', 'El monómero que forma las proteínas', '118', '0', null, null, '1', '1', '2020-11-16 17:02:13', '2020-11-16 17:23:47');
INSERT INTO `respuesta` VALUES ('241', 'La unión del monosacárido y la base nitrogenada', '118', '0', null, null, '1', '1', '2020-11-16 17:02:21', '2020-11-16 17:23:47');
INSERT INTO `respuesta` VALUES ('242', 'Adenina', '119', '0', null, null, '1', '1', '2020-11-16 17:02:38', '2020-11-16 17:24:14');
INSERT INTO `respuesta` VALUES ('243', 'Guanina', '119', '0', null, null, '1', '1', '2020-11-16 17:02:45', '2020-11-16 17:24:14');
INSERT INTO `respuesta` VALUES ('244', 'Citosina', '119', '0', null, null, '1', '1', '2020-11-16 17:02:52', '2020-11-16 17:24:14');
INSERT INTO `respuesta` VALUES ('245', 'Uracilo', '119', '1', null, null, '1', '1', '2020-11-16 17:02:58', '2020-11-16 17:24:14');
INSERT INTO `respuesta` VALUES ('246', 'Adenina, Guanina, Timina y Uracilo', '120', '0', null, null, '1', '1', '2020-11-16 17:10:21', '2020-11-16 17:24:24');
INSERT INTO `respuesta` VALUES ('247', 'Adenina, Guanina, Citosina y Timina', '120', '1', null, null, '1', '1', '2020-11-16 17:10:28', '2020-11-16 17:24:24');
INSERT INTO `respuesta` VALUES ('248', 'Adenina, Citosina, Timina y Uracilo', '120', '0', null, null, '1', '1', '2020-11-16 17:10:37', '2020-11-16 17:24:24');
INSERT INTO `respuesta` VALUES ('249', 'Citosina, Guanina, Timina y Uracilo', '120', '0', null, null, '1', '1', '2020-11-16 17:10:44', '2020-11-16 17:24:24');
INSERT INTO `respuesta` VALUES ('250', 'Nitrogenada', '121', '0', null, null, '1', '1', '2020-11-16 17:18:02', '2020-11-16 17:24:37');
INSERT INTO `respuesta` VALUES ('251', 'Los ácidos nucléicos están formados por una cadena de moléculas más sencillas llamados nucleótidos.', '121', '0', null, null, '1', '1', '2020-11-16 17:18:14', '2020-11-16 17:24:37');
INSERT INTO `respuesta` VALUES ('252', 'Todas las respuestas son correctas', '121', '1', null, null, '1', '1', '2020-11-16 17:18:27', '2020-11-16 17:24:37');
INSERT INTO `respuesta` VALUES ('253', 'Las bases nitrogenadas son: Adenina, Guanina, Citosina y Timina', '121', '0', null, null, '1', '1', '2020-11-16 17:18:42', '2020-11-16 17:24:37');
INSERT INTO `respuesta` VALUES ('254', 'Timina', '122', '1', null, null, '1', '1', '2020-11-16 17:20:09', '2020-11-16 17:24:44');
INSERT INTO `respuesta` VALUES ('255', 'Citosina', '122', '0', null, null, '1', '1', '2020-11-16 17:20:16', '2020-11-16 17:24:44');
INSERT INTO `respuesta` VALUES ('256', 'Guanina', '122', '0', null, null, '1', '1', '2020-11-16 17:20:22', '2020-11-16 17:24:44');
INSERT INTO `respuesta` VALUES ('257', 'Uracilo', '122', '0', null, null, '1', '1', '2020-11-16 17:20:30', '2020-11-16 17:24:44');
INSERT INTO `respuesta` VALUES ('258', 'Ácido fosfórico, azúcar, base nitrogenada', '123', '1', null, null, '1', '1', '2020-11-16 17:21:03', '2020-11-16 17:24:54');
INSERT INTO `respuesta` VALUES ('259', 'Azúcar, ácido fosfórico, base nitrogenada', '123', '0', null, null, '1', '1', '2020-11-16 17:21:10', '2020-11-16 17:24:54');
INSERT INTO `respuesta` VALUES ('260', 'Azúcar, base nitrogenada', '123', '0', null, null, '1', '1', '2020-11-16 17:21:17', '2020-11-16 17:24:54');
INSERT INTO `respuesta` VALUES ('261', 'Azúcar, base nitrogenada, ácido fosfórico', '123', '0', null, null, '1', '1', '2020-11-16 17:21:29', '2020-11-16 17:24:54');
INSERT INTO `respuesta` VALUES ('262', 'A = C', '124', '0', null, null, '1', '1', '2020-11-16 17:21:54', '2020-11-16 17:25:01');
INSERT INTO `respuesta` VALUES ('263', 'A = G', '124', '0', null, null, '1', '1', '2020-11-16 17:22:09', '2020-11-16 17:25:01');
INSERT INTO `respuesta` VALUES ('264', 'A = N', '124', '1', null, null, '1', '1', '2020-11-16 17:22:17', '2020-11-16 17:25:01');
INSERT INTO `respuesta` VALUES ('265', 'A = T', '124', '0', null, null, '1', '1', '2020-11-16 17:22:34', '2020-11-16 17:25:01');
INSERT INTO `respuesta` VALUES ('273', 'Color y tamaño', '128', '1', null, null, '1', '1', '2020-12-06 00:45:35', '2020-12-06 00:46:25');
INSERT INTO `respuesta` VALUES ('274', 'Forma y textura', '128', '1', null, null, '1', '1', '2020-12-06 00:45:47', '2020-12-06 00:46:26');
INSERT INTO `respuesta` VALUES ('275', 'Longitud, dureza', '128', '0', null, null, '1', '1', '2020-12-06 00:45:58', '2020-12-06 00:45:58');
INSERT INTO `respuesta` VALUES ('276', 'Flexibilidad y permeabilidad', '128', '0', null, null, '1', '1', '2020-12-06 00:46:08', '2020-12-06 00:46:08');
INSERT INTO `respuesta` VALUES ('277', 'Solido', '129', '1', null, null, '1', '1', '2020-12-06 00:47:13', '2020-12-06 00:47:47');
INSERT INTO `respuesta` VALUES ('278', 'Liquido', '129', '0', null, null, '1', '1', '2020-12-06 00:47:21', '2020-12-06 00:47:47');
INSERT INTO `respuesta` VALUES ('279', 'Gaseoso', '129', '0', null, null, '1', '1', '2020-12-06 00:47:28', '2020-12-06 00:47:47');
INSERT INTO `respuesta` VALUES ('280', 'Sus moléculas se mantienen fuertemente unidas', '130', '1', null, null, '1', '1', '2020-12-06 00:51:02', '2020-12-06 00:51:24');
INSERT INTO `respuesta` VALUES ('281', 'Fluyen con mucha facilidad', '130', '0', null, null, '1', '1', '2020-12-06 00:51:10', '2020-12-06 00:51:24');
INSERT INTO `respuesta` VALUES ('282', 'No poseen forma determinada', '130', '0', null, null, '1', '1', '2020-12-06 00:51:19', '2020-12-06 00:51:24');
INSERT INTO `respuesta` VALUES ('283', 'No posen volumen definido', '131', '0', null, null, '1', '1', '2020-12-06 01:02:32', '2020-12-06 01:02:54');
INSERT INTO `respuesta` VALUES ('284', 'Espacios intermusculares menores que en los sólidos', '131', '0', null, null, '1', '1', '2020-12-06 01:02:40', '2020-12-06 01:02:54');
INSERT INTO `respuesta` VALUES ('285', 'Masa constante', '131', '1', null, null, '1', '1', '2020-12-06 01:02:48', '2020-12-06 01:02:54');
INSERT INTO `respuesta` VALUES ('286', 'Vaporización', '132', '0', null, null, '1', '1', '2020-12-06 01:03:54', '2020-12-06 01:04:24');
INSERT INTO `respuesta` VALUES ('287', 'Fusion', '132', '1', null, null, '1', '1', '2020-12-06 01:04:05', '2020-12-06 01:04:24');
INSERT INTO `respuesta` VALUES ('288', 'Condensación', '132', '0', null, null, '1', '1', '2020-12-06 01:04:14', '2020-12-06 01:04:24');
INSERT INTO `respuesta` VALUES ('289', 'Es todo lo que no ocupa un espacio.', '133', '0', null, null, '1', '1', '2020-12-06 01:05:05', '2020-12-06 01:05:30');
INSERT INTO `respuesta` VALUES ('290', 'Es todo lo que ocupa un espacio pero no son los gaseosos.', '133', '0', null, null, '1', '1', '2020-12-06 01:05:13', '2020-12-06 01:05:30');
INSERT INTO `respuesta` VALUES ('291', 'Es todo lo que ocupa un espacio determinado.', '133', '1', null, null, '1', '1', '2020-12-06 01:05:26', '2020-12-06 01:05:30');
INSERT INTO `respuesta` VALUES ('292', 'Medico.', '134', '0', null, null, '1', '1', '2020-12-06 01:17:44', '2020-12-06 01:18:12');
INSERT INTO `respuesta` VALUES ('293', 'Dentista.', '134', '0', null, null, '1', '1', '2020-12-06 01:17:53', '2020-12-06 01:18:12');
INSERT INTO `respuesta` VALUES ('294', 'Nutricionista.', '134', '1', null, null, '1', '1', '2020-12-06 01:18:00', '2020-12-06 01:18:12');
INSERT INTO `respuesta` VALUES ('295', 'Enfermero.', '134', '0', null, null, '1', '1', '2020-12-06 01:18:07', '2020-12-06 01:18:12');
INSERT INTO `respuesta` VALUES ('296', 'Por azucares.', '135', '0', null, null, '1', '1', '2020-12-06 01:20:29', '2020-12-06 01:22:47');
INSERT INTO `respuesta` VALUES ('297', 'Por nutrientes.', '135', '1', null, null, '1', '1', '2020-12-06 01:22:21', '2020-12-06 01:22:47');
INSERT INTO `respuesta` VALUES ('298', 'Por almidón.', '135', '0', null, null, '1', '1', '2020-12-06 01:22:30', '2020-12-06 01:22:47');
INSERT INTO `respuesta` VALUES ('299', 'Por grasas.', '135', '0', null, null, '1', '1', '2020-12-06 01:22:39', '2020-12-06 01:22:47');
INSERT INTO `respuesta` VALUES ('300', 'Naranja.', '136', '1', null, null, '1', '1', '2020-12-06 01:23:18', '2020-12-06 01:23:53');
INSERT INTO `respuesta` VALUES ('301', 'Leche.', '136', '0', null, null, '1', '1', '2020-12-06 01:23:26', '2020-12-06 01:23:52');
INSERT INTO `respuesta` VALUES ('302', 'Choclo.', '136', '0', null, null, '1', '1', '2020-12-06 01:23:37', '2020-12-06 01:23:52');
INSERT INTO `respuesta` VALUES ('303', 'Huevos.', '136', '0', null, null, '1', '1', '2020-12-06 01:23:45', '2020-12-06 01:23:52');
INSERT INTO `respuesta` VALUES ('304', 'Azucares.', '137', '0', null, null, '1', '1', '2020-12-06 01:26:23', '2020-12-06 01:26:55');
INSERT INTO `respuesta` VALUES ('305', 'Grasas.', '137', '0', null, null, '1', '1', '2020-12-06 01:26:32', '2020-12-06 01:26:55');
INSERT INTO `respuesta` VALUES ('306', 'Almidón.', '137', '1', null, null, '1', '1', '2020-12-06 01:26:39', '2020-12-06 01:26:55');
INSERT INTO `respuesta` VALUES ('307', 'Proteinas', '137', '0', null, null, '1', '1', '2020-12-06 01:26:47', '2020-12-06 01:26:55');
INSERT INTO `respuesta` VALUES ('308', 'Energéticos.', '138', '0', null, null, '1', '1', '2020-12-06 01:29:10', '2020-12-06 01:29:35');
INSERT INTO `respuesta` VALUES ('309', 'Constructores', '138', '0', null, null, '1', '1', '2020-12-06 01:29:19', '2020-12-06 01:29:35');
INSERT INTO `respuesta` VALUES ('310', 'Protectores', '138', '1', null, null, '1', '1', '2020-12-06 01:29:27', '2020-12-06 01:29:35');
INSERT INTO `respuesta` VALUES ('311', 'Protectores.', '139', '0', null, null, '1', '1', '2020-12-06 01:30:14', '2020-12-06 01:30:37');
INSERT INTO `respuesta` VALUES ('312', 'Energeticos.', '139', '1', null, null, '1', '1', '2020-12-06 01:30:21', '2020-12-06 01:30:37');
INSERT INTO `respuesta` VALUES ('313', 'Constructores.', '139', '0', null, null, '1', '1', '2020-12-06 01:30:30', '2020-12-06 01:30:37');
INSERT INTO `respuesta` VALUES ('314', 'juventud', '140', '0', null, null, '1', '1', '2020-12-06 01:36:37', '2020-12-06 01:37:05');
INSERT INTO `respuesta` VALUES ('315', 'adolescencia', '140', '0', null, null, '1', '1', '2020-12-06 01:36:50', '2020-12-06 01:37:05');
INSERT INTO `respuesta` VALUES ('316', 'adultez', '140', '0', null, null, '1', '1', '2020-12-06 01:36:55', '2020-12-06 01:37:05');
INSERT INTO `respuesta` VALUES ('317', 'Ancianidad', '140', '1', null, null, '1', '1', '2020-12-06 01:37:03', '2020-12-06 01:37:05');
INSERT INTO `respuesta` VALUES ('318', 'Niñez', '141', '0', null, null, '1', '1', '2020-12-06 01:38:26', '2020-12-06 01:38:47');
INSERT INTO `respuesta` VALUES ('319', 'Adolcencia', '141', '1', null, null, '1', '1', '2020-12-06 01:38:34', '2020-12-06 01:38:47');
INSERT INTO `respuesta` VALUES ('320', 'Infancia', '141', '0', null, null, '1', '1', '2020-12-06 01:38:41', '2020-12-06 01:38:47');
INSERT INTO `respuesta` VALUES ('321', 'Temprana', '142', '1', null, null, '1', '1', '2020-12-06 01:39:16', '2020-12-06 01:39:35');
INSERT INTO `respuesta` VALUES ('322', 'Tardia', '142', '0', null, null, '1', '1', '2020-12-06 01:39:22', '2020-12-06 01:39:35');
INSERT INTO `respuesta` VALUES ('323', 'Fisica', '142', '0', null, null, '1', '1', '2020-12-06 01:39:30', '2020-12-06 01:39:35');
INSERT INTO `respuesta` VALUES ('324', 'Cambios físicos', '143', '1', null, null, '1', '1', '2020-12-06 01:40:53', '2020-12-06 01:41:14');
INSERT INTO `respuesta` VALUES ('325', 'cambios cognitivos', '143', '0', null, null, '1', '1', '2020-12-06 01:41:01', '2020-12-06 01:41:14');
INSERT INTO `respuesta` VALUES ('326', 'cambios psíquicos', '143', '0', null, null, '1', '1', '2020-12-06 01:41:08', '2020-12-06 01:41:14');
INSERT INTO `respuesta` VALUES ('327', 'Se vuelven independiente', '144', '1', null, null, '1', '1', '2020-12-06 01:41:51', '2020-12-06 01:42:15');
INSERT INTO `respuesta` VALUES ('328', 'Son mas apegados a sus padres', '144', '0', null, null, '1', '1', '2020-12-06 01:41:59', '2020-12-06 01:42:15');
INSERT INTO `respuesta` VALUES ('329', 'Quieren trabajar y se ponen reverde', '144', '0', null, null, '1', '1', '2020-12-06 01:42:06', '2020-12-06 01:42:15');
INSERT INTO `respuesta` VALUES ('330', 'cognitivo', '145', '0', null, null, '1', '1', '2020-12-06 01:42:45', '2020-12-06 01:43:05');
INSERT INTO `respuesta` VALUES ('331', 'Social', '145', '1', null, null, '1', '1', '2020-12-06 01:42:54', '2020-12-06 01:43:05');
INSERT INTO `respuesta` VALUES ('332', 'Psicologico', '145', '0', null, null, '1', '1', '2020-12-06 01:43:01', '2020-12-06 01:43:05');
INSERT INTO `respuesta` VALUES ('333', 'Un elemento', '146', '1', null, null, '1', '1', '2020-12-06 02:04:43', '2020-12-06 02:05:21');
INSERT INTO `respuesta` VALUES ('334', 'Un compuesto', '146', '0', null, null, '1', '1', '2020-12-06 02:04:52', '2020-12-06 02:05:21');
INSERT INTO `respuesta` VALUES ('335', 'Una mezcla', '146', '0', null, null, '1', '1', '2020-12-06 02:05:00', '2020-12-06 02:05:21');
INSERT INTO `respuesta` VALUES ('336', 'un elemento', '147', '0', null, null, '1', '1', '2020-12-06 02:05:52', '2020-12-06 02:06:32');
INSERT INTO `respuesta` VALUES ('337', 'un compuesto', '147', '1', null, null, '1', '1', '2020-12-06 02:06:00', '2020-12-06 02:06:32');
INSERT INTO `respuesta` VALUES ('338', 'una mezcla heterogénea', '147', '0', null, null, '1', '1', '2020-12-06 02:06:07', '2020-12-06 02:06:32');
INSERT INTO `respuesta` VALUES ('339', 'una mezcla homogénea', '147', '0', null, null, '1', '1', '2020-12-06 02:06:15', '2020-12-06 02:06:32');
INSERT INTO `respuesta` VALUES ('340', 'un elemento', '148', '1', null, null, '1', '1', '2020-12-06 02:07:08', '2020-12-06 02:09:49');
INSERT INTO `respuesta` VALUES ('341', 'una mezcla homogénea', '148', '0', null, null, '1', '1', '2020-12-06 02:07:17', '2020-12-06 02:09:49');
INSERT INTO `respuesta` VALUES ('342', 'una suspensión', '148', '0', null, null, '1', '1', '2020-12-06 02:07:26', '2020-12-06 02:09:49');
INSERT INTO `respuesta` VALUES ('343', 'un compuesto', '148', '0', null, null, '1', '1', '2020-12-06 02:07:34', '2020-12-06 02:09:49');
INSERT INTO `respuesta` VALUES ('344', 'Un elemento', '149', '0', null, null, '1', '1', '2020-12-06 02:17:03', '2020-12-06 02:17:24');
INSERT INTO `respuesta` VALUES ('345', 'Un compuesto', '149', '0', null, null, '1', '1', '2020-12-06 02:17:13', '2020-12-06 02:17:24');
INSERT INTO `respuesta` VALUES ('346', 'Una mezcla', '149', '1', null, null, '1', '1', '2020-12-06 02:17:20', '2020-12-06 02:17:24');
INSERT INTO `respuesta` VALUES ('347', 'cuyos componentes son líquidos', '150', '0', null, null, '1', '1', '2020-12-06 02:17:52', '2020-12-06 02:18:30');
INSERT INTO `respuesta` VALUES ('348', 'cuyos átomos se aprecian a simple vista', '150', '0', null, null, '1', '1', '2020-12-06 02:18:02', '2020-12-06 02:18:30');
INSERT INTO `respuesta` VALUES ('349', 'cuyos componentes no se distinguen a simple vista', '150', '1', null, null, '1', '1', '2020-12-06 02:18:17', '2020-12-06 02:18:30');
INSERT INTO `respuesta` VALUES ('350', 'cuyos componentes se distinguen a simple vista', '150', '0', null, null, '1', '1', '2020-12-06 02:18:26', '2020-12-06 02:18:30');
INSERT INTO `respuesta` VALUES ('351', 'una mezcla heterogénea de metales de aspecto sólido', '151', '0', null, null, '1', '1', '2020-12-06 02:19:04', '2020-12-06 02:19:33');
INSERT INTO `respuesta` VALUES ('352', 'una mezcla homogénea de dos o más metales', '151', '1', null, null, '1', '1', '2020-12-06 02:19:12', '2020-12-06 02:19:33');
INSERT INTO `respuesta` VALUES ('353', 'una sustancia pura metálica', '151', '0', null, null, '1', '1', '2020-12-06 02:19:20', '2020-12-06 02:19:33');
INSERT INTO `respuesta` VALUES ('354', 'un compuesto formado por Cu, Fe, Sn o Zn', '151', '0', null, null, '1', '1', '2020-12-06 02:19:30', '2020-12-06 02:19:33');
INSERT INTO `respuesta` VALUES ('355', 'Renovables', '152', '0', null, null, '1', '1', '2020-12-06 02:39:20', '2020-12-06 02:39:56');
INSERT INTO `respuesta` VALUES ('356', 'No renovables', '152', '0', null, null, '1', '1', '2020-12-06 02:39:29', '2020-12-06 02:39:56');
INSERT INTO `respuesta` VALUES ('357', 'Renovables y No Renovables', '152', '1', null, null, '1', '1', '2020-12-06 02:39:44', '2020-12-06 02:39:56');
INSERT INTO `respuesta` VALUES ('358', 'El sol y el agua.', '152', '0', null, null, '1', '1', '2020-12-06 02:39:50', '2020-12-06 02:39:56');
INSERT INTO `respuesta` VALUES ('359', 'Existen limitadamente en la naturaleza.', '153', '1', null, null, '1', '1', '2020-12-06 02:40:29', '2020-12-06 02:41:04');
INSERT INTO `respuesta` VALUES ('360', 'Existen ilimitadamente en la naturaleza.', '153', '0', null, null, '1', '1', '2020-12-06 02:40:39', '2020-12-06 02:41:04');
INSERT INTO `respuesta` VALUES ('361', 'No existen en la naturaleza.', '153', '0', null, null, '1', '1', '2020-12-06 02:40:49', '2020-12-06 02:41:04');
INSERT INTO `respuesta` VALUES ('362', 'Existen porque el hombre las inventa.', '153', '0', null, null, '1', '1', '2020-12-06 02:41:01', '2020-12-06 02:41:04');
INSERT INTO `respuesta` VALUES ('363', 'Existen limitadamente en la naturaleza.', '154', '0', null, null, '1', '1', '2020-12-06 02:44:23', '2020-12-06 02:44:56');
INSERT INTO `respuesta` VALUES ('364', 'Existen ilimitadamente en la naturaleza.', '154', '1', null, null, '1', '1', '2020-12-06 02:44:31', '2020-12-06 02:44:56');
INSERT INTO `respuesta` VALUES ('365', 'No existen en la naturaleza.', '154', '0', null, null, '1', '1', '2020-12-06 02:44:39', '2020-12-06 02:44:56');
INSERT INTO `respuesta` VALUES ('366', 'Existen porque el hombre las inventa.', '154', '0', null, null, '1', '1', '2020-12-06 02:44:48', '2020-12-06 02:44:56');
INSERT INTO `respuesta` VALUES ('367', 'Solar, Biomasa, Eólica y Geotérmica.', '155', '0', null, null, '1', '1', '2020-12-06 02:47:09', '2020-12-06 02:48:00');
INSERT INTO `respuesta` VALUES ('368', 'Solar, Biomasa, Eólica ,Geotérmica y la Hidroeléctrica.', '155', '1', null, null, '1', '1', '2020-12-06 02:47:21', '2020-12-06 02:48:00');
INSERT INTO `respuesta` VALUES ('369', 'Solar, Biomasa y fósil.', '155', '0', null, null, '1', '1', '2020-12-06 02:47:28', '2020-12-06 02:48:00');
INSERT INTO `respuesta` VALUES ('370', 'Eólica , Geotérmica, fósil y eólica.', '155', '0', null, null, '1', '1', '2020-12-06 02:47:47', '2020-12-06 02:48:00');
INSERT INTO `respuesta` VALUES ('371', 'Calor', '156', '0', null, null, '1', '1', '2020-12-06 02:54:49', '2020-12-06 02:55:16');
INSERT INTO `respuesta` VALUES ('372', 'Solar', '156', '1', null, null, '1', '1', '2020-12-06 02:54:56', '2020-12-06 02:55:16');
INSERT INTO `respuesta` VALUES ('373', 'Nuclear', '156', '0', null, null, '1', '1', '2020-12-06 02:55:03', '2020-12-06 02:55:16');
INSERT INTO `respuesta` VALUES ('374', 'Biomasa.', '156', '0', null, null, '1', '1', '2020-12-06 02:55:12', '2020-12-06 02:55:16');
INSERT INTO `respuesta` VALUES ('375', 'recursos', '157', '1', null, null, '1', '1', '2020-12-06 02:55:50', '2020-12-06 02:56:17');
INSERT INTO `respuesta` VALUES ('376', 'energéticos', '157', '0', null, null, '1', '1', '2020-12-06 02:55:57', '2020-12-06 02:56:17');
INSERT INTO `respuesta` VALUES ('377', 'agua', '157', '0', null, null, '1', '1', '2020-12-06 02:56:04', '2020-12-06 02:56:17');
INSERT INTO `respuesta` VALUES ('378', 'vientoaire', '157', '0', null, null, '1', '1', '2020-12-06 02:56:11', '2020-12-06 02:56:17');
INSERT INTO `respuesta` VALUES ('379', 'Materia que puede degradarse rápidamente de forma natural', '158', '1', null, null, '1', '1', '2020-12-06 03:03:38', '2020-12-06 03:04:19');
INSERT INTO `respuesta` VALUES ('380', 'Materia que no puede degradarse rápidamente de forma natural', '158', '0', null, null, '1', '1', '2020-12-06 03:03:52', '2020-12-06 03:04:19');
INSERT INTO `respuesta` VALUES ('381', 'es igual al elemento inorgánico', '158', '0', null, null, '1', '1', '2020-12-06 03:04:01', '2020-12-06 03:04:19');
INSERT INTO `respuesta` VALUES ('382', 'Se recicla con el papel y el plástico', '158', '0', null, null, '1', '1', '2020-12-06 03:04:12', '2020-12-06 03:04:19');
INSERT INTO `respuesta` VALUES ('383', 'Se dan porque si', '159', '0', null, null, '1', '1', '2020-12-06 03:04:55', '2020-12-06 03:05:24');
INSERT INTO `respuesta` VALUES ('384', 'son caprichos del ecosistema', '159', '0', null, null, '1', '1', '2020-12-06 03:05:09', '2020-12-06 03:05:24');
INSERT INTO `respuesta` VALUES ('385', 'Muchas no son tan naturales sino que las produce el hombre al no cuidar al medio ambiente', '159', '1', null, null, '1', '1', '2020-12-06 03:05:17', '2020-12-06 03:05:24');
INSERT INTO `respuesta` VALUES ('386', 'La desigualdad social y económica.', '160', '0', null, null, '1', '1', '2020-12-06 03:05:57', '2020-12-06 03:06:27');
INSERT INTO `respuesta` VALUES ('387', 'El abandono del campo y la industria.', '160', '0', null, null, '1', '1', '2020-12-06 03:06:06', '2020-12-06 03:06:27');
INSERT INTO `respuesta` VALUES ('388', 'La contaminación del agua, suelo y aire', '160', '1', null, null, '1', '1', '2020-12-06 03:06:16', '2020-12-06 03:06:27');
INSERT INTO `respuesta` VALUES ('389', 'La migración de especies animales.', '160', '0', null, null, '1', '1', '2020-12-06 03:06:24', '2020-12-06 03:06:27');
INSERT INTO `respuesta` VALUES ('390', 'La Especie Invasora', '161', '0', null, null, '1', '1', '2020-12-06 03:08:50', '2020-12-06 03:09:24');
INSERT INTO `respuesta` VALUES ('391', 'Los Factores Abióticos', '161', '0', null, null, '1', '1', '2020-12-06 03:09:05', '2020-12-06 03:09:24');
INSERT INTO `respuesta` VALUES ('392', 'Bio', '161', '0', null, null, '1', '1', '2020-12-06 03:09:11', '2020-12-06 03:09:24');
INSERT INTO `respuesta` VALUES ('393', 'Los Factores Bióticos', '161', '1', null, null, '1', '1', '2020-12-06 03:09:18', '2020-12-06 03:09:24');
INSERT INTO `respuesta` VALUES ('394', 'Los Factores Abióticos', '162', '1', null, null, '1', '1', '2020-12-06 03:10:01', '2020-12-06 03:10:33');
INSERT INTO `respuesta` VALUES ('395', 'La población', '162', '0', null, null, '1', '1', '2020-12-06 03:10:08', '2020-12-06 03:10:33');
INSERT INTO `respuesta` VALUES ('396', 'Los Factores Bióticos', '162', '0', null, null, '1', '1', '2020-12-06 03:10:16', '2020-12-06 03:10:33');
INSERT INTO `respuesta` VALUES ('397', 'Un Ecosistema', '162', '0', null, null, '1', '1', '2020-12-06 03:10:26', '2020-12-06 03:10:33');
INSERT INTO `respuesta` VALUES ('398', 'ciencias', '163', '0', null, null, '1', '1', '2020-12-06 03:11:52', '2020-12-06 03:12:37');
INSERT INTO `respuesta` VALUES ('399', 'vida', '163', '1', null, null, '1', '1', '2020-12-06 03:12:09', '2020-12-06 03:12:37');
INSERT INTO `respuesta` VALUES ('400', 'cosa', '163', '0', null, null, '1', '1', '2020-12-06 03:12:27', '2020-12-06 03:12:37');
INSERT INTO `respuesta` VALUES ('401', 'estudio', '163', '0', null, null, '1', '1', '2020-12-06 03:12:33', '2020-12-06 03:12:37');
INSERT INTO `respuesta` VALUES ('402', 'Átomo.', '164', '1', null, null, '1', '1', '2020-12-06 03:19:40', '2020-12-06 03:20:07');
INSERT INTO `respuesta` VALUES ('403', 'Elemento.', '164', '0', null, null, '1', '1', '2020-12-06 03:19:48', '2020-12-06 03:20:07');
INSERT INTO `respuesta` VALUES ('404', 'Molécula.', '164', '0', null, null, '1', '1', '2020-12-06 03:19:58', '2020-12-06 03:20:07');
INSERT INTO `respuesta` VALUES ('405', 'Esfera.', '164', '0', null, null, '1', '1', '2020-12-06 03:20:05', '2020-12-06 03:20:07');
INSERT INTO `respuesta` VALUES ('406', 'Símbolo atómico.', '165', '0', null, null, '1', '1', '2020-12-06 03:20:59', '2020-12-06 03:21:27');
INSERT INTO `respuesta` VALUES ('407', 'Símbolo químico.', '165', '1', null, null, '1', '1', '2020-12-06 03:21:07', '2020-12-06 03:21:27');
INSERT INTO `respuesta` VALUES ('408', 'Elementos.', '165', '0', null, null, '1', '1', '2020-12-06 03:21:16', '2020-12-06 03:21:27');
INSERT INTO `respuesta` VALUES ('409', 'Peso atómico.', '165', '0', null, null, '1', '1', '2020-12-06 03:21:23', '2020-12-06 03:21:27');
INSERT INTO `respuesta` VALUES ('410', 'Corteza.', '166', '0', null, null, '1', '1', '2020-12-06 03:22:15', '2020-12-06 03:22:47');
INSERT INTO `respuesta` VALUES ('411', 'Núcleo.', '166', '1', null, null, '1', '1', '2020-12-06 03:22:23', '2020-12-06 03:22:47');
INSERT INTO `respuesta` VALUES ('412', 'Electrón.', '166', '0', null, null, '1', '1', '2020-12-06 03:22:31', '2020-12-06 03:22:47');
INSERT INTO `respuesta` VALUES ('413', 'Protón.', '166', '0', null, null, '1', '1', '2020-12-06 03:22:44', '2020-12-06 03:22:47');
INSERT INTO `respuesta` VALUES ('414', 'Masa molecular', '167', '0', null, null, '1', '1', '2020-12-06 03:23:32', '2020-12-06 03:24:02');
INSERT INTO `respuesta` VALUES ('415', 'Masa fórmula', '167', '0', null, null, '1', '1', '2020-12-06 03:23:40', '2020-12-06 03:24:02');
INSERT INTO `respuesta` VALUES ('416', 'Masa molar', '167', '1', null, null, '1', '1', '2020-12-06 03:23:47', '2020-12-06 03:24:02');
INSERT INTO `respuesta` VALUES ('417', 'Masa atómica', '167', '0', null, null, '1', '1', '2020-12-06 03:23:56', '2020-12-06 03:24:02');
INSERT INTO `respuesta` VALUES ('418', 'La mole cantidad de átomos y moléculas.', '168', '1', null, null, '1', '1', '2020-12-06 03:26:19', '2020-12-06 03:26:47');
INSERT INTO `respuesta` VALUES ('419', 'El mole oaxaqueño o poblano.', '168', '0', null, null, '1', '1', '2020-12-06 03:26:29', '2020-12-06 03:26:47');
INSERT INTO `respuesta` VALUES ('420', 'Con un montón de cosas.', '168', '0', null, null, '1', '1', '2020-12-06 03:26:37', '2020-12-06 03:26:47');
INSERT INTO `respuesta` VALUES ('421', 'Cantidad de materia.', '168', '0', null, null, '1', '1', '2020-12-06 03:26:44', '2020-12-06 03:26:47');
INSERT INTO `respuesta` VALUES ('422', 'Solución.', '169', '1', null, null, '1', '1', '2020-12-06 03:27:20', '2020-12-06 03:27:48');
INSERT INTO `respuesta` VALUES ('423', 'Soluto.', '169', '0', null, null, '1', '1', '2020-12-06 03:27:28', '2020-12-06 03:27:48');
INSERT INTO `respuesta` VALUES ('424', 'Solvente.', '169', '0', null, null, '1', '1', '2020-12-06 03:27:37', '2020-12-06 03:27:48');
INSERT INTO `respuesta` VALUES ('425', 'Todas son correctas.', '169', '0', null, null, '1', '1', '2020-12-06 03:27:44', '2020-12-06 03:27:48');
INSERT INTO `respuesta` VALUES ('426', 'El grano de polen se deposita sobre el estigma.', '170', '0', null, null, '1', '1', '2020-12-06 03:47:08', '2020-12-06 03:47:41');
INSERT INTO `respuesta` VALUES ('427', 'El grano de polen se une con el ovulo en el ovario.', '170', '1', null, null, '1', '1', '2020-12-06 03:47:17', '2020-12-06 03:47:41');
INSERT INTO `respuesta` VALUES ('428', 'El ovulo madura y es el único componente que interviene.', '170', '0', null, null, '1', '1', '2020-12-06 03:47:25', '2020-12-06 03:47:41');
INSERT INTO `respuesta` VALUES ('429', 'El polen se une con el ovulo en el tubo polínico.', '170', '0', null, null, '1', '1', '2020-12-06 03:47:34', '2020-12-06 03:47:41');
INSERT INTO `respuesta` VALUES ('430', 'Las aves son vivíparas.', '171', '0', null, null, '1', '1', '2020-12-06 03:48:17', '2020-12-06 03:48:52');
INSERT INTO `respuesta` VALUES ('431', 'Las aves son ovíparas.', '171', '1', null, null, '1', '1', '2020-12-06 03:48:28', '2020-12-06 03:48:52');
INSERT INTO `respuesta` VALUES ('432', 'Las aves amamantan a sus crías.', '171', '0', null, null, '1', '1', '2020-12-06 03:48:40', '2020-12-06 03:48:52');
INSERT INTO `respuesta` VALUES ('433', 'Las aves son asexuadas', '171', '0', null, null, '1', '1', '2020-12-06 03:48:48', '2020-12-06 03:48:52');
INSERT INTO `respuesta` VALUES ('434', 'Espermatozoides y óvulos.', '172', '0', null, null, '1', '1', '2020-12-06 03:49:23', '2020-12-06 03:49:53');
INSERT INTO `respuesta` VALUES ('435', 'Androceo y gineceo.', '172', '0', null, null, '1', '1', '2020-12-06 03:49:31', '2020-12-06 03:49:53');
INSERT INTO `respuesta` VALUES ('436', 'Anteridios y arquegonios.', '172', '1', null, null, '1', '1', '2020-12-06 03:49:42', '2020-12-06 03:49:53');
INSERT INTO `respuesta` VALUES ('437', 'Ninguna de las anteriores.', '172', '0', null, null, '1', '1', '2020-12-06 03:49:49', '2020-12-06 03:49:53');
INSERT INTO `respuesta` VALUES ('438', 'Es la acción que resulta la reproducir una cosa que ya existe o ha existido.', '173', '0', null, null, '1', '1', '2020-12-06 03:52:04', '2020-12-06 03:54:20');
INSERT INTO `respuesta` VALUES ('439', 'por la reproducción.', '173', '0', null, null, '1', '1', '2020-12-06 03:53:34', '2020-12-06 03:54:20');
INSERT INTO `respuesta` VALUES ('440', 'Proceso mediante el cual se perpetúa la especie, es la capacidad que tienen los seres vivos de producir nuevos individuos.', '173', '1', null, null, '1', '1', '2020-12-06 03:53:42', '2020-12-06 03:54:20');
INSERT INTO `respuesta` VALUES ('441', 'Es un proceso biológico que permite la creación de nuevos organismos.', '173', '0', null, null, '1', '1', '2020-12-06 03:54:07', '2020-12-06 03:54:20');
INSERT INTO `respuesta` VALUES ('442', 'Existen dos tipos de reproducción los cuales son Gemación y Mixta.', '174', '0', null, null, '1', '1', '2020-12-06 03:54:50', '2020-12-06 03:55:26');
INSERT INTO `respuesta` VALUES ('443', 'Existen dos tipos de reproducción los cuales son Sexual y Asexual.', '174', '1', null, null, '1', '1', '2020-12-06 03:54:59', '2020-12-06 03:55:26');
INSERT INTO `respuesta` VALUES ('444', 'Existen 3 tipos de reproducción los cuales son Asexual, Sexual y Gemación.', '174', '0', null, null, '1', '1', '2020-12-06 03:55:09', '2020-12-06 03:55:26');
INSERT INTO `respuesta` VALUES ('445', 'Ninguna de las anteriores.', '174', '0', null, null, '1', '1', '2020-12-06 03:55:22', '2020-12-06 03:55:26');
INSERT INTO `respuesta` VALUES ('446', 'El ovulo.', '175', '0', null, null, '1', '1', '2020-12-06 03:55:59', '2020-12-06 03:56:39');
INSERT INTO `respuesta` VALUES ('447', 'Prostata.', '175', '0', null, null, '1', '1', '2020-12-06 03:56:14', '2020-12-06 03:56:39');
INSERT INTO `respuesta` VALUES ('448', 'Espermatozoides.', '175', '1', null, null, '1', '1', '2020-12-06 03:56:22', '2020-12-06 03:56:39');
INSERT INTO `respuesta` VALUES ('449', 'Ovarios.', '175', '0', null, null, '1', '1', '2020-12-06 03:56:30', '2020-12-06 03:56:39');
INSERT INTO `respuesta` VALUES ('450', 'ácida.', '176', '0', null, null, '1', '1', '2020-12-06 04:02:58', '2020-12-06 04:03:17');
INSERT INTO `respuesta` VALUES ('451', 'Neutra.', '176', '0', null, null, '1', '1', '2020-12-06 04:03:06', '2020-12-06 04:03:17');
INSERT INTO `respuesta` VALUES ('452', 'básica.', '176', '1', null, null, '1', '1', '2020-12-06 04:03:13', '2020-12-06 04:03:17');
INSERT INTO `respuesta` VALUES ('453', 'La escala que se usa para medir la acidez de las sustancias', '177', '0', null, null, '1', '1', '2020-12-06 04:03:46', '2020-12-06 04:04:20');
INSERT INTO `respuesta` VALUES ('454', 'Los \"horse power\" de potencia que tiene una máquina.', '177', '0', null, null, '1', '1', '2020-12-06 04:03:57', '2020-12-06 04:04:20');
INSERT INTO `respuesta` VALUES ('455', 'Son las siglas de Hewlett Pakard', '177', '0', null, null, '1', '1', '2020-12-06 04:04:04', '2020-12-06 04:04:20');
INSERT INTO `respuesta` VALUES ('456', 'La escala que se usa para medir la acidez y la alcalinidad de una sustancia.', '177', '1', null, null, '1', '1', '2020-12-06 04:04:13', '2020-12-06 04:04:20');
INSERT INTO `respuesta` VALUES ('457', 'partículas de hidrógeno', '178', '0', null, null, '1', '1', '2020-12-06 04:04:51', '2020-12-06 04:07:50');
INSERT INTO `respuesta` VALUES ('458', 'potencial de hidrógeno.', '178', '1', null, null, '1', '1', '2020-12-06 04:04:59', '2020-12-06 04:07:50');
INSERT INTO `respuesta` VALUES ('459', 'nivel de ácidez y basicidad de los líquidos.', '178', '0', null, null, '1', '1', '2020-12-06 04:05:07', '2020-12-06 04:07:50');
INSERT INTO `respuesta` VALUES ('460', 'partículas de hidrógeno, hidróxidos e hidronios', '178', '0', null, null, '1', '1', '2020-12-06 04:05:15', '2020-12-06 04:07:50');
INSERT INTO `respuesta` VALUES ('461', 'Acida', '179', '0', null, null, '1', '1', '2020-12-06 04:08:31', '2020-12-06 04:08:59');
INSERT INTO `respuesta` VALUES ('462', 'Neutra', '179', '1', null, null, '1', '1', '2020-12-06 04:08:38', '2020-12-06 04:08:59');
INSERT INTO `respuesta` VALUES ('463', 'Basica', '179', '0', null, null, '1', '1', '2020-12-06 04:08:47', '2020-12-06 04:08:59');
INSERT INTO `respuesta` VALUES ('464', 'no se puede determinar', '179', '0', null, null, '1', '1', '2020-12-06 04:08:55', '2020-12-06 04:08:59');
INSERT INTO `respuesta` VALUES ('465', 'una medida de la resistencia al cambio del pH que se produciría por el agregado de pequeñas cantidades de ácidos y/o bases fuertes.', '180', '1', null, null, '1', '1', '2020-12-06 04:09:43', '2020-12-06 04:10:10');
INSERT INTO `respuesta` VALUES ('466', 'un acido', '180', '0', null, null, '1', '1', '2020-12-06 04:09:51', '2020-12-06 04:10:10');
INSERT INTO `respuesta` VALUES ('467', 'Una sustancia que soporta cambios de pH', '180', '0', null, null, '1', '1', '2020-12-06 04:09:59', '2020-12-06 04:10:10');
INSERT INTO `respuesta` VALUES ('468', 'una base', '180', '0', null, null, '1', '1', '2020-12-06 04:10:07', '2020-12-06 04:10:10');
INSERT INTO `respuesta` VALUES ('469', 'pH', '181', '1', null, null, '1', '1', '2020-12-06 04:10:49', '2020-12-06 04:11:18');
INSERT INTO `respuesta` VALUES ('470', 'la auto ionización del agua', '181', '0', null, null, '1', '1', '2020-12-06 04:11:00', '2020-12-06 04:11:18');
INSERT INTO `respuesta` VALUES ('471', 'una sal', '181', '0', null, null, '1', '1', '2020-12-06 04:11:08', '2020-12-06 04:11:18');
INSERT INTO `respuesta` VALUES ('472', 'una solución amortiguadora', '181', '0', null, null, '1', '1', '2020-12-06 04:11:16', '2020-12-06 04:11:18');
INSERT INTO `respuesta` VALUES ('473', 'Correcto', '182', '1', null, null, '1', '1', '2020-12-06 05:05:42', '2020-12-06 05:05:55');
INSERT INTO `respuesta` VALUES ('474', 'Incorrecto', '182', '0', null, null, '1', '1', '2020-12-06 05:05:50', '2020-12-06 05:05:55');
INSERT INTO `respuesta` VALUES ('475', 'Soy envidioso', '183', '0', null, null, '1', '1', '2020-12-06 05:06:28', '2020-12-06 05:06:48');
INSERT INTO `respuesta` VALUES ('476', 'Soy egoísta', '183', '0', null, null, '1', '1', '2020-12-06 05:06:36', '2020-12-06 05:06:48');
INSERT INTO `respuesta` VALUES ('477', 'Soy un ser humano', '183', '1', null, null, '1', '1', '2020-12-06 05:06:44', '2020-12-06 05:06:48');
INSERT INTO `respuesta` VALUES ('478', 'Yo soy extrovertido.', '184', '1', null, null, '1', '1', '2020-12-06 05:07:25', '2020-12-06 05:07:40');
INSERT INTO `respuesta` VALUES ('479', 'Yo soy introvertido.', '184', '0', null, null, '1', '1', '2020-12-06 05:07:36', '2020-12-06 05:07:40');
INSERT INTO `respuesta` VALUES ('480', 'un grupo de personas que se juntan para cumplir un objetivo en común.', '185', '1', null, null, '1', '1', '2020-12-06 05:12:15', '2020-12-06 05:12:35');
INSERT INTO `respuesta` VALUES ('481', 'un grupo de animales que conversan entre sí.', '185', '0', null, null, '1', '1', '2020-12-06 05:12:22', '2020-12-06 05:12:35');
INSERT INTO `respuesta` VALUES ('482', 'un grupo de personas adultas que se reúnen para bailar y conversar.', '185', '0', null, null, '1', '1', '2020-12-06 05:12:30', '2020-12-06 05:12:35');
INSERT INTO `respuesta` VALUES ('483', 'La Familia, La Educación, La Religión, La Política y La Economía', '186', '1', null, null, '1', '1', '2020-12-06 05:13:26', '2020-12-06 05:13:51');
INSERT INTO `respuesta` VALUES ('484', 'La OMS Y La UNO', '186', '0', null, null, '1', '1', '2020-12-06 05:13:33', '2020-12-06 05:13:51');
INSERT INTO `respuesta` VALUES ('485', 'la pobreza, vida submarina, educación de calidad...', '186', '0', null, null, '1', '1', '2020-12-06 05:13:40', '2020-12-06 05:13:51');
INSERT INTO `respuesta` VALUES ('486', 'Desarrollo Sostenible y derechos humanos', '186', '0', null, null, '1', '1', '2020-12-06 05:13:48', '2020-12-06 05:13:51');
INSERT INTO `respuesta` VALUES ('487', 'muchedumbre', '187', '1', null, null, '1', '1', '2020-12-06 05:14:18', '2020-12-06 05:14:46');
INSERT INTO `respuesta` VALUES ('488', 'petición', '187', '0', null, null, '1', '1', '2020-12-06 05:14:25', '2020-12-06 05:14:45');
INSERT INTO `respuesta` VALUES ('489', 'conflicto', '187', '0', null, null, '1', '1', '2020-12-06 05:14:33', '2020-12-06 05:14:45');
INSERT INTO `respuesta` VALUES ('490', 'globalización', '187', '0', null, null, '1', '1', '2020-12-06 05:14:40', '2020-12-06 05:14:45');

-- ----------------------------
-- Table structure for respuesta_alumno
-- ----------------------------
DROP TABLE IF EXISTS `respuesta_alumno`;
CREATE TABLE `respuesta_alumno` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_prueba` int(11) NOT NULL,
  `id_evaluacion_alumno` int(11) NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of respuesta_alumno
-- ----------------------------
INSERT INTO `respuesta_alumno` VALUES ('26', '1', '10', '1', '5', '1', null, '0', '0.00', null, '1', '1', '2020-08-12 17:32:47', '2020-08-15 15:48:13');
INSERT INTO `respuesta_alumno` VALUES ('27', '1', '0', '6', null, '1', 'La suma de cualquier número más cero (0) es igual al mismo número.', '0', '3.00', null, '1', '1', '2020-08-12 17:32:53', '2020-08-15 18:32:06');
INSERT INTO `respuesta_alumno` VALUES ('29', '1', '0', '3', null, '1', 'Cualquier número multiplicado por cero da como producto cero. Cualquier número multiplicado por cero da como producto cero. Cualquier número multiplicado por cero da como producto cero.', '0', '4.00', null, '1', '1', '2020-08-12 17:33:07', '2020-08-15 02:42:36');
INSERT INTO `respuesta_alumno` VALUES ('31', '1', '0', '8', '16', '1', null, '0', '0.00', null, '1', '1', '2020-08-12 17:33:29', '2020-08-12 17:33:29');
INSERT INTO `respuesta_alumno` VALUES ('41', '1', '0', '2', '1', '1', null, '1', '1.50', null, '1', '1', null, null);
INSERT INTO `respuesta_alumno` VALUES ('42', '1', '0', '2', '2', '1', null, '0', '0.00', null, '1', '1', null, null);
INSERT INTO `respuesta_alumno` VALUES ('43', '1', '0', '2', '3', '1', null, '1', '1.50', null, '1', '1', null, null);
INSERT INTO `respuesta_alumno` VALUES ('44', '1', '0', '5', '12', '1', null, '1', '1.33', null, '1', '1', null, null);
INSERT INTO `respuesta_alumno` VALUES ('45', '1', '0', '5', '14', '1', null, '1', '1.33', null, '1', '1', null, null);

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
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of status
-- ----------------------------
INSERT INTO `status` VALUES ('1', 'activo', 'active', 'ACT', 'GRAL', null, null, null, null, '1', '1', '2020-05-07 03:00:28', null);
INSERT INTO `status` VALUES ('2', 'inactivo', 'inactive', 'INA', 'GRAL', null, null, null, null, '1', '1', '2020-05-07 03:01:01', null);
INSERT INTO `status` VALUES ('3', 'asignada', 'assigned', 'ASI', 'EVALUACION', 'mdi-text-box-check', 'amber', null, null, '1', '1', null, null);
INSERT INTO `status` VALUES ('4', 'en ejecucion', 'running', 'EEJE', 'EVALUACION', 'mdi-text-box-check', 'orange', null, null, '1', '1', null, null);
INSERT INTO `status` VALUES ('5', 'ejecutada', 'executed', 'EJE', 'EVALUACION', 'mdi-cog-clockwise', 'info', null, null, '1', '1', null, null);
INSERT INTO `status` VALUES ('6', 'evaluada', 'evaluated', 'EVA', 'EVALUACION', 'mdi-check-all', 'success', null, null, '1', '1', null, null);
INSERT INTO `status` VALUES ('7', 'cerradas', 'closed', 'CER', 'EVALUACION', 'mdi-close', 'red', null, null, '1', '1', null, null);
INSERT INTO `status` VALUES ('99', 'eliminada', 'eliminated', 'ELI', 'HIDDEN', '', '', null, null, '1', '1', '2020-11-09 15:15:39', null);

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
-- Table structure for tarea
-- ----------------------------
DROP TABLE IF EXISTS `tarea`;
CREATE TABLE `tarea` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_tarea` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tx_descripcion` varchar(3000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_tipo_tarea` int(11) DEFAULT NULL,
  `id_grado` int(11) NOT NULL,
  `id_materia` int(11) NOT NULL,
  `id_tema` int(11) NOT NULL,
  `nu_peso` decimal(11,2) DEFAULT NULL,
  `tx_observaciones` varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for tema
-- ----------------------------
DROP TABLE IF EXISTS `tema`;
CREATE TABLE `tema` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_tema` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `nu_tema` int(11) NOT NULL,
  `tx_descripcion` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `id_materia` int(11) NOT NULL,
  `id_grado` int(11) NOT NULL,
  `nu_nivel` int(11) DEFAULT NULL,
  `nu_peso` int(11) DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of tema
-- ----------------------------
INSERT INTO `tema` VALUES ('2', '¿Cómo es mi forma de ser?', '1', '', '19', '4', '1', '1', '1', '1', '2020-10-13 16:03:05', '2020-10-13 16:03:08');
INSERT INTO `tema` VALUES ('3', 'Organizaciones sociales', '1', '', '19', '4', '1', '1', '1', '1', '2020-10-13 16:12:13', '2020-10-13 16:12:16');
INSERT INTO `tema` VALUES ('4', '¿Qué es es un metro?', '1', 'A estos aparatos se les conoce como cintas métricas. Hay cintas métricas de diferentes tamaños, unas miden 1 metro, otras un poco más de 1 metro o son más largas. Hay tamaños distintos para usos distintos', '14', '4', '1', '1', '1', '1', '2020-10-06 18:03:27', '2020-10-06 18:03:27');
INSERT INTO `tema` VALUES ('5', 'Jugamos con el Tangram', '2', '¿Conoces el juego del Tangram? Es un rompecabezas muy antiguo y de origen chino. Dicen que tiene más de dos mil años y todavía se juega con él. Existen varios tipos de Tangram, el más conocido es el Tangram clásico  en la imagen adjunta. Consta de 7 piezas. Con el Tangram  se pueden hacer muchas fig', '14', '4', '1', '1', '1', '1', '2020-10-13 16:03:05', '2020-10-13 16:03:05');
INSERT INTO `tema` VALUES ('6', '¿Qué es el ábaco?', '1', 'El ábaco es un instrumento de cálculo que podemos encontrar en muchas casas o escuelas. Está formado por cuentas de madera, metal o piedras que están ensartadas en varias barras de madera o metal, fijadas en una base. Cada una de las barras representa las unidades, las decenas, las centenas, las uni', '14', '5', '1', '1', '1', '1', '2020-10-13 16:12:13', '2020-10-13 16:12:13');
INSERT INTO `tema` VALUES ('7', 'Problemas con monedas y dinero', '2', 'Un problema de matemáticas consiste en un enunciado que aporta unos datos y se plantea un dilema, para resolver el dilema lo primero que debemos hacer es reconocer los datos. Un recurso útil para entender los datos es que haga un pequeño dibujo. Recuerda que una imagen vale más que 1000 palabras, y ', '14', '5', '1', '1', '1', '1', '2020-10-06 18:03:27', '2020-10-06 18:03:27');
INSERT INTO `tema` VALUES ('8', 'El sistema de numeración y el conteo', '1', 'Los niños y las niñas tienen conocimientos previos que van adquiriendo por un intercambio del medio social y natural en el que se desarrollan cada uno y podemos crear en ellos un conocimiento que complemente lo que ya saben a partir de estas. Para favorecer dichos procesos el empleo de juegos es la ', '14', '6', '1', '1', '1', '1', '2020-10-13 16:03:05', '2020-10-13 16:03:05');
INSERT INTO `tema` VALUES ('9', 'La numeración más allá de diez mil', '2', 'Para conformar un número se utiliza la notación desarrollada, que es la suma de millares, centenas, decenas y unidades', '14', '6', '1', '1', '1', '1', '2020-10-13 16:12:13', '2020-10-13 16:12:13');
INSERT INTO `tema` VALUES ('10', 'Números decimales', '1', 'Hay número que tienen una parte inferior a la unidad, estos se llaman números decimales. La parte entera va a la izquierda de la coma y la parte decimal a la derecha', '14', '7', '1', '1', '1', '1', '2020-10-06 18:03:27', '2020-10-06 18:03:27');
INSERT INTO `tema` VALUES ('11', 'Los Numeros y las Unidades de Longitud', '2', 'Hasta ahora hemos trabajado con números enteros, cuya cifra más pequeña es la unidad. Pero también hay número que tienen una parte inferior a la unidad, estos se llaman números decimales. La parte entera va a la izquierda de la coma y la parte decimal a la derecha', '14', '7', '1', '1', '1', '1', '2020-10-13 16:03:05', '2020-10-13 16:03:05');
INSERT INTO `tema` VALUES ('12', 'Adiciones y sustracciones de decimales', '1', 'Expresiones como 3m y 27cm se pueden escribir de forma abreviada usando nros decimales', '14', '8', '1', '1', '1', '1', '2020-10-13 16:12:13', '2020-10-13 16:12:13');
INSERT INTO `tema` VALUES ('13', 'Multiplicar números decimales', '2', 'Para multiplicar números decimales seguiremos los siguientes pasos: a. Se efectúa la multiplicación sin tener en cuenta las comas\nb.  Una vez efectuada la multiplicación, en el resultado se separan con la coma, desde la derecha, tantas cifras como decimales haya entre los dos factores. ', '14', '8', '1', '1', '1', '1', '2020-10-06 18:03:27', '2020-10-06 18:03:27');
INSERT INTO `tema` VALUES ('14', 'Conteo y agrupación', '1', '', '14', '9', '1', '1', '1', '1', '2020-10-13 16:03:05', '2020-10-13 16:03:05');
INSERT INTO `tema` VALUES ('15', 'Base', '2', 'Hemos analizado situaciones que nos dan la idea de base, así podemos decir que:\nEl grupo de símbolos diferentes, que tiene un sistema de numeración y con el que se puede escribir cualquier otro número del mismo sistema, se llama base.', '14', '9', '1', '1', '1', '1', '2020-10-13 16:12:13', '2020-10-13 16:12:13');
INSERT INTO `tema` VALUES ('16', 'Construcción del concepto de número entero (Z)', '1', 'Los números son signos o conjuntos de signos que permiten expresar una cantidad con relación a su unidad. Los números enteros abarcan a los números naturales (los que se utilizan para contar los elementos de un conjunto), incluyendo al cero y a los números negativos (que son el resultado de restar a', '14', '10', '1', '1', '1', '1', '2020-10-06 18:03:27', '2020-10-06 18:03:27');
INSERT INTO `tema` VALUES ('17', 'Representación de números enteros (Z)', '2', 'Los números como +30, +40, +70, -30, -40 y -20, que tienen un + o un –, indican una cantidad de acuerdo con un punto de referencia u origen y se denominan números relativos.', '14', '10', '1', '1', '1', '1', '2020-10-13 16:03:05', '2020-10-13 16:03:05');
INSERT INTO `tema` VALUES ('18', 'Los números racionales (Q)', '1', 'Se llama número racional a todo número que puede representarse como el cociente de dos enteros, con denominador distinto de cero. En otras palabras, un número racional tiene la forma. Los números racionales están formados por los números enteros y los números fraccionarios. Los números racionales pe', '14', '11', '1', '1', '1', '1', '2020-10-13 16:12:13', '2020-10-13 16:12:13');
INSERT INTO `tema` VALUES ('19', 'La recta numérica y los números racionales (Q)', '2', 'Los números racionales se localizan en la recta numérica a ambos ladosdel cero: a la derecha los racionales positivos y a la izquierda los racionales\nnegativos.', '14', '11', '1', '1', '1', '1', '2020-10-06 18:03:27', '2020-10-06 18:03:27');
INSERT INTO `tema` VALUES ('20', 'Los números reales ( R )', '1', 'Los números reales son cualquier número que corresponda a un punto en la recta real y pueden clasificarse en números naturales, enteros, racionales e irracionales. \nEn otras palabras, cualquier número real está comprendido entre menos infinito y más infinito y podemos representarlo en la recta real.', '14', '12', '1', '1', '1', '1', '2020-10-13 16:03:05', '2020-10-13 16:03:05');
INSERT INTO `tema` VALUES ('21', 'Adición y multiplicacion en los R', '2', 'Decir que la adición y la multiplicación son operaciones definidas en el con- junto de los números  reales significa que si dos números reales se relacionan mediante alguna de estas dos operaciones el resultado en un número real.', '14', '12', '1', '1', '1', '1', '2020-10-13 16:12:13', '2020-10-13 16:12:13');
INSERT INTO `tema` VALUES ('22', 'El duende y el búho', '1', '', '15', '4', '1', '1', '1', '1', '2020-10-06 18:03:27', '2020-10-06 18:03:27');
INSERT INTO `tema` VALUES ('23', 'El pirata piratón', '2', '', '15', '4', '1', '1', '1', '1', '2020-10-13 16:03:05', '2020-10-13 16:03:05');
INSERT INTO `tema` VALUES ('24', 'Descubramos las oraciones de un párrafo', '1', '', '15', '5', '1', '1', '1', '1', '2020-10-13 16:12:13', '2020-10-13 16:12:13');
INSERT INTO `tema` VALUES ('25', 'Participemos en una mesa redonda', '2', '', '15', '5', '1', '1', '1', '1', '2020-10-06 18:03:27', '2020-10-06 18:03:27');
INSERT INTO `tema` VALUES ('26', 'El búho, el Sol y la Luna', '1', '', '15', '6', '1', '1', '1', '1', '2020-10-13 16:03:05', '2020-10-13 16:03:05');
INSERT INTO `tema` VALUES ('27', 'El teatro de títeres', '2', '', '15', '6', '1', '1', '1', '1', '2020-10-13 16:12:13', '2020-10-13 16:12:13');
INSERT INTO `tema` VALUES ('28', 'La relación mediante la entrevista', '1', '', '15', '7', '1', '1', '1', '1', '2020-10-06 18:03:27', '2020-10-06 18:03:27');
INSERT INTO `tema` VALUES ('29', 'El debate y la mesa redonda', '2', '', '15', '7', '1', '1', '1', '1', '2020-10-13 16:03:05', '2020-10-13 16:03:05');
INSERT INTO `tema` VALUES ('30', 'Marjencio Communo', '1', '', '15', '8', '1', '1', '1', '1', '2020-10-13 16:12:13', '2020-10-13 16:12:13');
INSERT INTO `tema` VALUES ('31', 'Imágenes a partir de palabras', '2', '', '15', '8', '1', '1', '1', '1', '2020-10-06 18:03:27', '2020-10-06 18:03:27');
INSERT INTO `tema` VALUES ('32', 'Las palabras que hablan', '1', '', '15', '9', '1', '1', '1', '1', '2020-10-13 16:03:05', '2020-10-13 16:03:05');
INSERT INTO `tema` VALUES ('33', 'Contando con las palabras', '2', '', '15', '9', '1', '1', '1', '1', '2020-10-13 16:12:13', '2020-10-13 16:12:13');
INSERT INTO `tema` VALUES ('34', 'Hablo de lo que sé, la exposición oral', '1', '', '15', '10', '1', '1', '1', '1', '2020-10-06 18:03:27', '2020-10-06 18:03:27');
INSERT INTO `tema` VALUES ('35', 'Escribo para hacer', '2', '', '15', '10', '1', '1', '1', '1', '2020-10-13 16:03:05', '2020-10-13 16:03:05');
INSERT INTO `tema` VALUES ('36', 'Lenguaje oral y lenguaje escrito', '1', '', '15', '11', '1', '1', '1', '1', '2020-10-13 16:12:13', '2020-10-13 16:12:13');
INSERT INTO `tema` VALUES ('37', '¿Para qué la oralidad y la escritura?', '2', '', '15', '11', '1', '1', '1', '1', '2020-10-06 18:03:27', '2020-10-06 18:03:27');
INSERT INTO `tema` VALUES ('38', 'La narración oral', '1', '', '15', '12', '1', '1', '1', '1', '2020-10-13 16:03:05', '2020-10-13 16:03:05');
INSERT INTO `tema` VALUES ('39', 'El resumen', '2', '', '15', '12', '1', '1', '1', '1', '2020-10-13 16:12:13', '2020-10-13 16:12:13');
INSERT INTO `tema` VALUES ('41', 'El paisaje geográfico y la vida de las comunidades', '1', 'Al observar un paisaje te das cuenta que tiene elevaciones, planicies, depresiones y hendiduras, las cuales son diferentes formas de relieve. En el fondo de los mares y', '19', '5', '1', '1', '1', '1', '2020-10-13 16:03:05', '2020-10-13 16:03:05');
INSERT INTO `tema` VALUES ('43', 'La cultura y yo', '1', 'Los seres humanos creamos la noción del tiempo para poder medir la duración de sucesos y momentos de la vida de una persona, de una sociedad o de un fenómeno natural. La noción del tiempo como algo que puede medirse, permitió poder programar y controlar eventos como la elaboración de la comida, la d', '19', '6', '1', '1', '1', '1', '2020-10-06 18:03:27', '2020-10-06 18:03:27');
INSERT INTO `tema` VALUES ('45', 'LaDe viaje por las regiones naturales de Colombia y del mundo', '1', 'Los primeros grupos humanos de nuestro continente fueron nómadas (es decir que no tenían residencia fija), vivieron de la caza, la pesca y la recolección de alimentos. Estos nativos conocieron bastante la naturaleza y sus ciclos, por lo que sabían cuándo era el momento de: La cosecha. El nacimiento ', '19', '7', '1', '1', '1', '1', '2020-10-13 16:12:13', '2020-10-13 16:12:13');
INSERT INTO `tema` VALUES ('47', 'La importancia de la economía en nuestras vidas', '1', 'Después de que los españoles conquistaron la totalidad del territorio que hoy conocemos como Colombia (1500 - 1550), se inició un periodo que se conoce como la Colonia (1550 -1810), y que se caracterizó por un intenso proceso de: poblamiento español de los lugares; organización de formas de gobierno', '19', '8', '1', '1', '1', '1', '2020-10-13 16:03:05', '2020-10-13 16:03:05');
INSERT INTO `tema` VALUES ('49', 'El origen del universo', '1', 'El universo está conformado por millones de estrellas, planetas, satélites, cometas, galaxias, meteoritos, satélites, asteroides, nubes cósmicas y agujeros negros, los cuales se explican en el tema 2. ', '19', '9', '1', '1', '1', '1', '2020-10-06 18:03:27', '2020-10-06 18:03:27');
INSERT INTO `tema` VALUES ('50', 'La composición del universo', '2', 'El universo está lleno de materia y energía representada en las galaxias, las estrellas, los planetas, los asteroides, la materia oscura, el gas y el polvo interestelar. Este conjunto', '19', '9', '1', '1', '1', '1', '2020-10-13 16:03:05', '2020-10-13 16:03:05');
INSERT INTO `tema` VALUES ('51', 'Clima y tiempo atmosférico', '1', 'Para comprender qué es el clima, es necesario estudiar primero el significado del tiempo atmosférico, pues la mayoría de las veces confundimos estos dos conceptos o se cree que son lo mismo. ¿Qué es el tiempo atmosférico? Observa a tu alrededor y comprueba cómo está la atmósfera en este momento. ¿Es', '19', '10', '1', '1', '1', '1', '2020-10-13 16:12:13', '2020-10-13 16:12:13');
INSERT INTO `tema` VALUES ('52', 'Los climas de la Tierra', '2', 'Existen diversas formas para clasificar los climas del planeta de acuerdo con los factores que se  seleccionen. Las más conocidas tienen en cuenta las ca- racterísticas de la vegetación, junto a la cantidad de lluvia y la temperatura. Otras clasificaciones se ba- san en la distribución anual de la l', '19', '10', '1', '1', '1', '1', '2020-10-06 18:03:27', '2020-10-06 18:03:27');
INSERT INTO `tema` VALUES ('53', 'La cartografía', '1', 'l ser humano ha representado los lugares conocidos desde la más remota antigüedad. Se tienen datos, por ejemplo, de algunos dibujos encontrados en cuevas y cavernas, que al parecer eran croquis de los territorios donde vivían y cazaban las personas. ', '19', '11', '1', '1', '1', '1', '2020-10-13 16:03:05', '2020-10-13 16:03:05');
INSERT INTO `tema` VALUES ('54', 'Desarrollo de la cartografía', '2', 'a partir del siglo XV Hacia el siglo XV confluyeron una serie de factores que impulsaron la navegación como la necesidad de encontrar nuevas rutas comerciales entre Euro- pa y Asia, el desarrollo o aplicación de inventos clave como la brújula, el astrolabio, la imprenta, el papel, las carabelas y la', '19', '11', '1', '1', '1', '1', '2020-10-13 16:12:13', '2020-10-13 16:12:13');
INSERT INTO `tema` VALUES ('55', 'Origen y desarrollo del imperialismo', '1', 'El imperialismo se entiende como la dominación realizada por las naciones o pueblos poderosos para ampliar y mantener el control sobre naciones o pueblos más débiles, mediante el empleo de la fuerza militar, económica o política.', '19', '12', '1', '1', '1', '1', '2020-10-06 18:03:27', '2020-10-06 18:03:27');
INSERT INTO `tema` VALUES ('56', 'Imperialismo, siglo XX', '2', 'A comienzos del siglo XX, en los países dominados surgieron movimientos nacionalistas con ideales de rechazo al sistema imperialista, que lograron en algunas', '19', '12', '1', '1', '1', '1', '2020-10-13 16:03:05', '2020-10-13 16:03:05');
INSERT INTO `tema` VALUES ('57', 'La materia', '1', null, '7', '4', '1', '1', '1', '1', '2020-10-13 16:12:13', '2020-11-10 22:09:07');
INSERT INTO `tema` VALUES ('58', 'Los alimentos', '1', null, '7', '5', '1', '1', '1', '1', '2020-10-06 18:03:27', '2020-10-06 18:03:27');
INSERT INTO `tema` VALUES ('60', 'Cambios en el ser humano', '1', null, '7', '6', '1', '1', '1', '1', '2020-10-13 16:12:13', '2020-10-13 16:12:13');
INSERT INTO `tema` VALUES ('62', 'Elementos, compuestos y mezclas', '1', null, '7', '7', '1', '1', '1', '1', '2020-10-13 16:03:05', '2020-10-13 16:03:05');
INSERT INTO `tema` VALUES ('64', 'Energía', '1', null, '7', '8', '1', '1', '1', '1', '2020-10-06 18:03:27', '2020-10-06 18:03:27');
INSERT INTO `tema` VALUES ('68', 'Unidades constituyente de la materia', '1', null, '7', '10', '1', '1', '1', '1', '2020-10-13 16:03:05', '2020-10-13 16:03:05');
INSERT INTO `tema` VALUES ('70', 'Los seres vivos como organismos dinámicos', '1', null, '7', '11', '1', '1', '1', '1', '2020-10-06 18:03:27', '2020-10-06 18:03:27');
INSERT INTO `tema` VALUES ('72', 'Importancia biologica del Ph', '1', null, '7', '12', '1', '1', '1', '1', '2020-10-13 16:12:13', '2020-10-13 16:12:13');
INSERT INTO `tema` VALUES ('74', 'La ciencia y lo seres vivos', '1', null, '7', '9', '1', '1', '1', '1', '2020-11-26 17:46:27', '2020-11-26 17:46:27');

-- ----------------------------
-- Table structure for tipo_accion
-- ----------------------------
DROP TABLE IF EXISTS `tipo_accion`;
CREATE TABLE `tipo_accion` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_tipo_accion` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tx_icono` varchar(35) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tx_color` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of tipo_accion
-- ----------------------------
INSERT INTO `tipo_accion` VALUES ('1', 'Video', 'mdi-play-circle', 'pink', null, '1', '1', '2020-10-05 17:02:32', '2020-10-05 17:06:56');
INSERT INTO `tipo_accion` VALUES ('2', 'Audio', 'mdi-music-circle', 'deep-orange', null, '1', '1', '2020-10-05 17:04:55', '2020-10-05 17:07:23');
INSERT INTO `tipo_accion` VALUES ('3', 'Enlace', 'mdi-earth', 'blue', null, '1', '1', '2020-10-05 17:05:53', '2020-10-05 17:05:53');
INSERT INTO `tipo_accion` VALUES ('4', 'Lectura', 'mdi-library', 'indigo', null, '1', '1', '2020-10-05 17:08:37', '2020-10-05 17:24:26');

-- ----------------------------
-- Table structure for tipo_actividad
-- ----------------------------
DROP TABLE IF EXISTS `tipo_actividad`;
CREATE TABLE `tipo_actividad` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_tipo_actividad` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tx_icono` varchar(35) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tx_color` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of tipo_actividad
-- ----------------------------
INSERT INTO `tipo_actividad` VALUES ('1', 'Actividad', 'mdi-rocket-launch', 'amber', null, '1', '1', '2020-10-05 17:36:08', '2020-10-05 17:36:08');
INSERT INTO `tipo_actividad` VALUES ('2', 'Video', 'mdi-play-box-multiple', 'red', null, '1', '1', '2020-10-05 17:37:04', '2020-10-05 17:37:04');
INSERT INTO `tipo_actividad` VALUES ('3', 'Audio', 'mdi-music-box-multiple', 'orange', null, '1', '1', '2020-10-05 17:37:46', '2020-10-05 17:37:46');
INSERT INTO `tipo_actividad` VALUES ('4', 'Enlace', 'mdi-earth', 'blue', null, '1', '1', '2020-10-13 10:03:20', '2020-10-13 10:03:23');

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
-- Table structure for tipo_asignacion
-- ----------------------------
DROP TABLE IF EXISTS `tipo_asignacion`;
CREATE TABLE `tipo_asignacion` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_tipo_asignacion` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tx_icono` varchar(35) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tx_color` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_origen` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_criterio` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nu_tiempo` int(4) DEFAULT 0,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of tipo_asignacion
-- ----------------------------
INSERT INTO `tipo_asignacion` VALUES ('1', 'actividad', 'mdi-rocket-launch', 'amber', 'actividad', 'competar', '0', null, '1', '1', '2020-10-05 17:36:08', '2020-10-05 17:36:08');
INSERT INTO `tipo_asignacion` VALUES ('2', 'video', 'mdi-play-box-multiple', 'red', 'enlace', 'tiempo', '10', null, '1', '1', '2020-10-05 17:37:04', '2020-10-05 17:37:04');
INSERT INTO `tipo_asignacion` VALUES ('3', 'audio', 'mdi-music-box-multiple', 'orange', 'recurso', 'tiempo', '10', null, '1', '1', '2020-10-05 17:37:46', '2020-10-05 17:37:46');
INSERT INTO `tipo_asignacion` VALUES ('4', 'enlace', 'mdi-earth', 'blue', 'enlace', 'tiempo', '10', null, '1', '1', '2020-10-13 10:03:20', '2020-10-13 10:03:23');
INSERT INTO `tipo_asignacion` VALUES ('5', 'lectura', 'mdi-library', 'purple', 'recurso', 'tiempo', '10', null, '1', '1', '2020-10-13 16:08:36', '2020-10-13 16:08:39');

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
-- Table structure for tipo_enlace
-- ----------------------------
DROP TABLE IF EXISTS `tipo_enlace`;
CREATE TABLE `tipo_enlace` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_tipo_enlace` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tx_icono` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tx_color` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
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
INSERT INTO `tipo_evaluacion` VALUES ('1', 'cuestionario', 'mdi-order-bool-descending-variant', 'teal', 'prueba', '', '1', '1', '2020-05-25 22:43:23', '2020-09-06 18:05:20');
INSERT INTO `tipo_evaluacion` VALUES ('2', 'tarea', 'mdi-notebook', 'deep-purple', 'tarea', null, '1', '1', '2020-05-25 22:43:39', '2020-05-25 22:43:39');
INSERT INTO `tipo_evaluacion` VALUES ('3', 'rasgos', 'mdi-account-star', 'amber', 'rasgos', null, '2', '1', '2020-05-25 22:44:01', '2020-05-25 22:44:01');
INSERT INTO `tipo_evaluacion` VALUES ('4', 'taller', 'mdi-toolbox', 'blue-grey', 'taller', null, '2', '1', '2020-05-25 22:44:27', '2020-05-25 22:44:27');
INSERT INTO `tipo_evaluacion` VALUES ('5', 'exposicion', 'mdi-bulletin-board', 'brown', 'exposicion', null, '2', '1', '2020-05-25 22:44:37', '2020-05-25 22:44:37');

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
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
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of tipo_notificacion
-- ----------------------------
INSERT INTO `tipo_notificacion` VALUES ('1', 'Reunion', 'mdi-account-multiple', 'red', 'Nueva Reunion', '1', '1', '2020-07-22 21:08:14', '2020-07-22 21:08:14');
INSERT INTO `tipo_notificacion` VALUES ('2', 'Recordatorio', 'mdi-account-clock', 'orange', 'Nuevo Recordatorio', '1', '1', '2020-07-22 21:11:01', '2020-07-22 21:11:01');
INSERT INTO `tipo_notificacion` VALUES ('3', 'Evento', 'mdi-calendar-clock', 'purple', 'Se ha cargado un nuevo evento', '1', '1', '2020-07-22 21:12:37', '2020-07-22 21:12:37');
INSERT INTO `tipo_notificacion` VALUES ('4', 'Sancion', 'mdi-gavel', 'red', 'Se ha levantado una sancional al alumno {{alumno}}', '1', '1', '2020-09-26 14:30:32', '2020-09-26 14:30:32');
INSERT INTO `tipo_notificacion` VALUES ('5', 'Clase', 'mdi-google-classroom', 'blue', 'Inicio de Clase Materia: {{materia}}', '1', '1', '2020-11-10 18:20:17', '2020-11-10 18:20:21');
INSERT INTO `tipo_notificacion` VALUES ('6', 'Asignacion', 'mdi-clipboard-check', 'amber', 'Nueva Asignacion - Tipo: {{tipo}},  Materia: {{materia}} ', '1', '1', '2020-11-10 18:22:03', '2020-11-10 18:22:08');
INSERT INTO `tipo_notificacion` VALUES ('7', 'Evaluacion', 'mdi-order-bool-descending-variant', 'teal', 'Nuevo Cuestionario  Materia: {{materia}} ', '1', '1', '2020-11-10 18:27:21', '2020-11-10 18:27:29');
INSERT INTO `tipo_notificacion` VALUES ('8', 'Tarea', 'mdi-notebook', 'indigo', 'Nueva Tarea Materia: {{materia}} ', '1', '1', '2020-11-10 18:27:26', '2020-11-10 18:27:31');
INSERT INTO `tipo_notificacion` VALUES ('9', 'Informacion', 'mdi-message-bulleted', 'info', 'Informacion', '1', '1', '2020-11-27 20:55:24', '2020-11-27 20:55:27');

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
  `tx_icono` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
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
-- Table structure for tipo_tarea
-- ----------------------------
DROP TABLE IF EXISTS `tipo_tarea`;
CREATE TABLE `tipo_tarea` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_tipo_tarea` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tx_icono` varchar(35) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tx_color` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of tipo_tarea
-- ----------------------------
INSERT INTO `tipo_tarea` VALUES ('1', 'Cuadro Comparativo', '', null, null, '1', '1', '2020-11-13 01:38:26', '2020-11-13 01:38:31');
INSERT INTO `tipo_tarea` VALUES ('2', 'Mapa Mental', '', null, null, '1', '1', '2020-11-13 01:39:55', '2020-11-13 01:39:58');
INSERT INTO `tipo_tarea` VALUES ('3', 'Taller', '', null, null, '1', '1', '2020-11-13 01:40:40', '2020-11-13 01:40:44');
INSERT INTO `tipo_tarea` VALUES ('4', 'Resumen', '', null, null, '1', '1', '2020-11-13 01:41:19', '2020-11-13 01:41:22');
INSERT INTO `tipo_tarea` VALUES ('5', 'Triptico', '', null, null, '1', '1', '2020-11-13 01:43:50', '2020-11-13 01:43:56');

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
-- Table structure for tipo_tema
-- ----------------------------
DROP TABLE IF EXISTS `tipo_tema`;
CREATE TABLE `tipo_tema` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nb_tipo_tema` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tx_icono` varchar(35) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tx_color` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tx_observaciones` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
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
) ENGINE=InnoDB AUTO_INCREMENT=316 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=320 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
INSERT INTO `usuario_perfil` VALUES ('319', '315', '5', null, '1', '1', '2020-09-22 22:58:21', '2020-09-22 22:58:21');

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
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `vw_usuario_perfil` AS  ;

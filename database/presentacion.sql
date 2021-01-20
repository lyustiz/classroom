/*
Navicat MySQL Data Transfer

Source Server         : desdecasa
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : presentacion

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2021-01-17 09:47:52
*/

SET FOREIGN_KEY_CHECKS=0;

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
INSERT INTO `actividad` VALUES ('39', 'Solidos', '57', 'Un solidos es materia que tiene forma y tamaño propio, los solidos ocupan espacio y tienen masa. Las partículas en la materia sólida están muy juntas y muy ordenadas.\nEl volumen de los sólidos no puede comprimirse. Las partículas están tan próximas las unas de las otras, que no pueden acercarse más. Esto explica que no pueda comprimirse la materia sólida. La forma: las partículas de la materia sólida están tan unidas entre sí y con tanta fuerza que es muy difícil separarlas. Para poder separar la materia sólida necesitaré una fuerza externa como por ejemplo, golpear con un martillo', null, '1', '1', '2020-11-26 17:47:26', '2020-11-26 17:47:26');
INSERT INTO `actividad` VALUES ('40', 'Liquidos', '57', 'La materia en estado liquido, como el agua que bebemos, no tiene forma propia,  si no que se adapta a la del recipiente que la contiene, pero mantiene su volumen. Los líquidos no se pueden comprimir y su volumen es constante, pero al aumentar la temperatura se incrementa la movilidad de las partículas, aumenta la distancia que las separa, produciéndose una cierta dilatación.', null, '1', '1', '2020-11-26 17:47:26', '2020-11-26 17:47:26');
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
INSERT INTO `actividad` VALUES ('57', 'Este soy yo', '2', 'No solo los rasgos físicos te definen, también tus gustos y tu forma de ser es algo que te hace diferente a los demás, en la manera de cómo te comportas o reaccionas a las cosas. Hay personas muy calladas, otras muy alegres, a algunas les cuesta trabajo hacer amigos y a otras les resulta muy fácil, algunas se enojan más fácilmente, y otras son muy amables y cariñosas.\nPuede ser que coincidas en gustos con otras personas, pero siempre hay algo que los diferencia. Saber que te gusta y que no te gusta hacer, te permite conocerte a ti mismo.', null, '1', '1', '2020-11-26 17:47:26', '2020-11-26 17:47:26');
INSERT INTO `actividad` VALUES ('58', 'Organizaciones sociales', '3', 'La familia es el grupo de personas que comparte un mismo hogar, unidos por el cariño y por lazos de parentesco. En nuestra familia aprendemos valores y crecemos con buenos ejemplos.\nLa familia constituye la unidad básica de la sociedad, la familia es un conjunto de personas unidas por vínculos afectivos de parentesco, por matrimonio o adopción que viven junto en armonía.', null, '1', '1', '2020-11-26 17:47:26', '2020-11-26 17:47:26');
INSERT INTO `actividad` VALUES ('59', 'El paisaje geográfico', '41', 'Un paisaje geográfico es el área visible y natural de un territorio cualquiera. Está conformado por el terreno junto con todas sus formas, sus características naturales y sus atributos. Un buen paisaje suele integrarse de manera armoniosa con cualquier estructura creada por el hombre que esté presente en su extensión.', null, '1', '1', '2020-11-26 17:47:26', '2020-11-26 17:47:26');
INSERT INTO `actividad` VALUES ('60', 'El clima y el paisaje', '41', 'El paisaje es un factor decisivo en el clima de muchas regiones. La altitud refresca la temperatura y enfría las masas de aire, debido al mencionado gradiente adiabático térmico vertical negativo.', null, '1', '1', '2020-11-26 17:47:26', '2020-11-26 17:47:26');
INSERT INTO `actividad` VALUES ('61', 'Las expresiones de la cultura', '43', 'Las expresiones culturales tradicionales son también denominadas expresiones de folclor, pues representan todo lo que identifica a una sociedad con las raíces de sus antepasados. Incluyen los nombres de las personas y las expresiones musicales, artísticas y bailes, así como ceremonias o incluso la arquitectura de los edificios de un país.\n\nEstas expresiones representan las características culturales y sociales de una nación o sociedad, lo que las convierte en patrimonio cultural. Si bien en algunos casos el término se usa para definir tradiciones pertenecientes a culturas indígenas o civilizaciones antiguas, es más comúnmente acuñado para referirse al folclor de cada país.', null, '1', '1', '2020-11-26 17:47:26', '2020-11-26 17:47:26');
INSERT INTO `actividad` VALUES ('62', 'Mitos, costumbres y tradiciones', '43', 'Los mitos son relatos tradicionales de acontecimientos asombrosos, cuyos protagonistas son seres sobrenaturales o extraordinarios, tales como dioses, semidioses, héroes o monstruos. \n\nLas costumbres de un país, de una región o de una comunidad son muy importantes, a través de ellas podemos aprender acerca de hábitos, prácticas y actividades de un grupo social. \n\nLas tradiciones son legados o herencias de nuestros antepasados que se han conservado a lo largo del tiempo porque son aprendidas de generación en generación al ser consideradas valiosas para preservar la pertenencia y el vínculo a una comunidad.', null, '1', '1', '2020-11-26 17:47:26', '2020-11-26 17:47:26');
INSERT INTO `actividad` VALUES ('63', 'Las regiones naturales de Colombia', '45', 'Las regiones naturales son cada una de las zonas geográficas de un país o continente, que cuentan con características similares en cuanto a relieve, clima, vegetación y clases de suelo.\n\nColombia cuenta con seis regiones naturales que se definen por las características del relieve, la distancia al mar, el promedio de lluvias y las condiciones del suelo. Esas regiones son: amazonia, andina, Caribe, Insular, Pacífica y orinoquía.', null, '1', '1', '2020-11-26 17:47:26', '2020-11-26 17:47:26');
INSERT INTO `actividad` VALUES ('64', 'Las regiones naturales del mundo', '45', '8 regiones naturales del mundo\nLas regiones naturales se clasifican en sabana, bosque, desierto, tundra, praderas o pastizales, selva, región ecuatorial y región mediterránea.\n\nSe conoce como región natural, aquel espacio que presenta características físicas muy peculiares, las cuales, lo definen conforme a la fauna, flora, clima y el propio ecosistema presente.\n\nEs de apreciar, que cada región natural presenta sus aspectos bien definidos, que lo permiten distinguirse unos de otros, haciendo de estos, unos espacios naturales con características propias:\n\nRegión ecuatorial.\nDe pastizales tropicales sabana. \nRegión de bosque tropical caducifolio.\nDesiertos Tropicales.\nRegión mediterránea.\nRegión del margen este tipo de China\nDesiertos de latitud media tierras de estepa\nMárgenes orientales o tipo St Lawrence.', null, '1', '1', '2020-11-26 17:47:26', '2020-11-26 17:47:26');
INSERT INTO `actividad` VALUES ('65', 'El trabajo', '47', 'Como trabajo denominamos al conjunto de actividades que son realizadas con el objetivo de alcanzar una meta, solucionar un problema o producir bienes y servicios para atender las necesidades humanas.\n\nCon el paso del tiempo, el uso de la palabra se amplió para referirse a una actividad que causara dolor físico y se asoció al trabajo en el campo, pero su uso se extendió a otras actividades humanas.\n\nGracias al trabajo el ser humano comienza a conquistar su propio espacio, así como el respeto y la consideración de los demás, lo cual además contribuye a su autoestima, satisfacción personal y realización profesional, sin contar con el aporte que hace a la sociedad.\n\nEl significado de trabajo tiene enfoques en diversas áreas, como la economía, la física, la filosofía, etc.', null, '1', '1', '2020-11-26 17:47:26', '2020-11-26 17:47:26');
INSERT INTO `actividad` VALUES ('66', 'El dinero y el intercambio económico', '47', 'El dinero juega un papel fundamental en las economías basadas en el intercambio a través de los mercados. Si se piensa en la enorme cantidad de intercambios comerciales que se realizan diariamente, se aprecia de inmediato la utilidad del dinero para que estas transacciones se hagan de manera satisfactoria.\n\nEl dinero es todo medio de cambio generalmente aceptado por la sociedad\n\nEl dinero, por tanto, es aquello que utilizamos para realizar pagos, cuando compramos, y cobros, cuando vendemos. Pero, ¿y si no existiera el dinero? En ese caso nos veríamos obligados a intercambiar unos bienes por otros, es decir, a practicar el trueque.', null, '1', '1', '2020-11-26 17:47:26', '2020-11-26 17:47:26');

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
) ENGINE=InnoDB AUTO_INCREMENT=142 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
INSERT INTO `actividad_pregunta` VALUES ('136', 'El núcleo de la cultura contiene', null, '61', '2', '0', '0.00', '0', null, '1', '1', '2020-12-06 16:14:11', '2020-12-06 16:14:11');
INSERT INTO `actividad_pregunta` VALUES ('137', '¿Qué es una leyenda?', null, '62', '2', '0', '0.00', '0', null, '1', '1', '2020-12-06 16:19:17', '2020-12-06 16:19:17');
INSERT INTO `actividad_pregunta` VALUES ('138', 'Una región natural es:', null, '63', '3', '0', '0.00', '0', null, '1', '1', '2020-12-06 16:34:49', '2020-12-06 16:34:49');
INSERT INTO `actividad_pregunta` VALUES ('139', '¿Qué son los desiertos?', null, '64', '2', '0', '0.00', '0', null, '1', '1', '2020-12-06 16:37:31', '2020-12-06 16:37:31');
INSERT INTO `actividad_pregunta` VALUES ('140', 'Este tipo de trabajo implica el uso primordial de las manos.', null, '65', '2', '0', '0.00', '0', null, '1', '1', '2020-12-06 16:55:07', '2020-12-06 16:55:07');
INSERT INTO `actividad_pregunta` VALUES ('141', 'El dinero es', null, '66', '2', '0', '0.00', '0', null, '1', '1', '2020-12-06 16:57:37', '2020-12-06 16:57:37');

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
) ENGINE=InnoDB AUTO_INCREMENT=322 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
INSERT INTO `actividad_respuesta` VALUES ('299', 'Valores y modas.', '136', '0', null, null, '1', '1', '2020-12-06 16:14:24', '2020-12-06 16:14:54');
INSERT INTO `actividad_respuesta` VALUES ('300', 'Modas, normas y creencias.', '136', '0', null, null, '1', '1', '2020-12-06 16:14:33', '2020-12-06 16:14:54');
INSERT INTO `actividad_respuesta` VALUES ('301', 'Normas, valores y creencias.', '136', '1', null, null, '1', '1', '2020-12-06 16:14:40', '2020-12-06 16:14:54');
INSERT INTO `actividad_respuesta` VALUES ('302', 'normas , valores , creencias y amor', '136', '0', null, null, '1', '1', '2020-12-06 16:14:48', '2020-12-06 16:14:54');
INSERT INTO `actividad_respuesta` VALUES ('303', 'Narración que busca explicar hechos fantásticos', '137', '0', null, null, '1', '1', '2020-12-06 16:19:28', '2020-12-06 16:20:17');
INSERT INTO `actividad_respuesta` VALUES ('304', 'Narración que busca explicar hechos, tradiciones y costumbres de un pueblo', '137', '1', null, null, '1', '1', '2020-12-06 16:19:37', '2020-12-06 16:20:17');
INSERT INTO `actividad_respuesta` VALUES ('305', 'Narración que busca explicar los orígenes del universo', '137', '0', null, null, '1', '1', '2020-12-06 16:19:46', '2020-12-06 16:20:17');
INSERT INTO `actividad_respuesta` VALUES ('306', 'Narración que se transmite de forma oral de una generación a otra', '137', '0', null, null, '1', '1', '2020-12-06 16:20:13', '2020-12-06 16:20:17');
INSERT INTO `actividad_respuesta` VALUES ('307', 'un lugar que comparte características en clima, suelo, vegetación y relieve', '138', '1', null, null, '1', '1', '2020-12-06 16:35:01', '2020-12-06 16:35:38');
INSERT INTO `actividad_respuesta` VALUES ('308', 'un lugar con animales, arboles y ríos iguales', '138', '0', null, null, '1', '1', '2020-12-06 16:35:14', '2020-12-06 16:35:14');
INSERT INTO `actividad_respuesta` VALUES ('309', 'un lugar que comparte características en comida, baile, acentos y ropa', '138', '0', null, null, '1', '1', '2020-12-06 16:35:22', '2020-12-06 16:35:22');
INSERT INTO `actividad_respuesta` VALUES ('310', 'un lugar con montañas y ríos por fuera de la ciudad', '138', '0', null, null, '1', '1', '2020-12-06 16:35:29', '2020-12-06 16:35:29');
INSERT INTO `actividad_respuesta` VALUES ('311', 'Zonas áridas de gran temperatura', '139', '1', null, null, '1', '1', '2020-12-06 16:37:40', '2020-12-06 16:38:13');
INSERT INTO `actividad_respuesta` VALUES ('312', 'Zonas húmedas de baja temperaturas', '139', '0', null, null, '1', '1', '2020-12-06 16:37:48', '2020-12-06 16:38:13');
INSERT INTO `actividad_respuesta` VALUES ('313', 'Zonas trópicas con bajas temperaturas', '139', '0', null, null, '1', '1', '2020-12-06 16:37:55', '2020-12-06 16:38:13');
INSERT INTO `actividad_respuesta` VALUES ('314', 'Zonas montañosas con altas temperaturas y humedad', '139', '0', null, null, '1', '1', '2020-12-06 16:38:05', '2020-12-06 16:38:13');
INSERT INTO `actividad_respuesta` VALUES ('315', 'Trabajo nocturno', '140', '0', null, null, '1', '1', '2020-12-06 16:55:18', '2020-12-06 16:55:41');
INSERT INTO `actividad_respuesta` VALUES ('316', 'Trabajo manual', '140', '1', null, null, '1', '1', '2020-12-06 16:55:26', '2020-12-06 16:55:41');
INSERT INTO `actividad_respuesta` VALUES ('317', 'Trabajo intelectual', '140', '0', null, null, '1', '1', '2020-12-06 16:55:33', '2020-12-06 16:55:41');
INSERT INTO `actividad_respuesta` VALUES ('318', 'Un medio de cambio.', '141', '1', null, null, '1', '1', '2020-12-06 16:57:47', '2020-12-06 16:58:19');
INSERT INTO `actividad_respuesta` VALUES ('319', 'Universal.', '141', '0', null, null, '1', '1', '2020-12-06 16:57:55', '2020-12-06 16:58:18');
INSERT INTO `actividad_respuesta` VALUES ('320', 'Nos permite acceder a bienes y servicios.', '141', '0', null, null, '1', '1', '2020-12-06 16:58:02', '2020-12-06 16:58:18');
INSERT INTO `actividad_respuesta` VALUES ('321', 'Valor asignado.', '141', '0', null, null, '1', '1', '2020-12-06 16:58:12', '2020-12-06 16:58:18');

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
INSERT INTO `agenda` VALUES ('2', 'Reunion Quincenal', '2', '3', '1', '2021-01-18', '08:01:00', '08:30:00', '0', 'Cambio de Planes de Evaluacion Nueva Normalidad', '1', '1', '2020-06-19 20:39:49', '2020-06-19 20:39:49');
INSERT INTO `agenda` VALUES ('3', 'Taller Evaluaciones en Linea', '2', '3', '4', '2021-01-19', '10:55:00', '15:30:00', '0', 'Desarrollo de Planes de Evaluacion en Linea y Generacion de Tareas', '1', '1', '2020-06-19 20:59:40', '2020-06-25 22:22:57');
INSERT INTO `agenda` VALUES ('4', 'Celebracion Dia del Estudiante', '2', '6', '5', '2021-01-19', '08:00:00', '10:00:00', '0', 'Descripcion completa de alguna actividad para indicar infomacion importante.', '1', '1', '2020-06-19 21:01:55', '2020-11-10 21:43:13');
INSERT INTO `agenda` VALUES ('5', 'Prueba', '2', '5', '5', '2021-01-15', '00:00:00', '00:59:00', '0', 'Actividad Prueba', '1', '1', '2020-06-19 21:05:59', '2020-06-22 19:43:38');
INSERT INTO `agenda` VALUES ('7', 'Inicio de Clases', '2', '1', '8', '2021-01-01', '00:01:00', '00:01:00', '0', 'Inicio del año escolar', '1', '1', '2020-06-19 21:24:16', '2020-06-19 21:24:16');
INSERT INTO `agenda` VALUES ('8', 'Fin Periodo I', '2', '2', '9', '2021-01-30', '00:01:00', '00:00:00', '0', 'Fin primer periodo', '1', '1', '2020-06-19 21:25:34', '2020-06-19 21:25:34');
INSERT INTO `agenda` VALUES ('11', 'Campeonato de Futbol', '1', '4', '6', '2021-01-04', '08:00:00', '07:00:00', '0', 'Campeonato Interescolar Distrital', '1', '1', '2020-06-20 11:28:11', '2020-06-22 19:31:16');
INSERT INTO `agenda` VALUES ('13', 'Inicio 2 Periodo', '2', '1', '9', '2021-01-05', '00:10:00', '05:00:00', '0', null, '1', '1', '2020-06-25 03:07:57', '2020-11-10 21:52:45');
INSERT INTO `agenda` VALUES ('14', 'Taller Convivencia', '2', '7', '4', '2021-01-04', '00:36:00', '00:30:00', '0', 'Taller con el Prof. Jose Azuaje', '1', '1', '2020-08-18 17:51:11', '2020-11-10 21:35:55');
INSERT INTO `agenda` VALUES ('15', 'eeqeqe', '2', '1', '1', '2021-01-09', '06:06:00', '07:05:00', '0', 'eeq', '1', '1', '2020-09-02 21:27:57', '2020-09-02 21:27:57');
INSERT INTO `agenda` VALUES ('16', 'Reunion', '2', '1', '1', '2021-01-10', '02:09:00', '01:09:00', '0', 'fdfsf', '1', '2', '2020-09-05 14:13:58', '2020-09-05 14:13:58');

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
INSERT INTO `alumno_materia` VALUES ('168', '1', '2', '4', '14', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('170', '1', '1', '4', '14', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('174', '1', '2', '4', '7', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('180', '1', '2', '4', '19', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('182', '1', '1', '4', '19', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('186', '1', '2', '4', '17', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('188', '1', '1', '4', '17', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('192', '1', '2', '4', '15', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('194', '1', '1', '4', '15', null, '1', '1', null, null);
INSERT INTO `alumno_materia` VALUES ('203', '1', '1', '4', '7', null, '1', '1', '2020-08-17 23:57:01', '2020-08-17 23:57:01');

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
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
INSERT INTO `archivo` VALUES ('72', '¿Qué es la cultura y cuáles son sus caracteristicas?', '10', '35', 'Grado 3_Las expresiones de cultura_Qué es la Cultura Oral y cuáles son sus Características.pdf', 'PDF', null, '1', '1', '2020-12-06 16:32:17', '2020-12-06 16:32:17');
INSERT INTO `archivo` VALUES ('73', 'Importancia de las costumbres culturales', '10', '36', 'Grado 3_Mitos costumbres y tradiciones_Importancia de las Costumbres Culturales.pdf', 'PDF', null, '1', '1', '2020-12-06 16:32:46', '2020-12-06 16:32:46');
INSERT INTO `archivo` VALUES ('74', 'Región del pacifico', '10', '37', 'Grado 4_Regiones naturales de Colombia_Región del Pacífico.pdf', 'PDF', null, '1', '1', '2020-12-06 16:33:28', '2020-12-06 16:33:28');
INSERT INTO `archivo` VALUES ('75', '¿Cuáles son los factores que determinan las regiones naturales?', '10', '38', 'Grado 4_Regiones naturales del mundo_Cuáles son los factores que determinan las regiones naturales.pdf', 'PDF', null, '1', '1', '2020-12-06 16:34:31', '2020-12-06 16:34:31');
INSERT INTO `archivo` VALUES ('76', '¿Qué se entiende por trabajo infantil?', '10', '39', 'Grado 5_El trabajo_Qué se entiende por trabajo infantil.pdf', 'PDF', null, '1', '1', '2020-12-06 16:54:14', '2020-12-06 16:54:14');
INSERT INTO `archivo` VALUES ('77', 'Funciones del dinero', '10', '40', 'Grado 5_El dinero y el intercambio económico_Funciones del dinero.pdf', 'PDF', null, '1', '1', '2020-12-06 16:54:34', '2020-12-06 16:54:34');

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
INSERT INTO `area_estudio` VALUES ('10', 'Informatica', 'red', null, '1', '1', null, null);

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
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
INSERT INTO `asistente` VALUES ('1', 'Institucion', '7', 'Se define la informacion principal de la institucion que incluye logo, informacion  de contacto, ubiacion y directiva', 'deep-orange', '1', 'secretaria', 'Debe cargarse la información completa para la correcta generación de los reportes.', '1', '1', '2020-09-02 00:09:03', '2020-12-10 16:17:29');
INSERT INTO `asistente` VALUES ('2', 'Tipo Colegio', '8', 'Indica la categoría del colegio privado o publico', 'deep-orange', '3', 'secretaria', 'Información requerida para algunos reportes', '1', '1', '2020-09-02 01:26:22', '2020-12-10 16:22:02');
INSERT INTO `asistente` VALUES ('3', 'Cargos', '9', 'Cargos de la platilla de cargos del colegio tanto para la directiva como de los empleados.', 'deep-orange', '2', 'secretaria', 'Esta información alimentara los selectores de cargos en la carga de empleados y directivas.', '1', '1', '2020-09-02 01:32:11', '2020-12-10 16:22:02');
INSERT INTO `asistente` VALUES ('4', 'Tipo Directiva', '10', 'Tipos de directiva con que cuente la institución', 'deep-orange', '4', 'secretaria', 'Información para alimentar selectores en pantalla de carga de directiva', '1', '1', '2020-09-02 12:43:15', '2020-12-10 16:26:07');
INSERT INTO `asistente` VALUES ('6', 'Empleados', '14', 'Carga de la datos básicos del empleado así como la ubicación.  Cada vez que se genera un empleado se genera un usuario con perfil secretaria.', 'deep-orange', '5', 'secretaria', 'El correo es obligatorio y se debe tener especial cuidado ya que es usado para creación del usuario y envió de las notificaciones.', '1', '1', '2020-09-02 12:44:21', '2020-12-10 16:53:09');
INSERT INTO `asistente` VALUES ('7', 'Estructura', '12', 'Se configura los edificios y/o sectores de la institución de forma jerárquica, donde se ubican las aulas de clase.', 'deep-orange', '6', 'secretaria', 'Permite al personal administrativo-docente-alumno ubicar facilmete las aulas, se emplea en horarios y asignaciones de aulas', '1', '1', '2020-09-02 12:44:36', '2020-12-10 19:27:09');
INSERT INTO `asistente` VALUES ('8', 'Aulas', '13', 'Se indica las aulas, laboratorios, talleres u otras instalaciones  donde se imparten clases según la estructura del edificio.', 'deep-orange', '7', 'secretaria', 'Permite la asignación de clase y los horarios', '1', '1', '2020-09-02 12:44:54', '2020-12-10 19:26:28');
INSERT INTO `asistente` VALUES ('9', 'Calendario', '15', 'Se crea, edita, activa/desactiva el calendario de clases.', 'teal', '8', 'secretaria', 'Solo puede haber un calendario activo, esto limita las fechas asignable en todas las actividades. Asimismo, muestra solo los grupos creados para ese calendario', '1', '1', '2020-09-02 12:45:10', '2020-12-10 19:30:39');
INSERT INTO `asistente` VALUES ('10', 'Periodos', '16', 'Se configuran los periodos o lapsos en que se divide al calendario escolar.', 'teal', '9', 'secretaria', 'Solo puede haber un periodo activo. afecta las actividades y planes de evaluaciones que pueden cargarse', '1', '1', '2020-09-02 12:45:25', '2020-12-10 19:38:06');
INSERT INTO `asistente` VALUES ('11', 'Turnos', '21', 'Descripcion de la tarea de especial cuidado para el funcionamiento del sistema\'', 'teal', '10', 'secretaria', 'Descripcion de la funcionalidad, observaciones y advertencias', '1', '1', '2020-09-02 12:45:38', '2020-12-10 16:53:09');
INSERT INTO `asistente` VALUES ('12', 'Horas Academicas', '22', 'Descripcion de la tarea de especial cuidado para el funcionamiento del sistema\'', 'teal', '11', 'secretaria', 'Descripcion de la funcionalidad, observaciones y advertencias', '1', '1', '2020-09-02 12:45:51', '2020-12-10 16:53:09');
INSERT INTO `asistente` VALUES ('14', 'Areas de Estudio', '27', 'Descripcion de la tarea de especial cuidado para el funcionamiento del sistema\'', 'cyan', '13', 'secretaria', 'Descripcion de la funcionalidad, observaciones y advertencias', '1', '1', '2020-09-02 12:46:47', '2021-01-16 20:29:07');
INSERT INTO `asistente` VALUES ('15', 'Materias', '28', 'Descripcion de la tarea de especial cuidado para el funcionamiento del sistema\'', 'cyan', '14', 'secretaria', 'Descripcion de la funcionalidad, observaciones y advertencias', '1', '1', '2020-09-02 12:47:03', '2021-01-16 20:29:07');
INSERT INTO `asistente` VALUES ('16', 'Niveles', '24', 'Descripcion de la tarea de especial cuidado para el funcionamiento del sistema\'', 'cyan', '15', 'secretaria', 'Descripcion de la funcionalidad, observaciones y advertencias', '1', '1', '2020-09-02 12:47:30', '2021-01-16 20:29:07');
INSERT INTO `asistente` VALUES ('17', 'Grados', '25', 'Descripcion de la tarea de especial cuidado para el funcionamiento del sistema\'', 'cyan', '16', 'secretaria', 'Descripcion de la funcionalidad, observaciones y advertencias', '1', '1', '2020-09-02 12:47:55', '2021-01-16 20:29:07');
INSERT INTO `asistente` VALUES ('18', 'Grupos', '26', 'Descripcion de la tarea de especial cuidado para el funcionamiento del sistema\'', 'cyan', '17', 'secretaria', 'Descripcion de la funcionalidad, observaciones y advertencias', '1', '1', '2020-09-02 12:48:08', '2021-01-16 20:29:07');
INSERT INTO `asistente` VALUES ('19', 'Docente', '37', 'Descripcion de la tarea de especial cuidado para el funcionamiento del sistema\'', 'teal', '12', 'secretaria', 'Descripcion de la funcionalidad, observaciones y advertencias', '1', '1', '2020-09-02 12:48:30', '2021-01-16 20:29:06');
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
INSERT INTO `calendario` VALUES ('2', '2020-2021', '2020', '2020-10-14', '2021-07-13', null, '1', '1', '2020-06-10 21:06:08', '2021-01-16 17:16:17');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of contacto
-- ----------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of detalle_horario
-- ----------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of evaluacion
-- ----------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=199 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of foto
-- ----------------------------
INSERT INTO `foto` VALUES ('29', 'alumno id: 1', '1594261278_1.jpg', '2', '1', null, '1', '1', '2020-07-09 02:21:18', '2020-07-09 02:21:18');
INSERT INTO `foto` VALUES ('32', 'docente id: 1', '1594312119_1.jpg', '3', '1', null, '1', '1', '2020-07-09 16:28:39', '2020-07-09 16:28:39');
INSERT INTO `foto` VALUES ('60', 'alumno id: 1', '1594946193_1.jpg', '2', '1', null, '1', '1', '2020-07-17 00:36:33', '2020-07-17 00:36:33');
INSERT INTO `foto` VALUES ('71', 'pariente id: 1', '1595721572_1.jpg', '5', '1', null, '1', '1', '2020-07-25 23:59:32', '2020-07-25 23:59:32');
INSERT INTO `foto` VALUES ('78', 'cuenta id: 2', '1599229382_2.jpg', '4', '2', null, '1', '2', '2020-09-04 14:23:03', '2020-09-04 14:23:03');
INSERT INTO `foto` VALUES ('122', 'actividad id: 5', '1604152501_5.jpg', '6', '5', null, '1', '1', '2020-10-31 13:55:01', '2020-10-31 13:55:01');
INSERT INTO `foto` VALUES ('123', 'pregunta id: 98', '1604854203_98.jpg', '7', '98', null, '1', '1', '2020-11-08 16:50:03', '2020-11-08 16:50:03');
INSERT INTO `foto` VALUES ('124', 'pregunta id: 98', '1604855295_98.jpg', '7', '98', null, '1', '1', '2020-11-08 17:08:15', '2020-11-08 17:08:15');
INSERT INTO `foto` VALUES ('125', 'pregunta id: 98', '1604855339_98.jpg', '7', '98', null, '1', '1', '2020-11-08 17:08:59', '2020-11-08 17:08:59');
INSERT INTO `foto` VALUES ('126', 'pregunta id: 98', '1604855445_98.jpg', '7', '98', null, '1', '1', '2020-11-08 17:10:45', '2020-11-08 17:10:45');
INSERT INTO `foto` VALUES ('133', 'pregunta id: 103', '1604864650_103.jpg', '7', '103', null, '1', '1', '2020-11-08 19:44:10', '2020-11-08 19:44:10');
INSERT INTO `foto` VALUES ('136', 'cuenta id: 1', '1604884778_1.jpg', '4', '1', null, '1', '1', '2020-11-09 01:19:38', '2020-11-09 01:19:38');
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
INSERT INTO `foto` VALUES ('192', 'actividad id: 61', '1607271415_61.jpg', '6', '61', null, '1', '1', '2020-12-06 16:16:55', '2020-12-06 16:16:55');
INSERT INTO `foto` VALUES ('193', 'actividad id: 62', '1607271646_62.jpg', '6', '62', null, '1', '1', '2020-12-06 16:20:46', '2020-12-06 16:20:46');
INSERT INTO `foto` VALUES ('194', 'actividad id: 63', '1607272925_63.jpg', '6', '63', null, '1', '1', '2020-12-06 16:42:05', '2020-12-06 16:42:05');
INSERT INTO `foto` VALUES ('195', 'actividad id: 64', '1607273030_64.jpg', '6', '64', null, '1', '1', '2020-12-06 16:43:50', '2020-12-06 16:43:50');
INSERT INTO `foto` VALUES ('197', 'actividad id: 65', '1607273793_65.jpg', '6', '65', null, '1', '1', '2020-12-06 16:56:33', '2020-12-06 16:56:33');
INSERT INTO `foto` VALUES ('198', 'actividad id: 66', '1607273835_66.jpg', '6', '66', null, '1', '1', '2020-12-06 16:57:16', '2020-12-06 16:57:16');

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
INSERT INTO `grado_materia` VALUES ('7', '4', '16', null, '1', '1', '2020-08-18 18:00:57', '2020-08-18 18:00:57');

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
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
INSERT INTO `materia` VALUES ('20', 'Etica', 'ETI01', '1', null, null, '1', '1', null, null);
INSERT INTO `materia` VALUES ('21', 'Catedra de Paz', 'CATPAZ', '1', null, null, '1', '1', null, null);
INSERT INTO `materia` VALUES ('22', 'Filosofia', 'FILO01', '1', null, null, '1', '1', null, null);
INSERT INTO `materia` VALUES ('23', 'Informatica', 'INF01', '10', null, null, '1', '1', null, null);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of notificacion
-- ----------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=227 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
INSERT INTO `pagina` VALUES ('151', 'pagina1', '2', '4', '5', 'MT_G1_005.jpg', null, '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('152', 'pagina2', '2', '4', '6', 'MT_G1_006.jpg', null, '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('153', 'pagina3', '2', '4', '7', 'MT_G1_007.jpg', null, '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('154', 'pagina4', '2', '4', '8', 'MT_G1_008.jpg', null, '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('155', 'pagina5', '2', '4', '9', 'MT_G1_009.jpg', null, '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('156', 'pagina6', '2', '4', '10', 'MT_G1_010.jpg', null, '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('157', 'pagina7', '2', '4', '11', 'MT_G1_011.jpg', null, '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('158', 'pagina8', '2', '4', '12', 'MT_G1_012.jpg', null, '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('159', 'pagina9', '2', '4', '13', 'MT_G1_013.jpg', null, '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('160', 'pagina10', '2', '4', '14', 'MT_G1_014.jpg', null, '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('161', 'pagina11', '2', '4', '15', 'MT_G1_015.jpg', null, '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('162', 'pagina12', '2', '4', '16', 'MT_G1_016.jpg', null, '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('163', 'pagina13', '2', '4', '17', 'MT_G1_017.jpg', null, '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('164', 'pagina14', '2', '4', '18', 'MT_G1_018.jpg', null, '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('165', 'pagina15', '2', '4', '19', 'MT_G1_019.jpg', null, '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('166', 'pagina16', '2', '4', '20', 'MT_G1_020.jpg', null, '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('167', 'pagina17', '2', '4', '21', 'MT_G1_021.jpg', null, '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('168', 'pagina18', '2', '4', '22', 'MT_G1_022.jpg', null, '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('169', 'pagina19', '2', '4', '23', 'MT_G1_023.jpg', null, '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('170', 'pagina20', '2', '4', '24', 'MT_G1_024.jpg', null, '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('171', 'pagina21', '2', '4', '25', 'MT_G1_025.jpg', null, '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('172', 'pagina22', '2', '4', '26', 'MT_G1_026.jpg', null, '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('173', 'pagina23', '2', '4', '27', 'MT_G1_027.jpg', null, '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('174', 'pagina24', '2', '4', '28', 'MT_G1_028.jpg', null, '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('175', 'pagina25', '2', '4', '29', 'MT_G1_029.jpg', null, '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('176', 'pagina26', '2', '4', '30', 'MT_G1_030.jpg', null, '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('177', 'pagina27', '2', '4', '31', 'MT_G1_031.jpg', null, '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('178', 'pagina28', '2', '4', '32', 'MT_G1_032.jpg', null, '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('179', 'pagina29', '2', '4', '33', 'MT_G1_033.jpg', null, '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('180', 'pagina30', '2', '4', '34', 'MT_G1_034.jpg', null, '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('181', 'pagina31', '2', '4', '35', 'MT_G1_035.jpg', null, '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('182', 'pagina32', '2', '4', '36', 'MT_G1_036.jpg', null, '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('183', 'pagina33', '2', '4', '37', 'MT_G1_037.jpg', null, '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('184', 'pagina34', '2', '4', '38', 'MT_G1_038.jpg', null, '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('185', 'pagina35', '2', '4', '39', 'MT_G1_039.jpg', null, '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('186', 'pagina36', '2', '4', '40', 'MT_G1_040.jpg', null, '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('187', 'pagina37', '2', '4', '41', 'MT_G1_041.jpg', null, '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('188', 'pagina38', '2', '4', '42', 'MT_G1_042.jpg', null, '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('189', 'pagina39', '2', '4', '43', 'MT_G1_043.jpg', null, '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('190', 'pagina40', '2', '4', '44', 'MT_G1_044.jpg', null, '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('191', 'pagina41', '2', '4', '45', 'MT_G1_045.jpg', null, '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('192', 'pagina42', '2', '4', '46', 'MT_G1_046.jpg', null, '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('193', 'pagina43', '2', '4', '47', 'MT_G1_047.jpg', null, '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('194', 'pagina44', '2', '4', '48', 'MT_G1_048.jpg', null, '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('195', 'pagina45', '2', '4', '49', 'MT_G1_049.jpg', null, '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('196', 'pagina46', '2', '4', '50', 'MT_G1_050.jpg', null, '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('197', 'pagina47', '2', '4', '51', 'MT_G1_051.jpg', null, '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('198', 'pagina48', '2', '4', '52', 'MT_G1_052.jpg', null, '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('199', 'pagina49', '2', '4', '53', 'MT_G1_053.jpg', null, '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('200', 'pagina50', '2', '4', '54', 'MT_G1_054.jpg', null, '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('201', 'pagina51', '2', '4', '55', 'MT_G1_055.jpg', null, '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('202', 'pagina52', '2', '4', '56', 'MT_G1_056.jpg', null, '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('203', 'pagina53', '2', '4', '57', 'MT_G1_057.jpg', null, '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('204', 'pagina54', '2', '4', '58', 'MT_G1_058.jpg', null, '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('205', 'pagina55', '2', '4', '59', 'MT_G1_059.jpg', null, '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('206', 'pagina56', '2', '4', '60', 'MT_G1_060.jpg', null, '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('207', 'pagina57', '2', '4', '61', 'MT_G1_061.jpg', null, '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('208', 'pagina58', '2', '4', '62', 'MT_G1_062.jpg', null, '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('209', 'pagina59', '2', '4', '63', 'MT_G1_063.jpg', null, '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('210', 'pagina60', '2', '4', '64', 'MT_G1_064.jpg', null, '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('211', 'pagina61', '2', '4', '65', 'MT_G1_065.jpg', null, '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('212', 'pagina62', '2', '4', '66', 'MT_G1_066.jpg', null, '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('213', 'pagina63', '2', '4', '67', 'MT_G1_067.jpg', null, '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('214', 'pagina64', '2', '4', '68', 'MT_G1_068.jpg', null, '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('215', 'pagina65', '2', '4', '69', 'MT_G1_069.jpg', null, '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('216', 'pagina66', '2', '4', '70', 'MT_G1_070.jpg', null, '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('217', 'pagina67', '2', '4', '71', 'MT_G1_071.jpg', null, '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('218', 'pagina68', '2', '4', '72', 'MT_G1_072.jpg', null, '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('219', 'pagina69', '2', '4', '73', 'MT_G1_073.jpg', null, '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('220', 'pagina70', '2', '4', '74', 'MT_G1_074.jpg', null, '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('221', 'pagina71', '2', '4', '75', 'MT_G1_075.jpg', null, '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('222', 'pagina72', '2', '4', '76', 'MT_G1_076.jpg', null, '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('223', 'pagina73', '2', '4', '77', 'MT_G1_077.jpg', null, '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('224', 'pagina74', '2', '4', '78', 'MT_G1_078.jpg', null, '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('225', 'pagina75', '2', '4', '79', 'MT_G1_079.jpg', null, '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');
INSERT INTO `pagina` VALUES ('226', 'pagina76', '2', '4', '80', 'MT_G1_080.jpg', null, '1', '1', '2020-10-07 20:37:37', '2020-10-07 20:37:37');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of plan_detalle
-- ----------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=209 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
INSERT INTO `pregunta` VALUES ('188', 'Los cultivos, el ganado, los campesinos son característicos del paisaje cultural:', '40', '2', '0', '4.00', '1', null, '1', '1', '2020-12-06 14:17:52', '2020-12-06 14:17:52');
INSERT INTO `pregunta` VALUES ('189', '¿Qué es el clima?', '40', '2', '0', '4.00', '2', null, '1', '1', '2020-12-06 14:19:47', '2020-12-06 14:19:47');
INSERT INTO `pregunta` VALUES ('190', 'En las zonas cercanas al mar', '40', '2', '0', '4.00', '3', null, '1', '1', '2020-12-06 14:22:51', '2020-12-06 14:22:51');
INSERT INTO `pregunta` VALUES ('191', 'Cuales son las características de un paisaje geográfico?', '39', '3', '0', '4.00', '1', null, '1', '1', '2020-12-06 14:30:41', '2020-12-06 14:31:35');
INSERT INTO `pregunta` VALUES ('192', 'Serie de Montañas unidas entre si se llama:', '39', '2', '0', '4.00', '2', null, '1', '1', '2020-12-06 14:37:20', '2020-12-06 14:37:20');
INSERT INTO `pregunta` VALUES ('193', 'Zona de contacto entre la tierra y el mar se llama:', '39', '2', '0', '4.00', '3', null, '1', '1', '2020-12-06 14:58:01', '2020-12-06 14:58:01');
INSERT INTO `pregunta` VALUES ('194', 'Hace referencia a los objetos y es tangible.', '41', '2', '0', '4.00', '1', null, '1', '1', '2020-12-06 16:21:38', '2020-12-06 16:23:50');
INSERT INTO `pregunta` VALUES ('195', 'Es intangible, y contiene la esencia de la percepción del mundo.', '41', '2', '0', '3.00', '2', null, '1', '1', '2020-12-06 16:21:51', '2020-12-06 16:26:03');
INSERT INTO `pregunta` VALUES ('196', 'Proceso de pérdida de la cultura propia para adaptarse a otra', '41', '2', '0', '4.00', '3', null, '1', '1', '2020-12-06 16:26:48', '2020-12-06 16:26:48');
INSERT INTO `pregunta` VALUES ('197', '¿Qué es un mito?', '42', '2', '0', '4.00', '1', null, '1', '1', '2020-12-06 16:28:03', '2020-12-06 16:28:03');
INSERT INTO `pregunta` VALUES ('198', 'Relato que tiene como protagonistas a seres sobrenaturales o heroicos:', '42', '2', '0', '4.00', '2', null, '1', '1', '2020-12-06 16:28:50', '2020-12-06 16:28:50');
INSERT INTO `pregunta` VALUES ('199', '¿Qué podemos conocer a través de los mitos y leyendas? (puedes marcar mas de una opción)', '42', '3', '0', '4.00', '3', null, '1', '1', '2020-12-06 16:29:38', '2020-12-06 16:31:26');
INSERT INTO `pregunta` VALUES ('200', 'Las regiones naturales de Colombia son:', '43', '2', '0', '4.00', '1', null, '1', '1', '2020-12-06 16:45:01', '2020-12-06 16:45:01');
INSERT INTO `pregunta` VALUES ('201', 'La Amazonia esta conformado por su mayoria', '43', '2', '0', '4.00', '2', null, '1', '1', '2020-12-06 16:46:38', '2020-12-06 16:46:38');
INSERT INTO `pregunta` VALUES ('202', 'la región insular esta compuesta', '43', '2', '0', '4.00', '3', null, '1', '1', '2020-12-06 16:48:58', '2020-12-06 16:48:58');
INSERT INTO `pregunta` VALUES ('203', 'En este tipo de trabajo se requiere el uso del intelecto y de las ideas', '45', '2', '0', '4.00', '1', null, '1', '1', '2020-12-06 16:59:46', '2020-12-06 16:59:46');
INSERT INTO `pregunta` VALUES ('204', 'Es el tipo de trabajo que no necesita tener un mínimo de estudios o de conocimientos sobre un determinado tema.', '45', '2', '0', '4.00', '2', null, '1', '1', '2020-12-06 17:00:32', '2020-12-06 17:00:32');
INSERT INTO `pregunta` VALUES ('205', 'es el tipo de trabajo que se puede desarrollar desde cualquier sitio que disponga, generalmente, de conexión a Internet y un ordenador.', '45', '2', '0', '4.00', '3', null, '1', '1', '2020-12-06 17:01:17', '2020-12-06 17:01:17');
INSERT INTO `pregunta` VALUES ('206', 'Los tipos de dinero son:', '46', '3', '0', '4.00', '1', null, '1', '1', '2020-12-06 17:04:06', '2020-12-06 17:04:59');
INSERT INTO `pregunta` VALUES ('207', 'Son la características del dinero:', '46', '3', '0', '4.00', '2', null, '1', '1', '2020-12-06 17:05:54', '2020-12-06 17:06:35');
INSERT INTO `pregunta` VALUES ('208', 'Son tipos de impuestos:', '46', '3', '0', '4.00', '3', null, '1', '1', '2020-12-06 17:07:07', '2020-12-06 17:07:07');

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
INSERT INTO `prueba` VALUES ('39', 'El paisaje geográfico', '5', '19', '41', '1', '5', '12.00', null, '1', '1', null, '2020-12-06 14:58:01');
INSERT INTO `prueba` VALUES ('40', 'El clima y el paisaje', '5', '19', '41', '1', '5', '12.00', null, '1', '1', null, null);
INSERT INTO `prueba` VALUES ('41', 'Las expresiones de la cultura', '6', '19', '43', '1', '5', '11.00', null, '1', '1', null, '2020-12-06 16:26:48');
INSERT INTO `prueba` VALUES ('42', 'Mitos, costumbres y tradiciones', '6', '19', '43', '1', '5', '12.00', null, '1', '1', null, '2020-12-06 16:31:26');
INSERT INTO `prueba` VALUES ('43', 'Las regiones naturales de Colombia', '7', '19', '45', '1', '5', '12.00', null, '1', '1', null, '2020-12-06 16:48:58');
INSERT INTO `prueba` VALUES ('44', 'Las regiones naturales del mundo', '7', '19', '45', '1', '5', '12.00', null, '1', '1', null, null);
INSERT INTO `prueba` VALUES ('45', 'El trabajo', '8', '19', '47', '1', '5', '12.00', null, '1', '1', null, '2020-12-06 17:01:17');
INSERT INTO `prueba` VALUES ('46', 'El dinero y el intercambio económico', '8', '19', '47', '1', '5', '12.00', null, '1', '1', null, '2020-12-06 17:07:07');
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
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
INSERT INTO `recurso` VALUES ('35', '3', '6', '43', null, '1', '1', '2020-12-06 16:32:17', '2020-12-06 16:32:17');
INSERT INTO `recurso` VALUES ('36', '3', '6', '43', null, '1', '1', '2020-12-06 16:32:46', '2020-12-06 16:32:46');
INSERT INTO `recurso` VALUES ('37', '3', '7', '45', null, '1', '1', '2020-12-06 16:33:28', '2020-12-06 16:33:28');
INSERT INTO `recurso` VALUES ('38', '3', '7', '45', null, '1', '1', '2020-12-06 16:34:31', '2020-12-06 16:34:31');
INSERT INTO `recurso` VALUES ('39', '3', '8', '47', null, '1', '1', '2020-12-06 16:54:14', '2020-12-06 16:54:14');
INSERT INTO `recurso` VALUES ('40', '3', '8', '47', null, '1', '1', '2020-12-06 16:54:34', '2020-12-06 16:54:34');

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
) ENGINE=InnoDB AUTO_INCREMENT=578 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
INSERT INTO `respuesta` VALUES ('491', 'urbano', '188', '0', null, null, '1', '1', '2020-12-06 14:18:47', '2020-12-06 14:19:25');
INSERT INTO `respuesta` VALUES ('492', 'natural', '188', '0', null, null, '1', '1', '2020-12-06 14:18:55', '2020-12-06 14:19:25');
INSERT INTO `respuesta` VALUES ('493', 'ciudad', '188', '0', null, null, '1', '1', '2020-12-06 14:19:04', '2020-12-06 14:19:25');
INSERT INTO `respuesta` VALUES ('494', 'rural', '188', '1', null, null, '1', '1', '2020-12-06 14:19:12', '2020-12-06 14:19:25');
INSERT INTO `respuesta` VALUES ('495', 'El tiempo que predomina en un lugar a lo largo de muchos años.', '189', '1', null, null, '1', '1', '2020-12-06 14:21:53', '2020-12-06 14:22:24');
INSERT INTO `respuesta` VALUES ('496', 'El tiempo que predomina en un momento concreto.', '189', '0', null, null, '1', '1', '2020-12-06 14:22:02', '2020-12-06 14:22:24');
INSERT INTO `respuesta` VALUES ('497', 'La hora del reloj.', '189', '0', null, null, '1', '1', '2020-12-06 14:22:14', '2020-12-06 14:22:24');
INSERT INTO `respuesta` VALUES ('498', 'La cima de una montaña.', '189', '0', null, null, '1', '1', '2020-12-06 14:22:18', '2020-12-06 14:22:24');
INSERT INTO `respuesta` VALUES ('499', 'las temperaturas son más suaves.', '190', '1', null, null, '1', '1', '2020-12-06 14:23:07', '2020-12-06 14:23:36');
INSERT INTO `respuesta` VALUES ('500', 'las temperaturas son más altas.', '190', '0', null, null, '1', '1', '2020-12-06 14:23:15', '2020-12-06 14:23:36');
INSERT INTO `respuesta` VALUES ('501', 'las temperaturas son más agresivas.', '190', '0', null, null, '1', '1', '2020-12-06 14:23:24', '2020-12-06 14:23:36');
INSERT INTO `respuesta` VALUES ('502', 'las temperaturas son las mismas que en el interior.', '190', '0', null, null, '1', '1', '2020-12-06 14:23:32', '2020-12-06 14:23:36');
INSERT INTO `respuesta` VALUES ('503', 'Dinámicos', '191', '1', null, null, '1', '1', '2020-12-06 14:30:56', '2020-12-06 14:31:43');
INSERT INTO `respuesta` VALUES ('504', 'Localizables', '191', '1', null, null, '1', '1', '2020-12-06 14:31:05', '2020-12-06 14:31:44');
INSERT INTO `respuesta` VALUES ('505', 'Indivisibles', '191', '1', null, null, '1', '1', '2020-12-06 14:31:12', '2020-12-06 14:31:59');
INSERT INTO `respuesta` VALUES ('506', 'Lindos', '191', '0', null, null, '1', '1', '2020-12-06 14:31:19', '2020-12-06 14:31:19');
INSERT INTO `respuesta` VALUES ('507', 'Costa', '192', '0', null, null, '1', '1', '2020-12-06 14:37:35', '2020-12-06 14:37:57');
INSERT INTO `respuesta` VALUES ('508', 'Colina', '192', '0', null, null, '1', '1', '2020-12-06 14:37:42', '2020-12-06 14:37:57');
INSERT INTO `respuesta` VALUES ('509', 'Cordillera', '192', '1', null, null, '1', '1', '2020-12-06 14:37:49', '2020-12-06 14:37:57');
INSERT INTO `respuesta` VALUES ('510', 'Costa', '193', '1', null, null, '1', '1', '2020-12-06 14:58:13', '2020-12-06 15:24:34');
INSERT INTO `respuesta` VALUES ('511', 'Cordillera', '193', '0', null, null, '1', '1', '2020-12-06 15:02:19', '2020-12-06 15:24:34');
INSERT INTO `respuesta` VALUES ('512', 'Colina', '193', '0', null, null, '1', '1', '2020-12-06 15:22:15', '2020-12-06 15:24:34');
INSERT INTO `respuesta` VALUES ('521', 'Objetos', '194', '0', null, null, '1', '1', '2020-12-06 16:24:38', '2020-12-06 16:25:35');
INSERT INTO `respuesta` VALUES ('522', 'Cultura material', '194', '1', null, null, '1', '1', '2020-12-06 16:24:47', '2020-12-06 16:25:35');
INSERT INTO `respuesta` VALUES ('523', 'perdidos', '194', '0', null, null, '1', '1', '2020-12-06 16:24:54', '2020-12-06 16:25:35');
INSERT INTO `respuesta` VALUES ('524', 'Cultura inmaterial', '194', '0', null, null, '1', '1', '2020-12-06 16:25:33', '2020-12-06 16:25:35');
INSERT INTO `respuesta` VALUES ('525', 'Cultura inmaterial', '195', '1', null, null, '1', '1', '2020-12-06 16:26:12', '2020-12-06 16:26:35');
INSERT INTO `respuesta` VALUES ('526', 'Cultura suburbana', '195', '0', null, null, '1', '1', '2020-12-06 16:26:19', '2020-12-06 16:26:35');
INSERT INTO `respuesta` VALUES ('527', 'Culturalismo', '195', '0', null, null, '1', '1', '2020-12-06 16:26:25', '2020-12-06 16:26:35');
INSERT INTO `respuesta` VALUES ('528', 'Cultura material', '195', '0', null, null, '1', '1', '2020-12-06 16:26:32', '2020-12-06 16:26:35');
INSERT INTO `respuesta` VALUES ('529', 'Enculturación', '196', '0', null, null, '1', '1', '2020-12-06 16:26:58', '2020-12-06 16:27:23');
INSERT INTO `respuesta` VALUES ('530', 'Endoculturación', '196', '0', null, null, '1', '1', '2020-12-06 16:27:04', '2020-12-06 16:27:23');
INSERT INTO `respuesta` VALUES ('531', 'Cultura', '196', '0', null, null, '1', '1', '2020-12-06 16:27:10', '2020-12-06 16:27:23');
INSERT INTO `respuesta` VALUES ('532', 'Deculturación', '196', '1', null, null, '1', '1', '2020-12-06 16:27:17', '2020-12-06 16:27:23');
INSERT INTO `respuesta` VALUES ('533', 'Narración de carácter humano que busca explicar el origen del universo y los seres humanos', '197', '1', null, null, '1', '1', '2020-12-06 16:28:13', '2020-12-06 16:28:35');
INSERT INTO `respuesta` VALUES ('534', 'Narración que busca expresar una tradición', '197', '0', null, null, '1', '1', '2020-12-06 16:28:20', '2020-12-06 16:28:35');
INSERT INTO `respuesta` VALUES ('535', 'Narración que se transmite de forma oral y de generación en generación', '197', '0', null, null, '1', '1', '2020-12-06 16:28:30', '2020-12-06 16:28:35');
INSERT INTO `respuesta` VALUES ('536', 'Fábula', '198', '0', null, null, '1', '1', '2020-12-06 16:28:59', '2020-12-06 16:29:21');
INSERT INTO `respuesta` VALUES ('537', 'Leyenda', '198', '0', null, null, '1', '1', '2020-12-06 16:29:05', '2020-12-06 16:29:21');
INSERT INTO `respuesta` VALUES ('538', 'Novela', '198', '0', null, null, '1', '1', '2020-12-06 16:29:13', '2020-12-06 16:29:21');
INSERT INTO `respuesta` VALUES ('539', 'Mito', '198', '1', null, null, '1', '1', '2020-12-06 16:29:19', '2020-12-06 16:29:22');
INSERT INTO `respuesta` VALUES ('540', 'Tradiciones y folklore de un pueblo', '199', '1', null, null, '1', '1', '2020-12-06 16:30:08', '2020-12-06 16:31:31');
INSERT INTO `respuesta` VALUES ('541', 'Visión del mundo', '199', '1', null, null, '1', '1', '2020-12-06 16:30:16', '2020-12-06 16:31:32');
INSERT INTO `respuesta` VALUES ('542', 'Creencias de un país', '199', '1', null, null, '1', '1', '2020-12-06 16:30:25', '2020-12-06 16:31:33');
INSERT INTO `respuesta` VALUES ('543', 'La cultura', '199', '1', null, null, '1', '1', '2020-12-06 16:30:33', '2020-12-06 16:31:19');
INSERT INTO `respuesta` VALUES ('544', 'El tiempo', '199', '0', null, null, '1', '1', '2020-12-06 16:31:07', '2020-12-06 16:31:19');
INSERT INTO `respuesta` VALUES ('545', 'Andina, Amazónica, Orinoquia, Pacifica', '200', '0', null, null, '1', '1', '2020-12-06 16:45:15', '2020-12-06 16:45:43');
INSERT INTO `respuesta` VALUES ('546', 'Medellín, Bogotá, Chocó, Caribe, insular, Orinoquia', '200', '0', null, null, '1', '1', '2020-12-06 16:45:23', '2020-12-06 16:45:43');
INSERT INTO `respuesta` VALUES ('547', 'Andina, Amazónia, Orinoquia, Pacifica, Insular, Caribe', '200', '1', null, null, '1', '1', '2020-12-06 16:45:31', '2020-12-06 16:45:44');
INSERT INTO `respuesta` VALUES ('548', 'Aérea, Maritima, Terrertre, insular y junglar', '200', '0', null, null, '1', '1', '2020-12-06 16:45:39', '2020-12-06 16:45:43');
INSERT INTO `respuesta` VALUES ('549', 'Mar', '201', '0', null, null, '1', '1', '2020-12-06 16:46:51', '2020-12-06 16:48:40');
INSERT INTO `respuesta` VALUES ('550', 'Ríos', '201', '0', null, null, '1', '1', '2020-12-06 16:46:58', '2020-12-06 16:48:40');
INSERT INTO `respuesta` VALUES ('551', 'Selva', '201', '1', null, null, '1', '1', '2020-12-06 16:47:06', '2020-12-06 16:48:40');
INSERT INTO `respuesta` VALUES ('552', 'Desierto', '201', '0', null, null, '1', '1', '2020-12-06 16:47:15', '2020-12-06 16:48:40');
INSERT INTO `respuesta` VALUES ('553', 'Océanos', '202', '0', null, null, '1', '1', '2020-12-06 16:49:09', '2020-12-06 16:49:46');
INSERT INTO `respuesta` VALUES ('554', 'Islas', '202', '1', null, null, '1', '1', '2020-12-06 16:49:16', '2020-12-06 16:49:46');
INSERT INTO `respuesta` VALUES ('555', 'Cordilleras', '202', '0', null, null, '1', '1', '2020-12-06 16:49:31', '2020-12-06 16:49:46');
INSERT INTO `respuesta` VALUES ('556', 'Costas', '202', '0', null, null, '1', '1', '2020-12-06 16:49:39', '2020-12-06 16:49:46');
INSERT INTO `respuesta` VALUES ('557', 'Intelectual', '203', '1', null, null, '1', '1', '2020-12-06 16:59:55', '2020-12-06 17:00:13');
INSERT INTO `respuesta` VALUES ('558', 'Nocturno', '203', '0', null, null, '1', '1', '2020-12-06 17:00:02', '2020-12-06 17:00:13');
INSERT INTO `respuesta` VALUES ('559', 'Artesanal', '203', '0', null, null, '1', '1', '2020-12-06 17:00:09', '2020-12-06 17:00:13');
INSERT INTO `respuesta` VALUES ('560', 'Online', '204', '0', null, null, '1', '1', '2020-12-06 17:00:41', '2020-12-06 17:01:01');
INSERT INTO `respuesta` VALUES ('561', 'Semi-cualificado', '204', '0', null, null, '1', '1', '2020-12-06 17:00:49', '2020-12-06 17:01:01');
INSERT INTO `respuesta` VALUES ('562', 'Poco cualificado', '204', '1', null, null, '1', '1', '2020-12-06 17:00:55', '2020-12-06 17:01:01');
INSERT INTO `respuesta` VALUES ('563', 'Trabajo manual', '205', '0', null, null, '1', '1', '2020-12-06 17:01:26', '2020-12-06 17:01:44');
INSERT INTO `respuesta` VALUES ('564', 'Trabajo online', '205', '1', null, null, '1', '1', '2020-12-06 17:01:34', '2020-12-06 17:01:44');
INSERT INTO `respuesta` VALUES ('565', 'Trabajo artesanal', '205', '0', null, null, '1', '1', '2020-12-06 17:01:41', '2020-12-06 17:01:44');
INSERT INTO `respuesta` VALUES ('566', 'Metálico con bajo valor.', '206', '1', null, null, '1', '1', '2020-12-06 17:04:29', '2020-12-06 17:05:04');
INSERT INTO `respuesta` VALUES ('567', 'Tributario', '206', '1', null, null, '1', '1', '2020-12-06 17:04:36', '2020-12-06 17:05:05');
INSERT INTO `respuesta` VALUES ('568', 'Con valor asignado.', '206', '0', null, null, '1', '1', '2020-12-06 17:04:44', '2020-12-06 17:04:44');
INSERT INTO `respuesta` VALUES ('569', 'Papel con mayor valor.', '206', '0', null, null, '1', '1', '2020-12-06 17:04:52', '2020-12-06 17:04:52');
INSERT INTO `respuesta` VALUES ('570', 'Permite acceder a los bienes y servicios.', '207', '0', null, null, '1', '1', '2020-12-06 17:06:05', '2020-12-06 17:06:05');
INSERT INTO `respuesta` VALUES ('571', 'Un valor asignado y aceptado universalmente.', '207', '1', null, null, '1', '1', '2020-12-06 17:06:13', '2020-12-06 17:06:39');
INSERT INTO `respuesta` VALUES ('572', 'Relacionado con la oferta y la demanda.', '207', '1', null, null, '1', '1', '2020-12-06 17:06:20', '2020-12-06 17:06:40');
INSERT INTO `respuesta` VALUES ('573', 'Controlado por la política monetaria.', '207', '1', null, null, '1', '1', '2020-12-06 17:06:26', '2020-12-06 17:06:41');
INSERT INTO `respuesta` VALUES ('574', 'Servicios públicos.', '208', '0', null, null, '1', '1', '2020-12-06 17:07:33', '2020-12-06 17:07:33');
INSERT INTO `respuesta` VALUES ('575', 'A la renta.', '208', '1', null, null, '1', '1', '2020-12-06 17:07:40', '2020-12-06 17:07:59');
INSERT INTO `respuesta` VALUES ('576', 'General a la venta.', '208', '1', null, null, '1', '1', '2020-12-06 17:07:48', '2020-12-06 17:08:00');
INSERT INTO `respuesta` VALUES ('577', 'Predial', '208', '1', null, null, '1', '1', '2020-12-06 17:07:55', '2020-12-06 17:08:00');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of respuesta_alumno
-- ----------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=383 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of tema
-- ----------------------------
INSERT INTO `tema` VALUES ('1', 'Los Sentidos', '1', '', '7', '4', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('2', 'Luz y Sonido', '2', '', '7', '4', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('3', 'EL Cuerpo Humano', '3', '', '7', '4', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('4', 'La Materia', '4', '', '7', '4', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('5', 'Los Recursos Naturales', '5', '', '7', '4', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('6', 'Viajes por nuestro cuerpo, forma de ser, familia y región.', '1', '', '19', '4', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('7', '¿Quíen soy yo?', '2', '', '19', '4', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('8', '¿Cómo es mi cuerpo?', '3', '', '19', '4', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('9', '¿Cómo mi cuerpo me hace único?', '4', '', '19', '4', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('10', '¿Cómo es mi forma de ser?', '5', '', '19', '4', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('11', '¿Qué es la familia?', '6', '', '19', '4', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('12', '¿Cómo es tu familia?', '7', '', '19', '4', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('13', '¿Cómo debe ser la familia?', '8', '', '19', '4', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('14', '¿Las familias son diversas?', '9', '', '19', '4', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('15', '¿Qué es el cuidado?', '10', '', '19', '4', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('16', '¿Quiénes son mis vecinos?', '11', '', '19', '4', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('17', '¿Qué hacen mis vecinos?', '12', '', '19', '4', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('18', '¿Las ocupaciones son cosas de hombes y mujeres?', '13', '', '19', '4', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('19', '¿Cómo es mi región?', '14', '', '19', '4', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('20', '¿Por qué es importante cuidar la naturaleza?', '15', '', '19', '4', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('21', '¿Cómo es la gente de mi región?', '16', '', '19', '4', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('22', 'Las vocales', '1', '', '15', '4', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('23', 'Las consonantes: m, p, s, 1, t, silabas y sus inversos', '2', '', '15', '4', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('24', 'Lectura e intrepretación de textos', '3', '', '15', '4', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('25', 'Consonantes: n, d, c, f, g, b, j, r, y sus inversos.', '4', '', '15', '4', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('26', 'Lectura de diferentes textos narrativos: cuentos y fábulas', '5', '', '15', '4', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('27', 'El lenguaje de los gestos', '6', '', '15', '4', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('28', 'Letras h, ñ, v, y, z, x, w, q, k', '7', '', '15', '4', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('29', 'La conversación', '8', '', '15', '4', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('30', 'Hagamos cuenta con números menores', '1', '', '14', '4', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('31', 'Para contar hagamos grupos de 10', '2', '', '14', '4', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('32', 'Hagamos cuenta', '3', '', '14', '4', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('33', 'Hagamos cuenta sin dibujar pelotas y puntos', '4', '', '14', '4', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('34', 'Hacia la idea de longitud', '5', '', '14', '4', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('35', 'cálculos y escrituras hasta 99', '6', '', '14', '4', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('36', 'Introducción a la posicionalidad', '7', '', '14', '4', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('37', 'Introducción al número en rango O - 999', '8', '', '14', '4', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('38', 'Introducción a la simetría', '9', '', '14', '4', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('39', 'Algo más sobre medir', '10', '', '14', '4', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('40', 'Seres de la Naturaleza', '1', '', '7', '5', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('41', 'Los alimentos', '2', '', '7', '5', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('42', '¿cuáles son los ciclos de la vida?', '3', '', '7', '5', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('43', 'Movimiento de los Seres Vivos', '4', '', '7', '5', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('44', 'Relaciones de los Seres Vivos', '5', '', '7', '5', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('45', 'Propiedades de la Materia', '6', '', '7', '5', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('46', 'Recursos Naturales', '7', '', '7', '5', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('47', 'La Tierra', '8', '', '7', '5', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('48', '¿Quién soy yo?', '1', '', '19', '5', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('49', '¿Quiénes son las personas con las que convivimos?', '2', '', '19', '5', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('50', 'Nuestro entorno y el municipio', '3', '', '19', '5', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('51', 'El paisaje geografico y la vida de las comunidades', '4', '', '19', '5', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('52', 'Las comunidades y su historia', '5', '', '19', '5', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('53', 'Juguemos con las palabras', '1', '', '15', '5', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('54', '¿Para qué sirven las palabras?', '2', '', '15', '5', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('55', 'Lo que nombran las palabras', '3', '', '15', '5', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('56', 'Aprender jugando', '4', '', '15', '5', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('57', 'Aprender haciendo', '5', '', '15', '5', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('58', 'Aprender creando', '6', '', '15', '5', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('59', 'El diálogo', '7', '', '15', '5', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('60', '¿mensajes sin palabras?', '8', '', '15', '5', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('61', 'La biblioteca', '9', '', '15', '5', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('62', 'Más sobre los números hasta 999', '1', '', '14', '5', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('63', 'Algunos sólidos y figuras planas', '2', '', '14', '5', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('64', 'Más sobre medidas de longitud', '3', '', '14', '5', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('65', 'Hacia la idea de longitud', '4', '', '14', '5', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('66', 'Cálculos y escrituras hasta 99', '5', '', '14', '5', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('67', 'Introducción a la posisionalidad', '6', '', '14', '5', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('68', 'Introducción al número en rango del O - 999', '7', '', '14', '5', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('69', 'Introducción a la simetría', '8', '', '14', '5', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('70', 'Algo más sobre medir', '9', '', '14', '5', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('71', 'Clasificación de los Seres Vivos', '1', '', '7', '6', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('72', 'La Alimentación en los Seres Vivos', '2', '', '7', '6', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('73', 'Electricidad y Magnetismo', '3', '', '7', '6', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('74', 'Cambios en el Ser Humano', '4', '', '7', '6', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('75', 'Movimiento del Ser Humano', '5', '', '7', '6', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('76', 'Relación de los Organismos con el Ambiente', '6', '', '7', '6', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('77', 'Los Cambios de la Materia', '7', '', '7', '6', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('78', 'El Ciclo del Agua y la Formación del Suelo', '8', '', '7', '6', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('79', 'El Sistema Sol-Tierra-Luna', '9', '', '7', '6', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('80', 'El rio del tiempo', '1', '', '19', '6', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('81', '¿Cómo orientarnos y ubicarnos geograficamente?', '2', '', '19', '6', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('82', 'Colombia y sus departamentos', '3', '', '19', '6', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('83', 'La cultura y yo', '4', '', '19', '6', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('84', 'Nosotros y los otros', '5', '', '19', '6', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('85', 'Convivir juntos', '6', '', '19', '6', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('86', 'Vamos a relactar', '1', '', '15', '6', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('87', 'Vamos a describir', '2', '', '15', '6', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('88', 'Vamos a analizar', '3', '', '15', '6', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('89', 'EL significado de las palabras', '4', '', '15', '6', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('90', 'Algunos secretos de las palabras', '5', '', '15', '6', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('91', 'Las palabras y las personas', '6', '', '15', '6', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('92', 'habitemos la escena', '7', '', '15', '6', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('93', 'habitemos la letra', '8', '', '15', '6', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('94', 'habitemos la imagen', '9', '', '15', '6', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('95', 'Algo más sobre las operaciones en adicción y sustracción', '1', '', '14', '6', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('96', 'La operación multiplicación y relaciones multiplicativas', '2', '', '14', '6', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('97', 'Otros sistemas de ubicación', '3', '', '14', '6', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('98', 'Algo sobre clasificaciones', '4', '', '14', '6', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('99', 'Arreglos y conteos', '5', '', '14', '6', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('100', 'Nuevamente el sistema de númeración 7', '6', '', '14', '6', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('101', 'Avanzando en lo multiplicativo', '7', '', '14', '6', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('102', 'Avanzando en lo espacial', '8', '', '14', '6', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('103', 'Algo más sobre perimetros y áreas', '9', '', '14', '6', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('104', 'Los Reinos de la Naturales', '1', '', '7', '7', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('105', 'Nutrición y Salud', '2', '', '7', '7', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('106', 'Reproducción en los Seres Vivos', '3', '', '7', '7', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('107', 'Especie y Reproducción', '4', '', '7', '7', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('108', 'Movimiento de los Cuerpos', '5', '', '7', '7', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('109', 'Elementos, Compuesto y Mezclas', '6', '', '7', '7', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('110', 'Contaminación', '7', '', '7', '7', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('111', 'La Tierra y el Sistema Solar', '8', '', '7', '7', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('112', 'El largo camino de la humanidad', '1', '', '19', '7', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('113', 'El encuentro entre dos mundos', '2', '', '19', '7', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('114', 'Los españoles conquistaron nuestro país', '3', '', '19', '7', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('115', 'La diversidad étnica en Colombia', '4', '', '19', '7', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('116', 'El relieve y el clima de Colombia', '5', '', '19', '7', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('117', 'De viajes por las regiones naturales de Colombia y el mundo', '6', '', '19', '7', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('118', 'Los conflictos y los dilemas en nuestras vidas', '7', '', '19', '7', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('119', 'Los ciudadanos y las instituciones', '8', '', '19', '7', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('120', 'A divertirse en serio', '1', '', '15', '7', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('121', 'El diseño y las palabras', '2', '', '15', '7', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('122', 'Secretos de la escritura', '3', '', '15', '7', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('123', 'Las palabras y los seres humanos', '4', '', '15', '7', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('124', 'Los eventos y el significado', '5', '', '15', '7', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('125', 'Las relaciones y el significado', '6', '', '15', '7', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('126', 'Las personas se relacionan usando las palabras', '7', '', '15', '7', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('127', 'Las palabras se relacionan entre sí', '8', '', '15', '7', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('128', 'Las palabras se relacionan con las imágenes', '9', '', '15', '7', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('129', 'Nuevamente el sistema decimal de numeración', '1', '', '14', '7', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('130', 'procedimientos de multiplicar y dividir', '2', '', '14', '7', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('131', 'Relaciones multiplicativas y fraccionarios', '3', '', '14', '7', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('132', 'Profundicemos sobre algunas propiedades de las figuras', '4', '', '14', '7', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('133', 'Usemos los decimales', '5', '', '14', '7', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('134', 'Perímetros, áreas y volúmenes', '6', '', '14', '7', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('135', 'Algo más sobre arreglos', '7', '', '14', '7', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('136', 'Algo más sobre variación de magnitudes', '8', '', '14', '7', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('137', 'Algo más sobre las figuras', '9', '', '14', '7', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('138', 'Medidas de ángulos', '10', '', '14', '7', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('139', 'Estructura de los Seres Vivos', '1', '', '7', '8', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('140', '¿Cómo Funciona el Cuerpo Humano?', '2', '', '7', '8', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('141', 'Los Ecosistemas', '3', '', '7', '8', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('142', 'Energía', '4', '', '7', '8', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('143', 'Conservación de los Recursos Naturales', '5', '', '7', '8', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('144', 'El Universo', '6', '', '7', '8', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('145', 'La Metodologia Cientifica', '7', '', '7', '8', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('146', 'La colonia y la independencia en nuestro país', '1', '', '19', '8', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('147', 'Los movimientos sociales en Colombia', '2', '', '19', '8', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('148', 'Las normas, las leyes y la constitución', '3', '', '19', '8', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('149', 'La diversidad étnica y cultural de Colombia', '4', '', '19', '8', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('150', 'La Colombia que vivimos', '5', '', '19', '8', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('151', 'El país que construimos', '6', '', '19', '8', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('152', 'La importancia de la economía en nuestras vidas', '7', '', '19', '8', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('153', 'Las decisiones importantes en nuestras vidas', '8', '', '19', '8', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('154', '!Expresemonos con propiedad!', '1', '', '15', '8', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('155', 'El orden de las palabras', '2', '', '15', '8', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('156', 'El texto es más que las oraciones', '3', '', '15', '8', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('157', 'La información transforma la forma como nos comunicamos', '4', '', '15', '8', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('158', 'Entendamos y disfrutemos la literatura', '5', '', '15', '8', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('159', 'Palabras contextos y propósitos', '6', '', '15', '8', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('160', 'Escribamos cada ves mejor', '7', '', '15', '8', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('161', 'Los pictogramas', '8', '', '15', '8', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('162', 'Actividades libres', '9', '', '15', '8', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('163', 'Nuevamente cómo varían magnitudes', '1', '', '14', '8', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('164', 'Algo más sobre fraccionarios', '2', '', '14', '8', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('165', 'Algoritmos de la multiplicacción y división', '3', '', '14', '8', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('166', 'Una nueva operación', '4', '', '14', '8', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('167', 'Conozcamos nuevas relaciones entre las figuras', '5', '', '14', '8', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('168', 'Algo más sobre los decimales', '6', '', '14', '8', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('169', 'Algo más sobre razones y proporciones', '7', '', '14', '8', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('170', 'Nuevamente sobre variacional', '8', '', '14', '8', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('171', 'Algo más sobre organización de datos y arreglos', '9', '', '14', '8', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('172', 'Relaciones consigo mismo', '1', '', '20', '9', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('173', 'Tus relaciones con los demás', '2', '', '20', '9', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('174', 'Ser honesto y tolerante', '3', '', '20', '9', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('175', 'Ética ecológica, expresión y perdón', '4', '', '20', '9', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('176', 'Aspectos generales de la educación física', '1', '', '17', '9', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('177', 'Cuidar la vida', '2', '', '17', '9', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('178', 'Técnicas de movimiento', '3', '', '17', '9', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('179', 'La expresión corporal artistica', '4', '', '17', '9', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('180', 'Entrada al mundo del lenguaje', '1', '', '15', '9', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('181', 'Vivo mi lengua', '2', '', '15', '9', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('182', 'Conozco mi lengua', '3', '', '15', '9', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('183', 'Construir el mundo a través de palabras', '4', '', '15', '9', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('184', 'Construyo Sistemas de números', '1', '', '14', '9', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('185', 'Mido y Construyo', '2', '', '14', '9', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('186', 'Proporcionalidad', '3', '', '14', '9', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('187', 'Sistemas de datos', '4', '', '14', '9', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('188', 'La Ciencia y los seres vivos', '1', '', '7', '9', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('189', 'Conociendo los seres de la naturaleza', '2', '', '7', '9', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('190', 'Los seres vivos y sus relaciones', '3', '', '7', '9', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('191', 'El ambiente y los seres vivos', '4', '', '7', '9', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('192', 'El ser humano y su entorno', '1', '', '19', '9', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('193', '¿De qué manera el ser humano transforma el medio?', '2', '', '19', '9', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('194', '¿Cómo se han transformado las estructuras de poder?', '3', '', '19', '9', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('195', '¿Qué aprendemos de las sociedades de ayer y de hoy?', '4', '', '19', '9', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('196', 'Vamos a danzar', '1', 'D', '18', '9', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('197', 'La danza es un mundo', '2', 'D', '18', '9', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('198', 'Descubramos el mundo de la música', '3', 'M', '18', '9', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('199', 'Conozcamos la música del mundo', '4', 'M', '18', '9', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('200', 'Títeres en escena', '5', 'T', '18', '9', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('201', 'El mimo', '6', 'T', '18', '9', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('202', 'A pintar, a crear y a jugar', '7', 'V', '18', '9', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('203', 'Exploremos el espacio y el diseño', '8', 'V', '18', '9', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('204', 'La ciencia y la vida.', '1', '', '7', '10', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('205', 'Los seres de la naturaleza.', '2', '', '7', '10', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('206', 'La vida y el universo.', '3', '', '7', '10', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('207', 'El ambiente.', '4', '', '7', '10', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('208', 'El clima y su relación con el ser humano', '1', '', '19', '10', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('209', 'Geografía física y humana de Europa América', '2', '', '19', '10', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('210', 'Imperios en Europa', '3', '', '19', '10', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('211', 'Imperios en América', '4', '', '19', '10', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('212', 'Vamos a danzar', '1', 'D', '18', '10', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('213', 'La danza es un mundo', '2', 'D', '18', '10', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('214', 'Descubramos el mundo de la música', '3', 'M', '18', '10', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('215', 'Conozcamos la música del mundo', '4', 'M', '18', '10', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('216', 'Títeres en escena', '5', 'T', '18', '10', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('217', 'El mimo', '6', 'T', '18', '10', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('218', 'A pintar, a crear y a jugar', '7', 'V', '18', '10', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('219', 'Exploremos el espacio y el diseño', '8', 'V', '18', '10', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('220', 'Participación e inclusión social', '1', '', '20', '10', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('221', 'Mediación, desarrollo y territorios para la articipación', '2', '', '20', '10', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('222', 'Prevención de adicciones, Ley de Infancia y Adolescencia, y participación', '3', '', '20', '10', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('223', 'Comunicación y concertación, mecanismos de participación, y la paz', '4', '', '20', '10', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('224', 'Cómo responde mi cuerpo al ejercicio', '1', '', '17', '10', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('225', 'El ser humano y su entorno Técnicas de movimiento en equipo: juegos', '2', '', '17', '10', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('226', 'predeportivos de pelota', '3', '', '17', '10', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('227', 'Influencia de la danza en la sociedad', '4', '', '17', '10', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('228', 'Alistando el equipaje para recorrer mi lengua', '1', '', '15', '10', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('229', 'Viajando hacia el mundo de la lengua y la literatura', '2', '', '15', '10', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('230', 'Viviendo las estaciones de mi viaje por la lengua', '3', '', '15', '10', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('231', 'Me bajo en esta estación, pero el viaje por la lengua continu28', '4', '', '15', '10', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('232', 'El sistema de los números enteros', '1', '', '14', '10', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('233', 'Construyo y Compruebo', '2', '', '14', '10', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('234', 'Introducción al Álgebra', '3', '', '14', '10', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('235', 'Estadística Descriptiva y Probabilidad', '4', '', '14', '10', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('236', 'Los seres vivos como organismos dinámicos', '1', '', '7', '11', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('237', 'Cambios químicos en la materia, salud sexual y reproductiva', '2', '', '7', '11', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('238', 'Los procesos físicos, químicos y biológicos y los seres vivos', '3', '', '7', '11', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('239', 'La defensa de los organismos', '4', '', '7', '11', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('240', 'Geografía', '1', '', '19', '11', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('241', 'América Colonial', '2', '', '19', '11', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('242', 'La época de las revoluciones', '3', '', '19', '11', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('243', 'Colombia en el siglo XIX', '4', '', '19', '11', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('244', 'Vamos a danzar', '1', 'D', '18', '11', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('245', 'La danza es un mundo', '2', 'D', '18', '11', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('246', 'Descubramos el mundo de la música', '3', 'M', '18', '11', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('247', 'Conozcamos la música del mundo', '4', 'M', '18', '11', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('248', 'Títeres en escena', '5', 'T', '18', '11', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('249', 'El mimo', '6', 'T', '18', '11', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('250', 'A pintar, a crear y a jugar', '7', 'V', '18', '11', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('251', 'Exploremos el espacio y el diseño', '8', 'V', '18', '11', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('252', 'Yo soy, teres, todos juntos somos', '1', '', '20', '11', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('253', 'Viviendo y conviviendo', '2', '', '20', '11', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('254', 'Me esfuerzo por comprender y comunicarme bien', '3', '', '20', '11', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('255', 'Tengo derechos y asumo deberes', '4', '', '20', '11', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('256', 'Actividad física en la vida cotidiana grado 8º', '1', '', '17', '11', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('257', 'La gimnasia', '2', '', '17', '11', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('258', 'Actividades deportivas de conjunto', '3', '', '17', '11', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('259', 'La danza folclórica', '4', '', '17', '11', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('260', 'La palabra hablada', '1', '', '15', '11', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('261', 'La palabra narrada', '2', '', '15', '11', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('262', 'Exponiendo se aprende', '3', '', '15', '11', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('263', 'La palabra argumentada', '4', '', '15', '11', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('264', 'Sistemas de los números racionales', '1', '', '14', '11', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('265', 'Geometría', '2', '', '14', '11', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('266', 'Álgebra', '3', '', '14', '11', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('267', 'Estadística y probabilidad', '4', '', '14', '11', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('268', 'Características genéticas de los seres vivos', '1', '', '7', '12', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('269', 'Los procesos de la evolución', '2', '', '7', '12', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('270', 'Aspectos básicos de taxonomía', '3', '', '7', '12', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('271', 'La energía del planeta y los procesos de adaptación', '4', '', '7', '12', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('272', 'Imperialismo', '1', '', '19', '12', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('273', 'Un mundo conflictivo entre 1930 y 1950', '2', '', '19', '12', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('274', 'La tensión entre capitalismo y socialismo hasta la década de los 80', '3', '', '19', '12', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('275', 'Transformaciones desde la década de los años 80', '4', '', '19', '12', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('276', 'Vamos a danzar', '1', 'D', '18', '12', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('277', 'La danza es un mundo', '2', 'D', '18', '12', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('278', 'Descubramos el mundo de la música', '3', 'M', '18', '12', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('279', 'Conozcamos la música del mundo', '4', 'M', '18', '12', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('280', 'Títeres en escena', '5', 'T', '18', '12', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('281', 'El mimo', '6', 'T', '18', '12', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('282', 'A pintar, a crear y a jugar', '7', 'V', '18', '12', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('283', 'Exploremos el espacio y el diseño', '8', 'V', '18', '12', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('284', 'Me comunico responsablemente', '1', '', '20', '12', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('285', 'Contribuyo en la construcción de una sociedad pacífica', '2', '', '20', '12', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('286', 'Tomo decisiones responsables', '3', '', '20', '12', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('287', 'Reclamo mis derechos y cumplo con mis deberes', '4', '', '20', '12', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('288', 'Actividad física y salud', '1', '', '17', '12', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('289', 'Deportes de conjunto', '2', '', '17', '12', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('290', 'Manifestaciones recreativas', '3', '', '17', '12', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('291', 'Coreografías de danza folclórica', '4', '', '17', '12', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('292', 'Expresamos lo que somos', '1', '', '15', '12', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('293', 'Expresamos ideas, saberes y sentimientos', '2', '', '15', '12', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('294', 'Aprendemos hablando y escribiendo', '3', '', '15', '12', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('295', 'Convencemos y nos convencen con buenos argumentos', '4', '', '15', '12', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('296', 'Conjunto de los números reales', '1', '', '14', '12', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('297', 'Geometría', '2', '', '14', '12', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('298', 'Funciones: Lineal, cuadrática, exponencial y logarítmica, y sistemas lineales', '3', '', '14', '12', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('299', 'Estadística', '4', '', '14', '12', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('300', 'El poder judicial', '0', '', '21', '13', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('301', 'El ministerio público', '2', '', '21', '13', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('302', 'Administración de justicia', '3', '', '21', '13', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('303', 'El debido proceso', '4', '', '21', '13', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('304', 'Relaciones de masas en las reacciones químicas', '1', '', '10', '13', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('305', 'Reacciones acuosas', '2', '', '10', '13', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('306', 'Gases y sus leyes', '3', '', '10', '13', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('307', 'Mundo físico', '1', '', '9', '13', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('308', 'Magnitudes física', '2', '', '9', '13', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('309', 'Cinematica del movimiento retilineo', '3', '', '9', '13', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('310', 'Cinematica del movimiento en el plano', '4', '', '9', '13', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('311', 'Dinamica', '5', '', '9', '13', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('312', 'Trabajo y energía', '6', '', '9', '13', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('313', 'Estatica', '7', '', '9', '13', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('314', 'Ángulos', '1', '', '14', '13', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('315', 'Triángulos', '2', '', '14', '13', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('316', 'Solución de Triángulos rectángulos', '3', '', '14', '13', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('317', 'Concepto de: Lenguaje, lengua, dialecto', '1', '', '15', '13', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('318', 'Origen y evolución de la lengua española.', '2', '', '15', '13', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('319', 'Literatura española del medioevo.', '3', '', '15', '13', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('320', 'Tipología textual.', '4', '', '15', '13', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('321', 'Literatura del siglo de oro', '5', '', '15', '13', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('322', 'El informe escrito, la reseña, el ensayo', '6', '', '15', '13', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('323', 'Novela de la posguerra, autores en el exilio,', '7', '', '15', '13', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('324', 'Novela contemporánea', '8', '', '15', '13', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('325', 'Figuras literarias', '9', '', '15', '13', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('326', 'Arcaísmos, neologismos, Regionalismos', '10', '', '15', '13', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('327', 'Nociones preliminares de filosofia', '1', '', '22', '13', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('328', 'Filosofia universal', '2', '', '22', '13', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('329', 'Cosmologia', '3', '', '22', '13', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('330', 'La psicologia', '4', '', '22', '13', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('331', 'Antropologia', '5', '', '22', '13', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('332', 'Epistemologia', '6', '', '22', '13', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('333', 'Gnoseologia Qg Unidad: La politica', '7', '', '22', '13', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('334', 'lntrodución a las marcas de diseño grafico', '1', '', '23', '13', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('335', 'Imagen corporativa', '2', '', '23', '13', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('336', 'Historia del diseño de marcas', '3', '', '23', '13', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('337', 'lntrodución al CorelDraw', '4', '', '23', '13', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('338', 'lntrodución a adobe lllustrator', '5', '', '23', '13', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('339', 'El derecho', '1', '', '21', '14', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('340', 'Derechos humanos', '2', '', '21', '14', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('341', 'Derecho internacional humanitario', '3', '', '21', '14', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('342', 'La paz armada', '4', '', '21', '14', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('343', 'Los tratados de paz', '5', '', '21', '14', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('344', 'verificación y evaluacion de los tratados de paz', '6', '', '21', '14', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('345', 'El Átomo de carbono', '1', '', '10', '14', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('346', 'Formulas químicas en alcanos', '2', '', '10', '14', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('347', 'Formulas químicas en alquenos', '3', '', '10', '14', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('348', 'Formulas químicas en aluinos', '4', '', '10', '14', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('349', 'Isomería', '5', '', '10', '14', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('350', 'Aromaticos', '6', '', '10', '14', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('351', 'Alcoholes y fenoles', '7', '', '10', '14', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('352', 'Calor y temperatura', '1', '', '9', '14', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('353', 'Mecanica de fluidos', '2', '', '9', '14', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('354', 'Carga electrica y Campo electrico', '3', '', '9', '14', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('355', 'Corriente electrica', '4', '', '9', '14', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('356', 'Magnetismo', '5', '', '9', '14', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('357', 'Optica y sonido', '6', '', '9', '14', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('358', 'Movimiento ondulatorio', '7', '', '9', '14', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('359', 'Optica y radiación electromagnetica', '8', '', '9', '14', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('360', 'Épocas literarias', '1', '', '15', '14', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('361', 'Características de la comunicación humana', '2', '', '15', '14', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('362', 'Medios de comunicación y otros medios simbólicos', '3', '', '15', '14', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('363', 'Literatura del barroco, neoclasicismo, romanticismo y realismo.', '4', '', '15', '14', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('364', 'Texto científico-técnico', '5', '', '15', '14', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('365', 'Escritura de palabras compuestas, derivadas y acrónimos', '6', '', '15', '14', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('366', 'Literatura simbolismo y vanguardias', '7', '', '15', '14', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('367', 'Lengua materna y segundas lenguas', '8', '', '15', '14', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('368', 'El ensayo', '9', '', '15', '14', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('369', 'La literatura contemporánea.', '10', '', '15', '14', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('370', 'Folosofia medieval y del renacimiento', '1', '', '22', '14', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('371', 'Filosofia moderna', '2', '', '22', '14', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('372', 'Filosofia contemporanea', '3', '', '22', '14', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('373', 'lntrodución a Photoshop', '1', '', '9', '14', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('374', 'Conceptos básicos de Photoshop', '2', '', '9', '14', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('375', 'Retoque fotografico', '3', '', '9', '14', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('376', 'Creación de animaciones en photoshop', '4', '', '9', '14', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('377', 'Conceptos básicos y entorno de flash', '5', '', '9', '14', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('378', 'Clip de película. Trabajar con filtros', '6', '', '9', '14', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('379', 'Desigualdades e Inecuaciones e Intervalos', '1', '', '14', '14', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('380', 'Teoría de Funciones', '2', '', '14', '14', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('381', 'Limite y Continuidad', '3', '', '14', '14', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');
INSERT INTO `tema` VALUES ('382', 'Sucesiones y sumatoria', '4', '', '14', '14', '1', '1', '1', '1', '2020-12-22 10:40:14', '2020-12-22 10:40:14');

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
INSERT INTO `usuario` VALUES ('104', '1', 'yustiz luis', 'yluis', '$2y$10$b6aRxCn7ojM4YBTH7VNhmOv6a2zkH/x/iCAelx1M3NXpRhV2LKfG6', 'lyustiz@gmail.com', null, '2', '1', null, '9lRfdaVW', null, null, null, '1', '1', '2020-08-21 01:04:42', '2020-08-21 01:04:42');

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
INSERT INTO `usuario_perfil` VALUES ('107', '104', '2', null, '1', '1', '2020-08-21 01:04:42', '2020-08-21 01:04:42');
INSERT INTO `usuario_perfil` VALUES ('313', '2', '3', null, '1', '1', '2020-08-21 00:41:06', '2020-08-21 00:41:08');

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
ORDER BY CONCAT(alumno.nb_apellido,' ', alumno.nb_apellido2,' ',alumno.nb_nombre,' ',alumno.nb_nombre2) ASC ; ;

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
	) ASC ; ;

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
	) ASC ; ;

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
INNER JOIN ciudad ON docente.id_ciudad = ciudad.id ; ;

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
INNER JOIN area_estudio ON materia.id_area_estudio = area_estudio.id ; ;

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
WHERE calendario.id = (SELECT id_calendario from colegio where id = 1) ; ;

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
INNER JOIN calendario ON grupo.id_calendario = calendario.id ; ;

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
area_estudio ; ;

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
INNER JOIN `status` ON usuario.id_status = `status`.id ; ;

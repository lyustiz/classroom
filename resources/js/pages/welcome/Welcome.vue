<template>
  <div class="">

       <v-navigation-drawer
        color="blue darken-2"
        permanent
        dark
        app
        height="100vh"
      >
        <v-container fluid class="pb-5">

            <v-row no-gutters align="end" class="menu-welcome">

                <v-col>

                    <v-alert border="bottom" color="blue darken-2" class="display-1 font-weight-thin text-center ">
                        VIRTUALiN
                    </v-alert>

                    <v-list>
                        <v-list-item-group v-model="item" color="">
                            <v-list-item 
                            v-for="(item, i) in items"
                            :key="i"
                             @click="$vuetify.goTo( '#'+item.target, options)"
                            >
                            <v-list-item-content>
                                <v-list-item-title v-text="item.text" class="text-center"></v-list-item-title>
                            </v-list-item-content>
                            </v-list-item>
                        </v-list-item-group>

                        

                    </v-list>
                    <v-btn block color="orange" dark @click="navegateTo('/login')">
                        <v-icon class="mx-1">mdi-login-variant</v-icon> INGRESAR
                    </v-btn>

                </v-col>

            </v-row>
            
        </v-container>
                    
       </v-navigation-drawer>

        <v-container fluid>

            <v-row no-gutters>
                <v-col >
                    <v-img src="images/banner.png" aspect-ratio="1.8" co contain id="inicio"></v-img>
                </v-col>
            </v-row>

            <v-row justify="center">
                <v-col cols="12" md="8">
                    <v-alert id="conocenos" border="bottom" colored-border color="orange" class="headline text-center blue--text" >
                        QUIENES SOMOS
                    </v-alert>
                    </v-col>
            </v-row>

            <v-row>
                <v-col cols="12" md="6">
                    <v-card flat>
                        <v-card-text class="text-justify">
                        <p class="body-1">VIRTUALIN es un producto de Aguirre Impresores, que consiste en plataforma web educativa LMS (Learning Management System), diseñada para cubrir diversas necesidades de Instituciones Educativas (IE) oficiales, privadas y otros centros educativos. Esta plataforma permitirá a las instituciones administrar, distribuir y controlar las actividades de formación no presencial, agilizando así el control académico de los estudiantes y la interacción entre los diferentes actores de la IE (directivos, docentes, padres de familia, etc.)</p>
                        <p class="body-1">Entre sus funciones, permite gestionar diversos procesos académicos y administrativos, como evaluaciones, control disciplinario; en el marco de una mayor participación de los padres de familia en el seguimiento de sus hijos. Nuestro objetivo principal es que esta herramienta mejore la experiencia de enseñanza-aprendizaje a distancia. La plataforma VIRTUALiN es diseñada y desarrollada para llevar el entorno educativo presencial al entorno virtual de aprendizaje, transformando así el proceso educativo, sin descuidar la calidad académica</p>
                        <v-btn depressed block color="orange" dark>virtualin</v-btn>
                        </v-card-text>
                    </v-card>
                </v-col>
                <v-col cols="12" md="6">
                    <v-img src="images/somos.png" contain></v-img>
                </v-col>
            </v-row>

            <v-row>
                <v-col cols="12" md="6">
                    <v-img src="images/vision.png" contain></v-img>
                </v-col>
                <v-col cols="12" md="6">
                    
                    <v-alert border="bottom" colored-border color="orange" class="headline text-center blue--text" >
                        MISIÓN
                    </v-alert>

                    <p class="white">
                        Nuestra misión es la asesoría, diseño, diagramación y fabricación de productos impresos y digitales, con énfasis en las Instituciones Educativas, brindando asi el mayor bienestar posible a nuestros clientes y colaboradores, cumpliendo así con nuestro compromiso con el desarrollo de la comunidad y la nación.
                    </p>

                    <v-alert border="bottom" colored-border color="orange" class="headline text-center blue--text" >
                        VISIÓN
                    </v-alert>

                    <p class="white">
                        En una década, en el desarrollo de productos educativos innovadores, comprometidos con la educación, mediante nuestro estricto cumplimiento de requisitos legales, estándares de calidad y la excelencia en la prestación de nuestros servicios.
                    </p>

                </v-col>
            </v-row>
            <v-row justify="center">
                <v-col cols="12" md="8">
                    <v-alert id="servicios" border="bottom" colored-border color="orange" class="headline text-center blue--text" >
                        MÓDULOS
                    </v-alert>
                </v-col>
            </v-row>
            <v-row>
                <v-col cols="12" sm="6" md="4" lg="3">
                    <v-card min-height="700">
                        <v-img src="images/secretaria.png" contain></v-img>
                        <v-card-title class="text-center subtitle-1">
                            MÓDULO SECRETARÍAS
                        </v-card-title>
                        <v-card-text class="text-justify">
                            Se podrá visualizar toda la información estadística de los curso y/o niveles académicos, de forma dinámica; mostrando indicadores alcanzados y caliﬁcaciones en tiempo real. Esto contribuirá a la toma de decisiones de forma asertiva y oportuna, Es decir, que se podrán detectar debilidades justo a tiempo para trabajar en ellas y transformarlas en fortalezas
                        </v-card-text>
                    </v-card>
                </v-col>
                <v-col cols="12" sm="6" md="4" lg="3">
                    <v-card min-height="700">
                        <v-img src="images/profesor.png" contain></v-img>
                        <v-card-title class="text-center subtitle-1">
                            MÓDULO PROFESORES
                        </v-card-title>
                        <v-card-text class="text-justify">
                            Este módulo es increíble para lograr de forma práctica y fácil la generación de contenido a partir de indicadores de desempeño y compartirlo fácilmente con los estudiantes para luego poder evaluar los indicadores académicos cognitivo, procedimental y actitudinal para luego poder generar su respectivo informe o boletín por periodo donde evaluaremos si cumplió
                        </v-card-text>
                    </v-card>
                </v-col>
                <v-col cols="12" sm="6" md="4" lg="3">
                    <v-card min-height="700">
                        <v-img src="images/estudiante.png" contain></v-img>
                        <v-card-title class="text-center subtitle-1">
                            MÓDULO ESTUDIANTES
                        </v-card-title>
                        <v-card-text class="text-justify">
                            Este Sistema permite al estudiante y al padre de familia tener acceso permanente a todas las actividades, tareas, trabajos, evaluaciones, notas y material educativo organizado por los docentes desde cualquier lugar. Este usuario contará con Código de acceso a la plataforma único e intransferible,horario de clase, que se habilitará en la hora de la clase que le corresponda.Participación en clases en las que podrá visualizar el material en PDF que el profesor esté utilizando,unirse a la clase en línea.
                        </v-card-text>
                    </v-card>
                </v-col>
                <v-col cols="12" sm="6" md="4" lg="3">
                    <v-card min-height="700">
                        <v-img src="images/acudiente.png" contain></v-img>
                        <v-card-title class="text-center subtitle-1">
                            MÓDULO ACUDIENTES
                        </v-card-title>
                        <v-card-text class="text-justify">
                            Este sistema permite al padre de familia tener acceso permanente a todas las actividades, tareas, trabajos, evaluaciones, notas y material educativo asignados a su hijo/a. Además, el sistema podrá enviar diferentes tipos de alerta al padre de familia, por ejemplo: cuando su hijo/a tenga una evaluación cercana o el nivel académico haya bajado. De esta forma podrá contribuir a su refuerzo académico.
                        </v-card-text>
                    </v-card>
                </v-col>

            </v-row>

            <v-row justify="center">
                <v-col cols="12" md="8">
                    <v-alert id="funciones" border="bottom" colored-border color="orange" class="headline text-center blue--text" >
                        FUNCIONES
                    </v-alert>
                </v-col>
            </v-row>

            <v-row no-gutters>
                <v-col cols="6" sm="4" md="3" class="text-center py-6">
                    <v-avatar
                        size="80"
                        color="orange"
                        class="elevation-8 mb-2">
                        <v-icon color="white" size="40">mdi-information</v-icon>
                    </v-avatar>
                <p class="subtitle-1 font-weight-bold" >INFORMES EN TIEMPO REAL</p>
                </v-col>

                <v-col cols="6" sm="4" md="3" class="text-center py-6">
                    <v-avatar
                        size="80"
                        color="red"
                        class="elevation-8 mb-2">
                        <v-icon color="white" size="40">mdi-cloud-check</v-icon>
                    </v-avatar>
                <p class="subtitle-1 font-weight-bold" >CONECTADO EN LA NUBE</p>
                </v-col>

                <v-col cols="6" sm="4" md="3" class="text-center py-6">
                    <v-avatar
                        size="80"
                        color="primary"
                        class="elevation-8 mb-2">
                        <v-icon color="white" size="40">mdi-google-classroom</v-icon>
                    </v-avatar>
                <p class="subtitle-1 font-weight-bold" >CLASES EN VIVO</p>
                </v-col>

                <v-col cols="6" sm="4" md="3" class="text-center py-6">
                    <v-avatar
                        size="80"
                        color="success"
                        class="elevation-8 mb-2">
                        <v-icon color="white" size="40">mdi-head-lightbulb</v-icon>
                    </v-avatar>
                <p class="subtitle-1 font-weight-bold" >SOSFITICADO SOFTWARE</p>
                </v-col>

                <v-col cols="6" sm="4" md="3" class="text-center py-6">
                    <v-avatar
                        size="80"
                        color="success"
                        class="elevation-8 mb-2">
                        <v-icon color="white" size="40">mdi-calendar-check-outline</v-icon>
                    </v-avatar>
                <p class="subtitle-1 font-weight-bold" >SOPORTE 24/7</p>
                </v-col>

                <v-col cols="6" sm="4" md="3" class="text-center py-6">
                    <v-avatar
                        size="80"
                        color="primary"
                        class="elevation-8 mb-2">
                        <v-icon color="white" size="40">mdi-tablet-dashboard</v-icon>
                    </v-avatar>
                <p class="subtitle-1 font-weight-bold" >MÓDULOS AMIGABLES</p>
                </v-col>

                <v-col cols="6" sm="4" md="3" class="text-center py-6">
                    <v-avatar
                        size="80"
                        color="red"
                        class="elevation-8 mb-2">
                        <v-icon color="white" size="40">mdi-chat</v-icon>
                    </v-avatar>
                <p class="subtitle-1 font-weight-bold" >CHAT EN VIVO CON PROFESORES Y ESTUDIANTES</p>
                </v-col>

                <v-col cols="6" sm="4" md="3" class="text-center py-6">
                    <v-avatar
                        size="80"
                        color="orange"
                        class="elevation-8 mb-2">
                        <v-icon color="white" size="40">mdi-plus</v-icon>
                    </v-avatar>
                <p class="subtitle-1 font-weight-bold" >Y MUCHO MAS</p>
                </v-col>

            </v-row>


            <v-row>
                <v-col>
                    <v-img src="imag60es/estructura.png" contain></v-img>
                </v-col>
            </v-row>


            <v-row justify="center">
                <v-col cols="12" md="8">
                    <v-alert id="contacto" border="bottom" colored-border color="orange" class="headline text-center blue--text" >
                        PARA MAYOR INFORMACIÓN ESCRÍBENOS
                    </v-alert>
                </v-col>
            </v-row>

            <v-row>
                <v-col>
                    <v-form ref="form" v-model="valid" lazy-validation>

                    <v-card :loading="loading" flat>

                        
                        <v-row justify="center" no-gutters>
                        
                        <v-col cols="11" md="8">
                            <v-text-field
                                v-model="form.tx_nombre"
                                label="Nombre"
                                placeholder="TU NOMBRE AQUI"
                                rounded
                                outlined
                            ></v-text-field>
                        </v-col>
                        
                        <v-col cols="11" md="8">
                            <v-text-field
                                v-model="form.tx_correo"
                                label="Correo"
                                placeholder="TU CORREO AQUI"
                                rounded
                                outlined
                            ></v-text-field>
                        </v-col>

                        <v-col cols="11" md="8">
                            <v-textarea
                                name="input-7-4"
                                label="Mensaje"
                                placeholder="ESCRIBENOS LO QUE DESEAS"
                                rounded
                                outlined
                            ></v-textarea>
                        </v-col>

                            <v-col cols="11" md="8">
                            <v-btn block depressed color="orange" dark>ENVIAR</v-btn>
                        </v-col>

                        </v-row>

                    </v-card>

                    </v-form>

                </v-col>

            </v-row>

            <v-row>
                <v-col>
                    <iframe width="100%" height="400px" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1991.317552658928!2d-76.52302742386829!3d3.4386318646096266!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x87fed921e5ca13bd!2sCl.%2018a%20%2318-69%2C%20Cali%2C%20Valle%20del%20Cauca!5e0!3m2!1ses!2sco!4v1589933222290!5m2!1ses!2sco">
                </iframe> 
                </v-col>
            </v-row>

        </v-container>

        <v-parallax src="images/cotactanos.png">
                        
            <v-container class="my-3">

                <v-row align-content="center" justify="center">
                    <v-col class="text-center mt-8" cols="12">
                        <h1 class="display-1 font-weight-thin mb-4">CONTACTÉNOS</h1>
                        <h3 class="subheading">TELEFÓNOS: +57 319 7060609</h3>
                        <h3 class="subheading">TELEFÓNOS: +57 317 5697775</h3>
                        <a href="mailto:comercial@virtualin.co" class="text-white">comercial@virtualin.co</a>
                    </v-col> 

                    <v-col class="text-center mt-8" cols="12">

                        <h1 class="display-1 font-weight-thin">SIGUÉNOS</h1>

                        <v-btn target="_blank" link href="https://www.facebook.com/Organizaci%C3%B3n-Manzano-1501386180005445/" small dark fab depressed color="primary">
                            <v-icon size="28">mdi-facebook</v-icon>
                        </v-btn>
                    </v-col>
                    
                    <v-col class="text-center mt-8" cols="12" md="10">
                        <h3 class="display-1 font-weight-thin mb-4">CONTÁCTENOS Y OBTENGA MAS INFORMACIÓN</h3>

                        <v-text-field
                        dark
                            v-model="form.tx_correo"
                            placeholder="Email"
                            single-line
                            rounded
                            color="orange"
                            outlined
                            append-icon="mdi-send"
                        ></v-text-field>
                    </v-col>


                </v-row>
                
            </v-container>
        
        </v-parallax>
                        
        <v-footer dark color="grey darken-3 py-5 text-center subtitle-2">
            © 2020 VIRTUALiN. TODOS LOS DERECHOS RESERVADOS
        </v-footer>

      
      
  </div>
</template>

<script>
import AppRules from '@mixins/AppRules';
export default {
    mixins: [AppRules],
    data()
    {
        return {
            valid: false,
            loading: false,
            item: 1,
            items: [
                { text: 'INICIO', target: 'inicio' },
                { text: 'CONOCENOS', target: 'conocenos' },
                { text: 'SERVICIOS', target: 'servicios' },
                { text: 'FUNCIONES', target: 'funciones' },
                { text: 'CONTACTO', target: 'contacto' },
            ],
            form: {
                tx_nombre:   null,
                tx_correo:   null,
                tx_mensaje:  null,
            },
            options: {
                duration: 800,
                offset: 0,
                easing: 'easeInOutCubic',
            }
        }
    }
}
</script>

<style>
.menu-welcome{
    height: 90vh;
}

</style>
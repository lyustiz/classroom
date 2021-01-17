<template>

    <div class="dashboad-badground contend mt-4"> 


           <div class="top-background mb-n16 blue darken-4 mx-4">

           </div>

           <v-container>

           <v-row class="mt-n16" justify="center"> 

               <v-sheet width="100%" color="transparent">   
               <v-slide-group
                    v-model="notificacition"
                    class="py-4 mx-auto"
                    show-arrows="always"
                    >
                    <v-slide-item>
                       <v-card class="rounded-xl elevation-6 ma-4" width="300">
                       <v-card-text>
                            <v-list-item > 
                                 <v-list-item-avatar color="teal lighten-5" size="43">
                                    <v-icon  color="teal lighten-2" size="28">mdi-bell</v-icon>
                                </v-list-item-avatar>

                                <v-list-item-content>
                                    <v-list-item-subtitle>Tarea</v-list-item-subtitle>
                                    <v-list-item-title>Los Sentidos</v-list-item-title>
                                </v-list-item-content>

                                 <v-list-item-avatar>
                                    <v-icon  color="indigo" size="42">mdi-account-circle</v-icon>
                                </v-list-item-avatar>
                            </v-list-item>
                            <p>
                                Prueba de Notificacion de una nueva tarea. Materia: Lenguaje activa desde 01/01/2021
                            </p>
                        </v-card-text>
                        </v-card>
                    </v-slide-item>
                    
                    <v-slide-item>
                       <v-card class="rounded-xl elevation-6 ma-4" width="300">
                       <v-card-text>
                            <v-list-item > 
                                 <v-list-item-avatar color="teal lighten-5" size="43">
                                    <v-icon  color="teal lighten-2" size="28">mdi-bell</v-icon>
                                </v-list-item-avatar>

                                <v-list-item-content>
                                    <v-list-item-subtitle>Cuestionario</v-list-item-subtitle>
                                    <v-list-item-title>La Materia</v-list-item-title>
                                </v-list-item-content>

                                 <v-list-item-avatar>
                                    <v-icon  color="indigo" size="42">mdi-account-circle</v-icon>
                                </v-list-item-avatar>
                            </v-list-item>
                            <p>
                                Prueba de Notificacion de un nuevo cuestionario. Materia: Ciencias Natuarles activa desde 01/01/2021
                            </p>
                        </v-card-text>
                        </v-card>
                    </v-slide-item>
                    
                    <v-slide-item>
                       <v-card class="rounded-xl elevation-6 ma-4 " width="300">
                       <v-card-text>
                            <v-list-item > 
                                 <v-list-item-avatar color="teal lighten-5" size="43">
                                    <v-icon  color="teal lighten-2" size="28">mdi-bell</v-icon>
                                </v-list-item-avatar>

                                <v-list-item-content>
                                    <v-list-item-subtitle>Clase</v-list-item-subtitle>
                                    <v-list-item-title>Matematicas</v-list-item-title>
                                </v-list-item-content>

                                 <v-list-item-avatar>
                                    <v-icon  color="indigo" size="42">mdi-account-circle</v-icon>
                                </v-list-item-avatar>
                            </v-list-item>
                            <p>
                                Prueba de Notificacion del inicio de Clases. Materia: Matematicas fecha 01/01/2021 03:30
                            </p>
                        </v-card-text>
                        </v-card>
                    </v-slide-item>

                </v-slide-group>
                 </v-sheet>
           </v-row>
           <v-row>
               <v-col cols="12" md="3">
                   
                   <AppAsignaciones></AppAsignaciones>
          
               </v-col>
               <v-col cols="12" md="4">
                   <v-card class="rounded-xl elevation-5 vertical-overflow" height="39rem">
                       <v-card-text>
                           <v-row>
                               <v-col class="px-6">
                                   <div class="subtitle-1 font-weight-black">Clases</div>
                                   <div class="caption">6 clases</div>
                               </v-col>
                               <v-col cols="auto">
                                   <v-chip
                                   small
                                    class="ma-2"
                                    close
                                    close-icon="mdi-chevron-down"
                                    color="grey lighten-3"
                                    >
                                     Hoy
                                    </v-chip>
                               </v-col>
                           </v-row>
                            <v-timeline align-top dense>
                                <v-timeline-item icon="mdi-clock-outline" fill-dot color="teal" small>
                                    <v-card class="grey lighten-4 rounded-lg elevation-0 pa-1">
                                        <v-row no-gutters class="">
                                            <v-col cols="12" class="text-center"> 
                                                <v-icon size="15">mdi-clock</v-icon> 22:30 / 23:00
                                            </v-col>
                                            <v-col cols="12">
                                                <v-row no-gutters>
                                                    <v-col cols="auto">
                                                         <v-avatar color="teal lighten-5 mx-3 my-3" size="43">
                                                             <v-icon color="teal lighten-2" size="28">mdi-bookshelf</v-icon>
                                                        </v-avatar>
                                                    </v-col>
                                                    <v-col class="my-3">
                                                        <strong>Matematica</strong>
                                                        <div class="caption">Aula103 Piso 3</div>
                                                    </v-col>
                                                </v-row>
                                            </v-col>
                                        </v-row>
                                    </v-card>
                                </v-timeline-item>
                                <v-timeline-item icon="mdi-clock-outline" fill-dot color="teal" small>
                                    <v-card class="grey lighten-4 rounded-lg elevation-0 pa-1">
                                        <v-row no-gutters class="">
                                            <v-col cols="12" class="text-center"> 
                                                <v-icon size="15">mdi-clock</v-icon> 22:30 / 23:00
                                            </v-col>
                                            <v-col cols="12">
                                                <v-row no-gutters>
                                                    <v-col cols="auto">
                                                         <v-avatar color="teal lighten-5 mx-3 my-3" size="43">
                                                             <v-icon color="teal lighten-2" size="28">mdi-bookshelf</v-icon>
                                                        </v-avatar>
                                                    </v-col>
                                                    <v-col class="my-3">
                                                        <strong>Lenguaje</strong>
                                                        <div class="caption">Aula103 Piso 3</div>
                                                    </v-col>
                                                </v-row>
                                            </v-col>
                                        </v-row>
                                    </v-card>
                                </v-timeline-item>
                                <v-timeline-item icon="mdi-clock-outline" fill-dot color="teal" small>
                                    <v-card class="grey lighten-4 rounded-lg elevation-0 pa-1">
                                        <v-row no-gutters class="">
                                            <v-col cols="12" class="text-center"> 
                                                <v-icon size="15">mdi-clock</v-icon> 22:30 / 23:00
                                            </v-col>
                                            <v-col cols="12">
                                                <v-row no-gutters>
                                                    <v-col cols="auto">
                                                         <v-avatar color="teal lighten-5 mx-3 my-3" size="43">
                                                             <v-icon color="teal lighten-2" size="28">mdi-bookshelf</v-icon>
                                                        </v-avatar>
                                                    </v-col>
                                                    <v-col class="my-3">
                                                        <strong>Ciencias Sociales</strong>
                                                        <div class="caption">Aula103 Piso 3</div>
                                                    </v-col>
                                                </v-row>
                                            </v-col>
                                        </v-row>
                                    </v-card>
                                </v-timeline-item>
                               
                            </v-timeline>
                       </v-card-text>
                   </v-card>
               </v-col>
               <v-col cols="12" md="5">

                   <v-card  class="mb-4 rounded-xl elevation-5">
                           <AppAlumnoSections></AppAlumnoSections>
                   </v-card>

                   <v-card class="rounded-xl elevation-5 mb-4 px-n3">
                          <!--  <v-row> -->

                            <v-slide-group
                                v-model="materia"
                                class="py-4"
                                show-arrows="always"
                            >
                            
                               <!-- <v-col> --><v-slide-item>
                                   <v-card dark class="rounded-xl blue darken-4 mx-2" flat height="10rem" width="8.1rem">
                                       <v-card-text>
                                           <v-row no-gutters>
                                                <div class="col-12 text-center">
                                                    <v-avatar color="grey lighten-5 mx-3 my-3" size="50">
                                                        <v-icon color="blue darken-4" size="28">mdi-bookshelf</v-icon>
                                                    </v-avatar>
                                                    <v-btn x-small icon color="white"><v-icon>mdi-dots-vertical</v-icon></v-btn>
                                                </div>
                                                <div class="col-12 white--text text-center">Ciencias Naturales</div>
                                            </v-row>
                                       </v-card-text>
                                   </v-card>
                               </v-slide-item><!--  </v-col>

                                <v-col> --><v-slide-item>
                                    <v-card dark class="rounded-xl teal lighten-3 mx-2" flat height="10rem" width="8.1rem">
                                       <v-card-text>
                                            <v-row no-gutters>
                                                 <div class="col-12 text-center">
                                                    <v-avatar color="grey lighten-5 mx-3 my-3" size="50">
                                                        <v-icon color="teal lighten-3" size="28">mdi-bookshelf</v-icon>
                                                    </v-avatar>
                                                    <v-btn x-small icon color="white"><v-icon>mdi-dots-vertical</v-icon></v-btn>
                                                </div>
                                                <div class="col-12 white--text text-center">Lenguaje</div>
                                            </v-row>
                                       </v-card-text>
                                   </v-card>
                               </v-slide-item><!--  </v-col>
                                <v-col> --><v-slide-item>
                                    <v-card dark class="rounded-xl pink lighten-4 mx-2" flat height="10rem" width="8.1rem">
                                       <v-card-text>
                                           <v-row no-gutters>
                                                <div class="col-12 text-center">
                                                    <v-avatar color="grey lighten-5 mx-3 my-3" size="50">
                                                        <v-icon color="pink lighten-4" size="28">mdi-bookshelf</v-icon>
                                                    </v-avatar>
                                                    <v-btn x-small icon color="white"><v-icon>mdi-dots-vertical</v-icon></v-btn>
                                                </div>
                                            <div class="col-12 white--text text-center">Biologia</div>
                                            </v-row>
                                       </v-card-text>
                                   </v-card>
                               </v-slide-item><!--  </v-col> -->
                             
                          </v-slide-group><!--  </v-row> -->
                         
                   </v-card>

                   <v-card class="rounded-xl elevation-5 pa-4" >


                           <v-date-picker 
                                v-model="today"
                                :events="events"
                                readonly
                                color="blue darken-4"
                                width="275"
                                landscape
                                id="agenda-alumno"
                            ></v-date-picker>



                   </v-card>

                   

               </v-col>

           </v-row>
           </v-container>


            
    </div>

</template>

<script>
import { mapGetters, mapActions } from 'vuex';

import AppData from '@mixins/AppData';
import AppAgendaAlumno from './agenda/AppAgendaAlumno'
import AppAlumnoSections from './AppAlumnoSections'
import AppEventos from './eventos/AppEventos'

import AppAsignaciones from './dashboard/AppAsignaciones'

export default {

    mixins: [AppData],

    components: 
    { 
        AppAsignaciones,
        AppAlumnoSections
    },

    created()
    {
        this.list()
    },

    data () 
	{
        return {
            notificacition: null,
            materia: null,
            events: [],
            evaluaciones: [],
            eventEvaluations: [],
             today:      new Date().toISOString().substr(0, 10),
        }
    },

    methods: {
        
        list()
        {
            this.getResource( 'agenda' ).then( (data) => 
            { 
                this.events = data.data
            })

           /*  this.getResource( 'evaluacion/grupo/1' ).then( (data) => 
            { 
                this.evaluaciones = data
                this.getEventEvaluations()
            }) */
        },

        getEventEvaluations()
        {
           
            this.evaluaciones.map( (evaluacion) => {
                 
                let currentDate  = new Date(evaluacion.fe_evaluacion).toISOString().substr(0, 10)
                
                this.eventEvaluations.push(
                    {
                        id:             evaluacion.id,
                        name:           evaluacion.tipo_evaluacion.nb_tipo_evaluacion,
                        date:           currentDate,
                        start:          `${currentDate} 07:00`,
                        end:            `${currentDate} 07:30`,
                        startHour:      '08:00',    
                        endHour:        '09:00',   
                        color:          evaluacion.plan_evaluacion.materia.area_estudio.tx_color,
                        category:       evaluacion.plan_evaluacion.materia.nb_materia, 
                        categoryId:     98,    
                        type:           'evaluacion',
                        typeId:         98,
                        icon:           'mdi-notebook',
                        topic:          evaluacion.tx_tema,
                        description:    evaluacion.tx_observaciones,
                        status:         evaluacion.id_status,
                        weight:         evaluacion.nu_peso

                    } 
                )
            })
        }
    }
    
}
</script>

<style >
.contend{
    min-height: 92.8vh;
}
.top-background{
    color: white;
    border: solid 2px rgb(255, 255, 255);
    border-radius: 10px 10px 10px 10px;
    height: 7rem;

}

.dashboad-badground{
    background-color: #F5F7FB; 
}

.v-slide-group__next, .v-slide-group__prev{
  min-width: 1px !important;
}

.v-slide-group__content{
  justify-content: center !important;
}

#agenda-alumno .v-picker__title{
    border-bottom-left-radius: 24px;  
    border-bottom-right-radius: 24px;  
}

.vertical-overflow{
    overflow-x: auto;
}

</style>

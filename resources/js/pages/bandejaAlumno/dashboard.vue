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
                  <AppItinerario></AppItinerario>
               </v-col>
               <v-col cols="12" md="5">
                  <AppAlumnoSections></AppAlumnoSections>

                   
                  <AppMateria></AppMateria>

                  <AppAgenda></AppAgenda>


                   

               </v-col>

           </v-row>
           </v-container>


            
    </div>

</template>

<script>

import AppAsignaciones   from './dashboard/AppAsignaciones'
import AppItinerario     from './dashboard/AppItinerario'
import AppAlumnoSections from './AppAlumnoSections'
import AppMateria        from './dashboard/AppMateria'
import AppAgenda         from './dashboard/AppAgenda'

export default {

  components: 
  { 
    AppAsignaciones,
    AppItinerario,
    AppAlumnoSections,
    AppMateria,
    AppAgenda
  },

  data () 
	{
    return {
      notificacition: null,
      materia: null,
    }
  },
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

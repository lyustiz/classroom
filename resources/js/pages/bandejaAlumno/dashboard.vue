<template>

    <div class="dashboad-badground contend mt-4"> 

        <div class="top-background mb-n16 blue darken-4 mx-4"> </div>

        <v-container>
           <v-row class="mt-n14">
               <v-col cols="12" md="3">
                  <AppAsignaciones></AppAsignaciones>
               </v-col>
               <v-col cols="12" md="4">
                  <AppItinerario></AppItinerario>
               </v-col>
               <v-col cols="12" md="5">
                  <AppAlumnoSections/>
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

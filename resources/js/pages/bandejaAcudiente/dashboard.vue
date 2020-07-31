<template>

    <v-container fluid class="indigo lighten-4 contend"> 

        <v-row>

            <v-col cols="12" md="8" >

                <v-row no-gutters >
                    <v-col cols="12" >

                        <v-card class="rounded-xl" min-height="86.6vh" >
                        <v-item-group v-model="alumnoSelected" class="grey lighten-4 py-4"> 
                            <v-row justify="space-around">
                                <v-item v-slot:default="{ active, toggle }" v-for="alumno in alumnos" :key="alumno.id" :value="alumno" class="pointer" >
                                <div>
                                    <v-avatar size="150" @click="toggle" dark color="indigo" v-ripple>

                                        <v-img :src="alumno.foto.full_url" v-if="alumno.foto">
                                            <v-scroll-y-transition>   
                                            <v-icon 
                                                color="white" 
                                                class="mt-n10" 
                                                size="38" 
                                                v-if="active" v-text="'mdi-checkbox-marked-circle-outline'">
                                            </v-icon>
                                            </v-scroll-y-transition> 
                                        </v-img>

                                        <v-icon 
                                            color="white" 
                                            v-else 
                                            size="140" 
                                            v-text="(active) ? 'mdi-account-check': 'mdi-account'">
                                        </v-icon>

                                    </v-avatar>
                                    
                                    <h6 class="text-center grey--text mt-2">{{alumno.nb_corto}}</h6> 
                                </div>
                                </v-item>
                            </v-row>
                        </v-item-group>

                        <v-toolbar color="grey lighten-3 subtitle-2" dense flat >
                            <v-row v-if="alumnoSelected">
                                <v-col cols="4"><v-icon class="mr-2" color="red">mdi-school</v-icon>{{alumnoSelected.nb_corto}}</v-col>
                                <v-col cols="4"><v-icon class="mr-2" color="green">mdi-numeric</v-icon>{{alumnoSelected.grado.nb_grado}}</v-col>
                                <v-col cols="4"><v-icon class="mr-2" color="orange">mdi-alphabetical-variant</v-icon>{{alumnoSelected.grupo.nb_grupo}}</v-col>
                            </v-row>
                            <v-alert  type="warning" icon="mdi-gesture-tap" v-else dense class="mt-4 subtitle-2">
                                Seleccione Alumno
                            </v-alert > 
                        </v-toolbar>

                        <v-card-text>

                            <v-row justify="center">

                                <v-scroll-y-transition v-if="alumnoSelected"> 
                                  
                                    <v-row>

                                        <v-col cols="12" md="6" lg="4" v-for="section in sections" :key="section.name">
                                        
                                        <v-list-item  @click="showSection(section.component, section.label)"  > 
                                        <v-list-item-avatar :color="section.color" size="58" >
                                            <v-icon size="36" color="white"  v-text="section.icon">mdi-account-circle</v-icon>
                                        </v-list-item-avatar>

                                        <v-list-item-content>
                                        <v-list-item-title v-text="section.label"></v-list-item-title>
                                        </v-list-item-content>

                                        </v-list-item>
                                        
                                        </v-col>

                                    </v-row>
                                    
                                 
                                </v-scroll-y-transition> 

                            </v-row>

                            <v-dialog v-model="dialogSection" content-class="rounded-xl"> 
                                
                                <app-simple-toolbar :title="sectionTitle" @closeModal="dialogSection=false" v-if="dialogSection"></app-simple-toolbar>  

                                <component :alumno="alumnoSelected" :is="component"></component>
                                
                            </v-dialog> 
                           
                        </v-card-text>

                    </v-card>
                    </v-col>
               </v-row>
               
            </v-col>

            <v-col cols="12" md="4">

                <calendario-acudiente></calendario-acudiente>

                <seccion-acudiente></seccion-acudiente>

            </v-col>

        </v-row>
            
    </v-container>

</template>

<script>
import { mapGetters, mapActions } from 'vuex';

import AppData             from '@mixins/AppData';
import CalendarioAcudiente from './calendario/CalendarioAcudiente'
import SeccionAcudiente    from './SeccionAcudiente'
import HorarioAlumno       from '@pages/bandejaAlumno/horario/HorarioAlumno'
import ItinerarioAlumno    from '@pages/bandejaAlumno/itinerario/ItinerarioAlumno'
import MateriaAlumno       from '@pages/bandejaAlumno/materia/AppMateria'
import IncidenciaAlumno    from '@pages/incidencia/AppListIncidencia.vue'
import DocenteAlumno       from './docentes/DocenteAlumno'

export default {

    mixins: [AppData],

    components: 
    { 
        'calendario-acudiente': CalendarioAcudiente,
        'seccion-acudiente':    SeccionAcudiente,
        'horario-alumno':       HorarioAlumno,
        'itinerario-alumno':    ItinerarioAlumno,
        'materia-alumno':       MateriaAlumno,
        'incidencia-alumno':    IncidenciaAlumno,
        'docente-alumno':       DocenteAlumno
    },

    created()
    {
        this.list()
    },

    computed:
    {
        pariente()
        {
            return this.$store.getters['getPariente']
        }
    },

    data () 
	{
        return {
            alumnoSelected: null,
            selected: null,
            alumnos:  [],
            sections: [
                { label: 'Horario', icon: 'mdi-calendar-multiselect', component: 'horario-alumno', color: 'indigo' },
                { label: 'Itinerario', icon: 'mdi-calendar-clock', component: 'itinerario-alumno', color: 'green' },
                { label: 'Calificaciones', icon: 'mdi-clipboard-list', component: 'materia-alumno', color: 'purple' },
                { label: 'Faltas y Sanciones', icon: 'mdi-account-alert', component: 'incidencia-alumno', color: 'red' },
                { label: 'Docentes', icon: 'mdi-account-tie', component: 'docente-alumno', color: 'orange' },
            ],
            dialogSection: false,
            component:     null,
            sectionTitle:  null
        }
    },

    methods: {
        
        list()
        {
            this.getResource( `alumno/matriculado/pariente/${this.pariente.id}`).then( (data) => this.alumnos = data)
        },

        showSection(component, label)
        {
            this.dialogSection = true
            this.component     = component
            this.sectionTitle  = label
        }
    }
    
}
</script>

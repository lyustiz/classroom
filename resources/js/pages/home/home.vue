<template>
<div class="amber lighten-2 home-holder mt-n6 pt-6">
   
   
<v-container fluid>

    <v-divider dark></v-divider>

    <v-row>

        <v-col>
            <v-card class="rounded-xl red " flat>
                <v-card-title>
                    <div class="white--text"> Alumnos</div>
                    <v-spacer></v-spacer>
                    <item-menu :menus="menuAlumnos" btnColor="red" iconColor="white" :small="false" @onItemMenu="onMenu($event)"></item-menu>
                </v-card-title>
                <v-card-text>
                    <v-row no-gutters justify="space-between">
                            <v-avatar size="90">
                                <v-icon size="90">mdi-school</v-icon>
                            </v-avatar>
                        <v-col class="pa-3 text-center">
                            <span class="white--text text-h2 font-weight-bold">{{ (item) ? item.alumnos : '--' }}</span>
                            <span class="white--text text-h5" >/500</span>
                        </v-col>
                        <v-col cols="auto" class="text-center">
                            <v-progress-circular
                                :rotate="-90"
                                :size="80"
                                :width="8"
                                :value=" (item) ? item.alumnos*100/500 : 0 "
                                color="white">
                                {{ (item) ? item.alumnos : 0 }}
                            </v-progress-circular>
                        </v-col>
                    </v-row>
                </v-card-text>
            </v-card>
        </v-col>
        <v-col>
 
            <v-card class="rounded-xl green " flat>
                <v-card-title>
                    <div class="white--text"> Docentes </div>
                    <v-spacer></v-spacer>
                    <item-menu :menus="menuDocentes" btnColor="green" iconColor="white" :small="false" @onItemMenu="onMenu($event)"></item-menu>
                </v-card-title>
                <v-card-text>

                    <v-row no-gutters justify="space-between">
                            <v-avatar size="90">
                                <v-icon size="90">mdi-account-tie</v-icon>
                            </v-avatar>
                        <v-col class="pa-3 text-center">
                            <span class="white--text text-h2 font-weight-bold">{{ (item) ? item.docentes : '--' }}</span>
                            <span class="white--text text-h5" >/200</span>
                        </v-col>
                        <v-col cols="auto">
                            <v-progress-circular
                                :rotate="-90"
                                :size="80"
                                :width="8"
                                :value=" (item) ? item.docentes*100/200 : 0 "
                                color="white">
                                {{ (item) ? item.docentes : 0 }}
                            </v-progress-circular>
                        </v-col>
                    </v-row>

                </v-card-text>
            </v-card>


        </v-col>
        <v-col>

            <v-card class="rounded-xl cyan " flat>
                <v-card-title>
                    <div class="white--text"> Archivos </div>
                    <v-spacer></v-spacer>
                    <item-menu :menus="menuArchivos" btnColor="cyan" iconColor="white" :small="false" @onItemMenu="onMenu($event)"></item-menu>
                </v-card-title>
                <v-card-text>
                    <v-row no-gutters justify="space-between">
                            <v-avatar size="90">
                                <v-icon size="90">mdi-file</v-icon>
                            </v-avatar>
                        <v-col class="pa-3 text-center">
                            <span class="white--text text-h2 font-weight-bold">{{ (item) ? item.archivos : '--' }}</span>
                            <span class="white--text text-h5" >/500</span>
                        </v-col>
                        <v-col cols="auto">
                            <v-progress-circular
                                :rotate="-90"
                                :size="80"
                                :width="8"
                                :value=" (item) ? item.archivos*100/1000 : 0 "
                                color="white">
                                {{ (item) ? item.archivos : 0 }}
                            </v-progress-circular>
                        </v-col>
                    </v-row>
                </v-card-text>
            </v-card>
        </v-col>


    </v-row>

    <v-divider dark></v-divider>

    <v-row>
        <v-col cols="6" sm="4" md="3">

            <v-card color="transparent" class="rounded-xl" flat>
                <v-card-text class="text-center">
                   <v-avatar size="130" color="cyan">
                        <v-icon size="90" color="white">mdi-chair-rolling</v-icon>
                    </v-avatar>
                </v-card-text>
                <div class="text-center">Secretaria</div>
            </v-card> 

        </v-col>
        <v-col cols="6" sm="4" md="3">

            <v-card color="transparent" class="rounded-xl" flat >
                <v-card-text class="text-center">
                   <v-avatar size="130" color="green">
                        <v-icon size="90" color="white">mdi-account-tie</v-icon>
                    </v-avatar>
                </v-card-text>
                <div class="text-center">Docente</div>
            </v-card> 
 
        </v-col>
        <v-col cols="6" sm="4" md="3">

            <v-card color="transparent" class="rounded-xl" flat >
                <v-card-text class="text-center">
                   <v-avatar size="130" color="red">
                        <v-icon size="90" color="white">mdi-school</v-icon>
                    </v-avatar>
                </v-card-text>
                <div class="text-center">Alumno</div>
            </v-card> 
      
        </v-col>
        <v-col cols="6" sm="4" md="3">

            <v-card color="transparent" class="rounded-xl" flat >
                <v-card-text class="text-center">
                   <v-avatar size="130" color="purple">
                        <v-icon size="90" color="white">mdi-human-male-child</v-icon>
                    </v-avatar>
                </v-card-text>
                <div class="text-center">Acudiente</div>
            </v-card> 
 
        </v-col>

        
    </v-row>
    
</v-container>



</div>
</template>

<script>

import AppData from '@mixins/AppData';
export default 
{
    mixins:     [ AppData],

    created()
    {
        this.list()
    },

    data () 
	{
        return {
            Showfilter: true,
            logo: require('~/assets/img/logo.png'),
            resource: 'home',
            menuAlumnos: [
                {  label: 'Lista Alumnos', icon:  'mdi-school', action: 'showAlumnos' }
            ],
            menuDocentes: [
                {  label: 'Lista Docentes', icon:  'mdi-account-tie', action: 'showDocentes' }
            ],
            menuArchivos: [
                {  label: 'Archivos',  icon: 'mdi-file', action: 'showArchivos'  },
                {  label: 'Recursos',  icon: 'mdi-bookshelf', action: 'showRecursos' },
                {  label: 'Ver Fotos', icon: 'mdi-image', action: 'showFotos' }
            ],
        }
    },

    methods:
    {
        list()
        {
            this.getResource( this.resource ).then( data =>  this.item = data )
        },

        onMenu(menu)
        {
           switch (menu.action) {

                case 'showAlumnos':
                    this.navegateToName('alumno')
                    break;
                
                case 'showDocentes':
                    this.navegateToName('docente')
                    break;
                
                case 'showArchivos':
                    this.navegateToName('archivo')
                    break;
                
                case 'showRecursos':
                    this.navegateToName('recurso')
                    break;
                
                case 'showFotos':
                    this.navegateToName('foto')
                    break;
            }
        }
    }
}
</script>

<style>
.home-holder{
    min-height: 96.4vh;
}
</style>

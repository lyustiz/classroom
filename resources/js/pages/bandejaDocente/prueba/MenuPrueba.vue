<template>

    <v-card class="rounded-xl" height="300">

        <v-card-title class="pa-0">
            <app-simple-toolbar title="Pruebas" @closeModal="$emit('closeModal')"></app-simple-toolbar>
        </v-card-title>

        <v-card-text>

            <v-row>
            <v-col cols="12" md="6" v-for="section in sections" :key="section.name">
                <v-list-item  @click="showSection(section)" :color="section.color" > 
                    <v-list-item-avatar :color="section.color" size="58" >
                        <v-icon size="36" color="white"  v-text="section.icon">mdi-account-circle</v-icon>
                    </v-list-item-avatar>
                    <v-list-item-content>
                        <v-list-item-title v-text="section.label"></v-list-item-title>
                    </v-list-item-content>
                </v-list-item>
            </v-col>
            </v-row>

        </v-card-text>
    
       <v-dialog v-model="dialogSection" content-class="rounded-xl dialog-section" scrollable :max-width="sectionWidth"> 
                <component 
                    :is="component" 
                    v-if="dialogSection" 
                    @closeModal="dialogSection=false"
                ></component>
            </v-dialog> 

    </v-card>

</template>

<script>

import CrearPrueba     from './CrearPrueba'
import AsignarPrueba   from './AsignarPrueba'
import EjecutarPrueba  from './EjecutarPrueba'
import EvaluarPrueba from './EvaluarPrueba'

export default {

    components: {
        'crear-prueba':     CrearPrueba,
        'asignar-prueba':   AsignarPrueba,
        'ejecutar-prueba':  EjecutarPrueba,
        'evaluar-prueba':   EvaluarPrueba
    },

    computed:
    {
        docente()
        {
            return this.$store.getters['getDocente']
        }
    },

    data()
    {
        return {
            component:    null,
            sectionTitle: null,
            dialogSection: false,
            sectionWidth:  null,
            sections: [

                    { label: 'Crear Prueba',     icon: 'mdi-book-plus-multiple', component: 'crear-prueba', color: 'red', sectionWidth: '95vw' },
                    { label: 'Asignar Prueba',   icon: 'mdi-book-account', component: 'asignar-prueba', color: 'amber', sectionWidth: '95vw' },
                    { label: 'Ejecutar Prueba',  icon: 'mdi-book-play',   component: 'ejecutar-prueba', color: 'green', sectionWidth: '95vw' },
                    { label: 'Evaluar Prueba', icon: 'mdi-book-search', component: 'evaluar-prueba', color: 'purple', sectionWidth: '95vw' },
            ]
        }
    },

    methods:
    {
        showSection(section)
        {
            this.sectionWidth  = section.sectionWidth
            this.dialogSection = true
            this.component     = section.component
            this.sectionTitle  = section.label
        }
    }
}
</script>

<style>

</style>
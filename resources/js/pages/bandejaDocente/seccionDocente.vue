<template>

    <v-card class="mt-3 rounded-xl">

        <v-toolbar color="indigo" flat dark>
            Secciones
        </v-toolbar>

        <v-card-text>

            <v-tooltip top v-for="section in sections" :key="section.name" color="info">
                <template v-slot:activator="{ on }">
                    <v-btn 
                        fab 
                        dark 
                        depressed 
                        v-on="on" 
                        :color="section.color" 
                        @click="showSection(section)" 
                        class="ml-1">
                        <v-icon size="32" v-text="section.icon"></v-icon>
                    </v-btn>
                </template>
                <span v-text="section.label"></span>
            </v-tooltip>

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
import ListaAumno        from './alumno/listaAlumnos'
import EvaluacionDocente from './evaluacion/evaluacionDocente'
import ClaseAlumno       from '@pages/bandejaAlumno/clase/AppCLase'
import MenuPrueba        from './prueba/MenuPrueba.vue'

export default {

    components: {
        'lista-alumno':       ListaAumno,
        'evaluacion-docente': EvaluacionDocente,
        'menu-prueba'       : MenuPrueba,
        'clase-alumno':       ClaseAlumno, 
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
            component:     null,
            sectionTitle:  null,
            dialogSection: false,
            sectionWidth:  null,
            sections: [

                    { label: 'Alumnos', icon: 'mdi-school', component: 'lista-alumno', color: 'red', sectionWidth: '700' },
                    { label: 'Evaluaciones', icon: 'mdi-notebook', component: 'evaluacion-docente', color: 'amber', sectionWidth: '700' },
                    { label: 'Pruebas', icon: 'mdi-order-bool-descending-variant', component: 'menu-prueba', color: 'blue', sectionWidth: '700' },
                    { label: 'Aula Virtual (En Construccion)', icon: 'mdi-google-classroom', component: 'clase-alumno', color: 'green', sectionWidth: '700' },
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
<template>

    <v-card :loading="loading" flat height="80vh">

    <v-card-title class="pa-0">
        <app-simple-toolbar title="Evaluaciones" @closeModal="$emit('closeModal', true)"></app-simple-toolbar>
    </v-card-title>
    
    <v-card-text class="pt-3" >

        <v-expansion-panels  focusable class="rounded-xl" mandatory accordion>
            <v-expansion-panel>
                <v-expansion-panel-header>
                    <div><v-icon color="red" class="mr-1">mdi-calendar-weekend</v-icon> {{periodo.nb_periodo}}</div>
                </v-expansion-panel-header>
                <v-expansion-panel-content>
                
                    <v-expansion-panels focusable class="rounded-xl mt-3" accordion v-model="selected">
                        <v-expansion-panel v-for="materia in materias" :key="materia.id">
                            <v-expansion-panel-header>
                                <v-row no-gutters>
                                    <v-col>
                                        <v-icon color="purple" class="mr-1">mdi-bookshelf</v-icon> {{materia.nb_materia}}
                                    </v-col>
                                    <v-col>
                                        <v-icon color="indigo" class="mr-1">mdi-account-tie</v-icon>
                                        {{ (materia.plan_evaluacion.length > 0) ? materia.plan_evaluacion[0].docente.nb_docente : null}}
                                    </v-col>
                                </v-row>
                            </v-expansion-panel-header>

                            <v-expansion-panel-content>
                                
                                <v-simple-table v-if="materia.plan_evaluacion.length > 0">

                                <template v-slot:default>
                                    <thead>
                                    <tr>
                                        <th class="text-left">Evaluacion</th>
                                        <th class="text-left">peso</th>
                                        <th class="text-left">Tema</th>
                                        <th class="text-left">Guias</th>
                                        <th class="text-left">Fecha</th>
                                        <th class="text-left">Status</th>
                                        <th class="text-left">Tipo</th>
                                        <th class="text-center yellow lighten-4">Accion</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr v-for="evaluacion in materia.plan_evaluacion[0].evaluacion" :key="evaluacion.id">
                                        <td>
                                            {{ evaluacion.tipo_evaluacion.nb_tipo_evaluacion }}
                                        </td>
                                        <td>
                                            {{ evaluacion.nu_peso }}%
                                        </td>
                                        <td>
                                            <list-simple-icon :label="evaluacion.tx_tema" icon="mdi-card-text-outline" color="green"></list-simple-icon>
                                        </td>
                                        <td>
                                            <template v-for="archivo in evaluacion.archivo">
                                                <list-simple-icon :key="archivo.id" :label="`${archivo.nb_archivo}`" :size="32" icon="mdi-file-download" depressed @click="download(archivo)"></list-simple-icon>
                                            </template>
                                        </td>
                                        <td>
                                            {{ (evaluacion.fe_evaluacion ) ? evaluacion.fe_evaluacion : evaluacion.fe_planificada | formatDate }}
                                        </td>
                                        <td>
                                            <list-simple-icon :label="evaluacion.status.nb_status" :icon="evaluacion.status.tx_icono" :color="evaluacion.status.tx_color"></list-simple-icon>
                                        </td>
                                        <td>
                                            <template v-if="evaluacion.evaluacion_metodo">
                                                <list-simple-icon :label="evaluacion.evaluacion_metodo.nb_evaluacion_metodo" :icon="evaluacion.evaluacion_metodo.tx_icono" :color="evaluacion.evaluacion_metodo.tx_color"></list-simple-icon>
                                            </template>
                                        </td>
                                        <td class="yellow lighten-4 text-center">
                                            <template v-if="evaluacion.evaluacion_metodo">
                                               
                                                <template v-if="evaluacion.evaluacion_metodo.id == 1 ">
                                                    <list-simple-icon label="Ir al modulo de Pruebas" icon="mdi-resize" color="amber" @click="goPruebas()"></list-simple-icon>
                                                </template>
                                                
                                                <template v-else-if="evaluacion.evaluacion_metodo.id == 2 ">
                                                    <list-simple-icon label="Seguir Intrucciones del Docente" icon="mdi-account-tie-voice" color="info"></list-simple-icon>
                                                </template>
                                               
                                                <template v-else-if="evaluacion.evaluacion_metodo.id == 3 ">
                                                    <list-simple-icon label="Enviar Archivo" icon="mdi-file-upload" :size="32" color="green" @click="addFile(evaluacion.evaluacion_alumno[0])"></list-simple-icon>
                                                </template>
                                            
                                            </template>
                                        </td>
                                    </tr>
                                    </tbody>
                                </template>

                            </v-simple-table>

                            <a ref="download" target="_blank" rel="noopener noreferrer" class="d-none"></a>
                                
                            </v-expansion-panel-content>
                        </v-expansion-panel>
                    </v-expansion-panels> 

            </v-expansion-panel-content>
            </v-expansion-panel>
        </v-expansion-panels> 

        <v-dialog
            v-model="dialogFile"
            max-width="500px"
            content-class="rounded-xl"
        >
            <archivo-upload 
                origen="evaluacion_alumno"
                :origenId="evaluacionAlumnoId"
                :tipoArchivo="11"
                :maxItems="1"
                @closeModal="closeDialog()"
            ></archivo-upload>
        </v-dialog>

     
        <pre v-if="$App.debug">{{ $data }}</pre>

    </v-card-text>
    </v-card>

</template>

<script>
import DataHelper from '@mixins/AppData';
import ShowEvaluacion from './AppShowEvaluacion'
import ArchivoUpload from '@pages/archivo/archivoUpload';

export default {

    components: {
        'show-evaluacion': ShowEvaluacion,
        'archivo-upload': ArchivoUpload
    },

    mixins:     [  DataHelper ],

    created()
    {
        this.list()
    },

    computed:
    {
        alumno()
        {
            return this.$store.getters['getAlumno']
        },
        
        grupo()
        {
            return this.$store.getters['getAlumnoGrupo']
        },

        periodo()
        {
            return this.$store.getters['getPeriodoActivo']
        }
    },

    data () {
        return {
            title:      'Evaluaciones',
            materias:   [],
            selected:   null,
            dialogFile: false,
            evaluacionAlumnoId: null
        }
    },
    methods:
    {
        list()
        {
           this.getResource( `materia/evaluacion/alumno/${this.alumno.id}` ).then( data =>  this.materias = data )
        },

        download(archivo)
        {            
            var href = archivo.tipo_archivo.tx_base_path + archivo.tx_path

            this.$refs['download'][0].setAttribute('download', archivo.nb_real);

            this.$refs['download'][0].setAttribute('href', href);

            this.$refs['download'][0].click();

            this.showMessage(`Descargando archivo ...`)
        },

        addFile(evaluacion_alumno)
        {
            console.log(evaluacion_alumno)
            this.evaluacionAlumnoId = evaluacion_alumno.id
            this.dialogFile = true
        },

        closeDialog()
        {
            this.dialogFile = false
        },

        goPruebas()
        {
            this.$emit('closeModal', { goTo:'prueba-alumno' } )
        }
    }
}
</script>

<style>
</style>
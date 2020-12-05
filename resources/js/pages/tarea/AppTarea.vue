<template>
    <v-card color="grey lighten-5"> 

        <v-card-title class="pa-0">
            <app-simple-toolbar title="Tarea" @closeModal="$emit('closeDialog')"></app-simple-toolbar>
        </v-card-title>

        <v-card-text>

              <v-row v-if="tarea" justify="center" dense class="mt-4">
                <v-col cols="10" class="mb-4">
                    <v-list-item class="amber lighten-4 rounded-lg elevation-3" >
                        <v-list-item-avatar color="deep-purple" size="60">
                            <v-icon color="white" size="46">mdi-notebook</v-icon>
                        </v-list-item-avatar>
                        <v-list-item-content>
                            <v-list-item-title v-text="tarea.nb_tarea"></v-list-item-title>
                            <v-list-item-subtitle >Materia: {{tarea.materia.nb_materia}}</v-list-item-subtitle>
                             <v-list-item-subtitle >Tema: {{tarea.tema.nb_tema}}</v-list-item-subtitle>
                        </v-list-item-content>
                        <v-list-item-action>
                            <v-row no-gutters>

                                <v-tooltip bottom color="green">
                                    <template v-slot:activator="{ on }">
                                        <v-avatar color="green" rounded size="54" class="mx-1 white--text" v-on="on">
                                            <v-row no-gutters>
                                            <v-col cols="12">{{ monthShortNameFromDate(tarea.evaluacion[0].fe_inicio) }}</v-col>
                                            <v-col cols="12" class="body-1">{{ dayFromDate(tarea.evaluacion[0].fe_inicio) }}</v-col>
                                            </v-row>   
                                        </v-avatar>
                                    </template>
                                    <span>Valido Desde: {{tarea.evaluacion[0].fe_inicio | formatDate }}</span>
                                </v-tooltip>

                                <v-tooltip bottom color="amber">
                                    <template v-slot:activator="{ on }">
                                        <v-avatar color="amber" rounded size="54" class="ml-1 mr-6 white--text" v-on="on">
                                            <v-row no-gutters>
                                            <v-col cols="12">{{ monthShortNameFromDate(tarea.evaluacion[0].fe_fin) }}</v-col>
                                            <v-col cols="12" class="body-1">{{ dayFromDate(tarea.evaluacion[0].fe_fin) }}</v-col>
                                            </v-row>   
                                        </v-avatar>
                                    </template>
                                    <span>Valido Hasta: {{tarea.evaluacion[0].fe_fin | formatDate }}</span>
                                </v-tooltip>
                            </v-row>
                        </v-list-item-action>
                        <v-list-item-action v-for="archivo in archivoTarea" :key="archivo.id">
                            <list-simple-icon :label="`${archivo.nb_archivo}`" :size="60" icon="mdi-file-download" depressed @click="download(archivo)"></list-simple-icon>
                        </v-list-item-action>
                    </v-list-item>
                </v-col>

                <v-col cols="10">
                    <v-alert type="info" :value="true" prominent border="right" color="cyan" class="elevation-3">
                        <v-subheader>Descripcion</v-subheader>
                        <p class="ml-4" v-text="tarea.tx_descripcion"></p>
                    </v-alert>
                </v-col>

                <v-col cols="10">
                    <v-alert type="info" :value="true" prominent border="right" color="cyan" class="elevation-3">
                        <v-subheader>Observaciones</v-subheader>
                        <p  class="ml-4"  v-text="tarea.tx_observaciones"></p>
                    </v-alert>
                </v-col>

                <v-col cols="10">
                    <v-alert  :value="true" color="amber lighten-3" dark class="elevation-3"> 
                        <v-chip color="indigo" dark >
                            Cargar Tarea
                        </v-chip>
                        <v-row>
                            <v-col class="text-center">
                                <v-badge color="success" overlap :value="archivoAlumno" icon="mdi-check-bold" >
                                    <v-btn color="success"  @click="addFile(evaluacionAlumno)" :loading="loading">
                                        <v-icon class="mr-3">mdi-file-upload</v-icon>
                                        Cargar Archivo
                                    </v-btn>
                                </v-badge>
                            </v-col>
                            <v-col class="text-center">
                                <v-badge color="success" overlap :value="isCompleted" icon="mdi-check-bold" >
                                 <v-btn color="primary" @click="entregarTarea()">Entregar Tarea</v-btn>
                                 </v-badge>
                            </v-col>
                        </v-row>
                    </v-alert>
                </v-col>
            </v-row> 
            

        </v-card-text>

        <v-card-actions>
            
        </v-card-actions>

        <v-overlay :opacity="0.3" :value="!tarea">
            <v-icon size="50" class="mdi-spin">mdi-loading</v-icon>
        </v-overlay>

        <a ref="download" target="_blank" rel="noopener noreferrer" class="d-none"></a>

        <v-dialog
            v-model="dialogFile"
            max-width="500px"
            content-class="rounded-xl"
        >
            <archivo-upload 
                origen="evaluacion_alumno"
                :origenId="evaluacionAlumno.id"
                :tipoArchivo="13"
                :maxItems="1"
                @closeModal="closeDialog()"
                @onUpdateFiles="getTareaAlumno()"
            ></archivo-upload>
        </v-dialog>

    </v-card>
</template>

<script>

import AppData     from '@mixins/AppData';
import ArchivoUpload from '@pages/archivo/archivoUpload';
export default {

    mixins:     [ AppData ],

    components: {
        'archivo-upload': ArchivoUpload
    },

    props:
    {
        evaluacionAlumno: {
            type: Object,
            default: () => {}
        }
    },

     created()
    {
        console.log(this.evaluacionAlumno)
        this.getTareaAlumno()
    },

    data()
    {
        return {
            tarea:         null,
            dialog:        false,
            archivoTarea:  [],
            archivoAlumno: null,
            dialogFile:    false,
            isCompleted:   false
        }
    },

    methods:
    {
        getTareaAlumno()
        {
            this.getResource(`tarea/evaluacion/${this.evaluacionAlumno.id_evaluacion}/evaluacionAlumno/${this.evaluacionAlumno.id}`).then((data) =>{
                this.tarea         = data
                this.archivoTarea  = data.archivo
                this.archivoAlumno = data.evaluacion[0].evaluacion_alumno[0].archivo
                this.isCompleted   = (data.evaluacion[0].evaluacion_alumno[0].id_status == 5) ? true : false

            })
        },

        entregarTarea()
        {
            if(!this.validar()) return

            let form = {id_usuario: this.idUser}

            this.updateResource(`evaluacionAlumno/${this.evaluacionAlumno.id}/finalizarTarea`, form).then((data) =>{
                this.showMessage(data.msj)
                this.$emit('onClomplete')
                this.$emit('closeDialog', true)
            })
        },

        validar()
        {
            if(!this.archivoAlumno)
            {
                this.showError('No se ha cargado la tarea')
                return false
            }

            if(this.isCompleted)
            {
                this.showMessage('La tarea ya ha sido entregada')
                this.$emit('closeDialog')
                return false
            }
            return true
        },


        download(archivo)
        {            
            var href = archivo.full_url

            console.log(this.$refs['download'])

            this.$refs['download'].setAttribute('download', archivo.nb_real);

            this.$refs['download'].setAttribute('href', href);

            this.$refs['download'].click();

            this.showMessage(`Descargando archivo ...`)
        },

        addFile(evaluacion)
        {
            console.log(evaluacion)
            this.dialogFile = true
        },

        closeDialog()
        {
            this.dialogFile = false
        }


    }

}
</script>

<style>

</style>
<template>

    <v-card class="rounded-xl">

        <v-card-title class="pa-0" >
            <v-toolbar :color="clase.materia.area_estudio.tx_color" dense dark class="rounded-t-xl" flat>
                <v-row>
                    <v-col> 
                        <h5 class="mt-1">{{ clase.materia.nb_materia}} - {{clase.fe_clase | formatDate}}</h5>
                    </v-col>
                    <v-col cols="auto">
                        <item-menu 
                            :item="clase"
                            btn-color="transparent" 
                            icon-color="white" 
                            :small="false"
                            :menus="menus"
                            @onItemMenu="onItemMenu($event)">
                        </item-menu>
                    </v-col>
                </v-row>
            </v-toolbar>
        </v-card-title>

        <v-card-text>

            <v-row align="center">
                <v-col>
                    <v-row>
                        <v-col class="text-center">
                            <div class="caption">Grado</div>
                            <h3>{{ clase.grado.nb_grado}}</h3>
                        </v-col>
                    </v-row>
                    <v-row>
                        <v-col class="text-center">
                            <div class="caption">Grupo</div>
                            <h3>{{ clase.grupo.nb_grupo}}</h3>
                        </v-col>
                    </v-row>
                </v-col>

                <v-col>
                    <v-row justify="center" align="center">
                        <v-col cols="auto" class="text-center">
                            <v-icon color="green" size="85" v-if="clase.fe_completada">mdi-checkbox-marked-circle-outline</v-icon>
                            <v-icon color="amber" size="88" class="mdi-spin pointer" v-else ripple>mdi-cog-clockwise</v-icon>
                            <div class="caption">{{  (clase.fe_completada) ? 'Completada' : 'En proceso...' }}</div>
                        </v-col>
                    </v-row>
                </v-col>

                <v-col>
                    
                    <v-row>
                        <v-col class="text-center">
                            <v-progress-circular
                                :size="100"
                                :width="15"
                                :value="percentAsistencia(clase)"
                                :color="colorAsistencia(clase)"
                                :indeterminate="loading"
                            >
                                <div>
                                    <span class="display-1">{{clase.asistentes.length}}</span> / <span>{{ clase.asistencia.length}}</span>
                                </div>
                            </v-progress-circular>
                        </v-col>
                    </v-row>
                </v-col>

            </v-row>
            
        </v-card-text>

         <v-dialog v-model="dialogAsistencia" max-width="95vw" content-class="rounded-xl" scrollable>
            <app-asistencia :clase="clase" v-if="dialogAsistencia" @closeDialog="closeDialog('dialogAsistencia', $event)" @onUpdateData="$emit('onUpdateData')"></app-asistencia>
        </v-dialog>

        <v-dialog v-model="dialogCloseClase" max-width="400" content-class="rounded-xl" scrollable>
            
            <v-card flat>
                <v-card-title class="headline deep-purple white--text">
                    Finalizar Clase 
                </v-card-title>
                <v-card-text>
                <v-row>
                    <v-col>
                        <v-textarea
                        :rules="[rules.max(100)]"
                        v-model="form.tx_observaciones"
                        rounded
                        filled
                        hide-details
                        label="Observaciones"
                        rows="3"
                    ></v-textarea>

                    </v-col>
                </v-row>

                <v-row>
                    <v-col>
                        <v-btn block color="success" @click="closeClase()" >
                            <v-icon class="mx-1">mdi-flag-checkered</v-icon>Finalizar Clase
                        </v-btn>
                    </v-col>
                </v-row>
                   
                </v-card-text>
  
            </v-card>
        </v-dialog>

    </v-card>

</template>

<script>
import AppData       from '@mixins/AppData';
import AppAsistencia from '@pages/asistencia/AppAsistencia'

export default {

    mixins: [AppData],

    components: { 
        'app-asistencia': AppAsistencia,
    },

    props:
    {
        clase: {
            type:   Object,
            defult: () => {}
        },
    },

    watch:
    {
        clase(clase)
        {
            if(clase)
            {
                this.asistencia = this.clase.asistencia
            }
        }
    },

    data () {
        return {
            title:    'Clase',
            resource: 'clase',
            menus: [
                { action: 'addAsistencia',  icon: 'mdi-account-multiple-check',  label: 'Asistencia' },
                { action: 'showDialogClose',  icon: 'mdi-flag-checkered',            label: 'Finalizar Clase' },
            ],
            asistencia: null,
            dialogAsistencia: false,
            dialogCloseClase: false,

            form: {
                tx_observaciones: null,
                id_usuario:       this.idUser,
            }
        }
    },

    methods:
    {
        percentAsistencia()
        {
            return  (this.clase.asistencia) ?  this.clase.asistentes.length*100/ this.clase.asistencia.length : 0;
        },

        addAsistencia()
        {
            this.dialogAsistencia = true
        },

        showDialogClose()
        {
           if(this.clase.fe_completada){ return }
           this.dialogCloseClase = true
        },

        closeClase()
        {
            this.updateResource(`clase/${this.clase.id}/close`, this.form).then( data => {
                this.showMessage(data.msj)
                this.$emit('onUpdateData')
                this.dialogCloseClase = false
            })
        },

        colorAsistencia()
        {
            let percent  =  (this.clase.asistencia) ?  this.clase.asistentes.length * 100 / this.clase.asistencia.length : 0;

            switch (true) {
                case percent == 0 && percent < 25:
                    return 'red'
                    break;
                
                case percent >= 25 && percent < 50 :
                    return 'orange'
                    break;

                case percent >= 50 && percent < 75:
                    return 'amber'
                    break;

                case percent > 75:
                    return 'green'
                    break;
            
                default:
                    return 'red'
                    break;
            }
        },

        closeDialog(dialog, refresh)
        {
            this[dialog]   = false
            if(refresh)    this.list()
        }



   
    }
}
</script>

<style>

</style>
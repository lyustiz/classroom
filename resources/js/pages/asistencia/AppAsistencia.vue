<template>

   <v-card width="100%" flat  class="rounded-xl" height="88vh">

        <v-card-title class="deep-purple white--text py-0">
            <v-row >
                <v-col>
                    <v-row align="center">
                        <v-col class="headline ml-4">
                            Asistencia
                        </v-col>
                    </v-row>
                </v-col>
                <v-col cols="auto">
                    <v-row no-gutters  align="center">
                        <v-col class="text-center  mx-3">
                            <span class="display-2">{{alumnosSelected.length}}</span> / <span class="headline">{{asistencias.length}}</span>
                        </v-col>
                        <v-col class="text-center mx-3">
                            <v-icon size="60" color="amber">mdi-school</v-icon>
                        </v-col>
                    </v-row>
                </v-col>

                <v-col cols="auto" class="my-3">
                       <v-btn icon dark><v-icon @click="$emit('closeDialog')">mdi-close-circle-outline</v-icon></v-btn>
                </v-col>
            </v-row>
        </v-card-title>

        <v-card-text class="py-0">

             <v-item-group v-model="alumnosSelected" multiple > 
                <v-row>
                    <v-col cols="3" v-for="(asistencia, idx) in asistencias" :key="idx" >
                    <v-item v-slot:default="{ active, toggle }" :value="asistencia.id" class="pointer" >
                    <div class="text-center grey lighten-3 rounded-xl pt-2">
                        <v-avatar size="160"  dark color="indigo" v-ripple @click="updateAsistencia(asistencia, active)">
                            <v-img :src="asistencia.alumno.foto.full_url" v-if="asistencia.alumno.foto" @click="toggle">
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
                                v-text="(active) ? 'mdi-account-check': 'mdi-account'"
                                @click="toggle">
                            </v-icon>
                        </v-avatar>

                        <v-toolbar :color="(active) ? 'success lighten-': 'red lighten-1'" class="mt-1 rounded-b-xl" dense dark>
                            <v-row>
                                <v-col>
                                    <p class="text-center mt-4 body-2">{{asistencia.alumno.nb_corto}}</p> 
                                </v-col>
                                 <v-col cols="auto" class="my-1">
                                     <item-menu 
                                        :item="alumno"
                                        btn-color="transparent" 
                                        icon-color="white" 
                                        :small="false"
                                        :menus="menus"
                                        @onItemMenu="onItemMenu($event)"
                                    ></item-menu>
                                 </v-col>
                            </v-row>
                            
                        </v-toolbar>
                    </div>
                    </v-item>
                    </v-col>
                </v-row>
            </v-item-group>

        </v-card-text>

        <pre v-if="$App.debug">{{ $data }}</pre>

        <v-dialog v-model="dialogIncidencia" max-width="95vw" content-class="rounded-xl">
            <alumno-incidencia :alumno="alumno" v-if="dialogIncidencia" @closeModal="closeDialog('dialogIncidencia')"></alumno-incidencia>
        </v-dialog>

        <v-dialog v-model="dialogMensaje" max-width="600" content-class="rounded-xl">
            <app-mensaje 
                :tipo-destinatario="mensaje.tipoDestinatario"
                :tipo-mensaje="mensaje.tipoMensaje"
                :tipo-prioridad="mensaje.tipoPrioridad"
                :id-destinatario="mensaje.idDestinatario"
                v-if="dialogMensaje" 
                @closeModal="closeDialog('dialogMensaje')">
            </app-mensaje>
        </v-dialog>

    </v-card>

</template>

<script>

import AppData from '@mixins/AppData';
import AppAlumnoIncidencia from '@pages/incidencia/AppIncidencia';
import AppMensaje from '@pages/mensaje/AppMensaje';

export default {
    
    mixins: [AppData],

    components: { 
                    'alumno-incidencia' : AppAlumnoIncidencia,
                    'app-mensaje': AppMensaje
                },

    props:
    {
        clase:
        {
            type: Object,
            defalt: () => {}
        },

    },

    created()
    {
        this.asistencias     = this.clase.asistencia
        this.alumnosSelected = this.getAsistentes()
    },

    data() {
        return {
            asistencias:[],
            alumnos: [],
            alumnosSelected: [],
            menus: [
                { action: 'addIncidencia',    icon: 'mdi-account-alert',    label: 'Incidencia / Sanciones' },
                { action: 'sendMensaje',     icon: 'mdi-mail',              label: 'Enviar Mensaje'  },
            ],
            dialogIncidencia: false,
            dialogMensaje:    false,
            alumno: null,

            form:
            {
                bo_asistencia :   null,
                tx_observaciones: null,
                id_usuario:       this.idUser,
            },

        }
    },

    methods:
    {

        getAsistentes()
        {
            let asintentes = []
            for (const asistente of this.clase.asistentes) {
                asintentes.push(asistente.id)
            }
            return asintentes
        },

        getIdAlumnos()
        {
          /*   let idAlumnos = []
            for (const alumno of this.alumnos) {
                idAlumnos.push( alumno.id )
            }
            return idAlumnos */
        },

        updateAsistencia(asistencia, boAsistencia)
        {
            this.form.bo_asistencia  = boAsistencia;
            
            this.updateResource(`asistencia/${asistencia.id}`, this.form).then( data => {
                this.$emit('onUpdateData')
            });
        },

        addIncidencia(alumno)
        {
            this.alumno    = alumno
            this.dialogIncidencia = true
        },

        sendMensaje(alumno)
        {
            this.dialogMensaje = true

            this.mensaje = {
                tipoDestinatario: 3,
                tipoMensaje: 1,
                tipoPrioridad:    1,
                idDestinatario:   alumno.id,
                asunto:           null,
                mensaje:          null,
                fecha:            null,
                inicio:           null,
                fin:              null
            }
        },

        closeDialog(dialog)
        {
            this.alumno    = null
            this[dialog]   = false
        }

    }
}
</script>

<style>
.item-alumno{
    border-radius: 24px!important;
}
.item-alumno::before{
    border-radius: 24px!important;
}
</style>
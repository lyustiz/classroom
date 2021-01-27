<template>

    <v-card flat :loading="loading" height="90vh">

        <v-card-title class="pa-0">
            <app-simple-toolbar title="Alumnos" @closeModal="$emit('closeModal', true)"></app-simple-toolbar>
        </v-card-title>

        <v-card-text class="pt-2">

            <v-row justify="center" no-gutters>
                <v-select
                    :items="materias"
                    item-text="nb_materia"
                    item-value="id"
                    v-model="materia"
                    label="Seleccione Materia"
                    :loading="loading"
                    dense
                    rounded
                    filled
                    return-object
                    @change="getGrupos($event)"
                ></v-select>
            </v-row >

            <v-row justify="center" no-gutters> 
              
              <v-expansion-panels focusable class="rounded-xl" accordion v-model="section" >
                    <v-expansion-panel v-for="grupo in grupos" :key="grupo.id">
                        <v-expansion-panel-header>
                            <template v-slot:default >
                                <div>
                                    <v-icon color="red" class="mr-1">mdi-school</v-icon> {{ grupo.nb_grupo }} 
                                </div>
                            </template>
                        </v-expansion-panel-header>
                        <v-expansion-panel-content>
                            <v-list subheader two-line dense> 
                                <v-list-item v-for="alumno in grupo.alumno" :key="alumno.id" > 
                                    <v-list-item-avatar>
                                        <v-img :src="alumno.foto.full_url" v-if="alumno.foto"></v-img>
                                        <v-icon v-else color="indigo" size="42">mdi-account-circle</v-icon>
                                    </v-list-item-avatar>
                                    <v-list-item-content>
                                        <v-list-item-title v-text="alumno.nb_alumno"></v-list-item-title>
                                        <v-list-item-subtitle v-text="alumno.tx_documento"></v-list-item-subtitle>
                                    </v-list-item-content>
                                    <v-list-item-icon>
                                        <item-menu :item="alumno" iconColor="deep-purple lighten-5" :menus="itemsMenu" @onItemMenu="onItemMenu($event)" ></item-menu>
                                    </v-list-item-icon>
                                </v-list-item>
                            </v-list>
                        </v-expansion-panel-content>
                    </v-expansion-panel>
                </v-expansion-panels> 

            </v-row>

        </v-card-text>   

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

        <v-dialog v-model="dialogCalificaciones" max-width="600" content-class="rounded-xl">
            <calificacion-alumno :alumno="alumno" :materia="materia" @closeModal="closeDialog('dialogCalificaciones')"></calificacion-alumno>
        </v-dialog>

    </v-card>

</template>

<script>
import AppData from '@mixins/AppData';
import AppMensaje from '@pages/mensaje/AppMensaje';
import CalificacionAlumno from './components/CalificacionAlumno';

export default {

    mixins:     [ AppData ],

    components:
    {
        'app-mensaje' :         AppMensaje,
        'calificacion-alumno' : CalificacionAlumno,
    },

    created()
    {
        this.list()
    },

    computed:
    {
        docente()
        {
            return this.$store.getters['getDocente']
        }
    },

    data () {
        return {
            section: null,
            materias: [],
            grupos:   [],
            materia:  [],
            itemsMenu: [
                { label: 'Calificaciones', icon: 'mdi-clipboard-list', action: 'showCalificaciones' },
                { label: 'Enviar Mensaje', icon: 'mdi-mail', action: 'addMensaje' },
                { label: 'Reiniciar Password', icon: 'mdi-account-key', action: 'resetPassword' },
            ],
            dialogMensaje: false,
            dialogCalificaciones: false,
            alumno: null,
            mensaje:       {}
        }
    },
    methods:
    {
        list()
        {
           this.getResource( `materia/grupo/alumno/docente/${this.docente.id}` ).then( data => this.materias = data )
        },

        getGrupos(materia)
        {
            this.grupos = materia.grupo;
        },

        showCalificaciones(alumno)
        {
            this.alumno = alumno
            this.dialogCalificaciones = true
        },

        addMensaje(alumno)
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
            this[dialog] = false
            this.mensaje = {}
        },

        resetPassword(alumno)
        {
           let form = { id_usuario: this.idUser }
            this.updateResource( `usuario/${alumno.usuario_alumno.id}/resetPassword`, form).then( data => {
                this.showMessage(data.msj)
            });
        }

    }
}
</script>

<style scoped>

</style>
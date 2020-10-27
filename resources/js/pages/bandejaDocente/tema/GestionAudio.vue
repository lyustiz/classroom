<template>

    <v-card class="rounded-xl">
        <v-card-title class="pa-0">
            <tema-toolbar label="Audios" color="orange" icon="mdi-music-box-multiple" @on-add="insert()"></tema-toolbar>
        </v-card-title>
        <v-card-text class="px-1 my-1">
            <v-list dense class="my-">
                <v-list-item color="orange" v-for="audio in audios" :key="audio.id" link @click="show(audio)">
                    <v-list-item-avatar color="white" size="35">
                        <v-icon size="30" color="orange">mdi-music-box-multiple</v-icon>
                    </v-list-item-avatar>
                    <v-list-item-content>
                        <v-list-item-title>{{ audio.archivo.nb_archivo }}</v-list-item-title>
                    </v-list-item-content>
                    <v-list-item-action>
                        <v-btn icon>
                            <v-icon size="20" color="orange lighten-1" @click.stop="updateAudio(audio)">mdi-lead-pencil</v-icon>
                        </v-btn>
                    </v-list-item-action>
                    <v-list-item-action>
                        <v-btn icon>
                            <v-icon size="20" color="red lighten-1" @click.stop="confirmDelete(audio)">mdi-delete</v-icon>
                        </v-btn>
                    </v-list-item-action>
                </v-list-item>
            </v-list>
        </v-card-text>

        <!-- form  -->

        <v-dialog v-model="dialogAudio" width="450" content-class="rounded-xl primary" hide-overlay>
            <visor-audio v-if="dialogAudio" :audio="audio"  @closeDialog="closeDialog('dialogAudio')" ></visor-audio>
        </v-dialog>

        <v-dialog v-model="dialogForm" max-width="500px" content-class="rounded-xl">
            <recurso-form 
                v-if="dialogForm" 
                :tipoRecurso="1" 
                :tipo="tipo" 
                :tema="tema.id" 
                :grado="grado.id" 
                :action="action"
                :item="audio"
                :recurso="recurso"
                @closeDialog="closeDialog('dialogForm', $event)"
             ></recurso-form>
        </v-dialog>

         <form-delete
            :dialog="dialog"
            :loading="loading"
            message="Desea eliminar el Audio Seleccionado?"
            @deleteItem="deleteAudio()"
            @deleteCancel="deleteCancel()"
        ></form-delete>

    </v-card>

</template>

<script>
import DataHelper  from '@mixins/AppData';
import TemaToolbar from './component/TemaToolbar'
import RecursoForm  from '@pages/recurso/AppRecurso.vue'

export default {

    components: { 
        'tema-toolbar': TemaToolbar,
        'recurso-form':  RecursoForm
    },

    mixins:     [ DataHelper ],

    props:
    {
        audios: {
            type:    Array,
            default: () => []
        },

        grado: {
            type:   Object,
            default: () => {}
        },

        materia: {
            type:   Object,
            default: () => {}
        },

        tema: {
            type:   Object,
            default: () => {}
        },


    },

    data () {
        return {
            audio:       null,
            recurso:     null,
            dialogAudio: false,
            dialogForm:  false,
            tipo: {
                tx_icono: 'mdi-music-box-multiple',
                tx_color: 'orange',
                nb_tipo_asignacion: 'audio'
            },
            action: null
        }
    },

    methods:
    {
        insert()
        {
            this.dialogForm = true
            this.action     = 'ins'
            this.audio      = null
        },

        updateAudio(audio) {
            this.action     = 'upd'
            this.audio      = audio.archivo
            this.recurso    = audio
            this.dialogForm = true
        },

        closeDialog(dialog, refresh)
        {
            this[dialog] = false
            this.audio   = null
            this.action  = null
            this.recurso = null

            if(refresh) { 
                this.$emit('onUpdateData') 
            }
        },

        confirmDelete(audio)
        {
            this.audio = audio
            this.dialog = true
        },

        deleteCancel()
        {
            this.audio = null
            this.dialog = false
        },

        deleteAudio()
        {
            this.deleteResource(`recurso/${this.audio.id}`).then( data => {
                this.showMessage(data.msj)
                this.audio  = null
                this.dialog = false
                this.$emit('onUpdateData') 
            })
        },

        show(audio)
        {
            this.audio  =   {   name: audio.archivo.nb_archivo,
                                src: `${audio.archivo.tipo_archivo.tx_base_path}${audio.id}/${audio.archivo.tx_path}` 
                            }
            this.dialogAudio  = true 
        }
    }
}
</script>

<style scoped>

</style>
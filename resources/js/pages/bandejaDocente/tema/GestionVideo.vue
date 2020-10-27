<template>

    <v-card class="rounded-xl">
        <v-card-title class="pa-0">
            <tema-toolbar label="Videos" color="red" icon="mdi-play-box-multiple" @on-add="insert()"></tema-toolbar>
        </v-card-title>
        <v-card-text class="px-1 my-1">
            <v-list dense class="my-">
                <v-list-item color="red" v-for="video in videos" :key="video.id" link @click="show(video)">
                    <v-list-item-avatar color="white" size="35">
                        <v-icon size="30" color="red">mdi-play-box-multiple</v-icon>
                    </v-list-item-avatar>
                    <v-list-item-content>
                        <v-list-item-title>{{ video.nb_enlace }}</v-list-item-title>
                    </v-list-item-content>
                    <v-list-item-action>
                        <v-btn icon>
                            <v-icon size="20" color="orange lighten-1" @click.stop="updateVideo(video)">mdi-lead-pencil</v-icon>
                        </v-btn>
                    </v-list-item-action>
                    <v-list-item-action>
                        <v-btn icon>
                            <v-icon size="20" color="red lighten-1" @click.stop="confirmDelete(video)">mdi-delete</v-icon>
                        </v-btn>
                    </v-list-item-action>
                </v-list-item>
            </v-list>
        </v-card-text>

        <!-- form  -->

        <v-dialog v-model="dialogVideo" width="80vw" content-class="rounded-xl black">
            <visor-video v-if="dialogVideo" :video="video"  @closeDialog="closeDialog('dialogVideo')" ></visor-video>
        </v-dialog>

        <v-dialog v-model="dialogForm" max-width="500px" content-class="rounded-xl">
            <enlace-form 
                :tipo="tipo" 
                :tipoEnlace="2" 
                :tema="tema.id" 
                :action="action"
                :item="video"
                @closeDialog="closeDialog('dialogForm', true)" >
            </enlace-form>
        </v-dialog>

         <form-delete
            :dialog="dialog"
            :loading="loading"
            message="Desea eliminar el Video Seleccionado?"
            @deleteItem="deleteVideo()"
            @deleteCancel="deleteCancel()"
        ></form-delete>

    </v-card>

</template>

<script>
import DataHelper   from '@mixins/AppData';
import TemaToolbar  from './component/TemaToolbar'
import EnlaceForm    from '@pages/enlace/AppEnlaceForm'

export default {

    components: { 
        'tema-toolbar': TemaToolbar,
        'enlace-form':  EnlaceForm
    },

    mixins:     [ DataHelper ],

    props:
    {
        videos: {
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
        }
    },

    data () {
        return {
            video:   null,
            dialogVideo:     false,
            dialogForm:      false,
            tipo: {
                tx_icono: 'mdi-play-box-multiple',
                tx_color: 'red',
                nb_tipo_asignacion: 'video'
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
            this.video      = null
        },

        updateVideo(video) {
            this.video      = video
            this.action     = 'upd'
            this.dialogForm = true
        },

        closeDialog(dialog, refresh)
        {
            this[dialog] = false
            this.video   = null
            this.action  = null

            if(refresh) { 
                this.$emit('onUpdateData') 
            }
        },

        confirmDelete(video)
        {
            this.video = video
            this.dialog = true
        },

        deleteCancel()
        {
            this.video = null
            this.dialog = false
        },

        deleteVideo()
        {
            this.deleteResource(`enlace/${this.video.id}`).then( data => {
                this.showMessage(data.msj)
                this.video = null
                this.dialog = false
                this.$emit('onUpdateData') 
            })
        },

        show(video)
        {
            this.video  =   {   name: video.nb_enlace,
                                src: `${video.tx_url}` 
                            } 
            this.dialogVideo  = true 
        }
    }
}
</script>

<style scoped>

</style>
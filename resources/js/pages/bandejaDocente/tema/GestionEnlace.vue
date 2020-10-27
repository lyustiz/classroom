<template>

    <v-card class="rounded-xl">
        <v-card-title class="pa-0">
            <tema-toolbar label="Enlace" color="blue" icon="mdi-earth" @on-add="insert()"></tema-toolbar>
        </v-card-title>
        <v-card-text class="px-1 my-1">
            <v-list dense class="my-">
                <v-list-item color="blue" v-for="enlace in enlaces" :key="enlace.id" link @click="show(enlace)">
                    <v-list-item-avatar color="white" size="35">
                        <v-icon size="30" color="blue">mdi-earth</v-icon>
                    </v-list-item-avatar>
                    <v-list-item-content>
                        <v-list-item-title>{{ enlace.nb_enlace }}</v-list-item-title>
                    </v-list-item-content>
                    <v-list-item-action>
                        <v-btn icon>
                            <v-icon size="20" color="orange lighten-1" @click.stop="updateEnlace(enlace)">mdi-lead-pencil</v-icon>
                        </v-btn>
                    </v-list-item-action>
                    <v-list-item-action>
                        <v-btn icon>
                            <v-icon size="20" color="red lighten-1" @click.stop="confirmDelete(enlace)">mdi-delete</v-icon>
                        </v-btn>
                    </v-list-item-action>
                </v-list-item>
            </v-list>
        </v-card-text>

        <!-- form  -->

        <v-dialog v-model="dialogEnlace" fullscreen scrollable>
            <visor-enlace v-if="dialogEnlace" :enlace="enlace"  @closeDialog="closeDialog('dialogEnlace')" ></visor-enlace>
        </v-dialog>

        <v-dialog v-model="dialogForm" max-width="500px" content-class="rounded-xl">
            <enlace-form 
                :tipo="tipo" 
                :tipoEnlace="1" 
                :tema="tema.id" 
                :action="action"
                :item="enlace"
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
        enlaces: {
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
            enlace:          null,
            dialogEnlace:    false,
            dialogForm:      false,
            tipo: {
                tx_icono: 'mdi-earth',
                tx_color: 'blue',
                nb_tipo_asignacion: 'enlace'
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
            this.enlace      = null
        },

        updateEnlace(enlace) {
            this.enlace      = enlace
            this.action     = 'upd'
            this.dialogForm = true
        },

        closeDialog(dialog, refresh)
        {
            this[dialog] = false
            this.enlace   = null
            this.action  = null

            if(refresh) { 
                this.$emit('onUpdateData') 
            }
        },

        confirmDelete(enlace)
        {
            this.enlace = enlace
            this.dialog = true
        },

        deleteCancel()
        {
            this.enlace = null
            this.dialog = false
        },

        deleteVideo()
        {
            this.deleteResource(`enlace/${this.enlace.id}`).then( data => {
                this.showMessage(data.msj)
                this.enlace = null
                this.dialog = false
                this.$emit('onUpdateData') 
            })
        },

        show(enlace)
        {
            this.enlace  =   {   name: enlace.nb_enlace,
                                src: `${enlace.tx_url}` 
                            } 
            this.dialogEnlace  = true 
        }
    }
}
</script>

<style scoped>

</style>
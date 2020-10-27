<template>

    <v-card class="rounded-xl">
        <v-card-title class="pa-0">
            <tema-toolbar label="Lecturas" color="purple" icon="mdi-library" @on-add="insert()"></tema-toolbar>
        </v-card-title>
        <v-card-text class="px-1 my-1">
            <v-list dense class="my-">
                <v-list-item color="purple" v-for="lectura in lecturas" :key="lectura.id" link @click="show(lectura)">
                    <v-list-item-avatar color="white" size="35">
                        <v-icon size="30" color="purple">mdi-library</v-icon>
                    </v-list-item-avatar>
                    <v-list-item-content>
                        <v-list-item-title>{{ lectura.archivo.nb_archivo }}</v-list-item-title>
                    </v-list-item-content>
                    <v-list-item-action>
                        <v-btn icon>
                            <v-icon size="20" color="orange lighten-1" @click.stop="updateLectura(lectura)">mdi-lead-pencil</v-icon>
                        </v-btn>
                    </v-list-item-action>
                    <v-list-item-action>
                        <v-btn icon>
                            <v-icon size="20" color="red lighten-1" @click.stop="confirmDelete(lectura)">mdi-delete</v-icon>
                        </v-btn>
                    </v-list-item-action>
                </v-list-item>
            </v-list>
        </v-card-text>

        <!-- form  -->

        <v-dialog v-model="dialogLectura" width="95vw" content-class="rounded-xl">
            <visor-pdf v-if="dialogLectura" :pdf="lectura" @closeDialog="closeDialog('dialogLectura')" ></visor-pdf>
        </v-dialog>

        <v-dialog v-model="dialogForm" max-width="500px" content-class="rounded-xl">
            <recurso-form 
                v-if="dialogForm" 
                :tipoRecurso="3" 
                :tipo="tipo" 
                :tema="tema.id" 
                :grado="grado.id" 
                :action="action"
                :item="lectura"
                :recurso="recurso"
                @closeDialog="closeDialog('dialogForm', $event)"
             ></recurso-form>
        </v-dialog>

         <form-delete
            :dialog="dialog"
            :loading="loading"
            message="Desea eliminar la Lectura Seleccionado?"
            @deleteItem="deleteLectura()"
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
        lecturas: {
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
            lectura:       null,
            recurso:     null,
            dialogLectura: false,
            dialogForm:  false,
            tipo: {
                tx_icono: 'mdi-library',
                tx_color: 'purple',
                nb_tipo_asignacion: 'lectura'
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
            this.lectura      = null
        },

        updateLectura(lectura) {
            this.action     = 'upd'
            this.lectura      = lectura.archivo
            this.recurso    = lectura
            this.dialogForm = true
        },

        closeDialog(dialog, refresh)
        {
            this[dialog] = false
            this.lectura   = null
            this.action  = null
            this.recurso = null

            if(refresh) { 
                this.$emit('onUpdateData') 
            }
        },

        confirmDelete(lectura)
        {
            this.lectura = lectura
            this.dialog = true
        },

        deleteCancel()
        {
            this.lectura = null
            this.dialog = false
        },

        deleteLectura()
        {
            this.deleteResource(`recurso/${this.lectura.id}`).then( data => {
                this.showMessage(data.msj)
                this.lectura  = null
                this.dialog = false
                this.$emit('onUpdateData') 
            })
        },

        show(lectura)
        {
            this.lectura  =   {   name: lectura.archivo.nb_archivo,
                                src: `${lectura.archivo.tipo_archivo.tx_base_path}${lectura.id}/${lectura.archivo.tx_path}` 
                            }
            this.dialogLectura  = true 
        }
    }
}
</script>

<style scoped>

</style>
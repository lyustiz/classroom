<template>

    <v-card class="rounded-xl" min-height="200px">
        <v-card-title class="pa-0">
            <tema-toolbar label="Tareas" color="deep-purple" icon="mdi-notebook" @on-add="add()"></tema-toolbar>
        </v-card-title>
        <v-card-text class="px-1 my-1">
            <v-list dense class="my-">

                <v-list-item color="amber" v-for="tarea in tareas" :key="tarea.id" link @click="show(tarea)">
                    <v-list-item-avatar color="white" size="35">
                        <v-icon size="30" color="deep-purple">mdi-notebook</v-icon>
                    </v-list-item-avatar>
                    <v-list-item-content>
                        <v-list-item-title>{{ tarea.nb_tarea }}</v-list-item-title>
                    </v-list-item-content>
                    <v-list-item-action>
                        <v-btn icon :loading="loading">
                            <v-icon size="20" color="amber lighten-1" @click.stop="updateTarea(tarea)">mdi-lead-pencil</v-icon>
                        </v-btn>
                    </v-list-item-action>
                    <v-list-item-action>
                        <v-btn icon :loading="loading">
                            <v-icon size="20" color="red lighten-1" @click.stop="confirmDelete(tarea)">mdi-delete</v-icon>
                        </v-btn>
                    </v-list-item-action>
                </v-list-item>

                <v-expand-x-transition>   
                <v-list-item color="amber" class="rounded-pill" v-if="addTarea">
                    <v-list-item-content>
                        <v-list-item-title>
                            <v-text-field
                                :rules="[rules.required]"
                                v-model="form.nb_tarea"
                                label="Nombre de la Tarea"
                                dense
                                filled
                                rounded
                                hide-details
                                single-line
                                autofocus
                            ></v-text-field>
                        </v-list-item-title>
                    </v-list-item-content>

                    <v-list-item-action>
                        <div>
                        <v-btn icon small :loading="loading">
                            <v-icon size="26" color="success lighten-1" @click.stop="save()">mdi-plus-circle</v-icon>
                        </v-btn>
                        <v-btn icon small :loading="loading">
                            <v-icon size="26" color="red lighten-1" @click.stop="cancel()">mdi-close-circle</v-icon>
                        </v-btn>
                        </div>
                    </v-list-item-action>
                </v-list-item>
                </v-expand-x-transition> 

            </v-list>

        </v-card-text>

        <v-dialog v-model="dialogForm" width="80vw" scrollable content-class="rounded-xl">
            <tarea-form 
                v-if="dialogForm"
                :item="tarea"
                @closeDialog="closeDialog('dialogForm', $event)"
                action="upd"
             ></tarea-form>
        </v-dialog>

        <form-delete
            :dialog="dialog"
            :loading="loading"
            message="¿Desea eliminar la Tarea Seleccionada?"
            @deleteItem="deleteTarea()"
            @deleteCancel="deleteCancel()"
        ></form-delete>

    </v-card>

</template>

<script>
import DataHelper     from '@mixins/AppData';
import TemaToolbar    from './component/TemaToolbar'
import AppTareaForm   from '@pages/tarea/AppTareaForm'

export default {

    components: { 
        'tema-toolbar': TemaToolbar,
        'tarea-form':  AppTareaForm,
    },

    mixins:     [ DataHelper ],

    props:
    {
        tareas: {
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

    created()
    {
        this.form.id_grado   = this.grado.id
        this.form.id_tema    = this.tema.id
        this.form.id_materia = this.materia.id
    },

    watch:
    {
        tema(tema)
        {
            if(tema)
            {
                this.form.id_tema = this.tema.id
            }
        }
    },

    data () {
        return {
            tarea:        null,
            dialogForm:    false,
            form: {
                nb_tarea:         null,
                tx_descripcion:   null,
                id_tipo_tarea:    null,
                id_grado:         null,
                id_materia:       null,
                id_tema:          null,
                nu_peso:          0,
                tx_observaciones: null,
                id_status:        2,
                id_usuario:       this.idUser,
            },
            action:   null,
            addTarea: false,
        }
    },

    methods:
    {
        insert()
        {
            this.dialogForm = true
            this.action     = 'ins'
            this.tarea      = null
        },

        updateTarea(tarea) {
            this.action     = 'upd'
            this.tarea  = tarea
            this.dialogForm = true
        },

        closeDialog(dialog, refresh)
        {
            this[dialog]   = false
            this.tarea    = null
            this.action    = null

            if(refresh) { 
                this.$emit('onUpdateData') 
            }
        },

        add()
        {
            this.resetForm()
            this.addTarea = !this.addTarea 
        },

        save()
        {
            if(!this.form.nb_tarea) return

            this.storeResource('tarea', this.form).then( data => {
                this.showMessage(data.msj)
                this.resetForm()
                this.addTarea = false
                this.$emit('onUpdateData') 
            })
        },

        cancel()
        {
            this.addTarea = false
            this.resetForm()
        },

        resetForm()
        {
            this.form.nb_tarea = null;
        },

        confirmDelete(tarea)
        {
            this.tarea = tarea
            this.dialog = true
        },

        deleteCancel()
        {
            this.tarea = null
            this.dialog = false
        },

        deleteTarea()
        {
            this.deleteResource(`tarea/${this.tarea.id}`).then( data => {
                this.showMessage(data.msj)
                this.tarea  = null
                this.dialog = false
                this.$emit('onUpdateData') 
            })
        },

        show(tarea)
        {
            console.log(tarea)
            this.tarea       = tarea 
            this.dialogTarea = true 
        }
    }
}
</script>

<style scoped>

</style>
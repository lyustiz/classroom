<template>

    <v-card class="rounded-xl" min-height="200px">
        <v-card-title class="pa-0">
            <tema-toolbar label="Actividades" color="amber" icon="mdi-rocket-launch" @on-add="add()"></tema-toolbar>
        </v-card-title>
        <v-card-text class="px-1 my-1">
            <v-list dense class="my-">
                <v-list-item color="amber" v-for="actividad in actividades" :key="actividad.id" link @click="show(actividad)">
                    <v-list-item-avatar color="white" size="35">
                        <v-icon size="30" color="amber">mdi-rocket-launch</v-icon>
                    </v-list-item-avatar>
                    <v-list-item-content>
                        <v-list-item-title>{{ actividad.nb_actividad }}</v-list-item-title>
                    </v-list-item-content>
                    <v-list-item-action>
                        <v-btn icon :loading="loading">
                            <v-icon size="20" color="amber lighten-1" @click.stop="updateActividad(actividad)">mdi-lead-pencil</v-icon>
                        </v-btn>
                    </v-list-item-action>
                    <v-list-item-action>
                        <v-btn icon :loading="loading">
                            <v-icon size="20" color="red lighten-1" @click.stop="confirmDelete(actividad)">mdi-delete</v-icon>
                        </v-btn>
                    </v-list-item-action>
                </v-list-item>

                <v-expand-x-transition>   
                <v-list-item color="amber" class="rounded-pill" v-if="addActividad">
                    <v-list-item-content>
                        <v-list-item-title>
                            <v-text-field
                                :rules="[rules.required]"
                                v-model="form.nb_actividad"
                                label="Nombre de Actividad"
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

        <!-- form  -->

        <v-dialog v-model="dialogActividad" fullscreen scrollable persistent>
            <app-actividad v-if="dialogActividad" :actividad="actividad"  @closeDialog="closeDialog('dialogActividad')" ></app-actividad>
        </v-dialog>

        <v-dialog v-model="dialogForm" width="100vw" scrollable  content-class="rounded-xl">
            <actividad-form 
                v-if="dialogForm"
                :tema="tema" 
                :action="action"
                :item="actividad"
                @closeDialog="closeDialog('dialogForm', $event)"
             ></actividad-form>
        </v-dialog>

         <form-delete
            :dialog="dialog"
            :loading="loading"
            message="Desea eliminar el Actividad Seleccionado?"
            @deleteItem="deleteActividad()"
            @deleteCancel="deleteCancel()"
        ></form-delete>

    </v-card>

</template>

<script>
import DataHelper        from '@mixins/AppData';
import TemaToolbar       from './component/TemaToolbar'
import AppActividad      from '@pages/actividad/AppActividad.vue'
import AppActividadForm  from '@pages/actividad/AppActividadForm.vue'

export default {

    components: { 
        'tema-toolbar':   TemaToolbar,
        'app-actividad':  AppActividad,
        'actividad-form': AppActividadForm
    },

    mixins:     [ DataHelper ],

    props:
    {
        actividades: {
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
        this.form.id_tema = this.tema.id
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
            actividad:       null,
            recurso:         null,
            dialogActividad: false,
            dialogForm:      false,
            tipo: {
                tx_icono: 'mdi-rocket-launch',
                tx_color: 'amber',
                nb_tipo_asignacion: 'actividad'
            },
            form: {
                nb_actividad: null,
                id_tema:      null,
                id_status:    1,
                id_usuario:   this.idUser
            },
            action: null,
            addActividad: false,
        }
    },

    methods:
    {
        insert()
        {
            this.dialogForm = true
            this.action     = 'ins'
            this.actividad      = null
        },

        updateActividad(actividad) {
            this.action     = 'upd'
            this.actividad  = actividad
            this.dialogForm = true
        },

        closeDialog(dialog, refresh)
        {
            this[dialog]     = false
            this.actividad   = null
            this.action  = null

            if(refresh) { 
                this.$emit('onUpdateData') 
            }
        },

        add()
        {
            this.resetForm()
            this.addActividad = !this.addActividad 
        },

        save()
        {
            if(!this.form.nb_actividad) return

            this.storeResource('actividad', this.form).then( data => {
                this.showMessage(data.msj)
                this.resetForm()
                this.addActividad = false
                this.$emit('onUpdateData') 
            })
        },

        cancel()
        {
            this.addActividad = false
            this.resetForm()
        },

        resetForm()
        {
            this.form.nb_actividad = null;
        },

        confirmDelete(actividad)
        {
            this.actividad = actividad
            this.dialog    = true
        },

        deleteCancel()
        {
            this.actividad = null
            this.dialog    = false
        },

        deleteActividad()
        {
            this.deleteResource(`actividad/${this.actividad.id}`).then( data => {
                this.showMessage(data.msj)
                this.actividad = null
                this.dialog    = false
                this.$emit('onUpdateData') 
            })
        },

        show(actividad)
        {
            this.actividad       = actividad 
            this.dialogActividad = true 
        }
    }
}
</script>

<style scoped>

</style>
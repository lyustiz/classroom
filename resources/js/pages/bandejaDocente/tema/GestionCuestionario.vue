<template>

    <v-card class="rounded-xl" min-height="200px">
        <v-card-title class="pa-0">
            <tema-toolbar label="Cuestionarios" color="teal" icon="mdi-order-bool-descending-variant" @on-add="add()"></tema-toolbar>
        </v-card-title>
        <v-card-text class="px-1 my-1">
            <v-list dense class="my-">
                <v-list-item color="amber" v-for="prueba in cuestionarios" :key="prueba.id" link @click="show(prueba)">
                    <v-list-item-avatar color="white" size="35">
                        <v-icon size="30" color="teal">mdi-order-bool-descending-variant</v-icon>
                    </v-list-item-avatar>
                    <v-list-item-content>
                        <v-list-item-title>{{ prueba.nb_prueba }}</v-list-item-title>
                    </v-list-item-content>
                    <v-list-item-action>
                        <v-btn icon :loading="loading">
                            <v-icon size="20" color="amber lighten-1" @click.stop="updatePrueba(prueba)">mdi-lead-pencil</v-icon>
                        </v-btn>
                    </v-list-item-action>
                    <v-list-item-action>
                        <v-btn icon :loading="loading">
                            <v-icon size="20" color="red lighten-1" @click.stop="confirmDelete(prueba)">mdi-delete</v-icon>
                        </v-btn>
                    </v-list-item-action>
                </v-list-item>

                <v-expand-x-transition>   
                <v-list-item color="amber" class="rounded-pill" v-if="addPrueba">
                    <v-list-item-content>
                        <v-list-item-title>
                            <v-text-field
                                :rules="[rules.required]"
                                v-model="form.nb_prueba"
                                label="Cuestionario"
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

        <v-dialog v-model="dialogPrueba" fullscreen scrollable>
            <visor-prueba v-if="dialogPrueba" :prueba="prueba"  @closeDialog="closeDialog('dialogPrueba')" ></visor-prueba>
        </v-dialog>

        <v-dialog v-model="dialogForm" fullscreen scrollable>
            <prueba-form 
                v-if="dialogForm"
                :prueba="prueba"
                @closeDialog="closeDialog('dialogForm', $event)"
             ></prueba-form>
        </v-dialog>

         <form-delete
            :dialog="dialog"
            :loading="loading"
            message="Desea eliminar el Cuestionario Seleccionado?"
            @deleteItem="deletePrueba()"
            @deleteCancel="deleteCancel()"
        ></form-delete>

    </v-card>

</template>

<script>
import DataHelper     from '@mixins/AppData';
import TemaToolbar    from './component/TemaToolbar'
import AppPruebaForm  from '@pages/prueba/AppPruebaForm'
import VisorPrueba    from '@pages/prueba/VisorPrueba'

export default {

    components: { 
        'tema-toolbar': TemaToolbar,
        'prueba-form':  AppPruebaForm,
        'visor-prueba': VisorPrueba
    },

    mixins:     [ DataHelper ],

    props:
    {
        cuestionarios: {
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
            prueba:        null,
            recurso:       null,
            dialogPrueba:  false,
            dialogForm:    false,
            form: {
                nb_prueba:        null,
                id_grado:         null,
                id_materia:       null,
                bo_ver_resultado: 1,
                nu_minutos:       0,
                nu_peso:          0,
                tx_observaciones: null,
                id_status:        2,
                id_usuario:       this.idUser,   
            },
            action: null,
            addPrueba: false,
        }
    },

    methods:
    {
        insert()
        {
            this.dialogForm = true
            this.action     = 'ins'
            this.prueba     = null
        },

        updatePrueba(prueba) {
            this.action     = 'upd'
            this.prueba  = prueba
            this.dialogForm = true
        },

        closeDialog(dialog, refresh)
        {
            this[dialog]   = false
            this.prueba    = null
            this.action    = null

            if(refresh) { 
                this.$emit('onUpdateData') 
            }
        },

        add()
        {
            this.resetForm()
            this.addPrueba = !this.addPrueba 
        },

        save()
        {
            if(!this.form.nb_prueba) return

            this.storeResource('prueba', this.form).then( data => {
                this.showMessage(data.msj)
                this.resetForm()
                this.addPrueba = false
                this.$emit('onUpdateData') 
            })
        },

        cancel()
        {
            this.addPrueba = false
            this.resetForm()
        },

        resetForm()
        {
            this.form.nb_prueba = null;
        },

        confirmDelete(prueba)
        {
            this.prueba = prueba
            this.dialog = true
        },

        deleteCancel()
        {
            this.prueba = null
            this.dialog = false
        },

        deletePrueba()
        {
            this.deleteResource(`prueba/${this.prueba.id}`).then( data => {
                this.showMessage(data.msj)
                this.prueba  = null
                this.dialog  = false
                this.$emit('onUpdateData') 
            })
        },

        show(prueba)
        {
            console.log(prueba)
            this.prueba       = prueba 
            this.dialogPrueba = true 
        }
    }
}
</script>

<style scoped>

</style>
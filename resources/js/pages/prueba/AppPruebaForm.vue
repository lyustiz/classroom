<template>

    <v-form ref="form" v-model="valid" lazy-validation>

    <v-card :loading="loading" flat>

        <v-card-title class="tile pa-0">
            <app-simple-toolbar title="Cuestionario" backgroundColor="red" dense dark @closeModal="$emit('closeDialog')" ></app-simple-toolbar>
        </v-card-title>

        <v-card-text class="mt-3">

        <v-row no-gutters>

        <v-col cols="12">
            <v-text-field
                :rules="[rules.required]"
                v-model="form.nb_prueba"
                label="Nombre de la Prueba"
                dense
                rounded
                filled
            ></v-text-field>
        </v-col>

        <!-- <v-checkbox
            :rules="[rules.check]"
            v-model="form.bo_ver_resultado"
            label="Mostrar Resultados"
            :true-value="1"
            :false-value="0"
            :indeterminate="(form.bo_ver_resultado== null)"
            dense
            class="col-auto  ml-3"
        ></v-checkbox> -->

                                                        
        </v-row>

        <v-row no-gutters>
            <v-col>
                <app-pregunta :prueba="prueba"></app-pregunta>
            </v-col>
        </v-row>

        </v-card-text>

        <v-card-actions>
            <v-spacer></v-spacer>
            <form-buttons
                @update="update()"
                @clear="$emit('closeDialog')"
                @cancel="$emit('closeDialog')"
                action="upd"
                :valid="valid"
                :loading="loading"
            ></form-buttons>
        </v-card-actions>

        <pre v-if="$App.debug">{{ $data }}</pre>

    </v-card>
    
    </v-form>

</template>

<script>

import AppData     from '@mixins/AppData';
import AppPregunta from '@pages/pregunta/AppPregunta';

export default {

    mixins: [AppData],

    props:
    {
        prueba:{
            type: Object,
            default: true
        },
    },

    components: {
        'app-pregunta': AppPregunta
    },

    created()
    {
        this.form.nb_prueba     = this.prueba.nb_prueba
        this.form.bo_resultados = this.prueba.bo_resultados
    },

    data() {
        return {
            form: {
                nb_prueba: null,
                bo_ver_resultado: null,
                id_status: null,
                id_usuario: null,
            },
            default:{
                id_status: 1,
                bo_ver_resultado: 1
            },
            menuAyudaOpcional: false
        }
    },

    methods:
    {
        
        update()
        {
           this.updateResource(`prueba/${this.prueba.id}`, this.form).then( data =>{
               this.showMessage(data.msj)
               this.$emit('closeDialog', true)
           })
        }
        
    }
}
</script>

<style>
</style>
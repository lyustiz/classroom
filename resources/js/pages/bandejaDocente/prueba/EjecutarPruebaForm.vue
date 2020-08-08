<template>

    <v-form ref="form" v-model="valid" lazy-validation>

    <v-card :loading="loading" flat>

         <v-card-title class="pa-0">
            <app-simple-toolbar title="Ejecutar Prueba" @closeModal="$emit('closeModal', true)"></app-simple-toolbar>
        </v-card-title>

        <v-card-text>

        <v-row>

            <v-col cols="12" md="5">
                <v-select
                :items="selectMinutos"
                v-model="form.nu_minutos"
                :rules="[rules.select]"
                label="Tiempo de ejecucion"
                :hint=" ((form.nu_minutos) ? form.nu_minutos : 0) + ' Minutos'"
                persistent-hint
                :loading="loading"
                dense
                ></v-select>
            </v-col>
                          
            <v-tooltip right v-model="menuVerResultado" color="success" >
            <template v-slot:activator="{ on }">
                <v-checkbox
                    v-on="on"
                    :rules="[rules.check]"
                    v-model="form.bo_ver_resultado"
                    label="Mostrar Resultados"
                    :true-value="1"
                    :false-value="0"
                    :indeterminate="(form.bo_ver_resultado== null)"
                    dense
                    class="col-auto  ml-3"
                    append-icon="mdi-help-rhombus"
                    @click:append="menuVerResultado =!menuVerResultado "
                ></v-checkbox>
                </template>
                <span>Indica si se mostraran los resultados al finalizar la prueba</span>
            </v-tooltip>
                                    
        </v-row>

        </v-card-text>

        <v-card-actions>
            <v-spacer></v-spacer>
            <form-buttons
                @update="update()"
                @cancel="cancel()"
                :action="action"
                :valid="valid"
                :loading="loading"
            ></form-buttons>
        </v-card-actions>

        <pre v-if="$App.debug">{{ $data }}</pre>

    </v-card>
    
    </v-form>

</template>

<script>

import Appform from '@mixins/Appform';

export default {
    mixins: [Appform],
    data() {
        return {
            resource: 'prueba/ejecutar',
            form:
            {
                id: 	               null,
				bo_ver_resultado: 	   null,
				nu_minutos: 	       null,
				id_usuario: 	       null,
            },
            defaultForm:{
                bo_ver_resultado:  0,
            },
            menuVerResultado: false,
            evaluaciones: [
                {'id': 1, 'nb_evaluacion': 'Prueba corta Nro1' },
                {'id': 2, 'nb_evaluacion': 'Prueba corta Nro2' }
            ]
        }
    },

    methods:
    {

    }
}
</script>

<style>
</style>
<template>

    <v-form ref="form" v-model="valid" lazy-validation>

    <v-card :loading="loading" flat>

         <v-card-title class="pa-0">
            <app-simple-toolbar title="Asignar Prueba" @closeModal="$emit('closeModal', true)"></app-simple-toolbar>
        </v-card-title>

        <v-card-text>

        <v-row>

            <v-col cols="12">
                <v-select
                :items="evaluaciones"
                item-text="nb_evaluacion"
                item-value="id"
                v-model="form.id_evaluacion_detalle"
                :rules="[rules.select]"
                label="Evaluacion"
                hint="Asociar Evaluacion"
                persistent-hint
                :loading="loading"
                dense
                ></v-select>
            </v-col>

            <v-col cols="12">
                <v-text-field
                    :rules="[rules.max(100)]"
                    v-model="form.tx_observaciones"
                    label="Observaciones"
                    placeholder="Indique Observaciones"
                    dense
                ></v-text-field>
            </v-col>
                                    
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

    props:
    {
        grupo: {
            type:    Number,
            default: null
        } 
    },

    data() 
    {
        return {
            resource: 'prueba/asignar',
            form:
            {
                id: 	               null,
                id_grupo:              null,
				id_evaluacion_detalle: null,
				tx_observaciones: 	   null,
				id_usuario: 	       null,
            },
            evaluaciones: [
                {'id': 1, 'nb_evaluacion': 'Prueba corta Nro1' },
                {'id': 2, 'nb_evaluacion': 'Prueba corta Nro2' }
            ]
        }
    },

    methods:
    {
        extraActions()
        {
            this.form.id_grupo = this.grupo
        }
    }
}
</script>

<style>
</style>
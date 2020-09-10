<template>

    <v-form ref="form" v-model="valid" lazy-validation>

    <v-card :loading="loading" flat>

         <v-card-title class="pa-0">
            <app-simple-toolbar title="Asignar Prueba" @closeModal="$emit('closeModal', true)"></app-simple-toolbar>
        </v-card-title>

        <v-card-text class="mt-4">

        <v-row>

            <v-col cols="12">
                <v-select
                :items="selects.evaluacion"
                item-text="tx_tema"
                item-value="id"
                v-model="form.id_evaluacion"
                :rules="[rules.select]"
                label="Evaluacion"
                hint="Asignar Evaluacion del tipo 'Prueba' (Ver modulo Evaluaciones)"
                persistent-hint
                :loading="loading"
                dense
                ></v-select>
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

        <pre v-if="$App.debug">{{ $props }}</pre>

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
                id: 	          null,
                id_grupo:         null,
				id_evaluacion:    null,
				tx_observaciones: null,
				id_usuario: 	  null,
            },
            selects:
            {
                evaluacion: [ `/materia/${this.item.id_materia}/grupo/${this.grupo}/prueba` ]
            },
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
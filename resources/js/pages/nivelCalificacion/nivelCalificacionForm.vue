<template>

    <v-form ref="form" v-model="valid" lazy-validation>

    <v-card :loading="loading" flat >

        <v-card-text>

        <v-row>
                 
        <v-col cols="12">
            <v-text-field
                :rules="[rules.required]"
                v-model="form.nb_nivel_calificacion"
                label="Nivel Calificacion"
                placeholder="Indique Nivel Calificacion"
                dense
            ></v-text-field>
        </v-col>
                  
        <v-col cols="12">
            <v-text-field
                :rules="[rules.max(80)]"
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
                @store="store()"
                @clear="clear()"
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
            resource: 'nivelCalificacion',
            form:
            {
                id: 	               null,
				nb_nivel_calificacion: null,
				tx_observaciones: 	   null,
				id_status: 	           null,
				id_usuario: 	       null,
            },
        }
    },

    methods:
    {

    }
}
</script>

<style>
</style>
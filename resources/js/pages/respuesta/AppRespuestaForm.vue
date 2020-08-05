<template>

    <v-form ref="form" v-model="valid" lazy-validation>

    <v-card :loading="loading" flat>

        <v-card-text>

        <v-row>

                 
        <v-col cols="8" >
            <v-text-field
                :rules="[rules.required]"
                v-model="form.nb_respuesta"
                label="Respuesta"
                placeholder="Indique Respuesta"
                dense
            ></v-text-field>
        </v-col>

         <v-tooltip right v-model="ayudaCorrecta" color="success" >
        <template v-slot:activator="{ on }">
            <v-checkbox
                v-on="on"
                :rules="[rules.check]"
                v-model="form.bo_correcta"
                label="Correcta"
                :true-value="1"
                :false-value="0"
                :indeterminate="(form.bo_correcta== null)"
                dense
                class="col-3 ml-3"
                append-icon="mdi-help-rhombus"
                @click:append="ayudaCorrecta =!ayudaCorrecta "
            ></v-checkbox>
        </template>
        <span>Indica si la respuesta se considera correcta para otorgar puntos</span>
       </v-tooltip>
           
                          
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

    props: 
    {
        pregunta: {
            type: Object,
            default: () =>{}
        }
    },

    data() {
        return {
            resource: 'respuesta',
            form:
            {
                id: 	          null,
				nb_respuesta: 	  null,
				id_pregunta: 	  null,
				bo_correcta: 	  null,
				nu_valor: 	      null,
				tx_observaciones: null,
				id_status: 	      null,
				id_usuario: 	  null,
            },
            defaultForm:{
                bo_correcta:  0,
            },
            ayudaCorrecta: false
        }
    },

    methods:
    {
        extraActions(method)
        {
            this.form.id_pregunta = this.pregunta.id
        },

    }
}
</script>

<style>
</style>
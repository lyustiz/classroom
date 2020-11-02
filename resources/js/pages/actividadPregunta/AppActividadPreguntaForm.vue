<template>

    <v-dialog
        :value="dialog"
        persistent 
        :overlay="false"
        max-width="500px"
        content-class="rounded-xl"
    >

    <v-form ref="form" v-model="valid" lazy-validation>

    <v-card :loading="loading" flat>

        <v-card-text>

        <v-container fluid>
           
        <v-row dense>

        <v-col cols="12" >
            <v-text-field
                :rules="[rules.required]"
                v-model="form.nb_pregunta"
                label="Pregunta"
                dense
                prepend-inner-icon="mdi-help"
                filled
                rounded
            ></v-text-field>
        </v-col>

        <v-col cols="12">
            <v-textarea
                prepend-inner-icon="mdi-comment-text-outline"
                :rules="[rules.max(300)]"
                v-model="form.nb_descripcion"
                filled
                rounded
                label="Descripcion"
                value="Indique Descripcion de la pregunta"
                color="darken-3"
                rows="2"
            ></v-textarea>
        </v-col>

         <v-col cols="12" class="text-center mt-n3">
            <v-chip-group v-model="form.id_tipo_pregunta" mandatory color="white">
                <v-chip filter :color="tipo.tx_color" v-for="tipo in selects.tipoPregunta" :key="tipo.id" :filter-icon="tipo.tx_icono" :value="tipo.id" outlined> 
                    {{tipo.nb_tipo_pregunta}}
                </v-chip>
            </v-chip-group>
         </v-col>             

        </v-row>

        </v-container>

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

    </v-dialog>

</template>

<script>

import Appform from '@mixins/Appform';

export default {

    mixins: [Appform],

    props: {

        dialog: {
            type: Boolean,
            default: false
        },

        actividad: {
            type: Object,
            default: () => {}
        },

    },

    data() {
        return {
            resource: 'actividadPregunta',

            form:
            {
                id: 	          null,
				nb_pregunta: 	  null,
				nb_descripcion:   null,
				id_actividad: 	  null,
				id_tipo_pregunta: null,
				bo_opcional: 	  null,
				nu_valor: 	      null,
				nu_orden: 	      null,
				tx_observaciones: null,
				id_status: 	      null,
				id_usuario: 	  null,
            },
            default:{
                id_status:   1,
                bo_opcional: 0,
                nu_valor:    0
            },
            selects:
            {
	 	 	 	tipoPregunta: 	 ['/actividad'],
            },
            
        }
    },

    methods:
    {
        extraActions(method)
        {
            this.form.id_actividad = this.actividad.id
        },

        postResponse()
        {
            //funcion para ejecutar despues de las respuestas de store/update
        },

    }
}
</script>

<style>
</style>
<template>

    <v-card :loading="loading" flat height="90vh" color="white" >

        <v-card-title class="red pa-0">
            <app-simple-toolbar title="Actividad" backgroundColor="red" dense dark @closeModal="$emit('closeDialog')" ></app-simple-toolbar>
        </v-card-title>

        <v-card-text>
        <v-form ref="form" v-model="valid" lazy-validation>
        <v-row no-gutters>

            <v-col cols="12" class="mt-2">
                <v-text-field
                    :rules="[rules.required]"
                    v-model="form.nb_actividad"
                    label="Titulo"
                    dense
                    filled
                    rounded
                ></v-text-field>
            </v-col>

            <v-col cols="6">
                <v-textarea
                    prepend-inner-icon="mdi-lightbulb"
                    :rules="[rules.max(2000)]"
                    v-model="form.tx_descripcion"
                    rounded
                    filled
                    label="Descripcion"
                    color="amber darken-3"
                    rows="4"
                ></v-textarea>
            </v-col>

            <v-col cols="6">
                <foto-actividad 
                    :origenId="item.id" 
                    :maxItems="3" 
                ></foto-actividad>
            </v-col>

            <v-col cols="12">
                <actividad-pregunta :actividad="item"></actividad-pregunta>
            </v-col>

        </v-row>
        </v-form>     
        </v-card-text>
        

        <v-card-actions>
            <v-spacer></v-spacer>
            <form-buttons
                @update="update()"
                @store="store()"
                @clear="clear()"
                @cancel="$emit('closeDialog')"
                :action="action"
                :valid="valid"
                :loading="loading"
            ></form-buttons>
        </v-card-actions>

        <pre v-if="$App.debug">{{ $data }}</pre>

    </v-card>
    
   

</template>

<script>

import Appform       from '@mixins/Appform';
import AppPregunta   from '@pages/actividadPregunta/AppActividadPregunta'
import FotoActividad from '@pages/foto/AppFotoActividad'

export default {

    mixins: [Appform],

    components: {
        'actividad-pregunta': AppPregunta,
        'foto-actividad':     FotoActividad
    },

    props:
    {
        tema: {
            type: Object,
            default: () => {}
        },
    },

    data() {
        return {
            resource: 'actividad',

            form:
            {
                id: 	          null,
				nb_actividad: 	  null,
				id_tema: 	      null,
				tx_descripcion:   null,
				tx_observaciones: null,
				id_status: 	      null,
				id_usuario: 	  null,
            },
            default:
            {
                id_status: 	  1,
            }

        }
    },

    methods:
    {               
        onCreateForm()
        {
            console.log(this.item)
        },

        extraActions(method)
        {           
            
            this.form.id_tema         = this.tema.id
        },

        validResponse(response){
            this.showMessage(response.data.msj)  
        }

    }
}
</script>

<style>
</style>
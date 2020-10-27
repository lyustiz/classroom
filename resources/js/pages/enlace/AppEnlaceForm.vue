<template>

    <v-form ref="form" v-model="valid" lazy-validation>

    <v-card :loading="loading" flat>

        <v-card-title class="deep-purple">
            <v-row no-gutters>
                <v-col>
                    <v-icon v-text="tipo.tx_icono" :color="tipo.tx_color" size="46"></v-icon>
                    <span class="ml-2 my-2 white--text text-capitalize">{{`Agregar ${tipo.nb_tipo_asignacion}`}}</span>
                </v-col>
                <v-col cols="auto" class="mt-2">
                   <v-btn icon dark><v-icon @click="$emit('closeDialog')">mdi-close-circle-outline</v-icon></v-btn>
                </v-col>
            </v-row>
           
        </v-card-title>

        <v-card-text>

        <v-row class="pt-3">

        <v-col cols="12">
            <v-text-field
                :rules="[rules.required]"
                v-model="form.nb_enlace"
                label="Nombre"
                placeholder="Indique Nombre"
                dense
            ></v-text-field>
        </v-col>

         <v-col cols="12" v-if="tipo.nb_tipo_asignacion == 'enlace'">
            <v-text-field
                :rules="[rules.required, rules.url]"
                v-model="form.tx_url"
                label="Url"
                placeholder="Indique Url de la Pagina"
                hint="Ej: https://es.wikipedia.org/wiki/Macroeconomia"
                persistent-hint
                dense
            ></v-text-field>
        </v-col>

        <v-col cols="12" v-if="tipo.nb_tipo_asignacion == 'video'">
            <v-text-field
                :rules="[rules.required, rules.max(150)]"
                v-model="form.tx_url"
                label="Url"
                placeholder="Indique Url de Youtube"
                hint="Ej: https://www.youtube.com/abcdef"
                persistent-hint
                dense
            ></v-text-field>
        </v-col>
          
        <v-col cols="12">
            <v-text-field
                :rules="[rules.max(80)]"
                v-model="form.descripcion"
                label="Descripcion"
                placeholder="Indique Descripcion"
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
                @cancel="$emit('closeDialog')"
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
        tipoEnlace:
        {
            type: Number,
            default: null
        },

        tipo:
        {
            type: Object,
            default: null
        },

        tema:
        {
            type: Number,
            default: null
        } 
    },

    created()
    {
        this.form.id_tipo_enlace = this.tipoEnlace
        this.form.id_tema        = this.tema
        this.form.id_status      = 1
    },

    watch:
    {
        action(action)
        {
            if(action)
            {
                this.form.id_tipo_enlace = this.tipoEnlace
                this.form.id_tema        = this.tema
                this.form.id_status      = 1
            }
        }
    },

    data() {
        return {
            resource: 'enlace',
            form:
            {
                id: 	           null,
				nb_enlace: 	       null,
                id_tipo_enlace:    null,
                id_tema:           null,
				descripcion: 	   null,
				tx_url: 	       null,
				tx_observaciones:  null,
				id_status: 	       null,
				id_usuario: 	   null,
            },
        }
    },

    methods:
    {
        postResponse()
        {
            this.$emit('closeDialog', true)
        },

    }
}
</script>

<style>
</style>
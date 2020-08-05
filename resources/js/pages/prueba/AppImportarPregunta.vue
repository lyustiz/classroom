<template>

    <v-card :loading="loading" flat height="80vh">

        <v-card-title class="pa-0">
            <app-simple-toolbar title="Importar Preguntas" @closeModal="$emit('closeModal', true)"></app-simple-toolbar>
        </v-card-title>

        <v-card-title class="pa-0">
            <v-col cols="12" class="pb-0">
                <v-select
                :items="pruebas"
                item-text="nb_prueba"
                item-value="id"
                v-model="form.id_prueba"
                :rules="[rules.select]"
                label="Pruebas"
                :loading="loading"
                hint="Seleccione una prueba para importar sus preguntas y respuestas"
                persistent-hint
                @change="getPreguntas($event)"
                dense
                filled
                outlined
                rounded
                color="indigo lighten-3"
                ></v-select>
            </v-col>
        </v-card-title>

        <v-card-text>
        
        <template v-if="preguntas.length > 0">
        
        <v-row justify="center" no-gutters> 
            <v-spacer></v-spacer>
            <v-col cols="auto" class="mt-n3 mr-4">
                <v-checkbox label="Todas" v-model="isSelectAll" @click.stop="selectAll(isSelectAll)" :disabled="loading"> </v-checkbox>
            </v-col>
        </v-row>


        <v-row justify="center" no-gutters>
           
            <v-col cols="12" class="mt-n3">

            <v-list subheader dense width="100%" class="rounded-xl" color="indigo lighten-4"> 

                <v-list-item-group v-model="preguntasSelected" multiple class="rounded-xl">
                
                <v-list-item 
                    v-for="(pregunta, idx) in preguntas" :key="idx" :value="pregunta.id" class="rounded-xl"> 

                    <template v-slot:default="{ active }" >

                        <v-list-item-avatar color="grey lighten-4">
                            <v-icon color="indigo" size="28">mdi-help</v-icon>
                        </v-list-item-avatar>

                        <v-list-item-content>
                            <v-list-item-title v-text="pregunta.nb_pregunta"></v-list-item-title>
                            <v-list-item-subtitle>
                                <v-icon 
                                    size="18"
                                    :color="pregunta.tipo_pregunta.tx_color"
                                    v-text="pregunta.tipo_pregunta.tx_icono">
                                </v-icon>
                                <span v-text="pregunta.tipo_pregunta.nb_tipo_pregunta"></span>
                                <span> - ({{(pregunta.respuesta)? pregunta.respuesta.length: 0}} Reepuestas)</span>
                            </v-list-item-subtitle>
                        </v-list-item-content>

                        <v-list-item-action>
                            <v-checkbox color="indigo" :input-value="active" :disabled="loading" ></v-checkbox>
                        </v-list-item-action>

                    </template>

                </v-list-item>

                </v-list-item-group>

            </v-list>

            </v-col>

        </v-row>

        </template>
        
        </v-card-text>

        <v-card-actions>
            <v-spacer></v-spacer>
            <form-buttons
                @store="importarPreguntas()"
                @cancel="cancel()"
                action="ins"
                :valid="isValid"
                :loading="loading"
            ></form-buttons>
        </v-card-actions>

        <pre v-if="$App.debug">{{ $data }}</pre>

    </v-card>
    
</template>

<script>

import AppData from '@mixins/AppData';

export default {

    mixins:     [ AppData ],

    props: 
    {
        prueba: {
            type: Object,
            default: () =>{}
        }
    },

    created()
    {
        this.list()
    },

    computed:
    {
        isSelectAll()
        {
            return this.preguntasSelected.length == this.preguntas.length
        },

        isValid()
        {
            return this.preguntasSelected.length > 0
        }
    },

    data() {
        return {
            resource: 'prueba',
            form:
            {
                preguntas:   [],
                id_prueba:   null,
				id_usuario:  null,
            },
            pruebas: [],
            preguntas: [],
            preguntasSelected: [],
        }
    },

    methods:
    {

        list()
        {
           this.getResource( `prueba/${this.prueba.id}/grado/${this.prueba.id_grado}/importar`)
                           .then( data =>  this.pruebas = data )
        },

        getPreguntas(prueba)
        {
            this.preguntasSelected = [];
            this.getResource( `pregunta/prueba/${prueba}` ).then( data =>  this.preguntas = data )
        },

        selectAll(isSelectAll)
        {
           this.preguntasSelected = [];
           
           if(!isSelectAll)
           {
               this.preguntas.forEach(pregunta => this.preguntasSelected.push(pregunta.id) ,this); 
           }
        },

        cancel()
        {
            this.$emit('closeModal', false)
        },

        importarPreguntas()
        {
            if(this.preguntasSelected.length < 1) return

            this.form.preguntas  = this.preguntasSelected
            this.form.id_prueba  = this.prueba.id
            this.form.id_usuario = this.idUser
            this.postResource( `pregunta/importar`, this.form ).then( data => this.$emit('closeModal', true) )
        }
        
    }
}
</script>

<style>
</style>
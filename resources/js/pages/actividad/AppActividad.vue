<template>

<v-card fluid class="cyan lighten-1">

    <v-card-title class="pa-0 elevation-1">
        <v-row justify="center" class="amber darken-1 px-4" no-gutters>
            <v-col cols="auto">
                <v-icon color="white" class="mt-2 mx-2" size="30">mdi-rocket-launch</v-icon>
            </v-col>
            <v-col class="white--text title my-2"> {{ title }}</v-col>
            <v-spacer></v-spacer>
            <v-col cols="auto">
                <app-button small :size="28" innerClass="ma-1" color="green" label="Volver al Inicio" icon="mdi-home" @click="$emit('closeDialog')" ></app-button>
            </v-col>
        </v-row>
    </v-card-title>

    <v-card-text>

    <v-row justify="center">

        <v-col cols="8">
            
            <v-row>
                <v-alert elevation="2" outlined color="amber lighten-1" icon="mdi-lightbulb-on"  prominent class="white mx-6 rounded-lg text-justify" width="100%">
                    <p class="headline mx-6 font-weight-light black--text">{{ descripcion }}</p>
                </v-alert>
            </v-row>

            <v-row>
                <v-card elevation="2" class="white rounded-lg text-justify mx-6" width="100%">
                    
                    <v-card-text>
                    <v-container>
                    <v-row>
                        <v-col cols="12" v-for="(pregunta, idx) in preguntas" :key="idx" class="rounded-lg grey lighten-4">

                            <div class="white pa-2 rounded-lg mb-2">
                            <p class="mx-1 text--secondary">{{ pregunta.nb_descripcion  }}</p>
                            <h3 class="deep-purple--text title mx-2 mb-1" >{{ idx + 1 }}.- {{  pregunta.nb_pregunta }}</h3>
                            </div>
                            
                            <v-subheader class="white rounded-lg mb-2">
                                <v-icon :color="pregunta.tipo_pregunta.tx_color" v-text="pregunta.tipo_pregunta.tx_icono" class="mr-3"></v-icon>
                                {{pregunta.tipo_pregunta.nb_tipo_pregunta}}  
                                ({{pregunta.tipo_pregunta.tx_observaciones}})
                            </v-subheader>

                            <v-list dense class="rounded-lg pa-1" nav>
                                <v-list-item-group v-model="respuestas" :multiple="pregunta.id_tipo_pregunta == 3" color="deep-purple" class="rounded-xl">
                                    <v-list-item v-for="(respuesta, idx) in pregunta.actividad_respuesta" :key="idx" :value="respuesta.id" :disabled="hasReply">
                                        <template v-slot:default="{ active }">
                                            <v-list-item-avatar size="25" color="grey lighten-5 title font-weight-bold">
                                               {{letras[idx]}}
                                            </v-list-item-avatar>
                                            <v-list-item-content>
                                                <v-list-item-title class="deep-purple--text subtitle-1" v-text="respuesta.nb_respuesta"></v-list-item-title>
                                            </v-list-item-content>
                                            <v-list-item-action>
                                                <v-icon :color="(respuesta.bo_correcta) ? 'green': 'red'" size="24" v-if="active && hasReply">
                                                    {{ (respuesta.bo_correcta) ?  'mdi-checkbox-marked-circle-outline' : 'mdi-close-circle-outline' }}
                                                </v-icon>
                                            </v-list-item-action>
                                            <v-list-item-action>
                                                <v-checkbox :input-value="active" :disabled="loading" color="deep-purple"></v-checkbox> 
                                            </v-list-item-action>
                                        </template>
                                    </v-list-item>
                                </v-list-item-group>
                            </v-list>
                        </v-col>
                    </v-row>
                    <v-row>
                        <v-btn block color="success" class="mt-2" @click="responder()" v-if="!hasReply">responder</v-btn>
                        <v-btn block color="orange" class="mt-2" @click="reintentar()" v-else dark>Intentar Nuevamente</v-btn>
                    </v-row>
                    </v-container>
                    </v-card-text>
                </v-card>
            </v-row>

        </v-col>

        <v-col cols="4">
            <v-carousel :show-arrows="false" :show-arrows-on-hover="true"  width="100%" height="370"  class="rounded-lg white elevation-3" continuous cycle>
                <v-carousel-item v-for="(foto, idx) in fotos" :key="idx">
                    <v-img :src="foto.full_url"  contain ></v-img>
                </v-carousel-item>
            </v-carousel>
        </v-col>
        
    </v-row>
        
    </v-card-text>

     <v-overlay color="green" :opacity="0.3" :value="isCompleted">
         <v-row dense>
             <v-col cols="12" class="text-center">
                 <v-icon size="150" color="green"> mdi-emoticon</v-icon>
             </v-col>
             <v-col cols="12" class="text-center">
                <v-icon size="150" color="green">mdi-thumb-up-outline</v-icon>
             </v-col>
             <v-col cols="12" class="text-center">
                <v-btn  color="success" @click="$emit('closeDialog')">Finalizar</v-btn>
             </v-col>
        </v-row>
    </v-overlay>

    <v-overlay absolute :opacity="0.3" :value="loading">
          <v-icon size="40" color="white" class="mdi-spin">mdi-loading</v-icon>
    </v-overlay>

</v-card>

</template>

<script>

import AppData        from '@mixins/AppData';

export default {

    mixins: [AppData],

    props:
    {
        actividad:{
            type:    Object,
            default: () => {}
        }
    },

    created()
    {
        this.list()
    },

    watch: 
    {
        actividad()
        {
            this.list()
        }
    },

   data()
    {
        return {
            item:        null,
            title:       null,
            descripcion: null,
            preguntas:   [],
            correctas:   [],
            fotos:       [],
            respuestas:  [],
            hasReply:    false,
            isCompleted: false
        }
    },

    methods: {

        list()
        {
            if(this.actividad)
            {
                this.getResource(`actividad/${this.actividad.id}`).then( data => {
                    this.item        = data
                    this.title       = data.nb_actividad
                    this.descripcion = data.tx_descripcion
                    this.preguntas   = data.actividad_pregunta
                    this.fotos       = data.foto
                });
            }
        },

        responder()
        {
            if(this.respuestas.length < 1)
            {
                this.showError('Favor Responder la Actividad')
                return 
            }

            this.hasReply = true
            
            this.getCorrectas()

            let respondidas = {  correcta: [],  incorrecta: []  }

            if(Array.isArray(this.respuestas))
            {
                 for (const respuesta of this.respuestas) {
                    if(this.correctas.includes(respuesta))
                    {
                        respondidas['correcta'].push(respuesta)
                    } else {
                        respondidas['incorrecta'].push(respuesta)
                    }
                }

            } else 
            {
                if(this.correctas.includes(this.respuestas))
                {
                    respondidas['correcta'].push(this.respuestas)
                } else {
                    respondidas['incorrecta'].push(this.respuestas)
                }            
            }

            if(respondidas['incorrecta'] > 0)
            {
                this.showError('Existen respuestas incorrectas.')
                return
            }

            if(respondidas['correcta'].length < this.correctas.length)
            {
                this.showError('La respuesta esta incompleta')
                return
            }

            this.showMessage('Actividad Completada')
            this.isCompleted = true            
        },

        getCorrectas()
        {
            this.correctas = []
            
            for (const pregunta of this.preguntas) {

                for (const respuesta of pregunta.actividad_respuesta) {
                    
                    if( respuesta.bo_correcta )
                    {
                        this.correctas.push(respuesta.id) 
                    }
                }
                
            }
        },

        reintentar()
        {
            this.respuestas    = []
            this.hasReply = false
        }
    }

}
</script>

<style>
.actividad-container{
    min-height: 100vh;
}
</style>
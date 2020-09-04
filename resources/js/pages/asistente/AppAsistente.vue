<template>
      <v-bottom-sheet :value="showAsistente" persistent hide-overlay content-class="asistente-container">
      
      <v-btn fab fixed x-small class="mt-n6 mx-2" color="red" dark @click="closeAsistente()" right>
          <v-icon>close</v-icon>
      </v-btn>


     <v-sheet
    class="mx-auto"
    elevation="8"
    max-width="100vw"
  >
    <v-slide-group
      v-model="stepper"
      class="pa-2"
      center-active
      show-arrows
    >
      <v-slide-item
        v-for="(step, idx) in steps" :key="idx"
        v-slot:default="{ active, toggle }"
      >
        <v-card
          :color="active ? `${step.tx_color}` : `${step.tx_color} lighten-3`"
          class="ma-4"
          height="50"
          width="50"
          @click="toggle"
        >
         
          <v-row class="fill-height" align="center" justify="center" >
            
            <v-menu :value="active" bottom :close-on-content-click="false" absolute :position-y="60">
        
                <v-card max-width="350" min-height="300">
                    <v-card-title primary-title :class="`${step.tx_color} white--text`">
                        {{step.nb_asistente}}
                    </v-card-title>
                    <v-card-text>
                        <v-row>
                            <v-col cols="12">{{step.tx_descripcion}}</v-col>
                            <v-col cols="12">
                                <v-sheet color="amber lighten-3" class="pa-2 rounded text-justify">{{step.tx_observaciones}} </v-sheet>
                            </v-col>
                        </v-row>
                    </v-card-text>
                    <v-card-actions>
                       
                        <v-btn
                            color="primary"
                            x-small fab
                             @click="prev()" >
                            <v-icon>mdi-arrow-left-bold</v-icon>
                        </v-btn>

                        <v-spacer></v-spacer>
                        <v-btn
                            color="success"
                            small
                             @click="navegateToName(step.menu.tx_ruta)" >
                            <v-icon class="mr-2">{{step.menu.tx_icono}}</v-icon>
                            Ir al modulo
                        </v-btn>

                        <v-spacer></v-spacer>

                        <v-btn
                            color="primary"
                            x-small fab
                             @click="next()" >
                            <v-icon >mdi-arrow-right-bold</v-icon>
                        </v-btn>

                    </v-card-actions>
                    
                </v-card>
                
            </v-menu>
            
            
            <v-tooltip top>
                <template v-slot:activator="{ on }">
                    <v-icon color="white" v-on="on" size="38">{{step.menu.tx_icono}}</v-icon>
                </template>
                <span>{{step.nb_asistente}}</span>
            </v-tooltip>

          </v-row>

        </v-card>
      </v-slide-item>
    </v-slide-group>
  </v-sheet>
    </v-bottom-sheet>
</template>

<script>
import AppData from '@mixins/AppData';
export default {

    mixins:     [ AppData ],

    data: () =>
    ({
        steps: [],
        stepper: null
    }),

    created()
    {
        this.list()
    },

    watch:
    {
        perfil(perfil)
        {
            if(perfil)
            {
                this.list()
            }
        }
    },

    computed:
        {
            showAsistente()
            {
                return this.$store.getters['getShowAsistente']
            },

            perfil()
            {
                return this.$store.getters['getProfile']
            },
        },

    methods:
    {
        list()
        {
            this.getResource( `asistente/perfil/${this.perfil.nb_perfil}` ).then( data =>  {
               this.steps = data
            })
        },
        
        closeAsistente()
        {
            this.$store.commit('setShowAsistente', false)
        },

        prev()
        {
            this.stepper = ( this.stepper < 1) ? this.stepper : this.stepper - 1
        },

        next()
        {
            this.stepper = ( this.stepper == this.steps.length-1) ? this.stepper : this.stepper + 1 
        }
    }
}
</script>
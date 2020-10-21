<template>

    <v-form ref="form" v-model="valid" lazy-validation>

    <v-card :loading="loading" flat >

        <div class="deep-purple white--text" >

            <v-container>
            <v-row no-gutters>
                <v-col>

                    <v-row align="center">

                        <v-col cols="auto" class="pointer">
                            <v-btn icon small dark>
                                <v-icon>mdi-chevron-left</v-icon>
                            </v-btn>
                        </v-col>
                    
                        <v-col>
                            <v-row no-gutters>
                                <v-col class="text-center text-capitalize"> {{`${this.months[dia.month-1]}`}}</v-col>
                            </v-row>
                            <v-row no-gutters>
                                <v-col class="text-center display-2 font-weight-light"> {{dia.day.toString().padStart(2,"00")}}</v-col>
                            </v-row>
                        </v-col>

                        <v-col cols="auto" class="pointer">
                            <v-btn flat icon small dark>
                                <v-icon>mdi-chevron-right</v-icon>
                            </v-btn>
                        </v-col>

                    </v-row>
                    
                </v-col>

                <v-col>
                    <v-row align="center">
                        <v-col class="text-center text-capitalize">{{tipo}}</v-col>
                    </v-row>
                    <v-row no-gutters  align="center">
                        <v-col class="text-center text-capitalize">
                            <v-icon size="46" color="amber">mdi-rocket-launch</v-icon>
                        </v-col>
                    </v-row>
                </v-col>

            </v-row>
            </v-container>
            
            
            <!-- <v-row justify="center" no-gutters>
                <v-col class="text-center">{{tipo}}</v-col>
            </v-row>
            <v-row no-gutters>
                <v-col class="text-center"> {{this.months[dia.month-1]}}</v-col>
            </v-row>
            <v-row no-gutters>
                 <v-col class="text-center display-1"> {{dia.day}}</v-col>
            </v-row>
 -->


        </div>

        <v-card-text>

        <v-row>
                 
        <v-col cols="12">
             <v-select
                :items="materias"
                item-text="nb_materia"
                item-value="id"
                v-model="form.id_status"
                :rules="[rules.select]"
                label="Materia"
                :loading="loading"
                dense
                @change="getTemas($event)"
                hide-details=""
            ></v-select>
        </v-col>

        <v-col cols="12">
             <v-select
                :items="temas"
                item-text="nb_tema"
                item-value="id"
                v-model="form.id_tema"
                :rules="[rules.select]"
                label="Tema"
                :loading="loading"
                :disabled="temas.length < 1"
                dense
                hide-details=""
                @change="getActividades($event)"
            ></v-select>
        </v-col>

        <v-col class="pa-1 rounded-lg">
            <v-list dense class="item-container">
                <v-list-item-group v-model="selected" color="deep-purple" multiple>
                    <v-list-item v-for="(actividad, i) in actividades" :key="i" >
                        <template v-slot:default="{ active }" >
                        <v-list-item-icon>
                            <v-icon>mdi-rocket-launch</v-icon>
                        </v-list-item-icon>
                        <v-list-item-content>
                            <v-list-item-title>{{actividad.nb_actividad}}</v-list-item-title>
                        </v-list-item-content>
                        <v-list-item-action>
                            <v-checkbox :input-value="active" :disabled="loading" color="deep-purple"></v-checkbox>
                        </v-list-item-action>
                        </template>
                    </v-list-item>
                </v-list-item-group>
            </v-list>
        </v-col>
                          
        </v-row>

        </v-card-text>

        <v-card-actions>
            <v-spacer></v-spacer>
          <!--   <form-buttons
                @update="update()"
                @store="store()"
                @clear="clear()"
                @cancel="cancel()"
                :action="action"
                :valid="valid"
                :loading="loading"
            ></form-buttons> -->
        </v-card-actions>

        <pre v-if="$App.debug">{{ $data }}</pre>


    </v-card>
    
    </v-form>

</template>

<script>

import DataHelper  from '@mixins/AppData';
import AppCalendar from './AppCalendar'
export default {

    components: {
        'app-calendar':       AppCalendar,
    },

    mixins:     [ DataHelper ],

    props: {

        grupo: {
            type: Object,
            default: () => {}
        },

        dia: {
            type: Object,
            default: () => {}
        },

        tipo:{
            type: String,
            default: null
        }
    },
    
    computed:
    {
        docente()
        {
            return this.$store.getters['getDocente'];
        },
    },

    created()
    {
       this.list()
    },

    data() {
        return {
            materias: [],
            temas:    [],
            form:{
                id: null,
                id_status: null
            },
            selected: [],
            actividades: []
        }
    },

    methods:
    {
        list()
        {
            this.getResource( `materia/grupo/${this.grupo.id}/docente/${this.docente.id}` ).then( data =>  this.materias = data)
        },

        getTemas(materia)
        {
            this.temas = []
            this.getResource( `tema/grado/${this.grupo.grado.id}/materia/${materia}` ).then( data =>  this.temas = data)
        },

        getActividades(tema)
        {
            this.getResource( `actividad/tema/${tema}` ).then( data =>  this.actividades = data)
        }
    }
}
    

</script>

<style scoped>
.item-container{
    height: 200px;
    overflow-y: scroll;
}
</style>
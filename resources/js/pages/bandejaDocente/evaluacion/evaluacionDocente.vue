<template>

    <v-card flat :loading="loading" height="90vh">

        <v-card-title class="pa-0">
            <app-simple-toolbar title="Evaluaciones" @closeModal="$emit('closeModal', true)"></app-simple-toolbar>
        </v-card-title>

        

        <v-card-text class="pt-2">
            <v-row>
            <v-col cols="12" sd="6" md="4">
                <v-select
                    :items="periodos"
                    item-text="nb_periodo"
                    item-value="id"
                    v-model="periodo"
                    label="Seleccione Periodo"
                    :loading="loading"
                    dense
                    rounded
                    filled
                ></v-select>
            </v-col>
            <v-col cols="12" sd="6" md="4">
                <v-select
                    :items="grados"
                    item-text="nb_grado"
                    item-value="id"
                    v-model="grado"
                    label="Seleccione Grado"
                    :loading="loading"
                    dense
                    rounded
                    filled
                    :disabled="periodo == null"
                    return-object
                    @change="getGrupos($event)"
                ></v-select>
            </v-col>

            <v-col cols="12" sd="6" md="4">
                <v-select
                    :items="grupos"
                    item-text="nb_grupo"
                    item-value="id"
                    v-model="grupo"
                    label="Seleccione Grupo"
                    :loading="loading"
                    dense
                    rounded
                    filled
                    return-object
                    :disabled="grupos.length < 1"
                    @change="getPlanesEvaluacion($event)"
                ></v-select>
            </v-col>

            </v-row>

            <v-alert type="warning" :value="true" v-if="planesEvaluacion.length < 1" prominent outlined border="left" class="mt-3">
                Seleccione un Período, Grado y Grupo
            </v-alert>
              
             <v-expansion-panels focusable class="rounded-xl" accordion v-else>
                    <v-expansion-panel v-for="planEvaluacion in planesEvaluacion" :key="planEvaluacion.id">
                        
                        <v-expansion-panel-header>
                            <template v-slot:default >
                                <div>
                                    <v-icon color="red" class="mr-1">mdi-bookshelf</v-icon> {{ planEvaluacion.materia.nb_materia }} 
                                </div>
                            </template>
                        </v-expansion-panel-header>

                        <v-expansion-panel-content>

                            <asignar-evaluacion :planEvaluacion="planEvaluacion"></asignar-evaluacion>

                        </v-expansion-panel-content>

                    </v-expansion-panel>
                </v-expansion-panels>  

        </v-card-text>   

    </v-card>

</template>

<script>
import DataHelper from '@mixins/AppData';
import AsignarEvaluacion  from './AsignarEvaluacion';

export default {

    mixins:     [ DataHelper ],

    components: { 
        'asignar-evaluacion':  AsignarEvaluacion,
    },

    created()
    {
        this.list()
    },

    computed:
    {
        docente()
        {
            return this.$store.getters['getDocente']
        }
    },

    data () {
        return {
           periodos:         [],
           periodo:          null,
           grados:           [],
           grado:            null,
           grupos:           [],
           grupo:            null,
           materia:          [],
           planesEvaluacion: []
        }
    },
    methods:
    {
        list()
        {
            this.planesEvaluacion = []
            this.getResource( `periodo/list` ).then( data => this.periodos   = data )
            this.getGradoDetalle()
        },

        getGradoDetalle()
        {
            this.planesEvaluacion = []
            this.getResource( `grado/planEvaluacion/docente/${this.docente.id}` ).then( data => this.grados   = data )
        },

        getGrupos(grado)
        {
            this.planesEvaluacion = []
            this.grupos = (grado.grupo.length > 0 ) ? grado.grupo : [];
        },

        getPlanesEvaluacion(grupo)
        {
            this.planesEvaluacion = grupo.plan_evaluacion
        } 

       
    }


}
</script>

<style>

</style>
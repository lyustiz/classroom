<template>

    <v-card :loading="loading" flat height="80vh">

    <v-card-title class="pa-0">
        <app-simple-toolbar title="Evaluaciones" @closeModal="$emit('closeModal', true)"></app-simple-toolbar>
    </v-card-title>
    
    <v-card-text class="pt-3" >

        <v-col cols="12" md="6">
            <v-select
                :items="selects.periodo"
                item-text="nb_periodo"
                item-value="id"
                v-model="periodo"
                :rules="[rules.select]"
                label="Seleccione Periodo"
                @change="getMaterias($event)"
                :loading="loading"
                dense
            ></v-select>
        </v-col>

          
            <v-data-table
                :headers="headers"
                :items  ="items"
                item-key="id"
                :loading="loading"
                sort-by=""
                v-if="periodo > 0"
                single-expand
                hide-default-footer
                hide-default-header
                disable-pagination
                disable-sort
                class="rounded-xl"
            >

                <template v-slot:item="{ item, expand, isExpanded }" >
                     <tr :class="(isExpanded) ? 'rounded-xl green lighten-4 ': ''" @click="expand(!isExpanded)">
                        <td class="text-xs-left"> 
                            <v-btn icon color="green">
                                <v-icon color="green">{{ (isExpanded) ? 'mdi-arrow-down-drop-circle-outline' : 'mdi-arrow-right-drop-circle-outline'}}</v-icon>
                            </v-btn> 
                        </td>
                        <td class="text-xs-left">{{ item.nb_materia }}</td>
                    </tr>
                </template>

                <template v-slot:expanded-item="{ headers, item }">
                    <td :colspan="headers.length" class="py-4 text-center mx-auto" >
                      <show-evaluacion :materia="item" :periodo="periodo" :grupo="grupo"></show-evaluacion>
                    </td>
                </template>

            </v-data-table>

            <pre v-if="$App.debug">{{ $data }}</pre>

    </v-card-text>
    </v-card>

</template>

<script>
import DataHelper from '@mixins/AppData';
import AppSelect from '@mixins/AppSelect';
import ShowEvaluacion from './AppShowEvaluacion'

export default {

    components: {
        'show-evaluacion': ShowEvaluacion
    },

    mixins:     [ DataHelper, AppSelect ],

    created()
    {
        this.fillSelects()
    },

    computed:
    {
        grupo()
        {
            return this.$store.getters['getAlumnoGrupo']
        }
    },

    data () {
        return {

            title:    'Evaluaciones',
            periodo:  null,
            headers:  [
                { text: ' ',        value: 'expand'},
                { text: 'Materia',  value: 'nb_materia' },
            ],
            selects:  
            {
                periodo: 	 ['/list'],
            },
        }
    },
    methods:
    {
        getMaterias(periodo)
        {
           this.getResource( `materia/grupo/${this.grupo.id}` ).then( data =>  this.items = data )
        }
    }
}
</script>

<style>
</style>
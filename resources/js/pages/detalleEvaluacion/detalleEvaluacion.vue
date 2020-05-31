<template>

    <list-container :title="title" :head-color="$App.theme.headList" @onMenu="onMenu($event)">

        <template slot="HeadTools">
            <add-button @insItem="insertForm()"></add-button>
        </template>

            <v-col cols="12" md="6">
                <v-select
                :items="selects.grupo"
                item-text="nb_grupo"
                item-value="id"
                v-model="grupo"
                label="Grupo"
                :loading="loading"
                @input="getPlanes()"
                dense
                ></v-select>
            </v-col>

            <v-col cols="12" md="6">
                <v-select
                :items="selects.periodo"
                item-text="nb_periodo"
                item-value="id"
                v-model="periodo"
                label="Periodo"
                :loading="loading"
                @input="getPlanes()"
                dense
                ></v-select>
            </v-col>


            <v-data-table
                :headers="headers"
                :items  ="planes"
                :search ="search"
                item-key="id"
                :loading="loading"
                sort-by=""

            >

                <template v-slot:item="{ item }">
                    <tr>
                        <td class="text-xs-left">
                                    <v-col cols="12" md="6">
                                        <v-select
                                        :items="selects.tipoEvaluacion"
                                        item-text="nb_tipo_evaluacion"
                                        item-value="id"
                                        v-model="form.id_tipo_evaluacion"
                                        :rules="[rules.select]"
                                        label="Tipo Evaluacion"
                                        :loading="loading"
                                        dense
                                        ></v-select>
                                    </v-col>
                            
                            
                            {{ item.tipo_evaluacion.nb_tipo_evaluacion }}</td>
					    <td class="text-xs-left">{{ item.nu_peso }}</td>
						<td class="text-xs-left">{{ item.fe_evaluacion }}</td>
						<td class="text-xs-left">{{ item.tx_tema }}</td>
						<td class="text-xs-left">{{ item.tx_observaciones }}</td>
                     </tr>
                </template>

                

            </v-data-table> 

           <!--  <app-modal
                :modal="modal"
                @closeModal="closeModal()"
                :head-color="$App.theme.headModal"
                :title="title"
            >
                <detalle-evaluacion-form
                    :action="action"
                    :item="item"
                    @closeModal="closeModal()"
                ></detalle-evaluacion-form>

            </app-modal>

            <form-delete
                :dialog="dialog"
                :loading="loading"
                message="Desea eliminar el Registro Seleccionado?"
                @deleteItem="deleteItem()"
                @deleteCancel="deleteCancel()"
            ></form-delete>
 -->
            <app-message></app-message>

            <pre v-if="$App.debug">{{ $data }}</pre>

    </list-container>

</template>

<script>
import listHelper from '@mixins/AppData';
import detalleEvaluacionForm  from './detalleEvaluacionForm';
export default {
    mixins:     [ listHelper],
    components: { 'detalle-evaluacion-form': detalleEvaluacionForm },
    created()
    {
       this.getGrupos()
       this.getPeriodos()
        
    },
    data () {
        return {
            
            title:    'DetalleEvaluacion',
            search:    null,
            grupo:     null,
            periodo:   null,
            planes:    [],
            selects: {
                tipoEvaluacion: [],
                grupo: [],
                periodo: [],
            },

            headers: [
                { text: 'Tipo Evaluacion', value: 'tipo_evaluacion.nb_tipo_evaluacion' },
                { text: 'Peso',   value: 'nu_peso' },
                { text: 'Evaluacion',   value: 'fe_evaluacion' },
                { text: 'Tema',   value: 'tx_tema' },
                { text: 'Observaciones',   value: 'tx_observaciones' },
                { text: 'Acciones', value: 'actions', sortable: false, filterable: false },
            ],
        }
    },
    methods:
    {
        getGrupos()
        {
            this.getResource('grupo').then( data =>  this.selects.grupo = data )
        },

        getPeriodos()
        {
            this.getResource('periodo').then( data =>  this.selects.periodo = data )
        },

        getPlanes()
        {
            if( !this.periodo || !this.grupo) return
            
            this.getResource('planEvaluacion/grupo/'+this.grupo+'/periodo/'+this.periodo)
                .then( data =>  this.planes = data )
        }
    }
}
</script>

<style>
</style>
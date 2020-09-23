<template>

    <v-card>
        
    <app-simple-toolbar title="Carga de Incidencias" @closeModal="$emit('closeModal')"></app-simple-toolbar>  

    <v-card-text>
            
        <v-row >

             <v-col cols="12" md="6">
                <v-text-field
                    v-model="search"
                    append-icon="search"
                    label="Buscar"
                    hide-details
                    clearable
                    dense
                ></v-text-field>
            </v-col>

        </v-row>

            <v-data-table
                :headers="headers"
                :items  ="items"
                :search ="search"
                item-key="id"
                :loading="loading"
                sort-by=""
            >

                <template v-slot:item="{ item }">
                    <tr>
						<td class="text-xs-left">{{ item.fe_incidencia | formatDate }}</td>
						<td class="text-xs-left"> 
                            <list-simple-icon 
                                :label="item.tipo_falta.nb_tipo_falta" 
                                :icon="item.tipo_falta.tx_icono" 
                                :color="item.tipo_falta.tx_color">
                            </list-simple-icon>
                        </td>
						<td class="text-xs-left">{{ item.tx_descripcion }}</td>
						<td class="text-xs-left">{{ item.tipo_sancion.nb_tipo_sancion }}</td>
						<td class="text-xs-left">{{ item.tx_sancion }}</td>
                    
                    </tr>
                </template>

            </v-data-table>



            
            <pre v-if="$App.debug">{{ $data }}</pre>
    </v-card-text>

    </v-card>

</template>

<script>

import listHelper from '@mixins/Applist';

export default {

    mixins:     [ listHelper],

    props: 
    {
        alumno: {
            type:     Object,
            default:  {}
        }
    },

    watch:
    {
        alumno()
        {
            this.list()
        }
    },

    data () {
        return {
            title:    'Incidencia',
            resource: 'incidencia',
            headers: [
                { text: 'Fecha',    value: 'fe_incidencia' },
                { text: 'Tipo Falta',    value: 'tipo_falta.nb_tipo_falta' },
                { text: 'Descripcion',   value: 'tx_descripcion' },
                { text: 'Tipo Sancion',  value: 'tipo_sancion.nb_tipo_sancion' },
                { text: 'Sancion',       value: 'tx_sancion' },
            ],
        }
    },
    methods:
    {
        listUrl()
        {
            return  `${this.apiUrl}incidencia/alumno/${this.alumno.id}`
        }
    }
}
</script>

<style>
</style>
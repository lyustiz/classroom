<template>
            

        <v-data-table
            :headers="headers"
            :items  ="items"
            item-key="id"
            :loading="loading"
            sort-by=""
            hide-default-footer
            dense
            class="green lighten-1 white--text rounded-xl col-12"
        >

        <template v-slot:item="{ item }" >
            
            <tr>
                <td class="text-left" v-text="item.tipo_evaluacion.nb_tipo_evaluacion"></td>
                <td class="text-left" >{{item.nu_peso}} %</td>
                <td class="text-left" v-text="item.tx_tema"></td>
                <td class="text-left" ><v-chip small color="amber lighten-3" >pendiente</v-chip></td>
                <td class="text-left" >{{item.fe_evaluacion | formatDate}}</td>
                <td class="text-left">
                    <app-archivo origen="detalleEvaluacion" :origenId="item.id" :tipoArchivo="1" :hasArchivo="item.archivo.length > 0"></app-archivo>
                </td>
            </tr>
        </template>
    
        </v-data-table>

</template>

<script>
import DataHelper from '@mixins/AppData';
import AppArchivo from '@pages/archivo/AppShowArchivo'

export default {

    components:
    {
        'app-archivo': AppArchivo
    },

    mixins:     [ DataHelper ],

    created()
    {
        this.list()
    },

    watch:
    {
        periodo () { 
            this.items = []
            this.list() 
        },

        materia ()  { 
            this.items = []
            this.list() 
        },

    },

    props:
    {
        grupo: {
            type:    Number,
            default: null 
        },

        periodo: {
            type:    Number,
            default: null
        },

        materia: {
            type:    [ Object],
            default: () => {} 
        },
    },

    data(){
        return {
            item: [],
            items: [],
            headers:  [
                { text: 'Evaluacion',  value: 'tipo_evaluacion.nb_tipo_evaluacion' },
                { text: 'peso',        value: 'nu_peso' },
                { text: 'Tema',        value: 'tx_tema' },
                { text: 'Status',      value: 'id_status' },
                { text: 'Fecha',       value: 'fe_evaluacion' },
                { text: 'Guias',       value: 'archivo' },
            ],
        }
    },
    

    methods: 
    {
        list()
        {
            this.getResource( `planEvaluacion/grupo/${this.grupo}/periodo/${this.periodo}/materia/${this.materia.id}` )
            .then( data =>  this.items = data.plan_detalle )
        }
    }

}
</script>

<style>

</style>
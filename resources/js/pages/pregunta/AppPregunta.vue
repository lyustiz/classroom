<template>

    <v-card :loading="loading" flat height="85vh">
        
        <v-card-title class="pa-0 grey lighten-4">
            <v-col  class="text-center">
                 <span>Preguntas</span>
            </v-col>
            <v-col cols="auto" class="text-center" >
                <app-button color="primary" icon="mdi-table-sync" label="refrescar" @click="list()" inner-class="mx-1"></app-button>
                <add-button @insItem="insertForm()"></add-button>
            </v-col>
        </v-card-title>

        <v-card-text>        
            <v-data-table
                :headers="headers"
                :items  ="items"
                :search ="search"
                item-key="id"
                :loading="loading"
                sort-by=""
                :hide-default-footer="true"
                dense
                single-expand
            >
                <template v-slot:item="{ item, expand, isExpanded }">
                    <tr :class="(isExpanded) ? 'green lighten-3 ': ''">
                        <td>
                             <app-foto-pregunta 
                                :origenId="item.id" 
                                :maxItems="1" 
                                :tipoFoto="7" 
                                :foto="item.foto"
                                :aspectRatio="16/9"
                                >
                            </app-foto-pregunta> 
                        </td>
                        <td class="text-xs-left">{{ item.nu_orden }}</td>
                        <td class="text-xs-left">{{ item.nb_pregunta | maxStringLength(80)}}</td>
						<td class="text-xs-left"> 
                            <list-simple-icon 
                                :icon="item.tipo_pregunta.tx_icono" 
                                :color="item.tipo_pregunta.tx_color" 
                                :label="item.tipo_pregunta.nb_tipo_pregunta"
                            ></list-simple-icon> 
                        </td>

                        <td class="text-xs-left subtitle-2">{{ (item.respuesta) ? item.respuesta.length: 0  }}</td>
						<td class="text-xs-left">{{ item.nu_valor | formatNumber }}</td>
						
						<td class="text-xs-left">
                            <list-simple-icon 
                                icon="mdi-comment-question" 
                                color="info" 
                                :label="item.tx_observaciones "
                            ></list-simple-icon> 
                        </td>
                        
                        <td class="text-xs-left">
                            <list-buttons 
                                @update="updateForm(item)" 
                                @delete="deleteForm(item)" 
                            >
                                <v-btn fab x-small color="green lighten-5" depressed @click="expand(!isExpanded)">
                                    <v-icon color="green" size="26" v-text="(isExpanded) ?  'mdi-arrow-up-drop-circle-outline': 'mdi-arrow-down-drop-circle-outline'"></v-icon>
                                </v-btn> 
                            </list-buttons>
                        </td>
                    </tr>
                </template>

                <template v-slot:expanded-item="{ headers, item }">
                    <td :colspan="headers.length" class="grey lighten-5">
                        <app-respuesta :pregunta="item"></app-respuesta>
                    </td>
                </template>

                <template v-slot:body.append="{ items }">
                    <tr class="grey lighten-3"> 
                        <td colspan="4" class="font-weight-bold">
                            Total preguntas: 
                            <v-chip label outlined>
                                {{(items) ? items.length : 0}}
                            </v-chip>
                        </td>

                        <td colspan="4" class="font-weight-bold">
                            Total Puntos: 
                            <v-chip label outlined class="my-1">
                                {{ getTotalPuntos(items) }}
                            </v-chip>
                        </td>
                    </tr>
                </template>

            </v-data-table>

            <app-modal
                :modal="modal"
                @closeModal="closeModal()"
                :head-color="$App.theme.headModal"
                :title="title"
            >
                <pregunta-form
                    :action="action"
                    :item="item"
                    @closeModal="closeModal()"
                    :prueba="prueba"
                    :total-preguntas="totalPreguntas"
                ></pregunta-form>

            </app-modal>

            <form-delete
                :dialog="dialog"
                :loading="loading"
                message="Desea eliminar el Registro Seleccionado?"
                @deleteItem="deleteItem()"
                @deleteCancel="deleteCancel()"
            ></form-delete>

        </v-card-text>

        <pre v-if="$App.debug">{{ $data }}</pre>

    </v-card>

</template>

<script>
import listHelper       from '@mixins/Applist';
import AppPreguntaForm  from './AppPreguntaForm';
import AppRespuesta     from '@pages/respuesta/AppListRespuesta';
import AppFotoPregunta  from '@pages/foto/AppFotoPregunta';

export default {

    mixins:     [ listHelper],

    components: { 
        'pregunta-form':     AppPreguntaForm,
        'app-respuesta':     AppRespuesta,
        'app-foto-pregunta': AppFotoPregunta
    },

    props: 
    {
        prueba: {
            type: Object,
            default: () =>{}
        }
    },

    computed: 
    {
        totalPreguntas()
        {
            return (this.items) ? this.items.length : 0;
        }
    },

    data () {
        return {
            title:    'Pregunta',
            resource: 'pregunta',
            headers: [
                { text: 'Foro',          value: 'tx_foto' },
                { text: 'Orden',         value: 'nu_orden' },
                { text: 'Pregunta',      value: 'nb_pregunta' },
                { text: 'Tipo Pregunta', value: 'id_tipo_pregunta' },
                { text: 'Respuestas',    value: 'respuesta' },
                { text: 'Puntos',        value: 'nu_valor' },
                { text: 'Ayuda',         value: 'tx_observaciones' },
                { text: 'Acciones',      value: 'actions', sortable: false, filterable: false },
            ],

        }
    },
    methods:
    {
        listUrl()
        {
            return `${this.fullUrl}/prueba/${this.prueba.id}`;
        },
        
        getTotalPuntos(items)
        {
            let total = 0;

            for (const item of items) 
            {
                total += parseFloat(item.nu_valor);
            }

            return total;
        },
    }
}
</script>

<style>
</style>
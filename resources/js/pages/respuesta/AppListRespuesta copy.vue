<template>

    <v-row justify="center"> 

 
        <v-col cols="10" v-if="pregunta.id_tipo_pregunta != 1">


        <v-data-table
            :headers="headers"
            :items  ="items"
            :search ="search"
            item-key="id"
            :loading="loading"
            sort-by=""
            :hide-default-footer="true"
            :hide-default-header="true"
            no-data-text="No se han cargado respuestas"
            class="rounded-xl"
            dense
        >

            <template v-slot:body.prepend="{ headers }">
                <tr>
                    <td :colspan="headers.length">
                       <v-col class="body-2">
                           <v-icon :color="pregunta.tipo_pregunta.tx_color" v-text="pregunta.tipo_pregunta.tx_icono"></v-icon>
                           <span v-text="pregunta.tipo_pregunta.tx_observaciones"></span>
                       </v-col>
                    </td>
                </tr>
            </template>

            <template v-slot:item="{ item }">
                <tr>
                    <td class="text-xs-left">{{ item.nb_respuesta }}</td>
                    
                    <td class="text-xs-left">
                        <list-icon :data="statusIcons" :value="item.bo_correcta"></list-icon>
                    </td>
                    <td class="text-xs-left">
                        <status-switch 
                            :loading="loading" 
                            :resource="resource" 
                            :item="item" 
                            @onChangeStatus="changeStatus($event)">
                        </status-switch>
                    </td>
                    
                    <td class="text-xs-left">
                        <list-buttons 
                            @update="updateForm(item)" 
                            @delete="deleteForm(item)" >
                        </list-buttons>
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
            <respuesta-form
                :action="action"
                :item="item"
                @closeModal="closeModal()"
                :pregunta="pregunta"
            ></respuesta-form>

        </app-modal>

        <form-delete
            :dialog="dialog"
            :loading="loading"
            message="Desea eliminar el Registro Seleccionado?"
            @deleteItem="deleteItem()"
            @deleteCancel="deleteCancel()"
        ></form-delete>
    
        </v-col>

        <v-col cols="1" class="text-center mt-8" v-if="pregunta.id_tipo_pregunta != 1">
            <app-button label="Agregar Respuesta" color="success" icon="mdi-plus" small @click="insertForm()"></app-button>
        </v-col>

        <v-col cols="10" v-else>
            <v-alert type="warning" :value="true" prominent outlined border="left" class="mt-3">
            {{ pregunta.tipo_pregunta.tx_observaciones}}
        </v-alert>
        </v-col>

        

        <pre v-if="$App.debug">{{ $data }}</pre>

    </v-row>

</template>

<script>
import listHelper from '@mixins/Applist';
import AppRespuestaForm  from './AppRespuestaForm';
export default {

    mixins:     [ listHelper],

    components: { 
        'respuesta-form': AppRespuestaForm 
    },
 
    props: 
    {
        pregunta: {
            type: Object,
            default: () =>{}
        }
    },

    watch:
    {
        pregunta()
        {
            this.items = []
            this.list()
        }
    },

    data () {
        return {
            title:    'Respuesta',
            resource: 'respuesta',
            headers: [
                { text: 'Respuesta',     value: 'nb_respuesta' },
                { text: 'Correcta',      value: 'bo_correcta' },
                { text: 'Status',        value: 'id_status' },
                { text: 'Acciones',      value: 'actions', sortable: false, filterable: false },
            ],
        }
    },
    methods:
    {
        listUrl()
        {
            return `${this.fullUrl}/pregunta/${this.pregunta.id}`;
        }
   
    }
}
</script>

<style>
</style>
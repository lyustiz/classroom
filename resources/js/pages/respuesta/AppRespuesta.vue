<template>

    <v-card :loading="loading" flat height="85vh">
        
        <v-card-title class="pa-0">
            <app-simple-toolbar title="Preguntas" @closeModal="$emit('closeModal', true)"></app-simple-toolbar>
        </v-card-title>

        <v-card-title class="pa-0 grey lighten-4">
                <v-col cols="10">
                    <v-avatar color="grey lighten-3 mx-4" size="38">
                        <v-icon color="green">mdi-help</v-icon>
                    </v-avatar>
                   <span class="subtitle-2">{{ pregunta.nb_pregunta }}</span> 
                </v-col>
                <v-spacer></v-spacer>
                <v-col cols="2" class="text-center" >
                    <app-button color="primary" icon="mdi-table-sync" label="refrescar" @click="list()"></app-button>
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
            >

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
            
            <pre v-if="$App.debug">{{ $data }}</pre>

        </v-card-text>

    </v-card>

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
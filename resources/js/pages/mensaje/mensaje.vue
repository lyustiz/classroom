<template>

    <list-container :title="title" :head-color="$App.theme.headList" @onMenu="onMenu($event)">

        <template slot="HeadTools">
            <add-button @insItem="insertForm()"></add-button>
        </template>

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
                        <td class="text-xs-left">{{ item.co_mensaje }}</td>
						<td class="text-xs-left">{{ item.id_tipo_destinatario }}</td>
						<td class="text-xs-left">{{ item.id_destinatario }}</td>
						<td class="text-xs-left">{{ item.tx_asunto }}</td>
						<td class="text-xs-left">{{ item.tx_mensaje }}</td>
						<td class="text-xs-left">{{ item.tx_lugar }}</td>
						<td class="text-xs-left">{{ item.id_tipo_mensaje }}</td>
						<td class="text-xs-left">{{ item.id_tipo_prioridad }}</td>
						<td class="text-xs-left">{{ item.fe_notificacion }}</td>
						<td class="text-xs-left">{{ item.hh_inicio }}</td>
						<td class="text-xs-left">{{ item.hh_fin }}</td>
						<td class="text-xs-left">{{ item.fe_lectura }}</td>
						<td class="text-xs-left">{{ item.tx_observaciones }}</td>
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
                <mensaje-form
                    :action="action"
                    :item="item"
                    @closeModal="closeModal()"
                ></mensaje-form>

            </app-modal>

            <form-delete
                :dialog="dialog"
                :loading="loading"
                message="Desea eliminar el Registro Seleccionado?"
                @deleteItem="deleteItem()"
                @deleteCancel="deleteCancel()"
            ></form-delete>
            
            <pre v-if="$App.debug">{{ $data }}</pre>

    </list-container>

</template>

<script>
import listHelper from '@mixins/Applist';
import mensajeForm  from './mensajeForm';
export default {
    mixins:     [ listHelper],
    components: { 'mensaje-form': mensajeForm },
    data () {
    return {
        title:    'Mensaje',
        resource: 'mensaje',
        headers: [
            { text: 'Mensaje',   value: 'co_mensaje' },
			{ text: 'Tipo Destinatario',   value: 'id_tipo_destinatario' },
			{ text: 'Destinatario',   value: 'id_destinatario' },
			{ text: 'Asunto',   value: 'tx_asunto' },
			{ text: 'Mensaje',   value: 'tx_mensaje' },
			{ text: 'Lugar',   value: 'tx_lugar' },
			{ text: 'Tipo Mensaje',   value: 'id_tipo_mensaje' },
			{ text: 'Tipo Prioridad',   value: 'id_tipo_prioridad' },
			{ text: 'Notificacion',   value: 'fe_notificacion' },
			{ text: 'Inicio',   value: 'hh_inicio' },
			{ text: 'Fin',   value: 'hh_fin' },
			{ text: 'Lectura',   value: 'fe_lectura' },
			{ text: 'Observaciones',   value: 'tx_observaciones' },
			{ text: 'Status',   value: 'id_status' },
            { text: 'Acciones', value: 'actions', sortable: false, filterable: false },
        ],
    }
    },
    methods:
    {
   
    }
}
</script>

<style>
</style>
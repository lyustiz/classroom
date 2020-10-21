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
                        <td class="text-xs-left">{{ item.id_grupo }}</td>
						<td class="text-xs-left">{{ item.id_tipo_asignacion }}</td>
						<td class="text-xs-left">{{ item.id_materia }}</td>
						<td class="text-xs-left">{{ item.id_tema }}</td>
						<td class="text-xs-left">{{ item.id_origen }}</td>
						<td class="text-xs-left">{{ item.tx_origen }}</td>
						<td class="text-xs-left">{{ item.fe_inicio }}</td>
						<td class="text-xs-left">{{ item.fe_fin }}</td>
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
                <asignacion-form
                    :action="action"
                    :item="item"
                    @closeModal="closeModal()"
                ></asignacion-form>

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
import asignacionForm  from './asignacionForm';
export default {
    mixins:     [ listHelper],
    components: { 'asignacion-form': asignacionForm },
    data () {
    return {
        title:    'Asignacion',
        resource: 'asignacion',
        headers: [
            { text: 'Grupo',   value: 'id_grupo' },
			{ text: 'Tipo Asignacion',   value: 'id_tipo_asignacion' },
			{ text: 'Materia',   value: 'id_materia' },
			{ text: 'Tema',   value: 'id_tema' },
			{ text: 'Origen',   value: 'id_origen' },
			{ text: 'Origen',   value: 'tx_origen' },
			{ text: 'Inicio',   value: 'fe_inicio' },
			{ text: 'Fin',   value: 'fe_fin' },
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
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
                        <td class="text-xs-left">{{ item.id_calendario }}</td>
						<td class="text-xs-left">{{ item.id_grado }}</td>
						<td class="text-xs-left">{{ item.id_grupo }}</td>
						<td class="text-xs-left">{{ item.fe_matricula }}</td>
						<td class="text-xs-left">{{ item.id_tipo_condicion }}</td>
						<td class="text-xs-left">{{ item.id_colegio_origen }}</td>
						<td class="text-xs-left">{{ item.tx_observaciones }}</td>
						<td class="text-xs-left">
                            <status-switch 
                                :loading="loading" 
                                :item="item"
                                :resource="resource"
                                @onStatusChanging="loading=true"
                                @onStatusChanged="loading=false">
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
                <matricula-form
                    :action="action"
                    :item="item"
                    @closeModal="closeModal()"
                ></matricula-form>

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
import matriculaForm  from './matriculaForm';
export default {
    mixins:     [ listHelper],
    components: { 'matricula-form': matriculaForm },
    data () {
    return {
        title:    'Matricula',
        resource: 'matricula',
        headers: [
            { text: 'Calendario',   value: 'id_calendario' },
			{ text: 'Grado',   value: 'id_grado' },
			{ text: 'Grupo',   value: 'id_grupo' },
			{ text: 'Matricula',   value: 'fe_matricula' },
			{ text: 'Tipo Condicion',   value: 'id_tipo_condicion' },
			{ text: 'Colegio Origen',   value: 'id_colegio_origen' },
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
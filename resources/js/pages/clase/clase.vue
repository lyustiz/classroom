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
                        <td class="text-xs-left">{{ item.id_grado }}</td>
						<td class="text-xs-left">{{ item.id_grupo }}</td>
						<td class="text-xs-left">{{ item.id_materia }}</td>
						<td class="text-xs-left">{{ item.id_docente }}</td>
						<td class="text-xs-left">{{ item.fe_clase }}</td>
						<td class="text-xs-left">{{ item.fe_completada }}</td>
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
                <clase-form
                    :action="action"
                    :item="item"
                    @closeModal="closeModal()"
                ></clase-form>

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
import claseForm  from './claseForm';
export default {
    mixins:     [ listHelper],
    components: { 'clase-form': claseForm },
    data () {
    return {
        title:    'Clase',
        resource: 'clase',
        headers: [
            { text: 'Grado',   value: 'id_grado' },
			{ text: 'Grupo',   value: 'id_grupo' },
			{ text: 'Materia',   value: 'id_materia' },
			{ text: 'Docente',   value: 'id_docente' },
			{ text: 'Clase',   value: 'fe_clase' },
			{ text: 'Completada',   value: 'fe_completada' },
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
html{
    min-height: 100%;
}
body{
    min-height: 100%;
}
</style>
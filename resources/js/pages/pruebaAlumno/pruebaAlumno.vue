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
                        <td class="text-xs-left">{{ item.id_prueba }}</td>
						<td class="text-xs-left">{{ item.fe_prueba }}</td>
						<td class="text-xs-left">{{ item.hh_inicio }}</td>
						<td class="text-xs-left">{{ item.hh_fin }}</td>
						<td class="text-xs-left">{{ item.id_calificacion }}</td>
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
                <prueba-alumno-form
                    :action="action"
                    :item="item"
                    @closeModal="closeModal()"
                ></prueba-alumno-form>

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
import pruebaAlumnoForm  from './pruebaAlumnoForm';
export default {
    mixins:     [ listHelper],
    components: { 'prueba-alumno-form': pruebaAlumnoForm },
    data () {
    return {
        title:    'PruebaAlumno',
        resource: 'pruebaAlumno',
        headers: [
            { text: 'Prueba',   value: 'id_prueba' },
			{ text: 'Prueba',   value: 'fe_prueba' },
			{ text: 'Inicio',   value: 'hh_inicio' },
			{ text: 'Fin',   value: 'hh_fin' },
			{ text: 'Calificacion',   value: 'id_calificacion' },
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
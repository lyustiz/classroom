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
						<td class="text-xs-left">{{ item.id_alumno }}</td>
                        <td class="text-xs-left">{{ item.id_grado }}</td>
						<td class="text-xs-left">{{ item.id_materia }}</td>
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
                <alumno-materia-form
                    :action="action"
                    :item="item"
                    @closeModal="closeModal()"
                ></alumno-materia-form>

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
import alumnoMateriaForm  from './alumnoMateriaForm';
export default {
    mixins:     [ listHelper],
    components: { 'alumno-materia-form': alumnoMateriaForm },
    data () {
    return {
        title:    'AlumnoMateria',
        resource: 'alumnoMateria',
        headers: [
            { text: 'Calendario',    value: 'id_calendario' },
            { text: 'Alumno',        value: 'id_alumno' },
            { text: 'Grado',         value: 'id_grado' },
			{ text: 'Materia',       value: 'id_materia' },
			{ text: 'Observaciones', value: 'tx_observaciones' },
			{ text: 'Status',        value: 'id_status' },
            { text: 'Acciones',      value: 'actions', sortable: false, filterable: false },
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
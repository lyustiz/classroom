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
                        <td class="text-xs-left">{{ item.id_asignacion }}</td>
						<td class="text-xs-left">{{ item.id_alumno }}</td>
						<td class="text-xs-left">{{ item.fe_completado }}</td>
						<td class="text-xs-left">{{ item.nu_calificacion }}</td>
						<td class="text-xs-left">{{ item.id_calificacion }}</td>
						<td class="text-xs-left">{{ item.fe_acceso }}</td>
						<td class="text-xs-left">{{ item.nu_accesos }}</td>
						<td class="text-xs-left">{{ item.nu_minutos }}</td>
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
                <asignacion-alumno-form
                    :action="action"
                    :item="item"
                    @closeModal="closeModal()"
                ></asignacion-alumno-form>

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
import asignacionAlumnoForm  from './asignacionAlumnoForm';
export default {
    mixins:     [ listHelper],
    components: { 'asignacion-alumno-form': asignacionAlumnoForm },
    data () {
    return {
        title:    'AsignacionAlumno',
        resource: 'asignacionAlumno',
        headers: [
            { text: 'Asignacion',   value: 'id_asignacion' },
			{ text: 'Alumno',   value: 'id_alumno' },
			{ text: 'Completado',   value: 'fe_completado' },
			{ text: 'Calificacion',   value: 'nu_calificacion' },
			{ text: 'Calificacion',   value: 'id_calificacion' },
			{ text: 'Acceso',   value: 'fe_acceso' },
			{ text: 'Accesos',   value: 'nu_accesos' },
			{ text: 'Minutos',   value: 'nu_minutos' },
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
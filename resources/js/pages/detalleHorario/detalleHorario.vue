<template>

    <list-container :title="title" :head-color="$App.theme.headList" @onMenu="onMenu($event)" :inDialog="inDialog">

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
                        <td class="text-xs-left">{{ item.co_detalle_horario }}</td>
						<td class="text-xs-left">{{ item.id_horario }}</td>
						<td class="text-xs-left">{{ item.id_materia }}</td>
						<td class="text-xs-left">{{ item.id_docente }}</td>
						<td class="text-xs-left">{{ item.id_dia_semana }}</td>
						<td class="text-xs-left">{{ item.id_aula }}</td>
						<td class="text-xs-left">{{ item.hh_inicio }}</td>
						<td class="text-xs-left">{{ item.hh_fin }}</td>
						<td class="text-xs-left">{{ item.id_carga_horaria }}</td>
						<td class="text-xs-left">{{ item.id_hora_academica }}</td>
						<td class="text-xs-left">{{ item.nu_carga_horaria }}</td>
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
                <detalle-horario-form
                    :action="action"
                    :item="item"
                    @closeModal="closeModal()"
                ></detalle-horario-form>

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
import detalleHorarioForm  from './detalleHorarioForm';
export default {
    mixins:     [ listHelper],
    components: { 'detalle-horario-form': detalleHorarioForm },
    data () {
    return {
        title:    'DetalleHorario',
        resource: 'detalleHorario',
        headers: [
            { text: 'Detalle Horario',   value: 'co_detalle_horario' },
			{ text: 'Horario',   value: 'id_horario' },
			{ text: 'Materia',   value: 'id_materia' },
			{ text: 'Docente',   value: 'id_docente' },
			{ text: 'Dia Semana',   value: 'id_dia_semana' },
			{ text: 'Aula',   value: 'id_aula' },
			{ text: 'Inicio',   value: 'hh_inicio' },
			{ text: 'Fin',   value: 'hh_fin' },
			{ text: 'Carga Horaria',   value: 'id_carga_horaria' },
			{ text: 'Hora Academica',   value: 'id_hora_academica' },
			{ text: 'Carga Horaria',   value: 'nu_carga_horaria' },
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
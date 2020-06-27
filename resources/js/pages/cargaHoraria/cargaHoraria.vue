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
                        <td class="text-xs-left">{{ item.nu_orden }}</td>
                        <td class="text-xs-left">{{ item.hora_academica.nb_hora_academica }}</td>
                        <td class="text-xs-left" :class="{ 'green--text font-weight-bold': item.bo_receso  }"> 
                            {{ item.nb_carga_horaria }}
                         </td>
						<td class="text-xs-left">{{ item.hh_inicio | formatTime }}</td>
						<td class="text-xs-left">{{ item.hh_fin | formatTime }}</td>
						<td class="text-xs-left">{{ item.turno.nb_turno }}</td>
						<td class="text-xs-center">
                            <v-icon 
                                color="success"
                                v-text="(item.bo_receso) ? 'mdi-coffee': 'mdi-coffee-off-outline'">
                            </v-icon>
                        </td>
						<td class="text-xs-left">
                            <status-switch 
                                :loading="loading" 
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
                <carga-horaria-form
                    :action="action"
                    :item="item"
                    @closeModal="closeModal()"
                ></carga-horaria-form>

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
import cargaHorariaForm  from './cargaHorariaForm';
export default {
    mixins:     [ listHelper],
    components: { 'carga-horaria-form': cargaHorariaForm },
    data () {
    return {
        title:    'CargaHoraria',
        resource: 'cargaHoraria',
        headers: [
            { text: 'Orden',         value: 'nu_orden' },
            { text: 'Grupo Hora',    value: 'hora_academica.nb_hora_academica' },
            { text: 'Descripcion',   value: 'nb_carga_horaria' },
			{ text: 'Inicio',        value: 'hh_inicio' },
			{ text: 'Fin',           value: 'hh_fin' },
			{ text: 'Turno',         value: 'turno.nb_turno' },
			{ text: 'Receso',        value: 'bo_receso' },
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
<template>

<div>

    <app-agenda></app-agenda>

</div>
  <!--   <list-container :title="title" :head-color="$App.theme.headList" @onMenu="onMenu($event)" :inDialog="inDialog">

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
                        <td class="text-xs-left">{{ item.nb_agenda }}</td>
						<td class="text-xs-left">{{ item.id_calendario }}</td>
						<td class="text-xs-left">{{ item.id_tipo_agenda }}</td>
						<td class="text-xs-left">{{ item.fe_agenda }}</td>
						<td class="text-xs-left">{{ item.hh_inicio }}</td>
						<td class="text-xs-left">{{ item.hh_fin }}</td>
						<td class="text-xs-left">{{ item.id_origen }}</td>
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
                <agenda-form
                    :action="action"
                    :item="item"
                    @closeModal="closeModal()"
                ></agenda-form>

            </app-modal>

            <form-delete
                :dialog="dialog"
                :loading="loading"
                message="Desea eliminar el Registro Seleccionado?"
                @deleteItem="deleteItem()"
                @deleteCancel="deleteCancel()"
            ></form-delete>

            <pre v-if="$App.debug">{{ $data }}</pre>

    </list-container> -->

</template>

<script>
import listHelper from '@mixins/Applist';
import agendaForm from './agendaForm';
import appAgenda  from './AppAgenda'

export default {
    mixins:     [ listHelper],
    components: {   
                    'agenda-form': agendaForm,
                    'app-agenda':  appAgenda 
                },
    computed:
    {
        calendario()
        {
            return this.$store.getters['getCalendario']
        },
    },
    
    data () {
    return {
        title:    'Agenda',
        resource: 'agenda',
        headers: [
            { text: 'Agenda',        value: 'nb_agenda' },
			{ text: 'Calendario',    value: 'id_calendario' },
			{ text: 'Tipo Agenda',   value: 'id_tipo_agenda' },
			{ text: 'Agenda',        value: 'fe_agenda' },
			{ text: 'Inicio',        value: 'hh_inicio' },
			{ text: 'Fin',           value: 'hh_fin' },
			{ text: 'Origen',        value: 'id_origen' },
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
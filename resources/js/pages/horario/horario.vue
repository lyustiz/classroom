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
                        <td class="text-xs-left">{{ item.co_horario }}</td>
						<td class="text-xs-left">{{ item.id_grado_materia }}</td>
						<td class="text-xs-left">{{ item.id_grupo }}</td>
						<td class="text-xs-left">{{ item.id_dia_semana }}</td>
						<td class="text-xs-left">{{ item.hh_inicio }}</td>
						<td class="text-xs-left">{{ item.hh_fin }}</td>
						<td class="text-xs-left">{{ item.tx_observaciones }}</td>
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
                <horario-form
                    :action="action"
                    :item="item"
                    @closeModal="closeModal()"
                ></horario-form>

            </app-modal>

            <form-delete
                :dialog="dialog"
                :loading="loading"
                message="Desea eliminar el Registro Seleccionado?"
                @deleteItem="deleteItem()"
                @deleteCancel="deleteCancel()"
            ></form-delete>

            <app-message></app-message>

            <pre v-if="$App.debug">{{ $data }}</pre>

    </list-container>

</template>

<script>
import listHelper from '@mixins/Applist';
import horarioForm  from './horarioForm';
export default {
    mixins:     [ listHelper],
    components: { 'horario-form': horarioForm },
    data () {
    return {
        title:    'Horario',
        resource: 'horario',
        headers: [
            { text: 'Horario',   value: 'co_horario' },
			{ text: 'Grado Materia',   value: 'id_grado_materia' },
			{ text: 'Grupo',   value: 'id_grupo' },
			{ text: 'Dia Semana',   value: 'id_dia_semana' },
			{ text: 'Inicio',   value: 'hh_inicio' },
			{ text: 'Fin',   value: 'hh_fin' },
			{ text: 'Observaciones',   value: 'tx_observaciones' },
			{ text: 'Status',   value: 'id_status' },
            { text: 'Acciones', value: 'actions' },
        ],
    }
    },
    methods:
    {
        list () {

            this.loading = false
            
            axios.get(this.apiUrl  +'horario')
            .then(response => {
                this.items = response.data;
                this.loading = false
            })
            .catch(error => {
                this.showError(error)
                this.loading = false
            })
        },
        delItem()
        {
            axios.delete(this.apiUrl    + 'horario/'+this.item.id)
            .then(response => {
                this.verMsj(response.data.msj)
                this.list();
                this.item = '';
                this.dialogo = false;
            })
            .catch(error => {
                this.showError(error)
            })
        }
    }
}
</script>

<style>
</style>
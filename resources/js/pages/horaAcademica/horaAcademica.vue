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
						<td class="text-xs-left">{{ item.hh_inicio }}</td>
						<td class="text-xs-left">{{ item.hh_fin }}</td>
						<td class="text-xs-left">{{ item.turno.nb_turno }}</td>
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
                <hora-academica-form
                    :action="action"
                    :item="item"
                    @closeModal="closeModal()"
                ></hora-academica-form>

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
import horaAcademicaForm  from './horaAcademicaForm';
export default {
    mixins:     [ listHelper],
    components: { 'hora-academica-form': horaAcademicaForm },
    data () {
    return {
        title:    'Hora Academica',
        resource: 'horaAcademica',
        headers: [
            { text: 'Orden',   value: 'nu_orden' },
			{ text: 'Inicio',   value: 'hh_inicio' },
			{ text: 'Fin',   value: 'hh_fin' },
			{ text: 'Turno',   value: 'turno.nb_turno' },
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
            
            axios.get(this.apiUrl + 'horaAcademica')
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
            //validacion mayor nivel
            axios.delete(this.apiUrl + 'horaAcademica/'+this.item.id)
            .then(response => {
                this.verMsj(response.data.msj)
                this.list();
                this.item = '';
                this.dialogo = false;
            })
            .catch(error => {
                this.showError(error)
            })
        },
        insertForm ()
        {
            this.item   = {};
            this.item.nu_orden   = (this.items) ?  this.items.length + 1 : 1
            console.log(this.item);
            this.action = 'ins';
            this.modal  = true;
        },
        
    }
}
</script>

<style>
</style>
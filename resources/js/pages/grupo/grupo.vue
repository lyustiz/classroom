<template>

    <list-container :title="title" :head-color="$App.theme.headList">

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
                        <td class="text-xs-left">{{ item.nb_grupo }}</td>
						<td class="text-xs-left">{{ item.id_grado }}</td>
						<td class="text-xs-left">{{ item.tx_director }}</td>
						<td class="text-xs-left">{{ item.nu_alumnos }}</td>
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
                <grupo-form
                    :action="action"
                    :item="item"
                    @closeModal="closeModal()"
                ></grupo-form>

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
import grupoForm  from './grupoForm';
export default {
    mixins:     [ listHelper],
    components: { 'grupo-form': grupoForm },
    data () {
    return {
        title:    'Grupo',
        resource: 'grupo',
        headers: [
            { text: 'Grupo',   value: 'nb_grupo' },
			{ text: 'Grado',   value: 'id_grado' },
			{ text: 'Director',   value: 'tx_director' },
			{ text: 'Alumnos',   value: 'nu_alumnos' },
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
            
            axios.get(this.apiUrl  +'grupo')
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
            axios.delete(this.apiUrl    + 'grupo/'+this.item.id)
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
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
                dense
            >

                <template v-slot:item="{ item }">
                    <tr>
                        <td class="text-xs-left">{{ item.nb_periodo }}</td>
                        <td class="text-xs-left">{{ item.nu_periodo }}</td>
                        <td class="text-xs-left">{{ item.calendario.nb_calendario }}</td>
						<td class="text-xs-left">{{ item.fe_inicio | formatDate }}</td>
						<td class="text-xs-left">{{ item.fe_fin | formatDate }}</td>
						<td class="text-xs-left">
                              <v-switch 
                                inset 
                                dense
                                hide-details
                                :readonly="loading"
                                :loading="loading" 
                                :true-value="1"
                                :false-value="0"
                                color="green"
                                :input-value="item.id_status"
                                @change="updStatus($event, item)">
                            </v-switch>
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
                <periodo-form
                    :action="action"
                    :item="item"
                    @closeModal="closeModal()"
                ></periodo-form>

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
import periodoForm  from './periodoForm';
export default {
    mixins:     [ listHelper],
    components: { 'periodo-form': periodoForm },
    data () {
    return {
        title:    'Periodo',
        resource: 'periodo',
        headers: [
            { text: 'Periodo',    value: 'nb_periodo' },
            { text: 'Orden',      value: 'nu_periodo' },
            { text: 'Calendario', value: 'calendario.nb_calendario' },
			{ text: 'Inicio',     value: 'fe_inicio' },
			{ text: 'Fin',        value: 'fe_fin' },
			{ text: 'Status',     value: 'id_status' },
            { text: 'Acciones',   value: 'actions', sortable: false, filterable: false },
        ],
    }
    },
    methods:
    {

        list()
        {
            let url = this.listUrl()
            
            this.loading = true
            
            axios.get(url)
            .then(response => 
            {
                this.items = response.data
            })
            .catch(error => 
            {
                this.showError(error)
            })
            .finally( () => 
            {
                this.loading = false
            });
        },

        updStatus(status, periodo)        
        {
            let form = {
                            id_usuario: this.idUser,
                            id_status : (status) ? 1 : 0
                       } 
            
            this.loading = true            
            
            axios.put( `${this.fullUrl}/${periodo.id}/status`, form )
            .then(response => 
            {
                this.showMessage(response.data.msj)
            })
            .catch(error => 
            {
                this.showError(error)

            }).finally( () => 
            {
                this.loading = false
                this.list()
            });
        }

        
    }
}
</script>

<style>
</style>
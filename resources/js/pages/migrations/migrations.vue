<template>

    <list-container :titulo="titulo" :head-color="$App.theme.headList" @onMenu="onMenu($event)">

        <template slot="HeadTools">
            <add-button @insItem="insItem()"></add-button>
        </template>

            <v-flex xs12 xs6>
                <v-text-field
                    v-model="search"
                    append-icon="search"
                    label="Buscar"
                    hide-details
                    clearable
                    dense
                ></v-text-field>
            </v-flex>

            <v-data-table
                :headers="headers"
                :items  ="items"
                :search ="search"
                v-model ="selected"
                item-key="id"
                :loading="isLoading"
                sort-by=""
                dense
            >

                <template slot="items" slot-scope="item">

                    <td class="text-xs-left">{{ item.item.id }}</td>
					<td class="text-xs-left">{{ item.item.migration }}</td>
					<td class="text-xs-left">{{ item.item.batch }}</td>
                    
                
                    <td class="text-xs-center">
                        <list-buttons @editar="updItem(item.item)" @eliminar="delForm(item.item)" ></list-buttons>
                    </td>

                </template>

            </v-data-table>

            <app-modal
                :nb-action="nbAction"
                :modal="modal"
                @modalClose="modalClose()"
                :head-color="$App.theme.headModal"
            >
                <migrations-form
                    :accion="accion"
                    :item="item"
                    :titulo="titulo"
                    @modalClose="modalClose()"
                ></migrations-form>

            </app-modal>

            <app-dialogo
                :dialog="dialog"
                mensaje="Desea eliminar el Item Seleccionado?"
                @delItem="delItem()"
                @delCancel="delCancel()"
            ></app-dialogo>

            <app-mensaje></app-mensaje>

            <pre v-if="$App.debug">{{ $data }}</pre>

    </list-container>

</template>

<script>
import listHelper from '~/mixins/Applist';
import migrationsForm  from './migrationsForm';
export default {
    mixins:     [ listHelper],
    components: { 'migrations-form': migrationsForm },
    data () {
    return {
        titulo: 'Migrations',
        headers: [
            { text: 'Id',   value: 'id' },
			{ text: 'Migration',   value: 'migration' },
			{ text: 'Batch',   value: 'batch' },
            { text: 'Acciones', value: 'id'  },
        ],
    }
    },
    methods:
    {
        list () {

            this.isLoading = false
            
            axios.get(this.apiUrl  +'migrations')
            .then(response => {
                this.items = response.data;
                this.isLoading = false
            })
            .catch(error => {
                this.showError(error)
                this.isLoading = false
            })
        },
        delItem()
        {
            axios.delete(this.apiUrl    + 'migrations/'+this.item.id)
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
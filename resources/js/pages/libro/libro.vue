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
                        <td class="text-xs-left">{{ item.nb_libro }}</td>
                        <td class="text-xs-left">{{ item.grado.nb_grado }}</td>
						<td class="text-xs-left">{{ item.materia.nb_materia }}</td>
						<td class="text-xs-left"><list-simple-icon icon="mdi-text-box-outline" color="indigo" :label="item.tx_descripcion"></list-simple-icon></td>
						<td class="text-xs-left"> <list-simple-icon icon="mdi-image-album" color="indigo" :label="item.tx_portada"></list-simple-icon>
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
                <libro-form
                    :action="action"
                    :item="item"
                    @closeModal="closeModal()"
                ></libro-form>

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
import libroForm  from './libroForm';
export default {
    mixins:     [ listHelper],
    components: { 'libro-form': libroForm },
    data () {
    return {
        title:    'Libro',
        resource: 'libro',
        headers: [
            { text: 'Libro',       value: 'nb_libro' },
            { text: 'Grado',       value: 'grado.nb_grado' },
            { text: 'Materia',     value: 'mmateria_nb_materia' },
			{ text: 'Descripcion', value: 'tx_descripcion' },
			{ text: 'Portada',     value: 'tx_portada' },
			{ text: 'Status',      value: 'id_status' },
            { text: 'Acciones',    value: 'actions', sortable: false, filterable: false },
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
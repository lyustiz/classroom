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
                        <td class="text-xs-left">{{ item.nu_tema }}</td>
                        <td class="text-xs-left">{{ item.nb_tema }}</td>
						<td class="text-xs-left"><list-simple-icon icon="mdi-text-box-outline" color="indigo" :label="item.tx_descripcion"></list-simple-icon></td>
						<td class="text-xs-left">{{ item.grado.nb_grado }}</td>
						<td class="text-xs-left">{{ item.materia.nb_materia }}</td>
						<td class="text-xs-left">{{ item.nu_nivel }}</td>
						<td class="text-xs-left">{{ item.nu_peso }}</td>
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
                <tema-form
                    :action="action"
                    :item="item"
                    @closeModal="closeModal()"
                ></tema-form>

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
import temaForm  from './temaForm';
export default {
    mixins:     [ listHelper],
    components: { 'tema-form': temaForm },
    data () {
    return {
        title:    'Tema',
        resource: 'tema',
        headers: [
            { text: 'Nro',         value: 'nu_tema' },
            { text: 'Tema',        value: 'nb_tema' },
			{ text: 'Descripcion', value: 'tx_descripcion' },
			{ text: 'Materia',     value: 'materia.nb_materia' },
			{ text: 'Grado',       value: 'grado.nb_grado' },
			{ text: 'Nivel',       value: 'nu_nivel' },
			{ text: 'Peso',        value: 'nu_peso' },
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
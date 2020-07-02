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
                dense
            >

                <template v-slot:item="{ item }">
                    <tr>
                        <td class="text-xs-left">{{ item.nb_alumno_corto }}</td>
						<td class="text-xs-left">
                            <list-icon :data="sexoIcons" :value="item.tx_sexo"></list-icon>
                        </td>
						<td class="text-xs-left">{{ item.fe_nacimiento | formatDate }}</td>
                        <td class="text-xs-left">{{ item.nu_edad }}</td>
						<td class="text-xs-left">{{ item.tx_documento }}</td>
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
                <alumno-form
                    :action="action"
                    :item="item"
                    @closeModal="closeModal()"
                ></alumno-form>

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
import alumnoForm  from './alumnoForm';
export default {
    mixins:     [ listHelper],
    components: { 'alumno-form': alumnoForm },
    data () {
    return {
        title:    'Alumno',
        resource: 'alumno',
        headers: [
            { text: 'Alumno',       value: 'nb_alumno' },
			{ text: 'Sexo',         value: 'tx_sexo' },
            { text: 'Nacimiento',   value: 'fe_nacimiento' },
            { text: 'Edad',         value: 'nu_edad' },
			{ text: 'Documento',    value: 'tx_documento' },
			{ text: 'Status',       value: 'id_status' },
            { text: 'Acciones',     value: 'actions', sortable: false, filterable: false },
        ],
        sexoIcons: [
            {value: 'M', icon: 'mdi-human-male',  color: 'blue', label: 'Masculino'},
            {value: 'F', icon: 'mdi-human-female',  color: 'pink', label: 'Femenino'}
        ]
    }
    },
    methods:
    {
   
    }
}
</script>

<style>
</style>
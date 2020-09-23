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
                        <td class="text-xs-left">{{ item.id_prueba }}</td>
						<td class="text-xs-left">{{ item.id_respuesta }}</td>
						<td class="text-xs-left">{{ item.tx_respuesta }}</td>
						<td class="text-xs-left">{{ item.bo_correcta }}</td>
						<td class="text-xs-left">{{ item.nu_valor }}</td>
						<td class="text-xs-left">{{ item.tx_observaciones }}</td>
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
                <respuesta-alumno-form
                    :action="action"
                    :item="item"
                    @closeModal="closeModal()"
                ></respuesta-alumno-form>

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
import respuestaAlumnoForm  from './respuestaAlumnoForm';
export default {
    mixins:     [ listHelper],
    components: { 'respuesta-alumno-form': respuestaAlumnoForm },
    data () {
    return {
        title:    'RespuestaAlumno',
        resource: 'respuestaAlumno',
        headers: [
            { text: 'Prueba',   value: 'id_prueba' },
			{ text: 'Respuesta',   value: 'id_respuesta' },
			{ text: 'Respuesta',   value: 'tx_respuesta' },
			{ text: 'Correcta',   value: 'bo_correcta' },
			{ text: 'Valor',   value: 'nu_valor' },
			{ text: 'Observaciones',   value: 'tx_observaciones' },
			{ text: 'Status',   value: 'id_status' },
            { text: 'Acciones', value: 'actions', sortable: false, filterable: false },
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
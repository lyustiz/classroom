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
                        <td class="text-xs-left">{{ item.nb_pregunta }}</td>
						<td class="text-xs-left">{{ item.nb_descripcion }}</td>
						<td class="text-xs-left">{{ item.id_actividad }}</td>
						<td class="text-xs-left">{{ item.id_tipo_pregunta }}</td>
						<td class="text-xs-left">{{ item.bo_opcional }}</td>
						<td class="text-xs-left">{{ item.nu_valor }}</td>
						<td class="text-xs-left">{{ item.nu_orden }}</td>
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
                <actividad-pregunta-form
                    :action="action"
                    :item="item"
                    @closeModal="closeModal()"
                ></actividad-pregunta-form>

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
import actividadPreguntaForm  from './actividadPreguntaForm';
export default {
    mixins:     [ listHelper],
    components: { 'actividad-pregunta-form': actividadPreguntaForm },
    data () {
    return {
        title:    'ActividadPregunta',
        resource: 'actividadPregunta',
        headers: [
            { text: 'Pregunta',   value: 'nb_pregunta' },
			{ text: 'Descripcion',   value: 'nb_descripcion' },
			{ text: 'Actividad',   value: 'id_actividad' },
			{ text: 'Tipo Pregunta',   value: 'id_tipo_pregunta' },
			{ text: 'Opcional',   value: 'bo_opcional' },
			{ text: 'Valor',   value: 'nu_valor' },
			{ text: 'Orden',   value: 'nu_orden' },
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
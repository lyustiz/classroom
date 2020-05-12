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
                        <td class="text-xs-left">{{ item.nb_calificacion }}</td>
						<td class="text-xs-left">{{ item.nu_calificacion }}</td>
						<td class="text-xs-left">{{ item.co_calificacion }}</td>
						<td class="text-xs-left">{{ item.bo_aprobado }}</td>
						<td class="text-xs-left">{{ item.nu_orden }}</td>
						<td class="text-xs-left">{{ item.id_grupo_calificacion }}</td>
						<td class="text-xs-left">{{ item.id_tipo_calificacion }}</td>
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
                <calificacion-form
                    :action="action"
                    :item="item"
                    @closeModal="closeModal()"
                ></calificacion-form>

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
import calificacionForm  from './calificacionForm';
export default {
    mixins:     [ listHelper],
    components: { 'calificacion-form': calificacionForm },
    data () {
    return {
        title:    'Calificacion',
        resource: 'calificacion',
        headers: [
            { text: 'Calificacion',   value: 'nb_calificacion' },
			{ text: 'Calificacion',   value: 'nu_calificacion' },
			{ text: 'Calificacion',   value: 'co_calificacion' },
			{ text: 'Aprobado',   value: 'bo_aprobado' },
			{ text: 'Orden',   value: 'nu_orden' },
			{ text: 'Grupo Calificacion',   value: 'id_grupo_calificacion' },
			{ text: 'Tipo Calificacion',   value: 'id_tipo_calificacion' },
			{ text: 'Observaciones',   value: 'tx_observaciones' },
			{ text: 'Status',   value: 'id_status' },
            { text: 'Acciones', value: 'actions', sortable: false, filterable: false },
        ],
    }
    },
    methods:
    {
   /**
    * 
    * 
    * - Sobresaliente         - Excelente
            - Distinguido             - Muy bueno
            - Bueno                      - Bueno
            - Aprobado                - Regular
            - Insuficiente             - Insuficiente
            - Reprobado              - Reprobado
    */
    }
}
</script>

<style>
</style>
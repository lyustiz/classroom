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
                        <td class="text-xs-left">{{ item.nu_orden }}</td>
                        <td class="text-xs-left">{{ item.grupo_calificacion.nb_grupo_calificacion }}</td>
                        <td class="text-xs-left">{{ item.nb_calificacion }}</td>
						<td class="text-xs-left">{{ item.nu_desde }}</td>
                        <td class="text-xs-left">{{ item.nu_hasta }}</td>
						<td class="text-xs-left">{{ item.co_calificacion }}</td>
                        <td class="text-xs-center">
                            <list-icon :data="calificacionIcons" :value="item.bo_aprobado"></list-icon>
                        </td>
                        <td class="text-xs-left">{{ item.nivel_calificacion.nb_nivel_calificacion }}</td>
						<td class="text-xs-center">
                            <status-switch 
                                :loading="loading" 
                                :item="item"
                                :resource="resource"
                                @onStatusChanging="loading=true"
                                @onStatusChanged="loading=false">
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
            { text: 'Orden',        value: 'nu_orden' },
            { text: 'Grupo',        value: 'grupo_calificacion.nb_grupo_calificacion' },
            { text: 'Letra',        value: 'nb_calificacion' },
			{ text: 'Valor Dede',   value: 'nu_desde' },
            { text: 'Valor Hasta',  value: 'nu_hasta' },
			{ text: 'Codigo',       value: 'co_calificacion' },
            { text: 'Aprobado?',    value: 'bo_aprobado' },
            { text: 'Nivel',        value: 'nivel_calificacion.nb_nivel_calificacion' },
			{ text: 'Status',       value: 'id_status' },
            { text: 'Acciones',     value: 'actions', sortable: false, filterable: false },
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
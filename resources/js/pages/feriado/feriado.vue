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
                        <td class="text-xs-left">{{ item.nb_feriado }}</td>
						<td class="text-left">
                            <v-chip  small :color="itemColor(item)">
                                {{ item.tipo_feriado.nb_tipo_feriado }}
                            </v-chip>
                        </td>
						<td class="text-xs-left">
                            {{ 
                                (item.id_tipo_feriado == 1) ?  monthDayFromDate(item.fe_feriado) : formatDate(item.fe_feriado)  
                            }}
                            </td>
						<td class="text-xs-left">
                            <v-chip small :color="itemColor(item)">
                                {{ (item.id_tipo_feriado == 1) ? '----' : item.aa_feriado }}
                            </v-chip>
                        </td>
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
                <feriado-form
                    :action="action"
                    :item="item"
                    @closeModal="closeModal()"
                ></feriado-form>

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
import feriadoForm  from './feriadoForm';
export default {
    mixins:     [ listHelper],
    components: { 'feriado-form': feriadoForm },
    data () {
    return {
        title:    'Feriados',
        resource: 'feriado',
        headers: [
            { text: 'Descripcion', value: 'nb_feriado' },
			{ text: 'Tipo',        value: 'tipo_feriado.nb_tipo_feriado' },
			{ text: 'Fecha',       value: 'fe_feriado' },
			{ text: 'Año',         value: 'aa_feriado' },
			{ text: 'Status',      value: 'id_status' },
            { text: 'Acciones',    value: 'actions', sortable: false, filterable: false },
        ],
    }
    },
    methods:
    {
        itemColor(item)
        {
            return (item.id_tipo_feriado == 1) ? 'green lighten-3' : 'amber lighten-3'
        }
    }
}
</script>

<style>
</style>
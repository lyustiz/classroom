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
                        <td class="text-xs-left">{{ item.nb_grupo }}</td>
						<td class="text-xs-left">{{ item.grado.nb_grado }}</td>
						<td class="text-xs-left">{{ item.turno.nb_turno }}</td>
						<td class="text-xs-left">{{ item.calendario.nb_calendario }}</td>
						<td class="text-xs-left">{{ item.docente.nb_docente }}</td>
						<td class="text-xs-left">{{ item.nu_orden }}</td>
						<td class="text-xs-left">
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

                                <item-menu 
                                    :menus="itemsMenu" 
                                    iconColor="white" 
                                    btnColor="cyan" 
                                    :item="item"
                                    @onItemMenu="onItemMenu($event)" 
                                ></item-menu>

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
                <grupo-form
                    :action="action"
                    :item="item"
                    @closeModal="closeModal()"
                ></grupo-form>

            </app-modal>

            <form-delete
                :dialog="dialog"
                :loading="loading"
                message="Desea eliminar el Registro Seleccionado?"
                @deleteItem="deleteItem()"
                @deleteCancel="deleteCancel()"
            ></form-delete>

            <v-dialog v-model="dialogMateria" max-width="600" content-class="rounded-xl">
                <grupo-materia :idGrupo="grupo" v-if="dialogMateria" @closeModal="closeDialog($event,'dialogMateria')"></grupo-materia>
            </v-dialog>

            <pre v-if="$App.debug">{{ $data }}</pre>

    </list-container>

</template>

<script>
import listHelper from '@mixins/Applist';
import grupoForm  from './grupoForm';
import AppGrupoMateria from '@pages/grupoMateria/AppGrupoMateria'
export default {
    mixins:     [ listHelper],
    components: { 
        'grupo-form'   : grupoForm,
        'grupo-materia': AppGrupoMateria 
    },
    data () 
    {
        return {
            title:    'Grupo',
            resource: 'grupo',
            headers: [
                { text: 'Grupo',      value: 'nb_grupo' },
                { text: 'Grado',      value: 'grado.nb_grado' },
                { text: 'Turno',      value: 'turno.nb_turno' },
                { text: 'Calendario', value: 'calendario.nb_calendario' },
                { text: 'Docente',    value: 'docente.nb_docente' },
                { text: 'Orden',      value: 'nu_orden' },
                { text: 'Status',     value: 'id_status' },
                { text: 'Acciones',   value: 'actions', sortable: false, filterable: false },
            ],
            itemsMenu: [
                { action: 'addMateriaGrupo',   icon: 'mdi-bookshelf', label: 'Asignar Materia' },
            ],
            dialogMateria: false,
            grupo:              null,
        }
    },
    methods:
    {
        addMateriaGrupo(grupo)
        {
            this.grupo         = grupo.id 
            this.dialogMateria = true
        },

        closeDialog(refresh, dialog)
        {
            this.grupo    = null
            this[dialog]  = false
            if(refresh)   this.list()
        }
   
    }
}
</script>

<style>
</style>
<template>

    <list-container :title="title" :head-color="$App.theme.headList" @onMenu="onMenu($event)" :inDialog="inDialog">

        <template slot="HeadTools">
            <v-col cols="auto">
                <add-button @insItem="insertForm()"></add-button>
            </v-col>
            <v-col cols="auto">
                <report-menu :reports="reports" @onReport="onReport($event)"></report-menu>
                <app-report :tableName="report.table" :title="report.title" :show="report.show" v-if="report.show" @onCloseReport="onCloseReport()"></app-report>
            </v-col>
        </template>

        <v-row>
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

            <v-col cols="12" md="6">
                <v-select
                :items="filter.grado"
                item-text="nb_grado"
                item-value="nb_grado"
                v-model="search"
                label="Grado"
                :loading="loading"
                dense
                clearable
                ></v-select>
            </v-col>
        </v-row>

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
						<td class="text-xs-left">
                            <list-simple-icon :label="item.coordinador.nb_docente" icon="mdi-account-tie"  v-if="item.coordinador"></list-simple-icon>
                        </td>
                        <td class="text-xs-left">
                            <item-detail icon="mdi-bookshelf" :items="item.materia" item-text="nb_materia" v-if="item.materia.length> 0"></item-detail>
                        </td>
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
                { text: 'Grupo',       value: 'nb_grupo' },
                { text: 'Grado',       value: 'grado.nb_grado' },
                { text: 'Turno',       value: 'turno.nb_turno' },
                { text: 'Calendario',  value: 'calendario.nb_calendario' },
                { text: 'Coordinador', value: 'coordinador.nb_docente' },
                { text: 'Materias',    value: 'materias' },
                { text: 'Orden',       value: 'nu_orden' },
                { text: 'Status',      value: 'id_status' },
                { text: 'Acciones',    value: 'actions', sortable: false, filterable: false },
            ],
            filter:
            {
                grado: []
            },
            itemsMenu: [
                { action: 'addMateria',   icon: 'mdi-bookshelf', label: 'Asignar Materia' },
            ],
            reports:[
                { table: 'vw_grupo',               title: 'Grupo (Grado)' },
                { table: 'vw_grupo_materia',       title: 'Grupo (Materias)' },
            ],
            dialogMateria: false,
            grupo:         null,
        }
    },
    methods:
    {
        
        onList()
        {
            axios.get(`${this.apiUrl}grado/list`)
            .then(response => 
            {
                this.filter.grado = response.data
            })
        },
        
        addMateria(grupo)
        {
            this.grupo         = grupo.id 
            this.dialogMateria = true
        },

        closeDialog(refresh, dialog)
        {
            this.grupo    = null
            this[dialog]  = false
            this.list()
        }
   
    }
}
</script>

<style>
</style>
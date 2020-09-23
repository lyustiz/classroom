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
                        <td class="text-xs-left">{{ item.nb_grado }}</td>
						<td class="text-xs-left">{{ item.nu_grado }}</td>
						<td class="text-xs-left">{{ item.nivel.nb_nivel }}</td>
                        <td class="text-xs-left">
                            <item-detail icon="mdi-alphabetical-variant" :items="item.grupo" item-text="nb_grupo" v-if="item.grupo.length> 0"></item-detail>
                        </td>
                        <td class="text-xs-left">
                            <item-detail icon="mdi-bookshelf" :items="item.materia" item-text="nb_materia" v-if="item.materia.length> 0"></item-detail>
                        </td>
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
                                    :menus="ItemsMenu" 
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
                <grado-form
                    :action="action"
                    :item="item"
                    @closeModal="closeModal()"
                ></grado-form>

            </app-modal>

            <form-delete
                :dialog="dialog"
                :loading="loading"
                message="Desea eliminar el Registro Seleccionado?"
                @deleteItem="deleteItem()"
                @deleteCancel="deleteCancel()"
            ></form-delete>

            <v-dialog v-model="dialogMateria" max-width="600" content-class="rounded-xl" scrollable>
                <grado-materia-form :grado="grado" v-if="dialogMateria" @closeModal="closeDialog($event,'dialogMateria')"></grado-materia-form>
            </v-dialog>
            <pre v-if="$App.debug">{{ $data }}</pre>

    </list-container>

</template>

<script>
import listHelper from '@mixins/Applist';
import gradoForm  from './gradoForm';
import GradoMateriaForm from '@pages/gradoMateria/AppGradoMateriaForm'
export default {

    mixins:     [ listHelper],

    components: { 
        'grado-form':         gradoForm,
        'grado-materia-form': GradoMateriaForm
    },

    data () {
        return {
            title:    'Grado',
            resource: 'grado',
            headers: [
                { text: 'Grado',    value: 'nb_grado' },
                { text: 'Orden',    value: 'nu_grado' },
                { text: 'Nivel',    value: 'nivel.nb_nivel' },
                { text: 'Grupos',   value: 'nivel.nb_nivel' },
                { text: 'Materias', value: 'nivel.nb_nivel' },
                { text: 'Status',   value: 'id_status' },
                { text: 'Acciones', value: 'actions', sortable: false, filterable: false },
            ],
            ItemsMenu: [
                { action: 'addMateria', icon: 'mdi-bookshelf', label: 'Asignar Materia' }
            ],
            reports:[
                { table: 'vw_grupo',               title: 'Grado (Grupos)' },
                { table: 'vw_grado_materia',       title: 'Grado (Materias)' },
            ],
            dialogMateria: false,
            grado:         1
        }
    },
    methods:
    {
        addMateria(grado)
        {
            this.grado         = grado
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
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
                        <td class="text-xs-left">
                            <app-foto-cuenta 
                                :origenId="item.id" 
                                :maxItems="1" 
                                :tipoFoto="3" 
                                :foto="item.foto"
                                :aspectRatio="32/43">
                            </app-foto-cuenta> 
                        </td>
                        <td class="text-xs-left">{{ item.nb_docente }}</td>
						<td class="text-xs-left">
                            <list-icon :data="sexoIcons" :value="item.tx_sexo"></list-icon>
                        </td>
						<td class="text-xs-left">{{ item.tx_documento }}</td>
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
                                @delete="deleteForm(item)" 
                            >
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
                :head-color="$App.theme.headModal"
                :title="title"
                width="95vw"
                @closeModal="closeModal()"
            >
                <docente-form
                    :action="action"
                    :item="item"
                    @closeModal="closeModal()"
                ></docente-form>

            </app-modal>

            <v-dialog v-model="addMateriaDialog" max-width="400" content-class="rounded-xl">
                <docente-materia :idDocente="idDocente" v-if="addMateriaDialog"></docente-materia>
            </v-dialog>

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
import listHelper     from '@mixins/Applist';
import docenteForm    from './docenteForm';
import docenteMateria from '@pages/docenteMateria/AppDocenteMateria';
import docenteGrupo   from '@pages/docenteGrupo/AppDocenteGrupo';

export default {
    mixins:     [ listHelper ],
    components: { 
        'docente-form':    docenteForm,
        'docente-materia': docenteMateria,
        'docente-grupo':   docenteGrupo 
    },
    data () {
        return {
            title:    'Docente',
            resource: 'docente',
            headers: [
                { text: 'Foto',                value: 'id', sortable: false, filterable: false },
                { text: 'Apellidos y Nombres', value: 'nb_docente' },
                { text: 'Sexo',                value: 'tx_sexo' },
                { text: 'Documento',           value: 'tx_documento' },
                { text: 'Status',              value: 'id_status' },
                { text: 'Acciones',            value: 'actions', sortable: false, filterable: false },
            ],
            ItemsMenu: [
                { action: 'addMateria', icon: 'mdi-file-cad-box', label: 'Asignar Materia' }
            ],
            reports:[
                { table: 'vw_docente',               title: 'Docentes (Datos Personales)' },
            ],
            addGrupoDialog: false,
            addMateriaDialog: false,
            idDocente:      null,
        }
    },
    methods:
    {
        onItemMenu(data)
        {
            switch (data.action) {
                case 'addGrupo':
                    this.addGrupo(data.item)
                    break;
                case 'addMateria':
                    this.addMateria(data.item)
                    break;
            }
        },

        addGrupo(item)
        {
            this.idDocente      = item.id
            this.addGrupoDialog = true
        },

        addMateria(item)
        {
            this.idDocente        = item.id
            this.addMateriaDialog = true
        }
   
    }
}
</script>

<style>
</style>
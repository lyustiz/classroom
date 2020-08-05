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
                        <td class="text-xs-left">{{ item.nb_prueba }}</td>
                        <td class="text-xs-left">{{ item.grado.nb_grado }}</td>
						<td class="text-xs-left">{{ item.fe_prueba }}</td>
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
                                @delete="deleteForm(item)" 
                            >
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
                <prueba-form
                    :action="action"
                    :item="item"
                    @closeModal="closeModal()"
                ></prueba-form>

            </app-modal>

            <form-delete
                :dialog="dialog"
                :loading="loading"
                message="Desea eliminar el Registro Seleccionado?"
                @deleteItem="deleteItem()"
                @deleteCancel="deleteCancel()"
            ></form-delete>

            <v-dialog v-model="dialogPregunta" max-width="95vw" content-class="rounded-xl" scrollable>
                <app-pregunta :prueba="prueba" v-if="dialogPregunta" @closeModal="closeDialog($event)"></app-pregunta>
            </v-dialog>

            <v-dialog v-model="dialogImportar" max-width="60vw" content-class="rounded-xl" scrollable>
                <importar-pregunta :prueba="prueba" v-if="dialogImportar" @closeModal="closeDialog($event)"></importar-pregunta>
            </v-dialog>
            
            <pre v-if="$App.debug">{{ $data }}</pre>

    </list-container>

</template>

<script>
import listHelper        from '@mixins/Applist';
import pruebaForm        from './pruebaForm';
import AppPregunta       from '@pages/pregunta/AppPregunta';
import ImportarPregunta  from '@pages/prueba/AppImportarPregunta';

export default {
    mixins:     [ listHelper],
    components: { 
        'prueba-form':  pruebaForm, 
        'app-pregunta': AppPregunta,
        'importar-pregunta': ImportarPregunta
    },
    data () {
    return {
        title:    'Prueba',
        resource: 'prueba',
        headers: [
            { text: 'Prueba',   value: 'nb_prueba' },
            { text: 'Grado',    value: 'id_grupo' },
			{ text: 'Fecha',    value: 'fe_prueba' },
			{ text: 'Status',   value: 'id_status' },
            { text: 'Acciones', value: 'actions', sortable: false, filterable: false },
        ],
        itemsMenu: [
                { action: 'addPreguntas',    icon: 'mdi-format-list-checkbox',  label: 'Crear Preguntas' },
                { action: 'importPreguntas', icon: 'mdi-import',  label: 'Importar Preguntas' },
        ],
        dialogPregunta: false,
        dialogImportar: false,
        prueba:         null
    }
    },
    methods:
    {
        addPreguntas(prueba)
        {
            this.dialogPregunta = true;
            this.prueba = prueba
        },

        importPreguntas(prueba)
        {
            this.dialogImportar = true;
            this.prueba = prueba
        },

        closeDialog(refresh)
        {
            this.dialogImportar = false,
            this.dialogPregunta = false;
            this.prueba = null
            if(refresh) this.list()
        }
   
    }
}
</script>

<style>
</style>
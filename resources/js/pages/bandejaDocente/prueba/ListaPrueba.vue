<template>

    <v-card flat>

            <v-row>
                <v-spacer></v-spacer>
                <add-button @insItem="insertForm()"></add-button> 
            </v-row>
            
            <v-row>
                <v-col cols="12" md="6">
                    <v-select
                    :items="materias"
                    v-model="materia"
                    item-text="nb_materia"
                    item-value="id"
                    label="Materia"
                    hint="Seleccione una materia para listar las pruebas"
                    persistent-hint
                    :loading="loading"
                    dense
                    @change="getPruebas()"
                    ></v-select>
                </v-col>
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
            </v-row>

            <v-data-table
                :headers="headers"
                dense
                :items  ="items"
                :search ="search"
                item-key="id"
                :loading="loading"
                sort-by=""
                :no-data-text=" (materia) ? 'No se han cargado pruebas' : 'Seleccione Materia'"
            >

                <template v-slot:item="{ item }">
                    <tr>
                        <td class="text-xs-left">{{ item.nb_prueba }}</td>
                        <td class="text-xs-left">{{ item.grado.nb_grado }}</td>
						<td class="text-xs-left">{{ item.fe_prueba | formatDate }}</td>
                        <td class="text-xs-left">{{ item.status.nb_status }}</td>
					
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
                    :docente="docente"
                    :grado="grado"
                    :materias="materias"
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

    </v-card>

</template>

<script>
import listHelper        from '@mixins/Applist';
import pruebaForm        from './FormPrueba';
import AppPregunta       from '@pages/pregunta/AppPregunta';
import ImportarPregunta  from '@pages/prueba/AppImportarPregunta';

export default {

    mixins:     [ listHelper],

    components: { 
        'prueba-form':  pruebaForm, 
        'app-pregunta': AppPregunta,
        'importar-pregunta': ImportarPregunta
    },

    watch:
    {
        grado(grado)
        {
            this.items   = [];
            this.materia = null;
        }
    },

    props: {
        
        docente: {
            type:    Object,
            default: () => {}
        },

        materias: {
            type:    Array,
            default: () => {}
        },

        grado: {
            type:    Object,
            default: () => {}
        },
    },

    data () {
        return {
            autolist: false,
            title:    'Prueba',
            resource: 'prueba',
            headers: [
                { text: 'Prueba',   value: 'nb_prueba' },
                { text: 'Grado',    value: 'id_grupo' },
                { text: 'Fecha Ejecucion',    value: 'fe_prueba' },
                { text: 'Status',    value: 'status' },
                { text: 'Acciones', value: 'actions', sortable: false, filterable: false },
            ],
            itemsMenu: [
                    { action: 'addPreguntas',    icon: 'mdi-format-list-checkbox',  label: 'Crear Preguntas' },
                    { action: 'importPreguntas', icon: 'mdi-import',  label: 'Importar Preguntas' },
            ],
            dialogPregunta: false,
            dialogImportar: false,
            prueba:         null,
            materia:        null
        }
    },
    methods:
    {
        
        getPruebas()
        {
            if(this.materia) this.list();
        },
        
        listUrl()
        {
            return `${this.fullUrl}/docente/${this.docente.id}/grado/${this.grado.id}/materia/${this.materia}`
        },
        
        
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
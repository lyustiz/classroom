<template>

    <list-container :title="title" :head-color="$App.theme.headList" @onMenu="onMenu($event)">

        <template slot="HeadTools">
            <add-button @insItem="insertForm()"></add-button>
        </template>

           <v-row>

            <v-col cols="12" md="4">
                <v-text-field
                    v-model="search"
                    append-icon="search"
                    label="Buscar"
                    hide-details
                    clearable
                    dense
                ></v-text-field>

            </v-col>

            <v-col cols="12" md="4">
                <v-select
                :items="selects.grado"
                    v-model="grado"
                    item-value="nb_grado"
                    item-text="nb_grado"
                    label="Grado"
                    clearable
                    hide-details
                    dense
                ></v-select>

            </v-col>

            <v-col cols="12" md="4">
                <v-select
                    :items="selects.materia"
                    v-model="materia"
                    item-value="nb_materia"
                    item-text="nb_materia"
                    label="Materia"
                    clearable
                    hide-details
                    dense
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
            >

                <template v-slot:item="{ item }">
                    <tr>
                        <td class="text-xs-left">{{ item.nb_prueba }}</td>
                        <td class="text-xs-left">{{ item.grado.nb_grado }}</td>
                        <td class="text-xs-left">{{ item.materia.nb_materia }}</td>
                        <td class="text-xs-left">{{ item.tema.nb_tema }}</td>
						<td class="text-xs-left">{{ item.nu_minutos }}</td>
                        <td class="text-xs-left">{{ item.nu_peso }}</td>
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

     watch:
    {
        items(items)
        {
            if(items.length>0)
            {
                items.forEach( (item) => {
                    this.selects.grado.push(item.grado)
                    this.selects.materia.push(item.materia)
                }, this)
            }
        }
    },

    data () 
    {
        return {
            title:    'Prueba',
            resource: 'prueba',
            headers: [
                { text: 'Prueba',   value: 'nb_prueba' },
                { text: 'Grado',       value: 'grado.nb_grado',     filter: this.filterGrado },
                { text: 'Materia',     value: 'materia.nb_materia', filter: this.filterMateria },
                { text: 'Tema',     value: 'id_tema' },
                { text: 'Tiempo',   value: 'nu_minutos' },
                { text: 'Peso',     value: 'nu_peso' },
                { text: 'Status',   value: 'id_status' },
                { text: 'Acciones', value: 'actions', sortable: false, filterable: false },
            ],
            itemsMenu: [
                    { action: 'addPreguntas',    icon: 'mdi-format-list-checkbox',  label: 'Crear Preguntas' },
                    { action: 'importPreguntas', icon: 'mdi-import',  label: 'Importar Preguntas' },
            ],
            dialogPregunta: false,
            dialogImportar: false,
            prueba:         null,
            selects:{
                grado:   [],
                materia: []
            },
            grado:   '',
            materia: '',
        }
    },

    methods:
    {
        filterGrado(value, search, item )
        {
            if(!this.grado) return true
            
            return value == this.grado
        },

        filterMateria(value, search, item )
        {
            if(!this.materia) return true
            
            return value == this.materia
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
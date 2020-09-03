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
                        <td class="text-xs-left">{{ item.nb_grado }}</td>
						<td class="text-xs-left">{{ item.nu_grado }}</td>
						<td class="text-xs-left">{{ item.nivel.nb_nivel }}</td>
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

            <v-dialog v-model="dialogMateria" max-width="600" content-class="rounded-xl">
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
                { text: 'Orden',   value: 'nu_grado' },
                { text: 'Nivel',    value: 'nivel.nb_nivel' },
                { text: 'Status',   value: 'id_status' },
                { text: 'Acciones', value: 'actions', sortable: false, filterable: false },
            ],
            ItemsMenu: [
                { action: 'addMateria', icon: 'mdi-file-cad-box', label: 'Asignar Materia' }
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
        }
    }
}
</script>

<style>
</style>
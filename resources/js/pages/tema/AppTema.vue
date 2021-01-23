<template>

<v-card class="rounded-xl">
    <v-card-title class="pa-0 blue darken-4 white--text">
        <app-simple-toolbar :title="`Temas - ${grado.nb_grado} - ${materia.nb_materia}` " @closeModal="$emit('closeDialog')"></app-simple-toolbar>
    </v-card-title>
    <v-card-text>
        <v-row>
            <v-col cols="11" >
                <v-text-field
                    v-model="search"
                    append-icon="search"
                    label="Buscar"
                    hide-details
                    clearable
                    dense
                    solo
                    rounded
                ></v-text-field>
            </v-col>
            <v-col cols="1" class="text-center py-4" >
                <add-button @insItem="insertForm()"></add-button>
            </v-col>

            <v-col>

            <v-data-table
                :headers="headers"
                :items  ="temas"
                :search ="search"
                item-key="id"
                :loading="loading"
                sort-by=""
                dense
            >

                <template v-slot:item="{ item }">
                    <tr>
                        <td class="text-xs-left">{{ item.nu_tema }}</td>
                        <td class="text-xs-left">{{ item.nb_tema }}</td>
						<td class="text-xs-left"><list-simple-icon icon="mdi-text-box-outline" color="indigo" :label="item.tx_descripcion"></list-simple-icon></td>
						<td class="text-xs-left">
                            <status-switch 
                                :loading="loading" 
                                resource="tema" 
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
            </v-col>

            <app-modal
                :modal="modal"
                @closeModal="closeModal()"
                :head-color="$App.theme.headModal"
                :title="title"
            >
                <tema-form
                    :action="action"
                    :item="item"
                    :grado="grado"
                    :materia="materia"
                    :temas="temas"
                    @closeModal="closeModal()"
                ></tema-form>

            </app-modal>

            <form-delete
                :dialog="dialog"
                :loading="loading"
                message="Desea eliminar el Registro Seleccionado?"
                @deleteItem="deleteItem()"
                @deleteCancel="deleteCancel()"
            ></form-delete>
            <pre v-if="$App.debug">{{ $data }}</pre>
        </v-row>            
    </v-card-text>
</v-card>

</template>

<script>
import Applist from '@mixins/Applist';
import temaForm  from './AppTemaForm';

export default {

    mixins:     [ Applist],

    components: { 
        'tema-form': temaForm 
    },

    props: 
    {
        grado: {
            type: Object,
            default: () =>{}
        },

        materia: {
            type: Object,
            default: () =>{}
        },

        temas: {
            type: Array,
            default: () =>[]
        },

    },


    data () {
        return {
            resource: 'tema',
            title:    `Temas`,
            headers: [
                { text: 'Nro',         value: 'nu_tema' },
                { text: 'Tema',        value: 'nb_tema' },
                { text: 'Descripcion', value: 'tx_descripcion' },
                { text: 'Status',      value: 'id_status' },
                { text: 'Acciones',    value: 'actions', sortable: false, filterable: false },
            ],
        }
    },
    methods:
    {
        list(){
            this.loading = false
        },

        closeModal()
        {
            this.action = '';
            this.modal  = false;
            this.item   = {};
            this.$emit('updateData');
        },
    }
}
</script>

<style>
</style>
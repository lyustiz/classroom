<template>

    
    <v-card>
        
    <app-simple-toolbar title="Asignar Pariente" @closeModal="$emit('closeModal')"></app-simple-toolbar>  
    
    <v-card-text>
            
        <v-row >

            <v-spacer></v-spacer>

            <v-col cols="auto">
                <v-tooltip bottom>
                    <template v-slot:activator="{ on }">
                        <v-btn v-on="on" fab x-small dark color="success" class="mr-1" :loading="loading" @click="vincularPariente()">
                            <v-icon>mdi-link-variant-plus</v-icon>
                        </v-btn>
                    </template>
                   Vincular Pariente
                </v-tooltip>
                <add-button :loading="loading" @insItem="insertForm()"></add-button>
            </v-col>

        </v-row>

        <v-row>

            <v-col cols="12">
    
            <v-data-table
                :headers="headers"
                :items  ="items"
                :search ="search"
                item-key="id"
                :loading="loading"
                sort-by="id_parentesco"
                disable-pagination
                hide-default-footer
            >

                <template v-slot:item="{ item }">
                    <tr>
                        <td class="text-xs-left">{{ item.nb_pariente }}</td>
						<td class="text-xs-left">{{ item.tx_documento }}</td>
						<td class="text-xs-left">
                            <list-icon :data="sexoIcons" :value="item.tx_sexo"></list-icon>
                        </td>
						<td class="text-xs-left">{{ item.parentesco.nb_parentesco }}</td>
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

                                <v-tooltip bottom>
                                    <template v-slot:activator="{ on }">
                                        <v-btn v-on="on" fab x-small dark color="red" depressed @click="showConfirm(item)">
                                            <v-icon>mdi-link-variant-off</v-icon>
                                        </v-btn>
                                    </template>
                                    Desvincular Pariente
                                </v-tooltip>
                                
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
                <alumno-pariente-form
                    :action="action"
                    :item="item"
                    @closeModal="closeModal()"
                    :alumno="alumno"
                ></alumno-pariente-form>

            </app-modal>

            <form-delete
                :dialog="dialog"
                :loading="loading"
                message="Desea eliminar el Registro Seleccionado?"
                @deleteItem="deleteItem()"
                @deleteCancel="deleteCancel()"
            ></form-delete>

            <v-dialog v-model="dialogVincular" max-width="600" content-class="rounded-xl">
                <vincular-pariente :alumno="alumno" v-if="dialogVincular" @closeModal="closeDialog($event,'dialogVincular')"></vincular-pariente>
            </v-dialog>

            <app-confirm :confirm="confirm" mensaje="Desea desvincular el Pariente" @closeConfirm="closeConfirm($event)"></app-confirm>
            
            <pre v-if="$App.debug">{{ $data }}</pre>

            </v-col>

        </v-row>

    </v-card-text>
    </v-card>

</template>

<script>
import listHelper from '@mixins/Applist';
import AppAlumnoParienteForm  from './AppAlumnoParienteForm';
import AppVincularPariente  from './AppVincularPariente';

export default {

    mixins:     [ listHelper],

    components: { 
        'alumno-pariente-form': AppAlumnoParienteForm,
        'vincular-pariente':    AppVincularPariente 
    },

    props:
    {
        alumno: {
            type: Object,
            default: () => {}
        },
    },

    data: () => ({
        title:    'Pariente',
        resource: 'pariente',
        headers: [
            { text: 'Pariente',   value: 'nb_pariente' },
			{ text: 'Documento',  value: 'tx_documento' },
			{ text: 'Sexo',       value: 'tx_sexo' },
			{ text: 'Parentesco', value: 'parentesco.nb_parentesco' },
			{ text: 'Status',     value: 'id_status' },
            { text: 'Acciones',   value: 'actions', sortable: false, filterable: false },
        ],
        dialogVincular: false
    }),

    methods:
    {
        listUrl()
        {
            return `${this.fullUrl}/alumno/${this.alumno.id}`
        },

        vincularPariente()
        {
            this.dialogVincular = true
        },

        closeDialog(refresh, dialog)
        {
            if(refresh) this.list()
            this[dialog] = false
        },

        showConfirm(item)
        {
            this.item    = item
            this.confirm = true
        },

        closeConfirm(confirm)
        {
            if(confirm){
                this.desvincularPariente()
            }
            else{
                this.item = {}
            }
            this.confirm = false
        },

        desvincularPariente()
        {
            this.deleteItem()
        },

        deleteUrl()
        {
           return `${this.fullUrl}/${this.item.id}/alumno/${this.alumno.id}`
        },
    

    }
}
</script>

<style>
</style>
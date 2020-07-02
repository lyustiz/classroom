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
                        <td class="text-xs-left">{{ item.tipo_recurso.nb_tipo_recurso }}</td>
						<td class="text-xs-left">{{ item.grado.nb_grado }}</td>
						<td class="text-xs-left">{{ item.grupo.nb_grupo }}</td>
						<td class="text-xs-left">
                            <status-switch 
                                :loading="loading" 
                                :item="item" 
                                @onChangeStatus="changeStatus($event)">
                            </status-switch>
                        </td>
                        
                        <td class="text-xs-left">
                            <list-buttons 
                                @update="updateForm(item)" 
                                @delete="deleteForm(item)" >

                                <v-badge left color="red" :value=" (item.archivo) ?  item.archivo.length > 0 : 0" overlap dot bordered >
                                    <v-btn fab class="my-1" dark x-small color="cyan lighten-2" @click="addFile(item)" :loading="loading" v-if="item.id">
                                        <v-icon>mdi-paperclip</v-icon>
                                    </v-btn>
                                </v-badge>

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
                <recurso-form
                    :action="action"
                    :item="item"
                    @closeModal="closeModal()"
                ></recurso-form>

            </app-modal>

            <form-delete
                :dialog="dialog"
                :loading="loading"
                message="Desea eliminar el Registro Seleccionado?"
                @deleteItem="deleteItem()"
                @deleteCancel="deleteCancel()"
            ></form-delete>

            <v-dialog
                v-model="fileDialog"
                max-width="500px"
                content-class="rounded-xl"
            >
                <archivo-upload 
                    :origen="origen"
                    :origenId="origenId"
                    :tipoArchivo="tipoArchivo"
                    :maxItems="maxItems"
                    @closeModal="closeFileUpload()"
                ></archivo-upload>
            </v-dialog>
            
            <pre v-if="$App.debug">{{ $data }}</pre>

    </list-container>

</template>

<script>
import listHelper from '@mixins/Applist';
import recursoForm  from './recursoForm';
import ArchivoUpload from '@pages/archivo/archivoUpload';
export default {

    mixins:     [ listHelper],

    components: 
    { 
        'recurso-form':   recursoForm,
        'archivo-upload': ArchivoUpload
    },

    data () 
    {
        return {
            title:      'Recursos',
            resource:   'recurso',
            headers: [
                { text: 'Tipo Recurso',   value: 'tipo_recurso.nb_tipo_recurso' },
                { text: 'Grado',   value: 'grado.nb_grado' },
                { text: 'Grupo',   value: 'grupo.nb_grupo' },
                { text: 'Status',   value: 'id_status' },
                { text: 'Acciones', value: 'actions', sortable: false, filterable: false },
            ],

            //fileUpload
            fileDialog:  false,
            origen:      'recurso',
            origenId:    null,
            tipoArchivo: null,
            maxItems:    5
        }
    },
    methods:
    {
        addFile(item)
        {
            this.fileDialog  = true
            this.origenId    = item.id
            this.tipoArchivo = item.tipo_recurso.id_tipo_archivo
        },

        closeFileUpload()
        {
            this.fileDialog  = false
            this.origenId    = null
            this.tipoArchivo = null
            this.list()
        }
    }
}
</script>

<style>
</style>
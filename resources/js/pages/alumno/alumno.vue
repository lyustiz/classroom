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
                        <td class="text-xs-left">
                            <app-foto-cuenta 
                                :origenId="item.id" 
                                :maxItems="1" 
                                :tipoFoto="2" 
                                :foto="item.foto"
                                :aspectRatio="32/43"
                                >
                            </app-foto-cuenta> 
                        </td>
                        
                        <td class="text-xs-left">{{ item.nb_alumno_corto }}</td>

						<td class="text-xs-left">
                            <list-icon :data="sexoIcons" :value="item.tx_sexo"></list-icon>
                        </td>

                        <td class="text-xs-left">{{ (item.grado) ? item.grado.nb_grado : null }}</td>
                        <td class="text-xs-left">{{ (item.grupo) ? item.grupo.nb_grupo : null }}</td>
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
                <alumno-form
                    :action="action"
                    :item="item"
                    @closeModal="closeModal()"
                ></alumno-form>

            </app-modal>

            <v-dialog v-model="dialogMatricula" max-width="600" content-class="rounded-xl">
                <app-simple-toolbar title="Asignar Matricula" @closeModal="closeDialog($event)"></app-simple-toolbar>
                <matricula-alumno :matricula="matricula" :alumno="alumno" v-if="dialogMatricula"  @closeModal="closeDialog($event)"></matricula-alumno>
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
import listHelper   from '@mixins/Applist';
import alumnoForm   from './alumnoForm';
import AppMatricula from '@pages/matricula/AppMatricula';
export default {
    
    mixins:     [ listHelper],

    components: { 
                    'alumno-form'     : alumnoForm,
                    'matricula-alumno': AppMatricula,
                },

    data () {
        return {
            title:    'Alumno',
            resource: 'alumno',
            headers: [
                { text: 'Foto',         value: 'id', sortable: false, filterable: false },
                { text: 'Alumno',       value: 'nb_alumno' },
                { text: 'Sexo',         value: 'tx_sexo' },
                { text: 'Grado',        value: 'grado' },
                { text: 'Grupo',        value: 'grupo' },
                { text: 'Documento',    value: 'tx_documento' },
                { text: 'Status',       value: 'id_status' },
                { text: 'Acciones',     value: 'actions', sortable: false, filterable: false },
            ],
            sexoIcons: [
                {value: 'M', icon: 'mdi-human-male',  color: 'blue', label: 'Masculino'},
                {value: 'F', icon: 'mdi-human-female',  color: 'pink', label: 'Femenino'}
            ],
            ItemsMenu: [
                { action: 'addMatricula',   icon: 'mdi-account-details', label: 'Matricula' },
            ],

            dialogMatricula: false,
            matricula:       null,
            alumno:          null,
        }
    },
    methods:
    {
        onItemMenu(data)
        {
            switch (data.action) {

                case 'addMatricula':
                    this.addMatricula(data.item)
                    break;
            }
        },

        addMatricula(alumno)
        {
            this.matricula = alumno.matricula 
            this.alumno    = alumno.id
            this.dialogMatricula = true
        },

        closeDialog(refresh)
        {
            this.matricula = null
            this.alumno    = null
            this.dialogMatricula =  false
            if(refresh) this.list()
        }
    }
}
</script>

<style>
</style>
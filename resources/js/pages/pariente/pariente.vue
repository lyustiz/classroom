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
            >

                <template v-slot:item="{ item }">
                    <tr>
                        <td>
                            <app-foto-cuenta 
                                :origenId="item.id" 
                                :maxItems="1" 
                                :tipoFoto="5" 
                                :foto="item.foto"
                                :aspectRatio="32/43"
                                >
                            </app-foto-cuenta> 
                        </td>
                        <td class="text-xs-left">{{ item.nb_pariente }}</td>
						<td class="text-xs-left">{{ item.tx_documento }}</td>
						<td class="text-xs-left">
                            <list-icon :data="sexoIcons" :value="item.tx_sexo"></list-icon>
                        </td>
                        <td class="text-xs-left">{{ item.nu_edad }}</td>
						<td class="text-xs-left">
                            <v-tooltip bottom :key="alumno.id" v-for="alumno in item.alumno">
                                <template v-slot:activator="{ on }">
                                    <v-btn icon dark x-small v-on="on" class="elevation-5 mx-1">
                                        <v-icon size="28" color="success" >mdi-school</v-icon>
                                    </v-btn>
                                </template>
                                <span v-text="alumno.nb_alumno"></span>
                            </v-tooltip>
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
                                @delete="deleteForm(item)" 
                                :del="item.alumno.length < 1">

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
                width="95vw"
            >
                <pariente-form
                    :action="action"
                    :item="item"
                    @closeModal="closeModal()"
                ></pariente-form>

            </app-modal>

            <form-delete
                :dialog="dialog"
                :loading="loading"
                message="Desea eliminar el Registro Seleccionado?"
                @deleteItem="deleteItem()"
                @deleteCancel="deleteCancel()"
            ></form-delete>

            <v-dialog v-model="dialogVincularAlumno" max-width="500px" content-class="rounded-xl">
                <vincular-alumno 
                    :pariente="pariente" 
                    v-if="dialogVincularAlumno" 
                    @closeModal="dialogVincularAlumno = false"
                    @onUpdate="list()">
                </vincular-alumno>
            </v-dialog>

            <pre v-if="$App.debug">{{ $data }}</pre>

    </list-container>

</template>

<script>
import listHelper from '@mixins/Applist';
import parienteForm  from './parienteForm';
import AppVincularAlumno  from './AppVincularAlumno';
export default {

    mixins:     [ listHelper],

    components: { 
            'pariente-form':   parienteForm,
            'vincular-alumno': AppVincularAlumno 
    },

    data: () => ({
        title:    'Acudiente',
        resource: 'pariente',
        headers: [
            { text: 'Foto',       value: 'tx_foto', sortable: false, filterable: false },
            { text: 'Pariente',   value: 'nb_pariente' },
			{ text: 'Documento',  value: 'tx_documento' },
            { text: 'Sexo',       value: 'tx_sexo' },
            { text: 'Edad',       value: 'nu_edad' },
			{ text: 'Alumnos',    value: 'id_alumno' },
			{ text: 'Parentesco', value: 'parentesco.nb_parentesco' },
			{ text: 'Status',     value: 'id_status' },
            { text: 'Acciones',   value: 'actions', sortable: false, filterable: false },
        ],
        itemsMenu: [
            { action: 'vincularAlumno',      icon: 'mdi-school', label: 'Alumnos' },
        ],
        dialogVincularAlumno: false,
        pariente: null
    }),
    methods:
    {

        vincularAlumno(pariente)
        {
            this.dialogVincularAlumno = true
            this.pariente = pariente
        }
   
    }
}
</script>

<style>
</style>
<template>

    <list-container :title="title" :head-color="$App.theme.headList" :itemsMenu="listMenu" @onMenu="onListMenu($event)" :inDialog="inDialog">

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
                <alumno-form
                    :action="action"
                    :item="item"
                    @closeModal="closeModal()"
                ></alumno-form>

            </app-modal>

            <v-dialog v-model="dialogMatricula" max-width="600" content-class="rounded-xl">
                <app-simple-toolbar title="Asignar Matricula" @closeModal="closeDialog($event,'dialogMatricula')"></app-simple-toolbar>
                <matricula-alumno :matricula="matricula" :alumno="alumno" v-if="dialogMatricula"  @closeModal="closeDialog($event)"></matricula-alumno>
            </v-dialog>

            <v-dialog v-model="dialogAlumnoMateria" max-width="600" content-class="rounded-xl">
                <alumno-materia :idAlumno="alumno" :idGrado="grado" v-if="dialogAlumnoMateria" @closeModal="closeDialog($event,'dialogAlumnoMateria')"></alumno-materia>
            </v-dialog>

            <v-dialog v-model="dialogAlumnosMateria" max-width="600" content-class="rounded-xl">
                <alumnos-materia v-if="dialogAlumnosMateria" @closeModal="closeDialog($event,'dialogAlumnosMateria')"></alumnos-materia>
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
import listHelper        from '@mixins/Applist';
import alumnoForm        from './alumnoForm';
import AppMatricula      from '@pages/matricula/AppMatricula';
import AppAlumnoMateria  from '@pages/alumnoMateria/AppAlumnoMateria';
import AppAlumnosMateria from '@pages/alumnoMateria/AppAlumnosMateria';
export default {
    
    mixins:     [ listHelper],

    components: { 
                    'alumno-form'      : alumnoForm,
                    'matricula-alumno' : AppMatricula,
                    'alumno-materia'   : AppAlumnoMateria,
                    'alumnos-materia'  : AppAlumnosMateria,
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
            itemsMenu: [
                { action: 'addMatricula',   icon: 'mdi-account-details', label: 'Matricula' },
                { action: 'addMateriaAlumno',   icon: 'mdi-bookshelf', label: 'Asignar Materia' },
                { action: 'addLibroAlumno',   icon: 'mdi-account-alert', label: 'Faltas y Sanciones' },
            ],
            listMenu:[
                { action: 'list',   icon: 'mdi-table-refresh', label: 'Refrescar' },
                { action: 'addMateriasAlumnos',   icon: 'mdi-bookshelf', label: 'Agregar Materias Alumnos' },
                { action: 'print',   icon: 'mdi-printer', label: 'Reporte Alumnos' },
            ],
            dialogMatricula:      false,
            dialogAlumnoMateria:  false,
            dialogAlumnosMateria: false,
            matricula:       null,
            alumno:          null,
            grado:           null
        }
    },
    methods:
    {

        addMateriaAlumno(alumno)
        {
            if(!alumno.grado) {
                this.showError('Debe Asignar Grado al alumno') 
                return
            }
            this.grado     = alumno.grado.id
            this.alumno    = alumno.id
            this.dialogAlumnoMateria = true
        },

        print()
        {
            alert('print')
        },

        addMateriasAlumnos()
        {
            this.dialogAlumnosMateria = true
        },

        addMatricula(alumno)
        {
            this.matricula = alumno.matricula 
            this.alumno    = alumno.id
            this.dialogMatricula = true
        },

        closeDialog(refresh, dialog)
        {
            this.matricula = null
            this.alumno    = null
            this.grado     = null
            this[dialog]   = false
            if(refresh)    this.list()
        }
    }
}
</script>

<style>
</style>
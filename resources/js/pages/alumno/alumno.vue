<template>

    <list-container :title="title" :head-color="$App.theme.headList" :itemsMenu="listMenu" @onMenu="onListMenu($event)" :inDialog="inDialog">

        <template slot="HeadTools">
            <v-col cols="auto">
                <add-button @insItem="insertForm()"></add-button>
            </v-col>
            <v-col cols="auto">
                <report-menu :reports="reports" @onReport="onReport($event)"></report-menu>
                <app-report :tableName="report.table" :title="report.title" :show="report.show" v-if="report.show" @onCloseReport="onCloseReport()"></app-report>
            </v-col>
        </template>

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
                        
                        <td class="text-xs-left">{{ item.nb_corto }}</td>

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
                <alumno-matricula :matricula="matricula" :alumno="alumno" v-if="dialogMatricula"  @closeModal="closeDialog($event)"></alumno-matricula>
            </v-dialog>

            <v-dialog v-model="dialogAlumnoMateria" max-width="600" content-class="rounded-xl">
                <alumno-materia :idAlumno="alumno" :idGrado="grado" v-if="dialogAlumnoMateria" @closeModal="closeDialog($event,'dialogAlumnoMateria')"></alumno-materia>
            </v-dialog>

            <v-dialog v-model="dialogAlumnosMateria" max-width="600" content-class="rounded-xl">
                <alumnos-materia v-if="dialogAlumnosMateria" @closeModal="closeDialog($event,'dialogAlumnosMateria')"></alumnos-materia>
            </v-dialog>

            <v-dialog v-model="dialogPariente" max-width="95vw" content-class="rounded-xl">
                <alumno-pariente :alumno="alumno" v-if="dialogPariente" @closeModal="closeDialog($event,'dialogPariente')"></alumno-pariente>
            </v-dialog>

            <v-dialog v-model="dialogIncidencia" max-width="95vw" content-class="rounded-xl">
                <alumno-incidencia :alumno="alumno" v-if="dialogIncidencia" @closeModal="closeDialog($event,'dialogIncidencia')"></alumno-incidencia>
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
import listHelper          from '@mixins/Applist';
import alumnoForm          from './alumnoForm';
import AppMatricula        from '@pages/matricula/AppMatricula';
import AppAlumnoMateria    from '@pages/alumnoMateria/AppAlumnoMateria';
import AppAlumnosMateria   from '@pages/alumnoMateria/AppAlumnosMateria';
import AppAlumnoPariente   from '@pages/alumnoPariente/AppAlumnoPariente';
import AppAlumnoIncidencia from '@pages/incidencia/AppIncidencia';

export default {
    
    mixins:     [ listHelper],

    components: { 
                    'alumno-form'       : alumnoForm,
                    'alumno-matricula'  : AppMatricula,
                    'alumno-materia'    : AppAlumnoMateria,
                    'alumnos-materia'   : AppAlumnosMateria,
                    'alumno-pariente'   : AppAlumnoPariente,
                    'alumno-incidencia' : AppAlumnoIncidencia,
                },

    data () {
        return {
            title:    'Alumno',
            resource: 'alumno',
            headers: [
                { text: 'Foto',         value: 'id', sortable: false, filterable: false },
                { text: 'Alumno',       value: 'nb_corto' },
                { text: 'Sexo',         value: 'tx_sexo' },
                { text: 'Grado',        value: 'grado.nb_grado' },
                { text: 'Grupo',        value: 'grupo.nb_grupo' },
                { text: 'Documento',    value: 'tx_documento' },
                { text: 'Status',       value: 'id_status' },
                { text: 'Acciones',     value: 'actions', sortable: false, filterable: false },
            ],
            itemsMenu: [
                { action: 'addMatricula',     icon: 'mdi-account-details',  label: 'Matricula' },
                { action: 'addMateriaAlumno', icon: 'mdi-bookshelf',        label: 'Asignar Materia' },
                { action: 'addIncidencia',    icon: 'mdi-account-alert',    label: 'Faltas y Sanciones' },
                { action: 'addPariente',      icon: 'mdi-human-male-child', label: 'Acudientes' },
            ],
            listMenu:[
                { action: 'list',   icon: 'mdi-table-refresh', label: 'Refrescar' },
                { action: 'addMateriasAlumnos',   icon: 'mdi-bookshelf', label: 'Agregar Materias Alumnos' },
            ],
            reports:[
                { table: 'vw_alumno',               title: 'Alumnos (Datos Personales)' },
                { table: 'vw_alumno_matricula',     title: 'Alumnos (Con Matricula)' },
                { table: 'vw_alumno_sin_matricula', title: 'Alumnos (Sin Matricula)' },
                { table: 'vw_alumno_acudiente',     title: 'Alumnos (Acudientes)' },
            ],
            dialogMatricula:      false,
            dialogAlumnoMateria:  false,
            dialogAlumnosMateria: false,
            dialogPariente:       false,
            dialogIncidencia:     false,
            matricula:       null,
            alumno:          null,
            grado:           null
        }
    },
    methods:
    {


        addMatricula(alumno)
        {
            this.matricula = alumno.matricula 
            this.alumno    = alumno.id
            this.dialogMatricula = true
        },

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

        addMateriasAlumnos()
        {
            this.dialogAlumnosMateria = true
        },

        addIncidencia(alumno)
        {
            this.alumno    = alumno
            this.dialogIncidencia = true
        },

        addPariente(alumno)
        {
            this.alumno    = alumno
            this.dialogPariente = true
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
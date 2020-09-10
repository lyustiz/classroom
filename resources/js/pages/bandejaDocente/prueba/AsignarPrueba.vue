<template>

    <v-card :loading="loading" flat height="80vh">

        <v-card-title class="pa-0">
            <app-simple-toolbar title="Asignar Pruebas" @closeModal="$emit('closeModal', true)"></app-simple-toolbar>
        </v-card-title>

        <v-card-text>

            <v-row no-gutters class="mt-3">

                <v-col cols="12" md="4" class="px-2">
                    <v-select
                        :items="grados"
                        item-text="nb_grado"
                        item-value="id"
                        v-model="grado"
                        :rules="[rules.select]"
                        label="Grados"
                        :loading="loading"
                        dense
                        filled
                        outlined
                        rounded
                        color="indigo lighten-3"
                        return-object
                        @change="getGrupos($event)"
                    ></v-select>
                </v-col>

                <v-col cols="12" md="4" class="px-2">
                    <v-select
                        :items="grupos"
                        item-text="nb_grupo"
                        item-value="id"
                        v-model="grupo"
                        :rules="[rules.select]"
                        label="Grupos"
                        :loading="loading"
                        dense
                        filled
                        outlined
                        rounded
                        color="indigo lighten-3"
                        @change="getMaterias($event)"
                        :disabled="grupos.length < 1"
                    ></v-select>
                </v-col>

                <v-col cols="12" md="4" class="px-2">
                    <v-select
                        :items="materias"
                        item-text="nb_materia"
                        item-value="id"
                        v-model="materia"
                        :rules="[rules.select]"
                        label="Materias"
                        :loading="loading"
                        dense
                        filled
                        outlined
                        rounded
                        color="indigo lighten-3"
                        @change="getPruebas($event)"
                        :disabled="materias.length < 1"
                    ></v-select>
                </v-col>

            </v-row>

            <v-row no-gutters>

                <v-col cols="11" class="px-2"> 
                    <v-select
                        :items="pruebasPendientes"
                        item-text="nb_prueba"
                        item-value="id"
                        v-model="prueba"
                        label="Pruebas sin Asignar"
                        :loading="loading"
                        dense
                        filled
                        outlined
                        rounded
                        color="indigo lighten-3"
                        return-object
                        :disabled="pruebasPendientes.length < 1"
                    ></v-select>
                </v-col>

                <v-col class="text-center">
                    <app-button :disabled="!prueba" color="success" icon="mdi-text-box-check-outline" label="Asignar Grupo" :loading="loading" @click="asignarPrueba()"></app-button>

                    <v-dialog v-model="dialogAsignarPrueba" max-width="500" content-class="rounded-xl" scrollable>
                        <asignar-prueba-form 
                            :item="prueba" :grupo="grupo" action="upd" v-if="dialogAsignarPrueba" @closeModal="closeDialog($event,'dialogAsignarPrueba')"
                        ></asignar-prueba-form>
                    </v-dialog>

                </v-col>

            </v-row>

            <v-row no-gutters>

                <v-col>
                    <v-subheader class="grey pl-4 lighten-3 rounded-t-lg">
                        <v-icon class="mr-2" color="orange">mdi-book-lock</v-icon>Pruebas Asignadas
                    </v-subheader>

                    <v-data-table
                        :headers="headers"
                        dense
                        :items  ="pruebasAsignadas"
                        :search ="search"
                        item-key="id"
                        :loading="loading"
                        sort-by=""
                        :no-data-text=" (materia) ? 'No se han cargado pruebas' : 'Seleccione Materia'"
                    >

                        <template v-slot:item="{ item }">
                            <tr>
                                <td class="text-xs-left">{{ item.nb_prueba }}</td>
                                <td class="text-xs-left">{{ item.grupo.nb_grupo }}</td>
                                <td class="text-xs-left">{{ item.materia.nb_materia }}</td>
                                <td class="text-xs-left">{{ item.evaluacion.tx_tema }}</td>
                                <td class="text-xs-left">{{ item.alumno.length }}</td>
                            
                                <td class="text-xs-left py-1">
                                    <app-button 
                                        color="amber" 
                                        icon="mdi-account-multiple-plus" 
                                        label="Asignar Alumnos" 
                                        :loading="loading" 
                                        @click="asignarAlumnos(item)">
                                    </app-button>
                                    <app-button  
                                        v-if="item.id_status == 4"
                                        color="red" 
                                        icon="mdi-text-box-remove-outline" 
                                        label="Remover Asignacion" 
                                        :loading="loading" 
                                        @click="removerAsignacion(item)">
                                    </app-button>
                                </td>
                            </tr>
                        </template>

                    </v-data-table>
                </v-col>

            </v-row>
            
        </v-card-text>

        <v-dialog v-model="dialogoAlumnos" max-width="700" content-class="rounded-xl" scrollable>
            <asignar-alumnos 
                :grupo="grupo"
                :materia="materia"
                :prueba="prueba"
                v-if="dialogoAlumnos" 
                @closeModal="closeDialog($event,'dialogoAlumnos')">
            </asignar-alumnos>
        </v-dialog>

        <pre v-if="$App.debug">{{ $data }}</pre>

    </v-card>
    
</template>

<script>

import AppData from '@mixins/AppData';
import AsingnarPruebaForm from './AsingnarPruebaForm'
import AsignarAlumnos from './AsignarAlumnos'
export default {

    mixins:     [ AppData ],

     components:
    {
        'asignar-prueba-form' : AsingnarPruebaForm,
        'asignar-alumnos'     : AsignarAlumnos
    },

    created()
    {
        this.list()
    },

    computed:
    {
        docente()
        {
            return this.$store.getters['getDocente'];
        },
    },

    data() {
        return {
            grados:   [],
            grupos:   [],
            materias: [],
            pruebasPendientes:  [],
            pruebasAsignadas:   [],
            grado:   null,
            grupo:   null,
            materia: null,
            prueba:  null,
            headers: [
                { text: 'Prueba',     value: 'nb_prueba' },
                { text: 'Grupo',      value: 'grupo.nb_grupo' },
                { text: 'Materia',    value: 'materia.nb_materia' },
                { text: 'Evaluacion', value: 'evaluacion.tx_tema' },
                { text: 'Alumnos',    value: 'alumno' },
                { text: 'Acciones',   value: 'actions', sortable: false, filterable: false },
            ],
            validateForm:        false,
            dialogAsignarPrueba: false,
            dialogoAlumnos:      false
        }
    },

    methods:
    {
        list()
        {
           this.getResource( `grado/grupo/docente/${this.docente.id}`).then( data =>  this.grados = data )
        },

        getGrupos(grado)
        {
            this.grupos             = grado.grupo
            this.materia            = null
            this.pprueba            = null
            this.pruebasAsignadas   = []
            this.pruebasPendientes  = []
        },

        getMaterias(grupo)
        {
            this.materias           = []
            this.materia            = null
            this.prueba             = null
            this.pruebasAsignadas   = []
            this.pruebasPendientes  = []

            if(!this.grupo) return
            this.getResource( `materia/grupo/${grupo}/docente/${this.docente.id}`).then( data =>  this.materias = data )
        },

        getPruebas()
        {
            this.getPruebasPendientes()
            
            this.getPruebasAsignadas()
        },

        getPruebasAsignadas()
        {
            this.pruebasAsignadas = []

            if(!this.materia) return
            this.getResource( `prueba/docente/${this.docente.id}/grado/${this.grado.id}/materia/${this.materia}/asignada`)
            .then( data =>  this.pruebasAsignadas = data )
        },

        getPruebasPendientes()
        {
            this.pruebasPendientes = []

            if(!this.materia) return
            this.getResource( `prueba/docente/${this.docente.id}/grado/${this.grado.id}/materia/${this.materia}/pendiente`)
            .then( data =>  this.pruebasPendientes = data )  
        },

        asignarPrueba()
        {
            if(!this.prueba) {
                this.showError('Favor seleccionar una Prueba');
                return
            }
            this.dialogAsignarPrueba = true;
        },

        removerAsignacion(prueba)
        {
            let form = { id_usuario: this.idUser}
            this.updateResource(`prueba/remover/${prueba.id}`, form).then( data =>  {
                this.showMessage(data.msj);
                this.getPruebasAsignadas();
            })  
        },

        asignarAlumnos(prueba)
        {
            this.prueba         = prueba
            this.dialogoAlumnos = true
        },

        closeDialog(refresh, dialog)
        {
            this.prueba    = null
            this[dialog]   = false

            if(dialog == 'dialogAsignarPrueba') this.getPruebas();
            
            if(refresh)    this.getPruebasAsignadas()
        }
    }
}
</script>

<style>
</style>
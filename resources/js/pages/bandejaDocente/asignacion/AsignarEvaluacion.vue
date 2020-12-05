<template>

    

    <v-card :loading="loading" flat height="90vh" >

        <div class="deep-purple white--text" >

            <v-container>
            <v-row no-gutters>

                <v-col>
                    <v-row no-gutters justify="start">
                        <v-col class="text-capitalize">
                            <v-icon size="46" color="amber">{{tipo.tx_icono}}</v-icon>
                           <span class="headline py-1">{{tipo.nb_tipo_evaluacion}}</span> 
                        </v-col>
                    </v-row>
                </v-col>

                <v-col cols="auto" class="mt-2">
                   <v-btn icon dark><v-icon @click="$emit('closeDialog')">mdi-close-circle-outline</v-icon></v-btn>
                </v-col>

            </v-row>
            </v-container>
            
        </div>

        <v-card-text class="px-1">
        <v-form ref="form" v-model="valid" lazy-validation >
        <v-row no-gutters> 

            <v-col>

                <v-col cols="12">
                    <v-select
                        :items="materias"
                        item-text="nb_materia"
                        item-value="id"
                        v-model="form.id_materia"
                        :rules="[rules.select]"
                        label="Materia"
                        :loading="loading"
                        dense
                        @change="getEvaluaciones($event)"
                        hide-details
                        filled
                        color="deep-purple"
                    ></v-select>
                </v-col>

                <v-col class="pa-3">
                    <v-subheader class="text-capitalize deep-purple rounded-t-lg" dark >{{tipo.nb_tipo_evaluacion}}s</v-subheader>
                    <v-list dense class="evaluacion-container" subheader color="grey lighten-5 rounded-b-lg" v-if="tipo.tx_origen == 'prueba'">
                        <v-list-item-group v-model="prueba" color="info darken-3">
                            <v-list-item v-for="(prueba, i) in evaluaciones" :key="i" :value="prueba">
                                <template v-slot:default="{ active }" >
                                    <v-list-item-icon>
                                        <v-icon>{{tipo.tx_icono}}</v-icon>
                                    </v-list-item-icon>
                                    <v-list-item-content>
                                        <v-list-item-title>{{prueba.nb_prueba}}</v-list-item-title>
                                    </v-list-item-content>
                                    <v-list-item-action>
                                        <v-checkbox :input-value="active" :disabled="loading" color="deep-purple"></v-checkbox>
                                    </v-list-item-action>
                                </template>
                            </v-list-item>
                        </v-list-item-group>
                    </v-list>

                    <v-list dense class="evaluacion-container" subheader color="grey lighten-5 rounded-b-lg" v-else>
                        <v-list-item-group v-model="tarea" color="info darken-3">
                            <v-list-item v-for="(tarea, i) in evaluaciones" :key="i" :value="tarea">
                                <template v-slot:default="{ active }" >
                                    <v-list-item-icon>
                                        <v-icon>{{tipo.tx_icono}}</v-icon>
                                    </v-list-item-icon>
                                    <v-list-item-content>
                                        <v-list-item-title>{{tarea.nb_tarea}}</v-list-item-title>
                                    </v-list-item-content>
                                    <v-list-item-action>
                                        <v-checkbox :input-value="active" :disabled="loading" color="deep-purple"></v-checkbox>
                                    </v-list-item-action>
                                </template>
                            </v-list-item>
                        </v-list-item-group>
                    </v-list>
                </v-col>

                <v-row no-gutters class="">

                    <v-col >
                           
                            <v-dialog
                                v-model="pickers.fe_inicio"
                                persistent
                                width="580px"
                                content-class="rounded-xl"
                            >
                           
                                <template v-slot:activator="{ on }">

                                        <v-subheader>Desde:</v-subheader>
                                        <v-sheet
                                            color="deep-purple"
                                            class="rounded-lg pa-2 pointer mx-auto"
                                            elevation="1"
                                            width="180"
                                            v-ripple
                                            v-on="on"
                                        >
                                            <v-row no-gutters>
                                                <v-col>
                                                    <h3 class="white--text text-center text-uppercase">
                                                        {{ (form.fe_inicio) ? monthNameFromDate(form.fe_inicio): '--' }} 
                                                        {{ (form.fe_inicio) ? yearFromDate(form.fe_inicio): '--' }}
                                                    </h3> 
                                                </v-col>
                                            </v-row>
                                            <v-row no-gutters>
                                                <v-col>
                                                    <div class="display-3 white--text text-center">
                                                        {{ (form.fe_inicio) ? dayFromDate(form.fe_inicio): '--' }} 
                                                    </div>
                                                </v-col>
                                            </v-row>
                                            <v-row no-gutters>
                                                <v-col>
                                                    <h3 class="white--text text-center">
                                                        {{ dates.hh_inicio }} 
                                                    </h3> 
                                                </v-col>
                                            </v-row>
                                        </v-sheet>

                                </template>

                                <v-card color="info rounded-xl">
                                    <v-card-text>
                                    <v-row>
                                        <v-col cols="6">
                                            <v-date-picker 
                                                v-model="form.fe_inicio" 
                                                full-width
                                                color="info"
                                                @input="dates.fe_inicio = formatDate(form.fe_inicio)"
                                            ></v-date-picker>
                                        </v-col>
                                        <v-col cols="6">
                                            <v-time-picker
                                                scrollable
                                                v-model="form.hh_inicio"
                                                full-width
                                                color="info"
                                                @input="dates.hh_inicio = formatTime(form.hh_inicio)"
                                            ></v-time-picker>
                                        </v-col>
                                    </v-row>
                                    </v-card-text>
                                    <v-card-actions>
                                        <v-col>
                                            <v-btn
                                                dark
                                                block
                                                color="info darken-2"
                                                @click="pickers.fe_inicio= false"
                                                :disabled="!dates.fe_inicio || !dates.hh_inicio"
                                            >
                                                Aceptar
                                            </v-btn>
                                        </v-col>
                                    </v-card-actions>
                                </v-card>

                            </v-dialog>
                    </v-col>


                    <v-col >
                            <v-dialog
                                v-model="pickers.fe_fin"
                                persistent
                                width="580px"
                                content-class="rounded-xl"
                            >
                                <template v-slot:activator="{ on }">
                                    <v-subheader>Hasta:</v-subheader>
                                    <v-sheet
                                        color="deep-orange"
                                        class="rounded-lg pa-2 pointer mx-auto"
                                        elevation="1"
                                        width="180"
                                        v-ripple
                                        v-on="on"
                                    >
                                    <v-row no-gutters>
                                        <v-col>
                                            <h3 class="white--text text-center text-uppercase">
                                                {{ (form.fe_fin) ? monthNameFromDate(form.fe_fin): '--' }} 
                                                {{ (form.fe_fin) ? yearFromDate(form.fe_fin): '--' }}
                                            </h3> 
                                        </v-col>
                                    </v-row>
                                    <v-row no-gutters>
                                        <v-col>
                                            <div class="display-3 white--text text-center">
                                                {{ (form.fe_fin) ? dayFromDate(form.fe_fin): '--' }} 
                                            </div>
                                        </v-col>
                                    </v-row>
                                    <v-row no-gutters>
                                        <v-col>
                                            <h3 class="white--text text-center">
                                                {{ dates.hh_fin }} 
                                            </h3> 
                                        </v-col>
                                    </v-row>
                                    </v-sheet>
                                </template>

                                 <v-card color="info rounded-xl">
                                 <v-card-text>
                                        <v-row > 
                                            <v-col cols="6">
                                                <v-date-picker 
                                                    v-model="form.fe_fin" 
                                                    full-width
                                                    color="info"
                                                    @input="dates.fe_fin = formatDate(form.fe_fin)"
                                                ></v-date-picker>
                                            </v-col>
                                            <v-col cols="6">
                                                <v-time-picker
                                                    scrollable
                                                    v-model="form.hh_fin"
                                                    full-width
                                                    color="info"
                                                    @input="dates.hh_fin = formatTime(form.hh_fin)"
                                                ></v-time-picker>
                                            </v-col>
                                        </v-row>
                                    </v-card-text>
                                    <v-card-actions>
                                        <v-col>
                                            <v-btn
                                                dark
                                                block
                                                color="info darken-2"
                                                @click="pickers.fe_fin= false"
                                                :disabled="!dates.fe_fin || !dates.hh_fin"
                                            >
                                                Aceptar
                                            </v-btn>
                                        </v-col>
                                    </v-card-actions>
                                </v-card>

                            </v-dialog>

                    </v-col>

                    <v-col v-if="this.tipo.tx_origen != 'tarea' ">
                        <v-dialog
                            v-model="pickers.minutos"
                            width="580px"
                            content-class="rounded-xl"
                        >
                            <template v-slot:activator="{ on }">
                            <v-subheader>Tiempo Ejecucion</v-subheader>
                            <v-sheet
                                color="info"
                                class="rounded-lg pa-2 pointer mx-auto"
                                elevation="1"
                                width="180"
                                v-ripple
                                v-on="on"
                            >
                            <v-row no-gutters>
                                <v-col class="mb-2">
                                    <h3 class="white--text text-center text-uppercase">minutos:</h3> 
                                </v-col>
                            </v-row>
                            <v-row no-gutters>
                                <v-col>
                                    <div class="display-3 white--text text-center mb-3">
                                        {{form.nu_minutos}}
                                    </div>
                                </v-col>
                            </v-row>
                            </v-sheet>
                            </template>
                            <v-card class="rounded-xl info pt-5">
                                <v-card-text>
                                    <v-select
                                        :items="selectMinutos"
                                        v-model="form.nu_minutos"
                                        :rules="[rules.select]"
                                        label="Tiempo de ejecucion"
                                        :hint=" ((form.nu_minutos) ? form.nu_minutos : 0) + ' Minutos'"
                                        persistent-hint
                                        :loading="loading"
                                        dark
                                    ></v-select>
                                </v-card-text>
                                <v-card-actions>
                                    <v-col>
                                        <v-btn
                                            dark
                                            block
                                            color="info darken-2"
                                            @click="pickers.minutos= false"
                                            :disabled="form.nu_minutos < 1"
                                        >
                                            Aceptar
                                        </v-btn>
                                    </v-col>
                                </v-card-actions>
                            </v-card>
                        </v-dialog>
                    </v-col>

                </v-row>
            </v-col>

            <v-col class="pa-3">
                <v-toolbar color="grey lighten-4 subtitle-2 rounded-t-lg" flat dense>
                    <v-icon color="orange" class="mr-1">mdi-account-plus</v-icon>
                    <div class="indigo--text">Asignar Alumnos</div> 
                    <v-spacer></v-spacer>
                    <v-checkbox label="Todos" v-model="isSelectAll" :disabled="loading" class="mt-5"></v-checkbox>
                </v-toolbar>
                <v-list subheader dense width="100%" class="alumno-selector  rounded-b-lg py-n1" color="grey lighten-5" > 
                    <v-list-item-group v-model="form.alumnos" multiple color="info darken-3" >
                    <v-list-item v-for="(alumno, idx) in alumnos" :key="idx" :value="alumno.id">
                        <template v-slot:default="{ active }" >
                            <v-list-item-avatar>
                                <v-icon color="indigo" size="36">mdi-school</v-icon>
                            </v-list-item-avatar>
                            <v-list-item-content>
                                <v-list-item-title v-text="alumno.nb_alumno"></v-list-item-title>
                                <v-list-item-subtitle v-text="alumno.tx_documento"></v-list-item-subtitle>
                            </v-list-item-content>
                            <v-list-item-action>
                            <v-checkbox :input-value="active" :disabled="loading" ></v-checkbox>
                            </v-list-item-action>
                        </template>
                    </v-list-item>
                    </v-list-item-group>
                </v-list>
                
            </v-col>
         
        </v-row>
        </v-form>
        </v-card-text>

        <v-card-actions>
            <v-spacer></v-spacer>
             <form-buttons
                @store="store()"
                @cancel="$emit('closeDialog')"
                action="ins"
                :valid="valid"
                :loading="loading"
            ></form-buttons> 
        </v-card-actions>

        <pre v-if="$App.debug">{{ $data }}</pre>


    </v-card>
    
    

</template>

<script>

import DataHelper  from '@mixins/AppData';
import AppCalendar from './AppCalendar'
export default {

    components: {
        'app-calendar':       AppCalendar,
    },

    mixins:     [ DataHelper ],

    props: {

        grupo: {
            type: Object,
            default: () => {}
        },

        dia: {
            type: Object,
            default: () => {}
        },

        tipo:{
            type: Object,
            default: null
        }
    },
    
    computed:
    {
        docente()
        {
            return this.$store.getters['getDocente'];
        },

        isSelectAll:
        {
            get() {
                return this.alumnos.length == this.form.alumnos.length
            },

            set(isAll) {
                this.selectAll(!isAll)
            }
        },

    },

    created()
    {
       this.list()
    },

    mounted()
    {
       this.form.fe_inicio = this.dia.date
       this.form.fe_fin    = this.dia.date
       this.form.hh_inicio = '00:00'
       this.form.hh_fin    = '23:59'
       this.dates.fe_inicio = this.formatDate(this.dia.date)
       this.dates.fe_fin    = this.formatDate(this.dia.date)
       this.dates.hh_inicio = this.formatTime('00:00')
       this.dates.hh_fin    = this.formatTime('23:59')

       this.form.id_grupo   = this.grupo.id
       this.form.id_tipo_evaluacion = this.tipo.id
       this.form.tx_origen  = this.tipo.tx_origen
    },

    data() {
        return {
            dates:
            {
                fe_inicio: null,
                fe_fin:    null,
                hh_inicio: null,
                hh_fin:    null
            },
            pickers:
            {
                fe_inicio: false,
                fe_fin:    false,
                minutos:   false
            },
            form:{
                id:         null,
                fe_inicio:  false,
                fe_fin:     false,
                hh_inicio:  false,
                hh_fin:     false,
                nu_minutos: 0,
                alumnos:    [],
                id_grupo: 	        null,
				id_tipo_evaluacion: null,
                id_materia: 	    null,
                id_tema: 	        null,
				id_origen: 	        null,
				tx_origen: 	        null,
				tx_observaciones: 	null,
				id_status: 	        null,
				id_usuario: 	    null,
            },
            default: {
                id_status: 1
            },
            prueba:        null,
            tarea:        null,
            materias:      [],
            evaluaciones:  [],
            alumnos:       [],
        }
    },

    methods:
    {
        list()
        {
            this.getResource( `materia/grupo/${this.grupo.id}/docente/${this.docente.id}` ).then( data =>  this.materias = data)
            this.getResource( `alumno/grupo/${this.grupo.id}` ).then( data => {
                this.alumnos = data 
                this.selectAll()
            })
        },

        getEvaluaciones(materia)
        {
            this.evaluaciones = []

            this.getResource( `${this.tipo.tx_origen}/grado/${this.grupo.grado.id}/materia/${materia}` )
                            .then( data =>  this.evaluaciones = data)
        },

        selectAll(isSelectAll)
        {
            this.form.alumnos = []
            if(!isSelectAll) {
                for (const alumno of this.alumnos) {
                    this.form.alumnos.push(alumno.id)
                }
            }
        },

        store()
        {
           console.log(this.prueba, this.tarea)
            if(this.prueba){ 
                this.form.id_origen = this.prueba.id
                this.form.id_tema   = this.prueba.id_tema
            }

            if(this.tarea){ 
                this.form.id_origen = this.tarea.id
                this.form.id_tema   = this.tarea.id_tema
            }
            
            if(!this.validate()) return
            
            this.storeResource('evaluacion', this.form).then( data =>{
                this.showMessage(data.msj)
                this.$emit('closeDialog', true)
            })
            
        },

        validate()
        {
            console.log(this.form)
            
            if( !this.form.fe_inicio ){
                this.showError('Favor seleccionar fecha Desde')
                return false
            }

            if( !this.form.fe_fin ){
                this.showError('Favor seleccionar fecha Hasta')
                return false
            }

            if( this.form.alumnos.length < 1 ){
                this.showError('Favor Asignar alumnos')
                return false
            }

            if( !this.form.id_origen ){
                this.showError(`Favor Asignar ${this.tipo.nb_tipo_evaluacion}`)
                return false
            }

            if( this.form.nu_minutos < 1 ){

                if(this.tipo.tx_origen == 'tarea')
                {
                    this.form.nu_minutos = 0
                } else
                {
                    this.showError(`Favor Asignar tiempo de ejecucion de ${this.tipo.nb_tipo_evaluacion}`)
                    return false
                }
            }

            return true
        }
    }
}
    

</script>

<style scoped>
.evaluacion-container{
    height: 130px;
    overflow-y: auto;
}
.alumno-selector{
    height: 57vh;
    overflow-y: auto;
}
</style>
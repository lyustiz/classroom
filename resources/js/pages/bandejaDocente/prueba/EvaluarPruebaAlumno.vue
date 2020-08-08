<template>

    <v-card flat height="80vh">

        <v-card-title class="pa-0">
            <app-simple-toolbar title="Asignar Alumnos" @closeModal="$emit('closeModal', true)"></app-simple-toolbar>
        </v-card-title>

        <v-card-title dense class="pa-0">
            <v-toolbar color="grey lighten-4 subtitle-2" flat>
                <v-icon color="orange" class="mr-1">mdi-account-plus</v-icon>
                <div class="indigo--text">{{ alumnosSelected }}</div> 
                <v-spacer></v-spacer>
                <v-checkbox label="Todos" :value="isSelectAll" :disabled="loading" class="mt-5" @click.stop="setAll(isSelectAll)"></v-checkbox>
            </v-toolbar>
        </v-card-title>

        <v-card-text>
        <v-row justify="center" no-gutters>
        <v-col cols="12" class="pt-3">

            <v-list subheader dense width="100%"> 

                <v-list-item-group v-model="alumnosSelected" multiple >
                <v-list-item v-for="(alumno, idx) in alumnos" :key="idx" :value="alumno.id" @click.stop="asignacionAlumno(alumno)" :hasMateria="hasPrueba(alumno)">

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
        </v-card-text>

        <pre v-if="$App.debug">{{ $data }}</pre>

    </v-card>
    
</template>

<script>

import AppData from '@mixins/AppData';

export default {

    mixins:     [ AppData ],

    props: 
    {
        prueba: {
            type: Object,
            default: () =>{}
        },
    },

    created()
    {
        this.list()
        this.form.id_prueba  = this.prueba.id
        this.form.id_usuario = this.idUser
    },

    computed:
    {
        isSelectAll()
        {
            return (this.alumnos.length > 0) ?  this.alumnos.length == this.alumnosSelected.length : false;
        }
    },

    data() {
        return {
            alumnos:         [],
            alumnosSelected: [],

            form:
            {
                id_prueba_alumno: [],
                id_prueba: 	      [],
                id_alumnos:       null,
				id_usuario:       null,
            },
        }
    },

    methods:
    {

        list()
        {
            this.getResource( `alumno/prueba/${this.prueba.id}/grupo/${this.grupo}/materia/${this.materia}`)
            .then( data =>  this.alumnos = data )
        },

        setAll(isSelectedAll)
        {
            if(isSelectedAll)
            {
                let pruebasAlumno = [];
                for (const alumno of this.alumnos) {
                    if(alumno.prueba_alumno.length > 0){
                        pruebasAlumno.push(alumno.prueba_alumno[0].id);
                    }
                }
                this.alumnosSelected = []
                this.delete(pruebasAlumno);

            } else{
                
                let idAlumnos = []
                for (const alumno of this.alumnos) {
                    if(!this.alumnosSelected.includes(alumno.id) ) {
                        idAlumnos.push(alumno.id);
                    }
                }
                this.alumnosSelected = idAlumnos
                this.store(idAlumnos)
            }
        },

        hasPrueba(alumno)
        {
            let hasMateria = (alumno.prueba_alumno.length > 0) 
            
            if( hasMateria && !this.alumnosSelected.includes(alumno.id)) 
            {  
                this.alumnosSelected.push(alumno.id);   
            }
            return hasMateria
        },

        asignacionAlumno( alumno)
        {
            if( this.hasPrueba(alumno) )
            {
                this.delete([alumno.prueba_alumno[0].id])
            }else
            {
                this.store([alumno.id])
            } 
        },

        store(alumnos)
        {
            this.form.id_alumnos = alumnos
            
            this.storeResource(`pruebaAlumno`, this.form).then( (data) =>  
            {
                this.showMessage(data.msj);
                this.alumnosSelected.concat(alumnos);
                
            })
        },

        delete(pruebasAlumno)
        {
            this.form.id_prueba_alumno = pruebasAlumno

            this.deleteResource(`pruebaAlumno/0`, this.form).then( (data) =>  
            {
                this.showMessage(data.msj);
                this.list();
            })  
        },

        preFormActions(action)
        {
            this.loading = true;
        },
    }
}
</script>

<style>
</style>
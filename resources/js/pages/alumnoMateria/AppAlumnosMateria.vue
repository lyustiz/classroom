<template>

    <v-form ref="form" v-model="valid" lazy-validation>

    <v-card :loading="loading" flat>

        <app-simple-toolbar title="Asignar Materia a Alumnos" @closeModal="$emit('closeModal')"></app-simple-toolbar>

        <v-card-text>

        <v-row>
                  
        <v-col cols="12" md="6">
            <v-select
            :items="selects.grado"
            item-text="nb_grado"
            item-value="id"
            :rules="[rules.select]"
            label="Seleccione Grado"
            :loading="loading"
            dense
            return-object
            @change="getGrupo($event)"
            ></v-select>
        </v-col>
                  
        <v-col cols="12" md="6">
            <v-select
            :items="selects.grupo"
            item-text="nb_grupo"
            item-value="id"
            :rules="[rules.select]"
            label="Seleccione Grupo"
            :loading="loading"
            dense
            return-object
            @change="getMateria($event)"
            :disabled="selects.grupo.length < 1"
            ></v-select>
        </v-col>

        <v-col cols="12" md="6">
            <v-select
            :items="selects.materia"
            item-text="nb_materia"
            item-value="id"
            v-model="form.id_materia"
            :rules="[rules.select]"
            label="Seleccione Materia"
            :loading="loading"
            dense
            :disabled="selects.materia.length < 1"
            @change="getAlumnos($event)"
            ></v-select>
        </v-col>

        <v-checkbox label="Todos" v-model="isSelectAll" @click.stop="selectAll(isSelectAll)" :disabled="loading">
        </v-checkbox>
        
        </v-row>

        <v-row class="list-alumnos rounded-xl mx-1" v-if="form.id_materia">
           
           <v-list subheader dense width="100%"> 

                <v-list-item-group v-model="alumnosSelected" multiple >
                
                <v-list-item 
                    v-for="(alumno, idx) in alumnos" :key="idx" 
                    :value="alumno.id" @click.stop="editAlumno(alumno, idx)"
                    :hasMateria="hasMateria(alumno.id, alumno.alumno_materia)"
                    > 

                    <template v-slot:default="{ active }" >

                        <v-list-item-avatar>
                            <v-img :src="alumno.foto.full_url" v-if="alumno.foto"></v-img>
                            <v-icon v-else color="indigo" size="42">mdi-account-circle</v-icon>
                        </v-list-item-avatar>

                        <v-list-item-content>
                            <v-list-item-title v-text="alumno.nb_alumno"></v-list-item-title>
                            <v-list-item-subtitle v-text="alumno.tx_documento"></v-list-item-subtitle>
                        </v-list-item-content>

                        <v-list-item-avatar :color="(alumno.matricula.id_tipo_condicion == 1) ? 'green' : 'amber' " size="30">
                            <span class="white--text">{{ (alumno.matricula.id_tipo_condicion == 1) ? 'Reg' : 'Rep' }}</span>
                        </v-list-item-avatar>

                        <v-list-item-action>
                        <v-checkbox :input-value="active" :disabled="loading" ></v-checkbox>
                        </v-list-item-action>

                    </template>

                </v-list-item>

                </v-list-item-group>

            </v-list>

        </v-row>
         
        </v-card-text>

        <pre v-if="$App.debug">{{ $data }}</pre>

    </v-card>
    
    </v-form>

</template>

<script>

import AppData from '@mixins/AppData';

export default {

    mixins: [ AppData ],

    created()
    {
        this.default.id_calendario = this.$store.getters.getCalendarioId
        this.list()
    },

    data() {
        return {
            resource: 'grado/MateriaAlumno',
            pickers:
            {
                fe_matricula: 	 null,
            },
            form:
            {
                id:               null,
                id_alumno:        null,
                id_alumnos:       [],
                id_calendario:    null,
                id_grado: 	      null,
				id_materia: 	  null,
				tx_observaciones: null,
				id_status: 	      null,
				id_usuario: 	  null,
            },
            default:
            {
                id_status:     1,
                id_calendario: null
            },
            selects:
            {
                grado: 	       [],
                grupo: 	       [],
                materia: 	   [],
            },
            alumnos:           [],
            alumnosSelected:   [],
            isSelectAll:       false
        }
    },

    methods:
    {
        list()
        {
            this.getResource( this.resource ).then( data =>  this.selects.grado = data)
        },

        getGrupo(grado)
        {
            this.alumnos = []
            this.form.id_grado = grado.id
            this.selects.grupo = (grado.grupo) ?  grado.grupo : []
        },

        getMateria(grupo)
        {
           this.alumnos = []
           this.form.id_materia = null
           this.form.id_grupo = grupo.id
           this.selects.materia = (grupo.materia) ? grupo.materia : []
           this.alumnos = (grupo.alumno) ? grupo.alumno : []
        },

        getAlumnos()
        {
            this.alumnosSelected = []
        },

        hasMateria(alumno, materias)
        {
            let hasMateria = (materias.length > 0) ? materias.some(materia => materia.id_materia == this.form.id_materia): false
            
            if( hasMateria && !this.alumnosSelected.includes(alumno)) 
            {  
                this.alumnosSelected.push(alumno);   
            }

            this.isSelectAll = (this.alumnos.length == this.alumnosSelected.length) ? true : false;
            
            return hasMateria
        },

        selectAll(isAllAlumnos)
        {
            let idAlumnos = []

           
            if(!isAllAlumnos)
            {
                this.alumnos.forEach(alumno => {
                    idAlumnos.push(alumno.id)
                }); 
            }

            this.storeAll(idAlumnos, !isAllAlumnos)
        },

        editAlumno(alumno, idx)
        {
            if(this.loading) return

            let isAssigned = this.alumnosSelected.includes(alumno.id)

            if(isAssigned) {

                let alumnoMateria = alumno.alumno_materia.find( materia => materia.id_materia == this.form.id_materia);

                this.delete(alumnoMateria, idx)

            } else {
                
                this.store(alumno, idx); 
            } 
           
        },

        store(alumno, idx)
        {
            if(!this.form.id_materia) return
            this.form.id_alumno = alumno.id
            this.storeResource(`alumnoMateria`, this.form).then( (data) =>  
            {
                this.showMessage(data.msj);
                this.addAlumno(data.alumnoMateria, idx);
            })
        },

        delete(alumnoMateria, idx)
        {
            if(!this.form.id_materia) return
            this.deleteResource(`alumnoMateria/${alumnoMateria.id}`).then( (data) =>  
            {
                this.showMessage(data.msj);
                this.deleteAlumno(alumnoMateria, idx);
            })
        },

        storeAll(idAlumnos, isAllAlumnos)
        {
            if(this.loading) return
            let currentAlumnos   = this.alumnosSelected
            this.form.id_alumnos = idAlumnos
            
            this.storeResource(`alumnoMateria/storeAll`, this.form).then( (data) =>  
            {
                this.showMessage(data.msj)
                this.setAllAlumnos(data.alumnoMateria)
                this.isSelectAll = isAllAlumnos
            })
            .catch(error => 
            {
                this.alumnosSelected = currentAlumnos
                this.isSelectAll = !isAllAlumnos
            })
        },

        setAllAlumnos(alumnoMateria)
        {
            if(alumnoMateria.length > 0)
            {
                alumnoMateria.forEach( (item, idx) => {
                     this.alumnos[idx].alumno_materia.push( item)
                }, this);

            } else {

                 this.alumnos.forEach( (item, idx) => {

                    this.alumnos[idx].alumno_materia = this.alumnos[idx].alumno_materia.filter(materia => materia.id_materia != this.form.id_materia)
                     
                }, this);

                this.alumnosSelected = []
            }
        },

        deleteAlumno(alumnoMateria, idx)
        {
            this.alumnos[idx].alumno_materia = this.alumnos[idx].alumno_materia.filter(materia => materia.id != alumnoMateria.id)
            this.alumnosSelected = this.alumnosSelected.filter(ids => ids != alumnoMateria.id_alumno)
        },

        addAlumno(alumnoMateria, idx)
        {
            this.alumnos[idx].alumno_materia.push(alumnoMateria) 
        }
    }
}
</script>

<style scoped>

.list-alumnos{
    max-height: 61vh !important;
    overflow-y: auto;
}
</style>
<template>

    <v-form ref="form" v-model="valid" lazy-validation>
    
   

    <v-card :loading="loading" flat class="rounded-xl">

        <app-simple-toolbar title="Asignar Materia" @closeModal="$emit('closeModal')"></app-simple-toolbar>

        <v-card-text>

        <v-row no-gutters>

        <v-col cols="12" md="12">
           <v-autocomplete
                v-model="form.id_materia"
                :items="selects.materia"
                item-text="nb_materia"
                item-value="id"
                rounded
                filled
                label="Materias"
                :disabled="loading"
                :loading="loading"
                autofocus
                dense
                return-object
                @change="addMateria($event)">
          </v-autocomplete>
        </v-col>

        <v-col>

        <v-list subheader>
        <v-subheader>Materias</v-subheader>

            <v-list-item
                v-for="materia in materias"
                :key="materia.id"
            >
                <v-list-item-avatar>
                    <v-avatar color="info white--text" >{{ materia.nb_materia | initLeter }}</v-avatar>
                </v-list-item-avatar>

                <v-list-item-content>
                <v-list-item-title v-text="materia.nb_materia"></v-list-item-title>
                </v-list-item-content>

                <v-list-item-action>
                    <v-btn small class="grey lighten-4" icon @click="deleteMateria(materia)">
                        <v-icon color="red">mdi-delete</v-icon>
                    </v-btn>
                </v-list-item-action>
            </v-list-item>

        </v-list>

        </v-col>
          
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
    props:
    {
        idAlumno: {
            type:       Number,
            default:    null
        },

        idGrado: {
            type:       Number,
            default:    null
        },
    },
    created()
    {
        this.list();
        this.default.id_alumno     = this.idAlumno
        this.default.id_calendario = this.$store.getters.getCalendarioId
        this.default.id_grado      = this.idGrado
    },
    data() {
        return {
            resource: 'alumnoMateria',
            materias: [],
            form:
            {
                id: 	          null,
				id_calendario:    null,
                id_alumno:        null,
                id_grado: 	      null,
				id_materia: 	  null,
				tx_observaciones: null,
				id_status: 	      null,
				id_usuario: 	  null,
            },
            selects:
            {
	 	 	 	materia: 	 [],
            },
            default: 
            {
                id_status:     1,
                id_alumno:     null,
                id_calendario: null,
                id_grado:      null
            }
        }
    },

    methods:
    {
        list()
        {
            this.materias = []

            let resource  = `alumnoMateria/alumno/${this.idAlumno}/grado/${this.idGrado}`

            this.getResource( resource ).then( data =>  {
                this.materias = data.alumnoMateria
                this.selects.materia = data.materia
            })
        },

        addMateria(materia)
        {
            this.form.id_materia = materia.id

            this.storeResource(this.resource, this.form).then( (data) =>  
            {
                this.showMessage(data.msj)
                
                this.selects.materia = this.selects.materia.filter( (materias) => materias.id != materia.id)

                this.materias.push({ 
                    id: data.alumnoMateria.id , 
                    id_materia: data.alumnoMateria.id_materia,
                    nb_materia: data.alumnoMateria.materia.nb_materia 
                })
                
                this.form.id_materia = null;
            })
        },

        deleteMateria(item)
        {
            let resourceId  = 'alumnoMateria/' + item.id

            this.deleteResource(resourceId).then( (data) =>  
            {
                this.showMessage(data.msj)

                this.materias = this.materias.filter( (materia) => materia.id != item.id)

                this.selects.materia.push({ 
                    id: item.id_materia , 
                    nb_materia: item.nb_materia
                })
            })
        }

    }
}
</script>

<style>
</style>
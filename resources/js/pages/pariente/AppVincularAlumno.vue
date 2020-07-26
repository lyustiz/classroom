<template>
    
        <v-card>

        <app-simple-toolbar title="Vincular Alumno" @closeModal="$emit('closeModal', false)"></app-simple-toolbar> 
        
        <v-card-text>

            <v-form ref="form" v-model="valid" lazy-validation>

            <v-autocomplete
                v-model="select"
                :items="items"
                :loading="loading"
                :search-input.sync="search"
                :hide-no-data="false"
                :hide-selected="false"
                item-text="nb_alumno"
                item-value="id"
                label="Alumnos"
                placeholder="Indique el Nombre del Alumno"
                hint="Indique al menos 3 caracteres"
                persistent-hint
                prepend-icon="mdi-school"
                return-object
                @change="vincular($event)"
                :disabled="disabled"
            ></v-autocomplete>

            </v-form>

            <v-list subheader dense width="100%"> 

                <v-list-item-group >
                
                <v-list-item v-for="(alumno, idx) in alumnos" :key="idx"> 

                    <v-list-item-avatar>
                        <v-img :src="alumno.foto.full_url" v-if="alumno.foto"></v-img>
                        <v-icon v-else color="indigo" size="42">mdi-account-circle</v-icon>
                    </v-list-item-avatar>

                    <v-list-item-content>
                        <v-list-item-title v-text="alumno.nb_alumno"></v-list-item-title>
                        <v-list-item-subtitle v-text="alumno.tx_documento"></v-list-item-subtitle>
                    </v-list-item-content>

                    <v-list-item-action>

                        <v-tooltip bottom>
                            <template v-slot:activator="{ on }">
                                <v-btn v-on="on" fab x-small dark color="red" depressed @click="desvincularAlumno(alumno)" :loading="loading">
                                    <v-icon>mdi-link-variant-off</v-icon>
                                </v-btn>
                            </template>
                            Desvincular Alumno
                        </v-tooltip>
                        
                    </v-list-item-action>

                </v-list-item>

                </v-list-item-group>

            </v-list>

            
        </v-card-text>
       
        </v-card>

</template>

<script>

import AppData from '@mixins/AppData';
export default {

    mixins:     [ AppData],

    props:
    {
        pariente: {
            type: Object,
            default: () => {}
        },
    },

    created()
    {
        this.list()
    },

    watch:
    {
        search(val)
        {
            val && val.length > 2 && val !== this.select && !this.loading  && this.searchAlumnos()
        }
    },

    data: () => ({
        select:     [],
        search:     null,
        disabled:   false,
        form:       {},
        alumnos:    []
    }),

    methods:
    {
       
        list()
        {
            this.getResource( `alumno/pariente/${this.pariente.id}` ).then( data => this.alumnos = data )
        },
       
       searchAlumnos()
       {
            this.items    = [];

             let data = {
                id_pariente: this.pariente.id,
                tx_search: this.search
            }
            
            this.loading = true
            
            axios.post( `${this.apiUrl}alumno/asignacion/search`, data)
            .then(response => 
            {
                this.items = response.data
            })
            .catch(error => 
            {
                this.showError(error)
            })
            .finally( () => 
            {
                this.loading = false
            });
       },

       vincular(alumno){

            this.disabled = true

            this.form = {
				id_alumno: 	      alumno.id,
				id_pariente: 	  this.pariente.id,
				bo_acudiente: 	  true,
				tx_observaciones: null,
				id_status: 	      1,
				id_usuario: 	  this.idUser,
            }

            this.storeResource( 'alumnoPariente', this.form ).then( (data) =>  
            {
                this.showMessage(data.msj)
                this.list()
                this.disabled = false
                this.search   = null
                this.items    = []
                this.$emit('onUpdate')
            })
       },

       desvincularAlumno(alumno)
       {
            console.log(alumno)
            
            this.deleteResource(`pariente/${this.pariente.id}/alumno/${alumno.id}`).then( (data) =>
            {   
                this.showMessage(data.msj)
                this.list()
                this.$emit('onUpdate')
            })
       }

       
    }
}
</script>

<style>
</style>

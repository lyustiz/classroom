<template>
  
    <v-form ref="form" v-model="valid" lazy-validation>

    <v-card :loading="loading" flat class="rounded-xl">

        <app-simple-toolbar title="Asignar Grado" @closeModal="$emit('closeDialog')"></app-simple-toolbar>

        <v-card-text>

        <v-row no-gutters>

        <v-col cols="12" md="12">
           <v-autocomplete
                v-model="form.id_grado"
                :items="selects.grado"
                item-text="nb_grado"
                item-value="id"
                outlined
                label="Seleccione Grado"
                :disabled="loading"
                :loading="loading"
                autofocus
                dense
                @change="addGrado($event)">
          </v-autocomplete>
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
        alumno: {
            type:       Object,
            default:    null
        },
    },
    created()
    {
        this.list();

        if( this.alumno.grado.length > 0 )
        {
            this.form.id_grado  = this.alumno.grado[0].id 
            this.form.id        = this.alumno.grado[0].pivot.id
            this.action         = 'upd'
        }
        
        this.form.id_alumno = this.alumno.id
    },
    data() {
        return {

            action: 'ins',
            form:
            {
                id: 	          null,
				id_grado: 	      null,
				id_alumno: 	      null,
				tx_observaciones: null,
				id_status: 	      null,
				id_usuario: 	  null,
            },
            selects:
            {
	 	 	 	grado: 	 [],
            },
            default: 
            {
                id_status: 1,
            }
        }
    },

    methods:
    {
        list()
        {
            this.getResource( 'grado/list' ).then( data =>  this.selects.grado = data)
        },

        addGrado()
        {
            (this.action == 'ins') ? this.insGrado() : this.updGrado() 
        },

        insGrado()
        {
            this.storeResource('gradoAlumno', this.form).then( (data) =>  
            {
                this.showMessage(data.msj)
                this.$emit('closeDialog', 'refresh')
            })
        },

        updGrado()
        {
            this.updateResource('gradoAlumno/'+this.form.id, this.form).then( (data) =>  
            {
                this.showMessage(data.msj)
                this.$emit('closeDialog', 'refresh')
            })
        }
    }
}
</script>

<style>
</style>
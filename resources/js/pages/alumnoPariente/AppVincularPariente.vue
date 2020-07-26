<template>
    
        <v-card>

        <app-simple-toolbar title="Vincular Pariente" @closeModal="$emit('closeModal', false)"></app-simple-toolbar> 
        
        <v-card-text>

            <v-form ref="form" v-model="valid" lazy-validation>

            <v-autocomplete
                v-model="select"
                :items="items"
                :loading="loading"
                :search-input.sync="search"
                :hide-no-data="false"
                :hide-selected="false"
                item-text="nb_pariente"
                item-value="id"
                label="Parientes"
                placeholder="Indique el Nombre del Pariente"
                hint="Indique al menos 3 caracteres"
                persistent-hint
                prepend-icon="mdi-human-male-child"
                return-object
                @change="vincular($event)"
                :disabled="disabled"
            ></v-autocomplete>

            </v-form>
            
        </v-card-text>
       
        </v-card>

</template>

<script>

import AppData from '@mixins/AppData';
export default {

    mixins:     [ AppData],

    props:
    {
        alumno: {
            type: Object,
            default: () => {}
        },
    },

    watch:
    {
        search(val)
        {
            val && val.length > 2 && val !== this.select && !this.loading  && this.list(val)
        }
    },

    data: () => ({
        select:     [],
        search:     null,
        disabled:   false,
        form:       {}
    }),

    methods:
    {
       list()
       {
            this.items    = [];

            let resource  = `pariente/asignacion/search`

            let data = {
                id_alumno: this.alumno.id,
                tx_search: this.search
            }
            
            this.loading = true
            
            axios.post(this.apiUrl + resource, data)
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

       vincular(pariente){

            this.disabled = true

            this.form = {
				id_alumno: 	      this.alumno.id,
				id_pariente: 	  pariente.id,
				bo_acudiente: 	  true,
				tx_observaciones: null,
				id_status: 	      1,
				id_usuario: 	  this.idUser,
            }

            this.storeResource( 'alumnoPariente', this.form ).then( (data) =>  
            {
                this.showMessage(data.msj)
                this.$emit('closeModal', true)
            })
       }
       
       
    }
}
</script>

<style>
</style>

<template>

    <v-form ref="form" v-model="valid" lazy-validation>

    <v-card :loading="loading" flat >

        <v-card-text>

        <v-row>

                         
        <v-col cols="12" md="6">
            <v-select
            :items="selects.grado"
            item-text="nb_grado"
            item-value="id"
            v-model="form.id_grado"
            :rules="[rules.select]"
            label="Grado"
            :loading="loading"
            dense
            ></v-select>
        </v-col>
                  
        <v-col cols="12" md="6">
            <v-select
            :items="selects.alumno"
            item-text="nb_alumno"
            item-value="id"
            v-model="form.id_alumno"
            :rules="[rules.select]"
            label="Alumno"
            :loading="loading"
            dense
            ></v-select>
        </v-col>
          
        <v-col cols="12" md="6">
            <v-text-field
                :rules="[rules.max(100)]"
                v-model="form.tx_observaciones"
                label="Observaciones"
                placeholder="Indique Observaciones"
                dense
            ></v-text-field>
        </v-col>
                          
        <v-col cols="12" md="6">
            <v-select
            :items="selects.status"
            item-text="nb_status"
            item-value="id"
            v-model="form.id_status"
            :rules="[rules.select]"
            label="Status"
            :loading="loading"
            dense
            ></v-select>
        </v-col>
         

        </v-row>

        </v-card-text>

        <v-card-actions>
            <v-spacer></v-spacer>
            <form-buttons
                @update="update()"
                @store="store()"
                @clear="clear()"
                @cancel="cancel()"
                :action="action"
                :valid="valid"
                :loading="loading"
            ></form-buttons>
        </v-card-actions>

        <pre v-if="$App.debug">{{ $data }}</pre>

    </v-card>
    
    </v-form>

</template>

<script>

import Appform from '@mixins/Appform';

export default {
    mixins: [Appform],
    data() {
        return {
            resource: 'gradoAlumno',
            dates:
            {
                
            },
            pickers:
            {
                
            },
            form:
            {
                id: 	          null,
				id_grado_alumno:  null,
				id_alumno: 	      null,
				tx_observaciones: null,
				id_status: 	      null,
				id_usuario: 	  null,
            },
            selects:
            {
                grado: 	      [],
	 	 	 	alumno: 	 ['/sinGrado'],
	 	 	 	status: 	     ['/grupo/GRAL'],
            },
        }
    },

    methods:
    {

        postResponse()
        {
           this.loading = true

           axios.get(this.$App.apiUrl + 'alumno/sinGrado')
           .then(   (response) => this.selects.alumno = response.data)
           .catch(  (error)    => this.showError(error))
           .finally( ()        => this.loading = false)
        },

    }
}
</script>

<style>
</style>
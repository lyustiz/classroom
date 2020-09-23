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
            :items="selects.areaEstudio"
            item-text="nb_area_estudio"
            item-value="id"
            v-model="areaEstudio"
            :rules="[rules.select]"
            label="Area Estudio"
            @input="getMaterias()"
            :loading="loading"
            dense
            ></v-select>
        </v-col>
                  
        <v-col cols="12" md="6">
            <v-select
            :items="materias"
            item-text="nb_materia"
            item-value="id"
            v-model="form.id_materia"
            :rules="[rules.select]"
            label="Materia"
            :loading="loading || materiasLoading"
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
            resource: 'gradoMateria',

            areaEstudio: null,
            materias:    [],
            dates:
            {
                
            },
            pickers:
            {
                
            },
            form:
            {
                id: 	          null,
				id_grado: 	      null,
				id_materia: 	  null,
				id_calendario: 	  null,
				tx_observaciones: null,
				id_status: 	      null,
				id_usuario: 	  null,
            },
            selects:
            {
                areaEstudio: [],
                grado: 	     [],
	 	 	 	calendario:  [],
	 	 	 	status: 	     ['/grupo/GRAL'],
            },
        }
    },

    methods:
    {
        getMaterias(){

            this.materias = [];
            this.materiasLoading  = true;

            axios.get(this.$App.apiUrl + 'materia/areaEstudio/' + this.areaEstudio)
			.then( response =>
			{
                this.materias = response.data;
                this.materiasLoading = false;

			})
            .catch( error =>
            {
              console.log(error)
            })
        },
    }
}
</script>

<style>
</style>
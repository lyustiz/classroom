<template>

    <v-form ref="form" v-model="valid" lazy-validation>

    <v-card :loading="loading" flat>

        <v-card-text>

        <v-row>

                 
        <v-col cols="12" >
            <v-text-field
                :rules="[rules.required]"
                v-model="form.nb_libro"
                label="Libro"
                placeholder="Indique Libro"
                dense
            ></v-text-field>
        </v-col>
                  
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
            @change="getMaterias($event)"
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
            :loading="loading"
            dense
            :disabled="materias.length < 1"
            :hint="(materias.length < 1) ? 'Seleccione el Grado' : 'Seleccione el Materia'"
            persistent-hint
            ></v-select>
        </v-col>
          
        <v-col cols="12">
            <v-text-field
                :rules="[rules.max(300)]"
                v-model="form.tx_descripcion"
                label="Descripcion"
                placeholder="Indique Descripcion"
                dense
            ></v-text-field>
        </v-col>

                  
        <v-col cols="12" md="6">
            <v-text-field
                :rules="[rules.max(80)]"
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
            resource: 'libro',
            form:
            {
                id: 	          null,
				nb_libro: 	      null,
				id_materia: 	  null,
				id_grado: 	      null,
				tx_descripcion:  null,
				tx_portada: 	  null,
				tx_observaciones: null,
				id_status: 	      null,
				id_usuario: 	  null,
            },
            selects:
            {
	 	 	 	grado: 	    [],
	 	 	 	status: 	[],
            },
            materias:[]
        }
    },

    methods:
    {
        getMaterias(idGrado)
        {
            this.materias = []
            this.getResource(`materia/grado/${idGrado}`).then((data) => this.materias = data )
        }

    }
}
</script>

<style>
</style>
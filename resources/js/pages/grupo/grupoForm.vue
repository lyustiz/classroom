<template>

    <v-form ref="form" v-model="valid" lazy-validation>

    <v-card :loading="loading" flat >

        <v-card-text>

        <v-row>

        <v-col cols="12" md="6">
            <v-select
            :items="selects.calendario"
            item-text="nb_calendario"
            item-value="id"
            v-model="form.id_calendario"
            :rules="[rules.select]"
            label="Calendario"
            :loading="loading"
            dense
            ></v-select>
        </v-col>

                 
        <v-col cols="12" md="6">
            <v-text-field
                :rules="[rules.required]"
                v-model="form.nb_grupo"
                label="Nombre Grupo"
                placeholder="Indique Nombre Grupo"
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
            ></v-select>
        </v-col>
                  
        <v-col cols="12" md="6">
            <v-select
            :items="selects.turno"
            item-text="nb_turno"
            item-value="id"
            v-model="form.id_turno"
            :rules="[rules.select]"
            label="Turno"
            :loading="loading"
            dense
            ></v-select>
        </v-col>

                  
        <v-col cols="12" md="6">
            <v-select
            :items="selects.docente"
            item-text="nb_docente"
            item-value="id"
            v-model="form.id_docente"
            :rules="[rules.select]"
            label="Docente"
            :loading="loading"
            dense
            ></v-select>
        </v-col>
          
        <v-col cols="12" md="6">
            <v-text-field
                :rules="[rules.required]"
                v-model="form.nu_orden"
                label="Orden"
                placeholder="Indique Orden"
                dense
            ></v-text-field>
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
            resource: 'grupo',
            dates:
            {
                
            },
            pickers:
            {
                
            },
            form:
            {
                id: 	          null,
				nb_grupo: 	      null,
				id_grado: 	      null,
				id_turno: 	      null,
				id_calendario: 	  null,
				id_docente: 	  null,
				nu_orden: 	      null,
				tx_observaciones: null,
				id_status: 	      null,
				id_usuario: 	  null,
            },
            selects:
            {
                grado: 	    [],
	 	 	 	turno: 	    [],
	 	 	 	calendario: [],
	 	 	 	docente: 	[],
	 	 	 	status: 	[],
            },
        }
    },

    methods:
    {

    }
}
</script>

<style>
</style>
<template>

    <v-form ref="form" v-model="valid" lazy-validation>

    <v-card :loading="loading" flat >

        <v-card-text>

        <v-row>

                         
        <v-col cols="12" md="6">
            <v-select
            :items="selects.grupo"
            item-text="nb_grupo"
            item-value="id"
            v-model="form.id_grupo"
            :rules="[rules.select]"
            label="Grupo"
            :loading="loading"
            dense
            ></v-select>
        </v-col>
                  
        <v-col cols="12" md="6">
            <v-select
            :items="selects.periodo"
            item-text="nb_periodo"
            item-value="id"
            v-model="form.id_periodo"
            :rules="[rules.select]"
            label="Periodo"
            :loading="loading"
            dense
            ></v-select>
        </v-col>

        <v-col cols="12" md="6">
            <v-select
            :items="selects.materia"
            item-text="nb_materia"
            item-value="id"
            v-model="form.id_materia"
            :rules="[rules.select]"
            label="Materia"
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
            resource: 'planEvaluacion',
            dates:
            {
                
            },
            pickers:
            {
                
            },
            form:
            {
                id: 	             null,
				id_grupo: 	         null,
                id_periodo: 	     null,
                id_materia: 	     null,
				tx_observaciones: 	 null,
				id_status: 	         null,
				id_usuario: 	     null,
            },
            selects:
            {
                grupo: 	 [],
                periodo: [],
                materia:  [],      
	 	 	 	status:  [],
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
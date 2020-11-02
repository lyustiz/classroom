<template>

    <v-form ref="form" v-model="valid" lazy-validation>

    <v-card :loading="loading" flat>

        <v-card-text>

        <v-row>

                 
        <v-col cols="12" md="6">
            <v-text-field
                :rules="[rules.required]"
                v-model="form.nb_respuesta"
                label="Respuesta"
                placeholder="Indique Respuesta"
                dense
            ></v-text-field>
        </v-col>
                          
        <v-col cols="12" md="6">
            <v-select
            :items="selects.actividadPregunta"
            item-text="nb_actividad_pregunta"
            item-value="id"
            v-model="form.id_actividad_pregunta"
            :rules="[rules.select]"
            label="Actividad Pregunta"
            :loading="loading"
            dense
            ></v-select>
        </v-col>
         
            <v-checkbox
                   :rules="[rules.check]"
                  v-model="form.bo_correcta"
                  label="Correcta"
                  :true-value="1"
                  :false-value="0"
                  :indeterminate="(form.bo_correcta== null)"
                  dense
            ></v-checkbox>
 
        <v-col cols="12" md="6">
            <v-text-field
                :rules="[rules.required]"
                v-model="form.nu_valor"
                label="Valor"
                placeholder="Indique Valor"
                dense
            ></v-text-field>
        </v-col>
                  
        <v-col cols="12" md="6">
            <v-text-field
                :rules="[rules.required]"
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
            resource: 'actividad_respuesta',
            dates:
            {
                
            },
            pickers:
            {
                
            },
            form:
            {
                id: 	null,
				nb_respuesta: 	null,
				id_actividad_pregunta: 	null,
				bo_correcta: 	null,
				nu_valor: 	null,
				tx_observaciones: 	null,
				id_status: 	null,
				id_usuario: 	null,
            },
            selects:
            {
                actividadPregunta: 	 [],
	 	 	 	status: 	 [],
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
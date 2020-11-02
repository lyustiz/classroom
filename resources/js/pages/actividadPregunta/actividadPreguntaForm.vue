<template>

    <v-form ref="form" v-model="valid" lazy-validation>

    <v-card :loading="loading" flat>

        <v-card-text>

        <v-row>

                 
        <v-col cols="12" md="6">
            <v-text-field
                :rules="[rules.required]"
                v-model="form.nb_pregunta"
                label="Pregunta"
                placeholder="Indique Pregunta"
                dense
            ></v-text-field>
        </v-col>
                  
        <v-col cols="12" md="6">
            <v-text-field
                :rules="[rules.required]"
                v-model="form.nb_descripcion"
                label="Descripcion"
                placeholder="Indique Descripcion"
                dense
            ></v-text-field>
        </v-col>
                          
        <v-col cols="12" md="6">
            <v-select
            :items="selects.actividad"
            item-text="nb_actividad"
            item-value="id"
            v-model="form.id_actividad"
            :rules="[rules.select]"
            label="Actividad"
            :loading="loading"
            dense
            ></v-select>
        </v-col>
                  
        <v-col cols="12" md="6">
            <v-select
            :items="selects.tipoPregunta"
            item-text="nb_tipo_pregunta"
            item-value="id"
            v-model="form.id_tipo_pregunta"
            :rules="[rules.select]"
            label="Tipo Pregunta"
            :loading="loading"
            dense
            ></v-select>
        </v-col>
         
            <v-checkbox
                   :rules="[rules.check]"
                  v-model="form.bo_opcional"
                  label="Opcional"
                  :true-value="1"
                  :false-value="0"
                  :indeterminate="(form.bo_opcional== null)"
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
                v-model="form.nu_orden"
                label="Orden"
                placeholder="Indique Orden"
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
            resource: 'actividad_pregunta',
            dates:
            {
                
            },
            pickers:
            {
                
            },
            form:
            {
                id: 	null,
				nb_pregunta: 	null,
				nb_descripcion: 	null,
				id_actividad: 	null,
				id_tipo_pregunta: 	null,
				bo_opcional: 	null,
				nu_valor: 	null,
				nu_orden: 	null,
				tx_observaciones: 	null,
				id_status: 	null,
				id_usuario: 	null,
            },
            selects:
            {
                actividad: 	 [],
	 	 	 	tipoPregunta: 	 [],
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
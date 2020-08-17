<template>

    <v-form ref="form" v-model="valid" lazy-validation>

    <v-card :loading="loading" flat>

        <v-card-text>

        <v-row>

        <v-col cols="12" md="6">
            <v-select
            :items="selects.prueba"
            item-text="nb_prueba"
            item-value="id"
            v-model="form.id_prueba"
            :rules="[rules.select]"
            label="Prueba"
            :loading="loading"
            dense
            ></v-select>
        </v-col>
         
        <v-col cols="12" md="6">
            <v-menu
                v-model="pickers.id_respuesta"
                :close-on-content-click="false"
                min-width="290px"
            >
                <template v-slot:activator="{ on }">
                    <v-text-field
                        v-model="dates.id_respuesta"
                        :rules="[rules.fecha]"
                        label="Respuesta"
                        prepend-icon="event"
                        readonly
                        v-on="on"
                        dense
                    ></v-text-field>
                </template>
                <v-date-picker 
                    v-model="form.id_respuesta" 
                    @input="dates.id_respuesta = formatPicker(form.id_respuesta, 'id_respuesta')">
                </v-date-picker>
            </v-menu>
        </v-col> 
        <v-col cols="12" md="6">
            <v-text-field
                :rules="[rules.required]"
                v-model="form.tx_respuesta"
                label="Respuesta"
                placeholder="Indique Respuesta"
                dense
            ></v-text-field>
        </v-col>
                 
            <v-checkbox
                  :rules="[rules.required]"
                  v-model="form.bo_correcta"
                  label="Correcta"
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
            resource: 'respuesta_alumno',
            dates:
            {
                id_respuesta: 	 null,
            },
            pickers:
            {
                id_respuesta: 	 null,
            },
            form:
            {
                id: 	null,
				id_prueba: 	null,
				id_respuesta: 	null,
				tx_respuesta: 	null,
				bo_correcta: 	null,
				nu_valor: 	null,
				tx_observaciones: 	null,
				id_status: 	null,
				id_usuario: 	null,
            },
            selects:
            {
                prueba: 	 [],
	 	 	 	respuesta: 	 [],
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
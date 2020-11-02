<template>

    <v-form ref="form" v-model="valid" lazy-validation>

    <v-card :loading="loading" flat>

        <v-card-text>

        <v-row>

                         
        <v-col cols="12" md="6">
            <v-select
            :items="selects.clase"
            item-text="nb_clase"
            item-value="id"
            v-model="form.id_clase"
            :rules="[rules.select]"
            label="Clase"
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
            <v-menu
                v-model="pickers.fe_asistencia"
                :close-on-content-click="false"
                min-width="290px"
            >
                <template v-slot:activator="{ on }">
                    <v-text-field
                        v-model="dates.fe_asistencia"
                        :rules="[rules.fecha]"
                        label="Asistencia"
                        prepend-icon="event"
                        readonly
                        v-on="on"
                        dense
                    ></v-text-field>
                </template>
                <v-date-picker 
                    v-model="form.fe_asistencia" 
                    @input="dates.fe_asistencia = formatPicker(form.fe_asistencia, 'fe_asistencia')">
                </v-date-picker>
            </v-menu>
        </v-col>
            <v-checkbox
                   :rules="[rules.check]"
                  v-model="form.bo_asistencia"
                  label="Asistencia"
                  :true-value="1"
                  :false-value="0"
                  :indeterminate="(form.bo_asistencia== null)"
                  dense
            ></v-checkbox>
 
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
            resource: 'asistencia',
            dates:
            {
                fe_asistencia: 	 null,
            },
            pickers:
            {
                fe_asistencia: 	 null,
            },
            form:
            {
                id: 	null,
				id_clase: 	null,
				id_alumno: 	null,
				fe_asistencia: 	null,
				bo_asistencia: 	null,
				tx_observaciones: 	null,
				id_status: 	null,
				id_usuario: 	null,
            },
            selects:
            {
                clase: 	 [],
	 	 	 	alumno: 	 [],
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
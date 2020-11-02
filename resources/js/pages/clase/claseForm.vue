<template>

    <v-form ref="form" v-model="valid" lazy-validation>

    <v-card :loading="loading" flat>

        <v-card-text>

        <v-row>

                 
        <v-col cols="12" md="6">
            <v-text-field
                :rules="[rules.required]"
                v-model="form.id_grado"
                label="Grado"
                placeholder="Indique Grado"
                dense
            ></v-text-field>
        </v-col>
                          
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
            <v-menu
                v-model="pickers.fe_clase"
                :close-on-content-click="false"
                min-width="290px"
            >
                <template v-slot:activator="{ on }">
                    <v-text-field
                        v-model="dates.fe_clase"
                        :rules="[rules.fecha]"
                        label="Clase"
                        prepend-icon="event"
                        readonly
                        v-on="on"
                        dense
                    ></v-text-field>
                </template>
                <v-date-picker 
                    v-model="form.fe_clase" 
                    @input="dates.fe_clase = formatPicker(form.fe_clase, 'fe_clase')">
                </v-date-picker>
            </v-menu>
        </v-col>
        <v-col cols="12" md="6">
            <v-menu
                v-model="pickers.fe_completada"
                :close-on-content-click="false"
                min-width="290px"
            >
                <template v-slot:activator="{ on }">
                    <v-text-field
                        v-model="dates.fe_completada"
                        :rules="[rules.fecha]"
                        label="Completada"
                        prepend-icon="event"
                        readonly
                        v-on="on"
                        dense
                    ></v-text-field>
                </template>
                <v-date-picker 
                    v-model="form.fe_completada" 
                    @input="dates.fe_completada = formatPicker(form.fe_completada, 'fe_completada')">
                </v-date-picker>
            </v-menu>
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
            resource: 'clase',
            dates:
            {
                fe_clase: 	 null,
	 	 	 	fe_completada: 	 null,
            },
            pickers:
            {
                fe_clase: 	 null,
	 	 	 	fe_completada: 	 null,
            },
            form:
            {
                id: 	null,
				id_grado: 	null,
				id_grupo: 	null,
				id_materia: 	null,
				id_docente: 	null,
				fe_clase: 	null,
				fe_completada: 	null,
				tx_observaciones: 	null,
				id_status: 	null,
				id_usuario: 	null,
            },
            selects:
            {
                grado: 	 [],
	 	 	 	grupo: 	 [],
	 	 	 	materia: 	 [],
	 	 	 	docente: 	 [],
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
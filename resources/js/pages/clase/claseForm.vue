<template>

    <v-form ref="form" v-model="valid" lazy-validation>

    <v-card :loading="loading" flat >

        <v-card-text>

        <v-row>

                         
        <v-col cols="12" md="6">
            <v-select
            :items="selects.grado_materia"
            item-text="nb_grado_materia"
            item-value="id"
            v-model="form.id_grado_materia"
            :rules="[rules.select]"
            label="Grado Materia"
            :loading="loading"
            dense
            ></v-select>
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
            :items="selects.profesor"
            item-text="nb_profesor"
            item-value="id"
            v-model="form.id_profesor"
            :rules="[rules.select]"
            label="Profesor"
            :loading="loading"
            dense
            ></v-select>
        </v-col>
         
        <v-col cols="12" md="3">
            <v-menu
                ref="picker"
                v-model="pickers.fe_clase"
                min-width="290px"
                readonly
            >
                <template v-slot:activator="{ on }">
                    <v-text-field
                        v-on="on"
                        v-model="dates.fe_clase"
                        :rules="rules.etapaCo"
                        label="Clase"
                        prepend-icon="event"
                        readonly
                        dense
                    ></v-text-field>
                </template>

                <v-date-picker 
                    v-model="form.fe_clase" 
                    locale="es"
                    @input="dates.fe_clase = formatDate( form.fe_clase )"
                ></v-date-picker>
            </v-menu>
        </v-col>
 
        <v-col cols="12" md="6">
            <v-text-field
                :rules="[]"
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
            },
            pickers:
            {
                fe_clase: 	 null,
            },
            form:
            {
                id: 	null,
				id_grado_materia: 	null,
				id_grupo: 	null,
				id_profesor: 	null,
				fe_clase: 	null,
				tx_observaciones: 	null,
				id_status: 	null,
				id_usuario: 	null,
            },
            selects:
            {
                grado_materia: 	 [],
	 	 	 	grupo: 	 [],
	 	 	 	profesor: 	 [],
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
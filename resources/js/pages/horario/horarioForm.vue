<template>

    <v-form ref="form" v-model="valid" lazy-validation>

    <v-card :loading="loading" >

        <v-card-text>

        <v-row>

                 
        <v-col cols="12" md="6">
            <v-text-field
                :rules="[rules.required]"
                v-model="form.co_horario"
                label="Horario"
                placeholder="Indique Horario"
                dense
            ></v-text-field>
        </v-col>
                          
        <v-col cols="12" md="6">
            <v-select
            :items="selects.grado_materia"
            item-text="nb_grado_materia"
            item-value="id"
            v-model="form.id_grado_materia"
            :rules="[rules.select]"
            label="Grado Materia"
            autocomplete
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
            autocomplete
            dense
            ></v-select>
        </v-col>
                  
        <v-col cols="12" md="6">
            <v-select
            :items="selects.dia_semana"
            item-text="nb_dia_semana"
            item-value="id"
            v-model="form.id_dia_semana"
            :rules="[rules.select]"
            label="Dia Semana"
            autocomplete
            dense
            ></v-select>
        </v-col>
         
        <v-col cols="12" md="3">
            <v-menu
                ref="picker"
                v-model="pickers.hh_inicio"
                min-width="290px"
                readonly
            >
                <template v-slot:activator="{ on }">
                    <v-text-field
                        v-on="on"
                        v-model="dates.hh_inicio"
                        :rules="rules.etapaCo"
                        label="Inicio"
                        prepend-icon="event"
                        readonly
                        dense
                    ></v-text-field>
                </template>

                <v-date-picker 
                    v-model="form.hh_inicio" 
                    locale="es"
                    @input="dates.hh_inicio = formatDate( form.hh_inicio )"
                ></v-date-picker>
            </v-menu>
        </v-col>

        <v-col cols="12" md="3">
            <v-menu
                ref="picker"
                v-model="pickers.hh_fin"
                min-width="290px"
                readonly
            >
                <template v-slot:activator="{ on }">
                    <v-text-field
                        v-on="on"
                        v-model="dates.hh_fin"
                        :rules="rules.etapaCo"
                        label="Fin"
                        prepend-icon="event"
                        readonly
                        dense
                    ></v-text-field>
                </template>

                <v-date-picker 
                    v-model="form.hh_fin" 
                    locale="es"
                    @input="dates.hh_fin = formatDate( form.hh_fin )"
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
            autocomplete
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
                :loading:="loading"
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
            resource: 'horario',
            dates:
            {
                hh_inicio: 	 null,
	 	 	 	hh_fin: 	 null,
            },
            pickers:
            {
                hh_inicio: 	 null,
	 	 	 	hh_fin: 	 null,
            },
            form:
            {
                id: 	null,
				co_horario: 	null,
				id_grado_materia: 	null,
				id_grupo: 	null,
				id_dia_semana: 	null,
				hh_inicio: 	null,
				hh_fin: 	null,
				tx_observaciones: 	null,
				id_status: 	null,
				id_usuario: 	null,
            },
            selects:
            {
                grado_materia: 	 [],
	 	 	 	grupo: 	 [],
	 	 	 	dia_semana: 	 [],
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
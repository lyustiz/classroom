<template>

    <v-form ref="form" v-model="valid" lazy-validation>

    <v-card :loading="loading" >

        <v-card-text>

        <v-row>

                 
        <v-col cols="12" md="6">
            <v-text-field
                :rules="[rules.required]"
                v-model="form.nb_actividad"
                label="Actividad"
                placeholder="Indique Actividad"
                dense
            ></v-text-field>
        </v-col>
                          
        <v-col cols="12" md="6">
            <v-select
            :items="selects.horario"
            item-text="nb_horario"
            item-value="id"
            v-model="form.id_horario"
            :rules="[rules.select]"
            label="Horario"
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
                  
        <v-col cols="12" md="6">
            <v-select
            :items="selects.diaSemana"
            item-text="nb_dia_semana"
            item-value="id"
            v-model="form.id_dia_semana"
            :rules="[rules.select]"
            label="Dia Semana"
            :loading="loading"
            dense
            ></v-select>
        </v-col>
                  
        <v-col cols="12" md="6">
            <v-select
            :items="selects.aula"
            item-text="nb_aula"
            item-value="id"
            v-model="form.id_aula"
            :rules="[rules.select]"
            label="Aula"
            :loading="loading"
            dense
            ></v-select>
        </v-col>
         
        <v-col cols="12" md="6">
            <v-menu
                v-model="pickers.hh_inicio"
                :close-on-content-click="false"
                min-width="290px"
            >
                <template v-slot:activator="{ on }">
                    <v-text-field
                        v-model="dates.hh_inicio"
                        :rules="[rules.fecha]"
                        label="Inicio"
                        prepend-icon="event"
                        readonly
                        v-on="on"
                        dense
                    ></v-text-field>
                </template>
                <v-date-picker 
                    v-model="form.hh_inicio" 
                    @input="dates.hh_inicio = formatPicker(form.hh_inicio, 'hh_inicio')">
                </v-date-picker>
            </v-menu>
        </v-col>
        <v-col cols="12" md="6">
            <v-menu
                v-model="pickers.hh_fin"
                :close-on-content-click="false"
                min-width="290px"
            >
                <template v-slot:activator="{ on }">
                    <v-text-field
                        v-model="dates.hh_fin"
                        :rules="[rules.fecha]"
                        label="Fin"
                        prepend-icon="event"
                        readonly
                        v-on="on"
                        dense
                    ></v-text-field>
                </template>
                <v-date-picker 
                    v-model="form.hh_fin" 
                    @input="dates.hh_fin = formatPicker(form.hh_fin, 'hh_fin')">
                </v-date-picker>
            </v-menu>
        </v-col>
        <v-col cols="12" md="6">
            <v-menu
                v-model="pickers.nu_carga_horaria"
                :close-on-content-click="false"
                min-width="290px"
            >
                <template v-slot:activator="{ on }">
                    <v-text-field
                        v-model="dates.nu_carga_horaria"
                        :rules="[rules.fecha]"
                        label="Carga Horaria"
                        prepend-icon="event"
                        readonly
                        v-on="on"
                        dense
                    ></v-text-field>
                </template>
                <v-date-picker 
                    v-model="form.nu_carga_horaria" 
                    @input="dates.nu_carga_horaria = formatPicker(form.nu_carga_horaria, 'nu_carga_horaria')">
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
            resource: 'actividad',
            dates:
            {
                hh_inicio: 	 null,
	 	 	 	hh_fin: 	 null,
	 	 	 	nu_carga_horaria: 	 null,
            },
            pickers:
            {
                hh_inicio: 	 null,
	 	 	 	hh_fin: 	 null,
	 	 	 	nu_carga_horaria: 	 null,
            },
            form:
            {
                id: 	null,
				nb_actividad: 	null,
				id_horario: 	null,
				id_materia: 	null,
				id_profesor: 	null,
				id_dia_semana: 	null,
				id_aula: 	null,
				hh_inicio: 	null,
				hh_fin: 	null,
				nu_carga_horaria: 	null,
				tx_observaciones: 	null,
				id_status: 	null,
				id_usuario: 	null,
            },
            selects:
            {
                horario: 	 [],
	 	 	 	materia: 	 [],
	 	 	 	profesor: 	 [],
	 	 	 	diaSemana: 	 [],
	 	 	 	aula: 	 [],
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
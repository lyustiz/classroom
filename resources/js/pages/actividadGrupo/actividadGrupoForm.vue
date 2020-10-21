<template>

    <v-form ref="form" v-model="valid" lazy-validation>

    <v-card :loading="loading" flat>

        <v-card-text>

        <v-row>

                         
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
            <v-menu
                v-model="pickers.fe_inicio"
                :close-on-content-click="false"
                min-width="290px"
            >
                <template v-slot:activator="{ on }">
                    <v-text-field
                        v-model="dates.fe_inicio"
                        :rules="[rules.fecha]"
                        label="Inicio"
                        prepend-icon="event"
                        readonly
                        v-on="on"
                        dense
                    ></v-text-field>
                </template>
                <v-date-picker 
                    v-model="form.fe_inicio" 
                    @input="dates.fe_inicio = formatPicker(form.fe_inicio, 'fe_inicio')">
                </v-date-picker>
            </v-menu>
        </v-col>
        <v-col cols="12" md="6">
            <v-menu
                v-model="pickers.fe_fin"
                :close-on-content-click="false"
                min-width="290px"
            >
                <template v-slot:activator="{ on }">
                    <v-text-field
                        v-model="dates.fe_fin"
                        :rules="[rules.fecha]"
                        label="Fin"
                        prepend-icon="event"
                        readonly
                        v-on="on"
                        dense
                    ></v-text-field>
                </template>
                <v-date-picker 
                    v-model="form.fe_fin" 
                    @input="dates.fe_fin = formatPicker(form.fe_fin, 'fe_fin')">
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
            resource: 'actividad_grupo',
            dates:
            {
                fe_inicio: 	 null,
	 	 	 	fe_fin: 	 null,
            },
            pickers:
            {
                fe_inicio: 	 null,
	 	 	 	fe_fin: 	 null,
            },
            form:
            {
                id: 	null,
				id_actividad: 	null,
				id_grupo: 	null,
				fe_inicio: 	null,
				fe_fin: 	null,
				tx_observaciones: 	null,
				id_status: 	null,
				id_usuario: 	null,
            },
            selects:
            {
                actividad: 	 [],
	 	 	 	grupo: 	 [],
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
<template>

    <v-form ref="form" v-model="valid" lazy-validation>

    <v-card :loading="loading" flat>

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
            :items="selects.tipoAsignacion"
            item-text="nb_tipo_asignacion"
            item-value="id"
            v-model="form.id_tipo_asignacion"
            :rules="[rules.select]"
            label="Tipo Asignacion"
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
            :items="selects.tema"
            item-text="nb_tema"
            item-value="id"
            v-model="form.id_tema"
            :rules="[rules.select]"
            label="Tema"
            :loading="loading"
            dense
            ></v-select>
        </v-col>
                  
        <v-col cols="12" md="6">
            <v-select
            :items="selects.origen"
            item-text="nb_origen"
            item-value="id"
            v-model="form.id_origen"
            :rules="[rules.select]"
            label="Origen"
            :loading="loading"
            dense
            ></v-select>
        </v-col>
          
        <v-col cols="12" md="6">
            <v-text-field
                :rules="[rules.required]"
                v-model="form.tx_origen"
                label="Origen"
                placeholder="Indique Origen"
                dense
            ></v-text-field>
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
                :rules="[rules.mex(80)]"
                v-model="form.tx_observaciones"
                label="Observaciones"
                placeholder="Indique Observaciones"
                dense
            ></v-text-field>
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
            resource: 'asignacion',
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
                id: 	            null,
				id_grupo: 	        null,
				id_tipo_asignacion: null,
				id_materia: 	    null,
				id_tema: 	        null,
				id_origen: 	        null,
				tx_origen: 	        null,
				fe_inicio: 	        null,
				fe_fin: 	        null,
				tx_observaciones: 	null,
				id_status: 	        null,
				id_usuario: 	    null,
            },
            selects:
            {
                grupo: 	 [],
	 	 	 	tipoAsignacion: 	 [],
	 	 	 	materia: 	 [],
	 	 	 	tema: 	 [],
	 	 	 	origen: 	 [],
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
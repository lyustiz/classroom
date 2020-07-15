<template>

    <v-form ref="form" v-model="valid" lazy-validation>

    <v-card :loading="loading" >

        <v-card-text>

        <v-row>

                         
        <v-col cols="12" md="6">
            <v-select
            :items="selects.calendario"
            item-text="nb_calendario"
            item-value="id"
            v-model="form.id_calendario"
            :rules="[rules.select]"
            label="Calendario"
            :loading="loading"
            dense
            ></v-select>
        </v-col>

        <v-col cols="12" md="6">
            <v-select
            :items="selects.alumno"
            item-text="nb_alumno"
            item-value="id"
            v-model="form.id_calendario"
            :rules="[rules.select]"
            label="Calendario"
            :loading="loading"
            dense
            ></v-select>
        </v-col>
                  
        <v-col cols="12" md="6">
            <v-select
            :items="selects.grado"
            item-text="nb_grado"
            item-value="id"
            v-model="form.id_grado"
            :rules="[rules.select]"
            label="Grado"
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
                v-model="pickers.fe_matricula"
                :close-on-content-click="false"
                min-width="290px"
            >
                <template v-slot:activator="{ on }">
                    <v-text-field
                        v-model="dates.fe_matricula"
                        :rules="[rules.fecha]"
                        label="Matricula"
                        prepend-icon="event"
                        readonly
                        v-on="on"
                        dense
                    ></v-text-field>
                </template>
                <v-date-picker 
                    v-model="form.fe_matricula" 
                    @input="dates.fe_matricula = formatPicker(form.fe_matricula, 'fe_matricula')">
                </v-date-picker>
            </v-menu>
        </v-col>         
        <v-col cols="12" md="6">
            <v-select
            :items="selects.tipoCondicion"
            item-text="nb_tipo_condicion"
            item-value="id"
            v-model="form.id_tipo_condicion"
            :rules="[rules.select]"
            label="Tipo Condicion"
            :loading="loading"
            dense
            ></v-select>
        </v-col>
                  
        <v-col cols="12" md="6">
            <v-select
            :items="selects.colegioOrigen"
            item-text="nb_colegio_origen"
            item-value="id"
            v-model="form.id_colegio_origen"
            :rules="[rules.select]"
            label="Colegio Origen"
            :loading="loading"
            dense
            ></v-select>
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
            resource: 'matricula',
            dates:
            {
                fe_matricula: 	 null,
            },
            pickers:
            {
                fe_matricula: 	 null,
            },
            form:
            {
                id: 	null,
                id_calendario: 	null,
                id_alumno: 	       null,
				id_grado: 	null,
				id_grupo: 	null,
				fe_matricula: 	null,
				id_tipo_condicion: 	null,
				id_colegio_origen: 	null,
				tx_observaciones: 	null,
				id_status: 	null,
				id_usuario: 	null,
            },
            selects:
            {
                calendario: 	 [],
                alumno: 	 [],
	 	 	 	grado: 	 [],
	 	 	 	grupo: 	 [],
	 	 	 	tipoCondicion: 	 [],
	 	 	 	colegioOrigen: 	 [],
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
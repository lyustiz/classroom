<template>

    <v-form ref="form" v-model="valid" lazy-validation>

    <v-card :loading="loading" flat>

        <v-card-text>

        <v-row>

        <v-col cols="12" md="6">
            <v-text-field
                :rules="[rules.required]"
                v-model="form.nb_prueba"
                label="Nombre de la Prueba"
                placeholder="Indique Nombre de la Prueba"
                dense
            ></v-text-field>
        </v-col>

        <v-col cols="12" md="6">
            <v-select
            :items="selects.grado"
            item-text="nb_grado"
            item-value="id"
            v-model="form.id_grado"
            :rules="[rules.select]"
            label="Grupo"
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
            :rules="[]"
            label="Grupo"
            :loading="loading"
            dense
            ></v-select>
        </v-col>
                  
        <v-col cols="12" md="6">
            <v-select
            :items="selects.evaluacionDetalle"
            item-text="nb_evaluacion_detalle"
            item-value="id"
            v-model="form.id_evaluacion_detalle"
            :rules="[]"
            label="Evaluacion Detalle"
            :loading="loading"
            dense
            ></v-select>
        </v-col>
         
            <v-checkbox
                  :rules="[rules.required]"
                  v-model="form.bo_ver_resultado"
                  label="Ver Resultado"
                  dense
            ></v-checkbox>
 
        <v-col cols="12" md="6">
            <v-text-field
                :rules="[]"
                v-model="form.nu_minutos"
                label="Minutos"
                placeholder="Indique Minutos"
                dense
            ></v-text-field>
        </v-col>
                 
        <v-col cols="12" md="6">
            <v-menu
                v-model="pickers.fe_prueba"
                :close-on-content-click="false"
                min-width="290px"
            >
                <template v-slot:activator="{ on }">
                    <v-text-field
                        v-model="dates.fe_prueba"
                        :rules="[rules.fecha]"
                        label="Prueba"
                        prepend-icon="event"
                        readonly
                        v-on="on"
                        dense
                    ></v-text-field>
                </template>
                <v-date-picker 
                    v-model="form.fe_prueba" 
                    @input="dates.fe_prueba = formatPicker(form.fe_prueba, 'fe_prueba')">
                </v-date-picker>
            </v-menu>
        </v-col> 
        <v-col cols="12" md="6">
            <v-text-field
                :rules="[]"
                v-model="form.hh_inicio"
                label="Inicio"
                placeholder="Indique Inicio"
                dense
            ></v-text-field>
        </v-col>
                  
        <v-col cols="12" md="6">
            <v-text-field
                :rules="[]"
                v-model="form.hh_fin"
                label="Fin"
                placeholder="Indique Fin"
                dense
            ></v-text-field>
        </v-col>
                  
        <v-col cols="12" md="6">
            <v-text-field
                :rules="[]"
                v-model="form.nu_valor_total"
                label="Valor Total"
                placeholder="Indique Valor Total"
                dense
            ></v-text-field>
        </v-col>
                  
        <v-col cols="12" md="6">
            <v-text-field
                :rules="[rules.max(100)]"
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
            resource: 'prueba',
            dates:
            {
                fe_prueba: 	 null,
            },
            pickers:
            {
                fe_prueba: 	 null,
            },
            form:
            {
                id: 	               null,
                nb_prueba: 	           null,
                id_grado:              null,
				id_grupo: 	           null,
				id_evaluacion_detalle: 1,
				bo_ver_resultado: 	   null,
				nu_minutos: 	       null,
				fe_prueba: 	           null,
				hh_inicio: 	           null,
				hh_fin: 	           null,
				nu_valor_total: 	   null,
				tx_observaciones: 	   null,
				id_status: 	           null,
				id_usuario: 	       null,
            },
            selects:
            {
                grado: 	 [],
                grupo: 	 [],
	 	 	 	status:  [],
            },
            default:{
                id_evaluacion_detalle: 1
            }
        }
    },

    methods:
    {

    }
}
</script>

<style>
</style>
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
                          
        <v-checkbox
                :rules="[rules.required]"
                v-model="form.bo_ver_resultado"
                label="Ver Resultado"
                dense
        ></v-checkbox>
                  
        <v-col cols="12" md="6">
            <v-text-field
                :rules="[rules.required]"
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
                id_grado: 	           null,
				id_grupo: 	           null,
				id_evaluacion_detalle: null,
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
                grado: 	     [],
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
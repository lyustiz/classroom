<template>

    <v-form ref="form" v-model="valid" lazy-validation>

    <v-card :loading="loading" >

        <v-card-text>

        <v-row>

            <v-col cols="12" md="6">
            <v-select
            :items="selects.grupoCalificacion"
            item-text="nb_grupo_calificacion"
            item-value="id"
            v-model="form.id_grupo_calificacion"
            :rules="[rules.select]"
            label="Grupo Calificacion"
            autocomplete
            dense
            ></v-select>
        </v-col>
                  
        <v-col cols="12" md="6">
            <v-select
            :items="selects.tipoCalificacion"
            item-text="nb_tipo_calificacion"
            item-value="id"
            v-model="form.id_tipo_calificacion"
            :rules="[rules.select]"
            label="Tipo Calificacion"
            autocomplete
            dense
            ></v-select>
        </v-col>

        <v-col cols="12" md="6">
            <v-text-field
                :rules="[rules.required]"
                v-model="form.nb_calificacion"
                label="Calificacion"
                placeholder="Indique Calificacion"
                dense
            ></v-text-field>
        </v-col>
                  
        <v-col cols="12" md="6">
            <v-text-field
                :rules="[rules.required]"
                v-model="form.nu_calificacion"
                label="Valor Calificacion"
                placeholder="Indique Calificacion"
                dense
            ></v-text-field>
        </v-col>
                  
        <v-col cols="12" md="6">
            <v-text-field
                :rules="[rules.required]"
                v-model="form.co_calificacion"
                label="Codigo Calificacion"
                placeholder="Indique Calificacion"
                dense
            ></v-text-field>
        </v-col>
                  
        <v-col cols="12" md="6">
            <v-text-field
                :rules="[rules.required]"
                v-model="form.bo_aprobado"
                label="Aprobado"
                placeholder="Indica aprobacion?"
                dense
            ></v-text-field>
        </v-col>
                  
        <v-col cols="12" md="6">
            <v-text-field
                :rules="[rules.required]"
                v-model="form.nu_orden"
                label="Orden"
                placeholder="Indique Orden"
                dense
            ></v-text-field>
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
            resource: 'calificacion',
            dates:
            {
                
            },
            pickers:
            {
                
            },
            form:
            {
                id: 	null,
				nb_calificacion: 	null,
				nu_calificacion: 	null,
				co_calificacion: 	null,
				bo_aprobado: 	null,
				nu_orden: 	null,
				id_grupo_calificacion: 	null,
				id_tipo_calificacion: 	null,
				tx_observaciones: 	null,
				id_status: 	null,
				id_usuario: 	null,
            },
            selects:
            {
                grupoCalificacion: 	 [],
	 	 	 	tipoCalificacion: 	 [],
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
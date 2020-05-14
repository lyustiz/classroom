<template>

    <v-form ref="form" v-model="valid" lazy-validation>

    <v-card :loading="loading" >

        <v-card-text>

        <v-row>
        
        
        
        
        <v-col cols="12" md="6">
            <v-select
            :items="selects.tipoDirectiva"
            item-text="nb_tipo_directiva"
            item-value="id"
            v-model="form.id_tipo_directiva"
            :rules="[rules.select]"
            label="Tipo Directiva"
            :loading="loading"
            dense
            ></v-select>
        </v-col>

        <v-col cols="12" md="6">
            <v-select
            :items="selects.cargo"
            item-text="nb_cargo"
            item-value="id"
            v-model="form.id_cargo"
            :rules="[rules.select]"
            label="Cargo"
            :loading="loading"
            dense
            ></v-select>
        </v-col>

        <v-col cols="12" md="6">
            <v-text-field
                :rules="[rules.required]"
                v-model="form.nb_directiva"
                label="Nombre"
                placeholder="Nombre"
                dense
            ></v-text-field>
        </v-col>
                  
          
        <v-col cols="12" md="6">
            <v-text-field
                :rules="[rules.required]"
                v-model="form.tx_documento"
                label="Documento"
                placeholder="Indique Documento"
                dense
            ></v-text-field>
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
            resource: 'directiva',
            dates:
            {
                
            },
            pickers:
            {
                
            },
            form:
            {
                id: 	null,
				id_colegio: 	1,
				nb_directiva: 	null,
				id_tipo_directiva: 	null,
				tx_documento: 	null,
				nb_cargo: 	null,
				tx_observaciones: 	null,
				id_status: 	null,
				id_usuario: 	null,
            },
            selects:
            {
                cargo: 	         [],   
                tipoDirectiva: 	 [],
	 	 	 	status: 	     [],
            },
            default:
            {
                id_colegio: 1
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
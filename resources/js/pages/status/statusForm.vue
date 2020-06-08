<template>

    <v-form ref="form" v-model="valid" lazy-validation>

    <v-card :loading="loading" >

        <v-card-text>

        <v-row>

                 
        <v-col cols="12" md="6">
            <v-text-field
                :rules="[rules.required]"
                v-model="form.nb_status"
                label="Status"
                placeholder="Indique Status"
                dense
            ></v-text-field>
        </v-col>
                  
        <v-col cols="12" md="6">
            <v-text-field
                :rules="[rules.required]"
                v-model="form.nb_secundario"
                label="Secundario"
                placeholder="Indique Secundario"
                dense
            ></v-text-field>
        </v-col>
                  
        <v-col cols="12" md="6">
            <v-text-field
                :rules="[rules.required]"
                v-model="form.co_status"
                label="Status"
                placeholder="Indique Status"
                dense
            ></v-text-field>
        </v-col>
                  
        <v-col cols="12" md="6">
            <v-text-field
                :rules="[rules.required]"
                v-model="form.co_grupo"
                label="Grupo"
                placeholder="Indique Grupo"
                dense
            ></v-text-field>
        </v-col>
                          
        <v-col cols="12" md="6">
            <v-select
            :items="selects.padre"
            item-text="nb_padre"
            item-value="id"
            v-model="form.id_padre"
            :rules="[rules.select]"
            label="Padre"
            :loading="loading"
            dense
            ></v-select>
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
                 
            <v-checkbox
                  :rules="[rules.required]"
                  v-model="form.bo_activo"
                  label="Activo"
                  dense
            ></v-checkbox>


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
            resource: 'status',
            dates:
            {
                
            },
            pickers:
            {
                
            },
            form:
            {
                id: 	null,
				nb_status: 	null,
				nb_secundario: 	null,
				co_status: 	null,
				co_grupo: 	null,
				id_padre: 	null,
				tx_observaciones: 	null,
				bo_activo: 	null,
				id_usuario: 	null,
            },
            selects:
            {
                padre: 	 [],
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
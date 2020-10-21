<template>

    <v-form ref="form" v-model="valid" lazy-validation>

    <v-card :loading="loading" flat>

        <v-card-text>

        <v-row>

                         
        <v-col cols="12" md="6">
            <v-select
            :items="selects.tipoRecurso"
            item-text="nb_tipo_recurso"
            item-value="id"
            v-model="form.id_tipo_recurso"
            :rules="[rules.select]"
            label="Tipo Recurso"
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
            <v-text-field
                :rules="[rules.max(100)]"
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
            resource: 'recurso',
            dates:
            {
                
            },
            pickers:
            {
                
            },
            form:
            {
                id: 	null,
				id_tipo_recurso: 	null,
				id_tema: 	null,
				id_grupo: 	null,
				tx_observaciones: 	null,
				id_status: 	null,
				id_usuario: 	null,
            },
            selects:
            {
                tipoRecurso: 	 [],
	 	 	 	tema: 	 [],
	 	 	 	grupo: 	 [],
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
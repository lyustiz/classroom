<template>

    <v-form ref="form" v-model="valid" lazy-validation>

    <v-card :loading="loading" flat>

        <v-card-text>

        <v-row>

                 
        <v-col cols="12" md="6">
            <v-text-field
                :rules="[rules.required]"
                v-model="form.nb_accion_tema"
                label="Accion Tema"
                placeholder="Indique Accion Tema"
                dense
            ></v-text-field>
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
            :items="selects.recurso"
            item-text="nb_recurso"
            item-value="id"
            v-model="form.id_recurso"
            :rules="[rules.select]"
            label="Recurso"
            :loading="loading"
            dense
            ></v-select>
        </v-col>
                  
        <v-col cols="12" md="6">
            <v-select
            :items="selects.tipoAccion"
            item-text="nb_tipo_accion"
            item-value="id"
            v-model="form.id_tipo_accion"
            :rules="[rules.select]"
            label="Tipo Accion"
            :loading="loading"
            dense
            ></v-select>
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
            resource: 'accion_tema',
            dates:
            {
                
            },
            pickers:
            {
                
            },
            form:
            {
                id: 	null,
				nb_accion_tema: 	null,
				id_tema: 	null,
				id_recurso: 	null,
				id_tipo_accion: 	null,
				id_status: 	null,
				id_usuario: 	null,
            },
            selects:
            {
                tema: 	 [],
	 	 	 	recurso: 	 [],
	 	 	 	tipoAccion: 	 [],
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
<template>

    <v-form ref="form" v-model="valid" lazy-validation>

    <v-card :loading="loading" flat>

        <v-card-text>

        <v-row>

                 
        <v-col cols="12" md="6">
            <v-text-field
                :rules="[rules.required]"
                v-model="form.nb_accion_pagina"
                label="Accion Pagina"
                placeholder="Indique Accion Pagina"
                dense
            ></v-text-field>
        </v-col>
                          
        <v-col cols="12" md="6">
            <v-select
            :items="selects.pagina"
            item-text="nb_pagina"
            item-value="id"
            v-model="form.id_pagina"
            :rules="[rules.select]"
            label="Pagina"
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
            <v-text-field
                :rules="[rules.required]"
                v-model="form.tx_x_posicion"
                label="X Posicion"
                placeholder="Indique X Posicion"
                dense
            ></v-text-field>
        </v-col>
                  
        <v-col cols="12" md="6">
            <v-text-field
                :rules="[rules.required]"
                v-model="form.tx_y_posicion"
                label="Y Posicion"
                placeholder="Indique Y Posicion"
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
            resource: 'accion_pagina',
            dates:
            {
                
            },
            pickers:
            {
                
            },
            form:
            {
                id: 	null,
				nb_accion_pagina: 	null,
				id_pagina: 	null,
				id_recurso: 	null,
				id_tipo_accion: 	null,
				tx_x_posicion: 	null,
				tx_y_posicion: 	null,
				id_status: 	null,
				id_usuario: 	null,
            },
            selects:
            {
                pagina: 	 [],
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
<template>

    <v-form ref="form" v-model="valid" lazy-validation>

    <v-card :loading="loading" flat>

        <v-card-text>

        <v-row>
        
        <v-col cols="12" md="4">
            <v-text-field
                :rules="[rules.required]"
                v-model="form.nu_pagina"
                label="Numero de Pagina"
                placeholder="Numero de Pagina"
                dense
                type="number"
            ></v-text-field>
        </v-col>

                 
        <v-col cols="12" md="8">
            <v-text-field
                :rules="[rules.required]"
                v-model="form.nb_pagina"
                label="Pagina"
                placeholder="Nombre de Pagina"
                dense
            ></v-text-field>
        </v-col>
                          
        <v-col cols="12" md="6">
            <v-select
            :items="selects.libro"
            item-text="nb_libro"
            item-value="id"
            v-model="form.id_libro"
            :rules="[rules.select]"
            label="Libro"
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
            <v-text-field
                :rules="[rules.required]"
                v-model="form.tx_path"
                label="Path"
                placeholder="Indique Path"
                dense
            ></v-text-field>
        </v-col>
                  
        <v-col cols="12" md="6">
            <v-text-field
                :rules="[rules.max(80)]"
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
            resource: 'pagina',
            form:
            {
                id: 	          null,
				nb_pagina: 	      null,
                id_libro: 	      null,
                id_tema:          null,
				nu_pagina: 	      null,
				tx_path: 	      null,
				tx_observaciones: null,
				id_status: 	      null,
				id_usuario: 	  null,
            },
            selects:
            {
                tema: 	 [],
                libro: 	 [],
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
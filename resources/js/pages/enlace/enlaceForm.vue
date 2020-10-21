<template>

    <v-form ref="form" v-model="valid" lazy-validation>

    <v-card :loading="loading" flat>

        <v-card-text>

        <v-row>

                 
        <v-col cols="12" md="6">
            <v-text-field
                :rules="[rules.required]"
                v-model="form.nb_enlace"
                label="Enlace"
                placeholder="Indique Enlace"
                dense
            ></v-text-field>
        </v-col>
                          
        <v-col cols="12" md="6">
            <v-select
            :items="selects.tipoEnlace"
            item-text="nb_tipo_enlace"
            item-value="id"
            v-model="form.id_tipo_enlace"
            :rules="[rules.select]"
            label="Tipo Enlace"
            :loading="loading"
            dense
            ></v-select>
        </v-col>

        <v-col cols="12" md="6">
            <v-select
            :items="selects.tema"
            item-text="nb_tema"
            item-value="id"
            v-model="form.id_tipo_enlace"
            :rules="[rules.select]"
            label="Tema"
            :loading="loading"
            dense
            ></v-select>
        </v-col>
          
        <v-col cols="12" md="6">
            <v-text-field
                :rules="[rules.required]"
                v-model="form.descripcion"
                label="Descripcion"
                placeholder="Indique Descripcion"
                dense
            ></v-text-field>
        </v-col>
                  
        <v-col cols="12" md="6">
            <v-text-field
                :rules="[rules.required]"
                v-model="form.url"
                label="Url"
                placeholder="Indique Url"
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
            resource: 'enlace',
            form:
            {
                id: 	           null,
				nb_enlace: 	       null,
                id_tipo_enlace:    null,
                id_tema:           null,
				descripcion: 	   null,
				url: 	           null,
				tx_observaciones:  null,
				id_status: 	       null,
				id_usuario: 	   null,
            },
            selects:
            {
                tipoEnlace:  [],
	 	 	 	tema: 	 [],
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
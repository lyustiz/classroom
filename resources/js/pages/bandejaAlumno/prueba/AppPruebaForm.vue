<template>

    <v-form ref="form" v-model="valid" lazy-validation>

    <v-card :loading="loading" flat>

        <v-card-text>

        <v-row>

        <v-col cols="8">
            <v-text-field
                :rules="[rules.required]"
                v-model="form.nb_prueba"
                label="Nombre de la Prueba"
                placeholder="Indique Nombre de la Prueba"
                dense
            ></v-text-field>
        </v-col>

        <v-tooltip right v-model="menuAyudaOpcional" color="success" >
        <template v-slot:activator="{ on }">
            <v-checkbox
                v-on="on"
                :rules="[rules.check]"
                v-model="form.bo_ver_resultado"
                label="Mostrar Resultados"
                :true-value="1"
                :false-value="0"
                :indeterminate="(form.bo_ver_resultado== null)"
                dense
                class="col-auto  ml-3"
                append-icon="mdi-help-rhombus"
                @click:append="menuAyudaVerResultado =!menuAyudaVerResultado "
            ></v-checkbox>
        </template>
        <span>Indica si se muestran lo resultados de la prueba al finalizar</span>
       </v-tooltip>
                                                             
        <v-col cols="12">
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
            resource: 'prueba',
            form:
            {
                id: 	               null,
                nb_prueba: 	           null,
				bo_ver_resultado: 	   null,
				tx_observaciones: 	   null,
				id_status: 	           null,
				id_usuario: 	       null,
            },
            menuAyudaVerResultado: false
        }
    },

    methods:
    {

    }
}
</script>

<style>
</style>
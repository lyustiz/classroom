<template>

    <v-form ref="form" v-model="valid" lazy-validation>

    <v-card :loading="loading" flat >

        <v-card-text>

        <v-row>

                 
        <v-col cols="12" md="6">
            <v-text-field
                :rules="[rules.required]"
                v-model="form.nb_materia"
                label="Materia"
                placeholder="Indique Materia"
                dense
            ></v-text-field>
        </v-col>
                  
        <v-col cols="12" md="6">
            <v-text-field
                :rules="[rules.maxlength(20)]"
                v-model="form.co_materia"
                label="Codigo Materia"
                placeholder="Codigo Materia"
                dense
            ></v-text-field>
        </v-col>
                          
        <v-col cols="12" md="6">
            <v-select
            :items="selects.areaEstudio"
            item-text="nb_area_estudio"
            item-value="id"
            v-model="form.id_area_estudio"
            :rules="[rules.select]"
            label="Grupo Materia"
            :loading="loading"
            dense
            ></v-select>
        </v-col>
          
        <v-col cols="12" md="6">
            <v-text-field
                :rules="[rules.required, max(30)]"
                v-model="form.tx_icono"
                label="Icono"
                placeholder="Indique Icono"
                dense
                append-outer-icon="mdi-shape-outline"
                @click:append-outer="$refs.icons.click()"
            ></v-text-field>
            <a  class="d-none" ref="icons" rel="noreferrer noopener" href="/icons/"  target="_blank"></a>
        </v-col>
                  
        <v-col cols="12" md="6">
            <v-text-field
                :rules="[rules.maxlength(100)]"
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
            resource: 'materia',
            dates:
            {
                
            },
            pickers:
            {
                
            },
            form:
            {
                id: 	null,
				nb_materia: 	null,
				co_materia: 	null,
				id_area_estudio: 	null,
				tx_icono: 	null,
				tx_observaciones: 	null,
				id_status: 	null,
				id_usuario: 	null,
            },
            selects:
            {
                areaEstudio: 	 [],
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
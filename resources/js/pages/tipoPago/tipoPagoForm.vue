<template>

    <v-form ref="form" v-model="valid" lazy-validation>

    <v-card :loading="loading" flat >

        <v-card-text>

        <v-row>

                 
        <v-col cols="12" md="6">
            <v-text-field
                :rules="[rules.required]"
                v-model="form.nb_tipo_pago"
                label="Tipo Pago"
                placeholder="Indique Tipo Pago"
                dense
            ></v-text-field>
        </v-col>
                          
        <v-col cols="12" md="6">
            <v-select
            :items="selects.comercio"
            item-text="nb_comercio"
            item-value="id"
            v-model="form.id_comercio"
            :rules="[rules.select]"
            label="Comercio"
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
            resource: 'tipoPago',
            dates:
            {
                
            },
            pickers:
            {
                
            },
            form:
            {
                id: 	null,
				nb_tipo_pago: 	null,
				id_comercio: 	null,
				tx_icono: 	null,
				tx_observaciones: 	null,
				id_status: 	null,
				id_usuario: 	null,
            },
            selects:
            {
                comercio: 	 [],
	 	 	 	status: 	     ['/grupo/GRAL'],
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
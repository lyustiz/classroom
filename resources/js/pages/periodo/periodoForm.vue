<template>

    <v-form ref="form" v-model="valid" lazy-validation>

    <v-card :loading="loading" >

        <v-card-text>

        <v-row>

                 
        <v-col cols="12" md="6">
            <v-text-field
                :rules="[rules.required]"
                v-model="form.nb_periodo"
                label="Periodo"
                placeholder="Indique Periodo"
                dense
            ></v-text-field>
        </v-col>
                 
        <v-col cols="12" md="3">
            <v-menu
                ref="picker"
                v-model="pickers.fe_inicio"
                min-width="290px"
                readonly
            >
                <template v-slot:activator="{ on }">
                    <v-text-field
                        v-on="on"
                        v-model="dates.fe_inicio"
                        :rules="rules.etapaCo"
                        label="Inicio"
                        prepend-icon="event"
                        readonly
                        dense
                    ></v-text-field>
                </template>

                <v-date-picker 
                    v-model="form.fe_inicio" 
                    locale="es"
                    @input="dates.fe_inicio = formatDate( form.fe_inicio )"
                ></v-date-picker>
            </v-menu>
        </v-col>

        <v-col cols="12" md="3">
            <v-menu
                ref="picker"
                v-model="pickers.fe_fin"
                min-width="290px"
                readonly
            >
                <template v-slot:activator="{ on }">
                    <v-text-field
                        v-on="on"
                        v-model="dates.fe_fin"
                        :rules="rules.etapaCo"
                        label="Fin"
                        prepend-icon="event"
                        readonly
                        dense
                    ></v-text-field>
                </template>

                <v-date-picker 
                    v-model="form.fe_fin" 
                    locale="es"
                    @input="dates.fe_fin = formatDate( form.fe_fin )"
                ></v-date-picker>
            </v-menu>
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
            autocomplete
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
            resource: 'periodo',
            dates:
            {
                fe_inicio: 	 null,
	 	 	 	fe_fin: 	 null,
            },
            pickers:
            {
                fe_inicio: 	 null,
	 	 	 	fe_fin: 	 null,
            },
            form:
            {
                id: 	null,
				nb_periodo: 	null,
				fe_inicio: 	null,
				fe_fin: 	null,
				tx_observaciones: 	null,
				id_status: 	null,
				id_usuario: 	null,
            },
            selects:
            {
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
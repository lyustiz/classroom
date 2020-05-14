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

        <v-col cols="12" md="6">
            <v-text-field
                :rules="[rules.required]"
                v-model="form.nu_periodo"
                label="Numero de Periodo"
                type="number"
                placeholder="Indique Numero de Periodo"
                dense
            ></v-text-field>
        </v-col>

        <v-col cols="12" md="12">
            <v-select
            :items="selects.calendario"
            item-text="nb_calendario"
            item-value="id"
            v-model="form.id_calendario"
            :rules="[rules.select]"
            label="Calendario"
            :loading="loading"
            dense
            ></v-select>
        </v-col>
                 
        <v-col cols="12" md="6">
            <v-menu
                v-model="pickers.fe_inicio"
                :close-on-content-click="false"
                min-width="290px"
            >
                <template v-slot:activator="{ on }">
                    <v-text-field
                        v-model="dates.fe_inicio"
                        :rules="[rules.fecha]"
                        label="Fecha Inicio"
                        prepend-icon="event"
                        readonly
                        v-on="on"
                        dense
                    ></v-text-field>
                </template>
                <v-date-picker 
                    v-model="form.fe_inicio" 
                    @input="dates.fe_inicio = formatPicker(form.fe_inicio, 'fe_inicio')">
                </v-date-picker>
            </v-menu>
        </v-col>

        <v-col cols="12" md="6">
            <v-menu
                v-model="pickers.fe_fin"
                :close-on-content-click="false"
                min-width="290px"
            >
                <template v-slot:activator="{ on }">
                    <v-text-field
                        v-model="dates.fe_fin"
                        :rules="[rules.fecha]"
                        label="Fecha Fin"
                        prepend-icon="event"
                        readonly
                        v-on="on"
                        dense
                    ></v-text-field>
                </template>
                <v-date-picker 
                    v-model="form.fe_fin" 
                    @input="dates.fe_fin = formatPicker(form.fe_fin, 'fe_fin')">
                </v-date-picker>
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
                id: 	          null,
                nb_periodo: 	  null,
                nu_periodo: 	  null,
                id_calendario:    null,
				fe_inicio: 	      null,
				fe_fin: 	      null,
				tx_observaciones: null,
				id_status: 	      null,
				id_usuario: 	  null,
            },
            selects:
            {
                status: 	 [],
                calendario:  []
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
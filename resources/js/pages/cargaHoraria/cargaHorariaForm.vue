<template>

    <v-form ref="form" v-model="valid" lazy-validation>

    <v-card :loading="loading" >

        <v-card-text>

        <v-row>
                  
        <v-col cols="12" md="2">
            <v-text-field
                :rules="[rules.required]"
                v-model="form.nu_orden"
                label="Orden"
                placeholder="Indique Orden"
                dense
                type="number"
            ></v-text-field>
        </v-col>

        <v-col cols="12" md="5">
            <v-menu
                ref="pickers1"
                v-model="pickers.hh_inicio"
                :close-on-content-click="false"
                :return-value.sync="form.hh_inicio"
                offset-y
                max-width="240px"
                min-width="240px"
            >
                <template v-slot:activator="{ on }">
                <v-text-field
                    v-model="form.hh_inicio"
                    label="Hora Inicio"
                    prepend-icon="access_time"
                    readonly
                    v-on="on"
                    dense
                ></v-text-field>
                </template>
                <v-time-picker
                ampm-in-title
                scrollable
                v-if="pickers.hh_inicio"
                v-model="form.hh_inicio"
                full-width
                @click:minute="$refs.pickers1.save(form.hh_inicio)"
                ></v-time-picker>
            </v-menu>
        </v-col> 

        <v-col cols="12" md="5">
            <v-menu
                ref="pickers2"
                v-model="pickers.hh_fin"
                :close-on-content-click="false"
                :return-value.sync="form.hh_fin"
                offset-y
                max-width="240px"
                min-width="240px"
            >
                <template v-slot:activator="{ on }">
                <v-text-field
                    v-model="form.hh_fin"
                    label="Hora Fin"
                    prepend-icon="access_time"
                    readonly
                    v-on="on"
                    dense
                ></v-text-field>
                </template>
                <v-time-picker
                ampm-in-title
                scrollable
                v-if="pickers.hh_fin"
                v-model="form.hh_fin"
                full-width
                @click:minute="$refs.pickers2.save(form.hh_fin)"
                ></v-time-picker>
            </v-menu>
        </v-col> 

        <v-col cols="12" md="6">
            <v-select
            :items="selects.horaAcademica"
            item-text="nb_hora_academica"
            item-value="id"
            v-model="form.id_hora_academica"
            :rules="[rules.select]"
            label="Grupo"
            :loading="loading"
            dense
            ></v-select>
        </v-col>

        <v-col cols="12" md="6">
            <v-text-field
                :rules="[rules.required]"
                v-model="form.nb_carga_horaria"
                label="Descripcion"
                placeholder="Indique Descripcion"
                dense
            ></v-text-field>
        </v-col>
              
        <v-col cols="12" md="6">
            <v-select
            :items="selects.turno"
            item-text="nb_turno"
            item-value="id"
            v-model="form.id_turno"
            :rules="[rules.select]"
            label="Turno"
            :loading="loading"
            dense
            ></v-select>
        </v-col>
         
        <v-col cols="12" md="6"> 
            <v-checkbox
                  :rules="[rules.check]"
                  v-model="form.bo_receso"
                  label="Hora de Receso?"
                  :true-value="1"
                  :false-value="0"
                  prepend-icon="mdi-coffee"
                  :indeterminate="(form.bo_receso== null)"
                  dense
            ></v-checkbox>
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
            resource: 'cargaHoraria',
            dates:
            {
                hh_inicio: 	 null,
	 	 	 	hh_fin: 	 null,
            },
            pickers:
            {
                hh_inicio: 	 null,
	 	 	 	hh_fin: 	 null,
            },
            form:
            {
                id: 	          null,
				nb_carga_horaria: null,
				nu_orden: 	      null,
				hh_inicio: 	      null,
				hh_fin: 	      null,
				id_turno: 	      null,
				bo_receso: 	      null,
				tx_observaciones: null,
				id_status: 	      null,
				id_usuario: 	  null,
            },
            selects:
            {
                turno: 	       [],
                status: 	   [],
                horaAcademica: [] 
            },
            defaultForm:{

                bo_receso: 0

            }
        }
    },

    methods:
    {

    }
}
</script>

<style>
</style>
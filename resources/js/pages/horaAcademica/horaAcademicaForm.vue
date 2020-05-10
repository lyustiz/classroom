<template>

    <v-form ref="form" v-model="valid" lazy-validation>

    <v-card :loading="loading" >

        <v-card-text>

        <v-row>

                 
        <v-col cols="2" md="2">
            <v-text-field
                v-model="form.nu_orden"
                label="Orden"
                readonly                
                placeholder="Indique Orden"
                dense
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
            :items="selects.turno"
            item-text="nb_turno"
            item-value="id"
            v-model="form.id_turno"
            :rules="[rules.select]"
            label="Turno"
            autocomplete
            dense
            ></v-select>
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
            resource: 'horaAcademica',
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
                id: 	            null,
				nu_orden: 	        null,
				hh_inicio: 	        null,
				hh_fin: 	        null,
				id_turno: 	        null,
				tx_observaciones: 	null,
				id_status: 	        null,
                id_usuario: 	    null,
            },
            selects:
            {
                turno: 	 [],
	 	 	 	status: 	 [],
            },
        }
    },

    methods:
    {

        setDataForm(action)
        {
            if(this.action == 'upd')
            {
                this.mapForm()
            }
            else if(this.action == 'ins')
            {
                let nu_orden = this.item.nu_orden
                this.reset()
                this.form.nu_orden = nu_orden
            }
        },

    }
}
</script>

<style>
</style>
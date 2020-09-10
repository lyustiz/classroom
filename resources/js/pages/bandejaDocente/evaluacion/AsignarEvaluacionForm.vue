<template>

    <v-form ref="form" v-model="valid" lazy-validation>

    <v-card :loading="loading" flat>

        <v-card-text>

        <v-row>

        <v-col cols="12" md="6">
           
            <v-text-field
                v-model="dates.fe_planificada"
                :rules="[rules.fecha]"
                label="Fecha Planificada"
                prepend-icon="mdi-calendar-clock"
                readonly
                dense
            ></v-text-field>
    
        </v-col> 

        <v-col cols="12" md="6">
            <v-menu
                v-model="pickers.fe_evaluacion"
                :close-on-content-click="false"
                min-width="290px"
            >
                <template v-slot:activator="{ on }">
                    <v-text-field
                        v-model="dates.fe_evaluacion"
                        :rules="[rules.fecha]"
                        label="Fecha Evaluacion"
                        prepend-icon="mdi-calendar-check"
                        readonly
                        v-on="on"
                        dense
                    ></v-text-field>
                </template>
                <v-date-picker 
                    v-model="form.fe_evaluacion" 
                    @input="dates.fe_evaluacion = formatPicker(form.fe_evaluacion, 'fe_evaluacion')">
                </v-date-picker>
            </v-menu>
        </v-col> 

        <v-col cols="12" md="6">
            <v-select
            :items="selects.evaluacionMetodo"
            item-text="nb_evaluacion_metodo"
            item-value="id"
            v-model="form.id_evaluacion_metodo"
            :rules="[rules.select]"
            label="Metodo Evaluacion"
            :loading="loading"
            dense
            :hint="(isMetodoPrueba) ? `Solo permite metodo prueba` : 'indique metodo'"
            :readonly="isMetodoPrueba"
            :persistent-hint="isMetodoPrueba"
            :color="(isMetodoPrueba) ? `amber` : null"
            :prepend-icon="(isMetodoPrueba) ? `mdi-lock` : null"
            ></v-select>
        </v-col>


        <v-col cols="12" md="3">
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

        <v-col cols="12" md="3">
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

        <v-col cols="12" md="12">
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

    watch:
    {
        item()
        {
            if(this.item.id_tipo_evaluacion == 1)
            {
                this.isMetodoPrueba = true

                this.form.id_evaluacion_metodo = 1
            }
        }
    },

    data() {
        return {
            resource: 'evaluacion/asignar',
            dates:
            {
                fe_planificada: 	 null,
                fe_evaluacion:       null,
            },
            pickers:
            {
                fe_planificada: 	 null,
                fe_evaluacion:       null,
            },
            form:
            {
                id: 	               null,
				id_evaluacion_metodo:  null,
                fe_planificada: 	   null,
                fe_evaluacion: 	       null,
				hh_inicio: 	           null,
				hh_fin: 	           null,
				tx_observaciones: 	   null,
				id_usuario: 	       null,
            },
            selects:
            {
                evaluacionMetodo: 	 [],
            },
            isMetodoPrueba: false
        }
    },

    methods:
    {
        onCreateForm()
        {
            this.form.fe_evaluacion = this.item.fe_planificada

        },
    }
}
</script>

<style>
</style>
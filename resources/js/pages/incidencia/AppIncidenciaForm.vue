<template>

    <v-form ref="form" v-model="valid" lazy-validation>

    <v-card :loading="loading" elevation="0" >

        <v-card-text>

        <v-row>

        <v-col cols="12" md="6">
            <v-menu
                v-model="pickers.fe_incidencia"
                :close-on-content-click="false"
                min-width="290px"
            >
                <template v-slot:activator="{ on }">
                    <v-text-field
                        v-model="dates.fe_incidencia"
                        :rules="[rules.fecha]"
                        label="Fecha Incidencia"
                        prepend-icon="event"
                        readonly
                        v-on="on"
                        dense
                    ></v-text-field>
                </template>
                <v-date-picker 
                    v-model="form.fe_incidencia" 
                    @input="dates.fe_incidencia = formatPicker(form.fe_incidencia, 'fe_incidencia')">
                </v-date-picker>
            </v-menu>
        </v-col>         
        <v-col cols="12" md="6">
            <v-select
            :items="selects.tipoFalta"
            item-text="nb_tipo_falta"
            item-value="id"
            v-model="form.id_tipo_falta"
            :rules="[rules.select]"
            label="Tipo Falta"
            :loading="loading"
            dense
            ></v-select>
        </v-col>
          
        <v-col cols="12" md="12">
            <v-text-field
                :rules="[rules.required, rules.max(200)]"
                v-model="form.tx_descripcion"
                label="Descripcion de la Falta"
                placeholder="Indique Descripcion de la Falta"
                dense
            ></v-text-field>
        </v-col>
                          
        <v-col cols="12" md="6">
            <v-select
            :items="selects.tipoSancion"
            item-text="nb_tipo_sancion"
            item-value="id"
            v-model="form.id_tipo_sancion"
            :rules="[rules.select]"
            label="Tipo Sancion"
            :loading="loading"
            dense
            ></v-select>
        </v-col>
          
        <v-col cols="12" md="12">
            <v-text-field
                :rules="[rules.required, rules.max(100)]"
                v-model="form.tx_sancion"
                label="Descripcion de la Sancion"
                placeholder="Indique Descripcion de la Sancion"
                dense
            ></v-text-field>
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

    props: 
    {
        alumno: {
            type:     Object,
            default:  {}
        }
    },

    data() {
        return {
            resource: 'incidencia',
            dates:
            {
                fe_incidencia: 	 null,
            },
            pickers:
            {
                fe_incidencia: 	 null,
            },
            form:
            {
                id: 	           null,
				id_alumno: 	       null,
				fe_incidencia: 	   null,
				id_tipo_falta: 	   null,
				tx_descripcion:    null,
				id_tipo_sancion:   null,
				tx_sancion: 	   null,
				tx_observaciones:  null,
				id_status: 	       null,
				id_usuario: 	   null,
            },
            selects:
            {
	 	 	 	tipoFalta: 	 [],
	 	 	 	tipoSancion: [],
            },
            default: 
            {
                id_alumno: this.alumno.id,
                id_status: 1
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
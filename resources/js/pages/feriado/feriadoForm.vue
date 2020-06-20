<template>

    <v-form ref="form" v-model="valid" lazy-validation>

    <v-card :loading="loading" flat >

        <v-card-text>

        <v-row>

        <v-col cols="12">
            <v-text-field
                :rules="[rules.required]"
                v-model="form.nb_feriado"
                label="Descripcion del Feriado"
                placeholder="Descripcion del Feriado"
                dense
            ></v-text-field>
        </v-col>
                          
        <v-col cols="12" md="6">
            <v-select
            :items="selects.tipoFeriado"
            item-text="nb_tipo_feriado"
            item-value="id"
            v-model="form.id_tipo_feriado"
            :rules="[rules.select]"
            label="Tipo Feriado"
            :loading="loading"
            dense
            ></v-select>
        </v-col>

        <v-col cols="12" md="6">
            <v-menu
                v-model="pickers.fe_feriado"
                :close-on-content-click="false"
                min-width="290px"
            >
                <template v-slot:activator="{ on }">
                    <v-text-field
                        v-model="dates.fe_feriado"
                        :rules="[rules.fecha]"
                        label="Fecha Feriado"
                        prepend-icon="event"
                        readonly
                        v-on="on"
                        dense
                    ></v-text-field>
                </template>
                <v-date-picker 
                    v-model="form.fe_feriado" 
                    @input="dates.fe_feriado = formatPicker(form.fe_feriado, 'fe_feriado')"
                    >
                </v-date-picker>
            </v-menu>
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

        <v-col cols="12" md="6" >
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

    computed:
    {
        years()
        {
            let date = new Date();

            return [
                date.getFullYear()-1,
                date.getFullYear(),
                date.getFullYear()+1
            ]
        }
    },
    data() {
        return {
            resource: 'feriado',
            dates:
            {
                fe_feriado: 	 null,
	 	 	 	aa_feriado: 	 null,
            },
            pickers:
            {
                fe_feriado: 	 null,
	 	 	 	aa_feriado: 	 null,
            },
            form:
            {
                id: 	          null,
				nb_feriado: 	  null,
				id_tipo_feriado:  null,
				fe_feriado: 	  null,
				aa_feriado: 	  null,
				tx_observaciones: null,
				id_status: 	      null,
				id_usuario: 	  null,
            },
            selects:
            {
                tipoFeriado: 	 [],
	 	 	 	status: 	     [],
            },
        }
    },

    methods:
    {

        extraActions(method)
        {
            if(this.form.id_tipo_feriado)
            {
                this.form.aa_feriado = (this.form.id_tipo_feriado == 1) ?  this.yearFromDate(this.form.fe_feriado) : this.years[1]
            }
            console.log(this.form.id_tipo_feriado, this.yearFromDate(this.form.fe_feriado))
        },

    }
}
</script>

<style>
</style>
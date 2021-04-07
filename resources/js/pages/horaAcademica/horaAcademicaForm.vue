<template>

    <v-form ref="form" v-model="valid" lazy-validation>

    <v-card :loading="loading" flat >

        <v-card-text>

        <v-row>

        <v-col cols="12" md="6">
            <v-text-field
                :rules="[rules.required]"
                v-model="form.nb_hora_academica"
                label="Descripcion"
                placeholder="Indique Descripcion"
                dense
            ></v-text-field>
        </v-col>

        <v-col cols="12" md="6">
            <v-select
            :rules="[rules.select]"
            :items="selects.nivel"
            item-text="nb_nivel"
            item-value="id"
            v-model="form.id_nivel"
            label="Nivel"
            :loading="loading"
            dense
            clearable
            ></v-select>
        </v-col>
        
        <v-col cols="12" md="12">
            <v-text-field
                :rules="[rules.max(80)]"
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
                nb_hora_academica:  null,
				nu_orden: 	        null,
				hh_inicio: 	        null,
				hh_fin: 	        null,
                id_turno: 	        null,
                id_nivel: 	        null,
                bo_receso: 	        null,
				tx_observaciones: 	null,
				id_status: 	        null,
                id_usuario: 	    null,
            },
            selects:
            {
                nivel: 	[],
            },
            default:{
                id_status: 1
            }
            
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
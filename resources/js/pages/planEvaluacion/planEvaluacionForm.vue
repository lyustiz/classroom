<template>

    <v-form ref="form" v-model="valid" lazy-validation>

    <v-card :loading="loading" flat >

        <v-card-text>

        <v-row>

                         
        <v-col cols="12" md="6">
            <v-select
            :items="selects.grupo"
            item-text="nb_grupo"
            item-value="id"
            v-model="form.id_grupo"
            :rules="[rules.select]"
            label="Grupo"
            :loading="loading"
            dense
            ></v-select>
        </v-col>
                  
        <v-col cols="12" md="6">
            <v-select
            :items="selects.periodo"
            item-text="nb_periodo"
            item-value="id"
            v-model="form.id_periodo"
            :rules="[rules.select]"
            label="Periodo"
            :loading="loading"
            dense
            ></v-select>
        </v-col>

        <v-col cols="12" md="6">
            <v-select
            :items="selects.materia"
            item-text="nb_materia"
            item-value="id"
            v-model="form.id_materia"
            :rules="[rules.select]"
            label="Materia"
            :loading="loading"
            dense
            @change="getDocentes($event)"
            ></v-select>
        </v-col>

        <v-col cols="12" md="6">
            <v-select
            :items="docentes"
            item-text="nb_docente"
            item-value="id"
            v-model="form.id_docente"
            :rules="[rules.select]"
            label="Docente"
            :loading="loading"
            :disabled="docentes.length < 1"
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

    created()
    {
        if(this.action == 'upd') this.getDocentes(this.item.id_materia)
    },

    watch:
    {
        action(action)
        {
            if(action == 'upd') this.getDocentes(this.item.id_materia)
        }
    },

    data() {
        return {
            resource: 'planEvaluacion',
            docentes: [],
            form:
            {
                id: 	             null,
				id_grupo: 	         null,
                id_periodo: 	     null,
                id_materia: 	     null,
                id_docente: 	     null,
				tx_observaciones: 	 null,
				id_status: 	         null,
				id_usuario: 	     null,
            },
            selects:
            {
                grupo: 	 ['/list'],
                periodo: [],
                materia: [],      
	 	 	 	status:  [],
            },
        }
    },

    methods:
    {
        getDocentes(materia)
        {
            this.loading = true

            axios.get( `${this.apiUrl}docente/materia/${materia}` )
            .then(response => 
            {
                this.docentes = response.data
            })
            .catch(error => 
            {
                this.showError(error)
            })
            .finally( () => 
            {
                this.loading = false
            });
        }
    }
}
</script>

<style>
</style>
<template>

    <v-form ref="form" v-model="valid" lazy-validation>

    <v-card :loading="loading" flat>

        <v-card-text>

        <v-row>

        <v-col cols="4">
        <v-text-field
            :rules="[rules.required]"
            v-model="form.nu_tema"
            label="Numero"
            placeholder="Indique Numero/Orden"
            dense
            type="number"
        ></v-text-field>
        </v-col>

        <v-col cols="12">
            <v-text-field
                :rules="[rules.required]"
                v-model="form.nb_tema"
                label="Tema"
                placeholder="Indique Tema"
                dense
            ></v-text-field>
        </v-col>
                  
        <v-col cols="12" >
            <v-text-field
                :rules="[rules.max(80)]"
                v-model="form.tx_descripcion"
                label="Descripcion"
                placeholder="Indique Descripcion"
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
        grado: {
            type: Object,
            default: () =>{}
        },

        materia: {
            type: Object,
            default: () =>{}
        },

        temas: {
            type: Array,
            default: () =>[]
        },
    },

    data() {
        return {
            resource: 'tema',
            form:
            {
                id: 	        null,
                nu_tema:        null,
				nb_tema: 	    null,
				tx_descripcion: null,
				id_materia: 	null,
				id_grado: 	    null,
				nu_nivel: 	    null,
				nu_peso: 	    null,
				id_status: 	    null,
				id_usuario: 	null,
            },
            materias:[]
        }
    },

    methods:
    {
        extraActions(action)
        {
            this.form.id_grado   = this.grado.id
            this.form.id_materia = this.materia.id
            this.form.nu_peso    = 1
            this.form.nu_nivel   = 1
            
        },

        preActionForms(action)
        {
            if(action=='ins')
            {
                 this.form.nu_tema    = this.temas.length + 1
            }
        }
    }
}
</script>

<style>
</style>
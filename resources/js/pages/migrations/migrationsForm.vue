<template>
<div>

    <form-container :titulo="titulo" :head-color="$App.theme.headForm">

        <v-form ref="form" v-model="valido" lazy-validation>

        <v-layout wrap>
                 
        <v-flex xs12 sm6>
            <v-text-field
                :rules="rules.required"
                v-model="form.id"
                label="Id"
                placeholder="Indique Id"
            ></v-text-field>
        </v-flex>
                  
        <v-flex xs12 sm6>
            <v-text-field
                :rules="rules.required"
                v-model="form.migration"
                label="Migration"
                placeholder="Indique Migration"
            ></v-text-field>
        </v-flex>
                  
        <v-flex xs12 sm6>
            <v-text-field
                :rules="rules.required"
                v-model="form.batch"
                label="Batch"
                placeholder="Indique Batch"
            ></v-text-field>
        </v-flex>
                 
        </v-layout>

     </v-form>

    <template slot="buttons">
        <form-buttons
            @update="update()"
            @store="store()"
            @clear="clear()"
            @cancel="cancel()"
            :btnAccion="btnAccion"
            :valido="valido"
        ></form-buttons>
    </template>

    </form-container>

    <pre v-if="$App.debug">{{ $data }}</pre>

</div>
</template>

<script>
import Appform from '~/mixins/Appform';
export default {
    mixins: [Appform],
    data(){
        return{
            tabla: 'migrations',
            dates:
            {
                
            },
            pickers:
            {
                
            },
            form:
            {
                id: 	null,
				migration: 	null,
				batch: 	null,
            },
            list:
            {
                
            },
        }
    },
    methods:
    {
        update()
        {
        },
        store()
        {
        }
    }
}
</script>

<style>
</style>
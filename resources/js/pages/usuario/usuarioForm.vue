<template>

    <v-form ref="form" v-model="valid" lazy-validation>

    <v-card :loading="loading" flat >

        <v-card-text>

        <v-row>

                  
        <v-col cols="12" md="6">
            <v-text-field
                :rules="[rules.required]"
                v-model="item.nb_usuario"
                label="Usuario"
                hint="Usuario de la cuenta no se puede editar"
                dense
                readonly
            ></v-text-field>
        </v-col>

        <v-col cols="12" md="6">
            <v-text-field
                :rules="rules.email"
                v-model="form.tx_email"
                label="Email"
                placeholder="Indique Email"
                dense
            ></v-text-field>
        </v-col>
                  
        <v-col cols="12" md="12">
             <v-text-field
                    prepend-inner-icon="mdi-lock"
                    :append-icon="show ? 'visibility_off' : 'visibility'"
                    @click:append="show = !show"
                    label="Password"
                    hint="Debe contener letras y numeros y una longitud minima de 8 caracteres"
                    :type="show ? 'text' : 'password'"
                    v-model="form.tx_password"
                    :rules="rules.password"
                    >
                </v-text-field>
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
            resource: 'usuario',
            form:
            {
                id: 	         null,
				password: 	     null,
                tx_email: 	     null,
				id_usuario: 	 null,
            },
            show: false,  
        }
    },

    methods:
    {

    }
}
</script>

<style>
</style>
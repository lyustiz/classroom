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
                v-model="form.nb_nombres"
                label="Nombres"
                placeholder="Indique Nombres"
            ></v-text-field>
        </v-flex>
                  
        <v-flex xs12 sm6>
            <v-text-field
                :rules="rules.required"
                v-model="form.nb_usuario"
                label="Usuario"
                placeholder="Indique Usuario"
            ></v-text-field>
        </v-flex>
                  
        <v-flex xs12 sm6>
            <v-text-field
                :rules="rules.required"
                v-model="form.password"
                label="Password"
                placeholder="Indique Password"
            ></v-text-field>
        </v-flex>
                  
        <v-flex xs12 sm6>
            <v-text-field
                :rules="rules.required"
                v-model="form.tx_email"
                label="Email"
                placeholder="Indique Email"
            ></v-text-field>
        </v-flex>
                  
        <v-flex xs12 sm6>
            <v-text-field
                :rules="rules.required"
                v-model="form.tx_foto"
                label="Foto"
                placeholder="Indique Foto"
            ></v-text-field>
        </v-flex>
                  
        <v-flex xs12 sm6>
            <v-text-field
                :rules="rules.required"
                v-model="form.id_tipo_usuario"
                label="Tipo Usuario"
                placeholder="Indique Tipo Usuario"
            ></v-text-field>
        </v-flex>
                  
        <v-flex xs12 sm6>
            <v-text-field
                :rules="rules.required"
                v-model="form.tx_observaciones"
                label="Observaciones"
                placeholder="Indique Observaciones"
            ></v-text-field>
        </v-flex>
                  
        <v-flex xs12 sm6>
            <v-text-field
                :rules="rules.required"
                v-model="form.verification"
                label="Verification"
                placeholder="Indique Verification"
            ></v-text-field>
        </v-flex>
                 
        <v-flex xs12 sm3>
            <v-menu
                ref="picker"
                v-model="pickers.email_verified_at"
                min-width="290px"
                readonly
            >
                <template v-slot:activator="{ on }">
                    <v-text-field
                        v-on="on"
                        v-model="dates.email_verified_at"
                        :rules="rules.etapaCo"
                        label="Email Verified At"
                        prepend-icon="event"
                        readonly
                        required
                    ></v-text-field>
                </template>

                <v-date-picker 
                    v-model="form.email_verified_at" 
                    locale="es"
                    @input="dates.email_verified_at = formatDate( form.email_verified_at )"
                ></v-date-picker>
            </v-menu>
        </v-flex>
 
        <v-flex xs12 sm6>
            <v-text-field
                :rules="rules.required"
                v-model="form.remember_token"
                label="Remember Token"
                placeholder="Indique Remember Token"
            ></v-text-field>
        </v-flex>
                  
        <v-flex xs12 sm6>
            <v-text-field
                :rules="rules.required"
                v-model="form.api_token"
                label="Api Token"
                placeholder="Indique Api Token"
            ></v-text-field>
        </v-flex>
                  
        <v-flex xs12 sm6>
            <v-text-field
                :rules="rules.required"
                v-model="form.id_status"
                label="Status"
                placeholder="Indique Status"
            ></v-text-field>
        </v-flex>
                  
        <v-flex xs12 sm6>
            <v-text-field
                :rules="rules.required"
                v-model="form.id_usuario"
                label="Usuario"
                placeholder="Indique Usuario"
            ></v-text-field>
        </v-flex>
                 
        <v-flex xs12 sm3>
            <v-menu
                ref="picker"
                v-model="pickers.created_at"
                min-width="290px"
                readonly
            >
                <template v-slot:activator="{ on }">
                    <v-text-field
                        v-on="on"
                        v-model="dates.created_at"
                        :rules="rules.etapaCo"
                        label="Created At"
                        prepend-icon="event"
                        readonly
                        required
                    ></v-text-field>
                </template>

                <v-date-picker 
                    v-model="form.created_at" 
                    locale="es"
                    @input="dates.created_at = formatDate( form.created_at )"
                ></v-date-picker>
            </v-menu>
        </v-flex>

        <v-flex xs12 sm3>
            <v-menu
                ref="picker"
                v-model="pickers.updated_at"
                min-width="290px"
                readonly
            >
                <template v-slot:activator="{ on }">
                    <v-text-field
                        v-on="on"
                        v-model="dates.updated_at"
                        :rules="rules.etapaCo"
                        label="Updated At"
                        prepend-icon="event"
                        readonly
                        required
                    ></v-text-field>
                </template>

                <v-date-picker 
                    v-model="form.updated_at" 
                    locale="es"
                    @input="dates.updated_at = formatDate( form.updated_at )"
                ></v-date-picker>
            </v-menu>
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
            tabla: 'usuario',
            dates:
            {
                email_verified_at: 	 null,
	 	 	 	created_at: 	 null,
	 	 	 	updated_at: 	 null,
            },
            pickers:
            {
                email_verified_at: 	 null,
	 	 	 	created_at: 	 null,
	 	 	 	updated_at: 	 null,
            },
            form:
            {
                id: 	null,
				nb_nombres: 	null,
				nb_usuario: 	null,
				password: 	null,
				tx_email: 	null,
				tx_foto: 	null,
				id_tipo_usuario: 	null,
				tx_observaciones: 	null,
				verification: 	null,
				email_verified_at: 	null,
				remember_token: 	null,
				api_token: 	null,
				id_status: 	null,
				id_usuario: 	null,
				created_at: 	null,
				updated_at: 	null,
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
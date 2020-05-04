<template>
  
    <v-form v-model="valid" ref="registerForm" >

    <v-card height="400" :loading="loading" tile>
        
        <v-card-title>
            <v-spacer></v-spacer>
            <span class="headline">Ingresa Aqui</span>  
            <v-spacer></v-spacer>
        </v-card-title>

        <v-card-text class="px-6 pt-4">

            <v-flex xs12>
                <v-text-field
                    color="cyan darken-3"
                    prepend-inner-icon="mdi-account"
                    label="Usuario o Email"
                    hint="Indique el usuario o correo registrado"
                    type="text"
                    v-model="form.nb_usuario"
                    :rules="[rules.required]"
                    dense
                    filled  >
                </v-text-field>
            </v-flex>

            <v-flex xs12>
                <v-text-field
                    color="cyan darken-3"
                    prepend-inner-icon="mdi-lock"
                    :append-icon="show ? 'visibility_off' : 'visibility'"
                    @click:append="show = !show"
                    label="Password"
                    hint="Debe contener letras y numeros y una longitud minima de 8 caracteres"
                    :type="show ? 'text' : 'password'"
                    v-model="form.password"
                    :rules="rules.password"
                    dense
                    filled  >
                </v-text-field>
            </v-flex>

        </v-card-text>

        <v-card-actions class="px-6">

            <v-row >
                <v-col cols="12">
                    <v-btn block dark color="#00ad45" depressed tile :loading="loading" @click="login()">Ingresar</v-btn>
                </v-col>
            
                <v-col cols="12" v-if="!emailResend">
                    <v-btn class="text--secondary" text x-small block :loading="loading" @click="$emit('setTab', 2)">
                        Recuperar Password?
                    </v-btn>
                </v-col>

                <v-col cols="12" v-else>
                    <v-btn v-if="emailResend" block dark small tile color="amber" depressed :loading="loading" @click="resendEmail()">
                        Renviar Correo de Activacion
                    </v-btn>
                </v-col>
            </v-row>

        </v-card-actions>
        
    </v-card>

    </v-form>

</template>

<script>
import AppRules from '@mixins/AppRules'

export default {
    mixins: [ AppRules ],
    data () 
	{
        return {
            form:{
                nb_usuario: '',
                password  :   '',
            },
            show: false,
            loading: false,
            valid: '',
            emailResend: false,
            hash: '',

        }
    },
    methods: {

        login()
        {
            if (!this.$refs.registerForm.validate())  return 
            
            this.loading = true
            
            this.$store.dispatch('login', this.form)
            .then(response => {
              
                if(response.status == 200)
                {
                    this.$refs.registerForm.reset();
                    this.$router.push('/');
                }

            }).catch(error =>
            {
                console.log('el error', error, error.response.status, error.response.data)
                if(error.hasOwnProperty('response'))
                {
                    if(error.response.status == 403 && error.response.data.verification)
                    {
                        this.showError('Usuario Inactivo, Favor ingrese a su corrreo para activarlo');
                        this.emailResend = true
                        this.hash = error.response.data.verification
                        return
                    }
                }
                
                this.showError(error);
            })
            .then(() => 
            {
                this.loading = false
            })

        },

        resendEmail()
        {           
            this.loading = true
            this.form.hash = this.hash
            
            this.$store.dispatch('resendEmail', this.form)
            .then(response => {
              
                if(response.status == 200 )
                {
                    if( response.data.tipo == 'success' )
                    {
                        this.showMessage( response.data.msj );
                        this.emailResend = false
                    } 
                    else 
                    {
                        this.showError(response.data.msj)
                    }
                }

            }).catch(error =>
            {
                this.showError(error);
            })
            .then(() => 
            {
                this.loading = false
            })
        }
    }

}
</script>

<style>
#register-container{
    height: 92.8vh;
}

</style>
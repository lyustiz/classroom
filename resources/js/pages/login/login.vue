<template>

    <div  class="grey lighten-4 holder">

    <v-row class="fill-height" >
    
    <v-col md="12">

        <v-form v-model="valid" ref="registerForm" >
        
        <v-card class="mx-auto elevation-8 mt-5" max-width="320" :loading="loading">
            
            <v-card-title primary-title class="cyan darken-3 white--text">
               <h4>Ingreso</h4><v-icon class="mx-2" color="white">mdi-login-variant</v-icon>
            </v-card-title>

            <v-divider></v-divider>
        
            <v-card-text class="px-6">

                <v-flex xs12 class="mt-4">
                    <v-text-field
                        color="cyan darken-3"
                        prepend-inner-icon="mdi-account"
                        label="Usuario o Email"
                        hint="Indique el usuario o correo registrado"
                        type="text"
                        v-model="form.nb_usuario"
                        :rules="[rules.required]"
                        dense
                        rounded
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
                        rounded
                        filled  >
                    </v-text-field>
                </v-flex>

            </v-card-text>

            <v-card-actions class="white px-6 pb-4">


                <v-row >
                    <v-col cols="12">
                        <v-btn block dark small color="cyan darken-3" :loading="loading" @click="login()">Ingresar</v-btn>
                    </v-col>
                    <v-col cols="4">
                        <v-btn text x-small color="cyan darken-3" :loading="loading" @click="$router.push('tipocuenta')">
                            Registro<v-icon class="mx-1">mdi-account-plus-outline</v-icon>
                        </v-btn>
                    </v-col>
                    <v-col cols="8">
                        <v-btn text x-small color="cyan darken-3" :loading="loading" @click="$router.push('recover-password')">
                            Recuperar Password<v-icon class="mx-1">mdi-account-key</v-icon>
                        </v-btn>
                    </v-col>
                    <v-col cols="12" v-if="emailResend">
                        <v-btn block text x-small color="amber" :loading="loading" @click="resendEmail()">
                            Renviar Correo de Activacion<v-icon class="mx-1">mdi-email-send</v-icon>
                        </v-btn>
                    </v-col>

                </v-row>

     
                
                <!-- <v-spacer></v-spacer>
                <v-tooltip top >
                    <template v-slot:activator="{ on }">
                        <v-btn fab dark x-small color="red" v-on="on" class="mx-1" :loading="loading"><v-icon>mdi-google</v-icon></v-btn>
                    </template>
                    <span>Ingresar con Google</span>
                </v-tooltip>

                <v-tooltip top>
                    <template v-slot:activator="{ on }">
                        <v-btn fab dark x-small color="primary" v-on="on" class="mx-1" :loading="loading"><v-icon>mdi-facebook</v-icon></v-btn>
                    </template>
                    <span>Ingresar con Facebook</span>
                </v-tooltip>

                <v-tooltip top>
                    <template v-slot:activator="{ on }"> 
                        <v-btn fab dark x-small color="info" v-on="on" class="mx-1" :loading="loading"><v-icon>mdi-twitter</v-icon></v-btn>
                    </template>
                    <span>Ingresar con Twitter</span>
                </v-tooltip>      -->

            </v-card-actions>
           
        </v-card>

        </v-form>

    </v-col>
    

</v-row>
</div>

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
.holder {
    min-height: 95vh;
    background-image: url('/images/carrito-pc.jpg');
    background-position: center center;
    background-repeat: no-repeat;
    background-attachment: fixed;
    background-size: cover;
}

</style>
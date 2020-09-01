<template>
    
    <v-col md="12">

        <v-form v-model="valid" ref="registerForm" >
        
        <v-card class="mx-auto elevation-8 mt-5 form-login" max-width="320" :loading="loading" color="rgba(255,255,255,0.9)">

            <v-card-title class="mx-1">
                <v-spacer></v-spacer>
                <v-chip dark color="orange" class="title-login">INGRESO</v-chip>
                <v-spacer></v-spacer>
            </v-card-title>

            <v-card-text class="px-6">

                <v-flex xs12 class="mt-4">
                    <v-text-field
                        color="indigo"
                        prepend-inner-icon="mdi-account"
                        label="Usuario"
                        hint="Indique el usuario"
                        type="text"
                        v-model="form.nb_usuario"
                        :rules="[rules.required]"
                        filled
                        rounded
                        :readonly="loading"
                          >
                    </v-text-field>
                </v-flex>

                <v-flex xs12>
                    <v-text-field
                        color="indigo"
                        prepend-inner-icon="mdi-lock"
                        :append-icon="show ? 'visibility_off' : 'visibility'"
                        @click:append="show = !show"
                        label="Password"
                        hint="Debe contener letras y numeros y una longitud minima de 8 caracteres"
                        :type="show ? 'text' : 'password'"
                        v-model="form.password"
                        :rules="rules.password"
                        filled
                        rounded
                        :readonly="loading"
                        >
                    </v-text-field>
                </v-flex>

            </v-card-text>

            <v-card-actions class="px-6 pb-4">

                <v-row>

                    <v-col cols="12">
                        <v-btn block dark small color="indigo" :loading="loading" @click="login()">Ingresar</v-btn>
                    </v-col>
                   
                    <v-col cols="12">
                        <v-btn block text small color="indigo" :disabled="loading" @click="$router.push('recover-password')">
                            Recuperar Password
                        </v-btn>
                    </v-col>
                   
                </v-row>

            </v-card-actions>
           
        </v-card>

        </v-form>

    </v-col>

</template>

<script>
import AppRules from '@mixins/AppRules'

export default {
    mixins: [ AppRules ],

    creted()
    {
          this.$store.commit('setLayout', 'login-layout' )
          
    },
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

                    this.redirectTo(response)
                }

            }).catch(error =>
            {                
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
        },

        redirectTo(data)
        {
            let userType = parseInt(data.userType); 

            console.log(userType)
            
            switch (userType) {
                case 1:
                    this.navegateTo('/home');
                    break;
                case 2:
                    this.navegateTo('/bandeja-docente');
                    break;
                case 3:
                    this.navegateTo('/bandeja-alumno');
                    break;
                case 4:
                    this.navegateTo('/bandeja-acudiente');
                    break;
                default:
                    this.showError('Usuario no Autorizado')
                    break;
            }

        }

        
    }

}
</script>

<style>
.form-login{
    border-radius: 20px !important;
}

.title-login{
    width: 100%;
    justify-content: center;
}

</style>
<template>

    <v-form v-model="valid" ref="form" >
    
    <v-card height="400" :loading="loading" tile>
        
    <v-card-title>
        <v-spacer></v-spacer>
        <span class="headline">Recuperar Password</span>  
        <v-spacer></v-spacer>
    </v-card-title> 
    
        <v-card-text class="pa-5">

            <p class="mt-4 mb-6">
                Indique su direccion de Correo registrada en el siguiente campo y le enviaeremos un Email con las instrucciones para recuperacion.
            </p>
            
            <v-flex xs12>
                <v-text-field
                    color="cyan darken-3"
                    prepend-inner-icon="mdi-email"
                    label="Correo"
                    hint="Indique cuenta de correo registrada"
                    type="text"
                    v-model="form.tx_email"
                    :rules="rules.email"
                    persistent-hint
                    dense
                    filled  >
                </v-text-field>
            </v-flex>

            <template v-if="resetForm">
            <v-flex xs12>
            <v-text-field
                    color="cyan darken-3"
                    prepend-inner-icon="mdi-lock"
                    :append-icon="show ? 'visibility_off' : 'visibility'"
                    @click:append="show = !show"
                    label="Nuevo Password"
                    hint="Debe contener letras y numeros y una longitud minima de 8 caracteres"
                    :type="show ? 'text' : 'password'"
                    v-model="form.password"
                    :rules="rules.password"
                    dense
                    rounded
                    filled  >
                </v-text-field>
            </v-flex>

            <v-flex xs12>
                <v-text-field
                    color="cyan darken-3"
                    prepend-inner-icon="mdi-lock"
                    label="Reescribir password"
                    :type="show ? 'text' : 'password'"
                    v-model="form.passwordRew"
                    :rules="rules.password_confirmation"
                    :disabled="passwordValid"
                    dense
                    rounded
                    filled  >
                </v-text-field>
            </v-flex>

            <v-flex xs12>
                <v-textarea
                    prepend-inner-icon="mdi-account-key"
                    label="Codigo Recuperacion"
                    hint="Codigo de recuperacion enviado al Correo"
                    v-model="form.hash"
                    :rules="[rules.required]"
                    dense
                    outlined
                    filled
                    rows="2"
                ></v-textarea>
            </v-flex>
            </template>

        </v-card-text>
        
        <v-card-actions class="white px-6">
            
            <v-row>
            <v-col cols="12" v-if="resetForm">
                <v-btn  block dark tile color="warning"  depressed :loading="loading" @click="resetPassword()">
                    Cambiar Password
                </v-btn>
            </v-col>
            
            <v-col cols="12" v-else>
                <v-btn  block dark tile color="#00ad45" depressed :loading="loading" @click="recoverPassword()" >
                    Recuperar Contraseña
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
            valid: '',
            form: {
                tx_email:    '', 
                password:    '',
                passwordRew: '',
                hash:         ''
            },
            loading:    false,
            resetForm:  false
        }
    },

    methods: {
        recoverPassword()
        {           
            if (!this.$refs.form.validate())  return 

            this.loading = true
            
            this.$store.dispatch('recoverPassword', this.form)
            .then(response => {
              
                if(response.status == 200 )
                {
                    if( response.data.tipo == 'success' )
                    {
                        this.showMessage( response.data.msj );
                        
                        this.resetForm = true

                    } else 
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

        resetPassword()
        {           
            if (!this.$refs.form.validate())  return 

            this.loading = true
            
            this.$store.dispatch('resetPassword', this.form)
            .then(response => {
              
                if(response.status == 200 )
                {
                    if( response.data.tipo == 'success' )
                    {
                        this.showMessage( response.data.msj );
                       
                        setTimeout(() => {
                            this.$router.replace('/login');
                        }, 1000);

                    } else 
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
    }
}
</script>

<style scoped>
#full-container{
    height: 92.8vh;
}
#input-40 {
    font-size: 0.8rem !important;
  }
</style>
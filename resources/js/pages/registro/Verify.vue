<template>

    <div  class="grey lighten-4 holder">

    <v-row class="fill-height" >
    
    <v-col md="12">

        <v-form v-model="valid" ref="registerForm" >
        
        <v-card class="mx-auto elevation-8 mt-5" max-width="320" color="rgba(255,255,255,0.9)">
            
            <v-card-title primary-title class="cyan darken-3 white--text">
               <h4>Verificacion de la Cuenta</h4><v-icon class="mx-2" color="white">mdi-account-check</v-icon>
            </v-card-title>

            <v-divider></v-divider>
        
            <v-card-text class="pa-5">
      
               
                <v-btn block large :loading="loading" color="success" class="mt-5" @click="verify()">
                    <v-icon l size="40" class="mx-2">mdi-account-check</v-icon>
                    Verificar Cuenta
                </v-btn>

   
            </v-card-text>
           
           <v-card-actions class="mb-3">

               <v-flex xl-12 class="mx-2 mb-3" v-if="resend === true">
                    <v-btn dark :loading="loading" block color="cyan darken-3" @click="resendEmail()">
                        Reenviar Correo<v-icon class="mx-2">mdi-email-send</v-icon>
                    </v-btn>
                </v-flex> 

            </v-card-actions>
           
        </v-card>

        </v-form>

    </v-col>
    

</v-row>
</div>

</template>

<script>

export default {

    data () 
	{
        return {
            valid: '',
            form: {
                hash:  this.$route.params.hash,  
            },
            loading: false,
            resend:  false
        }
    },

    methods: {
        verify()
        {           
            this.loading = true
            
            this.$store.dispatch('verify', this.form)
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

                    this.resend = response.data.resend
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

        resendEmail()
        {           
            this.loading = true
            
            this.$store.dispatch('resendEmail', this.form)
            .then(response => {
              
                if(response.status == 200 )
                {
                    if( response.data.tipo == 'success' )
                    {
                        this.showMessage( response.data.msj );
                        
                        setTimeout(() => {
                            this.$router.replace('/');
                        }, 1000);
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

<style scoped>
#full-container{
    height: 92.8vh;
}
</style>
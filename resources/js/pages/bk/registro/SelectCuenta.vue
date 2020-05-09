<template>

    <div  class="grey lighten-4 holder">

    <v-row class="fill-height" >
    
    <v-col md="12">

        <v-form v-model="valid" ref="registerForm" >
        
        <v-card class="mx-auto elevation-8 mt-5" max-width="320" color="rgba(255,255,255,0.9)">
            
            <v-card-title primary-title class="cyan darken-3 white--text">
               <h4>Indique tipo de Cuenta</h4><v-icon class="mx-2" color="white">mdi-account-question</v-icon>
            </v-card-title>

            <v-divider></v-divider>
        
            <v-card-text class="pa-6">
                <router-link to="registro-usuario" class="select-account">
                <v-alert dark border="left" color="success" tile class="py-3 my-4 align-center " >
                    <v-icon size="60" class="mx-2">mdi-account</v-icon><span class="display-1">  Usuario</span>
                </v-alert>
                </router-link>

                <router-link to="registro-comercio" class="select-account">
                <v-alert dark border="left" color="warning" tile class="py-3 my-4 align-center ">
                    <v-icon size="60" class="mx-2">mdi-storefront</v-icon> <span class="display-1" > Comercio</span>
                </v-alert>
                </router-link>

            </v-card-text>
           
           <v-card-actions class="mb-3">
                <v-flex xl-12 class="mx-2 mb-3">
                    <v-btn text block x-small color="cyan darken-3" @click="$router.push('login')">
                        Ingresar<v-icon>mdi-login-variant</v-icon>
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
import AppRules from '@mixins/AppRules'

export default {
    mixins: [ AppRules ],

    data () 
	{
        return {
            valid: ''
        }
    },
}
</script>

<style scoped>
#full-container{
    height: 92.8vh;
}
.select-account{
    text-decoration: none;
}

</style>
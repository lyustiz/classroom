<template>

    <v-form v-model="valid" ref="registerForm" >
    
    <v-card height="400" :loading="loading" tile>
        
        <v-card-title>
            <v-spacer></v-spacer>
            <span class="headline">Seleccione tipo de Cuenta</span>  
            <v-spacer></v-spacer>
        </v-card-title>
    
        <v-card-text class="pa-6">
            <router-link to="registro-usuario" class="select-account">
            <v-alert dark color="success" tile class="py-3 my-4 align-center " >
                <v-icon size="50" class="mx-2">mdi-account</v-icon><span class="display-1">  Usuario</span>
            </v-alert>
            </router-link>

            <router-link to="registro-comercio" class="select-account">
            <v-alert dark color="warning" tile class="py-3 my-4 align-center ">
                <v-icon size="50" class="mx-2">mdi-storefront</v-icon> <span class="display-1" > Comercio</span>
            </v-alert>
            </router-link>

        </v-card-text>
        
        <v-card-actions class="mb-3">
            <v-col cols="12">
            <v-btn class="text--secondary" text x-small block :loading="loading" @click="$emit('setTab', 0)">
                Ingresar?
            </v-btn>
            </v-col>
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
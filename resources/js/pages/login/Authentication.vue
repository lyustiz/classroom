<template>

<div  class="grey lighten-4 holder d-flex align-content-center align-center" >

    <v-container>

        <v-row no-gutters>

            <v-col cols="3">
                <v-img class="white--text align-end" height="400px" src="images/authenticate.jpg"  lazy-src="images/authenticate_load.jpg"></v-img>
            </v-col>

            <v-col cols="3">

                <v-tabs dark vertical grow height="400" background-color="#00ad45" icons-and-text v-model="tabs">
                    <v-tab>
                        Login
                        <v-icon size="32">mdi-account</v-icon>
                        
                    </v-tab>
                    <v-tab>
                        Register
                        <v-icon size="32">mdi-account-edit</v-icon>
                        
                    </v-tab>
                    <v-tab>
                         Recuperar Password
                        <v-icon size="32">mdi-lock-open</v-icon>
                       
                    </v-tab>

                </v-tabs>

            </v-col>

            <v-col cols="6">

                <auth-login v-if="tabs == 0" @setTab="setTab($event)"></auth-login>

                <select-acount v-if="tabs == 1" @setTab="setTab($event)"></select-acount>

                <auth-recover v-if="tabs == 2" @setTab="setTab($event)"></auth-recover>
       
            </v-col>

        </v-row>

    </v-container>

</div>

</template>

<script>
import AppRules         from '@mixins/AppRules'
import Login            from  '@pages/login/AuthLogin.vue';
import SelectAccount    from  '@pages/login/AuthSelectAccount';
import Recover          from  '@pages/login/AuthRecover';

export default {
    components: {
        'auth-login' : Login,
        'select-acount': SelectAccount,
        'auth-recover' : Recover
    },

    data()
    {
        return {
            tabs: 0
        }
    },

    methods:
    {
        setTab(tab)
        {
            this.tabs = tab;
        }

    }

}
</script>

<style>
#register-container{
    height: 92.8vh;
}

</style>
<template>
<v-container fluid >

    <v-tabs show-arrows icons-and-text :color="color">

        <v-tab>
            Seguridad <v-icon>mdi-shield-edit</v-icon>
        </v-tab>
        <v-tab>
            Informacion <v-icon>mdi-account-edit</v-icon>
        </v-tab>
        <v-tab>
            Email <v-icon>mdi-email-edit</v-icon>
        </v-tab>

        <v-tab-item class="my-3">
            <password-form></password-form>
        </v-tab-item>

        <v-tab-item class="my-3">
            <info-form></info-form>
        </v-tab-item>

        <v-tab-item class="my-3">
            <email-form></email-form>
        </v-tab-item>

    </v-tabs>
                    
</v-container>
</template>

<script>

import PasswordForm from './forms/account/PasswordForm';
import InfoForm from './forms/account/InfoForm';
import EmailForm from './forms/account/EmailForm';

export default {

    components:{
        'password-form': PasswordForm,
        'info-form':     InfoForm,
        'email-form':    EmailForm
    },
    props:
    {
        color:{
            type:       String,
            default:    'info'
        },
    },
    data(){
        return {
            data: null,
            tab: 2
        }
    }
}
</script>

<style>

</style>
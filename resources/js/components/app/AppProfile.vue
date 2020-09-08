<template>

   <v-card flat>

       <v-card-text class="text-center">
            <v-list-item class="indigo lighten-5 mb-2 rounded-lg">
                <v-list-item-title v-text="user.nb_nombres"></v-list-item-title>
                <v-list-item-action>
                    <item-menu 
                        :menus="itemsMenu" 
                        iconColor="grey" 
                        btnColor="white" 
                        :item="user"
                        @onItemMenu="onItemMenu($event)" 
                    ></item-menu> 
                </v-list-item-action>
            </v-list-item>
           
            <v-avatar size="145" color="indigo">
                 <v-img :src="foto.full_url" alt="alt" v-if="foto" aspect-ratio="32/43" ></v-img>
                 <v-icon size="145" dark v-else>mdi-account</v-icon>
            </v-avatar>
       </v-card-text>

        <v-dialog v-model="dialogUpdateAccount" max-width="500" content-class="rounded-xl">
            <app-account v-if="dialogUpdateAccount" @closeDialog="closeDialog($event,'dialogUpdateAccount')"></app-account>
        </v-dialog>
       
   </v-card>
   
</template>

<script>

import AppAccount from '@components/account/AppAccount'

export default {

    components:
    {
        'app-account' :    AppAccount
    },

    computed: {

        foto() 
        {
            return this.$store.getters['getFoto']
        },

        user()
        {
            return this.$store.getters['getUser']
        },
    },

    data () {
            return {
                itemsMenu: [
                    { action: 'updateAccount',    icon: 'mdi-account-edit',  label: 'Editar Cuenta' },
                ],
                dialogUpdateAccount: false
            }
    },

    methods: {
        updateAccount()
        {
            this.dialogUpdateAccount = true 
        },

        closeDialog(dialog)
        {
            this.dialogUpdateAccount = false
        }
    }

}
</script>

<style>

</style>
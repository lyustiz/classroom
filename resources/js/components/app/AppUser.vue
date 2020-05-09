<template>
<div class="text-xs-center">
    <v-dialog v-model="showDialog" width="320">
    <template v-slot:activator="{ on }">
        <v-btn icon v-on="on">
            <v-icon >account_circle</v-icon>
        </v-btn>
    </template>

    <v-card :loading="loading">
        <v-card-title
            class="cyan darken-3 white--text"
            primary-title
        >
            {{user.nb_nombre}}
            <v-spacer></v-spacer>
                <v-btn icon x-small  dark @click="showDialog = false"><v-icon>mdi-close-circle</v-icon></v-btn> 
        </v-card-title>

        <v-list nav>
        <v-list-item-group>

            <v-list-item disabled class="grey lighten-3">
                <v-list-item-avatar>
                    <v-icon class="grey lighten-1 white--text">mdi-account</v-icon>
                </v-list-item-avatar>

                <v-list-item-content>
                    <v-list-item-title>{{ user.nb_usuario }}</v-list-item-title>
                    <v-list-item-subtitle>{{ user.tx_email }}</v-list-item-subtitle>
                </v-list-item-content>
            </v-list-item>

            <v-list-item ripple @click="administrar()">
                <v-list-item-avatar>
                    <v-icon color="grey" size="36">mdi-cog</v-icon>
                </v-list-item-avatar>

                <v-list-item-content>
                    <v-list-item-title>Configurar Cuenta</v-list-item-title>
                </v-list-item-content>

                <v-list-item-action>
                    <v-btn icon ripple> 
                        <v-icon color="grey lighten-1">mdi-account-cog</v-icon>  
                    </v-btn>
                </v-list-item-action>
            </v-list-item>

        </v-list-item-group>
        </v-list>

        <v-divider></v-divider>

        <v-card-actions>
        <v-spacer></v-spacer>
        <v-btn
            color="error"
            text
            small
            :loading="loading"
            @click="logout()" >
            <v-icon>mdi-location-exit</v-icon>
            Cerrar Sesion
        </v-btn>
        </v-card-actions>
    </v-card>
    </v-dialog>
</div>
</template>

<script>
    export default {
        data () {
            return {
                showDialog: false,
                loading: false,
                comercioActivo: false,
            }
        },
        computed:
        {
            user(){
                return this.$store.getters['getUser']
            },
            
        },

        methods: 
        {
            logout()
            {
                if(this.loading) return
                
                this.loading = true
            
                this.$store.dispatch('logout')
                .then(response => {
                
                    if(response.status == 200)
                    {
                        this.showMessage(response.data)
                        this.$router.push('/').catch(()=>{});
                    }

                }).catch(error =>
                {
                    console.log(error);
                })
                .finally(() => (this.loading = false))

            },
            administrar()
            {
                this.$router.push('/cuenta').catch(()=>{});
                this.showDialog = false
            },

        }
    }
</script>
<template>
<div class="text-center">
    <v-dialog v-model="showDialog" width="365" content-class="rounded-xl">
    <template v-slot:activator="{ on }">
        <v-btn icon v-on="on">
            <v-icon >account_circle</v-icon>
        </v-btn>
    </template>

    <v-card :loading="loading" class="rounded-xl">
        <v-card-title
            class="indigo white--text"
        >
            Usuario
            <v-spacer></v-spacer>
                <v-btn icon x-small  dark @click="showDialog = false"><v-icon>mdi-close-circle</v-icon></v-btn> 
        </v-card-title>

        <v-list nav>

            <v-list-item  class="grey lighten-3">

                <app-foto-cuenta 
                    :origenId="user.id" 
                    :maxItems="1" 
                    :tipoFoto="4" 
                    :foto="(user.foto) ? user.foto : null "
                    :aspectRatio="32/43"
                    class="mr-2"
                    @updateImage="setFoto($event)">
                </app-foto-cuenta> 

                <v-list-item-content>
                    <v-list-item-title>{{ user.nb_usuario }}</v-list-item-title>
                    <v-list-item-subtitle>{{ user.tx_email }}</v-list-item-subtitle>
                </v-list-item-content>

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

        <v-list-item-group>
            
            <v-chip class="mb-1" color="green lighten-2" close dark :close-icon="profile.tx_icono"> Perfil: {{profile.nb_perfil}}</v-chip>

                <v-radio-group v-model="profile" row hide-details label="Perfiles: " >
                    <v-radio
                        v-for="profile in profiles"
                        :key="profile.id"
                        :off-icon="profile.tx_icono"
                        :on-icon="profile.tx_icono"
                        :prepend-icon="profile.tx_icono"
                        :value="profile"
                        color="success"
                        class="ml-3"
                    ></v-radio>
                </v-radio-group>

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

    <v-dialog v-model="dialogUpdateAccount" max-width="500" content-class="rounded-xl">
        <app-account v-if="dialogUpdateAccount" @closeDialog="closeDialog($event,'dialogUpdateAccount')"></app-account>
    </v-dialog>

</div>
</template>

<script>

    import AppAccount from '@components/account/AppAccount'

    export default {

        components:
        {
            'app-account' :    AppAccount
        },

        data () {
            return {
                showDialog: false,
                loading: false,
                comercioActivo: false,
                rol: 'Secretaria',
                itemsMenu: [
                    { action: 'updateAccount',    icon: 'mdi-account-edit',  label: 'Editar Cuenta' },
                ],
                dialogUpdateAccount: false
            }
        },
        computed:
        {
            user() {
                return this.$store.getters['getUser']
            },

            profile:
            {
                get() {
                    return this.$store.getters['getProfile']
                },
                set(profile) {
                    
                    this.showMessage('Se  ha establecido el Perfil: ' + profile.nb_perfil )
                    this.$store.commit('setProfile', profile)
                    this.showDialog = false
                    this.setHome(profile.nb_perfil)
                }
            },

            profiles()
            {
                return this.$store.getters['getProfiles'] 
            }
            
        },

        methods: 
        {
            setHome(profile)
            {
                let route = 'home'
                
                switch (profile) {
                    case 'docente':
                        route = 'bandeja-docente'
                        break;

                    case 'alumno':
                        route = 'bandeja-alumno'
                        break;
                    
                    case 'acudiente':
                        route = 'bandeja-acudiente'
                        break;
                    
                    case 'secretaria':
                        route = 'home'
                        break;
                }
                this.navegateToName(route)
            },
            
            logout()
            {
                if(this.loading) return
                
                this.loading = true
            
                this.$store.dispatch('logout')
                .then(response => {
                
                    if(response.status == 200)
                    {
                        this.showMessage(response.data)
                        this.navegateTo('/')
                    }

                }).catch(error =>
                {
                    console.log(error);
                })
                .finally(() => (this.loading = false))

            },

            setFoto(foto)
            {
                this.$store.commit('setFoto', foto)
            },

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
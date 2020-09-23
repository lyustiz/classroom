<template>

    <v-app-bar
        app
        :color="$App.theme.headApp"
        clipped-left
        dark
        dense
    >
        <!-- Logo -->
        <v-avatar size="32" color="white">
            <v-img src="/images/logo-sm.png" class="logo-holder" ></v-img>
        </v-avatar>

        <!-- Titulo-->
        <v-toolbar-title >
            <v-btn
                text 
                :color="$App.theme.textTitle" 
                v-text="$App.title" 
                >
            </v-btn>
        </v-toolbar-title>

        <!--Toggle Menu Lateral-->
        <v-app-bar-nav-icon @click.stop="toggleMenu =! toggleMenu"></v-app-bar-nav-icon>
        
        <v-spacer></v-spacer>

        <!-- Logged -->
        <template v-if="auth">
        
            <!-- Ayuda -->
            <v-tooltip bottom>
                <template v-slot:activator="{ on }">
                    <app-help v-on="on"></app-help>
                </template>
                <span>Ayuda</span>
            </v-tooltip>

            <!-- Mail -->
            <v-tooltip bottom>
                <template v-slot:activator="{ on }">
                    <v-icon v-on="on">mail</v-icon>
                </template>
                <span>Mensaje</span>
            </v-tooltip>

            <!-- Notificaciones -->
            <v-tooltip bottom>
                <template v-slot:activator="{ on }">
                    <app-notifications v-on="on"></app-notifications>
                </template>
                <span>Notificaciones</span>
            </v-tooltip>
            
            <!-- User -->
            <app-user></app-user>


        </template>

    </v-app-bar>

</template>
<script>
    import { mapMutations } from 'vuex';
    export default {
        computed: {
            auth()
            {
                return this.$store.getters['getAuth']
            },
            
            resize()
            {
                return this.$store.getters['getResize']
            },

            iconMenu:
            {
                get() {
                    return this.$store.getters['getIconMenu']
                },
                set(active) {
                    this.$store.commit('setIconMenu', active)
                }
            },

            toggleMenu:
            {
                get(){
                    return this.$store.getters['getToggleMenu']
                },
                set(active){
                    this.$store.commit('setToggleMenu', active)
                }
            },

            menus()
            {
                let menus = [
                ];
                
                if (this.$store.getters['getAuth'])
                {
                    menus.push({ name: 'Cuenta', route: '/cuenta'})
                }
                return menus;
            }
        },

        data(){
            return {
                loading : false,
                dropdown_font: ['Arial', 'Calibri', 'Courier', 'Verdana'],
            }
        },

    }
</script>
<style>

</style>

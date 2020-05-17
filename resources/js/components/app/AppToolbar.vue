<template>

    <v-app-bar
        app
        :color="$App.theme.headApp"
        clipped-left
        dark
        dense
    >
        <!--Titulo-->

        <v-avatar size="32" color="white" >
            <v-icon :color="$App.theme.headApp" size="28" @click="navegateTo('/')">mdi-chair-school</v-icon>
        </v-avatar>
        
        <v-toolbar-title >
            <v-btn
                text 
                :color="$App.theme.textTitle" 
                v-text="$App.title" 
                @click="navegateTo('/')">
            </v-btn>
        </v-toolbar-title>
        
        <!--Toggle iconos/texto-->
        <v-btn icon @click.stop=" iconMenu = ! iconMenu">
            <v-icon v-html="iconMenu ? 'chevron_left' : 'chevron_right'"></v-icon>
        </v-btn>
        
        <!--Toggle Menu Lateral-->
        <v-app-bar-nav-icon @click.stop="toggleMenu =! toggleMenu"></v-app-bar-nav-icon>

        <div class="flex-grow-1"></div>

        <!-- Logged -->
        <template v-if="auth">
            
        
            <!-- Ayuda -->
            <v-tooltip bottom>
                <template v-slot:activator="{ on }">
                    <v-btn small icon v-on="on">
                        <v-icon>help</v-icon>
                    </v-btn>
                </template>
                <span>Ayuda</span>
            </v-tooltip>

            <!-- Notificaciones -->
            <v-tooltip bottom>
                <template v-slot:activator="{ on }">
                    <v-btn small icon v-on="on">
                        <v-icon>notification_important</v-icon>
                    </v-btn>
                </template>
                <span>Notificaciones</span>
            </v-tooltip>

            <!-- User -->
            <app-user></app-user>
        </template>

        <!-- UnLogged -->
        <template v-else>
 
            <v-tooltip bottom>
                <template v-slot:activator="{ on }">
                    <v-btn small text v-on="on" @click="navegateTo('/login')">
                        <v-icon>mdi-login-variant</v-icon> Ingresar
                    </v-btn>
                </template>
                <span>Ingresar</span>
            </v-tooltip>
        </template>

         <v-app-bar-nav-icon @click="toggleFilter()" v-show="resize" ></v-app-bar-nav-icon>

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
            }
        },
        methods:{
            
            logout()
            {
                this.loading = true;
                axios.post('logout')
                .then(response =>{
                    localStorage.clear()
                    navegateTo('/');
                })
                .catch(error =>{
                    console.log('error', error)
                })
            },

            navegateTo(route)
            {
                this.$router.push(route).catch(err => {})
            }
        }
    }
</script>
<style>

</style>

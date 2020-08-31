<template>
    <div>
        <!-- App Toolbar -->
        <app-toolbar></app-toolbar>

        <!--Navegacion lateral-->
        <v-navigation-drawer
            :value="(toggleMenu)?toggleMenu:false"
            :mini-variant="iconMenu"
            :clipped="clipped"
            :fixed="fixed"
            app
            class="grey lighten-5"
        >
            <!--menu-->
           <app-menu></app-menu>

        </v-navigation-drawer>

        
        <!-- Contenido -->
        <v-main class="fill-height">
            <transition name="fade" mode="out-in" >
                <router-view></router-view>
            </transition>
        </v-main>

        <!--Mensaje Sistema-->
        <app-message></app-message>

        <app-asistente></app-asistente>

    
    </div>
</template>

<script>

import AppMenu from  '~/components/app/AppMenu';
import AppAsistente from  '@pages/asistente/AppAsistente';

export default 
{
    components: {
        'app-menu' : AppMenu,
        'app-asistente': AppAsistente
    },
    computed: 
    {
        toggleMenu() {
            return this.$store.getters['getToggleMenu']
        },

        iconMenu() {
            return this.$store.getters['getIconMenu']
        },

    },
    data()
    {
        return {
            clipped:     true,
            menu:        false,
            fixed:       false,
            items:       [],
            miniVariant: true,
        }
    }    
}
</script>

<style>

</style>

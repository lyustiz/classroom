<template>
    <div>
        <!-- App Toolbar -->
        <app-toolbar></app-toolbar>

        <!--Navegacion lateral-->
        <v-navigation-drawer
            :value="toggleMenu"
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
        <v-content class="fill-height">
            <transition name="fade" mode="out-in" >
                <router-view></router-view>
            </transition>
        </v-content>

        <!--Mensaje Sistema-->
        <app-message></app-message>
    </div>
</template>

<script>

import AppMenu from  '~/components/app/AppMenu';

export default 
{
    components: {
        'app-menu' : AppMenu
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
            menu:        true,
            fixed:       false,
            items:       [],
            miniVariant: true,
        }
    }    
}
</script>

<style>

</style>

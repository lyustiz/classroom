<template>
    <div>
        <!-- App Toolbar -->
        <app-toolbar></app-toolbar>

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

}
</script>

<style>

</style>

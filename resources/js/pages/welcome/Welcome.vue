<template>
<div v-cloak class="welcome-holder">

    <!-- Contenido -->
    <v-container fluid>

        <v-btn x-small fab top  absolute left dark color="#7c4fbc" class="mt-6" @click="showBarrio = !showBarrio">
            <v-icon>{{ (showBarrio) ? "mdi-card-bulleted-off" : "mdi-card-bulleted"}}</v-icon>
        </v-btn>

        <div v-if="showBarrio" transition="scale-transition" >
        
        <v-row no-gutters class="mb-4 mt-4" >
            <!-- Logo -->
            <v-col md="2"  class=" d-none d-xs-none d-sm-none d-md-flex d-lg-flex">  
                <img :src="logo" alt="" srcset="" class="logo-ppal">
            </v-col>

            <!-- Publicidad-->
            <v-col md="10" sm="12" xs="12" class="">  
                <list-publicidad></list-publicidad>
            </v-col>
        </v-row>
        </div>
    
        <!-- Title Despachos Barrio -->
        <v-row no-gutters class="mt-9">
             <v-col cols="12" class="d-flex justify-center">
                 <img :src="barrio" alt="" srcset="" class="banner-image align-self-center">
             </v-col>
         </v-row>

        <!-- Categorias | Comercios -->
        <v-row class="mt-n1">
            <v-col>
                <list-categoria></list-categoria>
            </v-col>
        </v-row>

        <!-- Title Despachos Cali -->
        <v-row no-gutters class="mt-6">
             <v-col cols="12" class="d-flex justify-center">
                 <img :src="cali" alt="" srcset="" class="banner-image align-self-center">
             </v-col>
         </v-row>
        
        <!-- Comercios Despacho todo Cali -->
        <v-row class="mt-2">
            <v-col>
                <list-comercios-cali></list-comercios-cali>
            </v-col>
        </v-row>

    </v-container>

    <!-- Contenedor de  Filtros -->
    <v-navigation-drawer :value="showFilter" app clipped right class="grey lighten-5">
        <app-filters></app-filters> 
    </v-navigation-drawer>

</div>
</template>

<script>
import { mapGetters, mapActions } from 'vuex';
import ListCategoria from '@components/categoria/ListCategoria';
import ListComerciosCali from '@components/comercio/ListComerciosCali';
import ListPublicidad from '@components/publicidad/ListPublicidad';

import AppData from '@mixins/AppData';
import AppMessage from '@mixins/AppMessage';

export default {
    mixins: [AppData, AppMessage],
    components: 
    { 
        'list-categoria':     ListCategoria,
        'list-publicidad':    ListPublicidad,
        'list-comercios-cali': ListComerciosCali
    },
    computed: 
    { 
        ...mapGetters(['showFilter']),
        small()
        {
            return this.$vuetify.breakpoint.xsOnly
        },
    },
    data () 
	{
        return {
            logo:   require('~/assets/img/logo.png'),
            barrio: require('~/assets/img/welcome/despacho-barrio.png'), 
            cali:   require('~/assets/img/welcome/despacho-cali.png'),
            showBarrio: true
        }
    },
    
}
</script>

<style>

.title-banner {
    background-repeat: no-repeat;
    background-size: 26% 100%; 
    height: 5vh;
    width: 75vw;
    z-index: 99;
    position: absolute;
    left: auto;
    right: auto;
}
.banner-image
{
    height: auto;
    width: 15rem;
    z-index: 4;
    position: absolute;

}

.title-banner-m {
    background-repeat: no-repeat;
    background-color: white;
    background-size: 100% 100%; 
    min-height: 2.9rem;
}

.despacho-barrio-m {
    background-image: url('/images/despacho-barrio-m.jpg'); 
}

.despacho-cali-m {
    background-image: url('/images/despacho-barrio-m.jpg'); 
}

.logo-ppal{
    position: absolute; 
    z-index: 4;
    width: 29vw;
    height: auto;
}

.welcome-holder{
    min-height: 100vh;
    background-position: center center;
    background-repeat: no-repeat;
    background-attachment: fixed;
    background-size: cover;
    background-color: rgba(255, 255, 255, 0.5);
    background: url('/images/welcome.jpg');
}

</style>

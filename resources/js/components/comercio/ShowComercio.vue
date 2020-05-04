<template>
<div>

    <v-row>

        <v-col xs="2" class="mx-3" id="listComercios"> 
            <v-chip label class="purple--text mr-1">
                <v-icon class="purple--text mr-1">mdi-storefront</v-icon> 
                 Busqueda por Nombre 
            </v-chip>
        </v-col>
        
    </v-row>

    <v-divider></v-divider>

    <v-row no-gutters> 
        
        
        <template v-if="!getComercioById">
            <v-col :lg="cols.lg" :md="cols.md" :sm="cols.sm" :xs="cols.xs" >
                <v-skeleton-loader type="card" class="ma-3"> </v-skeleton-loader>
            </v-col>
           
        </template>

        
        <v-col :lg="cols.lg" :md="cols.md" :sm="cols.sm" :xs="cols.xs">
            
            <app-comercio :comercio="getComercioById"></app-comercio>

        </v-col>

    </v-row>

</div>
</template>

<script>

import { mapGetters } from 'vuex';
import AppComercio from '@components/comercio/AppComercio';

export default 
{
    components: { 
        'app-comercio': AppComercio, 
    },

    props:
    {
        cols: {
            type:       Object,
            default:    () =>  {  return { lg: 4, md: 4, sm: 6, xs: 12 } }
        }
    },

    mounted()
    {
        this.$vuetify.goTo('#listComercios', { duration: 2000, offset: 5 } )
    },

    computed: 
    {
        ...mapGetters(['getComercioById']),
        getComercios()
        {
            return this.$store.getters['getComercios'];
        },

        countComercios()  
        {
            return this.$store.getters['countComercios'];
        }
    },

}
</script>


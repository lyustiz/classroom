<template>
<div id="listComerciosCali">

<v-sheet v-if="!categoria && getComercioById && getComercioCali" color="purple lighten-5" min-height="400" tile >
            
            <v-fade-transition>
                <show-comercio></show-comercio>
            </v-fade-transition>

</v-sheet>

<v-sheet color="purple lighten-5" v-else > 

    <v-row>

        <v-col xs="2" class="mx-3" id="listComerciosCali"> 
            <v-chip label class="purple--text mr-1">
                <v-icon class="purple--text mr-1">mdi-storefront</v-icon> 
                 {{ (categoria) ? countComercios: 0 }} Comercios Listados 
            </v-chip>
        </v-col>

        <v-col xs="10" v-if="!getComercioById && categoria">
            <v-chip class="my-1" close small dark color="purple" @click:close="clearCategoria()">
                <v-avatar left>
                    <v-icon class="mx-2">{{ getCategoriaById(categoria).tx_icono }}</v-icon>
                </v-avatar>
                 {{ getCategoriaById(categoria).nb_categoria }} 
            </v-chip> 
        </v-col>
        
    </v-row>

    <v-divider></v-divider>

    <v-row no-gutters v-if="categoria"> 
        
        
        <template v-if="countComercios < 1">
            <v-col :lg="cols.lg" :md="cols.md" :sm="cols.sm" :xs="cols.xs" >
                <v-skeleton-loader type="card" class="ma-3"> </v-skeleton-loader>
            </v-col>
        </template>

        
        <v-col :lg="cols.lg" :md="cols.md" :sm="cols.sm" :xs="cols.xs" v-for="(comercio, i) in getComercios" :key="i" >
            
            <app-comercio :comercio="comercio"></app-comercio>

        </v-col>

    </v-row>

</v-sheet>
</div>
</template>

<script>

import { mapGetters } from 'vuex';
import AppComercio from '@components/comercio/AppComercio';
import ShowComercio from '@components/comercio/ShowComercio';

export default 
{
    components: { 
        'app-comercio': AppComercio, 
        'show-comercio': ShowComercio
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
        this.$vuetify.goTo('#listComerciosCali', { duration: 2000, offset: 5 } )
      

    },
  
    computed: 
    {
        ...mapGetters(['getCategoriaById', 'getComercioById', 'getComercioCali']),

        categoria:
        {
            get() {
                return this.$store.getters['getCategoriaCali']
            },
            set(categoria) {
                this.$store.commit('setCategoriaCali', categoria )
                this.$store.commit('setCategoria', null )
            }
        },

        getComercios()
        {
            return this.$store.getters['getComercios'];
        },

        countComercios()  
        {
            return this.$store.getters['countComercios'];
        }
    },

    methods:
    {
        clearCategoria()
        {
            this.$store.commit('setCategoriaCali', null) 
        }
    }

}
</script>


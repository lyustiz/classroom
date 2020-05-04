<template>
<div>

    <v-row>

        <v-col xs="2" class="mx-3" id="listComercios"> 
            <v-chip label class="cyan--text mr-1">
                <v-icon class="cyan--text mr-1">mdi-storefront</v-icon> 
                 {{countComercios}} Comercios Listados 
            </v-chip>
        </v-col>

        <v-col xs="10" >
            <v-chip class="my-1" close small dark color="cyan" @click:close="categoria = null">
                <v-avatar left>
                    <v-icon class="mx-2">{{ getCategoriaById(categoria).tx_icono }}</v-icon>
                </v-avatar>
                 {{ getCategoriaById(categoria).nb_categoria }} 
            </v-chip> 
        </v-col>
        
    </v-row>

    <v-divider></v-divider>

    <v-row no-gutters> 
        
        
        <template v-if="countComercios < 1">
            <v-col :lg="cols.lg" :md="cols.md" :sm="cols.sm" :xs="cols.xs" >
                <v-skeleton-loader type="card" class="ma-3"> </v-skeleton-loader>
            </v-col>
        </template>

        
        <v-col :lg="cols.lg" :md="cols.md" :sm="cols.sm" :xs="cols.xs" v-for="(comercio, i) in getComercios" :key="i" >
            
            <app-comercio :comercio="comercio"></app-comercio>

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
        ...mapGetters(['getCategoriaById']),

        categoria:
        {
            get() {
                return this.$store.getters['getCategoria']
            },
            set(categoria) {
                this.$store.commit('setCategoria', categoria )
                this.$store.commit('setCategoriaCali', null )
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

}
</script>


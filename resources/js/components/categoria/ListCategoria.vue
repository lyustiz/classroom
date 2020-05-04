<template>

    <v-sheet elevation="4">

        <v-slide-group v-model="categoria" class="pa-4" show-arrows center-active>
        
            <v-slide-item v-for="(categoria, i) in getCategorias" :key="i"  v-slot:default="{ active, toggle }" :value="categoria.id">
                
                <v-card
                :color="active ? 'primary' : 'grey lighten-1'"
                class="ma-3"
                height="190"
                width="200"
                @click="toggle">
                
                    <v-img class="white--text align-end" height="200px" :src="fotoUrl+categoria.tx_foto" align="center" justify="center">
                        <v-scale-transition>
                        <v-icon v-if="active" color="white" size="48">mdi-close-circle-outline</v-icon>
                        </v-scale-transition>
                    </v-img> 
                </v-card>

            </v-slide-item>

        </v-slide-group>

    <v-expand-transition>
        <v-sheet v-if="categoria && !getComercioCali"  color="blue lighten-5" min-height="400" tile>

            <v-fade-transition>
                <list-comercio></list-comercio>
            </v-fade-transition>

        </v-sheet>
    </v-expand-transition>

    <v-expand-transition>
        <v-sheet v-if="!categoria && getComercioById && !getComercioCali" color="grey lighten-4" min-height="400" tile>
            
            <v-fade-transition>
                <show-comercio></show-comercio>
            </v-fade-transition>

        </v-sheet>
    </v-expand-transition>
    

    </v-sheet>

</template>

<script>

import { mapGetters } from 'vuex';
import ListComercio from '@components/comercio/ListComercio';
import ShowComercio from '@components/comercio/ShowComercio';

export default {
    components: { 
        'list-comercio': ListComercio,
        'show-comercio': ShowComercio
    },
    computed: {
        ...mapGetters(['getCategorias', 'getNombre', 'getComercioById', 'getComercioCali']),
        categoria:
        {
            get() {
                return this.$store.getters['getCategoria']
            },
            set(categoria) {
                this.$store.commit('setCategoria', categoria )
                this.$store.commit('setCategoriaCali', null )
                this.$store.commit('setComercioCali', false )
                let tipoDespacho  = 'zonas'
                this.$store.dispatch('apiComerciosCategoria',  {categoria, tipoDespacho} )
            }
        }
    },
    data(){
        return { 
            fotoUrl: '/images/categorias/'
        }
    },

}
</script>

<style>
.v-slide-group__next, .v-slide-group__prev{
  min-width: 1px !important;
}
</style>

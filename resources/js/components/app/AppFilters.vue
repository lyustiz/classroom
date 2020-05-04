<template>

    <v-container fluid class="mt-0">

        <v-form>
        
        <v-row no-gutters justify="end" >

                <v-btn x-small  dark color="red" @click="switchView()">
                    <template v-if="$router.currentRoute.name=='welcome'">
                        <v-icon size="14" class="mr-2" >mdi-map</v-icon> ver mapa
                    </template>
                    <template v-else>
                        <v-icon size="14" class="mr-2" >mdi-view-dashboard</v-icon> ver lista
                    </template>
                </v-btn>
                
                <v-spacer></v-spacer>
                <v-btn icon x-small  color="red" dark @click="toggleFilter()" v-if="resize" ><v-icon>mdi-close-circle</v-icon></v-btn> 
        </v-row>
            
        <v-row >

            <v-col>

                <v-card color="info" dark>
                    
                    <v-card-title primary-title>
                        <v-icon class="mr-1">mdi-storefront</v-icon> Comercios
                    </v-card-title>

                    <v-card-text>
 
                        <v-flex md12>
                            <v-select
                                dense
                                outlined
                                label="Zona"
                                v-model="filterZona" 
                                :items="getZonas"
                                item-value="id"
                                item-text="nb_zona"
                                append-icon="mdi-select-marker"
                            ></v-select>
                        </v-flex>

                        <v-flex md12>
                            <v-select
                                dense
                                outlined
                                label="Barrio"
                                v-model="filterBarrio" 
                                :items="selects.barrios"
                                :loading="barriosLoad"
                                item-value="id"
                                item-text="nb_barrio"
                                append-icon="mdi-home-city"
                            ></v-select>
                        </v-flex>

                        <v-flex md12>
                            <v-select
                                dense
                                outlined
                                label="Comercios"
                                v-model="filterComercioById"
                                :items="selects.comerciosList"
                                :loading="comerciosLoad"
                                item-value="id"
                                item-text="nb_comercio"
                                append-icon="mdi-storefront"
                                placeholder="Indique Zona/Barrio"
                                no-data-text="No existen coincidencias"
                            ></v-select>

                        </v-flex>

                    </v-card-text>
                </v-card>
            </v-col>
        </v-row>

        <v-row >

            <v-col>

                <v-card color="purple" dark>

                    <v-card-title class="body">
                        Despachos en todo Cali
                    </v-card-title>

                    <v-card-text>

                        <v-flex md12 class="mt-5">

                            <v-autocomplete
                                v-model="comercioIdSearch"
                                :items="selects.comerciosSearch"
                                item-value="id"
                                item-text="nb_comercio"
                                :loading="comerciosSearchLoad"
                                :search-input.sync="search"
                                hide-no-data
                                label="Buscar Comercio"
                                placeholder="Tipea para Buscar"
                                dense
                                outlined
                                cache-items
                                clearable
                            ></v-autocomplete>
             
                        </v-flex>

                        <v-flex md12>
                            <v-select
                                dense
                                outlined
                                clearable
                                label="Categorias"
                                v-model="filterCategoria"    
                                :items="getCategorias"
                                item-value="id"
                                item-text="nb_categoria"
                                append-icon="category"
                            ></v-select>
                        </v-flex>
                        
                    </v-card-text>

                </v-card>

            </v-col>
            
        </v-row>

        </v-form>

    </v-container>
  
</template>

<script>

import AppRules from "@mixins/AppRules";
import { mapGetters, mapMutations } from 'vuex';

export default {
    mixins: [ AppRules ],

    computed:
    {
        ...mapGetters(['getCategorias','getZonas']),
        resize()
        {
            console.log(this.$router.currentRoute.name)
            return this.$store.getters['getResize']
        },
        filterNombre:
        {
            get() {
                return this.$store.getters['getNombre']
            },
            set(nombre) {
                this.$store.commit('setNombre', nombre)
            }
        },
        filterZona:
        {
            get() {
                return this.$store.getters['getZona']
            },
            set(zona) {
                this.$store.commit('setZona', zona)
                this.getBarrios(zona);
            }
        },
        filterBarrio:
        {
            get() {
                return this.$store.getters['getBarrio']
            },
            set(barrio) {
                this.$store.commit('setBarrio', barrio)
                this.getListComercios(barrio);
            }
        },
        filterCategoria:
        {
            get() {
                return this.$store.getters['getCategoriaCali']
            },
            set(categoria) {
                this.comercioIdSearch = null
                this.$store.commit('setCategoria', null)
                this.$store.commit('setCategoriaCali', categoria)
                let tipoDespacho  = 'cali'
                this.$store.dispatch('apiComerciosCategoria',  {categoria, tipoDespacho} )
            }
        },
        filterComercioById:
        {
            get() {
                return this.comercioId
            },
            set(comercioId) {
                this.$store.commit('setCategoriaCali', null)
                this.$store.dispatch('apiComercioById',  comercioId )
                this.$store.commit('setComercioCali', false)
            }

        }
    },

    watch: {

        search(nombre)
        {
            if(!nombre){
                return
            }else{
                if ( nombre.trim().length < 3 ) return
            }
            
            if ( this.comerciosSearchLoad ) return
            
            this.comerciosSearchLoad = true
            
            axios.post('/api/v1/' + 'comercio/search', { nombre } )
			.then( response =>
			{
                this.selects.comerciosSearch  = response.data;
			})
            .catch( error =>
            {
                console.log(error)
            })
            .finally(() => (this.comerciosSearchLoad = false))
        },

        comercioIdSearch(comercioId)
        {
            if(comercioId)
            {
                this.$store.commit('setCategoriaCali', null)
                this.comercioId = null
            }

            this.$store.dispatch('apiComercioById',  comercioId )
            this.$store.commit('setComercioCali', true)
            this.$store.commit('setCategoria', null)
            this.$store.commit('setCategoriaCali', null)
        }
    },

    data()
    {
        return {
                comercioId:          '',
                comercioIdSearch:    '',
                search:              null, 
                barriosLoad:         false,
                comerciosLoad:       false,
                comerciosSearchLoad: false,
                selects: {
                    barrios:          [], 
                    comerciosList:    [], 
                    comerciosSearch:  [], 
                },
                selectComercio: false
        }
    }, 
    methods: 
    {
        ...mapMutations(['toggleFilter']),

        getBarrios(zona){

            this.selects.barrios = [];
            this.barriosLoad = true;

            if(!zona)
            {
                this.barriosLoad = false;
                return
            }

            axios.get('/api/v1/' + 'barrio/zona/' + zona)
			.then( response =>
			{
                this.selects.barrios = response.data;
			})
            .catch( error =>
            {
                console.log(error)
            })
            .finally(() => (this.barriosLoad = false))
        },

        getListComercios(barrio){

            this.selects.comerciosList = [];
            this.comerciosLoad = true;

            if(!barrio)
            {
                this.comerciosLoad = false;
                this.comercio = '';
                return
            }

            axios.get('/api/v1/' + 'comercio/barrio/' + barrio)
			.then( response =>
			{
                this.selectComercio = true;
                this.selects.comerciosList = response.data;
			})
            .catch( error =>
            {
                console.log(error)
            })
            .finally(() => (this.comerciosLoad = false))
        },

        searchComercio(nombre)
        {
            if ( trim(nombre).length < 3 ) return

            if ( this.comerciosSearchLoad ) return
            
            this.comerciosSearchLoad = true
            
            axios.post('/api/v1/' + 'comercio/search', { nombre } )
			.then( response =>
			{
                this.comerciosSearch        = true;
                this.selects.comerciosList  = response.data;
			})
            .catch( error =>
            {
                console.log(error)
            })
            .finally(() => (this.comerciosSearchLoad = false))
        },

        switchView()
        {
            const route = (this.$router.currentRoute.name=='welcome') ? 'mapview' : '/' ;
            
            this.$router.push(route).catch(err => {})
        }
    }
}
</script>

<style>

</style>
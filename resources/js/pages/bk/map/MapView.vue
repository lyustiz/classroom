<template>
<v-container fluid>

    <v-card class="map-card">
        
        <app-map  
            :accessToken="accessToken" 
            :mapStyle="mapStyle" 
            :center="center" 
            :zoom="zoom" 
            :minZoom="minZoom"
            :maxZoom="maxZoom"
            @load="onMapLoaded"
            class="map-view-holder"> 
             
            <map-marker 
                v-for="(comercio, index) in comercios" 
                :coordinates="[ comercio.tx_longitud, comercio.tx_latitud ]" 
                :key="index"
                @click="centered($event)"
                > 

                <span slot="marker" > 
                    <v-btn small icon class="grey lighten-4">
                        <v-icon size="30" :color="(comercio.bo_abierto == 1) ? 'green' : 'red'">mdi-storefront</v-icon> 
                    </v-btn>
                </span>

                <map-popup>
                    
                    <card-comercio :comercio="comercio"></card-comercio>

                </map-popup>
            </map-marker>

            <map-layer 
                v-for="(source, index) in sources" 
                :key="index+1"
                :source="source"
                sourceId="comuna"
                layerId="comuna"
                :layer="layer"
            ></map-layer>
        
        </app-map>

    </v-card>

    <!-- Contenedor de  Filtros -->
    <v-navigation-drawer :value="showFilter" app clipped right class="grey lighten-5">
        <app-filters></app-filters> 
    </v-navigation-drawer>

</v-container>
</template>

<script>

import  Mapbox from "mapbox-gl";
import {    MglMap, 
            MglMarker, 
            MglPopup, 
            MglGeojsonLayer  
        } from "vue-mapbox";
import { mapGetters } from 'vuex';
import CardComercio from './CardComercio'

export default {
    name: 'map-view',
    components: {
       'app-map'      :  MglMap,
       'map-marker'   :  MglMarker, 
       'map-popup'    :  MglPopup,
       'map-layer'    :  MglGeojsonLayer,
       'card-comercio':  CardComercio
    },

    created() 
    {
        this.mapbox = Mapbox;
        this.mapScope = null
    },

    computed: 
    {
        ...mapGetters(['showFilter']),
        comercios()
        {
            return this.$store.getters['getComercios'];
        },

        countComercios()  
        {
            return  this.$store.getters['countComercios'];
        }
    },

    data() 
    {
       return {
            accessToken:'pk.eyJ1IjoibHl1c3RpeiIsImEiOiJjazZ0aGpzNjUwYW9qM2ZxaWxvY291b2x2In0.W4RUOc_RspaFduFD1XOxjA', 
            mapStyle:   'mapbox://styles/mapbox/streets-v11', 
            center:     [ -76.5231, 3.4314 ],
            mapbox:     '',
            zoom :      12,
            minZoom:    12,
            maxZoom:    15,
            coordinates:[
            ],
            sources:    [],
        }
    },
    
    methods:
    {        
        onMapLoaded(event)
        {
            this.mapScope = event.map;
                
        },
        centered(mark)
        {
            
            this.mapScope.easeTo({ center: mark.marker._lngLat, zoom: 13 }) 
        }
    }



/**
 if ("geolocation" in navigator) {
  navigator.geolocation.getCurrentPosition(function(position) {
  console.log(position.coords.latitude, position.coords.longitude);
  */
}
</script>

<style >
.map-view-holder{
    height: 89.5vh !important;
}

.map-card
{
  height: 89.5vh !important;
}

</style>
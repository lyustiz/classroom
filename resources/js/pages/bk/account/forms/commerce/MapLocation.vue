<template>
<div>
    <v-card dark max-width="400" max-height="400"  class="mx-auto">

        <app-map  
            :accessToken="accessToken" 
            :mapStyle="mapStyle" 
            :center="center" 
            :zoom="zoom" 
            :minZoom="minZoom"
            :maxZoom="maxZoom"
            @click="addMark($event)"
            @load="onMapLoaded"
            class="map-location-holder"> 
            
            <map-marker 
                v-for="(coordinate, index) in coordinates" 
                :coordinates="coordinate" 
                color="blue" draggable 
                @dragend="moveMark($event)" 
                :key="index"> 
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

        <v-overlay
            absolute
            :value="overlay">

            <v-alert type="warning" border="bottom" icon="mdi-map-marker-alert">
                 Favor Seleccione:
            </v-alert>

            <v-alert color="info" border="left" >
                <p class="title mx-2" v-if="!hasZona"><v-icon>mdi-select-marker</v-icon>  Zona</p>
                <p class="title mx-2" v-if="!hasComuna"><v-icon>mdi-map-marker-radius</v-icon> Comuna</p>
                <p class="title mx-2" v-if="!hasBarrio"><v-icon>mdi-home-modern</v-icon> Barrio</p>
            </v-alert>
          
        </v-overlay>

        <v-card-text class="info">
                <v-row>
                    <v-col>
                        <v-text-field
                        label="Longitud"
                        :value="getCoordinates[0].toFixed(5)"
                        :rules="[rules.coordinate]"
                        readonly
                        hint="Seleccione una ubicacion en el mapa"
                        persistent-hint
                        ></v-text-field>
                    </v-col>
                    <v-col>
                        <v-text-field
                        label="Latitud"
                        :value="getCoordinates[1].toFixed(5)"
                        :rules="[rules.coordinate]"
                        readonly
                        ></v-text-field>
                    </v-col>
                </v-row>

        </v-card-text>
    
    </v-card>

</div>
       
   
</template>

<script>

import  Mapbox from "mapbox-gl";
import {    MglMap, 
            MglMarker, 
            MglPopup, 
            MglGeojsonLayer  
        } from "vue-mapbox";

import AppRules from '@mixins/AppRules'

export default {
    name: 'map-location',
    mixins: [AppRules],
    components: {
       'app-map'      :  MglMap,
       'map-marker'   :  MglMarker, 
       'map-popup'    :  MglPopup,
       'map-layer'    :  MglGeojsonLayer 
    },
     props:
    {
        zona:{
            type:       [String, Number],
            default:    ''
        },

        comuna:{
            type:       [String, Number],
            default:    ''
        },

        barrio:{
            type:       [String, Number],
            default:    ''
        },

        comunas:{
            type:       Array,
            default:    () => []
        },

        comercio:{
            type:       Object,
            default:    () => {}
        },

        setLatLon:{
            type:       Array,
            default:    () => [0, 0]
        },
    },
    watch: 
    {
        setLatLon()
        {
            if(this.setLatLon != [0,0])
            {
                this.coordinates = this.setLatLon
            }
        }
    },
    computed: 
    {
        overlay() { return !(this.hasZona && this.hasComuna && this.hasBarrio) },

        hasZona() { return (this.zona) ? true : false },

        hasComuna() { return (this.comuna) ? true : false  },

        hasBarrio() { return (this.barrio) ? true : false },

        getCoordinates() { 
            return (this.coordinates.length > 0) ? this.coordinates[0]: [ 0, 0 ] 
        }
    },

    watch:
    {
        comuna(_new, _old)
        {
            /* if(_old)
            { */
                if(this.comuna)
                {
                    this.sources = []
                    this.sources.push(require('~/assets/geo/comuna'+this.comuna+'.json'))

                    let center = this.comunas.filter(item => item.id == this.comuna)

                    if(center.length > 0)
                    {
                        center = [ parseFloat(center[0].tx_longitud), parseFloat(center[0].tx_latitud) ]
                        this.mapScope.easeTo({center: center, zoom: this.zoom +2})
                    }
                }
            //}
        }
    },

    data() 
    {
       return {
            accessToken:'pk.eyJ1IjoibHl1c3RpeiIsImEiOiJjazZ0aGpzNjUwYW9qM2ZxaWxvY291b2x2In0.W4RUOc_RspaFduFD1XOxjA', 
            mapStyle:   'mapbox://styles/mapbox/streets-v11', 
            center:     [ -76.5231, 3.4314 ],
            mapbox:     '',
            zoom :      10.97,
            minZoom:    12,
            maxZoom:    15,
            coordinates:[],
            sources:    [],
            layer:  {
                        'id': 'comuna',
                        'type': 'fill',
                        'source': 'comuna',
                        'paint': {
                        'fill-color': '#F66546',
                        'fill-opacity': 0.3
                    }
            }
    }
    },
    created() 
    {
        this.mapbox = Mapbox;
        this.mapScope = null
    },
    methods:
    {
        onMapLoaded(event)
        {
            if(this.hasComuna)
            {
                let center = this.comunas.filter(item => item.id == this.comuna)

                if(center.length > 0)
                {
                    center = [ parseFloat(center[0].tx_longitud), parseFloat(center[0].tx_latitud) ]
                    let mapScope = event.map;
                    mapScope.easeTo({center: center, zoom: 13})
                    this.mapScope = event.map;
                }

                this.sources.push(require('~/assets/geo/comuna'+this.comuna+'.json'))
                
                if( this.setLatLon != [0,0] )//this.comercio.tx_latitud && this.comercio.tx_longitud)
                {
                    this.coordinates.push([ parseFloat(this.setLatLon[0]), parseFloat(this.setLatLon[1])]);
                }
            }else{
                this.mapScope = event.map;
            }
        },
        
        addMark(marca)
        {
            this.coordinates = [];
            let lngLat = marca.mapboxEvent.lngLat
            this.coordinates.push([lngLat.lng, lngLat.lat]);
            this.$emit('OnLocation', lngLat)
        },

        moveMark(marca)
        {
            this.coordinates = [];
            let lngLat = marca.marker._lngLat
            this.coordinates.push([lngLat.lng, lngLat.lat]);
            this.$emit('OnLocation', lngLat)
        }
    }
}
</script>

<style>

.map-location-holder
    {
        height: 400px !important;
        width: 400px !important;
    }
    /* .mgl-map-wrapper
    {
        max-height: 400px !important;
        max-width: 100% !important;
    } */
</style>
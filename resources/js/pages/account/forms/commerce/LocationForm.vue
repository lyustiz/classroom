<template>
    <v-form v-model="valid" ref="form" >
    <v-row no-gutters>
    <v-col  md="6" sm="12" xs="12">
    <v-card class="mx-auto" max-width="400" :loading="loading">
        <v-card-title >
            Ubicacion del Comercio
        </v-card-title>
        <v-card-text>

            <v-flex xs12 d-flex>
                <v-select
                    label="Departamento*"
                    prepend-inner-icon="mdi-map-search"
                    :rules="[rules.select]"
                    v-model="departamentoCiudad" 
                    :items="[{ id: 76, nb_departamento: 'Valle del Cauca'}]"
                    item-value="id"
                    item-text="nb_departamento"
                    dense
                    outlined
                    filled
                ></v-select>
            </v-flex>

            <v-flex xs12 d-flex>
                <v-select
                    label="Ciudad (*)"
                    prepend-inner-icon="mdi-city-variant" 
                    :rules="[rules.select]"
                    v-model="departamentoCiudad" 
                    :items="[{ id: 76, nb_municipio: 'Cali'}]"
                    item-value="id"
                    item-text="nb_municipio"
                    :disabled="ciudadDisabled"
                    dense
                    outlined
                    filled
                ></v-select>
            </v-flex>

            <v-flex xs12 d-flex>
                <v-select
                    label="Zona*"
                    prepend-inner-icon="mdi-select-marker" 
                    :rules="[rules.select]"
                    v-model="form.id_zona" 
                    :items="zonas"
                    item-value="id"
                    item-text="nb_zona"
                    @input="getComunas()"
                    :disabled="zonaDisabled"
                    dense
                    outlined
                    filled
                ></v-select>
            </v-flex>

            <v-flex xs12 d-flex>
                <v-select
                    prepend-inner-icon="mdi-map-marker-radius" 
                    label="Comuna*"
                    :rules="[rules.select]"
                    v-model="form.id_comuna" 
                    :items="selects.comunas"
                    item-value="id"
                    item-text="nb_comuna"
                    @input="getBarrios()"
                    :loading="comunasLoading"
                    :disabled="comunaDisabled"
                    dense
                    outlined
                    filled
                ></v-select>
            </v-flex>

            <v-flex xs12 d-flex>
                <v-select
                    label="Barrio*"
                    prepend-inner-icon="mdi-home-modern" 
                    :rules="[rules.select]"
                    v-model="form.id_barrio" 
                    :items="selects.barrios"
                    item-value="id"
                    item-text="nb_barrio"
                    :loading="barriosLoading"
                    :disabled="barrioDisabled"
                    dense
                    outlined
                    filled
                ></v-select>
            </v-flex>

            <v-flex xs12 >
                <v-text-field
                    color="cyan darken-3"
                    prepend-inner-icon="mdi-sign-direction"
                    label="Direccion"
                    type="text"
                    :rules="[rules.required, rules.maxlength(45)]"
                    v-model="form.tx_direccion"
                    dense
                    outlined
                    filled >
                </v-text-field>
            </v-flex>
            
            </v-card-text>
            <v-card-actions class="mx-2">
                <v-spacer></v-spacer>
                <v-btn small dark fab color="amber"   @click="cancel()" :loading="loading"> <v-icon>mdi-restore</v-icon></v-btn>
                <v-btn small dark fab color="primary" @click="update()" :loading="loading"> <v-icon>mdi-content-save</v-icon></v-btn>
          </v-card-actions>
        </v-card>
        </v-col>
        <v-col cols="12" md="6" lg="6" class="mx-auto">
            <map-location 
                :zona="form.id_zona" 
                :comuna="form.id_comuna" 
                :barrio="form.id_barrio" 
                :comercio="item" 
                :comunas="selects.comunas"
                @OnLocation="setLocation($event)"
                :setLatLon="setLatLon">
            </map-location>
        </v-col>
        </v-row>
        </v-form>

</template>

<script>

import AppForm from '@mixins/AppForm'
import AppData from '@mixins/AppData'

import MapLocation from '@pages/account/forms/commerce/MapLocation.vue';

export default {

    components:{
        'map-location': MapLocation
    },

    mixins:[ AppForm, AppData ],

    created() 
    {
        this.fetch()
    },
    computed:
    {
        getIduser()
        {
            return this.$store.getters['getUserid']
        },
        
        zonas()
        {
            return this.$store.getters['getZonas']
        },

        ciudadDisabled() { return (this.departamentoCiudad) ? false : true },

        zonaDisabled()   { return (this.departamentoCiudad) ? false : true },

        comunaDisabled() { return (this.form.id_zona) ? false : true },

        barrioDisabled() { return (this.form.id_comuna) ? false : true },

        setLatLon()  { 
            return (this.form.tx_latitud && this.form.tx_longitud) ? [this.form.tx_longitud, this.form.tx_latitud ] : [0,0] 
            }

    },
    data(){
        return{
            resource: 'comercio', 
            form: {
                id:              null,
                id_departamento: 76,
                id_ciudad:       76,
                id_zona:         null,
                id_comuna:       null,
                id_barrio:       null,
                tx_longitud:     null,
                tx_latitud:      null,
                tx_direccion:    null,
                id_usuario:      null
            },
            departamentoCiudad: '', 
            selects: {
                comunas: [],
                barrios: [],
            },
            comunasLoading: false,
            barriosLoading: false,
        }
    },

    methods: 
    {
        fetch()
        {
            this.item    = this.$store.getters['getComercio']
            this.form.id = this.item.id;

            if( this.item.id_departamento != null)
            {
                this.mapForm()
                this.departamentoCiudad = 76
                this.getComunas(this.item.id_zona)
                this.getBarrios(this.item.id_comuna)
            }
            this.loading = false
        },

        update()
        {
            if (!this.$refs.form.validate())  return 

            this.loading = true;
            this.form.id_usuario = this.getIduser;
            
            axios.put('/api/v1/' + this.resource + '/location', this.form)
			.then( response =>
			{
                this.showMessage(response.data.msj)
			})
            .catch( error =>
            {
                this.showError(error);
            })
            .finally( () =>
            {
                this.loading = false
            }); 
    
        },

        getComunas(){

            this.selects.comunas = [];
            this.selects.barrios = [];
            this.comunasLoading  = true;

            axios.get('/api/v1/' + 'comuna/zona/' + this.form.id_zona)
			.then( response =>
			{
                this.selects.comunas = response.data;
                this.comunasLoading = false;

                if(!this.item.id_comuna)
                {
                    this.form.id_comuna   = ''
                    this.form.id_barrio   = ''
                    this.form.tx_latitud  = ''
                    this.form.tx_longitud = ''
                }
			})
            .catch( error =>
            {
              console.log(error)
            })
        },

        getBarrios(){

            this.selects.barrios = [];
            this.barriosLoading = true;

            axios.get('/api/v1/' + 'barrio/comuna/' + this.form.id_comuna)
			.then( response =>
			{
                this.selects.barrios = response.data;
                this.barriosLoading = false;
                if(!this.item.id_barrio)
                {
                    this.form.id_barrio  = ''
                    this.form.tx_latitud  = ''
                    this.form.tx_longitud = ''
                }
			})
            .catch( error =>
            {
              console.log(error)
            })
        },

        cancel()
        {
            this.$refs.form.resetValidation()
            this.mapForm()
            this.departamentoCiudad = 76
            this.getComunas(this.item.id_zona)
            this.getBarrios(this.item.id_comuna)
        },

        setLocation(LonLat)
        {
            this.form.tx_longitud = LonLat.lng
            this.form.tx_latitud  = LonLat.lat
        }
    }
    
}
</script>

<style>

</style>
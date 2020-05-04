<template>

   <v-card shaped max-width="180">

        
        <v-card-title >

            <v-row no-gutters>

            <v-col> 
                <v-tooltip top :open-on-click="true" :color="getStatusOpen().color">
                    <template v-slot:activator="{ on }">
                        <v-icon v-on="on" size="28" :color="getStatusOpen().color">
                            {{getStatusOpen().icon}}
                        </v-icon> 
                    </template>
                    <span>{{getStatusOpen().text}}</span>
                </v-tooltip>
                <span class="body-2 font-weight-bold"> {{ comercio.nb_comercio }} </span>
            </v-col>
            </v-row> 
        </v-card-title>

        <v-card-text>
        <v-row>
        
            <v-col cols="6" >
            <v-menu offset-y >
                <template v-slot:activator="{ on }">
                    <v-btn large v-on="on" icon class="grey lighten-4" @click="horario=!horario">
                        <v-icon color="amber">mdi-clock</v-icon>
                    </v-btn>
                </template>
                <v-list dense class="pa-2">
                    <v-list-item v-for="(horario, i) in comercio.horario" :key="i" >
                    
                    <v-list-item-avatar>
                        <v-icon dark class="grey lighten-1 white--text">mdi-calendar</v-icon>
                    </v-list-item-avatar>
                    
                    <v-list-item-content>
                        <v-list-item-title>{{horario.nb_horario}}</v-list-item-title>
                    </v-list-item-content>

                    </v-list-item>
                    
                </v-list>
            </v-menu>


            
            <v-menu offset-y v-model="telefono">
                <template v-slot:activator="{ on }">

                    <v-btn large v-on="on" icon class="grey lighten-4" @click="telefono=!telefono">
                        <v-icon color="green">mdi-phone</v-icon>
                    </v-btn>
                </template>
                <v-list two-line dense nav class="pa-2">
                    <v-list-item v-for="(telefono, i) in comercio.telefono" :key="i">
                    
                    <v-list-item-avatar>
                        <v-icon dark class="grey lighten-1 white--text">{{getPhoneIcon(telefono.id_tipo_telefono)}}</v-icon>
                    </v-list-item-avatar>
                    
                    <v-list-item-content>
                        <v-list-item-title><a class="phone-link"  :href="`tel:+57${telefono.tx_telefono}`">+57{{telefono.tx_telefono}}</a></v-list-item-title>
                        <v-list-item-subtitle>{{getPhoneType(telefono.id_tipo_telefono)}}</v-list-item-subtitle>
                    </v-list-item-content>

                    <v-list-item-action v-if="telefono.bo_whatsapp==1">
                        <v-btn class="grey lighten-4" link :href="`https://wa.me/${telefono.tx_telefono}`" target="_blank" icon>
                            <v-icon color="green" size="32">mdi-whatsapp</v-icon>
                        </v-btn>
                    </v-list-item-action>

                    </v-list-item>
                </v-list>
            </v-menu>
            </v-col>

            <v-col cols="6">         
                <v-btn small icon class="grey lighten-4" link target="_blank" :href="`mailto:${comercio.tx_email}`"> 
                    <v-icon color="purple">mdi-email</v-icon> 
                </v-btn>
                <v-btn small v-if="comercio.tx_sitio_web" icon class="grey lighten-4" link target="_blank" :href="`http://${comercio.tx_sitio_web}`"> 
                    <v-icon color="green">mdi-web</v-icon>
                </v-btn>
                <v-btn small v-if="comercio.tx_instagram" icon class="grey lighten-4" link target="_blank" :href="`https://www.instagram.com/${comercio.tx_instagram}`"> 
                    <v-icon color="#c32aa3">mdi-instagram</v-icon>
                </v-btn>
                <v-btn small v-if="comercio.tx_youtube" icon class="grey lighten-4" link target="_blank" :href="`https://www.youtube.com/user/${comercio.tx_youtube}`"> 
                    <v-icon color="#ff0000">mdi-youtube</v-icon>
                </v-btn>
                <v-btn small v-if="comercio.tx_twitter" icon class="grey lighten-4" link target="_blank" :href="`https://twitter.com/${comercio.tx_twitter}`"> 
                    <v-icon color="#1da1f2">mdi-twitter</v-icon>
                </v-btn>
                <v-btn small v-if="comercio.tx_facebook" icon class="grey lighten-4" link target="_blank" :href="`https://www.facebook.com/${comercio.tx_facebook}`">
                    <v-icon color="#3b5998">mdi-facebook</v-icon> 
                </v-btn>
            </v-col>   
          
        </v-row>

        <v-row no-gutters>

            <v-col cols="3" class="ml-2">

                <v-menu offset-y>
            
                <template v-slot:activator="{ on }">
                    <v-btn small icon class="grey lighten-4" v-on="on">
                        <v-icon  color="info">mdi-map-marker-radius</v-icon> 
                    </v-btn>
                </template>
                <v-list two-line dense class="pa-2">
                    <v-list-item>
                        <v-list-item-avatar>
                            <v-icon class="grey lighten-1 white--text">mdi-map-search</v-icon>
                        </v-list-item-avatar>
                        <v-list-item-content>
                            <v-list-item-title>{{comercio.nb_departamento}}</v-list-item-title>
                            <v-list-item-subtitle>Departamento</v-list-item-subtitle>
                        </v-list-item-content>
                    </v-list-item>
                    <v-list-item>
                        <v-list-item-avatar>
                            <v-icon class="grey lighten-1 white--text">mdi-city-variant</v-icon>
                        </v-list-item-avatar>
                        <v-list-item-content>
                            <v-list-item-title>{{comercio.nb_ciudad}}</v-list-item-title>
                            <v-list-item-subtitle>Ciudad</v-list-item-subtitle>
                        </v-list-item-content>
                    </v-list-item>
                    <v-list-item>
                        <v-list-item-avatar>
                            <v-icon class="grey lighten-1 white--text">mdi-select-marker</v-icon>
                        </v-list-item-avatar>
                        <v-list-item-content>
                            <v-list-item-title>{{comercio.nb_zona}}</v-list-item-title>
                            <v-list-item-subtitle>Zona</v-list-item-subtitle>
                        </v-list-item-content>
                    </v-list-item>
                    <v-list-item>
                        <v-list-item-avatar>
                            <v-icon class="grey lighten-1 white--text">mdi-home-city</v-icon>
                        </v-list-item-avatar>
                        <v-list-item-content>
                            <v-list-item-title>{{comercio.nb_barrio}}</v-list-item-title>
                            <v-list-item-subtitle>Barrio</v-list-item-subtitle>
                        </v-list-item-content>
                    </v-list-item>
                    <v-list-item>
                        <v-list-item-avatar>
                            <v-icon class="grey lighten-1 white--text">mdi-sign-direction</v-icon>
                        </v-list-item-avatar>
                        <v-list-item-content>
                            <v-list-item-title>{{comercio.tx_direccion}}</v-list-item-title>
                            <v-list-item-subtitle>Direccion</v-list-item-subtitle>
                        </v-list-item-content>
                    </v-list-item>
                </v-list>
            </v-menu>


            </v-col>


           
              <v-col cols="8" class="text-center" >
               
                <v-rating
                    small
                    color="yellow accent-4"
                    :value="percentValoration"
                    background-color="yellow accent-4"
                    dense
                    half-increments
                    hover
                    ripple
                    readonly
                ></v-rating>
            </v-col>
        </v-row>
        </v-card-text>
        
       
    </v-card>
</template>

<script>
export default 
{
    props:
    {
        comercio:{
            type:       Object,
            default:    null
        },
    },
    computed:
    {
        getUserid()
        {
            return this.$store.getters['getUserid']
        },

        numberValoration()
        {
            return (this.comercio.nu_pc_valoracion) ? parseInt(this.comercio.nu_pc_valoracion.split('-')[0]) : 0
        },

        percentValoration()
        {
            return (this.comercio.nu_pc_valoracion) ? parseFloat(this.comercio.nu_pc_valoracion.split('-')[1]) : 0
        },

    },
    data () 
	{
        return {
            rating: 0,
            telefono: false,
            horario:  false,
            categoria: false,
            dialog: false
        }
    },
    methods: {
        getPhoneIcon(id_tipo_telefono)
        {
            switch (parseInt(id_tipo_telefono)) {
                case 1:
                    return 'mdi-phone-classic' 
                    break;
                case 2:
                    return 'mdi-cellphone-android'
                    break;
                case 3:
                    return 'mdi-printer'
                    break;
                default:
                    return 'mdi-phone'
                    break
            }
        },

        getStatusOpen()
        {
            if(this.comercio.bo_abierto == '1')
            {
                return {
                    color: 'green',
                    icon:  'mdi-garage-open',
                    text:  'Abierto'
                }
            }

            return {
                    color: 'red',
                    icon:  'mdi-garage',
                    text:  'Cerrado'
                }

        },

        getPhoneType(id_tipo_telefono)
        {
            switch (parseInt(id_tipo_telefono)) {
                case 1:
                    return 'Local' 
                    break;
                case 2:
                    return 'Celular'
                    break;
                case 3:
                    return 'Fax'
                    break;
                default:
                    return 'Telefono'
                    break
            }
        },
    }
}
</script>

<style>
 .phone-link{
     text-decoration: none !important;
     color: rgba(0,0,0,.87) !important;
 }

</style>

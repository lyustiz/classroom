<template>

   <v-card shaped class="ma-3">

        <v-img class="white--text align-end" height="200px" :src="`/storage/commerce/${comercio.tx_foto}`"></v-img>
        
        <v-card-title class="pl-7">

            <v-row no-gutters>
            <v-col> 
                <v-menu offset-y >
                    <template v-slot:activator="{ on }">
                            <v-icon v-on="on" color="info" class="mr-2">mdi-map-marker</v-icon> 
                            <span class="subtitle-1 font-weight-bold"> {{ comercio.nb_comercio }} </span>
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
                    </v-list>
                </v-menu>
            </v-col>
            </v-row> 
        </v-card-title>

        <v-card-subtitle class="pl-9 pb-2">
            {{ comercio.tx_direccion }} 
        </v-card-subtitle>
        
        <v-card-text>
            
            

                <v-row no-gutters>
                    <v-col>
                        <v-menu offset-y >
                            <template v-slot:activator="{ on }">
                                <v-btn v-on="on" text small color="cyan darken-3" class="mb-2" @click="horario=!horario">
                                    <v-icon color="amber" class="mr-2">mdi-clock</v-icon> horarios
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
                    </v-col>

                    <v-col>

                        <v-tooltip top open-on-click :color="getStatusOpen().color">
                            <template v-slot:activator="{ on }">
                                <v-btn small icon v-on="on" :class="`${getStatusOpen().color} lighten-5`">
                                    <v-icon  size="28" :color="getStatusOpen().color">
                                        {{getStatusOpen().icon}}
                                    </v-icon> 
                                </v-btn>
                            </template>
                            <span>{{getStatusOpen().text}}</span>
                        </v-tooltip>
                    </v-col>

                    <v-col>
                        <v-menu offset-y v-model="telefono">
                            <template v-slot:activator="{ on }">
                                <v-btn v-on="on" text small color="cyan darken-3" class="mb-2" @click="telefono=!telefono">
                                    <v-icon color="success" class="mr-2">mdi-phone</v-icon> Telefonos
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

                    <v-col cols="12" class="text-right" >
                        
                        <v-btn icon class="grey lighten-4" link target="_blank" :href="`mailto:${comercio.tx_email}`"> 
                            <v-icon color="purple">mdi-email</v-icon> 
                        </v-btn>
                        <v-btn v-if="comercio.tx_sitio_web" icon class="grey lighten-4" link target="_blank" :href="`http://${comercio.tx_sitio_web}`"> 
                            <v-icon color="green">mdi-web</v-icon>
                        </v-btn>
                        <v-btn v-if="comercio.tx_instagram" icon class="grey lighten-4" link target="_blank" :href="`https://www.instagram.com/${comercio.tx_instagram}`"> 
                            <v-icon color="#c32aa3">mdi-instagram</v-icon>
                        </v-btn>
                        <v-btn v-if="comercio.tx_youtube" icon class="grey lighten-4" link target="_blank" :href="`https://www.youtube.com/user/${comercio.tx_youtube}`"> 
                            <v-icon color="#ff0000">mdi-youtube</v-icon>
                        </v-btn>
                        <v-btn v-if="comercio.tx_twitter" icon class="grey lighten-4" link target="_blank" :href="`https://twitter.com/${comercio.tx_twitter}`"> 
                            <v-icon color="#1da1f2">mdi-twitter</v-icon>
                        </v-btn>
                        <v-btn v-if="comercio.tx_facebook" icon class="grey lighten-4" link target="_blank" :href="`https://www.facebook.com/${comercio.tx_facebook}`">
                             <v-icon color="#3b5998">mdi-facebook</v-icon> 
                        </v-btn>
                    </v-col>

                </v-row>
            
        </v-card-text>
        
        <v-card-actions class="px-5">
            
            <v-badge bordered color="info" overlap :content="numberValoration">
                <v-btn icon class="grey lighten-4" @click="dialog=!dialog">
                    <v-icon size="30" color="green">mdi-message-plus-outline</v-icon>
                </v-btn>
            </v-badge>

            <v-dialog :value="dialog"  persistent max-width="500" v-if="dialog">

                <template v-if="getUserid"> 
                    <form-valoration :id_comercio="comercio.id" @close="dialog = false"></form-valoration>
                    
               </template>
               <template v-else>

                   <v-card class="mx-auto elevation-8" color="rgba(255,255,255,0.9)">
            
                        <v-card-title primary-title class="cyan darken-3 white--text">
                         No se encuentra Registrado
                         <v-spacer></v-spacer>
                        <v-btn icon x-small="" color="white" @click="dialog =!dialog">
                            <v-icon>mdi-close-circle</v-icon>
                        </v-btn>
                        </v-card-title>
                    
                        <v-card-text class="pa-5">
                
                            <v-alert type="warning" icon="mdi-account-cancel">
                               Favor Ingresar para poder relizar comentarios  y seguir usando nuestros servicios
                            </v-alert>

                        </v-card-text>

                        <v-card-actions class="mx-3 pb-4">
                            <v-spacer></v-spacer>
                            <v-btn dark block color="cyan darken-3" @click="$router.push('login')">
                                Ingresar
                            </v-btn>
                        </v-card-actions>
                
                    </v-card>

                   
               </template>
               
            </v-dialog>
            
            <v-spacer></v-spacer>

            <span class="caption" v-if="comercio.nu_pc_valoracion">({{ percentValoration }})</span>
            <span class="caption" v-else>(sin valoraciones)</span>

            <v-rating
                color="yellow accent-4"
                :value="percentValoration"
                background-color="yellow accent-4"
                dense
                half-increments
                hover
                ripple
                readonly
            ></v-rating>
        </v-card-actions>
    </v-card>
</template>

<script>
import FormValoration from './FormValoration'
export default 
{
    components:{
        'form-valoration' : FormValoration
    },

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

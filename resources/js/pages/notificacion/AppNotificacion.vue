<template>

    <v-form ref="form" v-model="valid" lazy-validation>

    <v-card :loading="loading" flat>

        <app-simple-toolbar title="Notificacion" @closeModal="$emit('closeModal')"></app-simple-toolbar>

            <v-list two-line>
            
            <v-list-item v-if="data.destinatario && data.tipoDestinatario" > 
                <v-list-item-avatar color="grey lighten-4" :size="46">
                    <v-icon size="40" :color="data.tipoDestinatario.tx_color">{{data.tipoDestinatario.tx_icono}}</v-icon>
                </v-list-item-avatar>
            
                <v-list-item-content>
                <v-list-item-title v-text="data.destinatario.nb_corto"></v-list-item-title>
                <v-list-item-subtitle >{{data.tipoDestinatario.nb_tipo_destinatario}}</v-list-item-subtitle>
                </v-list-item-content>

  
                <v-list-item-action color="grey lighten-4">
                    <v-menu :close-on-content-click="false" left bottom offset-x width="200px" content-class="white rounded-xl">

                        <template v-slot:activator="{ on }">
                            <v-icon v-on="on" :color="data.tipoNotificacion.tx_color">{{data.tipoNotificacion.tx_icono}}</v-icon>
                        </template>

                        <v-select
                            :items="selects.tipoNotificacion"
                            item-text="nb_tipo_notificacion"
                            item-value="id"
                            v-model="form.id_tipo_notificacion"
                            :rules="[rules.select]"
                            label="Tipo Notificacion"
                            :loading="loading"
                            dense
                            rounded
                            filled
                            hide-details
                            @change="getDataTipoNotificacion($event)"
                            :readonly="readonly"
                        ></v-select>
            
                    </v-menu>

                    <v-menu :close-on-content-click="false" left bottom offset-x width="200px" content-class="white rounded-xl">

                        <template v-slot:activator="{ on }">
                            <v-icon v-on="on" :color="data.tipoPrioridad.tx_color">{{data.tipoPrioridad.tx_icono}}</v-icon>
                        </template>

                        <v-select
                            :items="selects.tipoPrioridad"
                            item-text="nb_tipo_prioridad"
                            item-value="id"
                            v-model="form.id_tipo_prioridad"
                            :rules="[rules.select]"
                            label="Prioridad"
                            :loading="loading"
                            dense
                            rounded
                            filled
                            hide-details
                            @change="getDataTipoPrioridad($event)"
                            :readonly="readonly"
                        ></v-select>
            
                    </v-menu>
                    
                </v-list-item-action>

                
            </v-list-item>

            <v-skeleton-loader v-else
                type="list-item-avatar-two-line"
                class="mx-auto"
            ></v-skeleton-loader>

            </v-list>

        <v-card-text>

        <v-row no-gutters>
                  
          
        <v-col cols="12" md="12">
            <v-text-field
                :rules="[rules.required]"
                v-model="form.tx_asunto"
                label="Asunto"
                placeholder="Indique Asunto"
                prepend-icon="mdi-text-short"
                dense
                single-line
                rounded
                filled
                :readonly="readonly"
            ></v-text-field>
        </v-col>
                  
        <v-col cols="12" md="12">
            <v-text-field
                :rules="[rules.required]"
                v-model="form.tx_mensaje"
                label="Mensaje"
                placeholder="Indique Mensaje"
                prepend-icon="mdi-android-messages"
                dense
                single-line
                rounded
                filled
                :readonly="readonly"
            ></v-text-field>
        </v-col>
                  
        <v-col cols="12" md="12">
            <v-text-field
                :rules="[rules.required]"
                v-model="form.tx_lugar"
                label="Lugar"
                placeholder="Indique Lugar"
                prepend-icon="mdi-map-marker"
                dense
                single-line
                rounded
                filled
                :readonly="readonly"
            ></v-text-field>
        </v-col>
                          
                  
        <v-col cols="12" md="4">
            <v-menu
                v-model="pickers.fe_notificacion"
                :close-on-content-click="false"
                min-width="290px"
            >
                <template v-slot:activator="{ on }">
                    <v-text-field
                        v-model="dates.fe_notificacion"
                        :rules="[rules.fecha]"
                        label="Fecha"
                        prepend-icon="event"
                        readonly
                        v-on="on"
                        dense
                        single-line
                        rounded
                        filled
                    ></v-text-field>
                </template>
                <v-date-picker 
                    :readonly="readonly"
                    v-model="form.fe_notificacion" 
                    @input="dates.fe_notificacion = formatPicker(form.fe_notificacion, 'fe_notificacion')">
                </v-date-picker>
            </v-menu>
        </v-col>

         <v-col cols="6" md="4">
            <v-menu
                ref="pickers1"
                v-model="pickers.hh_inicio"
                :close-on-content-click="false"
                :return-value.sync="form.hh_inicio"
                offset-y
                max-width="240px"
                min-width="240px"
            >
                <template v-slot:activator="{ on }">
                <v-text-field
                    v-model="form.hh_inicio"
                    label="Hora Inicio"
                    prepend-icon="access_time"
                    readonly
                    v-on="on"
                    dense
                    rounded
                    filled
                    single-line
                    class="mr-1"
                ></v-text-field>
                </template>
                <v-time-picker
                    ampm-in-title
                    scrollable
                    v-if="pickers.hh_inicio"
                    v-model="form.hh_inicio"
                    full-width
                    @click:minute="$refs.pickers1.save(form.hh_inicio)"
                    :readonly="readonly"
                ></v-time-picker>
            </v-menu>
        </v-col> 

        <v-col cols="6" md="4">
            <v-menu
                ref="pickers2"
                v-model="pickers.hh_fin"
                :close-on-content-click="false"
                :return-value.sync="form.hh_fin"
                offset-y
                max-width="240px"
                min-width="240px"
            >
                <template v-slot:activator="{ on }">
                <v-text-field
                    v-model="form.hh_fin"
                    label="Hora Fin"
                    prepend-icon="access_time"
                    readonly
                    v-on="on"
                    dense
                    rounded
                    filled
                    single-line
                    class="mr-1"
                ></v-text-field>
                </template>
                <v-time-picker
                    :readonly="readonly"
                    ampm-in-title
                    scrollable
                    v-if="pickers.hh_fin"
                    v-model="form.hh_fin"
                    full-width
                    @click:minute="$refs.pickers2.save(form.hh_fin)"
                ></v-time-picker>
            </v-menu>
        </v-col> 

        </v-row>

        </v-card-text>

        <v-card-actions>
            <v-spacer></v-spacer>

            <v-btn fab depressed x-small color="error" @click="$emit('closeModal')">
               <v-icon>mdi-reply</v-icon>
           </v-btn>
           <v-btn fab depressed small color="success" :disabled="!valid" @click="store()">
               <v-icon>mdi-send</v-icon>
           </v-btn>
           
        </v-card-actions>

        <pre v-if="$App.debug">{{ $data }}</pre>

    </v-card>
    
    </v-form>



</template>

<script>

import AppData from '@mixins/AppData';

export default {

    mixins: [AppData],

    props: {

        tipoDestinatario: {
            type: Number,
            default: null
        },

        tipoNotificacion: {
            type: Number,
            default: null
        },

        tipoPrioridad: {
            type: Number,
            default: null
        },

        idDestinatario: {
            type: Number,
            default: null
        },

        asunto: {
            type: String,
            default: null
        },

        mensaje: {
            type: String,
            default: null
        },

        lugar: {
            type: String,
            default: null
        },

        fecha: {
            type: String,
            default: null
        },

        inicio: {
            type: String,
            default: null
        },

        fin: {
            type: String,
            default: null
        },

        readonly: {
            type: Boolean,
            default: false
        }
    },

    created()
    {
        this.getCombos()
  
        this.form.id_tipo_destinatario = this.tipoDestinatario
        this.form.id_destinatario      = this.idDestinatario 
        this.form.tx_asunto            = this.asunto
        this.form.tx_mensaje           = this.mensaje
        this.form.tx_lugar             = this.lugar
        this.form.id_tipo_notificacion = this.tipoNotificacion
        this.form.id_tipo_prioridad    = this.tipoPrioridad
        this.form.fe_notificacion      = this.fecha
        this.form.hh_inicio            = this.inicio
        this.form.hh_fin               = this.fin

        this.dates.fe_notificacion     = this.formatDate(this.fecha)

    },

    data() {
        return {
            resource: 'notificacion',
            dates:
            {
                fe_notificacion: 	 null,
                hh_inicio:           null,
                hh_fin:              null,
            },
            pickers:
            {
                fe_notificacion: 	 null,
                hh_inicio:           null,
                hh_fin:              null,
            },
            form:
            {
                id: 	               null,
				co_notificacion: 	   null,
				id_tipo_destinatario:  null,
				id_destinatario: 	   null,
				tx_asunto: 	           null,
				tx_mensaje: 	       null,
				tx_lugar: 	           null,
				id_tipo_notificacion:  null,
				id_tipo_prioridad: 	   null,
				fe_notificacion: 	   null,
				hh_inicio: 	           null,
				hh_fin: 	           null,
				tx_observaciones: 	   null,
				id_status: 	           null,
				id_usuario: 	       null,
            },
            selects: {

                tipoDestinatario: [],
                tipoNotificacion: [],
                tipoPrioridad:    [],

            },
            data: {
                destinatario:     null,
                tipoDestinatario: null,
                tipoNotificacion: null,
                tipoPrioridad:    null,
            },
            default:
            {
                id_status: 1 
            },
        }
    },

    methods:
    {

        getCombos()
        {
            this.getResource( `notificacion/combos`).then( data => 
            {
                this.selects.tipoDestinatario = data.tipoDestinatario
                this.selects.tipoNotificacion = data.tipoNotificacion
                this.selects.tipoPrioridad    = data.tipoPrioridad

                this.getDataTipoDestinatario(this.tipoDestinatario)
                this.getDataTipoNotificacion(this.tipoNotificacion);
                this.getDataTipoPrioridad(this.tipoPrioridad)
            })

            this.getResource( `notificacion/destinatario/${this.tipoDestinatario}/${this.idDestinatario}`).then( data => 
            {
                this.data.destinatario = data.destinatario;
            })
        },

        getDataTipoDestinatario(tipoDestinatario)
        {
            this.data.tipoDestinatario = this.selects.tipoDestinatario.find( tipo => tipo.id == tipoDestinatario)
        },

        getDataTipoNotificacion(tipoNotificacion)
        {
            this.data.tipoNotificacion = this.selects.tipoNotificacion.find( tipo => tipo.id == tipoNotificacion)
        },

        getDataTipoPrioridad(tipoPrioridad)
        {
            this.data.tipoPrioridad = this.selects.tipoPrioridad.find( tipo => tipo.id == tipoPrioridad)
        },

        store()
        {
             this.storeResource( `notificacion`, this.form).then( data => 
            {
               this.showMessage(data.msj)
               this.$emit('closeModal')
            })
        }

    }
}
</script>

<style>
</style>
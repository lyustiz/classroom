<template>

    <v-form ref="form" v-model="valid" lazy-validation>

    <v-card :loading="loading" flat>

        <app-simple-toolbar title="Mensaje" @closeModal="$emit('closeModal')"></app-simple-toolbar>

            <v-list >
            
            <v-list-item v-if="data.destinatario && data.tipoDestinatario" > 
                <v-list-item-avatar color="grey lighten-4" :size="46">
                    <v-icon size="40" :color="data.tipoDestinatario.tx_color">{{data.tipoDestinatario.tx_icono}}</v-icon>
                </v-list-item-avatar>
            
                <v-list-item-content>
                <v-list-item-title v-text="data.destinatario.nb_corto"></v-list-item-title>
                <v-list-item-subtitle >{{data.tipoDestinatario.nb_tipo_destinatario}}</v-list-item-subtitle>
                </v-list-item-content>

                <v-list-item-action color="grey lighten-3">

                    <v-menu :close-on-content-click="false" left bottom offset-x width="200px" content-class="white rounded-xl">
                        <template v-slot:activator="{ on }">
                            <v-btn fab color="lighten-3" depressed small>
                                <v-icon v-on="on" :color="data.tipoMensaje.tx_color">{{data.tipoMensaje.tx_icono}}</v-icon>
                            </v-btn>
                        </template>
                        <v-select
                            :items="selects.tipoMensaje"
                            item-text="nb_tipo_mensaje"
                            item-value="id"
                            v-model="form.id_tipo_mensaje"
                            :rules="[rules.select]"
                            label="Tipo Mensaje"
                            :loading="loading"
                            dense
                            rounded
                            filled
                            hide-details
                            @change="getDataTipoMensaje($event)"
                            :readonly="readonly"
                        ></v-select>
                    </v-menu>

                </v-list-item-action>
  
                <v-list-item-action color="grey lighten-3">

                    <v-menu :close-on-content-click="false" left bottom offset-x width="200px" content-class="white rounded-xl">
                        <template v-slot:activator="{ on }">
                             <v-btn fab color="lighten-3" depressed small>
                                <v-icon v-on="on" :color="data.tipoPrioridad.tx_color">{{data.tipoPrioridad.tx_icono}}</v-icon>
                            </v-btn>
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

        <v-card-text class="py-0"> 

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
                :rules="[rules.max(80)]"
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
                v-model="pickers.fe_mensaje"
                :close-on-content-click="false"
                min-width="290px"
            >
                <template v-slot:activator="{ on }">
                    <v-text-field
                        v-model="dates.fe_mensaje"
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
                    v-model="form.fe_mensaje" 
                    @input="dates.fe_mensaje = formatPicker(form.fe_mensaje, 'fe_mensaje')">
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
                    class="ml-2"
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
                    class="ml-2"
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

        <v-card-actions class="pt-0">
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

        tipoMensaje: {
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
        this.form.id_tipo_mensaje      = this.tipoMensaje
        this.form.id_tipo_prioridad    = this.tipoPrioridad
        this.form.fe_mensaje           = this.fecha
        this.form.hh_inicio            = this.inicio
        this.form.hh_fin               = this.fin

        this.dates.fe_mensaje     = this.formatDate(this.fecha)

    },

    data() {
        return {
            resource: 'mensaje',
            dates:
            {
                fe_mensaje:   null,
                hh_inicio:    null,
                hh_fin:       null,
            },
            pickers:
            {
                fe_mensaje:   null,
                hh_inicio:    null,
                hh_fin:       null,
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
				id_tipo_mensaje:       null,
				id_tipo_prioridad: 	   null,
				fe_mensaje: 	       null,
				hh_inicio: 	           null,
				hh_fin: 	           null,
				tx_observaciones: 	   null,
				id_status: 	           null,
				id_usuario: 	       null,
            },
            selects: {

                tipoDestinatario: [],
                tipoMensaje: [],
                tipoPrioridad:    [],

            },
            data: {
                destinatario:     null,
                tipoDestinatario: null,
                tipoMensaje: null,
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
            this.getResource( `mensaje/combos`).then( data => 
            {
                this.selects.tipoDestinatario = data.tipoDestinatario
                this.selects.tipoMensaje      = data.tipoMensaje
                this.selects.tipoPrioridad    = data.tipoPrioridad

                this.getDataTipoDestinatario(this.tipoDestinatario)
                this.getDataTipoMensaje(this.tipoMensaje);
                this.getDataTipoPrioridad(this.tipoPrioridad)
            })

            this.getResource( `mensaje/destinatario/${this.tipoDestinatario}/${this.idDestinatario}`).then( data => 
            {
                this.data.destinatario = data.destinatario;
            })
        },

        getDataTipoDestinatario(tipoDestinatario)
        {
            this.data.tipoDestinatario = this.selects.tipoDestinatario.find( tipo => tipo.id == tipoDestinatario)
        },

        getDataTipoMensaje(tipoMensaje)
        {
            this.data.tipoMensaje = this.selects.tipoMensaje.find( tipo => tipo.id == tipoMensaje)
        },

        getDataTipoPrioridad(tipoPrioridad)
        {
            this.data.tipoPrioridad = this.selects.tipoPrioridad.find( tipo => tipo.id == tipoPrioridad)
        },

        store()
        {
             this.storeResource( `mensaje`, this.form).then( data => 
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
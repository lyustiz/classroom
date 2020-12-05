<template>

    <v-form ref="form" v-model="valid" lazy-validation>

    <v-card :loading="loading" flat>

        <app-simple-toolbar title="Notificacion" @closeModal="$emit('closeModal')"></app-simple-toolbar>

            <v-list class="my-n2">
            
            <v-list-item v-if="data.destinatario && data.tipoDestinatario" > 
                <v-list-item-avatar color="grey lighten-4" :size="46">
                    <v-icon size="35" :color="data.tipoDestinatario.tx_color">{{data.tipoDestinatario.tx_icono}}</v-icon>
                </v-list-item-avatar>
                <v-list-item-content>
                    <v-list-item-title v-text="data.destinatario.nb_corto"></v-list-item-title>
                    <v-list-item-subtitle >{{data.tipoDestinatario.nb_tipo_destinatario}}</v-list-item-subtitle>
                </v-list-item-content>
                <v-list-item-action color="grey lighten-4">
                    <v-menu :close-on-content-click="false" left bottom offset-x width="200px" content-class="white rounded-xl">
                        <template v-slot:activator="{ on }">
                            <v-icon size="30"  v-on="on" :color="data.tipoNotificacion.tx_color">{{data.tipoNotificacion.tx_icono}}</v-icon>
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
            <v-textarea
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
                counter
                maxlength="300"
                rows="2"
            ></v-textarea>
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

        idDestinatario: {
            type: Number,
            default: null
        },

        mensaje: {
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
        this.form.tx_mensaje           = this.mensaje
        this.form.id_tipo_notificacion = this.tipoNotificacion
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
				id_tipo_destinatario:  null,
				id_destinatario: 	   null,
				tx_mensaje: 	       null,
				id_tipo_notificacion:  null,
				id_usuario: 	       null,
            },
            selects: {

                tipoDestinatario: [],
                tipoNotificacion: [],

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

                this.getDataTipoDestinatario(this.tipoDestinatario)
                this.getDataTipoNotificacion(this.tipoNotificacion);
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
<template>

    <v-form ref="form" v-model="valid" lazy-validation>

    <v-card :loading="loading" >

        <v-card-text>

        <v-row>

                 
        <v-col cols="12" md="6">
            <v-text-field
                :rules="[rules.required]"
                v-model="form.co_notificacion"
                label="Notificacion"
                placeholder="Indique Notificacion"
                dense
            ></v-text-field>
        </v-col>
                          
        <v-col cols="12" md="6">
            <v-select
            :items="selects.tipoDestinatario"
            item-text="nb_tipo_destinatario"
            item-value="id"
            v-model="form.id_tipo_destinatario"
            :rules="[rules.select]"
            label="Tipo Destinatario"
            :loading="loading"
            dense
            ></v-select>
        </v-col>
                  
        <v-col cols="12" md="6">
            <v-select
            :items="selects.destinatario"
            item-text="nb_destinatario"
            item-value="id"
            v-model="form.id_destinatario"
            :rules="[rules.select]"
            label="Destinatario"
            :loading="loading"
            dense
            ></v-select>
        </v-col>
          
        <v-col cols="12" md="6">
            <v-text-field
                :rules="[rules.required]"
                v-model="form.tx_asunto"
                label="Asunto"
                placeholder="Indique Asunto"
                dense
            ></v-text-field>
        </v-col>
                  
        <v-col cols="12" md="6">
            <v-text-field
                :rules="[rules.required]"
                v-model="form.tx_mensaje"
                label="Mensaje"
                placeholder="Indique Mensaje"
                dense
            ></v-text-field>
        </v-col>
                  
        <v-col cols="12" md="6">
            <v-text-field
                :rules="[rules.required]"
                v-model="form.tx_lugar"
                label="Lugar"
                placeholder="Indique Lugar"
                dense
            ></v-text-field>
        </v-col>
                          
        <v-col cols="12" md="6">
            <v-select
            :items="selects.tipoNotificacion"
            item-text="nb_tipo_notificacion"
            item-value="id"
            v-model="form.id_tipo_notificacion"
            :rules="[rules.select]"
            label="Tipo Notificacion"
            :loading="loading"
            dense
            ></v-select>
        </v-col>
                  
        <v-col cols="12" md="6">
            <v-select
            :items="selects.tipoPriodidad"
            item-text="nb_tipo_prioridad"
            item-value="id"
            v-model="form.id_tipo_prioridad"
            :rules="[rules.select]"
            label="Tipo Priodidad"
            :loading="loading"
            dense
            ></v-select>
        </v-col>
         
        <v-col cols="12" md="6">
            <v-menu
                v-model="pickers.fe_notificacion"
                :close-on-content-click="false"
                min-width="290px"
            >
                <template v-slot:activator="{ on }">
                    <v-text-field
                        v-model="dates.fe_notificacion"
                        :rules="[rules.fecha]"
                        label="Notificacion"
                        prepend-icon="event"
                        readonly
                        v-on="on"
                        dense
                    ></v-text-field>
                </template>
                <v-date-picker 
                    v-model="form.fe_notificacion" 
                    @input="dates.fe_notificacion = formatPicker(form.fe_notificacion, 'fe_notificacion')">
                </v-date-picker>
            </v-menu>
        </v-col> 
        <v-col cols="12" md="6">
            <v-text-field
                :rules="[rules.required]"
                v-model="form.hh_inicio"
                label="Inicio"
                placeholder="Indique Inicio"
                dense
            ></v-text-field>
        </v-col>
                  
        <v-col cols="12" md="6">
            <v-text-field
                :rules="[rules.required]"
                v-model="form.hh_fin"
                label="Fin"
                placeholder="Indique Fin"
                dense
            ></v-text-field>
        </v-col>
                  
        <v-col cols="12" md="6">
            <v-text-field
                :rules="[rules.required]"
                v-model="form.tx_observaciones"
                label="Observaciones"
                placeholder="Indique Observaciones"
                dense
            ></v-text-field>
        </v-col>
                          
        <v-col cols="12" md="6">
            <v-select
            :items="selects.status"
            item-text="nb_status"
            item-value="id"
            v-model="form.id_status"
            :rules="[rules.select]"
            label="Status"
            :loading="loading"
            dense
            ></v-select>
        </v-col>
         

        </v-row>

        </v-card-text>

        <v-card-actions>
            <v-spacer></v-spacer>
            <form-buttons
                @update="update()"
                @store="store()"
                @clear="clear()"
                @cancel="cancel()"
                :action="action"
                :valid="valid"
                :loading="loading"
            ></form-buttons>
        </v-card-actions>

        <pre v-if="$App.debug">{{ $data }}</pre>

    </v-card>
    
    </v-form>

</template>

<script>

import Appform from '@mixins/Appform';

export default {
    mixins: [Appform],
    data() {
        return {
            resource: 'notificacion',
            dates:
            {
                fe_notificacion: 	 null,
            },
            pickers:
            {
                fe_notificacion: 	 null,
            },
            form:
            {
                id: 	              null,
				co_notificacion: 	  null,
				id_tipo_destinatario: null,
				id_destinatario: 	  null,
				tx_asunto: 	          null,
				tx_mensaje: 	      null,
				tx_lugar: 	          null,
				id_tipo_notificacion: null,
				id_tipo_prioridad: 	  null,
				fe_notificacion: 	  null,
				hh_inicio: 	          null,
				hh_fin: 	          null,
				tx_observaciones: 	  null,
				id_status: 	          null,
				id_usuario: 	      null,
            },
            selects:
            {
                tipoDestinatario: 	 [],
	 	 	 	destinatario: 	 [],
	 	 	 	tipoNotificacion: 	 [],
	 	 	 	tipoPriodidad: 	 [],
	 	 	 	status: 	 [],
            },
        }
    },

    methods:
    {

    }
}
</script>

<style>
</style>
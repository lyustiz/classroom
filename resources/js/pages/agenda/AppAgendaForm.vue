<template>

    <v-form ref="form" v-model="valid" lazy-validation >

    <v-card :loading="loading" flat>

        <v-card-text>

        <v-row>
                 
        <v-col cols="12" >
            <v-text-field
                :rules="[rules.required]"
                v-model="form.nb_agenda"
                label="Actividad"
                placeholder="Indique Nombre Actividad"
                dense
            ></v-text-field>
        </v-col>

        <v-col cols="12" md="6">
            <v-select
            :items="selects.tipoAgenda"
            item-text="nb_tipo_agenda"
            item-value="id"
            v-model="form.id_tipo_agenda"
            :rules="[rules.select]"
            label="Tipo Agenda"
            :loading="loading"
            dense
            >
                <template v-slot:item="{ item }">
                    <v-icon :color="item.tx_color">mdi-circle-slice-8</v-icon>
                    <span class="body-2 ml-2" v-text="item.nb_tipo_agenda"></span>
                </template>
            </v-select>
        </v-col>

        <v-col cols="12" md="6">
            <v-select
            :items="selects.agendaActividad"
            item-text="nb_agenda_actividad"
            item-value="id"
            v-model="form.id_agenda_actividad"
            :rules="[rules.select]"
            label="Tipo Actividad"
            :loading="loading"
            dense
            >
            <template v-slot:item="{ item }">
                    <v-icon color="indigo" v-text="item.tx_icono"></v-icon>
                    <span class="body-2 ml-2" v-text="item.nb_agenda_actividad"></span>
                </template>
            </v-select>
        </v-col>
         
        <v-col cols="12" md="4">
            <v-menu
                v-model="pickers.fe_agenda"
                :close-on-content-click="false"
                min-width="290px"
            >
                <template v-slot:activator="{ on }">
                    <v-text-field
                        v-model="dates.fe_agenda"
                        :rules="[rules.fecha]"
                        label="Fecha"
                        prepend-icon="event"
                        readonly
                        v-on="on"
                        dense
                    ></v-text-field>
                </template>
                <v-date-picker 
                    v-model="form.fe_agenda" 
                    @input="dates.fe_agenda = formatPicker(form.fe_agenda, 'fe_agenda')">
                </v-date-picker>
            </v-menu>
        </v-col>
        
        <v-col cols="12" md="4">
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
                ></v-text-field>
                </template>
                <v-time-picker
                ampm-in-title
                scrollable
                v-if="pickers.hh_inicio"
                v-model="form.hh_inicio"
                full-width
                @click:minute="$refs.pickers1.save(form.hh_inicio)"
                ></v-time-picker>
            </v-menu>
        </v-col> 

        <v-col cols="12" md="4">
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
                ></v-text-field>
                </template>
                <v-time-picker
                ampm-in-title
                scrollable
                v-if="pickers.hh_fin"
                v-model="form.hh_fin"
                full-width
                @click:minute="$refs.pickers2.save(form.hh_fin)"
                ></v-time-picker>
            </v-menu>
        </v-col> 
          
        <v-col cols="12">
            <v-text-field
                :rules="[rules.max(80)]"
                v-model="form.tx_observaciones"
                label="Descripcion"
                placeholder="Indique Descripcion"
                dense
            ></v-text-field>
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

    props:
    {
        date: {
            type:       Object,
            default:    () => {}
        },
    },

    computed:
    {
        calendario()
        {
            return this.$store.getters['getCalendario']
        },
    },
    
    data() {
        return {
            resource: 'agenda',
            dates:
            {
                fe_agenda: 	 null,
	 	 	 	hh_inicio: 	 null,
	 	 	 	hh_fin: 	 null,
            },
            pickers:
            {
                fe_agenda: 	 null,
	 	 	 	hh_inicio: 	 null,
	 	 	 	hh_fin: 	 null,
            },
            form:
            {
                id: 	             null,
				nb_agenda: 	         null,
				id_calendario: 	     null,
                id_tipo_agenda:      null,
                id_agenda_actividad: null,
				fe_agenda: 	         null,
				hh_inicio: 	         null,
				hh_fin: 	         null,
				id_origen: 	         null,
				tx_observaciones:    null,
				id_status: 	         null,
				id_usuario: 	     null,
            },
            selects:
            {
                tipoAgenda: 	     [],
                agendaActividad: 	 [],
            },
            default:
            {
                id_origen:     0,
                id_status:     1
            }
        }
    },

    methods:
    {
        setDefaultForm()
        {
            this.form.id_calendario = this.calendario.id
            
            this.form.fe_agenda     = this.date.date

            this.dates.fe_agenda    = this.formatDate(this.date.date)
        },

        mapForm()
        {
            this.form.id                = this.item.id,
			this.form.nb_agenda         = this.item.name,
            this.form.id_tipo_agenda    = this.item.categoryId,
            this.form.id_agenda_actividad = this.item.typeId,
            this.form.hh_inicio         = this.item.startHour.substr(0, 5),
			this.form.hh_fin            = this.item.endHour.substr(0, 5),
			this.dates.hh_inicio        = this.formatTime(this.item.startHour),
			this.dates.hh_fin           = this.formatTime(this.item.endHour),
			this.form.tx_observaciones  = this.item.description
        }
    }
}
</script>

<style>
</style>
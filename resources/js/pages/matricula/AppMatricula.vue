<template>

    <v-form ref="form" v-model="valid" lazy-validation>

    <v-card :loading="loading" flat>

        <v-card-text>

        <v-row>
                  
        <v-col cols="12" md="6">
            <v-select
            :items="selects.grado"
            item-text="nb_grado"
            item-value="id"
            v-model="form.id_grado"
            :rules="[rules.select]"
            label="Seleccione Grado"
            :loading="loading"
            dense
            @change="getGrupo($event)"
            ></v-select>
        </v-col>
                  
        <v-col cols="12" md="6">
            <v-select
            :items="grupo"
            item-text="nb_grupo"
            item-value="id"
            v-model="form.id_grupo"
            :rules="[rules.select]"
            label="Seleccione Grupo"
            :loading="loading"
            dense
            :disabled="grupo.length < 1"
            ></v-select>
        </v-col>
         
        <v-col cols="12" md="6">
            <v-menu
                v-model="pickers.fe_matricula"
                :close-on-content-click="false"
                min-width="290px"
            >
                <template v-slot:activator="{ on }">
                    <v-text-field
                        v-model="dates.fe_matricula"
                        :rules="[rules.fecha]"
                        label="Fecha Matricula"
                        prepend-icon="event"
                        readonly
                        v-on="on"
                        dense
                    ></v-text-field>
                </template>
                <v-date-picker 
                    v-model="form.fe_matricula" 
                    @input="dates.fe_matricula = formatPicker(form.fe_matricula, 'fe_matricula')">
                </v-date-picker>
            </v-menu>
        </v-col>         
        <v-col cols="12" md="6">
            <v-select
            :items="selects.tipoCondicion"
            item-text="nb_tipo_condicion"
            item-value="id"
            v-model="form.id_tipo_condicion"
            :rules="[rules.select]"
            label="Condicion"
            :loading="loading"
            dense
            ></v-select>
        </v-col>
                  
        <v-col cols="12" md="6">
            <v-select
            :items="selects.colegioOrigen"
            item-text="nb_colegio_origen"
            item-value="id"
            v-model="form.id_colegio_origen"
            label="Colegio Origen"
            :loading="loading"
            dense
            ></v-select>
        </v-col>
          
        <v-col cols="12" md="6">
            <v-text-field
                :rules="[rules.max(80)]"
                v-model="form.tx_observaciones"
                label="Observaciones"
                placeholder="Indique Observaciones"
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

import AppData from '@mixins/AppData';
import AppSelect from '@mixins/AppSelect';

export default {

    mixins: [ AppData, AppSelect ],

    props:
    {
        matricula: {
            type:       Object,
            default:    null
        },

        alumno:{
            type:       Number,
            default:    null
        },
    },

    created()
    {
        this.fillSelects()

        if(this.matricula)
        {
            this.getGrupo(this.matricula.id_grado)
            this.mapData(this.matricula)
            this.action = 'upd'
            
        }else{
            this.default.id_alumno     = this.alumno
            this.action = 'ins'
        }

        this.default.id_calendario = 1 //TODO: get calendario 
    },

    data() {
        return {
            resource: 'matricula',
            action: '',
            dates:
            {
                fe_matricula: 	 null,
            },
            pickers:
            {
                fe_matricula: 	 null,
            },
            form:
            {
                id: 	           null,
                id_calendario: 	   null,
                id_alumno: 	       null,
				id_grado: 	       null,
				id_grupo: 	       null,
				fe_matricula: 	   null,
				id_tipo_condicion: null,
				id_colegio_origen: null,
				tx_observaciones:  null,
				id_usuario: 	   null,
            },
            selects:
            {
	 	 	 	grado: 	       [],
	 	 	 	tipoCondicion: [],
	 	 	 	status: 	   [],
            },
            default:
            {
                id_status:     1
            },
            grupo: []
        }
    },

    methods:
    {
        getGrupo(grado)
        {
            this.grupo = []
            this.getResource( `grupo/grado/${grado}`).then( data =>  this.grupo = data)
        },

        store()
        {
            this.storeResource(this.resource, this.form).then( (data) =>  
            {
                this.showMessage(data.msj)
                this.$emit('closeModal', 'refresh')
            })
        },

        update()
        {
            this.updateResource(`${this.resource}/${this.form.id}` , this.form).then( (data) =>  
            {
                this.showMessage(data.msj)
                this.$emit('closeModal', 'refresh')
            })
        },

        cancel()
        {
            this.$emit('closeModal')
        }
    }
}
</script>

<style>
</style>
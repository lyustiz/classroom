<template>

    <v-form ref="form" v-model="valid" lazy-validation>

    <v-card :loading="loading" flat >

        <v-card-text>

        <v-row>

        <v-col cols="6" md="3">
            <v-text-field
                :rules="[rules.required]"
                v-model="form.nb_nombre"
                label="Nombre"
                placeholder="Indique Nombre"
                dense
            ></v-text-field>
        </v-col>
                  
        <v-col cols="6" md="3">
            <v-text-field
                :rules="[rules.max(100)]"
                v-model="form.nb_nombre2"
                label="Nombre2"
                placeholder="Indique Nombre2"
                dense
            ></v-text-field>
        </v-col>

        <v-col cols="6" md="3">
            <v-text-field
                :rules="[rules.required]"
                v-model="form.nb_apellido"
                label="Apellido"
                placeholder="Indique Apellido"
                dense
            ></v-text-field>
        </v-col>
                  
        <v-col cols="6" md="3">
            <v-text-field
                :rules="[rules.max(100)]"
                v-model="form.nb_apellido2"
                label="Apellido2"
                placeholder="Indique Apellido2"
                dense
            ></v-text-field>
        </v-col>
                  
        
                          
        <v-col cols="6" md="3">
            <v-select
            :items="selects.estadoCivil"
            item-text="nb_estado_civil"
            item-value="id"
            v-model="form.id_estado_civil"
            :rules="[rules.select]"
            label="Estado Civil"
            :loading="loading"
            dense
            ></v-select>
        </v-col>
          
        <v-col cols="6" md="3">
            <v-radio-group v-model="form.tx_sexo" prepend-icon="mdi-human-male-female" :rules="[rules.radio]" row>
                <v-radio
                    v-for="(sexo, idx) in sexos"
                    :key="idx"
                    :label="sexo"
                    :value="sexo"
                ></v-radio>
            </v-radio-group>
        </v-col>
                 
        

        <v-col cols="6" md="3">
            <v-select
            :items="selects.tipoDocumento"
            item-text="nb_tipo_documento"
            item-value="id"
            v-model="form.id_tipo_documento"
            :rules="[rules.select]"
            label="Tipo Documento"
            :loading="loading"
            dense
            ></v-select>
        </v-col>
          
        <v-col cols="6" md="3">
            <v-text-field
                :rules="[rules.required]"
                v-model="form.tx_documento"
                label="Documento"
                placeholder="Indique Documento"
                dense
            ></v-text-field>
        </v-col>

        <v-col cols="6" md="3" class="pb-6">
            <v-menu
                v-model="pickers.fe_nacimiento"
                :close-on-content-click="false"
                min-width="290px"
            >
                <template v-slot:activator="{ on }">
                    <v-text-field
                        v-model="dates.fe_nacimiento"
                        :rules="[rules.fecha]"
                        label="Nacimiento"
                        prepend-icon="event"
                        readonly
                        v-on="on"
                        dense
                    ></v-text-field>
                </template>
                <v-date-picker 
                    ref="fe_nacimiento"
                    v-model="form.fe_nacimiento" 
                    @input="dates.fe_nacimiento = formatPicker(form.fe_nacimiento, 'fe_nacimiento')"
                    :max="new Date().toISOString().substr(0, 10)"
                    min="1950-01-01">
                </v-date-picker>
            </v-menu>
        </v-col>      
                  
        <v-col cols="6" md="3">
            <v-text-field
                :rules="[rules.required]"
                v-model="form.tx_lugar_nacimiento"
                label="Lugar Nacimiento"
                placeholder="Indique Lugar Nacimiento"
                dense
            ></v-text-field>
        </v-col>
                  
        <v-col cols="6" md="3">
            <v-text-field
                :rules="[rules.required]"
                v-model="form.tx_direccion"
                label="Direccion"
                placeholder="Indique Direccion"
                dense
            ></v-text-field>
        </v-col>
                          
        <v-col cols="6" md="3">
            <v-select
            :items="selects.departamento"
            item-text="nb_departamento"
            item-value="id"
            v-model="form.id_departamento"
            :rules="[rules.select]"
            label="Departamento"
            :loading="loading"
            dense
            @change="getCiudades($event)"
            ></v-select>
        </v-col>
                  
        <v-col cols="6" md="3">
            <v-select
            :items="ciudad"
            item-text="nb_ciudad"
            item-value="id"
            v-model="form.id_ciudad"
            :rules="[rules.select]"
            label="Ciudad"
            :loading="loading"
            dense
            :readonly="ciudad.length < 1"
            ></v-select>
        </v-col>
          
        <v-col cols="6" md="3">
            <v-text-field
                :rules="rules.email"
                v-model="form.tx_email"
                label="Email"
                placeholder="Indique Email"
                dense
            ></v-text-field>
        </v-col>
                  
        <v-col cols="6" md="3">
            <v-text-field
                :rules="[rules.required]"
                v-model="form.tx_telefono"
                label="Telefono"
                placeholder="Indique Telefono"
                dense
            ></v-text-field>
        </v-col>
                  
        <v-col cols="6" md="3">
            <v-text-field
                :rules="[rules.required]"
                v-model="form.tx_telefono_movil"
                label="Telefono Movil"
                placeholder="Indique Telefono Movil"
                dense
            ></v-text-field>
        </v-col>
                          
        <v-col cols="6" md="3">
            <v-select
            :items="selects.cargo"
            item-text="nb_cargo"
            item-value="id"
            v-model="form.id_cargo"
            :rules="[rules.select]"
            label="Cargo"
            :loading="loading"
            dense
            ></v-select>
        </v-col>
 
        <v-col cols="6" md="3">
            <v-text-field
                :rules="[]"
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

import Appform from '@mixins/Appform';

export default {

    mixins: [Appform],

    watch:
    {
        'pickers.fe_nacimiento': function (val){
            val && setTimeout(() => (this.$refs.fe_nacimiento.activePicker = 'YEAR'))
        },
    },

    data() {
        return {
            resource: 'empleado',
            dates:
            {
                fe_nacimiento: 	 null,
            },
            pickers:
            {
                fe_nacimiento: 	 null,
            },
            form:
            {
                id:                  null,
				nb_apellido:         null,
				nb_apellido2:        null,
				nb_nombre:           null,
				nb_nombre2:          null,
				id_estado_civil:     null,
				tx_sexo:             null,
				fe_nacimiento:       null,
				id_tipo_documento:   null,
				tx_documento:        null,
				tx_lugar_nacimiento: null,
				tx_direccion:        null,
				id_departamento:     null,
				id_ciudad:           null,
				tx_email:            null,
				tx_telefono:         null,
				tx_telefono_movil:   null,
				id_cargo:            null,
				bo_profesor:         null,
				tx_observaciones:    null,
				id_status:           null,
				id_usuario:          null,
            },
            selects:
            {
                estadoCivil: 	[],
	 	 	 	tipoDocumento: 	[],
	 	 	 	departamento: 	[],
	 	 	 	cargo: 	        [],
            },
            sexos: [ 'M', 'F' ],
            defaultForm:{
                bo_profesor: 0
            },
            ciudad:[],
        }
    },

    methods:
    {
        onCreateForm()
        {
            if(this.action == 'upd'){
                this.getCiudades(this.item.id_departamento)
            } else {
                this.ciudad = []
            }
        },
        
        getCiudades(idDepartamento){
            this.getResource(`ciudad/departamento/${idDepartamento}`).then(ciudades=>{
                this.ciudad = ciudades
            })
        }

    }
}
</script>

<style>
</style>
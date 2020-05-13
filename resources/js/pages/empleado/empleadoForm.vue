<template>

    <v-form ref="form" v-model="valid" lazy-validation>

    <v-card :loading="loading" >

        <v-card-text>

        <v-row>

                 
        <v-col cols="12" md="6">
            <v-text-field
                :rules="[rules.required]"
                v-model="form.nb_apellido"
                label="Apellido"
                placeholder="Indique Apellido"
                dense
            ></v-text-field>
        </v-col>
                  
        <v-col cols="12" md="6">
            <v-text-field
                :rules="[rules.required]"
                v-model="form.nb_apellido2"
                label="Apellido2"
                placeholder="Indique Apellido2"
                dense
            ></v-text-field>
        </v-col>
                  
        <v-col cols="12" md="6">
            <v-text-field
                :rules="[rules.required]"
                v-model="form.nb_nombre"
                label="Nombre"
                placeholder="Indique Nombre"
                dense
            ></v-text-field>
        </v-col>
                  
        <v-col cols="12" md="6">
            <v-text-field
                :rules="[rules.required]"
                v-model="form.nb_nombre2"
                label="Nombre2"
                placeholder="Indique Nombre2"
                dense
            ></v-text-field>
        </v-col>
                          
        <v-col cols="12" md="6">
            <v-select
            :items="selects.estado_civil"
            item-text="nb_estado_civil"
            item-value="id"
            v-model="form.id_estado_civil"
            :rules="[rules.select]"
            label="Estado Civil"
            autocomplete
            dense
            ></v-select>
        </v-col>
          
        <v-col cols="12" md="6">
            <v-text-field
                :rules="[rules.required]"
                v-model="form.tx_sexo"
                label="Sexo"
                placeholder="Indique Sexo"
                dense
            ></v-text-field>
        </v-col>
                 
        <v-col cols="12" md="3">
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
                    v-model="form.fe_nacimiento" 
                    @input="dates.fe_nacimiento = formatPicker(form.fe_nacimiento, 'fe_nacimiento')">
                </v-date-picker>
            </v-menu>
        </v-col>         
        <v-col cols="12" md="6">
            <v-select
            :items="selects.tipo_documento"
            item-text="nb_tipo_documento"
            item-value="id"
            v-model="form.id_tipo_documento"
            :rules="[rules.select]"
            label="Tipo Documento"
            autocomplete
            dense
            ></v-select>
        </v-col>
          
        <v-col cols="12" md="6">
            <v-text-field
                :rules="[rules.required]"
                v-model="form.tx_documento"
                label="Documento"
                placeholder="Indique Documento"
                dense
            ></v-text-field>
        </v-col>
                  
        <v-col cols="12" md="6">
            <v-text-field
                :rules="[rules.required]"
                v-model="form.tx_lugar_nacimiento"
                label="Lugar Nacimiento"
                placeholder="Indique Lugar Nacimiento"
                dense
            ></v-text-field>
        </v-col>
                  
        <v-col cols="12" md="6">
            <v-text-field
                :rules="[rules.required]"
                v-model="form.tx_direccion"
                label="Direccion"
                placeholder="Indique Direccion"
                dense
            ></v-text-field>
        </v-col>
                          
        <v-col cols="12" md="6">
            <v-select
            :items="selects.departamento"
            item-text="nb_departamento"
            item-value="id"
            v-model="form.id_departamento"
            :rules="[rules.select]"
            label="Departamento"
            autocomplete
            dense
            ></v-select>
        </v-col>
                  
        <v-col cols="12" md="6">
            <v-select
            :items="selects.ciudad"
            item-text="nb_ciudad"
            item-value="id"
            v-model="form.id_ciudad"
            :rules="[rules.select]"
            label="Ciudad"
            autocomplete
            dense
            ></v-select>
        </v-col>
          
        <v-col cols="12" md="6">
            <v-text-field
                :rules="[rules.required]"
                v-model="form.tx_email"
                label="Email"
                placeholder="Indique Email"
                dense
            ></v-text-field>
        </v-col>
                  
        <v-col cols="12" md="6">
            <v-text-field
                :rules="[rules.required]"
                v-model="form.tx_telefono"
                label="Telefono"
                placeholder="Indique Telefono"
                dense
            ></v-text-field>
        </v-col>
                  
        <v-col cols="12" md="6">
            <v-text-field
                :rules="[rules.required]"
                v-model="form.tx_telefono_movil"
                label="Telefono Movil"
                placeholder="Indique Telefono Movil"
                dense
            ></v-text-field>
        </v-col>
                          
        <v-col cols="12" md="6">
            <v-select
            :items="selects.cargo"
            item-text="nb_cargo"
            item-value="id"
            v-model="form.id_cargo"
            :rules="[rules.select]"
            label="Cargo"
            autocomplete
            dense
            ></v-select>
        </v-col>
         
            <v-checkbox
                  :rules="[rules.required]"
                  v-model="form.bo_profesor"
                  label="Profesor"
                  dense
            ></v-checkbox>
 
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
            autocomplete
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
                :loading:="loading"
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
                id: 	null,
				nb_apellido: 	null,
				nb_apellido2: 	null,
				nb_nombre: 	null,
				nb_nombre2: 	null,
				id_estado_civil: 	null,
				tx_sexo: 	null,
				fe_nacimiento: 	null,
				id_tipo_documento: 	null,
				tx_documento: 	null,
				tx_lugar_nacimiento: 	null,
				tx_direccion: 	null,
				id_departamento: 	null,
				id_ciudad: 	null,
				tx_email: 	null,
				tx_telefono: 	null,
				tx_telefono_movil: 	null,
				id_cargo: 	null,
				bo_profesor: 	null,
				tx_observaciones: 	null,
				id_status: 	null,
				id_usuario: 	null,
            },
            selects:
            {
                estado_civil: 	 [],
	 	 	 	tipo_documento: 	 [],
	 	 	 	departamento: 	 [],
	 	 	 	ciudad: 	 [],
	 	 	 	cargo: 	 [],
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
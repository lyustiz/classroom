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
                v-model="form.tx_sexo"
                label="Sexo"
                placeholder="Indique Sexo"
                dense
            ></v-text-field>
        </v-col>
                 
        <v-col cols="12" md="6">
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
            <v-text-field
                :rules="[rules.required]"
                v-model="form.tx_nacionalidad"
                label="Nacionalidad"
                placeholder="Indique Nacionalidad"
                dense
            ></v-text-field>
        </v-col>
                          
        <v-col cols="12" md="6">
            <v-select
            :items="selects.alumno"
            item-text="nb_alumno"
            item-value="id"
            v-model="form.id_alumno"
            :rules="[rules.select]"
            label="Alumno"
            :loading="loading"
            dense
            ></v-select>
        </v-col>
                  
        <v-col cols="12" md="6">
            <v-select
            :items="selects.parentesco"
            item-text="nb_parentesco"
            item-value="id"
            v-model="form.id_parentesco"
            :rules="[rules.select]"
            label="Parentesco"
            :loading="loading"
            dense
            ></v-select>
        </v-col>
          
        <v-col cols="12" md="6">
            <v-text-field
                :rules="[rules.required]"
                v-model="form.tx_empresa"
                label="Empresa"
                placeholder="Indique Empresa"
                dense
            ></v-text-field>
        </v-col>
                  
        <v-col cols="12" md="6">
            <v-text-field
                :rules="[rules.required]"
                v-model="form.tx_cargo"
                label="Cargo"
                placeholder="Indique Cargo"
                dense
            ></v-text-field>
        </v-col>
                  
        <v-col cols="12" md="6">
            <v-text-field
                :rules="[rules.required]"
                v-model="form.tx_ocupacion"
                label="Ocupacion"
                placeholder="Indique Ocupacion"
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
                v-model="form.tx_telefono2"
                label="Telefono2"
                placeholder="Indique Telefono2"
                dense
            ></v-text-field>
        </v-col>
                  
        <v-col cols="12" md="6">
            <v-text-field
                :rules="[rules.required]"
                v-model="form.tx_telefono3"
                label="Telefono3"
                placeholder="Indique Telefono3"
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
            resource: 'pariente',
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
				tx_documento: 	null,
				tx_sexo: 	null,
				fe_nacimiento: 	null,
				tx_nacionalidad: 	null,
				id_alumno: 	null,
				id_parentesco: 	null,
				tx_empresa: 	null,
				tx_cargo: 	null,
				tx_ocupacion: 	null,
				tx_telefono: 	null,
				tx_telefono2: 	null,
				tx_telefono3: 	null,
				tx_observaciones: 	null,
				id_status: 	null,
				id_usuario: 	null,
            },
            selects:
            {
                alumno: 	 [],
	 	 	 	parentesco: 	 [],
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
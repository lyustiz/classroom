<template>

    <v-form ref="form" v-model="valid" lazy-validation>

    <v-card :loading="loading" >

        <v-card-text>

        <v-row>

                 
        <v-col cols="12" md="6">
            <v-text-field
                :rules="[rules.required]"
                v-model="form.nb_colegio"
                label="Colegio"
                placeholder="Indique Colegio"
                dense
            ></v-text-field>
        </v-col>
                          
        <v-col cols="12" md="6">
            <v-select
            :items="selects.tipoColegio"
            item-text="nb_tipo_colegio"
            item-value="id"
            v-model="form.id_tipo_colegio"
            :rules="[rules.select]"
            label="Tipo Colegio"
            autocomplete
            dense
            ></v-select>
        </v-col>
          
        <v-col cols="12" md="6">
            <v-text-field
                :rules="[rules.required]"
                v-model="form.tx_codigo"
                label="Codigo"
                placeholder="Indique Codigo"
                dense
            ></v-text-field>
        </v-col>
                  
        <v-col cols="12" md="6">
            <v-text-field
                :rules="[rules.required]"
                v-model="form.tx_descripcion"
                label="Descripcion"
                placeholder="Indique Descripcion"
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
            <v-select
            :items="selects.zona"
            item-text="nb_zona"
            item-value="id"
            v-model="form.id_zona"
            :rules="[rules.select]"
            label="Zona"
            autocomplete
            dense
            ></v-select>
        </v-col>
                  
        <v-col cols="12" md="6">
            <v-select
            :items="selects.comuna"
            item-text="nb_comuna"
            item-value="id"
            v-model="form.id_comuna"
            :rules="[rules.select]"
            label="Comuna"
            autocomplete
            dense
            ></v-select>
        </v-col>
                  
        <v-col cols="12" md="6">
            <v-select
            :items="selects.barrio"
            item-text="nb_barrio"
            item-value="id"
            v-model="form.id_barrio"
            :rules="[rules.select]"
            label="Barrio"
            autocomplete
            dense
            ></v-select>
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
                v-model="form.nu_estudiantes"
                label="Estudiantes"
                placeholder="Indique Estudiantes"
                dense
            ></v-text-field>
        </v-col>
                  
        <v-col cols="12" md="6">
            <v-text-field
                :rules="[rules.required]"
                v-model="form.nu_latitud"
                label="Latitud"
                placeholder="Indique Latitud"
                dense
            ></v-text-field>
        </v-col>
                  
        <v-col cols="12" md="6">
            <v-text-field
                :rules="[rules.required]"
                v-model="form.nu_longitud"
                label="Longitud"
                placeholder="Indique Longitud"
                dense
            ></v-text-field>
        </v-col>
                  
        <v-col cols="12" md="6">
            <v-text-field
                :rules="[]"
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
            resource: 'colegio',
            dates:
            {
                
            },
            pickers:
            {
                
            },
            form:
            {
                id: 	null,
				nb_colegio: 	null,
				id_tipo_colegio: 	null,
				tx_codigo: 	null,
				tx_descripcion: 	null,
				id_departamento: 	null,
				id_ciudad: 	null,
				id_zona: 	null,
				id_comuna: 	null,
				id_barrio: 	null,
				tx_direccion: 	null,
				tx_telefono: 	null,
				nu_estudiantes: 	null,
				nu_latitud: 	null,
				nu_longitud: 	null,
				tx_observaciones: 	null,
				id_status: 	null,
				id_usuario: 	null,
            },
            selects:
            {
                tipoColegio: 	 [],
	 	 	 	departamento: 	 [],
	 	 	 	ciudad: 	 [],
	 	 	 	zona: 	 [],
	 	 	 	comuna: 	 [],
	 	 	 	barrio: 	 [],
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
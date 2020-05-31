<template>

    <v-form ref="form" v-model="valid" lazy-validation>
    <v-container>
    <v-row justify="center">

        <v-col cols="12" md="6">
            <v-card >
            <v-card-title class="orange lighten-2" primary-title>
                <h3 class="white--text">Ubicacion</h3>
            </v-card-title>

            <v-card-text class="pt-3">
                
            
        
        <v-row  class="justify-space-between">
        
        <v-col cols="12" md="6">
            <v-select
            :items="selects.departamento"
            item-text="nb_departamento"
            item-value="id"
            v-model="form.id_departamento"
            :rules="[rules.select]"
            label="Departamento"
            :loading="loading"
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
            :loading="loading"
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
            :loading="loading"
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
            :loading="loading"
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
            :loading="loading"
            dense
            ></v-select>
        </v-col>
          
        <v-col cols="12" md="12">
            <v-text-field
                :rules="[rules.required]"
                v-model="form.tx_direccion"
                label="Direccion"
                placeholder="Indique Direccion"
                dense
            ></v-text-field>
        </v-col>
                  

        </v-row>
                        
                    </v-card-text>

                     <v-card-actions>
            <v-spacer></v-spacer>
            <form-buttons
                @store="store()"
                @clear="clear()"
                :action="action"
                :valid="valid"
                :loading:="loading"
            ></form-buttons>
        </v-card-actions>
                </v-card>
            </v-col>

    </v-row>
    </v-container>
    
    </v-form>

</template>

<script>

import Appform from '@mixins/Appform';

export default {
    mixins: [Appform],
    data() {
        return {
            resource: 'colegio',
            logoColegio: require('@images/logo-colegio.png') ,
            dates:
            {
                
            },
            pickers:
            {
                
            },
            form:
            {
                id: 	          null,
				nb_colegio: 	  null,
				id_tipo_colegio:  null,
				tx_codigo: 	      null,
				tx_descripcion:   null,
				id_departamento:  null,
				id_ciudad: 	      null,
				id_zona: 	      null,
				id_comuna: 	      null,
				id_barrio: 	      null,
				tx_direccion: 	  null,
				tx_telefono: 	  null,
				nu_estudiantes:   null,
				nu_latitud: 	  null,
				nu_longitud: 	  null,
				tx_observaciones: null,
				id_status: 	      null,
				id_usuario: 	  null,
            },
            selects:
            {
	 	 	 	departamento: 	 [],
	 	 	 	ciudad: 	     [],
	 	 	 	zona: 	         [],
	 	 	 	comuna: 	     [],
	 	 	 	barrio: 	     [], 
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
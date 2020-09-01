<template>

    <v-form ref="form" v-model="valid" lazy-validation>
    <v-container>
    <v-row justify="center">

    <v-col cols="12" md="6">

    <v-card class="rounded-xl">
        
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
                @store="update()"
                :valid="valid"
                :loading="loading"
                remove-cancel
            ></form-buttons>
        </v-card-actions>
                </v-card>
            </v-col>

    </v-row>
    </v-container>
    <v-overlay
            absolute
            :opacity="0.3"
            :value="loading"
            :z-index="10">
            <v-icon size="40" class="mdi-spin">mdi-loading</v-icon>
        </v-overlay>
    </v-form>

</template>

<script>

import AppData from '@mixins/AppData';
import AppSelect from '@mixins/AppSelect';;

export default {
    mixins: [ AppData, AppSelect ],
    created()
    {
        this.fillSelects()
        this.mapData(this.colegio)
        this.loading = true;
    },
    watch:
    {
        colegio(data)
        {
            this.mapData(data)
        }
    },
    computed:
    {
        colegio()
        {
            return this.$store.getters['getColegio']
        }
    },
    data() {
        return {
            form:
            {
                id: 	          null,
				id_departamento:  null,
				id_ciudad: 	      null,
				id_zona: 	      null,
				id_comuna: 	      null,
				id_barrio: 	      null,
				tx_direccion: 	  null,
				nu_latitud: 	  null,
				nu_longitud: 	  null,
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
        update()
        {
            if (!this.$refs.form.validate())  return 

            this.setDefaults()
            this.loading = true

            this.$store.dispatch('apiLocationColegio', { id: this.form.id, form: this.form})
            .then( (data) => {
                this.showMessage(data.msj)
                this.loading = false
            }).catch(error => 
            {
                this.showError(error)
            })
            .finally( () => 
            {
            this.loading = false
            });
        }
    }
}
</script>

<style>
</style>
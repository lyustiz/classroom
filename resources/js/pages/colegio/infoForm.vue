<template>

    <v-form ref="form" v-model="valid" lazy-validation>
    <v-container>
    <v-row justify="center">

        <v-col cols="12" md="6">
        
        <v-card >
        
        <v-card-title class="orange lighten-2" primary-title>
            
            <v-row no-gutters>

                <v-col cols="4" md="3">

                    <app-foto 
                        :origenId="form.id" 
                        :maxItems="2" 
                        :disabled="form.id == null">
                    </app-foto>

                </v-col>
                
                 <v-col>
                    <h3 class="white--text">Informacion General</h3>
                    <h5 class="indigo--text" v-if="form.tx_codigo" v-text="`Codigo: ${form.tx_codigo}`"></h5>
                </v-col>

            </v-row>
            
        </v-card-title>

        <v-card-text class="pt-3">
                
        <v-row  class="justify-space-between pt-2">
        
            <v-col cols="12" >
                <v-text-field
                    :rules="[rules.required]"
                    v-model="form.nb_colegio"
                    label="Nombre del Colegio"
                    placeholder="Indique Nombre del Colegio"
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
                :loading="loading"
                dense
                ></v-select>
            </v-col>

            <v-col cols="12" md="6">
                <v-select
                :items="selects.calendario"
                item-text="nb_calendario"
                item-value="id"
                v-model="form.id_calendario"
                :rules="[rules.select]"
                label="Calendario"
                :loading="loading"
                dense
                ></v-select>
            </v-col>

            <v-col cols="12" md="12">
                <v-select
                :items="selects.jornada"
                item-text="nb_jornada"
                item-value="id"
                v-model="form.id_jornada"
                :rules="[rules.select]"
                label="Jornada"
                :loading="loading"
                dense
                ></v-select>
            </v-col>

            <v-col cols="12" md="6">
                <v-text-field
                    :rules="[rules.required]"
                    v-model="form.tx_telefono"
                    label="Telefono"
                    placeholder="Indique Telefono"
                    type="tel"
                    pattern="[0-9]{3}-[0-9]{2}-[0-9]{3}"
                    dense
                ></v-text-field>
            </v-col>
                    
            <v-col cols="12" md="6">
                <v-text-field
                    :rules="[rules.required]"
                    v-model="form.nu_estudiantes"
                    label="Numero de Estudiantes"
                    placeholder="Indique Estudiantes"
                    type="number"
                    dense
                ></v-text-field>
            </v-col>

        </v-row>
                        
        </v-card-text>

        <v-card-actions>
            <v-spacer></v-spacer>
            <form-buttons
                @store="setData()"
                :valid="valid"
                :loading="loading"
                remove-cancel
            ></form-buttons>
        </v-card-actions>
        
        </v-card>
    </v-col>

    </v-row>
    </v-container>

    </v-form>

</template>

<script>

import AppData from '@mixins/AppData';
import AppSelect from '@mixins/AppSelect';
export default {
    mixins: [AppData, AppSelect],
    created()
    {
        this.fillSelects()
        this.mapData(this.colegio)
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
            resource: 'colegio',
            logoColegio: require('@images/logo-colegio.png') ,
            form:
            {
                id: 	         null,
				nb_colegio: 	 null,
                id_tipo_colegio: null,
                id_calendario:   null,
                id_jornada:      null,  
				tx_codigo: 	     null,
				tx_descripcion:  null,
				tx_telefono: 	 null,
				nu_estudiantes:  null,
				id_status: 	     null,
				id_usuario: 	 null,
            },
            selects:
            {
                tipoColegio: 	 [],
                calendario:      [],
                jornada:         [],
	 	 	 	status: 	     [],
            },
            default: {
                id_status:      1,
            }
        }
    },

    methods:
    {
        setData()
        {
            return (this.form.id) ? this.update() : this.store()
        },

        store()
        {
            if (!this.$refs.form.validate())  return 

            this.setDefaults()
            this.loading = true

            this.$store.dispatch('apiStoreColegio', this.form)
            .then( (data) => {
                this.showMessage(data.msj)
                this.form.id = data[0].colegio.id
                this.form.tx_codigo = data[0].colegio.tx_codigo
                this.loading = false
            })
        },

        update()
        {
            if (!this.$refs.form.validate())  return 

            this.setDefaults()
            this.loading = true

            this.$store.dispatch('apiUpdateColegio', { id: this.form.id, form: this.form})
            .then( (data) => {
                this.showMessage(data.msj)
                this.loading = false
            })
        }

    }
}
</script>

<style>
</style>
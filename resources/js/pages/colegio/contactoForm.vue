<template>

    <v-form ref="form" v-model="valid" lazy-validation>
    <v-container>
    <v-row justify="center">

    <v-col cols="12" md="6">

    <v-card >
        
        <v-card-title class="orange lighten-2" primary-title>
            <h3 class="white--text">Informacion Contacto</h3>
        </v-card-title>

        <v-card-text class="pt-3">
        
        <v-row  class="justify-space-between">
          
        <v-col cols="12">
            <v-text-field
                prepend-icon="mdi-email"
                :rules="rules.email"
                hint="Email de contacto del Comercio"
                v-model="form.tx_email"
                label="Email"
                placeholder="Indique Email"
                dense
            ></v-text-field>
        </v-col>
                  
        <v-col cols="12">
            <v-text-field
                prepend-icon="mdi-web"
                :rules="[rules.maxlength(80)]"
                v-model="form.tx_sitio_web"
                label="Sitio Web"
                hint='Url del la Pagina web del Colegio Ej: "www.virtualin.co"'
                persistent-hint
                dense
            ></v-text-field>
        </v-col>
                  
        <v-col cols="12">
            <v-text-field
                prepend-icon="mdi-facebook"
                :rules="[rules.maxlength(30)]"
                v-model="form.tx_facebook"
                label="Facebook"
                hint='Indique solo el usuario Ej: "virtualin"'
                persistent-hint
                dense
            ></v-text-field>
        </v-col>
                  
        <v-col cols="12">
            <v-text-field
                prepend-icon="mdi-twitter"
                :rules="[rules.maxlength(30)]"
                v-model="form.tx_twitter"
                label="Twitter"
                hint='Indique solo el usuario Ej: "@virtualin"'
                persistent-hint
                dense
            ></v-text-field>
        </v-col>
                  
        <v-col cols="12">
            <v-text-field
                prepend-icon="mdi-instagram"
                :rules="[rules.maxlength(30)]"
                v-model="form.tx_instagram"
                label="Instagram"               
                hint='Indique solo el usuario Ej: "@virtualin"'
                persistent-hint
                dense
            ></v-text-field>
        </v-col>
                  
        <v-col cols="12">
            <v-text-field
                prepend-icon="mdi-youtube"
                :rules="[rules.maxlength(30)]"
                v-model="form.tx_youtube"
                hint='Indique solo el usuario Ej: "virtualin" o el codigo del canal Ej: "UCeG2aGmZ2" '
                persistent-hint
                placeholder="Indique Youtube"
                dense
            ></v-text-field>
        </v-col>
            
        </v-row>
                        
        </v-card-text>

        <v-card-actions>
            <v-spacer></v-spacer>
            <form-buttons
                @store="isUpdate()"
                :valid="valid"
                :loading="loading"
                remove-cancel
            ></form-buttons>
        </v-card-actions>
                </v-card>
            </v-col>

        <pre v-if="$App.debug">{{ $data }}</pre>

    </v-row>
    </v-container>
    
    </v-form>

</template>

<script>

import AppData from '@mixins/AppData';
import AppSelect from '@mixins/AppSelect';;

export default {
    mixins: [ AppData, AppSelect ],
    created()
    {
        if(!this.colegio) return
        this.list()
    },
    watch:
    {
        colegio(data)
        {
            this.list()
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
				id_tipo_contacto: null,
				id_origen: 	      null,
				tx_email: 	      null,
				tx_sitio_web: 	  null,
				tx_facebook: 	  null,
				tx_twitter: 	  null,
				tx_instagram: 	  null,
				tx_youtube: 	  null,
				tx_observaciones: null,
				id_status: 	      null,
				id_usuario: 	  null,
            },
            default: 
            {
                id_tipo_contacto: 1, //colegio
                id_status: 	      1,
            }
        }
    },

    methods:
    {
        list()
        {
           if(!this.colegio) return 
           
           this.getResource('contacto/tipo/1/origen/' + this.colegio.id )
            .then( (data) => 
            { 
               (data) ? this.mapData(data) : null
               this.form.id_origen  = this.colegio.id
            })
        },

        isUpdate()
        {
           return (this.form.id) ? this.update() : this.store();
        },

        store()
        {
            this.storeResource('contacto', this.form )
            .then( (data) => {
                this.showMessage(data.msj)
                this.form.id  = data[0].contacto.id
            })
        },
    
        update()
        {
            this.updateResource('contacto/' + this.form.id, this.form )
            .then( (data) => {
                this.showMessage(data.msj)
            })
        },
    }
}
</script>

<style>
</style>
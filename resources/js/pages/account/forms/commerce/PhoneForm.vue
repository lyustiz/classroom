<template>
    <v-form v-model="valid" ref="form" >
    <v-card class="mx-auto" max-width="400">
        <v-card-title >
            Agregar Telefono (Max 5)
        </v-card-title>
        <v-card-text>

            <v-flex xs12 >
                <v-text-field
                    color="cyan darken-3"
                    prepend-inner-icon="mdi-phone-plus"
                    label="Numero de Telefono"
                    hint="Ej 23968589"
                    :rules="[rules.maxlength(12), rules.required]"
                    v-model="form.tx_telefono"
                    prefix="+57"
                    dense
                    outlined
                    filled >
                </v-text-field>
            </v-flex>

            <v-flex xs12 d-flex>
                <v-select
                    label="Tipo Telefono*"
                    prepend-inner-icon="mdi-phone-log"
                    :rules="[rules.select]"
                    v-model="form.id_tipo_telefono" 
                    :items="selects.tipoTelefonos"
                    item-value="id"
                    item-text="nb_tipo_telefono"
                    dense
                    outlined
                    filled
                ></v-select>
            </v-flex>

            <v-flex xs12 d-flex>
                <v-switch
                    v-model="form.bo_whatsapp"
                    label="Whatsapp"
                    color="green"
                    prepend-icon="mdi-whatsapp"
                    hint="El Telefono recibe Whatsapp? (solo 1 por comercio)"
                    :true-value="1"
                    :false-value="0"
                    :readonly="whatsappexist"
                    persistent-hint
                ></v-switch>
            </v-flex>

        </v-card-text>
        <v-card-actions>
            <v-spacer></v-spacer>
            <v-btn small dark fab color="amber"   @click="close()" :loading="loading"> <v-icon>mdi-reply-all</v-icon></v-btn>
            <v-btn small dark fab color="primary" @click="store()" :loading="loading"> <v-icon>mdi-plus</v-icon></v-btn>
        </v-card-actions>
    </v-card>
    </v-form>
</template>

<script>

import AppForm from '@mixins/AppForm'
import AppData from '@mixins/AppData'

export default {

    mixins:[ AppForm, AppData ],

    props:
    {
        comercio:{
            type:       Object,
            default:    null
        },

        whatsappexist: {
            type:       Boolean,
            default:    false
        }
    },
    
    mounted()
    {
        this.$nextTick()
        {
            if(this.comercio)
            {
                this.loading = false
                this.form.id_comercio = this.comercio.id
            }
        }
        
    },

    computed: 
    {
        getIduser()
        {
            return this.$store.getters['getUserid']
        },
    },

    data(){
        return{
            resource: 'telefono',
            form:
            {
                id_comercio:      '',
                tx_telefono:      null,
                id_tipo_telefono: '',
                bo_whatsapp:       0,
                id_usuario:       '',   
            },
            selects: {
                tipoTelefonos: [
                    { id: '1', nb_tipo_telefono: 'Fijo/Local' },
                    { id: '2', nb_tipo_telefono: 'Movil/Celular' },
                    { id: '3', nb_tipo_telefono: 'Fax' },
                ]
            }
        }
    },
    methods:
    {
        store()
        {
            if (!this.$refs.form.validate())  return 

            this.loading = true;
            this.form.id_usuario  = this.getIduser;
            this.form.id_comercio = this.comercio.id
            
            axios.post('/api/v1/' + this.resource , this.form)
			.then( response =>
			{
                this.showMessage(response.data.msj)
                this.close(response.data.telefono)
			})
            .catch( error =>
            {
                this.showError(error);
            })
            .finally( () =>
            {
                this.loading = false
            }); 
    
        },

        close(form)
        {
            this.$emit('close', form)
            this.clear()
        }
    }

    
}
</script>

<style>

</style>
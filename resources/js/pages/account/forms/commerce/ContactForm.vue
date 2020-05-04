<template>
    <v-form v-model="valid" ref="form" >
    <v-card class="mx-auto" max-width="400" :loading="loading">
        <v-card-title >
            Informacion del Contacto
        </v-card-title>
        <v-card-text>

            <v-flex xs12 d-flex>
                <v-select
                    label="Telefonos*"
                    prepend-inner-icon="mdi-phone"
                    append-outer-icon="mdi-phone-plus"
                    @click:append-outer="addPhone()"
                    :rules="[rules.mutiple]"
                    :value="form.telefonos"
                    :items="form.telefonos"
                    readonly
                    multiple
                    dense
                    outlined
                    filled
                    :loading="loading"
                >
                    <template v-slot:selection="{ item }">
                        <span>
                        <v-chip small close @click:close="delPhone(item)">
                            <v-icon class="mx-1">{{getPhoneIcon(item.id_tipo_telefono)}}</v-icon>
                            <span>{{ item.tx_telefono }}</span>
                        </v-chip>
                        <v-icon v-if="item.bo_whatsapp == 1" color="success">mdi-whatsapp</v-icon>
                        </span>
                    </template>
                </v-select>
            </v-flex>

            <v-flex xs12 >
                <v-text-field
                    prepend-inner-icon="mdi-email"
                    label="Email de Comercio"
                    type="text"
                    hint="Email de contacto del Comercio"
                    :rules="rules.email"
                    v-model="form.tx_email"
                    dense
                    outlined
                    filled >
                </v-text-field>
            </v-flex>

            <v-flex xs12 >
                <v-text-field
                    prepend-inner-icon="mdi-web"
                    label="Sitio Web"
                    type="text"
                    v-model="form.tx_sitio_web"
                    :rules="[rules.maxlength(50)]"
                    hint='url del sitio web Ej: "www.desdecasaweb.com"'
                    persistent-hint
                    dense
                    outlined
                    filled >
                </v-text-field>
            </v-flex>

            <v-flex xs12 >
                <v-text-field
                    prepend-inner-icon="mdi-facebook"
                    label="Facebook"
                    type="text"
                    hint='Indique solo el usuario Ej: "desdecasaweb"'
                    persistent-hint
                    v-model="form.tx_facebook"
                    :rules="[rules.maxlength(30)]"
                    dense
                    outlined
                    filled >
                </v-text-field>
            </v-flex>

            <v-flex xs12 >
                <v-text-field
                    prepend-inner-icon="mdi-twitter"
                    label="Twitter"
                    type="text"
                    hint='Indique solo el usuario Ej: "@desdecasaweb"'
                    persistent-hint
                    v-model="form.tx_twitter"
                    :rules="[rules.maxlength(30)]"
                    dense
                    outlined
                    filled >
                </v-text-field>
            </v-flex>

            <v-flex xs12 >
                <v-text-field
                    prepend-inner-icon="mdi-instagram"
                    label="Instagram"
                    type="text"
                    hint='Indique solo el usuario Ej: "@desdecasaweb"'
                    persistent-hint
                    v-model="form.tx_instagram"
                    :rules="[rules.maxlength(30)]"
                    dense
                    outlined
                    filled >
                </v-text-field>
            </v-flex>

            <v-flex xs12 >
                <v-text-field
                    prepend-inner-icon="mdi-youtube"
                    label="Youtube"
                    type="text"
                    hint='Indique solo el usuario Ej: "desdecasaweb" o el codigo del canal Ej: "UCeG2aGmZ2" '
                    persistent-hint
                    v-model="form.tx_youtube"
                    :rules="[rules.maxlength(30)]"
                    dense
                    outlined
                    filled >
                </v-text-field>
            </v-flex>

        </v-card-text>
        <v-card-actions>
            <v-spacer></v-spacer>
            <v-btn small dark fab color="amber"   @click="cancel()" :loading="loading"> <v-icon>mdi-reply</v-icon></v-btn>
            <v-btn small dark fab color="primary" @click="setData()" :loading="loading"> <v-icon>mdi-plus</v-icon></v-btn>
        </v-card-actions>
    </v-card>

    <!-- Formulario Insert Telefono-->

    <v-dialog v-model="modal" persistent max-width="400"
    >
        <phone-form :comercio="item" :whatsappexist="whatsappExist" @close="close($event)"></phone-form>

    </v-dialog>
    
    
    </v-form>
</template>

<script>

import AppForm from '@mixins/AppForm'
import AppData from '@mixins/AppData'
import PhoneForm  from './PhoneForm'

export default {

    components: 
    {
        'phone-form' : PhoneForm
    },

    mixins:[ AppForm, AppData ],

    created() 
    {
        this.fetch()
    },

    computed: 
    {
        getIduser()
        {
            return this.$store.getters['getUserid']
        },
    },
    watch:
    {
        'item.telefono'(telefonos)
        {
            this.form.telefonos = []

            if(telefonos)
            {
                this.whatsappExist  = telefonos.filter( (item) => item.bo_whatsapp == 1 ).length > 0;
                this.form.telefonos = telefonos;
                this.$refs.form.resetValidation()
            }
            
        },

    },

    data(){
        return{
            resource: 'contacto',
            form:
            {
                id:           '',
                id_comercio:  '',
                telefonos:    this.telefonos,
                tx_email:     '',
                tx_sitio_web: '',
                tx_facebook:  '',
                tx_twitter:   '',
                tx_instagram: '',
                tx_youtube:   '',
                id_usuario:   '',   
            },
            whatsappExist: false
        }
    },
    methods:
    {
         fetch()
        {
            this.item = this.$store.getters['getComercio']
            this.form.id_comercio = this.item.id;
            if( this.item.contacto)
            {
                this.mapData(this.item.contacto)
            }
            this.loading = false
        },

        setData()
        {
            if(this.item.contacto) 
            {
                this.update()
            } else 
            {
                this.store()
            }
        },

        store()
        {
            if (!this.$refs.form.validate())  return 

            this.loading = true;
            this.form.id_usuario = this.getIduser;
            
            axios.post('/api/v1/' + this.resource, this.form)
			.then( response =>
			{
                this.showMessage(response.data.msj)
                this.item.contacto = response.data.contacto
                this.form.id = response.data.contacto.id
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

        update()
        {
            if (!this.$refs.form.validate())  return 

            this.loading = true;
            this.form.id_usuario = this.getIduser;
            
            axios.put('/api/v1/' + this.resource + '/' + this.form.id, this.form)
			.then( response =>
			{
                this.showMessage(response.data.msj)
                this.item.contacto = this.form
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
        
        getPhoneIcon(id_tipo_telefono)
        {
            switch (parseInt(id_tipo_telefono)) {
                case 1:
                    return 'mdi-phone-classic' 
                    break;
                case 2:
                    return 'mdi-cellphone-android'
                    break;
                case 3:
                    return 'mdi-printer'
                    break;
                default:
                    return 'mdi-phone'
                    break
            }
        },

        delPhone(telefono)
        {
            if (this.loading) { return }
            
            if (!confirm('desea borrar el telefono '+ telefono.tx_telefono)) { return }

            this.loading = true

            axios.delete('/api/v1/telefono/' + telefono.id)
			.then( response =>
			{
                this.showMessage(response.data.msj)
                this.loading = false
                this.item.telefono = this.item.telefono.filter((item) => item.id != telefono.id) 
			})
            .catch( error =>
            {
              console.log(error)
            })
            .finally( () =>
            {
                this.loading = false
            });
        },

        addPhone()
        {
            this.modal = true;
        },

        close(telefono)
        {
            if(telefono)
            {
                this.item.telefono.push(telefono)
            }
            this.modal = false;
        },

        cancel()
        {
            this.$refs.form.resetValidation()
            this.mapData(this.item.contacto) 
        }
    }
}
</script>

<style>

</style>
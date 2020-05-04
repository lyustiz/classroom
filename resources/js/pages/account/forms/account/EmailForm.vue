<template>
    <v-form v-model="valid" ref="form" >
    <v-card class="mx-auto" max-width="400" :loading="loading">
        <v-card-title >
            Actualizar Correo
        </v-card-title>
        <v-card-text>

            <v-flex xs12 >
                <v-text-field
                    color="cyan darken-3"
                    prepend-inner-icon="mdi-email"
                    label="Correo Actual"
                    type="text"
                    v-model="form.tx_email"
                    :rules="[rules.required]"
                    readonly
                    dense
                    outlined
                    filled >
                </v-text-field>
            </v-flex>

            <v-flex xs12 >
                <v-text-field
                    color="cyan darken-3"
                    prepend-inner-icon="mdi-email-edit"
                    label="Nuevo Correo"
                    type="text"
                    v-model="form.tx_new_email"
                    :rules="rules.email"
                    dense
                    outlined
                    filled >
                </v-text-field>
            </v-flex>

            <v-flex md12 xs12>
                <v-text-field
                    color="cyan darken-3"
                    prepend-inner-icon="mdi-email-edit"
                    label="Reescribir Correo"
                    type="text"
                    v-model="form.tx_ret_email"
                    :rules="[rules.email_confirmation]"
                    dense
                    outlined
                    filled  >
                </v-text-field>
            </v-flex>
            
        </v-card-text>
        <v-card-actions>
              <v-spacer></v-spacer>
              
              <v-btn small dark fab color="amber" @click="cancel()" > <v-icon>mdi-restore</v-icon></v-btn>
              <v-btn small dark fab color="primary" @click="update()"> <v-icon>mdi-content-save</v-icon></v-btn>
          </v-card-actions>
    </v-card>
    </v-form>
</template>

<script>

import AppForm from '@mixins/AppForm'

export default {

    mixins: [ AppForm ],

    created()
    {
        this.item = this.$store.getters['getUser']
        this.mapForm()
        this.form.id_usuario = this.getIduser;
        this.loading = false
    },

    data()
    {
        return{
            resource: 'usuario', 
            form: {
                tx_email:      '',
                tx_new_email:  '',
                tx_ret_email:  '',
                id_usuario:    ''
            },
        }
    },
    methods: 
    {
        update()
        {
            if (!this.$refs.form.validate())  return 

            this.loading = true;
            this.form.id_usuario = this.item.id;
            axios.put('/api/v1/' + this.resource + '/email/' + this.item.id, this.form)
			.then( response =>
			{
                this.showMessage(response.data.msj)
                this.item.tx_email = this.form.tx_new_email;
                this.$store.commit('setUser', this.item)
                this.clear();
                this.form.tx_email = this.item.tx_email;
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

        cancel()
        {

            this.clear()
            
            this.form.tx_email  = this.item.tx_email;
        }

        
    }
}
</script>

<style>

</style>
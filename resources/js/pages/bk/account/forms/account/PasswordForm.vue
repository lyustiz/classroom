<template>
    <v-form v-model="valid" ref="form" >
    <v-card class="mx-auto" max-width="400" :loading="loading">
         <v-card-title >
            Actualizar Password 
         </v-card-title>
          <v-card-text>
            <v-flex md12 >
                    <v-text-field
                        color="cyan darken-3"
                        prepend-inner-icon="mdi-lock"
                        :append-icon="show ? 'visibility_off' : 'visibility'"
                        @click:append="show = !show"
                        label="Password Actual"
                        :type="show ? 'text' : 'password'"
                        v-model="form.tx_password"
                        :rules="rules.password"
                        dense
                        outlined 
                        filled >
                    </v-text-field>
                </v-flex>

                <v-flex md12 xs12>
                    <v-text-field
                        color="cyan darken-3"
                        prepend-inner-icon="mdi-lock"
                        label="Nuevo password"
                        :type="show ? 'text' : 'password'"
                        hint="Debe contener letras y numeros y una longitud minima de 8 caracteres"
                        v-model="form.tx_new_pass"
                        :rules="rules.new_password"
                        dense
                        outlined
                        filled  >
                    </v-text-field>
                </v-flex>

                <v-flex md12 xs12>
                    <v-text-field
                        color="cyan darken-3"
                        prepend-inner-icon="mdi-lock"
                        label="Reescribir password"
                        :type="show ? 'text' : 'password'"
                        v-model="form.tx_ret_pass"
                        :rules="rules.ret_password"
                        dense
                        outlined 
                        filled >
                    </v-text-field>
                </v-flex>
          </v-card-text>
          <v-card-actions>
              <v-spacer></v-spacer>
              
              <v-btn small dark fab color="amber" @click="cancel()"> <v-icon>mdi-restore</v-icon></v-btn>
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
        this.loading = false
    },

    computed: 
    {
        getIduser()
        {
            return this.$store.getters['getUserid']
        },
    },

    data()
    {
        return{
            resource: 'usuario', 
            form: {
                tx_password:  '',
                tx_new_pass:  '',
                tx_ret_pass:  '',
                id_usuario:   ''
            },
            rules: {
                new_password: [
                    v => !!v || 'La Contraseña es Requerida',
                    v => !!v && v.length > 7 || 'La contraseña debe tener almenos 6 caracteres',
                    v => !!v && v.length <= 15 || 'La contraseña debe tener maximo 15 caracteres'
                ],
                ret_password: [
                    v => this.form.tx_new_pass === v || 'Las contraseñas no coinciden'
                ],
            },
            show: false,
        }
    },

    methods: 
    {
        update()
        {
            if (!this.$refs.form.validate())  return 

            this.loading = true;
            this.form.id_usuario = this.getIduser;
            
            axios.put(this.apiUrl    + this.resource + '/password/' + this.getIduser, this.form)
			.then( response =>
			{
                this.showMessage(response.data.msj)
                this.cancel();
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
            for(var key in this.form)
            {
                this.form[key] = '';
            }
            this.$refs.form.resetValidation();
        }
    }
}
</script>

<style>

</style>
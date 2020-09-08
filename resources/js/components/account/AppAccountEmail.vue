<template>

    <v-card flat :loading="loading" >

        <v-card-text class="pt-4">

            <v-form v-model="valid" ref="form" >

            <v-row>

            <v-col cols="12" >
                    <v-text-field
                        color="cyan darken-3"
                        prepend-icon="mdi-email"
                        label="Correo Actual"
                        type="text"
                        v-model="form.tx_email"
                        readonly
                        dense >
                    </v-text-field>
                </v-col>

                <v-col cols="12" >
                    <v-text-field
                        color="cyan darken-3"
                        prepend-icon="mdi-email-edit"
                        label="Nuevo Correo"
                        type="text"
                        v-model="form.tx_new_email"
                        :rules="rules.email"
                        dense>
                    </v-text-field>
                </v-col>

            </v-row>

            </v-form>

        </v-card-text>  

         <v-card-actions>
            <v-spacer></v-spacer>
            <v-btn fab small dark @click="cancel()"  :loading="loading" :color="$App.theme.button.cancel">
                 <v-icon>mdi-restore</v-icon>
            </v-btn>
            <v-btn fab small dark @click="update()" :disabled="!valid" :loading="loading" :color="$App.theme.button.insert">
                 <v-icon>save_alt</v-icon>
            </v-btn>
        </v-card-actions>  
       
    </v-card>

</template>

<script>
import AppData from '@mixins/AppData';

export default {

    mixins:     [ AppData ],

    created()
    {
        this.form.tx_email = this.user.tx_email
    },

    computed:
    {
        user()
        {
            return this.$store.getters['getUser']
        }
    },

    data () {
        return {
            resource: 'usuario', 
            form: {
                tx_email:      '',
                tx_new_email:  '',
                id_usuario:    ''
            },
            valid: true
           
        }
    },
    methods:
    {
        update()
        {
            if (!this.$refs.form.validate())  return 

            this.loading = true
            this.form.id_usuario = this.user.id

            this.$store.dispatch('updateEmail', this.form)
            .then(response => {
              
                this.showMessage(response.data.msj)
                this.cancel()

            }).catch(error =>
            {                
                this.showError(error);
            }).finally( () => {
                this.loading = false
            })
      
        },

        cancel()
        {
            this.clear()
            
            this.form.tx_email  = this.user.tx_email;
        }
    }
}
</script>
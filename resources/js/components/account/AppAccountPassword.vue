<template>

    <v-card flat :loading="loading">

        <v-card-text class="pt-4">

            <v-form v-model="valid" ref="form" >

            <v-row >

                 <v-col cols="12" >
                    <v-text-field
                        color="cyan darken-3"
                        prepend-icon="mdi-lock"
                        :append-icon="show ? 'visibility_off' : 'visibility'"
                        @click:append="show = !show"
                        label="Password Actual"
                        :type="show ? 'text' : 'password'"
                        v-model="form.tx_password"
                        :rules="rules.password"
                        dense >
                    </v-text-field>
                </v-col>

                <v-col cols="12">
                    <v-text-field
                        color="cyan darken-3"
                        prepend-icon="mdi-lock"
                        label="Nuevo password"
                        :type="show ? 'text' : 'password'"
                        hint="Debe contener letras y numeros y una longitud minima de 8 caracteres"
                        v-model="form.tx_new_pass"
                        :rules="rules.new_password"
                        dense >
                    </v-text-field>
                </v-col>


            </v-row>
            
            </v-form>

        </v-card-text>  

        <v-card-actions>
            <v-spacer></v-spacer>
            <v-btn fab small dark @click="cancel()" :loading="loading" :color="$App.theme.button.cancel">
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

    computed:
    {
        user()
        {
            return this.$store.getters['getUser']
        }
    },

    data () {
        return {
            form: {
                tx_password:  '',
                tx_new_pass:  '',
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

            this.updateResource(`usuario/${this.user.id}/password`, this.form).then( data => {
                this.showMessage(data.msj)
                this.cancel()
            })
            
        },

        cancel()
        {
            this.clear()
        }
        
    }
}
</script>
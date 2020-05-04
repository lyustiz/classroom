<template>
  <v-app class="back">
    <v-content>
      <v-container fluid fill-height>
            
            <v-layout align-center justify-center>
                <v-flex xs12 sm6>
                    
                    <v-form ref="form" v-model="valid" lazy-validation>
                        
                        <v-card class="elevation-12">
                            
                            <v-img :src="ImgPanoramica"></v-img>

                            <v-card-text>

                                <v-text-field
                                    prepend-icon="person"
                                    label  ="Usuario"
                                    type   ="text"
                                    :rules ='rules.required'
                                    v-model="form.nb_usuario" 
                                ></v-text-field>

                                <v-text-field
                                    prepend-icon="lock"
                                    :append-icon=" mostrar ? 'visibility_off' : 'visibility' "
                                    :type  =" mostrar ? 'text' : 'password' "
                                    @click:append=" mostrar = !mostrar "
                                    label  ="Contraseña"
                                    :rules ='rules.password'
                                    v-model="form.password"
                                ></v-text-field>

                            </v-card-text>

                            <v-card-actions>

                                <v-spacer></v-spacer>
                                    <v-btn 
                                        dark 
                                        color="red" 
                                        @click="login()"
                                        :loading="loading">
                                        Ingresar 
                                    </v-btn>
                                <v-spacer></v-spacer>

                            </v-card-actions>

                        </v-card>
                    </v-form>
                </v-flex>
            </v-layout>
    </v-container>
    </v-content>
    <app-message></app-message>
</v-app>

</template>
<script>

import AppRules    from '~/mixins/AppRules'
import AppMessage  from '~/mixins/AppMessage'

export default {
    mixins:[AppRules, AppMessage],
    data()
    {
        return{
            loading:    false,
            mostrar:    false,
            valid:      false,
            urlBase:    'login',
            urlHome:    '/home',
            form:
            {
                nb_usuario: '',
                password:   ''
            },
            error:
            {
                nb_usuario: '',
                password:   ''
            },
            ImgPanoramica: require('~/assets/img/logo.png'),
        }
    },
    methods:
    {
        login()
        {
            if (!this.$refs.form.validate()) return

            this.loading = true;
            
            axios.post(this.urlBase, this.form)
            .then(response => 
            {
                if (response.status == 200)
                {
                    localStorage.setItem("auth", response.data.auth)
                    localStorage.setItem("user", JSON.stringify(response.data.user))
                    window.location = this.urlHome
                }else
                {
                    this.reset()
                    this.loading = false
                    this.showError(response)
                }
            })
            .catch(error => 
            {
                this.reset()
                this.loading = false
                this.showError(error)
            })
        },
        reset()
        {
            this.$refs.form.reset();
        }
    }
}
</script>

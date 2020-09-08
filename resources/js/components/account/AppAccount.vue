<template>

    <v-card flat :loading="loading" max-height="80vh">

        <v-card-title class="pa-0">
            <app-simple-toolbar title="Editar Cuenta" @closeModal="$emit('closeDialog', true)"></app-simple-toolbar>
        </v-card-title>

        <v-card-text class="pa-0">
            
            <v-tabs grow v-model="seccion" centered >
                <v-tab v-for="(seccion, idx) in secciones" :key="idx" :href="`#tab-${idx}`">
                    <v-icon left v-html="seccion.icon"></v-icon>
                    {{ seccion.label }}
                </v-tab> 
            </v-tabs>

            <v-tabs-items v-model="seccion">
                <v-tab-item  v-for="(seccion,idx) in secciones" :key="idx" :value="`tab-${idx}`">
                    <component :is="seccion.component"></component>
                </v-tab-item>
            </v-tabs-items>

        </v-card-text>   

    </v-card>

</template>

<script>
import AppData          from '@mixins/AppData';
import AccountEmail     from './AppAccountEmail.vue';
import AccountPassword  from './AppAccountPassword.vue';

export default {

    mixins:     [ AppData ],

    components:
    {
        'account-email' :    AccountEmail,
        'account-password' : AccountPassword
    },

    created()
    {
        this.list()
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
            seccion: 0,
            secciones: [
                {
                    label: 'Correo',
                    icon: 'mdi-email-edit' ,
                    component:'account-email' 
                },
                {
                    label: 'Password',
                    icon: 'mdi-account-key',
                    component: 'account-password'
                }
            ],
        }
    },
    methods:
    {
        list()
        {
           //this.getResource( `grupo/alumnos/docente/${this.docente.id}` ).then( data => this.grupos = data )
        },


    }
}
</script>
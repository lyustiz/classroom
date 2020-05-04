<template>
    <v-card>

        <v-card-title>
            Status del Usuario: <span class="ml-2 info--text">{{user.nb_usuario}}</span>
            <v-icon :color="allColor(userAll())">{{ allIcon(userAll())}} </v-icon>
        </v-card-title>
        <v-card-text>
            <p><v-icon :color="dataColor(user.nb_nombres)">{{ dataIcon(user.nb_nombres)}} </v-icon> Informacion Personal</p>
            <p><v-icon :color="dataColor(user.tx_foto)">{{ dataIcon(user.tx_foto)}} </v-icon> Foto</p>
        </v-card-text>
        
        <v-card-title>
            Status del Comercio:  <span class="ml-2 info--text">{{commercio.nb_comercio}}</span> 
            <v-icon :color="allColor(comercioAll())">{{ allIcon(comercioAll())}} </v-icon>
        </v-card-title>
        <v-card-text>
            <p><v-icon :color="dataColor(commercio.tx_nit)">{{ dataIcon(commercio.tx_nit)}} </v-icon> Informacion General</p>
            <p><v-icon :color="dataColor(commercio.tx_foto)">{{ dataIcon(commercio.tx_foto)}} </v-icon> Foto del Comercio</p>
            <p><v-icon :color="dataColor(commercio.id_zona)">{{ dataIcon(commercio.id_zona)}} </v-icon> Ubicacion</p>
            <p><v-icon :color="dataColor(commercio.contacto)">{{ dataIcon(commercio.contacto)}} </v-icon> Contacto</p>
            <p><v-icon :color="dataColor(commercio.horario)">{{ dataIcon(commercio.horario)}} </v-icon> Horarios</p>
            <p><v-icon :color="dataColor(commercio.telefono)">{{ dataIcon(commercio.telefono)}} </v-icon> Telefonos</p>
            <p><v-icon :color="dataColor(commercio.telefono)">{{ dataIcon(commercio.telefono)}} </v-icon> Categorias</p>
        </v-card-text>
    </v-card>
</template>

<script>
export default {

    computed: {

        user() {
           return this.$store.getters['getUser']
        },
        commercio() {
           return this.$store.getters['getComercio']
        }
        
    },
    methods: {
        dataIcon(data)
        {
           return ( Array.isArray(data) ? data.length > 0 : data ) ? 'mdi-check' : 'mdi-close' 

        },

        dataColor(data)
        {
           return ( Array.isArray(data) ? data.length > 0 : data ) ? 'green' : 'red' 

        },
        allIcon(data)
        {
           return (data) ? 'mdi-check-all' : 'mdi-alert' // mdi-check-all  mdi-account-alert mdi-alert mdi-alert-circle

        },

        allColor(data)
        {
          
          return (data) ? 'green' : 'amber' // mdi-check-all  mdi-account-alert mdi-alert mdi-alert-circle

        },

        userAll()
        {
           return (this.user.nb_nombres && this.user.tx_email && this.user.fe_nacimiento && this.user.tx_sexo && this.user.tx_foto)
        },

        comercioAll()
        {
            return  this.commercio.tx_foto &&
                    this.commercio.tx_foto &&
                    this.commercio.horario.length  > 0 &&
                    this.commercio.id_zona.length  > 0 &&
                    this.commercio.contacto.length > 0 &&
                    this.commercio.telefono.length > 0 &&
                    this.commercio.telefono.length > 0  
        }

    }


}
</script>

<style>

</style>
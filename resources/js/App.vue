<template>
<div>
    <component :is="layout"></component>
    <div :size="size" :resize="resize"></div>
</div>
</template>

<script>
import { mapActions } from 'vuex';
export default {
    created()
    {
        this.$store.commit('setIsMobile', this.$App.isMobile)
      
        let auth      = localStorage.getItem('auth');
        let token     = localStorage.getItem('token');
        let user      = localStorage.getItem('user');
        let expire    = localStorage.getItem('expire');
        let profiles  = localStorage.getItem('profiles');
        
        if(auth==='true') // TODO:check expire
        {
            console.log('log')
            const data ={
                            user: JSON.parse(user),
                            token,
                            expire,
                            profiles: JSON.parse(profiles)
                        };
            
            this.$store.dispatch('autenticate', data)
        }
        else
        {
            console.log('nolog')
            this.$store.dispatch('unatenticate')
            this.$store.commit('setColegio', null)
            this.navegateTo('/')
        }

        if( !this.$store.getters['getColegioId'] )
        {
            let userID = this.$store.getters['getUserid']
            this.$store.dispatch('apiColegioUsuario', userID)
        }
        
    },
    computed: 
    {
        size()
        {
            this.$store.commit('setSize', this.$vuetify.breakpoint.name)
            return this.$vuetify.breakpoint.name
        },
        resize()
        {
            this.$store.commit('setResize', this.$vuetify.breakpoint.mdAndDown )
            return this.$vuetify.breakpoint.mdAndDown
        },
        layout()
        {
           
           if(this.$route.name == 'login')
           {
               return 'login-layout'
           }

           if(this.$route.name == 'recover-password')
           {
               return 'login-layout'
           }
           

           if(this.$route.name == 'welcome')
           {
               return 'welcome-layout'
           }

           return this.$store.getters['getLayout']
        }
    },

    methods: 
    {
        ...mapActions(['apiColegioUsuario']),
    }
  }

</script>
<style>

    /* Transicion Contenido */
    .fade-enter-active, .fade-leave-active {
        transition:  opacity 0.4s ease;
    }

    .fade-enter, .fade-leave-active {
        opacity: 0
    }
	
    .v-btn--floating {
        padding: 10px !important;
    }
    .v-btn--floating .v-btn__content {
        flex: 1 0 auto;
    }
    .v-application {
        background-color: var(--v-background-base) !important;
    }
    .pointer{
        cursor: pointer;
    }

</style>

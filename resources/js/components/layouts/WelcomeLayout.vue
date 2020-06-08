<template>
<div>

    <!-- Contenido -->
        <v-content class="fill-height">
            <transition name="fade" mode="out-in" >
                <router-view></router-view>
            </transition>
        </v-content>

    <!--Mensaje Sistema-->
    <app-message></app-message>

</div>
</template>

<script>
import AppRules from '@mixins/AppRules'

export default {
    mixins: [ AppRules ],
    data () 
	{
  
    },
    methods: {

     
    }

}
</script>

<style>
#register-container{
    height: 92.8vh;
}
.holder {
    min-height: 100vh;
    background-image: url('/images/fondo-login.jpg');
    background-position: center center;
    background-repeat: no-repeat;
    background-attachment: fixed;
    background-size: cover;
}
.form-login{
    border-radius: 20px !important;
}

</style>
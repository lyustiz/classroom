<template>
<div>

    <!-- Contenido -->
        <v-main class="fill-height">
            <transition name="fade" mode="out-in" >
                <router-view></router-view>
            </transition>
        </v-main>

    <!--Mensaje Sistema-->
    <app-message></app-message>

</div>
</template>

<script>

export default {

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
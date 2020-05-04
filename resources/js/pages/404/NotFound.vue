<template>


<div class="holder-404 d-flex justify-center align-center white--text" @click="$router.replace('/')" >

    <div class="text-center">
    <h3 class="my-3"><span class="display-4 mr-5">404</span><span class="display-1">PAGINA NO ENCONTRADA</span>  </h3>
    <v-btn icon fab x-large color="white"><v-icon size="80">mdi-home-export-outline</v-icon></v-btn>
    </div>
</div>
  
</template>

<script>
export default {
 
}
</script>

<style>
.holder-404 {
    min-height: 95vh;
    background-image: url('/images/404.jpg');
    background-position: center center;
    background-repeat: no-repeat;
    background-attachment: fixed;
    background-size: cover;
}
</style>
<template>
<div class="holder-conocenos"> 
   
    <v-container >
        <v-row no-gutters class="ml-lg-12">
            <v-col cols="12" lg="6" class="text-conocenos d-flex align-md-end">
              <div class="img-container">
                <img src="/images/vision.png" alt="" srcset="" class="img-vision">
              </div>
            </v-col>

            <v-col cols="12" lg="6" class="text-conocenos ml-lg-n12">
              <div>
                <img src="/images/mision.png" alt="" srcset="" class="img-mision">
              </div>
            </v-col>
            

        </v-row>

    </v-container>
 
  </div>
</template>

<script>

export default {
    data(){
        return{
            path:1
        }
    }
}
</script>

<style >
.holder-conocenos {
    min-height: 92vh;
    background-image: url('/images/conocenos-background.jpg');
    background-position: center center;
    background-repeat: no-repeat;
    background-attachment: fixed;
    background-size: cover;
}

.text-conocenos {
    height: 90vh;
}

.img-container
{
  width: 100%;
}

.img-vision{
  width: 100%;
  height: auto;
}

.img-mision {
  width: 100%;
  height: auto;
}



</style>
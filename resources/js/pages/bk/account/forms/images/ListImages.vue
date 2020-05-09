<template>
  <div> 
  <v-sheet
    class="mx-auto"
    elevation="8"
  >
    
      <div class="mx-3 pt-3">
          <v-btn small dark color="red" @click="dialog=true">
            <v-icon class="mx-2" >mdi-image-plus</v-icon> Cargar Imagen
          </v-btn>
      </div>

     <v-slide-group
      v-model="model"
      class="pa-4"
      active-class="red"
      show-arrows
    >
      <v-slide-item
        v-for="n in 6"
        :key="n"
        v-slot:default="{ active, toggle }"
      >
        <v-card
          :color="active ? 'info' : 'white'"
          class="ma-4"
          min-height="320"
          width="220"
          @click="toggle"
        >
        <v-img  height="200px" :src="prueba"></v-img>
        <v-card-text class="text-justify">
            Lorem ipsum dolor sit, amet consectetur adipisicing elit. 
            Earum, placeat, voluptas quae cum accusantium magnam sapiente 
            quis molestiae fugiat animi reiciendis aliquid mollitia autem ratione. 
            Error qui quas rem eos.
        </v-card-text>
        <v-card-actions>
            <v-spacer></v-spacer>
            <v-btn dark fab small color="primary"><v-icon>mdi-message-draw</v-icon></v-btn>
            <v-btn dark fab small color="red"><v-icon>mdi-delete</v-icon></v-btn>
        </v-card-actions>
        </v-card>
      </v-slide-item>
    </v-slide-group>
  </v-sheet>
  
   <div class="text-center">
      <v-dialog v-model="dialog" width="500">
        <images-form @closeDialog="closeDialog()"></images-form>
      </v-dialog>
  </div>


  </div>
</template>

<script>
import ImageForm from './ImageForm';

export default {
    components:{
        'images-form': ImageForm
    },
    data(){
        return {
            model: null,
            dialog: false,
            prueba: require('~/assets/img/servicios.jpg'),
            }
    },
    methods: {
      closeDialog()
      {
        this.dialog = false;

      }
    }

}
</script>

<style>

</style>
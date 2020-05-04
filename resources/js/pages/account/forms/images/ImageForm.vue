<template>


<v-card>
   
    <v-card-title> 
        <v-spacer></v-spacer>
        <v-btn icon x-small  color="red" dark @click="$emit('closeDialog')"><v-icon>mdi-close-circle</v-icon></v-btn> 
    </v-card-title>
    <v-card-text> 
   
         <v-form v-model="valid" :lazy-validation="true" ref="form">

        <v-row align="center" justify="center">
            <v-img
            :src="src"
            aspect-ratio="1"
            class="grey lighten-2"
            max-width="500"
            max-height="300"
            >
                <template  >
                    <v-row
                    class="fill-height ma-0"
                    align="center"
                    justify="center"
                    >
                    <v-file-input color="red" accept="image/*" capture="camera" v-model="file" prepend-icon="mdi-image-search" class="col-1" ref="inputImage">
                     <template v-slot:selection="{  }">
                         <div></div>
                     </template>
                    </v-file-input>
                    </v-row>
                </template>
            </v-img>
        </v-row>
        
        <v-row>
            <v-col md="12" class="justify-space-between">
                <v-textarea 
                    label="Descripcion (*)"
                    v-model="form.descripcion"
                    :rules="rules.required"
                    hint="Descripcion de la imagen (obligatoria)"
                    outlined
                    rows="2"
                    filled>
                </v-textarea>
                <v-btn small block dark color="primary"> <v-icon class="mx-2">mdi-content-save</v-icon> Guardar </v-btn>
            </v-col>

        </v-row>

        </v-form>
        
    </v-card-text>
</v-card>
   


</template>

<script>
import AppRules from '@mixins/AppRules'
export default {
    mixins: [AppRules],
    watch:{
        file(val)
        {
            if(val)
            {
                this.src = URL.createObjectURL(this.file);
            }else{
                this.src = "";
            }
        }
    },
    data(){
        return{
            file: null,
            form: { 
                descripcion: '',
                fotoSrc: ''
            },
            src: '',
            valid: false,

        }
    },
}
</script>

<style>

</style>
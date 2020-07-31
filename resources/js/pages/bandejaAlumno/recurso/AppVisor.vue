<template>

    <v-card class="rounded-t-xl grey darken-4">

        <app-simple-toolbar :title="title" @closeModal="$emit('closeModal')"></app-simple-toolbar>

        <v-card-text class="pa-0 " >

            <template v-if="fileType == 'PDF'">
                <embed class="file-visor" :src="fileUrl+'#toolbar=0&navpanes=0'" type="application/pdf" width="100%"  />
            </template>

            <template v-else-if="fileType == 'Texto'">
                <embed class="file-visor" :src="fileUrl" type="text/plain" width="100%"  />
            </template>

            <template v-else-if="fileType == 'Image'">
                <v-img :src="fileUrl" aspect-ratio="1.7" contain></v-img>
            </template>

            <template v-else-if="fileType == 'Video'" class="text-center">
                <v-row justify="center">
                    <video width="70%" controls>
                        <source :src="fileUrl" type="video/mp4">
                    </video>
                </v-row>
            </template>

            <template v-else>
                <v-container>

                    <v-row justify="center">
                        <v-alert type="warning" >
                            Visualizacion  no Soportada por el Navegador
                        </v-alert>
                    </v-row>
                    <v-row justify="center">
                        <v-btn large color="success" link :href="fileUrl" :download="title" rel="noreferrer noopener" target="_blank">Descargar</v-btn>
                    </v-row>
                </v-container>
            </template>



<!-- 
Word
Excel
PowerPoint
Word
Excel
PowerPoint
Image
-->    
        </v-card-text>
                
    </v-card>
  
</template>

<script>
import MimeTypes  from '@mixins/AppMimeTypes.js'
export default {

    props:
    {
        title: {
            type:    String,
            default: 'Visor' 
        },
        
        fileUrl: {
            type:    String,
            default: null 
        },

        fileType: {
            type:    String,
            default: null
        },
    },  

}
</script>

<style>
.file-visor{
    height: 89vh;
}

</style>
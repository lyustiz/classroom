<template>

    <v-card class="rounded-t-xl grey darken-4">

     <!--  <pdf :src="fileUrl"></pdf>  -->

       <!--  <app-simple-toolbar :title="title" @closeModal="$emit('closeModal')"></app-simple-toolbar>

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

        </v-card-text> -->
                
    </v-card>
  
</template>

<script>
import MimeTypes  from '@mixins/AppMimeTypes.js'

export default {

/*    components: {
        pdf
    },  */

   /*  created() {
        this.fetchPDF();
    }, */

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
    
    methods:
    {
        /* fetchPDF() {
            import('pdfjs-dist/webpack')
            .then(pdfjs => pdfjs.getDocument(this.url))
            .then(pdf => (this.pdf = pdf));
        }, */
    }

}
</script>

<style>
.file-visor{
    height: 89vh;
}

</style>
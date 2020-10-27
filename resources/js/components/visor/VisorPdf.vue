<template>

<v-card> 

    <v-card-title class="pa-0" >
        <app-simple-toolbar :title="pdf.name" backgroundColor="info" dense dark @closeModal="$emit('closeDialog')" ></app-simple-toolbar>
    </v-card-title>

    <v-card-text class="px-0">
        <div class="enlace-container">
            <embed class="file-visor" :src="pdf.src+'#toolbar=0&navpanes=0'" type="application/pdf" width="100%" @load="loading = false"  />
        </div>
    </v-card-text>

    <v-overlay 
        :opacity="0.3"
        :value="loading"
        :z-index="10">
        <v-icon size="40" class="mdi-spin">mdi-loading</v-icon>
    </v-overlay>
    
</v-card>

</template>

<script>
export default {

    props:
    {
        pdf:{
            type: Object,
            default: () => {}
        }
    },

    created()
    {
        this.loading = true
    },
    
    data()
    {
        return {
            loading:  false,
        }
    },
}
</script>

<style>
.enlace-container{
    height: 89vh;
}
.page-iframe{
    height: 92vh;
}

</style>
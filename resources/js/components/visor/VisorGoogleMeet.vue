<template>

<v-card> 

    <v-card-title class="pa-0" >
        <app-simple-toolbar title="Google Meet" backgroundColor="red" dense dark @closeModal="$emit('closeDialog')" ></app-simple-toolbar>
    </v-card-title>

    <v-card-text class="px-0">
            <div class="enlace-container">
                <iframe class="page-iframe" src="https://meet.google.com/" frameborder="0" width="100%" allowfullscreen @load="loading = false" target="_parent"></iframe>
            </div>
    </v-card-text>

    <v-overlay 
        absolute
        :opacity="0.3"
        :value="loading"
        :z-index="10">
        <v-icon size="40" color="white" class="mdi-spin">mdi-loading</v-icon>
    </v-overlay>
    
</v-card>

</template>

<script>
export default {
    
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
<template>

<v-card> 

    <v-card-title class="pa-0" >
        <app-simple-toolbar :title="enlace.name" backgroundColor="blue" dense dark @closeModal="$emit('closeDialog')" ></app-simple-toolbar>
    </v-card-title>

    <v-card-text class="px-0">

        <div class="enlace-container">
            <iframe class="page-iframe" :src="enlace.src" frameborder="0" width="100%" allowfullscreen @load="loading = false"></iframe>
            <v-overlay 
                :opacity="0.3"
                :value="loading"
                :z-index="10"
                absolute>
                <v-icon size="40" class="mdi-spin">mdi-loading</v-icon>
            </v-overlay>
        </div>

    </v-card-text>

</v-card>

</template>

<script>
import AppVisor   from '@mixins/AppVisor';

export default {

    mixins: [AppVisor],

    props:
    {
        enlace:{
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
    position: relative;
}
.page-iframe{
    height: 92vh;
}

</style>
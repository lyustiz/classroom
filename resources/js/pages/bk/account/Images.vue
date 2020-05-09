<template>
<v-container fluid >

    <v-tabs show-arrows icons-and-text :color="color">

        <v-tab>
            Imagenes <v-icon>mdi-folder-image</v-icon>
        </v-tab>

        <v-tab-item class="my-3">
            <list-images></list-images>
        </v-tab-item>

    </v-tabs>
                    
</v-container>
</template>

<script>

import ListImages from './forms/images/ListImages';

export default {

components:{
    'list-images': ListImages,
},
props:
{
    color:{
        type:       String,
        default:    'info'
    },
},
data(){
    return {
        data: null,
        tab: null
    }
}
}
</script>

<style>

</style>
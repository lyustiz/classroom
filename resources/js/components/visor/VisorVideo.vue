<template>

    <div>
        <app-simple-toolbar :title="video.name" backgroundColor="red" dense dark @closeModal="$emit('closeDialog')" ></app-simple-toolbar>
        <v-row no-gutters justify="center">
        <div class="youtube-container mb-1">
            <iframe class="responsive-iframe rounded-lg" @load="loading = false" :src="url" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
        </div>
        <v-overlay 
            absolute
            :opacity="0.3"
            :value="loading"
            :z-index="10">
            <v-icon size="40" class="mdi-spin">mdi-loading</v-icon>
        </v-overlay>
        </v-row>
        
    </div>

</template>

<script>
export default {
    props:
    {
        video:{
            type: Object,
            default: () => {}
        }
    },

    created()
    {
        this.loading = true
    },

    computed:
    {
        url()
        {
            return this.video.src.replace("watch?v=", "embed/")
        }
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
.youtube-container
{
   position: relative;
  overflow: hidden;
  width: 90%;
  padding-top: 40%; /* 4:3 Aspect Ratio */
}

.responsive-iframe {
  position: absolute;
  top: 0;
  left: 0;
  bottom: 0;
  right: 0;
  width: 100%;
  height: 100%;
}
</style>
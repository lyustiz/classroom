<template>

    <div>
        <app-simple-toolbar :title="video.name" backgroundColor="red" dense dark @closeModal="$emit('closeDialog')" >
            <template v-slot:toolbar-action>
               <ReporteVisor tipo="enlace" :data="video" :evaluacion="evaluacion" v-if="evaluacion"></ReporteVisor>
            </template>
        </app-simple-toolbar>
        <v-card dark>
            <v-row no-gutters justify="center">
                <div class="youtube-container mb-1">
                    <iframe 
                        class="responsive-iframe rounded-lg" 
                        @load="loading = false"
                        :src="url" 
                        frameborder="0" 
                        allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" 
                        allowfullscreen>
                    </iframe>
                </div>
                <v-overlay 
                    absolute
                    :opacity="0.3"
                    :value="loading"
                    :z-index="10">
                    <v-icon size="50" color="white" class="mdi-spin">mdi-loading</v-icon>
                </v-overlay>
            </v-row>
        </v-card>
    </div>

</template>

<script>
import AppVisor   from '@mixins/AppVisor';
import ReporteVisor from './ReporteVisor'

export default {

    components:
    {
        ReporteVisor
    },

    mixins: [AppVisor],  

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
            return  `https://www.youtube.com/embed/${this.video.src}`
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
  padding-top: 47%; /* 4:3 Aspect Ratio */
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
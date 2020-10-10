<template>

    <div>
        <app-simple-toolbar title="Virtualin" backgroundColor="red" dense dark @closeModal="$emit('closeModal')" ></app-simple-toolbar>
        <v-row no-gutters justify="center">
        <div class="youtube-container mb-1">
            <iframe class="responsive-iframe rounded-lg"  src="https://www.youtube.com/embed/iX2zIB_vmYg" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
        </div>
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
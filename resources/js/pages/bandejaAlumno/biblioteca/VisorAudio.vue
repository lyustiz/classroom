<template>
    <div>
        <app-simple-toolbar title="Virtualin" backgroundColor="primary" dense dark @closeModal="$emit('closeModal')" ></app-simple-toolbar>
        <v-alert color="primary" class="rounded-xl mb-1" :value="true" prominent :icon="audioIcon" dark>
            <audio controls autoplay class="mt-2 mx-auto">
                <source :src="audio.src" type="audio/mp3">
                Tu navegador no soporta este formato de audio
            </audio>
        </v-alert>
    </div>
</template>

<script>

export default 
{
    props:
    {
        audio:{
            type: Object,
            default: () => { src: '/storage/recurso/audio/1/fundamentos_macroeconomia.mp3'}
        }
    },

    data()
    {
        return {
            audioIcon: 'mdi-volume-high',
        }
    },
}

</script>
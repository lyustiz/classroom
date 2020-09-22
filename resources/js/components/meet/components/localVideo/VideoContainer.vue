<template>
    <div>
        <video-player></video-player>
        <select-device></select-device>

    </div>
</template>

<script>
import VideoPlayer   from './Videoplayer';
import SelectDevices from './SelectDevices';
export default {

     components:
    {
        'video-player':  VideoPlayer,
        'select-device': SelectDevices,
    },

    props:
    {
        stream: {
            default: null
        }
    },

    watch:
    {
        stream(stream)
        {
            if(stream)
            {
                this.play()
                this.statusMedia()
            }
        }
    },

    data: () => ({

    }),

    methods: {
    }
}
</script>

<style scoped>
.player{
    width: 100%;
    height: 100%;
}
</style>
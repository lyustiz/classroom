<template>

    <div class="player-container">

        <v-avatar class="picture-container elevation-3" @click="downloadImage()" ripple>
            <canvas class="rounded-lg picture" ref="picture" ></canvas>
        </v-avatar>
        
        <a ref="download-image" class="d-none"></a>
                                                
        <video class="rounded-lg mb-n2 elevation-3 grey darken-4 col-12 player" ref="player" autoplay playsinline></video>
            
        <v-toolbar color="rgba(0,0,0,0.1)" class="mt-n16 elevation-0 text-center rounded-b-lg">

            <v-row no-gutters justify="center">
                
                <v-col  class="text-left">
                    <v-btn fab dark x-small class="ma-1" :color="(hasAudio) ? null: 'red' " :outlined="hasAudio"  transition="slide-x-transition" @click="toggleAudio()">
                        <v-icon>{{ (hasAudio) ? 'mdi-volume-high': 'mdi-volume-mute' }}</v-icon>
                    </v-btn>
                </v-col>
                
                <v-col cols="auto" class="text-left">
                    <v-btn fab dark small class="ma-1" outlined @click="takePicture()">
                        <v-icon>mdi-camera-image</v-icon>
                    </v-btn>
                </v-col>

                <v-col cols="auto" class="text-left">
                    <v-btn fab dark small class="ma-1" outlined @click="attention()">
                        <v-icon color="yellow">mdi-hand</v-icon>
                    </v-btn>
                </v-col>

                <v-col></v-col>

            </v-row>
        
        </v-toolbar>

    </div>
    
</template>

<script>
export default {

    props:
    {
        stream: {
            type:    MediaStream,
            default: null
        },

        member: {
            type:    Object,
            default: () => {}
        }
    },

    mounted()
    {
        this.$nextTick().then( () => 
        {
            this.player       = this.$refs.player
            this.picture      = this.$refs.picture
            this.play()
            this.statusMedia()
        })
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

    computed:
    {
        hasAudio()
        {
            return !this.media.muted
        },
    },

    data: () => ({
        player:     null,
        media:      { audio: false,  video: false, muted: true },
    }),

    methods: {

        play()
        {
            this.player.srcObject = this.stream
        },

        statusMedia()
        {
            this.media.video  = (this.stream) ? this.stream.getVideoTracks().length > 0 : false

            this.media.audio  = (this.stream) ? this.stream.getAudioTracks().length > 0 : false
        },

        toggleAudio()
        {
            this.media.muted = this.player.muted = !this.player.muted
        },

        takePicture() 
        {
            this.picture.width = this.player.videoWidth;
            this.picture.height = this.player.videoHeight
            this.picture.getContext('2d').drawImage(this.player, 0, 0, this.player.videoWidth, this.player.videoHeight);
        },

        downloadImage()
        {
            var image = this.picture.toDataURL("image/png").replace("image/png", "image/octet-stream");

            this.$refs['download-image'].setAttribute('download', 'clase.png');

            this.$refs['download-image'].setAttribute('href', image);

            this.$refs['download-image'].click();
        },

        attention()
        {
            this.$emit('on-attention')
        }
    }

}
</script>

<style scoped>
.player-container{
    position: relative;
}
.player{
    height: inherit;
}
.picture-container
{
    position: absolute !important;
    left: 5;
    top: 5;
    cursor: pointer;
}
.picture{
    width: 50px;
    height: 48px;
}
</style>
<template>

    <div class="mb-2">

    <video class="rounded-lg mb-n2 elevation-3 player" ref="player" autoplay playsinline></video>
        
    <v-toolbar color="rgba(0,0,0,0.1)" class="mt-n16 elevation-0 text-center rounded-b-lg">

        <v-row no-gutters justify="center">
            
            <v-col cols="auto" class="text-left">
                <v-btn fab dark x-small class="ma-1" :color="(hasAudio) ? null: 'red' " :outlined="hasAudio" @click="toggleAudio()">
                    <v-icon>{{ (hasAudio) ? 'mdi-volume-high': 'mdi-volume-mute' }}</v-icon>
                </v-btn>
            </v-col>

            <v-col class="text-center">
                <v-btn fab dark small class="ma-1" :color="(hasCamera) ? null: 'red' " :outlined="hasCamera" @click="$emit('toggle-video')">
                    <v-icon>{{ (hasCamera) ? 'mdi-video': 'mdi-video-off' }}</v-icon>
                </v-btn>
            
                <v-btn fab dark small class="ma-1" :color="(hasMicrophone) ? null: 'red' " :outlined="hasMicrophone" @click="$emit('toggle-microphone')">
                    <v-icon>{{ (hasMicrophone) ? 'mdi-microphone': 'mdi-microphone-off' }}</v-icon>
                </v-btn>

                <v-btn fab dark small class="ma-1" color="white" @click="$emit('end-meet')">
                    <v-icon color="red">mdi-phone-off</v-icon>
                </v-btn>
            </v-col>
            
            <v-col cols="auto" class="text-right" >
                <v-btn fab dark x-small class="ma-1 ml-4" color="transparent" depressed >
                    <v-icon>mdi-dots-vertical</v-icon>
                </v-btn>
            </v-col>
        </v-row>

        <v-dialog v-model="dialogDevices" max-width="700" content-class="rounded-xl">
            <get-devices @onDevices="onDevices"></get-devices>
        </v-dialog>        
        
    </v-toolbar>

    </div>
</template>

<script>
export default {

    props:
    {
        stream: {
            default: null
        }
    },

    mounted()
    {
        this.$nextTick().then( () => 
        {
            this.player       = this.$refs.player
            this.player.muted = true
            this.play()
            this.statusMedia()
        })
    },

    computed:
    {
        hasCamera()
        {
            return this.media.video
        },

        hasAudio()
        {
            return this.media.muted
        },

        hasMicrophone()
        {
            return  this.media.audio
        },
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
        tools:  false,
        player: null,
        media:  { audio: false,  video: false, muted: true },
        dialogDevices: false
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

        onDevices(devices)
        {
            console.log(devices)
        }
    }
}
</script>

<style scoped>
.player{
    width: 100%;
    height: 100%;
}
</style>
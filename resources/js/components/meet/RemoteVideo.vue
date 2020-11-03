<template>

    <div class="player">
                                                
        <video class="rounded-lg mb-n5 info darken-3 player" ref="player" width="125" height="90" autoplay playsinline></video>
        
        <v-hover v-slot:default="{ hover }">
        
            <v-toolbar color="rgba(0,0,0,0.05)" class="mt-n16 elevation-0 text-center rounded-l-lg">
                <v-row no-gutters justify="end">
                    <v-expand-x-transition>
                        <v-btn fab dark x-small class="ma-1" :color="(hasAudio) ? null: 'red' " :outlined="hasAudio" v-show="hover" transition="slide-x-transition" @click="toggleAudio()">
                            <v-icon>{{ (hasAudio) ? 'mdi-volume-high': 'mdi-volume-mute' }}</v-icon>
                        </v-btn>
                    </v-expand-x-transition>
                    <v-btn fab dark x-small class="ma-1 ml-4" color="transparent" depressed @click="$emit('end-meet', member)">
                        <v-icon>mdi-dots-vertical</v-icon>
                    </v-btn>
                </v-row>
            </v-toolbar>
            
        </v-hover>

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
            this.player.muted = true
            this.play()
            this.statusMedia()
        })
    },

    computed:
    {
        hasAudio()
        {
            return !this.media.muted
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
        player: null,
        media:  { audio: false,  video: false, muted: true },
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
        }
    }

}
</script>

<style scoped>
.player{
    width: 125px;
    height: 90px;
}
</style>
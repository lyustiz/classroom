<template>

    <div class="mb-2 elevation-3 rounded-lg">

    <video class="rounded-lg mb-n2 player" ref="player" autoplay playsinline></video>
        
    <v-toolbar color="rgba(0,0,0,0.1)" class="mt-n16 elevation-0 text-center rounded-b-lg">

        <v-row no-gutters justify="center">
            
            <v-col cols="auto" class="text-left">
                <v-btn fab dark x-small class="my-2" :color="(hasAudio) ? null: 'red' " :outlined="hasAudio" @click="toggleAudio()">
                    <v-icon>{{ (hasAudio) ? 'mdi-volume-high': 'mdi-volume-mute' }}</v-icon>
                </v-btn>
            </v-col>

            <v-col class="text-center">
                <v-btn fab dark small class="ma-1" :color="(hasCamera) ? null: 'red' " :outlined="hasCamera" @click="$emit('onToggleVideo')">
                    <v-icon>{{ (hasCamera) ? 'mdi-video': 'mdi-video-off' }}</v-icon>
                </v-btn>
            
                <v-btn fab dark small class="ma-1" :color="(hasMicrophone) ? null: 'red' " :outlined="hasMicrophone" @click="$emit('onToggleMicrophone')">
                    <v-icon>{{ (hasMicrophone) ? 'mdi-microphone': 'mdi-microphone-off' }}</v-icon>
                </v-btn>

                <v-btn fab dark small class="ma-1" color="white" @click="endClass()">
                    <v-icon color="red">mdi-phone-off</v-icon>
                </v-btn>
            </v-col>
            
            <v-col cols="auto" class="text-right py-1" >
                <item-menu 
                    btn-color="transparent" 
                    icon-color="white" 
                    :small="false"
                    :menus="menus"
                    @onItemMenu="onItemMenu($event)">
                </item-menu>
            </v-col>
        </v-row>

        <v-dialog v-model="dialogDevices" max-width="700" content-class="rounded-xl" eager>
            <select-devices @onDevices="onDevices" @closeDialog="closeDialog('dialogDevices')"></select-devices>
        </v-dialog>        
        
    </v-toolbar>

    <app-confirm 
        :confirm="confirm" 
        :titulo="title" 
        :mensaje="message"
        @closeConfirm="confirmDevice($event)"
    ></app-confirm>

    </div>
</template>

<script>
import SelectDevices from './SelectDevices'
export default {

    components: {
        'select-devices': SelectDevices
    },

    props:
    {
        stream: {
            default: null
        },

        outMedia: {
            type: Object,
            default: () => {}
        }
        
    },

    mounted()
    {
        this.$nextTick().then( () => 
        {
            this.player       = this.$refs.player
            this.player.muted = true
        })
    },

    computed:
    {
        hasCamera()
        {
            return  this.outMedia.video
        },

        hasAudio()
        {
            return  !this.media.muted
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
        },
    },

    data: () => ({
        tools:  false,
        player: null,
        media:  { audio: false,  video: false, muted: true },
        menus: [
            { action: 'setDevices',  icon: 'mdi-cog',  label: 'Configurar Audio/Video' },
            { action: 'fullScreen',  icon: 'mdi-fullscreen',  label: 'Pantalla Completa' },
        ],
        dialogDevices: false,

        confirm:  false,
        message:  null,
        title:    null
    }),

    methods: 
    {
        setDevices()
        {
            this.dialogDevices = true
        },

        closeDialog(dialog)
        {
            this[dialog] = false
        },

        play()
        {
            this.player.srcObject = this.stream
        },

        statusMedia()
        {            
            this.media.video  = (this.stream) ? this.stream.getVideoTracks().length > 0 : false

            this.media.audio  = (this.stream) ? this.stream.getAudioTracks().length > 0 : false
        },

        onDevices(devices)
        {
            this.media.audio = (devices.microphone) ? true : false
            this.media.video = (devices.camera )    ? true : false
            this.media.muted = true
            this.$refs['player'].muted = true

            this.getVideoStream()

        },

        getVideoStream()
        {          
            navigator.mediaDevices.getUserMedia(this.media)
            .then((stream) => {
                this.$emit('onLocalStream', {stream, media: this.media} )
            })
            .catch((mediaError) => {
                this.handleMediaError(mediaError)
            })
        },

        toggleAudio()
        {
           
            if(this.$refs['player'].muted )
            {
                this.$refs['player'].muted = false
            }else{
                this.$refs['player'].muted = true
            }

            this.media.muted = this.$refs['player'].muted
            
        },

        fullScreen()
        {
            this.$refs['player'].requestFullscreen()
        },

        endClass()
        {
            this.$emit('onEndClass')
        },

        handleMediaError(mediaError)
        {
            switch (mediaError.name) {
                case 'NotAllowedError':
                    this.confirm = true
                    this.title   = 'Microfono/Camara Bloqueado.'
                    this.message = 'Favor autorizar el uso de Microfono/Camara y presione "Confirmar"'
                    console.log(mediaError.message)
                    break;
                case 'NotFoundError':
                    console.log(mediaError.message)
                    break;
                case 'SecurityError':
                    this.showError('Error al acceder a dispositivo')
                    console.log(mediaError.message)
                    break;
                case 'TypeError':
                    this.showError('No se han definido dispositivos')
                    console.log(mediaError.message)
                    break;
                default:
                    this.showError('Error en dispositivo audio/video')
                    console.log(mediaError.name, '--', mediaError.message)
                    break;
            }
        },

        confirmDevice(retry)
        {
            if(retry)
            {
                this.getVideoStream()
            }
            else{
                this.showError('No es posible iniciar Videoconferencia')
            }
            this.confirm = false
        }
    }
}
</script>

<style scoped>
.player{
    width: 100%;
    height: 100%;
    min-height: 234.94px;
    background-color: black;
}
</style>
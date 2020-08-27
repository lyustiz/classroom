<template>
    <v-dialog scrollable fullscreen persistent v-model="dialog">

        <template v-slot:activator="{ on, attrs }">
            <v-btn fab dark depressed v-bind="attrs" v-on="on" color="black" class="ml-1">
                <v-icon size="32">mdi-google-classroom</v-icon>
            </v-btn>
        </template>

        <v-card>
             <v-card-title class="pa-0">
                <app-simple-toolbar dense title="Aula Virtual" @closeModal="dialog = false"></app-simple-toolbar>
            </v-card-title>
            
            <v-card-text class="grey darken-4 meet-container">
                <v-row >
                    <v-col cols="12" md="7" >

                        <v-row class="rounded-xl" justify="center">
                            
                            <v-col cols="auto">

                                <!-- self video chat -->
                                
                                <video class="rounded-lg mb-n2 elevation-3" ref="local-video"  width="720" height="360" autoplay playsinline></video>
                                
                                <v-toolbar color="rgba(0,0,0,0.1)" class="mt-n16 elevation-0 text-center rounded-b-lg">

                                    <v-row no-gutters justify="center">
                                        
                                        <v-col class="text-left">
                                            <v-btn fab dark x-small class="ma-1" :color="(hasAudio) ? null: 'red' " :outlined="hasAudio" @click="toggleAudio()">
                                                <v-icon>{{ (hasAudio) ? 'mdi-volume-high': 'mdi-volume-mute' }}</v-icon>
                                            </v-btn>
                                        </v-col>

                                        <v-col class="text-center">
                                            <v-btn fab dark small class="ma-1" :color="(hasCamera) ? null: 'red' " :outlined="hasCamera" @click="toggleVideo()">
                                                <v-icon>{{ (hasCamera) ? 'mdi-video': 'mdi-video-off' }}</v-icon>
                                            </v-btn>
                                        
                                            <v-btn fab dark small class="ma-1" :color="(hasMicrophone) ? null: 'red' " :outlined="hasMicrophone" @click="toggleMicrophone()">
                                                <v-icon>{{ (hasMicrophone) ? 'mdi-microphone': 'mdi-microphone-off' }}</v-icon>
                                            </v-btn>
                    
                                            <v-btn fab dark small class="ma-1" color="white" @click="endMeet()">
                                                <v-icon color="red">mdi-phone-off</v-icon>
                                            </v-btn>
                                        </v-col>
                                        
                                        <v-col class="text-right" >
                                           <v-btn fab dark x-small class="ma-1 ml-4" color="transparent" depressed>
                                                <v-icon>mdi-dots-vertical</v-icon>
                                            </v-btn>
                                        </v-col>
                                    </v-row>
                                    
                                </v-toolbar>
                                   
                            </v-col>

                        </v-row>

                        <v-row justify="center">
                            <v-col>
                                <v-card color="grey darken-3" class="rounded-xl">
                                    <v-card-title class="indigo subtitle-2 white--text" dense>
                                        Herramientas
                                    </v-card-title>
                                    <v-card-text class="py-6 px-4">
                                        <v-tooltip top v-for="section in sections" :key="section.name" color="info">
                                            <template v-slot:activator="{ on }">
                                                <v-btn 
                                                    fab 
                                                    dark 
                                                    depressed 
                                                    v-on="on" 
                                                    :color="section.color" 
                                                    class="ml-1">
                                                    <v-icon size="18" v-text="section.icon"></v-icon>
                                                </v-btn>
                                            </template>
                                            <span v-text="section.label"></span>
                                        </v-tooltip>
                                    </v-card-text>
                                    
                                </v-card>
                            </v-col>

                            <v-col>


                                
                            </v-col> 

                        </v-row>
        
                    </v-col>
                    <v-col cols="12" md="5">

                    <v-list subheader two-line dense width="100%" color="grey darken-3" class="rounded-xl" dark> 
                    
                        <v-subheader class="indigo pl-6 rounded-t-xl">
                            Participantes {{members.length}} 
                        </v-subheader>

                        <!-- members video chat -->

                        <v-list-item v-if="members.length < 1">
                            <v-list-item-avatar color="grey lighten-2">
                                <v-icon color="indigo" size="34">mdi-account-multiple-remove</v-icon>
                            </v-list-item-avatar>
                            <v-list-item-content>
                                <v-list-item-title>No existen Usuarios Conectados</v-list-item-title>
                            </v-list-item-content>
                        </v-list-item>    
                        
                        <v-list-item v-for="(member, idx) in members" :key="idx" v-else> 
                            
                            <v-list-item-action tile class="mb-6">
                                
                                <video class="rounded-lg mb-n3 elevation-3 grey darken-4" :ref="[`remote-video-${member.id}`]" width="170" height="90" autoplay playsinline></video>
                                
                                <v-hover v-slot:default="{ hover }">
                                   
                                    <v-toolbar color="rgba(0,0,0,0.05)" class="mt-n16 elevation-0 text-center rounded-l-lg">
                                        <v-row no-gutters justify="center">
                                            
                                            <v-expand-x-transition>
                                                <v-btn fab dark x-small class="ma-1" :color="(hasAudio) ? null: 'red' " :outlined="hasAudio" v-show="hover" transition="slide-x-transition">
                                                    <v-icon>{{ (hasAudio) ? 'mdi-volume-high': 'mdi-volume-mute' }}</v-icon>
                                                </v-btn>
                                            </v-expand-x-transition>
                                            
                                            <v-btn fab dark x-small class="ma-1 ml-4" color="transparent" depressed>
                                                <v-icon>mdi-dots-vertical</v-icon>
                                            </v-btn>
                                           
                                        </v-row>
                                    </v-toolbar>
                                    
                                </v-hover>

                            </v-list-item-action>

                            <v-list-item-content>
                                <v-list-item-title v-text="member.nb_usuario"></v-list-item-title>
                                <v-list-item-subtitle v-text="member.nb_nombres"></v-list-item-subtitle>
                            </v-list-item-content>

                            <v-list-item-action>
                                <v-btn fab dark x-small class="ma-1 ml-4" color="transparent" depressed @click="handUp(member.id)">
                                    <v-icon color="amber">mdi-hand</v-icon>
                                </v-btn>

                            </v-list-item-action>

                            <v-list-item-action>
                                <send-message @sendMessage="sendMessage($event, member)"></send-message>
                            </v-list-item-action>

                            <v-list-item-action>
                                <v-btn fab dark x-small class="ma-1 ml-4" color="transparent" depressed>
                                    <v-icon color="grey lighten-2">mdi-dots-vertical</v-icon>
                                </v-btn>
                            </v-list-item-action>
                        </v-list-item> 


                    </v-list>

                    </v-col>
                </v-row>
            </v-card-text>

        </v-card>
        
    </v-dialog>  
</template>

<script>
import AppData from '@mixins/AppData';
import Pusher  from 'pusher-js';
import Peer    from 'simple-peer';
import Message from './TextMessage';
export default {

    mixins:     [ AppData ],

    components:{
        'send-message': Message
    },

    watch:
    {
        dialog(active)
        {
            if(active)
            {
                this.list()
            }
        }
    },

    computed:
    {
        hasCamera()
        {
            return !this.player.paused && ( (this.media.video) ? true : false  )
        },

        hasAudio()
        {
            return !this.player.muted
        },

        hasMicrophone()
        {
            return  (this.media.audio) ?  true : false 
        },

        credentials()
        {
            return this.$store.getters['getCredentials']
        },

        pusher()
        {
            return this.$store.getters['getPusher']
        },

        users()
        {
            return this.$store.getters['getUsers']
        },

    },

    data: () => ({
        instance: null,
        channel:  null,
        members:  [],
        menu:     false,
        dialog:   false,
        stream:   null,
        peers:    {},
        media:    { audio: false,  video: false },
        player:   { muted: false,  paused: false },
        sections: [
                { label: 'Asistencia', icon: 'mdi-account-check', component: 'tarea-alumno', color: 'blue', sectionWidth: '700' },
                { label: 'Recursos', icon: 'mdi-book-open-page-variant', component: 'recurso-alumno', color: 'purple', sectionWidth: '700' },
                { label: 'Presentacion', icon: 'mdi-presentation', component: 'recurso-alumno', color: 'green', sectionWidth: '700' },
            ]
            /*
            getDisplayMedia()
                        {
                video: {
                    cursor: 'always' | 'motion' | 'never',
                    displaySurface: 'application' | 'browser' | 'monitor' | 'window'
                }
            }
                        
                        */
    }),

    methods:
    {
        async list()
        {
            if(!this.credentials)
            {
                await this.$store.dispatch('credentials', this.idUser).then(users => {
                    console.log('credenciales recibidas')
                }).catch(error => 
				{
					console.log('Error en Credentiasls')
				})
            } 
            
            await this.$store.dispatch('instance', this.idUser).then(pusher => {
                this.instance = pusher
                console.log('Creada Instancia de Pusher')
            }).catch(error => 
            {
                console.log('Error al iniciar de Pusher', error)
            })

            Pusher.logToConsole = true;

            if(!this.chanel)
            {
                this.setChanel()
            }

            //this.setupVideoChat()
        },

        setChanel()
        {
            this.channel  = this.instance.subscribe('presence-clasrrorm-1-2-3-25082020');
            
            this.channel.bind(`client-${this.idUser}`, (signal) => 
            {
                console.log('mensaje->', signal)                 //llamada p2p
                const peer = this.getPeer(signal.userId, false);
                peer.signal(signal.data);
            }); 

            this.channel.bind(`client-video-room`, (signal) =>  //streaming
            {
                console.log('mensaje->', signal) //stream video
                const peer = this.getPeer(signal.userId, false);
                peer.signal(signal.data);
            }); 

            this.channel.bind(`client-chat-room`, (signal) => 
            {
                console.log('chat->', signal)                  //mensajes tipo: atencion y  chat
                peer.signal(signal.data);
            }); 

            this.channel.bind("pusher:subscription_succeeded", (members) =>
            {
                this.members =  []
                members.each((member) => {
                    if(member.id != this.idUser)
                    {
                        this.members.push(member.info)
                    }
                }, this);
            });

            this.channel.bind('pusher:member_added', (member) => 
            {
                this.showMessage(`ingresó ${member.info.nb_usuario} (${member.info.nb_nombres})`)
                this.members.push(member.info)  
            });

            this.channel.bind('pusher:member_removed', (member) => 
            {
                this.showMessage(`salio ${member.info.nb_usuario} (${member.info.nb_nombres})`)
                this.members = this.members.filter((membr) => { return membr.id != member.id})
            });

            console.log(this.instance, this.channel)
        },

        getPeer(userId, initiator) {

            if(this.peers[userId] === undefined) 
            {
                let peer = new Peer({
                                        initiator,
                                        stream: this.stream,
                                        trickle: false
                                    });

                peer.on('error', err => this.showError(err))

                peer.on('signal', (data) => {
                    this.channel.trigger(`client-${userId}`, {type:'stream', userId: this.idUser, data: data});
                })
                .on('connect', () => {
                    console.log('Se ha establecido la conexion')
                })
                .on('stream', (stream) => {
                    this.$refs['remote-video'].srcObject = stream;
                })
                .on('close', () => {
                    const peer = this.peers[userId];
                    if(peer !== undefined) {
                        peer.destroy();
                    }
                    delete this.peers[userId];
                });

                this.peers[userId] = peer;
            } 

            return this.peers[userId];
        },

        sendMessage(text, user)
        {
            let mensage = { type: 'message', text} 
            this.channel.trigger(`client-${user.id}`, mensage );
        },

        startVideoChat(user) {
            return
            this.getPeer(user.id, true);
        },

        endMeet()
        {
            console.log(this.stream.getVideoStream())
        },

        async setupVideoChat() {

            if (!Peer.WEBRTC_SUPPORT) 
            {
               this.showError('El navegador No soporta videollamadas se recomienda versiones actuaalizadas de Firefox y Chrome')
            } 

            await this.getMediaDevices();

            await this.getVideoStream();

            this.$refs['local-video'].srcObject = this.stream;
        },

        getMediaDevices() 
        {
            return navigator.mediaDevices.enumerateDevices().then((devices) => {
                devices.forEach(function(device) 
                {
                    if(device.kind == 'audioinput')
                    {
                        this.media.audio = true;
                    }

                    if(device.kind == 'videoinput')
                    {
                        this.media.video = { width: 740, height: 320, frameRate: { ideal: 10, max: 15 } };
                    }
                }, this);
            })
            .catch(function(error) {
                this.showError(error.name + ": " + error.message)
            });
        },

        getVideoStream()
        {          
            return navigator.mediaDevices.getUserMedia(this.media)
            .then((stream) => {
                
                this.stream = stream
            })
            .catch((error) => {
                this.showError(error)
            })
        },

        toggleAudio()
        {
            if(this.$refs['local-video'].muted )
            {
                this.$refs['local-video'].muted = false
            }else{
                this.$refs['local-video'].muted = true
            }
            
            this.player.muted = this.$refs['local-video'].muted
        },

        toggleVideo()
        {
            let videoTracks = this.stream.getVideoTracks()

            if(videoTracks.length > 0)
            {
                if(videoTracks[0].enabled)
                {
                    videoTracks[0].enabled = false
                    this.$refs['local-video'].pause()
                    
                } else{
                    videoTracks[0].enabled = true
                    this.$refs['local-video'].play()
                }

                this.media.video   = videoTracks[0].enabled 
                this.player.paused = !videoTracks[0].enabled 
            }

        },

        toggleMicrophone()
        {
            let audioTracks = this.stream.getAudioTracks()

            if(audioTracks.length > 0)
            {
                if(audioTracks[0].enabled)
                {
                    audioTracks[0].enabled = false
                } else{
                    audioTracks[0].enabled = true
                }

                this.media.audio  = audioTracks[0].enabled 
            }

        },

       
    }
}
</script>

<style >
.meet-container{
    max-height: 93vh;
}
.user-container{
    max-height: 82vh;
    overflow-y: scroll;
}
</style>

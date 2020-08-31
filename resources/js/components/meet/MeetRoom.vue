<template>
    <v-dialog scrollable fullscreen persistent v-model="dialog">

        <template v-slot:activator="{ on, attrs }">
            <v-btn fab dark depressed v-bind="attrs" v-on="on" color="black" class="ml-1">
                <v-icon size="32">mdi-google-classroom</v-icon>
            </v-btn>
        </template>

        <v-card>

            <v-subheader class="indigo pl-6" dark>

                <v-row no-gutters justify="space-between">
                    <v-col cols="auto">Aula Virtual</v-col>
                    <v-col cols="auto"><v-btn x-small icon dark color="white" @click="dialog = false"><v-icon>close</v-icon></v-btn></v-col>
                </v-row>
                 
            </v-subheader>
            
            <v-card-text class="grey darken-4 meet-container">
                
                <v-row >

                    <v-col cols="12" md="4" >
                        
                        <v-row class="rounded-xl" justify="center">
                            
                            <v-col cols="12">

                                <!-- self video chat -->
                                <v-speed-dial
                                    v-model="tools"
                                    top
                                    left
                                    direction="bottom"
                                    open-on-hover
                                    transition="scale-transition"
                                    class="mb-n10"
                                >
                                    <template v-slot:activator>
                                        <v-btn v-model="tools" color="white" fab x-small outlined>
                                            <v-icon  v-if="tools">mdi-close</v-icon>
                                            <v-icon  v-else>mdi-cog</v-icon>
                                        </v-btn>
                                    </template>
                                    <v-btn fab dark small color="green" >
                                        <v-icon>mdi-account-multiple-check</v-icon>
                                    </v-btn>
                                    <v-btn fab dark small color="indigo">
                                        <v-icon>mdi-presentation</v-icon>
                                    </v-btn>
                                    <v-btn fab dark small color="red">
                                        <v-icon>mdi-clipboard-file</v-icon>
                                    </v-btn>
                                </v-speed-dial>
                                
                                <video class="rounded-lg mb-n2 elevation-3 local-video" ref="local-video" height="300"  autoplay playsinline></video>
                                
                                <v-toolbar color="rgba(0,0,0,0.1)" class="mt-n16 elevation-0 text-center rounded-b-lg">

                                    <v-row no-gutters justify="center">
                                        
                                        <v-col cols="auto" class="text-left">
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
                                        
                                        <v-col cols="auto" class="text-right" >
                                           <v-btn fab dark x-small class="ma-1 ml-4" color="transparent" depressed >
                                                <v-icon>mdi-dots-vertical</v-icon>
                                            </v-btn>
                                        </v-col>
                                    </v-row>
                                    
                                </v-toolbar>
                                   
                            </v-col>

                            <v-col cols="12" class="text-center">
                                <video class="rounded-lg mb-n2 elevation-3 video-board" ref="video-board" width="410" height="170" controls autoplay playsinline></video>
                            </v-col>

                        </v-row>

                        <v-row no-gutters>

                            <v-col>

                                

                                <v-list subheader two-line dense width="100%" color="grey darken-3" class="rounded-lg" dark> 
                                
                                    <v-subheader class="indigo pl-6 rounded-t-lg">
                                        Participantes {{members.length}} 
                                    </v-subheader>

                                    <!-- members video chat -->

                                    <v-list-item-group class="members-container">

                                    <v-list-item v-if="members.length < 1">
                                        <v-list-item-avatar color="grey lighten-2">
                                            <v-icon color="indigo" size="30">mdi-account-multiple-remove</v-icon>
                                        </v-list-item-avatar>
                                        <v-list-item-content>
                                            <v-list-item-title>No existen Usuarios Conectados</v-list-item-title>
                                        </v-list-item-content>
                                    </v-list-item>    
                                    
                                    <v-list-item v-for="(member, idx) in members" :key="idx" v-else> 
                                        
                                        <v-list-item-action tile class="mb-6">
                                            
                                            <video class="rounded-lg mb-n3 elevation-3 grey darken-4" :ref="`remote-video-${member.id}`" width="125" height="90" autoplay playsinline></video>
                                            
                                            <v-hover v-slot:default="{ hover }">
                                            
                                                <v-toolbar color="rgba(0,0,0,0.05)" class="mt-n16 elevation-0 text-center rounded-l-lg">
                                                    <v-row no-gutters justify="center">
                                                        
                                                        <v-expand-x-transition>
                                                            <v-btn fab dark x-small class="ma-1" :color="(hasAudio) ? null: 'red' " :outlined="hasAudio" v-show="hover" transition="slide-x-transition">
                                                                <v-icon>{{ (hasAudio) ? 'mdi-volume-high': 'mdi-volume-mute' }}</v-icon>
                                                            </v-btn>
                                                        </v-expand-x-transition>
                                                        
                                                        <v-btn fab dark x-small class="ma-1 ml-4" color="transparent" depressed @click="startVideoChat(member.id)">
                                                            <v-icon>mdi-dots-vertical</v-icon>
                                                        </v-btn>
                                                    
                                                    </v-row>
                                                </v-toolbar>
                                                
                                            </v-hover>

                                        </v-list-item-action>

                                        <v-list-item-content>
                                            <v-list-item-title class="text.center">{{`${member.nb_usuario}`}}</v-list-item-title>
                                            <v-list-item-subtitle>{{`${member.nb_nombres}`}}</v-list-item-subtitle>

                                                <v-row no-gutters justify="space-around">
                                                    <v-btn fab dark x-small class="ma-1 ml-4" color="transparent" depressed @click="handUp(member.id)">
                                                        <v-icon color="amber">mdi-hand</v-icon>
                                                    </v-btn>
                                                    <send-message @sendMessage="sendMessage($event, member)"></send-message>
                                                </v-row>
                                        
                                        </v-list-item-content>

                                    </v-list-item> 

                                    </v-list-item-group>

                                </v-list>

                                
                            </v-col> 

                        </v-row>
        
                    </v-col>
                    <v-col cols="12" md="8">

                        <v-row >
                            <v-card color="white" class="board ma-2 rounded-lg" height="360">
     
                            <draw-board @onStream="videoBoard($event)"></draw-board>

                            </v-card>
                              
                        </v-row>
                        <v-row>
                            <chat-room :messages="chatMsg" @send-chat="sendChat($event)"></chat-room>
                        </v-row>

                    </v-col>
                </v-row>
            </v-card-text>

        </v-card>
        <pre>{{$data.peers}}</pre>
    </v-dialog>  
</template>

<script>
import AppData from '@mixins/AppData';
import Pusher  from 'pusher-js';
import Peer    from 'simple-peer';
import Chat    from './ChatRoom';
import Message from './TextMessage';
import Draw    from './DrawBoard'
export default {

    mixins:     [ AppData ],

    components:{
        'send-message': Message,
        'chat-room':    Chat,
        'draw-board':   Draw
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
        instance:    null,
        channel:     null,
        members:     [],
        personalMsg: [],
        chatMsg:     [],
        dialog:   false,
        stream:   null,
        peers:    {},
        tools:    false,
        board:    false,
        media:    { audio: false,  video: false },
        player:   { muted: false,  paused: false },
        ppalChanel: 'presence-clasrrorm-1-2-3-25082020',
        sections: [
                { label: 'Asistencia', icon: 'mdi-account-check', component: 'tarea-alumno', color: 'blue', sectionWidth: '700' },
                { label: 'Recursos', icon: 'mdi-book-open-page-variant', component: 'recurso-alumno', color: 'purple', sectionWidth: '700' },
                { label: 'Presentacion', icon: 'mdi-presentation', component: 'recurso-alumno', color: 'green', sectionWidth: '700' },
            ]
    }),

    methods:
    {
        async list()
        {
           /*  await this.getInstance();

            Pusher.logToConsole = true;

            if(!this.chanel)
            {
                this.setChanels()
            } */

            this.setupVideoChat()
        },

        async getInstance()
        {
            if(!this.credentials)
            {
                await this.$store.dispatch('credentials', this.idUser).then(users => {
                    console.log('credenciales obtenidad')
                }).catch(error => 
				{
					console.log('Error en Credentiasls')
				})
            }

            if(!this.instance)
            {

                await this.$store.dispatch('instance', this.idUser).then(pusher => {
                    this.instance = pusher
                    console.log('Creada Instancia de Pusher')
                }).catch(error => 
                {
                    console.log('Error al iniciar de Pusher', error)
                })
            }
        },

        setChanels()
        {
            this.channel  = this.instance.subscribe(this.ppalChanel); //curso/materia/docente/dia
            
            this.channel.bind(`client-${this.idUser}`, (mensaje) => 
            {
                console.log('personal recibido..', mensaje)                 //llamada p2p /mensaje personal

                switch (mensaje.type) {
                    case 'message':
                        this.personal[mesaje.userId].push(mensaje)
                        break;
                    case 'stream':
                        console.log('answer', mensaje)
                        const peer = this.getPeer(mensaje.userId, false);
                        peer.signal(mensaje.data);
                    default:
                        break;
                }
            }); 

            this.channel.bind(`client-video-room`, (signal) =>      
            {
                console.log('video recibido...', signal)                    //stream video
            }); 

            this.channel.bind(`client-chat-room`, (mensaje) => 
            {
                console.log('chat recibido...', mensaje)  
                this.chatMsg.push(mensaje)                                  //mensajes tipo:  chat
            }); 

            /* Members Presence */

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
                this.startVideoChat(member.info.id)

            });

            this.channel.bind('pusher:member_removed', (member) => 
            {
                this.showMessage(`salio ${member.info.nb_usuario} (${member.info.nb_nombres})`)
                this.members = this.members.filter((membr) => { return membr.id != member.id})
                delete this.peers[member.info.id];
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

                peer.on('error', err => {
                    console.log('peer error', err)
                    this.showError(err)
                })

                peer.on('signal', (data) => {
                    console.log('señal peer')
                    this.channel.trigger(`client-${userId}`, {type:'stream', userId: this.idUser, data: data});
                })
                .on('connect', () => {
                    console.log('Se ha establecido la conexion')
                })
                .on('stream', (stream) => {
                    console.log('Se ha estRecibiendo stream')
                    this.$refs[`remote-video-${userId}`][0].srcObject = stream;
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
            console.log('mensaje enviado...',text)
        },

        sendChat(text)
        {
            let user    = this.channel.members.me.info
            let mensage = { type: 'chat', text, user} 
            this.channel.trigger(`client-chat-room`, mensage );
            this.chatMsg.push(mensage)
            console.log('chat enviado..',text)
        },

        startVideoChat(userId) {
            this.getPeer(userId, true);
        },

        startMeet()
        {
            this.setChanels()
            this.setupVideoChat()
        },

        endMeet()
        {
            this.instance.unsubscribe(this.ppalChanel);
            this.chanel = null
            
            for (const userId in this.peers) {
                if (this.peers.hasOwnProperty(userId)) {
                    this.peers[userId].destroy();
                    delete this.peers[userId];
                }
            }

            this.$refs['local-video'].pause()

            this.stream.getTracks().forEach( (track) => track.stop());
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
                        this.media.video = { width: 435, height: 310, frameRate: { ideal: 10, max: 15 } };
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

        videoFullscreen(refVideo)
        {
            this.$ref[refVideo].requestFullscreen()
        },

        videoBoard(stream)
        {
            console.log('stream',stream)   
            this.$refs['video-board'].srcObject = stream
        }

    /*
            getDisplayMedia()
                        {
                video: {
                    cursor: 'always' | 'motion' | 'never',
                    displaySurface: 'application' | 'browser' | 'monitor' | 'window'
                }
            }
                        */
       
    }
}
</script>

<style >
.local-video{
    width: 100%;
}
.board{
    width: 100%;
}
.meet-container{
    max-height: 93vh;
}
.members-container{
    height: 40vh;
    max-height: 40vh;
    overflow-y: scroll;
}
</style>
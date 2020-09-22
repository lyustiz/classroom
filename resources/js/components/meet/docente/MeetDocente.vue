<template>

    <v-container fluid class="grey darken-4 meet-container pt-0">
        <get-devices ></get-devices>
     <!--        
        <v-row>
            <v-col cols="12" md="3">

                <v-row dense>

                    <v-col cols="12">
                        <local-video :stream="stream" @onPlayer="playerAction($event)" @toggleVideo="toggleVideo()"></local-video>
                    </v-col>

                    <v-col cols="12">
                        <list-members :members="members">
                            <template v-slot:video="member">  
                                <remote-video :stream="stream" :ref="`remote-video-${member.id}`"></remote-video>
                            </template>
                        </list-members>
                    </v-col>

                </v-row>
                
            </v-col> 

            <v-col cols="12" md="9">

                <v-row dense>

                    <v-col cols="12">
                        <draw-board @onStream="videoBoard($event)" class="board white rounded-lg elevation-3"></draw-board>
                    </v-col>

                    <v-col cols="12">
                        <chat-room class="rounded-lg elevation-3" :messages="chatMsg" @send-chat="sendChat($event)"></chat-room>
                    </v-col>

                </v-row>

            </v-col>

        </v-row>
 -->
    </v-container>
       
</template>

<script>
import AppData     from '@mixins/AppData';
import GetDevices  from '../components/localVideo/videoContainer';
import Pusher      from 'pusher-js';
import Peer        from 'simple-peer';
import Chat        from '../ChatRoom';
import Draw        from '../DrawBoard'
import LocalVideo  from '../LocalVideo'
import RemoteVideo from '../RemoteVideo'
import Listmembers from '../ListMember'
export default {

    mixins:     [ AppData ],

    components:
    {
        'chat-room':    Chat,
        'draw-board':   Draw,
        'local-video':  LocalVideo,
        'remote-video': RemoteVideo,
        'list-members': Listmembers,
        'get-devices':  GetDevices
    },

    created()
    {
        this.list()
        this.members.push({ id: 1, nb_nombres: "luis yustiz", nb_usuario: "lyustiz" })
        this.members.push({ id: 2, nb_nombres: "luisa tovar", nb_usuario: "ltovar" })
        this.members.push({ id: 3, nb_nombres: "luisa tovar", nb_usuario: "ltovar" })
        this.members.push({ id: 4, nb_nombres: "luisa tovar", nb_usuario: "ltovar" })
    },

    computed:
    {
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
        dialog:      false,
        stream:      null,
        boardStream: null,
        peers:       {},
        board:       false,
        media:       { audio: false,  video: false },
        classChanel: 'presence-clasrrorm-1-2-3-25082020',
        sections: [
                { label: 'Asistencia',   icon: 'mdi-account-check', component: 'tarea-alumno', color: 'blue', sectionWidth: '700' },
                { label: 'Recursos',     icon: 'mdi-book-open-page-variant', component: 'recurso-alumno', color: 'purple', sectionWidth: '700' },
                { label: 'Presentacion', icon: 'mdi-presentation', component: 'recurso-alumno', color: 'green', sectionWidth: '700' },
            ]
    }),

    methods:
    {
        list()
        {


           
           /*  await this.getInstance();

            Pusher.logToConsole = true;

            if(!this.chanel)
            {
                this.setChanels()
            } */

            //this.setupVideoChat()
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
            this.channel  = this.instance.subscribe(this.classChanel); //curso/materia/docente/dia
            
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
            this.instance.unsubscribe(this.classChanel);
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
            .catch((error) => {
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
                    
                } else{
                    videoTracks[0].enabled = true
                }
                this.media.video   = videoTracks[0].enabled 
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
            //this.$refs['video-board'].srcObject = stream
        }
       
    }
}
</script>

<style >
.board{
    height: 50vh;
    
}
.meet-container{
    min-height: 100%;
}

</style>
<template>

<v-card>
    <v-card-text class="py-4 px-8">

        <v-row dense>
            <v-col>
                <v-subheader class="deep-purple--text">CONFIGURACION AUDIO VIDEO</v-subheader>
            </v-col>
            <v-col cols="auto">
                <v-btn icon><v-icon color="deep-purple" @click="$emit('closeDialog')">mdi-close-circle-outline</v-icon></v-btn>
            </v-col>
        </v-row>

        <v-row class="mt-2">
            <v-col cols="12">
                <v-select
                    :items="audioInputs"
                    item-text="label"
                    item-value="deviceId"
                    v-model="microphone"
                    label="Microfono"
                    no-data-text="Microfono no disponible"
                    :loading="loading"
                    dense
                    prepend-icon="mdi-microphone-outline"
                    return-object
                    @change="setMicrophone"
                    :error="!microphone"
                    :error-messages="(!microphone) ? 'No se han detectado Microfono' : null"
                ></v-select>
            </v-col>

            <v-col cols="12">
                <v-select
                    :items="videoInputs"
                    item-text="label"
                    item-value="deviceId"
                    v-model="camera"
                    label="Camara"
                    no-data-text="Camara no disponible"
                    :loading="loading"
                    dense
                    prepend-icon="mdi-video"
                    return-object
                    @change="setCamera"
                    :error="!camera"
                    :error-messages="(!camera) ? 'No se han detectado camara' : null"
                ></v-select>
            </v-col>

            <v-col cols="12" >
                <v-select
                    :items="audioOutputs"
                    item-text="label"
                    item-value="deviceId"
                    v-model="speaker"
                    label="Audio"
                    no-data-text="Audio no disponible"
                    :loading="loading"
                    dense
                    prepend-icon="mdi-volume-high"
                    return-object
                    @change="setSpeaker"
                    :error="!speaker"
                    :error-messages="(!speaker) ? 'No se han detectado Cornetas' : null"
                ></v-select>
            </v-col>
    
            <v-col cols="12" class="px-6">
                <v-btn block color="success" depressed @click="refreshDevices()" rounded :loading="loading">
                    <v-icon class="mr-1">mdi-cog-refresh</v-icon> Detectar nuevamente dispositivos
                </v-btn>
            </v-col>
        </v-row>
             
    </v-card-text>

</v-card>
  
</template>

<script>
import AppRules   from '@mixins/AppRules';

export default {

    mixins: [ AppRules ],

    mounted()
    {
         this.$nextTick().then( () => 
        {
            this.setupDevices()
        })
        
        
    },

    data() 
    {
        return {
            loading:     false,
            devices:      [],
            audioInputs:  [],
            audioOutputs: [],
            videoInputs:  [],
            microphone:  null,
            speaker:     null,
            camera:      null
        }
    },

    methods: 
    {
        
        setupDevices()
        {
            this.loading = true
            
            this.getDevices()

            navigator.mediaDevices.ondevicechange =  this.updateDevices
        },
        
        getDevices() {
         
            navigator.mediaDevices.enumerateDevices().then((devices) => {
             
                for (const device of devices) {

                    if( device.kind == 'audioinput' ) {
                        this.audioInputs.push({ deviceId: device.deviceId,  label: device.label })
                        if( !this.microphone ) {
                            this.microphone  = device.deviceId
                            this.setMicrophone(device)
                        }
                    }

                    if( device.kind == 'videoinput' ) {
                        this.videoInputs.push( {deviceId: device.deviceId, label: device.label  })
                        if( !this.camera ) {
                            this.camera  = device.deviceId
                            this.setCamera(device)
                        }
                    }

                    if( device.kind == 'audiooutput' ) {
                        this.audioOutputs.push( {deviceId: device.deviceId, label: device.label  }) 
                        if( !this.speaker ) {
                            this.speaker  = device.deviceId 
                            this.setSpeaker(device)
                        }
                    }
                }
                this.loading = false
                this.$emit('onDevices', {  microphone: this.microphone, camera: this.camera, speaker: this.speaker  })

            })
            .catch((error) => {
                this.showError('deviceError' + error)
                console.log(error.name)
            });
        },

        updateDevices()
        {
            this.loading    = true
            this.showMessage(`Cambio en dispositivo audio/video`)
            this.microphone = null
            this.camera     = null
            this.speaker    = null
            this.getDevices()
        },

        refreshDevices()
        {
            this.loading    = true
            this.showMessage(`Actualizando dispositivo audio/video`)
            this.microphone = null
            this.camera     = null
            this.speaker    = null
            this.setMicrophone(null)
            this.setCamera(null)
            this.setSpeaker(null)
            this.getDevices()
        },

        setMicrophone(microphone){ 
            this.$store.commit('setMicrophone', microphone)
            this.$emit('onMicrophone', microphone)
        },

        setCamera(camera){
            this.$store.commit('setCamera', camera)
            this.$emit('onCamera', camera)
        },

        setSpeaker(speaker){
            this.$store.commit('setSpeaker', speaker)
            this.$emit('onSpeaker', speaker)
        },

        handleMediaError(mediaError)
        {
            switch (mediaError.name) {
                case 'NotAllowedError':
                    this.showError('Dispositivo Bloqueado por el Usuario')
                    console.log(mediaError.message)
                    break;
                case 'NotFoundError':
                    console.log(mediaError.message)
                    break;
                case 'SecurityErro':
                    this.showError('Aeeror al acceder a dispositivo')
                    console.log(mediaError.message)
                    break;
                default:
                    this.showError('Error en dispositivo audio/video')
                    console.log(mediaError.message)
                    break;
            }
        }

    }
}
</script>

<style>

</style>
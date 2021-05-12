<template>
            
        <v-card color="elevation-1 mx-1" class="rounded-xl mx-1" width="100%" >

            <v-card-text class="">
                
            <v-row class="" dense>
                <v-col cols="4" class="text-center" v-if="images.length < 3"> 
                    <v-expand-x-transition>
                    <v-avatar :width="width" :height="height" tile class="rounded-lg text-center" color="grey lighten-4" >
                        <v-file-input 
                            accept="image/*" 
                            :capture="capture" 
                            v-model="imageUpload" 
                            color="blue"
                            prepend-icon="mdi-image-plus" 
                            class="ml-12 pa-0"
                            :loading="loading"
                            hide-input
                            :disabled="disabled"
                            @change="setImage()">
                            <template v-slot:selection></template>
                        </v-file-input>
                    </v-avatar>
                    </v-expand-x-transition>
                </v-col>
            
            <!-- Image Item -->
                <v-col cols="4"  class="text-center" v-for="(image, idx) in images" :key="idx">
                <v-hover v-slot:default="{ hover }"  >
                <v-expand-x-transition>
                    <v-avatar  :width="width" :height="height" tile class="rounded-lg grey lighten-4" rounded >
                        <v-img contain :src="image.full_url">
                            <v-scale-transition>
                                <v-icon v-if="hover" color="grey lighten-4" class="pointer" size="64" @click="deleteDialog(image)">mdi-close-circle-outline</v-icon>
                            </v-scale-transition> 
                        </v-img>
                    </v-avatar>
                </v-expand-x-transition>
                </v-hover>
                </v-col>
            </v-row>
            </v-card-text>
        <!-- Cropper Tool -->
        <v-dialog
            v-model="crop"
            fullscreen 
            persistent 
            transition="dialog-transition">
            
            <v-container>

                <v-card class="col-10 mx-auto" :loading="loading">

                    <cropper 
                        v-if="crop"
                        classname="cropper"
                        :src="rawImg"
                        ref="cropper"
                    ></cropper>
                    
                    <v-btn fab top right absolute @click="cropImage" color="success" class="mt-12" :loading="loading">
                        <v-icon>mdi-crop</v-icon>
                    </v-btn>

                    <v-btn fab top left absolute @click="crop=false" color="error" class="mt-12" :loading="loading">
                        <v-icon>mdi-close</v-icon>
                    </v-btn>
                    
                </v-card>
                
            </v-container>
            
        </v-dialog>

        <form-delete
            :dialog="delDialog"
            :loading="loading"
            message="Desea eliminar la Foto?"
            @deleteItem="deleteImage()"
            @deleteCancel="deleteCancel()"
        ></form-delete>

        </v-card>
            
</template>

<script>
import AppData from '@mixins/AppData';
import { Cropper } from 'vue-advanced-cropper'

export default {

    components: {
		Cropper
    },
    
    mixins:     [ AppData],

    props:
    {
        origenId: {
            type:       Number,
            default:    1
        },

        tipoFoto: {
            type:       Number,
            default:    6
        },

        maxItems: {
            type:       Number,
            default:    3
        },
        width:{
            type:       Number,
            default:    120
        },

        height:{
            type:       Number,
            default:    100
        },

        aspectRatio: {
            type:       Number,
            default:    100/120
        },

        capture: {
            type:       Boolean,
            default:    false
        },

        disabled: {
            type:       Boolean,
            default:    false
        },

    },

    created()
    {
        if(this.origenId)
        {
            this.list()
        }
    },

    watch:
    {
        origenId()
        {
            if(this.origenId)
            {
                this.resource =   `foto/tipoFoto/${this.tipoFoto}/origen/${this.origenId}`
                this.list()
            }
        },
    },

    data () {
        return {
            resource:     `foto/tipoFoto/${this.tipoFoto}/origen/${this.origenId}`,
            imageUpload:  null,
            images:       [],
            rawImg:       null,
            crop:         false,
            loading:      true,
            image:        null,
            delDialog:    false,
            validateForm: false,
            imageType  :  false
        }
    },
    methods:
    {
        list()
        {
            this.images = []
            
            this.getResource( this.resource ).then( data =>  this.images = data )
        },

        store(imgSource)
        {
            this.image = {
                tx_src      : imgSource,
                id_tipo_foto: this.tipoFoto,
                id_origen   : this.origenId,
                id_usuario  : this.idUser,
            }

            this.storeResource('foto', this.image).then( (data) =>  
            {
                this.showMessage(data.msj)

                this.crop   = false
                
                this.rawImg = null

                this.list()
            })
        },

        deleteImage()
        {

            this.deleteResource('foto/' + this.image.id).then( (data) =>  
            {
                this.showMessage(data.msj)

                this.images    = this.images.filter(image => image.id != this.image.id)

                this.image     = null

                this.delDialog = false

                this.$emit('updateImages', this.images)
            })
        },
        
        deleteDialog(image)
        {
           this.image  = image
           this.delDialog = true
           this.loading = false
        },

        deleteCancel()
        {
            this.image  = null
            this.delDialog = false
            this.$emit('close', this.image)
        },

        cropImage() 
        {
            this.loading = true

            const { canvas } = this.$refs.cropper.getResult()

            let imgSource = canvas.toDataURL(this.imageType, 0.92)

            this.store(imgSource)

            this.$emit('updateImages', this.images)
        },
        
        validImage(image)
        {
            let size = image.size / 1024  ; //kilobites
            let type = image.type.split('/');
            let imageTypes = ['jpeg', 'png', 'bmp'];

            const fileTypes = [
                "image/apng",
                "image/bmp",
                "image/gif",
                "image/jpeg",
                "image/pjpeg",
                "image/png",
                "image/svg+xml",
                "image/tiff",
                "image/webp",
                "image/x-icon"
                ];

            if(size > 0)
            {
                if(size > 2048)
                {
                    let msj = 'archivo debe ser menor de 2 MB. (Actual: '+ (size / 1024).toFixed(2) +' MB)';
                    this.showError(msj)
                    return false;
                }
            }

            if( (type[0] != 'image') || ( !imageTypes.includes(type[1]) ) )
            {
                let msj = 'solo se permiten imagenes con los formatos: ' + imageTypes;
                this.showError(msj)
                return false;
            }

            return true;
        },

        setImage()
        {
           if(this.imageUpload)
            {
                this.imageType = this.imageUpload.type;
                
                if(this.isMaxFiles()) return 

                if(!this.validSize()) return

                this.loading  = true

                let reader    = new FileReader();

                reader.readAsDataURL(this.imageUpload);

                reader.onload = () => 
                {
                    this.rawImg      = reader.result

                    this.imageUpload = null

                    this.crop        = true

                    this.loading     = false
                };

                reader.onerror = () => 
                {
                   this.showError({ msj: 'error al intentar cargar la foto'})
                };
            }
        },

        validSize()
        {
            if(this.imageUpload.size/1048576 > 10)
            {
                this.showError('Tamaño de Foto excede los 5 MB ('+ file.size/5120 + ')MB')

                this.imageUpload = null

                return false
            }
            return true
        },

        isMaxFiles()
        {
            if(this.images.length >= this.maxItems)
            {
                this.imageUpload = null

                this.showError('Solo se permiten la carga de '+ this.maxItems+ ' archivos')

                return true
            }
            return false
        },

    }
}
</script>

<style>
.vue-advanced-cropper__image
{
    background-color: white;
}
</style>
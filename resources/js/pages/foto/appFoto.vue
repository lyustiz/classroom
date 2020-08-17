<template>
            
        <v-sheet color="grey lighten-5" class="py-1 rounded" :width="width+8" :height="height+8" >
            
            <v-avatar  :width="width" :height="height" tile class="ml-1 rounded" v-if="images.length < 1">
                <v-file-input 
                    accept="image/*" 
                    :capture="capture" 
                    v-model="imageUpload" 
                    color="purple"
                    prepend-icon="mdi-image-search" 
                    class="col-1 mr-5 mt-3"
                    :loading="loading"
                    :disabled="disabled"
                    @change="setImage()">
                    <template v-slot:selection></template>
                </v-file-input>
            </v-avatar>

            <!-- Image Item -->
            <template v-for="(image, idx) in images" >
                <v-hover v-slot:default="{ hover }" :key="idx" >
                <v-expand-x-transition>
                <v-avatar  :width="width" :height="height" tile class="ml-1">
                    <v-img :src="image.tipo_foto.tx_base_path + '/' + image.id_origen + '/' + image.tx_src">
                        <v-scale-transition>
                            <v-icon v-if="hover" color="white" class="pointer" size="48" @click="deleteDialog(image)">mdi-close-circle-outline</v-icon>
                        </v-scale-transition> 
                    </v-img>
                </v-avatar>
                </v-expand-x-transition>
                </v-hover>
            </template>

        <!-- Cropper Tool -->
        <v-dialog
            v-model="crop"
            fullscreen 
            persistent 
            transition="dialog-transition">
            
            <v-container>

                <v-card class="col-10 mx-auto">

                    <cropper 
                        v-if="crop"
                        classname="cropper"
                        :src="rawImg"
                        :stencil-props="{ aspectRatio: aspectRatio }"
                        ref="cropper"
                    ></cropper>
                    
                    <v-btn fab top right absolute @click="cropImage" color="success" class="mt-12">
                        <v-icon>mdi-crop</v-icon>
                    </v-btn>

                    <v-btn fab top left absolute @click="crop=false" color="error" class="mt-12">
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

        </v-sheet>
            
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
            default:    1
        },

        maxItems: {
            type:       Number,
            default:    2
        },
        width:{
            type:       Number,
            default:    100
        },

        height:{
            type:       Number,
            default:    100
        },

        aspectRatio: {
            type:       Number,
            default:    100/100
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

                this.images = this.images.filter(image => image.id != this.image.id)

                this.image  = null

                this.delDialog = false

                this.$emit('updateImages', this.images)
            })
        },
        
        deleteDialog(image)
        {
           this.image  = image
            this.delDialog = true
        },

        deleteCancel()
        {
            this.image  = null
            this.delDialog = false
            this.$emit('close', this.image)
        },

        cropImage() 
        {
            const { canvas } = this.$refs.cropper.getResult()

            let imgSource = canvas.toDataURL('image/jpeg', 0.92)

            this.store(imgSource)

            this.$emit('updateImages', this.images)
        },
        
        validImage(image)
        {
            let size = image.size / 1024  ; //kilobites
            let type = image.type.split('/');
            let imageType = ['jpeg', 'png', 'bmp'];

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

            if( (type[0] != 'image') || ( !imageType.includes(type[1]) ) )
            {
                let msj = 'solo se permiten imagenes con los formatos: ' + imageType;
                this.showError(msj)
                return false;
            }

            return true;
        },

        setImage()
        {
           if(this.imageUpload)
            {
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
</style>
<template>
    <div>

        <v-menu transition="slide-x-transition" right :close-on-content-click="false" content-class=" rounded-lg elevation-0">

            <template v-slot:activator="{ on }" @click="menu==true" >
                
                <div v-if="src" v-on="on" >
                    <v-img :src="src" class="grey lighten-4 image-preview ma-1 rounded-lg pointer"  contain></v-img>
                </div>

                <div class="grey lighten-4 image-preview ma-1 rounded-lg text-center pointer" v-on="on"  v-else>
                    <v-icon color="indigo" size="60">mdi-image-area</v-icon>
                </div>

            </template>

            <template v-if="src">
                <v-hover v-slot:default="{ hover }">
                <v-card class="grey lighten-4 image-view ma-1 rounded-lg pointer" :width="width" :height="height" :max-width="width" :max-height="height">
                    <v-img :src="src" class="text-center">
                        <v-scale-transition>
                            <v-icon v-if="hover" color="white" class="pointer my-4" size="58" @click="deleteDialog()">mdi-close-circle-outline</v-icon>
                        </v-scale-transition> 
                    </v-img>
                </v-card>
                </v-hover>
            </template>

            <template v-else>
                <v-card :width="width" :height="height" tile color="grey lighten-2" class="ml-1 rounded-lg image-view text-center py-4 pl-4" >
                     <v-file-input 
                        accept="image/*" 
                        :capture="capture" 
                        v-model="imageUpload" 
                        color="indigo"
                        prepend-icon="mdi-image-search" 
                        class="ml-16"
                        hide-input
                        :loading="loading"
                        :disabled="disabled"
                        @change="setImage($event)">
                        <template v-slot:selection></template>
                    </v-file-input>
                </v-card>
            </template>

        </v-menu>

        <!-- Cropper Tool -->
       <v-dialog
            v-model="crop"
            width="95vw" 
            height="95vh"
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
                        width="95vw" 
                        height="95vh"
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

    </div>
            
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

        foto: {
            type:       Object,
            default:    null
        },

        height: {
            type:       Number,
            default:    100
        },

        width: {
            type:       Number,
            default:    180
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
        this.src          = (this.foto) ? this.foto.full_url: null
        this.image        = (this.foto) ? this.foto: null
        this.validateForm = false
    },

    watch:
    {
        origenId()
        {
            if(this.origenId)
            {
                this.src     = (this.foto) ? this.foto.full_url: null
                this.image   = (this.foto) ? this.foto: null
            }
        },
    },

    data () {
        return {
            resource:    `foto/tipoFoto/${this.tipoFoto}/origen/${this.origenId}`,
            src:         null,
            imageUpload: null,
            image:       null,
            rawImg:      null,
            crop:        false,
            loading:     true,
            image:       null,
            delDialog:   false,
            imageType:   false
        }
    },
    methods:
    {

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

                this.src    = data.foto.full_url

                this.image = data.foto

                this.$emit('updateImage', this.image)

                console.log(this.src)
            })
        },

        deleteImage()
        {

            this.deleteResource('foto/' + this.image.id).then( (data) =>  
            {
                this.showMessage(data.msj)

                this.image     = null

                this.delDialog = false

                this.src       = null

                this.$emit('updateImage', null)

                console.log(this.src)
            })
        },
        
        deleteDialog()
        {
            this.delDialog = true
            this.loading = false
        },

        deleteCancel()
        {
            this.delDialog = false
            this.$emit('close', this.image)
        },

        cropImage() 
        {
            const { canvas } = this.$refs.cropper.getResult()

            let imgSource = canvas.toDataURL(this.imageType, 0.92)

            this.store(imgSource)

        },
        
        validImage(image)
        {
            let size       = image.size / 1024  ; //kilobites
            let type       = image.type.split('/');
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

        setImage(file)
        {           
           if(this.imageUpload)
            {
                if(!this.validSize()) return

                this.imageType = this.imageUpload.type;

                this.loading  = true

                let reader    = new FileReader();

                reader.readAsDataURL(this.imageUpload);

                reader.onload = () => 
                {
                    this.rawImg      = reader.result

                    this.imageUpload = null

                    this.loading     = false

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
       

    }
}
</script>

<style>
.vue-advanced-cropper__image
{
    background-color: white;
}
.cropper {
	max-height: 95vh;
	background: #DDD;
}
.image-preview{
    height: 58px;
    max-height: 58px;
    width: 100px;
    max-width: 100px;
}

.image-view{
    display: block;
    height: 100;
    max-height: 100;
    width: 120;
    max-width: 120;
}
</style>
<template>
    <v-form v-model="valid" ref="form" >
    <v-row no-gutters>
    <v-col  md="6" sm="12" xs="12">
    <v-card class="ml-auto" max-width="400" :loading="loading">
        <v-card-title >
            Datos Personales
        </v-card-title>
        <v-card-text>
            <v-flex xs12 >
                <v-text-field
                    color="cyan darken-3"
                    prepend-inner-icon="mdi-account"
                    label="Nombre"
                    type="text"
                    v-model="form.nb_nombres"
                    :rules="[rules.required, rules.maxlength(50)]"
                    dense
                    outlined
                    filled >
                </v-text-field>
            </v-flex>

            <v-flex xs12>
                <v-menu
                    v-model="picker"
                    :close-on-content-click="false"
                    :nudge-right="40"
                    transition="scale-transition"
                    offset-y
                    min-width="290px"
                >
                    <template v-slot:activator="{ on }">
                    <v-text-field
                        v-model="dates.fe_nacimiento"
                        :rules="[rules.fecha]"
                        label="Fecha de Nacimiento"
                        prepend-inner-icon="event"
                        readonly
                        v-on="on"
                        dense
                        outlined
                        filled
                    ></v-text-field>
                    </template>
                    <v-date-picker v-model="form.fe_nacimiento" @input="formatPicker()"></v-date-picker>
                </v-menu>
            </v-flex> 

            <v-flex md12 xs12>
                <v-radio-group v-model="form.tx_sexo" row dense>
                    <v-radio label="Hombre" value="M"></v-radio>
                    <v-radio label="Mujer" value="F"></v-radio>
                </v-radio-group>
            </v-flex>

            </v-card-text>
            <v-card-actions>
                <v-spacer></v-spacer>
                <v-btn small fab dark color="amber"  @click="cancel()" :loading="loading"> <v-icon>mdi-restore</v-icon></v-btn>
                <v-btn small fab dark color="primary" @click="update()" :loading="loading"> <v-icon>mdi-content-save</v-icon></v-btn>
          </v-card-actions>
        </v-card>
        </v-col>
        <v-col cols="12" md="6" lg="6">

        <v-card class="mx-rigth pa-2" max-width="200">
            
            <v-img
            :src="fileSrc"
            lazy-src="images/account.png"
            aspect-ratio="1"
            class="grey lighten-2"
            max-width="200"
            max-height="200"
            >
                <template  >
                    <v-row
                    class="fill-height"
                    align="center"
                    justify="center"
                    >
                    <v-file-input 
                        color="red" 
                        accept="image/*" 
                        capture="camera" 
                        v-model="file" 
                        prepend-icon="mdi-image-search" 
                        class="col-1" 
                        ref="inputImage"
                    >
                        <template v-slot:selection="{  }">
                            <div></div>
                        </template>
                    </v-file-input>
                    </v-row>
                </template>
            </v-img>
        </v-card>
    </v-col>
    </v-row>
    </v-form>
</template>

<script>
import AppForm from '@mixins/AppForm'

export default {
    mixins: [ AppForm ],

    created()
    {
        this.item = this.$store.getters['getUser']
        this.mapForm()
        this.setSrc()
        this.loading = false
    },
    computed: 
    {
        fileSrc()
        {
           if(this.file) {

                if(this.validImage(this.file))
                {
                    this.form.tx_foto = this.file.name;
                    let src = (this.file.src) ? this.file.src : URL.createObjectURL(this.file);

                    if(!this.file.src)
                    {
                        this.fileToSrc()
                    }

                    return  src;
                }
            }

            this.form.tx_foto = '';
            this.form.tx_src  = '';
            return 'images/account.png';
        },

        getUserid()
        {
            return this.$store.getters['getUserid']
        }

    },
    data() 
    {
        return {
            resource: 'usuario', 
            form: {
                nb_nombres:     '',
                fe_nacimiento:  '',
                tx_sexo:        '',
                tx_foto:        '',
                tx_src:         '',
                id_usuario:     ''
            },
            dates: {
                fe_nacimiento: ''
            },
            file:   null,
        }
    },
    methods:
    {
        update() 
		{
            if (!this.$refs.form.validate())  return 

            this.loading = true;
            this.form.id_usuario = this.item.id;
            
            axios.put(this.fullUrlId, this.form)
            .then(response => 
            {
                this.showMessage(response.data.msj)
                
                this.item.nb_nombres    = this.form.nb_nombres
                this.item.fe_nacimiento = this.form.fe_nacimiento
                this.item.tx_sexo       = this.form.tx_sexo
                this.item.tx_foto       = this.form.tx_foto
                this.item.tx_src        = this.form.tx_src
                this.item.id_usuario    = this.form.id_usuario

                this.$store.commit('setUser', this.item)
            })
            .catch(error =>
            {
                this.showError(error);
            })
            .finally( () =>
            {
                this.loading = false
            }); 
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

        formatPicker()
        {
            this.dates.fe_nacimiento = this.formatDate( this.form.fe_nacimiento )
            this.picker = false;
        },

        setSrc()
        {
            let fullSrc = '/storage/account/' + this.form.tx_foto
            
            if(this.form.tx_foto)
            {
                if(this.form.tx_foto.length > 0)
                {
                    this.file = { size: 10, type: 'image/jpeg', src: fullSrc, name:this.form.tx_foto }                
                }
            }
        },

        fileToSrc()
        {
        
            let reader = new FileReader();

            reader.readAsDataURL(this.file);

            reader.onload = () => {
                this.form.tx_src = reader.result;
            };

            reader.onerror = () => {
                this.form.tx_src=null;
            };

        },

        cancel()
        {
            this.item = this.$store.getters['getUser']
            this.mapForm()
            this.setSrc()
        }



    }

}
</script>

<style>

</style>
<template>
 <div>
    <v-card>

    <v-card-title class="deep-purple">
        <v-row no-gutters>
            <v-col>
                <v-icon v-text="tipo.tx_icono" :color="tipo.tx_color" size="46"></v-icon>
                <span class="ml-2 my-2 white--text text-capitalize">{{`Agregar ${tipo.nb_tipo_asignacion}`}}</span>
            </v-col>
            <v-col cols="auto" class="mt-2">
                <v-btn icon dark><v-icon @click="$emit('closeDialog')">mdi-close-circle-outline</v-icon></v-btn>
            </v-col>
        </v-row>
    </v-card-title>

    <v-card-text>

        <v-row justify="center">

            <v-col cols="10" class="text-center">

                <v-file-input 
                    :prepend-icon="tipo.tx_icono"
                    append-icon="mdi-gesture-tap"
                    :placeholder="`Haga click para cargar el Archivo`"
                    :accept="accept" 
                    v-model="file"
                    :color="tipo.tx_color"
                    :loading="loading"
                    :disabled="loading"
                    @change="setFiles()"
                    rounded
                    filled
                    :rules="[rules.file]"
                    >
                </v-file-input>

            </v-col>

        </v-row>

        <v-row>

        <v-col cols="12">
            <v-text-field
                :rules="[rules.required, rules.max(100)]"
                v-model="form.nb_archivo"
                label="Nombre"
                placeholder="Indique Nombre"
                dense
            ></v-text-field>
        </v-col>
          
        <v-col cols="12" md="12">
            <v-text-field
                :rules="[rules.max(100)]"
                v-model="form.tx_observaciones"
                label="Observaciones"
                placeholder="Indique Observaciones"
                dense
            ></v-text-field>
        </v-col>

        </v-row>

    </v-card-text>

    <v-card-actions>
            <v-spacer></v-spacer>
            <form-buttons
                @update="update()"
                @store="store()"
                @clear="clear()"
                @cancel="cancel()"
                action="ins"
                :valid="valid"
                :loading="loading"
            ></form-buttons>
        </v-card-actions>
    
     <v-overlay 
        absolute
        :opacity="0.3"
        :value="loading"
        :z-index="10">
        <v-icon size="40" class="mdi-spin">mdi-loading</v-icon>
    </v-overlay>


    <pre v-if="$App.debug">{{ $data }}</pre>

     </v-card>
</div>
</template>

<script>
import AppData      from '@mixins/AppData';
import AppMimeTypes from '@mixins/AppMimeTypes';

export default {

    mixins:     [ AppData, AppMimeTypes ],

    props:
    {
        tipoRecurso: {
            type: Number,
            default: null
        },

        tipo: {
            type: Object,
            default: null
        },

        tema: {
            type: Number,
            default: null
        },

        grado: {
            type: Number,
            default: null
        } 
    },

    created()
    {
        if( this.tipo.nb_tipo_asignacion == 'audio' )  {
            this.fileType             = this.fileTypesByName('Audio')
            this.accept               = this.getTypeAccept()
            this.form.id_tipo_archivo = 8
            this.form.id_tipo_recurso = 1
            this.form.tx_mimetype     = 'Audio'
        }

        if( this.tipo.nb_tipo_asignacion == 'lectura' )  {
            this.fileType             = this.fileTypesByName('PDF')
            this.accept               = this.getTypeAccept()
            this.form.id_tipo_archivo = 10
            this.form.id_tipo_recurso = 3
            this.form.tx_mimetype     = 'PDF'
        }
        this.form.id_tema  = this.tema
        this.form.id_grado = this.grado
    },

    data () {
        return {
            accept:   null,
            mimes:    [],
            file:     [],
            fileType: [],
            loading:  false,
            form:
            {
                id: 	          null,
				nb_archivo: 	  null,
				id_tipo_archivo:  null,
                tx_mimetype:      null,
                tx_file_source:   null,
                tx_path:          null,
				id_tipo_recurso:  null,
				id_tema: 	      null,
				id_grado: 	      null,
				id_status: 	      null,
                id_usuario: 	  null,
            },
            default: 
            {
                id_status:  1
            }
        }
    },
    methods:
    {
        setFiles()
        {
           if(this.file)
            {
                this.loading = true
                
                console.log('change', this.file)
                
                if(!this.validSize()) return 

                if(!this.validType()) return 

                let reader = new FileReader();

                reader.readAsDataURL(this.file);

                reader.onload = () => 
                {
                    this.form.tx_file_source = reader.result

                    this.form.tx_path        = this.file.name

                    this.loading     = false
                };

                reader.onerror = () => 
                {
                   this.showError('Error al intentar cargar el archivo')
                };
            }
        },

        validSize()
        {
            let valid = this.file.size/1048576 <= 10
            
            if( !valid ) {
                this.showError(`Tamaño de archivo excede los 10 MB ( '${file.size/1048576}'MB )`)
                this.loading = false
                this.file    = null
            }

            return valid
        },

        validType()
        {
            let valid = this.mimes.includes(this.file.type)
            if( !valid ) {
               this.showError(`Tipo de Archivo no Permitido` )
               this.loading = false
               this.file    = null
            }

            return valid
        },

        store()
        {
            this.storeResource('recurso', this.form).then( data => {
                this.showMessage(data.msj)
                this.$emit('closeDialog', true)
            })
        }
    }
}
</script>

<style>
</style>
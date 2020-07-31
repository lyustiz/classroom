<template>


    <v-form ref="form" v-model="valid" lazy-validation>

    <v-card :loading="loading" flat class="rounded-xl">

        <v-card-text>

        <v-row>

        <v-col cols="12" class="text-center">
            <v-avatar
                size="60"
                :color="fileType.color">
                <v-icon size="48" color="white" v-text="fileType.icon"></v-icon>
            </v-avatar>
            <v-chip v-text="fileType.name" :color="fileType.color" dark>text</v-chip>
        </v-col>
                 
        <v-col cols="12">
            <v-text-field
                :rules="[rules.required]"
                v-model="form.nb_archivo"
                label="Descripcion"
                placeholder="Indique Descripcion"
                dense
            ></v-text-field>
        </v-col>
                        
        <v-col cols="12" >
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
                :action="action"
                :valid="valid"
                :loading="loading"
            ></form-buttons>
        </v-card-actions>

        <pre v-if="$App.debug">{{ $data }}</pre>

    </v-card>
    
    </v-form>

</template>

<script>

import Appform from '@mixins/Appform';
export default {
    mixins: [Appform],

    created()
    {
        this.mapForm()
    },

    watch: 
    {
        action()
        {
            this.mapForm()
        }
    },

     props:
    {
        origen: {
            type:       String,
            default:    null
        },

        origenId: {
            type:       Number,
            default:    0
        },

        tipoArchivo: {
            type:       Number,
            default:    0
        },

        file: {
            type:       String,
            default:    null
        },

        fileName: {
            type:       String,
            default:    null
        },

        fileType: {
            type:       Object,
            default:    () => {}
        },
    },
    data() {
        return {
            resource: 'archivo',
            form:
            {
                id: 	          null,
				nb_archivo: 	  null,
				id_tipo_archivo:  null,
				tx_origen_id: 	  null,
                tx_path: 	      null,
                tx_mimetype:      null,
				tx_observaciones: null,
				id_status: 	      null,
                id_usuario: 	  null,
                tx_file_source:   null
            },
        }
    },

    methods: 
    {

        cancel()
        {
            this.$emit('closeModal');
        },

        setDataForm(action)
        {
            console.log(this.action)
            if(this.action == 'upd')
            {
                this.form.nb_archivo = this.item.nb_archivo
                this.form.tx_observaciones = this.item.tx_observaciones
            }
            else if(this.action == 'ins')
            {
                this.form.nb_archivo = null
                this.form.tx_observaciones = null
                this.form.tx_file_source = this.file

                if(this.$refs.form) this.$refs.form.resetValidation()
                
            }
        },

        mapForm()
        {
            
            this.form.tx_origen_id    = this.origenId
            this.form.id_tipo_archivo = this.tipoArchivo
            
            this.form.tx_path         = this.fileName
            this.form.tx_file_source  = this.file
            this.form.id_status       = 1
            
            if( this.fileType)
            {
                this.form.tx_mimetype     = this.fileType.name
            }

            
        }
    }

}
</script>

<style>

</style>
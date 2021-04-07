<template>

    <v-form ref="form" v-model="valid" lazy-validation>

    <v-card :loading="loading" flat>

        <v-card-title class=" elevation-1 deep-purple">
            <v-row dense>
                <v-col cols="auto">
                    <v-icon color="white" class="" size="34">mdi-notebook</v-icon>
                </v-col>
                <v-col class="white--text title">Crear/Editar Tarea</v-col>
                <v-spacer></v-spacer>
                <v-col cols="auto">
                    <v-btn icon dark><v-icon @click="$emit('closeDialog')">mdi-close-circle-outline</v-icon></v-btn>
                </v-col> 
            </v-row>
        </v-card-title>

        <v-card-text>

        <v-row>
            
            <v-col cols="9">

            <v-row class="mt-3 mx-2" no-gutters>
                    
            <v-col cols="12">
                <v-text-field
                    :rules="[rules.required]"
                    v-model="form.nb_tarea"
                    label="Tarea"
                    dense
                    filled
                    rounded
                ></v-text-field>
            </v-col>

            <v-col cols="9">
                <v-select
                :items="selects.tipoTarea"
                item-text="nb_tipo_tarea"
                item-value="id"
                v-model="form.id_tipo_tarea"
                :rules="[rules.select]"
                label="Tipo Tarea"
                :loading="loading"
                dense
                filled
                rounded
                ></v-select>
            </v-col>

            <v-col cols="3" class="px-2">
                <v-text-field
                    :rules="[rules.required]"
                    v-model="form.nu_peso"
                    label="Peso"
                    placeholder="0"
                    type="number"
                    dense
                    filled
                    rounded
                ></v-text-field>
            </v-col>
                    
                    
            <v-col cols="12">
                <v-textarea
                    :rules="[rules.required]"
                    v-model="form.tx_descripcion"
                    label="Descripcion"
                    placeholder="Indique Descripcion de la tarea"
                    dense
                    filled
                    rounded
                    rows="2"
                ></v-textarea>
            </v-col>
                            
                    
            <v-col cols="12">
                <v-textarea
                    :rules="[rules.max(200)]"
                    v-model="form.tx_observaciones"
                    label="Observaciones"
                    placeholder="Indique Observaciones Adicionales"
                    dense
                    filled
                    rounded
                    rows="2"
                ></v-textarea>
            </v-col>

            </v-row>

            </v-col>

            <v-col cols="3" >

                <v-sheet color="grey lighten-3" class="text-center rounded-xl mt-2">
                
                <v-subheader>Agregar Archivos</v-subheader>

                <v-col class="text-center">
                    <v-badge color="red" overlap bordered :value="archivos.length > 0" :content="archivos.length" >
                        <v-btn fab class="my-1 mx-auto" dark color="deep-purple" large @click="addFile(item)" :loading="loading">
                            <v-icon size="38">mdi-paperclip</v-icon> 
                        </v-btn>
                    </v-badge>
                </v-col>

                </v-sheet>

            </v-col>

        </v-row>

        </v-card-text>

        <v-card-actions>
            <v-spacer></v-spacer>
            <form-buttons
                @update="update()"
                @cancel="$emit('closeDialog', false)"
                :action="action"
                :valid="valid"
                :loading="loading"
            ></form-buttons>
        </v-card-actions>

        <v-dialog
            v-model="dialog"
            max-width="500px"
            content-class="rounded-xl"
        >
            <archivo-upload 
                origen="tarea"
                :origenId="item.id"
                :tipoArchivo="11"
                :maxItems="2"
                @closeModal="closeDialog()"
                @onUpdateFiles="onCreateForm()"
            ></archivo-upload>
        </v-dialog>

        <pre v-if="$App.debug">{{ $data }}</pre>

    </v-card>
    
    </v-form>

</template>

<script>

import Appform from '@mixins/Appform';
import ArchivoUpload from '@pages/archivo/archivoUpload';


export default {

    mixins: [Appform],

     components: 
    {
        'archivo-upload': ArchivoUpload
    },

    data() {
        return {
            resource: 'tarea',
            dialog: false,
            form:
            {
                id: 	          null,
				nb_tarea: 	      null,
				tx_descripcion:   null,
				id_tipo_tarea: 	  null,
				id_grado: 	      null,
				id_materia: 	  null,
				id_tema: 	      null,
				nu_peso: 	      null,
				tx_observaciones: null,
				id_status: 	      null,
				id_usuario: 	  null,
            },
            selects:
            {
                tipoTarea: 	 [],
            },
            archivos: []
            
        }
    },

    methods:
    {
        onCreateForm()
        {
            this.getResource(`archivo/tipoArchivo/11/origen/${this.item.id}`).then( data => {
                this.archivos = data
            })
        },
        
        postResponse()
        {
            this.$emit('closeDialog', true)
        },

        addFile(item)
        {
            this.dialog = true
        },

        closeDialog()
        {
            this.dialog = false
        }
    }
}
</script>

<style>
</style>
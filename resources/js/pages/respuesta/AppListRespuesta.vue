<template>

    <v-card class="grey lighten-5 rounded-b-xl" flat>

    <v-row justify="center" align="center">


        <v-col class="text-center" v-if="pregunta.id_tipo_pregunta != 1">

            <v-menu content-class="rounded-xl mx-auto" class="mx-auto" offset-x :close-on-content-click="false" v-model="menu" >

                <template v-slot:activator="{ on }">
                    <v-btn fab color="primary" v-on="on" :loading="loading">
                        <v-icon size="30">mdi-plus</v-icon>
                    </v-btn>
                </template>
                
                <v-card width="500px" class="rouded-xl">
                <v-card-text>
                <v-form ref="form" v-model="valid" lazy-validation>
                <v-row dense>
                    
                    <v-col cols="8">
                         <v-text-field
                            :rules="[rules.required]"
                            v-model="form.nb_respuesta"
                            label="Respuesta"
                            dense
                            filled
                            rounded
                            single-line
                            hide-details=""
                        ></v-text-field>
                    </v-col> 
                    <v-col cols="2" class="text-center">
                         <v-switch 
                            v-model="form.bo_correcta"
                            inset 
                            hide-details
                            :loading="loading" 
                            :true-value="1"
                            :false-value="0"
                            :input-value="form.bo_correcta"
                            class="pa-0 mt-2"
                            color="green">
                        </v-switch>
                    </v-col> 
                    <v-col cols="auto">
                        <v-btn icon>
                            <v-icon size="34" color="green" @click.stop="save()">mdi-plus-circle</v-icon>
                        </v-btn>
                    </v-col> 
                    
                </v-row>
                </v-form>
                </v-card-text>
                </v-card>
                 
            </v-menu>

        </v-col>

        <v-col cols="8">

             <v-list dense class="rounded-xl" v-if="pregunta.id_tipo_pregunta != 1">

             <v-list-item color="blue" v-for="respuesta in respuestas" :key="respuesta.id">

                <v-list-item-avatar color="grey lighten-5">
                    <v-icon 
                    size="35"
                    :color="(respuesta.bo_correcta) ? 'success': 'red'">
                    {{ (respuesta.bo_correcta) ? 'mdi-checkbox-marked-circle-outline': 'mdi-close-circle-outline' }}
                    </v-icon>
                </v-list-item-avatar>

                <v-list-item-content>
                    <v-list-item-title> 
                        
                        <v-edit-dialog
                            :return-value.sync="item.nb_respuesta"
                            large
                            cancel-text="Cancelar"
                            save-text="Guardar"
                            @save="updateNombre(respuesta)"
                            class="rounded-xl"
                        >
                           
                                {{respuesta.nb_respuesta}}
                        
                            <template v-slot:input>
                                <v-text-field
                                    v-model="respuesta.nb_respuesta"
                                    :rules="[rules.max(80)]"
                                    label="Tema"
                                    single-line
                                    counter
                                    autofocus
                                ></v-text-field>
                            </template>
                        </v-edit-dialog>                       
                        
                        </v-list-item-title>
                </v-list-item-content>

                <v-list-item-action>
                    <v-switch 
                        color="success"
                        class="mx-0"
                        inset 
                        dense
                        hide-details
                        :loading="loading" 
                        :true-value="1"
                        :false-value="0"
                        :input-value="respuesta.bo_correcta"
                        @change="updateCorrecta($event, respuesta)"
                        >
                    </v-switch>
                </v-list-item-action>
                <v-list-item-action>
                    <v-btn icon x-small>
                        <v-icon size="20" color="red lighten-1" @click.stop="deleteRespuesta(respuesta)">mdi-delete</v-icon>
                    </v-btn>
                </v-list-item-action>

            </v-list-item>

            </v-list>

            <div v-else class="mx-auto">
                <v-alert type="warning" :value="true" prominent outlined border="left" class="ml-3 white rounded-xl">
                     Pregunta de tipo desarrollo.
                </v-alert>
            </div>

        </v-col>

        <v-col>

        </v-col>

    </v-row>

    </v-card>

</template>

<script>
import DataHelper   from '@mixins/AppData';
import AppRespuestaForm  from './AppRespuestaForm';
export default {

    mixins:     [ DataHelper],

    components: { 
        'respuesta-form': AppRespuestaForm 
    },

    props:
    {
        pregunta:{
            type:    Object,
            default: () => {} 
        }
    },

    created()
    {
        this.list()
    },

     watch:
    {
        pregunta()
        {
            this.respuestas = []
            this.list()
        }
    },

    data () {
        return {
            respuestas: [],
            menu:       false,
            form: {
                id:                    null,
				nb_respuesta: 	       null,
                id_pregunta: null,
                bo_correcta:           0,
				id_status: 	           1,
				id_usuario: 	       null,
            },
            item: {
                nb_respuesta: 	       null,
                bo_correcta:           0,
                id_ususrio:            null
            },
            validateForm: false,
        }
    },

    methods:
    {
        list()
        {
           this.getResource(`respuesta/pregunta/${this.pregunta.id}`).then( data => this.respuestas = data)
        },

        save()
        {            
            if(!this.form.nb_respuesta)
            {
                this.showError('Favor indicar Respuesta')
                return
            }

            this.form.id_pregunta  = this.pregunta.id
            this.storeResource('respuesta', this.form).then( data => {
                this.showMessage(data.msj)
                this.menu = false
                this.clearForm()
                this.respuestas = data.respuestas
            })
        },

        deleteRespuesta(respuesta)
        {
            this.deleteResource(`respuesta/${respuesta.id}`).then( data =>{
                this.showMessage(data.msj)
                this.list()
            })
        },

        updateNombre(respuesta)
        {
            this.updateResource(`respuesta/${respuesta.id}/nombre`, respuesta ).then( data =>{
                this.respuestas = data.respuestas
            })
        },

        updateCorrecta(bo_correcta, respuesta)
        {
           let form = { bo_correcta, id_pregunta:  respuesta.id_pregunta, id_usuario: this.idUser }
           this.updateResource(`respuesta/${respuesta.id}/correcta`,  form).then( data =>{
                this.respuestas = data.respuestas
            }) 
        },

        clearForm()
        {
            this.form.nb_respuesta = null
            this.form.bo_correcta  = false
        }
    }
}
</script>


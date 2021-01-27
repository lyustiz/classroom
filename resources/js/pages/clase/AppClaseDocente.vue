<template>

 <v-card min-height="100%" flat color="grey lighten-4">


     <v-card-text>

        <v-row>

            <v-col cols="12" md="6">

                <v-row dense>

                    <v-card width="100%" flat class="rounded-xl">

                    <v-container class="deep-purple white--text py-0 mb-5">
                        <v-row no-gutters>
                            <v-col class="my-2">
                                <v-row no-gutters>
                                    <v-col class="text-center text-uppercase"> {{ monthNameFromDate(today) }} {{ yearFromDate(today) }}</v-col>
                                </v-row>
                                <v-row no-gutters>
                                    <v-col class="text-center display-2 font-weight-light"> {{ dayFromDate(today) }}</v-col>
                                </v-row>
                            </v-col>
                            <v-col>
                                <v-row  align="center">
                                    <v-col class="text-center">
                                        <v-icon size="64" color="amber">mdi-google-classroom</v-icon>
                                    </v-col>
                                </v-row>
                            </v-col>
                        </v-row>
                    </v-container>

                    <v-card-text class="py-0">
                    <v-form ref="form" v-model="valid" lazy-validation>

                    <v-row no-gutters>
                        
                    <v-col cols="12">
                        <v-select
                            :items="grados"
                            v-model="grado"
                            item-text="nb_grado"
                            item-value="id"
                            label="Grado"
                            :loading="loading"
                            :rules="[rules.select]"
                            dense
                            filled
                            rounded
                            @change="getGrupos($event)"
                            return-object
                            clearable
                        ></v-select>
                    </v-col>

                    <v-col cols="12">
                        <v-select
                            :items="grupos"
                            v-model="grupo"
                            item-text="nb_grupo"
                            item-value="id"
                            label="Grupo"
                            :loading="loading"
                            :rules="[rules.select]"
                            dense
                            filled
                            rounded
                            @change="getMaterias($event)"
                            return-object
                            clearable
                        ></v-select>
                    </v-col>

                    <v-col cols="12">
                        <v-select
                            :items="materias"
                            v-model="materia"
                            item-text="nb_materia"
                            item-value="id"
                            label="Materia"
                            persistent-hint
                            :loading="loading"
                            :rules="[rules.select]"
                            dense
                            filled
                            rounded
                            return-object
                            clearable
                        ></v-select>
                    </v-col>
                    </v-row>

                    </v-form>
                    </v-card-text>

                    <v-card-actions>

                        <v-row>

                        <v-col cols="12" class="px-6">
                            <v-btn block color="success" @click="startClase()" >
                                <v-icon class="mx-1">mdi-flag-checkered</v-icon>Iniciar Clase
                            </v-btn>
                        </v-col>

                         <v-col cols="12">
                           <v-tooltip bottom color="red">
                                <template v-slot:activator="{ on }">
                                    <v-btn v-on="on" fab dark color="red" :loading="loading" link href="https://meet.google.com/" target="_blank">
                                        <v-icon :size="30">mdi-google</v-icon>
                                    </v-btn>
                                </template>
                                <span >Google Meet</span> 
                            </v-tooltip>

                            <v-tooltip bottom color="#0e71eb">
                                <template v-slot:activator="{ on }">
                                    <v-btn v-on="on" fab dark color="#0e71eb" :loading="loading" link href=" https://zoom.us/join" target="_blank">
                                        <v-icon :size="30">mdi-video</v-icon>
                                    </v-btn>
                                </template>
                                <span >Zoom</span>
                            </v-tooltip>

                            <v-tooltip bottom color="amber">
                                <template v-slot:activator="{ on }" >
                                    <v-btn v-on="on" fab dark color="amber" :loading="loading" @click="navegateTo('meet-docente')">
                                        <v-icon :size="30">mdi-video-check-outline</v-icon>
                                    </v-btn>
                                </template>
                                <span >Virtualin</span>
                            </v-tooltip>

                            <v-dialog v-model="dialogGoogleMeet" fullscreen scrollable>
                                <visor-google-meet v-if="dialogGoogleMeet" @closeDialog="closeDialog('dialogGoogleMeet')" ></visor-google-meet>
                            </v-dialog>


                        </v-col>

                        </v-row>
                        
                    </v-card-actions>

                </v-card>

            </v-row>


            </v-col>

            <v-col cols="12" md="6">

                <v-card width="100%" flat  class="rounded-xl" height="100%">

                    <v-card-title class="deep-purple white--text py-0 mb-5">
                        <v-row >
                            <v-col>
                                <v-row align="center">
                                    <v-col class="headline text-center">
                                       Asistencia
                                    </v-col>
                                </v-row>
                            </v-col>
                            <v-col>
                                <v-row no-gutters  align="center">
                                    <v-col class="text-center">
                                        <span class="display-1">{{alumnosSelected.length}}</span> / <span class="headline">{{alumnos.length}}</span>
                                    </v-col>
                                    <v-col class="text-center">
                                        <v-icon size="60" color="amber">mdi-school</v-icon>
                                    </v-col>
                                </v-row>
                            </v-col>
                        </v-row>
                    </v-card-title>

                    <v-card-text class="py-0">

                         <v-list subheader dense width="100%" class="alumno-selector  rounded-b-lg py-n2" v-if="clase" > 
                            <v-list-item-group v-model="alumnosSelected" multiple color="info darken-3" >
                            <v-list-item v-for="(alumno, idx) in alumnos" :key="idx" :value="alumno.id" color="success" >
                                <template v-slot:default="{ active }" >
                                    <v-list-item-avatar size="50" class="my-1">
                                       <v-img :src="alumno.foto.full_url" v-if="alumno.foto"></v-img>
                                       <v-icon color="white" v-else size="28" v-text="(active) ? 'mdi-account-check': 'mdi-account'">
                                        </v-icon>
                                    </v-list-item-avatar>
                                    <v-list-item-content>
                                        <v-list-item-title v-text="alumno.nb_alumno"></v-list-item-title>
                                        <v-list-item-subtitle v-text="alumno.tx_documento"></v-list-item-subtitle>
                                    </v-list-item-content>
                                    <v-list-item-action>
                                    <v-checkbox :input-value="active" :disabled="loading" ></v-checkbox>
                                    </v-list-item-action>
                                </template>
                            </v-list-item>
                            </v-list-item-group>
                        </v-list>

                        <v-overlay absolute :opacity="0.3" :value="!clase" class="rounded-xl">
                            <span class="headline">Inicie clase para confirmar asitencia</span>
                        </v-overlay>

                    </v-card-text>

                    <v-card-actions>
                        <v-btn block color="success" @click="setAsistencia()" v-if="clase">
                            <v-icon class="mx-1">mdi-playlist-check</v-icon> Confirmar Asistencia
                        </v-btn>
                    </v-card-actions>
                </v-card>

            </v-col>

        </v-row>

         
     </v-card-text>


 </v-card>

</template>

<script>
import AppData from '@mixins/AppData';
import claseForm  from './claseForm';
export default {

    mixins:     [ AppData ],

    components: { 
        'clase-form': claseForm 
    },

    created(){
        this.list();
    },

    computed:
    {
        docente()
        {
            return this.$store.getters['getDocente']
        }
    },
    data () 
    {
        return{
            today:  new Date().toISOString().substr(0, 10),
            grados:   [],
            grupos:   [],
            materias: [],
            alumnos:  [],
            grado:    null,
            grupo:    null,
            materia:  null,
            alumnosSelected:   [],
            clase:  null,

            //
            dialogGoogleMeet: false,

            //
            form: null
            
        }
    },
    methods:
    {
        list()
        {
            this.grupos   = []
            this.materias = []
            this.alumnos  = []
            this.getResource(`grado/grupo/materia/alumno/docente/${this.docente.id}`).then( data =>{
                this.grados = data
            })
        },

        getGrupos(grado)
        {
            this.grupos   = grado.grupo
            this.materia  = null
        },

        getMaterias(grupo)
        {           
            this.materias  = grupo.materia
            this.alumnos   = grupo.alumno
        },

        activaClase()
        {
            this.isActive = true
        },

        closeDialog(dialog)
        {
            this[dialog] = false
        },

        startClase()
        {
            console.log(this.$refs.form.validate())
            if(!this.$refs.form.validate()){ return }
            
            this.form = {
                            id_grado: 	      this.grado.id,
                            id_grupo: 	      this.grupo.id,
                            id_materia: 	  this.materia.id,
                            id_docente: 	  this.docente.id,
                            fe_clase: 	      this.today,
                            fe_completada: 	  null,
                            tx_observaciones: null,
                            id_status: 	      1,
                            id_usuario: 	  this.idUser
                        };
            
            this.storeResource('clase', this.form).then( data => {
                this.showMessage(data.msj)
                this.clase     = data.clase
            });
        },

        setAsistencia()
        {
             this.form = {
                            id_clase:      this.clase.id,
                            id_alumnos:    this.getIdAlumnos(),
                            bo_asistencia: this.alumnosSelected,
                            id_status: 	   1,
                            id_usuario:    this.idUser,
                        };
            
            this.storeResource(`asistencia`, this.form).then( data => {
                this.showMessage(data.msj)
                this.asistencia     = data.asistencia
            });
        },

        getIdAlumnos()
        {
            let idAlumnos = []
            for (const alumno of this.alumnos) {
                idAlumnos.push( alumno.id )
            }
            return idAlumnos
        }

        

      

    }
}
</script>

<style>
</style>
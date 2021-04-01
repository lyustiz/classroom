<template>
  <v-card :loading="loading">
      <v-card-title class="pa-0">
      <v-toolbar color="teal" dense dark flat>
            <v-row>
                <v-col cols="auto">
                    <v-icon size="30">mdi-certificate</v-icon>
                </v-col>
                <v-col class="text-left">Certificado</v-col>
                <v-spacer></v-spacer>
                <v-col cols="auto" class="title">
                  <v-btn icon small dark @click="$emit('closeDialog')"><v-icon>mdi-close-circle-outline</v-icon></v-btn>
                </v-col>
            </v-row>
        </v-toolbar>
        </v-card-title>
        <v-card-text>

        <v-row>

            <v-col>
                <v-form ref="form" v-model="valid" lazy-validation>

                <v-row class="mt-2">
          
                <v-col cols="12">
                    <v-text-field
                        :rules="[rules.required]"
                        v-model="form.tx_linea1"
                        label="Linea1"
                        placeholder="Indique Linea1"
                        dense
                    ></v-text-field>
                </v-col>
                        
                <v-col cols="12">
                    <v-text-field
                        :rules="[rules.required]"
                        v-model="form.tx_linea2"
                        label="Linea2"
                        placeholder="Indique Linea2"
                        dense
                    ></v-text-field>
                </v-col>
                        
                <v-col cols="12">
                    <v-text-field
                        :rules="[rules.required]"
                        v-model="form.tx_linea3"
                        label="Linea3"
                        placeholder="Indique Linea3"
                        dense
                    ></v-text-field>
                </v-col>
                        
                <v-col cols="12" >
                    <v-text-field
                        :rules="[rules.max(80)]"
                        v-model="form.tx_observaciones"
                        label="Observaciones"
                        placeholder="Indique Observaciones"
                        dense
                    ></v-text-field>
                </v-col>

                <v-col  >
                    
                </v-col>

                <v-col cols="auto" > 
                    <v-btn fab small color="success" @click="save()" :loading="loading"><v-icon>mdi-plus</v-icon></v-btn>   
                </v-col>

                </v-row>
                </v-form>

            </v-col>

            <v-col>

                <v-toolbar color="grey lighten-4 subtitle-2 rounded-t-lg" flat dense>
                    <v-icon color="orange" class="mr-1">mdi-account-plus</v-icon>
                    <div class="indigo--text">Activar Certificado</div> 
                    <v-spacer></v-spacer>
                </v-toolbar>
                <v-list subheader dense width="100%" class="alumno-selector  rounded-b-lg py-n1" color="grey lighten-5" v-if="form.id"> 
                    <v-list-item-group v-model="form.alumnos" multiple color="info darken-3" >
                    <v-list-item v-for="(alumno, idx) in alumnos" :key="idx" :value="alumno.id">
                        <template v-slot:default="{  }" >
                            <v-list-item-avatar>
                                <v-icon color="indigo" size="36">mdi-school</v-icon>
                            </v-list-item-avatar>
                            <v-list-item-content>
                                <v-list-item-title v-text="alumno.nb_alumno"></v-list-item-title>
                                <v-list-item-subtitle v-text="alumno.tx_documento"></v-list-item-subtitle>
                            </v-list-item-content>
                            <v-list-item-action>
                             <status-switch 
                                :loading="loading" 
                                resource="certificadoAlumno" 
                                :item="getCertificado(alumno.id)" 
                                @onChangeStatus="changeStatus($event)">
                            </status-switch>
                            </v-list-item-action>
                        </template>
                    </v-list-item>
                    </v-list-item-group>
                </v-list>

            </v-col>


        </v-row>

       




        

        </v-card-text>
  </v-card>
</template>

<script>

import AppData from '@mixins/AppData';

export default {

    mixins: [AppData],

    created()
    {
        this.list()
    },

    props: {
        materia:{
            type: Object,
            default: () => null
        },

        grupo:{
            type: Object,
            default: () => null
        },

        alumnos:{
            type: Object,
            default: () => null
        },

    },

    computed:
    {
        isSelectAll:
        {
            get() {
                return Object.keys(this.alumnos).length == this.form
            },

            set(isAll) {
                this.selectAll(!isAll)
            }
        },

    },


    data() {
        return {
            resource: 'certificado',
            form:
            {
                id: 	          null,
				id_grupo: 	      null,
				id_materia: 	  null,
				tx_linea1: 	      null,
				tx_linea2: 	      null,
				tx_linea3: 	      null,
				tx_observaciones: null,
				id_status: 	      null,
				id_usuario: 	  null,
            },
            selects:
            {
	 	 	 	status: 	 [],
            },
            certificadosAlumnos: []
        }
    },

    methods:
    {
       list()
       {
           this.getResource(`certificado/grupo/${this.grupo.id}/materia/${this.materia.id}`).then( data =>{
               this.mapData(data)
               this.certificadosAlumnos = data.certificado_alumno
           })
       },

       selectAll(isSelectAll)
        {
            this.form.alumnos = []
            if(!isSelectAll) {
                for (const alumno in this.alumnos) {
                    this.form.alumnos.push(this.alumnos[alumno].id)
                }
            }
        },

        save()
        {
            if (!this.$refs.form.validate())  return 
            this.form.id_grupo   = this.grupo.id
            this.form.id_materia = this.materia.id
            this.form.id_status  = 1
            
            if(this.form.id)
            {
                this.update(this.form.id)
            } else {
                this.store()
            }
        },

        store()
        {
            this.storeResource(`certificado`, this.form).then( data =>{
                this.showMessage(data.msj)
                console.log(data)
                this.certificadosAlumnos = data.certificadosAlumnos
                this.mapData(data.certificado)
                
           })
        },

        update(idCertificado)
        {
            this.updateResource(`certificado/${idCertificado}`, this.form).then( data =>{
                this.showMessage(data.msj)
               console.log(data)
           })
        },

        isActive(alumnoId) {
            let certificado = this.certificadosAlumnos.find( item => item.id_alumno = alumnoId)
            return (certificado) ? certificado.id_status == 1 : false;
        },

        getCertificado(alumnoId) {
           return this.certificadosAlumnos.find( item => item.id_alumno = alumnoId)
        }
    }
}
</script>

<style>

</style>
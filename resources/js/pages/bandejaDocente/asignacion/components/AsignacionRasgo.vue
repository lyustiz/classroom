<template>

    <v-form ref="form" v-model="valid" lazy-validation>

    <v-card :loading="loading" flat >

        <v-card-title class="deep-purple white--text pa-0">
             <v-row no-gutters>
                <v-col cols="auto">
                    <v-icon size="32" color="pink" class="ml-3 mt-3">mdi-human-male-height-variant</v-icon>
                </v-col>
                <v-col>
                    <v-col>Rasgos</v-col>
                </v-col>
                <v-col cols="auto" class="mt-3 mr-2">
                   <v-btn icon dark><v-icon @click="$emit('closeDialog')">mdi-close-circle-outline</v-icon></v-btn>
                </v-col>
            </v-row>
        </v-card-title>

        <v-card-text>

        <v-row dense> 
                 
        <v-col cols="12">
             <v-select
                ref="selecRasgos"
                :items="rasgos"
                item-text="nb_rasgo"
                item-value="id"
                v-model="form.id_origen"
                label="Rasgo"
                :loading="loading"
                :readonly="loading"
                dense
                rounded
                filled
                @change="confirmar($event)"
                hide-details=""
            ></v-select>
        </v-col>

    
        <v-col class="mx-2 pa-2 rounded-lg grey lighten-4 ">
            <v-list dense class="selector-container rounded-lg pa-0">
                    <v-list-item v-for="(asignado, i) in asignados" :key="i" :value="asignado.id" >
                        <v-list-item-avatar color="white">
                            <v-icon :color="asignado.tx_color" v-text="asignado.tx_icono"></v-icon>
                        </v-list-item-avatar>
                        <v-list-item-content>
                            <v-list-item-title>{{asignado.nb_rasgo}}</v-list-item-title>
                        </v-list-item-content>
                        <v-list-item-action>
                            <v-btn fab dark x-small color="error" :loading="loading" @click="confirmarDelete(asignado)">
                                <v-icon>delete</v-icon> 
                            </v-btn>   
                        </v-list-item-action>
                    </v-list-item>
            </v-list>
        </v-col>
                          
        </v-row>

        <app-confirm 
            :confirm="confirm" 
            titulo="Asignar Rasgo" 
            :mensaje="msjConfirm" 
            @closeConfirm="store($event)">
        </app-confirm>

        <app-confirm 
            :confirm="confirmDelete" 
            titulo="Eliminar Rasgo" 
            :mensaje="msjConfirm" 
            @closeConfirm="deleteRasgo($event)">
        </app-confirm>


        </v-card-text>

        <pre v-if="$App.debug">{{ $data }}</pre>


    </v-card>
    
    </v-form>

</template>

<script>

import AppData   from '@mixins/AppData';

export default {

    mixins:     [ AppData ],

    props: {

        grupo: {
            type: Object,
            default: () => {}
        },

        materia: {
            type: Object,
            default: () => {}
        },
    },
    
    computed:
    {
        docente()
        {
            return this.$store.getters['getDocente'];
        },
    },

    created()
    {
      console.log(this.docente,this.materia, this.grupo);
      
       this.form.id_grupo           = this.grupo.id
       this.form.id_tipo_evaluacion = 8
       this.form.tx_origen          = 'rasgo'
       this.form.fe_inicio          = this.date
       this.form.fe_fin             = this.date
       this.form.id_status          = 1
       this.form.hh_inicio          = '00:00'
       this.form.hh_fin             = '00:00'
       this.form.id_docente         = this.docente.id
       this.form.id_materia         = this.materia.id
       this.form.id_tema            = 0
       this.form.alumnos            = [0]
       this.list()
    },

    data() {
        return {
            date:          new Date().toISOString().substr(0, 10),
            rasgos:        [],
            rasgo:         null,
            asignados:     [],
            confirm:       false,
            confirmDelete: false,
            msjConfirm:    null,
            form:{
                id:                 null,
                fe_inicio:          false,
                fe_fin:             false,
                hh_inicio:          false,
                hh_fin:             false,
                nu_minutos:         0,
                id_docente:         null,
                alumnos:            [],
                id_grupo: 	        null,
                id_tipo_evaluacion: null,
                id_materia: 	    null,
                id_tema: 	        null,
				id_origen: 	        null,
				tx_origen: 	        null,
				tx_observaciones: 	null,
				id_status: 	        null,
                id_usuario: 	    null,
            },
        }
    },

    methods:
    {
        list()
        {
            this.getResource( `rasgo/grupo/${this.grupo.id}/materia/${this.materia.id}/asignacion`).then( (data) => 
            {  
               this.rasgos    = data.rasgo        
               this.asignados = data.asignado         
            })
        },

        confirmar(idRasgo)
        {
            let rasgo = this.rasgos.find(rasgo => rasgo.id == idRasgo)
            this.msjConfirm = `Desea agregar ${rasgo.nb_rasgo} al grupo ${this.grupo.nb_grupo}?`
            this.confirm = true
        },

        store(confirm)
        {
            this.confirm = false

            if(!confirm)
            {
                this.form.id_origen = null;
                return
            } 

            this.storeResource('evaluacion', this.form).then( data => {
                this.showMessage(data.msj)
                this.$emit('updateData', true)
                this.list()
            }) 
        },

        confirmarDelete(rasgo)
        {
            this.rasgo         = rasgo 
            this.msjConfirm    = `Desea eliminar ${rasgo.nb_rasgo}?`
            this.confirmDelete = true
        },

        deleteRasgo(confirm)
        {   
            this.confirmDelete = false
            
            if(!confirm)
            {
                this.rasgo = null;
                return
            } 

            let evaluacion = this.rasgo.evaluacion[0]

            this.deleteResource(`evaluacion/${evaluacion.id}`).then( data => {
                this.showMessage(data.msj)
                this.$emit('updateData', true)
                this.list()
            }) 
        },

        closeDialog(dialog, refresh)
        {
            this[dialog] = false

            if(refresh){
                this.getItems()
            }
        }

    }
}
    

</script>

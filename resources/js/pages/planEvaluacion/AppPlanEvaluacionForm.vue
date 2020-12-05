<template>

    <v-menu v-model="menu" transition="slide-x-transition" min-width="300" max-width="300" :close-on-content-click="false" content-class="rounded-xl" >
        
        <template v-slot:activator="{ on }" @click="menu==true">
        
            <template v-if="action == 'upd'">

                <v-btn fab x-small color="indigo" dark v-on="on" :loading="isLoading">
                    <v-icon>mdi-account-tie</v-icon> 
                </v-btn>

            </template>
            
            <template v-else-if="action == 'ins'">

                <v-btn fab x-small color="red" dark v-on="on" :loading="isLoading">
                    <v-icon>mdi-account-off</v-icon> 
                </v-btn>

            </template>
            
        </template>

        <v-card class="rounded-xl">

            <app-simple-toolbar title="Asignar Docente" @closeModal="menu=false" dense></app-simple-toolbar>

            <v-card-text>

            <v-row>
                <v-col>

                    <v-select
                        :items="docentes"
                        v-model="form.id_docente"
                        item-text="nb_docente"
                        item-value="id"
                        label="Seleccione Docente"
                        :loading="isLoading"
                        dense
                        @change="savePlanEvaluacion($event)"
                    ></v-select>

                </v-col>
            </v-row>

            </v-card-text>

        </v-card>
                                                    
    </v-menu>
    
</template>

<script>

import DataHelper from '@mixins/AppData';

export default {

    mixins: [ DataHelper ],

    props:
    {
        planEvaluacion: 
        {
            type:       Object,
            default:    () => []
        },
        
        docentes: {
            type:       Array,
            default:    () => []
        },

        periodo: {
            type:       Number,
            default:    null
        },

        grupo: {
            type:       Number,
            default:    null
        },

        materia: {
            type:       Number,
            default:    null
        },

        action: {
            type:       String,
            default:    null
        },

        isLoading:{
            type:       Boolean,
            default:    false
        }, 
    },

    created()
    {
        if(this.planEvaluacion)
        {
            this.form.id_docente = this.planEvaluacion.id_docente
        }

    },

    data() {
        return {
            resource: 'planEvaluacion',
            menu: false,
            form:
            {
                id: 	             null,
				id_grupo: 	         null,
                id_periodo: 	     null,
                id_materia: 	     null,
                id_docente: 	     null,
				tx_observaciones: 	 null,
				id_status: 	         null,
				id_usuario: 	     null,
            },
        }
    },

    methods:
    {
        savePlanEvaluacion(docente)
        {
            this.validateForm = false
            
            if(this.action == 'ins') this.storePlanEvaluacion(docente)

            if(this.action == 'upd') this.updatePlanEvaluacion(docente)
        },        
        
        storePlanEvaluacion(docente)
        {
           
            this.form.id_grupo   = this.grupo
            this.form.id_periodo = this.periodo
            this.form.id_materia = this.materia
            this.form.id_docente = docente
            this.form.id_status  = 2

            this.$emit('onLoad')

            this.storeResource( `planEvaluacion`, this.form ).then( (data) => 
            {
                this.menu = false
                this.showMessage(data.msj)
                this.$emit('onStore')
            })
        },

        updatePlanEvaluacion(docente)
        {
           
            this.form.id         = this.planEvaluacion.id
            this.form.id_grupo   = this.grupo
            this.form.id_periodo = this.periodo
            this.form.id_materia = this.materia
            this.form.id_docente = docente
            this.form.id_status  = this.planEvaluacion.id_status

            this.$emit('onLoad')

            this.updateResource( `planEvaluacion/${this.planEvaluacion.id}`, this.form ).then( (data) => 
            {
                this.menu = false
                this.showMessage(data.msj)
                this.$emit('onUpdate')
            })
        },
    }
}
</script>

<style>
</style>
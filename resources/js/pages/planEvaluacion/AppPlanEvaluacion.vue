<template>
<v-container >
    
<v-row justify="center">

    <v-card width="100%" class="rounded-xl">
        
        <v-card-text>

        <v-col cols="12" md="6">
                <v-select
                :items="periodos"
                item-text="nb_periodo"
                item-value="id"
                v-model="periodo"
                label="Seleccione Periodo"
                :loading="loading"
                dense
                rounded
                filled
                ></v-select>
        </v-col>

        <v-alert type="warning" :value="true" v-if="!periodo" prominent>
            Seleccione un Período
        </v-alert>

        <v-list rounded v-else>

        <v-list-group prepend-icon="mdi-numeric" v-for="grado in grados" :key="grado.id" color="green" class="grey lighten-4 rounded-xl mb-2" ripple>

            <template v-slot:activator>
                <v-list-item-title v-text="grado.nb_grado"></v-list-item-title>
            </template>

            <v-list-item v-show="grado.grupo.length < 1">
                <v-list-item-content>
                    <v-list-item-title class="ml-5 red--text">
                        <v-icon color="red" class="mr-3">mdi-block-helper</v-icon>
                        No se asignaron Grupos
                    </v-list-item-title>
                </v-list-item-content>
                <v-list-item-action>
                    <v-tooltip top>
                        <template v-slot:activator="{ on }">
                            <v-btn v-on="on" fab x-small @click="navegateTo('grupo')" color="success">
                                <v-icon>mdi-alphabetical-variant</v-icon>
                            </v-btn>
                        </template>
                        <span>Cargar Grupos</span>
                    </v-tooltip>
                </v-list-item-action>
            </v-list-item>

            <v-list-group  sub-group v-for="grupo in grado.grupo" :key="grupo.id" color="amber" class="amber lighten-5 rounded-xl mb-2">
                
                <template v-slot:activator >
                    <v-list-item-icon><v-icon>mdi-alphabetical-variant</v-icon></v-list-item-icon>
                    <v-list-item-title v-text="grupo.nb_grupo" class="ml-3"></v-list-item-title>
                </template>

                <v-list-item v-show="grado.materia.length < 1">
                    <v-list-item-content>
                        <v-list-item-title class="ml-5 red--text">
                            <v-icon color="red" class="mr-3">mdi-block-helper</v-icon>
                            No se asignaron Materias
                        </v-list-item-title>
                    </v-list-item-content>
                      <v-list-item-action>
                    <v-tooltip top>
                        <template v-slot:activator="{ on }">
                            <v-btn v-on="on" fab x-small @click="navegateTo('grupo')" color="success">
                                <v-icon>mdi-bookshelf</v-icon>
                            </v-btn>
                        </template>
                        <span>Asignar Materias</span>
                    </v-tooltip>
                </v-list-item-action>
                </v-list-item>

                <v-list-item dense class="rounded-xl" v-for="materia in grado.materia" :key="materia.id" :value="setPlanEvaluacion(grupo.plan_evaluacion, grupo, materia)"> 
                    
                    <v-list-item-content>
                        
                        <v-col class="col-8 rounded-xl blue lighten-4">
                            <v-icon class="ml-3 mr-3" color="red">mdi-bookshelf</v-icon>
                            {{materia.nb_materia}}
                        </v-col>

                        <template v-if="(getPlanEvaluacion(grupo, materia).length > 0)">

                        <v-col class="col-auto"> 

                            <plan-evaluacion-form
                                :planEvaluacion="getPlanEvaluacion(grupo, materia)[0]"
                                :docentes="materia.docente"
                                :periodo="periodo"
                                :grupo="grupo.id"
                                :materia="materia.id"
                                action="upd"
                                :isLoading="loading"
                                @onLoad="loading = true"
                                @onUpdate="loading = false"
                            ></plan-evaluacion-form>

                         
                            <v-btn fab x-small color="success" dark :loading="loading" @click="detalleEvaluacion(grupo, materia)">
                                <v-icon>mdi-text-box-search</v-icon> 
                            </v-btn>
                               
                        </v-col>

                        <v-col class="col-1">
                            <status-switch 
                                :loading="loading" 
                                :item="getPlanEvaluacion(grupo, materia)[0]" 
                                resource="planEvaluacion" 
                                @onStatusChanging="loading=true"
                                @onStatusChanged="loading=false">
                            </status-switch>
                        </v-col>

                        </template>

                        <template v-else>

                        <v-col class="col-1"> 

                            <plan-evaluacion-form
                                :planEvaluacion="null"
                                :docentes="materia.docente"
                                :periodo="periodo"
                                :grupo="grupo.id"
                                :materia="materia.id"
                                action="ins"
                                :isLoading="loading"
                                @onLoad="loading = true"
                                @onStore="getGradoDetalle()"
                            ></plan-evaluacion-form>
            
                        </v-col> 

                        </template>

                    </v-list-item-content>

                </v-list-item>

                

            </v-list-group>

        </v-list-group>
        
        </v-list>

        
        </v-card-text>

    </v-card>


    </v-row>

    <v-dialog v-model="detalleDialog" fullscreen scrollable>
           <plan-detalle v-if="detalleDialog" :planEvaluacion="plan" :grupo="grupo" :materia="materia" @closeDialog="closeDialog('detalleDialog', $event)"></plan-detalle>
    </v-dialog>
    </v-container>
  
</template>

<script>
import DataHelper from '@mixins/AppData';
import AppPlanDetalle  from '@pages/planDetalle/AppPlanDetalle';
import AppPlanEvaluacionForm  from './AppPlanEvaluacionForm';
export default {

    mixins:     [ DataHelper ],

    components: { 
        'plan-detalle':  AppPlanDetalle,
        'plan-evaluacion-form': AppPlanEvaluacionForm
    },

    created()
    {
        this.list()
        this.validateForm = false
    },

    data () {
        return {
           grados:         null,
           periodos:       [],
           periodo:        null, //TODO: periodo
           planEvaluacion: [],
           dialogs:        [],
           loadGrupo:      [],
           form:
            {
                id: 	          null,
				id_grupo: 	      null,
                id_periodo: 	  null,
                id_materia: 	  null,
                id_docente: 	  null,
				tx_observaciones: null,
				id_status: 	      2,
				id_usuario: 	  this.idUser,
            },
            detalleDialog: false,
            plan:    null,
            grupo:   null,
            materia: null
        }
    },

    methods:
    {
        list()
        {
            this.getResource( `periodo/list` ).then( data => this.periodos   = data )

            this.getGradoDetalle()
        },

        getGradoDetalle()
        {
            this.getResource( `grado/planEvaluacion` ).then( data => this.grados   = data )
        },

        getEvaluaciones(event, periodo, grupo)
        {
            this.getResource( `planEvaluacion/grupo/${grupo}/periodo/${periodo}` ).then( data => this.evaluaciones[grupo]   = data )

        },

        setPlanEvaluacion(planEvaluacion, grupo,  materia) 
        {
            if(planEvaluacion.length > 0)
            {
               this.planEvaluacion[`${grupo.id}-${materia.id}`] = planEvaluacion.filter( plan => plan.id_materia == materia.id && plan.id_periodo == this.periodo)

            }else{
               this.planEvaluacion[`${grupo.id}-${materia.id}`] = []
            } 

            return this.isDisabled(grupo,  materia)           
        },

        getPlanEvaluacion(grupo,  materia)
        {
             return this.planEvaluacion[`${grupo.id}-${materia.id}`]
        },

        isDisabled(grupo, materia)
        {
            return (this.planEvaluacion[`${grupo.id}-${materia.id}`].length > 0) ? false : true 
        },

        storePlanEvaluacion(docente, grupo, materia)
        {
           
            this.form.id_grupo   = grupo.id,
            this.form.id_periodo = this.periodo,
            this.form.id_materia = materia.id,
            this.form.id_docente = docente,

            this.storeResource( `planEvaluacion`, this.form ).then( (data) => 
            {
                this.showMessage(data.msj)
                this.getGradoDetalle()
            })
        },

        detalleEvaluacion(grupo, materia)
        {
            this.plan          = this.planEvaluacion[`${grupo.id}-${materia.id}`][0]
            this.grupo         = grupo
            this.materia       = materia
            this.detalleDialog = true
        },

        closeDialog(dialog, refresh)
        {
            if(refresh) this.list()
            this[dialog] = false
        }
    }

}
</script>

<style>

</style>
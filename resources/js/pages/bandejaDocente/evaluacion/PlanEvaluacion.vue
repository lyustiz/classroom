<template>

    <v-card flat :loading="loading" height="90vh">

        <v-card-title class="pa-0">
            <app-simple-toolbar title="Evaluaciones" @closeModal="$emit('closeModal', true)"></app-simple-toolbar>
        </v-card-title>

        <v-card-text class="pt-2">

            <v-select
                :items="periodos"
                item-text="nb_periodo"
                item-value="id"
                v-model="periodo"
                label="Seleccione Periodo"
                :loading="loading"
                :disabled="loading"
                dense
                rounded
                filled
            ></v-select>

            <v-alert type="warning" :value="true" v-if="!periodo" prominent outlined border="left" class="mt-3">
                Seleccione un Período
            </v-alert>
              
              <v-expansion-panels focusable class="rounded-xl" accordion v-else>
                    <v-expansion-panel v-for="grado in grados" :key="grado.id">
                        
                        <v-expansion-panel-header>
                            <template v-slot:default >
                                <div>
                                    <v-icon color="red" class="mr-1">mdi-numeric</v-icon> {{ grado.nb_grado }} 
                                </div>
                            </template>
                        </v-expansion-panel-header>

                        <v-expansion-panel-content>
                            
                            <v-list rounded>
                            
                            <v-list-group sub-group v-for="grupo in grado.grupo" :key="grupo.id" color="amber" >
                
                                <template v-slot:activator >
                                    <v-list-item-icon><v-icon>mdi-alphabetical-variant</v-icon></v-list-item-icon>
                                    <v-list-item-title v-text="grupo.nb_grupo" class="ml-3"></v-list-item-title>
                                </template>

                                <v-list-item dense class="rounded-xl" v-for="planEvaluacion in getPlanesEvaluacion(grupo.plan_evaluacion)" :key="planEvaluacion.id" > 
                                    
                                    <v-list-item-content>
                                        
                                        <v-col class="col-8 rounded-xl blue lighten-4">
                                            <v-icon class="ml-3 mr-3" color="red">mdi-bookshelf</v-icon>
                                            {{planEvaluacion.materia.nb_materia}}
                                        </v-col>

                                        <v-col class="col-1"> 

                                             <v-btn fab x-small color="success" dark :loading="loading" @click="editDetallePlan(planEvaluacion, grupo)">
                                                <v-icon>mdi-text-box-search</v-icon> 
                                            </v-btn>
                            
                                        </v-col> 

                                        <v-col cols="1">

                                            <v-tooltip top  v-if="planEvaluacion.id_status == 1" color="green">
                                                <template v-slot:activator="{ on }">
                                                    <v-icon v-on="on" color="green" size="28">mdi-checkbox-marked-circle-outline</v-icon>
                                                </template>
                                                <span>Activo</span>
                                            </v-tooltip>

                                            <v-tooltip top v-else color="red">
                                                <template v-slot:activator="{ on }">
                                                    <v-icon v-on="on" color="red" size="28" >mdi-checkbox-blank-circle-outline</v-icon>
                                                </template>
                                                <span>Inactivo</span>
                                            </v-tooltip>

                                        </v-col>

                                    </v-list-item-content>

                                </v-list-item>
 
                

                             </v-list-group>
                            </v-list>


                        </v-expansion-panel-content>

                    </v-expansion-panel>
                </v-expansion-panels> 

        </v-card-text>   

        <v-dialog v-model="detalleDialog" content-class="rounded-xl" max-width="90vw" height="95vh" scrollable>
            <plan-detalle v-if="detalleDialog" :planEvaluacion="planEvaluacion" :grupo="grupo" :materia="materia" @closeDialog="detalleDialog=false"></plan-detalle>
        </v-dialog>

    </v-card>

</template>

<script>
import AppData from '@mixins/AppData';
import PlanDetalle  from '@pages/planDetalle/AppPlanDetalle';

export default {

    mixins:     [ AppData ],

    components: { 
        'plan-detalle':  PlanDetalle,
    },

    created()
    {
        this.list()
    },

    computed:
    {
        docente()
        {
            return this.$store.getters['getDocente']
        }
    },

    data () {
        return {
           periodos: [],
           periodo:  null,
           grados:   [],
           grupo:    null,
           materia:  null,
           planEvaluacion: null,
           detalleDialog: false
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
            this.getResource( `grado/planEvaluacion/docente/${this.docente.id}` ).then( data => this.grados   = data )
        },

        getPlanesEvaluacion(planesEvaluacion)
        {
            return planesEvaluacion.filter(plan => plan.id_periodo == this.periodo)
        },

        editDetallePlan(planEvaluacion, grupo)
        {
            this.detalleDialog = true
            this.grupo = grupo
            this.materia = planEvaluacion.materia
            this.planEvaluacion = planEvaluacion
        }

       
    }


}
</script>

<style>

</style>
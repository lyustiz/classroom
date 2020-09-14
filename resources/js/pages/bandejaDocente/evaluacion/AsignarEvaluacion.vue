<template>
            
    <v-row>
        <v-data-table
            :headers="headers"
            :items  ="items"
            item-key="id"
            :loading="loading"
            sort-by=""
            hide-default-footer
            dense
            class="rounded-xl col-12"
        >

            <template v-slot:item="{ item }" >
                <tr>
                    <td class="text-left" v-text="item.tipo_evaluacion.nb_tipo_evaluacion"></td>
                    <td class="text-left">{{item.nu_peso}} %</td>                                                                                                                                
                    <td class="text-left">
                        <list-simple-icon icon="mdi-card-text-outline" color="green" :label="item.tx_tema" ></list-simple-icon>
                    </td>
                    <td class="text-left">{{item.fe_planificada | formatDate}}</td>
                    <td class="text-left">{{item.fe_evaluacion | formatDate}}</td>
                    <td class="text-left">
                        <list-simple-icon :icon="item.status.tx_icono" :color="item.status.tx_color" :label="item.status.nb_status" ></list-simple-icon>
                    </td>
                    <td class="text-left">
                        <template v-if="item.id_status > 9">
                            <list-simple-icon :icon="item.evaluacion_metodo.tx_icono" :color="item.evaluacion_metodo.tx_color" :label="item.evaluacion_metodo.nb_evaluacion_metodo" ></list-simple-icon>
                        </template>    
                        <template v-else>-</template>
                    </td>
                    <td class="text-left">
                        <template v-if="item.hh_inicio">
                            <list-simple-icon icon="mdi-clock-outline" color="blue" :label="`${item.hh_inicio} - ${item.hh_fin}`" ></list-simple-icon>
                        </template>    
                        <template v-else>
                            <list-simple-icon icon="mdi-clock" color="amber" label="Todo el dia"></list-simple-icon>
                        </template>
                    </td>
                    <td class="text-left py-1">

                        <item-menu 
                            :menus="itemsMenu" 
                            iconColor="indigo" 
                            btnColor="indigo lighten-5" 
                            :item="item"
                            @onItemMenu="onItemMenu($event)" 
                        ></item-menu>

                    </td>               
                </tr>
            </template>
    
        </v-data-table>

        <v-dialog v-model="dialogEvaluar" max-width="600" content-class="rounded-xl" scrollable>
            <evaluacion-alumno 
                :evaluacion="evaluacion" 
                v-if="dialogEvaluar" 
                @closeModal="closeDialog($event,'dialogEvaluar')"
            ></evaluacion-alumno>
        </v-dialog>

        <app-modal
            :modal="modal"
            @closeModal="closeModal()"
            :head-color="$App.theme.headModal"
            :title="title"
        >
            <asignar-form
                action="upd"
                :item="item"
                @closeModal="closeModal()"
            ></asignar-form>
        </app-modal>

        <pre v-if="$App.debug">{{ $data }}</pre>
        
    </v-row>

</template>

<script>
import listHelper from '@mixins/Applist';
import AsignarEvaluacionForm from './AsignarEvaluacionForm'
import EvaluacionAlumno from './EvaluacionAlumno'
export default {

    components:
    {
        'asignar-form': AsignarEvaluacionForm,
        'evaluacion-alumno': EvaluacionAlumno
    },

    mixins:     [ listHelper ],

    watch:
    {
        planEvaluacion (oldValue, newValue)  {
            if(oldValue != newValue)
            {
                this.items = []
                this.list() 
            } 
        },
    },

    props:
    {
        planEvaluacion: {
            type:    [ Object],
            default: () => {} 
        },
    },

    data(){
        return {
            resource:   `evaluacion/planEvaluacion/${this.planEvaluacion.id}`,
            title:      'Asignar Evaluacion',
            item:       [],
            items:      [],
            headers:  [
                { text: 'Evaluacion',      value: 'tipo_evaluacion.nb_tipo_evaluacion' },
                { text: 'peso',            value: 'nu_peso' },
                { text: 'Tema',            value: 'tx_tema' },
                { text: 'Planificada',     value: 'fe_planificada' },
                { text: 'Fecha Ejecucion', value: 'fe_evaluacion' },
                { text: 'Status',          value: 'id_status' },
                { text: 'Metodo',          value: 'evaluacion_metodo' },
                { text: 'Hora Ini/Fin',    value: 'hh_inicio' },
                { text: 'acciones',        value: 'acciones' },
            ],
            itemsMenu: [
                    { action: 'addEjecucion',    icon: 'mdi-calendar-edit',  label: 'Asignar Evaluacion' },
                    { action: 'evaluarAlumnos', icon: 'mdi-account-multiple-check',  label: 'Evaluar Alumnos' },
            ],
            dialogEjecucion: false,
            dialogEvaluar:   false,
            evaluacion:      null
        }
    },

    methods: 
    {
        addEjecucion(evaluacion)
        {
            this.updateForm(evaluacion);
        },

        evaluarAlumnos(evaluacion)
        {
           if(evaluacion.id_status < 10)
           {
               return this.showError('Indique metodo de evaluacion y fecha de realizacion de la evaluacion')
           }
           this.evaluacion    = evaluacion
           this.dialogEvaluar = true;
        },

        closeDialog(refresh, dialog)
        {
            this[dialog]     = false;
            this.evaluacion  = null
            if(refresh) this.list()
        }
    }
}
</script>

<style>

</style>
<template>

    <v-card :loading="loading" flat max-height="80vh">

    <v-card-title class="pa-0">
        <app-simple-toolbar title="Detalle Calificacion" @closeModal="$emit('closeDialog', true)" dense></app-simple-toolbar>
    </v-card-title>
    
    <v-card-text class="pt-3" >

         <v-simple-table dense>
            <template v-slot:default>
                <tbody>
                    
                    <tr v-for="(planDetalle, idx) in planEvaluacion.plan_detalle" :key="idx">
                        
                        <td colspan="4">
                        <v-list-item > 
                            <v-list-item-avatar :color="planDetalle.tipo_evaluacion.tx_color">
                                <v-icon dark v-text="planDetalle.tipo_evaluacion.tx_icono"></v-icon>
                            </v-list-item-avatar>
                            <v-list-item-content>
                                <v-list-item-title v-text="planDetalle.tipo_evaluacion.nb_tipo_evaluacion"></v-list-item-title>
                            </v-list-item-content>
                            <v-list-item-action class="subtitle-1">
                            {{ planDetalle.nu_peso}} %
                            </v-list-item-action>
                        </v-list-item>

                        <v-list-item v-for="(evaluacion, idx2) in planDetalle.evaluacion" :key="idx2" > 
                            <v-list-item-icon>
                                <list-simple-icon 
                                :size="28" class="mx-2"
                                :label="(evaluacion.evaluacion_alumno[0].tx_observaciones) ? evaluacion.evaluacion_alumno[0].tx_observaciones : '-'" 
                                :icon="(evaluacion.evaluacion_alumno[0].tx_observaciones) ? 'mdi-card-text' : 'mdi-card-text-outline'" color="indigo">
                                </list-simple-icon>
                            </v-list-item-icon>
                            <v-list-item-content>
                                <v-list-item-title> 
                                    {{getNombreEvaluacion(evaluacion.tx_origen,evaluacion.origen)}}
                                </v-list-item-title>
                                <v-list-item-subtitle> 
                                    Calificacion  <span class="font-weight-bold">{{ evaluacion.evaluacion_alumno[0].nu_calificacion | formatNumber}}</span> / {{ evaluacion.nu_peso | formatNumber}} 
                                </v-list-item-subtitle>
                            </v-list-item-content>
                            <v-list-item-action >
                            <span class="subtitle-2">{{(evaluacion.evaluacion_alumno[0].nu_calificacion *  planDetalle.nu_peso / 100) | formatNumber }} Pts</span>
                            </v-list-item-action>
                        </v-list-item>

                        <v-list-item v-if="planDetalle.evaluacion.length < 1"> 
                            <v-list-item-icon>
                                <v-icon color="orange" class="mx-2">mdi-alert-circle-outline</v-icon>
                            </v-list-item-icon>
                            <v-list-item-content>
                                <v-list-item-title class="orange--text"> 
                                    No se han asignado evaluaciones! 
                                </v-list-item-title> 
                            </v-list-item-content>
                        </v-list-item>
                        
                        </td>
                    </tr>


                </tbody>
            </template>
        </v-simple-table>

        <pre v-if="$App.debug">{{ $data }}</pre>

    </v-card-text>
    </v-card>

</template>

<script>
import DataHelper from '@mixins/AppData';
export default {

    mixins:     [  DataHelper ],

    props:{

        planEvaluacion:
        {
            type:   Object,
            default: () => {}
        }
    },
    methods:
    {
        getNombreEvaluacion(origen,data)
        {
            switch (origen) {
                case 'prueba':
                    return data.nb_prueba
                    break;
                case 'tarea':
                    return data.nb_tarea
                    break;
                case 'actividad':
                    return data.nb_actividad
                    break;
                case 'enlace':
                    return data.nb_enlace
                    break;
                case 'recurso':
                    return data.archivo.nb_archivvo
                    break;
                case 'rasgo':
                    return data.nb_rasgo
                    break;
            
                default:
                    break;
            }
        }
    }
}
</script>

<style>
</style>
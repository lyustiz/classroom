<template>

    <v-card :loading="loading" flat max-height="50vh">

    <v-card-title class="pa-0">
        <app-simple-toolbar title="Detalle Calificacion" @closeModal="$emit('closeDialog', true)" dense></app-simple-toolbar>
    </v-card-title>
    
    <v-card-text class="pt-3" >

         <v-simple-table dense>
            <template v-slot:default>
                <thead>
                <tr>
                    <th class="text-left">Materia</th>
                    <th class="text-left">Peso</th>
                    <th class="text-left">Puntos</th>
                    <th class="text-center">Observaciones</th>
                </tr>
                </thead>
                <tbody>
                <tr v-for="(evaluacion, idx) in planEvaluacion.evaluacion" :key="idx">
                    <td> {{ evaluacion.tipo_evaluacion.nb_tipo_evaluacion }} </td>
                    <td> {{ evaluacion.nu_peso }}% </td>
                    <td> {{ (evaluacion.evaluacion_alumno[0]) ? evaluacion.evaluacion_alumno[0].nu_calificacion : '-' }} </td>
                    <td class="text-center">
                        <list-simple-icon :label="(evaluacion.evaluacion_alumno[0]) ? evaluacion.evaluacion_alumno[0].tx_observaciones : '-'" icon="mdi-card-text-outline" color="indigo"></list-simple-icon>
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
}
</script>

<style>
</style>
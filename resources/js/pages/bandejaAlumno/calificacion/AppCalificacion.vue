<template>

    <v-card :loading="loading" flat height="80vh">

    <v-card-title class="pa-0">
        <app-simple-toolbar title="Calificaciones (Parciales)" @closeModal="$emit('closeModal', true)"></app-simple-toolbar>
    </v-card-title>
    
    <v-card-text class="pt-3" >

        <v-simple-table >
            <template v-slot:default>
                <thead>
                <tr>
                    <th class="text-left">Materia</th>
                    <th class="text-left">Acumulado</th>
                    <th class="text-left">Letra</th>
                    <th class="text-left">Culitativa</th>
                    <th class="text-left">Aprobado</th>
                    <th class="text-left">Detalles</th>
                </tr>
                </thead>
                <tbody>
                <tr v-for="(calificacion, idx) in calificaciones" :key="idx">
                    <td> {{ calificacion.nb_materia }} </td>
                    <td> {{ calificacion.nu_calificacion }} </td>
                    <td>
                        <template v-if="calificacion.calificacion">{{ calificacion.calificacion.nb_calificacion }}</template>
                        <template v-else>-</template>
                    </td>
                    <td>
                        <template v-if="calificacion.calificacion">{{ calificacion.calificacion.nivel_calificacion.nb_nivel_calificacion }}</template>
                        <template v-else>-</template>
                    </td>
                    <td>
                        <template v-if="calificacion.calificacion">
                            <list-simple-icon v-if="calificacion.calificacion.bo_aprobado == 1" label="Aprobado" icon="mdi-checkbox-marked-circle-outline" color="success" ></list-simple-icon>
                            <list-simple-icon v-else label="Reprobado" icon="mdi-close-circle-outline" color="error" ></list-simple-icon>
                        </template>
                        <template v-else>-</template>
                    </td>
                    <td>
                        <list-simple-icon label="Ver Detalles" icon="mdi-text-box-search-outline" color="indigo" @click="showDetalles(calificacion.id_materia)" ></list-simple-icon>
                    </td>
                </tr>
                </tbody>
            </template>
        </v-simple-table>

        <v-dialog
            v-model="dialogDetail"
            max-width="500px"
            content-class="rounded-xl"
            scrollable
        >
            <calificacion-detalle :planEvaluacion="planEvaluacion" v-if="dialogDetail"  @closeDialog="closeDialog()"></calificacion-detalle>
        </v-dialog>
     
        <pre v-if="$App.debug">{{ $data }}</pre>

    </v-card-text>
    </v-card>

</template>

<script>
import DataHelper from '@mixins/AppData';
import CalificacionDetalle   from './AppCalificacionDetalle'

export default {

    mixins:     [  DataHelper ],

    components: {
        'calificacion-detalle':  CalificacionDetalle,
    },

    props:
    {
        alumno:{
            type: Object,
            default: () => this.$store.getters['getAlumno']
        }
    },

    created()
    {
        this.list()
    },

    data () {
        return {
            title:          'Evaluaciones',
            planes:         [],
            calificaciones: [],
            dialogDetail:   false,
            planEvaluacion: null
        }
    },

    methods:
    {
        list()
        {
           if( !this.alumno ) return
           this.getResource( `planEvaluacion/calificacion/alumno/${this.alumno.id}` ).then( data => {
                this.planes = data.planEvaluacion
                this.calificaciones = data.calificaciones
            })
        },

        showDetalles(idMateria)
        {
            this.planEvaluacion = this.planes.find( (plan) => plan.id_materia == idMateria);
            if(this.planEvaluacion) this.dialogDetail   = true
        },

        closeDialog()
        {
            this.dialogDetail    = false
            this.planEvaluacion = null
        },

        goPruebas()
        {
            this.$emit('closeModal', { goTo:'prueba-alumno' } )
        }
    }
}
</script>

<style>
</style>
<template>

    <v-card class="rounded-xl pb-2" >
        <v-toolbar :color="seguimiento[0].evaluacion.tipo_evaluacion.tx_color" dense dark flat>
            <v-row>
                <v-col cols="auto">
                    <v-icon size="30">{{seguimiento[0].evaluacion.tipo_evaluacion.tx_icono}}</v-icon>
                </v-col>
                <v-col class="title text-left">{{ seguimiento[0].evaluacion.tipo_evaluacion.nb_tipo_evaluacion }}</v-col>
                <v-col cols="auto" class="title">
                    {{ totalSeguimientos(seguimiento) }}
                </v-col>
            </v-row>
        </v-toolbar>

        <v-card-text class="seguimiento-container pt-0 px-1">
            <v-list dense>
            <v-list-item color="indigo" link v-for="(item) in seguimiento" :key="item.id">
                <v-list-item-avatar color="white" size="35" >
                    <v-icon size="30" :color="seguimiento[0].evaluacion.tipo_evaluacion.tx_color">
                        {{seguimiento[0].evaluacion.tipo_evaluacion.tx_icono}}
                    </v-icon>
                </v-list-item-avatar>
                <v-list-item-content>
                    <v-list-item-title>{{ getNombre(item) }}</v-list-item-title>
                    <v-list-item-subtitle>
                        <span class="font-weight-medium" v-if="item.evaluacion_alumno.id_status > 4"> Completada: {{item.evaluacion_alumno.fe_evaluacion | formatDate}} </span>
                        <v-icon size="15" color="green" v-if="item.evaluacion_alumno.id_status > 4">mdi-checkbox-marked-circle-outline</v-icon>
                        <v-icon size="15" color="amber darken-2" v-else>mdi-progress-clock</v-icon>
                    </v-list-item-subtitle>
                </v-list-item-content>

                 <v-list-item-action>
                    <v-btn icon>
                        <v-icon size="28" color="green" @click="evaluar(item)">mdi-text-box-search-outline</v-icon>
                    </v-btn>
                </v-list-item-action>
            </v-list-item>
            </v-list>
        </v-card-text>

        <v-dialog v-model="dialogPrueba" max-width="95vw" content-class="rounded-xl" scrollable>
            <evaluar-prueba :evaluacion="evaluacion" v-if="dialogPrueba" @closeDialog="closeDialog('dialogPrueba', $event)"></evaluar-prueba>
        </v-dialog>

        <v-dialog v-model="dialogTarea" max-width="95vw" content-class="rounded-xl" scrollable>
            <evaluar-tarea :evaluacion="evaluacion" v-if="dialogTarea" @closeDialog="closeDialog('dialogTarea', $event)"></evaluar-tarea>
        </v-dialog>
        
    </v-card>

         
</template>

<script>
import DataHelper  from '@mixins/AppData';
import EvaluarPrueba  from '@pages/prueba/AppEvaluarPrueba';
import EvaluarTarea  from '@pages/tarea/AppEvaluarTarea';

export default {

    mixins:     [ DataHelper ],

    components:
    {
        EvaluarPrueba,
        EvaluarTarea
    },

    props: 
    {
        seguimiento:{
            type: Array,
            default: () => {}
        },
    },

    data() {
        return {
            data:  [],
            evaluacion:    null,
            dialogPrueba: false,
            dialogTarea:  false
        }
    },

    methods:
    {
        getNombre(item)
        {
            if(item.evaluacion.tx_origen == 'prueba')
            {
                return item.evaluacion.origen.nb_prueba
            } 
            if(item.evaluacion.tx_origen == 'tarea')
            {
                return item.evaluacion.origen.nb_tarea
            } 
        },

        totalSeguimientos(seguimiento)
        {
            let completados = 0
            for (const seg of seguimiento) {
                if(seg.evaluacion_alumno.id_status > 4)
                {
                    completados++
                }
            }
            
            return  `${completados} / ${seguimiento.length}`
        },

        evaluar(evaluacion)
        {
            this.evaluacion = evaluacion
            
            if(evaluacion.evaluacion.tx_origen == 'prueba')
            {
                this.dialogPrueba = true
            } 

            if(evaluacion.evaluacion.tx_origen == 'tarea')
            {
                this.dialogTarea = true
            } 
        },

        closeDialog(dialog,  refresh)
        {
            this[dialog] = false
            if(refresh)
            {
                this.$emit('onUpdateData')
            }
            
        }
    }
}
</script>

<style>
.seguimiento-alumno-container
{
    min-height: 80vh;
}
.seguimiento-container{
    height: 180px;
    overflow-y: auto;
}

</style>
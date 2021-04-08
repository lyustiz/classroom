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
            <v-list-item color="indigo" link v-for="(item) in seguimiento" :key="item.id" disabled>
                <v-list-item-avatar color="white" size="35" >
                    <v-icon size="30" :color="seguimiento[0].evaluacion.tipo_evaluacion.tx_color">
                        {{seguimiento[0].evaluacion.tipo_evaluacion.tx_icono}}
                    </v-icon>
                </v-list-item-avatar>
                <v-list-item-content>
                    <v-list-item-title>{{ getNombre(item) }}</v-list-item-title>
                    <v-list-item-subtitle>
                        <span class="font-weight-medium"> Vistas: </span>{{item.evaluacion_alumno.nu_acceso}}
                        <span class="font-weight-medium ml-3" v-if="item.evaluacion_alumno.fe_acceso"> Acceso: </span>{{item.evaluacion_alumno.fe_acceso | formatDate}}
                    </v-list-item-subtitle>
                </v-list-item-content>
                <v-list-item-action>
                    <v-btn icon>
                        <template v-if="item.evaluacion_alumno.id_status > 4">
                            <v-icon size="30" color="green">mdi-checkbox-marked-circle-outline</v-icon>
                        </template>
                        <template v-else>
                            <v-icon size="30" color="amber darken-2">mdi-progress-clock</v-icon>
                        </template>
                    </v-btn>
                </v-list-item-action>
            </v-list-item>
            </v-list>
        </v-card-text>
        
    </v-card>

         
</template>

<script>
import DataHelper  from '@mixins/AppData';

export default {

    mixins:     [ DataHelper ],

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
        }
    },

    methods:
    {

        getNombre(item, tipo)
        {
            if(item.evaluacion.tx_origen == 'recurso')
            {
                return item.evaluacion.origen.archivo.nb_archivo
            } 
            else 
            {
                let  colunmbName = 'nb_' + item.evaluacion.tx_origen
                return item.evaluacion.origen[colunmbName]
            }
        },

        totalSeguimientos(seguimientos)
        {
            let completados = 0
            for (const seguimiento of seguimientos) {
                if(seguimiento.evaluacion_alumno.id_status > 4)
                {
                    completados++
                }
            }
            return  `${completados} / ${seguimientos.length}`
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
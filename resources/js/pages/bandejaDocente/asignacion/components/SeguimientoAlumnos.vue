<template>
<v-card width="100%" class="rounded-lg seguimiento-alumno-container">
    <v-subheader dark class="deep-purple rounded-t-lg">Alumnos</v-subheader>
    <v-card-text class="py-1">
    <v-list class="rounded-lg grey grey lighten-5">
        <v-list-group v-for="(tipos, alumno) in seguimientos" :key="alumno" color="deep-purple" class="grey lighten-5">
            <template v-slot:activator>
                <v-list-item :input-value="true">
                    <v-list-item-avatar color="white" size="35" >
                        <v-icon size="33" color="deep-purple">mdi-school</v-icon>
                    </v-list-item-avatar>
                    <v-list-item-title>{{ alumno }}</v-list-item-title>
                </v-list-item>
            </template>

            <div v-for="(seguimientos, tipo) in tipos" :key="tipo">
                <v-row class="white"  >
                    <v-col cols="12" md="4" v-for="(seguimiento, idx) in seguimientos" :key="idx">
                        
                        <seguimiento-evaluaciones v-if="tipo =='evaluacion'"  :seguimiento="seguimiento" :tipo="tipo" @onUpdateData="list()"></seguimiento-evaluaciones> 

                        <seguimiento-actividades v-else :seguimiento="seguimiento" :tipo="tipo" @onUpdateData="list()"></seguimiento-actividades>
                        
                    </v-col>
                </v-row>
            </div>
        </v-list-group>
    </v-list>

    <v-overlay absolute class="rounded-lg" :opacity="0.3" :value="loading">
        <v-icon size="50" color="white" class="mdi-spin">mdi-loading</v-icon>
    </v-overlay>
    </v-card-text>

    
    </v-card>
</template>

<script>
import DataHelper  from '@mixins/AppData';
import SeguimientoActividades  from './SeguimientoActividades'
import SeguimientoEvaluaciones from './SeguimientoEvaluaciones'

export default {

    components:{
        SeguimientoActividades,
        SeguimientoEvaluaciones
    },

    mixins:     [ DataHelper ],

    props: 
    {
        grupo:{
            type: Object,
            default: () => {}
        }
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
       if(this.grupo)
       {
           this.list()
       }
       else{
           this.seguimientos = []
       }
    },

    watch: 
    {
        grupo()
        {
            if(this.grupo)
            {
                this.list()
            }
             else
            {
                this.seguimientos = []
            }
        }
    },

    data() {
        return {
            seguimientos:  [],
            asignaciones: [],
            evaluaciones: []
        }
    },

     methods:
    {
        list()
        {
            //this.seguimientos = []
            this.getResource( `evaluacionAlumno/grupo/${this.grupo.id}`).then( (data) => 
            {  
                this.seguimientos              = data
            })
        },

        getNombre(item, tipo)
        {
            if(item.asignacion.tx_origen == 'recurso')
            {
                return item.asignacion.origen.archivo.nb_archivo
            } 
            else 
            {
                let  colunmbName = 'nb_' + item.asignacion.tx_origen
                return item.asignacion.origen[colunmbName]
            }
        },

        totalSeguimientos(seguimiento)
        {
            let completados = 0
            for (const seg of seguimiento) {
                if(seg.fe_completado)
                {
                    completados++
                }
            }
            
            return  `${completados} / ${seguimiento.length}`
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
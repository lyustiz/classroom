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
            <v-row class="white" >
                <v-col cols="4" v-for="(seguimiento, tipo) in tipos" :key="tipo">
                    <v-card class="rounded-xl pb-2" >
                        <v-toolbar :color="seguimiento[0].asignacion.tipo_asignacion.tx_color" dense dark flat>
                            <v-row>
                                <v-col col="1">
                                    <v-icon size="30">{{seguimiento[0].asignacion.tipo_asignacion.tx_icono}}</v-icon>
                                </v-col>
                                <v-col class="headline text-left">{{ tipo }}</v-col>
                                <v-col col="1" class="title">
                                    {{ totalSeguimientos(seguimiento) }}
                                </v-col>
                            </v-row>
                        </v-toolbar>
                        <v-card-text class="seguimiento-container pt-0 px-1">
                            <v-list dense>
                            <v-list-item color="purple" link v-for="(item) in seguimiento" :key="item.id">
                                <v-list-item-avatar color="white" size="35" >
                                    <v-icon size="30" :color="item.asignacion.tipo_asignacion.tx_color">
                                        {{item.asignacion.tipo_asignacion.tx_icono}}
                                    </v-icon>
                                </v-list-item-avatar>
                                <v-list-item-content>
                                    <v-list-item-title>{{ getNombre(item, tipo) }}</v-list-item-title>
                                    <v-list-item-subtitle>
                                        <span class="font-weight-medium"> Vistas: </span>{{item.nu_accesos}}
                                        <span class="font-weight-medium ml-3" v-if="item.fe_acceso"> Acceso: </span>{{item.fe_acceso | formatDate}}
                                        
                                    </v-list-item-subtitle>
                                </v-list-item-content>
                                <v-list-item-action>
                                    <v-btn icon>
                                        <template v-if="item.fe_completado">
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

                </v-col>
            </v-row>
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

export default {

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
        }
    },

     methods:
    {
        list()
        {
            this.seguimientos = []
            this.getResource( `asignacionAlumno/grupo/${this.grupo.id}`).then( (data) => 
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
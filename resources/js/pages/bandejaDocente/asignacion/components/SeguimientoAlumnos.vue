<template>
<v-card width="100%" class="rounded-lg seguimiento-alumno-container">
    <v-card-text class="py-1">

    <v-row justify="center" no-gutters class="my-2">
       
        <v-select
            v-model="materia"
            :items="materias"
            item-text="nb_materia"
            item-value="id"
            label="Seleccione Materia"
            :loading="loading"
            dense
            hide-details
            rounded
            filled
            @change="getAlumnos($event)"
            return-object
            v-if="grupo"
        ></v-select>

        <div v-else>
            <v-alert type="info" prominent class="mb-0" icon="mdi-hand-pointing-left">
                Seleccione un Grupo 
            </v-alert>
        </div>
    </v-row >


    <v-slide-y-transition>
    <v-list class="rounded-xl grey grey lighten-5" subheader dense v-if="materia" >
        <v-subheader class="">
            <v-row>
                <v-col><span class="ml-3">Alumnos</span></v-col>
                <v-col cols="auto">
                    <v-btn dark color="pink" small :loading="loading" class="mr-3" rounded @click="addRasgos()">
                        <v-icon size="16" class="mr-2" >mdi-human-male-height-variant</v-icon> Agregar Rasgos
                    </v-btn>
                </v-col>
            </v-row>
        </v-subheader>
        <v-list-group v-for="(alumno, nb_alumno) in alumnos" :key="nb_alumno" color="deep-purple" class="grey lighten-5">
            <template v-slot:activator>
                <v-list-item :input-value="true" class="rounded-lg">
                    <v-list-item-avatar color="white" size="35" >
                        <v-icon size="33" color="deep-purple">mdi-school</v-icon>
                    </v-list-item-avatar>
                    <v-list-item-title>{{ nb_alumno }}</v-list-item-title>
                </v-list-item>
            </template>

            <v-row class="white" >
                <v-col cols="12" md="4">
                    <SeguimientoRasgos :seguimientos="(alumno.rasgo) ? alumno.rasgo.rasgos: []" tipo="asignacion" @onUpdateData="list()"></SeguimientoRasgos> 
                </v-col>
                <v-col cols="12" md="4" v-for="(evaluaciones, idx) in alumno.evaluacion" :key="idx">
                    <SeguimientoEvaluaciones :seguimiento="evaluaciones" tipo="evaluacion" @onUpdateData="list()"></SeguimientoEvaluaciones> 
                </v-col>
                <v-col cols="12" md="4" v-for="(asignaciones, idx) in alumno.asignacion" :key="idx">
                    <SeguimientoActividades :seguimiento="asignaciones" tipo="asignacion" @onUpdateData="list()"></SeguimientoActividades>
                </v-col>
            </v-row>
         
        </v-list-group>
    </v-list>
    </v-slide-y-transition>

    <v-overlay absolute class="rounded-lg" :opacity="0.3" :value="loading">
        <v-icon size="50" color="white" class="mdi-spin">mdi-loading</v-icon>
    </v-overlay>
    </v-card-text>

    <v-dialog v-model="dialogRasgo" width="600" scrollable content-class="rounded-xl">
        <AsignacionRasgo v-if="dialogRasgo" :grupo="grupo" :materia="materia" @closeDialog="closeDialog($event)"></AsignacionRasgo>
    </v-dialog>

    </v-card>
</template>

<script>
import DataHelper  from '@mixins/AppData';
import AsignacionRasgo  from './AsignacionRasgo'
import SeguimientoActividades  from './SeguimientoActividades'
import SeguimientoEvaluaciones from './SeguimientoEvaluaciones'
import SeguimientoRasgos from './SeguimientoRasgos'

export default {

    components:{
        SeguimientoActividades,
        SeguimientoEvaluaciones,
        SeguimientoRasgos,
        AsignacionRasgo
    },

    mixins:     [ DataHelper ],

    props: 
    {
        grupo:{
            type: Object,
            default: () => null
        },
    },

    watch:
    {
        grupo()
        {
            this.materias =  []
            this.alumnos  =  []
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
            this.materias =  []
            this.materia  =  null
            this.alumnos  =  []
       }
    },

    watch: 
    {
        grupo()
        {
            this.materia =     null

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
            data:        {},
            materias:     [],
            materia:      null,
            alumnos:      [],
            rasgos:       [],
            asignaciones: [],
            evaluaciones: [],
            dialogRasgo:  false
        }
    },

     methods:
    {
        list()
        {
            this.alumnos = [];
            this.getResource( `evaluacionAlumno/materia/grupo/${this.grupo.id}/docente/${this.docente.id}`).then( (data) => 
            {  
               this.data = data
               let materias = []
               for (const key in data) {
                    materias.push(data[key])
                }
                this.materias = materias
            })
        },
        
        getAlumnos(materia)
        {
           //copiar el objeto completo evitando sobreescribir el original 
           let data =  JSON.parse(JSON.stringify(this.data[materia.nb_materia]))  
           delete data.id;
           delete data.nb_materia;
           this.alumnos = data 
        },

        addRasgos()
        {
            this.dialogRasgo = true
        },

        closeDialog()
        {
            this.dialogRasgo = false
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
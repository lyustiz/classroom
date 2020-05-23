<template>

   <v-sheet dark :color="`${materiaColor} lighten-2`" :height="74 * actividad.nu_carga_horaria" class="mt-2 pa-1 h-100">  

       <v-container fluid class="h-100 pa-1">
           
       

        <v-row no-gutters  justify="center" align-content="space-between" align="baseline" class="h-100">

            <v-col cols="12" class="d-flex justify-center">
                <v-chip class="title-materia" small :color="`${materiaColor} lighten-1`">{{actividad.materia.nb_materia}}</v-chip>
            </v-col>

             <v-col>

                <v-tooltip top open-on-click color="green lighten-1">
                    <template v-slot:activator="{ on }">
                        <v-btn v-on="on" dark icon small class="grey lighten-4 my-1" > 
                            <v-icon :color="`${materiaColor} lighten-2`">mdi-account-tie</v-icon>
                        </v-btn>
                    </template>
                    <span>{{actividad.docente.nb_docente}}</span>
                </v-tooltip>

                <v-tooltip top open-on-click color="green lighten-1">
                    <template v-slot:activator="{ on }">
                        <v-btn v-on="on" dark icon small class="grey lighten-4" > 
                            <v-icon :color="`${materiaColor} lighten-2`">mdi-chair-school</v-icon>
                        </v-btn>
                    </template>
                    <span>{{actividad.aula.nb_aula}}</span>
                </v-tooltip>

            </v-col>


            <v-col class="d-flex justify-end">

                <v-tooltip top open-on-click>
                    <template v-slot:activator="{ on }">
                        <v-btn v-on="on" dark icon x-small class="grey lighten-4 mx-1" @click="$emit('update')" > 
                            <v-icon size="14" color="amber">mdi-lead-pencil</v-icon>
                        </v-btn>
                    </template>
                    <span>editar</span>
                </v-tooltip>

                <v-tooltip top open-on-click>
                    <template v-slot:activator="{ on }">
                        <v-btn v-on="on" dark icon x-small class="grey lighten-4" @click="$emit('delete')" > 
                            <v-icon size="14" color="error lighten-1">mdi-delete</v-icon>
                        </v-btn>
                    </template>
                    <span>eliminar</span>
                </v-tooltip>

            </v-col>

        </v-row>

       <!--  <v-row no-gutters align="center" justify="center" align-content="center" class="mt-2">

                            $emit('update');
           
        </v-row> -->

        </v-container>
 
    </v-sheet> 

</template>

<script>
export default {
  props:
    {
        actividad: {
            type:       Object,
            default:    () => {}
        },
    },
    computed: {
        materiaColor()
        {
            if(this.actividad.materia.area_estudio)
            {
                return this.actividad.materia.area_estudio.tx_color
            }

            return 'cyan'
        }
    }
}
</script>

<style scoped>
.h-100{
 
    height: 100%;
}
.title-materia{
    max-width: 98%;
    overflow: hidden;
    text-overflow: ellipsis;
}
</style>
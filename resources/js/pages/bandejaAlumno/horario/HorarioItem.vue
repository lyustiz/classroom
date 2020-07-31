<template>

   <v-sheet dark :color="`${materiaColor} lighten-2`" :height="74 * item.nu_carga_horaria" class="mt-2 pa-1 h-100 rounded-lg">  

       <v-container fluid class="h-100 pa-1">

        <v-row no-gutters  justify="center" align-content="space-between" align="baseline" class="h-100">

            <v-col cols="12" class="d-flex justify-center">
                <v-chip class="title-item" small :color="`${materiaColor} lighten-1`">{{item.materia.nb_materia}}</v-chip>
            </v-col>

             <v-col cols="12" class="text-right"> 
                <v-tooltip top open-on-click color="green lighten-1">
                    <template v-slot:activator="{ on }">
                        <v-btn v-on="on" dark icon small class="grey lighten-4 my-1" > 
                            <v-icon :color="`${materiaColor} lighten-2`">mdi-account-tie</v-icon>
                        </v-btn>
                    </template>
                    <span>{{item.docente.nb_docente}}</span>
                </v-tooltip>

                <v-tooltip top open-on-click color="green lighten-1">
                    <template v-slot:activator="{ on }">
                        <v-btn v-on="on" dark icon small class="grey lighten-4" > 
                            <v-icon :color="`${materiaColor} lighten-2`">mdi-chair-school</v-icon>
                        </v-btn>
                    </template>
                    <span>{{item.aula.nb_aula}}</span>
                </v-tooltip>

            </v-col>

        </v-row>

        </v-container>
 
    </v-sheet> 

</template>

<script>
export default {
  props:
    {
        item: {
            type:       Object,
            default:    () => {}
        },
    },
    computed: {
        materiaColor()
        {
            if(this.item.materia.area_estudio)
            {
                return this.item.materia.area_estudio.tx_color
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
.title-item{
    max-width: 98%;
    overflow: hidden;
    text-overflow: ellipsis;
}
</style>
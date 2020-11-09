<template>
  <v-card flat color="grey lighten-5">
      
    <v-subheader class="grey lighten-3">
        <v-row no-gutters>
            <v-col cols="auto">
                <v-btn icon small class="mx-2 my-1" depressed  @click="navegateToName('bandeja-docente')">
                    <v-icon size="30">mdi-home</v-icon>
                </v-btn>
            </v-col>
            <v-col class="my-2">
                Seguimiento de Asignaciones
            </v-col>
            <v-col cols="auto">
                <v-btn icon x-small class="mx-1 my-2" depressed  @click="list()" :loading="loading">
                    <v-icon size="25">mdi-refresh</v-icon>
                </v-btn>
            </v-col>
        </v-row>
    </v-subheader>

    <v-card-text>

        <v-row no-gutters>
            <v-col cols="1">
                <v-item-group active-class="deep-purple" v-model="grupoSelected" class="group-container" >
                    <v-item v-slot:default="{ active, toggle }" v-for="(grupo, i) in grupos" :key="i" class="pointer pa-0" :value="grupo">
                        <v-col @click="toggle" class="ml-1n">
                            <div>
                                <v-avatar :color="(active) ? 'deep-purple': 'deep-purple lighten-4'" size="80" class="mx-2" >
                                    <v-icon size="60" color="white">mdi-account-group</v-icon> 
                                </v-avatar>
                                <v-card-title v-text="grupo.nb_grupo" class="caption my-n2"></v-card-title>
                            </div>
                        </v-col>
                    </v-item>
                </v-item-group>
            </v-col>

            <v-col cols="11">
                <seguimiento-alumno :grupo="grupoSelected"></seguimiento-alumno>
            </v-col>
        </v-row>
    
    </v-card-text>

  </v-card>
</template>

<script>
import DataHelper  from '@mixins/AppData';
import SeguimientoAlumno  from './components/SeguimientoAlumnos';

export default {

    mixins:     [ DataHelper ],

    components: {
        SeguimientoAlumno
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
       this.list()
    },

    data() {
        return {
            grupos:        [],
            grupoSelected: null,
        }
    },

     methods:
    {
        list()
        {
            this.getResource( `grupo/docente/${this.docente.id}` ).then( data =>  this.grupos = data)
        },
    }
}
</script>

<style>

</style>
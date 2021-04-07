<template>

    <v-row no-gutters>

        <v-col cols="auto" >

            <v-row  class="flex-column" justify="center" dense>
                <app-button small :size="30" innerClass="mx-auto mt-2"  color="green" label="Volver al Inicio" icon="mdi-home" @click="navegateToName('bandeja-docente')" ></app-button>
                <v-item-group active-class="deep-purple" v-model="grupoSelected" class="group-container" >
                    <v-item v-slot:default="{ active, toggle }" v-for="(grupo, i) in grupos" :key="i" class="pointer" :value="grupo">
                        <v-col cols="12" @click="toggle" class="text-center">
                            <v-avatar :color="(active) ? 'deep-purple': 'deep-purple lighten-4'" size="90" >
                                <v-icon size="70" color="white">mdi-account-group</v-icon> 
                            </v-avatar>
                            <v-card-title v-text="grupo.nb_grupo" class="caption my-n2"></v-card-title>
                        </v-col>
                    </v-item>
                </v-item-group>
            </v-row>

        </v-col>

        <v-col class="pa-1"> 
            <v-row no-gutters justify="center">
                <app-calendar :grupo="grupoSelected" :tipoEvaluacion="tipoEvaluacion" ></app-calendar>
            </v-row>
        </v-col>

    </v-row>
 
</template>

<script>
import DataHelper  from '@mixins/AppData';
import AppCalendar from './AppCalendar'
export default {

    components: {
        'app-calendar':       AppCalendar,
    },

    mixins:     [ DataHelper ],
    
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
            tipoEvaluacion: [],
        }
    },

    methods:
    {
        list()
        {
            this.getResource( `grupo/docente/${this.docente.id}` ).then( data =>  this.grupos = data)
            this.getResource( `tipoEvaluacion?asignable="true"` ).then( data => this.tipoEvaluacion = data)
        },
    }
}
</script>

<style>
.container-page{
    height: 93vh;
}
.group-container
{
    min-width: 115px;
}
</style>
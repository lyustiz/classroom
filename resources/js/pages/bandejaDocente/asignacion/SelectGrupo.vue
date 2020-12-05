<template>

    <v-row no-gutters>

        <v-col cols="auto" >

            <v-row  class="flex-column" justify="center" no-gutters>

                <app-button small :size="30" innerClass="mx-auto my-0"  color="green" label="Volver al Inicio" icon="mdi-home" @click="$emit('closeDialog')" ></app-button>
                 
                <v-item-group active-class="deep-purple" v-model="grupoSelected" class="group-container py-0" >

                    <v-item v-slot:default="{ active, toggle }" v-for="(grupo, i) in grupos" :key="i" class="pointer pa-0" :value="grupo">
        
                        <v-col @click="toggle">

                            <div>
                                <v-avatar :color="(active) ? 'deep-purple': 'deep-purple lighten-4'" size="80" >
                                    <v-icon size="60" color="white">mdi-account-group</v-icon> 
                                </v-avatar>
                                <v-card-title v-text="grupo.nb_grupo" class="caption my-n2"></v-card-title>
                            </div>

                        </v-col>

                    </v-item>

                </v-item-group>

            </v-row>

        </v-col>

        <v-col class="pa-1"> 
            <v-row no-gutters justify="center">
                <app-calendar :grupo="grupoSelected" :tipoAsignacion="tipoAsignacion" :tipoEvaluacion="tipoEvaluacion" ></app-calendar>
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
            tipoAsignacion: [],
            tipoEvaluacion: [],
        }
    },

    methods:
    {
        list()
        {
            this.getResource( `grupo/docente/${this.docente.id}` ).then( data =>  this.grupos = data)
            this.getResource( `tipoAsignacion` ).then( data => this.tipoAsignacion = data)
            this.getResource( `tipoEvaluacion` ).then( data => this.tipoEvaluacion = data)
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
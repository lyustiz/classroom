<template>

    <list-container :title="title" :head-color="$App.theme.headList" @onMenu="onMenu($event)">

        <v-btn small color="primary" v-if="steep == 0 "  @click="steep = 1" class="mb-1">
            Iniciar
        </v-btn>

        <v-stepper v-model="steep" vertical>

            <v-stepper-step :complete="steep > 1" step="1" color="green">
                Institucion
                <small>Informacion de la Institucion</small>
            </v-stepper-step>

            <v-stepper-content step="1">
                <info-form></info-form>
                <v-btn color="primary" @click="steep = 2">Siguiente</v-btn>
            </v-stepper-content>

            <v-stepper-step :complete="steep > 2" step="2" color="green">
                Academico
                <small>Datos para la configuracion del area Academica</small>
            </v-stepper-step>

            <v-stepper-content step="2">
            <v-card flat=""> 
                <v-card-text>
                    <h1>Configuracion Academico</h1>
                </v-card-text>
                <v-card-actions>
                    <v-btn color="primary" @click="steep = 3">Siguiente</v-btn>
                </v-card-actions>
            </v-card>
            </v-stepper-content>

            <v-stepper-step step="3" :complete="steep > 3" color="green">
                Profesores
                <small>Carga de la Plantilla de Profesores</small>
            </v-stepper-step>

            <v-stepper-content step="3">
            <v-card flat=""> 
                <v-card-text>
                    <h1>Configuracion Profesores</h1>
                </v-card-text>
                <v-card-actions>
                    <v-btn color="primary" @click="steep = 4">Finalizar</v-btn>
                </v-card-actions>
                </v-card>
            </v-stepper-content>

        </v-stepper>

        <v-alert v-if="steep == 4" type="success" icon="mdi-check-circle" :value="true" class="mt-3" >
            Felicitaciones ha culminado la configuracion! <v-btn x-small color="info" @click="steep = 1">Reiniciar</v-btn>
        </v-alert>

    </list-container>

</template>

<script>
import InfoForm from '@pages/colegio/infoForm'

export default {
    components: {
        'info-form': InfoForm
    },

    data () {
    return {
        title:    'Asistente',
        steep: 0,

    }
    },
    methods:
    {
        
    }
}
</script>

<style>
</style>
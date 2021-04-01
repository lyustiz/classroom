<template>
<v-card>
    <v-card-title class="pa-0">
        <v-toolbar :color="materia.area_estudio.tx_color" dense dark flat>
            <v-row>
                <v-col cols="auto">
                    <v-icon size="30">mdi-printer-check</v-icon>
                </v-col>
                <v-col class="text-left">Recursos</v-col>
                <v-spacer></v-spacer>
                <v-col cols="auto" class="title">
                    <v-btn icon small dark @click="$emit('closeDialog')"><v-icon>mdi-close-circle-outline</v-icon></v-btn>
                </v-col>
            </v-row>
        </v-toolbar>
    </v-card-title>
    <v-card-text>
        
        <v-row class="grey lighten-5 rounded-lg mt-2" align="center">
            <v-subheader>Certificados</v-subheader>
            <v-col cols="auto text-center" v-for="certificado in certificados" :key="certificado.id" @click="showCertificado(certificado)">
                <v-btn fab large color="teal" dark >
                    <v-icon size="40">mdi-certificate</v-icon>
                </v-btn>
                <v-col class="caption pa-0">
                    {{certificado.certificado.plan_evaluacion.periodo.nb_periodo}}
                </v-col>
            </v-col>
        </v-row>

        <v-dialog v-model="dialogCertificado" fullscreen>
            <AppCertificado v-if="dialogCertificado" :certificado-alumno="certificadoAlumno" @closeDialog="dialogCertificado=false"></AppCertificado>
        </v-dialog>

    </v-card-text>
</v-card>
  
</template>

<script>
import AppCertificado from './AppCertificado'
import AppData  from '@mixins/AppData';
export default {

    components:{
        AppCertificado
    },

    mixins:     [ AppData ],

    props: 
    {
        materia:{
            type: Object,
            default: () => null
        },
    },
    
    computed:
    {
        alumno()
        {
            return this.$store.getters['getAlumno'];
        },
    },

    created()
    {
      this.list()
    },


    data() {
        return {
            certificados: [],
            dialogCertificado: false,
            certificadoAlumno: null
        }
    },

     methods:
    {
        list()
        {
            this.getResource(`certificadoAlumno/alumno/${this.alumno.id}/materia/${this.materia.id}`).then( data =>{
               this.certificados = data
            })
        },
        
        showCertificado(certificadoAlumno)
        {
            if(certificadoAlumno.id_status == 2)
            {
                this.showError('Certificado no Disponible')
                return
            }
            this.certificadoAlumno = certificadoAlumno
            this.dialogCertificado = true
        },
    }
}
</script>

<style>

</style>
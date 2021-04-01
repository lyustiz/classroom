<template>
<v-card dark> 

    <v-card-title class="pa-0" >
        <app-simple-toolbar title="Certificado" backgroundColor="red" dense dark @closeModal="$emit('closeDialog')" ></app-simple-toolbar>
    </v-card-title>

    <v-card-text class="pa-0">
        <div class="enlace-container">
            <embed class="file-visor" :src="`/certificado/certificadoAlumno/${certificadoAlumno.id}`" type="application/pdf" width="100%" @load="loading = false"  />
        </div>
    </v-card-text>
    
</v-card>
  
</template>

<script>
export default {

    props:
    {
        certificadoAlumno:{
            type: Object,
            default: () => {}
        }
    },

}
</script>

<style>

</style>
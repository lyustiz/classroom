<template>
    <v-list rounded>
    <v-list-group  sub-group v-for="grupo in grado.grupo" :key="grupo.id" color="amber" >
        <template v-slot:activator >
            <v-list-item-icon><v-icon>mdi-alphabetical-variant</v-icon></v-list-item-icon>
            <v-list-item-title v-text="grupo.nb_grupo" class="ml-3"></v-list-item-title>
        </template>

        contend
    </v-list-group>
    </v-list>
</template>

<script>
export default {

    props:
    {
        planEvaluacion: 
        {
            type:       Object,
            default:    () => []
        },
        
        docentes: {
            type:       Array,
            default:    () => []
        },

        periodo: {
            type:       Number,
            default:    null
        },
    }

}
</script>

<style>

</style>
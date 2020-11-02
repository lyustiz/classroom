<template>

        <v-menu offset-y absolute content-class="rounded-lg" min-width="200px" right>
            <template v-slot:activator="{ on }">
                <v-btn icon dark color="amber" depressed v-on="on">
                    <v-icon size="30" v-text="'mdi-rocket-launch'"></v-icon>
                </v-btn>
            </template>

            <div v-for="(asignaciones, materia) in materias" :key="materia" class="white">
                
                <v-list dense subheader>
                    <v-subheader>{{materia}}</v-subheader>
                    <v-list-item color="amber" v-for="(asignacion, materia) in asignaciones" :key="materia" link class="my-n2">
                        <v-list-item-avatar color="white" size="35" @click="verAsignacion(asignacion, 'actividad')">
                            <v-icon size="30" color="amber">mdi-rocket-launch</v-icon>
                        </v-list-item-avatar>
                        <v-list-item-content @click="verAsignacion(asignacion, 'actividad')">
                            <v-list-item-title>{{ asignacion.origen.nb_actividad }}</v-list-item-title>
                        </v-list-item-content>
                        <v-list-item-action>
                            <v-btn icon>
                                <v-icon size="20" color="red lighten-1" @click="confirmEliminar(asignacion, 'asignacion')">mdi-delete</v-icon>
                            </v-btn>
                        </v-list-item-action>
                    </v-list-item>
                </v-list>
            </div>

        </v-menu>

</template>

<script>
export default {

    props

}
</script>

<style>

</style>
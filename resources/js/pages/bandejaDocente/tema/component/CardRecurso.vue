<template>
    <v-card class="rounded-xl">
        <v-card-title class="pa-0">
            <tema-toolbar label="Actividad" color="amber" icon="mdi-rocket-launch" @on-add="addItem()"></tema-toolbar>
        </v-card-title>
        <v-card-text class="pt-2">
                <v-list dense subheader>
                <v-list-item color="amber" v-for="actividad in recursos.actividad" :key="actividad.id" link @click="verEvaluacion(evaluacion, 'cuestionario')">
                    <v-list-item-avatar color="white" size="35">
                        <v-icon size="30" color="amber">mdi-rocket-launch</v-icon>
                    </v-list-item-avatar>
                    <v-list-item-content>
                        <v-list-item-title>{{ actividad.nb_actividad }}</v-list-item-title>
                    </v-list-item-content>

                    <v-list-item-action>
                        <v-btn icon>
                            <v-icon size="20" color="orange lighten-1" @click.stop="editar(actividad, 'evaluacion')">mdi-lead-pencil</v-icon>
                        </v-btn>
                    </v-list-item-action>
                    <v-list-item-action>
                        <v-btn icon>
                            <v-icon size="20" color="red lighten-1" @click.stop="confirmEliminar(actividad, 'evaluacion')">mdi-delete</v-icon>
                        </v-btn>
                    </v-list-item-action>
                </v-list-item>
            </v-list>
        </v-card-text>
    </v-card>
  
</template>

<script>
export default {

    props: 
    {
        color:
    }

}
</script>

<style>

</style>
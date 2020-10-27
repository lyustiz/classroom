<template>
    <v-toolbar :color="color" flat dense class="title" dark>
        <v-row>
            <v-icon class="mx-3">{{icon}}</v-icon> 
            <span class="mt-2">{{label}}</span>
            <v-spacer></v-spacer>

            <v-chip-group v-model="active" column mandatory>
                <v-chip filter  color="amber">Pendiente <v-icon class="ml-1" size="25">mdi-progress-clock</v-icon></v-chip>
                <v-chip filter  color="green">Completada <v-icon class="ml-1" size="25">mdi-checkbox-marked-circle-outline</v-icon></v-chip>
            </v-chip-group>

        </v-row>
    </v-toolbar>
</template>

<script>
export default {

    props:{

        label:{
            type: String,
            default: () => {}
        },

        color:{
            type: String,
            default: 'deep-purple'
        },

        icon:{
            type: String,
            default: 'mdi-book-multiple-outline'
        },
    },

    data () {
        return {
            active:     0,
        }
    },
}
</script>

<style>

</style>
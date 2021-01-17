<template>
    <v-toolbar :color="color" flat dense class="title" dark>
        <v-row>
            <v-icon class="mx-3">{{icon}}</v-icon> 
            <span class="mt-2">{{label}}</span>
            <v-spacer></v-spacer>

            <v-chip-group v-model="active" column>
                <v-chip filter filter-icon="mdi-checkbox-marked-circle-outline" color="amber" @change="onCompletada($event)" value="1">
                    Ver Completadas
                </v-chip>
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
            default: 'blue darken-4'
        },

        icon:{
            type: String,
            default: 'mdi-book-multiple-outline'
        },
    },

    data () {
        return {
            active:     null,
        }
    },

    methods:
    {
        onCompletada()
        {
           this.$emit('onShowComplete', !this.active )
        }
    }
}
</script>

<style>

</style>
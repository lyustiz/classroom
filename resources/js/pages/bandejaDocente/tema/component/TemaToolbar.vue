<template>
    <v-toolbar :color="color" flat dense class="title rounded-t-xl" dark>
        <v-row>
            <v-col cols="auto">
                <v-icon class="mx-3">{{icon}}</v-icon> 
            </v-col>
            <v-col cols="auto">
                <span class="my-2">{{label}}</span>
            </v-col>
            <v-spacer></v-spacer>
            <v-col cols="auto">
                <v-tooltip bottom>
                <template v-slot:activator="{ on }">
                    <v-btn fab color="success" x-small v-on="on" @click="$emit('on-add')" :loading="loading">
                        <v-icon size="30"  >mdi-plus</v-icon>
                    </v-btn>
                </template>
                <span>Agregar {{ label }}</span>
            </v-tooltip>
            </v-col>
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

        loading: {
            type: Boolean,
            default: false
        }
    },

    data () {
        return {
            active:     0,
        }
    },

    methods:
    {
        insItem()
        {
            
        }
    }
}
</script>

<style>

</style>
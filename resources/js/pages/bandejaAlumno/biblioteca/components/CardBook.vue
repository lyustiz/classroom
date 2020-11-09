<template>
    <v-card
        :color="active ? undefined : color"
        class="mx-4 my-1 px-1 rounded-lg pointer"
        height="150"
        width="120"
        elevation="3"
        ripple
        @click="$emit('onSelect')"
    >
        <v-row justify="center" no-gutters class="fill-height align-stretch" > 
            <v-col cols="6"><v-icon color="white" :size="iconSize" class="">{{ icon }}</v-icon></v-col>
            <v-col cols="6" class="text-right mt-1"><v-icon color="white" :size="40" v-if="completed">mdi-checkbox-marked-circle-outline</v-icon></v-col>
            <v-col cols="12" class="white--text text-center text-capitalize font-weight-medium title-1">
                {{ label }}
            </v-col>
        </v-row>
    </v-card>
</template>

<script>
export default {

    props:{
        color:{
            type: String,
            default: 'primary'
        },

        icon:{
            type: String,
            default: 'mdi-bookmark'
        },

        iconSize:{
            type: Number,
            default: 60 
        },

        label:{
            type: String,
            default: null    
        },

        active: {
            type: Boolean,
            default: false
        },

        completed: {
            type: Boolean,
            default: false
        }
    },

    data () {
        return {
            file:     0,
        }
    },
}
</script>

<style>

</style>
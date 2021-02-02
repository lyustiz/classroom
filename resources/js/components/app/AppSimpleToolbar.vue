<template>
  <v-toolbar :color="backgroundColor" :dark="dark" flat :dense="dense">
        <v-toolbar-title :class="textColor" v-text="title"></v-toolbar-title>
        <v-spacer></v-spacer>
            <slot name="toolbar-action"></slot>
            <v-btn icon x-small class="mr-2 ml-4" :class="textColor" @click="closeModal()">    
                <v-icon>mdi-close-circle</v-icon>
            </v-btn>
    </v-toolbar>
</template>

<script>
export default {

    props:
    {
        title: {
            type:       String,
            default:    null
        },

        backgroundColor: {
            type:       String,
            default:    'indigo'
        },

        textColor: {
            type:       String,
            default:    'white--text'
        },

        dark:{
            type:       Boolean,
            default:    true
        },

        dense: {
            type:       Boolean,
            default:    false
        },
    },

    methods:
    {
        closeModal()
        {
            this.$emit('closeModal')
        }
    }

}
</script>

<style>

</style>
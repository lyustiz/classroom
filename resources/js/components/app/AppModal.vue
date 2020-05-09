<template>

<v-dialog v-model="modal" persistent width="600" min-width="700">

    <v-card >

        <v-toolbar dark flat dense :color="(HeadColor) ? HeadColor : $App.theme.headModal">

            <v-btn icon x-small dark class="mx-1" @click.native="$emit('closeModal')">
                <v-icon>mdi-close-circle</v-icon>
            </v-btn>

            <v-toolbar-title>{{ title }}</v-toolbar-title>

            <v-spacer></v-spacer>

            <v-btn icon>
                <v-icon>mdi-dots-vertical</v-icon>
            </v-btn>
        
        </v-toolbar>

        <v-card-text class="py-1 px-1">

            <slot></slot>

        </v-card-text>

    </v-card>

</v-dialog>


</template>

<script>
export default {
    name: 'app-modal',
    props:
    {
        title:{
            type:       String,
            default:    ''
        },
        modal:{
            type:       Boolean,
            default:    true
        },
        HeadColor:{
            type:       String,
            default:    null
        },
        TextColor:{
            type:       String,
            default:    'white--text'
        },
    }
}
</script>

<style>
</style>

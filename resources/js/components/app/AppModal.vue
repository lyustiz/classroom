<template>

<v-dialog v-model="modal" persistent width="500">
    <v-card>

        <v-card-title dark :color="(HeadColor) ? HeadColor : $App.theme.headModal">

            <v-btn icon x-small dark @click.native="$emit('closeModal')">
                <v-icon>close</v-icon>
            </v-btn>

            <v-toolbar-title>
                {{ nbAction }}
            </v-toolbar-title>

        </v-card-title>

        <v-card-text>

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
        nbAction:{
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

<template>

    <v-tooltip bottom>
        <template v-slot:activator="{ on }">
            <v-btn icon dark small v-on="on" @click="insItem()" :class="innerClass" :loading="loading">
                <v-icon size="38" color="success" >mdi-plus-circle</v-icon>
            </v-btn>
        </template>
        <span>{{ label }}</span>
    </v-tooltip>

</template>

<script>
export default {
    props:
    {
        label: {
            type:     String,
            default:  'Nuevo Item'
        },

        loading: {
            type:     Boolean,
            default:  false
        },

        innerClass: {
            type:     String,
            default:  'elevation-5'
        }
    },
    methods:
    {
        insItem()
        {
            this.$emit('insItem')
        }
    }
}
</script>

<style>
</style>

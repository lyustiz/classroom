<template>

    <v-tooltip bottom>
        <template v-slot:activator="{ on }">
            <v-btn fab dark small color="success" v-on="on" @click="insItem()" >
                <v-icon>add</v-icon>
            </v-btn>
        </template>
        <span>{{ mensaje }}</span>
    </v-tooltip>

</template>

<script>
export default {
    props:
    {
        mensaje: {
            type:     String,
            default:  'Nuevo Item'
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

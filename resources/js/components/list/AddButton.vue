<template>

    <v-tooltip bottom>
        <template v-slot:activator="{ on }">
            <v-btn icon dark small v-on="on" @click="insItem()" class="elevation-5">
                <v-icon size="38" color="success" >mdi-plus-circle</v-icon>
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

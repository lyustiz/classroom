<template>
    <v-layout row justify-center>
    <v-speed-dial 
    v-model="fab"
    direction="left" 
    :open-on-hover="!isAutoOpen">

        <template v-slot:activator >
            <v-btn v-model="fab" :color="(color) ? color : $App.theme.button.actions" dark small fab >
                <v-icon v-if="!fab">{{ icon }}</v-icon>
                <v-icon v-else>close</v-icon>
            </v-btn>
        </template>

        <v-btn fab dark small :color="$App.theme.button.delete" @click="deleted">
            <v-icon>delete</v-icon>
        </v-btn>

            <v-btn fab dark small :color="$App.theme.button.update" @click="update">
            <v-icon>edit</v-icon>
        </v-btn>

        <slot></slot>

    </v-speed-dial>
    </v-layout>
</template>

<script>
export default {
    data(){
        return {
            fab: false
        }
    },
    methods:
    {
        deleted()
        {
            this.$emit('delete');
        },
        update()
        {
            this.$emit('update');
        },
    },
    computed:
    {
        isAutoOpen()
        {
            return (this.auto) ? true : false;
        }
    },
    props:{
        upd: {
            type: Boolean,
            default: true
        },
        del: {
            type: Boolean,
            default: true
        },
        icon:{
            type: String,
            default: 'build'
        },
        color:{
            type: String,
            default: null
        },
        auto:{
            type: Boolean,
            default: true
        }
    }
}
</script>

<template>

    <v-tooltip bottom :color="color">
        <template v-slot:activator="{ on }">
            <v-btn v-on="on" fab dark x-small :color="color" :loading="loading" @click="$emit('click', $event)" :disabled="disabled" :depressed="depressed">
                <v-icon size="24" v-text="icon"></v-icon>
            </v-btn>
        </template>
        <span v-text="label"></span>
    </v-tooltip>

</template>

<script>
export default {

    data(){
        return {
            fab: false
        }
    },

    props:{

        loading:{
            type:     Boolean,
            default:  false
        },

        color:{
            type:     String,
            default:  'primary'
        },

        icon:{
            type:     String,
            default:  'mdi-plus'
        },

        label:{
            type:     String,
            default:  null
        },

        depressed:{
            type:     Boolean,
            default:  false
        },

        disabled:{
            type:     Boolean,
            default:  false
        }
    }
}
</script>

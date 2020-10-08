<template>

    <v-tooltip bottom :color="color">
        <template v-slot:activator="{ on }">
            <v-btn 
            v-on="on" 
            fab 
            dark 
            :x-small="!small" 
            :small="small" 
            :color="color" 
            :loading="loading"
             @click="$emit('click', $event)" 
             :disabled="disabled" 
             :depressed="depressed" 
             :class="innerClass">
                <v-icon :size="size" v-text="icon"></v-icon>
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

        size:{
            type:     Number,
            default:  24
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
        },

        small:{
            type:     Boolean,
            default:  false
        },

        innerClass:{
            type:     String,
            default:  true
        }
    }
}
</script>

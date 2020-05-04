<template>
    <v-container 
        style = "padding:0"
    >
        <v-speed-dial
            v-model        = "fab"
            direction      = "left"
            :open-on-hover = "true"
            transition     = "slide-y-reverse-transition"
        >
            <template 
                slot = "activator"
            >
                <v-btn
                    v-model = "fab"
                    color   = "blue darken-2"
                    dark
                    small 
                    fab
                >
                    <v-icon> settings </v-icon>
                    <v-icon> close    </v-icon>
                </v-btn>
            </template>
            <template 
                v-for = "(value, name, index) in this.icons"
            >
                <v-tooltip 
                    top 
                    :key = "index"
                >
                    <v-btn
                        fab 
                        dark 
                        small
                        @click  = "place(name)" 
                        slot    = "activator"
                        :color  = "colors[name]"
                    >
                        <v-icon>{{ name }}</v-icon>
                    </v-btn>
                    <span>{{ value }}</span>
                </v-tooltip>
            </template>
        </v-speed-dial>
    </v-container>
</template>
<script>
export default {
    props:
    {
        icons: Object, 
    },
    data(){
        return{  
            fab   : false,
            color : null, 
            colors: 
            {
                // primary ,
                // secondary,
                // accent,
                note    : "info"    ,
                edit    : "warning" ,
                delete  : "error"   ,
                save    : "success" ,
            },
        }
    },
    methods:
    {
        place(value)
        {   
            this.$emit("buttomPress", value);
        },
    },
}
</script>
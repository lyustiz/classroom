<template>

    <div >
        <v-tooltip bottom :color="color">
            <template v-slot:activator="{ on }">
                <v-icon v-on="on" 
                    :color="color" 
                    v-text="icon"
                    class="pointer" 
                    @click="$emit('click', $event)"
                    :size="size">
                </v-icon>
            </template>
            <span v-text="label"></span>
        </v-tooltip>
    </div>

</template>

<script>

export default 
{
    name: 'list-simple-icon',

    computed:
    {
        datavalue()
        {
            return this.data.filter((data) => data.value == this.value )
        }
    },

    props:{

        icon:{
            type: String,
            default: 'mdi-cancel'
        },

        color:{
            type: String,
            default: 'red'
        },

        label: {
            type: String,
            default: null
        },

        size:{
            type: Number,
            default: 24
        }
    },

}
</script>

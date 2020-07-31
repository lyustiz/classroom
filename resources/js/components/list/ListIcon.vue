<template>

    <div>
        <v-tooltip bottom>
            <template v-slot:activator="{ on }">
                <v-icon v-on="on" 
                    :color="datavalue[0].color" 
                    v-text="datavalue[0].icon">
                </v-icon>
            </template>
            <span v-text="datavalue[0].label"></span>
        </v-tooltip>
    </div>

</template>

<script>

export default 
{
    name: 'list-icon',

    computed:
    {
        datavalue()
        {
            return this.data.filter((data) => data.value == this.value )
        }
    },

    props:{

        data:{
            type: Array,
            default: () => [ { value: 0, icon: null,  color: null, label: null} ]
        },

        value:{
            type: [String, Number],
            default: 0
        }
    },

}
</script>

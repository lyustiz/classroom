<template>

    <v-menu bottom left>
        
        <template v-slot:activator="{ on }">
            <v-btn :x-small="small" :small="!small" :color="btnColor" fab v-on="on" depressed>
                <v-icon :color="iconColor">mdi-printer</v-icon>
            </v-btn>
        </template>

        <v-list dense nav>
            <v-list-item dense
                v-for="(report, i) in reports"
                :key="i"
                tile
                @click="$emit('onReport', { table: report.table, title: report.title })"
            >
                <v-list-item-action>
                    <v-btn class="grey lighten-4" icon @click="$emit('onReport', { table: report.table, title: report.title })">
                        <v-icon color="indigo">mdi-printer</v-icon>
                    </v-btn>
                </v-list-item-action>

                <v-list-item-title>
                    {{ report.title }}
                </v-list-item-title>
                
            </v-list-item>
        </v-list>
    </v-menu>


</template>

<script>
export default 
{
    name: 'report-menu',
    
    props:{

        reports:{
            type: Array,
            default: () => []
        },

        iconColor:{
            type: String,
            default: 'indigo'
        },

        btnColor:{
            type: String,
            default: 'grey lighten-4'
        },

        item:{
            type: [ Object, Array ],
            default: () => {}
        },

        small:{
            type: Boolean,
            default: true
        },
    },
}
</script>

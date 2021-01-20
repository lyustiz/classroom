<template>

    <v-menu bottom left>
        
        <template v-slot:activator="{ on }">
            <v-btn :x-small="small" :small="!small" :color="btnColor" fab v-on="on" depressed>
                <v-icon :color="iconColor">mdi-dots-vertical</v-icon>
            </v-btn>
        </template>

        <v-list dense nav>
            <v-list-item dense
                v-for="(menu, i) in menus"
                :key="i"
                tile
                @click="$emit('onItemMenu', { action: menu.action, item })"
            >
                <v-list-item-action>
                    <v-btn small icon class="grey lighten-4" @click="$emit('onItemMenu', { action: menu.action, item })">
                        <v-icon color="indigo">{{menu.icon}}</v-icon>
                    </v-btn>
                </v-list-item-action>

                <v-list-item-title>
                    {{ menu.label }}
                </v-list-item-title>
                
            </v-list-item>
        </v-list>
    </v-menu>


</template>

<script>
export default 
{
    name: 'item-menu',
    
    props:{
        menus:{
            type: Array,
            default: () => []
        },

        iconColor:{
            type: String,
            default: 'grey'
        },

        btnColor:{
            type: String,
            default: 'success'
        },

        item:{
            type: [ Object, Array],
            default: () => {}
        },

        small:{
            type: Boolean,
            default: true
        },
    },

    
}
</script>

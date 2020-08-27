<template>

    <v-menu bottom left>
        
        <template v-slot:activator="{ on }">
            <v-btn small class="ml-3" :color="iconColor" fab v-on="on" depressed>
                <v-icon color="grey">mdi-dots-vertical</v-icon>
            </v-btn>
        </template>

        <v-list dense nav>
            <v-list-item
                v-for="(menu, i) in itemsMenu"
                :key="i"
                tile
                @click="$emit('onMenu', { action: menu.action, item })"
            >
                <v-list-item-action>
                    <v-btn class="grey lighten-4" icon @click="$emit('onMenu', { action: menu.action, item })">
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
    name: 'menu-list',
    
    props:{
        itemsMenu:{
            type: Array,
            default: () => []
        },

        iconColor:{
            type: String,
            default: 'transparent'
        },

        item:{
            type: [ Object, Array],
            default: () => {}
        },

        reports:{
            type: Array,
            default: () => []
        }
    },

    created()
    {
        if(this.reports.length > 0)
        {
            //this.itemsMenu
        }
    }

    
}
</script>

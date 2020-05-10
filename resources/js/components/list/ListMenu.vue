<template>

    <v-menu bottom left>
        
        <template v-slot:activator="{ on }">
            <v-btn small class="ml-3 transparent" icon v-on="on">
                <v-icon>mdi-dots-vertical</v-icon>
            </v-btn>
        </template>

        <v-list dense nav>
            <v-list-item
                v-for="(item, i) in itemsMenu"
                :key="i"
                tile
                @click="$emit('onMenu', item.action)"
            >
                <v-list-item-action>
                    <v-btn class="grey lighten-4" icon >
                        <v-icon>{{item.icon}}</v-icon>
                    </v-btn>
                </v-list-item-action>

                <v-list-item-title>
                    {{ item.label }}
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
        }
    },
}
</script>

<template>

    <v-container fluid>

            <v-row >

                <v-flex xs12>

                        <v-card class="mx-2">

                            <v-toolbar flat dense :class="headColor">

                                <v-toolbar-title v-html="title"></v-toolbar-title>

                                <v-spacer></v-spacer>

                                <slot name="HeadTools"></slot>

                                <list-menu :itemsMenu="itemsMenu" @onMenu="$emit('onItemMenu', $event)"></list-menu>

                            </v-toolbar>

                            <v-card-text>
                                <slot></slot>
                            </v-card-text>

                        </v-card>

                </v-flex>

            </v-row>

    </v-container>

</template>

<script>
import ListMenu from './ListMenu'
export default 
{
    name: 'list-container',
    
    components: {
        'list-menu': ListMenu
    },

    props:{
        title:{
            type: String,
            default: ''
        },
        headColor:{
            type: String,
            default: ''
        },
        textColor:{
            type: String,
            default: ''
        },
        loading:{
            type: Boolean,
            default: false
        },
        help:{
            type: Array,
            default: () => []
        },
        itemsMenu:{
            type: Array,
            default: () => [
                {
                    label: 'Refrescar',
                    icon:  'mdi-table-refresh',
                    action: 'refresh'
                }
            ]
        }
    },

}
</script>

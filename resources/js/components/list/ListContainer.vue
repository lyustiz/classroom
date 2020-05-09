<template>

    <v-container fluid>

            <v-row >

                <v-flex xs12>

                        <v-card class="mx-2">

                            <v-toolbar flat dense :class="headColor">

                                <v-toolbar-title v-html="title"></v-toolbar-title>

                                <v-spacer></v-spacer>

                                <slot name="HeadTools"></slot>

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
                                                <v-icon :color="setColor">{{item.icon}}</v-icon>
                                            </v-btn>
                                        </v-list-item-action>

                                        <v-list-item-title>
                                            {{ item.title }}
                                        </v-list-item-title>
                                        
                                    </v-list-item>
                                    </v-list>
                                </v-menu>

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
export default {
    name: 'list-container',
    props:['title', 'help', 'headColor', 'textColor', 'itemsMenu' ],
}
</script>

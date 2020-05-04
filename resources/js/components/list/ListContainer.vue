<template>

    <v-container fluid>

            <v-layout row >

                <v-flex xs12>

                        <v-card>

                            <v-toolbar :class="headColor" dark>

                                <h3>{{titulo}}</h3>

                                <v-spacer></v-spacer>

                                <slot name="HeadTools"></slot>

                            </v-toolbar>

                            <v-card-text>
                                <slot></slot>
                            </v-card-text>

                        </v-card>

                </v-flex>

            </v-layout>

    </v-container>

</template>

<script>
export default {
    name: 'list-container',
    props:['titulo', 'help', 'headColor', 'textColor' ],
}
</script>

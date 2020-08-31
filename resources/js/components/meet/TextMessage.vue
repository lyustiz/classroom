<template>

    <v-menu bottom left v-model="menu" :close-on-click="false" :close-on-content-click="false" min-width="400" content-class="rounded-lg">
        
        <template v-slot:activator="{ on }">
                <v-btn fab dark x-small class="ma-1 ml-4" color="transparent" depressed v-on="on">
                <v-icon color="grey lighten-2">mdi-email-send-outline</v-icon>
            </v-btn>
        </template>

        <v-card>

            <v-card-text class="pa-2">

                <v-textarea
                    v-model="message"
                    label="Mensaje"
                    rows="3"
                    filled
                    rounded
                    single-line
                    hide-details
                ></v-textarea>

                <v-row no-gutters justify="end" class="mt-1">
                    <v-btn fab depressed x-small color="error" class="mr-1" @click="cancel()">
                        <v-icon>mdi-reply</v-icon>
                    </v-btn>
                    <v-btn fab depressed small color="success" @click="sendMessage()">
                        <v-icon>mdi-send</v-icon>
                    </v-btn>
                </v-row>

            </v-card-text>
        </v-card>
    </v-menu>

</template>

<script>

export default {

    data: () => ({
        menu:    false,
        message: null
    }),

    methods:
    {
        cancel()
        {
            this.menu    = false
            this.message = null
        },

        sendMessage()
        {
            this.$emit('send-message', this.message )
            this.menu    = false
            this.message = null
        }
    }
}
</script>

<style >
</style>

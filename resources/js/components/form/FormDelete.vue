<template>

    <v-dialog
        v-model="dialog"
        scrollable  
        persistent 
        max-width="500px"
        transition="dialog-transition"
        >
        <v-card>
            <v-card-title>
                <h3 >{{ title }}</h3>
            </v-card-title>

            <v-card-text>
                <v-icon class="yellow--text">{{ icon }}</v-icon> {{ message }} 
            </v-card-text>

            <v-card-actions>
                <v-btn color="success" @click="$emit('confirm')">confirmar</v-btn>
                <v-btn color="error" @click="$emit('cancel')">cancelar</v-btn>
            </v-card-actions>

        </v-card>

    </v-dialog>
  
</template>

<script>
export default {

    props: {
        title: {
            type: String,
            default: 'Atencion'
        },
        icon: {
            type: String,
            default: 'warning'
        },
		message: {
            type: String,
            default: null
        },
        dialog:{
            type: Boolean,
            default: false
        },
	},

}
</script>


<template>

    <v-dialog
        v-model="dialog"
        scrollable  
        persistent 
        max-width="500px"
        transition="dialog-transition"
        content-class="rounded-xl"
        >
        <v-card class="rounded-xl">

            <v-toolbar dark flat color="red">

                <v-btn icon x-small dark class="mx-1" @click.native="$emit('deleteCancel')">
                    <v-icon>mdi-close-circle</v-icon>
                </v-btn>

                <v-toolbar-title>Atencion</v-toolbar-title>

                <v-spacer></v-spacer>
        
            </v-toolbar>

            <v-card-text class="pt-4">

                <v-alert flat border="left" colored-border type="warning" :icon="icon">
                    {{ message }}
                </v-alert>

            </v-card-text>

            <v-card-actions>

                <v-spacer></v-spacer>
                
                <v-tooltip bottom>
                    <template v-slot:activator="{ on }">
                        <v-btn fab small class="error mx-1" :loadin="loading" v-on="on" @click="$emit('deleteItem')" >
                            <v-icon>delete</v-icon>
                        </v-btn>
                    </template>
                    <span>Eliminar</span>
                </v-tooltip>

                <v-tooltip bottom>
                    <template v-slot:activator="{ on }">
                        <v-btn fab small class="warning mx-1" :loadin="loading" v-on="on" @click="$emit('deleteCancel')">
                            <v-icon>reply</v-icon>
                        </v-btn>
                    </template>
                    <span>Regresar</span>
                </v-tooltip>

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
            default: ''
        },
        dialog:{
            type: Boolean,
            default: false
        },
        loading:{
            type: Boolean,
            default: false
        },
    },
 

}
</script>


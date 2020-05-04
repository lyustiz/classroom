<template>
<v-layout row wrap>

    <v-spacer></v-spacer>

    <div v-if="action=='upd'">

        <v-tooltip top>
            <template v-slot:activator="{ on }">
                <v-btn 
                    v-on="on" 
                    fab small 
                    @click="update" 
                    :disabled="!valid" 
                    :loading:="loading" 				
                    :class="$App.theme.button.update"
                >
                    <v-icon>edit</v-icon>
                </v-btn>
            </template>
            <span>Editar</span>
        </v-tooltip>

    </div>

    <div v-else>
	
        <v-tooltip top>
            <template v-slot:activator="{ on }">
                <v-btn 
                    v-on="on" 
                    fab small 
                    @click="store" 
                    :disabled="!valid"
                    :loading:="loading" 
                    :color="$App.theme.button.insert"
                >
                    <v-icon>save_alt</v-icon>
                </v-btn>
            </template>
            <span>Guardar</span>
        </v-tooltip>

    </div>

    <v-tooltip top>
        <template v-slot:activator="{ on }">
            <v-btn  
                v-on="on" 
                fab small 
                @click="clear" 
                :loading:="loading" 			  
                :color="$App.theme.button.reset"
            >
                <v-icon>refresh</v-icon>
            </v-btn>
        </template>
        <span>Resetear</span>
    </v-tooltip>

    <v-tooltip top>
        <template v-slot:activator="{ on }">
        <v-btn v-on="on" fab small @click="cancel" :class="$App.theme.button.cancel">
            <v-icon>reply</v-icon>
        </v-btn>
        </template>
        <span>Cancelar</span>
    </v-tooltip>

</v-layout>
</template>

<script>
export default {
    props: ['action', 'valid', 'loading'],
    methods:{

        update(){
           this.$emit('update');
        },
        store(){
            this.$emit('store');
        },
        clear(){
            this.$emit('clear');
        },
        cancel(){
            this.$emit('cancel');
        }
    }
}
</script>

<style>
</style>

<template>
<div class="button-container">

        <v-tooltip bottom :color="$App.theme.button.update" v-if="upd">
            <template v-slot:activator="{ on }">
                <v-btn v-on="on" fab dark x-small :color="$App.theme.button.update" @click="update" class="my-1 mr-1" :loading="loading" depressed>
                    <v-icon>mdi-lead-pencil</v-icon>
                </v-btn>
            </template>
            Editar
        </v-tooltip>

        <v-tooltip bottom :color="$App.theme.button.delete" v-if="del">
            <template v-slot:activator="{ on }">
                <v-btn v-on="on" fab dark x-small :color="$App.theme.button.delete" @click="deleter" class="my-1 mr-1" :loading="loading" depressed>
                    <v-icon>delete</v-icon>
                </v-btn>
            </template>
            Eliminar
        </v-tooltip>

        <slot></slot>

  </div>
</template>

<script>
export default {
    data(){
        return {
            fab: false
        }
    },
    methods:
    {
        deleter()
        {
            this.$emit('delete');
        },
        update()
        {
            this.$emit('update');
        },
    },
    props:{
        upd: {
            type: Boolean,
            default: true
        },

        del: {
            type: Boolean,
            default: true
        },

        loading:{
            type: Boolean,
            default: false
        }
    }
}
</script>

<style scoped>
.button-container {
    min-width: 78px;           
}
</style>

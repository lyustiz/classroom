<template>
<div class="table-cell">
   <!--  <v-speed-dial 
        v-model="fab"
        direction="left" 
        :open-on-hover="!isAutoOpen"
        class="my-1"
    >

        <template v-slot:activator >
            <v-btn v-model="fab" x-small :color="(color) ? color : $App.theme.button.actions" dark small fab >
                <v-icon v-if="!fab">{{ icon }}</v-icon>
                <v-icon v-else>close</v-icon>
            </v-btn>
        </template> -->

        <v-btn fab dark x-small :color="$App.theme.button.update" @click="update" class="my-1 mr-1" :loading="loading">
            <v-icon>mdi-lead-pencil</v-icon>
        </v-btn>

        <v-btn fab dark x-small :color="$App.theme.button.delete" @click="deleter" class="my-1 mr-1" :loading="loading">
            <v-icon>delete</v-icon>
        </v-btn>

        <slot></slot>

  <!--   </v-speed-dial> -->
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
    computed:
    {
        isAutoOpen()
        {
            return (this.auto) ? true : false;
        }
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
        icon:{
            type: String,
            default: 'mdi-file-document-edit'
        },
        color:{
            type: String,
            default: null
        },
        auto:{
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
.buttonContainer {
             
}
</style>

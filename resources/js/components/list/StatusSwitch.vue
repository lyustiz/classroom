<template>
        <v-switch 
            :input-value="item.id_status"
            @change="changeStatus($event)"
            inset 
            dense
            hide-details
            :readonly="readOnly"
            :loading="loading" 
            :true-value="1"
            :false-value="2"
            color="green">
        </v-switch>
</template>

<script>
export default {
    props:{
        color:{
            type: String,
            default: 'green'
        },
        loading:{
            type: Boolean,
            default: false
        },
        item:{
            type: Object,
            default: () => {}
        }
    },
    computed:
    {
        readOnly()
        {
            return this.loading
        }
    },
    created()
    {
       /*  if(this.item)
        {
            this.id_status = this.item.id_status 
        }

        console.log(this.$props) */
        
    },


    data(){
        return {
            id_status: null
        }
    },
    methods:
    {
        changeStatus(status)
        {
            if(this.loading)
            {
                return
            }
            this.$emit('onChangeStatus', { id: this.item.id, status: status })
        }
    },
    
}
</script>


<style scoped>
    .v-input--selection-controls
    {
        margin-top: 0px !important;
    }
</style>
<template>
<div class="text-center">
    <v-dialog v-model="showDialog" width="365" content-class="rounded-xl">
        
        <template v-slot:activator="{ on }">
            <v-btn icon v-on="on">
                <v-icon >help</v-icon>
            </v-btn>
        </template>

        <v-card :loading="loading" class="rounded-xl">

            <app-simple-toolbar title="Ayuda" @closeModal="showDialog = false"></app-simple-toolbar>

             <v-list  dense width="100%"> 

                    <v-list-item> 
                        
                        <v-list-item-avatar color="grey lighten-4">
                            <v-icon  color="green" size="38">mdi-head-cog</v-icon>
                        </v-list-item-avatar>

                        <v-list-item-content>
                        <v-list-item-title>Asistente</v-list-item-title>
                        </v-list-item-content>

                        <v-list-item-action>
                            <v-switch hide-details v-model="showAsistente" inset :loading="loading" color="green" ></v-switch>
                        </v-list-item-action>

                    </v-list-item>
                </v-list>
            
        </v-card>

    </v-dialog>
</div>
</template>

<script>
    export default {
        data () {
            return {
                showDialog: false,
                loading: false,
            }
        },
        computed:
        {
            
            showAsistente:
            {
                get(){
                    return (this.$store.getters['getShowAsistente'] == 1) ? true : false;
                },
                set(show) {
                    this.$store.commit('setShowAsistente', show)
                }
            },


        },

        methods: 
        {
      
        }
    }
</script>

<style scoped>
    .v-input--selection-controls
    {
        margin-top: 0px !important;
    }
</style>
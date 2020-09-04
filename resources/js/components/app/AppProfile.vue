<template>

   <v-card flat>

       <v-card-text class="text-center">

            <v-list-item class="indigo lighten-5 mb-2 rounded-lg">
                <v-list-item-title v-text="user.nb_nombres"></v-list-item-title>
                <v-list-item-action>
                    <v-btn icon>
                        <v-icon>mdi-dots-vertical</v-icon>
                    </v-btn> 
                </v-list-item-action>
            </v-list-item>
           
            <v-avatar size="145" color="indigo">

                 <v-img :src="foto.full_url" alt="alt" v-if="foto" aspect-ratio="32/43" ></v-img>

                 <v-icon size="145" dark v-else>mdi-account</v-icon>

            </v-avatar>

       </v-card-text>
       
   </v-card>
   
</template>

<script>
export default {
    computed: {

        foto() 
        {
            return this.$store.getters['getFoto']
        },

        user()
        {
            return this.$store.getters['getUser']
        },
    }

}
</script>

<style>

</style>
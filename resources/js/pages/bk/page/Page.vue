<template>

<div>

    <v-container fluid mt-2>

        <v-row no-gutters>

            <v-col md="3">
                <v-card class="ma-3"> 
                    <v-img class="blue--text align-end" height="220px" :src="logo"></v-img>
                </v-card>
            </v-col>
            <v-col md="9" >
                <v-card class="ma-3" min-height="220px">
                <v-card-title primary-title>
                    <h3 class="mb-0 blue--text">Bicicle Shop</h3>
                </v-card-title>
                    <v-card-text class="text--primary">
                    <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. 
                        Libero modi et necessitatibus at dicta, 
                        voluptatem distinctio nobis illum dolor! 
                        Quos maiores tenetur fugit delectus illo fugiat commodi dolorem repellat odit.
                        Lorem ipsum dolor sit, amet consectetur adipisicing elit.</p>
                    </v-card-text>
                    <v-card-actions>
                    <v-spacer></v-spacer>
                    <v-btn icon class="red white--text"> <v-icon >mdi-phone</v-icon></v-btn>
                    <v-btn icon class="success white--text"> <v-icon >mdi-whatsapp</v-icon></v-btn>
                    <v-btn icon class="info white--text"> <v-icon>mdi-twitter</v-icon></v-btn>
                    <v-btn icon class="primary white--text"> <v-icon>mdi-facebook</v-icon> </v-btn>
                    </v-card-actions>
                </v-card> 
            </v-col>
        </v-row>

        <v-row no-gutters >
            <v-col md="4" v-for="(item, i) in cards" :key="i">
                
                <v-card class="ma-3">
                        <v-img class="white--text align-end" height="250px" :src="item.src">
                            <v-card-title>{{ item.title }}</v-card-title>
                        </v-img>

                        <v-card-subtitle class="pb-0">Subtitulo</v-card-subtitle>

                        <v-card-text class="text--primary">
                            Lorem ipsum dolor sit amet consectetur adipisicing elit. 
                            Est dolores, temporibus saepe quaerat deleniti maiores eveniet
                        </v-card-text>

                        <v-card-actions>
                            <v-spacer></v-spacer>
                            <v-btn icon> <v-icon>mdi-heart</v-icon>         </v-btn>
                            <v-btn icon> <v-icon>mdi-bookmark</v-icon>      </v-btn>
                            <v-btn icon> <v-icon>mdi-share-variant</v-icon> </v-btn>
                        </v-card-actions>
                </v-card>
            </v-col>
            
        </v-row>
        
    </v-container>



</div>
</template>

<script>

export default {

    data(){
        return {

            clipped:     false,
            drawer:      false,
            drawerRight: true,
            fixed:       false,
            items:       [],
            miniVariant: false,
            right: true,
            cards: [
                { title: 'Foto 1', src: require('~/assets/img/comercio1.jpg') },
                { title: 'Foto 2', src: require('~/assets/img/comercio2.jpg') },
                { title: 'Foto 3', src: require('~/assets/img/comercio3.jpg') },
                { title: 'Foto 4', src: require('~/assets/img/comercio4.jpg') },
                { title: 'Foto 5', src: require('~/assets/img/comercio5.jpg') },
                { title: 'Foto 6', src: require('~/assets/img/comercio6.jpg') }
            ],
            logo: require('~/assets/img/logo-comercio.jpg'), 
        }
    }

}
</script>

<style>

</style>
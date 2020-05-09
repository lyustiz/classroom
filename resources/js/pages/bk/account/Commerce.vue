<template>
<v-container fluid>

    <v-tabs show-arrows icons-and-text :color="color">

        <v-tab>
            Info <v-icon>mdi-storefront</v-icon>
        </v-tab>

        <v-tab>
            Ubicacion <v-icon>mdi-map-marker</v-icon>
        </v-tab>

        <v-tab>
            Contacto <v-icon>mdi-cellphone-message</v-icon>
        </v-tab>
        
        <v-tab-item class="my-3">
            <info-form></info-form>
        </v-tab-item>
        
        <v-tab-item class="my-3">
            <location-form></location-form>
        </v-tab-item>

        <v-tab-item class="my-3">
            <contact-form></contact-form>
        </v-tab-item>

    </v-tabs>
                    
</v-container>
</template>

<script>

import InfoForm from './forms/commerce/InfoForm';
import LocationForm from './forms/commerce/LocationForm';
import ContactForm from './forms/commerce/ContactForm';

export default {

components:{
    'info-form': InfoForm,
    'location-form': LocationForm,
    'contact-form': ContactForm,
},
props:
{
    color:{
        type:       String,
        default:    'info'
    },
},
data(){
    return {
        data: null,
        tab: 2
    }
}
}
</script>

<style>

</style>
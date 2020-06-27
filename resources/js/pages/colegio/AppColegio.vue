<template>
<div>
    
    <v-tabs dark v-model="tab" centered background-color="indigo" slider-color="amber">
    
        <v-tab v-for="(tab,idx) in tabs" :key="idx" :href="`#tab-${idx}`" :disabled="( idx > 0 && !colegio )">
            <v-icon left v-html="tab.icon"></v-icon>
            {{ tab.label }}
        </v-tab> 

    </v-tabs>

    <v-tabs-items v-model="tab">
      
        <v-tab-item
            v-for="(tab,idx) in tabs"
            :key="idx"
            :value="`tab-${idx}`">

            <component :is="tab.component"></component>

        </v-tab-item>

    </v-tabs-items>

</div>

</template>

<script>
import InfoForm     from '@pages/colegio/infoForm'
import LocationForm from '@pages/colegio/locationForm'
import Directiva    from '@pages/directiva/directiva'
import Contacto     from '@pages/colegio/contactoForm'

export default {
    components: {
        'info-form'      : InfoForm,
        'location-form'  : LocationForm,
        'app-directiva'  : Directiva,
        'app-contacto'   : Contacto,
    },
    computed:
    {
        colegio()
        {
            return this.$store.getters['getColegio']
        }
    },
    data() {
        return {
            tab: 0,
            tabs: [
                {
                    label: 'Informacion',
                    icon: 'mdi-information' ,
                    component:'info-form' 
                },
                {
                    label: 'Ubicacion',
                    icon: 'mdi-map-marker',
                    component: 'location-form'
                },
                {
                    label: 'Contacto',
                    icon: 'mdi-contacts',
                    component: 'app-contacto'
                },
                {
                    label: 'Directiva',
                    icon: 'mdi-account-group',
                    component: 'app-directiva'
                },

            ],
            items: [
                {
                    text: 'Configuracion General',
                    disabled: false,
                    href: '/admin',
                },
                {
                    text: 'Colegio',
                },
            ]
         
        }
    },

    methods:
    {

    }
}
</script>

<style>
</style>
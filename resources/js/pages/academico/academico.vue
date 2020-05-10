<template>
<div>
    <v-toolbar color="indigo" dark flat  dense
    >
      <v-breadcrumbs large dark :items="items" divider=">"></v-breadcrumbs>

      <v-spacer></v-spacer>

      <v-btn icon>
        <v-icon>mdi-dots-vertical</v-icon>
      </v-btn>

      <template v-slot:extension>
        <v-tabs v-model="tab" centered slider-color="amber">
          <v-tab v-for="(tab,idx) in tabs" :key="idx" :href="`#tab-${idx}`">
            <v-icon left v-html="tab.icon"></v-icon>
            {{ tab.label }}
          </v-tab>
        </v-tabs>
      </template>

    </v-toolbar>

    <v-tabs-items v-model="tab">
      <v-tab-item
        v-for="(tab,idx) in tabs"
        :key="idx"
        :value="`tab-${idx}`"
      >
          <component :is="tab.component"></component>
      </v-tab-item>
    </v-tabs-items>
</div>

</template>

<script>
import InfoForm from './infoForm'
import LocationForm from './locationForm'
import Directiva    from '@pages/directiva/directiva'

export default {
    components: {
        'info-form'     : InfoForm,
        'location-form' : LocationForm,
        'directiva-list': Directiva
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
                    label: 'Directiva',
                    icon: 'mdi-account-group',
                    component: 'directiva-list'
                },
            ],
            items: [
                {
                    text: 'Configuracion General',
                    disabled: false,
                    href: '/admin',
                },
                {
                    text: 'Academico',
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
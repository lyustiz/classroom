<template>

    <v-card class="mt-3 rounded-xl">

        <v-toolbar color="indigo" flat dark>
            Secciones
        </v-toolbar>

        <v-card-text>

            <v-tooltip top v-for="section in sections" :key="section.name" color="info">
                <template v-slot:activator="{ on }">
                    <v-btn 
                        fab 
                        dark 
                        depressed 
                        v-on="on" 
                        :color="section.color" 
                        @click="showSection(section.component, section.label)" 
                        class="ml-1">
                        <v-icon size="32" v-text="section.icon"></v-icon>
                    </v-btn>
                </template>
                <span v-text="section.label"></span>
            </v-tooltip>

        </v-card-text>
    
       <v-dialog v-model="dialog" max-width="700" content-class="rounded-xl"> 
        
            <component :is="component" inDialog></component>
            
        </v-dialog> 

    </v-card>

</template>

<script>


export default {

    data()
    {
        return {
            component:    null,
            sectionTitle: null,
            dialog:       false,
            sections: [

                    { label: 'Soporte', icon: 'mdi-face-agent', component: '', color: 'green' },
                    { label: 'Pagos', icon: 'mdi-credit-card-multiple', component: '', color: 'orange' },
                ]
        }
    },
    methods:
    {
        showSection(component, label)
        {
            this.dialog       = true
            this.component    = component
            this.sectionTitle = label
        }
    }
}
</script>

<style>

</style>
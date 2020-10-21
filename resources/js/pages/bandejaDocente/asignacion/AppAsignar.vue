<template>

<v-dialog scrollable fullscreen persistent v-model="dialog">

        <template v-slot:activator="{ on, attrs }">
            <v-btn fab dark depressed v-bind="attrs" v-on="on" color="teal" class="ml-1 mt-1">
                <v-icon size="32">mdi-clipboard-check-outline</v-icon>
            </v-btn>
        </template>

    <v-card class="green lighten-5">

        <component :is="component" v-if="component" @closeModal="dialog=false"></component>

    </v-card>

</v-dialog>

</template>

<script>

import SelectGrupo        from './SelectGrupo'

export default {

    components: {
        'select-grupo':       SelectGrupo,
    },

    computed:
    {
        docente()
        {
            return this.$store.getters['getDocente']
        }
    },

    data()
    {
        return {
            component:     'select-grupo',
            dialog: false,
        }
    },

    methods:
    {
        showSection(section)
        {
            this.sectionWidth  = section.sectionWidth
            this.dialog        = true
            this.component     = section.component
            this.sectionTitle  = section.label
        }
    }
}
</script>

<style>

</style>
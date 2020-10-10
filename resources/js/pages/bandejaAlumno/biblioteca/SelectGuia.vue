<template>

    <v-menu offset-x absolute content-class="rounded-lg" min-width="40vw" left>

        <template v-slot:activator="{ on }">
            <app-button v-on="on" small :size="30" innerClass="ma-1" color="teal" label="Guias de Estudio" icon="mdi-clipboard-multiple-outline" ></app-button>
        </template>

        <v-list-item-group color="teal" mandatory>
            <v-list nav>
                <v-toolbar color="teal subtitle-2" dense dark class="rounded-t-lg" flat>
                    Guias de Estudio
                </v-toolbar>
                
                <v-list-item color="teal" v-for="multimedia in multimedias" :key="multimedia.id">
                    <v-list-item-avatar color="white" size="55">
                        <v-icon size="45">mdi-clipboard-text-outline</v-icon>
                    </v-list-item-avatar>
                    <v-list-item-content>
                        <v-list-item-title>{{ multimedia.nb_lectura}}</v-list-item-title>
                        <v-list-item-subtitle>{{ multimedia.tx_descripcion}}</v-list-item-subtitle>
                    </v-list-item-content>
                    <v-list-item-action>
                        <v-btn icon>
                            <v-icon size="25" color="red lighten-1">mdi-open-in-new</v-icon>
                        </v-btn>
                    </v-list-item-action>
                </v-list-item>

            </v-list>
            
        </v-list-item-group>
        
    </v-menu>

</template>

<script>

export default {

    props:
    {
        itemas:{
            type: Array,
            default: () => []
        }
    },

    data()
    {
        return {
            multimedias:[
                { id: 1, nb_lectura: 'Tema 1', tx_descripcion: 'Descripcion del Tema' },

            ],
        }
    },
}

</script>


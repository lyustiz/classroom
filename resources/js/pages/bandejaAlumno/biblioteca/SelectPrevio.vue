<template>

    <v-menu offset-x absolute content-class="rounded-lg" min-width="40vw" left>

        <template v-slot:activator="{ on }">
            <app-button v-on="on" small :size="34" innerClass="ma-1" color="indigo" label="Conocimiento Previo" icon="mdi-head-lightbulb" ></app-button>
        </template>

        <v-list-item-group color="indigo" mandatory>
            <v-list nav dense>
                <v-toolbar color="indigo subtitle-2" dense dark class="rounded-t-lg" flat>
                    Conocimiento Previo
                </v-toolbar>
                
                <v-list-item color="indigo" v-for="previo in previos" :key="previo.id">
                    <v-list-item-avatar color="white" size="45">
                        <v-icon size="35">mdi-lightbulb</v-icon>
                    </v-list-item-avatar>
                    <v-list-item-content>
                        <v-list-item-title>{{ previo.nb_tema}}</v-list-item-title>
                        <v-list-item-subtitle>{{ previo.tx_descripcion}}</v-list-item-subtitle>
                    </v-list-item-content>
                    <v-list-item-action>
                        <v-btn icon>
                            <v-icon size="25" color="red lighten-1">mdi-open-in-new</v-icon>
                        </v-btn>
                    </v-list-item-action>
                </v-list-item>

            </v-list>
            
        </v-list-item-group>
        
          <!--  <v-menu offset-x absolute content-class="rounded-lg" min-width="40vw" left>
                    <template v-slot:activator="{ on }">
                        <app-button v-on="on" small :size="32" innerClass="ma-1" color="blue" label="Enlaces de Intentnet" icon="mdi-earth" ></app-button>
                    </template>
                    <v-list-item-group color="blue" mandatory>
                        <v-list nav>
                            <v-toolbar color="blue lighten-1 subtitle-2" dense dark class="rounded-t-lg" flat>
                                Enlaces Web
                            </v-toolbar>
                            <v-list-item color="blue" link href="https://es.wikipedia.org/wiki/Macroeconom%C3%ADa" target="_blank">
                            <v-list-item-avatar color="white" size="65">
                                <v-icon size="60">mdi-earth</v-icon>
                            </v-list-item-avatar>
                            <v-list-item-content>
                                <v-list-item-title>Macroeconomia</v-list-item-title>
                                <v-list-item-subtitle>Wikipedia</v-list-item-subtitle>
                            </v-list-item-content>
                            <v-list-item-action>
                                <v-btn icon>
                                    <v-icon size="25" color="red lighten-1">mdi-open-in-new</v-icon>
                                </v-btn>
                            </v-list-item-action>
                            </v-list-item>
                        </v-list>
                    </v-list-item-group>
                </v-menu> -->
        
    </v-menu>

</template>

<script>

export default 
{
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
            previos:[
                { id: 1, nb_previo: 'Tema 1', tx_descripcion: 'Descripcion del Tema' },

            ],
        }
    },
}

</script>


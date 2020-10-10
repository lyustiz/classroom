<template>

    <v-menu offset-x absolute content-class="rounded-lg" min-width="40vw" left>

        <template v-slot:activator="{ on }">
            <app-button v-on="on" small :size="32" innerClass="ma-1" color="blue" label="Enlaces de Intentnet" icon="mdi-earth" ></app-button>
        </template>

        <v-list-item-group color="blue" mandatory>
            <v-list nav>
                <v-toolbar color="blue subtitle-2" dense dark class="rounded-t-lg" flat>
                    Enlaces de Intentnet
                </v-toolbar>
                
                <v-list-item color="blue" v-for="lectura in lecturas" :key="lectura.id" link href="https://es.wikipedia.org/wiki/Macroeconom%C3%ADa" target="_blank">
                    <v-list-item-avatar color="white" size="55">
                        <v-icon size="45">mdi-earth</v-icon>
                    </v-list-item-avatar>
                    <v-list-item-content>
                        <v-list-item-title>{{ lectura.nb_lectura}}</v-list-item-title>
                        <v-list-item-subtitle>{{ lectura.tx_descripcion}}</v-list-item-subtitle>
                    </v-list-item-content>
                    <v-list-item-action>
                        <v-btn icon>
                            <v-icon size="25" color="red lighten-1">mdi-link</v-icon>
                        </v-btn>
                    </v-list-item-action>
                </v-list-item>

            </v-list>
            
        </v-list-item-group>
        
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
            lecturas:[
                { id: 1, nb_lectura: 'Macroeconomia', tx_descripcion: 'Wikipedia' },

            ],
        }
    },
}

</script>


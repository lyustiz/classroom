<template>

    <v-menu offset-x absolute content-class="rounded-lg" min-width="40vw" left>

        <template v-slot:activator="{ on }">
            <app-button v-on="on" small :size="28" innerClass="ma-1" color="purple" label="Lectura Complementaria" icon="mdi-book-multiple" ></app-button>
        </template>

        <v-list-item-group color="purple" mandatory>
            <v-list nav>
                <v-toolbar color="purple subtitle-2" dense dark class="rounded-t-lg" flat>
                    Lectura Complementaria
                </v-toolbar>
                
                <v-list-item color="purple" v-for="lectura in lecturas" :key="lectura.id">
                    <v-list-item-avatar color="white" size="55">
                        <v-icon size="45">mdi-book-outline</v-icon>
                    </v-list-item-avatar>
                    <v-list-item-content>
                        <v-list-item-title>{{ lectura.nb_lectura}}</v-list-item-title>
                        <v-list-item-subtitle>{{ lectura.tx_descripcion}}</v-list-item-subtitle>
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
                { id: 1, nb_lectura: 'Tema 1', tx_descripcion: 'Descripcion del Tema' },

            ],
        }
    },
}

</script>


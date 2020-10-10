<template>

    <v-menu offset-x absolute content-class="rounded-lg" min-width="40vw" left>

        <template v-slot:activator="{ on }">
            <app-button v-on="on" small :size="30" innerClass="ma-1" color="orange" label="Lista de Temas" icon="mdi-format-list-bulleted-square" ></app-button>
        </template>

        <v-list-item-group color="orange" mandatory>
            <v-list nav dense>
                <v-toolbar color="orange lighten-1 subtitle-2" dense dark class="rounded-t-lg" flat>
                    Temas
                </v-toolbar>
                
                <v-list-item color="orange" v-for="tema in temas" :key="tema.id">
                    <v-list-item-avatar color="white" size="45">
                        <v-icon size="35">mdi-notebook</v-icon>
                    </v-list-item-avatar>
                    <v-list-item-content>
                        <v-list-item-title>{{ tema.nb_tema}}</v-list-item-title>
                        <v-list-item-subtitle>{{ tema.tx_descripcion}}</v-list-item-subtitle>
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
            temas:[
                { id: 1, nb_tema: 'Tema 1', tx_descripcion: 'Macroeconomia' },
                { id: 2, nb_tema: 'Tema 2', tx_descripcion: 'Ciclos Economicos' },
                { id: 3, nb_tema: 'Tema 3', tx_descripcion: 'Economia Nacional' },
                { id: 4, nb_tema: 'Tema 4', tx_descripcion: 'Los Impuestos' },
                { id: 5, nb_tema: 'Tema 5', tx_descripcion: 'Macroeconomia' },
                { id: 6, nb_tema: 'Tema 6', tx_descripcion: 'Macroeconomia' },
            ],
        }
    },
}

</script>


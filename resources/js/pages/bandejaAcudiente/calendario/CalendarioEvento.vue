<template>
  <v-card class="rounded-xl">

        <v-toolbar color="indigo" dark flat>
            <div class="col-11">
                Eventos
            </div>
            <v-btn icon x-small  dark @click="$emit('closeModal')"><v-icon>mdi-close-circle</v-icon></v-btn>
        </v-toolbar>


        <v-card-text class="pt-4"> 

            <v-list three-line>

                <v-list-item  v-for="(event, i) in events" :key="i">
                    <v-tooltip bottom :color="event.color">
                        <template v-slot:activator="{ on }">
                            <v-list-item-avatar size="46" :color="event.color" v-on="on" >
                                <v-icon size="30" color="white">{{event.icon}}</v-icon>
                            </v-list-item-avatar>
                        </template>
                        <span v-text="`Tipo: ${event.type} - Categoria: ${event.category}`"></span>
                    </v-tooltip>

                    <v-list-item-content>
                        <v-list-item-title v-html="event.name"></v-list-item-title>
                        <v-list-item-subtitle v-html="event.description"></v-list-item-subtitle>
                    </v-list-item-content>

                </v-list-item>
            </v-list>

        </v-card-text>

    </v-card>
  
</template>

<script>
import AppData from '@mixins/AppData';
import AppNotificacion from '@pages/notificacion/AppNotificacion';
export default {

    mixins:     [ AppData ],

    components:
    {
        'app-notificacion' : AppNotificacion
    },

    props:
    {
        events: {
            type:       Array,
            default:    () => []
        },
    },

    data()
    {
        return{
            notificacion:       {}
        }
    },

    methods:
    {
        addNotificacion(event)
        {
            this.notificacion = {
                tipoDestinatario: 4,
                tipoNotificacion: 2,
                tipoPrioridad:    1,
                idDestinatario:   1,//,
                asunto:           event.name,
                mensaje:          event.description,
                lugar:            'N/A',
                fecha:            event.date,
                inicio:           this.hourFromDate(event.start),
                fin:              this.hourFromDate(event.end)
            }
            
        },

        closeDialog(dialog)
        {
            this[dialog] = false
            this.notificacion = {}
        }
    }
}
</script>

<style>

</style>
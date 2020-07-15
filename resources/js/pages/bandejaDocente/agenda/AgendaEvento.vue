<template>
  <v-card class="rounded-xl">

        <v-toolbar :color="event.color" dark flat>
            <div class="col-11">
                <v-icon v-text="event.icon" class="mr-2"></v-icon>
                {{event.name}}
            </div>
            <v-btn icon x-small  dark @click="$emit('closeModal')"><v-icon>mdi-close-circle</v-icon></v-btn>
        </v-toolbar>

        <v-card-text class="pt-4"> 

        <h3 class="indigo--text">
            {{event.category}}
        </h3>

        <v-row>
            <v-col cols="4">
                <v-chip  color="cyan lighten-2" dark>
                    <v-icon left>mdi-calendar-today</v-icon> {{event.start | formatDate }}
                </v-chip>
            </v-col>
            <v-col >
                <v-chip  color="green lighten-2" dark outlined>
                    <v-icon left>mdi-clock</v-icon> {{event.start | hourFromDate | formatTime }}
                </v-chip>
                <v-chip color="amber lighten-2" dark outlined>
                    <v-icon left>mdi-clock</v-icon> {{event.end | hourFromDate | formatTime }}
                </v-chip>
            </v-col>
        </v-row>

        <v-row>
            <v-col v-if="event.type == 'horario'">
                <v-list two-line>
                    
                    <v-list-item>
                        <v-list-item-avatar :color="event.color">
                            <v-icon dark>mdi-chair-school</v-icon>
                        </v-list-item-avatar>
                        <v-list-item-content>
                            <v-list-item-title v-html="event.classroom"></v-list-item-title>
                            <v-list-item-subtitle v-html="event.location"></v-list-item-subtitle>
                        </v-list-item-content>
                    </v-list-item>

                    <v-list-item>
                        <v-list-item-avatar :color="event.color">
                            <v-icon dark>mdi-account-tie</v-icon>
                        </v-list-item-avatar>
                        <v-list-item-content>
                            <v-list-item-title>{{event.teacher}}</v-list-item-title>
                        </v-list-item-content>
                    </v-list-item>
                    
                </v-list>
            </v-col>

            <v-col v-else-if="event.type == 'evaluacion'">

                <v-list >
                    <v-list-item two-line>
                        <v-list-item-avatar :color="event.color">
                            <v-icon dark>mdi-percent</v-icon>
                        </v-list-item-avatar>
                        <v-list-item-content>
                            <v-list-item-title>{{event.weight}} %</v-list-item-title>
                        </v-list-item-content>
                    </v-list-item>
                    <v-list-item>
                        <v-list-item-avatar :color="event.color">
                            <v-icon dark>mdi-note-text</v-icon>
                        </v-list-item-avatar>
                        <v-list-item-content>
                            <v-list-item-title v-html="event.topic"></v-list-item-title>
                            <v-list-item-subtitle v-html="event.description"></v-list-item-subtitle>
                        </v-list-item-content>
                    </v-list-item>
                </v-list>
                
            </v-col>

            <v-col v-else>
                <p>{{event.description}}</p>
            </v-col>
        </v-row>

        </v-card-text>
            
    </v-card>
  
</template>

<script>
import AppData from '@mixins/AppData';
export default {
    mixins:     [ AppData ],

    props:
    {
        event: {
            type:       Object,
            default:    () => {}
        },
    },

    data()
    {
        return {
            
        }
    }
}
</script>

<style>

</style>
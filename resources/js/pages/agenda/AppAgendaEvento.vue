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

        <h3>
             Agenda: {{event.category}}
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
            <v-col>
                <p>{{event.description}}</p>
            </v-col>
        </v-row>

        </v-card-text>

        <v-card-actions>
            <v-spacer></v-spacer>
            <v-btn fab dark x-small color="red" @click="$emit('delete', event)">
                <v-icon>mdi-delete</v-icon>
            </v-btn>
           <!--  <v-btn fab dark x-small color="amber">
                <v-icon>mdi-lead-pencil</v-icon>
            </v-btn> -->
        </v-card-actions>
            
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
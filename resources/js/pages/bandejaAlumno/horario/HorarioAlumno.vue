<template>

  <v-card class="dialog-container" height="90vh">

    <v-card-title class="pa-0">
        <app-simple-toolbar title="Horario" @closeModal="$emit('closeModal')"></app-simple-toolbar>
    </v-card-title>
      
    <v-card-text class="pa-1">
   
    <div id="grid" class="white dialog-contend">

        <v-sheet :min-width="130"  v-for="(columna, dia) in columnas" class="grey lighten-4 ma-1 pa-1 rounded-lg " :key="dia" >
            
            <v-card-title class="py-1 body-2">
                {{columna}}
            </v-card-title>

            <v-sheet color="transparent">
                
                <div v-for="(item, idx) in items.carga_horaria" :key="idx" >

                    <template v-if="showItem(item, dia).show">
                        <horario-item :item="showItem(item, dia).item"></horario-item> 
                    </template>

                    <template v-else>
                                                    
                            <!-- Sin item -->
                            <v-sheet 
                                v-if="showItem(item, dia).isDay == false && item.bo_receso == 0 && columna != 'hora'"
                                :color="itemColor(item)" 
                                :height="itemHeight(item)" 
                                class="mt-2 pa-1 item-empty rounded-lg"
                            >   
                                <v-btn icon @click="insertForm(item, dia)">
                                    <v-icon color="cyan lighten-4" size="40">mdi-plus-circle-outline</v-icon>
                                </v-btn>
                            </v-sheet>

                            <!-- Columna Hora -->
                            <v-sheet 
                                v-if="columna == 'hora'"
                                :color="itemColor(item)" 
                                :height="itemHeight(item)" 
                                class="mt-2 pa-1 item-empty rounded-lg"
                            >   
                                {{ item.hh_inicio }} -  {{ item.hh_fin }}
                            </v-sheet>

                            <!-- Actividad Receso -->
                            <v-sheet 
                                v-if="item.bo_receso == 1 && columna != 'hora'"
                                :color="itemColor(item)" 
                                :height="itemHeight(item)" 
                                class="mt-2 pa-1 item-empty rounded-lg"
                            >   
                                {{ item.nb_carga_horaria }}
                            </v-sheet>

                    </template>
                </div>

            </v-sheet>
            
        </v-sheet>

        <v-overlay
            absolute
            :opacity="0.3"
            :value="loading"
            :z-index="10">
            <v-icon size="40" class="mdi-spin">mdi-loading</v-icon>
        </v-overlay>

    </div>
    </v-card-text>
   </v-card>
    
</template>

<script>
import AppData from '@mixins/AppData';
import HorarioItem from './HorarioItem';

export default {

    components: {
        'horario-item' : HorarioItem
    },

    mixins:     [ AppData],

    props:
    {
        alumno: {
            type:       Object,
            default:    () => {}
        },
    },

    watch:
    {
        alumno(alumno)
        {
            if(this.alumno)
            {
                this.list()    
            }
        }
    },

    created()
    {
        if(this.alumno)
        {
            this.list()    
        }
    },

    data () 
    {
        return {

            columnas: ['hora', 'lun.','mar.','mie.','jue.','vie.'],

            item: null,

            cargaHoraria: {},

            dia: null
        } 
    },

    methods:
    {
        list()
        {
            this.getResource(`horario/alumno/${this.alumno.id}`).then(data => this.items = data);
        },
        
        itemColor(item)
        {
            return (item.bo_receso == 0) ? 'grey lighten-5': 'green lighten-4'
        },

        itemHeight(item)
        {
            return (item.bo_receso == 0) ? '70': '30'
        },

        showItem(data, dia)
        {            
            let item, hasData, isDay, hidden, show = false

            hasData = (data.detalle_horario.length > 0) ? true : false

            item    = (hasData) ? data.detalle_horario.filter((detail) => detail.id_dia_semana == dia ) : []

            isDay   = (item.length > 0) ? true : false;
                        
            hidden  = (isDay) ? ( item[0].nu_carga_horaria == 0 ) : false

            show    = (hasData && isDay && !hidden);

            return  { show, hasData, isDay, hidden, item: item[0] }
        },
    }
}
</script>

<style scoped>

#grid {
    display: grid;
    grid-template-columns: repeat(6, 1fr);;
    grid-template-rows: auto auto auto auto auto auto auto auto auto auto auto auto;
}
.item-empty{
    display: flex;
    justify-items: center;
    justify-content: center;
    align-items: center;
    height: 100%;
}
</style>
<template>

  <div id="grid" class="white">

        <v-sheet :min-width="130"  v-for="(columna, dia) in columnas" class="grey lighten-4 ma-1 pa-2" :key="dia" >
            
            <v-card-title class="py-1 body-2">
                {{columna}}
            </v-card-title>

            <v-sheet color="transparent">
                
                <div  v-for="(item, idxItem) in items" :key="idxItem" >

                    <template v-if="showActividad(item, dia).show">

                        <actividad-item 
                            :actividad="showActividad(item, dia).actividad"
                            @update="updateForm(item, showActividad(item, dia).actividad, dia)" 
                            @delete="deleteForm(showActividad(item, dia).actividad)"
                        ></actividad-item> 

                    </template>

                    <template v-else>
                                                    
                            <!-- Sin actividad -->
                            <v-sheet 
                                v-if="showActividad(item, dia).isDay == false && item.bo_receso == 0 && columna != 'hora'"
                                :color="itemColor(item)" 
                                :height="itemHeight(item)" 
                                class="mt-2 pa-1 item-no-actividad">   
                            
                                <v-btn icon @click="insertForm(item, dia)">
                                    <v-icon color="cyan lighten-4" size="40">mdi-plus-circle-outline</v-icon>
                                </v-btn>

                            </v-sheet>

                            <!-- Columna Hora -->
                            <v-sheet 
                                v-if="columna == 'hora'"
                                :color="itemColor(item)" 
                                :height="itemHeight(item)" 
                                class="mt-2 pa-1 item-no-actividad">   

                                {{ item.hh_inicio }} -  {{ item.hh_fin }}

                            </v-sheet>

                            <!-- Actividad Receso -->
                            <v-sheet 
                                v-if="item.bo_receso == 1 && columna != 'hora'"
                                :color="itemColor(item)" 
                                :height="itemHeight(item)" 
                                class="mt-2 pa-1 item-no-actividad">   

                                {{ item.nb_carga_horaria }}

                            </v-sheet>

                    </template>
                </div>

            </v-sheet>
            
        </v-sheet>

        <v-dialog
            v-model="modal"
            max-width="400px">
            <v-container>
                <actividad-form
                :action="action"
                :item="item"
                :cargaHoraria="cargaHoraria"
                :horario="horario"
                :dia="dia"
                @closeModal="closeModal()"></actividad-form>
            </v-container>
        </v-dialog>

        <form-delete
                :dialog="dialog"
                :loading="loading"
                message="Desea eliminar la actividad Seleccionada?"
                @deleteItem="deleteItem()"
                @deleteCancel="deleteCancel()"
        ></form-delete>

         <v-overlay
            absolute
            :opacity="0.3"
            :value="loading"
            :z-index="10">
            <v-icon size="40" class="mdi-spin">mdi-loading</v-icon>
        </v-overlay>

 </div>
    
</template>

<script>
import listHelper from '@mixins/Applist';
import ActividadForm from './actividadForm';
import ActividadItem from './actividadItem';

export default {

    components: {
        'actividad-form' : ActividadForm,
        'actividad-item'  : ActividadItem
    },

    mixins:     [ listHelper],

    props:
    {
        horario: {
            type:       Object,
            default:    () => {}
        },
    },

    data () 
    {
        return {

            resource: 'cargaHoraria/horaAcademica/' + this.horario.id_hora_academica,

            columnas: ['hora', 'lun.','mar.','mie.','jue.','vie.'],

            item: null,

            cargaHoraria: {},

            dia: null

        } 
    },
    methods:
    {
        insertForm (cargaHoraria, dia)
        {
            this.action       = 'ins';
            this.modal        = true;
            this.cargaHoraria = cargaHoraria
            this.dia          = dia
            this.item         = {};
        },
        updateForm (cargaHoraria, actividad, dia)
        {
            this.action = 'upd';
            this.modal  = true;
            this.item   = actividad;
            this.cargaHoraria = cargaHoraria
            this.dia          = dia
        },
        deleteItem ()
        {
           
           if(!this.deleteValidation()) return
            
            this.loading = true

            axios.delete( this.apiUrl + 'actividad/' + this.item.id )
            .then(response => 
            {
                this.showMessage(response.data.msj)
                this.item = {};
                this.list();
            })
            .catch(error => 
            {
                this.showError(error)
            })
            .finally( () => 
            {
                this.loading = false
                this.dialog  = false;
            });
        },
        
        itemColor(item)
        {
            return (item.bo_receso == 0) ? 'grey lighten-5': 'green lighten-4'
        },

        itemHeight(item)
        {
            return (item.bo_receso == 0) ? '70': '30'
        },

        showActividad(item, dia)
        {
            let actividad, hasActividad, isDay, hidden, show = false

            hasActividad = (item.actividad.length > 0) ? true : false

            actividad    = (hasActividad) ? item.actividad.filter((act) => act.id_dia_semana == dia ) : []

            isDay        = (actividad.length > 0) ? true : false;
                        
            hidden       = (isDay) ? (actividad[0].nu_carga_horaria == 0) : false

            show         = (hasActividad &&  isDay && !hidden);

            //console.log(actividad, dia, 's', show, 'h',hasActividad, 'd',isDay, 'h',hidden)

            return      {show, hasActividad, isDay, hidden, actividad: actividad[0]}
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
.item-no-actividad{
    display: flex;
    justify-items: center;
    justify-content: center;
    align-items: center;
    height: 100%;
}
</style>
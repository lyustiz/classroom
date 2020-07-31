<template>

  <div id="grid" class="white">

        <v-sheet :min-width="130"  v-for="(columna, dia) in columnas" class="grey lighten-4 ma-1 pa-2 rounded-lg" :key="dia" >
            
            <v-card-title class="py-1 body-2">
                {{columna}}
            </v-card-title>

            <v-sheet color="transparent">
                
                <div  v-for="(item, idxItem) in items" :key="idxItem" >

                    <template v-if="showItem(item, dia).show">

                        <detalle-horario-item 
                            :item="showItem(item, dia).item"
                            @update="updateForm(item, showItem(item, dia).item, dia)" 
                            @delete="deleteForm(showItem(item, dia).item)"
                        ></detalle-horario-item> 

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

        <v-dialog
            v-model="modal"
            max-width="400px" 
            content-class="rounded-xl">
                <detalle-horario-form
                    :action="action"
                    :item="item"
                    :cargaHoraria="cargaHoraria"
                    :horario="horario"
                    :dia="dia"
                    @closeModal="closeModal()">
                </detalle-horario-form>
        </v-dialog>

        <form-delete
            :dialog="dialog"
            :loading="loading"
            message="Desea eliminar el item Seleccionado?"
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
import AppDetalleHorarioForm from './AppDetalleHorarioForm';
import AppDetalleHorarioItem from './AppDetalleHorarioItem';

export default {

    components: {
        'detalle-horario-form' : AppDetalleHorarioForm,
        'detalle-horario-item' : AppDetalleHorarioItem
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

            resource: 'cargaHoraria/horario/' + this.horario.id,

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
            this.action         = 'ins';
            this.modal          = true;
            this.cargaHoraria   = cargaHoraria
            this.dia            = dia
            this.item           = {};
        },

        updateForm (cargaHoraria, item, dia)
        {
            this.action         = 'upd';
            this.modal          = true;
            this.item           = item;
            this.cargaHoraria   = cargaHoraria
            this.dia            = dia
        },

        deleteItem ()
        {
           if( !this.deleteValidation() ) return
            
            this.loading = true

            axios.delete( this.apiUrl + 'detalleHorario/' + this.item.id )
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
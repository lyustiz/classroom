<template>

    <v-card flat :loading="loading">
        
        <v-card-text class="pt-3">
    
            <v-row justify="center"> 
                <v-expansion-panels  focusable class="rounded-xl" accordion>
                    <v-expansion-panel v-for="(item,i) in items" :key="i">
                        <v-expansion-panel-header>


                            <div class="purple--text">
                                <v-icon color="purple" class="mr-1">mdi-bookshelf</v-icon> {{item.nb_materia}}
                            </div>
                        
                        </v-expansion-panel-header>
                            <v-expansion-panel-content>
                                    
                            </v-expansion-panel-content>
                    </v-expansion-panel>
                </v-expansion-panels>
            </v-row>

        </v-card-text>   

    </v-card>

</template>

<script>
import DataHelper from '@mixins/AppData';
export default {

    mixins:     [ DataHelper ],

    created()
    {
        this.getMaterias()
    },

    data () {
        return {
            tarea: null,
            grupo:    1,  //TODO: agregar grupo
            periodo:  null,
            headers:  [
                { text: ' ',        value: 'expand'},
                { text: 'Materia',  value: 'nb_materia' },
            ],
            selects:  
            {
                periodo: 	 [],
            },
            tareas: [
                { nb_tarea: 'Proyecto',   fe_tarea: '20/07/2020', descripcion: "Ciclo de la Naturaleza (Agua, Carbono)" },
                { nb_tarea: 'Maqueta',    fe_tarea: '28/07/2020', descripcion: "Patrimonio Cultural de la Umanidad" },
                { nb_tarea: 'Exposicion', fe_tarea: '10/07/2020', descripcion: "Contaminacion (tipo, conseguencia, medidas)" }
            ]
        }
    },
    methods:
    {
        getMaterias()
        {
           this.getResource( `materia/grupo/${this.grupo}` ).then( data =>  this.items = data )
        }
    }
}
</script>

<style>
</style>
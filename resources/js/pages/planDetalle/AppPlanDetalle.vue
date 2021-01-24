<template>

    <v-card>

        <v-card-title class="pa-0">
            <app-simple-toolbar :title="title" @closeModal="$emit('closeDialog')" dense></app-simple-toolbar>
        </v-card-title>

        <v-card-text>
        <v-form ref="form" v-model="valid" lazy-validation>
            <v-row>
                <v-col>
                    <v-select
                    v-model="temasAsignado"
                    :items="temasAsignar"
                    item-text="nb_tema"
                    item-value="id"
                    :rules="[rules.select]"
                    multiple
                    chips
                    deletable-chips
                    label="Temas"
                    :loading="loading"
                    :readonly="loading"
                    dense
                    filled
                    rounded
                    no-data-text="No existen temas disponibles"
                    ref="temas"
                    ></v-select>
                </v-col>
                <v-col cols="auto">
                    <v-tooltip bottom>
                        <template v-slot:activator="{ on }">
                            <v-btn v-on="on" fab small :color="$App.theme.button.update" @click="update()" :disabled="loading" class="mt-1">
                            <v-icon>edit</v-icon>
                            </v-btn>
                        </template>
                        <span>Editar</span>
                    </v-tooltip>
                </v-col>
            </v-row>
        

            <v-row no-gutters justify="center" class="mt-n6">

                <v-col cols="12" md="8" sd="10">

                <v-list dense color="grey lighten-5 rounded-xl" subheader>

                    <template v-for="(item, idx) in items">
                         <v-subheader 
                            dark 
                            :class="(idx == 0) ? 'indigo rounded-t-xl white--text subtitle-1 pl-6': 'indigo white--text subtitle-1 pl-6'" 
                            :key="'sh'+item.id" 
                            v-if="hasHead(item.tx_origen, idx)"
                            >
                            {{getHeadName(item.tx_origen)}}
                         </v-subheader>
                        
                        <v-list-item :key="item.id">
                            <v-list-item-avatar color="white" size="30">
                                <v-icon :color="item.origen.tx_color" class="" size="25">{{item.origen.tx_icono}}</v-icon>
                            </v-list-item-avatar>
                            <v-list-item-content>
                                <v-list-item-title class="ml-5 subtitle-2">
                                    <template v-if="item.tx_origen == 'tipo_evaluacion'">
                                      {{item.origen.nb_tipo_evaluacion}}
                                    </template>
                                    <template v-else-if="item.tx_origen == 'tipo_asignacion'">
                                       {{item.origen.nb_tipo_asignacion}}
                                    </template>
                                    <template v-if="item.tx_origen == 'rasgo'">
                                      {{item.origen.nb_rasgo}}
                                    </template>
                                </v-list-item-title>
                            </v-list-item-content>
                            <v-list-item-action-text>
                                <v-text-field
                                    :rules="[rules.required]"
                                    v-model="item.nu_peso"
                                    placeholder="0"
                                    suffix="%"
                                    dense
                                    outlined
                                    hide-details
                                    type="number"
                                    class="percent-field white"
                                    :loading="loading"
                                    :readonly="loading"
                                    :error="total > 100"
                                ></v-text-field>
                            </v-list-item-action-text>
                        </v-list-item>

                    </template>

                     <v-list-item dark class="indigo rounded-b-xl mb-n2 mt-1" v-if="items.length > 0">
                        <v-list-item-content>
                            <v-list-item-title class="ml-5 subtitle-1">
                                TOTAL
                            </v-list-item-title>
                        </v-list-item-content>
                        <v-list-item-action-text>
                             <v-text-field
                                :rules="[rules.required]"
                                :value="total"
                                readonly
                                label="Peso"
                                placeholder="0"
                                suffix="%"
                                dense
                                solo-inverted
                                hide-details
                                type="number"
                                class="percent-field my-2"
                                :error="total > 100"
                                ref="total"
                            ></v-text-field>
                        </v-list-item-action-text>
                    </v-list-item>

                    <div v-else class="text-center">
                        <v-icon size="50" class="mdi-spin">mdi-loading</v-icon>
                    </div>
                   
                </v-list>

                </v-col>

                

            </v-row>
        </v-form>    
        </v-card-text>
    </v-card>
  
</template>

<script>
import AppData from '@mixins/AppData';
export default {

    mixins:     [ AppData ],

    props:
    {
        planEvaluacion: {
            type:       Object,
            default:    () => {}
        },

        grupo: {
            type:       Object,
            default:    () => {}
        },

        materia: {
            type:       Object,
            default:    () => {}
        },
    },

    watch: {
        planEvaluacion()
        {
            this.list()
        }
    },

    created()
    {
        this.list()
    },

    computed:
    {
        total()
        {
            let total = 0
            if(this.items.length > 0)
            {
                this.items.forEach(item => {
                    total += parseInt(item.nu_peso)
                })
            }
            return total
        }
    },

    data()
    {
        return{
            title: `Plan Evaluacion - ${this.grupo.nb_grupo} - ${this.materia.nb_materia}`,
            search: null,
            selects: {
                tipoEvaluacion: [],
                rasgo: [],
            },
            temasAsignado: [],
            temasAsignar: [],
            cantidad:{
                evaluaciones: 0,
                asignaciones: 0,
                rasgos:       0
            }
        }
    },

    methods:
    {
        list()
        {
           this.getResource(`planTema/planEvaluacion/${this.planEvaluacion.id}/grupo/${this.planEvaluacion.id_grupo}/materia/${this.planEvaluacion.id_materia}` )
            .then( data =>  {
                this.loading = true
                for (const asignado of data.temasAsignados) {
                    this.temasAsignado.push(asignado.id_tema)
                } 
                this.temasAsignar   = data.temasAsignar
            })
           

            this.getResource(`planDetalle/planEvaluacion/${this.planEvaluacion.id}`).then( data => 
            {
                this.items = data.planDetalle;
                this.selects.tipoEvaluacion = data.combos.tipoEvaluacion
                this.selects.tipoAsignacion = data.combos.tipoAsignacion
                this.selects.rasgo          = data.combos.rasgo
            })

        },

        setCantidades(data)
        {
            this.cantidad.evaluaciones = 0
            this.cantidad.asignaciones = 0
            this.cantidad.rasgos       = 0

            for (const item of this.items) {
                switch (true) {
                    case item.tx_origen == 'tipo_evaluacion':
                        this.cantidad.evaluaciones++
                        break;
                    case item.tx_origen == 'tipo_asignacion':
                        this.cantidad.asignaciones++
                        break;
                    case item.tx_origen == 'rasgo':
                        this.cantidad.rasgos++
                        break;
                    default:
                        break;
                }
            }
        },

        hasHead(origen, idx)
        {
            return  [0,2,7].includes(idx)
        },

        getHeadName(origen)
        {
            return ( origen == 'rasgo') ? origen + 's' : origen.replace('tipo_', '') + 'es';
        },

        update(item)
        {
           if(!this.validate()) return
  
            let form = {
                detalles:   this.items,
                temas:      this.temasAsignado,
                id_usuario: this.idUser
            }
 
            this.updateResource(`planDetalle/planEvaluacion/${this.planEvaluacion.id}/grupo/${this.planEvaluacion.id_grupo}`, form).then( data =>{
                this.showMessage(data.msj)
            }) 
        },

        validate()
        {           
            if(this.total > 100)  {
                this.showError('La planificacion esta sobre el 100%')
                this.$refs.total.focus()
                return false
            }

            if(this.total < 100) {
                this.showError('La planificacion esta por debajo de 100%')
                this.$refs.total.focus()
                return false
            }

            if(this.temasAsignado.length < 1) { 
                this.showError('Favor asignar temas a la planificacion')
                this.$refs.temas.focus()
                return false
            }

            return true
        }
    }

}
</script>

<style scoped>
    .percent-field {
        width: 82px;
    }
</style>
<template>

<v-row no-gutters class="pt-2">

    <v-col cols="12">
        <v-form ref="formAdd" v-model="valid" lazy-validation class="d-flex">

            <v-select
                :items="selects.tipoEvaluacion"
                item-text="nb_tipo_evaluacion"
                item-value="id"
                v-model="tipoEvaluacion"
                label="Tipo Evaluacion"
                :rules="[rules.select]"
                :loading="loading"
                dense
                class="col-6"
            ></v-select> 

            <v-btn dark fab x-small :loading="loading" color="green" @click="addEvaluacion()" :disabled=" !valid">
                <v-icon size="30">mdi-plus</v-icon>
            </v-btn>

        </v-form>
    </v-col>

    <v-col>
        <v-data-table
            :headers="headers"
            :items  ="evaluaciones"
            :search ="search"
            item-key="id"
            :loading="loading"
            sort-by=""
            disable-filtering
            disable-pagination
            disable-sort
            hide-default-footer
            dense
        >
            <template v-slot:item="{ item }">
                
                <tr>
                    <td class="text-xs-left">
                        {{item.tipo_evaluacion.nb_tipo_evaluacion}}
                    </td>

                    <td class="text-xs-left">
                        
                        <v-edit-dialog
                            :return-value.sync="item.nu_peso"
                            persistent large
                            cancel-text="Cancelar"
                            save-text="Guardar"
                            @save="updateEvaluacion(item)"
                        >
                            <v-chip label outlined link class="percent-field">
                                {{item.nu_peso}}
                                <v-icon size="18" right>mdi-percent</v-icon>
                            </v-chip>
                        
                            <template v-slot:input>
                                <v-text-field
                                    v-model="item.nu_peso"
                                    label="Peso (%)"
                                    :rules="[rules.required, rules.maxNum(100), rules.minNum(1)]"
                                    single-line
                                    type="number"
                                    dense
                                    outlined
                                    autofocus
                                    lass="percent-field"
                                ></v-text-field>
                            </template>
                        </v-edit-dialog>
                    </td>

                    <td class="text-xs-left">

                        <v-edit-dialog
                            :return-value.sync="item.fe_evaluacion"
                            persistent large
                            cancel-text="Cancelar"
                            save-text="Guardar"
                            @save="updateEvaluacion(item)"
                        >
                            <v-chip label outlined link class="date-field text-xs-left">
                                {{item.fe_evaluacion | formatDate }}
                                <v-icon size="18" right>mdi-calendar</v-icon>
                            </v-chip>
                        
                            <template v-slot:input>
                                    <v-date-picker 
                                    v-model="item.fe_evaluacion" >
                                </v-date-picker>
                            </template>
                        </v-edit-dialog>

                    </td>

                    <td class="text-xs-left">

                        <v-edit-dialog
                            :return-value.sync="item.tx_tema"
                            persistent large
                            cancel-text="Cancelar"
                            save-text="Guardar"
                            @save="updateEvaluacion(item)"
                        >
                            <v-chip label outlined link class="tema-field">
                                {{item.tx_tema}}
                                <v-icon size="18" right>mdi-event</v-icon>
                            </v-chip>
                        
                            <template v-slot:input>
                                <v-text-field
                                    v-model="item.tx_tema"
                                    :rules="[rules.max(80)]"
                                    label="Tema"
                                    single-line
                                    counter
                                    autofocus
                                ></v-text-field>
                            </template>
                        </v-edit-dialog>
                        
                    </td>

                    <td class="text-xs-left">

                        <v-edit-dialog
                            :return-value.sync="item.tx_observaciones"
                            persistent large
                            cancel-text="Cancelar"
                            save-text="Guardar"
                        >
                            <v-chip label outlined link class="tema-field">
                                {{item.tx_observaciones}}
                                <v-icon size="18" right>mdi-event</v-icon>
                            </v-chip>
                        
                            <template v-slot:input>
                                <v-text-field
                                    v-model="item.tx_observaciones"
                                    :rules="[rules.max(80)]"
                                    label="Observaciones"
                                    single-line
                                    counter
                                    autofocus
                                ></v-text-field>
                            </template>
                        </v-edit-dialog>
                        
                    </td>

                    <td class="text-xs-left">

                        <v-badge left color="red" :value=" (item.archivo) ?    item.archivo.length > 0  : 0" overlap dot bordered >
                            <v-btn fab class="my-1" dark x-small color="cyan lighten-2" @click="addFile(item)" :loading="loading" v-if="item.id">
                                <v-icon>mdi-paperclip</v-icon>
                            </v-btn>
                        </v-badge>

                        <v-btn fab class="my-1" x-small :color="$App.theme.button.delete" @click="deleteEvaluacion(item)" :loading="loading" v-if="item.id">
                            <v-icon>delete</v-icon>
                        </v-btn>

                        <v-btn fab class="my-1" x-small :color="$App.theme.button.insert" @click="storeEvaluacion(item)" :loading="loading" v-if="!item.id">
                            <v-icon>mdi-check</v-icon>
                        </v-btn>

                        <v-btn fab class="my-1" x-small :color="$App.theme.button.delete" @click="cancelEvaluacion(item)" :loading="loading" v-if="!item.id">
                            <v-icon>mdi-window-close</v-icon>
                        </v-btn>

                    </td>
                    </tr>
            </template>

            <template v-slot:body.append="{ items }">
                <tr class="grey lighten-2"> 
                    <td class="font-weight-bold">
                        Total Peso:
                    </td>
                    <td>
                        <v-chip 
                            label outlined 
                            class="percent-field my-1" 
                            :color=" (getTotalPeso(items) > 100) ?  'error': 'green' ">
                            {{ getTotalPeso(items) }}
                            <v-icon size="18" right>mdi-percent</v-icon>
                        </v-chip>
                    </td>
                    <td colspan="4" class="font-weight-bold">
                        Total Evaluaciones: 
                        <v-chip label outlined>
                            {{ (items) ? items.length : 0}}
                        </v-chip>
                    </td>
                </tr>
            </template>

        </v-data-table> 

        <v-dialog
            v-model="modal"
            max-width="500px"
            content-class="rounded-xl"
        >
            <archivo-upload 
                origen="evaluacion"
                :origenId="evaluacionId"
                :tipoArchivo="2"
                :maxItems="2"
                @closeModal="closeModal()"
            ></archivo-upload>
        </v-dialog>

    </v-col>

</v-row>
  
</template>

<script>
import AppData from '@mixins/AppData';
import ArchivoUpload from '@pages/archivo/archivoUpload';
export default {

    components: 
    {
        'archivo-upload': ArchivoUpload
    },

    mixins:     [ AppData ],

    props:
    {
        planEvaluacion: {
            type:       Object,
            default:    () => {}
        },
    },

    watch: {
        planEvaluacion()
        {
            this.evaluaciones = []
            this.list()
        }
    },

    created()
    {
        this.getTiposEvaluacion()
        this.list()
    },

    data()
    {
        return{
            search: null,
            newRowExist: false,
            selects: {
                tipoEvaluacion: []
            },
            tipoEvaluacion: null,
            evaluaciones: [],
             headers: [
                { text: 'Tipo Evaluacion', value: 'tipoEvaluacion' },
                { text: 'Peso',   value: 'nu_peso' },
                { text: 'Fecha',   value: 'fe_evaluacion' },
                { text: 'Tema',   value: 'tx_tema' },
                { text: 'Observaciones',   value: 'tx_observaciones' },
                { text: 'Acciones', value: 'actions', sortable: false, filterable: false },
            ],
            validateForm: false,
            evaluacionId: null
        }
    },

    methods:
    {
        list()
        {
            this.getResource('evaluacion/planEvaluacion/' + this.planEvaluacion.id  )
            .then( data =>  this.evaluaciones = data )

            this.newRowExist = false
        },
        
        getTiposEvaluacion()
        {
            this.getResource('tipoEvaluacion').then( data =>  this.selects.tipoEvaluacion = data )
        },

        addEvaluacion()
        {
            if( !this.$refs.formAdd.validate() ) return
            
            if( this.newRowExist ) return

            if( this.getTotalPeso() > 99 ) return

            let evaluacion = {
                id:                 null,
                id_tipo_evaluacion: this.tipoEvaluacion,
                tipo_evaluacion:    this.getTipoEvaluacion(this.tipoEvaluacion),
                nu_peso:            null, 
                tx_tema:            null, 
                tx_obsevaciones:    null,  
                id_plan_evaluacion: this.planEvaluacion.id,
                id_status:          1,
            }

            this.evaluaciones.push( evaluacion );

            this.$refs.formAdd.resetValidation()

            this.newRowExist = true

            this.tipoEvaluacion = null;
        },

        getTipoEvaluacion(id)
        {
            const tipoEvaluacion = (id) ? 
                                   this.selects.tipoEvaluacion.filter( evaluacion => evaluacion.id == id) 
                                   : [{nb_tipo_evaluacion: null}];

            return tipoEvaluacion[0];
        },

        getTotalPeso()
        {
            let totalPeso = 0

            this.evaluaciones.forEach(item => {
                totalPeso += ( item.nu_peso ) ? parseInt(item.nu_peso) : 0
            });
            
            return totalPeso
        },

        deleteEvaluacion(evaluacion)
        {
            if(!evaluacion.id) return 

            this.deleteResource('evaluacion/' + evaluacion.id )
            .then( (data) => {
                this.showMessage(data.msj)
                this.list();
            })
        },

        storeEvaluacion(evaluacion)
        {
            if(!this.validEvaluacion(evaluacion)) return

            evaluacion.id_usuario = this.idUser,

            this.storeResource('evaluacion', evaluacion )
            .then( (data) => {
                this.showMessage(data.msj)
                this.list();
            })
        },

        updateEvaluacion(evaluacion)
        {
            if(!evaluacion.id) return
            
            if(!this.validEvaluacion(evaluacion)) 
            { 
                this.list();
                return
            }

            evaluacion.id_usuario = this.idUser,

            this.updateResource('evaluacion/' + evaluacion.id, evaluacion )
            .then( (data) => {
                this.showMessage(data.msj)
                this.list();
            })
        },

        validEvaluacion(evaluacion)
        {
            if(evaluacion.nu_peso < 1)
            {
                this.showError('Indicar porcentaje valido de la Evaluacion')
                return false
            }

            if(this.getTotalPeso() > 100)
            {
                this.showError('El porcentaje total de la evaluacion no debe sobrepasar el 100%')
                return false
            }

            if(evaluacion.tx_tema == null)
            {
                this.showError('Indicar tema de la Evaluacion')
                return false
            }
            return true
        },

        cancelEvaluacion(item)
        {
            this.evaluaciones = this.evaluaciones.filter( evaluacion => evaluacion.id !== null) 
            this.newRowExist = false
        },

        addFile(item)
        {
            this.evaluacionId = item.id
            this.modal = true
        },

        closeModal()
        {
            this.modal = false
        }
        
    }

}
</script>

<style scoped>
    .percent-field {
        width: 25;
    }
    .date-field{
        width: 120px;
    }
    .tema-field{
        min-width: 180px;
        max-width: 180px;
        text-overflow: ellipsis;
    }
</style>
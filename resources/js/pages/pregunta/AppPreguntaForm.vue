<template>

    <v-form ref="form" v-model="valid" lazy-validation>

    <v-card :loading="loading" flat>

        <v-card-text>

        <v-row no-gutters>

        <v-col cols="12" >
            <v-textarea
                :rules="[rules.required]"
                v-model="form.nb_pregunta"
                label="Pregunta"
                placeholder="Indique Pregunta"
                no-resize
                rows="2"
                dense
                outlined
                prepend-icon="mdi-help"
            ></v-textarea>
        </v-col>

        <v-col cols="12">
            <v-select
            :items="selects.tipoPregunta"
            item-text="nb_tipo_pregunta"
            item-value="id"
            v-model="form.id_tipo_pregunta"
            :rules="[rules.select]"
            label="Tipo Pregunta"
            :loading="loading"
            outlined
            dense
            prepend-icon="mdi-table-of-contents"
            ></v-select>
        </v-col>
 
        <v-col cols="12" md="4">
            <v-text-field
                :rules="[rules.required]"
                v-model="form.nu_valor"
                label="Valor"
                placeholder="Indique Valor"
                type="number"
                dense
                outlined
                prepend-icon="mdi-numeric-10-box"
            ></v-text-field>
        </v-col>

        <v-col cols="12" md="4" v-if="action=='upd'">
            <v-select
            :items="ordenOptions"
            v-model="form.nu_orden"
            :rules="[rules.select]"
            label="Orden"
            :loading="loading"
            outlined
            dense
            class="ml-3"
            prepend-icon="mdi-order-numeric-ascending"
           
            ></v-select>
        </v-col>

            
        <v-col cols="12">
            <v-textarea
                :rules="[rules.max(100)]"
                v-model="form.tx_observaciones"
                label="Texto Ayuda"
                placeholder="Indique Texto Ayuda"
                rows="1"
                dense
                outlined
                prepend-icon="mdi-comment-question"
            ></v-textarea>
        </v-col>

        </v-row>

        </v-card-text>

        <v-card-actions>
            <v-spacer></v-spacer>
            <form-buttons
                @update="update()"
                @store="store()"
                @clear="clear()"
                @cancel="cancel()"
                :action="action"
                :valid="valid"
                :loading="loading"
            ></form-buttons>
        </v-card-actions>

        <pre v-if="$App.debug">{{ $data }}</pre>

    </v-card>
    
    </v-form>

</template>

<script>

import Appform from '@mixins/Appform';

export default {
    mixins: [Appform],

    props: 
    {
        prueba: {
            type:       Object,
            default:    () => {}
        },

        totalPreguntas: {
            type:       Number,
            default:    0
        }
    },

    computed:
    {
        ordenOptions()
        {
            return  Array.from({length: this.totalPreguntas}, (v, i) => i + 1 );
        }     
    },

    watch:
    {
        action(action)
        {
            if(action=='ins')
            {
                this.form.nu_orden = 0
            }
        }
    },

    data() {
        return {
            resource: 'pregunta',
            form:
            {
                id: 	           null,
                id_prueba:         null,
				nb_pregunta: 	   null,
				id_tipo_pregunta:  null,
				bo_opcional: 	   null,
				nu_valor: 	       null,
				nu_orden: 	       null,
				tx_observaciones:  null,
				id_status: 	       null,
				id_usuario: 	   null,
            },
            selects:
            {
                tipoPregunta: 	 [],
            },
            default: {
                bo_opcional:  0,
            },
            defaultForm:{
                bo_opcional:  0,
            },
            menuAyudaOpcional: false
        }
    },

    methods:
    {
        extraActions(method)
        {
            this.form.id_prueba = this.prueba.id
        },
        
    }
}
</script>

<style>
</style>
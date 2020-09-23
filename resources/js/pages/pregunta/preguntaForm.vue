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
 
        <v-col cols="12" md="6">
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
        
        <v-tooltip right v-model="menuAyudaOpcional" color="success" >
        <template v-slot:activator="{ on }">
            <v-checkbox
                v-on="on"
                :rules="[rules.check]"
                v-model="form.bo_opcional"
                label="Opcional"
                :true-value="1"
                :false-value="0"
                :indeterminate="(form.bo_opcional== null)"
                dense
                class="col-auto  ml-3"
                append-icon="mdi-help-rhombus"
                @click:append="menuAyudaOpcional =!menuAyudaOpcional "
            ></v-checkbox>
        </template>
        <span>Indica si la pregunta debe ser obligatoria o no para el total de la calificacion</span>
       </v-tooltip>
            
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

    watch:
    {
        action()
        {
            this.preActionForms()
        }
    },

    data() {
        return {
            resource: 'pregunta',
 
            form:
            {
                id: 	           null,
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
	 	 	 	status: 	     ['/grupo/GRAL'],
            },
            default:{
                nu_orden: 1
            },
            menuAyudaOpcional: false
        }
    },

    methods:
    {
        preActionForms()
        {
            if(this.action == 'ins')
            {
                this.form.bo_opcional = 0;
            }
        },

    }
}
</script>

<style>
</style>
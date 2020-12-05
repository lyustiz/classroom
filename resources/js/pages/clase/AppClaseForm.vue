<template>

    <v-form ref="form" v-model="valid" lazy-validation>

    <v-card :loading="loading" flat>

        <v-card-text>

        <v-row>

            <v-col cols="12">
                <v-select
                    v-model="gradoSelected"
                    :items="grados"
                    item-text="nb_grado"
                    item-value="id"
                    label="Grado"
                    :loading="loading"
                    hide-details
                    dense
                    filled
                    rounded
                    @change="getGrupos($event)"
                    return-object
                ></v-select>
            </v-col>

            <v-col cols="12">
                <v-select
                    v-model="grupoSelected"
                    :items="grupos"
                    item-text="nb_grupo"
                    item-value="id"
                    label="Grupo"
                    :loading="loading"
                    hide-details
                    dense
                    filled
                    rounded
                    @change="getMaterias($event)"
                    return-object
                ></v-select>
            </v-col>

            <v-col cols="12">
                <v-select
                    :items="materias"
                    v-model="form.id_materia"
                    item-text="nb_materia"
                    item-value="id"
                    label="Materia"
                    persistent-hint
                    :loading="loading"
                    hide-details
                    dense
                    filled
                    rounded
                ></v-select>
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
        grados: {
            type: Array,
            default: () => {}
        },

        grado: {
            type: Object,
            default: () => {}
        },

        grupo: {
            type: Object,
            default: () => {}
        },

        materia: {
            type: Object,
            default: () => {}
        },

        dia: {
            type: String,
            default: null
        },

        docente: {
            type: Object,
            default: () => {}
        },
    },

    data() {
        return {
            resource:   'clase',
            grupos:     [],
            materias:   [],
            gradoSelected: null,
            grupoSelected: null,
            materiaSelected: null,
            dates:
            {
                fe_clase: 	 null,
            },
            pickers:
            {
                fe_clase: 	 null,
            },
            form:
            {
                id: 	          null,
				id_grado: 	      null,
				id_grupo: 	      null,
				id_materia: 	  null,
				id_docente: 	  null,
				id_status: 	      null,
				id_usuario: 	  null,
            },

            default: 
            {
                id_status: 1,
                id_docente: this.docente.id
            }
        }
    },

    methods:
    {
        onCreateForm()
        {
            if(this.grado) { 
                this.form.id_grado = this.grado.id 
                this.gradoSelected = this.grado
                this.getGrupos(this.grado) 
            }
            if(this.grupo) { 
                this.form.id_grupo = this.grupo.id 
                this.grupoSelected = this.grupo 
                this.getMaterias(this.grupo) 
            }
            if(this.materia) { 
                this.form.id_materia = this.materia.id 
            }
        },
        
        getGrupos(grado)
        {
            this.grupos          = grado.grupo
            this.form.id_grado   = grado.id
            this.form.id_materia = null
        },

        getMaterias(grupo)
        {           
            this.materias      = grupo.materia
            this.form.id_grupo = grupo.id
        },

        postResponse()
        {
            this.$emit('closeDialog', true)
        },

    }
}
</script>

<style>
</style>
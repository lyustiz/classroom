<template>

    <v-form ref="form" v-model="valid" lazy-validation>

    <v-card :loading="loading" >

        <v-card-text>

        <v-row no-gutters="">
                          
        <v-col cols="12">
            <v-select
            :items="selects.aula"
            item-text="nb_aula"
            item-value="id"
            v-model="form.id_aula"
            :rules="[rules.select]"
            label="Aula"
            :loading="loading"
            dense
            filled
            prepend-inner-icon='mdi-chair-school'
            ></v-select>
        </v-col>

        <v-col cols="12">
            <v-select
            :items="selects.docente"
            item-text="nb_docente"
            item-value="id"
            v-model="form.id_docente"
            :rules="[rules.select]"
            label="Docente"
            :loading="loading"
            dense
            filled
            prepend-inner-icon="mdi-account-tie"
            ></v-select>
        </v-col>

         <v-col cols="12">
            <v-select
            :items="materias"
            item-text="nb_materia"
            item-value="id"
            v-model="form.id_materia"
            :rules="[rules.select]"
            label="Materia"
            :loading="loading"
            dense
            filled
            prepend-inner-icon='mdi-file-cad-box'
            ></v-select>
        </v-col>

        <v-input
                label="horas"
                :value="form.nu_carga_horaria"
                class="ml-4 mt-2"
                :rules="[rules.required]"
                dense
            >
            <v-rating v-model="form.nu_carga_horaria" dense x-small length="4">
                <template v-slot:item="props">
                    <v-icon
                        :color="props.isFilled ? 'green': 'grey lighten-1'"
                        large
                        @click="props.click">
                        {{ props.isFilled ? 'mdi-clock-check' : 'mdi-clock-check-outline' }}
                    </v-icon>
                </template>
            </v-rating>
            
            <div class="subtitle-1 green--text px-3 mt-2">{{form.nu_carga_horaria}}</div>
        </v-input>
           
        </v-row>

        </v-card-text>

        <v-card-actions>
            <v-spacer></v-spacer>
            <v-spacer></v-spacer>
            <form-buttons
                @update="update()"
                @store="store()"
                @clear="clear()"
                @cancel="cancel()"
                :action="action"
                :valid="valid"
                :loading:="loading"
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
        horario: {
            type:    Object,
            default: () => {}
        },
        item: {
            type:    Object,
            default: () => {}
        },
        action: {
            type:    String,
            default: null
        },
        cargaHoraria: {
            type:    Object,
            default: () => {}
        },
        dia: {
            type:    Number,
            default: null
        },
    },
    created()
    {
        this.materias = this.horario.grupo.grado.materia
    },
    data() {
        return {
            resource: 'actividad',
            dates:
            {
                
            },
            pickers:
            {
                
            },
            form:
            {
                id:                null,
                id_aula: 	       null,
				id_docente:        null,
                id_materia:        null,
                nu_carga_horaria:  null,
				id_usuario: 	   null,
            },
            selects:
            {
                aula: 	    [],
	 	 	 	docente:    [],
            },
            materias:   [],
            rating:     0
        }
    },

    methods:
    {
        
        store()
        {
            if (!this.$refs.form.validate())  return 

            this.dataCargaHoraria()
			
            this.loading = true;

            axios.post(this.fullUrl, this.form)
            .then(response => 
            {
                this.validResponse(response)
            })
            .catch(error => 
            {
                this.showError(error);
            })
            .finally( () =>
            {
                this.loading = false;
            });
            
        },

        update()
        {
            if (!this.$refs.form.validate())  return 

            this.dataCargaHoraria()
			
            this.loading = true;

             axios.put(this.fullUrlId, this.form)
            .then(response => 
            {
                this.validResponse(response)
            })
            .catch(error =>
            {
                this.showError(error);
            })
            .finally( () =>
            {
                this.loading = false
            }); 

        },

        dataCargaHoraria()
        {
            let materia = this.materias.filter( (materia) => materia.id == this.form.id_materia )
            
            this.form.nb_actividad      = materia.nb_materia
            this.form.id_horario        = this.horario.id
            this.form.id_dia_semana     = this.dia
            this.form.hh_inicio         = this.cargaHoraria.hh_inicio
            this.form.hh_fin            = this.cargaHoraria.hh_fin
            this.form.id_carga_horaria  = this.cargaHoraria.id
            this.form.id_hora_academica = this.horario.id_hora_academica
            this.form.id_status         = 1
            this.form.id_usuario        = this.idUser
        },
    
        addActividad()
        {
            let data = {
                
                aula:    this.selects.aula.filter( (aula) => aula.id == this.form.id_aula ),
                docente: this.selects.docente.filter( (docente) => docente.id == this.form.id_docente ),
                
            }
            this.$emit('addActividad', data)
        }
        
        

    }
}
</script>

<style>
</style>
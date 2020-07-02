<template>

    <v-form ref="form" v-model="valid" lazy-validation>

    <v-card :loading="loading" >

        <v-card-text>

        <v-row>
                 
        <v-col cols="12" md="6">
            <v-text-field
                :rules="[rules.required]"
                v-model="form.nb_tipo_recurso"
                label="Tipo Recurso"
                placeholder="Indique Tipo Recurso"
                dense
            ></v-text-field>
        </v-col>

        <v-col cols="12" md="6">
            <v-select
            :items="selects.tipoArchivo"
            item-text="nb_tipo_archivo"
            item-value="id"
            v-model="form.id_tipo_archivo"
            :rules="[rules.select]"
            label="Tipo Archivo"
            :loading="loading"
            dense
            ></v-select>
        </v-col>
                  
        <v-col cols="12" md="6">
            <v-text-field
                :rules="[rules.required]"
                v-model="form.tx_icono"
                label="Icono"
                placeholder="Indique Icono"
                dense
            ></v-text-field>
        </v-col>
                  
        <v-col cols="12" md="6">
            <v-input
                prepend-icon="mdi-format-color-fill"
                :value="form.tx_color">
                    <div class="mx-2">Color</div>

                    <v-menu offset-y max-width="200">
                        <template v-slot:activator="{ on }">
                            <v-chip slot="activator" v-on="on" small label :color="form.tx_color"></v-chip>
                        </template>
                        <span>
                            <v-card>
                            <v-btn 
                                v-for="color in colors" :key="color"
                                :color="color" 
                                dark
                                x-small
                                fab 
                                class="ma-1"
                                @click="form.tx_color = color">
                            </v-btn>
                            </v-card>                        
                        </span>
                    </v-menu>
            </v-input>
        </v-col>
                  
        <v-col cols="12" md="6">
            <v-text-field
                :rules="[rules.max(100)]"
                v-model="form.tx_observaciones"
                label="Observaciones"
                placeholder="Indique Observaciones"
                dense
            ></v-text-field>
        </v-col>
                          
        <v-col cols="12" md="6">
            <v-select
            :items="selects.status"
            item-text="nb_status"
            item-value="id"
            v-model="form.id_status"
            :rules="[rules.select]"
            label="Status"
            :loading="loading"
            dense
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
    data() {
        return {
            resource: 'tipoRecurso',
            form:
            {
                id: 	null,
                nb_tipo_recurso: 	null,
                id_tipo_archivo: null,
				tx_icono: 	null,
				tx_color: 	null,
				tx_observaciones: 	null,
				id_status: 	null,
				id_usuario: 	null,
            },
            selects:
            {
                tipoArchivo: [],
                status: 	 [],
            },
            colors: [
                    'purple',
                    'indigo',
                    'teal',
                    'light-green',
                    'amber',
                    'deep-orange',
                    'blue-grey',
                    'brown',
                    'deep-purple',
                    'pink',
                    'blue',
                    'cyan',
                    'red'
                    ],

            defaultForm: {
                tx_color: 'cyan' 
            }
        }
    },

    methods:
    {

    }
}
</script>

<style>
</style>